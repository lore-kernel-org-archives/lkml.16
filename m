Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6C188006;
	Wed, 18 Jun 2025 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278783; cv=fail; b=J6AiDnre4LSHavR+9YmCWlgXQULmegBjnNcTFhBlYWbNjm9K/+hAahVp3KzCbT0MMEqutZdBhW5apfoUiZ3DwZJ3dsIkYu0tfIpS2EcnRFLBk5WPKtsf9N2z8tDiTu2ZkN1tuH4mG3E+XxaTlIlQPTNk2bqT8cKH3w1IXULbCFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278783; c=relaxed/simple;
	bh=0H0tsP/NI70TNa2OM7rgTrsn/ZCqwIduPMefL48RMSM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QUxGfFaZG4bHYObaQMdcPfvlz5sSoSJA4w91l8/XynfWfooXdxbxYCaq9beZBM0X4QV9v4J70m+9VHbw8M3hJkARk0Y5M55cQFU1AC2ssT1lGh/RTQB+NIjN2S/edUaZUBpzP6CcObkOWmA/7se/TGp2Apw5Jqd5uIOm6hAkPS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvlRmmBZ; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvlRmmBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750278782; x=1781814782;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0H0tsP/NI70TNa2OM7rgTrsn/ZCqwIduPMefL48RMSM=;
  b=ZvlRmmBZHoib65xQXzg/Zuqy/6cXgZd145J8go5RtiBl3A1tA4bO+Ext
   GxsWY3s5f1+hy4w1zETnFEzoRyxNGnXZpZpZRwO5OInGxOiKRixPoRm+5
   kp1W78B3Mw5UTp2wiBKuD+OGkKrzeDheJwi01ZexMdQvHhEpeRZ/AHZlU
   NEGE8cMIJM5ho2AXgAxk4E2Kl1Z2dcu/8nIwoEqpR0xm/ghQCOhCD+ryT
   tAIL3MgSUJm4/0lnNx/2u7SK/k9jZVTACHuzPsmc8T8jRYs0JIEvk4Wr6
   kT4TJAFVV325d5XzmRqv6MBGClxXC5sWHmjR6XW/+AXwyMba5mMOhDRSW
   A==;
X-CSE-ConnectionGUID: 8M/Zst1xQW+lQHg2ptInEA==
X-CSE-MsgGUID: YomW/e8qQ8aq+2LFrLbxXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52665671"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52665671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 13:33:01 -0700
X-CSE-ConnectionGUID: JaZWrlxJT0yhOZA350EFIg==
X-CSE-MsgGUID: l1F6pAPZSqexGVpg2rBsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150860217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 13:32:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:32:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 13:32:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 13:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKUtu3XgeUj+AGsb5tA3M+ucMbjD5CTXTYPbLukF6PGkQjeNkB3slCySq0pJw4Z6bB8oSTyeBoO3IyYxHBn5s8Ii+FxUVEMLWjNfya796M+b592m7pS1LZhdEJkbXdgSfZu7N7OvVAiPpFO+B1it3nzuJtf0Eq7hkFW8Oj81UczbflyhPH8lp+1q/OUHIn8GVANf5uaHGLaNf5DAsXeZKHZZc5RvsAXK+KVFwWh8WjEY8zyRTEsn8gVu6qYF+ZE2OKxuO6X3bCiDEG4yXdUvwt/bWJgW/uXBaln5/e0X3R5cC+bV7qlAKfhwWheh6oXuOLAmRfDTZBDHDwWyvS3DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSN5lzeO6S/0ew/btJ7GtgQ8x1O9EP/7WuuI5xHmeKE=;
 b=NR28R/Ccg+wyVH9cUfA0bOXjICtFAhpEKg/L3iykSJBLba+zfLh2hTbNEjNhrVjzgI5ySvG8anKpIDcGCKB63rSCX2oDVvhnwn5YSAIezATtj9ZFe4+0SLiq1Hdrwul0qmr4/DTy0riMDuYwxvs4JYbw0Vy3wDPJAAr2ioyKOq3TxooOZOGo5uRHB6kECsZ4/wEUNnzcEvxN5m+rPlf+Vs91M5Wa278wI3J3n+zXyuIIXqECrqup7ssiqFKmgPirdl+mf1Zo3KaI6f1LVmYQHEfQ4aUxDXWNIYu1mkavrhJVGqZefqUliYMjk24mhrEhr8/kigZJ/4x5ilXOBTnajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 20:32:55 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 20:32:55 +0000
