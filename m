Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5622F508C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474452; cv=none; b=e/qSxeGqXMKV22zhh48o0dJ1BQZOFA2W6/7cODNd3846XhEJHDCB+o7ZW8HUY6WkcmeP66c5lq1yE3R0QdNKwokQnHtxNCQedLTFfCRuTsv8y7O5zBDD92CodkQQilGDourc7NqDJ0ZsAWZ397UfPEnxRC5xB53D0OcS1kg2PDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474452; c=relaxed/simple;
	bh=3GK1ycy0hQOJv/ORyYe46/AezZlfuxduyUJ3kxm9gpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVLa8+QO+NrQeEdHl0YVN+idYMhSJzgB1PumNbK+op7Q3OsVrFGYjl8JEtCiGIzYUE0pEF9XH3vroy2GXlW/IdobFjNXLEEc0TYNbHJ/WmhLXD0xHY2XrS5VtSCUofXkXjZeOpL4E6JU45pUVRZulZFSRhReeAnf0LxlmWCMCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZNj/P2Fs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZNj/P2Fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751474449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DxX5SXQow8cTQNbRkntUDQ1P4SHS3PGAaksdc4s5nHk=;
	b=ZNj/P2Fsdu2q4N03nQZkULr0r8K0gmRFBZYkQUpL86QVXLRl5+bFHjZQD4CAXul6IAsKdg
	bmnD7A93BlI8eD8y0HGzhcAmTNG+ZZSo0ZmS1PkFWx7kOLgToBJ3kVPBIHfaPupfV6jfDa
	ITW0SktSFscyZnNg8pSWBikjQ+guJkc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-hIHbieRxO9S52yOaHKDD8g-1; Wed, 02 Jul 2025 12:40:48 -0400
X-MC-Unique: hIHbieRxO9S52yOaHKDD8g-1
X-Mimecast-MFC-AGG-ID: hIHbieRxO9S52yOaHKDD8g_1751474447
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4536962204aso19091535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751474447; x=1752079247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxX5SXQow8cTQNbRkntUDQ1P4SHS3PGAaksdc4s5nHk=;
        b=nlWDHsXKXUi+A3hNdLQ3GTCijKYdjhSt47Lal6R6DDn/sHdMFTanw/bIHRwfre4UgK
         KX1ccaBtmjh7VrsFy/GNmn6lxWIbRscEnp2/GnGC3LHFCTyWJaS6R5aee4VGiW6hFYlc
         BKZdYmSabTBHSXGLn12YjMFtOH8XcRzHF7OJiKAaMSpA/V2PXXsW0vf0d80ZDuIY0GpU
         4B7TPKgWMofkgHZlHfcAvh+fdGaU82ao3MjV4Y65phknHjjieTUjtEV5NGL2mgAmq93f
         9qN59qIDBkBFPUxzxuUE9hMl9PmtgMxXXFKZ7IFj/ULU3EWcwhdv08NB9Z+8YH8irqbO
         H7jA==
X-Gm-Message-State: AOJu0YxAhEXPQRBRHuZBG/MxIiCYCuo5ZpC8Pln05OXUihK3WatAxZKk
	8/+0VBij62+9bqdffdYNTSAA89iF3INK9fl6Ic9VL5OugDzDr6ulq1WI8m6Mdph4TmVHxZMnpYe
	oxlfTQL8vsdZPD8Tfs/Bro/v7Lse2Ecnr6TFutf6PTG9mGtzI5AK9I3YIwvVcwQu0RA==
X-Gm-Gg: ASbGncstpCQWqkntP5bURBQZDE91Z0ZV+CYgdkyRk+o/w2ThQVGEPMwOdNd9xRQRtR8
	gKTH26WBZEavkD134Csp+VOHU7e6+Zswyfp0VXmmQ+J22BkWBJ9zTkTqnN2aQnpBPe7XrpUZthY
	ZpvitdGKYrpC75p8in9cHA96VkiWyXSKcf6g6jNakajVep9AL5UpVLaqfinkr/4m0VdV8UAfRpc
	1xsz6DpluDfGNmGdu5/ryBrZjqDE/zR+Yj90+dfCyEGw/UGWpiUo4ed/EJvzWmfoNYEH/cGT0/1
	Z5ePGCp9oy2qQh3dfT0Y0kXUbHg=
