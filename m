Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF920E01F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586980; cv=none; b=XOBZguM4AKb3tDM0tOYTuj2EqVdrJob+Pr/IDq3rP71CgPVvX77W9CkV/dGwrvdXoz8C9V76WLU1TX3MsgHALT4/1fF3lqcEwBLOPKgBMgEpeAr8WnYq9SRT1thrbKFlymrhKKC3XViespMz1GXDXvNIxZ7zxcCaadSifpuuXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586980; c=relaxed/simple;
	bh=gf4WikBsRL7xJHYzr/U7FoEvzFC5fFIou1PnZHTEqiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Csm3R08iYeHDtbUAQWGGImb1majtqvmfIAonmnqCsldZEGy/kGUSujB1bLfGCcE5yNh1W1dPkYlnMsYkQqN7yM4vgGrYOYvvpxTBXVsM17+UJkkKXsDELr6P8bnu64ZPgqX1O6Jl/FJk9KzMwb+PrGP78JfFWExzQOBYqJwt+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JvGyoQfL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JvGyoQfL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so62632655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586978; x=1744191778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=JvGyoQfLlbWc9PeTByMXad+KIebSYHfMZ1BalGz9+uwXTzbY540KrQjbsT1HwPeyrp
         1gLt+de+urZ6G4WCyvjypZYAEIl391b2wkfimGG8oo1A9ygdKOJLNfwgWJ/T59hPidzQ
         WD1f7EofTPJDwuNaE0kE4u/SGPDMhngMP88GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586978; x=1744191778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=Vw+p/Fg8T5FU7QdpzCEwefNCEpqhsxLm6QwN0mRhEVCLEiJO8OdJ4AGO2ZoHSIemH7
         8nAmrHKFfjGTubvDJdCL5rEMJvhnIxWdXrD1iMM+YfTY00vwEKDcBjwbmIHJl27YK8Il
         QTmfA6B+U8gxEIr0zXvI+Z8ixQqB77R77penUKc/lSsjH/BBW3X2Ug7qURFibZ9ZGqJj
         sgoPC/HztsgXxWfyfzeNGUkAVbXBFxa81gTo92G3kmyPRyFYBz+xZKeE+lipe4zPADxV
         07C2sC+79u8ZYgnAMxahvFNyoYqTHexM7DfT9iCdCdy+Yi+gMLUticdl43i8xkdvUK6+
         KwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdyHZmDuZ0EgawaUnEhLYvxLW3+fknPSAGEnc3fFY7jYcMhXjb2HfT46whviMuEDdSeKwCUVbLh9jLyXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/qqFLyKm+fT679EbQ1ZOfWJh7+cAxzLxzZxILGHQxQ/lTNqx
	f/3+W5wlfzfqXixLE+WUvWRHqGqi4wXPhUVNfhBta3WiNSfilV3HsyXl43kz4tSGKc+r6uql4ol
	YIBiOqHkhf1YYpIu49fepERe7TFpeqOBxlH2T
X-Gm-Gg: ASbGncveEiNTKg4SBlseglfaa3UgDxBoNhuVOHEF8XLCha5bTVaFiEDPOx0BS3RN88v
	DhB/cNu3H+TNETCljnuCDfWoIzaZMEWPkL2dDTBoZcjFwdqodcz1MYB38cozag4cl3RjiCj8dqd
	LQTo4yRdXn/hGtCzLYKyfAfELasVRn3benJEFKZd1Xmgu2BagCA8+V
X-Google-Smtp-Source: AGHT+IGMZDQXr98ZNR/OTYIob8ILLj+AqDEEsuZ8JN3W+IxwuRQKfzlFXjpxIo8J+CbSTybZ0f55Aqhe9qvbkLunHuc=
X-Received: by 2002:a17:903:1110:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2296c65f3b4mr20133075ad.17.1743586978295; Wed, 02 Apr 2025
 02:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:42:45 +0800
X-Gm-Features: AQ5f1JpfpbwiH6bCyV4YV_ME0bLhkIPk06VpTzeijPYQFz6wYmEpVSh-GkNPq_Y
Message-ID: <CAGXv+5EnGbYTPh9vrrcn0T1oskCY=AHDJsd1rfGw4MiPoUAAxQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable
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
> The RDMA driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, like done in the OVL driver, add a new `irq`
> member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
> the irq before installing the ISR to manually disable and clear
> the hwirqs with register writes, and enable_irq() and disable_irq()
> in the bind and unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index bf47790e4d6b..8c5021365a04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
>  struct mtk_disp_rdma {
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_rdma_data *data;
>         void                            (*vblank_cb)(void *data);
> @@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsi=
gned int idx,
>  static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
>                               void *data)
>  {
> -       return 0;
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       /* Disable and clear pending interrupts */
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
>
> +       enable_irq(priv->irq);
> +
> +       return 0;
>  }
>
>  static void mtk_disp_rdma_unbind(struct device *dev, struct device *mast=
er,
>                                  void *data)
>  {
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_rdma_component_ops =3D {
> @@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_rdma *priv;
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
> @@ -347,21 +357,18 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         if (ret && (ret !=3D -EINVAL))
>                 return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
> -       /* Disable and clear pending interrupts */
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> -
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv);
> -       if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> -
>         priv->data =3D of_device_get_match_data(dev);
>
>         platform_set_drvdata(pdev, priv);
>
>         pm_runtime_enable(dev);
>
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handle=
r,
> +                              IRQF_TRIGGER_NONE, dev_name(dev), priv);

Same comment as OVL driver change.

ChenYu

> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
> +
>         ret =3D component_add(dev, &mtk_disp_rdma_component_ops);
>         if (ret) {
>                 pm_runtime_disable(dev);
> --
> 2.48.1
>
