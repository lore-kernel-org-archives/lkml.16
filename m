Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96CD2356B9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062243; cv=fail; b=hL+tjypKA/yqySCBGoEfc0XXa+YUYObNrQbKXNilDY7Ra6h2HVfgms1s2xTJD0yJDu1fpUBzv2BxbCeYzJldNCvLtbcTPIsd/gry6TsewsI9Alf7L8HjQms6mF6yUYptBNN2qLzjr1O7auJGxIYgPA4/6Gu381tAgfIk5SCrQfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062243; c=relaxed/simple;
	bh=T/tOZNGy9sfXfF/ii6yu5CSyPdvb0pa1KuE0sj2q4Fs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uXdYUGTcF3PNjdazhK91cWiBwqfb/ZfbCu7cxk21OgEFAyoDM190zbY7eqcDBUD0JbLDhZKtEpE96Ac6eLyLc85mPANIh6dqRLwaqkEXuXL/w6x9SQC5LTUI7BXNPx7yeDU5zYemAeBE4/II1YDediiVXJpMI5YOEpOy5mRtMKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0o6wEuK; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0o6wEuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750062242; x=1781598242;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T/tOZNGy9sfXfF/ii6yu5CSyPdvb0pa1KuE0sj2q4Fs=;
  b=P0o6wEuKCDQh2lbBNhtKoHHCt696cKQAAcdeFfs4k1i2Q9Qpf0KIZROP
   pTi7eXaN0QfDihCfTsZvrzQYk103kRVxJq7QldcDOTbClh+8ALGY0Ftfb
   RmhIdSMJodz+czS2UYLSbiaUMCVHQx1K/9vhTyQHn+LrCVhk/FvIXex0u
   WV3i74L0tqMbA4uKOVXNpn3qDlW7npI5CizrcqN4qulMQtmgZDA3n2d0Z
   Q/CFrZuG7jatPrFTWR819NJ3BNmFCUusR6U9N7XvNeyrvS55ZKJI5uBjz
   +13VgHuR5gl5PpKxVPwgQGodJzecLsbX5QCb6bB4a4MpGNBykZpWy2H9b
   w==;
X-CSE-ConnectionGUID: k/dmPucMTYevsWk95ivI8A==
X-CSE-MsgGUID: wgpizT/RSJKKAJxJJ3dRvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52342160"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52342160"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 01:24:01 -0700
X-CSE-ConnectionGUID: m3aWxPe0TlaOJwMm6zkyrw==
X-CSE-MsgGUID: Mt6skPCSRU+QZXVIsMJZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153707430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 01:23:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:23:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:23:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na2oCoWSqo/ILkl28fdJpROOUSqXLFaqLMUQ20g1g4Jw/RH3k4uSB8AaWZDYlI53ozwKmtRQaEoDfbjgqkHlUTnT5/D6H+cYVjxmPW4FDZSiLPxL7l3NdaqhuqvOxgzFIx9cJqg72mOgcV/TN+wGiC+R/MliWSmddU5zdgC4+bOrR6wW43L7+3t6RCcLGYvUlpGX4y4Ypl3W1vmfLdNUsYhtHdj8/y1U+XW4wbtQtph4MeG7cOxtDRbiVWge/Gl/8jfux4rGEXHuONBiRa0omUvzWDTL4/ZmKWJFfDTxQgt2Uh7U1YK2Ch1PuuL2joqLrfk9xN1SAw2MgyGHfT9NcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45McTcjdDXnLaXY7slSVreFrNCDEW9Q2Sut7P0npySY=;
 b=bzydPQaHKMyNIkKDpPGPinhRgKONHlwWtlVzJe4yH9zmsIVzdqfuwsNOQVeNopwQVQdtyl8d3e12X1Au/UOcasRcf6qWjT62E3NAcdvURWiiUxFZh7BUtuNa/i8fNQ0qC4SA2yw9I9RCAtR+Vb0OrGSoE3oLv69yV5Xs08y/qdWYWoMe1BfLvib/fW21KAPx5nekoSQ/zXiTit+EiI5A1y/4FzpOEHEeEU7n+uPy9J2RhsXohvvX5e1XqaIljlv51Q2jCoayloGiL9ssTUP4spgJZzC6yMk2WUOnz/iNRDmNSTIASsla4hc8pmuPNiJdZC6AsvCsHRaRsrNxsvWQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS4PPF6915D992B.namprd11.prod.outlook.com (2603:10b6:f:fc02::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 16 Jun
 2025 08:23:31 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 08:23:31 +0000
Message-ID: <da5bf77b-5bdb-440f-92b5-db35d8687987@intel.com>
Date: Mon, 16 Jun 2025 10:23:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/44] ASoC: Intel: avs: Include CPUID header at file
 scope
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>, Sean Christopherson <seanjc@google.com>, Sohil Mehta
	<sohil.mehta@intel.com>, Ard Biesheuvel <ardb@kernel.org>, John Ogness
	<john.ogness@linutronix.de>, <x86@kernel.org>, <x86-cpuid@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
