Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D8339A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053833; cv=none; b=cvH5slxrEm+AP7tI+6HnhnlTG2718+nhcMYC9KmQPVGDucHVnzNxnjDIqHPbJCXENeNsqbuz2JrICfmGboQVGP0MJZ7Kl26/qRZsY/8Y+GqTC43/2AuzE9YkPU/6SQ1Xb7/APVreiYAvX4+tVz1lIh/OPp138dqP99XZ89+ef50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053833; c=relaxed/simple;
	bh=NRKNdkhiCm3Mg2VKiD37TR2Pp5nvR2AWfzrXscNez5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qede1huRvLovFOJAbEBNRX6UpE8hAHlEJJ5TMYZ1Fj8ztr390gbxRa30htaqLHWDXI5sw3z+ajCVpF88JVDnU1whBtHWNoqkcfbpJtr23mg245Oof0p4VibWovhq9JoPxjszXfWGElgV4gvroazgEhC2FEzvtqQNamiBYgNUBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cd0lJAhb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cd0lJAhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749053831; x=1780589831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRKNdkhiCm3Mg2VKiD37TR2Pp5nvR2AWfzrXscNez5E=;
  b=cd0lJAhbtW9pE4hj9VvQhBPoK7D8R7tPlsO9+DWgqAbuBhyhtmnbWcC+
   P0PizwDVmZzOrJniHc57BK9gqmblarb+cgzujbzQmeTN/FwSZK+efHeG4
   hXo5eadLviCEF+nOkNO78I7DjZbEdeUr7Dy5gynRps0YstKtXSTDyFc7F
   1nq9OaMV+N4n6Od9jNMNYzyGmFgDG99gxSmegbCefrfGXGkq4i8q2/3NE
   VH1rp5KhCdfUPk+tiuH+BFXRuFBbs2K1ngtkhcK4zUG7/ktwFSN8y96jG
   j0QeigqHy0VDIg8BqHYX+d59g1xtcmB1GtTJxPg4YhLgYLDkjDoEmimzB
   w==;
X-CSE-ConnectionGUID: 7v+zi+GuSyC4pf4Gc0c5og==
X-CSE-MsgGUID: 9c9qZC3ST5a4n+tZ34vWnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50261826"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50261826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 09:17:10 -0700
X-CSE-ConnectionGUID: VvzPzS8YTaO3fVliUioZRQ==
X-CSE-MsgGUID: ZJbG3SLUR7m33B7xCLoViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="146173900"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2025 09:17:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMqnb-0003IF-09;
	Wed, 04 Jun 2025 16:17:07 +0000
Date: Thu, 5 Jun 2025 00:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Donny Turizo <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Fix typo in variable name
 'ips_deffer_ms'
Message-ID: <202506050029.f8Llelhe-lkp@intel.com>
References: <20250522211626.4931-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522211626.4931-1-donnyturizo13@gmail.com>

Hi Donny,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Donny-Turizo/staging-rtl8723bs-Fix-typo-in-variable-name-ips_deffer_ms/20250523-052530
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250522211626.4931-1-donnyturizo13%40gmail.com
patch subject: [PATCH v3] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20250605/202506050029.f8Llelhe-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050029.f8Llelhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050029.f8Llelhe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c: In function '_rtw_pwr_wakeup':
>> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:1076:48: error: 'ips_deffer_ms' undeclared (first use in this function); did you mean 'ips_defer_ms'?
    1076 |         deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
         |                                                ^~~~~~~~~~~~~
         |                                                ips_defer_ms
   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:1076:48: note: each undeclared identifier is reported only once for each function it appears in


vim +1076 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c

