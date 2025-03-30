Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C794C81;
	Sun, 30 Mar 2025 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743310546; cv=none; b=UNC6wxKNMJOtHhhv028+I8nr7/HD1P5d91XdmvLvvsaw9yDDXK7GbUhUyRb00zQDvI2kluwdgfV6Vdz0Ka6IKXW+KG7CfU7/txg+d9KSfeV2E6LwW+mRc51Ljtug8R80jhUmx1B1PH8dD4VKqBDU1Y0mNSm6L3H9sL5Uw4R5PFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743310546; c=relaxed/simple;
	bh=iHNhhLgV9c0suOBIDZFBbuKcwm5QJ06rRjXcgHXHoqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSeZsxHTqCxTrLCM35NDWKKfB2FZiaAm2NuDKo7dvQgZtHAx1CkqeXdoiEY6AqnbuYWII/m8VRTmByfpFraqUWuL+Dg+IruiVxyFNFrUxEtBBP5Dz48bJRuM7gobHsWLv0m7qOg75R51b7q8fYEpV/liNNguxKu0Pu9WsI8+ymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvQhpS3S; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvQhpS3S"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e900a7ce55so52015256d6.3;
        Sat, 29 Mar 2025 21:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743310543; x=1743915343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tiv7U3ES2A2dQ3siSQZlJiuYcXlsnG4CQZmWSavD34=;
        b=OvQhpS3SdsQRErVIEWFLplYwC99ebNduTjeyqluhYS2TW8XDpl/Q1h4z5cjB3LyT5N
         aOa9EemUOw6rr1EKuazpBJb6kXz2sEto169yOUjaJ8tdwGRqMU+FEymyL4A/Fxr0wpzu
         e/ZjaPUnBRoc5sCYdXIzWFukedovcAO9GPJGNdSX5ngm4Bb2CCyiEmSeNOACa3gTQWxW
         67M/qPR0/XOFspgGLhjAHX76H4QKhwHOzTEfgYSAOje4mTOO/OHDLROax5urtji0lE0L
         KsmnXxqm+TAHuvcQDpnxm9kKLLzo1ciDPfQHx23ufOmnaKZouSO50ayHPhHDBqxgW24Z
         tYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743310543; x=1743915343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tiv7U3ES2A2dQ3siSQZlJiuYcXlsnG4CQZmWSavD34=;
        b=AHxgdDkJNct4JogHDucm13qybaqTDf1Y1Kw6pzA7fR39SobYR+/w241mdsyv7fRF4+
         YmIwjtJznMXs60QyLj0DBjEKnmxl/H6l4BUhIKDSrZ+koC3h4+4LF6sYu9+ViJjK7Yi9
         xZmcA+5Ew29nuxHNGTj+KexaXNFrqs/zbiLUPxPHSHIPooCpSGxrNgFPQxb6CB8ldzbi
         gOIpEuaLkSYOuRqChIOw9Rc29LvOumy6oG6fix74jZ3RTqdoWhfgZe1mMLxhGX79d3CX
         kK6QsvnY6C3FpVnHO5ADLuFNGwfelQ/GtRHGA8Q9YLmeBXqBL4ZjFyrHKP7m4ZnOaAzh
         52dA==
X-Forwarded-Encrypted: i=1; AJvYcCU2M12xgigVXvcdRply/k4bcVaU42OsDilPh7BM4Pt8ULTYWmXxjf4yF/wd/8dSyM7oprrCci6QOMgvgtIa@vger.kernel.org, AJvYcCW+gjK90H/iq020HxxQlwtg/0JXqlMXKe0iGckxriq1IkT6zGYQoqsSxqKKGpbSr9NsK4alPrDxWdg=@vger.kernel.org, AJvYcCWUDcrJ0YXIjAHzptMy5tSWneHAiq6/1MCps+BSqO1SCCjQEJKuu7Hb4Em6Yxzf6afTGZAlZDstHsMHgvDYdmyT7DVajQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbkTSjjAa4fed4GK10oZ5+lK1IJw4oFVD8nm26mbRlMG2v+guc
	48Ud5Sk08A2z9ql5hJ2940bcbwEcebZEZmk6PzyI3dFBwKUr6I694bxRHzV9YkUJc3fsmKo/uGP
	NNAcsFKUXyV7yOUcPudkByEW7mww=
