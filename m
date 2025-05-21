Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710E27C17F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834401; cv=none; b=ppawX4Ejx0GuS7EoD2XgJ0tI5LyOfA8BfTzIWGhRtqjc9IfCX621CNcHTzPcLAzusTEvFn2aImQePHUH4MnHUIekuczvZEFn8fytMAkFztAizjB+v6Sw8On9wzlRdQ+WoLm1hZylJoCJy4sJ4vpHTBVWo38eyHgwz3dct1MpV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834401; c=relaxed/simple;
	bh=CZW/edTbhyFW8UMmT161zCSkBIgSRiqy+Oud/aJFEXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5qHxDrCaU0VycRgrKH7sFw7aHT5Z88FaXeFc1ULTtEmCLa3LojW32+RCbKAaVAqaR2W0f0ufg8UNV1zRLCw+jTgL+aBN9DUoy7+upA2zhGpEsNZqU7Z7tpuC44qRPhSczaYC5rzPXhLu4DTxhnSwxuNltVFa2nlD03iWHaf/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcSHBICn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcSHBICn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747834400; x=1779370400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZW/edTbhyFW8UMmT161zCSkBIgSRiqy+Oud/aJFEXs=;
  b=XcSHBICne1ytlJmXW0d9OkZL9MnwckF5HEkLvz1bPbjSX4pOZq8MXCs1
   QqzaQYe2emzy7JLWa06uBqQrfgUMgkNBXVVOYZiAMuXFZvmVQMLeMm5Cs
   RvPoBZJ9pa2EabV/TIA9EgVzhA1Lm2+6Zf2i87nvGUf00ChIwrECLEdYH
   mmLRmIID/69cWO6pldNal8G0wuGqXvPe9qVAPOScw4112+R5uzl7+QSVW
   BuOhRVc/jLNujYXmmXA3XWL3IZvqJ4yWzPBZaYYLg6NcpnBS6RGAR+Mmk
   i2iYAH9jAdiqBUn706TcQ/nWBCjTTF8YfOnC2T+ntR69QSHQ2JQnFUSZ+
   w==;
X-CSE-ConnectionGUID: e3OnHgtkTYSWAMNEEIp5Dw==
X-CSE-MsgGUID: 06DQKmsgRXCeJZPFDLPZKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="48930591"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="48930591"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:33:19 -0700
X-CSE-ConnectionGUID: rPPgbf4bQ269lFrmIi120Q==
X-CSE-MsgGUID: pCfzpEUZT6uZUYigNcQIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144810186"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 06:33:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHjZ7-000OJA-0t;
	Wed, 21 May 2025 13:33:01 +0000
Date: Wed, 21 May 2025 21:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Donny-Dev <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Donny-Dev <donnyturizo13@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Fix typo in variable name
 'ips_deffer_ms'
Message-ID: <202505212120.fuBu3jP5-lkp@intel.com>
References: <20250521011358.12910-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521011358.12910-1-donnyturizo13@gmail.com>

Hi Donny-Dev,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Donny-Dev/staging-rtl8723bs-Fix-typo-in-variable-name-ips_deffer_ms/20250521-091609
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250521011358.12910-1-donnyturizo13%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250521/202505212120.fuBu3jP5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212120.fuBu3jP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212120.fuBu3jP5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c: In function '_rtw_pwr_wakeup':
>> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:1078:48: error: 'ips_deffer_ms' undeclared (first use in this function); did you mean 'ips_defer_ms'?
    1078 |         deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
         |                                                ^~~~~~~~~~~~~
         |                                                ips_defer_ms
   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:1078:48: note: each undeclared identifier is reported only once for each function it appears in


vim +1078 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c

