Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468E279793
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660230; cv=none; b=mu0DgHek1QxxTPeG+aneEHiEUpDsn9LHENyDZUDkaPWJ3U1DzXwYjgD+hIjXeqbrERPVtZ0wokyw6HMNF6yJM4XQueZ8LCuBcHMTJJCe+oPGc50YmX1Hc4cQV/cUdy2Y8dwbgw7ZhOoayPgKEBGxs/2yvdWNToIQmI5n/JIiQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660230; c=relaxed/simple;
	bh=/2NJISyLieCwnCluwJdgT8ZcCU4mhA9COM8V2qvsxuk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sBPRxSjvsFu4u8Y4sM75wQOVzfpnKkUFGPuaCVd4dC8CfCiwEvu17Zgrcn6ptzGD9ctf/DvwRpxdf6pk984zmkbZ5KfCgqag+BSt+REBzdQ9hVV8oOMnT+Isw8h82hCVqOzkBRyf0qLC00jUFT4DcaUPl0g6/3bXxYbDA7ViNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBqJINwg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBqJINwg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-445b11306abso8327485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747660227; x=1748265027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrx76GIvZE8ri6C0tOAMEiZDaDqYf1SxHKrPIjBXbeQ=;
        b=IBqJINwgR/jIr5csNDJt7L7FKLbb6HvR14pDWLgfQkL7yx/EkPLh0xBYBEYaRzLJJw
         Zhp6zt4M/3Xa6iAdCHWOdD1MUarH9ausMlgzvrKjgkGB9ejtFc5RuNgNMpMASdrJ+XRd
         m/8zsHYX0aJY3/tOOAAjlUwb2xNktsdBhk/O9xkZuqeU71lrHYDLPtfdmNDqVRUJxXoo
         kgdNgjZCORxSVn2aCXg2+rpaV/7H78ZQY+gJ2zZHH6uw48Ao5CHJ2m++bl3pICpFOBfJ
         WbqFiRMN7u2X7f+ipf3nn64aIQo7j0agNZiDQt48DP4kWpEPB6CANvEjuu55Bw9xYovU
         Qv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660227; x=1748265027;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lrx76GIvZE8ri6C0tOAMEiZDaDqYf1SxHKrPIjBXbeQ=;
        b=RHWbQoeFNubeWyeXVyH36Esa02epU5ptUH0HmxxpdLaxzkH6ndfuAAiQCVu8y0MSX9
         +idpf3za7hsctecgt0ietZ02HQyt6hyUfa5ULvrtbFBA+kKHlzgXEHwEL6QrPM05N0fS
         vMzI3+ezLyUwkO289nGmWhgovJqsGQKVz2HVW0rz3z21MIMQFZ7U6st7n8b/xkep2x/d
         aFdukwkQkOYWdI92ACcNQ/b4GzZRipQxusyi8P4IfM4s7y/CYI8ZZSIV8s7D0rd/K+iK
         /72AQnliKdQgekTpc/yHFwXZHBDB50LYpQWO6S/Wx88lVR/IHUlBrpnNk7ZyXIWq57tA
         nUIA==
X-Forwarded-Encrypted: i=1; AJvYcCX3is0M/uMewtczsTDs5jqgrcgZ3829Dr2sQjbGKCeiyyuKewypBEXMmcmdZb7Wyre0Tw+5p0uYtn0Zavc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyto3BLGwGw0z+xfhXWBn0ZN0kfm5J1DCN0pFAbwfBPp4sjbgD5
	kT6giuPMtjF69x93vRq7f/xDkI/lMsljC7RxRELWRS43obGH+d/7QZoIXSPnNnENvj8=
X-Gm-Gg: ASbGncvZNOyw4hWXalxsse4cIihtjcTHI/g4VG7URDUJTsURNc9GJ2P10lD0aZjAbBi
	t48FZ1ED3f/78l1Gwx74R4GBi1dslM808pmLXRVFiC24UWMhE7oK5WpNZovKoK2eEx30BG2OaW+
	cAHBD3kxHz+VLLEsLdIHeDnBl04umiXrmMVldye56Q6HS+XH7037hcANtmGCuUrXBzs8PF/Y8c7
	xP5mr9MX+gD0UofI0oYkqEqFtp6l+YxEHvDFQsZ/W3t2tTLjGp+ncwhWFQ1itR+SkxnnqTr+vSR
	zGlhmxVMH81xId/bxxKCfBr9VdCZSYHvXlQ0jj5UHePsCOS9tcTqJS2psmXpsMe1MpHZa4eVr2S
	F+h17GX2uw4ZuAof90QwS++yxEl79
