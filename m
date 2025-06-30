Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962C224225;
	Mon, 30 Jun 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317008; cv=none; b=gdHnz2RgQ6ywGEvToPupFlmasCPICcjoBw7rWyDurWjOrP6K2izQcrQ+I912+DcVrsNfcgUrqd/Z1rsbeMY0gGFNq0AZ68euG4G7gpLGReuEIAWD1q6kd8VZyLlU0fIpmSRko9ebWMB1aAMzgwgvJy+GXM2EF0imJWbClCBKbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317008; c=relaxed/simple;
	bh=xcJj2Ho6aEt8FKDQN+GTeUbgQAvfBryq4Yyzc0joCRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGehwwmUQadBG7FTKkrfoehvxhNc+HwAaAJQz0MCll2eEETGIikyCZNkxCEa7dr99hvD78sj2Fo3RPz/YbABJvHry3D04Dyf+ks2WiplSpHh+PSm0w1VsKoP+IISkgoMh7Syiu2LyZg8KKiZteaYLwVhwF2GyQ+mWNHbtiCsqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEAEhQog; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEAEhQog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751317006; x=1782853006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xcJj2Ho6aEt8FKDQN+GTeUbgQAvfBryq4Yyzc0joCRI=;
  b=VEAEhQogdGCJy7/W40dOkAHOJmhpAz4w+3C1UBr7qQLXaCtYCKXK8HeI
   +YV3mqbmN+SSFtyFEL4dze1+5BRyDiadRzOX9IsBbCCemcXLcE8pAjuxd
   xpXCOsPgDqn2WVDv0FPcwzisIrXygu/DyOFB9yfcxDajqFCZ80Xg0+lTB
   LkfaTDZT6kG2F1tZy2qUT8kocwVkFezTsigBpPkMpYuhw7uK3Dh8k/SRU
   hDYw1GyTZtyE6+u1Rz1a2lXD4OvfAEjg1uMqIvC3LKNF2M9lixMOJDvuq
   YI4JklJ66ng5F7KYQHIcuKLzW9lfjoIYlRzGqpMQZkZd8OV5Eo+utzJMA
   Q==;
X-CSE-ConnectionGUID: E42iXMyDRZaIqz8lwHC2Tw==
X-CSE-MsgGUID: G+tKrZIYR+i1oPM0fM5mVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64609661"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64609661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:56:45 -0700
X-CSE-ConnectionGUID: ihL9zh0BQDard95Pi5cEOQ==
X-CSE-MsgGUID: tOMaTQljQAyiYlx9GuZDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153042668"
Received: from ldmartin-desk2.corp.intel.com (HELO localhost) ([10.124.221.227])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:56:46 -0700
Date: Mon, 30 Jun 2025 13:56:44 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, xi.pardee@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 11/15] platform/x86/intel/vsec: Set OOBMSM to CPU
 mapping
Message-ID: <jccsjzzza6pdfaxzbtz5j6xydgyfv22pgviml4sdexatkux2h7@cr36qum7ksg7>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
 <20250617014041.2861032-12-david.e.box@linux.intel.com>
 <9911d37b-eff6-2562-2e52-7bcd656186c0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9911d37b-eff6-2562-2e52-7bcd656186c0@linux.intel.com>

On Mon, Jun 30, 2025 at 02:55:41PM +0300, Ilpo Järvinen wrote:
> On Mon, 16 Jun 2025, David E. Box wrote:
> 
> > Add functions, intel_vsec_set/get_mapping(), to set and retrieve the
> > OOBMSM-to-CPU mapping data in the private data of the parent Intel VSEC
> > driver. With this mapping information available, other Intel VSEC features
> > on the same OOBMSM device can easily access and use the mapping data,
> > allowing each of the OOBMSM features to map to the CPUs they provides data
> > for.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > Changes in v2:
> >   - No changes
> > 
> >  drivers/platform/x86/intel/vsec.c | 31 +++++++++++++++++++++++++++++++
> >  include/linux/intel_vsec.h        | 14 ++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> > index 98f570a389c6..8c330b57e4d4 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -43,6 +43,7 @@ enum vsec_device_state {
> >  struct vsec_priv {
> >  	struct intel_vsec_platform_info *info;
> >  	struct device *suppliers[VSEC_FEATURE_COUNT];
> > +	struct oobmsm_plat_info plat_info;
> >  	enum vsec_device_state state[VSEC_FEATURE_COUNT];
> >  	unsigned long found_caps;
> >  };
> > @@ -660,6 +661,36 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  	return 0;
> >  }
> >  
> > +int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> > +			   struct intel_vsec_device *vsec_dev)
> > +{
> > +	struct vsec_priv *priv;
> > +
> > +	priv = pci_get_drvdata(vsec_dev->pcidev);
> > +	if (!priv)
> > +		return -EINVAL;
> > +
> > +	priv->plat_info = *plat_info;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(intel_vsec_set_mapping, "INTEL_VSEC");
> > +
> > +struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev)
> > +{
> > +	struct vsec_priv *priv;
> > +
> > +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	priv = pci_get_drvdata(pdev);
> > +	if (!priv)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	return &priv->plat_info;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(intel_vsec_get_mapping, "INTEL_VSEC");
> > +
> >  /* DG1 info */
> >  static struct intel_vsec_header dg1_header = {
> >  	.length = 0x10,
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index cd78d0b2e623..b15155ff1154 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -170,6 +170,8 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> >  		       struct intel_vsec_device *intel_vsec_dev,
> >  		       const char *name);
> >  
> > +int intel_vsec_suppliers_ready(struct intel_vsec_device *vsec_dev,
> > +			       unsigned long needs);
> 
> There's no code for this anywhere in the series??

You're right. This is a leftover from an earlier revision that was dropped
during rework. It should be removed from the header. I’ll clean it up in the
next version.

David
> 
> >  static inline struct intel_vsec_device *dev_to_ivdev(struct device *dev)
> >  {
> >  	return container_of(dev, struct intel_vsec_device, auxdev.dev);
> > @@ -183,11 +185,23 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
> >  #if IS_ENABLED(CONFIG_INTEL_VSEC)
> >  int intel_vsec_register(struct pci_dev *pdev,
> >  			 struct intel_vsec_platform_info *info);
> > +int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> > +			   struct intel_vsec_device *vsec_dev);
> > +struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
> >  #else
> >  static inline int intel_vsec_register(struct pci_dev *pdev,
> >  				       struct intel_vsec_platform_info *info)
> >  {
> >  	return -ENODEV;
> >  }
> > +static inline int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
> > +					 struct intel_vsec_device *vsec_dev)
> > +{
> > +	return -ENODEV;
> > +}
> > +static inline struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev)
> > +{
> > +	return ERR_PTR(-ENODEV);
> > +}
> >  #endif
> >  #endif
> > 
> 
> -- 
>  i.
> 
> 
