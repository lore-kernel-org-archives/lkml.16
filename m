Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457F25B67D;
	Mon, 10 Feb 2025 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210931; cv=fail; b=E4z6Ks3PZU5QnP9TmooDa95ONagvkoeT88Em5vaEKuAbdZNWBDMEaac5AdCkx6lDNkf2JhCwLQ3+J5omS8byBV02fR5n9c70vN7cmKcMMnwJcQDXBVpQmUfoZXphRvDa3y+2ry01cKaL1bN5mzcc1Y42dNXy92mH90alX/Rv1DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210931; c=relaxed/simple;
	bh=9DcKoACEsvQqXbeuXjCxwYN4ONI8K3L/raWURowgbJk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kJ1/LTJTu3ydBe2qQm8H0GDvxwqghjRM8FOwqT0AilbGtARkNybVDqpvFBRCGeZdRZbgNou1FEaVB+CUgSO+yrgS+XjcBShOvOXDBzWOIWflI+mljBr0rTTucJk2NcwITGicFMHEcAAuhGjFQHPFVmSFAG+RMubCEsufd2FtR2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fygTVpXi; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fygTVpXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739210930; x=1770746930;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9DcKoACEsvQqXbeuXjCxwYN4ONI8K3L/raWURowgbJk=;
  b=fygTVpXiTbY3E57QWQFKG0H/AYDjMo4LomcKcGj3jTHztTLMwaG4gZXH
   8IwWn1BD07fXJlt0eJnaJF/rN1imk7SZIEcU5CIB8iIVu/9jHSu0Xfd8i
   jXdmgdthDQU0XE7rrRY8Mv60qjo1O3l18AebgAhz3Wtt3Uyi9gmkz0NIw
   cgzod7j0d3p4usM4lQ7xaaAFtO76+4aogB71PHs9c3NHFM1yxMZvaywOc
   syoM74118UqLKN+3ig5YqjluZC3GBuSuqUNhDJeDCyecDsBUn64i6nYJa
   j5In68lE0ImsmY4TYjxajC0Pw59bxxgUFLp8uyHFEJio3kfziMkndhT2p
   Q==;
X-CSE-ConnectionGUID: Fs2PiagZSkyJiy3DdO+jTw==
X-CSE-MsgGUID: +Z1Nej+gSMeVd8SHElSS9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57218870"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57218870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:08:49 -0800
X-CSE-ConnectionGUID: 7glhl2NuRQuY5H0Vw5C2eg==
X-CSE-MsgGUID: 7y33gIdvTXO0bBxOeuJbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116857642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 10:08:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:08:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:08:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:08:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7RsYs1MB70wnrbocLiJvntLSF0g0gTkUBzKy2nlpW/9tMu808udGC4ltGjk35rsJxkNNOZc3EXN6UFCEiTw/yEE0jTNoqcknLw/5WHAdK7lcnkLf6800VzfxSQdSn/o3jNUTLPpTZkmE50IKjzeFy7PsHPnS2BxAU3z7pf79qDEkk1neQPnvirPMNM/4auwpEuT5K0BuUK72ICHTefqQkWqgbcVw+sBkYYhwRnEtnZkk7MeLVhPVgD+PLei6C64sBuAEOY46LlHTiGFCg4NNmqGI8ftf1nSnOlf/P9YKHu/jg0HNdquD57/uKg24imnvn5E7KcOW/cPgmZqDsDGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK1nZ5DuybpHHtO3wcWowHmYp1AazOkXLki6pnECC4Y=;
 b=xuHrKIblyZk05NQSnQ4A7f9t2cHadvElCwtFR0xEz0FVSf2nHBOpefbaKpaAzmls24yRWOKVxZPvdyta5S8Ey4MKNVVNjzl3MyLv6vqEhjCq+eKy50hFp6ayRISF2VED+4IwsO4DVPf1U3CCRVe+4K/prf3kiDUNRbHL85/W/IaZ89lYL5LEWvR2tmiNMHaky6deWqPQtEkxzSh2ghPTSAUmTRZS/7tN4bStOjNkcw85XOEicgEtAUsXq9M9sJqlcZDa4URJqtZC03xDq/nO7SYdIEXwUOvv3tZTdw3ZuScT+MCnDxJ3SWQ+4/ii/7vpzrh+0ftud7Zsj807NqhnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 18:08:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:08:23 +0000
