Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7371EA7F8;
	Wed,  2 Apr 2025 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626844; cv=none; b=iFm3bLqxD5pyBAW96h+psIFHzUbUl7c3WS9fUnvQLwpikmcsn5sE7fH3l4JWD9r7TqDbgr4hXugvkOk0ukqT3m7zAXIuGpST4doKQceFI+nEuq3yI7yW8DjE3y/C2K8yS+8MAUeDhKGhKgV2A+fW1d4RlY6thCLP1EKnlvyt3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626844; c=relaxed/simple;
	bh=1gkvF4nZ71TdOOO/Dt9NfMrheN7sII2f2QI/fX70a5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlCq6RWtGKQakmcECZOZjaiV0G/keBc/Ut5VsWHcNYYV/D2wkYaj7AIM9g/YV2hTiAnDXnpAEPmLo6n48h74gSG0KrEKzjHIoJi/lrTDdy55kIQP/bBXfQwIsQcAMRoN7j8hd3vzl0FiDGf5pNiQJ2B1rskMpZdQ7SDCvE5pedA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P11RIid9; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P11RIid9"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c559b3eb0bso10844385a.1;
        Wed, 02 Apr 2025 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743626842; x=1744231642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GNCU8yfc3FTFzqks9zu+jiiDh0WEptxt4HmGq78/Ms=;
        b=P11RIid9txvjm5D27ueLt1J+VFQCd4/5Hf9V4L4yj7gci/04fsBYOGJOKxJE2VSDt/
         Z03LZIglVuyQ+bclZJXzxThG0/lT7lm1I53bdNYpPwJOfql86PSRRTUhOVqQcHrQNMWw
         EbzRXOJIyObVo3sTOG9DsWB/ZDphacIZQjBi//h+vaXgz5FXfo6B4IIl9MXTx85JAqw9
         IxCVsOyFGkIEotpnujhigTtoCcmqD+1TvENdaGloc90+NH8lVOX7iKIO4SQUXxnkumP+
         AK2QBetkpVYjBY9oIJaChVj4mEwXMZAcQE7nAdMb7VtmFdbteIGqqiz1u8+x5StNLhzh
         N4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743626842; x=1744231642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GNCU8yfc3FTFzqks9zu+jiiDh0WEptxt4HmGq78/Ms=;
        b=C/T6fJibmrKuM2+C3lNsnyYzgPqRqu11Z1btvc9OrMrDblOCYqgoazNDQpmYfEtsJT
         Dz81M6WS2fS+R2fH2EztVTXM0zkZdDjGLstdZEyAaoM5/ge9mbF3ROcnkyRSP8LrRZRz
         zTkrRydKDuflD4zwYCZ1wu9h0jT6R6dTDZuph4FYC5UQdRi+bB1818CcrelDpNhuXxal
         KMHr61K4f6VntFXnlbWta+4hOAVHAuS4sV+ffyOJHXYDTKYc+XM/CqJAkt010GuG8bYL
         OB5wPDdTFk+OSLHL+PJPFttfT73kk4CQoJJmiiLs8u+ZXY4MkHZiksJIZdwppNNw3HZ3
         iJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU40xUdbv5ksT4FE4b+u3OBDViyVL/BZ9jZd6i+JwinWXzsdOVo0fj0L3rYZOzbX0K3km0v58kpOAg=@vger.kernel.org, AJvYcCVGbM4tpSOBYD5MCfYy11oDZ5is1zciRN+T/mWz+CVrLnLwsX5tN+SlOucldjF5LI1KepcrWHdYeGDXoVbg@vger.kernel.org, AJvYcCWyyFq69DjTQG5xBwsGSbA99DO7B1pmll05FRncKv1ninRSOPQv7MhZ3cAksO2LAxkP1t6siROei+hCArdVcj4P1p/THg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXG9T3MpKeKavHQKhg6Z6xPNi0sVWJDLiksXi+qwtGbgubkid
	/BJskEGCl8sP5wFc1O/s/133S2zTgDDuwZ66biCbqnRlDEpCoTTOUFMPKr5w7vc4IOLQ2hTbRiE
	NJi//ecQIJTAerPUKzjCuJae/hIA=
