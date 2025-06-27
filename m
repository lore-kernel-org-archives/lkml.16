Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7E214801;
	Fri, 27 Jun 2025 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024091; cv=none; b=KkS2107yZfs/M/kWbZgCj4V0ELetNUALMB8qOR0hTMtNLuzZ7hDPMlImj7TPU5JkZASv10DP/nuq8FkDFlS5MvbRGndCmJc54jK7Eki+hgx6CSDhB+buopv6zE2lGxG/bIVmbui7h7Ic9SNKcHHerBhvr+s6Xp4nUTjyMcEu+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024091; c=relaxed/simple;
	bh=XvHfpM9OTIFa8lByRr0k3o0sH1Ofp4ImvoSaMGK6xeY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XdqHjXzqfb2RpjKwcrb9GnxtLyhNgOSf36O7xa8hR3WLqHVoe/OPsG0Zo/7AhSRhY0mX6e+CR73swyTxcmQrdt9cc5fPJ3UMJJ966eCKJr//EfdCadRsmSFBiLm15NZMwME3aqx31X8KL6IEJp77Lx2fXc0FRewDPLVUhaa72P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ws1JT2RL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ws1JT2RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751024090; x=1782560090;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XvHfpM9OTIFa8lByRr0k3o0sH1Ofp4ImvoSaMGK6xeY=;
  b=Ws1JT2RL2TZVUY4/ZNGFWz9I2SChjERj7RlfmxAUxvYjseyYR3NK8JsM
   urQLqw6sVJ+xBJ/qu6SX2BBUawvsrFOMTn4GiIMAPek+APII1gqslBgyp
   TcNmAwJpxVSfLR2TidRlyjKa1s59Z+xGTs7ptKCpt4ulssLxuyYOx28Dt
   TqoF6PZOBCjOhwkvv+9gMq/qGCAwSQICsAo9SQpW27n2F7q68LQZgcxry
   HXcDlAEKX5clXjIpcgo/aKAgYYxzcIosmIijaW+wE4sfTYLo4JAaCaQ7c
   JZRfOxYBq7bNt7GjkWn1jt1XE2x5Ylc71Bfrr+p+NJ/mZgigLzoFd8KTO
   A==;
X-CSE-ConnectionGUID: vGmzWAYfThuxjG9mpPiS9Q==
X-CSE-MsgGUID: C03NLDf4TNuVI5VixHVkeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70905956"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70905956"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:34:49 -0700
X-CSE-ConnectionGUID: pfN+VBexSayvaf+YK0PGcA==
X-CSE-MsgGUID: BgC3lui3SMiXt71XGxnJgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152307676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:34:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Jun 2025 14:34:43 +0300 (EEST)
To: jesse huang <jesse.huang@portwell.com.tw>
cc: hansg@kernel.org, jdelvare@suse.com, linux@roeck-us.net, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
In-Reply-To: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>
Message-ID: <069ea1e2-f9ad-384a-a757-24fff9fba210@linux.intel.com>
References: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Jun 2025, jesse huang wrote:

> Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
> monitoring into the driver via the hwmon subsystem, enabling
> standardized reporting via tools like lm-sensors.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
>  drivers/platform/x86/portwell-ec.c | 188 ++++++++++++++++++++++++++++-
>  1 file changed, 186 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> index a68522aaa3fa..79597b4b5559 100644
> --- a/drivers/platform/x86/portwell-ec.c
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -33,6 +33,10 @@
>  #include <linux/sizes.h>
>  #include <linux/string.h>
>  #include <linux/watchdog.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon-vid.h>
> +#include <linux/err.h>

You forgot to add these according to alphabetical order.

>  #define PORTWELL_EC_IOSPACE              0xe300
>  #define PORTWELL_EC_IOSPACE_LEN          SZ_256
> @@ -52,16 +56,59 @@
>  #define PORTWELL_EC_FW_VENDOR_LENGTH     3
>  #define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
>  
> +#define PORTWELL_EC_ADC_MAX              1023
> +
>  static bool force;
>  module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
>  
> +enum pwec_board_id {
> +	PWEC_BOARD_NANO6064,
> +	PWEC_BOARD_ID_MAX
> +};
> +
> +struct pwec_hwmon_data {
> +	const char *label;
> +	u8 lsb_reg;
> +	u8 msb_reg;
> +	u32 scale;
> +};
> +
> +struct pwec_data {
> +	const struct pwec_hwmon_data *hwmon_in_data;
> +	int hwmon_in_num;
> +	const struct pwec_hwmon_data *hwmon_temp_data;
> +	int hwmon_temp_num;
> +};
> +
> +static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
> +	{ "Vcore", 0x20, 0x21, 3000 },
> +	{ "VDIMM", 0x32, 0x33, 3000 },
> +	{ "3.3V",  0x22, 0x23, 6000 },
> +	{ "5V",    0x24, 0x25, 9600 },
> +	{ "12V",   0x30, 0x31, 19800 },

