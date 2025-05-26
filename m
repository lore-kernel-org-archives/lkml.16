Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B4213E61
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274718; cv=none; b=W7sLgoBQMUyx3om4Mkbq9djyIVo4MduzfpeCuNX+5hIOMEqI2oXZ2/spfywgfwPQOcZfKKp8FpDEHoSZse5c+uNMFAfvvH9kdWyoMwG7XIAyczPuW/1IX054N6kOHz2JShTJIDGlhIEZPXDmrF6jKsKC0YHXsPlZZiINgqAdpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274718; c=relaxed/simple;
	bh=oST7vwu2iWEVU9gbcP/xMOfJ8AUX2KtkwXYYYBLCPZY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U7CPxiU8bRk7NYy/FWSRg4HfSH8KqIujXCS28xWzgOnA2tQ1d8tQYiMIp+tcazxhi5wpexhFpl40CC+HFFdW2Qz1eXHW4B4FcRvQRayuhiyqg4hZuOnBwMJuZQjEzVfZyRCLFzTFnUYyaKYm8Sg8Si81G9PnS1K/ZNhEc5QD714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECHGrWDw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECHGrWDw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a35c894313so2387279f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748274715; x=1748879515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=ECHGrWDw5zrhrdGfjEJFkRO8gf2kACe0sJeI46JVq/wkxUeVBusNsBlV1c6KkvseyS
         EwpoU1hwtyN7scG6OMP84QLxhYqieAcmRXKPWrB5G7qddnboCGtEnata7oNCYf4Laizj
         z7imr7CPKawbtkYVxUztovPMoeS1xFFB6H79W+EiJRynCEYoyFVFZNWbrnZGjlfuwWh+
         gP7b2tzyRZwhP+rehgekPB3AmJUcOAMzs3WHm7d2am7bQztk9OZrESMxkzxwcvKf1ep6
         QcQNzZ9VM9A4S7N7QHrmdIy7DUClUpcb0llYeuBDoukpO6eacnAxILMYzzWamhR7oFPE
         4dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274715; x=1748879515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=jC0UHEsAgg8u+bhIpqvo21Fkd99SGm9Be/fGtaLMi35X2gqsP+3k6HR7rsksUygqOl
         fXopO+900mkBbDd+itd8fNmsIijhBwV7Wn1djXdZDluuXC56dnq4D8LXXE08Vno/IlX1
         FMRAeEw3gOgJzhInfURxiozg8fjJRQLbF0TeWhEyssh8Jw1tLooPtXqkqGwY8Hj5qzhl
         PViM2WCGr4phuRKs+KHh9qXK6k7w2ocPL7NPvHQO+KHsCzG/Te82ibiilJs4bOKxA3sz
         0TDdNOI6n0zlv7p5oY3neHv/72k2knNpPWooXjiw/I/GDEB4aO5tZtBZ6TnWqCpGJ7Dk
         m1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXHRjvuZ4WxcdlJ8rAKcNih1JxhUl316JIyE/1B8NKJcMFcNktp48cE3n5OTegbdn18eXWTrTj+tMKiKuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh7igXT3xdeCHhddom93SIosxR4uj4fgJuE5No97RMG+lA0DFs
	04bJ0A1gRHoctRqi1J65MkYiX4a96iJvXh8oA9EGheTIYbSGm4118nE81CWd7Pd/S0g=
X-Gm-Gg: ASbGncv5GklznxI5O3m9UkfUZHLh8BzK2bGcEmTmk/IBteO8rKCtMS3jkZV8qiBloky
	3i1xREsUy8U8RbrP9rXDC/ikXAutLo0o/OtWrbpbDFlrUxYdwkRmUovXqPp1WGJBiiEPJ8UxZMD
	W4dks2sdrzrmCMyDvMPUn1tsGK346ud2ZQ/XKVdXZ3+EXdUR3g2KAfiy4DGeCnLaz7/Ap5AVup3
	2RU6V9HunW5NrFzw3LnO52TKun+hSun13nsb0SzG1M+lrQp3VP4GYLou1/kltiHXeG33vdOYLjx
	JX0PGeX+yax9w4//dzWMj4UI0U6Bq6nyiX7XvnaQlxON0KDkPyOG8fhZBRqNgYV90LtRHsmPhw+
	+IU7VXPAUcpi8qfrbSYEISnx6LZ7Z
