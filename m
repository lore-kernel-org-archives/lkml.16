Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70A2144C7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371589; cv=none; b=MMNo4HmNl0Q21SFf8uMzh/VeXJwMeRTLePtzE0nxsnVEP4bzE9vbjCYcFF+zPwhQbL11aPlU+kMM37foa8gQ2F6k9ceVeSQIhn/VosgnUTeJuHB5oPu8xbGTGAqbWHuLpzrc1cssV9sHVWiYpbLvaSzejHJwkfyQLViBFvo3EI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371589; c=relaxed/simple;
	bh=vtwL355P7xg/kNnf+LDHrpJKPY3z9ZBrkpJ97FcFU4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tf6Yu1ZwHYaISqj3tEABIbbM4fHpYGG069JAgk/mhGcqXaUfNBjX5sG6ZyD/QodMKcc7ug5B6+1vyMtiP6Ed736JIUmBPNzIGvDd6kt0NZqt1QuqBlFXduy+v6Ia1sik6ZUQLFCMmxGdPLFD9s97IepdTLWhF6JjWoxB9ROKTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGXAX/25; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGXAX/25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751371588; x=1782907588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtwL355P7xg/kNnf+LDHrpJKPY3z9ZBrkpJ97FcFU4s=;
  b=bGXAX/259SLiQazbtfiJp3DHmVeAzlz6mSdls2lvVpelQXlpCN7QakVh
   a3AL9sS/cW7tIxJ1dzmWs9CtIhaebhTEOoOqdYQ5+x/tUrK4EP/jo0oMK
   dHCrrA6slW6eF+Zv1Aki4S55KpGMBrLGrxSoQCUvJHM2ckGZTQuVw+7ZT
   NBVCU0N3gYb5lY0kB7Jxq5uQ9/iIlmhTiTNM9cFV0KMXq6Qbr2mIIUaCI
   TUUmGOLKyzmTveeIKsrZ9cONWwgTBSdf8GDzYK4fh87k3yi3xmFDsxAws
   DMQYgt8sTeBUlEowIjLbIaFcw7rXy3vt6PURhfvuzDNRudXrMyKqkBXnQ
   g==;
X-CSE-ConnectionGUID: r1PlMJrwRZeEDyxhdHbBEA==
X-CSE-MsgGUID: BYexG+ytSDiof876ohYd8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52864163"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52864163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:06:27 -0700
X-CSE-ConnectionGUID: hfQVdkq5TWyEg6XHgFytPQ==
X-CSE-MsgGUID: BjoM80rvQyW5/vJ1n1psAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158312161"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2025 05:06:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWZkk-000a7I-2n;
	Tue, 01 Jul 2025 12:06:22 +0000
Date: Tue, 1 Jul 2025 20:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: fs/lockd/svcsubs.c:416:1: warning: stack frame size (1032) exceeds
 limit (1024) in 'nlmsvc_mark_resources'
Message-ID: <202507011934.YZ0Qoq4s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66701750d5565c574af42bef0b789ce0203e3071
commit: 3415b10a03945b0da4a635e146750dfe5ce0f448 kbuild: Fix '-S -c' in x86 stack protector scripts
date:   11 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507011934.YZ0Qoq4s-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011934.YZ0Qoq4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011934.YZ0Qoq4s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/lockd/svcsubs.c:16:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
>> fs/lockd/svcsubs.c:416:1: warning: stack frame size (1032) exceeds limit (1024) in 'nlmsvc_mark_resources' [-Wframe-larger-than]
     416 | nlmsvc_mark_resources(struct net *net)
         | ^
   6 warnings generated.
--
   In file included from drivers/dma/dw-edma/dw-edma-pcie.c:11:
   In file included from include/linux/pci.h:1648:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/dma/dw-edma/dw-edma-pcie.c:159:12: warning: stack frame size (1032) exceeds limit (1024) in 'dw_edma_pcie_probe' [-Wframe-larger-than]
     159 | static int dw_edma_pcie_probe(struct pci_dev *pdev,
         |            ^
   6 warnings generated.
--
   In file included from drivers/video/fbdev/savage/savagefb_driver.c:49:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/video/fbdev/savage/savagefb_driver.c:1503:12: warning: stack frame size (1032) exceeds limit (1024) in 'savagefb_set_par' [-Wframe-larger-than]
    1503 | static int savagefb_set_par(struct fb_info *info)
         |            ^
   6 warnings generated.


vim +/nlmsvc_mark_resources +416 fs/lockd/svcsubs.c

f2af793db02d2c Olaf Kirch           2006-10-04  411  
^1da177e4c3f41 Linus Torvalds       2005-04-16  412  /*
^1da177e4c3f41 Linus Torvalds       2005-04-16  413   * Mark all hosts that still hold resources
^1da177e4c3f41 Linus Torvalds       2005-04-16  414   */
^1da177e4c3f41 Linus Torvalds       2005-04-16  415  void
b26411f85d3763 Stanislav Kinsbursky 2012-07-25 @416  nlmsvc_mark_resources(struct net *net)
^1da177e4c3f41 Linus Torvalds       2005-04-16  417  {
b26411f85d3763 Stanislav Kinsbursky 2012-07-25  418  	struct nlm_host hint;
b26411f85d3763 Stanislav Kinsbursky 2012-07-25  419  
e919b0765287f3 Vasily Averin        2017-11-08  420  	dprintk("lockd: %s for net %x\n", __func__, net ? net->ns.inum : 0);
b26411f85d3763 Stanislav Kinsbursky 2012-07-25  421  	hint.net = net;
b26411f85d3763 Stanislav Kinsbursky 2012-07-25  422  	nlm_traverse_files(&hint, nlmsvc_mark_host, NULL);
^1da177e4c3f41 Linus Torvalds       2005-04-16  423  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  424  

:::::: The code at line 416 was first introduced by commit
:::::: b26411f85d3763ec5fc553854d9c3c0966072090 LockD: mark host per network namespace on garbage collect

:::::: TO: Stanislav Kinsbursky <skinsbursky@parallels.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
