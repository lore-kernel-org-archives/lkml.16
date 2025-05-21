Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FA19DFAB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839723; cv=none; b=keN2Hgcy1zvx23LW0+eomutQM7nWrDaD9Bv2L93ZbV1h/tN87kx+/jUNCzbO4KRl7MU0zW4vZaWT6nqsG5TPwoQVkuYNAjoF4sQecRYewqx5m6/ZsBzVimqDFJCPI4ODkvocbdB/z9s0vfoh7J/7gmkGIENNXzyBDRZEVBf4Bzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839723; c=relaxed/simple;
	bh=xehhInAtDXNQ/n5gfDz6llbpaPNmLMER2GgFqEhTcvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZZjpQGav06II4uvheE7+l+lRl366C2ItV0d6Iq+0sxN3KYWgTCRqjXpox62rcz40/mUQyriWThT8X+c8mKmRIbqD96/kpgSNpRhnMrFrAqdBMt6qtfrwQ+nO8G5YhE8UIMAYvTEK02trVP7r3nDCQH3f9wNn0ZqzEsKo08aedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gFULANMm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gFULANMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747839720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQaN0Uw5ksNxoFenF66ughGD5YHdupsTVLr1isPbs2c=;
	b=gFULANMmw+dtDKgWAI5hb9lGyyDRvswcdIkPVBfn9f0IqJICiQQNnmzGhHJLZHPC08XG9t
	2s6pKoGi0yBpI3uv6YXh7TeQ/ikgiToblCKPsxAVsrCAZg1LR7UMrep0nY7xrMEb/TMGBc
	mAwc2+ze0QWKdPgvhJCAEwY/qjALV2k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-gpoe1qIRM9igbTYCRS0aEA-1; Wed, 21 May 2025 11:01:48 -0400
X-MC-Unique: gpoe1qIRM9igbTYCRS0aEA-1
X-Mimecast-MFC-AGG-ID: gpoe1qIRM9igbTYCRS0aEA_1747839707
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-601f1e8acc5so3532444a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839701; x=1748444501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQaN0Uw5ksNxoFenF66ughGD5YHdupsTVLr1isPbs2c=;
        b=vQYEMR57Wt0n/Y/xoBihnfraNX1C3E07YBrUxsHmKgZ5oTSu3GTx4GigZJCpzZZERC
         QhCwz5z1FapS2+tQGCd3g3YF+WlXDhMRMr4pL9lUsMy1EBG606RfdbTBZxIdxgrxe2mc
         HoFfiiF1kXnbNqb/mCwfOjSXQhI4MOORyoETKmYXhf4mNpsvkQor3Os9rpueuZZC7Kv1
         H2FaQuPE+jxgZ1g+hLE4phIyp0zvGbE0ZD2cDZGRwXCRpOfYcjGKTHrOzJ1nPd//X+eB
         hazf0lS1V1cGd/x2sNsL6XDShF7rjyUX/OctOwjHwuSzP4pnfdFPMqpr3uziHLBI9uK2
         dLdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnckgWB0pa0O/dFTKMhMhLfB3+3sdGcw4g91632D92dE+GNESHXxXldg/oDXHe/tfucXd+osaAFcevmw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8J+T6x4CLXoJk3L8EAQffoO7V9IA7u4T5MUcbfabLyIUKxJQ
	oh6IZxyTyRLiRZTO3D0sswHSeoIS5JaWxyo5Q0wV4zENrKAKgxQXFMfIqa6/5sojOYGaMFfx5Dv
	3Mg4StiAZ82J8nTRWhJKsIHfdG+WCyfRZdxz5wAWfm3FnuRZhIslOrBjWlajxrSiubw==
X-Gm-Gg: ASbGncv3zxS/eztqVfXzQX67mtFLsXZf0AVHkGvXxIe2TBgYov5xIS9SVhOaO/e3rbA
	N8zWoBrujMDfoaqVrXXTZCMRtGHisu32zTCGCkLDoHs+V2SJ19JACpghx3/kELTt5udDietVlzq
	hChMZHz6z2Vtb4oeEfyXDps+TGYZfuHHBwN1EeLzBvYqvRuo9t2FiZ9X5qACyy5SCtQhBEXq5pO
	3vhOudbplPF2WUi2q+sBBvcwmgTBlGFDeLyA+eTCFyf+dlCtv/bByArnQ/Qo4ud9geSrHebsyen
	YhQquaE4OrGva5N47/Eao33JI/YFxHyErnTGS+Q51CY7n0zSGlXnwmGQTSXX
X-Received: by 2002:a17:907:7da2:b0:ad4:d9c9:c758 with SMTP id a640c23a62f3a-ad536b7c8dfmr1808154666b.11.1747839694915;
        Wed, 21 May 2025 08:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlYrXcyUQ/GFhKIGPeqwLg3L9B+4cCMXz+eKCUeTZ4xCrnP7r7wqBOBXYGqGyAGakMiIi6NQ==
X-Received: by 2002:a17:907:7da2:b0:ad4:d9c9:c758 with SMTP id a640c23a62f3a-ad536b7c8dfmr1808102866b.11.1747839690863;
        Wed, 21 May 2025 08:01:30 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca5c5sm909001966b.162.2025.05.21.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:01:30 -0700 (PDT)
