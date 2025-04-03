Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1BB1DF975;
	Thu,  3 Apr 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678362; cv=none; b=DrgjEUKYNhgtTD7uCjVSZ9D14ANP7lCWBUKpvT4WwOo9Do/mjbDeWNhdd6RurZ1TrWVVpbY4ykWRjB7PsRvBZHJvD54RVsFWCugLtV5n42ybTziYxyOcNsnRo7Vp0rvNB6G5yGRMx1u66PvIViUFvri24Yf9aMF4Xslj/eobhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678362; c=relaxed/simple;
	bh=miPdVjGKHBCpfxMJwJ8PIg/2bzqURiWHSdeSMyhI7sU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Epa/HpUSvwRKtvdQFai5DaskjOHlqrcZxlZ+fNhD23yDssLSsO56yA1a9ooo8iCwNB40BBeXV/l0XclsstaHBC9QOP+x38/IIYo8lfy+fk2j6hiamkzREMydxKhbso2sySI8T8Cg6Ibx/WXeaGR/bz+D+xhBQR9Jb9EHN/iUQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnvxPbW0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnvxPbW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743678359; x=1775214359;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=miPdVjGKHBCpfxMJwJ8PIg/2bzqURiWHSdeSMyhI7sU=;
  b=XnvxPbW0pJYQTiKah32rC2d5UlJyPxMAX8EhuyuljVrraKcbqGazNFZE
   GzyXbVM3viYl52bZtIy1xvvLb4ElGINsJn6IMx/aXLaCmxPa+/jYvz6OH
   btjEDRTyp4GqbJUQHpAYXjrI3mrJ9w+h+LPbPSjyRFsV0Yvbfp5Aky2Et
   tYr56AX8W+n78NRVgBL+i/VjB0Q+nssNEiUFvrV1S3iiQbfDTvBy4LGjM
   GwhdLVU3UBUsfJx8CH6gddMLlhJm7pfmII+MDRegd3GnvSfYo2Q3ZBdvy
   Xp4b0Pq7APvg/tX4YKmkao/yJWfK1Ynti+grCYNrgaCHvYDiAUuJyzH59
   w==;
X-CSE-ConnectionGUID: 1W/kWC3YQ+Cx3JcK0MxzdA==
X-CSE-MsgGUID: 3JrNOgUyT+WwWaISGVbn5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56445823"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56445823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:05:58 -0700
X-CSE-ConnectionGUID: zICU4lTbQaejIBghXabBLA==
X-CSE-MsgGUID: /wE8dQd9QFOJcqAZt/oVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="150177944"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:05:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Apr 2025 14:05:49 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Derek John Clark <derekjohn.clark@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6 RESEND] platform/x86: Add Lenovo Other Mode WMI
 Driver
In-Reply-To: <f4b6d8e2-9fc2-4061-996e-2c5913e2429a@gmx.de>
Message-ID: <ad947604-7bfc-9d0f-6a82-a518f15b4425@linux.intel.com>
References: <20250317144326.5850-1-derekjohn.clark@gmail.com> <20250317144326.5850-6-derekjohn.clark@gmail.com> <e5214959-bfc0-4e97-bd56-d0a609f5a15e@gmx.de> <CAFqHKT=QmbPXSkz-wtDjpqQuS5g4GqRJUT-DSRuSnn6Gia3b=A@mail.gmail.com>
 <f4b6d8e2-9fc2-4061-996e-2c5913e2429a@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-288598994-1743678349=:1302"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-288598994-1743678349=:1302
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 3 Apr 2025, Armin Wolf wrote:

> Am 03.04.25 um 00:24 schrieb Derek John Clark:
>=20
> > On Wed, Mar 26, 2025 at 8:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
> > > Am 17.03.25 um 15:43 schrieb Derek J. Clark:
> > >=20
> > > > Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode"=
 WMI
> > > > interface that comes on some Lenovo "Gaming Series" hardware. Provi=
des a
> > > > firmware-attributes class which enables the use of tunable knobs fo=
r
> > > > SPL,
> > > > SPPT, and FPPT.
> > > >=20
> > > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > ---
> > > > v4:
> > > > - Treat Other Mode as a notifier chain head, use the notifier chain=
 to