X-Received: by 2002:a05:6000:2dc1:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3b1fea8ef71mr3497620f8f.15.1751474446689;
        Wed, 02 Jul 2025 09:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPi3384hIJUmYDYO2pgwjdEGaDjqPoPnERpOL82BtRro5gn96IZO94uo7p9t+UDNHVK/P2qg==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3b1fea8ef71mr3497589f8f.15.1751474446109;
        Wed, 02 Jul 2025 09:40:46 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.161.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52bbfsm16674212f8f.65.2025.07.02.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:40:45 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:40:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 5/8] vsock/virtio: Add vsock helper for linear SKB
 allocation
Message-ID: <vaq3g5wtt657w532itcpdwsvf742cglvuckiqcyueg7y72wtko@yg7swar2xnwh>
References: <20250701164507.14883-1-will@kernel.org>
 <20250701164507.14883-6-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701164507.14883-6-will@kernel.org>

On Tue, Jul 01, 2025 at 05:45:04PM +0100, Will Deacon wrote:
>In preparation for nonlinear allocations for large SKBs, introduce a
>new virtio_vsock_alloc_linear_skb() helper to return linear SKBs
>unconditionally and switch all callers over to this new interface for
>now.
>
>No functional change.
>
>Signed-off-by: Will Deacon <will@kernel.org>
>---
> drivers/vhost/vsock.c                   | 2 +-
> include/linux/virtio_vsock.h            | 6 ++++++
> net/vmw_vsock/virtio_transport.c        | 2 +-
> net/vmw_vsock/virtio_transport_common.c | 2 +-
> 4 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 66a0f060770e..b13f6be452ba 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -348,7 +348,7 @@ vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
> 		return NULL;
>
> 	/* len contains both payload and hdr */
>-	skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
>+	skb = virtio_vsock_alloc_linear_skb(len, GFP_KERNEL);
> 	if (!skb)
> 		return NULL;
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 1b5731186095..6d4a933c895a 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -70,6 +70,12 @@ static inline struct sk_buff *virtio_vsock_alloc_skb(unsigned int size, gfp_t ma
> 	return skb;
> }
>
>+static inline struct sk_buff *
>+virtio_vsock_alloc_linear_skb(unsigned int size, gfp_t mask)
>+{
>+	return virtio_vsock_alloc_skb(size, mask);

Why not just renaming virtio_vsock_alloc_skb in this patch?

In that way we are sure when building this patch we don't leave any 
"old" virtio_vsock_alloc_skb() around.

Thanks,
Stefano

>+}
>+
> static inline void
> virtio_vsock_skb_queue_head(struct sk_buff_head *list, struct sk_buff *skb)
> {
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 3daba06ed499..2959db0404ed 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -321,7 +321,7 @@ static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
> 	vq = vsock->vqs[VSOCK_VQ_RX];
>
> 	do {
>-		skb = virtio_vsock_alloc_skb(total_len, GFP_KERNEL);
>+		skb = virtio_vsock_alloc_linear_skb(total_len, GFP_KERNEL);
> 		if (!skb)
> 			break;
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 1b5d9896edae..c9eb7f7ac00d 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -261,7 +261,7 @@ static struct sk_buff *virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *
> 	if (!zcopy)
> 		skb_len += payload_len;
>
>-	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>+	skb = virtio_vsock_alloc_linear_skb(skb_len, GFP_KERNEL);
> 	if (!skb)
> 		return NULL;
>
>-- 
>2.50.0.727.gbf7dc18ff4-goog
>

