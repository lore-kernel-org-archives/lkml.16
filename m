Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880751487C3
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748088715; cv=none; b=n7M69t3j1q/xRx7ldGWbeR4mO23Cd0/wSv1VZb0FFI9VKkqEKpIwMRKZ2qoySWMaK6GzJzRwq5uN2M2+BoSzkKCUMd7SRPpU1MIESX+MrR7CbTYpKY9aEeFd6dHKEUmeL7J9oOyphcgyAQflwOj9qwTLMbiwgjRIqf7P7loiLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748088715; c=relaxed/simple;
	bh=Ci5DoOih9MqstjOJ+bxNXoyO42bodu8rzJlZfn6FH3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lRsj3GnPJ56Z6JE+vfpyJK+nNKGLEb1quPGIHRxQ1zLwUIGIg8ea/ui4VDceUbe23chfswt2qgZLryJLjMLaTqc72ejrJmuFPc4Mn+npjciOElNEI/UUuulTz21N6fpayCmy/odXA74yU+DPwP1scHnc/sIa/IVxjpWifR+mBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYNpOY/M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYNpOY/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748088713; x=1779624713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ci5DoOih9MqstjOJ+bxNXoyO42bodu8rzJlZfn6FH3E=;
  b=EYNpOY/MRAayqH+vh89boCzP3k//jZFkhbGKDxArHpnHyEl9Mtiawwxg
   3N1uBq8HGGbLqkv6dKjpLxocW1VfEx2g35JaIfmQT30PcFGbAc0MUvbil
   6iyuoKdhXVy1oF6mPtC1kln+Onqcd6fkfYVxuYUaer08q2iXgcK7mD/hp
   PeKHITLWaJzwOvpBqeIcu+MHDOrpGQnYZHd8eELfELMnbQcDejEhqnVV9
   DMcS7JF1t5rjT5DxdGhbg7P2yBZ3L8yA8eY14JYREfMwg0VqqtHghOAAK
   vvcaaumZBK7XiW1Vgiafb4BrEHaBpxeUM43lqm6tjspQ9y7Eo6nCz0EmN
   A==;
X-CSE-ConnectionGUID: CM/QYSTpSzK94o+mRBB/ew==
X-CSE-MsgGUID: MnVpfj/BTymsa/RlyjcvNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61481195"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61481195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 05:11:53 -0700
X-CSE-ConnectionGUID: SAQgcoTkQeuLV710oDqZAA==
X-CSE-MsgGUID: fCpLjRfdTtG6Xfs7O2St3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="145496812"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2025 05:11:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uInjB-000RBT-2o;
	Sat, 24 May 2025 12:11:49 +0000
Date: Sat, 24 May 2025 20:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:master 747/770] include/linux/perf_regs.h:40:16: error:
 'PERF_SAMPLE_REGS_ABI_NONE' undeclared
Message-ID: <202505242058.6AYU4Wd3-lkp@intel.com>
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
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505242058.6AYU4Wd3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242058.6AYU4Wd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242058.6AYU4Wd3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:33,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
   include/linux/perf_regs.h: In function 'perf_reg_abi':
>> include/linux/perf_regs.h:40:16: error: 'PERF_SAMPLE_REGS_ABI_NONE' undeclared (first use in this function)
      40 |         return PERF_SAMPLE_REGS_ABI_NONE;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_regs.h:40:16: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/PERF_SAMPLE_REGS_ABI_NONE +40 include/linux/perf_regs.h

4018994f3d87852 Jiri Olsa       2012-08-07  37  
4018994f3d87852 Jiri Olsa       2012-08-07  38  static inline u64 perf_reg_abi(struct task_struct *task)
4018994f3d87852 Jiri Olsa       2012-08-07  39  {
4018994f3d87852 Jiri Olsa       2012-08-07 @40  	return PERF_SAMPLE_REGS_ABI_NONE;
4018994f3d87852 Jiri Olsa       2012-08-07  41  }
88a7c26af8dab2f Andy Lutomirski 2015-01-04  42  

:::::: The code at line 40 was first introduced by commit
:::::: 4018994f3d8785275ef0e7391b75c3462c029e56 perf: Add ability to attach user level registers dump to sample

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
