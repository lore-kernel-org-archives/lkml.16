Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD4376;
	Thu,  6 Feb 2025 03:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738814109; cv=fail; b=IGgrzIrgolB0ItjEvxc1eHKQrt7sEcDHkhRU7XnihdICYuQjbS73z1mONDI7fD1AMPaM74I4zy0mc7Qh9pq/ziyfcdMUP6OcL9fpq12rIO1jJnnomjl7zb5RpVjsBnk4hYtLKD/9Tm2330ojfJ1rxi6HN1SwhBu2K/wK2tAqGlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738814109; c=relaxed/simple;
	bh=jMvFZbxHlPPEkNdz/RmagIZLTZr86vsPksMkqC5+G+g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UBX3Ypb4IOcfESpgmA3KozppTVtXD3eEwCU0mGLPKTQQvVLpKeXTHNttKD1lhU9zdSHcbtnWHwX8WTiiU3cahFtIdcbhpgOskMYzc8hiFjCqBYGarFvisCOF5lzkurxjVgDLalUyEOr3qMkA0OjECGnBrloKVu6+OxlmbpbZQOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENDJHO0K; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENDJHO0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738814107; x=1770350107;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jMvFZbxHlPPEkNdz/RmagIZLTZr86vsPksMkqC5+G+g=;
  b=ENDJHO0KmKdrfNohk/kHHlTLzArg/kVivPVuhu0XNdnC4vCAi+zBNy0d
   o3/vfxSmqf8jQpqYeKDrN80TAn4aqkC82BQ5dJHRfRvAxL9dNip24Sxcz
   0o4NpxR6oD5gGEUanplNRtDcXQ7535QpRA3CBeizjGtlA+U/VcYuA44Br
   k4LjqunBxiHZS9SDM2XoJRA/2uD7ygax2wWQKCL8YxYuNJX/LXDdLOWYl
   AJm1WtTK5knzcIpKGN9z5TYrX2eYGcxYrLCA8/mhgssbo/FuQ/mHeaN3Z
   YLwpCRSFTo0O+pxhKxB+5+P4GVZ/vNjuLIrtylzTGPm4VgCZUtoUblgtS
   A==;
