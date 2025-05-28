Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1FF22ACCE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748415907; cv=none; b=E/z11I7RnWD1MqzW4QT4150tlkdjlI95R4bkE+iAWom45l/Ge+F0P1uKZx6aFeFamo2AwW4zWFFZIUbnSOWf8ykJYSes2JXtkYWKvtb1hIVIljTu2chhJh1Bu0xnbLwbZok21HTsDKXQsvfuyPKY6uWYNTfCK0QI3vSPbTXmB9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748415907; c=relaxed/simple;
	bh=Mvf0YoyXqkCEfGtLJrNPzkLs56Eb/fTmLY/EAymjqvI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SqfS1VEBa9UHldk/rRPrw7xbpadUzPWEohUPwGnI7gobklVbehaVTVfWn2xe9eG34wJ4USk4DppOO3KkMf6GQ3sgfB5ecrWMIxMoj0Bl1IJtalIamWtmwkdPeQ79SgO4A/wLKlG6tU3GFL/IkR1c/3ng1e/YDpnzxWYp++Hmuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MdUvmu7s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MdUvmu7s"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4c6c0a9c7so2916525f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748415902; x=1749020702; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u16XtC8m50vUYOx4xXsXVM1MdjBGyfgJ+HP9+pmHAnE=;
        b=MdUvmu7swZWRuH7FM9ZjRQti65q9gVQPBsliYZLzSD5nBXVwgG72DwMK9NVFqe2EPx
         g6RjAX47vOm/FzEHOwbEJ0AxYCwrtMb9vKJRx0mJLn6ZkI/jmdLMpqCL3nbsSxYXfTwu
         6Xa5Uu7343NyfOP7VK18fSuB63pmHa69xKV97i/0RBT7Wy2aYksS5MgFb4Wavld2iHy6
         h/DYuDWgqZR3j6dUpCBslbvgIf+T39T1OfEJq2hAavMdYw3OqN7h8SrSr2SXdTQrMjMr
         az3kj4gxx81yQS47dstF8jgTogZnB2d6l6iHJ0iwE+FjVNjBV3BIX9g7/jQfzu/SK/Jb
         YSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748415902; x=1749020702;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u16XtC8m50vUYOx4xXsXVM1MdjBGyfgJ+HP9+pmHAnE=;
        b=SZl2h/l/XxKFnfBHuzv+Yu3HP1ef5IwHRdJNyXZs+tvP5I14BDJ1UvJUd7CdCrqkYm
         DsDjU0leTRlvcSI+Ek9TumGdGHCiRHOGQIu3aes1SDLHPSub2N+WY+iYNIR2Gg3GIlPh
         8Y+9Q0I3jVhVYKpngplEUI288Eze66ednD2FmRdLUL5j167i9zv2M7py0/Zxj52qUgAH
         M5w3HxmdGMfqAbJVFnG5hZMm20mi14gtpaf1xn0OKdXB8hUdJtRlGo3SzPcxArfBXLIH
         UltFkPTI5VLITgN10YyzI2LzeVCwe4ywoGJVoMAoQTIWDGGfzxXg9qkuda+Ez6bGEuSk
         OpQA==
X-Forwarded-Encrypted: i=1; AJvYcCUhdVQCmqJYc3wI8XJmehxVJxvKbG3qWYGaz8BaNRjByP+EVzWaE0PSSZbEztA+bzBFbFB8fpShXKlTq+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38Uv+0e53YhkQaMaougwyCGJqF/CNdiEFdVJG4KQYIGh7kmk5
	cxGvL93vStt+ZZmNYbweE0i6qOvDpV3WkBVm9vAdrPS1Md3OYi5an2AdWT/cY5syDnM=
X-Gm-Gg: ASbGncsA9ZJKGmAkY6vkWhvOAj/UHFqU+lfeuxAPXVhfSlFunaeONZ9VM/AGmQjyNPu
	3zw/FbHEVse+v3flBCZGk1NRhtCIpFxUivBhSIXQOai8AFDGYMOoYReTh6YrcLCL2LvYYbMnGON
	dUaw/N4sFrUT8vngXS30WYqxOTvpehP+KLnB0vQA8YTUIam8lyu1wLG0NsyY0WWeRNPa6ykgiOo
	dM/hdoGAa/737haYaXhbJALz4i53LlawhsTda1Art7JXbDFBYiMBcr+cBJqnflW2yQEUjS5jm54
	URW8Abgeb9a5Gug6B9414mR/yZqIzxOqaDLXC1CZDfgQh26WzQmhKg==
X-Google-Smtp-Source: AGHT+IGpXaITFwVpQxA+RPc22IfCLswMDTsPi7E1xojNuF3q5QjYAgXEtA+f0fp8AMKu8GeLsAQ2dw==
X-Received: by 2002:a05:6000:1881:b0:3a4:c6bc:995b with SMTP id ffacd0b85a97d-3a4cb47b7f7mr12782146f8f.35.1748415902373;
        Wed, 28 May 2025 00:05:02 -0700 (PDT)
