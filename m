Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC9215799;
	Tue, 11 Feb 2025 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282449; cv=none; b=OWVMX5iRmmmYIEy+UciYJnkeNWVwT0JylDDPfuPvX4D5kL8sJvvfsbq7g3ubxSTCrt4VJ236pxC0BP7+Uy8hVFQG04UGu+fz1uOQ0vupb/SDdBSS7TDm77SMvtYxNd56v00dwoEtMwwGuzWE9iNZP0VyFL5LHv6x6+xErvFcI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282449; c=relaxed/simple;
	bh=iDVNO0kAFQl6rxuPhnIsT/KM6kONFRIqdkdalEUXP1E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OMfb5B6j/piTA3OqwXZzv6fTgEUvEWrLjaLxPSPjiZh7ssvG41NAWFXEyvXGkvzUB65gQ4SxKRWccCPcZdeZKZ1NsfDfVd1X6pYD64VBlcIgPYqPlxprkLa49CNjA0RHeIWc/udhGpYDRXP4nwrFiFcTK8fMegaK1MbqsgzH8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc3MXLng; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc3MXLng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739282447; x=1770818447;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iDVNO0kAFQl6rxuPhnIsT/KM6kONFRIqdkdalEUXP1E=;
  b=Tc3MXLngIhYUaNBYb86Aave0ocq9lm7+vkxHxMnfPMsVQenZwcHL8APN
   x/Kvvp1WUVsf8GQwAaK2HqP9lyJff1BLNJR6yRCJUa8n5wBoFvThc/qI7
   4HEmNIUTsF59u669EnWIX9Q/ymIV4fXnQvFSDELyt7m0nn/XfnXLI58uw
   LY8CTnm2BQzQV5mCp7vQJ3lK57ULxr6fBe4mCeDuG7Cc43Qp9brdG/qSf
   2YleRSlOoAf1T24WyOVkBR21KNFm6Sg4MYgqbK1/86AbhSn/DhPFPAnMP
   4cRwIGOG5+u+1F4bZtl0Vsz5Uya7XbA8m2PRbrxLjmalkxY8D0L7tuzBI
   Q==;
X-CSE-ConnectionGUID: HQNcJzmXSV65qbvF5ZCCZw==
X-CSE-MsgGUID: sG1TqcRgTWSQf9B2AufF5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43661449"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43661449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:00:45 -0800
X-CSE-ConnectionGUID: /tPnEJf3SlO1L0bxuCA67g==
X-CSE-MsgGUID: qOQnG/dMTQ+hyVfF1F6ITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143437096"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:00:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 16:00:31 +0200 (EET)
To: Jackie Dong <xy-jackie@139.com>
cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, dongeg1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] platform/x86: lenovo-super-hotkey-wmi.c: Support
 formic and audio mute LEDs
In-Reply-To: <437086da-f14e-474a-ac4b-9a235ab89d18@139.com>
Message-ID: <5dd6d08b-33eb-f74d-e3b1-d1380ad25565@linux.intel.com>
References: <20250208144114.11685-1-xy-jackie@139.com> <59c73f9e-2b3c-0a52-3328-257dcbb52a90@linux.intel.com> <437086da-f14e-474a-ac4b-9a235ab89d18@139.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-649789600-1739282431=:4237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-649789600-1739282431=:4237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Feb 2025, Jackie Dong wrote:

> On 2/10/25 18:45, Ilpo J=C3=A4rvinen wrote:
> > On Sat, 8 Feb 2025, Jackie Dong wrote:
> >=20
> > > Implement Lenovo utility data WMI calls needed to make LEDs
> > > work on Ideapads that support this GUID.
> > > This enables the mic and audio LEDs to be updated correctly.
> > >=20
> > > Tested on below samples.
> > > ThinkBook 13X Gen4 IMH
> > > ThinkBook 14 G6 ABP
> > > ThinkBook 16p Gen4-21J8
> > > ThinkBook 16p Gen8-IRL
> > > ThinkBook 16p G7+ ASP
> > >=20
> > > Signed-off-by: Jackie Dong <xy-jackie@139.com>
> > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > ---
> > > Changes in v3:
> > >   - Changed the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI
> > >   - Renamed everything in this driver which contains the name "ideapa=
d"
> > >     to instead contain the name of this driver.
> > >   - Moved struct wmi_device *led_wdev in lenovo_super_hotkey_wmi_priv=
ate,
> > >     and use container_of() to the led_wdev pointer.
> > >   - Replaced sizeof(struct wmi_led_args) by sizeof(led_arg)
> > >   - Added condtions checking for obj && obj->type =3D=3D ACPI_TYPE_IN=
TEGER
> > >     and free the ACPI object after get the required value.
> > >   - Removed led_classdev_unregister() after led_reg_failed label, but
> > >     add lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev) to fr=
ee
> > >     resource.
> > >   - Removed IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KEYS rela=
ted
> > >     source codes and only keep LUD_WMI_METHOD_GUID.
> > >=20
> > > Changes in v2:
> > >   - Update code layout and formatting as recommended in review
> > >   - Improved error handling in ideapad_wmi_led_init
> > >   - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
> > >     ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.
> > >=20
> > >   drivers/platform/x86/Kconfig                  |   9 +
> > >   drivers/platform/x86/Makefile                 |   1 +
> > >   .../platform/x86/lenovo-super-hotkey-wmi.c    | 248 +++++++++++++++=
+++
> > >   3 files changed, 258 insertions(+)
> > >   create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c
> > >=20
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index 0258dd879d64..c1792e8f04e1 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
> > >   =09  This is a driver for Lenovo IdeaPad netbooks contains drivers =
for
> > >   =09  rfkill switch, hotkey, fan control and backlight control.
> > >   +config LENOVO_SUPER_HOTKEY_WMI
> > > +=09tristate "Lenovo Super Hotkey Utility WMI extras driver"
> > > +=09depends on ACPI_WMI
> > > +=09depends on IDEAPAD_LAPTOP
> > > +=09help
> > > +=09  This driver provides WMI support for Lenovo customized hotkeys
> > > function
> > > +=09  of Lenovo NoteBooks which are for Consumer and SMB customers, s=
uch
> > > as
> > > +=09  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.
> > > +
> > >   config LENOVO_YMC
> > >   =09tristate "Lenovo Yoga Tablet Mode Control"
> > >   =09depends on ACPI_WMI
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> > > index e1b142947067..598335da9f55 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
> > >   # IBM Thinkpad and Lenovo
> > >   obj-$(CONFIG_IBM_RTL)=09=09+=3D ibm_rtl.o
> > >   obj-$(CONFIG_IDEAPAD_LAPTOP)=09+=3D ideapad-laptop.o
> > > +obj-$(CONFIG_LENOVO_SUPER_HOTKEY_WMI)=09+=3D lenovo-super-hotkey-wmi=
=2Eo
> > >   obj-$(CONFIG_LENOVO_YMC)=09+=3D lenovo-ymc.o
> > >   obj-$(CONFIG_SENSORS_HDAPS)=09+=3D hdaps.o
> > >   obj-$(CONFIG_THINKPAD_ACPI)=09+=3D thinkpad_acpi.o
> > > diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> > > b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> > > new file mode 100644
> > > index 000000000000..e677bd11fa2f
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> > > @@ -0,0 +1,248 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> > > + *
> > > + *  Copyright (C) 2025=09Lenovo
> > > + */
> > > +
> > > +#include <linux/leds.h>
> > > +#include <linux/wmi.h>
> > > +#include "ideapad-laptop.h"
> >=20
> > Add an empty line before the local includes.
> Hi Ilpo,
>    Thanks for your review and comments.
>    I'll update it in next version patch.
> >=20
> > > +
> > > +/* Lenovo Super Hotkey WMI GUIDs */
> > > +#define LUD_WMI_METHOD_GUID=09"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
> > > +
> > > +/* Lenovo Utility Data WMI method_id */
> > > +#define WMI_LUD_GET_SUPPORT 1
> > > +#define WMI_LUD_SET_FEATURE 2
> > > +
> > > +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> > > +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> > > +
> > > +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> > > +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> > > +
> > > +/* Input parameters to mute/unmute audio LED and Mic LED */
> > > +struct wmi_led_args {
> > > +=09u8 id;
> > > +=09u8 subid;
> > > +=09u16 value;
> > > +};
> > > +
> > > +/* Values of input parameters to SetFeature of audio LED and Mic LED=
 */
