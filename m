Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F5B221F25;
	Wed, 16 Apr 2025 22:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844098; cv=none; b=VsJITgM5BMB0c7dznQkIr6sFclk2l3EcWPwWNWYdYnFxsCPNR84pQV9FLDs5inzRUir+gnbSJETAphc+Y8JbPvgqEtG3WcthvwmOgBpVQMl3WOZbV+/j3j1dCaHHwmm4w+oJsTwNeiVWKpzmCh4mYzmStmUM8vJLUJPlRBWtlZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844098; c=relaxed/simple;
	bh=1lYFLe6mcX9mmQWeeViXI3sPaaR/MwIAqSISKY5xOhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwCVDMDA3/IK5ueSGzfk0UKG0iiO5D9LAJ7c3BHdD2Rs0jvRpDHdQbbniLN22b2T17zQ2BFHGn2hI5qh8doZbHoW7WuxfymPUqDP6wZjfvFFsynLn0p5M7zK/1FRSMP3GrqoJGOICSv4a/p5Z53Tt8T7u/e2kA4rsbnVrlbMLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NfHv4zHU; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NfHv4zHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744844092; x=1745448892; i=w_armin@gmx.de;
	bh=ObIBbeOgiKXAIhdJHsxGA6D9oMGgOpmqE22b/U+BfWI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NfHv4zHUotSypj9bEqREVeBi+96ArkfB5U/q0p/3SwODKqN9sOwkTGVRdLAUdOaG
	 ZUumzVSF7QF/tMEPUQlISojd3rSv6xVWDD5oId6p5Mi2MSpUaN5qrjjIRE3DtFYpN
	 l4kPKwfu/v0Aixbj9xvNt9zhRfCCMCht0yxrN6VOi4nMegqzuLAsFdi6i6IwPOLc7
	 0ZqekR2NZX/0UOoJq55fS8Zp98PYhJCyIuv+AYpSEVExWaB1bmHTthdeBSmsprDxc
	 +N6IkV5QthMbxvYQUhRgBhgv5dlBSC4n1MjDA61Fj91ynUJ8e0x4l65b+s6WryzWR
	 jCXe1DiRVT0DtZTzQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOREi-1uV5rG0G8k-00SFgF; Thu, 17
 Apr 2025 00:54:52 +0200
Message-ID: <fc7d510c-4b41-4b78-b1e2-24710e208275@gmx.de>
Date: Thu, 17 Apr 2025 00:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
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
 <20250408012815.1032357-7-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250408012815.1032357-7-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2E///SaGa4dPl5HyyU3FDLkVL++RLBqN0PCfkyzI72CQovAKcFC
 rUkyYe73wbxm0np5wCpTSoFwxXsCv1Jq3PZA6Nr90Kgjw03l2KGIOFRt3F0Wo2hCzGp9pFT
 hMLPhKZbYeupGWiYfj9BWWD++WS8ScloOMllxR40MtTFHVFqs3dMphErTwAMa/Xaij3G1ck
 erbI1XJgeSBuNbZVmeYQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L6/dCT+Ppts=;yudKwnHX33hdcZUaGjSK5Y4VDQM
 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

Am 08.04.25 um 03:28 schrieb Derek J. Clark:

> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> interface that comes on some Lenovo "Gaming Series" hardware. Provides a
> firmware-attributes class which enables the use of tunable knobs for SPL=
,
> SPPT, and FPPT.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
> - Switch from locally storing capability data list to storing a pointer
>    from the capability data interface.
> - Add portion of Gamezone driver that relies on the exported functions
>    of this driver.
> - Properly initialize IDA and use it for naming the firmware-attributes
>    path.
> - Rename most defines to clearly indicate they are from this driver.
> - Misc fixes from v4 review.
> v4:
> - Treat Other Mode as a notifier chain head, use the notifier chain to
>    get the current mode from Gamezone.
> - Add header file for Other Mode specific structs and finctions.
> - Use component master bind to cache the capdata01 array locally.
> - Drop all reference to external driver private data structs.
> - Various fixes from review.
> v3:
> - Add notifier block and store result for getting the Gamezone interface
>    profile changes.
> - Add driver as master component of capdata01 driver.
> - Use FIELD_PREP where appropriate.
> - Move macros and associated functions out of lemovo-wmi.h that are only
>    used by this driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> - Use list to get the lenovo_wmi_om_priv instance in some macro
>    called functions as the data provided by the macros that use it
>    doesn't pass a member of the struct for use in container_of.
> - Do not rely on GameZone interface to grab the current fan mode.
> ---
>   MAINTAINERS                                |   2 +
>   drivers/platform/x86/Kconfig               |  15 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c |  35 ++
>   drivers/platform/x86/lenovo-wmi-other.c    | 677 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h    |  16 +
>   6 files changed, 746 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49deb8ea4ea7..0416afd997a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13172,6 +13172,8 @@ F:	drivers/platform/x86/lenovo-wmi-gamezone.c
>   F:	drivers/platform/x86/lenovo-wmi-gamezone.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
>   F:	drivers/platform/x86/lenovo-wmi-helpers.h
> +F:	drivers/platform/x86/lenovo-wmi-other.c
> +F:	drivers/platform/x86/lenovo-wmi-other.h
>  =20
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index aaa1a69c10ca..be5ab24960b5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
>   	tristate
>   	depends on ACPI_WMI
>  =20
> +config LENOVO_WMI_TUNING
> +	tristate "Lenovo Other Mode WMI Driver"
> +	depends on ACPI_WMI
> +	select FW_ATTR_CLASS
> +	select LENOVO_WMI_DATA01
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would li=
ke to use the
> +	  firmware_attributes API to control various tunable settings typicall=
y exposed by
> +	  Lenovo software in Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-other.
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 60058b547de2..f3e64926a96b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdat=
a01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
> +obj-$(CONFIG_LENOVO_WMI_TUNING)	+=3D lenovo-wmi-other.o
>  =20
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.c
> index 2e6d5e7faadf..9c80561f931c 100644
> --- a/drivers/platform/x86/lenovo-wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -22,6 +22,7 @@
>   #include "lenovo-wmi-events.h"
>   #include "lenovo-wmi-gamezone.h"
>   #include "lenovo-wmi-helpers.h"
> +#include "lenovo-wmi-other.h"
>  =20
>   #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>  =20
> @@ -49,6 +50,34 @@ static struct quirk_entry quirk_no_extreme_bug =3D {
>   	.extreme_supported =3D false,
>   };
>  =20
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
> +		**mode =3D priv->current_mode;

Please use the spinlock here you introduced previously.

