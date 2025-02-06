Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5623B192;
	Thu,  6 Feb 2025 18:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865303; cv=none; b=IgzCowWaLK5LnCViXxWF7uXlVWyT8KWrRirP1X1ZUvKvugkOI3GnSBHHHl01kV/YkIswOZvKfPPYP1TaCc5vWYieI2vh8ckRmCDUiqRQuFRmMuNXMhdvzR4IFLw8ZZJ+J0zBXsoOo93/Wtxib8ajQbuWyQbmdq053PX9Nb8JF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865303; c=relaxed/simple;
	bh=xV87z6qVTIGKsvqhCZAh16QP2BkUHVb9he3HudYERrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY/yZp57DFngkPxQeXVaaduMHggXrlmzAOT8gtkhCVaXmDiYgd4uX95HX3AZyvYGKJFzr2bp1+xpZoHvzRe8AhqKazKUs3y72M3K4bk1bZqkeCXnGx9+/s6ofWbwwlJTijV0Jyt+kMxmftePpE3bXdg3m8QZlyHl7p3jeAzaJfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GP4F7B9w; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8NakDivi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GP4F7B9w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8NakDivi"
Date: Thu, 6 Feb 2025 19:08:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738865299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOiffeOkXMYgLk5S7bbPDlIcMb22gaiaMT00C9bKdXg=;
	b=GP4F7B9wsXwh0bo23al/wqGqd4YZiD90qwxVLxQx1t55Ga/bp5cHpNQjlZyb0c08lA5yxN
	joSFqflDLBjJjBibsnRzO5MfyaJ5tlpRKPXLFXz2pQL989vgbqsQ/O9rvs6t/+CR1XSymA
	Ifsp2iJRWLAwJHaDEsPRKd/viZtVYPXseAmizY8MGFqe2rS0M7VAX8vBdgdxUL0Uzqghif
	h1fIMLsnaT0NKS3pVgjdi6ZFblmzj86Vn1c/rRgtb7EwGf4mCElzhFHik/O6Htqpt+FDC8
	6dwvjHmzs28+GYB8oAWlCNEOO3ho6sZ83ra1Hx8XXC+mmIOd80XPjjUQ6IpMPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738865299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOiffeOkXMYgLk5S7bbPDlIcMb22gaiaMT00C9bKdXg=;
	b=8NakDivimh3kNt0h82cHviMA2bZoaY3sQnJBWYFNhA5V2f4EtFGsF0tuD4Lg2hTpcZUYdH
	wAfQaGMXqvoLObCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/8] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <20250206185314-a69d5f40-abd9-4dce-863a-b85e0b4c6c82@linutronix.de>
References: <2025020620-skedaddle-olympics-1735@gregkh>
 <2025020623-chemo-amends-102a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025020623-chemo-amends-102a@gregkh>

On Thu, Feb 06, 2025 at 06:38:15PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Some tiny nitpicks below, but still:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
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
>  drivers/base/faux.c                         | 228 ++++++++++++++++++++
>  drivers/base/init.c                         |   1 +
>  include/linux/device/faux.h                 |  65 ++++++
>  6 files changed, 302 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h
 
<snip>

> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> new file mode 100644
> index 000000000000..27879ae78f53
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,228 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  This is to be used whenever you need to create a
> + * device that is not associated with any "real" system resources, and do
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

Weird order.

