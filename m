Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E5027715;
	Tue, 20 May 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749102; cv=none; b=F95qfkwE4tljt6X/mP8gROHZKW08Nqxeqzq/CathxCardD7lRXwBzAUkkVVLJ0TOhXzf6exqN8QzVjKYkLxueD5DSx8ef21LKWZo99xCCKQedUkHDX7t+OxuvD3HoqwMVU53IGL5MAhXHnqbxfJCGrekhGQKIT55kMNHts2Dlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749102; c=relaxed/simple;
	bh=uzB1YRpi7xD+gsKGERyiPBkXAwyGzTk3H2qN3C67oZ8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M9LqGSV6LkK6egeN9fhJinQogNvIAuLYtllUe5b77P+NjFX6Cc8C++Y4ryx0hT/MzO0eJT1kYZ5TvYkA76M253qkWh6ldaFvVfFjlH5N/x16cnlh+CQQQdRCS2YVF6al5TKhvH8+SWODEEyVLVgZDA3tqvdUuhlRVurGaJz4Qo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvxdBazU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvxdBazU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747749100; x=1779285100;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uzB1YRpi7xD+gsKGERyiPBkXAwyGzTk3H2qN3C67oZ8=;
  b=SvxdBazUrSHteVEwyomPhGO/Clpsb6oalh/x4o5sSS8YAXONboZ2Jsih
   8rDpc3vGY2HojddcE9w/qdZRFOuzib5Ia8kso7+9wAUifxskB0R8nc/Nj
   ld5V4+aW63zOMsBZ2LAIfuJ3pwP1iIHWJHicU2d8i5iGSYQLnzZ8tq8/i
   4m8w6yBwxrq8oF+1I+uFS71xmiWtHWGBiEsUPAlPLq2zs6Bjw5kcWlLrF
   ykQpZUi6plq1gcKvjdc1rquezHgyXn+nXekTGriZeH5nEDTEEM9elYavD
   /l51OiiZcwbednYXzrqiUysuAj3/AjkPUlXHhtmyhdreyC57r2DZBK0Da
   g==;
X-CSE-ConnectionGUID: Kccp2dGsSAOhBXTurTvbBw==
X-CSE-MsgGUID: MxH8pOu0Qgytm5m0Chk72Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37301444"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="37301444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 06:51:39 -0700
X-CSE-ConnectionGUID: U4gDZFQAQNSSYpSbFMDKwQ==
X-CSE-MsgGUID: 1+9+S1LLRJeU84BuKEdmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176826732"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 06:51:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 16:51:32 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/15] platform/x86/intel/vsec: Add device links to
 enforce dependencies
In-Reply-To: <20250430212106.369208-5-david.e.box@linux.intel.com>
Message-ID: <31ed1609-5da1-722e-5182-5c199a3bcb1f@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, David E. Box wrote:

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
>  drivers/platform/x86/intel/vsec.c | 214 +++++++++++++++++++++++++++++-
>  include/linux/intel_vsec.h        |  28 +++-
>  2 files changed, 230 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index f01651f498ca..8700ed7656df 100644
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
> @@ -95,6 +106,72 @@ static void intel_vsec_dev_release(struct device *dev)
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
> +			break;
> +
> +	if (consumer_id < 0)
> +		return NULL;
> +
> +	return &deps[consumer_id];

This has unnecessary complexity. Why can't you return immediately instead 
of break. After doing that, you don't need that <0 check either.

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
> +		if (state[supplier_id] != STATE_REGISTERED)
> +			continue;
> +
> +		if (!suppliers[supplier_id]) {
> +			dev_err(dev, "Bad supplier list\n");
> +			return -EINVAL;
> +		}
> +
> +		device_link_add(dev, suppliers[supplier_id], DL_FLAG_AUTOPROBE_CONSUMER);
> +	}
> +
> +	return 0;
> +}
> +
>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		       struct intel_vsec_device *intel_vsec_dev,
>  		       const char *name)
> @@ -132,6 +209,25 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Assign a name now to ensure that the device link doesn't contain
> +	 * a null string for the consumer name. This is a problem when a supplier
> +	 * supplys more than one consumer and can lead to a duplicate name error

supplies

> +	 * when the link is created in sysfs.
> +	 */
> +	ret = dev_set_name(&auxdev->dev, "%s.%s.%d", KBUILD_MODNAME, auxdev->name,
> +			   auxdev->id);
> +	if (ret) {
> +		auxiliary_device_uninit(auxdev);
> +		return ret;
> +	}
> +
> +	ret = intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_id);
> +	if (ret) {
> +		auxiliary_device_uninit(auxdev);

Instead of repeating this 3 times, do a rollback path.

> +		return ret;
> +	}
> +
>  	ret = auxiliary_device_add(auxdev);
>  	if (ret < 0) {
>  		auxiliary_device_uninit(auxdev);

Don't you need to tear down the device link on failure?

> @@ -144,7 +240,8 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
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
> @@ -219,12 +317,108 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  
>  	/*
>  	 * Pass the ownership of intel_vsec_dev and resource within it to
> -	 * intel_vsec_add_aux()
> +	 * intel_vsec_add_aux().

Unrelated change, please put into own patch if you want to do this.

>  	 */
>  	return intel_vsec_add_aux(pdev, parent, no_free_ptr(intel_vsec_dev),
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
> +
> +	/*
> +	 * Find all features that are suppliers and check their state.
> +	 * Only suppliers that have been successfully registered will be linked.
> +	 */
> +	for_each_set_bit(supplier_id, &consumer_deps->supplier_bitmap, VSEC_FEATURE_COUNT) {
> +		if (state[supplier_id] == STATE_SKIP)
> +			continue;
> +
> +		/* If any supplier is not yet found, return immediately */

I'm not sure how I should interpret this comment, and it seems to 
contradict with "Find all features" in the comment above because this will 
return immediately so what about finding the rest of the features?

> +		if (state[supplier_id] == STATE_NOT_FOUND)
> +			return false;
> +	}
> +
> +	/*
> +	 * If we get here, all suppliers have been found and the consumer
> +	 * is ready to be registered.
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
> @@ -233,7 +427,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
>  	int ret;
>  
>  	for ( ; *header; header++) {
> -		ret = intel_vsec_add_dev(pdev, *header, info);
> +		ret = intel_vsec_register_device(pdev, *header, info);
>  		if (!ret)
>  			have_devices = true;
>  	}
> @@ -281,7 +475,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
>  		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
>  		header.id = PCI_DVSEC_HEADER2_ID(hdr);
>  
> -		ret = intel_vsec_add_dev(pdev, &header, info);
> +		ret = intel_vsec_register_device(pdev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -326,7 +520,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
>  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
>  
> -		ret = intel_vsec_add_dev(pdev, &header, info);
> +		ret = intel_vsec_register_device(pdev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -375,7 +569,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  	struct intel_vsec_platform_info *info;
>  	struct vsec_priv *priv;
>  	bool have_devices = false;
> -	int ret;
> +	int num_caps, ret;
>  
>  	ret = pcim_enable_device(pdev);
>  	if (ret)
> @@ -393,7 +587,13 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  	priv->info = info;
>  	pci_set_drvdata(pdev, priv);
>  
> -	intel_vsec_feature_walk(pdev, &have_devices, info);
> +	num_caps = hweight_long(info->caps);
> +	while (num_caps--) {
> +		intel_vsec_feature_walk(pdev, &have_devices, info);
> +
> +		if (priv->found_caps == priv->info->caps)

The hweight_long() arg is info->caps and here you used priv->info->caps.

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

-- 
 i.

