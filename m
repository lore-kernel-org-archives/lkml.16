Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15881E5B60
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996430; cv=none; b=TIr8oiQqKlkIyqCi1bs329L4lSPyfpnPPCrWPvvFeHgPKl7CeXAFVwoMwO9qRls9PyIvM4MtW7beavn/eenZowIEOJoxArHccns9W0pSImsR/rFoTO8ohL08JTXmYbrCeZ9R/LICdOBYKwV6cmnlw6zNedoZWL3Gt88051KS0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996430; c=relaxed/simple;
	bh=P4+x6NoZcCvwuZBPUwYyTzdgD/onYYe/0/W1ovh2cMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcfRWwVojwgU1qz/hlprgoPh+VfclmiE9adt+re2/18zvOyxCkvGsfpGw8HRWtfy8FQRIICCA9YXDKNZC56dX0Cd43MAC3cJqTyTU6qCDJVLvI2fMLSsy8Wp9bjmS6yoVWstHcfFO9Qjzjo2uJzQRf+cngHy6AOsZ7EnwNaWDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YaJbvM7t; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YaJbvM7t"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af548cb1f83so7015535a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745996415; x=1746601215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPbWBpUufAJXRCgmaKFpZrO4OcIAyFXmLS3CM4L+aHA=;
        b=YaJbvM7tnD9rgXhut/mI0vfQ/vnvruVyHBtwGNEVcMJUam2ZXLJBK4MWUtDDgPoeVF
         m5JyDDkaT4jrKlBcrFzKNC/byyh+A1tYdvbuIW/tsnMFvbkWyVVT9gFg+vDnOIyN0C7M
         Ke199pp+vpfkOT4p5AGxR0B6EcjaaRdaKmvPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996415; x=1746601215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPbWBpUufAJXRCgmaKFpZrO4OcIAyFXmLS3CM4L+aHA=;
        b=p+GKhNS6qF+IJoQRWdXi1R4V9dNzD5A72EcKAT/gNnGkUAG4ZPkotwDzK/1Uj+p3Tf
         NCwuhErDMJ3WhCsTgvaRWvLKnDjlwjLEp+pK3u2oVSXgv+3k4Fig4CLzDd7V1JZOQJ+W
         YwixbrQ+fekxPUFu/ACOwjskj+ZXnKoWb9xRWaaGj7smp9u9XviT43jEjvGlssEo+nI9
         nvPjVvNlvJbv/P3zwSsF0BGu9kRKdmDOXIYHwwv2ZisrzuvVmiCRH3Hrpy77G5+NG9Bs
         JpnThjI/epicNlmBsDZgJCz+j45RVdWcb2yuGaPZnvwLZFJBR+vlSv+4U9naItJ3AY/K
         BkWg==
X-Forwarded-Encrypted: i=1; AJvYcCW3JTmoOq74GsSpZIIjocTrxI6whiw4dasu8MpQaaLrn0aoJwlrvVuZg8mBHiCGmxLAeZSW7xkDrqwOZCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY305l919GfdkvMprwMeLOCVcNofYUyzhVri0kZ6l8gfgvDYbC
	NEOfs+eY9BIIPRsrKNgOjH3UeAzBtYlHWin6TCmMGfovjDYVzZZzipyJ5jAT0A==
X-Gm-Gg: ASbGncvwHQ5MGtVmP3OIO8BOnKWtS7V66MynTVW6eUGF7iMsNYoEocob9Zp6SoSP205
	ZDHz15Nw89b+xqgCuBSpEUkzsv3s71CDZY+tyxjfb5/dNqUcX+PxMrWfl5E0tEOEygNISPDx4cr
	iI9KTNZxkvr2udda/OfMpAQ63yPHsnPLS/ilgVBQLmGpUUkn7G249HJpQmwx/y2JVV9f/I6AP5A
	53QC0zsGkYRsDzBAXrSmA7acOrxIRvKHJoIstgtznszqYjCDwxvsF266ejQLssj96ueu137jeNh
	LkIF5AOgUduz/M1M7fSLKS+aundxl3jsckw=
