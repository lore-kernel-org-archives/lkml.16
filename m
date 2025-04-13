Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91D18A6BA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744558419; cv=none; b=isPJr7WwN8s5CjnZSjm1R3/Dl9vGkVD/2aa1aVjvoisB2zb+89MLnl1tL/Q4B3lrklhpqtz5X29y1FPbyf2efKyIec/uyBZMjEyXyZ5JCIeKFdaSGCfWvEPE8JfHlTdUPKqPlXMXhp00pF1eVROM1chKKAV6nq99g9digUtd21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744558419; c=relaxed/simple;
	bh=QkQ35FzU1yifEsiO2de7qOQR7aY4ClASH7PHwPz5MAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYiFu/66RjP/2EGhMczI0NL6DbH3KQx0fETfgKGia9V8EVfTUaNArRphB7jKJY0giICkUmlxrUPaY1LMueFexWs2+64h4l3QPBefyZwduXlQilihQG/cYMEZhfzoWd4JDVz+qhm+A9kF9jO51goJrzRAdNVlRs14DO2bGQNJONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i5LTHIUD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i5LTHIUD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739525d4e12so3074702b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558415; x=1745163215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=i5LTHIUDVHGfuF97gKSbPfxyrvYJ2yhLi6J+MGaGxz+IYbFoCeFiPpV72CcOzFPDtL
         SRQW1m+J9e6QizH3MjEwsjDt33hqWuwMd9INCxcqz5jsg0PWuxnKpbVJdWkw+021Mwwp
         Se8ctdTQ6hdxqc9BVqJdVB1c+Ck0hzdFT6d6S0+WBjyjUfOBP1tEJ5qK8chbUy1EMdXK
         D6ZIehtpWazV5b6TDbI9D24zZI2+iUIR1IJDIwx9T36JabU+ly9iVnSTzWsRzwFDPIgA
         kgT0EPTb8WGo59ZfURLPjSt9qiHe1CcpZv6cpe17ScX3wcv2qT5Ey/RiUui+8v8Bwe7Y
         KdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558415; x=1745163215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y72/tqUmhTX4OF/q+yEQ8DxW/l3SBJIjmbILZthaGB8=;
        b=glnjRr45MgSHHM4Nlt9v2o5SSpgDM51I2YwUaXmBHUaTGzv/h+DEuGk30sS28/EoiF
         mrEJqZvsa1A8K4j03Rdw8T9dWybs2s3FUJl1dGb2WuCV/4DIa3scN7E0Nz/PCaE45H/S
         Z16rKEwX52BJcPK4rpCuE47ungFWmH6Ksk2WZuYJ8wR7/lE87EDf2uDvMlsmJbOikRZO
         IEGnUOW4ZTU8tdq9bUjpCUxLNx3jJTyZ+M7Ct01/pkomL8HPaKFFZYzhJZxwOLSzzrjg
         MV7gz9yl4VwhIFniG/hnr4F6Kb4iSoF3w/aIIB0zXefQH7GtT7zA/nnmQOBQaNnqCpTt
         yZkA==
X-Forwarded-Encrypted: i=1; AJvYcCUtICidXtznwgKB07M6LpO+/NrZvIBwzwnl5mT3fZI70Ic9W8q0n2A2+UpAcZsZNtaz+jkKEwS8Ih1eNE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNoGeA86Y0HweXJPyznylwqA4R/KhxBFPCOuI32C67uUP/tMj
	qbrkvvSS8dDqum584q9Fuli994KPWlrZd2i6wk/s6AUBJMFM/ZToukamM+rpuA==
X-Gm-Gg: ASbGncvgTNArEiYr3nDYZPR7eXCoVvNkbzwYR0zXpx0Hm8N+T6MGx0tigeuCtSgCBzA
	rFv4tUv5JCFBIXp14sILsDTM9LM8tZ0RJxw7yx3eg2uCPJgIgczRFJy9ImWc4gfN6i1A5lMlaRr
	DhBpM9iaR9H6lQF2WvLq2kq8tJ0x0XG+4s5j+8nP0Kys1Aq8F/f87Tiut2o2u4PaMvGXEqpaUpH
	3u4FBJgWRnztMPSysZ3uiIjsIAaNDc50EHgJ8GpOc4VHKuAgAX7mXahk7WBea4VqiUfDqPeF2iF
	eO/2WW+/Cl38a6fqiDH1ETbi8l7x04TPo2cav2bZkgxjKO8b5LoX
X-Google-Smtp-Source: AGHT+IGvabAafKDG9hWtMQ/mt33loVlPQcrjfAy+WuQVWFVLw+b1d0XyCzCWqgYy+BHZJDGXRxcaiA==
X-Received: by 2002:a05:6a00:a89:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-73bd11e6d55mr12724724b3a.7.1744558415257;
        Sun, 13 Apr 2025 08:33:35 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f883asm5237044b3a.107.2025.04.13.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:33:34 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:03:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <uqrhqkmtp4yudmt4ys635vg3gh5sibhevu7gjtbbbizuheuk45@lhxywqhtbpak>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-7-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:29AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7dcc9d88740d..c1d128ec255d 100644
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
> @@ -479,6 +482,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
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
> @@ -824,6 +844,8 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
>  				     &val);
>  		udelay(10);
> +	} else {
> +		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);

Is this PLL lock related to COLD_RESET? It doesn't look like it. If unrelated,
it should be called wherever required. imx95_pcie_core_reset() is supposed to
only assert/deassert the COLD_RESET.

If related, please explain how.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
