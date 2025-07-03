Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842D227B8E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512452; cv=none; b=qicspBX8ccGbN623PRoj4PHXzuANlRcUjbMKqK3l8tNRIfv9Wmd80rHZB+yIwj5q81Dg8/dRryyg1W7/vK8ZwArwqna1OQDcbHacLX/TyTxuXvu7m/yrlJiTlgB9GHmUZ1qm+3PXjcBOuQGaCyGKxiZbbZUE8zAkdjWfFISdyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512452; c=relaxed/simple;
	bh=pMOSR+Ba6+A9Eh401EjLUYOiCvMDSPaRSBZH2LjAYGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQrXYOIS4AT6GimjJDAl4bLTeOC6n3tesV//QQH74tQ66yr8oiZGX1D23U0NzzBqlRy3aES7BKYC5hlRaP6BDSSYwSrQ9HitYQtLSDZO7U+SWt0djRl56rZhNiBvk3K8Q9XIdw/mnrFHDiz3bQznKRRV5c9G5cNRVh8bVCO5bIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XaXtnBPY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XaXtnBPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751512449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRIW5pbrJtZ6KIhhLr9tLMcbjMGeAtZxWrxYegWLOvk=;
	b=XaXtnBPYg/Rq6hL+CEK9x87+cHlC6jiMGXQbUeQWnD0okiVdO2MFDoox0igx4g9SmicnL6
	a2GSmH5IwVnU/YUkcnQ9/4nw+j0daXwoL6y6YSCk8qYVHHA3FfbUFs9wHrtHK8OVfgu/ad
	KTbDbfLLuz4HfxzKYBwk9GdLe90e8IM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-23M9DhtBMvC4ARyfQWl5VQ-1; Wed, 02 Jul 2025 23:14:07 -0400
X-MC-Unique: 23M9DhtBMvC4ARyfQWl5VQ-1
X-Mimecast-MFC-AGG-ID: 23M9DhtBMvC4ARyfQWl5VQ_1751512447
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so7237587a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512447; x=1752117247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRIW5pbrJtZ6KIhhLr9tLMcbjMGeAtZxWrxYegWLOvk=;
        b=LQ3EO1pJiSIxagXOvMH0UeoOz6AcWj8o3TtgZ7povxE+3O5uMqt92/8/HQrwHseueJ
         7XQFMVr5oHx3i4Fb7WRVEQiO+6X99sFkGe6NvqEdB4Cmu/WNFTdxuOEjTdViYIdlAdRw
         hEYzeC6qyyGeq4c8iUdOEB/1CEuhkFkVLeY3YzTfybabzfRfjoxHqXPx08xJVqyBMceV
         MKT/bEWwdTzsLPpudyfibv2VGBE9lo5m8jON2ovfUEeYYp6SI7xY//k5THizRmPQgOQD
         zFy6ZU1UqhgkNQgH1wh9X+/vNRslsc1jR4xh4ygXdCyqhvYapkhL68Ww0HwexSa+Oxsx
         RKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI8/BAGDFksxswJg47nqAZ4D4A5e6atJl/LNQyXMP9Fr3/jCw0EGdt7+McXVHkA4E4s8R1BrZsjNHUluU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+616RiBLI89yAw88RVC9MA3DXDBEe2CY3x0nqZTssXUPh867
	L0j2CodkHRa+1Od7EAPIPxP85XuURCC111tLc+2F3yc38NW4WrVbenGwN8+b84GH1Zq45Rgznvg
	eFyWQYOWo7PfB+Uf9n7pNS3foOr438jTMC6GJn+bZX/ohMZcqSHaBJOisfsFkX23PMX6kRHg3tX
	PZD/vCKlfA+uthmIJrpeD6EzpleAyxZK1WJRi83w/R
X-Gm-Gg: ASbGncth9zeHSaGD9imWTzY5e0kWZ0VN+L+TuOop0mHtWw+oIhE+4ZSnscqt89SEryG
	Nl7kP1LZx2KmVY7g/FzIqldiEvTrB5PV5yPiyMARnsel+K7UJBHtDpPU5e7AtSkWSXI5cYePv9U
	fsgiF3
X-Received: by 2002:a17:90b:4b11:b0:311:fde5:c4c2 with SMTP id 98e67ed59e1d1-31a9d57d983mr2241295a91.1.1751512446723;
        Wed, 02 Jul 2025 20:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNPprkHjmFCaG5ZezUgnHfsLYn1qY2/eNgQxJTgFAdsg1SexMlL8reb1Iy78Be/MZbDT3KSwi9g4t5kGsHosI=
X-Received: by 2002:a17:90b:4b11:b0:311:fde5:c4c2 with SMTP id
 98e67ed59e1d1-31a9d57d983mr2241252a91.1.1751512446185; Wed, 02 Jul 2025
 20:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616082518.10411-1-jasowang@redhat.com> <20250616082518.10411-20-jasowang@redhat.com>
 <20250701024602-mutt-send-email-mst@kernel.org> <CACGkMEuzTYPcDMamptLMQpSZu3gWxYx1Sr2nJef+pyuo2m35XQ@mail.gmail.com>
 <20250702064413-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250702064413-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Jul 2025 11:13:54 +0800
