Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A974C14
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749489339; cv=none; b=MFeznuCn6oQfLEMp/OGtgRR+6iKV3lUA4MRJWS0QH6606DopKDIuVpfX82S/Hii1jS3HQ4s82RgcV4qgYcxZYf1hs+l7WKHzLppOQR6+vid6uaWUhsSpAHMy/Akerj4wDKRFa05rFTzG8PQ+pGcJP0zBlOCU+SYoE8O8+bEJxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749489339; c=relaxed/simple;
	bh=srtf4DKSFKdgJqo4E0tq5HjYbfxogpdqu8Ikos9J2Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSz2bm+qulxTaep5M4UfucGE1dtsgXfEYXTjoo2irWYwGMyoZXSe7o3kgfp3MZisuLoYadVwoc2/MH372Ie1o6MFhTY8h7OHkKXtg+wtqp+pXaP4vk/fjR9c224w5TvttSsEkzOvo63eQSIVDfNPXwLTYOxxVlCoaXwhPcTy8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvZ+5p6N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvZ+5p6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749489337; x=1781025337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=srtf4DKSFKdgJqo4E0tq5HjYbfxogpdqu8Ikos9J2Cs=;
  b=WvZ+5p6NNvGivcJHbdHP45mo30XeP6lPo6h5SCd76+bBfNjuHWLkQW6r
   2/orPxUak1Nw8AY8I+b7aIzmw7B7hKXhqN2ZH9NT9EJJKZWWhaTOTEd3c
   e2ghxeMbpPl9rGD3QBcRdHCAXAq7phdNLdw4SSoOTEOexpjYklBuMTZ3i
   2UD16hfe6YbcG09/jJOzovK3YpJlAWrs0+oJGYVMHVilR9/ss73cv4Asn
   h2ERRJ+cHFIMkbacGYXa0POwhn3+tzEQyzF/XPKntqfONoxjr81bEEkEA
   w8JEfcqgL1DHfMziK2iiJaBeHltKr9ehqciWSeRFiQQjPzlTSqmTV034z
   w==;
X-CSE-ConnectionGUID: r5F94BDeQfmDaozKJQDDnQ==
X-CSE-MsgGUID: 0BZM60bNRLiZFU36cUKGkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62232260"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62232260"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 10:15:37 -0700
X-CSE-ConnectionGUID: vQIdCdXfTt+ec5u6Jx+dGA==
X-CSE-MsgGUID: GC2QmjfMSW+xgMSXYdFEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147538619"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2025 10:15:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOg5q-0007G9-0h;
	Mon, 09 Jun 2025 17:15:30 +0000
Date: Tue, 10 Jun 2025 01:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Em Sharnoff <sharnoff@neon.tech>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <202506100041.N8Bgx8q0-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Em-Sharnoff/x86-mm-Handle-alloc-failure-in-phys_-_init/20250609-183537
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/25c5e747-107f-4450-8eb0-11b2f0dab14d%40neon.tech
patch subject: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
config: i386-buildonly-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100041.N8Bgx8q0-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100041.N8Bgx8q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100041.N8Bgx8q0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/init.c:555:14: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
     555 |                 if (IS_ERR(ret))
         |                            ^~~
   include/linux/err.h:68:60: note: passing argument to parameter 'ptr' here
      68 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                            ^
   1 error generated.


vim +555 arch/x86/mm/init.c

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
