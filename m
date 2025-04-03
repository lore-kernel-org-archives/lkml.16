Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566FCB666
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 02:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743647779; cv=none; b=JVgxNbtLFM1WlGeVPYm+ssiE7QKeAgp+IEnbiVDO0cK+kuB/tnhW4k/Y+ZkOsfqvQKe0wSSbiVYOC2gBpJgeiYtD0ZxdMy2vPjbQ6pwAEXqOH3nJIoVDJs+JbA08yQzXdoHRhQNjA9bFFwtkzXMQ/QidrKS94U9xOTHGYwyO8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743647779; c=relaxed/simple;
	bh=NZBuTBYfIwLshdQDTbcROAiQdSt6dnB12ilYyCOQhL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhGpVlbvja+JoMrEvOi/jltqpcDLDt4e8+BGM3wYx6V21FC5SIG/m8wyuBCMBfo5pLAkrR3RSYWTafiJiILlLfK8sT6OvI0j+GkkWebBo5u2b1xpY3CjqgQePLyQS4bLrcVq8R4/hJcMBY9wlJGTreiGdgwixnJF0VEhi6ir2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhrN2AtP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhrN2AtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743647777; x=1775183777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NZBuTBYfIwLshdQDTbcROAiQdSt6dnB12ilYyCOQhL8=;
  b=FhrN2AtPZLoUszvH9HCk1yGflb37pYgjvuWVyjo8Sz6nE0Eu73TtgJAw
   xw7qtwXvyiowM0fc+754bZ+kPrWuLIMfZPWK6mnk3xt/6M52piV/gBInx
   SH8yTIUcD+YExkrOmxXB/H1UkvSjyNEeLBeXW3Qnwa9bBW01oiEFtsn1z
   FU7cUnaTwPIyoqPovnf8GCXmX8RPhf6cx01JK+BjE7ii+yLIvA3PI+bkh
   zO9S5l1vzxnQrX7q9vCaqtBCmSpMNlGn5s9JnLfmuYOTTxlCYYrFJ41IQ
   SQCy448xnphgCBdHynaDcr3p8M2mHoIYh7VPHoW5PxTKhGu8j06N7/BgI
   g==;
X-CSE-ConnectionGUID: WTUkjsETTKG3vJySIH8kfA==
X-CSE-MsgGUID: Zu/RKN/iTqe8SJEcdAFXHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45137213"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45137213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:36:17 -0700
X-CSE-ConnectionGUID: V8R3s9rmT/iw0v9OBTeU7w==
X-CSE-MsgGUID: RO4mmT0+Tv6uFP43y6mfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126634125"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 19:36:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0ARA-000BAu-1E;
	Thu, 03 Apr 2025 02:36:12 +0000
Date: Thu, 3 Apr 2025 10:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
Message-ID: <202504031009.mcD22ETY-lkp@intel.com>
References: <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>

Hi Abraham,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Abraham-Samuel-Adekunle/staging-rtl8723bs-correct-coding-style-by-preventing-lines-from-ending-with/20250328-204628
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50%40gmail.com
patch subject: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply with kernel naming convention
config: i386-randconfig-063-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031009.mcD22ETY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031009.mcD22ETY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031009.mcD22ETY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:13:4: sparse: sparse: symbol 'fake_efuse_bank' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:14:5: sparse: sparse: symbol 'fake_efuse_used_bytes' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:15:4: sparse: sparse: symbol 'fake_efuse_content' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:16:4: sparse: sparse: symbol 'fake_efuse_init_map' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:17:4: sparse: sparse: symbol 'fake_efuse_modified_map' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:19:5: sparse: sparse: symbol 'bte_fuse_used_bytes' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:20:4: sparse: sparse: symbol 'bte_fuse_content' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:21:4: sparse: sparse: symbol 'bte_use_init_map' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:22:4: sparse: sparse: symbol 'bte_use_modified_map' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:24:5: sparse: sparse: symbol 'fakebte_fuse_used_bytes' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:25:4: sparse: sparse: symbol 'fakebte_fuse_content' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:26:4: sparse: sparse: symbol 'fakebte_use_init_map' was not declared. Should it be static?
>> drivers/staging/rtl8723bs/core/rtw_efuse.c:27:4: sparse: sparse: symbol 'fakebte_use_modified_map' was not declared. Should it be static?

vim +/fake_efuse_bank +13 drivers/staging/rtl8723bs/core/rtw_efuse.c

    10	
    11	
    12	/* Define global variables */
  > 13	u8 fake_efuse_bank;
  > 14	u32 fake_efuse_used_bytes;
  > 15	u8 fake_efuse_content[EFUSE_MAX_HW_SIZE] = {0};
  > 16	u8 fake_efuse_init_map[EFUSE_MAX_MAP_LEN] = {0};
  > 17	u8 fake_efuse_modified_map[EFUSE_MAX_MAP_LEN] = {0};
    18	
  > 19	u32 bte_fuse_used_bytes;
  > 20	u8 bte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
  > 21	u8 bte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
  > 22	u8 bte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
    23	
  > 24	u32 fakebte_fuse_used_bytes;
  > 25	u8 fakebte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
  > 26	u8 fakebte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
  > 27	u8 fakebte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
