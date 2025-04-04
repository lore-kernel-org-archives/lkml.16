Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1444420AF62
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786289; cv=none; b=AwpdvfeChEhz9A9wi31vuGXUZeuNwKBDXuJe1zN2wjOVWAMkwnnqnF0aZjztafSc1ntGaucUpbHv56FcsmCKcGVGOQ3hwGfG0cG8S5+m5qyIgXRRh/JaK1jE+hoK8h9bDCDGRMITIe0qCw9lURiw85bd+Oj0s13iI8agjgnuEVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786289; c=relaxed/simple;
	bh=PQ6GEgfzTsDd4LfloGZIp4yubtkGdlsZsPlhKlMxjt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3O1O91E63pWkA+o1iN6e2buiuBkE4np/HaE8isZWEmmFddURRYGnGsNhPP4RCLQsbZOSYBX31I4Mys6dfmHDSPkAjrGFD7VRb4JBEHZYmd4KT8QSwT2LKzEYS5zC1s9cJjXZ2l7R/03zg7V23sCEOkE03kXh7e6IIxoiiHlDhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwgUf7GO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwgUf7GO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743786289; x=1775322289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQ6GEgfzTsDd4LfloGZIp4yubtkGdlsZsPlhKlMxjt0=;
  b=kwgUf7GOStDgG5qxGDFyHYeGcGJtz3CzJGoRR0a/+DRqoC5sh1BQg7hK
   Aqsfg3qLLQo99ydqGy4ZoHUFlvHNjWjV1YPqZo4fCno8eDqg24QLhNyPu
   G0GXOgLR/dwfPVKRKnWZWbChO4MMl4CD+Iy+TO+qNZRX2q/aGVttRvUk5
   QT1YqTP64ShLtLk39S4EqBDUEWN1sVCktaK8ZaCMgMM/rpnROIKPzlqsW
   PW+UzN4HhU79RwIBGx0gbXkrwtc716CzyPtx83uMhkOqfnFPGyUlik7yD
   retD+g1v/f+6Svzjd4N7cYeims/okRg0PG/t/RYiKJscRAJtjUEAaXvTt
   g==;
X-CSE-ConnectionGUID: SlsqSUsHTYiabpYI6zWygQ==
X-CSE-MsgGUID: 7sUEInrkQX64Z8HiF1q+2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49027888"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49027888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:04:46 -0700
X-CSE-ConnectionGUID: v3LFnNyOSYSbfGh5wqXLTg==
X-CSE-MsgGUID: etzyF26PQNCgTOf30FaNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132564002"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2025 10:04:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kTB-0001PV-1d;
	Fri, 04 Apr 2025 17:04:41 +0000
Date: Sat, 5 Apr 2025 01:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/cleanups 5/10] kernel/time/timer_list.c:49:77: error:
 too few arguments provided to function-like macro invocation
Message-ID: <202504050045.fyyfMGEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
commit: 9453228aa82f20c07670d22c3d54f1be6c4244b4 [5/10] hrtimers: Make callback function pointer private
config: hexagon-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050045.fyyfMGEQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050045.fyyfMGEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050045.fyyfMGEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer_list.c:49:77: error: too few arguments provided to function-like macro invocation
      49 |         SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
         |                                                                                    ^
   include/linux/compiler_types.h:78:10: note: macro 'ACCESS_PRIVATE' defined here
      78 | # define ACCESS_PRIVATE(p, member) ((p)->member)
         |          ^
>> kernel/time/timer_list.c:49:47: error: use of undeclared identifier 'ACCESS_PRIVATE'
      49 |         SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
         |                                                      ^
   2 errors generated.


vim +49 kernel/time/timer_list.c

    44	
    45	static void
    46	print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
    47		    int idx, u64 now)
    48	{
  > 49		SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
    50		SEQ_printf(m, ", S:%02x", timer->state);
    51		SEQ_printf(m, "\n");
    52		SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
    53			(unsigned long long)ktime_to_ns(hrtimer_get_softexpires(timer)),
    54			(unsigned long long)ktime_to_ns(hrtimer_get_expires(timer)),
    55			(long long)(ktime_to_ns(hrtimer_get_softexpires(timer)) - now),
    56			(long long)(ktime_to_ns(hrtimer_get_expires(timer)) - now));
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
