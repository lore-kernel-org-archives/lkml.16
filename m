Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F191DE89B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516595; cv=none; b=XYGGs0d6jxvShgMtTYQK9b5LHB9i4QPsp/1V14gV0j68UbDJfkMFlZkKlBIduXfEFCP6W1Xz+YrXkFEV7chxwWkmizHdzIa0TAPDfhahP4TWv/hIlxxm+q26yioQ9wZsYlpX2/LkxkEglpw3vQ1G6tp1MLq3FGmvuCrYBuaN88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516595; c=relaxed/simple;
	bh=Yn9dVZsvMXLIwbt/fspA5DsmNe/mbinsIxmwOYQ3jRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojzR3vKkQVewvb8BKi3Fkhu64kjtaNLuGUYBMYjctpbvjE/cDyv4b+cph7TNglX8DVBtnWDlv+JdYnHNjzlDO+e5T9GcvqYYNebHYuMxS87N2I1wm/mtsIF5Q0wt3SmcROPtbD2GFYt9BgxfoV+E36CAoeHEp5zwIEoAANkQeBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTl415la; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTl415la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516594; x=1780052594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yn9dVZsvMXLIwbt/fspA5DsmNe/mbinsIxmwOYQ3jRM=;
  b=aTl415laUbhdnjd4XLLTkuCaAVQ2wut4c3OXPOdXYw0rD1OLbPO+k+mT
   /cVrrLgwhvpZMYD0pBZaLRoI16wvme9mIROYhp3C57mkNz7V4zXfsdTvd
   AAZZQ26wzjJUjFMEiwFqQ9mXLpFUMXTqL6Q6zr5eNSX/rum4Rwa7HXzYL
   WhxVNLhVeshj4b4eVP38I5+ao8guEzKz8xv5XS0TAd/etRtzpuYTEeyFm
   Tk8E4SBNRjxgpHWqizprN3y3Kqicw0tqx58S0fTeeuxaZcqCE0HbitjJv
   xGiVCQVIJAKDLNXDt2UWImjq3VlzuD3n0SqB0yikNUndck/VbjXe2a5gM
   A==;
X-CSE-ConnectionGUID: 2S2iz9bWQz2aS8UNu4XmHQ==
X-CSE-MsgGUID: P88SFPmHTEKw22AJD9CtpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369597"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369597"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:13 -0700
X-CSE-ConnectionGUID: 6kVKqstISrW7He3HzHIs1Q==
X-CSE-MsgGUID: bTctGFv2QD62OegFqsdS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303605"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:11 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2S-0000Hk-2k;
	Thu, 29 May 2025 11:03:08 +0000
Date: Thu, 29 May 2025 19:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250424 1/25]
 kernel/bpf/core.c:2576:22: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202505291933.IiIYX6Xj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250424
head:   604833e5a102945aa4596b80085ef9cada5e6d57
commit: 117d6f3024817bf22efc8b81679e0b282ca9cc07 [1/25] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: alpha-randconfig-2006-20250504 (https://download.01.org/0day-ci/archive/20250529/202505291933.IiIYX6Xj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291933.IiIYX6Xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291933.IiIYX6Xj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: note: -Wvla-larger-than=0 is meaningless
   kernel/bpf/core.c: In function 'bpf_prog_array_free_sleepable':
>> kernel/bpf/core.c:2576:22: warning: comparison of distinct pointer types lacks a cast
     if (!progs || progs == &bpf_empty_prog_array.hdr)
                         ^~


vim +2576 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2573  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2574  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2575  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2576  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2577  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2578  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2579  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2580  

:::::: The code at line 2576 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
