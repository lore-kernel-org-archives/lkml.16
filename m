Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAF2DCBF2;
	Fri, 23 May 2025 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747975672; cv=fail; b=Vt0XHj/7ASMTXnT/KbEJAZkhW0JlLJGUFtmAeluvzzbIf8tf9AgcBrf2UazlQDgEJu2g7NpupF4xbBznkLXYBjw7CI0VMzyk2fhNDncf55N93V4MnJD3ZQKxUYJ09QHrj3bM+Ny6EkQPGLMX+4ympERKGrN5c1bf7DUOIGUEMh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747975672; c=relaxed/simple;
	bh=3rlT4JviZAMYHUcVlzBhKMWXGg4+5iDLNzrshU5cjLk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TRm/krx/7fVdkqPbpgTIw31JhMyNwmhe+iBcGh46aqORzws5i+OY67OG9Qxtyzk5v8OaPj4ojNPJovyt+KwmMZizLEN3vShn+Iu1tY2euaILyJ3PrT2kZ19+HqlsZWbn2nUEBIY+CL77yTrPD9OJUWWq4qPm4Vnb7C3ns9ix2F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lv+ZkYR8; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv+ZkYR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747975670; x=1779511670;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3rlT4JviZAMYHUcVlzBhKMWXGg4+5iDLNzrshU5cjLk=;
  b=Lv+ZkYR81tBD5s2Mw4lZh3ALFm3SPtr2dJR8hnt4HSwTOiUCtHi4yNKF
   MaxQhVWhzufWIziWkmS4vhon6TFs4FxDwrbczbUFQo/QSaHBHxX/JWFS5
   BnSY8Avkm2aFNNADfTzATgPrfr4SFsISxApfNPGbM0LiaTY7yfdx2mg3i
   oz/ngjGzk4+O7CMhcxmMyzxMR/B6YJc7FoRVCWq3ogw0JmoIUUQWsv1Pi
   BXyCrwJMEkOvD321zW+wZZ6gf/HLtTypCBocYwoEOji3x/ubMDI1r2keP
   gDpO2H0fAlVegH7PJMyyBLddKlucOiaRbcH5a2nVJyqvhAc5TnQYb/AyT
   w==;
X-CSE-ConnectionGUID: 9vl7PDjeRzan+iVz0VyqqA==
X-CSE-MsgGUID: uDqRwblYTWSHu7z4U0HbKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75422523"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="75422523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:47:49 -0700
X-CSE-ConnectionGUID: Y0CFjFV2S3O4SUW3RwPQXQ==
X-CSE-MsgGUID: 8ig2dXVuT/eBhO7daoNfUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141005957"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:47:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 21:47:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 21:47:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 21:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX5IGK/ZkdKmJvgBHLomPm3HQEByphwlc1inYrl6szLAdw5NIOnljlxodJLwXiONDMYEyEZ+BtH54QOO/2tK8ehPhGz1ZwAUalNWix+39SbJcOtphI8hF7QVfIxcNPqptT3NwBlmYRXGyN23zRrwawyYLY9rQPaUHDB9/H+bV8KCRkOc4ID0FJz+LX1Bu5tD1VD1ViSCive+7I7Y30x6exgDTAl8gGKd6ruGlLgtSt4HonX/BkeOK5VJFwEFyO1maJ2+5QiAYJt40JSuORqleOoCUzAedvl+qvytX++/CEUdjljKsIA10u/N7OcsBTImiHpWsaYGZdin4GHhu29SWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os3RpG3UIOttsaqwIqopNgixEEVt+uLbCqdRQjRkmTw=;
 b=VixjqoKDVVI6qaaU3ZFhNVMRllzDUQ38FuCqwf6n8ft8N2fA59sC/v/buRG7oIj6x1xjo60hrf8I05D6/PYZviPbVD3qz7vPCnd5sRW9TxJdKMXlBed4vftcETcHJLqmVpA6GBGrKPSfHJF5skDgXWzpQLTMWc1AJViWYMFwmf4u+7q6pNEZSe51fvLtHf5VuOC0SLHEBFUEHK18TWZvwj9fPYE/bHK9MPpqR5mwKCdcMVVgtjKjTmPfriEA4JF6yIzccwBWKhbXpEMmkwQzf5oKZDZgheB/v2oUcxoPveUYuSIqlQ06/PCGw1crERy4JPKm2o1WLVILUQweIo1VMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 04:47:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:47:44 +0000
