Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1E2054FA;
	Tue,  4 Feb 2025 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663696; cv=none; b=RF+OqNgLYBSBADedvdTsyG6nLXf7dS96mxOkYhkBG35PWNe8p3s+tkIp4kp9yycCqvFfZqWRo/UBanfZW+0vJenCKOVPoG7bdOCpwv8jyodmwUhnQMae68Yl12vZcigxE/0wXBDE4Vaxd1EoNl3HX1XH/sFYe+VhoXNNIaoQKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663696; c=relaxed/simple;
	bh=isceCHChWGayOfBjFe+bObKOe1E6SM3BNFPrIMvWhEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqaNR2VWXUMYw/CBcsEZ0TXzkllYU39rSE1++uCbdURRyQMbTpgmT4s+PXEXiNmLTUYSNrGIlcntBxUZYyZuBguY9TSdn1ArAfgghinhFSijcWG1E9oOUeyCs87HmDN1y92wkePk3TDi+rDGHv/H/GNdQPp+CceQav6iZJCPolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=o1aCn+w3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="o1aCn+w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738663691;
	bh=isceCHChWGayOfBjFe+bObKOe1E6SM3BNFPrIMvWhEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1aCn+w3TTXJmN4f9oHab1qZCR+6NoDWOAWPDOJQYyhCp+LZYEvo9MT5OmuAH7RnR
	 R1M2hRjImW7sV3Oancf1WR26D8b+P5X1TShNTgCBxYGCprFCMXWeI+3z49XZvKpBih
	 /ULY00QGABhXo1dAgbT3f3+8m47AA/yRjceSYVgE=
Date: Tue, 4 Feb 2025 11:08:11 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <127f992b-1c53-49e1-8939-65b1d086fac5@t-8ch.de>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020326-backer-vendetta-7094@gregkh>

On 2025-02-03 15:25:17+0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/base/Makefile       |   2 +-
>  drivers/base/base.h         |   1 +
>  drivers/base/faux.c         | 189 ++++++++++++++++++++++++++++++++++++
>  drivers/base/init.c         |   1 +
>  include/linux/device/faux.h |  33 +++++++
>  5 files changed, 225 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h

<snip>

> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> new file mode 100644
> index 000000000000..0eba89a5cd57
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> + * Copyright (c) 2025 The Linux Foundation
> + *
> + * A "simple" faux bus that allows devices to be created and added
> + * automatically to it.  Whenever you need a device that is not "real",
> + * use this interface instead of even thinking of using a platform device.
> + *
> + */
> +#include <linux/device/faux.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include "base.h"
> +
> +/*
> + * Internal wrapper structure so we can hold the memory
> + * for the driver and the name string of the faux device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	struct device_driver driver;
> +	const struct faux_driver_ops *faux_ops;
> +	char name[];
> +};
> +#define to_faux_object(x) container_of_const(dev, struct faux_object, faux_dev.dev);
> +
> +static struct device faux_bus_root = {
> +	.init_name	= "faux_bus",
> +};
> +
> +static int faux_match(struct device *dev, const struct device_driver *drv)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +
> +	/* Match is simple, strcmp()! */
> +	return (strcmp(faux_obj->name, drv->name) == 0);
> +}
> +
> +static int faux_probe(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
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
> +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> +
> +	if (faux_ops && faux_ops->remove)
> +		faux_ops->remove(faux_dev);
> +}
> +
> +static const struct bus_type faux_bus_type = {
> +	.name		= "faux_bus",

Is the _bus suffix intentional?
Other busses don't have it.

> +	.match		= faux_match,
> +	.probe		= faux_probe,
> +	.remove		= faux_remove,
> +};
> +
> +static void faux_device_release(struct device *dev)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +	struct device_driver *drv = &faux_obj->driver;
> +
> +	/*
> +	 * Now that the device is going away, it has been unbound from the
> +	 * driver we created for it, so it is safe to unregister the driver from
> +	 * the system.
> +	 */
> +	driver_unregister(drv);
> +
> +	kfree(faux_obj);
> +}
> +
> +/**
> + * __faux_device_create - create and register a faux device and driver
> + * @name: name of the device and driver we are adding
> + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> + * @owner: module owner of the device/driver
> + *
> + * Create a new faux device and driver, both with the same name, and register
> + * them in the driver core properly.  The probe() callback of @faux_ops will be
> + * called with the new device that is created for the caller to do something
> + * with.
> + */
> +struct faux_device *__faux_device_create(const char *name,
> +					       struct faux_driver_ops *faux_ops,

const

> +					       struct module *owner)

What about attributes?

> +{
> +	struct device_driver *drv;
> +	struct device *dev;
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	int ret;
> +
> +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> +	if (!faux_obj)
> +		return NULL;
> +
> +	/* Save off the name of the object into local memory */
> +	strcpy(faux_obj->name, name);
> +
> +	/* Initialize the driver portion and register it with the driver core */
> +	faux_obj->faux_ops = faux_ops;
> +	drv = &faux_obj->driver;
> +
> +	drv->owner = owner;
> +	drv->name = faux_obj->name;

Assuming most names are constant, this would be better with kstrdup_const().
Which is also used by dev_set_name() under the hood.

> +	drv->bus = &faux_bus_type;
> +	drv->probe_type = PROBE_PREFER_ASYNCHRONOUS;
> +
> +	ret = driver_register(drv);
> +	if (ret) {
> +		pr_err("%s: driver_register for %s faux driver failed with %d\n",
> +		       __func__, name, ret);
> +		kfree(faux_obj);
> +		return NULL;
> +	}
> +
> +	/* Initialize the device portion and register it with the driver core */
> +	faux_dev = &faux_obj->faux_dev;
> +	dev = &faux_dev->dev;
> +
> +	device_initialize(dev);
> +	dev->release = faux_device_release;
> +	dev->parent = &faux_bus_root;
> +	dev->bus = &faux_bus_type;
> +	dev_set_name(dev, "%s", name);
> +
> +	ret = device_add(dev);
> +	if (ret) {
> +		pr_err("%s: device_add for %s faux device failed with %d\n",
> +		       __func__, name, ret);
> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	return faux_dev;
> +}
> +EXPORT_SYMBOL_GPL(__faux_device_create);

<snip>
