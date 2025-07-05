Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F0A927
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 06:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751695293; cv=none; b=X+n+PdSeUHiM+YRugaMvXiI/xdKyANgcGihvkWhZeFc2acAeIGocrkCxeLsqaqURGOOSZuErenqlJJ+Flrb8lt0G2KD/lyHnNKNxCYuOb5fkhMyljmYC36E3HVtHqRsWLmYMuZMN8IaVrwGeF67/1G25ne4uqr5sJNxWYFfw/go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751695293; c=relaxed/simple;
	bh=Jwk7LrOiEZVMgoQ8L3FzYRWdRU10TKG82/z45Yk2RnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qClkjpLs8hhg1hjv/lGK0BW0FtBUyQlJTaWv3KnmZLk1LHT1B68shxH2mU+TOvNb6nEOFP7/RGpvymChJuMtCTH+twLqHmR4uuRNS53biG/Ovlt6dXP/KiKBtKzoi9yZ5JNYo77cRNiuuGPbJJeC9equDX7lvutDYJLicyOr+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TImUVJS+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TImUVJS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751695291; x=1783231291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jwk7LrOiEZVMgoQ8L3FzYRWdRU10TKG82/z45Yk2RnA=;
  b=TImUVJS+T70ZVNYahs5w9bXnmMhBe4gIYYpKe3CkEMZx870k+nlxapLv
   nS9fglZZ/E8NNhOoc7WB1viL5ghbZEQqWIE4d/ZI9+4ZnYcSdtNYcFaq2
   bGM8GsZ/zdThZFy10csAijvi+6N+ihj2qOM47aepuNIRk9sCV9Ni0U9as
   m6wMaVVxkcY0ti2HlOOFT5fqTPX0LiVHlrb8MKdebfGobgY7nwgkBpH+y
   8cw8oDqYqcufEi5i4mOee1PW/rIs7gFRq7gjTwlizUQmp4xNiKikJ7KfW
   wdTM2mzClXqOJeJfUm20NBP4utt0V/RTHLlwv3l+M2I7SWjUEwRj3yu6r
   Q==;
X-CSE-ConnectionGUID: 2HIfZVhuSTGfg6kreDjX7g==
X-CSE-MsgGUID: UXM5a9uVT4uvY5doAYVT0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65061951"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="65061951"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 23:01:30 -0700
X-CSE-ConnectionGUID: r9LQNFAwSv2J+KZ6Sb8NPQ==
X-CSE-MsgGUID: DL362qTISWOqwA+hdZZQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="160445501"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2025 23:01:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXvxj-0004KT-0E;
	Sat, 05 Jul 2025 06:01:23 +0000
Date: Sat, 5 Jul 2025 14:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Fleming <matt@readmodwrite.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Matt Fleming <mfleming@cloudflare.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time
 configurable
Message-ID: <202507051300.E0JSHxu1-lkp@intel.com>
References: <20250704120604.2688934-1-matt@readmodwrite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704120604.2688934-1-matt@readmodwrite.com>

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.16-rc4 next-20250704]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Fleming/stackdepot-Make-max-number-of-pools-build-time-configurable/20250704-200804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250704120604.2688934-1-matt%40readmodwrite.com
patch subject: [PATCH v2] stackdepot: Make max number of pools build-time configurable
config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051300.E0JSHxu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051300.E0JSHxu1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from lib/stackdepot.c:17:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   lib/stackdepot.c:42:1: note: in expansion of macro 'static_assert'
      42 | static_assert(DEPOT_MAX_POOLS <= (1LL << (DEPOT_POOL_INDEX_BITS)) - 1);
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
