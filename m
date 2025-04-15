Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A851F542E;
	Tue, 15 Apr 2025 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742367; cv=none; b=ZAcRBsCX7Rvmpm0YVmZUzS/Rgj3840VB/DPpsExZFyEaUGsukgkdtreKOvuQFDHeC8tOmzkXzZTSSuS+8rySBd+6PV0QCF0pBPkqDURGodiMwq+iLLsG16K0I2jy/A036XH29pxLCzscqXr4icB4GrXy3DtGK+QUZVi1F7Ehay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742367; c=relaxed/simple;
	bh=IHu6kXYGvyO4yqRxMp3TUzOdXv7b/XZReFqwsTTZW9A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=m6VflNkya24uTAtlx0fFcN1oKS2Z/PRrtXBmMAO3HE5bqsVmw9rVxyHtQ02PrISpLKXkWQ++GecasvPmcPe7ontmTBRXbl+r0hBi0gX9tuk276qaaqq1u1lQvgu6y3CM9bFnQKlJ7lPASHHubJmI6ZhPzLtXyC5VIDu2WsvtjIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHw2vUvX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHw2vUvX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223fb0f619dso64602435ad.1;
        Tue, 15 Apr 2025 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742364; x=1745347164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=knPWDZ2uLLo1Zcvn+6PW5Ao7CxFehpzDQIJPXXt8xN8=;
        b=RHw2vUvXDUqKY5eQtTHDeVy7AFxlWY9wsmHx+8hwkV3+VpbcJ0ojkYlQ7TFIdKSuo6
         mLBTEeTwMlK0+s6Mdc4p/Hs2lQWXjtX4zYqNEGY1V5vhWphSDGmXB0NmjuhuPPHd3bHA
         jO9Gkk2QwqINac5cgFmQZ8guEXzsKGa5xtxQV9Y5c4apx57hF1l81Nt3cgJW3II2fQ6n
         fgbuWmA/qobiVOvj6+9UxH2AAF5MV2w+SBFGkVuyZulNwPuclbKkzoOS74BJrShmYU1V
         6gQwl1xOOjd+0ypkwPcCubrCOsisIxSxckc5w1uCVYYAXMNJOrXzWipV5LJaKaEPH0Lg
         Zb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742364; x=1745347164;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knPWDZ2uLLo1Zcvn+6PW5Ao7CxFehpzDQIJPXXt8xN8=;
        b=xLAkmfiUCz2AyE7Ip1ZRtMSz2X3lMCt3nsSYV/4NYx4cOvLw2B9F+OorACV2zuOfyN
         GR56CXqn9g+FPuvlAO/jj0/OdBtoeOu054KE6ETSWvQRTgQiViAkx1y14IM9bBfXoeek
         50t/adHXWhOKxSAl5oC2rp4f8x6YtEAD6TIM0WIPYS2YKsIhRrYa744zO1itC8g9w2as
         0lRgf1fq6Vi6yf9LopQTOqMHNmlmqlh7owarepmLxPyK1VR3JIzu1O4KfIRoHBYQgSTM
         nzPwWN8Q7GvKwcQoOhqluHvRN4kU1BRgTV1XSV/8evMvZIctpAUGWDD8qHbgLZou74BL
         SWbA==
X-Forwarded-Encrypted: i=1; AJvYcCV/kpoo8rQe3GmF1su3dI1GXwQ/VnLz/MNQnw0pxpYnOaffnJfrBSXseNg+740hzjIKgYkGFyOTiVYgcKT2@vger.kernel.org, AJvYcCX4PP8revZvS+iB4ZoT1YnF3ip0rvoh3oftbhG6p7BxHLoSG4SJNXBTVwYYE1N13NqfmjNTDuJcZKM=@vger.kernel.org, AJvYcCXWsAs5q0Cu7k+a1vv7CJyjwDXoXdT9sVLIVeXeyExJ00/bPC2iUXoQMmZs3tOLaWVmwVA6HJa/ES7daNko4N8D8M8RCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSfbraVE3NYx+FKSprCUV1idlqew7HWyp9EbFrz/9PKeWABUTa
	zrqrkpS1PI8TH5iWLTkhtLpzZqiH5PiyParOVSD6DOtwknXh/UYT
X-Gm-Gg: ASbGncsqj/p6xm3VptgxuoqbRz/cigqan5lJSvOajl7cAWmfqYAoDh+AhKNPNgmkPMG
	/kdTi2G8HtrDBHSQIZACKhaf+E1OIWLxb4ClvpsDHw8GzTA6tR4QhNSKak46q1csjiCwZ86ihBZ
	yVHKBVKVj9xIRvsf2Hy13duosWv7dA66idLZOmUglL3vD3OgPT05MqoKM7wDYmeABmFw6BqmyXB
	F6+dE/wCcZ/wkY+yo9wYNKWh0kliHf7DIjxdu6lYHlYf9RW3CuhQdT82NBfc8bCmWBqV13Gvatc
	J2eJcSf87fW5MnHVLgeBTRwEHPz4+YOA7p/5WO6bp6nSA4C0n32wHOE8DMPcRgNwuR9+
X-Google-Smtp-Source: AGHT+IGSXYwo6728/Gmmug8oAyZtJSpqMmcmLXkF+WYgKF/BrvXlHKeBLF0yrx1hE54MDXyuyU1HPQ==
X-Received: by 2002:a17:903:2a8e:b0:223:501c:7576 with SMTP id d9443c01a7336-22c318cb0d6mr3710905ad.12.1744742363875;
        Tue, 15 Apr 2025 11:39:23 -0700 (PDT)
