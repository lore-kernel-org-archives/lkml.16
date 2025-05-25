Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0234A1D
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188274; cv=none; b=cUAEEWnXgG8hcMhjHhZ9rI2gnpgQpY04DCeJh03TY4L0X10NdsuRo7B6mVZ+ZRFprcRanBFByt0xgJGXu8RPo0J/9Jjx/nfpKU0XE2I0ADxeBna+Pj/sshz4pZZDveMppaG2a2VQfrfQ9+99LhHUvH0mwCnMbgYy/xLTEi0xcAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188274; c=relaxed/simple;
	bh=qe8H0mKh4DgkZ8oMMk63GJ3TFObqFHSYZ6YCB40Lq9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2pFGjMwUYWrjfUvRA0L+dRpEqp2qPG4Yikt+LD0wdpPZwyeHBu+Hr+qc6CgyKf3H3qgDYJUvMuSrlEHgswmkqN0WtofNvgNAn9W9/jUtj3HfBBZiEJcrWv8BwT5te3D9yWDuTHKjC8i42vjyq4p6OxKzkVYyiXx/0R8iUlzbkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KqZ06SVM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KqZ06SVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748188271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwrLG3QCszTQAJyUhEJ2A6/6HOeql0ILuej+avt1aaM=;
	b=KqZ06SVMvk91z0A+OO4+4bJGFC0KFqOwhiq9w1TNab/xvf8Mdwg5GWZjjjqpjYcPH02Oh8
	a6ZcXs26Rj3r2byLWyrMsjF1PZ3zNRed3YM8C4r2yrxqCoVNRJKvftgm/Ewxw7TdgiUYZK
	2BrKEHSPReybbFQ6ft5BhbNYdx1XJko=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-yytJZCwXN8aSz41JW-wc8Q-1; Sun, 25 May 2025 11:51:10 -0400
X-MC-Unique: yytJZCwXN8aSz41JW-wc8Q-1
X-Mimecast-MFC-AGG-ID: yytJZCwXN8aSz41JW-wc8Q_1748188269
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5520a231361so871555e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188269; x=1748793069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwrLG3QCszTQAJyUhEJ2A6/6HOeql0ILuej+avt1aaM=;
        b=TXy74tqByE/kEP0SPkdBObZMmbpkL29V6Y/Hqe86+q8T+f7H+NqhJBqbPPS7NzuGZN
         1iNuT2/+n3+J50PlIsHS8W7gYIFVxAfaPNMJUAJ3vMUTQHa9eVYgDj+LvkcDjeWoCkhv
         hqg8ITYMBALvAo1gu8OqcBJGskVveazKvAhr4Vrwh/hEGz51LufvDM0Yjti5NZGSHSZj
         71lOZ7gqdO9aPAOK+CTqC3N2qXCDxE1C3+osyETRa0p4fK/Zk4oWlGlEJ7QAwbBLJ9ey
         dhsjPS4djeuipkgXQl9D/AVIaPVVgQ6M6gEa1hPP3OMxHyo/PJY8EZhIDuiFFYIuBKH/
         dIrw==
X-Forwarded-Encrypted: i=1; AJvYcCXlV7E55+M/AgH9NgCqgM71u4nKBorF4Izsjpl9soETmgHLZYQ07ByeFa4ZKvd58x822qJ864yJq/1s58A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yk/XGpclhtJJy0bMywep/X4qR4nZpOPOt32UBdPL3GLwpHuf
	USIO8GPg+VZNbrC2zzVKo8vP5K1d3sDjSA7X+9KWhwErF+hn5nXpL7/CBJ7rNNwrkWfQXuXtUxw
	SxkdguT6VEKDo8tW0VP7HYYVLy2tpa13nRPx779ASpLJa0t7tu3fM9YfqUIU47cstoOkeGfAANl
	yDChsa8kmU1V1gWrdTZ4Ae7bb0r60iQ1klVr+yOupW
X-Gm-Gg: ASbGncty+JAwqRTBlrEyAme4UG8iaQrMFBrdHokjh/ZWjIcSVkVcixnfEZkt0xnash9
	DrS0OOlxomuVGBcrMtH9WaSuTUVvx35uFGFEtsn5TW4s17+iGFuCnsaNruXXIyvFqpbc6tg==
X-Received: by 2002:a05:6512:3ca8:b0:550:e60b:1927 with SMTP id 2adb3069b0e04-5521c7a8310mr1468126e87.1.1748188268793;
        Sun, 25 May 2025 08:51:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsfWfsT0atwcf/hJDOP86x1FcJHR3shDO40BtH9vdfsy6YiFbr58KQx7DOPv5ghRAHFkryknKdRc2h/IC2V6s=
X-Received: by 2002:a05:6512:3ca8:b0:550:e60b:1927 with SMTP id
 2adb3069b0e04-5521c7a8310mr1468112e87.1.1748188268357; Sun, 25 May 2025
 08:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-3-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-3-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Sun, 25 May 2025 23:50:56 +0800
X-Gm-Features: AX0GCFuFPq7qv4cXuJZLz9imxCoDKZ5yXU5O2tMBZfSvZ08QD-ldOCwjuOtzYJ8
Message-ID: <CALTww28mqz8Dh=V_eH3dw9djM6gHSe29KxgRzaQdOnDo2pEmkQ@mail.gmail.com>
Subject: Re: [PATCH 02/23] md: factor out a helper raid_is_456()
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
> There are no functional changes, the helper will be used by llbitmap in
> following patches.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/md.c | 9 +--------
>  drivers/md/md.h | 6 ++++++
>  2 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 18e03f651f6b..b0468e795d94 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -9037,19 +9037,12 @@ static sector_t md_sync_position(struct mddev *md=
dev, enum sync_action action)
>
>  static bool sync_io_within_limit(struct mddev *mddev)
>  {
> -       int io_sectors;
> -
>         /*
>          * For raid456, sync IO is stripe(4k) per IO, for other levels, i=
t's
>          * RESYNC_PAGES(64k) per IO.
>          */
> -       if (mddev->level =3D=3D 4 || mddev->level =3D=3D 5 || mddev->leve=
l =3D=3D 6)
> -               io_sectors =3D 8;
> -       else
> -               io_sectors =3D 128;
> -
>         return atomic_read(&mddev->recovery_active) <
> -               io_sectors * sync_io_depth(mddev);
> +              (raid_is_456(mddev) ? 8 : 128) * sync_io_depth(mddev);
>  }
>
>  #define SYNC_MARKS     10
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 5ba4a9093a92..c241119e6ef3 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -1011,6 +1011,12 @@ static inline bool mddev_is_dm(struct mddev *mddev=
)
>         return !mddev->gendisk;
>  }
>
> +static inline bool raid_is_456(struct mddev *mddev)
> +{
> +       return mddev->level =3D=3D ID_RAID4 || mddev->level =3D=3D ID_RAI=
D5 ||
> +              mddev->level =3D=3D ID_RAID6;
> +}
> +
>  static inline void mddev_trace_remap(struct mddev *mddev, struct bio *bi=
o,
>                 sector_t sector)
>  {
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

