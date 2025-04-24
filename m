Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665127FD4D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527016; cv=none; b=UBo0Ow/c621vJHmle9ldD1Q8ZFIWibELvc/ofwaqf6hY9/M6eIAbbyPqVECK+I0UAcL5DUC5KsSU2VwtWA5mmeDlpIx1m0vznjgx6XGrC0jWBh2HKvvLp2espX4oJD+kQh2vNsumvbELf3RHIHOGzURSpc2WUclMUI+/a+dH57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527016; c=relaxed/simple;
	bh=SpjP2k6c3xqmjUvc+9CYhWMVG9VqXdVZXCAZt+ZisPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7AneSGyUmXKJFn3bW7iE1jEnNXTqxTGhJPNSkRVJ3AhgvKoDOGqW6GxOOoI+l+y7DJYIdI0Fq5OIJxExGSxKvqWWhbETGLFpFz/RjcFWrkTIb5qp4+OSOHYUBw1pebhcpZL6Lj8SH3O2QsT1FbDx9XGRz1QaJUftgs3JZ3mIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QApv+PQu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QApv+PQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745527015; x=1777063015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SpjP2k6c3xqmjUvc+9CYhWMVG9VqXdVZXCAZt+ZisPg=;
  b=QApv+PQurYbCB5MhjxovHjitVHZ9Ggq6oBWovio266rYEdOEMSjCmXNX
   En4M+XQkya7mUlZmVeDLtx28EVs6ct6KDO7sXEL3ggFVBJwoRk+0Mn2hg
   qxvnZaFBq4WdYEXK1vyYIxgL/O3m36eE5GV5OlxFf2dlWIsoxfZAhDoxW
   DtL5ID0j1Dnsy6pbm4Q556sJ2xUStadzskEAtsnOYYWUQ61dXry3sTVTi
   odGBi5NWNvKyiIwlwmnicLvzoP+pUFa3ZN2iUZ/FNmhbmr67+mKAMd9lp
   p410mBCXFimG8ZvHpMrfmR3/q9aob7Zwk4uLxTE4nSGIdS2Ua9xVdZpTh
   A==;
X-CSE-ConnectionGUID: /T3CDTMlRwCu+UBUQHyIdQ==
X-CSE-MsgGUID: AtX6dKXIQY+ZhTNgJImuIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64709232"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="64709232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:36:54 -0700
X-CSE-ConnectionGUID: bYehlejxQx+0WEQWvUxDYQ==
X-CSE-MsgGUID: oJosCEZ8Rb25xGPHYDGEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="163779372"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2025 13:36:51 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u83JR-0004ZN-0B;
	Thu, 24 Apr 2025 20:36:49 +0000
Date: Fri, 25 Apr 2025 04:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202504250400.BLLCAX1T-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504250400.BLLCAX1T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250400.BLLCAX1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250400.BLLCAX1T-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'unaccount_slab':
>> mm/slub.c:2591:36: error: implicit declaration of function 'need_slab_obj_ext'; did you mean 'free_slab_obj_exts'? [-Werror=implicit-function-declaration]
    2591 |         if (memcg_kmem_online() || need_slab_obj_ext())
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    free_slab_obj_exts
   cc1: some warnings being treated as errors


vim +2591 mm/slub.c

0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2587  
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2588  static __always_inline void unaccount_slab(struct slab *slab, int order,
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2589  					   struct kmem_cache *s)
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2590  {
4b8736964640fe1 Suren Baghdasaryan 2024-03-21 @2591  	if (memcg_kmem_online() || need_slab_obj_ext())
21c690a349baab8 Suren Baghdasaryan 2024-03-21  2592  		free_slab_obj_exts(slab);
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2593  
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2594  	mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2595  			    -(PAGE_SIZE << order));
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2596  }
0bedcc66d2a43a5 Vlastimil Babka    2023-10-03  2597  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
