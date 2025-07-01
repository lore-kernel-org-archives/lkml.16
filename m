Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F241E871
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751343116; cv=none; b=DL16fW0b4LtQBTZ3+kDGmUadke3ZUAJ2Tzr7aGMHYqXF7bvDLZkj7suxSMUm5vA+9XVgRinsKBtV78CVzUw204pwFkt96eadt8Kv8/h45O92hzslh0oCltYbzlPmRkvsptm9slsDDnKlZe6Z0ARPMg2rJQDvy0XAzjzPWmY7Q9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751343116; c=relaxed/simple;
	bh=adc7pZKq1MSJo1rdLRI8hkyib2Ib4HfnVFTEDqOfmHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFGaE7cJslBlm5nCwbrDTkmxs0KkA+nzCCpl66iRsZHGqQ8UBefXmJtxYrK8EitZBuTOzD4/ylrbzhqhZzaHipuR5kX0acuSujw6eGN9VuWhyyqsttim47efnwiLib6d3Rt9TTG3MC8w1vwWzLH1N1wIl+RxAs1ikfoA1GlmlMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWzdr7QQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWzdr7QQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751343115; x=1782879115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adc7pZKq1MSJo1rdLRI8hkyib2Ib4HfnVFTEDqOfmHs=;
  b=GWzdr7QQtc7iGI+hlLpdjUfpZ9VHLFj+MwQbjMafUJiGFqI/1w7pRNG1
   iAAZkHSC0yCaCwWJoVhb0DKjJoCv2HkdTg4wl8V8Y6LOqVuG9rK2t/e59
   tABd031L5GA7EaIvHJJLc9m90YMo4jzZB5qXF4/Wx3Gn+ixG+3P5aI235
   fFw9US36cx2q+IyxdjUt37/RQgXThVuFtyiAldvkrZyIFOkq4//1e1tsc
   7RThGSZMRKeb+oT24mmAOSG918fTKEkNexrZqya5wbXGNafjQOS43u0GQ
   Ado7t7NMawssQa0laOUQuN51ZzGBPYsP4Bd9ONabbdTkUFcLgNWX8cuIH
   g==;
X-CSE-ConnectionGUID: F4Oi0LsFTjmQKuznI96Q2A==
X-CSE-MsgGUID: brkbw5RiSnao9SrvbXDlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57393593"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57393593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 21:11:54 -0700
X-CSE-ConnectionGUID: xze2ByH5QLiQbc87werCWw==
X-CSE-MsgGUID: sdYGBr3rSLiuMhyMF+TPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153734372"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jun 2025 21:11:53 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWSLX-0001PD-0a;
	Tue, 01 Jul 2025 04:11:51 +0000
Date: Tue, 1 Jul 2025 06:11:31 +0200
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616 1/19]
 kernel/bpf/core.c:2582:22: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202507010611.pCKM7IGa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 58bb0d96c1e2ad5ef83b1565b441ae40b9da2652 [1/19] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: nios2-randconfig-2001-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010611.pCKM7IGa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010611.pCKM7IGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010611.pCKM7IGa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_prog_array_free_sleepable':
>> kernel/bpf/core.c:2582:22: warning: comparison of distinct pointer types lacks a cast
     if (!progs || progs == &bpf_empty_prog_array.hdr)
                         ^~


vim +2582 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2579  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2580  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2581  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2582  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2583  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2584  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2585  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2586  

:::::: The code at line 2582 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
