Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492E381B9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738297034; cv=none; b=u5KeOCGBmrvHA0BbWk4kkx5suSdFiEpkN3Bk6YqhoDpIhszZxc7FLdfIuNhwD3Crbe7bG7NAmSO0Bskx/HgpCppmFFZ4IM0XkCpKvYPPcpQQdyfC4WKI+KF+anYTqH9fzkNU33z9xBoVS04QfWRNuWR1F9pAs+eMrr0aYVfVbXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738297034; c=relaxed/simple;
	bh=GIXfizN4xUpIB2Gw/bX+C4ny4ZM6C1H5byUbzR2sr1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvMwJo6o5As9px34ERyu0rk8L3Bm6GvCBU+6PlcJcR/70Usl0IN0KnH9P7xQNVisSYN/DEOBJy6oFyHcZ3bfMf/+U480hQs67Fi/RULay2db/RFTZM49f8kQdilDblyVhs50o9T1GdwRTajXemI2+cPKSfQuMIdt1M40PaFhw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6GL3CXf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6GL3CXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738297032; x=1769833032;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GIXfizN4xUpIB2Gw/bX+C4ny4ZM6C1H5byUbzR2sr1I=;
  b=d6GL3CXfjHm6cGRhQhVru7jYwo0SKncnzrsqz2N7geW19dURURV0tABP
   aOOtaJYz2afsu3aWfOifDMhYflHibX0viSngDxz27h0rcfGRNsdRHKHk2
   PooFrDd/oyqzvIN+z/L3j9zjJKZNr60JSk/s33q2aKAt/TzYwkdh5RcD5
   5XPnJRGFpuqNhN1rUIt9iTJuFCT1PuaqsDxOYfzE/QZNJ2Wy3I5urrXG2
   i5myx1abAndghu4L9cFtuosfz45PTDvMrwq7Tc7mz5KuQQ2sW50zyeiza
   U34HWND+z+QwapkggdtLQElMH4gTvQ/tZxRc21j+zt15bOUdajOE7ZMvO
   g==;
X-CSE-ConnectionGUID: Bh1y6oUmSZuBxQOMMlC1fQ==
X-CSE-MsgGUID: Q3k9TubVTDmDbMf77481cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38745882"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="38745882"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 20:17:12 -0800
X-CSE-ConnectionGUID: HsO5LMPTQiq7OGI77hzJ/w==
X-CSE-MsgGUID: oFQHHrDhRfSBnjGekXcxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="110116747"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2025 20:17:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdiSq-000lvI-09;
	Fri, 31 Jan 2025 04:17:08 +0000
Date: Fri, 31 Jan 2025 12:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpu/drm/radeon/radeon_cs.c:418: warning: Excess function
 parameter 'backoff' description in 'radeon_cs_parser_fini'
