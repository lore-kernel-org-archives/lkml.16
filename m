Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400CC2C8;
	Thu, 27 Mar 2025 03:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743046147; cv=none; b=XreoOhy574WCAkeNda/vQjkEkWTAAucl8NRvJJCacrqT2byZV8y4gY6x2Ahf3XruX+uwGMd8/6ZfqN2qr+UPW4vJhXL57LUqm29q753zKE2U8o6T11mB1WXt/G9W3Xg5ryVKxS6edOAq//PNm84JChL1EpKTvega4qgrnnkbXyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743046147; c=relaxed/simple;
	bh=xj1gYUBy47bsNZdW+GmOwAGYXp8tvtxlrOX/RusomGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXXwtcwoZaYTB2EStu8JDqctEhp/Z0KXs3lAoZk7azTLugWy1kLYOCO5MTYajzwFbF4Thp6LPHFm5D60xIUj29f7P6MZnFbBQ++M9sgJvkA2DOqUJ8k5ykm3Q8ZIGw2777BXB5AL+7Koxt/TB5MTCf+EaR09NqEx4QrFTU7DzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k9lm+swc; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k9lm+swc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743046122; x=1743650922; i=w_armin@gmx.de;
	bh=ljUbxWEhrG6eVPFJtTak/JzNwpYbQqbNB097sc2Q79A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k9lm+swczoKXBm5SjZaTIlqDvejJsFwEyoPdBSiS5BXNUEi9VGPRuByYaeBEkNP1
	 R9W9RHFoKMtP5BE0c0DwqCODhQWQlMBiAWuDCkHjgQSVIwTwfyMZjPLzfI+BJQavO
	 68dfwqP94PV1+j1MukeTLkieQiNlGr0A3QFpMQeuhc/Yccm1z99gy7mMIWoUSLOe2
	 GHSXNjpDc7YA78i6Z/yXS2U/dAYX9JL/G8VINfGPCL7IYx536jt+GzIxRwd+TKroL
	 sYVBTVp6Yx+tmqohMcplAtQnwdKcG6XQI1OyqUTBnZqpg64kFS7kTwyubnDxv8+0D
	 ZuHka7zsn2qIGuUiAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1tBKWm3CJV-00qqQf; Thu, 27
 Mar 2025 04:28:42 +0100
