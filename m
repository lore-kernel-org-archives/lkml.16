Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE171F2C45
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188222; cv=none; b=Sfq+yQjpcPXeAKtHoYkWREji3fk3SfnWFFhbTUfMZybMBKFRJ1sLFYQ6r4oLMjwhq8ZaWNLAFDAqoClz1ZLOb+Quz/feMpawDjFswwRYSdzXnz5hz6LxRFc08tS8nn3IKrVTqwTv6/NcyAgC9YrRZGoFbpLmVvkvmUD1C6EZ2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188222; c=relaxed/simple;
	bh=cDm+BcL5pV/jwnaLFmlOeqDE9hqOtT3gj/tGDYqjzJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWXb+e3qVJmojdG1kehdbo3RPWq1bIjvy3gZKnwlbWp86zzAPb1/GV3728K5vmvWZL7RbNfrDqnKxlfA1pLY0e8c+Mf53ceHGB++vva3daHDmHjgExFHOpqZUvbz+wAqygdqeZpigEieDCAbBWIhtgeoJ+8ktGSFiD3lalHxg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D70Yybsa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D70Yybsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748188220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1A7zWEnB4NNQmdQLB5zswOT1P+7llfpWdll/GIJ1Js=;
	b=D70YybsaQKyy/enlbZuYmOwoJQvRTiE6htTESpdKADVdDLuTszildlA2+4KEJWxvFevXqZ
	LazXlaCrnP2htmyo8V64BN/tEQHBj/n0Hu1dzM+7USHlkfZ8wokox0CAPVREVtWn+LPE3c
	sEFhCJYRLUDORVxHhOfgFw61/xogYT4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-N3JX02GIOD6ULWXmHcTlww-1; Sun, 25 May 2025 11:50:18 -0400
X-MC-Unique: N3JX02GIOD6ULWXmHcTlww-1
X-Mimecast-MFC-AGG-ID: N3JX02GIOD6ULWXmHcTlww_1748188217
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3280cd9fe4cso5541841fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188216; x=1748793016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1A7zWEnB4NNQmdQLB5zswOT1P+7llfpWdll/GIJ1Js=;
        b=TwlQ1DBRyORUSTJd6VEEfznq7btDT5MeVnRruU0l0pGRLBtzOgtKIc+KaFjl797WGv
         UWdbFdpoAUFui8Yg9uBRPr+YtuZj/8Ao9tQDefRz2iXZJetLwufgs+DxZWKdOechq6vh
         nDPlU7ztmwj4+oaL+ddo4OIbCEPe2345ET/5RMMeSywCbExzm/M5N+Xv+ADe+g5EHVUV
         O6nOTITJWcjrdmNR9WCHJXxJWM7SRhIduYxfBxyZSkiqWu5cUlAeURhdcE8cgG+U6QBO
         Z3UNMPYYvtZWtkRhMb1UVMA5k9meEE5R7NensSxPbLVXQj9DXGHAvDnTR3gO1eTdQrWC
         +n+w==
X-Forwarded-Encrypted: i=1; AJvYcCV1efZ5hDVVqZwFSS1oik93/uqFV0lAllY/xsIWUD49+B/efpwyeH65rwu/86KnZPQgVyy1rsmv0WCoHAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJRr9NGYt3Obnx/sSJnieFHMFO6OPkVQ4beiPoTt4xl/otn5/
	DDD+ij/hIXEkCES5iuYYY2w0chWSLpkMM2yJxsoDfa4HJ37/g19J05D6EOVwHGp2rt7X9Ej3Nt0
	/tVh6ct22k3VONEwjOw7xaibqfKLcHUMcqGb96MNryDUusYjT4gKg7ZO28TQy59QutLS737SR4G
	hxKepcgOgGlyFPMxokuTkry6XT3cIQos6PjxjDWoFJ
X-Gm-Gg: ASbGnctHcPH2C6zAIkv/WC8DJFUkx/oTltznQ6NgeDXUijSkNDPb61utxpWlPg9Jwf6
	IuseoFhErAVQ3MdIxsVwXFIP0lKh8s5qUClhQu7ytha6nAPXEntDAyFLVN8pndHR82SJgNg==
X-Received: by 2002:a2e:be27:0:b0:30b:badf:75f0 with SMTP id 38308e7fff4ca-3295b9fdd9emr16153211fa.2.1748188216503;
        Sun, 25 May 2025 08:50:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXR0moIXIH9V4vFgEbmCYzi6XfG/wuzMz7oPy52xMevqrGH2FTTQU/vlZWcGqMykN8QdBMtUJhtoSM8Y+0bI=
X-Received: by 2002:a2e:be27:0:b0:30b:badf:75f0 with SMTP id
 38308e7fff4ca-3295b9fdd9emr16153141fa.2.1748188216054; Sun, 25 May 2025
 08:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-2-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-2-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Sun, 25 May 2025 23:50:03 +0800
