Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C012419CCF5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523711; cv=none; b=V7OaINAN0z+hCG8R1Jcl76G3MexA8agxECpFGzFBPcLWTymzhM7HHuGkCyMcX5NzHz00/CYTfWY1Dm5IyjAxh3mbwvrn9Vxykr07O36BVmPqN6ju37zgA+essYDu9PayvzvJL7JJla6vVrPc0+i/8drQrHsLC/xU+WMYAAPJ1mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523711; c=relaxed/simple;
	bh=OAsMQK/TROQjnTfZeP0n8qIChfLSAQtuIkjd4Lq/i78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ4cwjMc38x4bhVjqOnQx2hlPWqly0gN5kt59LlIK5rLV480viAaLNOngCrA5tcOeaHwPOi3QMH2jAYCSDujOGF9NFbcmrAZLfysJ/jC4uL5akgrVivbbGVXHIJbShKKbriUw9RcNk5U+sw6dGL+uYY/EGHVUuJ/u3E0gcCa3WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfa5al/q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfa5al/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745523710; x=1777059710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OAsMQK/TROQjnTfZeP0n8qIChfLSAQtuIkjd4Lq/i78=;
  b=jfa5al/q40CY1WNKBZZR9EekDaMQI3Z2i50fKxD8XtkiXrHYaCPAKtGg
   mCjpFd1iJkVEt9HBFPq/91LVrcmJpCf7+GIBXsQi4Faoex0alZ+Ukll9D
   pvHTYUOEPkBhqAtmKM8Al2QAQv362aWsVVH3MGUbLcUecgKi3It6Lg0ae
   I32s3GO9wQuAIUcQA1228VnMYZGFim9y+OeJO21lMf30xkKMDa05AmqEM
   JEBaNRhICWwQT2kFVKKMTitwN0Gc3Nx3+r+4fdiHKqPqEwMOE/f6xRthH
   Iso0RCmRDjJwvLgYk/wIi/HPaGt98aE4/V8nsGO4wKyE84Pmdv+bBdtaZ
   w==;
X-CSE-ConnectionGUID: 1Rhpkwk6SzOk0oFj9Wi+sQ==
X-CSE-MsgGUID: nAnSswLrQgWCMqtG+sARrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58165999"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="58165999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:41:49 -0700
X-CSE-ConnectionGUID: ZpVkg/xUQfuZ+zFl/zKsUA==
X-CSE-MsgGUID: leQSlnPzQ0yA7TyYaXb7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="133676820"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Apr 2025 12:41:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u82S7-0004VJ-0k;
	Thu, 24 Apr 2025 19:41:43 +0000
Date: Fri, 25 Apr 2025 03:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christoph Lameter <cl@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only
 user
Message-ID: <202504250357.9ZZudhto-lkp@intel.com>
References: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mm-slab-fold-need_slab_obj_ext-into-its-only-user/20250425-004842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250424164800.2658961-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only user
config: arm-randconfig-003-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250357.9ZZudhto-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250357.9ZZudhto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250357.9ZZudhto-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2591:29: error: call to undeclared function 'need_slab_obj_ext'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2591 |         if (memcg_kmem_online() || need_slab_obj_ext())
         |                                    ^
   mm/slub.c:2591:29: note: did you mean 'free_slab_obj_exts'?
   mm/slub.c:2064:20: note: 'free_slab_obj_exts' declared here
    2064 | static inline void free_slab_obj_exts(struct slab *slab)
         |                    ^
   1 error generated.


vim +/need_slab_obj_ext +2591 mm/slub.c

0bedcc66d2a43a Vlastimil Babka    2023-10-03  2587  
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2588  static __always_inline void unaccount_slab(struct slab *slab, int order,
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2589  					   struct kmem_cache *s)
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2590  {
4b8736964640fe Suren Baghdasaryan 2024-03-21 @2591  	if (memcg_kmem_online() || need_slab_obj_ext())
21c690a349baab Suren Baghdasaryan 2024-03-21  2592  		free_slab_obj_exts(slab);
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2593  
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2594  	mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2595  			    -(PAGE_SIZE << order));
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2596  }
0bedcc66d2a43a Vlastimil Babka    2023-10-03  2597  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
