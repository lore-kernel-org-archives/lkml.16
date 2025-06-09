Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186BA3398B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491812; cv=none; b=Fk7t63GwJVm+0yIu2F7q039mImXtCoqegKPRb5sL0QpkuwO+WutXi+XO7fW9JG14xjRCH3emis4CbUPWQKQd+Cen7lHBGpZrPIDXzgyKu0nzo+HSF3bScya1eeRP1Bvb8kiGYuIOGXafNYxWRlRfOk97f7HsKb7Jg4ZiO1huadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491812; c=relaxed/simple;
	bh=QMLX7USi3ZT3hX+mBAv46oBwb8mA2xy+q3erSnK4HKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guLTjycjVP3qAq8RhdvA1ZrdFlcyl3WHGs9B9dXArL6XtM1k9Xvl8rQSWvZZ3nVHZGyI0616XcYdd15OyjLgpb+G+PIhoJLyhdsglYo36dHlW6EBAdcNfz8ng6eNT5miash/YkO3eWOhsgqdc3N6VJ9o0Wkf2v6L146j4BMk/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGjz2kOb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGjz2kOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749491811; x=1781027811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QMLX7USi3ZT3hX+mBAv46oBwb8mA2xy+q3erSnK4HKU=;
  b=fGjz2kObXMBeWPxHETLN3iSt5c1eMxcbiUtYNU4ciJwwyQDZNZ11oOfi
   zyVWcgEDPHlAYTQrDWDg975YHbnSMUwmQ9dbq+Bgk+ppSA0t8joj7rvgj
   LotQySWb93p+PWdmgROg59PO73z5/VfXoU5SLMCMgUlrqy4shTvdciQyE
   ESDb4QuVIeiy8HBMst/RhZVX50XFPyrGyMRCTqCj2yv2eXHHC9sIH6s1i
   l+fGQ+odvwPGrWz21Xg+kE8vCaZBGlGmPfG3O9OhGGUsuCvIjq8BmFjc1
   TmeAUfnR0FW0p/FmdObjhHTUxiJFSazmtX39S++XEbJ3coS4jSqW5HZGI
   A==;
X-CSE-ConnectionGUID: iC6ks3rqTSaXOIQMQSq1yQ==
X-CSE-MsgGUID: FJt8PTJmSkqk48V9vvbMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55244970"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55244970"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 10:56:50 -0700
X-CSE-ConnectionGUID: P3OX3CohRlmPIKkNdOgSOw==
X-CSE-MsgGUID: GjD2x7DgQ4iWer9x7zVLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147101780"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 10:56:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOgjk-0007Ib-0A;
	Mon, 09 Jun 2025 17:56:44 +0000
Date: Tue, 10 Jun 2025 01:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Em Sharnoff <sharnoff@neon.tech>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Oleg Vasilev <oleg@neon.tech>,
	Arthur Petukhovsky <arthur@neon.tech>,
	Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
Subject: Re: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
Message-ID: <202506100135.4iTfYLoH-lkp@intel.com>
References: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>

Hi Em,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Em-Sharnoff/x86-mm-Handle-alloc-failure-in-phys_-_init/20250609-183537
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/25c5e747-107f-4450-8eb0-11b2f0dab14d%40neon.tech
patch subject: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
config: i386-buildonly-randconfig-006-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100135.4iTfYLoH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100135.4iTfYLoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100135.4iTfYLoH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/init.c: In function 'init_memory_mapping':
>> arch/x86/mm/init.c:555:28: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     555 |                 if (IS_ERR(ret))
         |                            ^~~
         |                            |
         |                            long unsigned int
   In file included from include/linux/string.h:11,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from arch/x86/mm/init.c:1:
   include/linux/err.h:68:60: note: expected 'const void *' but argument is of type 'long unsigned int'
      68 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~


vim +/IS_ERR +555 arch/x86/mm/init.c

   531	
   532	/*
   533	 * Setup the direct mapping of the physical memory at PAGE_OFFSET.
   534	 * This runs before bootmem is initialized and gets pages directly from
   535	 * the physical memory. To access them they are temporarily mapped.
   536	 * Allocation errors are returned with ERR_PTR.
   537	 */
   538	unsigned long __ref init_memory_mapping(unsigned long start,
   539						unsigned long end, pgprot_t prot)
   540	{
   541		struct map_range mr[NR_RANGE_MR];
   542		unsigned long ret = 0;
   543		int nr_range, i;
   544	
   545		pr_debug("init_memory_mapping: [mem %#010lx-%#010lx]\n",
   546		       start, end - 1);
   547	
   548		memset(mr, 0, sizeof(mr));
   549		nr_range = split_mem_range(mr, 0, start, end);
   550	
   551		for (i = 0; i < nr_range; i++) {
   552			ret = kernel_physical_mapping_init(mr[i].start, mr[i].end,
   553							   mr[i].page_size_mask,
   554							   prot);
 > 555			if (IS_ERR(ret))
   556				return ret;
   557		}
   558	
   559		add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);
   560	
   561		return ret >> PAGE_SHIFT;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
