Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97012FC0E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274324; cv=none; b=Blt8CFNNq6zVjz6fex98gh+4sT+J5Q+t3Alz5SwvVQX2ED+/ZomBc04J4r2kZBv+KzYHgnPrJ5Pu8FCyx95IPfhNEegc2GZeSkQAg0kPBOqimrIcfClbCnmalpVm+/B75TBVhEcZxcOL9/gf1tmBDH4Po7g5IRGA8naheteTbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274324; c=relaxed/simple;
	bh=pHZxi1qFsC3ahaSEj9awM8U0L/hZgBf4UIIWz+5OxVI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s8F1TliW29lXJCGSJDT0AyA53Z3EiaMq0oGZC4Yqz5ZtFiqSzKbBOjLsRpKeHv/4JyePFLxF4VOv/w/Cy3ycpaXZlz9exrdrrts3G31ZKG9iQ52RRObSgQCwFPPk4PUZ0DVYnaQ5M174fzMPoopnM511hD1IGr4DG2MfiA0x/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PswwxZYf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PswwxZYf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a37ed01aa0so2380586f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748274320; x=1748879120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFl8LQPP9raTyVXFbX2CX+NqGviWoNgmnKIkDgu9FgE=;
        b=PswwxZYflsdVCQBykSYvYpRo1TR823hy8UKTsM5fcd225Rn8cBVYAotRw3KcqRjLoZ
         y1D+wr2lQraCUeOJeKmDH3FMVkGaAuP3NKLF86GyczwB8623oWq0iSreWXHEZRw/K+74
         yWVxXOz+juEbQFQw7FzPCR4rZnXqtdca5m+QLbh9/YFEy0hJgKBrIlgTZOTofS3E7Tmn
         bRufY41KiY47V3l7xzMKDk26CAfyyQuInyi1Jh939JZkqB1mn6v0Xk6pis7qIu6tNP8z
         hW8Wn0jhLqNCdkv5yW4Gou2oObIYMZnAK2i5sXiF40G4IrShWlFdh2exD9LxAcOUcwIq
         r6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274320; x=1748879120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HFl8LQPP9raTyVXFbX2CX+NqGviWoNgmnKIkDgu9FgE=;
        b=gBToOz+M089CLQ1qTjumsTGLsa81iieNfIRhXs+9QYIHEH47m+XYwPCB5899567IUP
         s5oml/HyYEngiFnImIrZ+aA7NyFEEEqzg9529JWJ/kz4QBESryHoI0OR81ZmaHnRuvPJ
         LPrmmYvddiCRG3LNTYh4Jj/664SGKpuT8SKZCcduqCj5g9kX7mYmvUeybJdBOGRWYrAQ
         lD3oYrAq8utrDBn990upvG1pkqdTh5nU5WH394IDAfQQuNwqWugjcAPPkxNftQggvuF3
         DVKGvwC84HdfJNJ4MB0bJ6ynIcoSjV4gAjpueEvjvoMxwG9uDRphTdj14F5wXtOtutZp
         CjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSje14TRIvOxLOfd1zHxWY2eisUfhFoK2l6h0MjBeSNRSPoI7UTxnQ0ySZht7QgJwzXKkbxUUdYsWkYMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Jou+rHz13XfouDMe6EFY6PxXFEqKXWXpb7Aoe618wDdDYNem
	+U0pWMmyJB3wBncjLT4SjHk+jXBK5iD1C901kQR9DfNeQ1yXSG8q8Xo/i6PRZJPOtiI=
X-Gm-Gg: ASbGncs6c9VbYOJxaHKumGQHLKdttPiKzcLGl3N/La48gOSLl4oruYFZLXtWjUyNuvL
	YSorQwrp/5gUyGb1SST/aoMQFDgkdVzFIaCTgfnmftawfhSBiml2PZSRAsAb6HTmuzat6cZqssJ
	5DlEf6dzxfq9VUidEqaAlJnQ6DD9doiVlShypgzS/t0eLjyq3atld2jhBXhDbVxOrtthp5wJEFO
	UAxx6UfrHAmt08O8otBzaENUH5XkXyDRwMD1MhTJ9eot8GBHsd05od8+ee8wAlX1WkU71JXTuuS
	ehAR8+GESlH79YPp89x1NbrjsJXmUHgBpAVeCZy/q9RqdS7CWSHz05c2Pe+QmLbGo2FW5cuut6w
	mXO3r+O+jS9WtwVhx0pqvwdQWIZau
