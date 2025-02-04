Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9160F20FA81
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679226; cv=none; b=Fq6q6UZjYoJWiRDv3JpaKGZLgurwzwaH6m/LLgPq4OokYnY78bKvT85wphmWlMzeum34+gKKIwMA4xb6KPVS3UDit9MfTN6s0KnTQsyb8cDn9yjEh63jGjIhxGv7telaal3JIz13rANL42YdMXcv9VsA1CsRFPunyf1I9Tvs870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679226; c=relaxed/simple;
	bh=b6wxorldtDBUT5vWFim/Jjbn/AwS9c7kO7Mu6CPEiC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXo7+SunsRr0OVFs/NmIt7wtOQpBLxsTOuanxMiC3VqgTKPv3MvJbGsGHCQWMj1vLdOjXoMCVxtTx64ur+PGJXdALfZAoEbX4w4DUUHkRlxHVJCoXWnLUbZImo5QqSG9riFBp995w6/xVAywuKa5EUmdCkgcr2jOHXtwGVACTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PuI/7GO1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PuI/7GO1"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30616d71bb0so58185001fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738679223; x=1739284023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
        b=PuI/7GO1bWCrm17sdLL+cIM3WapfvMw5IXk/MowPw8DB7tCc8X6uR+OeVa7IaI4pE9
         MKLVRj2hWd1p4NOMcMnwzZVXkheIhvkoQ77+s30e1zu7BD7Lv8d+MXNR7Uzozzj2j609
         QKqeTRgSSAswaR62hcXYoR/q2zX5x9yOx2TBA5GKoEwWv0qrqvqlWpAotegIMiEQ5vEd
         lV+nu25BINDzuSIMYitjq+hSoKo3lIEYspPaXgrxXjF2BlvUr729vwPLX7PuY1OAKeoT
         zaP1CiwtoaoVclU9K6aMm5JahhpretgCYoWR/4ArgvbWCYCGQODxS4B0hUn4IHZMm3DW
         O6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679223; x=1739284023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
        b=dVX2PFpkyP069LHPA4GIuo0MMvlTeeCiUhMbzNCrDrVzy744+KP3bpkLU7cCjvYFpr
         v7toBZ4ZdsJ4Hb3bd6r9NoxQk/tWnBahXS3aUkP2gxa5OFqEqf/6S2bSbCG2JOXx06CJ
         t8iZbm/ieKu1H+hpLI7uQoOQoDVFbAE97J95KqgwujecxEDqR5fBAr66/zRinNE0RGnX
         y2QwMhUEcL8675Wak4nItg2p9AaoiTD1kh80FG2IxGbpCxG6eqFeIKhRlNW0w/g5+XaH
         LO5pNWXP7LqEqW0dQ7T49Z3IWtahe42cm8snjlUeK3OFV5dQyg1DsJprUQ/hld5km5GE
         f3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrvKiQzz+HLuRe5IqPDviQecKUbccsHQq+FfDOlDzzu6p5EYiZkavvr1XlvEMyGolAw45D6lW4wR8dQe4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UHqd9ZlsWnkBEgyG4J7unevCH5673dUO06gsKQyNdptThrS2
	Hg8ekZUSMu0yecKhpGdvyUsHRZ3W+i7FwZQ3SCZCYx/JDaR+SM6FWn59ETgwFrQ=
X-Gm-Gg: ASbGnctvG6P7lgz52ZA9P/0m5gfjBXbxNJRNnIngz5E+1jFslIx3NFlqFaytKLYkzw2
	vhFEE9ZMYlObCVYUjT8AEztq072ttK8sfI5/CvKEKNH4oP4Cbge6r0wRN4ykzR1du6gXaCEl2qp
	QTDqfHCzVkRenbd1yAQZXAIZQZEAYP8qrOHI35q453iY6f8sjEUNzGYBs4cRcJotwNaf7XhOF9b
	EWVLwTKFEco5POflv67LYl5w3iP6SPuY6364zhXTO5l2IUV8Iyn4jvjjrCEj/+YbwIgfkpSaKAt
	oapfxRLqH1vjjMArPGP6IuoayiPFT2ZJrg31M1o4eRggDnWDbXx/fJQNh2sVi7vvyEqH7N4=
X-Google-Smtp-Source: AGHT+IE8XOaYEj7jYvhNnwbtWQcvDKstTrzf5XAxQhgdONK67Y73izpEykGcxI07g33XKs4TMQ+cHA==
X-Received: by 2002:a05:651c:160f:b0:300:4107:6294 with SMTP id 38308e7fff4ca-307968fb853mr89129541fa.35.1738679222565;
        Tue, 04 Feb 2025 06:27:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f6aebsm18480671fa.73.2025.02.04.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:27:01 -0800 (PST)
Date: Tue, 4 Feb 2025 16:26:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>

On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >> clock from Common Clock Framework:
> >> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >> concurrent and conflicting updates between PHY driver and clock
> >> framework, e.g. changing the mux and enabling PLL clocks.
> >>
> >> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >> synchronized.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>  	spinlock_t postdiv_lock;
> >>  
> >> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >> +	spinlock_t pclk_mux_lock;
> >> +
> >>  	struct pll_7nm_cached_state cached_state;
> >>  
> >>  	struct dsi_pll_7nm *slave;
> >> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>  }
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
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 data;
> >> +	u32 cfg_1 = BIT(5) | BIT(4);
> > 
> > Please define these two bits too.
> 
> Why? They were not defined before. This only moving existing code.

Previously it was just a bit magic. Currently you are adding them as
masks. I want to know if BIT(4) and BIT(5) are parts of the same
bitfield (2 bits wide) or if they define two different bits.

-- 
With best wishes
Dmitry
