Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17BA5336E;
	Mon,  3 Feb 2025 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580471; cv=none; b=JTt1m0o4XiQIxnA0jTBUwY0xPLZnKOZeJRIDxRpVI+BYqiZGbpoxNd/NZ9JQHSWpMbV52DEsPdg+h/G0YGyfJjNiX8aORJamoAHTGNF6Qt1GzbvuM46/7sqYCgt1AfxIZyzTnbEt8cTuw41cjoA2wGtHUbo8HJWFTQzOsxssNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580471; c=relaxed/simple;
	bh=9Di8SMWFuQlTHdn+N7LvMTpfXISFUWpW4x9B/sI5yqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiEyD42NgK8OxpF/+8dQkLutyNKFo1H7JgXxJKI4PkpncHJu11R5zMMSjOc5bTFVv+6yiEL6ukXQ65ETafco566Ey6KZKy+ED9rGhi8cRZYNfNj0BIUaTYw1FnwdEitk9lj/RJPfjIYWFySbC02Qe4m2BZpTnF9XgWiqq/DGAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fI+OJG0Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fI+OJG0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57591C4CED2;
	Mon,  3 Feb 2025 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738580470;
	bh=9Di8SMWFuQlTHdn+N7LvMTpfXISFUWpW4x9B/sI5yqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fI+OJG0Zn46zyRH9EMVjREGCnSl8yEvG8xJlzsQcj8v63CqMqsPIub/03yTWbXkzv
	 dlxQV7alefU/2FABX6e5vvfxXUywQBUwse7e2Egjxzp0JpiFZxfEJtqzVP/CE9GVWq
	 MPz5bdii2QP9W3jVi0zir97t2oRj3sBq7Dg9U637rSOEGj9YGTs1FyAeJQlgPojrwK
	 y4z33a8J33rLdiX4aECro0Y1i7IK8wEOBoySbmvwbwxIQr8u2thxAGeSE6zRuG21ER
	 kSyBywm84ma9YwocZ0J4M8HeQ6/H6v9fTtPMeks2f+ntM6WL+bZlyup7g1leDBbWu3
	 PvidmOIZTcERg==
Date: Mon, 3 Feb 2025 12:01:04 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <Z6Ch8O-0oY70Jhi6@pollux>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020306-overhang-glider-7d42@gregkh>

On Mon, Feb 03, 2025 at 10:39:58AM +0100, Greg Kroah-Hartman wrote:
> From 4c7aa0f9f0f7d25c962b70a11bad48d418b9490a Mon Sep 17 00:00:00 2001
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Date: Fri, 31 Jan 2025 15:01:32 +0100
> Subject: [PATCH] driver core: add a virtual bus for use when a simple
>  device/bus is needed
> 
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "virtual" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I think it turned out pretty nice combining the driver and device creation for
convenience.

But I think we may still need the option to create multiple devices for the same
driver, as mentioned by Sima.

@Sima: I wonder if the number of devices could just be an argument?