Message-ID: <e5214959-bfc0-4e97-bd56-d0a609f5a15e@gmx.de>
Date: Thu, 27 Mar 2025 04:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6 RESEND] platform/x86: Add Lenovo Other Mode WMI
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
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-6-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250317144326.5850-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:90fc7SbkpxeQMagwL8oA42kEraE92NkaVbH48Pc7K+wkHY87abd
 W5lGUVQsuv+7SV0u8VzgtuRH5G41gixjPTzWi5CHe5b+oUu748R5x3PhKWuCVECzJN1SeZl
 ZRvm2POOGkUrgsKo9VBXx/nkE6kun8F1brjN/usDNFuuoY0KC1RX0ZLBXOwjkKQLWkU51Zi
 mlpNPK6BCzz6U9UdxmUjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CwmbwSx2LA0=;zOX+mmxao6EEcZoth0rjgF8zQhm
 1rs0fZuSZTVVu/5ER5buFtRGmW/6Zi2kzp6CuSwF1Bj3/isyEmN9jxDCOo9LbynQL2d9o35mk
 jeHdVVbanq5Ver03Kp1QV8wZB1CPDx/6ptjLFnSFLgmnmqtRkBvDYLVzRQkuchL9ZmVahtjBy
 ok2ZyAfJJbRdoaGOOw7xCKxgAjqsnR9DrkgTKMtTbhwUXNSyBp3guBltbAkLREBprKnRpPoOk
 Wm7Ckvgij+9blr6kZ1XMcWqDa2L+eMkzzjdO3Cjbem9V5VswxgWGoSF2N2ex4p+0sk3ONyhMF
 jZOZHKWTcl9sM/T9kFc7RsHgsXQjkbrB2y/hv4lAxfbV3GC6H5FlqG9frorZQojvGRdSm8uMh
 SdsXJvlS2QPh0beSAL7+LON1drbuMWcx8fDG388UGFwELAKWrxUahDEhyArzSzG9O9AuuWcA7
 K7M+YSyNcFnr5T9iZWtO6KOPHUlJ2OT+eGskm+FDPxzK/lc5EKYS0prkPme9x8C/an6kelqW7
 5Eqlfq9MaymYn4jHNN8fGMgU2g3hGv7mg22v0mK9M/wgApR2640GKFOz3nS2enOwrkuf2bff8
 vl5MpPchiSA0EMfvqqXxue8J8udCKhx1H8idilXlGIsGjQOlZ0zdkrDfLhGICTQ7gYzD3gFsn
 YwQDdKcEl3DgVH7Qrz6fNjFxFRMDYWUDusJ4Rbt75UL/f965eHuDqgDcIcAXwvDuYgm7XwfKO
 L3q+LmXD/oFi5kVnRrQ9RsxfdzTJDwyMy8nmPywRfs9PHw/5ET8vVJEs4+1rgcy1qRQVepM0p
 Tz1xvRQI7jNRjKiaP/BSpU5kZ87cPgTQVmMuwjOIaGZ3alP9rNpTP/BhWxVXetlFmgXuWpRq7
 bUcwtgKrCbX+UQrm7ioTuX1TVeSEklnMHW0MfAqfOHsW3maQiUfQ9sbvW+Hg1eZsBhaf8Kp1W
 pkrhAzc67SeiecNsGjQMocblX+5V/EXw0XuhiEBeWyb9tgS9bpCHG0BB9IgkkFMrdQnO4AZ7W
 mw1fDCAtZFGCJ/Zy3PUWMjehw9x3kFBBRt1T44aIIEZzuXzsM3aBeUNOlc9zt2jbTKnaANeDe
 MLZtCBDlB7fsWTpB2mWNWS1gU1Gja8R2CjhDpm1P7R3HI/bx6XyEVQjsRaS5aOiXwxw/2s3Zi
 4FIJ+y7TkJSvZuhbwzcD+ds9oPWzjXBix2AqeNuvVPxoAwfiE0Ep5yHP2mLmggqsxMJZoqfb7
 yJoejthJ3nLHmmd48vK2NC1r/3R3q0/jipOQEF8qF3T2lC9I6H+uAhchvm3I7WSBeWXWyaY4p
 6CnlxzBkLSQxGPHnK+lvojTUkGNhTSbr0Vb43S3qOABchYFl9ckWQYJRowp+Bdeh5qrHJAbJt
 opUaA13KchfaJhDmRN92ss182wGtc0c6i6xNMhzoSMqLOXt0UUnl1FAVezuh422oNQtScKCDK
 jHVk4OzKVbnfu1kSqV8zw1V7kndo=

Am 17.03.25 um 15:43 schrieb Derek J. Clark:

> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> interface that comes on some Lenovo "Gaming Series" hardware. Provides a
> firmware-attributes class which enables the use of tunable knobs for SPL=
,
> SPPT, and FPPT.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
> - Treat Other Mode as a notifier chain head, use the notifier chain to
>    get the current mode from Gamezone.
> - Add header file for Other Mode specific structs and finctions.
> - Use component master bind to cache the capdata01 array locally.
> - Drop all reference to external driver private data structs.
> - Various fixes from review.
> v3:
> - Add notifier block and store result for getting the Gamezone interface
>    profile changes.
> - Add driver as master component of capdata01 driver.
> - Use FIELD_PREP where appropriate.
> - Move macros and associated functions out of lemovo-wmi.h that are only
>    used by this driver.
> v2:
> - Use devm_kmalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> - Use list to get the lenovo_wmi_om_priv instance in some macro
>    called functions as the data provided by the macros that use it
>    doesn't pass a member of the struct for use in container_of.
> - Do not rely on GameZone interface to grab the current fan mode.
> ---
>   MAINTAINERS                             |   2 +
>   drivers/platform/x86/Kconfig            |  15 +
>   drivers/platform/x86/Makefile           |   1 +
>   drivers/platform/x86/lenovo-wmi-other.c | 626 ++++++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h |  19 +
>   5 files changed, 663 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56ead241a053..87daee6075ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13170,6 +13170,8 @@ F:	drivers/platform/x86/lenovo-wmi-events.c
>   F:	drivers/platform/x86/lenovo-wmi-events.h
>   F:	drivers/platform/x86/lenovo-wmi-helpers.c
>   F:	drivers/platform/x86/lenovo-wmi-helpers.h
> +F:	drivers/platform/x86/lenovo-wmi-other.c
> +F:	drivers/platform/x86/lenovo-wmi-other.h
>
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 64663667f0cb..fc47604e37f7 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -471,6 +471,21 @@ config LENOVO_WMI_DATA01
>   	tristate
>   	depends on ACPI_WMI
>
> +config LENOVO_WMI_TUNING
> +	tristate "Lenovo Other Mode WMI Driver"
> +	depends on ACPI_WMI
> +	select FW_ATTR_CLASS
> +	select LENOVO_WMI_DATA01
> +	select LENOVO_WMI_EVENTS
> +	select LENOVO_WMI_HELPERS
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would li=
ke to use the
> +	  firmware_attributes API to control various tunable settings typicall=
y exposed by
> +	  Lenovo software in Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-other.
> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 7a35c77221b7..c6ce3c8594b1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -72,6 +72,7 @@ obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera=
.o
>   obj-$(CONFIG_LENOVO_WMI_DATA01)	+=3D lenovo-wmi-capdata01.o
>   obj-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D lenovo-wmi-events.o
>   obj-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D lenovo-wmi-helpers.o
> +obj-$(CONFIG_LENOVO_WMI_TUNING)	+=3D lenovo-wmi-other.o
>
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/=
x86/lenovo-wmi-other.c
> new file mode 100644
> index 000000000000..b517e45338e0
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.c
> @@ -0,0 +1,626 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Other Mode WMI interface driver. This driver uses the fw_attr=
ibutes
> + * class to expose the various WMI functions provided by the "Other Mod=
e" WMI
> + * interface. This enables CPU and GPU power limit as well as various o=
ther
> + * attributes for devices that fall under the "Gaming Series" of Lenovo=
 laptop
> + * devices. Each attribute exposed by the "Other Mode"" interface has a
> + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the drive=
r to
> + * probe details about the attribute such as set/get support, step, min=
, max,
> + * and default value. Each attibute has multiple pages, one for each of=
 the
> + * fan profiles managed by the Gamezone interface.
> + *
> + * These attributes typically don't fit anywhere else in the sysfs and =
are set
> + * in Windows using one of Lenovo's multiple user applications.
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/gfp_types.h>
> +#include <linux/idr.h>
> +#include <linux/kobject.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>

Hi,

please also include linux/acpi.h, linux/export.h and linux/module.h.

