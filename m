Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755231EA6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354744; cv=none; b=tLXAD5sISVjoXIbBIqVzr1WzfAOw971m8kwBKKcojznYXvJGRbqrJQYi2JlFDmg7835pjk9TZTA4iH9hO0bfbFpOKHZPyW1NavOgGp1y1anTuSmhJbobFme1MB+OJJ+MqzCX3vMJFT8q7iR5CFscqHBGIctIeB4kn9AuG9pxTX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354744; c=relaxed/simple;
	bh=zli4l6+3Cz6XqiZS68d2p3HIE0BKInGPc9eQIG4Kzvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpAIs2MkBOKP5JiGQtxJlM+R0dqFDW+BwoCIFTs9PG0GRDu5J0X7ivaYSR/SKo1qlGaiQ469B1MAikSgA0/V9fFSNsEs5IIwpBGVFppRkVulVqtpHyfHh4eSAdTygQxVoy7LAo0EPwCjHmX1366r6pT+tOTsi1sg4xG7YAQ2N6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQiDh9sL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQiDh9sL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751354741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqfjgkpvPqfNyTCCIdxVSSiYliy/Ldo4Tby8Qm2Lb+I=;
	b=hQiDh9sLhrybXSVvkB1JYYhySejakw0xETAib/B2qqEG0LywcCs+vL2LXTb9CAH0JZzTpN
	jNCQMKy1o/aeyL0sswjDLBM0t/fFy3zUxt3LanuTsVHXfzUq7vBEQCkKjx4MojYUO94eUT
	HUF52DQqQL/NzqSsJUyU/ChrOqMMwws=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-txx9GHz2PEeEU1FPUOW18A-1; Tue, 01 Jul 2025 03:25:39 -0400
X-MC-Unique: txx9GHz2PEeEU1FPUOW18A-1
X-Mimecast-MFC-AGG-ID: txx9GHz2PEeEU1FPUOW18A_1751354739
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so2277567a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751354739; x=1751959539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqfjgkpvPqfNyTCCIdxVSSiYliy/Ldo4Tby8Qm2Lb+I=;
        b=lqF/x5j6i8YrBWlh2VIShBhMgUrRN9CZPuPNW1BCsMajhWBY5AzLEAzi5VxtG7Z+kn
         DhBv46lhuOylhsLRiZGySd01YV5Dm8Hm1pou3SABofLtKcpcs41blkEJE7I7jC7+j0m7
         pu9YgBtToP5SJ98CRKQoRNngK6lGJIFun49cXGErIsjsd6M90/G+UkWfHGeO9ei5OA1P
         Fled7X7DBN4MYSbyUtHECwpSEZK9caGu3RXQR3o4OqZe+u+r6Ptbqk9Klh8rTx+NbPM2
         3JFEjeuu0MvV3sIKNpwcefJOdWNofWbSfuBu3rfsmt5oQ6ZnxM3X1YG2B4CivW47NXc+
         sQFA==
X-Forwarded-Encrypted: i=1; AJvYcCWYiCdU27ZUPboYeWUIQUARvh/hgC9i5s+tK6XJHEtfGVf9KV4QsG2TI+M17uoAFeIjNSrBq21xY7Jui3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhpKHYL0lNKQtgWx/Ns3VuVvGXKODq25G/1v6vA+Y8B0K61Mmr
	NWPCegcBDMz51x7RAGaxXd3G2TleajLPbWcmyQtA9vXf96/rbropSsKj8jYzQRxFlnSwwgWq1Nm
	wo6MylPqGU2ZTJMIA5HUn37uT/Hz/94QvKsn6tY8unz73WXOFh7wXQMHDhr0KwSO4bh/cZg+gP5
	mJJt1Kwm7Gi6Kag6CmOW+qJXgYhgutaXLGMCV761gB
X-Gm-Gg: ASbGncvRG0GbEJZzwFqk8+fKCTVQIEZCC23aaeGfgo3VAOR6O8g8GTw6oOBai+VX2Um
	+ejMkuRcY2J6IyMkpXtNSHpRjBtcOP9H4rKyISjbsKzvvt99Dxr6JkPcVQj4c7/LJQZ2ShuA7io
	/g
X-Received: by 2002:a17:90b:1c0f:b0:30c:540b:9ba with SMTP id 98e67ed59e1d1-318c8ee5649mr22932469a91.10.1751354738655;
        Tue, 01 Jul 2025 00:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOq+uG0FaUURtz7jeSaS2hmgJsfIY1SbLYfvpWWdj22laRnsWVajTqtVC9jWNJzKXroXYApr8VhD3fK3IByrw=
X-Received: by 2002:a17:90b:1c0f:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-318c8ee5649mr22932441a91.10.1751354738143; Tue, 01 Jul 2025
 00:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616082518.10411-1-jasowang@redhat.com> <20250616082518.10411-15-jasowang@redhat.com>
 <20250701023157-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250701023157-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Jul 2025 15:25:26 +0800