Received: from smtpclient.apple ([129.146.52.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b457f0sm536715a91.2.2025.05.28.00.04.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 May 2025 00:05:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 04/23] md/md-bitmap: support discard for bitmap ops
From: Glass Su <glass.su@suse.com>
In-Reply-To: <20250524061320.370630-5-yukuai1@huaweicloud.com>
Date: Wed, 28 May 2025 15:04:41 +0800
Cc: hch@lst.de,
 xni@redhat.com,
 colyli@kernel.org,
 song@kernel.org,
 yukuai3@huawei.com,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org,
 yi.zhang@huawei.com,
 yangerkun@huawei.com,
 johnny.chenyi@huawei.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D5FB87E-13F7-4F61-85E6-F52E4245F37C@suse.com>
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-5-yukuai1@huaweicloud.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On May 24, 2025, at 14:13, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>=20
> From: Yu Kuai <yukuai3@huawei.com>
>=20
> Use two new methods {start, end}_discard to handle discard IO, prepare
> to support new md bitmap.
>=20
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
> drivers/md/md-bitmap.c |  3 +++
> drivers/md/md-bitmap.h | 12 ++++++++----
> drivers/md/md.c        | 15 +++++++++++----
> drivers/md/md.h        |  1 +
> 4 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 2997e09d463d..848626049dea 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -2991,6 +2991,9 @@ static struct bitmap_operations bitmap_ops =3D {
>=20
> .start_write =3D bitmap_start_write,
> .end_write =3D bitmap_end_write,
> + .start_discard =3D bitmap_start_write,
> + .end_discard =3D bitmap_end_write,
> +
> .start_sync =3D bitmap_start_sync,
> .end_sync =3D bitmap_end_sync,
> .cond_end_sync =3D bitmap_cond_end_sync,
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 9474e0d86fc6..4d804c07dbdd 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -70,6 +70,9 @@ struct md_bitmap_stats {
> struct file *file;
> };
>=20
> +typedef void (md_bitmap_fn)(struct mddev *mddev, sector_t offset,
> +    unsigned long sectors);
> +
> struct bitmap_operations {
> struct md_submodule_head head;
>=20
> @@ -90,10 +93,11 @@ struct bitmap_operations {
> void (*end_behind_write)(struct mddev *mddev);
> void (*wait_behind_writes)(struct mddev *mddev);
>=20
> - void (*start_write)(struct mddev *mddev, sector_t offset,
> -    unsigned long sectors);
> - void (*end_write)(struct mddev *mddev, sector_t offset,
> -  unsigned long sectors);
> + md_bitmap_fn *start_write;
> + md_bitmap_fn *end_write;
> + md_bitmap_fn *start_discard;
> + md_bitmap_fn *end_discard;
> +
> bool (*start_sync)(struct mddev *mddev, sector_t offset,
>   sector_t *blocks, bool degraded);
> void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t =
*blocks);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 04a659f40cd6..466087cef4f9 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -8845,18 +8845,24 @@ EXPORT_SYMBOL_GPL(md_submit_discard_bio);
> static void md_bitmap_start(struct mddev *mddev,
>    struct md_io_clone *md_io_clone)
> {
> + md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD) ?
> +   mddev->bitmap_ops->start_discard :
> +   mddev->bitmap_ops->start_write;
> +
> if (mddev->pers->bitmap_sector)
> mddev->pers->bitmap_sector(mddev, &md_io_clone->offset,
>   &md_io_clone->sectors);
>=20
> - mddev->bitmap_ops->start_write(mddev, md_io_clone->offset,
> -       md_io_clone->sectors);
> + fn(mddev, md_io_clone->offset, md_io_clone->sectors);
> }
>=20
> static void md_bitmap_end(struct mddev *mddev, struct md_io_clone =
*md_io_clone)
> {
> - mddev->bitmap_ops->end_write(mddev, md_io_clone->offset,
> -     md_io_clone->sectors);
> + md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD) ?
> +   mddev->bitmap_ops->end_discard :
> +   mddev->bitmap_ops->end_write;
> +
> + fn(mddev, md_io_clone->offset, md_io_clone->sectors);
> }
>=20
> static void md_end_clone_io(struct bio *bio)
> @@ -8895,6 +8901,7 @@ static void md_clone_bio(struct mddev *mddev, =
struct bio **bio)
> if (bio_data_dir(*bio) =3D=3D WRITE && md_bitmap_enabled(mddev)) {
> md_io_clone->offset =3D (*bio)->bi_iter.bi_sector;
> md_io_clone->sectors =3D bio_sectors(*bio);
> + md_io_clone->rw =3D op_stat_group(bio_op(*bio));
> md_bitmap_start(mddev, md_io_clone);
> }
>=20
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index c241119e6ef3..13e3f9ce1b79 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -850,6 +850,7 @@ struct md_io_clone {
> unsigned long start_time;
> sector_t offset;
> unsigned long sectors;
> + enum stat_group rw;

Please also mention the change in commit message.

=E2=80=94=20
Su
> struct bio bio_clone;
> };
>=20
> --=20
> 2.39.2
>=20
>=20