X-CSE-ConnectionGUID: yxhvlIiITaKiVunUBY6eQQ==
X-CSE-MsgGUID: MVJIkSauTkunxiSm0zupjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50389556"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="50389556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 19:55:06 -0800
X-CSE-ConnectionGUID: rLBXk490Rxm3qCyADyj91Q==
X-CSE-MsgGUID: NnG+gAF+SYe55jJNtvWEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="111002946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 19:55:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 19:55:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 19:55:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 19:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoPRrvkb2zQX3Q88pQw/fwZKUYp9CcuEzt+OjDdDw191/hGymsSSD+GguqGV1rnmz5zFhekw00ph4f/POguGZT6du38Ido8L3zbtxQtplRxFcFKnbZPn2vL+CqGpQqMMd9ty9xhNscnbCYArxH/t/qsHXZYhTZBDoIuHCuU+TrUoDhGNwvVq9XMYkmBYBKY36aG6DKGjHw07svnb75gphZmZZjiLeP8GOfRf+1rz9PTflhll/qabQNJueqAbVD6D/v9eUpk1Jyo6fLX/Z71TWNDZ2+fQ1G9OSrOZLSRsDky+3C1TDY1dNdRzdcgu1GizubhBLFcjNM2T6JjMVyfK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIBMopUygELib5eHiO5vZWOf6Z+acR8vZw60EXn5cxA=;
 b=Ekt/LQg0ZQoKWYmJdWOS1lXr6Vw1a4QlNvxZ/2D5FE5Pay/Qo8CJMT+fydmxbdSfxCnED1rirpLbJVpcJ/pI7ZBwT6G37m2NOJOd3VHFkcosPn8r+ChHsZkRFuECAEwPIHFLWLccIZRPXzRupqp2Pipl/nQYjGcCBn5X5gxI6wK7nZZ1I77UD5HLIEVLzhmdW5TC4gG/nOY7NEJCU3f4dOEN9OZWqHRFvogqg2gSVkArsZkWKSB7QHauMR7gc4XC9jsJqhVL0abuGdfaTfat0v9jP/W2M/5dZqesfQvWZKKK9Ag2rnhQxYpe4gbXfagvpIFSeoFTxE3CK7AtZDZ2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA3PR11MB7461.namprd11.prod.outlook.com (2603:10b6:806:319::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 03:54:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 03:54:32 +0000
Message-ID: <9746fc25-1657-498a-a290-45baaa8d8c19@intel.com>
Date: Wed, 5 Feb 2025 19:54:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 16/23] x86/resctrl: Add the functionality to unassigm
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
 <36262057667c27acad777836cc1497b19cb7c06d.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <36262057667c27acad777836cc1497b19cb7c06d.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA3PR11MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: d76dfbc2-5085-464a-d971-08dd4661f6a2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytYOGt5Y2tiMnJDOXZQWmhlM2NXMzNJQzlta0RVSE5qZmJzM1FJZW80ZWZj?=
 =?utf-8?B?R2FhNEFseWZ4eHo2TGdOZjhFUkd1c1pvNkRjWEJhMVBOOXlLQ0xMb1gxMjhK?=
 =?utf-8?B?b0tlcHQ3VU9sQjY2Y3RvaVZYQTB3TTN1WkxxNFRGeERsSm9XRlN6eUlqREhY?=
 =?utf-8?B?bmFGaW1mTUNRMHgvbE5hR1I1UUpIUWxpOFFia0N2eHdjNjBsZHUva1R5d0VZ?=
 =?utf-8?B?cGFaZlE2YUZMeDRXNkhYRldQUFg0L0l4eFlzbVBmbHA2VDJNNk5DUGg4bS9o?=
 =?utf-8?B?dXVSbjBCa2NJTGJCb3RNTXRZMWN0TUZZRzJpdGJWcCtaUkVLa2pLQWh4OW9V?=
 =?utf-8?B?dmR1VkJCZFZJdjMrWXA4T2J0dFZnRWkwOFFsRWVVSjZPbEJIRkN2V2hLTlFS?=
 =?utf-8?B?UXZja25PdCs2ZEdiUExndFVGQkVqNUJHMGk2WE0rTUtQci9vanJxMEVaQVM4?=
 =?utf-8?B?bmlpTWduS0tNeFoxUmFTbFRoT1Fsd3U1Y1Z6a3hkbW5SdnBHVkN3YmkxVTFI?=
 =?utf-8?B?cmhxb3pJeGFBOGxQRGZybU5COEk0eTA5YW1ySkIrbzhwaElBVG5ZVHk3eGQr?=
 =?utf-8?B?MFNMMkxoL056enhWeHJaakNMNmNVZE1KMWt0YXR4MVVOMU1RczMyM3I3clg1?=
 =?utf-8?B?N2JOTGowNSs0UFNKTkY0RGFIL20zbFFyNkJScTRJYXJheGxEMVA1c29Wdjd6?=
 =?utf-8?B?ODlFbmNmNHozeVYyUlZ4OFVuNU5BSGY3eTRRZW0zc1pHUE02d21Jd1NURTZV?=
 =?utf-8?B?L0pyZkRkSmQ3Vng2ODBRelkxK05nb2p0Y243aHRzbnZFVk90Yzhxb3dKMlhS?=
 =?utf-8?B?QUpZd0dVSDF6cW5GR0ZkZ0F2cUNPaGp1U09ybmllbi9sOHlBbFRPSVhZZUFT?=
 =?utf-8?B?NXVibHlKUEk1M3NyZHc4NHRPKzNZcm82VjVraXVHNlNjUWtJQWlTYm5YYWRy?=
 =?utf-8?B?bHBiZ2RZVFBRSkFLZk5CSlRxend1RVRTQ3pXblZndHRMYS9WaFJYSmRJTlMw?=
 =?utf-8?B?UEpTVlFRbXJ0Wmhvais4ejRpdDdaRnVVaExoeVFOYmxOTVFhY0V3LzVZQnJv?=
 =?utf-8?B?K28ycGJHNkErcUtrWEN6OUNmYXYwMGloR3FKeHkyaitYT2ROaER1NlE3WDR4?=
 =?utf-8?B?WGhuT2ZLdGpSdVBoMEZIZUFSNjN4aEh6NFpHVE1rajV4YnU1YldMTWV3ZFd1?=
 =?utf-8?B?S3FRdnFXaHlzRHhPR2h2Y1JFZ2tFdVRvUGs5eW9XSm1MbnlGa2lYVjczQnIy?=
 =?utf-8?B?UnNVamE1YlFMRGx0cm9kQkIzeVhYVkFRWEwzYzlXaUtJSlFjZUxSUjBrSHlU?=
 =?utf-8?B?aEFyd3hoWDFVbnV1clRva0Nnc3ZXMWpTaTRmVlZOb25LUHlBcWFJeUUyeW0w?=
 =?utf-8?B?RmFzdFhjNEpveUl1aCsrUFNwRFlDMTgwWVRubVFCL0R2aTlXYVV2RTRRM0xC?=
 =?utf-8?B?TFU5dFBzYndnWUZtdVhPV09hQkhaUCtyUjFkc0xGWi9yRERuNVFxcTdIa1NF?=
 =?utf-8?B?dTlETkVNUDNETWdTcVBsVkVRZHQwM0ZMM2VDLzBPR0xmUVlnRVUzbzFjUE1B?=
 =?utf-8?B?NHY4eERublNIWmFVaU1xbDZkRTBxYlROZjF5a0xkUnJXcjkvYXl1RGRVaGpa?=
 =?utf-8?B?SlJQR1ZZS0dFU2EwcklCU04yeVA5WmFuNFUwV3dxcmtVTDZCRGpjT0t5ejRk?=
 =?utf-8?B?d1Mya1lSN3ZSczJyV0tIOW5scE5SNGhiLzlMRmt2RlZrbkl2Q3NUeFAyL2dI?=
 =?utf-8?B?UWZPRG5NeTd0ZHQvNzFnOEt2YXkyS2VkbUptamxMNWlmNldpWEpMQmlWaWpW?=
 =?utf-8?B?WUo0em1uSmFZUUVST2dsZVZhanN6am1BNjIxRFFLdkIyWWdWQlZFa1Rlcjhq?=
 =?utf-8?Q?aDr/3MNEMi8C0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5iZXVuR1REZ01LSFBxcVNKbENnYi9GaEUzRWh3YitGaERSdEZITmZaMFFo?=
 =?utf-8?B?dlVXNGx2R2puaUt0WWVDWDR3M3RsWEp3MDZYY2E4enJqNVRWaG5VU3Q5dGZt?=
 =?utf-8?B?a0x2cmRvM1VXQ2VxUzkvNDZaY1JvTXdtdnZKeERhNm12c0ZINkVydEFJSFEw?=
 =?utf-8?B?MDZkdDl2VEFGeUdmSVFIQWVsZWFoM0xFTFg0VWEyNFFxalRUcXZveEFqNW1t?=
 =?utf-8?B?TWtNYmxiVmRjSWhkM2tUc1d0NUpYVGt4K01VL1V3dkpqUnVhT3EvbjNBb0E1?=
 =?utf-8?B?Skp3djd6Vncva0xubGhPTkwzVTZSWHhUdWhNU0FTVlJvUjFqd01reis5NENz?=
 =?utf-8?B?SkxUaEt1emM2bEZ2ZDJBN2svbzI1eEV5YStuQ1ZFQVJiTUtpT0NKK0tQYnhY?=
 =?utf-8?B?TzNhaVBXd0pKNWUxRHFKRS9XWW9kclp3eHJFbTlDVzYxL0krMWttOE1oNjVv?=
 =?utf-8?B?em5hRlVqSDlrbVc4c21xcUthcXBYSFI3M2pvQWVFdkZOVHFvR0FzaVoydEtW?=
 =?utf-8?B?aUlka3BHMHcwMmVTay9ZWFFHTWJQanJVRnhFQ25YSW9rVGRUL3NJNGZYTjlI?=
 =?utf-8?B?SWkxZTRyWWJVRmJtcTNod3dpbXhocjd2RXg5SFBDdk5UNktsaHE0Yk1GZmFK?=
 =?utf-8?B?Ni9nNWpxWnI2ZWdSZ0ZVeWVYM2RRazRLbUl0MGthNElpbnRpanp1UWFhdlhy?=
 =?utf-8?B?aWVMYkM3UGVwRUpIa0ROZVRObDR6cXltTkdHRmJIR1dqNE1ZVHF3VU16V1Fz?=
 =?utf-8?B?UkUyU3N0MXZ4T09GRWNCMU16a3JDMjdMamQ3R05ySGFJd3d2ZlNtaW9ub0Fy?=
 =?utf-8?B?MjQxQVVTRnhOS25ieWRMME9kQXovdWxpajNyY0U4ZENKL0VwaUovRk9uWHEr?=
 =?utf-8?B?T09rREtrOUVDTVBnRzc5eG1RaDZDcTdhTkhEeDR1WnMrTytOZzRCTWJ4UWpl?=
 =?utf-8?B?YkpzZkVxZXhZazUyYnBWdHFHR3JvVWxlSDR5ZE1GUndTQXVaU3FhRDEyQjdy?=
 =?utf-8?B?eDhqWnJZUUVhNm0yZlVybmNsUXp5amRvYm1KWjhRMUU0Z0FLM3pFNlFLTExF?=
 =?utf-8?B?RnRaTGY3OWpmY09ETjlZcHRnTkFLQlVNSFNSbWdBTnVWMXl1ZnpmUkg3ODhM?=
 =?utf-8?B?dDliNE1LU2J0K2FUWHhxNEJYTUFHQnpjQlRycysyRmx4ZTcxb0JIZkpPS2RX?=
 =?utf-8?B?WnF1VG12cE55eitDWGFIeWUzR3gycmoyS2srSjRJRCtJV2tEOHBMa3VmK0J5?=
 =?utf-8?B?aE5UL3hHUnJUQTNveHpybk1VQThsVjJwTjV6M043MkJDUytaeEViZzBHVUlB?=
 =?utf-8?B?N1BIZFhkazBMdTRSUG53RS9MR2Z5WTY2UDdiLzNIY3BlTFhHQjZTb3dJODRU?=
 =?utf-8?B?SkpVTm9CcUpaVEpvdHFQZGFGZ3RLRXVSejFwUWtYSFdtdUFWLzJ6QmN6QW5t?=
 =?utf-8?B?bHpONHdiK3JQbkpBOWhISXZvU3VNN1N0WkdGVEtrc29WWXJCNU13cGNyNE5x?=
 =?utf-8?B?Vm9KM29UdXRvQW9hR3I5ZXF6aTZUSlJYMXZ3N0YyZkVlSy9VREdXYkRzWUdO?=
 =?utf-8?B?U09WMnc5REx5b0Y2TjhvMkZ2ejJVMWxMTjhiNVBIMFhVZTNWY1haU0NlcFlC?=
 =?utf-8?B?WFZVZFhiS0c3VFJneGVBL1ZTV0Fwc1F3eXFkb0UzT0dRZnpQdVcraGtNYlJq?=
 =?utf-8?B?S3J3cFFRblhGRk5udURSeHhVVWFkVFJVakQ4ZkN0OG5hWFp5d0JpY0hPdmli?=
 =?utf-8?B?RStYZGlKdzhZRVZ5N01neWVKeGIzK2NnYnNpdEVEcVhsTEJNOFRtbFdIRkho?=
 =?utf-8?B?VzZiM3IyaDdjZWR4Mi9NbFo1aDkzNlU2Y0h1RnR1OFFRcjFCb0hUeCtrVWZr?=
 =?utf-8?B?T1JMMGtySGEwV2YzZ0Z3ZkV4empRSmt2U2t5L3gydEljdkNNRjIyNkc0QmVm?=
 =?utf-8?B?UTFlSnpDNUp5SGlsdDJYQXNDVXR3aTN3R1F5bmtiZksyc3FzUnpSTHo3NDFW?=
 =?utf-8?B?TTZRZEpkUmlYbVlKQUNnOVpaOS9FU0gvNXAxeko4UXJCTFg3R2xDNy9NS3RQ?=
 =?utf-8?B?QnQzV2hzMU12UitJR3FjTFlXZTFPTC9GOFFqQlIxU0xPa29yNFBFQ2FHbU9F?=
 =?utf-8?B?NFNIamQ4akxmSXpsL3ZTeFZSVXNPelUrdnIvZ0VnVzVvR1hWT2NNemgycVlG?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d76dfbc2-5085-464a-d971-08dd4661f6a2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 03:54:32.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2/M7MRGQgblpHE62Mp28O5T0PNmIuNBUYqLnmajMnIlQtKPQmjOepjmEok6fCW57YqpWJrvjNetmA3g9Dx/3bReIGxv+yscRLsVHUHyDB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7461
