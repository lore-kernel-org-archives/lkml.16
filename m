Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87464231847
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005232; cv=none; b=VzWYYO1hUti9exDecMik+7oO6eTcWGyZppimtmUThnBtxWuQL3ekFb3Y2h3CD6gYaZwn1269PhTf/h0q1fZo7KRW2Imi+HLFrHEH2gaKOFqtSfHU9BiqYMTEGQU+JOAS17f9sw8LqJ+FRXAUmZGOL6NnFaZZzahblFu2pgUH6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005232; c=relaxed/simple;
	bh=kjb/2qlRokzw4V64RKekB6zLbCzs3UmMCafUrdMO+5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vmn6D3owDBNTz857CJjysJw2FpWukxYmV5dfezyYcyxqvChdlnoZhkK4CTswpPMj9zq7uhNmp9bD+IlZEQzC9lO/YKjolgkOJVlO+fXehC1jAoIIFdw9iE4pdJ/ac1Gvh8TKOn+iKu3wqFGHVtmGs9JKonV5Jjlvn8u41FUxxlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3S+tPzR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3S+tPzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746005229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BnGE355VKh8cwgKuDwR0kb5tI61AXcZQbhXFxQc6RqM=;
	b=D3S+tPzRaKt5u3JCTaATK2KeYgEHF9AVHe25b1F9cyNwCILcY3aMPq0pm9GyDhg0deTmB/
	428iZ/kznfeYNgpo93G05GLNDP+OBiLXn7bpYjlldY42rY0m4V9xyk7aF4KyEoOOrdGg0W
	Jzucsue+zTgU80/5JbLSslyFF2/V/4U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-bWdNpeFIO5e6lcRVlcjUvA-1; Wed, 30 Apr 2025 05:27:07 -0400
X-MC-Unique: bWdNpeFIO5e6lcRVlcjUvA-1
X-Mimecast-MFC-AGG-ID: bWdNpeFIO5e6lcRVlcjUvA_1746005225
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so606004166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005225; x=1746610025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnGE355VKh8cwgKuDwR0kb5tI61AXcZQbhXFxQc6RqM=;
        b=Nx9wN9/ZgjZ+SVwQwiMOmcgPrkwUZZA7QE2aLdrUdTothp/QtXLSkE2QjQP/i4t+ov
         m9oETy5XdTb9vxOWHSYO5asSnupSrR6lrW5vULYN8N4huVv9F03aPJ6qWs9JZuw6i5IU
         /WJ55P3QGLdkwC8Y77bBRxmzZPapDwaxKdbtNwGUnGVPkNNIpEPPlsNpdrKi5aPaSziN
         AYLZh6aGuay0+qXXNshkBjrh2iVXDqWO2peR56zkx2Ogkg9de8IqDTC79WSUe9HQGS/n
         I30GPfYzn7ZkbDeCuX0xIGW14BVjLIVuXSjSwKUhA3DOJ24pizLanWPDqyDZbuk6noVt
         vnsA==
X-Forwarded-Encrypted: i=1; AJvYcCXbIzLgCvibEmdA1/Nfs+ApMpF3PElYTShXweQyl+EoXVw+d0DCHbEXg82YAH0T7wvgLtVLRU4qEac4ZUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAWFQSSKe4aQkuxT0I0ZjvEt70NW7KhWFw9PuyTnAyvFEsbyd
	uZg0hUlavcQ9Uhz8byIVCeckNh8SZGZv9G1v3ONopo450jZYRXovxNeZzXdXn9D1ivXfHYyTSfz
	ceUOybwM7ud7cyaSbcQ0IWs/7SM0BCDU/EtOXT5LDdshXf8cfUVVE2aTXr/MQAA==
