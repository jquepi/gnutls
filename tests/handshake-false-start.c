/*
 * Copyright (C) 2016 Red Hat, Inc.
 *
 * Author: Nikos Mavrogiannopoulos
 *
 * This file is part of GnuTLS.
 *
 * GnuTLS is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * GnuTLS is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GnuTLS; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <gnutls/gnutls.h>
#include "utils.h"
#include "eagain-common.h"
#include "cert-common.h"

const char *side;

static void tls_log_func(int level, const char *str)
{
	fprintf(stderr, "%s|<%d>| %s", side, level, str);
}

#define TESTDATA "xxxtesttest1234"

/* counts the number of calls of send_testdata() within a handshake */
static int counter = 0;

static int send_testdata(gnutls_session_t session)
{

	if (counter == 0) {
		counter++;
		return gnutls_record_send(session, TESTDATA, sizeof(TESTDATA)-1);
	} else {
		fail("send_testdata was called more than once!\n");
		return GNUTLS_E_INVALID_REQUEST;
	}
}

static void try(unsigned fs, const char *prio, unsigned dhsize)
{
	int ret;
	/* Server stuff. */
	gnutls_certificate_credentials_t serverx509cred;
	gnutls_anon_client_credentials_t clientanoncred;
	gnutls_anon_server_credentials_t serveranoncred;
	gnutls_session_t server;
	int sret = GNUTLS_E_AGAIN;
	char buffer[512];
	/* Client stuff. */
	gnutls_certificate_credentials_t clientx509cred;
	gnutls_session_t client;
	int cret = GNUTLS_E_AGAIN;
	const gnutls_datum_t p3_2048 = { (void *) pkcs3_2048, strlen(pkcs3_2048) };
	const gnutls_datum_t p3_3072 = { (void *) pkcs3_3072, strlen(pkcs3_3072) };
	gnutls_dh_params_t dh_params;

	/* General init. */
	gnutls_global_set_log_function(tls_log_func);
	if (debug)
		gnutls_global_set_log_level(6);


	gnutls_dh_params_init(&dh_params);

	if (dhsize < 3072) {
		ret = gnutls_dh_params_import_pkcs3(dh_params, &p3_2048,
						     GNUTLS_X509_FMT_PEM);
	} else {
		ret = gnutls_dh_params_import_pkcs3(dh_params, &p3_3072,
						     GNUTLS_X509_FMT_PEM);
	}

	/* Init server */
	gnutls_anon_allocate_server_credentials(&serveranoncred);
	gnutls_anon_set_server_dh_params(serveranoncred, dh_params);


	gnutls_certificate_allocate_credentials(&serverx509cred);
	gnutls_certificate_set_x509_key_mem(serverx509cred,
					    &server_cert, &server_key,
					    GNUTLS_X509_FMT_PEM);
	gnutls_certificate_set_x509_key_mem(serverx509cred,
					    &server_ecc_cert, &server_ecc_key,
					    GNUTLS_X509_FMT_PEM);
	gnutls_certificate_set_dh_params(serverx509cred, dh_params);

	gnutls_init(&server, GNUTLS_SERVER);
	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE,
			       serverx509cred);

	gnutls_credentials_set(server, GNUTLS_CRD_ANON,
			       serveranoncred);

	gnutls_priority_set_direct(server,
				   prio,
				   NULL);
	gnutls_transport_set_push_function(server, server_push);
	gnutls_transport_set_pull_function(server, server_pull);
	gnutls_transport_set_ptr(server, server);

	/* Init client */

	gnutls_anon_allocate_client_credentials(&clientanoncred);
	ret = gnutls_certificate_allocate_credentials(&clientx509cred);
	if (ret < 0)
		exit(1);

	ret = gnutls_certificate_set_x509_trust_mem(clientx509cred, &ca_cert, GNUTLS_X509_FMT_PEM);
	if (ret < 0)
		exit(1);

	ret = gnutls_init(&client, GNUTLS_CLIENT);
	if (ret < 0)
		exit(1);

	ret = gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE,
			       clientx509cred);
	if (ret < 0)
		exit(1);

	ret = gnutls_credentials_set(client, GNUTLS_CRD_ANON,
			       clientanoncred);
	if (ret < 0)
		exit(1);

	ret = gnutls_priority_set_direct(client, prio, NULL);
	if (ret < 0)
		exit(1);

	gnutls_transport_set_push_function(client, client_push);
	gnutls_transport_set_pull_function(client, client_pull);
	gnutls_transport_set_ptr(client, client);

	ret = gnutls_handshake_set_false_start_function(server, send_testdata, 0);
	if (ret != GNUTLS_E_INVALID_REQUEST) {
		fail("gnutls_handshake_set_appdata: unexpected error code (%d) for server!\n", ret);
	}

	ret = gnutls_handshake_set_false_start_function(client, send_testdata, 0);
	if (ret != 0) {
		fail("gnutls_handshake_set_appdata: unexpected error code (%d) for client!\n", ret);
	}

	HANDSHAKE(client, server);

	/* verify whether the server received the expected data */
	ret = gnutls_record_recv(server, buffer, sizeof(buffer));
	if (ret < 0) {
		fail("error receiving data: %s\n", gnutls_strerror(ret));
	}

	if (ret != sizeof(TESTDATA)-1) {
		fail("error in received data size\n");
	}

	if (memcmp(buffer, TESTDATA, ret) != 0) {
		fail("error in received data\n");
	}

	if ((gnutls_session_get_flags(client) & GNUTLS_SFLAGS_FALSE_START) && !fs) {
		fail("false start occurred but not expected\n");
	}

	if (!(gnutls_session_get_flags(client) & GNUTLS_SFLAGS_FALSE_START) && fs) {
		fail("false start expected but not happened\n");
	}

	ret = gnutls_bye(server, GNUTLS_SHUT_WR);
	if (ret < 0) {
		fail("error in server bye: %s\n", gnutls_strerror(ret));
	}

	ret = gnutls_bye(client, GNUTLS_SHUT_RDWR);
	if (ret < 0) {
		fail("error in client bye: %s\n", gnutls_strerror(ret));
	}

	gnutls_deinit(client);
	gnutls_deinit(server);

	gnutls_dh_params_deinit(dh_params);
	gnutls_anon_free_server_credentials(serveranoncred);
	gnutls_anon_free_client_credentials(clientanoncred);
	gnutls_certificate_free_credentials(serverx509cred);
	gnutls_certificate_free_credentials(clientx509cred);
}

void doit(void)
{
	global_init();

	try(0, "NORMAL:-KX-ALL:+ANON-DH", 3072);
	reset_buffers();
	counter = 0;
	try(0, "NORMAL:-KX-ALL:+ANON-ECDH", 2048);
	reset_buffers();
	counter = 0;
	try(1, "NORMAL:-KX-ALL:+ECDHE-RSA", 2048);
	reset_buffers();
	counter = 0;
	try(1, "NORMAL:-KX-ALL:+ECDHE-ECDSA", 2048);
	reset_buffers();
	counter = 0;
	try(0, "NORMAL:-KX-ALL:+DHE-RSA", 2048);
	reset_buffers();
	counter = 0;
	try(1, "NORMAL:-KX-ALL:+DHE-RSA", 3072);
	reset_buffers();
	counter = 0;
	gnutls_global_deinit();
}