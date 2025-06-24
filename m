Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F55548EE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729684; cv=none; b=cw/lRgCN6TyxV3VQOaiXnFG7OqANQc6sO2j2i7i3AetUg9atwSj5JSUmF15s56WQxNhh+ivhjCDPYEc4YWU42aAhQ1pYg3Ao1HWjU4dPlImPIbFTsEZCeSY9nZueg1DsUHDkR+oLId09cFXvd5YOX1Q3CiCjRVnnwt8aqB8suQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729684; c=relaxed/simple;
	bh=4Z+MxAv/E3x5NjkQjYUMOIRkLTz0n3Uji48u5umGecw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQyb0yKRtdOOagwNko+sbsFgujBWEzf80F03kG78YAZj/XzNCCYtBzxr/NFjc4OjqiG4k38tZyJ45Dc92PQCJVp58g4DtJO3CCSFDDa7eRH+dY+9HZjeQP6pwivIUOHkvKfmTDYYxiEPuYqGl540KMfYT+h9LWCyh8I4rGP7z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2KImsr1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2KImsr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750729683; x=1782265683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Z+MxAv/E3x5NjkQjYUMOIRkLTz0n3Uji48u5umGecw=;
  b=l2KImsr1Zt4J7QvfLa9TJy9WWJDgqP9Swz736SWNV1LBrJu6Cbu80n6j
   Ug4/4lXTUeROfR89gWNMnh/2cJ3ggJYqyI50t+kfevbY3/yo7Dqj+paPT
   k2JsbkklcEm0o2bBLPd3gRKUaLnbxGgMucAv4UZjcUpEUl7aB/ZbdNos7
   RD2/nr/4vbRIFYEikEg5OzNWNhAdOp2bfunhqkfKPR3oN3fi0R8CUNZbk
   a9l89MNLz+b30B/TPdmOkB1ZbwG8ME0yzLh7cd5/TFMoZB/9ToCME9kA2
   9w8Q0Fc9svW0aW/c0ZcQ6A0PU1wqj91lYolu26BfB+siSSLavXtyhCNIm
   Q==;
X-CSE-ConnectionGUID: o+sj9fFqQGqPA0svgrsSWQ==
X-CSE-MsgGUID: dQeOsbnhS/WOxL7hWnRcng==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56625105"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="56625105"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 18:48:02 -0700
X-CSE-ConnectionGUID: RSoEG4aUTnmDlrm5pvRcgg==
X-CSE-MsgGUID: e5EvzGW0Rga6kwHB9fljDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152287608"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 18:48:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTslS-000Rbi-2E;
	Tue, 24 Jun 2025 01:47:58 +0000
Date: Tue, 24 Jun 2025 09:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Jia <jiahao1@lixiang.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/s390/appldata/appldata_mem.c:72:13: warning: stack frame size
 (1040) exceeds limit (1024) in 'appldata_get_mem_data'
Message-ID: <202506240917.5GatGoT7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78f4e737a53e1163ded2687a922fce138aee73f5
commit: e452872b40e3f1fb92adf0d573a0a6a7c9f6ce22 mm: vmscan: split proactive reclaim statistics from direct reclaim statistics
date:   3 months ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240917.5GatGoT7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240917.5GatGoT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240917.5GatGoT7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/appldata/appldata_mem.c:72:13: warning: stack frame size (1040) exceeds limit (1024) in 'appldata_get_mem_data' [-Wframe-larger-than]
      72 | static void appldata_get_mem_data(void *data)
         |             ^
   1 warning generated.


vim +/appldata_get_mem_data +72 arch/s390/appldata/appldata_mem.c

