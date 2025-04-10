Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590F1754B;
	Thu, 10 Apr 2025 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246732; cv=fail; b=gvjMq+hyHmrgGw6OKmd8mW4v2bv9EhHsqbsrc4cFRy0PHmsqqKlgVDp1Sbf6qJGl1I0X2kvMzcsVTadn2QiTp0XxR+PSGl3aU2jRsJRIinbRJWUTCta2VD0XMTuFTzNAWKT/RTMB2c72Ow0rgGS61HS3lX6s25DZ1PNFTx7xYjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246732; c=relaxed/simple;
	bh=MXdExGWoMjNFwbe5fkOn66FWfGwLbb3vL9lPpAIYb4E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uQywqGTJhlJsHNvFTJMAxDr9ttKWWESypp8bWYCaOHuo6euYtLmzeOVMk07BM7Uy6J1mlTrGEc6sw992F7NOwDwVzN5NvO/tV/zs0Eh9O8jBeoCWUYDRaaUkxAk/DkT0MpwRQ+epga+4nLigBUjHt3OabMS+C12ALjyMfYXwWyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZCnB1SEG; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZCnB1SEG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPjGhCzfkrASLw+KMVFAz0CFj3QZznYYwJhW+mIQKzrfV5hu4UxUaiKyl+vOhLdFD82Pffj3rGnBqXp6tJL+3Cvr/0BpSlXl10WifthrhvDzKglKOYpjMy61qOW0pTFunDC9h7j0JXndDqNzXEtXz/d180CGVu8EVkLfZGEsg7P3ClI8K8a9TBQaC4v8i9M82Tu2c9mRnwjTG4ie6Zal4X4DP2xEpBC4a9y7t3bOVT4NsLd4/8MsNE30zADvWoEG8HolcYZjCy9gDCBJWZG/SWlUcg251khVJCXZnpC16QjFny/tWEr8ocPmrVete+vbT45U7xbdTcjPemc5KA96fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOquSQ7Eqwj/nAcirJKoiU4pNV4GZ2XCjfjogdRGR3M=;
 b=vjmMJrM7Qu6SXroRGYoeNOX05JeGJRBQiacGFCOGmJYRfSmFRqMXVQmbaGu2qWlE6WTowRexjyFYH7D/CAnmCAh8FLHIgwdQT/jpnhRCIgxyalCI3s3egsxQBauhcE2PJF/xQRpUIY0HCVi0mVjmOr6JLf1UnyAhYB+pwSqDIreXnTN6bx5kNYNh4uBOAFsb/wogkjfRGhelrYqE7wGpWHFu5gAmVqByAdV9drKIXzSjtSpnT/SBLiNR3wdgUUIgid5lV6ktpfqfWkRfOjs0Wu9GkYKOY8AY6HKjpFvOcJv9HAN2ciWak7J0wftL9ya7O3L2xFe91I2z259ixNclYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOquSQ7Eqwj/nAcirJKoiU4pNV4GZ2XCjfjogdRGR3M=;
 b=ZCnB1SEGjRU7n1av3wFQsJ58VhX52x0xvpdcupsJTGsSBl6HXaU7LRvSWPxkFH4svCnc27twnDgZrBpp8mSvu1NCdY3SxlVlZFORHe5l9dqjhcBJX0NfPhoX1E80+pEpmXQTaLWJCg/R5MPTYGBn6bylcbRAme+6vwlnac/Dx0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BN7PPF48E601ED5.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 00:58:47 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 00:58:47 +0000
Message-ID: <f16697d8-be6b-4dd2-b0dc-3c628fc4eec6@amd.com>
Date: Wed, 9 Apr 2025 19:58:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
 <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
 <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
 <5ece1b6b-a225-4fab-be74-b48037986686@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <5ece1b6b-a225-4fab-be74-b48037986686@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BN7PPF48E601ED5:EE_
