Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9E1B85FD;
	Thu, 26 Jun 2025 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928918; cv=fail; b=gecTHwthMowrcZWM1FBBowQPlhjr5lNw3sT2hx13xBDNS9534mJxdhQFSPnonFjD0CTKkob/l5hyH9pZ2t5A11dpkrzs2qjRR1qh+ARnQrhNwgwNMeAgxzJKE4vUBAXY6mCm1Mmjr+CE6y6MVu0keyZF8i7ShupqmtDtl4reqng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928918; c=relaxed/simple;
	bh=7wx3mXTBNDDqRl05Q3nG5/Z848VQioOJXDc+AfywENg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1XiAdOQu9Lx+KlpwcBa80be37pXAwSx39WzmVwFrZj9r25PccayEaxOtsoHkPqoKxk+QpJHAFm8G08w45g0c0vrK1sdXPTZhpGeSKxgCk1ujQj8h5f5KHq1G3qB9ArN1l/X4y46Bl0JUFTDS4ATmZqHhsx++eUNIC8AAyBK6CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyXNAdsr; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyXNAdsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750928916; x=1782464916;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7wx3mXTBNDDqRl05Q3nG5/Z848VQioOJXDc+AfywENg=;
  b=jyXNAdsrhP0rOr1HGflq6qCTdWoVSz9j+xeXoitBqRR5DRg+4lmr8p4H
   gOGFc3ZYrzrQg/y1FBHBFKuxuROakynVmb77liktbNgVqWvg8pl1DeBJM
   DxGZ/rwZxo18SFGoILIQlqKrRT+QFi5hdqCfayvlG0BhAB/hMcUx8AruJ
   TNN+2avE/jD67xTeQdFHbStt+ub7HW7CmwXF7uMydr+2wroYun+JohOdO
   HRN208fqVDNDo8nb4cIV9icDl6UD+gRmOiizZ4xFnE4iTfKm6Nd1I2R1N
   i0jAOIQmM58Sh7dlWz88Nyjcz4eIpaZhsIJCHrwMeCuuY2rIqO1oHiixv
   A==;
X-CSE-ConnectionGUID: L117whUbSaC8revzpn3rjg==
X-CSE-MsgGUID: 2+gKkivqS+Cbet4LZsgG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53089178"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53089178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 02:08:28 -0700
X-CSE-ConnectionGUID: ocUZMuUPSP+CIB1lKpv8rg==
X-CSE-MsgGUID: +N9u8Q8FQmGQfZtM+WkJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="156842162"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 02:08:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:08:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 02:08:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJx3GxKElwBVxKKfVNyFx9D0D/RuV794dxdqphvAjQdiaqMQC+6zFjeFIFQpORNo/cGZ0T1SGDQmFJlJNxUo3/wGSEN5q7VGTGtVwTg04+kFn3xl7p72nQmVf6YLVedHLL2TWxqyH3ugnaUr8r20wTCc6TPA3G9AJrdrsAP+Ur3Xr39dFaeAzUzVimOiegHxOTXgzVHQrErmst56fp3ztggKl/cMpJTsAkpEFEZnkEaSh1GEk/Cn8mb/LDGHA+SBUYLihd/LI3DWdXfg5bXhXzBa9TMND6BUJjb7cbhCTSwshV5hif5GiyPyp/Vdl0QqJbnPIfxKfGQiFDrLr8hwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upiRjs4GC9gXY0P6l7mjtHJN1zKTI3BOwCkrcmc8dtc=;
 b=ZnnZKLI/2a0ypMs4Et2NqOfHRjX4Pe+uJbSgkPdSkbtdmTNglZn5b8vzNsaLpzPE8IH3NI/eejnTJKyQP7RsuLs32Y7GHmcUQG7CSHaxcSH0ZnnOube1V9w6esaFKUk0CPb+JrHNW+hwzzvfumxQx2WJ+ZpOjTL43843F+J9mU2hrLarEZlzsxZ2Il79lAid90ncoqSrtnQdkQbx5yFMOjX0GmvgcSQ+z1ErR1Aki0Q7xoyNSJuv582H0J3qceN/Zam96W9IgbdXA2wGJziyKC+DOK4CBvkbCwk4vvAzoQ+/cRMCO1z4etk1AdxbbGvCfXOJ9Zd3M7Rdb5uP/h5kAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Thu, 26 Jun
 2025 09:08:08 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 09:08:08 +0000