Message-ID: <817b0c73-5898-4769-9356-a90435559f84@intel.com>
Date: Mon, 10 Feb 2025 10:08:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/23] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
 <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
 <a6120ad5-c9fc-48cd-b2a6-cfb7ac33100a@amd.com>
 <11da060c-fb57-486f-bb8d-4ef830a2addb@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <11da060c-fb57-486f-bb8d-4ef830a2addb@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b900a07-bda7-4bc2-e603-08dd49fde8b4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFE5K2dqN1FRUC9GK2I5eFJubkMwb2JLYWFDVkZnN1dzYnRWazZLZC9LNzNS?=
 =?utf-8?B?UUFXVExWN1VycTgxMXhzODltTCs2a1JCdlhLOG40cnFmdVBEWm1idVhhOVcr?=
 =?utf-8?B?U2pveDEwTU50Y1BXcHdOQWNTUDJld1F0ZjdwM3diMkhOOEY4Q2lBN3ZHQU9Y?=
 =?utf-8?B?bmd5QVdtUDlhOWY1VE9ZWDZOT2Z3ZDlKZ0htNlZRQ0pHUHdydzlQUHc0NmQv?=
 =?utf-8?B?YWd5SnlJd1JFbkJpRkNkUkhoNzVKVVFUNmVSUkFwTGkxTlJkSXhoT25RRmdx?=
 =?utf-8?B?cTFsK2NpT1NtdWJtaU9heEc4M2JScUV5djNsQ1ZLejdYNCtncHNIR0xVWWRw?=
 =?utf-8?B?dVlZZ00xSEYvQkduSE51V3JTM1lLTjBCYWJqTmp1eDM3RGpVODIvWndNN1Z2?=
 =?utf-8?B?Mkp2bXF3M0hlVUtnbXhOdXVXUTJ3akx3SDVSbXVoOWdrUXRYSjZsT2xvdzZ0?=
 =?utf-8?B?SThvSGs0Tms5bGZpVlBtejk2NVBaVzh4cjRwRTFUOHc4aHVrczdLdDB3aU1F?=
 =?utf-8?B?SnN6VUJjN2cyTkErMy9LcjhGcGtBVHd0b1RaM0ovc05RRjNWbjB5OU96WjNL?=
 =?utf-8?B?V0tBSW9wdTRNVXZBT0FTYWxDb2JNU1RhMzlDRmpPbTFVTFRSUjJJVkNXenE4?=
 =?utf-8?B?OVJrY3NpcVRBemVHUXBDM0g1SGpwc1dCQ0xadGZRRVI5Ukd1MVE3ZnhROHhz?=
 =?utf-8?B?S3V5d2ZtdDhVZ2o2ZHk0ZDBNSXA4M0Z3SmlwV3dPOWQrRm0xcHo1UFU3TUJq?=
 =?utf-8?B?Y2xsY0NWeG9tbXRFWjhmZWFIQjV0R0oydndMTXVnTlFha0dvRjFOZGZOR3do?=
 =?utf-8?B?ZTk0RGZyNmJUOEFDM0xiTi9hNVdnTVV3N1B4NmIrWVlvNDF0UmZ6UWs5bHcx?=
 =?utf-8?B?ZGJpdTVHWG1MWEdZdnphY2ExSG1Sa054Z3VNZ2N0QjY2emE0RDBnVmdhK0gv?=
 =?utf-8?B?T0xiYktoQ21GQ3h4V2xmbStMcEMvc2ozWG80bVpYQTgvbkJTdWVzYXdaQmZL?=
 =?utf-8?B?SldUalZHT2daeHZsWHhyY01RSlVoR2tBU29HUmQydUhZTklpZlBsVWZkU1FB?=
 =?utf-8?B?a2VDSkpYbVVyS25QbDNlT0UxTFl1czJ6ejhQYzN1bElxUjliOVZSOHdDMVhQ?=
 =?utf-8?B?c0hVdHlzNXRGTHNBVTBka0s1MjZRdlZoT3RvcXN4emEyVTdDVUgybWFwMCtZ?=
 =?utf-8?B?R2VoZmNuYlhOVGxDNC9ESERDb2ZNSVZZWHQrL3N3bDA1eGs1WHBJQmExM2U3?=
 =?utf-8?B?M0I5Q2NmMlUxT0hKbmJTTHVYMWprcjN2bVhqRStYZ1V5bEFEd2ZGTHQrTVdt?=
 =?utf-8?B?eGtqc1BnUG5uRXBjRnVrNzFZQWhnSU1oVnRBaW5GUFFEZWc1TmlxcjdVM1l6?=
 =?utf-8?B?NVltb24wQUo0RHRjZnptTTNKcFYzbW01OGxFNjF1aDhhSSt3RW1PMlBGYVdU?=
 =?utf-8?B?US8wTnIxZzNVbXRyZ2pJUHppYlRhdHVaZVo2VHE3VmpGc2pGTUIyaXRuM1Jp?=
 =?utf-8?B?MUNtV3NYZ2xtVHVSelFISXY5aDA3bGZIRlJzUUJJdUZ3UWRkeElBVzd6UDY3?=
 =?utf-8?B?ai9mN3pFSnVLOSs3d0FsS0xqc0NWRWVMUnZsVllpV24vcVk2VkdCZGNtcld6?=
 =?utf-8?B?Qy9pR2hEcWsvSDkrTmpiZndZSDQwS3VONFdhUkZkcWJpQ1pBTk5GcFhDWUl2?=
 =?utf-8?B?MjlITkEydmt5QU1KR2pDVVRDUCtKczBRUXBVOFE4UXh6bHd3WTZyWndjTVZm?=
 =?utf-8?B?UHZJWnlOSUoyc1VFVzYvaUQxeTRXVHBtYTZVck9UZzQ4WS85aDN4bDlGM3ZJ?=
 =?utf-8?B?RmpFdlUxdUo2R3g0aStuSkxHekRKL0EvbFNJdkhaK1d1WkNRaU9kUXRtYldU?=
 =?utf-8?B?cTY4YUYwSDZOamxSd3l6TDBZdzhvTmFiTHl5QUJhSmNJeWpseTBnWDExOEo2?=
 =?utf-8?Q?bYm4mVN/MqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WklwMzFpK3VhNHg3QndnYkEwTHNKVFpMRjlRdmlTVlc4WC9lRC9NbGpNdUpG?=
 =?utf-8?B?bEZlOW40Ny9xWXQ4dktzNEhkNzkzQjl5SmVNYmJXSGRVT3hYRGF3eVZ0eVRx?=
 =?utf-8?B?NVZxT3ltNEM3dkpVUVpad1JTMUp4M3p5cFE0WDdGUHdDZDhyaTViYm53cE9y?=
 =?utf-8?B?Slp2emhXZlRCY1RwTVVzbWxGRzA0SW9xTEFndVdZMlZ1cEM1LzJYZ3BGbmlk?=
 =?utf-8?B?RWYxeUordUYyNncwUC9ucVNiZjMrR1FxVmxyZExFR0d5VUhDbmxoMmtIS2VZ?=
 =?utf-8?B?Zit0UVhLUnBWRmRYVlVsYklJV0xDUkFaaThhWDcvQ05GTlBwOWZYZVFoR28x?=
 =?utf-8?B?OHVHNjlMdE1CeG1FNC9la1hQOE1jZGtpa0Q0ZVFESUVhRzdlQnU3bzRmaHho?=
 =?utf-8?B?SWw5elBENVUxcUVrM3ZCNmhhV3piL2hZc0RuOTJBU01hY05XSVhOa3o4NkVE?=
 =?utf-8?B?dmp5OWF2ZzVxblNRWjRFdnl2Wm1qdVB1OWs0a3YxUTBRblBDVEFsTDQxMkFS?=
 =?utf-8?B?clVqTzVuY3pFQkpiK1JIc1lPeWNCS0UzTUtJTUdyMkhybndVVWtYdkZtQXlD?=
 =?utf-8?B?bDEyNTkvYms5bUwwVy83clRwd0pJcy9peFQycXdzYXZSMytJN203NXZEL1hT?=
 =?utf-8?B?SktSOWNGRnlCTG5NMG5QRDVxYlBJS1hnc29VdkgvTlp0VGRvaThMU09YRTF1?=
 =?utf-8?B?dGlzaTlTSmNQVFJPRkg0UmdPeWp5ZEY3RlFTd25rSzVhcFBRaS9Sb0tQUDJG?=
 =?utf-8?B?ZkhZN2RCaE1QcUh0WkZDZFNKYmpiVU1RVHBqeWM4eUg2NTlBZ3pyNDcvalUr?=
 =?utf-8?B?UElXcDFyUmd3QTlyS1hlRzVLaXJxejhCSFBVNjBDUmViUVJLenJWUGJ2aXBT?=
 =?utf-8?B?NDRBYkhGdWMzNFArUjUrL2VxdVNJM0t5eTFIWlZlcjg2T05icmx2dGRXZnFD?=
 =?utf-8?B?RXAxbk5KTVVPZFBmVTgvN0toaWpJUDFqMjRBZXR5bDNaMkl2cEpWTDkwWVNv?=
 =?utf-8?B?OGxPbWlNenhJaDk2aXRNQ2JEZ0hOQTFzMkJrWDlkUTcrellnam1jSWh1bGpV?=
 =?utf-8?B?NmVWNEdsNGdaaXN0UER1Q1FUZ3YrL0Q5TituNVdRdFV3RDBDOXZsWkdnQkJp?=
 =?utf-8?B?L1I3STRCVzM4WjJnUTFFVnRjY25kLzRDbVJFY0EyVFhSN0NnRXUveHI5dmJq?=
 =?utf-8?B?OCtJMFpZcG9NbkdyazVaZ21mbHJkdm1FY3U0cEpWK0lKSGNzVlBYQk9DZUlt?=
 =?utf-8?B?ZjF5ZUtFcGZjMVFMVnAvSFdxcjJlcEpxVkIxYUhKa1FWNWt2QUMzdmN0aHVa?=
 =?utf-8?B?RGpac2FZNGJqNXo4UnBWNnFRd01ORXBaT29wVlNreEUvUXIxbHI3eU12TGlL?=
 =?utf-8?B?Ni9TcVlqdjgyRW1DRk5EZDJwb1NHelJYTmVXeERIN0huZTM4RmJ5YlViZklC?=
 =?utf-8?B?QUw3bXlXTE9GQWJzN2orWVFpdDlhZU5ML1VNMmpra29LS3hBQUg1emVCM09k?=
 =?utf-8?B?SkVaVlhKYWpxejFYZGkvQ0ErZnk0bkEwbXpEUEZkYkU1azg5NUJpTGpxZ3dz?=
 =?utf-8?B?NEh4ZUoyTHdvQVNLb2NqMTNHRUVJaFVLZmFsL1dOUnBQR1hsYkNTTS8xNFpz?=
 =?utf-8?B?Vm0zbWlHSUFYRXBTek8vRUUvb3IxMDVZVml0OVFIai96U1Voa3E5UXFWc29s?=
 =?utf-8?B?NnNNcTRBSWtEVFI0V1BiWmptSDR6K2Z4Q0xJK2FIUWgrb1RaUW1PYXJUWG9B?=
 =?utf-8?B?YXI0bHQ4Mno1VStTVTQ0bk13NTZHRTF4b3Z4bU8vRm1iMGtvOWo3RURidmpF?=
 =?utf-8?B?czdsMityS3NPTm5pWWVpS0Jwb3I1Wmg2ZC91bmw0d1FObVN2VnE5WDNnSzBh?=
 =?utf-8?B?bWsyWW8rVENRR20zRzRPOS93Z1RCN2pmMndnT3pxTmp6M21hTjlTSzZ0bVl2?=
 =?utf-8?B?d09oNkpOUVZHVlBWVFJ0ZG9SQllaRVV3MURqS1BSa0dRU082Z2NlMkltdmlQ?=
 =?utf-8?B?MHYybXlvL0JSSXo4MVhmeWxId1ZZK090WGRuYTdCS1preFNGNzkrSjhyODZn?=
 =?utf-8?B?NkIvckcxbTR5Vm05ZE9lRGEyMEZRZFJublpVbDZ5dWRYaE5jcmF3c3YwL2tE?=
 =?utf-8?B?NjVlSUY4aWxTVzRCOXhPR3lkZFliTkt6MUVyNTdORzRUM3hFZE8vUUVGZlhn?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b900a07-bda7-4bc2-e603-08dd49fde8b4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:08:23.7981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETvrHWTe3yBrEI99W7lT7uBYO97nS6BunBDkhqGEwdDlMSO0Dtn2eB5Yu6m0X1plxkFAQ61/iENthK7NPmu4ea43DELXT6Uv5D127YuoUyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