Message-ID: <b197893b-37f2-47de-ad4b-801192ea3e7a@intel.com>
Date: Thu, 22 May 2025 21:47:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 23/27] x86/resctrl: Introduce mbm_L3_assignments to
 list assignments in a group
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
 <e0fe5863ad1801183047196d212ff3b1b79898fe.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e0fe5863ad1801183047196d212ff3b1b79898fe.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: da3dc3b7-4f46-4361-a78b-08dd99b4f4ed
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXkweTdUQXM4OVBKSzdralNub0x4bTNzRUwwY0NyT2FhQWJNNG9ZMGp5MEVv?=
 =?utf-8?B?bExhQkxUa0hUbjVMdXNGR3lJZXZ5Vmw3QkFjTUUvTDJRZEh3RU9hclB3cmE0?=
 =?utf-8?B?bVVVWWJiaWRHMFVNSjVYWkZTYllUUmFQTUdCcitqQ0dTM1pSNzUyWjdIYVRF?=
 =?utf-8?B?T09nTkl2QjdJdXQ4ejA0N0xwUEFpUWNPZ20zQUFZUllLOXRVd29ua3cwYTJh?=
 =?utf-8?B?ZWhkTURYWjFEUzlZK1FiYjlLWU50NXB2Ny8zanFNcG40eHJOanVnYUMvVHZN?=
 =?utf-8?B?VEtYM3hmaFRvbXJ3djhUVXRmSzZrOWYxSHNidk9JU1JxQ2t1b1EzcEZkTW8z?=
 =?utf-8?B?aVB0b3RKR20yMXJDaHVzVFp3THk4UW9jdXpZaWxZTHJOSzR1RXl5S0srYTFO?=
 =?utf-8?B?OUxER0VyS2JlR2tyaUo1MXZyNmdYV015bW0zM1VRRWZpaXg5allOQkhNaFUx?=
 =?utf-8?B?OHRYVzJsMEU3MTZxQ2VOYmhmUjBTVG5nUkYxcXRVdEEwY25zQkpZM1lNOGhs?=
 =?utf-8?B?SzVtaU43Q1hUYURGeTVrOUxmVFR5MmtrYXJQbmpLNW1MRGtPellWaEQ4ZVli?=
 =?utf-8?B?alRlUWZkTFRGMHBDNU81bVhITWluTjNPOVgzQ3BrVDUxZU04WGhUK3R4K3Bl?=
 =?utf-8?B?UE4rc1JkMjhzTVNQQ1owWXFoYk51MHIzdFk1L1d6S1NlZDZDRllEZUNBNDVx?=
 =?utf-8?B?M0U0RmJrRkZtOXpEN0U3WWRmM2RpSHRyK0xkZXVodlg2ZGdkNzFqWUJlU2hQ?=
 =?utf-8?B?RzJ3Lyt4ZG1vTXp0ODJOeWYrOFovWUkwMHhmOWpGZHExVzVDcmNzT1Nnd3JQ?=
 =?utf-8?B?aC95R1hXRTVDd09WQzBXc2FrdDRIZ3VveEdlQlRJbGFPUkk2ZGs5ZmxzR1Jx?=
 =?utf-8?B?dkNERGZiWmdTd09kYVZ1SzQxditVa0VORmJKWXhyeDBvRHhoMU5WeDZITmlI?=
 =?utf-8?B?TFBHV1FwenB5Q005Z2t0TW5OeXBMKzhVejNnbVhlOEc0TTZVdDVORmdjbHRj?=
 =?utf-8?B?SzZNMnZnWXpUNTVZeVFiZFVNL3NwU2NvMWkzRWYwTURRSlpkYVJMdkZwUE15?=
 =?utf-8?B?K3JhZ1NrMS9QZHRLcFlzS3J1UGdlQkZNRDQvVmtLaTVqN1pIZGtTbnozMXZG?=
 =?utf-8?B?b1UzODBkRjFkd0c1OTVkV3IvdmN5TW5weUNZMENDRjNwZXI0S2paZU5nMnJ6?=
 =?utf-8?B?ZHRwaGpoMmcxTzQ0b2xENW9mUkNDb1JVRVRtYnVoUnc3ZDdESUdheTNBMFRv?=
 =?utf-8?B?UTVDejJnQmN0ZEdSVFZmbllWYm5kd2RkdmN1RWpKeXFKK1gyOU15ZjByTVBU?=
 =?utf-8?B?OUgxbmpOWWZhQmJGYXNNd0Rtbmw3dDI0UXVVNGllb1dzTVByRDFtcndqczhU?=
 =?utf-8?B?allmYld6VkV6ZStCbFlUZnZkZWdTTUtaU2lObXBKdjg1Z1Jhb1EvZ3JrM2dI?=
 =?utf-8?B?NkRZeFQ1N1NCTkIrOW1tUHF5UEhmWWs5ZmpGN3V5TWN6b3ZBUnZ6NWI0ejNa?=
 =?utf-8?B?Ykkxa3hMRkRvNnBkQ1JxbXJiSm9GWllib3R2TXgzS0R6TFFDTzNPOHRyMlVw?=
 =?utf-8?B?MzRkOHpOaVZsczNXckJ6Qi9iVFlvU3BuOTdQYVV1M2dxaDV1c3h1K2dZQTl2?=
 =?utf-8?B?eU1uaXpTMjFIekFmNFpWVGRpcEJDNzZzN0d3WmFKSDBUTVlieG54dXloWFhm?=
 =?utf-8?B?M1RHK3FGTXdURnNyUXluWDF2bkpEVWdwaXJ3cmlPRGFjTjF4SlAwMWV5ZVFr?=
 =?utf-8?B?MEJjMUtFSk5hb1JZK2wweXN6Vml2Q3NqdjYzV2tvWVpRQytHeE1XTmRGb3Jz?=
 =?utf-8?Q?GzxuFSfM1mJFhQ7/ePmxyGtPb3+rwjlUfYN2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejhSTEszMW1Nc2UyRzdMOC92UzZUUVFMWEd6b0xBSlVKRjdNYWxERkU0Mi9y?=
 =?utf-8?B?N0swa2dqelN1eDVyWnVVL0tIeUlNNWpweDJiZFh2U3BBR1N0b0dVVTNDVUMz?=
 =?utf-8?B?S2txZ3NFcUc2R2RHUTBUd2xRS2tMUHFiaGsxY2dkUVU2UUxvRVlpb1NVTE9n?=
 =?utf-8?B?Ym5LUGlYcHUraFhKSzEyYlRBK2ZieU9mT1NHL1ppWDF4b0hSWklETi9tRUFV?=
 =?utf-8?B?dFdURzhyck1PWWhHTWFHdm1tRmdxSjMrUmsralNMUTFnQUcyQ2xWV2lua0JS?=
 =?utf-8?B?VXQ0TitUWTA4aUlhYWM3VlBzNXl4SkdFdzZQZkVEUXJZb21BNEYzZ040dHp5?=
 =?utf-8?B?MUdMNmtJTTVDdTliMjlQN04rQ2tmLytzTE5GRXU2bTY3dTlCZG1laXJoK0Ix?=
 =?utf-8?B?bHlZQk9VbW5oeXJWa2pISnlLZitiZ2xqMGJmdUNQaHh4SnZvSmtKdUduRm5R?=
 =?utf-8?B?NFF2NFg0ejM0OEo1R1NuTHJtTlE4TkdrY2ZnWnVIeGt4b21CTXk2MmVER0hX?=
 =?utf-8?B?cmZrbmJ3ekdJUEFVMzBUaHMwWEFabHVuU0tLdk5zdkxTcHZQb1p6QWppaHJV?=
 =?utf-8?B?US9pOHFUT3U3OThxZ2ZKa0tOQ0llRUxyazRaZGxxdHRmQkxFVVBYaXlPTjBN?=
 =?utf-8?B?OUg5L2pScnlWWER5QmZ6eStzRThBMmJaVE84SjFkUXhsQkNyN2N2SVg1MGZr?=
 =?utf-8?B?cGNsS2J5cnpkOVdFVEkzUlF2T2tqTUNXM2lXNEhLODlkV0hHSEdPYkpHU2FC?=
 =?utf-8?B?aXlNdklMc1czMlNsZUJoSUFrcWdUZ0lyOHp3Vm9JVFRyYmswQzl5emFwbE9o?=
 =?utf-8?B?VFlCaE5yTEZFby9RSFhTUDF1YlNQUFc3VnBscU1hWDk3WitLTlNHRU1lS3hL?=
 =?utf-8?B?UC93Yy9FZ25NYUd5WVlhZDBnY25Xb3U3QnUyYTdXUHpUWVJkZisvc2RySDVG?=
 =?utf-8?B?QlFTNDhmamFVQlZmM1ZyeFhSYm5Xa1hXUGcrMFhqNHYzeWZPb3ZpclAxOHpy?=
 =?utf-8?B?S0FKUEJoWi8yUGFOakdybXVlM3pHNWRnLzRoMk1vWE9Bbm1CTHM0SUtCanZp?=
 =?utf-8?B?MnFVUEtncDJrVHU1QWFaK1NNd2RuVXdPSEw4SDMwZEN1Z0t5aC9vK1NJakND?=
 =?utf-8?B?d3hKZzhGK3M1OEllVmRtVlpFbnZ6a3NBQ2tiYTg3UTIzN3gvcXNGTVAzOUFE?=
 =?utf-8?B?OVNrcW8vTWtWN2ZuZG1QSjVFVEhXa0hJUnlvR3U0UVpuMmxIR1hPNjRUNnBt?=
 =?utf-8?B?L21wRTJBRXhxYnJUYkV1MlJWcVI2aGFWUmdyV24yTVgwVy9tRzhRVkhRb0xT?=
 =?utf-8?B?aE9sNDdUcDFWK2FIR0lIQm5malFzUEdhcWNESHk2SkFIS1AxVkVUZDhydDlm?=
 =?utf-8?B?V0ZVZmpTNE5iU0RUdzhVMFFVVFMyUzhGbzU0T1ZtZnlhK1QyemxocjFUOFJx?=
 =?utf-8?B?ZVdoUkNlWFNTV0laMU95QklPWXlqa2s5NnZkL0VxZUpJS0pNSWRUbzMwdzV6?=
 =?utf-8?B?VWtWcVQ4cGpJSkJJRzl5QjNnWHdkeGt5ZFFsTERQckZYczhCaU5vOG04NlV6?=
 =?utf-8?B?TUVoRFIrVVV4WHJiYWwyaTFhSWN0OCtOSHRFZnZpREhrbUdicCs0ejJRTm1G?=
 =?utf-8?B?SWhjTTdvS3NhWVlMSHBqTDEwUnNYNDhuWjVWalU3cmVEWVBCRTRpK3pKd3Nk?=
 =?utf-8?B?cjl2eXRYQ1cyNSt3aDNORk1OdlVCZVpqb1R6akdjei83eERwMXdlb1ZsV0dI?=
 =?utf-8?B?UWFQRnJSWENVWmZuYy8zYUdTU3lkMTQ0L1N4NFA0d3l2VC9pZ1RiVUkrUUpT?=
 =?utf-8?B?VG10K3hGWDNldi9XWEJKNCtkckZtUEViKzh6VUJmME1qZWc0RmV5V1c2SzA0?=
 =?utf-8?B?b1pFck1PV01LbFVDUFNyZmp6SWZYR2g5WUZYanFkRGNQVFd2NnkzVWJFZjk0?=
 =?utf-8?B?Vk9Pd3ovLzQvMTFOTGVsWUpGeDlPN25BelY5TW5aSS9Bb3Fjd3BjWEZSd2tn?=
 =?utf-8?B?N2J5b0ZRdUcrRDFVcTdlOFcwVloxSkZoVTRua1FDSHhweXRFUWZlMklaajZF?=
 =?utf-8?B?Rm1MdEJzMk1PUGliU3o4TVlTM2lYSm5XME11cHZNbjNpSFhuWXB2ajdvWVNL?=
 =?utf-8?B?NVVhcFo0bHVXUjBJTmJTeTN2MmxJcGcwbHpubDNOV013bzNmMTFjOFdveXVS?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da3dc3b7-4f46-4361-a78b-08dd99b4f4ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:47:44.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1MP3OGP+ecfCbuJDkINM2H6w1eAUHbE8fYOfmJqN3SF7dtYnxr7j7D9HSveXcy1MwrRiiqkC/OdDrxq0wtTN+58kNeHRUkYS1Pkd6c9C+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> Introduce the interface to display the assignment states for each group
