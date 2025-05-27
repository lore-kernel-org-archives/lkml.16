Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618B2517B9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338918; cv=none; b=umNUZN537rRHoP+d5NUukSuGhU5N+qi+/kuxO/YtMztNZWluKRGqHCVgZzWiLFchSN50d8VEFTtmqf9aYqTA2pNRFP27cEtTZ2VdhO71nzhERY4uPRnVqOvh4UcWkPIzcO/s6gTNubGlbCNg6QwfmyHJloGlUegC1GwJ+BIXu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338918; c=relaxed/simple;
	bh=fYkl94QEb1ALho8v0PxnjrLIwYg+9NBlW/B3pGxLm5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrfQFVcnE4bFVuTuwsUBhM42VQChYqjueoLd2hhCfJlhHZCtYy/39Yp4zl7XVVMbnkFCPVkEPUB16VZRG7tuRa0yZJiuf6Z1GA9s9HauAxpwu60OBhbBTU10iMXUgKvhhW8XJlLTXLwIF99IPrWKM0HOOW1/YYcBDeLNvvd+79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sy08VWAR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy08VWAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748338915; x=1779874915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYkl94QEb1ALho8v0PxnjrLIwYg+9NBlW/B3pGxLm5c=;
  b=Sy08VWARbF8WMSfxm+Hmz71ywEXWidc3XngLWz1illk8MEfTvP+44u8T
   2M6oTpT7lEJ+IdSC+EHPJcCutqiDzhERHba/Mma9PuUZgM+la9lVnfUrG
   aWNVDlK4hPdiUrgP6lyKnjEmG/28FNJlb6u544xmwoNF8vGL2gjJwEFe2
   61AEEzAqjQeBnguVTwq1m5NzVoYXe4dFVGa24L+xHtwsZ85TxlYgthPWb
   wWwn70OuTKzDjOP0oCM+iqU5YWjAHXzIaUx2viwQ7y+wnFiSqWkoEF09q
   xDAhcdT2r0mJgs+ZbavfKqckTEomL+ebbQQiNgHBPiM7v+uRP0N0FXbsP
   Q==;
X-CSE-ConnectionGUID: sQjlGJoMRu+Ae5xd/yi2qQ==
X-CSE-MsgGUID: kbtwkv4WToqzkBCdV8oeOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50430782"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="50430782"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 02:41:54 -0700
X-CSE-ConnectionGUID: ZnlmDMRWS06Xr0aezQk+ow==
X-CSE-MsgGUID: knpojbbkQE2MO9ElupVhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142735632"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 May 2025 02:41:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJqog-000T52-2q;
	Tue, 27 May 2025 09:41:50 +0000
Date: Tue, 27 May 2025 17:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Dege <michael.dege@renesas.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Dege <michael.dege@renesas.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add new step
 added to latest datasheet
Message-ID: <202505271711.WM48TTTI-lkp@intel.com>
References: <20250527-renesas-serdes-update-v2-2-ef17c71cd94c@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-renesas-serdes-update-v2-2-ef17c71cd94c@renesas.com>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on a5806cd506af5a7c19bcd596e4708b5c464bfd21]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Dege/phy-renesas-r8a779f0-ether-serdes-add-USXGMII-mode/20250527-150048
base:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
patch link:    https://lore.kernel.org/r/20250527-renesas-serdes-update-v2-2-ef17c71cd94c%40renesas.com
patch subject: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
config: arc-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271711.WM48TTTI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271711.WM48TTTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271711.WM48TTTI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/renesas/r8a779f0-ether-serdes.c: In function 'r8a779f0_eth_serdes_read32':
>> drivers/phy/renesas/r8a779f0-ether-serdes.c:54:25: error: 'RENESAS_ETH_SERDES_BANK_SELECT' undeclared (first use in this function); did you mean 'R8A779F0_ETH_SERDES_BANK_SELECT'?
      54 |  iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELECT);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         R8A779F0_ETH_SERDES_BANK_SELECT
   drivers/phy/renesas/r8a779f0-ether-serdes.c:54:25: note: each undeclared identifier is reported only once for each function it appears in


vim +54 drivers/phy/renesas/r8a779f0-ether-serdes.c

    51	
    52	static u32 r8a779f0_eth_serdes_read32(void __iomem *addr, u32 offs,  u32 bank)
    53	{
  > 54		iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELECT);
    55	
    56		return ioread32(addr + offs);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
