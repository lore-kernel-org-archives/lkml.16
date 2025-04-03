Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4568460;
	Thu,  3 Apr 2025 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643962; cv=none; b=S9C5beJaNGl50IBnzyemD+LHvmZw6ks4R2V+Ca2Pb1Jpvjxk8wFwQyU0dJWorlBuvMMgIFqiBcV56VxP4jccfLZ53bdL99t6w8+/Uw3JOnr0MLOaimHR6z+PSeoN/1ClZ9y/nZO7kQUt1T9YltE0kfr0y2GcJlRD1SbF6KRTDKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643962; c=relaxed/simple;
	bh=s63/BlFrqDP6nyXhl1tKcp7fK2hdwMontFj6IojtNLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4B44iInFXjTiqw3gaYvgQJm+9WVnRvaMiOEIFWsLV+NDmYwKPylwoKmKBbOxQxMRajD02jPvMfkEwWUMz/qTkhk3VQOz7EH9qKwS/mGS7oI2K0P0aPr/DpG9OLInmQQyOUqwyYD0MlJwF2jsE7JbvGCKPxePu+Yk5tBRkCKyHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=c0e4AMXh; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="c0e4AMXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743643942; x=1744248742; i=w_armin@gmx.de;
	bh=k40pg1sVJxfbhI/IYQf7wHQf8PecVc3hOeyMLvZCYdM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=c0e4AMXh06IBJ1w4RrZoIXNYrumhqjgkAFFRgJpAVBiIRW5tcx6idZd6ItQh6Agv
	 2NYGVCCI6XMl+wPn7R1vkHjOpe7tSgpk8m2jzerqmVOFwAhmyDhJqINAX8n6/2Ie0
	 zOct3he0T383lxvveJ/hulBh+OO2qMbxZluQp+sywI7mnY2gjmZrzJvbXuti1tA7q
	 xRwSHuRp9wHSe6VTgYUevwBaZAgaIYnK5F5ugYgOjrwaE+UrQO1pmimrzc6PAjdG7
	 +pOD6ec/Bs1NQdn2P+wWu1ABDKASz8avRvGE9KzYkcj+gGFPnY2Po3xJdo9ID5Reo
	 Joe7qdaBxMN+zvdBeQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1tr2cW3XNZ-002oWR; Thu, 03
 Apr 2025 03:32:22 +0200