X-Gm-Gg: ASbGncsPMA9hXB3/37olp3/Lr/GUIoqoi8+J5kgF4CDrX+uPdwUs5LMOosPzmL/Vv+D
	20euCEGQQSpjNdbtFadimdbWSsyYlnh3S7BTHhNFfoh0LgrXjvhyF/4Y9FJZ2oTguWXl4Aeiy8r
	HzRiQcjgexehXcDvgu6dMgpkSojMY=
X-Google-Smtp-Source: AGHT+IFRlosetsiBQ+NDocMD6P5Bfl0TKw2+RYg4lM2IqFdFx+ifsKI1blWXACqANr8vSKVW75jQDdQWxZg2BNOlY2k=
X-Received: by 2002:ad4:5b8d:0:b0:6e8:f99c:7939 with SMTP id
 6a1803df08f44-6eed626cf99mr54524146d6.44.1743310543352; Sat, 29 Mar 2025
 21:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-4-derekjohn.clark@gmail.com> <cf6be9ba-03e4-4d9d-9f62-91cd11e6ee30@gmx.de>
In-Reply-To: <cf6be9ba-03e4-4d9d-9f62-91cd11e6ee30@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 29 Mar 2025 21:55:32 -0700
X-Gm-Features: AQ5f1JoLNjPPBNknpi2BoHvAIvQ0ZaCtJj9_9M-X30NsEw2M4bfzfjoMBrq8pD4
Message-ID: <CAFqHKT=gcOrFtjjOCYbW4Grs8P9Zn26Suii7PRcZLR-LJ4a8bw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6 RESEND] platform/x86: Add Lenovo WMI Events Driver
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

On Wed, Mar 26, 2025 at 6:04=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>
> > Adds lenovo-wmi-events driver. The events driver is designed as a
> > general entrypoint for all Lenovo WMI Events. It acts as a notification
> > chain head that will process event data and pass it on to registered
> > drivers so they can react to the events.
> >
> > Currently only the Gamezone interface Thermal Mode Event GUID is
> > implemented in this driver. It is documented in the Gamezone
> > documentation.
> >
> > Suggested-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >   - Remove the Thermal Mode Event GUID from Gamezone and add this drive=
r.
> > ---
> >   MAINTAINERS                              |   2 +
> >   drivers/platform/x86/Kconfig             |   4 +
> >   drivers/platform/x86/Makefile            |   1 +
> >   drivers/platform/x86/lenovo-wmi-events.c | 132 ++++++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi-events.h |  21 ++++
> >   5 files changed, 160 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a370a18b806..6dde75922aaf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> >   S:  Maintained
> >   F:  Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >   F:  Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:   drivers/platform/x86/lenovo-wmi-events.c
> > +F:   drivers/platform/x86/lenovo-wmi-events.h
> >   F:  drivers/platform/x86/lenovo-wmi-helpers.c
> >   F:  drivers/platform/x86/lenovo-wmi-helpers.h
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index bece1ba61417..13b8f4ac5dc5 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -459,6 +459,10 @@ config IBM_RTL
> >        state =3D 0 (BIOS SMIs on)
> >        state =3D 1 (BIOS SMIs off)
> >
> > +config LENOVO_WMI_EVENTS
> > +     tristate
> > +     depends on ACPI_WMI
> > +
> >   config LENOVO_WMI_HELPERS
> >       tristate
> >       depends on ACPI_WMI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index 5a9f4e94f78b..fc039839286a 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >   obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
> >   obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> >   obj-$(CONFIG_LENOVO_WMI_HELPERS)    +=3D lenovo-wmi-helpers.o
> >
> >   # Intel
> > diff --git a/drivers/platform/x86/lenovo-wmi-events.c b/drivers/platfor=
m/x86/lenovo-wmi-events.c
> > new file mode 100644
> > index 000000000000..3ea0face3c0d
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-events.c
> > @@ -0,0 +1,132 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo WMI Events driver. Lenovo WMI interfaces provide various
> > + * hardware triggered events that many drivers need to have propagated=
.
> > + * This driver provides a uniform entrypoint for these events so that
> > + * any driver that needs to respond to these events can subscribe to a
> > + * notifier chain.
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/list.h>
> > +#include <linux/notifier.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +#include "lenovo-wmi-events.h"
>
> Hi,
>
> please also include linux/acpi.h, linux/export.h and linux/module.h. Also=
 why do you import