> +
> +#include "lenovo-wmi-capdata01.h"
> +#include "lenovo-wmi-events.h"
> +#include "lenovo-wmi-gamezone.h"
> +#include "lenovo-wmi-helpers.h"
> +#include "lenovo-wmi-other.h"
> +#include "firmware_attributes_class.h"
> +
> +/* Interface GUIDs */
> +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> +
> +/* Device IDs */
> +#define WMI_DEVICE_ID_CPU 0x01
> +
> +/* WMI_DEVICE_ID_CPU feature IDs */
> +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> +
> +/* Type IDs*/
> +#define WMI_TYPE_ID_NONE 0x00
> +
> +/* Method IDs */
> +#define WMI_FEATURE_VALUE_GET 17 /* Other Mode Getter */
> +#define WMI_FEATURE_VALUE_SET 18 /* Other Mode Setter */
> +
> +/* Attribute ID bitmasks */
> +#define ATTR_DEV_ID_MASK GENMASK(31, 24)
> +#define ATTR_FEAT_ID_MASK GENMASK(23, 16)
> +#define ATTR_MODE_ID_MASK GENMASK(15, 8)
> +#define ATTR_TYPE_ID_MASK GENMASK(7, 0)
> +
> +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> +
> +enum attribute_property {
> +	DEFAULT_VAL,
> +	MAX_VAL,
> +	MIN_VAL,
> +	STEP_VAL,
> +	SUPPORTED,
> +};
> +
> +struct lwmi_om_priv {
> +	struct blocking_notifier_head nhead;

Is nhead actually used somewhere?

> +	struct component_master_ops *ops;
> +	struct cd01_list cd01_list;
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +	struct notifier_block nb;
> +	struct wmi_device *wdev;
> +	struct ida ida;

Is this idea actually used somewhere? If yes then please turn it into a gl=
obal variable.

> +	int ida_id;
> +};
> +
> +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> +struct tunable_attr_01 {
> +	u32 type_id;
> +	u32 device_id;
> +	u32 feature_id;
> +	u32 store_value;
> +	struct device *dev;
> +	struct capdata01 *capdata;
> +};
> +
> +/* Tunable Attributes */
> +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_ID_C=
PU,
> +				       .feature_id =3D WMI_FEATURE_ID_CPU_SPL,
> +				       .type_id =3D WMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_ID_=
CPU,
> +					.feature_id =3D WMI_FEATURE_ID_CPU_SPPT,
> +					.type_id =3D WMI_TYPE_ID_NONE };
> +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_ID_=
CPU,
> +					.feature_id =3D WMI_FEATURE_ID_CPU_FPPT,
> +					.type_id =3D WMI_TYPE_ID_NONE };
> +
> +struct capdata01_attr_group {
> +	const struct attribute_group *attr_group;
> +	struct tunable_attr_01 *tunable_attr;
> +};
> +
> +#define FW_ATTR_FOLDER "lenovo-wmi-other"

Please use a IDA to give each device a unique name like "lenovo-wmi-otherX=
". Otherwise
the driver cannot be instantiated multiple times.

