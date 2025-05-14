Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C259627A461
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235806; cv=none; b=sKl26oc/FlQt9zzaeMlfkPPj0yELfnFKfUfRJ/6TsnGXrosc+Hxc22JB/y13jvS9KVYvyJKuRedHTesdk4asF7BVobuTvM1oe3Owu6wc7n4/Zbef9BzeLDym8NsE3fS/fTcc/PIFwMeuuBytGpVLZFa1YIhmsdvcw1UkIpGiCXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235806; c=relaxed/simple;
	bh=8t7F8fjhX9P9O1zf8LuAGY6RL64qMdj+esAWincujQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj6lQE4hgXWn82HvQq+qD2sXf3cJLKB9sRizyJXgFP5VQ7rJrfNLmi5ot1pHz38SJgIRhzrQOPjMqAca68mD6hMT5D6auXzmhU3i5HXHYh0BLHnpuDQq7lTuGpdZFm81PwiMAzwShAsMpj9giKNBWewlFDVN2e0Is5xanl563l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkeggDZg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkeggDZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235805; x=1778771805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8t7F8fjhX9P9O1zf8LuAGY6RL64qMdj+esAWincujQE=;
  b=lkeggDZgCIW1AjaUCHBdVffzt+UCfd3aj4b6jcT5r0ZFCHIdatceHykg
   bLxKwyIEYMRXGLYJI7pMofDqQ7/NKMG39vE53tNIf8nLo29R/roUwBFus
   +86Y+cK706JP0J+OAQlMg2VBWChqawKMcj5t3ANzdLODf6GeGO+EMJFTv
   jpYN3UfAchoI454TTVbmIywNA+93XgUw2lKItzs/Oxka7B/ZB1Dzdahk/
   fPZyCkqnBqXZnFjCnC5SbU20/jqe9H6EpGd/Ss/0bYs9qc39xN6QFKnZZ
   AjYS+/1nRQLQ0LZLpLG6ZCZpZsLF7t/0RMIdvkXM+y23qgkyYGNotANar
   w==;
X-CSE-ConnectionGUID: qs7ufZiCTG+D7Wf7W0jdxQ==
X-CSE-MsgGUID: KdUNk9XwSoCcdoYCJGDaqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49026424"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49026424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:16:42 -0700
X-CSE-ConnectionGUID: 2pjeeaoGTE2Sk9W6KnlT+w==
X-CSE-MsgGUID: yetxzgE4Rg+0uWQljNVPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="139068130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2025 08:16:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFDqW-000HGF-2d;
	Wed, 14 May 2025 15:16:36 +0000
Date: Wed, 14 May 2025 23:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 1/2] genirq: Add kunit tests for depth counts
Message-ID: <202505142357.R7Xa1KFW-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Add-kunit-tests-for-depth-counts/20250514-065050
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250513224402.864767-2-briannorris%40chromium.org
patch subject: [PATCH 1/2] genirq: Add kunit tests for depth counts
config: arm64-randconfig-001-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142357.R7Xa1KFW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142357.R7Xa1KFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142357.R7Xa1KFW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/irq_test.c:14:36: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      14 | static irqreturn_t noop_handler(int, void *)
         |                                    ^
   kernel/irq/irq_test.c:14:44: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
      14 | static irqreturn_t noop_handler(int, void *)
         |                                            ^
   2 warnings generated.


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
