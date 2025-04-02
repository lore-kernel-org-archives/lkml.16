Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAEE20CCFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577953; cv=none; b=ETc3JpOeJPcOe6//ycgJL/78fQofMM70AyHQ72mzEN3NZRA7SonB9MF5r1hM/XSF2f8nMat7Lp98j57JK0YoitUla6N2DCFlDsN1HnT+bD2bl9jCfNnBeHJ8LdBT+4Nz00a/Garca+CE8AxiJYrOADUlJmgYjfVIaogtHqi2dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577953; c=relaxed/simple;
	bh=Do+1eZGwmWesj3eli9u1qcZzTpbFk1y8y7JB1TWG/yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhNvSgZGYCc3LkkGYWREpLxYJ+8vq/2HN/DNuFJPLAtPCuhWdM7KRCDg7mPudQPJEDP1A7TVKzyhi+O7EOSGhyicCCUbvSjoJIR3KIhPewMM2/qmAtW3MoEJBR5nX5JwdrXWFLgC4eVhl5JTwhnmzGeoh2K38SCGFRvQLXe/wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5HMSA7S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5HMSA7S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22423adf751so118982895ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577951; x=1744182751; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrj4V9MRgCpu2LtNWMLFim5E/d/HPPAOJpXxZxDZGfU=;
        b=q5HMSA7Sy3iwzSOk4y7iKsHrqNoaIwsfaf0TpwQNgyddkAz1hodTiF/atjwqQ9O4Nk
         CGlNT/J1yPgcWtKCt9cUnPcrDwKQ5foVegMJlTuzor+EI2QzT0K01BvLYMyWvdn3vUHu
         NdKpMViIC79jfmUPmhW6iZ2BcCHKUrnXxASlEAX0vVpNtRJIbkTUXOTFJbzN3b7cC9Lx
         bUCijPMy4aPZraB3A7S3Th1JdT0FHZ2vuiARfzMq9MVD6x/mW4zHkI+Q+HogJO3s6IJ2
         d24ePi9xPx42Z824fq9zGCp1AD3077Te4YVosZZIt4SmwkEMvcuRUm2OMXM7bd3RtQ1A
         UWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577951; x=1744182751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrj4V9MRgCpu2LtNWMLFim5E/d/HPPAOJpXxZxDZGfU=;
        b=tXFLhrvuNy0UWGQjaF2s3RBtU/NvFjN8yI41G0hYOWunGrabIHo65n9uo/x5I5Ulxz
         vhkBaQdws4alCcJNr9cO4svjZYEuhFNr98iQ1u/k0hzJmqj+3japVX0aFWuDvG+5Qs7e
         7WSIUKCB+yvX/oDL+o+qsntGwnykJwe8q9KVllTa+4tohNxM01+xZ548mULChFs4DKJS
         +ueG91TCJecscF2LisfL5STtwfBL8wYA5U1nZmbMBZcVLTdxmzxqPhHz25GhINd3PBf1
         hiuAWTfkgp18/DsyxMr0lNb4yHL35uffygwo/Aq1FYhA5dAUFJ/T3ZDwvAQRTKhUXoPX
         CgPg==
X-Forwarded-Encrypted: i=1; AJvYcCV0tMNIPQ419yL2KbxdL/enSL0c3Ohf5z5tYT8AayPo0McxJqBhkHOtiAzV3BrjLNWSCbuIs0d1sOj3Vl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgbk4t4aMNvE82HxgGX1Z5oP4GsqOjRdqpFnmjEr5+X70aPPRB
	0LWmVT9Q4rt1LPSyHWshWwnkSmKiBsSeyqNbP0JNY11M3E83vYGWe0QRABcBc0205lxsNhWS+oQ
	=
X-Gm-Gg: ASbGnctK6Z/Hmdcv6UtaTmAR1lI6btLgTL09xZgMLCNPErDJtxWz7EeaaSXUNhZy0fm
	g/Rw9AVEAFAcXRLRsa6XzKlrxvHZBrPJcHPw/DqbrR2gKUfULPYaLzJe27RLEQQMLWxWOPMagty
	byxbeceQKBYcDbWDHJ13WkqRvcyj6lMxbHgxhx4+RcmUnEOAcBaj47amr78HZeP1cxh0VlgMUy2
	z0J2sJftGwog0B5/vZAcu+Q4iCnA6GA/RKY3+A7uL7u/e+I7dVLv7toBJ+ukIwc5XTR6gcZEayD
	8KU2hZ5iQMboa2owzZxfhmoXYzvUxVhnbjn17mGpQZAuwbo5l3FxZ0aX