Received: from [127.0.0.1] ([203.105.74.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c69bsm121254405ad.72.2025.04.15.11.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 11:39:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 03:39:24 +0900
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
User-Agent: Thunderbird for Android
In-Reply-To: <CAFqHKTniVCD-Yqu0=PyZd0yezMYVaiNx_adn7sjmw4kXx0QaiQ@mail.gmail.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com> <20250408012815.1032357-7-derekjohn.clark@gmail.com> <097d5f0e-b7e5-a528-1eff-5f7aceacbbca@linux.intel.com> <CAFqHKTniVCD-Yqu0=PyZd0yezMYVaiNx_adn7sjmw4kXx0QaiQ@mail.gmail.com>
Message-ID: <687AAA12-14D7-4DA3-A469-425955AAEDEC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, Apr 11, 2025, 07:54 Derek John Clark <derekjohn=2Eclark@gmail=2Eco=
m>=20
wrote:

> On Tue, Apr 8, 2025 at 5:50=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo=2Ejarvinen@linux=2Eintel=2Ecom> wrote:
> >
> > On Mon, 7 Apr 2025, Derek J=2E Clark wrote:
> >
> > > Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" =
WMI
> > > interface that comes on some Lenovo "Gaming Series" hardware=2E Prov=
ides=20
> a
> > > firmware-attributes class which enables the use of tunable knobs for=
=20
> SPL,
> > > SPPT, and FPPT=2E
> > >
> > > Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
> > > ---
> > > v5:
> > > - Switch from locally storing capability data list to storing a poin=
ter
> > >   from the capability data interface=2E
> > > - Add portion of Gamezone driver that relies on the exported functio=
ns
> > >   of this driver=2E
> > > - Properly initialize IDA and use it for naming the firmware-attribu=
tes
> > >   path=2E
> > > - Rename most defines to clearly indicate they are from this driver=
=2E
> > > - Misc fixes from v4 review=2E
> > > v4:
> > > - Treat Other Mode as a notifier chain head, use the notifier chain =
to
> > >   get the current mode from Gamezone=2E
> > > - Add header file for Other Mode specific structs and finctions=2E
> > > - Use component master bind to cache the capdata01 array locally=2E
> > > - Drop all reference to external driver private data structs=2E
> > > - Various fixes from review=2E
> > > v3:
> > > - Add notifier block and store result for getting the Gamezone=20
> interface
> > >   profile changes=2E
> > > - Add driver as master component of capdata01 driver=2E
> > > - Use FIELD_PREP where appropriate=2E
> > > - Move macros and associated functions out of lemovo-wmi=2Eh that ar=
e=20
> only
> > >   used by this driver=2E
> > > v2:
> > > - Use devm_kmalloc to ensure driver can be instanced, remove global
> > >   reference=2E
> > > - Ensure reverse Christmas tree for all variable declarations=2E
> > > - Remove extra whitespace=2E
> > > - Use guard(mutex) in all mutex instances, global mutex=2E
> > > - Use pr_fmt instead of adding the driver name to each pr_err=2E
> > > - Remove noisy pr_info usage=2E
> > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv=
=2E
> > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > >   called functions as the data provided by the macros that use it
> > >   doesn't pass a member of the struct for use in container_of=2E
> > > - Do not rely on GameZone interface to grab the current fan mode=2E
> > > ---
> > >  MAINTAINERS                                |   2 +
> > >  drivers/platform/x86/Kconfig               |  15 +
> > >  drivers/platform/x86/Makefile              |   1 +
> > >  drivers/platform/x86/lenovo-wmi-gamezone=2Ec |  35 ++
> > >  drivers/platform/x86/lenovo-wmi-other=2Ec    | 677 ++++++++++++++++=
+++++
> > >  drivers/platform/x86/lenovo-wmi-other=2Eh    |  16 +
> > >  6 files changed, 746 insertions(+)
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Ec
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-other=2Eh
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 49deb8ea4ea7=2E=2E0416afd997a0 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13172,6 +13172,8 @@ F:   =20
> drivers/platform/x86/lenovo-wmi-gamezone=2Ec
> > >  F:   drivers/platform/x86/lenovo-wmi-gamezone=2Eh
> > >  F:   drivers/platform/x86/lenovo-wmi-helpers=2Ec
> > >  F:   drivers/platform/x86/lenovo-wmi-helpers=2Eh
> > > +F:   drivers/platform/x86/lenovo-wmi-other=2Ec
> > > +F:   drivers/platform/x86/lenovo-wmi-other=2Eh
> > >
> > >  LENOVO WMI HOTKEY UTILITIES DRIVER
> > >  M:   Jackie Dong <xy-jackie@139=2Ecom>
> > > diff --git a/drivers/platform/x86/Kconfig=20
> b/drivers/platform/x86/Kconfig
> > > index aaa1a69c10ca=2E=2Ebe5ab24960b5 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
> > >       tristate
> > >       depends on ACPI_WMI
> > >
> > > +config LENOVO_WMI_TUNING
> > > +     tristate "Lenovo Other Mode WMI Driver"
> > > +     depends on ACPI_WMI
> > > +     select FW_ATTR_CLASS
> > > +     select LENOVO_WMI_DATA01
> > > +     select LENOVO_WMI_EVENTS
> > > +     select LENOVO_WMI_HELPERS
> > > +     help
> > > +       Say Y here if you have a WMI aware Lenovo Legion device and=
=20
> would like to use the
> > > +       firmware_attributes API to control various tunable settings=
=20
> typically exposed by
> > > +       Lenovo software in Windows=2E
> > > +
> > > +       To compile this driver as a module, choose M here: the modul=
e=20
> will
> > > +       be called lenovo-wmi-other=2E
> > > +
> > >  config IDEAPAD_LAPTOP
> > >       tristate "Lenovo IdeaPad Laptop Extras"
> > >       depends on ACPI
> > > diff --git a/drivers/platform/x86/Makefile=20
> b/drivers/platform/x86/Makefile
> > > index 60058b547de2=2E=2Ef3e64926a96b 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D=20
> lenovo-wmi-capdata01=2Eo
> > >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events=2Eo
> > >  obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone=2Eo
> > >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers=2Eo
> > > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other=2Eo
> > >
> > >  # Intel
> > >  obj-y                                +=3D intel/
> > > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone=2Ec=20
> b/drivers/platform/x86/lenovo-wmi-gamezone=2Ec
> > > index 2e6d5e7faadf=2E=2E9c80561f931c 100644
> > > --- a/drivers/platform/x86/lenovo-wmi-gamezone=2Ec
> > > +++ b/drivers/platform/x86/lenovo-wmi-gamezone=2Ec
> > > @@ -22,6 +22,7 @@
> > >  #include "lenovo-wmi-events=2Eh"
> > >  #include "lenovo-wmi-gamezone=2Eh"
> > >  #include "lenovo-wmi-helpers=2Eh"
> > > +#include "lenovo-wmi-other=2Eh"
> > >
> > >  #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > >
> > > @@ -49,6 +50,34 @@ static struct quirk_entry quirk_no_extreme_bug =
=3D {
> > >       =2Eextreme_supported =3D false,
> > >  };
> > >
> > > +/**
> > > + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver=20
> notifier=2E
> > > + *
> > > + * @nb: The notifier_block registered to lenovo-wmi-other driver=2E
> > > + * @cmd: The event type=2E
> > > + * @data: Thermal mode enum pointer pointer for returning the therm=
al=20
> mode=2E
> > > + *
> > > + * For LWMI_GZ_GET_THERMAL_MODE, retrieve the current thermal mode=
=2E
> > > + *
> > > + * Return: Notifier_block status=2E
> > > + */
> > > +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned lo=
ng=20
> cmd,
> > > +                          void *data)
> > > +{
> > > +     enum thermal_mode **mode =3D data;
> > > +     struct lwmi_gz_priv *priv;
> > > +
> > > +     priv =3D container_of(nb, struct lwmi_gz_priv, mode_nb);
> > > +
> > > +     switch (cmd) {
> > > +     case LWMI_GZ_GET_THERMAL_MODE:
> > > +             **mode =3D priv->current_mode;
> > > +             return NOTIFY_STOP;
> > > +     default:
> > > +             return NOTIFY_DONE;
> > > +     }
> > > +}
> > > +
> > >  /**
> > >   * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver=
=20
> notifier=2E
> > >   * block call chain=2E
> > > @@ -347,6 +376,11 @@ static int lwmi_gz_probe(struct wmi_device *wde=
v,=20
> const void *context)
> > >       if (ret)
> > >               return ret;
> > >
> > > +     priv->mode_nb=2Enotifier_call =3D lwmi_gz_mode_call;
> > > +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode=
_nb);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -369,6 +403,7 @@ module_wmi_driver(lwmi_gz_driver);
> > >
> > >  MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> > >  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > > +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> > >  MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> > >  MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
> > >  MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> > > diff --git a/drivers/platform/x86/lenovo-wmi-other=2Ec=20
> b/drivers/platform/x86/lenovo-wmi-other=2Ec
> > > new file mode 100644
> > > index 000000000000=2E=2E342883a90270
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-other=2Ec
> > > @@ -0,0 +1,677 @@
> > > +// SPDX-License-Identifier: GPL-2=2E0-or-later
> > > +/*
> > > + * Lenovo Other Mode WMI interface driver=2E
> > > + *
> > > + * This driver uses the fw_attributes class to expose the various W=
MI=20
> functions
> > > + * provided by the "Other Mode" WMI interface=2E This enables CPU a=
nd=20
> GPU power
> > > + * limit as well as various other attributes for devices that fall=
=20
> under the
> > > + * "Gaming Series" of Lenovo laptop devices=2E Each attribute expos=
ed=20
> by the
> > > + * "Other Mode"" interface has a corresponding Capability Data stru=
ct=20
> that
> > > + * allows the driver to probe details about the attribute such as i=
f=20
> it is
> > > + * supported by the hardware, the default_value, max_value,=20
> min_value, and step
> > > + * increment=2E
> > > + *
> > > + * These attributes typically don't fit anywhere else in the sysfs=
=20
> and are set
> > > + * in Windows using one of Lenovo's multiple user applications=2E
> > > + *
> > > + * Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Eco=
m>
> > > + */
> > > +
> > > +#include <linux/acpi=2Eh>
> > > +#include <linux/bitfield=2Eh>
> > > +#include <linux/cleanup=2Eh>
> > > +#include <linux/component=2Eh>
> > > +#include <linux/container_of=2Eh>
> > > +#include <linux/device=2Eh>
> > > +#include <linux/export=2Eh>
> > > +#include <linux/gfp_types=2Eh>
> > > +#include <linux/idr=2Eh>
> > > +#include <linux/kobject=2Eh>
> > > +#include <linux/module=2Eh>
> > > +#include <linux/notifier=2Eh>
> > > +#include <linux/platform_profile=2Eh>
> > > +#include <linux/types=2Eh>
> > > +#include <linux/wmi=2Eh>
> > > +
> > > +#include "lenovo-wmi-capdata01=2Eh"
> > > +#include "lenovo-wmi-events=2Eh"
> > > +#include "lenovo-wmi-gamezone=2Eh"
> > > +#include "lenovo-wmi-helpers=2Eh"
> > > +#include "lenovo-wmi-other=2Eh"
> > > +#include "firmware_attributes_class=2Eh"
> > > +
> > > +#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3=
B"
> > > +
> > > +#define LWMI_DEVICE_ID_CPU 0x01
> > > +
> > > +#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> > > +#define LWMI_FEATURE_ID_CPU_SPL 0x02
> > > +#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> >
> > Align values in every define group=2E
> >
> > > +
> > > +#define LWMI_TYPE_ID_NONE 0x00
> > > +
> > > +#define LWMI_FEATURE_VALUE_GET 17
> > > +#define LWMI_FEATURE_VALUE_SET 18
> > > +
> > > +#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> > > +#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > > +#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> > > +#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> > > +
> > > +#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> > > +
> > > +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> > > +static DEFINE_IDA(lwmi_om_ida);
> > > +
> > > +enum attribute_property {
> > > +     DEFAULT_VAL,
> > > +     MAX_VAL,
> > > +     MIN_VAL,
> > > +     STEP_VAL,
> > > +     SUPPORTED,
> > > +};
> > > +
> > > +struct lwmi_om_priv {
> > > +     struct component_master_ops *ops;
> > > +     /* *cd01_list is only valid after master bind and while=20
> capdata01 exists */
> > > +     struct cd01_list *cd01_list;
> > > +     struct device *fw_attr_dev;
> > > +     struct kset *fw_attr_kset;
> > > +     struct notifier_block nb;
> > > +     struct wmi_device *wdev;
> > > +     int ida_id;
> > > +};
> > > +
> > > +struct tunable_attr_01 {
> > > +     struct capdata01 *capdata;
> > > +     struct device *dev;
> > > +     u32 feature_id;
> > > +     u32 device_id;
> > > +     u32 type_id;
> > > +};
> > > +
> > > +struct tunable_attr_01 ppt_pl1_spl =3D { =2Edevice_id =3D=20
> LWMI_DEVICE_ID_CPU,
> > > +                                    =2Efeature_id =3D=20
> LWMI_FEATURE_ID_CPU_SPL,
> > > +                                    =2Etype_id =3D LWMI_TYPE_ID_NON=
E };
> > > +struct tunable_attr_01 ppt_pl2_sppt =3D { =2Edevice_id =3D=20
> LWMI_DEVICE_ID_CPU,
> > > +                                     =2Efeature_id =3D=20
> LWMI_FEATURE_ID_CPU_SPPT,
> > > +                                     =2Etype_id =3D LWMI_TYPE_ID_NO=
NE };
> > > +struct tunable_attr_01 ppt_pl3_fppt =3D { =2Edevice_id =3D=20
> LWMI_DEVICE_ID_CPU,
> > > +                                     =2Efeature_id =3D=20
> LWMI_FEATURE_ID_CPU_FPPT,
> > > +                                     =2Etype_id =3D LWMI_TYPE_ID_NO=
NE };
> > > +
> > > +struct capdata01_attr_group {
> > > +     const struct attribute_group *attr_group;
> > > +     struct tunable_attr_01 *tunable_attr;
> > > +};
> > > +
> > > +/**
> > > + * lwmi_om_register_notifier() - Add a notifier to the blocking=20
> notifier chain
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call blocking_notifier_chain_register to register the notifier=
=20
> block to the
> > > + * lenovo-wmi-other driver notifer chain=2E
> > > + *
> > > + * Return: 0 on success, %-EEXIST on error=2E
> > > + */
> > > +int lwmi_om_register_notifier(struct notifier_block *nb)
> > > +{
> > > +     return blocking_notifier_chain_register(&om_chain_head, nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER")=
;
> > > +
> > > +/**
> > > + * lwmi_om_unregister_notifier() - Remove a notifier from the=20
> blocking notifier
> > > + * chain=2E
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call blocking_notifier_chain_unregister to unregister the notifi=
er=20
> block from the
> > > + * lenovo-wmi-other driver notifer chain=2E
> > > + *
> > > + * Return: 0 on success, %-ENOENT on error=2E
> > > + */
> > > +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> > > +{
> > > +     return blocking_notifier_chain_unregister(&om_chain_head, nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER=
");
> > > +
> > > +/**
> > > + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the=
=20
> blocking
> > > + * notifier chain=2E
> > > + * @data: Void pointer to the notifier_block struct to register=2E
> > > + *
> > > + * Call lwmi_om_unregister_notifier to unregister the notifier bloc=
k=20
> from the
> > > + * lenovo-wmi-other driver notifer chain=2E
> > > + *
> > > + * Return: 0 on success, %-ENOENT on error=2E
> > > + */
> > > +static void devm_lwmi_om_unregister_notifier(void *data)
> > > +{
> > > +     struct notifier_block *nb =3D data;
> > > +
> > > +     lwmi_om_unregister_notifier(nb);
> > > +}
> > > +
> > > +/**
> > > + * devm_lwmi_om_register_notifier() - Add a notifier to the blockin=
g=20
> notifier
> > > + * chain=2E
> > > + * @dev: The parent device of the notifier_block struct=2E
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call lwmi_om_register_notifier to register the notifier block to=
=20
> the
> > > + * lenovo-wmi-other driver notifer chain=2E Then add=20
> devm_lwmi_om_unregister_notifier
> > > + * as a device managed ation to automatically unregister the notifi=
er=20
> block
> > > + * upon parent device removal=2E
> > > + *
> > > + * Return: 0 on success, or on error=2E
> > > + */
> > > +int devm_lwmi_om_register_notifier(struct device *dev,
> > > +                                struct notifier_block *nb)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D lwmi_om_register_notifier(nb);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     return devm_add_action_or_reset(dev,=20
> devm_lwmi_om_unregister_notifier,
> > > +                                     nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier,=20
> "LENOVO_WMI_OTHER");
> > > +
> > > +/**
> > > + * lwmi_om_notifier_call() - Call functions for the notifier call=
=20
> chain=2E
> > > + * @mode: Pointer to a thermal mode enum to retrieve the data from=
=2E
> > > + *
> > > + * Call blocking_notifier_call_chain to retrieve the thermal mode=
=20
> from the
> > > + * lenovo-wmi-gamezone driver=2E
> > > + *
> > > + * Return: 0 on success, or on error=2E
> > > + */
> > > +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D blocking_notifier_call_chain(&om_chain_head,=20
> LWMI_GZ_GET_THERMAL_MODE, &mode);
> > > +     if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +/* Attribute Methods */
> > > +
> > > +/**
> > > + * int_type_show() - Emit the data type for an integer attribute
> > > + * @kobj: Pointer to the driver object=2E
> > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > + * @buf: The buffer to write to=2E
> > > + *
> > > + * Return: Number of characters written to buf=2E
> > > + */
> > > +static ssize_t int_type_show(struct kobject *kobj, struct=20
> kobj_attribute *kattr,
> > > +                          char *buf)
> > > +{
> > > +     return sysfs_emit(buf, "integer\n");
> > > +}
> > > +
> > > +/**
> > > + * attr_capdata01_get - Get the data of the specified attribute
> > > + * @tunable_attr: The attribute to be populated=2E
> > > + *
> > > + * Retrieves the capability data 01 struct pointer for the given
> > > + * attribute for its specified thermal mode=2E
> > > + *
> > > + * Return: Either a pointer to capability data, or NULL=2E
> > > + */
> > > +static struct capdata01 *attr_capdata01_get_data(struct lwmi_om_pri=
v=20
> *priv,
> > > +                                              u32 attribute_id)
> > > +{
> > > +     int idx;
> > > +
> > > +     for (idx =3D 0; idx < priv->cd01_list->count; idx++) {
> >
> > The convention for loop variables that count from 0 upwards is to use
> > unsigned type=2E
> >
> > > +             if (priv->cd01_list->data[idx]=2Eid !=3D attribute_id)
> > > +                     continue;
> > > +             return &priv->cd01_list->data[idx];
> > > +     }
> > > +     return NULL;
> > > +}
> > > +
> > > +/**
> > > + * attr_capdata01_show() - Get the value of the specified attribute=
=20
> property
> > > + *
> > > + * @kobj: Pointer to the driver object=2E
> > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > + * @buf: The buffer to write to=2E
> > > + * @tunable_attr: The attribute to be read=2E
> > > + * @prop: The property of this attribute to be read=2E
> > > + *
> > > + * Retrieves the given property from the capability data 01 struct=
=20
> for the
> > > + * specified attribute's "custom" thermal mode=2E This function is=
=20
> intended
> > > + * to be generic so it can be called from any integer attributes=20
> "_show"
> > > + * function=2E
> > > + *
> > > + * If the WMI is success the sysfs attribute is notified=2E
> >
> > Add comma after success=2E
> >
> > > + *
> > > + * Return: Either number of characters written to buf, or an error=
=2E
> > > + */
> > > +static ssize_t attr_capdata01_show(struct kobject *kobj,
> > > +                                struct kobj_attribute *kattr, char=
=20
> *buf,
> > > +                                struct tunable_attr_01 *tunable_att=
r,
> > > +                                enum attribute_property prop)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->de=
v);
> > > +     struct capdata01 *capdata;
> > > +     u32 attribute_id;
> > > +     int value;
> > > +
> > > +     attribute_id =3D
> > > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,=20
> tunable_attr->device_id) |
> > > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,=20
> tunable_attr->feature_id) |
> > > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,=20
> LWMI_GZ_THERMAL_MODE_CUSTOM) |
> > > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,=20
> tunable_attr->type_id);
> > > +
> > > +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
> > > +
> > > +     if (!capdata)
> > > +             return -ENODEV;
> > > +
> > > +     switch (prop) {
> > > +     case DEFAULT_VAL:
> > > +             value =3D capdata->default_value;
> > > +             break;
> > > +     case MAX_VAL:
> > > +             value =3D capdata->max_value;
> > > +             break;
> > > +     case MIN_VAL:
> > > +             value =3D capdata->min_value;
> > > +             break;
> > > +     case STEP_VAL:
> > > +             value =3D capdata->step;
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> > > +     }
> > > +     return sysfs_emit(buf, "%d\n", value);
> > > +}
> > > +
> > > +/**
> > > + * att_current_value_store() - Set the current value of the given=
=20
> attribute
> > > + * @kobj: Pointer to the driver object=2E
> > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > + * @buf: The buffer to read from, this is parsed to `int` type=2E
> > > + * @count: Required by sysfs attribute macros, pass in from the=20
> callee attr=2E
> > > + * @tunable_attr: The attribute to be stored=2E
> > > + *
> > > + * Sets the value of the given attribute when operating under the=
=20
> "custom"
> > > + * smartfan profile=2E The current smartfan profile is retrieved fr=
om=20
> the
> > > + * lenovo-wmi-gamezone driver and error is returned if the result i=
s=20
> not
> > > + * "custom"=2E This function is intended to be generic so it can be=
=20
> called from
> > > + * any integer attribute's "_store" function=2E The integer to be s=
ent=20
> to the WMI
> > > + * method is range checked and an error is returned if out of range=
=2E
> > > + *
> > > + * If the value is valid and WMI is success, then the sysfs attribu=
te=20
> is
> > > + * notified=2E
> > > + *
> > > + * Return: Either count, or an error=2E
> > > + */
> > > +static ssize_t attr_current_value_store(struct kobject *kobj,
> > > +                                     struct kobj_attribute *kattr,
> > > +                                     const char *buf, size_t count,
> > > +                                     struct tunable_attr_01=20
> *tunable_attr)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->de=
v);
> > > +     struct wmi_method_args_32 args;
> > > +     struct capdata01 *capdata;
> > > +     enum thermal_mode mode;
> > > +     u32 attribute_id;
> > > +     u32 value;
> > > +     int err;
> > > +
> > > +     err =3D lwmi_om_notifier_call(&mode);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
> > > +             return -EBUSY;
> > > +
> > > +     attribute_id =3D
> > > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,=20
> tunable_attr->device_id) |
> >
> > Just combine this to the previous line and realign the ones below=2E
> >
> > > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,=20
> tunable_attr->feature_id) |
> > > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,=20
> tunable_attr->type_id);
> > > +
> > > +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
> > > +
> > > +     if (!capdata)
> > > +             return -ENODEV;
> > > +
> > > +     err =3D kstrtouint(buf, 10, &value);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     if (value < capdata->min_value || value > capdata->max_value)
> > > +             return -EINVAL;
> > > +
> > > +     args=2Earg0 =3D attribute_id;
> > > +     args=2Earg1 =3D value;
> > > +
> > > +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0,=20
> LWMI_FEATURE_VALUE_SET,
> > > +                                 (unsigned char *)&args,=20
> sizeof(args), NULL);
> > > +
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     return count;
> > > +};
> > > +
> > > +/**
> > > + * attr_current_value_show() - Get the current value of the given=
=20
> attribute
> > > + * @kobj: Pointer to the driver object=2E
> > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > + * @buf: The buffer to write to=2E
> > > + * @tunable_attr: The attribute to be read=2E
> > > + *
> > > + * Retrieves the value of the given attribute for the current=20
> smartfan profile=2E
> > > + * The current smartfan profile is retrieved from the=20
> lenovo-wmi-gamezone driver=2E
> > > + * This function is intended to be generic so it can be called from=
=20
> any integer
> > > + * attribute's "_show" function=2E
> > > + *
> > > + * If the WMI is success the sysfs attribute is notified=2E
> > > + *
> > > + * Return: Either number of characters written to buf, or an error=
=2E
> > > + */
> > > +static ssize_t attr_current_value_show(struct kobject *kobj,
> > > +                                    struct kobj_attribute *kattr,=
=20
> char *buf,
> > > +                                    struct tunable_attr_01=20
> *tunable_attr)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->de=
v);
> > > +     struct wmi_method_args_32 args;
> > > +     enum thermal_mode mode;
> > > +     u32 attribute_id;
> > > +     int retval;
> > > +     int err;
> > > +
> > > +     err =3D lwmi_om_notifier_call(&mode);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     attribute_id =3D
> > > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK,=20
> tunable_attr->device_id) |
> >
> > Ditto=2E
> >
> > > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK,=20
> tunable_attr->feature_id) |
> > > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK,=20
> tunable_attr->type_id);
> > > +
> > > +     args=2Earg0 =3D attribute_id;
> > > +
> > > +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0,=20
> LWMI_FEATURE_VALUE_GET,
> > > +                                 (unsigned char *)&args, sizeof(arg=
s),
> > > +                                 &retval);
> > > +
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     return sysfs_emit(buf, "%d\n", retval);
> > > +}
> > > +
> > > +/* Lenovo WMI Other Mode Attribute macros */
> > > +#define __LWMI_ATTR_RO(_func, _name)                               =
  =20
