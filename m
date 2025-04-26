Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D8D2FB;
	Sat, 26 Apr 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745675051; cv=none; b=hcj4V7hp1t653Xaai8q/G9JBv8CcBfpKYOtPopi42XT7F99Gg0HbMxQL27IwrM5b6Jin/KcVwadul68a3wV0xCmEVlswQDtic1wB/csuPRn1OO/RTGcyfVtkcrgUuCVd1O0q52TzrxCzNKACRaU6R3xUoDvFAvfNnH0IhfbuxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745675051; c=relaxed/simple;
	bh=/6ZcHTrFwxuFFSTUOd/a/SNTe4vmQRtOyyekPIoJqV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBPOUYWQmyHheaq+kFPdMwc/0RfAAdWAzGUgHYTyJ4ml5Ja+jksD+8X9RFnVd7PWTpI8V4gjZe9KVq10ykMg4LGBXafUOWsDDEPLxPEd7aA+wyFVxK08ArqSZN/sScFPn49FnXmfBxDJ4mkSyL/FlKYjQXuXIjYa9dXk4yX/Cks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZjCyk+H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZjCyk+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745675049; x=1777211049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6ZcHTrFwxuFFSTUOd/a/SNTe4vmQRtOyyekPIoJqV8=;
  b=XZjCyk+He/6gCrDecpbQBuM6/N+JL9OtzJkLjQNq13Hn/5ycv2gyoHrv
   1Ztwxl+Pg9uT6Vxjc0wNR0AACb6CrlCQKfyznT5nKDjsCCw/8oiEE93HB
   KuIhrmDS7ZR6JzDqXzs7mcGYproqymH2ULJUPBZTWbqzKrnSFmJOXV16w
   kQU9BZMfcWWNWIPBhCM+zb1JCApGiQUeznsX1zg1bQxXOEHfaApBcotLS
   nzxhMcJOm0JgEgPG2naRnU5bzuIYF2spBzyuGZyQ1rAP6fI168aSfMETr
   9p0+1uCMl2jKidfLuiX4qLQJQ6P7PnaowFWWiQPyxlD5duQTLwghB/fCR
   w==;
X-CSE-ConnectionGUID: 8WW5e5sWQAyeCaZsiNcadg==
X-CSE-MsgGUID: raXTT/JCQQuU3BzJCnPn0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47229714"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47229714"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 06:44:08 -0700
X-CSE-ConnectionGUID: XXe6HGFGTf2THI7WoM7aMg==
X-CSE-MsgGUID: ML93VnwLSiOacHaZSYJBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="138222874"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Apr 2025 06:44:06 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8fp6-0005q9-0o;
	Sat, 26 Apr 2025 13:44:04 +0000
Date: Sat, 26 Apr 2025 21:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/omapdrm/omap_gem.c:45: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504262148.7C3el3ws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb drm/omap: Allow build with COMPILE_TEST=y
date:   12 months ago
config: arm64-randconfig-004-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262148.7C3el3ws-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262148.7C3el3ws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262148.7C3el3ws-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_gem.c:45: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * dma_addr contains the buffer DMA address. It is valid for
>> drivers/gpu/drm/omapdrm/omap_gem.c:68: warning: Cannot understand          * # of users
    on line 68 - I thought it was a doc line
   drivers/gpu/drm/omapdrm/omap_gem.c:73: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * If the buffer has been imported from a dmabuf the OMAP_DB_DMABUF flag
   drivers/gpu/drm/omapdrm/omap_gem.c:79: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * tiler block used when buffer is remapped in DMM/TILER.
   drivers/gpu/drm/omapdrm/omap_gem.c:84: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Array of backing pages, if allocated.  Note that pages are never
   drivers/gpu/drm/omapdrm/omap_gem.c:93: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Virtual address, if mapped.
--
>> drivers/gpu/drm/omapdrm/dss/pll.c:466: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                            * read the register back to ensure the write is


vim +45 drivers/gpu/drm/omapdrm/omap_gem.c

cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  27  
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  28  struct omap_gem_object {
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  29  	struct drm_gem_object base;
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  30  
f6b6036e56ca173 drivers/staging/omapdrm/omap_gem.c Rob Clark        2012-03-05  31  	struct list_head mm_list;
f6b6036e56ca173 drivers/staging/omapdrm/omap_gem.c Rob Clark        2012-03-05  32  
dfe9cfccb264889 drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2018-02-11  33  	u32 flags;
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  34  
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  35  	/** width/height for tiled formats (rounded up to slot boundaries) */
dfe9cfccb264889 drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2018-02-11  36  	u16 width, height;
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  37  
a6a918274116d8e drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-09  38  	/** roll applied when mapping to DMM */
dfe9cfccb264889 drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2018-02-11  39  	u32 roll;
a6a918274116d8e drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-09  40  
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  41  	/** protects pin_cnt, block, pages, dma_addrs and vaddr */
3cbd0c587b129be drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2018-05-26  42  	struct mutex lock;
3cbd0c587b129be drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2018-05-26  43  
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  44  	/**
16869083b9bec8c drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2017-04-21 @45  	 * dma_addr contains the buffer DMA address. It is valid for
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  46  	 *
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  47  	 * - buffers allocated through the DMA mapping API (with the
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  48  	 *   OMAP_BO_MEM_DMA_API flag set)
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  49  	 *
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  50  	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
f8cc37c59731c88 drivers/gpu/drm/omapdrm/omap_gem.c Andrew Davis     2023-11-13  51  	 *   if they are physically contiguous
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  52  	 *
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  53  	 * - buffers mapped through the TILER when pin_cnt is not zero, in which
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  54  	 *   case the DMA address points to the TILER aperture
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  55  	 *
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  56  	 * Physically contiguous buffers have their DMA address equal to the
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  57  	 * physical address as we don't remap those buffers through the TILER.
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  58  	 *
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  59  	 * Buffers mapped to the TILER have their DMA address pointing to the
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  60  	 * TILER aperture. As TILER mappings are refcounted (through pin_cnt)
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  61  	 * the DMA address must be accessed through omap_gem_pin() to ensure
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  62  	 * that the mapping won't disappear unexpectedly. References must be
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  63  	 * released with omap_gem_unpin().
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  64  	 */
16869083b9bec8c drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2017-04-21  65  	dma_addr_t dma_addr;
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  66  
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  67  	/**
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19 @68  	 * # of users
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  69  	 */
1948d28db6215d0 drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov  2022-01-19  70  	refcount_t pin_cnt;
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  71  
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  72  	/**
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  73  	 * If the buffer has been imported from a dmabuf the OMAP_DB_DMABUF flag
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  74  	 * is set and the sgt field is valid.
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  75  	 */
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  76  	struct sg_table *sgt;
b22e6690a3f656e drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2015-12-14  77  
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  78  	/**
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  79  	 * tiler block used when buffer is remapped in DMM/TILER.
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  80  	 */
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  81  	struct tiler_block *block;
f7f9f4536a09f9f drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-05  82  
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  83  	/**
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  84  	 * Array of backing pages, if allocated.  Note that pages are never
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  85  	 * allocated for buffers originally allocated from contiguous memory
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  86  	 */
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  87  	struct page **pages;
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  88  
f3bc9d24cb4a221 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-20  89  	/** addresses corresponding to pages in above array */
57c22f7cc24ab62 drivers/gpu/drm/omapdrm/omap_gem.c Laurent Pinchart 2017-04-21  90  	dma_addr_t *dma_addrs;
f3bc9d24cb4a221 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-12-20  91  
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  92  	/**
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  93  	 * Virtual address, if mapped.
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  94  	 */
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  95  	void *vaddr;
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  96  };
cd5351f4d2b1b88 drivers/staging/omapdrm/omap_gem.c Rob Clark        2011-11-12  97  

:::::: The code at line 45 was first introduced by commit
:::::: 16869083b9bec8c1090442bd176a5b376708aba0 drm: omapdrm: Rename occurrences of paddr to dma_addr

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
