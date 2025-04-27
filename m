Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D72343AF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 05:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745733259; cv=none; b=bejcZvJczd8jZ5JTD8Jz1T8WZ5AijNQWnYRAUecke9EBJ8jzR2anLvYpzGBpi7Ztjq01Od81VSV3/j8zO3C1dXwN03Ij8w7EcweHe4/w1e881TzypZAZFIorvRhFLgNbyPQhsP75iHu+/tuIYhBGMIBaZC+DBW+WZJOpSfx3eZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745733259; c=relaxed/simple;
	bh=uP9kC08rc8Ge1VaUJQlmlIqrO4bq3XJEYRGrFhVEDf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+xHFTu/JZ8E9G5uI+eN4lItel6+fdpi8CEQKr+fHnZbL7E6FSphoZeYTlzwcrGHt2lzzTQc8P3ipAriuyuhermiTJHImDv9Jqczrc33u0Lz4Dj+oC2RlSbvGb6+39I3iHT3xzpIaBIXme4YKEfsSoB7+auTClc2Rd4d7zgakT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnaiI3uJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnaiI3uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745733258; x=1777269258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uP9kC08rc8Ge1VaUJQlmlIqrO4bq3XJEYRGrFhVEDf0=;
  b=hnaiI3uJI2w1RvqCuXR773edhjgXbbYmnjJZFKjCutlDZvsNCkFqCfaX
   Xt1tj4a8BAEEc88Rx2u66b0xo+nTgK/z5wO+VsF/RbkEEPJ5SzACg502C
   RET1bAj1NQ5GvKfT1Cx3zuumM23wSc2GwOpJDCyQCvnkDGK5QZR0SGSnC
   OHZzozKgTApojZsos+KU0KjoVcMk/ilgHcongO5HV+3c7lhWrOPdhPNfR
   4LGUHGg6Mq/SqYlD4WhnpAeTYmhzZPf90P1hxjiCVWP6gC2Bo7U8uX+na
   kHiXC9c06uDrTp3CcKFVICYHJh9d/q0+wFvrzaQCO06bNgM46/Muqa0aD
   g==;
X-CSE-ConnectionGUID: NprwPS0DRYWS3Un9Qk+0eQ==
X-CSE-MsgGUID: L0Y5k0DcQYq3CcQB6hPYmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51161586"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="51161586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 22:54:17 -0700
X-CSE-ConnectionGUID: 5Qk/AqrIQpuhNh5QGRHGTQ==
X-CSE-MsgGUID: mI3DLuy3S1mL5Db7H86Ewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133114263"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2025 22:54:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8uxx-00068b-0v;
	Sun, 27 Apr 2025 05:54:13 +0000
Date: Sun, 27 Apr 2025 13:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: error: implicit declaration of
 function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'?
Message-ID: <202504271318.HcDiD4fX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Puranjay,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   11 months ago
config: riscv-randconfig-r132-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271318.HcDiD4fX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504271318.HcDiD4fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271318.HcDiD4fX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:138:9: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
     return arch_ftrace_get_regs(fregs);
            ^~~~~~~~~~~~~~~~~~~~
            ftrace_get_regs
   include/linux/ftrace.h:138:9: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
     return arch_ftrace_get_regs(fregs);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +138 include/linux/ftrace.h

d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  132) 
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  133) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  134) {
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  135) 	if (!fregs)
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  136) 		return NULL;
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  137) 
02a474ca266a47 Steven Rostedt (VMware  2020-10-27 @138) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  139) }
d19ad0775dcd64 Steven Rostedt (VMware  2020-10-28  140) 

:::::: The code at line 138 was first introduced by commit
:::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arguments to be passed in to ftrace_regs by default

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
