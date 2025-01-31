Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12311E570E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340832; cv=none; b=W+bcOBaCpB8GmiXcKM0m4+EJyEKUsU/NBWEaTn+pywwtI75VhS9ByAl8Ly+ox9doFSJEtNo8nOx6D3qCIRBDNKWe4eISq23XfM15ebGcgoIF6aQasDWFyHIyWLahYBUN2qTgh24H9mUs1le7k5cnA1PVRMCxRXrYvxb7+x1wxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340832; c=relaxed/simple;
	bh=mphiO0uqMnS8BS4zTsbBlWAHVHMHxhRHKsIMj8aE9ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEXaUVXpFsmcHksMBAsMOOOn/T6WqjBLLhF9cQ9dhKt3NubcMPP67Fts1THEl4fOnUWCM0ahCLYUPalxCUykRd6eFbdo+zo2sTXBLP21lOdL2iNWWn8qRcEsTsZG2hsgMbgAY/NGujO4Oi06fJ/U54UZK2NBofhj15vUUziC6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3EDhu9M; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3EDhu9M"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so23752941fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340829; x=1738945629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
        b=Z3EDhu9MQaW/LQ4x2Po6whml9XAijMLQjjpJbpL/V9QUnbva8V/XSrhJe+WxQicntm
         fSleVznp56M18f+WZ8JdM2DVjDFmLNRFrPdpUyfMIqWO6N9l4QAZldYtWUfeIriQbF2y
         t+ba7scUekcnlkRYcMb8H7rZ8CM0Kifi8Q+jGNXL3sJU3L0Xph4qctin9A/YMg/+Nnfs
         s07N7V+5nur2Nrbz4ZtkaGX25fC/FQpzWuFXkvRIzOjon17c1qlrxtqCGXTl4TIIPXOs
         XM9ZctVtPcBbJWcJzZtvkX1v/a2VykIx9vdm4iEZ8UhNJVdBmXdO94pfoLU0GEZ/rOpM
         ofPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340829; x=1738945629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
        b=Guce07Lull0vgQ+Rk+iW8+Gjs+YnjgZukafTxkUEydoHGFkPMWSKyY+65aU2We8yyi
         Mv9pXeRcUIt2Kd833HnP5RCRVm2RkJsYhubm4GVAFSSWln38YdxOZau+3mVQx1qFjBwy
         T60b7RLOqa5hL1zL8pJBE3zJE3c5V81RD2JrhwoatT4znQoiKpqLvv5Inomcx9QyNb/+
         SKhis76cPzO7AMBoNATWnhxH0zK7AcEMJB2po91Y3N/QH/V7xZBhINGnwmZnynLYrlA+
         nByg1hZ6COwxYU6SeK5x73HCWMPIcEipWvNZKYNMM+RaJqQf+HYxIiGKW2GMbs/Nj8xM
         IAxw==
X-Forwarded-Encrypted: i=1; AJvYcCXKMzAu9IkpRGzUWOCZco06oiaLKWchIshIDgEaz76OLitXm6j0MMvjHqm4MC0wWjFfLhaicAOutt8rGbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrF3PQVW8EgSz8nYLmM8SbheQr55gX4aMDs18or0y9d9qoAaJu
	N7xRFOcsFN8gF5Kk6gwygOSIodqf1C5n1PU27XSeKBUERMHP+fQ7ev0uXBngfok=
X-Gm-Gg: ASbGncsgERejn1negOlPPqLhPV6+HC7Pd2Z6XZ4Oe6BobB0vMZfjKWn6JLYE7oPR/nC
	lRaqrEuJabUrpKKo5RBqmERasMK1jS/6bdAeJYFFITyhzMKDlZm3rlXXhJtyzuw7hu/HjNvsTJn
	VNn6qFDxFrNyY5B/J2m9A92Vk46fFCCziZh+vu35hIiqDxhATkXHFRh7ELdajf84ITKmIyNUOPz
	/JNSUqKrIuC6hyqn+rxGrHfJzdw+SPg5B4D/H8CVUNTAwo8HCrd+Su7Fgj0MGkdEJxDQejwBPRJ
	Crtow+6/BTRK37M0/EIG+hDkltK+PMH7N+oOgtxzjytUqsxoEfclpYp7uUDP368MV26Z31U=
X-Google-Smtp-Source: AGHT+IHj2CEfFG1Ny3hI/iiu/YjFUy7k0PuAj0GbWhKpJjm24+fabydi0W5P5bg17qhnO1cLtaZBqg==
X-Received: by 2002:a05:651c:1608:b0:300:2d54:c2ae with SMTP id 38308e7fff4ca-307968e7b65mr51500131fa.27.1738340828800;
        Fri, 31 Jan 2025 08:27:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f806csm6141981fa.70.2025.01.31.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:27:07 -0800 (PST)
Date: Fri, 31 Jan 2025 18:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <lpg4ig3lzypzbv5nyzjfdz77ma5jdk3ey2hjt5htt5yd3ztfjp@i4qzlexajhvb>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:52PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce..8a9ee308ccffc3b9d112a994a064d8be06d9c42e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -615,7 +615,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -634,7 +633,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

This also should be defined.

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
