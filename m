Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50C14AA9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232651; cv=none; b=Ql0UVDljvIt5gZKHzp7N7iT+SwliR8mp9y+Z/QVhp64GE3yut6UlpSo0Pm2/svpTMu0DTdAE1eQ/jp777Nl+aMqn2Ot3C2C3ZwllHEFsYZSS6rFuHI4K9vSRGC574D3m2DbtqDH4gDdY48HRlRYFxAdc1D8Izq0NxB8FiBMO4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232651; c=relaxed/simple;
	bh=jRwuRrrTCabrLXR5nK65DU52KireBDpWyg3rTnHBsXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3Ro9l1z+G5DIrJL1+3hpoVEhq6PrGWJUyYw20ErPbcIXUDb7xlWCRDsthn7vKWwahlOyqMTE/xwn568coq6oqZvqi8xG+WYB/Lk6Jr2nvDk8o6n2Rp3Kg01mSutCU6lUK32tcPV1j/09G5nI5x9hChT2QF5o0TiSwtakp5pCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iMI+frIo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iMI+frIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747232648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyCOtB24ixkIl32uE7kGZxv0yIxNarYRQnAXtJCM+nw=;
	b=iMI+frIoUicgWPHSOGeVYiWHDKI28szn4VI8z9DmFD79iO4PZCggB4950dt3A8/xDuTXp7
	LJ7XBgPQ/9c9NzdORZ+ofxuNsPekHuG4Au3ZB76/MP7ULhbKVS6ksixqqpmBKCn1iigAMG
	q+srXsbwlxQNaofP9VBFxcvLS6wPozo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-MHtAwbtfM5-xDfuENu207g-1; Wed, 14 May 2025 10:24:07 -0400
X-MC-Unique: MHtAwbtfM5-xDfuENu207g-1
X-Mimecast-MFC-AGG-ID: MHtAwbtfM5-xDfuENu207g_1747232646
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so32156705e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232645; x=1747837445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyCOtB24ixkIl32uE7kGZxv0yIxNarYRQnAXtJCM+nw=;
        b=K71WMFIrxhUN+eA2LJGMGe3mxTj5TUX16cf4FnI89TaT6Z8xNrDpd7/OEYdyAUlMgN
         aQhRbVys9Bkd6fmyshY29i319YH7HoCOuLNIrDBsPuxhWpMakD84QcpSqvND7IfNLK4R
         +zufDNhL5ymosT46r3ozAHksbI/JmBGGxNAt8LI9rMKiLC/VzGT7P5U55lZ1Wrgbx6pe
         c491vfD4EqJJ21V/izBTbpOb9gdN9jR2Yv9bS5nisj2oFCXVcIqfQd9xkDzLNz5dEWoe
         jMU4debINQRdAa1rb7cSyo+yFPfPygiVPUTl2m58hSExP1SYQQx3WE0P8+vpNH8e6aEL
         GRQA==
X-Forwarded-Encrypted: i=1; AJvYcCXxyTy6ydwM1rFOPMZcZ756bBCTAAoV8Qob7UkWhgT9wxhPBFUDTQ1NizV4art09QRG9d+ORgOmulT3utU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvGu/U+P3PnJ/32LzYleXp7nl3vUskTlzt3cgLaQvsVoQ8bnfj
	VVuY0hGe1WtcwVGa9zyh+EKLtYhkouLllTRY4jvaZ0bMKFl9jnBvaazyzII6mzUFmSvrF3+4m3k
	Amc+cUdMV/tJfeIhwvxR+sZa1Ah7CRfN0JzFNHGk806s9B+gcjq4R4z5C4btqqt326cSK1g==
X-Gm-Gg: ASbGnctbHqfVZeFnywnUVfTj0aPe2TJlcJakHmqPA6tUHA2I9QYUd8cLTepWk27D6hz
	DlgB96mxxmUdFZsFJvKWhamq76v5H5tHz5qrRgeN2sBXpNvaP9RP2x4XSIMQo1gAfbIKsKiGLA5
	oDfV7UUw5MvgtTD0/KcOLOHDMunaeWh6AibC2NseP5YpLASbWQ4pPUIdbjxeWZA7TK9LVtdbVVo
	ozDcWi2sbDLx0AdZEiFKSYLKbeRsvPs/CcTzz9V77Os8frdyYlgNNHLP/x/0M+5BM+8fB4DST4Y
	uHt8zg==
