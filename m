Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BD7B3E1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729025; cv=none; b=ZDtbQ4dS+mWfNNi+9fGdPaYkKPecOhf0r1iTKXNWnCUEHsEc9BlSsvYH68aQw/zYzxCZep8JfTYb2AAl2vbsi1l+j7W5i7yeaqFHGwf0JJfXMUDqTpXh5tWuosegfPBjhz0NubcuBF+GSm8FsjT8o7BGCF+k31SwfKE5qlMsyxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729025; c=relaxed/simple;
	bh=7cffUjKpvMDCS3GmH1yOQEyxjboJLfZci5Lhpb8OFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pT7o760/apMQgdebQY8u96JURK2entpwBd7QcS3cmWi/oHWIlZ+xss7nfl42KUK2+bo3DObiGyAQEoAE/3woI/TktQnG36UNjBcI70iuEF+y2mdOm+lo9TbtAuTNrnRFUwH7faShRrhhSk2DXOxmdCniewQzYQB0b2YYZEIkseE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJo4R59Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJo4R59Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750729023; x=1782265023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7cffUjKpvMDCS3GmH1yOQEyxjboJLfZci5Lhpb8OFgQ=;
  b=IJo4R59Ya1nyRnpiF4pLNb5dNo+bPS3vkVz5PSTD0aEKNaOa56WRujQ7
   E9lzu9UPXmDNswGeNS2v7+V6j0Wzehfc7YZSwuqYINob5tZVklNgIxXli
   veGobdfrrjQseucRgpQC4yldqEmenmkyLsEOv08ZcyZuojrg4BaP3/Hvu
   btql92vengKBfOTWmb+XhKSecrA/S37pLbnpn9F1FxPjh4UIDi+AUwCmH
   xY6/B9koxWto+SF/m19OoPTxtPqeanY6oOecnMb5n7M54q7/7q9LqLw5c
   eXTwGaQ1yEeicTytI7bOsjCUC7flED+JcSJ1Z0LWdH+rLjIbGJWVbmLQA
   Q==;
X-CSE-ConnectionGUID: PTwt3TchR/aMzp08cgIPrA==
X-CSE-MsgGUID: 5gqdPrMSTyKyx75eEIdSPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52825953"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52825953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 18:37:03 -0700
X-CSE-ConnectionGUID: 5xvq7lJ1R4WcA7Iu1sHW5Q==
X-CSE-MsgGUID: b22foTNJQ9qlgSrQ+1ry2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="156333639"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2025 18:37:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTsao-000RbY-0P;
	Tue, 24 Jun 2025 01:36:58 +0000
Date: Tue, 24 Jun 2025 09:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Subject: net/bpf/test_run.c:370:12: warning: stack frame size (1152) exceeds
 limit (1024) in 'bpf_test_run_xdp_live'
Message-ID: <202506240921.WNcmLMhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78f4e737a53e1163ded2687a922fce138aee73f5
commit: 3f9fe37d9e16a6cfd5f4d1f536686ea71db3196f net: Move per-CPU flush-lists to bpf_net_context on PREEMPT_RT.
date:   12 months ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506240921.WNcmLMhg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240921.WNcmLMhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240921.WNcmLMhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/bpf/test_run.c:17:
   In file included from include/net/tcp.h:32:
   In file included from include/net/inet_hashtables.h:26:
   include/net/ip.h:472:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     472 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:451:26: warning: default initialization of an object of type 'typeof ((kattr->test.data_out))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     451 |         void __user *data_out = u64_to_user_ptr(kattr->test.data_out);
         |                                 ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:658:25: warning: default initialization of an object of type 'typeof ((kattr->test.data_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     658 |         void __user *data_in = u64_to_user_ptr(kattr->test.data_in);
         |                                ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:755:24: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     755 |         void __user *ctx_in = u64_to_user_ptr(kattr->test.ctx_in);
         |                               ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:811:25: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     811 |         void __user *data_in = u64_to_user_ptr(kattr->test.ctx_in);
         |                                ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:812:26: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_out))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     812 |         void __user *data_out = u64_to_user_ptr(kattr->test.ctx_out);
         |                                 ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:844:26: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_out))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     844 |         void __user *data_out = u64_to_user_ptr(kattr->test.ctx_out);
         |                                 ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:1251:26: warning: default initialization of an object of type 'typeof ((kattr->test.data_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    1251 |                 void __user *data_in = u64_to_user_ptr(kattr->test.data_in);
         |                                        ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   net/bpf/test_run.c:1508:24: warning: default initialization of an object of type 'typeof ((kattr->test.ctx_in))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    1508 |         void __user *ctx_in = u64_to_user_ptr(kattr->test.ctx_in);
         |                               ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> net/bpf/test_run.c:370:12: warning: stack frame size (1152) exceeds limit (1024) in 'bpf_test_run_xdp_live' [-Wframe-larger-than]
     370 | static int bpf_test_run_xdp_live(struct bpf_prog *prog, struct xdp_buff *ctx,
         |            ^
   15 warnings generated.


vim +/bpf_test_run_xdp_live +370 net/bpf/test_run.c

b530e9e1063ed2 Toke Høiland-Jørgensen 2022-03-09  369  
b530e9e1063ed2 Toke Høiland-Jørgensen 2022-03-09 @370  static int bpf_test_run_xdp_live(struct bpf_prog *prog, struct xdp_buff *ctx,
b530e9e1063ed2 Toke Høiland-Jørgensen 2022-03-09  371  				 u32 repeat, u32 batch_size, u32 *time)
b530e9e1063ed2 Toke Høiland-Jørgensen 2022-03-09  372  

:::::: The code at line 370 was first introduced by commit
:::::: b530e9e1063ed2b817eae7eec6ed2daa8be11608 bpf: Add "live packet" mode for XDP in BPF_PROG_RUN

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
