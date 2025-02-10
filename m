Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91CD23C36D;
	Mon, 10 Feb 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199511; cv=none; b=XK48f4uKC5EeKUscfVWo09uVH8fuV1yPKH32WwFO+IgcAcxFWZQsBYPHMXbP25rQL6ES/EYDIAiWaqU+Aip5NaEHPtCyhOYSYf78V7VvBY7z2xhb6kTf5QIVGtPzhb2fheahEFdhVRMIB8LVKUcDCzSbj8wifgTi6Olr7OOtP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199511; c=relaxed/simple;
	bh=aE5achVh8HUikp04az029HRNnVvuymT37mxL2SYhutM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ggHHdVAKbQO6+N5gdVHaN7yXVDMaL1jh2dQ7bXQzYy9UlWdF/3U0oRr6c6wh8WQd/KS4iH0RunV3ObKfw18AszXIJImG9mTZUmK17Hl/XqiM+6XvFANfc7tdC1eT6+vvbsajVVMyeo6k4oJDjCZJrqqseU5fSb6mjufaYdydAcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/O+bSHA; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/O+bSHA"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1245177137.1;
        Mon, 10 Feb 2025 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199508; x=1739804308; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AarHumITDtwBjrB7JQOzJfM06Fq7KE1cOE/npi2r2gQ=;
        b=T/O+bSHAy14X16OJ+Wttcln5P5z0o8MAaRifwuKiDBcmAvUiq12XIIIzAs+IuBKxIz
         M7DjM6ZFKOyrnCMaOy9V9y2wC8AwXbehkjJhGPqM2PnpwWZ4uJlzTEOvMBI42R5+pwoa
         0b4wdLM1GMnIqtgmmopFKUIySLvmNr1iJnkKKpaRHAhtUyj5ukkWywcpKd1zbhPC9s/J
         NWwcXMg0QSe6TubffPsSYVXzVb7vKhWRy8ia4bhCsfVtogpiKubNFOMdBOWEx8JAjMVM
         47ZSIIDphNRehjH8Ntgmohn3LIa5ZGfVwXG6uNZ0a+SclCdQzT95vuZxS1UUxYBsc0m8
         gj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199508; x=1739804308;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AarHumITDtwBjrB7JQOzJfM06Fq7KE1cOE/npi2r2gQ=;
        b=RLtG9w4qo51hCG0MjR6jBi2fem6i2jppm9465552vkqUl7nNa/zrJwaqr5uy/VniIU
         ryfFNdXVk2oBCNE42Qp2NdX3ztTP1cjJTJ4tsWVcsFiMCEO/KV5haYWJrghieCcpcOj3
         xlVMDvILKLDjH3AbljicxB8HjHjXO780Mh+W7fawpgbr1svudxFfwchIah3cwrxEWTmR
         5R3IAbybqQNCm5i7jpPo8cAvTB9zWiwGLXuEJSadb6RhOicvbcGQAsAapRaSB9p3q8kB
         rFFPh/FG/6ZxjruH/KaqbAAwhwTRs//wosyZM8eUVMTf/11af/Q6iIVv414R6qtGQAjx
         N9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrL+rwe+WJNmW1C9sl3vtYqm2mRXe6QwOS8mFMe9993D0bJ7TIvrhkAdJooVHU+19m3aa2FMtsL6B3i2DcjU0=@vger.kernel.org, AJvYcCWRDL628Ve9D6geqUa9OUj2vQgN9GbzYPxpf9wrwjRaAKnJKxCQ98QHjV9IwJOpOJ+8c0M4hZe9IWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mDMF9iLcHgTgUM6JNT6SkEC3Z6jjPrKp7lVvEUMuMllwA2lj
	8jPSbXoaO0MAYftY3TercAdAiPEqx1UPbUkkMJYMidexLcfUhaqS
X-Gm-Gg: ASbGncvKPhdJsIfj/IN+CX1AI0sZj0EIi89k+pbgmJXK+ZeIglFkQVKSKSGul9VVS0o
	pD8NqKvf0t02tZesSTAkr5uj0LUJGgSYZHRE6i2TuG481z6d9DGKb6IfqVcRShPkOMC7GSjL8eu
	mk9xegT4IROjBVwvOUI3X+9l8qY7RdRBc1IIjP8Dxq08W2XNYVr2KQZlLU2PJLB0YvafeO6HqN8
	3vpDq2jCBsSNt6xCqy+vxADZbFbKpTTZEv/RVl8wK8Dmrpc0sU3HdGopjNC1NzPM3omHCv4Il8+
	z1NZALc=
