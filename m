Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A1BA27;
	Thu,  6 Feb 2025 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738801214; cv=fail; b=EBRuMz6fo1h+8GlrCv/pgupiaauFl4rmrH5KQUeyzRFePS2WJ8RJV2Ux/5EZFNQxbXIK5z4MYZ1sM9w9OgSOGo3TfxyTtofW4hnB8SNxxBvPQmBx3bH9BNk2HjMcz2b/sw/DFvNB57pbSe8QuNIWqZh0dD2LbeyESPpNolSuD4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738801214; c=relaxed/simple;
	bh=MrIBH0ullEqaMiBUX7iwpDWtO7Yh6jHZXXdYtONi/Tk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SQXV2BybuVNYGq62o8COjul2sdVSc01E0Cggb8t6ekKAYYmOMHsIcKE8+tKX08Uy/rubAgOszzTHVLlJldQT4GUPNxOnLnwX81tl9vbfxTZQ2ZxutB7H7IaPM8XeI51kGtAEJJIUxRKtVVmAc0jvDUkxWWSQpVGOjIBaiqgAFPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsR7IvGc; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsR7IvGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738801212; x=1770337212;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MrIBH0ullEqaMiBUX7iwpDWtO7Yh6jHZXXdYtONi/Tk=;
  b=jsR7IvGcdh/da0UBYCjqDusl9a53Tgj+OqkpPHyDiSfnya3uZlRfFxVk
   m07o/omI4B3tpVF2ZL90OZotK9H6BIQOXCeGTWP9BsCtgG/2EPwZ49U67
   71WmXZUP17wkMISNYB896GSOsuRMerS2Gy4tG9ydTiwbbgv8MnrgBH25K
   MZECw8AIB9JP8cCDLR0XwNO4qMYGvYJfWbH3CYgNXgV3RpJuuVQjMTwfT
   iRnKX7lcrOPYYe6zK2SifP30k1IL90h3Qm8LUlWKYN5zK47Ky8fll5+EX
   kLG+koGrRa4dKZKM46lFXjXsLHFf5cC7MRNirswVp6GMweSmaSae9z6rG
   Q==;
X-CSE-ConnectionGUID: 6q+z5fqGTxmOEcKDp1s/Fw==
X-CSE-MsgGUID: pkKTXa3CTQS2X0CMhKNqJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39418122"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39418122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 16:20:12 -0800
X-CSE-ConnectionGUID: vzIrbj9aTJ+Kw2PBuclb/w==
X-CSE-MsgGUID: 9VYHCINNR2qOZFR55OWU7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="116049316"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 16:20:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 16:20:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 16:20:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 16:20:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud+mKG65dONGT/oNGMyrl/6r8NIx3alBpAZlgEC/C2+K3gCYmRRjU10O2McFFU9P2B1Bv5nbqEeSSdRUlf4n/wjXj2inAm5oIGVBESFiNaFEwvlHXva4OPRLYpwrzBDYoTh9I+IIX0h/vwUqN0R6UagdJd+Gtz3TdNS8WLF30OBk+qpCbiPHtZmL/Y4inDeqhi4qQD8WW3Zn10UT8tjkgCZj9N1L1Rmbkmcy0nK48CZDPyfDx/6ebicW4o7AX2D+LO6ZxWtB30s+Dqxr7RROrE020TErbS4HhJRA+XZho3NWIwtPh6ecMughJqwoA0TFseGpPDk9Fu+QhuaxSUUCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuUxJ91/Vx3t2gK3SlHlptxf3yFy3HILejvVlPZS198=;
 b=jTauS777MdqGYd6x41hAARbznHaW9S2+2f2wmWkQd2JpEKnu2K15r07jgQtZCXT+bY7dhibrOh3/Veqtq+ALkVtyu9laXiMWpi2/pqUnuMLdAJwS+PfIV9ddVHCII8Ent845zSdkD5uBejMpYy+aiOraM9x6Kdjxj06d41PxA0lDf2CODDUGjxXrhIcHEex6NN0Lz9JgfALfJloJVRWJZ8ewq83qOYfw/P6PeMi24BUp5/SPtXEeND7A2AuNyTh2BrqP4DzT12dtxFs8wK+Lbf2dbNSCmUNV3lXU/hVAMhCIcePgj2JcDpocsBZ7cVTbJPlt5NS2ZkGwpGdQkNfEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 00:19:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 00:19:31 +0000
