Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEED2BD5A1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895779; cv=none; b=CIZTGPF6vdnOX3k1VInrWlZ3VT5mMdvwyCtxcr1C7sf60Q41ho7jwXzbyhgIB7D4BNg22vkWOx/sidmyOwJGSEXzMIgh9drxwVuLTrjFt+tkkomOWk+mY44tewomUXpdYY4kFQcBpqbQm6sFeY6yhjicbhQVr+PAfp+vZna1nsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895779; c=relaxed/simple;
	bh=xltTqBYmsiirVvBdNqG5/Fyy6AbHsBrBr+WSXMtuttA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AijZKl/u1+h6L1EMofZLckbMgTSQFfq6SI/UMicfh+tkERrkX3zXPJ+HJzfWca8QzsJ7+XImEe4AztK/w3Mo+W4hNIdA59o1bf8r9VP4APzmTx/h7JBEzNYcUdJZBmMbkq2R3AH5RQwtZpuqRDv7jXZAYlNf/JnbAvQDe73owJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpGzbTg2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpGzbTg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751895776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VsmgUKFf5I0+AJIsgxdkjg4irOxBPoSgMLTf3OScQaQ=;
	b=DpGzbTg2iJRWRCudsMabBbQlP3IWyGXgNUxS1Eq0s4kStUEbWKVM9/f6oUDYI75Xu/EA4j
	Dw1x0qjUfuFWzI7+VUaUJYxUywuJ/oYeKUC4jyvzD+sOI1tYiYgvIfpzcoO8m6WPm0h98X
	6kCHAHujSyX8yMlHdyHspnbMuE6WtOw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-IcXpSeFuM_aAgRFOrGbGVg-1; Mon, 07 Jul 2025 09:42:54 -0400
X-MC-Unique: IcXpSeFuM_aAgRFOrGbGVg-1
X-Mimecast-MFC-AGG-ID: IcXpSeFuM_aAgRFOrGbGVg_1751895773
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1436348f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895773; x=1752500573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmgUKFf5I0+AJIsgxdkjg4irOxBPoSgMLTf3OScQaQ=;
        b=TiAsrd8Is8W7WPECbtfKZHzlxHZI2LnAZBxVZGP4QvV9wFZVvRd+4nEOZ45cjyrBdz
         /EIX9dN1GIfgVHyrGF2kfIZJw8snktWLMrWjz7U+X7I0xj75LtFIHdElH0Ubt3SzYFpQ
         Y/QKGeoAy/vcsVSYWfRWaV8BVxfKoy9s+CK5RiRAQ/gODhPFZNttSafiQnLJKUi7whf1
         ds3cN761zExRT4fKLpvIl1dmV0RrcFBSaDVVjHgN0o5Rn7AzkIsqN6ABdlZXWdKsKxYG
         xg0J7np6Zt3KN9pBhXrQ0XFUhjOEE+PAqtFJvMZdBCbOwug7nFzhLIHFJeLfchRXELj7
         A1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNYHl064Uk8Hbkn3az4bbtoL2clXYnA8fAAdaU/8K0S04rQCh6nbsovKWkEsZBkOvkvBktYWS6qnuHYYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD6398QBUPGsJMhRNJLS3b3YPtil8MUYC7WBkSfGnMaxZC/Z1A
	GxcyI/bF3yJATpsgeBCoGKkDYyyaVzt7DO/nguy0ziSfjH1wwj0QT+cW6BB9Flroeqewx4dBk3w
	jSYt/pozeXOn7ET5nubh/I4VjCKscTyQzQ3UeBlXN/5vM49zObDMT7WL9otVApfn98A==
X-Gm-Gg: ASbGncse/KsT5/taZ7oOfelFMRAq3PsCdaB8dTENTprroIXMYPMAJTe0hK3bWMmAE8y
	yTjciansbJxT3R1mZ8bZAEMAXlpzfJC7CY/wlUcn5MT1Y+Am/PaOqTx0Z/qn17eRqdd7Mq0DV5z
	jCEMnGE1/LXTSO2wB9taLGosH7NoUuXblDRolVBMuC/dhqK2PNEK2tqjiplhtx4Zvrj25L/H3X+
	HEEO1oavfRRer686UtD6TovN9Yk8RyuMN1kEAOaYNHUxeaykv2rXvjDA7kLplDPUx27u7qtlLEQ
	4HRCv7TiTleZYar0D/illwqH5P8A
