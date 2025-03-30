Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C44C81;
	Sun, 30 Mar 2025 04:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743310561; cv=none; b=KP+0Zi7deBr+tTCKo3nfvNnuYHypVh+bTKCQUbAttwTjnk8ru5QOsUj9TFZe0z90K4JsZjQsieDK/7dJA7RN/j4Rj+VvVEizNA8DZpArVYPi6MwpvwBjs7oATYmiAFdv803a0YSCa1sFE0UudLl/Sk/mCM6X0UDUAe+bFBFRgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743310561; c=relaxed/simple;
	bh=oHy7Ye8IqZV3d0Or+KpI9E/66LDLMYMHDdrOfxXygng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8Zi5bcxVyQZjNUwEw9iXypJfClBzjh1h5li1IzLcJNrMSe0eh6jxbC0oF83nfV3mjaAiri3pVMyx8TcXUTcCepvu9rBuzyqvrsJ8HqLBJAZScUX8FXghUYK0p+wiRa5MqNaq2awlAs4mm9yyRZg+4JJheBKHa+/+VgqqAYlgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UujCr3Mc; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UujCr3Mc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ed16ce246bso17467806d6.3;
        Sat, 29 Mar 2025 21:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743310558; x=1743915358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfE4vJc/WRoYibC2xAR9RDLdvUaTXwprDAx9rPA0kRs=;
        b=UujCr3Mc7AM5JhBT24HIzs+r6YOs2uVIBXNpe5Bfk7iJSfXy/OguquuuaoC1u621rd
         ixugb5UvaeUvdiJTfYolEnK3vSwQOogFTiJSlG5MRkpNBtNON3orYx0zV8ebXse+xREr
         XvUGZjx8ak5ePIrNs4/O6fN6aY1i7DpkKTOZXzAJTN2gHycfGva5qNqe4KRFYUzyG1Gr
         BMudmN3L8ngpwkY/xRWdZfZM7G/fwE53EL2ZOu3vAX0iC6aUIsw36zvfsAMDxGLzf830
         zKYgpVPjeYM5/+t5Ht/u1Iylg2tDHhmwXmCrUHc/nOer0RlxQUgcNo+8CegSaq9TBgKC
         azhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743310558; x=1743915358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfE4vJc/WRoYibC2xAR9RDLdvUaTXwprDAx9rPA0kRs=;
        b=n+WIQz4VAzaJVhlzBym7xpN+CH3OjtSXCOjm/5eLyKjOw95SEl5dsM2ZSd9xoluvJT
         kXZnOe/MfMyj3bFVTi7hDTpLlK2nKB+iS3+DXeTyGEac2RRy8x0QGZ6VZY2NCBPJUPM4
         FEZTjq2rp4swfRVYnq1ILMaSKFsjs4H1TybmVjIxh6azM8T28HjviMcZLubDf5LmOCK6
         vagSkqd/1sFxyjNaWOXoB6OKajvSCBJ1BS8ZKvMMqv46GP9WR2lnX7wrm40UFNzhme5l
         5tVqY+RMHBNu1eUB878eXml+XyV9hKK35BsZtwMxXR5Een3KsMdDqUo1RcKXVLC/qd5i
         8zpw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMbw/fCE/qLmuXFshanlOUYa1lx8AxWoyrPQyl8TGavmK76zbU60qIY6sLpHHcWk/VU2BNU9Fd8WCBOxOZVfQp7qghw==@vger.kernel.org, AJvYcCWUgT1ySm0wCUxYbqlsqkU8X3LRDaL4pUgLegfRkLWVf9Bq9jcZmtAT21l3FlW8c1kZK0db0MKrWPg=@vger.kernel.org, AJvYcCX0W5vGOZhQmJSiuTHvgCkHS628SqVhTxXhVfdAqY31p3lMGMVIVwdvEx03D9cNxwesJ1wF4Ji9/OotJsXr@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxS3l1uBxLRJE7hxkfjQCeLkYCmohAWqhQkZInoh86EQdWDZx
	PuySZw9OjdhOQbHGoD0LI77iq4oCP4/64RWHc5BHFtpcb17Zua64DoCz93Hhca2SiY8oDuuL+ML
	SkhXIVKiBlajPCPQLze6+quT2zjOF9CO0PvcjXA==
X-Gm-Gg: ASbGncubsxqVuMT+c9GaQELMsOc5liqKvSpb1bnJ+qPzw5sVK5PKUiQKPw6efpk0KIz
	9fzFV1G6ONoU44cpVPHBDDRIX1oS5WTmjoharh/+pwNVO8XGdNzW1e3L4g3bVOKoVtNwcIwGP5U
	MEQSWTi1pzi/nAF8JYMRn0jWOS90Q=
