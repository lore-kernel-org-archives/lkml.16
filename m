Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653729A32E;
	Thu, 22 May 2025 22:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954215; cv=fail; b=knsKnbLOyN6Y4+aVadjMCqAZRCXZ9pIEcQUeqAbwMLxV6h4sOmRjLbsdlxJPYDHEaJwvAGQqREl8ilxOv2JI8HrJF0XlBocMwOdcXzoYyiJt5YbeyDLiPXWL9I6Tne81knUU7oGW/6fb4nAn09txVhGMNWjVWsC7xq4BHAPb4JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954215; c=relaxed/simple;
	bh=bGhzDKb1cZ5A9gBcqHOu54FnoAzbluldixZ3eTleeuY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iQS7xwtdWFQVH7uQl7X2pXAy8fMgU8jN3HglT8OfII1xYwbGkw4RUtJmAo7RGdZ5XqgheB4Eq39ukMWsZWUgh1PU1JiHCLdJmykPXAXg0l/u8ehILuvW/q9j7InpQm5LbpvfJZAReK3ODfEVpLJKhkYwRif/y4+GsC/ysTEGlXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xq/LZNsF; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq/LZNsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747954214; x=1779490214;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bGhzDKb1cZ5A9gBcqHOu54FnoAzbluldixZ3eTleeuY=;
  b=Xq/LZNsFUvfNYWyykn/TB5anN9I0Z+SAQovF+yCD0n2InDvDPh3JVtv3
   DwbT1wrG7iCLD8aqrkwRG4VPP1K7JqcviPADCe9xARBQQWh9ahDGVW5tF
   tdVgoM+D+dhSMCl8ny3qKH/44GBAFH7ICCrJgZJpapqoAKU8JlCU+JuDh
   /r7m4VumY1NNyoptgZ7ahoLXKxbWWfld72lkztDPwpa8NlxupG+qmAYJ2
   mxOF2QVokLA1PEWa2LtxnXBwFKWZ0dGAX+mI68tdH80yJv8QexDwLqBOv
   YjwZN2ZwKYDD9BIB1LxCty/snLf5rk4pwB5PzCStB7hnOrApClyUxkgAY
   Q==;
X-CSE-ConnectionGUID: I0p7FYN5RLKbvGJ4o3JPcw==
X-CSE-MsgGUID: jXwmb7DxTzapqCABCRWdnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53814366"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="53814366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:50:12 -0700
X-CSE-ConnectionGUID: EjCFr5jZTyOn7rLWpRgoUQ==
X-CSE-MsgGUID: 3WI07SQQRGaHpD/fpwE0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141363265"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:50:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 15:50:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 15:50:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 15:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvPgUerCcAA7kt5ZcfykCFll6YN5pq6Qb+66lX47W006yPDnWxX0EiGhHZojiOw2an9YV9zs4XSQKteBPUh+vaR8f8muXbPz4QXQmTPuj8pA8vUBbQJXlRZ1lo/f0SIvJ/PEjtwpuo+FlVo7IobdaPVkyJU4B2ox8wJCwfyM2nV0vBLufHH1O8kw8PfxqlRVUPS2cwCWO+gea8bPdZzOM/m26NziRs0lyCM/qqu7lTMbDyrY9oIBPAEO13k0X+TflkYIMGLfEbqAd1NETU5467CP9t/1yGNpfDOPj+e4mVAM6u9SC1pEtoet3MB2wxw1f+8CSFftLleURHiAMJy0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqIUTeyjSxFYmv/3BGOP1RpOtWcoBq4TYhFFR9r6Q90=;
 b=EUsSVs2CS66WwCtu9kuLmQUPRTQKbHCkbmQAHggcxH7h3vqX7ECtvIuBDZkTNvqQ3TkOFTT0swz6dhyMtVWdGFaNKP5JSezxCKo+AwygaftBwyWNd+mxPV3hTnU6GNtXrYcONE6zHZlBqbzVnJktTABxO8O889i1Pi3xp0IZOiSkrJFRYsu0WwB8kXkQuWAiRyZqMNEtqdNgy2XidieTZXBg5HPjLrzxKpuFlZK2SX8bcXjHqdmLMmOPrGmFkmwl+Ngy2zl5C45FmedRNNT8Byf5l2AJUDVa6pOuba4oqulQRYuuaZfHXpjMx83aAY+onvp2DC+Be4aPVkMzno2cew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 22:49:14 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 22:49:14 +0000
