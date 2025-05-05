Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECF819995E;
	Mon,  5 May 2025 03:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746416489; cv=none; b=t83c7nVRZ6EVGDm2+FhowrYteREVfvtAonmPFWprBD+vpEeT/6N2lSWI0/NY6jVvKc6Y2en53l2NpjjM2GXz16bRvjaVHMv6rsZa6gavb6iDdsMEiO01kmeI3vW+DOgYY2PEZWlWGoNC7BXObf6qc366CV6mSuICY3JdjbZtEfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746416489; c=relaxed/simple;
	bh=ByfqStrZOFFD1ShUdkzoy8zvnyc1diQe9z4u8X8qs/4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dvi0NsPXNjv4Fw7T/mb1uml8fZmvI60M7Cpdb0qGCB574b1ns3xMBhbvQqOBMYjwGc7+zF9RQt2ZRPIIDKhgc40Jw1TcO6UGct8k1HVkBPaOm8hxo726y3ea/esbBaalYm39Qss9BlT8BVfxvuorZ5ddRQHyMd3kJT6Nww+HzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2AglH/S; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2AglH/S"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74068f95d9fso1060079b3a.0;
        Sun, 04 May 2025 20:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746416487; x=1747021287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wmHKfJR1ziPrVikJdXnKjPURXQCGaEO7vULcpbgNuEA=;
        b=V2AglH/S+aV4bG1caxA+TnwPkOsdiUwbZQ7Z0xO5nr+UYr7mnsCyrtZU/9mrDufVRH
         sqQldLAVmuLlfKhl0EYECd65S1saBme5weO0CciZ1jNxdR8kc31M8FYuJ16DiEUKl6bz
         6iRCWMEoJcPcHxDqLvcMj7pd/ghhgMe+2occQNa0zKqgA2NJFs797Szf/bWFKjjwmrvJ
         VB9KCKGU9I7BR4IQMZCfYYtMvrkOmPNiP6OQvoZa/zCu8n4jM0/zJSTbyTF8T7pmBj0/
         LvR/Pn5fZsq/8AE2Ql0XQshZ1F5OwY81hAuHR9ZNFQHW7RJWeYM/XSu1Fu6MgvVLH1Or
         ZZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746416487; x=1747021287;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmHKfJR1ziPrVikJdXnKjPURXQCGaEO7vULcpbgNuEA=;
        b=kzDsetAHsVPoTtATdYV4rTXHJlFH6uo8PuJz6CyMlgrq9EAK0vGQJLaBuJL4Jf/Olg
         /6dfI0zxoZIwB1AJnZcS9QCa5bSR0ihs6go23P9hTjIzRLQv12z7iloqMyl+iXQr399E
         JLWbKaxmLoiaI+YwRIrF6oyORGNuk27fKbmn98Yco6nhNl5aogWthE4P0hyJykTcXnsw
         ECWOaogTZH9mg0tSJmpwFTTkSTxvkV+InRG4phnEYkJp2yA323gUml5YQWLjl/VspSzH
         m+CwKwQQkcirjLV5iYryak3gK13GbsaK071Dta/0nH2wBY+jMAGPPG1fkt4cHnqrkazQ
         tysA==
X-Forwarded-Encrypted: i=1; AJvYcCU0IAP/eVlkPuBxQJAlKJz33aypPpKut9uH7rWTRt8M66pDiLatoQE1BZrxGwKia6AnocfLevPJvIk=@vger.kernel.org, AJvYcCUuMhQUU7Q7el7yKN2g6in1Jt8nNwplgmSLtwLTJqAIApo7UH3HuVQI+qDz5qNtWWsUQiN3OZ0FGqhkEWaI@vger.kernel.org, AJvYcCWILOsdQGgfcGEGANQM6bepmRsrxgcyXCj/8h52tJRMJ+v6h5F4IWMkYJectZsHW6aN8GXU4t184D7DsZYaL1m3joDZTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY6kspJZWoKhEzhaaOUrbSqE0F93oO2vsU0/RBy85qSnMiap8w
	PRyGl1GhypPTZrUrtHMC6HFNNyvN5gyz0DNAvsz7x2SWQ+Tdmr/H