X-MS-Office365-Filtering-Correlation-Id: c298e45d-44ab-4e22-9c97-08dd77cad944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0Y3ZER0QkNTZ01yZ2gzcVJuR0U2MkhqYVJYdGI0Q1IvT1VDRlJZYmQyTWJs?=
 =?utf-8?B?aDdmaUQ3VktqYVFGWHEzREMxN2dQcnlHQm9nWVNWRk9MdWZMNWVGblJJSi8r?=
 =?utf-8?B?TDZ5QTZ4d200L1BIMjl6bWVVSnFyRUtMWlEyeEFLbFp3ZXdQS0RCbzNWYTRa?=
 =?utf-8?B?RUNVdDRpSTJmVlU5RUprWE9RZWJldnMxSnZtTko5T0lPeHdDMUtDbmhrYkU1?=
 =?utf-8?B?T1ZHMmsrNVA3N05sQnV3OTFESE85VnI5aXo3TXJJUXJDOVNpdUVTV1hDU0VT?=
 =?utf-8?B?UGpnQXp5US9yRktrTU9hQkpoaWc1Q3pLTGlpT0Z5S2VienNZUGZFWnlXM0ZD?=
 =?utf-8?B?OFZSckRoSnFlWjBwNWorcUNHcnVUcFpZVDVZN2NQdHZTU3FhRVZyOWdQaFJu?=
 =?utf-8?B?eDh2d3FQZWllb2lFS21rRnYzSFJzWGNRcDNtejU0V3YzSC9IaEZrMk5IZVZY?=
 =?utf-8?B?T1IybXNrbTdnWnJmTHlDemlwWEJlVCszMWlCVWxFV1ZRVXVvVjFRNG5XUEV3?=
 =?utf-8?B?OW5FWmdlb3d1Qm45VERMajRHT2poRlQyWnRCTCtUK3FoTXBkRTU4aVlyYWo1?=
 =?utf-8?B?cHMvbXowbDB3RXVmbnJBYjNQbmxGMTV3eTd1NVpZc3ZURGpWRnRxL2ZWS3Bt?=
 =?utf-8?B?cGZDT0tCaGsxREs2YkRoUGhYNVYwUWhRempRVk52cWs4Um9NckVWR2VESXVC?=
 =?utf-8?B?aE8ydG5WZ2tiZC9JbnpDVjBLRUVENGNoeDJSVm14N25oNjNPNjZ4UTI2M3pS?=
 =?utf-8?B?ZW42VzRFakttcGM5UVhnQ3RrMlBPaGo2N3NMOWhWbU5UdVJnNlI5YlRzb2Q3?=
 =?utf-8?B?QnBQdHRNdTNLS2tQd3drUVF2Y0VMZ2owR3FIQVgyU1pVdDV6VUxpdTRpQUZ5?=
 =?utf-8?B?R296R1JhNFFSZ0RNUlVyTit0ci9waWxETzRJT1RtZzFENWxFK01lUFRpRlMz?=
 =?utf-8?B?c1VjUnI5WmRWQjBFRVR1RkRhbHFCcGV2Szl3THUxK1RNT1lza1g0SmNkZ3V0?=
 =?utf-8?B?TE50ZElSWHk3QVVTem1BS1E1dzNjUGVtSVl1d1F5YzJQNHRWQUJKNFc0VXN6?=
 =?utf-8?B?TlJwY3Ryb1krRHNrMzcyNnZHTjZWR2xpMlN0THRIS05MOHpsYkxucGE5b0NY?=
 =?utf-8?B?WGlqd1NsQ0FlSGRpQjNCYVc4dis5WmhxM0dEa3QwcDczNkIzKzl1R1B6TGpk?=
 =?utf-8?B?TExhdUdoZEJwcmtIV3Rlb1dvTWhBNjIrdVNsNDBiSjRvaktvWFNYOElnWis2?=
 =?utf-8?B?S2w2SVJpNFljeFBKQ0JvR0dyVWYzcGh6QytGWVU5YkUzVVY4dUFTSWZ2MW5k?=
 =?utf-8?B?QjVOa2YwSFNXRmE4N0pvTjRPbGJ0cnlqc2thN003bEQycXN3c1JVVXJ4d1hD?=
 =?utf-8?B?L1pHOTJ6ZktkaS80OWNYNE1PNzA1d2NVK25TeGhHQ3pMVmtnUEgxSHRubDRm?=
 =?utf-8?B?YklJdUp5MHFNMzNpT2lKaXRlOWtHWVU1aTNlNmJpN2hrcUFuaFY0SVAxTlJP?=
 =?utf-8?B?eUZJN3pVN0FvUXdhbTZ4WDRWL1k3eDg4c0NTUncwVGJVYkFudytlSGFxLzRT?=
 =?utf-8?B?V0ZneDV6R0hCdGd3UnFFUFlVQXNBYzZnNTlhZTR1M3hRSFM5SnVQckFYcE9T?=
 =?utf-8?B?TkNHTmtLU0d3WENNUzdrR3h4UzR2Q3ppRXVET1lyV3UzQkZJR0crN2ZVV3BD?=
 =?utf-8?B?dU83Zzc0Rk00QitYcWptamV3MkJqMmViMmVIcXM0eFk4WWlDRUw5VDdmeUNz?=
 =?utf-8?B?WjRTSTZzc3FZekMra3pYYVVGUXBUZW45WGErb3BCSHMvVjIrQ1BUc294dHJD?=
 =?utf-8?B?RnJHbHJ5QzZ1MUxEVDE3WTNXaGR6VC9KMUJ4VldnTS9Id1NRb3BNNHoreHFm?=
 =?utf-8?Q?gy4NohhRPWIgx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZ0NWxFUW84bnp3OE9ycVVYQnM2emgvMkszL2g1aVlEM0xRcVR0U0hVdXJa?=
 =?utf-8?B?c0I5cjJsYnc4ZlpxMy9xUHJSWGpOSWJNeDJnUzlFR3JETHNQV2wyTkw3SFV1?=
 =?utf-8?B?alZsRXQzZndRM1J5aXM3Vk1pUVlRQTRkQkMyQ21Ud2Nmd2ZMWE9ZMGlnc3kr?=
 =?utf-8?B?aVdabUg4RlpUdzEweVM3VU9pM2M2ejNWK0w4TG5SUTZUTFZVYTRGeEswWUd6?=
 =?utf-8?B?WHRKdWZsWFJKcmdwdnNqNXE1N3UxaDVodUtIc3RjM2RSVnY0STBPTFcveGNy?=
 =?utf-8?B?bTcwaERaa0R0aGE5QW9jM1dJcWIvcXRKbUtwMW5Ib1ZYRW14RDh2ZHVidVU0?=
 =?utf-8?B?alVLQlp4WWNWVFpwalVmTmpJb0JCN2gyR0UzSExRMjJXQ2dDYTl6SXpFeGtM?=
 =?utf-8?B?a1ZGeERmZEdhZFVMdGlYUmhwUWVkUC94c3puaTB1eHdOOFMyK01FaG9UUjE0?=
 =?utf-8?B?eVRXTnJOOHZoSDlzWGN6Q2FUVWhPVmJzUVp2UE9GT242cVNHMWJTaE96NDUz?=
 =?utf-8?B?dVZLdWJVMEhMNEh3SlBkaWQ1b3Fxb1hHRng3ZlN0TXhBZHUzRVhSTmJZSnZm?=
 =?utf-8?B?YTZvazliQWJ3TlB1YUxVdkJObGFkRGpPckRYWnRHSG5iKzYwZWRRdnZxa0x5?=
 =?utf-8?B?SkFaUnQ3THB0SmZmZHpJMzBTU0JEOTlTMzVOYmw2SXZEbGdyTlcwRlMvWkNH?=
 =?utf-8?B?c1F4VU11bjIvVTBIbjFLcmtRYWxDcjhLcTIzVFNxVFA0UUdvT3VCZ2pERHFX?=
 =?utf-8?B?bkJRbkhBaDhZREs2NWcva3QxRDhQSzN2Y2lMTjRIamNHa0VTd1lEWjl2MTMz?=
 =?utf-8?B?c3IzNEljd291cEN1WSt2N1ZmMjcrRTlrUkZoZmI4TW9RLzkyTTk2Tys1T3pv?=
 =?utf-8?B?eldOWmZUeVZGYXM3dDZCQmhYRWNoeTkvYTk5Z3JqTHBaYXZRUWFkc0xzQ3Y5?=
 =?utf-8?B?NmhTSTJwV1JJejJYeTJXUW9nSmNmbUVDcUpMUlhNM0l3bFVVajdnYXBLaGkv?=
 =?utf-8?B?M1VDR3FDUEd4WDJHRTgwVEQwdXBuWlZrbUgrRlVvNWM1ZEJnQWQ2azg1djNP?=
 =?utf-8?B?YnovSi8rZzlYVU9Nc1REWHlVNFI2dW10cHNvcnBySzdwTXBJYTB3WnJqYk14?=
 =?utf-8?B?OXFnL0xuOVUxcjNPL0p5eTF2WG53ektSWEJtcmZSOXJpSENFMXBtZGFNT3N2?=
 =?utf-8?B?bStIN0Y0bHJLVjJZSnBVdFdjTGQwY25RRHQ4aEZobWxBdHBhVmtnRDdTbTA2?=
 =?utf-8?B?S09iNTFMaTFidUlhaUxSZmFFYlM2azFqcVBsK3l1SDZIWFY0VW1pV09FanFD?=
 =?utf-8?B?Q2NWMzV4a3BmKy82WUVsQjhWakh0bTdEUEkxcWF2dmFrU3RRUkJtcHQ5WTZF?=
 =?utf-8?B?aUxFK1Q1MDFoVi9iV09YZjlNSGhLSDhPbG9pUHM3Z2wySHE4ekhUZTUwVDcx?=
 =?utf-8?B?VTJrek1DcjhvVTliTUcvaDNOSnNXTEdnQ250QlF1MEU5Tzd2Z3FtRXVXYWE1?=
 =?utf-8?B?SlBIZndVc1cyUnVPbjVrWjAvRHhKNlZvMkRvZUd4MG1yWHRsWGEvVzRUTFFC?=
 =?utf-8?B?YlZPUlhXQm9mNWlLTWVLSjZRUEJDWGRmR0FKL1FyM1Z4SmkwTUdOTDJwbGNv?=
 =?utf-8?B?VWxHa1V6dFloSk9YS25DUDlTMGhqbHI2T0s0K1RWeWUwaldWOXg2Vk9nSG5O?=
 =?utf-8?B?NUF0S2FwckNvY2xDZm9iUEpMb1JoSHNaR3doWmVqbG5JMzdZKzhvLzlQbkJP?=
 =?utf-8?B?VjIyQVdudTdZdElDRlNmTWIwcTE5TGdLY0V5UmdJM0Y3STNJSisrZytVSDNB?=
 =?utf-8?B?WWFxcVNQNGNJVWl3cXB5M3dVMUY1OWRJQ2p3SEhQOFk0dVJQSmcwd0lSM0JF?=
 =?utf-8?B?R29kSDBBK1NkWDRPcDVpK3kyR0dFWUptRGU0TnBtaE1tenRxeElRbTd1U3B5?=
 =?utf-8?B?SVNFMjdQS085L2xlZXMzN3JqbVBzdHBEOE5ldTJROUdEMjc1U0FCV2o2Q0Ex?=
 =?utf-8?B?R2xKTllZU3hkMlEvci9nWHFCeVBtVUdWWFFyWm5TR21neWQ1dzJLdXIzOEpj?=
 =?utf-8?B?dmEzWFh1bjhQcGJISlhNWnkzNmF2OVRlYTZONDNLbFdzUk5nWk00ZldKMGUz?=
 =?utf-8?Q?dvxc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c298e45d-44ab-4e22-9c97-08dd77cad944
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 00:58:47.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy2CY1nArY1DTGIMTAMJGdYExKRYhSEJn7u4YDRSgpyFzQCotVVue0UP+/TMMV0R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF48E601ED5