X-Google-Smtp-Source: AGHT+IEI7XaV7wr9U4vqotueCTCArwJVjrzvbJNJeXP+7i334Jq1qFsj65e9UxNCAlVo695BDp0z6g==
X-Received: by 2002:a05:6a20:c707:b0:1fd:f8eb:d232 with SMTP id adf61e73a8af0-20aa30d375amr2531224637.24.1745996414890;
        Wed, 30 Apr 2025 00:00:14 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:1b33:febc:11be:910c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a94d4dsm928301b3a.173.2025.04.30.00.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:00:14 -0700 (PDT)
Date: Wed, 30 Apr 2025 15:00:10 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aBHKepQx_drHfnp8@google.com>
Reply-To: @google.com
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-2-a8d9e3efbb1a@chromium.org>
 <0933ec48-9a4b-49d0-8670-50b6ff6433f5@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0933ec48-9a4b-49d0-8670-50b6ff6433f5@t-8ch.de>

On Tue, Apr 29, 2025 at 11:20:09PM +0200, Thomas Weißschuh wrote:
> On 2025-04-29 16:14:22+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Newer EC firmware supports controlling fans through host commands, so
> > adding corresponding implementations for controlling these fans in the
> > driver for other kernel services and userspace to control them.
> > 
> > The driver will first probe the supported host command versions (get and
> > set of fan PWM values, get and set of fan control mode) to see if the
> > connected EC fulfills the requirements of controlling the fan, then
> > exposes corresponding sysfs nodes for userspace to control the fan with
> > corresponding read and write implementations.
> > As EC will automatically change the fan mode to auto when the device is
> > suspended, the power management hooks are added as well to keep the fan
> > control mode and fan PWM value consistent during suspend and resume. As
> > we need to access the hwmon device in the power management hook, update
> > the driver by storing the hwmon device in the driver data as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |   5 +-
> >  drivers/hwmon/cros_ec_hwmon.c         | 237 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 237 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> > index 47ecae983bdbef4bfcafc5dd2fff3de039f77f8e..5b802be120438732529c3d25b1afa8b4ee353305 100644
> > --- a/Documentation/hwmon/cros_ec_hwmon.rst
> > +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> > @@ -23,4 +23,7 @@ ChromeOS embedded controller used in Chromebooks and other devices.
> >  
> >  The channel labels exposed via hwmon are retrieved from the EC itself.
> >  
> > -Fan and temperature readings are supported.
> > +Fan and temperature readings are supported. PWM fan control is also supported if
> > +the EC also supports setting fan PWM values and fan mode. Note that EC will
> > +switch fan control mode back to auto when suspended. This driver will restore
> > +the fan state before suspended.
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 9991c3fa020ac859cbbff29dfb669e53248df885..1139074d3eb003ee72bbe54a954647ced40f6d21 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -17,10 +17,17 @@
> >  
> >  #define DRV_NAME	"cros-ec-hwmon"
> >  
> > +struct cros_ec_hwmon_platform_priv {
> > +	struct device *hwmon_dev;
> > +};
> 
> This indirection is unnecessary and only introduces a bunch of churn.
> 

Thank you, after directly storing the `priv` with platform_set_drvdata(), we
do not need this. Will directly store the `priv` with platform_set_drvdata() and
remove these unused code in the v2 patch.

> > +
> >  struct cros_ec_hwmon_priv {
> >  	struct cros_ec_device *cros_ec;
> >  	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
> >  	u8 usable_fans;
> > +	bool fan_control_supported;
> > +	u8 manual_fans; /* bits to indicate whether the fan is set to manual */
> > +	u8 manual_fan_pwm_values[EC_FAN_SPEED_ENTRIES];
> >  };
> >  
> >  static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
> > @@ -36,6 +43,51 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_read_pwm_raw_value(struct cros_ec_device *cros_ec,
> > +					    u8 index, u8 *pwm_value)
> > +{
> > +	struct ec_params_pwm_get_fan_duty req = {
> > +		.fan_idx = index,
> > +	};
> > +	struct ec_response_pwm_get_fan_duty resp;
> > +	int ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_DUTY, &req,
> > +			      sizeof(req), &resp, sizeof(resp));
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*pwm_value = (u8)(le32_to_cpu(resp.percent));
> 
> Weird choice to store a percentage in a u32.
> 

Yes... that is to align with the existing `EC_CMD_PWM_SET_FAN_DUTY`.

