Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985A288A2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693087; cv=none; b=H9uJTHiw+OcyCpWdgnuq2ZI7XkOTyAdSuDoQZERL+IQbxFRgVcBlLMagjOZMVDuD/LLr4kroDY5iTu+59ONZQesXyoeCyWN7uYDEuXrXYOZOq9cftvgZY3+xHDp5p+jPdExS/rppDijhCv3Vz/pE7rm1Lql51iL4OIXAQTJLYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693087; c=relaxed/simple;
	bh=IKZ1DTGASCABruDhUchsyFcZbv/+51upenQAGloOzeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ryp6rPU+sJ4+Uj3iLncAy8dz2WD6tyuq6zgaoHH0ZzycQWC6gYo6gA9KfrOvCZ7guqpetKLu6srkSjGArJgUTEV2dpT+6V26Do67O91AZ79GXtUb75cOpVa81VA94rVWi44AemSKr19Xughw+mhARrqL2D6Qmcm1R2grwnylKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJDUhEV6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJDUhEV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743693085; x=1775229085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IKZ1DTGASCABruDhUchsyFcZbv/+51upenQAGloOzeI=;
  b=FJDUhEV6OyHVSdpPN0wo5PEa7Da/dUprFvC0RIPRA/+apoWCd8Q5GbbE
   w+9E+kc4JZtGp5oVrMesJOe69msC7xKrmUrMGsRV+BIv9C91cA87CXPEE
   RCAa1GDlzxPai0Xy6DTRHeX5NyiIww/RLBsiSZhN1FDBfK+ssoDoO5WGh
   +3+iDXMYERC7c2RwbuOLePaeT0I28+NKgK8yrWbAqA3D385J/e9FgS/j1
   3ATOylCez9rV3vwizMDXIzz8h4rMJrdOxJWQctyvtGnVHlxMtbkn0mZhW
   jeBmVy6IlALtYQXTAN5e2KXIZ5dWIKSwyoH5ceLmj6gpiIy69f2zgyL91
   Q==;
X-CSE-ConnectionGUID: CY9+AOKvRYCjFeJkjVAVYQ==
X-CSE-MsgGUID: MMifWyEtQIyMy8hU2V6aqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55738643"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55738643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:11:25 -0700
X-CSE-ConnectionGUID: 782DhgRuR6C6o5QqtirVrA==
X-CSE-MsgGUID: 3OPoHHurQumYHKuQkgFfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132242666"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2025 08:11:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0MDu-0000V5-2m;
	Thu, 03 Apr 2025 15:11:18 +0000
Date: Thu, 3 Apr 2025 23:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <202504032326.2F62UbVV-lkp@intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403110053.1274521-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.14 next-20250403]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/mfd-core-Support-auxiliary-device/20250403-190322
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250403110053.1274521-1-raag.jadav%40intel.com
patch subject: [PATCH v1] mfd: core: Support auxiliary device
config: arm-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032326.2F62UbVV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032326.2F62UbVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032326.2F62UbVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/peci/cpu.c:4:
   include/linux/auxiliary_bus.h: In function 'auxiliary_device_uninit':
   include/linux/auxiliary_bus.h:246:3: error: implicit declaration of function 'kfree'; did you mean 'ida_free'? [-Werror=implicit-function-declaration]
      kfree(auxdev->resource);
      ^~~~~
      ida_free
   In file included from drivers/peci/cpu.c:8:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:472:6: warning: conflicting types for 'kfree'
    void kfree(const void *objp);
         ^~~~~
   In file included from drivers/peci/cpu.c:4:
   include/linux/auxiliary_bus.h:246:3: note: previous implicit declaration of 'kfree' was here
      kfree(auxdev->resource);
      ^~~~~
   cc1: some warnings being treated as errors


vim +/kfree +472 include/linux/slab.h

7bd230a26648ac Suren Baghdasaryan 2024-03-21  471  
72d67229f522e3 Kees Cook          2021-11-05 @472  void kfree(const void *objp);
72d67229f522e3 Kees Cook          2021-11-05  473  void kfree_sensitive(const void *objp);
72d67229f522e3 Kees Cook          2021-11-05  474  size_t __ksize(const void *objp);
05a940656e1eb2 Kees Cook          2022-09-23  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
