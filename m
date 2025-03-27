Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B41214A8C;
	Thu, 27 Mar 2025 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083775; cv=none; b=QhJTYWb8k4SOpGJrSteGbAVnXQ2IJP0Lv+Z/ZMPswrSn6GCN9MqhtnRGGpYKRxiqz/04Q+dpm+K2NApA/bVvHofMJ7dNyHP3Dxx6hkoLIOZdgtrlNhVUfn6PwALB9QFj8WzkwasX2R/xrH4ptkNba5WOiE1pHs+pqp8Xh3ErzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083775; c=relaxed/simple;
	bh=BsQ6/OfTgnuahBDvX2RaMILBqUUvW8kw0u7tAxd8gn0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rJCJh2smVjUoCOvkvWoRuQp6atlwmlVwDhn/HkZW/rIMmFdzfnlcYDqbnv/UYgp3NpMEHAo+Snl9pRieA93Zc+AjyJagU6aDxqixbHinEIGes2lJFyfnFIzgorEsEYt3ZY4m92Mz7kZ5S1TXeB9hP4Pq8klqD3qK61hO0nsWlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHBSW/jY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHBSW/jY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743083773; x=1774619773;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BsQ6/OfTgnuahBDvX2RaMILBqUUvW8kw0u7tAxd8gn0=;
  b=SHBSW/jYAEJMjWE4GFwKcvkzSuKRLCm5BkqGO7HW/p9lc9feCv8wIqoi
   Pt+oHlAw0TXJK9mKyPSruCFnOMln6bGeRLg8/kHmUOqQ0mBeljFhE7cAW
   P83xx6pMToDq1pZ8NVcdDVievbCh7zomb4IbEUlTsy+lt+I1bPWnmXnxy
   ODCBT1cdxaLksj1Mxeax3jV/YoTZ8ZGhlx64RWTS3ojWU4dxm7Wz5LRAP
   /OKzY8cV+8WDFeKQ5AgyKn8txp4T8s2ACdpVQRmySCB3FPvFcLyFQeBoB
   aiFEv6w4myvKECu3PY+nVWh2+T64XgFawSYrqachpA1of735As180+UW5
   A==;
X-CSE-ConnectionGUID: izGEGYKQSYmThWql3ZX4AA==
X-CSE-MsgGUID: vYAsAPvLTPWrmf7FssVJ7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43570516"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="43570516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:56:12 -0700
X-CSE-ConnectionGUID: k1La26QmRCuFBP0oqleXng==
X-CSE-MsgGUID: K/zetXaIRaGU1OF5Sl0Xtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130213248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:56:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Mar 2025 15:56:04 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI
 Driver
In-Reply-To: <20250317144326.5850-7-derekjohn.clark@gmail.com>
Message-ID: <be11f12b-d610-6130-180a-476d7958f2b9@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Mar 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

This has a few similar nits I flagged for the other patches but I won't 
mark them here again but please go through the patches to find similar 
cases.

