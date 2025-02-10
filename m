Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF4241C8C;
	Mon, 10 Feb 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202774; cv=none; b=lrFrwB9zg+6IHOz+0qUXM0tdv2GtNERMJZYKzqASHf2II9qx2Hpz03z+LGb5NLRwfiE9CQDsKt5V14Zy8xxEu2/NwePUS2C2uFZcZxJXnuqIahq18G/KXbCsR4w3CbLhtOE8fF6wOqg+5se+fSLi/PAuUx2Dw1IoK87YjW9wACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202774; c=relaxed/simple;
	bh=rKOwFOfsipfa9wPNHmasS5ZcLFGDYxB+ligkXFp0Yb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=N0fgmyAC33OeLcPeCoBVqRB7iY2UGxwrD67aZlE1mvK7xgZFNTtLrRMRm2VNuYQSDpNVqwGiE9nH3hvJUMK5Qn0f8T1274CYz6U2ycdgfxkvkIDP7j08WFqbC/polnnFQlt+zj/ZYHnlFLWaV0Kkeyoadgkpn5e7XnjGNzhnxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiwYn0+D; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiwYn0+D"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f679788fd1so31054337b3.2;
        Mon, 10 Feb 2025 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739202771; x=1739807571; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx8qAGo6u66VT7oFc8oLwkLNzptb0WyYcd14aqioSJs=;
        b=QiwYn0+DLtHvycxLYqmjy+sWdn/F78O5bY9jmbuEChlRWwIHDPU8+fIdn8teF89R31
         4qssr3JqN8pilwUcWL6U0CKdKYHMj3NB46j05hLgjJCpe2o4be1TvjrTZSaKiv/dJrw9
         v9mTC1rONSZgIVOcDn8H20wPuHNYvIINh4LdmqrgqasY1NvlHKXwdTVzqxIWBKwDXcT4
         u2qSSJN3Ce9BsBfUwahJs1UgEBYy8xVZNXe8a8TcGEUBUcM3rCU/7zzJEcXrBkmsKy9u
         8KfoOtKROqD++sfgIg02pmzkTgO7lUa9WyTzql9JgdqJozGrKTbJZlfStC3kBYX/PYth
         aqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202771; x=1739807571;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tx8qAGo6u66VT7oFc8oLwkLNzptb0WyYcd14aqioSJs=;
        b=aHAsZ0aaWsfYXfEwFfuRZKBiErZrgWymDNME7s4MfWNAEA1+8/J0srpDfGT1x/4GUw
         zPnNa4pdQMKoO9jrqZIgSGYdqu7RsRV6/VfgDaMRdGx6Nhvhd7vhpbKMpnX95ptcCT2J
         Q7mmGT1dsNeYKATb5yo2MBWnryR5aEbV9aOiv1o1I5BviScy9NOb3pYym9GI9hL437Yg
         uJOn9TT2djkOzOlhXFhvvkTwj1mIt/XRFfehSmkhvIGqxNo9/4nx/KjYrj8W6Ts8c4BX
         7cjs8Yhj/MU0NuYPwF6KbLtvrjLNE60lWDDL/DoZBLpC+i8uHLxx0j9U5gU8zrtOj1Eu
         zRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkjECXfVDA78v52WklkNlnT/Laht3qzLbSrYob4GTCA7doFjx8+ASm4Z0ToZIJZh3UoSSEPqdLZ90=@vger.kernel.org, AJvYcCW8QGQMIgWHR6BO8cdCNwVgoVM+ZIihiyW67p6H9sBhqKpoCLD1H2Af/HxlybkBMX3mNoe8Tu/Re3gyyYG3P+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3+cfZKLWEbtnyWHmgogVDmatK5CdWUSttNNMNdtN6jvuIsaq
	LHsRLzKNJNL/GKU69/8D58foAse/Xoxx9uWVoasVioVIlfcs5y29ZWvaDA==
