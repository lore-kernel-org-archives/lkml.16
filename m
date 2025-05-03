Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C04B1A840A;
	Sat,  3 May 2025 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746257812; cv=none; b=ddOZka5Z3KC2rxSYcpcjlr1L9Oyi7HLZO04FReZill6EQTLfiF3sPnwqrPjnH6WjW4WVdmVJatg9ApUgM7wOVQEHSgm9u5X1gHjOmo7BE0aqNBP9t+PGmqZzeWALRkznDCn7gZEh0ZAga+o7h1o6Pr/JRqUAUi9YF0/cad1Lugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746257812; c=relaxed/simple;
	bh=TVRFmkhoIEa24F+uA5f7IoZ4vojB54oNc+ZZi69ynPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjWv6nmRR+uf6DiuRAoxRbaDwxzSspFfU+4NGyifjpOH4bghYWnQgCx7/QP3f+G9WxEU8psUcoFx03ApQdpUNzaI+F7jEELhaFWiuj5/E41G/b+yTw3wgt0alWqLfhQAR8m2aRwL3VyiwYVvxHh5X074/43C7RPDHLBwmQU1tiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AW6G1eRE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AW6G1eRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746257239;
	bh=TVRFmkhoIEa24F+uA5f7IoZ4vojB54oNc+ZZi69ynPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AW6G1eRE2BAM44E51PivMNxnNrJSwkZfqByT2RsiltnyAc/kA5SUTwRHJfMF8QDhW
	 e9vxZtINEG6n+p3o0BPcuxfQquZjSmjgAZTFNfIJauQy0xLKonbI0L3jGB9JPDp2Lq
	 4/NeqNRNF5G0RHOw4gLohybSx9CG6WmyzkISmZdY=
Date: Sat, 3 May 2025 09:27:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>

On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
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
> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
>  drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
> --- a/Documentation/hwmon/cros_ec_hwmon.rst
> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
>  the EC also supports setting fan PWM values and fan mode. Note that EC will
>  switch fan control mode back to auto when suspended. This driver will restore
>  the fan state before suspended.
> +If a fan is controllable, this driver will register that fan as a cooling device
> +in the thermal framework as well.
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/thermal.h>

Needs a dependency on CONFIG_THERMAL.

>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -27,6 +28,11 @@ struct cros_ec_hwmon_priv {
>  	u8 manual_fan_pwm_values[EC_FAN_SPEED_ENTRIES];
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
> @@ -300,6 +306,34 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
>  	NULL
>  };
>  
> +static int
> +cros_ec_hwmon_cooling_get_max_state(struct thermal_cooling_device *cdev,
> +				    unsigned long *val)
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
> +	int ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);

Split declaration and assignment.

> +
> +	if (ret == 0)
> +		*val = read_val;
> +	return ret;
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
>  static const struct hwmon_ops cros_ec_hwmon_ops = {
>  	.read = cros_ec_hwmon_read,
>  	.read_string = cros_ec_hwmon_read_string,
> @@ -307,6 +341,12 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
>  	.is_visible = cros_ec_hwmon_is_visible,
>  };
>  
> +static const struct thermal_cooling_device_ops cros_ec_thermal_cooling_ops = {
> +	.get_max_state = cros_ec_hwmon_cooling_get_max_state,
> +	.get_cur_state = cros_ec_hwmon_cooling_get_cur_state,
> +	.set_cur_state = cros_ec_hwmon_cooling_set_cur_state,
> +};

Move this directly after the definition of the functions.

> +
>  static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {
>  	.ops = &cros_ec_hwmon_ops,
>  	.info = cros_ec_hwmon_info,
> @@ -374,6 +414,31 @@ static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cro
>  	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, 2);
>  }
>  
> +static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
> +						       struct cros_ec_hwmon_priv *priv)
> +{
> +	struct cros_ec_hwmon_cooling_priv *cpriv;
> +	size_t i;

if (!IS_ENABLED(CONFIG_THERMAL))
	return;

> +
> +	if (!priv->fan_control_supported)
> +		return;
> +
> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->usable_fans & BIT(i)))
> +			continue;
> +
> +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> +		if (!cpriv)
> +			return;
> +
> +		cpriv->hwmon_priv = priv;
> +		cpriv->index = i;
> +		devm_thermal_of_cooling_device_register(
> +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,

What happens for multiple/chained ECs? If both provide sensors the
thermal device names will collide.

Error handling for devm_kasprintf() is missing.

> +			&cros_ec_thermal_cooling_ops);

Error handling for devm_thermal_of_cooling_device_register() is missing.

> +	}
> +}
> +
>  static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	cros_ec_hwmon_probe_fans(priv);
>  	priv->fan_control_supported =
>  		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>  							 &cros_ec_hwmon_chip_info, NULL);
> 
> -- 
> 2.49.0.906.g1f30a19c02-goog
> 
> 