Those registers appear to be always consecutive so it looks unnecessary to 
store both.

> +};
> +
> +static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
> +	{ "System Temperature", 0x02, 0, 0 },
> +};
> +
> +static const struct pwec_data pwec_board_data[] = {
> +	[PWEC_BOARD_NANO6064] = {
> +		.hwmon_in_data = pwec_nano_hwmon_in,
> +		.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
> +		.hwmon_temp_data = pwec_nano_hwmon_temp,
> +		.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
> +	},
> +};

What's advantage of having these in an array?

> +
>  static const struct dmi_system_id pwec_dmi_table[] = {
>  	{
>  		.ident = "NANO-6064 series",
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
>  		},
> +		.driver_data = (void *)&pwec_board_data[PWEC_BOARD_NANO6064],
>  	},
>  	{ }
>  };
> @@ -79,6 +126,19 @@ static u8 pwec_read(u8 address)
>  	return inb(PORTWELL_EC_IOSPACE + address);
>  }
>  
> +static u16 pwec_read16_stable(u8 lsb_reg, u8 msb_reg)
> +{
> +	u8 lsb, msb, old_msb;
> +
> +	do {
> +		old_msb = pwec_read(msb_reg);
> +		lsb = pwec_read(lsb_reg);
> +		msb = pwec_read(msb_reg);
> +	} while (msb != old_msb);
> +
> +	return (msb << 8) | lsb;
> +}
> +
>  /* GPIO functions */
>  
>  static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -204,6 +264,122 @@ static struct watchdog_device ec_wdt_dev = {
>  	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
>  };
>  
> +/* HWMON functions */
> +
> +static umode_t pwec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +		u32 attr, int channel)
> +{
> +	const struct pwec_data *d = data;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < d->hwmon_temp_num)
> +			return 0444;
> +		break;
> +	case hwmon_in:
> +		if (channel < d->hwmon_in_num)
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct pwec_data *data = dev_get_drvdata(dev);
> +	u16 tmp;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < data->hwmon_temp_num) {
> +			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;

linux/units.h ?

> +			return 0;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (channel < data->hwmon_in_num) {
> +			tmp = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg,
> +						 data->hwmon_in_data[channel].msb_reg);
> +			*val = (data->hwmon_in_data[channel].scale * tmp) / PORTWELL_EC_ADC_MAX;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int pwec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				  u32 attr, int channel, const char **str)
> +{
> +	struct pwec_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < data->hwmon_temp_num) {
> +			*str = data->hwmon_temp_data[channel].label;
> +			return 0;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (channel < data->hwmon_in_num) {
> +			*str = data->hwmon_in_data[channel].label;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_channel_info *pwec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops pwec_hwmon_ops = {
> +	.is_visible = pwec_hwmon_is_visible,
> +	.read = pwec_hwmon_read,
> +	.read_string = pwec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info pwec_chip_info = {
> +	.ops = &pwec_hwmon_ops,
> +	.info = pwec_hwmon_info,
> +};
> +
> +static int pwec_hwmon_init(struct device *dev)
> +{
> +	struct pwec_data *data = dev_get_platdata(dev);
> +	void *hwmon;
> +	int ret;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return 0;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "portwell_ec", data, &pwec_chip_info,
> +						     NULL);
> +	ret = PTR_ERR_OR_ZERO(hwmon);
> +	if (ret)
> +		dev_err(dev, "Failed to register hwmon_dev: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  static int pwec_firmware_vendor_check(void)
>  {
>  	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
> @@ -242,6 +418,10 @@ static int pwec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = pwec_hwmon_init(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	return 0;
>  }
>  
> @@ -274,11 +454,14 @@ static struct platform_device *pwec_dev;
>  
>  static int __init pwec_init(void)
>  {
> +	const struct dmi_system_id *match;
>  	int ret;
>  
> -	if (!dmi_check_system(pwec_dmi_table)) {
> +	match = dmi_first_match(pwec_dmi_table);
> +	if (!match) {
>  		if (!force)
>  			return -ENODEV;
> +		match = &pwec_dmi_table[0];
>  		pr_warn("force load portwell-ec without DMI check\n");
>  	}
>  
> @@ -286,7 +469,8 @@ static int __init pwec_init(void)
>  	if (ret)
>  		return ret;
>  
> -	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
> +	pwec_dev = platform_device_register_data(NULL, "portwell-ec", -1, match->driver_data,
> +						 sizeof(struct pwec_data));
>  	if (IS_ERR(pwec_dev)) {
>  		platform_driver_unregister(&pwec_driver);
>  		return PTR_ERR(pwec_dev);
> 

-- 
 i.