X-Gm-Features: Ac12FXwdZitM7cr8QECMFGaDxCYqGvGIjQXb0mGKXn4BjTMZqkxnxiDHrz98zA0
Message-ID: <CACGkMEs0-FiRbUVTbtVyqPh=A8ufdW-Mh1XnR9hf8XQ7_Qf9sg@mail.gmail.com>
Subject: Re: [PATCH V3 19/19] virtio_ring: add in order support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jonah Palmer <jonah.palmer@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:57=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Jul 02, 2025 at 05:29:18PM +0800, Jason Wang wrote:
> > On Tue, Jul 1, 2025 at 2:57=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 04:25:17PM +0800, Jason Wang wrote:
> > > > This patch implements in order support for both split virtqueue and
> > > > packed virtqueue.
> > >
> > > I'd like to see more motivation for this work, documented.
> > > It's not really performance, not as it stands, see below:
> > >
> > > >
> > > > Benchmark with KVM guest + testpmd on the host shows:
> > > >
> > > > For split virtqueue: no obvious differences were noticed
> > > >
> > > > For packed virtqueue:
> > > >
> > > > 1) RX gets 3.1% PPS improvements from 6.3 Mpps to 6.5 Mpps
> > > > 2) TX gets 4.6% PPS improvements from 8.6 Mpps to 9.0 Mpps
> > > >
> > >
> > > That's a very modest improvement for a lot of code.
> > > I also note you put in some batching just for in-order.
> > > Which could also explain the gains maybe?
> > > What if you just put in a simple implementation with no
> > > batching tricks? do you still see a gain?
> >
> > It is used to implement the batch used updating.
> >
> > """
> > Some devices always use descriptors in the same order in which they
> > have been made available. These devices can offer the
> > VIRTIO_F_IN_ORDER feature. If negotiated, this knowledge allows
> > devices to notify the use of a batch of buffers to the driver by only
> > writing out a single used ring entry with the id corresponding to the
> > head entry of the descriptor chain describing the last buffer in the
> > batch.
> > """
> >
> > DPDK implements this behavior, so it's a must for the virtio driver.
> >
> > > Does any hardware implement this? Maybe that can demonstrate
> > > bigger gains.
> >
> > Maybe but I don't have one in my hand.
> >
> > For performance, I think it should be sufficient as a starter. I can
> > say in the next version something like "more optimizations could be
> > done on top"
>
> What are some optimizations you have in mind?

One thing in my mind, spec currently said:

"""
 If negotiated, this knowledge allows devices to notify the use of a
batch of buffers to the driver by only writing out a single used
descriptor with the Buffer ID corresponding to the last descriptor in
the batch.
"""

If the device writes the last descriptor ID instead of the buffer ID
and skip the number of descriptors in the used ring. For split
virtqueue, the avail ring is not needed anymore. Device knows the
availability of buffers via avail_idx. In this way, we completely
eliminate the access of the available ring. This reduces the memory
access which is expensive for both:

1) kernel vhost-net where small user space memory access is expensive
2) hardware PCI transactions

Does this make sense?

>
>
>
> > Note that the patch that introduces packed virtqueue, there's not even
> > any numbers:
> >
> > commit 1ce9e6055fa0a9043405c5604cf19169ec5379ff
> > Author: Tiwei Bie <tiwei.bie@intel.com>
> > Date:   Wed Nov 21 18:03:27 2018 +0800
> >
> >     virtio_ring: introduce packed ring support
> >
> >     Introduce the packed ring support. Packed ring can only be
> >     created by vring_create_virtqueue() and each chunk of packed
> >     ring will be allocated individually. Packed ring can not be
> >     created on preallocated memory by vring_new_virtqueue() or
> >     the likes currently.
> >
> >     Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
> >     Signed-off-by: David S. Miller <davem@davemloft.net>
>
>
> I think the assumption there was that intel has hardware that
> requires packed. That's why Dave merged this.

I think it should according to Qemu patch:

commit c03213fdc9d7b680cc575cd1e725750702a10b09
Author: Jonah Palmer <jonah.palmer@oracle.com>
Date:   Wed Jul 10 08:55:18 2024 -0400

    vhost,vhost-user: Add VIRTIO_F_IN_ORDER to vhost feature bits

    Add support for the VIRTIO_F_IN_ORDER feature across a variety of vhost
    devices.

    The inclusion of VIRTIO_F_IN_ORDER in the feature bits arrays for these
    devices ensures that the backend is capable of offering and providing
    support for this feature, and that it can be disabled if the backend
    does not support it.

    Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
    Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
    Message-Id: <20240710125522.4168043-6-jonah.palmer@oracle.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Adding Jonah for more thought here.

