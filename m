Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02419F419
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083830; cv=none; b=mTnerurAuENd58BJA41T9smRgkwYDINSNgSkROSazSbumqd2XJdY4+o3dJiWcvNxNYoSN2Hs/HAnB4F6w+v42t9TQ8yNkfjDgA6OPcNWsFvpWodT8Qug152EnM3Gz/JZlagcncJUVwpxzm98RZadpF0ey2Zif9OMHIGIKv/4Tf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083830; c=relaxed/simple;
	bh=v8tipBw1Rg8uUUI8WgiokNzRTX+JlMQF/S8IRZIRHs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGerkrtqIlBXTN3sIqug0OOYdgAXiDqTwj3WCXd77Hlv3jRadCI1N1cvubd3FU9uhizBtXsmefdFA1zUQl72o+hdpPadI2TIByGBx5CvH58nd88q2+nYFbyeJfAqgvRa64FYQsd4l76ZBn3oylbFMUYdf3kLy1mviltSo7hzSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DANrcQj7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DANrcQj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750083827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+2gsbjGMfxgj+GtSEJhJLLfivzU+vrOQd2XrrPgUqI=;
	b=DANrcQj7cPIkIJw0VOCj2o5UbdZ16JaSYlWqw3ejrcbIbeTCx8+ulthYjwglZrqOmswORW
	g711h5gGUQYJP9YeFpP2w0Xw6gZUdaZmSno3cTCmXuXuL1Y6gGEXWiCMFTmhUyvULBDzPG
	Q4Hnt1T7Km+/HecIDVCTCZHoiasgO0c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-cJ_9zyn4Nf2KUMOGxGcvsQ-1; Mon, 16 Jun 2025 10:23:45 -0400
X-MC-Unique: cJ_9zyn4Nf2KUMOGxGcvsQ-1
X-Mimecast-MFC-AGG-ID: cJ_9zyn4Nf2KUMOGxGcvsQ_1750083824
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d290d542so28433125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083824; x=1750688624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+2gsbjGMfxgj+GtSEJhJLLfivzU+vrOQd2XrrPgUqI=;
        b=nVKpViDROq0YhINFE2eqJNh1zVWW56J27ylcsnhNZDgJPQKfdQkMr6hJmv8EuwUPrc
         0bCD9lhl10SbGm8jLlkFMV3x2zhT4HCThZ9bqNiCgN5fIXYffj0fgoR5rmfHj49KjVOC
         Y9wqgXTREKi9fqO4rFxCQCFa/yNRTdl+fbPtJ1n0auB3N/I3deN/XP1t+dDosM+r7Wsh
         4o/eFHTdHQxT1RwpUdEWlMX34kKscyoJfOmxgDNr94m7xr5pqHhVbHRqs6qKLKfxZhq6
         ZEOOetd/YNpiFhNranbriMfNK15wVHLwdPG4Eac5gAsE+pn2vznWkF1Q9glr1waC1TUI
         70hg==
X-Forwarded-Encrypted: i=1; AJvYcCU+CDghQ1wvHqEfjK9P40ueLmp36S0dN4pTYePlplzUy9pvaIm23AnuT+cMzzCNt6Ke6XbIrpfeZdibqjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsQIYvq8OxtSuLCWPRR1yw4mUvBWEuqOaF7ho2yuDvdl6Zcka
	r/tujaAaTXJO+hDi+FgweXgzQuYe7sgqWgdAZQd1e4sTsIL/qEo5+HlK/+HAA8vXLX/r6rZ7gLw
	/LRuoX4UXhf0LuFeKcikLVjSodszhlmi5mxGCWywpZwMIbGdD43tzePC9Fp0BL95etA==