X-Google-Smtp-Source: AGHT+IH1epXCOIUG/iYdu3e9sbMDiReRn+5q8Cf6MYskS62ZGRXKqLb43uikJKqhdCgcIn6FoAJgfg==
X-Received: by 2002:adf:ee43:0:b0:3a4:cea0:7ec9 with SMTP id ffacd0b85a97d-3a4cea07f3bmr6470899f8f.54.1748274714508;
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d90912d4sm3325921f8f.47.2025.05.26.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Message-ID: <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Date: Mon, 26 May 2025 17:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
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
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/05/2025 16:31, Ze Huang wrote:
> The SpacemiT K1 SoC includes three USB ports:
> 
> - One USB2.0 OTG port
> - One USB2.0 host-only port
> - One USB3.0 port with an integrated USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
> compliant with the USB 2.0 specification and supports both 8-bit 60MHz
> and 16-bit 30MHz parallel interfaces.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/Kconfig                |   1 +
>   drivers/phy/Makefile               |   1 +
>   drivers/phy/spacemit/Kconfig       |  13 ++++
>   drivers/phy/spacemit/Makefile      |   2 +
>   drivers/phy/spacemit/phy-k1-usb2.c | 131 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 148 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
>   source "drivers/phy/rockchip/Kconfig"
>   source "drivers/phy/samsung/Kconfig"
>   source "drivers/phy/socionext/Kconfig"
> +source "drivers/phy/spacemit/Kconfig"
>   source "drivers/phy/st/Kconfig"
>   source "drivers/phy/starfive/Kconfig"
>   source "drivers/phy/sunplus/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
>   					   rockchip/	\
>   					   samsung/	\
>   					   socionext/	\
> +					   spacemit/	\
>   					   st/		\
>   					   starfive/	\
>   					   sunplus/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
> --- /dev/null
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for SpacemiT platforms
> +#
> +config PHY_SPACEMIT_K1_USB2
> +	tristate "SpacemiT K1 USB 2.0 PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	depends on USB_COMMON
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> +	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
> --- /dev/null
> +++ b/drivers/phy/spacemit/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3485064a77baac8bb857aff3da45838c0da28f03
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 USB 2.0 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/of.h>
> +
> +#define USB2_PHY_REG01			0x04
> +#define  USB2_PHY_REG01_VAL		0x60ef
> +#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
> +#define USB2_PHY_REG04			0x10
> +#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
> +#define USB2_PHY_REG0D			0x34
> +#define  USB2_PHY_REG0D_VAL		0x1c
> +#define USB2_PHY_REG26			0x98
> +#define  USB2_PHY_REG26_VAL		0xbec4
> +
> +#define USB2D_CTRL_RESET_TIME_MS	50
> +
> +struct spacemit_usb2phy {
> +	struct phy	*phy;
> +	struct clk	*clk;
> +	void __iomem	*base;
> +};
> +
> +static int spacemit_usb2phy_init(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +	void __iomem *base = sphy->base;
> +	u32 val;
> +	int ret;
> +
> +	ret = clk_prepare_enable(sphy->clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * make sure the usb controller is not under reset process before
> +	 * any configuration
> +	 */
> +	usleep_range(150, 200);
> +	writel(USB2_PHY_REG26_VAL, base + USB2_PHY_REG26); /* 24M ref clk */
> +
> +	ret = read_poll_timeout(readl, val, (val & USB2_PHY_REG01_PLL_IS_READY),
> +				500, USB2D_CTRL_RESET_TIME_MS * 1000, true,
> +				base + USB2_PHY_REG01);
> +	if (ret) {
> +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> +		return ret;
> +	}
> +
> +	/* release usb2 phy internal reset and enable clock gating */
> +	writel(USB2_PHY_REG01_VAL, base + USB2_PHY_REG01);
> +	writel(USB2_PHY_REG0D_VAL, base + USB2_PHY_REG0D);
> +
> +	/* auto clear host disc */
> +	val = readl(base + USB2_PHY_REG04);
> +	val |= USB2_PHY_REG04_AUTO_CLEAR_DIS;
> +	writel(val, base + USB2_PHY_REG04);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_exit(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(sphy->clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_usb2phy *sphy;
> +
> +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(sphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> +
> +	sphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sphy->base))
> +		return PTR_ERR(sphy->base);
> +
> +	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	if (IS_ERR(sphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
> +
> +	phy_set_drvdata(sphy->phy, sphy);
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> +	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ /* sentinal */ }

=> sentinel

> +};
> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> +
> +static struct platform_driver spacemit_usb2_phy_driver = {
> +	.probe	= spacemit_usb2phy_probe,
> +	.driver = {
> +		.name   = "spacemit-usb2-phy",
> +		.of_match_table = spacemit_usb2phy_dt_match,
> +	},
> +};
> +module_platform_driver(spacemit_usb2_phy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
> +MODULE_LICENSE("GPL");
> 

It looks fine, but why didn't also convert thid driver to regmap ?

Thanks,
Neil