Message-ID: <bc963e40-46cd-42a2-95f0-a2e1a35cbc25@intel.com>
Date: Wed, 5 Feb 2025 16:19:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/23] x86/resctrl: Introduce interface to display
 number of free counters
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <f60eced8c7b81267b0067b0c41a4ddbc263ded5b.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f60eced8c7b81267b0067b0c41a4ddbc263ded5b.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: e1686b43-f011-4a14-923a-08dd4643ed58
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0ZRc2JHN00xRTRIOEsycFdsZnQzM3pwbUdEZGRqckxhbHhxeXdFUmpkN244?=
 =?utf-8?B?SXJDK3NhVHY5L25wV0RnYWxuS25VSEhSZncrZVNXa3F3OWNFQ3NZNUc3eDNF?=
 =?utf-8?B?VjNocThSNTh4YWlvNW5Yb0Q0Ryt1d0tKaHpPNmt6dGpndThsNHZ2YTNsbkhO?=
 =?utf-8?B?SjhDd01yU2t4a3BCei9aTGFwN3ZCTSt4YlB1ZCtlNGc1UG1xQ2FsUEhuY05C?=
 =?utf-8?B?TjVtTXVicXA1SHRxOXh1aUxTd2xlbmRJQktvaUlrL0k2amxkMGtEOTJIbHR0?=
 =?utf-8?B?VFY1SXlXK1JnVVB4aEVBc2h5VmVFcHdLb2lmQ2ZleEhWdXhiK0lHcnZWS1Ro?=
 =?utf-8?B?RnJyUWlEL2dPM0EzanBINjdSWFJpRVVFMGJodkNtSXFaK0QzZUNIWlA5M3J1?=
 =?utf-8?B?a2cyNlBvQ0hLZyt2MUtkWEp2eG5EOGwvSXVOZ2RaK3BySUsvT052U0JYZng2?=
 =?utf-8?B?Zk9VUEl3RUNtZWNmOXlhY3lTVWdBTnJZSGRkSTR0NElYK3A4TlE2bjZjSGp3?=
 =?utf-8?B?L2JQcEtqVkd3dEhHQ3FlZkl5L2laMCsxSUxGQzBXT3dZTWFPN3J3elFJRHVG?=
 =?utf-8?B?RHhJZ0I1L1BPWEd6K0kyUk5ERWhnUDhLRnJrNjNJcEF0SnAycWlzNlNPZWI5?=
 =?utf-8?B?Tk9RQU15RElEV09XejVJQy9TM3dYdUVrNDJmaTVFMmUvMXlnbEFMd244cG5r?=
 =?utf-8?B?cDBNTkdDdFJ2RGw4VGM4ZXE3UDdVZXlQN041RjFqZWFnY2NFNkRaMHROdWNx?=
 =?utf-8?B?T1FMaFdxang2TzdNZGpybStEbU1GYmNjY1VTMkxIbkFUd2tKTE10UkVuYjBz?=
 =?utf-8?B?bVpXdHI1ZXBlaDNSUmpwNU1BdEJwY1lZREdGVC9ETkFXSlBEdFhsVlVKYVBR?=
 =?utf-8?B?aXdlQjNJQ0pvZTB3cjhMMUM2b1QwSlFKNWRrcmJScCtQbGQxUmtTQnY3ZjU1?=
 =?utf-8?B?SzJFbU5EREJtWFhMV3lRZmFlbnROWmhpQW4wVnhmd2xVb1QyVXRXeDdOYUph?=
 =?utf-8?B?WndpenBkeVNaY2tBSHhoNENHZHVKWENaSHRYQ1cwT3FrWEVWMngzeVBwdnp3?=
 =?utf-8?B?YzQvcHdqOUQrWVpSZFh2ZFoxY0R4aE11VzVjWU10cHJHRmhnZEQ0Ynk4SEQ1?=
 =?utf-8?B?V0xacXdGeTdKcXE1T1dZemVCdW9nRjVERDRYSnZPclBuYkRMNUxhdmxBUEpv?=
 =?utf-8?B?WHVIeWd4MnpSeGc5RldqNllBKzVMSEJpemRhaE1obTEydElkcUVHdUdBTWtB?=
 =?utf-8?B?QVVmQngxTm5lT2pGMXdoTDJRZWpCZko3Uldnc2M0cGhhcy9vTVp1TTJLTE95?=
 =?utf-8?B?bkV2VmdRcUViYTlyeVdFUFo4bnZRS0NjOHNuYU5ZRlZJRGRwaG5jTjJSamFk?=
 =?utf-8?B?RzRxek03QUlHY1pmWjFSTlk3ZHRPRFJERlFycktOSUxqQ2EySWoxUWpjYlM1?=
 =?utf-8?B?VGQxdWVSU1ViNE00U0gvTkptd1lSZ2RibXRCSEpNMDNsNmtLVVZxcFp5bkpS?=
 =?utf-8?B?YStPNmFnOFI2UGJpL2ZPUVJDZXp2YXFqb3dUMUpCd0pLaFVBaXZlbjdXRGtQ?=
 =?utf-8?B?Q0RPSjh4VzJROGhQUjQ0eE44N0NhVmJyMEQyYXRwQzBRdEFlUTJlTlhSbHQ4?=
 =?utf-8?B?SitUWlFyVWZpd05tY1FoV1BLSjVvakRwRFNSQ01jelpUaDUrUFNtbjBaRjN2?=
 =?utf-8?B?U1YvdVl0SXgvS3N3WTNWUC9FYmhNK051ciszVnNxS2pQbjZxQldXS0JhT1lO?=
 =?utf-8?B?SDh6UXBtNXFTTXZRc3V1OWM0aUtXZDd5bURYbGhmVXhEckVLRE9mdWxvMkV0?=
 =?utf-8?B?ZnJCcHFocHVwd2RtV2I4WWJyd3B3ZGVlRHhxMTJSM3FSakxkYSszb0xKR1hM?=
 =?utf-8?Q?u9Ey/ProIQrE7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBnaEUyN2RjT1FaZTcvZVloZ3ZmeVVDclpCMkwvblNsQy9iUFc1TU5yVUg0?=
 =?utf-8?B?azBnMmMyNURpVmpQL0RxeE9sejFMUGlaV0hLTDE5N0FVKzhtWnFPb2xaRmtX?=
 =?utf-8?B?cEFBTUxlZmF1anBYVDBzK1RmV2NRNzAvQ0UySGRPZ2krRVRqLy9TS1FGdUFK?=
 =?utf-8?B?dE9ndWJ2SUU5TzRWUXpzak9ReVFtc0xkeS8wNW10aW1UUmJIdlczSlArT3pa?=
 =?utf-8?B?cUxGT0NIdTc2SEdXekVIdnVXT0ZHMFBET29pRE5LT3lJbEM5Uk9SeFhJSll3?=
 =?utf-8?B?c0I1NWVhK2Rsa201aEsyNTNrcCtPYzAyWlVPMXhjWWN6OFJpNXpHYk10Uis1?=
 =?utf-8?B?VWduTDRqMksxS0ZObXJybFUxTjdTL3N3Yk5HNjdydVR3MWl2M3U1eFRlZUZx?=
 =?utf-8?B?RzZIcHYrWXdOaEYyRXgvK2VheTBjRkExTzJGRlFGd2tib3FXS1ZQSFd1Qzda?=
 =?utf-8?B?bFZyREcwSldEUHMzcWZCRnhhZC9rZllqV2FRQmEyQWhYeGVVbC9mYjN0bVQy?=
 =?utf-8?B?dzBWVitrL1A2Uk5yL0NZbStmTCtpL0YzdUFRTEVZQXJGYmFuTCt1aDVZZGVH?=
 =?utf-8?B?MTFoQlNwbHBad3l3eG83em90MGlxTmZtRERKdmJjVXRpQ0hCNUsycmVPNkxu?=
 =?utf-8?B?dDI3a2JuQ0FIMHdDOEhCU2lXcG4zRmtIQjNqTnN1MS9DdlZyR0F0bUxjUG4x?=
 =?utf-8?B?a1FSOVpwL0xPK0Z2c1lDQ1ErZjByRS9IQks3d0ZXQlExdmtFKzdnZGwzTFZI?=
 =?utf-8?B?M2FGL1RyYlMycmZKQXNMTE5zOTJycUdOTkZWd0tMY2pzWWdrMXpwL2JvRmhR?=
 =?utf-8?B?djRJYlorOFV4QllUOE8zaWNUOHovMk1NYXdNNnFpTnRoMmZkL2FQYWF5bHkv?=
 =?utf-8?B?RDJkbklmQ0FSWmV2VUNoaW9VVkxzdll5elhIVHQxTDdpcGIya0FpY2o0MVhn?=
 =?utf-8?B?SGFNbWdpbGJqY0VxeEJFa2xrNERlRUtKQW9ENHNRTUl2Q2pBMWhDaTRtM0ps?=
 =?utf-8?B?L0w1WlRuRytKdE4xdXpqTlBHREpUM21hcXVqeXc0YUZWaE1ZS1RicXBwbWc2?=
 =?utf-8?B?VDd0dVYvbFdZek9UMlVpQWpCU1lMRkRCK1R0emFQUHlCbkw3N1FRSklKODdY?=
 =?utf-8?B?WlJqOHNFVVU3K21XR1BLWFFNZlFPTHZsb1h0dGdQVkNYN0VNU1h2L2RKT2Ri?=
 =?utf-8?B?NnVUTUt1Y1FEYmpybG5hWGxkak50KzhBRk1qc09hbnBvWUtUT3ZvaGFzdG1q?=
 =?utf-8?B?N3FRdHhrc29qeHNZb1gzeVFGM0loVWpUZTF2Rk90WUlBM2ZSN20ra2s4VjdC?=
 =?utf-8?B?K1FwSXhmRkNCSEN3OThscWE1NEFXOFI1RDB0bWN6M1VUREg0WjdRN1k2ZEFY?=
 =?utf-8?B?UVJLNHJSWjRFT3g3NTZyVEdiUm1HUkMwWkF2a0NabFVRODFoQTk2YWZIdkF4?=
 =?utf-8?B?QmE5L3ZnNEg1amhlaVR1VWlsVVZVYUhyUFhkc3lmakM4OEU2bFJHMjZicU9P?=
 =?utf-8?B?ZFhwMWEzRjVjWForNXpFYzM3Zm1tRDk5bFZPVXhNZnpLb0dQelJWV1VIVkpB?=
 =?utf-8?B?NDBnQmZoejNQOUFla255SnlJWHNWMDNzcTNTRDkyc2UvWStsOHBrTUpKZk5N?=
 =?utf-8?B?Mit3SUdrUVFRT3IwNCtCenJjekZyY0F5bmZxcEZZVFpKRlFMVnFlK2pwYnFm?=
 =?utf-8?B?QUVHMC9oejBlUmJuUFNNWXk4L2xpV2lhNGJpVmdUM09QZytHZ0Vsd0h1ZDI4?=
 =?utf-8?B?dXNSa1NzWVFUbnVJdnNsZnFjeExJR2hHZlgyQlJWRlQwWHYyMmRZcWxJNGk0?=
 =?utf-8?B?Y0g1NkRPZDE4Rmo3Q2ZHK1Btci9VbnBRRnExNTgzZkRVcXRSNkIwb3ZPL0p3?=
 =?utf-8?B?NWU4TDBlRmgxS3J3V1RNalN4anNidjFMOWsydHNlMVkzV3MzbmRFQXdvZ3Zi?=
 =?utf-8?B?Qkdkb1lCblRjVlVjbFdoc2ZGM3UrT3ZvWENnVUJMOUxFbUlUVzRSNXROd1ha?=
 =?utf-8?B?RnpqQ0U4c3o0UVdYOTRXK2V0QWtCWFFDTmM3KytyRVRZMGpqcVc5by93azR2?=
 =?utf-8?B?RFE4QmFqRzBvWVkzMFQwS3BEamErblE3UHBZaE1mVlNXbXloTXl6cDcxMmxu?=
 =?utf-8?B?UmRVWXBjUzdtOERuUjZSVXFESEFTSUNhd2VOVzdkRkZZQXFWaHJYZ3ZwNHJU?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1686b43-f011-4a14-923a-08dd4643ed58
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 00:19:31.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PirdftSDmN0qklxkngrRTj7nrGC20AYBLd2/5s2G17QnrKHjoBGFB+Ry41kafeIS48ypIVAmjP9kK9Ntk1P3XlQCRW5E2jUUCCR4MsAkFN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> Provide the interface to display the number of monitoring counters
> available for assignment in each domain when mbm_cntr_assign is enabled.

