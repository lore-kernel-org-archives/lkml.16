Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AC172767;
	Thu, 10 Apr 2025 22:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325694; cv=none; b=nCJqmeqJ4eHdpSI4Xz/EArpJqMsGkSq4EPetmQI49qH0OlGkxhWc4HsUPplcGG0xcxky2TFwHU7ccFqAxTE6DUGw4wl+24LWicPz6xq5TPqmNYKYlx+/wLP0S55SpY+6PdeUj1KN6PPLXkY5T6JGw17ttx92HMhOi94UJS/2bI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325694; c=relaxed/simple;
	bh=WXg8DFR1sA0yZmaza7DOEM8GX+hFHC2AlAcRScldV04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDe/AP0/3dron+7oKBjVGIqs0bQOQRP2t1t66eytSUWM1yC7CT2x2GkpYLJ9CW3r1Qd3VspYTJkwGgBdKPuyfB9GNKQPoo+Ks6VW1aosRnt2Sxzj+OH5w8Yi19gkFk52cpYJJcuBDfwjiw9kXq+tHrHTWdBdWHkY5ho2KaMm5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHSZTxub; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHSZTxub"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecf0e07954so17818686d6.1;
        Thu, 10 Apr 2025 15:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744325691; x=1744930491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUYdXEC9uO+A7bk4RMkLsWGxFa5KxcBuFCBeuXRSFdQ=;
        b=FHSZTxubOIv0yprsB2soS6Dby3UppGON8TT7fHxLbiafh5oVPeDoArvyPJJTIrBt3y
         020ii/4VdJCGb6twHyFtevb5r2cYIAecg6Tp+33TRmE51EMfuerwoIfC75BM7PKAnH0Z
         lVOSpHnrR22fv96yXzoDh0YcZZBCFNhSQJWuKoUbsqBZVc2uBuSk/fRRVvXGo2J4auxG
         nGWYywRa9WCMM5MvGRSEqb+aS1nVjzx+aTllrRxqTcxHMGVwfRoU73RheAlq5Mvx0DSF
         JfH3KMDV5GoRsc1zVLk0pSagnVmdKGqmmUcfa1apxK9iIbNAoVnu3ygbVAOULVj4GD/B
         bijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744325691; x=1744930491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUYdXEC9uO+A7bk4RMkLsWGxFa5KxcBuFCBeuXRSFdQ=;
        b=cAm1HuudBa9ISSm9e+SFBkopXfPiW329JPFnZwPqo8vpbxeuLiUjkleQmIWAmSbaf8
         IV4C7kaWps+11VVgeomq66rYkO94WVeCmMsOaQSRpp73ZKHs3kFZZaC+o7hnB3WFyiLd
         Kdk1glb94rSPS2Mttc3MadgN4nesA4N/yYns/D4eqE/8EMGg/XXq9+oNSjGrsmauN+Mp
         eIGbINEMK7vOEDB+JkTR7lzrJaYnPLL2UYtwUboerdbTuHD04mxWK6YmkAsE4SlhFoG3
         sU2DGtc/GNv/Je3mol3jv8XooWC5j/3if4DQI4ekQYAWKr+BsC9PPB69Dn/rXTaguslf
         rtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZzn/aDtfnefWKE9kZrrH29B19ToIcGUO946p2PQ1xZUY+9YyIuRALS0Gm4h9KwZdoiGlSfEJJeC2yHJcG@vger.kernel.org, AJvYcCVvFexKyrUyG8yyz0CdIaT+ukjW2yH4flnCNFwBe9W8/ztahler7wk6x9I5bhpjlHVkTXZlkSscYEjug9AzwXmgujf4gQ==@vger.kernel.org, AJvYcCXseYFhwi8ksA5tY8UKeOKu/waDz3N+PampK2pTr5A0C1uDXCCGRf9ciLUg6z1ZPPi0S+qQxn7Vvag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEUEvA6ylkkeAnw3q93qt/JFobIJCJD7ZgBXmrwL0hQWhQPKYI
	Agl5q4fmcfu/Xh+1hR0a83q2ndTcxDZrV0Zmer6Lsl8MJG/GiPXD4c5XtJxy6VNqjv83VXrkrfD
	vIYGya9WcjY04Sf8lvYX09butOyc=
X-Gm-Gg: ASbGncu8Iu6MetL//iboY0Gu29j/ti0o4R8QJQN8H6til/mlB726OAAKqiprpo+D0B9
	BbJg1nJ+THtnAEwAD7xvZ7GboVhUGYBPsW26tqGzsX54KbhsgXZfzPHREVfflIhDWsVUdR4Byth
	EuK4a6zS3TIdWyLLkshyHlZjc=
