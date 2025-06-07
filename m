Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BB428F5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749270850; cv=none; b=SsQ5MrEX6FJpeNf7CyPkqvMqpPfqKUR1M3SwJD0nxvd8dMrOrIPSwwTgqCPQJ/CRyq1gV91K4VjugZB+30kbhr9xZBkhb9NwzGWmDherzd6G0y6vPIfsm8JoHFpRv859uGe4hsorbfeO74y2v3NoX0pVshRL2RVMnoGeSATFIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749270850; c=relaxed/simple;
	bh=G3PiSTY6owBc+FncVysPjXa7w7CqO6AYIb6st/EXhN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqgdxQlQXhmul8uaKvq72FgZdtp92lh+7aPOsS8MOJrtYnphxgF3nrgmrATja3zdKK9TAUnCyulxd9m83TMrpo3dRxj8IbKjodwG2nh1KiBAp8IHtDjm7PKvRseegskeIth9HLHHJ01zyIbWFNUc0zAgYeyvXFQZYw1KhhS2ejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKNBCGT4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKNBCGT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749270848; x=1780806848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3PiSTY6owBc+FncVysPjXa7w7CqO6AYIb6st/EXhN8=;
  b=YKNBCGT4akMrFNZs2I2m943evVSqzMEc/w8DBFwsEngDjL9kzBBRXk2V
   2TaHq1ietYBow3iHFcixLUgCibZvzli4BaxVxfZ50aBDi2c4pP0TCHS17
   T8z2rbK+TZbFSTt3rrNKHl89tLcTdNjrYHWs4bd/rLhEhnR2dBICs5TMB
   EG3wx9/MeqIfGzFNixaSnz7/a5XkuMq3wL7+QSnhMUwE0fFZfgx6IfrEi
   /oyuYrDxXywjl37qNgH3UedOiMVc2nO0nCJ445+Viw2h9IWaLeMNscpdB
   TAX16TtiMwgJJWkiPuBQQhiMX4Lq5IKj5KGYHAWZl1AufzG7nRrrI7V1o
   w==;
X-CSE-ConnectionGUID: 6Nj58VBGTdKsJ37XRnU3RQ==
X-CSE-MsgGUID: XyGwpN05RzOWjV5mY2ueeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51286415"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51286415"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 21:34:08 -0700
X-CSE-ConnectionGUID: FbRwBcgwRyKLYoCesayx/w==
X-CSE-MsgGUID: BUQm4thIQWm8YrivC0t9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="150879789"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2025 21:34:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNlFs-0005Sv-08;
	Sat, 07 Jun 2025 04:34:04 +0000
Date: Sat, 7 Jun 2025 12:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/os-Linux/start_up.c:309:39: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202506071247.JCFuvo4j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   119b1e61a769aa98e68599f44721661a4d8c55f3
commit: beddc9fb1cb161e1bf779b180750b648ff9690c7 um: Add SECCOMP support detection and initialization
date:   5 days ago
config: um-randconfig-r112-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071247.JCFuvo4j-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071247.JCFuvo4j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071247.JCFuvo4j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/um/os-Linux/start_up.c: note: in included file (through include/linux/compiler_types.h, arch/um/include/shared/init.h):
   include/linux/compiler_attributes.h:55:9: sparse: sparse: preprocessor token __always_inline redefined
   arch/um/os-Linux/start_up.c: note: in included file (through /usr/include/features.h, /usr/include/sys/types.h, arch/um/include/shared/user.h, builtin):
   /usr/include/sys/cdefs.h:426:10: sparse: this was the original definition
>> arch/um/os-Linux/start_up.c:309:39: sparse: sparse: Using plain integer as NULL pointer

vim +309 arch/um/os-Linux/start_up.c

   287	
   288	static bool __init init_seccomp(void)
   289	{
   290		int pid;
   291		int status;
   292		int n;
   293		unsigned long sp;
   294	
   295		/* doesn't work on 32-bit right now */
   296		if (!IS_ENABLED(CONFIG_64BIT))
   297			return false;
   298	
   299		/*
   300		 * We check that we can install a seccomp filter and then exit(0)
   301		 * from a trapped syscall.
   302		 *
   303		 * Note that we cannot verify that no seccomp filter already exists
   304		 * for a syscall that results in the process/thread to be killed.
   305		 */
   306	
   307		os_info("Checking that seccomp filters can be installed...");
   308	
 > 309		seccomp_test_stub_data = mmap(0, sizeof(*seccomp_test_stub_data),
   310					      PROT_READ | PROT_WRITE,
   311					      MAP_SHARED | MAP_ANON, 0, 0);
   312	
   313		/* Use the syscall data area as stack, we just need something */
   314		sp = (unsigned long)&seccomp_test_stub_data->syscall_data +
   315		     sizeof(seccomp_test_stub_data->syscall_data) -
   316		     sizeof(void *);
   317		pid = clone(seccomp_helper, (void *)sp, CLONE_VFORK | CLONE_VM, NULL);
   318	
   319		if (pid < 0)
   320			fatal_perror("check_seccomp : clone failed");
   321	
   322		CATCH_EINTR(n = waitpid(pid, &status, __WCLONE));
   323		if (n < 0)
   324			fatal_perror("check_seccomp : waitpid failed");
   325	
   326		if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
   327			struct uml_pt_regs *regs;
   328			unsigned long fp_size;
   329			int r;
   330	
   331			/* Fill in the host_fp_size from the mcontext. */
   332			regs = calloc(1, sizeof(struct uml_pt_regs));
   333			get_stub_state(regs, seccomp_test_stub_data, &fp_size);
   334			host_fp_size = fp_size;
   335			free(regs);
   336	
   337			/* Repeat with the correct size */
   338			regs = calloc(1, sizeof(struct uml_pt_regs) + host_fp_size);
   339			r = get_stub_state(regs, seccomp_test_stub_data, NULL);
   340	
   341			/* Store as the default startup registers */
   342			exec_fp_regs = malloc(host_fp_size);
   343			memcpy(exec_regs, regs->gp, sizeof(exec_regs));
   344			memcpy(exec_fp_regs, regs->fp, host_fp_size);
   345	
   346			munmap(seccomp_test_stub_data, sizeof(*seccomp_test_stub_data));
   347	
   348			free(regs);
   349	
   350			if (r) {
   351				os_info("failed to fetch registers: %d\n", r);
   352				return false;
   353			}
   354	
   355			os_info("OK\n");
   356			return true;
   357		}
   358	
   359		if (WIFEXITED(status) && WEXITSTATUS(status) == 2)
   360			os_info("missing\n");
   361		else
   362			os_info("error\n");
   363	
   364		munmap(seccomp_test_stub_data, sizeof(*seccomp_test_stub_data));
   365		return false;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