> > > +enum hotkey_set_feature {
> > > +=09MIC_MUTE_LED_ON =3D 1,
> > > +=09MIC_MUTE_LED_OFF,
> > > +=09AUDIO_MUTE_LED_ON =3D 4,
> > > +=09AUDIO_MUTE_LED_OFF,
> > > +};
> > > +
> > > +#define LSH_ACPI_LED_MAX 2
> > > +
> > > +enum lenovo_super_hotkey_wmi_event_type {
> > > +=09LSH_WMI_EVENT_LUD_KEYS =3D 2,
> > > +};
> > > +
> > > +struct lenovo_super_hotkey_wmi_private {
> > > +=09enum lenovo_super_hotkey_wmi_event_type event;
> > > +=09struct led_classdev cdev[LSH_ACPI_LED_MAX];
> > > +=09struct wmi_device *led_wdev;
> > > +};
> > > +
> > > +enum mute_led_type {
> > > +=09MIC_MUTE,
> > > +=09AUDIO_MUTE,
> > > +};
> > > +
> > > +static int lsh_wmi_mute_led_set(enum mute_led_type led_type, struct
> > > led_classdev *led_cdev,
> > > +=09=09=09=09enum led_brightness brightness)
> > > +
> > > +{
> > > +=09struct lenovo_super_hotkey_wmi_private *wpriv =3D container_of(le=
d_cdev,
> > > +=09=09=09struct lenovo_super_hotkey_wmi_private,
> > > cdev[led_type]);
> > > +=09struct wmi_led_args led_arg =3D {0, 0, 0};
> > > +=09struct acpi_buffer input;
> > > +=09acpi_status status;
> > > +
> > > +=09switch (led_type) {
> > > +=09case MIC_MUTE:
> > > +=09=09led_arg.id =3D brightness =3D=3D LED_ON ? MIC_MUTE_LED_ON :
> > > MIC_MUTE_LED_OFF;
> > > +=09=09break;
> > > +=09case AUDIO_MUTE:
> > > +=09=09led_arg.id =3D brightness =3D=3D LED_ON ? AUDIO_MUTE_LED_ON :
> > > AUDIO_MUTE_LED_OFF;
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -EINVAL;
> > > +=09}
> > > +
> > > +=09input.length =3D sizeof(led_arg);
> > > +=09input.pointer =3D &led_arg;
> > > +=09status =3D wmidev_evaluate_method(wpriv->led_wdev, 0,
> > > WMI_LUD_SET_FEATURE, &input, NULL);
> > > +=09if (ACPI_FAILURE(status))
> > > +=09=09return -EIO;
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int lsh_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> > > +=09=09=09=09     enum led_brightness brightness)
> > > +
> > > +{
> > > +=09return lsh_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
> > > +}
> > > +
> > > +static int lsh_wmi_micmute_led_set(struct led_classdev *led_cdev,
> > > +=09=09=09=09   enum led_brightness brightness)
> > > +{
> > > +=09return lsh_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
> > > +}
> > > +
> > > +static int lenovo_super_hotkey_wmi_led_init(enum mute_led_type led_t=
ype,
> > > struct device *dev)
> > > +{
> > > +=09struct lenovo_super_hotkey_wmi_private *wpriv =3D dev_get_drvdata=
(dev);
> > > +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > > +=09struct acpi_buffer input;
> > > +=09union acpi_object *obj;
> > > +=09int led_version, err =3D 0;
> > > +=09unsigned int wmiarg;
> > > +=09acpi_status status;
> > > +
> > > +=09switch (led_type) {
> > > +=09case MIC_MUTE:
> > > +=09=09wmiarg =3D WMI_LUD_GET_MICMUTE_LED_VER;
> > > +=09=09break;
> > > +=09case AUDIO_MUTE:
> > > +=09=09wmiarg =3D WMI_LUD_GET_AUDIOMUTE_LED_VER;
> > > +=09=09break;
> > > +=09default:
> > > +=09=09return -EINVAL;
> > > +=09}
> > > +
> > > +=09input.length =3D sizeof(wmiarg);
> > > +=09input.pointer =3D &wmiarg;
> > > +=09status =3D wmidev_evaluate_method(wpriv->led_wdev, 0,
> > > WMI_LUD_GET_SUPPORT, &input, &output);
> > > +=09if (ACPI_FAILURE(status))
> > > +=09=09return -EIO;
> > > +
> > > +=09obj =3D output.pointer;
> > > +=09if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> > > +=09=09led_version =3D obj->integer.value;
> > > +=09=09kfree(output.pointer);
> > > +=09} else {
> > > +=09=09err =3D -EIO;
> > > +=09=09goto led_error;
> > > +=09}
> > > +
> > > +=09wpriv->cdev[led_type].max_brightness =3D LED_ON;
> > > +=09wpriv->cdev[led_type].dev =3D dev;
> > > +=09wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> > > +
> > > +=09switch (led_type) {
> > > +=09case MIC_MUTE:
> > > +=09=09if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> > > +=09=09=09err =3D -EIO;
> > > +=09=09=09goto led_error;
> > > +=09=09}
> > > +=09=09wpriv->cdev[led_type].name =3D "platform::micmute";
> > > +=09=09wpriv->cdev[led_type].brightness_set_blocking =3D
> > > &lsh_wmi_micmute_led_set;
> > > +=09=09wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> > > +
> > > +=09=09err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]=
);
> > > +=09=09if (err < 0)
> > > +=09=09=09goto led_reg_failed;
> > > +
> > > +=09=09break;
> > > +=09case AUDIO_MUTE:
> > > +=09=09if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> > > +=09=09=09err =3D -EIO;
> > > +=09=09=09goto led_error;
> > > +=09=09}
> > > +=09=09wpriv->cdev[led_type].name =3D "platform::mute";
> > > +=09=09wpriv->cdev[led_type].brightness_set_blocking =3D
> > > &lsh_wmi_audiomute_led_set;
> > > +=09=09wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> > > +
> > > +=09=09err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]=
);
> > > +=09=09if (err < 0)
> > > +=09=09=09goto led_reg_failed;
> > > +
> > > +=09=09break;
> > > +=09default:
> > > +=09=09err =3D -EINVAL;
> > > +=09=09dev_err(dev, "Unknown LED type %d\n", led_type);
> >=20
> > Add include.
> For this comment, I understand that it need to add include for dev_err().=
 If
