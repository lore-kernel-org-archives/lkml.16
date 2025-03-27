Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A346B8;
	Thu, 27 Mar 2025 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743047393; cv=none; b=Wf9sPrLMdaCIm3QIsP50QgRmVdj+HGJXKbBQnod+QX3NIf4KdsglVrAAJyrSswHNMjduD/CKufqwAw+jNOpWm7KJ2QpXzX3TYJByLwLwuaJNMYCgC+fPgdwREM8MlGfkYo7P/xUDIy07zmPDDI9jSgSQM34YvdafGFEqspGuzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743047393; c=relaxed/simple;
	bh=tUP18A6/Rlo1LIA5Y95HRDPenog3zsTZweeA4QLyTc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqT5fq/LxfgQGVsfeAmjv5jgWoETnDpXKQp7M7i8qx6iR3Uc0QkXhJ8mZI2Jy1uMxgvHWSLAM1hURmBEJh1NkQjZ7uWkK5FPSHUTBCukfAzuzp6XsLYydknIbB05dpXMZmxbRbC72qTL2MINZ24Nzm3Qk66+0oQLNbGdZBdMSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rhBA6C1e; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rhBA6C1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743047368; x=1743652168; i=w_armin@gmx.de;
	bh=TtYy5FnoonOuN8e/nskIEwzUFTNIADViirBikGkmboU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rhBA6C1eONuVTnRoFo2mUAJNHSZvwjEfOWoKpJd30Raxdw353MkuvKh6dknNLXrs
	 SqCAeO0KFIYE8B+s3eC5TW5B1rR4XKQDsIGfysD58+0cuXS1+PhpuaZVqC5NPygML
	 sgI6jpqgE8oRlSohIwFIlwgG/yaallj8tvrZFy8ywzEkoN/pRhbytc70FP6v3u9In
	 zxcnsSM3DqMmCkT8N76lDjUjxIPATwzernumUda5zEqJyyngbUBtIU0kkg61U00tW
	 6y9l9q4XiHaBFRlEz8LEDdVDbRkIkOSXrIyW3l/F2WRbc6rEHnVM8KqubbaaUjo8N
	 nA6hmPlQJcrLIJMnIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1tNlSo242A-00fesP; Thu, 27
 Mar 2025 04:49:28 +0100
Message-ID: <b293a4a3-f759-4b47-a48d-da4a740f52e1@gmx.de>
Date: Thu, 27 Mar 2025 04:49:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI
 Driver
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
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-7-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-7-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1d31bc9N7LFvz4hGZ8xtLK+YhQfENTroKrmOWQOtdCBOgk9hMSH
 FjrGrEqV1fq5wzKGGaZzNKMgiLVlhR3u+kZn3gdGQTtfWS/a7EVP3qFx3zlz0VRBZ6rbbbn
 KADEd3T+UcqteWcut6FP0JiT2YUHuy/4pb4LydhFogkMooVSd4wqIEGAy7iA0/C2y5bjRXF
 4g0H+4InvFASJsOsbTrgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v5a/1gdm2io=;j1hytOee+E2CaaDZmrpZyMbYoR3
 LckORaqCJ3S3vD0Xv0QDqg7f0RgoQgZu2Xy9uFVVK6DYcBQ6zzp3G0Nj6urHNsSWtRDkSAFuv
 NhSVmM1CWgWvYQQX0D1BMjCEFlBcI23MNVELhHUeUBz/e0Eear6q8rX+sNRhRCZap5uOCNABO
 yXnEy+Xo9Bbu3W6zNAyjlNPxNF+NSNtMRF6E2z8seKwtk5xwTmo/e47sS3poIxwu1KqTsZcsH
 2Rhy59Av2j3TR6jrEEYU+QQ8G+83Le81GWuK0L4cN8I6yU2YQ+W4l8+9qSuQXeReRFPkS2ssw
 NnBbXQs5sFQQYB8OaOxLFzhAwFxNsI4PQ8VKOM/hycz/Irqhr5v0FLstcuZJ7AjHRR1NRzqhd
 hY6CO73TNA9YZRqhs3GoxKKVNKZdGH87HdSzRZBgnC0BngCOi2rz6bW+cL6ZbWClSRaFPX8tP
 1hqCHj8A1Yq3tYepNzOWcEHlzibDRF+LkNpSWZS+YGA3KsX9znVj3axTFv2ap/iU8o0zuCnvV
 P3s8Fy4kcr0r3E/rhjfpgbTEY4vWI5sv/MdgER30Q1of96QEk0wpVmvZJisCVYBYzM7kAcGew
 Wh9IrYgShxRB093pbx2DQBcsuDV8YgFbu7KEgMJI47w19sMv6YzHedDPRqdqb/AGqwP01zC3m
 +qhijaECorKR0wcDyyElZLY0f2NthOYudEHA3rN+Tl42HXZrKNnuvc3LKpR/Wrf1kNHUp5/DL
 qaCHBUiy2c3nRxSbdWhWL4/LfVWGErjIDa1meF9mwKtF1uc666v7yTUTfi4q79vWRmeyKaKKO
 +2MHeRY7yWfiWJ5c6yuVhBsDYJjgVUkBq2Oi1fNY8ASwXFX47pJyC+v65QGjmXNZcIczkzs8/
 8i7SU3gm7CLKYIMArqiFwEVoX5k5rwde/mLofe83uXe9dfGg1RL3kadBBO4U1gvbovm0y96vv
 sbtRDX9p4C6jC/nIjhppufsrArb3y5iIGkKB/JMROBfg7Spe6MxvYpjZ+yHJiNJtEKEgOSQtz
 TZx9Qw36h4kgiMR6FFkT3JgPgiM8JTmu+4AgsVeQpA3YgDnlGWdSp0jySjBIKJPiUJn84zAal
 tLLAbPUUbZQMz/bWCJGMRm+i2P6Po/fQG45Ts59Xo9m4/l4l/v9aLUNGoWFXWLrM/MxTlKZiL
 DdpKtFl4ygc5EfhmHabuuakEW2jW6VcNvn+BwcuenG27YKY+YjX4TGx71F25zL9qVG5O1Rrw/
 MqNlEzDpHOz1xXn8+nja40hgNxlHUAba/GCvsNn8isS2mkjl2kBUqHiRK/FWSK7ML/d+p+rJq
 dKs5F214Ol+MrSXC38zbjmK3FoKcpQIapKGFMcWmZ3HHM9MsTiuLzkqnAzGfpVFACp0tqMP85
 WMtDtw/IuoXmZSNQEbwLKgujcZ6V+5N9DM3QTWt3xTkgwsnwN41whmzmu/GZnLeS4eT0n1qyT
 6TGYWm/RTKa/XjgLIeL+DoUMAhRo=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> platform profiles over WMI.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
>   drivers/platform/x86/Kconfig               |  13 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 380 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
>   5 files changed, 414 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 87daee6075ad..0416afd997a0 100644
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
>   F:	drivers/platform/x86/lenovo-wmi-other.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index fc47604e37f7..ecf3246c8fda 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,19 @@ config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
>
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI

Hi,

please add a "depends on DMI" here.

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
> index c6ce3c8594b1..f3e64926a96b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380=
-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
>   obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>   obj-$(CONFIG_LENOVO_WMI_TUNING)	+=3D lenovo-wmi-other.o
>
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..9d453a836227
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface pro=
vides
> + * platform profile and fan curve settings for devices that fall under =
the
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

Please also include linux/acpi.h, linux/export.h and linux/module.h.

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
> +static struct quirk_entry quirk_no_extreme_bug =3D {
> +	.extreme_supported =3D false,
> +};
> +
> +/* Notifier Methods */
> +/*

/* -> /**, same goes for the other kernel doc comments.

> + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other notifier
> + * block call chain. For THERMAL_MODE_EVENT, returns current_mode
> + *
> + * @nb: The notifier_block registered to lenovo-wmi-other
> + * @cmd: The event triggered by lenovo-wmi-other
> + * @data: The data to be returned by the event.
> + *
> + * Returns: notifier_block status.
> + */
> +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long c=
md,
> +			     void *data)
> +{
> +	struct lwmi_event_priv *priv;
> +
> +	priv =3D container_of(nb, struct lwmi_event_priv, mode_nb);
> +	if (!priv)
> +		return NOTIFY_BAD;
> +
> +	switch (cmd) {
> +	case THERMAL_MODE_EVENT:

I think it would be better to have a separate command code (maybe GAMEZONE=
_GET_THERMAL_MODE) for this
kind of request. Maybe you can define a separate enum for that?

> +		*(enum thermal_mode *)data =3D priv->current_mode;

I think you need to protect this variable from concurrent accesses. Maybe =
a spinlock would
be suitable here?

> +		break;

Please return NOTIFY_STOP here to prevent the notifier call chain from cal=
ling further.

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
> +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long =
cmd,
> +			      void *data)
> +{
> +	struct lwmi_event_priv *priv;
> +
> +	priv =3D container_of(nb, struct lwmi_event_priv, event_nb);
> +	if (!priv)
> +		return NOTIFY_BAD;

This check is unnecessary, please drop it?

> +
> +	switch (cmd) {
> +	case THERMAL_MODE_EVENT:
> +		priv->current_mode =3D *((enum thermal_mode *)data);

You do not need to explicitly cast void pointers. Also please validate tha=
t the event data
is actually a valid thermal mode. This check should IMHO happen inside the=
 event driver itself.

> +		platform_profile_notify(&priv->wdev->dev);

You are supposed to pass the platform profile device as the argument.

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
> +	return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP=
,
> +					0, 0, supported);
> +}
> +
> +/*
> + * lwmi_gz_thermal_mode_get() - Gets the currently set thermal mode fro=
m
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
> +	struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	ret =3D lwmi_gz_thermal_mode_get(priv->wdev, &mode);
> +	if (ret)
> +		return ret;
> +
> +	switch (mode) {
> +	case SMARTFAN_MODE_QUIET:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case SMARTFAN_MODE_BALANCED:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case SMARTFAN_MODE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		}
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_EXTREME:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_CUSTOM:
> +		*profile =3D PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	priv->current_mode =3D mode;
> +
> +	return 0;
> +}
> +
> +static int lwmi_gz_profile_set(struct device *dev,
> +			       enum platform_profile_option profile)
> +{
> +	struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	int ret;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		mode =3D SMARTFAN_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		mode =3D SMARTFAN_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		mode =3D SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		if (priv->extreme_supported) {
> +			mode =3D SMARTFAN_MODE_EXTREME;
> +			break;
> +		}
> +		mode =3D SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		mode =3D SMARTFAN_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	args.arg0 =3D mode;
> +
> +	ret =3D lwmi_dev_evaluate_method(priv->wdev, 0x0,
> +				       WMI_METHOD_ID_SMARTFAN_SET,
> +				       (unsigned char *)&args, sizeof(args),
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
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
> +		.ident =3D "Legion Go S 8ARP1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
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
> +	{},
> +
> +};
> +
> +/*
> + * extreme_supported() - Evaluate if a device supports extreme thermal =
mode.
> + * For devices that have a profile_support_ver of 6 or greater a DMI ch=
eck
> + * is done. Some devices report a version that supports extreme mode bu=
t
> + * have an incomplete entry in the BIOS. To ensure this cannot be set, =
they
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
> +	dmi_id =3D dmi_first_match(fwbug_list);
> +	if (!dmi_id)
> +		return true;
> +
> +	quirks =3D dmi_id->driver_data;
> +	return quirks->extreme_supported;
> +}
> +
> +static int lwmi_platform_profile_probe(void *drvdata, unsigned long *ch=
oices)
> +{
> +	struct lwmi_event_priv *priv =3D drvdata;
> +	int profile_support_ver;
> +	int ret;
> +
> +	ret =3D lwmi_gz_platform_profile_supported(priv->wdev,
> +						 &profile_support_ver);
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
> +	.probe =3D lwmi_platform_profile_probe,
> +	.profile_get =3D lwmi_gz_profile_get,
> +	.profile_set =3D lwmi_gz_profile_set,
> +};
> +
> +/* Driver Methods */
> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct lwmi_event_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->event_nb.notifier_call =3D lwmi_gz_event_call;
> +	ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb=
);
> +	if (ret)
> +		return ret;

