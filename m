Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733752E3360;
	Wed,  2 Apr 2025 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628984; cv=none; b=GUOumpE4EayuDP5jI+OJFt4jFbl/bfClywpQg7DzAt0SLNXfQ/rxLi8saQ2H/YEPrg2TwwDHoAP2rF5WIt1yrJyA8+a4mqrz/hNtVc8FN4OXthwE8LPIKYkkZ6qDpdSyfJ2Ikld94vIRCpYp9HuJZQDI7DSwa3LmcrikQfOeIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628984; c=relaxed/simple;
	bh=ID2aFYvQ+X5blIc13eYilijco6Ts57fhJXn1pharU9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiITMQzUhHXS0wKFMbq+7CVQm34jFOWL6Op7+SsxbmlWi5ke3pP7j5NpfWvMeMUtG8hf/9KgIjFXdvSASEnZDcl6WmcoOwa0frM/TCLswOqgb0qR4J7b/hBwLb7ZbJNl3BBZUHI+NyUXnR1wm1mbpASfuwfm8wh1bvYu9F+dnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3hZkuxV; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3hZkuxV"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so2126256d6.2;
        Wed, 02 Apr 2025 14:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628981; x=1744233781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD0mL/QmSbORWH03BY+6+lhgtlAoqlJKZeX2h4I7qsk=;
        b=g3hZkuxVkhbTfWtQ4kgiB4bA/vHqfqWAjbGJ0bRJ1IEdNC1a3xRmVNlLAMcdu89tRH
         rP+5M+LapNBKaC2eh37t623zu5bh0e2uRcj7HYsum1MF4K0vfhBqrsfcmkKS4IcpsgJP
         wS6YZ2hYE2FnbeOwhWWZTlNeI238TtLOnGwqGPcQDaIAP2xJUgSdSWMbs9sbTGjSqkkz
         n0yiAf1iPYhmf/w14q6u+GcsHUHNAZ5Xuqdb8TJ6cIP7vLnKj5ZSgFJT1I8HIzPGGwdo
         zSuuvyTvRgTKHoMQ9+mOWscqVlBH+CSRoeZpp5FmA/BBUpCd8ZXSiE4R1zYJLUwLHwQF
         TkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628981; x=1744233781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD0mL/QmSbORWH03BY+6+lhgtlAoqlJKZeX2h4I7qsk=;
        b=UVLmSr86AqhhW+4xCJPjdWgzAG71foZVAmvu2V40Eaw5eGeVC0HjTGj4z0u4qBBHeR
         HO281pP3vjt2DV693aGzpIbjrpp91qtByUPeEKms1nyj1pbHQDPuoWqsxj9ircoDV4ts
         YQECrwT54RHkGypeFmvdU1YZZyWbmG9nsUIbSnVIAQvwQvvG2caFxvWtYAxDAB1Lq76D
         MohTnkfm+iGgDYntKm3mm/faADQcVT4R9umgxgvYtHJ3k/w13rJKQJvudNhT6cSBnP/3
         DLsuBXOJ3tLH/2kc/zLe3fhQiLAfTkt0LhHuHskTImRtqpyXDY2FVeeGyLR2SgBD+LGS
         8IZg==
X-Forwarded-Encrypted: i=1; AJvYcCUZoxfrfAe/0sAqTQNTxJ3GU1y0Zad1UnaGSK8Rwd1Kx6A4MuOPG2LdCjdatEJeEkztuoeMbTTG42BMvnJo@vger.kernel.org, AJvYcCWNyd8McGdQjVN8ayewPfb8Q1XTJvRx2Gm5paej3wIIvUGd20AuAvGZ3pmWKki+8MyxB6fKmwHzd8IM2gqYoLhoEOP8Ug==@vger.kernel.org, AJvYcCWbTHwKyJGxtfxYO3pKhhDOhBxszFJYuNve0KDnSTJGkLb+R0N1UkPDBYl2C3LffgzmyLmNedf8cbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1zR9+RPBFB/NwhfiFXR+C9sw1EfAI21DDoqrn3KSDwPpC0Dl
	nsB5evdMbYxY6wvj3Xv7G1pmhrT4X4tCD/9TtQ+S0RlbW8Ah9J5WNkUcyu4mhQna7RKdSsw9kju
	vfycuWHfbO4mUxli4yh0RU+04VVg=
