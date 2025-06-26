Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F978F3E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896470; cv=none; b=PH4IhAHgnr9jkeLND/rk0Tk7JGAoQO0lCYrmjFo8SOvZpe8WcNdImyOqjRqtd/Engq1pV4lWscZIUCgKkvN+6ALlKbBnKmWOE8zE1KvPMej2KOZCWaAZfLGTaQ1mCHOQT8mkVc1WLyUqQXZef2XtF5S2yd4No8UMsNMK90QZ5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896470; c=relaxed/simple;
	bh=z+SuTfKWy/B9blRGA67JeMSchJi6yxjs/KNi6wLaXAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUa2Z+VBoQO1lery5ny8Yv6cQiPVCTHqTKbHeUmR7z2Wrlkykv9KqEaiaUwaNmHyUKBMe6csy0yl9Wnjd+LYuSjQChpEjoXPAcRpIjVz+teEoSecXmLCVLdngbA3PhKraDY+g/6xAfPNrvYg6zvOWpxJgtr1LSbqq8y+SelJ8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROl/x2lw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROl/x2lw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750896468; x=1782432468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+SuTfKWy/B9blRGA67JeMSchJi6yxjs/KNi6wLaXAk=;
  b=ROl/x2lw9whEg4tXJZfWxRXJPyCKrOzKPc8szCjOxNWohNUrcWbYYQv7
   K93uOVaHDeBjM674+ED2YvjY2Ulg+UVYg3Lbh24lduwTLggzQikrFj/RW
   33HAxFWZh1UQb0KMDGLjVBdZw4/qy6nbY9yyCMEKN8h1tpK9y8NZ//aB2
   hJuNJM5l2eqrAS9wAaHstyuJMfbekFkfrVBpnIQ8rzbstgkKKvmL4vg6w
   qjGv0bTDqqXJGis+uPzeTRRTY9qbfF2KDz7W/z/IYjBc2PdKUVXVgokvQ
   51tqrRgN7Eu2eU1nBR6zZPZ5nEoi17mbqienyaPVxwnYaPvKezI+bP3oF
   g==;
X-CSE-ConnectionGUID: Pv6pk1h7S7Oo16q4zA28TA==
X-CSE-MsgGUID: txJ4pCHLRAiVsHmf79ORmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64242691"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="64242691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 17:07:48 -0700
X-CSE-ConnectionGUID: 9F+CnZ+DTTaxYZTzWzBT0g==
X-CSE-MsgGUID: ljcNes9GQa2JXK3cOiBgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152660576"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2025 17:07:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUa9Y-000TYe-0D;
	Thu, 26 Jun 2025 00:07:44 +0000
Date: Thu, 26 Jun 2025 08:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616 19/19]
 include/asm-generic/tlb.h:378:2: error: type name requires a specifier or
 qualifier
Message-ID: <202506260845.3py4BoAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 78f053980ba50a0becae798ab7d07527d97e790d [19/19] treewide: Avoid -Wflex-array-member-not-at-end warnings
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250626/202506260845.3py4BoAJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260845.3py4BoAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260845.3py4BoAJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/oom_kill.c:49:
   In file included from arch/s390/include/asm/tlb.h:38:
>> include/asm-generic/tlb.h:378:2: error: type name requires a specifier or qualifier
     378 |         );};
         |         ^
>> include/asm-generic/tlb.h:378:2: error: expected member name or ';' after declaration specifiers
>> include/asm-generic/tlb.h:367:28: error: expected ';' at end of declaration list
     367 |         unsigned int            batch_count;
         |                                             ^
         |                                             ;
   3 errors generated.


vim +378 include/asm-generic/tlb.h

   327	
   328		unsigned long		start;
   329		unsigned long		end;
   330		/*
   331		 * we are in the middle of an operation to clear
   332		 * a full mm and can make some optimizations
   333		 */
   334		unsigned int		fullmm : 1;
   335	
   336		/*
   337		 * we have performed an operation which
   338		 * requires a complete flush of the tlb
   339		 */
   340		unsigned int		need_flush_all : 1;
   341	
   342		/*
   343		 * we have removed page directories
   344		 */
   345		unsigned int		freed_tables : 1;
   346	
   347		/*
   348		 * Do we have pending delayed rmap removals?
   349		 */
   350		unsigned int		delayed_rmap : 1;
   351	
   352		/*
   353		 * at which levels have we cleared entries?
   354		 */
   355		unsigned int		cleared_ptes : 1;
   356		unsigned int		cleared_pmds : 1;
   357		unsigned int		cleared_puds : 1;
   358		unsigned int		cleared_p4ds : 1;
   359	
   360		/*
   361		 * tracks VM_EXEC | VM_HUGETLB in tlb_start_vma
   362		 */
   363		unsigned int		vma_exec : 1;
   364		unsigned int		vma_huge : 1;
   365		unsigned int		vma_pfn  : 1;
   366	
 > 367		unsigned int		batch_count;
   368	
   369	#ifndef CONFIG_MMU_GATHER_NO_GATHER
   370		struct mmu_gather_batch *active;
   371		TRAILING_OVERLAP(struct mmu_gather_batch, local, encoded_pages,
   372				 struct page		*__pages[MMU_GATHER_BUNDLE];
   373	
   374	#ifdef CONFIG_MMU_GATHER_PAGE_SIZE
   375		unsigned int page_size;
   376	#endif
   377	#endif
 > 378		);};
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
