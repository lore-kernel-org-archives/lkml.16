Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2919E967;
	Sat, 12 Apr 2025 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744488661; cv=none; b=rcXU45pe8jtB71zhQ0Eo+O8MIbuHM8VNZnXn2XVfVM36FTqO9VCGNBgx9bioTCMCIE8TciLv9gHL/TYhUM9IjREETX5yyI90cFWF2Hxoo9Odre41GO1g0OXmtPGFoh9/OV9FWtJ3oKTzRABOTpLV9eksPLO/bfeaMM3cJDgWp/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744488661; c=relaxed/simple;
	bh=l5Fy6tU6PSmhyfDLzSGCigAdHwxfrS/BeH+1H6ue/Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDFjCNtgBJgr3Bmw0TK3rEoYEH/+Rn24lB/vvn7zI/S3P/df0u2InJ8yX+xRy7ny55C1xG4hhoZ1o+QA+p1qjAhfy2CVNTDp11Y+GldjYXr1J1VuSjR0SPkXYkMbxTNUKirDy52sSlOCBWxA8Ff20mDHqHxFIvinrGNmVYiTe5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XL7p0Rfb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL7p0Rfb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22438c356c8so34534555ad.1;
        Sat, 12 Apr 2025 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744488658; x=1745093458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z+eAFwi2vZK0qgZzBwZHRmVurJKYZcMJr0XaaJqsM9c=;
        b=XL7p0RfbMg5bufwGOxlH1k86poUhpHixljuXURtpMwUXYeXPihFFZ68/aghIJJskV6
         LeDLfhk0sCvgz4s+wkalhRiGY/nukF/MvDeEq5zGApzigllB/Xx9fbeL+8h+8DTyLBLH
         gSUCe4IBRPgft6WXTqsegur6LXuPSJ0Dfwn14O4lxgUr6W5jEj+DEMJL925GI0HVifbe
         ZWDCxVVhRGgC6un84F91HT6Wlpxt0sgQIaoN1vKGMEd83ibvNuLC7Xi1ycxKQIyLq1N3
         PNCxgRJ55gitCySzKt/fPtVVjCyVC6Ex64u5rndyuijA1lHqKRhM9NF+KbI+GEEeYeH8
         GAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744488658; x=1745093458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+eAFwi2vZK0qgZzBwZHRmVurJKYZcMJr0XaaJqsM9c=;
        b=oCoEkE+D7GhL0M553bOXcuWeBDtiB5hXOxVgzL0sn1QP7zRP0iUfiq43qEc0PZubMB
         HVz8OchfllKdJgLJxexonKxmZoey3srRr4BLkDga1bC1q9PxHom7y4oKM2936fQWTnm5
         J629zPrI5dIA0tSbOyBT8ex6oKNBQ5j10DLO3c8MGyrMENRGgYOiMGN4X6mnuijCDiXl
         i3X7w7S9PWFKwRN7dThf5IpnMU0EhGAcP3R3KEHctjcqzDDvb4qjZ45giPprBO6ZHrZj
         ntValeSAjFecYy4979+/QNzaDg/vED2sclRjdv82NQa5199rf+ntinPNGxY+XYfT/v0G
         /xxg==
X-Forwarded-Encrypted: i=1; AJvYcCVFqHT0GliQlh+npD5UHaYxlLN2xHc7hlikjROZJJyssFzVkcCLQgi7YOnzglUjhA8FukuoBohCSWQ=@vger.kernel.org, AJvYcCWtykbpwxnq0cLv8JNGOi0W6aRP2ekOIC7tiRcEt9rSawKqoSGxlb2/Q7mKI1OTvTKr+D+Ps/15zj/DDef7@vger.kernel.org
X-Gm-Message-State: AOJu0YydkbXrvDrsSjhZjNNQQ34nbXjF00y0BnOrdE4aOc6STmIEGVTv
	xVIqdPnBUEieaRG/HEpEgc7+CJPKAbhM8p5qcaoPHc+GeUVhAuoi
