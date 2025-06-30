Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9678289E17;
	Mon, 30 Jun 2025 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285311; cv=none; b=PIcG6zY8hJrj6lJfqNr+Sp/xxynE+16199xmdQhgxLQM6hddMGn4YYeTd3Z9a2+Occvy+kHpKP/B9Ge1L7ZzgFCzQn7zkAbiIzF4MRuQp3i3CwB31selnYFfXjcHrNAWvXfus+26iHKXS+Vjc8Kl5jzm3WJ4vTl7qu9UiBdEoBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285311; c=relaxed/simple;
	bh=tvZg4BwFQFp9qXk8LOfSnmYas1LLCBXoBwsdinGav/4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Nm8Jon3GuVOq1gAZxAx01nY0KMKYXearyYJ5/ZrG8Dkok9TI4n7bPEWe3JjIRMZHlpIyJX3d9e2AWpFval0bhGqMy13s8NYp7ai2Aq4KUOW6eU2oywTU7wDbZzvPkjjJGESl6t3bAIw6w20RopoQenvvIDRbNs9FSkrmHG5ZucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaNXEMZg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaNXEMZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751285310; x=1782821310;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tvZg4BwFQFp9qXk8LOfSnmYas1LLCBXoBwsdinGav/4=;
  b=AaNXEMZgvUkiTAXKdoL+G0E1uyMrNsh8+4bVpfvQWsd7YU+0ssyYL9DE
   PO56H2lek8Fp7gzXa5qOSeUPQf8XZ+JNSupBVgXoxQxEbVHkCS5ku8R2p
   xuJNzIH/MOKtHLR0JFN5Z76VeyZTh10O58jpqUx4bfr0AGzzyYHLPUM6S
   eeHQP5lT7Dd+srL4f5qx5Nx7ms6y9OV9hGZk/3SGh3eoJOgqLBDOHf/Ng
   vQcxwfCbmSReNNc7lKWb8NXdHfN08E5z3Cl0guVRl/1l9alz33VSdV7g6
   AIpdG9001yJQwiN7L2LKx+E23i+EwbE8i2nvqta81TInLObVaQAJe+Ej6
   w==;
X-CSE-ConnectionGUID: 3iz39t/nTC2DqX1Zq3Fwbg==
X-CSE-MsgGUID: aCqbF8cxRtOy0vAlxc3L8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="76057586"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="76057586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:08:29 -0700
X-CSE-ConnectionGUID: CYx8uifpR/mRmsaaFAKvDg==
X-CSE-MsgGUID: 3akPhiGtQN+cqO7jT2YXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158950341"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:08:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 15:08:24 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2] platform/x86/intel/pmt/telemetry: Add API to retrieve
 telemetry regions by feature
In-Reply-To: <20250617014041.2861032-15-david.e.box@linux.intel.com>
Message-ID: <077c52bb-6dec-a140-cd7b-8bf26f46dc65@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com> <20250617014041.2861032-15-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, David E. Box wrote:

b4 didn't like how this patch was created and failed to link it with the 
rest of the series.

-- 
 i.

> Introduce a new API, intel_pmt_get_regions_by_feature(), that gathers
> telemetry regions based on a provided capability flag. This API enables
> retrieval of regions with various capabilities (for example, RMID-based
> telemetry) and provides a unified interface for accessing them. Resource
> management is handled via reference counting using
> intel_pmt_put_feature_group().
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> Changes in v2:
>   - In pmt_telem_get_endpoint_info() use __free() for feature_group
>   - Add missing header for ERR_PTR()
>   - Split static inline function into multiple lines
> 
>  drivers/platform/x86/intel/pmt/telemetry.c | 89 +++++++++++++++++++++-
>  include/linux/intel_vsec.h                 | 18 +++++
>  2 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 58d06749e417..a4dfca6cac19 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -9,16 +9,21 @@
>   */
>  
>  #include <linux/auxiliary_bus.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
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
> @@ -209,6 +214,87 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
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
> +	struct pmt_feature_group *feature_group __free(kfree) = NULL;
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
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		region++;
> +	}
> +
> +	kref_init(&feature_group->kref);
> +
> +	return no_free_ptr(feature_group);
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
> index f63e67398a8e..0d127d3a18b3 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
> +#include <linux/err.h>
>  #include <linux/intel_pmt_features.h>
>  
>  /*
> @@ -220,4 +221,21 @@ static inline struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pd
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
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +static inline void
> +intel_pmt_put_feature_group(struct pmt_feature_group *feature_group) {}
> +#endif
> +
>  #endif
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> prerequisite-patch-id: b38c42e1e0ad4a9d7c2bad26bafc44e4710b221e
> prerequisite-patch-id: 8c78f389183292e444aea2450bbd9c49cbd2b276
> prerequisite-patch-id: cde36b6a28c7c6b8fce58aecfef7f442ff6d1e50
> prerequisite-patch-id: 0657fb342c016c1aa47501c17a69e78178371c02
> prerequisite-patch-id: a9d8e0500e5eda1146a3203d70375ae2b2b25a9d
> prerequisite-patch-id: c8b1a9d4e48c13353cc41b815b69141118b3d457
> prerequisite-patch-id: 6f676b5e6d90b87fb8e39154998cc06f0cd99914
> prerequisite-patch-id: 4aa05c3ad0e61fe133ee82d84831a451ec551f5d
> prerequisite-patch-id: d92f2986c580d720420a371923f788265d22dc02
> prerequisite-patch-id: f281f452c8cdc2545abc881f4761a79b633b2847
> prerequisite-patch-id: 01215266d8d3e0450ed991feb1d17a9b54ed771b
> prerequisite-patch-id: ee9f8ca9f1357aebd5f240a1b089be1f0e3258e9
> prerequisite-patch-id: 82ee7c3801bca82569d1cf8febcab7ded56e5bd1
> 
