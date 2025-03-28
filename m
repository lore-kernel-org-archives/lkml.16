Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DB46426;
	Fri, 28 Mar 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178552; cv=none; b=YXY6GvAUn4FbSegDbicBeFhhWF9IYYGKkhasdOu9DY1TBPGmGCjadD3WicTQZ45s6nubpoxsvvQx5IOgRJDylKIM8xuK2eadOPoL04bL5WruEhC/lHeaxs+AjSCI0adTYMRXFT5In1vv7qGkbhEbZ86VbhutkmGGOzUB2yllnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178552; c=relaxed/simple;
	bh=uKxa3Yq2HcQS7C0/hj9FSfADyVJrr2UQ2qpySno2zt8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JVip/Xw+xCLtKAhmbSicNaQnJpfu4roGcEEbvTt5cFyKldZupyWb2r/ep8k3YdGMlykmnZ1GDAB8iNQ0Ud8PuSrDWAqfZYRLPhlNtFiJy91b8Bn+wj9OAIfL1bSNvih/S0udeisUsh73E9XWjDnFBWuhO2O9aQQgWwJF35mxQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4RyW7bV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4RyW7bV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743178551; x=1774714551;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uKxa3Yq2HcQS7C0/hj9FSfADyVJrr2UQ2qpySno2zt8=;
  b=a4RyW7bVCAE8lo/+f3JFRck0D2BXsVmy+p0P7hqhNwkpZ0/Y1iaDZJ1i
   Yo4yViqM5G/n22fF/C2++nub75cmrIJWs9l9EfPK21/JNoiV/K/qS5JQR
   i9SClOVvgciT0CLZx/d0MTVhGMvTtbXOB4D1c9YzMamPImThImt5am/Vv
   JZnJbAvp36mauY7lDsIlQVANnSW1zRfNruE2WADReTsTjDEJBs/KaKmwz
   5sPrOk3gPC6WBazXFVoklyvrFoNscXf5GxTdvvYVahgV8ayn+yXiM93Hw
   Ixsb9Y1V0bVGmKJF0QB1ZTGhoZFNW14CNipToCw72KqQAfJQZaTjz4gvK
   Q==;
X-CSE-ConnectionGUID: RE41Gir1Rv+JMNgwoSESsw==
X-CSE-MsgGUID: NeWQQq6fSfycwFDlVxaKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55922142"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55922142"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:15:50 -0700
X-CSE-ConnectionGUID: MXTHKgVASh2cu/DsXOGhtQ==
X-CSE-MsgGUID: MR5cI2iXT2KH3p6sB6YU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126302624"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:15:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 18:15:43 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 08/12] platform/x86: alienware-wmi-wmax: Add support
 for manual fan control
In-Reply-To: <20250313-hwm-v6-8-17b57f787d77@gmail.com>
Message-ID: <d1e2acaa-7f9b-acda-5fd2-6ea0bd56170e@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-8-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Kurt Borja wrote:

> All models with the "AWCC" WMAX device support a way of manually
> controlling fans.
> 
> The PWM duty cycle of a fan can't be controlled directly. Instead the
> AWCC interface let's us tune a fan `boost` value, which has the
> following empirically discovered, aproximate behavior over the PWM

approximate