X-Google-Smtp-Source: AGHT+IF7zWr+11kCaH85KBFbxvylH4PiLFevc5fvrlQAfuTULNmzSYFYQxD7VKKMdzQoPiKa/Z+slFW7VIjqA1/oZxA=
X-Received: by 2002:a05:6214:e89:b0:6ec:f51f:30f6 with SMTP id
 6a1803df08f44-6f23f116684mr11286236d6.31.1744325690499; Thu, 10 Apr 2025
 15:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-7-derekjohn.clark@gmail.com> <097d5f0e-b7e5-a528-1eff-5f7aceacbbca@linux.intel.com>
In-Reply-To: <097d5f0e-b7e5-a528-1eff-5f7aceacbbca@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 10 Apr 2025 15:54:38 -0700
X-Gm-Features: ATxdqUEt7h0BLt5Crb1efK4PWRhuKZzXOVbrAK3jnzY-gvRd6fd2MMphhJ7pUOw
Message-ID: <CAFqHKTniVCD-Yqu0=PyZd0yezMYVaiNx_adn7sjmw4kXx0QaiQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] platform/x86: Add Lenovo Other Mode WMI Driver
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

On Tue, Apr 8, 2025 at 5:50=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 7 Apr 2025, Derek J. Clark wrote:
>
> > Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
> > interface that comes on some Lenovo "Gaming Series" hardware. Provides =
a
> > firmware-attributes class which enables the use of tunable knobs for SP=
L,
> > SPPT, and FPPT.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v5:
> > - Switch from locally storing capability data list to storing a pointer
> >   from the capability data interface.
> > - Add portion of Gamezone driver that relies on the exported functions
> >   of this driver.
> > - Properly initialize IDA and use it for naming the firmware-attributes
> >   path.
> > - Rename most defines to clearly indicate they are from this driver.
> > - Misc fixes from v4 review.
> > v4:
> > - Treat Other Mode as a notifier chain head, use the notifier chain to
> >   get the current mode from Gamezone.
> > - Add header file for Other Mode specific structs and finctions.
> > - Use component master bind to cache the capdata01 array locally.
> > - Drop all reference to external driver private data structs.
> > - Various fixes from review.
> > v3:
> > - Add notifier block and store result for getting the Gamezone interfac=
e
> >   profile changes.
> > - Add driver as master component of capdata01 driver.
> > - Use FIELD_PREP where appropriate.
> > - Move macros and associated functions out of lemovo-wmi.h that are onl=
y
> >   used by this driver.
> > v2:
> > - Use devm_kmalloc to ensure driver can be instanced, remove global
> >   reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > - Use list to get the lenovo_wmi_om_priv instance in some macro
> >   called functions as the data provided by the macros that use it
> >   doesn't pass a member of the struct for use in container_of.
> > - Do not rely on GameZone interface to grab the current fan mode.
> > ---
> >  MAINTAINERS                                |   2 +
> >  drivers/platform/x86/Kconfig               |  15 +
> >  drivers/platform/x86/Makefile              |   1 +
> >  drivers/platform/x86/lenovo-wmi-gamezone.c |  35 ++
> >  drivers/platform/x86/lenovo-wmi-other.c    | 677 +++++++++++++++++++++
> >  drivers/platform/x86/lenovo-wmi-other.h    |  16 +
> >  6 files changed, 746 insertions(+)
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 49deb8ea4ea7..0416afd997a0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13172,6 +13172,8 @@ F:    drivers/platform/x86/lenovo-wmi-gamezone.=
c
> >  F:   drivers/platform/x86/lenovo-wmi-gamezone.h
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.h
> > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > +F:   drivers/platform/x86/lenovo-wmi-other.h
> >
> >  LENOVO WMI HOTKEY UTILITIES DRIVER
> >  M:   Jackie Dong <xy-jackie@139.com>
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index aaa1a69c10ca..be5ab24960b5 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -485,6 +485,21 @@ config LENOVO_WMI_DATA01
> >       tristate
> >       depends on ACPI_WMI
> >
> > +config LENOVO_WMI_TUNING
> > +     tristate "Lenovo Other Mode WMI Driver"
> > +     depends on ACPI_WMI
> > +     select FW_ATTR_CLASS
> > +     select LENOVO_WMI_DATA01
> > +     select LENOVO_WMI_EVENTS
> > +     select LENOVO_WMI_HELPERS
> > +     help
> > +       Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> > +       firmware_attributes API to control various tunable settings typ=
ically exposed by
> > +       Lenovo software in Windows.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called lenovo-wmi-other.
> > +
> >  config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 60058b547de2..f3e64926a96b 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -73,6 +73,7 @@ obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-c=
apdata01.o
> >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> >  obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
> >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> >
> >  # Intel
> >  obj-y                                +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platf=
orm/x86/lenovo-wmi-gamezone.c
> > index 2e6d5e7faadf..9c80561f931c 100644
> > --- a/drivers/platform/x86/lenovo-wmi-gamezone.c
> > +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> > @@ -22,6 +22,7 @@
> >  #include "lenovo-wmi-events.h"
> >  #include "lenovo-wmi-gamezone.h"
> >  #include "lenovo-wmi-helpers.h"
> > +#include "lenovo-wmi-other.h"
> >
> >  #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> >
> > @@ -49,6 +50,34 @@ static struct quirk_entry quirk_no_extreme_bug =3D {
> >       .extreme_supported =3D false,
> >  };
> >
> > +/**
> > + * lwmi_gz_mode_call() - Call method for lenovo-wmi-other driver notif=
ier.
> > + *
> > + * @nb: The notifier_block registered to lenovo-wmi-other driver.
> > + * @cmd: The event type.
> > + * @data: Thermal mode enum pointer pointer for returning the thermal =
mode.
> > + *
> > + * For LWMI_GZ_GET_THERMAL_MODE, retrieve the current thermal mode.
> > + *
> > + * Return: Notifier_block status.
> > + */
> > +static int lwmi_gz_mode_call(struct notifier_block *nb, unsigned long =
cmd,
> > +                          void *data)
> > +{
> > +     enum thermal_mode **mode =3D data;
> > +     struct lwmi_gz_priv *priv;
> > +
> > +     priv =3D container_of(nb, struct lwmi_gz_priv, mode_nb);
> > +
> > +     switch (cmd) {
> > +     case LWMI_GZ_GET_THERMAL_MODE:
> > +             **mode =3D priv->current_mode;
> > +             return NOTIFY_STOP;
> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +}
> > +
> >  /**
> >   * lwmi_gz_event_call() - Call method for lenovo-wmi-events driver not=
ifier.
> >   * block call chain.
> > @@ -347,6 +376,11 @@ static int lwmi_gz_probe(struct wmi_device *wdev, =
const void *context)
> >       if (ret)
> >               return ret;
> >
> > +     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> > +     ret =3D devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb=
);
> > +     if (ret)
> > +             return ret;
> > +
> >       return 0;
> >  }
> >
> > @@ -369,6 +403,7 @@ module_wmi_driver(lwmi_gz_driver);
> >
> >  MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> >  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > +MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> >  MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> >  MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform=
/x86/lenovo-wmi-other.c
> > new file mode 100644
> > index 000000000000..342883a90270
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > @@ -0,0 +1,677 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo Other Mode WMI interface driver.
> > + *
> > + * This driver uses the fw_attributes class to expose the various WMI =
functions
> > + * provided by the "Other Mode" WMI interface. This enables CPU and GP=
U power
> > + * limit as well as various other attributes for devices that fall und=
er the
> > + * "Gaming Series" of Lenovo laptop devices. Each attribute exposed by=
 the
> > + * "Other Mode"" interface has a corresponding Capability Data struct =
that
> > + * allows the driver to probe details about the attribute such as if i=
t is
> > + * supported by the hardware, the default_value, max_value, min_value,=
 and step
> > + * increment.
> > + *
> > + * These attributes typically don't fit anywhere else in the sysfs and=
 are set
> > + * in Windows using one of Lenovo's multiple user applications.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/component.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/export.h>
> > +#include <linux/gfp_types.h>
> > +#include <linux/idr.h>
> > +#include <linux/kobject.h>
> > +#include <linux/module.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_profile.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +
> > +#include "lenovo-wmi-capdata01.h"
> > +#include "lenovo-wmi-events.h"
> > +#include "lenovo-wmi-gamezone.h"
> > +#include "lenovo-wmi-helpers.h"
> > +#include "lenovo-wmi-other.h"
> > +#include "firmware_attributes_class.h"
> > +
> > +#define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> > +
> > +#define LWMI_DEVICE_ID_CPU 0x01
> > +
> > +#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> > +#define LWMI_FEATURE_ID_CPU_SPL 0x02
> > +#define LWMI_FEATURE_ID_CPU_FPPT 0x03
>
> Align values in every define group.
>
> > +
> > +#define LWMI_TYPE_ID_NONE 0x00
> > +
> > +#define LWMI_FEATURE_VALUE_GET 17
> > +#define LWMI_FEATURE_VALUE_SET 18
> > +
> > +#define LWMI_ATTR_DEV_ID_MASK GENMASK(31, 24)
> > +#define LWMI_ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > +#define LWMI_ATTR_MODE_ID_MASK GENMASK(15, 8)
> > +#define LWMI_ATTR_TYPE_ID_MASK GENMASK(7, 0)
> > +
> > +#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> > +
> > +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> > +static DEFINE_IDA(lwmi_om_ida);
> > +
> > +enum attribute_property {
> > +     DEFAULT_VAL,
> > +     MAX_VAL,
> > +     MIN_VAL,
> > +     STEP_VAL,
> > +     SUPPORTED,
> > +};
> > +
> > +struct lwmi_om_priv {
> > +     struct component_master_ops *ops;
> > +     /* *cd01_list is only valid after master bind and while capdata01=
 exists */
> > +     struct cd01_list *cd01_list;
> > +     struct device *fw_attr_dev;
> > +     struct kset *fw_attr_kset;
> > +     struct notifier_block nb;
> > +     struct wmi_device *wdev;
> > +     int ida_id;
> > +};
> > +
> > +struct tunable_attr_01 {
> > +     struct capdata01 *capdata;
> > +     struct device *dev;
> > +     u32 feature_id;
> > +     u32 device_id;
> > +     u32 type_id;
> > +};
> > +
> > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D LWMI_DEVICE_ID=
_CPU,
> > +                                    .feature_id =3D LWMI_FEATURE_ID_CP=
U_SPL,
> > +                                    .type_id =3D LWMI_TYPE_ID_NONE };
> > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D LWMI_DEVICE_I=
D_CPU,
> > +                                     .feature_id =3D LWMI_FEATURE_ID_C=
PU_SPPT,
> > +                                     .type_id =3D LWMI_TYPE_ID_NONE };
> > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D LWMI_DEVICE_I=
D_CPU,
> > +                                     .feature_id =3D LWMI_FEATURE_ID_C=
PU_FPPT,
> > +                                     .type_id =3D LWMI_TYPE_ID_NONE };
> > +
> > +struct capdata01_attr_group {
> > +     const struct attribute_group *attr_group;
> > +     struct tunable_attr_01 *tunable_attr;
> > +};
> > +
> > +/**
> > + * lwmi_om_register_notifier() - Add a notifier to the blocking notifi=
er chain
> > + * @nb: The notifier_block struct to register
> > + *
> > + * Call blocking_notifier_chain_register to register the notifier bloc=
k to the
> > + * lenovo-wmi-other driver notifer chain.
> > + *
> > + * Return: 0 on success, %-EEXIST on error.
> > + */
> > +int lwmi_om_register_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_register(&om_chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
> > +
> > +/**
> > + * lwmi_om_unregister_notifier() - Remove a notifier from the blocking=
 notifier
> > + * chain.
> > + * @nb: The notifier_block struct to register
> > + *
> > + * Call blocking_notifier_chain_unregister to unregister the notifier =
block from the
> > + * lenovo-wmi-other driver notifer chain.
> > + *
> > + * Return: 0 on success, %-ENOENT on error.
> > + */
> > +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_unregister(&om_chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
> > +
> > +/**
> > + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blo=
cking
> > + * notifier chain.
> > + * @data: Void pointer to the notifier_block struct to register.
> > + *
> > + * Call lwmi_om_unregister_notifier to unregister the notifier block f=
rom the
> > + * lenovo-wmi-other driver notifer chain.
> > + *
> > + * Return: 0 on success, %-ENOENT on error.
> > + */
> > +static void devm_lwmi_om_unregister_notifier(void *data)
> > +{
> > +     struct notifier_block *nb =3D data;
> > +
> > +     lwmi_om_unregister_notifier(nb);
> > +}
> > +
> > +/**
> > + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking n=
otifier
> > + * chain.
> > + * @dev: The parent device of the notifier_block struct.
> > + * @nb: The notifier_block struct to register
> > + *
> > + * Call lwmi_om_register_notifier to register the notifier block to th=
e
> > + * lenovo-wmi-other driver notifer chain. Then add devm_lwmi_om_unregi=
ster_notifier
> > + * as a device managed ation to automatically unregister the notifier =
block
> > + * upon parent device removal.
> > + *
> > + * Return: 0 on success, or on error.
> > + */
> > +int devm_lwmi_om_register_notifier(struct device *dev,
> > +                                struct notifier_block *nb)
> > +{
> > +     int ret;
> > +
> > +     ret =3D lwmi_om_register_notifier(nb);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_noti=
fier,
> > +                                     nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER=
");
> > +
> > +/**
> > + * lwmi_om_notifier_call() - Call functions for the notifier call chai=
n.
> > + * @mode: Pointer to a thermal mode enum to retrieve the data from.
> > + *
> > + * Call blocking_notifier_call_chain to retrieve the thermal mode from=
 the
> > + * lenovo-wmi-gamezone driver.
> > + *
> > + * Return: 0 on success, or on error.
> > + */
> > +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> > +{
> > +     int ret;
> > +
> > +     ret =3D blocking_notifier_call_chain(&om_chain_head, LWMI_GZ_GET_=
THERMAL_MODE, &mode);
> > +     if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +/* Attribute Methods */
> > +
> > +/**
> > + * int_type_show() - Emit the data type for an integer attribute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + *
> > + * Return: Number of characters written to buf.
> > + */
> > +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribu=
te *kattr,
> > +                          char *buf)
> > +{
> > +     return sysfs_emit(buf, "integer\n");
> > +}
> > +
> > +/**
> > + * attr_capdata01_get - Get the data of the specified attribute
> > + * @tunable_attr: The attribute to be populated.
> > + *
> > + * Retrieves the capability data 01 struct pointer for the given
> > + * attribute for its specified thermal mode.
> > + *
> > + * Return: Either a pointer to capability data, or NULL.
> > + */
> > +static struct capdata01 *attr_capdata01_get_data(struct lwmi_om_priv *=
priv,
> > +                                              u32 attribute_id)
> > +{
> > +     int idx;
> > +
> > +     for (idx =3D 0; idx < priv->cd01_list->count; idx++) {
>
> The convention for loop variables that count from 0 upwards is to use
> unsigned type.
>
> > +             if (priv->cd01_list->data[idx].id !=3D attribute_id)
> > +                     continue;
> > +             return &priv->cd01_list->data[idx];
> > +     }
> > +     return NULL;
> > +}
> > +
> > +/**
> > + * attr_capdata01_show() - Get the value of the specified attribute pr=
operty
> > + *
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + * @prop: The property of this attribute to be read.
> > + *
> > + * Retrieves the given property from the capability data 01 struct for=
 the
> > + * specified attribute's "custom" thermal mode. This function is inten=
ded
> > + * to be generic so it can be called from any integer attributes "_sho=
w"
> > + * function.
> > + *
> > + * If the WMI is success the sysfs attribute is notified.
>
> Add comma after success.
>
> > + *
> > + * Return: Either number of characters written to buf, or an error.
> > + */
> > +static ssize_t attr_capdata01_show(struct kobject *kobj,
> > +                                struct kobj_attribute *kattr, char *bu=
f,
> > +                                struct tunable_attr_01 *tunable_attr,
> > +                                enum attribute_property prop)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > +     struct capdata01 *capdata;
> > +     u32 attribute_id;
> > +     int value;
> > +
> > +     attribute_id =3D
> > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_=
id) |
> > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, LWMI_GZ_THERMAL_MODE_C=
USTOM) |
> > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id)=
;
> > +
> > +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
> > +
> > +     if (!capdata)
> > +             return -ENODEV;
> > +
> > +     switch (prop) {
> > +     case DEFAULT_VAL:
> > +             value =3D capdata->default_value;
> > +             break;
> > +     case MAX_VAL:
> > +             value =3D capdata->max_value;
> > +             break;
> > +     case MIN_VAL:
> > +             value =3D capdata->min_value;
> > +             break;
> > +     case STEP_VAL:
> > +             value =3D capdata->step;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +     return sysfs_emit(buf, "%d\n", value);
> > +}
> > +
> > +/**
> > + * att_current_value_store() - Set the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to read from, this is parsed to `int` type.
> > + * @count: Required by sysfs attribute macros, pass in from the callee=
 attr.
> > + * @tunable_attr: The attribute to be stored.
> > + *
> > + * Sets the value of the given attribute when operating under the "cus=
tom"
> > + * smartfan profile. The current smartfan profile is retrieved from th=
e
> > + * lenovo-wmi-gamezone driver and error is returned if the result is n=
ot
> > + * "custom". This function is intended to be generic so it can be call=
ed from
> > + * any integer attribute's "_store" function. The integer to be sent t=
o the WMI
> > + * method is range checked and an error is returned if out of range.
> > + *
> > + * If the value is valid and WMI is success, then the sysfs attribute =
is
> > + * notified.
> > + *
> > + * Return: Either count, or an error.
> > + */
> > +static ssize_t attr_current_value_store(struct kobject *kobj,
> > +                                     struct kobj_attribute *kattr,
> > +                                     const char *buf, size_t count,
> > +                                     struct tunable_attr_01 *tunable_a=
ttr)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > +     struct wmi_method_args_32 args;
> > +     struct capdata01 *capdata;
> > +     enum thermal_mode mode;
> > +     u32 attribute_id;
> > +     u32 value;
> > +     int err;
> > +
> > +     err =3D lwmi_om_notifier_call(&mode);
> > +     if (err)
> > +             return err;
> > +
> > +     if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
> > +             return -EBUSY;
> > +
> > +     attribute_id =3D
> > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
>
> Just combine this to the previous line and realign the ones below.
>
> > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_=
id) |
> > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id)=
;
> > +
> > +     capdata =3D attr_capdata01_get_data(priv, attribute_id);
> > +
> > +     if (!capdata)
> > +             return -ENODEV;
> > +
> > +     err =3D kstrtouint(buf, 10, &value);
> > +     if (err)
> > +             return err;
> > +
> > +     if (value < capdata->min_value || value > capdata->max_value)
> > +             return -EINVAL;
> > +
> > +     args.arg0 =3D attribute_id;
> > +     args.arg1 =3D value;
> > +
> > +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE=
_SET,
> > +                                 (unsigned char *)&args, sizeof(args),=
 NULL);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return count;
