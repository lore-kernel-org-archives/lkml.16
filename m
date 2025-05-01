Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF620E6F9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121285; cv=fail; b=V11DhkMP0Fow70tTjyoJUjXVXu+WKB9NySWQSOVWN4RRKJ4p/dye8tl+4HpI5swZjACAqvLnfmVFv4U5u+ahE6XvelzVKWRkHcFDukc9kwlx6rpaNG/AeBwXhPqJF59qFFIY4VQVHNFCDHVT9yBbglHi/k7CW3GFRGMFfZzK2Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121285; c=relaxed/simple;
	bh=fXePZ5NxAz65JOzOxgeXW8FGQeMA2B0fT/AMacDm8cg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=icTDb/AYu6ONxdVYgraCDWaJxDx5q2U+g/h8DWyHYhKeUvmvr7Vd13BDWP/Tye45TsFJv6FEXFGQ1Iva7PYN9x4K9iGTdVXyRSc/zADuI56OuljW7CLWLPFmcRYBwIm5nD6FiFhAom6zOeWV0dyFRVVrwyDcKj918yiuVYoRBfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRsiKwp4; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRsiKwp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746121284; x=1777657284;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fXePZ5NxAz65JOzOxgeXW8FGQeMA2B0fT/AMacDm8cg=;
  b=iRsiKwp4dFI6LWSkYfs5A/iZL/7iX+d5WaeO5w3MDO4yb9WRxbS/aeyb
   iKnLuPnM74IPyUpq94WIhG7m7jdP/O9+g9XcrWWvSXMT86eWzK9xb8RYZ
   QllAnPigJnINvuhSch30QnU33poKBa3dgtFkzVly7dXi9FPzKHQUeMwde
   RuRXMX+heBdvPG6uKNcDOyUvbKpsyeatVfWBW01M7cZHvrXEnMksZCPly
   VupIUS3y/fp8l7580dcFF43kgMtKMR7uXCeXPhZNxg0CNvaPxl9ZDOBtb
   kInB/VlAclQ96kA61DHeINbgGD9DaZ/r+0pezgspJNqBtBwkSUQSQ2S4M
   w==;
X-CSE-ConnectionGUID: 1f0q/ZmORrO8morNs8VriA==
X-CSE-MsgGUID: r2GMD1VHRfOMBY4O6Tt2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47811691"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47811691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:41:23 -0700
X-CSE-ConnectionGUID: pk9cGP/qRyWDVPLDr93IEw==
X-CSE-MsgGUID: 8UuebGSmQx+Yi6OOkLBJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165494977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:41:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:41:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:41:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOJrIOSKDAalJ45op+ZxZson/7IGbYt0vxqSj9HIFBG2LJQmKOBEoqgySJxqQS77iv+oFXLKKrv49SnL8L68COdhHsKxrDOdCyVlQogAB1VNl7SYaeD8f/v+QtSi6ASdqv55tZPo/APVHwN5K6pIyF2ECHWvb5RnmK12mwjs6hWs35ZAONuk0HhvigGOlbQdOBYM8ZK/c1yeijVa/WOCou0LPm0Sa0u2CxxwtIFPHzVnWApRFkilBbj4vguQGC3AfUKKDUd89GTyOPuMJPvWQvr3QNvYVmDOLV2Uls0EC9EBfMWXsjvlsAcGHnTPMtZKhrtfpHMJIc1pHZl0iDrHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcVm5qDcosiY9Z0zzIkanqzenDXhRDQQzQSpyCp+Piw=;
 b=aVwFRSDn80MfQhSv8F023UvCvAOX7JImi1EpGETaVLo/Lz9MHd5medDT4tQkSyuHFEMwhF4gqvH4TQ1zEd/ieCwL8udQobhZp10Br4+qgWu/8ZH+j3Vy2wkB4VNoBxVDkFS+7Q48i5lxIULaTuX8xzTqEbt7pQVw140uDhIk3FpY+NBMrPaa+gIkrou6eBzcVdfth7eakVsYRPw1ZegWoGZBbqLpE8ecwDoaFThO0lZd3noNZRypUgBrpDBHUHAYkzbemiMYYgfWzTJs3/8CIkUwvmHePyCxJA5UhvvSa+B3QvT5PLV0YBOPBzf+eNFMa8Gwu69IS5CvXK2z6MTVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 1 May
 2025 17:41:17 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:41:17 +0000
