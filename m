Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC6A487BF;
	Tue, 24 Jun 2025 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800766; cv=fail; b=eBxyvcqitReTMTmzhqb03mOEPQpRpuEI86VzlsS/1/9/Zb88Dhy4yagROUgEXY8seh8RrGpxsvxIpuDVBzuqXjzyoWqTIbY58An6FlmFvCjGdigJ8OGuAFtXZjjW4vynEwn2n4btbl9dy0K/VbMk0fflZXZb41HAQlsBk8USeFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800766; c=relaxed/simple;
	bh=lcdWY0LiI5C1zmwF5vl/LZRwKnC9GP8oR2cidMTQfjQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FXzEMtQmQeYNCqNdBo7Q60obgozAnaeUA5OUt2wHBp6hhI0mn+iHwiKn6XDauVmbewcWL4akMnnKvKUyNVSiogGYVHfvlxoHXwaVOKg6oSIvBGhnSdB7OYEPs/p1ye3ViHu0UrRl7R5wNCCijHUDoB1gI0+AvnJ+3Z9sVdignoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He/RQ9+h; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He/RQ9+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800766; x=1782336766;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lcdWY0LiI5C1zmwF5vl/LZRwKnC9GP8oR2cidMTQfjQ=;
  b=He/RQ9+hsRSdmi5Ed0WHCAGkYwvyZe/VAukpvu9JvGmiaLJatTyIBJhL
   2UOR6hfWTYo3gV0XOfE/5T65yiBqR7R5325/CwkU3+k3ppTzejJYn1kox
   5liyKlS1My2reOMQu3RWONdFN502TRbzl6Z0XDWApK0MH3gNUT81HCzv3
   caiN8fUic3JKyEEBLcANY5KbUBjauMKvIdsGQq1kAdv/PhERiKr5rlUT0
   akUC/bxjRGMU/Y/xuuGDIpFwb6yE9oOSOuffOGanouRd9rc7M9VMJhkij
   Js86blf+z1ROCeEt+C4w5TVk1OS34a5MKbtLphtUK1wOy+MUActPuIU31
   Q==;
X-CSE-ConnectionGUID: 4/icbzxCSM2TpSTLdKzVhw==
X-CSE-MsgGUID: HzUgFxzvThGYRxblRPYTjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53193330"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53193330"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:32:45 -0700
X-CSE-ConnectionGUID: r7HY7TfdSnybGMW/OELr7Q==
X-CSE-MsgGUID: 9ppIPUT/Re2NlTNxKyp6gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157524662"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:32:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:32:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:32:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/+LHWrMJ+3nBkBLZxMo6FW4dTxj0FgBCZ8XYAKpBqkqsrNPDOcCsxtNaMMWQitgJeJDuJIS/VhGGktOXIraZ8It9ibpkrERMmims85TF3dV4sWZJBld9rv9PpMWPbR9v10NhCJN9G5M3RcUWd5n9PLEVpjLeAOx8DC/v+RiLWgZpIUikSVLBrvYBuvLxIAasQpZ611G1RKBAQdouOHt/Sd8X0iT8KeNZ2Hc9T3gXbAJBxtE30x0fnx/CRH0EV3QDCU9T5BDPaJX+oC6RhxeQX6KcWSCwPGKDxEwy7QOXjMYCkMPseT9Rsuh1+zcpAavltsRAAFvSI9HxCIE61Q6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4+p7R7a6rkNNEpRqw5TJ5rH5HOI82sJdN3pCq1BRQI=;
 b=oJtv7YfkNGtApK3cvBMS0nSOW+7EECC0wAFfLflt8avOtmw+TJ+5C3XfFtklC42XKSBMS2kl9LIvAyCUVSu+MiO4VDvVaH/gHuL7EQNCuU8b1/7/YKvs0ZNTaWPAlhXiOw9jjpcSeGKsubRrvmVwNcaoh5ubw5WjI+mQYKf3q7u/9EEEwE3keBIAzfF9w4puqYY3s9WnpoY1BlsP23K3m9EKe8AvsL7yp5CWAfF3uz47bV4kvwJRzStccTgkBevEKkMNaw22Et4fNqMhm8nBVzMin51zZw0wu1lwvsB3C364kJ55sBU3TprBRAB8TdBdKFttLOLTQp/B9eMpYYir1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 21:32:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:32:19 +0000