> > +};
> > +
> > +/**
> > + * attr_current_value_show() - Get the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + *
> > + * Retrieves the value of the given attribute for the current smartfan=
 profile.
> > + * The current smartfan profile is retrieved from the lenovo-wmi-gamez=
one driver.
> > + * This function is intended to be generic so it can be called from an=
y integer
> > + * attribute's "_show" function.
> > + *
> > + * If the WMI is success the sysfs attribute is notified.
> > + *
> > + * Return: Either number of characters written to buf, or an error.
> > + */
> > +static ssize_t attr_current_value_show(struct kobject *kobj,
> > +                                    struct kobj_attribute *kattr, char=
 *buf,
> > +                                    struct tunable_attr_01 *tunable_at=
tr)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > +     struct wmi_method_args_32 args;
> > +     enum thermal_mode mode;
> > +     u32 attribute_id;
> > +     int retval;
> > +     int err;
> > +
> > +     err =3D lwmi_om_notifier_call(&mode);
> > +     if (err)
> > +             return err;
> > +
> > +     attribute_id =3D
> > +             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
>
> Ditto.
>
> > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_=
id) |
> > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id)=
;
> > +
> > +     args.arg0 =3D attribute_id;
> > +
> > +     err =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE=
_GET,
> > +                                 (unsigned char *)&args, sizeof(args),
> > +                                 &retval);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return sysfs_emit(buf, "%d\n", retval);
> > +}
> > +
> > +/* Lenovo WMI Other Mode Attribute macros */
> > +#define __LWMI_ATTR_RO(_func, _name)                                  =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _func##_##_name##_show,                       \
> > +     }
> > +
> > +#define __LWMI_ATTR_RO_AS(_name, _show)                               =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _show,                                        \
> > +     }
> > +
> > +#define __LWMI_ATTR_RW(_func, _name) \
> > +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_sto=
re)
> > +
> > +/* Shows a formatted static variable */
> > +#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)            =
         \
