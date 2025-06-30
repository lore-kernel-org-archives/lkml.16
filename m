Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6F2949F6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301198; cv=none; b=Rty6F8rAauFO8hEs9mIPwIv8uCse2XtfDzBSXC0WLyb7ghbnW326xFZvsvv/zjGJ9Mm9+wqZJLUPMBocmaXuTGIMeyc+W/6ueQfyJyUBSNDCDzE33Agb32UwhUvltD6mN2vc9UNZ7btrrhAFxZQsFj3BVFH+mogv63GK6baEOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301198; c=relaxed/simple;
	bh=55nBQP4aQogOiNPUuY3xmiEkkmF8mXTJvQsg6cuG+mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doMo2gXTIXtJ22E2CX+Yg8VV7n6tVxqGfDOvz1CCbps9uoVvPWshoGgbAHCmp75zzPclM82NEBFVKjxkVVa6TxYuDPEkp7C9TJadHg97s2J/6/qGKiqf11klLseeaG2vBNM6+v76eySyUDvFqU287MEkkaqORU9Q7Yc4zGDl6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HbWgG891; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HbWgG891"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751301195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp6vU3a/maHYin/wHunAio05ZqjI5MWCleh0lULp+Ic=;
	b=HbWgG8911IA1DW5P2b7K0gWr2GJRRqjlyjMBbexIShx5Woq2mZH/nBSSNqnA6pWVp2xBJH
	C4pHiDDjnz78k0JtFHQo5zts4Km1CtEeux/PZvlx68T65WnXnJj+0Gq3sMckDf+3I9grFb
	jEQHwKWSy+1cn+tuUrB6NotfNFo41bg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-dgDOics1Phia7YeAV7EsAA-1; Mon, 30 Jun 2025 12:33:13 -0400
X-MC-Unique: dgDOics1Phia7YeAV7EsAA-1
X-Mimecast-MFC-AGG-ID: dgDOics1Phia7YeAV7EsAA_1751301193
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d64026baso24123575e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301193; x=1751905993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jp6vU3a/maHYin/wHunAio05ZqjI5MWCleh0lULp+Ic=;
        b=XtdpbPye+UsxFd66g7NkaCvbBIWZjwir1vZhgtNdt2S4Shx386oZhbFQFKXmnXbGko
         85GmjR6aJbZsvQfOvQ5ZVhhW6XaRUpTJnqpQbpMUrLriiQNrCK+wRHMGEG/fJQCmEOde
         sNFx6HYbZNU5K/J5eMSlXTRLxwE3lNjbEvHjTewt43P9JVLAUQ8bmx6dpbU5v/Ec33qe
         NYFsW84SwI1j4URhajxoKq0qBbqDKCTMLZmC9h8pmU7dRX8LPgCmvEqunU5dUWZJKgdn
         764/vXn2l27Q87MmJtkX6EMEPoiM0v5umJqUzd0Nz2bFi7DXJI6HAS7aQ0uGQ3r3nw4K
         96lA==
X-Forwarded-Encrypted: i=1; AJvYcCV0gz+GJruh+X/834vI/h1sV8YaTd/e+dP4PBU2Nvz46MfLqIAgnwBt6uL+3j2vuasvjZll3umHDIK5maY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xSXHzNLZl8TdoMwfXcBy7pQQTL5ZHE3EuG7qu5FnzlLi7yFe
	qPZsBgET0rZSNij7wNGtGbie+GxHNCZ+IK0/BOJu37KZy5zDSDSSe2bksELY05kEmZ02VEs260f
	VQVe/HnHfkNsKnnODlGv5OSPVMrwAXFwbBEwfhytpaBK5XINRbrgEh7RzgKjedcja+A==
X-Gm-Gg: ASbGnct/IWH1MPAoHwchXtYojsiLojgwGG9Tnf+cZWK8kW/xso0sv5/pi/yE4dza4SU
	nzUXBgVguVTgQN9PgyDRA6kIAIx43uwRDG9XFMi30HVVqQTCOhkyq/zJCkwxc7ZzWskI6VKn4JX
	I/lyFkBAaxAjO9TxAw3W62FfahlPtByJ10k+Uo0Fzj1opbMWBwTNpRhvB0QX95EWx/4WD3/nfrB
	Gm9HNueS/SGXI+zyCQnF4vhdnfM/gBWzhHbVIFJP0h2gfrbcvaYV+cdIUnQSLMM93F5nKgXrchh
	3X2iHUodCiQKQON1ksP6POQlzqJ7ZWnvBQSxyCy435HGJn/Sv3L23Q==
X-Received: by 2002:a05:600c:1c87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4538ee59148mr145794865e9.12.1751301192507;
        Mon, 30 Jun 2025 09:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESUYnLV9mLJES+dnzLMWgW+EAj5nFEgfcZV4b9wyuk6B2naT7aQ30uKx8PgEkOAfEg+Z1Jlw==
