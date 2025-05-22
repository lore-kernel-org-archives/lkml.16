Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFE2609EF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901149; cv=none; b=LARBOFCLi+UUagH+ezutyixXWrJ87IDy4jcsy43bn+T91DSy/MI5wFgOQNFSvBySXPwXqPoKChl6SWpLg8UPuWMcs/9DOrrAL6PpCc5ormuMFz1npsgA1Vr3QbWzbJgg62sTG2BwY00F/ElbdZz9aPMd6n9hKVJhJ6PRNUDDxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901149; c=relaxed/simple;
	bh=kWJ+8wnhh914ZGBXjyQG8OCRHhwawgFGLPLGp5cMp2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn9CEFo5gr3ieIoN6Mp8MEfUisxuFEoGXqDMZgnEhLuZZ6sQAx7bYXP/EysdUNGIXOzd0vKNZMifeXvK5/fn/hn+hHjM3qa2OYOejQHqrSYxPYlVBREkDFHCPefyAi91HTYESQCUbBuBKddn1/miA0VkOVl0ZWHENYVrXfTte8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=djQPBdpJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djQPBdpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747901146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4n1+uXd36V+722CeTIUBaJYf703izxjGMMRXpA7T1DQ=;
	b=djQPBdpJfzJvD6Fy535GNeYnXfjxKRs1r33fNAWegTRme55gCzoWZ4UAKvNk/eiEb4eb6c
	tZ7kTrtjiLb+EL5pvpBQq2uFIHKIvi5TzsSXnh2+6/FlV97ciUIqY3zYw2Iaq2gC4a2fiM
	BbNHBjin099ULwJqOXDx/pPVNNE9W3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-RPLBErcBNjaqK8bV_WLqUQ-1; Thu, 22 May 2025 04:05:45 -0400
X-MC-Unique: RPLBErcBNjaqK8bV_WLqUQ-1
X-Mimecast-MFC-AGG-ID: RPLBErcBNjaqK8bV_WLqUQ_1747901144
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso64338745e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901144; x=1748505944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n1+uXd36V+722CeTIUBaJYf703izxjGMMRXpA7T1DQ=;
        b=CqH80lzNijbqIXfttIAyXk2kjhYlK1bd35DFx4C16hXdRGnc2dPMhmmxByb4E0n9q5
         jrzODv0XvKdM7X2eB122iu6+YOwtegtKCxT2wStv/nL37QpZN2o93/yMRepmYiG4dItD
         NA/Qddz0oBFuvtsAcapSwqY7p/a549VpnxVniMkuXvwIJR309+ByyAEclHVJzxcRc7T2
         LUGzSyG1z9GfSGnYPNiet68zyD/8TDQvGZylPyF7CRZsGOV69KoF93n9hAb0KWfextDh
         avadQTWTbcm9KffM7yd+o9+nYRUFjniY9HDUH3D+gjotPUqBvXMovAQ5JcQWpkNRCRgH
         EgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKNB+dQDgsfgEmTi0lIaoQMzkEQWoCdFChOQ4OQbxgEBe87/7tk7EVVxGGKJZi62AfoIS9AgNmiPjR2EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHdagdOGmjCn8cv/F0JS29/1/XZQlcClaPzo8jfX59i7sZxMb
	bcIA+5Xw59o90IdOb3M9fPnlTcGKvTRC8fDRLMyTjJbJ4QeoFhUcjAZqnaOTGAioZ01Yu4YlADP
	I1+PYmJDI5JbPjAmW2fxi/++gJArT5s/VNsSPAUSGYxoW4kMA9L3MUtKoMXLeyLvi+g==
