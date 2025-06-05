Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46A1E521E;
	Thu,  5 Jun 2025 02:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749089241; cv=none; b=IafZW9T+EVL0d0rJ3rd6iYAIiobnAyVjyC++V41fQ6r7r7O8c0mc8jnwW2pVP2XZ4d+ISxej79Rn0u+KzI/uvDr1hNxMyB2xI9+XNsbO7mZdvvnq1oyZZCkgHHEZRZmaYCORg2FsOb+rKCuzCKIr7WqSQNifI7EUzuVXxP9zhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749089241; c=relaxed/simple;
	bh=yMce1iU4qlTP2YV6HR8iTvROrswiVvlSS11E20ztdoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nppQDG6fSIIyk5Bz6CjwKCjj+Fv2PFeSewVJNPMqSr7AY1DM4WwweB55CBLKP1lkCqTpFNJvTfoKLGI+1pvcGSU72KmnkgyzJ8XRrF16uHwTBoIrE1zofVCDQnjbLV1gdXLLFtGiW9gqp3Y+q5mF6Lc80SFg+scAZuXmyBa7v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxmbx5vY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxmbx5vY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089240; x=1780625240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yMce1iU4qlTP2YV6HR8iTvROrswiVvlSS11E20ztdoM=;
  b=bxmbx5vYZXO3XbMcRbTZfYqviAlJ3tC2QQ8EolmTGEbZ98gymUP0n+v5
   WPeiqxnVzi6+h9/yH+YjUsvTcz/6Fm2yPPwGicd+1m7U7f3ui4ONLGsXT
   Es9eF4eJmgMxeX0qAB7K5HeBERZJPKwDhYgVV0ywv1oPUOCnegcM21WLf
   ZYhsrEGZNhgD/XLpFzerSMZYqVDOAP2+uaXoSFwF7WtiupfyyGYlCCsAq
   9JJdsrT2HPUmMgm5my6Dle+0+tIZ9jC/qxtEUaP6aEcLbtB/BY48n1S32
   mrTLvRdNkEtDrHGqqohNMbK7p9jtfmDZ+t/X+mm0wnCtZJ6L7prj0Oy+7
   A==;
X-CSE-ConnectionGUID: 2/i1rnZXSRKbjoK7Mhyj1A==
X-CSE-MsgGUID: ln/G++SISnySSyqgAiyr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51339063"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51339063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:07:14 -0700
X-CSE-ConnectionGUID: UpLwAK/uR4SBGSbZVL/C3A==
X-CSE-MsgGUID: DifQLQgITIS/vaqsPHMp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150514743"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2025 19:05:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzzR-0003cj-0J;
	Thu, 05 Jun 2025 02:05:57 +0000
Date: Thu, 5 Jun 2025 10:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <202506050903.jk5UWok1-lkp@intel.com>
References: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00286d7d643d3c98e48d9cc3a9f471b37154f462]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Marques/dt-bindings-i3c-Add-adi-i3c-master/20250604-235108
base:   00286d7d643d3c98e48d9cc3a9f471b37154f462
patch link:    https://lore.kernel.org/r/20250604-adi-i3c-master-v1-2-0488e80dafcb%40analog.com
patch subject: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C Controller IP
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250605/202506050903.jk5UWok1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050903.jk5UWok1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050903.jk5UWok1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_disable':
>> drivers/i3c/master/adi-i3c-master.c:180:16: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     180 |         writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from drivers/i3c/master/adi-i3c-master.c:8:
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_bus_init':
>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/i3c/master/adi-i3c-master.c:72:41: note: in expansion of macro 'BIT'
      72 | #define REG_IBI_CONFIG_LISTEN           BIT(1)
         |                                         ^~~
   drivers/i3c/master/adi-i3c-master.c:704:16: note: in expansion of macro 'REG_IBI_CONFIG_LISTEN'
     704 |         writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_disable_ibi':
>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/i3c/master/adi-i3c-master.c:72:41: note: in expansion of macro 'BIT'
      72 | #define REG_IBI_CONFIG_LISTEN           BIT(1)
         |                                         ^~~
   drivers/i3c/master/adi-i3c-master.c:859:24: note: in expansion of macro 'REG_IBI_CONFIG_LISTEN'
     859 |                 writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
         |                        ^~~~~~~~~~~~~~~~~~~~~


vim +180 drivers/i3c/master/adi-i3c-master.c

   177	
   178	static int adi_i3c_master_disable(struct adi_i3c_master *master)
   179	{
 > 180		writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
   181		       master->regs + REG_IBI_CONFIG);
   182	
   183		return 0;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
