Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7016328FFC9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336698; cv=none; b=WCmyk11AiI2oHhnxIPdxg7Gr/nj7ZdbthyVwkrykxXddDhozEoyoQ5of1gInlaYOjopqCXk39kLtBvipVUZbyv/bJgJleXrk7viidRUloofuVopUl4E1tJ9bLtjE9JXR9uoLudRck41KqogHP719nxCwONMrVlPf+EDfoLew10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336698; c=relaxed/simple;
	bh=0uC9hDvG6Lild9gA1LK9DD8f+xmCy87GoAULaus/E60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZyqnIGkS7x1Qirf1+apJHel9KGUw/+xN7bTkLDFDXD3qW1B+ogJfKec/+R9O9rr4meW8EDhzshuLTwrdVCWfD3nBmpjy2WGx20kHkUdUO5+D8yac0nL4MCasOTjanL2e3ioQxgj3q2vsVr9TwQIcCqbsUmvh5TrJMCStOLBLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reHsgTtl; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reHsgTtl"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fee50bfea5so42301107b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336695; x=1745941495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2BgYWZLFi0BzqpeykX3IbiFarxM1CV0Y1YZ98qOBQX4=;
        b=reHsgTtlJukJyqwhf5YeI19Lo7MHy+Exvp8yy02qe/1er3A91+bDSn5d7IF5aGtYI/
         nwNndeB+pHeWylZ1y0d7bloyDOahcY6nbUMeDCsdLL5jrIE24prpzAbBe8+AXbL6/2dY
         seDY5dXWb3GzwzZMbxPAd60NWwmHoplPdtg8ZTAxzRcd2okjJVnYAbOWNXIOFCjrUCjZ
         tL7QkXh/VjAAGWmhlluONvj8wY2BTf6wH08Stk4G9ABClN3p4qB9uYEh6NeO6VoPp5A6
         ZBijSk4UgIIPZvqn8cPP4Q4ASTQUZHemFS/l8ahTP3fQ/vZ2nEUvAVY48Zr60Zq1MXvF
         VhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336695; x=1745941495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BgYWZLFi0BzqpeykX3IbiFarxM1CV0Y1YZ98qOBQX4=;
        b=HV9V7Jc6hhpRKrFzksJovk06KlVbFs9bc8RZ64WuyAvU7p9eXfYqP7cw7MW/O89JPK
         Cykzivm1iNyNGW3nRJA/Tjz82jJxYDLMbaf7/4gZ33KJl9r9JrzczW8E6ZHYe/I+SLZ0
         aRD/uPX1+ClVPVedyoR6C5ji8vkzfWRq0px33LOX8TsgYwVZ2DitUKwk6LJFjGASpGPH
         3LRs7Y/lrO/XtO4MAQ9mqfHLbMQ+4epNVOn8cjn8aUH09278CQN0KksAb9BN4LG1hBjn
         gyhkreIlkjV4wNtApq82rF4fugO9JU/Gyc1mgJ/apUNs2jI9VcJTpa5V6fj9Q1dRFo1C
         HoIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZPBjf+2ivXTAaCwwdBFF/DxpI0RhHXkQFH11gEhuHkWF6S/vRaNxE4TNNTVOo721bet0SLRemdAVOd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+hgxYmlYIvb0fv3GKTOzAiwJfwuubZ5AV99T+xlA6SkuT90v
	SVlbg9eh8AI7ZdWdExWvApOjKJWlJShoMSTHoNixSgS7rRi45C/sfiBKqmlviuuKlhb2JsemX4V
	r3aJXCBDO5Qhqz1Nd68nudKXSeCGZBODdqnRcpw==
X-Gm-Gg: ASbGnctjJettXcxRULIyjSiJx/UpYwhmaTdLdtM4K43cC+pcaw1341H6oxm7z9fXdJq
	WWJ+nouM6hOzmroIuI8XbdihfOEwDfsGnMRC2j/EM4M6yRtMVGCnlGk93jcVVwcSqjrVKcnsuRV
	OOLQyZMXi/7okc4nCwejhowM0=
