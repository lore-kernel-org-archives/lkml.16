Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1D29A5;
	Mon,  5 May 2025 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746408796; cv=none; b=p2dLBRM6NI20cWkqj1zhDEGz1HKMRcPOQMFyEKhYRt59W38sMMtOL/XAGNbY5hqms8ygYAajTdDyZSz5VMgr9mX281aEnBcP1Ft/w/L5uqSp0XKMEe3ekahP3ef1zKX7iImAdoTMo5Al2uTX82IJ4FDvbRaqi4jvs4rcBuGYS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746408796; c=relaxed/simple;
	bh=RXCLKyCSwWDf2jPseVFHmYUReM/vp82kMSMwf0rrAl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayRpTAaw5Jm0bQ4xlvwyG5ZroG/Zp+RLYHYhGJonn6HeUMDNZThl1Ebs9gQJPwkbYY2P/avzXrK6rtaG9Pjc6pcTOI+oTvvpIx9FRiwvdrl/VwvZKOyWdTerB6x+wwn4rTk60mD4f8wwpWRYuEWKLnu2ac6XhfmvPPJxRKW7OM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qWVCud9w; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qWVCud9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746408769; x=1747013569; i=w_armin@gmx.de;
	bh=nlQdyttFTn3Kd21Ml7s6/CK7w3FkB3Xp9qiOV9zmTyc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qWVCud9wbtEcb12kSLEDKxdWB7jMjCC72xxjRKtSVpMVlWeSCSN5PSFA/1IA/uW2
	 Dkpjc1F5gQCeSNiUbdUJNXWV9XmNywApPLrTPgGzKx/22yOiwY86A8iOG84rjNKHY
	 qyFHGiZjKRTbZ057QT5KNhZwHMm97sdtLcmWjvzYRGK9jjqlqADZIQDqr+2krIck8
	 jkKp6KLaJPnomiToS4t4qaIfzB9vK8uLZJ6ruOrgveiCVIBDszw28oAh1njL8/oCo
	 8P7NtOV87d1lJ1wQMZHtpNF1iV2HfLsxEJF8CJ1ZBNN2NjZPQMeYahT8SlTg+KNUm
	 vBK0LmeSqGLGhvSEiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbirE-1ukXp10Pk6-00aaQV; Mon, 05
 May 2025 03:32:49 +0200
Message-ID: <c6ce49f7-cf45-469d-a151-b157d5f182b7@gmx.de>
Date: Mon, 5 May 2025 03:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] platform/x86: Add Lenovo Capability Data 01 WMI
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
 linux-kernel@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250505010659.1450984-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VOusynJbcWXHKnyzQ/mZTkfooxMjUJ3vEfAZeW51PcA/zmYwzjo
 qg7V68aCCPBi9cDnEMbHRnIbftgzNNAdrpOyncKRXTiwLXZmnarfAV9IfD9BDut7Xu2vWWf
 wQO+0i48SlZwg7KnXwliAwpRbsrSB5fZpfMz0HHMztZc1mlUjtYJf3UwJpvt2WRughXnEaa
 5+THZgGaCILwr6H2M9/2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6EQ8GBB3DTk=;9eXewk/F1A1zWmd8Y2HtQnLUjlY
 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
 rasA=

Am 05.05.25 um 03:06 schrieb Derek J. Clark:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v8:
>   - Use devm_mutex_init() instead of mutex_init().
>   - Check return of devm_add_action_or_reset during probe.
>   - Don't check if cd01 list exists in bind as the driver will bail if
>     there is a malloc/populating issue prior to bind.
>   - Fix typos.
> v7:
>   - Do memcpy instead of returning pointer in lwmi_cd01_get_data.
>   - Put list mutex inside lwmi_cd01_priv struct.
>   - Unregister from acpi events on dev remove.
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
>   MAINTAINERS                                 |   1 +
>   drivers/platform/x86/Kconfig                |   4 +
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 300 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  25 ++
>   5 files changed, 331 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b4b06e81192..1b22e41cc730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>   F:	drivers/platform/x86/lenovo-wmi-events.*
>   F:	drivers/platform/x86/lenovo-wmi-helpers.*
>  =20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 13b8f4ac5dc5..64663667f0cb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>   	tristate
>   	depends on ACPI_WMI
>  =20
> +config LENOVO_WMI_DATA01
> +	tristate
> +	depends on ACPI_WMI
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index fc039839286a..7a35c77221b7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>  =20
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platf=
orm/x86/lenovo-wmi-capdata01.c
> new file mode 100644
> index 000000000000..9e2758426564
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Capability Data 01 WMI Data Block driver.
> + *
> + * Lenovo Capability Data 01 provides information on tunable attributes=
 used by