> so, my comments is below. If you think that it still need to add the incl=
ude
> include/linux/dev_printk.h, pls comfirm it again, I'll add it in next ver=
sion
> patch.
> dev_err() is defined in include/linux/dev_printk.h which is included by
> include/linux/device.h which is included by include/linux/wmi.h which is
> included by this file as below.

Hi,

Even if there's an indirect include path through other headers, you should=
=20
include linux/dev_printk.h also here. There's nothing fundamendal that=20
requires device.h to include dev_printk.h even if it currently does so=20
relying on these indirect includes is fragile (and hopefully somebody=20
eventually cleans up the entire include mess).

Same applies to the other case I marked below so please add those as=20
well.

There are some guaranteed include paths through another header and=20
I normally won't flag those, e.g., wmi.h will always have to include=20
device.h because struct device resides within struct wmi_device (it won't=
=20
build at all if device.h include is removed from wmi.h unless something=20
else by chance included device.h before wmi.h).

--=20
 i.

> >> @@ -0,0 +1,248 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> >> + *
> >> + *  Copyright (C) 2025=09Lenovo
> >> + */
> >> +
> >> +#include <linux/leds.h>
> >> +#include <linux/wmi.h>
>=20
> >=20
> > > +=09=09goto led_error;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +
> > > +led_reg_failed:
> > > +=09dev_err(dev, "Could not register mute LED %d : %d\n", led_type, e=
rr);
> > > +
> > > +led_error:
> > > +=09kfree(obj);
> >=20
> > Add include.
> For this comment, I understand that it need to add include for kfree(). I=
f so,
> my comments is below. If you think that it still need to add the include
> include/linux/slab.h, pls comfirm it again, I'll add it in next version p=
atch
> or change to another function.
> kfree() is defined in include/linux/slab.h and the include chain is below=
=2E
> include/linux/slab.h -> include/acpi/platform/aclinux.h ->
> include/acpi/platform/acenv.h -> include/linux/acpi.h ->
> include/linux/wmi.h
>  and wmi.h is included by this file as below.
>
> >> @@ -0,0 +1,248 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> >> + *
> >> + *  Copyright (C) 2025=09Lenovo
> >> + */
> >> +
> >> +#include <linux/leds.h>
> >> +#include <linux/wmi.h>
>=20
> >=20
> > > +=09return err;
> > > +}
> > > +
> > > +static void lenovo_super_hotkey_wmi_leds_setup(struct device *dev)
> > > +{
> > > +=09lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev);
> > > +=09lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev);
> > > +}
> > > +
> > > +static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, co=
nst
> > > void *context)
> > > +{
> > > +=09struct lenovo_super_hotkey_wmi_private *wpriv;
> > > +
> > > +=09wpriv =3D devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
> > > +=09if (!wpriv)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09*wpriv =3D *(const struct lenovo_super_hotkey_wmi_private *)conte=
xt;
> > > +
> > > +=09dev_set_drvdata(&wdev->dev, wpriv);
> > > +
> > > +=09if (wpriv->event =3D=3D LSH_WMI_EVENT_LUD_KEYS) {
> > > +=09=09wpriv->led_wdev =3D wdev;
> > > +=09=09lenovo_super_hotkey_wmi_leds_setup(&wdev->dev);
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static void lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev)
> > > +{
> > > +=09struct lenovo_super_hotkey_wmi_private *wpriv =3D
> > > dev_get_drvdata(&wdev->dev);
> > > +=09unsigned int i;
> > > +
> > > +=09for (i =3D 0; i < LSH_ACPI_LED_MAX; i++)
> > > +=09=09led_classdev_unregister(&wpriv->cdev[i]);
> > > +
> > > +=09kfree(wpriv);
> > > +}
> > > +static const struct lenovo_super_hotkey_wmi_private
> > > lsk_wmi_context_lud_keys =3D {
> > > +=09.event =3D LSH_WMI_EVENT_LUD_KEYS
> > > +};
> > > +
> > > +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[]=
 =3D {
> > > +=09{ LUD_WMI_METHOD_GUID, &lsk_wmi_context_lud_keys }, /* Utility da=
ta */
> > > +=09{ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
> >=20
> > Add include.
> For this comment, I understand that it need to add include for
> MODULE_DEVICE_TABLE(). If so, my comment is below. If you think that it s=
till
> need to add the include/linux/module.h, pls comfirm it again, I'll add it=
 in
> next version patch.
> MODULE_DEVICE_TABLE() is defined in include/linux/module.h which is inclu=
ded
> by include/linux/acpi.h which is included by include/linux/wmi.h which is
> included by this file as below.
>=20
> >> @@ -0,0 +1,248 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> >> + *
> >> + *  Copyright (C) 2025=09Lenovo
> >> + */
> >> +
> >> +#include <linux/leds.h>
> >> +#include <linux/wmi.h>
>=20
>=20
> >=20
> > > +static struct wmi_driver lenovo_super_hotkey_wmi_driver =3D {
> > > +=09 .driver =3D {
> > > +=09=09 .name =3D "lenovo_super_hotkey_wmi",
> > > +=09=09 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS
> > > +=09 },
> > > +=09 .id_table =3D lenovo_super_hotkey_wmi_id_table,
> > > +=09 .probe =3D lenovo_super_hotkey_wmi_probe,
> > > +=09 .remove =3D lenovo_super_hotkey_wmi_remove,
> > > +=09 .no_singleton =3D true,
> > > +};
> > > +
> > > +module_wmi_driver(lenovo_super_hotkey_wmi_driver);
> > > +
> > > +MODULE_INFO(depends, "wmi,ideapad-laptop");
> > > +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
> > > +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
> > > +MODULE_LICENSE("GPL");
> > >=20
> >=20
>=20
>=20
--8323328-649789600-1739282431=:4237--
