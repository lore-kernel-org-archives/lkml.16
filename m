Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FEA20B807
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605542; cv=none; b=WjTemAasJi1FdOOpxQZpQhZ8WFRlq2Prw/ObqygvA+Ln/YjpikPa5+rYWXzIZau2SCk2nkRS/seApEkXm/1lwFSrTzZKQJvCt8qnp4zDXlUvqGNc+78VYF54urkPzDV0F9quv+DDHh/UtdjTWyt9aRadDJ8KLE0YtI2jLE0T7fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605542; c=relaxed/simple;
	bh=oSsmlzbI68ndLgngvT3v0KlCPiyIo0B8T0CfGknne/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKubcCxuRBEk46qV/0839/UA9lZUx3U/GZP6k8NQGLv0caq3t0/p4x56u4ktH6KNvewT149HcL6IYmu6AJejmPDnNNbJKiA9eVk+S1wrCyxOW+bjUELQXpboyokNZ9nKI0GICGxSHUFbriDDb+VgmFvapLvWE7DF3jqQC3uALfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h08rPa1e; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h08rPa1e"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543cc81ddebso5618892e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738605538; x=1739210338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Stn8iOzRg0pl2xk4Aml3qZzGpyJrcj7qEXXMSflHudU=;
        b=h08rPa1er59bYvxp1eP0DHO8QlJQina4be6FGAX1/gh0X5CI42YtFEANAfOz/auM0k
         sr0lh8rjHh49MPMdBMBuxhCEZbpHKlI96lZ+6TODxX1sBzmdtp1sMCnxtUhidjnK++Lp
         deWE7FyE3OW0SUoT6/gN4FXJAbkVxlHvdKXeObbTh8udl9PN2KEYHHHW9Qcht0K3DILx
         viKxxFsHi/LkT3+6CJYwG2B7R1320qD7z0afrMUrbrmdup9ifzgwme14tRHx9RfzvxYb
         uWr1+H9tv3FmmRQ3tLJQKhLjz1R6TCjIq6hzh8SDhIX/qD0qBD3rDOL3hIPgBlMzNFE3
         fc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605538; x=1739210338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stn8iOzRg0pl2xk4Aml3qZzGpyJrcj7qEXXMSflHudU=;
        b=r2Hm4G04e4TUJc3GEl+VAe/Sg7vdepbprsjMJozBWXWHOuamOZxyplvt9lrZlXRct2
         7znT34lNkvWG7CBCskev3tZ1FGQGBlHNsSC6Tek3lhXVd2ONvOQ356Ep/OOtC3stfve+
         P8wybZi/bJJ8rry2eUop0HjO7Ztc9S0RfWqTKMFCFv1Ss4DGINmTg5d3Z93YIKdjNYBh
         55qV5vpvX76i7fEfjiBZEraFHdL7x2ZdmAPTs+eVMDEZhuFL+llH8vm0I3Ei48MSZG1N
         WFm5t+xImJsJZ4wKV9BdAIz1U06Y1aB3FLBEG7ubmxgG6pYp+Cm9rTOOXBFi0iFEdmFn
         Gx6A==
X-Forwarded-Encrypted: i=1; AJvYcCWW/7UNx4A6CLAt2MKCwIgAc6qh5szx6x8TvbdwTW86kx7HYnU4QZtQnmhhA8b/00Rezjc8SSZ4QqFbsuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwApBXzBBDXjMKQnvl+5+odK87wdKuYV1KZby6NSBr6tnS+73Lx
	Max7q23xOWJzoa+IRI9Kg6VIPWo6SWggcou3o0KKAzPRAGYawGfGd6qqUq4KetQ=
X-Gm-Gg: ASbGncu6hsOtDOPPsxW7/vvRqC20a7MxZ5iVZ0i32eGiew4sEMcHWrSBhXKCDqAsUvG
	6oP7QMntYmP6oTpLYQ8e7UnMe4Y3j5h5bf36wkJzoGZLmoOWaJYacx5snfCh/cCnte8HBfdFCJ6
	jYlLB8j9SAbPBucIR70hBCoYduDqBZkZ66eZzydlNi5wInsj1WxU4I+1kMT49AYpMd9W2jGbqaS
	nJM+PEpt9qR3geTh1g7OhV1OpK2fXoKzYB8oL9bvrFnLiZayeIVIXFl9GLM7Obh/p1/w6ZCV8ss
	fdYsJHgcq66tGSeR99o7G4UBtf1ThaK9EJPvRazFLsLaqo567+5B47LIqNlfREW6BdK6NY8=
X-Google-Smtp-Source: AGHT+IH1q3ZO9LNsyTVW4NPTdU//0Fx/rXlFPloiEN1WTFjn/TPZDusif7LVG5SOUF6QcwTmsZ4I/w==
X-Received: by 2002:ac2:41d7:0:b0:542:6f2a:946a with SMTP id 2adb3069b0e04-543e4be034cmr5391500e87.6.1738605537977;
        Mon, 03 Feb 2025 09:58:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb06d1sm1367606e87.121.2025.02.03.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:58:57 -0800 (PST)
Date: Mon, 3 Feb 2025 19:58:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:21PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
>  2 files changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -67,8 +67,7 @@ struct dsi_pll_config {
>  
>  struct pll_7nm_cached_state {
>  	unsigned long vco_rate;
> -	u8 bit_clk_div;
> -	u8 pix_clk_div;
> +	u8 clk_div;
>  	u8 pll_out_div;
>  	u8 pll_mux;
>  };
> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>  
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 cfg_1 = BIT(5) | BIT(4);
> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
>  
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	cached->pll_out_div &= 0x3;
>  
>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);

Could you rather store these two fields separately by using FIELD_GET?

>  
>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;

FIELD_GET

>  
>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
> -	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> -	    cached->pix_clk_div, cached->pll_mux);
> +	    pll_7nm->phy->id, cached->pll_out_div,
> +	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
> +	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
> +	    cached->pll_mux);
>  }
>  
>  static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> @@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> -				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +				    cached->pll_mux);
>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
> +				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);

use accessor function from the header.

>  
>  	return 0;
>  }
> @@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x00004" name="REVISION_ID1"/>
>  	<reg32 offset="0x00008" name="REVISION_ID2"/>
>  	<reg32 offset="0x0000c" name="REVISION_ID3"/>
> -	<reg32 offset="0x00010" name="CLK_CFG0"/>
> -	<reg32 offset="0x00014" name="CLK_CFG1"/>
> +	<reg32 offset="0x00010" name="CLK_CFG0">
> +		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
> +		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>

Are there any sensible names for these two regs? It looks ther are
not...

> +	</reg32>
> +	<reg32 offset="0x00014" name="CLK_CFG1">
> +		<bitfield name="CLK_EN" pos="5" type="boolean"/>
> +		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
> +		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
> +		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
> +	</reg32>
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
>  	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
