Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FABD27E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301667; cv=none; b=f5mbhiUlD6CRgekbw2O8e9LEy7FchfQGuWDXxJaFgTKzbniQ1TVAs7TEB5gXevVWJnMtHe7rWUJm6TJ5NmGoSnIBZsu3uCoPzfmJwfdX2xelM1rsK8AvjF1++krSVk62rgHca0x1bmDJ6opFBABqkNiJ2pl1NWkVOBwMkCN/zoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301667; c=relaxed/simple;
	bh=ryrrb1y06tmN0kQiAjkDpAfgEs20dlNc0D51dW/4PXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJQfbc46kd3lDV3NeH4FqLCXNdRU/B5wIRKVuCnI8/CJHkiuIqMVD34tPek6OsYxPQmOy4PkGr/OA8EFv1v00taDcWKmFuY5i8qyY3/cJy10UKKoEaMRuJlFp8YAqKvO13oJ2/BSAtcMRffN3L2u2769Ul3OyyQ1v+kdURjAVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWOYnhGf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWOYnhGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745301664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmVaZQzLh9EzB5YtxGNfRajzM5T5KN9CVrb+5GDKEow=;
	b=VWOYnhGfj9Djtnf14QlAWF78XR1ENDnrtHOcRbX8eaU3kf0YtQKrXK6MQMTd1XI34x+Hwa
	84AEbJLQt/yjbb535QEM/Ovhs+dMN9zPX82b4ZsxYZobbJzGlBQdqxRQ5n83l1sMhGOC7a
	GNIruwEk/mx4rjY/Xd9wJt6RUGdgczQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-zquQf4YjPheC4KKR1sEWIg-1; Tue, 22 Apr 2025 02:01:01 -0400
X-MC-Unique: zquQf4YjPheC4KKR1sEWIg-1
X-Mimecast-MFC-AGG-ID: zquQf4YjPheC4KKR1sEWIg_1745301660
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-30c04c54f11so18725681fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745301660; x=1745906460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmVaZQzLh9EzB5YtxGNfRajzM5T5KN9CVrb+5GDKEow=;
        b=DpIFRKLm2eWkfjNE47AOSl71ClGk2FYOv3O/pxJ/P3V1aY/1le41cHqWB7y1J62r3a
         yL/grUKUk3PwGIjuwzskxnCFbJ5z+GXweMpR04blNcoum7VkB+m6E6EwMnsVLytmGoMS
         FFJZX58UMX1xMX1LUsNeHwDNX/zSIyRrXyUSDs62Mfwnr8SnNVAXZvO+gjstQizuTuWc
         OaJqdBW0qNIaPYGV4O3ygHqZADSqxlani6mTb+KlWXaQ6uYatnZCoivQc48JNDzywtbj
         u9tJaT9rvwqBGIDzz2mvJs9S2asLI3ydgYeyZAPOSRofz2YoCtobNWd5AH3vnhUOgkXp
         TeFA==
X-Forwarded-Encrypted: i=1; AJvYcCWBEVXTUku/v3iuAu+bq1PDYcagmVirG9bMYGFMHfAYnJIRlVeuWHmC8BT5HIaNRwX4/TANpbBYboJ0LNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ppFZbw+XROGZtRVoQOT0G1yssc4X5MZrJ8H3suIIOvK4xDJ3
	++gvxFq3q9ZjdP84026A+YxAEDyiYM34sYYk2XTPCGp51D/PwZ+6KDzoKtpc1eThHcsfaoqjS6v
	qWfBZves6gsu/AbtTDTtMMzCAMlo+xQVVAf3Rr70mW7jJhKJVaJBy8mOvar4A0c042+YqExHpkH
	p2W007X8ZecxaaOs++CEQhqy1WYP0S18/yJdMn
X-Gm-Gg: ASbGncus0zhYeOTbXwKsvQXCBcqSvFc2YHdicwOXI3d2B62zm3FJxOUWCVttDvtbQHR
	xsWp8MaWIOmbDzxyzYTr7CitqEopVyfsGU25MCgXp5ptjB1JZ8M8PL/x/37pTOaqxX0ScDw==
X-Received: by 2002:a05:651c:2225:b0:30b:b9e4:13b0 with SMTP id 38308e7fff4ca-310904dc746mr39170121fa.12.1745301660007;
        Mon, 21 Apr 2025 23:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqU1jpMVzklLc0LYUoiw2pX2+zQ+Ae1Qiw/Dlcjlmsl4WFlusGSEBhgoXOJ4AXz/ONZUVxLjoJd3VFiEjDhek=
X-Received: by 2002:a05:651c:2225:b0:30b:b9e4:13b0 with SMTP id
 38308e7fff4ca-310904dc746mr39170021fa.12.1745301659584; Mon, 21 Apr 2025
 23:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418010941.667138-1-yukuai1@huaweicloud.com> <20250418010941.667138-3-yukuai1@huaweicloud.com>
In-Reply-To: <20250418010941.667138-3-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 22 Apr 2025 14:00:47 +0800
X-Gm-Features: ATxdqUGoL_dvxnP97XF7H0NhlTFLX63ezZFe3gUv617gquhQtrDzo9ggZhcnrJM
Message-ID: <CALTww299yYNHAMeYy8TczxsUkuHyj53g6yErNAtkou2mG9z7tw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] md: record dm-raid gendisk in mddev
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
	song@kernel.org, yukuai3@huawei.com, viro@zeniv.linux.org.uk, 
	akpm@linux-foundation.org, nadav.amit@gmail.com, ubizjak@gmail.com, 
	cl@linux.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 9:17=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Following patch will use gendisk to check if there are normal IO
> completed or inflight, to fix a problem in mdraid that foreground IO
> can be starved by background sync IO in later patches.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/md/dm-raid.c | 3 +++
>  drivers/md/md.h      | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 6adc55fd90d3..127138c61be5 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -14,6 +14,7 @@
>  #include "raid5.h"
>  #include "raid10.h"
>  #include "md-bitmap.h"
> +#include "dm-core.h"
>
>  #include <linux/device-mapper.h>
>
> @@ -3308,6 +3309,7 @@ static int raid_ctr(struct dm_target *ti, unsigned =
int argc, char **argv)
>
>         /* Disable/enable discard support on raid set. */
>         configure_discard_support(rs);
> +       rs->md.dm_gendisk =3D ti->table->md->disk;
>
>         mddev_unlock(&rs->md);
>         return 0;
> @@ -3327,6 +3329,7 @@ static void raid_dtr(struct dm_target *ti)
>
>         mddev_lock_nointr(&rs->md);
>         md_stop(&rs->md);
> +       rs->md.dm_gendisk =3D NULL;
>         mddev_unlock(&rs->md);
>
>         if (work_pending(&rs->md.event_work))
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 1cf00a04bcdd..9d55b4630077 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -404,7 +404,8 @@ struct mddev {
>                                                        * are happening, s=
o run/
>                                                        * takeover/stop ar=
e not safe
>                                                        */
> -       struct gendisk                  *gendisk;
> +       struct gendisk                  *gendisk;    /* mdraid gendisk */
> +       struct gendisk                  *dm_gendisk; /* dm-raid gendisk *=
/
>
>         struct kobject                  kobj;
>         int                             hold_active;
> --
> 2.39.2
>

Looks good to me, reviewed-by: Xiao Ni <xni@redhat.com>