> +		return NOTIFY_STOP;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
>   /**
>    * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver not=
ifier.
>    * block call chain.
> @@ -347,6 +376,11 @@ static int lwmi_gz_probe(struct wmi_device *wdev, c=
onst void *context)
>   	if (ret)
>   		return ret;
>  =20
> +	priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> +	ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
> +	if (ret)
> +		return ret;

Please directly return the result of devm_lwmi_om_register_notifier() here=
.

> +
>   	return 0;
>   }
>  =20
> @@ -369,6 +403,7 @@ module_wmi_driver(lwmi_gz_driver);
>  =20
>   MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
>   MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
>   MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
>   MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>   MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/=
x86/lenovo-wmi-other.c
> new file mode 100644
> index 000000000000..342883a90270
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.c
> @@ -0,0 +1,677 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Other Mode WMI interface driver.
> + *
> + * This driver uses the fw_attributes class to expose the various WMI f=
unctions
> + * provided by the "Other Mode" WMI interface. This enables CPU and GPU=
 power
> + * limit as well as various other attributes for devices that fall unde=
r the
> + * "Gaming Series" of Lenovo laptop devices. Each attribute exposed by =
the
> + * "Other Mode"" interface has a corresponding Capability Data struct t=
hat
> + * allows the driver to probe details about the attribute such as if it=
 is
> + * supported by the hardware, the default_value, max_value, min_value, =
and step
> + * increment.
> + *
> + * These attributes typically don't fit anywhere else in the sysfs and =
are set
> + * in Windows using one of Lenovo's multiple user applications.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/gfp_types.h>
> +#include <linux/idr.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-capdata01.h"
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +#include "lenovo-wmi-helpers.h"
> +#include "lenovo-wmi-other.h"
> +#include "firmware_attributes_class.h"
> +
> +#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> +
> +#define LWMI_DEVICE_ID_CPU 0x01
> +
> +#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> +#define LWMI_FEATURE_ID_CPU_SPL 0x02
> +#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> +
> +#define LWMI_TYPE_ID_NONE 0x00
> +
> +#define LWMI_FEATURE_VALUE_GET 17
> +#define LWMI_FEATURE_VALUE_SET 18
> +
> +#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> +#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> +#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> +#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> +
> +#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> +
> +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> +static DEFINE_IDA(lwmi_om_ida);
> +
> +enum attribute_property {
> +	DEFAULT_VAL,
> +	MAX_VAL,
> +	MIN_VAL,
> +	STEP_VAL,
> +	SUPPORTED,
> +};
> +
> +struct lwmi_om_priv {
> +	struct component_master_ops *ops;
> +	/* *cd01_list is only valid after master bind and while capdata01 exis=
ts */
> +	struct cd01_list *cd01_list;
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +	struct notifier_block nb;
> +	struct wmi_device *wdev;
> +	int ida_id;
> +};
> +
> +struct tunable_attr_01 {
> +	struct capdata01 *capdata;
> +	struct device *dev;
> +	u32 feature_id;
> +	u32 device_id;
> +	u32 type_id;
> +};
> +
> +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D LWMI_DEVICE_ID_=
CPU,
> +				       .feature_id =3D LWMI_FEATURE_ID_CPU_SPL,
> +				       .type_id =3D LWMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D LWMI_DEVICE_ID=
_CPU,
> +					.feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
> +					.type_id =3D LWMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D LWMI_DEVICE_ID=
_CPU,
> +					.feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
> +					.type_id =3D LWMI_TYPE_ID_NONE };
> +
> +struct capdata01_attr_group {
> +	const struct attribute_group *attr_group;
> +	struct tunable_attr_01 *tunable_attr;
> +};
> +
> +/**
> + * lwmi_om_register_notifier() - Add a notifier to the blocking notifie=
r chain
> + * @nb: The notifier_block struct to register
> + *
> + * Call blocking_notifier_chain_register to register the notifier block=
 to the
> + * lenovo-wmi-other driver notifer chain.
> + *
> + * Return: 0 on success, %-EEXIST on error.
> + */
> +int lwmi_om_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
> +
> +/**
> + * lwmi_om_unregister_notifier() - Remove a notifier from the blocking =
notifier
> + * chain.
> + * @nb: The notifier_block struct to register
> + *
> + * Call blocking_notifier_chain_unregister to unregister the notifier b=
lock from the
> + * lenovo-wmi-other driver notifer chain.
> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
> +
> +/**
> + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the bloc=
king
> + * notifier chain.
> + * @data: Void pointer to the notifier_block struct to register.
> + *
> + * Call lwmi_om_unregister_notifier to unregister the notifier block fr=
om the
> + * lenovo-wmi-other driver notifer chain.
> + *
> + * Return: 0 on success, %-ENOENT on error.
> + */
> +static void devm_lwmi_om_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb =3D data;
> +
> +	lwmi_om_unregister_notifier(nb);
> +}
> +
> +/**
> + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking no=
tifier
> + * chain.
> + * @dev: The parent device of the notifier_block struct.
> + * @nb: The notifier_block struct to register
> + *
> + * Call lwmi_om_register_notifier to register the notifier block to the
> + * lenovo-wmi-other driver notifer chain. Then add devm_lwmi_om_unregis=
ter_notifier
> + * as a device managed ation to automatically unregister the notifier b=
lock
> + * upon parent device removal.
> + *
> + * Return: 0 on success, or on error.
> + */
> +int devm_lwmi_om_register_notifier(struct device *dev,
> +				   struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D lwmi_om_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_notifier,
> +					nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER"=
);
> +
> +/**
> + * lwmi_om_notifier_call() - Call functions for the notifier call chain=
.
> + * @mode: Pointer to a thermal mode enum to retrieve the data from.
> + *
> + * Call blocking_notifier_call_chain to retrieve the thermal mode from =
the
> + * lenovo-wmi-gamezone driver.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> +{
> +	int ret;
> +
> +	ret =3D blocking_notifier_call_chain(&om_chain_head, LWMI_GZ_GET_THERM=
AL_MODE, &mode);
> +	if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Attribute Methods */
> +
> +/**
> + * int_type_show() - Emit the data type for an integer attribute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + *
> + * Return: Number of characters written to buf.
> + */
> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribut=
e *kattr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +/**
> + * attr_capdata01_get - Get the data of the specified attribute
> + * @tunable_attr: The attribute to be populated.
> + *
> + * Retrieves the capability data 01 struct pointer for the given
> + * attribute for its specified thermal mode.
> + *
> + * Return: Either a pointer to capability data, or NULL.
> + */
> +static struct capdata01 *attr_capdata01_get_data(struct lwmi_om_priv *p=
riv,
> +						 u32 attribute_id)
> +{
> +	int idx;
> +
> +	for (idx =3D 0; idx < priv->cd01_list->count; idx++) {
> +		if (priv->cd01_list->data[idx].id !=3D attribute_id)
> +			continue;
> +		return &priv->cd01_list->data[idx];
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * attr_capdata01_show() - Get the value of the specified attribute pro=
perty
> + *
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + * @tunable_attr: The attribute to be read.
> + * @prop: The property of this attribute to be read.
> + *
> + * Retrieves the given property from the capability data 01 struct for =
the
> + * specified attribute's "custom" thermal mode. This function is intend=
ed
> + * to be generic so it can be called from any integer attributes "_show=
"
> + * function.
> + *
> + * If the WMI is success the sysfs attribute is notified.
> + *
> + * Return: Either number of characters written to buf, or an error.
> + */
> +static ssize_t attr_capdata01_show(struct kobject *kobj,
> +				   struct kobj_attribute *kattr, char *buf,
> +				   struct tunable_attr_01 *tunable_attr,
> +				   enum attribute_property prop)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct capdata01 *capdata;
> +	u32 attribute_id;
> +	int value;
> +
> +	attribute_id =3D
> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_CUSTOM) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	capdata =3D attr_capdata01_get_data(priv, attribute_id);
> +
> +	if (!capdata)
> +		return -ENODEV;
> +
> +	switch (prop) {
> +	case DEFAULT_VAL:
> +		value =3D capdata->default_value;
> +		break;
> +	case MAX_VAL:
> +		value =3D capdata->max_value;
> +		break;
> +	case MIN_VAL:
> +		value =3D capdata->min_value;
> +		break;
> +	case STEP_VAL:
> +		value =3D capdata->step;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return sysfs_emit(buf, "%d\n", value);
> +}
> +
> +/**
> + * att_current_value_store() - Set the current value of the given attri=
bute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to read from, this is parsed to `int` type.
> + * @count: Required by sysfs attribute macros, pass in from the callee =
attr.
> + * @tunable_attr: The attribute to be stored.
> + *
> + * Sets the value of the given attribute when operating under the "cust=
om"
> + * smartfan profile. The current smartfan profile is retrieved from the
> + * lenovo-wmi-gamezone driver and error is returned if the result is no=
t
> + * "custom". This function is intended to be generic so it can be calle=
d from
> + * any integer attribute's "_store" function. The integer to be sent to=
 the WMI
> + * method is range checked and an error is returned if out of range.
> + *
> + * If the value is valid and WMI is success, then the sysfs attribute i=
s
> + * notified.
> + *
> + * Return: Either count, or an error.
> + */
> +static ssize_t attr_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *kattr,
> +					const char *buf, size_t count,
> +					struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	struct capdata01 *capdata;
> +	enum thermal_mode mode;
> +	u32 attribute_id;
> +	u32 value;
> +	int err;
> +
> +	err =3D lwmi_om_notifier_call(&mode);
> +	if (err)
> +		return err;
> +
> +	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
> +		return -EBUSY;
> +
> +	attribute_id =3D
> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	capdata =3D attr_capdata01_get_data(priv, attribute_id);
> +
> +	if (!capdata)
> +		return -ENODEV;
> +
> +	err =3D kstrtouint(buf, 10, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < capdata->min_value || value > capdata->max_value)
> +		return -EINVAL;
> +
> +	args.arg0 =3D attribute_id;
> +	args.arg1 =3D value;
> +
> +	err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				    (unsigned char *)&args, sizeof(args), NULL);
> +
> +	if (err)
> +		return err;
> +
> +	return count;
> +};
> +
> +/**
> + * attr_current_value_show() - Get the current value of the given attri=
bute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + * @tunable_attr: The attribute to be read.
> + *
> + * Retrieves the value of the given attribute for the current smartfan =
profile.
> + * The current smartfan profile is retrieved from the lenovo-wmi-gamezo=
ne driver.
> + * This function is intended to be generic so it can be called from any=
 integer
> + * attribute's "_show" function.
> + *
> + * If the WMI is success the sysfs attribute is notified.
> + *
> + * Return: Either number of characters written to buf, or an error.
> + */
> +static ssize_t attr_current_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *kattr, char *buf,
> +				       struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	u32 attribute_id;
> +	int retval;
> +	int err;
> +
> +	err =3D lwmi_om_notifier_call(&mode);
> +	if (err)
> +		return err;
> +
> +	attribute_id =3D
> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	args.arg0 =3D attribute_id;
> +
> +	err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%d\n", retval);
> +}
> +
> +/* Lenovo WMI Other Mode Attribute macros */
> +#define __LWMI_ATTR_RO(_func, _name)                                  \
> +	{                                                             \
> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +		.show =3D _func##_##_name##_show,                       \
> +	}
> +
> +#define __LWMI_ATTR_RO_AS(_name, _show)                               \
> +	{                                                             \
> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +		.show =3D _show,                                        \
> +	}
> +
> +#define __LWMI_ATTR_RW(_func, _name) \
> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
> +
> +/* Shows a formatted static variable */
> +#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)             =
        \
