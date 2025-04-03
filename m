Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FFBA42;
	Thu,  3 Apr 2025 01:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643303; cv=none; b=YFLbsDpxv9pCwPdIxI1XoOSB26lMwZj5Fd16+RhJZU3P+bNx/gmpeXm/t7AHt4eGStLVuZf3jlHyk2w8Q+I132gnkN8lboj2enpU+fdClwwagLsbktrbEoIO4ekH+Rrka39+NaiSb69qBraltwCPbR3qySqGiSmaPL8UahSjaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643303; c=relaxed/simple;
	bh=DgzRUgJg0RCM1mA7IBEVb9vqnduw4iXeU5mJ/+KaQF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VB24jSRjmsTrOJmVGDernIzRRQrsc+yxKSyOQmP23QUaPtLVBNe899uB0lCr6Bk8vSHhbaHSFKYLiZbr+0vRZvzo7v/0vaVFe7FF5Cu0+oCPFrEdsGN8c9ZcScxtcovYALtTu+EazuuNN0GjZm/SNtLI9bbKB7jPQmPBArIzmBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qV4Yx7hP; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qV4Yx7hP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743643295; x=1744248095; i=w_armin@gmx.de;
	bh=6JWBUr99DMY2yyitlYzB82gkD6FBT8TUumdim5XNNNU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qV4Yx7hPdND6Z17g4PjpTPPMzznO0jDhSZ0uDUyR27znNpyfTYOYr/7B4ljCnFhk
	 JJ67xFfdNqDdvFgQYMv/ibhVDaiD+kmdoA2f/eISoq9WfI7UE9sLH/HjBWQUUDPP9
	 6DOiy5YEylDxnkQCpX50dtKZEAlVaWNUJnnah5C2Ggmis7U8mCqYOnyrK4O3xV7sP
	 a2x/rzrE1DPUMkxP/g5as5pap7t0AViPfMJl/xydgw0r2jPeyftxB/tTfqrvtiYm1
	 L/Qlj/qlUSKIC3WH9pDeA6zM4xNTtTfyLBWttK46w7/QDsRkYnNNRfcNbetKW2CCF
	 N2H7Lw1jT0AYf15m/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbBk-1t8b7322z8-013P2F; Thu, 03
 Apr 2025 03:21:35 +0200
Message-ID: <d083f0ec-8af3-4365-ae8d-f4cff5511c8b@gmx.de>
Date: Thu, 3 Apr 2025 03:21:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data 01
 WMI Driver
