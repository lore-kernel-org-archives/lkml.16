Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752719D880
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236465; cv=none; b=WQrWtk2aIxyOCZw6O9mylP/PiT8WateW0SWMKIaMoHa6aUfb2Vpgto8+piCLV08qanNrK39gROELl9p1PhlJpx6qYGh4msXEhOFFkbs6+p4cENuLSL+KSmP5VeyDQshfWqNNDfRjtG45iqipyzhv8KTjwJpS9ZgKQ06zvfOQT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236465; c=relaxed/simple;
	bh=Tx87UH5/X5KEdw4O/rDGFH4djE3sFSAJH3bGJ07BA6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOE6PCSQClyNs/ZEAsSTDs8D7lpD1grsul7kDu/DBsa8kcTkdxIVMQ/3ZFcB90Om++uMOPjLADMTaGFPQxq9oO72HGPBtWzqi8oMxRY1B9bWLRNDSNb/t5QUjdEShVJdh3/5U0og+wmKfk5Hat/nRPSVwC0LWCNf96757l2kt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhVBeW1v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhVBeW1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747236464; x=1778772464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tx87UH5/X5KEdw4O/rDGFH4djE3sFSAJH3bGJ07BA6E=;
  b=nhVBeW1vZA8Vo6w320Rh+u058tQC/LeLM8BJPUty7AX/VsqrrHmbOv6/
   kPUoWduHJQI1Zvip68454NenG9wUMOPMN3EXAdlfcxy2rPMXedVGZ8rFI
   mDdhOQOgcSiCLJjFPP0Bi1Ija2SDKfs5GRwAECAyfPA9CiRhiMRz0W13e
   o227Slmb1hrvIVHdgIQoNgejl/dO28+jS6RhzXM1UPYpQQK8H2GbcdaFm
   ssNPpeakE7C/hMzFyEujucHFhHvXseE1nRrPeBNxURs5YzP/rwe7oR6Vg
   E71NoW6zUa3FGvLbtJY0pFMaWrwi3IewZJjlFdGVdLAxV4XhNObAzD1d5
   Q==;
X-CSE-ConnectionGUID: 2MJMmRFjSzqawYG5iWojJg==
X-CSE-MsgGUID: blHs2saRSA22+8QpCSnhwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49011857"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49011857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:27:43 -0700
X-CSE-ConnectionGUID: IQTYckveRESfx5mZ1KepsQ==
X-CSE-MsgGUID: Gn256g4pSIaheNqXyn1KLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138597878"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 08:27:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFE1C-000HH9-0Z;
	Wed, 14 May 2025 15:27:38 +0000
Date: Wed, 14 May 2025 23:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] genirq: Add kunit tests for depth counts
Message-ID: <202505142327.mfHUg14q-lkp@intel.com>
References: <20250513224402.864767-2-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513224402.864767-2-briannorris@chromium.org>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Add-kunit-tests-for-depth-counts/20250514-065050
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250513224402.864767-2-briannorris%40chromium.org
patch subject: [PATCH 1/2] genirq: Add kunit tests for depth counts
config: arm-randconfig-003-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142327.mfHUg14q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142327.mfHUg14q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142327.mfHUg14q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm/lib/clearbit.S: Assembler messages:
>> arch/arm/lib/clearbit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/clearbit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
   arch/arm/lib/changebit.S: Assembler messages:
>> arch/arm/lib/changebit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/changebit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
   arch/arm/lib/testclearbit.S: Assembler messages:
>> arch/arm/lib/testclearbit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/testclearbit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
   arch/arm/lib/testclearbit.S:15: Error: architectural extension `mp' is not allowed for the current base architecture
   arch/arm/lib/testclearbit.S:15: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
   arch/arm/lib/testsetbit.S: Assembler messages:
>> arch/arm/lib/testsetbit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/testsetbit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
   arch/arm/lib/testsetbit.S:15: Error: architectural extension `mp' is not allowed for the current base architecture
   arch/arm/lib/testsetbit.S:15: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
   arch/arm/lib/testchangebit.S: Assembler messages:
