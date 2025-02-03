Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A5209F46;
	Mon,  3 Feb 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596949; cv=none; b=fLlvudZ9M7SEQPhhF3foeo1kdLR6muxC+IiqhQ2z63KCr7tHonf+zNv/zL7Yfg7dy8xQ6LdNeVSSQlpNVw63DR9a6gkoOrZH41TK1Xf6Xla56nzcY77KO/wsPrzHIKKuGvWUK4raCYk42EE3oZEkK21Z0U21jY2gi/ZBZNtj+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596949; c=relaxed/simple;
	bh=8pM+c7QBDyH2vUswp/7fZ+2pllmIy0tVn+gEwVNo0sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPkvqskdBg8mWA0Sp82ACC0b3Fv53hr1dlitXzGv61SQBSKlozypL5wktNvBXHKa8n6qJYDwqJn6iyn7EMusej43rxi9ZIx5CBTUPyDTM0maD8khmi3t0OxqgY7i0s+b+oivJGyIhWQHFMvvpuvCDwD5ctUUWjwalcolHCACNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lrwX++1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lrwX++1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E3EC4CED2;
	Mon,  3 Feb 2025 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738596948;
	bh=8pM+c7QBDyH2vUswp/7fZ+2pllmIy0tVn+gEwVNo0sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrwX++1AsvZW/JrlixMh9boM+dU5zTuAfjM9wEog2ejR34cNwgMxRbVuoprGdXPa8
	 XcwyF+iziBBfpxSedTYQC+Dp7CxgubwO1egdwtgYllgGxB2i2Jlv4U69FrLrQrbyzE
	 WlKBcN/GToZRHmBwDR3xxOcBj2XyEFyjVWj5IRHM=
Date: Mon, 3 Feb 2025 16:35:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020300-gown-outmatch-1343@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6DchyPieQKBJ0SN@smile.fi.intel.com>

On Mon, Feb 03, 2025 at 05:11:03PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 03:25:17PM +0100, Greg Kroah-Hartman wrote:
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> 
> ...
> 
> > +#include <linux/device/faux.h>
> 
> I would rather think that this goes after generic inclusions...
> 
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> 
> ...somewhere here.
> 
> But looking into organisation of device.h and device/*.h,
> I would rather think of the linux/faux_device.h.

It can go anywhere, there is no need to sort things :)

> > +#include "base.h"
> 
> I don't remember by heart what it does include, I would go with IWYU principle
> and list above all what we use.
> 
> container_of.h
> device.h
> export.h
> printk.h
> types.h

That's not what the driver core ever did, so no need to worry about it,
thanks.


> 
> ...
> 
> > +static int faux_match(struct device *dev, const struct device_driver *drv)
> > +{
> > +	struct faux_object *faux_obj = to_faux_object(dev);
> > +
> > +	/* Match is simple, strcmp()! */
> > +	return (strcmp(faux_obj->name, drv->name) == 0);
> 
> Outer parentheses are not needed.

Makes me feel good as it is an assignment test, and that's what
platform.c has for the past few decades.


> > +/**
> > + * __faux_device_create - create and register a faux device and driver
> > + * @name: name of the device and driver we are adding
> > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > + * @owner: module owner of the device/driver
> > + *
> > + * Create a new faux device and driver, both with the same name, and register
> > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > + * called with the new device that is created for the caller to do something
> > + * with.
> 
> The kernel-doc will complain on missing Return: section.

Is that new?  Does that mean platform.c has lots of complaints in it as
well?  What does platform_find_device_by_driver() give you for a
documentation issue?

And as I didn't hook this up to the kernel documentation build yet, it
shouldn't produce any warnings anywhere :)

> > + */
> > +struct faux_device *__faux_device_create(const char *name,
> > +					       struct faux_driver_ops *faux_ops,
> > +					       struct module *owner)
> > +{
> > +	struct device_driver *drv;
> > +	struct device *dev;
> > +	struct faux_object *faux_obj;
> > +	struct faux_device *faux_dev;
> > +	int ret;
> 
> > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> 
> Potential overflow. To avoid one may use struct_size() from overflow.h.

Users should not be providing the string here.  Again, this comes from
platform.c.

> > +#ifndef _FAUX_DEVICE_H_
> > +#define _FAUX_DEVICE_H_
> 
> > +#include <linux/module.h>
> 
> + container_of.h

Not needed to compile this file, only if someone uses the #define in it.

thanks,

greg k-h
