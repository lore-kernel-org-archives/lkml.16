Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD261946DF;
	Sat,  3 May 2025 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746257808; cv=none; b=AmKTtv6ty2lxqouX03qoMDmpcrZFJWb0ZyuHLs+qcJxy5lkEvwmSdzla5jgkQdnF7jFbcdhE4HprpgnhYfO9jo5cWXX/qrNcGLh+WcnVGU1LHXvIW8Pt/ebo5vburvNJBskzuv6YL97HN3rpj16/9EfjjjBkOYVtMlpdpzmNubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746257808; c=relaxed/simple;
	bh=8NjmJNsRnCHm65MyQ/cR0loiQWVNw8VDyYgZykl/u7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xtblj/OQCTeTrNo1hplQ5+rpn1/yfTPDsETQU50cwe/B9ViC7WG22Cy/F0qXrQJCX7K+xYAZ/3sgkZo+LO03vVfwZeMgR1CKHGj0orspkeE8Pf6DlPsZtQXa+HhbwgeOOocSixaPEvDpNd6eFIhyv+nErQqqMsCVP5IpC5ZFRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V3XEQ+Gt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V3XEQ+Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746257800;
	bh=8NjmJNsRnCHm65MyQ/cR0loiQWVNw8VDyYgZykl/u7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3XEQ+GtFqLvf+/PYOVMc7Xp5gxK7Jd6UdwQh8ZrR8dxo++K9mI7BV+LBGbCnbZCw
	 hj15xIcVnGmmo2XU3qUSP8CWVU/1a0r5gvRZvaV807BwlD1vQvWacvmdX0PECZqooU
	 5jBu19cFz1+cROL/mv308vE/fyVIQGmH6LGEP1Kc=
Date: Sat, 3 May 2025 09:36:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v2 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <a89ee43f-79d9-405a-a099-7ce90fe6eb55@t-8ch.de>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-2-4d588504a01f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-cros_ec_fan-v2-2-4d588504a01f@chromium.org>

On 2025-05-02 13:34:46+0800, Sung-Chi Li via B4 Relay wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Newer EC firmware supports controlling fans through host commands, so
> adding corresponding implementations for controlling these fans in the
> driver for other kernel services and userspace to control them.
> 
> The driver will first probe the supported host command versions (get and
> set of fan PWM values, get and set of fan control mode) to see if the
> connected EC fulfills the requirements of controlling the fan, then
> exposes corresponding sysfs nodes for userspace to control the fan with
> corresponding read and write implementations.
> As EC will automatically change the fan mode to auto when the device is
> suspended, the power management hooks are added as well to keep the fan
> control mode and fan PWM value consistent during suspend and resume. As
> we need to access the hwmon device in the power management hook, update
> the driver by storing the hwmon device in the driver data as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |   5 +-
>  drivers/hwmon/cros_ec_hwmon.c         | 201 ++++++++++++++++++++++++++++++++++
>  2 files changed, 205 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> index 47ecae983bdbef4bfcafc5dd2fff3de039f77f8e..5b802be120438732529c3d25b1afa8b4ee353305 100644
> --- a/Documentation/hwmon/cros_ec_hwmon.rst
> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> @@ -23,4 +23,7 @@ ChromeOS embedded controller used in Chromebooks and other devices.
>  
>  The channel labels exposed via hwmon are retrieved from the EC itself.
>  
> -Fan and temperature readings are supported.
> +Fan and temperature readings are supported. PWM fan control is also supported if
> +the EC also supports setting fan PWM values and fan mode. Note that EC will
> +switch fan control mode back to auto when suspended. This driver will restore
> +the fan state before suspended.
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 9991c3fa020ac859cbbff29dfb669e53248df885..c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/hwmon.h>
> +#include <linux/math.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -21,6 +22,9 @@ struct cros_ec_hwmon_priv {
>  	struct cros_ec_device *cros_ec;
>  	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
>  	u8 usable_fans;
> +	bool fan_control_supported;
> +	u8 manual_fans; /* bits to indicate whether the fan is set to manual */
> +	u8 manual_fan_pwm_values[EC_FAN_SPEED_ENTRIES];
>  };
>  
>  static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
> @@ -36,6 +40,40 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
>  	return 0;
>  }
>  
> +static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec, u8 index, u8 *pwm_value)
> +{
> +	struct ec_params_pwm_get_fan_duty req = {
> +		.fan_idx = index,
> +	};
> +	struct ec_response_pwm_get_fan_duty resp;
> +	int ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req),
> +			      &resp, sizeof(resp));

