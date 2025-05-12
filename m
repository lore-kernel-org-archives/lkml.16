Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864B25E44B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747088370; cv=none; b=p2y/vKD72uQOk8ztryN/Qqrn5AZeabxwMaU1zaaT2ap5dqvxmgbLwywV6oB5PZGOqBx7AGSNeyBOnUxiHlL3n8mghm28kfkYrLHfe4r3KfeAQQHHYXKtOas0kz9/Q3Cq9C5VWYmmrDkfcHTE/9pQeG/1dP9aYScGG6novDYuYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747088370; c=relaxed/simple;
	bh=k8/nvWoQBDS74TcSAvwlywR3Y8vzPERh3+Yp934zYmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3cwIzfWvQGKJuTRzqVxKNvA6myhpSMJDbRRD/G0TjigXYlK4TKLDZaQoEQ4dMOY0A/8rCsZQhBbZ4HMLf3JIkFCV+vAb5tFAhMxp0VZygQE/+qaXeSbkz7GjEETvsvMzvNHL5i+QMV/SM+Yqoih749Ci21/TIOfCEqXRlBP5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpELYkv5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpELYkv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747088368; x=1778624368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k8/nvWoQBDS74TcSAvwlywR3Y8vzPERh3+Yp934zYmA=;
  b=dpELYkv5xPKu6TdAxzcSoljKUblxTQaYa3Zy3GA90iUAjj83JuX6KW34
   PWPbfWFT4j6Wdx698Hj/KUIokILAHpgSpAoSyOnQKkk+7hzIxc3tvr5+n
   VSNK7qWedCZOyktmnLVY6efGLSHuCkcI1tBKpUAeKNSVwY6XHUqvjTCGf
   lLEaC9GeNQsLW2am6tjk0I6YUq3jJpQGwFK9U/NDWxoHXqXoft32GcFO1
   gIIIe1lSeM4dw8teCn6RkRI/JpLRK3jEVe9uDBsdLtCu9z1jzmF88j9T6
   /3pk9dPple2vWjZmRwveQj/4KHmE8ejaGEGqt6vyQepxz+lXoT/wx90BR
   A==;
X-CSE-ConnectionGUID: vtKqdJkKS1WM3JwyK9X+iA==
X-CSE-MsgGUID: +yyGMwWPSzmwItgObvg+Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52560917"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="52560917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 15:19:27 -0700
X-CSE-ConnectionGUID: DYyIZgkOQJaPBQb85oha5A==
X-CSE-MsgGUID: oitVPF4QTASWgrdkTT9QSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137429576"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2025 15:19:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEbUZ-000FTf-2P;
	Mon, 12 May 2025 22:19:23 +0000
Date: Tue, 13 May 2025 06:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: include/linux/ftrace.h:138:9: warning: returning 'int' from a
 function with return type 'struct pt_regs *' makes pointer from integer
 without a cast
Message-ID: <202505130656.8jnCz1rM-lkp@intel.com>
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
head:   627277ba7c2398dc4f95cc9be8222bb2d9477800
commit: 7caa9765465f60b6d88e22264892cee12d971888 ftrace: riscv: move from REGS to ARGS
date:   12 months ago
config: riscv-randconfig-r063-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130656.8jnCz1rM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130656.8jnCz1rM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130656.8jnCz1rM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h: In function 'ftrace_get_regs':
   include/linux/ftrace.h:138:9: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=implicit-function-declaration]
     return arch_ftrace_get_regs(fregs);
            ^~~~~~~~~~~~~~~~~~~~
            ftrace_get_regs
>> include/linux/ftrace.h:138:9: warning: returning 'int' from a function with return type 'struct pt_regs *' makes pointer from integer without a cast [-Wint-conversion]
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