X-Gm-Gg: ASbGncuTObslXWBicHUlU/yn15zY7+cfMmMI2/DwA1QXdNxjsRX7a/muJ2mPAHtGCJ5
	lD+bYMzHxWWHzMvGruIPoV0Jgn5yJprrb9ey1fbyRS9uFlqgPvyo3f9Qh2DuImZHfL9KNfLj7t2
	BG3I/S/8BsXWQkcim3NBR6vPwA0WU0qv13OVdFNgDxoYBokQ4CDF1RazcamWiNdDkkpkxinDGrC
	HAvUSJ+vzOMRDdzLuapfEYOFVng4YtbeM85xvsmM8sUtvw4PNvQio2zAGarAu4W9N5U8IN4n/2o
	sVQ6k7xpKKVH+9+LQrOD8CvDg1POOzT7EHfCqbnL7NaBSFIIx6TTu7ST9p7zaxv9RdfzFpgDcU8
	TZdBiRzmoTatSJA==
X-Google-Smtp-Source: AGHT+IH1s0V6BBypzQ48OBnG+NkbOXWoZQTOWE625OghsIC/hrx1+V85bEa3KfxHiNGlUSnyPt9Q3g==
X-Received: by 2002:a17:902:f705:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-22bea4c6e17mr133611795ad.24.1744488657913;
        Sat, 12 Apr 2025 13:10:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c993b2sm71323845ad.135.2025.04.12.13.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 13:10:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4405fd59-0cf9-4fc0-92d3-6a639d50c7e6@roeck-us.net>
