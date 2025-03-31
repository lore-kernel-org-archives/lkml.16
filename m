Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FD3E47B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743463279; cv=fail; b=p47ZmIgxIVW6WlJ847bsYBc1KYJ3CRXhLObENfZr7ZabUHdkP7DdjYxCXHbZWMWejRqEA3A9ktDWE7ZP2w7DY2vEJbaOwT3QQ9M+Zbh95atrJDqhBkw21/nFOUgxiwpG7XYHLQPfdfkkZ1joMIgwmPvIsNddUXj7inYle/O8RZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743463279; c=relaxed/simple;
	bh=JvopDyiEAeEJ7p6TmS/qaL5+oANSrEhktOGUn9BdLm0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=upBVKaP7ryEqOZh1P/5SQOOOl6AufkGaxdWqKoepj/ZCzVCxOVzYOuvuGE0pDUM5oman+m1vwvk5j9Q/B3MFXPpy3rWEL0wpcL9kQkIDRjYUgOqg9Wabgi+5qp9nYi36qpUSnZBtj0IUOydtHWDvh9RrIm0miQIqyyweYwtR+YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfZ5i9uz; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfZ5i9uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743463278; x=1774999278;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JvopDyiEAeEJ7p6TmS/qaL5+oANSrEhktOGUn9BdLm0=;
  b=GfZ5i9uzhJVCzKDcRfve47r5Q3yzFSdIoRbL+cLvmRI6Faj5zJZlojia
   DHGs7MsWJTGKKoBsjqvZ5HixkoVw9WWUPua3z/vZxt4/WAZt4KwrQSmuW
   m9csQX6HSujj3gfW9a1vPJxdTxnmi3ki1YIlQ1/JYa61UdFqPfboCES+a
   jC5/bWB+xlYxMfYguRPDzuRn0ueAUznHHOhxWGfnBDC4ey5YKa751el+r
   XIjeEMhtJ8CBAv9WUW0Lj1W9L4cfugnkWG3SC6Kq3FsamaRAYAEjNWt9l
   UUD2OcluoufVmNDXDzZJyvQIOER1GEpPp3gmMPVkVmXDwN850U7JUomJH
   g==;
X-CSE-ConnectionGUID: FpYAsy9TSWqpWwI64w+g2Q==
X-CSE-MsgGUID: M3miC0BTR4yRaRoRGHhH2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56135241"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="56135241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:21:17 -0700
X-CSE-ConnectionGUID: 8wkQmc6DSnehagZvdum5tQ==
X-CSE-MsgGUID: gLPsiFypQpKkw47UWOjMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="127129503"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 16:21:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 16:21:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 16:21:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:21:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmZOZT2j2vlJMPP5fzgb9awKckcJiCM1LsGqd9mZJ1VP6QVxX7BLJ4Cbf9Rmn91JuQZFAlqcmD7xTLDrAQFZ8oWNZQ7vpF48FB+a02bt32vwTYzJQQQA6asDJFj3zwOeUHprTzx+IMKowpVIsZJu67x9zmKLgx7Y1EDZO7Og0GirW9XK5vLSzPRUhXYiyQYCKmkkzptLZOz2GWTGE5H19HbW5vbqS5KBxTZpS2uPRY7lCOhJVrmMXmfUScy5mWxrQXVpZX19YDhpLymOfe9HIMew//H4J6jaCtLf9qbItFNCe/WRjJCWEVBIY+Mk5cafbcA5tE/cb4o3OVYV9CkZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd79pVpTsTX18jQOsJYQ79DpyfA+MG21B+6BFCvwaGo=;
 b=mPdmDAhe2O+fPbIDJDN5PLtDrWgKpP+dhBXzmtfMmHUVaIT2Mkz+9t9IsIBVSUwtiCqY9gRY0M571C37kiiJLvO7boa7FBXrGZEYWWbiNYT4QPQDPHxPtyz3PlltYmELXWr7PogdFoGNqPluv0nrPO6FHPQBWX4GWN2u+cUwD8KQqlFASyB1Jo9lOh47Ijz0oI97x3RUAuPg5150zH0AFs8YWM22rpKnM43FNaqgFm3PtMEYABIBjqEA2UaKcP8JVGVuO74JlANnPJw9H5Cq2LnIZcsWnXZsVVyjpU2AqF6ShBY6hBRHCCPbTRr9kAX4v49YvlJVedm9JKNKDik6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 23:21:00 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 23:21:00 +0000