> +	static ssize_t _attrname##_##_prop##_show(                            =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return sysfs_emit(buf, _fmt, _val);                            \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D           =
   \
> +		__LWMI_ATTR_RO(_attrname, _prop)
> +
> +/* Attribute current value read/write */
> +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                  =
        \
> +	static ssize_t _attrname##_current_value_store(                       =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr,            \
> +		const char *buf, size_t count)                                 \
> +	{                                                                     =
 \
> +		return attr_current_value_store(kobj, kattr, buf, count,       \
> +						&_attrname);                   \
> +	}                                                                     =
 \
> +	static ssize_t _attrname##_current_value_show(                        =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_current_value =3D     =
   \
> +		__LWMI_ATTR_RW(_attrname, current_value)
> +
> +/* Attribute property read only */
> +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)          =
        \
> +	static ssize_t _attrname##_##_prop##_show(                            =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
> +					   _prop_type);                        \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D           =
   \
> +		__LWMI_ATTR_RO(_attrname, _prop)
> +
> +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)   =
   \
> +	__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
> +	__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
> +	__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
> +	__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
> +	__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
> +	__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
> +	static struct kobj_attribute attr_##_attrname##_type =3D            \
> +		__LWMI_ATTR_RO_AS(type, int_type_show);                   \
> +	static struct attribute *_attrname##_attrs[] =3D {                  \
> +		&attr_##_attrname##_current_value.attr,                   \
> +		&attr_##_attrname##_default_value.attr,                   \
> +		&attr_##_attrname##_display_name.attr,                    \
> +		&attr_##_attrname##_max_value.attr,                       \
> +		&attr_##_attrname##_min_value.attr,                       \
> +		&attr_##_attrname##_scalar_increment.attr,                \
> +		&attr_##_attrname##_type.attr,                            \
> +		NULL,                                                     \
> +	};                                                                \
> +	static const struct attribute_group _attrname##_attr_group =3D {    \
> +		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
> +	}
> +
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> +			      "Set the CPU sustained power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> +			      "Set the CPU slow package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> +			      "Set the CPU fast package power tracking limit");
> +
> +static struct capdata01_attr_group cd01_attr_groups[] =3D {
> +	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> +	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> +	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> +	{},
> +};
> +
> +/**
> + * lwmi_om_fw_attr_add() - Register all firmware_attributes_class membe=
rs
> + * @priv: The Other Mode driver data.
> + *
> + * Return: Either 0, or an error.
> + */
> +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
> +	if (priv->ida_id < 0)
> +		return priv->ida_id;
> +
> +	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
> +					  MKDEV(0, 0), NULL, "%s-%u",
> +					  LWMI_OM_FW_ATTR_BASE_PATH,
> +					  priv->ida_id);
> +	if (IS_ERR(priv->fw_attr_dev)) {
> +		err =3D PTR_ERR(priv->fw_attr_dev);
> +		goto err_free_ida;
> +	}
> +
> +	priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL, &priv->=
fw_attr_dev->kobj);
> +	if (!priv->fw_attr_kset) {
> +		err =3D -ENOMEM;
> +		goto err_destroy_classdev;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> +		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj, cd01_attr_group=
s[i].attr_group);
> +		if (err)
> +			goto err_remove_groups;
> +
> +		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> +	}
> +	return 0;
> +
> +err_remove_groups:
> +	while (i--)
> +		sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_groups[i].att=
r_group);
> +
> +	kset_unregister(priv->fw_attr_kset);
> +
> +err_destroy_classdev:
> +	device_unregister(priv->fw_attr_dev);
> +
> +err_free_ida:
> +	ida_free(&lwmi_om_ida, priv->ida_id);
> +	return err;
> +}
> +
> +/**
> + * lwmi_om_fw_attr_remove() - Unregister all capability data attribute =
groups
> + * @priv: the lenovo-wmi-other driver data.
> + */
> +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> +{
> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
> +		sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_groups[i].att=
r_group);
> +
> +	kset_unregister(priv->fw_attr_kset);
> +	device_unregister(priv->fw_attr_dev);

