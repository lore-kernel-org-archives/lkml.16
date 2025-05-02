Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61822A4F8;
	Fri,  2 May 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201122; cv=none; b=Zn4LxPLViS/8ihUncD0A8FTCEMqhbGzMa+UjSdLN0L2egAZ6i/aikjOg+rBWN+2LOMiJnXMla8VixraJ4MhwKaIqQ9y7G5gv23TCjjuMZqhNivnYGyPA1oyftduL5VYkUJ8N3uAr2WUhJ/32UIV1qmZYMYL5ZpRLmvZmjTyINwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201122; c=relaxed/simple;
	bh=pJggKYMcXKVM8/K7YfPQN6f8hWqTSwe9ExOItLif1bw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IktahVVxfhlE48KBpQmd/xvaWeWlYkoaYLSfQUy+Ysh6tDcUMp/S2aItu1yNdMr2VadauGGc/IFuqs7sOAVsjv7y5Wh9gUD8Wp5GzwKp1iW3ZfIwb3alLREZr4h7ranc4H5F3aK2ziSOle8Ucw6bplKvpmOHKwDFZcItJW7aSYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkcqRnn8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkcqRnn8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1496098a12.1;
        Fri, 02 May 2025 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746201120; x=1746805920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K/M5vDk+UKb6rsRBh/L+Hf81YD4rGeGAYZff+Q+1MrE=;
        b=EkcqRnn8hIOPWrCAi7zMF3eN2R9bYk3ltynIVmhANIYYq1rypj+EO3lyeKcNoyGCip
         zhpfmaRmeRwyTyCsmhhsas0PZHFow+X1vawX/EhGKC6B+l5geiuLTTeGmKYS9HyC+0SV
         f/Y30gylNs4z9nLHQKvzxX3N8rvBtPdAUk11xZAwxHWJaCoV9CI48dibKTmBmKeoUVc8
         QVqX3a2hCQUDKvDwyOMLXnX0ZHgjwiNSjBx5OURka0qrN1YzRHlkaHb8pYaukm371jhx
         b7TOTC+35oUP07CEwWmssBdGZFyIrUCqB2IC8QH9iGIjBCytnF1K7crx1cLrQvu45Bjn
         7XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201120; x=1746805920;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/M5vDk+UKb6rsRBh/L+Hf81YD4rGeGAYZff+Q+1MrE=;
        b=p7qJzFeb9hsf+AATxZHlBGuTFIO7st8mef5m5EI23OD6xHnFJeNbhiws04Y1lkVxwi
         BPCCAbbguehQ/iWpI3EaJAPgOqGoawiKXStE0MCTFS4S2Lsf0mS0mTn7DcimoH3TkDxc
         HUPB33zm49TY0IsY/Qw3xDWRc4KmxlKnuGbXFtX2dInBBzXzN6QN0sxc1NKpdr19olHu
         LGaS382YyQ/cwcCxFljY5HGesDbnYnPRvPHBVO4Ee1jJze4uTKX72cP+wFXF0Jh2VmK+
         QY0BCOASjfQU9/U8BvA6Q2c6hQn2D8b7LxQRvZY2kx3nqLwCvPiy6W5Zq1cwxrI5OGOy
         NsYg==
X-Forwarded-Encrypted: i=1; AJvYcCVIVSG7RTl0lnmHEpxtNGolMfszFP+NpEjv0iSKjXM8OVrrjQuxEEFfyWKnTl8kfZmmQOFURjyD0gXagbAIHieTDAxkfw==@vger.kernel.org, AJvYcCW0VK0h3Hx5ephQZ9Ez3l5YvUUUo0bLMipjFjAswQF9yPM0vF8Xoo+Uvw9mjjInTYShrh09FhF0KC7ZVB+F@vger.kernel.org, AJvYcCWzsPLXw7UDZ/d3JJZY64dCBrNFdT0goS6qQSErjNV7P/CT4ilGZlCJon2u3fFVKv9TXymyY1I+rCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3phvkKpcwtBmpsnnkuh11p+Z2gZRDY/Tv/yBcZ1HyD3TMa3dp
	0VYjFbjn6C8OoQ9mzSJhzuG6c8NWSmsyCrzMgjblIrCI5raYnYuw
X-Gm-Gg: ASbGnctvEqrCs/Lb+YklEZZFFJPHi13TzLKYPGfY8oKSygBYRKtx8ERIber0WplJqaK
	R/J0RJD18cIgdlsQalXCM8cmiFOIeme2hcw2/B5OnRp5WJLHu3v7WkIYKg7L6KiWV7xi49tEwBL
	qoDnPA/7HTRDlDFh+2BXfacpWO53tG12Sjey3G66gzxHtimg3tn4x2CjTdfZOXtweC9s3guRPwp
	rRV+Z0qZ6ogBrB2Ba8taSX8fJURopIyx9KRu26GxSz0vkTAN95mZ41Q/czD+yarrROhn1HA50Qu
	oz5G1Af8yFjPRNDP+AZYyLtNGzPyVR3maxmHjHviMrL+Va0=
X-Google-Smtp-Source: AGHT+IF6RQ4Q+o1kYE7jobyJH7wD/JO0AoDQKbSaNv7gINDhEyMucnZxjqCZUb0VUzLrEG8eEb2cTg==
X-Received: by 2002:a17:90b:4fc2:b0:2ee:8430:b831 with SMTP id 98e67ed59e1d1-30a4e558b91mr5590741a91.2.1746201119847;
        Fri, 02 May 2025 08:51:59 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb91:1e3:45a4:ad2:fe58:51fc:b286])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97eesm9219635ad.71.2025.05.02.08.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:51:59 -0700 (PDT)
