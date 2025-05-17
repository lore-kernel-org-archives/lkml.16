Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687B20C00D
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507214; cv=none; b=YyDe7ricooCu51kD7vJgDqHZ4JFjD+Es1tyvIWjuTz7SQ3O4CrSXv3+8UOQ/op0bip4oZQAJY4k4Et5e+QfJiXP9FmTABYS9XprX7rP0f8G5sLR3t46EyoaLulHCNiZ6Y1YMjg/XqCb81kGzSXYe1HIjDXivjp8uPiYrfp4V/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507214; c=relaxed/simple;
	bh=mcqbB3OSks1i3kEeqOa4cR1y2JzRuGdNGXSiWr+7KRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyoNwYXwelqTXoGRmvChoIhdvVOyUWSp/S0G1AYrKFW+VrrrBOCypTfm1B6hQEVvO3BjK+USHdfUov4/oUxSn1cvEHo1uoMy1BEXDC97gomZvdlwlo+g+dpb3y7yQM1qTFKTwVA3a16gIklT4KCPi4tOjxHYpiGTkdCn8ECMOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es5m7hCa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es5m7hCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747507211; x=1779043211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mcqbB3OSks1i3kEeqOa4cR1y2JzRuGdNGXSiWr+7KRs=;
  b=Es5m7hCaUt106Rf+6kksbOdQzyrTsgZIKNLJzQmiycXz++Vb8p8paCCV
   /ZKqbabyOnJeQH8Sd8JRZ4N88+BZGP2Jz7xjUsmAwASDAKQfpO3mvXgNh
   RWlJ1A/fbARGANZ53hup6waO501vmyVU3G+8WSkhWavgYeBvEfj9bO4l1
   4LL0jUI9DUDOqnwUamKnol06osdM3EaLApYMIh1TcJx78vSUHULHtXwe5
   JYGX426/cVQRxz5PPQWGcGiwCn0hpk6A79DnBFyk0kM2UjuZ3pBxYAoHV
   COY3JqKLKZob5EIG4Cs3nanXX2qaDcULDsse/Z87+0PNZc2DGyC7lhGhA
   Q==;
X-CSE-ConnectionGUID: IyeG+wX+RtuM9e0koyueNw==
X-CSE-MsgGUID: WEDRQzNmRQioBM0ID9HhBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="52083161"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="52083161"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 11:40:11 -0700
X-CSE-ConnectionGUID: rzclCBmbTfivzkfEOcr4EQ==
X-CSE-MsgGUID: 0AyLfkQBSeqdM/yC2C6/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="144233360"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 May 2025 11:40:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGMS4-000KLR-1w;
	Sat, 17 May 2025 18:40:04 +0000
Date: Sun, 18 May 2025 02:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Juan Yescas <jyescas@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	tjmercier@google.com, isaacmanjarres@google.com,
	kaleshsingh@google.com, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v5] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-ID: <202505180240.0VkUp5gq-lkp@intel.com>
References: <20250516232341.659513-1-jyescas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516232341.659513-1-jyescas@google.com>

Hi Juan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250517-072434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250516232341.659513-1-jyescas%40google.com
patch subject: [PATCH v5] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250518/202505180240.0VkUp5gq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180240.0VkUp5gq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180240.0VkUp5gq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c: In function 'try_to_claim_block':
>> mm/page_alloc.c:2160:44: warning: left shift count >= width of type [-Wshift-count-overflow]
    2160 |         if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
         |                                            ^~


vim +2160 mm/page_alloc.c

