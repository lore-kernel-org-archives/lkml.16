Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D0233708
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577831; cv=none; b=YZSVxV0JZnDujUo9/rI8vnzIscvdKm5E7nGrzXvfPsas+UtSGt7wNeGym/rsHeaJv8iCXIy5EJsV0zIqaPz9PRu3pT5CbSkdV3js3voUVwX+JBLRsbaSPIMtafX+VovlEclVACH9fK5rYKQWRgICquGTk2+z5EGY8f0sXlsEkNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577831; c=relaxed/simple;
	bh=7ZFduh289kmIv14Cb97BOB2D+kLl6uOqn1YtVHrX7Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3G2E2mc/cjzf9Ysb6qPQ6WbHIKBOGjKJnVEzZI611fJ28QZwlwMpRQHPKVYa6ci+0vJzw9QEwmc1gosOZ7KQoMDRi/BpAFRuU+ae4afVq7iPlG00JOtH4mc9wTLbSSYE+NKHjAWzI2+GsUxL0Krg/hy2NQsx5MmgwzKn8ZmXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tn8lGSVL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tn8lGSVL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225df540edcso11130225ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577829; x=1744182629; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=tn8lGSVL4WYbU3w3ReJGEyvTyydMot802P0TAJn9vNj0cuYFB833AwYC+c9hzrg94r
         JWraFj6jqe8mJDL9vxFWDcinGfBnLujxmuckPLeIpROAEz/QmrgXD0//+S/+XGuaCv3E
         vxpJIfYY030MB5MEhjmp+kUpKl1WOsYyAgjk1iIDj6pQBfZSzxaFHP0CTG35NUXCefe3
         DJk8iW8h870ag1f/VtWahxyAj1i2H684OuGlVTdy8YWWEYMZpsYy7Ons91HP9+z8vjgF
         3pUIJFaZpLisWnFj036n08axuVwCnxRWyfhTeUPCiFd9eTirYHT3d6FZdbVfkLEVkULW
         2yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577829; x=1744182629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjR4lEGGyx3HdyMesa5h6gRayUig9bsMGHv5vZfbr1E=;
        b=q+Y4zyLu+wTyUA5RjIr8dAt2IReekBOSnle/suRJRtJrchLnkBX1LJNvXbywEuuyFw
         JVm6onC+5yRNdGVwiF08ZRMDQKep1fsTQiKHzJrKheJaFjwMaBJarjb3/PIyQ4u4aaAf
         iHNmfl5I5Tld1ZEB/8uOHWTZxJqF+BFAFV64+mhispQOFFcfawPyF++T7ookzK6I1tfT
         EfSwxgk+yEYRu7/9W0P2mTGnY6QzYjNfF5SQeAfI0GBsMgbNabMlimdivUdz+fZjsuzc
         DNOFYhKQSbfUvitBFCG1WX1jkK/i9UCf724+CLV4RnDoF1lSVaVMryTYdM9esrGUxpTW
         1GAg==
X-Forwarded-Encrypted: i=1; AJvYcCVd7ZtNM3z06WmAz+K2QtcDZ+/DuVo3KEKQZ4+ag/HxbIBWz1Td2ERB8ty2tux3E3Lv/4TwSWpePKEM5Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBql8jhn1YTX0wXBQt6n+lePz/Q7tjm3O8ojfsjLQyIAsN33C
	RstvKNJpf66jBshx4VFhDXkqYCIXW4q0L97zkM/qeFMbr5tDBRmfAhEe22PGoA==
X-Gm-Gg: ASbGncuu3PChT70XaDzYY0a0+nhh7veM/67EAMFcYskh42ypOZUF3FjtB3TyVV726qP
	BL4ro0fJTRibOGcoKKH/8117PtxVaerXqXxQoDS/qXAXhPeFZgS83zE3N8b58vQmawjEcxnqvs5
	len8TOgcUYA2ngKR+b84GkqXjEYsMsm1VRqKV0PCHbNIq0QTAqHsjL9I5fkX3syraE3+7x+utJL
	btrdaUIBbbHOG+V8tuwXicaKT02j9BZFGjmKfuxoWRLjHHgB2Yj2dh1iM0z+jSPRBF10nCItitC
	fAD9OQ0tT89MuczB+SGp3BigMrICIdC5vqDfBgk/3MSQ+4wmp5/HgXkl
X-Google-Smtp-Source: AGHT+IF2PkfJ6gvdatC+Ohrdk2DCIs4bJ4gvM262TiahqchaDp4ihwwIJoGbKxCJkUgJQO2cM8XLTw==
X-Received: by 2002:a05:6a00:130d:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-739cac57712mr1314725b3a.6.1743577829272;
        Wed, 02 Apr 2025 00:10:29 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710cbd88sm10117652b3a.157.2025.04.02.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:28 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:40:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] PCI: imx6: Add PLL clock lock check for i.MX95
 PCIe
Message-ID: <y3ys5ojt3cryklqibg4shznkjqije7bturs5ljkjyzbri5dhgu@jeo2mmyv7sci>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-6-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-6-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:12AM +0800, Richard Zhu wrote:
> Add PLL clock lock check for i.MX95 PCIe.
> 

What are the implications of not waiting for PLL lock? I guess clock
instability.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 35194b543551..40eeb02ffb5d 100644
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
> +		return -ENODEV;

-ETIMEDOUT

- Mani

-- 
மணிவண்ணன் சதாசிவம்