X-Received: by 2002:a05:600c:3d0c:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-442f20db8admr32375835e9.8.1747232645002;
        Wed, 14 May 2025 07:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWRau8VqR5bDsegRwb6K4TgHjJ6ljWBTyIRcHHiCJHyWHUq1GROX/o0FzmWevGT3309GC1/w==
X-Received: by 2002:a05:600c:3d0c:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-442f20db8admr32375695e9.8.1747232644587;
        Wed, 14 May 2025 07:24:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db8asm33854585e9.9.2025.05.14.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:24:04 -0700 (PDT)
Date: Wed, 14 May 2025 10:24:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/19] virtio_ring: introduce virtqueue ops
Message-ID: <20250514102109-mutt-send-email-mst@kernel.org>
References: <20250324054333.1954-1-jasowang@redhat.com>
 <20250324060127.2358-1-jasowang@redhat.com>
 <20250407041729-mutt-send-email-mst@kernel.org>
 <CACGkMEv-=V0a7jpR9e-i=Oe+PE9pN_cH3yDBmyOYhwPcJXOHPQ@mail.gmail.com>
 <20250408073317-mutt-send-email-mst@kernel.org>
 <CACGkMEtmDM4_ZbAi4O8OUwZaPZnGLKEhnXkQGStFmeXETJtpkA@mail.gmail.com>
 <20250514091029-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514091029-mutt-send-email-mst@kernel.org>

On Wed, May 14, 2025 at 10:19:05AM -0400, Michael S. Tsirkin wrote:
> On Wed, Apr 09, 2025 at 12:06:03PM +0800, Jason Wang wrote:
> > On Tue, Apr 8, 2025 at 7:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 03:02:35PM +0800, Jason Wang wrote:
> > > > On Mon, Apr 7, 2025 at 4:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Mar 24, 2025 at 02:01:21PM +0800, Jason Wang wrote:
> > > > > > This patch introduces virtqueue ops which is a set of the callbacks
> > > > > > that will be called for different queue layout or features. This would
> > > > > > help to avoid branches for split/packed and will ease the future
> > > > > > implementation like in order.
> > > > > >
> > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > > ---
> > > > > >  drivers/virtio/virtio_ring.c | 96 +++++++++++++++++++++++++-----------
> > > > > >  1 file changed, 67 insertions(+), 29 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > index a2884eae14d9..ce1dc90ee89d 100644
> > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > @@ -159,9 +159,30 @@ struct vring_virtqueue_packed {
> > > > > >       size_t event_size_in_bytes;
> > > > > >  };
> > > > > >
> > > > > > +struct vring_virtqueue;
> > > > > > +
> > > > > > +struct virtqueue_ops {
> > > > > > +     int (*add)(struct vring_virtqueue *_vq, struct scatterlist *sgs[],
> > > > > > +                unsigned int total_sg, unsigned int out_sgs,
> > > > > > +                unsigned int in_sgs, void *data,
> > > > > > +                void *ctx, bool premapped, gfp_t gfp);
> > > > > > +     void *(*get)(struct vring_virtqueue *vq, unsigned int *len, void **ctx);
> > > > > > +     bool (*kick_prepare)(struct vring_virtqueue *vq);
> > > > > > +     void (*disable_cb)(struct vring_virtqueue *vq);
> > > > > > +     bool (*enable_cb_delayed)(struct vring_virtqueue *vq);
> > > > > > +     unsigned int (*enable_cb_prepare)(struct vring_virtqueue *vq);
> > > > > > +     bool (*poll)(const struct vring_virtqueue *vq, u16 last_used_idx);
> > > > > > +     void *(*detach_unused_buf)(struct vring_virtqueue *vq);
> > > > > > +     bool (*more_used)(const struct vring_virtqueue *vq);
> > > > > > +     int (*resize)(struct vring_virtqueue *vq, u32 num);
> > > > > > +     void (*reset)(struct vring_virtqueue *vq);
> > > > > > +};
> > > > >
> > > > > I like it that it's organized but
> > > > > I worry about the overhead of indirect calls here.
> > > >
> > > > We can switch to use INDIRECT_CALL_X() here
> > >
> > > If you think it's cleaner.. but INDIRECT_CALL is all chained
> > 
> > Yes, and it would be problematic as the number of ops increased.
> > 
> > > while a switch can do a binary search.
> > >
> > 
> > Do you mean a nested switch?
> 
> Not sure what is nested. gcc does a decent job of optimizing
> switches. You have 4 types of ops:
> packed/packed in order/split/split in order
> 
> So:
> 
> enum {
> 	VQ_SPLIT,
> 	VQ_SPLIT_IN_ORDER,
> 	VQ_PACKED,
> 	VQ_PACKED_IN_ORDER,
> }
> 
> 
> I do not see how it is worse?
> 
> 



