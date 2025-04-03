Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F51DF975;
	Thu,  3 Apr 2025 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678075; cv=none; b=NAgQoNFI3sEY3hgn80bN6ukA9ViwxS0o5juXnIoaPMSnAWEhZnAdiaaQl/X3pd8C3AcAJ+g2htT4cLXLQ1akBCkG2JhQMUDxWnpCZbulLGAXsAl/JZRt9h28vO2JQR9A/+BuHkA955JPuf3bBEEXDfF9DU7c0dbapLzrsF6uuvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678075; c=relaxed/simple;
	bh=WjKn5Ft50bkDAgGzKhNHOlAwAuzRWcLtV657VipXF3k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iZuwFcjF5rphbqWrvB8fKX1f8tfuPOuF9jhDjsNBnGuSLn7TABL3PUQxUBvywMQR7AvbJwILawuKksQcy+aItXA/ao9g8Cv9296hHnAXEq78jZtuyoRzsbnpkaJkN7xCSrpyoU05y8OSJEv5DcLaLmKx2KZqHOh36qNMCmn9bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doDflvhw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doDflvhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743678073; x=1775214073;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WjKn5Ft50bkDAgGzKhNHOlAwAuzRWcLtV657VipXF3k=;
  b=doDflvhwHjj6v8dL4upMZtjNQ7Kn+J6TtMcqG8ZZ3EVxOCDNs0PPN/td
   sA1R7fqODCn0/J5LFz2Hz5F1ickwInTgjke/uUD0Rd66vpzYWi8bAw99Z
   MjvVwa0PfMitBXxforotQdAFZ1vBarpn3u1K3SWOHhhthZuHLY/m4S9a+
   VXYifIrt/sXu7/auYKv7TlnOyLbU5V/nw2t4irs2ar2TR8+ArB7FEMB+z
   OdaUJnxKhr3XdrQQasE5N46seW5/tB4cMJb14znHT5rSoaQsQzQK26X/m
   2V5DFlOTjzklK1DyQ0Hv9yGLBAVDx+zBzoMsWj2DV4F+mdztHLyfeZfhY
   g==;
X-CSE-ConnectionGUID: lx17ApQVSea5d7LUizKxzw==
X-CSE-MsgGUID: EsxBxmSSTbaXAr9bYaYC1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45219521"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45219521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:01:12 -0700
X-CSE-ConnectionGUID: unhoSeMDSICr7iPwhg5Iew==
X-CSE-MsgGUID: EKA112bwQaSIOpec3ME2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131099993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:01:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 14:01:05 +0300 (EEST)
To: Derek John Clark <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data
 01 WMI Driver
In-Reply-To: <CAFqHKTmPChKu935zrHJWX1jF9mMg3kb5GFBQ=ogy66LnO6bfQA@mail.gmail.com>
Message-ID: <ef3078d2-4ab5-9d5f-e1ba-42f595b3dd48@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-5-derekjohn.clark@gmail.com> <9138d1c8-0713-e28a-3cdf-590b3f4e9449@linux.intel.com> <CAFqHKTmPChKu935zrHJWX1jF9mMg3kb5GFBQ=ogy66LnO6bfQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-773067350-1743678065=:1302"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-773067350-1743678065=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Apr 2025, Derek John Clark wrote:

