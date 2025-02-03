Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C95920C46A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604547; cv=none; b=NfYXOIQ8N7WC8FuD8AGZptP6jpPgaOruXVjU++M4CWaHx0dej7Emqrkqh3z/vr1okGfBBlnrX4chGO2NF13Kg8c4n8KAQfubxHUktukuRPxPxJmchYN7B3+Tqu9tOSTEhsA+WKHSDaN3DaW8Yz+NIJ7fZ0xSXvWAEoqwUc5ewPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604547; c=relaxed/simple;
	bh=yrQsM2XtVGY3NA8zhm+FsqE/2X9ptscF6CqAYanOLnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyoRM6Gbg+DRZOcVmFY7gEL3Y/OfGpx1y0FWtyEeffn7b4mCoC8DbcGnwCezGDkXTJl6g8MUehvKPSefNASV81koxw4c3pJUGI79THZCqpePvBY6k7AqABdNjzjoNBfL4SgC/3q1LkYNEPgNJQBI8IEHnua7CYYYpFIOmHxhPmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3jvwDmL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3jvwDmL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4304335e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604542; x=1739209342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
        b=R3jvwDmLrUXzWa+NPqhHUn7rpMRiQ+xHxXX+8q9wJhKeBobUIDl8kgW+cSPsTa3IFQ
         vIRzBTh3mCK0gk1i6zVpaeEyBeSq/ITwUh5WUND1W5NbuHRBNi3K9WvG/N+fnbEdy0MB
         GE3NRj0UuqY28IUs61hrt2MghIMaCHdsUjGVZCSsUjrXFTKpmr+NhGrc5rJPE+y8AKCF
         fhagTR2aA8P1qpvstNP2sC0DKe0jYurKeb8wwjiYcqRfx2wDf0eQ7OeMs1rA6IS4ro1O
         yr08QgEAXXndLI8t1DWfwyy0NW0/QW+Iji07wG736hao5MjMhRbKBPiQNEQjFlMmqbkA
         9Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604542; x=1739209342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
        b=ValLCtT+H9ONAbiC7661d3lLSShFMbq4l470zbbEklTMAiAP2jBA9pBjaPrPgDLWjC
         77pw/aK5hJzcH/2O0DQb2rCltqwVYY/YiCpD8pgDImsGokTnslv743YGHqiv8z+ju64G
         QAEtX38kXjGdI+DoeHcfeaJW6y1qg+XWHkrqg4oaWeAyRdeYQjxhvAm9oGvA+L29GWUT
         4zXl1QbuKYkMd94rNWpxHv6b+wJqmfDjEkhFpuwJSrZPDPVFT2K1SAzokMbtAdZ7o1Ug
         LVVfLjZy0M5fbxYHblMJNWgo+DaIMf/10eygLWiMtFezCbb1zytKG6Rq1VQAIzmqr9bj
         M51A==
X-Forwarded-Encrypted: i=1; AJvYcCUXhKQzIM5cLj7TqqhYz8GRgWm5ZohGv3MjscPABLCAXuQh2PLQgWaNLbQyy7qFAYGOATosayUdj20zEYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqBsR7Y9beNQly/GutzjeqfDvtVu60Msv7oFbeiGc2EBpARkz0
	d2lHY+OX21zp7Lu6XJidXFb/JPrPZynmkwEijfyfw9BdCRe013HllKbyr3cclqM=
X-Gm-Gg: ASbGnct49wQ5bH8yT/nSW3ERV0G9vDRmiVhyyCoZX6jBu3dqoTiR9PQn/KFiGzUXuBt
	0gveBR3X4+4X6xoIjbrEK7rPtCaovBNmyMbnqxgWZIXdhHdVqP4j9JYaF+FlYwqYy3VPKmtmqfz
	/Lj46QJ2bLqHsOLq4yJDGljfsOESbJ1IQ6CCwUO9rLZtZtsrZnNeIHfDA+VL+YZzwwlqpd7dTAg
	RMMV72AfWl8KnNkBPgDgdTabCMZGlpdtBENUQS/1E9j0+VokcCg8OqCDCvDgBZ/cuN8EEFWqsJW
	rIeSyofAK0JZ82Rn2D4dDtKq4tPhzjCFpo6Jnp+gErRe9fCRZI8DS1GHSoCmMQlB8SUn3bc=
X-Google-Smtp-Source: AGHT+IGlJ87svBgPPUA20T73yUcNcWRnrAPPLfHleKAdvq9eZ+1SZHlu0nXMsWAYW/fUC1Is8QpX2g==
X-Received: by 2002:a05:6512:3f13:b0:542:99a7:b415 with SMTP id 2adb3069b0e04-543ffab903amr96587e87.0.1738604542379;
        Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7df3sm1351683e87.204.2025.02.03.09.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Date: Mon, 3 Feb 2025 19:42:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Message-ID: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> divider clocks from Common Clock Framework:
> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> clocks side is protected with spinlock, however driver's side in
> restoring state is not.  Restoring state is called from
> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> conflicting updates with clock framework.
> 
> Add missing lock usage on the PHY driver side, encapsulated in its own
> function so the code will be still readable.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  	ndelay(250);
>  }
>  
> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> +}
> +
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
>  	u32 data;
> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));

Ideally this would be FIELD_PREP or a special function generated for you
in the header.

>  
>  	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  	val &= ~0x3;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
