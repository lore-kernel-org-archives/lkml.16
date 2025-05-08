Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AFD286D5E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726707; cv=fail; b=Xc6NuqN2beXZqQ2MvdwlBMCzMkpl4qu6oM59Op8u47rWoDn5wvInDPr1GqENu9XXr+IpcY0qKDL2A/KGCvzc26dAiAPnWP5Bon6yMIsNccJwLePFCSlyUwjvrRxs1kjJOh8OHjGKDvM9QDfIvW1J4g+qKPCBfdwHKCxvQfZDIaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726707; c=relaxed/simple;
	bh=eWC04mOgvvxHlZP7bZXEOXOLoq5dHzGLI7eijwetYYA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h2lms4lgdRybgu4gtC17uN60aOvuuO1S3eXG4EqDk5knZ9NvCDrBS6iaIud9HcO88k5UagmVN0JTAbWJbFc073ZhXr6vp6D7kWf6irUX0Mas/2sRamcsNhiQUafBlRE1100vEb1+ywTBmIaBpxManLDrwwGTfilgGCviN4btq1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRH2mYfV; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRH2mYfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746726706; x=1778262706;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eWC04mOgvvxHlZP7bZXEOXOLoq5dHzGLI7eijwetYYA=;
  b=MRH2mYfV3eOsBl1NRdRd76uQRv4G5Fu+7Y9BhrjIEv6UlOpd8PHkrbjY
   PH6gWYlDiCVD4bCuolXDK4K57sYl1AfBNHMsCVvqi83i0PntBsSG9LYK3
   CshfqaMjjtr1sR4xClC0HoYwvEeJSRF1Rvk/0V0A25nD48ucvgS9JlgFx
   vl0M5ef3bjjMrsyFbdBStFoXMe+cjZfR7rjLErYF3VgVOewY8/ArGYmXc
   2ksVkUJW9IR2zu0CwcEdFaQfQP/1e6wLqY+EZofws3SntjXPaVL2k/OOU
   0KOoXZoXIy6eDCvPC463aHMlhLpzlLogH7FCUmUy4QBnam76azoexE47R
   w==;
X-CSE-ConnectionGUID: fbZbCJs8SPaECI4g8lBZGA==
X-CSE-MsgGUID: efEVKUmXQX6xmSbL3vUecw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48442278"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48442278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 10:51:44 -0700
X-CSE-ConnectionGUID: kolvQWNbRI6s5s/xeYa0xg==
X-CSE-MsgGUID: +ylj7gBGQXWxxjaVFMHYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136250261"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 10:51:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 10:51:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 10:51:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 10:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN4YZEGT1JIyPWW2J4t4LCEdp/Y4aTgBlqxidMW5pqxUPniMgTPssc4Y8858h9g50cOxi7LEOpmbeVCOf5cooHshS/8TqoYFVPsqGBjclyX1P0qXE94zuLyztaKrKcu0loYWMkB4wBMZ+E/rEeozf+kG25tmYvKa4PA+AFmRdMsiYFAmk1nYVixfVDjwGniDrIReKNVqLFwVEVqIb0/BnT5T7Wf+xojSz5xM1PGLE2aMmxYYKT1AUP0wQnFL2o6SSS/+cyL2moYdgtevcTsM7SIIEFUvXvDd2ui0xkXbPPcw6rq/zIGal8oTNicIdEbsiP1VRVvpYPKgC8u9H7dThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UjKGStsoyfnddRZ51UJf/0HFKmJoMw0Sju39hPLkBE=;
 b=HJ44J3cOOQ2cwdRYauK6d1q9u3tMHQymFDcXS0j3ywJ4BdmZf9oEG7+9L0gJAXL30hC4Hs9CtM7rSJXF5BF2ADiBdT9kt4Y9kH4wnXAUI5mplyxcbDnZyfLBU4M1ggE4CLKWSxSaonX6wMsrTkKx2dYxc8dd7RaybtfjeyaxCw7lGQfYkVROW2fbSzg7DPz9laJzyIiN6O7G3OlHscbzGfLJGC9oRhuYZz/k/sVn5hV7SKQpdhAVDh9b/T3Qh33nMuaPpdsYxMuAaAGbZkxzbb71pTf3MqTnWAfAEzqE8rd5iTYyL+UYTkYIvUkt7/80cmVO2Us1TCCysGiiTMbWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 17:51:26 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 17:51:25 +0000
