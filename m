Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972E10A1F;
	Fri,  2 May 2025 02:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746152350; cv=none; b=dTtkGBFQ2O1E+842U6rtq/lp56cdYzQYRIBt9ysY80s0r9gyjJashVtyoynpHCYHJlbogogzpvsD6FLhgppoWa++tyuY5iyTceIDfkQSesfj+6HFd7giZU7sjinVALs83CRnsvvgs+GnK9/Sxbz3VB6BEmE7QOqaV6wlpaltaGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746152350; c=relaxed/simple;
	bh=IYicZgPetsCcW0rHH2GIJ76nEa0reP7obSgzSa0hZNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGsvWF/O4k9FbMmtTef8ckjy3Rvt70qsXS3so4mAWfzPjn+9dNUgauDZpHELsGu67FO6a4h2VXXjC8hIMBSWXRGqgIIQ35QOovq5Fd8iOGhDLwb9gZ9KfXwnSDyp6eG9mLWEQbLfCJUK21xvOh3YbeWuP9EjGob+yh3kdy+kDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=srFStU4T; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="srFStU4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746152326; x=1746757126; i=w_armin@gmx.de;
	bh=CKp9VtoTQKU4hiYzSo2fdwaslsjZBQ2bNTZqb2RVBQc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=srFStU4TDBTIPqp5U1ql0h7Nla5sXlZ05b2mqhU4JA2seu06kZ+HxBYQRDHKY1va
	 GZZB8Df4i3X/4j3hGE9bTx1f5QftktmOMQXHrhd2qdzMTLxJ3f8j3T1awRneJSuBd
	 yFUmOTECCVCv82UOxbZEdO9A0pkT1Yyv1q+QFQ4v0Oui3RqIr1jORnFrGOBiaJ3iP
	 Rn96E0vdmtZC7CCfu43Oj/W1BXKjmIpe5s9/wjM2afOezlkO3y2OJG3rCSFOPiW+f
	 eumliy3YTS1q5o9u9/GumtqZitFSIsecibBa2WPkvKljKypfj2xDYlrJWy2NbAcHL
	 nH1af0Ta2izqZ6b6vQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybKf-1uyfLX08eD-018Kch; Fri, 02
 May 2025 04:18:46 +0200
Message-ID: <a339b4b5-c7ca-4875-adb8-183539be563f@gmx.de>
Date: Fri, 2 May 2025 04:18:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] platform/x86: Add Lenovo WMI Capability Data 01
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
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250428012029.970017-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ErBqincnMxgHdHHNPYjSnf0XEsQaPiEWi+l683xfVyNuZb0QgYT
 SDcUYffgYG8PgQ0XolNtktdwM7DpBnkmyHLYgg4d+jSTUsM5VouGDoZ9UG4CPe2zx4OHW4H
 3elJBINvpVepo91bxMI0B9NguzEnwtMNb7CdUDippmpSgOyog3yZM7rriQpvm1aITe5nHVJ
 fJv80/qjrbcUjjStQZL9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mjwstcm9lpk=;HnNXk2GfNnssYt27WjDK8cAYTEZ
 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
 aFRyTCaGsN2qK3pT5FFc7vjiJpzs4Hwg5qB6P7V5Ea1G9SaV2SsxPp9YvwMWAF4lAHrHKdjMj
 HhsTHo91g46MeTQiyZ26G1iIXJVktvTzWqzqPB5KC7gSIuXvRTb+vWQltuCSilxcphpg3bYO2
 U4HNvMKfBxPfwVsDM4VAdxmLq3I2IXVuZQ6bKMUZMNDbneYiV9UU6b+WryURggouusOMI2ocI
 eQoZJyT675kNRyofQkO+PdpGpZ4WTd+omZQ76kdDyYc49YuaATOMtOhriKHDh2O9zAkyn1u+Q
 3/yN03oppxUpqF+nzoZ9YlCKQQhUNmxJ4xNS5w2AugHsmxJDhkNmT/I4+8Z/yT9hFysI8huOw
 707uxndLhnd4W/4PyPPvNPy1CVLSbZyVDE+hxxTHOda/2VqyD8VGmF8JZpVMnSTNIoEyXpXvS
 yTU9EVY7PyCjqHe9LfNbBSY+Xe8QO8+DCpXteN+6bjyJxOLmxEwrQ58ISmIzVGcpViEFiXDbt
 lJhDkFohVm6SJmUUwd22ulK7emgHO1VMP+wd4dZJ61U0aOJWEPd6znkonGedr7VpmEvwik7RO
 QKpK9Le5pNymZ1j3Ha6X+LmP5Q9BJeWOnr+h9cuibjfJLP8CVj7okYPRePoaocOWX7dW+YSVS
 uu/B+XSaPhG1IqMVQYJfbXPi1p9/Wyh1wXnW+oj0U5sHiqnf5h73Z5FQ==

