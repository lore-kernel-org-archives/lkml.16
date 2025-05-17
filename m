Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5D1D5ACE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747468403; cv=none; b=tzKnGSfd3wTz8+mQEJ0mrA1LkMMTGWdVCBGnOBktCrvyjMpJIhPsrd9h3BwtLf1LyvJLjq66/xxsBMQCwbpdnH8T7yFM7d1HCvd+AXc9928SGu8OQp4aL1XjtS+fbwBQFeT2IvQwK0bJwEj3IqRKKmQvNRsVPGkkxwjTDTFg5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747468403; c=relaxed/simple;
	bh=ItwpPKfVSEeImSexWi39aLRAw1v2H4b0otzybWAJT4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s71rW2zwGe468/eOztvIPePe6hQzUcEiFQW4nWNjU1sZ3/szNbGxZo/rzb53zsbYkiEJrQ0QZFuRkrZxW3xDiHthD4j1/NnWbSXj0TCkFT3Au/pjtj2IwnZeacvFkF2s24d6TiuhQ5mL1CJn7BJXq6TFAOmhUg9/7ohGtaf6QJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eC0TQGG7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eC0TQGG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747468401; x=1779004401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ItwpPKfVSEeImSexWi39aLRAw1v2H4b0otzybWAJT4Y=;
  b=eC0TQGG7LWj8jHuGp8gpisPAvQ7gezNUK9dzACVXW/fwn+0eYDIxVW1S
   0gna04qznF3SRrk1Kwg/6995nbd6M/Ud+6cIfcoov3OMpoIRV0QCfn3mn
   TejbDNETc22ZW5YS9wBx6EU0sVhprWH+03Jp8p5EGMSgB5XDljdynIuo0
   FGDp7GHVzIaQExEqokeMkxMktUfzkQZD1InJjRA/egFxyiSJfkWdKo+bT
   CwXrmtd+GEM9VdDdAp4UoOt8ey3USjf4MWaNxvzLzPhUbtdQ60oZ1/fOs
   9vFjiz6OI3pPLSd/b4r+ntkftXMAaL1360t3yXo6YjsnousPLpQia280Y
   w==;
X-CSE-ConnectionGUID: V3htgqktSOKfw2awvFFGjQ==
X-CSE-MsgGUID: P4H7zsr/Rle9ogOT7e4RlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60779426"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="60779426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 00:53:19 -0700
X-CSE-ConnectionGUID: +pK88K8pTwW/UZxE/SqQdA==
X-CSE-MsgGUID: mFYPdnawS9SumkTzJMkc0A==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="138808540"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 May 2025 00:53:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGCM5-000K0X-2C;
	Sat, 17 May 2025 07:53:13 +0000
Date: Sat, 17 May 2025 15:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to
 handle userspace clients
Message-ID: <202505171509.6i95NZ0n-lkp@intel.com>
References: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 96c85e428ebaeacd2c640eba075479ab92072ccd]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20250517-000257
base:   96c85e428ebaeacd2c640eba075479ab92072ccd
patch link:    https://lore.kernel.org/r/0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle userspace clients
config: i386-buildonly-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171509.6i95NZ0n-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171509.6i95NZ0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171509.6i95NZ0n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_perf.c:189:8: error: redefinition of 'panthor_perf_counter_block'
     189 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:47:8: note: previous definition is here
      47 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:233:29: error: call to undeclared function 'GPU_MEM_FEATURES_L2_SLICES'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     233 |         perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
         |                                    ^
   2 errors generated.


vim +/panthor_perf_counter_block +189 drivers/gpu/drm/panthor/panthor_perf.c

05182d1d6cff3c7 Lukas Zapolskas 2025-05-16  188  
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16 @189  struct panthor_perf_counter_block {
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  190  	struct drm_panthor_perf_block_header header;
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  191  	u64 counters[];
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  192  };
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
