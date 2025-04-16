Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380A482EF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800164; cv=none; b=ksLzv7fIwC2eH6/dMs9AUH0joGrnvJJPTDcEtphEsstqBTVzmv3BZY0psd1OHfUQ7GbZO3u2zYOXj+a6FYnsjOoKEd1yA1mr4uQGC9gfqt8l50NT/7C/aMvRVTXg8S/DZ2zJd0o2zJXOc/C0DnY+ESQr/RoZdLHuzgeQick+cUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800164; c=relaxed/simple;
	bh=AHkqbmZu0vUKvlzbcbpT+pSgZKzWPBSWq33QnZJEtMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l93kwtCaaHo5fKY7ofY0i3YrbkpvblNgEBwFYkfzQ7EnbBGaYRqw9EuujsolT2p3hyVoqGcDVz0ixpCdoE7ZFImbREA2SMrbjjGu0yA3DoZJVVfZsbszulFJN+jSwP4/DamGeTHls5hFgIhxAjXkWbCcA1VMh/CJdhlei0Qh7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dr1TRwOD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dr1TRwOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744800163; x=1776336163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AHkqbmZu0vUKvlzbcbpT+pSgZKzWPBSWq33QnZJEtMQ=;
  b=dr1TRwOD11igiQUlkZ2JtSOMZS6YjRpct9v76Ul8wwcxjHH+5+Doe/Ve
   FQw10YaOll7qOx+IxpTypvuyBDFaCppLC6ew/Xx/rvK+TNw1A8c0iGGfS
   3+i8fb6pn/H422HFzQRLN1Ov1m0FL9wa2xR8YXR5anUNMqf04UsXIKcIR
   RfIlvtOORZwyAqwlYdt3doUlSYkELhgH/9SVrLzWbHv7puon7lwmLRXNE
   2dx/qgUDZcCRncsRLf5ne2CnQ1yIQdowlt1ab9VwR6gmuPxkaiN/YrqwL
   2I5R55EJoay6w2ewf4eupv8TdZl25urnIFxc15O8Dztv9+tpsONPeP5aA
   A==;
X-CSE-ConnectionGUID: dw8U32FlSl2/gI11FG3bFw==
X-CSE-MsgGUID: IYTIGKiPTVOnsOHaKoFWiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50162145"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50162145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:42:42 -0700
X-CSE-ConnectionGUID: NnmnWTCtRt2WW5r8kw2h2A==
X-CSE-MsgGUID: 2EQrkd6vRK6MQNqPpqBtaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135597035"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 03:42:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u50E1-000JXw-12;
	Wed, 16 Apr 2025 10:42:37 +0000
Date: Wed, 16 Apr 2025 18:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] regulator: hi6421v530: fix building with GCC 15
Message-ID: <202504161823.huZUOtmg-lkp@intel.com>
References: <20250415111411.6331-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415111411.6331-1-listout@listout.xyz>

Hi Brahmajit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc2 next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brahmajit-Das/regulator-hi6421v530-fix-building-with-GCC-15/20250415-191555
base:   linus/master
patch link:    https://lore.kernel.org/r/20250415111411.6331-1-listout%40listout.xyz
patch subject: [PATCH 1/1] regulator: hi6421v530: fix building with GCC 15
config: hexagon-randconfig-001-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161823.huZUOtmg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161823.huZUOtmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161823.huZUOtmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/kernel-doc: 1: kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 127 shuffle=4166761562
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   In file included from scripts/mod/devicetable-offsets.c:3:
>> include/linux/mod_devicetable.h:608:47: warning: unknown attribute 'nonstring' ignored [-Wunknown-attributes]
     608 |         char name[PLATFORM_NAME_SIZE] __attribute__((nonstring));
         |                                                      ^~~~~~~~~
   1 warning generated.
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2 shuffle=4166761562
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4166761562
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4166761562
   make: Target 'prepare' not remade because of errors.


vim +/nonstring +608 include/linux/mod_devicetable.h

   606	
   607	struct platform_device_id {
 > 608		char name[PLATFORM_NAME_SIZE] __attribute__((nonstring));
   609		kernel_ulong_t driver_data;
   610	};
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
