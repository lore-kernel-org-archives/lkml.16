Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCD31E8823
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340742; cv=none; b=aemrQmVIkqLKYPClh2Vyf+exLK4qfO3EIdIHZUTJ88m8rdKNKGe2tQRUTeRYNKQbBMvkdznhqVwvCDWoR3gthHzwrm4jjNi8GVjeM5q2GdD2sLpIvJ9m3AldrTXhVPfCWskiR7pKFcTTUV4Atry6ISNMJbTmh0q93KRVLnSsVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340742; c=relaxed/simple;
	bh=e+B/l7bCP7C9h0VKFjIzKy6EdxoujUAYOJIKocAbIrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTGtgTWzeXQweAwU4JYSsAzS2AEVmBXZmhfdfiPv3ZIgkumSGbjISEH00ylWTR7NzF6kq+gwZDEDGU/kXi/G42IwFn7b5ouPszlFnbdo0goH9F4kjPPYB/NfTFrShUel4R1faj4aLoR4GlKsd96flqX0bgj+Zw35lBm8gUfQRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XB3L0Z4g; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XB3L0Z4g"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5439e331cceso2445851e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340738; x=1738945538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9vd8/l8+wYXFpqXqX8R06RWP6ry4k2O+3VX6QzghOg=;
        b=XB3L0Z4gUn8phy2PVtRD4LLHzsZOzVBEPKxxoIMOjghczuZvr/0BX7pgbAtDwbxZR9
         XbkRC+NxKfbP8QrUt0Brq1qS6U1tQkyKDkb+/E0lnJ4S0B97TyZZz3eAS2XKEvFGKmY3
         unAr+qpvC7DfTYbbG+GWxLqbwh8wKYsMQjZFd28dBaNMRBjTHNn2wr+agluqPPCATkM5
         7fqZHBUGUWFUpaBsKqYLvxGRnC2KjcOkPAQAKmPNOk6r6hchZarcA6+eLrrVQ6BBhUkU
         e28ytAh0cLd8i9VB9s1t+vTtdZGCxS/qwfNzS0hJDhApuIGPgQVL219pzvdGJZ1sDSjt
         UCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340738; x=1738945538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9vd8/l8+wYXFpqXqX8R06RWP6ry4k2O+3VX6QzghOg=;
        b=rwoTXXnzVjpxR8T9ccUg9kclmQ3DESfbLWep0miopw5KRYXX/Mb2K4O6tJbujKCkTy
         Op339dDditydvza+YanQcviYqTL/tylePXbbZIGY0i//Kwk+w7iSseIQQQgHR53AIYO8
         TphnUd2hoJqYAbwBodfg1bQEpoT2o7dhiXXqam6VXWLmMzeB5H/bWtJpCOOGNYzH4OvB
         ruFNhLjemfRL0Vlcjm0v7Yf4mH4vPyKmrmr3iSkZ8f9HKny0y5tABM82lGwx+jzBxF8j
         ocxIkEqtzZl+s4CUlXUmipjuXT7VBIHm8oQha1s7GI3ZieAFbYMMqDktY1w9qaGz52t3
         X3yA==
X-Forwarded-Encrypted: i=1; AJvYcCXOdyk/7lGFs9Z5xhl1CXIoqwzZkhuqeCrUe08l0Vt1JoN8JoezGRZx0cZj7BEklo5m6oBDwvvGT/BjGE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nY0R8wWPJPyBifrEysc38JV2c8/Oo16X7ojBnLUGkKRUk7Jg
	tEsMCFaZkLZJFT/1vRpvgG0qRoHidBAPNB4L7THVoR6iGJixvqqCTgxd7Ws2QpU=
X-Gm-Gg: ASbGncuOR+CiL+7dq3Ty00S+Gw3di3r9OdFO7Q2evJvNXz4ocqJHe23SinCK9G1vrU9
	oABwNHYF0O4Z5/faEa2dedcujfpdd30NMKn8iKmIPSXxZv1GMhePGDugCCBWSlPv+WEfeVwZt/X
	6HCTO5/Uv1UdL5SZCMPPbHnvNmXOFbrosCdS0VIy1LakWPSoNN+GrTNeen4EQG+VhBwAoomzCDr
	bQHE6nwaVlvBe74ohmB6nr/b/KpMXSM5QQB+w4V05XuRJb1v+oy4/5ShiCeoBG2mThj9FUhw/3l
	cVB9pjPv2f+al2nHZ/BMdN0GlZm0KlGU7/qbjAUbAeav/SunQ3wkenQ5WBuOf1/ObD2YYeo=
X-Google-Smtp-Source: AGHT+IEnb8J/vWpEj7xWQEo7oH9oqERPA03G2zfqohO9kVZWC2hAmVGzn3YneXt9Fx1uYeU0k889xQ==
X-Received: by 2002:ac2:4d13:0:b0:543:bb1a:c13f with SMTP id 2adb3069b0e04-543e4c02fd1mr3474942e87.28.1738340738137;
        Fri, 31 Jan 2025 08:25:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebef13sm526644e87.255.2025.01.31.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:25:36 -0800 (PST)
Date: Fri, 31 Jan 2025 18:25:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:51PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 34 +++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c164f845653816291ad96c863257f75462ef58e7..6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce 100644
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
> @@ -381,22 +384,31 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
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

PLease add these bits to the corresponding XML file (here and later on)

>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 data;
> -
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>  
> -	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5) | BIT(4), BIT(5) | BIT(4));
>  }
>  
>  static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> @@ -574,7 +586,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
>  
> @@ -585,11 +596,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
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
> @@ -742,7 +749,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  					pll_by_2_bit,
>  				}), 2, 0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				0, 1, 0, NULL);
> +				0, 1, 0, &pll_7nm->pclk_mux_lock);
>  		if (IS_ERR(hw)) {
>  			ret = PTR_ERR(hw);
>  			goto fail;
> @@ -787,6 +794,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
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
