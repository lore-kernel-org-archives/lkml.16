Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2C24886C;
	Thu,  3 Apr 2025 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677387; cv=none; b=OsJ9C+xxEnTwb3xJK8C4mfpwlBLGI1HDPstLBHbecv/txmG1ipZccxZRvKfuJIdkJtPCH/2l3Mjs7ClNSxEmF4w56vVODciaIP+cCjIPEcFkNOsbi8jy4phQzkWU6+s3SArPQp2mJu3eYnfHonAQlZmRAJb9Gt4L3A11VaUlvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677387; c=relaxed/simple;
	bh=AqwKe5oyO8drgc2bMHBgodraxBSwqWCGToyk7B+ihjM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oWXEnjPXf9c8BCPTyeZ3ppG6k+OMy1nBWe7ALiL0/T3Z9LX/0ZyQxRjIrLtTESX6Lqp3xHXi2vlszyPs/Df1vCjCgETutZzJg01Z22QFfuOkbRaqGEal2kZBnuGHyMM2F3ezdt+sIaLyFNuLnI5y4tA5993Ct67ph32JPXqzAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbFX9PQv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbFX9PQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743677386; x=1775213386;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=AqwKe5oyO8drgc2bMHBgodraxBSwqWCGToyk7B+ihjM=;
  b=HbFX9PQvfPa3/UD86QbSnWO0XSMUUFOP4Ff3sbUFi9Y54GZ3ywC13gbY
   4zjv6ORRu7jKLqO6EQvZXVQ9IZYmKe8lCfbRcU32ACPUBd2U0ZbquB8LJ
   NnRQkZZGQmc223lJGtRv6NNNTZEdjisZ5UqEa38PlZboZXvnFMI1wAZRc
   jsyd8wDL/87wgePWixEmMsC2Opuz5/o8U27i25/5oaFxPmKUjIMHZRE+Y
   0ffuOWwgSB7M94vJRIGSOF62nxncOqvFM+7UCRh1X6NUtG0hBuNnouFCK
   thaME9DK2nKGw3n1b3WXleji2w5wBaWBb+zy7Gq+0h15zrnmoMYrRz+Sp
   g==;
X-CSE-ConnectionGUID: ccBtOrFPSMiDeaJZdJk6Fg==
X-CSE-MsgGUID: t2EHyBN4Sm25lG7p+DKVNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56451321"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56451321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:49:45 -0700
X-CSE-ConnectionGUID: BQg96e2ZQ7O0hpeq43FSZg==
X-CSE-MsgGUID: luqQGr9LQU+E+ApjEhZVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="164206466"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:49:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 13:49:34 +0300 (EEST)
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
Subject: Re: [PATCH v4 5/6 RESEND] platform/x86: Add Lenovo Other Mode WMI
 Driver
In-Reply-To: <CAFqHKT=ca+b6+DjV8fWMFix6P89k1t3jJhwTr7R3Nh=zNDVxrA@mail.gmail.com>
Message-ID: <61d1d571-1a45-a777-5c9f-72a451974093@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-6-derekjohn.clark@gmail.com> <86ccabd2-44e9-d654-d4f2-0f175e9a9e31@linux.intel.com> <CAFqHKT=ca+b6+DjV8fWMFix6P89k1t3jJhwTr7R3Nh=zNDVxrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1395889906-1743676209=:1302"
Content-ID: <0715fcff-785d-d04d-ceea-937561ef14d4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1395889906-1743676209=:1302
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <94656bd4-f96a-beeb-1ae9-c783f109d9f8@linux.intel.com>

On Wed, 2 Apr 2025, Derek John Clark wrote:

