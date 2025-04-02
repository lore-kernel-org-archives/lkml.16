Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E71F4615;
	Wed,  2 Apr 2025 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628990; cv=none; b=WnylbrQvO79wBDUSD6CpdtqLkRO4TSK7jplpsQF0kTjUlEqCQZrKJSMu521ek4yP5QAVpPzN0NquBqpZe4FVQ8N1bTKtwlWOcfxS//4yMkJBRgsKmCsUsZzK2B4s5F239KVmZsyKo9Sl913QXnT3pvzf8/Tu9YG6Ehk3PCSWyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628990; c=relaxed/simple;
	bh=USPszIbjDxO1dJe5iYmZLUkpeCVRqcmtB7IeB/83cZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=do+brH/W3XvzqEsNYYDXboIwr1FXbqA6oKI9dCptYvPQSDIKZfwIDcTD1ANm6SfLCe5JmbJkAES7ZnOP9XGNiwcoQjsVOpD5DFn1v/Qh7Wo4uiTEPgC/ueykBYhV16WcpfVgUXBcxCa2vnZwtj4bGG8ZcRK2I+J1en+kJhrnq+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF81jaLa; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF81jaLa"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so13328166d6.0;
        Wed, 02 Apr 2025 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628987; x=1744233787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PbqBLiTpfg0zQo6DCVh/r3XgspxQZ6WqPoF3A2qSJI=;
        b=eF81jaLaSSJPggIfIdf4ux1K5A3U2Ms6wnVyYNtR3Ztl7QWqTJxYwpollVTTslNh58
         d173Ld28oAVrXIuXQ+F2evC3UoRVJ8ZPF961DTBt0zT08/YbQIwku4Pzn/95RlBhMD+/
         Ip9d9DJFolWmCI+WTkepSs5upCkGeW5ukwVI3Bh8DETRfIrgGDXCCfIHxQor6RIJjrzT
         4jZgW4lHj8ZaRvADMMd4Io/MkrRUAEUqJZb+ORK5bQvARx1vs8Noj9YYgPHmp6ys5tn9
         zrg+jJ893DmgskE2K3+HBSrMId32c+jpQOxyCF23T9wMBc0HgCLHxrDhI32XBoM1wwmF
         VBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628987; x=1744233787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PbqBLiTpfg0zQo6DCVh/r3XgspxQZ6WqPoF3A2qSJI=;
        b=u/1ZTcCJgiJveyxp5mgB2oKyhWgqmOgte1dSnrk1e5xiPXRgKeeaUbKSlCd4waSR8d
         wiEJUwD2Zp1g26BCp6Oe0d11/y8R1DJDgqB1H7M5b48wKWE1l11Tl1bXi7/mNDq9iksd
         JUNJJCt6Sm0E0QSZw4pniHY0YxXCJg61OwQd3I9q0H+dTtZbMK+TCno0wk8SISAacAMJ
         GYxz2wxhwN46u/HC3QWkbqyq4HaPcONwTS2wx5en5d1sMZuJoIWisvLqNkUxMpyztEka
         wC6KPj3xoYlR1ff8WakzhhEbVwVc8Itp+9IJIYVHLpbfuzRDxlkasDNxgN9QMYP66Tpc
         MQyg==
X-Forwarded-Encrypted: i=1; AJvYcCU0aqPTWioYZK4gmUhCV4tM05TAwAZPJYR2kQG0C0cFM2rp3HbddKjfSKXpHOkmYJPT7O9J+y8UrSvve6cSvvleBwlp5A==@vger.kernel.org, AJvYcCXJHK6gMhM2mbDRArpTKoNpZF0cvaq/W8JWk+OvGbBrP1JAhHx88jxDKFigPHbotOXJlEbUQvZwP3QG518c@vger.kernel.org, AJvYcCXuGYkXEIrE75PTIZT83w63r0fS0A+VgyOWgdnl1E7q4YjeABQozsBp8z9nsiLbya5M6947uw/FHnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1+BeHoEvH0pfScIY15gNOUV+QWuG1MjEc+SBClkaq066YoXe
	XEHVrktreMkP5JuaIZ70Ey/zOqlxEgLSWaGh/cnoXvGXLPphCFxRKIQyzefgisFcE9oQn8vbKjT
	b8J5q5fIK++vLaP6iYgSJeRbdhAY=