Message-ID: <20925859-6677-42d0-8592-089e842676ae@intel.com>
Date: Thu, 1 May 2025 10:41:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/27] MAINTAINERS: Add reviewers for fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-28-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-28-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:303:b8::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afefea1-0f60-422d-5e7c-08dd88d7606b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkkzS1FrVWhLaW1wNFhCUU9pZTY5STd4UXBjMmEyQ01kVWlmdlNnRURWT05n?=
 =?utf-8?B?UmltMW1ONGkvQmJLdWk2TzYrYTJvRlA5YjdzWnpkTXhYN013TU5Ic0tOeC9Q?=
 =?utf-8?B?TGxGS3VuSFptbjIyVTNkelNpZnVXMy9xcmQzd0RpT2ZycGFJVTVHbUQvQmtK?=
 =?utf-8?B?SlVHRlBaTm5nbnMwOWdLWVlTQkdJT1V5cXJCMU9rT2ZaTTRqRHUwTkRxL1d5?=
 =?utf-8?B?YzdGRnN4U29JRWw4ekdUOUtMdXJzTGlEZ0xtQjAwWE4yenZjZDFSSVg2M1dw?=
 =?utf-8?B?QlNGRklGYnFxUEU2cGRvN1pKOEhMbUJlakh1Rk5aMmdnd0pNMHRSN2YxVkhn?=
 =?utf-8?B?N1lCMkFONWRTSzBBa1lxSmJjKzNDd01UcDM2MWhBOURMdGJJdU9TVE93Z1pJ?=
 =?utf-8?B?K2FNZlhkQ2YxK05KZElmRXhlK3NTQVFvbmR2MFpET2tXZWIvNHh2Rk1RVVhX?=
 =?utf-8?B?WUNlNVZXU2RzdWUwYmg4Y0FhRnl3VXZKMm9SNmFST3htVm1RVjNkSDZCZFl5?=
 =?utf-8?B?RmdsVy9FQXYwWU5qbE5CYjI2OU5ySXFLZ3Fia2xuVmtLZVZ2QVdqR1lkaTJQ?=
 =?utf-8?B?eEZUUVJqdGp5VlpoRk1QSStyOUhsZURaM2t0SXJqNXdLdlJSOFdmbDVKaUJw?=
 =?utf-8?B?cWdqaXl5dmZ5NnRlMTNRSjd2MzBwZnhZOEprWWc3eFZOcThWR0IyVFFiRG4y?=
 =?utf-8?B?T1BRSEpDanAySVVKRmw4eW5SaEM1SFFNVCtXV29sNVJjbkQrSm4yU3ZWc043?=
 =?utf-8?B?MUJGWmNNcjBycHNMazVmT2g1Ry9oWjk1d1BJK0xyWWd3RmY3RVZqaDZ3OUY2?=
 =?utf-8?B?VlJJcHBPUDhvcUZBSUNpTGRIUEdvNG5kQUNaZDBiaHo0RjhqOVpPc0Z4bVNn?=
 =?utf-8?B?dnhLSGJqVHJmanduZzdEc1p3ek1hYlFIVFlaeE9LdTVndDFJNTl1dnNxQ2tD?=
 =?utf-8?B?ZExxVjNDS3lEcmZhRDZjb2dMVHZmWW1JUXJ2VGM4WTQyRjB1blMreFI3UEJS?=
 =?utf-8?B?ZXVibHZIaWhKbzhPaUQ5dXVGV3ByL2FNRmtZUW50MGlBQStKU3p5aHlnbi9k?=
 =?utf-8?B?ZktQd0hsTkJlb0hGa0VJRTMvZjN3V1BVTnNXKzNaVy82V0x1Skh6NWw4K0Qz?=
 =?utf-8?B?cjgyRW81ZzcwaS9CU1BKVGxkempTc1dYUk0vQVNqOG5KekdURGxPdFU3bWZy?=
 =?utf-8?B?dklGTjdvY0V5K3crYmZQM2E1ZjJCeEN6eFhCdUFlWkVobDRjQlgxeDRuVTBi?=
 =?utf-8?B?YUo0NXlHaXRnWHhWUlJCMVdhekhoRmJlWHE5aGphaFptd1N3WXZIZk1MYnhT?=
 =?utf-8?B?Q2JuK0ptNEl0L3M0NzM5eGh1ZXo4NlRLNWxzZVFTcVZ0dTZHYm9xbm1kdVBT?=
 =?utf-8?B?ZFZFc1dzallWSWVEdnlZWGVSc3VkbHhBbVc0cmxDQTh6ckJPNmZab0tiYk1F?=
 =?utf-8?B?UHZGZEZyVlNCRjh5WXRoODhYTUVwQ3htdm41YnlVRXpveDRqU2QyNEpnblJX?=
 =?utf-8?B?UkNBbkN6eGF4UFZOVTdWeFcyZENiRzJ3N1B0UVBqTm80QjBaR3V5ZzI5eU1K?=
 =?utf-8?B?MDlrQmlLNzhmU1BzVFJhamdLQmtYUEFwVm9GMStIb2ZTV2E0WmRsV0tMdUdL?=
 =?utf-8?B?cTV3VzdkN2NtQUE5NmFJVFhKT3pyNlVPT0d0MXJPa1Rwa25oaitlV0hiemNa?=
 =?utf-8?B?OUJYRm1BTUxLTE5XS1FBL1ZkY0xsZmdDVlFLWXZpYnNSOEREVHJUOURremx5?=
 =?utf-8?B?em9UakVHaVVwRTVlMURvTjNkaklhajZqY1dWR1RwWkxuWHFjTkhwSFl2cGNX?=
 =?utf-8?B?NXRRK2JJZEtLVWxjU3RZMEZjbXA3Ulhrc044QzlqdHZMWXFUeXl2ZDZvbDJi?=
 =?utf-8?B?TVViVnpoaXVrZ1Q2WVI3ZWQ4bzFLZDRieUN3ZUtJWC9IVkdpa0Q3UTMwL3NC?=
 =?utf-8?Q?l20eVBfGKMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QllvdDdwdTlUcVJ3RjIyNGtBS1Rxc1JjRFVXVk1IelFidGNsTEdVUmE4M0hS?=
 =?utf-8?B?VnhyQ2JZSEFmRTZReGVjblM0VThCYnFjQ25qcHlKM04zNDAraFZmQ05wQlF1?=
 =?utf-8?B?ZXNOZWp4ZzlycmtPMTdwY211ZE9oK25RODhvakF6a296VC85ODR3d1VPYklq?=
 =?utf-8?B?ZXhqOTArZEcrWHRNdDdPSTBXb0ZYU2MzYmNHTndhTi81KzJ1SW1JdVFXZWlk?=
 =?utf-8?B?dzdGa3BlRk84VU15bGxqQy9kN3QvRThsenJBQlUxSFdIVU9ZQ2FjdXdwbTFC?=
 =?utf-8?B?dXhrSWJEcVZHMEx4dFFlRlNXRjBZaFAxYUN3UDlTWVpaOGpEcjM3cktod1ho?=
 =?utf-8?B?SWxDTDdvdGlWcEJSY250UUQ0SWZMa2JTeXdIYnVaVFhseTJ5R1FndWZrekdj?=
 =?utf-8?B?eDIvRnJXNm9lWEdmMEd0ZEVGbmNLL0lBRkRmeFM5SkxLWCt1TkZna3dycVdJ?=
 =?utf-8?B?dmpYTjFGQStQUDdJZEk0UHE2TGNmYzNLSWpXQkVaalRIOVRZWk84cncxaWJ3?=
 =?utf-8?B?T2NSYnRKMjA4Y1h0ejBmcnovOEh5WWZiQzdnd215M3RJUFFVemhOTzBWZnZD?=
 =?utf-8?B?UXo4Y3FBa05uRXdCdDh4WUZsTEsxT0lwTzMzeTdkbklXMDJNU0N0RExReWN6?=
 =?utf-8?B?eGsrbVNvK09weGV1cWc0RHA4UUVmcUNhNmhZZzVSZmxyQlNJdmIwQm93K29G?=
 =?utf-8?B?bE9rQUxkNzlSR0c1UkdyNHVER2lmMHZ6bTk2WGlDcFQ2MWFaa21qVGlFUFRW?=
 =?utf-8?B?aDhiTmVGVUhFWG5yb2Y3eklsYk1aSFQrMXlwMzBKZ3UrSTZIbWljMmRMdTZV?=
 =?utf-8?B?NXZnZGJWdTZNV3RpVmhiN1kyTlp3Q3ZtMlJ5cmU5N3VKeDNlcnkrZVYvaGNz?=
 =?utf-8?B?WDkybVhWTncxeXgrU3RxTE1xcG1KMUxXMTN4MVlYOXJEa2R1RTl2eWh1T3o4?=
 =?utf-8?B?QllKdVl2cjB2NC9GaVkvdXR1YWdGczVMUTZMdEkraGNOQ2JmTWcxSEpmdWZn?=
 =?utf-8?B?eW1LdlNhUHVyeDc4aGcrOFMyQXp4SWxuUnhDaWtiVWgvOEZPY2RQLzlTQXFU?=
 =?utf-8?B?WHZ2Vjh4WVFTcnMwdHpQeWpWTDJ6cXdXUXQ0UzNzSU8xeGdsV0U4SHZQaS9k?=
 =?utf-8?B?SjdwUEJjci9GdE10MitISWVjR2ttRXR0UWVqTklaN3NLYVkwcVlLdGxSTWxz?=
 =?utf-8?B?NjNocndPSzdraTE1aUp1ZFh0TGtYN1FEVGdlMzU1emFsOW9BMm5hbnJVYlgr?=
 =?utf-8?B?MlVOcTNxd2VwazlXdXBZRFIzUkdicEx5dDNtQkxoR0FoR3FIUnE5d2xBbHlU?=
 =?utf-8?B?dzFHUUpLanlQTmpkNUE0TXVwbEo5S3lMcU5kQWNzSlVpSkVVNjBXWWhyeTIv?=
 =?utf-8?B?NDkrdTlQS3BKN2orZFFNZDdIWnlBTm1EbUtyaWk4SEo3RFF2UEtad2V0RGFS?=
 =?utf-8?B?djgxcEc2YjBXUkVCU3VTUjVkOS9HWjlGMUFTUDlRR3BXSHFrM20veFNhalNQ?=
 =?utf-8?B?Yk81Wk9iRkI3TFBOd254UnkrYjczM3BRN3VoeWF4WnBRMXpJOTJ5cTl5WWZu?=
 =?utf-8?B?VlRRU2szZTNoZXI1RkpWa3YybWh2Sko0QzZOYll0bGZwMHZiOWZMT2FqL0Mw?=
 =?utf-8?B?RDFlS0hOR2NVRGdQeWpXeXFSRU9NdjFYa2FJcUc5UjB5K3FaR0dOYzhEQ3lT?=
 =?utf-8?B?ZGJLSUIxemJhWTNOYk96QVpWMW9SOTFzM1dOMXdkNkhIK3loYW9TMjBrOHgr?=
 =?utf-8?B?eGpqbEpMUmh5Z1U3RnVUVkNscC9mNjhiUURsMzdZcUtPUDI5ZHNmRTkrMUpB?=
 =?utf-8?B?bWFuc2VTZU0rQVVGQm1pYVJJNGp2V2JPc2d6V0Q3YjNSTlh2VzFOdXNxNEha?=
 =?utf-8?B?MU80K0JwdXdGYVFNQ0JRbjkyV08vRFN6VGtlNU04Z3pHRjJDeUxSR3NtM0t6?=
 =?utf-8?B?ekR2QVpoZ1dmdElybjhvVXJjaWk3TlpWYTdQY2phUGx1Tlh2dSs0UnMzZjFs?=
 =?utf-8?B?THRIellLeUNWVHBSbWpxVU8zNmlxU0FEL0N3TjA3RitxeWlnZkd0RGxvUVo2?=
 =?utf-8?B?YkxXU2RUc0pCaTlDbTBMTFJxYUxUSW1ScHZqVHFaMDZmUy83d201VHJEdzEw?=
 =?utf-8?B?dmo5aGM0ZXQ4L3VaYlNuU1ZxTjNKT2p0WUd5REloVXFrN1lESWVXbTk1cVl5?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afefea1-0f60-422d-5e7c-08dd88d7606b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:41:17.5344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/SXKwjNejqHqLpGPAaHXJ7W4Xegg/RvsyG5cxPg3I3amH9ivUQNc2XJAHTLhsc9GNg0VlLpdfQOl7xpZZ02Mf1iG1GACU+Hm9SvvDqGZtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-OriginatorOrg: intel.com

Hi James and Dave,

On 4/25/25 10:38 AM, James Morse wrote:
> resctrl has existed for quite a while as a filesystem interface private to
> arch/x86. To allow other architectures to support the same user interface
> for similar hardware features, it has been moved to /fs/.
> 
> Add those with a vested interest in the common code as reviewers.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46f7365bb9ac..3a878ca99a78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20338,6 +20338,8 @@ F:	tools/testing/selftests/net/rds/
>  RDT - RESOURCE ALLOCATION
>  M:	Tony Luck <tony.luck@intel.com>
>  M:	Reinette Chatre <reinette.chatre@intel.com>
> +R:	Dave Martin <Dave.Martin@arm.com>
> +R:	James Morse <james.morse@arm.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  F:	Documentation/filesystems/resctrl.rst

Thank you.

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
