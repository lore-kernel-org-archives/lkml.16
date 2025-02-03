Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F19209681
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595565; cv=none; b=JTYFzLajL+IXAU49JhFVlBi0ygxHt/rti5MjMDO3jHx4PTVSNbyHAS4ArSWS3V40J4oSrRbwz3p1+j390UMD0es/EIDFKx+JdfjbYeeU5IZXyxDDhuDZoDuiM9Socf80VC44NeTCTBc80bNrFB3+Whcalx8Wiy72pXq0gxvDtL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595565; c=relaxed/simple;
	bh=QJ300niobqIFiI3csSxFfvfTdEuWrdu9pQBxtS8cszA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRiXttqScyvCgHjcp/fKLhxVHrlza3P5MRqKbrmXw5YUSKMrl6X5nAr4m48vGM47tKi/YYVLhcq+njkEATu7irI6DV0gjJomz4avqQmsCX7x/0xsdoDsS3z9lOck5C4A+7qW+Pr/yjin5mg5qO8ky56CNvV7m0oZVPtL5uthKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnU3ASqh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnU3ASqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738595564; x=1770131564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJ300niobqIFiI3csSxFfvfTdEuWrdu9pQBxtS8cszA=;
  b=fnU3ASqhjtnu/t8YRRF47UNEA8OdMgfMje+eFJvUYUtOJI06qvg6VRCg
   oWDoD8feI6E+KCL+mTAxHN3bNrEO92MeR5tMmKpbmUMBo6y5ew8Ml7dZl
   tUvGmTnjuDmckAu7iv4YupbVZBgaRyTUZRawQUbwL1OY/irW/SBpiopP8
   iN2ginCYyxTwM2W3kU7QOpjiSoV41f04f4omreQPqtyxkylRHD3S5G7Eh
   j0WSKYKUMcGP35rRFpRKehDaA8QMpowdkmOjMPq95aGENqjkzeoe5nkh4
   ROIH2uykHHiopePMrw044z/DGr3Sa8FFK32AcO2oNiB4HaKb4sC6ir+zK
   g==;
X-CSE-ConnectionGUID: uSoEmKVORjWBskPkmfc6cA==
X-CSE-MsgGUID: IjW3/mQyTbuktWcRQYAPJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39193095"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39193095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:12:44 -0800
X-CSE-ConnectionGUID: DATGrZqfSQmGUbZJAdgdzA==
X-CSE-MsgGUID: fiGRLCrvQpCPTD1NjIjqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110204598"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 07:12:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tey7r-000r5V-0H;
	Mon, 03 Feb 2025 15:12:39 +0000
Date: Mon, 3 Feb 2025 23:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: drivers/nvme/host/tcp.c:1578: warning: Function parameter or struct
 member 'queue' not described in 'nvme_tcp_set_queue_io_cpu'
