Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6723ABB9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453822; cv=none; b=PbFjQbYnDM0DWFRUEzelaZSkC3sDjAoTltinM4ghu9OjlSCa7yJNzsQidDUv1iXHI16Y3GlBPh7peFIPi0TiPP9Y8D86985W2Omi5Ad/wvqZMRJNIzl3DInBtuQ5cqtcVCud9PRADb8n5cdxE2wWoRgeCrPN8uCUfQE7Us+FIl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453822; c=relaxed/simple;
	bh=ZVzwxr887wToG7MgwzRowZQD9nIxHj8I9RllumE22dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rdz+UPqp0HLx0rKViRLIHkoYwHDSN62NaeT5ydxoznm+P0H/BsWSp5KckVvjIFjwDz62kmfpbPVJbSvgJKwGveHQAFl50eHFUPfwfIoveY3uerCdAFfJMaToy+5rjP5qXVSVMVP50IoqkRNk3l2PdTdqOM2QSarBSt6RiifaWFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VfBvWKzE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VfBvWKzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8yfqigI6iFuRnjvOscPGmKN9whaPUb4tE1+3hMy2w+w=;
	b=VfBvWKzEQEsrPmWqdTvpcuGfoF2HwYw/VvDaUxwuQXYPw/Gs4D7jEFK0Gr5q81+CjbrayR
	kpQiZZhKRgnUvcTS/u5J59So17rdLuALDSZps69nyI2tI/wP+CCuykhiTIZCyhtuJHQEWa
	5AN7BvV/1ndCAeMUmGK5Q+4g9tLLCsU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-nRWXxmenNR2MEeK7wR4v2Q-1; Wed, 02 Jul 2025 06:56:58 -0400
X-MC-Unique: nRWXxmenNR2MEeK7wR4v2Q-1
X-Mimecast-MFC-AGG-ID: nRWXxmenNR2MEeK7wR4v2Q_1751453817
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6097b0f5aceso4591066a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453817; x=1752058617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yfqigI6iFuRnjvOscPGmKN9whaPUb4tE1+3hMy2w+w=;
        b=fWTSRjnEFi8Bzlld8Yrxk52YUINA9+YKa9/WvSsY8AF9MWHhY3s1hi/SgAcSyayFMn
         TpMrLoGrceMgImQOWNKN2xP5dOhJfjalHNO8apHwiiOIF12j6xPXk2D/44GO7XRSyWl6
         O/bA8ywYHya9VjtiotKcu3kUIo3a4z0tDlQzDz54LGaaY7ErBnJeV1k03YuLi0J3G/Ge
         sWE4vwC4Dhq+jIV4v7L2DtxE1olxa9DHupatHbmNA3L2CqIO7uP5FBzBxgmfyHhiKlzG
         Ui2J5twoTOA98bYk7DzgNTrlgLoSzQ17yPj4tgFhP25y4TEyDHe41puMSfSg5Zrp7SNq
         GsHg==
X-Forwarded-Encrypted: i=1; AJvYcCVw8i/evSDinnaYSnSR26X/zCtg1CaOSoAcusPxbr0NP2YONCc2cF2PinJME8GiiO4PXS72j8umt+UNUYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gqHu1BnQdL/daQuWgfUzwdpYzK+Vc43baHSRIl8RgrHg6/Gf
	eRB2e4Dpan3Ojd7uiJPtQRPMvttbfwM8HASizLbphp8SoYm5kespsXKQ16RjpYCJfMoeUsd7m3F
	VNPrrrf6mUftYltxRu/WeqOkrAruCgzyiC/ZMmJCun7HV9Ru4LdkmbWEiG7dA152V9WDe0J9c0A
	==
X-Gm-Gg: ASbGnct8pvfnbe4vNEsD5GCzGYro0dbjudoaQZI4fEl9doYbT/vgicUrVzVaCZrsNkr
	FTFG9mJS1Hnf6BpF11BkhAYxuwkkiVlvlvtNIF1v/F1Qrrur3wuP7c1sQaFjR87TAqyWBOqDH/6
	DNRjykeIZepT8eVFSnfB8BeaUU0S3mXkISDHJRFKXEAcU5eD6UuZNIC5WxuVFoYaAFUY/VOLDei
	xLPyRoivngIhAeOBeyWdi69qBMF0NcdxOeZ1sEQFZ2eEnmHmkilo3Ys6NhGn/iBW+zbeBOB9CY0
	WRjQtVgYDwYX
