Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758D2561BF;
	Tue,  8 Apr 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148709; cv=fail; b=nWZD1o0e7HC9cly9/XrhkUWWmWFwksyBRiEYn7EUBU0Ct1aFhvd0UKU232kvf9bCalQQdUha9ZCAbX7t66VYrJR7ZuopxQil9od4or54C0Yj7FR22C51DXwlvQ31ePXX3TK3fH7hFNhPQbFt/nnqv3aZPbLogcQGshgR4L4hExY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148709; c=relaxed/simple;
	bh=0v/D2lj8nAqvO9JnUOdxXMb70klmkItw2MM5o9l1SNI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BrTG3PuKt8laSnUnFRSMiSaQj2efxIuM8TLBiS0QxHTsOBjF3X2EwZEJZo2EBBxEg52SqrAFeliKdjpxpCnRM0e1t6c8BFdXCnLELHwOkE6O4XHujW8PoVaQocX6YvYUz40ySq6RZWpF53eDBgriTwwSdH7F5mogV8RqLHrsNqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGpYFtbD; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGpYFtbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744148708; x=1775684708;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0v/D2lj8nAqvO9JnUOdxXMb70klmkItw2MM5o9l1SNI=;
  b=iGpYFtbDitvzezDRX8HECLR1kS/5jkN/4mbEcoTNbQsy4KvRokAhque3
   iAZoAZpw61xkC4184YyIcGAvMwqc9cw9bJrz7kPRf42oAmOL/2q6xpgHC
   iTZLwP5qNx5YQAA8uyMExd5fzbQeEmYKqfF7qEo50R+/KU1cG1Gdpw6HQ
   KxVtqEatWoRVytJfrirCQcK7UQNH7/FcjyCso4O1apKRGyYbB5WDDnUjt
   MmACui7ouU9MeIhoZsEXOVS5aoAieTsK7DZoaVTLQPjw+pyIDJJtNYjC7
   sN8bgl/aXP9l8l3uVKp0gKcVnZEfZv9z0p4r4SjBe+iiiW3zs5glYaGNh
   A==;
X-CSE-ConnectionGUID: gUxwQEsKRkexh1bAjxhFZw==
X-CSE-MsgGUID: UcLyejB7TR6tJzpanyDVhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49263360"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49263360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 14:45:07 -0700
X-CSE-ConnectionGUID: 8qT22FivR5G/WY+k2JOiuA==
X-CSE-MsgGUID: Ohg3hrunQ7qKWQif68NEqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="133597494"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 14:45:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 14:45:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 14:45:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 14:45:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To5BeXsQRtTI3DWmwTid3npfiEA/YaK2fS2+GjsniBk3XsG1KDJix2T2JZKBYTlmncLq23ErJ+2VGoR0QWt0AkXF6j+Y1DqDqPo0xx/RKMXq93uHsH3rofnvogZOurBJlSbrrz80482RmlKKd0IYQUg8a2uhmkpXXueuypXZPjTk8lYHXbcOekHBhUDRmwdx/b57hzlwE3oa2lwuGerQHaYXbZ/cD34DNxVGLBxnYrdhF2UOtX0lPOhqB1XIbEAxHhanXcV+j0YbhVTm+f04VtQ08YHupGEClnhoL+v1BR+MGybMvzLaHaGJ9hxhvJWIyrcecA63dsOCZE7fXz8cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ybqMJsCAoZCEOjxYxMF1bUsCbpx+yzybyFJCEB0OVc=;
 b=OMEagRmn5veAgURwSadCR0xDykLF9VlmdyqiEqNVZFIn2vagmxBOVOs64d4N+IMEYZgx4uNHV1OUm8zPDh2cXfaEmC3Uv/neU8IfgU1e/D+V3SmyN8ZoK0hbCZGUZX049/7SpKDICtxjUfJK/93RR8B4st9Yrg1PV84SA/3/uiPlYnpPersy9jd+sNLLLolEMJNYW41gTmTTIimQPB8gFdrhh0ewin872B1xFlMVcXzvgoturQ/s2MGJSj9O1dMScLhzm0/7VWrdGNFj9Yfgy4IaJkh7dq/CaFsEKX2gmpQjJBKGf9y///3SIGu5Kq/baalBswkzPM2prRlaRfwj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 21:44:48 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 21:44:48 +0000