> \
> > > +     {                                                             =
\
> > > +             =2Eattr =3D { =2Ename =3D __stringify(_name), =2Emode =
=3D 0444 }, \
> > > +             =2Eshow =3D _func##_##_name##_show,                   =
    \
> > > +     }
> > > +
> > > +#define __LWMI_ATTR_RO_AS(_name, _show)                            =
 =20
>  \
> > > +     {                                                             =
\
> > > +             =2Eattr =3D { =2Ename =3D __stringify(_name), =2Emode =
=3D 0444 }, \
> > > +             =2Eshow =3D _show,                                    =
    \
> > > +     }
> > > +
> > > +#define __LWMI_ATTR_RW(_func, _name) \
> > > +     __ATTR(_name, 0644, _func##_##_name##_show,=20
> _func##_##_name##_store)
> > > +
> > > +/* Shows a formatted static variable */
> > > +#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)         =
  =20
>          \
> > > +     static ssize_t _attrname##_##_prop##_show(                    =
 =20
>        \
> > > +             struct kobject *kobj, struct kobj_attribute *kattr, ch=
ar=20
> *buf) \
> > > +     {                                                             =
  =20
>       \
> > > +             return sysfs_emit(buf, _fmt, _val);                   =
  =20
>       \
> > > +     }                                                             =
  =20
