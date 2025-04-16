Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06012CD96
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791399; cv=none; b=oVTJjXNPTu5F1bdA9YYJpoLJelcgD6n4i9CvRMhEnrb6TMcVB97cNcITS6cwOwV3X0FJVLYROAqxnePLCodN8iCPu33vwx8L4xdhz/es89+TjNjTv8KJ4sytEOU/T0YBoMZME9MkaTlWNaH0JaVxThdFRaErvcxcwTXO0MLU0EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791399; c=relaxed/simple;
	bh=FDlaVgjo1I9UYbKA97JlD3TeRAETH1FgPzAyGdowi3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIMv7On6Uww+eqNOkY8fV5giroM6vchH/0TJ1pMoEv/brN/ILVuWemWkZOlZ8vVki98MIblFsTUe0lTQf1MvSpYowJ+q6b/eaxJc4srjvPcVVxUHoznZk8xTkod+3jZQXxUtSNliuWEHz4Umu01v/8ClT0rPPu4rdTUZaCo7Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XtB9HEH+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XtB9HEH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744791396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YJf0uNGMARC6l3YgNJT5XK+qkS/6/zUZJDuy3jnfdM=;
	b=XtB9HEH+AEgygf7wVDucCr6VbjZa1rdI0bTFuTr96J/DKxa9kV+QqrD3klFvpm2sm/LBKU
	eoMGEYJLSWYwZS0YkY3hE4tCGaybeR/R+b1w/EceZXNbsdpTMZIhIkB/oqfAW/YitoGWMe
	27Zj1LsqpN/zsBw3N6gQXeKrKyEWR5M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-bAmdPAPHPH6wz_ZrpxoBnw-1; Wed, 16 Apr 2025 04:16:26 -0400
X-MC-Unique: bAmdPAPHPH6wz_ZrpxoBnw-1
X-Mimecast-MFC-AGG-ID: bAmdPAPHPH6wz_ZrpxoBnw_1744791386
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso468210a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791385; x=1745396185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YJf0uNGMARC6l3YgNJT5XK+qkS/6/zUZJDuy3jnfdM=;
        b=b6/WS5rkLyEH+FB7IZRB76jLVpfSwd0CKWhPy7umg9CPTMlmi309xf7kFs+MS4Gxb2
         0Vj5vdnHaf4IGVKJPHUkADMGsZQJ/ny/xqgMQO+unvEvkiY/YjvVEevDLuYUaiMif5xA
         8LuxejYpTr8v+qMOcbZfa7tdi+JImoXegIoWfpRCs1/3TBhDN03a9SuRlR3tBwm3tO+5
         18E6GHgyOcDG/KiVlyKBQcci2uoqlK1Yj+FwHCRWPz1wrHiL/iT7vVqAwmWQYCDTwy4E
         guU5uJS8JqKVETlRrrB1SdebzzUQd+xUaVCrVIT6AJslM/f+9AlYFAyWwwbk+67L3bk5
         SjaA==
X-Forwarded-Encrypted: i=1; AJvYcCWk7gIlVvkUjet8qx03dJs2KG2ImARfQjLFJIRhiMSj8YCFluFk1Nga2NkeHR3hzAAPw5zLHwHRZMO3al0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAq8v6OA6rhwNSuKhP7p4Gcs/s0B0Au+75XulzgpsfM7eyZdjg
	FAat5LJj5+IkjLi7MNtQFCf5Fyu8+1rT9mJCs+/ovPBWPUV+/ixMXA1FHR/3e1gA77GmKsEr0lj
	OMk4kmz2ohNfJKMm+1CqtPdXl+YdualHT+dRbL4G4RQQgFcR1ViFEYXgylxAmS2q39YLL9BPen8
	uuhoF2QRskFHaudRXfZsr3e20s91UZwC5YNXUW
X-Gm-Gg: ASbGncuXPnGWr1JxBxrOYd4h/VS69MUoFn6zc8uo6ftHghstPTxsFWcHcXag28C200j
	AO8sFK8XvZ+j2fFau8SLeIFClkPvwwOQyL37MygVT5Tg2rqyUqfD7mJ0unfA5vQqwEdXm+Et8h2
	yBeCFlHvjn4PfQEDPPMHbJmnVU
X-Received: by 2002:a17:90b:51cf:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-30864292d23mr1402240a91.8.1744791385683;
        Wed, 16 Apr 2025 01:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzrUSVYztyhmSnVvzEX9NlBIbpp4wsLgkVASOIWRxXnBWQ/ej/hqFPgo7RNSvfvdKL9orQuHap7MNTBS1D2Mo=
X-Received: by 2002:a17:90b:51cf:b0:2fb:fe21:4841 with SMTP id
 98e67ed59e1d1-30864292d23mr1402204a91.8.1744791385351; Wed, 16 Apr 2025
 01:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412132012.291837-1-ryasuoka@redhat.com> <d36c2ba7-52b6-4688-bb2b-70b8bd4d33c0@collabora.com>
In-Reply-To: <d36c2ba7-52b6-4688-bb2b-70b8bd4d33c0@collabora.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Wed, 16 Apr 2025 17:16:12 +0900
X-Gm-Features: ATxdqUGT9jMuGYtdwMyQrqqaRquKvFEmvpodZfFuXApiY_oe8OnZKvOncC1PQXc
Message-ID: <CAHpthZqOQZuQHbTCPH4ON6bRLRkd0X8ttTnwm8Nonrg=mvsmLw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	simona@ffwll.ch, jfalempe@redhat.com, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:29=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 4/12/25 16:20, Ryosuke Yasuoka wrote:
> > Pass array of pages of the scanout buffer [1] to shmem BO, allowing
> > drm_panic to work even if the BO is not vmapped.
> >
> > [1] https://lore.kernel.org/all/20250407140138.162383-3-jfalempe@redhat=
.com/
> >
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/v=
irtio/virtgpu_plane.c
> > index a6f5a78f436a..2ff57d559c86 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> > @@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct d=
rm_plane *plane,
> >
> >       bo =3D gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> >
> > -     /* Only support mapped shmem bo */
> > -     if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo-=
>base.vaddr)
> > +     if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
> >               return -ENODEV;
> >
> > -     iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> > +     if (bo->base.vaddr)
> > +             iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> > +     else {
> > +             struct drm_gem_shmem_object *shmem =3D &bo->base;
> > +
> > +             if (!shmem->pages)
> > +                     return -ENODEV;
> > +             /* map scanout buffer later */
> > +             sb->pages =3D shmem->pages;
> > +     }
> >
> >       sb->format =3D plane->state->fb->format;
> >       sb->height =3D plane->state->fb->height;
> >
> > base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2
>
> Rebased on top of [1], fixed checkpatch warning about braces and applied
> to misc-next. Thanks!
>
> [1] https://lore.kernel.org/all/20250414131507.566072-1-tzimmermann@suse.=
de/

Thomas,
Thank you for your comment.

Dmitry,
Thank you for fixing it and applying my patch.

> --
> Best regards,
> Dmitry
>

Best regards,
Ryosuke

