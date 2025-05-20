Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89F251780;
	Tue, 20 May 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753560; cv=none; b=sBZHZS3bhthwnA+nd2L/bgsQOUokzx+8xN0W9jFjvf5h0WxEZHJkrzvW79YXHjJxQ6KtzIDAc5CnyvGNA/UoH85R3R0rO9wE0pnhcrvlWwQnh6pZarS8RW5+kM3G8NUAiqxQRm5MRWB+piWy5FKwVNFoQhcQA/BXWkaDZc2CPiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753560; c=relaxed/simple;
	bh=PYMltNyB/s1ZLI9HtiPI7l83cEbGBKz9U4TzsmiVfZc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GpnuMFIZPLfY5FQ30B1FD4hpwuElkmzr5KEsV6/5v2T7CreU119qb0JnEtKWe3X28hFxlsAUt/jr3Pj/VK7hfTN1zr8HYC48lI+ADDvszKygQd17UojSAd5zxqBbGd6RAcug4kwJ15y9N+RnLI/4YNIcg/W7mt3fgSZbFNmhVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBSs0r3x; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBSs0r3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747753558; x=1779289558;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PYMltNyB/s1ZLI9HtiPI7l83cEbGBKz9U4TzsmiVfZc=;
  b=ZBSs0r3xkkt4cIyzj0I6+J0PwLnTdhH0azdKgy3GPWunA4BlME6XNSjT
   vCvIxNDj169nhf5ECC64UC/lncNk3vAXcjwWe+mtD7X7lHtkqs75qNK8k
   N1EbuiP55c2GU7/yhqVcL4OgVkx0XlN2zWxQo5wyQApYo/lihcB+g7c7N
   ill8KRilM9KU3IpsRTny75XjPnNr+V1higIhZjESdKU+O63Mvl+ppKmcy
   DTlMFamunF4f8nAu6qCtc4JAtAYvDPVfg6RZfvNOFd9l+C+jLbMtQPEDk
   htng3zXvWaEDetuD4oQymGk6Uy6cxoF/mjI+iO3VFMwy2GQuZ6F2S0FOl
   w==;
X-CSE-ConnectionGUID: efqYR3IeRuS+clHEQ12A5Q==
X-CSE-MsgGUID: k2HXHWK4QZKsRb+6hoKVYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49565986"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49565986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:05:58 -0700
X-CSE-ConnectionGUID: v+zaXnDrReWzbCESIFs49A==
X-CSE-MsgGUID: dMzI1H8HShm8S17zQVkk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143713635"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:05:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 18:05:50 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 14/15] platform/x86/intel/pmt/telemetry: Add API to
 retrieve telemetry regions by feature
In-Reply-To: <20250430212106.369208-15-david.e.box@linux.intel.com>
Message-ID: <8433cbaf-253b-cc7f-77d4-fa48142aa603@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-15-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, David E. Box wrote:

> Introduce a new API, intel_pmt_get_regions_by_feature(), that gathers
> telemetry regions based on a provided capability flag. This API enables
> retrieval of regions with various capabilities (for example, RMID-based
> telemetry) and provides a unified interface for accessing them. Resource
> management is handled via reference counting using
> intel_pmt_put_feature_group().
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmt/telemetry.c | 89 +++++++++++++++++++++-
>  include/linux/intel_vsec.h                 | 15 ++++
>  2 files changed, 103 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 58d06749e417..d071dca4a689 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -9,16 +9,20 @@
>   */
>  
>  #include <linux/auxiliary_bus.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
>  #include <linux/intel_pmt_features.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/kref.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> -#include <linux/overflow.h>
> +#include <linux/xarray.h>
>  
>  #include "class.h"
>  
> @@ -209,6 +213,88 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
>  }
>  EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, "INTEL_PMT_TELEMETRY");
>  
> +static int pmt_copy_region(struct telemetry_region *region,
> +			   struct intel_pmt_entry *entry)
> +{
> +
> +	struct oobmsm_plat_info *plat_info;
> +
> +	plat_info = intel_vsec_get_mapping(entry->ep->pcidev);
> +	if (IS_ERR(plat_info))
> +		return PTR_ERR(plat_info);
> +
> +	region->plat_info = *plat_info;
> +	region->guid = entry->guid;
> +	region->addr = entry->ep->base;
> +	region->size = entry->size;
> +	region->num_rmids = entry->num_rmids;
> +
> +	return 0;
> +}
> +
> +static void pmt_feature_group_release(struct kref *kref)
> +{
> +	struct pmt_feature_group *feature_group;
> +
> +	feature_group = container_of(kref, struct pmt_feature_group, kref);
> +	kfree(feature_group);
> +}
> +
> +struct pmt_feature_group *intel_pmt_get_regions_by_feature(enum pmt_feature_id id)
> +{
> +	struct pmt_feature_group *feature_group;
> +	struct telemetry_region *region;
> +	struct intel_pmt_entry *entry;
> +	unsigned long idx;
> +	int count = 0;
> +	size_t size;
> +
> +	if (!pmt_feature_id_is_valid(id))
> +		return ERR_PTR(-EINVAL);
> +
> +	guard(mutex)(&ep_lock);
> +	xa_for_each(&telem_array, idx, entry) {
> +		if (entry->feature_flags & BIT(id))
> +			count++;
> +	}
> +
> +	if (!count)
> +		return ERR_PTR(-ENOENT);
> +
> +	size = struct_size(feature_group, regions, count);
> +	feature_group = kzalloc(size, GFP_KERNEL);
> +	if (!feature_group)
> +		return ERR_PTR(-ENOMEM);
> +
> +	feature_group->count = count;
> +
> +	region = feature_group->regions;
> +	xa_for_each(&telem_array, idx, entry) {
> +		int ret;
> +
> +		if (!(entry->feature_flags & BIT(id)))
> +			continue;
> +
> +		ret = pmt_copy_region(region, entry);
> +		if (ret) {
> +			kfree(feature_group);

Use __free() instead.

> +			return ERR_PTR(ret);
> +		}
> +		region++;
> +	}
> +
> +	kref_init(&feature_group->kref);
> +
> +	return feature_group;
> +}
> +EXPORT_SYMBOL(intel_pmt_get_regions_by_feature);
> +
> +void intel_pmt_put_feature_group(struct pmt_feature_group *feature_group)
> +{
> +	kref_put(&feature_group->kref, pmt_feature_group_release);
> +}
> +EXPORT_SYMBOL(intel_pmt_put_feature_group);
> +
>  int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
>  {
>  	u32 offset, size;
> @@ -353,3 +439,4 @@ MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
>  MODULE_DESCRIPTION("Intel PMT Telemetry driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_IMPORT_NS("INTEL_PMT");
> +MODULE_IMPORT_NS("INTEL_VSEC");
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index f63e67398a8e..f41d2ec974fd 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -220,4 +220,19 @@ static inline struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pd
>  	return ERR_PTR(-ENODEV);
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_INTEL_PMT_TELEMETRY)
> +struct pmt_feature_group *
> +intel_pmt_get_regions_by_feature(enum pmt_feature_id id);
> +
> +void intel_pmt_put_feature_group(struct pmt_feature_group *feature_group);
> +#else
> +static inline struct pmt_feature_group *
> +intel_pmt_get_regions_by_feature(enum pmt_feature_id id)
> +{ return ERR_PTR(-ENODEV); }

Please add include for ERR_PTR().

Change this to follow the normal function coding style even if it takes
2 lines more that way. :-)

> +
> +static inline void
> +intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
> +#endif
> +
>  #endif
> 

-- 
 i.

