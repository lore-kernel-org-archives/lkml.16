Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44B25A2D6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744395834; cv=fail; b=bNvrHC067B8tPJ7Hq9UsPbwowMvbrRnI8+Ym9yuCn1nm9Np2unlopf/d6TtJ5OfLUaT8taWOD6AmdCQL8wZ2+K+x8uJVGOKeIXXuz25dsSblrpctzTLecA6R6sRa0jNloV71wPyes5SP7NtVXgG7RSZFlp8ZJvHxWHyoLgJWEyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744395834; c=relaxed/simple;
	bh=QPjU3QMTAWpldNeKns3hHU+hCHJC18b6O4G1CVFo7Wk=;
	h=Content-Type:Message-ID:Date:Subject:To:CC:References:From:
	 In-Reply-To:MIME-Version; b=G4oPzYFvyRJ27/urImKNNSKfTUqgT4kxfMAxTTeADFCgLBgAT9KwNYowbEG0jSvurRii6FF4BNjuBI608ugOSr+0iWEdHpeV010dm31CXWW91HdigoCFAuleTCAD1ErlJIqCbWfQgqPoBFIYHln7WGCVW7k7fgQ4pI0wHuieTcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ru7mmn5B; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ru7mmn5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744395832; x=1775931832;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=QPjU3QMTAWpldNeKns3hHU+hCHJC18b6O4G1CVFo7Wk=;
  b=Ru7mmn5B/A5cXXOBk68NcuJnjSaaE0QObMH83ymDhk0m4MHj6x+b8IOt
   dyOyvUKINiw3x71ATNAbO0OftLnrNhF/EHPIf/u9CKqpAyX4k2TwzV313
   RydVCSwfM0Ub7dNkqqa7iXJ8pACBrqCX0dz9ikLg2BfJawYZvIq3TRkhV
   8k2+ct+vRu/OYcl4/nW8+0jTjlTtFUCsW4Xx7RaNuh/BbXlOAG0+fMvhj
   es5mJcUOB1djKOucOxwNzlcpB1rCqWq+QgLDgt/OOJgiQsBVm/DCfYkQr
   rykcRDDpDWVpQ97OfZzj4WsSa1CYkb5kNXBlxSl6K34TYSdWTFcvNpB/3
   g==;
X-CSE-ConnectionGUID: Kpo9WAYMS+esnAbP9qeN9g==
X-CSE-MsgGUID: LfuBR6LATwG7HN9e26P9SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49610095"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208,223";a="49610095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 11:23:51 -0700
X-CSE-ConnectionGUID: s4aBJrM/RTmje39WFAdoTw==
X-CSE-MsgGUID: 2Kqr4ApqRmuJ7MqepMk0dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208,223";a="134421781"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 11:23:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 11:23:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 11:23:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 11:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkfi5HkGhWrcmAmQiAbeGzzOqdgZV8/jHU2lFeSa1k3wCppStgT6Jffhv7/+XsTpAmCBu5V07Bsfu3C+ZJyw87mh661yQXVZcFvIoBgiTxyZuPA3KiaYOjK40TaTtgocIx4zL7dIclGRdwkCUt4q9s82Wa63RpCsnI1Fb92tXerxvvMmaBFgKcye2lHXIwS8m7TlyIURwCXi4Og+0xymhSXyMCIfA8SO7pDVpqenng2BrLQ+IdT+k3ifjYHV1F67wB6VZ4NXl0CAamxnH6u5jTlOcgIg8IJdhveHnstKhhQLrHO4FI0JozH9Je2Cl6olDVjmBlsL2sNb2pqxnnShiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlhneBjC4xbYci9KHlzddlgiec4pqO5TUxs4EVGtENc=;
 b=qn3mp3t8xmTl4XlPB8zeVdHjwqBMnNUIJJ2pgWN+ZZ8MgbNh15hULQGnA5H8bKwtLoHqo+xPPbo8lQVyD0pbHEC2RB+LlSHAPIamD90MIo144frzCgd2AaUHSKXjk+6u5ShfYjC6yKWn7Vd5K5+UOzeJaoKKokwSWEBZ9eQVPzvInuA2oqRDdp1suNvUCwTfTplXuSoL56ts0x8/SwCGeNfFzQhkbf1fUtJBhASbYHI+6V/lWneSRep3jc4Ync2WWK7nys8tKYJZwwiqDFPQERrCjETSRoB9XpB1EzclmoFN5I2YwfbCOytQshEDhOQqwuYW7UOd/OhekMyESADBlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Fri, 11 Apr 2025 18:23:34 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 18:23:34 +0000