Message-ID: <899cabea-c0eb-4f1b-897e-42a1e031d806@gmx.de>
Date: Thu, 3 Apr 2025 03:32:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI
 Driver
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-7-derekjohn.clark@gmail.com>
 <b293a4a3-f759-4b47-a48d-da4a740f52e1@gmx.de>
 <CAFqHKT=Tpq9tEmyU10AJL2ruwTGSgoJTf38dRjMCt=9PFRVAxw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=Tpq9tEmyU10AJL2ruwTGSgoJTf38dRjMCt=9PFRVAxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:blObHrCMZEQyF5mPnK+m4pbb99wlsBCu/xCac61O3/+xPeQdolp
 yDaoXmJOcfRKweINvnCBQlLAIjsNYgt9zzMLCujNxLT+MK/anO1ezZgZdwyqpG9dIwpXLxB
 GY+5J4SduhhKR2dS56cWHOxR1Kc41b2pa229ljQ7vGkOR6BQkWlhcyvKu4DFln5slgugdA+
 Ep6V0QqHcgEj9ezhv0esg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b43rouAgUok=;2o0h6f9D3umyylK0EN01pkpGhQ6
 S1D/520r1xlDvbEUZ+wOVR14qIoJOzpvMt0/uSLjETb/YgEi3KTtn0DBrHitZGKauUVpqzZsQ
 Lo9BSs0jc/n70lU5dwYuRzYcD37hC64sRrFFM4MpxqV2WRkDlpkjvmesEvmV8YiMFp0VmEymk
 mCSuPC0/lByRNugyoBYLDyyxm9DFy79FCZntrxH8BZHs3WWR6KtJgutAc0yoS6yABBXNj0ELH
 zpySmBy3wufptgDRbfQp6xtDoYAzs2yLzcWIAyJNNMIx8KPw9ryR76YEJtdPHuYutW9q1NHUR
 M6uM7Fmr5HR7ToLY8wRjzfY25+XCc2GPrcI2Ij9Yl9WjiunkMDaxPhVtBgKx6yvdqzUdPRaz6
 oy7PVwF5anB2KIgUasXRu39pT7Uh9m7WCo0W0ZUKbUW+yREWgPLs8H68SWsNn8HCWKeAuPHsB
 uVZtMkwf7CE7drsT6irmsMUY7vIptGMmX8HzsB13J4tAoqz29VTJDbMd5RJiodWV+ocpvTK4D
 hT1FeGlbbCUrylsZP/oiSTQs5M6YWxgrnoOP2TTHzQ9D8HMWlXT0/eol5z1Y/8GImHLC/RnRV
 UcS9G8of6aF39LeBlLj4kRZaN5x+erh8/086O/SDe4D3hyXDrQ0X6cRh118NPUYobU7B1/gYs
 D9LO22jx4/vd8W9QWDPjXv976TUptYpb4tDeqmG7NRJh1NaHJb6R+tbmsLgfXjp5TRY8LgOkA
 WpPe7P4bV33JYVehoVdLs+jPSStMtrfe7lu4Ije0ny8TLhfmOFoVTfs7sy8qXQprXEc1ToUFb
 GxivqfLf8QO6u4cDejF4X8bYmrEi/162O9r0tRyxCgrEGnQDb3F7dju7XCn6eIlCH+U0sCcGE
 AI1DaM3IFtLnGfNaIUa800nSnAnIseGjdSFoTaCuxEYN7QaPrqIdO97Bu4tcOPlPQh7nqbq2U
 UvZzg80B4KO1uMHzR9jZLmb03UNHBLsmIghIK0IYsqzUJMqcju+wrsj1g5e3m9a2LMqcgkobE
 7ghevUQ3vxnBxMqUlXFFR0DK3mM3kpdQghZgKOhg5WXT8y+S95zAXkJh85CmYUFCpdhDmud64
 X/9wK5w+UGJP8wd2fX1fesoitIWVsgf7rneZ24owIfqCePbleLpxhPb4ibVZHLOrUjAx9U2H0
 Pd5bMPc16xU8houFNB8g1Td6ZpdtsbWj0e170xAmz+XOV9q8kTISJ87Yrn1qXW95M5u0bsxU8
 tCYo/EyonwW+gH6eFBck7mPRHEKKtNzpcVuvb6FzlUfPcmEbZxTXALv1WE+mRGIdGkXyLCzaQ
 HFlIMUKfl9s2DydH0XUkt8WKXMpqxFfsmy06SXQiFgQESVA81rDM/UMuynK6Po7emJPBW8mJ8
 nJWwbA7kiWaqnI8mYuBgEtgjEHSx7OBPxm/YETaW2n3YN2Dc0+8pImCLjHNE/g3s3fYc3NJE3
 u1CJZVRj6bIKAPQR+p3knr9h8Pnk=

Am 02.04.25 um 22:58 schrieb Derek John Clark:

> On Wed, Mar 26, 2025 at 8:49=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>>
>>> Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
>>> interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
>>> platform profiles over WMI.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>> v4:
>>> - Add notifier blocks for the Events and Other Mode drivers.
>>> - Remove notifier block chain head and all reference to Thermal Mode
>>>     Event GUID.
>>> - Add header for Gamezone specific structs and functions.
>>> - Various fixes from review.
>>> v3:
>>> - Use notifier chain to report platform profile changes to any
>>>     subscribed drivers.
>>> - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifie=
r
>>>     chain.
>>> - Adds support for Extreme Mode profile on supported hardware, as well
>>>     as a DMI quirk table for some devices that report extreme mode ver=
sion
>>>     support but so not have it fully implemented.
>>> - Update to include recent changes to platform-profile.
>>> v2:
>>> - Use devm_kmalloc to ensure driver can be instanced, remove global
>>>     reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
>>> - Remove GZ_WMI symbol exporting.
>>> ---
>>>    MAINTAINERS                                |   2 +
>>>    drivers/platform/x86/Kconfig               |  13 +
>>>    drivers/platform/x86/Makefile              |   1 +
>>>    drivers/platform/x86/lenovo-wmi-gamezone.c | 380 ++++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
>>>    5 files changed, 414 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 87daee6075ad..0416afd997a0 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13168,6 +13168,8 @@ F:    drivers/platform/x86/lenovo-wmi-capdata0=
1.c
>>>    F:  drivers/platform/x86/lenovo-wmi-capdata01.h
>>>    F:  drivers/platform/x86/lenovo-wmi-events.c
>>>    F:  drivers/platform/x86/lenovo-wmi-events.h
>>> +F:   drivers/platform/x86/lenovo-wmi-gamezone.c
>>> +F:   drivers/platform/x86/lenovo-wmi-gamezone.h
>>>    F:  drivers/platform/x86/lenovo-wmi-helpers.c
>>>    F:  drivers/platform/x86/lenovo-wmi-helpers.h
>>>    F:  drivers/platform/x86/lenovo-wmi-other.c
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index fc47604e37f7..ecf3246c8fda 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -467,6 +467,19 @@ config LENOVO_WMI_HELPERS
>>>        tristate
>>>        depends on ACPI_WMI
>>>
>>> +config LENOVO_WMI_GAMEZONE
>>> +     tristate "Lenovo GameZone WMI Driver"
>>> +     depends on ACPI_WMI
>> Hi,
>>
>> please add a "depends on DMI" here.
>>
> Acked
>
>>> +     select ACPI_PLATFORM_PROFILE
>>> +     select LENOVO_WMI_EVENTS
>>> +     select LENOVO_WMI_HELPERS
>>> +     help
>>> +       Say Y here if you have a WMI aware Lenovo Legion device and wo=
uld like to use the
>>> +       platform-profile firmware interface to manage power usage.
>>> +
>>> +       To compile this driver as a module, choose M here: the module =
will
>>> +       be called lenovo-wmi-gamezone.
>>> +
>>>    config LENOVO_WMI_DATA01
>>>        tristate
>>>        depends on ACPI_WMI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index c6ce3c8594b1..f3e64926a96b 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga=
-tab2-pro-1380-fastcharger.o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
>>>    obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
>>>    obj-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D lenovo-wmi-events.o
>>> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
>>>    obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
>>>    obj-$(CONFIG_LENOVO_WMI_TUNING)     +=3D lenovo-wmi-other.o
>>>
>>> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/plat=
form/x86/lenovo-wmi-gamezone.c
>>> new file mode 100644
>>> index 000000000000..9d453a836227
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
>>> @@ -0,0 +1,380 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface p=
rovides
>>> + * platform profile and fan curve settings for devices that fall unde=
r the
>>> + * "Gaming Series" of Lenovo Legion devices.
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/dmi.h>
>>> +#include <linux/list.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/platform_profile.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>> Please also include linux/acpi.h, linux/export.h and linux/module.h.
>>
>>> +
>>> +#include "lenovo-wmi-events.h"
>>> +#include "lenovo-wmi-gamezone.h"
>>> +#include "lenovo-wmi-helpers.h"
>>> +#include "lenovo-wmi-other.h"
>>> +
>>> +/* Interface GUIDs */
>>> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>>> +
>>> +/* Method IDs */
>>> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
>>> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
>>> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
>>> +
>>> +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
>>> +
>>> +struct lwmi_event_priv {
>>> +     enum thermal_mode current_mode;
>>> +     struct wmi_device *wdev;
>>> +     bool extreme_supported;
>>> +     struct device *ppdev; /*platform profile device */
>>> +     struct notifier_block event_nb;
>>> +     struct notifier_block mode_nb;
>>> +};
>>> +
>>> +struct quirk_entry {
>>> +     bool extreme_supported;
>>> +};
>>> +
>>> +static struct quirk_entry quirk_no_extreme_bug =3D {
>>> +     .extreme_supported =3D false,
>>> +};
>>> +
>>> +/* Notifier Methods */
>>> +/*
>> /* -> /**, same goes for the other kernel doc comments.
>>
>>> + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other notifier
>>> + * block call chain. For THERMAL_MODE_EVENT, returns current_mode
>>> + *
>>> + * @nb: The notifier_block registered to lenovo-wmi-other
>>> + * @cmd: The event triggered by lenovo-wmi-other
>>> + * @data: The data to be returned by the event.
>>> + *
>>> + * Returns: notifier_block status.
>>> + */
>>> +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long=
 cmd,