Message-ID: <202501311245.Y5DLruKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: e2b3f7c88cc153a0edc155b976fd825440015632 drm/radeon: switch over to drm_exec v2
date:   2 months ago
config: alpha-randconfig-r026-20211101 (https://download.01.org/0day-ci/archive/20250131/202501311245.Y5DLruKs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311245.Y5DLruKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311245.Y5DLruKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_cs.c:418: warning: Excess function parameter 'backoff' description in 'radeon_cs_parser_fini'


vim +418 drivers/gpu/drm/radeon/radeon_cs.c

4330441a745ea0 Marek Olšák       2014-03-02  407  
771fe6b912fca5 Jerome Glisse     2009-06-05  408  /**
3ffa59a01c2676 Lee Jones         2021-05-20  409   * radeon_cs_parser_fini() - clean parser states
771fe6b912fca5 Jerome Glisse     2009-06-05  410   * @parser:	parser structure holding parsing context.
771fe6b912fca5 Jerome Glisse     2009-06-05  411   * @error:	error number
f5ef92b5af0f60 Lee Jones         2020-11-09  412   * @backoff:	indicator to backoff the reservation
771fe6b912fca5 Jerome Glisse     2009-06-05  413   *
771fe6b912fca5 Jerome Glisse     2009-06-05  414   * If error is set than unvalidate buffer, otherwise just free memory
771fe6b912fca5 Jerome Glisse     2009-06-05  415   * used by parsing context.
771fe6b912fca5 Jerome Glisse     2009-06-05  416   **/
e2b3f7c88cc153 Christian König   2022-05-04  417  static void radeon_cs_parser_fini(struct radeon_cs_parser *parser, int error)
771fe6b912fca5 Jerome Glisse     2009-06-05 @418  {
771fe6b912fca5 Jerome Glisse     2009-06-05  419  	unsigned i;
771fe6b912fca5 Jerome Glisse     2009-06-05  420  
e43b5ec05afdc2 Jerome Glisse     2012-08-06  421  	if (!error) {
e2b3f7c88cc153 Christian König   2022-05-04  422  		struct radeon_bo_list *reloc;
e2b3f7c88cc153 Christian König   2022-05-04  423  
4330441a745ea0 Marek Olšák       2014-03-02  424  		/* Sort the buffer list from the smallest to largest buffer,
4330441a745ea0 Marek Olšák       2014-03-02  425  		 * which affects the order of buffers in the LRU list.
4330441a745ea0 Marek Olšák       2014-03-02  426  		 * This assures that the smallest buffers are added first
4330441a745ea0 Marek Olšák       2014-03-02  427  		 * to the LRU list, so they are likely to be later evicted
4330441a745ea0 Marek Olšák       2014-03-02  428  		 * first, instead of large buffers whose eviction is more
4330441a745ea0 Marek Olšák       2014-03-02  429  		 * expensive.
4330441a745ea0 Marek Olšák       2014-03-02  430  		 *
4330441a745ea0 Marek Olšák       2014-03-02  431  		 * This slightly lowers the number of bytes moved by TTM
4330441a745ea0 Marek Olšák       2014-03-02  432  		 * per frame under memory pressure.
4330441a745ea0 Marek Olšák       2014-03-02  433  		 */
4330441a745ea0 Marek Olšák       2014-03-02  434  		list_sort(NULL, &parser->validated, cmp_size_smaller_first);
e2b3f7c88cc153 Christian König   2022-05-04  435  		list_for_each_entry(reloc, &parser->validated, list) {
e2b3f7c88cc153 Christian König   2022-05-04  436  			dma_resv_add_fence(reloc->robj->tbo.base.resv,
e2b3f7c88cc153 Christian König   2022-05-04  437  					   &parser->ib.fence->base,
e2b3f7c88cc153 Christian König   2022-05-04  438  					   reloc->shared ?
e2b3f7c88cc153 Christian König   2022-05-04  439  					   DMA_RESV_USAGE_READ :
e2b3f7c88cc153 Christian König   2022-05-04  440  					   DMA_RESV_USAGE_WRITE);
e2b3f7c88cc153 Christian König   2022-05-04  441  		}
e43b5ec05afdc2 Jerome Glisse     2012-08-06  442  	}
147666fb3b93b8 Thomas Hellstrom  2010-11-17  443  
e2b3f7c88cc153 Christian König   2022-05-04  444  	drm_exec_fini(&parser->exec);
e2b3f7c88cc153 Christian König   2022-05-04  445  
fcbc451ba1948f Pauli Nieminen    2010-03-19  446  	if (parser->relocs != NULL) {
771fe6b912fca5 Jerome Glisse     2009-06-05  447  		for (i = 0; i < parser->nrelocs; i++) {
d33a8fc719e8d3 Christian König   2014-11-27  448  			struct radeon_bo *bo = parser->relocs[i].robj;
d33a8fc719e8d3 Christian König   2014-11-27  449  			if (bo == NULL)
d33a8fc719e8d3 Christian König   2014-11-27  450  				continue;
d33a8fc719e8d3 Christian König   2014-11-27  451  
f11fb66ae92193 Emil Velikov      2020-05-15  452  			drm_gem_object_put(&bo->tbo.base);
771fe6b912fca5 Jerome Glisse     2009-06-05  453  		}
fcbc451ba1948f Pauli Nieminen    2010-03-19  454  	}
48e113e516a94a Michel Dänzer     2009-09-15  455  	kfree(parser->track);
2098105ec65cb3 Michal Hocko      2017-05-17  456  	kvfree(parser->relocs);
2098105ec65cb3 Michal Hocko      2017-05-17  457  	kvfree(parser->vm_bos);
28a326c592e3e4 Maarten Lankhorst 2013-10-09  458  	for (i = 0; i < parser->nchunks; i++)
2098105ec65cb3 Michal Hocko      2017-05-17  459  		kvfree(parser->chunks[i].kdata);
3fcb4f01deedfa Chen Li           2021-03-02  460  	kvfree(parser->chunks);
3fcb4f01deedfa Chen Li           2021-03-02  461  	kvfree(parser->chunks_array);
771fe6b912fca5 Jerome Glisse     2009-06-05  462  	radeon_ib_free(parser->rdev, &parser->ib);
b7f6413a731f21 Jerome Glisse     2012-05-02  463  	radeon_ib_free(parser->rdev, &parser->const_ib);
b7f6413a731f21 Jerome Glisse     2012-05-02  464  }
771fe6b912fca5 Jerome Glisse     2009-06-05  465  

:::::: The code at line 418 was first introduced by commit
:::::: 771fe6b912fca54f03e8a72eb63058b582775362 drm/radeon: introduce kernel modesetting for radeon hardware

:::::: TO: Jerome Glisse <jglisse@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
