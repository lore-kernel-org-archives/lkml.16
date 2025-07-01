Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97001244688
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351343; cv=none; b=dan4z8E22HwOPipcvDRdLUOYqyEPdH6Pfb8aEB/I8hq6KudvI5wqVhVRRhCSx6QnzLZOQBoja0uRrEG0kPlTTRuZLjg9L5pHCf5ndiwSwIdk5KhOVAXFNXzeYabOLLOJ6PD8mLNgodLiXMJ5tTz3qskCmGpJ8fDyuUx4BEcilo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351343; c=relaxed/simple;
	bh=YZMuvV3UM5WIUus6l8kQTDjGFaH7kgLHpmsn5OnBZic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D42ZK5f1zLAGm83slQ/I9hd6ewqZCj/6wUOOkc1X1t30YTPZNtAmgMZflCIvRCpm9GByxe0qQUMYO6GBRT9bcasSBPYFay6Q1pk2/ne7g8oX096jRFw/V5ncvTQ6I7GLhMMdKlQU3LpFqVe/0I6KTVuYabk9VKoQr02KOEGkTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=agD2d+8e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="agD2d+8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751351339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hm4PT7AZrbhFKD8m6cOIMgjGeL8PlQ4UrUCoYuMGouA=;
	b=agD2d+8e8/gZZEviGw+Vl28/vNL3FW+6ypr2SwlnC9tLHOaOg1rEoEMdOISYRhLgIabRvG
	LRP7HEq0YLqHM+DitAogvpyLAKgssvoCgzNISv9sSI18h5A5v1FZSSBksplXv+PwvP1wck
	uZE6Opp2CAFRNddYSSEcvFeB8VZy6io=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-hEt_dan8P5SQguzgZBv1Mg-1; Tue, 01 Jul 2025 02:28:57 -0400
X-MC-Unique: hEt_dan8P5SQguzgZBv1Mg-1
X-Mimecast-MFC-AGG-ID: hEt_dan8P5SQguzgZBv1Mg_1751351336
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso29641325e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351336; x=1751956136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm4PT7AZrbhFKD8m6cOIMgjGeL8PlQ4UrUCoYuMGouA=;
        b=V+TUUWnf5yrPei7lCOfZFev/vPPt5e7dTdXVKPTuP94/oqww2Na5DB9BuwHnEbIej/
         RREOZqGWOF2VzRqw218bPUScoASyu/xJA1c0bSijtZ/n2BN2UHMkduvLUaFlxrzIsIXl
         ddl6lwK7lN3Xc+/RGLwWgmw4JAeDz1TwXqiyGjDOQnbi1mJSgHiWaYxBptIDUu0Qpc2z
         Jvziexqba1QPVmF6YRMzWVKdQjypLQTSVD44UVEgbeOnvQ1tOq/MXFb4Mo3QuHtv89sR
         Z5P8COAma+iVLHsfp4ZGt+qAYdkr90AJiY3AaLLhQQsDePNtVxHr1QPLn7El8Q82UjQ8
         PLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBT3IWDv69bRo3YR33JU48dGXrhj/j3RvmG0n0Oau3qqzikBR1sSVpQbaIZLuF1599VGeS2HvZ8ytw5ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCCjY/bZP4yNB9aB7iF6WOBEVo9grktiBThfytYcfT6y12LMr
	3rKKzzF7uHz3FR2RZra7rP4FmidazV2xWAlUonzMUzP6fdBphQeLd98C4/iPJJhtod/c/+5DTrN
	HhhZF5kE5stoxgzeKrVlsgSA94GDIkG3Wl0CDvDQKP8K00Tah6xq+XfTSip34TY699w==
