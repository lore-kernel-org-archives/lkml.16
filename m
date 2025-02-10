Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59D24BCF8;
	Mon, 10 Feb 2025 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201786; cv=none; b=Wn+W5v5WeucLQCi6cVQLX6a+drNY/EY3M4PGKSaCyYIp+6mWFIYBLqmO/jKKpRUXURfcips7wV2+0fpdcZXTultWhrVyxMuOcskILnrAZ4M7p4SaI2Ar3HxOoJsvs51DZcnbbYFA3gc2yiZ7OxDB3EAI8KI3se4Nj+Dt/2DbVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201786; c=relaxed/simple;
	bh=PxeAiu2WJvX9/956GtEvE8qRahqK2QR+SVDQ5+yxcoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hm8bJWguGYgO6Y2cyKEkV9WELgwNSVQsF2LZ004uFlhFrcVsdiv9lOL8Xu7VeoHJvtm0PvYvtuIMv+6yOWlDWXBmYrZmZrAWMd3klY8lF8A7AWHsNCUNc2BZKGK5JGGaF/Y6GJqT+Ypp5OpqdCE87NoeaW5ykozJ4QAj7j6YAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ec0xw/lq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ec0xw/lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F97C4CED1;
	Mon, 10 Feb 2025 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739201786;
	bh=PxeAiu2WJvX9/956GtEvE8qRahqK2QR+SVDQ5+yxcoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ec0xw/lqXmw3InjLNkPsC2CyPeAk393kvaOzfL1dmZ5kihyzDwvR6N3gNbT7b4dOg
	 l8lOlzk4C8MQ+hpZTOrkn75lnrKgnx5hahg2bo6emTN5f0rLr/+9AaZTAttSGcUIHt
	 BtFkxMMSj6MZmyAaY68BcggFTMW7MHWvBMfBNuhg=
Date: Mon, 10 Feb 2025 16:36:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025021028-showgirl-waviness-b4bf@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com>
 <2025021038-pushy-prior-5dfd@gregkh>
 <D7OURQCZ3I1X.85BUFMYU6H8A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D7OURQCZ3I1X.85BUFMYU6H8A@gmail.com>