^1da177e4c3f415 Linus Torvalds    2005-04-16   65  
^1da177e4c3f415 Linus Torvalds    2005-04-16   66  
^1da177e4c3f415 Linus Torvalds    2005-04-16   67  /*
^1da177e4c3f415 Linus Torvalds    2005-04-16   68   * appldata_get_mem_data()
^1da177e4c3f415 Linus Torvalds    2005-04-16   69   *
^1da177e4c3f415 Linus Torvalds    2005-04-16   70   * gather memory data
^1da177e4c3f415 Linus Torvalds    2005-04-16   71   */
^1da177e4c3f415 Linus Torvalds    2005-04-16  @72  static void appldata_get_mem_data(void *data)
^1da177e4c3f415 Linus Torvalds    2005-04-16   73  {
^1da177e4c3f415 Linus Torvalds    2005-04-16   74  	/*
^1da177e4c3f415 Linus Torvalds    2005-04-16   75  	 * don't put large structures on the stack, we are
b1ad171efa089ae Gerald Schaefer   2009-04-23   76  	 * serialized through the appldata_ops_mutex and can use static
^1da177e4c3f415 Linus Torvalds    2005-04-16   77  	 */
^1da177e4c3f415 Linus Torvalds    2005-04-16   78  	static struct sysinfo val;
f8891e5e1f93a12 Christoph Lameter 2006-06-30   79  	unsigned long ev[NR_VM_EVENT_ITEMS];
^1da177e4c3f415 Linus Torvalds    2005-04-16   80  	struct appldata_mem_data *mem_data;
^1da177e4c3f415 Linus Torvalds    2005-04-16   81  
^1da177e4c3f415 Linus Torvalds    2005-04-16   82  	mem_data = data;
^1da177e4c3f415 Linus Torvalds    2005-04-16   83  	mem_data->sync_count_1++;
^1da177e4c3f415 Linus Torvalds    2005-04-16   84  
f8891e5e1f93a12 Christoph Lameter 2006-06-30   85  	all_vm_events(ev);
f8891e5e1f93a12 Christoph Lameter 2006-06-30   86  	mem_data->pgpgin     = ev[PGPGIN] >> 1;
f8891e5e1f93a12 Christoph Lameter 2006-06-30   87  	mem_data->pgpgout    = ev[PGPGOUT] >> 1;
f8891e5e1f93a12 Christoph Lameter 2006-06-30   88  	mem_data->pswpin     = ev[PSWPIN];
f8891e5e1f93a12 Christoph Lameter 2006-06-30   89  	mem_data->pswpout    = ev[PSWPOUT];
bb81e6050fdc0f2 Al Viro           2007-03-14   90  	mem_data->pgalloc    = ev[PGALLOC_NORMAL];
bb81e6050fdc0f2 Al Viro           2007-03-14   91  	mem_data->pgalloc    += ev[PGALLOC_DMA];
f8891e5e1f93a12 Christoph Lameter 2006-06-30   92  	mem_data->pgfault    = ev[PGFAULT];
f8891e5e1f93a12 Christoph Lameter 2006-06-30   93  	mem_data->pgmajfault = ev[PGMAJFAULT];
^1da177e4c3f415 Linus Torvalds    2005-04-16   94  
^1da177e4c3f415 Linus Torvalds    2005-04-16   95  	si_meminfo(&val);
^1da177e4c3f415 Linus Torvalds    2005-04-16   96  	mem_data->sharedram = val.sharedram;
^1da177e4c3f415 Linus Torvalds    2005-04-16   97  	mem_data->totalram  = P2K(val.totalram);
^1da177e4c3f415 Linus Torvalds    2005-04-16   98  	mem_data->freeram   = P2K(val.freeram);
^1da177e4c3f415 Linus Torvalds    2005-04-16   99  	mem_data->totalhigh = P2K(val.totalhigh);
^1da177e4c3f415 Linus Torvalds    2005-04-16  100  	mem_data->freehigh  = P2K(val.freehigh);
^1da177e4c3f415 Linus Torvalds    2005-04-16  101  	mem_data->bufferram = P2K(val.bufferram);
11fb998986a72aa Mel Gorman        2016-07-28  102  	mem_data->cached    = P2K(global_node_page_state(NR_FILE_PAGES)
347ce434d57da80 Christoph Lameter 2006-06-30  103  				- val.bufferram);
^1da177e4c3f415 Linus Torvalds    2005-04-16  104  
^1da177e4c3f415 Linus Torvalds    2005-04-16  105  	si_swapinfo(&val);
^1da177e4c3f415 Linus Torvalds    2005-04-16  106  	mem_data->totalswap = P2K(val.totalswap);
^1da177e4c3f415 Linus Torvalds    2005-04-16  107  	mem_data->freeswap  = P2K(val.freeswap);
^1da177e4c3f415 Linus Torvalds    2005-04-16  108  
1aae0560d160ee6 Heiko Carstens    2013-01-30  109  	mem_data->timestamp = get_tod_clock();
^1da177e4c3f415 Linus Torvalds    2005-04-16  110  	mem_data->sync_count_2++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  111  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  112  

:::::: The code at line 72 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
