Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B024FC17;
	Mon, 10 Feb 2025 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210215; cv=none; b=BFXI8gHR/HsAatM0R7b1YGBs9Y4SF6IC7ka7s30a5XVOvxLGvKBorPSteFMIgAIVtin617CjKrD/M4KTqcUynT1lIRahUrjuJTCQL57vAfsLe9n27pp01jPibnTRYXJ+7NN2Tslv3iv9AptLiuFj+ooJNACG0jCRuU8EDxUBm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210215; c=relaxed/simple;
	bh=lmHHe1arIIMYDmJLM4L/eVyGLxRypi94DMaDs7IsIgI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WQSKrhgvKLkHLfslQgGuEYyFPvSCzrE0ZzknXAiBOnz0jFWCulmziQAC2NEM1CCd+/Qy9AK6GwAzpKpBCEaQvMkmEnElOY3CJW15Sv8WUsScPRKOdC8HFd1ZoKrXnAQGy5uFVRsDYs1Sg3W3y7Qna/tPsBskpyW7wBVQqKRl1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8wbKvGV; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8wbKvGV"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ba88eaff7cso679674137.2;
        Mon, 10 Feb 2025 09:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210211; x=1739815011; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY2WNLUYsTNBfsFIIw9vpoFwU+r9AEaqeNWCC6ktHOk=;
        b=F8wbKvGVw28kAwpdKSG3vYZ57z4w4FD0RzJR2nCfPrK9yKOSMNw8gaP9/VOSt/7wCW
         v3v0uzSEXuZka13yWwbnWNNK7azkNyJYizl/C3uGaWZ38tvlc1RoMHAA+nRe8x8I7nrV
         foSnGbpPTlrAxV9BE35WhWHAIoXwFWuVgx7HFZJ+cQJhpSLDYqRrvFJHOnsA9JDEMMIA
         ikdzJcp3snXckM12SpBWVY5qG8lXrrQW5XMJhvjAPUSthG6fLMj9TiXn0bfaRfsEDN3A
         YYw3vlQSG+mK++sEt45fnclQyHJMx/STGNdGKbX08MgtOB0/ryaXvcJAmFxfvhuOthdJ
         unhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210211; x=1739815011;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KY2WNLUYsTNBfsFIIw9vpoFwU+r9AEaqeNWCC6ktHOk=;
        b=U7rrJpNN+Sv6fMI2PV/1SORiGcImp21GIW2iZx7pPSwk4wjCRKDyVRkzD/ZES3vf9H
         zXhG9p8MBTg4pkgYKgKHGKf1jxrO9THuCtP02yeBN1GpWYKIX3kDx4qt+yY9OYqNNm+Y
         tXiFD54sHING4WF1GB9I+iVS+kREHvfZZJVxTz3y3oyT9NL1B7rme/eQjtOCEl6GAX9M
         4/efUTTuraNCzFSC/0lSuGQC7QOiDp6Ig8Of1bTxw3BAGXAWcT03RGnNjA05GxILG6FF
         ovQjPJqnLU/LZtrMA7jPLvR8vagowaJRGVUY8ro/egAYtGddCthr4nlGEz2urfHgIq26
         AYuA==
X-Forwarded-Encrypted: i=1; AJvYcCUF/yODFGNyNdLJ5uoXrKPwofuX2iPLf3+5iSuToaVMKjSokk3wY3Vgx7F5/K+R8MOdnLuj/BbE+iLD8pkIQEY=@vger.kernel.org, AJvYcCWLaaaxISdMZ/1Wus9t3U+JgaJdUMuTDbElXayQ2GdyJCbWVQYuOVAVhmlUOUOjN9+7F+f8lXYjuYagszY=@vger.kernel.org, AJvYcCX5SCEO9ldMuMRuKkzLZhSbO3TTCsY/6IZ1Aj4N9XWiPaZW3L/4ksy7m4UWE5H50tE0772c/J+zRuR/@vger.kernel.org
X-Gm-Message-State: AOJu0YwvyQfeVBS0VS49k/t+RSqhqeWosxJLQNjN0HDlLXP+SLSDebo5
	rFEi6A4DhBNWm2XCKqZOqBmiLPCpgYrTC/UjKAXFuQ0PJsVUwv5m
X-Gm-Gg: ASbGncvkyHXU6HlN0EkfMrSQvgCV1TLwv0RO8RnlsBnBUU5DBMXuk2VvovAS0IbrYrl
	G35QqX2LnXC9nY62yi/jUrAoklDOcVrg5gNO61Vi1IkKSlaZOqa+ZAk8FLgBgFPD7XwaX0aE/A1
	i3v+bOnOYogdfBnkInH3Pb5fwiuYApClJZD//KTzoNylh7HH3u0DpQ6E+CyEofQNhrERTxJX45K
	e9Q0i6mOY134MYejw2ZfAg3/J1il4rpjcsB/GkNAIV0gn8PbaJgcdUYaV1EXTdOo/CGl62yG3zu
	KLITxv0=