> +
> +/* Notifier Methods */
> +int lwmi_om_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
> +
> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&om_chain_head, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
> +
> +static void devm_lwmi_om_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb =3D data;
> +
> +	lwmi_om_unregister_notifier(nb);
> +}
> +
> +int devm_lwmi_om_register_notifier(struct device *dev,
> +				   struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D lwmi_om_register_notifier(nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_notifier,
> +					nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER"=
);
> +
> +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> +{
> +	int ret;
> +
> +	ret =3D blocking_notifier_call_chain(&om_chain_head, THERMAL_MODE_EVEN=
T,
> +					   mode);
> +
> +	if (ret !=3D NOTIFY_OK)
> +		return -EINVAL;

Better remove the NOTIFY_STOP_MASK so that clients can return NOTIFY_STOP:

         (ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK

> +
> +	if (*mode < SMARTFAN_MODE_QUIET || *mode > SMARTFAN_MODE_CUSTOM)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* Attribute Methods */
> +/*

/* -> /**

The same applies to the other kernel doc comments as well.

> + * int_type_show() - Emit the data type for an integer attribute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + *
> + * Returns: Number of characters written to buf.
> + */
> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribut=
e *kattr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +/*
> + * attr_capdata01_get - Get the data of the specified attribute
> + * from lwmi_om->cd01.
> + * @tunable_attr: The attribute to be populated.
> + *
> + * Returns: Either a pointer to capability data, or NULL.
> + */
> +static struct capdata01 *
> +attr_capdata01_get_data(struct lwmi_om_priv *priv,
> +			struct tunable_attr_01 *tunable_attr,
> +			enum thermal_mode mode)
> +{
> +	u32 attribute_id =3D
> +		FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> +		FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> +		FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	int idx;
> +
> +	for (idx =3D 0; idx < priv->cd01_list.count; idx++) {
> +		if (!priv->cd01_list.data[idx])
> +			continue;
> +
> +		if (priv->cd01_list.data[idx]->id !=3D attribute_id)
> +			continue;
> +		return priv->cd01_list.data[idx];
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * attr_capdata01_show() - Get the value of the specified attribute pro=
perty
> + * from LENOVO_CAPABILITY_DATA_01.
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + * @tunable_attr: The attribute to be read.
> + * @prop: The property of this attribute to be read.
> + *
> + * This function is intended to be generic so it can be called from any=
 "_show"
> + * attribute which works only with integers.
> + *
> + * If the WMI is success, then the sysfs attribute is notified.
> + *
> + * Returns: Either number of characters written to buf, or an error.
> + */
> +static ssize_t attr_capdata01_show(struct kobject *kobj,
> +				   struct kobj_attribute *kattr, char *buf,
> +				   struct tunable_attr_01 *tunable_attr,
> +				   enum attribute_property prop)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct capdata01 *capdata;
> +	int value;
> +
> +	if (!priv)
> +		return -ENODEV;

Is this check really necessary? If not then please remove it.

> +
> +	capdata =3D attr_capdata01_get_data(priv, tunable_attr,
> +					  SMARTFAN_MODE_CUSTOM);
> +
> +	if (!capdata)
> +		return -ENODEV;
> +
> +	switch (prop) {
> +	case DEFAULT_VAL:
> +		value =3D capdata->default_value;
> +		break;
> +	case MAX_VAL:
> +		value =3D capdata->max_value;
> +		break;
> +	case MIN_VAL:
> +		value =3D capdata->min_value;
> +		break;
> +	case STEP_VAL:
> +		value =3D capdata->step;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return sysfs_emit(buf, "%d\n", value);
> +}
> +
> +/* Simple attribute creation */
> +
> +/*
> + * att_current_value_store() - Set the current value of the given attri=
bute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to read from, this is parsed to `int` type.
> + * @count: Required by sysfs attribute macros, pass in from the callee =
attr.
> + * @tunable_attr: The attribute to be stored.
> + *
> + * This function is intended to be generic so it can be called from any
> + * attribute's "current_value_store" which works only with integers. Th=
e
> + * integer to be sent to the WMI method is range checked and an error r=
eturned
> + * if out of range.
> + *
> + * If the value is valid and WMI is success, then the sysfs attribute i=
s
> + * notified.
> + *
> + * Returns: Either count, or an error.
> + */
> +static ssize_t attr_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *kattr,
> +					const char *buf, size_t count,
> +					struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	struct capdata01 *capdata;
> +	enum thermal_mode mode;
> +	u32 attribute_id;
> +	u32 value;
> +	int err;
> +
> +	if (!priv)
> +		return -ENODEV;

Same as above.

> +
> +	err =3D lwmi_om_notifier_call(&mode);
> +	if (err)
> +		return err;
> +
> +	if (mode !=3D SMARTFAN_MODE_CUSTOM)
> +		return -EINVAL;

Better return -EBUSY here to signal userspace that the underlying device c=
urrently
cannot process this request.

> +
> +	capdata =3D attr_capdata01_get_data(priv, tunable_attr, mode);
> +
> +	if (!capdata)
> +		return -ENODEV;
> +
> +	attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id)=
 |
> +		       FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		       FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> +		       FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	err =3D kstrtouint(buf, 10, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < capdata->min_value || value > capdata->max_value)
> +		return -EINVAL;
> +
> +	args.arg0 =3D attribute_id;
> +	args.arg1 =3D value;
> +
> +	err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0, WMI_FEATURE_VALUE_SE=
T,
> +				       (unsigned char *)&args, sizeof(args),
> +				       NULL);
> +
> +	if (err)
> +		return err;
> +
> +	tunable_attr->store_value =3D value;

Is store_value actually used somewhere? If no then please remove.

> +	return count;
> +};
> +
> +/*
> + * attr_current_value_show() - Get the current value of the given attri=
bute
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + * @tunable_attr: The attribute to be read.
> + *
> + * This function is intended to be generic so it can be called from any=
 "_show"
> + * attribute which works only with integers.
> + *
> + * If the WMI is success, then the sysfs attribute is notified.
> + *
> + * Returns: Either number of characters written to buf, or an error.
> + */
> +static ssize_t attr_current_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *kattr, char *buf,
> +				       struct tunable_attr_01 *tunable_attr)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	enum thermal_mode mode;
> +	u32 attribute_id;
> +	int retval;
> +	int err;
> +
> +	if (!priv)
> +		return -ENODEV;

Same as above.

> +
> +	err =3D lwmi_om_notifier_call(&mode);
> +	if (err)
> +		return err;
> +
> +	attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id)=
 |