> > +     static ssize_t _attrname##_##_prop##_show(                       =
      \
> > +             struct kobject *kobj, struct kobj_attribute *kattr, char =
*buf) \
> > +     {                                                                =
      \
> > +             return sysfs_emit(buf, _fmt, _val);                      =
      \
> > +     }                                                                =
      \
> > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
        \
> > +             __LWMI_ATTR_RO(_attrname, _prop)
> > +
> > +/* Attribute current value read/write */
> > +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                 =
         \
> > +     static ssize_t _attrname##_current_value_store(                  =
      \
> > +             struct kobject *kobj, struct kobj_attribute *kattr,      =
      \
> > +             const char *buf, size_t count)                           =
      \
> > +     {                                                                =
      \
> > +             return attr_current_value_store(kobj, kattr, buf, count, =
      \
> > +                                             &_attrname);             =
      \
> > +     }                                                                =
      \
> > +     static ssize_t _attrname##_current_value_show(                   =
      \
> > +             struct kobject *kobj, struct kobj_attribute *kattr, char =
*buf) \
> > +     {                                                                =
      \
> > +             return attr_current_value_show(kobj, kattr, buf, &_attrna=
me);  \
> > +     }                                                                =
      \
> > +     static struct kobj_attribute attr_##_attrname##_current_value =3D=
        \
