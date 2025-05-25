Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EF61A26B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188408; cv=none; b=FbsVHaEgGYnHJCF9rvDJSnXq/4a9FXLWUQamwPnVLB6eQl6eRqlEvb9jAZ7F+IF9d18w5DcssH9WIXwYiTtFP9FFGCOGOKaQA4gp7wbbC74X8JTrOLelsfKI09VZhT2gjEiPPrBvONgidp8M5IqQvcFgn0e+FEOHrZVSZ2vwzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188408; c=relaxed/simple;
	bh=+beQk7iofbXfuvxyD9wI06wOPGZdep0uGgwVcEnDhVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mx5iMc3Zzp8qRISpHDGpgZUyPe0OwaXHbf43s7H0Dn5n2n5lTicDOmOFV2w66pBKqcx5mDb0ra0fGecgATdGMo4AkH9iFOAsoeeF4PlrTOU/7mAGnNDdGPqfspjxAWWFmmHEThdWCdbnyifF1DK/3NUhxHh4+UuhRcnlnpbDIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmUK0+U6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmUK0+U6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748188405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RfF8+8Y3CMDfplODDB2yfBcIHi+PCSzAf7h2lCPnkI8=;
	b=EmUK0+U6bHnxRHdNdrSI5PMcqyUGI5FG200ND6ug0s/weJbUOipNNVue+794qTaM29W9Kd
	HuTNT58oEXroxRitygWRpAYx1vQ+2T4h8gF1gMBTAeHEr5ITpb+CLmHMMDp1vwumV7OUhW
	kAlkC8LsazDcroasmE4/c//pts/pQfk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-PbTWK9THP0Kl8TOGSQL_2g-1; Sun, 25 May 2025 11:53:24 -0400
X-MC-Unique: PbTWK9THP0Kl8TOGSQL_2g-1
X-Mimecast-MFC-AGG-ID: PbTWK9THP0Kl8TOGSQL_2g_1748188403
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3290947e288so6124281fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188402; x=1748793202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfF8+8Y3CMDfplODDB2yfBcIHi+PCSzAf7h2lCPnkI8=;
        b=XeYI9FGLnL8lKE48fDeEt0NvoSPEwlbzLm/Ugsck6hri/pDCrjGpAI/ONQ36bbisdN
         Bs7Qarv1GmtHW9oc6namUIYe4/q+hdLtQfd/MHG4GB8xfryiSWk+mJnWSsKu1raPDzRj
         yv6L7T3lMa7wAV2hYLfDvEG5jd0QOm6EOnIzuQ3A1p/2F/+BUtpkei5JAVenZfxadm68
         u2zRPSRwJZSXB6MtxpobRcR7ZkxzSuJilUH2PwxIa6GjjdPIMRqL4lWqWEmtDGZHlsoH
         h1XSAQQwqcfAmLOr5ACoFjzrbGqtIpcfjCfuD9iJGfsSHGRH0em6+Qymz/O2GSImAp7f
         fcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg8bxY6TQik4NwZes/xU9bFrqo50UhCHYyNLVYAs50Ft1443YnfYihcIywhVNx2DwwtBaedcnBDTj9eh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8l0YN4lJelaZJ5sYDiuZ+MDb46Vvg7x9Wxyoj6Sw1O+te3xA
	TBCHnGA2DZjGrUWsIgQgAeGQEgp6wp1u5JK7TEY3Pn3ZuQ5G8QK59gOGtDZQyM9IHMRJE36ktlM
	d6dr7ABCOumALfBHBnePWhnGrpNlNB1myptMCwJnxNWBTFy7ZkWboOd5R3fMLPbccroeo/xSUPl
	xEPqhxNsaLLicdDDt2so49T+rfzHPwOk5liKY352Dp
X-Gm-Gg: ASbGncuHcn6FiYVl+LKa+ljLj7N4DDhSQWZ9pGA2DRLfUZivwQ+V21JL158kSfl6OHr
	PlT9I1/6gMV2Z616rOXbhwyXONyzD1PTFb9xQR1FBahx9qCsW394Ha2eLTiwuCvVtDZ7/gQ==
X-Received: by 2002:a2e:be1d:0:b0:329:2657:c98 with SMTP id 38308e7fff4ca-3294f7df620mr28726231fa.15.1748188402427;
        Sun, 25 May 2025 08:53:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj4ilIq/lThsnnYfPBwAxQ+tUGxulkQvIvbb615Hm/PjSiYnfC1C+kwjnlDi8kPfx37cJirZyp9TcAYPdEIuQ=
X-Received: by 2002:a2e:be1d:0:b0:329:2657:c98 with SMTP id
 38308e7fff4ca-3294f7df620mr28726161fa.15.1748188402015; Sun, 25 May 2025
 08:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-5-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-5-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Sun, 25 May 2025 23:53:10 +0800
