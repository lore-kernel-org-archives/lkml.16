Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA741F7089
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781961; cv=none; b=WCW5NUnDh185QBQZ017s5yX2de1dwi+eMHazWFb4JkovaASzy3hYRO3q2+BMZe0gFKILxatUs8M5PIf2qQvrZlKNi8PPddIOP5SYJHfMQUgGMudAd1IPXJ8qe39r1THfovhO98AxpkmWik5nVdDrYUW3MHRB1NbG8NpT4/cFW0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781961; c=relaxed/simple;
	bh=tLRjeNm3Sp+VIbaFEFA1cn56qdH8vBzWktqZzoueS18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbERPCfcdEPJufsB059EbTHUW7QlD+I4oPKxzbihVRAWS9jhM4e/yl8En8WBtjFfaipkxA9KulvNb/z97zDgs0xpk05XIJPTcYEtgAJGeGtgmZR5sFDRS6iMGNtbTf3dIcGhpDfcpCW0UqaUTdimhPhmLLBu6vxvT7xtssCuV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE46X89S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE46X89S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743781960; x=1775317960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLRjeNm3Sp+VIbaFEFA1cn56qdH8vBzWktqZzoueS18=;
  b=QE46X89Sf8KGR+OluQyng+CN/fUgO/ZZZjurkoJ8jOWxzf4HFxUJ+DC8
   jntYXgVnGBfAnKGIGNPgVrEWKGOFN9oppcILCaf7jRRvONJEKwhhH4gIw
   qA+EoC2f9vz0cNDfaFytLLjygdQfqEkcKTXR/qKTxuZPqjvQGBte/FgYf
   x+fimd0twuvL/AYgKR6d4KBrH+5A24PnBMcfKo/2G8emaPPjwPgDXqtGj
   4ZoCy4iP4mZaHgQ2uM1y16KnQGGr/r9F8iRB26kn+k534c1xrD9pAOfQP
   PPNEW9II8nouaDRlxH99vuCVFhurNG4Ckd9QkH3kgVf/yNlQw0He70zNZ
   g==;
X-CSE-ConnectionGUID: oJSs5ov3RZKupnvGht26EA==
X-CSE-MsgGUID: euEpAe6zQxGiQuRAgwwawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67698346"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="67698346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 08:52:39 -0700
X-CSE-ConnectionGUID: PyTGTkVYRLWjV/GY60lRDw==
X-CSE-MsgGUID: tRT3smCcTLGfe0LW12bUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127860931"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 08:52:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0jLO-0001Lv-0v;
	Fri, 04 Apr 2025 15:52:34 +0000
Date: Fri, 4 Apr 2025 23:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <202504042334.1pXFeKzN-lkp@intel.com>
References: <20250403093741.2372-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403093741.2372-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/staging-rtl8723bs-Add-error-handling-for-sd_read/20250403-174101
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250403093741.2372-1-vulab%40iscas.ac.cn
patch subject: [PATCH] staging: rtl8723bs: Add error handling for sd_read().
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250404/202504042334.1pXFeKzN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504042334.1pXFeKzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042334.1pXFeKzN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/hal/sdio_ops.c:189:7: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     189 |                 if (!err) {
         |                     ^~~~
   drivers/staging/rtl8723bs/hal/sdio_ops.c:196:9: note: uninitialized use occurs here
     196 |         return val;
         |                ^~~
   drivers/staging/rtl8723bs/hal/sdio_ops.c:189:3: note: remove the 'if' if its condition is always true
     189 |                 if (!err) {
         |                 ^~~~~~~~~
   drivers/staging/rtl8723bs/hal/sdio_ops.c:159:9: note: initialize the variable 'val' to silence this warning
     159 |         u32 val;
         |                ^
         |                 = 0
   1 warning generated.


vim +189 drivers/staging/rtl8723bs/hal/sdio_ops.c

   150	
   151	static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
   152	{
   153		struct adapter *adapter;
   154		u8 mac_pwr_ctrl_on;
   155		u8 device_id;
   156		u16 offset;
   157		u32 ftaddr;
   158		u8 shift;
   159		u32 val;
   160		s32 __maybe_unused err;
   161		__le32 le_tmp;
   162	
   163		adapter = intfhdl->padapter;
   164		ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
   165	
   166		rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
   167		if (
   168			((device_id == WLAN_IOREG_DEVICE_ID) && (offset < 0x100)) ||
   169			(!mac_pwr_ctrl_on) ||
   170			(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
   171		) {
   172			err = sd_cmd52_read(intfhdl, ftaddr, 4, (u8 *)&le_tmp);
   173			return le32_to_cpu(le_tmp);
   174		}
   175	
   176		/*  4 bytes alignment */
   177		shift = ftaddr & 0x3;
   178		if (shift == 0) {
   179			val = sd_read32(intfhdl, ftaddr, NULL);
   180		} else {
   181			u8 *tmpbuf;
   182	
   183			tmpbuf = rtw_malloc(8);
   184			if (!tmpbuf)
   185				return SDIO_ERR_VAL32;
   186	
   187			ftaddr &= ~(u16)0x3;
   188			err = sd_read(intfhdl, ftaddr, 8, tmpbuf);
 > 189			if (!err) {
   190				memcpy(&le_tmp, tmpbuf + shift, 4);
   191				val = le32_to_cpu(le_tmp);
   192			}
   193	
   194			kfree(tmpbuf);
   195		}
   196		return val;
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