Date: Sat, 12 Apr 2025 13:10:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hwmon: (max77705) add initial support
To: Dzmitry Sankouski <dsankouski@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250412-initial-support-for-max77705-sensors-v4-1-2e4cf268a3d0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 00:20, Dzmitry Sankouski wrote:
> Add support for max77705 hwmon. Includes charger input, system bus, and
> vbyp measurements.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Maxim MAX77705 is a Companion Power Management and Type-C interface IC.
> It includes charger and fuel gauge blocks, and is capable of measuring
> charger input current, system bus volatage and current, and bypass
> voltage.
> 
> Add support for mentioned measurements.
> ---
> Changes in v4:
> - Fix review comments.
> - Link to v3: https://lore.kernel.org/r/20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com
> 
> Changes in v3:
> - Fix review comments.
> - Fix v2 changed message.
> - Link to v2: https://lore.kernel.org/r/20250304-initial-support-for-max77705-sensors-v2-1-58d2207c732b@gmail.com
> 
> Changes in v2:
> - Fix review comments.
> - Link to v1: https://lore.kernel.org/r/20250225-initial-support-for-max77705-sensors-v1-1-2be6467628b0@gmail.com
> ---
> Changes in v4:
> - documentation: "===" line is as long as the text
> - simplify the dependency to depends on MFD_MAX77705
> - cleanup headers
> - sign_extend current measurements - add 'is_signed' parameter to
>    max77705_read_and_convert function
> - replace ARRAY_SIZE(voltage_channel_desc) to 2
> - remove last blank line
> 
> Changes in v3:
> - change resolution type to u32
> - pass regmap from parent
> - rebase on latest linux-next, containg max77705 driver
> 
> Changes in v2:
> - sort headers alphabetically
> - swap curr channel info, to align indeces with channel_desc struct
> - reword coverletter
> - fix checkpatch --strict warnings
> - remove struct max77705_hwmon, use regmap directly
> - move register validation logic to is_visible function
> - move common register reading and converting logic to separate function
> - remove unnessesary {} in if statement
> - s/i2c->dev/pdev->dev in dev_err_probe
> ---
>   Documentation/hwmon/index.rst    |   1 +
>   Documentation/hwmon/max77705.rst |  39 ++++++++++++++++++++++++++++++++
>   MAINTAINERS                      |   7 ++++++
>   drivers/hwmon/Kconfig            |   9 ++++++++
>   drivers/hwmon/Makefile           |   1 +
>   drivers/hwmon/max77705-hwmon.c   | 242 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   6 files changed, 299 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f0ddf6222c44..764c1c91ed70 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -161,6 +161,7 @@ Hardware Monitoring Kernel Drivers
>      max6639
>      max6650
>      max6697
> +   max77705
>      max8688
>      mc13783-adc
>      mc34vr500
> diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
> new file mode 100644
> index 000000000000..4a7680a340e1
> --- /dev/null
> +++ b/Documentation/hwmon/max77705.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver max77705
> +======================
> +
> +Supported chips:
> +
> +  * Maxim Integrated MAX77705
> +
> +    Prefix: 'max77705'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: Not available
> +
> +Authors:
> +      - Dzmitry Sankouski <dsankouski@gmail.com>
> +
> +Description
> +-----------
> +
> +The MAX77705 PMIC provides current and voltage measurements besides fuelgauge:
> +- chip input current
> +- system bus current and voltage
> +- VBYP voltage
> +
> +Sysfs Attributes
> +----------------
> +
> +================= ========================================
> +in1_label         "vbyp"
> +in1_input         Measured chip vbyp voltage
> +in2_label         "vsys"
> +in2_input         Measured chip system bus voltage
> +curr1_label       "iin"
> +curr1_input       Measured chip input current.
> +curr2_label       "isys"
> +curr2_input       Measured chip system bus current.
> +================= ========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 78467ad7a8fe..2e1e5233a011 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18369,6 +18369,13 @@ S:	Maintained
>   F:	Documentation/hwmon/pc87427.rst
>   F:	drivers/hwmon/pc87427.c
>   
> +MAX77705 HARDWARE MONITORING DRIVER
> +M:	Dzmitry Sankouski <dsankouski@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/max77705.rst
> +F:	drivers/hwmon/max77705-hwmon.c
> +
>   PCA9532 LED DRIVER
>   M:	Riku Voipio <riku.voipio@iki.fi>
>   S:	Maintained
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index f91f713b0105..7109f252dab4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1308,6 +1308,15 @@ config SENSORS_MAX31790
>   	  This driver can also be built as a module. If so, the module
>   	  will be called max31790.
>   
> +config SENSORS_MAX77705
> +	tristate "MAX77705 current and voltage sensor"
> +	depends on MFD_MAX77705
> +	help
> +	  If you say yes here you get support for MAX77705 sensors connected with I2C.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max77705-hwmon.
> +
>   config SENSORS_MC34VR500
>   	tristate "NXP MC34VR500 hardware monitoring driver"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 766c652ef22b..22ceebf10299 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -161,6 +161,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
>   obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
>   obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
>   obj-$(CONFIG_MAX31827) += max31827.o
> +obj-$(CONFIG_SENSORS_MAX77705) += max77705-hwmon.o
>   obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>   obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>   obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> diff --git a/drivers/hwmon/max77705-hwmon.c b/drivers/hwmon/max77705-hwmon.c
> new file mode 100644
> index 000000000000..be0a4bd31d33
> --- /dev/null
> +++ b/drivers/hwmon/max77705-hwmon.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MAX77705 voltage and current hwmon driver.
> + *
> + *  Copyright (C) 2025 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/max77705-private.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct channel_desc {
> +	u8 reg;
> +	u8 avg_reg;
> +	const char *const label;
> +	// register resolution. nano Volts for voltage, nano Amperes for current
> +	u32 resolution;
> +};
> +
> +static const struct channel_desc current_channel_desc[] = {
> +	{
> +		.reg = IIN_REG,
> +		.label = "IIN_REG",
> +		.resolution = 125000
> +	},
> +	{
> +		.reg = ISYS_REG,
> +		.avg_reg = AVGISYS_REG,
> +		.label = "ISYS_REG",
> +		.resolution = 312500
> +	}
> +};
> +
> +static const struct channel_desc voltage_channel_desc[] = {
> +	{
> +		.reg = VBYP_REG,
> +		.label = "VBYP_REG",
> +		.resolution = 427246
> +	},
> +	{
> +		.reg = VSYS_REG,
> +		.label = "VSYS_REG",
> +		.resolution = 156250
> +	}
> +};
> +
> +static const struct regmap_range max77705_hwmon_readable_ranges[] = {
> +	regmap_reg_range(AVGISYS_REG,	AVGISYS_REG + 1),
> +	regmap_reg_range(IIN_REG,	IIN_REG + 1),
> +	regmap_reg_range(ISYS_REG,	ISYS_REG + 1),
> +	regmap_reg_range(VBYP_REG,	VBYP_REG + 1),
> +	regmap_reg_range(VSYS_REG,	VSYS_REG + 1),
> +};
> +
> +static const struct regmap_access_table max77705_hwmon_readable_table = {
> +	.yes_ranges = max77705_hwmon_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max77705_hwmon_readable_ranges),
> +};
> +
> +static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res,
> +				     u8 is_signed, long *val)

