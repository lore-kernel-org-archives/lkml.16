Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DA1E8358
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586698; cv=none; b=ClaGywF9hvWC4QWgcTWxF4rnvrAwYSS6ZBPwu8GsM8nqja8Zn2z+X6WVnkC3qqcKDlNm0MLdjMPrNUk6clKrimNFtQP62evYcw3CcHSt6cbqUY42rW6CEj90mVkE1HUbITySP09DaoVyjLUaSm4C+mw+tbt7I3lJ48MVzyhbxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586698; c=relaxed/simple;
	bh=cNejXleJqme9VajQRcc+kziIQxuHNEBzuJikNqfdGkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz4qXDs6jPjmgP8nHrxDpy+/S6P5+QQ1QoTASLs9nAVK6Mj187HROi+tVY9YuREPNVbZ7Z8tdF4biexlmdI6Pg7UrsvrstxIqn6B2n2YvxRrsswqw0+cu29vWCTQZ1xPxThgVQ/rf3Mw9OBWBuaQPMBAwaFyaDUiEcHa1wAH8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EvuX8XBf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EvuX8XBf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfed67e08so65908691fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586695; x=1744191495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
        b=EvuX8XBfegM0w+PJzDZUk906DKGQ1kEXf/O5tAVlB/xSvl3MlkqZHQHgDQonI5VDr2
         K6ZT8IifsQQYz14xQ0MDKCZ1XkSOe+HfJRkBfCL4XqxUvqwzsJjbJBF3A1I+AM9WaNuB
         WAi1mSpAze6MzTNlyTkNtJ7KrNHiU8kFspZVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586695; x=1744191495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
        b=iksQvZycDFOYFHBYj6W8CnzltVXLK9Vfq/VQVIm7Fxdp8RTkYwLXRm2GyrwRTJsv2x
         UULgWIJLsWYwVdUgAXjALkYJ19GJ5r85/vIjIIQuAM8iJ5gsmuA8FbJYoRzH4kjGQLJn
         zhE2IxajJSg/eWTusEMjNu9shVSwkfnQOx+LwNXyWX7i95iiIqjTf5dMk2t3uvXXUdU0
         iLlnxkFkxnbwyX/QAWH5utbB7VYUbw4drtRHod1b/NOOKazvmDKdn5aUCYkNBvNwQwXE
         Urmiibph6H6Herrze2dFT2dC4WBXjdLmcSvxopQyjIag/9gYmOvRecMtux3OeNoU75Es
         IRwA==
X-Forwarded-Encrypted: i=1; AJvYcCXoF56viYlGz/GJjhH9r7ArRU5PHrhtrvnjYjdvb8GboxhEixLGahU0fmLvkRb2bSx6pEZYktQzwkRMNEI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1ZzDqoIejlRsEp8Pot0KlSFwG+qsg9KMkGIKykoMXY3TuLna
	3e/djeCuPohYxHQdEmNhEXl0gBGVcpcZt7B9/qu78wnOfU8nU0VXCqvbz2GMTu9GU+OIzUsJcjS
	gYMBCai5tuKnVFdrwNSmbpDc+HyBvkdGb6awH
X-Gm-Gg: ASbGncu2z0OOYS2rxCrXtNfqpo7zavV3I1NrCEm3CL8OB74dLPwvfwzWJ/Nh+P56thw
	cWohxb7kJ18ZRzmQQNk48sarPMa7Q9FZaNuvOphIwXl6hPQa2RVkdO8fOtUuiOyg2u6W2ERry6W
	m5nE3gFNQe0drcf2gZRJasuYZYbyNxAuGOZ9lZXZemdU5EFLr0HRCmRbRG2ECnVhE=
X-Google-Smtp-Source: AGHT+IExYrNEjA4pPxITL5Kgnipvtbv102T/YS0lH31Fsyobnp9W1LSzaQUExnLdiCH6E51BoFuI8ihy0vHN4Nlyq+I=
X-Received: by 2002:a2e:be0f:0:b0:30c:5c6:91e0 with SMTP id
 38308e7fff4ca-30de0231a0cmr50673981fa.2.1743586694676; Wed, 02 Apr 2025
 02:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:38:03 +0800
X-Gm-Features: AQ5f1Jo5jbEeaCvlhXWHAtzwNK4wbBL1go7L3GIt1qsXbC424ywOaYMmnHcwKAY
Message-ID: <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable
 interrupt on bind/unbind
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
> The OVL driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
> and then set the NOAUTOEN flag to the irq before installing the ISR
> to manually call enable_irq() and disable_irq() in the bind and
> unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index df82cea4bb79..1bff3a1273f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>         struct drm_crtc                 *crtc;
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_ovl_data  *data;
>         void                            (*vblank_cb)(void *data);
> @@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>  static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>                              void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       enable_irq(priv->irq);
>         return 0;
>  }
>
>  static void mtk_disp_ovl_unbind(struct device *dev, struct device *maste=
r,
>                                 void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_ovl_component_ops =3D {
> @@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_ovl *priv;
>         struct resource *res;
> -       int irq;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
>
>         priv->clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(priv->clk))
> @@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         priv->data =3D of_device_get_match_data(dev);
>         platform_set_drvdata(pdev, priv);
>
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler=
,
>                                IRQF_TRIGGER_NONE, dev_name(dev), priv);

Use IRQF_NO_AUTOEN here? Also, IRQF_TRIGGER_NONE can be dropped.

Make sense otherwise.

ChenYu

>         if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
>
>         pm_runtime_enable(dev);
>
> --
> 2.48.1
>
