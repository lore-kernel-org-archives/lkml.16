Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7572AEE4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709952; cv=none; b=uj6BPTkTmjGElW2eYq4klpT/FrxtCmXnZCcfQT0dnWmRde9hRlb3jWaQPy7rkp0yQ4cU+8z+fhUalzdTPa9EqjqkCC+nkYc6KRcl9qlIUKoAHfMzZHNNPf/St1MXjVp+KYJutJ8Bh5+o3ZwU5K37fOlZ/uhtYau+2mwubf0IhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709952; c=relaxed/simple;
	bh=B9NymcOJa5uLyrLdT8Sw/APBhv4qYh/oyOekRakyXVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSQZjNox2/xhNvfndGSM4pTyH/dIuOUB0/sOszAKw3bXSeDMOaSqOPUNP43tfV9qoc2Mf6uxcg2BS/D10UX4HcXkqLjforAMFs80II2oyAPzs8vDJNKYdlKE6AygJC3qIwCgF+y5xBCh+gXiU+6ZzHESYr183Jpt7lGKaPS+S3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZObk9Hb9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZObk9Hb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750709951; x=1782245951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9NymcOJa5uLyrLdT8Sw/APBhv4qYh/oyOekRakyXVc=;
  b=ZObk9Hb93yBcVIJYCLAMrYfYgS4KS04MfjCAcVOVj81WbBaEdhVm45DV
   7GQkw9WqtzQciZ9Dnn4uWCi/cuB0kVR0DEsE7yhwoiJXoAeuxEoOBqahQ
   H6zMxNPVohIZ48NUv+2o46w9OCbTaOYgYLc2sbMnwr5tbfGfgivdawNP2
   uA0KE+ZcZmVsu0M4f2n+MLcPL7iae/MSG3tivVGp9Nhw1fRVuMV9nNmuu
   TyPEHSlEUGgxRJQMztXDv+/FrqotR5taG7r9lnOeNewRuxScrZ8+c4+9q
   LdEYPk3zrMJsdBoMnZ6FDeccpmd2b6LFxwNSzgDR+nVUs1DX72U2zhiVj
   w==;
X-CSE-ConnectionGUID: TGEvZYD1RFO9QE1fkdlHuQ==
X-CSE-MsgGUID: Wva0lX8fRzesSECJfIk9xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52157898"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52157898"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 13:19:10 -0700
X-CSE-ConnectionGUID: s+3Xg1hoTRW3oU9JHGkx+w==
X-CSE-MsgGUID: qPSB9z4pQcmmnFHtIXRJXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="182573234"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2025 13:19:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTndD-000PIU-03;
	Mon, 23 Jun 2025 20:19:07 +0000
Date: Tue, 24 Jun 2025 04:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/trace_fprobe.c:1264:12: warning: stack frame size
 (1032) exceeds limit (1024) in 'trace_fprobe_create_cb'
Message-ID: <202506240416.nZIhDXoO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 57faaa04804ccbf16582f7fc7a6b986fd0c0e78c tracing: probe-events: Log error for exceeding the number of arguments
date:   3 months ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250624/202506240416.nZIhDXoO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240416.nZIhDXoO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240416.nZIhDXoO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_fprobe.c:1264:12: warning: stack frame size (1032) exceeds limit (1024) in 'trace_fprobe_create_cb' [-Wframe-larger-than]
    1264 | static int trace_fprobe_create_cb(int argc, const char *argv[])
         |            ^
   1 warning generated.


vim +/trace_fprobe_create_cb +1264 kernel/trace/trace_fprobe.c

8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1263) 
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17 @1264) static int trace_fprobe_create_cb(int argc, const char *argv[])
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1265) {
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1266) 	struct traceprobe_parse_context ctx = {
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1267) 		.flags = TPARG_FL_KERNEL | TPARG_FL_FPROBE,
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1268) 	};
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1269) 	int ret;
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1270) 
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1271) 	trace_probe_log_init("trace_fprobe", argc, argv);
8275637215bd3d4 Masami Hiramatsu (Google  2025-01-17  1272) 	ret = trace_fprobe_create_internal(argc, argv, &ctx);
b1d1e90490b6714 Masami Hiramatsu (Google  2023-08-23  1273) 	traceprobe_finish_parse(&ctx);
334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1274) 	trace_probe_log_clear();
334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1275) 	return ret;
334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1276) }
334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1277) 

:::::: The code at line 1264 was first introduced by commit
:::::: 8275637215bd3d447b31d37f9b8231a013adb042 tracing: Adopt __free() and guard() for trace_fprobe.c

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
