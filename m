Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34D286D63
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617471; cv=none; b=fP3lXrSiUXi5vD0BXDqRqPavFrNjGflPr9M5mn3WhGj3MsPMpjS8SuIy9s1IMRnv9Az6gG80pSFn/dzfvdA1s2oyRjvsgLfn5NqW9zuMIQQeSo7ZV4M5smgMrat2kLOiE2ReluVzFrl/O2cibguIF237y8N8YfyFlBuslI2O5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617471; c=relaxed/simple;
	bh=hNS3AJuvFAF9BI74gAcGsp48sqw2j6KHtYQY1YWXNa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsboClwaV5RkS+T89IR05Ql2anlhxL830nyw6ST+dJ+WsTAe357K3H2kUr+n44ycS+N0Yq9pgJnA1e2mjvN6hI55MjpKSKkSAdyfnmUIX0L2XyW+/JUh3/7h181kUHy0GdCv7348ZPlMIQ8pG0de03hvC8R6bQrnzvmaRH8YCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kibFYCCG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kibFYCCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751617470; x=1783153470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hNS3AJuvFAF9BI74gAcGsp48sqw2j6KHtYQY1YWXNa8=;
  b=kibFYCCGXtgwT8qXctBCXjjwCPbWm5Mth36L97jaCxQp5OE81vy0NHhj
   QU4Zw8yjf0woNAY8g4bmUX9yNnR/RxuRCvUvEfgWG9xQIzYdGU5DNH8BU
   42l9E1Mmmib7ps6q1FmOgrM0lBQnAKSSkQqIjH8V4IXUMiwF+hsVVZ3yv
   7PFCjq4mTmn6a1xRf9zOtvCEZ4oht9YE39sTfWYOe5ST/48OR8SC4Fnms
   BPiIzof1dr+rgs+cDT+n1AlknyjLRyHYAzBIELK/qNIu981+y7lP+oz20
   embU/Y5EYfqdnUyLHB0BB1IgC2sAbqWX8CSqgdVZOXHuYgfai3ey6ukqs
   Q==;
X-CSE-ConnectionGUID: SUvOfvoqSOmhtxN0ki/PoQ==
X-CSE-MsgGUID: LSUV/5IKTJ+ZKKaVDaGXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79388726"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="79388726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:24:29 -0700
X-CSE-ConnectionGUID: tpdZkD9uQC249uQq+oRqwQ==
X-CSE-MsgGUID: zQjV/mBQRVWnR2077FGrHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154716553"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 01:24:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXbiZ-0003UF-1G;
	Fri, 04 Jul 2025 08:24:23 +0000
Date: Fri, 4 Jul 2025 16:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Caterina Shablia <caterina.shablia@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com,
	Caterina Shablia <caterina.shablia@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/panthor: Add support for atomic page table
 updates
Message-ID: <202507041635.WyDu3TQ1-lkp@intel.com>
References: <20250703152908.16702-3-caterina.shablia@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703152908.16702-3-caterina.shablia@collabora.com>

Hi Caterina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caterina-Shablia/drm-gpuvm-Kill-drm_gpuva_init/20250704-002914
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250703152908.16702-3-caterina.shablia%40collabora.com
patch subject: [PATCH v2 1/7] drm/panthor: Add support for atomic page table updates
config: x86_64-buildonly-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041635.WyDu3TQ1-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041635.WyDu3TQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041635.WyDu3TQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_mmu.c:1685:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1685 |         if (vm->as.id >= 0) {
         |             ^~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1691:9: note: uninitialized use occurs here
    1691 |         return ret;
         |                ^~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1685:2: note: remove the 'if' if its condition is always true
    1685 |         if (vm->as.id >= 0) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1679:9: note: initialize the variable 'ret' to silence this warning
    1679 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1685 drivers/gpu/drm/panthor/panthor_mmu.c

  1675	
  1676	static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
  1677	{
  1678		struct panthor_device *ptdev = vm->ptdev;
  1679		int ret;
  1680	
  1681		mutex_lock(&ptdev->mmu->as.slots_lock);
  1682		drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
  1683		vm->locked_region.start = start;
  1684		vm->locked_region.size = size;
> 1685		if (vm->as.id >= 0) {
  1686			lock_region(ptdev, vm->as.id, start, size);
  1687			ret = wait_ready(ptdev, vm->as.id);
  1688		}
  1689		mutex_unlock(&ptdev->mmu->as.slots_lock);
  1690	
  1691		return ret;
  1692	}
  1693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