Date: Wed, 21 May 2025 17:01:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/5] vsock/test: Introduce vsock_wait_sent()
 helper
Message-ID: <kva35i6sjyxuugywlanlnkbdunbyauadgnciteakxu2jsb2kl7@24fgdq2glxk6>
References: <20250521-vsock-linger-v5-0-94827860d1d6@rbox.co>
 <20250521-vsock-linger-v5-3-94827860d1d6@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250521-vsock-linger-v5-3-94827860d1d6@rbox.co>

On Wed, May 21, 2025 at 12:55:21AM +0200, Michal Luczaj wrote:
>Distill the virtio_vsock_sock::bytes_unsent checking loop (ioctl SIOCOUTQ)
>and move it to utils. Tweak the comment.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/util.c       | 25 +++++++++++++++++++++++++
> tools/testing/vsock/util.h       |  1 +
> tools/testing/vsock/vsock_test.c | 23 ++++++-----------------
> 3 files changed, 32 insertions(+), 17 deletions(-)
>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index de25892f865f07672da0886be8bd1a429ade8b05..120277be14ab2f58e0350adcdd56fc18861399c9 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -17,6 +17,7 @@
> #include <assert.h>
> #include <sys/epoll.h>
> #include <sys/mman.h>
>+#include <linux/sockios.h>
>
> #include "timeout.h"
> #include "control.h"
>@@ -96,6 +97,30 @@ void vsock_wait_remote_close(int fd)
> 	close(epollfd);
> }
>
>+/* Wait until transport reports no data left to be sent.
>+ * Return non-zero if transport does not implement the unsent_bytes() callback.
>+ */
>+int vsock_wait_sent(int fd)

nit: I just see we use `bool` in the test to store the result of this 
function, so maybe we can return `bool` directl from here...

(not a strong opinion, it's fine also this).

Thanks,
Stefano

>+{
>+	int ret, sock_bytes_unsent;
>+
>+	timeout_begin(TIMEOUT);
>+	do {
>+		ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
>+		if (ret < 0) {
>+			if (errno == EOPNOTSUPP)
>+				break;
>+
>+			perror("ioctl(SIOCOUTQ)");
>+			exit(EXIT_FAILURE);
>+		}
>+		timeout_check("SIOCOUTQ");
>+	} while (sock_bytes_unsent != 0);
>+	timeout_end();
>+
>+	return ret;
>+}
>+
> /* Create socket <type>, bind to <cid, port> and return the file descriptor. */
> int vsock_bind(unsigned int cid, unsigned int port, int type)
> {
>diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
>index d1f765ce3eeeed8f738630846bb47c4f3f6f946f..e307f0d4f6940e984b84a95fd0d57598e7c4e35f 100644
>--- a/tools/testing/vsock/util.h
>+++ b/tools/testing/vsock/util.h
>@@ -54,6 +54,7 @@ int vsock_stream_listen(unsigned int cid, unsigned int port);
> int vsock_seqpacket_accept(unsigned int cid, unsigned int port,
> 			   struct sockaddr_vm *clientaddrp);
> void vsock_wait_remote_close(int fd);
>+int vsock_wait_sent(int fd);
> void send_buf(int fd, const void *buf, size_t len, int flags,
> 	      ssize_t expected_ret);
> void recv_buf(int fd, void *buf, size_t len, int flags, ssize_t expected_ret);
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index 9ea33b78b9fcb532f4f9616b38b4d2b627b04d31..4c2c94151070d54d1ed6e6af5a6de0b262a0206e 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -21,7 +21,6 @@
> #include <poll.h>
> #include <signal.h>
> #include <sys/ioctl.h>
>-#include <linux/sockios.h>
> #include <linux/time64.h>
>
> #include "vsock_test_zerocopy.h"
>@@ -1280,7 +1279,7 @@ static void test_unsent_bytes_server(const struct test_opts *opts, int type)
> static void test_unsent_bytes_client(const struct test_opts *opts, int type)
> {
> 	unsigned char buf[MSG_BUF_IOCTL_LEN];
>-	int ret, fd, sock_bytes_unsent;
>+	int fd;
>
> 	fd = vsock_connect(opts->peer_cid, opts->peer_port, type);
> 	if (fd < 0) {
>@@ -1297,22 +1296,12 @@ static void test_unsent_bytes_client(const struct test_opts *opts, int type)
> 	/* SIOCOUTQ isn't guaranteed to instantly track sent data. Even though
> 	 * the "RECEIVED" message means that the other side has received the
> 	 * data, there can be a delay in our kernel before updating the "unsent
>-	 * bytes" counter. Repeat SIOCOUTQ until it returns 0.
>+	 * bytes" counter. vsock_wait_sent() will repeat SIOCOUTQ until it
>+	 * returns 0.
> 	 */
>-	timeout_begin(TIMEOUT);
>-	do {
>-		ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
>-		if (ret < 0) {
>-			if (errno == EOPNOTSUPP) {
>-				fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>-				break;
>-			}
>-			perror("ioctl");
>-			exit(EXIT_FAILURE);
>-		}
>-		timeout_check("SIOCOUTQ");
>-	} while (sock_bytes_unsent != 0);
>-	timeout_end();
>+	if (vsock_wait_sent(fd))
>+		fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>+
> 	close(fd);
> }
>
>
>-- 
>2.49.0
>