> On Thu, Mar 27, 2025 at 6:49=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 17 Mar 2025, Derek J. Clark wrote:
> >
> > > Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" W=
MI
> > > interface that comes on some Lenovo "Gaming Series" hardware. Provide=
s a
> > > firmware-attributes class which enables the use of tunable knobs for =
SPL,
> > > SPPT, and FPPT.
> > >
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > > v4:
> > > - Treat Other Mode as a notifier chain head, use the notifier chain t=
o
> > >   get the current mode from Gamezone.
> > > - Add header file for Other Mode specific structs and finctions.
> > > - Use component master bind to cache the capdata01 array locally.
> > > - Drop all reference to external driver private data structs.
> > > - Various fixes from review.
> > > v3:
> > > - Add notifier block and store result for getting the Gamezone interf=
ace
> > >   profile changes.
> > > - Add driver as master component of capdata01 driver.
> > > - Use FIELD_PREP where appropriate.
> > > - Move macros and associated functions out of lemovo-wmi.h that are o=
nly
> > >   used by this driver.
> > > v2:
> > > - Use devm_kmalloc to ensure driver can be instanced, remove global
> > >   reference.
> > > - Ensure reverse Christmas tree for all variable declarations.
> > > - Remove extra whitespace.
> > > - Use guard(mutex) in all mutex instances, global mutex.
> > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > - Remove noisy pr_info usage.
> > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > >   called functions as the data provided by the macros that use it
> > >   doesn't pass a member of the struct for use in container_of.
> > > - Do not rely on GameZone interface to grab the current fan mode.
> > > ---
> > >  MAINTAINERS                             |   2 +
> > >  drivers/platform/x86/Kconfig            |  15 +
> > >  drivers/platform/x86/Makefile           |   1 +
> > >  drivers/platform/x86/lenovo-wmi-other.c | 626 ++++++++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo-wmi-other.h |  19 +
> > >  5 files changed, 663 insertions(+)
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> > >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 56ead241a053..87daee6075ad 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13170,6 +13170,8 @@ F:    drivers/platform/x86/lenovo-wmi-events.=
c
> > >  F:   drivers/platform/x86/lenovo-wmi-events.h
> > >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
> > >  F:   drivers/platform/x86/lenovo-wmi-helpers.h
> > > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > > +F:   drivers/platform/x86/lenovo-wmi-other.h
> > >
> > >  LENOVO WMI HOTKEY UTILITIES DRIVER
> > >  M:   Jackie Dong <xy-jackie@139.com>
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index 64663667f0cb..fc47604e37f7 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -471,6 +471,21 @@ config LENOVO_WMI_DATA01
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
> > > +       Say Y here if you have a WMI aware Lenovo Legion device and w=
ould like to use the
> > > +       firmware_attributes API to control various tunable settings t=
ypically exposed by
> > > +       Lenovo software in Windows.
> > > +
> > > +       To compile this driver as a module, choose M here: the module=
 will
> > > +       be called lenovo-wmi-other.
> > > +
> > >  config IDEAPAD_LAPTOP
> > >       tristate "Lenovo IdeaPad Laptop Extras"
> > >       depends on ACPI
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> > > index 7a35c77221b7..c6ce3c8594b1 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -72,6 +72,7 @@ obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi=
-camera.o
> > >  obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> > >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> > >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> > > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> > >
> > >  # Intel
> > >  obj-y                                +=3D intel/
> > > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platfo=
rm/x86/lenovo-wmi-other.c
> > > new file mode 100644
> > > index 000000000000..b517e45338e0
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > > @@ -0,0 +1,626 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Lenovo Other Mode WMI interface driver. This driver uses the fw_a=
ttributes
> >
> > Again, put a summary on own line as mentioned for the other files.
> >
> > > + * class to expose the various WMI functions provided by the "Other =
Mode" WMI
> > > + * interface. This enables CPU and GPU power limit as well as variou=
s other
> > > + * attributes for devices that fall under the "Gaming Series" of Len=
ovo laptop
> > > + * devices. Each attribute exposed by the "Other Mode"" interface ha=
s a
> > > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the dr=
iver to
> > > + * probe details about the attribute such as set/get support, step, =
min, max,
> > > + * and default value. Each attibute has multiple pages, one for each=
 of the