>>> +                          void *data)
>>> +{
>>> +     struct lwmi_event_priv *priv;
>>> +
>>> +     priv =3D container_of(nb, struct lwmi_event_priv, mode_nb);
>>> +     if (!priv)
>>> +             return NOTIFY_BAD;
>>> +
>>> +     switch (cmd) {
>>> +     case THERMAL_MODE_EVENT:
>> I think it would be better to have a separate command code (maybe GAMEZ=
ONE_GET_THERMAL_MODE) for this
>> kind of request. Maybe you can define a separate enum for that?
>>
> I originally had two enums for this but it seemed redundant. TBS this
> is probably a better idea as the spec has two different event types
> for thermal mode events (one is a buffer with additional data) and
> getting the thermal mode from GZ would be agnostic from the events
> that are triggered.

Exactly.

Thanks,
Armin Wolf

>>> +             *(enum thermal_mode *)data =3D priv->current_mode;
>> I think you need to protect this variable from concurrent accesses. May=
be a spinlock would
>> be suitable here?
>>
> Acked
>
>>> +             break;
>> Please return NOTIFY_STOP here to prevent the notifier call chain from =
calling further.
>>
> Acked
>
>>> +     default:
>>> +             return NOTIFY_DONE;
>>> +     }
>>> +
>>> +     return NOTIFY_OK;
>>> +}
>>> +
>>> +/*
>>> + * lwmi_gz_event_call() - Call method for lenovo-wmi-events notifier
>>> + * block call chain. For THERMAL_MODE_EVENT, sets current_mode and
>>> + * notifies platform_profile of a change.
>>> + *
>>> + * @nb: The notifier_block registered to lenovo-wmi-events
>>> + * @cmd: The event triggered by lenovo-wmi-events
>>> + * @data: The data to be updated by the event.
>>> + *
>>> + * Returns: notifier_block status.
>>> + */
>>> +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned lon=
g cmd,
>>> +                           void *data)
>>> +{
>>> +     struct lwmi_event_priv *priv;
>>> +
>>> +     priv =3D container_of(nb, struct lwmi_event_priv, event_nb);
>>> +     if (!priv)
>>> +             return NOTIFY_BAD;
>> This check is unnecessary, please drop it?
>>
> Will do
>
>>> +
>>> +     switch (cmd) {
>>> +     case THERMAL_MODE_EVENT:
>>> +             priv->current_mode =3D *((enum thermal_mode *)data);
>> You do not need to explicitly cast void pointers. Also please validate =
that the event data
>> is actually a valid thermal mode. This check should IMHO happen inside =
the event driver itself.
>>
>>> +             platform_profile_notify(&priv->wdev->dev);
>> You are supposed to pass the platform profile device as the argument.
>>
> That makes more sense. I'll correct this, thanks.
>
>>> +             break;
>>> +     default:
>>> +             return NOTIFY_DONE;
>>> +     }
>>> +
>>> +     return NOTIFY_OK;
>>> +}
>>> +
>>> +/* Platform Profile Methods & Setup */
>>> +/*
>>> + * lwmi_gz_platform_profile_supported() - Gets the version of the WMI
>>> + * interface to determine the support level.
>>> + *
>>> + * @wdev: The Gamezone WMI device.
>>> + * @supported: Pointer to return the support level with.
>>> + *
>>> + * Returns: 0, or an error.
>>> + */
>>> +static int lwmi_gz_platform_profile_supported(struct wmi_device *wdev=
,
>>> +                                           int *supported)
>>> +{
>>> +     return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFA=
N_SUPP,
>>> +                                     0, 0, supported);
>>> +}
>>> +
>>> +/*
>>> + * lwmi_gz_thermal_mode_get() - Gets the currently set thermal mode f=
rom
>>> + * the Gamezone WMI interface.
>>> + *
>>> + * @wdev: The Gamezone WMI device.
>>> + * @mode: Pointer to return the thermal mode with.
>>> + *
>>> + * Returns: 0, or an error.
>>> + */
>>> +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
>>> +                                 enum thermal_mode *mode)
>>> +{
>>> +     return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFA=
N_GET,
>>> +                                     0, 0, mode);
>>> +}
>>> +
>>> +static int lwmi_gz_profile_get(struct device *dev,
>>> +                            enum platform_profile_option *profile)
>>> +{
>>> +     struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
>>> +     enum thermal_mode mode;
>>> +     int ret;
>>> +
>>> +     ret =3D lwmi_gz_thermal_mode_get(priv->wdev, &mode);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     switch (mode) {
>>> +     case SMARTFAN_MODE_QUIET:
>>> +             *profile =3D PLATFORM_PROFILE_LOW_POWER;
>>> +             break;
>>> +     case SMARTFAN_MODE_BALANCED:
>>> +             *profile =3D PLATFORM_PROFILE_BALANCED;
>>> +             break;
>>> +     case SMARTFAN_MODE_PERFORMANCE:
>>> +             if (priv->extreme_supported) {
>>> +                     *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMAN=
CE;
>>> +                     break;
>>> +             }
>>> +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>> +             break;
>>> +     case SMARTFAN_MODE_EXTREME:
>>> +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>> +             break;
>>> +     case SMARTFAN_MODE_CUSTOM:
>>> +             *profile =3D PLATFORM_PROFILE_CUSTOM;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     priv->current_mode =3D mode;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int lwmi_gz_profile_set(struct device *dev,
>>> +                            enum platform_profile_option profile)
>>> +{
>>> +     struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
>>> +     struct wmi_method_args_32 args;
>>> +     enum thermal_mode mode;
>>> +     int ret;
>>> +
>>> +     switch (profile) {
>>> +     case PLATFORM_PROFILE_LOW_POWER:
>>> +             mode =3D SMARTFAN_MODE_QUIET;
>>> +             break;
>>> +     case PLATFORM_PROFILE_BALANCED:
>>> +             mode =3D SMARTFAN_MODE_BALANCED;
>>> +             break;
>>> +     case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>>> +             mode =3D SMARTFAN_MODE_PERFORMANCE;
>>> +             break;
>>> +     case PLATFORM_PROFILE_PERFORMANCE:
>>> +             if (priv->extreme_supported) {
>>> +                     mode =3D SMARTFAN_MODE_EXTREME;
>>> +                     break;
>>> +             }
>>> +             mode =3D SMARTFAN_MODE_PERFORMANCE;
>>> +             break;
>>> +     case PLATFORM_PROFILE_CUSTOM:
>>> +             mode =3D SMARTFAN_MODE_CUSTOM;
>>> +             break;
>>> +     default:
>>> +             return -EOPNOTSUPP;
>>> +     }
>>> +
>>> +     args.arg0 =3D mode;
>>> +
>>> +     ret =3D lwmi_dev_evaluate_method(priv->wdev, 0x0,
>>> +                                    WMI_METHOD_ID_SMARTFAN_SET,
>>> +                                    (unsigned char *)&args, sizeof(ar=
gs),
>>> +                                    NULL);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     priv->current_mode =3D mode;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct dmi_system_id fwbug_list[] =3D {
>>> +     {
>>> +             .ident =3D "Legion Go 8APU1",
>>> +             .matches =3D {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"=
),
>>> +             },
>>> +             .driver_data =3D &quirk_no_extreme_bug,
>>> +     },
>>> +     {
>>> +             .ident =3D "Legion Go S 8ARP1",
>>> +             .matches =3D {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP=
1"),
>>> +             },
>>> +             .driver_data =3D &quirk_no_extreme_bug,
>>> +     },
>>> +     {
>>> +             .ident =3D "Legion Go S 8APU1",
>>> +             .matches =3D {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU=
1"),
>>> +             },
>>> +             .driver_data =3D &quirk_no_extreme_bug,
>>> +     },
>>> +     {},
>>> +
>>> +};
>>> +
>>> +/*
>>> + * extreme_supported() - Evaluate if a device supports extreme therma=
l mode.
>>> + * For devices that have a profile_support_ver of 6 or greater a DMI =
check
>>> + * is done. Some devices report a version that supports extreme mode =
but
>>> + * have an incomplete entry in the BIOS. To ensure this cannot be set=
, they
>>> + * are quirked to prevent assignment.
>>> + *
>>> + * @profile_support_ver: Version of WMI interface provided by
>>> + * lwmi_gz_platform_profile_supported.
>>> + *
>>> + * Returns: bool
>>> + */
>>> +static bool extreme_supported(int profile_support_ver)
>>> +{
>>> +     const struct dmi_system_id *dmi_id;
>>> +     struct quirk_entry *quirks;
>>> +
>>> +     if (profile_support_ver < 6)
>>> +             return false;
>>> +
>>> +     dmi_id =3D dmi_first_match(fwbug_list);
>>> +     if (!dmi_id)
>>> +             return true;
>>> +
>>> +     quirks =3D dmi_id->driver_data;
>>> +     return quirks->extreme_supported;
>>> +}
>>> +
>>> +static int lwmi_platform_profile_probe(void *drvdata, unsigned long *=
choices)
>>> +{
>>> +     struct lwmi_event_priv *priv =3D drvdata;
>>> +     int profile_support_ver;
>>> +     int ret;
>>> +
>>> +     ret =3D lwmi_gz_platform_profile_supported(priv->wdev,
>>> +                                              &profile_support_ver);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (profile_support_ver < 1)
>>> +             return -ENODEV;
>>> +
>>> +     priv->extreme_supported =3D extreme_supported(profile_support_ve=
r);
>>> +
>>> +     set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>>> +     set_bit(PLATFORM_PROFILE_BALANCED, choices);
>>> +     set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>> +     set_bit(PLATFORM_PROFILE_CUSTOM, choices);
>>> +
>>> +     if (priv->extreme_supported)
>>> +             set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct platform_profile_ops lwmi_gz_platform_profile_ops=
 =3D {
>>> +     .probe =3D lwmi_platform_profile_probe,
>>> +     .profile_get =3D lwmi_gz_profile_get,
>>> +     .profile_set =3D lwmi_gz_profile_set,
>>> +};
>>> +
>>> +/* Driver Methods */
>>> +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context=
)
>>> +{
>>> +     struct lwmi_event_priv *priv;
>>> +     int ret;
>>> +
>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->event_nb.notifier_call =3D lwmi_gz_event_call;
>>> +     ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->ev=
ent_nb);
>>> +     if (ret)
>>> +             return ret;
>> You should register the event notifier after registering the platform p=
rofile or else
>> a WMI event could arrive before the platform profile was registered, re=
sulting in
>> platform_profile_notify() being called on a invalid device pointer.
>>
> Acked
>
>>> +
>>> +     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
>>> +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_n=
b);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     priv->wdev =3D wdev;
>>> +     dev_set_drvdata(&wdev->dev, priv);
>> This should happen before the notifiers are registered or else they mig=
ht try to access
>> those values before they are actually initialized.
>>
> Acked
>
>>> +
>>> +     priv->ppdev =3D platform_profile_register(&wdev->dev,
>>> +                                             "lenovo-wmi-gamezone", p=
riv,
>>> +                                             &lwmi_gz_platform_profil=
e_ops);
>>> +
>>> +     if (IS_ERR(priv->ppdev))
>>> +             return -ENODEV;
>>> +
>>> +     ret =3D lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
>>> +     if (ret)
>>> +             return ret;
>> The thermal mode should be initialized before any notifiers using it ar=
e registered.
>>
> I'll register notifiers last in this func.
>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct wmi_device_id lwmi_gz_id_table[] =3D { { LENOVO_G=
AMEZONE_GUID,
>>> +                                                        NULL },
>>> +                                                      {} };
>> Please fix the formatting here.
>>
> Will do.
>
> Thanks,
> Derek
>
>> Thanks,
>> Armin Wolf
>>
>>> +
>>> +static struct wmi_driver lwmi_gz_driver =3D {
>>> +     .driver =3D {
>>> +             .name =3D "lenovo_wmi_gamezone",
>>> +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>>> +     },
>>> +     .id_table =3D lwmi_gz_id_table,
>>> +     .probe =3D lwmi_gz_probe,
>>> +     .no_singleton =3D true,
>>> +};
>>> +
>>> +module_wmi_driver(lwmi_gz_driver);
>>> +
>>> +MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
>>> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>>> +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
>>> +MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/plat=
form/x86/lenovo-wmi-gamezone.h
>>> new file mode 100644
>>> index 000000000000..ac536803160b
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
>>> @@ -0,0 +1,18 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + *
>>> + */
>>> +
>>> +#ifndef _LENOVO_WMI_GAMEZONE_H_
>>> +#define _LENOVO_WMI_GAMEZONE_H_
>>> +
>>> +enum thermal_mode {
>>> +     SMARTFAN_MODE_QUIET =3D 0x01,
>>> +     SMARTFAN_MODE_BALANCED =3D 0x02,
>>> +     SMARTFAN_MODE_PERFORMANCE =3D 0x03,
>>> +     SMARTFAN_MODE_EXTREME =3D 0xE0, /* Ver 6+ */
>>> +     SMARTFAN_MODE_CUSTOM =3D 0xFF,
>>> +};
>>> +
>>> +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