Message-ID: <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com>
Date: Thu, 8 May 2025 10:51:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
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
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-8-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250508171858.9197-8-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: a72abe7d-ed71-47a3-91d4-08dd8e58f3d4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW9NU29panEzT2QvK2VTR2JLcGZUVFl6SUNmTnVReGwzL3dHdWd5bXAvRnRU?=
 =?utf-8?B?OXlSRUhqQW93cHNFSDAvQ0c3cVZkeHkyS2RnVmRHdmxtZkprYkpLaTFwNEl1?=
 =?utf-8?B?RkNjeWNnNGVUaUdXc2lQblNWbS8vWjlHcUZjZDMwS2doelFHNm5Mc0VQQUVp?=
 =?utf-8?B?ekdNeFpENlpBbU50NW0rS2ZsUFBBVHB4Y3RqV3dsY25WeUI5K3lEbHhIbnN3?=
 =?utf-8?B?WkRLVW8vdGcvMjA3Y0hOMDNpN0toUUJRR2V5RGJPQ2lKTmcyb3FubkRyaHJI?=
 =?utf-8?B?TXNxamwrNXF2V3ovL0xDcCtXNkxtRGhMQk5rbStkZ0ZnQWN4WXpodUJrb3Ja?=
 =?utf-8?B?elc2WWp3R0VxelVIZUVmNzFFbmRaSlNUV3NqTU02VCtIWVhoYk9rSnUxbWlY?=
 =?utf-8?B?c2FVaDFmeStpbTQrOHZRbUoyVGVkMGdlY1BoRlZjTzVsVXFHbFJKSStDUlFD?=
 =?utf-8?B?d0VCWmlWVGp1RnQ3dTBZeWRzYVE3QUgza1dZd0hMYUZVSjBobUREczFUai9J?=
 =?utf-8?B?ZmJsemVUVjhob25sRHlKYzNCV1ozNjdZS2ozZjFJMVp2UmVnQWlueTR6dmJu?=
 =?utf-8?B?bm1PK0tteGlFZ2J0VXlwV0R2Y2ZhSkloODZBOTRvNXI3YlZuRHlwL1hCWjRa?=
 =?utf-8?B?dFhmN2xNdGpiS2FGQlpVMVdZTU1TT3hJRmZvYlE1bUpVZ3J6d3o1TE4vSUU5?=
 =?utf-8?B?a0U5azdEZXJwZXRDL01iMEFKa1gxdmFqVk1BaHRSbGlRdTl5M0Q4UlBHeUh2?=
 =?utf-8?B?WU9kN25LSS8xcUU3Z2ZHUHVvOGljYUM3alFzZDdkTmN2WmlnaWJaZGkzQ2Vq?=
 =?utf-8?B?TUpvZDc1SEdEa1lJb0s1N1VPOXJua3M4aklITVFma1lFenM3QWI0K2tNRmR3?=
 =?utf-8?B?VDRmS0NYbklFcUo2UG93R1J6V1N5aUxmck9VV3ZKdkpEQmR0WCsyRVVlbjN0?=
 =?utf-8?B?eW5ydHdHTkp1bVBqTnh5aU0wODVGenBHTWo5bWdXQUZINkJ2R1JzdzExSi9X?=
 =?utf-8?B?elhUOVZNWkpsd2xGU1VlUU5haGEzWVVBNGgxYlBaOHF0RUFSZDdIU3ZtelRu?=
 =?utf-8?B?aHVjckN6QnRybk5vblZUYlVmU3NiNzdnMFo3b1BYUCtMN0xldWtMV3NhTXAr?=
 =?utf-8?B?QXJicUZldHRkU2IvZnpJMHpnYVBIRk9IZVJmWjduUzRmVEE0NUFVUm5jNWVQ?=
 =?utf-8?B?czFmM2VUcVBCakM3bFhoS2p6Q3g4Q2FDRG9jN0M3WFhYTjlkQ1B2clJ3WGdu?=
 =?utf-8?B?KzMyMmR3T2pkTGI0WEM4aEZjMzl5OW1QU1hRQ2RFK0tmY2h3cURRVkZJV2I4?=
 =?utf-8?B?VUU0aHpBd3JZK3AxNWFhT0tndUhnVUVKOU1LUHE0TWhqQnJTMHlBZFhiS3Z6?=
 =?utf-8?B?R0xKdEdBMVplOFIrcDNDMjJwMDZta3ZhUTdxcXNGSHI1ekFpZ1ZQS04vcWVX?=
 =?utf-8?B?S1AvT3FNdWt6QTJaUi9qN1kwUUgzTzFyQ1MwdFBwOU5qajhWY0hUZjdNaU9M?=
 =?utf-8?B?YjNSNm9kRVo0cVBjZG8zbmUxeGFidElxamZkRENiNUs5cFJhbkRYMEJnWCtX?=
 =?utf-8?B?UUtqL2d3NWRYVDdRNVJPK20wOGpNQWFrdktCT0lHR3o4eExnL3RaOVVGVXF0?=
 =?utf-8?B?dVFvTTNMVG1LdHR0QXB5VkpIZ1hIb1lYbGpvRFUzbjJkT1JRM1dwVWxXZlkx?=
 =?utf-8?B?VzViN1hzVmhlNU1JUDMxY3BJdHNadHR6eU9XVEtwRVR2cWRXeDhHMUFLUTA2?=
 =?utf-8?B?YUVycFRyYkJzUUZOQ3QrTnZVczJId1BvckgzWUNtd1NmZHRtczVYQ3d4enpF?=
 =?utf-8?B?SzY2YXgxUlptcmlMUmRNQkFRdXBtQnpTRjVkSmcxZU12ZGhWaVFsUTR6aGRM?=
 =?utf-8?B?b0loZnVKeHloeHpJNVYvU3kxSXdYanhtOUFXcjg2UUdPeEw1alJHNzR0VDFj?=
 =?utf-8?Q?mRWnns45wYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVUvd3NlM3NzUjgyWEE2dEZsUDhhMXM1NWo1d2lvNFhlWFJuVStla2E3NHRm?=
 =?utf-8?B?b2FOTnJBZjJPYTJjMExzUnVNa2Y4YWtSeVUwWVpRcnFZbUpML1JhNWQ1MEY2?=
 =?utf-8?B?S0ZFZ0d3MVdEemEzZ0ZRSjc5aktSeDhsMXoxYTlOdWEwQnlzUlBwdVJKZWhY?=
 =?utf-8?B?OU5zazlKUExJNGJ6d3M0ZVU0TUpqSXZXR2xxbmZHUE5wV29vUjIyTWg3b09H?=
 =?utf-8?B?L0MrdFBBUkVKMFVEMUpkS0luM3V2SzdRT2pPQXM4NUJFZEZRekpEbmJpVUxy?=
 =?utf-8?B?R3pYU01KM2p6a2RwUzg5ZHArSm9DTDhHYVM5NzdtSEJZM2M2aTdkcGtsV1ZW?=
 =?utf-8?B?OGdmZlV3Ky9Ec3V6UEQ3Vm5xUE1xWE93RnFIWnJIMzR3amIxaVcvYnF5M2lG?=
 =?utf-8?B?YnZsNmZkWHZRRSs4b1hEeEdHT0d1bzhUUWZ6UVdrZzgwV1N2ZzhRcThTRUwy?=
 =?utf-8?B?R0xVUWlVTjlCNytEdzE3NnVBRGRFdUpwSVlYaTZ2VGZXa2xUZmlaWEI2YTQ1?=
 =?utf-8?B?YlJrOGNRZmo4T2dwL2pzL2F6RHpjZ0x4ZHFIdDlvSEZML1VvUFVuZ05HaDVl?=
 =?utf-8?B?WUhpWHdXeSsybTJxZjdkdit5T2N6ZFVUM2xNd3hPbk9vc0JTL2p1ZGRKM0Zr?=
 =?utf-8?B?OGkvTnRCVVZTcFd0NHhPamZCc25NakwyUUtCZ1MveitYeldpZmVPYmNqRUJk?=
 =?utf-8?B?VCtkbWl4eWFHYUFZZkJ2eXAva1lnK1VLVmZpTmszZk9VMTJCUlRTdGNrVVZB?=
 =?utf-8?B?eFlNM0FaYTZxdm9nV3BZaGhmQkhJMDM4d0h3MFo5dHczeGtFeHZmRDdhdFly?=
 =?utf-8?B?c0YxeFdOZ0JFMTVXUU5QL2ZrRHZrTFFzczlTaEZQNmdtc05ReEt4NXJJUk84?=
 =?utf-8?B?TWVsa0I2ZVhibVIzb3kvNTdVNElGd3JiTTdNY2UvbHNiQlBWZzJYdFJZa2hj?=
 =?utf-8?B?ejd3ak5NUEZRVm1LVEVzZ3EvcVFvOVp0bmEzRVMvMm9BUGY0Y29SbGxZU0tM?=
 =?utf-8?B?NWExc1M3YlI2L3FsaUJ6RmcyWmtLU0lzYVpQMGVaS3pHNDFzVU9GMmVSL1Jk?=
 =?utf-8?B?QjRGWjlKekRiOU5PZWJsUG5hNW4wREtEcURiS0JuL3FrbGlHbkFGbTJ2a0ZY?=
 =?utf-8?B?VkdqWXFLWURxcDVBakVDNC9pQ3VTeldPSzlwK0hnOW9kMVVkb0xHcTl2eFVB?=
 =?utf-8?B?T1EvWE1pY1BIb0FJdTBYUThRZ2JwN1I2cGFqMlhoVUFmeVM2MlF1Z25EYkFx?=
 =?utf-8?B?UzBoNXhEV0l6a3p3MDNncnY5bTBvL3VFVDdvYzA5TVNHQ2FMMDBQbDMzWkdi?=
 =?utf-8?B?Ui9XL0RhYXI2V3dScE11OEpjci9lQmRsS3dOckhTVy93TDJBQmNCV1hJeVhn?=
 =?utf-8?B?SXh6d25iREFUcytVV2k3RXR5OUQreU13NlVIcjJEZzlPYW5WSjNZYkQzdjhz?=
 =?utf-8?B?MjRZajl4WVczSnlHbzRnVzNGNHFIL1RNazRFNXMra3ZEc2ZSWjF4cHNXNlVt?=
 =?utf-8?B?a3ZMcXdKUUM1OS93bEprYlpLRmVHc2xXb1hJSE5EMkZ3d3hBQmVkTEF6OUc4?=
 =?utf-8?B?RVBUNTZBeFhQWDc2Um00WFYydjY4RDJRU1BjemRreUtwMFl2L1ZGZ2pYaTgz?=
 =?utf-8?B?aFpsaUZvQjlvdzk4TjI1R2phaFE3bWdybVBXbnN4UDFrWHVZL0RjOUYxQjZl?=
 =?utf-8?B?WVpjdUIvendrS3htT0c1WWdnTFN6QkhBWXFPSGtaUElTL2ZwUU8wbVVFcUt2?=
 =?utf-8?B?L25rSVpoT0NpZ2pjWlZCeHVaRXZySDlicm9wbUNZaDRMTHpwVUZucjgwWDBN?=
 =?utf-8?B?Sko5cERGZklreHFVTWwvbUtkZnExSGN0Nll3YVhBWHkvVDRnTjdMbktiOUxs?=
 =?utf-8?B?SVc5NXBRY0hrOGY2ZFlMei85U01xbDFzZTc5WkhqTDdpNW9YSGhFRlhxQ0tk?=
 =?utf-8?B?T0hYK2VKNzJzb01nZlFKanNMWUxSOEZaeCt3TDV2c0JKdXF0UFRheVNvc0dP?=
 =?utf-8?B?STV4RjBucDRBN0R0RGhZbFdkZ1ExY0VTK2NCLzdYci8zaFh4d09QejEzZCt4?=
 =?utf-8?B?ciszYzgvN3RBSDlWYTZNbTFLeFRlZUZzKzF5UlZpMFdSUzg0RnA3VmViRTVT?=
 =?utf-8?B?cnFHa3U4aHZaYlI5anNiYTlXeTZ0d2xvalF3TFVtZkpIbUxhQUozOXVSRSt1?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a72abe7d-ed71-47a3-91d4-08dd8e58f3d4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 17:51:25.7470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/4Up3cb2Yn0yAborBYpLHhBlvZZ8qt5M0F6mq0risiWPkhmjrF1ML/AblDIQKECw1wQ8R17HhAe56Tevz0aH6vJPlNrVF0bhqJQvtsIK/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
X-OriginatorOrg: intel.com

Hi James,

On 5/8/25 10:18 AM, James Morse wrote:
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 88197afbbb8a..f617ac97758b 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
>  	return ret;
>  }
>  
> +static bool __exit resctrl_online_domains_exist(void)
> +{
> +	struct rdt_resource *r;
> +
> +	for_each_rdt_resource(r) {
> +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
> +			return true;
> +	}
> +
> +	return false;
> +}

This looks the same as before. Did you notice my comment in [1] about this list_empty() usage?

Reinette

[1] https://lore.kernel.org/lkml/91c31b70-3d41-40cb-b00b-aa39cbd07bc9@intel.com/