As mentioned before, please split the variable declaration and the
assignment.

> +
> +	if (ret < 0)
> +		return ret;
> +
> +	*pwm_value = (u8)DIV_ROUND_CLOSEST(le32_to_cpu(resp.percent) * 255, 100);
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
> +					 u8 *control_method)
> +{
> +	struct ec_params_auto_fan_ctrl_v2 req = {
> +		.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
> +		.fan_idx = index,
> +	};
> +	struct ec_response_auto_fan_control resp;
> +	int ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req),
> +			      &resp, sizeof(resp));
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	*control_method = resp.is_auto ? 2 : 1;
> +	return 0;
> +}
> +
>  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
>  {
>  	unsigned int offset;
> @@ -76,6 +114,8 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>  	int ret = -EOPNOTSUPP;
>  	u16 speed;
> +	u8 control_method;
> +	u8 pwm_value;

Ordering.

>  	u8 temp;
>  
>  	if (type == hwmon_fan) {
> @@ -92,6 +132,17 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			if (ret == 0)
>  				*val = cros_ec_hwmon_is_error_fan(speed);
>  		}
> +	} else if (type == hwmon_pwm) {
> +		if (attr == hwmon_pwm_enable) {
> +			ret = cros_ec_hwmon_read_pwm_enable(priv->cros_ec, channel,
> +							    &control_method);

Unnecessary linbreak.

> +			if (ret == 0)
> +				*val = control_method;
> +		} else if (attr == hwmon_pwm_input) {
> +			ret = cros_ec_hwmon_read_pwm_value(priv->cros_ec, channel, &pwm_value);
> +			if (ret == 0)
> +				*val = pwm_value;
> +		}
>  	} else if (type == hwmon_temp) {
>  		if (attr == hwmon_temp_input) {
>  			ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
> @@ -124,6 +175,72 @@ static int cros_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types
>  	return -EOPNOTSUPP;
>  }
>  
> +static int cros_ec_hwmon_set_fan_pwm_val(struct cros_ec_device *cros_ec, u8 index, u8 val)
> +{
> +	int ret;
> +	struct ec_params_pwm_set_fan_duty_v1 req = {
> +		.fan_idx = index,
> +		.percent = DIV_ROUND_CLOSEST((uint32_t)val * 100, 255),
> +	};
> +
> +	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_PWM_SET_FAN_DUTY, &req, sizeof(req), NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_write_pwm_input(struct cros_ec_device *cros_ec, u8 index, u8 val)
> +{
> +	u8 control_method;
> +	int ret;
> +
> +	ret = cros_ec_hwmon_read_pwm_enable(cros_ec, index, &control_method);
> +	if (ret)
> +		return ret;
> +	if (control_method != 1)
> +		return -EOPNOTSUPP;
> +
> +	return cros_ec_hwmon_set_fan_pwm_val(cros_ec, index, val);
> +}
> +
> +static int cros_ec_hwmon_write_pwm_enable(struct cros_ec_device *cros_ec, u8 index, u8 val)
> +{
> +	int ret;
> +	struct ec_params_auto_fan_ctrl_v2 req = {
> +		.fan_idx = index,
> +		.cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
> +	};
> +
> +	/* No CROS EC supports no fan speed control */
> +	if (val == 0)
> +		return -EOPNOTSUPP;
> +
> +	req.set_auto = (val != 1) ? true : false;
> +	ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req, sizeof(req), NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			       int channel, long val)
> +{
> +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_pwm) {
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			return cros_ec_hwmon_write_pwm_input(priv->cros_ec, channel, val);
> +		case hwmon_pwm_enable:
> +			return cros_ec_hwmon_write_pwm_enable(priv->cros_ec, channel, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
>  static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
>  					u32 attr, int channel)
>  {
> @@ -132,6 +249,9 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>  	if (type == hwmon_fan) {
>  		if (priv->usable_fans & BIT(channel))
>  			return 0444;
> +	} else if (type == hwmon_pwm) {
> +		if (priv->fan_control_supported && priv->usable_fans & BIT(channel))
> +			return 0644;
>  	} else if (type == hwmon_temp) {
>  		if (priv->temp_sensor_names[channel])
>  			return 0444;
> @@ -147,6 +267,11 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT,
>  			   HWMON_F_INPUT | HWMON_F_FAULT),
> +	HWMON_CHANNEL_INFO(pwm,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
> @@ -178,6 +303,7 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
>  static const struct hwmon_ops cros_ec_hwmon_ops = {
>  	.read = cros_ec_hwmon_read,
>  	.read_string = cros_ec_hwmon_read_string,
> +	.write = cros_ec_hwmon_write,
>  	.is_visible = cros_ec_hwmon_is_visible,
>  };
>  
> @@ -233,6 +359,21 @@ static void cros_ec_hwmon_probe_fans(struct cros_ec_hwmon_priv *priv)
>  	}
>  }
>  
> +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> +					    u16 cmd, u8 version)
> +{
> +	int ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> +
> +	return ret >= 0 && (ret & EC_VER_MASK(version));
> +}
> +
> +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> +{
> +	return is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_PWM_GET_FAN_DUTY, 0) &&

As mentioned before, the hardcoded version constants are used in
multiple places. They should use a #define instead.

> +	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_PWM_SET_FAN_DUTY, 1) &&
> +	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, 2);
> +}
> +
>  static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -259,13 +400,71 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  
>  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
>  	cros_ec_hwmon_probe_fans(priv);
> +	priv->fan_control_supported =
> +		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);