> > > >     get the current mode from Gamezone.
> > > > - Add header file for Other Mode specific structs and finctions.
> > > > - Use component master bind to cache the capdata01 array locally.
> > > > - Drop all reference to external driver private data structs.
> > > > - Various fixes from review.
> > > > v3:
> > > > - Add notifier block and store result for getting the Gamezone inte=
rface
> > > >     profile changes.
> > > > - Add driver as master component of capdata01 driver.
> > > > - Use FIELD_PREP where appropriate.
> > > > - Move macros and associated functions out of lemovo-wmi.h that are=
 only
> > > >     used by this driver.
> > > > v2:
> > > > - Use devm_kmalloc to ensure driver can be instanced, remove global
> > > >     reference.
> > > > - Ensure reverse Christmas tree for all variable declarations.
> > > > - Remove extra whitespace.
> > > > - Use guard(mutex) in all mutex instances, global mutex.
> > > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > > - Remove noisy pr_info usage.
> > > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
> > > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > > >     called functions as the data provided by the macros that use it
> > > >     doesn't pass a member of the struct for use in container_of.
> > > > - Do not rely on GameZone interface to grab the current fan mode.
> > > > ---
> > > >    MAINTAINERS                             |   2 +
> > > >    drivers/platform/x86/Kconfig            |  15 +
> > > >    drivers/platform/x86/Makefile           |   1 +
> > > >    drivers/platform/x86/lenovo-wmi-other.c | 626
> > > > ++++++++++++++++++++++++
> > > >    drivers/platform/x86/lenovo-wmi-other.h |  19 +
> > > >    5 files changed, 663 insertions(+)
> > > >    create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> > > >    create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> > > >=20
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 56ead241a053..87daee6075ad 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -13170,6 +13170,8 @@ F:    drivers/platform/x86/lenovo-wmi-event=
s.c
> > > >    F:  drivers/platform/x86/lenovo-wmi-events.h
> > > >    F:  drivers/platform/x86/lenovo-wmi-helpers.c
> > > >    F:  drivers/platform/x86/lenovo-wmi-helpers.h
> > > > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > > > +F:   drivers/platform/x86/lenovo-wmi-other.h
> > > >=20
> > > >    LENOVO WMI HOTKEY UTILITIES DRIVER
> > > >    M:  Jackie Dong <xy-jackie@139.com>
> > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > > > index 64663667f0cb..fc47604e37f7 100644
> > > > --- a/drivers/platform/x86/Kconfig
> > > > +++ b/drivers/platform/x86/Kconfig
> > > > @@ -471,6 +471,21 @@ config LENOVO_WMI_DATA01
> > > >        tristate
> > > >        depends on ACPI_WMI
> > > >=20
> > > > +config LENOVO_WMI_TUNING
> > > > +     tristate "Lenovo Other Mode WMI Driver"
> > > > +     depends on ACPI_WMI
> > > > +     select FW_ATTR_CLASS
> > > > +     select LENOVO_WMI_DATA01
> > > > +     select LENOVO_WMI_EVENTS
> > > > +     select LENOVO_WMI_HELPERS
> > > > +     help
> > > > +       Say Y here if you have a WMI aware Lenovo Legion device and
> > > > would like to use the
> > > > +       firmware_attributes API to control various tunable settings
> > > > typically exposed by
> > > > +       Lenovo software in Windows.
> > > > +
> > > > +       To compile this driver as a module, choose M here: the modu=
le
> > > > will
> > > > +       be called lenovo-wmi-other.
> > > > +
> > > >    config IDEAPAD_LAPTOP
> > > >        tristate "Lenovo IdeaPad Laptop Extras"
> > > >        depends on ACPI
> > > > diff --git a/drivers/platform/x86/Makefile
> > > > b/drivers/platform/x86/Makefile
> > > > index 7a35c77221b7..c6ce3c8594b1 100644
> > > > --- a/drivers/platform/x86/Makefile
> > > > +++ b/drivers/platform/x86/Makefile
> > > > @@ -72,6 +72,7 @@ obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D
> > > > lenovo-wmi-camera.o
> > > >    obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
> > > >    obj-$(CONFIG_LENOVO_WMI_EVENTS)     +=3D lenovo-wmi-events.o
> > > >    obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
> > > > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> > > >=20
> > > >    # Intel
> > > >    obj-y                               +=3D intel/
> > > > diff --git a/drivers/platform/x86/lenovo-wmi-other.c
> > > > b/drivers/platform/x86/lenovo-wmi-other.c
> > > > new file mode 100644
> > > > index 000000000000..b517e45338e0
> > > > --- /dev/null
> > > > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > > > @@ -0,0 +1,626 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * Lenovo Other Mode WMI interface driver. This driver uses the
> > > > fw_attributes
> > > > + * class to expose the various WMI functions provided by the "Othe=
r
> > > > Mode" WMI
> > > > + * interface. This enables CPU and GPU power limit as well as vari=
ous
> > > > other
> > > > + * attributes for devices that fall under the "Gaming Series" of L=
enovo
> > > > laptop
> > > > + * devices. Each attribute exposed by the "Other Mode"" interface =
has a
> > > > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the
> > > > driver to
> > > > + * probe details about the attribute such as set/get support, step=
,
> > > > min, max,
> > > > + * and default value. Each attibute has multiple pages, one for ea=
ch of
> > > > the
> > > > + * fan profiles managed by the Gamezone interface.
> > > > + *
> > > > + * These attributes typically don't fit anywhere else in the sysfs=
 and
