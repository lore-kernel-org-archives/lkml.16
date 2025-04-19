Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F7BE4E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745060845; cv=none; b=mvVApygs6bUlY97tLKS12378m1Yv+BCF0ELvayMNXV0MejUfVV/JruxFzZV4HJFSAYMZfhn8g7EpiZCIHFVPqSmjTrkTGheAkrK9U2sRxLUDd7jtNJmUKhR1OSP6AbXEFl/HFPWHczX8BEkltkcQOxSfSg6lTDyQ0nJSu6g62Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745060845; c=relaxed/simple;
	bh=6/Bq+wC1TElgwKJijhenPYtXnDs2ewz5mgzreuNFVEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeO8FHZUk2dqemqFNw+gBx4ClT8OnpYu9AXT0Rk/O6Z387mTEA0DLOdksEKqqTcAjlxZLO4kPzNLRKE2hfKHavEBdinPvor1aNF0SpzKBK6aBQ21So9nS+oeZLENMXKnDa9txBo3OgErdFlmtliDHzUDZyp1TKuNJn4wUYnFM9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipfxEpw1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipfxEpw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745060844; x=1776596844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6/Bq+wC1TElgwKJijhenPYtXnDs2ewz5mgzreuNFVEc=;
  b=ipfxEpw1tOqoRRLQt+CxR8Dwk+Sz2jPJfyxN2VCI0K1nauoRqm52Mi6J
   mhMrj7RaoKUno2f9qf/KXC7c7xPyRgfWdvC+xp0Ms471HXA6ElsvCLauA
   cY4kVfmKQa1kRw85ePwtf8dQeeuAcRCEUzfhB387w7w4pyRFW5UO7WH8m
   627pXcoutIQz72q7aREep/Ez4/zzSJDwiGYoVaV6qLFXn9tY2QZdOCbQE
   9OrBz5r3q34nJd6madF17gtrzwuaOG6KVTW+GUgTcjPal6bi79jKSwqQG
   TyoGyyK7dwiju6F6rReusAJXAQ9NkU1cJmcioYNRDsO/Gso5xvbW2ZjUN
   A==;
X-CSE-ConnectionGUID: D6fQo3K/TDeCataQJLDoFQ==
X-CSE-MsgGUID: jP712l47Tfq0dXVTSg7XzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46679764"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46679764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 04:07:23 -0700
X-CSE-ConnectionGUID: 1M3dG9vYQH+NyN2r9P4ykw==
X-CSE-MsgGUID: 2YiU9dAXSR+8dPesollMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131891179"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2025 04:07:22 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u662Y-0003oP-2n;
	Sat, 19 Apr 2025 11:07:18 +0000
Date: Sat, 19 Apr 2025 19:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ruihan Li <lrh2000@pku.edu.cn>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <202504191834.zUYILN1L-lkp@intel.com>
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
config: s390-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191834.zUYILN1L-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191834.zUYILN1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191834.zUYILN1L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:975:27: error: use of undeclared identifier 'ARCH_PFN_OFFSET'
     975 |         unsigned long hole_pfn = ARCH_PFN_OFFSET;
         |                                  ^
   1 error generated.


vim +/ARCH_PFN_OFFSET +975 mm/mm_init.c

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
