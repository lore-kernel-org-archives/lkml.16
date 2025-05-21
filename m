Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C71754B;
	Wed, 21 May 2025 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867197; cv=none; b=dHuKZzF5PestsOdV93AuzDwavmX77/KAGePUMeTL3cuWW3Zeb7cdpJiV0pbHMbYIhHkNtLBmoQprLB2Y69b3wZoNRaIt2yFUSRtEUfyXLa6UCPV8KxYzuUhiA22bsMX9i+x8C/7L4xnziHQ5xM3/9eN4ygYaZhnNYCi6mCwumGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867197; c=relaxed/simple;
	bh=UAfN7Z4xxDqZFYDlX9c5U20PR6iyEdlq8k6awjzda6g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sal+tDWOY4NwVagApEIYKItZpXeBjJx4Ie8z1T26EALVSHXIzWH0J+cpLY9eHXYjBif4lzaoCsfBCLD1CDnCYuwrEtQdeKosgdWCZjjuSdUzQNceu7ROonHLDbpWTxhOXmrQsKgKJpAfCtR6UzBwCP2ZQuSeRjfgYG695VubP58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyWkrN0U; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyWkrN0U"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e8a968b15so5071751a91.3;
        Wed, 21 May 2025 15:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747867194; x=1748471994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSxm4ndUjsT6o0eGmBAmgDHAuoqCMZQNWu5Un2rcpLI=;
        b=QyWkrN0UEEJRhqGpPGIZwu9JLRKxwM0QMceJUzo6nH0VRuZOs72BC88txtPKdyjEgu
         mY7YO0ZM2qzxuASg4wVGmvoZH0ohc77pBCqq2AXhVpP5fCi96UpGsZkcbbsW0cuRDmOS
         l6CN9aTskbLAkwBJpaXk2f2lGiJGX7R4gALDjxRxnQkWDXi/a2W95LS32SpF1BBnms/e
         GplFq3GpdKmfUXqea3PcNODIvdLL/cDUnRuWo3OoUcaFAp40HF1ABwtYKBAx4tDnuG8C
         dN3fg9wc1ya67AAbhD91MaKVKokm1jlLEQUfGbRszwshzhSkAC7viBIyjLTr3yYmdJPe
         3l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747867194; x=1748471994;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSxm4ndUjsT6o0eGmBAmgDHAuoqCMZQNWu5Un2rcpLI=;
        b=IWbJ4vaqZTDyir5WfZFf1UFfiZtnK0/a5HNYI+Aw2jm0XSlw4t+q0fqYzzFnonR2LV
         vWTzQlxyXxMNade/l3gHL4uGu0vTnn6aroiJFHb909eDsWkk0GFxK3OUaon5nwYUCewo
         yoweC3J9/NQUMXVWB027qkCI4jq2fVFC9Zs7DH1zcw905O4c0dJzeIk5lWEGa4C16RW5
         bmDuOM+1hSoOBf4/97WpOgqtV3SfS86oZ2r2liDT6zUbXemSjlPtXn6htz34DFoYiZnE
         9HjLVOy2ZxgKL14xtzyfjg0dLbazbOx/k/nhFztwSBkjmkHs9J2LekSC469KKdMVh2KZ
         zqWA==
X-Forwarded-Encrypted: i=1; AJvYcCU40X3YMXsI1RUU/GCsSkev8Pugob6sTKzoO9Rl3jsoV3m2NDKjXrSf/pWBXhlscNOqoV9EZlwPdHn8LEapo/1Qp8N4kg==@vger.kernel.org, AJvYcCVzVu5HyeBVGMNP9kdJYX7DhCNeVQ6YW/6GL3zP5HCc2cKMUtGhWn28259j+eZuFcIq/fAH9h+dLbGwaaH1@vger.kernel.org, AJvYcCWQm5HlYX5D5pu9e2Jeogh4WRkl5hpGoSU023+iKyJXSGMmUWGTeG7+vxkfOdMNHyNWBCNZzjhm7N4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtLzCY2V1+HqVtHZP7lEXONcArcWLvkULWmtIU3dZVAWBm+LF
	wtko/JXKb+97EiV7Q+ne/YzicTygxYNejAICt3Xj36WL9Nx2qZZfgrAp