Message-ID: <d54c8b00-c30d-4c01-b748-34c1d87743d4@intel.com>
Date: Thu, 22 May 2025 15:49:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 14/27] x86/resctrl: Add the functionality to unassign
 MBM events
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <1ba0091cad7d1e5ab32136d4742580294a2ce5e3.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <1ba0091cad7d1e5ab32136d4742580294a2ce5e3.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf7251d-adae-446e-8244-08dd9982e000
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUV6UXFTcFBUcThldnF4TDRjVUFWK1ZrNmhxUHZHUVdWYkhSYUdycnA0TnZS?=
 =?utf-8?B?eDFVRnFOSFlZd2NEL0M2bS8zYXhpdVY3eTNwSi9HOXBSZC9NNVdmbVZSd2tH?=
 =?utf-8?B?Q0dEQmxCZDluT0MxcTAyWXZENkJveGk4b2o2QmhkdXVXcUJQZWxwR1puazFI?=
 =?utf-8?B?dTNiVXBnK2pDSGRCZklwRjcrenpzTzc4U2ZpRUVPL2JTblZmRGxZS3dxTmky?=
 =?utf-8?B?ZzdQajY2UzljQllQbXJFQWZUUmtHdFViRXFCcWdaY0luMFJBSGVJRTJXR2Rx?=
 =?utf-8?B?V1pnSmc0UHQ5UUhnTkNRZzc1bjF1VnJFRkRwWVk3WEhaK3JIVFp6dGNGaEZu?=
 =?utf-8?B?UEo1YzV0ajRyMlg1WDFtN2V2ZWphZ1dTbDhZa2swZlY3VGFERDU0OUdtaG90?=
 =?utf-8?B?OUpudGhKZWFZeDRHSUl1UnRadzd2MFoxdW1odGx4TGhoUUtQUjUrNWNXSUFm?=
 =?utf-8?B?eVFpMnQ3WXNLYnl4QjdnWnlwZkRFY04rWXJnMGhQMjJ1cGVVRUZUcnVlTDVz?=
 =?utf-8?B?QWg0QXppR0tqUStXeUsvMGk5YjJKeWdsZWFVdE43aHRFVktrbzdMakpBYjZ2?=
 =?utf-8?B?djFiQzRxZ1VYQnZVUEJHcXdtSTEzUEwrbUlTK3BsczFUSnR2N2NjaGZFVUd1?=
 =?utf-8?B?SlRrdisyWm9NUmRxT3pSSUpLVGtLM3FkaFBoSHBDS3FxbkZjOHNxODNhSTNk?=
 =?utf-8?B?R012ZDFWTHVraXJoYXcrQTVQTzdzVW9VallXbU4zT1hPTEJRMUhGRXkrSDdS?=
 =?utf-8?B?cEhvS25CZ1VXYkhrVzhJQWJBVEo0OTdxT004RFdpc1VYdmxjdXhZZWFIdnp5?=
 =?utf-8?B?M0dIWEZiVlZzamJQaUdnMXNibGFIdURsYm5nUE1ndFpqS21ibUtQY2VzVEJK?=
 =?utf-8?B?aTlPSzdRQ1FrRmpkL1pDK0NCOWFxQlZTSCtpSk1SZ09EeW4zd0pSTTl5ZDdZ?=
 =?utf-8?B?dkVXNEU3MENPMXVoOGJiQ3ExdjF0QVBXWkhpQTRsOHZmaEpPSyt3SGV4am5S?=
 =?utf-8?B?MG1xbmtTOFJhV2R2RGlBc2R2ME1telhuYloyMG01QUxFRWJsUit6OTRzcUZM?=
 =?utf-8?B?VWFKRFMzZzM3RThxeHpmcFZ2Rll2cXA5M0x6emdiUlRVRklMdHA2TmNiVkFR?=
 =?utf-8?B?WnQ0c0xOR29XenJ2WTFmblVLU1creWxScmYxdjg3dnFUN2Q4dEphTHZDZlRB?=
 =?utf-8?B?QnpHTzJnbCtzOHVUTkpsaDhoNi8zTEZrUzEyWHU0dG1KMWFWVXdWaU9uVGpz?=
 =?utf-8?B?UVZGd0dOUnMydVZZVngxQjlZandCcks1RWVtanEzbU85VHl0MndhQ2JiT2NP?=
 =?utf-8?B?Z2JkbWpjbnQrUzlxSjVHaEVNUFBEODBFc2xCOFlJWGFYcjhIb2ZpZTVnV3Nw?=
 =?utf-8?B?cUJZRVIyL25UTmNHM01YV2lpbVl2c2ZGU0I2N3BINVdGYUh6Y3BxbHN2Q3do?=
 =?utf-8?B?dEFQc0NUWU8ySzZ6V2JSSzNNbHVKRjI1ZEVLUUZmZXV2aUhXanJCS2lqWUI0?=
 =?utf-8?B?Zi8yZHNnZGt6Y2FQd0JlZUpaSHZjSjVlUSt3aTdoVE84ZEFiN3pwb3RWcnVK?=
 =?utf-8?B?amE2c1d1WE9BV3g0OGkzNndvaHlJNWZZRTM0SExsczluamlpd2poVFFHYUJV?=
 =?utf-8?B?a0Y3ak8wa3FGdWt4ZlY0b1FMVFNrM0lETHFjdStHSjZib3BDYXZuT1h2T0lN?=
 =?utf-8?B?WERwcnlLekIzbGhERFFSa3VJU0hZUlJRSkNydHJsd1hnVDJLcUpaTVdRVlEr?=
 =?utf-8?B?bk1vNXhITS94bHl1TnZnRWl5Yitjd0FubjBBYkYvS1dnbzNGT3VzRXN6MUxN?=
 =?utf-8?B?cGt3ZzFQMUZzZkg2eXlNNnZWVlFtR2FyOEpsVFFFMkRKQzVpQVlXRWE5SXlu?=
 =?utf-8?B?V2M0Nk9uWXRCZ1NFaHVqMlJ1c3Zyd2J1cWlaMWErdXZRdWs0VDFEVEVsTXlj?=
 =?utf-8?Q?cmhrc7/3B3U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzhHaEh1dGF5YWJmMHJxcDE4M05FemFNekY0WkdmUC9CeVZmd0NYdGZOeW1D?=
 =?utf-8?B?UUtBT25xWnBIMGhKY1N2dllzQ20zTTdOWVN6aXlFNmFvYW1jV0gyY1FJakZZ?=
 =?utf-8?B?MjJ2K0VDYnRXbTFWVzBJOEtUWjhXMXhPaG8ybmN2bEluZW1YNUJGMTBpMEFP?=
 =?utf-8?B?YWxXbndtVXRtRS9KdFhnMGNpUU5uUUphTDdBK1RVMk91NzRhYzdyTzlKa0NI?=
 =?utf-8?B?THFUR0o1RlJjNjFJWXBpc1M1REwvNFgrL0pTYWVKSUllR1JNN2gzUkdsTC9R?=
 =?utf-8?B?VW9sU2hmMGxPREZjdjQ1SzhMUy9zMC9OU3ZBa0ZNNDhJM3p5ZnNDY2tLUE9I?=
 =?utf-8?B?dk5KcWtHYnJQOU5uek5xRUhiVExrQ3VqeWNGeE90NE5MWDRMeWU5SHVhdkNN?=
 =?utf-8?B?WTFINlYyQlljaDQvb0VMdkVRWThDSXB6c0ZUWng3azFsb3JiOUNaT0dTT0Jm?=
 =?utf-8?B?bDdUNUJWYXUxMndwbWd2SjRaVEVORjF0bmJGVGQ2Q0lWM216STFQb2hVYy9o?=
 =?utf-8?B?K3J4N2w2UlhmbVd1TlBCZEtPSTNaNjREdWM5Kzdldk1WcTdYVTNDeEx2Rkpx?=
 =?utf-8?B?VkxNbkRhZlB2UTRqS3k0dFlxc0p4UXAvZXV1MmRaaHpMellDWFdoVjVDOHU5?=
 =?utf-8?B?RTFFS1pQQWwrbjhvYVVma1UwT3gvQmJsaTNOanl5bGdId3JzbWRRZkZIKzl5?=
 =?utf-8?B?UVd0ZXBCeE1SWWFiVjhuMEJENkFGMnN4NW9tM0xvWGh3b0xCbG51VTR5UFhl?=
 =?utf-8?B?VHFnTElDUVY0SFc2cFpKY24yR1JtZ3F1b3c3a3NLd0FXOXMySGFmQ0JnRlZH?=
 =?utf-8?B?aVNwYkZKMStSeGpqMDVZTjZ1K3JmYUZUeWFCY1Vvb3pOYzNLbTUxQWhVb3JW?=
 =?utf-8?B?aEhxUFl3L29oZWE2cnd4M24xMkxEaXJZZmtHcGRvVks2Sm9ZNmpUY1p3WWpk?=
 =?utf-8?B?Sms2akZ3K1JxT2htbVJ6TWxIdG5TN3U0ZTVZWFl0YzBmcHBJbWN1KzU2YkJV?=
 =?utf-8?B?N3RtT1g1aEhkRTdHMEVDcWVPNk5JYU1NSGpKTERRSmlDL3NVWkgvYkVCK1lv?=
 =?utf-8?B?ZEdyTzZJVFJVaU1TVnpuTW9HYTZGL2I4WUd3TDVtejFGZEJtcHp4ZGw2NFBv?=
 =?utf-8?B?QUh4YWoxY09XV3J5QUhLdk5UekYzNC9oWmdYdTd5dGQrYlk2K3RURTlrRHRR?=
 =?utf-8?B?RnZDT1RTclh4RFN5YUtjdlhOZHR3YkUzbk0xV3dNcHJ4K0p4Z2EyMTBOU0VB?=
 =?utf-8?B?cW1sUWg2dk5IdU83dktWUHhOQTNTYldUQUNmNEdNdE5Tb1hMRXBxYjdrSmJQ?=
 =?utf-8?B?WnlpaFJ4V1VoT0plVi9kM0hvbjN4WFhkVXZ3dmFwQ0JLRktsNlF6M3hwemYx?=
 =?utf-8?B?aGRVNU9uaDVJVDdRMXg4S2R5NzRnUUJMWmlQVXdXRUhrS1VrV3VlbHZpdFhz?=
 =?utf-8?B?Y0QyZExFZHIwOTlLWFBHUmpkRjFSS0JSMVArcjAyZVN5NTV3UU5EVlpLeXhL?=
 =?utf-8?B?aE14SW1hQ3doN3I0amRpUW9zempkVWJiR2dCZUR3ZE9SYkxBb1c2OFhRek9j?=
 =?utf-8?B?UHBYTXpmYitTWjhYUWpldUZXVXJvU1FjdzlrZUlCNGh1T0hFU0NwU0p5cU9t?=
 =?utf-8?B?ek1qZGg5NVh5VG9IWjQwa1JBZllOOWg2QUNmeXhJY3pHaFA0UjJoWUVPeita?=
 =?utf-8?B?bWs3emUyckxCL2FyVUJVcGdja1BGQk53ajlEUEQ2QmZHaENTMldoWEJWekdw?=
 =?utf-8?B?cUpzM21Yb2tidW5yNHI5SDhmRnhNbHQvZTJSMUtpVEhwMjBGSWl1enEwT3JZ?=
 =?utf-8?B?cEpwMk0zZzVJR1VEcHJaMVEzQlNGK2F1dE9MR0tkRjREUmhqZWh6TGlHY3p3?=
 =?utf-8?B?V1N5TDB6S3Jtc1UzMVdUUEtrOWdaT3JDOS9vOVlHOXNEWGFCN2ZKTWFNeDVP?=
 =?utf-8?B?K1RneUNBQ1p4a29PVkpaN1Q5R2dJWHFVeFh5bDJFMllEYysxVStoYmVSTVBE?=
 =?utf-8?B?cHVtODN2aWUzSW04VGdmUVNjTWNyWVcyUGZib0V3bGNKWDJ6NUM0VkRkc29T?=
 =?utf-8?B?cWNEMjJZUkhueWxVWWtZK3lBU3djYit2Yk9TTXZXNzQ2bWJMT3FTSGYzV2hR?=
 =?utf-8?B?dnJwTWxoQ2llRjRpbEJhaFhNd0hpeDFPRjZudmdXTk81SXFXL0FPRE1oNlJr?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf7251d-adae-446e-8244-08dd9982e000
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:49:14.0847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKtAWSjrqf/m6EnR0wt5aPS1A2j66cArRFnDDKVNVGwz+rRplJgE8etDyrwMvCquDuUyimlLWXx2No5quZVm08E8tD/pBroZn9nheVTZPh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
> can be assigned to an RMID, event pair and monitor the bandwidth as long
> as it is assigned. If all the counters are in use, the kernel will log the
> error message "Unable to allocate counter in domain" in
> /sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.
> 
> To make space for a new assignment, users must unassign an already
> assigned counter and retry the assignment again.
> 
> Add the functionality to unassign and free the counters in the domain.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  fs/resctrl/internal.h |  2 ++
>  fs/resctrl/monitor.c  | 60 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index ce4fcac91937..64ddc107fcab 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -379,6 +379,8 @@ int resctrl_find_cleanest_closid(void);
>  
>  int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
> +int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index d76fd0840946..fbc938bd3b23 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -989,6 +989,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	return -ENOSPC;
>  }
>  
> +/*
> + * mbm_cntr_free() -  Reset cntr_id to zero.

"Reset cntr_id to zero"? cntr_id is an index to an array.
Please provide accurate and useful descriptions.

> + */
> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
> +{
> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> +}
> +
>  /*
>   * mbm_get_mon_event() - Return the mon_evt entry for the matching evtid.
>   */
> @@ -1068,3 +1076,55 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	return ret;
>  }
> +
> +/*
> + * Unassign and free the counter if assigned.
> + */
> +static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	struct mon_evt *mevt;
> +	int cntr_id;
> +
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +
> +	/* If there is no cntr_id assigned, nothing to do */
> +	if (cntr_id < 0)
> +		return 0;
> +
> +	mevt = mbm_get_mon_event(r, evtid);
> +	if (!mevt) {
> +		rdt_last_cmd_printf("Invalid event id %d\n", evtid);

Similar to previous comment this is in kernel bug territory and could be simplified
by passing mon_evt instead. Although this is the unassign portion where 
evt_cfg seems unnecessary.

> +		return -EINVAL;
> +	}
> +
> +	resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
> +			    cntr_id, mevt->evt_cfg, false);
> +
> +	mbm_cntr_free(d, cntr_id);
> +
> +	return 0;
> +}
> +
> +/*
> + * Unassign a hardware counter associated with @evtid from the domain and
> + * the group. Unassign the counters from all the domains if @d is NULL else
> + * unassign from @d.
> + */
> +int  resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int ret;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
> +	}
> +
> +	return ret;
> +}

Reinette