X-Received: by 2002:a05:6402:34ce:b0:60c:3a73:a630 with SMTP id 4fb4d7f45d1cf-60e52cc480bmr2005361a12.9.1751453816570;
        Wed, 02 Jul 2025 03:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc4ZAJ5DDtXvenjBt+iRpz7JDzxPAN5HAkZUjXWksn5iJF7n9ojiMe/GbaACeYKf63X24xWA==
X-Received: by 2002:a05:6402:34ce:b0:60c:3a73:a630 with SMTP id 4fb4d7f45d1cf-60e52cc480bmr2005336a12.9.1751453815986;
        Wed, 02 Jul 2025 03:56:55 -0700 (PDT)
Received: from redhat.com ([31.187.78.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb60fsm9063535a12.3.2025.07.02.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:56:55 -0700 (PDT)
Date: Wed, 2 Jul 2025 06:56:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 19/19] virtio_ring: add in order support
Message-ID: <20250702064413-mutt-send-email-mst@kernel.org>
References: <20250616082518.10411-1-jasowang@redhat.com>
 <20250616082518.10411-20-jasowang@redhat.com>
 <20250701024602-mutt-send-email-mst@kernel.org>
 <CACGkMEuzTYPcDMamptLMQpSZu3gWxYx1Sr2nJef+pyuo2m35XQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEuzTYPcDMamptLMQpSZu3gWxYx1Sr2nJef+pyuo2m35XQ@mail.gmail.com>

On Wed, Jul 02, 2025 at 05:29:18PM +0800, Jason Wang wrote:
> On Tue, Jul 1, 2025 at 2:57 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 16, 2025 at 04:25:17PM +0800, Jason Wang wrote:
> > > This patch implements in order support for both split virtqueue and
> > > packed virtqueue.
> >
> > I'd like to see more motivation for this work, documented.
> > It's not really performance, not as it stands, see below:
> >
> > >
> > > Benchmark with KVM guest + testpmd on the host shows:
> > >
> > > For split virtqueue: no obvious differences were noticed
> > >
> > > For packed virtqueue:
> > >
> > > 1) RX gets 3.1% PPS improvements from 6.3 Mpps to 6.5 Mpps
> > > 2) TX gets 4.6% PPS improvements from 8.6 Mpps to 9.0 Mpps
> > >
> >
> > That's a very modest improvement for a lot of code.
> > I also note you put in some batching just for in-order.
> > Which could also explain the gains maybe?
> > What if you just put in a simple implementation with no
> > batching tricks? do you still see a gain?
> 
> It is used to implement the batch used updating.
> 
> """
> Some devices always use descriptors in the same order in which they
> have been made available. These devices can offer the
> VIRTIO_F_IN_ORDER feature. If negotiated, this knowledge allows
> devices to notify the use of a batch of buffers to the driver by only
> writing out a single used ring entry with the id corresponding to the
> head entry of the descriptor chain describing the last buffer in the
> batch.
> """
> 
> DPDK implements this behavior, so it's a must for the virtio driver.
> 
> > Does any hardware implement this? Maybe that can demonstrate
> > bigger gains.
> 
> Maybe but I don't have one in my hand.
> 
> For performance, I think it should be sufficient as a starter. I can
> say in the next version something like "more optimizations could be
> done on top"

What are some optimizations you have in mind?



> Note that the patch that introduces packed virtqueue, there's not even
> any numbers:
> 
> commit 1ce9e6055fa0a9043405c5604cf19169ec5379ff
> Author: Tiwei Bie <tiwei.bie@intel.com>
> Date:   Wed Nov 21 18:03:27 2018 +0800
> 
>     virtio_ring: introduce packed ring support
> 
>     Introduce the packed ring support. Packed ring can only be
>     created by vring_create_virtqueue() and each chunk of packed
>     ring will be allocated individually. Packed ring can not be
>     created on preallocated memory by vring_new_virtqueue() or
>     the likes currently.
> 
>     Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>


I think the assumption there was that intel has hardware that
requires packed. That's why Dave merged this.

