Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC51F1537
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748408304; cv=none; b=UpoSKZNUpbaiYQ6BZUaLjhr/iWdMGPUgab9/UDAOxpE28puEzKbL6VRc9LY83axVBoG7heyLXJwBZU/m7Kj35rkbBcA8lDgZJfqVmSTrzY6UGivmbQ0J17X+CaV0wyQOxdzhPcgPP6EwNX8mcwE/aBUEbAiM8wK6/4KDm3R3uZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748408304; c=relaxed/simple;
	bh=2LX650AeAHn3TzSjSL4/06vnyAtRrEY3yfwhoaLvd6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2JVc2Ao7QR/W1os0utl/ePQ+/RiK3Fbrg2wILJBaR4vgol6nS+1Ty5VNvHmyHLzRf3/PmzN4eDknof2kXQT5gUcKyvRP+zHO+LyjdzWkNTLwUgaooFhaW/TvKaPRwyrKzpXHRbe5xzRdFNQ1c5Qbm4z4IvHPPwf6pyzoqs80zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZ65FbHh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZ65FbHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748408301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvIb7tWWsEupK9BWjz39c0yzeNm9G9imVR6VZCBLXa4=;
	b=LZ65FbHhSY1AbsNa+qH/W0trd+X8nhpyYf/KX9GKe1PTnt4Yw8kZW947MvfIKV+SBvWHRh
	E9qRUKiYdBfRSfsL/xdYrn9pQMngjhzFwiegFLFQ6cimDQZbGx+CAolJsNnTg21YT/9MEW
	08dXXKHi6i46Ew/bEIykc+UQfenrf/s=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-6OgFJOrkOWyeA5dzsATH2A-1; Wed, 28 May 2025 00:58:19 -0400
X-MC-Unique: 6OgFJOrkOWyeA5dzsATH2A-1
X-Mimecast-MFC-AGG-ID: 6OgFJOrkOWyeA5dzsATH2A_1748408298
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32805c6330aso20076961fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748408298; x=1749013098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvIb7tWWsEupK9BWjz39c0yzeNm9G9imVR6VZCBLXa4=;
        b=GUgDPopCwfXmEC2mPwwFno8Ul+5kaBZcpbN5V23shBqJt6YVINNmH+wwTecKRJYFIw
         6oyFHUDeAgN7m8O8UF035+JY9J3aFLDeKDxqwm6/8clxshw+zerUKd2qzDlNWNPQXIqf
         E5ysscfNisbxkXg9qRE6Tki9e9O7hCR9sAuNjpagi4XgGH7GOs8yEIqYgkXAy8zLLhZQ
         Gy5hv7krthH9vcH2ERWG+vdyFNGXLCbU97mqab2OWqy8nb16qnP3vHnNEhh70TYBDvHU
         jo2JNprg5DsOCtSw7RA441VqMPmGZM87LF00VpmGK3L4BxtCCFzeK2B7736X96iJ31oZ
         JEGg==
X-Forwarded-Encrypted: i=1; AJvYcCUGJdzzLOJ5hMoA5t3pvEQf7c/onND4ODoMqr5vLIm0+pUSrcQIVzmuY/NYoAg7s/jq/eEWkuXJzY4XbkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypGEpRpITcUrh0rHDeKkuK+KNzTRcEv/EjfY1dzEY2PYsIQVQ9
	hdUKCc/QwkF9WebhRNbTYDsXxm6DpJ5+FS54YEanm68xaXXHmG6mcGUY4tFsuVOJblme+svzGYx
	ZlgBe73pcYO/KyOogAxgYJpBmkl3d+Ilbucz2z3YfWZYlSlMOoSucJSDg7oywsDI6wD3NlA7KNg
	yJFu60amYqWpi+aD4ate1OYuyu8IZQBrCm/h/VyMfn
X-Gm-Gg: ASbGncsLtkLVqCQi0ZcFNJKfxF9zdOtzVDQBvlYUzNvT23PiTeaYRov65W9Zc4xKgPk
	iyc7L5qnIDHW3FqnZG3SDfwsIQOQzVhXcs/C3OSbYMk3lF6ZN15t++y5BbInDJTNEMeNS1w==