X-Received: by 2002:a05:600c:1c87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4538ee59148mr145794525e9.12.1751301191977;
        Mon, 30 Jun 2025 09:33:11 -0700 (PDT)
Received: from lleonard-thinkpadp16vgen1.rmtit.csb ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm142554375e9.30.2025.06.30.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:33:11 -0700 (PDT)
From: Luigi Leonardi <leonardi@redhat.com>
Date: Mon, 30 Jun 2025 18:33:04 +0200
Subject: [PATCH net-next v5 2/2] vsock/test: Add test for null ptr deref
 when transport changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-test_vsock-v5-2-2492e141e80b@redhat.com>
References: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
In-Reply-To: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luigi Leonardi <leonardi@redhat.com>, 
 Hyunwoo Kim <v4bel@theori.io>
X-Mailer: b4 0.14.2

Add a new test to ensure that when the transport changes a null pointer
dereference does not occur. The bug was reported upstream [1] and fixed
with commit 2cb7c756f605 ("vsock/virtio: discard packets if the
transport changes").

KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
CPU: 2 UID: 0 PID: 463 Comm: kworker/2:3 Not tainted
Workqueue: vsock-loopback vsock_loopback_work
RIP: 0010:vsock_stream_has_data+0x44/0x70
Call Trace:
 virtio_transport_do_close+0x68/0x1a0
 virtio_transport_recv_pkt+0x1045/0x2ae4
 vsock_loopback_work+0x27d/0x3f0
 process_one_work+0x846/0x1420
 worker_thread+0x5b3/0xf80
 kthread+0x35a/0x700
 ret_from_fork+0x2d/0x70
 ret_from_fork_asm+0x1a/0x30

Note that this test may not fail in a kernel without the fix, but it may
hang on the client side if it triggers a kernel oops.

This works by creating a socket, trying to connect to a server, and then
executing a second connect operation on the same socket but to a
different CID (0). This triggers a transport change. If the connect
operation is interrupted by a signal, this could cause a null-ptr-deref.

Since this bug is non-deterministic, we need to try several times. It
is reasonable to assume that the bug will show up within the timeout
period.

If there is a G2H transport loaded in the system, the bug is not
triggered and this test will always pass. This is because
`vsock_assign_transport`, when using CID 0, like in this case, sets
vsk->transport to `transport_g2h` that is not NULL if a G2H transport is
available.

[1]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/

Suggested-by: Hyunwoo Kim <v4bel@theori.io>
Suggested-by: Michal Luczaj <mhal@rbox.co>
Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
---
 tools/testing/vsock/Makefile     |   1 +
 tools/testing/vsock/vsock_test.c | 170 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
index 6e0b4e95e230500f99bb9c74350701a037ecd198..88211fd132d23ecdfd56ab0815580a237889e7f2 100644
--- a/tools/testing/vsock/Makefile
+++ b/tools/testing/vsock/Makefile
@@ -5,6 +5,7 @@ vsock_test: vsock_test.o vsock_test_zerocopy.o timeout.o control.o util.o msg_ze
 vsock_diag_test: vsock_diag_test.o timeout.o control.o util.o
 vsock_perf: vsock_perf.o msg_zerocopy_common.o
 
+vsock_test: LDLIBS = -lpthread
 vsock_uring_test: LDLIBS = -luring
 vsock_uring_test: control.o util.o vsock_uring_test.o timeout.o msg_zerocopy_common.o
 
diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index eb6f54378667ac7ed324f4823e988ec9846e41a3..be6ce764f69480c0f9c3e2288fc19cd2e74be148 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -22,6 +22,8 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 #include <linux/time64.h>
+#include <pthread.h>
+#include <fcntl.h>
 
 #include "vsock_test_zerocopy.h"
 #include "timeout.h"
@@ -1867,6 +1869,169 @@ static void test_stream_connect_retry_server(const struct test_opts *opts)
 	close(fd);
 }
 
