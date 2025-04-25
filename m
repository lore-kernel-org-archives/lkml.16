Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6818D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563758; cv=none; b=nKoYzJfUlqIG87DKS+Wox+vWyUrrESp7qah61h246C3k5svUl6Xxr2apUw8d7OwQmnf+aRzti/mc0fUjI9KaQqsPGbKSE+z/GK2cz8q6LDZ2ofsCbZac5M3XR51s66ydzC+LNgHYT7hCAvWOWk8v6YNoL0XNaIGVdXSVvyHsFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563758; c=relaxed/simple;
	bh=RJUhC8jZPdmkCw96m1ynjxu2oOxzfwvaiJxcWhWxiPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCgYJIpnGGXC6AXOL66qqJR7FVNQtzPURLH9zGIIV/leXy+16uKX4VXvl0ECs6wt9H323JE8tfZWVWKGXbjtQPcyFrL+4j/kKLekkODFz+a9w3Khop/OqmQv7WehLzMD5DYhStAzsDFnrWULzSjQgWChSKEN/vSrnTzWVyi3TNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fubbd8CF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fubbd8CF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb2faa9f55so237640866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745563753; x=1746168553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivd78KmDTpQQYR3V4iqZRpcBAqYRLEDV/deWqE8MYC8=;
        b=Fubbd8CFiyic73w174KnBWcWx3qfKuLDbQz1DKXsj60+cqio2YR1a8+qWpovNZUJ5r
         zEcbmMyWVf0Xql2Z9NUBE5F5CEH2OLtLJUHIlRrePiQIC7NtRDdWEvvl5GT0wMhN61ST
         ZF/JaV+LvB2f7cJNgU+kpA8QvI/nreP3DlA0euVEZ3K0ArRsGDU0xjjCB0mrpDbMENp4
         8mNb/rZM6+UZJ4Tugcn3Dw8yoN5ef0MXs/dcE0u3Ng0hqwrxi+lzVb7QNwQqxHfQ4npc
         +E5zEpopzFKjzTX/xCUWEH6QyWHv3wjDlmucn6ShJWLr5Av6ueb2CC8yWgi8ac1C7UP+
         tVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745563753; x=1746168553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivd78KmDTpQQYR3V4iqZRpcBAqYRLEDV/deWqE8MYC8=;
        b=ZiLBK8PJkhLBziapmmhuywEeaIB61Ob7F1eC1iuIjV+k+f+P3+BluAIwYWnPSNxEjX
         MF2+Eh0cvE/1shq7H2eq6sj4eb2Bxn5wUztcfbUqigDIvkxmNAKC5MpDFohOL1UEjCrM
         WkDXXRSZsxtAj7NilR/U4jZEXzHaJfClpZPYsdynKsdT2IKnpJsFwc7eXtZXYI2++qBH
         ym3escNjdAKj9bDPBczgKNxERebP0MaUNqjm1wRWtreUrnNka+VIv+D8rfDhKHul7ZGv
         bpMiQGERPj1SZiMw7DM+TaVh77zF0ZodAXqgOJCAd8xTUShS/OmsADc+/XKgfN2ou2JB
         XV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp4DQi9xGxSW0qkNvhzRwuqD9Okjztg0AwC3zYCTqJ0EveF53J34nlH3grBPP/bawUQV/s1kVVK6DHUqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9P8pbNRLnmXPt0P0QpV+MHTbPATHCfl5ubh8xGZ4hSqVwv0Wk
	tKMiCfiPQRB77K4HHWzD2Bhii7m6Fg4NGrxSBZ1Q2IX43h8DhOWdoPnJMN0q2b0=
X-Gm-Gg: ASbGnctZgsaXpOPV7S5DCZ1r1zMZzQa3vvoI+FyZu2eKiuQpkej1nh/P+OCFoK2KZ9R
	3IWC61P3a8Rv8IV8Llu+l+Y/R6lDDiyOo/DUtmamL2xBSeFffby4Am/GVIqWFzQvEwCoBsAvAUs
	NVSZQyNo8KyXjktcffX3rWihROEGQqoUMjcom9zGJguMwmKoKHR2ZQ1396BZz/JMf9jSZ3kcABB
	mQJdW4aJGVxTgMhU1z0vwbVVe7ILVED0C8rlIKmmFcX80oXT9Ic+geo/vFrkZBmleGLahtvg4lv
	fvFS8BskhwIkvRpoOkwbdsUNfWkxydB1FNQb3A==
X-Google-Smtp-Source: AGHT+IGQNb36uoK9bF0qPR/AsAvXCwScqxDy/6siJaen64B0+GB2PNVnR8JlA8SrrEexTfvIVgUYKQ==
X-Received: by 2002:a17:907:7283:b0:ac4:169:3664 with SMTP id a640c23a62f3a-ace71177806mr107959666b.33.1745563752925;
        Thu, 24 Apr 2025 23:49:12 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm81776366b.168.2025.04.24.23.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:49:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:49:10 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aAswZg9s41s/m/se@linaro.org>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>

On 25-04-21 15:00:13, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization

Nitpick: Drop the double space from the beginning of each phrase.

> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 3cfb4c9d3d10dce49bb93b241f9b56c75b934601..5d55ed0bd198d786d31d5dbee8f32e6fbed875a9 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -167,6 +167,16 @@ config PHY_QCOM_UNIPHY_PCIE_28LP
>  	  handles PHY initialization, clock management required after
>  	  resetting the hardware and power management.
>  
> +config PHY_QCOM_M31_EUSB
> +	tristate "Qualcomm M31 eUSB2 PHY driver support"
> +	depends on USB && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support M31 EUSB2 PHY transceivers on Qualcomm
> +	  chips with DWC3 USB core. It supports initializing and cleaning
> +	  up of the associated USB repeater that is paired with the eUSB2
> +	  PHY.
> +
>  config PHY_QCOM_USB_HS
>  	tristate "Qualcomm USB HS PHY module"
>  	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 42038bc30974a376bb2e3749d57d0518a82c35fe..4a5907816c65ec15b85e1fa5d22003ee8e2a3e97 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
>  obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
> +obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8746218914afbd814ca90639edd8e2cf47ff99f1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <linux/regulator/consumer.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +#define SLEEPM				BIT(0)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +#define POR				BIT(1)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define SIDDQ_SEL			BIT(1)
> +#define SIDDQ				BIT(2)
> +#define FSEL				GENMASK(6, 4)
> +#define FSEL_38_4_MHZ_VAL		(0x6)
> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +#define USB2_SUSPEND_N			BIT(2)
> +#define USB2_SUSPEND_N_SEL		BIT(3)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define UTMI_PHY_CMN_CTRL_OVERRIDE_EN	BIT(1)
> +
> +#define USB_PHY_CFG1			(0x154)
> +#define PLL_EN				BIT(0)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +#define FSEL_SEL			BIT(0)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define HSTX_PE				GENMASK(3, 2)
> +
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define HSTX_SWING			GENMASK(3, 0)
> +
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define HSTX_SLEW			GENMASK(2, 0)
> +
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +#define PLL_LOCK_TIME			GENMASK(1, 0)
> +
> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
> +{				\
> +	.off = o,		\
> +	.mask = b,		\
> +	.val = v,		\
> +}
> +
> +struct m31_phy_tbl_entry {
> +	u32 off;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct m31_eusb2_priv_data {
> +	const struct m31_phy_tbl_entry	*setup_seq;
> +	unsigned int			setup_seq_nregs;
> +	const struct m31_phy_tbl_entry	*override_seq;
> +	unsigned int			override_seq_nregs;
> +	const struct m31_phy_tbl_entry	*reset_seq;
> +	unsigned int			reset_seq_nregs;
> +	unsigned int			fsel;
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, PLL_EN, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, FSEL_SEL, 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, PLL_LOCK_TIME, 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, SLEEPM, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ_SEL, 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0),
> +};
> +
> +static const struct regulator_bulk_data m31_eusb_phy_vregs[] = {
> +	{ .supply = "vdd" },
> +	{ .supply = "vdda12" },
> +};
> +
> +#define M31_EUSB_NUM_VREGS		ARRAY_SIZE(m31_eusb_phy_vregs)
> +
> +struct m31eusb2_phy {
> +	struct phy			 *phy;
> +	void __iomem			 *base;
> +	const struct m31_eusb2_priv_data *data;
> +	enum phy_mode			 mode;
> +
> +	struct regulator_bulk_data	 *vregs;
> +	struct clk			 *clk;
> +	struct reset_control		 *reset;
> +
> +	struct phy			 *repeater;
> +};
> +
> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val) {
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +				       const struct m31_phy_tbl_entry *tbl,
> +				       int num)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +			tbl->off, tbl->mask, tbl->val);
> +
> +		ret = m31eusb2_phy_write_readback(phy->base,
> +						   tbl->off, tbl->mask,
> +						   tbl->val << __ffs(tbl->mask));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_set_mode(struct phy *uphy, enum phy_mode mode, int submode)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	phy->mode = mode;
> +
> +	return phy_set_mode_ext(phy->repeater, mode, submode);
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	ret = clk_prepare_enable(phy->clk);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}
> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	m31eusb2_phy_write_readback(phy->base,
> +				     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +				     FIELD_PREP(FSEL, data->fsel));
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_exit(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +
> +	clk_disable_unprepare(phy->clk);
> +	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
> +	phy_exit(phy->repeater);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init		= m31eusb2_phy_init,
> +	.exit		= m31eusb2_phy_exit,
> +	.set_mode	= m31eusb2_phy_set_mode,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	data = device_get_match_data(dev);
> +	if (IS_ERR(data))
> +		return -EINVAL;
> +	phy->data = data;
> +
> +	phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	phy->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(phy->reset))
> +		return PTR_ERR(phy->reset);
> +
> +	phy->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy->clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk),
> +				     "failed to get clk\n");
> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
> +					    m31_eusb_phy_vregs, &phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
> +
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_info(dev, "Registered M31 USB phy\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct m31_eusb2_priv_data m31_eusb_v1_data = {
> +	.setup_seq = m31_eusb2_setup_tbl,
> +	.setup_seq_nregs = ARRAY_SIZE(m31_eusb2_setup_tbl),
> +	.override_seq = m31_eusb_phy_override_tbl,
> +	.override_seq_nregs = ARRAY_SIZE(m31_eusb_phy_override_tbl),
> +	.reset_seq = m31_eusb_phy_reset_tbl,
> +	.reset_seq_nregs = ARRAY_SIZE(m31_eusb_phy_reset_tbl),
> +	.fsel = FSEL_38_4_MHZ_VAL,
> +};
> +
> +static const struct of_device_id m31eusb2_phy_id_table[] = {
> +	{ .compatible = "qcom,sm8750-m31-eusb2-phy", .data = &m31_eusb_v1_data },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, m31eusb2_phy_id_table);
> +
> +static struct platform_driver m31eusb2_phy_driver = {
> +	.probe = m31eusb2_phy_probe,
> +	.driver = {
> +		.name = "qcom-m31eusb2-phy",
> +		.of_match_table = m31eusb2_phy_id_table,
> +	},
> +};
> +
> +module_platform_driver(m31eusb2_phy_driver);
> +
> +MODULE_AUTHOR("Wesley Cheng <quic_wcheng@quicinc.com>");
> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.48.1
> 
> 
