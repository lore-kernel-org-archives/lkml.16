Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356491F4614;
	Wed,  2 Apr 2025 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628990; cv=none; b=mX/pa57sLQ8u8ToS3/60sGkm3k1TahyHOI5SlkzaGVXJThfDYRRY5qeWMHkV5tj1y09l8iyIUPn4oBbgvXJ80TdI9UDXrBdbtTkqCI5fyn/rHt3QsC65DqB7hSFndFgJC8FUd3rF4aETSexWyNIT7ZUzrxgwYZ78RM6V5Mx743E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628990; c=relaxed/simple;
	bh=mO0sttFfhE9q+C1cWAqkGrRVDXZAXOXcsqQ4xI+SRSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKTm/o6BGJ86JlGRqypytWP1kU7dx2hjLxrq4e5mLyGxx8DYY+l+KBZ2hMCX6yA9UHylxJ+FTgIpX7WNu4sxfmgKxmSRuka+eOyILP/2PkX7Yq3x2Lldzjn8p2DAtU4ydG5ZOcCHEeJna5K9dv5icIs5ZJp6SpLWgwWP2UOyaz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7KCBHM7; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7KCBHM7"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7be49f6b331so17502685a.1;
        Wed, 02 Apr 2025 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628987; x=1744233787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUwP/fo2CPNOp7GbE7QUeVznmKx7N4aQrLH+L3jNIm8=;
        b=Z7KCBHM7WtE9UVwnJzZu95tskBk7QmCiaWsjNHbC9FhXYxP3AWXPs7ybyzBjrspOIx
         XyKFRhUmj4UBl0+INy5e3HorwbjZ62FcRvX0/GZMMvcUS9E/s25Za+nNoTY2b26xAiHf
         5ZE1LxitM0CZld7is/ZknO5giZ53wUEc3iO8u9KUf/hGHiqjaOPwHus4iq1ShJza1007
         O4fpzvWxmrMrRNxsq/EjSKK7D1JlFUuYSIhtvSRiDvX3oD15fnCv8VeShY/WH0buFFzD
         Ngw09YcZJa9t8UXwCnfmFCbRXN4FcKGIIKeFSRSfvwj5IJT87fTO0QD4vMuVMOetONfE
         tNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628987; x=1744233787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUwP/fo2CPNOp7GbE7QUeVznmKx7N4aQrLH+L3jNIm8=;
        b=Ql4/Z3RbGvp+5vSAah5btzklSBG5kOqUzw4Ws9n2mmETVScRnjB5SpHvSkv0RSmJVR
         OBallQklSzQZjTdMNge1oUNrhy2yQXuYlCc4tij408BPmog2pMr+hn76t/dPeLX/5Sy5
         Qo67s4k8p1k2FMMINP+WoBQjd5KHcYKHewTcmt4lBtpSuZHAEiYf7TrwuVYyucPcOaLU
         uDxr02XdoCDal180nVKp/o7rJrYfY0S09oJxlTuJ/REFmJf4AC2HjASKMchzfqcrZh2l
         vCHSGHbeP8Tvmt11iAQovr93SX2hWY1kU5uxdS5F7uLULY20n/rZl0uiKRc3rKG9Id9f
         64ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzrxWQ5QgLoGqcf8JsB0CJs4ZkkVPgO7ef9gNM1md4saGoXPs774g5J9rBo5iSAmsc0Xw166/8ipiFfpgLLz+5i5LIg==@vger.kernel.org, AJvYcCW80J0mFmAoaVvqD3oYo0gnJKEiOY4TodqqsU8+E0L8JIFdo2SwU98IEAHcKct5J7WCd9WN07I/4fYWKxJX@vger.kernel.org, AJvYcCXMhakJuqoH2wDkYmb8J4w+YmeNRPdPu+x1EoNqvlQyn85kIBFdrQ0bYGIoEKMj/bUyXLqTsyGE4lA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5eL7obhY6kBohUNaY1Qnykfq0mbIPq+g3KUbywtjPPd0XGj/
	OpqY6MiOO6VaV2mT2om1O5wrGW6pgcIHOGvSXnSVwz7/IWUTgUOAlkO4I3k2aMV3SohE60M9rQN
	Nul3ePtcs1tuIJ3fvhA7iFC5F/sE=
X-Gm-Gg: ASbGnctUj4hU6+FxsiOgJYmcqTE470ZvPzcnGo1VCQGl7LLGqEcxlsNH3C56Q1j8kwS
	R8Srngt+WMtbZU3BbRlyGSdNiFhi3S16eQkpTzBIgwpIqOZxiZsfAtIvXubhqoEtgjA/lAsJ8CJ
	vheognOGLG1Tus6RVgWdURXk3Blx0=
