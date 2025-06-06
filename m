Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8A1DE889
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239249; cv=none; b=jRvqrwdWyhcdiJyyiTxHySHfbqhld70+b/8OGg8QuQUQIrNhL9sGKoIIs5IhE5lL0/OIdWv6CkxmwbAKtC99XUPdl+Atmo+aNXJBWlBNhmn41YTfrfFalMdM57X4OkkB5V61DG/fVGuiuTcEN37CZ2VYH1fbQJpna5F+oywx0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239249; c=relaxed/simple;
	bh=waQvTFW1Tv1+HpQpBDsNKSK2lSYc7esWz0DnZzD7BfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAnCj312tnBIcXJErAUsrDX9CGrmnil0fZgqwouDjiGPi1FiDTYcfoMHz2l0qzSiTb5gNqknIRHcRV4tPr+f105HVWjQtPaG+mhVox9LZRtxmIAXX6WdUP0UOBc6vPj10gIoBTiA1hIxS4nl70DIdoRXVuKjTfPwYh4uPMm8BQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRF5+ni5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRF5+ni5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749239247; x=1780775247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=waQvTFW1Tv1+HpQpBDsNKSK2lSYc7esWz0DnZzD7BfE=;
  b=XRF5+ni57zsDuhXYJVPx4y5MjTmDRt0RyjKT2+Yh2/aj4WtqAqdmRYWZ
   wRfWapxpXKFP4Q6szVEdfP3JxrrXhCgy89pff1lJC8lFqVJVeX+l/jwKd
   VL/6Eynzl5s+6VL5EZf8lwsbOqnP08p5OKp2xAxBbVxBt5kvTkLXuWxfT
   fpa4AQDUU/WTvvfgd7p2pml+9sNLugP/N2cY+VS8f6DY737KxTRGa9uxZ
   OaDb7meroAJcNELvJwqK4hWPWelIZq7APQ+gpo1DOMzg7kKabhPtjkuoo
   PcPeJ0KFHfUQXavz08t2LYs4+IvIIdrk0oy7/1/UG6S6MFOfNN6sNBgPi
   Q==;
X-CSE-ConnectionGUID: sE7w52LiT82E4SPTbIDdIQ==
X-CSE-MsgGUID: lVxRISDKSp2W8MQqY7cAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61665401"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="61665401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 12:47:27 -0700
X-CSE-ConnectionGUID: IjxxRQuWQ+q54FJCWZ6g+g==
X-CSE-MsgGUID: vgUl0eiYTQuEPBq2cfEHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="150925381"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2025 12:47:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNd27-0005FJ-17;
	Fri, 06 Jun 2025 19:47:19 +0000
Date: Sat, 7 Jun 2025 03:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
Message-ID: <202506070340.P5oZoRwh-lkp@intel.com>
References: <20250606120519.753928-5-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120519.753928-5-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7247efca0dcbc8ac6147db9200ed1549c0662465]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_get_map/20250606-200804
base:   7247efca0dcbc8ac6147db9200ed1549c0662465
patch link:    https://lore.kernel.org/r/20250606120519.753928-5-jfalempe%40redhat.com
patch subject: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
config: x86_64-buildonly-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070340.P5oZoRwh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070340.P5oZoRwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070340.P5oZoRwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo_util.c:381: warning: Cannot understand  *
    on line 381 - I thought it was a doc line


vim +381 drivers/gpu/drm/ttm/ttm_bo_util.c

   379	
   380	/**
 > 381	 *
   382	 * ttm_bo_kmap_try_from_panic
   383	 *
   384	 * @bo: The buffer object
   385	 * @page: The page to map
   386	 *
   387	 * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
   388	 * This can safely be called from the panic handler, if you make sure the bo
   389	 * is the one being displayed, so is properly allocated, and won't be modified.
   390	 *
   391	 * Returns the vaddr, that you can use to write to the bo, and that you should
   392	 * pass to kunmap_local() when you're done with this page, or NULL if the bo
   393	 * is in iomem.
   394	 */
   395	void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
   396	{
   397		if (page + 1 > PFN_UP(bo->resource->size))
   398			return NULL;
   399	
   400		if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
   401			return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
   402	
   403		return NULL;
   404	}
   405	EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