> when mbm_cntr_assign mode is enabled.
> 
> The list is displayed in the following format:
> <Event configuration>:<Domain id>=<Assignment type>

Should this just be <Event>? The information is just the event name, not
its configuration that will be in the "event_filter" file.

> 
> Event configuration: A valid event configuration listed in the
> /sys/fs/resctrl/info/L3_MON/counter_configs directory.
> 
> Domain ID: A valid domain ID number.
> 
> The assignment type can be one of the following:
> 
> _ : No event configuration assigned
> 
> e : Event configuration assigned in exclusive mode
> 
> Example:
> $cd /sys/fs/resctrl
> $cat mbm_L3_assignments
> mbm_total_bytes:0=e;1=e
> mbm_local_bytes:0=e;1=e
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Changelog update.
>      Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.
> 
> v12: New patch:
>      Assignment interface moved inside the group based the discussion
>      https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
> ---
>  Documentation/filesystems/resctrl.rst | 28 +++++++++++++++
>  fs/resctrl/monitor.c                  |  1 +
>  fs/resctrl/rdtgroup.c                 | 52 +++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 356f1f918a86..2350c1f21f4e 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -504,6 +504,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>  	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
>  	event.
>  
> +"mbm_L3_assignments":
> +	This interface file is created when the mbm_cntr_assign mode is supported

