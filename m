Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966A2153FB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120867; cv=fail; b=DEuCKfVbRmJqWlrKTHnvUK2EbsyLpHC45nj1Tbhvww1NIK6KLaGiulGw6JUrDz5Ljv7PU43b7ui7YBwfZuFxy4fghrxZznzo4K61JRh5HqdNXKYiKkuJ7I/wDiTcdAblkjyxVFTez3hgVDh/ifd1gThHQlYOYActRbJeId0/QEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120867; c=relaxed/simple;
	bh=1A/0RFEmLXopRpgzKuR3WQ93F9YJcjRmEfo3aqfS2/U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OA5uovYJ695Y9KB3fio+WrfcMsdJpOyFVAX0nKmGL8cxl5RJ1RqCZiFa3n5FMPKn5JCQ/buCKRcVL6SIrVHoZCE7t1sSWK7lScrCvXfWIwDFLj/wdYEMOLuqAXU5zcknv6Kd5NrzHcIepvCoawKGbh6DbUf6qyzaif+WWx+VXnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDfHzIfZ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDfHzIfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120866; x=1777656866;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1A/0RFEmLXopRpgzKuR3WQ93F9YJcjRmEfo3aqfS2/U=;
  b=CDfHzIfZb6HaowNEGNpgYPPvh7o1SSp/A1Px1um5+6ntl/3eMMxzw14S
   4TJpYckdFgWF0bJw2dBJ8CCGeV3/kNhjkqqiwn6m9lNr2WJPRgG2CSlxl
   cGDZePMkXgdUJMJjiRp0LIuMOF95Bc7vUq8Dfm8jS8saoLU5YfgquCzkx
   jqmYMKKYJfn0+TXy3AaVoE52etw3+WaIQCAjyQH3grJe3nXzUELn3URR9
   qH8zR1ML9l6oBZj+cnhKNis0Rtx4NeqbbFHNnhInz9h4NVDJ5HJ+ZR/cC
   6J86STEtSajil0A6VEsCkXZHFIAPWKgn2sWPGnBFJaexRpVsBd13Pw4eq
   g==;
X-CSE-ConnectionGUID: HVlTuYeWSDWJZfrYK80G6g==
X-CSE-MsgGUID: aTkM6dpOQgyUrOZaVhPwtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59186295"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59186295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:34:25 -0700
X-CSE-ConnectionGUID: 0gXgR5N5S+6CQkgEX/n6Hw==
X-CSE-MsgGUID: uBMGdWPnQxawr5smGfm59A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165361574"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:34:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:34:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:34:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:34:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nksKCkP3nhTZTjqKGocYpe4jlFt8gG/IFKNjoT/6xQC8SMTRthN8vxZOtjX+T/ZWED8DP60peehusDBNnyfj0W+mlfSJNUBzT16zXtgGYIEb4uWarKNj5DtXubo97juLecPeY4Q+wIGbyIzDpOmAgdOUn+odmTqKoske4FfNA6+ETM7AHJ/sampoLwHIg+nIBMgY+lo3vh21cZkRXsaZLsvQLO0/2lB3FCpyQhNNB7F7Yrf0nQgv0rCoZ3MDihOzfKL/EtYYVtIJRDVDkpAKoXVCf5qVN7Z7FvNzTHbK98ZFIrZmUpdgjoWKhcH+5SfTBmbBcQrBLhHde7yhGRZCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzlOt5H+z9Md3R7voff61cZHGLGLhrEcRsIl6pAzGVo=;
 b=AB7CtYsuvJs8IhfGUzLgQ/YkJVohPiniiRTy4IM4kGTlUNnVGd0PDtYsFgwVW063SmHOr/DQcQZJi0F+skJzuuUYU8+hDN3ZkfbpHCsI5/VoB3z1nDnRbVle9WW7oN4kY/PAAzgwTy0ysofWnH+PER2EsgNbLL+YlRRLb2Fbq4r6RgOjhZhdTAbNF3A/4S7rtvE3zF6k/X6vLaNYU9S/4wL8o78Jz0ms5Hm+6lxWlZFjLiOScbBjjC/+W3VzbERj/xVkCNnvci+ApH8er2e+DOe+rdj5VhTL+zWJKv44xZHmzW0BonL+cpThQjjSt6o1DIrvUMca6fGqhdKuXAZLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 17:34:03 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:34:03 +0000
