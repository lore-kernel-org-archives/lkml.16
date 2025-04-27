Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF51FAC23
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752816; cv=none; b=t4JGJPS4eLMfGpOeBU/3ERLnFibTChH4NkTWqBltAGTXSjeNixKwmaHafgpw3qsitm9Ed6N7Sq74o4uwb62YvkMZtjrBEQCaDETwYmMWwNzZRRG20lAF+KIRdX2wCf6WqZHH99hbSwN1qsck+JRlxrB++yyNc+Ab4RcAY5IulIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752816; c=relaxed/simple;
	bh=l+r6gW/k4AiLNiqCdXWLcYbQjOS4aPFNelQN+qJ9t9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6OrLpaGamQmBDifkfVu6N2J6HDzMoOk35peiBWfLw+/gTRTPiUXC5J963qrZ0peOTNSvVxywhHfiOlRdDBP3VBcOt+9bVYvLJTbMA1+FIqMU7w3+q/967I2aGgcjAdOb3tiOHG1I6HjTXZHbN+sW060mMQiKPlJaEGYfIdzK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CF7jWAeL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CF7jWAeL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739be717eddso3078083b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752814; x=1746357614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=CF7jWAeLWUh32TNDoevWzHxzVVh+lNUIB8fAYFsWN/Jx2rBQ41vT7WItxvaVhEkNZJ
         pqqbd8jLK90FASYgCmT0ZqyGJ4OGBYdOLap0YT/rrqf7LvJlxq4B6KD0pBWk6WkTGxge
         9r+QCSSH3LaotXG9QpLTTezerqJQbQMI4sQHyd9rZ1LHd+1XYzGlhIX1TiFnQiI/oL/c
         EnlNmGOVYDWkXCNcZ+U7tmp/bhQ55Sk7CJX44WW2m2wCGli3ozQI1xpZ+NGNbiH5LCtJ
         ZtcPchEBo+bs/83qHteyoXWMWltU89bPKKKu4g+Jl7zL3G2jHRFhxBWn5IdFhHsz5HeI
         gzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752814; x=1746357614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8PIzBYTDnuUJNOzFhZUf8k7SMLmkkalf0cCtjYXloU=;
        b=n12bJ3VZPRTJAoKkzIuu7cvuXe/OGPnWcss00a0EG2ARJ4c3mrCnpgPvFyOitPghSV
         mlOrL2WbsdB+/tDt4qOXO0WK3prZCPiSAfg8s0wkCsBPlhA3/Gs7z5JgM54+Q+Ya9rkw
         xhGCmEOcguApt4jVzMm5pN9g+ezux8GGPlBzJm7TNf842yc3J94l/H+siSQmY0FfJMn8
         oqagScWKZqkYsETd6scQpFNOyoN3uL0Da6/x9WF0wjQAPqJ/UFEg4I5RhAxMOUixZSN6
         TWude3/jGy+/grZ0XIznAg6qD3/QNBbGZzX/sotBcHL8Y3IK5AZOlLtXnzCip2rFGY9R
         1CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRmdaJJnQ4RKL5Z5bzzQFrIfHM5wCincl5FgPPQhHOwLLLk7IQQc8mYU8ntf6iKYrver4hyP81PSe/4ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweYB1KRsfa800iqAswGr9f4uMYPrpBSJyUkVjmDnF3s8aigZdx
	1y8+kFh+wVoIfjs9ECM1QsMJXErXWF9UsyvDekkGk5X8DeSWUP48kVGznoWqbw==
X-Gm-Gg: ASbGnctNGKU5ZPhHDQ0GHaf8hduYxbUXqwjlJzMo5tJr0u0AfeI4+DNdVJReO2euxiQ
	5uQ8jTy11mM8WpMVNgBlPxbVxpx9Xd/PzZBzm5DBUvtA+5fgL51894OWDGKSaxY8vUuteW1qFeF
	uwpxRiR/aYfMDq11tyddCuN0qFkmOZ2l7zR3kX9s3XFWkp8PR0xZQvfIav7ZaHjOZFj0KXZ5BEg
	w8w4bLDbl+lZnoGONUGMz85SE3jFr5TRQUtK3BBliE66cTMWnfekRSi+CF3vd/SEpdhopFoxxrC
	8BEt/NipgJRuopbiQDsHnq5crnlz7ddSsvPRWpj09y9K9fxrkwo0
X-Google-Smtp-Source: AGHT+IFv79IfZh1GxCFHYniWlVSDWEu/6IbqRbKPw+om4ozt3ytyq0VaNeh7LhP4FfVYP6Dn5aHP7g==
X-Received: by 2002:a05:6a00:2da6:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-73fd8b6bc26mr10692158b3a.18.1745752813817;
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a17csm6054959b3a.111.2025.04.27.04.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:20:13 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:50:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 6/7] PCI: imx6: Add PLL clock lock check for
 i.MX95 PCIe
Message-ID: <fnaivdfzjrzcivpegdozhp5i4cjqehze5smp23xiwktce7x4a2@2ryfqsuyvfec>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-7-hongxing.zhu@nxp.com>

On Wed, Apr 16, 2025 at 04:13:13PM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One comment below. But I'll fix it up while applying.

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..4cff66794990 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -45,6 +45,9 @@
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
>  
> +#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
> +#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
> +
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> @@ -132,6 +135,7 @@ struct imx_pcie_drvdata {
>  	int (*init_phy)(struct imx_pcie *pcie);
>  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
>  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> +	int (*wait_pll_lock)(struct imx_pcie *pcie);
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> @@ -479,6 +483,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
>  		dev_err(dev, "PCIe PLL lock timeout\n");
>  }
>  
> +static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
> +{
> +	u32 val;
> +	struct device *dev = imx_pcie->pci->dev;
> +
> +	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
> +				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
> +				     val & IMX95_PCIE_PHY_MPLL_STATE,
> +				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
> +				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
> +		dev_err(dev, "PCIe PLL lock timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
>  {
>  	unsigned long phy_rate = 0;
> @@ -1225,6 +1246,12 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  		goto err_phy_off;
>  	}
>  
> +	if (imx_pcie->drvdata->wait_pll_lock) {
> +		ret = imx_pcie->drvdata->wait_pll_lock(imx_pcie);
> +		if (ret < 0)
> +			goto err_phy_off;

You should also assert core reset in the error path.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