You should register the event notifier after registering the platform prof=
ile or else
a WMI event could arrive before the platform profile was registered, resul=
ting in
platform_profile_notify() being called on a invalid device pointer.

> +
> +	priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> +	ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
> +	if (ret)
> +		return ret;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);

This should happen before the notifiers are registered or else they might =
try to access
those values before they are actually initialized.

> +
> +	priv->ppdev =3D platform_profile_register(&wdev->dev,
> +						"lenovo-wmi-gamezone", priv,
> +						&lwmi_gz_platform_profile_ops);
> +
> +	if (IS_ERR(priv->ppdev))
> +		return -ENODEV;
> +
> +	ret =3D lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> +	if (ret)
> +		return ret;

The thermal mode should be initialized before any notifiers using it are r=
egistered.

> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lwmi_gz_id_table[] =3D { { LENOVO_GAM=
EZONE_GUID,
> +							   NULL },
> +							 {} };

Please fix the formatting here.

Thanks,
Armin Wolf

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
> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> +MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.h
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
> +	SMARTFAN_MODE_QUIET =3D 0x01,
> +	SMARTFAN_MODE_BALANCED =3D 0x02,
> +	SMARTFAN_MODE_PERFORMANCE =3D 0x03,
> +	SMARTFAN_MODE_EXTREME =3D 0xE0, /* Ver 6+ */
> +	SMARTFAN_MODE_CUSTOM =3D 0xFF,
> +};
> +
> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