> ---
> v4:
> - Add notifier blocks for the Events and Other Mode drivers.
> - Remove notifier block chain head and all reference to Thermal Mode
>   Event GUID.
> - Add header for Gamezone specific structs and functions.
> - Various fixes from review.
> v3:
> - Use notifier chain to report platform profile changes to any
>   subscribed drivers.
> - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifier
>   chain.
> - Adds support for Extreme Mode profile on supported hardware, as well
>   as a DMI quirk table for some devices that report extreme mode version
>   support but so not have it fully implemented.
> - Update to include recent changes to platform-profile.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>   reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> - Remove GZ_WMI symbol exporting.
> ---
>  MAINTAINERS                                |   2 +
>  drivers/platform/x86/Kconfig               |  13 +
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/lenovo-wmi-gamezone.c | 380 +++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
>  5 files changed, 414 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 87daee6075ad..0416afd997a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13168,6 +13168,8 @@ F:	drivers/platform/x86/lenovo-wmi-capdata01.c
>  F:	drivers/platform/x86/lenovo-wmi-capdata01.h
>  F:	drivers/platform/x86/lenovo-wmi-events.c
>  F:	drivers/platform/x86/lenovo-wmi-events.h
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.c
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.h
>  F:	drivers/platform/x86/lenovo-wmi-helpers.c
>  F:	drivers/platform/x86/lenovo-wmi-helpers.h
>  F:	drivers/platform/x86/lenovo-wmi-other.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index fc47604e37f7..ecf3246c8fda 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,19 @@ config LENOVO_WMI_HELPERS
>  	tristate
>  	depends on ACPI_WMI
>  
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	select ACPI_PLATFORM_PROFILE
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
> +	  platform-profile firmware interface to manage power usage.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-gamezone.
> +
>  config LENOVO_WMI_DATA01
>  	tristate
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c6ce3c8594b1..f3e64926a96b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>  obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
>  obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
>  obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>  obj-$(CONFIG_LENOVO_WMI_TUNING)	+= lenovo-wmi-other.o
>  
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..9d453a836227
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface provides
> + * platform profile and fan curve settings for devices that fall under the
> + * "Gaming Series" of Lenovo Legion devices.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/list.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +#include "lenovo-wmi-helpers.h"
> +#include "lenovo-wmi-other.h"
> +
> +/* Interface GUIDs */
> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +/* Method IDs */
> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> +
> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> +
> +struct lwmi_event_priv {
> +	enum thermal_mode current_mode;
> +	struct wmi_device *wdev;
> +	bool extreme_supported;
> +	struct device *ppdev; /*platform profile device */
> +	struct notifier_block event_nb;
> +	struct notifier_block mode_nb;
> +};
> +
> +struct quirk_entry {
> +	bool extreme_supported;
> +};
> +
> +static struct quirk_entry quirk_no_extreme_bug = {
> +	.extreme_supported = false,
> +};
> +
> +/* Notifier Methods */
> +/*
> + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other notifier
> + * block call chain. For THERMAL_MODE_EVENT, returns current_mode
> + *
> + * @nb: The notifier_block registered to lenovo-wmi-other
> + * @cmd: The event triggered by lenovo-wmi-other
> + * @data: The data to be returned by the event.
> + *
> + * Returns: notifier_block status.
> + */
> +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long cmd,
> +			     void *data)
> +{
> +	struct lwmi_event_priv *priv;
> +
> +	priv = container_of(nb, struct lwmi_event_priv, mode_nb);
> +	if (!priv)
> +		return NOTIFY_BAD;
> +
> +	switch (cmd) {
> +	case THERMAL_MODE_EVENT:
> +		*(enum thermal_mode *)data = priv->current_mode;
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +/*
> + * lwmi_gz_event_call() - Call method for lenovo-wmi-events notifier
> + * block call chain. For THERMAL_MODE_EVENT, sets current_mode and
> + * notifies platform_profile of a change.
> + *
> + * @nb: The notifier_block registered to lenovo-wmi-events
> + * @cmd: The event triggered by lenovo-wmi-events
> + * @data: The data to be updated by the event.
> + *
> + * Returns: notifier_block status.
> + */
> +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long cmd,
> +			      void *data)
> +{
> +	struct lwmi_event_priv *priv;
> +
> +	priv = container_of(nb, struct lwmi_event_priv, event_nb);
> +	if (!priv)
> +		return NOTIFY_BAD;
> +
> +	switch (cmd) {
> +	case THERMAL_MODE_EVENT:
> +		priv->current_mode = *((enum thermal_mode *)data);
> +		platform_profile_notify(&priv->wdev->dev);
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +/* Platform Profile Methods & Setup */
> +/*
> + * lwmi_gz_platform_profile_supported() - Gets the version of the WMI
> + * interface to determine the support level.
> + *
> + * @wdev: The Gamezone WMI device.
> + * @supported: Pointer to return the support level with.
> + *
> + * Returns: 0, or an error.
> + */
> +static int lwmi_gz_platform_profile_supported(struct wmi_device *wdev,
> +					      int *supported)
> +{
> +	return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP,
> +					0, 0, supported);
> +}
> +
> +/*
> + * lwmi_gz_thermal_mode_get() - Gets the currently set thermal mode from
> + * the Gamezone WMI interface.
> + *
> + * @wdev: The Gamezone WMI device.
> + * @mode: Pointer to return the thermal mode with.
> + *
> + * Returns: 0, or an error.
> + */
> +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
> +				    enum thermal_mode *mode)
> +{
> +	return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET,
> +					0, 0, mode);
> +}
> +
> +static int lwmi_gz_profile_get(struct device *dev,
> +			       enum platform_profile_option *profile)
> +{
> +	struct lwmi_event_priv *priv = dev_get_drvdata(dev);
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	ret = lwmi_gz_thermal_mode_get(priv->wdev, &mode);
> +	if (ret)
> +		return ret;
> +
> +	switch (mode) {
> +	case SMARTFAN_MODE_QUIET:
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case SMARTFAN_MODE_BALANCED:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case SMARTFAN_MODE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		}
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_EXTREME:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_CUSTOM:
> +		*profile = PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	priv->current_mode = mode;
> +
> +	return 0;
> +}
> +
> +static int lwmi_gz_profile_set(struct device *dev,
> +			       enum platform_profile_option profile)
> +{
> +	struct lwmi_event_priv *priv = dev_get_drvdata(dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode = SMARTFAN_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode = SMARTFAN_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		mode = SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			mode = SMARTFAN_MODE_EXTREME;
> +			break;
> +		}
> +		mode = SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		mode = SMARTFAN_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	args.arg0 = mode;
> +
> +	ret = lwmi_dev_evaluate_method(priv->wdev, 0x0,
> +				       WMI_METHOD_ID_SMARTFAN_SET,
> +				       (unsigned char *)&args, sizeof(args),
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
> +	priv->current_mode = mode;
> +
> +	return 0;
> +}
> +
> +static const struct dmi_system_id fwbug_list[] = {
> +	{
> +		.ident = "Legion Go 8APU1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +		},
> +		.driver_data = &quirk_no_extreme_bug,
> +	},
> +	{
> +		.ident = "Legion Go S 8ARP1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +		},
> +		.driver_data = &quirk_no_extreme_bug,
> +	},
> +	{
> +		.ident = "Legion Go S 8APU1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +		},
> +		.driver_data = &quirk_no_extreme_bug,
> +	},
> +	{},
> +
> +};
> +
> +/*
> + * extreme_supported() - Evaluate if a device supports extreme thermal mode.
> + * For devices that have a profile_support_ver of 6 or greater a DMI check
> + * is done. Some devices report a version that supports extreme mode but
> + * have an incomplete entry in the BIOS. To ensure this cannot be set, they
> + * are quirked to prevent assignment.
> + *
> + * @profile_support_ver: Version of WMI interface provided by
> + * lwmi_gz_platform_profile_supported.
> + *
> + * Returns: bool
> + */
> +static bool extreme_supported(int profile_support_ver)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	struct quirk_entry *quirks;
> +
> +	if (profile_support_ver < 6)
> +		return false;
> +
> +	dmi_id = dmi_first_match(fwbug_list);
> +	if (!dmi_id)
> +		return true;
> +
> +	quirks = dmi_id->driver_data;
> +	return quirks->extreme_supported;
> +}
> +
> +static int lwmi_platform_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct lwmi_event_priv *priv = drvdata;
> +	int profile_support_ver;
> +	int ret;
> +
> +	ret = lwmi_gz_platform_profile_supported(priv->wdev,
> +						 &profile_support_ver);
> +	if (ret)
> +		return ret;
> +
> +	if (profile_support_ver < 1)
> +		return -ENODEV;
> +
> +	priv->extreme_supported = extreme_supported(profile_support_ver);
> +
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> +
> +	if (priv->extreme_supported)
> +		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops lwmi_gz_platform_profile_ops = {
> +	.probe = lwmi_platform_profile_probe,
> +	.profile_get = lwmi_gz_profile_get,
> +	.profile_set = lwmi_gz_profile_set,
> +};
> +
> +/* Driver Methods */
> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_event_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->event_nb.notifier_call = lwmi_gz_event_call;
> +	ret = devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
> +	if (ret)
> +		return ret;
> +
> +	priv->mode_nb.notifier_call = lwmi_gz_mode_call;
> +	ret = devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
> +	if (ret)
> +		return ret;
> +
> +	priv->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->ppdev = platform_profile_register(&wdev->dev,
> +						"lenovo-wmi-gamezone", priv,
> +						&lwmi_gz_platform_profile_ops);
> +
> +	if (IS_ERR(priv->ppdev))
> +		return -ENODEV;
> +
> +	ret = lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_gz_id_table[] = { { LENOVO_GAMEZONE_GUID,
> +							   NULL },
> +							 {} };
> +
> +static struct wmi_driver lwmi_gz_driver = {
> +	.driver = {
> +		.name = "lenovo_wmi_gamezone",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = lwmi_gz_id_table,
> +	.probe = lwmi_gz_probe,
> +	.no_singleton = true,
> +};
> +
> +module_wmi_driver(lwmi_gz_driver);
> +
> +MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> +MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platform/x86/lenovo-wmi-gamezone.h
> new file mode 100644
> index 000000000000..ac536803160b
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#ifndef _LENOVO_WMI_GAMEZONE_H_
> +#define _LENOVO_WMI_GAMEZONE_H_
> +
> +enum thermal_mode {
> +	SMARTFAN_MODE_QUIET = 0x01,
> +	SMARTFAN_MODE_BALANCED = 0x02,
> +	SMARTFAN_MODE_PERFORMANCE = 0x03,
> +	SMARTFAN_MODE_EXTREME = 0xE0, /* Ver 6+ */
> +	SMARTFAN_MODE_CUSTOM = 0xFF,
> +};
> +
> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> 

Are these going the be used by other .c files?

-- 
 i.

