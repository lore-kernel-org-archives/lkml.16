Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4187339A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021191; cv=none; b=Yy7xVf+YzXgdoxDYz6MS/oWqnRAjHx+H0LiK7fdOyTbT8MqPLbBdGVf7A63liGCLMb3PmX6OF2W31d6R7Iy8lKVzYL4lTJJyqYD0sfTXMY+pjhgh+CddaYYg+/LoSTNTYKaVgAAuHoXIZUYaCRhuC5ieHd4TTeS9U5P6cRVZgus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021191; c=relaxed/simple;
	bh=H9cfOW7/9BOVcWtdnIje6hKT1HQvPyY4W0Mbubki7jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8GCpuse31zSc6LaNdHGUR4ZxfZU+JPpS1TOheg8l7GBS+xK/KrUTvEREHot/WAsNgdgyNjr/VgWRcr7c3jK1jFDuhl6v7rXS3B0oAqzLxLM4HBQPcBuHwpnYgQy4JZdKojUWQVBEIJ3CSoqrHLPBaHNzwk5amgr4Utb2PP/MKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cb49pQZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cb49pQZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751021189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2U6yQaN5C0bZ1f1NN3/TqG5WpiCkSwG+8B6FK7qmmgQ=;
	b=Cb49pQZSy0tNkqKQyYifUqyxSyP8sVFi6cm8Alt9a2+p90aIMlFiU60kjAqyvu0wgQd0qt
	FB646obpbcREM4egv2FFrAZHCP7knygRiVBGCRX0B27SktTeq3wVt9tAS/CgyxSkpAC9bA
	Xeo6hXTqBrYdFO6ofikb1TthUiKkRwU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-ktfz_bE8OiGG1YY89-eaPA-1; Fri, 27 Jun 2025 06:46:27 -0400
X-MC-Unique: ktfz_bE8OiGG1YY89-eaPA-1
X-Mimecast-MFC-AGG-ID: ktfz_bE8OiGG1YY89-eaPA_1751021186
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f30d56d1so1036168b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021186; x=1751625986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U6yQaN5C0bZ1f1NN3/TqG5WpiCkSwG+8B6FK7qmmgQ=;
        b=gFoDnX2c3wSSuq18G3sBi11xgDUygTVAqbg576o2XFGbyjJE8F5LNTi+fiUPsDoJqT
         /Lka3pN0V9QrnYZGQ5r9y9cs4MMcnJqwyRGU+zbJKsBDXek61rVROaNe3sJQ/mratSpD
         dvXzCw+OswA/ooRBJFqQf+Z+N4afJky/PLk3/aZPC+NO6bn+kyMkQjl/mm+YiKzDvZzo
         3hLudw9gDKt6Pl5h6QQ0oTt/uJjraL/7zCTcJxsuxLoeFIj1zEup32tzcrzUyq7X5qko
         nh3Bgj6e8w3u5L2TJA9e5KHjBT52ZIeDpnmuVlPlIrELvMryC8nvreaS46UK9Mpqv48q
         +Smg==
X-Gm-Message-State: AOJu0YyTdKqKmQATHODdN7b7M1QxpaCCEYdTXwZ8TCG1LNzdvBz7d1MW
	GnE1+EP5+wA2W1db995Qy43Fn/gfUg7BrMI856Y7VOI6zgCbzaNz6ZXCj+uHX6yK/TsfLy+xvCH
	bIi9ZtpsNtt1i6ymPjzA2HvEoy9G7kjitMA0SgyDsbjuweWHUSltsmszbj+kNcbK3EA==
X-Gm-Gg: ASbGnctfDL/iAi6bBxbX3NIeqeolkL1rSVXsF/nyzrD5xaiWuUHFJd5GruTvx16fA61
	UPZa/6iZaTEgp6vqVCX24hTlR8oljqRclVSN4G0jbHKfs1Tx3EXg4n68xeVMmcNtbt9RrEU3a8e
	D84zoPLGU5dAVDH3NY7Ks61tNefXOVzU6io1EzOm9WbQn+KUcH2mzxpQNH8k8A3/1rfb0Pd0LzU
	wFcYzQwgwydf4HINfE7teNZ1uLMhkkMxuS+1xL78qPPuTysuqzg3rFBbMiamT77xbV1TCmKJ6ZF
	8urNOC9he9LHsSHlj/IauVQtYcc=
X-Received: by 2002:a05:6a00:1a8f:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74af6fcd495mr4401849b3a.23.1751021185866;
        Fri, 27 Jun 2025 03:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1QscKRumL1vYeE62JJDCxmp5mPz+2z7tzSDNki5kV7FVhY5xV2DPg4aIB+BhjiSrwycgrew==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-74af6fcd495mr4401798b3a.23.1751021185441;
        Fri, 27 Jun 2025 03:46:25 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.150.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c5837sm2009378b3a.116.2025.06.27.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:46:25 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:46:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 4/5] vsock/virtio: Rename virtio_vsock_skb_rx_put() to
 virtio_vsock_skb_put()
Message-ID: <oxnd4uescl5fhdvkyrhndygud5io7qwwajjg5h2bkmhz5kdhbx@zontoh2qdsuw>
References: <20250625131543.5155-1-will@kernel.org>
 <20250625131543.5155-5-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250625131543.5155-5-will@kernel.org>

On Wed, Jun 25, 2025 at 02:15:42PM +0100, Will Deacon wrote:
>In preparation for using virtio_vsock_skb_rx_put() when populating SKBs
>on the vsock TX path, rename virtio_vsock_skb_rx_put() to
>virtio_vsock_skb_put().
>
>No functional change.
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> drivers/vhost/vsock.c            | 2 +-
> include/linux/virtio_vsock.h     | 2 +-
> net/vmw_vsock/virtio_transport.c | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)

LGMT!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index cfa4e1bcf367..3799c0aeeec5 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -380,7 +380,7 @@ vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
> 		return NULL;
> 	}
>
>-	virtio_vsock_skb_rx_put(skb);
>+	virtio_vsock_skb_put(skb);
>
> 	if (skb_copy_datagram_from_iter(skb, 0, &iov_iter, payload_len)) {
> 		vq_err(vq, "Failed to copy %zu byte payload\n", payload_len);
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 8f9fa1cab32a..d237ca0fc320 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -47,7 +47,7 @@ static inline void virtio_vsock_skb_clear_tap_delivered(struct sk_buff *skb)
> 	VIRTIO_VSOCK_SKB_CB(skb)->tap_delivered = false;
> }
>
>-static inline void virtio_vsock_skb_rx_put(struct sk_buff *skb)
>+static inline void virtio_vsock_skb_put(struct sk_buff *skb)
> {
> 	u32 len;
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index f0e48e6911fc..3319be2ee3aa 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -648,7 +648,7 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 				continue;
> 			}
>
>-			virtio_vsock_skb_rx_put(skb);
>+			virtio_vsock_skb_put(skb);
> 			virtio_transport_deliver_tap_pkt(skb);
> 			virtio_transport_recv_pkt(&virtio_transport, skb);
> 		}
>-- 
>2.50.0.714.g196bf9f422-goog
>
>

