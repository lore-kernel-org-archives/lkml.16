Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EB2036FB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268658; cv=none; b=HRWIxNq1UW/NFRmH+KXuJNhfaZ4t4iSXvstgO7Rz181HBwMaJDU4UGX2u2rSvVfrr56rgmHGl8CIzMgojHYt2438Atl2aH8g+RXVK5gUzrrprrvnwqRHbL5JzdBHFbGeSBUZFYgpFpHKDxgBYMwL0Su4UyMAqjyWpdNSTFOME/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268658; c=relaxed/simple;
	bh=a+gKW0Py71TalASop7ZxdQ6rsdM207Gm+oHvKtY/2NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Urcysv7EI7Ylf3V50SyVI+BRWWf3Mk1U1mAIUu6hpAdBgCCMKzc1O3XjuN1AwxG14bejmJnhfXPPtA9Jyip4ZTZ8qHVDNrqwDiFT9+YnRLktW2YHkVMS6okABr4iCdKU3J++kqvXHAlulGQtXzP4Adyz26NZIOIqj24Vv3FzS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo8iUjkk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo8iUjkk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268657; x=1775804657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+gKW0Py71TalASop7ZxdQ6rsdM207Gm+oHvKtY/2NU=;
  b=Yo8iUjkk5vA9po4GQJe8cpZJefkrfPnPL2rrxg5kA42Di70U21oyuIdD
   EfWjZO/Ei15rdVyXQMHyhmH9PdQtD52meDiSn4vB6oce7L+KDF94gc9ce
   eanMVuK13HhorfwPgsoRqTczwbBSKdky+VEtp9U/M/lzSc74x2/DbMJxn
   vydCNMBPNW06zQ7BvU7qTMqVlJjDTkl2UKX/Fzm08VEZU08EvXnPcqi9G
   80wKPdgv/GUzGhA6XdwGTQJ2P9OjOjDdeCpI0RLt9SUxnUuupztzZr83H
   UOll2DfZifHMUJBql5vjVgfhlJjG4dxPZHdBTGkxnhdOntDHDJRg6j1TS
   w==;
X-CSE-ConnectionGUID: yNfx2+tMSfCsMLKTDObrpQ==
X-CSE-MsgGUID: JkP0fYh/TtWh7f1gWTFT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57148363"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57148363"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:04:16 -0700
X-CSE-ConnectionGUID: QW5AF7cFTy6leIoI2btU1Q==
X-CSE-MsgGUID: k29QXuKITxe/4SVEciXV2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133677191"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2025 00:04:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2lxK-0009jx-22;
	Thu, 10 Apr 2025 07:04:10 +0000
Date: Thu, 10 Apr 2025 15:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
Message-ID: <202504101459.iFHlVGBA-lkp@intel.com>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>

Hi Donet,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/base-node-Use-curr_node_memblock_intersect_memory_block-to-Get-Memory-Block-NID-if-CONFIG_DEFERRED_STRUCT_PAGE_INIT-is-S/20250409-132924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom%40linux.ibm.com
patch subject: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check if the Current Node's Memblock Region Intersects with a Memory Block
config: csky-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101459.iFHlVGBA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101459.iFHlVGBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101459.iFHlVGBA-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memblock.c: In function 'curr_node_memblock_intersect_memory_block':
>> mm/memblock.c:1943:22: error: 'struct memblock_region' has no member named 'nid'
    1943 |                 if (r->nid == curr_nid) {
         |                      ^~


vim +1943 mm/memblock.c

  1913	
  1914	/**
  1915	 * curr_node_memblock_intersect_memory_block:  checks if the current node's memblock
  1916	 * region intersects with the memory block.
  1917	 * @start_pfn: memory block start pfn
  1918	 * @end_pfn: memory block end_pfn
  1919	 * @curr_nid: Current node
  1920	 *
  1921	 * This function takes the start and end PFN of a memory block, as well as the node ID
  1922	 * that is being registered. It then finds the memblock region of the current node and
  1923	 * checks if the passed memory block intersects with the memblock. If there is an
  1924	 * intersection, the function returns true; otherwise, it returns false.
  1925	 *
  1926	 * Return:
  1927	 * If the current node's memblock region intersects with the memory block, it returns
  1928	 * true; otherwise, it returns false.
  1929	 */
  1930	bool __init_memblock curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
  1931							unsigned long end_pfn, int curr_nid)
  1932	{
  1933		struct memblock_region *r;
  1934		unsigned long r_start, r_end;
  1935		unsigned long size = end_pfn - start_pfn;
  1936		unsigned long r_size = 0;
  1937	
  1938		for_each_mem_region(r) {
  1939			r_start = PFN_DOWN(r->base);
  1940			r_end = PFN_DOWN(r->base + r->size);
  1941			r_size = r_end - r_start;
  1942	
> 1943			if (r->nid == curr_nid) {
  1944				if (size > r_size) {
  1945					/*
  1946					 * The memory block size is greater than the memblock
  1947					 * region size, meaning multiple memblocks can be present
  1948					 * within a single memory block. If the memblock's start
  1949					 * or end is within the memory block's start and end, It
  1950					 * indicates that the memblock is part of this memory block.
  1951					 * Therefore, the memory block can be added to the node
  1952					 * where the memblock resides.
  1953					 */
  1954					if (in_range(r_start, start_pfn, size) ||
  1955							in_range(r_end, start_pfn, size))
  1956						return true;
  1957				} else {
  1958					/*
  1959					 * The memory block size is less than or equal to the
  1960					 * memblock size, meaning multiple memory blocks can
  1961					 * be part of a single memblock region. If the memory
  1962					 * block's start or end is within the memblock's start
  1963					 * and end, it indicates that the memory block is part of
  1964					 * the memblock. Therefore, the memory block can be added
  1965					 * to the node where the memblock resides.
  1966					 */
  1967					if (in_range(start_pfn, r_start, r_size) ||
  1968							in_range(end_pfn, r_start, r_size))
  1969						return true;
  1970				}
  1971			}
  1972		}
  1973		return false;
  1974	}
  1975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