X-Received: by 2002:a05:651c:4208:b0:30b:c980:c589 with SMTP id 38308e7fff4ca-32a79aaf867mr1376011fa.14.1748408298248;
        Tue, 27 May 2025 21:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLuLgqlBSKVn3XuzZ5O4WHptTWpAn5Hj8UQwNjGJRq+mdS4yUEkruE7gijVJvks3bFhtJOEMBJBaD1evghUbY=
X-Received: by 2002:a05:651c:4208:b0:30b:c980:c589 with SMTP id
 38308e7fff4ca-32a79aaf867mr1375941fa.14.1748408297836; Tue, 27 May 2025
 21:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-15-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-15-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Wed, 28 May 2025 12:58:05 +0800
X-Gm-Features: AX0GCFukkho086GfzsFTanUNNcI5WTEbYMx59B1Hh2FftMmayZ2nfabg-QIjzlg
Message-ID: <CALTww296VZXQoBryTLkYj+JkXtQoNOuzG2SwHbnTk1KxSGRjKw@mail.gmail.com>
Subject: Re: [PATCH 14/23] md/dm-raid: remove max_write_behind setting limit
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
> The comments said 'vaule in kB', while the value actually means the
> number of write_behind IOs. And since md-bitmap will automatically
> adjust the value to max COUNTER_MAX / 2, there is no need to fail
> early.
>
> Also move some macros that is only used md-bitmap.c.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/dm-raid.c   |  6 +-----
>  drivers/md/md-bitmap.c | 10 ++++++++++
>  drivers/md/md-bitmap.h |  9 ---------
>  3 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 088cfe6e0f98..9757c32ea1f5 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -1356,11 +1356,7 @@ static int parse_raid_params(struct raid_set *rs, =
struct dm_arg_set *as,
>                                 return -EINVAL;
>                         }
>
> -                       /*
> -                        * In device-mapper, we specify things in sectors=
, but
> -                        * MD records this value in kB
> -                        */
> -                       if (value < 0 || value / 2 > COUNTER_MAX) {
> +                       if (value < 0) {
>                                 rs->ti->error =3D "Max write-behind limit=
 out of range";
>                                 return -EINVAL;
>                         }
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 535bc1888e8c..098e7b6cd187 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -98,9 +98,19 @@
>   *
>   */
>
> +typedef __u16 bitmap_counter_t;
> +
>  #define PAGE_BITS (PAGE_SIZE << 3)
>  #define PAGE_BIT_SHIFT (PAGE_SHIFT + 3)
>
> +#define COUNTER_BITS 16
> +#define COUNTER_BIT_SHIFT 4
> +#define COUNTER_BYTE_SHIFT (COUNTER_BIT_SHIFT - 3)
> +
> +#define NEEDED_MASK ((bitmap_counter_t) (1 << (COUNTER_BITS - 1)))
> +#define RESYNC_MASK ((bitmap_counter_t) (1 << (COUNTER_BITS - 2)))
> +#define COUNTER_MAX ((bitmap_counter_t) RESYNC_MASK - 1)
> +
>  #define NEEDED(x) (((bitmap_counter_t) x) & NEEDED_MASK)
>  #define RESYNC(x) (((bitmap_counter_t) x) & RESYNC_MASK)
>  #define COUNTER(x) (((bitmap_counter_t) x) & COUNTER_MAX)
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index d2cdf831ef1a..a9a0f6a8d96d 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -9,15 +9,6 @@
>
>  #define BITMAP_MAGIC 0x6d746962
>
> -typedef __u16 bitmap_counter_t;
> -#define COUNTER_BITS 16
> -#define COUNTER_BIT_SHIFT 4
> -#define COUNTER_BYTE_SHIFT (COUNTER_BIT_SHIFT - 3)
> -
> -#define NEEDED_MASK ((bitmap_counter_t) (1 << (COUNTER_BITS - 1)))
> -#define RESYNC_MASK ((bitmap_counter_t) (1 << (COUNTER_BITS - 2)))
> -#define COUNTER_MAX ((bitmap_counter_t) RESYNC_MASK - 1)
> -
>  /*
>   * version 3 is host-endian order, this is deprecated and not used for n=
ew
>   * array
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