Message-ID: <2cdba052-0c67-40f3-b5fd-dd9dbd08461f@intel.com>
Date: Thu, 26 Jun 2025 17:07:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
CC: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>, "Juri
 Lelli" <juri.lelli@redhat.com>, Ben Segall <bsegall@google.com>, Libo Chen
	<libo.chen@oracle.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Phil Auld
	<pauld@redhat.com>, Tejun Heo <tj@kernel.org>, Daniel Jordan
	<daniel.m.jordan@oracle.com>, Jann Horn <jannh@google.com>, Pedro Falcato
	<pfalcato@suse.de>, Aubrey Li <aubrey.li@intel.com>, Tim Chen
	<tim.c.chen@intel.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Xunlei Pang <xlpang@linux.alibaba.com>,
	<huifeng.le@intel.com>
References: <20250625102337.3128193-1-yu.c.chen@intel.com>
 <ldyynnd3ngxnu3bie7ezuavewshgfepro5kjids6cuxy4imzy5@nt5id7nj5kt7>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <ldyynnd3ngxnu3bie7ezuavewshgfepro5kjids6cuxy4imzy5@nt5id7nj5kt7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c7ce32-7661-4f62-768b-08ddb490f766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0YvZzZQejI3TGhnVm8zalZ4SHNmYnZmM2RuMUhhMnYrTzBZbWQ4OXhUaCtp?=
 =?utf-8?B?cktTcHBGUDlMRUNlRm8xd2N6U2QvU2ZWWHZpeEIwNzI1NFE3T0FEVE5OTlJi?=
 =?utf-8?B?ME1pTk9sQkVCU2wyZTIrSTFVUFl6azFRUm80ODFEOG1naFdOL0JOTmVHZkQ0?=
 =?utf-8?B?cVIrVzhXWVlmQXk5V2MzeHJJSDdXV1lxQXdiNS9lbnc2b285TnJZOWZMT3hR?=
 =?utf-8?B?VWVNRkpwTFAvTFBRSnF6THk0ZGxEa0xxd1BaSUtNdkgyVVpmTWhWR3QrWFBu?=
 =?utf-8?B?WEtZWmh0ZWtxMmozTEt6M3ZKTWdYTWpCeG01bmgwdWtrd3hKNTFhVGN4ZlY5?=
 =?utf-8?B?WlZwZitrd2gvN0cxU2dJUFlNR2tEcElTVlRmc0Z3WFNab0pSV2tDOG54WVZG?=
 =?utf-8?B?SHZRT3kvUVMrQ0l4MExBY2EyVURwZWJwaEU5YTc1VVJ3MUVaNjh5QkwwUlhq?=
 =?utf-8?B?blVyTnBDMTBldXlLSW9CQmZpV1dNY09jV0daWVkwRnNIaVlVL0VHU3FlOExw?=
 =?utf-8?B?OFJRcGhnZXc0emU5S2dERG5nUk9jenNabnBNZWpoYzV5engxamswNUR4WDRZ?=
 =?utf-8?B?NndLRktzSmk4QkQ2Z2NlT2VKNFNsbElwZ3YwQXZkcHd6SHVQU3lFb0tXZFRE?=
 =?utf-8?B?TFFaOGErdllmcHA4YlVlT2xPR3dKRzBoWVVNWDVqK3JMQVhwYnk3WW51WVps?=
 =?utf-8?B?Qnd0V3gydFg4dFhkSDJNMEVUbWhjQWk4OWsyUmtNcGRONytVa2M4NXFMQ1Ey?=
 =?utf-8?B?elJ1cERUZ0xvb200TlJDZzJ5S0RIK2cvOVRZSXZxZjlsdThDYUZvOUhDWTNF?=
 =?utf-8?B?cTE4UllTYW9tYURVOThHMEt2Q1dDbC9FVEJxVXJsRTl4VC9FaHo1SEdZanZS?=
 =?utf-8?B?LzdMZ1MzUGRKR0pTUGJhTXY3eGhRa2Z0QjdVanFZeEVlRXI2WiswL1VsSTVU?=
 =?utf-8?B?YXMvYUNRM2Z4SWQzVzg1elR6eGJGUWsrbUtBclJjQndWcysvLzNJMGhJak8v?=
 =?utf-8?B?eTdIRWtSbGk2QUtzM3pFa3BBZVgrbFozNUQ0OEg4TWRHaTUza052WFJDVHQ2?=
 =?utf-8?B?L1ZrbXVMY1NPTUg1dVU2ZCtZamlnQnJ6MHQwZnhDWWlyU2hmRUNVOVNoaEwv?=
 =?utf-8?B?UnZ6OGVXSVRVQklJWGtMU2NUV1llWGhOaVNPRWMrRTNsei9VQ2VYTkZsNmFJ?=
 =?utf-8?B?NTFQRndQTzhNWjFyemJmdEtnU3pPd01hMld0Tm5MWERuc1QvVTUvTGx3cVFO?=
 =?utf-8?B?djVHWUhZYWFha1ZGMGhWUUt0RzdJZGJPQWhpQWhyMko1MmM5NUgweUp0S2d3?=
 =?utf-8?B?aVdPSUUyM0dkQlU2U0dVVGRUbWxqQk1IZUg1alAvaW8zSk1FdkJsWnlxa3dJ?=
 =?utf-8?B?R0c2ckFYLzRCVHNFcm5HMUZsUEovVnRCV0xKck9oY283NUVPS0VUTmVCa3I1?=
 =?utf-8?B?dEdpaHlQVmlCS3BqMjU5bVRUdjdhNktEalZIYVlwVnJvc2hsOTliMVZDTHN2?=
 =?utf-8?B?QUJwb3ZjVnhxVVNPQU9Rd2xOeWdPYXN3ampRMU5hRGpHSnlKeHdUcDJuZHdG?=
 =?utf-8?B?OUltdW5hbm5TSS93eG1aL3RyYjY2WHZqNStSUk5wVFJibUtaZ0VLcjFHOFo4?=
 =?utf-8?B?YmQvWVpPejhRMDhDc0czWDBZSXhSanZ0SlFvZFVsblI2SDlKdFU4cDE0OTNN?=
 =?utf-8?B?M1MvU1UvV1JDVzJaZkQxenJjc29DSVdMaHlrUnZMY2lCNXVWKytYQk01eHdr?=
 =?utf-8?B?RDhvb2lJNEF4NWQwNk1yWmZyb3BON2NTQ0pwYzJvdkwzVUF2akYrRWY1Q01v?=
 =?utf-8?B?WDFlcUdKUWU3NXp2dy80S2g0RXhaWGdIVmZoOEtEWi9HQTZtVUtjQVI1d0VF?=
 =?utf-8?B?dWh1T0tLVFRaM1VESDZCbURaOHNkWDBwa1UzY1JDNytObVVOT3F5T2xCeU1o?=
 =?utf-8?Q?2bSYh14bing=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUwvblJ0R0pTaFpVWVpsTDBGUVVhYjVRcC9kSy9IeUJPTkUrQjNISExzb2wv?=
 =?utf-8?B?MmhnTjk2bllWQzVKWkFrb1VkWHhHOTZpcFRDRTdXU21NcjlqOEJyWWpRZy9Z?=
 =?utf-8?B?WjAvelVmVFNvSGFZdHk2d0dTalBvQUVXbGtGT1hnL0VHbjQvamlsVFVQR2ZX?=
 =?utf-8?B?NFBFNGpaT2hIMFhFSWs0bWNVdGkxQ2pFd3VucSs4a2owZStwaGhNOWFVWHVu?=
 =?utf-8?B?NDZvREs1dkd0VExSdW0zYU5DSXpLRlBnUFE3dk1oa3F4b05sZnpvT0Z3RWlz?=
 =?utf-8?B?N3ZjNnNyQ2lhUXlXMFhKT0ZacHFxMm4yVllFVWpTRzJZQXF1YTB0MmhhUmJU?=
 =?utf-8?B?ZEVhME9pSTQwT2grU0x2SC96d1k2Si9MUFpNWVdGWkF0UDN5S2p5NVplRk94?=
 =?utf-8?B?RW1YVHdjQkxaZVFjUmNXazQ5REdqaGJ2VDNSNVNkVkgyL1Vyc2Z5YmNxelE1?=
 =?utf-8?B?K2dPZXArK3gvc2NPZU5EOG1ZSEQya2Y0TGFzMVBxQ0psblBnR0xpR0ZOZ2Rk?=
 =?utf-8?B?dlVMMDJOVVgzZitmRmY5Mm1jMk5ycmt6ckM0WTV6Q1N3UkpJdkcvQ0tScUdk?=
 =?utf-8?B?OWhzcGZpWVk0ejI4MVBXeXM5OW1YZExKYmJjWmxWWnF4dHQ0STFUNWhMRGFV?=
 =?utf-8?B?dWU0VmY5N3FoKzYreVN2OTlTU0JadDRSUjFxdVgxMXU4WHpPeUlwV09GaXpw?=
 =?utf-8?B?Wi9DeUJzbjNVSWN1TG5adi9uNitpRFFXY3Y1bXZrM1NQeExMbUdCUkt2LzFJ?=
 =?utf-8?B?ekJlQTRCUjFoNmRZS1JMOWluQ1hsRlE1ejYzK3ZXT2o1Nnh4YTVubEcwODd4?=
 =?utf-8?B?eFdZMGxTSWpNall6c2w3YkhVaUtrdFJ5RlJialZpZWUvL0ZubHpqRE9mQkll?=
 =?utf-8?B?TmFPRU5iU1dxcCswU2NxYkE1OEplREF3U1ZFb3Z0UTRnZ1hvb0NIVC9BMlp4?=
 =?utf-8?B?VjdNNFZEY25iZnlNU0l3eWJvYnNWQlIxUTFxcDVsMElhbzFPWWxTZEpscGJk?=
 =?utf-8?B?Qi9QaVNXMGlYeFlnUHAyZzhoYzAvUjRwL1I1V1JnQkMyakIxVEc4aHBaRjQv?=
 =?utf-8?B?NUROL0c2ZTVNVitoMk1vamxKSU1lSExxa3R6bG1pZEdHcWFQVVM1d1pYR3ZQ?=
 =?utf-8?B?aUtIMDlXeDNoY0pkU0hXTlVybnRhajFzc3pWNGoxeEl5TG96ZnFZYWFVdzR3?=
 =?utf-8?B?UnIyZXpZcWxiQVJOQUxuNDBRL0twQjVkOW5iT1hjSGdKZVdlVklqUlprcTNt?=
 =?utf-8?B?M1lkMnE5NVd6Q0tJMmIwV1dTdnpjdE1LZnJXZlZHWWFJWHpTTlVJNjA5ckFE?=
 =?utf-8?B?TDZ0Znl1UjJoR2VmbDUvMVdMeTVHWFdTZlE4cCtBdjBGclB6aTFiODRCVXBk?=
 =?utf-8?B?VjdBSUxseldxekJkNG5ETFdSWFZiNHNITG1sM3FTUzJ2akRueHpUTmQ5amYw?=
 =?utf-8?B?R016OUsyeWZ0UUN5aXp0VU9sRndNQTJVVmRaaDhJVWp4UDFtcytzRHpsaTBT?=
 =?utf-8?B?N3UrYnhlZFM0WE5xcUVjeHNTcXVjZU16a2RsNCthVmVjamlaL1M4cGJsQmJE?=
 =?utf-8?B?WkQ5SWxIS0lPSTJCOW1GWEkrSHB2QnJKeE5QWk45SFNCQWhmcUcxd011b2JM?=
 =?utf-8?B?SG9TdzRZVWZHaXJRdW9kWW91cmJ0c1NkeWlwUC9udzcveEM2d0pBSUhicURo?=
 =?utf-8?B?Q1dDMUtxOUJEY3h5a1FteTgxTUI5d0QrOENoVlBURWVQOW9YanI4ZmdEbXdD?=
 =?utf-8?B?NittS3RFVU9rS3B5Z2VKMlg2T3EzUW9WaytXbVVqZXUxVXMzYURVdmxPcldS?=
 =?utf-8?B?dzl1clhTVkFJay9aUkxqUDh5cUZDeFlhZGpITmtOWkxMUTMranVHdmdJY2hV?=
 =?utf-8?B?WG50QnZNQnVNaDArQTJEenEzT0dIcG9CK0FpaW1NNlQydnN1ZkpCbGYyK2hh?=
 =?utf-8?B?TmdCemIxVXJoc0tYL0E5WUdscUthdXRvUHVCZmFsYTNTajE0MEpRUlVtaXVS?=
 =?utf-8?B?V1d1cWJ5UWd0elVYT2h1Zk9BK1RDTnlvZm92VE5QVFVnRC9VNWNjVEFwVlA1?=
 =?utf-8?B?aFg4NmgxQ1FBSytqb1QyL0VBamV5c2lFb1d1YkFmakxLTktoSmJuTzRuQlUz?=
 =?utf-8?Q?OZG2YYvdkWUnFtapwSCltnwvL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c7ce32-7661-4f62-768b-08ddb490f766
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 09:08:07.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eb9+XpgHulDN8nQv3LnnILpLTIzS0LicEVPUMj25o7wRXUOBeOyTUE/dXAlpgOYKvj5Dm8b90eMfCxfjEWT6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-OriginatorOrg: intel.com

Hi Michal,

Thanks for taking a look.

On 6/25/2025 8:19 PM, Michal Koutný wrote:
> On Wed, Jun 25, 2025 at 06:23:37PM +0800, Chen Yu <yu.c.chen@intel.com> wrote:
>> [Problem Statement]
>> Currently, NUMA balancing is configured system-wide.
>> However, in some production environments, different
>> cgroups may have varying requirements for NUMA balancing.
>> Some cgroups are CPU-intensive, while others are
>> memory-intensive. Some do not benefit from NUMA balancing
>> due to the overhead associated with VMA scanning, while
>> others prefer NUMA balancing as it helps improve memory
>> locality. In this case, system-wide NUMA balancing is
>> usually disabled to avoid causing regressions.
>>
>> [Proposal]
>> Introduce a per-cgroup interface to enable NUMA balancing
>> for specific cgroups.
> 
> The balancing works with task granularity already and this new attribute
> is not much of a resource to control.
> Have you considered a per-task attribute? (sched_setattr(), prctl() or
> similar) That one could be inherited and respective cgroups would be
> seeded with a process with intended values.

OK, the prctl approach should work. However, setting this
attribute via cgroup might be more convenient for the userspace
IMHO. The original requirement stems from cloud environments,
where it's typically unacceptable to require applications to
modify their code to add prctl(). Thus, the orchestration layer
must handle this. For example, the initial process of the container
needs adjustment. After consulting with cloud-native developers,
I learned that containerd-shim-runc-v2 serves as the first
process. Therefore, we may need to modify the
containerd-shim-runc-v2 code to use prctl for the NUMA
balancing attribute, allowing child processes to inherit the
settings. While if it is per cgroup control, the user can just
touch one sysfs item.

