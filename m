Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8821A23AC;
	Mon, 14 Apr 2025 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610174; cv=none; b=aBpf6s7qIRcV/ck+RS/RtY8h4fhwZlyKsZ1gPvYAYURA5i7Uf5QA6Lw2f37qvWGep9+IkNrtXcng4nQU6zkmMS+YgA5OYHeydeB34nAL2oPRljfBuKt1TnnN7GlOLz2mQnVtgMcgz9MYcT/hcGQxPdtNV1VjvGO2pzd0ovSFw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610174; c=relaxed/simple;
	bh=N2PfZqCCfrPYmMpOLmMuCgesT/ss1olY3ch1HwHqkdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/rYzc7O/UZZlM3JaCTkFQwPtWmXnOoFp9SPORgC9I9AZVGQFTEtdbW1Ag21Qk3S3gFu9tcF+Kojd9B9K440fZaBPUdk2HC8jUPSm7iqHleRt/VWZ54YR7WFBv6sZQbPQUFWQ96M73zngDLE2u2dSFRz4hqu+ouPmuxy8TKMGxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4c6sBBI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4c6sBBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744610173; x=1776146173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2PfZqCCfrPYmMpOLmMuCgesT/ss1olY3ch1HwHqkdk=;
  b=D4c6sBBIQnyKTTsn5728a3tFwjoB5gMNFabOytiGOotCcWvHDsgFoUQM
   ao6f4w2GEr/NmuHlHFwdvK4+sScguLFDeEQbkzTb42THW6plu3WQ2pFD1
   /OQyfDwqLrhNuDF9ALTaqbBLx3iVPEM3UdBYknq0DgXvDPmCWHfmBAdso
   Z9kGKQFyHafYQU+QkCtqKVjb8FkSqw+9rYLQEpt/9jQgG0i8by3AjCu4h
   dqzpjOZCnBr1GuGqKXwwZCHvItw3BwtxEhziFcbzY6riqpaEqatboD/cc
   xwU9zohbhvgYJI3Ou9Vkbt6gBcwZaO7t/6sB3ImcmbU1hbDSev+/giiEP
   w==;
X-CSE-ConnectionGUID: Qbmknm9XT4y8DkfbPIwgxA==
X-CSE-MsgGUID: PBw0PY5SSdaHxO1lJL03QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57434693"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57434693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 22:56:12 -0700
X-CSE-ConnectionGUID: 4EPlBq8xTLOhiZY7nid7Jw==
X-CSE-MsgGUID: xdahxGovQeSUF3KgIpzAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134563200"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2025 22:56:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Cnd-000Dla-31;
	Mon, 14 Apr 2025 05:56:05 +0000
Date: Mon, 14 Apr 2025 13:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Akshay Gupta <akshay.gupta@amd.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux@roeck-us.net,
	gregkh@linuxfoundation.org, arnd@arndb.de, shyam-sundar.s-k@amd.com,
	gautham.shenoy@amd.com, mario.limonciello@amd.com,
	naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com,
	Akshay Gupta <akshay.gupta@amd.com>
Subject: Re: [PATCH v8 09/10] misc: amd-sbi: Add support for register xfer
Message-ID: <202504141353.TItkAjad-lkp@intel.com>
References: <20250411133122.1806991-10-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411133122.1806991-10-akshay.gupta@amd.com>

Hi Akshay,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus groeck-staging/hwmon-next soc/for-next linus/master v6.15-rc2 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akshay-Gupta/hwmon-misc-amd-sbi-Move-core-sbrmi-from-hwmon-to-misc/20250414-100657
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250411133122.1806991-10-akshay.gupta%40amd.com
patch subject: [PATCH v8 09/10] misc: amd-sbi: Add support for register xfer
config: i386-buildonly-randconfig-002-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141353.TItkAjad-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141353.TItkAjad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141353.TItkAjad-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/misc/amd-apml.h:65:2: error: unknown type name 'u16'
      65 |         u16 reg_addr;
         |         ^
>> ./usr/include/misc/amd-apml.h:69:2: error: unknown type name 'u8'
      69 |         u8 data_in_out;
         |         ^
   ./usr/include/misc/amd-apml.h:73:2: error: unknown type name 'u8'
      73 |         u8 rflag;
         |         ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