> ---
>  drivers/base/Makefile          |   2 +-
>  drivers/base/base.h            |   1 +
>  drivers/base/init.c            |   1 +
>  drivers/base/virtual.c         | 196 +++++++++++++++++++++++++++++++++
>  drivers/regulator/dummy.c      |  35 ++----
>  include/linux/device/virtual.h |  32 ++++++
>  6 files changed, 239 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/base/virtual.c
>  create mode 100644 include/linux/device/virtual.h
> 
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 7fb21768ca36..13eec7a1a9db 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>  			   cpu.o firmware.o init.o map.o devres.o \
>  			   attribute_container.o transport_class.o \
>  			   topology.o container.o property.o cacheinfo.o \
> -			   swnode.o
> +			   swnode.o virtual.o
>  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>  obj-y			+= power/
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 8cf04a557bdb..1eb68e416ee1 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -137,6 +137,7 @@ int hypervisor_init(void);
>  static inline int hypervisor_init(void) { return 0; }
>  #endif
>  int platform_bus_init(void);
> +int virtual_bus_init(void);
>  void cpu_dev_init(void);
>  void container_dev_init(void);
>  #ifdef CONFIG_AUXILIARY_BUS
> diff --git a/drivers/base/init.c b/drivers/base/init.c
> index c4954835128c..58c98a156220 100644
> --- a/drivers/base/init.c
> +++ b/drivers/base/init.c
> @@ -35,6 +35,7 @@ void __init driver_init(void)
>  	of_core_init();
>  	platform_bus_init();
>  	auxiliary_bus_init();
> +	virtual_bus_init();
>  	memory_dev_init();
>  	node_dev_init();
>  	cpu_dev_init();
> diff --git a/drivers/base/virtual.c b/drivers/base/virtual.c
> new file mode 100644
> index 000000000000..b05db4618d5c
> --- /dev/null
> +++ b/drivers/base/virtual.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" virtual bus that allows devices to be created and added
> + * automatically to it.  Whenever you need a device that is not "real",
> + * use this interface instead of even thinking of using a platform device.
> + *
> + */
> +#include <linux/device/virtual.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include "base.h"
> +
> +/*
> + * Internal rapper structure so we can hold the memory

I guess having an internal "rapper" does make the interface even cooler! :-)

> + * for the driver and the name string of the virtual device.
> + */
> +struct virtual_object {
> +	struct virtual_device virt_dev;
> +	struct device_driver driver;
> +	const struct virtual_driver_ops *virt_ops;
> +	char name[];
> +};
> +#define to_virtual_object(x) container_of_const(dev, struct virtual_object, virt_dev.dev);
> +
> +static struct device virtual_bus = {
> +	.init_name	= "virt_bus",
> +};
> +
> +static int virtual_match(struct device *dev, const struct device_driver *drv)
> +{
> +	struct virtual_object *virt_obj = to_virtual_object(dev);
> +
> +	dev_info(dev, "%s: driver: %s\n", __func__, drv->name);
> +
> +	/* Match is simple, strcmp()! */
> +	return (strcmp(virt_obj->name, drv->name) == 0);
> +}
> +
> +static int virtual_probe(struct device *dev)
> +{
> +	struct virtual_object *virt_obj = to_virtual_object(dev);
> +	struct virtual_device *virt_dev = &virt_obj->virt_dev;
> +	const struct virtual_driver_ops *virt_ops = virt_obj->virt_ops;
> +	int ret = 0;
> +
> +	dev_info(dev, "%s\n", __func__);
> +
> +	if (virt_ops->probe)
> +		ret = virt_ops->probe(virt_dev);
> +
> +	return ret;
> +}
> +
> +static void virtual_remove(struct device *dev)
> +{
> +	struct virtual_object *virt_obj = to_virtual_object(dev);
> +	struct virtual_device *virt_dev = &virt_obj->virt_dev;
> +	const struct virtual_driver_ops *virt_ops = virt_obj->virt_ops;
> +
> +	dev_info(dev, "%s\n", __func__);
> +
> +	if (virt_ops->remove)
> +		virt_ops->remove(virt_dev);
> +}
> +
> +static const struct bus_type virtual_bus_type = {
> +	.name		= "virtual",
> +	.match		= virtual_match,
> +	.probe		= virtual_probe,
> +	.remove		= virtual_remove,
> +};
> +
> +static void virtual_device_release(struct device *dev)
> +{
> +	struct virtual_object *virt_obj = to_virtual_object(dev);
> +	struct device_driver *drv = &virt_obj->driver;
> +
> +	/*
> +	 * Now that the device is going away, it has been unbound from the
> +	 * driver we created for it, so it is safe to unregister the driver from
> +	 * the system.
> +	 */
> +	driver_unregister(drv);

This is probably becoming non-trivial if we allow multiple devices to be created
for the driver.

> +
> +	kfree(virt_obj);
> +}
> +
> +/**
> + * __virtual_device_create - create and register a virtual device and driver
> + * @virt_ops: struct virtual_driver_ops that the new device will call back into
> + * @name: name of the device and driver we are adding
> + * @owner: module owner of the device/driver
> + *
> + * Create a new virtual device and driver, both with the same name, and register
> + * them in the driver core properly.  The probe() callback of @virt_ops will be
> + * called with the new device that is created for the caller to do something
> + * with.
> + */
> +struct virtual_device *__virtual_device_create(struct virtual_driver_ops *virt_ops,
> +					       const char *name, struct module *owner)
> +{
> +	struct device_driver *drv;
> +	struct device *dev;
> +	struct virtual_object *virt_obj;
> +	struct virtual_device *virt_dev;
> +	int ret;
> +
> +	pr_info("%s: %s\n", __func__, name);
> +
> +	virt_obj = kzalloc(sizeof(*virt_obj) + strlen(name) + 1, GFP_KERNEL);
> +	if (!virt_obj)
> +		return NULL;
> +
> +	/* Save off the name of the object into local memory */
> +	strcpy(virt_obj->name, name);
> +
> +	/* Initialize the driver portion and register it with the driver core */
> +	virt_obj->virt_ops = virt_ops;

I wonder if it would make sense to allow NULL for virt_ops and use default ops
in this case.

This could be useful for the Rust side of things, since then we could probably
avoid having a virtual bus abstraction and instead would only need an
abstraction of __virtual_device_create() itself.

However, this is probalby only convenient for when we have a single device /
driver, but not multiple devices for a single driver.

The more I think about it, the less I think it's a good idea, since it'd
probably trick people into coming up with questionable constructs...

> +	drv = &virt_obj->driver;
> +
> +	drv->owner = owner;
> +	drv->name = virt_obj->name;
> +	drv->bus = &virtual_bus_type;
> +	drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
> +
> +	ret = driver_register(drv);
> +	if (ret) {
> +		pr_err("%s: driver_register for %s virtual driver failed with %d\n",
> +		       __func__, name, ret);
> +		kfree(virt_obj);
> +		return NULL;
> +	}
> +
> +	/* Initialize the device portion and register it with the driver core */
> +	virt_dev = &virt_obj->virt_dev;
> +	dev = &virt_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release = virtual_device_release;
> +	dev->parent = &virtual_bus;
> +	dev->bus = &virtual_bus_type;
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for %s virtual device failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	return virt_dev;
> +}
> +EXPORT_SYMBOL_GPL(__virtual_device_create);