554c0a3abf216c9 Hans de Goede          2017-03-29  1014  
fccab3afea6e474 Donny-Dev              2025-05-21  1015  int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_defer_ms, const char *caller)
554c0a3abf216c9 Hans de Goede          2017-03-29  1016  {
554c0a3abf216c9 Hans de Goede          2017-03-29  1017  	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
554c0a3abf216c9 Hans de Goede          2017-03-29  1018  	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
554c0a3abf216c9 Hans de Goede          2017-03-29  1019  	struct mlme_priv *pmlmepriv;
554c0a3abf216c9 Hans de Goede          2017-03-29  1020  	int ret = _SUCCESS;
554c0a3abf216c9 Hans de Goede          2017-03-29  1021  	unsigned long start = jiffies;
fccab3afea6e474 Donny-Dev              2025-05-21  1022  	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_defer_ms);
554c0a3abf216c9 Hans de Goede          2017-03-29  1023  
554c0a3abf216c9 Hans de Goede          2017-03-29  1024  	/* for LPS */
554c0a3abf216c9 Hans de Goede          2017-03-29  1025  	LeaveAllPowerSaveMode(padapter);
554c0a3abf216c9 Hans de Goede          2017-03-29  1026  
554c0a3abf216c9 Hans de Goede          2017-03-29  1027  	/* IPS still bound with primary adapter */
554c0a3abf216c9 Hans de Goede          2017-03-29  1028  	padapter = GET_PRIMARY_ADAPTER(padapter);
554c0a3abf216c9 Hans de Goede          2017-03-29  1029  	pmlmepriv = &padapter->mlmepriv;
554c0a3abf216c9 Hans de Goede          2017-03-29  1030  
554c0a3abf216c9 Hans de Goede          2017-03-29  1031  	if (time_before(pwrpriv->ips_deny_time, deny_time))
554c0a3abf216c9 Hans de Goede          2017-03-29  1032  		pwrpriv->ips_deny_time = deny_time;
554c0a3abf216c9 Hans de Goede          2017-03-29  1033  
554c0a3abf216c9 Hans de Goede          2017-03-29  1034  
709c8e49b51c370 Fabio Aiuto            2021-04-07  1035  	if (pwrpriv->ps_processing)
554c0a3abf216c9 Hans de Goede          2017-03-29  1036  		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
8204b61a775879a Jia-Ju Bai             2018-09-15  1037  			mdelay(10);
554c0a3abf216c9 Hans de Goede          2017-03-29  1038  
709c8e49b51c370 Fabio Aiuto            2021-04-07  1039  	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend)
8ec06b9ff8a4f5e Ross Schmidt           2020-11-09  1040  		while (pwrpriv->bInSuspend && jiffies_to_msecs(jiffies - start) <= 3000
709c8e49b51c370 Fabio Aiuto            2021-04-07  1041  		)
8204b61a775879a Jia-Ju Bai             2018-09-15  1042  			mdelay(10);
554c0a3abf216c9 Hans de Goede          2017-03-29  1043  
554c0a3abf216c9 Hans de Goede          2017-03-29  1044  	/* System suspend is not allowed to wakeup */
2e20a5ac67f8a58 Nishka Dasgupta        2019-07-25  1045  	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1046  		ret = _FAIL;
554c0a3abf216c9 Hans de Goede          2017-03-29  1047  		goto exit;
554c0a3abf216c9 Hans de Goede          2017-03-29  1048  	}
554c0a3abf216c9 Hans de Goede          2017-03-29  1049  
554c0a3abf216c9 Hans de Goede          2017-03-29  1050  	/* block??? */
2e20a5ac67f8a58 Nishka Dasgupta        2019-07-25  1051  	if (pwrpriv->bInternalAutoSuspend  && padapter->net_closed) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1052  		ret = _FAIL;
554c0a3abf216c9 Hans de Goede          2017-03-29  1053  		goto exit;
554c0a3abf216c9 Hans de Goede          2017-03-29  1054  	}
554c0a3abf216c9 Hans de Goede          2017-03-29  1055  
554c0a3abf216c9 Hans de Goede          2017-03-29  1056  	/* I think this should be check in IPS, LPS, autosuspend functions... */
2e20a5ac67f8a58 Nishka Dasgupta        2019-07-25  1057  	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1058  		ret = _SUCCESS;
554c0a3abf216c9 Hans de Goede          2017-03-29  1059  		goto exit;
554c0a3abf216c9 Hans de Goede          2017-03-29  1060  	}
554c0a3abf216c9 Hans de Goede          2017-03-29  1061  
554c0a3abf216c9 Hans de Goede          2017-03-29  1062  	if (rf_off == pwrpriv->rf_pwrstate) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1063  		{
bc21df678b4d5da Zhansaya Bagdauletkyzy 2021-04-06  1064  			if (ips_leave(padapter) == _FAIL) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1065  				ret = _FAIL;
554c0a3abf216c9 Hans de Goede          2017-03-29  1066  				goto exit;
554c0a3abf216c9 Hans de Goede          2017-03-29  1067  			}
554c0a3abf216c9 Hans de Goede          2017-03-29  1068  		}
554c0a3abf216c9 Hans de Goede          2017-03-29  1069  	}
554c0a3abf216c9 Hans de Goede          2017-03-29  1070  
554c0a3abf216c9 Hans de Goede          2017-03-29  1071  	/* TODO: the following checking need to be merged... */
8ec06b9ff8a4f5e Ross Schmidt           2020-11-09  1072  	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
554c0a3abf216c9 Hans de Goede          2017-03-29  1073  		ret = false;
554c0a3abf216c9 Hans de Goede          2017-03-29  1074  		goto exit;
554c0a3abf216c9 Hans de Goede          2017-03-29  1075  	}
554c0a3abf216c9 Hans de Goede          2017-03-29  1076  
554c0a3abf216c9 Hans de Goede          2017-03-29  1077  exit:
554c0a3abf216c9 Hans de Goede          2017-03-29 @1078  	deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
554c0a3abf216c9 Hans de Goede          2017-03-29  1079  	if (time_before(pwrpriv->ips_deny_time, deny_time))
554c0a3abf216c9 Hans de Goede          2017-03-29  1080  		pwrpriv->ips_deny_time = deny_time;
554c0a3abf216c9 Hans de Goede          2017-03-29  1081  	return ret;
554c0a3abf216c9 Hans de Goede          2017-03-29  1082  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