> > +             __LWMI_ATTR_RW(_attrname, current_value)
> > +
> > +/* Attribute property read only */
> > +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)         =
         \
> > +     static ssize_t _attrname##_##_prop##_show(                       =
      \
> > +             struct kobject *kobj, struct kobj_attribute *kattr, char =
*buf) \
> > +     {                                                                =
      \
> > +             return attr_capdata01_show(kobj, kattr, buf, &_attrname, =
      \
> > +                                        _prop_type);                  =
      \
> > +     }                                                                =
      \
> > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D      =
        \
> > +             __LWMI_ATTR_RO(_attrname, _prop)
> > +
> > +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)  =
    \
> > +     __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                   =
 \
> > +     __LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  =
 \
> > +     __LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);=
 \
> > +     __LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          =
 \
> > +     __LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          =
 \
> > +     __LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  =
 \
> > +     static struct kobj_attribute attr_##_attrname##_type =3D         =
   \
> > +             __LWMI_ATTR_RO_AS(type, int_type_show);                  =
 \
> > +     static struct attribute *_attrname##_attrs[] =3D {               =
   \
> > +             &attr_##_attrname##_current_value.attr,                  =
 \
> > +             &attr_##_attrname##_default_value.attr,                  =
 \
> > +             &attr_##_attrname##_display_name.attr,                   =
 \
