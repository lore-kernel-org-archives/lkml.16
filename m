Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99395215776;
	Tue,  4 Feb 2025 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687881; cv=none; b=ReTCTI/WcdXNaz+6sxx2d/PRtOBdnNHAt5nEDncw+T84Jg92ScdZ4Z7xXKAKeTydq2580ry+ar6BtJBu9kv0FuSfu6tXrHrvxz9Rx+aJdCzIVFFe7Spz0nYQciR2d38lelUsLph1QCSC+iMElpCuekCvx9yTPl3rBCZN02pmnb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687881; c=relaxed/simple;
	bh=72lyvzbkOWCoWrejdv+Om5NJfaD1Lw1U67vX17qNFN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYXEVcTd29/gGDsFqovs09lg0JItKAS9pyxcnYi/J2v9w8I3Fjgljh0MhogiewUFzof1UfIEpwTgbESX7p2NUnV/SD/YBas5wzfsTa1AdBPjCukuvTbLl2OaRcDbG0io8OW3oiD6f2Jo7rPM+TnBZ+7TNNV/xDpYvqqHK+P2s1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw+i5l0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw+i5l0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6A1C4CEDF;
	Tue,  4 Feb 2025 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738687881;
	bh=72lyvzbkOWCoWrejdv+Om5NJfaD1Lw1U67vX17qNFN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hw+i5l0xwGyxokCg+CsjU84EXKNdTN5eRpo6t0USLhWWFK+nMkbrVfEn7e5FrFtWV
	 RlgAYc8ASrK9JMdRS3L2VwpEECf+J/hcqvrr2we9tq2upNF4LSMB/LLHiOqQ5fsI8S
	 qX2GMIUolB+ThTOetlnqeOXSuOK9qvbL1Y8PZC0d5Z98TV2xq6CKfq6Z+1bRBIdFIk
	 tvtpikgG55bYBeLbXXDWXQhLu5BC2YB5XXmrUdUKZNlI0wqkMbFWhyHlOWxCB0nknt
	 5L4UNvxdWuPQudGwsG4OQyL8GF2l/C6/lu0zssJVo1NOoO8vP5AnoetVodjamxsrIj
	 2YcBKbRZ8GM1g==
Date: Tue, 4 Feb 2025 10:51:20 -0600
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <20250204165120.GA2994503-robh@kernel.org>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <20250204164650.GA2970208-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204164650.GA2970208-robh@kernel.org>

On Tue, Feb 04, 2025 at 10:46:50AM -0600, Rob Herring wrote:
> On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  v2: - renamed bus and root device to just "faux" thanks to Thomas
> >      - removed the one-driver-per-device and now just have one driver
> >        entirely thanks to Danilo
> >      - kerneldoc fixups and additions and string handling bounds checks
> >        hanks to Andy
> >      - coding style fix thanks to Jonathan
> >      - tested that the destroy path actually works
> > 
> >  drivers/base/Makefile       |   2 +-
> >  drivers/base/base.h         |   1 +
> >  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
> >  drivers/base/init.c         |   1 +
> >  include/linux/device/faux.h |  31 ++++++
> >  5 files changed, 230 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/base/faux.c
> >  create mode 100644 include/linux/device/faux.h
> > 
> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> > index 7fb21768ca36..8074a10183dc 100644
> > --- a/drivers/base/Makefile
> > +++ b/drivers/base/Makefile
> > @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
> >  			   cpu.o firmware.o init.o map.o devres.o \
> >  			   attribute_container.o transport_class.o \
> >  			   topology.o container.o property.o cacheinfo.o \
> > -			   swnode.o
> > +			   swnode.o faux.o
> >  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
> >  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
> >  obj-y			+= power/
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index 8cf04a557bdb..0042e4774b0c 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -137,6 +137,7 @@ int hypervisor_init(void);
> >  static inline int hypervisor_init(void) { return 0; }
> >  #endif
> >  int platform_bus_init(void);
> > +int faux_bus_init(void);
> >  void cpu_dev_init(void);
> >  void container_dev_init(void);
> >  #ifdef CONFIG_AUXILIARY_BUS
> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> > new file mode 100644
> > index 000000000000..9b28643afc45
> > --- /dev/null
> > +++ b/drivers/base/faux.c
> > @@ -0,0 +1,196 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > + * Copyright (c) 2025 The Linux Foundation
> > + *
> > + * A "simple" faux bus that allows devices to be created and added
> > + * automatically to it.  This is to be used whenever you need to create a
> > + * device that is not associated with any "real" system resources, and do
> > + * not want to have to deal with a bus/driver binding logic.  It is
> > + * intended to be very simple, with only a create and a destroy function
> > + * available.
> > + */
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device/faux.h>
> > +#include "base.h"
> > +
> > +#define MAX_NAME_SIZE	256	/* Max size of a faux_device name */
> > +
> > +/*
> > + * Internal wrapper structure so we can hold the memory
> > + * for the driver and the name string of the faux device.
> > + */
> > +struct faux_object {
> > +	struct faux_device faux_dev;
> > +	const struct faux_driver_ops *faux_ops;
> > +	char name[];
> > +};
> > +#define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
> > +
> > +static struct device faux_bus_root = {
> > +	.init_name	= "faux",
> > +};
> > +
> > +static int faux_match(struct device *dev, const struct device_driver *drv)
> > +{
> > +	/* Match always succeeds, we only have one driver */
> > +	return 1;
> > +}
> > +
> > +static int faux_probe(struct device *dev)
> > +{
> > +	struct faux_object *faux_obj = to_faux_object(dev);
> > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> > +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> > +	int ret = 0;
> > +
> > +	if (faux_ops && faux_ops->probe)
> 
> Is there any use for faux_ops being NULL (or probe being NULL for that 
> matter)? I can't think of one. So faux_device_create should check that 
> and fail instead of checking here.

NM, I see your converted cases do just that. Weird.

I suppose you could still say if faux_ops is not NULL, then probe must 
not be NULL.

Rob