> > +	return 0;
> > +}
> > +
> > +static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec,
> > +					u8 index, u8 *pwm_value)
> > +{
> > +	int ret = cros_ec_hwmon_read_pwm_raw_value(cros_ec, index, pwm_value);
> 
> The _raw_ function is unnecessary.
> 

This is to share with the `cros_ec_hwmon_cooling_get_cur_state`, and there is a
unit conversion needed, so extract the same process into a _raw_ function.

> > +
> > +	if (ret == 0)
> > +		*pwm_value = *pwm_value * 255 / 100;
> > +	return ret;
> > +}
> > +
> > +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec,
> > +					 u8 index, u8 *control_method)
> > +{
> > +	struct ec_params_auto_fan_ctrl_v2 req = {
> > +		.fan_idx = index,
> > +		.cmd = EC_AUTO_FAN_CONTROL_CMD_GET,
> > +	};
> > +	struct ec_response_auto_fan_control resp;
> > +	int ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > +			      sizeof(req), &resp, sizeof(resp));
> 
> Keep &foo and sizeof(foo) together on the same line please.
> 

This is automatically formatted by clang-format. I will keep it like this in the
v2 patch. If it is important for readablity, please share with me, and I will
update that in the v2 patch.

> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*control_method = (resp.is_auto) ? 2 : 1;
> 
> No need for braces.
> 

Will remove in the v2 patch.

> > +	return 0;
> > +}
> > +
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -76,6 +128,8 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> >  	int ret = -EOPNOTSUPP;
> >  	u16 speed;
> > +	u8 pwm_value;
> > +	u8 control_method;
> 
> These lines were sorted.
> 

Will sort these u8 variables in the v2 patch.