X-Gm-Gg: ASbGncsDdNZZYb2T45y5cAU+y0vy9/qQ1cdmgZUdMdCxcpd0yY0ZTQa1p7JfTfNjX/7
	P1fwCbF1qZSbGcVZrxFBYoqK+EPYcjUJVJDmafrm9lwGYQrQMg53T01MeXW7hQuihC2OCqKEbBv
	Pi8AFn7e4buzOvgWk2ATXpKgehqdabox+/bIN5R3YiafgEd+xEgPU9tqtOaWCrvotr401jEKC8J
	TORe4+uG3lKDYncMvVzVVJBp9s3F/0bfuUpr8mfNXpCfnvxhkHE1AbMzsuleEeo20kJNBo1mCUn
	BUZlGII=
X-Google-Smtp-Source: AGHT+IG0Er/1xfsmtvOSAK3YenUT3p7jPaESAawHmRD3GQhSkM9KUtn0NYvjk00PcXgTKnGERsRc4Q==
X-Received: by 2002:a05:690c:6010:b0:6f7:5605:c62b with SMTP id 00721157ae682-6fb0b5e3c0fmr1026867b3.27.1739202771188;
        Mon, 10 Feb 2025 07:52:51 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a34c4bc2sm16757037b3.27.2025.02.10.07.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:52:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 10:52:47 -0500
Message-Id: <D7OVXDJEMH53.18HAI8VKLN997@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Lukas Wunner" <lukas@wunner.de>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 "Robin Murphy" <robin.murphy@arm.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Zijun Hu" <quic_zijuhu@quicinc.com>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a
 simple device/bus is needed
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com> <2025021038-pushy-prior-5dfd@gregkh>
 <D7OURQCZ3I1X.85BUFMYU6H8A@gmail.com>
 <2025021028-showgirl-waviness-b4bf@gregkh>
In-Reply-To: <2025021028-showgirl-waviness-b4bf@gregkh>

On Mon Feb 10, 2025 at 10:36 AM -05, Greg Kroah-Hartman wrote:
> On Mon, Feb 10, 2025 at 09:58:24AM -0500, Kurt Borja wrote:
>> On Mon Feb 10, 2025 at 9:45 AM -05, Greg Kroah-Hartman wrote:
>> > On Mon, Feb 10, 2025 at 09:29:52AM -0500, Kurt Borja wrote:
>> >> Hi Greg,
>> >>=20
>> >> On Mon Feb 10, 2025 at 7:30 AM -05, Greg Kroah-Hartman wrote:
>> >> > Many drivers abuse the platform driver/bus system as it provides a
>> >> > simple way to create and bind a device to a driver-specific set of
>> >> > probe/release functions.  Instead of doing that, and wasting all of=
 the