> > > > are set
> > > > + * in Windows using one of Lenovo's multiple user applications.
> > > > + *
> > > > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > > +
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/cleanup.h>
> > > > +#include <linux/component.h>
> > > > +#include <linux/container_of.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/gfp_types.h>
> > > > +#include <linux/idr.h>
> > > > +#include <linux/kobject.h>
> > > > +#include <linux/notifier.h>
> > > > +#include <linux/platform_profile.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/wmi.h>
> > > Hi,
> > >=20
> > > please also include linux/acpi.h, linux/export.h and linux/module.h.
> > >=20
> > > > +
> > > > +#include "lenovo-wmi-capdata01.h"
> > > > +#include "lenovo-wmi-events.h"
> > > > +#include "lenovo-wmi-gamezone.h"
> > > > +#include "lenovo-wmi-helpers.h"
> > > > +#include "lenovo-wmi-other.h"
> > > > +#include "firmware_attributes_class.h"
> > > > +
> > > > +/* Interface GUIDs */
> > > > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089=
CD3B"
> > > > +
> > > > +/* Device IDs */
> > > > +#define WMI_DEVICE_ID_CPU 0x01
> > > > +
> > > > +/* WMI_DEVICE_ID_CPU feature IDs */
> > > > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > > > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > > > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > > > +
> > > > +/* Type IDs*/
> > > > +#define WMI_TYPE_ID_NONE 0x00
> > > > +
> > > > +/* Method IDs */
> > > > +#define WMI_FEATURE_VALUE_GET 17 /* Other Mode Getter */
> > > > +#define WMI_FEATURE_VALUE_SET 18 /* Other Mode Setter */
> > > > +
> > > > +/* Attribute ID bitmasks */
> > > > +#define ATTR_DEV_ID_MASK GENMASK(31, 24)
> > > > +#define ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > > > +#define ATTR_MODE_ID_MASK GENMASK(15, 8)
> > > > +#define ATTR_TYPE_ID_MASK GENMASK(7, 0)
> > > > +
> > > > +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> > > > +
> > > > +enum attribute_property {
> > > > +     DEFAULT_VAL,
> > > > +     MAX_VAL,
> > > > +     MIN_VAL,
> > > > +     STEP_VAL,
> > > > +     SUPPORTED,
> > > > +};
> > > > +
> > > > +struct lwmi_om_priv {
> > > > +     struct blocking_notifier_head nhead;
> > > Is nhead actually used somewhere?
> > >=20
> > No, I switched to a global. I'll remove.
> >=20
> > > > +     struct component_master_ops *ops;
> > > > +     struct cd01_list cd01_list;
> > > > +     struct device *fw_attr_dev;
> > > > +     struct kset *fw_attr_kset;
> > > > +     struct notifier_block nb;
> > > > +     struct wmi_device *wdev;
> > > > +     struct ida ida;
> > > Is this idea actually used somewhere? If yes then please turn it into=
 a
> > > global variable.
> > >=20
> > It's something I added for v4 that you requested in v2 and I forgot in
> > v3. If I'm not using it correctly then I'll rework it. Intent was to
> > make it unique per instance. Based on your other comment below I
> > should use this as a postfix when instantiating the FW_ATTR_FOLDER?
>=20
> Yes.
>=20
> > > > +     int ida_id;
> > > > +};
> > > > +
> > > > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > > > +struct tunable_attr_01 {
> > > > +     u32 type_id;
> > > > +     u32 device_id;
> > > > +     u32 feature_id;
> > > > +     u32 store_value;
> > > > +     struct device *dev;
> > > > +     struct capdata01 *capdata;
> > > > +};
> > > > +
> > > > +/* Tunable Attributes */
> > > > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE=
_ID_CPU,
> > > > +                                    .feature_id =3D
> > > > WMI_FEATURE_ID_CPU_SPL,
> > > > +                                    .type_id =3D WMI_TYPE_ID_NONE =
};
> > > > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVIC=
E_ID_CPU,
> > > > +                                     .feature_id =3D
> > > > WMI_FEATURE_ID_CPU_SPPT,
> > > > +                                     .type_id =3D WMI_TYPE_ID_NONE=
 };
> > > > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVIC=
E_ID_CPU,
> > > > +                                     .feature_id =3D
> > > > WMI_FEATURE_ID_CPU_FPPT,
> > > > +                                     .type_id =3D WMI_TYPE_ID_NONE=
 };
> > > > +
> > > > +struct capdata01_attr_group {
> > > > +     const struct attribute_group *attr_group;
> > > > +     struct tunable_attr_01 *tunable_attr;
> > > > +};
> > > > +
> > > > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
> > > Please use a IDA to give each device a unique name like
> > > "lenovo-wmi-otherX". Otherwise
> > > the driver cannot be instantiated multiple times.
> > >=20
> > > > +
> > > > +/* Notifier Methods */
> > > > +int lwmi_om_register_notifier(struct notifier_block *nb)
> > > > +{
> > > > +     return blocking_notifier_chain_register(&om_chain_head, nb);
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER"=
);
> > > > +
> > > > +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> > > > +{
> > > > +     return blocking_notifier_chain_unregister(&om_chain_head, nb)=
;
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHE=
R");
> > > > +
> > > > +static void devm_lwmi_om_unregister_notifier(void *data)
> > > > +{
> > > > +     struct notifier_block *nb =3D data;
> > > > +
> > > > +     lwmi_om_unregister_notifier(nb);
> > > > +}
> > > > +
> > > > +int devm_lwmi_om_register_notifier(struct device *dev,
> > > > +                                struct notifier_block *nb)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     ret =3D lwmi_om_register_notifier(nb);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return devm_add_action_or_reset(dev,
> > > > devm_lwmi_om_unregister_notifier,
> > > > +                                     nb);
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier,
> > > > "LENOVO_WMI_OTHER");
> > > > +
> > > > +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     ret =3D blocking_notifier_call_chain(&om_chain_head,
> > > > THERMAL_MODE_EVENT,
> > > > +                                        mode);
> > > > +
> > > > +     if (ret !=3D NOTIFY_OK)
> > > > +             return -EINVAL;
> > > Better remove the NOTIFY_STOP_MASK so that clients can return NOTIFY_=
STOP:
> > >=20
> > >           (ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK
> > >=20
> > Acked
> >=20
> > > > +
> > > > +     if (*mode < SMARTFAN_MODE_QUIET || *mode > SMARTFAN_MODE_CUST=
OM)
> > > > +             return -EINVAL;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +/* Attribute Methods */
> > > > +/*
> > > /* -> /**
> > >=20
> > > The same applies to the other kernel doc comments as well.
> > >=20
> > > > + * int_type_show() - Emit the data type for an integer attribute
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > > + * @buf: The buffer to write to.
> > > > + *
> > > > + * Returns: Number of characters written to buf.
> > > > + */
> > > > +static ssize_t int_type_show(struct kobject *kobj, struct
> > > > kobj_attribute *kattr,
> > > > +                          char *buf)
> > > > +{
> > > > +     return sysfs_emit(buf, "integer\n");
> > > > +}
> > > > +
> > > > +/*
> > > > + * attr_capdata01_get - Get the data of the specified attribute
> > > > + * from lwmi_om->cd01.
> > > > + * @tunable_attr: The attribute to be populated.
> > > > + *
> > > > + * Returns: Either a pointer to capability data, or NULL.
> > > > + */
> > > > +static struct capdata01 *
> > > > +attr_capdata01_get_data(struct lwmi_om_priv *priv,
> > > > +                     struct tunable_attr_01 *tunable_attr,
> > > > +                     enum thermal_mode mode)
> > > > +{
> > > > +     u32 attribute_id =3D
> > > > +             FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id)=
 |
> > > > +             FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_i=
d) |
> > > > +             FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > > > +             FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> > > > +     int idx;
> > > > +
> > > > +     for (idx =3D 0; idx < priv->cd01_list.count; idx++) {
> > > > +             if (!priv->cd01_list.data[idx])
> > > > +                     continue;
> > > > +
> > > > +             if (priv->cd01_list.data[idx]->id !=3D attribute_id)
> > > > +                     continue;
> > > > +             return priv->cd01_list.data[idx];
> > > > +     }
> > > > +     return NULL;
> > > > +}
> > > > +
> > > > +/**
> > > > + * attr_capdata01_show() - Get the value of the specified attribut=
e
> > > > property
> > > > + * from LENOVO_CAPABILITY_DATA_01.
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > > + * @buf: The buffer to write to.
> > > > + * @tunable_attr: The attribute to be read.
> > > > + * @prop: The property of this attribute to be read.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any
> > > > "_show"
> > > > + * attribute which works only with integers.
> > > > + *
> > > > + * If the WMI is success, then the sysfs attribute is notified.
> > > > + *
> > > > + * Returns: Either number of characters written to buf, or an erro=
r.
> > > > + */
> > > > +static ssize_t attr_capdata01_show(struct kobject *kobj,
> > > > +                                struct kobj_attribute *kattr, char
> > > > *buf,
> > > > +                                struct tunable_attr_01 *tunable_at=
tr,
> > > > +                                enum attribute_property prop)
> > > > +{
> > > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->d=
ev);
> > > > +     struct capdata01 *capdata;
> > > > +     int value;
> > > > +
> > > > +     if (!priv)
> > > > +             return -ENODEV;
> > > Is this check really necessary? If not then please remove it.
> > >=20
> > Acked
> >=20
> > > > +
> > > > +     capdata =3D attr_capdata01_get_data(priv, tunable_attr,
> > > > +                                       SMARTFAN_MODE_CUSTOM);
> > > > +
> > > > +     if (!capdata)
> > > > +             return -ENODEV;
> > > > +
> > > > +     switch (prop) {
> > > > +     case DEFAULT_VAL:
> > > > +             value =3D capdata->default_value;
> > > > +             break;
> > > > +     case MAX_VAL:
> > > > +             value =3D capdata->max_value;
> > > > +             break;
> > > > +     case MIN_VAL:
> > > > +             value =3D capdata->min_value;
> > > > +             break;
> > > > +     case STEP_VAL:
> > > > +             value =3D capdata->step;
> > > > +             break;
> > > > +     default:
> > > > +             return -EINVAL;
> > > > +     }
> > > > +     return sysfs_emit(buf, "%d\n", value);
> > > > +}
> > > > +
> > > > +/* Simple attribute creation */
> > > > +
> > > > +/*
> > > > + * att_current_value_store() - Set the current value of the given
> > > > attribute
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > > + * @buf: The buffer to read from, this is parsed to `int` type.
> > > > + * @count: Required by sysfs attribute macros, pass in from the ca=
llee
> > > > attr.
> > > > + * @tunable_attr: The attribute to be stored.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any
> > > > + * attribute's "current_value_store" which works only with integer=
s.
> > > > The
> > > > + * integer to be sent to the WMI method is range checked and an er=
ror
> > > > returned
> > > > + * if out of range.
> > > > + *
> > > > + * If the value is valid and WMI is success, then the sysfs attrib=
ute
> > > > is
> > > > + * notified.
> > > > + *
> > > > + * Returns: Either count, or an error.
> > > > + */
> > > > +static ssize_t attr_current_value_store(struct kobject *kobj,
> > > > +                                     struct kobj_attribute *kattr,
> > > > +                                     const char *buf, size_t count=
,
> > > > +                                     struct tunable_attr_01
> > > > *tunable_attr)
> > > > +{
> > > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->d=
ev);
> > > > +     struct wmi_method_args_32 args;
> > > > +     struct capdata01 *capdata;
> > > > +     enum thermal_mode mode;
> > > > +     u32 attribute_id;
> > > > +     u32 value;
> > > > +     int err;
> > > > +
> > > > +     if (!priv)
> > > > +             return -ENODEV;
> > > Same as above.
> > >=20
> > > > +
> > > > +     err =3D lwmi_om_notifier_call(&mode);
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     if (mode !=3D SMARTFAN_MODE_CUSTOM)
> > > > +             return -EINVAL;
> > > Better return -EBUSY here to signal userspace that the underlying dev=
ice
> > > currently
> > > cannot process this request.
> > >=20
> > Acked
> >=20
> > > > +
> > > > +     capdata =3D attr_capdata01_get_data(priv, tunable_attr, mode)=
;
> > > > +
> > > > +     if (!capdata)
> > > > +             return -ENODEV;
> > > > +
> > > > +     attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK,
> > > > tunable_attr->device_id) |
> > > > +                    FIELD_PREP(ATTR_FEAT_ID_MASK,
> > > > tunable_attr->feature_id) |
> > > > +                    FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > > > +                    FIELD_PREP(ATTR_TYPE_ID_MASK,
> > > > tunable_attr->type_id);
> > > > +
> > > > +     err =3D kstrtouint(buf, 10, &value);
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     if (value < capdata->min_value || value > capdata->max_value)
> > > > +             return -EINVAL;
> > > > +
> > > > +     args.arg0 =3D attribute_id;
> > > > +     args.arg1 =3D value;
> > > > +
> > > > +     err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0,
> > > > WMI_FEATURE_VALUE_SET,
> > > > +                                    (unsigned char *)&args,
> > > > sizeof(args),
> > > > +                                    NULL);
> > > > +
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     tunable_attr->store_value =3D value;
> > > Is store_value actually used somewhere? If no then please remove.
> > >=20
> > No, it's a carry over from when I modeled after asus-armoury. Since
> > I'm looking up the value each time vice using the last set value I can
> > drop this. Thanks.
> >=20
> > > > +     return count;
> > > > +};
> > > > +
> > > > +/*
> > > > + * attr_current_value_show() - Get the current value of the given
> > > > attribute
> > > > + * @kobj: Pointer to the driver object.
> > > > + * @kobj_attribute: Pointer to the attribute calling this function=
=2E
> > > > + * @buf: The buffer to write to.
> > > > + * @tunable_attr: The attribute to be read.
> > > > + *
> > > > + * This function is intended to be generic so it can be called fro=
m any
> > > > "_show"
> > > > + * attribute which works only with integers.
> > > > + *
> > > > + * If the WMI is success, then the sysfs attribute is notified.
> > > > + *
> > > > + * Returns: Either number of characters written to buf, or an erro=
r.
> > > > + */
> > > > +static ssize_t attr_current_value_show(struct kobject *kobj,
> > > > +                                    struct kobj_attribute *kattr, =
char
> > > > *buf,
> > > > +                                    struct tunable_attr_01
> > > > *tunable_attr)
> > > > +{
> > > > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->d=
ev);
> > > > +     struct wmi_method_args_32 args;
> > > > +     enum thermal_mode mode;
> > > > +     u32 attribute_id;
> > > > +     int retval;
> > > > +     int err;
> > > > +
> > > > +     if (!priv)
> > > > +             return -ENODEV;
> > > Same as above.
> > >=20
> > Acked
> >=20
> > > > +
> > > > +     err =3D lwmi_om_notifier_call(&mode);
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK,
> > > > tunable_attr->device_id) |
> > > > +                    FIELD_PREP(ATTR_FEAT_ID_MASK,
> > > > tunable_attr->feature_id) |
> > > > +                    FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > > > +                    FIELD_PREP(ATTR_TYPE_ID_MASK,
> > > > tunable_attr->type_id);
> > > > +
> > > > +     args.arg0 =3D attribute_id;
> > > > +
> > > > +     err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0,
> > > > WMI_FEATURE_VALUE_GET,
> > > > +                                    (unsigned char *)&args,
> > > > sizeof(args),
> > > > +                                    &retval);
> > > > +
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     return sysfs_emit(buf, "%d\n", retval);
> > > > +}
> > > > +
> > > > +/* Attribute macros */
> > > > +#define __LL_ATTR_RO(_func, _name)                                =
    \