X-Google-Smtp-Source: AGHT+IEsNfpalShVKT/dqnjVDWZcbbzpsgORyZCsuidVwFVu5P70Bwk06h1v/3FglfXOybFofS1uqDYA0R5nrBvylIU=
X-Received: by 2002:a05:6214:1253:b0:6e8:f598:f9ee with SMTP id
 6a1803df08f44-6eed624aaf7mr85127406d6.38.1743310558490; Sat, 29 Mar 2025
 21:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-3-derekjohn.clark@gmail.com> <24e1ed43-9095-4489-9b21-4d619fc5d62b@gmx.de>
In-Reply-To: <24e1ed43-9095-4489-9b21-4d619fc5d62b@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 29 Mar 2025 21:55:47 -0700
X-Gm-Features: AQ5f1JqwdzicyAxi8VqXmUeqdXIT7Ll0dA3SEIgI5DxBFKlMUu4-41kxPclrmio
Message-ID: <CAFqHKT=kh2ortTJAZo0CuBuXStmnQUdZLi2aH0OS+q2EV77kAQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6 RESEND] platform/x86: Add lenovo-wmi-helpers
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

On Wed, Mar 26, 2025 at 5:41=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>
> > Adds documentation for all new lenovo-wmi drivers.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >   - Changed namespace to LENOVO_WMI_HELPERS from LENOVO_WMI.
> >   - Changed filenames to lenovo-wmi-helpers from lenovo-wmi.
> >   - Removed structs and functions implemented by other drivers.
> > ---
> >   MAINTAINERS                               |  2 +
> >   drivers/platform/x86/Kconfig              |  4 ++
> >   drivers/platform/x86/Makefile             |  1 +
> >   drivers/platform/x86/lenovo-wmi-helpers.c | 64 ++++++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi-helpers.h | 24 +++++++++
> >   5 files changed, 95 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 675f4b26426d..3a370a18b806 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> >   F:  Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >   F:  Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:   drivers/platform/x86/lenovo-wmi-helpers.c
> > +F:   drivers/platform/x86/lenovo-wmi-helpers.h
> >
> >   LENOVO WMI HOTKEY UTILITIES DRIVER
> >   M:  Jackie Dong <xy-jackie@139.com>
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
> >   config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 650dfbebb6c8..5a9f4e94f78b 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >   obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
> >   obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> >
> >   # Intel
> >   obj-y                               +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-helpers.c b/drivers/platfo=
rm/x86/lenovo-wmi-helpers.c
> > new file mode 100644
> > index 000000000000..36d553502223
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-helpers.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo Legion WMI helpers driver. The Lenovo Legion WMI interface i=
s
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
>
> Hi,
>
> please also include linux/acpi.h, linux/cleanup.h, linux/errno.h, linux/m=
odule.h and linux/export.h.
>

Acked all include requests for the series.

> > +#include "lenovo-wmi-helpers.h"
> > +
> > +/*
>
> Please make sure that the doc comments are valid kernel doc comments, see=
 https://docs.kernel.org/doc-guide/kernel-doc.html
> for details. For example please make sure that the comments start with a =
"/**".

Will do, thanks

> It would also be nice if you actually describe the purpose of each functi=
on.

I can do that.

> > + * lwmi_dev_evaluate_method() - Helper function to call wmidev_evaluat=
e_method
> > + * for Lenovo WMI device method calls that return an ACPI integer.
> > + * @wdev: Pointer to the WMI device to be called.
> > + * @instance: Instance of the called method.
> > + * @method_id: WMI Method ID for the method to be called.
> > + * @buf: Buffer of all arguments for the given method_id.
> > + * @size: Length of the buffer.
> > + * @retval: Pointer for the return value to be assigned.
> > + *
> > + * Returns: 0, or an error.
> > + */
> > +int lwmi_dev_evaluate_method(struct wmi_device *wdev, u8 instance,
> > +                          u32 method_id, unsigned char *buf, size_t si=
ze,
> > +                          u32 *retval)
> > +{
> > +     struct acpi_buffer input =3D { size, buf };
>
> Reverse X-mas tree declaration order please.
>
Acked

Thanks,
Derek


> Thanks,
> Armin Wolf
>
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
> > + */
> > +#include <linux/notifier.h>
> > +#include <linux/platform_profile.h>
> > +
> > +#ifndef _LENOVO_WMI_HELPERS_H_
> > +#define _LENOVO_WMI_HELPERS_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
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
