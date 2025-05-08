Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE381DF99C;
	Thu,  8 May 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746677444; cv=none; b=GmyMCT1F+i0Bp10NyVC3ulFpcFpp+LehVu/vkFnTMbvN6rrVKrqB/xVLKO+PMdQoWarFbCigwI3f5VY5pQJkZJJBnuNLWCr3kXQSu+azGiz4YUpRmiA6hZQohDJ/UqpofJWDqwWy7ushOozFUkjOpSPWjXlk6uWGlOHpKg/4hvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746677444; c=relaxed/simple;
	bh=4t0VL9wIhyMoUDpMaY3vKPF5EPbXzkRT87RGiJt5LO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRks5APvUvnqiWZhzX2nxYVuQ8FqMK1Eg/8sgLofZstqUgb1UM07LDROQgq+XOPD7GxgErwFSf8duXM080ncjogWEnvcLGCqsIjQAYtfO1BU0sUW/g8NmoDS8zEXOq+RGLincpAKdXm9+C1uMm6KuZH+QH1MioHct5QgngngSPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHBl9B5h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHBl9B5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746677443; x=1778213443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4t0VL9wIhyMoUDpMaY3vKPF5EPbXzkRT87RGiJt5LO0=;
  b=QHBl9B5hIdMZc/qBSYC1o1HcVgNDpOTmkMe7uarHsE4ArLvRdBNhxwm9
   ImrtEDHeziyA9NFxf83SAtyZUs0Xb8ZlcR0d3QYRDgug9TkNaIdLdMgmr
   eT2qsu7XeG7hMb1mA0jA30343nC9+qeD/8i99ULzt4qZBgN24WJ+wKMFe
   VI8+HUMSzEBH+9aKrqaD8G0JENPLuglv5/iz76SZQNXWUVkzk116X1G6N
   D6qOPi4kuMzm4VIonvA5UugJkj+Yf9Q/EccdzwhoCsJ9P/eeZfygvzZ/t
   EWhU0xFDCUBbOScQj2Lh0us2vcJ2Ktgug+1R+/+xpOb0HGQyQ6mXJh25q
   w==;
X-CSE-ConnectionGUID: rMC5IcL7Qzu0VIavATSPiw==
X-CSE-MsgGUID: wlig+MXXQRKpsTzreOov0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48348656"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48348656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:10:42 -0700
X-CSE-ConnectionGUID: ag5YoI4LQxWU0p7NVqgzzw==
X-CSE-MsgGUID: X/nnoFYxTgiCfx3a/XUv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137089745"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 21:10:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCsag-0009xr-1I;
	Thu, 08 May 2025 04:10:34 +0000
Date: Thu, 8 May 2025 12:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, heylenay@4d2.org,
	inochiama@outlook.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <202505081113.CwKtDYbs-lkp@intel.com>
References: <20250506210638.2800228-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-4-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-soc-spacemit-define-spacemit-k1-ccu-resets/20250507-051019
base:   cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
patch link:    https://lore.kernel.org/r/20250506210638.2800228-4-elder%40riscstar.com
patch subject: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505081113.CwKtDYbs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081113.CwKtDYbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081113.CwKtDYbs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/spacemit/ccu-k1.c:998:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     998 |         kfree(to_spacemit_ccu_adev(adev));
         |         ^
   1 error generated.


vim +/kfree +998 drivers/clk/spacemit/ccu-k1.c

   993	
   994	static void spacemit_cadev_release(struct device *dev)
   995	{
   996		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   997	
 > 998		kfree(to_spacemit_ccu_adev(adev));
   999	}
  1000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