> > > > +     {                                                            =
 \
> > > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0=
444 }, \
> > > > +             .show =3D _func##_##_name##_show,                    =
   \
> > > > +     }
> > > > +
> > > > +#define __LL_ATTR_RO_AS(_name, _show)                             =
    \
> > > > +     {                                                            =
 \
> > > > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0=
444 }, \
> > > > +             .show =3D _show,                                     =
   \
> > > > +     }
> > > > +
> > > > +#define __LL_ATTR_RW(_func, _name) \
> > > > +     __ATTR(_name, 0644, _func##_##_name##_show,
> > > > _func##_##_name##_store)
> > > > +
> > > > +/* Shows a formatted static variable */
> > > > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)
> > > > \
> > > > +     static ssize_t _attrname##_##_prop##_show(
> > > > \
> > > > +             struct kobject *kobj, struct kobj_attribute *kattr, c=
har
> > > > *buf) \
> > > > +     {
> > > > \
> > > > +             return sysfs_emit(buf, _fmt, _val);
> > > > \
> > > > +     }
> > > > \
> > > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D
> > > > \
> > > > +             __LL_ATTR_RO(_attrname, _prop)
> > > > +
> > > > +/* Attribute current value read/write */
> > > > +#define __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname)
> > > > \
> > > > +     static ssize_t _attrname##_current_value_store(
> > > > \
> > > > +             struct kobject *kobj, struct kobj_attribute *kattr,
> > > > \
> > > > +             const char *buf, size_t count)
> > > > \
> > > > +     {
> > > > \
> > > > +             return attr_current_value_store(kobj, kattr, buf, cou=
nt,
> > > > \
> > > > +                                             &_attrname);
> > > > \
> > > > +     }
> > > > \
> > > > +     static ssize_t _attrname##_current_value_show(
> > > > \
> > > > +             struct kobject *kobj, struct kobj_attribute *kattr, c=
har
> > > > *buf) \
> > > > +     {
> > > > \
> > > > +             return attr_current_value_show(kobj, kattr, buf,
> > > > &_attrname);  \
> > > > +     }
> > > > \
> > > > +     static struct kobj_attribute attr_##_attrname##_current_value=
 =3D
