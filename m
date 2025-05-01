Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5528382
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103833; cv=none; b=F2OFtpK8DWkavI+PIWvCj5yEuDoU6SNXcYek+5xrgxzjlLD70UhFoGxU/wdzlFKo4RLRRhcCFXhfQjvHgIcrPZ1PsmzFlxHeNF8IVT4TShlPvK540wcW3UibUcWegSme9eCe3jO5/kXkJFS8oBzvmAhVBhpPUI7E/dZzSk4OLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103833; c=relaxed/simple;
	bh=ebeSIYNnShedlcadQ2bHIVVJVi05y0ivPJEJBNHOz6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kttIyVMJr6iAJ6Vh1CGB57KkKpYml29GS7VhnQotqDB/wSqdVZbhpegj5aoWnkiBPAC+yivjZ4BuTVafqyoiKNBEstp64F2KVCqHsv/+UFhgWAODGfCBD7pGNSj5uuwKSwTmA2MAMQGsHlekkbWxgGcdlF9L2yaje/v1Prh3Qxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6HbcxgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6HbcxgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29305C4CEE3;
	Thu,  1 May 2025 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746103832;
	bh=ebeSIYNnShedlcadQ2bHIVVJVi05y0ivPJEJBNHOz6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6HbcxgTgZBNuLpg4Ipu5mgeTMUB0+K2WUsXRaXywl7z+oBHsHtv7FQOXgKkWShL6
	 2+cETTGqfhmfc7g+T6DzuzeGsyeqiiqyz3DBrRGRsOvuax/VGcWdNS6DFxLXI49M68
	 Qr1Ol1UPpsMD0WmUbIxIVfhyqiaY1rjDA8squF9sOijXNzvftw+6SpwghzKfg5bV4f
	 brBvC1wuhyJ8XaftvpzDq0zBniAGwi2aKEXyYX/2LOLvyXpPeGIiQzsEOi/S1Vs9Zp
	 q4B+vFLybwRJbRYQLINzqoie59IDEMeDIbGr8AyLDWJf2ZYGyuYnCCsR7jpKN/i+d3
	 4Sz8HtDCqbfkg==
Date: Thu, 1 May 2025 13:50:28 +0100
From: Lee Jones <lee@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <20250501125028.GM1567507@google.com>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428060207.3170325-1-raag.jadav@intel.com>

On Mon, 28 Apr 2025, Raag Jadav wrote:

> Extend MFD subsystem to support auxiliary child device. This is useful
> for MFD usecases where parent device is on a discoverable bus and doesn't
> fit into the platform device criteria. Purpose of this implementation is
> to provide discoverable MFDs just enough infrastructure to register
> independent child devices without abusing the platform device.
> 
> Current support is limited to just PCI type MFDs, but this can be further
> extended to support other types like USB in the future.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> 
> v2: Introduce a shared struct mfd_aux_device
>     Introduce auxiliary device opt-in flag
> 
> v3: Fix device_type ABI breakage (Andy)
>     Aesthetic adjustments (Andy)
> 
> v4: s/mfd_aux/maux
>     Allow num_resources for child device (Andy)
>     Fix build warning (Andy)
> 
>  drivers/mfd/Kconfig      |   2 +-
>  drivers/mfd/Makefile     |   2 +-
>  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++

This looks like mostly duplicated platform device code.

If you are _certain_ that it needs to exist, you need to push it out to
the auxiliary subsystem and remove any traces of it being MFD related.

If it's needed by MFD, it'll be needed by other auxiliary users.  Even
if not now, sometime in the future.