Message-ID: <7eaaf025-dbb3-4dfd-962c-f1b16301463b@intel.com>
Date: Thu, 1 May 2025 10:34:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 23/27] x86,fs/resctrl: Remove duplicated trace header
 files
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-24-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-24-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 3286c650-99ed-4723-4860-08dd88d65d66
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVFnNzU0SmloUDlReWdPNlF0Y0hGUlN3ME10YjllZkVKRytXUWpEck0vYzRG?=
 =?utf-8?B?RnAwSWxQcG1BMlpqQW5UWGZPUHQ4VEZiN1BGNG1Ua3ZVT2FuTVFuYXpCSFh2?=
 =?utf-8?B?Q093SE9GVGRqUG5UUzk4Z09meGM0Q0NCd3ZSQXJ6ZHZlSXZnZ1hTb3FtdnI2?=
 =?utf-8?B?MEJ6NnVqUnZMRC9DQVJobzJwRWZDa0UvMU1lQTR1RUJMM21pb09ZdHU1czM5?=
 =?utf-8?B?UmdSenpyUlBKeE16SUtlOFFISUNxd3A1dXVUY3JKNnovOGdHd3ZhREd4c25C?=
 =?utf-8?B?OXl4R2xncHVkZkZJdGd4R2NKbjRSRm5ERjFTZVRMTHZaTStmeHYwQWdxMjlZ?=
 =?utf-8?B?bk1vQnEyQ1hvTlZMRWwvaDV2TnRWcE9mbXdXNDFSbzBvN2FwYkFRMVJGOTJw?=
 =?utf-8?B?SEN0THRETDVXQ3NEWTRnU25KbitpZE0vbFlGeDUxa1p6TjBCVUhBek1NWDVN?=
 =?utf-8?B?L29HRGovSUtPWWk0TEdaakJOd3VoVnVadXlnR05PR3VaLzlkWUR1ZlVUQzAz?=
 =?utf-8?B?dlRkWXgvSjdvMXdVRjhQZ21tU3k1SXpaMGI1eVMvMnMrcHdYdFlLY2dOK3Vs?=
 =?utf-8?B?M2hhZzJCeXozc1hUSDdlQjZ5TWdyaWw0RnJWZGRncHdWTGpoaXVVb1djdjZo?=
 =?utf-8?B?WER1alBtU2t1dXJLcE5Sa09CZEtEYlB5emhIVDd6clBPb1IwUnJ4Z0g0dlNK?=
 =?utf-8?B?bzNzYklIS3BJZ3VWOUNvM0RiS2x2TDg5M2svUk9peXZqVnJyeDJpcGxDRjgr?=
 =?utf-8?B?a2JYS1pZLzR3K0lWWGFiZkdXc05hNEI2dTl0cGJCcWlTL21wQnNhRnczQUpa?=
 =?utf-8?B?STFPZ0ZnWHFURjl0R3JYNWtuOTZVYjFEU2swNk9SUmY2YXJWcENBQnI1TXIx?=
 =?utf-8?B?ZU1YUCtLUlB4WFd1MFNNbkw5UUhSWFVOVDlhNmVIbHV1VzJ5MlFnbzFmZTlL?=
 =?utf-8?B?SDJxQnp3My8zTnBhL1VqdmhqMVltOEx4V2VXeVRML3o2YW1Wa2pLSXFQY2xT?=
 =?utf-8?B?YzNJbE4rZjdZR0NDM1FlWHNoV1pIeU55OVBtdWYvL2laYnk3NzhINTE5TW8v?=
 =?utf-8?B?Um9HNWJuRUVZV3RqaFF6b2Rudk9WTGdHZFJSMmJkdHBWM1VKRlBZUVhNaURX?=
 =?utf-8?B?Yno3Um5OdVJ1eFZPcU1YeENMY29ZSU41dUc3Z3k0SHVXdGhlcWxDNUE0QmdN?=
 =?utf-8?B?Q2RQNlI3dVBqbXh3SGpIT0tteEtCNWRWSGZzY1E5WHZyd2FWL295MW95djA2?=
 =?utf-8?B?Z0UyMjlIdFU1VjFBMS9rQStrOTFidXdUcXVESXpUWkwvSmtCdGQ2eVI4UFdv?=
 =?utf-8?B?Zy9EZE81V0J2OFhHVDV6cWgvRkwvVU5wN1pSeUlUYldmenlGZFIySFFIK3hD?=
 =?utf-8?B?ZlVYamI0YUs4UzZoRzlnclA0SlVtT1VkZ3hMTFU5SGtvMVNNOTcrZlJzSCtu?=
 =?utf-8?B?NFdUS3hjckgrVkhsNDVTT3lSbXd2MXhVZFVZUncrTklFTlZyV3c2aVFSNWMz?=
 =?utf-8?B?UVIzOFExaDFJNjd0SU9PSld1aUN4Q092TmoxMHBYWXUra3ZXbmQvUUh3elhq?=
 =?utf-8?B?WFpCVkJ6dDE4L1RuY3RqeUdFVkQ0WXpJd2VDZ2Q5K2kydEtWWUpMR1dkMFJm?=
 =?utf-8?B?QWluSUlRMzYzUVg4NTIxLzI4RWNnZjQ0U0xnWmJ5aGlLVkZGOVNWaUpia1o1?=
 =?utf-8?B?Y2NhdWZyRFdNUTZkSTA2NVMrL0ZyZ2FxV0VyZmhWOW9DR29wOTNUZHhxL1Zt?=
 =?utf-8?B?aTFrTzJkQk5Kd05KR0hsbS9wdFJaRlNIdklUTElTNFFjVW1GaS9PNDI4OW0w?=
 =?utf-8?B?aDVjNDhodmc0ZE9POGhXZHZBYmhUNHVOM2xJY1NSREthZ0dlTXd0YTlmQ2FG?=
 =?utf-8?B?ZDNjb0tEaWkzL2w4anVrYk1qZFd2djVyRDFJQ1J2WG4yeUpKb0I4akk3Q1lD?=
 =?utf-8?Q?69DqrcRHzA4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1QYjFCODZCSVBJam1iSnVsNXNiN0ZZUzVlK2pHa2M5ZXdXUzl5SkZvWXVP?=
 =?utf-8?B?Q3dGazRsQ0kwVEVrU0I4R0Qyd1MrMTNIOFBFTTdWa1IwNmorYStmeUhVeGZ1?=
 =?utf-8?B?aG5UQnBiOWtBVUVxb3JvT0l0QUpUdDJpOTMwSWtLWUtwY0dYL3VnVnprUGJl?=
 =?utf-8?B?L0M1VENCVlJla2hldDVjTExVOHJUeTFRM2R1VmxFQkdzMmJrTkM4Y0ZlK3lE?=
 =?utf-8?B?blVqbStzVG9Kc1htOU42OU9GdkNKajFJQ0pxcnF5N2pIK0w2bGdQSXA3dGhC?=
 =?utf-8?B?MkhUZEh2TzRZNEthandBOVpDSzhqeGg3TVhoL0FyTDJtQ2lFTDk3eGp5SS9q?=
 =?utf-8?B?SmpvTm5xY0NYUVNYUzhNMWJJNUc5TjdkUEhVSFlxOVAzam9pVWsvUyszNlJ6?=
 =?utf-8?B?MzEyTi81MFdQZmU3c1gyVk41ekpITm8zM2pucVYzNUdiZ1NFcFFGUFZTN3dH?=
 =?utf-8?B?OVdTSHB2d3RRNXZTWCtxMkRLMnRlMURnYUVJa3pJTUFlbkVyMUFWcDNTM2w1?=
 =?utf-8?B?NDZnSEtTWk81Tk1qbm9jcnNMM0hxSFEvTEZGT2VIbE1SK1VmN08xRlRvdkFz?=
 =?utf-8?B?ZG1sa0N6VnAvakgyRlZvS1dPQ3JKS3IrenhvUmliT096cW9wUnBzZlJuZTFz?=
 =?utf-8?B?V3BsZmYvdkRJbVJIRm1XRXVhWTV5VUV5YnZvTkJNTDAreVBNNG5UbVBkTkFZ?=
 =?utf-8?B?UlVzMnNVcmt5cy9kc0tKT3hCTVhONmhScEdtNTZGLzJOdkdtZFpkcjMvNmdN?=
 =?utf-8?B?alFkdXMxZ3M5eHpnb1lxcm1IWUNXMThUeW91Y2xod1FMQm1Bb2RMMFprQ3py?=
 =?utf-8?B?anFSS2poOHRrMWpLNjJNV29PblBlUGFGTlhXdk55cDNhdlRnSHVQNWJlMmxD?=
 =?utf-8?B?QmlQTDBiY0VCWVE0S2R1TWVyZFREOEZsb09QRDNPcXpIM3RVWjh2UHZoUHht?=
 =?utf-8?B?S3BKNldQcGZHMDIrR1Q4TDFKWlZ3Wkk5QkNhdy94bWQrdzdHTy9WcFltMXNR?=
 =?utf-8?B?MUtRcTUxa3VJZ1RLRTQ0UE4wQUgrS1BhTWJDaEQ2L05JcmFPRjZ4aFlyVEs0?=
 =?utf-8?B?djNWYUpNUUFIbDZ3UnB0Q1JRU2J2ZWNZVzJuZmJkdmJkN0ZCK25VRzZBMnFj?=
 =?utf-8?B?b2dlcEdvRVpVREQycXdTZkl5VG1tRFBncHlqcG5iYVYzRXVGQnVWSHo2TG1O?=
 =?utf-8?B?QkxpVThISVU3QURsd0E3NFJCK0tGdlNxaG44Tyt5R1I1SlN2YlNlYXYwNkMv?=
 =?utf-8?B?T1B5RmhwdnNGb1RWb1EvQUNqMnptZUEwT2p4aGU3aUZxT25LZ1AyVlQ1bm1Q?=
 =?utf-8?B?TzFnMWJtNzdFTTRpb05vdGFYd2w4WERkVlRSY0kxRUM3MHIwWUoyM0MxOTh3?=
 =?utf-8?B?QXhMS0llcnRUYWlyWVhYaXBsaWxSTVhWY21taGFnMkhLRDltNmVIMG5QZU9X?=
 =?utf-8?B?NGU5MVFHcUtMbkQvTUtWYjBrMkVnNFZRR3ZtLytoR2lDQ0VZOENPNzhPcnVo?=
 =?utf-8?B?eEhWQ085TU5ZZVNjUzVkcitHT0tyUVh4K2lJaExXdGlXWU80Ulc1amY4cStJ?=
 =?utf-8?B?U0Fsa2tUODJhWUNSL0ZOYWEvN2I5dmFpUmFUa2NpSy9IdW9yRWNzYURQcW42?=
 =?utf-8?B?SHJNdTNhWU8wWXZqTy9GVlJYcThCV2FXTG9nbjMySWVoVDZOZ01zYktnWEZU?=
 =?utf-8?B?SEpoQkdaMVU0aklHUWZMNkF0NTVjM3dVMG5EOWl4KzhtMFpMZDlvTmtjS0ha?=
 =?utf-8?B?eDY4b252VkpyZnRJTjBSNGo5dG1DOUdaQ2YvOXBOUHBWWDQ5VGhlMngxRmNy?=
 =?utf-8?B?eXV5ZzkvSzZoYml1SCszYTE2ZGtPdSszeXVWK1oxNVpvUTNWSmxjcGZWVVpJ?=
 =?utf-8?B?dVNpOXZXTmh2QTcrUFZlWWhEajRRTFgzTkkrWWlmS1RIeW5LVjFRMkNJd2xk?=
 =?utf-8?B?dnFQVS9GM3hWcmRvUXlRU0kxcmJULzJndXRTeGpPYW9vVVludTgvZmtNNkZ0?=
 =?utf-8?B?VzBCQVRsbnNZYVBaYnpJYUFURVZzRG5NdDF5aUpsTXk2VDVreHErKzRWK1Vp?=
 =?utf-8?B?U2ZhS1V2VkpZS3p0azhtVHFYTFhWMExiclNPbmRkOFlwM0NiVk1sVWNxaEIx?=
 =?utf-8?B?TFErZWxUeTErMlpjTGZ6ZGlsKzRZb2Z5elhHK3NCd09qVU8xWUxHUjJGcDB1?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3286c650-99ed-4723-4860-08dd88d65d66
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:34:02.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJ1TiHxoCZ6bdOE7Xn9/YQmeMgichMu4NrNRoQsE62D0nDCO2u4MHZwYBauwpxH1rwpEVLz3ZGG0SkxJFpDG81b/eLM10kdrVmt641OTVRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:38 AM, James Morse wrote:
> The copy-pasting python script creates some empty trace point header
> files. These can cause a build warning from ftrace.
> 
> Remove them.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

