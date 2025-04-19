Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC81C1ADB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745060185; cv=none; b=oGTUDDEhH/hl6305u8Sa4SeZDNf0AqiugDIfP8qEECwg/YjFltRLocPNeAnLlvEXrIF3xGMUUDmGJEkwSH66MQkXMcWDe5Cxraxhr5AjT5ucXB1Zo3EpBufvPpBac3CUpY2qGEOhsFUMlA0SsEz2d1fubBYpM8gOFQ7zX2HkwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745060185; c=relaxed/simple;
	bh=Ii+nDVerTa9lkqZuTBs8VDiCSHcivF2EoyoBEUa+V20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti++LgTYpY3t3e5tJTfTIArtTLzY6g+mWqr7cS+++Sqe/v7jNsMVkqLQhVCa3+lnzN7LCGOVE0aDc78DOOVA+qH5WVweofYe65Bm9M3rmGbvqF8yGcOh9OdRaSsez71TlftXYxF6oQuOKseFmt7cOA8T/4M5zB2+E6EjIcGotSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhvWdQK+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhvWdQK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745060184; x=1776596184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ii+nDVerTa9lkqZuTBs8VDiCSHcivF2EoyoBEUa+V20=;
  b=NhvWdQK+46kNx4QhEJ/KoSwUn1zgI+dCophGXssrj//mfV+RxVxd4p/U
   9LfDfSKqe0+T0T2ea0zLrcJkvXxR6mYwVECWJJ7X/io1hSw5sqAEP8SWM
   YHtPn0VcBeCZJDzWa0Y8rvkigIyuOAyeWjqzqDdPr26qYi/WGqNuyikny
   g3y3jRQm8/1SgPo9f661u0aobdQaG3QvA6SZCnjAz65NWijshcbI+TqxL
   3jBKS++K9e9cD2iJvhcMVFxJahzm2s+9AxCfLkcmDXq5WR2ObLFAkkavZ
   uU6OSG4u+gKOAye6viGFJV6+bniZq1p8s5Imo2e1zXA4DZVbpuCFbg6/d
   w==;
X-CSE-ConnectionGUID: TkK5IuS0RnKfsa8tEvpX5Q==
X-CSE-MsgGUID: OoDgOQr8RNSdFHUV4u1t6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57658815"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="57658815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:56:24 -0700
X-CSE-ConnectionGUID: ysggq4LfQv29mI6DU0Y2Xw==
X-CSE-MsgGUID: kQgPqZWeSHKbMt/hKGdCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="168517271"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 03:56:21 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65ru-0003oD-0K;
	Sat, 19 Apr 2025 10:56:18 +0000
Date: Sat, 19 Apr 2025 18:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ruihan Li <lrh2000@pku.edu.cn>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <202504191858.5WVRkO7O-lkp@intel.com>
References: <20250418162727.1535335-1-lrh2000@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418162727.1535335-1-lrh2000@pku.edu.cn>

Hi Ruihan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruihan-Li/mm-mm_init-Don-t-iterate-pages-below-ARCH_PFN_OFFSET/20250419-002910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250418162727.1535335-1-lrh2000%40pku.edu.cn
patch subject: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
config: s390-randconfig-002-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191858.5WVRkO7O-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191858.5WVRkO7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191858.5WVRkO7O-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'memmap_init':
>> mm/mm_init.c:975:27: error: 'ARCH_PFN_OFFSET' undeclared (first use in this function); did you mean 'PREEMPT_OFFSET'?
     unsigned long hole_pfn = ARCH_PFN_OFFSET;
                              ^~~~~~~~~~~~~~~
                              PREEMPT_OFFSET
   mm/mm_init.c:975:27: note: each undeclared identifier is reported only once for each function it appears in


vim +975 mm/mm_init.c

   971	
   972	static void __init memmap_init(void)
   973	{
   974		unsigned long start_pfn, end_pfn;
 > 975		unsigned long hole_pfn = ARCH_PFN_OFFSET;
   976		int i, j, zone_id = 0, nid;
   977	
   978		for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
   979			struct pglist_data *node = NODE_DATA(nid);
   980	
   981			for (j = 0; j < MAX_NR_ZONES; j++) {
   982				struct zone *zone = node->node_zones + j;
   983	
   984				if (!populated_zone(zone))
   985					continue;
   986	
   987				memmap_init_zone_range(zone, start_pfn, end_pfn,
   988						       &hole_pfn);
   989				zone_id = j;
   990			}
   991		}
   992	
   993		/*
   994		 * Initialize the memory map for hole in the range [memory_end,
   995		 * section_end] for SPARSEMEM and in the range [memory_end, memmap_end]
   996		 * for FLATMEM.
   997		 * Append the pages in this hole to the highest zone in the last
   998		 * node.
   999		 */
  1000	#ifdef CONFIG_SPARSEMEM
  1001		end_pfn = round_up(end_pfn, PAGES_PER_SECTION);
  1002	#else
  1003		end_pfn = round_up(end_pfn, MAX_ORDER_NR_PAGES);
  1004	#endif
  1005		if (hole_pfn < end_pfn)
  1006			init_unavailable_range(hole_pfn, end_pfn, zone_id, nid);
  1007	}
  1008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