Actually, here is an idea - create an array of ops:



enum vqtype {
        SPLIT,
        SPLIT_IN_ORDER,
        PACKED,
        PACKED_IN_ORDER,
        MAX
};


struct ops {
        int (*add)(int bar);
};

extern int packed(int);
extern int packedinorder(int);
extern int split(int);
extern int splitinorder(int);

const struct ops allops[MAX] = { [SPLIT] = {split}, [SPLIT_IN_ORDER] = { splitinorder}, [PACKED] = { packed }, [PACKED_IN_ORDER] = {packedinorder}};

int main(int argc, char **argv)
{
        switch (argc) {
                case 0:
			return allops[PACKED].foo(argc);
                case 1:
			return allops[SPLIT].foo(argc);
                default:
			return allops[PACKED_IN_ORDER].foo(argc);
        }
}


I tested this and compiler is able to elide the indirect calls.




















> 
> 
> 
> 
> 
> 
> > >
> > > > (but I'm not sure we
> > > > should worry about it too much as ndo_ops or qdiscs doesn't use that).
> > >
> > >
> > > And that's why we ended up with xdp, no? the stack's too heavy ...
> > >
> > > > > How about a switch statement instead?
> > > > >
> > > > > struct vring_virtqueue {
> > > > >         enum vring_virtqueue_ops ops;
> > > > >
> > > > > }
> > > > >
> > > > >
> > > > > @@ -2248,10 +2303,8 @@ static inline int virtqueue_add(struct virtqueue *_vq,
> > > > >  {
> > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > >
> > > > >         switch (vq->ops) {
> > > > >          VQ_PACKED:
> > > > >          VQ_SPLIT:
> > > > >          VQ_IN_ORDER:
> > > > >         }
> > > > >
> > > > >
> > > > > }
> > > > >
> > > > >
> > > > > What do you think?
> > > >
> > > > Actually, the matrix will be 2*2:
> > > >
> > > > PACKED, SPLIT, PACKED_IN_ORDER, SPLIT_IN_ORDER
> > >
> > > Confused. Same amount of enums as ops structures in your approach, no?
> > 
> > I meant in this series, we will have 4 ops not 3.
> > 
> > >
> > >
> > > > And will be doubled if a new layout is implemented.
> > > >
> > > > If we open them such a switch will spread in a lot of places in the code.
> > > >
> > > > Thanks
> > 
> > Thanks
> > 
> > > >
> > > > >
> > > > >
> > > > >
> > > > > > +
> > > > > >  struct vring_virtqueue {
> > > > > >       struct virtqueue vq;
> > > > > >
> > > > > > +     struct virtqueue_ops *ops;
> > > > > > +
> > > > > >       /* Is this a packed ring? */
> > > > > >       bool packed_ring;
> > > > > >
> > > > > > @@ -1116,6 +1137,8 @@ static int vring_alloc_queue_split(struct vring_virtqueue_split *vring_split,
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +struct virtqueue_ops split_ops;
> > > > > > +
> > > > > >  static struct virtqueue *__vring_new_virtqueue_split(unsigned int index,
> > > > > >                                              struct vring_virtqueue_split *vring_split,
> > > > > >                                              struct virtio_device *vdev,
> > > > > > @@ -1134,6 +1157,7 @@ static struct virtqueue *__vring_new_virtqueue_split(unsigned int index,
> > > > > >               return NULL;
> > > > > >
> > > > > >       vq->packed_ring = false;
> > > > > > +     vq->ops = &split_ops;
> > > > > >       vq->vq.callback = callback;
> > > > > >       vq->vq.vdev = vdev;
> > > > > >       vq->vq.name = name;
> > > > > > @@ -2076,6 +2100,8 @@ static void virtqueue_reset_packed(struct vring_virtqueue *vq)
> > > > > >       virtqueue_vring_init_packed(&vq->packed, !!vq->vq.callback);
> > > > > >  }
> > > > > >
> > > > > > +struct virtqueue_ops packed_ops;
> > > > > > +
> > > > > >  static struct virtqueue *__vring_new_virtqueue_packed(unsigned int index,
> > > > > >                                              struct vring_virtqueue_packed *vring_packed,
> > > > > >                                              struct virtio_device *vdev,
> > > > > > @@ -2107,6 +2133,7 @@ static struct virtqueue *__vring_new_virtqueue_packed(unsigned int index,
> > > > > >       vq->broken = false;
> > > > > >  #endif
> > > > > >       vq->packed_ring = true;
> > > > > > +     vq->ops = &packed_ops;
> > > > > >       vq->dma_dev = dma_dev;
> > > > > >       vq->use_dma_api = vring_use_dma_api(vdev);
> > > > > >
> > > > > > @@ -2194,6 +2221,34 @@ static int virtqueue_resize_packed(struct vring_virtqueue *vq, u32 num)
> > > > > >       return -ENOMEM;
> > > > > >  }
> > > > > >
> > > > > > +struct virtqueue_ops split_ops = {
> > > > > > +     .add = virtqueue_add_split,
> > > > > > +     .get = virtqueue_get_buf_ctx_split,
> > > > > > +     .kick_prepare = virtqueue_kick_prepare_split,
> > > > > > +     .disable_cb = virtqueue_disable_cb_split,
> > > > > > +     .enable_cb_delayed = virtqueue_enable_cb_delayed_split,
> > > > > > +     .enable_cb_prepare = virtqueue_enable_cb_prepare_split,
> > > > > > +     .poll = virtqueue_poll_split,
> > > > > > +     .detach_unused_buf = virtqueue_detach_unused_buf_split,
> > > > > > +     .more_used = more_used_split,
> > > > > > +     .resize = virtqueue_resize_split,
> > > > > > +     .reset = virtqueue_reset_split,
> > > > > > +};
> > > > > > +
> > > > > > +struct virtqueue_ops packed_ops = {
> > > > > > +     .add = virtqueue_add_packed,
> > > > > > +     .get = virtqueue_get_buf_ctx_packed,
> > > > > > +     .kick_prepare = virtqueue_kick_prepare_packed,
> > > > > > +     .disable_cb = virtqueue_disable_cb_packed,
> > > > > > +     .enable_cb_delayed = virtqueue_enable_cb_delayed_packed,
> > > > > > +     .enable_cb_prepare = virtqueue_enable_cb_prepare_packed,
> > > > > > +     .poll = virtqueue_poll_packed,
> > > > > > +     .detach_unused_buf = virtqueue_detach_unused_buf_packed,
> > > > > > +     .more_used = more_used_packed,
> > > > > > +     .resize = virtqueue_resize_packed,
> > > > > > +     .reset = virtqueue_reset_packed,
> > > > > > +};
> > > > > > +
> > > > > >  static int virtqueue_disable_and_recycle(struct virtqueue *_vq,
> > > > > >                                        void (*recycle)(struct virtqueue *vq, void *buf))
> > > > > >  {
> > > > > > @@ -2248,10 +2303,8 @@ static inline int virtqueue_add(struct virtqueue *_vq,
> > > > > >  {
> > > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_add_packed(vq, sgs, total_sg,
> > > > > > -                                     out_sgs, in_sgs, data, ctx, premapped, gfp) :
> > > > > > -                              virtqueue_add_split(vq, sgs, total_sg,
> > > > > > -                                     out_sgs, in_sgs, data, ctx, premapped, gfp);
> > > > > > +     return vq->ops->add(vq, sgs, total_sg,
> > > > > > +                         out_sgs, in_sgs, data, ctx, premapped, gfp);
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -2437,8 +2490,7 @@ bool virtqueue_kick_prepare(struct virtqueue *_vq)
> > > > > >  {
> > > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_kick_prepare_packed(vq) :
> > > > > > -                              virtqueue_kick_prepare_split(vq);
> > > > > > +     return vq->ops->kick_prepare(vq);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_kick_prepare);
> > > > > >
> > > > > > @@ -2508,8 +2560,7 @@ void *virtqueue_get_buf_ctx(struct virtqueue *_vq, unsigned int *len,
> > > > > >  {
> > > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_get_buf_ctx_packed(vq, len, ctx) :
> > > > > > -                              virtqueue_get_buf_ctx_split(vq, len, ctx);
> > > > > > +     return vq->ops->get(vq, len, ctx);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_get_buf_ctx);
> > > > > >
> > > > > > @@ -2531,10 +2582,7 @@ void virtqueue_disable_cb(struct virtqueue *_vq)
> > > > > >  {
> > > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > >
> > > > > > -     if (vq->packed_ring)
> > > > > > -             virtqueue_disable_cb_packed(vq);
> > > > > > -     else
> > > > > > -             virtqueue_disable_cb_split(vq);
> > > > > > +     return vq->ops->disable_cb(vq);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_disable_cb);
> > > > > >
> > > > > > @@ -2557,8 +2605,7 @@ unsigned int virtqueue_enable_cb_prepare(struct virtqueue *_vq)
> > > > > >       if (vq->event_triggered)
> > > > > >               vq->event_triggered = false;
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_enable_cb_prepare_packed(vq) :
> > > > > > -                              virtqueue_enable_cb_prepare_split(vq);
> > > > > > +     return vq->ops->enable_cb_prepare(vq);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_enable_cb_prepare);
> > > > > >
> > > > > > @@ -2579,8 +2626,7 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned int last_used_idx)
> > > > > >               return false;
> > > > > >
> > > > > >       virtio_mb(vq->weak_barriers);
> > > > > > -     return vq->packed_ring ? virtqueue_poll_packed(vq, last_used_idx) :
> > > > > > -                              virtqueue_poll_split(vq, last_used_idx);
> > > > > > +     return vq->ops->poll(vq, last_used_idx);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_poll);
> > > > > >
> > > > > > @@ -2623,8 +2669,7 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
> > > > > >       if (vq->event_triggered)
> > > > > >               vq->event_triggered = false;
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_enable_cb_delayed_packed(vq) :
> > > > > > -                              virtqueue_enable_cb_delayed_split(vq);
> > > > > > +     return vq->ops->enable_cb_delayed(vq);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
> > > > > >
> > > > > > @@ -2640,14 +2685,13 @@ void *virtqueue_detach_unused_buf(struct virtqueue *_vq)
> > > > > >  {
> > > > > >       struct vring_virtqueue *vq = to_vvq(_vq);
> > > > > >
> > > > > > -     return vq->packed_ring ? virtqueue_detach_unused_buf_packed(vq) :
> > > > > > -                              virtqueue_detach_unused_buf_split(vq);
> > > > > > +     return vq->ops->detach_unused_buf(vq);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_detach_unused_buf);
> > > > > >
> > > > > >  static inline bool more_used(const struct vring_virtqueue *vq)
> > > > > >  {
> > > > > > -     return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
> > > > > > +     return vq->ops->more_used(vq);
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -2785,10 +2829,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > > > > >       if (recycle_done)
> > > > > >               recycle_done(_vq);
> > > > > >
> > > > > > -     if (vq->packed_ring)
> > > > > > -             err = virtqueue_resize_packed(vq, num);
> > > > > > -     else
> > > > > > -             err = virtqueue_resize_split(vq, num);
> > > > > > +     err = vq->ops->resize(vq, num);
> > > > > >
> > > > > >       return virtqueue_enable_after_reset(_vq);
> > > > > >  }
> > > > > > @@ -2822,10 +2863,7 @@ int virtqueue_reset(struct virtqueue *_vq,
> > > > > >       if (recycle_done)
> > > > > >               recycle_done(_vq);
> > > > > >
> > > > > > -     if (vq->packed_ring)
> > > > > > -             virtqueue_reset_packed(vq);
> > > > > > -     else
> > > > > > -             virtqueue_reset_split(vq);
> > > > > > +     vq->ops->reset(vq);
> > > > > >
> > > > > >       return virtqueue_enable_after_reset(_vq);
> > > > > >  }
> > > > > > --
> > > > > > 2.42.0
> > > > >
> > >