> > > > \
> > > > +             __LL_ATTR_RW(_attrname, current_value)
> > > > +
> > > > +/* Attribute property read only */
> > > > +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)
> > > > \
> > > > +     static ssize_t _attrname##_##_prop##_show(
> > > > \
> > > > +             struct kobject *kobj, struct kobj_attribute *kattr, c=
har
> > > > *buf) \
> > > > +     {
> > > > \
> > > > +             return attr_capdata01_show(kobj, kattr, buf, &_attrna=
me,
> > > > \
> > > > +                                        _prop_type);
> > > > \
> > > > +     }
> > > > \
> > > > +     static struct kobj_attribute attr_##_attrname##_##_prop =3D
> > > > \
> > > > +             __LL_ATTR_RO(_attrname, _prop)
> > > > +
> > > > +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)
> > > > \
> > > > +     __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                 =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);=
  \
> > > > +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);        =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);        =
  \
> > > > +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);=
  \
> > > > +     static struct kobj_attribute attr_##_attrname##_type =3D     =
    \
> > > > +             __LL_ATTR_RO_AS(type, int_type_show);                =
  \
> > > > +     static struct attribute *_attrname##_attrs[] =3D {           =
    \
> > > > +             &attr_##_attrname##_current_value.attr,              =
  \
> > > > +             &attr_##_attrname##_default_value.attr,              =
  \
