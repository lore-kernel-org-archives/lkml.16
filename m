Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB3200B99
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034908; cv=none; b=EzO6gsC1k4WaGMUll0tu9wrLTDnUQlaxfSqeaAVaVbcbz0/HyhV0tN6RYOf0j5jQp6h2HxPp/HVZDwwFcFw2SNHw19eEZNf6CBZ1aWRiNEZF0CmXRHREuH9aQIzGM83aeKZ1PVS8tmSMNNn2Zhao1BRkUtE6mHZCApgE1zljY4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034908; c=relaxed/simple;
	bh=ubu53MA0qQJpJ9knh2ETXZj1I5JdH8FHWFKt0Vz40l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9caJdmafUQIQwq+wIynUxZP+OnY8oTveMzrM7Owvmv0eb8UpqB/nt1E+9vUmf2jgIRq/CRTp1UNFMqLkbJHH9SXeWt62f3arbHWv2yn97np91nJJB0c6cMC056hbhHmJlzoUkViDaraIxgurt433lQZdwU/i0u4/xstw4aD7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgmy3Vzg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgmy3Vzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749034906; x=1780570906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ubu53MA0qQJpJ9knh2ETXZj1I5JdH8FHWFKt0Vz40l8=;
  b=lgmy3VzgrJPRPTQiC34VITEEG6keU0XzHnS4IUWSmhrS01MEpK6LG/04
   9j49xI2WkXTpRxVscbSNauknG47+1fkDsWn0msGH8WbkQ1piMmQzf+7C/
   ntQeyBLTGi0sqLR1nh9lsl5aFj4O2ig9lZY3wp6zqFrbWXp0iYw1qQsS/
   A5pW7XYJT8TIOOb5HeDfeql2N7Ra6VHYyGA5eDlCUycZS/gs+LRENg4l9
   9lPgKmjYoqpJ25STpOrfWgSQ4uqp1yTBT+CnRgVWnRxkb40P510iwNMel
   4ydj5U0OL79CeXzAwy+qU8vLIetAXwHNtHT753dkMSB3CVi7uOQTahSXs
   Q==;
X-CSE-ConnectionGUID: 1HqpvjA9RZewuQprC/zl4w==
X-CSE-MsgGUID: Xncv0Ui0Th6iUuwTP/iBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62466526"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="62466526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:01:46 -0700
X-CSE-ConnectionGUID: j5x+btOfQge2qUoGt1jn6w==
X-CSE-MsgGUID: 4NJtS36gR6eI1rB7XOf2YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="148991966"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 04:01:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMlsH-00034P-0g;
	Wed, 04 Jun 2025 11:01:37 +0000
Date: Wed, 4 Jun 2025 19:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Donny Turizo <donnyturizo13@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: Fix camelCase to snake_case style
 in core files
Message-ID: <202506041853.5ZvDpouT-lkp@intel.com>
References: <20250525064426.9662-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525064426.9662-1-donnyturizo13@gmail.com>

Hi Donny,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Donny-Turizo/staging-rtl8723bs-Fix-camelCase-to-snake_case-style-in-core-files/20250525-144506
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250525064426.9662-1-donnyturizo13%40gmail.com
patch subject: [PATCH v4] staging: rtl8723bs: Fix camelCase to snake_case style in core files
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250604/202506041853.5ZvDpouT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041853.5ZvDpouT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041853.5ZvDpouT-lkp@intel.com/

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