X-Google-Smtp-Source: AGHT+IH7HVyfhbJgscLZlWHcx6unjJnhNHPt1Oe80QN8jshmi6OTB4pxtx/6rlu6wrrrxDY+b7sOkw==
X-Received: by 2002:a17:903:228e:b0:224:fa0:36d2 with SMTP id d9443c01a7336-2295bea09cbmr81844005ad.26.1743577950936;
        Wed, 02 Apr 2025 00:12:30 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6f91sm101088425ad.17.2025.04.02.00.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:30 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:42:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] PCI: imx6: Save and restore the LUT setting for
 i.MX95 PCIe
Message-ID: <ifq673ok4bel3qe2rsaiblmhnsfbevogrvgnuceewkq6vi6625@7ug7d64bvizc>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-7-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-7-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:13AM +0800, Richard Zhu wrote:
> The look up table(LUT) setting would be lost during PCIe suspend on i.MX95.
> 
> To ensure proper functionality after resume, save and restore the LUT
> setting in suspend and resume operations.
> 

There should be a fixes tag pointing to the commit added suspend/resume support.

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 47 +++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 40eeb02ffb5d..d8f4608eb7da 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -138,6 +138,11 @@ struct imx_pcie_drvdata {
>  	const struct dw_pcie_host_ops *ops;
>  };
>  
> +struct imx_lut_data {
> +	u32 data1;
> +	u32 data2;
> +};
> +
>  struct imx_pcie {
>  	struct dw_pcie		*pci;
>  	struct gpio_desc	*reset_gpiod;
> @@ -157,6 +162,8 @@ struct imx_pcie {
>  	struct regulator	*vph;
>  	void __iomem		*phy_base;
>  
> +	/* LUT data for pcie */
> +	struct imx_lut_data	luts[IMX95_MAX_LUT];
>  	/* power domain for pcie */
>  	struct device		*pd_pcie;
>  	/* power domain for pcie phy */
> @@ -1505,6 +1512,42 @@ static void imx_pcie_msi_save_restore(struct imx_pcie *imx_pcie, bool save)
>  	}
>  }
>  
> +static void imx_pcie_lut_save(struct imx_pcie *imx_pcie)
> +{
> +	u32 data1, data2;
> +	int i;
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL,
> +			     IMX95_PEO_LUT_RWA | i);
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, &data2);
> +		if (data1 & IMX95_PE0_LUT_VLD) {
> +			imx_pcie->luts[i].data1 = data1;
> +			imx_pcie->luts[i].data2 = data2;
> +		} else {
> +			imx_pcie->luts[i].data1 = 0;
> +			imx_pcie->luts[i].data2 = 0;
> +		}
> +	}
> +}
> +
> +static void imx_pcie_lut_restore(struct imx_pcie *imx_pcie)
> +{
> +	int i;
> +
> +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> +		if ((imx_pcie->luts[i].data1 & IMX95_PE0_LUT_VLD) == 0)
> +			continue;
> +
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1,
> +			     imx_pcie->luts[i].data1);
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2,
> +			     imx_pcie->luts[i].data2);
> +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, i);
> +	}
> +}
> +
>  static int imx_pcie_suspend_noirq(struct device *dev)
>  {
>  	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
> @@ -1513,6 +1556,8 @@ static int imx_pcie_suspend_noirq(struct device *dev)
>  		return 0;
>  
>  	imx_pcie_msi_save_restore(imx_pcie, true);
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
> +		imx_pcie_lut_save(imx_pcie);
>  	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
>  		/*
>  		 * The minimum for a workaround would be to set PERST# and to
> @@ -1557,6 +1602,8 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  		if (ret)
>  			return ret;
>  	}
> +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_HAS_LUT))
> +		imx_pcie_lut_restore(imx_pcie);
>  	imx_pcie_msi_save_restore(imx_pcie, false);
>  
>  	return 0;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