> > +             &attr_##_attrname##_max_value.attr,                      =
 \
> > +             &attr_##_attrname##_min_value.attr,                      =
 \
> > +             &attr_##_attrname##_scalar_increment.attr,               =
 \
> > +             &attr_##_attrname##_type.attr,                           =
 \
> > +             NULL,                                                    =
 \
> > +     };                                                               =
 \
> > +     static const struct attribute_group _attrname##_attr_group =3D { =
   \
> > +             .name =3D _fsname, .attrs =3D _attrname##_attrs          =
     \
> > +     }
> > +
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > +                           "Set the CPU sustained power limit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > +                           "Set the CPU slow package power tracking li=
mit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > +                           "Set the CPU fast package power tracking li=
mit");
> > +
> > +static struct capdata01_attr_group cd01_attr_groups[] =3D {
> > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > +     {},
> > +};
> > +
> > +/**
> > + * lwmi_om_fw_attr_add() - Register all firmware_attributes_class memb=
ers
> > + * @priv: The Other Mode driver data.
> > + *
> > + * Return: Either 0, or an error.
> > + */
> > +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > +{
> > +     unsigned int i;
> > +     int err;
> > +
> > +     priv->ida_id =3D ida_alloc(&lwmi_om_ida, GFP_KERNEL);
> > +     if (priv->ida_id < 0)
> > +             return priv->ida_id;
> > +
> > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class, N=
ULL,
> > +                                       MKDEV(0, 0), NULL, "%s-%u",
> > +                                       LWMI_OM_FW_ATTR_BASE_PATH,
> > +                                       priv->ida_id);
> > +     if (IS_ERR(priv->fw_attr_dev)) {
>
> Add include for IS_ERR().
>
> > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > +             goto err_free_ida;
> > +     }
> > +
> > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL, &p=
riv->fw_attr_dev->kobj);
> > +     if (!priv->fw_attr_kset) {
> > +             err =3D -ENOMEM;
> > +             goto err_destroy_classdev;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
>
> Add include for ARRAY_SIZE().
>
> > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj, cd0=
1_attr_groups[i].attr_group);
> > +             if (err)
> > +                     goto err_remove_groups;
> > +
> > +             cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->de=
v;
> > +     }
> > +     return 0;
> > +
> > +err_remove_groups:
> > +     while (i--)
> > +             sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_g=
roups[i].attr_group);
> > +
> > +     kset_unregister(priv->fw_attr_kset);
> > +
> > +err_destroy_classdev:
> > +     device_unregister(priv->fw_attr_dev);
> > +
> > +err_free_ida:
> > +     ida_free(&lwmi_om_ida, priv->ida_id);
> > +     return err;
> > +}
> > +
> > +/**
> > + * lwmi_om_fw_attr_remove() - Unregister all capability data attribute=
 groups
> > + * @priv: the lenovo-wmi-other driver data.
> > + */
> > +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> > +{
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; =
i++)
> > +             sysfs_remove_group(&priv->fw_attr_kset->kobj, cd01_attr_g=
roups[i].attr_group);
> > +
> > +     kset_unregister(priv->fw_attr_kset);
> > +     device_unregister(priv->fw_attr_dev);
> > +}
> > +
> > +/**
> > + * lwmi_om_master_bind() - Bind all components of the other mode drive=
r
> > + * @dev: The lenovo-wmi-other driver basic device.
> > + *
> > + * Call component_bind_all to bind the lenovo-wmi-capdata01 driver to =
the
> > + * lenovo-wmi-other master driver. On success, assign the capability d=
ata 01
> > + * list pointer to the driver data struct for later access. This point=
er
> > + * is only valid while the capdata01 interface exists. Finally, regist=
er all
> > + * firmware attribute groups.
> > + *
> > + * Return: 0 on success, or an error.
> > + */
> > +static int lwmi_om_master_bind(struct device *dev)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +     struct cd01_list *tmp_list;
> > +     int ret;
> > +
> > +     ret =3D component_bind_all(dev, &tmp_list);
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->cd01_list =3D tmp_list;
> > +
> > +     if (!priv->cd01_list)
> > +             return -ENODEV;
> > +
> > +     return lwmi_om_fw_attr_add(priv);
> > +}
> > +
> > +/**
> > + * lwmi_om_master_unbind() - Unbind all components of the other mode d=
river
> > + * @dev: The lenovo-wmi-other driver basic device
> > + *
> > + * Unregister all capability data attribute groups. Then call
> > + * component_unbind_all to unbind the lenovo-wmi-capdata01 driver from=
 the
> > + * lenovo-wmi-other master driver. Finally, free the IDA for this devi=
ce.
> > + */
> > +static void lwmi_om_master_unbind(struct device *dev)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +
> > +     lwmi_om_fw_attr_remove(priv);
> > +     component_unbind_all(dev, NULL);
> > +}
> > +
> > +static const struct component_master_ops lwmi_om_master_ops =3D {
> > +     .bind =3D lwmi_om_master_bind,
> > +     .unbind =3D lwmi_om_master_unbind,
> > +};
> > +
> > +static int lwmi_other_probe(struct wmi_device *wdev, const void *conte=
xt)
> > +{
> > +     struct component_match *master_match =3D NULL;
> > +     struct lwmi_om_priv *priv;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->wdev =3D wdev;
> > +     dev_set_drvdata(&wdev->dev, priv);
> > +
> > +     component_match_add(&wdev->dev, &master_match, lwmi_cd01_match, N=
ULL);
> > +     if (IS_ERR(master_match))
> > +             return PTR_ERR(master_match);
> > +
> > +     return component_master_add_with_match(&wdev->dev, &lwmi_om_maste=
r_ops,
> > +                                            master_match);
> > +}
> > +
> > +static void lwmi_other_remove(struct wmi_device *wdev)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > +
> > +     component_master_del(&wdev->dev, &lwmi_om_master_ops);
> > +     ida_free(&lwmi_om_ida, priv->ida_id);
> > +}
> > +
> > +static const struct wmi_device_id lwmi_other_id_table[] =3D {
> > +     { LENOVO_OTHER_MODE_GUID, NULL },
> > +     {}
> > +};
> > +
> > +static struct wmi_driver lwmi_other_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "lenovo_wmi_other",
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +     },
> > +     .id_table =3D lwmi_other_id_table,
> > +     .probe =3D lwmi_other_probe,
> > +     .remove =3D lwmi_other_remove,
> > +     .no_singleton =3D true,
> > +};
> > +
> > +module_wmi_driver(lwmi_other_driver);
> > +
> > +MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > +MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo Other Mode WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi-other.h b/drivers/platform=
/x86/lenovo-wmi-other.h
> > new file mode 100644
> > index 000000000000..49bc3521e184
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-other.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
> > +
> > +#ifndef _LENOVO_WMI_OTHER_H_
> > +#define _LENOVO_WMI_OTHER_H_
> > +
> > +struct device;
> > +struct notifier_block;
> > +
> > +int lwmi_om_register_notifier(struct notifier_block *nb);
> > +int lwmi_om_unregister_notifier(struct notifier_block *nb);
> > +int devm_lwmi_om_register_notifier(struct device *dev,
> > +                                struct notifier_block *nb);
> > +
> > +#endif /* !_LENOVO_WMI_OTHER_H_ */
>
> Overall, the series still has lots of nits still to address (please look
> for similar cases I've marked as I surely didn't mark each instance).
> But logicwise, the code is easy to read, feels understandable, and I
> couldn't find any big issues. Good work so far! :-)
>
> --
>  i.
>
Thanks Ilpo, I'll take a look at these in the coming days-.

