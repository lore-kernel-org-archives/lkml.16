Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEF2BEFE1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092582; cv=none; b=qFG9to2G8RpFzjacHBNu2zHKyLeb4P2i/ZFSitz5eMuCQX0oWGHMDOQ+GinZo7eEW5PjDQi68Uql5+jMTmy9qAa17IlTE+6Glc7zmhIrTFK1DWqmkJcKlZrGjtB52xEx/24UpFoFuWKz+742V+WyFpipSNyuVzAXdCueGT4bihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092582; c=relaxed/simple;
	bh=Re7MybfrCn2NryESzYDIQfzsdBo71QopT31SeH8/1PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj2V1AOP/42RMpIe0kqJmxJZxn91LSqjCY1YBV4Aw4MROU8cO1F9NQvZfFSfraAiD4wevTb+sXwMb5NyCW6KWw/bXzP/4GMsLBMyNXdEJfyI4/SQ+QluJX2t1xtCO3xUgY4qM1OYAt2RKt5kgJZMPLxhITE5dLaaxzsjHmaJ478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C58Pi8Y3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C58Pi8Y3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750092580; x=1781628580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re7MybfrCn2NryESzYDIQfzsdBo71QopT31SeH8/1PI=;
  b=C58Pi8Y3GgUSbUpdUHZqNnN3e2aHnxIN/JAKm3txN95IlriexJJ7Ro3n
   GohfuTkdImL9S2XeThs83VklyKe5UpTZIGHw2CSAvWZhkf+vVBRxnUjhh
   5kVRqra4YhhI7g2bAcx4/8lhtrvLybPwq3nChs6vMQ4UTBnPrUGBxOLpo
   EOd0yrY1hdJWdOCe9kvWEwJpBRBsCH+XEqG+AVEj2pOddvdAtiNGpSY3J
   JaBgP7fkfDIM+3UjEWC/zNvaiHmUPj9Ba+4TZtz3HlHPmkGh2jFoX6Ab2
   w3VkIrAHsNFSYIZ6yNyRhpPF6KTQcNpgUBN2W0GUYilC/BiJIzjc6A3fP
   A==;
X-CSE-ConnectionGUID: u8GVBQBKR+GjJVOFDsB8vw==
X-CSE-MsgGUID: GE/wHyqwQ0SsUUTbE+l8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52381858"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52381858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 09:49:39 -0700
X-CSE-ConnectionGUID: MrWKEVp6TOSMw+SNG752gQ==
X-CSE-MsgGUID: vtZbKAVGQeiUqmqw+fmGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148427784"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jun 2025 09:49:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRD1Y-000FBg-2D;
	Mon, 16 Jun 2025 16:49:32 +0000
Date: Tue, 17 Jun 2025 00:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
	mjguzik@gmail.com, luto@kernel.org, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: Re: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
Message-ID: <202506170010.r7INoexI-lkp@intel.com>
References: <20250616052223.723982-11-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616052223.723982-11-ankur.a.arora@oracle.com>

Hi Ankur,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.16-rc2 next-20250616]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/perf-bench-mem-Remove-repetition-around-time-measurement/20250616-132651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20250616052223.723982-11-ankur.a.arora%40oracle.com
patch subject: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
config: x86_64-buildonly-randconfig-004-20250616 (https://download.01.org/0day-ci/archive/20250617/202506170010.r7INoexI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170010.r7INoexI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170010.r7INoexI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_memzero_page_aligned_unrolled
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi_memzero_page_aligned_unrolled)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
