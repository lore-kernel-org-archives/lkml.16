Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17302063FD;
	Tue,  8 Apr 2025 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115734; cv=none; b=U0rmztpF7OTKiQTZfadE/dyo4/Lpjv86cA3QEm2BHYKzoJP9CXuTusLs4Jv3uJuU+DMh+6+4Sz3Kcrlb9wJkh+nDv0T7bfTYCwnPy38H1t+9sl8oQ5bYjAliB0ODi47JvEXFyuGr7aGMF8KdW2mhhsR5WjbrL0lnG386fUDD0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115734; c=relaxed/simple;
	bh=ML7TQJ+zoKl0iQwFjufWUQeR4Ua1lRE6VN6m6o5VIKg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PHfel+VEMHKNNTPyGXc3dSeF7NPJ4oDwUoLq+J1ZqTKK233tR1Rv2040ame3S2ZA4tBYr9IEBMRbkEXH1Ihs7HzR0v5bziVDF2bcxHNr5wHUcqhJSyfJNgwCs0SJetKgsuWhgphC6C/RMLmxdNfjGgb2uACFqTs4p0rz6/ufZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff8eKA81; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff8eKA81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744115731; x=1775651731;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ML7TQJ+zoKl0iQwFjufWUQeR4Ua1lRE6VN6m6o5VIKg=;
  b=Ff8eKA81C4LleOkXknmqUa5YRFiW5v78f4nN+WhaNv/EsHWjjb/LCV/K
   oY+ZS/4EOzvkhSq6ZOURh4lztnvjU0Ue5pxKKsuDsWtgutAVAllC6ncHS
   vmOlyy7MOLmNm2VKkbOSlWxn7Jezs+jkCP1JL7yn9rmwNJW5lKGhv3A8s
   sWAGOiR792UqvUpZ8vwqz9oV2ZwRaXTmC1d/t3F2tRKuN+tTHjnt3ABfy
   NtcxUquCawShVDvtBK+vfKbfNIx4igeesIbUobvkbwQQ28NwWdCFdz/C4
   uVRu5AT8PUnDaqD1hapuLMXjH/Srsqd8KR3VhVp+ACamP+fRl4kVrBPPF
   A==;