X-Google-Smtp-Source: AGHT+IFbsWrhIbaZ+6OKxu+7ZbIkukpPt7vDSIyA38U3pF6buTdhKdPNA1FbP+nZKSJE6v24rUJEOw==
X-Received: by 2002:a05:600c:b94:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-442fefdab80mr123242555e9.3.1747660226852;
        Mon, 19 May 2025 06:10:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef87asm207185945e9.36.2025.05.19.06.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:10:26 -0700 (PDT)
Message-ID: <4110276c-8c64-4fd2-b166-c016509bc8a3@linaro.org>
Date: Mon, 19 May 2025 15:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
 <20250517-b4-k1-usb3-phy-v2-v3-4-e0655613a163@whut.edu.cn>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250517-b4-k1-usb3-phy-v2-v3-4-e0655613a163@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2025 16:25, Ze Huang wrote:
> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
> implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
> is supported; PCIe support is not included in this change.

Please add proper comments in the code expliciting PCIe PHY is not yet
implemented.

> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/spacemit/Kconfig          |   8 ++
>   drivers/phy/spacemit/Makefile         |   1 +
>   drivers/phy/spacemit/phy-k1-combphy.c | 248 ++++++++++++++++++++++++++++++++++
>   3 files changed, 257 insertions(+)
> 
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
> --- a/drivers/phy/spacemit/Kconfig
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
>   	help
>   	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
>   	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> +
> +config PHY_SPACEMIT_K1_COMBPHY
> +	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	help
> +	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
> --- a/drivers/phy/spacemit/Makefile
> +++ b/drivers/phy/spacemit/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
>   obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1f2ee3351e2bb5adf04e4e2fcfdb03cd75f70847
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> @@ -0,0 +1,248 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 PCIE/USB3 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/usb/of.h>
> +
> +#define COMBPHY_USB_REG1		0x68
> +#define  COMBPHY_USB_REG1_VAL		0x00
> +#define COMBPHY_USB_REG2		0x48
> +#define  COMBPHY_USB_REG2_VAL		0x603a2276
> +#define COMBPHY_USB_REG3		0x08
> +#define  COMBPHY_USB_REG3_VAL		0x97c
> +#define COMBPHY_USB_REG4		0x18
> +#define  COMBPHY_USB_REG4_VAL		0x00
> +#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
> +#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
> +#define COMBPHY_USB_PLL_REG		0x08
> +#define  COMBPHY_USB_PLL_MASK		0x01
> +#define  COMBPHY_USB_PLL_VAL		0x01
> +#define COMBPHY_USB_LFPS_REG		0x58
> +#define  COMBPHY_USB_LFPS_MASK		0x700
> +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
> +
> +#define COMBPHY_MODE_SEL	BIT(3)
> +#define COMBPHY_WAIT_TIMEOUT	1000
> +
> +struct spacemit_combphy_priv {
> +	struct device *dev;
> +	struct phy *phy;
> +	struct reset_control *phy_rst;
> +	void __iomem *phy_ctrl;
> +	void __iomem *phy_sel;
> +	bool rx_always_on;
> +	u8 lfps_threshold;
> +	u8 type;
> +};
> +
> +static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(reg + offset);
> +	tmp = (tmp & ~(mask)) | val;
> +	writel(tmp, reg + offset);
> +}

With regmap you could avoid this and directly use regmap_update_bits(), same for patch 3

> +
> +static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
> +				       u32 offset, u32 mask, u32 val)
> +{
> +	u32 reg_val;
> +
> +	return read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
> +				 1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
> +				 priv->phy_ctrl + offset);
> +}

It's used once, no need to add a separate function, and with regmap you could use regmap_read_poll_timeout()

