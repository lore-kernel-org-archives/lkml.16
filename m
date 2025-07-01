Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406B269CE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406993; cv=none; b=SaaQQ/YlCX3C0Z1Ka0XBiFnJyP+c+3G+DSMQEL+yRLEX/b8Bw07/bKCRMV3j6K0Pnut2+wen/rZJWkaRNRsljvhEWTM/0UY3jfLljwpwoVC5uJfqjF3JcgkpX+rhvRaEkN4utoRlsRoFWSAizgcJR8ZffqeaDkMAL3ZCgNv6uEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406993; c=relaxed/simple;
	bh=oY5LNb5fbr7IN9pcsIbI7/CiyZj7InMf++EYxhBZRnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJlUY87mt1iUUimVVgAwW83ZHp6Hq8Sh4NKGdQMf2Hg2t9yTWIDWUvLzIQIXTFx+0EHbK0QNmja+pY17K0VrcnKbQIvDHdm+ZXZxTGDeY9joLPA1X6Fqg2/Don6pwZfWoNu34D0DbGC/3Ciu+mukOtjSyMJdcQUJ8Ui6JPaM8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P67isBFo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P67isBFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751406991; x=1782942991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oY5LNb5fbr7IN9pcsIbI7/CiyZj7InMf++EYxhBZRnI=;
  b=P67isBFoqW2LyzlD0wh+3lTsA1QgFIUa7tWDAre8m02aLOywvm2A0Mdc
   /8pnzB6/46tHORqYw1fn7hDmhu8mxr4X342NNz1cc7GVE2O8u9deCOMCq
   zedNCNq+yhp6/n0zOy1I31URwyKUvD8w4788isDaS24cKuXmGsyhgKhQP
   8ZkjuVAcAzldDMoTYPUI4b4h2hsbMLGAE3d38lTtW+HgEjEudxMQ+f5D4
   eVT19o3PncDdt3HQG/+t+lSLXqQJ+juYPQsJeC/gb8QH4be+3q73nRl6v
   82lfoWlEDhHViORDckPzJSn6MyVOcjfCHOLlQqw5YkiehyEEEuxdIAFrk
   A==;
X-CSE-ConnectionGUID: W6EThYIeTZ6h5DZ2E/AOsA==
X-CSE-MsgGUID: 4syxbSMwSqK0zQAVrZ3bEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52803247"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="52803247"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 14:56:30 -0700
X-CSE-ConnectionGUID: WdunRTW0RKKf9wvtdSnDpQ==
X-CSE-MsgGUID: 9L0X+n5xTOmZAOIzj/X5xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="177559879"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 14:56:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWixm-000ahY-2S;
	Tue, 01 Jul 2025 21:56:26 +0000
Date: Wed, 2 Jul 2025 05:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [tip:master 19/19] include/linux/irq-entry-common.h:201:2: error:
 unexpected token
Message-ID: <202507020528.N0LtekXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   104f02a7798f7e8aba25545f9d485035532260b2
commit: 104f02a7798f7e8aba25545f9d485035532260b2 [19/19] Merge core/entry into tip/master
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020528.N0LtekXt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/process.c:32:
   include/linux/entry-common.h:161:7: error: unexpected token
     161 |                 if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
         |                     ^
   include/asm-generic/bug.h:141:3: note: expanded from macro 'WARN'
     141 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:113:3: note: expanded from macro '__WARN_printf'
     113 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:31:1: note: expanded from here
      31 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/entry-common.h\"; .popsection; .long 10002b - .; .short 161; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/entry-common.h"; .popsection; .long 10002b - .; .short 161; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from arch/s390/kernel/process.c:32:
   In file included from include/linux/entry-common.h:5:
>> include/linux/irq-entry-common.h:201:2: error: unexpected token
     201 |         lockdep_assert_irqs_disabled();
         |         ^
   include/linux/lockdep.h:582:2: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:153:1: note: expanded from here
     153 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"__lockdep_enabled && this_cpu_read(hardirqs_enabled)\"\"] \" \"include/linux/irq-entry-common.h\"; .popsection; .long 10002b - .; .short 201; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""__lockdep_enabled && this_cpu_read(hardirqs_enabled)""] " "include/linux/irq-entry-common.h"; .popsection; .long 10002b - .; .short 201; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from arch/s390/kernel/process.c:32:
   In file included from include/linux/entry-common.h:5:
   include/linux/irq-entry-common.h:214:2: error: unexpected token
     214 |         lockdep_assert_irqs_disabled();
         |         ^
   include/linux/lockdep.h:582:2: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:2:1: note: expanded from here
       2 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"__lockdep_enabled && this_cpu_read(hardirqs_enabled)\"\"] \" \"include/linux/irq-entry-common.h\"; .popsection; .long 10002b - .; .short 214; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""__lockdep_enabled && this_cpu_read(hardirqs_enabled)""] " "include/linux/irq-entry-common.h"; .popsection; .long 10002b - .; .short 214; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   3 errors generated.
