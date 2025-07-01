Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313571E5B9A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366717; cv=none; b=CJFlO9boCNODoRrLUm1EgFgCPBAlhC98jRaUjt3mbmC7++o75T8c33so1eyL0/s4mhHLTnFfkyEFHYKkWJKuOlvLg+eXXu8EvLPoktFOaL4LhCeKCR3EhbqGWzXRj8ia6QM+fl5KcBJUS+I3hkhOH6VmfwQVTf00WcsI7gKqmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366717; c=relaxed/simple;
	bh=yRYgHbSrAkuxw8GaLfZBFA+ZmVUCpG/7oEaKEc3z3Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zp5EDlwTcZsclPcIzK6BKOAElJIqVrVZ1RmeArkmhMDHKtDGAWRgY/A0iSruFd0JRzVjGrd0x6JCTow34VC21p/ycFc/5d5rQcg7e6bIEyB3PU66vIbD7Ei5Fllhio/tpqyBmTXXKIsFtwO8jQE+d3ZWk/j9FrUPrXCXUwnKpVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SIInkhvd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIInkhvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751366714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvtILH89149LI+zD04GPMfILWdmEwPt3/05vd+118lg=;
	b=SIInkhvd8XCgmYe3QlZ3mWk5L8IEfvPWSdKGUMuNdTWlNFmqu7Mouq8guMNkW+JNjZ/LWw
	Vf9IOYsOgBPC4/VVBcCxv2v40g+XEzeHfiE0O9GWy7631mbfz3QtezBwfCmc7tY+Khj58M
	2StYhPcCKW4cYsKReDTby7jI9WKOHiM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-lEza32_hOP6Lsg55Ivf4cA-1; Tue, 01 Jul 2025 06:45:12 -0400
X-MC-Unique: lEza32_hOP6Lsg55Ivf4cA-1
X-Mimecast-MFC-AGG-ID: lEza32_hOP6Lsg55Ivf4cA_1751366712
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b595320afso2177475b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366712; x=1751971512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvtILH89149LI+zD04GPMfILWdmEwPt3/05vd+118lg=;
        b=ZHoGLYbCnFCvdreqNbZzuXYOAAIYfSyOmWlmj0HdRuJXv6uWLxzUfO19ZleReT9R8J
         zK/qmR2CoJmSh/PsKVbYLlCERLnHh5m/qfw5OAj2SF7yfvxIly4viMr9TmyFwDx218/U
         /b4xtt7njQo5AnU0G0LD2DYci/sT9MCI30iBnwoIPx/r8U+saHP9UJTKwYzNGFWM8zK2
         a194u3XAIQzQ1U5jIKBz1/Y7eGnIlzu1kjXxSbVJSogF5QGPd552aCTKy8iaNNM7h9Pg
         LUr4ZVgCA8iRYLOgoRu/8XJ6A0rnhAMyBocxSj4Ez9TAhrip0H1eLuS+JEzJAIG6EnoU
         WSCg==
X-Gm-Message-State: AOJu0YzJyCc6yup5L+VdauSls+FKG7Q1r0P2DgR+PT7DF50BkwfEi4bX
	CV2jCAx8zIrHFYsI5y9e4Rf96cABrc3BNkWX+wrTcL+CmtpH4Atqj4Zy6SFOY+k9QBBlc0ZOkul
	KMvg01tkCBEt8mmy45c9eE0KqzVUSo3rwNMGLsUKFLD+dlMaT5oGNB6weRL6MPDkhMA==
X-Gm-Gg: ASbGnctNLSaKVq+OztF9zKWYvJjzHhTeKExF6nHTXKl4rkvNM00Tc+AO7/jbyjWW375
	NNuyKeSRrzA3/MOj7X2RZYttfKoEpGod15FAUby3dJ5lxruH9i/ugLU9EhDwI/k7Jup/e0//PWV
	vG1b/3a4E8OkpAn2rtH9W9hjw4IC0AkXebPSPpwOt9yDiohVnaRdo2H8X0Rd48iE1HsyKpeyPke
	x613tOib17QpmkMVe3KtJwSOzkPEGTiJUIIsyxHMW1mRS61JqDaS4KRzYFRaSZY9oYi9NASe6OG
	PfXeoKuu3pVz0bqfkZKXKiO3V7HQ
X-Received: by 2002:a05:6808:2202:b0:3fe:aecb:5c49 with SMTP id 5614622812f47-40b33e324abmr14762134b6e.21.1751366711683;
        Tue, 01 Jul 2025 03:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZqLNSFn4u/OltyPDVZCfPxB24s1GVT0ZUzyLOd0CNhrAGYaI9Si2fr1rfeL4ixA2goyWYoA==