>> arch/arm/lib/testchangebit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/testchangebit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
   arch/arm/lib/testchangebit.S:15: Error: architectural extension `mp' is not allowed for the current base architecture
   arch/arm/lib/testchangebit.S:15: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
   arch/arm/lib/setbit.S: Assembler messages:
>> arch/arm/lib/setbit.S:12: Error: architectural extension `mp' is not allowed for the current base architecture
>> arch/arm/lib/setbit.S:12: Error: selected processor does not support `pldw.w [r1]' in Thumb mode
--
>> arch/arm/kernel/smp.c:98:22: warning: 'get_arch_pgd' defined but not used [-Wunused-function]
    static unsigned long get_arch_pgd(pgd_t *pgd)
                         ^~~~~~~~~~~~
   /tmp/ccR1vg73.s: Assembler messages:
>> /tmp/ccR1vg73.s:470: Error: architectural extension `mp' is not allowed for the current base architecture
>> /tmp/ccR1vg73.s:471: Error: selected processor does not support `pldw [r1]' in Thumb mode
--
   arch/arm/kernel/head-nommu.S: Assembler messages:
>> arch/arm/kernel/head-nommu.S:488: Error: ARM register expected -- `str r0,[,#0x98]'
   arch/arm/kernel/head-nommu.S:495: Error: ARM register expected -- `str r0,[,#0x9c]'
>> arch/arm/kernel/head-nommu.S:495: Error: ARM register expected -- `str r5,[,#0xa0]'
   arch/arm/kernel/head-nommu.S:497: Error: ARM register expected -- `str r0,[,#0x9c]'
   arch/arm/kernel/head-nommu.S:497: Error: ARM register expected -- `str r5,[,#0xa0]'
--
   /tmp/ccPRjQyq.s: Assembler messages:
   /tmp/ccPRjQyq.s:388: Error: architectural extension `mp' is not allowed for the current base architecture
>> /tmp/ccPRjQyq.s:389: Error: selected processor does not support `pldw [r4]' in Thumb mode
   /tmp/ccPRjQyq.s:549: Error: architectural extension `mp' is not allowed for the current base architecture
   /tmp/ccPRjQyq.s:550: Error: selected processor does not support `pldw [r4]' in Thumb mode
--
   /tmp/cc0opIaH.s: Assembler messages:
   /tmp/cc0opIaH.s:1308: Error: architectural extension `mp' is not allowed for the current base architecture
>> /tmp/cc0opIaH.s:1309: Error: selected processor does not support `pldw [r3]' in Thumb mode
   /tmp/cc0opIaH.s:2474: Error: architectural extension `mp' is not allowed for the current base architecture
   /tmp/cc0opIaH.s:2475: Error: selected processor does not support `pldw [r3]' in Thumb mode
   /tmp/cc0opIaH.s:2671: Error: architectural extension `mp' is not allowed for the current base architecture
   /tmp/cc0opIaH.s:2672: Error: selected processor does not support `pldw [r3]' in Thumb mode
--
   /tmp/ccEJFH9Z.s: Assembler messages:
   /tmp/ccEJFH9Z.s:206: Error: architectural extension `mp' is not allowed for the current base architecture
>> /tmp/ccEJFH9Z.s:207: Error: selected processor does not support `pldw [r5]' in Thumb mode
   /tmp/ccEJFH9Z.s:233: Error: architectural extension `mp' is not allowed for the current base architecture
   /tmp/ccEJFH9Z.s:234: Error: selected processor does not support `pldw [r5]' in Thumb mode
   /tmp/ccEJFH9Z.s:540: Error: architectural extension `mp' is not allowed for the current base architecture
>> /tmp/ccEJFH9Z.s:541: Error: selected processor does not support `pldw [r8]' in Thumb mode
   /tmp/ccEJFH9Z.s:568: Error: architectural extension `mp' is not allowed for the current base architecture
   /tmp/ccEJFH9Z.s:569: Error: selected processor does not support `pldw [r8]' in Thumb mode
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SMP
   Depends on [n]: (CPU_V6K [=n] || CPU_V7 [=n]) && HAVE_SMP [=n] && (MMU [=n] || ARM_MPU [=y])
   Selected by [y]:
   - IRQ_KUNIT_TEST [=y] && KUNIT [=y]


vim +14 kernel/irq/irq_test.c

    13	
  > 14	static irqreturn_t noop_handler(int, void *)
    15	{
    16		return IRQ_HANDLED;
    17	}
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