> +		       FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> +		       FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> +		       FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +
> +	args.arg0 =3D attribute_id;
> +
> +	err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0, WMI_FEATURE_VALUE_GE=
T,
> +				       (unsigned char *)&args, sizeof(args),
> +				       &retval);
> +
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%d\n", retval);
> +}
> +
> +/* Attribute macros */
> +#define __LL_ATTR_RO(_func, _name)                                    \
> +	{                                                             \
> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +		.show =3D _func##_##_name##_show,                       \
> +	}
> +
> +#define __LL_ATTR_RO_AS(_name, _show)                                 \
> +	{                                                             \
> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +		.show =3D _show,                                        \
> +	}
> +
> +#define __LL_ATTR_RW(_func, _name) \
> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
> +
> +/* Shows a formatted static variable */
> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                  =
        \
> +	static ssize_t _attrname##_##_prop##_show(                            =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return sysfs_emit(buf, _fmt, _val);                            \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D           =
   \
> +		__LL_ATTR_RO(_attrname, _prop)
> +
> +/* Attribute current value read/write */
> +#define __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                    =
        \
> +	static ssize_t _attrname##_current_value_store(                       =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr,            \
> +		const char *buf, size_t count)                                 \
> +	{                                                                     =
 \
> +		return attr_current_value_store(kobj, kattr, buf, count,       \
> +						&_attrname);                   \
> +	}                                                                     =
 \
> +	static ssize_t _attrname##_current_value_show(                        =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_current_value =3D     =
   \
> +		__LL_ATTR_RW(_attrname, current_value)
> +
> +/* Attribute property read only */
> +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)            =
        \
> +	static ssize_t _attrname##_##_prop##_show(                            =
 \
> +		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> +	{                                                                     =
 \
> +		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
> +					   _prop_type);                        \
> +	}                                                                     =
 \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D           =
   \
> +		__LL_ATTR_RO(_attrname, _prop)
> +
> +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)     =
\
> +	__LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                   \
> +	__LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
> +	__LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
> +	__LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
> +	__LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
> +	static struct kobj_attribute attr_##_attrname##_type =3D         \
> +		__LL_ATTR_RO_AS(type, int_type_show);                  \
> +	static struct attribute *_attrname##_attrs[] =3D {               \
> +		&attr_##_attrname##_current_value.attr,                \
> +		&attr_##_attrname##_default_value.attr,                \
> +		&attr_##_attrname##_display_name.attr,                 \
> +		&attr_##_attrname##_max_value.attr,                    \
> +		&attr_##_attrname##_min_value.attr,                    \
> +		&attr_##_attrname##_scalar_increment.attr,             \
> +		&attr_##_attrname##_type.attr,                         \
> +		NULL,                                                  \
> +	};                                                             \
> +	static const struct attribute_group _attrname##_attr_group =3D { \
> +		.name =3D _fsname, .attrs =3D _attrname##_attrs            \
> +	}
> +
> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> +			    "Set the CPU sustained power limit");
> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> +			    "Set the CPU slow package power tracking limit");
> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> +			    "Set the CPU fast package power tracking limit");
> +
> +static struct capdata01_attr_group capdata01_attr_groups[] =3D {
> +	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> +	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> +	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> +	{},
> +};
> +
> +/*
> + * lwmi_om_fw_attr_add() - Registers all capdata01_attr_groups[] attrib=
utes as
> + * firmware_attributes_class members.
> + * @priv: The Other Mode driver data.
> + *
> + * Returns: Either 0, or an error.
> + */
> +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> +{
> +	int err, i;
> +
> +	ida_init(&priv->ida);
> +	priv->ida_id =3D ida_alloc(&priv->ida, GFP_KERNEL);
> +	if (priv->ida_id < 0)
> +		return priv->ida_id;
> +
> +	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
> +					  MKDEV(0, 0), NULL, "%s",
> +					  FW_ATTR_FOLDER);
> +	if (IS_ERR(priv->fw_attr_dev)) {
> +		err =3D PTR_ERR(priv->fw_attr_dev);
> +		return err;
> +	}
> +
> +	priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> +						 &priv->fw_attr_dev->kobj);
> +	if (!priv->fw_attr_kset) {
> +		err =3D -ENOMEM;
> +		goto err_destroy_classdev;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
> +		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> +					 capdata01_attr_groups[i].attr_group);
> +		if (err) {
> +			pr_debug("Failed to create sysfs-group for %s: %d\n",
> +				 capdata01_attr_groups[i].attr_group->name,
> +				 err);
> +			goto err_remove_groups;
> +		}
> +		capdata01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;

