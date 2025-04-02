Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3B53BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589136; cv=none; b=IYMCBk9FXV83W6oH0TQCUjH+s2Ldrlx+zZOYgbwNmnJfcenIl93QpBNfVaVv5EdyIUrWcDctYgilNLL2nCVGgfFGQKW8T1C9s/YYgGxuFeLD0c2crFRjIlUBwz/MD5ijjH/KKGy1e9vb2rbO8R8SnGI2jbRcGaf/cNU7aqGphMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589136; c=relaxed/simple;
	bh=QjXQhB715E3M3gxBEyLXFxdteNgJJyJ4lo2CrJN35Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMLW4pRXzF4AUDlZ2wAQEJ3P0FvjSmxodFH5IDVS29olGTdx91eErHmwirL/zHv0MQUqvRAHEknqJmsy1hXauqMd1MR7sjRnqjdOE4auVGhN9zRkEBeAgyI32YcIU5rWp4MAM7D1tfwRz9wncQS8xxGluD+FHWuR6ACG73/NKdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WQ+GI5z0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WQ+GI5z0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso10515031a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743589135; x=1744193935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
        b=WQ+GI5z0JOt3ImywXdfCvuRR9txtK90Pzu8ElOmxwc22H3wVFXEtuYHW7LRPSj0F8/
         W5fHls4JipToTSGXXHh+OuVQE0q3hBhJ76Nw0VeJdr4aPxSzQ9z6cs0RSH/P1oTF0Uod
         dcM/dInvTuKhuWA+FDhNarb4YYLOvQ4R6sve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589135; x=1744193935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
        b=rvZ2s2gmuMug68wbsg6++dU5fL3+4lvxlYwZlvKpnmugd2pYPF5arza9vTXq5d04QZ
         tQqikxIznqERV51cYAyPX2ENeRU6IcPrrq/ktyZvcBufWLDpFCAJQ6XM9UsGRscQBdf7
         JiCTnrKX1yNEIndIirSF1Qjy5tsPO5a+6a61+r6hA6gX3iswXbw9KQ9XpPFbRpa1zefT
         hGX7wOEKhWccsnBuv0n4iUgbJyaDNaj1OO5Ch8C6JOfB3anyrC6XLL8MZL+HD5mpMg1e
         vDnkYkMMxn++qCNf+a5ADttpydthOzgGRxvK2IOcfPAHQRSy8BMFtRmgLyBq/0RR91xC
         5CsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgr05l8NEQ3XSTgaUD47TfpmHdU9Z/hz5l+JehWGvEQB15BRMj1nJh2OZeLc0Fat46spuWjp98AgOP2nM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2LbFz1WVSTG8f2OiBgtBIjhfsE/4GJkVb0FXZ79+DsJnw7Kd
	hWdOSCf0Q+saAxybUrQg38biV1dwiSX3Srnc2o3d9DnuW4gn052bmmeXGirIXLgEyHmx3qomBb2
	dsvTtz7SkiZGJJVgdoqPrEH6sFUnLiVn95pAW
X-Gm-Gg: ASbGnctnCTf6IFigH48+n/N+8gDS5vYggSpchp3qX4fqJwLxQ4bu3Ffz1HJqll6gdZw
	1M0mWw08ob2hM5HDyrlUvZUwnXIAzteWReMtpw2goVIkGI8juyhChWYlqBRCRnmb3V/DF2jrERA
	v5SkskF9/JyNE2Gicqq5RrorJd8oqGmIpQHLFWHXXFL3ilbAcLogHM
X-Google-Smtp-Source: AGHT+IGQrnkGyKn8dVTSUjKIJxy2/wcmbcJv3W5smbWJ2t/E7cpQH6SMGOxQZ5dG0vuNvno9IYMLbv3UhEax8FtatNA=
X-Received: by 2002:a17:90a:c88b:b0:2ff:7c2d:6ff3 with SMTP id
 98e67ed59e1d1-3056ef48b43mr2719742a91.35.1743589134726; Wed, 02 Apr 2025
 03:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:18:41 +0800
X-Gm-Features: AQ5f1Jr3BoD2em-LznhL9zgkOSxDEEueTpI7DlFY2HYoRHnyStO_tGh8xaXUAvA
Message-ID: <CAGXv+5GsoHN5mVe_kEP+oAzxa9HqgfhoiDqvO3xiQurFrvQ3qA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/mediatek: Fix kobject put for component sub-drivers
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
> In function mtk_drm_get_all_priv(), this driver is incrementing

              ^ mtk_drm_get_all_drm_priv()

> the refcount for the sub-drivers of mediatek-drm with a call to
> device_find_child() when taking a reference to all of those child
> devices.

Looking closer, that function is also missing a platform_device_put()
to match of_find_device_by_node().

> When the component bind fails multiple times this results in a
> refcount_t overflow, as the reference count is never decremented:
> fix that by adding a call to put_device() for all of the mmsys
> devices in a loop, in error cases of mtk_drm_bind() and in the
> mtk_drm_unbind() callback.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a8fbccb50c74..6b31df587507 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -676,6 +676,10 @@ static int mtk_drm_bind(struct device *dev)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
>  err_put_dev:
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               /* For device_find_child in mtk_drm_get_all_priv() */
> +               put_device(private->all_drm_private[i]->dev);
> +       }
>         put_device(private->mutex_dev);
>         return ret;
>  }
> @@ -683,6 +687,7 @@ static int mtk_drm_bind(struct device *dev)
>  static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> +       int i;
>
>         /* for multi mmsys dev, unregister drm dev in mmsys master */
>         if (private->drm_master) {
> @@ -690,6 +695,10 @@ static void mtk_drm_unbind(struct device *dev)
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
>
> +               for (i =3D 0; i < private->data->mmsys_dev_num; i++) {

Just FYI you can also declare the int within the for statement.

ChenYu

> +                       /* For device_find_child in mtk_drm_get_all_priv(=
) */
> +                       put_device(private->all_drm_private[i]->dev);
> +               }
>                 put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
> --
> 2.48.1
>
