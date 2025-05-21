Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5214922173C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747855330; cv=none; b=pwjFZ5mKJW/32FcqC/G/BUmWtTmEPUD1mh/gf1hiW7dgei69FC232VROkeDpSVid1DNT9xvPx3Egz9Df0f4Vc3+jl+v8smwmKZ4Z/I3ENrl559tPuoVoKLsybFdRnfqTPcuP6hmOcWYaAnPVPr2iRuxRRqwz6xA5XnZvZmqxZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747855330; c=relaxed/simple;
	bh=7oINp/6tHsS+Axhm3mAmmJmrnhDgIHOQCrIEoAdt2mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmPCLM8WTLEG489T8cmzuwmOkiwnPyla2A68RQtg5izYeI+eu322u+v05NzG9NB0Gl/eqgKbDytw+MAetTHKcIxAV7vmHUWZf/skhzfns07P9MD02tniQb58+jaHzIbT10K5BCe9CLUMByevbrOt7V2WHwyXzCP3TD55B1gwajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpwI6Rrw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpwI6Rrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747855328; x=1779391328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7oINp/6tHsS+Axhm3mAmmJmrnhDgIHOQCrIEoAdt2mY=;
  b=LpwI6RrwmCbuPFlhgwBjvmVsUVmbFNfG6tQzcxiGwnIGmMzrhXwOh8FZ
   jHwKtU14bsjla72xZ+4kIUt5vvTUQdclLR0byz/brLKIQNXCArh+P+zJ4
   1my3EbUAygtA4yv0QvWp4ka1MNtMTQn9NFOx4PCgj/swkV86LS//U41cW
   +bGcoF/P+9ZCYKGBFgL9E04qTVcoFjF4NsfGbBxhdyVsKMOQTMQi9NluL
   CnCB5vWiN94k2EmgV3SPHfrTYAStGQ6SX6TDiL0FKSKoIWRrr9SwB9+2+
   8h7S/B6ZCXlF79/+SYykpVWuz8gyf0UgSeKV0R50PutH1KXx25ft+8QYn
   A==;
X-CSE-ConnectionGUID: pMYGveXQRPKvarfoCsbYXA==
X-CSE-MsgGUID: EVLZAMBHSEW4V+T14+mEfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60092157"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60092157"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 12:22:07 -0700
X-CSE-ConnectionGUID: VuzLRn53SMG60lEBk1yKzQ==
X-CSE-MsgGUID: jd/0HpCWTOqh08tUL6f1jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141118044"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2025 12:22:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHp0t-000OY0-2p;
	Wed, 21 May 2025 19:22:03 +0000
Date: Thu, 22 May 2025 03:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Donny-Dev <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Donny-Dev <donnyturizo13@gmail.com>
Subject: Re: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case
 style in core files
Message-ID: <202505220306.OiXLGnOS-lkp@intel.com>
References: <20250521000150.11659-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521000150.11659-1-donnyturizo13@gmail.com>

