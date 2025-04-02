Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA551F236C;
	Wed,  2 Apr 2025 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627535; cv=none; b=RaLOcG3nsYEpkN1XfJawfpYpNucpR2IBh6Mk2hmDRMu9rA8qwXCxBRrSwWDhF0WHm8bFwyrQKf7HpO5P5wBSPogxA6/NeTK4NK0bgcnQcWSCJXs2h1WsaYtlhLeXvjFy25dsk2xriNSJwcdMnr3aQfYwx5YmXYn1PTSmUOSI+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627535; c=relaxed/simple;
	bh=r6TfDkY3Bnw1i8GkPZ/xmgoaU196OVIFO/09QWGEgYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmNVWIBEnzul6/kL+sc5qDRu5NzMl66L3T2yGNkx1f1lSwct+0clyX3+Ba0d75TVGZU/pPER90vK5GlbcDqaiKqmPn7OYHQz38znTRHPHMwvAm9RwpBckcXR0HtUavHdFVhyeOJ1w2cW3tRMAz97/nS1qj2JKcP1LI1WXk7GJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIdOJvBB; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIdOJvBB"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8efefec89so1721656d6.3;
        Wed, 02 Apr 2025 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627532; x=1744232332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr3t33Bo++Nkj/Us+FPoCDSAHyHDQcuW2IyJwsJ9UhU=;
        b=ZIdOJvBBVZcExuw/N94/vVC9PFnPzUfIv5cTpFAvhxG+Z3x9Gsh53K28B00lvyj5s6
         JWeoI6ztWY+q/PIUQa83WvwsdulMBFUlKkpGkecASmEwExl3bhiEiMZLe9X4aV0bs0Eh
         Yh8KCAJ6cwTi3zuYkVZZNsyu6uYidEkOWBgsy6rrRGFhNetkqCmqbdhpCoqIBmyW0GBi
         rmqiBrkGtiFdHc5VNmMk+ekuib8j3xFF6qdgu2eZr5LBzpcLEMSW5hjeOixwXttYXFhW
         yE8ULM5NP/zFlJ20CHgquA2gLuUgCh9+iZdtz6kQOmxsfCZoh3qmUjA6w2P9NiqlWh6+
         N7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627532; x=1744232332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jr3t33Bo++Nkj/Us+FPoCDSAHyHDQcuW2IyJwsJ9UhU=;
        b=C9Y7ymODkYoF23eHbMkZXx9lwXR8VgDhpGKaxpmNEkO0jtMsI+1Hjl06mpSySVNf2l
         jQDuMlp0jRSCg/rDKgbw4Nq4aXgCAEtgASH/pErN/rLQfbHYhhALTeJU8X/yCx59JcK0
         abimfHLQqCsdPGYy/I9CJMh3790I55SM8XQ/EYgTuFRiao28XNxYQNujQT/GmbWeTtmY
         K29Eop/vg0Tmkl2ogBp1DE/pmOc6SgsORe9CdhX9tTbI20QOfCOh03q/WabtZpt1rluX
         2SN0b/ow6V3nJTrYY6AUxMJ58mts8nWTipJENIapcs+cuuDX+hPrbzDgrPFIOR1gKgZ5
         kH6w==
X-Forwarded-Encrypted: i=1; AJvYcCURMOzwQlXKy1nHP6G/PIpLS0JPmYy94Gil7jejl2/tL7zGYcwJlEymFc9hRoaJHPMs3q81QkoiKaAHEH9d@vger.kernel.org, AJvYcCWOO6B9gvTDTYicsVNlZ3cukZkXr58HunmQL8dnBOAcGzEwaLuWshLjghwXpkC/YnY+/Tx0OEur5kc=@vger.kernel.org, AJvYcCXEstVdSr+FStIcwJ0yqUqtkUoQaDOi6mB+kY97EnboCeQHQQCk11ffl0/z0h4+/Xh0DcntLN+W6W8Nqc43vaeFs2/VPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFyfhSkXIHnVhvXWvqC9BIw44pnJH0v7KsqJX2nzxi78a8OCb5
	aKufWBd1NJ0JOPgRItJHsAyrws/vKkmgxK2wPzMbsTYVz8yuJV4agU/QyQ4WgXq16Ymr5FD6c3k
	dAHFluhik8uu6Jc9vXXgjFmt9EeI=