X-Google-Smtp-Source: AGHT+IFSTQVnwVX+3jfYQ26Uy7TnQL56FNeWCswfMjziUepzIMDH82s2FL1P/GELn1jnsZ6bldt9Xw==
X-Received: by 2002:a05:6000:2512:b0:3a3:6a2b:ab25 with SMTP id ffacd0b85a97d-3a4cb4834c2mr7896662f8f.45.1748274319727;
        Mon, 26 May 2025 08:45:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4db7e2e87sm2472008f8f.22.2025.05.26.08.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:45:19 -0700 (PDT)
Message-ID: <90976e7f-dad5-4b6d-b202-bdc3d7fc93e5@linaro.org>
Date: Mon, 26 May 2025 17:45:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-4-eca668fc16a2@whut.edu.cn>
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
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-4-eca668fc16a2@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 16:31, Ze Huang wrote:
> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
> implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
> is supported; PCIe support is not included in this change.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/spacemit/Kconfig          |   8 +
>   drivers/phy/spacemit/Makefile         |   1 +
>   drivers/phy/spacemit/phy-k1-combphy.c | 266 ++++++++++++++++++++++++++++++++++
>   3 files changed, 275 insertions(+)
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
> index 0000000000000000000000000000000000000000..227b1c743f4d981b3d4555c871ef397c1c8df0b5
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 PCIE/USB3 PHY driver
> + *
> + * This driver supports the combo PHY found on Spacemit K1 SoC, which integrates
> + * a dual-mode USB3/PCIe PHY shared between the USB3.0 DRD controller and PCIe
> + * PortA. But only one mode can work at any given application scenario.
> + *
> + * PCIe mode is not supported yet and any attempt to use the PHY in PCIe mode
> + * will result in an error.
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
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
> +#define COMBPHY_MODE_SEL_MASK	BIT(3)
> +#define COMBPHY_MODE_USB	BIT(3)
> +#define COMBPHY_WAIT_TIMEOUT	1000
> +
> +struct spacemit_combphy_priv {
> +	struct device *dev;
> +	struct phy *phy;
> +	struct reset_control *phy_rst;
> +	struct regmap *regmap_ctrl;
> +	struct regmap *regmap_sel;
> +	bool rx_always_on;
> +	u8 lfps_threshold;
> +	u8 type;
> +};
> +
> +static const struct regmap_config phy_ctrl_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x800,
> +};
> +
> +static const struct regmap_config phy_sel_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x400,
> +};
> +
> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
> +{
> +	struct regmap *map = priv->regmap_sel;
> +	int ret = 0;
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		regmap_update_bits(map, 0, COMBPHY_MODE_SEL_MASK, COMBPHY_MODE_USB);
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
> +	struct regmap *map = priv->regmap_ctrl;
> +	u32 reg_val;
> +	int ret;
> +
> +	regmap_write(map, COMBPHY_USB_REG1, COMBPHY_USB_REG1_VAL);
> +	regmap_write(map, COMBPHY_USB_REG2, COMBPHY_USB_REG2_VAL);
> +	regmap_write(map, COMBPHY_USB_REG3, COMBPHY_USB_REG3_VAL);
> +	regmap_write(map, COMBPHY_USB_REG4, COMBPHY_USB_REG4_VAL);
> +
> +	ret = regmap_read_poll_timeout(map, COMBPHY_USB_PLL_REG, reg_val,
> +				       (reg_val & COMBPHY_USB_PLL_MASK) == COMBPHY_USB_PLL_VAL,
> +				       1000, COMBPHY_WAIT_TIMEOUT * 1000);
> +	if (ret) {
> +		dev_err(priv->dev, "USB3 PHY init timeout!\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
> +	regmap_update_bits(map, COMBPHY_USB_LFPS_REG,
> +			   COMBPHY_USB_LFPS_MASK,
> +			   priv->lfps_threshold << 8);
> +
> +	if (priv->rx_always_on)
> +		regmap_update_bits(map, COMBPHY_USB_REG4,
> +				   COMBPHY_USB_TERM_SHORT_MASK,
> +				   COMBPHY_USB_TERM_SHORT_VAL);
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
> +	void __iomem *ctrl_base, *sel_base;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(ctrl_base))
> +		return PTR_ERR(ctrl_base);
> +
> +	priv->regmap_ctrl = devm_regmap_init_mmio(dev, ctrl_base, &phy_ctrl_regmap_config);
> +	if (IS_ERR(priv->regmap_ctrl))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap_ctrl),
> +				     "Failed to init regmap for ctrl\n");
> +
> +	sel_base = devm_platform_ioremap_resource_byname(pdev, "sel");
> +	if (IS_ERR(sel_base))
> +		return PTR_ERR(sel_base);
> +
> +	priv->regmap_sel = devm_regmap_init_mmio(dev, sel_base, &phy_sel_regmap_config);
> +	if (IS_ERR(priv->regmap_sel))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap_sel),
> +				     "Failed to init regmap for sel\n");
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

Looks all good now

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
