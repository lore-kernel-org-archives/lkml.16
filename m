Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287F2D528;
	Mon, 12 May 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035045; cv=none; b=PT3HFUPafGbo0WNtn863OBQ3o098vdq8Od7bK9nf2MTVSaWmc3K2NxW+Fc9BucABLnPGxQQxtfmHasM2K4vQc7OCm09f7cPKAWQZQ5EQ3e2zbq7hMkFk5xk42Opw2D8Zsf+qkYHL2z96VaV0tbBKABV3cRy55RNBdi8d+al3bJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035045; c=relaxed/simple;
	bh=u4NoJq0BxC9RrjJ0WYKGghRiHQIO7pd2hT9ccDuugM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI+zN6uDs5YNm+nyLpBmCABnoRKinCHGTEwXXhNEuNdE01DHZclLc0E+7PNlJlhBEFug1oieiJPl0biDyIpN7z7L3goFE6pTu3ayeaC8geZr5eiSef5RgN0HRliDXz1SG6I6IMnJsMFzlJOXHrtpD0DDoCTiqrmyUiq8I20uMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IO1fiNs0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IO1fiNs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747035040;
	bh=u4NoJq0BxC9RrjJ0WYKGghRiHQIO7pd2hT9ccDuugM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO1fiNs0X7hKCsp0a1l1aWfGNX7X5a8wv+633DWTFsDYbuH7fYCcmZcs6C8pE04x7
	 DsCCwuJKztg7u2CUdE7Y953DiFdL2Npx294FguVYpZsYRWsVQvLTLRx5Ye2quRZbXK
	 HMCyIl+TbtrgqaSVD2tKuD5otAl5IMbvYZyQWZZQ=
Date: Mon, 12 May 2025 09:30:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: lschyi@chromium.org
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>

On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
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
>  drivers/hwmon/cros_ec_hwmon.c         | 228 ++++++++++++++++++++++++++++++++++
>  2 files changed, 232 insertions(+), 1 deletion(-)

<snip>

>  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
>  {
>  	unsigned int offset;
> @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>  static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			      u32 attr, int channel, long *val)
>  {
> +	u8 control_method;
>  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> +	u8 pwm_value;
>  	int ret = -EOPNOTSUPP;
>  	u16 speed;
>  	u8 temp;

Ordering again.

This should be:

struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
int ret = -EOPNOTSUPP;
u8 control_method;
u8 pwm_value;
u16 speed;
u8 temp;

or:

struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
u8 control_method, pwm_value, temp;
int ret = -EOPNOTSUPP;
u16 speed;

<snip>

> +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> +					    u16 cmd, u8 version)

"fulfilled" -> "available" or "present"

> +{
> +	int ret;
> +
> +	ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> +	return ret >= 0 && (ret & EC_VER_MASK(version));
> +}
> +
> +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> +{
> +	if (!IS_ENABLED(CONFIG_PM))
> +		return false;

Why? This should generally work fine without CONFIG_PM.
Only the suspend/resume callbacks are unnecessary in that case.

> +
> +	return is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_PWM_GET_FAN_DUTY, CROS_EC_HWMON_PWM_GET_FAN_DUTY_CMD_VERSION) &&
> +	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_PWM_SET_FAN_DUTY, CROS_EC_HWMON_PWM_SET_FAN_DUTY_CMD_VERSION) &&
> +	       is_cros_ec_cmd_fulfilled(cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL, CROS_EC_HWMON_THERMAL_AUTO_FAN_CTRL_CMD_VERSION);
> +}

<snip>

> +static int cros_ec_hwmon_suspend(struct platform_device *pdev, pm_message_t state)
> +{
> +	u8 control_method;
> +	size_t i;
> +	struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> +	int ret;

Ordering.

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
> +		if (ret) {
> +			dev_warn(&pdev->dev, "failed to get mode setting for fan %zu: %d", i, ret);
> +			continue;
> +		}
> +
> +		if (control_method != 1) {
> +			priv->manual_fans &= ~BIT(i);
> +			continue;
> +		} else {
> +			priv->manual_fans |= BIT(i);
> +		}
> +
> +		ret = cros_ec_hwmon_read_pwm_value(
> +			priv->cros_ec, i, &priv->manual_fan_pwm_values[i]);
> +		/*
> +		 * If failed for storing the value, invalidate the stored mode value by setting it

"If storing the value failed"

> +		 * to auto control. EC will automatically switch to auto mode for that fan after
> +		 * suspended.
> +		 */
> +		if (ret) {
> +			priv->manual_fans &= ~BIT(i);
> +			dev_warn(&pdev->dev, "failed to get PWM setting for fan %zu: %d", i, ret);

Print the warning first, so it's easier to follow the logic.

> +			continue;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> +{
> +	size_t i;
> +	const struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> +	int ret;

Ordering.

> +
> +	if (!priv->fan_control_supported)
> +		return 0;
> +
> +	/* EC sets fan control to auto after suspended, restore to settings before suspended. */

"after suspend"

> +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> +		if (!(priv->manual_fans & BIT(i)))
> +			continue;
> +
> +		/*
> +		 * Setting fan PWM value to EC will change the mode to manual for that fan in EC as
> +		 * well, so we do not need to issue a separate fan mode to manual call.
> +		 */
> +		ret = cros_ec_hwmon_set_fan_pwm_val(
> +			priv->cros_ec, i, priv->manual_fan_pwm_values[i]);

You could rename "manual_fan_pwm_values" to "manual_fan_pwm" to save
some linebreaks here and in _suspend().

> +		if (ret)
> +			dev_warn(&pdev->dev, "failed to restore settings for fan %zu: %d", i, ret);

You can use %pe to print errors instead of %d:

"%zu: %pe\n", i, ERR_PTR(ret);

Also missing newline at the end of the message.

> +	}
> +
> +	return 0;
> +}

<snip>