X-Gm-Gg: ASbGncvy79cL29tT0xWrdFcyfKOafyt4TsvREYGQ4ReFLv/n0reNoXmBsEL7TsJf3UA
	SLQObz0mIokZ/YLt/kEqyZ+u+YzRNR++2UGOU1XHntyeumSf5URoQib2ss/sbXAKGMSKvmlcarB
	7c+XfZ5NAnOempda92qPdhw0nJE3J3LDb+opiDEQ/IupljTIdVyc0LYz49FHOwTKLrb26hvms0i
	HaC9pEziKCfXHJmHL7oyGCOrVNohADluuto5CcqqAO7+jtrEnhEHs/xBQCEFstT1xURLMyq9sfG
	G4upB4cq+bwgl1d83mqw1o/+fwailaPoVwnCfZ1j1JlM5tm7sNXp/R7FGA45e8/FdqCrosZbF/V
	a23IYo2BL+8eJ8wHmRPOP117x
X-Google-Smtp-Source: AGHT+IGFzeRzYp9yOHUbsv4C0jp7gj0CfedyFu2Q0eGMATL/qUwTeP2V5UmuJsD5hd7RMFsAnVM6Hg==
X-Received: by 2002:a17:90b:51cd:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-30a619a4dfamr10018742a91.16.1746416486353;
        Sun, 04 May 2025 20:41:26 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a5ad86c01sm4409402a91.46.2025.05.04.20.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 20:41:26 -0700 (PDT)
Date: Sun, 04 May 2025 20:41:27 -0700
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
 linux-kernel@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_4/6=5D_platform/x86=3A_Add?=
 =?US-ASCII?Q?_Lenovo_Capability_Data_01_WMI_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <c6ce49f7-cf45-469d-a151-b157d5f182b7@gmx.de>
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com> <20250505010659.1450984-5-derekjohn.clark@gmail.com> <c6ce49f7-cf45-469d-a151-b157d5f182b7@gmx.de>
Message-ID: <A0A05012-D725-4F1D-B262-004DB2CDC8D1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 4, 2025 6:32:43 PM PDT, Armin Wolf <W_Armin@gmx=2Ede> wrote:
>Am 05=2E05=2E25 um 03:06 schrieb Derek J=2E Clark:
>
>> Adds lenovo-wmi-capdata01 driver which provides the
>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
>> enabled hardware=2E Provides an interface for querying if a given
>> attribute is supported by the hardware, as well as its default_value,
>> max_value, min_value, and step increment=2E
>>=20
>> Reviewed-by: Alok Tiwari <alok=2Ea=2Etiwari@oracle=2Ecom>
>> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v8:
>>   - Use devm_mutex_init() instead of mutex_init()=2E
>>   - Check return of devm_add_action_or_reset during probe=2E
>>   - Don't check if cd01 list exists in bind as the driver will bail if
>>     there is a malloc/populating issue prior to bind=2E
>>   - Fix typos=2E
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
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Ec | 300 +++++++++++++++++=
+++
>>   drivers/platform/x86/lenovo-wmi-capdata01=2Eh |  25 ++
>>   5 files changed, 331 insertions(+)
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
>> index 000000000000=2E=2E9e2758426564
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01=2Ec
>> @@ -0,0 +1,300 @@
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
>> + * increment=2E Each attribute has multiple pages, one for each of the=
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
>> + * Return: 0
>> + */
>> +static int lwmi_cd01_component_bind(struct device *cd01_dev,
>> +				    struct device *om_dev, void *data)
>> +{
>> +	struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
>> +	struct cd01_list **cd01_list =3D data;
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
>> +	devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
>
>Please check the result of devm_mutex_init(), as this function might fail=
=2E
>
>Other than that the whole series looks good to me=2E Hopefully we can fin=
ally merge this
>for the 6=2E16 kernel cycle=2E
>
>Thanks,
>Armin Wolf
>

Will do=2E I'll give this version a few more days for additional comments =
before I submit that change=2E

Thanks,=20
Derek

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
>> +	ret =3D devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister, &p=
riv->acpi_nb);
>> +	if (ret)
>> +		return ret;
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
