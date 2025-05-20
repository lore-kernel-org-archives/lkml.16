Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903B1DE2A8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741112; cv=none; b=e9f75za3QSnP9XdGrPLQZERcHr55ZeaagLs1O669AK1I2vAB7G1IHP824XvLJWhVV5tldyt7jEfE8BOp9DLRuqCaCqHqcXhN8LHI7yuFqZvsm74a9E1bvg/DIOTk/teO9VaeJfxYLaJ362Ruui98WxtEEU52LxAuKU2Zfw8WK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741112; c=relaxed/simple;
	bh=onzNthu//TqCk8fXRF+KW7Sh7xAH/kuJP5cNr1Ekph8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9ZTRbKRsyviyo6ZX616NgnOw+/n2EHIXs6sNs9HqcFfCwRUd63JYOCs3FHA7Qvp4mCrF16kcWY1dN+PYbSEAiS9Bfytei4mqDnYuKtkPT8d9ywrADmvGwb2M1mjtptIn1j9DYHpyAzclhefjuhsW/IZyrxagpJHpL6pEa/nR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ike68lEc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ike68lEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747741111; x=1779277111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=onzNthu//TqCk8fXRF+KW7Sh7xAH/kuJP5cNr1Ekph8=;
  b=Ike68lEcif+N038jj6lkvkNidjiIHHutRCxsmdROREITSdBwQru9ZvS5
   dAOU//EJXM1jdM9EOU5F3Bl1Z17vi0KY+p3qOvISl+MS0u6tgAUsilELa
   3XwhiEt7CfG1+FZN0OKoykUgpY7/p52ZnTSJ35DHGrTqxSrRD3sXrjnA3
   DHPhzfTIss9omGJhCUg/ACxwHvJyA6q+SMLWYt/0LuLAKhcCxlikcH48r
   okcJjgmrg76TXVbr+Irlpe+t63M91exYig9eqHGC7mtSGfC8IDEGstyXm
   Ou5yt9nS5V8pJlQWtsUSxv/aPEQpzVvN1N6IlQCUaegdTHx8bkDwpfNrh
   A==;
X-CSE-ConnectionGUID: I6uQWjmqSVSV6xlJEJUvaw==
X-CSE-MsgGUID: SniKjU/vTQK4GxRI3a+fNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67077655"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67077655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:38:30 -0700
X-CSE-ConnectionGUID: DrZeBAEoRoSZV2ne/NJw+A==
X-CSE-MsgGUID: 40bjcX6FQiOqBb0EKDbWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139567031"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 04:38:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHLIg-000MWW-0l;
	Tue, 20 May 2025 11:38:26 +0000
Date: Tue, 20 May 2025 19:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: Siddarth Gundu <siddarthsgml@gmail.com>, geert@linux-m68k.org
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: Re: [PATCH] m68k: apollo: replace strcpy() with strscpy()
Message-ID: <202505201919.YX6T8TcK-lkp@intel.com>
References: <20250514052327.96537-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514052327.96537-1-siddarthsgml@gmail.com>

Hi Siddarth,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on geert-m68k/for-linus gerg-m68knommu/for-next linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddarth-Gundu/m68k-apollo-replace-strcpy-with-strscpy/20250514-132427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
patch link:    https://lore.kernel.org/r/20250514052327.96537-1-siddarthsgml%40gmail.com
patch subject: [PATCH] m68k: apollo: replace strcpy() with strscpy()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20250520/202505201919.YX6T8TcK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201919.YX6T8TcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201919.YX6T8TcK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from arch/m68k/apollo/config.c:2:
   arch/m68k/apollo/config.c: In function 'dn_get_model':
>> include/linux/compiler.h:197:62: error: static assertion failed: "must be array"
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                              ^~~~~~~~~~~~~~
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:80:47: note: in expansion of macro '__must_be_array'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                                               ^~~~~~~~~~~~~~~
   include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^~~~~~~~
   include/linux/string.h:114:9: note: in expansion of macro 'CONCATENATE'
     114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~
   arch/m68k/apollo/config.c:222:5: note: in expansion of macro 'strscpy'
     222 |     strscpy(model, "Apollo ");
         |     ^~~~~~~


vim +197 include/linux/compiler.h

230fa253df6352a Christian Borntraeger 2014-11-25  193  
cb7380de9e4cbc9 Kees Cook             2025-02-05  194  #ifdef __CHECKER__
cb7380de9e4cbc9 Kees Cook             2025-02-05  195  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) (0)
cb7380de9e4cbc9 Kees Cook             2025-02-05  196  #else /* __CHECKER__ */
cb7380de9e4cbc9 Kees Cook             2025-02-05 @197  #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
cb7380de9e4cbc9 Kees Cook             2025-02-05  198  #endif /* __CHECKER__ */
cb7380de9e4cbc9 Kees Cook             2025-02-05  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