Message-ID: <202502032315.Rlhp9d3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2014c95afecee3e76ca4a56956a936e23283f05b
commit: 32193789878c259e39b97bd0c0f2f0ccbe5cb8a8 nvme-tcp: Fix I/O queue cpu spreading for multiple controllers
date:   3 weeks ago
config: alpha-randconfig-p001-20211207 (https://download.01.org/0day-ci/archive/20250203/202502032315.Rlhp9d3Y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032315.Rlhp9d3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032315.Rlhp9d3Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/tcp.c:1578: warning: Function parameter or struct member 'queue' not described in 'nvme_tcp_set_queue_io_cpu'
>> drivers/nvme/host/tcp.c:1578: warning: expecting prototype for Track the number of queues assigned to each cpu using a global per(). Prototype was for nvme_tcp_set_queue_io_cpu() instead


vim +1578 drivers/nvme/host/tcp.c

40510a639ec08db Sagi Grimberg 2020-02-25  1567  
32193789878c259 Sagi Grimberg 2025-01-04  1568  /**
32193789878c259 Sagi Grimberg 2025-01-04  1569   * Track the number of queues assigned to each cpu using a global per-cpu
32193789878c259 Sagi Grimberg 2025-01-04  1570   * counter and select the least used cpu from the mq_map. Our goal is to spread
32193789878c259 Sagi Grimberg 2025-01-04  1571   * different controllers I/O threads across different cpu cores.
32193789878c259 Sagi Grimberg 2025-01-04  1572   *
32193789878c259 Sagi Grimberg 2025-01-04  1573   * Note that the accounting is not 100% perfect, but we don't need to be, we're
32193789878c259 Sagi Grimberg 2025-01-04  1574   * simply putting our best effort to select the best candidate cpu core that we
32193789878c259 Sagi Grimberg 2025-01-04  1575   * find at any given point.
32193789878c259 Sagi Grimberg 2025-01-04  1576   */
40510a639ec08db Sagi Grimberg 2020-02-25  1577  static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
40510a639ec08db Sagi Grimberg 2020-02-25 @1578  {
40510a639ec08db Sagi Grimberg 2020-02-25  1579  	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
32193789878c259 Sagi Grimberg 2025-01-04  1580  	struct blk_mq_tag_set *set = &ctrl->tag_set;
32193789878c259 Sagi Grimberg 2025-01-04  1581  	int qid = nvme_tcp_queue_id(queue) - 1;
32193789878c259 Sagi Grimberg 2025-01-04  1582  	unsigned int *mq_map = NULL;
32193789878c259 Sagi Grimberg 2025-01-04  1583  	int cpu, min_queues = INT_MAX, io_cpu;
32193789878c259 Sagi Grimberg 2025-01-04  1584  
32193789878c259 Sagi Grimberg 2025-01-04  1585  	if (wq_unbound)
32193789878c259 Sagi Grimberg 2025-01-04  1586  		goto out;
40510a639ec08db Sagi Grimberg 2020-02-25  1587  
40510a639ec08db Sagi Grimberg 2020-02-25  1588  	if (nvme_tcp_default_queue(queue))
32193789878c259 Sagi Grimberg 2025-01-04  1589  		mq_map = set->map[HCTX_TYPE_DEFAULT].mq_map;
40510a639ec08db Sagi Grimberg 2020-02-25  1590  	else if (nvme_tcp_read_queue(queue))
32193789878c259 Sagi Grimberg 2025-01-04  1591  		mq_map = set->map[HCTX_TYPE_READ].mq_map;
40510a639ec08db Sagi Grimberg 2020-02-25  1592  	else if (nvme_tcp_poll_queue(queue))
32193789878c259 Sagi Grimberg 2025-01-04  1593  		mq_map = set->map[HCTX_TYPE_POLL].mq_map;
32193789878c259 Sagi Grimberg 2025-01-04  1594  
32193789878c259 Sagi Grimberg 2025-01-04  1595  	if (WARN_ON(!mq_map))
32193789878c259 Sagi Grimberg 2025-01-04  1596  		goto out;
32193789878c259 Sagi Grimberg 2025-01-04  1597  
32193789878c259 Sagi Grimberg 2025-01-04  1598  	/* Search for the least used cpu from the mq_map */
32193789878c259 Sagi Grimberg 2025-01-04  1599  	io_cpu = WORK_CPU_UNBOUND;
32193789878c259 Sagi Grimberg 2025-01-04  1600  	for_each_online_cpu(cpu) {
32193789878c259 Sagi Grimberg 2025-01-04  1601  		int num_queues = atomic_read(&nvme_tcp_cpu_queues[cpu]);
32193789878c259 Sagi Grimberg 2025-01-04  1602  
32193789878c259 Sagi Grimberg 2025-01-04  1603  		if (mq_map[cpu] != qid)
32193789878c259 Sagi Grimberg 2025-01-04  1604  			continue;
32193789878c259 Sagi Grimberg 2025-01-04  1605  		if (num_queues < min_queues) {
32193789878c259 Sagi Grimberg 2025-01-04  1606  			io_cpu = cpu;
32193789878c259 Sagi Grimberg 2025-01-04  1607  			min_queues = num_queues;
32193789878c259 Sagi Grimberg 2025-01-04  1608  		}
32193789878c259 Sagi Grimberg 2025-01-04  1609  	}
32193789878c259 Sagi Grimberg 2025-01-04  1610  	if (io_cpu != WORK_CPU_UNBOUND) {
32193789878c259 Sagi Grimberg 2025-01-04  1611  		queue->io_cpu = io_cpu;
32193789878c259 Sagi Grimberg 2025-01-04  1612  		atomic_inc(&nvme_tcp_cpu_queues[io_cpu]);
32193789878c259 Sagi Grimberg 2025-01-04  1613  		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
32193789878c259 Sagi Grimberg 2025-01-04  1614  	}
32193789878c259 Sagi Grimberg 2025-01-04  1615  out:
32193789878c259 Sagi Grimberg 2025-01-04  1616  	dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
32193789878c259 Sagi Grimberg 2025-01-04  1617  		qid, queue->io_cpu);
40510a639ec08db Sagi Grimberg 2020-02-25  1618  }
40510a639ec08db Sagi Grimberg 2020-02-25  1619  

:::::: The code at line 1578 was first introduced by commit
:::::: 40510a639ec08db81d5ff9c79856baf9dda94748 nvme-tcp: optimize queue io_cpu assignment for multiple queue maps

:::::: TO: Sagi Grimberg <sagi@grimberg.me>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
