Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19C1F4285;
	Fri,  2 May 2025 21:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220262; cv=none; b=IQmDsF5YSG8S5mKvKNcy2db1XMS4AMAMOO77lYzvrsRI6mD/FvgTcFmye1dNMJWmu1fTc+HyxPACjjXnaV9sHTfLzuCD3WmnRLTa2qfGz1C78Lyi+vZyW8tlDh7uFbPlQmMTHmkU3twGsU8roHBpbKJitUaA1J1AcZ74MJWnbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220262; c=relaxed/simple;
	bh=sUr/KF8tONEZk7JCddltZmI46hVMBbO1JPwY7cvXl9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORGnP0ylPk4fGCyOQhdCtY28wO+B+2JXox9O2r6+LCocQo1Ahuu9JyttTUQoXXtSAjGCG/X3wFgH4U/89/RWIENlrL2K0YNO2cszk/kqXU3ZhICiZIXtR5v4ggOnU2/R6kgHpFHTQmkwgeczpxuIl+8TPK7OynU4apbS5IuMODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=frwP+XMr; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="frwP+XMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746220243; x=1746825043; i=w_armin@gmx.de;
	bh=WGt8yAxjKAeO73w5WC9u7I+3CECRMXIXLItZqHVCiuc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=frwP+XMr6lhXBaIByn/41Iu+tmWXZAX7mOi0XJNJPztDy48eK//m/ILQywvz5pb1
	 BdVhVWxbuehzj2H0+zJ8r4AlmuGtOl0fYtpw6p9/Y8ha1IFoP/hOmxObDEhgd2MHR
	 mVFiA9738Kwt4BvxhUucQS74ljygsS95/dE53WdIxrP4b3IPtOHQhjPNXVdfKmDhZ
	 1hGPfETveOquniqHn8clANHVTlkD9KXummnuzkP+84SL5K3YGFQjZ6oSxqMm84yxX
	 6wbQRlndowDmBZ/s/ciJpGqWsxPwYxtKy3u06O9UG9PkLTXllnM6yWD7rVXJl+rWx
	 wgKuNyhicwvs6IXDHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1uF2GI11g9-00G8fL; Fri, 02
 May 2025 23:10:43 +0200
Message-ID: <99496c39-d25f-48b0-8746-261584e3fc67@gmx.de>
Date: Fri, 2 May 2025 23:10:39 +0200
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
 <a339b4b5-c7ca-4875-adb8-183539be563f@gmx.de>
 <20FEC2FF-775F-49F5-9DAA-4641C73B0367@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20FEC2FF-775F-49F5-9DAA-4641C73B0367@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5sR9gt7idgAKL7zjXZ6Rs2yHOMC3Ker2bIwUvvr4ipYFpdZVxq8
 2OwnypEYBIdcnb7+lUreTQSZtG4/kraQcCGQP0kz/549ief589WtEYjJ6Ev8Guz0D0MFfsH
 6QzP5f5Pzc7XobYHJvyB4KGfsahfjAvbY3cLBTQSxLcwULJs8ec6r+ZzImPq79GCA9z28+g
 ABX+soA/x9/Dl6OhZn5cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l7+xXb2mh1w=;TQvKFn6hpaUQw8ldThDI63RnL3T
 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

Am 02.05.25 um 17:51 schrieb Derek J. Clark:

>
> On May 1, 2025 7:18:40 PM PDT, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 28.04.25 um 03:18 schrieb Derek J. Clark:
>>
>>> Adds lenovo-wmi-capdata01 driver which provides the
>>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
>>> enabled hardware. Provides an interface for querying if a given
>>> attribute is supported by the hardware, as well as its default_value,
>>> max_value, min_value, and step increment.
>>>
>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>> v6:
>>>    - Recache capabiltiy data on ACPI AC events to ensure accutare
>>>      max_value.
>>>    - Fix typos and rewordings from v5 review.
>>> v5:
>>>    - Return to cache at device initialization. On component bind, pass=
 a
