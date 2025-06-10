Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED419E82A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749521334; cv=none; b=Y0Jttjv88Ux2kV5IIFil2Gn/WsFzPD5ewoVbwWBLXc2dRUdM/GabEotFLBpwqHRsIMSywjjrnTm3/D6v37u2og3vh3zWSqrb14bl8j4bVseh1yzMUTY0XZq2Tndvi1BW5QXQJkKyWDmsY5a/732jBNfu9k44wop7NFkOps0y3L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749521334; c=relaxed/simple;
	bh=sIXSPJxS+G5t42r2AbvUgAZhpvhnMGaM1OyQXh9rwbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iaav9Tqv339sL/RxiMRJW1z+MCLZ5RXUYapTMSryJsN7rlWLVQn0Lxa3S0vEyPx3mdtJoQ+gRUHyZoGOjnGq7vHqAIPbFt426OviYKAMGm8U0eUAmXwFfUuvR/XDPked5kVob8vYNDoyDpyFI0R4qhXoRiNGjF0r3kPJLJQx9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5Ja7FfO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5Ja7FfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749521332; x=1781057332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sIXSPJxS+G5t42r2AbvUgAZhpvhnMGaM1OyQXh9rwbc=;
  b=b5Ja7FfOtZZ0taSzZhz/RO+bf+gssMW4O+qz1LrZTJW/tWxjY0WERJ5P
   A9uLoWgvo/oIyjKcV7tfi+wI5bryhGNw67zk9C8uf8Skzx7nm3LwsBWcd
   KtJBct3M0jYZCncpysjWhX/GMoZM1n2Md2MdCi/Q+GovL+uR75AX0WuGX
   KqLZ9AYbpd5I7Ge4Kr22DkpLE4nk9flxmCODJ2GZTWa3aI2sgSKOjofMI
   EFwK6p6kHTf3aPQRNDXiUfIcgWBBjYNTbiY1q/L+KEyBYs6wfutwhpHcq
   ksAkeDa9xCnRVuG5IQ4KFTbgxNhErv8qt6XE0Hijb3h7n/FK1+etP8M08
   w==;
X-CSE-ConnectionGUID: EcYf9DiASQmYH3WsLGF56A==
X-CSE-MsgGUID: xnFcV4JlTTqn9RZiHDnLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55279838"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="55279838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 19:08:52 -0700
X-CSE-ConnectionGUID: Gmb/15xrRN+ExR13Kec0wQ==
X-CSE-MsgGUID: xlUitEuuTEWdIOnJg1hRPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="147200204"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 19:08:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOoPu-0007d7-2y;
	Tue, 10 Jun 2025 02:08:46 +0000
Date: Tue, 10 Jun 2025 10:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 3/4] Workqueue: add WQ_PERCPU
Message-ID: <202506100903.Ow7T6q5Q-lkp@intel.com>
References: <20250609103535.780069-4-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609103535.780069-4-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[cannot apply to brauner-vfs/vfs.all wireless-next/main wireless/main linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/Workqueue-add-system_percpu_wq/20250609-183742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20250609103535.780069-4-marco.crivellari%40suse.com
patch subject: [PATCH v2 3/4] Workqueue: add WQ_PERCPU
config: s390-randconfig-002-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100903.Ow7T6q5Q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100903.Ow7T6q5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100903.Ow7T6q5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_init_module':
>> drivers/nvme/host/tcp.c:3026:26: warning: statement with no effect [-Wunused-value]
    3026 |                 wq_flags != WQ_PERCPU;
         |                 ~~~~~~~~~^~~~~~~~~~~~


vim +3026 drivers/nvme/host/tcp.c

  3008	
  3009	static int __init nvme_tcp_init_module(void)
  3010	{
  3011		unsigned int wq_flags = WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_SYSFS;
  3012		int cpu;
  3013	
  3014		BUILD_BUG_ON(sizeof(struct nvme_tcp_hdr) != 8);
  3015		BUILD_BUG_ON(sizeof(struct nvme_tcp_cmd_pdu) != 72);
  3016		BUILD_BUG_ON(sizeof(struct nvme_tcp_data_pdu) != 24);
  3017		BUILD_BUG_ON(sizeof(struct nvme_tcp_rsp_pdu) != 24);
  3018		BUILD_BUG_ON(sizeof(struct nvme_tcp_r2t_pdu) != 24);
  3019		BUILD_BUG_ON(sizeof(struct nvme_tcp_icreq_pdu) != 128);
  3020		BUILD_BUG_ON(sizeof(struct nvme_tcp_icresp_pdu) != 128);
  3021		BUILD_BUG_ON(sizeof(struct nvme_tcp_term_pdu) != 24);
  3022	
  3023		if (wq_unbound)
  3024			wq_flags |= WQ_UNBOUND;
  3025		else
> 3026			wq_flags != WQ_PERCPU;
  3027	
  3028		nvme_tcp_wq = alloc_workqueue("nvme_tcp_wq", wq_flags, 0);
  3029		if (!nvme_tcp_wq)
  3030			return -ENOMEM;
  3031	
  3032		for_each_possible_cpu(cpu)
  3033			atomic_set(&nvme_tcp_cpu_queues[cpu], 0);
  3034	
  3035		nvmf_register_transport(&nvme_tcp_transport);
  3036		return 0;
  3037	}
  3038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