>> >> > memory associated with a platform device, here is a "faux" bus that
>> >> > can be used instead.
>> >> >
>> >> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>> >> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>> >> > Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de=
>
>> >> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> >> > ---
>> >> > v4: - really removed the name logic
>> >> >     - added #include <linux/container_of.h> to faux.h
>> >> >     - added parent pointer to api call
>> >> >     - minor documentation updates
>> >> >     - made probe synchronous
>> >> > v3: - loads of documentation updates and rewrites
>> >> >     - added to the documentation build
>> >> >     - removed name[] array as it's no longer needed
>> >> >     - added faux_device_create_with_groups()
>> >> >     - added functions to get/set devdata
>> >> >     - renamed faux_driver_ops -> faux_device_ops
>> >> >     - made faux_device_ops a const *
>> >> >     - minor cleanups
>> >> >     - tested it, again.
>> >> >
>> >> > v2: - renamed bus and root device to just "faux" thanks to Thomas
>> >> >     - removed the one-driver-per-device and now just have one drive=
r
>> >> >       entirely thanks to Danilo
>> >> >     - kerneldoc fixups and additions and string handling bounds che=
cks
>> >> >       thanks to Andy
>> >> >     - coding style fix thanks to Jonathan
>> >> >     - tested that the destroy path actually works
>> >> >  Documentation/driver-api/infrastructure.rst |   6 +
>> >> >  drivers/base/Makefile                       |   2 +-
>> >> >  drivers/base/base.h                         |   1 +
>> >> >  drivers/base/faux.c                         | 232 ++++++++++++++++=
++++
>> >> >  drivers/base/init.c                         |   1 +
>> >> >  include/linux/device/faux.h                 |  69 ++++++
>> >> >  6 files changed, 310 insertions(+), 1 deletion(-)
>> >> >  create mode 100644 drivers/base/faux.c
>> >> >  create mode 100644 include/linux/device/faux.h
>> >> >
>> >> > diff --git a/Documentation/driver-api/infrastructure.rst b/Document=
ation/driver-api/infrastructure.rst
>> >> > index 3d52dfdfa9fd..35e36fee4238 100644
>> >> > --- a/Documentation/driver-api/infrastructure.rst
>> >> > +++ b/Documentation/driver-api/infrastructure.rst
>> >> > @@ -41,6 +41,12 @@ Device Drivers Base
>> >> >  .. kernel-doc:: drivers/base/class.c
>> >> >     :export:
>> >> > =20
>> >> > +.. kernel-doc:: include/linux/device/faux.h
>> >> > +   :internal:
>> >> > +
>> >> > +.. kernel-doc:: drivers/base/faux.c
>> >> > +   :export:
>> >> > +
>> >> >  .. kernel-doc:: drivers/base/node.c
>> >> >     :internal:
>> >> > =20
>> >> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
>> >> > index 7fb21768ca36..8074a10183dc 100644
>> >> > --- a/drivers/base/Makefile
>> >> > +++ b/drivers/base/Makefile
>> >> > @@ -6,7 +6,7 @@ obj-y			:=3D component.o core.o bus.o dd.o syscore.=
o \
>> >> >  			   cpu.o firmware.o init.o map.o devres.o \
>> >> >  			   attribute_container.o transport_class.o \
>> >> >  			   topology.o container.o property.o cacheinfo.o \
>> >> > -			   swnode.o
>> >> > +			   swnode.o faux.o
>> >> >  obj-$(CONFIG_AUXILIARY_BUS) +=3D auxiliary.o
>> >> >  obj-$(CONFIG_DEVTMPFS)	+=3D devtmpfs.o
>> >> >  obj-y			+=3D power/
>> >> > diff --git a/drivers/base/base.h b/drivers/base/base.h
>> >> > index 8cf04a557bdb..0042e4774b0c 100644
>> >> > --- a/drivers/base/base.h
>> >> > +++ b/drivers/base/base.h
>> >> > @@ -137,6 +137,7 @@ int hypervisor_init(void);
>> >> >  static inline int hypervisor_init(void) { return 0; }
>> >> >  #endif
>> >> >  int platform_bus_init(void);
>> >> > +int faux_bus_init(void);
>> >> >  void cpu_dev_init(void);
>> >> >  void container_dev_init(void);
>> >> >  #ifdef CONFIG_AUXILIARY_BUS
>> >> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
>> >> > new file mode 100644
>> >> > index 000000000000..531e9d789ee0
>> >> > --- /dev/null
>> >> > +++ b/drivers/base/faux.c
>> >> > @@ -0,0 +1,232 @@
>> >> > +// SPDX-License-Identifier: GPL-2.0-only
>> >> > +/*
>> >> > + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.o=
rg>
>> >> > + * Copyright (c) 2025 The Linux Foundation
>> >> > + *
>> >> > + * A "simple" faux bus that allows devices to be created and added
>> >> > + * automatically to it.  This is to be used whenever you need to c=
reate a
>> >> > + * device that is not associated with any "real" system resources,=
 and do
>> >> > + * not want to have to deal with a bus/driver binding logic.  It i=
s
>> >> > + * intended to be very simple, with only a create and a destroy fu=
nction
>> >> > + * available.
>> >> > + */
>> >> > +#include <linux/err.h>
>> >> > +#include <linux/init.h>
>> >> > +#include <linux/slab.h>
>> >> > +#include <linux/string.h>
>> >> > +#include <linux/container_of.h>
>> >> > +#include <linux/device/faux.h>
>> >> > +#include "base.h"
>> >> > +
>> >> > +/*
>> >> > + * Internal wrapper structure so we can hold a pointer to the
>> >> > + * faux_device_ops for this device.
>> >> > + */
>> >> > +struct faux_object {
>> >> > +	struct faux_device faux_dev;
>> >> > +	const struct faux_device_ops *faux_ops;
>> >> > +};
>> >> > +#define to_faux_object(dev) container_of_const(dev, struct faux_ob=
ject, faux_dev.dev)
>> >> > +
>> >> > +static struct device faux_bus_root =3D {
>> >> > +	.init_name	=3D "faux",
>> >> > +};
>> >> > +
>> >> > +static int faux_match(struct device *dev, const struct device_driv=
er *drv)
>> >> > +{
>> >> > +	/* Match always succeeds, we only have one driver */
>> >> > +	return 1;
>> >> > +}
>> >> > +
>> >> > +static int faux_probe(struct device *dev)
>> >> > +{
>> >> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> >> > +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
>> >> > +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
>> >> > +	int ret =3D 0;
>> >> > +
>> >> > +	if (faux_ops && faux_ops->probe)
>> >> > +		ret =3D faux_ops->probe(faux_dev);
>> >> > +
>> >> > +	return ret;
>> >> > +}
>> >> > +
>> >> > +static void faux_remove(struct device *dev)
>> >> > +{
>> >> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> >> > +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
>> >> > +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
>> >> > +
>> >> > +	if (faux_ops && faux_ops->remove)
>> >> > +		faux_ops->remove(faux_dev);
>> >> > +}
>> >> > +
>> >> > +static const struct bus_type faux_bus_type =3D {
>> >> > +	.name		=3D "faux",
>> >> > +	.match		=3D faux_match,
>> >> > +	.probe		=3D faux_probe,
>> >> > +	.remove		=3D faux_remove,
>> >> > +};
>> >> > +
>> >> > +static struct device_driver faux_driver =3D {
>> >> > +	.name		=3D "faux_driver",
>> >> > +	.bus		=3D &faux_bus_type,
>> >> > +	.probe_type	=3D PROBE_FORCE_SYNCHRONOUS,
>> >> > +};
>> >> > +
>> >> > +static void faux_device_release(struct device *dev)
>> >> > +{
>> >> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> >> > +
>> >> > +	kfree(faux_obj);
>> >> > +}
>> >> > +
>> >> > +/**
>> >> > + * faux_device_create_with_groups - Create and register with the d=
river
>> >> > + *		core a faux device and populate the device with an initial
>> >> > + *		set of sysfs attributes.
>> >> > + * @name:	The name of the device we are adding, must be unique for
>> >> > + *		all faux devices.
>> >> > + * @parent:	Pointer to a potential parent struct device.  If set t=
o
>> >> > + *		NULL, the device will be created in the "root" of the faux
>> >> > + *		device tree in sysfs.
>> >> > + * @faux_ops:	struct faux_device_ops that the new device will call=
 back
>> >> > + *		into, can be NULL.
>> >> > + * @groups:	The set of sysfs attributes that will be created for t=
his
>> >> > + *		device when it is registered with the driver core.
>> >> > + *
>> >> > + * Create a new faux device and register it in the driver core pro=
perly.
>> >> > + * If present, callbacks in @faux_ops will be called with the devi=
ce that
>> >> > + * for the caller to do something with at the proper time given th=
e
>> >> > + * device's lifecycle.
>> >> > + *
>> >> > + * Note, when this function is called, the functions specified in =
struct
>> >> > + * faux_ops can be called before the function returns, so be prepa=
red for
>> >> > + * everything to be properly initialized before that point in time=
.
>> >> > + *
>> >> > + * Return:
>> >> > + * * NULL if an error happened with creating the device
>> >> > + * * pointer to a valid struct faux_device that is registered with=
 sysfs
>> >> > + */
>> >> > +struct faux_device *faux_device_create_with_groups(const char *nam=
e,
>> >> > +						   struct device *parent,
>> >> > +						   const struct faux_device_ops *faux_ops,
>> >> > +						   const struct attribute_group **groups)
>> >> > +{
>> >> > +	struct faux_object *faux_obj;
>> >> > +	struct faux_device *faux_dev;
>> >> > +	struct device *dev;
>> >> > +	int ret;
>> >> > +
>> >> > +	faux_obj =3D kzalloc(sizeof(*faux_obj), GFP_KERNEL);
>> >> > +	if (!faux_obj)
>> >> > +		return NULL;
>> >> > +
>> >> > +	/* Save off the callbacks so we can use them in the future */
>> >> > +	faux_obj->faux_ops =3D faux_ops;
>> >> > +
>> >> > +	/* Initialize the device portion and register it with the driver =
core */
>> >> > +	faux_dev =3D &faux_obj->faux_dev;
>> >> > +	dev =3D &faux_dev->dev;
>> >> > +
>> >> > +	device_initialize(dev);
>> >> > +	dev->release =3D faux_device_release;
>> >> > +	if (parent)
>> >> > +		dev->parent =3D parent;
>> >> > +	else
>> >> > +		dev->parent =3D &faux_bus_root;
>> >> > +	dev->bus =3D &faux_bus_type;
>> >> > +	dev->groups =3D groups;
>> >> > +	dev_set_name(dev, "%s", name);
>> >> > +
>> >> > +	ret =3D device_add(dev);
>> >> > +	if (ret) {
>> >> > +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
>> >> > +		       __func__, name, ret);
>> >> > +		put_device(dev);
>> >> > +		return NULL;
>> >> > +	}
>> >>=20
>> >> Now that the probe is synchronous, what do you think about returning
>> >> -ENODEV if the device failed to bind to the driver?
>> >
>> > Nope, that would make all callers have to deal with a pointer or a NUL=
L,
>> > or an error value encorporated in a pointer.
>>=20
>> Right! I thought for a sec this function returned ERR_PTRs.
>>=20
>> >
>> >> This would be useful for modules that may want to unload if the probe
>> >> fails.
>> >
>> > Then just test for NULL, there's nothing preventing that, right?
>>=20
>> Please, correct me if I'm wrong. If the probe the user provided fails
>> the device would still be added successfully to the bus. That means this
>> function would return a valid pointer and the module has no way of
>> knowing if the probe succeeded in an __init section.
>
> Ah, yes, you are totally correct here.  You don't know if the probe
> failed or not.  But your device is still "live" and you can only get rid
> of it by calling faux_device_destroy(), all that might be wrong with it
> is that it's not really associated with the bus.