X-OriginatorOrg: intel.com

Hi Babu,

On 2/7/25 10:52 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 2/7/2025 11:18 AM, Moger, Babu wrote:
>> Does this look ok? Just added domain in the text.
>>
>> "The number of monitoring counters available in each domain for assignment when the system supports mbm_cntr_assign mode.
>> ::
>>    # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>    32
>>
>> The resctrl file system supports tracking up to two memory bandwidth
>> events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
>> Up to two counters can be assigned per monitoring group, one for each
>> memory bandwidth event in each domain. More monitoring groups can be tracked by assigning one counter per monitoring group. However, doing so limits memory bandwidth tracking to a single memory bandwidth event per
>> monitoring group."
> 
> Revised again:
> 
> "The number of monitoring counters available in each domain for assignment when the system supports mbm_cntr_assign mode. For example, on a system with 32 monitoring counters:

I think we need to be careful with "available" since all these counters
may not be available. That is why "available_mbm_cntrs" exist.

How about something like (please feel free to improve):
"The maximum number of monitoring counters (total of available and assigned counters)
 in each domain when the system supports mbm_cntr_assign mode." 

Could you please make the "For example" a new paragraph (this follows existing style in the
docs). It could also be made more specific, for example,

"For example, on a system with 32 monitoring counters in each domain:"

> ::
>   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>   32
> 

The rest of the documentation seems like a repeat of what can be found in
the "mbm_assign_mode" section right above it. It does not look as though
any information will be lost by dropping the text below?

> The resctrl file system supports tracking up to two memory bandwidth
> events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
> Up to two counters can be assigned per monitoring group, one for each
> memory bandwidth event in each domain. More monitoring groups can be tracked by assigning one counter per monitoring group. However, doing so limits memory bandwidth tracking to a single memory bandwidth event per
> monitoring group."
> 
> Thanks
> Babu

Reinette