X-Google-Smtp-Source: AGHT+IHNEHKtlW9VRezT8q7Hza8hdVGzKNVLC7TbYmnrcpT+dR6/iL6AlqM3Av2RGq6891S7ISqZFw==
X-Received: by 2002:a05:6102:4414:b0:4ba:76e4:638c with SMTP id ada2fe7eead31-4ba85de0aeamr9193385137.9.1739199508522;
        Mon, 10 Feb 2025 06:58:28 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbb7547263sm798727137.4.2025.02.10.06.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:58:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 09:58:24 -0500
Message-Id: <D7OURQCZ3I1X.85BUFMYU6H8A@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
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
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com> <2025021038-pushy-prior-5dfd@gregkh>
In-Reply-To: <2025021038-pushy-prior-5dfd@gregkh>

On Mon Feb 10, 2025 at 9:45 AM -05, Greg Kroah-Hartman wrote:
> On Mon, Feb 10, 2025 at 09:29:52AM -0500, Kurt Borja wrote:
>> Hi Greg,
>>=20
>> On Mon Feb 10, 2025 at 7:30 AM -05, Greg Kroah-Hartman wrote:
>> > Many drivers abuse the platform driver/bus system as it provides a
>> > simple way to create and bind a device to a driver-specific set of
>> > probe/release functions.  Instead of doing that, and wasting all of th=
e
>> > memory associated with a platform device, here is a "faux" bus that
>> > can be used instead.
>> >
>> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>> > Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > ---
>> > v4: - really removed the name logic
>> >     - added #include <linux/container_of.h> to faux.h
>> >     - added parent pointer to api call
>> >     - minor documentation updates
>> >     - made probe synchronous
>> > v3: - loads of documentation updates and rewrites
>> >     - added to the documentation build
>> >     - removed name[] array as it's no longer needed
>> >     - added faux_device_create_with_groups()
>> >     - added functions to get/set devdata
>> >     - renamed faux_driver_ops -> faux_device_ops
>> >     - made faux_device_ops a const *
>> >     - minor cleanups
>> >     - tested it, again.
>> >
>> > v2: - renamed bus and root device to just "faux" thanks to Thomas
>> >     - removed the one-driver-per-device and now just have one driver
>> >       entirely thanks to Danilo
>> >     - kerneldoc fixups and additions and string handling bounds checks
>> >       thanks to Andy
>> >     - coding style fix thanks to Jonathan
>> >     - tested that the destroy path actually works
>> >  Documentation/driver-api/infrastructure.rst |   6 +
>> >  drivers/base/Makefile                       |   2 +-
>> >  drivers/base/base.h                         |   1 +
>> >  drivers/base/faux.c                         | 232 +++++++++++++++++++=
+
>> >  drivers/base/init.c                         |   1 +
>> >  include/linux/device/faux.h                 |  69 ++++++
>> >  6 files changed, 310 insertions(+), 1 deletion(-)
>> >  create mode 100644 drivers/base/faux.c
>> >  create mode 100644 include/linux/device/faux.h
>> >
>> > diff --git a/Documentation/driver-api/infrastructure.rst b/Documentati=
on/driver-api/infrastructure.rst
>> > index 3d52dfdfa9fd..35e36fee4238 100644
>> > --- a/Documentation/driver-api/infrastructure.rst
>> > +++ b/Documentation/driver-api/infrastructure.rst
>> > @@ -41,6 +41,12 @@ Device Drivers Base
>> >  .. kernel-doc:: drivers/base/class.c
>> >     :export:
>> > =20
>> > +.. kernel-doc:: include/linux/device/faux.h
>> > +   :internal:
>> > +
>> > +.. kernel-doc:: drivers/base/faux.c
>> > +   :export:
>> > +
>> >  .. kernel-doc:: drivers/base/node.c
>> >     :internal:
>> > =20
>> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
>> > index 7fb21768ca36..8074a10183dc 100644
>> > --- a/drivers/base/Makefile
>> > +++ b/drivers/base/Makefile
>> > @@ -6,7 +6,7 @@ obj-y			:=3D component.o core.o bus.o dd.o syscore.o \
>> >  			   cpu.o firmware.o init.o map.o devres.o \
>> >  			   attribute_container.o transport_class.o \
>> >  			   topology.o container.o property.o cacheinfo.o \
>> > -			   swnode.o
>> > +			   swnode.o faux.o
>> >  obj-$(CONFIG_AUXILIARY_BUS) +=3D auxiliary.o
>> >  obj-$(CONFIG_DEVTMPFS)	+=3D devtmpfs.o
>> >  obj-y			+=3D power/
>> > diff --git a/drivers/base/base.h b/drivers/base/base.h
>> > index 8cf04a557bdb..0042e4774b0c 100644
>> > --- a/drivers/base/base.h
>> > +++ b/drivers/base/base.h
>> > @@ -137,6 +137,7 @@ int hypervisor_init(void);
>> >  static inline int hypervisor_init(void) { return 0; }
>> >  #endif
>> >  int platform_bus_init(void);
>> > +int faux_bus_init(void);
>> >  void cpu_dev_init(void);
>> >  void container_dev_init(void);
>> >  #ifdef CONFIG_AUXILIARY_BUS
>> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
>> > new file mode 100644
>> > index 000000000000..531e9d789ee0
>> > --- /dev/null
>> > +++ b/drivers/base/faux.c
>> > @@ -0,0 +1,232 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +/*
>> > + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > + * Copyright (c) 2025 The Linux Foundation
>> > + *
>> > + * A "simple" faux bus that allows devices to be created and added
>> > + * automatically to it.  This is to be used whenever you need to crea=
te a
>> > + * device that is not associated with any "real" system resources, an=
d do
>> > + * not want to have to deal with a bus/driver binding logic.  It is
>> > + * intended to be very simple, with only a create and a destroy funct=
ion
>> > + * available.
>> > + */
>> > +#include <linux/err.h>
>> > +#include <linux/init.h>
>> > +#include <linux/slab.h>
>> > +#include <linux/string.h>
>> > +#include <linux/container_of.h>
>> > +#include <linux/device/faux.h>
>> > +#include "base.h"
>> > +
>> > +/*
>> > + * Internal wrapper structure so we can hold a pointer to the
>> > + * faux_device_ops for this device.
>> > + */
>> > +struct faux_object {
>> > +	struct faux_device faux_dev;
>> > +	const struct faux_device_ops *faux_ops;
>> > +};
>> > +#define to_faux_object(dev) container_of_const(dev, struct faux_objec=
t, faux_dev.dev)
>> > +
>> > +static struct device faux_bus_root =3D {
>> > +	.init_name	=3D "faux",
>> > +};
>> > +
>> > +static int faux_match(struct device *dev, const struct device_driver =
*drv)
>> > +{
>> > +	/* Match always succeeds, we only have one driver */
>> > +	return 1;
>> > +}
>> > +
>> > +static int faux_probe(struct device *dev)
>> > +{
>> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> > +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
>> > +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
>> > +	int ret =3D 0;
>> > +
>> > +	if (faux_ops && faux_ops->probe)
>> > +		ret =3D faux_ops->probe(faux_dev);
>> > +
>> > +	return ret;
>> > +}
>> > +
>> > +static void faux_remove(struct device *dev)
>> > +{
>> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> > +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
>> > +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
>> > +
>> > +	if (faux_ops && faux_ops->remove)
>> > +		faux_ops->remove(faux_dev);
>> > +}
>> > +
>> > +static const struct bus_type faux_bus_type =3D {
>> > +	.name		=3D "faux",
>> > +	.match		=3D faux_match,
>> > +	.probe		=3D faux_probe,
>> > +	.remove		=3D faux_remove,
>> > +};
>> > +
>> > +static struct device_driver faux_driver =3D {
>> > +	.name		=3D "faux_driver",
>> > +	.bus		=3D &faux_bus_type,
>> > +	.probe_type	=3D PROBE_FORCE_SYNCHRONOUS,
>> > +};
>> > +
>> > +static void faux_device_release(struct device *dev)
>> > +{
>> > +	struct faux_object *faux_obj =3D to_faux_object(dev);
>> > +
>> > +	kfree(faux_obj);
>> > +}
>> > +
>> > +/**
>> > + * faux_device_create_with_groups - Create and register with the driv=
er
>> > + *		core a faux device and populate the device with an initial
>> > + *		set of sysfs attributes.
>> > + * @name:	The name of the device we are adding, must be unique for
>> > + *		all faux devices.
>> > + * @parent:	Pointer to a potential parent struct device.  If set to
>> > + *		NULL, the device will be created in the "root" of the faux
>> > + *		device tree in sysfs.
>> > + * @faux_ops:	struct faux_device_ops that the new device will call ba=
ck
>> > + *		into, can be NULL.
>> > + * @groups:	The set of sysfs attributes that will be created for this
>> > + *		device when it is registered with the driver core.
>> > + *
>> > + * Create a new faux device and register it in the driver core proper=
ly.
>> > + * If present, callbacks in @faux_ops will be called with the device =
that
>> > + * for the caller to do something with at the proper time given the
>> > + * device's lifecycle.
>> > + *
>> > + * Note, when this function is called, the functions specified in str=
uct
>> > + * faux_ops can be called before the function returns, so be prepared=
 for
>> > + * everything to be properly initialized before that point in time.
>> > + *
>> > + * Return:
>> > + * * NULL if an error happened with creating the device
>> > + * * pointer to a valid struct faux_device that is registered with sy=
sfs
>> > + */
>> > +struct faux_device *faux_device_create_with_groups(const char *name,
>> > +						   struct device *parent,
>> > +						   const struct faux_device_ops *faux_ops,
>> > +						   const struct attribute_group **groups)
>> > +{
>> > +	struct faux_object *faux_obj;
>> > +	struct faux_device *faux_dev;
>> > +	struct device *dev;
>> > +	int ret;
>> > +
>> > +	faux_obj =3D kzalloc(sizeof(*faux_obj), GFP_KERNEL);
>> > +	if (!faux_obj)
>> > +		return NULL;
>> > +
>> > +	/* Save off the callbacks so we can use them in the future */
>> > +	faux_obj->faux_ops =3D faux_ops;
>> > +
>> > +	/* Initialize the device portion and register it with the driver cor=
e */
>> > +	faux_dev =3D &faux_obj->faux_dev;
>> > +	dev =3D &faux_dev->dev;
>> > +
>> > +	device_initialize(dev);
>> > +	dev->release =3D faux_device_release;
>> > +	if (parent)
>> > +		dev->parent =3D parent;
>> > +	else
>> > +		dev->parent =3D &faux_bus_root;
>> > +	dev->bus =3D &faux_bus_type;
>> > +	dev->groups =3D groups;
>> > +	dev_set_name(dev, "%s", name);
>> > +
>> > +	ret =3D device_add(dev);
>> > +	if (ret) {
>> > +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
>> > +		       __func__, name, ret);
>> > +		put_device(dev);
>> > +		return NULL;
>> > +	}
>>=20
>> Now that the probe is synchronous, what do you think about returning
>> -ENODEV if the device failed to bind to the driver?
>
> Nope, that would make all callers have to deal with a pointer or a NULL,
> or an error value encorporated in a pointer.

Right! I thought for a sec this function returned ERR_PTRs.

>
>> This would be useful for modules that may want to unload if the probe
>> fails.
>
> Then just test for NULL, there's nothing preventing that, right?

Please, correct me if I'm wrong. If the probe the user provided fails
the device would still be added successfully to the bus. That means this
function would return a valid pointer and the module has no way of
knowing if the probe succeeded in an __init section.

>
> Also, the only way probe can fail is if the probe you passed into the
> call fails.  Or if you picked a name that is already in the system, both

Exactly. I'm thinking of modules that are very simple and just care
about the probe succeeding, so having the device hanging around in the
bus and the module loaded would be a waste of resources.

--=20
 ~ Kurt

> of which you have full control over.
>
> thanks,
>
> greg k-h

