Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633A225D6;
	Wed, 30 Apr 2025 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024500; cv=none; b=X6jp8+4rLabWVbHBNkDuD3chBLUT7S6/w1VrvEAspDOlJ3HQI5fehNTSUw/aBgGuPl3USZVQejnD+Ll89dnx36QWDXUsxP97bVJ9PCgc1AJfEPEaYJ2f9oJExS91k8dbbAf3nnEHGqrzhlAMEeNY29gAIED1BqVA1edon7X72Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024500; c=relaxed/simple;
	bh=NXBWEd1ph+eZTmeXYgMCpSBzmBMLHdzVrIkTU9qkShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaAGZV7+LXc/HPTGTLHi7AbIowpI7JNgCO7OfJbOmLLbqVmek1wtLhmtKCiTimmJgFS6CrfkdzuguccqTZtggNWEFvmP6AsgVSuWbh5kJwPASSZotiWLB5XMLBwCA66WVwqLLjkdkSb9kcRX48VkZKJOOwrtQugDS94cJGhhIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=H/ZpkXCJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="H/ZpkXCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746024495;
	bh=NXBWEd1ph+eZTmeXYgMCpSBzmBMLHdzVrIkTU9qkShM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/ZpkXCJtwStLZxzW1gr6Bj3nsnrDiCUr/Hvhf2R4zgIrgWARC/BANdBL1wByur2M
	 Q2k4BghjK2NHzcDq3xDSRgVj04/s8s97l8Hd85nn5DXKFHFnxJO5FKBlx0GDIfpzRS
	 txJXIKLi1cahLaE6xwhAGusI7oqgslzTM4MCEbGs=
Date: Wed, 30 Apr 2025 16:48:15 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <0483bdf2-c1a2-4a8e-b0ee-b00cafdda557@t-8ch.de>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-2-a8d9e3efbb1a@chromium.org>
 <0933ec48-9a4b-49d0-8670-50b6ff6433f5@t-8ch.de>
 <aBHKepQx_drHfnp8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBHKepQx_drHfnp8@google.com>

On 2025-04-30 15:00:10+0800, Sung-Chi Li wrote:
> On Tue, Apr 29, 2025 at 11:20:09PM +0200, Thomas Weißschuh wrote:
> > On 2025-04-29 16:14:22+0800, Sung-Chi Li via B4 Relay wrote:
> > > From: Sung-Chi Li <lschyi@chromium.org>
> > > 
> > > Newer EC firmware supports controlling fans through host commands, so
> > > adding corresponding implementations for controlling these fans in the
> > > driver for other kernel services and userspace to control them.
> > > 
> > > The driver will first probe the supported host command versions (get and
> > > set of fan PWM values, get and set of fan control mode) to see if the
> > > connected EC fulfills the requirements of controlling the fan, then
> > > exposes corresponding sysfs nodes for userspace to control the fan with
> > > corresponding read and write implementations.
> > > As EC will automatically change the fan mode to auto when the device is
> > > suspended, the power management hooks are added as well to keep the fan
> > > control mode and fan PWM value consistent during suspend and resume. As
> > > we need to access the hwmon device in the power management hook, update
> > > the driver by storing the hwmon device in the driver data as well.
> > > 
> > > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > > ---
> > >  Documentation/hwmon/cros_ec_hwmon.rst |   5 +-
> > >  drivers/hwmon/cros_ec_hwmon.c         | 237 +++++++++++++++++++++++++++++++++-
> > >  2 files changed, 237 insertions(+), 5 deletions(-)

<snip>