X-Gm-Gg: ASbGncvQwltA+uoQAoX7wnkO3/VIMaZnpRANTzHprjt2fL26hsCjBaowhrVw1fW2TXO
	xqxgQNNUSzcI9wWTwHneEihrCUlJrYP4nKB8XHdq3SyL9iU9wrTGRg9HGdyJygUq8lZw5SLiOiK
	0X4Gwpte9dWgwhXxx7UZYuX1kNNVoazEYAtcZ5qEEkmc1/14qasoEXSljQ1z4CTNVCsK7eisR56
	CjXq7mJU13seNDNmwks+Rf1HR4cxq4qmc6I1kaVhstbPrfkUi4/V0d+yjWmvtQHvllxaefRhNY+
	p/aQrArkYuJqX0U2+w==
X-Received: by 2002:a17:907:6d22:b0:acb:6081:14ec with SMTP id a640c23a62f3a-acee26469f2mr167110366b.61.1746005224725;
        Wed, 30 Apr 2025 02:27:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpWzcCN+MPKS91oqLZ/RURiVcQD7mwDZdTf3RoSbMle6jXy5M9/HSlwH5Kk6tGLLsNJHDLYA==
X-Received: by 2002:a17:907:6d22:b0:acb:6081:14ec with SMTP id a640c23a62f3a-acee26469f2mr167105766b.61.1746005224017;
        Wed, 30 Apr 2025 02:27:04 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e70b0sm895358966b.43.2025.04.30.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:27:03 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:26:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/4] vsock/virtio: Linger on unsent data
Message-ID: <x3kkxnrqujqjkrtptr2qdd3227ncof2vb7jbrcg3aibvwjfqxa@hbinpxjuk3qe>
References: <20250430-vsock-linger-v3-0-ddbe73b53457@rbox.co>
 <20250430-vsock-linger-v3-1-ddbe73b53457@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250430-vsock-linger-v3-1-ddbe73b53457@rbox.co>

On Wed, Apr 30, 2025 at 11:10:27AM +0200, Michal Luczaj wrote:
>Currently vsock's lingering effectively boils down to waiting (or timing
>out) until packets are consumed or dropped by the peer; be it by receiving
>the data, closing or shutting down the connection.
>
>To align with the semantics described in the SO_LINGER section of man
>socket(7) and to mimic AF_INET's behaviour more closely, change the logic
>of a lingering close(): instead of waiting for all data to be handled,
>block until data is considered sent from the vsock's transport point of
>view. That is until worker picks the packets for processing and decrements
>virtio_vsock_sock::bytes_unsent down to 0.
>
>Note that (some interpretation of) lingering was always limited to
>transports that called virtio_transport_wait_close() on transport release.
>This does not change, i.e. under Hyper-V and VMCI no lingering would be
>observed.
>
>The implementation does not adhere strictly to man page's interpretation of
>SO_LINGER: shutdown() will not trigger the lingering. This follows AF_INET.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> net/vmw_vsock/virtio_transport_common.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 7f7de6d8809655fe522749fbbc9025df71f071bd..49c6617b467195ba385cc3db86caa4321b422d7a 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1196,12 +1196,16 @@ static void virtio_transport_wait_close(struct sock *sk, long timeout)
> {
> 	if (timeout) {
> 		DEFINE_WAIT_FUNC(wait, woken_wake_function);
>+		ssize_t (*unsent)(struct vsock_sock *vsk);
>+		struct vsock_sock *vsk = vsock_sk(sk);
>+
>+		unsent = vsk->transport->unsent_bytes;

Just use `virtio_transport_unsent_bytes`, we don't need to be generic on 
transport here.

>
> 		add_wait_queue(sk_sleep(sk), &wait);
>
> 		do {
>-			if (sk_wait_event(sk, &timeout,
>-					  sock_flag(sk, SOCK_DONE), &wait))
>+			if (sk_wait_event(sk, &timeout, unsent(vsk) == 0,
>+					  &wait))
> 				break;
> 		} while (!signal_pending(current) && timeout);
>
>
>-- 
>2.49.0
>