X-Gm-Gg: ASbGncvGJnGVwRRJN/PzPKertm/cj7veO0H6/qFmifPSg7M8QMp4QTaynRY94qd0eXO
	kwOySikNngumENeMSQTlS2qBW5tF01t1/d6ZHLKhDgcUqm4yqISaed34Ux5wu0fXgXC0zZUrWXi
	I2vtS9TRRSwouHIXhCJRMwU0wovJk=
X-Google-Smtp-Source: AGHT+IFGnz/KM7IpsuTozJVHp2PtAF6Kamh5uB9iuo77jTdSPNo5eeVKjGACfZMiGMd3pghabR2tHhKoFqlyD2CYnnA=
X-Received: by 2002:ad4:4981:0:b0:6e8:fbb7:6760 with SMTP id
 6a1803df08f44-6ef0dbf8429mr3738516d6.1.1743628981228; Wed, 02 Apr 2025
 14:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-3-derekjohn.clark@gmail.com> <da344af9-4da8-e7e2-bdcf-e6d9c257cc30@linux.intel.com>
In-Reply-To: <da344af9-4da8-e7e2-bdcf-e6d9c257cc30@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 14:22:49 -0700
X-Gm-Features: AQ5f1JoRpaajhM4T0ec6_qWg7maG7Y4Y7CPzWbG96NdnR2F5hl6Icf2vr0J0ENg
Message-ID: <CAFqHKT=yu7b4aXY2X0gKjP46RkcgQe8wJGo5+tQ9PmYP-6Nqqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6 RESEND] platform/x86: Add lenovo-wmi-helpers
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

On Thu, Mar 27, 2025 at 5:44=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 17 Mar 2025, Derek J. Clark wrote:
>
> > Adds documentation for all new lenovo-wmi drivers.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >  - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
> >  - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
> >  - Removed structs and functions implemented by other drivers.
> > ---
> >  MAINTAINERS                               |  2 +
> >  drivers/platform/x86/Kconfig              |  4 ++
> >  drivers/platform/x86/Makefile             |  1 +
> >  drivers/platform/x86/lenovo-wmi-helpers.c | 64 +++++++++++++++++++++++
> >  drivers/platform/x86/lenovo-wmi-helpers.h | 24 +++++++++
> >  5 files changed, 95 insertions(+)
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 675f4b26426d..3a370a18b806 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >  F:   Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:   drivers/platform/x86/lenovo-wmi-helpers.c
> > +F:   drivers/platform/x86/lenovo-wmi-helpers.h
> >
> >  LENOVO WMI HOTKEY UTILITIES DRIVER
> >  M:   Jackie Dong <xy-jackie@139.com>
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 43407e76476b..bece1ba61417 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -459,6 +459,10 @@ config IBM_RTL
> >        state =3D 0 (BIOS SMIs on)
> >        state =3D 1 (BIOS SMIs off)
> >
> > +config LENOVO_WMI_HELPERS
> > +     tristate
> > +     depends on ACPI_WMI
> > +
> >  config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 650dfbebb6c8..5a9f4e94f78b 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >  obj-$(CONFIG_YOGABOOK)               +=3D lenovo-yogabook.o
> >  obj-$(CONFIG_YT2_1380)               +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >  obj-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> >
> >  # Intel
> >  obj-y                                +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platfo=
rm/x86/lenovo-wmi-helpers.c
> > new file mode 100644
> > index 000000000000..36d553502223
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo Legion WMI helpers driver.
>
> Please add empty comment row here.
>

Acked for all instances in the series.