is_signed could (and should) be bool.

> +{
> +	int ret;
> +	u32 regval;
> +
> +	ret = regmap_read(regmap, reg, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (is_signed)
> +		*val = mult_frac((long)sign_extend32(regval, 15), res, 1000000);
> +	else
> +		*val = mult_frac((long)regval, res, 1000000);
> +
> +	return 0;
> +}
> +
> +static umode_t max77705_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		if (channel >= 2)
> +			return 0;
> +

This and the same check is just as unnecessary as earlier.

> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_curr:
> +		if (channel >= 2)
> +			return 0;
> +
Same here.

> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		case hwmon_curr_average:
> +			if (current_channel_desc[channel].avg_reg)
> +				return 0444;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int max77705_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +				int channel, const char **buf)
> +{
> +	switch (type) {
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*buf = current_channel_desc[channel].label;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*buf = voltage_channel_desc[channel].label;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int max77705_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct regmap *regmap = dev_get_drvdata(dev);
> +	u8 reg, is_signed;
> +	u32 res;
> +
> +	switch (type) {
> +	case hwmon_curr:
> +		is_signed = 1;
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			reg = current_channel_desc[channel].reg;
> +			res = current_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, is_signed, val);

I fail to understand the need for the is_signed variable. Why not just pass a bool "true" ?


> +		case hwmon_curr_average:
> +			reg = current_channel_desc[channel].avg_reg;
> +			res = current_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, is_signed, val);

same here.

> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +	case hwmon_in:
> +		is_signed = 0;
> +		switch (attr) {
> +		case hwmon_in_input:
> +			reg = voltage_channel_desc[channel].reg;
> +			res = voltage_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, is_signed, val);

... and "false" here.

> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops max77705_hwmon_ops = {
> +	.is_visible = max77705_is_visible,
> +	.read = max77705_read,
> +	.read_string = max77705_read_string,
> +};
> +
> +static const struct hwmon_channel_info *max77705_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL
> +			),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_AVERAGE | HWMON_C_LABEL
> +			),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info max77705_chip_info = {
> +	.ops = &max77705_hwmon_ops,
> +	.info = max77705_info,
> +};
> +
> +static int max77705_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct regmap *regmap;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "max77705", regmap,
> +							 &max77705_chip_info, NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(hwmon_dev),
> +				"Unable to register hwmon device\n");
> +
> +	return 0;
> +};
> +
> +static struct platform_driver max77705_hwmon_driver = {
> +	.driver = {
> +		.name = "max77705-hwmon",
> +	},
> +	.probe = max77705_hwmon_probe,
> +};
> +
> +module_platform_driver(max77705_hwmon_driver);
> +
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_DESCRIPTION("MAX77705 monitor driver");
> +MODULE_LICENSE("GPL");
> 
> ---
> base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
> change-id: 20250123-initial-support-for-max77705-sensors-ad0170ac1ec5
> 
> Best regards,

