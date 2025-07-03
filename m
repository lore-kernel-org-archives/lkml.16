Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D1158535
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512856; cv=none; b=iAVxz9zPPuzfblLo8qQKNmvqp/4yy5GmOWKWO8mr4w+x38gSUCs7hYxfzzqxMvmnTdcnZWmFx2F4MA+yfPauaCghB9Qz2JEbHYyKozF5iQP5I6xtNyHQqg0DNgwBVfaM7T+quxu3XeShGVu+R0VPYCJBhCX9l/M3rE+G0eOVQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512856; c=relaxed/simple;
	bh=02SyrTxhDxefPxQZdDhWhN7sw/GWdpZGjBC12Qoo6tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seySNBdgJs5dCuQJ/qwyfPmZPTlQJbGkkC0hSBiURQ5tuhCSJ5t2+igVmKY8VWfZPvjcRJQK561IsGWRUX0/HjJrykBjz94Ow19alwAWn1VeOkRkXJNCZ8aWmzNMCB39RtiHKTVF//IZ+hNsCQVBIjnPwTx0e2gclrPmvWMMqw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCohbDeE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCohbDeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751512853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9v7tJEEgqy6VJZUTuanr/kpPOrF6V1sH7tRmF54BHwM=;
	b=PCohbDeEHfoFG5OZINiJ9u5SpWyjYPNWizjFu8IhhXrWvw295YS8PYFEwpAthgGUzZUofg
	ZyxfZ9N9TbCQ6Y459Ubb4UiBwWLIGnj9DxnEG8pvMUsdGP5DCH1NeI/yFcvzIH3w2HM4TK
	gO8YbG4cYIn+8WWNACXGrcv501lCm6Y=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-qzJE6gdqNcK8rO7nZn8lHw-1; Wed, 02 Jul 2025 23:20:50 -0400
X-MC-Unique: qzJE6gdqNcK8rO7nZn8lHw-1
X-Mimecast-MFC-AGG-ID: qzJE6gdqNcK8rO7nZn8lHw_1751512849
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2365ab89b52so58167835ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512849; x=1752117649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9v7tJEEgqy6VJZUTuanr/kpPOrF6V1sH7tRmF54BHwM=;
        b=S7mVSpSG+X9T2nyeZjzdtB8UgXCYHLAoYzuQtcV0WNxMaY0e6zl5FXGpEUugmQc+IN
         zeXCmNuJeMFwUhzZxomm8wSOJLUxyaWYnAPnCHrL2txSV11MVXHDTkHLQdyuBUQvKhhH
         Ttk+tH6mmvQXNt7OvOt91Zx5lguaolPso6G9m4RQ+ueJvHs0NTYSIKkbrcNDUq+d0T6G
         cJ7ggf+Pk0OkVjuxa4trDIGWBCyyLioJWI/VbxNWMFSIG5ALEXA0RREePbC2SNdkn2wG
         kzKyz9U/xpciElixhaEas6OlkmPAQEcnKOZktzaJKbOhx1GkV7CChpRevyBhI7jcsIt/
         XJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUWFojcUVOr38/zoQ5Bn9hLwPqR8s8YoOp7F1ShCYSd/sFb0lG7soCTiuMycnAoKqDp8sxseTa7d9nVfi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMSE39uZggDm1FdEbp6JNOi1VEt5pFS4gfKgS6YIUmE8DOQdx
	h/IMAixTewvurB5Tc/0k+47D8Z3KEEhckfwXSEwwKUc64GHkT/tdq2PPDz2zYdFcTGrKawemOVb
	Y8x6+JWWTn8fYVp/ATorRaLmGEI0f4PvPjPvMhsn+nQMnFe7r2Tz1V/8XxtYFENKcTNChlDd7sJ
	ZPunh/ZPiP35GOCeomEffKyLB9266ZiJgonFun24MH
X-Gm-Gg: ASbGnctZ/UqjDSh5UxR7HhbdZMSt3Q0mmmDojJUcgCSiPBGnfOSO6AIiHPT0d0IoNV2
	zTHPwkj3wkc/Go9hIRWsU0hos0t9DNDPApvxb+qdvDKodIgJQzgJPI1to4Ha+SRUnj1+VUkwXbx
	Ec47WT