Please do the ida cleanup here to ensure that lwmi_om_fw_attr_add() was ca=
lled previously
and initialized priv->ida.

Otherwise the driver looks good to me.

Thanks,
Armin Wolf

> +}
> +
> +/**
> + * lwmi_om_master_bind() - Bind all components of the other mode driver
> + * @dev: The lenovo-wmi-other driver basic device.
> + *
> + * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to t=
he
> + * lenovo-wmi-other master driver. On success, assign the capability da=
ta 01
> + * list pointer to the driver data struct for later access. This pointe=
r
> + * is only valid while the capdata01 interface exists. Finally, registe=
r all
> + * firmware attribute groups.
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_om_master_bind(struct device *dev)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +	struct cd01_list *tmp_list;
> +	int ret;
> +
> +	ret =3D component_bind_all(dev, &tmp_list);
> +	if (ret)
> +		return ret;
> +
> +	priv->cd01_list =3D tmp_list;
> +
> +	if (!priv->cd01_list)
> +		return -ENODEV;
> +
> +	return lwmi_om_fw_attr_add(priv);
> +}
> +
> +/**
> + * lwmi_om_master_unbind() - Unbind all components of the other mode dr=
iver
> + * @dev: The lenovo-wmi-other driver basic device
> + *
> + * Unregister all capability data attribute groups. Then call
> + * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from =
the
> + * lenovo-wmi-other master driver. Finally, free the IDA for this devic=
e.
> + */
> +static void lwmi_om_master_unbind(struct device *dev)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +
> +	lwmi_om_fw_attr_remove(priv);
> +	component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_om_master_ops =3D {
> +	.bind =3D lwmi_om_master_bind,
> +	.unbind =3D lwmi_om_master_unbind,
> +};
> +
> +static int lwmi_other_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	struct component_match *master_match =3D NULL;
> +	struct lwmi_om_priv *priv;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL);
> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops=
,
> +					       master_match);
> +}
> +
> +static void lwmi_other_remove(struct wmi_device *wdev)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> +	ida_free(&lwmi_om_ida, priv->ida_id);
> +}
> +
> +static const struct wmi_device_id lwmi_other_id_table[] =3D {
> +	{ LENOVO_OTHER_MODE_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_other_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_other",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_other_id_table,
> +	.probe =3D lwmi_other_probe,
> +	.remove =3D lwmi_other_remove,
> +	.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(lwmi_other_driver);
> +
> +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-other.h b/drivers/platform/=
x86/lenovo-wmi-other.h
> new file mode 100644
> index 000000000000..49bc3521e184
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_OTHER_H_
> +#define _LENOVO_WMI_OTHER_H_
> +
> +struct device;
> +struct notifier_block;
> +
> +int lwmi_om_register_notifier(struct notifier_block *nb);
> +int lwmi_om_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_om_register_notifier(struct device *dev,
> +				   struct notifier_block *nb);
> +
> +#endif /* !_LENOVO_WMI_OTHER_H_ */