X-OriginatorOrg: intel.com

Hi Babu,

subject: unassigm -> unassign

On 1/22/25 12:20 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides a limited number of hardware counters

(now back to "limited number of hardware counters")

> that can be assigned to an RMID, event pair to monitor bandwidth while
> assigned. If all counters are in use, the kernel will show an error
> message: "Out of MBM assignable counters" when a new assignment is
> requested. To make space for a new assignment, users must unassign an

To me "kernel will show an error" implies the kernel ring buffer. Please make
the message accurate and mention that it will be in 
last_cmd_status while also considering to use -ENOSPC to help user space.

> already assigned counter and retry the assignment again..

".." -> "."

> 
> Add the functionality to unassign and free the counters in the domain.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>

...

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 127c4000a81a..b6d188d0f9b7 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1518,3 +1518,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	return ret;
>  }
> +
> +/*
> + * Unassign and free the counter if assigned else return success.
> + */
> +static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id, ret = 0;
> +
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +	if (cntr_id != -ENOENT) {

This can be simplified and indent level reduced with:

	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
	if (cntr_id < 0)
		return ret;

> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
> +					  rdtgrp->closid, cntr_id, false);
> +		if (!ret)
> +			mbm_cntr_free(d, cntr_id);
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Unassign a hardware counter associated with @evtid from the domain and
> + * the group. Unassign the counters from all the domains if @d is NULL else
> + * unassign from @d.
> + */
> +int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
> +			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);

Same issue as previous patch wrt error handling.

> +	} else {
> +		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
> +	}
> +
> +	return ret;
> +}

Reinette
