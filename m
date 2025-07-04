Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22792EACE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621259; cv=none; b=b8IWKTA79HtAK+caw3XRkp6J5nsMbbVz/fRjvDsJrY0HyplfjmHxDirsF6Xb3V+0RTg0GuQ0TmAz15CmFKepmOdGa8/V9vqEG1kT/K2xo1ln4MKpp7B4PEsVHyjW7Q7OTsldgvIu+1JSV6Ww8faI9NR9Nr6qw7WRD6sjb8wzw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621259; c=relaxed/simple;
	bh=xsewCoZTz13Afl0fYgBbzrqkR2165Vy3a+LpTEr+0cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrtAvW23BTmTaHfTOu3hVsCP532YYX0vD/8TC7d4aPPMOjmFkXc8Gb06a0q31gghzkFCuhUXV0wZBSeB5gG66G+/84eKC/TGSK88RwfA5mWlW5B5f1F8b+NBJ/vbZnA5g/5zmo8au4Lo/4M36XLFm0q1v8L/GWTfWraBzqkMUAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pm+AHmGB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pm+AHmGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751621257; x=1783157257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xsewCoZTz13Afl0fYgBbzrqkR2165Vy3a+LpTEr+0cY=;
  b=Pm+AHmGBPkwRwtSRS65ndfZhZFxYTyUqKDZVbhKxdjeIwb7s+FsIHz97
   7k4qc0MnG7XpGPJhPKMk65U1YIXQVBG1X0r+8He1j6ODKJUnvGINkhi6L
   vb6QBGy+ajXshgla2M7Qyd5ZmlRyYmXc0RjjgwGnKKMYmPAcg6HS+CVtP
   9ak0H/GiZqKrOQEk6B4tv3cgqHE5+dL8YGX9Rq1CIS5T95WciEIrJ13RS
   LH0onFz7gq0agSGGtrVLF9pbYk/U7+zwwKWyWgbLs/5R2ZdvbXoKb9gBu
   ALDyga/72BHcJiP7YZR0UOye7GuuAXjWNlavyyoyZoTzSUfCaoSKjHlDd
   w==;
X-CSE-ConnectionGUID: DE0o86YTSSyCmFmu23ex6g==
X-CSE-MsgGUID: ZXcgu/vYRkKGiZnhxHChoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65406784"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="65406784"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 02:27:36 -0700
X-CSE-ConnectionGUID: oKzAvXfKRAWMOXa+tKIBkg==
X-CSE-MsgGUID: OZdC7sXeSnWJyAK76jyCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154013038"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 02:27:33 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXche-0003Y9-1X;
	Fri, 04 Jul 2025 09:27:30 +0000
Date: Fri, 4 Jul 2025 17:27:25 +0800
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
Subject: Re: [PATCH v2 7/7] drm/panthor: Add support for repeated mappings
Message-ID: <202507041742.rHigXm3n-lkp@intel.com>
References: <20250703152908.16702-9-caterina.shablia@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703152908.16702-9-caterina.shablia@collabora.com>

Hi Caterina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250703]
[cannot apply to linus/master v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caterina-Shablia/drm-gpuvm-Kill-drm_gpuva_init/20250704-002914
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250703152908.16702-9-caterina.shablia%40collabora.com
patch subject: [PATCH v2 7/7] drm/panthor: Add support for repeated mappings
config: x86_64-buildonly-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041742.rHigXm3n-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041742.rHigXm3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041742.rHigXm3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:220 Excess struct member 'bo_repeat_range' description in 'panthor_vm_op_ctx'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