X-CSE-ConnectionGUID: 210o+SBGQ5i6h9zYUHDrzQ==
X-CSE-MsgGUID: uGAozeMYS2uBaVQltxsr0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44686978"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44686978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:35:17 -0700
X-CSE-ConnectionGUID: ygr9GRVMQZaVMK2o7D+DMQ==
X-CSE-MsgGUID: F9Z3paKtQJ+HMV6KgxbuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128770488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:35:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 15:35:08 +0300 (EEST)
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
Subject: Re: [PATCH v5 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
In-Reply-To: <20250408012815.1032357-6-derekjohn.clark@gmail.com>
Message-ID: <7bfef099-da51-abcb-8d12-5318bbd5053a@linux.intel.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com> <20250408012815.1032357-6-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Derek J. Clark wrote:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
> - Move to patch 5 of the series and omit the portions of the driver that
>   rely on Other Mode.
> - Rename most defines to clearly indicate they are defined in this
>   driver.
> - Misc fixes from v4 review.
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
>  drivers/platform/x86/Kconfig               |  14 +
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/lenovo-wmi-gamezone.c | 375 +++++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-gamezone.h |  20 ++
>  5 files changed, 412 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56ead241a053..49deb8ea4ea7 100644
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
>  
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 64663667f0cb..aaa1a69c10ca 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,20 @@ config LENOVO_WMI_HELPERS
>  	tristate
>  	depends on ACPI_WMI
>  
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	depends on DMI
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
> index 7a35c77221b7..60058b547de2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>  obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
>  obj-$(CONFIG_LENOVO_WMI_EVENTS)	+= lenovo-wmi-events.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
>  obj-$(CONFIG_LENOVO_WMI_HELPERS)	+= lenovo-wmi-helpers.o
>  
>  # Intel
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platform/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..2e6d5e7faadf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver.
> + *
> + * The GameZone WMI interface provides platform profile and fan curve settings
> + * for devices that fall under the "Gaming Series" of Lenovo Legion devices.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/export.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_profile.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +#include "lenovo-wmi-helpers.h"
> +
> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SUPP 43
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45

Align values.

> +
> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> +static DEFINE_SPINLOCK(gz_lock);

Please document that the lock is protecting.

> +
> +struct lwmi_gz_priv {
> +	enum thermal_mode current_mode;
> +	struct notifier_block event_nb;
> +	struct notifier_block mode_nb;
> +	struct wmi_device *wdev;
> +	bool extreme_supported;
> +	struct device *ppdev;
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
> +/**
> + * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver notifier.
> + * block call chain.
> + * @nb: The notifier_block registered to lenovo-wmi-events driver.
> + * @cmd: The event type.
> + * @data: The data to be updated by the event.
> + *
> + * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_profile
> + * of a change.
> + *
> + * Return: notifier_block status.
> + */
> +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long cmd,
> +			      void *data)
> +{
> +	enum thermal_mode *mode = data;
> +	struct lwmi_gz_priv *priv;
> +
> +	priv = container_of(nb, struct lwmi_gz_priv, event_nb);
> +
> +	switch (cmd) {
> +	case LWMI_EVENT_THERMAL_MODE:
> +		spin_lock(&gz_lock);
> +		priv->current_mode = *mode;
> +		spin_unlock(&gz_lock);

scoped_guard()

> +		platform_profile_notify(priv->ppdev);
> +		return NOTIFY_STOP;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +/**
> + * lwmi_gz_thermal_mode_supported() - Get the version of the WMI
> + * interface to determine the support level.
> + * @wdev: The Gamezone WMI device.
> + * @supported: Pointer to return the support level with.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_gz_thermal_mode_supported(struct wmi_device *wdev,
> +					  int *supported)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUPP,
> +				     0, 0, supported);
> +}
> +
> +/**
> + * lwmi_gz_thermal_mode_get() - Get the current thermal mode.
> + * @wdev: The Gamezone interface WMI device.
> + * @mode: Pointer to return the thermal mode with.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
> +				    enum thermal_mode *mode)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_GET,
> +				     0, 0, mode);
> +}
> +
> +/**
> + * lwmi_gz_profile_get_get() - Get the current platform profile.
> + * @dev: the Gamezone interface parent device.
> + * @profile: Pointer to provide the current platform profile with.
> + *
> + * Call lwmi_gz_thermal_mode_get and convert the thermal mode into a platform
> + * profile based on the support level of the interface.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_gz_profile_get(struct device *dev,
> +			       enum platform_profile_option *profile)
> +{
> +	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	ret = lwmi_gz_thermal_mode_get(priv->wdev, &mode);
> +	if (ret)
> +		return ret;
> +
> +	switch (mode) {
> +	case LWMI_GZ_THERMAL_MODE_QUIET:
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_BALANCED:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		}
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_EXTREME:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_CUSTOM:
> +		*profile = PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	spin_lock(&gz_lock);
> +	priv->current_mode = mode;
> +	spin_unlock(&gz_lock);
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_gz_profile_get_get() - Set the current platform profile.
> + * @dev: The Gamezone interface parent device.
> + * @profile: Pointer to the desired platform profile.
> + *
> + * Convert the given platform profile into a thermal mode based on the support
> + * level of the interface, then call the WMI method to set the thermal mode.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_gz_profile_set(struct device *dev,
> +			       enum platform_profile_option profile)
> +{
> +	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode = LWMI_GZ_THERMAL_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode = LWMI_GZ_THERMAL_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			mode = LWMI_GZ_THERMAL_MODE_EXTREME;
> +			break;
> +		}
> +		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	args.arg0 = mode;
> +
> +	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0,
> +				    LWMI_GZ_METHOD_ID_SMARTFAN_SET,
> +				    (unsigned char *)&args, sizeof(args), NULL);

It looks unsigned char is wrong type for this interface, u8 is the type 
to use for binary data.

> +	if (ret)
> +		return ret;
> +
> +	spin_lock(&gz_lock);
> +	priv->current_mode = mode;
> +	spin_unlock(&gz_lock);

These could use guard().

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
> +		.ident = "Legion Go S 8APU1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
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
> +	{},
> +
> +};
> +
> +/**
> + * extreme_supported() - Evaluate if a device supports extreme thermal mode.
> + * @profile_support_ver: Version of the WMI interface.
> + *
> + * Determine if the extreme thermal mode is supported by the hardware.
> + * Anything version 5 or lower does not. For devices wuth a version 6 or
> + * greater do a DMI check, as some devices report a version that supports
> + * extreme mode but have an incomplete entry in the BIOS. To ensure this
> + * cannot be set, quirk them to prevent assignment.
> + *
> + * Return: bool.
> + */
> +static bool extreme_supported(int profile_support_ver)

While it's probably guessable this is a driver specific function, I'd 
still add the prefix to the name.

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
> +/**
> + * lwmi_gz_platform_profile_probe - Enable and set up the platform profile
> + * device.
> + * @drvdata: Driver data for the interface.
> + * @choices: Container for enabled platform profiles.
> + *
> + * Determine if thermal mode is supported, and if so to what feature level.
> + * Then enable all supported platform profiles.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct lwmi_gz_priv *priv = drvdata;
> +	int profile_support_ver;
> +	int ret;
> +
> +	ret = lwmi_gz_thermal_mode_supported(priv->wdev, &profile_support_ver);
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
> +	.probe = lwmi_gz_platform_profile_probe,
> +	.profile_get = lwmi_gz_profile_get,
> +	.profile_set = lwmi_gz_profile_set,
> +};
> +
> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_gz_priv *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev = wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->ppdev = platform_profile_register(&wdev->dev,
> +						"lenovo-wmi-gamezone", priv,
> +						&lwmi_gz_platform_profile_ops);
> +
> +	if (IS_ERR(priv->ppdev))

Remove the empty line in between call and its error handling.

> +		return -ENODEV;
> +
> +	ret = lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;
> +
> +	priv->event_nb.notifier_call = lwmi_gz_event_call;
> +	ret = devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_gz_id_table[] = {
> +	{ LENOVO_GAMEZONE_GUID, NULL },
> +	{}
> +};
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
> +MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platform/x86/lenovo-wmi-gamezone.h
> new file mode 100644
> index 000000000000..1f8366b67b49
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_GAMEZONE_H_
> +#define _LENOVO_WMI_GAMEZONE_H_
> +
> +enum gamezone_events_type {
> +	LWMI_GZ_GET_THERMAL_MODE = 1,
> +};
> +
> +enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_QUIET = 0x01,
> +	LWMI_GZ_THERMAL_MODE_BALANCED = 0x02,
> +	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
> +	LWMI_GZ_THERMAL_MODE_EXTREME = 0xE0, /* Ver 6+ */
> +	LWMI_GZ_THERMAL_MODE_CUSTOM = 0xFF,

Please align values.

> +};
> +
> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
> 

-- 
 i.

