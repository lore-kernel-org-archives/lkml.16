Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193920ADC2;
	Mon,  3 Feb 2025 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595473; cv=none; b=qq+ZpcyorF6Jtvg4lkFB6vauCW3/XGWxqhdHTqZjuqb2oLWFsqfGaetG4NIyXypVjNtPIdNVwZ/NUcqetXjzAOwcPpnFiCoN/dvsWzZ9LRiFIa5jCoJAx6t5qAWoG9m/4uyeTtP7s5qnGwr1XjORPhWQvoHBVjM9EQNaGPNSabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595473; c=relaxed/simple;
	bh=WLEEb0McjFjYv9l3N1oroWUrPcZPt9ckkXk5duVP+7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEDFmWjzAGach2H4HrdYNSU1KMLYJiPJRA5c84qYRyIoIfADoVIum4tAU0nK03QLre7w1zbbu3yi21e/IVHu7A3/TMTSBo8to1g2zRnSrBXaFt65YJ5EsRvMC6+uY3YG1JC9pHGFzgmfu5seB9rNW31bZaj1lSXOambQxLKHk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU3OIsdo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU3OIsdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738595472; x=1770131472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WLEEb0McjFjYv9l3N1oroWUrPcZPt9ckkXk5duVP+7M=;
  b=bU3OIsdozQa33iOvowiCjSBFHmvG4+R5LLYypS7laYQSniAfbEXb+Fy3
   pJZSNjwU5n+HwSsLsXqGjqRyY5J4HWpMBytKEa7LTG4YmDVfAxKjhmnS6
   n4oPoHM2Bf6M4UfbqOLz/VDW0+TQsUjooDr989DN+lnxqmqS9lCECSDLr
   JiCDhDCcuSsgWwIiIaJMG2Zg2GVu/oKjjNvG6bCnmfJbN3iiZERfHkeHo
   y0YGwazae5+L1e6RPe6HtDiMzCx8MtpUppCcvVj+3rb2pMRMJ5AcmVfKL
   hUuteVKS6XDHKqvH6UEAogpfG9cndeIMZYphSdgZGcIVgCtVEuUBQ+Wxo
   g==;
X-CSE-ConnectionGUID: qH6CNY9NQF6B+Zi+3whjIg==
X-CSE-MsgGUID: 0M7idKvJTji79ha4AFMBYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38325143"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38325143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:11:11 -0800
X-CSE-ConnectionGUID: 8aPTbEjlQWOjRZvL2gpZ9Q==
X-CSE-MsgGUID: zMIxaKMDS62Kt1t500di+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110138264"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:11:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tey6J-00000007rsg-2sIe;
	Mon, 03 Feb 2025 17:11:03 +0200
Date: Mon, 3 Feb 2025 17:11:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 03:25:17PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.

...

> +#include <linux/device/faux.h>

I would rather think that this goes after generic inclusions...

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>

...somewhere here.

But looking into organisation of device.h and device/*.h,
I would rather think of the linux/faux_device.h.

> +#include "base.h"

I don't remember by heart what it does include, I would go with IWYU principle
and list above all what we use.

container_of.h
device.h
export.h
printk.h
types.h

...

> +static int faux_match(struct device *dev, const struct device_driver *drv)
> +{
> +	struct faux_object *faux_obj = to_faux_object(dev);
> +
> +	/* Match is simple, strcmp()! */
> +	return (strcmp(faux_obj->name, drv->name) == 0);

Outer parentheses are not needed.

> +}

...

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

The kernel-doc will complain on missing Return: section.

> + */
> +struct faux_device *__faux_device_create(const char *name,
> +					       struct faux_driver_ops *faux_ops,
> +					       struct module *owner)
> +{
> +	struct device_driver *drv;
> +	struct device *dev;
> +	struct faux_object *faux_obj;
> +	struct faux_device *faux_dev;
> +	int ret;

> +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);

Potential overflow. To avoid one may use struct_size() from overflow.h.

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

...

> +#ifndef _FAUX_DEVICE_H_
> +#define _FAUX_DEVICE_H_

> +#include <linux/module.h>

+ container_of.h

> +#include <linux/device.h>

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
> +#define faux_device_create(name, faux_ops) __faux_device_create(name, faux_ops, THIS_MODULE)
> +struct faux_device *__faux_device_create(const char *name,
> +					       struct faux_driver_ops *faux_ops,
> +					       struct module *module);
> +void faux_device_destroy(struct faux_device *faux_dev);
> +
> +#endif /* _FAUX_DEVICE_H_ */

-- 
With Best Regards,
Andy Shevchenko


