Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB45E236A72
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589181; cv=none; b=BvZRmvnXIXGPsdubiWGzWTM8KhNa4fcmvNwX1B3C1It3C/e8SawOmrebJkFV+r8Ao6VLhv7rlomW58cvuyoETGMbgFFOLphE59jZHK9gU4i02nZNREBhhyU6fSEeVcTlSK0aG5WnxAMPCK5gttQHKS/cOxQeXq4sLJyuOd2atvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589181; c=relaxed/simple;
	bh=Ne8Sh/EWe1a4ZmE8CVoTxWutV6wwjJwJoclVRYHi9O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7hNabht4bm6ywlPs5pty3dArDHCapnN71ewtixTEoxdi8XeZv1cfWKbA7PCF8hFwGwhsVbyvZcX9DoezaypWHZ67i6ycKeCQ958aN2V+4vCdvBzsJyBppX94WAJTHX+6BH/IpDO3DvumiPBKhFxcyIy8ltQw6mDkMvkqd4KkP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nz/f2Vjy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nz/f2Vjy"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301302a328bso11202890a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743589179; x=1744193979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=nz/f2Vjy8pxutvsa74omGuT/ACg1VwB8pHsZIL4iDsPHzq9jjvDwJPKOrpSEnXZRYf
         6ZCWxuSxlVOz0eiStfO2LxCAwrLCC2MpxBblLjzqYdo/niOgSLP4eifETTGwJSlydYn2
         +d9OZE2sqdu9UtoBiNHc/lZEVMacnXCeGNJKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589179; x=1744193979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=AnuS921ViFtjERwJVSBzX51x0OlYuAxf920OqDcn3WWyxpXV0ONsryUOLGOYKV2dcs
         LyWkN6GK+5PR7a6bW6AgT1f3Ov9uwV0WU1BmTluC1ZhaPDRIIDclJfOx+iMjdlAcjwti
         m8VOh5xUBmbk0vLmzE7U87BVgUh4drjjVUmW162DmGU5uXe/lSF1xNQr6h4SRyDivtKx
         Ly9o6yy/SWap+naCDKXerliaEiYYCEr5cvFjZFbw1gNU6+AM8+5mvSchp362xPInbOw3
         SZr7wOO1KLMbFJRlmfD+Z9NCBAOjZBKMoeOxddov5tXAM1UdZm1XheSiMtbNMVEnvLGC
         5MRA==
X-Forwarded-Encrypted: i=1; AJvYcCVGfP+MN5thKlGN8BycTQjIZjJmVyzLaoBOebF9ZmwCAQ6m4o5EfzhWrRezpjtfTqePu8Tk8kI54SMMwwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1N6z+ULNuuHKpBhi8rmIVjaiWkihN9GofIphkp6OA02jDe1+
	zcq7U15y3xQF742rAPztIIbaPgXFAjFXpgoXS+Xhkt/ydrPfNH5K2+YD5KKhPme4BKQ4sEsO4IX
	whnUK/7JwN3NQ9I1K440Wpb07iGgnfNvbY2mv
X-Gm-Gg: ASbGncvpM7+fSBGy9bjSXfnDX7n+23N8iMHlNs6gdhiD5fD7SQvC/3K/pZlahm4+/dc
	h9FOoBCw1ZyC0tF4EMObtQfPojoKysUyqMVYyUNBaDaWByrw4267uXptiYvgnZk2uVZP7b9gJ2j
	+QSfXk4uqLs1pW4h/yPTYVn2QsMr4x0NVapmQ+VDScF6UFBZ+NkvGO
X-Google-Smtp-Source: AGHT+IFc/gdat5Dr87A+81uJRFZWgnUw8FjScnpjhEXBVgVwotYa3CxXqBYBb5s66JTrRULG7QmLlhlnerHeo7QspTI=
X-Received: by 2002:a17:90b:3b50:b0:301:1bce:c258 with SMTP id
 98e67ed59e1d1-3053215e7femr19031005a91.22.1743589179070; Wed, 02 Apr 2025
 03:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:19:24 +0800
X-Gm-Features: AQ5f1Jr24z9TQrfYXn99ssRwXfkIHJUxBLD8IHIrUHUVmb0Bwvezsgoy_EISkMk
Message-ID: <CAGXv+5H1aww6Adf=EKCkpC8oCkdRLEHP5_fwtfU1BzEsnyi7NA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys
 components on err
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
> When calling component_bind_all(), if a component that is included
> in the list fails, all of those that have been successfully bound
> will be unbound, but this driver has two components lists for two
> actual devices, as in, each mmsys instance has its own components
> list.
>
> In case mmsys0 (or actually vdosys0) is able to bind all of its
> components, but the secondary one fails, all of the components of
> the first are kept bound, while the ones of mmsys1/vdosys1 are
> correctly cleaned up.
>
> This is not right because, in case of a failure, the components
> are re-bound for all of the mmsys/vdosys instances without caring
> about the ones that were previously left in a bound state.
>
> Fix that by calling component_unbind_all() on all of the previous
> component masters that succeeded binding all subdevices when any
> of the other masters errors out.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Makes sense.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6b31df587507..2d6562b29755 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
> -               if (ret)
> +               if (ret) {
> +                       while (--i >=3D 0)
> +                               component_unbind_all(private->all_drm_pri=
vate[i]->dev, drm);
>                         return ret;
> +               }
>         }
>
>         /*
> --
> 2.48.1
>
