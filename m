Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367213C3F6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453297; cv=none; b=JFuT6fYPCGZHkKFKuw5kbrgUBesPK3OMgMEV7iFeLn2fi6eOT/MvWgThnN+3zqJgqvCT1chZ8I7PjalP4mtU5vS5uy3g1LczGCZ9tm0QOLoQxbYni0FbF7NgUgBWS6/l6fwuNmOrLY/boSQfedzoNLJ5jPEg2ZdGd9evoO7g5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453297; c=relaxed/simple;
	bh=mT9cqDmKVvE5D+3NHWI+X4Bdzp3kYBbGRt9lXt3Jz/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIisJYE31BT+pwQqqCRf1W/avLzMfWA2Un4w6kRSsEsIjj/XWsLJBYvDy/F1/swyPZ3z9ZtzfrTDEGl0U4Fxuft7KELztwuahklsVAYCBV19HWGMNgT7BEsKk9PVi6Yu1q0DciVlPefJrv1noVZi+RS2pGSRR4Gw56jPzdQUkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPIcj5NU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPIcj5NU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453296; x=1777989296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mT9cqDmKVvE5D+3NHWI+X4Bdzp3kYBbGRt9lXt3Jz/E=;
  b=QPIcj5NUEgk0gPoO+V76ADmWh7eIFjktLqz35TSE0b2SBe9Z4zv/EcdI
   FjCcZs6k61cn3YDMFm3sK5d1p2JgxIi2nPJCaCJh6otMeC8XNE+S63xx2
   854S5y4RViXQMWCLTxD7nPFVDiLbl+NSgMqNQX61J0ulGKyqSFnW1WAqC
   +lZanA2MrHSbsOlQBtuIzD5AyKmMryn5qLytjTxUZ5J5f7Lb8NEhSlVFD
   bMfWPgP95ZtY46kz47jffR/411imzcRQO72p2OPEQLdVywy+og3SDij4v
   yZubGNENnV8S03X8iPOTHNE1M79s2tenq+L0vaJKRubhRgEEAeaed7kH7
   Q==;
X-CSE-ConnectionGUID: GvV7RQmTQyao+RpF0GNiuA==
X-CSE-MsgGUID: 3c/BfhUFTtCyATcGEUCvkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51881704"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51881704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:54:56 -0700
X-CSE-ConnectionGUID: ED7z6mKXR3ymkA6cXhGR6w==
X-CSE-MsgGUID: NwDLqtlJTHuYGEq/aEHKpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="166307889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2025 06:54:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBwHS-0005mH-1C;
	Mon, 05 May 2025 13:54:50 +0000
Date: Mon, 5 May 2025 21:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, will@kernel.org,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
Message-ID: <202505052102.U2NQHrS4-lkp@intel.com>
References: <20250503112137.1962910-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503112137.1962910-6-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250505]
[cannot apply to arm64/for-next/core kvmarm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/arm64-boot-Move-init_pgdir-into-__pi_-namespace/20250503-192534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250503112137.1962910-6-ardb%2Bgit%40google.com
patch subject: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
config: arm64-randconfig-001-20250505 (https://download.01.org/0day-ci/archive/20250505/202505052102.U2NQHrS4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250505/202505052102.U2NQHrS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505052102.U2NQHrS4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/pi/map_kernel.c:191:30: error: use of undeclared identifier 'init_pg_end'
     191 |         memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
         |                                     ^
   arch/arm64/kernel/pi/map_kernel.c:222:30: error: use of undeclared identifier 'init_pg_end'
     222 |         memset(__bss_start, 0, (u64)init_pg_end - (u64)__bss_start);
         |                                     ^
   2 errors generated.


vim +/init_pg_end +191 arch/arm64/kernel/pi/map_kernel.c

9684ec186f8fadd Ard Biesheuvel 2024-02-14  158  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  159  static void __init remap_idmap_for_lpa2(void)
9684ec186f8fadd Ard Biesheuvel 2024-02-14  160  {
9684ec186f8fadd Ard Biesheuvel 2024-02-14  161  	/* clear the bits that change meaning once LPA2 is turned on */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  162  	pteval_t mask = PTE_SHARED;
9684ec186f8fadd Ard Biesheuvel 2024-02-14  163  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  164  	/*
9684ec186f8fadd Ard Biesheuvel 2024-02-14  165  	 * We have to clear bits [9:8] in all block or page descriptors in the
9684ec186f8fadd Ard Biesheuvel 2024-02-14  166  	 * initial ID map, as otherwise they will be (mis)interpreted as
9684ec186f8fadd Ard Biesheuvel 2024-02-14  167  	 * physical address bits once we flick the LPA2 switch (TCR.DS). Since
9684ec186f8fadd Ard Biesheuvel 2024-02-14  168  	 * we cannot manipulate live descriptors in that way without creating
9684ec186f8fadd Ard Biesheuvel 2024-02-14  169  	 * potential TLB conflicts, let's create another temporary ID map in a
9684ec186f8fadd Ard Biesheuvel 2024-02-14  170  	 * LPA2 compatible fashion, and update the initial ID map while running
9684ec186f8fadd Ard Biesheuvel 2024-02-14  171  	 * from that.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  172  	 */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  173  	create_init_idmap(init_pg_dir, mask);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  174  	dsb(ishst);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  175  	set_ttbr0_for_lpa2((u64)init_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  176  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  177  	/*
9684ec186f8fadd Ard Biesheuvel 2024-02-14  178  	 * Recreate the initial ID map with the same granularity as before.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  179  	 * Don't bother with the FDT, we no longer need it after this.
9684ec186f8fadd Ard Biesheuvel 2024-02-14  180  	 */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  181  	memset(init_idmap_pg_dir, 0,
ecc54006f158ae0 Zenghui Yu     2024-06-21  182  	       (u64)init_idmap_pg_end - (u64)init_idmap_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  183  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  184  	create_init_idmap(init_idmap_pg_dir, mask);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  185  	dsb(ishst);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  186  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  187  	/* switch back to the updated initial ID map */
9684ec186f8fadd Ard Biesheuvel 2024-02-14  188  	set_ttbr0_for_lpa2((u64)init_idmap_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  189  
9684ec186f8fadd Ard Biesheuvel 2024-02-14  190  	/* wipe the temporary ID map from memory */
9684ec186f8fadd Ard Biesheuvel 2024-02-14 @191  	memset(init_pg_dir, 0, (u64)init_pg_end - (u64)init_pg_dir);
9684ec186f8fadd Ard Biesheuvel 2024-02-14  192  }
9684ec186f8fadd Ard Biesheuvel 2024-02-14  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