X-Google-Smtp-Source: AGHT+IHIG6/GwXb45vB9//N6s+cCAE/tqU7B5xls/6rTY87wg1vcdI2gR+D9z7tUqnb3g3mKmDQinXu/RTdLZDOpzhU=
X-Received: by 2002:a05:620a:44d1:b0:7c5:9ac2:2a7a with SMTP id
 af79cd13be357-7c7664e0513mr653005385a.47.1743628986905; Wed, 02 Apr 2025
 14:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-5-derekjohn.clark@gmail.com> <9138d1c8-0713-e28a-3cdf-590b3f4e9449@linux.intel.com>
In-Reply-To: <9138d1c8-0713-e28a-3cdf-590b3f4e9449@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 2 Apr 2025 14:22:53 -0700
X-Gm-Features: AQ5f1JryhzGEYyhyyn7yMwYXos2Xg7KpBkeELtPzDnqaipBa1Tbsce_-zKzhQo8
Message-ID: <CAFqHKTmPChKu935zrHJWX1jF9mMg3kb5GFBQ=ogy66LnO6bfQA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6 RESEND] platform/x86: Add Lenovo Capability Data 01
 WMI Driver
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

On Thu, Mar 27, 2025 at 5:56=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 17 Mar 2025, Derek J. Clark wrote:
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
> >  - Make driver data a private struct, remove references from Other Mode
> >    driver.
> >  - Don't cache data at device initialization. Instead, on component bin=
d,
> >    cache the data on a member variable of the Other Mode driver data
> >    passed as a void pointer.
> >  - Add header file for capdata01 structs.
> >  - Add new struct to pass capdata01 array data and array length to Othe=
r
> >    Mode.
> > v3:
> > - Add as component to lenovo-wmi-other driver.
> > v2:
> > - Use devm_kmalloc to ensure driver can be instanced, remove global
> >   reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
> > - Use list to get the lenovo_wmi_cd01_priv instance in
> >   lenovo_wmi_capdata01_get as none of the data provided by the macros
> >   that will use it can pass a member of the struct for use in
> >   container_of.
> > ---
> >  MAINTAINERS                                 |   2 +
> >  drivers/platform/x86/Kconfig                |   4 +
> >  drivers/platform/x86/Makefile               |   1 +
> >  drivers/platform/x86/lenovo-wmi-capdata01.c | 136 ++++++++++++++++++++
> >  drivers/platform/x86/lenovo-wmi-capdata01.h |  29 +++++
> >  5 files changed, 172 insertions(+)
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
> >  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6dde75922aaf..56ead241a053 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13164,6 +13164,8 @@ L:    platform-driver-x86@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >  F:   Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:   drivers/platform/x86/lenovo-wmi-capdata01.c
> > +F:   drivers/platform/x86/lenovo-wmi-capdata01.h
> >  F:   drivers/platform/x86/lenovo-wmi-events.c
> >  F:   drivers/platform/x86/lenovo-wmi-events.h
> >  F:   drivers/platform/x86/lenovo-wmi-helpers.c
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
> >  config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index fc039839286a..7a35c77221b7 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -69,6 +69,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >  obj-$(CONFIG_YOGABOOK)               +=3D lenovo-yogabook.o
> >  obj-$(CONFIG_YT2_1380)               +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >  obj-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_DATA01)      +=3D lenovo-wmi-capdata01.o
> >  obj-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D lenovo-wmi-events.o
> >  obj-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D lenovo-wmi-helpers.o
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
> > + * LENOVO_CAPABILITY_DATA_01 WMI data block driver.
>
> Add a empty comment line here, you might want to rephrase the opening of
> the paragraph after splitting these apart.
>
> > This interface provides
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
>
> Add an empty line here please.
>
> > +#include "lenovo-wmi-capdata01.h"
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
> > + * lenovo_cd01_component_bind() - On master bind, caches all capabilit=
y data on
> > + * the master device.
>
> Is this "On master bind" something that the caller should be doing? IMO,
> that would belong to description paragraph instead of the function
> summary.
>

Acked

