Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0726AFB;
	Thu,  3 Apr 2025 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743644421; cv=none; b=TYsZglw4J1rmLKcB5DQX13A0RyYm3JSP7fReCMo2fR4udvDEQLOcDxz3MbDTfBEj33IIC70QUTfZH5s4F4nigthbHUyfhzWdFTJw2cb8xgLxmlRGQLTgOdR/Qae/QVZo9Egl+IUgiFwxnJlDjAHcU1HRBNxR8+T4K+paLopv+KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743644421; c=relaxed/simple;
	bh=s7u5mxYYwl1wKTrRuYQxaYNX/EYu1N1SvhKWLrv7dHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYr1FRXHf9TD+Q3OUbt4hPkZfsjFitvr8piVMRQHu68RM1XUZh+2WX+FeFOscQTXmthZ1n7jvja3SvI5Czi9QLdjZ9G8VddRmTd1dF9+4cHWb2PmnOK58kVU16BLetl0LirEP3w4xjtGtSS4cidCucyBQUwNqH+B3lUY8LklYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LPMaM1Lv; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LPMaM1Lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743644414; x=1744249214; i=w_armin@gmx.de;
	bh=M5+t7lkNn4b/GQ6zRwlMxmsQuZeGUjKsZmFP+02dGW8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LPMaM1LvWh2qrW04mzwaxrCtQMStbrnR/d91+AAmI1jjRLGCYimMUNN1mZMA78xh
	 lIkqj0Z2LOeVjF/2IapeVzCt4KEWdLY9dMlfyLlUW6kXZes4rqUGgjrn/0jkeSQAA
	 Eh+R011LbJcH9SgexAYb/nn11hKBFRe5iuPuojtvvRFo5qxrLAjtuyZscPoPq+oTK
	 M4ZZNhf5dxoqKp6CcxMjP00c9zsj5SDyEdYJTKZtXIbBbV/+A7+0Ac+l2Qgvf8cTW
	 NpMUz4o7V5ENvgKYV1i6nFybJS++AVJHgwjVe04U8HfWS0ZPJ8tZBbDPYMxFpkToi
	 MXgvPV87ZVV+SsghXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGyxN-1tw0gX1mQl-008hKK; Thu, 03
 Apr 2025 03:40:14 +0200