Message-ID: <356a213e-d8a4-420c-adc1-1f58b4feef1d@intel.com>
Date: Tue, 24 Jun 2025 14:32:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/32] x86,fs/resctrl: Consolidate monitoring related
 data from rdt_resource
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <f6d15921bff2d698d0cc0b2a35d2361c846203e6.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f6d15921bff2d698d0cc0b2a35d2361c846203e6.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d77ea6f-3391-4c0a-2f98-08ddb366992f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJ6VDREVW5FTEtabWUxUEgyVjRDMHJiMUpGSXAxMWZmVFZaNnZmeWxrRlVL?=
 =?utf-8?B?V1Z2WjhXTlN6cXJUM2pvOEVDZGhvOXFXam9JamhUOFdpakpkQUJvTno3Q2pO?=
 =?utf-8?B?RkJrc2VUTTJzQ2xJcEVWMk5MYk5NeXp0MHoranppM0NzS29YV2JPT09ScDVU?=
 =?utf-8?B?cEpLbTBoZFE5bDM2RkRhUWdDRU5jT3hiR0o2OHV3UWIybFhkbkxlazkrb3dm?=
 =?utf-8?B?RlM4RTFzMlYyQXA3TTA2MGlJeCtzZzBiN2M1QjNMaXVRZEdaS3RhR05NRVgr?=
 =?utf-8?B?SEJEckxNZWJqMlhsQ1Q0TVczTlRrb2pDQi93dmZleGsvYVRnOGRBN2dSNFJB?=
 =?utf-8?B?anFuTTJOaWVkK1F5VjUrRm40M2Y0N3R4UVR1MWkvWmpRSGpNVy92amd0YWRi?=
 =?utf-8?B?aGE0QkhZSDVmKzNiTGcwbDk1MDV4SSt5end4ajNQY1NQVHZ3bm1BZkRFSjBt?=
 =?utf-8?B?M25mZ2o1aWNMcDVaQWw5RnVXb1hVT3JzaDlUQ2Y0MDd5MCs5bjlGbGtqZFBG?=
 =?utf-8?B?MWVvUUtGOXgzd3lGekNGZTRYY0hkK0toL2pRUHQvKzR0ZTUrWi92NUdRam9j?=
 =?utf-8?B?czJHQTFpaThRanpYZVBFNHNpRWErblJpWWdZaHNGNWdqTFk4U3g2bXU4cFUz?=
 =?utf-8?B?T2cxVGErWkwrMzRCT3BVeCtpbVpRdm5wVnNGWDFvRHp5ZW5tTUZaYis3cWNW?=
 =?utf-8?B?T3JOSzVUVFFFVE1hUXNKaXE3OThxVVFybE1TUzNxSEl3Q0RvazB2TTY5NXNP?=
 =?utf-8?B?Zi93UnJRbFUzd1JYQlhpdVJodDZRa3hvMUl2ejdSU1pKNjA2SWxqMStqbEtx?=
 =?utf-8?B?RlY3eDkzanVRb2FEN3dGb2hER1dPNWlpdGdYSzV2cjhoZWtLVGhXNHcxd1Z4?=
 =?utf-8?B?YU9vSXo3THdNT1AxS2xNT3FvYUNCdXc4cEdleXdyWDM0MjBxTmNVaHpmOGVF?=
 =?utf-8?B?c055MTltMThyWUxWeUdEaXVLREVialNmUjJuYlBLUlFKMEZYRTdFTGwySXZ4?=
 =?utf-8?B?Skc0SklSVUEvU29RaEptcDU3Nmc1MGJUaTYwR2JycEFSeGJydnBRRzJFcVU1?=
 =?utf-8?B?a1pkVzRDTEpCbTZMRlp0NDAyd0tXWnJCdzJjNzNGY0ZjaCtjc3o2SFMxQ203?=
 =?utf-8?B?R1BEbW9EU3EvQlVsZ05JRXRnUk5ZT0Vuck14VmVVSFIxMGY2dXlLRGRZeFFZ?=
 =?utf-8?B?eDYwWHdWZFY4NUdDTXN5SWV3a1RRcWNweVhENURNdEFkUkV5ekdvdnBocmNZ?=
 =?utf-8?B?S25xWGVOMzhKcEVYaUYzakxheU00MEpTOE1KM0l5VVk0dlQ1RU5KUkp3WXlH?=
 =?utf-8?B?UWJaNUlvN0VJTGpvRFNPNi9iTVVlT0JqaG9xdy9PT293Rm92Rks4N2JJM3ZL?=
 =?utf-8?B?dVVkT1MxV1VQbE1CRG1odjRpUnNERktjM1I2WENuTmRhVnFNKzJSajgyV1Uw?=
 =?utf-8?B?Sjc3eGx1TkxsVlk5TGowQ2N5ak1rVFdlNld0ZWozd1ptVFEwODZiMUFqOTQ5?=
 =?utf-8?B?S1gyYmNZbTFVK1lnZjUzUTF3N1JiYlUyai9VdXpsKy9jWUQxOGIvUkt4d0o5?=
 =?utf-8?B?UDZYY1M1Z2RwS3FuWG9zNnlpZW9DcjVnSVRPSytxOWxva0p6cGlUUzRqdzFP?=
 =?utf-8?B?aEZvdWgvcytGQ2daSDBISlZ2YTZDRTU0OVFKQm9LaERScEQ3RGVMU2dSeGhz?=
 =?utf-8?B?YldLOFd2TlBlbGtpbGNQREcyVVBwc291WjBnYnZML3EwMzhqTHB6eGhrczY0?=
 =?utf-8?B?cC91OFFFbStpU21GcWp3RUN5SGIwN3Z5RUMwT1NQN25nVk41NUtOR3oxWWcx?=
 =?utf-8?B?TVJRY2RtcHhvK2hMV0UwUmUxNlVZSFk4NXY0dVozTDdraTRWbG5MTlN0MUtr?=
 =?utf-8?B?aVRPK2VoQnhpN2tkWlBJa2ZDeEJpZ2lET05ZZWhvZVkzaUFCcm11S2VHb25i?=
 =?utf-8?Q?YgTijfWtjmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpaVlFpd3VvRWY3Nk11cG5XOUhRaVRESEtxSWdjSjVQanNoQ2lIVjRLRlp4?=
 =?utf-8?B?MVY4blBEY0ZlaFdvNVV1UVZRcFdZaWJXamdkWGlCc0VMQUpLMjF3RjNLTG1R?=
 =?utf-8?B?YVVqdTZneVhmWjdJampqL0JuL0tNVU5yMkEwNC9sb3gxV3ZHTlp2Q1Rrak9H?=
 =?utf-8?B?WmN2KzJhcUpCN2VrUC9ETVduSEhxWTAySWtEajNPVWpXcGpScEVEQW84QlFX?=
 =?utf-8?B?YjhCaGtObDhwTlkzMWVGR2RiZUNHMXcrRDNUZndscG41ZjFKc1pUTWVXa0lB?=
 =?utf-8?B?aWpka0JObzVKWk5pZUMxWkJmRkQ2Tm9RZjNTeHdLaDdOajJwN1NjeU9QTTly?=
 =?utf-8?B?WEJGNmoza3JZVTZvZ1NKdGI2Y3g5UFlXaEhSelpqRUsxY2pKb2NFN0Z4T2Yy?=
 =?utf-8?B?VzZKRzJOTXNEcGNIdjZCQ1lBMnRlZkRmTmlVQjg4SW9EOXNvM2JxSzc3b3Rr?=
 =?utf-8?B?MXpvWHBDaVBUbDV6cE8vTGJxMzJrOTNPeG1IL1FNL2dDTjVmK2VoMXp5TVh3?=
 =?utf-8?B?MGt3cEFaNlhmQkJlWTJacWVuYlI0eXFmNUpIKzgrWXY1VXJjeTRtcnA5REFp?=
 =?utf-8?B?UGIrZlNUczJiUDNyMERXaVRVVUNUdzNPQlMyNDZJbktRL2Q4K0xUVTRVNDBj?=
 =?utf-8?B?WHZrTXFKZnhNNDEvV2VZVmdqWkJCMTAvS2VYYmVDWEtZb3ord1dGOXFETTlU?=
 =?utf-8?B?aENtN3cyVys2S2Q1dDh5d1hVN0hsWjF2cW0yMExqcnZ2Mk5DV2llKzRHWW9D?=
 =?utf-8?B?MGp5aytDSCsvZFJ5R1hsalo5MkNFSUIyMU5hRUpsZnFxaGRjZjVFTHpsbEwz?=
 =?utf-8?B?ZUxMUm5uOVhFcXNvSzBtMFc5Vnk3T0NYNVYvS3JYOVhsci91dk82UjA0eXVa?=
 =?utf-8?B?QXdLNFROZEphbk95YWtwM05udWdlSG8wYk5CNHJxWEhHUjBSYURkRWFQeXBk?=
 =?utf-8?B?NkVqc0E5amh3dTg0NVhEOG5kVVZPZldGMm94WlhDaDh3MkxmODhRWjZnaFVl?=
 =?utf-8?B?UXd3N3Y4eG9HUlZ3VmRJOERWdFQ0aTJyZ1ljclV4cTZocFJ4b3pHT3BYeUpo?=
 =?utf-8?B?L3l5aDZJVnJISFFvMmdrUjQzY0RkNmlnU3AyNmcvWXh2N0dUNTc2RXBvODM5?=
 =?utf-8?B?ZHpDSFVlVFdCMXdVbEVSZ0JzMmpoRlVwcS9OMElJVThFWkNpM09iU2lHa1FK?=
 =?utf-8?B?VVlkK2t5aWszREF2WWdnOVozU3YyWnRtZ3Fjdlh0T0d6dE5XbXMwd2pFc3pQ?=
 =?utf-8?B?bmNHb0VSYzEzUVZZK1pZSE1QbHd6eDh0UzNWakJ3SWFIZitmeUpzV3ZuaXZq?=
 =?utf-8?B?U0t1c2ZSRTZ5VmtwbU5TbHVaN0lWbUs5bnJEdVNtakNkOUVMNm1razJBRmRn?=
 =?utf-8?B?Kyt1Nk1OM21wcGRKWlhIT2poMDRLMVBNS2pHWGZmZnRhTW1RdWZ3Q3Q3dHA1?=
 =?utf-8?B?SUZVWTFabTBYY3R6bi8rM25XbFlZRmk2Z1lOMVA3N1VFN0x0a01pMThQNkdq?=
 =?utf-8?B?WnNtTWl6dkZNUSttVGMydERmNTQ3SE41NDMzanlDbml0ZzdJbEk4WFlQNVFv?=
 =?utf-8?B?UFFxUGYzLy9FNGZjZ1k2MnRFS0NuUHpVN0wxQkVrRy9DZFdXZ3RwTUxKcjlF?=
 =?utf-8?B?RTNpMCsrR2FOV1hkbnVVYjZ2OXIrcGVETmJjUTBHV2xWNUhVSlA3N2tNN2xE?=
 =?utf-8?B?RElaUkx3VXJJenduME9FNVNSWERsUUkwcDFSNVVJQjlUd0F1NGppNlZlUWhU?=
 =?utf-8?B?NEtEMEpXSklkOE9YK3hDdkwrYS9IY2JPalVHakExdnh1U2p2QTRCN1B4ejRU?=
 =?utf-8?B?WlUxM1E5Q1dXazVBRkZsQU9ydWo3UmJwa3BXWXJOQXBLQk1JVlVod3I1amFW?=
 =?utf-8?B?ZldWUCt2UUl2MEg1YTdSM1E1RGg1VGI2R2R6MzRucGI2MVQzc2NBL1BmUER2?=
 =?utf-8?B?MjJ4aWRrQ2lEWkF6dWVSZUhwN2JBc3FnanlLamRjUm5JZXBPVmZUVHNqaVVh?=
 =?utf-8?B?aVBRQnhVQmdSU3ZmbnpYVzFsZ2pTcmI2WU5DRmFWK0c5MmN1QU5BTmpYS3VS?=
 =?utf-8?B?VjZ1MjIyMmxuNUdyZjBYb2FQZU9vdFlwSXlzMUtUQld4NnlTY3Z0UEdaYzY5?=
 =?utf-8?B?SFhFZFF5ejNVSm9lS0dtWnJ2ckppRjlTNzdCeHcwa1c0WEpTaU5INFJpNXl3?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d77ea6f-3391-4c0a-2f98-08ddb366992f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:32:19.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q70AhuJDTtMVqqxwUJNQWDSi8YY5UCgQ5y+rj/n+9ibWk2EY4/9WsXVaFfMLGm061rd7ihT1opIJsWPn4jR3IsJzAfHQI4u9Rogj7rLPXzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:

...

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index bbe57eff962b..22766b8b670b 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -255,38 +255,46 @@ enum resctrl_schema_fmt {
>  	RESCTRL_SCHEMA_RANGE,
>  };
>  
> +/**
> + * struct resctrl_mon - Monitoring related data of a resctrl resource.
> + * @num_rmid:		Number of RMIDs available.
> + * @mbm_cfg_mask:	Memory transactions that can be tracked when bandwidth
> + *			monitoring events are configured.

"are configured" -> "can be configured" (like it was before). This is a property
that is discovered from hardware. The feature need not be in use for the property
to be valid.

Also, this version switches "Bandwidth sources" -> "Memory transactions". I think this
is a good change but it may be unexpected. Perhaps a snippet in changelog to
point out the motivation for this change: "Also switch "bandwidth sources" term
to "memory transactions" to use consistent term within resctrl for related monitoring
features". Please feel free to improve.

Reinette

