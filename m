Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84728E607
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516609; cv=none; b=BLIC04dOlrgTZHWYBHaLSg5zx3y1KU8YjHocJ1/L5nfQY3Dlb+c/bfgH9QVNkqJvn2h7Jt9JKRrNef/kW5udImqWoeY/fgM0TNTVT50fFO6I9MquWgClLAfTsYOk7m5khE4kQeuSkK+UGz4nclsvhP16q0u1kJ5A50LK6cwzGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516609; c=relaxed/simple;
	bh=s3kLHlPLrrZeRXlk3YkZaow5KWz21p34OcrgcaSGFO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtNUqeibtYpNtCzw0SxA5goLZkIsdSslk1ufifh1LhWnkjOZnOGAP9HeJz74pUOsESTaQpmIZBxLnSBW2FypY01PwEmjtFbz+Ip5AgaTOSZ82JnAg+bpv9vulobiGboqQp2ZCCHcX2uKT+NQQBsz9vh6bRbkNxhEWWVbdmDRlBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjQSoDyC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjQSoDyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516608; x=1780052608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3kLHlPLrrZeRXlk3YkZaow5KWz21p34OcrgcaSGFO4=;
  b=SjQSoDyClUlPlL06MjO+rSCyGJQzkyITxTCno85OKxvIDxyXNjDN3Ok6
   4Esz0VpK9k7j/cTK4mSkojZxlisL3x1hkZFTYD7JIMKSKFQkO7U9OdUeg
   hd6oKcW3WqCyDY0BcRreNokmWOhQ4Ngz44ukIa1ngCsLP0/d1XegbkCRA
   rqGjcvmTjKFBCQZ0+EXTMR9Y0dkXWtsQnH/RVg90hmgPg+kKjdKex5Y8W
   Y7wiUCjUdAfdVpzy4lcApw1ZwOCsyQsbLgLPm+d3dzoqUmMgx/6+nAvmE
   NAUg9IcJAq/+z5URPJnuB+zjnhiK1Y5gI4YqyrLOATrPs1UtvWzKxI4Xi
   Q==;
X-CSE-ConnectionGUID: RYvoQHh2Tgqwh9YUPueC6w==
X-CSE-MsgGUID: X6jIAy1DR62nYcc8Lw4TRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369626"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:25 -0700
X-CSE-ConnectionGUID: VWkEW/d6SXKctO0kRvVLEA==
X-CSE-MsgGUID: hSF/z7HuTlGOKNpozqDT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303912"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:23 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2f-0000h9-0x;
	Thu, 29 May 2025 11:03:21 +0000
Date: Tue, 27 May 2025 11:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:16: error: implicit declaration of
 function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'?
Message-ID: <202505271121.BqGFyRfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   785cdec46e9227f9433884ed3b436471e944007c
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   1 year ago
config: riscv-randconfig-2001-20250514 (https://download.01.org/0day-ci/archive/20250527/202505271121.BqGFyRfB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271121.BqGFyRfB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271121.BqGFyRfB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:138:16: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Wimplicit-function-declaration]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
>> include/linux/ftrace.h:138:16: error: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
     138 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=145074831
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=145074831
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=145074831
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=145074831
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
