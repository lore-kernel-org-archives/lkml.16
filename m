Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE75680;
	Sun,  4 May 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746325378; cv=none; b=JpY+ta7YIahhWsZO+DjomnnShrlOHo1xWqzKIbgEi8s2Ck6wRSw+34YKUg2mkvtZo/QrO3rQ1HUUglZ+B69CpTzvoEyDKRAdlrij5VdQKYXolbdkUmifvHICx9pyLBZqr3LaRe0zMrevzcnrXrYwGgaI8rKcjHmYdQTPbNcugXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746325378; c=relaxed/simple;
	bh=DMeQBzxUPneDZt59tW15fO+p28JGVFNSd2yyyfyCxr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ob3X5TndN7HN4mWdUg1wbkot25wYVzKKfvngK0jlLYCEfwpGi+P6Er17jdp1MrGC4e2KwgQZdMJYd1ujaHCv9n+foXXPj1qaX9TQm+EAUPpHwGJs2h/EQpOPOrNS1ZdByfiwdoTtl0uEGsF+3jf7hS2GNUwq03DTXVmE88x6wZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XevA098f; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XevA098f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746325359; x=1746930159; i=w_armin@gmx.de;
	bh=xd0baFO6jLBZVfuNVYSCzQ7iKfN/QVHa20335XzIcHg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XevA098f4rvaAYD3LbNTbDUQGIDpOuZBV2jY6LE8IyiEKRLz09BMXUkel3TvoEMi
	 zm9toTz7jOvq072DwpTo0QFcyTD9EP74Y3/Z5aAh08BoUsYCsJ2i3NvBpBePT+2k/
	 cIDqJ8uIr6YHeM5oeT36I8tl/NXHTYciRvSrpTNQ2vQnCh4NoEw/vcQ2IRS60HBgV
	 aBTndFTdvoCbuMDFym49bOew4gNsguC1RcQTlaS5O636lUJerlCc2eYz5+dDcaF3C
	 se/0s77Gc10j+60e5VFRcso5wROCZ+9GtyN/8rSyjs1JtzwStb/KYG60YCfYqGQ1h
	 uljwlVhjTPV941DUOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hV5-1u7IGk0nDd-007J1V; Sun, 04
 May 2025 04:22:39 +0200
Message-ID: <1c32a321-db23-43df-938f-e8a01353ba02@gmx.de>
Date: Sun, 4 May 2025 04:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
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
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
 <20250503000142.1190354-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250503000142.1190354-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v8zAH6jA7/w73mps3Pfm1fmhynf4LGjiMY6U+ch5dd8jQq/nUfU
 LMwJojp+Q0muIreO93V1f+wAQT8Yg6rDqdgK/mEDelGl2H+ityzIVEipmVYzFa5BJtSFqGh
 yDBzFbqZUuI7uZdrgphts3yYbn2YFIi6UMZdp8N2nVqhBNfa1Pc7LjH6vxXXoHkO4p3SMmy
 C1cYsWqURmvw5Dsr7jMLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q1QLhW7uf74=;4X+k21SpfQd30qBj1UR2SyOFpxm
 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
 0zwWrqi2fGhyM=