X-Gm-Gg: ASbGncsXtcfKnKpx0pTayGK69G/whmwm3G0rWOVMjVdjPEWSvPfnNf0KL6WWHc0J12a
	vFRE8jXPgALMNh5CBf7r3ALIyP6VR0TtL8bmzty2JjpYZEjOpzm6ur+rLqb/DvqwYsXvzKNwOuo
	U83nx1VIIXdKmaURMBY+lHGwZkqeq49kXN1i6gHw==
X-Google-Smtp-Source: AGHT+IHzKd52aMiWl+VNS5Jtu3Jes+t7A/yCjKLJFE0TdmHsmkJxJ4Qa1pHXuMPbgrmythfCcQSi4s8V4eLd7yn/lac=
X-Received: by 2002:a05:6214:1c49:b0:6ea:fac1:ef19 with SMTP id
 6a1803df08f44-6ef0bf9c430mr15427996d6.15.1743628986879; Wed, 02 Apr 2025
 14:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-6-derekjohn.clark@gmail.com> <86ccabd2-44e9-d654-d4f2-0f175e9a9e31@linux.intel.com>
In-Reply-To: <86ccabd2-44e9-d654-d4f2-0f175e9a9e31@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 14:22:55 -0700
X-Gm-Features: AQ5f1JoumXPp2JboIbdLE41iEcgnuhOrRC_QdaAdt34jgCv6fOrQJAt-aY0eTq8
Message-ID: <CAFqHKT=ca+b6+DjV8fWMFix6P89k1t3jJhwTr7R3Nh=zNDVxrA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6 RESEND] platform/x86: Add Lenovo Other Mode WMI Driver
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

On Thu, Mar 27, 2025 at 6:49=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 17 Mar 2025, Derek J. Clark wrote:
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
> >  MAINTAINERS                             |   2 +
> >  drivers/platform/x86/Kconfig            |  15 +
> >  drivers/platform/x86/Makefile           |   1 +
> >  drivers/platform/x86/lenovo-wmi-other.c | 626 ++++++++++++++++++++++++
> >  drivers/platform/x86/lenovo-wmi-other.h |  19 +
> >  5 files changed, 663 insertions(+)
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 56ead241a053..87daee6075ad 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13170,6 +13170,8 @@ F:    drivers/platform/x86/lenovo-wmi-events.c
> >  F:   drivers/platform/x86/lenovo-wmi-events.h
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.h
> > +F:   drivers/platform/x86/lenovo-wmi-other.c
> > +F:   drivers/platform/x86/lenovo-wmi-other.h
> >
> >  LENOVO WMI HOTKEY UTILITIES DRIVER
> >  M:   Jackie Dong <xy-jackie@139.com>
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 64663667f0cb..fc47604e37f7 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -471,6 +471,21 @@ config LENOVO_WMI_DATA01
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
> > index 7a35c77221b7..c6ce3c8594b1 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -72,6 +72,7 @@ obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-c=
amera.o
> >  obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
> > +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
> >
> >  # Intel
> >  obj-y                                +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform=
/x86/lenovo-wmi-other.c
> > new file mode 100644
> > index 000000000000..b517e45338e0
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-other.c
> > @@ -0,0 +1,626 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo Other Mode WMI interface driver. This driver uses the fw_att=
ributes
>
> Again, put a summary on own line as mentioned for the other files.
>
> > + * class to expose the various WMI functions provided by the "Other Mo=
de" WMI
> > + * interface. This enables CPU and GPU power limit as well as various =
other
> > + * attributes for devices that fall under the "Gaming Series" of Lenov=
o laptop
> > + * devices. Each attribute exposed by the "Other Mode"" interface has =
a
> > + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the driv=
er to
> > + * probe details about the attribute such as set/get support, step, mi=
n, max,
> > + * and default value. Each attibute has multiple pages, one for each o=
f the
> > + * fan profiles managed by the Gamezone interface.
> > + *
> > + * These attributes typically don't fit anywhere else in the sysfs and=
 are set