X-Gm-Gg: ASbGncsRqXBK4fz7ikyCDNunCUudnYdxxf2nNuBIR9DsbIhfKMuJUkp1MGHI2v1tDeR
	O74Kg4oZWISB9ISlhLO0J1vYUkZL7+BFa7cmmLXzbIUx9M02jH7jY0UV8z+V9bF6HBVATKbs9I8
	tjzhnWkXzpBuabGV9Xje7mIKtPssATFu5WykFEjzhdpPb+pf63//rszonXzFlmlmD6VhIlZMWiw
	n4hVpQAkConezffNJy4cyj0YqR2/prSTGIkVt6bGtbP/33qMlDuMHRVSUu5/RpB4RLcutPOoNK7
	ScneNGw+n6gNQd2nquXqBJrioDkFt5C1VRz8Z6FX2UzU+F8ZGuY6KDSneQT9AFV8MAwHzz9GIjP
	asy1pQJv9QJuP3MB6veHEeBPtVTjcUvHsdPE=
X-Google-Smtp-Source: AGHT+IFMK99cu1ggnbQ2Y0mKbwzHxO1Fi9bOzxBNICwJ03PGypidwHY6h9ZIP27qf0Ynv+V6i8o/wA==
X-Received: by 2002:a17:90b:4acf:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-30e830c772dmr29938922a91.6.1747867193932;
        Wed, 21 May 2025 15:39:53 -0700 (PDT)