X-Received: by 2002:a05:6000:400b:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3b49aa7d51dmr6564063f8f.42.1751895773417;
        Mon, 07 Jul 2025 06:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY8SiQF+6f5+bf4//S2AtBghoAdxNERSqvvMXKZJvwoNLtCvWhRhxkkv/MOEbunhybnSwajg==
X-Received: by 2002:a05:6000:400b:b0:3a5:1cc5:4a17 with SMTP id ffacd0b85a97d-3b49aa7d51dmr6564020f8f.42.1751895772808;
        Mon, 07 Jul 2025 06:42:52 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b492sm140318785e9.13.2025.07.07.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:42:52 -0700 (PDT)
Date: Mon, 7 Jul 2025 15:42:45 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuewei Niu <niuxuewei.nxw@antgroup.com>, fupan.lfp@antgroup.com
Subject: Re: [PATCH net-next v5 1/4] hv_sock: Return the readable bytes in
 hvs_stream_has_data()
Message-ID: <xphwpqqi42w5b3jug3vfooybrlft3z5ewravl7jvzci7ogs3nh@5i7yi66dg7fa>
References: <20250706-siocinq-v5-0-8d0b96a87465@antgroup.com>
 <20250706-siocinq-v5-1-8d0b96a87465@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250706-siocinq-v5-1-8d0b96a87465@antgroup.com>

On Sun, Jul 06, 2025 at 12:36:29PM +0800, Xuewei Niu wrote:
>When hv_sock was originally added, __vsock_stream_recvmsg() and
>vsock_stream_has_data() actually only needed to know whether there
>is any readable data or not, so hvs_stream_has_data() was written to
>return 1 or 0 for simplicity.
>
>However, now hvs_stream_has_data() should return the readable bytes
>because vsock_data_ready() -> vsock_stream_has_data() needs to know the
>actual bytes rather than a boolean value of 1 or 0.
>
>The SIOCINQ ioctl support also needs hvs_stream_has_data() to return
>the readable bytes.
>
>Let hvs_stream_has_data() return the readable bytes of the payload in
>the next host-to-guest VMBus hv_sock packet.
>
>Note: there may be multpile incoming hv_sock packets pending in the

s/multpile/multiple

>VMBus channel's ringbuffer, but so far there is not a VMBus API that
>allows us to know all the readable bytes in total without reading and
>caching the payload of the multiple packets, so let's just return the
>readable bytes of the next single packet. In the future, we'll either
>add a VMBus API that allows us to know the total readable bytes without
>touching the data in the ringbuffer, or the hv_sock driver needs to
>understand the VMBus packet format and parse the packets directly.
>
>Signed-off-by: Dexuan Cui <decui@microsoft.com>
>---
> net/vmw_vsock/hyperv_transport.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
>index 31342ab502b4fc35feb812d2c94e0e35ded73771..432fcbbd14d4f44bd2550be8376e42ce65122758 100644
>--- a/net/vmw_vsock/hyperv_transport.c
>+++ b/net/vmw_vsock/hyperv_transport.c
>@@ -694,15 +694,26 @@ static ssize_t hvs_stream_enqueue(struct vsock_sock *vsk, struct msghdr *msg,
> static s64 hvs_stream_has_data(struct vsock_sock *vsk)
> {
> 	struct hvsock *hvs = vsk->trans;
>+	bool need_refill;
> 	s64 ret;
>
> 	if (hvs->recv_data_len > 0)
>-		return 1;
>+		return hvs->recv_data_len;
>
> 	switch (hvs_channel_readable_payload(hvs->chan)) {
> 	case 1:
>-		ret = 1;
>-		break;
>+		need_refill = !hvs->recv_desc;
>+		if (!need_refill)
>+			return -EIO;
>+
>+		hvs->recv_desc = hv_pkt_iter_first(hvs->chan);
>+		if (!hvs->recv_desc)
>+			return -ENOBUFS;
>+
>+		ret = hvs_update_recv_data(hvs);
>+		if (ret)
>+			return ret;
>+		return hvs->recv_data_len;
> 	case 0:
> 		vsk->peer_shutdown |= SEND_SHUTDOWN;
> 		ret = 0;
>
>-- 
>2.34.1
>