> > + * in Windows using one of Lenovo's multiple user applications.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/component.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/gfp_types.h>
> > +#include <linux/idr.h>
> > +#include <linux/kobject.h>
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
> > +/* Interface GUIDs */
> > +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B=
"
> > +
> > +/* Device IDs */
> > +#define WMI_DEVICE_ID_CPU 0x01
>
> Two comments above add no value and can be dropped.
>
> > +
> > +/* WMI_DEVICE_ID_CPU feature IDs */
> > +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
> > +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
> > +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
> > +
> > +/* Type IDs*/
>
> This is missing space but it doesn't IMO add any value, so just drop it.
>

Acked

> > +#define WMI_TYPE_ID_NONE 0x00
> > +
> > +/* Method IDs */
> > +#define WMI_FEATURE_VALUE_GET 17 /* Other Mode Getter */
> > +#define WMI_FEATURE_VALUE_SET 18 /* Other Mode Setter */
> > +
> > +/* Attribute ID bitmasks */
>
> Neither of two comments for the defines seem to provide much value.
>

Acked

> > +#define ATTR_DEV_ID_MASK GENMASK(31, 24)
> > +#define ATTR_FEAT_ID_MASK GENMASK(23, 16)
> > +#define ATTR_MODE_ID_MASK GENMASK(15, 8)
> > +#define ATTR_TYPE_ID_MASK GENMASK(7, 0)
>
> Please align the GENMASK()s
>

Acked
> > +static BLOCKING_NOTIFIER_HEAD(om_chain_head);
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
> > +     struct blocking_notifier_head nhead;
> > +     struct component_master_ops *ops;
> > +     struct cd01_list cd01_list;
> > +     struct device *fw_attr_dev;
> > +     struct kset *fw_attr_kset;
> > +     struct notifier_block nb;
> > +     struct wmi_device *wdev;
> > +     struct ida ida;
> > +     int ida_id;
> > +};
> > +
> > +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
> > +struct tunable_attr_01 {
> > +     u32 type_id;
> > +     u32 device_id;
> > +     u32 feature_id;
> > +     u32 store_value;
> > +     struct device *dev;
> > +     struct capdata01 *capdata;
> > +};
> > +
> > +/* Tunable Attributes */
> > +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_ID_=
CPU,
> > +                                    .feature_id =3D WMI_FEATURE_ID_CPU=
_SPL,
> > +                                    .type_id =3D WMI_TYPE_ID_NONE };
> > +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_ID=
_CPU,
> > +                                     .feature_id =3D WMI_FEATURE_ID_CP=
U_SPPT,
> > +                                     .type_id =3D WMI_TYPE_ID_NONE };
> > +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_ID=
_CPU,
> > +                                     .feature_id =3D WMI_FEATURE_ID_CP=
U_FPPT,
> > +                                     .type_id =3D WMI_TYPE_ID_NONE };
> > +
> > +struct capdata01_attr_group {
> > +     const struct attribute_group *attr_group;
> > +     struct tunable_attr_01 *tunable_attr;
> > +};
> > +
> > +#define FW_ATTR_FOLDER "lenovo-wmi-other"
>
> Please add prefix and move to the top where the other defines are.
>

What do you mean by prefix?

