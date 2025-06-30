Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18C257435;
	Mon, 30 Jun 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285205; cv=none; b=Zu4LMGTBon2sQoJ+eG0LruBlCumvlQlCo9R8/eb21EkJLH4Hg+5gZBAyUIj9+1LKQucCixtGXzTapvyX61214UuiMKkUlo6shEwvAY7+sA2vjWbHa4wMstt6ajoc6n1C5io9dPhcRLY+o8635iMd1y3FMVEc8vDK3JRQvI7Pe/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285205; c=relaxed/simple;
	bh=Mk9BRIamZcbzITkAOJLyQFJHQLE5cX76hBjWrT8HixE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Re5Qz0C+RkK6GIFGzxHwZzjvDTvj7r82dzxvdSgasymyGVg6G0FSR1cHel0wJhf2RPCKjD3xSl/GEPnKGpQoJZeMexZVSfRYx5dwYZJ58OjwlwAQzVgXx5bfl1kRhOGKDI5cjO7SwnLnk54tUUmYQ5ntZbM4/bw+2kzJPb7g1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMQLLMC0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMQLLMC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751285204; x=1782821204;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Mk9BRIamZcbzITkAOJLyQFJHQLE5cX76hBjWrT8HixE=;
  b=TMQLLMC0TPjuDL5pXSBTVxcfoFCU0OH5sXUt9ye45aPix1ejGVn96Kih
   4G9ygQB7SU1ifsIIw2f7gXuy6+G8oQXCu1Kh5YhPvWjPtQugSJusmAtcv
   nYkJKhZbh3AcZcOkkvdV4rSRpP4HhwlEG+WsLuFkZkMv8yvxqb3EdIO9m
   3wXw7739zXdVxchiw2KRAu3Lguc7gZt0dqsYWe8sAluMwR082mAOFXWJl
   hmwJ9Rb1uiPjK5tZCuzNrazEQ32K5aCBmPZxPudEDqH55TpsYeRwp/CHb
   y0D5IGpsApAu96SQ/sqvVlRmT4F6h0mAxdd4yqUrsgKlGb7g/SqwmDu3R
   g==;
X-CSE-ConnectionGUID: CBsROsRdQtGOnPBEPXq4Sw==
X-CSE-MsgGUID: rKd96G7KQauGORecjaBtCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="76057374"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="76057374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:06:43 -0700
X-CSE-ConnectionGUID: pZOrY+BORXKpQj3TFIMhLw==
X-CSE-MsgGUID: suK1e60PRZyc87dBW+lh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153743526"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:06:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 15:06:38 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 04/15] platform/x86/intel/vsec: Add device links to
 enforce dependencies
In-Reply-To: <20250617014041.2861032-5-david.e.box@linux.intel.com>
Message-ID: <8ccfd660-791a-6cf1-2982-b4f09ae6d3e1@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com> <20250617014041.2861032-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, David E. Box wrote:

> New Intel VSEC features will have dependencies on other features, requiring
> certain supplier drivers to be probed before their consumers. To enforce
> this dependency ordering, introduce device links using device_link_add(),
> ensuring that suppliers are fully registered before consumers are probed.
> 
> - Add device link tracking by storing supplier devices and tracking their
>   state.
> - Implement intel_vsec_link_devices() to establish links between suppliers
>   and consumers based on feature dependencies.
> - Add get_consumer_dependencies() to retrieve supplier-consumer
>   relationships.
> - Modify feature registration logic:
>   * Consumers now check that all required suppliers are registered before
>     being initialized.
>   * suppliers_ready() verifies that all required supplier devices are
>     available.
> - Prevent potential null consumer name issue in sysfs:
>   - Use dev_set_name() when creating auxiliary devices to ensure a
>     unique, non-null consumer name.
> - Update intel_vsec_pci_probe() to loop up to the number of possible
>   features or when all devices are registered, whichever comes first.
> - Introduce VSEC_CAP_UNUSED to prevent sub-features (registered via
>   exported APIs) from being mistakenly linked.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> Changes in v2:
>   - Simply dependency search in get_consumer_dependencies() per comments
>     from Ilpo.
>   - Add rollback for auxiliary_device_uninit() in intel_vsec_add_aux().
>   - In suppliers_ready() clarify that for_each_set_bit() is searching for
>     all *ready* suppliers, not all suppliers. If any is not ready and not
>     ignored, it immediately returns.
>   - In suppliers_ready() check device_link_add() return status.
>   - In intel_vsec_probe() uses info->caps consistently.
>   - Fix spelling errors and remove unrelated changes.
> 
>  drivers/platform/x86/intel/vsec.c | 219 ++++++++++++++++++++++++++++--
>  include/linux/intel_vsec.h        |  28 +++-
>  2 files changed, 232 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index f01651f498ca..e497b570f814 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -15,9 +15,11 @@
>  
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
> +#include <linux/bitops.h>
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/idr.h>
> +#include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -32,8 +34,17 @@ static DEFINE_IDA(intel_vsec_ida);
>  static DEFINE_IDA(intel_vsec_sdsi_ida);
>  static DEFINE_XARRAY_ALLOC(auxdev_array);
>  
> +enum vsec_device_state {
> +	STATE_NOT_FOUND,
> +	STATE_REGISTERED,
> +	STATE_SKIP,
> +};
> +
>  struct vsec_priv {
>  	struct intel_vsec_platform_info *info;
> +	struct device *suppliers[VSEC_FEATURE_COUNT];
> +	enum vsec_device_state state[VSEC_FEATURE_COUNT];
> +	unsigned long found_caps;
>  };
>  
>  static const char *intel_vsec_name(enum intel_vsec_id id)
> @@ -95,6 +106,74 @@ static void intel_vsec_dev_release(struct device *dev)
>  	kfree(intel_vsec_dev);
>  }
>  
> +static const struct vsec_feature_dependency *
> +get_consumer_dependencies(struct vsec_priv *priv, int cap_id)
> +{
> +	const struct vsec_feature_dependency *deps = priv->info->deps;
> +	int consumer_id = priv->info->num_deps;
> +
> +	if (!deps)
> +		return NULL;
> +
> +	while (consumer_id--)
> +		if (deps[consumer_id].feature == BIT(cap_id))
> +			return &deps[consumer_id];
> +
> +	return NULL;
> +}
> +
> +/*
> + * Although pci_device_id table is available in the pdev, this prototype is
> + * necessary because the code using it can be called by an exported API that
> + * might pass a different pdev.
> + */
> +static const struct pci_device_id intel_vsec_pci_ids[];
> +
> +static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *dev,
> +				   int consumer_id)
> +{
> +	const struct vsec_feature_dependency *deps;
> +	enum vsec_device_state *state;
> +	struct device **suppliers;
> +	struct vsec_priv *priv;
> +	int supplier_id;
> +
> +	if (!consumer_id)
> +		return 0;
> +
> +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> +		return 0;
> +
> +	priv = pci_get_drvdata(pdev);
> +	state = priv->state;
> +	suppliers = priv->suppliers;
> +
> +	priv->suppliers[consumer_id] = dev;
> +
> +	deps = get_consumer_dependencies(priv, consumer_id);
> +	if (!deps)
> +		return 0;
> +
> +	for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT) {
> +		struct device_link *link;
> +
> +		if (state[supplier_id] != STATE_REGISTERED)
> +			continue;
> +
> +		if (!suppliers[supplier_id]) {
> +			dev_err(dev, "Bad supplier list\n");
> +			return -EINVAL;
> +		}
> +
> +		link = device_link_add(dev, suppliers[supplier_id],
> +				       DL_FLAG_AUTOPROBE_CONSUMER);
> +		if (!link)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		       struct intel_vsec_device *intel_vsec_dev,
>  		       const char *name)
> @@ -132,19 +211,37 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Assign a name now to ensure that the device link doesn't contain
> +	 * a null string for the consumer name. This is a problem when a supplier
> +	 * supplies more than one consumer and can lead to a duplicate name error
> +	 * when the link is created in sysfs.
> +	 */
> +	ret = dev_set_name(&auxdev->dev, "%s.%s.%d", KBUILD_MODNAME, auxdev->name,
> +			   auxdev->id);
> +	if (ret)
> +		goto cleanup_aux;
> +
> +	ret = intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_id);
> +	if (ret)
> +		goto cleanup_aux;
> +
>  	ret = auxiliary_device_add(auxdev);
> -	if (ret < 0) {
> -		auxiliary_device_uninit(auxdev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto cleanup_aux;
>  
>  	return devm_add_action_or_reset(parent, intel_vsec_remove_aux,
>  				       auxdev);
> +
> +cleanup_aux:
> +	auxiliary_device_uninit(auxdev);
> +	return ret;
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
>  
>  static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
> -			      struct intel_vsec_platform_info *info)
> +			      struct intel_vsec_platform_info *info,
> +			      unsigned long cap_id)
>  {
>  	struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
>  	struct resource __free(kfree) *res = NULL;
> @@ -211,6 +308,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	intel_vsec_dev->quirks = info->quirks;
>  	intel_vsec_dev->base_addr = info->base_addr;
>  	intel_vsec_dev->priv_data = info->priv_data;
> +	intel_vsec_dev->cap_id = cap_id;
>  
>  	if (header->id == VSEC_ID_SDSI)
>  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> @@ -225,6 +323,101 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  				  intel_vsec_name(header->id));
>  }
>  
> +static bool suppliers_ready(struct vsec_priv *priv,
> +			    const struct vsec_feature_dependency *consumer_deps,
> +			    int cap_id)
> +{
> +	enum vsec_device_state *state = priv->state;
> +	int supplier_id;
> +
> +	if (consumer_deps->feature != BIT(cap_id))
> +		return false; /* Should not happen */

I don't recall if I asked this already, but does the comment imply this is 
an error on the caller side warranting using WARN_ON_ONCE()?

-- 
 i.

> +
> +	/*
> +	 * Verify that all required suppliers have been found. Return false
> +	 * immediately if any are still missing.
> +	 */
> +	for_each_set_bit(supplier_id, &consumer_deps->supplier_bitmap, VSEC_FEATURE_COUNT) {
> +		if (state[supplier_id] == STATE_SKIP)
> +			continue;
> +
> +		if (state[supplier_id] == STATE_NOT_FOUND)
> +			return false;
> +	}
> +
> +	/*
> +	 * All suppliers have been found and the consumer is ready to be
> +	 * registered.
> +	 */
> +	return true;
> +}
> +
> +static int get_cap_id(u32 header_id, unsigned long *cap_id)
> +{
> +	switch (header_id) {
> +	case VSEC_ID_TELEMETRY:
> +		*cap_id = ilog2(VSEC_CAP_TELEMETRY);
> +		break;
> +	case VSEC_ID_WATCHER:
> +		*cap_id = ilog2(VSEC_CAP_WATCHER);
> +		break;
> +	case VSEC_ID_CRASHLOG:
> +		*cap_id = ilog2(VSEC_CAP_CRASHLOG);
> +		break;
> +	case VSEC_ID_SDSI:
> +		*cap_id = ilog2(VSEC_CAP_SDSI);
> +		break;
> +	case VSEC_ID_TPMI:
> +		*cap_id = ilog2(VSEC_CAP_TPMI);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_vsec_register_device(struct pci_dev *pdev,
> +				      struct intel_vsec_header *header,
> +				      struct intel_vsec_platform_info *info)
> +{
> +	const struct vsec_feature_dependency *consumer_deps;
> +	struct vsec_priv *priv;
> +	unsigned long cap_id;
> +	int ret;
> +
> +	ret = get_cap_id(header->id, &cap_id);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Only track dependencies for devices probed by the VSEC driver.
> +	 * For others using the exported APIs, add the device directly.
> +	 */
> +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> +		return intel_vsec_add_dev(pdev, header, info, cap_id);
> +
> +	priv = pci_get_drvdata(pdev);
> +	if (priv->state[cap_id] == STATE_REGISTERED ||
> +	    priv->state[cap_id] == STATE_SKIP)
> +		return -EEXIST;
> +
> +	priv->found_caps |= BIT(cap_id);
> +
> +	consumer_deps = get_consumer_dependencies(priv, cap_id);
> +	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
> +		ret = intel_vsec_add_dev(pdev, header, info, cap_id);
> +		if (ret)
> +			priv->state[cap_id] = STATE_SKIP;
> +		else
> +			priv->state[cap_id] = STATE_REGISTERED;
> +
> +		return ret;
> +	}
> +
> +	return -EAGAIN;
> +}
> +
>  static bool intel_vsec_walk_header(struct pci_dev *pdev,
>  				   struct intel_vsec_platform_info *info)
>  {
> @@ -233,7 +426,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
>  	int ret;
>  
>  	for ( ; *header; header++) {
> -		ret = intel_vsec_add_dev(pdev, *header, info);
> +		ret = intel_vsec_register_device(pdev, *header, info);
>  		if (!ret)
>  			have_devices = true;
>  	}
> @@ -281,7 +474,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
>  		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
>  		header.id = PCI_DVSEC_HEADER2_ID(hdr);
>  
> -		ret = intel_vsec_add_dev(pdev, &header, info);
> +		ret = intel_vsec_register_device(pdev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -326,7 +519,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
>  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
>  
> -		ret = intel_vsec_add_dev(pdev, &header, info);
> +		ret = intel_vsec_register_device(pdev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -375,7 +568,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  	struct intel_vsec_platform_info *info;
>  	struct vsec_priv *priv;
>  	bool have_devices = false;
> -	int ret;
> +	int num_caps, ret;
>  
>  	ret = pcim_enable_device(pdev);
>  	if (ret)
> @@ -393,7 +586,13 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  	priv->info = info;
>  	pci_set_drvdata(pdev, priv);
>  
> -	intel_vsec_feature_walk(pdev, &have_devices, info);
> +	num_caps = hweight_long(info->caps);
> +	while (num_caps--) {
> +		intel_vsec_feature_walk(pdev, &have_devices, info);
> +
> +		if (priv->found_caps == info->caps)
> +			break;
> +	}
>  
>  	if (!have_devices)
>  		return -ENODEV;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index bc95821f1bfb..71067afaca99 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -5,11 +5,18 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
>  
> -#define VSEC_CAP_TELEMETRY	BIT(0)
> -#define VSEC_CAP_WATCHER	BIT(1)
> -#define VSEC_CAP_CRASHLOG	BIT(2)
> -#define VSEC_CAP_SDSI		BIT(3)
> -#define VSEC_CAP_TPMI		BIT(4)
> +/*
> + * VSEC_CAP_UNUSED is reserved. It exists to prevent zero initialized
> + * intel_vsec devices from being automatically set to a known
> + * capability with ID 0
> + */
> +#define VSEC_CAP_UNUSED		BIT(0)
> +#define VSEC_CAP_TELEMETRY	BIT(1)
> +#define VSEC_CAP_WATCHER	BIT(2)
> +#define VSEC_CAP_CRASHLOG	BIT(3)
> +#define VSEC_CAP_SDSI		BIT(4)
> +#define VSEC_CAP_TPMI		BIT(5)
> +#define VSEC_FEATURE_COUNT	6
>  
>  /* Intel DVSEC offsets */
>  #define INTEL_DVSEC_ENTRIES		0xA
> @@ -81,22 +88,31 @@ struct pmt_callbacks {
>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
>  };
>  
> +struct vsec_feature_dependency {
> +	unsigned long feature;
> +	unsigned long supplier_bitmap;
> +};
> +
>  /**
>   * struct intel_vsec_platform_info - Platform specific data
>   * @parent:    parent device in the auxbus chain
>   * @headers:   list of headers to define the PMT client devices to create
> + * @deps:      array of feature dependencies
>   * @priv_data: private data, usable by parent devices, currently a callback
>   * @caps:      bitmask of PMT capabilities for the given headers
>   * @quirks:    bitmask of VSEC device quirks
>   * @base_addr: allow a base address to be specified (rather than derived)
> + * @num_deps:  Count feature dependencies
>   */
>  struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
> +	const struct vsec_feature_dependency *deps;
>  	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;
> +	int num_deps;
>  };
>  
>  /**
> @@ -110,6 +126,7 @@ struct intel_vsec_platform_info {
>   * @priv_data:     any private data needed
>   * @quirks:        specified quirks
>   * @base_addr:     base address of entries (if specified)
> + * @cap_id:        the enumerated id of the vsec feature
>   */
>  struct intel_vsec_device {
>  	struct auxiliary_device auxdev;
> @@ -122,6 +139,7 @@ struct intel_vsec_device {
>  	size_t priv_data_size;
>  	unsigned long quirks;
>  	u64 base_addr;
> +	unsigned long cap_id;
>  };
>  
>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> 