> +
> +#define MAX_FAUX_NAME_SIZE	256	/* Max size of a faux_device name */
> +
> +/*
> + * Internal wrapper structure so we can hold a pointer to the
> + * faux_device_ops for this device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	const struct faux_device_ops *faux_ops;
> +};
> +#define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
> +
> +static struct device faux_bus_root = {
> +	.init_name	= "faux",
> +};
> +
> +static int faux_match(struct device *dev, const struct device_driver *drv)
> +{
> +	/* Match always succeeds, we only have one driver */
> +	return 1;
> +}
> +
> +static int faux_probe(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> +	int ret = 0;
> +
> +	if (faux_ops && faux_ops->probe)
> +		ret = faux_ops->probe(faux_dev);
> +
> +	return ret;
> +}
> +
> +static void faux_remove(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> +
> +	if (faux_ops && faux_ops->remove)
> +		faux_ops->remove(faux_dev);
> +}
> +
> +static const struct bus_type faux_bus_type = {
> +	.name		= "faux",
> +	.match		= faux_match,
> +	.probe		= faux_probe,
> +	.remove		= faux_remove,
> +};
> +
> +static struct device_driver faux_driver = {
> +	.name		= "faux_driver",
> +	.bus		= &faux_bus_type,
> +	.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
> +};
> +
> +static void faux_device_release(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +
> +	kfree(faux_obj);
> +}
> +
> +/**
> + * faux_device_create_with_groups - create and register with the driver
> + *		core a faux device and populate the device with an initial
> + *		set of sysfs attributes
> + * @name:	The name of the device we are adding, must be unique for
> + *		all faux devices.
> + * @faux_ops:	struct faux_device_ops that the new device will call back
> + *		into, can be NULL.
> + * @groups:	The set of sysfs attributes that will be created for this
> + *		device when it is registered with the driver core.
> + *
> + * Create a new faux device and register it in the driver core properly.
> + * If present, callbacks in @faux_ops will be called with the device that
> + * for the caller to do something with at the proper time given the
> + * device's lifecycle.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops can be called before the function returns, so be prepared for
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create_with_groups(const char *name,
> +						   const struct faux_device_ops *faux_ops,
> +						   const struct attribute_group **groups)
> +{
> +	struct device *dev;
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	int name_size;
> +	int ret;
> +
> +	name_size = strlen(name);
> +	if (name_size > MAX_FAUX_NAME_SIZE)
> +		return NULL;
> +
> +	faux_obj = kzalloc(sizeof(*faux_obj) + name_size + 1, GFP_KERNEL);

The name is not actually stored in the object anymore.

> +	if (!faux_obj)
> +		return NULL;
> +
> +	/* Save off the callbacks so we can use them in the future */
> +	faux_obj->faux_ops = faux_ops;
> +
> +	/* Initialize the device portion and register it with the driver core */
> +	faux_dev = &faux_obj->faux_dev;
> +	dev = &faux_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release = faux_device_release;
> +	dev->parent = &faux_bus_root;

I guess nobody will want to hang these off a different parent.

> +	dev->bus = &faux_bus_type;
> +	dev->groups = groups;
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	return faux_dev;
> +}
> +EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
> +
> +/**
> + * faux_device_create - create and register with the driver core a faux device
> + * @name:	name of the device we are adding, must be unique for all
> + *		faux devices.
> + * @faux_ops:	struct faux_device_ops that the new device will call back
> + *		into, can be NULL.
> + *
> + * Create a new faux device and register it in the driver core properly.
> + * If present, callbacks in @faux_ops will be called with the device that
> + * for the caller to do something with at the proper time given the
> + * device's lifecycle.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops can be called before the function returns, so be prepared for
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create(const char *name,
> +				       const struct faux_device_ops *faux_ops)
> +{
> +	return faux_device_create_with_groups(name, faux_ops, NULL);
> +}
> +EXPORT_SYMBOL_GPL(faux_device_create);
> +
> +/**
> + * faux_device_destroy - destroy a faux device
> + * @faux_dev:	faux device to destroy
> + *
> + * Unregisters and cleans up a device that was created with a call to
> + * faux_device_create()
> + */
> +void faux_device_destroy(struct faux_device *faux_dev)
> +{
> +	struct device *dev = &faux_dev->dev;
> +
> +	if (!faux_dev)
> +		return;
> +
> +	device_del(dev);
> +
> +	/* The final put_device() will clean up the memory we allocated for this device. */
> +	put_device(dev);
> +}
> +EXPORT_SYMBOL_GPL(faux_device_destroy);
> +
> +int __init faux_bus_init(void)
> +{
> +	int ret;
> +
> +	ret = device_register(&faux_bus_root);
> +	if (ret) {
> +		put_device(&faux_bus_root);
> +		return ret;
> +	}
> +
> +	ret = bus_register(&faux_bus_type);
> +	if (ret)
> +		goto error_bus;
> +
> +	ret = driver_register(&faux_driver);
> +	if (ret)
> +		goto error_driver;
> +
> +	return ret;
> +
> +error_driver:
> +	bus_unregister(&faux_bus_type);
> +
> +error_bus:
> +	device_unregister(&faux_bus_root);
> +	return ret;
> +}

<snip>

> diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
> new file mode 100644
> index 000000000000..2c8ae5bd7ae8
> --- /dev/null
> +++ b/include/linux/device/faux.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  This is to be used whenever you need to create a
> + * device that is not associated with any "real" system resources, and do
> + * not want to have to deal with a bus/driver binding logic.  It is
> + * intended to be very simple, with only a create and a destroy function
> + * available.
> + */
> +#ifndef _FAUX_DEVICE_H_
> +#define _FAUX_DEVICE_H_
> +

#include <linux/container_of.h>

> +#include <linux/device.h>
> +
> +struct faux_device {
> +	struct device dev;
> +};
> +#define to_faux_device(x) container_of_const((x), struct faux_device, dev)
> +
> +struct faux_driver_ops {
> +	int (*probe)(struct faux_device *faux_dev);
> +	void (*remove)(struct faux_device *faux_dev);
> +};
> +
> +struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops);
> +void faux_device_destroy(struct faux_device *faux_dev);
> +
> +#endif /* _FAUX_DEVICE_H_ */
