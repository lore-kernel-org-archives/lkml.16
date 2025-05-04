Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6668634F;
	Sun,  4 May 2025 03:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746327951; cv=none; b=JNwP9ESc9nNHUNrafKOUYIPrKX9KKDnLdNubzJggShZoUqrmwJ06NMqQ+TVVJjSoUVCc3m8TLKArcyCxVgcGBA5sMrsAb7qzKJePbY87J5/aVkjHlkBrsyM9aI5ShBL3zn9/CdWr2bb5V+RLKfSTUzPiBo9F426lH+2YAA1hvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746327951; c=relaxed/simple;
	bh=KQ8ztYbW3lF9RFUYqe+qPBH3UuOboM/BNcdEQ7hIw4A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XXRJq7Evp2ePjJ4kxlygwqAbUtcgagW3s4N6Jahl+CSY2Lc9pcs0/BTFU4hZmnzQI6321U9n+6AZAnKRUKqbwZiiCjTtEgosOZWxVvjgHlcvI1aaNnKsyeCQhspkSzr8mc3K2s2+QY0EhS9OnZK8t29u2Ftn2eWIOz6vETFkSBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcwHYAqM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcwHYAqM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22435603572so40632355ad.1;
        Sat, 03 May 2025 20:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746327948; x=1746932748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0k5TRbMOesHdUt6CtobwyuAyvgKY40YJPryff6mLzNk=;
        b=mcwHYAqMruC8/ThSi+UUANIKoeheB/Js4nE2qUOpZmaqZ1WlwYlnyBkQuyUds+kZ7g
         zHkvRkeQDdOv2eCb3r1VOsF8jXeCTuOSCR2JIB7G7twBKpKi/XFztTO8xczfeGoOGG32
         RPZv4aB0PUNVIPeHqT4ePPTzs/YzRsPg5pIn+9vhRuIlMjCF/qimVAZ2qpGU7WPYznHK
         YheTfi/mKylKFFLRSSC/cNnqqRo4dtkfBexaCicyJadHlDVMYraS77ieFgWAhoGxfji2
         8PRLV4LXHY191NOyFWdCdlGOVENtO8QQbkujGHXPC9iVBAq8cgDePjdDEKBJawxtCzsP
         ptng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746327948; x=1746932748;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0k5TRbMOesHdUt6CtobwyuAyvgKY40YJPryff6mLzNk=;
        b=A+IN4Ag2qorzuLiLeWAvpPDuTOeNPPP3l8V/DCA9JSHD8EWaW12ddQdclaCo3ggDIq
         LJr7z+RlbGTgRN/LxppK8aecxevloFXWBYPC+ZlNPeJaAIlrk9XdDayMqBxfyqPnXhlc
         qG8ldPMad+r0v8RSWuE+4EbRoNziDievNZYkMkcV7Jj379+7h5NsdoKpINhGHllajwqc
         X41L+89HQEQ3Bi2sG03p46+HZJbeOLNA49bI1HwRaI3cbMTdlT9xZH5Y/XZAt7DDvqAe
         xuIm6Spk5VLK5QmUvGUIkPM6yrueMExikKhaSY5WyRYrSyxEhhsGjJdu/NdqArgSoMbN
         /2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnRM4DNV7S5HNI6XVWODC53y3Z72tUd3jKrkTFImmj+dvV0GV6bckc8n9v8T5LJSpXEd2mOvn0gmBmr+7c2yxliKtdUA==@vger.kernel.org, AJvYcCUw7e6FwtdAvM2M1yzgfPQYvXxnG/EO0CuaE6EzZxs9LoiuSnxBq/Orl5sQ4soZHlgNTNIZe0qOf5f01ggc@vger.kernel.org, AJvYcCVnzEwPKCptAspBjWXKsvuwiG5uALhmd2eFDk2Cgwx0+QhWzoCeIzJBQxiow0z7ss5uPM9D0z3OT8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvxo1UUJ7t0gppfD0qohaO90u7ashPPnpVw4pbJ07xzDT1gZf/
	V1DUUfNcO2BRjTyXdUJTOHy3wB/JYe0XeUZxTLr9y0SC+nQ2g7XoZPVEXYEm4cM=