Since you already know which attributes are supported, maybe it would make=
 sense to only
create attributes which are supported on a given machine?

> +	}
> +	return 0;
> +
> +err_remove_groups:
> +	ida_free(&priv->ida, priv->ida_id);

The IDA should be freed even when the class device failed to register. But=
 such an IDA
should be a global variable anyway.

> +	while (i-- >=3D 0) {
> +		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> +				   capdata01_attr_groups[i].attr_group);
> +	}
> +	kset_unregister(priv->fw_attr_kset);
> +
> +err_destroy_classdev:
> +	device_unregister(priv->fw_attr_dev);
> +	return err;
> +}
> +
> +/*
> + * lwmi_om_fw_attr_remove() - Unregisters all capdata01_attr_groups[] a=
ttributes as
> + * firmware_attributes_class members.
> + * @priv: The Other Mode driver data.
> + *
> + */
> +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> +{
> +	int size =3D ARRAY_SIZE(capdata01_attr_groups);
> +
> +	while (--size >=3D 0) {

Please use a for-loop here.

Thanks,
Armin Wolf

> +		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> +				   capdata01_attr_groups[size].attr_group);
> +	}
> +	kset_unregister(priv->fw_attr_kset);
> +	device_unregister(priv->fw_attr_dev);
> +}
> +
> +static int lwmi_om_master_bind(struct device *dev)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D component_bind_all(dev, &priv->cd01_list);
> +	if (ret)
> +		return ret;
> +
> +	return lwmi_om_fw_attr_add(priv);
> +}
> +
> +static void lwmi_om_master_unbind(struct device *dev)
> +{
> +	component_unbind_all(dev, NULL);

Please remove the firmware attributes here too since otherwise the driver =
will crash
should another compatible component bind to this master afterwards.

> +}
> +
> +static const struct component_master_ops lwmi_om_master_ops =3D {
> +	.bind =3D lwmi_om_master_bind,
> +	.unbind =3D lwmi_om_master_unbind,
> +};
> +
> +static int lwmi_other_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	struct component_match *master_match =3D NULL;
> +	struct lwmi_om_priv *priv;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, NULL);
> +	if (IS_ERR(master_match))
> +		return PTR_ERR(master_match);
> +
> +	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops=
,
> +					       master_match);
> +}
> +
> +static void lwmi_other_remove(struct wmi_device *wdev)
> +{
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	component_master_del(&wdev->dev, &lwmi_om_master_ops);
> +	lwmi_om_fw_attr_remove(priv);
> +	ida_free(&priv->ida, priv->ida_id);
> +}
> +
> +static const struct wmi_device_id lwmi_other_id_table[] =3D {
> +	{ LENOVO_OTHER_METHOD_GUID, NULL },
> +	{}
> +};
> +
> +static struct wmi_driver lwmi_other_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo_wmi_other",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lwmi_other_id_table,
> +	.probe =3D lwmi_other_probe,
> +	.remove =3D lwmi_other_remove,
> +	.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(lwmi_other_driver);
> +
> +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi-other.h b/drivers/platform/=
x86/lenovo-wmi-other.h
> new file mode 100644
> index 000000000000..9fba35ef1137
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-other.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#ifndef _LENOVO_WMI_OTHER_H_
> +#define _LENOVO_WMI_OTHER_H_
> +
> +#include <linux/device.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +
> +int lwmi_om_register_notifier(struct notifier_block *nb);
> +int lwmi_om_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_om_register_notifier(struct device *dev,
> +				   struct notifier_block *nb);
> +
> +#endif /* !_LENOVO_WMI_H_ */