>>>      pointer to lenovo-wmi-other.
>>>    - Fixes from v4 review.
>>> v4:
>>>    - Make driver data a private struct, remove references from Other M=
ode
>>>      driver.
>>>    - Don't cache data at device initialization. Instead, on component =
bind,
>>>      cache the data on a member variable of the Other Mode driver data
>>>      passed as a void pointer.
>>>    - Add header file for capdata01 structs.
>>>    - Add new struct to pass capdata01 array data and array length to O=
ther
>>>      Mode.
>>> v3:
>>> - Add as component to lenovo-wmi-other driver.
>>> v2:
>>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>>     reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
>>> - Use list to get the lenovo_wmi_cd01_priv instance in
>>>     lenovo_wmi_capdata01_get as none of the data provided by the macro=
s
>>>     that will use it can pass a member of the struct for use in
>>>     container_of.
>>>    MAINTAINERS                                 |   1 +
>>>    drivers/platform/x86/Kconfig                |   4 +
>>>    drivers/platform/x86/Makefile               |   1 +
>>>    drivers/platform/x86/lenovo-wmi-capdata01.c | 272 +++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++
>>>    5 files changed, 307 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2b4b06e81192..1b22e41cc730 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger.kernel.org
>>>    S:	Maintained
>>>    F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>    F:	Documentation/wmi/devices/lenovo-wmi-other.rst
>>> +F:	drivers/platform/x86/lenovo-wmi-capdata01.*
>>>    F:	drivers/platform/x86/lenovo-wmi-events.*
>>>    F:	drivers/platform/x86/lenovo-wmi-helpers.*
>>>    diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
>>> index 13b8f4ac5dc5..64663667f0cb 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>>>    	tristate
>>>    	depends on ACPI_WMI
>>>    +config LENOVO_WMI_DATA01
>>> +	tristate
>>> +	depends on ACPI_WMI
>>> +
>>>    config IDEAPAD_LAPTOP
>>>    	tristate "Lenovo IdeaPad Laptop Extras"
>>>    	depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index fc039839286a..7a35c77221b7 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>>>    obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>>>    obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.=
o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
>>> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>>>    obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>>>    obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
>>>    diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/=
platform/x86/lenovo-wmi-capdata01.c
>>> new file mode 100644
>>> index 000000000000..841d4a37249b
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
>>> @@ -0,0 +1,272 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Lenovo Capability Data 01 WMI Data Block driver.
>>> + *
>>> + * Lenovo Capability Data 01 provides information on tunable attribut=
es used by
>>> + * the "Other Mode" WMI interface. The data includes if the attribute=
 is
>>> + * supported by the hardware, the default_value, max_value, min_value=
, and step
>>> + * increment. Each attibute has multiple pages, one for each of the t=
hermal
>>> + * modes managed by the Gamezone interface.
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/component.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/device.h>
>>> +#include <linux/export.h>
>>> +#include <linux/gfp_types.h>
>>> +#include <linux/module.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/overflow.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +#include "lenovo-wmi-capdata01.h"
>>> +
>>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>>> +
>>> +#define ACPI_AC_NOTIFY_STATUS 0x80
>>> +
>>> +static DEFINE_MUTEX(list_mutex);
>> Hi,
>>
>> why not moving this mutex inside struct cd01_list?
>>
> I can do that. Is that preferable over adding it to priv?

You can also add it to priv, but keep in mind that lwmi_cd01_get_data() ne=
eds to access it.

