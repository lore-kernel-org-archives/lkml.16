Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6121B91D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839381; cv=none; b=HY6u5kUGij1v/bcj0vmB8RNoXqiCNp7PIlUiDYslIwONdxK+LUYMicuG9QakcOyHIOUY7uikH6DBUI6IOHsIU/bu4TbYTyW6bTXn/udvRjhWqhsnrT6LZs+DtXvC8fCbgKhqGw78fv53bG5gAatDi7HkS/MUmwX+jdq5n2PDbOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839381; c=relaxed/simple;
	bh=4+Wj4hxdaXN96SjUIAfwiVesd+p9hyy1LELAnrGN8UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ged4G/RgpOQznT//KClnH80+lY8zgDUuxI0wdwwPADScCArYjHbpNtgdaXkf2FJ0qUVvyWykxWWgEiA111hr3Htg29CnIf06GrhQj91xgS8PRUYGc5qhAvWZ12cvKVGMdPR6ISRwE1ylKyKdWQYpuDDSveRYOKcRDO/U6HReBiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIAbqR9r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIAbqR9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747839378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSCBFcNuY0Goh2S9d5LToDFwcxHuL80JaO8Gh+v1hTQ=;
	b=VIAbqR9rYZ4vaN9WlgGCzmjy9qILb6VEJOPAljEU6zeyaQBOQwlUig3rhmoCTIvZdvANsi
	LMzhDxDhcxW2ORmvCqo5Y5PJvKv3YRAxGe7xCb4d7Zln2GCMzdWw9GdQgTxbzY8VDlQBid
	gO7VXVZNqaapPBbqB2OsC0LLa0G30V4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-plSIPwlqMjaXO9IFAx5G8Q-1; Wed, 21 May 2025 10:56:15 -0400
X-MC-Unique: plSIPwlqMjaXO9IFAx5G8Q-1
X-Mimecast-MFC-AGG-ID: plSIPwlqMjaXO9IFAx5G8Q_1747839374
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb61452b27so596390366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839374; x=1748444174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSCBFcNuY0Goh2S9d5LToDFwcxHuL80JaO8Gh+v1hTQ=;
        b=U5nCBO3wTgEG0/WRTeLQ+2XR2mnGI2VMyVXPLyF2Ts5cZKlNlUY0qiHlI02pkulJEU
         ++Muz8ErprmzS/liFQDI2lLllTD7rNC9x0lpa7HADS37hTaOj+DgZc/7rH6TQF+DH7hj
         Yd+O4xBEZSV8txNIklGvWGXxMVmJxrw6/Wd6Clw1noXn2U2/72dlrNoWR0JHQ0xRE9WB
         4+hJS+/woTpLzpljtN+OnSrNLBjuJF4tX999z8nw9YJZX0J2TFv4D5FfqlGYlir1a9ci
         qmslxBB6ZwLp3wwyEzNOq5Qfjr3891LFd8i8Dc4eCN0xSveQvjeVnsNcq00jk73KBB43
         E+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU141HiJdYNKIs8/Z9TlyEk7qdqbG6yBYO7o4vpNfHPblCgji69GEaPG6mXUU0VtRaaQd7wetg8gs1nvhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmLDXRD6/92tE7bVqyGSr135OQ/r40P4AYBYmhA5gKpDlDUnN
	bx2hpM6fxVoc37npbN4AkMDzULGHcgoCGaRgHDWZ2FAK45oOktdwYzv/ktVxbi5ezkTgKZoFgRx
	+OO1seihhMX1S6gjEy8nexBcZy7HGMuoqUTzGVXFHSJ1C+YCEzfqm68+QOG7t45B83w==
