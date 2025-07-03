Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC024C060;
	Thu,  3 Jul 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559754; cv=fail; b=gtZU22cgN7tFxF+6wKR7+Sx4r++4WTDQlyoRr5Oo93J0im5e5fVOL7If8T+WwcTVJWpbtpBxAFR4HedWGg9wE5OXT8tRon52UvWmkUQ/FMPDdLoA17aQvrH0Osk7HisYs9ku4LSVdXO7rI99GjHBefzbIcNDr2CIcS0xHsDFxCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559754; c=relaxed/simple;
	bh=wJm7M9/CBq965+GifxVTOie2qep7l6BL9c+HChw+8E8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eJZtTc9JV4wHCdsJc54e2Al4CfOKiQcThH+6kJUujlYSYA1+H9rPW7fjozKvarwUONEWShgY4oFzodZbr/MDIUPgsyJqAyZAlHa3+N8Yc2Q000KH25tLZunF0OHuq7VFU5zlSk6jcYsBP+J3HP3l9/at+hwmt02nwKmYgxXubDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKmhssdV; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKmhssdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751559753; x=1783095753;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wJm7M9/CBq965+GifxVTOie2qep7l6BL9c+HChw+8E8=;
  b=cKmhssdVlZiCPQ4Ql3nRUnJ/pfSG8WotMzC0/9whCPxNhrCVRnJHDNZ3
   lMuYgRCO7GJiwY7yGygpaVSljrX3b2drBoIElrmqxyX8WfmJ2yY5krI4y
   OPzs0vw/++mR6ZFoL7jvryimNMuoEmS/WEP1PrNzT6IaICGupVIpWbSNH
   MQHCWho0w5PsS9Y0BGke1l7mYvJu3zVlKJMw8OJeW2KsRzxr68GE9RZy2
   TqxdzGDcg+m87y4S6Gp2omO2cL5z3WccOyWm6Rapsn6m1MT9vvE2dqgIo
   Ti/kSWVIdU/RCaNUNPbi2diaKRXP940n84gDT1eIRRztOKNWHo77p00Ff
   g==;
X-CSE-ConnectionGUID: 2WT8l2hcSMOp0EVOgXfcXA==
X-CSE-MsgGUID: Ckm67xGnTrGxxETWGX7k5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56513726"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="56513726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 09:22:32 -0700
X-CSE-ConnectionGUID: mSM67MphT6Wc3kpGSnlygQ==
X-CSE-MsgGUID: 3TUiZfZSSx2ETl93bLkrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153845480"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 09:22:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 09:22:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 09:22:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 09:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDn0c+XAGlms22/HhFir0jjMsqiCza+/N95qA9SbEbY6EzQKqegaMxYTae64dYccflQr+j1st0L8bIKxkp/5Mx9wHBp4qK6AzpadH4BExybv+CrJoPRzgUOASIr4AOKC3C5iCttEA5Y+K5O+XyWoWptqJ2U/o6HS0vjDRtAvC4ysSGb8CXpnAdGnqpnPgJdwCcRSYWgeXNgHOyLJI27Xyfe80mi+zi0m33QRwjeXzniTqwFpU64zjH71qLZXHD+nF7EGE4FYsxFz+ypSXwdqqQ3msU0vuLSirO7uf4qtuIxUtftfuCjJusMVs0T57keyGqcwug0I9b8HxeCKVITEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3+fnlhF0CBNwaMrsYvM/LkNIe9kxuuixd5KwSuEPRw=;
 b=tPvAI4c8wH1iI0y0HIVoDEx6NY3GLjh/M360YMjrLjyOWd6NCIusDv71WIPj5v0EyyUkSb5ojOsqRIFP6LdFmySRcqGGXiZ84wR3e2QNYmxB+zh4ihMAfOb9KDO0bzIuW1HDuYGlhzaLtaMA9M9lI/ZagxV3D3UHIW+hII+nar9du5PTtbo3psYzdkG2P9ocLEQh86xtmvuc2l7sQ3s+SpOu+sEStfg2o9zDMGQEj1tqPpaM7JQAwN7V1KrQ1NqTtNKa6QcVuUrJGSmOVQ1rEJDL9MykmXfdP7JuFsAotNLGGAq0xgsdBpqhURxuxiFkOLHbGeeR3V2otDWAcyPCMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 3 Jul
 2025 16:21:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:21:10 +0000
