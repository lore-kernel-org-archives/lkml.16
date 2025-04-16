Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0433910E9;
	Wed, 16 Apr 2025 22:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843560; cv=none; b=rr1t59quaPm5WeLOASXvuf0fpn6SV1QfLZsvhIIuFltcDu7YQrFvRaTqw6BckBHoi0t0q+eemQjcjiHXl4onumaNC4oJ4/Zqluw1nkTbATWhuW1G1ua2zfbFqLHeaOCxZzUAP0GCUFHA6TEgwh4LOECTojD6JUrxJ+ojkEp/vF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843560; c=relaxed/simple;
	bh=GcS+0mK2FCyHR18EZxLUz3IhrH5guGf3taaygBu76e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4jPkEAr/Iy3meI5nzKjzKyK3ibzitC7AWr2FksvqsoYeMvh34cbgKse/tafHwOIThYtEg47x7Bu5SH46sK3Z3bpBpM3xaA08he6MX3mpYWK6ZkyHTTI29paZn/DvPqon4UnW3oejMOrvoT+EuQSjLknTdS7pqDdcGrVA9Ky+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tzIWB7w8; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tzIWB7w8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744843529; x=1745448329; i=w_armin@gmx.de;
	bh=40sFF6/W9835zOJH15nxUp2WXyaWGfQC0TulIOT4o20=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tzIWB7w8oPfEixqpnCiI5cWTHX3le/oY5uOheTfo83boEwVApiM1MQE6+jPIA/vZ
	 cOAHb1edAqQ0O6eddMMWj7gfoQpjXG3AVhomWvHrYKsMrGq++czeoc+45xNKt/Y9P
	 ELnn4z8T9Gz0ShQ/dwuCxpIiUruzeqOHFkjuCG84Nw9BwVe2Fk3siqeDMbIxKX30o
	 cGpnFZLayvWQAenApX5jiCbm6kgb3ZDbzaadikSSl2rH0etTFT3f8zEUhw4QuPb8m
	 gryNH7v97fX9IOEspfYlnZGB3NFm2wA4HibMiKjMki4VDGoO6/jspOTfkYlKHB/6K
	 s4QbzjpHt9Czv7qesg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7K3i-1uCsc90hIK-00AAeI; Thu, 17
 Apr 2025 00:45:29 +0200
Message-ID: <2c0a6822-f219-4eb9-89c5-9dc8b18c63a2@gmx.de>
Date: Thu, 17 Apr 2025 00:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] platform/x86: Add Lenovo Gamezone WMI Driver
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
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250408012815.1032357-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UYrbaN/v0vYJwe7smM6lvnwdF6NgirgOY0kXuWrSdwJFBapk4mG
 oetOLIXpPP5+MtSzaKCVKj6LGjleXuzUiuBp6DzWA1r05sNAUPPGb/fkQX3clLwt/0IAC+a
 QWK4+OoChkJdaKYW46nWCGjjQo4ek1OEpmFNRGUI95Ml0VDAe/QZAqsBv6YM5ffYbvH/2jk
 f7cHXMfMCVCeKGe98hQbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NAmHOEDpMiY=;mWmkohnM/bAkRXTSq4Q9Yf8/ECy
 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

Am 08.04.25 um 03:28 schrieb Derek J. Clark:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
> ---
>   MAINTAINERS                                |   2 +
>   drivers/platform/x86/Kconfig               |  14 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 375 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h |  20 ++
>   5 files changed, 412 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56ead241a053..49deb8ea4ea7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13168,6 +13168,8 @@ F:	drivers/platform/x86/lenovo-wmi-capdata01.c
>   F:	drivers/platform/x86/lenovo-wmi-capdata01.h
>   F:	drivers/platform/x86/lenovo-wmi-events.c
>   F:	drivers/platform/x86/lenovo-wmi-events.h
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.c
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
>   F:	drivers/platform/x86/lenovo-wmi-helpers.h
>  =20
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
> index 000000000000..2e6d5e7faadf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,375 @@
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
> +
> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> +static DEFINE_SPINLOCK(gz_lock);

Please move that spinlock inside struct lwmi_gz_priv.

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
> +		spin_lock(&gz_lock);
> +		priv->current_mode =3D *mode;
> +		spin_unlock(&gz_lock);
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
> +	return lwmi_dev_evaluate_int(wdev, 0x0, LWMI_GZ_METHOD_ID_SMARTFAN_SUP=
P,
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
> + * Return: 0 on success, or on error.
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
> +	spin_lock(&gz_lock);
> +	priv->current_mode =3D mode;
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
> + * Convert the given platform profile into a thermal mode based on the =
support
> + * level of the interface, then call the WMI method to set the thermal =
mode.
> + *
> + * Return: 0 on success, or on error.
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
> +				    (unsigned char *)&args, sizeof(args), NULL);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock(&gz_lock);
> +	priv->current_mode =3D mode;
> +	spin_unlock(&gz_lock);
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
> + * extreme_supported() - Evaluate if a device supports extreme thermal =
mode.
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
> + * Return: bool.
> + */
> +static bool extreme_supported(int profile_support_ver)
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
> + * Return: 0 on success, or on error.
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
> +	priv->extreme_supported =3D extreme_supported(profile_support_ver);
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

You will leak this platform profile device upon unbinding from the device,
better use devm_platform_profile_register().

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
> +
> +	return 0;

Please just return the result of devm_lwmi_events_register_notifier() dire=
ctly here.

Other than that the driver looks good.

Thanks,
Armin Wolf

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
> +	LWMI_GZ_GET_THERMAL_MODE =3D 1,
> +};
> +
> +enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_QUIET =3D 0x01,
> +	LWMI_GZ_THERMAL_MODE_BALANCED =3D 0x02,
> +	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> +	LWMI_GZ_THERMAL_MODE_EXTREME =3D 0xE0, /* Ver 6+ */
> +	LWMI_GZ_THERMAL_MODE_CUSTOM =3D 0xFF,
> +};
> +
> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