> + * the "Other Mode" WMI interface. The data includes if the attribute i=
s
> + * supported by the hardware, the default_value, max_value, min_value, =
and step
> + * increment. Each attribute has multiple pages, one for each of the th=
ermal
> + * modes managed by the Gamezone interface.
> + *
> + * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include "linux/printk.h"
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/gfp_types.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/mutex_types.h>
> +#include <linux/notifier.h>
> +#include <linux/overflow.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-capdata01.h"
> +
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE0=
18154"
> +
> +#define ACPI_AC_CLASS "ac_adapter"
> +#define ACPI_AC_NOTIFY_STATUS 0x80
> +
> +struct lwmi_cd01_priv {
> +	struct notifier_block acpi_nb; /* ACPI events */
> +	struct wmi_device *wdev;
> +	struct cd01_list *list;
> +};
> +
> +struct cd01_list {
> +	struct mutex list_mutex; /* list R/W mutex */
> +	u8 count;
> +	struct capdata01 data[];
> +};
> +
> +/**
> + * lwmi_cd01_component_bind() - Bind component to master device.
> + * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> + * @data: capdata01_list object pointer used to return the capability d=
ata.
> + *
> + * On lenovo-wmi-other's master bind, provide a pointer to the local ca=
pdata01
> + * list. This is used to call lwmi_cd01_get_data to look up attribute d=
ata
> + * from the lenovo-wmi-other driver.
> + *
> + * Return: 0
> + */
> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
> +				    struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> +	struct cd01_list **cd01_list =3D data;
> +
> +	*cd01_list =3D priv->list;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops lwmi_cd01_component_ops =3D {
> +	.bind =3D lwmi_cd01_component_bind,
> +};
> +
> +/**
> + * lwmi_cd01_get_data - Get the data of the specified attribute
> + * @dev: The lenovo-wmi-capdata01 parent device.
> + * @tunable_attr: The attribute to be found.
> + * @output: Pointer to a capdata01 struct to return the data.
> + *
> + * Retrieves the capability data 01 struct pointer for the given
> + * attribute for its specified thermal mode.
> + *
> + * Return: 0 on success, or -EINVAL.
> + */
> +int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct=
 capdata01 *output)