Hi Donny-Dev,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donny-Dev/drivers-staging-rtl8723bs-Fix-camelCase-to-snake_case-style-in-core-files/20250521-080425
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250521000150.11659-1-donnyturizo13%40gmail.com
patch subject: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250522/202505220306.OiXLGnOS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220306.OiXLGnOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220306.OiXLGnOS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/rtl8723bs/include/drv_types.h:29,
                    from drivers/staging/rtl8723bs/core/rtw_cmd.c:7:
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:12:23: error: '_read_macreg_CMD_' undeclared here (not in a function); did you mean '_Read_MACREG_CMD_'?
      12 |         {GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
         |                       ^~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:554:33: note: in definition of macro 'GEN_CMD_CODE'
     554 | #define GEN_CMD_CODE(cmd)       cmd ## _CMD_
         |                                 ^~~
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:13:23: error: '_write_macreg_CMD_' undeclared here (not in a function); did you mean '_Write_MACREG_CMD_'?
      13 |         {GEN_CMD_CODE(_write_macreg), NULL},
         |                       ^~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:554:33: note: in definition of macro 'GEN_CMD_CODE'
     554 | #define GEN_CMD_CODE(cmd)       cmd ## _CMD_
         |                                 ^~~


vim +12 drivers/staging/rtl8723bs/core/rtw_cmd.c

    10	
    11	static struct _cmd_callback rtw_cmd_callback[] = {
  > 12		{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
  > 13		{GEN_CMD_CODE(_write_macreg), NULL},
    14		{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
    15		{GEN_CMD_CODE(_Write_BBREG), NULL},
    16		{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
    17		{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
    18		{GEN_CMD_CODE(_Read_EEPROM), NULL},
    19		{GEN_CMD_CODE(_Write_EEPROM), NULL},
    20		{GEN_CMD_CODE(_Read_EFUSE), NULL},
    21		{GEN_CMD_CODE(_Write_EFUSE), NULL},
    22	
    23		{GEN_CMD_CODE(_Read_CAM),	NULL},	/*10*/
    24		{GEN_CMD_CODE(_Write_CAM),	 NULL},
    25		{GEN_CMD_CODE(_setBCNITV), NULL},
    26		{GEN_CMD_CODE(_setMBIDCFG), NULL},
    27		{GEN_CMD_CODE(_JoinBss), &rtw_joinbss_cmd_callback},  /*14*/
    28		{GEN_CMD_CODE(_DisConnect), &rtw_disassoc_cmd_callback}, /*15*/
    29		{GEN_CMD_CODE(_CreateBss), &rtw_createbss_cmd_callback},
    30		{GEN_CMD_CODE(_SetOpMode), NULL},
    31		{GEN_CMD_CODE(_SiteSurvey), &rtw_survey_cmd_callback}, /*18*/
    32		{GEN_CMD_CODE(_SetAuth), NULL},
    33	
    34		{GEN_CMD_CODE(_SetKey), NULL},	/*20*/
    35		{GEN_CMD_CODE(_SetStaKey), &rtw_setstaKey_cmdrsp_callback},
    36		{GEN_CMD_CODE(_SetAssocSta), &rtw_setassocsta_cmdrsp_callback},
    37		{GEN_CMD_CODE(_DelAssocSta), NULL},
    38		{GEN_CMD_CODE(_SetStaPwrState), NULL},
    39		{GEN_CMD_CODE(_SetBasicRate), NULL}, /*25*/
    40		{GEN_CMD_CODE(_GetBasicRate), NULL},
    41		{GEN_CMD_CODE(_SetDataRate), NULL},
    42		{GEN_CMD_CODE(_GetDataRate), NULL},
    43		{GEN_CMD_CODE(_SetPhyInfo), NULL},
    44	
    45		{GEN_CMD_CODE(_GetPhyInfo), NULL}, /*30*/
    46		{GEN_CMD_CODE(_SetPhy), NULL},
    47		{GEN_CMD_CODE(_GetPhy), NULL},
    48		{GEN_CMD_CODE(_readRssi), NULL},
    49		{GEN_CMD_CODE(_readGain), NULL},
    50		{GEN_CMD_CODE(_SetAtim), NULL}, /*35*/
    51		{GEN_CMD_CODE(_SetPwrMode), NULL},
    52		{GEN_CMD_CODE(_JoinbssRpt), NULL},
    53		{GEN_CMD_CODE(_SetRaTable), NULL},
    54		{GEN_CMD_CODE(_GetRaTable), NULL},
    55	
    56		{GEN_CMD_CODE(_GetCCXReport), NULL}, /*40*/
    57		{GEN_CMD_CODE(_GetDTMReport),	NULL},
    58		{GEN_CMD_CODE(_GetTXRateStatistics), NULL},
    59		{GEN_CMD_CODE(_SetUsbSuspend), NULL},
    60		{GEN_CMD_CODE(_SetH2cLbk), NULL},
    61		{GEN_CMD_CODE(_AddBAReq), NULL}, /*45*/
    62		{GEN_CMD_CODE(_SetChannel), NULL},		/*46*/
    63		{GEN_CMD_CODE(_SetTxPower), NULL},
    64		{GEN_CMD_CODE(_SwitchAntenna), NULL},
    65		{GEN_CMD_CODE(_SetCrystalCap), NULL},
    66		{GEN_CMD_CODE(_SetSingleCarrierTx), NULL},	/*50*/
    67	
    68		{GEN_CMD_CODE(_SetSingleToneTx), NULL}, /*51*/
    69		{GEN_CMD_CODE(_SetCarrierSuppressionTx), NULL},
    70		{GEN_CMD_CODE(_SetContinuousTx), NULL},
    71		{GEN_CMD_CODE(_SwitchBandwidth), NULL},		/*54*/
    72		{GEN_CMD_CODE(_TX_Beacon), NULL},/*55*/
    73	
    74		{GEN_CMD_CODE(_Set_MLME_EVT), NULL},/*56*/
    75		{GEN_CMD_CODE(_Set_Drv_Extra), NULL},/*57*/
    76		{GEN_CMD_CODE(_Set_H2C_MSG), NULL},/*58*/
    77		{GEN_CMD_CODE(_SetChannelPlan), NULL},/*59*/
    78	
    79		{GEN_CMD_CODE(_SetChannelSwitch), NULL},/*60*/
    80		{GEN_CMD_CODE(_TDLS), NULL},/*61*/
    81		{GEN_CMD_CODE(_ChkBMCSleepq), NULL}, /*62*/
    82	
    83		{GEN_CMD_CODE(_RunInThreadCMD), NULL},/*63*/
    84	};
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