Am 28.04.25 um 03:18 schrieb Derek J. Clark:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
>   MAINTAINERS                                 |   1 +
>   drivers/platform/x86/Kconfig                |   4 +
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 272 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++
>   5 files changed, 307 insertions(+)
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
> index 000000000000..841d4a37249b
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,272 @@
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
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/gfp_types.h>
> +#include <linux/module.h>
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
> +#define ACPI_AC_NOTIFY_STATUS 0x80
> +
> +static DEFINE_MUTEX(list_mutex);

Hi,

why not moving this mutex inside struct cd01_list?

> +
> +struct lwmi_cd01_priv {
> +	struct notifier_block acpi_nb; /* ACPI events */
> +	struct wmi_device *wdev;
> +	struct cd01_list *list;
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
> + * @tunable_attr: The attribute to be populated.
> + *
> + * Retrieves the capability data 01 struct pointer for the given
> + * attribute for its specified thermal mode.
> + *
> + * Return: Either a pointer to capability data, or NULL.
> + */
> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attrib=
ute_id)
> +{
> +	u8 idx;
> +
> +	guard(mutex)(&list_mutex);
> +	for (idx =3D 0; idx < list->count; idx++) {
> +		if (list->data[idx].id !=3D attribute_id)
> +			continue;
> +		return &list->data[idx];

This might cause issues should lwmi_cd01_cache() be called when the caller=
 of this function
currently accesses the returned data.

Maybe it would make sense to simply copy the struct capdata01? It is rathe=
r small, so the overhead
would be negligible.

I envision something like this:

int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct ca=
pdata01 *output);

In this case the resulting capdata is copied into "output".

> +	}
> +	return NULL;
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
> +	guard(mutex)(&list_mutex);
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
> +	guard(mutex)(&list_mutex);
> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
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
> +	struct acpi_bus_event *event =3D (struct acpi_bus_event *)data;

Unnecessary cast, please drop.

> +	struct lwmi_cd01_priv *priv;
> +	int ret;
> +
> +
> +	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
> +
> +	switch (event->type) {
> +	case ACPI_AC_NOTIFY_STATUS:

You should also check the the "device_class" of the ACPI event (search for=
 ACPI_AC_CLASS)
because "type" is not guaranteed to be unique between different events.

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
> +	register_acpi_notifier(&priv->acpi_nb);
> +
> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);

You need to unregister the ACPI notifier when component_add() fails.

> +}
> +
> +static void lwmi_cd01_remove(struct wmi_device *wdev)
> +{
> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);

Same as above. You could use devm_add_action_or_reset() to fix both cases.

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
> index 000000000000..ed4f3d86464d
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> +
> +#ifndef _LENOVO_WMI_CAPDATA01_H_
> +#define _LENOVO_WMI_CAPDATA01_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
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
> +struct cd01_list {
> +	u8 count;
> +	struct capdata01 data[];
> +};

Since client driver are not directly accessing this struct anyway please k=
eep its definition private
and only provide an incomplete definition in this header:

	struct cd01_list *;

Thanks,
Armin Wolf

> +
> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attrib=
ute_id);
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