> value:
> 
> 	pwm = pwm_base + (fan_boost / 255) * (pwm_max - pwm_base)
> 
> Where the pwm_base is the locked PWM value controlled by the FW and
> fan_boost is a value between 0 and 255.
> 
> Expose this fan_boost knob as a custom HWMON attribute.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: linux-hwmon@vger.kernel.org
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 174 ++++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index 0c30ffb6091a15d81f4dc959dfd28417249d3dda..823b579260555085ef6ac793b806738a756bb9da 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -13,8 +13,12 @@
>  #include <linux/bits.h>
>  #include <linux/dmi.h>
>  #include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/kstrtox.h>
> +#include <linux/minmax.h>
>  #include <linux/moduleparam.h>
>  #include <linux/platform_profile.h>
> +#include <linux/pm.h>
>  #include <linux/units.h>
>  #include <linux/wmi.h>
>  #include "alienware-wmi.h"
> @@ -181,10 +185,12 @@ enum AWCC_THERMAL_INFORMATION_OPERATIONS {
>  	AWCC_OP_GET_FAN_MIN_RPM			= 0x08,
>  	AWCC_OP_GET_FAN_MAX_RPM			= 0x09,
>  	AWCC_OP_GET_CURRENT_PROFILE		= 0x0B,
> +	AWCC_OP_GET_FAN_BOOST			= 0x0C,
>  };
>  
>  enum AWCC_THERMAL_CONTROL_OPERATIONS {
>  	AWCC_OP_ACTIVATE_PROFILE		= 0x01,
> +	AWCC_OP_SET_FAN_BOOST			= 0x02,
>  };
>  
>  enum AWCC_GAME_SHIFT_STATUS_OPERATIONS {
> @@ -248,6 +254,7 @@ struct awcc_fan_data {
>  	const char *label;
>  	u32 min_rpm;
>  	u32 max_rpm;
> +	u8 suspend_cache;
>  	u8 id;
>  };
>  
> @@ -628,6 +635,18 @@ static inline int awcc_op_get_temperature(struct wmi_device *wdev, u8 temp_id, u
>  	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
>  }
>  
> +static inline int awcc_op_get_fan_boost(struct wmi_device *wdev, u8 fan_id, u32 *out)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = AWCC_OP_GET_FAN_BOOST,
> +		.arg1 = fan_id,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
> +}
> +
>  static inline int awcc_op_get_current_profile(struct wmi_device *wdev, u32 *out)
>  {
>  	struct wmax_u32_args args = {
> @@ -653,6 +672,19 @@ static inline int awcc_op_activate_profile(struct wmi_device *wdev, u8 profile)
>  	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
>  }
>  
> +static inline int awcc_op_set_fan_boost(struct wmi_device *wdev, u8 fan_id, u8 boost)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = AWCC_OP_SET_FAN_BOOST,
> +		.arg1 = fan_id,
> +		.arg2 = boost,
> +		.arg3 = 0,
> +	};
> +	u32 out;
> +
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
> +}
> +
>  /*
>   * HWMON
>   *  - Provides temperature and fan speed monitoring as well as manual fan
> @@ -817,6 +849,81 @@ static const struct hwmon_chip_info awcc_hwmon_chip_info = {
>  	.info = awcc_hwmon_info,
>  };
>  
> +static ssize_t fan_boost_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +	int index = to_sensor_dev_attr(attr)->index;
> +	struct awcc_fan_data *fan = priv->fan_data[index];
> +	u32 boost;
> +	int ret;
> +
> +	ret = awcc_op_get_fan_boost(priv->wdev, fan->id, &boost);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", boost);
> +}
> +
> +static ssize_t fan_boost_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +	int index = to_sensor_dev_attr(attr)->index;
> +	struct awcc_fan_data *fan = priv->fan_data[index];
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = awcc_op_set_fan_boost(priv->wdev, fan->id, clamp_val(val, 0, 255));
> +
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(fan1_boost, fan_boost, 0);
> +static SENSOR_DEVICE_ATTR_RW(fan2_boost, fan_boost, 1);
> +static SENSOR_DEVICE_ATTR_RW(fan3_boost, fan_boost, 2);
> +static SENSOR_DEVICE_ATTR_RW(fan4_boost, fan_boost, 3);
> +static SENSOR_DEVICE_ATTR_RW(fan5_boost, fan_boost, 4);
> +static SENSOR_DEVICE_ATTR_RW(fan6_boost, fan_boost, 5);
> +
> +static umode_t fan_boost_attr_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return n < priv->fan_count ? attr->mode : 0;
> +}
> +
> +static bool fan_boost_group_visible(struct kobject *kobj)
> +{
> +	return true;
> +}
> +
> +DEFINE_SYSFS_GROUP_VISIBLE(fan_boost);
> +
> +static struct attribute *fan_boost_attrs[] = {
> +	&sensor_dev_attr_fan1_boost.dev_attr.attr,
> +	&sensor_dev_attr_fan2_boost.dev_attr.attr,
> +	&sensor_dev_attr_fan3_boost.dev_attr.attr,
> +	&sensor_dev_attr_fan4_boost.dev_attr.attr,
> +	&sensor_dev_attr_fan5_boost.dev_attr.attr,
> +	&sensor_dev_attr_fan6_boost.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group fan_boost_group = {
> +	.attrs = fan_boost_attrs,
> +	.is_visible = SYSFS_GROUP_VISIBLE(fan_boost),
> +};
> +
> +static const struct attribute_group *awcc_hwmon_groups[] = {
> +	&fan_boost_group,
> +	NULL
> +};
> +
>  static int awcc_hwmon_temps_init(struct wmi_device *wdev)
>  {
>  	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
> @@ -954,12 +1061,56 @@ static int awcc_hwmon_init(struct wmi_device *wdev)
>  	if (ret)
>  		return ret;
>  
> -	priv->hwdev = devm_hwmon_device_register_with_info(&wdev->dev, "alienware_wmi", priv,
> -							   &awcc_hwmon_chip_info, NULL);
> +	priv->hwdev = devm_hwmon_device_register_with_info(&wdev->dev, "alienware_wmi",
> +							   priv, &awcc_hwmon_chip_info,
> +							   awcc_hwmon_groups);
>  
>  	return PTR_ERR_OR_ZERO(priv->hwdev);
>  }
>  
> +static void awcc_hwmon_suspend(struct device *dev)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +	struct awcc_fan_data *fan;
> +	unsigned int i;
> +	u32 boost;
> +	int ret;
> +
> +	for (i = 0; i < priv->fan_count; i++) {
> +		fan = priv->fan_data[i];
> +
> +		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_FAN_BOOST,
> +					       fan->id, &boost);
> +		if (ret)
> +			dev_err(dev, "Failed to store Fan %u boost while suspending\n", i);
> +
> +		fan->suspend_cache = ret ? 0 : clamp_val(boost, 0, 255);
> +
> +		awcc_op_set_fan_boost(priv->wdev, fan->id, 0);
> +		if (ret)
> +			dev_err(dev, "Failed to set Fan %u boost to 0 while suspending\n", i);
> +	}
> +}
> +
> +static void awcc_hwmon_resume(struct device *dev)
> +{
> +	struct awcc_priv *priv = dev_get_drvdata(dev);
> +	struct awcc_fan_data *fan;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < priv->fan_count; i++) {
> +		fan = priv->fan_data[i];
> +
> +		if (!fan->suspend_cache)
> +			continue;
> +
> +		ret = awcc_op_set_fan_boost(priv->wdev, fan->id, fan->suspend_cache);
> +		if (ret)
> +			dev_err(dev, "Failed to restore Fan %u boost while resuming\n", i);
> +	}
> +}
> +
>  /*
>   * Thermal Profile control
>   *  - Provides thermal profile control through the Platform Profile API
> @@ -1189,6 +1340,24 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
>  	return ret;
>  }
>  
> +static int wmax_wmi_suspend(struct device *dev)
> +{
> +	if (awcc->hwmon)
> +		awcc_hwmon_suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int wmax_wmi_resume(struct device *dev)
> +{
> +	if (awcc->hwmon)
> +		awcc_hwmon_resume(dev);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(wmax_wmi_pm_ops, wmax_wmi_suspend, wmax_wmi_resume);
> +
>  static const struct wmi_device_id alienware_wmax_device_id_table[] = {
>  	{ WMAX_CONTROL_GUID, NULL },
>  	{ },
> @@ -1199,6 +1368,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
>  	.driver = {
>  		.name = "alienware-wmi-wmax",
>  		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.pm = pm_sleep_ptr(&wmax_wmi_pm_ops),
>  	},
>  	.id_table = alienware_wmax_device_id_table,
>  	.probe = wmax_wmi_probe,
> 
> 

-- 
 i.