> linux/list.h?
>
> > +
> > +/* Interface GUIDs */
> > +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
> > +
> > +#define LENOVO_WMI_EVENT_DEVICE(guid, type)                        \
> > +     .guid_string =3D (guid), .context =3D &(enum lwmi_events_type) \
> > +     {                                                          \
> > +             type                                               \
> > +     }
> > +
> > +static BLOCKING_NOTIFIER_HEAD(events_chain_head);
> > +
> > +struct lwmi_events_priv {
> > +     struct wmi_device *wdev;
> > +     enum lwmi_events_type type;
> > +};
> > +
> > +/* Notifier Methods */
> > +int lwmi_events_register_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_register(&events_chain_head, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS=
");
> > +
> > +int lwmi_events_unregister_notifier(struct notifier_block *nb)
> > +{
> > +     return blocking_notifier_chain_unregister(&events_chain_head, nb)=
;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVEN=
TS");
> > +
> > +static void devm_lwmi_events_unregister_notifier(void *data)
> > +{
> > +     struct notifier_block *nb =3D data;
> > +
> > +     lwmi_events_unregister_notifier(nb);
> > +}
> > +
> > +int devm_lwmi_events_register_notifier(struct device *dev,
> > +                                    struct notifier_block *nb)
> > +{
> > +     int ret;
> > +
> > +     ret =3D lwmi_events_register_notifier(nb);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return devm_add_action_or_reset(dev,
> > +                             devm_lwmi_events_unregister_notifier, nb)=
;
>
> Please remove this line break here.
>
> > +}
> > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_E=
VENTS");
> > +
> > +/* Driver Methods */
> > +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_obj=
ect *obj)
> > +{
> > +     struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > +     int sel_prof;
> > +     int ret;
> > +
> > +     switch (priv->type) {
> > +     case THERMAL_MODE_EVENT:
> > +             if (obj->type !=3D ACPI_TYPE_INTEGER)
> > +                     return;
> > +
> > +             sel_prof =3D obj->integer.value;
> > +             ret =3D blocking_notifier_call_chain(&events_chain_head,
> > +                                                THERMAL_MODE_EVENT, &s=
el_prof);
> > +             if (ret =3D=3D NOTIFY_BAD)
> > +                     dev_err(&wdev->dev,
> > +                             "Failed to send notification to call chai=
n for WMI Events\n");
> > +             break;
> > +     default:
> > +             return;
> > +     }
> > +}
> > +
> > +static int lwmi_events_probe(struct wmi_device *wdev, const void *cont=
ext)
> > +{
> > +     struct lwmi_events_priv *priv;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     if (!context)
> > +             return -EINVAL;
> > +
> > +     priv->wdev =3D wdev;
> > +     priv->type =3D *(enum lwmi_events_type *)context;
> > +
> > +     dev_set_drvdata(&wdev->dev, priv);
> > +     return 0;
> > +}
> > +
> > +static const struct wmi_device_id lwmi_events_id_table[] =3D {
> > +     { LENOVO_WMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID,
> > +                               THERMAL_MODE_EVENT) },
> > +     {}
> > +};
> > +
> > +static struct wmi_driver lwmi_events_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "lenovo_wmi_events",
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +     },
> > +     .id_table =3D lwmi_events_id_table,
> > +     .probe =3D lwmi_events_probe,
> > +     .notify =3D lwmi_events_notify,
> > +     .no_singleton =3D true,
> > +};
> > +
> > +module_wmi_driver(lwmi_events_driver);
> > +
> > +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platfor=
m/x86/lenovo-wmi-events.h
> > new file mode 100644
> > index 000000000000..a3fa934eaa10
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-events.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
>
> The SPDX license identifier needs to be a separate comment.
>
> With those minor issues being fixed:
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>

Will fix, thanks,
Derek

> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/notifier.h>
> > +#include <linux/types.h>
> > +
> > +#ifndef _LENOVO_WMI_EVENTS_H_
> > +#define _LENOVO_WMI_EVENTS_H_
> > +
> > +enum lwmi_events_type {
> > +     THERMAL_MODE_EVENT =3D 1,
> > +};
> > +
> > +int lwmi_events_register_notifier(struct notifier_block *nb);
> > +int lwmi_events_unregister_notifier(struct notifier_block *nb);
> > +int devm_lwmi_events_register_notifier(struct device *dev,
> > +                                    struct notifier_block *nb);
> > +
> > +#endif /* !_LENOVO_WMI_EVENTS_H_ */