X-Received: by 2002:a17:902:da91:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-23c797b28efmr26082305ad.19.1751512849121;
        Wed, 02 Jul 2025 20:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg2pIZBjOK/FqaU85rpiYhc/c8RAys2kXuUcQ4lOX92J/XbhJ0fdtIc+TGgTNJfl5liSoKWQbXchamvBGnT8I=
X-Received: by 2002:a17:902:da91:b0:234:bfcb:5c21 with SMTP id
 d9443c01a7336-23c797b28efmr26081905ad.19.1751512848627; Wed, 02 Jul 2025
 20:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616082518.10411-1-jasowang@redhat.com> <20250616082518.10411-14-jasowang@redhat.com>
 <20250701021229-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250701021229-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Jul 2025 11:20:37 +0800
X-Gm-Features: Ac12FXxbljZdRCM4OW6C1KgmjHwBFTe8wRkTLkKm8PQXcJtS6sc3GylASsGsIvI
Message-ID: <CACGkMEvXTBNK2wxaxw3nDLBrA47WToPkpLLgVXxA7d=X8C6O-w@mail.gmail.com>
Subject: Re: [PATCH V3 13/19] virtio_ring: introduce virtqueue ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 2:29=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, Jun 16, 2025 at 04:25:11PM +0800, Jason Wang wrote:
> > This patch introduces virtqueue ops which is a set of the callbacks
> > that will be called for different queue layout or features. This would
> > help to avoid branches for split/packed and will ease the future
> > implementation like in order.
> >
> > Note that in order to eliminate the indirect calls this patch uses
> > global array of const ops to allow compiler to avoid indirect
> > branches.
> >
> > Tested with CONFIG_MITIGATION_RETPOLINE, no performance differences
> > were noticed.
> >
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  drivers/virtio/virtio_ring.c | 172 ++++++++++++++++++++++++++---------
> >  1 file changed, 129 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.=
c
> > index b14bbb4d6713..af32d1a1a1db 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -67,6 +67,12 @@
> >  #define LAST_ADD_TIME_INVALID(vq)
> >  #endif
> >
> > +enum vq_layout {
> > +     SPLIT =3D 0,
> > +     PACKED,
> > +     VQ_TYPE_MAX,
> > +};
> > +
> >  struct vring_desc_state_split {
> >       void *data;                     /* Data for callback. */
> >
> > @@ -159,12 +165,28 @@ struct vring_virtqueue_packed {
> >       size_t event_size_in_bytes;
> >  };
> >
> > +struct vring_virtqueue;
> > +
> > +struct virtqueue_ops {
> > +     int (*add)(struct vring_virtqueue *_vq, struct scatterlist *sgs[]=
,
> > +                unsigned int total_sg, unsigned int out_sgs,
> > +                unsigned int in_sgs, void *data,
> > +                void *ctx, bool premapped, gfp_t gfp);
> > +     void *(*get)(struct vring_virtqueue *vq, unsigned int *len, void =
**ctx);
> > +     bool (*kick_prepare)(struct vring_virtqueue *vq);
> > +     void (*disable_cb)(struct vring_virtqueue *vq);
> > +     bool (*enable_cb_delayed)(struct vring_virtqueue *vq);
> > +     unsigned int (*enable_cb_prepare)(struct vring_virtqueue *vq);
> > +     bool (*poll)(const struct vring_virtqueue *vq, u16 last_used_idx)=
;
> > +     void *(*detach_unused_buf)(struct vring_virtqueue *vq);
> > +     bool (*more_used)(const struct vring_virtqueue *vq);
> > +     int (*resize)(struct vring_virtqueue *vq, u32 num);
> > +     void (*reset)(struct vring_virtqueue *vq);
> > +};
> > +
> >  struct vring_virtqueue {
> >       struct virtqueue vq;
> >
> > -     /* Is this a packed ring? */
> > -     bool packed_ring;
> > -
> >       /* Is DMA API used? */
> >       bool use_dma_api;
> >
> > @@ -180,6 +202,8 @@ struct vring_virtqueue {
> >       /* Host publishes avail event idx */
> >       bool event;
> >
> > +     enum vq_layout layout;
> > +
> >       /* Head of free buffer list. */
> >       unsigned int free_head;
> >       /* Number we've added since last sync. */
> > @@ -232,6 +256,12 @@ static void vring_free(struct virtqueue *_vq);
> >
> >  #define to_vvq(_vq) container_of_const(_vq, struct vring_virtqueue, vq=
)
> >
> > +
>
> Why two empty lines?

Let me fix that.

>
> > +static inline bool virtqueue_is_packed(const struct vring_virtqueue *v=
q)
> > +{
> > +     return vq->layout =3D=3D PACKED;
> > +}
> > +
>
> So why still have this?
> Let's replace all uses with a per layout
> callback. None of them seem to be on the data path.
> Well, with one exception - there is

I actually start with that but the problem is a lot of codes could be
duplicated that needs more refactoring which will end up with a pretty
giant series:

+static const struct virtqueue_ops split_in_order_ops =3D {
+       .add =3D virtqueue_add_split,
+       .get =3D virtqueue_get_buf_ctx_split_in_order,
+       .kick_prepare =3D virtqueue_kick_prepare_split,
+       .disable_cb =3D virtqueue_disable_cb_split,
+       .enable_cb_delayed =3D virtqueue_enable_cb_delayed_split,
+       .enable_cb_prepare =3D virtqueue_enable_cb_prepare_split,
+       .poll =3D virtqueue_poll_split,
+       .detach_unused_buf =3D virtqueue_detach_unused_buf_split,
+       .more_used =3D more_used_split_in_order,
+       .resize =3D virtqueue_resize_split,
+       .reset =3D virtqueue_reset_split,
+};

So I start with the function that has sufficient difference:

virtqueue_get_buf_ctx_split_in_order
more_used_split_in_order

And leave the rest for the future if we can see performance improvement.


>         > @@ -2921,7 +3006,7 @@ u32 vring_notification_data(struct virtqu=
eue *_vq)
>         >       struct vring_virtqueue *vq =3D to_vvq(_vq);
>         >       u16 next;
>         >
>         > -     if (vq->packed_ring)
>         > +     if (virtqueue_is_packed(vq))
>         >               next =3D (vq->packed.next_avail_idx &
>         >                               ~(-(1 << VRING_PACKED_EVENT_F_WRA=
P_CTR))) |
>         >                       vq->packed.avail_wrap_counter <<
>
> I think it's the only one? Are we trying to save a function call there?
> I am fine to keep it as in this patch, or if we do change it,
> maybe with a separate patch, so if there is a regression we can bisect
> more easily.
>

Yes.

>
>
>
> For example, for the chunk below, we could have:
>         .init_last_used
>
> having said that, this patchset is already big, so let us do it with a se=
parate patch -
> but if so, the way to split would be in patch 1 to just leave vq->packed_=
ring
> in place, gradually replace call sites, and in patch N drop
> vq->packed_ring.

Ok, let me do that.

>
>
> >  static bool virtqueue_use_indirect(const struct vring_virtqueue *vq,
> >                                  unsigned int total_sg)
> >  {
> > @@ -422,7 +452,7 @@ static void virtqueue_init(struct vring_virtqueue *=
vq, u32 num)
> >  {
> >       vq->vq.num_free =3D num;
> >
> > -     if (vq->packed_ring)
> > +     if (virtqueue_is_packed(vq))
> >               vq->last_used_idx =3D 0 | (1 << VRING_PACKED_EVENT_F_WRAP=
_CTR);
> >       else
> >               vq->last_used_idx =3D 0;
> > @@ -1116,6 +1146,8 @@ static int vring_alloc_queue_split(struct vring_v=
irtqueue_split *vring_split,
> >       return 0;
> >  }
> >
> > +static const struct virtqueue_ops split_ops;
> > +
> >  static struct virtqueue *__vring_new_virtqueue_split(unsigned int inde=
x,
> >                                              struct vring_virtqueue_spl=
it *vring_split,
> >                                              struct virtio_device *vdev=
,
> > @@ -1133,7 +1165,7 @@ static struct virtqueue *__vring_new_virtqueue_sp=
lit(unsigned int index,
> >       if (!vq)
> >               return NULL;
> >
> > -     vq->packed_ring =3D false;
> > +     vq->layout =3D SPLIT;
> >       vq->vq.callback =3D callback;
> >       vq->vq.vdev =3D vdev;
> >       vq->vq.name =3D name;
> > @@ -2076,6 +2108,8 @@ static void virtqueue_reset_packed(struct vring_v=
irtqueue *vq)
> >       virtqueue_vring_init_packed(&vq->packed, !!vq->vq.callback);
> >  }
> >
> > +static const struct virtqueue_ops packed_ops;
> > +
> >  static struct virtqueue *__vring_new_virtqueue_packed(unsigned int ind=
ex,
> >                                              struct vring_virtqueue_pac=
ked *vring_packed,
> >                                              struct virtio_device *vdev=
,
> > @@ -2106,7 +2140,7 @@ static struct virtqueue *__vring_new_virtqueue_pa=
cked(unsigned int index,
> >  #else
> >       vq->broken =3D false;
> >  #endif
> > -     vq->packed_ring =3D true;
> > +     vq->layout =3D PACKED;
> >       vq->dma_dev =3D dma_dev;
> >       vq->use_dma_api =3D vring_use_dma_api(vdev);
> >
> > @@ -2194,6 +2228,39 @@ static int virtqueue_resize_packed(struct vring_=
virtqueue *vq, u32 num)
> >       return -ENOMEM;
> >  }
> >
> > +static const struct virtqueue_ops split_ops =3D {
> > +     .add =3D virtqueue_add_split,
> > +     .get =3D virtqueue_get_buf_ctx_split,
> > +     .kick_prepare =3D virtqueue_kick_prepare_split,
> > +     .disable_cb =3D virtqueue_disable_cb_split,
> > +     .enable_cb_delayed =3D virtqueue_enable_cb_delayed_split,
> > +     .enable_cb_prepare =3D virtqueue_enable_cb_prepare_split,
> > +     .poll =3D virtqueue_poll_split,
> > +     .detach_unused_buf =3D virtqueue_detach_unused_buf_split,
> > +     .more_used =3D more_used_split,
> > +     .resize =3D virtqueue_resize_split,
> > +     .reset =3D virtqueue_reset_split,
> > +};
> > +
> > +static const struct virtqueue_ops packed_ops =3D {
> > +     .add =3D virtqueue_add_packed,
> > +     .get =3D virtqueue_get_buf_ctx_packed,
> > +     .kick_prepare =3D virtqueue_kick_prepare_packed,
> > +     .disable_cb =3D virtqueue_disable_cb_packed,
> > +     .enable_cb_delayed =3D virtqueue_enable_cb_delayed_packed,
> > +     .enable_cb_prepare =3D virtqueue_enable_cb_prepare_packed,
> > +     .poll =3D virtqueue_poll_packed,
> > +     .detach_unused_buf =3D virtqueue_detach_unused_buf_packed,
> > +     .more_used =3D more_used_packed,
> > +     .resize =3D virtqueue_resize_packed,
> > +     .reset =3D virtqueue_reset_packed,
> > +};
> > +
> > +static const struct virtqueue_ops *const all_ops[VQ_TYPE_MAX] =3D {
> > +     [SPLIT] =3D &split_ops,
> > +     [PACKED] =3D &packed_ops
> > +};
> > +
> >  static int virtqueue_disable_and_recycle(struct virtqueue *_vq,
> >                                        void (*recycle)(struct virtqueue=
 *vq, void *buf))
> >  {
> > @@ -2236,6 +2303,38 @@ static int virtqueue_enable_after_reset(struct v=
irtqueue *_vq)
> >   * Generic functions and exported symbols.
> >   */
> >
> > +#define VIRTQUEUE_CALL(vq, op, ...)                                  \
> > +     ({                                                              \
> > +     typeof(all_ops[SPLIT]->op(vq, ##__VA_ARGS__)) ret;              \
>
> we need an empty line here, after the declaration.

Ok.

Thanks