I'm curious of what happens with the sysfs groups you pass if the probe
fails. Do they get assigned on driver attachment or right after
device_add()? Because those sysfs attributes may depend on resources
initialized on the probe.

>
> You can still assign resources to it, AND the resources will be freed up
> when the device goes away (see the comment in device_release() for
> specifics as to this happening today for platform devices.)
>
> I guess we can test for this and handle it, if you feel it is necessary,
> it wouldn't be hard to do so, but let me add this later as it's the same
> problem with platform devices and odds are we want to fix that issue up
> there too, right?

Platform devices have platform_create_bundle() which does check if the
probe succeeded.

>
>> > Also, the only way probe can fail is if the probe you passed into the
>> > call fails.  Or if you picked a name that is already in the system, bo=
th
>>=20
>> Exactly. I'm thinking of modules that are very simple and just care
>> about the probe succeeding, so having the device hanging around in the
>> bus and the module loaded would be a waste of resources.
>
> Modules usually don't need to do the probe callback at all.  I show one
> example in this series (the regulator dummy driver), but it can be
> easily rewritten to not need that at all.

This is a good point, but from a developer standpoint I would always try
to use the probe callback. This API seems to suggest that's the
appropiate use.

Also it would be amazing if the probe could reside in an __init section.

>
> And bonus, the rust binding doesn't allow you to provide a probe()
> callback that could fail, so any code written using that will not have
> this issue at all :)

This is very interesting. I will check the bindings and learn some rust
in the process :)

--=20
 ~ Kurt

>
> thanks,
>
> greg k-h

