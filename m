Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6647261A
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748091179; cv=none; b=gZOJLzdatgOZH1zEk8/D7Nvc1gYK7gZCc0JDUWuJ6itGaLXAFsTMLcqSXxx/dZt0yyAxiryixIuXG9+DUJmWKuv3fCvpAKf+efF3lcNBDKbsyZJiWq4EgiC5K1tQc4i7CbXrhx/1BUPctiNWQxmPIOaXUBQtwwyk53m8X8NRxE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748091179; c=relaxed/simple;
	bh=F5X8f7Ol2g6q60kTT41bWjS2GPogjhZ4e4wv0jXVsrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiBZzRKsnLgfn1mno96mNn67I1YghBfaQg1aY5pA5xqZtGHvNZKc1oFDBpZ1SIVAaJa9Z4fBNP64lArPwE5aufddZOUrMb2ImunNcQtjEpsLlLk6PrqOGfXjp++bdh+o4z7I8GcnnKcFBI5bYHGhusVG4FQTHAdl5S4MoFVrqAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXJoBet3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXJoBet3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748091177; x=1779627177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5X8f7Ol2g6q60kTT41bWjS2GPogjhZ4e4wv0jXVsrc=;
  b=dXJoBet3PwINZ+1cO7v4klyaUxOvm8+h6Aefxv02s2VMhn0hfOXz/7wL
   CZR3DaMnfqFRyNJt9ewCG+dY1EnCJ/wEUSBwlsikm3pagdMh9Qmd3dHpv
   AHwKKHzYe3lzCY0C+sV7PkFxq6nhlc/JRCLo0//l9Y1rKbUCs0u/WnVYV
   ka9Cenf8sFsfT81L2/eNNaBvomDET2JoPQSrOLqiLMzdHaVth+ZyERrXM
   6+yT0KBm3UksK6jpJscac9XMXVO1Qf3dpqklUIxgv9cwRWlvOF9dRidCk
   1yohFtK/U+QwtKvhZ1RK/IutoXhY7YqFDbsizRyR1ey+RLDNb/F/rAx8B
   Q==;
X-CSE-ConnectionGUID: V3RAFw3RT36LmDF2ut+I2w==
X-CSE-MsgGUID: KP9tYsd6TS+bWwr1ubQiuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="49245566"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49245566"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 05:52:56 -0700
X-CSE-ConnectionGUID: 38PsfmIPSiatfTx46nf1sQ==
X-CSE-MsgGUID: XvvkD0BcTuG9Y5e3+/5iQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142497128"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2025 05:52:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIoMv-000RD2-0n;
	Sat, 24 May 2025 12:52:53 +0000
Date: Sat, 24 May 2025 20:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:master 747/770] arch/powerpc/include/asm/perf_event.h:47:0:
 warning: "PERF_REG_EXTENDED_MASK" redefined
Message-ID: <202505242035.SN55pavs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   4df0681d0b0244368a8a0982b24ceb536c3b5165
commit: a7872f778554c4849d59def8dfe0d295328e5e10 [747/770] perf/headers: Clean up <linux/perf_event.h> a bit
config: powerpc-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505242035.SN55pavs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242035.SN55pavs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242035.SN55pavs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:33:0,
                    from kernel/events/ring_buffer.c:11:
   include/linux/perf_regs.h:16:32: error: expected identifier or '(' before numeric constant
    #define PERF_REG_EXTENDED_MASK 0
                                   ^
   arch/powerpc/include/asm/perf_event.h:46:12: note: in expansion of macro 'PERF_REG_EXTENDED_MASK'
    extern u64 PERF_REG_EXTENDED_MASK;
               ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:50:0,
                    from kernel/events/ring_buffer.c:11:
>> arch/powerpc/include/asm/perf_event.h:47:0: warning: "PERF_REG_EXTENDED_MASK" redefined
    #define PERF_REG_EXTENDED_MASK PERF_REG_EXTENDED_MASK
    
   In file included from include/linux/perf_event.h:33:0,
                    from kernel/events/ring_buffer.c:11:
   include/linux/perf_regs.h:16:0: note: this is the location of the previous definition
    #define PERF_REG_EXTENDED_MASK 0
    
   cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'
