Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166F209F59;
	Mon,  3 Feb 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598729; cv=none; b=j0QjoupAZ5PZekIeKVOGY7s0k+xGvKxc9w/PCvSII+xp/uYfoOPDjKsvQJQDEfZonqOzvLbaH2nSlRz0zOCuWb4l7TlQS6Cr2AddwCcmyBGwjDroauaPsL8fhoZhKzf1KndQcrDmy1npK0oOjvyhBzcLOHp3g7gjVxoMXFyGW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598729; c=relaxed/simple;
	bh=JmslxJA2fjFMi7nttNzaHcbBfd4y4KfrDWTSER4FPXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iH4AfSCG+TlxubjF2yiWO+9oJq/WZqoGat6UwWGB76JYMyT5t6kEPIKwak2RAT3UfkqOug6VMVpBbYYzojcDw11+FD8ZQYQxEL6bFKTJnJXauNocFUN/OeRyU9hWGLevLkvrxYDRKcgLCh8np6P0ws+GNQwfUxRNCw5bQK/1EUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5Pm5HYe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5Pm5HYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738598728; x=1770134728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JmslxJA2fjFMi7nttNzaHcbBfd4y4KfrDWTSER4FPXg=;
  b=a5Pm5HYekjtW03cC3QvWsUcyLF06twrfVJQOW7ZvHfw89F0b+YnCB4I9
   4vM5Q683QxtUfENVvmRMJH3L12ps/nXlvJPP3HUEWfRxITCLAh/25L6hL
   33TnWx9qMQYsUefi6/c1w99XephqRznXRTbFAMRgP8AKv+kTNJYMnH5y+
   vldb1pPP/rqwuToDS/JBM4gQ5F2IZKaAayx7W5o9fdA1YYlqd30Jf2V3d
   cmc6khSZPw2CErNhezJ9tUMHwQ8ofPO8XYjkWSAF0CDe1iAHOVYxGjhLU
   LyoA+ycKhhbNJQ9e1tZhW1ewPUlx9Dhza+pYUJ/cGciVS91JUJPU/ZSBE
   w==;
X-CSE-ConnectionGUID: 9Sgtflv2QjOuo9SL61XD0A==
X-CSE-MsgGUID: hUsABqRnTCaaJw1qX9RZkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50088630"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="50088630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:05:27 -0800
X-CSE-ConnectionGUID: pX9Nvzl6R/CKAGMQW6cj7A==
X-CSE-MsgGUID: idTCIxQ4RTu4LDr6/DOHlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111174235"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:05:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1teywq-00000007shN-0XUN;
	Mon, 03 Feb 2025 18:05:20 +0200
Date: Mon, 3 Feb 2025 18:05:19 +0200
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
Message-ID: <Z6DpP3qMNYZoKEP2@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <Z6DchyPieQKBJ0SN@smile.fi.intel.com>
 <2025020300-gown-outmatch-1343@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020300-gown-outmatch-1343@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 04:35:45PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 05:11:03PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 03, 2025 at 03:25:17PM +0100, Greg Kroah-Hartman wrote:

...

> > > +#include <linux/device/faux.h>
> > 
> > I would rather think that this goes after generic inclusions...
> > 
> > > +#include <linux/err.h>
> > > +#include <linux/init.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/string.h>
> > 
> > ...somewhere here.
> > 
> > But looking into organisation of device.h and device/*.h,
> > I would rather think of the linux/faux_device.h.
> 
> It can go anywhere, there is no need to sort things :)

It's not about sorting, it's about grouping from more generic to less generic.

> > > +#include "base.h"
> > 
> > I don't remember by heart what it does include, I would go with IWYU principle
> > and list above all what we use.
> > 
> > container_of.h
> > device.h
> > export.h
> > printk.h
> > types.h
> 
> That's not what the driver core ever did, so no need to worry about it,
> thanks.

But it doesn't mean that driver code does its best. No big worries, of course.

...

> > > +	return (strcmp(faux_obj->name, drv->name) == 0);
> > 
> > Outer parentheses are not needed.
> 
> Makes me feel good as it is an assignment test, and that's what
> platform.c has for the past few decades.

Sure, it also can be written as

	return !strcmp(faux_obj->name, drv->name);

that makes the same without explicit comparing to 0. But it's matter of taste.

...

> > > +/**
> > > + * __faux_device_create - create and register a faux device and driver
> > > + * @name: name of the device and driver we are adding
> > > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > > + * @owner: module owner of the device/driver
> > > + *
> > > + * Create a new faux device and driver, both with the same name, and register
> > > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > > + * called with the new device that is created for the caller to do something
> > > + * with.
> > 
> > The kernel-doc will complain on missing Return: section.
> 
> Is that new?  Does that mean platform.c has lots of complaints in it as
> well?  What does platform_find_device_by_driver() give you for a
> documentation issue?
> 
> And as I didn't hook this up to the kernel documentation build yet, it
> shouldn't produce any warnings anywhere :)

I would rather say it's old.

Run

	kernel-doc -Wall -none -v ...your file...

and find the warning. During the kernel builds this is moved to extra warnings.

> > > + */

...

> > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > 
> > Potential overflow. To avoid one may use struct_size() from overflow.h.
> 
> Users should not be providing the string here.  Again, this comes from
> platform.c.

I'm not sure I follow. The name parameter is not limited anyhow, so one may
provide non-terminated string and strlen() will return an arbitrary number.
Potentially this can lead to big numbers and become an overflow when gets
to a parameter for kmalloc(). This most likely never happen in real life,
but still the overflow is possible.

-- 
With Best Regards,
Andy Shevchenko