Hi Reinette,

On 4/8/2025 8:41 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/8/25 5:41 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/8/2025 4:44 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/7/25 1:12 PM, Moger, Babu wrote:
>>>> On 3/21/25 17:50, Reinette Chatre wrote:
>>>>> On 1/30/25 1:20 PM, Babu Moger wrote:
>>>
>>>
>>>>>>
>>>>>
>>>>> AMD also supports what is exposed to user space as "shareable_bits". According
>>>>> to APM:
>>>>>      Depending on the implementation, some portions of the L3 Cache may be
>>>>>      shared by other system functions or used for some other purpose not
>>>>>      under the control of the PQOS feature set. The L3 Cache Allocation
>>>>>      Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>>>>>      bitmask that represents portions of the L3 that may be shared by those
>>>>>      functions.
>>>>
>>>> Here is the complete text.
>>>>
>>>> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
>>>> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
>>>> the cache which may be shared with other system entities or used for some
>>>> other purpose not under the control of the QOS feature set. When software
>>>> sets a bit in one of the L3_MASK_n registers at the same bit positions a
>>>> bit in the L3ShareAllocMask, processors executing with the corresponding
>>>> COS will competitively share that portion of the cache with the other
>>>> function. If this mask is all 0’s, then there is no other entity in the
>>>> system competing with the processors for use of the L3 cache.
>>>>
>>>> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
>>>>
>>>>> Could you please include what (if any) the relationship is between the CBM
>>>>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of
>>>>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
>>>>
>>>> No. There is no relationship in here.
>>>>
>>>>>
>>>>> On the resctrl interface side the documentation currently states:
>>>>>
>>>>>      "shareable_bits":
>>>>>          Bitmask of shareable resource with other executing
>>>>>          entities (e.g. I/O). User can use this when
>>>>>          setting up exclusive cache partitions. Note that
>>>>>          some platforms support devices that have their
>>>>>          own settings for cache use which can over-ride
>>>>>          these bits.
>>>>>
>>>>> Even though this was originally used to expose the content of
>>>>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>>>>> seem to also apply to the "io_alloc" CBM also.
>>>>
>>>> It says "shared by other system functions or used for some other purpose
>>>> not under the control of the PQOS feature set".
>>>
>>> This is a quote from the AMD spec, not the resctrl user interface documentation.
>>>
>>> Please consider this from resctrl user interface perspective.
>>>
>>>>
>>>> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".
>>>
>>> When I read the resctrl user interface documentation for "shareable_bits" it
>>> sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
>>> shareable resource with other executing entities (e.g. I/O)" ... is this
>>> not exactly io_alloc?
>>
>> I agree the text is pretty generic. Actually, the whole bit mask (0xfffF) is shareable with io_alloc.
> 
> I think the value of "shareable_bits" presented to user space could be the
> actual io_alloc_cbm value. Thus, not the "possible IO bitmask" but the actual

Confused little bit here. The shareable_bits is resource property.
io_alloc_cbm is domain specific value. Not sure how to display it.

> value. This seems to be the best match of what "shareable_bits" represents, which
> is the region currently used by IO devices. This partners well with the "bit_usage"
> output, for example, "X" can be used to show which portions of cache are currently
> used by both software (via schemata of resource groups) and hardware (via io_alloc_cbm).

Haven't looked at this code much. Will look into it.
  >>
>> The 'shareable_bits' is coming from CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] which is always 0 on AMD systems.
>> It will be bit odd to manipulate these value. Not sure if we have to do it.
> 
> It is not clear to me what you mean with "manipulate". "shareable_bits" does currently
> come from the existing register but AMD now provides more interfaces with which this data
> can be obtained and it seems appropriate to use it.

Ok.

Thanks
Babu