"This interface file is created when" -> "Exists when mbm_cntr_assign mode is supported"?

> +	and shows the assignment status for each group.

This doc is in the portion documenting files in monitor groups. So rather:
"the assignment status for each group" -> "the counter assignment status for the MON group"?

> +
> +	The assignment list is displayed in the following format:
> +
> +	<Event configuration>:<Domain id>=<Assignment type>

<Event configuration> -> <Event>

> +
> +	Event configuration: A valid event configuration listed in the

"A valid event in the /sys/fs/resctrl/info/L3_MON/event_configs directory"

> +	/sys/fs/resctrl/info/L3_MON/counter_configs directory.
> +
> +	Domain ID: A valid domain ID number.

"A valid domain ID"

> +
> +	Assignment types:
> +
> +	_ : No event configuration assigned

hmmm ... since the line has event as first field, would this not reflect the
counter? That is "No counter assigned"

> +
> +	e : Event configuration assigned in exclusive mode

"Counter assigned exclusively"? (with exclusive defined somewhere)

> +
> +	Example:
> +	To list the assignment states for the default group.

"the counter assignment states"?

> +	::
> +
> +	  # cd /sys/fs/resctrl
> +	  # cat mbm_L3_assignments
> +	    mbm_total_bytes:0=e;1=e
> +	    mbm_local_bytes:0=e;1=e
> +
>  Resource allocation rules
>  -------------------------
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 5f6c4b662f3b..b982540ce4e3 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -935,6 +935,7 @@ int resctrl_mon_resource_init(void)
>  		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>  		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
>  					 RFTYPE_RES_CACHE);
> +		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
>  	}
>  
>  	return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 931ea355f159..8d970b99bbbd 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2080,6 +2080,52 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct rdt_mon_domain *d;
> +	struct rdtgroup *rdtgrp;
> +	struct mon_evt *mevt;
> +	int ret = 0;
> +	bool sep;
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +	if (!rdtgrp)
> +		return -ENOENT;

Missing a rdtgroup_kn_unlock()?

> +
> +	rdt_last_cmd_clear();
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode not enabled\n");
> +		ret = -ENOENT;
> +		goto assign_out;

grep goto fs/resctrl/rdtgroup.c

> +	}
> +
> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {

can use for_each_mbm_event() and then below will not be needed?

> +		if (mevt->mbm_mode != MBM_MODE_ASSIGN)
> +			continue;
> +
> +		sep = false;
> +		seq_printf(s, "%s:", mevt->name);
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			if (sep)
> +				seq_putc(s, ';');
> +
> +			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
> +				seq_printf(s, "%d=e", d->hdr.id);
> +			else
> +				seq_printf(s, "%d=_", d->hdr.id);
> +
> +			sep = true;
> +		}
> +		seq_putc(s, '\n');
> +	}
> +
> +assign_out:
> +	rdtgroup_kn_unlock(of->kn);
> +
> +	return ret;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2218,6 +2264,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= event_filter_show,
>  		.write		= event_filter_write,
>  	},
> +	{
> +		.name		= "mbm_L3_assignments",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= mbm_L3_assignments_show,
> +	},
>  	{
>  		.name		= "mbm_assign_mode",
>  		.mode		= 0444,

Reinette