554c0a3abf216c Hans de Goede          2017-03-29  1012  
3a0e883f688e25 Donny Turizo           2025-05-22  1013  int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_defer_ms, const char *caller)
554c0a3abf216c Hans de Goede          2017-03-29  1014  {
554c0a3abf216c Hans de Goede          2017-03-29  1015  	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
554c0a3abf216c Hans de Goede          2017-03-29  1016  	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
554c0a3abf216c Hans de Goede          2017-03-29  1017  	struct mlme_priv *pmlmepriv;
554c0a3abf216c Hans de Goede          2017-03-29  1018  	int ret = _SUCCESS;
554c0a3abf216c Hans de Goede          2017-03-29  1019  	unsigned long start = jiffies;
3a0e883f688e25 Donny Turizo           2025-05-22  1020  	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_defer_ms);
554c0a3abf216c Hans de Goede          2017-03-29  1021  
554c0a3abf216c Hans de Goede          2017-03-29  1022  	/* for LPS */
554c0a3abf216c Hans de Goede          2017-03-29  1023  	LeaveAllPowerSaveMode(padapter);
554c0a3abf216c Hans de Goede          2017-03-29  1024  
554c0a3abf216c Hans de Goede          2017-03-29  1025  	/* IPS still bound with primary adapter */
554c0a3abf216c Hans de Goede          2017-03-29  1026  	padapter = GET_PRIMARY_ADAPTER(padapter);
554c0a3abf216c Hans de Goede          2017-03-29  1027  	pmlmepriv = &padapter->mlmepriv;
554c0a3abf216c Hans de Goede          2017-03-29  1028  
554c0a3abf216c Hans de Goede          2017-03-29  1029  	if (time_before(pwrpriv->ips_deny_time, deny_time))
554c0a3abf216c Hans de Goede          2017-03-29  1030  		pwrpriv->ips_deny_time = deny_time;
554c0a3abf216c Hans de Goede          2017-03-29  1031  
554c0a3abf216c Hans de Goede          2017-03-29  1032  
709c8e49b51c37 Fabio Aiuto            2021-04-07  1033  	if (pwrpriv->ps_processing)
554c0a3abf216c Hans de Goede          2017-03-29  1034  		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
8204b61a775879 Jia-Ju Bai             2018-09-15  1035  			mdelay(10);
554c0a3abf216c Hans de Goede          2017-03-29  1036  
709c8e49b51c37 Fabio Aiuto            2021-04-07  1037  	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend)
8ec06b9ff8a4f5 Ross Schmidt           2020-11-09  1038  		while (pwrpriv->bInSuspend && jiffies_to_msecs(jiffies - start) <= 3000
709c8e49b51c37 Fabio Aiuto            2021-04-07  1039  		)
8204b61a775879 Jia-Ju Bai             2018-09-15  1040  			mdelay(10);
554c0a3abf216c Hans de Goede          2017-03-29  1041  
554c0a3abf216c Hans de Goede          2017-03-29  1042  	/* System suspend is not allowed to wakeup */
2e20a5ac67f8a5 Nishka Dasgupta        2019-07-25  1043  	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend) {
554c0a3abf216c Hans de Goede          2017-03-29  1044  		ret = _FAIL;
554c0a3abf216c Hans de Goede          2017-03-29  1045  		goto exit;
554c0a3abf216c Hans de Goede          2017-03-29  1046  	}
554c0a3abf216c Hans de Goede          2017-03-29  1047  
554c0a3abf216c Hans de Goede          2017-03-29  1048  	/* block??? */
2e20a5ac67f8a5 Nishka Dasgupta        2019-07-25  1049  	if (pwrpriv->bInternalAutoSuspend  && padapter->net_closed) {
554c0a3abf216c Hans de Goede          2017-03-29  1050  		ret = _FAIL;
554c0a3abf216c Hans de Goede          2017-03-29  1051  		goto exit;
554c0a3abf216c Hans de Goede          2017-03-29  1052  	}
554c0a3abf216c Hans de Goede          2017-03-29  1053  
554c0a3abf216c Hans de Goede          2017-03-29  1054  	/* I think this should be check in IPS, LPS, autosuspend functions... */
2e20a5ac67f8a5 Nishka Dasgupta        2019-07-25  1055  	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
554c0a3abf216c Hans de Goede          2017-03-29  1056  		ret = _SUCCESS;
554c0a3abf216c Hans de Goede          2017-03-29  1057  		goto exit;
554c0a3abf216c Hans de Goede          2017-03-29  1058  	}
554c0a3abf216c Hans de Goede          2017-03-29  1059  
554c0a3abf216c Hans de Goede          2017-03-29  1060  	if (rf_off == pwrpriv->rf_pwrstate) {
554c0a3abf216c Hans de Goede          2017-03-29  1061  		{
bc21df678b4d5d Zhansaya Bagdauletkyzy 2021-04-06  1062  			if (ips_leave(padapter) == _FAIL) {
554c0a3abf216c Hans de Goede          2017-03-29  1063  				ret = _FAIL;
554c0a3abf216c Hans de Goede          2017-03-29  1064  				goto exit;
554c0a3abf216c Hans de Goede          2017-03-29  1065  			}
554c0a3abf216c Hans de Goede          2017-03-29  1066  		}
554c0a3abf216c Hans de Goede          2017-03-29  1067  	}
554c0a3abf216c Hans de Goede          2017-03-29  1068  
554c0a3abf216c Hans de Goede          2017-03-29  1069  	/* TODO: the following checking need to be merged... */
8ec06b9ff8a4f5 Ross Schmidt           2020-11-09  1070  	if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
554c0a3abf216c Hans de Goede          2017-03-29  1071  		ret = false;
554c0a3abf216c Hans de Goede          2017-03-29  1072  		goto exit;
554c0a3abf216c Hans de Goede          2017-03-29  1073  	}
554c0a3abf216c Hans de Goede          2017-03-29  1074  
554c0a3abf216c Hans de Goede          2017-03-29  1075  exit:
554c0a3abf216c Hans de Goede          2017-03-29 @1076  	deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
554c0a3abf216c Hans de Goede          2017-03-29  1077  	if (time_before(pwrpriv->ips_deny_time, deny_time))
554c0a3abf216c Hans de Goede          2017-03-29  1078  		pwrpriv->ips_deny_time = deny_time;
554c0a3abf216c Hans de Goede          2017-03-29  1079  	return ret;
554c0a3abf216c Hans de Goede          2017-03-29  1080  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