X-Gm-Gg: ASbGnctfJZ66mO18qfxYSbc6jCOJYn2ylzhq4X8pI5DR99f+xvnbeBfFxlk5GAqMgPd
	lUuwrMmPA7Hm2ARyruQ7caAest3EQrdfRjErb6VqsJ4cMOAWDzSZHJ4L+ub85Q6uRcfs1Ab9LV8
	bL3jbIplmCjfENxQ8pV/0BhApzhbp1ui6CPQI1OI2mp34Ux5qAeO1UDMakLOeKn9xK+dWXPtH3v
	8DNagA43FVtEhTwp7OXVzxY1hjLX1DtBT0Ym7ykQPFauaIPUWLQHJCexMfahLbBWMIlzL/3JEcx
	AbheLS71rIFkrXZsrIVbaohGdWWXGZe7SJLxz/M+d5q7WKeOYs/FESQrJCluJLSNWW/wLDcaOtd
	I3m0ldq4BsyEvpAtWJcs7GMeS
X-Google-Smtp-Source: AGHT+IHU8wOJAghGXy0GDliwgvSBgpgGmQB6eGEDTjovqtaYRlXR/p2QLwuI86aqGeTJZ5b124fjGA==
X-Received: by 2002:a17:903:1b0b:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22e1ea30944mr40434405ad.28.1746327948000;
        Sat, 03 May 2025 20:05:48 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228bb1sm30691225ad.166.2025.05.03.20.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 20:05:47 -0700 (PDT)
Date: Sat, 03 May 2025 20:05:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_4/6=5D_platform/x86=3A_Add?=
 =?US-ASCII?Q?_Lenovo_Capability_Data_01_WMI_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <b8f05aba-1f99-4268-9f6b-36b77087cf5b@gmx.de>
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com> <20250503000142.1190354-5-derekjohn.clark@gmail.com> <b8f05aba-1f99-4268-9f6b-36b77087cf5b@gmx.de>
Message-ID: <B16C2588-E3C4-44FE-A92E-DFF9D18967AA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 3, 2025 7:18:43 PM PDT, Armin Wolf <W_Armin@gmx=2Ede> wrote:
>Am 03=2E05=2E25 um 02:01 schrieb Derek J=2E Clark:
>
>> Adds lenovo-wmi-capdata01 driver which provides the
>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
>> enabled hardware=2E Provides an interface for querying if a given
>> attribute is supported by the hardware, as well as its default_value,
>> max_value, min_value, and step increment=2E
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> --
>> v7:
>>   - Do memcpy instead of returning pointer in lwmi_cd01_get_data=2E
>>   - Put list mutex inside lwmi_cd01_priv struct=2E
>>   - Unregister from acpi events on dev remove=2E
>>   - Fix typos=2E
>> v6:
>>   - Recache capabiltiy data on ACPI AC events to ensure accutare
>>     max_value=2E
>>   - Fix typos and rewordings from v5 review=2E
>> v5:
>>   - Return to cache at device initialization=2E On component bind, pass=
 a