> > > + * fan profiles managed by the Gamezone interface.
> > > + *
> > > + * These attributes typically don't fit anywhere else in the sysfs a=
nd are set
> > > + * in Windows using one of Lenovo's multiple user applications.
> > > + *
> > > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > + */
> > > +
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/component.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/device.h>
> > > +#include <linux/gfp_types.h>
> > > +#include <linux/idr.h>
> > > +#include <linux/kobject.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/platform_profile.h>
> > > +#include <linux/types.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +#include "lenovo-wmi-capdata01.h"
> > > +#include "lenovo-wmi-events.h"
> > > +#include "lenovo-wmi-gamezone.h"
> > > +#include "lenovo-wmi-helpers.h"
> > > +#include "lenovo-wmi-other.h"
> > > +#include "firmware_attributes_class.h"
> > > +
> > > +/* Interface GUIDs */
> > > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD=
3B"
> > > +
> > > +/* Device IDs */
> > > +#define WMI_DEVICE_ID_CPU 0x01
> >
> > Two comments above add no value and can be dropped.
> >
> > > +
> > > +/* WMI_DEVICE_ID_CPU feature IDs */
> > > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > > +
> > > +/* Type IDs*/
> >
> > This is missing space but it doesn't IMO add any value, so just drop it=
=2E
> >
>=20
> Acked
>=20
> > > +#define WMI_TYPE_ID_NONE 0x00
> > > +
> > > +/* Method IDs */
> > > +#define WMI_FEATURE_VALUE_GET 17 /* Other Mode Getter */
> > > +#define WMI_FEATURE_VALUE_SET 18 /* Other Mode Setter */
> > > +
> > > +/* Attribute ID bitmasks */
> >
> > Neither of two comments for the defines seem to provide much value.
> >
>=20
> Acked
>=20
> > > +#define ATTR_DEV_ID_MASK GENMASK(31, 24)
> > > +#define ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > > +#define ATTR_MODE_ID_MASK GENMASK(15, 8)
> > > +#define ATTR_TYPE_ID_MASK GENMASK(7, 0)
> >
> > Please align the GENMASK()s
> >
>=20
> Acked
> > > +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
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
> > > +     struct blocking_notifier_head nhead;
> > > +     struct component_master_ops *ops;
> > > +     struct cd01_list cd01_list;
> > > +     struct device *fw_attr_dev;
> > > +     struct kset *fw_attr_kset;
> > > +     struct notifier_block nb;
> > > +     struct wmi_device *wdev;
> > > +     struct ida ida;
> > > +     int ida_id;
> > > +};
> > > +
> > > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > > +struct tunable_attr_01 {
> > > +     u32 type_id;
> > > +     u32 device_id;
> > > +     u32 feature_id;
> > > +     u32 store_value;
> > > +     struct device *dev;
> > > +     struct capdata01 *capdata;
> > > +};
> > > +
> > > +/* Tunable Attributes */
> > > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_I=
D_CPU,
> > > +                                    .feature_id =3D WMI_FEATURE_ID_C=
PU_SPL,
> > > +                                    .type_id =3D WMI_TYPE_ID_NONE };
> > > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_=
ID_CPU,
> > > +                                     .feature_id =3D WMI_FEATURE_ID_=
CPU_SPPT,
> > > +                                     .type_id =3D WMI_TYPE_ID_NONE }=
;
> > > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_=
ID_CPU,
> > > +                                     .feature_id =3D WMI_FEATURE_ID_=
CPU_FPPT,
> > > +                                     .type_id =3D WMI_TYPE_ID_NONE }=
;
> > > +
> > > +struct capdata01_attr_group {
> > > +     const struct attribute_group *attr_group;
> > > +     struct tunable_attr_01 *tunable_attr;
> > > +};
> > > +
> > > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
> >
> > Please add prefix and move to the top where the other defines are.
> >
>=20
> What do you mean by prefix?

Add a driver specific prefix to the name. Now that I looked, you seem to=20
have quite many defines above without prefix.

Generic names are slightly annoying because when you're looking at an=20
usage site, the name doesn't reveal if that's specific to the driver or=20
something more generic. When I see this (taken from below):

> > > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class,=
 NULL,
> > > +                                       MKDEV(0, 0), NULL, "%s",
> > > +                                       FW_ATTR_FOLDER);