X-Gm-Gg: ASbGncuFw5QvIZg/8aCmxMqqop/KIKJexaIXqfIJvT0J95GjlYBOURBlbeaIQJ9rjsf
	QFO6J5Y5olclQYjHOYo5NcWEgHOw75wkBrFRpDl1zS32EXo5vp7Jarm+J5351WT+wUlcQWPfsrq
	o0aei73Jqv+kkAiWUOEAJ5m4fZvy4=
X-Google-Smtp-Source: AGHT+IHmCf6nYBq5Fe46mxl8g1DtKyHvufoWuS87sAwyk1PJ+T6y+t/iABPqpfP1/o9a5r/OU6OS+U1oUEPFdCW3K4s=
X-Received: by 2002:ad4:5bac:0:b0:6e6:6c7f:1116 with SMTP id
 6a1803df08f44-6eef5e461d5mr123145926d6.24.1743627532061; Wed, 02 Apr 2025
 13:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-7-derekjohn.clark@gmail.com> <b293a4a3-f759-4b47-a48d-da4a740f52e1@gmx.de>
In-Reply-To: <b293a4a3-f759-4b47-a48d-da4a740f52e1@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 13:58:39 -0700
X-Gm-Features: AQ5f1Jr3f3JwQn0_FXCgG_kQj__ht6OqaiIqkDHo_twl3zmOrQhEDM8eBeGeTZQ
Message-ID: <CAFqHKT=Tpq9tEmyU10AJL2ruwTGSgoJTf38dRjMCt=9PFRVAxw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI Driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 8:49=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>
> > Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> > interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> > platform profiles over WMI.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> > - Add notifier blocks for the Events and Other Mode drivers.
> > - Remove notifier block chain head and all reference to Thermal Mode
> >    Event GUID.
> > - Add header for Gamezone specific structs and functions.
> > - Various fixes from review.
> > v3:
> > - Use notifier chain to report platform profile changes to any
> >    subscribed drivers.
> > - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifier
> >    chain.
> > - Adds support for Extreme Mode profile on supported hardware, as well
> >    as a DMI quirk table for some devices that report extreme mode versi=
on
> >    support but so not have it fully implemented.
> > - Update to include recent changes to platform-profile.
> > v2:
> > - Use devm_kmalloc to ensure driver can be instanced, remove global
> >    reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> > - Remove GZ_WMI symbol exporting.
> > ---
> >   MAINTAINERS                                |   2 +
> >   drivers/platform/x86/Kconfig               |  13 +
> >   drivers/platform/x86/Makefile              |   1 +
> >   drivers/platform/x86/lenovo-wmi-gamezone.c | 380 ++++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
> >   5 files changed, 414 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 87daee6075ad..0416afd997a0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13168,6 +13168,8 @@ F:    drivers/platform/x86/lenovo-wmi-capdata01=
.c
> >   F:  drivers/platform/x86/lenovo-wmi-capdata01.h
> >   F:  drivers/platform/x86/lenovo-wmi-events.c
> >   F:  drivers/platform/x86/lenovo-wmi-events.h
> > +F:   drivers/platform/x86/lenovo-wmi-gamezone.c
> > +F:   drivers/platform/x86/lenovo-wmi-gamezone.h
> >   F:  drivers/platform/x86/lenovo-wmi-helpers.c
> >   F:  drivers/platform/x86/lenovo-wmi-helpers.h
> >   F:  drivers/platform/x86/lenovo-wmi-other.c
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index fc47604e37f7..ecf3246c8fda 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -467,6 +467,19 @@ config LENOVO_WMI_HELPERS
> >       tristate
> >       depends on ACPI_WMI
> >
> > +config LENOVO_WMI_GAMEZONE
> > +     tristate "Lenovo GameZone WMI Driver"
> > +     depends on ACPI_WMI
>
> Hi,
>
> please add a "depends on DMI" here.
>

