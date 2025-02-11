Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8025EFB7;
	Tue, 11 Feb 2025 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292973; cv=none; b=WQvJvCqKT92kOAHU7mkv0H1xDEMvL27dQazXgU+aypldqiBH7Ia/9IBhZqBgOuhsVRuEbuVbZxj66n7uVzeOKWSbaXtVEMs32CpotLIEDQQUci19gfog6aM/XQYIQbuE6ez46lQ3OI3Ghi/Vr7s3QKoNpwZzJo4vRxoTsH5JHYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292973; c=relaxed/simple;
	bh=Ya5fERreyqjJpMNsfWgSRJlESwIvy7KB9yPMXe/VSRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6jObh4vtchTmrcNeoyRenTyhLt4nrRgh9m5sIGHV0GxvaEyCdyirM/dFwo2vJTN62/cc3d3218FwyeyWx4YCZe6GORKtSccUyPXUc54YOn8clCfreYpvfmZObyVeBEhqwJLSzcvXIqszqdrMHSdkUV3/HKHJVaZ6TaR0OXkvkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwfKAFwm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwfKAFwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292972; x=1770828972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ya5fERreyqjJpMNsfWgSRJlESwIvy7KB9yPMXe/VSRs=;
  b=RwfKAFwm7Z2mB212hjSwNKOx+1DRiGTWi4f/DudgbOkEoc2attSBu94f
   Asi9MuZ1Pyu8iv+Iv6IpghgZjw/JoZkanOriYQZz8zy63WSi4A6/A4FMa
   1oO4yXW51tYWBvRk1zBlD+hMDtr4fa3+c0OEij+t19i8nWcalG5xl/CyL
   RZhLNPov98+TL4HnVrNe6Q0RaobW9rCDm7STxekF7KCTnLavdGvEK+VJn
   cDqnZ+Ql/vtcnTzCeN5yok/L8rYPWuRrejiAKPGNi1UxHsTS7QDPuw0/Z
   jOJovUTq8DJbgt3hbO75JgoNSiev0/wh2aB/mXM4EGkEsq0/gcMsUPWj1
   A==;
X-CSE-ConnectionGUID: YB2Q3YYOTIOqFkwM4qL2fg==
X-CSE-MsgGUID: fyrE0uOTSFWehdMI6APFGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40042259"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40042259"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:56:11 -0800
X-CSE-ConnectionGUID: L3T3ck/jRMW8V05RHsb7bg==
X-CSE-MsgGUID: GXstCuFJT2OkJsIcN+1+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149754557"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 08:56:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C0D048F; Tue, 11 Feb 2025 18:56:07 +0200 (EET)
Date: Tue, 11 Feb 2025 18:56:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 11/14] platform/x86: Split the alienware-wmi driver
Message-ID: <Z6uBJ9AC5XgZTlJG@black.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-12-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207154610.13675-12-kuurtb@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 10:46:07AM -0500, Kurt Borja wrote:
> Split alienware-wmi WMI drivers into different files. This is done
> seamlessly by copying and pasting, however some blocks are reordered.

...

>  obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
>  alienware-wmi-objs			:= alienware-wmi-base.o
> +alienware-wmi-y				+= alienware-wmi-legacy.o
> +alienware-wmi-y				+= alienware-wmi-wmax.o

Oh my... it's even inconsistent!

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/wmi.h>

Too little headers are being included. At very quick glance a dozen
or so is missing...

> +#include "alienware-wmi.h"

...

> +static struct attribute *hdmi_attrs[] = {
> +	&dev_attr_cable.attr,
> +	&dev_attr_source.attr,
> +	NULL,

No comma in the terminator entry.

> +};

...

> +static struct attribute *amplifier_attrs[] = {
> +	&dev_attr_status.attr,
> +	NULL,
> +};

Ditto.

...

> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args in_args = {
> +		.arg = 0,
> +	};
> +	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
> +	if (!ret) {
> +		if (out_data == 0)
> +			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> +		else if (out_data == 1)
> +			return sysfs_emit(buf, "disabled [s5] s5_s4\n");
> +		else if (out_data == 2)
> +			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");

The whole code inherited same issues like redundant 'else'. Please, refactor.

> +	}
> +
> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
> +	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
> +}

...

> +static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> +	struct wmax_basic_args args;
> +	int ret;
> +
> +	if (strcmp(buf, "disabled\n") == 0)
> +		args.arg = 0;
> +	else if (strcmp(buf, "s5\n") == 0)
> +		args.arg = 1;
> +	else
> +		args.arg = 2;

sysfs_match_string()

> +	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> +				    &args, sizeof(args), NULL);
> +	if (!ret)
> +		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
> +
> +	return count;
> +}

> +

Redundant blank line.

> +static DEVICE_ATTR_RW(deepsleep);

...

> +static struct attribute *deepsleep_attrs[] = {
> +	&dev_attr_deepsleep.attr,
> +	NULL,

No comma.

> +};

...

> +	if ((code & WMAX_THERMAL_TABLE_MASK) == WMAX_THERMAL_TABLE_USTT &&
> +	    (code & WMAX_THERMAL_MODE_MASK) <= THERMAL_MODE_USTT_LOW_POWER)
> +		return true;
> +
> +	return false;

	return ...

but if you wish, this one is okay.

...

> +static int thermal_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	enum platform_profile_option profile;
> +	struct awcc_priv *priv = drvdata;
> +	enum wmax_thermal_mode mode;
> +	u8 sys_desc[4];
> +	u32 first_mode;
> +	u32 out_data;
> +	int ret;
> +
> +	ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_SYS_DESCRIPTION,
> +				       0, (u32 *) &sys_desc);

How do you guarantee an alignment? Yes, it might be good for the specific
hardware, but in general this is broken code.

> +	if (ret < 0)
> +		return ret;
> +
> +	first_mode = sys_desc[0] + sys_desc[1];

> +	for (u32 i = 0; i < sys_desc[3]; i++) {

Why u32? unsigned int looks more natural here.

> +		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
> +					       i + first_mode, &out_data);
> +
> +		if (ret == -EIO)
> +			return ret;
> +
> +		if (ret == -EBADRQC)
> +			break;
> +
> +		if (!is_wmax_thermal_code(out_data))
> +			continue;
> +
> +		mode = out_data & WMAX_THERMAL_MODE_MASK;
> +		profile = wmax_mode_to_platform_profile[mode];
> +		priv->supported_thermal_profiles[profile] = out_data;

> +		set_bit(profile, choices);

Do you need it to be atomic?

> +	}
> +
> +	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
> +		return -ENODEV;
> +
> +	if (awcc->gmode) {
> +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> +			WMAX_THERMAL_MODE_GMODE;
> +
> +		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	}
> +
> +	return 0;
> +}

...

> +static const struct wmi_device_id alienware_wmax_device_id_table[] = {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },

No comma.

> +};

...

> +int __init alienware_wmax_wmi_init(void)
> +{
> +	const struct dmi_system_id *id;
> +
> +	id = dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc = id->driver_data;
> +
> +	if (force_platform_profile) {
> +		if (!awcc)
> +			awcc = &empty_quirks;
> +
> +		awcc->pprof = true;
> +	}
> +
> +	if (force_gmode) {
> +		if (awcc)
> +			awcc->gmode = true;
> +		else
> +			pr_warn("force_gmode requires platform profile support\n");
> +	}
> +
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}

Why not moving these boilerplate to ->probe() and use module_wmi_driver()?

-- 
With Best Regards,
Andy Shevchenko