References: <20250612234010.572636-1-darwi@linutronix.de>
 <20250612234010.572636-3-darwi@linutronix.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250612234010.572636-3-darwi@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS4PPF6915D992B:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5fb3ed-3b20-42df-f974-08ddacaf142b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVd1bjZxM3k1bFdGdDFQZVdXc3lGU3hOYUh1bmI1alFoMGw0TXd3SnplM2M1?=
 =?utf-8?B?MzhScm5KQjNnZFJBVTRzd0pEeGxYeVBSU1h4NUFQaE44VytvdnBqRGl6bVU4?=
 =?utf-8?B?S1lxV3JSdjZyQ1lCU3ZlZjlmN21DU0E3YWYrc3k0UCtQb0twZ2ZpcmdsWndY?=
 =?utf-8?B?OXhHNkp2Nmt6UWx2clFDK2hZUHQ4NHBjZDYxY3FPZ2lEbWdFZHBnaUh2OFVK?=
 =?utf-8?B?dkR1enVNaEtKRUZxdFpWTUZrTXBCb28xU2lVVmd0NWFxK05yVWc5TXZCd0pW?=
 =?utf-8?B?bDZLcUgwUmlNT2RZSTBqbWJ5Mis1MmpQY2hrNnFqcjd3VFNDa2RDaXdEUFMv?=
 =?utf-8?B?V2NLRGsxWGNob1BjVCtNODVnWEtHcHFxU1JjVlRmMUdYWUc1WGlmWG85MDRJ?=
 =?utf-8?B?cEJFQjVRVG1oa1E1YXRaVWRxK0pJVFhXNUVoVlRwcHdQVE1SeTIyZXJQSThL?=
 =?utf-8?B?ZUtucUxMbXo5M1RIbVZRcTg5Uk5pVjlaKzBjOER4MHlSS1czb3lLb0cvc0F0?=
 =?utf-8?B?Ri9IcWF1M3FSMkczOXVlSGlOVzdQOFRmd2RTYWRLOE50ZHNQT0poR2FJUWdh?=
 =?utf-8?B?VlhGWTRPZmpOd2lyakNwUFROMmlLREtsVHlzS08rczNybC9kcnAxV3ZYUGVm?=
 =?utf-8?B?S05CY0lhMm1BaUt3RWw5UjZDcmcxUVVZSi9kUXV6WXFqaWZqanlXNUd3aFpL?=
 =?utf-8?B?UG1BVmV2WHpYakl2L3dXQ2ljRlZiMU5sRFJDaW5BK3ZhcUdaWi96OENSMlh0?=
 =?utf-8?B?SyszTnp2M2k2RDBRaDBvZFE4UjhCN1NUdlZ1OUdyVXBCd0krNUxGbUxzTVNq?=
 =?utf-8?B?cTFXWktVM1RFTmtZNkxHdVNBYXZOZTNHYitHdTVDK0Z5Q0N1T1lRQXNIcTBq?=
 =?utf-8?B?V1craFUzUUJMLzQ0VzZDVmJYVmR4U0pEdk9hblNxb09tY2VBZGYyeTh0eEcv?=
 =?utf-8?B?SFArenVwTjVVakFKNDVlQnlOVWtDd0NLeklOcnhLdVd6UUEvUWxNUjZZb3Ni?=
 =?utf-8?B?cS9KTWIzTCtBTWJSQ01wT3NPcVVSclpHTHBiUUYxNXNwWEpkdTd2Mk5SdGNt?=
 =?utf-8?B?SVdaUUwwNlJnN2dyYm54Z0pndFpMdlJwa2JPVmRrNzR0UHV2VHpQeHFvdGtW?=
 =?utf-8?B?UmN3Qnc4NXhabjk0TG9adnY2cE8raG9RNkx1OHBTYzNQWjBTeisybm05b1FV?=
 =?utf-8?B?ZnNNZmJvS05LSnVDUS9yU1FsWXU3M1NvcTFHRDdEZmZwcjRqYTBtcHZNTmV1?=
 =?utf-8?B?OHpPaGFSOFZMYVlLNEJwSHVtTnN0KzdFUkJBQ1l3N3VrREtXaVZuVENEUWY3?=
 =?utf-8?B?TGRmZmJTRWVQNmsxVDAvV3lwOUZsaVMyOWxRVi9DR050TzVXTXByQy91cXFH?=
 =?utf-8?B?OUVtMmpLY2tyNUt5SHdGQ04zajN0dDhrMFFwRHViMk1XZlVDVUxpdWZ0VG90?=
 =?utf-8?B?UnRPU1RTdFVpUHRxQVp1M1ZzUGVpWmd4QXZKQS9XdlprUGxVNUFTa0NVVmo2?=
 =?utf-8?B?b2xYNnpFUTBDWkw0d1ZHUmZxQjgxdTlJYm1MUVZVWlZCTkV2ajgyVGRQZW94?=
 =?utf-8?B?S01OODd5OG02K2phN0gxQkJsdjY0SmRPeFBqR1NWTHdObFg2d2ZJYUdkdUd5?=
 =?utf-8?B?NTdtU1FsREpWSFlKVEI5OTZ6Uk1UR09teEt0YmhmLzczeS9TSzQ4OXVKaWwy?=
 =?utf-8?B?OUdiUGp1YXd6YTdyZnozWlJRV1NyOHNEcitvMHJRbGRITHNxTTVXMGdaYmV3?=
 =?utf-8?B?aWxyb0x2S1VQaFdvWmRtSkxsRzY4Y1MwQ3pCRDFTclBQbW4xSHowK3lRZkhI?=
 =?utf-8?B?UklvYmFjLzZDa0NuMWxXWGJINi9UVEVTVC96R2xsQ01WSWtFd2NQdHlVbFFN?=
 =?utf-8?B?MHBMamV4Ly9nU3VNN3I3SmRWL00rUHRTV2FGWGlkWVdzdXM3S2xSTUlGLzFF?=
 =?utf-8?Q?OAA2RO+It8M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xCU0JhSERMVEpPWXcrSDlzcFZlM2pzdlZBZ1RtS3YxV2kyankwZm9Zb1Jj?=
 =?utf-8?B?Q3ROeHJ2aDVuYmxqM3BlK0l5U1RlOERXdTZvbW1DUE1PczI0aFhYcmpVZ0Rl?=
 =?utf-8?B?MTdiNWNSMmY1SlpBZm1VMk5sUHFkZ1d5aHJGSjQzQjA4SU5Ob2VZdHRtYm1L?=
 =?utf-8?B?bGtNcUJtZFg5djdkNTVVeDlXUzAxeUNNTWgxRkg3SEpObGhJOXdJVVdEaG5t?=
 =?utf-8?B?MlZVQXphSUNTSmVpZnNhd0w4S0ZzVnVuK1N6RDJHOFVoTWZpR0M2OFhVRUpq?=
 =?utf-8?B?QVU0QndFZFkyMU5KQmlHUTNtYXZhTWJoUUVXWlJ0WjRXRTZDa0wzVlpxMWY3?=
 =?utf-8?B?RXNhTW8rUmhLOWZpb1lSZFRtc2YxOFpXcHY0Um0vay9yZTBsTmZNZjd0SXRP?=
 =?utf-8?B?S2xBWE5TYzZKMitjVEtNRk9aOEVvTGJJRG5pSWpMdnlyaldsQUZyY2ZTOEpk?=
 =?utf-8?B?K0lab2pSekN6bTEzZXgzWVhXMWd0MDViUkxvWjZJL2NReWgvMVVhZExNcWQ2?=
 =?utf-8?B?dkNQV3hGMmJuOE5CRTR5akFCdzdUcDUwbDFGWlhQWlFMR3Nzdjh5VDlONm1p?=
 =?utf-8?B?RURBN2ZLUTZFemFnUWM1OVQzWlJGSEtab1UxTjR5enR5bzlDMkZ6Njc2aHdm?=
 =?utf-8?B?eWI1eVpzb0F0L0FROGdQVk5xSkQvcThUenFxZUtaNVRycDNwRUV2bElXY2E5?=
 =?utf-8?B?aGRuWlJ4OFVlWFlteDMyd3ppbDRVNThXOUVTMTZTYk9EYW1JcUE0U0VkTkRP?=
 =?utf-8?B?VkZhMEY4UmtzQlhYNE44S25zRDBLSDRLRFVKSHF3Yy9wRDRUWk9ZaG04elZG?=
 =?utf-8?B?VDRPRHhLQzA0NTh2MlV5azlJSngzcXRDeEhzdTZyS1k3YWVGVkFvZmFjUlZj?=
 =?utf-8?B?UGRaY2FTYkJlUlpvTWVtQnZSenVmT1J5MlZPMytnQnlrZEFGZmdhUk5lWGh3?=
 =?utf-8?B?ck1neGpEbEQvUnQyNVh5aTROd0JOYVQ2QWc2Z0NwMHBSOHQ5MlhPSFJpcjR5?=
 =?utf-8?B?bkd2MDZ3QkRYb3ZGSnVaMzIxbXlSOHBqU0RFdDkzWTgwblZEOHJqa01IM3Qr?=
 =?utf-8?B?aktCS3NxdVBNNVlyUWVOZWc5ZnEzSU40QVdSN1JSalVMTmw1OHdqMEZMakZj?=
 =?utf-8?B?M3dyOHAybDZsYmtGUVlCYzBWWVZKQUtZUm9BVWMvNC9kZk45Z3MxN0RqSWo4?=
 =?utf-8?B?NVI2amNEODVZWFlUVHUxdnJjQUV5bG42Z2RHYlBDMUVFcnpvc0VqaEFoSGFL?=
 =?utf-8?B?U04rZlVvc0pBNE96MGVmMjNaa1hHSkhwcCtlbkZ5TlFWT250eTFqRlN5Y0tF?=
 =?utf-8?B?S1g5Z3JHWnZUejM4YnFPZ1R6L1VYS1pXOWNqS3prZElONUl1R2x3dXMrV08x?=
 =?utf-8?B?akNSci9QcklZRWhsNWQxQXNZd2N3SmtRMjdXYkUrVlNocE1KT0VocDNHVVpt?=
 =?utf-8?B?U3JmaEJjQVpWaWY0NThNTFQwMnQya3ltOEY2L0cwVnY3QkZaOUZhWXl2UUhu?=
 =?utf-8?B?S2wrRFN2VGlQL2l6UUlXZFpSQ1QyME55T01qUU9xYzNzUTRoY0JWYVlZN09m?=
 =?utf-8?B?V3psWWIrWnFxalg1eWFjVDNmenh1VUhaQjR6TVprNHZabDJkUFgyd0tFZHJ1?=
 =?utf-8?B?bytUT2FISmJwaVoreERTdFdhUFp3V2xqRGVYNVhQNDIrY1BqVmswcDhJcGYx?=
 =?utf-8?B?WU1KVXVFdklCY0hhTEEyUVBCZE9nTjBaNXlTeHF5b2JjTVgxVW4wUUdKRGJO?=
 =?utf-8?B?TmNXZCs3OFo1YkxzV2pTVjluWUx3Mkx4R1psa1pPbkI3OVZiMzBiTUxRdExX?=
 =?utf-8?B?K1JaUUpLbGxvUERlNmZ1bHg5dllmdGNXTzhmQ0xzNjg0N2E1WkZuV3p2Njgr?=
 =?utf-8?B?U1d1YVAyYUpFbEM5WXF5ZGdQdEE5ZHRaVU8rYmxLdnExNkU1ZVU3TzdRQnBo?=
 =?utf-8?B?OGZWdSs3emU4a0xidit1Y3d3K0pnbXROK1FEeXd6ejdPWjBEMm9rOFRzK2g3?=
 =?utf-8?B?TDhhTEZMYXVnN0RENGhZVnRFcXlqaGJOVkZsS1o2YS8rR01VYTU3SVcyTUhs?=
 =?utf-8?B?d2FVdDIwYXlrSlJMWUxEcnZtRTNraUQxOWgzSFJCZUpCN3NHRUg3VjlDSG1O?=
 =?utf-8?B?RS9NaG9Hc294Rmx1MjZtbGdlbnV2VUNyUnNwb242Q3hKbkszbm8vczhtODBa?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5fb3ed-3b20-42df-f974-08ddacaf142b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:23:31.5357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLt2tCIN2Hebwrf1f6LhosDef7TU6M39hbxY3WUBatba6g2FzAOm2bt7/s7dWR/M/Q+3qIiJlhSZVwzgI1rbhxr5YS7YGUuPRtModJubno4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6915D992B
