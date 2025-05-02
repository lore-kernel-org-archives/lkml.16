Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDBA14C5AF;
	Fri,  2 May 2025 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746152822; cv=none; b=kbW5xIrpigpGRdNf+g3YeI9y6o1ucwPPBdYuvLDSLL9VYBN8Bw0dyPaSYxahUmCIPVfd31jFNW4yPJVUiVxXm0KuuhlA2NhrmJrPO8STGOgDzeWESE/oJzLBNR/41WTvQ6R6BUb4v805LPR2GI8qTfqmidcYjPLUfEi4dkY0chs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746152822; c=relaxed/simple;
	bh=VLDcMMos4Rk7ZecqeQxDXJKrYl1cdv/Z1KK7H1hZl9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvT1umPuvsuTkyR25kHmO9+OIAW9UUs4juC2NFfYes33Uhtj80bB+V7E+deXSDnzzmauLrzQP5PZSxg1xrwSrm7Q2LY/Ac/QBMomvb0L+ClIcHQGbSn01mt4VdVy8GwmCsiNiClPZDkbQpGZm4NbVH6hZ+xv7TH6HEkWyCjxjl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Zj5s7Za6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Zj5s7Za6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746152804; x=1746757604; i=w_armin@gmx.de;
	bh=7XCb3gCs5DuWxXEXKmfgWZdfWOQ+l3QhbeGRSeHm0Ak=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zj5s7Za6NCsPr2Krvha4RPS1/Lp3puh1akPakQNkv3lGi25XJYvSzOgtaT9O8D3O
	 v/CCtIYrdVjpNSbQJLU8IvK5BgwGo7cQZuIH1i1dq+fuALieVOXpK5Mke8RlAzYE5
	 CEbN9PxwVBTFLdP8TyMCYgg0spJCcZBI1ptzhOtmxmnYCMIbeCqaUazESZ7/fFQsL
	 h6rFgZFFssTCLKugjLRjVlibfNNBW1/BztBF3uvORjK2b977EDvYnKQzHWsP5CqUV
	 q+yFrH+j2kZp5/I+KxUVFefxHyYV3lNSvVxVfWZF+axjZxsVfh3B2+GM35dZ+JPuY
	 RlVb4otL5E6fZOYnyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiaYJ-1ufLy03uNz-00qcvm; Fri, 02
 May 2025 04:26:44 +0200
Message-ID: <d9720968-a655-498c-b58a-850aa9d6c390@gmx.de>
Date: Fri, 2 May 2025 04:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250428012029.970017-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DmcvXuuXlXcuOnnnYhiuBW2c9aI+uHHLHHqQgcqNHc0NwQ8L5OG
 BPN0h/pfDB0HOlgwTMhsXJu+pKhTYpD1AN/lUjHSQrj8kSuYf8mSRSWW0QWkG44hzxhWVOy
 MePHmZazjuL+TRUj1LuZlz0hM0FPfXfFFG9lVAwwd87yxTaPf2p+e86OjLBkWvpGa08pZyk
 lP/GA3yPBvqaOKZq3m4og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yn9mtKu+LUw=;RvhT5/1fOZkQsw24J18MbNrOPCz
 +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
 kNUvHHndcNXbY=

Am 28.04.25 um 03:18 schrieb Derek J. Clark:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v6:
> - Switch to guard/scoped_guard instead of spin_lock/spin_unlock.
> - Fix typos and rewordings from v5 review.
> v5:
> - Move to patch 5 of the series and omit the portions of the driver that
>    rely on Other Mode.
> - Rename most defines to clearly indicate they are defined in this
>    driver.
> - Misc fixes from v4 review.
> v4:
> - Add notifier blocks for the Events and Other Mode drivers.
> - Remove notifier block chain head and all reference to Thermal Mode
>    Event GUID.
> - Add header for Gamezone specific structs and functions.
> - Various fixes from review.
> v3:
> - Use notifier chain to report platform profile changes to any
>    subscribed drivers.
> - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifier
>    chain.
> - Adds support for Extreme Mode profile on supported hardware, as well
>    as a DMI quirk table for some devices that report extreme mode versio=
n
>    support but so not have it fully implemented.
> - Update to include recent changes to platform-profile.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> - Remove GZ_WMI symbol exporting.
>   MAINTAINERS                                |   1 +
>   drivers/platform/x86/Kconfig               |  14 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 374 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h |  20 ++
>   5 files changed, 410 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b22e41cc730..511d7547fdd9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13167,6 +13167,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.rs=
t
>   F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>   F:	drivers/platform/x86/lenovo-wmi-events.*
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.*
>   F:	drivers/platform/x86/lenovo-wmi-helpers.*
>  =20
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 64663667f0cb..aaa1a69c10ca 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,20 @@ config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
>  =20
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	select ACPI_PLATFORM_PROFILE
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would li=
ke to use the
> +	  platform-profile firmware interface to manage power usage.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-gamezone.
> +
>   config LENOVO_WMI_DATA01
>   	tristate
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 7a35c77221b7..60058b547de2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380=
-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
>   obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>  =20
>   # Intel
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..713f7dbbabe2
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver.
> + *
> + * The GameZone WMI interface provides platform profile and fan curve s=
ettings
> + * for devices that fall under the "Gaming Series" of Lenovo Legion dev=
ices.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include "linux/cleanup.h"
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
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SUP 43
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
> +
> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> +static DEFINE_SPINLOCK(gz_mode_lock); /* lwmi_gz_priv.current_mode RW l=
ock */