> And cpuset could be
> traditionally used to restrict the scope of balancing of such tasks.
> 
> WDYT?
> 

In some scenarios, cgroups serve as micro-service containers.
They are not bound to any CPU sets and instead run freely on all
online CPUs. These cgroups can be sensitive to CPU capacity, as well
as NUMA locality (involving page migration and task migration).

>> This interface is associated with the CPU subsystem, which
>> does not support threaded subtrees, and close to CPU bandwidth
>> control.
>   (??) does support
> 

Ah yes, it supports threaded cgroup type. In this case, we
might need to disable the per-cgroup NUMA balance for threaded
cgroup type.

>> The system administrator needs to set the NUMA balancing mode to
>> NUMA_BALANCING_CGROUP=4 to enable this feature. When the system is in
>> NUMA_BALANCING_CGROUP mode, NUMA balancing for all cgroups is disabled
>> by default. After the administrator enables this feature for a
>> specific cgroup, NUMA balancing for that cgroup is enabled.
> 
> How much dynamic do you such changes to be? In relation to given
> cgroup's/process's lifecycle.
> 

I think it depends on the design. Starting from Kubernetes v1.33,
there is a feature called "in-place Pod resize," which allows users
to modify CPU and memory requests and limits for containers(via
cgroup interfaces) in a running Pod — often without needing to
restart the container. That said, if an admin wants to adjust
NUMA balancing settings at runtime (after the monitor detects
excessive remote NUMA memory access), using prctl might require
iterating through each process in the cgroup and invoking prctl
on them individually.

thanks,
Chenyu

> Thanks,
> Michal