>>> +
>>> +struct lwmi_cd01_priv {
>>> +	struct notifier_block acpi_nb; /* ACPI events */
>>> +	struct wmi_device *wdev;
>>> +	struct cd01_list *list;
>>> +};
>>> +
>>> +/**
>>> + * lwmi_cd01_component_bind() - Bind component to master device.
>>> + * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent devic=
e.
>>> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
>>> + * @data: capdata01_list object pointer used to return the capability=
 data.
>>> + *
>>> + * On lenovo-wmi-other's master bind, provide a pointer to the local =
capdata01
>>> + * list. This is used to call lwmi_cd01_get_data to look up attribute=
 data
>>> + * from the lenovo-wmi-other driver.
>>> + *
>>> +:* Return: 0 on success, or an error code.
>>> + */
>>> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
>>> +				    struct device *om_dev, void *data)
>>> +{
>>> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
>>> +	struct cd01_list **cd01_list =3D data;
>>> +
>>> +	if (!priv->list)
>>> +		return -ENODEV;
>>> +
>>> +	*cd01_list =3D priv->list;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct component_ops lwmi_cd01_component_ops =3D {
>>> +	.bind =3D lwmi_cd01_component_bind,
>>> +};
>>> +
>>> +/**
>>> + * lwmi_cd01_get_data - Get the data of the specified attribute
>>> + * @dev: The lenovo-wmi-capdata01 parent device.
>>> + * @tunable_attr: The attribute to be populated.
>>> + *
>>> + * Retrieves the capability data 01 struct pointer for the given
>>> + * attribute for its specified thermal mode.
>>> + *
>>> + * Return: Either a pointer to capability data, or NULL.
>>> + */
>>> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attr=
ibute_id)
>>> +{
>>> +	u8 idx;
>>> +
>>> +	guard(mutex)(&list_mutex);
>>> +	for (idx =3D 0; idx < list->count; idx++) {
>>> +		if (list->data[idx].id !=3D attribute_id)
>>> +			continue;
>>> +		return &list->data[idx];
>> This might cause issues should lwmi_cd01_cache() be called when the cal=
ler of this function
>> currently accesses the returned data.
>>
>> Maybe it would make sense to simply copy the struct capdata01? It is ra=
ther small, so the overhead
>> would be negligible.
>>
>> I envision something like this:
>>
>> int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct=
 capdata01 *output);
>>
>> In this case the resulting capdata is copied into "output".
>>
> I can make this work. I assume memcpy is preferred. Should I make the so=
urce pointer a devm kmalloc before it's sent or use the stack?

I suggest that you let the caller decide that. Inside lwmi_cd01_get_data()=
 you simply use memcpy() with "output" being the destination.
The caller will take care of providing the memory referenced by "output".

Thanks,
Armin Wolf

>>> +	}
>>> +	return NULL;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
>>> +
>>> +/**
>>> + * lwmi_cd01_setup() - Cache all WMI data block information
>>> + * @priv: lenovo-wmi-capdata01 driver data.
>>> + *
>>> + * Loop through each WMI data block and cache the data.
>>> + *
>>> + * Return: 0 on success, or an error.
>>> + */
>>> +static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
>>> +{
>>> +	int idx;
>>> +
>>> +	guard(mutex)(&list_mutex);
>>> +	for (idx =3D 0; idx < priv->list->count; idx++) {
>>> +		union acpi_object *ret_obj __free(kfree) =3D NULL;
>>> +
>>> +		ret_obj =3D wmidev_block_query(priv->wdev, idx);
>>> +		if (!ret_obj)
>>> +			return -ENODEV;
>>> +
>>> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
>>> +		    ret_obj->buffer.length < sizeof(priv->list->data[idx]))
>>> +			continue;
>>> +
>>> +		memcpy(&priv->list->data[idx], ret_obj->buffer.pointer,
>>> +		       ret_obj->buffer.length);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
>>> + * @priv: lenovo-wmi-capdata01 driver data.
>>> + *
>>> + * Allocate a cd01_list struct large enough to contain data from all =
WMI data
>>> + * blocks provided by the interface.
>>> + *
>>> + * Return: 0 on success, or an error.
>>> + */
>>> +static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
>>> +{
>>> +	struct cd01_list *list;
>>> +	size_t list_size;
>>> +	int count;
>>> +
>>> +	count =3D wmidev_instance_count(priv->wdev);
>>> +	list_size =3D struct_size(list, data, count);
>>> +
>>> +	guard(mutex)(&list_mutex);
>>> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
>>> +	if (!list)
>>> +		return -ENOMEM;
>>> +
>>> +	list->count =3D count;
>>> +	priv->list =3D list;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd01_setup() - Cache all WMI data block information
>>> + * @priv: lenovo-wmi-capdata01 driver data.
>>> + *
>>> + * Allocate a cd01_list struct large enough to contain data from all =
WMI data
>>> + * blocks provided by the interface. Then loop through each data bloc=
k and
>>> + * cache the data.
>>> + *
>>> + * Return: 0 on success, or an error code.
>>> + */
>>> +static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret =3D lwmi_cd01_alloc(priv);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return lwmi_cd01_cache(priv);
>>> +}
>>> +
>>> +/**
>>> + * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 d=
river notifier.
>>> + * block call chain.
>>> + * @nb: The notifier_block registered to lenovo-wmi-events driver.
>>> + * @action: Unused.
>>> + * @data: The ACPI event.
>>> + *
>>> + * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_=
profile
>>> + * of a change.
>>> + *
>>> + * Return: notifier_block status.
>>> + */
>>> +static int lwmi_cd01_notifier_call(struct notifier_block *nb, unsigne=
d long action,
>>> +				   void *data)
>>> +{
>>> +	struct acpi_bus_event *event =3D (struct acpi_bus_event *)data;
>> Unnecessary cast, please drop.
>>
>>> +	struct lwmi_cd01_priv *priv;
>>> +	int ret;
>>> +
>>> +
>>> +	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
>>> +
>>> +	switch (event->type) {
>>> +	case ACPI_AC_NOTIFY_STATUS:
>> You should also check the the "device_class" of the ACPI event (search =
for ACPI_AC_CLASS)
>> because "type" is not guaranteed to be unique between different events.
>>
> Good to know, thanks.
>
>
> Ack all below.
>  =20
> Thanks,
> Derek
>
>>> +		ret =3D lwmi_cd01_cache(priv);
>>> +		if (ret)
>>> +			return NOTIFY_BAD;
>>> +
>>> +		return NOTIFY_OK;
>>> +	default:
>>> +		return NOTIFY_DONE;
>>> +	}
>>> +}
>>> +
>>> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *conte=
xt)
>>> +
>>> +{
>>> +	struct lwmi_cd01_priv *priv;
>>> +	int ret;
>>> +
>>> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->wdev =3D wdev;
>>> +	dev_set_drvdata(&wdev->dev, priv);
>>> +
>>> +	ret =3D lwmi_cd01_setup(priv);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	priv->acpi_nb.notifier_call =3D lwmi_cd01_notifier_call;
>>> +	register_acpi_notifier(&priv->acpi_nb);
>>> +
>>> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
>> You need to unregister the ACPI notifier when component_add() fails.
>>
>>> +}
>>> +
>>> +static void lwmi_cd01_remove(struct wmi_device *wdev)
>>> +{
>>> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);
>> Same as above. You could use devm_add_action_or_reset() to fix both cas=
es.
>>
>>> +}
>>> +
>>> +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
>>> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>>> +	{}
>>> +};
>>> +
>>> +static struct wmi_driver lwmi_cd01_driver =3D {
>>> +	.driver =3D {
>>> +		.name =3D "lenovo_wmi_cd01",
>>> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>> +	},
>>> +	.id_table =3D lwmi_cd01_id_table,
>>> +	.probe =3D lwmi_cd01_probe,
>>> +	.remove =3D lwmi_cd01_remove,
>>> +	.no_singleton =3D true,
>>> +};
>>> +
>>> +/**
>>> + * lwmi_cd01_match() - Match rule for the master driver.
>>> + * @dev: Pointer to the capability data 01 parent device.
>>> + * @data: Unused void pointer for passing match criteria.
>>> + *
>>> + * Return: int.
>>> + */
>>> +int lwmi_cd01_match(struct device *dev, void *data)
>>> +{
>>> +	return dev->driver =3D=3D &lwmi_cd01_driver.driver;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
>>> +
>>> +module_wmi_driver(lwmi_cd01_driver);
>>> +
>>> +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/pla=
tform/x86/lenovo-wmi-capdata01.h
>>> new file mode 100644
>>> index 000000000000..ed4f3d86464d
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
>>> +
>>> +#ifndef _LENOVO_WMI_CAPDATA01_H_
>>> +#define _LENOVO_WMI_CAPDATA01_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct device;
>>> +
>>> +struct capdata01 {
>>> +	u32 id;
>>> +	u32 supported;
>>> +	u32 default_value;
>>> +	u32 step;
>>> +	u32 min_value;
>>> +	u32 max_value;
>>> +};
>>> +
>>> +struct cd01_list {
>>> +	u8 count;
>>> +	struct capdata01 data[];
>>> +};
>> Since client driver are not directly accessing this struct anyway pleas=
e keep its definition private
>> and only provide an incomplete definition in this header:
>>
>> 	struct cd01_list *;
>>
>> Thanks,
>> Armin Wolf
>>
>>> +
>>> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attr=
ibute_id);
>>> +int lwmi_cd01_match(struct device *dev, void *data);
>>> +
>>> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> - Derek
>
