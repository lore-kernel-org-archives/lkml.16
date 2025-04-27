Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D54C91
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752560; cv=none; b=Gz8BUB+bakPPP9fDFiO6oPCrG6dLB2HBWQBUoG+KcIx/wuT1mP5S8mDCZxFYeJIc45iB652D6p7LF2HKlYuIWPSLlAfjYD+z/gW0fi41upSZDSPSgSN3Nwl97y1oIkZf5DDmiX2s3byUH0g7tgWnLnn8it42ynqwJfMPugIiah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752560; c=relaxed/simple;
	bh=IuHqjHQKIj4MI9Zg8PVsHK2jscKz451CoRU+37OGLGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWlotKgPMUjVSgI2Yq7b5lFQxir7E8nwsvPbRGjf6qtGhYdmXRIrknBddWLEC0roB5Ucl8XR2+W9h/xUSe4Q5gvgi4vcvicqJqc1Ts9qNQa5fwyzSVnruHDMmIUlHqb//d9y7B//yISRBBn1AVMqxEbjz8gqvQLQRh/gdVr7dKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1Z7lpZS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1Z7lpZS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301cda78d48so4865528a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752557; x=1746357357; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=I1Z7lpZSqU63VokoSTJxJj/1srKGZqzxDwk/C74Ow9YEejrV/4RpypPa4XE7eFenVE
         o+yUx48NbA1BwZcMQn1B4qvmmarMxoBLbHBBIkkMxlXEvxVYBGBfB/fPGxKVroZ7uT/+
         uktgRfYYQydeWT6ycnoZE+Nqspry0mNHaz0IKI2RrpIo9+anqnKI/0BOcILqrXVorqZR
         D8ktxKIkUQVM8PX03SkJVygT0LoxJCWc/xPEBTsmeRG3UaGc3vqU2vB/cQVCUL1VDxa9
         DpQogOqireYYz3HRQN5dejQ/Gup7C+rt77j7v02OK86P7BWjiO/gBXIjOiaqWIuqqCTc
         Kfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752557; x=1746357357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOn5uDNnmbpz2YvqS/MmIuJTmu3qB5FpprhRLnKlvIE=;
        b=IgP06lfW7J8ZTDzpRGaAvXZ/TwNgnEVWicNcjUZd/CZ+WBeJgXJEkdQaAb8YRHtgSU
         d0dUfirU1+RYvp1N7c6bWt6Ln6k6rhlZvAtNfeHGAMWYqv9blzGSPytSmp+Nu2R1P++A
         CxD8WQ5fDmlqP4kY6loXaCo5FgWBMHb5PUtsNQ6HlqL0LTmZFYTtX84uoI6zZWoaTLS5
         CkWtt2n1FRTTeGHp47I8ja2p8xZnimlKRwACOM5nrCqqpyOY7a8k0oI19stIMNPRlp1n
         hkrIu9F8VPCHdYLj95r167efV4K/KowG5bjsvoE3cb17p6t1C9EN8sBbKiIRzKfJvKJu
         bXDg==
X-Forwarded-Encrypted: i=1; AJvYcCW33Vbn/4qRh72RbpHzJNxcad442YgkhkYiPFSzygjLLJHjdJyBlGNONpf006U36yGnmre4ql28XXG8K9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG5U/PfPi2jJ8SAiCsZ6e1e99e8hjsPk4IqTWmLX0s6eC5QzEc
	3wuVaFL8VYAw0OtB0weTtbzjdPKKfhs9muVFzCOxi0MYZ4/1nqM+exv4/cKRIA==
X-Gm-Gg: ASbGncvqxd4WhBFRDjOtEcmNaIh0yIkILmeXN1pybCVDkKI7KdxtivM/07qju5/ybZP
	olPN9C7UHMPz4VAK5oJ1eEsX88DiSWTp1y4AR6j4FjBQ4oEQUOLVSUm9bPPw0CPmCz9S8rYet0R
	9dmbsHbgP1XGjFogDw3rTcNpGbR9tIWN51wc+zftzw55+rW6WmHYnvCvxG2daei5dUbhkYo45qF
	e9dm1M0GzL2fVaOJMlMMqs+hejd7SIv0dX92zeupTGgMdx1srQJSH8rC8AEzY+pwyiXhpGZxyGS
	UlQpCdx2KhuqIUJZW31aoi78StvKJ4Hfse8RUpPUJcoFFPoPvVEOVuNk/M1adfc=
X-Google-Smtp-Source: AGHT+IFLgscZ/lYINfuAkkH9jISjtRT3pDQ1Z95sY0g7bHDD7akZs8rvcSaagngpu+qBp7Bz7x7Yig==
X-Received: by 2002:a17:90b:2dca:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-309f7dd8a34mr12567779a91.13.1745752557651;
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7cb2sm62778045ad.112.2025.04.27.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:15:57 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:45:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/7] PCI: imx6: Workaround i.MX95 PCIe may not
 exit L23 ready
Message-ID: <4cbv5uzo2vcigrjmpisg5ndovhkp2cpyg5sczpxsde7gmv5fd2@cf4li7yqkxwn>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
 <20250416081314.3929794-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416081314.3929794-5-hongxing.zhu@nxp.com>

On Wed, Apr 16, 2025 at 04:13:11PM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 
> The workaround is irrespective of Vaux presence in remote partner.
> In the other words, this workaround should work whatever the remote
> partner has the Vaux or not.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

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