> > > > +             &attr_##_attrname##_display_name.attr,               =
  \
> > > > +             &attr_##_attrname##_max_value.attr,                  =
  \
> > > > +             &attr_##_attrname##_min_value.attr,                  =
  \
> > > > +             &attr_##_attrname##_scalar_increment.attr,           =
  \
> > > > +             &attr_##_attrname##_type.attr,                       =
  \
> > > > +             NULL,                                                =
  \
> > > > +     };                                                           =
  \
> > > > +     static const struct attribute_group _attrname##_attr_group =
=3D { \
> > > > +             .name =3D _fsname, .attrs =3D _attrname##_attrs      =
      \
> > > > +     }
> > > > +
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > > > +                         "Set the CPU sustained power limit");
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > > > +                         "Set the CPU slow package power tracking
> > > > limit");
> > > > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > > > +                         "Set the CPU fast package power tracking
> > > > limit");
> > > > +
> > > > +static struct capdata01_attr_group capdata01_attr_groups[] =3D {
> > > > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > > > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > > > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > > > +     {},
> > > > +};
> > > > +
> > > > +/*
> > > > + * lwmi_om_fw_attr_add() - Registers all capdata01_attr_groups[]
> > > > attributes as
> > > > + * firmware_attributes_class members.
> > > > + * @priv: The Other Mode driver data.
> > > > + *
> > > > + * Returns: Either 0, or an error.
> > > > + */
> > > > +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > > > +{
> > > > +     int err, i;
> > > > +
> > > > +     ida_init(&priv->ida);
> > > > +     priv->ida_id =3D ida_alloc(&priv->ida, GFP_KERNEL);
> > > > +     if (priv->ida_id < 0)
> > > > +             return priv->ida_id;
> > > > +
> > > > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_clas=
s,
> > > > NULL,
> > > > +                                       MKDEV(0, 0), NULL, "%s",
> > > > +                                       FW_ATTR_FOLDER);
> > > > +     if (IS_ERR(priv->fw_attr_dev)) {
> > > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > > +             return err;
> > > > +     }
> > > > +
> > > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL=
,
> > > > +
> > > > &priv->fw_attr_dev->kobj);
> > > > +     if (!priv->fw_attr_kset) {
> > > > +             err =3D -ENOMEM;
> > > > +             goto err_destroy_classdev;
> > > > +     }
> > > > +
> > > > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++)=
 {
> > > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > > +
> > > > capdata01_attr_groups[i].attr_group);
> > > > +             if (err) {
> > > > +                     pr_debug("Failed to create sysfs-group for %s=
:
> > > > %d\n",
> > > > +
> > > > capdata01_attr_groups[i].attr_group->name,
> > > > +                              err);
> > > > +                     goto err_remove_groups;
> > > > +             }
> > > > +             capdata01_attr_groups[i].tunable_attr->dev =3D
> > > > &priv->wdev->dev;
> > > Since you already know which attributes are supported, maybe it would=
 make
