Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70303322B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748189359; cv=none; b=fWn2dBUeUbfeNVni4kwLlHnkRIlOp4ZCgdSgahE1g/E2kLiDaV30NN9+7Jdsq48YXRIzrZ2zD4sEd9UFXOjHUsy8J8Err40j/77bhUUm5OKGE0w1oUYFGDmbX2TV81v81UjmJjW2P2YpfIRT9Hf0QeBbWBrq4Pf2M95q/C4Xt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748189359; c=relaxed/simple;
	bh=kqSBLo2TUYjqplGGeQuAnq+SUfmc5+e4mOcC63SH6IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5/NznUfDaXYoBMjj9Wn99P5MH7kBM9ls2KhHkN9FbvrGPeKD47fWs/1Mp8eJIL99EPua++GueZDQGbYhPcdhi+E6VKgEJkUgVqdi2i5T3JfHW/cgOrEsUKgkVn0hAnpIvs9lHEwjZI6j5O0rROSMX4gFkbQ7xlJp4ivOjn7+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OuMfJZzL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OuMfJZzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748189356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ffg9JhgzHanSNKrxP494YLN43u46uvcV5a+ThPPvFto=;
	b=OuMfJZzLIyMIL0Ms/aR9F3xVRT8f1D9m4SZZt71F98PFlhxRLB1nTUZX5jwm/TVHOu0BoD
	k7IcScHwpmdZNDTSH4A7yuMHOb6+aMy/FidXFtyT35zK1BnWQYUvMdj+It48L+SxdHAhxU
	a1yq2bOjEEVQVw5VaVNtfGvWxzxOFRU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-1CBaE8qFM7qs5bE-ZUZOrA-1; Sun, 25 May 2025 12:09:14 -0400
X-MC-Unique: 1CBaE8qFM7qs5bE-ZUZOrA-1
X-Mimecast-MFC-AGG-ID: 1CBaE8qFM7qs5bE-ZUZOrA_1748189353
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-326ad1825c1so5148401fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748189353; x=1748794153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ffg9JhgzHanSNKrxP494YLN43u46uvcV5a+ThPPvFto=;
        b=iAXoCFamAOTci1tmoa3Q60dGl129vcuFDEpO71DngQIx7gL5zBDiW3wRyLW+0ZMhYR
         DdEcO6g1uqC/V5fnnsaE0hJAjYbRsSs+dqckwpbkwuWX0tHQbOw3pm8b/cLeCnD8jBqL
         qN/9BkM1afWTkKYBSo3OT1gXZFto5dDS3FPCiisp93d3+DUScT+GIdrKJkUPNWoQwWf7
         1Cxp9bCraFcpW6tsodxah+M8v5wz7FP/dp/7YThXW8gBeoHB8SLS5KOg3Ln9ZsIYvbzC
         elPia2xr6FwawiPQOxI7YjPRcSh+zv0ByeR1Rdy0jQj2q8NF688jBWq+y0gb24bqzWbX
         QcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrTI+ZzuAucbR/lCicxq+niLWgW18Qqxs+BP3i4GlK9sZzJ7nvZEba970m72ibTPwgSbDAgelt2/8kIfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbo4LqU+Q+vez+KbuIScXz4LerJ5HVQVMdHOc00ulwEUG0GwI
	INQr4bewSnoMVR+Im1yTIa9s2BLdnFd1yr4U2Ekam1HA47LoKtMbkVH02Mt195ZvVYZnPXWejM6
	m0tU9OkW7mDDwKwqsa9KHEy87auBoEW/GzhEDjSoppg0WHJgLVlgeujHzDlUDcxK8bXanYqD5Q9
	zR4QPbOutSaBSp/inZQlujvwt/cU+XXWdLmuUgPn1+
X-Gm-Gg: ASbGncs5OVLXVmnnUd1ydlnBjwoP4mH2gePCPbEaVlEAjKN3sV7A5Fg36EA/uMFPqJS
	TabK8b7LLT4meEWWYP11JjsVFHIWxeVuQrwjBrIDZgQqppFlTR0s/0JuuX4BlFwPu3XAUMg==