X-Gm-Gg: ASbGncvbTXyqmARTdgjNQGHB4G15BQooaZOWGKyO1Z+RsCXo6CIWLpdWHquOu6igyc5
	HmjZMHpWCXBokMl41x47RjlDjw/DuT+A3RPC0xMMOFLVuor7ViUDulv+m4/Y5Q8Olhv1e42ueeP
	DR5S2Mv/M5+jmc2qcXwzT602zBRCk=
X-Google-Smtp-Source: AGHT+IHtsjrY6ikPaRuZVXkmVzWV65f8FoBva/1JEmKyDEewA6o4dH/DbprW+1LPA4cHrVefXUyB9kIaOu9+jitecB4=
X-Received: by 2002:ad4:5b89:0:b0:6ea:d629:f47f with SMTP id
 6a1803df08f44-6eed6260665mr230276616d6.42.1743626841739; Wed, 02 Apr 2025
 13:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-5-derekjohn.clark@gmail.com> <de122cb5-e245-43e9-8bd7-2fcff1426203@gmx.de>
In-Reply-To: <de122cb5-e245-43e9-8bd7-2fcff1426203@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 13:47:11 -0700
X-Gm-Features: AQ5f1JqSMpt03vB5okahcVkIIIlWaxd0stZ7RXQOvwD-daJxHpUtFCs63MQRBAY
Message-ID: <CAFqHKT=6iKG4UmF2-PUESCDDnLcgzon5Z3UqJd+vNrXLXf9CSQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data 01
 WMI Driver
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