No need for a linebreak.

>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
>  							 &cros_ec_hwmon_chip_info, NULL);
> +	platform_set_drvdata(pdev, priv);
>  
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> +static int cros_ec_hwmon_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> +	size_t i;
> +	int ret;
> +	u8 control_method;
> +
> +	if (!priv->fan_control_supported)
> +		return 0;
> +
> +	/* EC sets fan control to auto after suspended, store settings before suspending. */
> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->usable_fans & BIT(i)))
> +			continue;
> +
> +		ret = cros_ec_hwmon_read_pwm_enable(priv->cros_ec, i, &control_method);
> +		if (ret)
> +			continue;
> +
> +		if (control_method != 1) {
> +			priv->manual_fans &= ~BIT(i);
> +			continue;
> +		} else {
> +			priv->manual_fans |= BIT(i);
> +		}
> +
> +		cros_ec_hwmon_read_pwm_value(priv->cros_ec, i, &priv->manual_fan_pwm_values[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> +{
> +	const struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> +	size_t i;
> +
> +	if (!priv->fan_control_supported)
> +		return 0;
> +
> +	/* EC sets fan control to auto after suspended, restore to settings before suspended. */
> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->manual_fans & BIT(i)))
> +			continue;
> +
> +		/*
> +		 * Setting fan PWM value to EC will change the mode to manual for that fan in EC as
> +		 * well, so we do not need to issue a separate fan mode to manual call.
> +		 */
> +		cros_ec_hwmon_set_fan_pwm_val(priv->cros_ec, i, priv->manual_fan_pwm_values[i]);

Error handling?

> +	}
> +
> +	return 0;
> +}
> +
>  static const struct platform_device_id cros_ec_hwmon_id[] = {
>  	{ DRV_NAME, 0 },
>  	{}
> @@ -274,6 +473,8 @@ static const struct platform_device_id cros_ec_hwmon_id[] = {
>  static struct platform_driver cros_ec_hwmon_driver = {
>  	.driver.name	= DRV_NAME,
>  	.probe		= cros_ec_hwmon_probe,
> +	.suspend	= cros_ec_hwmon_suspend,
> +	.resume		= cros_ec_hwmon_resume,

I think these should use pm_ptr() to so the functions can be optimized
away if !CONFIG_PM.

>  	.id_table	= cros_ec_hwmon_id,
>  };
>  module_platform_driver(cros_ec_hwmon_driver);
> 
> -- 
> 2.49.0.906.g1f30a19c02-goog
> 
> 