>  drivers/mfd/mfd-core.c   | 192 +++++++++++++++++++++++++++++----------
>  include/linux/mfd/aux.h  |  38 ++++++++
>  include/linux/mfd/core.h |   3 +
>  6 files changed, 344 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/mfd/mfd-aux.c
>  create mode 100644 include/linux/mfd/aux.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 93773201a517..4c71a3f962c9 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -8,8 +8,8 @@ menu "Multifunction device drivers"
>  
>  config MFD_CORE
>  	tristate
> +	select AUXILIARY_BUS
>  	select IRQ_DOMAIN
> -	default n
>  
>  config MFD_CS5535
>  	tristate "AMD CS5535 and CS5536 southbridge core functions"
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f5291c4305ed..74f2b8a5231a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -120,7 +120,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> -obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
> +obj-$(CONFIG_MFD_CORE)		+= mfd-core.o mfd-aux.o
>  
>  ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
>  obj-$(CONFIG_MFD_OCELOT)	+= ocelot-soc.o
> diff --git a/drivers/mfd/mfd-aux.c b/drivers/mfd/mfd-aux.c
> new file mode 100644
> index 000000000000..795f2a6e0a8f
> --- /dev/null
> +++ b/drivers/mfd/mfd-aux.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MFD auxiliary device resources
> + *
> + * Copyright (c) 2025 Raag Jadav <raag.jadav@intel.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device/devres.h>
> +#include <linux/export.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/aux.h>
> +#include <linux/types.h>
> +
> +/**
> + * maux_get_resource - get a resource for maux device
> + * @maux: maux device
> + * @type: resource type
> + * @num: resource index
> + *
> + * Return: a pointer to the resource or NULL on failure.
> + */
> +struct resource *maux_get_resource(struct maux_device *maux, unsigned int type, unsigned int num)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < maux->num_resources; i++) {
> +		struct resource *r = &maux->resource[i];
> +
> +		if (type == resource_type(r) && num-- == 0)
> +			return r;
> +	}
> +	return NULL;
> +}
> +EXPORT_SYMBOL_NS_GPL(maux_get_resource, "MAUX_DEV");
> +
> +#ifdef CONFIG_HAS_IOMEM
> +/**
> + * devm_maux_get_and_ioremap_resource - get resource and call devm_ioremap_resource()
> + *					for maux device
> + *
> + * @maux: maux device to use both for memory resource lookup as well as
> + *        resource management
> + * @index: resource index
> + * @res: optional output parameter to store a pointer to the obtained resource.
> + *
> + * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
> + * on failure.
> + */
> +void __iomem *devm_maux_get_and_ioremap_resource(struct maux_device *maux, unsigned int index,
> +						 struct resource **res)
> +{
> +	struct resource *r;
> +
> +	r = maux_get_resource(maux, IORESOURCE_MEM, index);
> +	if (res)
> +		*res = r;
> +	return devm_ioremap_resource(&maux->auxdev.dev, r);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_maux_get_and_ioremap_resource, "MAUX_DEV");
> +
> +/**
> + * devm_maux_ioremap_resource - call devm_ioremap_resource() for maux device
> + *
> + * @maux: maux device to use both for memory resource lookup as well as
> + *        resource management
> + * @index: resource index
> + *
> + * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
> + * on failure.
> + */
> +void __iomem *devm_maux_ioremap_resource(struct maux_device *maux, unsigned int index)
> +{
> +	return devm_maux_get_and_ioremap_resource(maux, index, NULL);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_maux_ioremap_resource, "MAUX_DEV");
> +#endif
> +
> +/**
> + * maux_get_irq_optional - get an optional IRQ for maux device
> + * @maux: maux device
> + * @num: IRQ number index
> + *
> + * Gets an IRQ for a maux device. Device drivers should check the return value
> + * for errors so as to not pass a negative integer value to the request_irq()
> + * APIs. This is the same as maux_get_irq(), except that it does not print an
> + * error message if an IRQ can not be obtained.
> + *
> + * For example::
> + *
> + *		int irq = maux_get_irq_optional(maux, 0);
> + *		if (irq < 0)
> + *			return irq;
> + *
> + * Return: non-zero IRQ number on success, negative error number on failure.
> + */
> +int maux_get_irq_optional(struct maux_device *maux, unsigned int num)
> +{
> +	struct resource *r;
> +	int ret = -ENXIO;
> +
> +	r = maux_get_resource(maux, IORESOURCE_IRQ, num);
> +	if (!r)
> +		goto out;
> +
> +	/*
> +	 * The resources may pass trigger flags to the irqs that need to be
> +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> +	 */
> +	if (r->flags & IORESOURCE_BITS) {
> +		struct irq_data *irqd;
> +
> +		irqd = irq_get_irq_data(r->start);
> +		if (!irqd)
> +			goto out;
> +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> +	}
> +
> +	ret = r->start;
> +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> +		ret = -EINVAL;
> +out:
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(maux_get_irq_optional, "MAUX_DEV");
> +
> +/**
> + * maux_get_irq - get an IRQ for maux device
> + * @maux: maux device
> + * @num: IRQ number index
> + *
> + * Gets an IRQ for a maux device and prints an error message if finding the IRQ
> + * fails. Device drivers should check the return value for errors so as to not
> + * pass a negative integer value to the request_irq() APIs.
> + *
> + * For example::
> + *
> + *		int irq = maux_get_irq(maux, 0);
> + *		if (irq < 0)
> + *			return irq;
> + *
> + * Return: non-zero IRQ number on success, negative error number on failure.
> + */
> +int maux_get_irq(struct maux_device *maux, unsigned int num)
> +{
> +	int ret;
> +
> +	ret = maux_get_irq_optional(maux, num);
> +	if (ret < 0)
> +		return dev_err_probe(&maux->auxdev.dev, ret, "IRQ index %u not found\n", num);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(maux_get_irq, "MAUX_DEV");
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 76bd316a50af..673cd468f494 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -10,9 +10,12 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/list.h>
>  #include <linux/property.h>
> +#include <linux/mfd/aux.h>
>  #include <linux/mfd/core.h>
> +#include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -136,10 +139,114 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
>  	return 0;
>  }
>  
> -static int mfd_add_device(struct device *parent, int id,
> -			  const struct mfd_cell *cell,
> -			  struct resource *mem_base,
> -			  int irq_base, struct irq_domain *domain)
> +static int mfd_fill_device_resources(struct device *dev, const struct mfd_cell *cell,
> +				     struct resource *mem_base, int irq_base,
> +				     struct irq_domain *domain, struct resource *res)
> +{
> +	int r, ret;
> +
> +	for (r = 0; r < cell->num_resources; r++) {
> +		res[r].name  = cell->resources[r].name;
> +		res[r].flags = cell->resources[r].flags;
> +
> +		/* Find out base to use */
> +		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
> +			res[r].parent = mem_base;
> +			res[r].start  = mem_base->start + cell->resources[r].start;
> +			res[r].end    = mem_base->start + cell->resources[r].end;
> +		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
> +			if (domain) {
> +				/* Unable to create mappings for IRQ ranges. */
> +				WARN_ON(cell->resources[r].start != cell->resources[r].end);
> +				res[r].start = res[r].end = irq_create_mapping(domain,
> +						cell->resources[r].start);
> +			} else {
> +				res[r].start = irq_base + cell->resources[r].start;
> +				res[r].end   = irq_base + cell->resources[r].end;
> +			}
> +		} else {
> +			res[r].parent = cell->resources[r].parent;
> +			res[r].start  = cell->resources[r].start;
> +			res[r].end    = cell->resources[r].end;
> +		}
> +
> +		if (!cell->ignore_resource_conflicts) {
> +			if (has_acpi_companion(dev)) {
> +				ret = acpi_check_resource_conflict(&res[r]);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void mfd_release_auxiliary_device(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +	struct maux_device *maux = auxiliary_dev_to_maux_dev(auxdev);
> +
> +	kfree(maux->resource);
> +	kfree(maux);
> +}
> +
> +static int mfd_add_auxiliary_device(struct device *parent, int id, const struct mfd_cell *cell,
> +				    struct resource *mem_base, int irq_base,
> +				    struct irq_domain *domain)
> +{
> +	struct auxiliary_device *auxdev;
> +	struct maux_device *maux;
> +	struct resource *res;
> +	int ret = -ENOMEM;
> +
> +	maux = kzalloc(sizeof(*maux), GFP_KERNEL);
> +	if (!maux)
> +		return ret;
> +
> +	res = kcalloc(cell->num_resources, sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		goto fail_alloc_res;
> +
> +	auxdev = &maux->auxdev;
> +	auxdev->name = cell->name;
> +	/* Use parent id for discoverable devices */
> +	auxdev->id = dev_is_pci(parent) ? pci_dev_id(to_pci_dev(parent)) : cell->id;
> +
> +	auxdev->dev.parent = parent;
> +	auxdev->dev.type = &mfd_dev_type;
> +	auxdev->dev.release = mfd_release_auxiliary_device;
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret)
> +		goto fail_aux_init;
> +
> +	ret = mfd_fill_device_resources(&auxdev->dev, cell, mem_base, irq_base, domain, res);
> +	if (ret)
> +		goto fail_aux_init;
> +
> +	maux->resource = res;
> +	maux->num_resources = cell->num_resources;
> +
> +	ret = __auxiliary_device_add(auxdev, parent->driver->name);
> +	if (ret)
> +		goto fail_aux_add;
> +
> +	return 0;
> +
> +fail_aux_add:
> +	/* auxdev will be freed with the put_device() and .release sequence */
> +	auxiliary_device_uninit(auxdev);
> +fail_aux_init:
> +	kfree(res);
> +fail_alloc_res:
> +	kfree(maux);
> +	return ret;
> +}
> +
> +static int mfd_add_platform_device(struct device *parent, int id, const struct mfd_cell *cell,
> +				   struct resource *mem_base, int irq_base,
> +				   struct irq_domain *domain)
>  {
>  	struct resource *res;
>  	struct platform_device *pdev;
> @@ -148,7 +255,6 @@ static int mfd_add_device(struct device *parent, int id,
>  	bool disabled = false;
>  	int ret = -ENOMEM;
>  	int platform_id;
> -	int r;
>  
>  	if (id == PLATFORM_DEVID_AUTO)
>  		platform_id = id;
> @@ -227,44 +333,9 @@ static int mfd_add_device(struct device *parent, int id,
>  			goto fail_of_entry;
>  	}
>  
> -	for (r = 0; r < cell->num_resources; r++) {
> -		res[r].name = cell->resources[r].name;
> -		res[r].flags = cell->resources[r].flags;
> -
> -		/* Find out base to use */
> -		if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
> -			res[r].parent = mem_base;
> -			res[r].start = mem_base->start +
> -				cell->resources[r].start;
> -			res[r].end = mem_base->start +
> -				cell->resources[r].end;
> -		} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
> -			if (domain) {
> -				/* Unable to create mappings for IRQ ranges. */
> -				WARN_ON(cell->resources[r].start !=
> -					cell->resources[r].end);
> -				res[r].start = res[r].end = irq_create_mapping(
> -					domain, cell->resources[r].start);
> -			} else {
> -				res[r].start = irq_base +
> -					cell->resources[r].start;
> -				res[r].end   = irq_base +
> -					cell->resources[r].end;
> -			}
> -		} else {
> -			res[r].parent = cell->resources[r].parent;
> -			res[r].start = cell->resources[r].start;
> -			res[r].end   = cell->resources[r].end;
> -		}
> -
> -		if (!cell->ignore_resource_conflicts) {
> -			if (has_acpi_companion(&pdev->dev)) {
> -				ret = acpi_check_resource_conflict(&res[r]);
> -				if (ret)
> -					goto fail_res_conflict;
> -			}
> -		}
> -	}
> +	ret = mfd_fill_device_resources(&pdev->dev, cell, mem_base, irq_base, domain, res);
> +	if (ret)
> +		goto fail_res_conflict;
>  
>  	ret = platform_device_add_resources(pdev, res, cell->num_resources);
>  	if (ret)
> @@ -302,6 +373,16 @@ static int mfd_add_device(struct device *parent, int id,
>  	return ret;
>  }
>  
> +static int mfd_add_device(struct device *parent, int id, const struct mfd_cell *cells,
> +			  struct resource *mem_base, int irq_base, struct irq_domain *domain)
> +{
> +	/* TODO: Convert platform device abusers and remove this flag */
> +	if (dev_is_pci(parent) && id == MAUX_TYPE)
> +		return mfd_add_auxiliary_device(parent, id, cells, mem_base, irq_base, domain);
> +
> +	return mfd_add_platform_device(parent, id, cells, mem_base, irq_base, domain);
> +}
> +
>  /**
>   * mfd_add_devices - register child devices
>   *
> @@ -340,16 +421,22 @@ int mfd_add_devices(struct device *parent, int id,
>  }
>  EXPORT_SYMBOL(mfd_add_devices);
>  
> -static int mfd_remove_devices_fn(struct device *dev, void *data)
> +static int mfd_remove_auxiliary_device(struct device *dev, void *data)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	auxiliary_device_delete(auxdev);
> +	auxiliary_device_uninit(auxdev);
> +	return 0;
> +}
> +
> +static int mfd_remove_platform_device(struct device *dev, void *data)
>  {
>  	struct platform_device *pdev;
>  	const struct mfd_cell *cell;
>  	struct mfd_of_node_entry *of_entry, *tmp;
>  	int *level = data;
>  
> -	if (dev->type != &mfd_dev_type)
> -		return 0;
> -
>  	pdev = to_platform_device(dev);
>  	cell = mfd_get_cell(pdev);
>  
> @@ -372,6 +459,17 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
>  	return 0;
>  }
>  
> +static int mfd_remove_devices_fn(struct device *dev, void *data)
> +{
> +	if (dev->type != &mfd_dev_type)
> +		return 0;
> +
> +	if (dev_is_platform(dev))
> +		return mfd_remove_platform_device(dev, data);
> +
> +	return mfd_remove_auxiliary_device(dev, data);
> +}
> +
>  void mfd_remove_devices_late(struct device *parent)
>  {
>  	int level = MFD_DEP_LEVEL_HIGH;
> diff --git a/include/linux/mfd/aux.h b/include/linux/mfd/aux.h
> new file mode 100644
> index 000000000000..8a482a503581
> --- /dev/null
> +++ b/include/linux/mfd/aux.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * MFD auxiliary device
> + *
> + * Copyright (c) 2025 Raag Jadav <raag.jadav@intel.com>
> + */
> +
> +#ifndef MFD_AUX_H
> +#define MFD_AUX_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/ioport.h>
> +
> +/*
> + * Common structure between MFD parent and auxiliary child device.
> + * To be used by leaf drivers to access child device resources.
> + */
> +struct maux_device {
> +	struct auxiliary_device auxdev;
> +	u32 num_resources;
> +	struct resource	*resource;
> +};
> +
> +#define auxiliary_dev_to_maux_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct maux_device, auxdev)
> +
> +struct resource *maux_get_resource(struct maux_device *maux, unsigned int type, unsigned int num);
> +int maux_get_irq_optional(struct maux_device *maux, unsigned int num);
> +int maux_get_irq(struct maux_device *maux, unsigned int num);
> +
> +#ifdef CONFIG_HAS_IOMEM
> +void __iomem *devm_maux_get_and_ioremap_resource(struct maux_device *maux, unsigned int index,
> +						 struct resource **res);
> +void __iomem *devm_maux_ioremap_resource(struct maux_device *maux, unsigned int index);
> +#endif
> +
> +#endif
> diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
> index faeea7abd688..85ca273b3873 100644
> --- a/include/linux/mfd/core.h
> +++ b/include/linux/mfd/core.h
> @@ -12,6 +12,9 @@
>  
>  #include <linux/platform_device.h>
>  
> +/* TODO: Convert platform device abusers and remove this flag */
> +#define MAUX_TYPE	INT_MIN
> +
>  #define MFD_RES_SIZE(arr) (sizeof(arr) / sizeof(struct resource))
>  
>  #define MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg, _use_of_reg, _match) \
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
