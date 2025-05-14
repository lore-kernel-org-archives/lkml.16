Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE827A925
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238391; cv=none; b=qJcCh4kjYg7YfhDR7fBv3j9eTWc+v5reHRyZl6wA+glyphA2YBfNqgUQlLi/1+b0l0bzyS1j+oj6JpCpprd5nCSv8lwJb5QE7ciSg/p1ISoqBeukqMD2ofqyg/gn6teYRxD0oMZnu+C7Kn8ByNBtnRU06j4qd3v33u920uOVoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238391; c=relaxed/simple;
	bh=aewlEivzOTLwX0pE3ccim5W43mB4Ebqr69oOseIDGHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg8jmarSoz2d+lbY4OcAQXvLeWcIzbcSZo/m+ziXGb+0TvYK/Z/uj/pG+fvLTWEwzJu0yI++w5rKPxnQ+dWxqob1M+KPm7WKQ+gw/dIeZX6W7Jf4rJO7/g9AVQXrn2BLNiOlooXrH7zSHO0ySKrrta6Z5CkIYOyKH6uo81pKIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9kTsOV0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9kTsOV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747238390; x=1778774390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aewlEivzOTLwX0pE3ccim5W43mB4Ebqr69oOseIDGHg=;
  b=T9kTsOV0OWky3CIFc9RDRBAWyJOJhCfBjszTpb/za9Z1ZlzCYJIY5suP
   km1CRVGOH/unbQeVsoATvZABHDKyo8y4C/IWNFgVQPGIXqo0K7v2leH7p
   Q3nXFJm2mSlBC0WYetJhsZj3hMdfFwM0qvDbaLwBqLIkQlUNaUfybLqC7
   hAb1Z+olry5nBXOWuKedjTDNiYBI/BpVtlTFlef7TMtkqDzBnrn7f2a8i
   Q89I4bg0qvTGsTkq1KYQ1vaG3IZAwSyF5SB2hq3fFIk65vUiLxG07M1jk
   W1h7oGq+zGc/0MpZYsHlJ1hOUumv4XbGFIZj8IxbjwW3aMKdae8rMuc8Y
   g==;
X-CSE-ConnectionGUID: OCdYejhuQjGwYlXLFBmFrQ==
X-CSE-MsgGUID: Lvv3+rQmSA2+6/8vXnqQGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52948888"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="52948888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:59:49 -0700
X-CSE-ConnectionGUID: 60pbFHHWSJ6Uow8W4fuUiQ==
X-CSE-MsgGUID: wEH4KuqfQRSa8/eqzqoX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="143280397"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 May 2025 08:59:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFEWE-000HIt-00;
	Wed, 14 May 2025 15:59:42 +0000
Date: Wed, 14 May 2025 23:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <202505142345.jLaHG90C-lkp@intel.com>
References: <20250514122432.4019606-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514122432.4019606-2-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.15-rc6 next-20250514]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/driver-core-auxiliary-bus-Introduce-auxiliary-device-resource-management/20250514-202748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250514122432.4019606-2-raag.jadav%40intel.com
patch subject: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary device resource management
config: arm-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142345.jLaHG90C-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142345.jLaHG90C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142345.jLaHG90C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/auxiliary_sysfs.c:6:
>> include/linux/auxiliary_bus.h:246:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |                 kfree(auxdev->resource);
         |                 ^
   In file included from drivers/base/auxiliary_sysfs.c:7:
>> include/linux/slab.h:472:6: error: conflicting types for 'kfree'
     472 | void kfree(const void *objp);
         |      ^
   include/linux/auxiliary_bus.h:246:3: note: previous implicit declaration is here
     246 |                 kfree(auxdev->resource);
         |                 ^
   2 errors generated.


vim +/kfree +246 include/linux/auxiliary_bus.h

   242	
   243	static inline void auxiliary_device_uninit(struct auxiliary_device *auxdev)
   244	{
   245		if (auxdev->resource)
 > 246			kfree(auxdev->resource);
   247	
   248		mutex_destroy(&auxdev->sysfs.lock);
   249		put_device(&auxdev->dev);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