Hi,

please move this mutex into the driver struct.

> +
> +struct lwmi_gz_priv {
> +	enum thermal_mode current_mode;
> +	struct notifier_block event_nb;
> +	struct notifier_block mode_nb;
> +	struct wmi_device *wdev;
> +	int extreme_supported;
> +	struct device *ppdev;
> +};
> +
> +struct quirk_entry {
> +	int extreme_supported;
> +};
> +
> +static struct quirk_entry quirk_no_extreme_bug =3D {
> +	.extreme_supported =3D false,
> +};
> +
> +/**
> + * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver noti=
fier.
> + * block call chain.
> + * @nb: The notifier_block registered to lenovo-wmi-events driver.
> + * @cmd: The event type.
> + * @data: The data to be updated by the event.
> + *
> + * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_pr=
ofile
> + * of a change.
> + *
> + * Return: notifier_block status.
> + */
> +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long =
cmd,
> +			      void *data)
> +{
> +	enum thermal_mode *mode =3D data;
> +	struct lwmi_gz_priv *priv;
> +
> +	priv =3D container_of(nb, struct lwmi_gz_priv, event_nb);
> +
> +	switch (cmd) {
> +	case LWMI_EVENT_THERMAL_MODE:
> +		scoped_guard(spinlock, &gz_mode_lock) {
> +			priv->current_mode =3D *mode;
> +		}
> +		platform_profile_notify(priv->ppdev);
> +		return NOTIFY_STOP;

Hi,

since this is the event call chain, i suggest you instead return NOTIFY_OK=
 so other
event consumers are still being called.

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
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_thermal_mode_supported(struct wmi_device *wdev,
> +					  int *supported)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUP=
,
> +				     0, 0, supported);
> +}
> +
> +/**
> + * lwmi_gz_thermal_mode_get() - Get the current thermal mode.
> + * @wdev: The Gamezone interface WMI device.
> + * @mode: Pointer to return the thermal mode with.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
> +				    enum thermal_mode *mode)
> +{
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_GET=
,
> +				     0, 0, mode);
> +}
> +
> +/**
> + * lwmi_gz_profile_get_get() - Get the current platform profile.
> + * @dev: the Gamezone interface parent device.
> + * @profile: Pointer to provide the current platform profile with.
> + *
> + * Call lwmi_gz_thermal_mode_get and convert the thermal mode into a pl=
atform
> + * profile based on the support level of the interface.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_profile_get(struct device *dev,
> +			       enum platform_profile_option *profile)
> +{
> +	struct lwmi_gz_priv *priv =3D dev_get_drvdata(dev);
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	ret =3D lwmi_gz_thermal_mode_get(priv->wdev, &mode);
> +	if (ret)
> +		return ret;
> +
> +	switch (mode) {
> +	case LWMI_GZ_THERMAL_MODE_QUIET:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_BALANCED:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		}
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_EXTREME:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case LWMI_GZ_THERMAL_MODE_CUSTOM:
> +		*profile =3D PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	guard(spinlock)(&gz_mode_lock);
> +	priv->current_mode =3D mode;
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_gz_profile_get_get() - Set the current platform profile.
> + * @dev: The Gamezone interface parent device.
> + * @profile: Pointer to the desired platform profile.
> + *
> + * Convert the given platform profile into a thermal mode based on the =
support
> + * level of the interface, then call the WMI method to set the thermal =
mode.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_profile_set(struct device *dev,
> +			       enum platform_profile_option profile)
> +{
> +	struct lwmi_gz_priv *priv =3D dev_get_drvdata(dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode =3D LWMI_GZ_THERMAL_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode =3D LWMI_GZ_THERMAL_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		mode =3D LWMI_GZ_THERMAL_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			mode =3D LWMI_GZ_THERMAL_MODE_EXTREME;
> +			break;
> +		}
> +		mode =3D LWMI_GZ_THERMAL_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	args.arg0 =3D mode;
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0,
> +				    LWMI_GZ_METHOD_ID_SMARTFAN_SET,
> +				    (u8 *)&args, sizeof(args), NULL);
> +	if (ret)
> +		return ret;
> +
> +	guard(spinlock)(&gz_mode_lock);
> +	priv->current_mode =3D mode;
> +
> +	return 0;
> +}
> +
> +static const struct dmi_system_id fwbug_list[] =3D {
> +	{
> +		.ident =3D "Legion Go 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +		},
> +		.driver_data =3D &quirk_no_extreme_bug,
> +	},
> +	{
> +		.ident =3D "Legion Go S 8APU1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +		},
> +		.driver_data =3D &quirk_no_extreme_bug,
> +	},
> +	{
> +		.ident =3D "Legion Go S 8ARP1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +		},
> +		.driver_data =3D &quirk_no_extreme_bug,
> +	},
> +	{},
> +
> +};
> +
> +/**
> + * lwmi_gz_extreme_supported() - Evaluate if a device supports extreme =
thermal mode.
> + * @profile_support_ver: Version of the WMI interface.
> + *
> + * Determine if the extreme thermal mode is supported by the hardware.
> + * Anything version 5 or lower does not. For devices wuth a version 6 o=
r
> + * greater do a DMI check, as some devices report a version that suppor=
ts
> + * extreme mode but have an incomplete entry in the BIOS. To ensure thi=
s
> + * cannot be set, quirk them to prevent assignment.
> + *
> + * Return: int.
> + */
> +static int lwmi_gz_extreme_supported(int profile_support_ver)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	struct quirk_entry *quirks;
> +
> +	if (profile_support_ver < 6)
> +		return false;
> +
> +	dmi_id =3D dmi_first_match(fwbug_list);
> +	if (!dmi_id)
> +		return true;
> +
> +	quirks =3D dmi_id->driver_data;
> +	return quirks->extreme_supported;
> +}
> +
> +/**
> + * lwmi_gz_platform_profile_probe - Enable and set up the platform prof=
ile
> + * device.
> + * @drvdata: Driver data for the interface.
> + * @choices: Container for enabled platform profiles.
> + *
> + * Determine if thermal mode is supported, and if so to what feature le=
vel.
> + * Then enable all supported platform profiles.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long =
*choices)
> +{
> +	struct lwmi_gz_priv *priv =3D drvdata;
> +	int profile_support_ver;
> +	int ret;
> +
> +	ret =3D lwmi_gz_thermal_mode_supported(priv->wdev, &profile_support_ve=
r);
> +	if (ret)
> +		return ret;
> +
> +	if (profile_support_ver < 1)
> +		return -ENODEV;
> +
> +	priv->extreme_supported =3D lwmi_gz_extreme_supported(profile_support_=
ver);
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
> +static const struct platform_profile_ops lwmi_gz_platform_profile_ops =
=3D {
> +	.probe =3D lwmi_gz_platform_profile_probe,
> +	.profile_get =3D lwmi_gz_profile_get,
> +	.profile_set =3D lwmi_gz_profile_set,
> +};
> +
> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_gz_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->ppdev =3D platform_profile_register(&wdev->dev,
> +						"lenovo-wmi-gamezone", priv,
> +						&lwmi_gz_platform_profile_ops);

Please use devm_platform_profile_register() instead. Otherwise you will le=
ak it in case of an error
in the remaining part of the probe function.

> +
> +	if (IS_ERR(priv->ppdev))
> +		return -ENODEV;
> +
> +	ret =3D lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;
> +
> +	priv->event_nb.notifier_call =3D lwmi_gz_event_call;
> +	ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb=
);
> +	if (ret)
> +		return ret;

Please return the result of devm_lwmi_events_register_notifier() directly.

Thanks,
Armin Wolf

> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_gz_id_table[] =3D {
> +	{ LENOVO_GAMEZONE_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_gz_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_gamezone",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_gz_id_table,
> +	.probe =3D lwmi_gz_probe,
> +	.no_singleton =3D true,
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
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.h
> new file mode 100644
> index 000000000000..75ef16bf0798
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
> +	LWMI_GZ_GET_THERMAL_MODE =3D 1,
> +};
> +
> +enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
> +	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
> +	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> +	LWMI_GZ_THERMAL_MODE_EXTREME =3D	   0xE0, /* Ver 6+ */
> +	LWMI_GZ_THERMAL_MODE_CUSTOM =3D	   0xFF,
> +};
> +
> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
