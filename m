Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4B72623
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317710; cv=none; b=E1BWDZGu2K0oUEC0UMVedpfm8VceuH6OEODLf0A6GNAn1SjSnvzJrvcDb2CMILm0rTd4BhtKp3Hy0E4bfUgekADCkSbvSM2QJU/oK92fe+e2nycUlqnXN0Op2Mrm76qCbLO56tEk2alb0UTCin78A7zKeNKJoiIdugQHf+0n5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317710; c=relaxed/simple;
	bh=fk1uLT1wPCcG2cvtZ2es4p0iml5DX/aZLkk2OIxKWHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBKvRjlfjNC/15EShTZOLCF6FfFNmpafzz5jhT0alFDp5ZZ7oUQka4g5aKMh1mOvf4ENJpFqniDaFpKvTSYHvJ6e439jsTQ42yY08be73GGqgLoKvUhaZBzmdxAvvTVJfRBjY3IQIimiOxizPNBLmiLJ7JEEIC/Ia6ZK/l1FTEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3W0FrpM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3W0FrpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317708; x=1778853708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fk1uLT1wPCcG2cvtZ2es4p0iml5DX/aZLkk2OIxKWHo=;
  b=O3W0FrpM30gHpqhaNH6S+HU78K1ftKZpjoMaymzysQIAH1W28o1SuUjQ
   KrtcErCc6QzH3YKVhLOXAEjq53rAxpNeY4R5fGc4pUc8T9qxCvYkVgXPS
   ITy7voU04uRpHQzF/2ECnL26A5IDGn59nh3VlE2wUiSTJ4cJY5Hyel2Xv
   nL+gIyJtDoe22nI8SPbeIHLxFXj1ZSKCfVF1V9gAQcJVlBmJtQum3Hyd5
   9JB926uhkEk8l+J8yhJXRVgOQbFy2N5N0MT1OgcEqB7AAZzazozp+o6tf
   93m1TjyQhPEVXJ7EXM3dFSAtlJHqe+DsumtlaSaFESO+dUdh/wjDXOokQ
   g==;
X-CSE-ConnectionGUID: WvczMccgQDCAnox0gZoDAg==
X-CSE-MsgGUID: IkhpltI3SqezXF/jt/LO5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59908718"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="59908718"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:01:47 -0700
X-CSE-ConnectionGUID: E9Y0py5IQ5a4i+aVeoGyBA==
X-CSE-MsgGUID: motb8SYRTjK27Julcgo1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143267467"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 07:01:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZ9b-000IRH-2K;
	Thu, 15 May 2025 14:01:43 +0000
Date: Thu, 15 May 2025 22:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
Message-ID: <202505152136.y04AHovS-lkp@intel.com>
References: <20250514201353.3481400-3-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514201353.3481400-3-briannorris@chromium.org>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Retain-depth-for-managed-IRQs-across-CPU-hotplug/20250515-041533
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250514201353.3481400-3-briannorris%40chromium.org
patch subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
config: i386-buildonly-randconfig-004-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
ERROR: modpost: "irq_domain_alloc_descs" [kernel/irq/irq_test.ko] undefined!
ERROR: modpost: "irq_to_desc" [kernel/irq/irq_test.ko] undefined!
ERROR: modpost: "irq_shutdown_and_deactivate" [kernel/irq/irq_test.ko] undefined!
>> ERROR: modpost: "irq_activate" [kernel/irq/irq_test.ko] undefined!
>> ERROR: modpost: "irq_startup_managed" [kernel/irq/irq_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
