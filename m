Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F51AA1D9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557516; cv=none; b=oM+Va93rYXyfTwL0CaZ4WoP/52UVj7GEQjrSjG3f+hS92neQNHDA6F1BYrDCcpi6O8QS/iBKdm1fCCpy+ECJ/wDsEks8lgwR8hFaJ/JmC0pID5OURXRszyVJ6ejRw9P68Ky46XPMosqR+zPh6no8Ye091ENNbB3iHncf0Z1tzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557516; c=relaxed/simple;
	bh=zmesPPV9ChE9oRi1yUXnqbMt44Qq+n0tUWnOlfbWAY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoYTL6+2av1+mM/3ayJQ0IbdqcPyR/nQ5d3bFep00RUNgP53oyiqEjsTjpyJlKajPmVv5kxZT4IurXDuEAWVRkIc+daH4Ixmfrc2CSyBb1+wOZMoIXyP/xAfMwSnxmiGBMMiX4Czq0XRSF3rAwHdiuyPdOfb2FOryToRIPbI+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGz/YAcm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGz/YAcm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2264aefc45dso50922505ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557514; x=1745162314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=rGz/YAcmDcsKvphWpq/UmOnM+VC+MYR+M9AnUTuQ4NEtleW+BcR0iRicQgHhIbJla8
         BvP0qi7zr4/MzH+vw2rHV7ek411fuRSossQVJcEIIXl2I5Z++HaXy33GGbTZoKMhm3R8
         QVv6MuspmN2ca1+EeMkvXMELvGz3pObOZTAsu6dvtM0G+fG3mwNhae8iMfY2KXZj1nRt
         R3jnc+M6AW/9LarLFn0CBbtGMAwBvaUYRpHUR/Hko1g5nI93NMbfuqxubZflJmRWqkbY
         oTkPnGzLLJqcL9qcSk3ZXyLcfrwefY/Zrsc4ouzSxOuPoo4Agmys1nFUL1wBjk/CsaxN
         qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557514; x=1745162314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5SxyZdFhsBdqIFHmGXVTKr/6RFpFPtSv5Kv+4B1G54=;
        b=Dip7QN9wwf6+8vTqWrqVvmW7dOmzKnRLO35DlPoagOArS4GgU9O/86w54xJZYYvaC1
         +NisZfvRym8/uL2pOpjHcJC7CAWi0eCa0ltOeXCGcBFQfhyqqC+ENOeVpshqo7d2T9y7
         6j1yNIbNyxvjWCJyVZGmq9lgbcmamPkIwRC7ZVQZ+Fb+MdTBPjYRitHNK5GEZuzvrqMj
         r3nVMfwFQIrTbNyvWrTYp1jjwuad+LRVNamPkaj6ExJ8r4x1a/yft0avZT5rvgotQHqg
         kPRB4DnMFReRTRhKhzh6prQJRzygLoE0CYKQCbatcT5n32xLoMJULFYvygK2Trl5veaR
         IRzA==
X-Forwarded-Encrypted: i=1; AJvYcCUiJfwBzE19rhGM2andOSks/IHEfCmpH7QJ2CmIOYgX0dhv9UsxHhKAzopTJ9Ma80wqgjfAN6pfLE+T8DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWcyChH7VF/87SXP0b3mnGLt5SpLoLwhD6xjG3mLo7jus9D8Q
	6Z6Fq9x6OViAAA+guM2uDet3pPXORuck1PUc0+fMaRT25aftcYs6dn76SwMqhA==
X-Gm-Gg: ASbGnctcAMq6l988OQRzbx6KmzbHEBbYw4AX+C1kWVAu0zDkVap6/owiv60Od4u3I3V
	HGZZkyqG2enwr5Ph12myFkVESwhsAIs3oQ6DLjHHlCyUpcUc6s9YH347FS7cVFtyJ+0R8bzDsqh
	UhgUHJ9ZbEzDhf793P2rcxk9GoCSXZ0X486HQW/bzmVPbJuZoETsW58MwgGiP+7o24NxQXvcVOM
	6Kd4vEyrstkDzd+18AVqbxpgY70p51f/4OiOB8iabv1sUMI+HwoY9vXvGke+74PPg921wv7Vcje
	B1RJnH/fPefSr3mHP/GdCxFRyl3ytgQA8dJLWNye7VlDZqNNMLBa
X-Google-Smtp-Source: AGHT+IHDZ8f7JVDhbxKzAwHoGnI3IfIzM3yHwUjNE3PyS9q8zuAZM5A71PAC0QwIseLe1+9XzUcjmQ==
X-Received: by 2002:a17:903:2309:b0:220:c813:dfcc with SMTP id d9443c01a7336-22bea4f1ab1mr152530195ad.40.1744557513757;
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb59a6sm83980095ad.203.2025.04.13.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:18:33 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:48:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
Message-ID: <pnc2kgveacnox4kbdamggp6p7pjmuyan6lwucdgzyqg3u75uo7@bb6bnsy75e4x>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-4-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-4-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:26AM +0800, Richard Zhu wrote:
> Add the cold reset toggle for i.MX95 PCIe to align PHY's power up sequency.

Please avoid spelling mistakes in the commit messages.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c5871c3d4194..7c60b712480a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -71,6 +71,9 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_RST_CTRL			0x3010
> +#define IMX95_PCIE_COLD_RST			BIT(0)
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -773,6 +776,43 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> +static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +{
> +	u32 val;
> +
> +	if (assert) {
> +		/*
> +		 * From i.MX95 PCIe PHY perspective, the COLD reset toggle
> +		 * should be complete after power-up by the following sequence.
> +		 *                 > 10us(at power-up)
> +		 *                 > 10ns(warm reset)
> +		 *               |<------------>|
> +		 *                ______________
> +		 * phy_reset ____/              \________________
> +		 *                                   ____________
> +		 * ref_clk_en_______________________/
> +		 * Toggle COLD reset aligned with this sequence for i.MX95 PCIe.
> +		 */
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				IMX95_PCIE_COLD_RST);
> +		/*
> +		 * Make sure the write to IMX95_PCIE_RST_CTRL is flushed to the
> +		 * hardware by doing a read. Otherwise, there is no guarantee
> +		 * that the write has reached the hardware before udelay().
> +		 */
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(15);
> +		regmap_clear_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				  IMX95_PCIE_COLD_RST);
> +		regmap_read_bypassed(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				     &val);
> +		udelay(10);
> +	}
> +
> +	return 0;
> +}
> +
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>  	reset_control_assert(imx_pcie->pciephy_reset);
> @@ -1739,6 +1779,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.ltssm_mask = IMX95_PCIE_LTSSM_EN,
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
> +		.core_reset = imx95_pcie_core_reset,
>  		.init_phy = imx95_pcie_init_phy,
>  	},
>  	[IMX8MQ_EP] = {
> @@ -1792,6 +1833,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
>  		.mode_off[0]  = IMX95_PE0_GEN_CTRL_1,
>  		.mode_mask[0] = IMX95_PCIE_DEVICE_TYPE,
>  		.init_phy = imx95_pcie_init_phy,
> +		.core_reset = imx95_pcie_core_reset,
>  		.epc_features = &imx95_pcie_epc_features,
>  		.mode = DW_PCIE_EP_TYPE,
>  	},
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
