Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2215852F88;
	Sat, 26 Apr 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745665681; cv=none; b=WHMNZ+z71RTFfgSSyauyghuoD4euiGY82vJYWlK+6c8Tmx5SsU/ACdaOXwclkKO76kKYDO22W43svyGl1m8r3COvPZa1MOhZ2GYr40J+qf3SIWzR4KL1ZmbqfzPFwAXtGvdxfmbyklp0Yvy4K8/E25mt2afVQntjaPTPOY7/yAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745665681; c=relaxed/simple;
	bh=GyW16Txf4WFU4MSIoY4oJy27x/Bf7MkTk/oUJden00Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hirOlvP5QtpoN5Vzby4W+m/P80d+yXNe6DseY+932+0Pcp4GZhvGGQT75R7AanlE1qseMeqTclTIgWGtoA+lEcEQZdbSFe4VrV3pTpdL+k1eoJZ2sMoruWzMPGaRJcd2PX0YXWzTWmpqUODyDAPa4BFlzfsKyMeaPCMNCkSGG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kD0mTgdD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kD0mTgdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745665679; x=1777201679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GyW16Txf4WFU4MSIoY4oJy27x/Bf7MkTk/oUJden00Q=;
  b=kD0mTgdDm7neH7YWN8l39yCSfcxF9Vld0pCQwhyZYbnrlbIg+RP3zFAz
   qYNrWzrFEnQZnUFEiBbj6Kd/EE34mt0AD0B2KBtZLnaGcIJt2+Vfs+/SD
   PcL8U4jn4jDJXVLR+5hSe6vyXJXIYzJMAS0GHTfVpl9XboAXb6stcajdt
   qfqoUpe8imTBm37sOh3nayREMBjyqvTuWvXaOomXGF+pZCLz1dQnQMLOj
   tuhORgqem07BPnuzvq5euwEEJRbCAuwtv6QAgQT8k2bSM8DEY09hJLovl
   SV6ePwcJa4ppgCmQHSon36AcBs9PuLUdGxfwSIgbXF80JP9FPpHv1GMpQ
   Q==;
X-CSE-ConnectionGUID: dcZTP+N2SOeMbukOpQDBIw==
X-CSE-MsgGUID: jH4dUVvxQq6ooNLhueZdMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="50986548"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="50986548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 04:07:58 -0700
X-CSE-ConnectionGUID: qdAgFR39Q7aT5Mw6hPTtXg==
X-CSE-MsgGUID: Vo/VSuUrRLy/QEgbsNTuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="132995474"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Apr 2025 04:07:56 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8dNx-0005oB-28;
	Sat, 26 Apr 2025 11:07:53 +0000
Date: Sat, 26 Apr 2025 19:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-doc@vger.kernel.org
Subject: io_uring/io-wq.c:80: warning: This comment starts with '/**', but
 isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504261846.jvwwfMUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 751eedc4b4b79332ecf1a78c0dbeb47d573a8f59 io_uring/io-wq: move worker lists to struct io_wq_acct
date:   10 weeks ago
config: s390-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261846.jvwwfMUN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261846.jvwwfMUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261846.jvwwfMUN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io-wq.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Protects access to the worker lists.
   io_uring/io-wq.c:89: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * The list of free workers.  Protected by #workers_lock
   io_uring/io-wq.c:95: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * The list of all workers.  Protected by #workers_lock


vim +80 io_uring/io-wq.c

    77	
    78	struct io_wq_acct {
    79		/**
  > 80		 * Protects access to the worker lists.
    81		 */
    82		raw_spinlock_t workers_lock;
    83	
    84		unsigned nr_workers;
    85		unsigned max_workers;
    86		atomic_t nr_running;
    87	
    88		/**
    89		 * The list of free workers.  Protected by #workers_lock
    90		 * (write) and RCU (read).
    91		 */
    92		struct hlist_nulls_head free_list;
    93	
    94		/**
    95		 * The list of all workers.  Protected by #workers_lock
    96		 * (write) and RCU (read).
    97		 */
    98		struct list_head all_list;
    99	
   100		raw_spinlock_t lock;
   101		struct io_wq_work_list work_list;
   102		unsigned long flags;
   103	};
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