>       \
> > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D   =
    =20
>       \
> > > +             __LWMI_ATTR_RO(_attrname, _prop)
> > > +
> > > +/* Attribute current value read/write */
> > > +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)              =
 =20
>           \
> > > +     static ssize_t _attrname##_current_value_store(               =
  =20
>       \
> > > +             struct kobject *kobj, struct kobj_attribute *kattr,   =
  =20
>       \
> > > +             const char *buf, size_t count)                        =
 =20
>        \
> > > +     {                                                             =
  =20
>       \
> > > +             return attr_current_value_store(kobj, kattr, buf,=20
> count,       \
> > > +                                             &_attrname);          =
 =20
>        \
> > > +     }                                                             =
  =20
>       \
> > > +     static ssize_t _attrname##_current_value_show(                =
 =20
>        \
> > > +             struct kobject *kobj, struct kobj_attribute *kattr, ch=
ar=20
> *buf) \
> > > +     {                                                             =
  =20
>       \
> > > +             return attr_current_value_show(kobj, kattr, buf,=20
> &_attrname);  \
> > > +     }                                                             =
  =20
>       \
> > > +     static struct kobj_attribute attr_##_attrname##_current_value =
=3D =20
>       \
> > > +             __LWMI_ATTR_RW(_attrname, current_value)
> > > +
> > > +/* Attribute property read only */
> > > +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)      =
 =20