Message-ID: <9927b988-47b0-4937-9d6e-5dca767504fd@intel.com>
Date: Wed, 18 Jun 2025 13:32:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
 <7521ab39-73c8-4d11-b12f-bf67a7031d7f@intel.com>
 <d7e64ce3-e27a-4fdc-911f-bc33df743696@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d7e64ce3-e27a-4fdc-911f-bc33df743696@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcd4d10-2af6-4f75-0b65-08ddaea74e4c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHRqWGJ6dlI4NTlTL2dtNEd3UmdJMGRZSDBPRytQT0JjUjhhcWh0S211Y0RP?=
 =?utf-8?B?aGJTdFBEMUtTcnBtUlBFaDZZSHBQUGlKWHpuSTJxMk5KTHd2cEU4N2xPUUU5?=
 =?utf-8?B?T3hTWlR3Q0VnSTY2eno0ZC9nQllaWEdVTjlydHVJWmljSTB0V0k2dnF1NFBy?=
 =?utf-8?B?MnRKZ0YrNUxxWlpuSDZUYUpUa1U3MHZIRmNJK1VXdU9RWTFZeFhuRGlsTXlR?=
 =?utf-8?B?N2puTThJb3BTTGxTUlI4OWo3TnlTRDRBYUpuc21QMnRnT0EzaVNtNHJxTHJx?=
 =?utf-8?B?VlJDK2czNm96cnY5ZXhxeVgzaTBBTkFtL3BmRXhGNVkrREg5Y09jUEtvbGkw?=
 =?utf-8?B?MnUzaU5DODVmMzNzVnNGWTJpd3JSMUpGWVc3Q2ttbGFUYzJtOUVjUjh6Nkdm?=
 =?utf-8?B?SFdDWnVib1JnYTh1OUFYSEN4eEV2QmRwODZxVWRSMTBhWk1CeXVMU3BVT0xW?=
 =?utf-8?B?MWJyODdZV0ZDMXM1ZDAyaDNlQ3h2UUU2NzlvUm1BWVFxd0JkblRWa0dvdjRV?=
 =?utf-8?B?RDNOMU9MWXZUeTE5d2FKZmpGaU5UR2RnVHpUQVVDT0NxZHN3ckN4WVZOY1dM?=
 =?utf-8?B?S28zNmtEdDBZQjVmdFZYQlk4bzlRSy8zRzdEYjFXV2VoSndkdmhmcXNTK1c0?=
 =?utf-8?B?eUFvMzIva2NKK0cxbW03Kzg1b3lKL1B3VFFKRWh5RGg2MlpmMGpld0c0cXVB?=
 =?utf-8?B?aHNmVVZXcnBkNHI4cVp1WFBET0psKzhPQVhLVmRjQ0JUMXg1eERLNlhGRmhw?=
 =?utf-8?B?bEtOVWk5ZlZTclhqVEt0SXIvN2JNc05uQUpyVlNBS1JoVEs5Z0lzQlNDRTRC?=
 =?utf-8?B?aWZqYS80SXVZZGpuSXVSVkxDVVR1S2FTRDdMYW1Ib3FsWUt5alJIWCtxa2NY?=
 =?utf-8?B?RE1sNE1janZmbU1QQVpUeE51OVIwL0hJMFo3VjNzaDRXSWZJOGRuY29iYldE?=
 =?utf-8?B?aTNvRUhkT2V5TUhOZGtmd1hNYnYvbisyT1RsOWhPMFpmV054K01PRTJ5OFRn?=
 =?utf-8?B?dG1qOGNnbS9EN01tNG1aMzg0T01VZ3FzaWxBMnNIWlBYRGdrbEFBS0EzOGdB?=
 =?utf-8?B?M0pld0MvbUJBM3ZNWXRjdDBmbVFYYzlqbGRhenptWHg5SVpXNW0yWXkvclRN?=
 =?utf-8?B?aDQyUHFNQVlxajhRcHVISFIxNDhLQktLQUg2Zk93RTMvejBPZGdFT3BZZzdk?=
 =?utf-8?B?bU8yS1dCR1Q0cHdVbk5oaEIrV05mNzgwUkRiYjdjM2J2UEoxMVVteWk0elJT?=
 =?utf-8?B?QW5tTTlUYkk0cy9RZGZOZWd2NlZ4R012d1lhcG5md2hOQWlWWjhoeUh3NUdI?=
 =?utf-8?B?NmQzMkd2WEZZZ3IxWHNpSVd0OHp0ajdUbFhDb3FqRDBZY1lERHZuc3ZSNmpS?=
 =?utf-8?B?UE0yczVJTWlUWi81ZEJqd2VwaU1laXlxNi9VSDdMcjRmQ08wMGl3ekQ0MXlr?=
 =?utf-8?B?SWZReEpxOE8ycERMMnkyTXZUTUlMV2pmbmxzbmJDeXFISGlaTFd3dE12Y296?=
 =?utf-8?B?ekRtMlBkUFU4Ym5GVXgzemUyQTdnWCtlTkFMSWZ5a05wQlkzWnNEQkVIVzNC?=
 =?utf-8?B?Nm1EYmhlRnpqVUxNU01SWmF3b3JQUWZydExlMVdMYXBzalkvL0ROb25WTEpp?=
 =?utf-8?B?K3B6QTE2a0Q4UUs1Z21DWG9La1BvcUROSVJObU9pTm1aRDBJcDJvd1FlbE1F?=
 =?utf-8?B?YmtBUVgxa2xVMUNOSmpmRWJOVDFPMDJQTHNFZVNwTlVad3c4eUNBeThYeUxN?=
 =?utf-8?B?QThCeUEwcE1pNy9ScXA2NXhZZndaL1dYTGtYNGVmMDhkZEt3MHFXbGhjWXpu?=
 =?utf-8?B?dGIyVUJUWlNaeXBraStnWjhmZzB6YW15bWdqVG40eGQxT093cldKc2RJLzR6?=
 =?utf-8?Q?406KVRgp6ugUr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXpMM0U3NXZBcUdlZWs5bDJvRmViTzdYQTlDYUh3SExwSDYwUmQzVW1rVnB6?=
 =?utf-8?B?TG10bTErdmUyY3BIallBY24xUU1GK1dwM0V2eDNDQzNFZ3cvTlRCRlYzQVd3?=
 =?utf-8?B?blNuWkdLcVY0L1F6TW1FYzR0NElNVmRHSVNsaTVRKzRVTnc2R2FYbEhoaGFO?=
 =?utf-8?B?YXJxdDM1Zi93VWIxOTVaNnRubEgzclRwaGR2TFJKTDVnbUVIMjhSZ3N6bFZB?=
 =?utf-8?B?UnVQSUdyeGlCNE1pU0tzWExneHBtM3lVaHdPNjduSUs4VGVvblg4MWx5R0k3?=
 =?utf-8?B?OXcweXdjYWI5SGhKdTZFQkQ4R05CYjJMY0RqSFIxRGlwYzhRWWtkaEdNSVNX?=
 =?utf-8?B?R2pMdC81WUZzMmxESS9IM0p4ckpKaStiZnI3aGhKcS9hY01sM2lJVmhIS2hh?=
 =?utf-8?B?ZWhya0Y2OEtJZFhOZmYyTnJQVmVOQldxYnEwYzBmYnFaZkNUa3RKcjFIL0tT?=
 =?utf-8?B?a2trd005UUx3NHRpb1Q1bnc5TVVkNCtoSS9xWGF5S2g5NU03bTJXVkhwZFBx?=
 =?utf-8?B?aTVLTkdSUE1WdkVNS1QrK2UwOG9ESGMwS3hMOHlZdTliTW5hc3d2M1YxdkJv?=
 =?utf-8?B?SE9BZ1pXNW9XMmVLSDBxQUkyaXpSeFlCUDM2eG9CZzZiZDI3RTl4bGVUbWwr?=
 =?utf-8?B?TG5LT0VnR2RDN0hKRURLcHRKV2Y0b3V6Zm9ueEVjeVFZQ2Q5TDJYMTYwUWIr?=
 =?utf-8?B?NENqVUV0R3RkZnplMlpWY2lFaUp2SVpRTTFXTW0ra2l6dzhBUzQ4eFlhNTJs?=
 =?utf-8?B?UDcvbTBhSWJZbjdVYmdQek5DOVZFSXlQMmRBaVNacjg2ZUN5VUhFbm9Uc004?=
 =?utf-8?B?YWtJc1JoOEppaHlXdTVRanRxOU5OaVBNOERjU3kzYTdiYlpocUM3T05TRm54?=
 =?utf-8?B?ekdnOHhzZEd2UFNrdEZVcm1BR1loanc4RFRzekI5TkVjWW1XZGcxcHMzRHZo?=
 =?utf-8?B?SXFPT1hKNnlWV0l5dVI4NVk3blAwdUJvQmJiUDkvcTllMDRjZHd3a0YyV1VH?=
 =?utf-8?B?dGJ3dDlmeFFKR3Q5ZjlrL2ZCd1dQZER1T0JpaEdYQjFmNERja1pFTFQ1emY0?=
 =?utf-8?B?ckFiOTJoSElsNkVKQ0pXTHpLUHhtN3dSOU9acEVobGI0WndGOG54c1ZDa2Vq?=
 =?utf-8?B?b2x2NGYyVUt5aVQ2bFF4M250WEdIcFM1d1pOcXZmTCtWUjEzdHQ3eFp5RUFj?=
 =?utf-8?B?UTFhN0liUnFYRXp3RVErWU1CTVowZzJuWENrdThJbldkVHZZVWxxY1Q1R3Ry?=
 =?utf-8?B?a2lvbHBlM1c4Yms2dlRxbWJjRnU5R3JZczA1WnZTT1R2TjR2c2M4Wm84alNS?=
 =?utf-8?B?Ry8rWGpDQXNIekk1VEV2dzIzY013bUFMMVRlOVdQaVhYSk4xT1JWcnFzMVVU?=
 =?utf-8?B?WDdidHQweUhsUllpSTgxakpPdVFwNXVvK2RMTkJsQkFFdnpnSFBsVkRDMjJo?=
 =?utf-8?B?dEMvckd0Vm43eGU0T2txdndOUGJoRGQ2cU9rbHJ4QTloZ0tCWWZCRncrU2Rt?=
 =?utf-8?B?c0xodVBlMy9zbkgyN1ZzN01NMGtTdm1kTTFVWVZGbUZNVmxiMHdqcCt6c2I3?=
 =?utf-8?B?K1JMa25lSzcvbzZmQXVNUUJST3RmdnZYYkZzL3NWZjArVUhPK2Y1MjBRaEQy?=
 =?utf-8?B?YVJYU1dsMUM1WHQwcVppL212SmRxSE0wKzdmSlQ4UEE3d1ptZU5hYWVueUFC?=
 =?utf-8?B?SGR5N0ZXaEhNOVp6UytOcHdmRDM2L1FKRXhveTJUVmdqOWRKb1BsWG9JQUJV?=
 =?utf-8?B?QlBIUzdsUE9oL21GRitBMGFxMjZTMG5wWUxSMGV3dGJrQjg1bnlWdldlbWI3?=
 =?utf-8?B?QjNBQWx2RW1jMVBaaEtody9wSXZtV1h3a2h3c0FpbE96alN4bFdzazExNHlP?=
 =?utf-8?B?aktwMElFcVlhcXhieUFxTW56Y3RsS2duMVNCazV3YXNxNEV5Qm13ZjdPZld0?=
 =?utf-8?B?d0Q1cjhvd1pySGtiWS92SXpmbmt0S0U3YmNIVGJ3bG5CU3MwMWgzTDJVNElQ?=
 =?utf-8?B?VmY3RFljSVppa3g0UlV0S1JUY1o3MWx1WUJwcE05NGYxa2JuVXlXTEIvTTJC?=
 =?utf-8?B?T2Voa1UzQWZMVkVGZlI0aldyMmFNRWVtWGUxWnFIc0hWQzlWZzJOdTdhMWQ0?=
 =?utf-8?B?M09aazFDUVB0RkZLZHp0aUYvc1Q0MU0zZXo2QldFMzVxVUhWeStDcW43eU1B?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcd4d10-2af6-4f75-0b65-08ddaea74e4c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:32:55.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGxlY/WWyJO02wso8mwroxTY+j7hLeQoRaiPP6lB/67Y7NOfN3HnAywxo2pGxZufsbwoPgmZ7gVYw49jgIhwcf/gI8OLoLeaBvu7qO0oNtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
