Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD0526A0DB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839997; cv=none; b=gcGv4KIsyKW6pPT4BKeh8WnfhSiB8BDAWdwFAhC501wU8IbupuVZCYcUkewA1vNuaayROnwyh49EgFetoYLZO9taSY5YKlLcLXEvrQ/izp/rrCvSVS7pEX6W2txemcfTasZyt5baD5KRJ7NLg1w45XoSNv3wZGLNHuIhD0gGk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839997; c=relaxed/simple;
	bh=uwxC6wzaRtXGlq5OkgRl/B4WTJ+QiH/7MFiGW7Rjsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0qRKnp0Ae6WH+YLq9XHmQaKO32BwsDuUqf9rEVTFfz1UD5zqL2GKDAauBze7nCUqqhOX0QXoeb3VkAso9a7mETMNIUVJmt25qmlkYx7ySHKDUEKHmzTBCE3+IzYgDwMEk0X+H4MctRJpr+TS+al7IjK0dClIYV0GPReCG2tKFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/ynfPMo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/ynfPMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750839994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntxAZIhOeQ85+Fm1QMO9HaVGqW4cWOXkvtu2aYEk1Go=;
	b=M/ynfPMojXWKKCq970buzLsja0TRqqDC9REjrdUXy4jrt9Ldt94MSrhuQAC1/VH1bPAimN
	uS5HoomMtMFe3DmHUz+pc4yvOBy2tnohHJ5wRH/zWb0S+ue6253pDMD7KZU7pWE32FxpNG
	gTy18SAjaoPY4Lgqr9pb4wb0lzxlm9Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-hximBoO6N86Lp1xDDOtW6A-1; Wed, 25 Jun 2025 04:26:32 -0400
X-MC-Unique: hximBoO6N86Lp1xDDOtW6A-1
X-Mimecast-MFC-AGG-ID: hximBoO6N86Lp1xDDOtW6A_1750839991
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso33236195e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839991; x=1751444791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntxAZIhOeQ85+Fm1QMO9HaVGqW4cWOXkvtu2aYEk1Go=;
        b=KXTKTkqx/Zq7+3AXJIFMDg6b19CdDXrxuztQ+TklUdkcGupbzlKmbQpN9XreUKn3uN
         0+btEM8yJXbYF3wzMIEsxi5XLboRbLAYlxDRVzMg0A5DRVxtX3YWnKbEjy1ti4jUmJmq
         /Bwk7KnOUtoqlRXoCuBgzcWAV4G2EXq7r6Cp8pjvYa+90/EeJsHpHqk3g/TJXI06bHUl
         rmd6tg6jWwof53Xz5vRCx+8RhuAABRnT0IOBkZqofp45vjM8StdiwMqU2weK7dV3AQ/r
         HY4ZxR4T+rQhDZ3WBganMWADoBsTrC4JExpt/FMbbFsKkeSbeTV4sB0F7UjY/P6EIcNE
         vqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXI110IMEHIln64k6S2iUnV+8R05r++6RBZGjJ8W+dmlK6qX04U4VzVneqiXM5H1qbXZOlQmbqizYorCKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUG/EF9p3BWweWOQ7n9nLJv3WVLYyhGUZ2Mf3pbEj1LXuPudD
	s8uw3XrGUhesEN7+1RLubr6oyUCLk2AoQA8lN/9NQBV6b0pt2hqccWSuTjz7eGX8L3snGFAUWFZ
	UKM7uxomlaCqfjMGFKPASEXHVICxRUMIzYBbHPYXvVaw7pRCCaf7uOOCUcTLMJzNJrA==
X-Gm-Gg: ASbGncsCLGo3jpFW6iyLmyH+fsdKWID11ztiTHGmnkD/u56k+jIVx9tWsrcLgNArUOK
	3I8JUIca5jv2Lblu4kKXHIQUwAYFOojcuJt4VWuGF7D/xKuH6u5bZRikXm5Z2AjNCH4cVZ8UqIb
	K1VQRx+6UuTNP2cM0LiwD1ryzyEU47jcuNbSHImW8KWbcgykH0MBSVyW7q1iAxqxrz88nOG1Jd2
	2C95BgO5frh2y+Nw4SZhI06om+PLvuOd6ta+a5toDMKQNY2Og3TIV1RAZgyQfr42SlvQGRW6pPG
	ZOYM/Xtaers4YFe0xYsgAtl3HM9c
X-Received: by 2002:a05:6000:40df:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3a6ed6464e2mr1586642f8f.40.1750839991361;
        Wed, 25 Jun 2025 01:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu4pIyAr6BVQlZcvcPefGQNho0kG5su0pi0ecj1SFzUT30OIB09dU6dybGibl24it66ub+1g==
