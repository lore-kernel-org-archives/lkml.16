Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD01F4C86;
	Wed,  2 Apr 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628994; cv=none; b=dq02qLdrP5PDNiN7/PB0IL2e0h9luy7KopE5DwIT0FcPZ2J8Xw8+5KKyLO0l52ot5qovgjSKsf0Yboz1D8W91OuxkpPoMwrDj5bLhE15WwSWHKijV5ZeJc5XigvfWuAITW38PN70Dv6cX9UbOuoqgNzGLeYPuSbC2q1MqScZO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628994; c=relaxed/simple;
	bh=htFIZA55n/wCZnmQ4V5/PpC17YimONZWw5/Ma5BiYwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuofH2a6fdwd2gwZ8DNHJ4YRWfNHpA/da/zhXpSU9nZVYnvUEDmpW6omBSFX3HF5WDtJpZRyni9B0ut6ktCA/Sr/uSdA4+++Sh1X5iUpX3pcky8pI+RCZucJhdUmVyhOByby9PoBmLrNwQWSmORJnPCUqKk2CtrH2LlLuUDTRVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSv/7osz; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSv/7osz"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so2049526d6.1;
        Wed, 02 Apr 2025 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628990; x=1744233790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=271MwaY3RZTN9ti90PBqXDkarGhx0soS//2OcLJ7/aQ=;
        b=bSv/7oszZ2ztvTdsUwk2Hcs4v+IXt45l0t0bmvf9lnnMnAwm4rxUIvU/RFtQU8ntr6
         1jmHOl4OrTx/CnbqQg/evBu6T8qVAE+H4un79e8k5ojnwlb4O167IARyDGnv36pjTiuX
         Jpm0Lh7QsnYg5UZftVU2vYBz3JwTK4bChkNC+oqLpTsImXQm4EsEkMY+ZXyV1vwQIeFd
         IdNlgrZFGLrb0cxb3ZW3eIiHzVNnoZmyI7jmoM8BzPlKXCbJe6TqHxhdpflkeLK2QO14
         L3E2eJIfQvOR79qz5sA5AIuHHj2Q6NA0E24OeDDnRemx6K4u+IJxq1H+swKK4fPU28IQ
         r3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628990; x=1744233790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=271MwaY3RZTN9ti90PBqXDkarGhx0soS//2OcLJ7/aQ=;
        b=pRxqQDj2iAaPMvsi7ZeFkkz8Qvwu+kN7TDFvF62sWVwNztIVHLl+WQgbdt11Rin1Qv
         hVrBkG9hg/xLcno6EB6SILtGzCfLARXeeslH9KCciSQH1hnRfGSW5iBHybu7Z3R+fXee
         6YL09OipaKhXKHD9m3vV527VeiBiWZDoSWCqNALJuyP8DfACIrirkKEu69T0xYe9Ayyv
         iczC/SKGBEslGAc7CXS2346z46ausb+PkrbxwSTHPiNY1nSRI1ZV8rZbVhVRb6LZI62S
         UTzwg45lcVGyUZD/ugFsk2wa6NdpvYrdnBWjcuOylJWYW3k6ODnq0BLo4lzhGxXKyfTc
         O+iw==
X-Forwarded-Encrypted: i=1; AJvYcCUDCvhxq2JLyz0UJQI8AzqoP1ZnpIRUlXJaau0XXUsS5FeAlrraV+REHa6cXR/MmxhbitcYfuHvTVQQV515/eOIglHEaA==@vger.kernel.org, AJvYcCVyrlUmxPfxw2214wFs+0bMZ49dbTaUHf4C/zE7TDEYSVQMV5M7M5b/rcJMmUyq3pZ+T0ZOiuXqBns=@vger.kernel.org, AJvYcCWj1h/nGaRUlaDPEoBK8tswc4TDLBD8bUKranWpS6B1kbj6FE3wvWpCL1/P3xfNfMPso6uyE7H4hhRpoI32@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPsPPkivTtidzOO5g8MNTbKMGrV2SOFKC1UHI0iTJlY+3gCRJ
	dbeP3CY1fYepDXZmQjABNdlAMepv1C4os+w+9hUZ6Suss4oCET0vpRde08pa8vDo/re97iSKd+a
	GlZfLq+6QaP0Cv933sEWF4lTxA7U=
X-Gm-Gg: ASbGncv8j3MF5WYjeZs6k2LI00un5sNHifJQH/KnxbArQRSnLxSBi6tomLzpFwedY9D
	rRDBh7VAUu8Y685h4JPryZMRv8s0b3UCDZZkbfrr7diaRA3x/WnLZiaGgC9o3VUn8pshm7O7C6g
	25/CtMmGkMkVKNMdV6GPUESB98Z5s=