X-Gm-Features: AX0GCFuwLihJknM0nHR-W2XY72VB1I6_xw4w4c-E40fKbKV5k1AU_r6KYx7Q2Ck
Message-ID: <CALTww2-jb46wkmEUDp6u3fahWi2LxpENutryym220NuNSsJmug@mail.gmail.com>
Subject: Re: [PATCH 01/23] md: add a new parameter 'offset' to md_super_write()
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
> The parameter is always set to 0 for now, following patches will use
> this helper to write llbitmap to underlying disks, allow writing
> dirty sectors instead of the whole page.
>
> Also rename md_super_write to md_write_metadata since there is nothing
> super-block specific.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/md-bitmap.c |  3 ++-
>  drivers/md/md.c        | 28 ++++++++++++++--------------
>  drivers/md/md.h        |  5 +++--
>  3 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 431a3ab2e449..168eea6595b3 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -470,7 +470,8 @@ static int __write_sb_page(struct md_rdev *rdev, stru=
ct bitmap *bitmap,
>                         return -EINVAL;
>         }
>
> -       md_super_write(mddev, rdev, sboff + ps, (int)min(size, bitmap_lim=
it), page);
> +       md_write_metadata(mddev, rdev, sboff + ps, (int)min(size, bitmap_=
limit),
> +                         page, 0);
>         return 0;
>  }
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 32b997dfe6f4..18e03f651f6b 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -1021,8 +1021,9 @@ static void super_written(struct bio *bio)
>                 wake_up(&mddev->sb_wait);
>  }
>
> -void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
> -                  sector_t sector, int size, struct page *page)
> +void md_write_metadata(struct mddev *mddev, struct md_rdev *rdev,
> +                      sector_t sector, int size, struct page *page,
> +                      unsigned int offset)
>  {
>         /* write first size bytes of page to sector of rdev
>          * Increment mddev->pending_writes before returning
> @@ -1047,7 +1048,7 @@ void md_super_write(struct mddev *mddev, struct md_=
rdev *rdev,
>         atomic_inc(&rdev->nr_pending);
>
>         bio->bi_iter.bi_sector =3D sector;
> -       __bio_add_page(bio, page, size, 0);
> +       __bio_add_page(bio, page, size, offset);
>         bio->bi_private =3D rdev;
>         bio->bi_end_io =3D super_written;
>
> @@ -1657,8 +1658,8 @@ super_90_rdev_size_change(struct md_rdev *rdev, sec=
tor_t num_sectors)
>         if ((u64)num_sectors >=3D (2ULL << 32) && rdev->mddev->level >=3D=
 1)
>                 num_sectors =3D (sector_t)(2ULL << 32) - 2;
>         do {
> -               md_super_write(rdev->mddev, rdev, rdev->sb_start, rdev->s=
b_size,
> -                      rdev->sb_page);
> +               md_write_metadata(rdev->mddev, rdev, rdev->sb_start,
> +                                 rdev->sb_size, rdev->sb_page, 0);
>         } while (md_super_wait(rdev->mddev) < 0);
>         return num_sectors;
>  }
> @@ -2306,8 +2307,8 @@ super_1_rdev_size_change(struct md_rdev *rdev, sect=
or_t num_sectors)
>         sb->super_offset =3D cpu_to_le64(rdev->sb_start);
>         sb->sb_csum =3D calc_sb_1_csum(sb);
>         do {
> -               md_super_write(rdev->mddev, rdev, rdev->sb_start, rdev->s=
b_size,
> -                              rdev->sb_page);
> +               md_write_metadata(rdev->mddev, rdev, rdev->sb_start,
> +                                 rdev->sb_size, rdev->sb_page, 0);
>         } while (md_super_wait(rdev->mddev) < 0);
>         return num_sectors;
>
> @@ -2816,18 +2817,17 @@ void md_update_sb(struct mddev *mddev, int force_=
change)
>                         continue; /* no noise on spare devices */
>
>                 if (!test_bit(Faulty, &rdev->flags)) {
> -                       md_super_write(mddev,rdev,
> -                                      rdev->sb_start, rdev->sb_size,
> -                                      rdev->sb_page);
> +                       md_write_metadata(mddev, rdev, rdev->sb_start,
> +                                         rdev->sb_size, rdev->sb_page, 0=
);
>                         pr_debug("md: (write) %pg's sb offset: %llu\n",
>                                  rdev->bdev,
>                                  (unsigned long long)rdev->sb_start);
>                         rdev->sb_events =3D mddev->events;
>                         if (rdev->badblocks.size) {
> -                               md_super_write(mddev, rdev,
> -                                              rdev->badblocks.sector,
> -                                              rdev->badblocks.size << 9,
> -                                              rdev->bb_page);
> +                               md_write_metadata(mddev, rdev,
> +                                                 rdev->badblocks.sector,
> +                                                 rdev->badblocks.size <<=
 9,
> +                                                 rdev->bb_page, 0);
>                                 rdev->badblocks.size =3D 0;
>                         }
>
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 6eb5dfdf2f55..5ba4a9093a92 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -886,8 +886,9 @@ void md_account_bio(struct mddev *mddev, struct bio *=
*bio);
>  void md_free_cloned_bio(struct bio *bio);
>
>  extern bool __must_check md_flush_request(struct mddev *mddev, struct bi=
o *bio);
> -extern void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
> -                          sector_t sector, int size, struct page *page);
> +extern void md_write_metadata(struct mddev *mddev, struct md_rdev *rdev,
> +                             sector_t sector, int size, struct page *pag=
e,
> +                             unsigned int offset);
>  extern int md_super_wait(struct mddev *mddev);
>  extern int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
>                 struct page *page, blk_opf_t opf, bool metadata_op);
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