Content-Type: multipart/mixed;
	boundary="------------p2favoQN77XUwAxXNPbwIjzw"
Message-ID: <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
Date: Fri, 11 Apr 2025 11:23:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
To: Sohil Mehta <sohil.mehta@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: cc753763-8513-4bf1-5980-08dd7925f859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4053099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEUvM0g4WDBtOENuWFBERjZNY2YxTVdSNUNPL0dncnVUSjFRUU9FdjNSUkNj?=
 =?utf-8?B?dHlhOHZVSTZZcnFBd21qUm0wVEtpZXN1ZTl0ZEtBelNMbHY2Tkh4aVFMb3dJ?=
 =?utf-8?B?R1RycjdwK1A2NUNTMldvZWRyMUEwdC9VVVBDSkpBMWNyYytnMzB3djQ2aXNy?=
 =?utf-8?B?alZJdWtlUmQ0TEFiSkJXbnhzTTdYOFhHVWdZUHM3OGpmN09FSTUzVVZYYjF2?=
 =?utf-8?B?QUtGbVRKaXZXdk50UEYwRVJWZUdDaEVMVXN0aU5aNEV5VUFOOFRlNDU3Q3lJ?=
 =?utf-8?B?Q0VtZ0llOWNDRGx3YUZ3c1YrSC9LUjhYYTdJL05NN09uQWRDMVhncGlYdVFo?=
 =?utf-8?B?NmlwWUhOVW9ORVkxbU5lOVh5YXZTYnAvenFYWlhIUzhLZXp2MnBqWDFidG9y?=
 =?utf-8?B?bkdmMWNzOGNhQzJHV3p4MnlieGtCL0RyMGhLOWhmNzBDOXhOUVpXTGxoUUNS?=
 =?utf-8?B?Q3ZFdzdkVzg4U1hkK2hqMjNtNkNrSzlnS3pSQzlFR0pUVk8rZlk3MTBkalQ2?=
 =?utf-8?B?ekc5SXBhNmw1dnpuem1EYmFTak1UakNyQmQwSXNQVE5ncUZURHhKejI2ZThS?=
 =?utf-8?B?OTF0STNJc0d4Z0srU1BjbDk1b2hpeTdtY3JTejJPR3U4L2p3T3hSM0ZjMDNX?=
 =?utf-8?B?Vy9JRlhqcnNpcS9SaGUxUmF5Y1BROU80TW1yQ251Rko2aDBHMGlmdTY2TVlx?=
 =?utf-8?B?L1VTZHhBYWZjNVhjRElRcUxsdkNsY1NuTnQrM3NDWlZMOWNxY1kzU3RLVGFG?=
 =?utf-8?B?MjUrMWRwL1lXYmNLbzNoTFBoQkRTYnIzc3J3UUVKSzE1VkJiaHcvWXZPSXZO?=
 =?utf-8?B?YkY2dTVxbTg4WjkvY1hBM3RpMmprUi9uVXhldGZObDhpNndFMDdrZ0JiSHNV?=
 =?utf-8?B?Tmt2SXUxZ2pVb21uMXVWNWNsTGNjNjdDc2kwUUg3WVFLdmhsSkJXSm4rdnRO?=
 =?utf-8?B?MmFqNTE5akw0OStaMjRGcHRWcDl2ejZtLzBzNjlhbnkyMmlDMkoxV0MzSlJR?=
 =?utf-8?B?K3Frd1I0VmFMdklJOEdWdlJ1dmZGYVh5MUlpYWs1TkFuUEhPUHB5Q2d0QkNK?=
 =?utf-8?B?REJzYUZKZ0JRanV2Z1c1NTZoZjNUU05XendUSjZWT3NEMEF0Mnp4Z094REg0?=
 =?utf-8?B?WXg5amtCWit1cFJKbU9jNGtnOHNiczFPOERGbEdZREVnT2xHbFdyTm4wWkR6?=
 =?utf-8?B?U08wUjBKZlpBWXVpZjVtOVZPODV6SXdESDBuSjBmVUEvVTZxNEhYNE5lQ3VN?=
 =?utf-8?B?cDkxcjFtTDF0ZjF1MHVUZFRybmthbGNhcHpCT0UxWm1TR00zQXN4ZDVEZzE0?=
 =?utf-8?B?Mnlqc1I5a2NVeFBFVEJqNE1SMExhaS9SVTZiNzE3dnMzcU9QYXVWaWhmOXl0?=
 =?utf-8?B?b2ZHUWtSWWZrMUkrN1pDOTErL21OVUlpMGlDWEhsSWxybDdpekp2ZndkNmQ3?=
 =?utf-8?B?dHg2Z0lMRTlmKzdyditadXkwMUF4a0c0Z3F3cUptUFRNclFBTkt2QzBvUXJR?=
 =?utf-8?B?Rzd3R3NpSllCeWVqYytERVNJazh3T0tCcDRibHdEOGtCZEZTQ1NCcmRsQlAy?=
 =?utf-8?B?Ymw4NVJVK2ZZOVRraFoxTFFocmVWNStxVnAvMDN4T0lhWXBqKzZoMCtmRCtS?=
 =?utf-8?B?QS9nU2NTSVRBb09yek1XQnBYK3I3L0NsTnc3VWxiWGdZMXV3NlpqcUo0VlNN?=
 =?utf-8?B?N0tFU2kxNnJsblZmMDgxVVFyVnZTY3dSRldPb28yK0FUdFNQWXpQckU3WlZ2?=
 =?utf-8?B?cGEzUlBnZVRTQ2xFK3hJMkkzdGdCU3AvanNVSU9GeVI2ZjJTczlWM3NKbldK?=
 =?utf-8?B?bXAyamZmRjBlaWVOQjluSlB5ckgzbnFtR01QL05lZ3JQQ3E0SWFOaHF3QTND?=
 =?utf-8?B?VHVQMERrZ2hMNXo0MWV5bWE1SUhrQmljTjFvdzFuOGpaRExWaHhyL1RhVDJ5?=
 =?utf-8?Q?5GlUkqj/kfI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBQSklIUlhjL0xrV0FhSWhrazNSVlMxdGhkZWc1ZUxSZTJTbDdtYTJyamJZ?=
 =?utf-8?B?SXI0UElPRE1TdEdKdXZrcjFFVmNSWUhKMEVncTRwczBxb2tNbUhzbUlFU0Ir?=
 =?utf-8?B?bVpZakVLWXVxUmV5aHQ4WXoxU3h5c0ZFWEpmaCtydWw4NFNxaDM3bHVqcFZi?=
 =?utf-8?B?aXJ5cDFRVUJuOHdNbXYwWWUraDY2SkxFTHcwMzUwTEswS3J0Umw0VTJ6Nmxj?=
 =?utf-8?B?VDhESWJhWXFJU1ZMM0FYK0dkelliaXJLWTZlWURIK3NJTkxWUllNc2swZENs?=
 =?utf-8?B?RjRaZXZMTUpwcWJGT2tXUHFydzlvWXRtWno0ZUg5WWdvZ0o3QnZIaFgzczdM?=
 =?utf-8?B?Y2xDdkFaMHFIUEx4d3FoeVpnaWQvc3ArSjBISEpYQVBGazlHaWg2cXZwRUhO?=
 =?utf-8?B?V011K3R4YkdreU5VRUFEcmNpSVBTNGd1aWYyYkxGYnB3WlNWdWhyUDZvb2Yx?=
 =?utf-8?B?WEQ1dCtaWG9EQUd4cTZYRkRBVVQ5d0d6Y0ZYSjB5eXMvb3F3K1A0SmxDMm5q?=
 =?utf-8?B?M0pRTEZTcVgwbDRQelpsYkk5Nk9Tc2FDc1pzK05ETGFTZmxvbGNuM2JOWGp3?=
 =?utf-8?B?cUZhUnZiUGg1a0EvZk0reFdXS0w3NFNTMzdGRDFJMWF2dWZNTkx4ZndNRWpS?=
 =?utf-8?B?TjBNYjdNa3AxN0VvTTd0c25uQ2kyM2I0ZHdQVlJFUDBidlAyVHBrTjJHeCt0?=
 =?utf-8?B?L09zK1AzWFpGeVRST0hqeXZxcng3MHRrS1phZlpEYTNaM2tuajRYWmtGazBE?=
 =?utf-8?B?bitrZG5MK2hWbTZKQ1dlOWpZT3ZrZ3REQnhEM2VydDhPaWhUZlN4OStaYnU3?=
 =?utf-8?B?ZHV6azMwamx2Z2dRN2gwSjUrVWZDbGs2QVpVendHMHk5VS9mVER0elppUy9H?=
 =?utf-8?B?QXZQS1dONlRtSDhiQjg2UzdRaXZKTWpmMG1VTnNZb0VDTGg0SUxhbkk0MTRj?=
 =?utf-8?B?VnBNN1lnZFlzSUVEbnpOeHVJRnB0SW52Ni9Bam5XNGw3VkU1eU1uaHVEZWYz?=
 =?utf-8?B?T1RmTWtJRTBEWjRKLzlnQ3dFQlJkSVFwcWErM2tmMWlPWDgvZGU5UHE1ZUc1?=
 =?utf-8?B?WUU5TVAwYXJ5cEgyTW9LV3pQVHRSUVJtUitLa0VwRm40cnI4SElaYndmUXEw?=
 =?utf-8?B?V3VpbHNDM0VCeTlXMWM3WVZaditZUmQzemZzY2J3alFIcDk1QWErM3ZNRnl3?=
 =?utf-8?B?SzRLS1NUdGJwM1BpVlU2VGQ5Mnk1djJsa1FsckdWcUg3ZEZMckpoU0t4aXcw?=
 =?utf-8?B?RXlFdmQwVE1teTFzQmIrZzl6eUJCU2pqOTFKVTRYc1Jzd1FaV3IyK0MyYWZv?=
 =?utf-8?B?MnZKZFVLZ1grMnREZGVoallYb2pYamNzZDc5aCtFWjNYaVRaMko4R1VOdDlX?=
 =?utf-8?B?OGVhQkVDejBBR0tqOU9SZ1RlR2hmdjVjMjg0UUJCd3Q1WDhHTlRpeFlIUVYv?=
 =?utf-8?B?TjJPUVlhVlRtZWplcFZNMkFUSnYwZnVVNWcxa0FUSklFcjJJRVZwQmFQaVU3?=
 =?utf-8?B?eGNrTExuUWgra3RMTm9sZnkzYTBMV0pMRFplWEFTRzR3VFBQOEt6YnBkWHYy?=
 =?utf-8?B?b1dkTit6aDRhMjlpNWw2U2NIV1NIRHExNzJlc0RiTlREcEkxdzZEc3J0Unlv?=
 =?utf-8?B?L1V3WG1LeXhKalU1dXZpMlNrbXhQSWkwVHQvdWRpVVgxaTBwbDJUL2tpWm96?=
 =?utf-8?B?OHczcHVpd28wYXloUnU5U1I4ZTZTQWV2eWtvVkdOS1Z4c3AweFBDUW9WcmJr?=
 =?utf-8?B?amZVNE05a05FLzFWbHF4WDN6M0xPaHQ3UnlDWWxoYzlNVit5Q0haZjdXeUNF?=
 =?utf-8?B?S1plZEQ0T2l4NFBtMldhR2ZmSGFQZlNwcnRLMk1vMEsvQzhrRVZRRHJVSk1Z?=
 =?utf-8?B?eWMxUUt3VXB2Wll5cUdSNGltSDhEdXVxeXZKdHZuZFlnLzRBR3o3YU1ER1FV?=
 =?utf-8?B?ejdiZlUvOWIvU0xRdFAzazByRkJIajhpZ3RmeUpjZkdFK2Fpa09ZRllCN3l3?=
 =?utf-8?B?OW1OQVlsTlhPOTZPN0FoNHprS1drVXI2Wk40c1BoYmZaQlA1QkxKMGtnblYw?=
 =?utf-8?B?VUM5RDB6Q3FwSWJ1WXd2RlNIZitOeFVVb3VTY2duRFUvYy9pKzZWSTV5TUMy?=
 =?utf-8?B?b1BlL1pZbmNheXBsb2JQdmNFUUl4am5XVkRGanVTV2lTTWpRVTcxU0pDVUM4?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc753763-8513-4bf1-5980-08dd7925f859
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 18:23:34.6102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0btNKZV7fgI0kyJS1pJGzPjmkwoWipWcCj3/V0NJPnoWEOEcPxGj5HPBHVGIi1tliR03kDV1MwJgRAWA1VBaT3N6H/4soSfh1DFQeY6jPbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-OriginatorOrg: intel.com