X-Google-Smtp-Source: AGHT+IG0BI4aM66A/TPyak6a9qhZrDvmYo7AJFdxo6Z4ski7wCLFJeEUBLS2UC9lMaDU2/fDKYHBaQ==
X-Received: by 2002:a05:6102:418b:b0:4bb:5d61:1252 with SMTP id ada2fe7eead31-4bb5d611970mr4911506137.23.1739210211202;
        Mon, 10 Feb 2025 09:56:51 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbdcf078ccsm128055137.3.2025.02.10.09.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:56:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 12:56:46 -0500
Message-Id: <D7OYKAYV14AZ.2D8Q4XP557FSR@gmail.com>
Cc: "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Andy Shevchenko"
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
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
In-Reply-To: <2025021026-atlantic-gibberish-3f0c@gregkh>

On Mon Feb 10, 2025 at 7:30 AM -05, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v4: - really removed the name logic
>     - added #include <linux/container_of.h> to faux.h
>     - added parent pointer to api call
>     - minor documentation updates
>     - made probe synchronous
> v3: - loads of documentation updates and rewrites
>     - added to the documentation build
>     - removed name[] array as it's no longer needed
>     - added faux_device_create_with_groups()
>     - added functions to get/set devdata
>     - renamed faux_driver_ops -> faux_device_ops
>     - made faux_device_ops a const *
>     - minor cleanups
>     - tested it, again.
>
> v2: - renamed bus and root device to just "faux" thanks to Thomas
>     - removed the one-driver-per-device and now just have one driver
>       entirely thanks to Danilo
>     - kerneldoc fixups and additions and string handling bounds checks
>       thanks to Andy
>     - coding style fix thanks to Jonathan
>     - tested that the destroy path actually works
>  Documentation/driver-api/infrastructure.rst |   6 +
>  drivers/base/Makefile                       |   2 +-
>  drivers/base/base.h                         |   1 +
>  drivers/base/faux.c                         | 232 ++++++++++++++++++++
>  drivers/base/init.c                         |   1 +
>  include/linux/device/faux.h                 |  69 ++++++
>  6 files changed, 310 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h
>
> diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/=
driver-api/infrastructure.rst
> index 3d52dfdfa9fd..35e36fee4238 100644
> --- a/Documentation/driver-api/infrastructure.rst
> +++ b/Documentation/driver-api/infrastructure.rst
> @@ -41,6 +41,12 @@ Device Drivers Base
>  .. kernel-doc:: drivers/base/class.c
>     :export:
> =20
> +.. kernel-doc:: include/linux/device/faux.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/base/faux.c
> +   :export:
> +
>  .. kernel-doc:: drivers/base/node.c
>     :internal:
> =20
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 7fb21768ca36..8074a10183dc 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -6,7 +6,7 @@ obj-y			:=3D component.o core.o bus.o dd.o syscore.o \
>  			   cpu.o firmware.o init.o map.o devres.o \
>  			   attribute_container.o transport_class.o \
>  			   topology.o container.o property.o cacheinfo.o \
> -			   swnode.o
> +			   swnode.o faux.o
>  obj-$(CONFIG_AUXILIARY_BUS) +=3D auxiliary.o
>  obj-$(CONFIG_DEVTMPFS)	+=3D devtmpfs.o
>  obj-y			+=3D power/
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 8cf04a557bdb..0042e4774b0c 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -137,6 +137,7 @@ int hypervisor_init(void);
>  static inline int hypervisor_init(void) { return 0; }
>  #endif
>  int platform_bus_init(void);
> +int faux_bus_init(void);
>  void cpu_dev_init(void);
>  void container_dev_init(void);
>  #ifdef CONFIG_AUXILIARY_BUS
> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> new file mode 100644
> index 000000000000..531e9d789ee0
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  This is to be used whenever you need to create =
a
> + * device that is not associated with any "real" system resources, and d=
o
> + * not want to have to deal with a bus/driver binding logic.  It is
> + * intended to be very simple, with only a create and a destroy function
> + * available.
> + */
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/container_of.h>
> +#include <linux/device/faux.h>
> +#include "base.h"
> +
> +/*
> + * Internal wrapper structure so we can hold a pointer to the
> + * faux_device_ops for this device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	const struct faux_device_ops *faux_ops;
> +};
> +#define to_faux_object(dev) container_of_const(dev, struct faux_object, =
faux_dev.dev)
> +
> +static struct device faux_bus_root =3D {
> +	.init_name	=3D "faux",
> +};
> +
> +static int faux_match(struct device *dev, const struct device_driver *dr=
v)
> +{
> +	/* Match always succeeds, we only have one driver */
> +	return 1;
> +}
> +
> +static int faux_probe(struct device *dev)
> +{
> +	struct faux_object *faux_obj =3D to_faux_object(dev);
> +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
> +	int ret =3D 0;
> +
> +	if (faux_ops && faux_ops->probe)
> +		ret =3D faux_ops->probe(faux_dev);
> +
> +	return ret;
> +}
> +
> +static void faux_remove(struct device *dev)
> +{
> +	struct faux_object *faux_obj =3D to_faux_object(dev);
> +	struct faux_device *faux_dev =3D &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops =3D faux_obj->faux_ops;
> +
> +	if (faux_ops && faux_ops->remove)
> +		faux_ops->remove(faux_dev);
> +}
> +
> +static const struct bus_type faux_bus_type =3D {
> +	.name		=3D "faux",
> +	.match		=3D faux_match,
> +	.probe		=3D faux_probe,
> +	.remove		=3D faux_remove,
> +};
> +
> +static struct device_driver faux_driver =3D {
> +	.name		=3D "faux_driver",
> +	.bus		=3D &faux_bus_type,
> +	.probe_type	=3D PROBE_FORCE_SYNCHRONOUS,
> +};
> +
> +static void faux_device_release(struct device *dev)
> +{
> +	struct faux_object *faux_obj =3D to_faux_object(dev);
> +
> +	kfree(faux_obj);
> +}
> +
> +/**
> + * faux_device_create_with_groups - Create and register with the driver
> + *		core a faux device and populate the device with an initial
> + *		set of sysfs attributes.
> + * @name:	The name of the device we are adding, must be unique for
> + *		all faux devices.
> + * @parent:	Pointer to a potential parent struct device.  If set to
> + *		NULL, the device will be created in the "root" of the faux
> + *		device tree in sysfs.
> + * @faux_ops:	struct faux_device_ops that the new device will call back
> + *		into, can be NULL.
> + * @groups:	The set of sysfs attributes that will be created for this
> + *		device when it is registered with the driver core.
> + *
> + * Create a new faux device and register it in the driver core properly.
> + * If present, callbacks in @faux_ops will be called with the device tha=
t
> + * for the caller to do something with at the proper time given the
> + * device's lifecycle.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops can be called before the function returns, so be prepared fo=
r
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create_with_groups(const char *name,
> +						   struct device *parent,
> +						   const struct faux_device_ops *faux_ops,
> +						   const struct attribute_group **groups)
> +{
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	struct device *dev;
> +	int ret;
> +
> +	faux_obj =3D kzalloc(sizeof(*faux_obj), GFP_KERNEL);
> +	if (!faux_obj)
> +		return NULL;
> +
> +	/* Save off the callbacks so we can use them in the future */
> +	faux_obj->faux_ops =3D faux_ops;
> +
> +	/* Initialize the device portion and register it with the driver core *=
/
> +	faux_dev =3D &faux_obj->faux_dev;
> +	dev =3D &faux_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release =3D faux_device_release;
> +	if (parent)
> +		dev->parent =3D parent;
> +	else
> +		dev->parent =3D &faux_bus_root;
> +	dev->bus =3D &faux_bus_type;
> +	dev->groups =3D groups;

Just as I feared, adding groups this way is bug prone if we don't check
if the device attached to the driver successfully. Consider the
following example module:

static attr1_show(...)
{
	struct priv *priv =3D dev_get_drvdata(dev);
	...
}
DEVICE_ATTR_RO(attr1)

...

static const struct attribute_group faux_groups[] =3D {
	...
}

/* It would be nice to have the probe in __init */
static int __init faux_probe(struct faux_device *fdev)
{
	...
	/* Probe may fail */
	if (con)
		return -EINVAL;
	...
	faux_device_set_drvdata(fdev, priv);
	...
}

static struct faux_device_ops faux_ops =3D {
	...
}

static int __init module_init()
{
	...
	fdev =3D faux_device_create_with_groups("foo", NULL, &faux_ops,
					      &faux_groups);
	if (!fdev)
		return -ENODEV;
}

In this example we have no way of knowing if the probe failed, so the
module as well as the device will remain loaded. Furthermore, the sysfs
groups WILL be added anyway, which is dangerous because we have no
gurantee about drvdata's lifetime nor if it was even initialized
correctly, which sysfs show/store methods may assume is the case.

So we have two problems here. First, this module only cares about the
probe succeeding so keeping the device alive after it fails wastes
resources. Second, we don't have any gurantee about drvdata validity.

> +	dev_set_name(dev, "%s", name);
> +
> +	ret =3D device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}

To solve this, I suggest we do this here:

	/* Check if the device attached correctly */
	if (dev->driver !=3D &faux_driver)
		return ERR_PTR(-ENODEV); /* or NULL */

	/*=20
	 * Add groups after the driver is attached, to avoid lifetime
	 * issues=20
	 */
	device_add_groups(dev, groups);

If I'm missing something, or I'm wrong about something let me know!

--=20
 ~ Kurt