X-Gm-Gg: ASbGncsmsBuR/jx5ysvtwdAy+he4v7lCzg4t6NfCkzN3Sa0rQuJ/R19oDFhSI3VhxcV
	jg24bExS5ruL6JK7Zu8nhYa9qjbSzS809W6ym4T03IRBq+9XBnQNLH2DKkIzbwPCCQLeF5qltZS
	dC+Hgo/ARYnT+7D/cRSpiDub/p+yZDE8QQlTUDK2LyfdJI2G7tsVt030iHAJ5UMh43+XmWpq47o
	+oyfqk2tSxuX4ydfAoEKjasItmIy3MhQPvh6kXfg4V7UTMzETV9B93tCUp1u4XHgwEDjF3ZEF3s
	S+2my1WgtehQyjeAs3tKfyq8sXYUiAEBg+Enulb7YvPUyh5XR3o5+OUT0Fw/
X-Received: by 2002:a17:907:9495:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ad52d4dae84mr1752075966b.24.1747839374468;
        Wed, 21 May 2025 07:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpoMMbzNscVWDbJ9f7DsJa/QwbA0pdV/T5aW3r3Yle27irZapU6e/PHt7khHjWn7nACqdpnQ==
X-Received: by 2002:a17:907:9495:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ad52d4dae84mr1752071266b.24.1747839373682;
        Wed, 21 May 2025 07:56:13 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278290sm905573266b.78.2025.05.21.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:56:13 -0700 (PDT)
Date: Wed, 21 May 2025 16:56:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v5 5/5] vsock/test: Add test for an unexpectedly
 lingering close()
Message-ID: <edtepfqev6exbkfdnyzgkdkczif5wnn4oz4t5sxkl6sz64kcaf@f6yztxryvmlq>
References: <20250521-vsock-linger-v5-0-94827860d1d6@rbox.co>
 <20250521-vsock-linger-v5-5-94827860d1d6@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250521-vsock-linger-v5-5-94827860d1d6@rbox.co>

On Wed, May 21, 2025 at 12:55:23AM +0200, Michal Luczaj wrote:
>There was an issue with SO_LINGER: instead of blocking until all queued
>messages for the socket have been successfully sent (or the linger timeout
>has been reached), close() would block until packets were handled by the
>peer.
>
>Add a test to alert on close() lingering when it should not.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/vsock_test.c | 49 ++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)
>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index f401c6a79495bc7fda97012e5bfeabec7dbfb60a..1040503333cf315e52592c876f2c1809b36fdfdb 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -1839,6 +1839,50 @@ static void test_stream_linger_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>+static void test_stream_nolinger_client(const struct test_opts *opts)
>+{
>+	bool nowait;
>+	time_t ns;
>+	int fd;
>+
>+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
>+	if (fd < 0) {
>+		perror("connect");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	enable_so_linger(fd);

If we use a parameter for the linger timeout, IMO will be easy to 
understand this test, defining the timeout in this test, set it and 
check the value, without defining LINGER_TIMEOUT in util.h.

>+	send_byte(fd, 1, 0); /* Left unread to expose incorrect behaviour. */
>+	nowait = vsock_wait_sent(fd);
>+
>+	ns = current_nsec();
>+	close(fd);
>+	ns = current_nsec() - ns;
>+
>+	if (nowait) {
>+		fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
>+	} else if ((ns + NSEC_PER_SEC - 1) / NSEC_PER_SEC >= LINGER_TIMEOUT) {

Should we define a macro for this conversion?

Or just use DIV_ROUND_UP:

--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -1831,7 +1831,7 @@ static void test_stream_nolinger_client(const struct test_opts *opts)

         if (nowait) {
                 fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
-       } else if ((ns + NSEC_PER_SEC - 1) / NSEC_PER_SEC >= LINGER_TIMEOUT) {
+       } else if (DIV_ROUND_UP(ns, NSEC_PER_SEC) >= LINGER_TIMEOUT) {
                 fprintf(stderr, "Unexpected lingering\n");
                 exit(EXIT_FAILURE);
         }

The rest LGTM.

Thanks,
Stefano

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
>@@ -1999,6 +2043,11 @@ static struct test_case test_cases[] = {
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