On Mon, Feb 10, 2025 at 09:58:24AM -0500, Kurt Borja wrote:
> On Mon Feb 10, 2025 at 9:45 AM -05, Greg Kroah-Hartman wrote:
> > On Mon, Feb 10, 2025 at 09:29:52AM -0500, Kurt Borja wrote:
> >> Hi Greg,
> >> 
> >> On Mon Feb 10, 2025 at 7:30 AM -05, Greg Kroah-Hartman wrote:
> >> > Many drivers abuse the platform driver/bus system as it provides a
> >> > simple way to create and bind a device to a driver-specific set of
> >> > probe/release functions.  Instead of doing that, and wasting all of the
> >> > memory associated with a platform device, here is a "faux" bus that
> >> > can be used instead.
> >> >
> >> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> >> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >> > Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > ---
> >> > v4: - really removed the name logic
> >> >     - added #include <linux/container_of.h> to faux.h
> >> >     - added parent pointer to api call
> >> >     - minor documentation updates
> >> >     - made probe synchronous
> >> > v3: - loads of documentation updates and rewrites
> >> >     - added to the documentation build
> >> >     - removed name[] array as it's no longer needed
> >> >     - added faux_device_create_with_groups()
> >> >     - added functions to get/set devdata
> >> >     - renamed faux_driver_ops -> faux_device_ops
> >> >     - made faux_device_ops a const *
> >> >     - minor cleanups
> >> >     - tested it, again.
> >> >
> >> > v2: - renamed bus and root device to just "faux" thanks to Thomas
> >> >     - removed the one-driver-per-device and now just have one driver
> >> >       entirely thanks to Danilo
> >> >     - kerneldoc fixups and additions and string handling bounds checks
> >> >       thanks to Andy
> >> >     - coding style fix thanks to Jonathan
> >> >     - tested that the destroy path actually works
> >> >  Documentation/driver-api/infrastructure.rst |   6 +
> >> >  drivers/base/Makefile                       |   2 +-
> >> >  drivers/base/base.h                         |   1 +
> >> >  drivers/base/faux.c                         | 232 ++++++++++++++++++++
> >> >  drivers/base/init.c                         |   1 +
> >> >  include/linux/device/faux.h                 |  69 ++++++
> >> >  6 files changed, 310 insertions(+), 1 deletion(-)
> >> >  create mode 100644 drivers/base/faux.c
> >> >  create mode 100644 include/linux/device/faux.h
> >> >
> >> > diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
> >> > index 3d52dfdfa9fd..35e36fee4238 100644
> >> > --- a/Documentation/driver-api/infrastructure.rst
> >> > +++ b/Documentation/driver-api/infrastructure.rst
> >> > @@ -41,6 +41,12 @@ Device Drivers Base
> >> >  .. kernel-doc:: drivers/base/class.c
> >> >     :export:
> >> >  
> >> > +.. kernel-doc:: include/linux/device/faux.h
> >> > +   :internal:
> >> > +
> >> > +.. kernel-doc:: drivers/base/faux.c
> >> > +   :export:
> >> > +
> >> >  .. kernel-doc:: drivers/base/node.c
> >> >     :internal:
> >> >  
> >> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> >> > index 7fb21768ca36..8074a10183dc 100644
> >> > --- a/drivers/base/Makefile
> >> > +++ b/drivers/base/Makefile
> >> > @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
> >> >  			   cpu.o firmware.o init.o map.o devres.o \
> >> >  			   attribute_container.o transport_class.o \
> >> >  			   topology.o container.o property.o cacheinfo.o \
> >> > -			   swnode.o
> >> > +			   swnode.o faux.o
> >> >  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
> >> >  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
> >> >  obj-y			+= power/
> >> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> >> > index 8cf04a557bdb..0042e4774b0c 100644
> >> > --- a/drivers/base/base.h
> >> > +++ b/drivers/base/base.h
> >> > @@ -137,6 +137,7 @@ int hypervisor_init(void);
> >> >  static inline int hypervisor_init(void) { return 0; }
> >> >  #endif
> >> >  int platform_bus_init(void);
> >> > +int faux_bus_init(void);
> >> >  void cpu_dev_init(void);
> >> >  void container_dev_init(void);
> >> >  #ifdef CONFIG_AUXILIARY_BUS
> >> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> >> > new file mode 100644
> >> > index 000000000000..531e9d789ee0
> >> > --- /dev/null
> >> > +++ b/drivers/base/faux.c
> >> > @@ -0,0 +1,232 @@
> >> > +// SPDX-License-Identifier: GPL-2.0-only
> >> > +/*
> >> > + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > + * Copyright (c) 2025 The Linux Foundation
> >> > + *
> >> > + * A "simple" faux bus that allows devices to be created and added
> >> > + * automatically to it.  This is to be used whenever you need to create a
> >> > + * device that is not associated with any "real" system resources, and do
> >> > + * not want to have to deal with a bus/driver binding logic.  It is
> >> > + * intended to be very simple, with only a create and a destroy function
> >> > + * available.
> >> > + */
> >> > +#include <linux/err.h>
> >> > +#include <linux/init.h>
> >> > +#include <linux/slab.h>
> >> > +#include <linux/string.h>
> >> > +#include <linux/container_of.h>
> >> > +#include <linux/device/faux.h>
> >> > +#include "base.h"
> >> > +
> >> > +/*
> >> > + * Internal wrapper structure so we can hold a pointer to the
> >> > + * faux_device_ops for this device.
> >> > + */
> >> > +struct faux_object {
> >> > +	struct faux_device faux_dev;
> >> > +	const struct faux_device_ops *faux_ops;
> >> > +};
> >> > +#define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
> >> > +
> >> > +static struct device faux_bus_root = {
> >> > +	.init_name	= "faux",
> >> > +};
> >> > +
> >> > +static int faux_match(struct device *dev, const struct device_driver *drv)
> >> > +{
> >> > +	/* Match always succeeds, we only have one driver */
> >> > +	return 1;
> >> > +}
> >> > +
> >> > +static int faux_probe(struct device *dev)
> >> > +{
> >> > +	struct faux_object *faux_obj = to_faux_object(dev);
> >> > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> >> > +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> >> > +	int ret = 0;
> >> > +
> >> > +	if (faux_ops && faux_ops->probe)
> >> > +		ret = faux_ops->probe(faux_dev);
> >> > +
> >> > +	return ret;
> >> > +}
> >> > +
> >> > +static void faux_remove(struct device *dev)
> >> > +{
> >> > +	struct faux_object *faux_obj = to_faux_object(dev);
> >> > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> >> > +	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
> >> > +
> >> > +	if (faux_ops && faux_ops->remove)
> >> > +		faux_ops->remove(faux_dev);
> >> > +}
> >> > +
> >> > +static const struct bus_type faux_bus_type = {
> >> > +	.name		= "faux",
> >> > +	.match		= faux_match,
> >> > +	.probe		= faux_probe,
> >> > +	.remove		= faux_remove,
> >> > +};
> >> > +
> >> > +static struct device_driver faux_driver = {
> >> > +	.name		= "faux_driver",
> >> > +	.bus		= &faux_bus_type,
> >> > +	.probe_type	= PROBE_FORCE_SYNCHRONOUS,
> >> > +};
> >> > +
> >> > +static void faux_device_release(struct device *dev)
> >> > +{
> >> > +	struct faux_object *faux_obj = to_faux_object(dev);
> >> > +
> >> > +	kfree(faux_obj);
> >> > +}
> >> > +
> >> > +/**
> >> > + * faux_device_create_with_groups - Create and register with the driver
> >> > + *		core a faux device and populate the device with an initial
> >> > + *		set of sysfs attributes.
> >> > + * @name:	The name of the device we are adding, must be unique for
> >> > + *		all faux devices.
> >> > + * @parent:	Pointer to a potential parent struct device.  If set to
> >> > + *		NULL, the device will be created in the "root" of the faux
> >> > + *		device tree in sysfs.
> >> > + * @faux_ops:	struct faux_device_ops that the new device will call back
> >> > + *		into, can be NULL.
> >> > + * @groups:	The set of sysfs attributes that will be created for this
> >> > + *		device when it is registered with the driver core.
> >> > + *
> >> > + * Create a new faux device and register it in the driver core properly.
> >> > + * If present, callbacks in @faux_ops will be called with the device that
> >> > + * for the caller to do something with at the proper time given the
> >> > + * device's lifecycle.
> >> > + *
> >> > + * Note, when this function is called, the functions specified in struct
> >> > + * faux_ops can be called before the function returns, so be prepared for
> >> > + * everything to be properly initialized before that point in time.
> >> > + *
> >> > + * Return:
> >> > + * * NULL if an error happened with creating the device
> >> > + * * pointer to a valid struct faux_device that is registered with sysfs
> >> > + */
> >> > +struct faux_device *faux_device_create_with_groups(const char *name,
> >> > +						   struct device *parent,
> >> > +						   const struct faux_device_ops *faux_ops,
> >> > +						   const struct attribute_group **groups)
> >> > +{
> >> > +	struct faux_object *faux_obj;
> >> > +	struct faux_device *faux_dev;
> >> > +	struct device *dev;
> >> > +	int ret;
> >> > +
> >> > +	faux_obj = kzalloc(sizeof(*faux_obj), GFP_KERNEL);
> >> > +	if (!faux_obj)
> >> > +		return NULL;
> >> > +
> >> > +	/* Save off the callbacks so we can use them in the future */
> >> > +	faux_obj->faux_ops = faux_ops;
> >> > +
> >> > +	/* Initialize the device portion and register it with the driver core */
> >> > +	faux_dev = &faux_obj->faux_dev;
> >> > +	dev = &faux_dev->dev;
> >> > +
> >> > +	device_initialize(dev);
> >> > +	dev->release = faux_device_release;
> >> > +	if (parent)
> >> > +		dev->parent = parent;
> >> > +	else
> >> > +		dev->parent = &faux_bus_root;
> >> > +	dev->bus = &faux_bus_type;
> >> > +	dev->groups = groups;
> >> > +	dev_set_name(dev, "%s", name);
> >> > +
> >> > +	ret = device_add(dev);
> >> > +	if (ret) {
> >> > +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
> >> > +		       __func__, name, ret);
> >> > +		put_device(dev);
> >> > +		return NULL;
> >> > +	}
> >> 
> >> Now that the probe is synchronous, what do you think about returning
> >> -ENODEV if the device failed to bind to the driver?
> >
> > Nope, that would make all callers have to deal with a pointer or a NULL,
> > or an error value encorporated in a pointer.
> 
> Right! I thought for a sec this function returned ERR_PTRs.
> 
> >
> >> This would be useful for modules that may want to unload if the probe
> >> fails.
> >
> > Then just test for NULL, there's nothing preventing that, right?
> 
> Please, correct me if I'm wrong. If the probe the user provided fails
> the device would still be added successfully to the bus. That means this
> function would return a valid pointer and the module has no way of
> knowing if the probe succeeded in an __init section.

Ah, yes, you are totally correct here.  You don't know if the probe
failed or not.  But your device is still "live" and you can only get rid
of it by calling faux_device_destroy(), all that might be wrong with it
is that it's not really associated with the bus.

You can still assign resources to it, AND the resources will be freed up
when the device goes away (see the comment in device_release() for
specifics as to this happening today for platform devices.)

I guess we can test for this and handle it, if you feel it is necessary,
it wouldn't be hard to do so, but let me add this later as it's the same
problem with platform devices and odds are we want to fix that issue up
there too, right?

> > Also, the only way probe can fail is if the probe you passed into the
> > call fails.  Or if you picked a name that is already in the system, both
> 
> Exactly. I'm thinking of modules that are very simple and just care
> about the probe succeeding, so having the device hanging around in the
> bus and the module loaded would be a waste of resources.

Modules usually don't need to do the probe callback at all.  I show one
example in this series (the regulator dummy driver), but it can be
easily rewritten to not need that at all.

And bonus, the rust binding doesn't allow you to provide a probe()
callback that could fail, so any code written using that will not have
this issue at all :)

thanks,

greg k-h