"when mbm_cntr_assign is enabled" -> "when mbm_cntr_assign mode is enabled"?

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---


> ---
>  Documentation/arch/x86/resctrl.rst     |  8 +++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 46 ++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 31ff764deeeb..99cae75559b0 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -299,6 +299,14 @@ with the following files:
>  	memory bandwidth tracking to a single memory bandwidth event per
>  	monitoring group.
>  
> +"available_mbm_cntrs":
> +	The number of monitoring counters available for assignment in each
> +	domain when mbm_cntr_assign mode is enabled on the system.
> +	::
> +

Documentation jumps in with some hardcoded values that may cause confusion.
It looks to be missing something like (and looking back this also applies
to "num_mbm_cntrs"):
"For example, on a system with 30 available monitoring/(hardware?) counters in
each of its L3 domains:"


> +	 # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
> +	 0=30;1=30
> +


>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 6fe9e610e9a0..f2bf5b13465d 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1234,6 +1234,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>  			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>  			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
> +			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
>  		}
>  	}
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 75a3b56996ca..2b86124c336b 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -888,6 +888,46 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
> +					    struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +	u32 cntrs, i;
> +	int ret = 0;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +

Missing rdt_last_cmd_clear()?

> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> +		ret = -EINVAL;
> +		goto unlock_cntrs_show;
> +	}
> +
> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +		if (sep)
> +			seq_puts(s, ";");

The one character prints can be simplified with a seq_putc().

> +
> +		cntrs = 0;
> +		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
> +			if (!dom->cntr_cfg[i].rdtgrp)
> +				cntrs++;
> +		}
> +
> +		seq_printf(s, "%d=%d", dom->hdr.id, cntrs);

I expect cntrs to need %u?

> +		sep = true;
> +	}
> +	seq_puts(s, "\n");
> +
> +unlock_cntrs_show:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1916,6 +1956,12 @@ static struct rftype res_common_files[] = {
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_num_mbm_cntrs_show,
>  	},
> +	{
> +		.name		= "available_mbm_cntrs",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_available_mbm_cntrs_show,
> +	},
>  	{
>  		.name		= "cpus",
>  		.mode		= 0644,

Reinette