Message-ID: <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
Date: Tue, 8 Apr 2025 14:44:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: <babu.moger@amd.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<jpoimboe@kernel.org>, <daniel.sneddon@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <tan.shaopeng@fujitsu.com>,
	<james.morse@arm.com>, <tony.luck@intel.com>, <peternewman@google.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <corbet@lwn.net>
References: <cover.1738272037.git.babu.moger@amd.com>
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6da74d-72d6-4430-7bbe-08dd76e6957a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJKL2hEbWQ4QmVUeUJESmpwaDdZTVgvWUhWVDluN3dMKytyMGJDc2c3UUNW?=
 =?utf-8?B?MVVlTktrdDFnR0RKQ2FzM3hOTER6Mlo3UjkvdW9LcytjaUxJL1k1bGZLRnpu?=
 =?utf-8?B?RWUwVi81ci9sZGtPRXJWRW5Rb0JQSXlnQW4rNEFsY1BZbWUrS1BHRWJzWGE0?=
 =?utf-8?B?RVVPNXlrNDhhejhTL2lrR09WbHp1Q29uQXNUN2R6WTRONjkrK20rdEFyYWNL?=
 =?utf-8?B?dkhQa2tzU281dTVNbkdKd1ZGQVJxZlZINi8weXUwMHF3Y1V5cmlFMnd4cmpx?=
 =?utf-8?B?ZmxUQVNxWXVyM2YyaGF6SXNUazVndkUxaFRybkVaZERFSGg4MWNRRk1OOUpX?=
 =?utf-8?B?WDhaZmQ0eFhLZWlZK3FRQUFxMitQTnQ5M2V0SjJwZlNtV21wSXR2VEpiVU5F?=
 =?utf-8?B?MGdvTUtoOUVKSTdJSjZudi9KUmVTeHZoRkM2eCtpVGZ1SnVWK1MwUWQ1Snpi?=
 =?utf-8?B?bzh0dnc0M2lHWUppTjZ1b2Iyd2dLZDc5cy9QaTc2SGxRdmJsOGY3Ulhibmxw?=
 =?utf-8?B?NFhGbVB4NUxwL2ViTFppWjhiZDZvWTFtK1kzKzkzcFdTRkJnc0xuTS9jQWxJ?=
 =?utf-8?B?dXNKU3lidzBwV3BnSGtFUEtqVkcwY0c0dllnRkgvNEtidnJ3c3J1QmVHM1ZR?=
 =?utf-8?B?UHp4NFNsZk53L0JkU3c4Qk9uUm9zYzVvWDAvbHptOVRPWTMwellTMWNwdDFK?=
 =?utf-8?B?cHpmakJTQk5pc1g3aUdweFhyWkY2UVBtY2VURGtxNXdzcVdwaDl0ZTRFaEM5?=
 =?utf-8?B?QzE2eDB4cTFhM29nSkxzSE44SGE2RWcveER5V2c1aEJ6Q2tyZnFKQXZsWGt2?=
 =?utf-8?B?OVB6N1ArRVRPRmRNZDRYSWRhQTdpV2M4RW4yeTRaczNET1Z1cXgrSWs2ZkVY?=
 =?utf-8?B?NVNpNzRjbU9oK1BncVBxVjk5NmlKNXBXN2VoTTVOcnRIaGYxZU5YckdxYXNK?=
 =?utf-8?B?aUFzcktrTnV2UEVhaVV1RC9yWXVpTUVzT09zdStuOFBtbUE5cFRWUkh0cENp?=
 =?utf-8?B?YUNtN2F0cVpFc0d4bllXMXhxOEg1RERwY243NGY1cVI0djBCOS9EVnVFaGhs?=
 =?utf-8?B?UnhEMHdjdXVqaEE0bG5QZzRoem1IV0VzSjZiR2k3YVVSZzdkUkFZaW5kc0FE?=
 =?utf-8?B?SmpVT0MzTnhrcGllMlByS2NZaXo5NEpJV1RaOGI0U1laUVUvUnVSV2MvSG9Q?=
 =?utf-8?B?MzRteStoa2dSbEZySVM1OERoaW5GQk1jQWh3TFRKNzdmUDY2b09nSmxQZ2pB?=
 =?utf-8?B?RUhpSmxTVUlFbmsxRnJEb01VaWt3OW9KTXJqaWdsdWxheFBFUTAwQlpWeisz?=
 =?utf-8?B?Vlg5Q1hUMTBkR2hLRVBncnc1eFVUd3puUlFqMUFjVHJlM1NSSVgwNmJPbjNx?=
 =?utf-8?B?dU95VjcxSGJySlFIQk5XVng2WVAwTk0vbG9PcGRoSlNoeHhaQ1dNYzRXWlF4?=
 =?utf-8?B?bTdJN2JRci9iMjdiaVhOTlhYbTlER2poZFZJa2U1OGhTMkcvNStTOEpmSldX?=
 =?utf-8?B?SkQzOUhwMkx4c2NhUTl1MTNmVktUVGdmdUk0QWE4U3hvdHF2U1M0bGJaNFpW?=
 =?utf-8?B?aFRpUThoNUNzaUcrMkFmeUVWdEl3Z2lnREYwZnFWUnJvbHFUUzlGUEFFUFNy?=
 =?utf-8?B?bHNkRDFUOXZDaFFNZU92NHdhaHQwTDU4RzdacXNmT0pYSzgySUFiazBTR081?=
 =?utf-8?B?clF2OHFreHpuc0EwamVzbURHR1Rva2VNK1lSOVZQUldnZlVUeU5UdTN6TXpR?=
 =?utf-8?B?ZjVMQURzOHBnZWsvZ01vUm1OTitCR2g3b2pHeDYyc3Bnc09HUjFkVDM4dE16?=
 =?utf-8?B?Z1J3MFRxYndDczF5MWx3QjVTdlhSelg4TXE5dkwrbVU0MDhsY3IrOVZoUnN2?=
 =?utf-8?B?aWx5N3djbm00bzlyU3graUFBamFweVRkT05zYWZxTTd3VWFoK0doOXZSUWZM?=
 =?utf-8?Q?NAQap+cAiRY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxrTE5WMGNqOVdzcW4ySVhNS2NVZEZxL29UVy96MHRzem5PaitoZlhnRDBY?=
 =?utf-8?B?VFo3UUFhTnB3NGgvNDY0MWs3UDRaMzZNV09KOUFlZU1SUkI4S2VhNWU1bjhY?=
 =?utf-8?B?MnVRd0RqZ1d0K3hFN1E0RlB5YjVvSFpSeFpXRUJzQ0RPL3kwb3RRSmNheHNV?=
 =?utf-8?B?ampWWVpMamt4dEpMMHNsdDJpeC9IdnJOUVFqd1BKMDZObVFUSlQxQVI5aGhD?=
 =?utf-8?B?VUgvVGFZVDdnUmdwbng3SFB6QTdZOTM3VTdQS1BxbTArdjBzVUloVXZQLzFw?=
 =?utf-8?B?RnRUdjEwOVVjSUt3ZEY5R00wbzBDeXN4L2UwZGxWMm5XZTBteWM1bGFrdjJ5?=
 =?utf-8?B?ZElXdXJKTW9kTnJIMTF1U1pVd01xajdVaUdmMld0ak1kUFBLVFlVaFgwSDZa?=
 =?utf-8?B?NjJCRXBuWkdrT25mdG90RDR4dVZRa3lFWmo0OHFqSGtLR25SbEJiekRMUU5C?=
 =?utf-8?B?YWJXcGpLeU5uRXNJYjRDdzRlSktaNDB5YVV2SEsweFpPN29SMThLQ042aEkv?=
 =?utf-8?B?bTJ5T21lWXFtN1RES2ZEMjA5QzlMSVZBRDl6QmRiZ0l2b0ZCdE00Qmd4V0lO?=
 =?utf-8?B?V1M2T0RRTWdjSkNlUk5LL3ZOTlpMOVgzK2NybnhHeHhuVENta2JLeVBmT0VR?=
 =?utf-8?B?OXgzU01zMllXcjhrbDFRRUEwVDdVSlY5eUV2ek1UYlZ6aUt3MnFGelJoaWRN?=
 =?utf-8?B?ay9ZNXNFT3BKb0l2c0l4UmJaeXRsVUVFVitZQmVjNmRzQXV3MzM3ZmtZMDVE?=
 =?utf-8?B?d09RV3lXSHhwaXAyRWRpN0tKN0srdUJsZWZmSGc5U2pkZ3hDK3dudmpTT1VT?=
 =?utf-8?B?S04yV2xvaWxuTU9TUktkTTdvZnlBVCtCTTdNNlladi9IY3B5VjcwTHIxRlBK?=
 =?utf-8?B?NjdxSFRLcFJtSFM3dFUzcjcxWGQ0b2pmWTd3MHJhcFFjOWNWeUMvT0s1dHkz?=
 =?utf-8?B?RXk2cm12dzc5MDNvcEI4UW53bFc0Y1pKV0NHTU5CN1hsZWFzajNNWStRZTE4?=
 =?utf-8?B?amZ4WGZMSERxM1RMUjJQeUR5RXI3V1VKUzhQZlJYekhObmp0dTA2S3pwVHhq?=
 =?utf-8?B?YXZTaEg3K2dnMlhEdm5XWmdadzAycDlkQ1oycHVJTGtyV2xwWDFBNk1rYity?=
 =?utf-8?B?VVFVbWlhbVFuYUlFSEtNNXowdWQrN1pRUk5MTjZZOFoxZC8renQ1YnlqSWhk?=
 =?utf-8?B?Z2xKQkExb3hyaXNvaVByd2phZkVyS2xDekhxYXNPUnR4VjBHV0lqQ0l2QUUw?=
 =?utf-8?B?QXB1cEFybnBjcHdydEcwMzNpUzFUY2JWWGl1NU4xbm5jSnJqUE1HWWRlR0oy?=
 =?utf-8?B?dXFYKzRET1M0akZ3eDd0NzA4YVB0SStId09BSVlMTmZKVWpyM0dhVmhKeTJY?=
 =?utf-8?B?RFNsWkZjdWd4NUZ6T1JZd2JRK0NOM09FK3ZibkRFdThGNUV5TVBIc3ZZR0Ex?=
 =?utf-8?B?NmQzTzdGSzUycStPSGx4SkNIc3M1NGlJVHBXckhJb1Jxc3FCVmVCbmorL0VI?=
 =?utf-8?B?RTRsb2VPU2Fzb21iMVd0Q3FIeUZjSld6eUNPcVdBb2o3WmZha3V0ZmNhOE96?=
 =?utf-8?B?RDdkNGZnTlFjeXRTaDkwakdiNmMxZEJ2eHVjcnA3UDR0YjNvMjV0QWg2d1BN?=
 =?utf-8?B?UXdDbnZuaDA4TWswWFNSam4xbDUwOXM2YVg4SHdxRUFkN2oxVERuSVdON1NM?=
 =?utf-8?B?c3hONjJ6TDBkUFpyR3BaczVNYUR5VVB4Vis1NVlmN29tdFdNazFqajlKb1Jm?=
 =?utf-8?B?K3hkdEdsa2JZdFBtajNRd3JlekVrMTFvbStxazg4cHhFQnJEQ0lZU2V6bzRC?=
 =?utf-8?B?VEtkR1Vpa1NUOEJRdFNDenozcWFSMjRWcDNRUkFFd2loOTNpcE1MSnBOWEI2?=
 =?utf-8?B?UGVOZTJwUERGRnBZTjU5U21pNnZUNEl2SG80TEJZeG5LQ0xoL0h4UGJERVlz?=
 =?utf-8?B?RGhvZFpaMUJYRUtmY292dXRCY05FK2lWQUdaRUsvM09lZzFINWNBbTVqa3d2?=
 =?utf-8?B?MnltQjNkY0RwcFl5K2tOZzhjcWZBQWhubzR6K2xOTVo0b1gwUmhnSldTVnRG?=
 =?utf-8?B?RXNJN2pETFlTWWxmTWxLUENjVEZuUVZNRXVJWkZHWVZwc3J0aEIvT2t5TkZh?=
 =?utf-8?B?MngvL3U3QXQ2TVpIUU1Fb1RucFdYNUFGb1Zkcm5vZXpQT29kaUFacFBybytx?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6da74d-72d6-4430-7bbe-08dd76e6957a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:44:48.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MujIByCbPcunXPvnPm/U/Vosn7grd5MwIRJxmCSscOktywpcD99d/PxGioMP9zQylI5uFjBNjv5k+McwK68VE2eH4ODuoufD2K6UbX6m0a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