X-OriginatorOrg: intel.com

On 2025-06-13 1:39 AM, Ahmed S. Darwish wrote:
> Commit
> 
>      cbe37a4d2b3c ("ASoC: Intel: avs: Configure basefw on TGL-based platforms")
> 
> includes the main CPUID header from within a C function.  This obviously
> works by luck and forbids valid refactorings inside the CPUID header.
> 
> Include the CPUID header at file scope instead.
> 
> Note, for the CPUID(0x15) leaf number, use CPUID_LEAF_TSC instead of
> defining a custom local macro for it.


The existing location of #include isn't my best work, clearly. Thank you 
for addressing that, Ahmed. For the avs-driver bits:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>   sound/soc/intel/avs/tgl.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
> index 9dbb3ad0954a..cf19d3a7ced2 100644
> --- a/sound/soc/intel/avs/tgl.c
> +++ b/sound/soc/intel/avs/tgl.c
> @@ -10,8 +10,6 @@
>   #include "avs.h"
>   #include "messages.h"
>   
> -#define CPUID_TSC_LEAF 0x15
> -
>   static int avs_tgl_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
>   {
>   	core_mask &= AVS_MAIN_CORE_MASK;
> @@ -39,22 +37,31 @@ static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stal
>   	return avs_dsp_core_stall(adev, core_mask, stall);
>   }
>   
> +#ifdef CONFIG_X86
> +#include <asm/cpuid/api.h>
> +static unsigned int intel_crystal_freq_hz(void)
> +{
> +	return cpuid_ecx(CPUID_LEAF_TSC);
> +}
> +#else
> +static unsigned int intel_crystal_freq_hz(void)
> +{
> +	return 0;
> +}
> +#endif /* !CONFIG_X86 */
> +
>   static int avs_tgl_config_basefw(struct avs_dev *adev)
>   {
> +	unsigned int freq = intel_crystal_freq_hz();
>   	struct pci_dev *pci = adev->base.pci;
>   	struct avs_bus_hwid hwid;
>   	int ret;
> -#ifdef CONFIG_X86
> -	unsigned int ecx;
>   
> -#include <asm/cpuid/api.h>
> -	ecx = cpuid_ecx(CPUID_TSC_LEAF);
> -	if (ecx) {
> -		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
> +	if (freq) {
> +		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(freq), &freq);
>   		if (ret)
>   			return AVS_IPC_RET(ret);
>   	}
> -#endif
>   
>   	hwid.device = pci->device;
>   	hwid.subsystem = pci->subsystem_vendor | (pci->subsystem_device << 16);