--
   In file included from arch/s390/kernel/syscall.c:35:
   include/linux/entry-common.h:161:7: error: unexpected token
     161 |                 if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
         |                     ^
   include/asm-generic/bug.h:141:3: note: expanded from macro 'WARN'
     141 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:113:3: note: expanded from macro '__WARN_printf'
     113 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:137:1: note: expanded from here
     137 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/entry-common.h\"; .popsection; .long 10002b - .; .short 161; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/entry-common.h"; .popsection; .long 10002b - .; .short 161; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from arch/s390/kernel/syscall.c:35:
   In file included from include/linux/entry-common.h:5:
>> include/linux/irq-entry-common.h:201:2: error: unexpected token
     201 |         lockdep_assert_irqs_disabled();
         |         ^
   include/linux/lockdep.h:582:2: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:59:1: note: expanded from here
      59 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"__lockdep_enabled && this_cpu_read(hardirqs_enabled)\"\"] \" \"include/linux/irq-entry-common.h\"; .popsection; .long 10002b - .; .short 201; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""__lockdep_enabled && this_cpu_read(hardirqs_enabled)""] " "include/linux/irq-entry-common.h"; .popsection; .long 10002b - .; .short 201; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from arch/s390/kernel/syscall.c:35:
   In file included from include/linux/entry-common.h:5:
   include/linux/irq-entry-common.h:214:2: error: unexpected token
     214 |         lockdep_assert_irqs_disabled();
         |         ^
   include/linux/lockdep.h:582:2: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:104:1: note: expanded from here
     104 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"__lockdep_enabled && this_cpu_read(hardirqs_enabled)\"\"] \" \"include/linux/irq-entry-common.h\"; .popsection; .long 10002b - .; .short 214; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""__lockdep_enabled && this_cpu_read(hardirqs_enabled)""] " "include/linux/irq-entry-common.h"; .popsection; .long 10002b - .; .short 214; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   3 errors generated.


vim +201 include/linux/irq-entry-common.h

a70e9f647f501e3 Jinjie Ruan 2025-06-24  180  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  181  /**
a70e9f647f501e3 Jinjie Ruan 2025-06-24  182   * exit_to_user_mode_loop - do any pending work before leaving to user space
a70e9f647f501e3 Jinjie Ruan 2025-06-24  183   */
a70e9f647f501e3 Jinjie Ruan 2025-06-24  184  unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
a70e9f647f501e3 Jinjie Ruan 2025-06-24  185  				     unsigned long ti_work);
a70e9f647f501e3 Jinjie Ruan 2025-06-24  186  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  187  /**
a70e9f647f501e3 Jinjie Ruan 2025-06-24  188   * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
a70e9f647f501e3 Jinjie Ruan 2025-06-24  189   * @regs:	Pointer to pt_regs on entry stack
a70e9f647f501e3 Jinjie Ruan 2025-06-24  190   *
a70e9f647f501e3 Jinjie Ruan 2025-06-24  191   * 1) check that interrupts are disabled
a70e9f647f501e3 Jinjie Ruan 2025-06-24  192   * 2) call tick_nohz_user_enter_prepare()
a70e9f647f501e3 Jinjie Ruan 2025-06-24  193   * 3) call exit_to_user_mode_loop() if any flags from
a70e9f647f501e3 Jinjie Ruan 2025-06-24  194   *    EXIT_TO_USER_MODE_WORK are set
a70e9f647f501e3 Jinjie Ruan 2025-06-24  195   * 4) check that interrupts are still disabled
a70e9f647f501e3 Jinjie Ruan 2025-06-24  196   */
a70e9f647f501e3 Jinjie Ruan 2025-06-24  197  static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
a70e9f647f501e3 Jinjie Ruan 2025-06-24  198  {
a70e9f647f501e3 Jinjie Ruan 2025-06-24  199  	unsigned long ti_work;
a70e9f647f501e3 Jinjie Ruan 2025-06-24  200  
a70e9f647f501e3 Jinjie Ruan 2025-06-24 @201  	lockdep_assert_irqs_disabled();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  202  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  203  	/* Flush pending rcuog wakeup before the last need_resched() check */
a70e9f647f501e3 Jinjie Ruan 2025-06-24  204  	tick_nohz_user_enter_prepare();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  205  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  206  	ti_work = read_thread_flags();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  207  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
a70e9f647f501e3 Jinjie Ruan 2025-06-24  208  		ti_work = exit_to_user_mode_loop(regs, ti_work);
a70e9f647f501e3 Jinjie Ruan 2025-06-24  209  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  210  	arch_exit_to_user_mode_prepare(regs, ti_work);
a70e9f647f501e3 Jinjie Ruan 2025-06-24  211  
a70e9f647f501e3 Jinjie Ruan 2025-06-24  212  	/* Ensure that kernel state is sane for a return to userspace */
a70e9f647f501e3 Jinjie Ruan 2025-06-24  213  	kmap_assert_nomap();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  214  	lockdep_assert_irqs_disabled();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  215  	lockdep_sys_exit();
a70e9f647f501e3 Jinjie Ruan 2025-06-24  216  }
a70e9f647f501e3 Jinjie Ruan 2025-06-24  217  

:::::: The code at line 201 was first introduced by commit
:::::: a70e9f647f501e36a6a092888b1ea7386b7c5664 entry: Split generic entry into generic exception and syscall entry

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
