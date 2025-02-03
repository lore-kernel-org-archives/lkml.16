Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCC20C489
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604483; cv=none; b=hG81KTtkgrVd6bEwOiU3IlS7nG3UptVAhNmgEyN/Xic0FrPI/eBcNJlt5K98wIZIxSetxrYh2iq9klEbA2vImul060Ov9GWQT3KBTXaZRLpt8ZWlesfNWtEAVMqRUZot1HZhvof8yBWhkCIs3M15uxDNJLFwcTtEWHeiEN0DG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604483; c=relaxed/simple;
	bh=z9pVmMeGmKTo76cVhM680EWq5pAOowzbKFXIbUL5tDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLjhuPyAg0yXD852uY+jXvnmw1KOPUds4Mgy0AehdUFsh4NRrSFANGCIv47eNF0Rk856+PdDHgsfnQ3sQl1+jRsQhaTF4ORaJx563QTr+lZT7fwxJklouVnVa0BN0nOLqIiVsJ9uEX7i+011X+DbSLPwr2Q6NUhselkoyAs5aCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U57a3UNj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U57a3UNj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-540201cfedbso4360929e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604479; x=1739209279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
        b=U57a3UNjOFDMnfcRmM6vMAC/v3LV4hzv2BnQvPT3VgnjckhPFLsjkiQw8XfAkdun3l
         Hi8I8ddA23KF86C2eW2MjGhB8HwzsSmMZmDx4zCCM/8Yick2Bc1m5bHZPj3VRD185jYU
         RFX/eutn0Y69jI0d+hGQF+ZOf9D7DPtbqVM9wm1F+9OSgJZkHZQhIPE4J2rakEdHS2yA
         Cc+mh2AZ9v3GldF8RCcw5Iu30Yyiy1bIRR+Ja4Ge/PIRZwADw6SIB7DFVL7iNyjhXIla
         uF+mDhqJpnOTUIkms3aVM78wjFgIzp7Kvm+C1L3cAJp4sgpmLuCM6mLwdAJPpl/vRDNa
         X9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604479; x=1739209279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
        b=gNpKNFoAuCwZdCUYiQHNw0C+2gz4RogjdPlxFzgK1gO6YBPVJ1L4MnxSUeWN1kQ4G3
         Lb1/YNqcIgxlsUWxS2K/FBkV5Y83rgEuOtrZT+IgAlTryyp8EFei5vcVNYUHZS6o99dJ
         pVM+A2A4rpqy41CrWxhyo3ucUkd4RHmuUcv/1rJU7OqiZOzqC2kP0LO9Geqj/nWnMnzI
         RKKUfhcGbbR17XecaowKt3HBKN53dqXchIaP8jj1fCCrJn2iVDrjaVkOiK304SbKQXiU
         lm20LKPLbD9ihyVuukyhz1EZkR0/lfIjuPg81/8LKvs9xlrM75lDZy0b2X8H9bxl8N+6
         8s8A==
X-Forwarded-Encrypted: i=1; AJvYcCUYA1n/AkKtC/koTg3sSG9N4miZX4ohoUGQNyr/kAXFAUGIBPPnC69X0g+qdCg1YrinWFWG6cV0NV4IJ2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYS68/Ip6XugIMfo8EG6KeFKNab7k4KSDT+JJlDOIJYye5xWLG
	lHFxGfISvcyK8Z++5qT541fhb/z3pHRlD/KpQpOmGDg3oNpnAVu7hdngqB79GXs=
X-Gm-Gg: ASbGncuIVK80d/b+3BjV1D7sOf4ihIJ28+cICzZebNFpWzbBrQJc9ze0Y9AC5mS3BQm
	cYTeB+B32bMaFXHVuCKWA237RMkt38tJlY0MW5JKpXl8ygmMNFDvHVy2T3MMrcO9MSmOqOvoswk
	o9+2lGgg6DlgLXmbaa4UTPufcHLl4XYp61O34QgJDfw7MwyMyG7D0XwXO9AP6k7u+P7p6ZdOM89
	ynxmmZbB86SlyC2elMilSe0IDzrzG296WJhJnXs/yxm1zO5oeF8+H+NRKwD+QAbofnO67HqJ06F
	Dktorzv1/FkT9bYDmoVcixjN82jt/SZotLkV2eRo/J/iF673x5eMO9nlBdTjjUikxY4GmYU=
X-Google-Smtp-Source: AGHT+IGMHXTAqiNtzIR1SWRvuj6gwq0wIP4uwvupjv/2fWX/inkjy/bcBUX6RWDJkRgSgVTBLrQfJQ==
X-Received: by 2002:a05:6512:3b98:b0:543:9a61:a2e7 with SMTP id 2adb3069b0e04-543e4c3fdd0mr8509343e87.48.1738604479389;
        Mon, 03 Feb 2025 09:41:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7953sm1340249e87.169.2025.02.03.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:41:18 -0800 (PST)
Date: Mon, 3 Feb 2025 19:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
>  
> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> +	spinlock_t pclk_mux_lock;
> +
>  	struct pll_7nm_cached_state cached_state;
>  
>  	struct dsi_pll_7nm *slave;
> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>  }
>  
> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> +					u32 val)
>  {
> +	unsigned long flags;
>  	u32 data;
>  
> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	data &= ~mask;
> +	data |= val & mask;
> +
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> +}
> +
> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +{
> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 data;
> +	u32 cfg_1 = BIT(5) | BIT(4);

Please define these two bits too.

>  
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> -
> -	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
>  }
>  
>  static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> @@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
>  
> @@ -585,11 +597,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  
>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>  				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> -
> -	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	val &= ~0x3;
> -	val |= cached->pll_mux;
> -	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -742,7 +750,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  					pll_by_2_bit,
>  				}), 2, 0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				0, 1, 0, NULL);
> +				0, 1, 0, &pll_7nm->pclk_mux_lock);
>  		if (IS_ERR(hw)) {
>  			ret = PTR_ERR(hw);
>  			goto fail;
> @@ -787,6 +795,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
>  	pll_7nm_list[phy->id] = pll_7nm;
>  
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> +	spin_lock_init(&pll_7nm->pclk_mux_lock);
>  
>  	pll_7nm->phy = phy;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