X-OriginatorOrg: intel.com

Hi Babu,

On 4/7/25 1:12 PM, Moger, Babu wrote:
> On 3/21/25 17:50, Reinette Chatre wrote:
>> On 1/30/25 1:20 PM, Babu Moger wrote:


>>>
>>
>> AMD also supports what is exposed to user space as "shareable_bits". According
>> to APM:
>> 	Depending on the implementation, some portions of the L3 Cache may be
>> 	shared by other system functions or used for some other purpose not
>> 	under the control of the PQOS feature set. The L3 Cache Allocation
>> 	Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>> 	bitmask that represents portions of the L3 that may be shared by those
>> 	functions.
> 
> Here is the complete text.
> 
> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
> the cache which may be shared with other system entities or used for some
> other purpose not under the control of the QOS feature set. When software
> sets a bit in one of the L3_MASK_n registers at the same bit positions a
> bit in the L3ShareAllocMask, processors executing with the corresponding
> COS will competitively share that portion of the cache with the other
> function. If this mask is all 0’s, then there is no other entity in the
> system competing with the processors for use of the L3 cache.
> 
> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
> 
>> Could you please include what (if any) the relationship is between the CBM
>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of 
>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
> 
> No. There is no relationship in here.
> 
>>
>> On the resctrl interface side the documentation currently states:
>>
>> 	"shareable_bits":                                                               
>> 		Bitmask of shareable resource with other executing              
>> 		entities (e.g. I/O). User can use this when                     
>> 		setting up exclusive cache partitions. Note that                
>> 		some platforms support devices that have their                  
>> 		own settings for cache use which can over-ride                  
>> 		these bits.                             
>>
>> Even though this was originally used to expose the content of
>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>> seem to also apply to the "io_alloc" CBM also.
> 
> It says "shared by other system functions or used for some other purpose
> not under the control of the PQOS feature set".

This is a quote from the AMD spec, not the resctrl user interface documentation.

Please consider this from resctrl user interface perspective.

> 
> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".

When I read the resctrl user interface documentation for "shareable_bits" it
sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
shareable resource with other executing entities (e.g. I/O)" ... is this
not exactly io_alloc? 


Reinette