> > +
> > +/* Notifier Methods */
> > +int lwmi_om_register_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_register(&om_chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
> > +
> > +int lwmi_om_unregister_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_unregister(&om_chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
> > +
> > +static void devm_lwmi_om_unregister_notifier(void *data)
> > +{
> > +     struct notifier_block *nb =3D data;
> > +
> > +     lwmi_om_unregister_notifier(nb);
> > +}
> > +
> > +int devm_lwmi_om_register_notifier(struct device *dev,
> > +                                struct notifier_block *nb)
>
> I'd just put this on a single line.
>

Acked, as well as for similar instances

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
>
> 80 chars isn't a hard rule so this and a few other ones could be put
> to a single line.
>
> > +}
> > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER=
");
> > +
> > +static int lwmi_om_notifier_call(enum thermal_mode *mode)
> > +{
> > +     int ret;
> > +
> > +     ret =3D blocking_notifier_call_chain(&om_chain_head, THERMAL_MODE=
_EVENT,
> > +                                        mode);
>
> To one line?
>
> > +
>
> Please don't leave empty line between the func call and it's error
> handling.
>

Acked

> > +     if (ret !=3D NOTIFY_OK)
> > +             return -EINVAL;
> > +
> > +     if (*mode < SMARTFAN_MODE_QUIET || *mode > SMARTFAN_MODE_CUSTOM)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +/* Attribute Methods */
> > +/*
> > + * int_type_show() - Emit the data type for an integer attribute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + *
> > + * Returns: Number of characters written to buf.
>
> Return:
>
> > + */
> > +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribu=
te *kattr,
> > +                          char *buf)
> > +{
> > +     return sysfs_emit(buf, "integer\n");
> > +}
> > +
> > +/*
> > + * attr_capdata01_get - Get the data of the specified attribute
> > + * from lwmi_om->cd01.
>
> "from lwmi_om->cd01" sounds a bit cryptic.
>

I'll elaborate.

> > + * @tunable_attr: The attribute to be populated.
> > + *
> > + * Returns: Either a pointer to capability data, or NULL.
>
> Return:
>
> > + */
> > +static struct capdata01 *
> > +attr_capdata01_get_data(struct lwmi_om_priv *priv,
> > +                     struct tunable_attr_01 *tunable_attr,
> > +                     enum thermal_mode mode)
> > +{
> > +     u32 attribute_id =3D
> > +             FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> > +             FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> > +             FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > +             FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> > +     int idx;
> > +
> > +     for (idx =3D 0; idx < priv->cd01_list.count; idx++) {
> > +             if (!priv->cd01_list.data[idx])
> > +                     continue;
> > +
> > +             if (priv->cd01_list.data[idx]->id !=3D attribute_id)
> > +                     continue;
> > +             return priv->cd01_list.data[idx];
> > +     }
> > +     return NULL;
> > +}
> > +
> > +/**
> > + * attr_capdata01_show() - Get the value of the specified attribute pr=
operty
> > + * from LENOVO_CAPABILITY_DATA_01.
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + * @prop: The property of this attribute to be read.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y "_show"
> > + * attribute which works only with integers.
> > + *
> > + * If the WMI is success, then the sysfs attribute is notified.
> > + *
> > + * Returns: Either number of characters written to buf, or an error.
> > + */
> > +static ssize_t attr_capdata01_show(struct kobject *kobj,
> > +                                struct kobj_attribute *kattr, char *bu=
f,
> > +                                struct tunable_attr_01 *tunable_attr,
> > +                                enum attribute_property prop)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > +     struct capdata01 *capdata;
> > +     int value;
> > +
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     capdata =3D attr_capdata01_get_data(priv, tunable_attr,
> > +                                       SMARTFAN_MODE_CUSTOM);
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
> > +/* Simple attribute creation */
> > +
> > +/*
> > + * att_current_value_store() - Set the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to read from, this is parsed to `int` type.
> > + * @count: Required by sysfs attribute macros, pass in from the callee=
 attr.
> > + * @tunable_attr: The attribute to be stored.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y
> > + * attribute's "current_value_store" which works only with integers. T=
he
> > + * integer to be sent to the WMI method is range checked and an error =
returned
> > + * if out of range.
> > + *
> > + * If the value is valid and WMI is success, then the sysfs attribute =
is
> > + * notified.
> > + *
> > + * Returns: Either count, or an error.
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
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     err =3D lwmi_om_notifier_call(&mode);
> > +     if (err)
> > +             return err;
> > +
> > +     if (mode !=3D SMARTFAN_MODE_CUSTOM)
> > +             return -EINVAL;
> > +
> > +     capdata =3D attr_capdata01_get_data(priv, tunable_attr, mode);
> > +
> > +     if (!capdata)
> > +             return -ENODEV;
> > +
> > +     attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
> > +                    FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->featur=
e_id) |
> > +                    FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > +                    FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_i=
d);
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
> > +     err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0, WMI_FEATURE_VAL=
UE_SET,
> > +                                    (unsigned char *)&args, sizeof(arg=
s),
> > +                                    NULL);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     tunable_attr->store_value =3D value;
> > +     return count;
> > +};
> > +
> > +/*
> > + * attr_current_value_show() - Get the current value of the given attr=
ibute
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to write to.
> > + * @tunable_attr: The attribute to be read.
> > + *
> > + * This function is intended to be generic so it can be called from an=
y "_show"
> > + * attribute which works only with integers.
> > + *
> > + * If the WMI is success, then the sysfs attribute is notified.
> > + *
> > + * Returns: Either number of characters written to buf, or an error.
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
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     err =3D lwmi_om_notifier_call(&mode);
> > +     if (err)
> > +             return err;
> > +
> > +     attribute_id =3D FIELD_PREP(ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
> > +                    FIELD_PREP(ATTR_FEAT_ID_MASK, tunable_attr->featur=
e_id) |
> > +                    FIELD_PREP(ATTR_MODE_ID_MASK, mode) |
> > +                    FIELD_PREP(ATTR_TYPE_ID_MASK, tunable_attr->type_i=
d);
> > +
> > +     args.arg0 =3D attribute_id;
> > +
> > +     err =3D lwmi_dev_evaluate_method(priv->wdev, 0x0, WMI_FEATURE_VAL=
UE_GET,
> > +                                    (unsigned char *)&args, sizeof(arg=
s),
> > +                                    &retval);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return sysfs_emit(buf, "%d\n", retval);
> > +}
> > +
> > +/* Attribute macros */
> > +#define __LL_ATTR_RO(_func, _name)                                    =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _func##_##_name##_show,                       \
> > +     }
> > +
> > +#define __LL_ATTR_RO_AS(_name, _show)                                 =
\
> > +     {                                                             \
> > +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 =
}, \
> > +             .show =3D _show,                                        \
> > +     }
> > +
> > +#define __LL_ATTR_RW(_func, _name) \
> > +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_sto=
re)
> > +
> > +/* Shows a formatted static variable */
> > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                 =
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
> > +             __LL_ATTR_RO(_attrname, _prop)
> > +
> > +/* Attribute current value read/write */
> > +#define __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                   =
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
> > +             __LL_ATTR_RW(_attrname, current_value)
> > +
> > +/* Attribute property read only */
> > +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)           =
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
> > +             __LL_ATTR_RO(_attrname, _prop)
> > +
> > +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)    =
 \