X-Received: by 2002:a05:6000:40df:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3a6ed6464e2mr1586605f8f.40.1750839990644;
        Wed, 25 Jun 2025 01:26:30 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.151.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051677sm3978711f8f.15.2025.06.25.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:26:30 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:26:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Luigi Leonardi <leonardi@redhat.com>
Cc: Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Hyunwoo Kim <v4bel@theori.io>
Subject: Re: [PATCH net-next v4] vsock/test: Add test for null ptr deref when
 transport changes
Message-ID: <u2cvx4da63jzrtbqikbqaud5zjdpduoyrxzxgctvjkznt66k4h@gxr623ahkxxy>
References: <20250624-test_vsock-v4-1-087c9c8e25a2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250624-test_vsock-v4-1-087c9c8e25a2@redhat.com>

On Tue, Jun 24, 2025 at 05:40:15PM +0200, Luigi Leonardi wrote:
>Add a new test to ensure that when the transport changes a null pointer
>dereference does not occur. The bug was reported upstream [1] and fixed
>with commit 2cb7c756f605 ("vsock/virtio: discard packets if the
>transport changes").
>
>KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
>CPU: 2 UID: 0 PID: 463 Comm: kworker/2:3 Not tainted
>Workqueue: vsock-loopback vsock_loopback_work
>RIP: 0010:vsock_stream_has_data+0x44/0x70
>Call Trace:
> virtio_transport_do_close+0x68/0x1a0
> virtio_transport_recv_pkt+0x1045/0x2ae4
> vsock_loopback_work+0x27d/0x3f0
> process_one_work+0x846/0x1420
> worker_thread+0x5b3/0xf80
> kthread+0x35a/0x700
> ret_from_fork+0x2d/0x70
> ret_from_fork_asm+0x1a/0x30
>
>Note that this test may not fail in a kernel without the fix, but it may
>hang on the client side if it triggers a kernel oops.
>
>This works by creating a socket, trying to connect to a server, and then
>executing a second connect operation on the same socket but to a
>different CID (0). This triggers a transport change. If the connect
>operation is interrupted by a signal, this could cause a null-ptr-deref.
>
>Since this bug is non-deterministic, we need to try several times. It
>is reasonable to assume that the bug will show up within the timeout
>period.
>
>If there is a G2H transport loaded in the system, the bug is not
>triggered and this test will always pass.

Can you add the reason?

>
>[1]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/
>
>Suggested-by: Hyunwoo Kim <v4bel@theori.io>
>Suggested-by: Michal Luczaj <mhal@rbox.co>
>Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
>---
>This series introduces a new test that checks for a null pointer
>dereference that may happen when there is a transport change[1]. This
>bug was fixed in [2].
>
>Note that this test *cannot* fail, it hangs if it triggers a kernel
>oops. The intended use-case is to run it and then check if there is any
>oops in the dmesg.
>
>This test is based on Hyunwoo Kim's[3] and Michal's python
>reproducers[4].
>
>[1]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/
>[2]https://lore.kernel.org/netdev/20250110083511.30419-1-sgarzare@redhat.com/
>[3]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/#t
>[4]https://lore.kernel.org/netdev/2b3062e3-bdaa-4c94-a3c0-2930595b9670@rbox.co/
>---
>Changes in v4:
>- Addressed Stefano's comments:
>    - Minor style changes
>    - Use `get_transports()` to print a warning when a G2H transport is
>    loaded
>    - Removed check on second connect: Because the first connect is
>    interrupted, the socket is in an unspecified state (see man connect)
>    . This can cause strange and unexpected behaviors (connect returning
>    success on a non-existing CID).
>
>- Link to v3:
>https://lore.kernel.org/r/20250611-test_vsock-v3-1-8414a2d4df62@redhat.com
>
>Sorry, this took waaay longer than expected.
>
>Changes in v3:
>Addressed Stefano's and Michal's comments:
>    - Added the splat text to the commit commessage.
>    - Introduced commit hash that fixes the bug.
>    - Not using perror anymore on pthread_* functions.
>    - Listener is just created once.
>
>- Link to v2:
>https://lore.kernel.org/r/20250314-test_vsock-v2-1-3c0a1d878a6d@redhat.com
>
>Changes in v2:
>- Addressed Stefano's comments:
>    - Timeout is now using current_nsec()
>    - Check for return values
>    - Style issues
>- Added Hyunwoo Kim to Suggested-by
>- Link to v1:
>https://lore.kernel.org/r/20250306-test_vsock-v1-0-0320b5accf92@redhat.com
>---
> tools/testing/vsock/Makefile     |   1 +
> tools/testing/vsock/vsock_test.c | 178 +++++++++++++++++++++++++++++++++++++++
> 2 files changed, 179 insertions(+)
>
>diff --git a/tools/testing/vsock/Makefile b/tools/testing/vsock/Makefile
>index 6e0b4e95e230500f99bb9c74350701a037ecd198..88211fd132d23ecdfd56ab0815580a237889e7f2 100644
>--- a/tools/testing/vsock/Makefile
>+++ b/tools/testing/vsock/Makefile
>@@ -5,6 +5,7 @@ vsock_test: vsock_test.o vsock_test_zerocopy.o timeout.o control.o util.o msg_ze
> vsock_diag_test: vsock_diag_test.o timeout.o control.o util.o
> vsock_perf: vsock_perf.o msg_zerocopy_common.o
>
>+vsock_test: LDLIBS = -lpthread
> vsock_uring_test: LDLIBS = -luring
> vsock_uring_test: control.o util.o vsock_uring_test.o timeout.o msg_zerocopy_common.o
>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index eb6f54378667ac7ed324f4823e988ec9846e41a3..095705c7b53b7ad38ab3b8bc3cbe54a9eeb76d5c 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -22,6 +22,8 @@
> #include <signal.h>
> #include <sys/ioctl.h>
> #include <linux/time64.h>
>+#include <pthread.h>
>+#include <fcntl.h>
>
> #include "vsock_test_zerocopy.h"
> #include "timeout.h"
>@@ -1867,6 +1869,177 @@ static void test_stream_connect_retry_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>+#define TRANSPORT_CHANGE_TIMEOUT 2 /* seconds */
>+
>+static void *test_stream_transport_change_thread(void *vargp)
>+{
>+	pid_t *pid = (pid_t *)vargp;
>+	int ret;
>+
>+	/* We want this thread to terminate as soon as possible */
>+	ret = pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
>+	if (ret) {
>+		fprintf(stderr, "pthread_setcanceltype: %d\n", ret);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	while (true) {
>+		if (kill(*pid, SIGUSR1) < 0) {
>+			perror("kill");
>+			exit(EXIT_FAILURE);
>+		}
>+	}
>+	return NULL;
>+}
>+
>+static void test_transport_change_signal_handler(int signal)
>+{
>+	/* We need a custom handler for SIGUSR1 as the default one terminates the process. */
>+}
>+
>+static void test_stream_transport_change_client(const struct test_opts *opts)
>+{
>+	__sighandler_t old_handler;
>+	pid_t pid = getpid();
>+	pthread_t thread_id;
>+	time_t tout;
>+	int ret, tr;
>+
>+	tr = get_transports();

nit: add a blank line here

>+	/* Print a warning if there is a G2H transport loaded.
>+	 * This is on a best effort basis because VMCI can be either G2H and H2G, and there is
>+	 * no easy way to understand it.
>+	 * The bug is present in the loopback transport. However, it does not interfere

nit: s/is/was

>+	 * if it is loaded.

I don't understand this, if the bug was present in the loopback transport, our goal is to stress it, so have it loaded is great, why it should interfere?

>+	 * The bug we are testing only appears when G2H transports are not loaded.

Please add the reason also here.

>+	 */
>+

nit: remove the blank line here

>+	tr &= ~TRANSPORT_LOOPBACK;
>+	if (tr != 0 && tr != TRANSPORT_VHOST)

Sorry, this is really hard to understand IMO, let's do a step back.
Your goal is to check if there is a G2H transport loaded, right?

I think we have 2 options:
1. similar to your, just masking the other 2 transports

	if (tr & ~(TRANSPORT_LOOPBACK | TRANSPORT_VHOST))

    IMO this is much clear to understand, and should have the same effect.

2. (my preference) define in util.h some macros that we can reuse:
	#define TRANSPORTS_G2H   (TRANSPORT_VIRTIO | TRANSPORT_VMCI | TRANSPORT_HYPERV)
	#define TRANSPORTS_H2G   (TRANSPORT_VHOST | TRANSPORT_VMCI)
	#define TRANSPORTS_LOCAL (TRANSPORT_LOOPBACK)

     and here you can just do:
	if (tr & TRANSPORTS_G2H)

>+		fprintf(stderr, "G2H Transport detected. This test will not fail.\n");
>+
>+	old_handler = signal(SIGUSR1, test_transport_change_signal_handler);
>+	if (old_handler == SIG_ERR) {
>+		perror("signal");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	ret = pthread_create(&thread_id, NULL, test_stream_transport_change_thread, &pid);
>+	if (ret) {
>+		fprintf(stderr, "pthread_create: %d\n", ret);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_expectln("LISTENING");
>+
>+	tout = current_nsec() + TRANSPORT_CHANGE_TIMEOUT * NSEC_PER_SEC;
>+	do {
>+		struct sockaddr_vm sa = {
>+			.svm_family = AF_VSOCK,
>+			.svm_cid = opts->peer_cid,
>+			.svm_port = opts->peer_port,
>+		};
>+		int s;
>+
>+		s = socket(AF_VSOCK, SOCK_STREAM, 0);
>+		if (s < 0) {
>+			perror("socket");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		ret = connect(s, (struct sockaddr *)&sa, sizeof(sa));
>+		/* The connect can fail due to signals coming from the thread.

. should be ,

>+		 * or because the receiver connection queue is full.
>+		 * Ignoring also the latter case because there is no way
>+		 * of synchronizing client's connect and server's accept 
>when
>+		 * connect(s) are constantly being interrupted by signals.
>+		 */
>+		if (ret == -1 && (errno != EINTR && errno != ECONNRESET)) {
>+			perror("connect");
>+			exit(EXIT_FAILURE);
>+		}
>+
>+		/* Set CID to 0 cause a transport change. */
>+		sa.svm_cid = 0;

nit: add a blank line

>+		/* Here we ignore the connect return value because we cannot
>+		 * safely assume that it will *always* fail.
>+		 * This is because the previous connect was interrupted
>+		 * during the connection process. The socket state, as stated
>+		 * in `man connect`, is unspecified and can result in strange
>+		 * behaviors.

Let's focus on the behaviour and try to be more concise. Something like
this:

		/* Ignore return value since it can fail or not.
		 * If the previous connect is interrupted while the
		 * connection request is already sent, the second
		 * connect() will wait for the response.

>+		 */
>+		connect(s, (struct sockaddr *)&sa, sizeof(sa));
>+
>+		close(s);
>+
>+		control_writeulong(CONTROL_CONTINUE);
>+
>+	} while (current_nsec() < tout);
>+
>+	control_writeulong(CONTROL_DONE);
>+
>+	ret = pthread_cancel(thread_id);
>+	if (ret) {
>+		fprintf(stderr, "pthread_cancel: %d\n", ret);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	/* Wait for the thread to terminate */

useless comment

>+	ret = pthread_join(thread_id, NULL);
>+	if (ret) {
>+		fprintf(stderr, "pthread_join: %d\n", ret);
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	/* Restore the old handler */

ditto

>+	if (signal(SIGUSR1, old_handler) == SIG_ERR) {
>+		perror("signal");
>+		exit(EXIT_FAILURE);
>+	}
>+}
>+
>+static void test_stream_transport_change_server(const struct test_opts *opts)
>+{
>+	int s = vsock_stream_listen(VMADDR_CID_ANY, opts->peer_port);
>+
>+	/* Set the socket to be nonblocking because connects that have been interrupted
>+	 * (EINTR) can fill the receiver's accept queue anyway, leading to connect failure.
>+	 * As of today (6.15) in such situation there is no way to understand, from the
>+	 * client side, if the connection has been queued in the server or not.
>+	 */
>+	if (fcntl(s, F_SETFL, fcntl(s, F_GETFL, 0) | O_NONBLOCK) < 0) {
>+		perror("fcntl");
>+		exit(EXIT_FAILURE);
>+	}
>+	control_writeln("LISTENING");
>+
>+	while (control_readulong() == CONTROL_CONTINUE) {
>+		struct sockaddr_vm sa_client;
>+		socklen_t socklen_client = sizeof(sa_client);
>+
>+		/* Must accept the connection, otherwise the `listen`
>+		 * queue will fill up and new connections will fail.
>+		 * There can be more than one queued connection,
>+		 * clear them all.
>+		 */
>+		while (true) {
>+			int client = accept(s, (struct sockaddr *)&sa_client, &socklen_client);

We don't use the client address, so IMO we can just pass NULL.

Thanks,
Stefano

>+
>+			if (client < 0) {
>+				if (errno == EAGAIN)
>+					break;
>+
>+				perror("accept");
>+				exit(EXIT_FAILURE);
>+			}
>+
>+			close(client);
>+		}
>+	}
>+
>+	close(s);
>+}
>+
> static void test_stream_linger_client(const struct test_opts *opts)
> {
> 	int fd;
>@@ -2106,6 +2279,11 @@ static struct test_case test_cases[] = {
> 		.run_client = test_stream_nolinger_client,
> 		.run_server = test_stream_nolinger_server,
> 	},
>+	{
>+		.name = "SOCK_STREAM transport change null-ptr-deref",
>+		.run_client = test_stream_transport_change_client,
>+		.run_server = test_stream_transport_change_server,
>+	},
> 	{},
> };
>
>
>---
>base-commit: 68d019aa14d97f8d57b0f8d203fd3b44db2ba0c7
>change-id: 20250306-test_vsock-3e77a9c7a245
>
>Best regards,
>-- 
>Luigi Leonardi <leonardi@redhat.com>
>