Message-ID: <d5c4d3e8-6d5f-4892-83b5-867ec8bfc97a@intel.com>
Date: Thu, 3 Jul 2025 09:21:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when
 mbm_event mode is enabled
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
 <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
 <f85e467a-1d17-4f34-98e3-512679baad47@amd.com>
 <ff314427-1c03-4e26-be19-c5f5090f3d8a@intel.com>
 <471975cf-1094-42dd-a965-f536cf399d0a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <471975cf-1094-42dd-a965-f536cf399d0a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0271.namprd04.prod.outlook.com
 (2603:10b6:303:89::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c418f3-4890-4c2d-3520-08ddba4d9f2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anR2TFV5dGY0VFNKU1U3b1RvNkp0S3ZsWjA1dE1JQVpuL0U4MnZQQXJwLzda?=
 =?utf-8?B?YWFHSlFSYnN5V2diV1ZUd0ZBRTFpZU9SU1h6YzdaTVgrQ2FPZHhNQlNFUmdH?=
 =?utf-8?B?cGQyNXVlKzMwYWxpcTF6YUFMQW5rTHg0dEoySTJONGM5cW5pcDFCSHNJRWhT?=
 =?utf-8?B?djlXRkR0QTdHdExyeUh4K2l0eDlZREF4cG56Tlg1bmxTOVRvY294ZTBNSXVI?=
 =?utf-8?B?QmZFYjBubUdCQzZLSzd5ZW1yQ2lIOEl6ZVl1OE5MdTRQQ3NsM3lCT2tmSkZi?=
 =?utf-8?B?bk9TUVdhSUJqUm1KcEk4Wmh4Rjc4N2J0WVpYbkRUUm1PY2lGYWx0QjhiZ2Fx?=
 =?utf-8?B?bjBORTBNL0JEVkFXclhaNlN6VmtJMVBMOURWaWFmWHpmODhjOVBKbEVNZ2gy?=
 =?utf-8?B?Ym9ucmZsR1RUMndkMllIY3FmZ3ZuMWdiU2lYNUZqN1dnQ2ppU2VZNUJ4SFNv?=
 =?utf-8?B?dWN1cWszeXRIMjRGdUx1ODlXYkxrcUZpMjhLL1ErZC96Z0x6c0t5ZURJYkR0?=
 =?utf-8?B?Y2lJa1gzSHF1UHJnR1JzaUxoWG5wN0dvK0RmU2lzeVVGNGQ3SnBnMGw4ZkN5?=
 =?utf-8?B?OVZqK1NNR2Q3RmExTjRxd0VuSE4wa2RGNlRiN3R0aW1hZ281R0tyZFBRT3Ny?=
 =?utf-8?B?cHg4WGJlL3NZWDdjaDBIYithYWdTRE1lSVNrTXIyR3BLRm5zTTBkdTVFdmhJ?=
 =?utf-8?B?VHVwT0NUVjd4OSs0YXFnT0Y3N2htVDV6enI3Ry9nMFhQeVR1c3ZlbGdocDRP?=
 =?utf-8?B?Y3JCOEJZQ0tSY2JvZmNtejhKdEZFTGxZYVdyUHVmWlU0MWxrbHU0QWZjcGdP?=
 =?utf-8?B?RGhCVjZ3NllrSzNId1R4dDVsbUZDYUE0VnZTMEpDNHVYNFRGbXVMcTRyemc3?=
 =?utf-8?B?dDBjSHhVNlhJTk5LY3hrUW9oK2w4ZHpSOXppMXhyVDNDcGhZSUNhalVpTjU1?=
 =?utf-8?B?TTMvKzhJclcwcWpndUk1TmhCeVl3OTlmUFFQT1R6Z2ladlh2eTFLUzlxS204?=
 =?utf-8?B?eVJ2WlpLZy9aanpuMm15OVFLMzVveE1hVTdOQWJzK1hNakVSUHlvY0h3SHIz?=
 =?utf-8?B?YUFMOEZyajY0eFN2QnZ3L2I1OWNkSGNQbVJwamlTT2JvUXk4UENiUjdkbmJ2?=
 =?utf-8?B?dE1reVQ4dFNoMGZFUFZjdmZyREVhK1hOcjdoTWYwdmprc0ZiMCtSTXVaVm9R?=
 =?utf-8?B?bElyRFNtUzU3NFpFdTV5WXBzQTNscTQ1VG1oby9vUHpFL3grWGh5OEt0YmlX?=
 =?utf-8?B?S2FTMWJpV0ErUjZzRForclkyZFFpS2ZaZks1am5naUcvdlZqM3hwTWxDRW9Z?=
 =?utf-8?B?MjlOYkVlQmVGcHRkUHVmTExxaDR1Zi9aMUJoTU1DekNud3NjM0RscDU0TlJD?=
 =?utf-8?B?T21Cd0JVOW01TUcxbk5iOHhiYU9LWllRUzliWHhRcUIveW9JZ1Yzc3BHUlFj?=
 =?utf-8?B?ZlhIVldDL2g3c09xRXhPZmZsNVpDemtiaktVdkZ6Qkp2U0FTc2pQbi9MMFRh?=
 =?utf-8?B?dnBBaE90cUZPY1IrdlpsRE9qM0oxczhaY3hlK2c3TkNYenB2VjJjdFIrOEsv?=
 =?utf-8?B?RExXSVNQYTZIZ3h5TnVvcDhRT1JxcTFFQVRjTjVjK1M5ODJodmVDVHI5NmFq?=
 =?utf-8?B?c0lPUGU1Nkt2YXpIcUtCOHc2RmJoa2RUR3hMc0hZTFI0OGZnU0l5UWFNZXNr?=
 =?utf-8?B?SS9vNm1qRW8rTzV4a3dVNmVRdjA4ZlFpRGZLbUx0QWpWc1NpZDI1TGlDYStJ?=
 =?utf-8?B?NGVyVStUa24vYVMzaGR0SU9pVmJYVWtjM2pIU1orbGJQbFVkSXJRNFh2K0ZT?=
 =?utf-8?B?TkZ5dVQxTGp6dC9mcURTd2prcmlvMTNNdDRpY2lKMktsV25jay9mWEVyUlpk?=
 =?utf-8?B?TDJ1anZRV2U5aDdKaFRvMVVPanlNK2l1OFFxZi81d1ppVnhOcll3bG9jeDdO?=
 =?utf-8?Q?4YteVK4vej4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejMvb1ZWOGVjdzdCbDRDdGdsUlB3SGwvRDYxeHNLU29BUnV1L3Q3NmxUOERV?=
 =?utf-8?B?RjJMUk5KNGFLZGxHcHZBTGs4UVRoWWhEbjMwNVVSaXQ1bjNPaExKeTR1dWZp?=
 =?utf-8?B?cjFTUjh1T1l5Z3JBZElVYkN0SFlPZ09ZM0NZblordnpFYjhKUng4bUdJaFBD?=
 =?utf-8?B?YU1xd2ZBTGwyakZ5VmNSeXZwQjhEbUlyL1ZxTkxVSFU3ZWh5K09iNVU0alJC?=
 =?utf-8?B?emJKNThxb05hQy93RC9Tc01heklGTGJFaUpmSUxkMDNQb2xBdXpRajR6QjRr?=
 =?utf-8?B?Njc1MnZGRWJSajlCcXVJT3NKbk9jTCt4dktGb2taRnU0VWltNmd6emZReFht?=
 =?utf-8?B?bVdYd091aGRTUE80UkNXRnprbmF5dUFveFpsM0tySW9RT2RBTTNFUVd6UlpQ?=
 =?utf-8?B?ek5IKzk0eHdEb3ZPOUhqWlBQYzQvMTZSdmZrbkZyWXBZaWJqbk5QVEZwUEtJ?=
 =?utf-8?B?dG1Ic0czVFdXdUVmazlYOVkzNWRNWG05Nnc4RytqcnBQSXN5d0Q1b2tkTzJ6?=
 =?utf-8?B?WlNiV0dycjZkOXdzcHhoWG1EV0toMzB3bVVyZFVzK21lVzd6T09MN2dJWExL?=
 =?utf-8?B?NndRTkc5djF0ZlpGWXloY2k4WjNXMVg5Q2NGbFA0MndRK1BMcS9VMDBOcDRn?=
 =?utf-8?B?QzlkVmt2ZG9MUWhVZjlDSDR0SGdlbXFxYTRuUTM5ejhiUzZNZEFJcG9xMEdv?=
 =?utf-8?B?QnZMSWNKd2UxRkFIUVltbHI4Y0pHclRCVUtoT0pTaEp5SDlsZ2dIUEhObkY2?=
 =?utf-8?B?UVp1bUhmYTZ0clpHdjJxR21JSHkvOEFORzF3WWphdStlbjI1NUs0dzdGMjQx?=
 =?utf-8?B?Y2VXUnQ5Z3hMQ2FYVkJ3dHRKRHc4RTRZS2Y5VzRKTGdBNkRtRFZWZlM0VzMv?=
 =?utf-8?B?TktoR1EvTnVwSUQ1Q09hMzUxUldGSzFqT3JMWTJIRVVxZEduREptNE5Udkdz?=
 =?utf-8?B?cUdQMUlFL0FSYzh2NzFJb1RiWjdXcWtRQ2pIbGZEOWZBdkVaQmVQU3dPLzcr?=
 =?utf-8?B?U1pxQXQ0WlpUcUhMRXgwdTQvMlRtV2tGWmFJWWY4a20xQS9GN0FtcDYyblBF?=
 =?utf-8?B?bnVHSk9RWU93a0l1bEtvVGVoUWxnbm9LQllMckx0U0xMalpzbTFlM3ZBdUhD?=
 =?utf-8?B?MFBOZXVpL09SWmxjN0xmcWxVOVRtZ1lDQUUyalBlcnpoUytmR3hPbXY2UFVt?=
 =?utf-8?B?KzBjT3NYQy85S1lFRFRxQ21hUGNOQVUwOUJFb1NPNHZlYmw4YXJkVlYzeWVP?=
 =?utf-8?B?cHYrTThmVk1QOFJJTDljQ1BiRG9kaWNWSHQ4ek5NaGpwTXBGMTM5ZFZsRElu?=
 =?utf-8?B?VzNreWlyTWdBTDN2dXJCeVMybFJLSCtNakZiaU9LSUxneVBPb253Tk5MRk1B?=
 =?utf-8?B?dFZiVFZndGlLK2h4d0N5emxad0ppaG85QmN1d05RU2JnRHRLNk9RdkFzNVd4?=
 =?utf-8?B?QXBlQ2FRblU5a09iNGJscGlRamVKbTlGZmkycDdoZVcwYlE3V1ZaVmh2Rzc0?=
 =?utf-8?B?YXB1UVRoVStLcXlFcWd6WE9DMno2N1hOK3AvRHlud2l0SndrRDF2RCtxLytp?=
 =?utf-8?B?ajJiR1ZET1dGVUhmcGs0L0x2WHkxMzVWblh4UW8zYUh4UDFjQkhYY05MdFI4?=
 =?utf-8?B?WG1JR095OCt3Uys2Q09jbTlBaExKUHROdXlwR1NUMEtJd1R6OTQvNHc3eWxN?=
 =?utf-8?B?a3pLck90a3J1cVA0U0FWNjhVVUMycWdPemVveW8vbE10ZUc2TUpqRDkzU3Bx?=
 =?utf-8?B?eEw3WEJPZjVHejQrNUxNU2hLa20rOGJJNGFIQ3NydnpBR0pyMWxtZGEwWkZF?=
 =?utf-8?B?bW5Ra1VLTlpUcU5SSTB4RkJsOTJGOHJQUGJydW1MSVJYc2M4Sy9GK2pwOE4r?=
 =?utf-8?B?eWorcVcrTkxJUHNqWjI3azh4cnlXaHFmeGJ4MVhDVnZya21QbXRJNlRYbkVM?=
 =?utf-8?B?UFFZaTJsSXRVYkR6VHpvZzN5UXlwVG9oQTU4UWF6c0NoMk9peXd4cHpiTlpa?=
 =?utf-8?B?aXhSMnB5TE1aVWxzY3ZPZVg0NDhDa0MwS09MK2o1MVE3NFJ4R1EwMjhBZGlk?=
 =?utf-8?B?SG5naXBpeFdpVDB6TGlFSmtVckRuaUxVK20zaWNoNE1CN1c1cDdVUkcvZjB3?=
 =?utf-8?B?UDdBK05zTnorWk5tYmFVdmtUdTVIQVRQTkpFblBwWDArUXdLT09mb0ZGdDRm?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c418f3-4890-4c2d-3520-08ddba4d9f2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:21:10.7223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSceQb3y3l94+k5hK7skeJuNaDHCFIYfLPLqJkJGww0oyRVs1bd1wkA2vFCnQIJf2/R6Rc6hqNC1cMyzQ3BxH9zdiapkwbUlEjttCpDlZws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-OriginatorOrg: intel.com

Hi Babu,

On 7/2/25 12:04 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 7/2/25 12:21, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/2/25 9:42 AM, Moger, Babu wrote:
>>> On 6/25/25 18:39, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>>>> BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
>>>>> work simultaneously.
>>>>
>>>> Could you please elaborate why they do not work simultaneously?
>>>
>>> Changed the changelog.
>>>
>>> When mbm_event counter assignment mode is enabled, events are configured
>>> through the "event_filter" files under
>>> /sys/fs/resctrl/info/L3_MON/event_configs/.
>>>
>>> The default monitoring mode and with BMEC (Bandwidth Monitoring Event
>>> Configuration) support, events are configured using the files
>>> mbm_total_bytes_config or mbm_local_bytes_config in
>>> /sys/fs/resctrl/info/L3_MON/.
>>
>> A reasonable question here may be why not just keep using the existing
>> (BMEC supporting) event configuration files for event configuration? Why
>> are new event configuration files needed?
> 
> New interface that enables users to read and write memory transaction
> events using human-readable strings, simplifying configuration and
> improving usability.

I find the "simplifying configuration and improving usability" a bit vague
for a changelog. The cover letter already claims that ABMC and BMEC are
incompatible and links to some email discussions. I think it will be helpful
to summarize here why ABMC and BMEC are considered incompatible and then use
that as motivation to hide BMEC. The motivation in this changelog is to
"avoid confusion" but the motivation is stronger than that.

> 
> In future it can be extended to create free form event names.
> 
>>
>>>
>>> To avoid the confusion, hide BMEC-related files when mbm_event counter
>>> assignment mode is enabled and update the mon_features display accordingly.

Reinette