> > + * @cd01_dev: Pointer to the capability data 01 parent device.
> > + * @om_dev: Pointer to the other mode parent device.
> > + * @data: capdata01_list object pointer to return the capability data =
with.
> > + *
> > + * Returns: 0, or an error.
>
> Return:
>
> > + */
> > +static int lenovo_cd01_component_bind(struct device *cd01_dev,
> > +                                   struct device *om_dev, void *data)
> > +{
> > +     struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> > +     int count, idx;
> > +
> > +     if (!priv)
> > +             return -ENODEV;
> > +
> > +     count =3D wmidev_instance_count(priv->wdev);
> > +
> > +     if (count =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     ((struct cd01_list *)data)->count =3D count;
>
> Please create a local variable with the correct type and since data is
> void *, you don't need to cast it while assigning to that local variable.
>

This will be reworked a bit with Armin's suggestions.

> > +     ((struct cd01_list *)data)->data =3D devm_kmalloc_array(om_dev, c=
ount,
> > +                                                           sizeof(stru=
ct capdata01 *),
>
> sizeof() should preferrably take the type directly from ->data (with the
> correct amount of * chars).
>

With Armin's suggestion I'll be using struct_size, but I'll note this
for future reference, thanks.

> > +                                                           GFP_KERNEL)=
;
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     for (idx =3D 0; idx < count; idx++) {
> > +             union acpi_object *ret_obj __free(kfree) =3D NULL;
> > +
> > +             ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > +             if (!ret_obj) {
> > +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
> > +                     continue;
> > +             }
> > +             if (ret_obj->type !=3D ACPI_TYPE_BUFFER) {
> > +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
> > +                     continue;
> > +             }
> > +
> > +             if (ret_obj->buffer.length !=3D sizeof(struct capdata01))=
 {
>
> You could consider joining these 3 if()s with || to avoid having to
> repeat the NULL assignment and continue.
>

devm_kzalloc will take care of the NULL assignment going forward. for
!ret_obj, should I return an error here instead? It seems like a
problem if that fails.

> > +                     ((struct cd01_list *)data)->data[idx] =3D NULL;
> > +                     continue;
> > +             }
> > +
> > +             ((struct cd01_list *)data)->data[idx] =3D
> > +                     devm_kmemdup(om_dev, ret_obj->buffer.pointer,
> > +                                  ret_obj->buffer.length, GFP_KERNEL);
> > +     }
> > +     return 0;
> > +}
> > +
> > +static const struct component_ops lenovo_cd01_component_ops =3D {
> > +     .bind =3D lenovo_cd01_component_bind,
> > +};
> > +
> > +static int lwmi_cd01_probe(struct wmi_device *wdev, const void *contex=
t)
> > +
> > +{
> > +     struct lwmi_cd01_priv *priv;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->wdev =3D wdev;
> > +     dev_set_drvdata(&wdev->dev, priv);
> > +
> > +     ret =3D component_add(&wdev->dev, &lenovo_cd01_component_ops);
> > +
> > +     return ret;
> > +}
> > +
> > +static void lwmi_cd01_remove(struct wmi_device *wdev)
> > +{
> > +     component_del(&wdev->dev, &lenovo_cd01_component_ops);
> > +}
> > +
> > +static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
> > +     { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
> > +     {}
> > +};
> > +
> > +static struct wmi_driver lwmi_cd01_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "lenovo_wmi_cd01",
> > +             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +     },
> > +     .id_table =3D lwmi_cd01_id_table,
> > +     .probe =3D lwmi_cd01_probe,
> > +     .remove =3D lwmi_cd01_remove,
> > +     .no_singleton =3D true,
> > +};
> > +
> > +int lwmi_cd01_match(struct device *dev, void *data)
> > +{
> > +     return dev->driver =3D=3D &lwmi_cd01_driver.driver;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> > +
> > +module_wmi_driver(lwmi_cd01_driver);
> > +
> > +MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.h b/drivers/plat=
form/x86/lenovo-wmi-capdata01.h
> > new file mode 100644
> > index 000000000000..c7067a8d0398
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-capdata01.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
>
> Extra line
>
> > + */
> > +
> > +#ifndef _LENOVO_WMI_CAPDATA01_H_
> > +#define _LENOVO_WMI_CAPDATA01_H_
> > +
> > +#include <linux/device.h>
>
> Please fwd declare struct device instead.
>
> > +#include <linux/types.h>
> > +
> > +struct capdata01 {
> > +     u32 id;
> > +     u32 supported;
> > +     u32 default_value;
> > +     u32 step;
> > +     u32 min_value;
> > +     u32 max_value;
> > +};
> > +
> > +struct cd01_list {
> > +     struct capdata01 **data;
> > +     int count;
> > +};
> > +
> > +int lwmi_cd01_match(struct device *dev, void *data);
> > +
> > +#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> >
>
> --
>  i.
>