X-Received: by 2002:a05:651c:e18:b0:328:fa4:a2eb with SMTP id 38308e7fff4ca-3295ba7ddb0mr12324571fa.39.1748189353200;
        Sun, 25 May 2025 09:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcMGdsaCrwFc0FE4fhxa7X5OhDthEmTx38a3YCrLf4RDx/KUvo9hT7sFPU4JxMsrINU29qCbhEO1FVbKqk+p8=
X-Received: by 2002:a05:651c:e18:b0:328:fa4:a2eb with SMTP id
 38308e7fff4ca-3295ba7ddb0mr12324451fa.39.1748189352772; Sun, 25 May 2025
 09:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-6-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-6-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 00:09:01 +0800
X-Gm-Features: AX0GCFs-UktoFLyWjJuWuxOxD47dA6X-b3ziuvS_X48i_5D0P0nWevorFszf0Dw
Message-ID: <CALTww2-WsVnfqCwA_8c9Wv993Bs6L=f78UbFLddufspns8pjMA@mail.gmail.com>
Subject: Re: [PATCH 05/23] md/md-bitmap: remove parameter slot from bitmap_create()
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
> All callers pass in '-1' for 'slot', hence it can be removed.
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md-bitmap.c | 6 +++---
>  drivers/md/md-bitmap.h | 2 +-
>  drivers/md/md.c        | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 848626049dea..17d41a7b30ce 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -2185,9 +2185,9 @@ static struct bitmap *__bitmap_create(struct mddev =
*mddev, int slot)
>         return ERR_PTR(err);
>  }
>
> -static int bitmap_create(struct mddev *mddev, int slot)
> +static int bitmap_create(struct mddev *mddev)
>  {
> -       struct bitmap *bitmap =3D __bitmap_create(mddev, slot);
> +       struct bitmap *bitmap =3D __bitmap_create(mddev, -1);
>
>         if (IS_ERR(bitmap))
>                 return PTR_ERR(bitmap);
> @@ -2649,7 +2649,7 @@ location_store(struct mddev *mddev, const char *buf=
, size_t len)
>                         }
>
>                         mddev->bitmap_info.offset =3D offset;
> -                       rv =3D bitmap_create(mddev, -1);
> +                       rv =3D bitmap_create(mddev);
>                         if (rv)
>                                 goto out;
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 4d804c07dbdd..2b99ddef7a41 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -77,7 +77,7 @@ struct bitmap_operations {
>         struct md_submodule_head head;
>
>         bool (*enabled)(void *data);
> -       int (*create)(struct mddev *mddev, int slot);
> +       int (*create)(struct mddev *mddev);
>         int (*resize)(struct mddev *mddev, sector_t blocks, int chunksize=
);
>
>         int (*load)(struct mddev *mddev);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 466087cef4f9..311e52d5173d 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -6255,7 +6255,7 @@ int md_run(struct mddev *mddev)
>         }
>         if (err =3D=3D 0 && pers->sync_request && md_bitmap_registered(md=
dev) &&
>             (mddev->bitmap_info.file || mddev->bitmap_info.offset)) {
> -               err =3D mddev->bitmap_ops->create(mddev, -1);
> +               err =3D mddev->bitmap_ops->create(mddev);
>                 if (err)
>                         pr_warn("%s: failed to create bitmap (%d)\n",
>                                 mdname(mddev), err);
> @@ -7324,7 +7324,7 @@ static int set_bitmap_file(struct mddev *mddev, int=
 fd)
>         err =3D 0;
>         if (mddev->pers) {
>                 if (fd >=3D 0) {
> -                       err =3D mddev->bitmap_ops->create(mddev, -1);
> +                       err =3D mddev->bitmap_ops->create(mddev);
>                         if (!err)
>                                 err =3D mddev->bitmap_ops->load(mddev);
>
> @@ -7648,7 +7648,7 @@ static int update_array_info(struct mddev *mddev, m=
du_array_info_t *info)
>                                 mddev->bitmap_info.default_offset;
>                         mddev->bitmap_info.space =3D
>                                 mddev->bitmap_info.default_space;
> -                       rv =3D mddev->bitmap_ops->create(mddev, -1);
> +                       rv =3D mddev->bitmap_ops->create(mddev);
>                         if (!rv)
>                                 rv =3D mddev->bitmap_ops->load(mddev);
>
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