+#define TRANSPORT_CHANGE_TIMEOUT 2 /* seconds */
+
+static void *test_stream_transport_change_thread(void *vargp)
+{
+	pid_t *pid = (pid_t *)vargp;
+	int ret;
+
+	ret = pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+	if (ret) {
+		fprintf(stderr, "pthread_setcanceltype: %d\n", ret);
+		exit(EXIT_FAILURE);
+	}
+
+	while (true) {
+		if (kill(*pid, SIGUSR1) < 0) {
+			perror("kill");
+			exit(EXIT_FAILURE);
+		}
+	}
+	return NULL;
+}
+
+static void test_transport_change_signal_handler(int signal)
+{
+	/* We need a custom handler for SIGUSR1 as the default one terminates the process. */
+}
+
+static void test_stream_transport_change_client(const struct test_opts *opts)
+{
+	__sighandler_t old_handler;
+	pid_t pid = getpid();
+	pthread_t thread_id;
+	time_t tout;
+	int ret, tr;
+
+	tr = get_transports();
+
+	/* Print a warning if there is a G2H transport loaded.
+	 * This is on a best effort basis because VMCI can be either G2H and H2G, and there is
+	 * no easy way to understand it.
+	 * The bug we are testing only appears when G2H transports are not loaded.
+	 * This is because `vsock_assign_transport`, when using CID 0, assigns a G2H transport
+	 * to vsk->transport. If none is available it is set to NULL, causing the null-ptr-deref.
+	 */
+	if (tr & TRANSPORTS_G2H)
+		fprintf(stderr, "G2H Transport detected. This test will not fail.\n");
+
+	old_handler = signal(SIGUSR1, test_transport_change_signal_handler);
+	if (old_handler == SIG_ERR) {
+		perror("signal");
+		exit(EXIT_FAILURE);
+	}
+
+	ret = pthread_create(&thread_id, NULL, test_stream_transport_change_thread, &pid);
+	if (ret) {
+		fprintf(stderr, "pthread_create: %d\n", ret);
+		exit(EXIT_FAILURE);
+	}
+
+	control_expectln("LISTENING");
+
+	tout = current_nsec() + TRANSPORT_CHANGE_TIMEOUT * NSEC_PER_SEC;
+	do {
+		struct sockaddr_vm sa = {
+			.svm_family = AF_VSOCK,
+			.svm_cid = opts->peer_cid,
+			.svm_port = opts->peer_port,
+		};
+		int s;
+
+		s = socket(AF_VSOCK, SOCK_STREAM, 0);
+		if (s < 0) {
+			perror("socket");
+			exit(EXIT_FAILURE);
+		}
+
+		ret = connect(s, (struct sockaddr *)&sa, sizeof(sa));
+		/* The connect can fail due to signals coming from the thread,
+		 * or because the receiver connection queue is full.
+		 * Ignoring also the latter case because there is no way
+		 * of synchronizing client's connect and server's accept when
+		 * connect(s) are constantly being interrupted by signals.
+		 */
+		if (ret == -1 && (errno != EINTR && errno != ECONNRESET)) {
+			perror("connect");
+			exit(EXIT_FAILURE);
+		}
+
+		/* Set CID to 0 cause a transport change. */
+		sa.svm_cid = 0;
+
+		/* Ignore return value since it can fail or not.
+		 * If the previous connect is interrupted while the
+		 * connection request is already sent, the second
+		 * connect() will wait for the response.
+		 */
+		connect(s, (struct sockaddr *)&sa, sizeof(sa));
+
+		close(s);
+
+		control_writeulong(CONTROL_CONTINUE);
+
+	} while (current_nsec() < tout);
+
+	control_writeulong(CONTROL_DONE);
+
+	ret = pthread_cancel(thread_id);
+	if (ret) {
+		fprintf(stderr, "pthread_cancel: %d\n", ret);
+		exit(EXIT_FAILURE);
+	}
+
+	ret = pthread_join(thread_id, NULL);
+	if (ret) {
+		fprintf(stderr, "pthread_join: %d\n", ret);
+		exit(EXIT_FAILURE);
+	}
+
+	if (signal(SIGUSR1, old_handler) == SIG_ERR) {
+		perror("signal");
+		exit(EXIT_FAILURE);
+	}
+}
+
+static void test_stream_transport_change_server(const struct test_opts *opts)
+{
+	int s = vsock_stream_listen(VMADDR_CID_ANY, opts->peer_port);
+
+	/* Set the socket to be nonblocking because connects that have been interrupted
+	 * (EINTR) can fill the receiver's accept queue anyway, leading to connect failure.
+	 * As of today (6.15) in such situation there is no way to understand, from the
+	 * client side, if the connection has been queued in the server or not.
+	 */
+	if (fcntl(s, F_SETFL, fcntl(s, F_GETFL, 0) | O_NONBLOCK) < 0) {
+		perror("fcntl");
+		exit(EXIT_FAILURE);
+	}
+	control_writeln("LISTENING");
+
+	while (control_readulong() == CONTROL_CONTINUE) {
+		/* Must accept the connection, otherwise the `listen`
+		 * queue will fill up and new connections will fail.
+		 * There can be more than one queued connection,
+		 * clear them all.
+		 */
+		while (true) {
+			int client = accept(s, NULL, NULL);
+
+			if (client < 0) {
+				if (errno == EAGAIN)
+					break;
+
+				perror("accept");
+				exit(EXIT_FAILURE);
+			}
+
+			close(client);
+		}
+	}
+
+	close(s);
+}
+
 static void test_stream_linger_client(const struct test_opts *opts)
 {
 	int fd;
@@ -2106,6 +2271,11 @@ static struct test_case test_cases[] = {
 		.run_client = test_stream_nolinger_client,
 		.run_server = test_stream_nolinger_server,
 	},
+	{
+		.name = "SOCK_STREAM transport change null-ptr-deref",
+		.run_client = test_stream_transport_change_client,
+		.run_server = test_stream_transport_change_server,
+	},
 	{},
 };
 

-- 
2.50.0