X-Gm-Gg: ASbGncueUtoBBXyNK7DakWJcRqdbXbzTWBBo63XdZNYdEE5KuMKseL4fFBkPpd959Fb
	HkVSajD/WSxqVAWKV+HuG3dCSfzHXoJwB3NxBsjpLeVtfei3u95wURf98SkKVyP2BGa8whtZXbk
	LH5ORGDIeVQ2sdwH/ZPhBaOOPtTe8yvCS4KT9E/2TwncePbawnPu3wz2y5Kx9N5n7chPabEqhXV
	noauL80TzVGQSkw+8d51QYQs89AXjSRuQvhOrhVLzab4KpgTpj5c9au0pAcJWGWnF967mrjrjQS
	6OcQp/fLfov7tVGzsMgZckbv/Ho=
X-Received: by 2002:a05:600c:8b21:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-4533ca4291fmr82823345e9.5.1750083824364;
        Mon, 16 Jun 2025 07:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1RMolTO9eDEe9qR38ZhX3HK9hH9v80M70WdDnGgFJKvA6JD25WeKSon+jf5NTkGxpDWO43A==
X-Received: by 2002:a05:600c:8b21:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-4533ca4291fmr82823115e9.5.1750083823852;
        Mon, 16 Jun 2025 07:23:43 -0700 (PDT)
Received: from leonardi-redhat ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm145671275e9.35.2025.06.16.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:23:43 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:23:40 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Hyunwoo Kim <v4bel@theori.io>
Subject: Re: [PATCH net-next v3] vsock/test: Add test for null ptr deref when
 transport changes
Message-ID: <pjwrj4pnl3jheypjbkcopjv7uilcdiog3pxb3m57zyeq47sc22@7sl6otxuims2>
References: <20250611-test_vsock-v3-1-8414a2d4df62@redhat.com>
 <zpc6pbabs5m5snrsfubtl3wp4eb64w4qwqosywp7tsmrfnba3j@ybkgg2cnhqec>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <zpc6pbabs5m5snrsfubtl3wp4eb64w4qwqosywp7tsmrfnba3j@ybkgg2cnhqec>

Hi Stefano,

