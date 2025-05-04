Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585591805A;
	Sun,  4 May 2025 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746325754; cv=none; b=huQ5wiknPMEcckCiT2Ky8mP7dSdQMRB9B9fgknNjNjEXPGVxj8CaZYE3I0csrQ9N+IYHiipdS0pgNHF1EArAtGZ14PZNW2xn8XOf+kz58V9Rjp3jg2iHvuT8CbmviReAT3RJ80sbWxOWdUx3vgmRc7IlHFwH6BCfxUlnZJl0Sjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746325754; c=relaxed/simple;
	bh=bITGQ9ovY0XLNPssYe3iLBCe+LLAv1IJbbF0mkbV/hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7AGrla/MVbbGAR4/kxdVwj+QHLveL0NNf81zVKdZPZY/LSYi7i0JHvM6DQZqh9IhieG4Or2jBQOBREberuci4SnilILgZp8xsSAjaarkTGdWVlS2KHfB8Zg1bM3jrYI74Z1v2zM9Okc4b3c9iicYas5FCj+Fo9ftnNKcdMOQcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EzNdcXef; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EzNdcXef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746325728; x=1746930528; i=w_armin@gmx.de;
	bh=yzQAZuGxYuXKxky9IcVZnY5gL3rnjKIeiTrm2vd1XqQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EzNdcXef5PyMjqEfMyHnwcctnQaYHYiRV4WKzU2cni9HSnyyiiXsvyMl+PM1/ePU
	 76pvJTE1a98+2g/BrfPdJSWbDpsSYgtSgl0cZS8FiDa7MXQGuGQe0uUChelfekZw9
	 DfbIWr6JuBIxQk2AsRZPCPUGoiZuTnsTkWpM4hKOkV1bBJAaPJu3dolOuREDC7VaD
	 9Irx58FQRb9gPtUZnvIteU6jy5hW8qFx6P4pxvTSNLNE+FyNIm3WF0NDLvlEIU3PT
	 MxMYnhtwpOmgz3hjtYvjXEP8j8/bxZXyyY9CB40R09wG6JZK5rtMo7PX+3bsMQey9
	 zaVvFewNCG7e3OOscw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1OXZ-1vClQS3Utv-00zhxw; Sun, 04
 May 2025 04:28:48 +0200
Message-ID: <5c078e8b-f270-4f1b-bdbd-08c082841b7e@gmx.de>
Date: Sun, 4 May 2025 04:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
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
 <20250503000142.1190354-7-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250503000142.1190354-7-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ncnf3gKsdeNBcPQQbau758PxpaDDNUcV8LwetIBAuxiySIcTAms
 pKiIJVmmO/6DXBgL3m8GJUKVBmj2Mw0X+GbZYDArOAhl7MsNe7MmU3yht+ZTWFDXU7+HjnC
 LAhUwRBKfjCgHOCEZMQjf0XXtRZZqv1LAwLmXzSoL3TGh2FgRusBvi/sCqnHfkqLGcZWDv1
 Ln2FT842O/v6ojMqIJAGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8gPnL0LDeUY=;ptMUFBKDlUiqXd5g+iza0N+qECJ
 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
 79dlnqEhVG/GkIJ9xeuE5xpnJ8XQAQyUtl

Am 03.05.25 um 02:01 schrieb Derek J. Clark:

> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> interface that comes on some Lenovo "Gaming Series" hardware. Provides a
> firmware-attributes class which enables the use of tunable knobs for SPL=
,
> SPPT, and FPPT.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Use stach allocated capdata01 stuct instead of getting a pointer fro=
m
>     lenovo-wmi-capdata01.
>   - Fix typos.
> v6:
> - Pass locally stored pointer to cd01_list back to lenovo-wmi-capdata01
>    instead of itterating over the list locally. Due to ACPI event handin=
g
>    the list is now mutexed.
> - Fix typos and rewordings from v5 review.
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
>   MAINTAINERS                                |   1 +
>   drivers/platform/x86/Kconfig               |  15 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c |   8 +-
>   drivers/platform/x86/lenovo-wmi-other.c    | 657 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h    |  16 +
>   6 files changed, 697 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 673535395ae8..764eadee48ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13168,6 +13168,7 @@ F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>   F:	drivers/platform/x86/lenovo-wmi-events.*
>   F:	drivers/platform/x86/lenovo-wmi-gamezone.*
>   F:	drivers/platform/x86/lenovo-wmi-helpers.*
> +F:	drivers/platform/x86/lenovo-wmi-other.*
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
> index 7723041ed53b..376f1e643944 100644
> --- a/drivers/platform/x86/lenovo-wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -374,7 +374,12 @@ static int lwmi_gz_probe(struct wmi_device *wdev, c=
onst void *context)
>   		return ret;
>  =20
>   	priv->event_nb.notifier_call =3D lwmi_gz_event_call;
> -	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb)=
;
> +	ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb=
);
> +	if (ret)
> +		return ret;
> +
> +	priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> +	return devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
>   }
>  =20
>   static const struct wmi_device_id lwmi_gz_id_table[] =3D {
> @@ -396,6 +401,7 @@ module_wmi_driver(lwmi_gz_driver);
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
> index 000000000000..145b15b779e8
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.c
> @@ -0,0 +1,657 @@
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
> + * "Other Mode" interface has a corresponding Capability Data struct th=
at
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
> + * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
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
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +	struct notifier_block nb;
> +	struct wmi_device *wdev;
> +	void *cd01_list;

Please replace void with struct cd01_list:

	struct cd01_list *cd01_list;

Since cd01_list is a pointer this should work even without a public defini=
tion of struct cd01_list.

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
> + * lenovo-wmi-other driver notifier chain.
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
> + * lenovo-wmi-other driver notifier chain.
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
> + * lenovo-wmi-other driver notifier chain.
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
> + * lenovo-wmi-other driver notifier chain. Then add devm_lwmi_om_unregi=
ster_notifier
> + * as a device managed action to automatically unregister the notifier =
block
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
> + * Return: Either number of characters written to buf, or an error code=
.
> + */
> +static ssize_t attr_capdata01_show(struct kobject *kobj,
> +				   struct kobj_attribute *kattr, char *buf,
> +				   struct tunable_attr_01 *tunable_attr,
> +				   enum attribute_property prop)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct capdata01 capdata;
> +	u32 attribute_id;
> +	int value, ret;
> +
> +	attribute_id =3D
> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_CUSTOM) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	//capdata =3D devm_kzalloc(&priv->wdev->dev, sizeof(*capdata), GFP_KER=
NEL);
> +	//if (!capdata)
> +	//	return -ENOMEM;

As already mentioned by other reviewers such dead code should not land ins=
ide the mainline kernel.

With both issues being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	if (ret)
> +		return ret;
> +
> +	switch (prop) {
> +	case DEFAULT_VAL:
> +		value =3D capdata.default_value;
> +		break;
> +	case MAX_VAL:
> +		value =3D capdata.max_value;
> +		break;
> +	case MIN_VAL:
> +		value =3D capdata.min_value;
> +		break;
> +	case STEP_VAL:
> +		value =3D capdata.step;
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
> + * method is range checked and an error code is returned if out of rang=
e.
> + *
> + * If the value is valid and WMI is success, then the sysfs attribute i=
s
> + * notified.
> + *
> + * Return: Either count, or an error code.
> + */
> +static ssize_t attr_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *kattr,
> +					const char *buf, size_t count,
> +					struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	struct capdata01 capdata;
> +	enum thermal_mode mode;
> +	u32 attribute_id;
> +	u32 value;
> +	int ret;
> +
> +	ret =3D lwmi_om_notifier_call(&mode);
> +	if (ret)
> +		return ret;
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
> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D kstrtouint(buf, 10, &value);
> +	if (ret)
> +		return ret;
> +
> +	if (value < capdata.min_value || value > capdata.max_value)
> +		return -EINVAL;
> +
> +	args.arg0 =3D attribute_id;
> +	args.arg1 =3D value;
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> +				    (unsigned char *)&args, sizeof(args), NULL);
> +
> +	if (ret)
> +		return ret;
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
> + * Return: Either number of characters written to buf, or an error code=
.
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
> + * Return: Either 0, or an error code.
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
> + * Return: 0 on success, or an error code.
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
> index 000000000000..8ebf5602bb99
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
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