>           \
> > > +     static ssize_t _attrname##_##_prop##_show(                    =
 =20
>        \
> > > +             struct kobject *kobj, struct kobj_attribute *kattr, ch=
ar=20
> *buf) \
> > > +     {                                                             =
  =20
>       \
> > > +             return attr_capdata01_show(kobj, kattr, buf,=20
> &_attrname,       \
> > > +                                        _prop_type);               =
  =20
>       \
> > > +     }                                                             =
  =20
>       \
> > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D   =
    =20
>       \
> > > +             __LWMI_ATTR_RO(_attrname, _prop)
> > > +
> > > +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname=
) =20
>     \
> > > +     __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                =
 =20
>   \
> > > +     __LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL)=
; =20
>  \
> > > +     __LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n",=20
> _dispname); \
> > > +     __LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);       =
  =20
>  \
> > > +     __LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);       =
  =20
>  \
> > > +     __LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL)=
; =20
>  \
> > > +     static struct kobj_attribute attr_##_attrname##_type =3D      =
   =20
>   \
> > > +             __LWMI_ATTR_RO_AS(type, int_type_show);               =
  =20
>  \
> > > +     static struct attribute *_attrname##_attrs[] =3D {            =
   =20
>   \
> > > +             &attr_##_attrname##_current_value=2Eattr,             =
    =20