1c30844d2dfe27 Mel Gorman       2018-12-28  2095  
4eb7dce6200711 Joonsoo Kim      2015-04-14  2096  /*
e47f1f56dd82cc Brendan Jackman  2025-02-28  2097   * This function implements actual block claiming behaviour. If order is large
e47f1f56dd82cc Brendan Jackman  2025-02-28  2098   * enough, we can claim the whole pageblock for the requested migratetype. If
e47f1f56dd82cc Brendan Jackman  2025-02-28  2099   * not, we check the pageblock for constituent pages; if at least half of the
e47f1f56dd82cc Brendan Jackman  2025-02-28  2100   * pages are free or compatible, we can still claim the whole block, so pages
e47f1f56dd82cc Brendan Jackman  2025-02-28  2101   * freed in the future will be put on the correct free list.
4eb7dce6200711 Joonsoo Kim      2015-04-14  2102   */
c0cd6f557b9090 Johannes Weiner  2024-03-20  2103  static struct page *
e47f1f56dd82cc Brendan Jackman  2025-02-28  2104  try_to_claim_block(struct zone *zone, struct page *page,
c0cd6f557b9090 Johannes Weiner  2024-03-20  2105  		   int current_order, int order, int start_type,
020396a581dc69 Johannes Weiner  2025-02-24  2106  		   int block_type, unsigned int alloc_flags)
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2107  {
02aa0cdd72483c Vlastimil Babka  2017-05-08  2108  	int free_pages, movable_pages, alike_pages;
e1f42a577f6364 Vlastimil Babka  2024-04-25  2109  	unsigned long start_pfn;
3bc48f96cf11ce Vlastimil Babka  2017-05-08  2110  
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2111  	/* Take ownership for orders >= pageblock_order */
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2112  	if (current_order >= pageblock_order) {
94deaf69dcd334 Huan Yang        2024-08-26  2113  		unsigned int nr_added;
94deaf69dcd334 Huan Yang        2024-08-26  2114  
e0932b6c1f942f Johannes Weiner  2024-03-20  2115  		del_page_from_free_list(page, zone, current_order, block_type);
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2116  		change_pageblock_range(page, current_order, start_type);
94deaf69dcd334 Huan Yang        2024-08-26  2117  		nr_added = expand(zone, page, order, current_order, start_type);
94deaf69dcd334 Huan Yang        2024-08-26  2118  		account_freepages(zone, nr_added, start_type);
c0cd6f557b9090 Johannes Weiner  2024-03-20  2119  		return page;
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2120  	}
fef903efcf0cb9 Srivatsa S. Bhat 2013-09-11  2121  
1c30844d2dfe27 Mel Gorman       2018-12-28  2122  	/*
1c30844d2dfe27 Mel Gorman       2018-12-28  2123  	 * Boost watermarks to increase reclaim pressure to reduce the
1c30844d2dfe27 Mel Gorman       2018-12-28  2124  	 * likelihood of future fallbacks. Wake kswapd now as the node
1c30844d2dfe27 Mel Gorman       2018-12-28  2125  	 * may be balanced overall and kswapd will not wake naturally.
1c30844d2dfe27 Mel Gorman       2018-12-28  2126  	 */
597c892038e080 Johannes Weiner  2020-12-14  2127  	if (boost_watermark(zone) && (alloc_flags & ALLOC_KSWAPD))
73444bc4d8f92e Mel Gorman       2019-01-08  2128  		set_bit(ZONE_BOOSTED_WATERMARK, &zone->flags);
1c30844d2dfe27 Mel Gorman       2018-12-28  2129  
ebddd111fcd13f Miaohe Lin       2023-08-01  2130  	/* moving whole block can fail due to zone boundary conditions */
e1f42a577f6364 Vlastimil Babka  2024-04-25  2131  	if (!prep_move_freepages_block(zone, page, &start_pfn, &free_pages,
e1f42a577f6364 Vlastimil Babka  2024-04-25  2132  				       &movable_pages))
c2f6ea38fc1b64 Johannes Weiner  2025-02-24  2133  		return NULL;
ebddd111fcd13f Miaohe Lin       2023-08-01  2134  
02aa0cdd72483c Vlastimil Babka  2017-05-08  2135  	/*
02aa0cdd72483c Vlastimil Babka  2017-05-08  2136  	 * Determine how many pages are compatible with our allocation.
02aa0cdd72483c Vlastimil Babka  2017-05-08  2137  	 * For movable allocation, it's the number of movable pages which
02aa0cdd72483c Vlastimil Babka  2017-05-08  2138  	 * we just obtained. For other types it's a bit more tricky.
02aa0cdd72483c Vlastimil Babka  2017-05-08  2139  	 */
02aa0cdd72483c Vlastimil Babka  2017-05-08  2140  	if (start_type == MIGRATE_MOVABLE) {
02aa0cdd72483c Vlastimil Babka  2017-05-08  2141  		alike_pages = movable_pages;
02aa0cdd72483c Vlastimil Babka  2017-05-08  2142  	} else {
02aa0cdd72483c Vlastimil Babka  2017-05-08  2143  		/*
02aa0cdd72483c Vlastimil Babka  2017-05-08  2144  		 * If we are falling back a RECLAIMABLE or UNMOVABLE allocation
02aa0cdd72483c Vlastimil Babka  2017-05-08  2145  		 * to MOVABLE pageblock, consider all non-movable pages as
02aa0cdd72483c Vlastimil Babka  2017-05-08  2146  		 * compatible. If it's UNMOVABLE falling back to RECLAIMABLE or
02aa0cdd72483c Vlastimil Babka  2017-05-08  2147  		 * vice versa, be conservative since we can't distinguish the
02aa0cdd72483c Vlastimil Babka  2017-05-08  2148  		 * exact migratetype of non-movable pages.
02aa0cdd72483c Vlastimil Babka  2017-05-08  2149  		 */
c0cd6f557b9090 Johannes Weiner  2024-03-20  2150  		if (block_type == MIGRATE_MOVABLE)
02aa0cdd72483c Vlastimil Babka  2017-05-08  2151  			alike_pages = pageblock_nr_pages
02aa0cdd72483c Vlastimil Babka  2017-05-08  2152  						- (free_pages + movable_pages);
02aa0cdd72483c Vlastimil Babka  2017-05-08  2153  		else
02aa0cdd72483c Vlastimil Babka  2017-05-08  2154  			alike_pages = 0;
02aa0cdd72483c Vlastimil Babka  2017-05-08  2155  	}
02aa0cdd72483c Vlastimil Babka  2017-05-08  2156  	/*
02aa0cdd72483c Vlastimil Babka  2017-05-08  2157  	 * If a sufficient number of pages in the block are either free or of
ebddd111fcd13f Miaohe Lin       2023-08-01  2158  	 * compatible migratability as our allocation, claim the whole block.
02aa0cdd72483c Vlastimil Babka  2017-05-08  2159  	 */
02aa0cdd72483c Vlastimil Babka  2017-05-08 @2160  	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
c0cd6f557b9090 Johannes Weiner  2024-03-20  2161  			page_group_by_mobility_disabled) {
e1f42a577f6364 Vlastimil Babka  2024-04-25  2162  		__move_freepages_block(zone, start_pfn, block_type, start_type);
c0cd6f557b9090 Johannes Weiner  2024-03-20  2163  		return __rmqueue_smallest(zone, order, start_type);
c0cd6f557b9090 Johannes Weiner  2024-03-20  2164  	}
3bc48f96cf11ce Vlastimil Babka  2017-05-08  2165  
c2f6ea38fc1b64 Johannes Weiner  2025-02-24  2166  	return NULL;
0aaa29a56e4fb0 Mel Gorman       2015-11-06  2167  }
0aaa29a56e4fb0 Mel Gorman       2015-11-06  2168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
