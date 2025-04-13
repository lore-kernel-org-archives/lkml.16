Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DC1DDC18
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744558215; cv=none; b=qdDWPVoc/7nuHaH8A/5vOrxcTWGxq+UAWnqrgubay1QtTn21rKEbrqg7mgSit1iEDtY49BinX9aRKI2Zr4nyF09opgSjaUZyrHsv+VB4GjWtwg2g0SMO7Uf8n8gm6b0tVIqTobXLhPrqGiLjwkGvTlTL1DHjE0Pqgbno+SvF368=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744558215; c=relaxed/simple;
	bh=O26QBjaeH/GBehwhCpe0jia62s2T5H1sKW+zOlJypxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eB5whIU9I0OgwnCp/cGcSF5tZXSZCkxIgIhbVXfCncT18bbBLLKyxXqvmLUqWAiaebz96t2O822Q4ov1L6tdf1+XmNAkEO/vNTkI0TPmzuUxwUVAiPjGF8tgB5hz30nPGWuzOdw7JdIMudTE+YuFwE8e194QNz0gc3O0SLKJsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynvxjdVb; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynvxjdVb"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so161116b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558213; x=1745163013; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=ynvxjdVbh5MiGblmAX+b5DJRB1ynwVswH4sE4mGfhJvnxYlx5xk1f1A3zmLplD7dgr
         buT7ztebvmK7Y2DoBRxyOaRfrrOXGghZACFSc0CmxsG7l2Pxkj8YeJYi5NwxnyYaQXaT
         BogT1alXGouVpaXUUOENJTRtTDy2d6LjUqEBG+GlIdMr8ZJLvKXQC/rXrJOUoSEMh3fp
         BETh6zyz8/eIiIxAx/UdBsVMTLJezct7Yt362XVQw7IWTIEhB4Rf5Lxkw096B6Q5xAWL
         eIZofxqIh43QpUu4QA1EfxG22rY1kE0yf5YgmZLZbPl1TNl1xXJhRpUt51wxCOFfN1ON
         DxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558213; x=1745163013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=OKXFQvIjcrdRNlXHsczCbedJaNlqsacKLsYsgRRmhjWdZxGgevApCgPt56qUWJVg7n
         WjS0YzhNALXv7UcHt7YDGC+Wr5IA1jjIL2zE0VBZ6CuU2+QwvLNJl/kK8b7ONEm0SgV6
         ceJECu01cpRHGQ3BI+XIb6znmDIdcjWNxbBqCnPCcqGH8po3Dq3YLIIjLDJCsmALaPyC
         /YKVK61dvse2aR+Xki5iENT7GOnsfndDE3uptX3kKyarP/elPeiZeduVwCBSW/1tl1NG
         bdLq7clFDeQQ6N3J4ULT7Ky9Wg26AdhlLIFvmUyY3TA5eRXBcJagpfSQs5Us3m6UoJYi
         VWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDKTX+CP/pyzgU0u5aomXdm4kkSn4OwdrNugvtJtlCsaa1vXQR3Phq8bHshVl6Nishz7AtI8VBdIThTc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuWlcbljf8VeK2RxQ3MTrazvXwWhjO2o8i5l8kS1ajm8rBLR5
	twOdTNMqZCjD0aNBkl7VYckiB+QMf4fLuFr2IHq32p/Cl730cwxFJvHInymwWg==
X-Gm-Gg: ASbGncsnCO6+8M6wyUoRBWy+kDDRyBDNUkk8XhoZpYFhAXivKpd3tEc1tlLkjXIVRqs
	jxTkJ4LGt/4yIY7pOpWvXB9Tl6S7V96xeVEd7jR5G7hjouZ6gjHjZZYNfjyvXRtDJQiaqnq6k0J
	PP9dIzMV3EF086drKQyXeLqYxqDvv/PeRZJFpE8DVUa0LSM5XuPaK1Xu5G01CZuHr964sy4rKai
	Eos1WpFLRkJTYpZR7UiPhStapc6Qk+6ktvLD3MLfgtJA4ILICHG5Rdk9ZdkYcpSMe+BmSDUF5V7
	oV9/Ex98RZ/20eTmfKSm0T45LLaNfHJXUbR02JrdRBZE8wF06QMy
X-Google-Smtp-Source: AGHT+IE0jyYBaLWROxwZRfj9Ap/rRwqRq+YqVPUJFP4QfIr9YmzNv06dYU+2Uj5cgUZODs640X4qrw==
X-Received: by 2002:a05:6a00:240b:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73bd12bef8dmr12879327b3a.21.1744558212599;
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219bf3dsm5245218b3a.16.2025.04.13.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:00:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <xajelvlhvoxyt53qdx7dmi4wgp5yvc2hpk5bqbftwklp4ecrhj@gtv3mhb2pyvi>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-5-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:27AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 

Please do not post next version without concluding the review comments. It just
wastes reviewers time and is not a good practice.

You haven't resolved my comments on v3. So I'm not going to review this one.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7c60b712480a..016b86add959 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -48,6 +48,8 @@
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +#define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
>  #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> @@ -227,6 +229,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	/*
> +	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> +	 * Through Beacon or PERST# De-assertion
> +	 *
> +	 * When the auxiliary power is not available, the controller
> +	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
> +	 * when main power is not removed.
> +	 *
> +	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> +	 */
> +	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			IMX95_PCIE_SYS_AUX_PWR_DET);
> +
>  	regmap_update_bits(imx_pcie->iomuxc_gpr,
>  			IMX95_PCIE_SS_RW_REG_0,
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
