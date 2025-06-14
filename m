Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D3A1E00A0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929248; cv=none; b=AqH9h8q7ZyuNxO8DUWtbmnnhpzCc0gXnFSM9S009BExCVns5fQOCQFaGLH06tbns2pSRiqcT8emiAvEKaSMpdotDo5MdQ2FoZAM58dTJ6U8sGkly8E99RzGohmIJWIA6zNfeo18Fu9n4Lk2dgoKyzYqR62MI+iy0VkUbAFigNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929248; c=relaxed/simple;
	bh=NjxtDFHeDZvxl23HhxgRg1zZ5eip1hkirM6cI7Fu2/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNQhMN3u/jj9bZk5GcvPtgy/xiaWv+HIf8zaIaNC5+xrmG+4b+sSCfTR/soUX4eDiFqomiExobqUXnzXRSqIAEj0FPnIlnSE/QjnbDwJZnAthPlLJkbY30y8uJcVe2GSwX3cZnMJuYGo9lh4sHPSlc4znbUYearYDK3C726UFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jaox7Cc+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jaox7Cc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749929246; x=1781465246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjxtDFHeDZvxl23HhxgRg1zZ5eip1hkirM6cI7Fu2/8=;
  b=Jaox7Cc+BJRGm8F4PYvcgWKIUqvplepPtcRDfkRu9jFlc2LP1MsI3j3M
   1WnvlYJDw+Mo5C5Na5+pdCz/gOri5yN2CmGykjQ9ZWtf4jY2DOwhB1+rZ
   /U2CKM6OSsXPfGVEB3QD2chleFZQ3a9TdUQFZX3qwDQ+FdejUt4Cx5TCT
   EyDGPDiqTxFIhFaOkMSILapZYXRQ97If6PcOqr2w/OXd/+sMrW88W5CMi
   1oyH3bgr0BPYiAP9/7U2G/HTQe2VAkH5aQ7UfjKep6SAT7XOzL4eW4rRW
   q8U0ayPUcJNnfWYvLFCfjSdZafe6tzvpXoZxmjC9ldftWdfOP4bZXXICP
   w==;
X-CSE-ConnectionGUID: XG+nnUqNTZasqi8YDEdo9w==
X-CSE-MsgGUID: eAFSetwySkmQ/A7zCfrqzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52040055"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52040055"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 12:27:26 -0700
X-CSE-ConnectionGUID: uBQsa8H9Qne+rLyoqYRJkQ==
X-CSE-MsgGUID: TnBQl4OsSGWQCAxjcYVOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148088791"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 12:27:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQWXB-000Dnq-0S;
	Sat, 14 Jun 2025 19:27:21 +0000
Date: Sun, 15 Jun 2025 03:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Subject: drivers/platform/x86/amd/amd_isp4.c:154:28: error: incomplete
 definition of type 'struct module'
Message-ID: <202506150313.UHoIoVhR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
commit: 90b85567e45736b662d034be536a76ba0f4c7ca8 platform/x86: Add AMD ISP platform config for OV05C10
date:   4 weeks ago
config: x86_64-buildonly-randconfig-001-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150313.UHoIoVhR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150313.UHoIoVhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150313.UHoIoVhR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/amd/amd_isp4.c:154:28: error: incomplete definition of type 'struct module'
     154 |         return !strcmp(adap->owner->name, "i2c_designware_amdisp");
         |                        ~~~~~~~~~~~^
   arch/x86/include/asm/alternative.h:99:8: note: forward declaration of 'struct module'
      99 | struct module;
         |        ^
   1 error generated.


vim +154 drivers/platform/x86/amd/amd_isp4.c

   151	
   152	static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
   153	{
 > 154		return !strcmp(adap->owner->name, "i2c_designware_amdisp");
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
