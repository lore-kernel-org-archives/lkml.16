Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCDB227B83
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332111; cv=none; b=hdTwMDXrMLxRj8YuGs0QcKv8RTfkvdx9cRLCyzUdwWEhPtbN5iJFgQ0UffYZ02iYhq+2ZokNe4w9aOAKrWIZxNiqSEEK0dQ/gyzcJWXCNoXGZa01MqLKrL2PnSI/hYU6iwwkmqNIoqQxFzKo0hbn+IsJcnjTAOkV1rVh5zK/AR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332111; c=relaxed/simple;
	bh=3tTK+4sQbaINoY3O97tp53YJWDlhHIcAe9T+PmMWQlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shN7oSFhtEMUQDlLefdKipMF1UtzHR/ksQgsULCscsJjES35YTElj9rqT+9cbaiQX4Qiv2vKtRM/Vkox9uAD9ol+UA2D/H/DFMeLZ/g4mLjU2jvVdGslls0AoeldoGDkBOKSmHqxfkzY08H+tD86Iq+bxQm9pa3iEz+fqg4Zrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgHMNlZp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgHMNlZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750332109; x=1781868109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tTK+4sQbaINoY3O97tp53YJWDlhHIcAe9T+PmMWQlA=;
  b=mgHMNlZp15d9SjpWkeSky2JZ7gMCy5ymJVqUOu6ftiFnom5oCZptx3PW
   u/YpIVPUGFchE+eUBjd5QxLtgVkZNj74JuG4ER2o7aSbHsAUAGKf+y6ti
   shsA4O5XHn3HaN3NuPcmZCWF0v9+XSeAYssEYG97VhKR4ncubkP+SeSS0
   mSmpfInw2fdYCA/SDI0X2mGbGeRWga8qjBHJQ/iD7Th2hc+Fvmb1ZaQel
   SIRsL/FAG2wUvBGYPOyx6fz45OufC3zuKezpTRWZm7xLt+SbU69ay4IEQ
   ca13xn6AjFnU96Ujxw/0u5idWz1X1UkHF14Hx+aIHx8Nal0ahybYvukIe
   Q==;
X-CSE-ConnectionGUID: Atn/1caKTVi1N4Wz2l+8QQ==
X-CSE-MsgGUID: HvXfUxNaQJ+q+0m/ygcCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56403214"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56403214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:21:48 -0700
X-CSE-ConnectionGUID: N3BsQppuSnG9Sao3jYY7XA==
X-CSE-MsgGUID: uPN8q1jhTU+V2VMqHof0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150422105"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2025 04:21:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSDKy-000Kgq-0t;
	Thu, 19 Jun 2025 11:21:44 +0000
Date: Thu, 19 Jun 2025 19:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: include/linux/ftrace.h:190:9: error: call to undeclared function
 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202506191949.o3SMu8Zn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb4d33ab452ea254e2c319bac5703d1b56d895bf
commit: d0262e907e2991ae09ca476281fc8cae3ec57850 riscv: ftrace: support PREEMPT
date:   2 weeks ago
config: riscv-randconfig-r071-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191949.o3SMu8Zn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191949.o3SMu8Zn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191949.o3SMu8Zn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
>> include/linux/ftrace.h:190:9: error: call to undeclared function 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |         return arch_ftrace_get_regs(fregs);
         |                ^
   include/linux/ftrace.h:190:9: note: did you mean 'ftrace_get_regs'?
   include/linux/ftrace.h:185:40: note: 'ftrace_get_regs' declared here
     185 | static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
         |                                        ^
     186 | {
     187 |         if (!fregs)
     188 |                 return NULL;
     189 | 
     190 |         return arch_ftrace_get_regs(fregs);
         |                ~~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
>> include/linux/ftrace.h:190:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct pt_regs *' [-Wint-conversion]
     190 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/arch_ftrace_get_regs +190 include/linux/ftrace.h

762abbc0d09f7a Masami Hiramatsu (Google  2024-12-26  184) 
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  185) static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  186) {
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  187) 	if (!fregs)
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  188) 		return NULL;
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  189) 
02a474ca266a47 Steven Rostedt (VMware    2020-10-27 @190) 	return arch_ftrace_get_regs(fregs);
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  191) }
d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  192) 

:::::: The code at line 190 was first introduced by commit
:::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arguments to be passed in to ftrace_regs by default

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
