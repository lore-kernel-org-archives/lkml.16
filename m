Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A417224225
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433970; cv=none; b=X97guPXqzHsmyP4tiqElBceDnBIdwvxvDSIL35dukAO8TeEP6H8Zekig3bp0V7S9+cwhYdSfeGyco3IrBtvnSegVe6D3/gLiw7ePpyNt149p5eP3PGWNmngjI96p8apot7+bqNWrka44L3V4Nx8TBwobeFJ6TKU0EhplJg5okcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433970; c=relaxed/simple;
	bh=pNQgrf3kHx9tBSk5s9dabdfvWxeLz9IouCzZLXtswm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8rzwZ/qdvUajmXUyuqxyehnBPYd9Jt7AQ45z05ogP2lyD6D6wBuRr6V4mZOXqt/yNmDy1YnHaLveNFWaBrZVwgzP1i4yKrZitkVEyBCtMpjF12i7pRq7ZzjeIUeSmPwpJ6R/91WS48fpQPiYDveIZTPtQsmG/4NG3+VkUz4ZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIvJ3UqL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIvJ3UqL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747433968; x=1778969968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pNQgrf3kHx9tBSk5s9dabdfvWxeLz9IouCzZLXtswm8=;
  b=UIvJ3UqLvJofPZI+YG3gBzjVpWnjmeVISg0+3s/5unTWVp1/tRutnW1J
   xRWpXNrZS+8F473VZiXJniEj/fflJg3fEbct7/sFQfnZvv0J7A7brrnPW
   FAMoc1uENpzCJ/RRIIGeX7mADnr//LgFDouJXz+YeByciRhmFZQomE/sx
   WNmlDWddBz2my2Cq2Qvn9PfNvKFRzuP3enZ1/+8343ihTBLzRSDWDpdCA
   urxEvRoO+UFzZ5dduQK3fCvI0zaFC5nkfcZpWfSaw9oa0DPZP+fUAVYYJ
   Z3bQGkXgpLQOZxGOqI1TnFBhuVbhW3hdJCmdYyFyevQ5bEOEz7+7vPdCV
   w==;
X-CSE-ConnectionGUID: Znevp7VlQziieGGcH6QnDw==
X-CSE-MsgGUID: gj2ul9T/RZ2jkcU11f+xIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="71922646"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="71922646"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:19:28 -0700
X-CSE-ConnectionGUID: zhBWBYrtT3y3PomN/O1Ofw==
X-CSE-MsgGUID: Y0x76TZKR5mErtlBiwu4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="175946731"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:19:23 -0700
Date: Sat, 17 May 2025 01:19:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Tomas Winkler <tomasw@gmail.com>
Subject: Re: [PATCH v10 01/10] mtd: add driver for intel graphics
 non-volatile memory device
Message-ID: <aCe55yrAsAGsRMM2@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-2-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-2-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:36PM +0300, Alexander Usyskin wrote:
> Add auxiliary driver for intel discrete graphics
> non-volatile memory device.

A few nits below but we're good to go.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

...

> +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> +			      const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct intel_dg_nvm_dev *invm = auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> +	struct device *device;
> +	struct intel_dg_nvm *nvm;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	int ret;

Reverse xmas order (and same for all other patches for consistency).

...

> diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
> new file mode 100644
> index 000000000000..53193fda55eb
> --- /dev/null
> +++ b/include/linux/intel_dg_nvm_aux.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_DG_NVM_AUX_H__
> +#define __INTEL_DG_NVM_AUX_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/types.h>

Missing ioport.h

> +#define INTEL_DG_NVM_REGIONS 13
> +
> +struct intel_dg_nvm_region {
> +	const char *name;
> +};
> +
> +struct intel_dg_nvm_dev {
> +	struct auxiliary_device aux_dev;
> +	bool writable_override;
> +	struct resource bar;
> +	const struct intel_dg_nvm_region *regions;
> +};
> +
> +#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
> +
> +#endif /* __INTEL_DG_NVM_AUX_H__ */
> -- 
> 2.43.0
> 
