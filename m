Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071972101A0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269920; cv=none; b=HdAyVLRVtEp5+wBlLqmd42Xh4Bz7VRMP/X12h+Vbx1nYtcy7/GoCRV77LNNs8SeKRqPnYR8yqhD+M8my1xUT9xpRR/i0t4VJ4nZLxwA9Py44NQCsWiXDtRTer74K8kxdvy+9U2xq+dSVhZGT9QqNlZx6fV0vxiivZ86QZOr7QyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269920; c=relaxed/simple;
	bh=RquuGCXJiJWK/Yhqhh0t6vGlUvFzJIPOR1vaSOnu1MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7P615ZQOpD/MdhGlriAoi2PQ1mm7ktXj6nHEoKxDRnbd3gdx5K07T4LCFFMLG5o4LsPGcPD/pBFU0FVSh3Ic7ntkx9fenCYDY9MqkCjya8HeMsLEknQgMxRvBvX3T7XgFt7cJ6gJ59TgEl4Hg31XyAeDLUj5fQG+QxEnSbkK0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VppDNfsd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VppDNfsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744269919; x=1775805919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RquuGCXJiJWK/Yhqhh0t6vGlUvFzJIPOR1vaSOnu1MA=;
  b=VppDNfsdYaiXnUk6Ap8giF0os52051s8jAiA1KIfeoPKurUE/o0cSeSe
   vRGJWda5QYCTVbTwnCBZ9H9SV0E/4km4h7x9EA7nY+U0mLF4pbrDqaBYy
   NvhOs/byiK77VdWQZU5fkkUbYfJY8hvNY0JEMvMR7z8PiT8iIvxMz1rCJ
   wqcNk4xLoGXU7hwXw47kqmVVC1tWOFSRrq4RcPYCLDJK0Gend2kUuQeS+
   4FDmQxtxELeVFxOyZB81VW6hv6BC9KKK4eqVZ09EDLl6aLA4a89ZBhBWh
   gti9OIaE8Iy9I4svcEEG9hs/rnVty9veXfcwfmh1VladMQ5jxr5n4zHRK
   A==;
X-CSE-ConnectionGUID: sb0qAAtRQ4G0al1ScyWqJQ==
X-CSE-MsgGUID: HlwcHlO1QWCZOUI24Z/uWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71150926"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="71150926"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:25:18 -0700
X-CSE-ConnectionGUID: iVzjJqHaQ2qDlUwLquZzvw==
X-CSE-MsgGUID: ZTrkxYVbQce+/ps+3EyEeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129759647"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 00:25:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2mHg-0009lP-2A;
	Thu, 10 Apr 2025 07:25:12 +0000
Date: Thu, 10 Apr 2025 15:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
Message-ID: <202504101431.ovUiydUd-lkp@intel.com>
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
config: hexagon-randconfig-002-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101431.ovUiydUd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101431.ovUiydUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101431.ovUiydUd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memblock.c:1943:10: error: no member named 'nid' in 'struct memblock_region'
    1943 |                 if (r->nid == curr_nid) {
         |                     ~  ^
   1 error generated.


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
