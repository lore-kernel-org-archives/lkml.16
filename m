Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA914885D;
	Sun,  6 Apr 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743959074; cv=none; b=A6megeFRf6Wp+1bD2lWWtxRXKGmSxoL+6i53NbUzOnBRBGdfeEUHCz5TT9Un69/O87v4QMU+9IG5A8DHL0xS3PxIIsVpUm8oiXi8qDI3oR9GsaGP8sl4dWVsh0j5XpvqYI0jS9LY3t+Y8gYEbXK94OXewKFAJb1Fi7kXVI08SZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743959074; c=relaxed/simple;
	bh=SnCIyEfrSdw72DkWlK85n2IVjZ/k2oUSewgFKxFXVUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4tPHxjcNCfTpVfkzuQdcecAi1uzvKLOysDuwbzlTwVolPzwvjMDQ+0ZIUHNox9ibKZzNWohAaNp6xMf87pV+R5kK6yhpMXDxNPxvve0ZxJvHXFXCPJX3ZmdpOJBse7cJSEXaPj7RAaHbmpQ13mpTH1KsaHHTCSgfB5kqSlDP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3qZBpEU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3qZBpEU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso4226261b3a.0;
        Sun, 06 Apr 2025 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743959071; x=1744563871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7oQrqlviM8KgsgxhSy60cT9Jvzmw6tPfKvR4Oxhr9s=;
        b=N3qZBpEU2/cjWSARZiZTFJLYKoUxtrAv6JGYVf0BwCG8KniCkrXEgXcHO759sLAT+R
         g1+/b8EnbttVNyWggaEEyBXDkUYw+LeB0jHUck30JmAvLtArKq5+SBxU91OWwVcOAR8C
         quTVcQPoTyh8bI6UvWWVXE7r3h4y+NhTUujomZqnTnAv2GDqV9pjUd0vsbam28i22GQQ
         wpmpRRqIHD0o5ByTm1i9HGFFM/ko4Jic63d4Rv1v6wh6TUTBhBisnmY4vpaHp/mCg/8a
         qdBli/JPyb9Q7Bkhsm9vYyaeajwzTxIC4s0i5pdkajeYQsy/7T5SphSsMDYSDpoO93/E
         Mb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743959071; x=1744563871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7oQrqlviM8KgsgxhSy60cT9Jvzmw6tPfKvR4Oxhr9s=;
        b=XDDIcqApBTJC+1CD+mC1shedk0K6dA4LfWqgzGps+Gz4ZJMlE8I4EdWMpSCSCOTcKp
         TGqCy8681Qu2s8Fs528aBWGB7hQ+wj2kyyEtK50onwrXvxYpQHG52VsPipuzN1oZh+y9
         X3PAvvMPNdnn2dVTQzXe4mt5CerZX8ARAebuQRcz2LeAUzY6J1EshgsibIhj9wEiu0p0
         lU2FWscdAwDrtQYtM77prfONUXXb6AmDaGImwSXhPt5+Lyo34U3mBswJGr91dMeQhg+V
         PTjexiiEOyPYj5+JCLD+uWO1Je72v1b4W7IZ7IdSC34vA49l73KuMn/uxaBwV+vnfiJZ
         cJVA==
X-Forwarded-Encrypted: i=1; AJvYcCU79p021fmkXoYshwk8tAssBe+PcxFfnXySELSaNyjI6EqveSF1G/agFwHPShRzjiPLsOzNtE114birZY0=@vger.kernel.org, AJvYcCWpAJDD2hcCGzSUwmS2hXLeRckwd1EhkCsFvw12hXCLqNH9ik9ETqLFrMW8cxmGiv8cSTY/0YPiLIo=@vger.kernel.org, AJvYcCWxogSQdN+3Z5loOub20bJun3iRvQ1nXLfIr8hwmaqoSQWUirt02uBgIInAR9qFEVBEvB7erfJYVYamhEq5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7aKxDRJP4EKEn3E8SVu5BYDVXEnRPhOmqtcYlAdPwGjcjxE1L
	TMnh/KMVB8QD0tHIIv7BHrCUdg4gOS0xpuvvuZFL7RfR54W1Nu10
X-Gm-Gg: ASbGncvsEZa4p/pGJcxgO7Qcymif9noz5j7YeodsYydoFuEXSl/tZlEkazpMkFYAqRT
	nDh7T6ug4cV9qbEuRLDpDkPsV1j73TSu8hpW57A9Afm3Elx7+ZNTuIFv9/qt8mhAs+3VPCj+FtI
	2P1wdsWgPmWcqLS+G3ZfTcDzx/F4G2UFLIItfg93wW/9bI8LMnf1piKCX+p7g8ksZHv9rd47Z3O
	vi8OUIrYfZlzMAixsMbYzzgyAomGB2QfNpVxFUsslxil+ePxKriLqiT0dTG91YBBiOoHi7oYMeG
	NAGKHeSDeLd5RvxHf2fpdAoI0d9ncpwqUD1n1kpShlHY8ReXoYXZnhn2ig==
X-Google-Smtp-Source: AGHT+IF23JeXjta16Khe4bE0x0Y7L02vK+e0LBDifGZ7e6X5N80zBtYRlJij6iBeBJVxGrFEqXa5JQ==
X-Received: by 2002:a05:6a21:9014:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-20113c57e5bmr8331566637.10.1743959071436;
        Sun, 06 Apr 2025 10:04:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc350701sm4857368a12.39.2025.04.06.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 10:04:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Apr 2025 10:04:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (max77705) add initial support
Message-ID: <798a20bd-4319-4c33-9b82-5f8f63b1a026@roeck-us.net>
References: <20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-initial-support-for-max77705-sensors-v3-1-e5f64fccd005@gmail.com>