> +{
> +	u8 idx;
> +
> +	guard(mutex)(&list->list_mutex);
> +	for (idx =3D 0; idx < list->count; idx++) {
> +		if (list->data[idx].id !=3D attribute_id)
> +			continue;
> +		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
> +		return 0;
> +	};
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
> +
> +/**
> + * lwmi_cd01_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata01 driver data.
> + *
> + * Loop through each WMI data block and cache the data.
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
> +{
> +	int idx;
> +
> +	guard(mutex)(&priv->list->list_mutex);
> +	for (idx =3D 0; idx < priv->list->count; idx++) {
> +		union acpi_object *ret_obj __free(kfree) =3D NULL;
> +
> +		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> +		if (!ret_obj)
> +			return -ENODEV;
> +
> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> +		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
> +			continue;
> +
> +		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
> +		       ret_obj->buffer.length);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
> + * @priv: lenovo-wmi-capdata01 driver data.
> + *
> + * Allocate a cd01_list struct large enough to contain data from all WM=
I data
> + * blocks provided by the interface.
> + *
> + * Return: 0 on success, or an error.
> + */
> +static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
> +{
> +	struct cd01_list *list;
> +	size_t list_size;
> +	int count;
> +
> +	count =3D wmidev_instance_count(priv->wdev);
> +	list_size =3D struct_size(list, data, count);
> +
> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	devm_mutex_init(&priv->wdev->dev, &list->list_mutex);

Please check the result of devm_mutex_init(), as this function might fail.

Other than that the whole series looks good to me. Hopefully we can finall=
y merge this
for the 6.16 kernel cycle.

Thanks,
Armin Wolf

> +	list->count =3D count;
> +	priv->list =3D list;
> +
> +	return 0;
> +}
> +
> +/**
> + * lwmi_cd01_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata01 driver data.
> + *
> + * Allocate a cd01_list struct large enough to contain data from all WM=
I data
> + * blocks provided by the interface. Then loop through each data block =
and
> + * cache the data.
> + *
> + * Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
> +{
> +	int ret;
> +
> +	ret =3D lwmi_cd01_alloc(priv);
> +	if (ret)
> +		return ret;
> +
> +	return lwmi_cd01_cache(priv);
> +}
> +
> +/**
> + * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 dri=
ver notifier.
> + * block call chain.
> + * @nb: The notifier_block registered to lenovo-wmi-events driver.
> + * @action: Unused.
> + * @data: The ACPI event.
> + *
> + * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_pr=
ofile
> + * of a change.
> + *
> + * Return: notifier_block status.
> + */
> +static int lwmi_cd01_notifier_call(struct notifier_block *nb, unsigned =
long action,
> +				   void *data)
> +{
> +	struct acpi_bus_event *event =3D data;
> +	struct lwmi_cd01_priv *priv;
> +	int ret;
> +
> +	if (strcmp(event->device_class, ACPI_AC_CLASS) !=3D 0)
> +		return NOTIFY_DONE;
> +
> +	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
> +
> +	switch (event->type) {
> +	case ACPI_AC_NOTIFY_STATUS:
> +		ret =3D lwmi_cd01_cache(priv);
> +		if (ret)
> +			return NOTIFY_BAD;
> +
> +		return NOTIFY_OK;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +/**
> + * lwmi_cd01_unregister() - Unregister the cd01 ACPI notifier_block.
> + * @data: The ACPI event notifier_block to unregister.
> + */
> +static void lwmi_cd01_unregister(void *data)
> +{
> +	struct notifier_block *acpi_nb =3D data;
> +
> +	unregister_acpi_notifier(acpi_nb);
> +}
> +
> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context=
)
> +
> +{
> +	struct lwmi_cd01_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	ret =3D lwmi_cd01_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
> +
> +	ret =3D register_acpi_notifier(&priv->acpi_nb);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &pr=
iv->acpi_nb);
> +	if (ret)
> +		return ret;
> +
> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
> +}
> +
> +static void lwmi_cd01_remove(struct wmi_device *wdev)
> +{
> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_cd01_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_cd01",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_cd01_id_table,
> +	.probe =3D lwmi_cd01_probe,
> +	.remove =3D lwmi_cd01_remove,
> +	.no_singleton =3D true,
> +};
> +
> +/**
> + * lwmi_cd01_match() - Match rule for the master driver.
> + * @dev: Pointer to the capability data 01 parent device.
> + * @data: Unused void pointer for passing match criteria.
> + *
> + * Return: int.
> + */
> +int lwmi_cd01_match(struct device *dev, void *data)
> +{
> +	return dev->driver =3D=3D &lwmi_cd01_driver.driver;
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> +
> +module_wmi_driver(lwmi_cd01_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/platf=
orm/x86/lenovo-wmi-capdata01.h
> new file mode 100644
> index 000000000000..bd06c5751f68
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_CAPDATA01_H_
> +#define _LENOVO_WMI_CAPDATA01_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct cd01_list;
> +
> +struct capdata01 {
> +	u32 id;
> +	u32 supported;
> +	u32 default_value;
> +	u32 step;
> +	u32 min_value;
> +	u32 max_value;
> +};
> +
> +int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct=
 capdata01 *output);
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