> On Thu, Mar 27, 2025 at 5:56=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 17 Mar 2025, Derek J. Clark wrote:
> >
> > > Adds lenovo-wmi-capdata01 driver which provides the
> > > LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Mode"
> > > enabled hardware. Provides an interface for querying if a given
> > > attribute is supported by the hardware, as well as its default_value,
> > > max_value, min_value, and step increment.
> > >
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > > v4:
> > >  - Make driver data a private struct, remove references from Other Mo=
de
> > >    driver.
> > >  - Don't cache data at device initialization. Instead, on component b=
ind,
> > >    cache the data on a member variable of the Other Mode driver data
> > >    passed as a void pointer.
> > >  - Add header file for capdata01 structs.
> > >  - Add new struct to pass capdata01 array data and array length to Ot=
her
> > >    Mode.
> > > v3:
> > > - Add as component to lenovo-wmi-other driver.
> > > v2:
> > > - Use devm_kmalloc to ensure driver can be instanced, remove global
> > >   reference.
> > > - Ensure reverse Christmas tree for all variable declarations.
> > > - Remove extra whitespace.
> > > - Use guard(mutex) in all mutex instances, global mutex.
> > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > - Remove noisy pr_info usage.
> > > - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> > > - Use list to get the lenovo_wmi_cd01_priv instance in
> > >   lenovo_wmi_capdata01_get as none of the data provided by the macros
> > >   that will use it can pass a member of the struct for use in
> > >   container_of.
> > > ---
> > >  MAINTAINERS                                 |   2 +
> > >  drivers/platform/x86/Kconfig                |   4 +
> > >  drivers/platform/x86/Makefile               |   1 +
> > >  drivers/platform/x86/lenovo-wmi-capdata01.c | 136 ++++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
> > >  5 files changed, 172 insertions(+)
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6dde75922aaf..56ead241a053 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> > >  S:   Maintained
> > >  F:   Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > >  F:   Documentation/wmi/devices/lenovo-wmi-other.rst
> > > +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
> > > +F:   drivers/platform/x86/lenovo-wmi-capdata01.h
> > >  F:   drivers/platform/x86/lenovo-wmi-events.c
> > >  F:   drivers/platform/x86/lenovo-wmi-events.h
> > >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index 13b8f4ac5dc5..64663667f0cb 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -467,6 +467,10 @@ config LENOVO_WMI_HELPERS
> > >       tristate
> > >       depends on ACPI_WMI
> > >
> > > +config LENOVO_WMI_DATA01
> > > +     tristate
> > > +     depends on ACPI_WMI
> > > +
> > >  config IDEAPAD_LAPTOP
> > >       tristate "Lenovo IdeaPad Laptop Extras"
> > >       depends on ACPI
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> > > index fc039839286a..7a35c77221b7 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> > >  obj-$(CONFIG_YOGABOOK)               +=3D lenovo-yogabook.o
> > >  obj-$(CONFIG_YT2_1380)               +=3D lenovo-yoga-tab2-pro-1380-=
fastcharger.o
> > >  obj-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D lenovo-wmi-camera.o
> > > +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> > >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> > >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> > >
> > > diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/pl=
atform/x86/lenovo-wmi-capdata01.c
> > > new file mode 100644
> > > index 000000000000..b6876611ffd9
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
> > > @@ -0,0 +1,136 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * LENOVO_CAPABILITY_DATA_01 WMI data block driver.
> >
> > Add a empty comment line here, you might want to rephrase the opening o=
f
> > the paragraph after splitting these apart.
> >
> > > This interface provides
> > > + * information on tunable attributes used by the "Other Mode" WMI in=
terface,
> > > + * including if it is supported by the hardware, the default_value, =
max_value,
> > > + * min_value, and step increment.
> > > + *
> > > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > + */
> > > +
> > > +#include <linux/cleanup.h>
> > > +#include <linux/component.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/device.h>
> > > +#include <linux/gfp_types.h>
> > > +#include <linux/types.h>
> > > +#include <linux/wmi.h>
> >
> > Add an empty line here please.
> >
> > > +#include "lenovo-wmi-capdata01.h"
> > > +
> > > +/* Interface GUIDs */
> > > +#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3=
BE018154"
> > > +
> > > +struct lwmi_cd01_priv {
> > > +     struct wmi_device *wdev;
> > > +};
> > > +
> > > +/*
> > > + * lenovo_cd01_component_bind() - On master bind, caches all capabil=
ity data on
> > > + * the master device.
> >
> > Is this "On master bind" something that the caller should be doing? IMO=
,
> > that would belong to description paragraph instead of the function
> > summary.
> >
>=20
> Acked
>=20
> > > + * @cd01_dev: Pointer to the capability data 01 parent device.
> > > + * @om_dev: Pointer to the other mode parent device.
> > > + * @data: capdata01_list object pointer to return the capability dat=
a with.
> > > + *
> > > + * Returns: 0, or an error.
> >
> > Return:
> >
> > > + */
> > > +static int lenovo_cd01_component_bind(struct device *cd01_dev,
> > > +                                   struct device *om_dev, void *data=
)
> > > +{
> > > +     struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> > > +     int count, idx;
> > > +
> > > +     if (!priv)
> > > +             return -ENODEV;
> > > +
> > > +     count =3D wmidev_instance_count(priv->wdev);
> > > +
> > > +     if (count =3D=3D 0)
> > > +             return -EINVAL;
> > > +
> > > +     ((struct cd01_list *)data)->count =3D count;
> >
> > Please create a local variable with the correct type and since data is
> > void *, you don't need to cast it while assigning to that local variabl=
e.
> >
>=20
> This will be reworked a bit with Armin's suggestions.
>=20
> > > +     ((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev,=
 count,
> > > +                                                           sizeof(st=
ruct capdata01 *),
> >
> > sizeof() should preferrably take the type directly from ->data (with th=
e
> > correct amount of * chars).
> >
>=20
> With Armin's suggestion I'll be using struct_size, but I'll note this
> for future reference, thanks.
>=20
> > > +                                                           GFP_KERNE=
L);
> > > +     if (!data)
> > > +             return -ENOMEM;
> > > +
> > > +     for (idx =3D 0; idx < count; idx++) {
> > > +             union acpi_object *ret_obj __free(kfree) =3D NULL;
> > > +
> > > +             ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > > +             if (!ret_obj) {
> > > +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
> > > +                     continue;
> > > +             }
> > > +             if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > > +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
> > > +                     continue;
> > > +             }
> > > +
> > > +             if (ret_obj->buffer.length !=3D sizeof(struct capdata01=
)) {
> >
> > You could consider joining these 3 if()s with || to avoid having to
> > repeat the NULL assignment and continue.
> >
>=20
> devm_kzalloc will take care of the NULL assignment going forward. for
> !ret_obj, should I return an error here instead? It seems like a
> problem if that fails.

Sure, if you think something is an indication of a bigger problem that=20
requires giving up.


BTW, in general (not related to this particular comment), you don't have=20
reply/ack those review comments you're going to implement as I suggested.=
=20
I trust you to make the changes you don't contest :-).

That way, we can focus on the points that need further discussion.

--=20
 i.

--8323328-773067350-1743678065=:1302--