X-Received: by 2002:a05:6808:2202:b0:3fe:aecb:5c49 with SMTP id 5614622812f47-40b33e324abmr14762107b6e.21.1751366711199;
        Tue, 01 Jul 2025 03:45:11 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b1d89sm2072981b6e.19.2025.07.01.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:45:10 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:44:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keir Fraser <keirf@google.com>, 
	Steven Moreland <smoreland@google.com>, Frederick Mayle <fmayle@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 3/5] vhost/vsock: Allocate nonlinear SKBs for handling
 large receive buffers
Message-ID: <6shb4fowdw43df7pod5kstmtynhrqigd3wdcyrqnni4svgfor2@dgiqw3t2zhfx>
References: <20250625131543.5155-1-will@kernel.org>
 <20250625131543.5155-4-will@kernel.org>
 <orht2imwke5xhnmeewxrbey3xbn2ivjzujksqnrtfe3cjtgrg2@6ls6dyexnkvc>
 <aGKdSVJTjg_vi-12@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aGKdSVJTjg_vi-12@willie-the-truck>

On Mon, Jun 30, 2025 at 03:20:57PM +0100, Will Deacon wrote:
>On Fri, Jun 27, 2025 at 12:45:45PM +0200, Stefano Garzarella wrote:
>> On Wed, Jun 25, 2025 at 02:15:41PM +0100, Will Deacon wrote:
>> > When receiving a packet from a guest, vhost_vsock_handle_tx_kick()
>> > calls vhost_vsock_alloc_skb() to allocate and fill an SKB with the
>> > receive data. Unfortunately, these are always linear allocations and can
>> > therefore result in significant pressure on kmalloc() considering that
>> > the maximum packet size (VIRTIO_VSOCK_MAX_PKT_BUF_SIZE +
>> > VIRTIO_VSOCK_SKB_HEADROOM) is a little over 64KiB, resulting in a 128KiB
>> > allocation for each packet.
>> >
>> > Rework the vsock SKB allocation so that, for sizes with page order
>> > greater than PAGE_ALLOC_COSTLY_ORDER, a nonlinear SKB is allocated
>> > instead with the packet header in the SKB and the receive data in the
>> > fragments.
>> >
>> > Signed-off-by: Will Deacon <will@kernel.org>
>> > ---
>> > drivers/vhost/vsock.c        | 15 +++++++++------
>> > include/linux/virtio_vsock.h | 31 +++++++++++++++++++++++++------
>> > 2 files changed, 34 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>> > index 66a0f060770e..cfa4e1bcf367 100644
>> > --- a/drivers/vhost/vsock.c
>> > +++ b/drivers/vhost/vsock.c
>> > @@ -344,11 +344,16 @@ vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
>> >
>> > 	len = iov_length(vq->iov, out);
>> >
>> > -	if (len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM)
>> > +	if (len < VIRTIO_VSOCK_SKB_HEADROOM ||
>>
>> Why moving this check here?
>
>I moved it here because virtio_vsock_alloc_skb_with_frags() does:
>
>+       size -= VIRTIO_VSOCK_SKB_HEADROOM;
>+       return __virtio_vsock_alloc_skb_with_frags(VIRTIO_VSOCK_SKB_HEADROOM,
>+                                                  size, mask);
>
>and so having the check in __virtio_vsock_alloc_skb_with_frags() looks
>strange as, by then, it really only applies to the linear case. It also
>feels weird to me to have the upper-bound of the length checked by the
>caller but the lower-bound checked in the callee. I certainly find it
>easier to reason about if they're in the same place.
>
>Additionally, the lower-bound check is only needed by the vhost receive
>code, as the transmit path uses virtio_vsock_alloc_skb(), which never
>passes a size smaller than VIRTIO_VSOCK_SKB_HEADROOM.
>
>Given all that, moving it to the one place that needs it seemed like the
>best option. What do you think?

Okay, I see now. Yep, it's fine, but please mention in the commit 
description.

>
>> > +	    len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE + VIRTIO_VSOCK_SKB_HEADROOM)
>> > 		return NULL;
>> >
>> > 	/* len contains both payload and hdr */
>> > -	skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
>> > +	if (len > SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
>> > +		skb = virtio_vsock_alloc_skb_with_frags(len, GFP_KERNEL);
>> > +	else
>> > +		skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
>>
>> Can we do this directly in virtio_vsock_alloc_skb() so we don't need
>> to duplicate code on virtio/vhost code?
>
>We can, but then I think we should do something different for the
>rx_fill() path -- it feels fragile to rely on that using small-enough
>buffers to guarantee linear allocations. How about I:
>
> 1. Add virtio_vsock_alloc_linear_skb(), which always performs a linear
>    allocation.
>
> 2. Change virtio_vsock_alloc_skb() to use nonlinear SKBs for sizes
>    greater than SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER)
>
> 3. Use virtio_vsock_alloc_linear_skb() to fill the guest RX buffers
>
> 4. Use virtio_vsock_alloc_skb() for everything else
>
>If you like the idea, I'll rework the series along those lines.
>Diff below... (see end of mail)

