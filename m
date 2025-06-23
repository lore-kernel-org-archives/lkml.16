Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B1B676
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717719; cv=none; b=haqAgeO2QA9CGODdJkRSuf9K412AcIsR0rLJkUSNtwNrDFyvlhCpzHT2qMPyEajFtG8al1SY5u9DPZfOCuAIcnGvOmpmt11jNZnrowWfL0eGVhpU5Lt8AhO6HCDCrKp4gF1zwpjxW3UB2z0UZTMvX+Q5h2YByyL7soGDa69cbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717719; c=relaxed/simple;
	bh=IDscL//YK13cEbpe8hOp7s0v96Vb0LFr4CLJ3x2bcg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrGUfw4wCZKIMw11rvvfoig7iSJCR7/m1FkM1yGZ//dKs6LhCQp0JTnQiVWiz3OJuud4/6uIiq82vqjQHGfN7w914V2U0Sk8FMVACTza8pn8eIOVPajc88Vejio0Je4N7Zvs1HzuLm65x6jqnn7S4ETDlII5zIOomOk5WJV9itQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xan4Czh0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xan4Czh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750717718; x=1782253718;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IDscL//YK13cEbpe8hOp7s0v96Vb0LFr4CLJ3x2bcg4=;
  b=Xan4Czh0p41tQvMvTFRg5gGQA0m9Ec732EzeLxmhN/d41ve9rf7FAizp
   XbdD30z98c7y2PeQPp7+RkN/nTM2qk4OGoZzP1qq6ghsZ7TyVRFlfUou7
   LWpZpgwLUKdbsG+0IGzl3Dw/BIEOgWeZLH98CoITzUOVOdW3wF0kKakYX
   Zb1cwZTVEnMo4fikNy8fhbk/BbyUXRM/5ozTvQRGlcDzOrbkemTU2J9ST
   kyJrmIatDq9n77WO0NNsqX7/NFrGInaVJ4br6D2/G2UhPTqf00SSshTFw
   kNQJR6Y4Ov/z+BN8Zr62EQFuFiB3v/M5PmRujt5Vk8GWDe6NzzUAJiXa4
   w==;
X-CSE-ConnectionGUID: H4a1hz9FTGm7cjAMp1JE3A==
X-CSE-MsgGUID: 177CwrX/TTSUdrw4KdrhtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52057562"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52057562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:28:36 -0700
X-CSE-ConnectionGUID: yL4ap/FOQ6ukJUZThptdJA==
X-CSE-MsgGUID: Th11nDHDRuS5IbAWar/8qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="182763922"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 15:28:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTpeS-000RKl-0Y;
	Mon, 23 Jun 2025 22:28:32 +0000
Date: Tue, 24 Jun 2025 06:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/virtio/virtio_balloon.c:401:21: warning: stack frame size
 (1040) exceeds limit (1024) in 'update_balloon_stats'
Message-ID: <202506240611.WIZwT0sn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: ad6b26b6a0a79166b53209df2ca1cf8636296382 sched/numa: add statistics of numa balance task
date:   3 weeks ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250624/202506240611.WIZwT0sn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240611.WIZwT0sn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240611.WIZwT0sn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_balloon.c:401:21: warning: stack frame size (1040) exceeds limit (1024) in 'update_balloon_stats' [-Wframe-larger-than]
     401 | static unsigned int update_balloon_stats(struct virtio_balloon *vb)
         |                     ^
   1 warning generated.


vim +/update_balloon_stats +401 drivers/virtio/virtio_balloon.c

fdba68d2adf8d9 zhenwei pi         2024-04-23  400  
fdba68d2adf8d9 zhenwei pi         2024-04-23 @401  static unsigned int update_balloon_stats(struct virtio_balloon *vb)
fdba68d2adf8d9 zhenwei pi         2024-04-23  402  {
fdba68d2adf8d9 zhenwei pi         2024-04-23  403  	struct sysinfo i;
fdba68d2adf8d9 zhenwei pi         2024-04-23  404  	unsigned int idx;
fdba68d2adf8d9 zhenwei pi         2024-04-23  405  	long available;
fdba68d2adf8d9 zhenwei pi         2024-04-23  406  	unsigned long caches;
fdba68d2adf8d9 zhenwei pi         2024-04-23  407  
fdba68d2adf8d9 zhenwei pi         2024-04-23  408  	idx = update_balloon_vm_stats(vb);
fdba68d2adf8d9 zhenwei pi         2024-04-23  409  
fdba68d2adf8d9 zhenwei pi         2024-04-23  410  	si_meminfo(&i);
fdba68d2adf8d9 zhenwei pi         2024-04-23  411  	available = si_mem_available();
fdba68d2adf8d9 zhenwei pi         2024-04-23  412  	caches = global_node_page_state(NR_FILE_PAGES);
9564e138b1f6eb Adam Litke         2009-11-30  413  	update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMFREE,
9564e138b1f6eb Adam Litke         2009-11-30  414  				pages_to_bytes(i.freeram));
9564e138b1f6eb Adam Litke         2009-11-30  415  	update_stat(vb, idx++, VIRTIO_BALLOON_S_MEMTOT,
9564e138b1f6eb Adam Litke         2009-11-30  416  				pages_to_bytes(i.totalram));
5057dcd0f1aaad Igor Redko         2016-03-17  417  	update_stat(vb, idx++, VIRTIO_BALLOON_S_AVAIL,
5057dcd0f1aaad Igor Redko         2016-03-17  418  				pages_to_bytes(available));
4d32029b8ddb7b Tomáš Golembiovský 2017-11-12  419  	update_stat(vb, idx++, VIRTIO_BALLOON_S_CACHES,
4d32029b8ddb7b Tomáš Golembiovský 2017-11-12  420  				pages_to_bytes(caches));
9646b26e85896e Ladi Prosek        2017-03-28  421  
9646b26e85896e Ladi Prosek        2017-03-28  422  	return idx;
9564e138b1f6eb Adam Litke         2009-11-30  423  }
9564e138b1f6eb Adam Litke         2009-11-30  424  

:::::: The code at line 401 was first introduced by commit
:::::: fdba68d2adf8d9ae680e23e8b8ba79330baa45bc virtio_balloon: separate vm events into a function

:::::: TO: zhenwei pi <pizhenwei@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