Message-ID: <d6f148e4-085d-4bd6-b0a8-394149d8aeef@intel.com>
Date: Mon, 31 Mar 2025 16:20:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>, "mingo@redhat.com" <mingo@redhat.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "x86@kernel.org" <x86@kernel.org>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-3-sohil.mehta@intel.com>
 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
 <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
 <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: a316fe69-a304-4e29-33e1-08dd70aab2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THNZSWprdzFDV0pOM3I1bVlSYXZCay9XQ254elpYdHA4OE82cUxaRzA0RUhX?=
 =?utf-8?B?RWQzSzEwaUJKUTFobk5WSXdEWDF5ZXdDTnJlaGFWQnc3a1BqQXp3SUlpcW1y?=
 =?utf-8?B?NTVVbmxPQkF6VTJOUDM4T1ZoRDhlbGUzeVBYbk0za01PbklsdDYrNnFpV05p?=
 =?utf-8?B?bjl4Q0xreDgxSlNoaW0rOTcwWFg3dVpjRFY0eWRnUERlb3FwQUdNdERBVjdu?=
 =?utf-8?B?TkNsT1dydGgzWFhJVkJrVGVoQlZlRThBQzUwbXdOakZhdjBHS0l0VkZFdFdr?=
 =?utf-8?B?aVpVTHZVbml6RzJQUmdjbXE3R0xuejVjUm1aU21iSXhZUDB1UkRYa2dtazU5?=
 =?utf-8?B?Z2tTUkhJVGpMVU9McFU0OWtQQU1XMVJCcHNtcFo3WmYwZlkxUzArZzJOT1U5?=
 =?utf-8?B?NFEza1hNSWNlV1RmUDRBRlhuMVEwRGRGcm85WkVPSFBOMW5VSjJsZWVPNUhY?=
 =?utf-8?B?alc5eEhuNnQ1bHRSeitkYTNBZmJZeWFxTXdVb29COGRxNHpmdUU3Qk9QcFc3?=
 =?utf-8?B?dEJDdjlMRWxRUER3REdua3RuT1pXRGxaNHgrTUFBSmxqT0dhWUd2bUYxMVVJ?=
 =?utf-8?B?VHhla0kzR01nek51aHFmYmUxd25Dc2owOXdaemU2dW4rN2I4SEVwMXlIK2lC?=
 =?utf-8?B?SGxaNUNaL3hWL296OEJ4WVlSZEg1ZzhZb1VNZHpaRGpUZEwyU0YyUjNRL1lv?=
 =?utf-8?B?N1ZMblQ2aWFBTEpOUWJVeWtTa2VhUkVmdEs2MXRnbnEyMHJFa3d6NGNFOVVY?=
 =?utf-8?B?SGNVY0FML1c5SW1zK3o5cGZVQ3VoZXRQV1UyQ1dKRUx6WWpHMVdmcXM0UFor?=
 =?utf-8?B?Y3YreXdWNkFQaHl6NjBsbHVVN2hHdmgyNUwwNkZvWEtGamE5QnAwTzl0cEFo?=
 =?utf-8?B?R3FoQVVLQWtWaWZHMDJZZVRKSmQzRk10WlBFKzNPeVNRN2h4NlFKc0k0TjVP?=
 =?utf-8?B?Ym1SSWhPYnh4UHRoOExRakdiYzBONytTemNKbXR5VUludGYrblE2OTd5akly?=
 =?utf-8?B?dXIvbVllemJQSHVWWnJ5U1dmamN2STJXWGdjWnkweUNWcjU1Q0NIYWZJTjZr?=
 =?utf-8?B?Y0ErK0wvSkxnNXhsNFdmbE4rcUlmc2Y0N2k2M1RUN2J4dGwxSUtCWnB4YkNG?=
 =?utf-8?B?Q1ZTeHdiUEN5dmdjSTl0SVcwb0Nja3FVeHNvN2lxWUtGYU9WdGVMMlJrRTNr?=
 =?utf-8?B?Y25aOTJLM0Y4V3c4b3plc2Z5enFpR251a0tJSTl3RnB3eEhtQURvY1ROUyt4?=
 =?utf-8?B?OWphMTBTcjcwRnVScDdWWjVOa0Vua3VyRmVPOHN6RENCTDRHT1NpNHdERmNY?=
 =?utf-8?B?bzM2aDJISDIzNk9hN085ekRtc2ZLdS9KY25zUFNqNDVQSTBZM0RsOE91SldO?=
 =?utf-8?B?Y1poYlk5VjhvR2ZIcEFQY1ZUK1FPdzJHSVY5TTYyalU5RHVYY0VTZXdDelZj?=
 =?utf-8?B?T0FGTm9TTW4rMVpXZm9JQk93NkRNcU5YZkV3TllVak90aHNFUnNmZmlKZDlV?=
 =?utf-8?B?ZzZaUFFFMTcybEFqTjMzYTJMWUdOU3dRMTlCNmJwYTJJeVg2UXJtRUNpR1dC?=
 =?utf-8?B?cXNpVEVtelNmVW5LL3h4ZUdUZyt6dDhWL1hDNlVUNG4vaTMwM2xLVVZLaXZ3?=
 =?utf-8?B?NVNMUWY2M0xBUHZyYStvejErOTNaQkRTeFQvVUpPbkhMUmJnYy80VHJXWEtw?=
 =?utf-8?B?WnhCc2FXNlc5c1lmVEFxV0hxNXFmWUpxbWRaeUllakt4VUZ5QTR5RktvMzUr?=
 =?utf-8?B?Qk1LZWJHZDFNWTA5TWpJOWZDejFMVXl6NjgrZEdYOFJVMHFiRm9OVTU0VW9I?=
 =?utf-8?B?TzRnOVFvcFhKbG1DWUFSdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZOaVNRQ2tsaWY3T1BzSHNXTDN3aE00dXFNTG96emovNnJ5aE16NVNXL0o5?=
 =?utf-8?B?ZUtwSTlDU3BDY1VhUGc4Qy9PbkIwYkRTOWthditkMFIvZmc5QWRGU0VOdVpj?=
 =?utf-8?B?alpUYVEvWFlRdXhHU0piLzBXWTNJVU9Ea0dQVnZDb0NhN2lsbUUrOVhpRzYv?=
 =?utf-8?B?OE84ZUNYeDRRTmdrdVJsL1UzOWtWaE9ub2xIdTNFU29uTWVsNWtzYzV3bGlY?=
 =?utf-8?B?N2pzYytSS2hnOGhUcUhZTUdUOEYvdC9jMkhSVjZ6Y1F3Vm9OSE5HeTBUU3FN?=
 =?utf-8?B?RHFQNTAreUNjM3pDQ3VZR09rL0FwTTg3TVRJbjkveGpHRGdBQ1I3Y2l4c1NW?=
 =?utf-8?B?eU1kVC9FWHg1bHhZRkdPU3NQZWU3UCtEQUFzY3JKeldKYXJvK3FMdFlWMXoz?=
 =?utf-8?B?NFlKUVl1WDB4SGJ4WVlYTU9YVDFkK3lBNkdJTHBFVzZLbDJZS3h4NkMyMDNx?=
 =?utf-8?B?YUU3UnVNallWVVBCUzNYcWNuMlNEeWU3TWltWDBVZXFoTS9yYmFPNHdlU3o4?=
 =?utf-8?B?TW9hQzlOdEhGVzQ4ZjF3WVZNam5nY3J0L3RxNzVvNlpoQnpMUkZHNVVJUkZ6?=
 =?utf-8?B?R1drS3JVUWwzWkdyeVpDZGU0ZjFoSHpRRWpVdnRURFlNa3QvQXRGUXlqbW5m?=
 =?utf-8?B?dXQ3V2hzQ0tGemlwSHZzbGIyRVJ3NjdiMzY3N2YrM0RuQWZ5b1RNdWJ3dnNW?=
 =?utf-8?B?eXhxbm1LbzRoMzlnUFUxQU1pVGtoMElnOEcveTRFRWdyQUtMOGtaSnZlV1M1?=
 =?utf-8?B?NzV0bnJ3c1VNUXMxakdsa0M1V1MrZ3BLSXNpTnhCcHhRa0JXMFZ1R0p4TVVx?=
 =?utf-8?B?dFh6MjBnYmJtUFJDUmxpcTlHRTdYQXJHbkJ0UGUzN0grRlhJb29CQmdTLzM2?=
 =?utf-8?B?bk5wcFFOMXBWcFlRUk5HM2pUNmlkMFo4TWlyRmNlTndlOFBQdURoWnVLWUFk?=
 =?utf-8?B?RXdiWWxiM1FTY1RFWStEOFNCYzdRNVJ5NEwvd01lVjQzQnhlZVBFZmRvbklo?=
 =?utf-8?B?bkU4cVJ6b1A2VFpsYzZBUFp4Wld3WHpmUElvUGdtbTU3QzNJNWUwZStFaS9r?=
 =?utf-8?B?Mm5LRXdieXo1UVJCQXdHUExtbkFLU3VwRkozM0NkVzRNbHNLRjRoMlNsYXBk?=
 =?utf-8?B?S2xMaWRCeW0wb2tVMWczQUIzWjFtajR4QldRUEUxeHZFb1YvMVhuenNnTWRt?=
 =?utf-8?B?RGNKWWtTNnQrQk9lMU9HZkNlbmw5MklWM21BeTdyVUJPa1VCalRrZXVhQW1G?=
 =?utf-8?B?MHgyaTRsWDJVYWVsNGdZNW1vNnpKUG1id2FweTg0MG5WM1I0WXNPZHA5K3JF?=
 =?utf-8?B?d2V0S2ZNdEhlZmxtYnFiMEYxd3dGRTgza2pPSmFldE8yUHcrVWRZTXY1dEZV?=
 =?utf-8?B?WlkrQS9ocVlnMTBmRHloQ3RrQldjK1p2dUthUlhvd1RYUCsrYTFvcGVuK21i?=
 =?utf-8?B?eFFHbjg2U05hc2NTa3ZLTDk1M2djY2dYOHV2SDJtTCtQeGtNQmo4bVJFSkFQ?=
 =?utf-8?B?dE1kWDNlc3RtOFdjUzg0S2dNc1QrNDZ2WUpFVlg0ZDRlaDhIQm9KRW1SSlBN?=
 =?utf-8?B?WlorSEQweVNwNkhIM0ZJZTg1akY0U3J1ZXZhTHhFSHlNTmE3azRnNUE1Ujgx?=
 =?utf-8?B?SXFSejhQNDhCMTA1Njd4WitqbVU5dHIwNmZxQ3FFN0NQUzFpZ1JZUjFUaTda?=
 =?utf-8?B?N3lCbktJd2I1TFZxdW5yc2NtelpSbDNJYWVhd1hnSENzN1lIK2lCM2dEWlNQ?=
 =?utf-8?B?YjVvOEIrNzN1VjZUL1Q5UnZFSC9CZzc1ZnBnOE5rblNxT04yd2VuT05nclVL?=
 =?utf-8?B?STUxTzNaaU5CQyt5alBOMG9JUnBGQzJlT2lZVThIZ3p4bG9FQjRSTUhVczh2?=
 =?utf-8?B?Ujh4UFNhU3I4VmFsSGZNNW8vRDdMSlVTNTFhSlM0UXBGV2lkNXc0ZS9STTBS?=
 =?utf-8?B?QndtV1VKQ3JyaVRaTlNGYTlvK3cwTEd2anVGQVN4TW9xZUpGZ28vWGRNclc0?=
 =?utf-8?B?TUJjZEtxQnJrMStua1hlZEIyKytOb2ZpVytYNjJYdktueDBaNHZHdzVEdGlH?=
 =?utf-8?B?ZDdkV2pDcitEQU1iZ2ZnQ0dpUUNCcm9vUkxSRkRxaGRnSGNuQmhFcysvaktr?=
 =?utf-8?Q?8VytIVAd/I7D7rynhkx3LNHk3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a316fe69-a304-4e29-33e1-08dd70aab2da
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 23:21:00.5019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0agbhQZPRtkWVkh4WVCwA41csv5dKcRrrFV7OORPY1WK4kH6L/3v6V+xnRK0+49EhwmVIOMsa8D99xq0d4svg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-OriginatorOrg: intel.com

On 3/31/2025 4:05 PM, Huang, Kai wrote:
> On Mon, 2025-03-31 at 15:50 -0700, Mehta, Sohil wrote:
>> On 3/31/2025 3:43 PM, Huang, Kai wrote:
>>> On Thu, 2025-03-27 at 23:46 +0000, Mehta, Sohil wrote:
>>>> Commit feeaf5512947 ("x86: Move sysctls into arch/x86")
>>>
>>> AFAICT the commit hash is wrong.  It should be c305a4e98378.
>>>
>>
>> Yes, sorry about that. I ended up referencing a pre-merge duplicate
>> commit in my repo.
>>
>> Thankfully, Ingo fixed it when he applied the patch:
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/nmi&id=1a5b15f6b4d18507dc3b2958ca01877cfc8808fd
>>
>>
> 
> Ah I didn't know this series was merged.  I think I'll stop looking at it.  :-)

Your review comments have been useful. Please continue reviewing if you
can. You found an issue in patch 1 that both of us missed.

Also, I am not sure if the series is truly merged. I haven't seen the
tip tree tip-bot emails yet. Maybe Ingo can answer this better.

Sohil
