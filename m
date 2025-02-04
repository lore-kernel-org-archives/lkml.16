Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593486324;
	Tue,  4 Feb 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687612; cv=none; b=RExNjAjZf4c0pOkyIa2FFg4bWShwDcMxmkuLLORO+pMlvUmDYFSxhAUb4ptpiETSi1IHxxDfa323T2ycXpcqFFgG73s1zcTNqrCj5dd9ylZM0qzXwUo0HemArR8jPxsOeAYjQlpBTK6o/FHhbt7Frz2TDVRQ9pxTaWBtnQHVeTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687612; c=relaxed/simple;
	bh=Qpz3C5E8nx1nBIJt7LETgccuu8y3fVUGdXH3J36Ck9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMDeeNXL20s9qrKx+MhQkyCn8D1WDWxaxnFKEDVlSYTxKaSm3CBFi1o243CGf872IEqoWXgjz/mexeb/WPhj9DgOrkcpB0RPqgJ0VwxTWKLNd/OMjmIByyNNEApxvAvdpS3JiPapGcds4doAy3yV5sSsKzJ3+2fnfKRxyEqlA38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgzK3u/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgzK3u/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91FAC4CEE8;
	Tue,  4 Feb 2025 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738687612;
	bh=Qpz3C5E8nx1nBIJt7LETgccuu8y3fVUGdXH3J36Ck9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgzK3u/6uvfPU2FUzh3OknpQHyRrmWDOsyGubSrg3Hd89XtJK6P/54sIrytIQ//GD
	 FzHd4EnRqwzjsltx3DUD2lAVwbrSMxhufk0yqgIcYAeOndculJVrO4PDNA7NeTOqlw
	 7HBiFGOEjy5otxDOlC8olPJFlBbfxMmGCEyo2CbDLGsMJzbI122GjB3C6+mNAYW/aY
	 ivh9yclT/CetOlEH/yxKU4bqPenqDXPn/nn4rNyVzEHM3l5nPatBeV0B3ckKaWp2pe
	 QhxNQgUwpFWBgkPceG+w72ofd6VqGjq3Mf67prrG2GG+ICvqUvoI3nTnL577QGRlP3
	 oZN1b5wa5ITug==
Date: Tue, 4 Feb 2025 10:46:50 -0600
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
Message-ID: <20250204164650.GA2970208-robh@kernel.org>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>

On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  v2: - renamed bus and root device to just "faux" thanks to Thomas
>      - removed the one-driver-per-device and now just have one driver
>        entirely thanks to Danilo
>      - kerneldoc fixups and additions and string handling bounds checks
>        hanks to Andy
>      - coding style fix thanks to Jonathan
>      - tested that the destroy path actually works
> 
>  drivers/base/Makefile       |   2 +-
>  drivers/base/base.h         |   1 +
>  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
>  drivers/base/init.c         |   1 +
>  include/linux/device/faux.h |  31 ++++++
>  5 files changed, 230 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h
> 
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 7fb21768ca36..8074a10183dc 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>  			   cpu.o firmware.o init.o map.o devres.o \
>  			   attribute_container.o transport_class.o \
>  			   topology.o container.o property.o cacheinfo.o \
> -			   swnode.o
> +			   swnode.o faux.o
>  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>  obj-y			+= power/
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
> index 000000000000..9b28643afc45
> --- /dev/null
> +++ b/drivers/base/faux.c
> @@ -0,0 +1,196 @@
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
> +
> +#define MAX_NAME_SIZE	256	/* Max size of a faux_device name */
> +
> +/*
> + * Internal wrapper structure so we can hold the memory
> + * for the driver and the name string of the faux device.
> + */
> +struct faux_object {
> +	struct faux_device faux_dev;
> +	const struct faux_driver_ops *faux_ops;
> +	char name[];
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
> +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> +	int ret = 0;
> +
> +	if (faux_ops && faux_ops->probe)

Is there any use for faux_ops being NULL (or probe being NULL for that 
matter)? I can't think of one. So faux_device_create should check that 
and fail instead of checking here.

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
> + * faux_device_create - create and register a faux device and driver
> + * @name: name of the device and driver we are adding
> + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> + *
> + * Create a new faux device and driver, both with the same name, and
> + * register them in the driver core properly.  The probe() callback of
> + * @faux_ops will be called with the new device that is created for the
> + * caller to do something with.
> + *
> + * Note, when this function is called, the functions specified in struct
> + * faux_ops will be called before the function returns, so be prepared for
> + * everything to be properly initialized before that point in time.
> + *
> + * Return:
> + * * NULL if an error happened with creating the device
> + * * pointer to a valid struct faux_device that is registered with sysfs
> + */
> +struct faux_device *faux_device_create(const char *name, struct faux_driver_ops *faux_ops)

const struct faux_driver_ops

Rob
