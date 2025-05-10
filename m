Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A5F1C5D62
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746897406; cv=none; b=hdWoydxBQmJ9GFc5CHqF56EWXhdM0E6wN+Ewr5gXsfWs6OATXJY7vkcDZ+7PwvMA3uook2bjgPLW4+VxvlwSSnh1+csUNQY8Zw7iW6H1xK3otwP+kKVKA687SbZuEPeYW+xsOIw5glcGPmS0vObQV2gZ/ihqFNzIfTnTJZGyWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746897406; c=relaxed/simple;
	bh=5a+K9yVUzUjem+JVCAmRVxB7jkIPgeOlfhF23nvZU7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7bsQp9Cbo0hdLwyxJ8PilRgkrwiIYV/MczOqgCGHmDDXI1cm0asgqqQpWoJn54H5L1oEQxfGVrSTaZ6873GqJWNwrnsegiVfGKLlxTYQJ7PqnYwA21fMCKTGQ/DBfV5rPNiSYAcHYqREA5+JSJDM/xa1TH0+PTF5Rtqxp2aGYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsjV+H/e; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsjV+H/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746897403; x=1778433403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5a+K9yVUzUjem+JVCAmRVxB7jkIPgeOlfhF23nvZU7k=;
  b=FsjV+H/elK10kG99npvfSggZOKel9EoxtRlUX9xoGi7E0S81Q+0s66NK
   Nb/bDnclSrTplJZEXLk4R5AWzeV6+jCKsi+sT0kbKiv0V8aumwr1XRWHF
   ZXSOb8HBuInFmrESCxuux3LqThXcplz2wo6mad45kThi/5LOdirVSdz2H
   bghPD+fwSWTJ2I0vLSWn6HYzmcXRbv7dbkQjxpT8ea1KecBoEYKTDkgS0
   E1cO+r/kwLCkGhz+eiLRVF6rNhGU7WJuxKCiJJU5E+JcMj/QS+0ZltBlP
   1MxIUg/F6GBSG0G7Q4J0Sak+Uj8Upeo9mcSk9cK47T/SOkKvduv23khgj
   Q==;
X-CSE-ConnectionGUID: Hb4HA357TN2WEjqU2sghrQ==
X-CSE-MsgGUID: Csiu0bNTQ8+as0ytpIa1fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48726507"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48726507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 10:16:43 -0700
X-CSE-ConnectionGUID: 6wAO3b7bQrmZUETqge/O6A==
X-CSE-MsgGUID: imy8juLDQ+irrYLG+ZqeYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="167991669"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2025 10:16:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDnoT-000DEp-0M;
	Sat, 10 May 2025 17:16:37 +0000
Date: Sun, 11 May 2025 01:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Juan Yescas <jyescas@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	tjmercier@google.com, isaacmanjarres@google.com, surenb@google.com,
	kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-ID: <202505110035.wtOWnL8o-lkp@intel.com>
References: <20250510010338.3978696-1-jyescas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510010338.3978696-1-jyescas@google.com>

Hi Juan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc5]
[cannot apply to akpm-mm/mm-everything next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
base:   linus/master
patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jyescas%40google.com
patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
      53 | #error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
         |  ^~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +53 include/linux/mmzone.h

    46	
    47	/*
    48	 * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
    49	 * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
    50	 * which defines the order for the number of pages that can have a migrate type
    51	 */
    52	#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
  > 53	#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
    54	#endif
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
