Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CE20B808
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604455; cv=none; b=ChVDQNTiHksvMzLt6D3aPnVq4AGdXahhCnwuWTjMxTdCr6mvsInIRvSzaPqlU0nDBXjxS/ksHtKCzayXiCQodH2tLDqMdGCWsH5bpeNDJ4xWQEanx+JbCo0aXQV+SqU5dhOB02cK/GWA92ms2QH4nkRW6+qU7IazdEye8+u8ySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604455; c=relaxed/simple;
	bh=FvbzI49ugB0ARXUttC6X2TqYQGK2iTTyK7ALo/17Rt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8d2rKcgDX1iN3Ykan1zBCCHhABV8yozW2uvoSjRdjdR8QFTtf9iGoYpLtGzls8aXCuXcbtxKOFyFKVntth82eEMDYC37vQFCbKFHbB1M6kjNwlmRLISG3BxYGN6bEvBENNf4eBabEcnm0ynu7Gtcc40HfB2I0uBUuKvoZ7UkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACpP7MAQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACpP7MAQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30219437e63so59239861fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604450; x=1739209250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
        b=ACpP7MAQnGX1FsfDpc41cpZ8MFGMyqSiXSJi2e62LDn6Sz+QczRkIThp041/fqUCd2
         gs9vB5DzB8RJszih7iSlT4Py82hiEJc09A3LpSRQEse+mBaCgafDFAOWDKii0dogayIz
         Lk8SF0a0a8g8yz2BWhmhuWUzAEek3zA6XA3riNnfNQzP4btjW6QRwej/P289ik1xekjD
         5JyT7+r13bjrv5vX5idYaSJQ/ABBnqt8bdvwyfEVKcqkg3q2Wp2mYB9S1p/1WK5tiwxy
         7nZh6+jR6+tTj1ocLRyueXEhpqNlB5twb+y/8U7pdmZ1+OBDSdWU8VZfZwr6JLBYqnml
         Lkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604450; x=1739209250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
        b=MgMfZ48f2UaQkNRln0Cicpqq+XU0Jtrke99sHKvAUWKzcN38ef4okg7PjD6cXO80IA
         6HPyKbIz+KmZllX8x05S6qlKUChsTK6GNs+7lOfjSvcp1w79BmwgHyzWC7rxTSk99QMn
         O++4atYZ/RQG3zfzN/xSiMNDW+ZT5AKxaGgHYokvtjghBxMU8V7MUcqsKkTH9Ks+oWCV
         HoMLqAzc8YcrFPCUAe7dDc6XjuBWwUuu6iGqAQA2UVf/fL3zRdg1YfvgkAyXeTTmdSKF
         b27u6UVse4EUEd7xZeTdw3eIjocG+aifWoe8wplJB2UKcJWE8skTu9+N3KvWU1sUYTVS
         ikCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNLFPsCd2CugN5vtd5Lzu2ABki0E4m7LBWragPEf7HkGGoCqT9v5Kichk4ELwSKDfxq82dwsu0sxI//eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLbOFIwDq3mTyxiIjA9TjzAIusN1Ns4msStXYiXsjE5mSqxqx
	vMwthLfsb7EDTZq/T20rvpuOBdm5kQS6i3dAmNGckM2PoX5wJ52Lnep1DWb9MWTci9Iu+eVV5Qx
	l/ec=
X-Gm-Gg: ASbGncv5YcZZY4vT7tadJnqTf0418XtkXqWK6uojM8+VqZOOKkDbkd5hM+WgqJLbjjs
	adKpnnXmeXw13+nQBBhs9lNuxCKXjExgmof1T3VF2qdBUlYQaGfTgPLCFxN7rn/lCwNjxgHy8fR
	soRKAYCgwg/wv3IMP+QXBsixtLDnwLYNDvKk2qnBHGkg32xF9mynTEZCRrgvL71THNed1VWIWWL
	fmW7w+nSweBt0TC0SfHBWal6NQwot6EjMSYMruVwkn27qjHuTI8+0Z3m0P7B805i/+Q7jtRrW8d
	CB/1Xr2VsOwxLd8zWo57wuSnUHsOwsYW7heLvvDpWxQZqf1/I3SilcJYnzwvjgKGgBg34u4=
X-Google-Smtp-Source: AGHT+IHY24nboD8BN6UXFEq13aCacnm+x9IFyD9DyCkPKzh/1S25FaBfGTGrXfjyKKUiYJc6Rbvxnw==
X-Received: by 2002:a05:651c:1588:b0:306:16ca:ed05 with SMTP id 38308e7fff4ca-307c6959783mr444801fa.17.1738604449826;
        Mon, 03 Feb 2025 09:40:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309b1dcsm15431281fa.49.2025.02.03.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:40:48 -0800 (PST)
Date: Mon, 3 Feb 2025 19:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

The mask is not defined, still.

>  
>  	return 0;
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
