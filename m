Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4CC2940B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738982751; cv=none; b=kKud2UYQhWo5NR7bfy6qaGQnVDQj+N6EW8gQQTYwuseMywNrSHd7MKJ/CQOzlRrD197rh2E80BJ/HreiZXZh+STljvCNxglVwS8g1C97WElVy013QdD1nn9QprZ8WIAb4rhV6d8GTJdrz3pHjv5KiBaCizVocd27JZycZrs1ElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738982751; c=relaxed/simple;
	bh=e+53GC+tZHxLi5hlhDJ2qkwYUo5ylA0agIxfUa2EJnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZtoOzJJf57UmIpVqAH/10X48gtdiZVWFwecEzAxT0qzhJYjPOEmOAoRf08gUQPH7o5indRzzKXkjy/uW6ADgwylYsaOjVWskE2M7rLcHOIWf95Oi5cEhonkDwVJn6+f4BM4Rb18cmlQnjvtxxMLPq5Cv1ypRtJDb9eTPmTK8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJHBEzDS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJHBEzDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738982748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RtI9mzHlogsKr4SkkhLppl0rKhYDgT0L5Yr9m+Pi60=;
	b=bJHBEzDSZiK2PVfu7KYGHC+SoMLNDaXXDXAZnDJMzZulp1JyLiMQMSbvHVdBz6f64wGJXT
	sDWWuoAGvy5t2Hy/98RAVF1ooYu/FN6qWum6S1YMQvkCYcjKxLKHXljNDNCA6u9KUCGjiU
	mXmD6S1O7Y7BVS7oeKkBwS9wm0YuiXM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-cs6F7WrzOwySGIMOkILYZg-1; Fri, 07 Feb 2025 21:45:46 -0500
X-MC-Unique: cs6F7WrzOwySGIMOkILYZg-1
X-Mimecast-MFC-AGG-ID: cs6F7WrzOwySGIMOkILYZg
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa1e63a5ffso6126923a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 18:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738982746; x=1739587546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RtI9mzHlogsKr4SkkhLppl0rKhYDgT0L5Yr9m+Pi60=;
        b=NWTZ+MFdWMfpiGoQsSJI4eyFlUhe2ZmMXvrv4d2Ty96KZWkcTgyR0Y1sThVjMidbH5
         I8LDXfuVe5F+Rr9w1RH8a35NKl7RGy6U11ucGBMBMkaLW+GDulJtILGU9pAHWN1xQVD5
         Er1X/KZBv6ULHm5ipxA87axdEaW8QMVPZAL2SNCM8mY1H7KEBgXTLlxw3Dv3PRviH9Ih
         990C6FpskwfzMXwb6+60DH3QBj/ozWob6s+CVh36Koc4bsm4rDVMDDkHJnA9uDaRf1ho
         AysJFXK/xf2i4hA3oVf21qaX27DWN+X5LUm9K0pQnQTUdV56+tDZ2bx8ggQGYnNZYdHO
         3v1w==
X-Forwarded-Encrypted: i=1; AJvYcCWpRRXB4hy+6QluVIEz5zm021i23mREqSmT7glarfoIgRu5xTq/effzm4YqlfuQXL1Nizz1dsDP1+QMlNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzjKUx87dITMHlBDc5ifPn7qgDE8uIeuXJJ9+gyrcnSDx8fmV
	AjfjczmwiRun7nX+jmR/8NYuRZhP7a/hwTAj5gkfkj3fpb54VunZdl/MuDn5Rg+2aIbChN0nf2l
	mwYIb6kJmEkCHd7nS7C5cY6+SvvUBwzpPeh6JpAOcGX7nMInLT1xWqJ+hscaffCoKmBz9bM2gng
	0nc0zRQKptOKcZtzvKu+ImjbjiupYyDNzkYm/9
X-Gm-Gg: ASbGncvwhI/QB3bpqLXAUD7zqmWqda50qwVPkrcBzxpKMDpDEwtddiAT7Bemxmyl/+j
	DIdZx6Su/IrhKwfd1ZN89aPVQEERJS93hym+Lb2Ryf8VynLo9bA2J51ErgJb+
X-Received: by 2002:a17:90b:4d05:b0:2fa:d95:4501 with SMTP id 98e67ed59e1d1-2fa24177388mr9616148a91.18.1738982745841;
        Fri, 07 Feb 2025 18:45:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu8ZX1sXnDvvmGXdTvfrOM495sFve+We8CS1tjixi7m5H2BOV35BtGVkBZyCEfzHNupLpptblp6BV0Nerfa4Q=
X-Received: by 2002:a17:90b:4d05:b0:2fa:d95:4501 with SMTP id
 98e67ed59e1d1-2fa24177388mr9616114a91.18.1738982745291; Fri, 07 Feb 2025
 18:45:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204173127.166673-1-kshk@linux.ibm.com> <m34remjchz3recrui5zwhuthbwxl2fb5dcjzdhxuedrbsa6q5c@xshyty77q6ul>
In-Reply-To: <m34remjchz3recrui5zwhuthbwxl2fb5dcjzdhxuedrbsa6q5c@xshyty77q6ul>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 8 Feb 2025 10:45:33 +0800
X-Gm-Features: AWEUYZmZFyJNpa-NIQ1Jhv_bLU_wN-lxtmNKgVt52wLlolbReYZyrKIK-wAfX24
Message-ID: <CACGkMEsOC6opYfDKY8xyJHKoWF_8RaKxRqZvuzAcFpgvpyPB+g@mail.gmail.com>
Subject: Re: [PATCH v2] vdpa/mlx5: Fix mlx5_vdpa_get_config() endianness on
 big-endian machines
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Konstantin Shkolnyy <kshk@linux.ibm.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:16=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com>=
 wrote:
>
> On 02/04, Konstantin Shkolnyy wrote:
> > mlx5_vdpa_dev_add() doesn=E2=80=99t initialize mvdev->actual_features. =
It=E2=80=99s
> > initialized later by mlx5_vdpa_set_driver_features(). However,
> > mlx5_vdpa_get_config() depends on the VIRTIO_F_VERSION_1 flag in
> > actual_features, to return data with correct endianness. When it=E2=80=
=99s called
> > before mlx5_vdpa_set_driver_features(), the data are incorrectly return=
ed
> > as big-endian on big-endian machines, while QEMU then interprets them a=
s
> > little-endian.
> >
> > The fix is to initialize this VIRTIO_F_VERSION_1 as early as possible,
> > especially considering that mlx5_vdpa_dev_add() insists on this flag to
> > always be set anyway.
> >
> > Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
> > ---
> > Changes in V2: Initialize only VIRTIO_F_VERSION_1 in actual_features,
> > rather than all flags.
> >
> >  drivers/vdpa/mlx5/net/mlx5_vnet.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/=
mlx5_vnet.c
> > index 36099047560d..cccc49a08a1a 100644
> > --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> > @@ -3884,6 +3884,9 @@ static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev=
 *v_mdev, const char *name,
> >       ndev->mvdev.max_vqs =3D max_vqs;
> >       mvdev =3D &ndev->mvdev;
> >       mvdev->mdev =3D mdev;
> > +     /* cpu_to_mlx5vdpa16() below depends on this flag */
> > +     mvdev->actual_features =3D
> > +                     (device_features & BIT_ULL(VIRTIO_F_VERSION_1));
> >
> >       ndev->vqs =3D kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
> >       ndev->event_cbs =3D kcalloc(max_vqs + 1, sizeof(*ndev->event_cbs)=
, GFP_KERNEL);
> > --
> > 2.34.1
> >
> The patch looks good now. Thanks!
>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