Message-ID: <d5920e7b-2e5e-4958-b7e4-5e1395aa0e24@gmx.de>
Date: Thu, 3 Apr 2025 03:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data 01
 WMI Driver
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
 <20250317144326.5850-5-derekjohn.clark@gmail.com>
 <de122cb5-e245-43e9-8bd7-2fcff1426203@gmx.de>
 <CAFqHKT=6iKG4UmF2-PUESCDDnLcgzon5Z3UqJd+vNrXLXf9CSQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=6iKG4UmF2-PUESCDDnLcgzon5Z3UqJd+vNrXLXf9CSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nMbbHgZ5reRVKq8WBdcBxnwSH7sBiwiIpHoaNGAlm2o0DnyHSds
 lPpLGO7Z4CGDhc+KSU3i5pgWx17VB+zFH3Mz/glwe7N+yh+AzibVWFhObm1fTTOWs4rs8hu
 n+FHCcJv7KwGZm4Ij9KqSKoeQD+kmbwcjz5BnYd7SWvoV7OoxWNOhCOsuGkipnIpynQPfHc
 Z2mukPoZWP8SRxvjRExew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jGIiQEI7ogs=;BSrLYf6Sb8LxqJapn9T8oN5Iu6O
 qaZgJb/GQV3XkPSRlRAsDCpUBt2pkNWQDOZ70PNReTwRCASxrgZjtSbSPzwrL5PPyr576Mhtk
 94XP7kGLMSv7qw8Od5CmF2T3JsQXa/yfBuXDCtbDa/meb52VK1HkdHzvONJemYapO4mjU53aX
 pZ3VPIF3/VxPsFpS4opCVyiLDBTy0cT9CLxA3g6nLpmMa5Y25CglpIBPm/tVLJdTeXKXoHzsP
 bnAxz3u6i+FOL6xu/DPL2F6G1A9vFWQYRS+l33PpbptDLeK32Xp+SIFNb8PjoPr42XQCdMN9W
 6xrXtQg7KeoYTz4oM3x4D3lqoogmRjp/tZFnc4dOksS15UHLwR5e1wecSJ+frQmmiX88UhQxR
 WFKQ2T4YXtQ6nQxAgWEjXy6WbhxTjomNQ7tbnk0F7Zc91rfgKOujLRg7s5gBu4TNyKYxiJpxG
 TV8upn9oK/Ylg/g9IiNiOHqRnO36bVCPNVEmbH55US2YoljTdoTzfdXCRR4E5J2A5p29788yQ
 gZejcGqoatQFVQhb5AEb6MYcW7+iK1sU+7Q6OrECEfScLsRzpERdhCgQ9G7ds5QPD78mHWcfK
 qFf1iFPMdXISLnFPLmZ2pQHD3dQq7zxbRejMMG4sX3SjrkC1QtHW4mfQ9DlUgyECwfmUNdnAl
 HDOlLulsUh7ko13+lx6BBFdtCqKTnZmwH396jS8mGuG3+BACNnbkM0wfz2uayiewoG3oWKvIQ
 VCipO/qKXxB43seV94AO5gtlMJh4pPI3YQJWaijasOF+FeRd46VOvkA2KWMdKN+DqbZsgvCUw
 C+vq3iWNUeCTHc2aJqm2kbxC4Lvj9CkW6UuLjlCTiHoS7aLOrtJ8QWuRl5mZ3TnWWO0wQEKml
 SfRxqI9jBc/+A1uoJlRQebThrn4SUW3a8Gr+/5DZDr5dUyfh7xAxldG0V7LnjOnhNSLdz5AS4
 mLOLImiFEKAdJTGghOxQr4iPa/pD2mdRvtVhJ4AwHtbBUoeEz010bF3EVGIh6KvBJ+fHXajHU
 9JxUDxkaK4a/SSLHywRWo6baIdSZBtmODQ6tKf2dsmDgM6masLX2F4ZWEABFobG2iYyjCnGPV
 JPgPe8ytG2eDSWSkVIg9G3r4jsET1Iq3ohePd/aVimPqRfdF634Hgq2x79AHt5Tx59nOYdOyb
 XgHIskAhfDhscCNQNCpNo2wNlRh60Chq4M0QG+60hbtBnXggd4Ph0TL9dB34bqj7g6r1mujge
 GIgVIQZtF6MtIHZELlyWcTZq+oCiTA0pkuXpGjKsl9g1dKFzxWoAkUHFE9DdfQ0yKEtuo/ytS
 77hE5vdTbx/nkprUlA5Fb9bwv0c+F7rKGOnraDtmZ9CRaXxTjv3jsbM8KCa7SIPEeW6hEBGeK
 CNo6Ba5ChASmTRcU6SHIzuuFICAniSz/eUf7Jas4R/xFRwGzPIVbEWVcp476H3BSFogw7PK3F
 2pDzgMsdPEn85H4cIQgpGMVtfUv0=

Am 02.04.25 um 22:47 schrieb Derek John Clark:

> On Wed, Mar 26, 2025 at 6:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
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
>>> ---
>>>    MAINTAINERS                                 |   2 +
>>>    drivers/platform/x86/Kconfig                |   4 +
>>>    drivers/platform/x86/Makefile               |   1 +
>>>    drivers/platform/x86/lenovo-wmi-capdata01.c | 136 +++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
>>>    5 files changed, 172 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 6dde75922aaf..56ead241a053 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
>>>    S:  Maintained
>>>    F:  Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>>    F:  Documentation/wmi/devices/lenovo-wmi-other.rst
>>> +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
>>> +F:   drivers/platform/x86/lenovo-wmi-capdata01.h
>>>    F:  drivers/platform/x86/lenovo-wmi-events.c
>>>    F:  drivers/platform/x86/lenovo-wmi-events.h
>>>    F:  drivers/platform/x86/lenovo-wmi-helpers.c
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
>>>    config IDEAPAD_LAPTOP
>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>        depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index fc039839286a..7a35c77221b7 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
>>>    obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
>>>    obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-=
fastcharger.o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
>>> +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
>>>    obj-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D lenovo-wmi-events.o
>>>    obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
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
>>> + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface pr=
ovides
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
>>> +#include "lenovo-wmi-capdata01.h"
>> Hi,
>>
>> please also include linux/acpi.h, linux/export.h and linux/module.h.
>>
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
>> /* -> /**
>>
>>> + * lenovo_cd01_component_bind() - On master bind, caches all capabili=
ty data on
>>> + * the master device.
>>> + * @cd01_dev: Pointer to the capability data 01 parent device.
>>> + * @om_dev: Pointer to the other mode parent device.
>>> + * @data: capdata01_list object pointer to return the capability data=
 with.
>>> + *
>>> + * Returns: 0, or an error.
>>> + */
>>> +static int lenovo_cd01_component_bind(struct device *cd01_dev,
>>> +                                   struct device *om_dev, void *data)
>>> +{
>>> +     struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
>>> +     int count, idx;
>>> +
>>> +     if (!priv)
>>> +             return -ENODEV;
>> This check is unnecessary, please drop.
>>
> Acked
>
>>> +
>>> +     count =3D wmidev_instance_count(priv->wdev);
>>> +
>>> +     if (count =3D=3D 0)
>>> +             return -EINVAL;
>> The WMI driver core already ensures that WMI devices with 0 instances a=
re
>> rejected. Please drop this check.
>>
> Good to know, thanks.
>
>>> +
>>> +     ((struct cd01_list *)data)->count =3D count;
>>> +     ((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev, =
count,
>>> +                                                           sizeof(str=
uct capdata01 *),
>>> +                                                           GFP_KERNEL=
);
>> Two things:
>>
>>    - using a local variable with a type of struct cd01_list * results i=
n cleaner source code here
>>
>>    - using devres is not possible inside the component callbacks, since=
 the lifetime of the component
>>      device is not necessarily tied to the lifetime of the underlying d=
evice.
>>
>> I suggest you move the whole WMI data querying into lwmi_cd01_probe(), =
because then you can keep using
>> devres.
>>
> Doing this in probe() puts the list on lwmi_cd01_priv. Should I copy
> that data on bind, or pass back a pointer to the cd01 device struct
> and use an exported function on cd01 and dev_get_drvdata to access
> priv->list->data[idx] when needed? I prefer the latter as this avoids
> needing to do devm memory allocation in component/master binds, then I
> can check for NULL when accessing and clear the pointer on
> master_unbind to avoid calling to a removed device driver.

Passing a pointer is OK, but please only pass a pointer to the struct cd01=
_list itself,
not the full cd01 device struct. Maybe you can also add a comment explaini=
ng that this
pointer will become invalid when unbinding from the component.

Explicitly NULL-ing this pointer upon unbinding seems unnecessary to me.

> (snip)
>
>>> +struct cd01_list {
>>> +     struct capdata01 **data;
>>> +     int count;
>>> +};
>> In order to save memory you could try something like this:
>>
>> struct cd01_list {
>>          size_t count;
>>          struct capdata01 data[];
>> };
>>
>> This way you
>>
>> 1. Avoid the memory fragmentation resulting from multiple memory alloca=
tions.
>>
>> 2. Omit two pointers when accessing the data.
>>
>> You can use struct_size() from linux/overflow.h to calculate the size o=
f such
>> an array with a trailing flexible array.
>>
>> Thanks,
>> Armin Wolf
>>
> I think I have this part working in my branch. Using devm_kzalloc also
> allows me to omit manually setting NULL in a few cases, which is
> cleaner. Is it preferred to use struct_size() directly in the
> devm_kzalloc call, or create a separate `size` variable to set the
> result to and pass that into the function?
>
> - Derek
>
In most cases using struct_size() directly inside the devm_kzalloc() call =
is preferred.

Thanks,
Armin Wolf

>>> +
>>> +int lwmi_cd01_match(struct device *dev, void *data);
>>> +
>>> +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