X-Google-Smtp-Source: AGHT+IFSpOs8RAYN+sIgp07pZ/zas3zROHM0EL+kdxewAnv20qaOE/aRuCgf16SXsDNXFuvyxiQZthMFR3MfKhf0i8Y=
X-Received: by 2002:a05:690c:9a93:b0:6fe:aa66:5d82 with SMTP id
 00721157ae682-706ccd391e4mr206503327b3.19.1745336695245; Tue, 22 Apr 2025
 08:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411054134.31822-1-axe.yang@mediatek.com>
In-Reply-To: <20250411054134.31822-1-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:19 +0200
X-Gm-Features: ATxdqUFCHfbNl6lm_6jR4t8XeT2NGUGpC0QBxnoaIFI_lKX3UJ03xh81cx0l_ZI
Message-ID: <CAPDyKFrWJBswaAE2_ydswWa9EUw8Lsd_=mCN7gm8ou1_XAcMfQ@mail.gmail.com>
Subject: Re: [RESEND v2] mmc: mtk-sd: Add condition to enable 'single' burst type
To: Axe Yang <axe.yang@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yong.mao@mediatek.com, 
	qingliang.li@mediatek.com, andy-ld.lu@mediatek.com, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Apr 2025 at 07:41, Axe Yang <axe.yang@mediatek.com> wrote:
>
> This change add a condition for 'single' burst type selection.
>
> Read AXI_LEN field from EMMC50_CFG2(AHB2AXI wrapper) register, if the
> value is not 0, it means the HWIP is using AXI as AMBA bus, which do
> not support 'single' burst type.
>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> This change dependents on 'mmc: mtk-sd: Cleanups for register R/W':
>
> https://patchwork.kernel.org/project/linux-mediatek/cover/20250325110701.52623-1-angelogioacchino.delregno@collabora.com/
> ---
>  drivers/mmc/host/mtk-sd.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ceeae1aeac94..2e4bd5166c17 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -84,6 +84,7 @@
>  #define EMMC51_CFG0     0x204
>  #define EMMC50_CFG0      0x208
>  #define EMMC50_CFG1      0x20c
> +#define EMMC50_CFG2      0x21c
>  #define EMMC50_CFG3      0x220
>  #define SDC_FIFO_CFG     0x228
>  #define CQHCI_SETTING   0x7fc
> @@ -306,7 +307,10 @@
>  /* EMMC50_CFG1 mask */
>  #define EMMC50_CFG1_DS_CFG        BIT(28)  /* RW */
>
> -#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)  /* RW */
> +/* EMMC50_CFG2 mask */
> +#define EMMC50_CFG2_AXI_SET_LEN   GENMASK(27, 24) /* RW */
> +
> +#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)   /* RW */
>
>  #define SDC_FIFO_CFG_WRVALIDSEL   BIT(24)  /* RW */
>  #define SDC_FIFO_CFG_RDVALIDSEL   BIT(25)  /* RW */
> @@ -1917,9 +1921,13 @@ static void msdc_init_hw(struct msdc_host *host)
>         pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_CMDTA, 1);
>         pb1_val |= MSDC_PB1_DDR_CMD_FIX_SEL;
>
> -       /* Set single burst mode, auto sync state clear, block gap stop clk */
> -       pb1_val |= MSDC_PB1_SINGLE_BURST | MSDC_PB1_RSVD20 |
> -                  MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
> +       /* Support 'single' burst type only when AXI_LEN is 0 */
> +       sdr_get_field(host->base + EMMC50_CFG2, EMMC50_CFG2_AXI_SET_LEN, &val);
> +       if (!val)
> +               pb1_val |= MSDC_PB1_SINGLE_BURST;
> +
> +       /* Set auto sync state clear, block gap stop clk */
> +       pb1_val |= MSDC_PB1_RSVD20 | MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
>
>         /* Set low power DCM, use HCLK for GDMA, use MSDC CLK for everything else */
>         pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |
> --
> 2.46.0
>
