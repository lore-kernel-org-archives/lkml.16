Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804BD42A82
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221739; cv=none; b=H/M2ByOxCXorkX65rE4XShy49Xj4+/aR3gdEgZdHguIORSZLQYR91xXFPBUeRCvNbmWkSwTTQD7HcTk05kkjzYSHdOix8BwpW+tdQMazDW6pXuICEPAdhECcLFfiKhtmrPIBdXpArIabjML5Nxrv0m6oZe7Tv5zhRc2erluXJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221739; c=relaxed/simple;
	bh=qlpe0IPY3wjMnFpNMfeNQoIKUnTfc2+JqURSGvw8sB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnR9QnydQWGt8Y8DMmJE5wUHisRyNPmqRKRWaep3J5wsFwnQKNKnV2N1i7nz99X2ghHOWpjfhIjV6J4zessQzXiFU35aQUU4E46YH/j5pPf6VicRzwmrmooQRWJgyrohsRuiN3Ubhr9jgWYBQOt6htisz7bckipGaA1sQXW623o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwa7Tim/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwa7Tim/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747221737; x=1778757737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qlpe0IPY3wjMnFpNMfeNQoIKUnTfc2+JqURSGvw8sB8=;
  b=Zwa7Tim/OPtK45i6qXpG/ZhjlmQdL/FiOq/Pn2LQ0OzcmOBb531sMGBB
   2t8ccsJ7Vwn1jYl+ANf9STVfK4G7wb4ds3bFOp0/x2H71ivo0x3z5nqkz
   xnOpIt34iyNWC4dJQcyc1nQIi1LVEyuqFU9pbQ/Ob78hKvCM5+SvS/H7L
   wtSAFcQfvqZznH0K/W0NM6KMhJ5llUtf3xcG9iS56G3DC7wBX+svxKVay
   CvI2U/asLyy+vySo6asJj4xAa1dxCprApLBRV0+MaXO09JDPCTc8b2XJ4
   /vF5A0U4A7LEUlI91AM2gu0p92TCkFRPm5G0S/fbn9WvkhuWvbZn01sQ2
   A==;
X-CSE-ConnectionGUID: jt3YKhTGRDuoM4n87f21SQ==
X-CSE-MsgGUID: UnFYrQdwRo2n5u7CA58oAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49184119"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49184119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 04:22:16 -0700
X-CSE-ConnectionGUID: IgVtfQjpSEq8gnmnVC4Lyg==
X-CSE-MsgGUID: rWjPjQkdToqPu6HkCz6Rzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="169105793"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 04:22:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFABf-000H2R-2e;
	Wed, 14 May 2025 11:22:11 +0000
Date: Wed, 14 May 2025 19:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: Re: [PATCH V4 3/6] Sched: Tunable to specify duration of time slice
 extension
Message-ID: <202505142126.0irJYJgE-lkp@intel.com>
References: <20250513214554.4160454-4-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513214554.4160454-4-prakash.sangappa@oracle.com>

Hi Prakash,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v6.15-rc6]
[cannot apply to tip/core/entry next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/Sched-Scheduler-time-slice-extension/20250514-054844
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250513214554.4160454-4-prakash.sangappa%40oracle.com
patch subject: [PATCH V4 3/6] Sched: Tunable to specify duration of time slice extension
config: arm-randconfig-003-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142126.0irJYJgE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142126.0irJYJgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142126.0irJYJgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:4682:12: warning: 'sysctl_sched_preempt_delay' defined but not used [-Wunused-function]
    static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sysctl_sched_preempt_delay +4682 kernel/sched/core.c

  4681	
> 4682	static int sysctl_sched_preempt_delay(const struct ctl_table *table, int write,
  4683			void *buffer, size_t *lenp, loff_t *ppos)
  4684	{
  4685		int err;
  4686	
  4687		err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  4688		if (err < 0)
  4689			return err;
  4690		if (sysctl_sched_preempt_delay_us > SCHED_PREEMPT_DELAY_DEFAULT_US)
  4691			pr_warn("Sched preemption delay time set higher then default value %d us\n",
  4692				SCHED_PREEMPT_DELAY_DEFAULT_US);
  4693		return err;
  4694	}
  4695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
