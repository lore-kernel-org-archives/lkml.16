Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965651AB6C8;
	Wed, 16 Apr 2025 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744839764; cv=none; b=OmRdCfezGe8kb/O/UzyfG9kZfYmAxHpl6fulnzZEJkI0IswunfHbiVjteI4R2s8RYRCBOSoW4Z/Nuk7jM5hasHleiWMM51vWKZydwdsBpWh+tvWTHg0GK6ebc/gz5+GN8o8hWXrRGFGEHYUes9JY+4hOapzia5ra+7bKr5aTuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744839764; c=relaxed/simple;
	bh=S0MFkebcrhkrfj7OzEebtBywdhUEY4up/iqhbOZ7Z1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtlTxPH8CLO6fFwHpfw0SvKwD7MNEApogJp4jb1ZIpeJ4xoKSMi1Qsa/1l8SgZ3xc46u5p0LM54muiIObe2uJxrOGvaIMStmpNueAtUXeg5lKQ3SeYJYrL/KseDjjoPLcQg4D6HQ3986eXVlXXYNEbhk+VWYAQHDCY1tWZsiufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=A2nL5674; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="A2nL5674"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744839752; x=1745444552; i=w_armin@gmx.de;
	bh=V0uPkdlLD0oy+by5MXA0qaYEV2bXSTaIo+mydwPDJPA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=A2nL5674dBh0TZxQHqEZvzUsa8bo960VgFjU622zcp9oXxCF3yds83p5pFdpzRzH
	 9cwcg36u8K9NWzyrCQAlmfUoDhtVjmMNN+EsYWY38+y85hGr/PG2etE/eDuITdBjM
	 FcavYnR+/C6WBApZlRw5H9GJvtowmkeI/VERYz/jrgFlsV1DBFCwNrczepUsmxzKK
	 JlRMkfrqdRCh/HmhdkfskJ5uzULymPS2+ImpmO6azjYemHO8KxmWdYiYaXpWA2/73
	 oAfclStc3xn7SFlm7fe229b+wQjzPt4DZGR86KKngtz8DpmClSBXgRmViZaFd7z/k
	 m/jYFz5cU1NAZK65+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWASe-1ucmLt3H5O-00IJUE; Wed, 16
 Apr 2025 23:42:31 +0200
Message-ID: <75e41f6b-db39-4437-bee6-9898e784f20a@gmx.de>
Date: Wed, 16 Apr 2025 23:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] platform/x86: Add Lenovo Capability Data 01 WMI
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
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-5-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250408012815.1032357-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pHgFkuIpqHST0Hfj6qqbjeZLnLGwZuVmfl09EqbywznwjvkmAwm
 eBQHJ3+cDhy6btBZNGSXM1QTx6OZcZkLLGh7XH1T87o/cTlO4OORMlXn/wLHzUj8YeTTJut
 2igOZ537o10HrFQUJ/kv6N/YV7Y9pEO2pJazJF0XDycwkgKU2VOk752goY3tMyn59qRWBGR
 eKu8DtzQPJ0gQYYkwrMPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3YuyfiLZxhA=;SV+DwvtPLW9Jq2mq1WhEISsmiSF
 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
 JAOk7L5CXEnUw=

Am 08.04.25 um 03:28 schrieb Derek J. Clark:

> Adds lenovo-wmi-capdata01 driver which provides the
> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> enabled hardware. Provides an interface for querying if a given
> attribute is supported by the hardware, as well as its default_value,
> max_value, min_value, and step increment.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
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
>   MAINTAINERS                                 |   2 +
>   drivers/platform/x86/Kconfig                |   4 +
>   drivers/platform/x86/Makefile               |   1 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c | 168 ++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h |  28 ++++
>   5 files changed, 203 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6dde75922aaf..56ead241a053 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13164,6 +13164,8 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.c
> +F:	drivers/platform/x86/lenovo-wmi-capdata01.h
>   F:	drivers/platform/x86/lenovo-wmi-events.c
>   F:	drivers/platform/x86/lenovo-wmi-events.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
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
> index 000000000000..a5255e080e87
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> @@ -0,0 +1,168 @@
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
> +#include <linux/overflow.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include "lenovo-wmi-capdata01.h"
> +
> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE0=
18154"
> +
> +struct lwmi_cd01_priv {
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
> + * list. This is used to look up attribute data by the lenovo-wmi-other=
 driver.
> + *
> + * Return: 0 on success, or on error.
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
> + * lwmi_cd01_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata01 driver data.
> + *
> + * Allocate a cd01_list struct large enough to contain data from all WM=
I data
> + * blocks provided by the interface. Then loop through each data block =
and
> + * cache the data.
> + *
> + * Return: 0 on success, or on error.
> + */
> +static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
> +{
> +	struct cd01_list *list;
> +	size_t list_size;
> +	int count, idx;
> +
> +	count =3D wmidev_instance_count(priv->wdev);
> +	list_size =3D struct_size(list, data, count);
> +
> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
> +	if (!list)
> +		return -ENOMEM;
> +
> +	list->count =3D count;
> +
> +	for (idx =3D 0; idx < count; idx++) {
> +		union acpi_object *ret_obj __free(kfree) =3D NULL;
> +
> +		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> +		if (!ret_obj)
> +			return -ENODEV;
> +
> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> +		    ret_obj->buffer.length < sizeof(struct capdata01))

I would prefer if you use sizeof(list->data[idx]) instead of sizeof(struct=
 capdata01).
This way the code will automatically adapt should the type of list->data[i=
dx] change.

With this minor thing being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +			continue;
> +
> +		memcpy(&list->data[idx], ret_obj->buffer.pointer,
> +		       ret_obj->buffer.length);
> +	}
> +
> +	priv->list =3D list;
> +
> +	return 0;
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
> + * Return: bool.
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
> index 000000000000..15974ce5e008
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> @@ -0,0 +1,28 @@
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
> +
> +int lwmi_cd01_match(struct device *dev, void *data);
> +
> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
