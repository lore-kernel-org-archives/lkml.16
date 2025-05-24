Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7171A7AF7
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082572; cv=none; b=BH2mQmJ1vDNkXO0Eighxh119ipufdGofaWNgpVFQmJX4KGIkzz0gEV71hcMthTxoIbdlSyvDx6NjYrcvWLJDxuPs3lxxMUYjisf0btOLLwNGCdEuqO/eoMZ0oygJ/poa/jYhytexVawBFShMgVi4JzOz858+HJtOePFfDruCqWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082572; c=relaxed/simple;
	bh=s6UiEN1Jm7OVCrzrD4ZPy3L4yqbPYUdJaL8UHsYSCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoL/8GNFjoChbkV6EeeqeiX64nySUT6ZvwQuCGY95vApS1Ftri/j/n0m+XOe7fJ7Z0df2uf0mlRvEJulPc/FlgwWAmzj+8Y0IGfLSWQnt82a+RXpJLYo9z25+BxRNKuhTsNyumylW6XD2y53LQRRTIO2YkHtEPYmHHcQhJ0hEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCXmTDft; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCXmTDft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748082571; x=1779618571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s6UiEN1Jm7OVCrzrD4ZPy3L4yqbPYUdJaL8UHsYSCNY=;
  b=RCXmTDftQCBmYUmiVN7O7vpaaXcoAtV29VxgDD2yOOOtsA3gqa5k7DDA
   jMjQWnW+Tj5jYj/Hwe0K0Yzm2WLNpYuq6b5kXfD0OsXM1bfYH4MB76rSh
   dGlAiWmCCETwTV72JayxXE5/vp9O1BOZZnivBun1wmdOBQ0g1PhvitMnc
   JjesNxUUJVE/bscWmLQAaDXNmu3aUhhplikuRDVXSi/HvS+GY+kdNNYnL
   Vy3fWRLWdXfElqFjglSMagKNOV3/Pgf3I9R8QGxs4lYnDUv6A/Gt4VgkA
   P3b4YMug+f114n+N3MkRRuzyhnBi4l0iyts5iDx3uM2zNNc+v+1k6r9gG
   g==;
X-CSE-ConnectionGUID: +I/SBokaSCObzM07B3uaFw==
X-CSE-MsgGUID: px75wd/oRIaO7CxxJxdXEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75522094"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="75522094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:29:30 -0700
X-CSE-ConnectionGUID: HrBfmwpQQvqMks20J/JY6g==
X-CSE-MsgGUID: a+CwcV1LRRSjgimO27u1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146700425"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:29:25 -0700
Date: Sat, 24 May 2025 13:29:22 +0300
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
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDGfgubuFfa3e0K_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-9-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void xe_nvm_init(struct xe_device *xe)
> +{

Same as patch 6, please handle errors.

> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writeable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;

Just out of curiosity, why off by one? Aren't ioremaps all PAGE_SIZEd?

> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Ditto as patch 6.

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag
