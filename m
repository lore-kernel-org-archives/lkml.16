Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C82B9B7;
	Thu,  6 Feb 2025 01:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803986; cv=fail; b=VaU6prK1D+S1ddzU/3D4dXaEqz6J+AxJnFQch+IzvZmd87273bqTzS9NqC485E/WGSSg2hsxUgpqLeRgQTN61G8E7rhxpFQ2Fu3nkPx4vJQYycYyhbmZxy8WxPwMZnRyQEBQGMwgitzL4+XXiIG0v2E+PQNwXh7Nz+DBygJ56ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803986; c=relaxed/simple;
	bh=4HVzugzqmVvpqwEtPN52DNjKEhRkh158YlSLCSvBaPI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T2Lifq4jloIT/EjcAP+KJluuKlFioF+lOxmkUxkBe5qNW//wPqm5VlLcT6RLL+BZ+GnXy+zvardB4TSG6yPQU1jQeLfhjsE2yWwYISmlWvkEj3pFPtzlcvRXBZkpxFyE2+rh/zlO4p3/7UCLWSeZda437kXVMMIrzIfLHhI5QCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amjBykBI; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amjBykBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738803984; x=1770339984;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4HVzugzqmVvpqwEtPN52DNjKEhRkh158YlSLCSvBaPI=;
  b=amjBykBIAT749QhPWZDcTJCe+0uQXJyNs8aIrVaVoW4AMS942XQUdhjN
   FhCAuiQytT9rtO5j0ndvRg54xgFdDLUbrb5sbE9z+/05aLvy8cp6I7WEq
   0hK+jUFJArmgCwyfVr+l8x6Hb859lXaTUvfsCiArpQMSS9RoA2Oa6eFWe
   9vV9/OusiEjxm2N+roy6c/mcNr35/QDYw0tPnC6UqRQCilZvxulhv4i33
   DK/MAkOWobeoX0N1ESoAK+QU2K1TE+O8++FITf3LqhMlb+HKD3hVHGQNQ
   ON7kSvM79qp+RA4gMH38k92x0bK4/S0R//UUNUVNltGltPo9GXU0trx92
   w==;
X-CSE-ConnectionGUID: JLM6454KTr2Q0vR9Tvjwig==
X-CSE-MsgGUID: fVm5zkRkSxigUdUpW8RdSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50013106"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="50013106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 17:06:23 -0800
X-CSE-ConnectionGUID: NE7z+jGwTaeuscopWlYu6A==
X-CSE-MsgGUID: rAR2SD1HRkuxXFhXmfM21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148255248"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 17:06:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 17:06:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 17:06:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 17:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3qDVBPoHujBKl5wSRNr46tsVb+yfikqc/MSUihdNP0ndQGyrgKB8EIGs7mawUNLriPcGNva3hqTsx3sb1xDUg9Eacv0hc9EqPma4l/O1rE6bKx1rHzqGBRKNGGffi1kSRQ94g+xLMGf94AtR9J/azO/4Fw7h8WLd6J3AChafTjeringGcjMHBbugBUlyavykQG/J5+vOypSk3jP/p5pXYKIUBlQ8aQUgdGO4MocM/rVNHCMsnMVnOLFKy6RZwB7eOU59RfAeUI5K4ofK0YmJJFwlf6ed5RhfGFDZrbOrLEH612b0n4GaZnBoVH3Pxk4A8CD80+5zM9eeVFlliD9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcTKgLx/u6GzdpkFKzDyy4qW5R/ZE7mvO05bWEKZbio=;
 b=X8D84Ab67E4pAnaWVNRuhbZ9ZBlfLaQO5nbhr4BYpXspSTd8jjb7gwku1YIFDBM7CCGlJSadduv5GlVznFP+d02t7fCkJ6OwNnMN1d7ZTG8wm3Ph1MQGSzdV0poUV0LNEfQnFt4T7Ar83MPl6uv7FzDnuFslgV2g3nPXdHAqovUJ+mdIUAh3uR+8LD11Rgh4mui2UAeAYDQi4lfGcQpi77uiqf1hQTODZ3BBEWlZDg38wDcGfGoxY/Mr1CpRGgpkGgWc6g/2MMe5+eSW9BbiCt7LmON462iOGWot2b+3Vt3yC7ksNF4bTHIBUk7W5D1mRVty1Nh+shI5Yllj3BrB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 01:05:51 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 01:05:50 +0000
Message-ID: <b49fbe20-ec79-41e6-ba58-3e5c8fab3a46@intel.com>
Date: Wed, 5 Feb 2025 17:05:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/23] x86/resctrl: Add the functionality to assigm
 MBM events
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
 <c6f275566395ffb528f1bd254335c13274567c7f.1737577229.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <c6f275566395ffb528f1bd254335c13274567c7f.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 931bc9b4-022f-4a47-fb5b-08dd464a65ad
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE5LdWNibDMxMDVQcmRodERTQWpyMTJvQ1FuVzl1WnA3TTNkR2RkNDMzc2RG?=
 =?utf-8?B?Wmw1QkpYZUZMb29NZVU2ZUpKRGdZdDVmZ3lVS1J3RVZBWm1GVThuY3czNlhB?=
 =?utf-8?B?aEFrS0pnU1UrUGUyZ2RISnVWTVVtNGF0RjdrYkQ3UzkwWk16L1cxaW4rdlRM?=
 =?utf-8?B?L1dxbU0veWk0T000bVVnc2wzWmllejFTY21TMTJIcHNKZGZwK21IQVV0MW14?=
 =?utf-8?B?MWxudzJvYWIrRGJNNmhKVWdzdGJ1Ti92NXNhM3FHWnJBVmE0RGlLTHFMSmZQ?=
 =?utf-8?B?bUY4UUZLbUpUcVRSanFpaGwxSDdXQ2c5L25Lcmg1RXg2b0ppck8wR3BLbCtV?=
 =?utf-8?B?M084L3JQSWhoOEl1QkxOY3c1RnU2dmZ6RURtVlRuMDFFdmtGa0dwWTRJRXhK?=
 =?utf-8?B?Q0ZIcnpCY25kbVVLN3dXbnBJeitmM3ZHcW9kdmN2VkpSeTFUQnVKTW1yUGdt?=
 =?utf-8?B?VWpOemdKditXZ2cya3VIQ0MwRVZiU1h4UzlvbGdOZWExVjJwWmhjWEJsMm11?=
 =?utf-8?B?cGJTMnBsTjJjOU5Gakx3bnZPRDVEejhUUkxkMFFLcTVmMWVQZXhSZUsvbDZS?=
 =?utf-8?B?MTM5d2NRY05CYUJIc0V0Y0ZSOVhqV0o4cWtvL0ZxenJOa3M0d3RDZzJBZ2E3?=
 =?utf-8?B?UHNSRVZXUFk4ZWZXRXpLMkZDNGxtT0JKSkVxZ1hoWGhNODdPd3A2L0dma2Iz?=
 =?utf-8?B?SFdDakdhaXcvZXdIOTRRQ3dHb2hoc0x5YWl5d1J1WThHMmVwUGlWQWZhR29p?=
 =?utf-8?B?cmpYYkltajMxdHlWbHNOQ2NzWk9sOUtjRGZDUllWdEV6NlJxUXBjZk9Uczcz?=
 =?utf-8?B?ME9qRjhzS0FwM0poY1BYcmhtaDJYTlhoYW5xOEdNWnlLYUlrWEZhUEs2aFJR?=
 =?utf-8?B?T2RPZTdXUXZyYkwzZ3hCbDE2ak11bVp0b1dobmtqYXlkMVM0QTI3RTVpUDNK?=
 =?utf-8?B?Z2Nkc2I0OVlBWGpYdzNRZ05zU3lPMndQQXd4aVN4TW05d2pnYllJM0E4akU4?=
 =?utf-8?B?MWNpbU9FcG1hQndVTkpMZUYrdXUzTE8zd1N3b1Y5akZlOXhGWEFrL0dBUk45?=
 =?utf-8?B?UFJUdGNOdDZEaUNzVzI4MnV5OFlqelhDUmw1eTU1d1RyaXZGSHIxb3lNWldp?=
 =?utf-8?B?UmR5VDFUYit6K2FIT21PVW5DejlwNkpaNUl3WUlQNm0vaHoxOFk3UlBxb0E5?=
 =?utf-8?B?L3JEWHBjWFdpUmpKRmpGdzVOMmVwWEo4cVlPTFRoUnZZY25kNWw1RmY3ZS9w?=
 =?utf-8?B?eEIvMHJ4SWE2RHVjTGVkeXphZHp6QWl3Zmk1djZGekZXdVpBbGFFbyt6Z3B2?=
 =?utf-8?B?aGllNi81cmI3NU44SmRRRGZqNUdSMk1qdTg4WlkrZXF0eWxyMW8yckpUK2ZV?=
 =?utf-8?B?WHpvZytqWTRJWEFUZ0VUWjhIOGRQOE8rZ2FLeGcrYlN2UzNJeTAvTDUwaVpC?=
 =?utf-8?B?OXFTZ21IdW1ROUJQbW9zV1NXY0hmUW9SUmZpalAwM3ArcERSRWFqU0VqMkdp?=
 =?utf-8?B?K05hK0VQNmM2dHhNSkpuR3lrSC81Zk9aWW1lQVpISEZHT1hFY0VhN1ArQUFL?=
 =?utf-8?B?ZVdBaVdqOHBKMUtxR0pSTjRvdEdBVXBxcWMwZ3k3VHJMMmN5SkpHN2N0djg5?=
 =?utf-8?B?SXVSRWRPTTYyalY1ZHNXRWZtdjU5ZUJKYkRVUHJQWDc5cmI5TEFjM3FkZUo3?=
 =?utf-8?B?OGNQdnNHem0zVFhwRU9MYTYrRW1iZzY0Z3hKVGtpR2pHVW9uYnNSUzZhd3Qy?=
 =?utf-8?B?cml2R21jRDJ3S05abzRiMndhanF5Z1A5YkFhR21BS3VoQ2k5RE1HTG42Rmg0?=
 =?utf-8?B?dWhMTDBQOSs1a2JoWmI2Q2VURkhScUJqMXZFMmNlMnBmc2xVY0tmRUF0RG9Q?=
 =?utf-8?Q?UC+JznvngbY1s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXR0Tmk3L0o3VElrOEFVM05GY092L1V5UFZCWGZnS0JXOWJaaTFjRGFVaDhj?=
 =?utf-8?B?bmlhbFBzNml6NGhNbmN6MXNNT1RBQmVvRFlhUUp6YjJmZGl5bzZDejE2SXh3?=
 =?utf-8?B?dllNT0NYV0FtaE81ckZBNW9jaUdmMzEzTDNQczNGdDVqcmVta3B2WDAwdFdn?=
 =?utf-8?B?TnhSbVJqaXdETkE2ZjM4bXAvY2dzemVPaC9JbWlnV1FJOHQySTVPajVoMHdL?=
 =?utf-8?B?VEV1U1hmWUpRMlNOeFowN3o0UlR2ZE4zNjJnUXJTSlBJS1h2aGUxaTBJS0xK?=
 =?utf-8?B?eVB4TjhDeEpCZUt4WnFUNlp5bUpRNi91VFMyQ08vellzMU9SRkpFQUY3Z2FP?=
 =?utf-8?B?eG9PWUNLVTJvZG1XbHl0VngxMVBMSnF1WUI2bG5mcUJOcmVwaGdpZ2V0d3BM?=
 =?utf-8?B?YTQ0dWFYajZ4T0pNd1owMW4zWnRyVG53K3Ivakx0ZzRVakEyV3NZMWdqRVpB?=
 =?utf-8?B?eWVpTDU4b2xVWGhyWi9aKy9IMGhNa0JLSWQwQXlac1gwUTVlenpGUHpYQVlR?=
 =?utf-8?B?dDlyRFFqV1ZZbkZUS0IwWG90Ry9zWEJGRFNCbzBqY1I1dlkzT3ZiQ0tOeDZ0?=
 =?utf-8?B?ZGFYYk81YkJmL3phaXFSNTZQQ3h1UWRldDdxYWNYWTVOWFZpRGtKUU5jRXI4?=
 =?utf-8?B?alZjZzJ1Q3VSQi9uQTd1UUNIZk52ek1SQVRqcVY4NXdJSmQxd0U0VkRzYlFM?=
 =?utf-8?B?VVZuSk1admVRRzhuYXVnbDNkVWJ3STl4UDlNMEtzamFRNFhONEFneXY0emdT?=
 =?utf-8?B?R0JpMHJzMHJkbVA5UUNvZ2w3RWRtREg4VTIxYm0zM0lqeW1kUU9Lc2ZSMHQ5?=
 =?utf-8?B?RWxMdHJSdllCdDFiWVh5aFhrZFdJWHBQdjlXcHVPYmo3eUVXNkdtTWxYQkk1?=
 =?utf-8?B?STlidjQzbVduak1zb2VCbk03aGFEUnlDMnJuaG5TODFMMXpEbERJSmFVeVda?=
 =?utf-8?B?UkRlcThiY1E0ZlJNMWZOeks3dFJYVkxMNHFmclorcFBiVUVhNDJHMk1VekUz?=
 =?utf-8?B?WFdrRnpOdk42dHFsQStlZmc4a2RsdWNUeGhaU1dkTE9acFB6VGRpbDN2Y2dX?=
 =?utf-8?B?M2FsVnZuTHcyMmw5OWRBN0tySnhsTTdrVlNkYzF4bFR1SEJUYW9WVk8vN2ZR?=
 =?utf-8?B?ZXIwbW1XeFpqcDI1WGVDSVQwQ1dwNXlBcEE2TWsrS09Qck96VFNtNUUwMVE2?=
 =?utf-8?B?V01RK2JHUk80dzlwLzZPVGRZNjREemNLcG05a3hzSWl6UGtVakQ5Y3hFQ2pi?=
 =?utf-8?B?Y29NS29hTjhBNW94eWdQRXNzZlVySmRNWHBjWHcyajhONVRkK2wxR2FYcDZZ?=
 =?utf-8?B?QnlZbk96Mmc3MzFRZ0RCYzhNU1cvNGg4dU5qdE9xb1V4allDbS9DQitiN202?=
 =?utf-8?B?WUxteXh6aE1zN2diaGVBbmNhRldtTHRaQm9pdHhySENoTGxweEY3bDRoT1g3?=
 =?utf-8?B?MjYrTkkwSE5oQmlDS1JQZlNLMjRRUEdHM2tSZVdHZmdIM1FIeEZQdms2d1d0?=
 =?utf-8?B?QmYvZ2pPMXNKRHR4ZjJQQ3N3WTJxVzVKMkh6eUJHMnBEUEtGd1cxZHdvZjhK?=
 =?utf-8?B?WlU4NVJuK0VhSStZM3I2eXVRdFovMGRoc256ZllvM000ckl5dWRpa3AxbHBp?=
 =?utf-8?B?eWRRY3d2V1JmT3JhN09nT2NjbUJiWW44Mm9idzJpdXdyQndwd09RcVNGY2Na?=
 =?utf-8?B?eXF1MFIva3hnVGZrR1Y5eXVmTDFVRXQ2Zm9IVG92b0l2dXZzOVNrVXJZeFZO?=
 =?utf-8?B?TFRYeFpSb2tMY3duaWpqSmZvRE9obDFCZnVNVkRvNk5NRXZmc0oxQTJPSWpV?=
 =?utf-8?B?NkxjRFM5N05uWDA3dGNXVGtiM0ZLc0x4d01SekpNVVIrbkVuUmxocFduS25a?=
 =?utf-8?B?bXdJRTJYc0c5TmVpNkh2VEpvSWxiTVBwRC9JZ3hyVkZzd1liUHpZQi83YXZs?=
 =?utf-8?B?Zzh1UUdjV2pTZlFwMm1rR25uWSttREtWcFhzdmRoQzBjcHdabVJHS21kcE83?=
 =?utf-8?B?TnVYWm96dUhRU0pvb29zNEdtbU51N0ljaDhTZEc1Y2FpTFV2eEtVbUFmeXpE?=
 =?utf-8?B?NlphR1dPQlAzSXNKWUlFc3J6WmF5ZVRreGE5Unl2cFpQc2wvSmMyQzNqNWZ6?=
 =?utf-8?B?S0VFVkdqcE8vZ3RyWUZZSjNQMHlsS1Ryc00yWHpyVlgxSkVPNnZzMkxUUHlF?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 931bc9b4-022f-4a47-fb5b-08dd464a65ad
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:05:50.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2+6sk8ugQ96ikMHn3FXufoj5E7PjEhPtN+oR4fm308ilUubAtA6C/7bmH8fyjxqrAtWpDzGHsSeMvga26/g0nzOmC+YIq7P8wGZLoShVcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
X-OriginatorOrg: intel.com

Hi Babu,

subject: "assigm" -> "assign"

On 1/22/25 12:20 PM, Babu Moger wrote:
> The mbm_cntr_assign mode offers several counters that can be assigned

This "several counters" contradicts the "very small number of assignable
counters" used in earlier patch to justify how counters are managed.

> to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.
> 
> Add the functionality to allocate and assign the counters to RMID, event
> pair in the domain.
> 
> If all counters are in use, the kernel will show an error message: "Out
> of MBM assignable counters" when a new assignment is requested. Exit on
> the first failure when assigning counters across all the domains.
> Report the error in /sys/fs/resctrl/info/last_cmd_status.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

..

> ---
>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 105 +++++++++++++++++++++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 161d3feb567c..547d8a4c8aba 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -727,4 +727,6 @@ u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>  int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>  			     u32 cntr_id, bool assign);
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index ef836bb69b9b..127c4000a81a 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1413,3 +1413,108 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	return 0;
>  }
> +
> +/*
> + * Configure the counter for the event, RMID pair for the domain. Reset the
> + * non-architectural state to clear all the event counters.
> + */
> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			       u32 cntr_id, bool assign)
> +{
> +	struct mbm_state *m;
> +	int ret;
> +
> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
> +	if (ret)
> +		return ret;
> +
> +	m = get_mbm_state(d, closid, rmid, evtid);
> +	if (m)
> +		memset(m, 0, sizeof(struct mbm_state));
> +
> +	return ret;
> +}
> +
> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return cntr_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +			d->cntr_cfg[cntr_id].evtid = evtid;
> +			return cntr_id;
> +		}
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
> +{
> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> +}
> +
> +/*
> + * Allocate a fresh counter and configure the event if not assigned already
> + * else return success.

I find this confusing. I think the "else return success" can just be dropped.

> + */
> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id, ret = 0;
> +
> +	if (mbm_cntr_get(r, d, rdtgrp, evtid) == -ENOENT) {

This can be simplified while reducing a level of indent with:

	/* No need to allocate and configure if counter already assigned to this event. */
	if (mbm_cntr_get(r, d, rdtgrp, evtid) >= 0)
		return 0;

> +		cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
> +		if (cntr_id <  0) {
> +			rdt_last_cmd_printf("Domain %d is Out of MBM assignable counter\n",

"Domain %d is Out of MBM assignable counter" -> "Domain %d is out of MBM assignable counters"
or, the message can be something like "Unable to allocate counter in domain %d" to not
assume the error and just return the error directly. resctrl_process_flags() can in turn
not override the error resulting in -ENOSPC returned to userspace that can be interpreted
appropriately instead of always returning -EINVAL and requiring user space to check
last_cmd_status? 

> +					    d->hdr.id);
> +			return -ENOSPC;

Please do not override error of a function.

> +		}
> +
> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
> +					  cntr_id, true);
> +		if (ret) {
> +			rdt_last_cmd_printf("Assignment failed on domain %d\n", d->hdr.id);

I assume this targets the scenario when user space requests "all" domains to be changed
and the error message in resctrl_process_flags() will then print "*" instead of the
actual domain ID. If this is the goal to give more detail to error then the event
can be displayed also?

> +			mbm_cntr_free(d, cntr_id);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Assign a hardware counter to event @evtid of group @rdtgrp.
> + * Counter will be assigned to all the domains if @d is NULL else
> + * the counter will be assigned to @d.

Please use available 80 chars.

> + */
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);

This does not "exit on first failure" as the changelog claims. It actually looks like
as long as the last domain succeeds, while all other domains fail, this request is
considered successful.

> +	} else {
> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
> +	}
> +
> +	return ret;
> +}

Reinette