I really like it :-) let's go in that direction!

>
>> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>> > index 67ffb64325ef..8f9fa1cab32a 100644
>> > --- a/include/linux/virtio_vsock.h
>> > +++ b/include/linux/virtio_vsock.h
>> > @@ -51,27 +51,46 @@ static inline void virtio_vsock_skb_rx_put(struct sk_buff *skb)
>> > {
>> > 	u32 len;
>> >
>> > +	DEBUG_NET_WARN_ON_ONCE(skb->len);
>>
>> Should we mention in the commit message?
>
>Sure, I'll add something. The non-linear handling doesn't accumulate len,
>so it's a debug check to ensure that len hasn't been messed with between
>allocation and here.
>
>> > 	len = le32_to_cpu(virtio_vsock_hdr(skb)->len);
>> >
>> > -	if (len > 0)
>>
>> Why removing this check?
>
>I think it's redundant: len is a u32, so we're basically just checking
>to see if it's non-zero. All the callers have already checked for this
>but, even if they didn't, skb_put(skb, 0) is harmless afaict.

Yep, I see, but now I don't remember why we have it, could it be more
expensive to call `skb_put(skb, 0)`, instead of just having the if for
control packets with no payload?

Thanks,
Stefano

>
>Will
>
>--->8
>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 3799c0aeeec5..a6cd72a32f63 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -349,11 +349,7 @@ vhost_vsock_alloc_skb(struct vhost_virtqueue *vq,
> 		return NULL;
>
> 	/* len contains both payload and hdr */
>-	if (len > SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
>-		skb = virtio_vsock_alloc_skb_with_frags(len, GFP_KERNEL);
>-	else
>-		skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
>-
>+	skb = virtio_vsock_alloc_skb(len, GFP_KERNEL);
> 	if (!skb)
> 		return NULL;
>
>diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>index 0e265921be03..ed5eab46e3dc 100644
>--- a/include/linux/virtio_vsock.h
>+++ b/include/linux/virtio_vsock.h
>@@ -79,16 +79,19 @@ __virtio_vsock_alloc_skb_with_frags(unsigned int header_len,
> }
>
> static inline struct sk_buff *
>-virtio_vsock_alloc_skb_with_frags(unsigned int size, gfp_t mask)
>+virtio_vsock_alloc_linear_skb(unsigned int size, gfp_t mask)
> {
>-	size -= VIRTIO_VSOCK_SKB_HEADROOM;
>-	return __virtio_vsock_alloc_skb_with_frags(VIRTIO_VSOCK_SKB_HEADROOM,
>-						   size, mask);
>+	return __virtio_vsock_alloc_skb_with_frags(size, 0, mask);
> }
>
> static inline struct sk_buff *virtio_vsock_alloc_skb(unsigned int size, gfp_t mask)
> {
>-	return __virtio_vsock_alloc_skb_with_frags(size, 0, mask);
>+	if (size <= SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
>+		return virtio_vsock_alloc_linear_skb(size, mask);
>+
>+	size -= VIRTIO_VSOCK_SKB_HEADROOM;
>+	return __virtio_vsock_alloc_skb_with_frags(VIRTIO_VSOCK_SKB_HEADROOM,
>+						   size, mask);
> }
>
> static inline void
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4ae714397ca3..8c9ca0cb0d4e 100644
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
>index 424eb69e84f9..f74677c3511e 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -262,11 +262,7 @@ static struct sk_buff *virtio_transport_alloc_skb(struct virtio_vsock_pkt_info *
> 	if (!zcopy)
> 		skb_len += payload_len;
>
>-	if (skb_len > SKB_WITH_OVERHEAD(PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
>-		skb = virtio_vsock_alloc_skb_with_frags(skb_len, GFP_KERNEL);
>-	else
>-		skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
>-
>+	skb = virtio_vsock_alloc_skb(skb_len, GFP_KERNEL);
> 	if (!skb)
> 		return NULL;
>
>

