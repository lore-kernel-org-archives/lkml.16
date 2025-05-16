Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5B13790B;
	Fri, 16 May 2025 06:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375994; cv=none; b=foHYuz9B4D2fqjhCEbaodTUXeIGALQZp/kAeoQbjfpkXmjI7d4+BnZcDKhM7pVWfLIC0Pit8W3mbBdg+00OC6cafeH+braopM8fL+sgm2RBeuikTMMh5k+e0TLFn1aX9n8kMywNFTbJ2VawFWAjDrDNhemcy66DhNvee+kioL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375994; c=relaxed/simple;
	bh=hN756PFDYwpxi3vn2aCpPBzEC1JszHdPAOlWRrGK+wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKMxxka+CCRuW3rgqEb7i3wL44l1FrsEj83CZUwaRXvtbGG/p7qAWkvCcr2YfxYnj24f79vdd65jBH95wqqRY508H2za/7xGxPkXULPzlBBkNweB2ZIUp39fGWwYg2DzobGOPpKsXk03knubh91SFt5zbh27S7iexY63K35hrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsoWQjaS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsoWQjaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747375992; x=1778911992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hN756PFDYwpxi3vn2aCpPBzEC1JszHdPAOlWRrGK+wQ=;
  b=HsoWQjaSAbnPALqqGTyWG+kjwjEDyTu+5E9sG9YmlmBuhwElgXS71owG
   gj6uk/DxHi7T6Wc6WuHMkxia2tO9jV6hENXYS45dzndBXGZsiVktLtvCq
   YVnFS8YbFOPe7UQB2oGECmaPX1UkeANz3GTjTHXCdI5ZT866iuBNzlhXQ
   xPJi3J0rHMnwH+vRae5ARlc21qBfduUuYb9UxRf5jtOyhDkXsxPAB6qPt
   arBesmifJeDwkQF+H/kzcBQfRofTgtrbFSByJXi1+0hhgqkzZKnInKUiQ
   bz5EJKM23JBkiLP34+5IGPU2wUD3WKFj3hMMttZVJXnhrBRM5kAOr4Rib
   g==;
X-CSE-ConnectionGUID: 0jWvdxNkT6OEol/EgK7Jwg==
X-CSE-MsgGUID: DwbmBvehQu6BPzhFKomv7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71841955"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71841955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:13:11 -0700
X-CSE-ConnectionGUID: kPCLE4fySIaaqYmRHertSw==
X-CSE-MsgGUID: 72gcq/j9TGiB5dYRJx1Gbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139480996"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2025 23:13:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoJc-000J2F-3A;
	Fri, 16 May 2025 06:13:04 +0000
Date: Fri, 16 May 2025 14:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, Usama Arif <usamaarif642@gmail.com>
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <202505161340.aOL3UHxo-lkp@intel.com>
References: <20250515133519.2779639-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133519.2779639-2-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.15-rc6]
[cannot apply to acme/perf/core next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/prctl-introduce-PR_THP_POLICY_DEFAULT_HUGE-for-the-process/20250515-213850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250515133519.2779639-2-usamaarif642%40gmail.com
patch subject: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250516/202505161340.aOL3UHxo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161340.aOL3UHxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161340.aOL3UHxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vma.c: In function '__mmap_new_vma':
>> mm/vma.c:2486:9: error: implicit declaration of function 'vma_set_thp_policy'; did you mean 'vma_dup_policy'? [-Wimplicit-function-declaration]
    2486 |         vma_set_thp_policy(vma);
         |         ^~~~~~~~~~~~~~~~~~
         |         vma_dup_policy


vim +2486 mm/vma.c

  2472	
  2473		/* Lock the VMA since it is modified after insertion into VMA tree */
  2474		vma_start_write(vma);
  2475		vma_iter_store_new(vmi, vma);
  2476		map->mm->map_count++;
  2477		vma_link_file(vma);
  2478	
  2479		/*
  2480		 * vma_merge_new_range() calls khugepaged_enter_vma() too, the below
  2481		 * call covers the non-merge case.
  2482		 */
  2483		if (!vma_is_anonymous(vma))
  2484			khugepaged_enter_vma(vma, map->flags);
  2485		ksm_add_vma(vma);
> 2486		vma_set_thp_policy(vma);
  2487		*vmap = vma;
  2488		return 0;
  2489	
  2490	free_iter_vma:
  2491		vma_iter_free(vmi);
  2492	free_vma:
  2493		vm_area_free(vma);
  2494		return error;
  2495	}
  2496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
