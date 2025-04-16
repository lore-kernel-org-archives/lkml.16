Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B98A224223;
	Wed, 16 Apr 2025 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844585; cv=none; b=JbP8X+ywH0Ux12fbcpJ55mWwdFKaPxJeEB76i3ibdzGp96S28C9YRiL8uOffIdBcPQQ4/PlSsDSpKYqa/6yczSbsGq0kSuMDvrIGITFfPRlpt4hkESOYZoxVc+s9DhL6xv/EYqEWr779yuR093H+XbOnlLA09d6wk0/Bnqt+fKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844585; c=relaxed/simple;
	bh=pAwCozqN3nPYVpZT2W7b9N4HhA9VOC5P1Qoz6vHNxOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1KrDWe6NBD2BH9+OtXvhcBDheqv1Hc++tY8cIjOoQw+zRnTeSP18gFnBq9PEb4X+FApYJUtPBbi2neAVvJanbTEgLLGO7rWIaqg8wiruJSwx/Q0clPN46LPICEMDHDmj58I4L+HnD4tCq042gmcGlezqqWnA2wOYZbQV/mygiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tDtygbBW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tDtygbBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744844560; x=1745449360; i=w_armin@gmx.de;
	bh=pTkj5Rozhe1coq8MbnyGvfnukGWMseBJwr29VvuehlY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tDtygbBWSycdBPmRyR0EbBvPDtqigGupa5nWO+tS+vNn/pkSoFQ92yGIbOAvTTLN
	 BEKDIP9P+H7TSqbjyuNWKs5PrClWe6Tc5ylMLzvJvfF6L11w2VGqA2dX5d8JpMyfz
	 PA9TDuxmLTZtiB2oiuwzVgMp02RqBdXf8tCMa1Lg+tjm+a7StkfdqobRUUsgoa6dB
	 /fEgQ2vAETpL6nVWp9q6HVd4lsC0bnnTZqyx8hZckdNwVJLP+GbyHnxP+xLXJCsQo
	 3PRF1PpwiZuppLMLnIVoISQWHv3c5xrlKPo9YAhRNYOaN3iGB4RpaPGY8YjjvUbxP
	 wHEXySc04/KN1+TGJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1uWiYV3uVQ-00PRGm; Thu, 17
 Apr 2025 01:02:40 +0200
Message-ID: <8f44ddb2-cdfa-4219-8d6a-5188b495ebf4@gmx.de>
Date: Thu, 17 Apr 2025 01:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-7-derekjohn.clark@gmail.com>
 <097d5f0e-b7e5-a528-1eff-5f7aceacbbca@linux.intel.com>
 <CAFqHKTniVCD-Yqu0=PyZd0yezMYVaiNx_adn7sjmw4kXx0QaiQ@mail.gmail.com>
 <687AAA12-14D7-4DA3-A469-425955AAEDEC@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <687AAA12-14D7-4DA3-A469-425955AAEDEC@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RemC/r1H6OVD+tfxnxBuPFzT+53HodUt1JPl/9n3FXM6WG4LfeQ
 9s1KV2ay9fRxWZtf2n3YOMlR9oADf6DQdsbI+TlhsFGHnFv0ebPtktqxGYyHqrLHAmXob+d
 Y38LHn649A2MR4I/RSemC9ZxxKMiyfD0Di42gUbvEqfQuclC3V41j5snsPkXP+P5yO2Yo4e
 B+XdwUaqKPkqMyemiBryQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YX0w9d2epSQ=;d13L3aUqfvWuGrPmbS0hUfAqkna
 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
 xQ7witFkNay3Q=

Am 15.04.25 um 20:39 schrieb Derek J. Clark:

>
> On Fri, Apr 11, 2025, 07:54 Derek John Clark <derekjohn.clark@gmail.com>
> wrote:
>
>> On Tue, Apr 8, 2025 at 5:50=E2=80=AFAM Ilpo J=C3=A4rvinen
>> <ilpo.jarvinen@linux.intel.com> wrote:
>>> On Mon, 7 Apr 2025, Derek J. Clark wrote:
>>>
>>>> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" W=
MI
>>>> interface that comes on some Lenovo "Gaming Series" hardware. Provide=
s
>> a
>>>> firmware-attributes class which enables the use of tunable knobs for
>> SPL,
>>>> SPPT, and FPPT.
>>>>
>>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>> ---
>>>> v5:
>>>> - Switch from locally storing capability data list to storing a point=
er
>>>>    from the capability data interface.
>>>> - Add portion of Gamezone driver that relies on the exported function=
s
>>>>    of this driver.
>>>> - Properly initialize IDA and use it for naming the firmware-attribut=
es
>>>>    path.
>>>> - Rename most defines to clearly indicate they are from this driver.
>>>> - Misc fixes from v4 review.
>>>> v4:
>>>> - Treat Other Mode as a notifier chain head, use the notifier chain t=
o
>>>>    get the current mode from Gamezone.
>>>> - Add header file for Other Mode specific structs and finctions.
>>>> - Use component master bind to cache the capdata01 array locally.
>>>> - Drop all reference to external driver private data structs.
>>>> - Various fixes from review.
>>>> v3:
>>>> - Add notifier block and store result for getting the Gamezone
>> interface
>>>>    profile changes.
>>>> - Add driver as master component of capdata01 driver.
>>>> - Use FIELD_PREP where appropriate.
>>>> - Move macros and associated functions out of lemovo-wmi.h that are
>> only
>>>>    used by this driver.
>>>> v2:
>>>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>>>    reference.
>>>> - Ensure reverse Christmas tree for all variable declarations.
>>>> - Remove extra whitespace.
>>>> - Use guard(mutex) in all mutex instances, global mutex.
>>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>>> - Remove noisy pr_info usage.
>>>> - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
>>>> - Use list to get the lenovo_wmi_om_priv instance in some macro
>>>>    called functions as the data provided by the macros that use it
>>>>    doesn't pass a member of the struct for use in container_of.
>>>> - Do not rely on GameZone interface to grab the current fan mode.
>>>> ---
>>>>   MAINTAINERS                                |   2 +
>>>>   drivers/platform/x86/Kconfig               |  15 +
>>>>   drivers/platform/x86/Makefile              |   1 +
>>>>   drivers/platform/x86/lenovo-wmi-gamezone.c |  35 ++
>>>>   drivers/platform/x86/lenovo-wmi-other.c    | 677 ++++++++++++++++++=
+++
>>>>   drivers/platform/x86/lenovo-wmi-other.h    |  16 +
>>>>   6 files changed, 746 insertions(+)
>>>>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>>>>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 49deb8ea4ea7..0416afd997a0 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -13172,6 +13172,8 @@ F:
>> drivers/platform/x86/lenovo-wmi-gamezone.c
>>>>   F:   drivers/platform/x86/lenovo-wmi-gamezone.h
>>>>   F:   drivers/platform/x86/lenovo-wmi-helpers.c
>>>>   F:   drivers/platform/x86/lenovo-wmi-helpers.h
>>>> +F:   drivers/platform/x86/lenovo-wmi-other.c
>>>> +F:   drivers/platform/x86/lenovo-wmi-other.h
>>>>
>>>>   LENOVO WMI HOTKEY UTILITIES DRIVER
>>>>   M:   Jackie Dong <xy-jackie@139.com>
>>>> diff --git a/drivers/platform/x86/Kconfig
>> b/drivers/platform/x86/Kconfig
>>>> index aaa1a69c10ca..be5ab24960b5 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
>>>>        tristate
>>>>        depends on ACPI_WMI
>>>>
>>>> +config LENOVO_WMI_TUNING
>>>> +     tristate "Lenovo Other Mode WMI Driver"
>>>> +     depends on ACPI_WMI
>>>> +     select FW_ATTR_CLASS
>>>> +     select LENOVO_WMI_DATA01
>>>> +     select LENOVO_WMI_EVENTS
>>>> +     select LENOVO_WMI_HELPERS
>>>> +     help
>>>> +       Say Y here if you have a WMI aware Lenovo Legion device and
>> would like to use the
>>>> +       firmware_attributes API to control various tunable settings
>> typically exposed by
>>>> +       Lenovo software in Windows.
>>>> +
>>>> +       To compile this driver as a module, choose M here: the module
>> will
>>>> +       be called lenovo-wmi-other.
>>>> +
>>>>   config IDEAPAD_LAPTOP
>>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>>        depends on ACPI
>>>> diff --git a/drivers/platform/x86/Makefile
>> b/drivers/platform/x86/Makefile
>>>> index 60058b547de2..f3e64926a96b 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D
>> lenovo-wmi-capdata01.o
>>>>   obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
>>>>   obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
>>>>   obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
>>>> +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
>>>>
>>>>   # Intel
>>>>   obj-y                                +=3D intel/
>>>> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c
>> b/drivers/platform/x86/lenovo-wmi-gamezone.c
>>>> index 2e6d5e7faadf..9c80561f931c 100644
>>>> --- a/drivers/platform/x86/lenovo-wmi-gamezone.c
>>>> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
>>>> @@ -22,6 +22,7 @@
>>>>   #include "lenovo-wmi-events.h"
>>>>   #include "lenovo-wmi-gamezone.h"
>>>>   #include "lenovo-wmi-helpers.h"
>>>> +#include "lenovo-wmi-other.h"
>>>>
>>>>   #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>>>>
>>>> @@ -49,6 +50,34 @@ static struct quirk_entry quirk_no_extreme_bug =3D=
 {
>>>>        .extreme_supported =3D false,
>>>>   };
>>>>
>>>> +/**
>>>> + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver
>> notifier.
>>>> + *
>>>> + * @nb: The notifier_block registered to lenovo-wmi-other driver.
>>>> + * @cmd: The event type.
>>>> + * @data: Thermal mode enum pointer pointer for returning the therma=
l
>> mode.
>>>> + *
>>>> + * For LWMI_GZ_GET_THERMAL_MODE, retrieve the current thermal mode.
>>>> + *
>>>> + * Return: Notifier_block status.
>>>> + */
>>>> +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned lon=
g
>> cmd,
>>>> +                          void *data)
>>>> +{
>>>> +     enum thermal_mode **mode =3D data;
>>>> +     struct lwmi_gz_priv *priv;
>>>> +
>>>> +     priv =3D container_of(nb, struct lwmi_gz_priv, mode_nb);
>>>> +
>>>> +     switch (cmd) {
>>>> +     case LWMI_GZ_GET_THERMAL_MODE:
>>>> +             **mode =3D priv->current_mode;
>>>> +             return NOTIFY_STOP;
>>>> +     default:
>>>> +             return NOTIFY_DONE;
>>>> +     }
>>>> +}
>>>> +
>>>>   /**
>>>>    * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver
>> notifier.
>>>>    * block call chain.
>>>> @@ -347,6 +376,11 @@ static int lwmi_gz_probe(struct wmi_device *wdev=
,
>> const void *context)
>>>>        if (ret)
>>>>                return ret;
>>>>
>>>> +     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
>>>> +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_=
nb);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>>        return 0;
>>>>   }
>>>>
>>>> @@ -369,6 +403,7 @@ module_wmi_driver(lwmi_gz_driver);
>>>>
>>>>   MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
>>>>   MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>>>> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
>>>>   MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
>>>>   MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>>>   MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>>>> diff --git a/drivers/platform/x86/lenovo-wmi-other.c
>> b/drivers/platform/x86/lenovo-wmi-other.c
>>>> new file mode 100644
>>>> index 000000000000..342883a90270
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/lenovo-wmi-other.c
>>>> @@ -0,0 +1,677 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Lenovo Other Mode WMI interface driver.
>>>> + *
>>>> + * This driver uses the fw_attributes class to expose the various WM=
I
>> functions
>>>> + * provided by the "Other Mode" WMI interface. This enables CPU and
>> GPU power
>>>> + * limit as well as various other attributes for devices that fall
>> under the
>>>> + * "Gaming Series" of Lenovo laptop devices. Each attribute exposed
>> by the
>>>> + * "Other Mode"" interface has a corresponding Capability Data struc=
t
>> that
>>>> + * allows the driver to probe details about the attribute such as if
>> it is
>>>> + * supported by the hardware, the default_value, max_value,
>> min_value, and step
>>>> + * increment.
>>>> + *
>>>> + * These attributes typically don't fit anywhere else in the sysfs
>> and are set
>>>> + * in Windows using one of Lenovo's multiple user applications.
>>>> + *
>>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>>> + */
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/bitfield.h>
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/component.h>
>>>> +#include <linux/container_of.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/export.h>
>>>> +#include <linux/gfp_types.h>
>>>> +#include <linux/idr.h>
>>>> +#include <linux/kobject.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/notifier.h>
>>>> +#include <linux/platform_profile.h>
>>>> +#include <linux/types.h>
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#include "lenovo-wmi-capdata01.h"
>>>> +#include "lenovo-wmi-events.h"
>>>> +#include "lenovo-wmi-gamezone.h"
>>>> +#include "lenovo-wmi-helpers.h"
>>>> +#include "lenovo-wmi-other.h"
>>>> +#include "firmware_attributes_class.h"
>>>> +
>>>> +#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B=
"
>>>> +
>>>> +#define LWMI_DEVICE_ID_CPU 0x01
>>>> +
>>>> +#define LWMI_FEATURE_ID_CPU_SPPT 0x01
>>>> +#define LWMI_FEATURE_ID_CPU_SPL 0x02
>>>> +#define LWMI_FEATURE_ID_CPU_FPPT 0x03
>>> Align values in every define group.
>>>
>>>> +
>>>> +#define LWMI_TYPE_ID_NONE 0x00
>>>> +
>>>> +#define LWMI_FEATURE_VALUE_GET 17
>>>> +#define LWMI_FEATURE_VALUE_SET 18
>>>> +
>>>> +#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
>>>> +#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
>>>> +#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
>>>> +#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
>>>> +
>>>> +#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>>>> +
>>>> +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>>>> +static DEFINE_IDA(lwmi_om_ida);
>>>> +
>>>> +enum attribute_property {
>>>> +     DEFAULT_VAL,
>>>> +     MAX_VAL,
>>>> +     MIN_VAL,
>>>> +     STEP_VAL,
>>>> +     SUPPORTED,
>>>> +};
>>>> +
>>>> +struct lwmi_om_priv {
>>>> +     struct component_master_ops *ops;
>>>> +     /* *cd01_list is only valid after master bind and while
>> capdata01 exists */
>>>> +     struct cd01_list *cd01_list;
>>>> +     struct device *fw_attr_dev;
>>>> +     struct kset *fw_attr_kset;
>>>> +     struct notifier_block nb;
>>>> +     struct wmi_device *wdev;
>>>> +     int ida_id;
>>>> +};
>>>> +
>>>> +struct tunable_attr_01 {
>>>> +     struct capdata01 *capdata;
>>>> +     struct device *dev;
>>>> +     u32 feature_id;
>>>> +     u32 device_id;
>>>> +     u32 type_id;
>>>> +};
>>>> +
>>>> +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D
>> LWMI_DEVICE_ID_CPU,
>>>> +                                    .feature_id =3D
>> LWMI_FEATURE_ID_CPU_SPL,
>>>> +                                    .type_id =3D LWMI_TYPE_ID_NONE }=
;
>>>> +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D
>> LWMI_DEVICE_ID_CPU,
>>>> +                                     .feature_id =3D
>> LWMI_FEATURE_ID_CPU_SPPT,
>>>> +                                     .type_id =3D LWMI_TYPE_ID_NONE =
};
>>>> +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D
>> LWMI_DEVICE_ID_CPU,
>>>> +                                     .feature_id =3D
>> LWMI_FEATURE_ID_CPU_FPPT,
>>>> +                                     .type_id =3D LWMI_TYPE_ID_NONE =
};
>>>> +
>>>> +struct capdata01_attr_group {
>>>> +     const struct attribute_group *attr_group;
>>>> +     struct tunable_attr_01 *tunable_attr;
>>>> +};
>>>> +
>>>> +/**
>>>> + * lwmi_om_register_notifier() - Add a notifier to the blocking
>> notifier chain
>>>> + * @nb: The notifier_block struct to register
>>>> + *
>>>> + * Call blocking_notifier_chain_register to register the notifier
>> block to the
>>>> + * lenovo-wmi-other driver notifer chain.
>>>> + *
>>>> + * Return: 0 on success, %-EEXIST on error.
>>>> + */
>>>> +int lwmi_om_register_notifier(struct notifier_block *nb)
>>>> +{
>>>> +     return blocking_notifier_chain_register(&om_chain_head, nb);
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
>>>> +
>>>> +/**
>>>> + * lwmi_om_unregister_notifier() - Remove a notifier from the
>> blocking notifier
>>>> + * chain.
>>>> + * @nb: The notifier_block struct to register
>>>> + *
>>>> + * Call blocking_notifier_chain_unregister to unregister the notifie=
r
>> block from the
>>>> + * lenovo-wmi-other driver notifer chain.
>>>> + *
>>>> + * Return: 0 on success, %-ENOENT on error.
>>>> + */
>>>> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
>>>> +{
>>>> +     return blocking_notifier_chain_unregister(&om_chain_head, nb);
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER"=
);
>>>> +
>>>> +/**
>>>> + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the
>> blocking
>>>> + * notifier chain.
>>>> + * @data: Void pointer to the notifier_block struct to register.
>>>> + *
>>>> + * Call lwmi_om_unregister_notifier to unregister the notifier block
>> from the
>>>> + * lenovo-wmi-other driver notifer chain.
>>>> + *
>>>> + * Return: 0 on success, %-ENOENT on error.
>>>> + */
>>>> +static void devm_lwmi_om_unregister_notifier(void *data)
>>>> +{
>>>> +     struct notifier_block *nb =3D data;
>>>> +
>>>> +     lwmi_om_unregister_notifier(nb);
>>>> +}
>>>> +
>>>> +/**
>>>> + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking
>> notifier
>>>> + * chain.
>>>> + * @dev: The parent device of the notifier_block struct.
>>>> + * @nb: The notifier_block struct to register
>>>> + *
>>>> + * Call lwmi_om_register_notifier to register the notifier block to
>> the
>>>> + * lenovo-wmi-other driver notifer chain. Then add
>> devm_lwmi_om_unregister_notifier
>>>> + * as a device managed ation to automatically unregister the notifie=
r
>> block
>>>> + * upon parent device removal.
>>>> + *
>>>> + * Return: 0 on success, or on error.
>>>> + */
>>>> +int devm_lwmi_om_register_notifier(struct device *dev,
>>>> +                                struct notifier_block *nb)
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     ret =3D lwmi_om_register_notifier(nb);
>>>> +     if (ret < 0)
>>>> +             return ret;
>>>> +
>>>> +     return devm_add_action_or_reset(dev,
>> devm_lwmi_om_unregister_notifier,
>>>> +                                     nb);
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier,
>> "LENOVO_WMI_OTHER");
>>>> +
>>>> +/**
>>>> + * lwmi_om_notifier_call() - Call functions for the notifier call
>> chain.
>>>> + * @mode: Pointer to a thermal mode enum to retrieve the data from.
>>>> + *
>>>> + * Call blocking_notifier_call_chain to retrieve the thermal mode
>> from the
>>>> + * lenovo-wmi-gamezone driver.
>>>> + *
>>>> + * Return: 0 on success, or on error.
>>>> + */
>>>> +static int lwmi_om_notifier_call(enum thermal_mode *mode)
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     ret =3D blocking_notifier_call_chain(&om_chain_head,
>> LWMI_GZ_GET_THERMAL_MODE, &mode);
>>>> +     if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
>>>> +             return -EINVAL;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +/* Attribute Methods */
>>>> +
>>>> +/**
>>>> + * int_type_show() - Emit the data type for an integer attribute
>>>> + * @kobj: Pointer to the driver object.
>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>> + * @buf: The buffer to write to.
>>>> + *
>>>> + * Return: Number of characters written to buf.
>>>> + */
>>>> +static ssize_t int_type_show(struct kobject *kobj, struct
>> kobj_attribute *kattr,
>>>> +                          char *buf)
>>>> +{
>>>> +     return sysfs_emit(buf, "integer\n");
>>>> +}
>>>> +
>>>> +/**
>>>> + * attr_capdata01_get - Get the data of the specified attribute
>>>> + * @tunable_attr: The attribute to be populated.
>>>> + *
>>>> + * Retrieves the capability data 01 struct pointer for the given
>>>> + * attribute for its specified thermal mode.
>>>> + *
>>>> + * Return: Either a pointer to capability data, or NULL.
>>>> + */
>>>> +static struct capdata01 *attr_capdata01_get_data(struct lwmi_om_priv
>> *priv,
>>>> +                                              u32 attribute_id)
>>>> +{
>>>> +     int idx;
>>>> +
>>>> +     for (idx =3D 0; idx < priv->cd01_list->count; idx++) {
>>> The convention for loop variables that count from 0 upwards is to use
>>> unsigned type.
>>>
>>>> +             if (priv->cd01_list->data[idx].id !=3D attribute_id)
>>>> +                     continue;
>>>> +             return &priv->cd01_list->data[idx];
>>>> +     }
>>>> +     return NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * attr_capdata01_show() - Get the value of the specified attribute
>> property
>>>> + *
>>>> + * @kobj: Pointer to the driver object.
>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>> + * @buf: The buffer to write to.
>>>> + * @tunable_attr: The attribute to be read.
>>>> + * @prop: The property of this attribute to be read.
>>>> + *
>>>> + * Retrieves the given property from the capability data 01 struct
>> for the
>>>> + * specified attribute's "custom" thermal mode. This function is
>> intended
>>>> + * to be generic so it can be called from any integer attributes
>> "_show"
>>>> + * function.
>>>> + *
>>>> + * If the WMI is success the sysfs attribute is notified.
>>> Add comma after success.
>>>
>>>> + *
>>>> + * Return: Either number of characters written to buf, or an error.
>>>> + */
>>>> +static ssize_t attr_capdata01_show(struct kobject *kobj,
>>>> +                                struct kobj_attribute *kattr, char
>> *buf,
>>>> +                                struct tunable_attr_01 *tunable_attr=
,
>>>> +                                enum attribute_property prop)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev=
);
>>>> +     struct capdata01 *capdata;
>>>> +     u32 attribute_id;
>>>> +     int value;
>>>> +
>>>> +     attribute_id =3D
>>>> +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,
>> tunable_attr->device_id) |
>>>> +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,
>> tunable_attr->feature_id) |
>>>> +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
>> LWMI_GZ_THERMAL_MODE_CUSTOM) |
>>>> +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,
>> tunable_attr->type_id);
>>>> +
>>>> +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
>>>> +
>>>> +     if (!capdata)
>>>> +             return -ENODEV;
>>>> +
>>>> +     switch (prop) {
>>>> +     case DEFAULT_VAL:
>>>> +             value =3D capdata->default_value;
>>>> +             break;
>>>> +     case MAX_VAL:
>>>> +             value =3D capdata->max_value;
>>>> +             break;
>>>> +     case MIN_VAL:
>>>> +             value =3D capdata->min_value;
>>>> +             break;
>>>> +     case STEP_VAL:
>>>> +             value =3D capdata->step;
>>>> +             break;
>>>> +     default:
>>>> +             return -EINVAL;
>>>> +     }
>>>> +     return sysfs_emit(buf, "%d\n", value);
>>>> +}
>>>> +
>>>> +/**
>>>> + * att_current_value_store() - Set the current value of the given
>> attribute
>>>> + * @kobj: Pointer to the driver object.
>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>> + * @buf: The buffer to read from, this is parsed to `int` type.
>>>> + * @count: Required by sysfs attribute macros, pass in from the
>> callee attr.
>>>> + * @tunable_attr: The attribute to be stored.
>>>> + *
>>>> + * Sets the value of the given attribute when operating under the
>> "custom"
>>>> + * smartfan profile. The current smartfan profile is retrieved from
>> the
>>>> + * lenovo-wmi-gamezone driver and error is returned if the result is
>> not
>>>> + * "custom". This function is intended to be generic so it can be
>> called from
>>>> + * any integer attribute's "_store" function. The integer to be sent
>> to the WMI
>>>> + * method is range checked and an error is returned if out of range.
>>>> + *
>>>> + * If the value is valid and WMI is success, then the sysfs attribut=
e
>> is
>>>> + * notified.
>>>> + *
>>>> + * Return: Either count, or an error.
>>>> + */
>>>> +static ssize_t attr_current_value_store(struct kobject *kobj,
>>>> +                                     struct kobj_attribute *kattr,
>>>> +                                     const char *buf, size_t count,
>>>> +                                     struct tunable_attr_01
>> *tunable_attr)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev=
);
>>>> +     struct wmi_method_args_32 args;
>>>> +     struct capdata01 *capdata;
>>>> +     enum thermal_mode mode;
>>>> +     u32 attribute_id;
>>>> +     u32 value;
>>>> +     int err;
>>>> +
>>>> +     err =3D lwmi_om_notifier_call(&mode);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>>>> +             return -EBUSY;
>>>> +
>>>> +     attribute_id =3D
>>>> +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,
>> tunable_attr->device_id) |
>>> Just combine this to the previous line and realign the ones below.
>>>
>>>> +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,
>> tunable_attr->feature_id) |
>>>> +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>>>> +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,
>> tunable_attr->type_id);
>>>> +
>>>> +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
>>>> +
>>>> +     if (!capdata)
>>>> +             return -ENODEV;
>>>> +
>>>> +     err =3D kstrtouint(buf, 10, &value);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     if (value < capdata->min_value || value > capdata->max_value)
>>>> +             return -EINVAL;
>>>> +
>>>> +     args.arg0 =3D attribute_id;
>>>> +     args.arg1 =3D value;
>>>> +
>>>> +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0,
>> LWMI_FEATURE_VALUE_SET,
>>>> +                                 (unsigned char *)&args,
>> sizeof(args), NULL);
>>>> +
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     return count;
>>>> +};
>>>> +
>>>> +/**
>>>> + * attr_current_value_show() - Get the current value of the given
>> attribute
>>>> + * @kobj: Pointer to the driver object.
>>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>>> + * @buf: The buffer to write to.
>>>> + * @tunable_attr: The attribute to be read.
>>>> + *
>>>> + * Retrieves the value of the given attribute for the current
>> smartfan profile.
>>>> + * The current smartfan profile is retrieved from the
>> lenovo-wmi-gamezone driver.
>>>> + * This function is intended to be generic so it can be called from
>> any integer
>>>> + * attribute's "_show" function.
>>>> + *
>>>> + * If the WMI is success the sysfs attribute is notified.
>>>> + *
>>>> + * Return: Either number of characters written to buf, or an error.
>>>> + */
>>>> +static ssize_t attr_current_value_show(struct kobject *kobj,
>>>> +                                    struct kobj_attribute *kattr,
>> char *buf,
>>>> +                                    struct tunable_attr_01
>> *tunable_attr)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev=
);
>>>> +     struct wmi_method_args_32 args;
>>>> +     enum thermal_mode mode;
>>>> +     u32 attribute_id;
>>>> +     int retval;
>>>> +     int err;
>>>> +
>>>> +     err =3D lwmi_om_notifier_call(&mode);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     attribute_id =3D
>>>> +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,
>> tunable_attr->device_id) |
>>> Ditto.
>>>
>>>> +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,
>> tunable_attr->feature_id) |
>>>> +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>>>> +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,
>> tunable_attr->type_id);
>>>> +
>>>> +     args.arg0 =3D attribute_id;
>>>> +
>>>> +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0,
>> LWMI_FEATURE_VALUE_GET,
>>>> +                                 (unsigned char *)&args, sizeof(args=
),
>>>> +                                 &retval);
>>>> +
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     return sysfs_emit(buf, "%d\n", retval);
>>>> +}
>>>> +
>>>> +/* Lenovo WMI Other Mode Attribute macros */
>>>> +#define __LWMI_ATTR_RO(_func, _name)
>> \
>>>> +     {                                                             \
>>>> +             .attr =3D { .name =3D __stringify(_name), .mode =3D 044=
4 }, \
>>>> +             .show =3D _func##_##_name##_show,                      =
 \
>>>> +     }
>>>> +
>>>> +#define __LWMI_ATTR_RO_AS(_name, _show)
>>   \
>>>> +     {                                                             \
>>>> +             .attr =3D { .name =3D __stringify(_name), .mode =3D 044=
4 }, \
>>>> +             .show =3D _show,                                       =
 \
>>>> +     }
>>>> +
>>>> +#define __LWMI_ATTR_RW(_func, _name) \
>>>> +     __ATTR(_name, 0644, _func##_##_name##_show,
>> _func##_##_name##_store)
>>>> +
>>>> +/* Shows a formatted static variable */
>>>> +#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)
>>           \
>>>> +     static ssize_t _attrname##_##_prop##_show(
>>         \
>>>> +             struct kobject *kobj, struct kobj_attribute *kattr, cha=
r
>> *buf) \
>>>> +     {
>>        \
>>>> +             return sysfs_emit(buf, _fmt, _val);
>>        \
>>>> +     }
>>        \
>>>> +     static struct kobj_attribute attr_##_attrname##_##_prop =3D
>>        \
>>>> +             __LWMI_ATTR_RO(_attrname, _prop)
>>>> +
>>>> +/* Attribute current value read/write */
>>>> +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)
>>            \
>>>> +     static ssize_t _attrname##_current_value_store(
>>        \
>>>> +             struct kobject *kobj, struct kobj_attribute *kattr,
>>        \
>>>> +             const char *buf, size_t count)
>>         \
>>>> +     {
>>        \
>>>> +             return attr_current_value_store(kobj, kattr, buf,
>> count,       \
>>>> +                                             &_attrname);
>>         \
>>>> +     }
>>        \
>>>> +     static ssize_t _attrname##_current_value_show(
>>         \
>>>> +             struct kobject *kobj, struct kobj_attribute *kattr, cha=
r
>> *buf) \
>>>> +     {
>>        \
>>>> +             return attr_current_value_show(kobj, kattr, buf,
>> &_attrname);  \
>>>> +     }
>>        \
>>>> +     static struct kobj_attribute attr_##_attrname##_current_value =
=3D
>>        \
>>>> +             __LWMI_ATTR_RW(_attrname, current_value)
>>>> +
>>>> +/* Attribute property read only */
>>>> +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)
>>            \
>>>> +     static ssize_t _attrname##_##_prop##_show(
>>         \
>>>> +             struct kobject *kobj, struct kobj_attribute *kattr, cha=
r
>> *buf) \
>>>> +     {
>>        \
>>>> +             return attr_capdata01_show(kobj, kattr, buf,
>> &_attrname,       \
>>>> +                                        _prop_type);
>>        \
>>>> +     }
>>        \
>>>> +     static struct kobj_attribute attr_##_attrname##_##_prop =3D
>>        \
>>>> +             __LWMI_ATTR_RO(_attrname, _prop)
>>>> +
>>>> +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)
>>      \
>>>> +     __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);
>>    \
>>>> +     __LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);
>>   \
>>>> +     __LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n",
>> _dispname); \
>>>> +     __LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);
>>   \
>>>> +     __LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);
>>   \
>>>> +     __LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);
>>   \
>>>> +     static struct kobj_attribute attr_##_attrname##_type =3D
>>    \
>>>> +             __LWMI_ATTR_RO_AS(type, int_type_show);
>>   \
>>>> +     static struct attribute *_attrname##_attrs[] =3D {
>>    \
>>>> +             &attr_##_attrname##_current_value.attr,
>>   \
>>>> +             &attr_##_attrname##_default_value.attr,
>>   \
>>>> +             &attr_##_attrname##_display_name.attr,
>>    \
>>>> +             &attr_##_attrname##_max_value.attr,
>>   \
>>>> +             &attr_##_attrname##_min_value.attr,
>>   \
>>>> +             &attr_##_attrname##_scalar_increment.attr,
>>    \
>>>> +             &attr_##_attrname##_type.attr,
>>    \
>>>> +             NULL,
>>   \
>>>> +     };
>>    \
>>>> +     static const struct attribute_group _attrname##_attr_group =3D =
{
>>    \
>>>> +             .name =3D _fsname, .attrs =3D _attrname##_attrs
>>   \
>>>> +     }
>>>> +
>>>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
>>>> +                           "Set the CPU sustained power limit");
>>>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
>>>> +                           "Set the CPU slow package power tracking
>> limit");
>>>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
>>>> +                           "Set the CPU fast package power tracking
>> limit");
>>>> +
>>>> +static struct capdata01_attr_group cd01_attr_groups[] =3D {
>>>> +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
>>>> +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
>>>> +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
>>>> +     {},
>>>> +};
>>>> +
>>>> +/**
>>>> + * lwmi_om_fw_attr_add() - Register all firmware_attributes_class
>> members
>>>> + * @priv: The Other Mode driver data.
>>>> + *
>>>> + * Return: Either 0, or an error.
>>>> + */
>>>> +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
>>>> +{
>>>> +     unsigned int i;
>>>> +     int err;
>>>> +
>>>> +     priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
>>>> +     if (priv->ida_id < 0)
>>>> +             return priv->ida_id;
>>>> +
>>>> +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class,
>> NULL,
>>>> +                                       MKDEV(0, 0), NULL, "%s-%u",
>>>> +                                       LWMI_OM_FW_ATTR_BASE_PATH,
>>>> +                                       priv->ida_id);
>>>> +     if (IS_ERR(priv->fw_attr_dev)) {
>>> Add include for IS_ERR().
>>>
>>>> +             err =3D PTR_ERR(priv->fw_attr_dev);
>>>> +             goto err_free_ida;
>>>> +     }
>>>> +
>>>> +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
>> &priv->fw_attr_dev->kobj);
>>>> +     if (!priv->fw_attr_kset) {
>>>> +             err =3D -ENOMEM;
>>>> +             goto err_destroy_classdev;
>>>> +     }
>>>> +
>>>> +     for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
>>> Add include for ARRAY_SIZE().
>>>
>>>> +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>> cd01_attr_groups[i].attr_group);
>>>> +             if (err)
>>>> +                     goto err_remove_groups;
>>>> +
>>>> +             cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->=
dev;
>>>> +     }
>>>> +     return 0;
>>>> +
>>>> +err_remove_groups:
>>>> +     while (i--)
>>>> +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> cd01_attr_groups[i].attr_group);
>>>> +
>>>> +     kset_unregister(priv->fw_attr_kset);
>>>> +
>>>> +err_destroy_classdev:
>>>> +     device_unregister(priv->fw_attr_dev);
>>>> +
>>>> +err_free_ida:
>>>> +     ida_free(&lwmi_om_ida, priv->ida_id);
>>>> +     return err;
>>>> +}
>>>> +
>>>> +/**
>>>> + * lwmi_om_fw_attr_remove() - Unregister all capability data
>> attribute groups
>>>> + * @priv: the lenovo-wmi-other driver data.
>>>> + */
>>>> +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
>>>> +{
>>>> +     for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1=
;
>> i++)
>>>> +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
>> cd01_attr_groups[i].attr_group);
>>>> +
>>>> +     kset_unregister(priv->fw_attr_kset);
>>>> +     device_unregister(priv->fw_attr_dev);
>>>> +}
>>>> +
>>>> +/**
>>>> + * lwmi_om_master_bind() - Bind all components of the other mode
>> driver
>>>> + * @dev: The lenovo-wmi-other driver basic device.
>>>> + *
>>>> + * Call component_bind_all to bind the lenovo-wmi-capdata01 driver t=
o
>> the
>>>> + * lenovo-wmi-other master driver. On success, assign the capability
>> data 01
>>>> + * list pointer to the driver data struct for later access. This
>> pointer
>>>> + * is only valid while the capdata01 interface exists. Finally,
>> register all
>>>> + * firmware attribute groups.
>>>> + *
>>>> + * Return: 0 on success, or an error.
>>>> + */
>>>> +static int lwmi_om_master_bind(struct device *dev)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
>>>> +     struct cd01_list *tmp_list;
>>>> +     int ret;
>>>> +
>>>> +     ret =3D component_bind_all(dev, &tmp_list);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     priv->cd01_list =3D tmp_list;
>>>> +
>>>> +     if (!priv->cd01_list)
>>>> +             return -ENODEV;
>>>> +
>>>> +     return lwmi_om_fw_attr_add(priv);
>>>> +}
>>>> +
>>>> +/**
>>>> + * lwmi_om_master_unbind() - Unbind all components of the other mode
>> driver
>>>> + * @dev: The lenovo-wmi-other driver basic device
>>>> + *
>>>> + * Unregister all capability data attribute groups. Then call
>>>> + * component_unbind_all to unbind the lenovo-wmi-capdata01 driver
>> from the
>>>> + * lenovo-wmi-other master driver. Finally, free the IDA for this
>> device.
>>>> + */
>>>> +static void lwmi_om_master_unbind(struct device *dev)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
>>>> +
>>>> +     lwmi_om_fw_attr_remove(priv);
>>>> +     component_unbind_all(dev, NULL);
>>>> +}
>>>> +
>>>> +static const struct component_master_ops lwmi_om_master_ops =3D {
>>>> +     .bind =3D lwmi_om_master_bind,
>>>> +     .unbind =3D lwmi_om_master_unbind,
>>>> +};
>>>> +
>>>> +static int lwmi_other_probe(struct wmi_device *wdev, const void
>> *context)
>>>> +{
>>>> +     struct component_match *master_match =3D NULL;
>>>> +     struct lwmi_om_priv *priv;
>>>> +
>>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>>> +     if (!priv)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     priv->wdev =3D wdev;
>>>> +     dev_set_drvdata(&wdev->dev, priv);
>>>> +
>>>> +     component_match_add(&wdev->dev, &master_match, lwmi_cd01_match,
>> NULL);
>>>> +     if (IS_ERR(master_match))
>>>> +             return PTR_ERR(master_match);
>>>> +
>>>> +     return component_master_add_with_match(&wdev->dev,
>> &lwmi_om_master_ops,
>>>> +                                            master_match);
>>>> +}
>>>> +
>>>> +static void lwmi_other_remove(struct wmi_device *wdev)
>>>> +{
>>>> +     struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
>>>> +
>>>> +     component_master_del(&wdev->dev, &lwmi_om_master_ops);
>>>> +     ida_free(&lwmi_om_ida, priv->ida_id);
>>>> +}
>>>> +
>>>> +static const struct wmi_device_id lwmi_other_id_table[] =3D {
>>>> +     { LENOVO_OTHER_MODE_GUID, NULL },
>>>> +     {}
>>>> +};
>>>> +
>>>> +static struct wmi_driver lwmi_other_driver =3D {
>>>> +     .driver =3D {
>>>> +             .name =3D "lenovo_wmi_other",
>>>> +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>>> +     },
>>>> +     .id_table =3D lwmi_other_id_table,
>>>> +     .probe =3D lwmi_other_probe,
>>>> +     .remove =3D lwmi_other_remove,
>>>> +     .no_singleton =3D true,
>>>> +};
>>>> +
>>>> +module_wmi_driver(lwmi_other_driver);
>>>> +
>>>> +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
>>>> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>>>> +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
>>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>>> +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/platform/x86/lenovo-wmi-other.h
>> b/drivers/platform/x86/lenovo-wmi-other.h
>>>> new file mode 100644
>>>> index 000000000000..49bc3521e184
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/lenovo-wmi-other.h
>>>> @@ -0,0 +1,16 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +
>>>> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
>>>> +
>>>> +#ifndef _LENOVO_WMI_OTHER_H_
>>>> +#define _LENOVO_WMI_OTHER_H_
>>>> +
>>>> +struct device;
>>>> +struct notifier_block;
>>>> +
>>>> +int lwmi_om_register_notifier(struct notifier_block *nb);
>>>> +int lwmi_om_unregister_notifier(struct notifier_block *nb);
>>>> +int devm_lwmi_om_register_notifier(struct device *dev,
>>>> +                                struct notifier_block *nb);
>>>> +
>>>> +#endif /* !_LENOVO_WMI_OTHER_H_ */
>>> Overall, the series still has lots of nits still to address (please lo=
ok
>>> for similar cases I've marked as I surely didn't mark each instance).
>>> But logicwise, the code is easy to read, feels understandable, and I
>>> couldn't find any big issues. Good work so far! :-)
>>>
>>> --
>>>   i.
>>>
>> Thanks Ilpo, I'll take a look at these in the coming days-.
>>
>> There is something that was just brought up to me from Xino at Lenovo
>> after some internal testing that I wasn't aware of, and it needs to be
>> addressed. I want to discuss a way ahead before I add it to v6.
>>
>> Essentially, there was an assumption that the capability data is
>> static once the device initializes, which is why back in v1 it was
>> discussed to cache the data. This assumption was wrong; the capability
>> data for max value changes depending on if AC or DC is being used to
>> power the device, with the DC values being lower. The BIOS will
>> automatically throttle any values that exceed the DC limits upon a
>> change in status, so we don't need to account for this event in other
>> mode directly, but we do need to re-cache the data blocks when there
>> is an ACPI_AC_NOTIFY_STATUS event. This will allow us to both report
>> accurate information, and prevent setting values that exceed the power
>> draw limit of the battery after the event, which could be possible.
>>
>> My plan is (in Capability data driver):
>>
>> - Use the _setup function in _probe to call two new functions that are
>> essentially the current _setup broken apart. The first (_allocate)
>> will only run during _setup and will get the wmi block device count
>> and allocate the list struct, and the second (_cache)  will loop
>> through all the data blocks and copy the data to the list struct.
>> - Subscribe to the register_acpi_notifier with a new notifier block in
>> _probe, and in a new notify_call function run the _cache function upon
>> ACPI_AC_NOTIFY_STATUS events.
>>
>> The main problem I see is that we will need to guard the access to the
>> cd01_list now, as it could have async read/write. Since we are passing
>> a pointer to that data to another driver I see two possible solutions
>> to that:
>> - Share a mutex between the two drivers.
>> - Do all lookups of the capability data in the capability data driver
>> and pass pointers back to the other mode driver.
>>
>> I personally prefer option 2. I can pass the existing list pointer to
>> an exported function from the capability data driver and use its
>> global mutex to iterate through it. I could also change the pointer
>> passed in _bind to a device pointer, then pass it back in the exported
>> function and use dev_get_data to access the private drvdata in the
>> capability data driver, but Armin was against this previously so I'm
>> unsure about it. I think the example i915 driver does store pointers
>> to devices so I'm unsure why this wouldn't be preferable now, as it
>> would prevent access to the data outside a guard in all contexts.
>>
>> As far as I'm aware, the only way to share a mutex would be to point
>> to the private data between the two drivers, but I fully admit I could
>> be wrong about that. I'm waiting for comments before proceeding
>> further.
>>
>> Thank you,
>> - Derek
>>
> Ilpo/Armin,
>
> Any thoughts on this? I've successfully tested passing the device pointe=
r for capability data to other mode and retrieving the accurate data when =
needed; re-caching on ACPI AC change events. It seems to work well this wa=
y and I'm able to contain the mutex in a single driver this way. I'd like =
a bit more than tacit approval of the concept before submitting the next v=
ersion to avoid more unnecessary iterations if possible.
>
> Thanks,
> Derek

Using a device pointer is IMHO a bit too much. You could only supply an in=
complete definition of struct cd01_list inside the public header and inste=
ad force
consumers to pass the pointer to struct cd01_list into a special function =
supplied by your driver which then ensures that the necessary (i.e per-ins=
tance) mutex
gets taken when retrieving data.

This is basically what you proposed above just without the device pointer.

Thanks,
Armin Wolf