=2E..I cannot know whether FW_ATTR_FOLDER is provided but something under=
=20
include/linux or if it's something this driver has defined.


> > > + */
> > > +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > > +{
> > > +     int err, i;
> > > +
> > > +     ida_init(&priv->ida);
> > > +     priv->ida_id =3D ida_alloc(&priv->ida, GFP_KERNEL);
> > > +     if (priv->ida_id < 0)
> > > +             return priv->ida_id;
> > > +
> > > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class,=
 NULL,
> > > +                                       MKDEV(0, 0), NULL, "%s",
> > > +                                       FW_ATTR_FOLDER);
> > > +     if (IS_ERR(priv->fw_attr_dev)) {
> > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > +             return err;
> >
> > Leaks the allocated ida?
> >
>=20
> Will fix.
>=20
> > > +     }
> > > +
> > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> > > +                                              &priv->fw_attr_dev->ko=
bj);
> > > +     if (!priv->fw_attr_kset) {
> > > +             err =3D -ENOMEM;
> > > +             goto err_destroy_classdev;
> > > +     }
> > > +
> > > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
> >
> > Change i to unsigned when used in loops like this.
> >
> > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > +                                      capdata01_attr_groups[i].attr_=
group);
> > > +             if (err) {
> > > +                     pr_debug("Failed to create sysfs-group for %s: =
%d\n",
> > > +                              capdata01_attr_groups[i].attr_group->n=
ame,
> > > +                              err);
> > > +                     goto err_remove_groups;
> > > +             }
> > > +             capdata01_attr_groups[i].tunable_attr->dev =3D &priv->w=
dev->dev;
> > > +     }
> > > +     return 0;
> > > +
> > > +err_remove_groups:
> > > +     ida_free(&priv->ida, priv->ida_id);
> > > +     while (i-- >=3D 0) {
> >
> > >=3D 0 is not necessary.
> >
>=20
> I suppose with an unsigned int it will never go below 0, so that's fine.
> FYI this was discussed at length in the last version and added at
> Mario's request.

Actually, it's a bug because i-- is postdecremented so when while (0 >=3D 0=
),
i has already been post-decremented by 1 to -1 or UINT_MAX in case of=20
unsigned type.

> >From Mario in that series:
> > Well what you've got right now is an unwind routine where if you say
> > have 5 attributes and the 5th (0-indexed so "4th") fails, you try to
> > free 3rd, 2nd, 1st.
> >
> > The only problem is the boundary doesn't free the 0th index attribute.
> >
> > I think that just changing the loop to (i-- >=3D 0) would solve it.

No, his comment is not correct because i-- is post-decremented so the=20
expression returns the old value to the compare.

while (i-- > 0) will free the 0th item on the last iteration.

But the usual unroll pattern is without the explicit compare so please use=
=20
just while (i--).

> > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > +                                capdata01_attr_groups[i].attr_group)=
;
> > > +     }
> > > +     kset_unregister(priv->fw_attr_kset);
> > > +
> > > +err_destroy_classdev:
> > > +     device_unregister(priv->fw_attr_dev);
> > > +     return err;
> > > +}
> > > +
> > > +/*
> > > + * lwmi_om_fw_attr_remove() - Unregisters all capdata01_attr_groups[=
] attributes as
> > > + * firmware_attributes_class members.
> > > + * @priv: The Other Mode driver data.
> > > + *
> > > + */
> > > +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> > > +{
> > > +     int size =3D ARRAY_SIZE(capdata01_attr_groups);
> >
> > unsigned int i =3D ARRAY_SIZE(capdata01_attr_groups) - 1;
> >
> > > +
> > > +     while (--size >=3D 0) {
> >
> > while (i--) {
> >
>=20
> Acked
>=20
> > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > +                                capdata01_attr_groups[size].attr_gro=
up);
> > > +     }
> > > +     kset_unregister(priv->fw_attr_kset);
> > > +     device_unregister(priv->fw_attr_dev);
> > > +}


--=20
 i.
--8323328-1395889906-1743676209=:1302--