> >  The Lenovo Legion WMI interface is
> > + * broken up into multiple GUID interfaces that require cross-referenc=
es
> > + * between GUID's for some functionality. The "Custom Method" interfac=
e is a
> > + * legacy interface for managing and displaying CPU & GPU power and hw=
mon
> > + * settings and readings. The "Other Mode" interface is a modern inter=
face
> > + * that replaces or extends the "Custom Method" interface methods. The
> > + * "Gamezone" interface adds advanced features such as fan profiles an=
d
> > + * overclocking. The "Lighting" interface adds control of various stat=
us
> > + * lights related to different hardware components. Each of these driv=
ers
> > + * uses a common procedure to get data fro the WMI interface, enumerat=
ed here.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
> > + */
> > +
> > +#include <linux/wmi.h>
> > +#include "lenovo-wmi-helpers.h"
>
> Put a space between these lines
>

Acked for all instances in the series.

> > +
> > +/*
> > + * lwmi_dev_evaluate_method() - Helper function to call wmidev_evaluat=
e_method
> > + * for Lenovo WMI device method calls that return an ACPI integer.
>
> This should be a shorter summary and the rest should be put into own
> paragraph between the arguments and Return:

Acked for all instances in the series.

> > + * @wdev: Pointer to the WMI device to be called.
> > + * @instance: Instance of the called method.
> > + * @method_id: WMI Method ID for the method to be called.
> > + * @buf: Buffer of all arguments for the given method_id.
> > + * @size: Length of the buffer.
> > + * @retval: Pointer for the return value to be assigned.
> > + *
> > + * Returns: 0, or an error.
>
> Return:
>

Acked for all instances in the series.

> > + */
> > +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> > +                          u32 method_id, unsigned char *buf, size_t si=
ze,
> > +                          u32 *retval)
> > +{
> > +     struct acpi_buffer input =3D { size, buf };
> > +     struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +     union acpi_object *ret_obj __free(kfree) =3D NULL;
> > +     acpi_status status;
> > +
> > +     status =3D wmidev_evaluate_method(wdev, instance, method_id, &inp=
ut,
> > +                                     &output);
> > +
> > +     if (ACPI_FAILURE(status))
> > +             return -EIO;
> > +
> > +     if (retval) {
> > +             ret_obj =3D output.pointer;
> > +             if (!ret_obj)
> > +                     return -ENODATA;
> > +
> > +             if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
> > +                     return -ENXIO;
> > +
> > +             *retval =3D (u32)ret_obj->integer.value;
> > +     }
> > +     return 0;
> > +};
> > +EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_method, "LENOVO_WMI_HELPERS");
> > +
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi-helpers.h b/drivers/platfo=
rm/x86/lenovo-wmi-helpers.h
> > new file mode 100644
> > index 000000000000..7e0d7870790e
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-helpers.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
>
> Please remove this extra line.
>

Acked for all instances in the series.

> > + */
> > +#include <linux/notifier.h>
> > +#include <linux/platform_profile.h>
>
> What? Why are these on this side of the ifndef??? And neither is needed b=
y
> this header AFAICT so please drop them.

Leftover from when the header was a single file. I'll remove it.

> > +#ifndef _LENOVO_WMI_HELPERS_H_
> > +#define _LENOVO_WMI_HELPERS_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
>
> This include is not needed (since you're only using it as a pointer). Do =
a
> forward declaration instead:
>
> struct wmi_device;
>

I wasn't aware you could do this, that is useful. Acked for all
similar instances in the series.

Thanks,
Derek

> > +
> > +struct wmi_method_args_32 {
> > +     u32 arg0;
> > +     u32 arg1;
> > +};
> > +
> > +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> > +                          u32 method_id, unsigned char *buf, size_t si=
ze,
> > +                          u32 *retval);
> > +
> > +#endif /* !_LENOVO_WMI_HELPERS_H_ */
> >
>
> --
>  i.
>