X-Gm-Features: AX0GCFtMMUph9jWUAowxw0wR7qBlq2PZcZtIwBdTVWYAeVV_UCLavZfGsNoSARw
Message-ID: <CALTww28-Yoo-00c7Gpa+=Zh6V-N6OOdhPuWcD6e0S2609c21Xw@mail.gmail.com>
Subject: Re: [PATCH 04/23] md/md-bitmap: support discard for bitmap ops
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, yukuai3@huawei.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 2:19=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Use two new methods {start, end}_discard to handle discard IO, prepare
> to support new md bitmap.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/md-bitmap.c |  3 +++
>  drivers/md/md-bitmap.h | 12 ++++++++----
>  drivers/md/md.c        | 15 +++++++++++----
>  drivers/md/md.h        |  1 +
>  4 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 2997e09d463d..848626049dea 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -2991,6 +2991,9 @@ static struct bitmap_operations bitmap_ops =3D {
>
>         .start_write            =3D bitmap_start_write,
>         .end_write              =3D bitmap_end_write,
> +       .start_discard          =3D bitmap_start_write,
> +       .end_discard            =3D bitmap_end_write,
> +
>         .start_sync             =3D bitmap_start_sync,
>         .end_sync               =3D bitmap_end_sync,
>         .cond_end_sync          =3D bitmap_cond_end_sync,
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 9474e0d86fc6..4d804c07dbdd 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -70,6 +70,9 @@ struct md_bitmap_stats {
>         struct file     *file;
>  };
>
> +typedef void (md_bitmap_fn)(struct mddev *mddev, sector_t offset,
> +                           unsigned long sectors);
> +
>  struct bitmap_operations {
>         struct md_submodule_head head;
>
> @@ -90,10 +93,11 @@ struct bitmap_operations {
>         void (*end_behind_write)(struct mddev *mddev);
>         void (*wait_behind_writes)(struct mddev *mddev);
>
> -       void (*start_write)(struct mddev *mddev, sector_t offset,
> -                           unsigned long sectors);
> -       void (*end_write)(struct mddev *mddev, sector_t offset,
> -                         unsigned long sectors);
> +       md_bitmap_fn *start_write;
> +       md_bitmap_fn *end_write;
> +       md_bitmap_fn *start_discard;
> +       md_bitmap_fn *end_discard;
> +
>         bool (*start_sync)(struct mddev *mddev, sector_t offset,
>                            sector_t *blocks, bool degraded);
>         void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t *=
blocks);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 04a659f40cd6..466087cef4f9 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -8845,18 +8845,24 @@ EXPORT_SYMBOL_GPL(md_submit_discard_bio);
>  static void md_bitmap_start(struct mddev *mddev,
>                             struct md_io_clone *md_io_clone)
>  {
> +       md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD=
) ?
> +                          mddev->bitmap_ops->start_discard :
> +                          mddev->bitmap_ops->start_write;
> +
>         if (mddev->pers->bitmap_sector)
>                 mddev->pers->bitmap_sector(mddev, &md_io_clone->offset,
>                                            &md_io_clone->sectors);
>
> -       mddev->bitmap_ops->start_write(mddev, md_io_clone->offset,
> -                                      md_io_clone->sectors);
> +       fn(mddev, md_io_clone->offset, md_io_clone->sectors);
>  }
>
>  static void md_bitmap_end(struct mddev *mddev, struct md_io_clone *md_io=
_clone)
>  {
> -       mddev->bitmap_ops->end_write(mddev, md_io_clone->offset,
> -                                    md_io_clone->sectors);
> +       md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD=
) ?
> +                          mddev->bitmap_ops->end_discard :
> +                          mddev->bitmap_ops->end_write;
> +
> +       fn(mddev, md_io_clone->offset, md_io_clone->sectors);
>  }
>
>  static void md_end_clone_io(struct bio *bio)
> @@ -8895,6 +8901,7 @@ static void md_clone_bio(struct mddev *mddev, struc=
t bio **bio)
>         if (bio_data_dir(*bio) =3D=3D WRITE && md_bitmap_enabled(mddev)) =
{
>                 md_io_clone->offset =3D (*bio)->bi_iter.bi_sector;
>                 md_io_clone->sectors =3D bio_sectors(*bio);
> +               md_io_clone->rw =3D op_stat_group(bio_op(*bio));
>                 md_bitmap_start(mddev, md_io_clone);
>         }
>
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index c241119e6ef3..13e3f9ce1b79 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -850,6 +850,7 @@ struct md_io_clone {
>         unsigned long   start_time;
>         sector_t        offset;
>         unsigned long   sectors;
> +       enum stat_group rw;
>         struct bio      bio_clone;
>  };
>
> --
> 2.39.2
>
>

Reviewed-by: Xiao Ni <xni@redhat.com>