> > > +static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec,
> > > +					u8 index, u8 *pwm_value)
> > > +{
> > > +	int ret = cros_ec_hwmon_read_pwm_raw_value(cros_ec, index, pwm_value);
> > 
> > The _raw_ function is unnecessary.
> > 
> 
> This is to share with the `cros_ec_hwmon_cooling_get_cur_state`, and there is a
> unit conversion needed, so extract the same process into a _raw_ function.

What's the advantage of scaling the value for the cooling device?
The hwmon core thermal zone implementation also uses the hwmon values
directly.

> > > +
> > > +	if (ret == 0)
> > > +		*pwm_value = *pwm_value * 255 / 100;
> > > +	return ret;
> > > +}
> > > +
> > > +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec,
> > > +					 u8 index, u8 *control_method)
> > > +{
> > > +	struct ec_params_auto_fan_ctrl_v2 req = {
> > > +		.fan_idx = index,
> > > +		.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
> > > +	};
> > > +	struct ec_response_auto_fan_control resp;
> > > +	int ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > > +			      sizeof(req), &resp, sizeof(resp));
> > 
> > Keep &foo and sizeof(foo) together on the same line please.
> > 
> 
> This is automatically formatted by clang-format. I will keep it like this in the
> v2 patch. If it is important for readablity, please share with me, and I will
> update that in the v2 patch.

It's not that important. But unfortunate that clang-format will make the
formatting worse.

<snip>

> > > +static int cros_ec_hwmon_set_pwm_raw_value(struct cros_ec_hwmon_priv *priv,
> > > +					   u8 index, u8 val)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (!(priv->manual_fans & BIT(index)))
> > > +		return -ECANCELED;
> > 
> > Weird error code.
> > 
> 
> Hmm, do you have some error code suggestion? I think the idea here is we will
> reject to write the PWM value if fan is not in manual mode, and I am not sure
> what error suits for this (is -EPERM the one to use here?).

EOPNOTSUPP maybe.

> 
> > > +
> > > +	ret = cros_ec_hwmon_write_pwm_value(priv->cros_ec, index, val);
> > > +	if (ret == 0)
> > > +		priv->manual_fan_pwm_values[index] = val;
> > > +	return ret;
> > > +}

<snip>

> > > +static int cros_ec_hwmon_write_pwm_enable(struct cros_ec_device *cros_ec,
> > > +					  u8 index, u8 val)
> > > +{
> > > +	struct ec_params_auto_fan_ctrl_v2 req = {
> > > +		.fan_idx = index,
> > > +		.cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
> > 
> > Swap the two lines above.
> > 
> 
> Will update in v2 patch.
> 
> > > +	};
> > > +	int ret;
> > > +
> > > +	/* No CROS EC supports no fan speed control */
> > > +	if (val == 0)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	req.set_auto = (val != 1) ? true : false;
> > > +	ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > > +			  sizeof(req), NULL, 0);
> > 
> > Use a full 100 columns.
> > 
> 
> Hmm, I found the style guide actually strongly prefer 80:
> https://www.kernel.org/doc/html/v6.14/process/coding-style.html#breaking-long-lines-and-strings

I don't think it is a strong recommendation anymore.
The hwmon core also doesn't seem to be religious about it.

> > > +	if (ret < 0)
> > > +		return ret;
> > > +	return 0;
> > > +}
> > > +

<snip>

> > > +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> > > +{
> > > +	const struct cros_ec_hwmon_platform_priv *platform_priv =
> > > +		dev_get_drvdata(&pdev->dev);
> > > +	const struct cros_ec_hwmon_priv *priv =
> > > +		dev_get_drvdata(platform_priv->hwmon_dev);
> > > +	size_t i;
> > > +	int ret;
> > > +
> > > +	if (!priv->fan_control_supported)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * EC sets fan control to auto after suspended, restore settings to
> > > +	 * before suspended.
> > > +	 */
> > > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > > +		if (!(priv->manual_fans & BIT(i)))
> > > +			continue;
> > 
> > Given that we can read the actual state from the EC I'd prefer to read
> > it back and store it during suspend() instead of storing it during write().
> > 
> 
> Do you mean reading fan mode and fan PWM value during suspend, or we will keep
> updating `manual_fans` while write(), and do not cache the PWM value while
> write()? That involves whether we need to send a get fan mode for every write
> PWM value.

This one:
"reading fan mode and fan PWM value during suspend"

> > > +
> > > +		/*
> > > +		 * Setting fan PWM value to EC will change the mode to manual
> > > +		 * for that fan in EC as well, so we do not need to issue a
> > > +		 * separate fan mode to manual call.
> > > +		 */
> > > +		ret = cros_ec_hwmon_write_pwm_value(
> > > +			priv->cros_ec, i, priv->manual_fan_pwm_values[i]);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > >  }

<snip>
