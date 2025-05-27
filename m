Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607C8836
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313370; cv=none; b=r1z4F4GscRx1EGEGwvfU4cnhol6EZ15rl/mkIUEct7ZSYOpOVZQlKOK4boOyY3EHVQlSEcvRq56dUIUe5R34QmuDTSZaXJ5LSTM/jdwWzQH7aWRpQtY0m6kthembbutfjb0Ky9Cvn22HcvpsIg9I8MjOYoFkdD1sOgFwGSOynLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313370; c=relaxed/simple;
	bh=6IysQuqPIirVPJ20MXpnOYL10kNr8b+rwsHhBUSSrFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TA4vwRFY2f1j/HCkJomyCLavWJFvt6cZW7JfFtthl4NhIrrYAUTso/76POpiD/TFbxAHC7CGwLXr4lcsCHxG1STx6CKCOB7F3MiR5WxjySQuCyFHIOKvplHJRZPw93RIvuVKuLD6G3ATz89V6Fi9VWm2TpSC05tvfs2YYu5+bMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMu7ob5m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMu7ob5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748313367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFRiJRUJ5Mw8C89zokdx13mpy+WSevYfsGvmJ/SmKuo=;
	b=DMu7ob5mOS12NMxRayl9RKATaYKENEEtcGSOYgZeL14nal/HWr6dHzDxUxuNHvga7GRusO
	WRwTfihTEJ9/d+llwqYA1Rdva16mzM5NZ/TDoyRdytROBirDmS/CRkvYEgNXWp+eq+083r
	dg0NXJXsi7ls3jC/7naW70ixkkUu8zI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-k0o5gwZRMxuqYDHB6MHIXg-1; Mon, 26 May 2025 22:36:06 -0400
X-MC-Unique: k0o5gwZRMxuqYDHB6MHIXg-1
X-Mimecast-MFC-AGG-ID: k0o5gwZRMxuqYDHB6MHIXg_1748313365
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32810342d69so11300531fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748313364; x=1748918164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFRiJRUJ5Mw8C89zokdx13mpy+WSevYfsGvmJ/SmKuo=;
        b=NX7jOBgEMVE3k+RYF+ZB29vvRjScUVeIlgMVFmbL1OKAJh9HBJ/hYnogQzRK5wOoHb
         T2nJ581ZYYLvH3WphKUHuC6iY/Q26Gtkf/VA6+mxBHW16VblbWylxDQkvH1zjkVx94Ka
         /DmkLPEe7JCmAioW42fARxeoSWvNDKpUVLwUHr0bp0ORNLHFZ5yFuMju/tCYMaO4D9NV
         1OuNmEJ27RDpwIkCiIpcilD6LHYug3PhXLaiVrzTB5+3h/k0Hrc8qR7E2mErWgdyDYIA
         hXz1UHtTjKze1inRdZk92sZkvE1QdpDCogzAcES7rNC91o/64G5jF8pfBHsnVTJXRVNT
         rLeg==
X-Forwarded-Encrypted: i=1; AJvYcCVowGmqVcDdXhJqf3CXdFBsCUEbU50gMxP3JznVK6WU5rd+TySlMkxAj71cYQQ04y85RC28R+Oq9bNzdJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZcPY+4LzhZVsY7ssdMBRd9Q6EE3jU581hEAtDIsfxxmBJt/Cy
	ukb1tw/HSGNfjOu5I8eQlR+5nroFW7nn9MqhuA3G49pJkMBa4sikshCufFWllPTySYAUsT/Va47
	UZmkprYhjwuF1MJ8pgJE1Z+4tS4u6KEp5xDfphwxv91bOWI4EZP89XsErNSagd+MPkS8IVtmXD/
	gvhbc9AywmLWa0LlDbb3mDPKWsKShqXX+A23D5UnGO
X-Gm-Gg: ASbGncvxdQU8PuNY5E3DI1JV9qjAHkzNd8H5rtQULixjn8/WrpMNVcWGQey8+65czBK
	3WnDC1oXhrBsyECZhtrovkbJEzUQsUhbYYIYfEz40jMLEXPKJQlgNcRVWO1wojHypQT2yng==
X-Received: by 2002:a2e:be07:0:b0:30b:ca48:1089 with SMTP id 38308e7fff4ca-3295b9fddcemr32333801fa.2.1748313364430;
        Mon, 26 May 2025 19:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHzlKhVUBffhuV2+h2QVDGsTy36PX3lXXzL5uuAstSGPE2XoqbMaH+sySnrMhnulHPmQoqoU8LoYIVcSD1GCc=
X-Received: by 2002:a2e:be07:0:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-3295b9fddcemr32333701fa.2.1748313364028; Mon, 26 May 2025
 19:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-10-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-10-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 27 May 2025 10:35:52 +0800
X-Gm-Features: AX0GCFtY9ewwOS9jHRX0o0KQoPl--1ydmOuIi60LLrPuRoO65gYDMIPx_lXNBu0
Message-ID: <CALTww2_SUyLUFzQgLe+z0UFmcS72o1JDEkPfR5FEsOmj8CDsXw@mail.gmail.com>
Subject: Re: [PATCH 09/23] md/md-bitmap: add a new method blocks_synced() in bitmap_operations
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, yukuai3@huawei.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 2:18=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Currently, raid456 must perform a whole array initial recovery to build
> initail xor data, then IO to the array won't have to read all the blocks
> in underlying disks.
>
> This behavior will affect IO performance a lot, and nowadays there are
> huge disks and the initial recovery can take a long time. Hence llbitmap
> will support lazy initial recovery in following patches. This method is
> used to check if data blocks is synced or not, if not then IO will still
> have to read all blocks for raid456.

Hi Kuai

In function handle_stripe_dirtying, if the io is behind resync, it
will force rcw. Does this interface have the same function=EF=BC=9F

Regards
Xiao
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md-bitmap.h | 1 +
>  drivers/md/raid5.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 0de14d475ad3..f2d79c8a23b7 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -99,6 +99,7 @@ struct bitmap_operations {
>         md_bitmap_fn *end_discard;
>
>         sector_t (*skip_sync_blocks)(struct mddev *mddev, sector_t offset=
);
> +       bool (*blocks_synced)(struct mddev *mddev, sector_t offset);
>         bool (*start_sync)(struct mddev *mddev, sector_t offset,
>                            sector_t *blocks, bool degraded);
>         void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t *=
blocks);
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 7e66a99f29af..e5d3d8facb4b 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -3748,6 +3748,7 @@ static int want_replace(struct stripe_head *sh, int=
 disk_idx)
>  static int need_this_block(struct stripe_head *sh, struct stripe_head_st=
ate *s,
>                            int disk_idx, int disks)
>  {
> +       struct mddev *mddev =3D sh->raid_conf->mddev;
>         struct r5dev *dev =3D &sh->dev[disk_idx];
>         struct r5dev *fdev[2] =3D { &sh->dev[s->failed_num[0]],
>                                   &sh->dev[s->failed_num[1]] };
> @@ -3762,6 +3763,11 @@ static int need_this_block(struct stripe_head *sh,=
 struct stripe_head_state *s,
>                  */
>                 return 0;
>
> +       /* The initial recover is not done, must read everything */
> +       if (mddev->bitmap_ops && mddev->bitmap_ops->blocks_synced &&
> +           !mddev->bitmap_ops->blocks_synced(mddev, sh->sector))
> +               return 1;
> +
>         if (dev->toread ||
>             (dev->towrite && !test_bit(R5_OVERWRITE, &dev->flags)))
>                 /* We need this block to directly satisfy a request */
> --
> 2.39.2
>

