Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD020767D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593351; cv=none; b=ckCmXTHkjw+RUFz+LMuf9m0DSZwJ+gG8+RMrIN1JuatF4oJ/hmcer2ogqAMHryDuR89PwGbGIGBgcnaZjofUlcjDb9kCVSxafu6Z1LVgrOgSJxSvYMyzCYcrHBS78Uzrtjp/nCYrzLSo+HCDcQlloqDwSO0mTupC9e+BeI0k/t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593351; c=relaxed/simple;
	bh=UMLRPwjkBIoSYPP66uyn6s4hEzukRly/9LjGv5JzQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF4HLasSFIxE+7KB1WGvAooB2zRRDM4nLuZmaSPpJwue2Ozar6N4xTXMJ6HYo1EkbwizFSitHaaDCFcv1i6r0h0Xa6kengfgmrpJsqyBdbeyXf2d3xKiCBExcnyKtn6Sbm4iAAQGB/j4UEtv82FuITjf2l8fQncniKZbuKEdnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rEjJuSgm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEjJuSgm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4747722e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738593347; x=1739198147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
        b=rEjJuSgmJ4JvyWt44g5rkpN0mOhPBhfsePrFF5kiF1gqlyeyMbMWDLS11Mq7Pnyh9p
         0e98X7nIU7ORc4rPz4PsjzMKCLjrE6qXWPVcUMr1k3lxJlxDMup9NJoJr8DYgaK8+LeY
         Mx1Hsm4jclRk6nDHGc31/uhQrcvb5AD5INusQ1cYDy2cowZS0EXf3ZeC/kzrekSMK4ca
         P6UVHSj23QPT2SxsQH7NVJuV5ch3PxwC0XeBDROv8DC+t51ZisWlUYLHFyBbg+vsWOj8
         L2oDyjJxGOojuweu4Nle1H3gJ3ikUAqvXjCXBtNt6n+wtpoAW/dY+iSGhVAZlcL4+dLn
         uVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593347; x=1739198147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
        b=ksg/Dv3OBYfdJVksL//9/LL7EySrlo1vG2muy+SNvvcfh4ezcjbUtK2XabuJTnmYnh
         Zl26PEw0b/A1vpISGQWo3wdwnYShAuOXf/OlOcPOvUiHvyEtQFUf3pXxF0cZ/iTKBxVK
         1dzTnLyD89la39RKqWoTfFGU8c9EtG+W0QNHQiZLHnp2nS1ipR4bH7IxaE5I34tP2Hsl
         kRhasavtw1GqP6liQ/MIm2zGwvO1ag52IaGBvn206m4qI8pTlHLSL1edVqJaQNIba0gS
         0zNYPEtJC/3rglMzilbYzmxYC4LOG9n+g9oz0h2Nf2lnxKA+PvAh+2xpic3itaOHxM+3
         1bZA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZdot5l1QeZtb/GDHQLWNdqtiPuhd5S94ewQEbuONqpsRfWTuZ0lV+h/B6v72DfymaJgA584xVhUMXuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOLY9z4iUodTnC7HX/ps343S2u97R7WE4k5RbsyX2rDoeQ7uJ5
	2bS6GCRv6I8syj0wOxryDER/dDs2Ss2/c1WdIr/Z2R5SSTdhaRvnmx6QS3xBC7k=
X-Gm-Gg: ASbGncujPvNPmk4h68yxoEv6Hm/AbeI+NaaLuR6t+BXAPtSW2+JRBdNWI9o6oPdygbo
	/if2tj6sh3b2kgtzc8OCmoSHQn+np0FFFDYbF1nUmNzL3cmoB0WQJiiwc/n6EjJ9WWcwFoVKQFD
	XixNr9Y3VPjzr27fAWGOuEloMtpmoja4ZylT4IHVqzqqGNhYyW3YyRRNW+tQ6BYQzC88V7yQn3g
	3yvQOuKhIhGGvNlyNwJOQGcz9qBnDtw1cYlamMND3O4nNqVsYgy9c5qdmwkkFPT4KEhO3j0Hl/L
	4/1CJNt7iKgkl5Cmnn5Z6Qz5AGvayKDrDxzqUf5oFPbKhkRhlwujLn6yz34UOnB8eQxccWQ=
X-Google-Smtp-Source: AGHT+IHmpsMOUXj9J7uJNG7xObWsutT5JkdY7XQTqCfqYOO3ezVejDnIR+luTef92RNP0eR3hf/euA==
X-Received: by 2002:a05:6512:32c9:b0:542:7ff6:73c4 with SMTP id 2adb3069b0e04-543f0edde38mr3901410e87.1.1738593345964;
        Mon, 03 Feb 2025 06:35:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3097f27sm14979041fa.45.2025.02.03.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:35:44 -0800 (PST)
Date: Mon, 3 Feb 2025 16:35:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
 <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>

On Mon, Feb 03, 2025 at 12:19:04PM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2025 17:25, Dmitry Baryshkov wrote:
> >>  
> >> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >> +					u32 val)
> >>  {
> >> +	unsigned long flags;
> >>  	u32 data;
> >>  
> >> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	data &= ~mask;
> >> +	data |= val & mask;
> >> +
> >> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >> +}
> >> +
> >> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +{
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> > 
> > PLease add these bits to the corresponding XML file (here and later on)
> 
> 
> I need some more input from you - I don't know which XML you talk about.
> Do you think about:
> drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml

Yes

> and others alike? But doesn't it have only register offsets, not field
> offsets?

It can, see for example the mdp5.xml, you can add <bitfield> under the
<reg> node. Be sure to install python3-lxml and enable
CONFIG_DRM_MSM_VALIDATE_XML if you are modifying those files.

-- 
With best wishes
Dmitry