--------------p2favoQN77XUwAxXNPbwIjzw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 4/11/2025 9:54 AM, Sohil Mehta wrote:
> On 4/11/2025 9:12 AM, Chang S. Bae wrote:
> 
>> +#define X86_FEATURE_APX			(21*32 + 9) /* Advanced #Performance Extensions */
> 
> Is the '#' before 'Performance' intentional? The previous version didn't
> seem to have it.

Oh no — I only meant to update the bit position. My bad!
> I don't think this table follows any specific logic, but recent patches
> have tried grouping by similar features or features with similar
> dependencies.
> 
> I don't have a preference, but should this be inserted closer to other
> XSAVE dependent features?
> 
>      { X86_FEATURE_PKU,                      X86_FEATURE_XSAVE     },
>      { X86_FEATURE_MPX,                      X86_FEATURE_XSAVE     },
>      { X86_FEATURE_XGETBV1,                  X86_FEATURE_XSAVE     },
> +   { X86_FEATURE_APX,                      X86_FEATURE_XSAVE     },
>      { X86_FEATURE_CMOV,                     X86_FEATURE_FXSR      },

> There is a comment on top of that table that says:
> "Please keep the leaf sorted by cpuid_bit.level for faster search."
> 
> Based on that, APX should be inserted here:
> 
>   { X86_FEATURE_INTEL_PPIN,               CPUID_EBX,  0, 0x00000007, 1 },
> +{ X86_FEATURE_APX,                      CPUID_EDX, 21, 0x00000007, 1 },
>   { X86_FEATURE_RRSBA_CTRL,               CPUID_EDX,  2, 0x00000007, 2 },Yeah, both suggestions make sense. Thanks for pointing them out!

