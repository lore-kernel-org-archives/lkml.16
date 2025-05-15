Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB2286D73
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276666; cv=none; b=itouSlLhP0JZCIoagzaWWmGneuJBhZqtUW4BV4OHpQwpQbNfYfwBN55HRuqc30bOJXW47p+IexjVWoxX9ozoaimgY60MWdS/rEF/KVabyLgni58qhFWnI9Qh61enKYjDMIDlbYjGyTt81DyPCyfR+hCn1WjEbOOm0fDSwMH8P8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276666; c=relaxed/simple;
	bh=mOUp8j/eOBdqeYoi+sZWQOgIAuqKsc4r4lk5+T6TLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYVgnASqyRoCnEnRhjJA+MMA6MxjLDiPFMm+YxNQMoWf3ibfspiaDZfdW3hMfEMARgQ5KGtXdbeK6LDLerBnjWcOEnvUidJYpjZZWV4xLdVLdTVxa4dtpK47ML3Kt00eSnN3nj03vL/zXCfptsKyJcqEQ5IuVhoXUVrMPm+/gNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRlWnSSn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRlWnSSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747276665; x=1778812665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOUp8j/eOBdqeYoi+sZWQOgIAuqKsc4r4lk5+T6TLEA=;
  b=YRlWnSSnmwREdM6nmhwMwMrLIjiayxFgGjMjkDqafDQQ3Uf9j12fTkt2
   h+VaefXa6WsY+nnE14aKmjeA3JbJjKWNgSQgmqa9hbn+wZ+GP0KsGk+0p
   moWoFz87HlIqM2AWrQRz8H80iahxydsW1RfSaJaeq5emzPpU9BOBu/wfl
   2VEMvEb/x81xLZkk0UyLCtgwQLAeNv4oeWw2dhx90IY73KWo1uk09Zn7/
   Ndbc/iGxo0fF9RH6KwsA3J8TOCUMpAW4Ot+UkrpS0F9rNWy/TNNQ3AfY+
   WpcGYF9oVAbIlSkFUTGXPjXW5BgW8tu6BmUGOqAHO+5uT/IdUPVs/AcGU
   A==;
X-CSE-ConnectionGUID: x1h7hR/4TaKXKOGhR/vrSg==
X-CSE-MsgGUID: 6WeApQaDSA+ewWrrae3/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="53008948"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="53008948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:37:44 -0700
X-CSE-ConnectionGUID: gJwWGR4TSPWQQQ2bUEabYw==
X-CSE-MsgGUID: YoLMjR2dRhO7TfqTCLrBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="139225193"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2025 19:37:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFOTc-000HnT-2E;
	Thu, 15 May 2025 02:37:40 +0000
Date: Thu, 15 May 2025 10:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:irq/core 55/56] kernel/irq/debugfs.c:233:26: warning: 'sprintf'
 may write a terminating nul past the end of the destination
Message-ID: <202505151057.xbyXAbEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   58eb5721a445ea0af310d1410d7117a1910627bc
commit: 47af06c9d31fe558493de4e04f9a07847dc4992f [55/56] genirq: Consistently use '%u' format specifier for unsigned int variables
config: x86_64-randconfig-123-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151057.xbyXAbEn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151057.xbyXAbEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151057.xbyXAbEn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/debugfs.c: In function 'irq_debugfs_init':
>> kernel/irq/debugfs.c:233:26: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     233 |         sprintf(name, "%u", irq);
         |                          ^
   In function 'irq_add_debugfs_entry',
       inlined from 'irq_add_debugfs_entry' at kernel/irq/debugfs.c:226:6,
       inlined from 'irq_debugfs_init' at kernel/irq/debugfs.c:251:3:
   kernel/irq/debugfs.c:233:9: note: 'sprintf' output between 2 and 11 bytes into a destination of size 10
     233 |         sprintf(name, "%u", irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +233 kernel/irq/debugfs.c

   225	
   226	void irq_add_debugfs_entry(unsigned int irq, struct irq_desc *desc)
   227	{
   228		char name [10];
   229	
   230		if (!irq_dir || !desc || desc->debugfs_file)
   231			return;
   232	
 > 233		sprintf(name, "%u", irq);
   234		desc->debugfs_file = debugfs_create_file(name, 0644, irq_dir, desc,
   235							 &dfs_irq_ops);
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
