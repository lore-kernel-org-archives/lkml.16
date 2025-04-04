Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7060025E815
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796204; cv=none; b=nwp3dZhwt5Ps+NnWlPs5gG/bG/YWjIAWj3+HxZttNpmS6iIR0rRwKRP9nW8edvMd3QxW8GsbjLU4ZCxSjGBYLIZBU5kMPZ2ZFcTUoO5t5egp0JDNLgUJ6lXlmBCEHUQUIvd8BZJobu6+e3OXzp+tocLMtiw0oI+i5VgEal963SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796204; c=relaxed/simple;
	bh=U3nFLA2LVbmYjP0wSlYOc2rCDQikArWPDZjsHh2w+ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hv6oHN5Yewdn8JGivxVp3sHe14dKYu3Gl+7oXerFKFzVwZGT73DDd5iNBsmdXgo3VyQYOpyUoyDqE/pl07cDhXtqSx7Ko2OeBxEYmB9FWGk8xE42kyWDAvmbKGHjblTxr+2OI56XtO9oTAcGwYVBIQAlQsjk1dNaVMa9yajM5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzvFF5ib; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzvFF5ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743796199; x=1775332199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3nFLA2LVbmYjP0wSlYOc2rCDQikArWPDZjsHh2w+ws=;
  b=UzvFF5iby5W9HSvXnahAgWAhapqsGyNUH+i4pZacmpHOdXneLkS4QOQB
   ae/MTzxSuo2+o7DztJ0J1xtYdE/RYtYFpbndwA2C2p/Q0LBw/eZpZYTdN
   DrT4pMCux27cFOzybF53lud2Rrx6KzXh6OWE5YflqNEEjStoFOD4A8d38
   /RFxian+Z7+lwCiJfyKzaFCwtZE325nQgaMEi2xgdpda5HxwZFTb6tuaE
   SWUNAbVqSa+5XkyrU9Dvf6gqZSuA2irgJX341mdKGWhbn/Ljh9dxdbkoK
   dQdLkKQ18UVGqrZd+wWPlkeUFHn34GoBjd99rHzFvuNwwIPJWLy0hom+p
   Q==;
X-CSE-ConnectionGUID: xe7fJJt0TVisF1Qeq8rU9w==
X-CSE-MsgGUID: EjnMNkP/ThCIMTT99GYYoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45387384"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45387384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 12:49:59 -0700
X-CSE-ConnectionGUID: 1xeslovFR2eydcKvxzDQ0g==
X-CSE-MsgGUID: Lnc49kCfRYCokhNs0mNVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="132599188"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2025 12:49:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0n35-0001Ut-1s;
	Fri, 04 Apr 2025 19:49:55 +0000
Date: Sat, 5 Apr 2025 03:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: csky-linux-ld: tda9950.c:undefined reference to `i2c_register_driver'
Message-ID: <202504050335.XqJKkewj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a1d8ababde685a77fd4fd61e58f973cbdf29f8c
commit: caa6f4a75e9f8eaebd814a9c2d1602e0926f473d media: cec: move driver for TDA9950 from drm/i2c
date:   7 weeks ago
config: csky-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050335.XqJKkewj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050335.XqJKkewj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050335.XqJKkewj-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_read_range':
   tda9950.c:(.text+0xa2): undefined reference to `i2c_transfer'
   csky-linux-ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_read':
   tda9950.c:(.text+0x120): undefined reference to `i2c_transfer'
   csky-linux-ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_write_range':
   tda9950.c:(.text+0x192): undefined reference to `i2c_transfer'
   csky-linux-ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_cec_adap_log_addr':
   tda9950.c:(.text+0x2a8): undefined reference to `i2c_transfer'
   csky-linux-ld: drivers/media/cec/i2c/tda9950.o: in function `tda9950_driver_init':
   tda9950.c:(.init.text+0x6): undefined reference to `i2c_register_driver'
>> csky-linux-ld: tda9950.c:(.init.text+0x10): undefined reference to `i2c_register_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