> > +     __LL_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                   \
> > +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
> > +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
> > +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
> > +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
> > +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
> > +     static struct kobj_attribute attr_##_attrname##_type =3D         =
\
> > +             __LL_ATTR_RO_AS(type, int_type_show);                  \
> > +     static struct attribute *_attrname##_attrs[] =3D {               =
\
> > +             &attr_##_attrname##_current_value.attr,                \
> > +             &attr_##_attrname##_default_value.attr,                \
> > +             &attr_##_attrname##_display_name.attr,                 \
> > +             &attr_##_attrname##_max_value.attr,                    \
> > +             &attr_##_attrname##_min_value.attr,                    \
> > +             &attr_##_attrname##_scalar_increment.attr,             \
> > +             &attr_##_attrname##_type.attr,                         \
> > +             NULL,                                                  \
> > +     };                                                             \
> > +     static const struct attribute_group _attrname##_attr_group =3D { =
\
> > +             .name =3D _fsname, .attrs =3D _attrname##_attrs          =
  \
> > +     }
> > +
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> > +                         "Set the CPU sustained power limit");
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> > +                         "Set the CPU slow package power tracking limi=
t");
> > +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> > +                         "Set the CPU fast package power tracking limi=
t");
> > +
> > +static struct capdata01_attr_group capdata01_attr_groups[] =3D {
> > +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > +     {},
> > +};
> > +
> > +/*
> > + * lwmi_om_fw_attr_add() - Registers all capdata01_attr_groups[] attri=
butes as
> > + * firmware_attributes_class members.
>
> Why this cannot simply be:
>
> Register all firmware_attributes_class members
>
> ?

Sure

> > + * @priv: The Other Mode driver data.
>
> IMO, if you want to go to specific details such as mentioning the variabl=
e
> name you can add the description here and write the longer explanation
> (but in this case I'm not sure if it's worth the effort really).
>
> > + * Returns: Either 0, or an error.
>
> Return:
>
> > + */
> > +static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
> > +{
> > +     int err, i;
> > +
> > +     ida_init(&priv->ida);
> > +     priv->ida_id =3D ida_alloc(&priv->ida, GFP_KERNEL);
> > +     if (priv->ida_id < 0)
> > +             return priv->ida_id;
> > +
> > +     priv->fw_attr_dev =3D device_create(&firmware_attributes_class, N=
ULL,
> > +                                       MKDEV(0, 0), NULL, "%s",
> > +                                       FW_ATTR_FOLDER);
> > +     if (IS_ERR(priv->fw_attr_dev)) {
> > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > +             return err;
>
> Leaks the allocated ida?
>

Will fix.

> > +     }
> > +
> > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
> > +                                              &priv->fw_attr_dev->kobj=
);
> > +     if (!priv->fw_attr_kset) {
> > +             err =3D -ENOMEM;
> > +             goto err_destroy_classdev;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
>
> Change i to unsigned when used in loops like this.
>
> > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > +                                      capdata01_attr_groups[i].attr_gr=
oup);
> > +             if (err) {
> > +                     pr_debug("Failed to create sysfs-group for %s: %d=
\n",
> > +                              capdata01_attr_groups[i].attr_group->nam=
e,
> > +                              err);
> > +                     goto err_remove_groups;
> > +             }
> > +             capdata01_attr_groups[i].tunable_attr->dev =3D &priv->wde=
v->dev;
> > +     }
> > +     return 0;
> > +
> > +err_remove_groups:
> > +     ida_free(&priv->ida, priv->ida_id);
> > +     while (i-- >=3D 0) {
>
> >=3D 0 is not necessary.
>

I suppose with an unsigned int it will never go below 0, so that's fine.
FYI this was discussed at length in the last version and added at
Mario's request.

From Mario in that series:
> Well what you've got right now is an unwind routine where if you say
> have 5 attributes and the 5th (0-indexed so "4th") fails, you try to
> free 3rd, 2nd, 1st.
>
> The only problem is the boundary doesn't free the 0th index attribute.
>
> I think that just changing the loop to (i-- >=3D 0) would solve it.

> > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > +                                capdata01_attr_groups[i].attr_group);
> > +     }
> > +     kset_unregister(priv->fw_attr_kset);
> > +
> > +err_destroy_classdev:
> > +     device_unregister(priv->fw_attr_dev);
> > +     return err;
> > +}
> > +
> > +/*
> > + * lwmi_om_fw_attr_remove() - Unregisters all capdata01_attr_groups[] =
attributes as
> > + * firmware_attributes_class members.
> > + * @priv: The Other Mode driver data.
> > + *
> > + */
> > +static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
> > +{
> > +     int size =3D ARRAY_SIZE(capdata01_attr_groups);
>
> unsigned int i =3D ARRAY_SIZE(capdata01_attr_groups) - 1;
>
> > +
> > +     while (--size >=3D 0) {
>
> while (i--) {
>

Acked

> > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > +                                capdata01_attr_groups[size].attr_group=
);
> > +     }
> > +     kset_unregister(priv->fw_attr_kset);
> > +     device_unregister(priv->fw_attr_dev);
> > +}
> > +
> > +static int lwmi_om_master_bind(struct device *dev)
> > +{
> > +     struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D component_bind_all(dev, &priv->cd01_list);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return lwmi_om_fw_attr_add(priv);
> > +}
> > +
> > +static void lwmi_om_master_unbind(struct device *dev)
> > +{
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
> > +     lwmi_om_fw_attr_remove(priv);
> > +     ida_free(&priv->ida, priv->ida_id);
> > +}
> > +
> > +static const struct wmi_device_id lwmi_other_id_table[] =3D {
> > +     { LENOVO_OTHER_METHOD_GUID, NULL },
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
> > index 000000000000..9fba35ef1137
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-other.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
> > + */
> > +
> > +#ifndef _LENOVO_WMI_OTHER_H_
> > +#define _LENOVO_WMI_OTHER_H_
> > +
> > +#include <linux/device.h>
> > +#include <linux/notifier.h>
> > +#include <linux/types.h>
>
> Replace with struct forward declarations.
>
> > +
> > +int lwmi_om_register_notifier(struct notifier_block *nb);
> > +int lwmi_om_unregister_notifier(struct notifier_block *nb);
> > +int devm_lwmi_om_register_notifier(struct device *dev,
> > +                                struct notifier_block *nb);
> > +
> > +#endif /* !_LENOVO_WMI_H_ */
> >
>
> --
>  i.
>