X-Google-Smtp-Source: AGHT+IFRIpTuGjb72+kzZSW6SG07Vl6G1ULmxLr7hwfqvrFlzK1LC0OPVCI3cIGcLJ0rvyRhPHQp6e88WSkwKKOow7A=
X-Received: by 2002:a05:6214:21c5:b0:6e4:4164:8baa with SMTP id
 6a1803df08f44-6eef5d67c1fmr116997116d6.6.1743628990337; Wed, 02 Apr 2025
 14:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-7-derekjohn.clark@gmail.com> <be11f12b-d610-6130-180a-476d7958f2b9@linux.intel.com>
In-Reply-To: <be11f12b-d610-6130-180a-476d7958f2b9@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 14:22:58 -0700
X-Gm-Features: AQ5f1JqxqvX78SjUzGWX5RcVddMhUR5_BHo0e_gv75EKZJVxiCLoo3jATDE0jI4
Message-ID: <CAFqHKTk30hV5UuXjpfHs_0CT=5cfbPkiW4im4uHO4dC=9d9AqQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6 RESEND] platform/x86: Add Lenovo Gamezone WMI Driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 6:56=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 17 Mar 2025, Derek J. Clark wrote:
>
> > Adds lenovo-wmi-gamezone driver which provides the Lenovo Gamezone WMI
> > interface that comes on Lenovo "Gaming Series" hardware. Provides ACPI
> > platform profiles over WMI.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
> This has a few similar nits I flagged for the other patches but I won't
> mark them here again but please go through the patches to find similar
> cases.
>
> > ---
> > v4:
> > - Add notifier blocks for the Events and Other Mode drivers.
> > - Remove notifier block chain head and all reference to Thermal Mode
> >   Event GUID.
> > - Add header for Gamezone specific structs and functions.
> > - Various fixes from review.
> > v3:
> > - Use notifier chain to report platform profile changes to any
> >   subscribed drivers.
> > - Adds THERMAL_MODE_EVENT GUID and .notify function to trigger notifier
> >   chain.
> > - Adds support for Extreme Mode profile on supported hardware, as well
> >   as a DMI quirk table for some devices that report extreme mode versio=
n
> >   support but so not have it fully implemented.
> > - Update to include recent changes to platform-profile.
> > v2:
> > - Use devm_kmalloc to ensure driver can be instanced, remove global
> >   reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> > - Remove GZ_WMI symbol exporting.
> > ---
> >  MAINTAINERS                                |   2 +
> >  drivers/platform/x86/Kconfig               |  13 +
> >  drivers/platform/x86/Makefile              |   1 +
> >  drivers/platform/x86/lenovo-wmi-gamezone.c | 380 +++++++++++++++++++++
> >  drivers/platform/x86/lenovo-wmi-gamezone.h |  18 +
> >  5 files changed, 414 insertions(+)
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 87daee6075ad..0416afd997a0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13168,6 +13168,8 @@ F:    drivers/platform/x86/lenovo-wmi-capdata01=
.c
> >  F:   drivers/platform/x86/lenovo-wmi-capdata01.h
> >  F:   drivers/platform/x86/lenovo-wmi-events.c
> >  F:   drivers/platform/x86/lenovo-wmi-events.h
> > +F:   drivers/platform/x86/lenovo-wmi-gamezone.c
> > +F:   drivers/platform/x86/lenovo-wmi-gamezone.h
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.h
> >  F:   drivers/platform/x86/lenovo-wmi-other.c
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
> >  config LENOVO_WMI_DATA01
> >       tristate
> >       depends on ACPI_WMI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index c6ce3c8594b1..f3e64926a96b 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-=
tab2-pro-1380-fastcharger.o
> >  obj-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D lenovo-wmi-camera.o
> >  obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> > +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
> >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> >  obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
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
> > +             *(enum thermal_mode *)data =3D priv->current_mode;
> > +             break;
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
> > +
> > +     switch (cmd) {
> > +     case THERMAL_MODE_EVENT:
> > +             priv->current_mode =3D *((enum thermal_mode *)data);
> > +             platform_profile_notify(&priv->wdev->dev);
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
> > +
> > +     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> > +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->wdev =3D wdev;
> > +     dev_set_drvdata(&wdev->dev, priv);
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
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct wmi_device_id lwmi_gz_id_table[] =3D { { LENOVO_GA=
MEZONE_GUID,
> > +                                                        NULL },
> > +                                                      {} };
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
> >
>
> Are these going the be used by other .c files?
>

They are used across different c files in this series. The
lenovo-wmi-other driver uses every header.

- Derek

> --
>  i.
>