>  \
> > > +             &attr_##_attrname##_default_value=2Eattr,             =
    =20
>  \
> > > +             &attr_##_attrname##_display_name=2Eattr,              =
   =20
>   \
> > > +             &attr_##_attrname##_max_value=2Eattr,                 =
    =20
>  \
> > > +             &attr_##_attrname##_min_value=2Eattr,                 =
    =20
>  \
> > > +             &attr_##_attrname##_scalar_increment=2Eattr,          =
   =20
>   \
> > > +             &attr_##_attrname##_type=2Eattr,                      =
   =20
>   \
> > > +             NULL,                                                 =
  =20
>  \
> > > +     };                                                            =
 =20
>   \
> > > +     static const struct attribute_group _attrname##_attr_group =3D=
 { =20
>   \
> > > +             =2Ename =3D _fsname, =2Eattrs =3D _attrname##_attrs   =
          =20
>  \
> > > +     }
> > > +
> > > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > > +                           "Set the CPU sustained power limit");
> > > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > > +                           "Set the CPU slow package power tracking=
=20
> limit");
> > > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > > +                           "Set the CPU fast package power tracking=
=20
> limit");
> > > +
> > > +static struct capdata01_attr_group cd01_attr_groups[] =3D {
> > > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > > +     {},
> > > +};
> > > +
> > > +/**
> > > + * lwmi_om_fw_attr_add() - Register all firmware_attributes_class=
=20
> members
> > > + * @priv: The Other Mode driver data=2E
> > > + *
> > > + * Return: Either 0, or an error=2E
> > > + */
> > > +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > > +{
> > > +     unsigned int i;
> > > +     int err;
> > > +
> > > +     priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
> > > +     if (priv->ida_id < 0)
> > > +             return priv->ida_id;
> > > +
> > > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class=
,=20
> NULL,
> > > +                                       MKDEV(0, 0), NULL, "%s-%u",
> > > +                                       LWMI_OM_FW_ATTR_BASE_PATH,
> > > +                                       priv->ida_id);
> > > +     if (IS_ERR(priv->fw_attr_dev)) {
> >
> > Add include for IS_ERR()=2E
> >
> > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > +             goto err_free_ida;
> > > +     }
> > > +
> > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,=
=20
> &priv->fw_attr_dev->kobj);
> > > +     if (!priv->fw_attr_kset) {
> > > +             err =3D -ENOMEM;
> > > +             goto err_destroy_classdev;
> > > +     }
> > > +
> > > +     for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> >
> > Add include for ARRAY_SIZE()=2E
> >
> > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,=
=20
> cd01_attr_groups[i]=2Eattr_group);
> > > +             if (err)
> > > +                     goto err_remove_groups;
> > > +
> > > +             cd01_attr_groups[i]=2Etunable_attr->dev =3D &priv->wde=
v->dev;
> > > +     }
> > > +     return 0;
> > > +
> > > +err_remove_groups:
> > > +     while (i--)
> > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,=20
> cd01_attr_groups[i]=2Eattr_group);
> > > +
> > > +     kset_unregister(priv->fw_attr_kset);
> > > +
> > > +err_destroy_classdev:
> > > +     device_unregister(priv->fw_attr_dev);
> > > +
> > > +err_free_ida:
> > > +     ida_free(&lwmi_om_ida, priv->ida_id);
> > > +     return err;
> > > +}
> > > +
> > > +/**
> > > + * lwmi_om_fw_attr_remove() - Unregister all capability data=20
> attribute groups
> > > + * @priv: the lenovo-wmi-other driver data=2E
> > > + */
> > > +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> > > +{
> > > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - =
1;=20
> i++)
> > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,=20
> cd01_attr_groups[i]=2Eattr_group);
> > > +
> > > +     kset_unregister(priv->fw_attr_kset);
> > > +     device_unregister(priv->fw_attr_dev);
> > > +}
> > > +
> > > +/**
> > > + * lwmi_om_master_bind() - Bind all components of the other mode=20
> driver
> > > + * @dev: The lenovo-wmi-other driver basic device=2E
> > > + *
> > > + * Call component_bind_all to bind the lenovo-wmi-capdata01 driver =
to=20
> the
> > > + * lenovo-wmi-other master driver=2E On success, assign the capabil=
ity=20
> data 01
> > > + * list pointer to the driver data struct for later access=2E This=
=20
> pointer
> > > + * is only valid while the capdata01 interface exists=2E Finally,=
=20
> register all
> > > + * firmware attribute groups=2E
> > > + *
> > > + * Return: 0 on success, or an error=2E
> > > + */
> > > +static int lwmi_om_master_bind(struct device *dev)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > > +     struct cd01_list *tmp_list;
> > > +     int ret;
> > > +
> > > +     ret =3D component_bind_all(dev, &tmp_list);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     priv->cd01_list =3D tmp_list;
> > > +
> > > +     if (!priv->cd01_list)
> > > +             return -ENODEV;
> > > +
> > > +     return lwmi_om_fw_attr_add(priv);
> > > +}
> > > +
> > > +/**
> > > + * lwmi_om_master_unbind() - Unbind all components of the other mod=
e=20
> driver
> > > + * @dev: The lenovo-wmi-other driver basic device
> > > + *
> > > + * Unregister all capability data attribute groups=2E Then call
> > > + * component_unbind_all to unbind the lenovo-wmi-capdata01 driver=
=20
> from the
> > > + * lenovo-wmi-other master driver=2E Finally, free the IDA for this=
=20
> device=2E
> > > + */
> > > +static void lwmi_om_master_unbind(struct device *dev)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > > +
> > > +     lwmi_om_fw_attr_remove(priv);
> > > +     component_unbind_all(dev, NULL);
> > > +}
> > > +
> > > +static const struct component_master_ops lwmi_om_master_ops =3D {
> > > +     =2Ebind =3D lwmi_om_master_bind,
> > > +     =2Eunbind =3D lwmi_om_master_unbind,
> > > +};
> > > +
> > > +static int lwmi_other_probe(struct wmi_device *wdev, const void=20
> *context)
> > > +{
> > > +     struct component_match *master_match =3D NULL;
> > > +     struct lwmi_om_priv *priv;
> > > +
> > > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->wdev =3D wdev;
> > > +     dev_set_drvdata(&wdev->dev, priv);
> > > +
> > > +     component_match_add(&wdev->dev, &master_match, lwmi_cd01_match=
,=20
> NULL);
> > > +     if (IS_ERR(master_match))
> > > +             return PTR_ERR(master_match);
> > > +
> > > +     return component_master_add_with_match(&wdev->dev,=20
> &lwmi_om_master_ops,
> > > +                                            master_match);
> > > +}
> > > +
> > > +static void lwmi_other_remove(struct wmi_device *wdev)
> > > +{
> > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > > +
> > > +     component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > > +     ida_free(&lwmi_om_ida, priv->ida_id);
> > > +}
> > > +
> > > +static const struct wmi_device_id lwmi_other_id_table[] =3D {
> > > +     { LENOVO_OTHER_MODE_GUID, NULL },
> > > +     {}
> > > +};
> > > +
> > > +static struct wmi_driver lwmi_other_driver =3D {
> > > +     =2Edriver =3D {
> > > +             =2Ename =3D "lenovo_wmi_other",
> > > +             =2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > > +     },
> > > +     =2Eid_table =3D lwmi_other_id_table,
> > > +     =2Eprobe =3D lwmi_other_probe,
> > > +     =2Eremove =3D lwmi_other_remove,
> > > +     =2Eno_singleton =3D true,
> > > +};
> > > +
> > > +module_wmi_driver(lwmi_other_driver);
> > > +
> > > +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> > > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > > +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
> > > +MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
> > > +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/platform/x86/lenovo-wmi-other=2Eh=20
> b/drivers/platform/x86/lenovo-wmi-other=2Eh
> > > new file mode 100644
> > > index 000000000000=2E=2E49bc3521e184
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-other=2Eh
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
> > > +
> > > +/* Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Eco=
m> */
> > > +
> > > +#ifndef _LENOVO_WMI_OTHER_H_
> > > +#define _LENOVO_WMI_OTHER_H_
> > > +
> > > +struct device;
> > > +struct notifier_block;
> > > +
> > > +int lwmi_om_register_notifier(struct notifier_block *nb);
> > > +int lwmi_om_unregister_notifier(struct notifier_block *nb);
> > > +int devm_lwmi_om_register_notifier(struct device *dev,
> > > +                                struct notifier_block *nb);
> > > +
> > > +#endif /* !_LENOVO_WMI_OTHER_H_ */
> >
> > Overall, the series still has lots of nits still to address (please lo=
ok
> > for similar cases I've marked as I surely didn't mark each instance)=
=2E
> > But logicwise, the code is easy to read, feels understandable, and I
> > couldn't find any big issues=2E Good work so far! :-)
> >
> > --
> >  i=2E
> >
> Thanks Ilpo, I'll take a look at these in the coming days-=2E
>
> There is something that was just brought up to me from Xino at Lenovo
> after some internal testing that I wasn't aware of, and it needs to be
> addressed=2E I want to discuss a way ahead before I add it to v6=2E
>
> Essentially, there was an assumption that the capability data is
> static once the device initializes, which is why back in v1 it was
> discussed to cache the data=2E This assumption was wrong; the capability
> data for max value changes depending on if AC or DC is being used to
> power the device, with the DC values being lower=2E The BIOS will
> automatically throttle any values that exceed the DC limits upon a
> change in status, so we don't need to account for this event in other
> mode directly, but we do need to re-cache the data blocks when there
> is an ACPI_AC_NOTIFY_STATUS event=2E This will allow us to both report
> accurate information, and prevent setting values that exceed the power
> draw limit of the battery after the event, which could be possible=2E
>
> My plan is (in Capability data driver):
>
> - Use the _setup function in _probe to call two new functions that are
> essentially the current _setup broken apart=2E The first (_allocate)
> will only run during _setup and will get the wmi block device count
> and allocate the list struct, and the second (_cache)  will loop
> through all the data blocks and copy the data to the list struct=2E
> - Subscribe to the register_acpi_notifier with a new notifier block in
> _probe, and in a new notify_call function run the _cache function upon
> ACPI_AC_NOTIFY_STATUS events=2E
>
> The main problem I see is that we will need to guard the access to the
> cd01_list now, as it could have async read/write=2E Since we are passing
> a pointer to that data to another driver I see two possible solutions
> to that:
> - Share a mutex between the two drivers=2E
> - Do all lookups of the capability data in the capability data driver
> and pass pointers back to the other mode driver=2E
>
> I personally prefer option 2=2E I can pass the existing list pointer to
> an exported function from the capability data driver and use its
> global mutex to iterate through it=2E I could also change the pointer
> passed in _bind to a device pointer, then pass it back in the exported
> function and use dev_get_data to access the private drvdata in the
> capability data driver, but Armin was against this previously so I'm
> unsure about it=2E I think the example i915 driver does store pointers
> to devices so I'm unsure why this wouldn't be preferable now, as it
> would prevent access to the data outside a guard in all contexts=2E
>
> As far as I'm aware, the only way to share a mutex would be to point
> to the private data between the two drivers, but I fully admit I could
> be wrong about that=2E I'm waiting for comments before proceeding
> further=2E
>
> Thank you,
> - Derek
>

Ilpo/Armin,

Any thoughts on this? I've successfully tested passing the device pointer =
for capability data to other mode and retrieving the accurate data when nee=
ded; re-caching on ACPI AC change events=2E It seems to work well this way =
and I'm able to contain the mutex in a single driver this way=2E I'd like a=
 bit more than tacit approval of the concept before submitting the next ver=
sion to avoid more unnecessary iterations if possible=2E

Thanks,
Derek