I've attached the patch revision.

Thanks,
Chang



--------------p2favoQN77XUwAxXNPbwIjzw
Content-Type: text/plain; charset="UTF-8";
	name="0005-x86-cpufeatures-Add-X86_FEATURE_APX.patch"
Content-Disposition: attachment;
	filename="0005-x86-cpufeatures-Add-X86_FEATURE_APX.patch"
Content-Transfer-Encoding: base64

RnJvbSBhM2E2OGVkZjM1YzQzMTYyYTU3ZGFkODBlYTJlZWNjOWMxMTAxMjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiQ2hhbmcgUy4gQmFlIiA8Y2hhbmcuc2Vvay5iYWVAaW50ZWwu
Y29tPgpEYXRlOiBUaHUsIDEzIEZlYiAyMDI1IDIzOjAwOjI4IC0wODAwClN1YmplY3Q6IFtQQVRD
SCBSRkMgdjJiIDUvOV0geDg2L2NwdWZlYXR1cmVzOiBBZGQgWDg2X0ZFQVRVUkVfQVBYCgpJbnRl
bCBBZHZhbmNlZCBQZXJmb3JtYW5jZSBFeHRlbnNpb25zIChBUFgpIGludHJvZHVjZSBhIG5ldyBz
ZXQgb2YKZ2VuZXJhbC1wdXJwb3NlIHJlZ2lzdGVycywgbWFuYWdlZCBhcyBhbiBleHRlbmRlZCBz
dGF0ZSBjb21wb25lbnQgdmlhIHRoZQp4c3RhdGUgbWFuYWdlbWVudCBmYWNpbGl0eS4KCkJlZm9y
ZSBlbmFibGluZyB0aGlzIG5ldyB4c3RhdGUsIGRlZmluZSBhIGZlYXR1cmUgZmxhZyB0byBjbGFy
aWZ5IHRoZQpkZXBlbmRlbmN5IGluIHhzYXZlX2NwdWlkX2ZlYXR1cmVzW10uIEFQWCBpcyBlbnVt
ZXJhdGVkIHVuZGVyIENQVUlEIGxldmVsCjcgd2l0aCBFRFg9MS4gU2luY2UgdGhpcyBDUFVJRCBs
ZWFmIGlzIG5vdCB5ZXQgYWxsb2NhdGVkLCBwbGFjZSB0aGUgZmxhZwppbiBhIHNjYXR0ZXJlZCBm
ZWF0dXJlIHdvcmQuCgpXaGlsZSB0aGlzIGZlYXR1cmUgaXMgaW50ZW5kZWQgb25seSBmb3IgdXNl
cnNwYWNlLCBleHBvc2luZyBpdCB2aWEKL3Byb2MvY3B1aW5mbyBpcyB1bm5lY2Vzc2FyeS4gSW5z
dGVhZCwgdGhlIGV4aXN0aW5nIGFyY2hfcHJjdGwoMikKbWVjaGFuaXNtIHdpdGggdGhlIEFSQ0hf
R0VUX1hDT01QX1NVUFAgb3B0aW9uIGNhbiBiZSB1c2VkIHRvIHF1ZXJ5IHRoZQpmZWF0dXJlIGF2
YWlsYWJpbGl0eS4KCkZpbmFsbHksIGNsYXJpZnkgdGhhdCBBUFggZGVwZW5kcyBvbiBYU0FWRS4K
ClNpZ25lZC1vZmYtYnk6IENoYW5nIFMuIEJhZSA8Y2hhbmcuc2Vvay5iYWVAaW50ZWwuY29tPgot
LS0KUkZDLVYyYSAtPiBSRkMtVjJiOiBGaXggdHlwbyBhbmQgb3JnYW5pemUgQVBYIGVudHJpZXMg
b3JkZXJseSAoU29oaWwpClJGQy1WMiAgLT4gUkZDLVYyYTogUmViYXNlZCBvbnRvIHY2LjE1LXJj
MTsgcmVzb2x2ZSBjb25mbGljdCB3aXRoIGNvbW1pdAogICAgOTY4ZTliYzRjZWY4ICgieDg2OiBt
b3ZlIFpNTSBleGNsdXNpb24gbGlzdCBpbnRvIENQVSBmZWF0dXJlIGZsYWciKQotLS0KIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmVzLmggfCAxICsKIGFyY2gveDg2L2tlcm5lbC9jcHUv
Y3B1aWQtZGVwcy5jICAgfCAxICsKIGFyY2gveDg2L2tlcm5lbC9jcHUvc2NhdHRlcmVkLmMgICAg
fCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZXMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2Nw
dWZlYXR1cmVzLmgKaW5kZXggNmMyYzE1MmQ4YTY3Li5lYjczZjNmMGVjNzAgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmVzLmgKKysrIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20vY3B1ZmVhdHVyZXMuaApAQCAtNDgxLDYgKzQ4MSw3IEBACiAjZGVmaW5lIFg4Nl9GRUFU
VVJFX0FNRF9IRVRFUk9HRU5FT1VTX0NPUkVTICgyMSozMiArIDYpIC8qIEhldGVyb2dlbmVvdXMg
Q29yZSBUb3BvbG9neSAqLwogI2RlZmluZSBYODZfRkVBVFVSRV9BTURfV09SS0xPQURfQ0xBU1MJ
KDIxKjMyICsgNykgLyogV29ya2xvYWQgQ2xhc3NpZmljYXRpb24gKi8KICNkZWZpbmUgWDg2X0ZF
QVRVUkVfUFJFRkVSX1lNTQkJKDIxKjMyICsgOCkgLyogQXZvaWQgWk1NIHJlZ2lzdGVycyBkdWUg
dG8gZG93bmNsb2NraW5nICovCisjZGVmaW5lIFg4Nl9GRUFUVVJFX0FQWAkJCSgyMSozMiArIDkp
IC8qIEFkdmFuY2VkIFBlcmZvcm1hbmNlIEV4dGVuc2lvbnMgKi8KIAogLyoKICAqIEJVRyB3b3Jk
KHMpCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NwdWlkLWRlcHMuYyBiL2FyY2gv
eDg2L2tlcm5lbC9jcHUvY3B1aWQtZGVwcy5jCmluZGV4IDk0YzA2MmNkZGZhNC4uNDZlZmNiZDZh
ZmE0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2NwdWlkLWRlcHMuYworKysgYi9h
cmNoL3g4Ni9rZXJuZWwvY3B1L2NwdWlkLWRlcHMuYwpAQCAtMjgsNiArMjgsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGNwdWlkX2RlcCBjcHVpZF9kZXBzW10gPSB7CiAJeyBYODZfRkVBVFVSRV9Q
S1UsCQkJWDg2X0ZFQVRVUkVfWFNBVkUgICAgIH0sCiAJeyBYODZfRkVBVFVSRV9NUFgsCQkJWDg2
X0ZFQVRVUkVfWFNBVkUgICAgIH0sCiAJeyBYODZfRkVBVFVSRV9YR0VUQlYxLAkJCVg4Nl9GRUFU
VVJFX1hTQVZFICAgICB9LAorCXsgWDg2X0ZFQVRVUkVfQVBYLAkJCVg4Nl9GRUFUVVJFX1hTQVZF
ICAgICB9LAogCXsgWDg2X0ZFQVRVUkVfQ01PViwJCQlYODZfRkVBVFVSRV9GWFNSICAgICAgfSwK
IAl7IFg4Nl9GRUFUVVJFX01NWCwJCQlYODZfRkVBVFVSRV9GWFNSICAgICAgfSwKIAl7IFg4Nl9G
RUFUVVJFX01NWEVYVCwJCQlYODZfRkVBVFVSRV9NTVggICAgICAgfSwKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9jcHUvc2NhdHRlcmVkLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L3NjYXR0
ZXJlZC5jCmluZGV4IDE2ZjNjYTMwNjI2YS4uZmZiODBiNWFkOTdmIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rZXJuZWwvY3B1L3NjYXR0ZXJlZC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvc2Nh
dHRlcmVkLmMKQEAgLTI3LDYgKzI3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjcHVpZF9iaXQg
Y3B1aWRfYml0c1tdID0gewogCXsgWDg2X0ZFQVRVUkVfQVBFUkZNUEVSRiwJCUNQVUlEX0VDWCwg
IDAsIDB4MDAwMDAwMDYsIDAgfSwKIAl7IFg4Nl9GRUFUVVJFX0VQQiwJCQlDUFVJRF9FQ1gsICAz
LCAweDAwMDAwMDA2LCAwIH0sCiAJeyBYODZfRkVBVFVSRV9JTlRFTF9QUElOLAkJQ1BVSURfRUJY
LCAgMCwgMHgwMDAwMDAwNywgMSB9LAorCXsgWDg2X0ZFQVRVUkVfQVBYLAkJCUNQVUlEX0VEWCwg
MjEsIDB4MDAwMDAwMDcsIDEgfSwKIAl7IFg4Nl9GRUFUVVJFX1JSU0JBX0NUUkwsCQlDUFVJRF9F
RFgsICAyLCAweDAwMDAwMDA3LCAyIH0sCiAJeyBYODZfRkVBVFVSRV9CSElfQ1RSTCwJCQlDUFVJ
RF9FRFgsICA0LCAweDAwMDAwMDA3LCAyIH0sCiAJeyBYODZfRkVBVFVSRV9DUU1fTExDLAkJCUNQ
VUlEX0VEWCwgIDEsIDB4MDAwMDAwMGYsIDAgfSwKLS0gCjIuNDUuMgoK

--------------p2favoQN77XUwAxXNPbwIjzw--