>
> > >
> > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > >  drivers/virtio/virtio_ring.c | 423 +++++++++++++++++++++++++++++++=
++--
> > > >  1 file changed, 402 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_r=
ing.c
> > > > index 27a9459a0555..21d456392ba0 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -70,11 +70,14 @@
> > > >  enum vq_layout {
> > > >       SPLIT =3D 0,
> > > >       PACKED,
> > > > +     SPLIT_IN_ORDER,
> > > > +     PACKED_IN_ORDER,
> > > >       VQ_TYPE_MAX,
> > > >  };
> > > >
> > > >  struct vring_desc_state_split {
> > > >       void *data;                     /* Data for callback. */
> > > > +     u32 total_len;                  /* Buffer Length */
> > > >
> > > >       /* Indirect desc table and extra table, if any. These two wil=
l be
> > > >        * allocated together. So we won't stress more to the memory =
allocator.
> > > > @@ -84,6 +87,7 @@ struct vring_desc_state_split {
> > > >
> > > >  struct vring_desc_state_packed {
> > > >       void *data;                     /* Data for callback. */
> > > > +     u32 total_len;                  /* Buffer Length */
> > > >
> > > >       /* Indirect desc table and extra table, if any. These two wil=
l be
> > > >        * allocated together. So we won't stress more to the memory =
allocator.
> > >
> > > We are bloating up the cache footprint for everyone,
> > > so there's a chance of regressions.
> > > Pls include benchmark for in order off, to make sure we
> > > are not regressing.
> >
> > Ok.
> >
> > > How big was the ring?
> >
> > 256.
>
> that is very modest, you want to fill at least one cache way,
> preferably more.

I can test larger queue sizes.

>
> > > Worth trying with a biggish one, where there is more cache
> > > pressure.
> >
> > Ok.
> >
> > >
> > >
> > > Why not have a separate state for in-order?
> >
> > It can work.
> >
> > >
> > >
> > >
> > > > @@ -206,6 +210,12 @@ struct vring_virtqueue {
> > > >
> > > >       /* Head of free buffer list. */
> > > >       unsigned int free_head;
> > > > +
> > > > +     /* Head of the batched used buffers, vq->num means no batchin=
g */
> > > > +     unsigned int batch_head;
> > > > +
> > > > +     unsigned int batch_len;
> > > > +
> > >
> > > Are these two only used for in-order? Please document that.
> >
> > Yes, I will do that.
> >
> > > I also want some documentation about the batching trickery
> > > used please.
> > > What is batched, when, how is batching flushed, why are we
> > > only batching in-order ...
> >
> > I'm not sure I get things like this, what you want seems to be the
> > behaviour of the device which has been stated by the spec or I may
> > miss something here.
>
> "a single used ring entry with the id corresponding to the
>  head entry of the descriptor chain describing the last buffer in the
>  batch"
> ?

Exactly.

>
> so together they form this used ring entry describing the last buffer?
> "head" is the id and "len" the length?

Yes.

>
> maybe
>
>         /*
>          * With IN_ORDER, devices write a single used ring entry with
>          * the id corresponding to the head entry of the descriptor chain
>          * describing the last buffer in the batch
>          */
>         struct used_entry {
>                 u32 id;
>                 u32 len;
>         } batch_last;
>
> ?

This should be fine.

>
>
>
>
> > >
> > >
> > >
> > >
> > > >       /* Number we've added since last sync. */
> > > >       unsigned int num_added;
> > > >
> > > > @@ -256,10 +266,14 @@ static void vring_free(struct virtqueue *_vq)=
;
> > > >
> > > >  #define to_vvq(_vq) container_of_const(_vq, struct vring_virtqueue=
, vq)
> > > >
> > > > -
> > > >  static inline bool virtqueue_is_packed(const struct vring_virtqueu=
e *vq)
> > > >  {
> > > > -     return vq->layout =3D=3D PACKED;
> > > > +     return vq->layout =3D=3D PACKED || vq->layout =3D=3D PACKED_I=
N_ORDER;
> > > > +}
> > > > +
> > > > +static inline bool virtqueue_is_in_order(const struct vring_virtqu=
eue *vq)
> > > > +{
> > > > +     return vq->layout =3D=3D SPLIT_IN_ORDER || vq->layout =3D=3D =
PACKED_IN_ORDER;
> > > >  }
> > > >
> > > >  static bool virtqueue_use_indirect(const struct vring_virtqueue *v=
q,
> > > > @@ -570,7 +584,7 @@ static inline int virtqueue_add_split(struct vr=
ing_virtqueue *vq,
> > > >       struct vring_desc_extra *extra;
> > > >       struct scatterlist *sg;
> > > >       struct vring_desc *desc;
> > > > -     unsigned int i, n, c, avail, descs_used, err_idx;
> > > > +     unsigned int i, n, c, avail, descs_used, err_idx, total_len =
=3D 0;
> > >
> > >
> > > I would add a comment here:
> > >
> > > /* Total length for in-order */
> > > unsigned int total_len =3D 0;
> >
> > Ok.
> >
> > Thanks
>