X-OriginatorOrg: intel.com

Hi Babu,

On 6/18/25 12:27 PM, Moger, Babu wrote:
 
> On 6/17/25 22:51, Reinette Chatre wrote:

>> On 6/11/25 2:23 PM, Babu Moger wrote:

>>>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> index 885026468440..3bdcd53b3ce3 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> @@ -229,6 +229,46 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
>>>  	return rdt_resources_all[l].cdp_enabled;
>>>  }
>>>  
>>> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>>
>> As indicated by lkp the inline usage needs to be fixed.
> 
> I am assuming that you are referring to
> https://www.kernel.org/doc/html/next/process/coding-style.html#the-inline-disease

No. I am referring to the lkp test report of an issue detected by sparse. Looks like
the message was not cc'd to lkml so I cannot provide link. I paste it below. You are in
"To:".

> 
> I will remove inline attribute.

The goal was to fix the broken usage of inline, but you are right that it may
not be needed here.

Here is the original report:

> Date: Fri, 13 Jun 2025 12:18:35 +0800
> From: kernel test robot <lkp@intel.com>
> To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
> CC: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com, pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com, yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com, peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com, xin3.li@intel.com, sohil.mehta@intel.com
> Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
> Message-ID: <202506131104.d1oo8NWe-lkp@intel.com>
> In-Reply-To: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
> 
> Hi Babu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on brauner-vfs/vfs.all]
> [also build test WARNING on linus/master v6.16-rc1 next-20250612]
> [cannot apply to tip/x86/core aegl/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250612-053050
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> patch link:    https://lore.kernel.org/r/b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger%40amd.com
> patch subject: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
> config: i386-randconfig-061-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506131104.d1oo8NWe-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    fs/resctrl/rdtgroup.c: note: in included file:
>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
> 
> vim +553 include/linux/resctrl.h
> 
> 48e63934badb71 Babu Moger 2025-06-11  545  
> 48e63934badb71 Babu Moger 2025-06-11  546  /**
> 48e63934badb71 Babu Moger 2025-06-11  547   * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
> 48e63934badb71 Babu Moger 2025-06-11  548   * @r:		The resctrl resource.
> 48e63934badb71 Babu Moger 2025-06-11  549   *
> 48e63934badb71 Babu Moger 2025-06-11  550   * Return:
> 48e63934badb71 Babu Moger 2025-06-11  551   * true if io_alloc is enabled or false if disabled.
> 48e63934badb71 Babu Moger 2025-06-11  552   */
> 48e63934badb71 Babu Moger 2025-06-11 @553  inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
> 48e63934badb71 Babu Moger 2025-06-11  554  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Reinette