Received: from [127.0.0.1] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d4599sm4188248a91.28.2025.05.21.15.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 15:39:53 -0700 (PDT)
Date: Wed, 21 May 2025 06:40:39 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alok Tiwari <alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v10 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
User-Agent: Thunderbird for Android
In-Reply-To: <e9e9a503-25f6-a57a-8ae2-4b9dd57dc89e@linux.intel.com>
References: <20250515182224.8277-1-derekjohn.clark@gmail.com> <20250515182224.8277-7-derekjohn.clark@gmail.com> <e9e9a503-25f6-a57a-8ae2-4b9dd57dc89e@linux.intel.com>
Message-ID: <E8223BBA-144B-4F30-865E-2078D0E58934@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 21, 2025 3:55:09 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linu=
x=2Eintel=2Ecom> wrote:
>On Thu, 15 May 2025, Derek J=2E Clark wrote:
>
>> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
>> interface that comes on some Lenovo "Gaming Series" hardware=2E Provide=
s a
>> firmware-attributes class which enables the use of tunable knobs for SP=
L,
>> SPPT, and FPPT=2E
>>=20
>> Reviewed-by: Alok Tiwari <alok=2Ea=2Etiwari@oracle=2Ecom>
>> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v10:
>>  - include kdev_t to fix build error=2E
>> v9:
>>  - Make tunable_attr_01 declarations static & adjust formatting=2E
>> v8:
>>  - Remove dead code=2E
>>  - use struct cd01_list pointer instead of void pointer in
>>    lwmi_cd01_priv=2E
>> v7:
>>  - Use stach allocated capdata01 stuct instead of getting a pointer fro=
m
>>    lenovo-wmi-capdata01=2E
>>  - Fix typos=2E
>> v6:
>> - Pass locally stored pointer to cd01_list back to lenovo-wmi-capdata01
>>   instead of itterating over the list locally=2E Due to ACPI event hand=
ing
>>   the list is now mutexed=2E
>> - Fix typos and rewordings from v5 review=2E
>> v5:
>> - Switch from locally storing capability data list to storing a pointer
>>   from the capability data interface=2E
>> - Add portion of Gamezone driver that relies on the exported functions
>>   of this driver=2E
>> - Properly initialize IDA and use it for naming the firmware-attributes
>>   path=2E
>> - Rename most defines to clearly indicate they are from this driver=2E
>> - Misc fixes from v4 review=2E
>> v4:
>> - Treat Other Mode as a notifier chain head, use the notifier chain to
>>   get the current mode from Gamezone=2E
>> - Add header file for Other Mode specific structs and finctions=2E
>> - Use component master bind to cache the capdata01 array locally=2E
>> - Drop all reference to external driver private data structs=2E
>> - Various fixes from review=2E
>> v3:
>> - Add notifier block and store result for getting the Gamezone interfac=
e
>>   profile changes=2E
>> - Add driver as master component of capdata01 driver=2E
>> - Use FIELD_PREP where appropriate=2E
>> - Move macros and associated functions out of lemovo-wmi=2Eh that are o=
nly
>>   used by this driver=2E
>> v2:
>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>   reference=2E
>> - Ensure reverse Christmas tree for all variable declarations=2E
>> - Remove extra whitespace=2E
>> - Use guard(mutex) in all mutex instances, global mutex=2E
>> - Use pr_fmt instead of adding the driver name to each pr_err=2E
>> - Remove noisy pr_info usage=2E
>> - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv=2E
>> - Use list to get the lenovo_wmi_om_priv instance in some macro
>>   called functions as the data provided by the macros that use it
>>   doesn't pass a member of the struct for use in container_of=2E
>> - Do not rely on GameZone interface to grab the current fan mode=2E
>> ---
>>  MAINTAINERS                                |   1 +
>>  drivers/platform/x86/Kconfig               |  15 +
>>  drivers/platform/x86/Makefile              |   1 +
>>  drivers/platform/x86/lenovo-wmi-gamezone=2Ec |   8 +-
>>  drivers/platform/x86/lenovo-wmi-other=2Ec    | 667 +++++++++++++++++++=
++
>>  drivers/platform/x86/lenovo-wmi-other=2Eh    |  16 +
>>  6 files changed, 707 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Ec
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Eh
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 673535395ae8=2E=2E764eadee48ac 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13168,6 +13168,7 @@ F:	drivers/platform/x86/lenovo-wmi-capdata01=2E=
*
>>  F:	drivers/platform/x86/lenovo-wmi-events=2E*
>>  F:	drivers/platform/x86/lenovo-wmi-gamezone=2E*
>>  F:	drivers/platform/x86/lenovo-wmi-helpers=2E*
>> +F:	drivers/platform/x86/lenovo-wmi-other=2E*
>> =20
>>  LENOVO WMI HOTKEY UTILITIES DRIVER
>>  M:	Jackie Dong <xy-jackie@139=2Ecom>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index aaa1a69c10ca=2E=2Ebe5ab24960b5 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
>>  	tristate
>>  	depends on ACPI_WMI
>> =20
>> +config LENOVO_WMI_TUNING
>> +	tristate "Lenovo Other Mode WMI Driver"
>> +	depends on ACPI_WMI
>> +	select FW_ATTR_CLASS
>> +	select LENOVO_WMI_DATA01
>> +	select LENOVO_WMI_EVENTS
>> +	select LENOVO_WMI_HELPERS
>> +	help
>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would l=
ike to use the
>> +	  firmware_attributes API to control various tunable settings typical=
ly exposed by
>> +	  Lenovo software in Windows=2E
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo-wmi-other=2E
>> +
>>  config IDEAPAD_LAPTOP
>>  	tristate "Lenovo IdeaPad Laptop Extras"
>>  	depends on ACPI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
>> index 60058b547de2=2E=2Ef3e64926a96b 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capda=
ta01=2Eo
>>  obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events=2Eo
>>  obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone=2Eo
>>  obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers=2Eo
>> +obj-$(CONFIG_LENOVO_WMI_TUNING)	+=3D lenovo-wmi-other=2Eo
>> =20
>>  # Intel
>>  obj-y				+=3D intel/
>> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone=2Ec b/drivers/pla=
tform/x86/lenovo-wmi-gamezone=2Ec
>> index 6f460ddf584a=2E=2E304eecc5560c 100644
>> --- a/drivers/platform/x86/lenovo-wmi-gamezone=2Ec
>> +++ b/drivers/platform/x86/lenovo-wmi-gamezone=2Ec
>> @@ -374,7 +374,12 @@ static int lwmi_gz_probe(struct wmi_device *wdev, =
const void *context)
>>  		return ret;
>> =20
>>  	priv->event_nb=2Enotifier_call =3D lwmi_gz_event_call;
>> -	return devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_nb=
);
>> +	ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->event_n=
b);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->mode_nb=2Enotifier_call =3D lwmi_gz_mode_call;
>> +	return devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
>>  }
>> =20
>>  static const struct wmi_device_id lwmi_gz_id_table[] =3D {
>> @@ -396,6 +401,7 @@ module_wmi_driver(lwmi_gz_driver);
>> =20
>>  MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
>>  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
>>  MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
>>  MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
>>  MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>> diff --git a/drivers/platform/x86/lenovo-wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo-wmi-other=2Ec
>> new file mode 100644
>> index 000000000000=2E=2Ebfcb768053b6
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-other=2Ec
>> @@ -0,0 +1,667 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>> +/*
>> + * Lenovo Other Mode WMI interface driver=2E
>> + *
>> + * This driver uses the fw_attributes class to expose the various WMI =
functions
>> + * provided by the "Other Mode" WMI interface=2E This enables CPU and =
GPU power
>> + * limit as well as various other attributes for devices that fall und=
er the
>> + * "Gaming Series" of Lenovo laptop devices=2E Each attribute exposed =
by the
>> + * "Other Mode" interface has a corresponding Capability Data struct t=
hat
>> + * allows the driver to probe details about the attribute such as if i=
t is
>> + * supported by the hardware, the default_value, max_value, min_value,=
 and step
>> + * increment=2E
>> + *
>> + * These attributes typically don't fit anywhere else in the sysfs and=
 are set
>> + * in Windows using one of Lenovo's multiple user applications=2E
>> + *
>> + * Copyright (C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>> +
>> +#include <linux/acpi=2Eh>
>> +#include <linux/bitfield=2Eh>
>> +#include <linux/cleanup=2Eh>
>> +#include <linux/component=2Eh>
>> +#include <linux/container_of=2Eh>
>> +#include <linux/device=2Eh>
>> +#include <linux/export=2Eh>
>> +#include <linux/gfp_types=2Eh>
>> +#include <linux/idr=2Eh>
>> +#include <linux/kdev_t=2Eh>
>> +#include <linux/kobject=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/notifier=2Eh>
>> +#include <linux/platform_profile=2Eh>
>> +#include <linux/types=2Eh>
>> +#include <linux/wmi=2Eh>
>> +
>> +#include "lenovo-wmi-capdata01=2Eh"
>> +#include "lenovo-wmi-events=2Eh"
>> +#include "lenovo-wmi-gamezone=2Eh"
>> +#include "lenovo-wmi-helpers=2Eh"
>> +#include "lenovo-wmi-other=2Eh"
>> +#include "firmware_attributes_class=2Eh"
>> +
>> +#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>> +
>> +#define LWMI_DEVICE_ID_CPU 0x01
>> +
>> +#define LWMI_FEATURE_ID_CPU_SPPT 0x01
>> +#define LWMI_FEATURE_ID_CPU_SPL 0x02
>> +#define LWMI_FEATURE_ID_CPU_FPPT 0x03
>> +
>> +#define LWMI_TYPE_ID_NONE 0x00
>> +
>> +#define LWMI_FEATURE_VALUE_GET 17
>> +#define LWMI_FEATURE_VALUE_SET 18
>> +
>> +#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
>> +#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
>> +#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
>> +#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
>> +
>> +#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>> +
>> +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>> +static DEFINE_IDA(lwmi_om_ida);
>> +
>> +enum attribute_property {
>> +	DEFAULT_VAL,
>> +	MAX_VAL,
>> +	MIN_VAL,
>> +	STEP_VAL,
>> +	SUPPORTED,
>> +};
>> +
>> +struct lwmi_om_priv {
>> +	struct component_master_ops *ops;
>> +	struct cd01_list *cd01_list; /* only valid after capdata01 bind */
>> +	struct device *fw_attr_dev;
>> +	struct kset *fw_attr_kset;
>> +	struct notifier_block nb;
>> +	struct wmi_device *wdev;
>> +	int ida_id;
>> +};
>> +
>> +struct tunable_attr_01 {
>> +	struct capdata01 *capdata;
>> +	struct device *dev;
>> +	u32 feature_id;
>> +	u32 device_id;
>> +	u32 type_id;
>> +};
>> +
>> +static struct tunable_attr_01 ppt_pl1_spl =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_CPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_CPU_SPL,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 ppt_pl2_sppt =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_CPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 ppt_pl3_fppt =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_CPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +struct capdata01_attr_group {
>> +	const struct attribute_group *attr_group;
>> +	struct tunable_attr_01 *tunable_attr;
>> +};
>> +
>> +/**
>> + * lwmi_om_register_notifier() - Add a notifier to the blocking notifi=
er chain
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call blocking_notifier_chain_register to register the notifier bloc=
k to the
>> + * lenovo-wmi-other driver notifier chain=2E
>> + *
>> + * Return: 0 on success, %-EEXIST on error=2E
>> + */
>> +int lwmi_om_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&om_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
>> +
>> +/**
>> + * lwmi_om_unregister_notifier() - Remove a notifier from the blocking=
 notifier
>> + * chain=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call blocking_notifier_chain_unregister to unregister the notifier =
block from the
>> + * lenovo-wmi-other driver notifier chain=2E
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&om_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
>> +
>> +/**
>> + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blo=
cking
>> + * notifier chain=2E
>> + * @data: Void pointer to the notifier_block struct to register=2E
>> + *
>> + * Call lwmi_om_unregister_notifier to unregister the notifier block f=
rom the
>> + * lenovo-wmi-other driver notifier chain=2E
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +static void devm_lwmi_om_unregister_notifier(void *data)
>> +{
>> +	struct notifier_block *nb =3D data;
>> +
>> +	lwmi_om_unregister_notifier(nb);
>> +}
>> +
>> +/**
>> + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking n=
otifier
>> + * chain=2E
>> + * @dev: The parent device of the notifier_block struct=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call lwmi_om_register_notifier to register the notifier block to th=
e
>> + * lenovo-wmi-other driver notifier chain=2E Then add devm_lwmi_om_unr=
egister_notifier
>> + * as a device managed action to automatically unregister the notifier=
 block
>> + * upon parent device removal=2E
>> + *
>> + * Return: 0 on success, or on error=2E
>> + */
>> +int devm_lwmi_om_register_notifier(struct device *dev,
>> +				   struct notifier_block *nb)
>> +{
>> +	int ret;
>> +
>> +	ret =3D lwmi_om_register_notifier(nb);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_notifier=
,
>> +					nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER=
");
>> +
>> +/**
>> + * lwmi_om_notifier_call() - Call functions for the notifier call chai=
n=2E
>> + * @mode: Pointer to a thermal mode enum to retrieve the data from=2E
>> + *
>> + * Call blocking_notifier_call_chain to retrieve the thermal mode from=
 the
>> + * lenovo-wmi-gamezone driver=2E
>> + *
>> + * Return: 0 on success, or on error=2E
>> + */
>> +static int lwmi_om_notifier_call(enum thermal_mode *mode)
>> +{
>> +	int ret;
>> +
>> +	ret =3D blocking_notifier_call_chain(&om_chain_head,
>> +					   LWMI_GZ_GET_THERMAL_MODE, &mode);
>> +	if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Attribute Methods */
>> +
>> +/**
>> + * int_type_show() - Emit the data type for an integer attribute
>> + * @kobj: Pointer to the driver object=2E
>> + * @kobj_attribute: Pointer to the attribute calling this function=2E
>> + * @buf: The buffer to write to=2E
>> + *
>> + * Return: Number of characters written to buf=2E
>> + */
>> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribu=
te *kattr,
>> +			     char *buf)
>> +{
>> +	return sysfs_emit(buf, "integer\n");
>> +}
>> +
>> +/**
>> + * attr_capdata01_show() - Get the value of the specified attribute pr=
operty
>> + *
>> + * @kobj: Pointer to the driver object=2E
>> + * @kobj_attribute: Pointer to the attribute calling this function=2E
>> + * @buf: The buffer to write to=2E
>> + * @tunable_attr: The attribute to be read=2E
>> + * @prop: The property of this attribute to be read=2E
>> + *
>> + * Retrieves the given property from the capability data 01 struct for=
 the
>> + * specified attribute's "custom" thermal mode=2E This function is int=
ended
>> + * to be generic so it can be called from any integer attributes "_sho=
w"
>> + * function=2E
>> + *
>> + * If the WMI is success the sysfs attribute is notified=2E
>> + *
>> + * Return: Either number of characters written to buf, or an error cod=
e=2E
>> + */
>> +static ssize_t attr_capdata01_show(struct kobject *kobj,
>> +				   struct kobj_attribute *kattr, char *buf,
>> +				   struct tunable_attr_01 *tunable_attr,
>> +				   enum attribute_property prop)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>> +	struct capdata01 capdata;
>> +	u32 attribute_id;
>> +	int value, ret;
>> +
>> +	attribute_id =3D
>> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
>> +			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (prop) {
>> +	case DEFAULT_VAL:
>> +		value =3D capdata=2Edefault_value;
>> +		break;
>> +	case MAX_VAL:
>> +		value =3D capdata=2Emax_value;
>> +		break;
>> +	case MIN_VAL:
>> +		value =3D capdata=2Emin_value;
>> +		break;
>> +	case STEP_VAL:
>> +		value =3D capdata=2Estep;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	return sysfs_emit(buf, "%d\n", value);
>> +}
>> +
>> +/**
>> + * att_current_value_store() - Set the current value of the given attr=
ibute
>> + * @kobj: Pointer to the driver object=2E
>> + * @kobj_attribute: Pointer to the attribute calling this function=2E
>> + * @buf: The buffer to read from, this is parsed to `int` type=2E
>> + * @count: Required by sysfs attribute macros, pass in from the callee=
 attr=2E
>> + * @tunable_attr: The attribute to be stored=2E
>> + *
>> + * Sets the value of the given attribute when operating under the "cus=
tom"
>> + * smartfan profile=2E The current smartfan profile is retrieved from =
the
>> + * lenovo-wmi-gamezone driver and error is returned if the result is n=
ot
>> + * "custom"=2E This function is intended to be generic so it can be ca=
lled from
>> + * any integer attribute's "_store" function=2E The integer to be sent=
 to the WMI
>> + * method is range checked and an error code is returned if out of ran=
ge=2E
>> + *
>> + * If the value is valid and WMI is success, then the sysfs attribute =
is
>> + * notified=2E
>> + *
>> + * Return: Either count, or an error code=2E
>> + */
>> +static ssize_t attr_current_value_store(struct kobject *kobj,
>> +					struct kobj_attribute *kattr,
>> +					const char *buf, size_t count,
>> +					struct tunable_attr_01 *tunable_attr)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>> +	struct wmi_method_args_32 args;
>> +	struct capdata01 capdata;
>> +	enum thermal_mode mode;
>> +	u32 attribute_id;
>> +	u32 value;
>> +	int ret;
>> +
>> +	ret =3D lwmi_om_notifier_call(&mode);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>> +		return -EBUSY;
>> +
>> +	attribute_id =3D
>> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +
>> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D kstrtouint(buf, 10, &value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>> +		return -EINVAL;
>> +
>> +	args=2Earg0 =3D attribute_id;
>> +	args=2Earg1 =3D value;
>> +
>> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET=
,
>> +				    (unsigned char *)&args, sizeof(args), NULL);
>> +
>> +	if (ret)
>
>Hi Derek,
>
>Please go through the entire patch series and remove empty lines=20
>between a call and its error handling=2E There are a few of them so I=20
>didn't want to do it manually here while applying=2E
>
>Once ready, please send v11=2E
>
>--
> i=2E
>

Will do=2E If I don't get to it today then I should be able to tomorrow=2E

Thanks,
Derek

>> +		return ret;
>> +
>> +	return count;
>> +};
>> +
>> +/**
>> + * attr_current_value_show() - Get the current value of the given attr=
ibute
>> + * @kobj: Pointer to the driver object=2E
>> + * @kobj_attribute: Pointer to the attribute calling this function=2E
>> + * @buf: The buffer to write to=2E
>> + * @tunable_attr: The attribute to be read=2E
>> + *
>> + * Retrieves the value of the given attribute for the current smartfan=
 profile=2E
>> + * The current smartfan profile is retrieved from the lenovo-wmi-gamez=
one driver=2E
>> + * This function is intended to be generic so it can be called from an=
y integer
>> + * attribute's "_show" function=2E
>> + *
>> + * If the WMI is success the sysfs attribute is notified=2E
>> + *
>> + * Return: Either number of characters written to buf, or an error cod=
e=2E
>> + */
>> +static ssize_t attr_current_value_show(struct kobject *kobj,
>> +				       struct kobj_attribute *kattr, char *buf,
>> +				       struct tunable_attr_01 *tunable_attr)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>> +	struct wmi_method_args_32 args;
>> +	enum thermal_mode mode;
>> +	u32 attribute_id;
>> +	int retval;
>> +	int err;
>> +
>> +	err =3D lwmi_om_notifier_call(&mode);
>> +	if (err)
>> +		return err;
>> +
>> +	attribute_id =3D
>> +		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>> +
>> +	args=2Earg0 =3D attribute_id;
>> +
>> +	err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET=
,
>> +				    (unsigned char *)&args, sizeof(args),
>> +				    &retval);
>> +
>> +	if (err)
>> +		return err;
>> +
>> +	return sysfs_emit(buf, "%d\n", retval);
>> +}
>> +
>> +/* Lenovo WMI Other Mode Attribute macros */
>> +#define __LWMI_ATTR_RO(_func, _name)                                  =
\
>> +	{                                                             \
>> +		=2Eattr =3D { =2Ename =3D __stringify(_name), =2Emode =3D 0444 }, \
>> +		=2Eshow =3D _func##_##_name##_show,                       \
>> +	}
>> +
>> +#define __LWMI_ATTR_RO_AS(_name, _show)                               =
\
>> +	{                                                             \
>> +		=2Eattr =3D { =2Ename =3D __stringify(_name), =2Emode =3D 0444 }, \
>> +		=2Eshow =3D _show,                                        \
>> +	}
>> +
>> +#define __LWMI_ATTR_RW(_func, _name) \
>> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
>> +
>> +/* Shows a formatted static variable */
>> +#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)            =
         \
