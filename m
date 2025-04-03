Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191052E62D8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743716407; cv=none; b=djhGmpHXS3LfuoDojAyP8Ibg0QtPEJNq0Eb8MKS8V6LAMUPAPo1iNuAUv88wrWFqy2/bc1oE7wK88/2tZjVouKrQwHs+yTGNBCS0CpVq5ukOW346n7DAeuPG+sBug07XtDLQo6R+DKjjAXC1wAtATdP4mjGIIpJDeD6YWxJN57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743716407; c=relaxed/simple;
	bh=Qx2gYxupt6gQsKgrQNrgOaPI3xgfMoM8PpRv4agEeQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYdEJIbfsEZbWxcQdt3G64fyxv7rv5bOHUdwCPYm7by09N6Zpav3I/oCfsThrDc5e7kzm1P5LC0p4CQIActSZSHWXZvbceDg9h5WwhYQ9vfIrap1JSSwiiMWfuSP4I+9pFl5obySTacwaxj/j4m/6Np+V6dKoISOmuIi+Cymep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kH5Qzn4f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kH5Qzn4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743716407; x=1775252407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qx2gYxupt6gQsKgrQNrgOaPI3xgfMoM8PpRv4agEeQA=;
  b=kH5Qzn4fGFrAcH5AzJcqQ/y5GOwORMzdmP3OiYgz2QGuFcaTfEfA7zQK
   jmd8NInwrJXXsCBCtIr5tDcvDMTXQ9Vo3GyzNoSJt1oHIccPX5u5Mu6Ar
   UP5taAeBjX46s+W2lScUVTTba9DmFZgzmqhFiNtKoSsvn46x07hhIqCNo
   3OSpUkENw2ulPGxdi9BfBZLopJMLIv18bCzEWNtGK/oyBt6ordQm1i1BI
   Wb/1GeAYV8LspgM+vkLmWNa4RtgGdw0LgD/4KKrvYSh04m+3h8iwT8sel
   Tpb3w8MkHFNCJhttiHRTuApCTaPJF4j2dgoluvEifct2II7k9+FYARZSv
   Q==;
X-CSE-ConnectionGUID: rNmNkPIoQTS7YUkJjd2nRg==
X-CSE-MsgGUID: ILbO4KoaRayM8WGUxn/GDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45292080"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="45292080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 14:40:06 -0700
X-CSE-ConnectionGUID: LOVl3Ap7Styi4wmbdvrWhA==
X-CSE-MsgGUID: JszBy4WJSheRNb0AyBLzuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="127987261"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 14:40:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0SI5-0000pT-07;
	Thu, 03 Apr 2025 21:40:01 +0000
Date: Fri, 4 Apr 2025 05:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <202504040556.gg5BerTZ-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.14 next-20250403]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/mfd-core-Support-auxiliary-device/20250403-190322
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250403110053.1274521-1-raag.jadav%40intel.com
patch subject: [PATCH v1] mfd: core: Support auxiliary device
config: arm64-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250404/202504040556.gg5BerTZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504040556.gg5BerTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504040556.gg5BerTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: auxiliary_device_init
   >>> referenced by mfd-core.c
   >>>               drivers/mfd/mfd-core.o:(mfd_add_devices) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __auxiliary_device_add
   >>> referenced by mfd-core.c
   >>>               drivers/mfd/mfd-core.o:(mfd_add_devices) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