> >
> >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  drivers/virtio/virtio_ring.c | 423 +++++++++++++++++++++++++++++++++--
> > >  1 file changed, 402 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > index 27a9459a0555..21d456392ba0 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -70,11 +70,14 @@
> > >  enum vq_layout {
> > >       SPLIT = 0,
> > >       PACKED,
> > > +     SPLIT_IN_ORDER,
> > > +     PACKED_IN_ORDER,
> > >       VQ_TYPE_MAX,
> > >  };
> > >
> > >  struct vring_desc_state_split {
> > >       void *data;                     /* Data for callback. */
> > > +     u32 total_len;                  /* Buffer Length */
> > >
> > >       /* Indirect desc table and extra table, if any. These two will be
> > >        * allocated together. So we won't stress more to the memory allocator.
> > > @@ -84,6 +87,7 @@ struct vring_desc_state_split {
> > >
> > >  struct vring_desc_state_packed {
> > >       void *data;                     /* Data for callback. */
> > > +     u32 total_len;                  /* Buffer Length */
> > >
> > >       /* Indirect desc table and extra table, if any. These two will be
> > >        * allocated together. So we won't stress more to the memory allocator.
> >
> > We are bloating up the cache footprint for everyone,
> > so there's a chance of regressions.
> > Pls include benchmark for in order off, to make sure we
> > are not regressing.
> 
> Ok.
> 
> > How big was the ring?
> 
> 256.

that is very modest, you want to fill at least one cache way,
preferably more.

> > Worth trying with a biggish one, where there is more cache
> > pressure.
> 
> Ok.
> 
> >
> >
> > Why not have a separate state for in-order?
> 
> It can work.
> 
> >
> >
> >
> > > @@ -206,6 +210,12 @@ struct vring_virtqueue {
> > >
> > >       /* Head of free buffer list. */
> > >       unsigned int free_head;
> > > +
> > > +     /* Head of the batched used buffers, vq->num means no batching */
> > > +     unsigned int batch_head;
> > > +
> > > +     unsigned int batch_len;
> > > +
> >
> > Are these two only used for in-order? Please document that.
> 
> Yes, I will do that.
> 
> > I also want some documentation about the batching trickery
> > used please.
> > What is batched, when, how is batching flushed, why are we
> > only batching in-order ...
> 
> I'm not sure I get things like this, what you want seems to be the
> behaviour of the device which has been stated by the spec or I may
> miss something here.

"a single used ring entry with the id corresponding to the
 head entry of the descriptor chain describing the last buffer in the
 batch"
?

so together they form this used ring entry describing the last buffer?
"head" is the id and "len" the length?

maybe

	/*
	 * With IN_ORDER, devices write a single used ring entry with
	 * the id corresponding to the head entry of the descriptor chain
	 * describing the last buffer in the batch
	 */
	struct used_entry {
		u32 id;
		u32 len;
	} batch_last;

?




> >
> >
> >
> >
> > >       /* Number we've added since last sync. */
> > >       unsigned int num_added;
> > >
> > > @@ -256,10 +266,14 @@ static void vring_free(struct virtqueue *_vq);
> > >
> > >  #define to_vvq(_vq) container_of_const(_vq, struct vring_virtqueue, vq)
> > >
> > > -
> > >  static inline bool virtqueue_is_packed(const struct vring_virtqueue *vq)
> > >  {
> > > -     return vq->layout == PACKED;
> > > +     return vq->layout == PACKED || vq->layout == PACKED_IN_ORDER;
> > > +}
> > > +
> > > +static inline bool virtqueue_is_in_order(const struct vring_virtqueue *vq)
> > > +{
> > > +     return vq->layout == SPLIT_IN_ORDER || vq->layout == PACKED_IN_ORDER;
> > >  }
> > >
> > >  static bool virtqueue_use_indirect(const struct vring_virtqueue *vq,
> > > @@ -570,7 +584,7 @@ static inline int virtqueue_add_split(struct vring_virtqueue *vq,
> > >       struct vring_desc_extra *extra;
> > >       struct scatterlist *sg;
> > >       struct vring_desc *desc;
> > > -     unsigned int i, n, c, avail, descs_used, err_idx;
> > > +     unsigned int i, n, c, avail, descs_used, err_idx, total_len = 0;
> >
> >
> > I would add a comment here:
> >
> > /* Total length for in-order */
> > unsigned int total_len = 0;
> 
> Ok.
> 
> Thanks