X-Gm-Features: Ac12FXxqBoyRRVzktN6qu-dSbPSkI2Sh4uKMEzaFGTTMmSWmu6MM19PxRao70Rk
Message-ID: <CACGkMEu=BC5eYoExaUqLp-QZFKq31BrGvvEy0xvAwfCg28690Q@mail.gmail.com>
Subject: Re: [PATCH V3 14/19] virtio_ring: determine descriptor flags at one time
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 2:42=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, Jun 16, 2025 at 04:25:12PM +0800, Jason Wang wrote:
> > Let's determine the last descriptor by counting the number of sg. This
> > would be consistent with packed virtqueue implementation and ease the
> > future in-order implementation.
> >
> > Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  drivers/virtio/virtio_ring.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.=
c
> > index af32d1a1a1db..d5e4d4cd2487 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -570,7 +570,7 @@ static inline int virtqueue_add_split(struct vring_=
virtqueue *vq,
> >       struct vring_desc_extra *extra;
> >       struct scatterlist *sg;
> >       struct vring_desc *desc;
> > -     unsigned int i, n, avail, descs_used, prev, err_idx;
> > +     unsigned int i, n, c, avail, descs_used, err_idx;
> >       int head;
> >       bool indirect;
> >
> > @@ -626,46 +626,47 @@ static inline int virtqueue_add_split(struct vrin=
g_virtqueue *vq,
> >               return -ENOSPC;
> >       }
> >
> > +     c =3D 0;
>
> initialize at point of declaration?

Fine.

>
> >       for (n =3D 0; n < out_sgs; n++) {
> > +             sg =3D sgs[n];
> >               for (sg =3D sgs[n]; sg; sg =3D sg_next(sg)) {
> >                       dma_addr_t addr;
> >                       u32 len;
> > +                     u16 flags =3D 0;
> >
> >                       if (vring_map_one_sg(vq, sg, DMA_TO_DEVICE, &addr=
, &len, premapped))
> >                               goto unmap_release;
> >
> > -                     prev =3D i;
> > +                     if (++c !=3D total_sg)
> > +                             flags =3D VRING_DESC_F_NEXT;
> > +
>
> Don't like it how the logic is split.
> flags isn't used before that.
> So I prefer:
>
>         flags =3D ++c =3D=3D total_sg ? 0 : VRING_DESC_F_NEXT;
>
> and at that point, we do not really need flags anymore:
>
>
> >                       /* Note that we trust indirect descriptor
> >                        * table since it use stream DMA mapping.
> >                        */
> >                       i =3D virtqueue_add_desc_split(vq, desc, extra, i=
, addr, len,
> > -                                                  VRING_DESC_F_NEXT,
> > +                                                  flags,
>
> So just:
>
>
>         i =3D virtqueue_add_desc_split(vq, desc, extra, i, addr, len,
>                                      ++c =3D=3D total_sg ? 0 : VRING_DESC=
_F_NEXT,
>
> here and we are done.
>
>
> >                                                    premapped);
> >               }
> >       }
> >       for (; n < (out_sgs + in_sgs); n++) {
> >               for (sg =3D sgs[n]; sg; sg =3D sg_next(sg)) {
> > +                     u16 flags =3D VRING_DESC_F_WRITE;
> >                       dma_addr_t addr;
> >                       u32 len;
> >
> >                       if (vring_map_one_sg(vq, sg, DMA_FROM_DEVICE, &ad=
dr, &len, premapped))
> >                               goto unmap_release;
> >
> > -                     prev =3D i;
> > +                     if (++c !=3D total_sg)
> > +                             flags |=3D VRING_DESC_F_NEXT;
> > +
>
> Don't like it that above it's "=3D" here it is "|=3D".
> And flags isn't used before that.
> So I prefer:
>
>         flags =3D ++c =3D=3D total_sg ? VRING_DESC_F_WRITE : VRING_DESC_F=
_WRITE | VRING_DESC_F_NEXT;
>
> and again we don't really need the variable:
>
>
> >                       /* Note that we trust indirect descriptor
> >                        * table since it use stream DMA mapping.
> >                        */
> >                       i =3D virtqueue_add_desc_split(vq, desc, extra, i=
, addr, len,
> > -                                                  VRING_DESC_F_NEXT |
> > -                                                  VRING_DESC_F_WRITE,
>
>
> so just:
>
>                 i =3D virtqueue_add_desc_split(vq, desc, extra, i, addr, =
len,
>                                              (++c =3D=3D total_sg ? 0 : V=
RING_DESC_F_NEXT) |
>                                              VRING_DESC_F_WRITE,
>
>
> is clearer, and the patch smaller.

Right, I just copy the logic of packed.

Let me do that for both split and packed for the next version.

Thanks

>
>
>
> > -                                                  premapped);
> > +                                                  flags, premapped);
> >               }
> >       }
> > -     /* Last one doesn't continue. */
> > -     desc[prev].flags &=3D cpu_to_virtio16(vq->vq.vdev, ~VRING_DESC_F_=
NEXT);
> > -     if (!indirect && vring_need_unmap_buffer(vq, &extra[prev]))
> > -             vq->split.desc_extra[prev & (vq->split.vring.num - 1)].fl=
ags &=3D
> > -                     ~VRING_DESC_F_NEXT;
> >
> >       if (indirect) {
> >               /* Now that the indirect table is filled in, map it. */
> > --
> > 2.34.1
>

