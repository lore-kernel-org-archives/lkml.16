Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A254918;
	Mon, 30 Jun 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284554; cv=none; b=G5YkB8VgKDE6Wj94mcIpsNkJfVKWFKF3F8WzeXugN32pVpFom1tspoEKbdSGe+g7OZ/Yf6DOLIb20uqyI2/ovwINN43mER0ggGs0GFQCUfxUTFAcWgM1TcnzB2HX0vysxArpRxXeFCb0myXBGyE9ZKJ3I7CwRK3eZQxIwFaTAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284554; c=relaxed/simple;
	bh=OAdObtNjz1gSQejy5rqJ+xlQ4X9D1M8OhMHiG1zlYco=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OoeHttSLv3O/ocN1jXsaSymmpP2xLVqln3mDKTj1zaZ8FQVoS32uY9fudFKTpMwb7pSSLX5OiKjobMhlRlzPsuZ33UXf6rwRYxLWWW4DCerEfeikjECdrF1hasfhqx8xtNmut7TAGo3J464sYsIyJlcKHrS/d5Bf0woVes0T3XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXu/hO9+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXu/hO9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284552; x=1782820552;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OAdObtNjz1gSQejy5rqJ+xlQ4X9D1M8OhMHiG1zlYco=;
  b=hXu/hO9+/W91gUyRupNn6kGF8OR7sRrNlrLcXIjtjqD4dXdeM2nLFT++
   KsiZVjZw0kREIYs1xxw6FrNiYhbHK6Fk0Xi3INC81foQoF5AbBTmi0Hh+
   9GnT1qK7ii1OnSn3S5yQKmnh+J2YVXFZRNdGcg/hw13+JtVkgKUxtxPBc
   iHBR/VR23zNocYVwQEK0QwWwTE0DQvKPTnyi+JRVPM753KSzCgDkhBAJa
   /HjzhQZ9ulebuXvuXN8vndK5w9cOjWOSO3xDSgbhS/SKg4zpXMUEqAfMT
   KAV/+AJ6zUkUCxhZc0nJaQHUBUYOZv7OgRVws+YZMfjl/ymliswh3Q+/C
   g==;
X-CSE-ConnectionGUID: mPdkRibnROSE8Hj0uySaMg==
X-CSE-MsgGUID: y9yyP5CSRKWB+SgeYyYTzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="41134448"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="41134448"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:55:46 -0700
X-CSE-ConnectionGUID: WeaMPAFQTnGxgJ4R0+/2/Q==
X-CSE-MsgGUID: rxnmX8CLSB+XC/MFMaznJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157715145"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:55:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 14:55:41 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 11/15] platform/x86/intel/vsec: Set OOBMSM to CPU
 mapping
In-Reply-To: <20250617014041.2861032-12-david.e.box@linux.intel.com>
Message-ID: <9911d37b-eff6-2562-2e52-7bcd656186c0@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com> <20250617014041.2861032-12-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, David E. Box wrote:

> Add functions, intel_vsec_set/get_mapping(), to set and retrieve the
> OOBMSM-to-CPU mapping data in the private data of the parent Intel VSEC
> driver. With this mapping information available, other Intel VSEC features
> on the same OOBMSM device can easily access and use the mapping data,
> allowing each of the OOBMSM features to map to the CPUs they provides data
> for.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> Changes in v2:
>   - No changes
> 
>  drivers/platform/x86/intel/vsec.c | 31 +++++++++++++++++++++++++++++++
>  include/linux/intel_vsec.h        | 14 ++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 98f570a389c6..8c330b57e4d4 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -43,6 +43,7 @@ enum vsec_device_state {
>  struct vsec_priv {
>  	struct intel_vsec_platform_info *info;
>  	struct device *suppliers[VSEC_FEATURE_COUNT];
> +	struct oobmsm_plat_info plat_info;
>  	enum vsec_device_state state[VSEC_FEATURE_COUNT];
>  	unsigned long found_caps;
>  };
> @@ -660,6 +661,36 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  	return 0;
>  }
>  
> +int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> +			   struct intel_vsec_device *vsec_dev)
> +{
> +	struct vsec_priv *priv;
> +
> +	priv = pci_get_drvdata(vsec_dev->pcidev);
> +	if (!priv)
> +		return -EINVAL;
> +
> +	priv->plat_info = *plat_info;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(intel_vsec_set_mapping, "INTEL_VSEC");
> +
> +struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev)
> +{
> +	struct vsec_priv *priv;
> +
> +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> +		return ERR_PTR(-EINVAL);
> +
> +	priv = pci_get_drvdata(pdev);
> +	if (!priv)
> +		return ERR_PTR(-EINVAL);
> +
> +	return &priv->plat_info;
> +}
> +EXPORT_SYMBOL_NS_GPL(intel_vsec_get_mapping, "INTEL_VSEC");
> +
>  /* DG1 info */
>  static struct intel_vsec_header dg1_header = {
>  	.length = 0x10,
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index cd78d0b2e623..b15155ff1154 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -170,6 +170,8 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		       struct intel_vsec_device *intel_vsec_dev,
>  		       const char *name);
>  
> +int intel_vsec_suppliers_ready(struct intel_vsec_device *vsec_dev,
> +			       unsigned long needs);

There's no code for this anywhere in the series??

>  static inline struct intel_vsec_device *dev_to_ivdev(struct device *dev)
>  {
>  	return container_of(dev, struct intel_vsec_device, auxdev.dev);
> @@ -183,11 +185,23 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
>  #if IS_ENABLED(CONFIG_INTEL_VSEC)
>  int intel_vsec_register(struct pci_dev *pdev,
>  			 struct intel_vsec_platform_info *info);
> +int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> +			   struct intel_vsec_device *vsec_dev);
> +struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
>  #else
>  static inline int intel_vsec_register(struct pci_dev *pdev,
>  				       struct intel_vsec_platform_info *info)
>  {
>  	return -ENODEV;
>  }
> +static inline int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> +					 struct intel_vsec_device *vsec_dev)
> +{
> +	return -ENODEV;
> +}
> +static inline struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
>  #endif
>  #endif
> 

-- 
 i.

