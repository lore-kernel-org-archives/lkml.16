Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5271BD9D2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266574; cv=none; b=E7sjuycfazsulzoUVIsAYRe5vp1r8MJFF+Jm2tkSCzRZN4MoKXZSwJFPL66r80osRWQHo2X4iGID7GY8CF8KTCiEBiCwDmDcJIIDse2OPJWa1hbsfOdptHYxugAZeFiSVDubfRfr6aRbu8B70Fvf9AhvraPGfvKXMZrE30mvuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266574; c=relaxed/simple;
	bh=00PESQw9HLmZK0BoqVkZxzfYXbSFwI+Tk5xVcu5ur3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ls+JyGgmxtY93XaiUPGpWRDZ+imIS6Epmgk/Of2rpdHOtatINUylBVuvYOZETnwvdeQxNb1dUcjdwLTgVG38PfhJAgw0EYz64teUqPxCrLBwIyYVa1AowY68TTTF8W/eXB0nwhcC0hP3FdF6cDg7Qle8g9+0jdX2BNuAWuZeh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jIq5W/ad; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jIq5W/ad"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso2470375f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266571; x=1739871371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRIL/yzBaSepZA/UwYNIC/ghy8IP0My0Od5m5XYXB48=;
        b=jIq5W/adruEDtXgKNsBI+Hj75MGYOneKzt19jiLBZaA4aY44KkPoP5S6kB1yd/JuOT
         K4HPnEX8EQJYJqMwY9VbMrb6Lujjtpzqs6Shp/mKWLTb9I4lYKa5XyQKsmBTvxR8eF4S
         tme4xCBwMSeBWbPhLJhdJHwBOOnepX5KC9QmFIThw1brsrKsSz/ltOi6PQfLZQKMMWdF
         0U+ZOoYaw8XLAw+c0lVs1zk5O6gwwgt1ryhZT9VwqWkPbxajUYdSGSmGcNRoUGe81w0p
         dFCrXf8brGApPKucPIRkqFyxBfpiJ87hudyIWO6F2DOcnSL+FRhinXLJZ7D4vHtZab+Z
         AfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266571; x=1739871371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRIL/yzBaSepZA/UwYNIC/ghy8IP0My0Od5m5XYXB48=;
        b=aA6GV2x6n+iIeXEb+B5Gd7bJIVOCVMPpmErETczLdYqzRk2k4kWi7juZXaY5C4We3u
         3Puwart/Qx3Vv/jqQorlSdy5lPppalX6BnD6k5u4zwJV6uJE/vO6YdrHKO1NhhUbrcMN
         vtDxbZW8lqNC24y3eksWP0v+oQtQfJohH83Zd7dBkFLJ+aA7agakpXoBOz58VAE6/Iue
         qHlFCWxGQ1P8MYBsGq3iRd+TPkA+ebFCpV//bnSQDGSWAtcczeiReCgy4PhZjWOxLk90
         FMGMgEfY6Dy3zQpIrsJ6pAG8DhFPh8PosQGGzTllHvR+ipWdBuk8D4zsNAn4pWsSS8UL
         Q0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXcYGNAq7elzBbTmZp0ahW1vs2+QRH+4OUO2sO/R4Mq6YKeLT4AlqCIaDMOBWK/1VZG75UO2pI6CVIoia8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgE8B9JJVU9N7XbTzLbwTk2iMrp007b1ypI/Js2LNfwb7+FCrW
	VyZ3pwAVf0xK0Di5jqc/yf9ml4lR8Ex2S5zFVmWwhlMpTJmcwwNkR6aiCgiXzOY=
X-Gm-Gg: ASbGncuaXXB6yii1JeSw6KZkNnT1vsL0AIET/4FwvNOOafBE+tgBr9EnW5qaboRJ7gW
	Gyqcgueglt1e2F/1tr46XLIdUHNnZPKFc6x3ay4eSeWKaiiOCucs2AGbBxS5IbuY6Qso2Nz8iXe
	oD5/khnVKOu8OJjw0FxrlwbTNsrEviKINUboeTPV3cK22ODTMauV+tlHqcUj/myNmBqWCNQS38+
	PXP1FgRBtgBeE9XLa+RUrjjRSjHWXVpm+nunC3Np/A8hNDOVbdC1CAVFeNSvwy+Vk/uKEwuqyjz
	3zuuxmNkgc5VWn1CpfkvdnZOqahGpczEJb1tG98+R5pQfrItG73S4es=
