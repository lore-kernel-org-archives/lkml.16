Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864213F9C5;
	Sun,  4 May 2025 02:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746325131; cv=none; b=gBIooXxJ9Zq39uwM9OtLNk11zgnW5lXohDq0wuOCwrlJQCVSzNIz/BbH81/rY0T2AqyBNIQvC2+nF2SGA87uveKYRxFyVHjiPdtAwpHSn6d8ETjc4c+o0KU1rftUS3AirGNL9T+pzBXsHapgV604o3dxh8TvAW2r/TL6gSfIYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746325131; c=relaxed/simple;
	bh=bIqcHm9oZPE2+ERKOZxCA7KGOZfmixRICFMbx9YEVnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFjRSxPChTUzifX9BmGtbwS/tO1xyzwqIetF+vo9PtVr0JulZvweb+Q1spYAjuqiJ0uqBQQ401TQR0hIan9VslpuahC3u6Vsdz+VanCVFB7lSLQ1x22xOnaaYpc/sjbVGUzuFmPI3jSRLsftkW7O71+ozwSBQahXfbk9u5pR1l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QF9orq3f; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QF9orq3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746325126; x=1746929926; i=w_armin@gmx.de;
	bh=tmjIWsowaDtARrOXOAkiN2I0yQuLV5R9BxAnfMQz3iI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QF9orq3filp9tgqj4gSc2cy+UpQqHHhADFdiwzCB/FhjONyKBlFHYDnz0G+IJxRi
	 zLFOgVBdeajeruula0rLLeNxEBYgCcWXImeKuOG4brttQwuzAIKNh36jxu/9b3JfK
	 7M0OPQ9Vjmt3fi40ycQrmix+f57/nULKBEWHVWf1tWiGhAnOIahj7OsRHhBvmeQ3I
	 yq1k9nu3j4XHHR8dtIiPhg7ROiM7wSVhwQzIpaLoBxL3QJIs1mytwXW0hNbGDUrqN
	 0QGKEbr2BqAFcYHCfW/A0g7NDKf6pslVopytUnBU1yMvR1iye20joHh0cNxlmOoI7
	 xaMysjTuX27GGUEb8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1uTCwJ0x5V-00KYgr; Sun, 04
 May 2025 04:18:46 +0200
Message-ID: <b8f05aba-1f99-4268-9f6b-36b77087cf5b@gmx.de>
Date: Sun, 4 May 2025 04:18:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] platform/x86: Add Lenovo Capability Data 01 WMI
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
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
 <20250503000142.1190354-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250503000142.1190354-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f4wLqKiF25+bbwAT5HWR/HgSX6Z+AWZaosDllcw4yfMIerbHeAZ
 PXbIfNtvsJweVVRakgCIU6pD1t042bnqTjUJzG36c2Fxd+DGctdGWncp4uNqGaXELtNXc9A
 P+hlQnBlXcOusE4rAleFFtTJuH0jzQEwcmitL/RdH4V//ihnOsFtqrFabrbylQ1caU3x7RH
 TzygOZqItCTxB8D1LKQuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c3XH437lfcE=;xI2bE6F0jLq3AXdnXIz3IIDzxr7
 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

Am 03.05.25 um 02:01 schrieb Derek J. Clark:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> --
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
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 301 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  25 ++
>   5 files changed, 332 insertions(+)
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
> index 000000000000..419b51f7f7c3
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,301 @@
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
> + * increment. Each attibute has multiple pages, one for each of the the=
rmal
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
> +:* Return: 0 on success, or an error code.
> + */
> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
> +				    struct device *om_dev, void *data)
> +{
> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> +	struct cd01_list **cd01_list =3D data;
> +
> +	if (!priv->list)
> +		return -ENODEV;

Hi,

can priv->list ever be NULL after initialization?

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
> +	mutex_init(&list->list_mutex);

Please use devm_mutex_init() here.

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
> +	devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &priv->acpi=
_nb);

Please check the return value of devm_add_action_or_reset() here.

With those issues being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