To: Derek John Clark <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-5-derekjohn.clark@gmail.com>
 <9138d1c8-0713-e28a-3cdf-590b3f4e9449@linux.intel.com>
 <CAFqHKTmPChKu935zrHJWX1jF9mMg3kb5GFBQ=ogy66LnO6bfQA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTmPChKu935zrHJWX1jF9mMg3kb5GFBQ=ogy66LnO6bfQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ymbNiwYkfL7TMEtNomc8tU3rnuGBEWDFstvW6I63hAvXqXUW58y
 nENqiEm69PENDizZNYz57BeIfUZ582rLk4WBUJoF0dMuadLOvQ4zx1CoFmSXPOb1F4BGukC
 gJ20bH2Oxj+07fal9vhZjsRRjrwSssWXM42eCOMu+hxqYFuNDUIOZkRHLiuDd0rFxHkcGdB
 t07HrO4yCndoHVdDmcgYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QdsV2Ml06cU=;06LGfnW/NOWQdZGH4o72k/niY6G
 6sMIlwt5UaaYCAxKhPbI7wtjtthDKuuVd8x+ZKGHGKqzBhwi8fSXAN33nDKifXIepm2R5RqR5
 SrepLxv9Te48I6CmRr++WPGvdbiAz1/Ryh1ooMfOYdm29SrBRMCY1wGWbrB7I62dtc0HdL7Ij
 KbLwvJJEnrzEkRtIQaRIQTlmYGbeZfzax5o7my8H4CP8Y9Q2AQMYN9+fmUz0kmVlsgqPK7R9D
 XaEOHklVLUGcBty4JvbOlE2we0NlcnaMVkNWJkFnynjro3gB05+KYnlvcz35VbFOyg5kd4tR+
 NtiSXu2uqb9fq9WixjV5MkNGnk0MKM1evvB+LFJyGZFNlHjS5QzhBPNRQk2HpkoqJ/bViynnd
 qSqFuJXHAIDu2Y3N23qn/9PpHVomnN4hPEFGv5ISLJz1Kdi0RBL4LiGqJXoW7O9NEwrh2nXrS
 AThBwNNLGK7O2GdZfegPy/ltOLqetSWMVfjliu+J//PW/enJk56SO2+cZJaUX5qurznPwElqd
 p23C9ueUemyXl6pIJxSlUe2BVH6tb2xg0kiwPMmXqy9ycxcw4BC52VCvmBUmLPjnWaafP6ZH0
 hd3nckt9xArHqcJBMWl8miYmz/VgN0bZudmqZjnHqDJFnYe7vMk2z2GMBEEukTthD4w+fwAPq
 BPLUood+Hc6o41wPclK/puCCTxCmH7LKCo2n7tOfs0r9/WxeBFEDaDCVB1yHnLAzmaN1NKX99
 2lTAXGGUm4POXofQPk1oHTjxFCwPtD4WFCVZBwb8sXDHVDWD+nzU+Zi4sNf6ooviwoABU1eR3
 7tsiHjOn5aN0EUmzovwdgL4FC9FC4k8j9EASS3ntCQfZkbO+e50LR6pW2pXq9IsnAfitCGLEb
 kAwYm0tjDiOOczfV0qHgbz0XBmKfVYGkSj1QYtUeMhJh6AQzfAq02OS7siQUl4NL82BMWjXmj
 FKSx7TwyaF2ScARnnR+eYF4xw0xFblGdKvcT3rR2qnleHqxGbxL0z0NZ+YWLyVnWt3Vdkf6xx
 hPYJK0195LTQOZWGuXnM1CAPmeF5TGrDD86lWwsGQCtEZa/Fv5lRmO4hUWSWnHd3dHRK3Z1rY
 dVuqZXQ90SyW7+bR8pCGV3PcYJhX10xR5dYIIbByWrGwQgAI0HLqopGektm6Qo0UT5iLitN8x
 GiVfK7NPfUKyWh4FIgh39haV7qNLJ7TcEBbLumkW2VhLO+qaUGNVJfEOiEjaa+DQfG0xynYML
 b44uryKwEdNNuE3GfTBJ64d9YCoMKkyMoRDk+ZveS/XMMvp/U4zoMMj7nfr5sKSKkUOssWgIO
 VvZOdamGFstsWWHKk5GT9xE3xH6DQFik0mNVrYUuH8jODzxw24Igtf0ZXmx/E2D1kSCCLhgkC
 UL0HYAKG30sRwvegrUb/OKaYzpERGywpbd53IIXgmoJnK2TTcsc48rc+zJMzii1+VSbdmuCsv
 4zmgd5CmTucvCytSrTUyAZSy5A24=

Am 02.04.25 um 23:22 schrieb Derek John Clark:

> On Thu, Mar 27, 2025 at 5:56=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Mon, 17 Mar 2025, Derek J. Clark wrote:
>>
>>> Adds lenovo-wmi-capdata01 driver which provides the
>>> LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
>>> enabled hardware. Provides an interface for querying if a given
>>> attribute is supported by the hardware, as well as its default_value,
>>> max_value, min_value, and step increment.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>> v4:
>>>   - Make driver data a private struct, remove references from Other Mo=
de
>>>     driver.
>>>   - Don't cache data at device initialization. Instead, on component b=
ind,
>>>     cache the data on a member variable of the Other Mode driver data
>>>     passed as a void pointer.
>>>   - Add header file for capdata01 structs.
>>>   - Add new struct to pass capdata01 array data and array length to Ot=
her
>>>     Mode.
>>> v3:
>>> - Add as component to lenovo-wmi-other driver.
>>> v2:
>>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>>    reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
>>> - Use list to get the lenovo_wmi_cd01_priv instance in
>>>    lenovo_wmi_capdata01_get as none of the data provided by the macros
>>>    that will use it can pass a member of the struct for use in
>>>    container_of.
>>> ---
>>>   MAINTAINERS                                 |   2 +
>>>   drivers/platform/x86/Kconfig                |   4 +
>>>   drivers/platform/x86/Makefile               |   1 +
>>>   drivers/platform/x86/lenovo-wmi-capdata01.c | 136 ++++++++++++++++++=
++
>>>   drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
>>>   5 files changed, 172 insertions(+)
>>>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 6dde75922aaf..56ead241a053 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
>>>   S:   Maintained
>>>   F:   Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>   F:   Documentation/wmi/devices/lenovo-wmi-other.rst
>>> +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
>>> +F:   drivers/platform/x86/lenovo-wmi-capdata01.h
>>>   F:   drivers/platform/x86/lenovo-wmi-events.c
>>>   F:   drivers/platform/x86/lenovo-wmi-events.h
>>>   F:   drivers/platform/x86/lenovo-wmi-helpers.c
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index 13b8f4ac5dc5..64663667f0cb 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
>>>        tristate
>>>        depends on ACPI_WMI
>>>
>>> +config LENOVO_WMI_DATA01
>>> +     tristate
>>> +     depends on ACPI_WMI
>>> +
>>>   config IDEAPAD_LAPTOP
>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>        depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index fc039839286a..7a35c77221b7 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
>>>   obj-$(CONFIG_YOGABOOK)               +=3D lenovo-yogabook.o
>>>   obj-$(CONFIG_YT2_1380)               +=3D lenovo-yoga-tab2-pro-1380-=
fastcharger.o
>>>   obj-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D lenovo-wmi-camera.o
>>> +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
>>>   obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
>>>   obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
>>>
>>> diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/pla=
tform/x86/lenovo-wmi-capdata01.c
>>> new file mode 100644
>>> index 000000000000..b6876611ffd9
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
>>> @@ -0,0 +1,136 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver.
>> Add a empty comment line here, you might want to rephrase the opening o=
f
>> the paragraph after splitting these apart.
>>
>>> This interface provides
>>> + * information on tunable attributes used by the "Other Mode" WMI int=
erface,
>>> + * including if it is supported by the hardware, the default_value, m=
ax_value,
>>> + * min_value, and step increment.
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/component.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/device.h>
>>> +#include <linux/gfp_types.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>> Add an empty line here please.
>>
>>> +#include "lenovo-wmi-capdata01.h"
>>> +
>>> +/* Interface GUIDs */
>>> +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>>> +
>>> +struct lwmi_cd01_priv {
>>> +     struct wmi_device *wdev;
>>> +};
>>> +
>>> +/*
>>> + * lenovo_cd01_component_bind() - On master bind, caches all capabili=
ty data on
>>> + * the master device.
>> Is this "On master bind" something that the caller should be doing? IMO=
,
>> that would belong to description paragraph instead of the function
>> summary.
>>
> Acked
>
>>> + * @cd01_dev: Pointer to the capability data 01 parent device.
>>> + * @om_dev: Pointer to the other mode parent device.
>>> + * @data: capdata01_list object pointer to return the capability data=
 with.
>>> + *
>>> + * Returns: 0, or an error.
>> Return:
>>
>>> + */
>>> +static int lenovo_cd01_component_bind(struct device *cd01_dev,
>>> +                                   struct device *om_dev, void *data)
>>> +{
>>> +     struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
>>> +     int count, idx;
>>> +
>>> +     if (!priv)
>>> +             return -ENODEV;
>>> +
>>> +     count =3D wmidev_instance_count(priv->wdev);
>>> +
>>> +     if (count =3D=3D 0)
>>> +             return -EINVAL;
>>> +
>>> +     ((struct cd01_list *)data)->count =3D count;
>> Please create a local variable with the correct type and since data is
>> void *, you don't need to cast it while assigning to that local variabl=
e.
>>
> This will be reworked a bit with Armin's suggestions.
>
>>> +     ((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev, =
count,
>>> +                                                           sizeof(str=
uct capdata01 *),
>> sizeof() should preferrably take the type directly from ->data (with th=
e
>> correct amount of * chars).
>>
> With Armin's suggestion I'll be using struct_size, but I'll note this
> for future reference, thanks.
>
>>> +                                                           GFP_KERNEL=
);
>>> +     if (!data)
>>> +             return -ENOMEM;
>>> +
>>> +     for (idx =3D 0; idx < count; idx++) {
>>> +             union acpi_object *ret_obj __free(kfree) =3D NULL;
>>> +
>>> +             ret_obj =3D wmidev_block_query(priv->wdev, idx);
>>> +             if (!ret_obj) {
>>> +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
>>> +                     continue;
>>> +             }
>>> +             if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
>>> +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
>>> +                     continue;
>>> +             }
>>> +
>>> +             if (ret_obj->buffer.length !=3D sizeof(struct capdata01)=
) {
>> You could consider joining these 3 if()s with || to avoid having to
>> repeat the NULL assignment and continue.
>>
> devm_kzalloc will take care of the NULL assignment going forward. for
> !ret_obj, should I return an error here instead? It seems like a
> problem if that fails.

Returning an error if a ACPI object is invalid should be OK here. This way=
 the driver
ensures that it either exports all capdata entries on a given machine or n=
one at all.

Just a side note: the check "ret_obj->buffer.length !=3D sizeof(struct cap=
data01)" should
be turned into "ret_obj->buffer.length < sizeof(struct capdata01)" to also=
 accept oversized
buffers. This would mimic the behavior of the Windows WMI-ACPI driver.

Thanks,
Armin Wolf

>>> +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
>>> +                     continue;
>>> +             }
>>> +
>>> +             ((struct cd01_list *)data)->data[idx] =3D
>>> +                     devm_kmemdup(om_dev, ret_obj->buffer.pointer,
>>> +                                  ret_obj->buffer.length, GFP_KERNEL)=
;
>>> +     }
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct component_ops lenovo_cd01_component_ops =3D {
>>> +     .bind =3D lenovo_cd01_component_bind,
>>> +};
>>> +
>>> +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *conte=
xt)
>>> +
>>> +{
>>> +     struct lwmi_cd01_priv *priv;
>>> +     int ret;
>>> +
>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->wdev =3D wdev;
>>> +     dev_set_drvdata(&wdev->dev, priv);
>>> +
>>> +     ret =3D component_add(&wdev->dev, &lenovo_cd01_component_ops);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void lwmi_cd01_remove(struct wmi_device *wdev)
>>> +{
>>> +     component_del(&wdev->dev, &lenovo_cd01_component_ops);
>>> +}
>>> +
>>> +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
>>> +     { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>>> +     {}
>>> +};
>>> +
>>> +static struct wmi_driver lwmi_cd01_driver =3D {
>>> +     .driver =3D {
>>> +             .name =3D "lenovo_wmi_cd01",
>>> +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>> +     },
>>> +     .id_table =3D lwmi_cd01_id_table,
>>> +     .probe =3D lwmi_cd01_probe,
>>> +     .remove =3D lwmi_cd01_remove,
>>> +     .no_singleton =3D true,
>>> +};
>>> +
>>> +int lwmi_cd01_match(struct device *dev, void *data)
>>> +{
>>> +     return dev->driver =3D=3D &lwmi_cd01_driver.driver;
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
>>> index 000000000000..c7067a8d0398
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + *
>> Extra line
>>
>>> + */
>>> +
>>> +#ifndef _LENOVO_WMI_CAPDATA01_H_
>>> +#define _LENOVO_WMI_CAPDATA01_H_
>>> +
>>> +#include <linux/device.h>
>> Please fwd declare struct device instead.
>>
>>> +#include <linux/types.h>
>>> +
>>> +struct capdata01 {
>>> +     u32 id;
>>> +     u32 supported;
>>> +     u32 default_value;
>>> +     u32 step;
>>> +     u32 min_value;
>>> +     u32 max_value;
>>> +};
>>> +
>>> +struct cd01_list {
>>> +     struct capdata01 **data;
>>> +     int count;
>>> +};
>>> +
>>> +int lwmi_cd01_match(struct device *dev, void *data);
>>> +
>>> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
>>>
>> --
>>   i.
>>