On Wed, Jun 11, 2025 at 04:53:11PM +0200, Stefano Garzarella wrote:
>On Wed, Jun 11, 2025 at 04:07:25PM +0200, Luigi Leonardi wrote:
>>Add a new test to ensure that when the transport changes a null pointer
>>dereference does not occur. The bug was reported upstream [1] and fixed
>>with commit 2cb7c756f605 ("vsock/virtio: discard packets if the
>>transport changes").
>>
>>KASAN: null-ptr-deref in range [0x0000000000000060-0x0000000000000067]
>>CPU: 2 UID: 0 PID: 463 Comm: kworker/2:3 Not tainted
>>Workqueue: vsock-loopback vsock_loopback_work
>>RIP: 0010:vsock_stream_has_data+0x44/0x70
>>Call Trace:
>>virtio_transport_do_close+0x68/0x1a0
>>virtio_transport_recv_pkt+0x1045/0x2ae4
>>vsock_loopback_work+0x27d/0x3f0
>>process_one_work+0x846/0x1420
>>worker_thread+0x5b3/0xf80
>>kthread+0x35a/0x700
>>ret_from_fork+0x2d/0x70
>>ret_from_fork_asm+0x1a/0x30
>>
>>Note that this test may not fail in a kernel without the fix, but it may
>>hang on the client side if it triggers a kernel oops.
>>
>>This works by creating a socket, trying to connect to a server, and then
>>executing a second connect operation on the same socket but to a
>>different CID (0). This triggers a transport change. If the connect
>>operation is interrupted by a signal, this could cause a null-ptr-deref.
>>
>>Since this bug is non-deterministic, we need to try several times. It
>>is reasonable to assume that the bug will show up within the timeout
>>period.
>>
>>If there is a G2H transport loaded in the system, the bug is not
>>triggered and this test will always pass.
>
>Should we re-use what Michal is doing in https://lore.kernel.org/virtualization/20250528-vsock-test-inc-cov-v2-0-8f655b40d57c@rbox.co/
>to print a warning?

Yes, good idea! IMHO we can skip the test if a G2H transport is loaded.  
I'll wait for Michal's patch to be merged before sending v4.
>
>>
>>[1]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/
>>
>>Suggested-by: Hyunwoo Kim <v4bel@theori.io>
>>
>>#include "vsock_test_zerocopy.h"
>>#include "timeout.h"
>>@@ -1811,6 +1813,168 @@ static void test_stream_connect_retry_server(const struct test_opts *opts)
>>	close(fd);
>>+		/* Set CID to 0 cause a transport change. */
>>+		sa.svm_cid = 0;
>>+		/* This connect must fail. No-one listening on CID 0
>>+		 * This connect can also be interrupted, ignore this error.
>>+		 */
>>+		ret = connect(s, (struct sockaddr *)&sa, sizeof(sa));
>>+		if (ret != -1 && errno != EINTR) {
>
>Should this condition be `ret != -1 || errno != EINTR` ?
>
Right, good catch.
>
>>+			fprintf(stderr,
>>+				"connect: expected a failure because of unused CID: %d\n", errno);
>>+			exit(EXIT_FAILURE);
>>+		}
>>+
>>+		close(s);
>>+
>>+		control_writeulong(CONTROL_CONTINUE);
>>+
>>+	} while (current_nsec() < tout);
>>+
>>+	control_writeulong(CONTROL_DONE);
>>+
>>+	ret = pthread_cancel(thread_id);
>>+	if (ret) {
>>+		fprintf(stderr, "pthread_cancel: %d\n", ret);
>>+		exit(EXIT_FAILURE);
>>+	}
>>+
>>+	/* Wait for the thread to terminate */
>>+	ret = pthread_join(thread_id, NULL);
>>+	if (ret) {
>>+		fprintf(stderr, "pthread_join: %d\n", ret);
>>+		exit(EXIT_FAILURE);
>>+	}
>>+
>>+	/* Restore the old handler */
>>+	if (signal(SIGUSR1, old_handler) == SIG_ERR) {
>>+		perror("signal");
>>+		exit(EXIT_FAILURE);
>>+	}
>>+}
>>+
>>+static void test_stream_transport_change_server(const struct test_opts *opts)
>>+{
>>+	int ret, s;
>>+
>>+	s = vsock_stream_listen(VMADDR_CID_ANY, opts->peer_port);
>>+
>>+	/* Set the socket to be nonblocking because connects that have been interrupted
>>+	 * (EINTR) can fill the receiver's accept queue anyway, leading to connect failure.
>>+	 * As of today (6.15) in such situation there is no way to understand, from the
>>+	 * client side, if the connection has been queued in the server or not.
>>+	 */
>>+	ret = fcntl(s, F_SETFL, fcntl(s, F_GETFL, 0) | O_NONBLOCK);
>>+	if (ret < 0) {
>
>nit: If you need to resend, I'd remove `ret` and check fcntl directly:
>	if (fcntl(...) < 0) {
Ok!
>
>>+		perror("fcntl");
>>+		exit(EXIT_FAILURE);
>>+	}
>>+	control_writeln("LISTENING");
>>+
>>+	while (control_readulong() == CONTROL_CONTINUE) {
>>+		struct sockaddr_vm sa_client;
>>+		socklen_t socklen_client = sizeof(sa_client);
>>+
>>+		/* Must accept the connection, otherwise the `listen`
>>+		 * queue will fill up and new connections will fail.
>>+		 * There can be more than one queued connection,
>>+		 * clear them all.
>>+		 */
>>+		while (true) {
>>+			int client = accept(s, (struct sockaddr *)&sa_client, &socklen_client);
>>+
>>+			if (client < 0 && errno != EAGAIN) {
>>+				perror("accept");
>>+				exit(EXIT_FAILURE);
>>+			} else if (client > 0) {
>
>0 in theory is a valid fd, so here we should check `client >= 0`.
Right!
>
>>+				close(client);
>>+			}
>>+
>>+			if (errno == EAGAIN)
>>+				break;
>
>I think you can refactor in this way:
>			if (client < 0) {
>				if (errno == EAGAIN)
>					break;
>
>				perror("accept");
>				exit(EXIT_FAILURE);
>			}
>
>			close(client);
>
Will do.
>Thanks,
>Stefano
>

Thanks for the review.
Luigi