On Sat, Apr 05, 2025 at 06:30:08PM +0300, Dzmitry Sankouski wrote:
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

The above should be part of the description (actually, it should replace
the description).

> ---
> Changes in v3:
> - Fix review comments.
> - Fix v2 changed message.
> - Link to v2: https://lore.kernel.org/r/20250304-initial-support-for-max77705-sensors-v2-1-58d2207c732b@gmail.com
> 
> Changes in v2:
> - Fix review comments.
> - Link to v1: https://lore.kernel.org/r/20250225-initial-support-for-max77705-sensors-v1-1-2be6467628b0@gmail.com
> ---
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
>  Documentation/hwmon/index.rst    |   1 +
>  Documentation/hwmon/max77705.rst |  39 +++++++++++++++++++++++++++++++
>  MAINTAINERS                      |   7 ++++++
>  drivers/hwmon/Kconfig            |  10 ++++++++
>  drivers/hwmon/Makefile           |   1 +
>  drivers/hwmon/max77705-hwmon.c   | 246 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 304 insertions(+)
> 
> 
> ---
> base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
> change-id: 20250123-initial-support-for-max77705-sensors-ad0170ac1ec5
> 
> Best regards,
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f0ddf6222c44..764c1c91ed70 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -161,6 +161,7 @@ Hardware Monitoring Kernel Drivers
>     max6639
>     max6650
>     max6697
> +   max77705
>     max8688
>     mc13783-adc
>     mc34vr500
> diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
> new file mode 100644
> index 000000000000..9037226c50b9
> --- /dev/null
> +++ b/Documentation/hwmon/max77705.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver max77705
> +====================

I suspect that this will generate a documentation build error.
Make sure that the "===" line is as long as the text above.

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
>  F:	Documentation/hwmon/pc87427.rst
>  F:	drivers/hwmon/pc87427.c
>  
> +MAX77705 HARDWARE MONITORING DRIVER
> +M:	Dzmitry Sankouski <dsankouski@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/max77705.rst
> +F:	drivers/hwmon/max77705-hwmon.c
> +
>  PCA9532 LED DRIVER
>  M:	Riku Voipio <riku.voipio@iki.fi>
>  S:	Maintained
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index f91f713b0105..37f3bee91e3f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1308,6 +1308,16 @@ config SENSORS_MAX31790
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31790.
>  
> +config SENSORS_MAX77705
> +	tristate "MAX77705 current and voltage sensor"
> +	depends on I2C
> +	select REGMAP_I2C

The driver no longer depends on I2C or REGMAP_I2C. However, there
is now a dependency on REGMAP (since that is handled by the parent).
The driver _does_ depend on its parent, though, since that is where
it gets its regmap from.

I would suggest to simplify the dependency to something like

	depends on MFD_MAX77705

The dependency on MFD_MAX77705 is important since otherwise this
driver can be built into the kernel even if MFD_MAX77705 is built
as module. That would not make sense.

> +	help
> +	  If you say yes here you get support for MAX77705 sensors connected with I2C.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max77705-hwmon.
> +
>  config SENSORS_MC34VR500
>  	tristate "NXP MC34VR500 hardware monitoring driver"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 766c652ef22b..22ceebf10299 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -161,6 +161,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
>  obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
>  obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
>  obj-$(CONFIG_MAX31827) += max31827.o
> +obj-$(CONFIG_SENSORS_MAX77705) += max77705-hwmon.o
>  obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
>  obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
> diff --git a/drivers/hwmon/max77705-hwmon.c b/drivers/hwmon/max77705-hwmon.c
> new file mode 100644
> index 000000000000..47fe1cf53041
> --- /dev/null
> +++ b/drivers/hwmon/max77705-hwmon.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MAX77705 voltage and current hwmon driver.
> + *
> + *  Copyright (C) 2025 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>

Not needed.

> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>

Not needed.

> +#include <linux/kernel.h>
> +#include <linux/mfd/max77705-private.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>

Not needed.

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
> +static const struct regmap_config max77705_hwmon_regmap_config = {
> +	.name = "max77705_hwmon",
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.rd_table = &max77705_hwmon_readable_table,
> +	.max_register = MAX77705_FG_END,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE
> +};

The regmap configuration is no longer used.

> +
> +static int max77705_read_and_convert(struct regmap *regmap, u8 reg, u32 res, long *val)
> +{
> +	int ret;
> +	u32 regval;
> +
> +	ret = regmap_read(regmap, reg, &regval);
> +	if (ret < 0)
> +		return ret;
> +	*val = mult_frac((long)regval, res, 1000000);

Does the chip report negative values ? If so, the type conversion is
not correct, and sign_extend() may be needed.

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
> +		if (channel >= ARRAY_SIZE(voltage_channel_desc))
> +			return 0;

This is in practice unnecessary. There are two channels, and
ARRAY_SIZE(voltage_channel_desc) is 2.

> +
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_curr:
> +		if (channel >= ARRAY_SIZE(current_channel_desc))
> +			return 0;

Same as above.

> +
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		case hwmon_curr_average:
> +			if (current_channel_desc[channel].avg_reg)
> +				return 0444;

Missing break;

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
> +	u8 reg;
> +	u32 res;
> +
> +	switch (type) {
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			reg = current_channel_desc[channel].reg;
> +			res = current_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, val);
> +		case hwmon_curr_average:
> +			reg = current_channel_desc[channel].avg_reg;
> +			res = current_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			reg = voltage_channel_desc[channel].reg;
> +			res = voltage_channel_desc[channel].resolution;
> +
> +			return max77705_read_and_convert(regmap, reg, res, val);
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
> +
When applying:

.git/rebase-apply/patch:408: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Please drop the empty line.

Guenter