X-Gm-Gg: ASbGncvR19s44l+yn0JBWIQX+F3y1FOFkmOA7PS3jFW9+cE4gRHR9pk77dwEpbO6pT3
	3fz43I6Lqm+zCbQjLqG1njYHGdxf+mI28SepWu5JyOHvNGMJpdfxh+AJ/qytexuAbebsyDeXMUi
	ycaRtsDlbCzrjqjxiknWwMGTsh7/Iee5BLlCQFHwK/6x7aANgn7phyRq7BjZMmummb4bQrSTIxG
	6E/FbB6ve4FyzUjKiHXDP1PgMg4OllL5Es6trLpf8rzDdNja2ysrtZs17zDPfRg4iMWzSamrr0d
	EmIf7TUqLWW/eRbQ
X-Received: by 2002:a05:600c:a11:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-453a78f0abamr20555825e9.7.1751351335850;
        Mon, 30 Jun 2025 23:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+wQLXcGkHR+Tjy7XAP1BMC5yyQNx7kNFkTSaeVnhEMBaBMGPDwFtWA8K+9bWa7SZ6RikfaA==
X-Received: by 2002:a05:600c:a11:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-453a78f0abamr20555555e9.7.1751351335319;
        Mon, 30 Jun 2025 23:28:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fada5sm12455887f8f.32.2025.06.30.23.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:28:54 -0700 (PDT)
Date: Tue, 1 Jul 2025 02:28:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 13/19] virtio_ring: introduce virtqueue ops
Message-ID: <20250701021229-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
 <20250616082518.10411-14-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616082518.10411-14-jasowang@redhat.com>