> >  	u8 temp;
> >  
> >  	if (type == hwmon_fan) {
> > @@ -92,6 +146,18 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			if (ret == 0)
> >  				*val = cros_ec_hwmon_is_error_fan(speed);
> >  		}
> > +	} else if (type == hwmon_pwm) {
> > +		if (attr == hwmon_pwm_enable) {
> > +			ret = cros_ec_hwmon_read_pwm_enable(
> > +				priv->cros_ec, channel, &control_method);
> > +			if (ret == 0)
> > +				*val = control_method;
> > +		} else if (attr == hwmon_pwm_input) {
> > +			ret = cros_ec_hwmon_read_pwm_value(priv->cros_ec,
> > +							   channel, &pwm_value);
> > +			if (ret == 0)
> > +				*val = pwm_value;
> > +		}
> >  	} else if (type == hwmon_temp) {
> >  		if (attr == hwmon_temp_input) {
> >  			ret = cros_ec_hwmon_read_temp(priv->cros_ec, channel, &temp);
> > @@ -124,6 +190,97 @@ static int cros_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > +static int cros_ec_hwmon_write_pwm_value(struct cros_ec_device *cros_ec,
> > +					     u8 index, u8 val)
> > +{
> > +	struct ec_params_pwm_set_fan_duty_v1 req = {
> > +		.percent = val,
> > +		.fan_idx = index,
> > +	};
> > +	int ret = cros_ec_cmd(cros_ec, 1, EC_CMD_PWM_SET_FAN_DUTY, &req,
> > +			      sizeof(req), NULL, 0);
> 
> Declare "int ret" above.
> 

Will update in v2 patch.

> > +
> > +	if (ret < 0)
> > +		return ret;
> > +	return 0;
> > +}
> > +
> > +static int cros_ec_hwmon_set_pwm_raw_value(struct cros_ec_hwmon_priv *priv,
> > +					   u8 index, u8 val)
> > +{
> > +	int ret;
> > +
> > +	if (!(priv->manual_fans & BIT(index)))
> > +		return -ECANCELED;
> 
> Weird error code.
> 

Hmm, do you have some error code suggestion? I think the idea here is we will
reject to write the PWM value if fan is not in manual mode, and I am not sure
what error suits for this (is -EPERM the one to use here?).

> > +
> > +	ret = cros_ec_hwmon_write_pwm_value(priv->cros_ec, index, val);
> > +	if (ret == 0)
> > +		priv->manual_fan_pwm_values[index] = val;
> > +	return ret;
> > +}
> > +
> > +static int cros_ec_hwmon_set_pwm_value(struct cros_ec_hwmon_priv *priv,
> > +				       u8 index, u8 val)
> > +{
> > +	return cros_ec_hwmon_set_pwm_raw_value(priv, index,
> > +					       (((uint32_t)val) * 100 / 255));
> 
> Use DIV_ROUND_CLOSEST() for division.
> 

Will update in v2 patch.

> > +}
> > +
> > +static int cros_ec_hwmon_write_pwm_enable(struct cros_ec_device *cros_ec,
> > +					  u8 index, u8 val)
> > +{
> > +	struct ec_params_auto_fan_ctrl_v2 req = {
> > +		.fan_idx = index,
> > +		.cmd = EC_AUTO_FAN_CONTROL_CMD_SET,
> 
> Swap the two lines above.
> 

Will update in v2 patch.

> > +	};
> > +	int ret;
> > +
> > +	/* No CROS EC supports no fan speed control */
> > +	if (val == 0)
> > +		return -EOPNOTSUPP;
> > +
> > +	req.set_auto = (val != 1) ? true : false;
> > +	ret = cros_ec_cmd(cros_ec, 2, EC_CMD_THERMAL_AUTO_FAN_CTRL, &req,
> > +			  sizeof(req), NULL, 0);
> 
> Use a full 100 columns.
> 

Hmm, I found the style guide actually strongly prefer 80:
https://www.kernel.org/doc/html/v6.14/process/coding-style.html#breaking-long-lines-and-strings

> > +	if (ret < 0)
> > +		return ret;
> > +	return 0;
> > +}
> > +
> > +static int cros_ec_hwmon_set_pwm_control_method(struct cros_ec_hwmon_priv *priv,
> > +						u8 index, u8 val)
> > +{
> > +	int ret = cros_ec_hwmon_write_pwm_enable(priv->cros_ec, index, val);
> > +
> > +	if (ret == 0) {
> > +		if (val == 1)
> > +			priv->manual_fans |= BIT(index);
> > +		else
> > +			priv->manual_fans &= ~BIT(index);
> > +	}
> > +	return ret;
> > +}
> > +
> > +static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > +			       u32 attr, int channel, long val)
> > +{
> > +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +
> > +	if (type == hwmon_pwm) {
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			return cros_ec_hwmon_set_pwm_value(priv, channel, val);
> > +		case hwmon_pwm_enable:
> > +			return cros_ec_hwmon_set_pwm_control_method(
> > +				priv, channel, val);
> 
> Given that these function directly implement the hwmon ABI the names
> should match:
> cros_ec_hwmon_write_pwm_input()
> cros_ec_hwmon_write_pwn_enable()
> 
> Also 100 columns. And everywhere else.
> 
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> >  static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> >  					u32 attr, int channel)
> >  {
> > @@ -132,6 +289,9 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
> >  	if (type == hwmon_fan) {
> >  		if (priv->usable_fans & BIT(channel))
> >  			return 0444;
> > +	} else if (type == hwmon_pwm && priv->fan_control_supported) {
> > +		if (priv->usable_fans & BIT(channel))
> 
> Move the test for priv->fan_control_supported into the inner if().
> 

Will update in v2 patch.

> > +			return 0644;
> >  	} else if (type == hwmon_temp) {
> >  		if (priv->temp_sensor_names[channel])
> >  			return 0444;
> > @@ -147,6 +307,11 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
> >  			   HWMON_F_INPUT | HWMON_F_FAULT,
> >  			   HWMON_F_INPUT | HWMON_F_FAULT,
> >  			   HWMON_F_INPUT | HWMON_F_FAULT),
> > +	HWMON_CHANNEL_INFO(pwm,
> > +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> > +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> >  	HWMON_CHANNEL_INFO(temp,
> >  			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
> >  			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
> > @@ -178,6 +343,7 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
> >  static const struct hwmon_ops cros_ec_hwmon_ops = {
> >  	.read = cros_ec_hwmon_read,
> >  	.read_string = cros_ec_hwmon_read_string,
> > +	.write = cros_ec_hwmon_write,
> >  	.is_visible = cros_ec_hwmon_is_visible,
> >  };
> >  
> > @@ -233,13 +399,35 @@ static void cros_ec_hwmon_probe_fans(struct cros_ec_hwmon_priv *priv)
> >  	}
> >  }
> >  
> > +static void
> > +cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_hwmon_priv *priv)
> > +{
> 
> Would look nicer by returning the result as bool.
> 

Will update in v2 patch.

> > +	int ret;
> > +
> > +	priv->fan_control_supported = false;
> > +
> > +	ret = cros_ec_get_cmd_versions(priv->cros_ec, EC_CMD_PWM_GET_FAN_DUTY);
> > +	if (ret < 0 || !(ret & EC_VER_MASK(0)))
> 
> Given that these versions are used in multiple places, a #define would
> be good.
> 

Will update in v2 patch.

> > +		return;
> > +
> > +	ret = cros_ec_get_cmd_versions(priv->cros_ec, EC_CMD_PWM_SET_FAN_DUTY);
> > +	if (ret < 0 || !(ret & EC_VER_MASK(1)))
> > +		return;
> > +
> > +	ret = cros_ec_get_cmd_versions(priv->cros_ec, EC_CMD_THERMAL_AUTO_FAN_CTRL);
> > +	if (ret < 0 || !(ret & EC_VER_MASK(2)))
> > +		return;
> > +
> > +	priv->fan_control_supported = true;
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
> >  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
> > +	struct cros_ec_hwmon_platform_priv *platform_priv;
> >  	struct cros_ec_hwmon_priv *priv;
> > -	struct device *hwmon_dev;
> >  	u8 thermal_version;
> >  	int ret;
> >  
> > @@ -251,6 +439,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	if (thermal_version == 0)
> >  		return -ENODEV;
> >  
> > +	platform_priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!platform_priv)
> > +		return -ENOMEM;
> > +
> >  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> >  		return -ENOMEM;
> > @@ -259,11 +451,47 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  
> >  	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
> >  	cros_ec_hwmon_probe_fans(priv);
> > +	cros_ec_hwmon_probe_fan_control_supported(priv);
> >  
> > -	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> > -							 &cros_ec_hwmon_chip_info, NULL);
> > +	platform_priv->hwmon_dev = devm_hwmon_device_register_with_info(
> > +		dev, "cros_ec", priv, &cros_ec_hwmon_chip_info, NULL);
> > +	dev_set_drvdata(dev, platform_priv);
> 
> platform_set_drvdata()/platform_get_drvdata()
> 

Will update in v2 patch.

> > -	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +	return PTR_ERR_OR_ZERO(platform_priv->hwmon_dev);
> > +}
> > +
> > +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> > +{
> > +	const struct cros_ec_hwmon_platform_priv *platform_priv =
> > +		dev_get_drvdata(&pdev->dev);
> > +	const struct cros_ec_hwmon_priv *priv =
> > +		dev_get_drvdata(platform_priv->hwmon_dev);
> > +	size_t i;
> > +	int ret;
> > +
> > +	if (!priv->fan_control_supported)
> > +		return 0;
> > +
> > +	/*
> > +	 * EC sets fan control to auto after suspended, restore settings to
> > +	 * before suspended.
> > +	 */
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->manual_fans & BIT(i)))
> > +			continue;
> 
> Given that we can read the actual state from the EC I'd prefer to read
> it back and store it during suspend() instead of storing it during write().
> 

Do you mean reading fan mode and fan PWM value during suspend, or we will keep
updating `manual_fans` while write(), and do not cache the PWM value while
write()? That involves whether we need to send a get fan mode for every write
PWM value.

> > +
> > +		/*
> > +		 * Setting fan PWM value to EC will change the mode to manual
> > +		 * for that fan in EC as well, so we do not need to issue a
> > +		 * separate fan mode to manual call.
> > +		 */
> > +		ret = cros_ec_hwmon_write_pwm_value(
> > +			priv->cros_ec, i, priv->manual_fan_pwm_values[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static const struct platform_device_id cros_ec_hwmon_id[] = {
> > @@ -274,6 +502,7 @@ static const struct platform_device_id cros_ec_hwmon_id[] = {
> >  static struct platform_driver cros_ec_hwmon_driver = {
> >  	.driver.name	= DRV_NAME,
> >  	.probe		= cros_ec_hwmon_probe,
> > +	.resume		= cros_ec_hwmon_resume,
> >  	.id_table	= cros_ec_hwmon_id,
> >  };
> >  module_platform_driver(cros_ec_hwmon_driver);
> > 
> > -- 
> > 2.49.0.901.g37484f566f-goog
> > 
> > 