Acked

> > +     select ACPI_PLATFORM_PROFILE
> > +     select LENOVO_WMI_EVENTS
> > +     select LENOVO_WMI_HELPERS
> > +     help
> > +       Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> > +       platform-profile firmware interface to manage power usage.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called lenovo-wmi-gamezone.
> > +
> >   config LENOVO_WMI_DATA01
> >       tristate
> >       depends on ACPI_WMI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index c6ce3c8594b1..f3e64926a96b 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-=
tab2-pro-1380-fastcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> >   obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
> >   obj-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D lenovo-wmi-events.o
> > +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
> >   obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
> >   obj-$(CONFIG_LENOVO_WMI_TUNING)     +=3D lenovo-wmi-other.o
> >
> > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platf=
orm/x86/lenovo-wmi-gamezone.c
> > new file mode 100644
> > index 000000000000..9d453a836227
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> > @@ -0,0 +1,380 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo GameZone WMI interface driver. The GameZone WMI interface pr=
ovides
> > + * platform profile and fan curve settings for devices that fall under=
 the
> > + * "Gaming Series" of Lenovo Legion devices.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/dmi.h>
> > +#include <linux/list.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_profile.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
>
> Please also include linux/acpi.h, linux/export.h and linux/module.h.
>
> > +
> > +#include "lenovo-wmi-events.h"
> > +#include "lenovo-wmi-gamezone.h"
> > +#include "lenovo-wmi-helpers.h"
> > +#include "lenovo-wmi-other.h"
> > +
> > +/* Interface GUIDs */
> > +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > +
> > +/* Method IDs */
> > +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> > +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> > +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> > +
> > +static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
> > +
> > +struct lwmi_event_priv {
> > +     enum thermal_mode current_mode;
> > +     struct wmi_device *wdev;
> > +     bool extreme_supported;
> > +     struct device *ppdev; /*platform profile device */
> > +     struct notifier_block event_nb;
> > +     struct notifier_block mode_nb;
> > +};
> > +
> > +struct quirk_entry {
> > +     bool extreme_supported;
> > +};
> > +
> > +static struct quirk_entry quirk_no_extreme_bug =3D {
> > +     .extreme_supported =3D false,
> > +};
> > +
> > +/* Notifier Methods */
> > +/*
>
> /* -> /**, same goes for the other kernel doc comments.
>
> > + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other notifier
> > + * block call chain. For THERMAL_MODE_EVENT, returns current_mode
> > + *
> > + * @nb: The notifier_block registered to lenovo-wmi-other
> > + * @cmd: The event triggered by lenovo-wmi-other
> > + * @data: The data to be returned by the event.
> > + *
> > + * Returns: notifier_block status.
> > + */
> > +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long =
cmd,
> > +                          void *data)
> > +{
> > +     struct lwmi_event_priv *priv;
> > +
> > +     priv =3D container_of(nb, struct lwmi_event_priv, mode_nb);
> > +     if (!priv)
> > +             return NOTIFY_BAD;
> > +
> > +     switch (cmd) {
> > +     case THERMAL_MODE_EVENT:
>
> I think it would be better to have a separate command code (maybe GAMEZON=
E_GET_THERMAL_MODE) for this
> kind of request. Maybe you can define a separate enum for that?
>

I originally had two enums for this but it seemed redundant. TBS this
is probably a better idea as the spec has two different event types
for thermal mode events (one is a buffer with additional data) and
getting the thermal mode from GZ would be agnostic from the events
that are triggered.

> > +             *(enum thermal_mode *)data =3D priv->current_mode;
>
> I think you need to protect this variable from concurrent accesses. Maybe=
 a spinlock would
> be suitable here?
>

Acked

> > +             break;
>
> Please return NOTIFY_STOP here to prevent the notifier call chain from ca=
lling further.
>

Acked

> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +/*
> > + * lwmi_gz_event_call() - Call method for lenovo-wmi-events notifier
> > + * block call chain. For THERMAL_MODE_EVENT, sets current_mode and
> > + * notifies platform_profile of a change.
> > + *
> > + * @nb: The notifier_block registered to lenovo-wmi-events
> > + * @cmd: The event triggered by lenovo-wmi-events
> > + * @data: The data to be updated by the event.
> > + *
> > + * Returns: notifier_block status.
> > + */
> > +static int lwmi_gz_event_call(struct notifier_block *nb, unsigned long=
 cmd,
> > +                           void *data)
> > +{
> > +     struct lwmi_event_priv *priv;
> > +
> > +     priv =3D container_of(nb, struct lwmi_event_priv, event_nb);
> > +     if (!priv)
> > +             return NOTIFY_BAD;
>
> This check is unnecessary, please drop it?
>

Will do

> > +
> > +     switch (cmd) {
> > +     case THERMAL_MODE_EVENT:
> > +             priv->current_mode =3D *((enum thermal_mode *)data);
>
> You do not need to explicitly cast void pointers. Also please validate th=
at the event data
> is actually a valid thermal mode. This check should IMHO happen inside th=
e event driver itself.
>
> > +             platform_profile_notify(&priv->wdev->dev);
>
> You are supposed to pass the platform profile device as the argument.
>

That makes more sense. I'll correct this, thanks.

> > +             break;
> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +/* Platform Profile Methods & Setup */
> > +/*
> > + * lwmi_gz_platform_profile_supported() - Gets the version of the WMI
> > + * interface to determine the support level.
> > + *
> > + * @wdev: The Gamezone WMI device.
> > + * @supported: Pointer to return the support level with.
> > + *
> > + * Returns: 0, or an error.
> > + */
> > +static int lwmi_gz_platform_profile_supported(struct wmi_device *wdev,
> > +                                           int *supported)
> > +{
> > +     return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFAN=
_SUPP,
> > +                                     0, 0, supported);
> > +}
> > +
> > +/*
> > + * lwmi_gz_thermal_mode_get() - Gets the currently set thermal mode fr=
om
> > + * the Gamezone WMI interface.
> > + *
> > + * @wdev: The Gamezone WMI device.
> > + * @mode: Pointer to return the thermal mode with.
> > + *
> > + * Returns: 0, or an error.
> > + */
> > +static int lwmi_gz_thermal_mode_get(struct wmi_device *wdev,
> > +                                 enum thermal_mode *mode)
> > +{
> > +     return lwmi_dev_evaluate_method(wdev, 0x0, WMI_METHOD_ID_SMARTFAN=
_GET,
> > +                                     0, 0, mode);
> > +}
> > +
> > +static int lwmi_gz_profile_get(struct device *dev,
> > +                            enum platform_profile_option *profile)
> > +{
> > +     struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
> > +     enum thermal_mode mode;
> > +     int ret;
> > +
> > +     ret =3D lwmi_gz_thermal_mode_get(priv->wdev, &mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (mode) {
> > +     case SMARTFAN_MODE_QUIET:
> > +             *profile =3D PLATFORM_PROFILE_LOW_POWER;
> > +             break;
> > +     case SMARTFAN_MODE_BALANCED:
> > +             *profile =3D PLATFORM_PROFILE_BALANCED;
> > +             break;
> > +     case SMARTFAN_MODE_PERFORMANCE:
> > +             if (priv->extreme_supported) {
> > +                     *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANC=
E;
> > +                     break;
> > +             }
> > +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> > +             break;
> > +     case SMARTFAN_MODE_EXTREME:
> > +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> > +             break;
> > +     case SMARTFAN_MODE_CUSTOM:
> > +             *profile =3D PLATFORM_PROFILE_CUSTOM;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     priv->current_mode =3D mode;
> > +
> > +     return 0;
> > +}
> > +
> > +static int lwmi_gz_profile_set(struct device *dev,
> > +                            enum platform_profile_option profile)
> > +{
> > +     struct lwmi_event_priv *priv =3D dev_get_drvdata(dev);
> > +     struct wmi_method_args_32 args;
> > +     enum thermal_mode mode;
> > +     int ret;
> > +
> > +     switch (profile) {
> > +     case PLATFORM_PROFILE_LOW_POWER:
> > +             mode =3D SMARTFAN_MODE_QUIET;
> > +             break;
> > +     case PLATFORM_PROFILE_BALANCED:
> > +             mode =3D SMARTFAN_MODE_BALANCED;
> > +             break;
> > +     case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> > +             mode =3D SMARTFAN_MODE_PERFORMANCE;
> > +             break;
> > +     case PLATFORM_PROFILE_PERFORMANCE:
> > +             if (priv->extreme_supported) {
> > +                     mode =3D SMARTFAN_MODE_EXTREME;
> > +                     break;
> > +             }
> > +             mode =3D SMARTFAN_MODE_PERFORMANCE;
> > +             break;
> > +     case PLATFORM_PROFILE_CUSTOM:
> > +             mode =3D SMARTFAN_MODE_CUSTOM;
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     args.arg0 =3D mode;
> > +
> > +     ret =3D lwmi_dev_evaluate_method(priv->wdev, 0x0,
> > +                                    WMI_METHOD_ID_SMARTFAN_SET,
> > +                                    (unsigned char *)&args, sizeof(arg=
s),
> > +                                    NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->current_mode =3D mode;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dmi_system_id fwbug_list[] =3D {
> > +     {
> > +             .ident =3D "Legion Go 8APU1",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1")=
,
> > +             },
> > +             .driver_data =3D &quirk_no_extreme_bug,
> > +     },
> > +     {
> > +             .ident =3D "Legion Go S 8ARP1",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1=
"),
> > +             },
> > +             .driver_data =3D &quirk_no_extreme_bug,
> > +     },
> > +     {
> > +             .ident =3D "Legion Go S 8APU1",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1=
"),
> > +             },
> > +             .driver_data =3D &quirk_no_extreme_bug,
> > +     },
> > +     {},
> > +
> > +};
> > +
> > +/*
> > + * extreme_supported() - Evaluate if a device supports extreme thermal=
 mode.
> > + * For devices that have a profile_support_ver of 6 or greater a DMI c=
heck
> > + * is done. Some devices report a version that supports extreme mode b=
ut
> > + * have an incomplete entry in the BIOS. To ensure this cannot be set,=
 they
> > + * are quirked to prevent assignment.
> > + *
> > + * @profile_support_ver: Version of WMI interface provided by
> > + * lwmi_gz_platform_profile_supported.
> > + *
> > + * Returns: bool
> > + */
> > +static bool extreme_supported(int profile_support_ver)
> > +{
> > +     const struct dmi_system_id *dmi_id;
> > +     struct quirk_entry *quirks;
> > +
> > +     if (profile_support_ver < 6)
> > +             return false;
> > +
> > +     dmi_id =3D dmi_first_match(fwbug_list);
> > +     if (!dmi_id)
> > +             return true;
> > +
> > +     quirks =3D dmi_id->driver_data;
> > +     return quirks->extreme_supported;
> > +}
> > +
> > +static int lwmi_platform_profile_probe(void *drvdata, unsigned long *c=
hoices)
> > +{
> > +     struct lwmi_event_priv *priv =3D drvdata;
> > +     int profile_support_ver;
> > +     int ret;
> > +
> > +     ret =3D lwmi_gz_platform_profile_supported(priv->wdev,
> > +                                              &profile_support_ver);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (profile_support_ver < 1)
> > +             return -ENODEV;
> > +
> > +     priv->extreme_supported =3D extreme_supported(profile_support_ver=
);
> > +
> > +     set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> > +     set_bit(PLATFORM_PROFILE_BALANCED, choices);
> > +     set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> > +     set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> > +
> > +     if (priv->extreme_supported)
> > +             set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct platform_profile_ops lwmi_gz_platform_profile_ops =
=3D {
> > +     .probe =3D lwmi_platform_profile_probe,
> > +     .profile_get =3D lwmi_gz_profile_get,
> > +     .profile_set =3D lwmi_gz_profile_set,
> > +};
> > +
> > +/* Driver Methods */
> > +static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
> > +{
> > +     struct lwmi_event_priv *priv;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->event_nb.notifier_call =3D lwmi_gz_event_call;
> > +     ret =3D devm_lwmi_events_register_notifier(&wdev->dev, &priv->eve=
nt_nb);
> > +     if (ret)
> > +             return ret;
>
> You should register the event notifier after registering the platform pro=
file or else
> a WMI event could arrive before the platform profile was registered, resu=
lting in
> platform_profile_notify() being called on a invalid device pointer.
>

Acked

> > +
> > +     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> > +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->wdev =3D wdev;
> > +     dev_set_drvdata(&wdev->dev, priv);
>
> This should happen before the notifiers are registered or else they might=
 try to access
> those values before they are actually initialized.
>

Acked

> > +
> > +     priv->ppdev =3D platform_profile_register(&wdev->dev,
> > +                                             "lenovo-wmi-gamezone", pr=
iv,
> > +                                             &lwmi_gz_platform_profile=
_ops);
> > +
> > +     if (IS_ERR(priv->ppdev))
> > +             return -ENODEV;
> > +
> > +     ret =3D lwmi_gz_thermal_mode_get(wdev, &priv->current_mode);
> > +     if (ret)
> > +             return ret;
>
> The thermal mode should be initialized before any notifiers using it are =
registered.
>

I'll register notifiers last in this func.

> > +
> > +     return 0;
> > +}
> > +
> > +static const struct wmi_device_id lwmi_gz_id_table[] =3D { { LENOVO_GA=
MEZONE_GUID,
> > +                                                        NULL },
> > +                                                      {} };
>
> Please fix the formatting here.
>

Will do.

Thanks,
Derek

> Thanks,
> Armin Wolf
>
> > +
> > +static struct wmi_driver lwmi_gz_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "lenovo_wmi_gamezone",
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +     },
> > +     .id_table =3D lwmi_gz_id_table,
> > +     .probe =3D lwmi_gz_probe,
> > +     .no_singleton =3D true,
> > +};
> > +
> > +module_wmi_driver(lwmi_gz_driver);
> > +
> > +MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> > +MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.h b/drivers/platf=
orm/x86/lenovo-wmi-gamezone.h
> > new file mode 100644
> > index 000000000000..ac536803160b
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-gamezone.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
> > + */
> > +
> > +#ifndef _LENOVO_WMI_GAMEZONE_H_
> > +#define _LENOVO_WMI_GAMEZONE_H_
> > +
> > +enum thermal_mode {
> > +     SMARTFAN_MODE_QUIET =3D 0x01,
> > +     SMARTFAN_MODE_BALANCED =3D 0x02,
> > +     SMARTFAN_MODE_PERFORMANCE =3D 0x03,
> > +     SMARTFAN_MODE_EXTREME =3D 0xE0, /* Ver 6+ */
> > +     SMARTFAN_MODE_CUSTOM =3D 0xFF,
> > +};
> > +
> > +#endif /* !_LENOVO_WMI_GAMEZONE_H_ */