> > > sense to only
> > > create attributes which are supported on a given machine?
> > >=20
> > This is a bit challenging. Since the data is stored per thermal mode I
> > would need to look through all supported thermal events and aggregate
> > the supported values. That's an additional call to gamezone and 4-5
> > additional calls to capdata01. It might be easier to return
> > -EOPNOTSUPP when accessed for these attributes? I could also assume if
> > an attribute is available for custom mode it is available for all
> > modes.
>=20
> Assuming that a given attribute exists if it is defined for custom mode i=
s OK
> here.
>=20
> > > > +     }
> > > > +     return 0;
> > > > +
> > > > +err_remove_groups:
> > > > +     ida_free(&priv->ida, priv->ida_id);
> > > The IDA should be freed even when the class device failed to register=
=2E But
> > > such an IDA
> > > should be a global variable anyway.
> > >=20
> > Acked
> >=20
> > > > +     while (i-- >=3D 0) {
> > > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > > +                                capdata01_attr_groups[i].attr_grou=
p);
> > > > +     }
> > > > +     kset_unregister(priv->fw_attr_kset);
> > > > +
> > > > +err_destroy_classdev:
> > > > +     device_unregister(priv->fw_attr_dev);
> > > > +     return err;
> > > > +}
> > > > +
> > > > +/*
> > > > + * lwmi_om_fw_attr_remove() - Unregisters all capdata01_attr_group=
s[]
> > > > attributes as
> > > > + * firmware_attributes_class members.
> > > > + * @priv: The Other Mode driver data.
> > > > + *
> > > > + */
> > > > +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> > > > +{
> > > > +     int size =3D ARRAY_SIZE(capdata01_attr_groups);
> > > > +
> > > > +     while (--size >=3D 0) {
> > > Please use a for-loop here.
> > >=20
> > Ilpo and you conflict on this. He wants an unsigned int here and no >=
=3D
> > 0. Please advise on the way ahead.
>=20
> I suggest you use a for-loop with an unsigned int counter variable here:
>=20
> =09for (unsigned int i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups); i++)=
 {
> =09=09/* Unregister each group */
> =09}

I'm sorry, as I was going throughb the patch, I thought it was just=20
another instance of the within function rollback pattern.

Armin is right here, for loop is the way to go.

--
 i.
--8323328-288598994-1743678349=:1302--