Date: Fri, 02 May 2025 08:51:57 -0700
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_4/6=5D_platform/x86=3A_Add?=
 =?US-ASCII?Q?_Lenovo_WMI_Capability_Data_01_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <a339b4b5-c7ca-4875-adb8-183539be563f@gmx.de>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-5-derekjohn.clark@gmail.com> <a339b4b5-c7ca-4875-adb8-183539be563f@gmx.de>
Message-ID: <20FEC2FF-775F-49F5-9DAA-4641C73B0367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 1, 2025 7:18:40 PM PDT, Armin Wolf <W_Armin@gmx=2Ede> wrote:
>Am 28=2E04=2E25 um 03:18 schrieb Derek J=2E Clark:
>
>> Adds lenovo-wmi-capdata01 driver which provides the
>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
>> enabled hardware=2E Provides an interface for querying if a given
>> attribute is supported by the hardware, as well as its default_value,
>> max_value, min_value, and step increment=2E
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
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
>>   MAINTAINERS                                 |   1 +
>>   drivers/platform/x86/Kconfig                |   4 +
>>   drivers/platform/x86/Makefile               |   1 +
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Ec | 272 +++++++++++++++++=
+++
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Eh |  29 +++
>>   5 files changed, 307 insertions(+)
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
>> index 000000000000=2E=2E841d4a37249b
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01=2Ec
>> @@ -0,0 +1,272 @@
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
>> + * Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>> +
>> +#include <linux/acpi=2Eh>
>> +#include <linux/cleanup=2Eh>
>> +#include <linux/component=2Eh>
>> +#include <linux/container_of=2Eh>
>> +#include <linux/device=2Eh>
>> +#include <linux/export=2Eh>
>> +#include <linux/gfp_types=2Eh>
>> +#include <linux/module=2Eh>
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
>> +#define ACPI_AC_NOTIFY_STATUS 0x80
>> +
>> +static DEFINE_MUTEX(list_mutex);
>
>Hi,
>
>why not moving this mutex inside struct cd01_list?
>

I can do that=2E Is that preferable over adding it to priv?

>> +
>> +struct lwmi_cd01_priv {
>> +	struct notifier_block acpi_nb; /* ACPI events */
>> +	struct wmi_device *wdev;
>> +	struct cd01_list *list;
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
>> + * @tunable_attr: The attribute to be populated=2E
>> + *
>> + * Retrieves the capability data 01 struct pointer for the given
>> + * attribute for its specified thermal mode=2E
>> + *
>> + * Return: Either a pointer to capability data, or NULL=2E
>> + */
>> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attri=
bute_id)
>> +{
>> +	u8 idx;
>> +
>> +	guard(mutex)(&list_mutex);
>> +	for (idx =3D 0; idx < list->count; idx++) {
>> +		if (list->data[idx]=2Eid !=3D attribute_id)
>> +			continue;
>> +		return &list->data[idx];
>
>This might cause issues should lwmi_cd01_cache() be called when the calle=
r of this function
>currently accesses the returned data=2E
>
>Maybe it would make sense to simply copy the struct capdata01? It is rath=
er small, so the overhead
>would be negligible=2E
>
>I envision something like this:
>
>int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct c=
apdata01 *output);
>
>In this case the resulting capdata is copied into "output"=2E
>

I can make this work=2E I assume memcpy is preferred=2E Should I make the =
source pointer a devm kmalloc before it's sent or use the stack?

>> +	}
>> +	return NULL;
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
>> +	guard(mutex)(&list_mutex);
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
>> +	guard(mutex)(&list_mutex);
>> +	list =3D devm_kzalloc(&priv->wdev->dev, list_size, GFP_KERNEL);
>> +	if (!list)
>> +		return -ENOMEM;
>> +
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
>> +	struct acpi_bus_event *event =3D (struct acpi_bus_event *)data;
>
>Unnecessary cast, please drop=2E
>
>> +	struct lwmi_cd01_priv *priv;
>> +	int ret;
>> +
>> +
>> +	priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
>> +
>> +	switch (event->type) {
>> +	case ACPI_AC_NOTIFY_STATUS:
>
>You should also check the the "device_class" of the ACPI event (search fo=
r ACPI_AC_CLASS)
>because "type" is not guaranteed to be unique between different events=2E
>

Good to know, thanks=2E


Ack all below=2E
=20
Thanks,
Derek

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
>> +	register_acpi_notifier(&priv->acpi_nb);
>> +
>> +	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
>
>You need to unregister the ACPI notifier when component_add() fails=2E
>
>> +}
>> +
>> +static void lwmi_cd01_remove(struct wmi_device *wdev)
>> +{
>> +	component_del(&wdev->dev, &lwmi_cd01_component_ops);
>
>Same as above=2E You could use devm_add_action_or_reset() to fix both cas=
es=2E
>
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
>> index 000000000000=2E=2Eed4f3d86464d
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01=2Eh
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>> +
>> +/* Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom> =
*/
>> +
>> +#ifndef _LENOVO_WMI_CAPDATA01_H_
>> +#define _LENOVO_WMI_CAPDATA01_H_
>> +
>> +#include <linux/types=2Eh>
>> +
>> +struct device;
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
>> +struct cd01_list {
>> +	u8 count;
>> +	struct capdata01 data[];
>> +};
>
>Since client driver are not directly accessing this struct anyway please =
keep its definition private
>and only provide an incomplete definition in this header:
>
>	struct cd01_list *;
>
>Thanks,
>Armin Wolf
>
>> +
>> +struct capdata01 *lwmi_cd01_get_data(struct cd01_list *list, u32 attri=
bute_id);
>> +int lwmi_cd01_match(struct device *dev, void *data);
>> +
>> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */

- Derek