> +
> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
> +{
> +	int ret = 0;
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
> +{
> +	void __iomem *base = priv->phy_ctrl;
> +	int ret;
> +
> +	writel(COMBPHY_USB_REG1_VAL, base + COMBPHY_USB_REG1);
> +	writel(COMBPHY_USB_REG2_VAL, base + COMBPHY_USB_REG2);
> +	writel(COMBPHY_USB_REG3_VAL, base + COMBPHY_USB_REG3);
> +	writel(COMBPHY_USB_REG4_VAL, base + COMBPHY_USB_REG4);
> +
> +	ret = spacemit_combphy_wait_ready(priv, COMBPHY_USB_PLL_REG,
> +					  COMBPHY_USB_PLL_MASK,
> +					  COMBPHY_USB_PLL_VAL);
> +
> +	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
> +	spacemit_reg_update(base, COMBPHY_USB_LFPS_REG,
> +			    COMBPHY_USB_LFPS_MASK,
> +			    (priv->lfps_threshold << 8));
> +
> +	if (priv->rx_always_on)
> +		spacemit_reg_update(base, COMBPHY_USB_REG4,
> +				    COMBPHY_USB_TERM_SHORT_MASK,
> +				    COMBPHY_USB_TERM_SHORT_VAL);
> +
> +	if (ret)
> +		dev_err(priv->dev, "USB3 PHY init timeout!\n");

You're leaving the PHY initialized, even on a timeout, is it expected ?

> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = spacemit_combphy_set_mode(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to set mode for PHY type %x\n",
> +			priv->type);
> +		goto out;
> +	}
> +
> +	ret = reset_control_deassert(priv->phy_rst);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to deassert rst\n");
> +		goto err_rst;
> +	}
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		ret = spacemit_combphy_init_usb(priv);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret)
> +		goto err_rst;
> +
> +	return 0;
> +
> +err_rst:
> +	reset_control_assert(priv->phy_rst);
> +out:
> +	return ret;
> +}
> +
> +static int spacemit_combphy_exit(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +
> +	reset_control_assert(priv->phy_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy *spacemit_combphy_xlate(struct device *dev,
> +					  const struct of_phandle_args *args)
> +{
> +	struct spacemit_combphy_priv *priv = dev_get_drvdata(dev);
> +
> +	if (args->args_count != 1) {
> +		dev_err(dev, "invalid number of arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (priv->type != PHY_NONE && priv->type != args->args[0])
> +		dev_warn(dev, "PHY type %d is selected to override %d\n",
> +			 args->args[0], priv->type);
> +
> +	priv->type = args->args[0];
> +
> +	if (args->args_count > 1)
> +		dev_dbg(dev, "combo phy idx: %d selected",  args->args[1]);
> +
> +	return priv->phy;
> +}
> +
> +static const struct phy_ops spacemit_combphy_ops = {
> +	.init = spacemit_combphy_init,
> +	.exit = spacemit_combphy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_combphy_probe(struct platform_device *pdev)
> +{
> +	struct spacemit_combphy_priv *priv;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->phy_ctrl = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(priv->phy_ctrl))
> +		return PTR_ERR(priv->phy_ctrl);
> +
> +	priv->phy_sel = devm_platform_ioremap_resource_byname(pdev, "sel");
> +	if (IS_ERR(priv->phy_sel))
> +		return PTR_ERR(priv->phy_sel);
> +
> +	priv->lfps_threshold = COMBPHY_USB_LFPS_THRES_DEFAULT;
> +	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->lfps_threshold);
> +
> +	priv->rx_always_on = device_property_read_bool(&pdev->dev, "spacemit,rx-always-on");
> +	priv->type = PHY_NONE;
> +	priv->dev = dev;
> +
> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy_rst),
> +				     "failed to get phy reset\n");
> +
> +	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create combphy\n");
> +
> +	dev_set_drvdata(dev, priv);
> +	phy_set_drvdata(priv->phy, priv);
> +	phy_provider = devm_of_phy_provider_register(dev, spacemit_combphy_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_combphy_of_match[] = {
> +	{ .compatible = "spacemit,k1-combphy", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
> +
> +static struct platform_driver spacemit_combphy_driver = {
> +	.probe	= spacemit_combphy_probe,
> +	.driver = {
> +		.name = "spacemit-k1-combphy",
> +		.of_match_table = spacemit_combphy_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_combphy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
> +MODULE_LICENSE("GPL");
> 

