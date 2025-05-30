Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51F54652
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643667; cv=none; b=u+F4c5OVySnrUf48SR0F9Wne8T+bzUeQEygMKkFUPfBlGdAyn5rBpHmUQBhaxdUSJC47zt/+yRv8HlXhdja1ZK3h5LKXQYxTTADYigNN6FlbWEzNdDHGjFEKVPRpspUkzHj0TUTM2GSAXid7UdIZtB7h8m2PfVZyHGOBYdv1bwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643667; c=relaxed/simple;
	bh=Jv3TUisoL/5nYSWnv88iDwJN0BnXpxWC2JV+vW6JSRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNygYdMT9K2w+zo35qMa88LsuKC/NVt4cqLbnNFo1t22S2W8++D/biH5VGCeyOf4kD2AE41by6zMsYlkHv2/Q+0U5LkjgJMG1PYPrR93WvxkEEVpBM3i38TDFbJLB2FX7AY0ouxufosYIp1L6z5ZHMSAe/L9aq+M5SCXl2UsueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDpvJrhQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDpvJrhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748643666; x=1780179666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jv3TUisoL/5nYSWnv88iDwJN0BnXpxWC2JV+vW6JSRM=;
  b=iDpvJrhQSiYUa31kkYG7U1guxhl1RGOY/IsZNwT/ZNTyd7iQhAssEUc1
   uK1xfRqYpGmG0mGmtrpvLfWJgKJvlTFpiGVsLOC5T1S2CsoBDjZKMYg00
   GaQ7p4W786k6dsblUYL1tL4FWMjHTrsD2skYyh7dkDdnUGdL8CmjRP0tZ
   +/ZC8tNoTY4A3YtCxLmooC/5TJYLcFr8TVaI2FeHR5kB0ww0xMdEnm7Uu
   8koRfWOY4/yCXfL9BbvywkgFsfpt+WtlZtJcTmbt1pdvnHfVg78pT838r
   yyovE1NnN3Erv+Qczb8K7rKu23J5vwArFh/hmO7DLA8QNGFyOOwG3k+8w
   A==;
X-CSE-ConnectionGUID: 0DN3RiUmSbi2yYdRnzhdag==
X-CSE-MsgGUID: dQ+TeixUTciH6vozbweR2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50797035"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50797035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 15:21:06 -0700
X-CSE-ConnectionGUID: 0DG4olIHRxSxFtNjktTc7Q==
X-CSE-MsgGUID: 0nASRLPSQwCclXFYDFTuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144967492"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 15:21:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL861-000Y10-1q;
	Fri, 30 May 2025 22:21:01 +0000
Date: Sat, 31 May 2025 06:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Harald Freudenberger <freude@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>
Subject: paes_s390.c:undefined reference to `crypto_engine_stop'
Message-ID: <202505310614.xYOiPjac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: 6cd87cb5ef6ca50ae17c371482ceaab1d635e232 s390/crypto: Rework protected key AES for true asynch support
date:   2 weeks ago
config: s390-randconfig-002-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310614.xYOiPjac-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310614.xYOiPjac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310614.xYOiPjac-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `paes_s390_fini':
>> paes_s390.c:(.text+0x22): undefined reference to `crypto_engine_stop'
>> s390x-linux-ld: paes_s390.c:(.text+0x2e): undefined reference to `crypto_engine_exit'
>> s390x-linux-ld: paes_s390.c:(.text+0x4e): undefined reference to `crypto_engine_unregister_skcipher'
   s390x-linux-ld: paes_s390.c:(.text+0x6e): undefined reference to `crypto_engine_unregister_skcipher'
   s390x-linux-ld: paes_s390.c:(.text+0x8e): undefined reference to `crypto_engine_unregister_skcipher'
   s390x-linux-ld: paes_s390.c:(.text+0xae): undefined reference to `crypto_engine_unregister_skcipher'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ecb_paes_do_one_request':
>> paes_s390.c:(.text+0x33e): undefined reference to `crypto_finalize_skcipher_request'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ecb_paes_crypt':
>> paes_s390.c:(.text+0x52e): undefined reference to `crypto_transfer_skcipher_request_to_engine'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `cbc_paes_do_one_request':
   paes_s390.c:(.text+0xa1e): undefined reference to `crypto_finalize_skcipher_request'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `cbc_paes_crypt':
   paes_s390.c:(.text+0xaae): undefined reference to `crypto_transfer_skcipher_request_to_engine'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `xts_paes_encrypt':
   paes_s390.c:(.text+0x10ca): undefined reference to `crypto_transfer_skcipher_request_to_engine'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `xts_paes_decrypt':
   paes_s390.c:(.text+0x11aa): undefined reference to `crypto_transfer_skcipher_request_to_engine'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `xts_paes_do_one_request':
   paes_s390.c:(.text+0x12fe): undefined reference to `crypto_finalize_skcipher_request'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ctr_paes_crypt':
   paes_s390.c:(.text+0x1dd4): undefined reference to `crypto_transfer_skcipher_request_to_engine'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ctr_paes_do_one_request':
   paes_s390.c:(.text+0x1f0e): undefined reference to `crypto_finalize_skcipher_request'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `paes_s390_init':
>> paes_s390.c:(.init.text+0x48): undefined reference to `crypto_engine_alloc_init_and_set'
>> s390x-linux-ld: paes_s390.c:(.init.text+0x5e): undefined reference to `crypto_engine_start'
>> s390x-linux-ld: paes_s390.c:(.init.text+0x74): undefined reference to `crypto_engine_exit'
>> s390x-linux-ld: paes_s390.c:(.init.text+0xf4): undefined reference to `crypto_engine_register_skcipher'
   s390x-linux-ld: paes_s390.c:(.init.text+0x118): undefined reference to `crypto_engine_register_skcipher'
   s390x-linux-ld: paes_s390.c:(.init.text+0x13c): undefined reference to `crypto_engine_register_skcipher'
   s390x-linux-ld: paes_s390.c:(.init.text+0x1b6): undefined reference to `crypto_engine_register_skcipher'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