On Mon, Jun 16, 2025 at 04:25:11PM +0800, Jason Wang wrote:
> This patch introduces virtqueue ops which is a set of the callbacks
> that will be called for different queue layout or features. This would
> help to avoid branches for split/packed and will ease the future
> implementation like in order.
> 
> Note that in order to eliminate the indirect calls this patch uses
> global array of const ops to allow compiler to avoid indirect
> branches.
> 
> Tested with CONFIG_MITIGATION_RETPOLINE, no performance differences
> were noticed.
> 
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 172 ++++++++++++++++++++++++++---------
>  1 file changed, 129 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b14bbb4d6713..af32d1a1a1db 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -67,6 +67,12 @@
>  #define LAST_ADD_TIME_INVALID(vq)
>  #endif
>  
> +enum vq_layout {
> +	SPLIT = 0,
> +	PACKED,
> +	VQ_TYPE_MAX,
> +};
> +
>  struct vring_desc_state_split {
>  	void *data;			/* Data for callback. */
>  
> @@ -159,12 +165,28 @@ struct vring_virtqueue_packed {
>  	size_t event_size_in_bytes;
>  };
>  
> +struct vring_virtqueue;
> +
> +struct virtqueue_ops {
> +	int (*add)(struct vring_virtqueue *_vq, struct scatterlist *sgs[],
> +		   unsigned int total_sg, unsigned int out_sgs,
> +		   unsigned int in_sgs,	void *data,
> +		   void *ctx, bool premapped, gfp_t gfp);
> +	void *(*get)(struct vring_virtqueue *vq, unsigned int *len, void **ctx);
> +	bool (*kick_prepare)(struct vring_virtqueue *vq);
> +	void (*disable_cb)(struct vring_virtqueue *vq);
> +	bool (*enable_cb_delayed)(struct vring_virtqueue *vq);
> +	unsigned int (*enable_cb_prepare)(struct vring_virtqueue *vq);
> +	bool (*poll)(const struct vring_virtqueue *vq, u16 last_used_idx);
> +	void *(*detach_unused_buf)(struct vring_virtqueue *vq);
> +	bool (*more_used)(const struct vring_virtqueue *vq);
> +	int (*resize)(struct vring_virtqueue *vq, u32 num);
> +	void (*reset)(struct vring_virtqueue *vq);
> +};
> +
>  struct vring_virtqueue {
>  	struct virtqueue vq;
>  
> -	/* Is this a packed ring? */
> -	bool packed_ring;
> -
>  	/* Is DMA API used? */
>  	bool use_dma_api;
>  
> @@ -180,6 +202,8 @@ struct vring_virtqueue {
>  	/* Host publishes avail event idx */
>  	bool event;
>  
> +	enum vq_layout layout;
> +
>  	/* Head of free buffer list. */
>  	unsigned int free_head;
>  	/* Number we've added since last sync. */
> @@ -232,6 +256,12 @@ static void vring_free(struct virtqueue *_vq);
>  
>  #define to_vvq(_vq) container_of_const(_vq, struct vring_virtqueue, vq)
>  
> +

Why two empty lines?

> +static inline bool virtqueue_is_packed(const struct vring_virtqueue *vq)
> +{
> +	return vq->layout == PACKED;
> +}
> +

So why still have this?
Let's replace all uses with a per layout
callback. None of them seem to be on the data path.
Well, with one exception - there is
	> @@ -2921,7 +3006,7 @@ u32 vring_notification_data(struct virtqueue *_vq)
	>       struct vring_virtqueue *vq = to_vvq(_vq);
	>       u16 next;
	>  
	> -     if (vq->packed_ring)
	> +     if (virtqueue_is_packed(vq))
	>               next = (vq->packed.next_avail_idx &
	>                               ~(-(1 << VRING_PACKED_EVENT_F_WRAP_CTR))) |
	>                       vq->packed.avail_wrap_counter <<

I think it's the only one? Are we trying to save a function call there?
I am fine to keep it as in this patch, or if we do change it,
maybe with a separate patch, so if there is a regression we can bisect
more easily.




For example, for the chunk below, we could have:
	.init_last_used

having said that, this patchset is already big, so let us do it with a separate patch -
but if so, the way to split would be in patch 1 to just leave vq->packed_ring
in place, gradually replace call sites, and in patch N drop
vq->packed_ring.


>  static bool virtqueue_use_indirect(const struct vring_virtqueue *vq,
>  				   unsigned int total_sg)
>  {
> @@ -422,7 +452,7 @@ static void virtqueue_init(struct vring_virtqueue *vq, u32 num)
>  {
>  	vq->vq.num_free = num;
>  
> -	if (vq->packed_ring)
> +	if (virtqueue_is_packed(vq))
>  		vq->last_used_idx = 0 | (1 << VRING_PACKED_EVENT_F_WRAP_CTR);
>  	else
>  		vq->last_used_idx = 0;
> @@ -1116,6 +1146,8 @@ static int vring_alloc_queue_split(struct vring_virtqueue_split *vring_split,
>  	return 0;
>  }
>  
> +static const struct virtqueue_ops split_ops;
> +
>  static struct virtqueue *__vring_new_virtqueue_split(unsigned int index,
>  					       struct vring_virtqueue_split *vring_split,
>  					       struct virtio_device *vdev,
> @@ -1133,7 +1165,7 @@ static struct virtqueue *__vring_new_virtqueue_split(unsigned int index,
>  	if (!vq)
>  		return NULL;
>  
> -	vq->packed_ring = false;
> +	vq->layout = SPLIT;
>  	vq->vq.callback = callback;
>  	vq->vq.vdev = vdev;
>  	vq->vq.name = name;
> @@ -2076,6 +2108,8 @@ static void virtqueue_reset_packed(struct vring_virtqueue *vq)
>  	virtqueue_vring_init_packed(&vq->packed, !!vq->vq.callback);
>  }
>  
> +static const struct virtqueue_ops packed_ops;
> +
>  static struct virtqueue *__vring_new_virtqueue_packed(unsigned int index,
>  					       struct vring_virtqueue_packed *vring_packed,
>  					       struct virtio_device *vdev,
> @@ -2106,7 +2140,7 @@ static struct virtqueue *__vring_new_virtqueue_packed(unsigned int index,
>  #else
>  	vq->broken = false;
>  #endif
> -	vq->packed_ring = true;
> +	vq->layout = PACKED;
>  	vq->dma_dev = dma_dev;
>  	vq->use_dma_api = vring_use_dma_api(vdev);
>  
> @@ -2194,6 +2228,39 @@ static int virtqueue_resize_packed(struct vring_virtqueue *vq, u32 num)
>  	return -ENOMEM;
>  }
>  
> +static const struct virtqueue_ops split_ops = {
> +	.add = virtqueue_add_split,
> +	.get = virtqueue_get_buf_ctx_split,
> +	.kick_prepare = virtqueue_kick_prepare_split,
> +	.disable_cb = virtqueue_disable_cb_split,
> +	.enable_cb_delayed = virtqueue_enable_cb_delayed_split,
> +	.enable_cb_prepare = virtqueue_enable_cb_prepare_split,
> +	.poll = virtqueue_poll_split,
> +	.detach_unused_buf = virtqueue_detach_unused_buf_split,
> +	.more_used = more_used_split,
> +	.resize = virtqueue_resize_split,
> +	.reset = virtqueue_reset_split,
> +};
> +
> +static const struct virtqueue_ops packed_ops = {
> +	.add = virtqueue_add_packed,
> +	.get = virtqueue_get_buf_ctx_packed,
> +	.kick_prepare = virtqueue_kick_prepare_packed,
> +	.disable_cb = virtqueue_disable_cb_packed,
> +	.enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
> +	.enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
> +	.poll = virtqueue_poll_packed,
> +	.detach_unused_buf = virtqueue_detach_unused_buf_packed,
> +	.more_used = more_used_packed,
> +	.resize = virtqueue_resize_packed,
> +	.reset = virtqueue_reset_packed,
> +};
> +
> +static const struct virtqueue_ops *const all_ops[VQ_TYPE_MAX] = {
> +	[SPLIT] = &split_ops,
> +	[PACKED] = &packed_ops
> +};
> +
>  static int virtqueue_disable_and_recycle(struct virtqueue *_vq,
>  					 void (*recycle)(struct virtqueue *vq, void *buf))
>  {
> @@ -2236,6 +2303,38 @@ static int virtqueue_enable_after_reset(struct virtqueue *_vq)
>   * Generic functions and exported symbols.
>   */
>  
> +#define VIRTQUEUE_CALL(vq, op, ...)					\
> +	({								\
> +	typeof(all_ops[SPLIT]->op(vq, ##__VA_ARGS__)) ret;		\

we need an empty line here, after the declaration.

> +	switch (vq->layout) {						\
> +	case SPLIT:							\
> +		ret = all_ops[SPLIT]->op(vq, ##__VA_ARGS__);		\
> +		break;							\
> +	case PACKED:							\
> +		ret = all_ops[PACKED]->op(vq, ##__VA_ARGS__);		\
> +		break;							\
> +	default:							\
> +		BUG();							\
> +		break;							\
> +	}								\
> +	ret;								\
> +})
> +
> +#define VOID_VIRTQUEUE_CALL(vq, op, ...)		  \
> +	({						  \
> +        switch ((vq)->layout) {				  \
> +        case SPLIT:					  \
> +                all_ops[SPLIT]->op(vq, ##__VA_ARGS__);    \
> +                break;					  \
> +        case PACKED:					  \
> +                all_ops[PACKED]->op(vq, ##__VA_ARGS__);   \
> +                break;					  \
> +        default:					  \
> +                BUG();					  \
> +                break;					  \
> +        }						  \
> +})
> +
>  static inline int virtqueue_add(struct virtqueue *_vq,
>  				struct scatterlist *sgs[],
>  				unsigned int total_sg,
> @@ -2248,10 +2347,9 @@ static inline int virtqueue_add(struct virtqueue *_vq,
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	return vq->packed_ring ? virtqueue_add_packed(vq, sgs, total_sg,
> -					out_sgs, in_sgs, data, ctx, premapped, gfp) :
> -				 virtqueue_add_split(vq, sgs, total_sg,
> -					out_sgs, in_sgs, data, ctx, premapped, gfp);
> +	return VIRTQUEUE_CALL(vq, add, sgs, total_sg,
> +			      out_sgs, in_sgs, data,
> +			      ctx, premapped, gfp);
>  }
>  
>  /**
> @@ -2437,8 +2535,7 @@ bool virtqueue_kick_prepare(struct virtqueue *_vq)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	return vq->packed_ring ? virtqueue_kick_prepare_packed(vq) :
> -				 virtqueue_kick_prepare_split(vq);
> +	return VIRTQUEUE_CALL(vq, kick_prepare);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_kick_prepare);
>  
> @@ -2508,8 +2605,7 @@ void *virtqueue_get_buf_ctx(struct virtqueue *_vq, unsigned int *len,
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	return vq->packed_ring ? virtqueue_get_buf_ctx_packed(vq, len, ctx) :
> -				 virtqueue_get_buf_ctx_split(vq, len, ctx);
> +	return VIRTQUEUE_CALL(vq, get, len, ctx);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_get_buf_ctx);
>  
> @@ -2531,10 +2627,7 @@ void virtqueue_disable_cb(struct virtqueue *_vq)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	if (vq->packed_ring)
> -		virtqueue_disable_cb_packed(vq);
> -	else
> -		virtqueue_disable_cb_split(vq);
> +	VOID_VIRTQUEUE_CALL(vq, disable_cb);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_disable_cb);
>  
> @@ -2557,8 +2650,7 @@ unsigned int virtqueue_enable_cb_prepare(struct virtqueue *_vq)
>  	if (vq->event_triggered)
>  		vq->event_triggered = false;
>  
> -	return vq->packed_ring ? virtqueue_enable_cb_prepare_packed(vq) :
> -				 virtqueue_enable_cb_prepare_split(vq);
> +	return VIRTQUEUE_CALL(vq, enable_cb_prepare);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_enable_cb_prepare);
>  
> @@ -2579,8 +2671,8 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned int last_used_idx)
>  		return false;
>  
>  	virtio_mb(vq->weak_barriers);
> -	return vq->packed_ring ? virtqueue_poll_packed(vq, last_used_idx) :
> -				 virtqueue_poll_split(vq, last_used_idx);
> +
> +	return VIRTQUEUE_CALL(vq, poll, last_used_idx);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_poll);
>  
> @@ -2623,8 +2715,7 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
>  	if (vq->event_triggered)
>  		data_race(vq->event_triggered = false);
>  
> -	return vq->packed_ring ? virtqueue_enable_cb_delayed_packed(vq) :
> -				 virtqueue_enable_cb_delayed_split(vq);
> +	return VIRTQUEUE_CALL(vq, enable_cb_delayed);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
>  
> @@ -2640,14 +2731,13 @@ void *virtqueue_detach_unused_buf(struct virtqueue *_vq)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	return vq->packed_ring ? virtqueue_detach_unused_buf_packed(vq) :
> -				 virtqueue_detach_unused_buf_split(vq);
> +	return VIRTQUEUE_CALL(vq, detach_unused_buf);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_detach_unused_buf);
>  
>  static inline bool more_used(const struct vring_virtqueue *vq)
>  {
> -	return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
> +	return VIRTQUEUE_CALL(vq, more_used);
>  }
>  
>  /**
> @@ -2776,7 +2866,8 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>  	if (!num)
>  		return -EINVAL;
>  
> -	if ((vq->packed_ring ? vq->packed.vring.num : vq->split.vring.num) == num)
> +	if ((virtqueue_is_packed(vq) ? vq->packed.vring.num :
> +			               vq->split.vring.num) == num)
>  		return 0;
>  
>  	err = virtqueue_disable_and_recycle(_vq, recycle);
> @@ -2785,10 +2876,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>  	if (recycle_done)
>  		recycle_done(_vq);
>  
> -	if (vq->packed_ring)
> -		err = virtqueue_resize_packed(vq, num);
> -	else
> -		err = virtqueue_resize_split(vq, num);
> +	err = VIRTQUEUE_CALL(vq, resize, num);
>  
>  	return virtqueue_enable_after_reset(_vq);
>  }
> @@ -2822,10 +2910,7 @@ int virtqueue_reset(struct virtqueue *_vq,
>  	if (recycle_done)
>  		recycle_done(_vq);
>  
> -	if (vq->packed_ring)
> -		virtqueue_reset_packed(vq);
> -	else
> -		virtqueue_reset_split(vq);
> +	VOID_VIRTQUEUE_CALL(vq, reset);
>  
>  	return virtqueue_enable_after_reset(_vq);
>  }
> @@ -2867,7 +2952,7 @@ static void vring_free(struct virtqueue *_vq)
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
>  	if (vq->we_own_ring) {
> -		if (vq->packed_ring) {
> +		if (virtqueue_is_packed(vq)) {
>  			vring_free_queue(vq->vq.vdev,
>  					 vq->packed.ring_size_in_bytes,
>  					 vq->packed.vring.desc,
> @@ -2896,7 +2981,7 @@ static void vring_free(struct virtqueue *_vq)
>  					 vring_dma_dev(vq));
>  		}
>  	}
> -	if (!vq->packed_ring) {
> +	if (!virtqueue_is_packed(vq)) {
>  		kfree(vq->split.desc_state);
>  		kfree(vq->split.desc_extra);
>  	}
> @@ -2921,7 +3006,7 @@ u32 vring_notification_data(struct virtqueue *_vq)
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  	u16 next;
>  
> -	if (vq->packed_ring)
> +	if (virtqueue_is_packed(vq))
>  		next = (vq->packed.next_avail_idx &
>  				~(-(1 << VRING_PACKED_EVENT_F_WRAP_CTR))) |
>  			vq->packed.avail_wrap_counter <<
> @@ -2974,7 +3059,8 @@ unsigned int virtqueue_get_vring_size(const struct virtqueue *_vq)
>  
>  	const struct vring_virtqueue *vq = to_vvq(_vq);
>  
> -	return vq->packed_ring ? vq->packed.vring.num : vq->split.vring.num;
> +	return virtqueue_is_packed(vq) ? vq->packed.vring.num :
> +				      vq->split.vring.num;
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_get_vring_size);
>  
> @@ -3057,7 +3143,7 @@ dma_addr_t virtqueue_get_desc_addr(const struct virtqueue *_vq)
>  
>  	BUG_ON(!vq->we_own_ring);
>  
> -	if (vq->packed_ring)
> +	if (virtqueue_is_packed(vq))
>  		return vq->packed.ring_dma_addr;
>  
>  	return vq->split.queue_dma_addr;
> @@ -3070,7 +3156,7 @@ dma_addr_t virtqueue_get_avail_addr(const struct virtqueue *_vq)
>  
>  	BUG_ON(!vq->we_own_ring);
>  
> -	if (vq->packed_ring)
> +	if (virtqueue_is_packed(vq))
>  		return vq->packed.driver_event_dma_addr;
>  
>  	return vq->split.queue_dma_addr +
> @@ -3084,7 +3170,7 @@ dma_addr_t virtqueue_get_used_addr(const struct virtqueue *_vq)
>  
>  	BUG_ON(!vq->we_own_ring);
>  
> -	if (vq->packed_ring)
> +	if (virtqueue_is_packed(vq))
>  		return vq->packed.device_event_dma_addr;
>  
>  	return vq->split.queue_dma_addr +
> -- 
> 2.34.1

