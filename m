Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A01A28D
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748129631; cv=none; b=NSQP8T/WGsp3JsmenCx0rBrsUU3WXXPvtTfSbG5QgjaWu7mFDzQhenIpnQx2vWOdS1waLlX/dZgq4N1dyfI0pjBFox9fy5oS0gFAEKezINZwfyCawZ3nMdPkwrlNalhR8L+lDoJp7xrnqpVY0CuBrgtf8vlW/TFRWhFLFbzBtak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748129631; c=relaxed/simple;
	bh=xJywaleKwBtwmmB40VtiHZmazLRR6fAKIM7aMb+BcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5wOdL8veoAQPu9tAFmmErhC3zOC6s9u8URDklo2lhr4ED63BjALwxL2XlG9RCIKZyT7cmQRQMzYA5EkGSc6DFPl5jrchZH1ipvOIytM9swp3tIFh+Vbnt8sDHKIBAw6LPCMqgB3RpZdls1qQjeiiM/jj3VVwyxYHxmlH1SkHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byJ0kjc0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byJ0kjc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748129628; x=1779665628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJywaleKwBtwmmB40VtiHZmazLRR6fAKIM7aMb+BcWs=;
  b=byJ0kjc0SJRcKxpGIKTTuabmGUoM7Ypk79L+Fqf3ldGX8nN7ExGXSbmQ
   wOf7+9MWF3iSwZK/4eyayvwhUkbK7taLVzf9g7c2nbwahr8NBgxeKvwji
   77jLsN1gjVB/DBMuUdPebhSz6RGgq1G/90tmdH/PjrcDqXJ4dsMXt6Snx
   a1N3OXWnn3e8tvC3RhN3swgZtQe9+pMBkHypHCYQ+Vk6UkLEsgDM56IZX
   G9/MAEk/wQExNfsGhNkDikiWXU0W3/0zSbVk4dGS4JxYpjWRNvC2XMmN8
   RY2R817rnvFj2iuspZmHjcPskppqKU1CChst1ZTjKhEpw/yTRlscCGgYn
   A==;
X-CSE-ConnectionGUID: QYV9X2wkRZ2l/18MY/NOKQ==
X-CSE-MsgGUID: ZOrBynxxR66sWx+k/6pqdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="60776642"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="60776642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 16:33:47 -0700
X-CSE-ConnectionGUID: ilLMvgvcThOP0AkISFUr7Q==
X-CSE-MsgGUID: 3voiTh3GQZCw3juIfR3GNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="146924370"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2025 16:33:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIyN6-000RVw-0K;
	Sat, 24 May 2025 23:33:44 +0000
Date: Sun, 25 May 2025 07:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/mm/init.c:356 relocate_kernel() warn: always true
 condition '(relocated_addr >= (((0)))) => (0-u64max >= 0)'
Message-ID: <202505250901.uISAGgLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b1427432d3b656fac71b3f42824ff4aea3c9f93b
commit: 51b766c79a3d741fb97419c3da1c58fce5e66f0e riscv: Support CONFIG_RELOCATABLE on NOMMU
date:   8 weeks ago
config: riscv-randconfig-r071-20250524 (https://download.01.org/0day-ci/archive/20250525/202505250901.uISAGgLR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250901.uISAGgLR-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:356 relocate_kernel() warn: always true condition '(relocated_addr >= (((0)))) => (0-u64max >= 0)'

vim +356 arch/riscv/mm/init.c

   328	
   329	static void __init relocate_kernel(void)
   330	{
   331		Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
   332		/*
   333		 * This holds the offset between the linked virtual address and the
   334		 * relocated virtual address.
   335		 */
   336		uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
   337		/*
   338		 * This holds the offset between kernel linked virtual address and
   339		 * physical address.
   340		 */
   341		uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
   342	
   343		for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
   344			Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
   345			Elf64_Addr relocated_addr = rela->r_addend;
   346	
   347			if (rela->r_info != R_RISCV_RELATIVE)
   348				continue;
   349	
   350			/*
   351			 * Make sure to not relocate vdso symbols like rt_sigreturn
   352			 * which are linked from the address 0 in vmlinux since
   353			 * vdso symbol addresses are actually used as an offset from
   354			 * mm->context.vdso in VDSO_OFFSET macro.
   355			 */
 > 356			if (relocated_addr >= KERNEL_LINK_ADDR)
   357				relocated_addr += reloc_offset;
   358	
   359			*(Elf64_Addr *)addr = relocated_addr;
   360		}
   361	}
   362	#endif /* CONFIG_RELOCATABLE */
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
