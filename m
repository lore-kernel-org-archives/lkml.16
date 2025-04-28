Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3522FE11
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830039; cv=none; b=WdR6EdnsPqdMBU3KKcSJIt2IPQ+Cd895ab8D7IMP94v122j9bYQRhSEEUokBo5HH61H0KdNb+K7IttXIwit+E0vFgRtd1k7O6C+w5+1n7/Z0R92zfORWRgT4+Z6Y3d0HZaGM4tptPcmvgayKbWD42prAfyf7uQ71RxlGr+5UxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830039; c=relaxed/simple;
	bh=70oDwUtwYqEyETXz7oCBoL3rbNqfBiLdDstId/VbxTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTtteAEGnu06hmIcGOdAkFSolBx4w9wJejPOn3ZdjygHY5sVBQe1uPHoTv5jmsg+I1VMKRjLcEsq59RmuqqiO4bEmdbOYANwTQmUsX0GQ6fxjTzmZDHos+Gu4p2PRMi+InKUFg/1J2WPe3Rp25goHuAgl5c5MjxKMYczemX62D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx/1CHIk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx/1CHIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745830038; x=1777366038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70oDwUtwYqEyETXz7oCBoL3rbNqfBiLdDstId/VbxTo=;
  b=hx/1CHIkVe9yhkIjevbjduR0nM5zgUAxP9i0s+xFPpRe2OOVSUm4cwJb
   MgVoBMndT350s+cLM6LKQWCgmTRjI6U1oeawAK+U7/2Asyy/DcK+pMmsA
   DdaXtzrkJ9XSBbAtzsPUlxTZd2I6/8z9gY1HmJRXXz0VGd9F5+CnYTtYv
   Hx3vyFalqiRxSjA4OOblftQLYoLGmgRW4rhlydun2PScNDkL95atXVRpR
   Cmrcj5S+MlY7V2dx2bYP3urg+8yrpLHzZIPUXWLWBzYS8F35sbzzI1Zl1
   PXzQeVuUhi+3wKScD/2hX6FX3c60QE6vo6Aneea+bZHPzMTAU+OgS7bRe
   Q==;
X-CSE-ConnectionGUID: H9OabOX5Tj6TXm9UGDStOQ==
X-CSE-MsgGUID: /eSXcUoWRCCeanLvKuJCLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47538243"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47538243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 01:47:17 -0700
X-CSE-ConnectionGUID: UeWbODFoQYKTPNSUv7pfkA==
X-CSE-MsgGUID: lR2eVMfHQrmLY4hfOblAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="138453577"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Apr 2025 01:47:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9K8t-0006lB-1R;
	Mon, 28 Apr 2025 08:47:11 +0000
Date: Mon, 28 Apr 2025 16:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belousov <igor.b@beldev.am>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	hannes@cmpxchg.org, minchan@kernel.org, nphamcs@gmail.com,
	senozhatsky@chromium.org, shakeel.butt@linux.dev,
	yosry.ahmed@linux.dev, Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH mm-new] mm/zblock: avoid failing the build
Message-ID: <202504281654.Cj20Gqsl-lkp@intel.com>
References: <20250428065727.57990-1-igor.b@beldev.am>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428065727.57990-1-igor.b@beldev.am>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belousov/mm-zblock-avoid-failing-the-build/20250428-150012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250428065727.57990-1-igor.b%40beldev.am
patch subject: [PATCH mm-new] mm/zblock: avoid failing the build
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250428/202504281654.Cj20Gqsl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504281654.Cj20Gqsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504281654.Cj20Gqsl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zblock.c:27:
>> mm/zblock.h:24:2: error: invalid preprocessing directive #warn; did you mean #warning?
      24 | #warn This PAGE_SIZE is not quite supported yet
         |  ^~~~
         |  warning


vim +24 mm/zblock.h

    16	
    17	#if PAGE_SIZE == 0x1000
    18	/* max 128 slots per block, max table size 32 */
    19	#define SLOT_BITS 7
    20	#elif PAGE_SIZE == 0x4000
    21	/* max 256 slots per block, max table size 64 */
    22	#define SLOT_BITS 8
    23	#else
  > 24	#warn This PAGE_SIZE is not quite supported yet
    25	#define SLOT_BITS 8
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