Am 03.05.25 um 02:01 schrieb Derek J. Clark:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> --
> v7:
>   - Move spinlock into lwmi_gz_priv.
>   - Add scoped_guard at missing location.
>   - Move adding lwmi_gz_mode_call up in the series. While its only used
>     by lenovo-wmi-other, it doesn't depend on it.
>   - Return instead of assigning ret at end of probe.
>   - Fix typos.
> v6:
>   - Recache capabiltiy data on ACPI AC events to ensure accutare
>     max_value.
>   - Fix typos and rewordings from v5 review.
> v5:
>   - Return to cache at device initialization. On component bind, pass a
>     pointer to lenovo-wmi-other.
>   - Fixes from v4 review.
> v4:
>   - Make driver data a private struct, remove references from Other Mode
>     driver.
>   - Don't cache data at device initialization. Instead, on component bin=
d,
>     cache the data on a member variable of the Other Mode driver data
>     passed as a void pointer.
>   - Add header file for capdata01 structs.
>   - Add new struct to pass capdata01 array data and array length to Othe=
r
>     Mode.
> v3:
> - Add as component to lenovo-wmi-other driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> - Use list to get the lenovo_wmi_cd01_priv instance in
>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>    that will use it can pass a member of the struct for use in
>    container_of.
> ---
>   MAINTAINERS                                |   1 +
>   drivers/platform/x86/Kconfig               |  14 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 402 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h |  20 +
>   5 files changed, 438 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b22e41cc730..673535395ae8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13166,6 +13166,7 @@ F:	Documentation/wmi/devices/lenovo-wmi-gamezone=
.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
>   F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>   F:	drivers/platform/x86/lenovo-wmi-events.*
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.*
>   F:	drivers/platform/x86/lenovo-wmi-helpers.*
>  =20
>   LENOVO WMI HOTKEY UTILITIES DRIVER
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
> index 000000000000..7723041ed53b
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver.
> + *
> + * The GameZone WMI interface provides platform profile and fan curve s=
ettings
> + * for devices that fall under the "Gaming Series" of Lenovo Legion dev=
ices.
> + *
> + * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/export.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +#include <linux/spinlock.h>
> +#include <linux/spinlock_types.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +#include "lenovo-wmi-helpers.h"
> +#include "lenovo-wmi-other.h"
> +
> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SUP 43
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
> +#define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
> +
> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> +
> +struct lwmi_gz_priv {
> +	enum thermal_mode current_mode;
> +	struct notifier_block event_nb;
> +	struct notifier_block mode_nb;
> +	spinlock_t gz_mode_lock; /* current_mode RW lock */

Hi,

please drop the RW part of the comment or people might think this is a act=
ual RW-lock.

Other than that:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +	struct wmi_device *wdev;
> +	int extreme_supported;
> +	struct device *ppdev;
> +};
> +
> +struct quirk_entry {
> +	bool extreme_supported;
> +};
> +
> +static struct quirk_entry quirk_no_extreme_bug =3D {
> +	.extreme_supported =3D false,
> +};
> +
> +/**
> + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver notifi=
er.
> + *
> + * @nb: The notifier_block registered to lenovo-wmi-other driver.
> + * @cmd: The event type.
> + * @data: Thermal mode enum pointer pointer for returning the thermal m=
ode.
> + *
> + * For LWMI_GZ_GET_THERMAL_MODE, retrieve the current thermal mode.
> + *
> + * Return: Notifier_block status.
> + */
> +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long c=
md,
> +			     void *data)
> +{
> +	enum thermal_mode **mode =3D data;
> +	struct lwmi_gz_priv *priv;
> +
> +	priv =3D container_of(nb, struct lwmi_gz_priv, mode_nb);
> +
> +	switch (cmd) {
> +	case LWMI_GZ_GET_THERMAL_MODE:
> +		scoped_guard(spinlock, &priv->gz_mode_lock) {
> +			**mode =3D priv->current_mode;
> +		}
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
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
> +		scoped_guard(spinlock, &priv->gz_mode_lock) {
> +			priv->current_mode =3D *mode;
> +		}
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
> +	guard(spinlock)(&priv->gz_mode_lock);
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
> +	guard(spinlock)(&priv->gz_mode_lock);
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
> + * Anything version 5 or lower does not. For devices with a version 6 o=
r
> + * greater do a DMI check, as some devices report a version that suppor=
ts
> + * extreme mode but have an incomplete entry in the BIOS. To ensure thi=
s
> + * cannot be set, quirk them to prevent assignment.
> + *
> + * Return: bool.
> + */
> +static bool lwmi_gz_extreme_supported(int profile_support_ver)
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
> +	priv->ppdev =3D devm_platform_profile_register(&wdev->dev, "lenovo-wmi=
-gamezone",
> +						     priv, &lwmi_gz_platform_profile_ops);
> +
> +	if (IS_ERR(priv->ppdev))
> +		return -ENODEV;
> +
> +	spin_lock_init(&priv->gz_mode_lock);
> +
> +	ret =3D lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;
> +
> +	priv->event_nb.notifier_call =3D lwmi_gz_event_call;
> +	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb)=
;
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
> index 000000000000..6b163a5eeb95
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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