X-Google-Smtp-Source: AGHT+IFMZ1pKShIvwsLqT2YFSCvSRKsdHNHy86URkgTJ51eGtiPfoPHKZ+vrVH5UXF4X2AkG0HdYOQ==
X-Received: by 2002:a5d:47c2:0:b0:386:374b:e8bc with SMTP id ffacd0b85a97d-38de43a5bf1mr2011347f8f.15.1739266571151;
        Tue, 11 Feb 2025 01:36:11 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc98844f6sm11773513f8f.42.2025.02.11.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:36:10 -0800 (PST)
Message-ID: <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org>
Date: Tue, 11 Feb 2025 10:36:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal
 driver
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
 Shaohan Yao <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241224094015.3816301-2-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/12/2024 10:40, Kever Yang wrote:
> From: Shaohan Yao <shaohan.yao@rock-chips.com>
> 
> There are one Temperature Sensor on rk3562, channel 0 is for chip.

A bit stingy in terms of description, no ?


> Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>   drivers/thermal/rockchip_thermal.c | 112 ++++++++++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index f551df48eef9..aec0e634bd1f 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2014-2016, Fuzhou Rockchip Electronics Co., Ltd
> + * Copyright (c) 2014-2021, Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2021-2024, Rockchip Electronics Co., Ltd.
>    * Caesar Wang <wxt@rock-chips.com>
>    */
>   
> @@ -185,6 +186,8 @@ struct rockchip_thermal_data {
>   #define TSADCV2_AUTO_PERIOD_HT			0x6c
>   #define TSADCV3_AUTO_PERIOD			0x154
>   #define TSADCV3_AUTO_PERIOD_HT			0x158
> +#define TSADCV9_Q_MAX				0x210
> +#define TSADCV9_FLOW_CON			0x218
>   
>   #define TSADCV2_AUTO_EN				BIT(0)
>   #define TSADCV2_AUTO_EN_MASK			BIT(16)
> @@ -195,6 +198,7 @@ struct rockchip_thermal_data {
>   #define TSADCV2_AUTO_TSHUT_POLARITY_MASK	BIT(24)
>   
>   #define TSADCV3_AUTO_Q_SEL_EN			BIT(1)
> +#define TSADCV3_AUTO_Q_SEL_EN_MASK		BIT(17)
>   
>   #define TSADCV2_INT_SRC_EN(chn)			BIT(chn)
>   #define TSADCV2_INT_SRC_EN_MASK(chn)		BIT(16 + (chn))
> @@ -220,6 +224,12 @@ struct rockchip_thermal_data {
>   #define TSADCV5_AUTO_PERIOD_HT_TIME		1622 /* 2.5ms */
>   #define TSADCV6_AUTO_PERIOD_TIME		5000 /* 2.5ms */
>   #define TSADCV6_AUTO_PERIOD_HT_TIME		5000 /* 2.5ms */
> +#define TSADCV7_AUTO_PERIOD_TIME		3000 /* 2.5ms */
> +#define TSADCV7_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
> +#define TSADCV12_AUTO_PERIOD_TIME		3000 /* 2.5ms */
> +#define TSADCV12_AUTO_PERIOD_HT_TIME		3000 /* 2.5ms */
> +#define TSADCV3_Q_MAX_VAL			0x7ff /* 11bit 2047 */
> +#define TSADCV12_Q_MAX_VAL			0xfff /* 12bit 4095 */
>   
>   #define TSADCV2_USER_INTER_PD_SOC		0x340 /* 13 clocks */
>   #define TSADCV5_USER_INTER_PD_SOC		0xfc0 /* 97us, at least 90us */
> @@ -230,6 +240,8 @@ struct rockchip_thermal_data {
>   
>   #define PX30_GRF_SOC_CON2			0x0408
>   
> +#define RK3562_GRF_TSADC_CON			0x0580
> +
>   #define RK3568_GRF_TSADC_CON			0x0600
>   #define RK3568_GRF_TSADC_ANA_REG0		(0x10001 << 0)
>   #define RK3568_GRF_TSADC_ANA_REG1		(0x10001 << 1)
> @@ -497,6 +509,45 @@ static const struct tsadc_table rk3399_code_table[] = {
>   	{TSADCV3_DATA_MASK, 125000},
>   };
>   
> +static const struct tsadc_table rk3562_code_table[] = {
> +	{0, -40000},
> +	{1419, -40000},
> +	{1428, -35000},
> +	{1436, -30000},
> +	{1445, -25000},
> +	{1453, -20000},
> +	{1462, -15000},
> +	{1470, -10000},
> +	{1479, -5000},
> +	{1487, 0},
> +	{1496, 5000},
> +	{1504, 10000},
> +	{1512, 15000},
> +	{1521, 20000},
> +	{1529, 25000},
> +	{1538, 30000},
> +	{1546, 35000},
> +	{1555, 40000},
> +	{1563, 45000},
> +	{1572, 50000},
> +	{1580, 55000},
> +	{1589, 60000},
> +	{1598, 65000},
> +	{1606, 70000},
> +	{1615, 75000},
> +	{1623, 80000},
> +	{1632, 85000},
> +	{1640, 90000},
> +	{1648, 95000},
> +	{1657, 100000},
> +	{1666, 105000},
> +	{1674, 110000},
> +	{1682, 115000},
> +	{1691, 120000},
> +	{1699, 125000},
> +	{TSADCV2_DATA_MASK, 125000},
> +};

May be it is time to optimize all these tables out of the memory driver?

It is the 9th table introduced.

>   static const struct tsadc_table rk3568_code_table[] = {
>   	{0, -40000},
>   	{1584, -40000},
> @@ -834,6 +885,37 @@ static void rk_tsadcv8_initialize(struct regmap *grf, void __iomem *regs,
>   			       regs + TSADCV2_AUTO_CON);
>   }
>   
> +static void rk_tsadcv12_initialize(struct regmap *grf, void __iomem *regs,
> +				   enum tshut_polarity tshut_polarity)
> +{
> +	writel_relaxed(TSADCV12_AUTO_PERIOD_TIME, regs + TSADCV3_AUTO_PERIOD);
> +	writel_relaxed(TSADCV12_AUTO_PERIOD_HT_TIME,
> +		       regs + TSADCV3_AUTO_PERIOD_HT);
> +	writel_relaxed(TSADCV2_HIGHT_INT_DEBOUNCE_COUNT,
> +		       regs + TSADCV3_HIGHT_INT_DEBOUNCE);
> +	writel_relaxed(TSADCV2_HIGHT_TSHUT_DEBOUNCE_COUNT,
> +		       regs + TSADCV3_HIGHT_TSHUT_DEBOUNCE);
> +	writel_relaxed(TSADCV12_Q_MAX_VAL, regs + TSADCV9_Q_MAX);
> +	writel_relaxed(TSADCV3_AUTO_Q_SEL_EN | TSADCV3_AUTO_Q_SEL_EN_MASK,
> +		       regs + TSADCV2_AUTO_CON);
> +	if (tshut_polarity == TSHUT_HIGH_ACTIVE)
> +		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_HIGH |
> +			       TSADCV2_AUTO_TSHUT_POLARITY_MASK,
> +			       regs + TSADCV2_AUTO_CON);
> +	else
> +		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_MASK,
> +			       regs + TSADCV2_AUTO_CON);
> +
> +	if (!IS_ERR(grf)) {
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_TSEN);
> +		udelay(15);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG0);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG1);
> +		regmap_write(grf, RK3562_GRF_TSADC_CON, RK3568_GRF_TSADC_ANA_REG2);
> +		usleep_range(100, 200);
> +	}
> +}
> +
>   static void rk_tsadcv2_irq_ack(void __iomem *regs)
>   {
>   	u32 val;
> @@ -1258,6 +1340,30 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
>   	},
>   };
>   
> +static const struct rockchip_tsadc_chip rk3562_tsadc_data = {
> +	.chn_offset = 0,
> +	.chn_num = 1, /* one channels for tsadc */
> +
> +	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
> +	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> +	.tshut_temp = 95000,
> +
> +	.initialize = rk_tsadcv12_initialize,
> +	.irq_ack = rk_tsadcv4_irq_ack,
> +	.control = rk_tsadcv4_control,
> +	.get_temp = rk_tsadcv4_get_temp,
> +	.set_alarm_temp = rk_tsadcv3_alarm_temp,
> +	.set_tshut_temp = rk_tsadcv3_tshut_temp,
> +	.set_tshut_mode = rk_tsadcv3_tshut_mode,
> +
> +	.table = {
> +		.id = rk3562_code_table,
> +		.length = ARRAY_SIZE(rk3562_code_table),
> +		.data_mask = TSADCV2_DATA_MASK,
> +		.mode = ADC_INCREMENT,
> +	},
> +};
> +
>   static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
>   	/* cpu, gpu */
>   	.chn_offset = 0,
> @@ -1337,6 +1443,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
>   		.compatible = "rockchip,rk3399-tsadc",
>   		.data = (void *)&rk3399_tsadc_data,
>   	},
> +	{
> +		.compatible = "rockchip,rk3562-tsadc",
> +		.data = (void *)&rk3562_tsadc_data,
> +	},
>   	{
>   		.compatible = "rockchip,rk3568-tsadc",
>   		.data = (void *)&rk3568_tsadc_data,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
