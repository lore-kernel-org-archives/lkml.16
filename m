Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72294EAE7
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082022; cv=none; b=PStqLX5vVp5CUqNuDn5uo+iIbB1BN/ikTmeDsGsYn+amoqg3usf8zHvS/ARmbKcGdanfGqnDnc7E6UUtL4rb39JKncvsLwiwBMOgXG4JHcbmRBW1YDlWDcdMNTmsC6xR877AU1JFDT6cf9szCNL5iIJdP2fpwndgnJSyFkgZyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082022; c=relaxed/simple;
	bh=KAzAK7TgNRgfMo1XSxTNbqWPQmUnZXND6HQQpmqPXwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJxBulfpB970oWHCamcUF3/PyLJdle4QsxXB9ucurf6/OSEzeBNQ4QnU8IsD8s580d0aBRT2I3JzL0P/FLbdoSbhhMN9r53LGhE9tzmqfVbSG0/SYboqewRBGD8wThaek7eGAy68Et/4s0+SeZKC7BB4d2rXSwacXAmOhunHKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvuF6eQk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvuF6eQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748082020; x=1779618020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAzAK7TgNRgfMo1XSxTNbqWPQmUnZXND6HQQpmqPXwQ=;
  b=QvuF6eQkqyqXqD6ztHsblXOsiEMZVT5jsYjoB5gdKou+tlYxHzsle2H/
   oaj9X2XZoJPRMRuO07KQor4NwxOcL9HIf5spz7SRa0g6/CqRCASwopw/u
   P3YDUXyRDmOLwjIDA2SycdsfJV5ymEDpYYa1Dq3t7If56xB1Yni3nSrGm
   038gyna59VeMeA0ZubrQPAN8joMa//8SRGmDmBgp8qAs4UdccpYGVs6DJ
   imwLNaIHegjKnbN2VoMaJqL+X90oHGip2hrsQkkC/cgG/tz1A8J0w7uPD
   0OYC+WVJ9jaLhE2ylADTrxzlk9xJcjQL8D9ez93RT5kKm1fmMkE2vhnUP
   g==;
X-CSE-ConnectionGUID: EnPSfYAVRQuJGElwOTqKvQ==
X-CSE-MsgGUID: 66idiVpDREmqBxfvRVYNOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49241365"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49241365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:20:18 -0700
X-CSE-ConnectionGUID: UtDEC9GMRJ229+0hrrPFMw==
X-CSE-MsgGUID: vhFYDXKRSCaVzMriwIjFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146382875"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:20:13 -0700
Date: Sat, 24 May 2025 13:20:10 +0300
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
Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Message-ID: <aDGdWof1HfViERND@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133345.2805031-7-alexander.usyskin@intel.com>

On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on
> DGFX devices via a child device.
> The nvm child device is exposed via auxiliary bus.

...

> +void intel_nvm_init(struct drm_i915_private *i915)
> +{

Lucas recently revamped xe driver to address this, so let's not hide bugs
and return an error where possible.

> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	struct intel_dg_nvm_dev *nvm;
> +	struct auxiliary_device *aux_dev;
> +	int ret;
> +
> +	/* Only the DGFX devices have internal NVM */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(i915->nvm))
> +		return;
> +
> +	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!i915->nvm)
> +		return;
> +
> +	nvm = i915->nvm;
> +
> +	nvm->writeable_override = true;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);

Why not just pci_dev_id()?

> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = i915_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}

Raag