On Wed, Mar 26, 2025 at 6:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>
> > Adds lenovo-wmi-capdata01 driver which provides the
> > LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> > enabled hardware. Provides an interface for querying if a given
> > attribute is supported by the hardware, as well as its default_value,
> > max_value, min_value, and step increment.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >   - Make driver data a private struct, remove references from Other Mod=
e
> >     driver.
> >   - Don't cache data at device initialization. Instead, on component bi=
nd,
> >     cache the data on a member variable of the Other Mode driver data
> >     passed as a void pointer.
> >   - Add header file for capdata01 structs.
> >   - Add new struct to pass capdata01 array data and array length to Oth=
er
> >     Mode.
> > v3:
> > - Add as component to lenovo-wmi-other driver.
> > v2:
> > - Use devm_kmalloc to ensure driver can be instanced, remove global
> >    reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> > - Use list to get the lenovo_wmi_cd01_priv instance in
> >    lenovo_wmi_capdata01_get as none of the data provided by the macros
> >    that will use it can pass a member of the struct for use in
> >    container_of.
> > ---
> >   MAINTAINERS                                 |   2 +
> >   drivers/platform/x86/Kconfig                |   4 +
> >   drivers/platform/x86/Makefile               |   1 +
> >   drivers/platform/x86/lenovo-wmi-capdata01.c | 136 +++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
> >   5 files changed, 172 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6dde75922aaf..56ead241a053 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> >   F:  Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >   F:  Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
> > +F:   drivers/platform/x86/lenovo-wmi-capdata01.h
> >   F:  drivers/platform/x86/lenovo-wmi-events.c
> >   F:  drivers/platform/x86/lenovo-wmi-events.h
> >   F:  drivers/platform/x86/lenovo-wmi-helpers.c
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 13b8f4ac5dc5..64663667f0cb 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
> >       tristate
> >       depends on ACPI_WMI
> >
> > +config LENOVO_WMI_DATA01
> > +     tristate
> > +     depends on ACPI_WMI
> > +
> >   config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index fc039839286a..7a35c77221b7 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >   obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
> >   obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> >   obj-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D lenovo-wmi-events.o
> >   obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
> >
> > diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/plat=
form/x86/lenovo-wmi-capdata01.c
> > new file mode 100644
> > index 000000000000..b6876611ffd9
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> > @@ -0,0 +1,136 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface pro=
vides
> > + * information on tunable attributes used by the "Other Mode" WMI inte=
rface,
> > + * including if it is supported by the hardware, the default_value, ma=
x_value,
> > + * min_value, and step increment.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/component.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/gfp_types.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +#include "lenovo-wmi-capdata01.h"
>
> Hi,
>
> please also include linux/acpi.h, linux/export.h and linux/module.h.
>
> > +
> > +/* Interface GUIDs */
> > +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
> > +
> > +struct lwmi_cd01_priv {
> > +     struct wmi_device *wdev;
> > +};
> > +
> > +/*
>
> /* -> /**
>
> > + * lenovo_cd01_component_bind() - On master bind, caches all capabilit=
y data on
> > + * the master device.
> > + * @cd01_dev: Pointer to the capability data 01 parent device.
> > + * @om_dev: Pointer to the other mode parent device.
> > + * @data: capdata01_list object pointer to return the capability data =
with.
> > + *
> > + * Returns: 0, or an error.
> > + */
> > +static int lenovo_cd01_component_bind(struct device *cd01_dev,
> > +                                   struct device *om_dev, void *data)
> > +{
> > +     struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> > +     int count, idx;
> > +
> > +     if (!priv)
> > +             return -ENODEV;
>
> This check is unnecessary, please drop.
>

Acked

> > +
> > +     count =3D wmidev_instance_count(priv->wdev);
> > +
> > +     if (count =3D=3D 0)
> > +             return -EINVAL;
>
> The WMI driver core already ensures that WMI devices with 0 instances are
> rejected. Please drop this check.
>

Good to know, thanks.

> > +
> > +     ((struct cd01_list *)data)->count =3D count;
> > +     ((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev, c=
ount,
> > +                                                           sizeof(stru=
ct capdata01 *),
> > +                                                           GFP_KERNEL)=
;
>
> Two things:
>
>   - using a local variable with a type of struct cd01_list * results in c=
leaner source code here
>
>   - using devres is not possible inside the component callbacks, since th=
e lifetime of the component
>     device is not necessarily tied to the lifetime of the underlying devi=
ce.
>
> I suggest you move the whole WMI data querying into lwmi_cd01_probe(), be=
cause then you can keep using
> devres.
>

Doing this in probe() puts the list on lwmi_cd01_priv. Should I copy
that data on bind, or pass back a pointer to the cd01 device struct
and use an exported function on cd01 and dev_get_drvdata to access
priv->list->data[idx] when needed? I prefer the latter as this avoids
needing to do devm memory allocation in component/master binds, then I
can check for NULL when accessing and clear the pointer on
master_unbind to avoid calling to a removed device driver.

(snip)

> > +struct cd01_list {
> > +     struct capdata01 **data;
> > +     int count;
> > +};
>
> In order to save memory you could try something like this:
>
> struct cd01_list {
>         size_t count;
>         struct capdata01 data[];
> };
>
> This way you
>
> 1. Avoid the memory fragmentation resulting from multiple memory allocati=
ons.
>
> 2. Omit two pointers when accessing the data.
>
> You can use struct_size() from linux/overflow.h to calculate the size of =
such
> an array with a trailing flexible array.
>
> Thanks,
> Armin Wolf
>

I think I have this part working in my branch. Using devm_kzalloc also
allows me to omit manually setting NULL in a few cases, which is
cleaner. Is it preferred to use struct_size() directly in the
devm_kzalloc call, or create a separate `size` variable to set the
result to and pass that into the function?

- Derek


> > +
> > +int lwmi_cd01_match(struct device *dev, void *data);
> > +
> > +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
