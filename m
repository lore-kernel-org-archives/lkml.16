Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235E2528E0;
	Mon, 10 Feb 2025 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197798; cv=none; b=P1uzOL3WoF4Rb5nSAv1gtPrYyogUh05gLd197xot0iSpxtnIRDruoX1iStdGGvrMRWnt313k9C3ynUCUQnTLt/tfSnOrXOTApFZSkuNRKWMS1NY0EisXKWjKGIirqx6a/4vK/SB/CxqVIxrZ/fijhbEPMFF0FHeLROJa8ulY8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197798; c=relaxed/simple;
	bh=IHFKTpAQajWK30g+CZhx8D8bqGKBD6PSab/qKJbHafE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NQ6YRja2lB9WwrUwARYeZu5d0SMrsNnkWx/scqsa/MaABuAX4r0MiJhFWeWz7aKAIh91VJCVBNZnLq65dMm4UCoyNaGAP7FRkLnMlAlq3zdfHi5ur8IEBPVpjxjuW2a1QkPWgbmnUxCjFMX4eVGQofLlPWPI4spMnx2iuHe8g44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTgy3ipM; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTgy3ipM"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f9625c0fccso40371207b3.1;
        Mon, 10 Feb 2025 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197795; x=1739802595; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SzPGh7l/G2We1xnSnZ4MaLizlv3tkYAdcM4zI4+4a4=;
        b=YTgy3ipMQCLdN4dsAAsKMWCJ1t6u8XeqABclqce5UXG55hEFTzNSN1948JrwF0sy7C
         8a3R8zGejepcg9u2IIbRTogyNItsf41E3pqDKJsIOVuGyWsS5Th3hdjJIkCcEq34o7Os
         D2qzcoIRK5tx7Qk2l8OhCorUx/SlhObLDPO2fTD1y78ABiSrbKUJ+9oY1G1aehybZZG5
         R4kFqMqaNFDeQjwRXCe7ys4ft7NTr4ITkEsUjKAybQDpsIXsYJ9vHihJLVMG3KvnZcC7
         w5jgzbc/QxwNhgFV0zI88/8PfuEGQ9On0ObZHhzeov2ua17GlRDM8uuib3qAyJSixKN7
         zsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197795; x=1739802595;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9SzPGh7l/G2We1xnSnZ4MaLizlv3tkYAdcM4zI4+4a4=;
        b=r6EzW9ulYG8NAX7Fap0fJ+mR1of8El8hlSa7HXeD1GlAqCYPjqRC668DClvEI/CnCe
         Lc8NLAeE/7muqaF48ygU9pSTc45dvWawDYlspnXAsnwBvjdoRoda/UnjK2H3HnR6aLzg
         JrI2GCS+/B53RUBI5ORqCtQjPKfptLk1FCPULglUe+5CEIf3++KV7XfgPmjMOnc2O40I
         OghJiSWx/aXzpHMNotej5Snb9U4v9fMfiFuGsT7nmbf4aQSa24wbglqsN7EDa57E8m00
         ZWxLOqCPqQjuWSzgz+iiKH7rHpY3jEX/eGlYuXIIhEkfGNV5TpQOt2Y1XbGaaCe7U8Aa
         jogw==
X-Forwarded-Encrypted: i=1; AJvYcCU7JEJz9nkE8MXOMo1XqIvAqIoCmxDov812nDYEeN9LZcKn08IjlXC89+CDV87lfNkulo/FHk5ExV9j/Yw=@vger.kernel.org, AJvYcCUrKYdRSjxpzLKMlmkNMVGRJ2NbDBP+bPBxQi33GS7FhfZg9cM2qShHcEvYl4d/SrksM2ZyAhPwe+Yth1dXr+g=@vger.kernel.org, AJvYcCXFS+E+zZhjpMMnLja7xirTnwLU5PKik2gwQ49miftbmudBofahKZDaM82P1WVjgp8M37umzytglPwz@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzhg+3uDfpuJ/f5gX59FA02NtZGXn34t08qYESb69Nj+e5L8l
	l6aN9O3+CKVpLrLScwjqJBaM7RA0DobjPsZSCDU4zuUOuztYR2LN
X-Gm-Gg: ASbGncu6b19ml64BrTLo7GHi1vUOHyyb8seS6nVr6Ilqz04JfJNKIDyjaujqelGEXio
	/i5bo2Q/v+VlvGiwx6O2y4bGFnFtWGno9EdGreISC+i7easBTOmcZpoXea3h46Q8pB4S/opfPL+
	2YvXvBJ82hud1yKP8lHPKisjLBnJeUa9ogX45GT6fAJ2xj4efBrLfpfLEYnQjF2MvWLZ7R105bU
	X+9wcHHZ4l7q3gzOEFukqR66ahJAhp36WdUdNTEqcmYIY8gmcYqsAPtv7DOF34NIgeQO4rjJHgN
	LO+r8Ys=
X-Google-Smtp-Source: AGHT+IGhgAhhDENGX22swk5cI3mpEnv0oMmHYiiEA+XAPaK4VwVP9nCjF376w1lFwDYc0YUOW/JsbA==
X-Received: by 2002:a05:690c:6d09:b0:6f9:7ce7:b107 with SMTP id 00721157ae682-6f9b29e4ea4mr128533937b3.29.1739197795274;
        Mon, 10 Feb 2025 06:29:55 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd1fa90sm16644907b3.45.2025.02.10.06.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 09:29:52 -0500
Message-Id: <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com>
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

Hi Greg,

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
> +	dev_set_name(dev, "%s", name);
> +
> +	ret =3D device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}

Now that the probe is synchronous, what do you think about returning
-ENODEV if the device failed to bind to the driver?

This would be useful for modules that may want to unload if the probe
fails.

--=20
 ~ Kurt