X-Gm-Gg: ASbGncsrLNJ17x/6QZfn1XJxDmddxdWaP/tN5H+vs+rV0lHwf7I3ctq8zMAs6ukZ4cO
	j0O5kDRoOUj2U5D96TNvRcDsudhf2Zer7+JsMWwtjXwqD9Asevh9ZZTQLixcAbSP5igxWW90dxF
	B/PZWqhTy4yULqVu3H05O5JnWRz9g44LucsNZaNOkHvw+EGwGShxfqKmkCblwrE4d4Ph4j9cOn7
	mUVg53HiHi5mPRxY8tn+kj/YyAQ4FIQXnIKO69w2wu16SBsWnjdrh3zH5WdyWsY1rFZaevJAh5F
	luK1SG+73otY7V3WkkYtXZ/kkyDWxnZCpBq5ZIzlWv3ADjEYpNSwOvorLPk1
X-Received: by 2002:a05:600c:3ba1:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-442ff03bbaemr215404555e9.27.1747901144179;
        Thu, 22 May 2025 01:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6p/hrwmEdoltdyMAYZsM/Trt1xdM7A/O/RHR4xK1dSQJHwCglht4DgE/PYNhLm3+cM8zWw==
X-Received: by 2002:a05:600c:3ba1:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-442ff03bbaemr215401755e9.27.1747901140327;
        Thu, 22 May 2025 01:05:40 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f381465fsm95350675e9.29.2025.05.22.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:05:39 -0700 (PDT)
Date: Thu, 22 May 2025 10:05:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v6 5/5] vsock/test: Add test for an unexpectedly
 lingering close()
Message-ID: <4huzbqatmv5ohwnwbqoeri55a35yyhlm3drlltldy6mgajjkj2@eptml5ykp54h>
References: <20250522-vsock-linger-v6-0-2ad00b0e447e@rbox.co>
 <20250522-vsock-linger-v6-5-2ad00b0e447e@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522-vsock-linger-v6-5-2ad00b0e447e@rbox.co>

On Thu, May 22, 2025 at 01:18:25AM +0200, Michal Luczaj wrote:
>There was an issue with SO_LINGER: instead of blocking until all queued
>messages for the socket have been successfully sent (or the linger timeout
>has been reached), close() would block until packets were handled by the
>peer.
>
>Add a test to alert on close() lingering when it should not.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/vsock_test.c | 52 ++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 52 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index b3258d6ba21a5f51cf4791514854bb40451399a9..f669baaa0dca3bebc678d00eafa80857d1f0fdd6 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -1839,6 +1839,53 @@ static void test_stream_linger_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>+/* Half of the default to not risk timing out the control channel */
>+#define LINGER_TIMEOUT	(TIMEOUT / 2)
>+
>+static void test_stream_nolinger_client(const struct test_opts *opts)
>+{
>+	bool waited;
>+	time_t ns;
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	enable_so_linger(fd, LINGER_TIMEOUT);
>+	send_byte(fd, 1, 0); /* Left unread to expose incorrect behaviour. */
>+	waited = vsock_wait_sent(fd);
>+
>+	ns = current_nsec();
>+	close(fd);
>+	ns = current_nsec() - ns;
>+
>+	if (!waited) {
>+		fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>+	} else if (DIV_ROUND_UP(ns, NSEC_PER_SEC) >= LINGER_TIMEOUT) {
>+		fprintf(stderr, "Unexpected lingering\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_writeln("DONE");
>+}
>+
>+static void test_stream_nolinger_server(const struct test_opts *opts)
>+{
>+	int fd;
>+
>+	fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
>+	if (fd < 0) {
>+		perror("accept");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_expectln("DONE");
>+	close(fd);
>+}
>+
> static struct test_case test_cases[] = {
> 	{
> 		.name = "SOCK_STREAM connection reset",
>@@ -1999,6 +2046,11 @@ static struct test_case test_cases[] = {
> 		.run_client = test_stream_linger_client,
> 		.run_server = test_stream_linger_server,
> 	},
>+	{
>+		.name = "SOCK_STREAM SO_LINGER close() on unread",
>+		.run_client = test_stream_nolinger_client,
>+		.run_server = test_stream_nolinger_server,
>+	},
> 	{},
> };
>
>
>-- 
>2.49.0
>