>>     pointer to lenovo-wmi-other=2E
>>   - Fixes from v4 review=2E
>> v4:
>>   - Make driver data a private struct, remove references from Other Mod=
e
>>     driver=2E
>>   - Don't cache data at device initialization=2E Instead, on component =
bind,
>>     cache the data on a member variable of the Other Mode driver data
>>     passed as a void pointer=2E
>>   - Add header file for capdata01 structs=2E
>>   - Add new struct to pass capdata01 array data and array length to Oth=
er
>>     Mode=2E
>> v3:
>> - Add as component to lenovo-wmi-other driver=2E
>> v2:
>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>    reference=2E
>> - Ensure reverse Christmas tree for all variable declarations=2E
>> - Remove extra whitespace=2E
>> - Use guard(mutex) in all mutex instances, global mutex=2E
>> - Use pr_fmt instead of adding the driver name to each pr_err=2E
>> - Remove noisy pr_info usage=2E
>> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv=2E
>> - Use list to get the lenovo_wmi_cd01_priv instance in
>>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>>    that will use it can pass a member of the struct for use in
>>    container_of=2E
>> ---
>>   MAINTAINERS                                 |   1 +
>>   drivers/platform/x86/Kconfig                |   4 +
>>   drivers/platform/x86/Makefile               |   1 +
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Ec | 301 +++++++++++++++++=
+++
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Eh |  25 ++
>>   5 files changed, 332 insertions(+)
>>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01=2Ec
>>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01=2Eh
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2b4b06e81192=2E=2E1b22e41cc730 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13164,6 +13164,7 @@ L:	platform-driver-x86@vger=2Ekernel=2Eorg
>>   S:	Maintained
>>   F:	Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>>   F:	Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> +F:	drivers/platform/x86/lenovo-wmi-capdata01=2E*
>>   F:	drivers/platform/x86/lenovo-wmi-events=2E*
>>   F:	drivers/platform/x86/lenovo-wmi-helpers=2E*
>>   diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
>> index 13b8f4ac5dc5=2E=2E64663667f0cb 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>>   	tristate
>>   	depends on ACPI_WMI
>>   +config LENOVO_WMI_DATA01
>> +	tristate
>> +	depends on ACPI_WMI
>> +
>>   config IDEAPAD_LAPTOP
>>   	tristate "Lenovo IdeaPad Laptop Extras"
>>   	depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
>> index fc039839286a=2E=2E7a35c77221b7 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi=2Eo
>>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook=2Eo
>>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger=2E=
o
>>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera=2Eo
>> +obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01=2Eo
>>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events=2Eo
>>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers=2Eo
>>   diff --git a/drivers/platform/x86/lenovo-wmi-capdata01=2Ec b/drivers/=
platform/x86/lenovo-wmi-capdata01=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E419b51f7f7c3
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01=2Ec
>> @@ -0,0 +1,301 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>> +/*
>> + * Lenovo Capability Data 01 WMI Data Block driver=2E
>> + *
>> + * Lenovo Capability Data 01 provides information on tunable attribute=
s used by
>> + * the "Other Mode" WMI interface=2E The data includes if the attribut=
e is
>> + * supported by the hardware, the default_value, max_value, min_value,=
 and step
>> + * increment=2E Each attibute has multiple pages, one for each of the =
thermal
>> + * modes managed by the Gamezone interface=2E
>> + *
>> + * Copyright (C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>> +
>> +#include "linux/printk=2Eh"
>> +#include <linux/acpi=2Eh>
>> +#include <linux/cleanup=2Eh>
>> +#include <linux/component=2Eh>
>> +#include <linux/container_of=2Eh>
>> +#include <linux/device=2Eh>
>> +#include <linux/export=2Eh>
>> +#include <linux/gfp_types=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/mutex=2Eh>
>> +#include <linux/mutex_types=2Eh>
>> +#include <linux/notifier=2Eh>
>> +#include <linux/overflow=2Eh>
>> +#include <linux/types=2Eh>
>> +#include <linux/wmi=2Eh>
>> +
>> +#include "lenovo-wmi-capdata01=2Eh"
>> +
>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
>> +
>> +#define ACPI_AC_CLASS "ac_adapter"
>> +#define ACPI_AC_NOTIFY_STATUS 0x80
>> +
>> +struct lwmi_cd01_priv {
>> +	struct notifier_block acpi_nb; /* ACPI events */
>> +	struct wmi_device *wdev;
>> +	struct cd01_list *list;
>> +};
>> +
>> +struct cd01_list {
>> +	struct mutex list_mutex; /* list R/W mutex */
>> +	u8 count;
>> +	struct capdata01 data[];
>> +};
>> +
>> +/**
>> + * lwmi_cd01_component_bind() - Bind component to master device=2E
>> + * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device=
=2E
>> + * @om_dev: Pointer to the lenovo-wmi-other driver parent device=2E
>> + * @data: capdata01_list object pointer used to return the capability =
data=2E
>> + *
>> + * On lenovo-wmi-other's master bind, provide a pointer to the local c=
apdata01
>> + * list=2E This is used to call lwmi_cd01_get_data to look up attribut=
e data
>> + * from the lenovo-wmi-other driver=2E
>> + *
>> +:* Return: 0 on success, or an error code=2E
>> + */
>> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
>> +				    struct device *om_dev, void *data)
>> +{
>> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
>> +	struct cd01_list **cd01_list =3D data;
>> +
>> +	if (!priv->list)
>> +		return -ENODEV;
>
>Hi,
>
>can priv->list ever be NULL after initialization?
>

I don't think so=2E If the malloc fails it should bail before it binds, an=
d ac events just update the data=2E I'll drop the check=2E Thanks=2E

>> +
>> +	*cd01_list =3D priv->list;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct component_ops lwmi_cd01_component_ops =3D {
>> +	=2Ebind =3D lwmi_cd01_component_bind,
>> +};
>> +
>> +/**
>> + * lwmi_cd01_get_data - Get the data of the specified attribute
>> + * @dev: The lenovo-wmi-capdata01 parent device=2E
>> + * @tunable_attr: The attribute to be found=2E
>> + * @output: Pointer to a capdata01 struct to return the data=2E
>> + *
>> + * Retrieves the capability data 01 struct pointer for the given
>> + * attribute for its specified thermal mode=2E
>> + *
>> + * Return: 0 on success, or -EINVAL=2E
>> + */
>> +int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struc=
t capdata01 *output)
>> +{
>> +	u8 idx;
>> +
>> +	guard(mutex)(&list->list_mutex);
>> +	for (idx =3D 0; idx < list->count; idx++) {
>> +		if (list->data[idx]=2Eid !=3D attribute_id)
>> +			continue;
>> +		memcpy(output, &list->data[idx], sizeof(list->data[idx]));
>> +		return 0;
>> +	};
>> +
>> +	return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
>> +
>> +/**
>> + * lwmi_cd01_setup() - Cache all WMI data block information
>> + * @priv: lenovo-wmi-capdata01 driver data=2E
>> + *
>> + * Loop through each WMI data block and cache the data=2E
>> + *
>> + * Return: 0 on success, or an error=2E
>> + */
>> +static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
>> +{
>> +	int idx;
>> +
>> +	guard(mutex)(&priv->list->list_mutex);
>> +	for (idx =3D 0; idx < priv->list->count; idx++) {
>> +		union acpi_object *ret_obj __free(kfree) =3D NULL;
>> +
>> +		ret_obj =3D wmidev_block_query(priv->wdev, idx);
>> +		if (!ret_obj)
>> +			return -ENODEV;
>> +
>> +		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
>> +		    ret_obj->buffer=2Elength < sizeof(priv->list->data[idx]))
>> +			continue;
>> +
>> +		memcpy(&priv->list->data[idx], ret_obj->buffer=2Epointer,
>> +		       ret_obj->buffer=2Elength);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
>> + * @priv: lenovo-wmi-capdata01 driver data=2E
>> + *
>> + * Allocate a cd01_list struct large enough to contain data from all W=
MI data
>> + * blocks provided by the interface=2E
>> + *
>> + * Return: 0 on success, or an error=2E
>> + */
>> +static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
>> +{
>> +	struct cd01_list *list;
>> +	size_t list_size;
>> +	int count;
>> +
>> +	count =3D wmidev_instance_count(priv->wdev);
>> +	list_size =3D struct_size(list, data, count);
>> +
>> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
>> +	if (!list)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&list->list_mutex);
>
>Please use devm_mutex_init() here=2E
>
>> +	list->count =3D count;
>> +	priv->list =3D list;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * lwmi_cd01_setup() - Cache all WMI data block information
>> + * @priv: lenovo-wmi-capdata01 driver data=2E
>> + *
>> + * Allocate a cd01_list struct large enough to contain data from all W=
MI data
>> + * blocks provided by the interface=2E Then loop through each data blo=
ck and
>> + * cache the data=2E
>> + *
>> + * Return: 0 on success, or an error code=2E
>> + */
>> +static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
>> +{
>> +	int ret;
>> +
>> +	ret =3D lwmi_cd01_alloc(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return lwmi_cd01_cache(priv);
>> +}
>> +
>> +/**
>> + * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 dr=
iver notifier=2E
>> + * block call chain=2E
>> + * @nb: The notifier_block registered to lenovo-wmi-events driver=2E
>> + * @action: Unused=2E
>> + * @data: The ACPI event=2E
>> + *
>> + * For LWMI_EVENT_THERMAL_MODE, set current_mode and notify platform_p=
rofile
>> + * of a change=2E
>> + *
>> + * Return: notifier_block status=2E
>> + */
>> +static int lwmi_cd01_notifier_call(struct notifier_block *nb, unsigned=
 long action,
>> +				   void *data)
>> +{
>> +	struct acpi_bus_event *event =3D data;
>> +	struct lwmi_cd01_priv *priv;
>> +	int ret;
>> +
>> +	if (strcmp(event->device_class, ACPI_AC_CLASS) !=3D 0)
>> +		return NOTIFY_DONE;
>> +
>> +	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
>> +
>> +	switch (event->type) {
>> +	case ACPI_AC_NOTIFY_STATUS:
>> +		ret =3D lwmi_cd01_cache(priv);
>> +		if (ret)
>> +			return NOTIFY_BAD;
>> +
>> +		return NOTIFY_OK;
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +}
>> +
>> +/**
>> + * lwmi_cd01_unregister() - Unregister the cd01 ACPI notifier_block=2E
>> + * @data: The ACPI event notifier_block to unregister=2E
>> + */
>> +static void lwmi_cd01_unregister(void *data)
>> +{
>> +	struct notifier_block *acpi_nb =3D data;
>> +
>> +	unregister_acpi_notifier(acpi_nb);
>> +}
>> +
>> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *contex=
t)
>> +
>> +{
>> +	struct lwmi_cd01_priv *priv;
>> +	int ret;
>> +
>> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->wdev =3D wdev;
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +
>> +	ret =3D lwmi_cd01_setup(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->acpi_nb=2Enotifier_call =3D lwmi_cd01_notifier_call;
>> +
>> +	ret =3D register_acpi_notifier(&priv->acpi_nb);
>> +	if (ret)
>> +		return ret;
>> +
>> +	devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &priv->acp=
i_nb);
>
>Please check the return value of devm_add_action_or_reset() here=2E
>
>With those issues being fixed:
>
>Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>
>> +
>> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
>> +}
>> +
>> +static void lwmi_cd01_remove(struct wmi_device *wdev)
>> +{
>> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);
>> +}
>> +
>> +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
>> +	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>> +	{}
>> +};
>> +
>> +static struct wmi_driver lwmi_cd01_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "lenovo_wmi_cd01",
>> +		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	=2Eid_table =3D lwmi_cd01_id_table,
>> +	=2Eprobe =3D lwmi_cd01_probe,
>> +	=2Eremove =3D lwmi_cd01_remove,
>> +	=2Eno_singleton =3D true,
>> +};
>> +
>> +/**
>> + * lwmi_cd01_match() - Match rule for the master driver=2E
>> + * @dev: Pointer to the capability data 01 parent device=2E
>> + * @data: Unused void pointer for passing match criteria=2E
>> + *
>> + * Return: int=2E
>> + */
>> +int lwmi_cd01_match(struct device *dev, void *data)
>> +{
>> +	return dev->driver =3D=3D &lwmi_cd01_driver=2Edriver;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
>> +
>> +module_wmi_driver(lwmi_cd01_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
>> +MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
>> +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01=2Eh b/drivers/pl=
atform/x86/lenovo-wmi-capdata01=2Eh
>> new file mode 100644
>> index 000000000000=2E=2Ebd06c5751f68
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01=2Eh
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>> +
>> +/* Copyright (C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>=
 */
>> +
>> +#ifndef _LENOVO_WMI_CAPDATA01_H_
>> +#define _LENOVO_WMI_CAPDATA01_H_
>> +
>> +#include <linux/types=2Eh>
>> +
>> +struct device;
>> +struct cd01_list;
>> +
>> +struct capdata01 {
>> +	u32 id;
>> +	u32 supported;
>> +	u32 default_value;
>> +	u32 step;
>> +	u32 min_value;
>> +	u32 max_value;
>> +};
>> +
>> +int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struc=
t capdata01 *output);
>> +int lwmi_cd01_match(struct device *dev, void *data);
>> +
>> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */

- Derek
