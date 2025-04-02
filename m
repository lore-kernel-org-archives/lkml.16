Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476562356BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588891; cv=none; b=BiH1xzIiah+PpHMwEJGIrg49+8A9bzyyYNeSEanob35NTp7Bh3vVkr+CL028VSDPtYd/33yWNXN9kmW0z34b/7dIfe7mvF6nsEICfp/qJl1tOEhz1RJoCCTB3Jt9tP5/KMCgZVOj5MYuPW7ABq85ErAxjXGXfcwekUsaBta/jEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588891; c=relaxed/simple;
	bh=PYpXZOz364eHZ/pUDlDFDhP8CHyqbwYHxIwb2J8WZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdRexaJhWtfrnm4T7ftvgpAVUDGFyF1FzLeflJdGtoF7xGGhKiigvOZA/dlbZZuVvSjwBtXBJzBhZNfdu6Imv22pGa2gqQpplkE+R7pa7r6kNBa03Zs3FlFG3C2S0IbNANQ6wWSxp9gqflZzqGh4ljQCTc4t9XGik6db92F39vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bp3oMV+m; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bp3oMV+m"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3035858c687so9080465a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743588889; x=1744193689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
        b=Bp3oMV+mMmSS1TFqkfPiXeV/bUm0Dj7QaoW2S9rlsFmaf36DNqSIfrNfYH2FxE1kz0
         FltYvSrVJNLXKWkT6C55n9TdiV4z1/XRhlHAjgec9ZzNIfcPS/R5PpQ84lGB0C+3AZZc
         ewsvywzhLq8vtzy8ZrJqEH/ncaFBD9JvYHTy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588889; x=1744193689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
        b=JCAYjMxRQbWA1CyYh20lgJPi74VzMKedGAHCvEZQyrLV/tTynQBoNUJ5QFo3U5X2zY
         Hl1Q+j9Sxyh8Z5+53cYxZ/KzD/T0rzA8n7UQMRfFQzzQPVcQIe59CPuERCmDpjrKZQQI
         9WIVO3bGuxHwzCjtI5BjspksXkMV4O3jnqiEI+oMd3Gg9mJ3bEKxyBgQ9gCX0v1DvQKS
         s0hFTYkJsCsIay8h8Ged8w0XoqfoAwel1C43t6qeo5AnZjWyrYeXH1sosN4EhofcVVcy
         Z0oC0W/iXoNs4TstDhWA6gc0xsQmKVP8DwjcmusvaAKC+5T1tVkGBBbMp97Mh2ExBiLB
         8Ygg==
X-Forwarded-Encrypted: i=1; AJvYcCUcnNXUYNwN+cVh53v57g3ltCxW+dsOA99r83kp3wAiXpD9JuYQJycoctUVfEyFYQKCALtTs72IJTwcrAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjDL+Thcx3g2oY4yMdzxuBKQlSagKkhtbPq8OnCM4eDmUE7lb
	DPVJMiaYN9LCLcDNRu9gQqTvPAvb7lXeGrf0oXVh5IHUKAP4TkC7xXh50P67Hef4T3JiqkXaHY4
	z/aFij0cZ9A+FllLNvFGpQuV5PaamV7UrnJYG
X-Gm-Gg: ASbGncs209YQ4nLnPIvJCJRqw7ljh6OXHsCcwPqJh+5ZQ1oHcn29mwcgMjjmBSzn0fe
	JqUNlA3dx+uS/ASApLCtjXOQKH7ClBBim2h97g0syhxi5R89yTObPKO0IASu5thyVfGBIp4nO/S
	GHhUfDYXSTv3+lWDsR8VZBMHXJNwL6skTDHcvlUW/8k4OXuaizJUkY
X-Google-Smtp-Source: AGHT+IH4KbDIAmz8gZLfVjOiL+nuNvvi6uk1SQsIGj72ELmQEPT6v+Qk+JdsGhfa3B8h399dfK9zguZ+jHJ7xZMou58=
X-Received: by 2002:a17:90a:d2ce:b0:2ff:5a9d:9390 with SMTP id
 98e67ed59e1d1-30531f957a3mr24885869a91.8.1743588889523; Wed, 02 Apr 2025
 03:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:14:36 +0800
X-Gm-Features: AQ5f1Jooc0a6tL_Gl6htqIUeZsyBaGUQis_xndlOKQ_9u_xfpEMy_zMefycOXDw
Message-ID: <CAGXv+5HUJUL342uMA7wjmm8TsBUveVa0i8k+BfB2aZXd--AoKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/mediatek: mtk_drm_drv: Fix kobject put for
 mtk_mutex device ptr
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This driver is taking a kobject for mtk_mutex only once per mmsys
> device for each drm-mediatek driver instance, differently from the
> behavior with other components, but it is decrementing the kobj's
> refcount in a loop and once per mmsys: this is not right and will
> result in a refcount_t underflow warning when mediatek-drm returns
> multiple probe deferrals in one boot (or when manually bound and
> unbound).
>
> Besides that, the refcount for mutex_dev was not decremented for
> error cases in mtk_drm_bind(), causing another refcount_t warning
> but this time for overflow, when the failure happens not during
> driver bind but during component bind.
>
> In order to fix one of the reasons why this is happening, remove
> the put_device(xx->mutex_dev) loop from the mtk_drm_kms_init()'s
> put_mutex_dev label (and drop the label) and add a single call to
> correctly free the single incremented refcount of mutex_dev to
> the mtk_drm_unbind() function to fix the refcount_t underflow.
>
> Moreover, add the same call to the error cases in mtk_drm_bind()
> to fix the refcount_t overflow.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e09578756de0..a8fbccb50c74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -464,7 +464,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
> -               goto put_mutex_dev;
> +               return ret;
>
>         drm->mode_config.min_width =3D 64;
>         drm->mode_config.min_height =3D 64;
> @@ -483,7 +483,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
>                 if (ret)
> -                       goto put_mutex_dev;
> +                       return ret;
>         }
>
>         /*
> @@ -576,9 +576,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  err_component_unbind:
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 component_unbind_all(private->all_drm_private[i]->dev, dr=
m);
> -put_mutex_dev:
> -       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> -               put_device(private->all_drm_private[i]->mutex_dev);
>
>         return ret;
>  }
> @@ -649,8 +646,10 @@ static int mtk_drm_bind(struct device *dev)
>                 return 0;
>
>         drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
> -       if (IS_ERR(drm))
> -               return PTR_ERR(drm);
> +       if (IS_ERR(drm)) {
> +               ret =3D PTR_ERR(drm);
> +               goto err_put_dev;
> +       }
>
>         private->drm_master =3D true;
>         drm->dev_private =3D private;
> @@ -676,6 +675,8 @@ static int mtk_drm_bind(struct device *dev)
>         drm_dev_put(drm);
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
> +err_put_dev:
> +       put_device(private->mutex_dev);
>         return ret;
>  }
>
> @@ -688,6 +689,8 @@ static void mtk_drm_unbind(struct device *dev)
>                 drm_dev_unregister(private->drm);
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
> +
> +               put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
>         private->drm_master =3D false;
> --
> 2.48.1
>