>> +	static ssize_t _attrname##_##_prop##_show(                           =
  \
>> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
>> +	{                                                                    =
  \
>> +		return sysfs_emit(buf, _fmt, _val);                            \
>> +	}                                                                    =
  \
>> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D          =
    \
>> +		__LWMI_ATTR_RO(_attrname, _prop)
>> +
>> +/* Attribute current value read/write */
>> +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                 =
         \
>> +	static ssize_t _attrname##_current_value_store(                      =
  \
>> +		struct kobject *kobj, struct kobj_attribute *kattr,            \
>> +		const char *buf, size_t count)                                 \
>> +	{                                                                    =
  \
>> +		return attr_current_value_store(kobj, kattr, buf, count,       \
>> +						&_attrname);                   \
>> +	}                                                                    =
  \
>> +	static ssize_t _attrname##_current_value_show(                       =
  \
>> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
>> +	{                                                                    =
  \
>> +		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
>> +	}                                                                    =
  \
>> +	static struct kobj_attribute attr_##_attrname##_current_value =3D    =
    \
>> +		__LWMI_ATTR_RW(_attrname, current_value)
>> +
>> +/* Attribute property read only */
>> +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)         =
         \
>> +	static ssize_t _attrname##_##_prop##_show(                           =
  \
>> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
>> +	{                                                                    =
  \
>> +		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
>> +					   _prop_type);                        \
>> +	}                                                                    =
  \
>> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D          =
    \
>> +		__LWMI_ATTR_RO(_attrname, _prop)
>> +
>> +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)  =
    \
>> +	__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
>> +	__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
>> +	__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
>> +	__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
>> +	__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
>> +	__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
>> +	static struct kobj_attribute attr_##_attrname##_type =3D            \
>> +		__LWMI_ATTR_RO_AS(type, int_type_show);                   \
>> +	static struct attribute *_attrname##_attrs[] =3D {                  \
>> +		&attr_##_attrname##_current_value=2Eattr,                   \
>> +		&attr_##_attrname##_default_value=2Eattr,                   \
>> +		&attr_##_attrname##_display_name=2Eattr,                    \
>> +		&attr_##_attrname##_max_value=2Eattr,                       \
>> +		&attr_##_attrname##_min_value=2Eattr,                       \
>> +		&attr_##_attrname##_scalar_increment=2Eattr,                \
>> +		&attr_##_attrname##_type=2Eattr,                            \
>> +		NULL,                                                     \
>> +	};                                                                \
>> +	static const struct attribute_group _attrname##_attr_group =3D {    \
>> +		=2Ename =3D _fsname, =2Eattrs =3D _attrname##_attrs               \
>> +	}
>> +
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
>> +			      "Set the CPU sustained power limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
>> +			      "Set the CPU slow package power tracking limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
>> +			      "Set the CPU fast package power tracking limit");
>> +
>> +static struct capdata01_attr_group cd01_attr_groups[] =3D {
>> +	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
>> +	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
>> +	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
>> +	{},
>> +};
>> +
>> +/**
>> + * lwmi_om_fw_attr_add() - Register all firmware_attributes_class memb=
ers
>> + * @priv: The Other Mode driver data=2E
>> + *
>> + * Return: Either 0, or an error code=2E
>> + */
>> +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
>> +{
>> +	unsigned int i;
>> +	int err;
>> +
>> +	priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
>> +	if (priv->ida_id < 0)
>> +		return priv->ida_id;
>> +
>> +	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
>> +					  MKDEV(0, 0), NULL, "%s-%u",
>> +					  LWMI_OM_FW_ATTR_BASE_PATH,
>> +					  priv->ida_id);
>> +	if (IS_ERR(priv->fw_attr_dev)) {
>> +		err =3D PTR_ERR(priv->fw_attr_dev);
>> +		goto err_free_ida;
>> +	}
>> +
>> +	priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
>> +						 &priv->fw_attr_dev->kobj);
>> +	if (!priv->fw_attr_kset) {
>> +		err =3D -ENOMEM;
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
>> +		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>> +					 cd01_attr_groups[i]=2Eattr_group);
>> +		if (err)
>> +			goto err_remove_groups;
>> +
>> +		cd01_attr_groups[i]=2Etunable_attr->dev =3D &priv->wdev->dev;
>> +	}
>> +	return 0;
>> +
>> +err_remove_groups:
>> +	while (i--)
>> +		sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> +				   cd01_attr_groups[i]=2Eattr_group);
>> +
>> +	kset_unregister(priv->fw_attr_kset);
>> +
>> +err_destroy_classdev:
>> +	device_unregister(priv->fw_attr_dev);
>> +
>> +err_free_ida:
>> +	ida_free(&lwmi_om_ida, priv->ida_id);
>> +	return err;
>> +}
>> +
>> +/**
>> + * lwmi_om_fw_attr_remove() - Unregister all capability data attribute=
 groups
>> + * @priv: the lenovo-wmi-other driver data=2E
>> + */
>> +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
>> +{
>> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
>> +		sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> +				   cd01_attr_groups[i]=2Eattr_group);
>> +
>> +	kset_unregister(priv->fw_attr_kset);
>> +	device_unregister(priv->fw_attr_dev);
>> +}
>> +
>> +/**
>> + * lwmi_om_master_bind() - Bind all components of the other mode drive=
r
>> + * @dev: The lenovo-wmi-other driver basic device=2E
>> + *
>> + * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to =
the
>> + * lenovo-wmi-other master driver=2E On success, assign the capability=
 data 01
>> + * list pointer to the driver data struct for later access=2E This poi=
nter
>> + * is only valid while the capdata01 interface exists=2E Finally, regi=
ster all
>> + * firmware attribute groups=2E
>> + *
>> + * Return: 0 on success, or an error code=2E
>> + */
>> +static int lwmi_om_master_bind(struct device *dev)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
>> +	struct cd01_list *tmp_list;
>> +	int ret;
>> +
>> +	ret =3D component_bind_all(dev, &tmp_list);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->cd01_list =3D tmp_list;
>> +
>> +	if (!priv->cd01_list)
>> +		return -ENODEV;
>> +
>> +	return lwmi_om_fw_attr_add(priv);
>> +}
>> +
>> +/**
>> + * lwmi_om_master_unbind() - Unbind all components of the other mode d=
river
>> + * @dev: The lenovo-wmi-other driver basic device
>> + *
>> + * Unregister all capability data attribute groups=2E Then call
>> + * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from=
 the
>> + * lenovo-wmi-other master driver=2E Finally, free the IDA for this de=
vice=2E
>> + */
>> +static void lwmi_om_master_unbind(struct device *dev)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
>> +
>> +	lwmi_om_fw_attr_remove(priv);
>> +	component_unbind_all(dev, NULL);
>> +}
>> +
>> +static const struct component_master_ops lwmi_om_master_ops =3D {
>> +	=2Ebind =3D lwmi_om_master_bind,
>> +	=2Eunbind =3D lwmi_om_master_unbind,
>> +};
>> +
>> +static int lwmi_other_probe(struct wmi_device *wdev, const void *conte=
xt)
>> +{
>> +	struct component_match *master_match =3D NULL;
>> +	struct lwmi_om_priv *priv;
>> +
>> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->wdev =3D wdev;
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +
>> +	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL)=
;
>> +	if (IS_ERR(master_match))
>> +		return PTR_ERR(master_match);
>> +
>> +	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_op=
s,
>> +					       master_match);
>> +}
>> +
>> +static void lwmi_other_remove(struct wmi_device *wdev)
>> +{
>> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
>> +
>> +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
>> +	ida_free(&lwmi_om_ida, priv->ida_id);
>> +}
>> +
>> +static const struct wmi_device_id lwmi_other_id_table[] =3D {
>> +	{ LENOVO_OTHER_MODE_GUID, NULL },
>> +	{}
>> +};
>> +
>> +static struct wmi_driver lwmi_other_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "lenovo_wmi_other",
>> +		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	=2Eid_table =3D lwmi_other_id_table,
>> +	=2Eprobe =3D lwmi_other_probe,
>> +	=2Eremove =3D lwmi_other_remove,
>> +	=2Eno_singleton =3D true,
>> +};
>> +
>> +module_wmi_driver(lwmi_other_driver);
>> +
>> +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
>> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>> +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
>> +MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
>> +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-wmi-other=2Eh b/drivers/platfo=
rm/x86/lenovo-wmi-other=2Eh
>> new file mode 100644
>> index 000000000000=2E=2E8ebf5602bb99
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-other=2Eh
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>> +
>> +/* Copyright (C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>=
 */
>> +
>> +#ifndef _LENOVO_WMI_OTHER_H_
>> +#define _LENOVO_WMI_OTHER_H_
>> +
>> +struct device;
>> +struct notifier_block;
>> +
>> +int lwmi_om_register_notifier(struct notifier_block *nb);
>> +int lwmi_om_unregister_notifier(struct notifier_block *nb);
>> +int devm_lwmi_om_register_notifier(struct device *dev,
>> +				   struct notifier_block *nb);
>> +
>> +#endif /* !_LENOVO_WMI_OTHER_H_ */
>>=20

- Derek