--
   In file included from include/linux/perf_event.h:33:0,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/events/core.c:34:
   include/linux/perf_regs.h:16:32: error: expected identifier or '(' before numeric constant
    #define PERF_REG_EXTENDED_MASK 0
                                   ^
   arch/powerpc/include/asm/perf_event.h:46:12: note: in expansion of macro 'PERF_REG_EXTENDED_MASK'
    extern u64 PERF_REG_EXTENDED_MASK;
               ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:50:0,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/events/core.c:34:
>> arch/powerpc/include/asm/perf_event.h:47:0: warning: "PERF_REG_EXTENDED_MASK" redefined
    #define PERF_REG_EXTENDED_MASK PERF_REG_EXTENDED_MASK
    
   In file included from include/linux/perf_event.h:33:0,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/events/core.c:34:
   include/linux/perf_regs.h:16:0: note: this is the location of the previous definition
    #define PERF_REG_EXTENDED_MASK 0
    
   In file included from include/linux/perf_event.h:50:0,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/events/core.c:34:
   kernel/events/core.c: In function 'has_extended_regs':
   arch/powerpc/include/asm/perf_event.h:47:32: error: 'PERF_REG_EXTENDED_MASK' undeclared (first use in this function); did you mean 'PERF_REG_EXTENDED_MAX'?
    #define PERF_REG_EXTENDED_MASK PERF_REG_EXTENDED_MASK
                                   ^
   kernel/events/core.c:12500:41: note: in expansion of macro 'PERF_REG_EXTENDED_MASK'
     return (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK) ||
                                            ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/perf_event.h:47:32: note: each undeclared identifier is reported only once for each function it appears in
    #define PERF_REG_EXTENDED_MASK PERF_REG_EXTENDED_MASK
                                   ^
   kernel/events/core.c:12500:41: note: in expansion of macro 'PERF_REG_EXTENDED_MASK'
     return (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK) ||
                                            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:12502:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   kernel/events/core.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-unterminated-string-initialization'


vim +/PERF_REG_EXTENDED_MASK +47 arch/powerpc/include/asm/perf_event.h

a6460b03f945ee Sandipan Das        2018-12-06  29  
75382aa72f0682 Anton Blanchard     2012-06-26  30  /*
75382aa72f0682 Anton Blanchard     2012-06-26  31   * Overload regs->result to specify whether we should use the MSR (result
75382aa72f0682 Anton Blanchard     2012-06-26  32   * is zero) or the SIAR (result is non zero).
75382aa72f0682 Anton Blanchard     2012-06-26  33   */
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  34  #define perf_arch_fetch_caller_regs(regs, __ip)			\
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  35  	do {							\
75382aa72f0682 Anton Blanchard     2012-06-26  36  		(regs)->result = 0;				\
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  37  		(regs)->nip = __ip;				\
3d13e839e801e0 Michael Ellerman    2020-02-20  38  		(regs)->gpr[1] = current_stack_frame();		\
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  39  		asm volatile("mfmsr %0" : "=r" ((regs)->msr));	\
b0f82b81fe6bbc Frederic Weisbecker 2010-05-20  40  	} while (0)
333804dc3b7a92 Madhavan Srinivasan 2018-12-09  41  
333804dc3b7a92 Madhavan Srinivasan 2018-12-09  42  /* To support perf_regs sier update */
333804dc3b7a92 Madhavan Srinivasan 2018-12-09  43  extern bool is_sier_available(void);
e79b76e03b712e Athira Rajeev       2021-02-03  44  extern unsigned long get_pmcs_ext_regs(int idx);
781fa4811d9531 Anju T Sudhakar     2020-08-07  45  /* To define perf extended regs mask value */
781fa4811d9531 Anju T Sudhakar     2020-08-07  46  extern u64 PERF_REG_EXTENDED_MASK;
781fa4811d9531 Anju T Sudhakar     2020-08-07 @47  #define PERF_REG_EXTENDED_MASK	PERF_REG_EXTENDED_MASK

:::::: The code at line 47 was first introduced by commit
:::::: 781fa4811d95314c1965c0c3337c9ac36ef26093 powerpc/perf: Add support for outputting extended regs in perf intr_regs

:::::: TO: Anju T Sudhakar <anju@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