There is something that was just brought up to me from Xino at Lenovo
after some internal testing that I wasn't aware of, and it needs to be
addressed. I want to discuss a way ahead before I add it to v6.

Essentially, there was an assumption that the capability data is
static once the device initializes, which is why back in v1 it was
discussed to cache the data. This assumption was wrong; the capability
data for max value changes depending on if AC or DC is being used to
power the device, with the DC values being lower. The BIOS will
automatically throttle any values that exceed the DC limits upon a
change in status, so we don't need to account for this event in other
mode directly, but we do need to re-cache the data blocks when there
is an ACPI_AC_NOTIFY_STATUS event. This will allow us to both report
accurate information, and prevent setting values that exceed the power
draw limit of the battery after the event, which could be possible.

My plan is (in Capability data driver):

- Use the _setup function in _probe to call two new functions that are
essentially the current _setup broken apart. The first (_allocate)
will only run during _setup and will get the wmi block device count
and allocate the list struct, and the second (_cache)  will loop
through all the data blocks and copy the data to the list struct.
- Subscribe to the register_acpi_notifier with a new notifier block in
_probe, and in a new notify_call function run the _cache function upon
ACPI_AC_NOTIFY_STATUS events.

The main problem I see is that we will need to guard the access to the
cd01_list now, as it could have async read/write. Since we are passing
a pointer to that data to another driver I see two possible solutions
to that:
- Share a mutex between the two drivers.
- Do all lookups of the capability data in the capability data driver
and pass pointers back to the other mode driver.

I personally prefer option 2. I can pass the existing list pointer to
an exported function from the capability data driver and use its
global mutex to iterate through it. I could also change the pointer
passed in _bind to a device pointer, then pass it back in the exported
function and use dev_get_data to access the private drvdata in the
capability data driver, but Armin was against this previously so I'm
unsure about it. I think the example i915 driver does store pointers
to devices so I'm unsure why this wouldn't be preferable now, as it
would prevent access to the data outside a guard in all contexts.

As far as I'm aware, the only way to share a mutex would be to point
to the private data between the two drivers, but I fully admit I could
be wrong about that. I'm waiting for comments before proceeding
further.

Thank you,
- Derek
