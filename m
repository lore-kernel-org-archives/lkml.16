Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547627AC43
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504453; cv=none; b=K3jaTVIilF8MYEdNQXETdVu+9WXCfv9xyKL/bsbaN9z3kdRdnXlHRpwaxFyhRm4j7YdQ+RqUR9tbez8h39egg4wO/w/VNjW0URJuu6ze3CMIohWA2BrS12yGQ9cL684E6YP87zmtzC5PrijRDCXCkkOam8B/TvqEfHGARu1G6l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504453; c=relaxed/simple;
	bh=XMH1sf/jQ7NhxwT03gZssmLPL9FfAGmAKafJvU5dz8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxBbgneGpm7wmFMCPrbU/6MHInH8qkFITGMaSXZKhm6Ppb1YM/kakWX9cTly/IM0FLGa8ZbTlo2Z7tfmxhZUYQ8Kcfayo8wAGYpnU654E5JIoT4uQUH0V2Mlkar39rhTzqH0c8MJMZnS+NOZ7VwHJmzU9OGDloxXSSnFO5/Sv0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiyjaarC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiyjaarC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746504451; x=1778040451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMH1sf/jQ7NhxwT03gZssmLPL9FfAGmAKafJvU5dz8E=;
  b=ZiyjaarCfkUlsGRTa+4RnbnFpU3zAMUxGw1HN6/7VXHyrP5WlfsOkUlI
   E3CJhsmtW50gMG6j0DHAGP5oM1Asrkocnm9FHfARNwpt/dG15iR0202md
   FuTMrucdjfSYngrYWxgMurJYDaWuYB3FEI95ja/zkoWNW9w1QdknyV2+2
   3ogiprNYAD6UcUbRPlLhS7lkzxSn5H8eMmQhmLFkUBfC+uVYmRJiZhx3C
   QKv6Uu2LSsB6mGZinqrMHWtcGOdznd0wD/Dge6HK5M8uULl+K4DZ4krGc
   jN+n/9dq9geRNu7Ybbe/cT6CtMD4K7//A2KacRD1Elpc1aN4xv9Eu4PXP
   g==;
X-CSE-ConnectionGUID: +y9z/tOVR/G6hNJuG9rg0Q==
X-CSE-MsgGUID: OvJ+k4CCQ9+sm8Obp6w8gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48289908"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48289908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 21:07:31 -0700
X-CSE-ConnectionGUID: YEjB97ylRiCG5FKuLm5BqQ==
X-CSE-MsgGUID: SkIHUOKHR9+DhRa7GZS22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="140611156"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2025 21:07:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9aY-0006FB-2w;
	Tue, 06 May 2025 04:07:26 +0000
Date: Tue, 6 May 2025 12:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: arch/arm/include/asm/stacktrace.h:48:21: error: implicit declaration
 of function 'in_entry_text'
Message-ID: <202505061113.kBQwKkqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinjie,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95d3481af6dc90fd7175a7643fd108cdcb808ce5
commit: 2335c9cb831faba1a4efcc612886073b6f175fe4 ARM: 9407/1: Add support for STACKLEAK gcc plugin
date:   10 months ago
config: arm-randconfig-r071-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061113.kBQwKkqd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061113.kBQwKkqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061113.kBQwKkqd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/stackleak.h:16,
                    from kernel/stackleak.c:13:
   arch/arm/include/asm/stacktrace.h: In function 'arm_get_current_stackframe':
>> arch/arm/include/asm/stacktrace.h:48:21: error: implicit declaration of function 'in_entry_text' [-Werror=implicit-function-declaration]
      frame->ex_frame = in_entry_text(frame->pc);
                        ^~~~~~~~~~~~~
   In file included from include/linux/interrupt.h:21,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from include/linux/kprobes.h:28,
                    from kernel/stackleak.c:14:
   arch/arm/include/asm/sections.h: At top level:
>> arch/arm/include/asm/sections.h:14:20: error: conflicting types for 'in_entry_text'
    static inline bool in_entry_text(unsigned long addr)
                       ^~~~~~~~~~~~~
   In file included from include/linux/stackleak.h:16,
                    from kernel/stackleak.c:13:
   arch/arm/include/asm/stacktrace.h:48:21: note: previous implicit declaration of 'in_entry_text' was here
      frame->ex_frame = in_entry_text(frame->pc);
                        ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/in_entry_text +48 arch/arm/include/asm/stacktrace.h

2335c9cb831fab Jinjie Ruan      2024-06-27  35  
9865f1d46a68a5 Nikolay Borisov  2014-06-03  36  static __always_inline
9865f1d46a68a5 Nikolay Borisov  2014-06-03  37  void arm_get_current_stackframe(struct pt_regs *regs, struct stackframe *frame)
9865f1d46a68a5 Nikolay Borisov  2014-06-03  38  {
9865f1d46a68a5 Nikolay Borisov  2014-06-03  39  		frame->fp = frame_pointer(regs);
9865f1d46a68a5 Nikolay Borisov  2014-06-03  40  		frame->sp = regs->ARM_sp;
9865f1d46a68a5 Nikolay Borisov  2014-06-03  41  		frame->lr = regs->ARM_lr;
9865f1d46a68a5 Nikolay Borisov  2014-06-03  42  		frame->pc = regs->ARM_pc;
fed240d9c97438 Masami Hiramatsu 2021-10-21  43  #ifdef CONFIG_KRETPROBES
fed240d9c97438 Masami Hiramatsu 2021-10-21  44  		frame->kr_cur = NULL;
fed240d9c97438 Masami Hiramatsu 2021-10-21  45  		frame->tsk = current;
fed240d9c97438 Masami Hiramatsu 2021-10-21  46  #endif
752ec621ef5c30 Li Huafei        2022-08-26  47  #ifdef CONFIG_UNWINDER_FRAME_POINTER
752ec621ef5c30 Li Huafei        2022-08-26 @48  		frame->ex_frame = in_entry_text(frame->pc);
752ec621ef5c30 Li Huafei        2022-08-26  49  #endif
9865f1d46a68a5 Nikolay Borisov  2014-06-03  50  }
9865f1d46a68a5 Nikolay Borisov  2014-06-03  51  

:::::: The code at line 48 was first introduced by commit
:::::: 752ec621ef5c30777958cc5eb5f1cf394f7733f4 ARM: 9234/1: stacktrace: Avoid duplicate saving of exception PC value

:::::: TO: Li Huafei <lihuafei1@huawei.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
