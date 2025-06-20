Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139FE2A8C1;
	Fri, 20 Jun 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750395924; cv=none; b=UylnE4RbvEvVAN+sbsvZqzftWwwh1C/dlDsh7u4eOtKBuE2wti850ddDMUqiIjJp8ME16EFaKmK8xZrTOekLsu6SXNnNzTonUFA99CF7R5tmUGtgdk+z00OfumiN4/iGIGUL7KppPpeaV4XUMOGwW6/mn31FK5JR36heY9qZSe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750395924; c=relaxed/simple;
	bh=1hsaLuMLFKs4ixVELRCpxzWAc3UpUm8RZpYjFW2wa6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVA4UkjwFHWm5tilwM//db+3MYefo8/akKbOp6YhcaMV/oftk8PNpha9h5i04RJyXB7g7BDs4cvLie37ITuT43Q1TDBztv1QzJlfrTFmvdBhSlcJsg/WZj/hfZD1DLjaFUf6aEfiIJcJT+yBqBsvu/OATvBMyUoYgTdHTqdjbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=P4HP6FtN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="P4HP6FtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750395921;
	bh=1hsaLuMLFKs4ixVELRCpxzWAc3UpUm8RZpYjFW2wa6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4HP6FtNqiNmx1xhZl1sRPzBrDZMuDxx3HOYl1jY6bx1yh/k+ocPbHyvwUMeEO0+e
	 JZcQcGEUUAQVjZoEi0kyZSsBVY5T3DMGPzHH1xbxhhPgqr6FIB9etsJPTJT+VG7PGd
	 G/TdtDx02jcC+nRUmormQwwAv+KovAN3aKj7d9Jw=
Date: Fri, 20 Jun 2025 07:05:19 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v4 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <f0584025-6dbb-44ab-bcaf-19827a45fa37@t-8ch.de>
References: <20250619-cros_ec_fan-v4-0-ca11548ce449@chromium.org>
 <20250619-cros_ec_fan-v4-3-ca11548ce449@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619-cros_ec_fan-v4-3-ca11548ce449@chromium.org>

On 2025-06-19 15:42:56+0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>

Also some tiny nitpicks below, with these fixed:

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
>  drivers/hwmon/cros_ec_hwmon.c         | 85 +++++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> index 355557a08c9a54b4c177bafde3743e7dc02218be..6db812708325f7abb6d319af3312b4079e6923c6 100644
> --- a/Documentation/hwmon/cros_ec_hwmon.rst
> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
>  the EC also supports setting fan PWM values and fan mode. Note that EC will
>  switch fan control mode back to auto when suspended. This driver will restore
>  the fan state to what they were before suspended when resumed.
> +If a fan is controllable, this driver will register that fan as a cooling device
> +in the thermal framework as well.
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index c0c4ffa6f85419edf5dacd730192e7f1c28e2e5c..572b194e51fb1a05fa5151abb0826d1c8ba2948d 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/thermal.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -31,6 +32,11 @@ struct cros_ec_hwmon_priv {
>  	u8 manual_fan_pwm[EC_FAN_SPEED_ENTRIES];
>  };
>  
> +struct cros_ec_hwmon_cooling_priv {
> +	struct cros_ec_hwmon_priv *hwmon_priv;
> +	u8 index;
> +};
> +
>  static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
>  {
>  	int ret;
> @@ -306,6 +312,42 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
>  	NULL
>  };
>  
> +static int cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
> +					       unsigned long *val)
> +{
> +	*val = 255;
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_cooling_get_cur_state(struct thermal_cooling_device *cdev,
> +					       unsigned long *val)
> +{
> +	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
> +	u8 read_val;
> +	int ret;
> +
> +	ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = read_val;
> +	return ret;

return 0;

> +}
> +
> +static int cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_device *cdev,
> +					       unsigned long val)
> +{
> +	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
> +
> +	return cros_ec_hwmon_write_pwm_input(priv->hwmon_priv->cros_ec, priv->index, val);
> +}
> +
> +static const struct thermal_cooling_device_ops cros_ec_thermal_cooling_ops = {
> +	.get_max_state = cros_ec_hwmon_cooling_get_max_state,
> +	.get_cur_state = cros_ec_hwmon_cooling_get_cur_state,
> +	.set_cur_state = cros_ec_hwmon_cooling_set_cur_state,
> +};
> +
>  static const struct hwmon_ops cros_ec_hwmon_ops = {
>  	.read = cros_ec_hwmon_read,
>  	.read_string = cros_ec_hwmon_read_string,
> @@ -381,6 +423,48 @@ static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cro
>  	       is_cros_ec_cmd_available(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION);
>  }
>  
> +static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
> +						       struct cros_ec_hwmon_priv *priv)
> +{
> +	struct cros_ec_hwmon_cooling_priv *cpriv;
> +	struct thermal_cooling_device *cdev;
> +	char *type;

const char *type;

> +	size_t i;
> +
> +	if (!IS_ENABLED(CONFIG_THERMAL))
> +		return;
> +
> +	if (!priv->fan_control_supported)
> +		return;
> +
> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->usable_fans & BIT(i)))
> +			continue;
> +
> +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> +		if (!cpriv) {
> +			dev_warn(dev, "no memory for registering fan %zu as a cooling device\n", i);
> +			continue;
> +		}
> +
> +		type = devm_kasprintf(dev, GFP_KERNEL, "%s-fan%zu", dev_name(dev), i);
> +		if (!type) {
> +			dev_warn(dev, "no memory to compose cooling device type for fan %zu\n", i);
> +			continue;
> +		}
> +
> +		cpriv->hwmon_priv = priv;
> +		cpriv->index = i;
> +		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
> +							       &cros_ec_thermal_cooling_ops);
> +		if (IS_ERR(cdev)) {
> +			dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
> +				 cdev);
> +			continue;
> +		}
> +	}
> +}
> +
>  static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -408,6 +492,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
>  	cros_ec_hwmon_probe_fans(priv);
>  	priv->fan_control_supported = cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>  							 &cros_ec_hwmon_chip_info, NULL);
> 
> -- 
> 2.50.0.rc2.701.gf1e915cc24-goog
> 
> 
