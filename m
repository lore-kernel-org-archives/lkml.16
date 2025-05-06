Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E573280032;
	Tue,  6 May 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538175; cv=fail; b=FJpcll6R2Bk87UKHaN+nzlssJ6C8lsuTnH5x/IRAcMAh7ZuWRuC5MU98HuICgw3e2j7JETQPCpJ0YWAH+l/vCbw0CZSTZ1quSvjTtihz8RvBvO7QvAydQoBz0zkypJSwQCkzdmINcIil2nYG7RMSy4O3aSWKVW4VmnQc4QosPR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538175; c=relaxed/simple;
	bh=mPdc5nSQvfHazVyGgc/H5PFQFL3C/YN/AT152isN9MU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C+Th/u/sH4Lu7tgQNj/5j94YSde0CSh/aI6isZIfJAH+99yixRXs0Dg/Ia9X5c7ESMbDeuY30BwJUDEixGfVNI0+fp2CJXpvI9NGou3McMcZTrPnvvFSgrPBMARQfuZtbKmNrlW28cv53Trt/1ZdnjvPfYXV2H3OA5VdaE+I1a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JQXu34rf; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JQXu34rf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvlplRlUotPUyW37BnaukFVbbXyR9e+VnyMhBjdbg4rCi58rRjexc5r6atefBz2Qe46+R8o+lVGVSU2uFh2vEC1faR66dFlkFbrDP4zwW0q44TbBPBiaFxmtWZZwBNxfcNGyFdfnfukj6Gk1U3rwmHMCGKh8hlLvkvmDaqwxR/Vunlt9lNMfMfkNwbIQKKXSGVnimpA0/8jlOvQ5FdvVvWbHiYjX3RI9fOQG7H9ND4lUDn5XUSaVRZ0IAspoHnCZkbZAgMFIePp9Dpwnvtl/plSgl7su+SiK1tvVU5SHkBAcUukBKeyFcAK+CbwCItLtzr9u/v27ajwLh1HVQqAqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW+iqn/vYHlRCOj5EGhKthH48l1AXS7K3uLFAnNRwbk=;
 b=Q23eMgJwv9lufF/bxR5o5QIknM5CHVtcfj3qXo/XScxHjWG4q2UPMt4488pt1/KtDag/aNkPlpRJR4hDQpswbldkcdorU1h9uPpTwKD3a4sIt0KadTHaq+CiJ/Ovnb5dFiV2BwSrSmBv+I/LiWv1LrBV8buypwjI20o5xJnPWVemXmwS18ijMhLl8Hk833rB6Srw4k4t1Qd4jtvHtssU4J33ybs0H1MF0KLVCDZc+Y5oHR/h9Y/g5XwBJphw1RiBZXRXdccSGcM2BCFnz0Bg+eR7UnNGrOEHlMqlJr8IKFJ7NxM1UweaLB20tHCHB4lxAw9MaFSeM3sSztmVqvR4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW+iqn/vYHlRCOj5EGhKthH48l1AXS7K3uLFAnNRwbk=;
 b=JQXu34rf+fiaxBxMFVlikI2Tt8snCRjfhytfrMItCdCvj55PIsSFeSqZaWnDZOgpX69IbqpBrHoAlxD+L3jL5fzHwpFyWbvjIcWnmaCoPQvyFR7fMhUkMcpUMPndYAY8R3IP8xH+Xhs5Cqq/K+nFalAY2H/tVWQlCFJ21ZYFHVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:29:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 13:29:25 +0000
Message-ID: <f7200e0f-d6d5-4fb8-9701-3f97d1ab64fa@amd.com>
Date: Tue, 6 May 2025 08:29:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Declare quirk_spurious_8042 for
 MECHREVO Wujie 14XA (GX4HRXL)
To: Runhua He <hua@aosc.io>, platform-driver-x86@vger.kernel.org
Cc: Rong Zhang <i@rong.moe>, Mingcong Bai <jeffbai@aosc.io>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Xinhui Yang <cyan@cyano.uk>,
 Yemu Lu <prcups@krgm.moe>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250506112514.446784-1-hua@aosc.io>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250506112514.446784-1-hua@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: dae5c8de-5237-48aa-207a-08dd8ca204bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEpnRDlFRWxNQi93cWxHVldpMzMxeG54Q2U5em9LZWdzKy9LWFJhUG1jQ040?=
 =?utf-8?B?QVkvc1NMdVhUWmhCZmk3eXlEd29HdTRaVkJlZDdTckJsUXBkaVk1bVB4SUti?=
 =?utf-8?B?d2FFVDZ6UUIydEtaUlBPbXdLc05iK1hTM0ZYUFZJZ2dySHliaGFnUTkxakU3?=
 =?utf-8?B?cXFaT29EajdNZVFvM09ha2FHd1l5a3g5TDlPZFdOai9nc3liUTJXeStUQW9h?=
 =?utf-8?B?NlZBZHRNN2xWZTkrMitOcWxwelF2eDZkZndkUThZQzlQeHloSWdybU8rNEJw?=
 =?utf-8?B?M1cvRWhmc2NHUVFvci9iTEtQQ2xXU3lsZTdHc05Gb2hpdUtFMzM1dUNWVlhu?=
 =?utf-8?B?aFRXYnZvQnpjUFpMMytNTU1HRGtZd243M09qSkhLNmNsU2UvR3B3R1pMamQv?=
 =?utf-8?B?cVdmaDBZOFhOMW1ES0U0dXEzWWJoMExrUlNOZEVmQWZQeGg4VWRrUFZpRFV4?=
 =?utf-8?B?alR4Ti8zekVQQUcydUhWVGRKclRtZlhhcUhRY3JyTG1ZazJJeU9ERlBnWGgx?=
 =?utf-8?B?MEd2a0xQd3p5NGVRV1JQc3d5WnZ1bXNJVEtUdGpsSng1K29LYjI2WllOVldK?=
 =?utf-8?B?MG4vK3BHcjBRNndYTXhlLzFkeWdLNXNCTG5jWEhuL2gvUW4yVGw0MHlkVzY0?=
 =?utf-8?B?aXJiQ2l6dHBJYmhTNjNqakVqV3FhT3JjUVVWWjV1dk9vaHZuL2xtS2FtVVdH?=
 =?utf-8?B?TmtXS3lmSlM3SEtESVcrM0hmeFpaUENzc3djemZEVXVrMk1mVnozTExXdkgv?=
 =?utf-8?B?N3RLc0xueUE2N2NKR01sZ1lBTDVITUVWQ0RYZkVjV3lIQUpLVzNDS3ZsQVhV?=
 =?utf-8?B?VjdnaTViK0JtQWZkemkzcldjUlNWQUFSNzlJdnVDRmtLVzZBMWdVNU8xdlBR?=
 =?utf-8?B?czlHYjBBVmFRcDYranFyLzVBQ0tmUHRWeGQxMyt1UXhGRW42eWZpeVhMUmJQ?=
 =?utf-8?B?akZIUEdtNThmUG9vUVJOZGd6ZWs2OUg1YVUxbmsyNWM1VVRHMzYxbUdqbTVK?=
 =?utf-8?B?VHk2MDhQMWVvWFZKUGpOa1NnVnA4RHhWSTFoZXhhdEUzczRZcEJJemErelhY?=
 =?utf-8?B?N1UxbHZnVjVKNzZXNktIK24za1p6enVuU3UwdUdKakFhcC9BWUNjYjNPWDl4?=
 =?utf-8?B?aHFuV09tSTdqMDE4NEdMWFBIQmdobmhsSXM1MU9FMzFqTElhWmhFUVdZdW5v?=
 =?utf-8?B?Y0JtYVAxeVNpT3h3Qm5xNUwxNmtCYVMxOXlodml2RFA5cmRzU3B1aHV3cS9L?=
 =?utf-8?B?NkorRTI3VkkrK0o3eU5JQlNIQ3pxUmhqQmtsNW5BMk0wZXZiN1FlNTBXTVBM?=
 =?utf-8?B?M3BpSllvL0RtUDlsNExzblRxSEtrTXpnVzY0dVlXUnhwZm1vaFhrelF4RXQ2?=
 =?utf-8?B?VE5jNVM5eG54TDBjVHR1UGhsTnNZNkNRK1hSalJLejJYemZScFR5TTR5NXBC?=
 =?utf-8?B?Q0JTc2VwbXhscjUxWThLY1VTUGNHSWVhRUVOREVFVEptWFV1UzhRUmhwTkkx?=
 =?utf-8?B?ZTlXcmJldmRaVmtBcnlSbStzNmdJd3JkbkltSm1zZWQ5TCtoMlk2S0VDNC9u?=
 =?utf-8?B?Rk5pdENmUWJVcG5IUnl1c2V1NWd1dFRmQmlXbExDOWVnaGJGeUowYzU4cnpx?=
 =?utf-8?B?SXVGTmphRXFYSmZYaEJIaEtad2MyNG15TkdLVjhzYnQ1NExNKzFEOVEybzQ2?=
 =?utf-8?B?SDVBcVVHekFTaUZzY3c3VHl1TVpsVXdDRTlETlB4eE4vSG1CMFN2VnNOVkRm?=
 =?utf-8?B?WXF1ZzZ1a3kyalJFcEdTTDBoNUFpeHdVNjFXNElQQmJHRTZ4ZFF5WWFxUFl0?=
 =?utf-8?Q?UVDzCgHA5H/5LSXaCT0ot1znwyoHaigx9zfaI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEVKUXFseHV1a2lZSHlGTlY4bDBjMHdKYmRJYVB4TzByZWJqSkV1L2NZWHNN?=
 =?utf-8?B?VVU3TExCNVZuOXJlUElKSkxyU25PSGRxdFovd1Vzd2E2VDJDV29XVUdMbjd0?=
 =?utf-8?B?SXkyMmh1MHpHclF0dldwSXkxOTVnS1V4cjZzN3pZY0ZBRlpYRk5mcjNDN1JY?=
 =?utf-8?B?UTlnbUZJVVNERkpqUWJjSGY5QzVmUXlQYU1ZTGpwRm51OW90VlE1U2xHbXhS?=
 =?utf-8?B?TkxDeVNxSUVGTXBiN3B6dlM2WTdPTmxOZVQwMG1USE1GSys4ejJoT0lxbDdE?=
 =?utf-8?B?MHJVanNXOWpKallkTFR6VWJwRFMrSWh0L0lHam9yeDgvbStwV3ZDajY5Q1M1?=
 =?utf-8?B?MVhVS3ZZeUEwODBwTUNSM1FDUWp4bU8yZUlTTG1UVWRsVWNlWEYzTzlXOXRR?=
 =?utf-8?B?b1lzQ2g0S3FKSGdPemQ2a0RPS3kxYU5QcTN4aXNJL3h2QnZEakRIbzdzR0hC?=
 =?utf-8?B?ekYxUnJ6eWlDbS9ZR1A1c1lFQ29LVVNlQWQ3U2hxQ1BwNEU5NStFUEp2UFJ2?=
 =?utf-8?B?ZmxZbkxwckpzTjdYeWs0NHNmZTl3YmZsT3dJaXkwK3JxK2F0bDc0Y3hidDFM?=
 =?utf-8?B?Q0pldlNJTHdVV3hvYzcxOHZ1U0IzSDVsMFp1MGxQOU1UcmpML2ZranBoR051?=
 =?utf-8?B?ZlpscE1ML2R3R3Ryb3BtM21sRDNQUGNkVFhjYnZxTTV5Z0ZJc3ZQM3VrYkhV?=
 =?utf-8?B?czJiUmJqVmlkN2FOVWIvckh5WmY0OVJ2QXRFNjl1S3dkOTZQcmRCZ2o5dkxZ?=
 =?utf-8?B?bFovMlo0Tm1KaExJc0d1VUVDZTMxS0Jid3JtVjE2Tm9zcFdybmtoSG1lL1dI?=
 =?utf-8?B?NU1Lc09Ta3ZNaVNveG5PS2JPc09tZTlqZlY2bFpMMjlhWExsMUU3eVpZSjBr?=
 =?utf-8?B?NGxqNW5WUnN2NDZyempGMU9nbnNDVE8yb2wrVXg3TEtNenI2UTNFRDA5WmxX?=
 =?utf-8?B?a01uL1hlUnEzMko0cnMrZTNBSjVML0w0aXk4VkFBSVE4a2EwTTR0bkc1Q21S?=
 =?utf-8?B?Q2R5ODNpSzJhb05DRWowSktjL0NPQzg1RkQ0NTRLRm0zZTFXOXZ0ckhSSEpt?=
 =?utf-8?B?TmlBUEZJRWJlVC9qZjlhR3RRcU13Z3BlQW9JOWxYMWpNdTROR3FBcEw5QS9p?=
 =?utf-8?B?UUtqMlgrN3JJVXE1ZURORUl0dW9lWDc4UWRkNWhSUWpIUXBNSGZ2TkovY2Zp?=
 =?utf-8?B?ZkFLYWNPUDd0Sklqc3hoc0lyWnFvVklHb1ZPMU9ybkpnR05TaUNyN1VKZDVF?=
 =?utf-8?B?RjE2Um1nbEtZbEVpYkduNkZJTUp2b2JqbmV5bUZNcVpyZHNSYnJUOTMzR09U?=
 =?utf-8?B?WndlUGZnYnIyd0FwVzhEc0Y1NG03SWVsRjBoZGl1YjJwSGVsUG1vRzJuZWlp?=
 =?utf-8?B?RzF2Z09yWHZnN1phdUNRRTQ1ZXU3cDRPOGdIaTdVV3RKNWRJNkRKVW5WS245?=
 =?utf-8?B?NER3QWZzdEZ0NG1aTldiT0lNbVY3a1RhMFp3Q1NvdmZqQmR0cVJ6T1FkVGlJ?=
 =?utf-8?B?endwTjZKTUdsRE55akRCVWxLR1l3RHZxM3JUMitVQjhPRGxQd1RROTliR3dT?=
 =?utf-8?B?UjFQMXgvNytNcmg5MytDcTdZQnN5cHJqSjNEY0VoZlRVcEhlTkN5T2llTnhI?=
 =?utf-8?B?WndNUnBxQk9rZUNUTE4yWmhwZDhGd2hyOFNrTDFTcjNYL0lQeCtSK3c1cDVT?=
 =?utf-8?B?LzY5ZnJueTdET3B3L3pWTWV4NzdIZ1VlcGxYMk9qaGc4Vm1maWRVd3JwKzBU?=
 =?utf-8?B?djIrU05oSk8xcndxbHpVOUJDaURNNm53T2FJcCs1ZnNHTVRqOHRLaWJLc0VD?=
 =?utf-8?B?YVNJU0VUeWhiM0pEc0ZMejM3a21aQjYxdWlNS3pySGp6bmpVYk9uZFdxaDU0?=
 =?utf-8?B?cjROd3kwdzdyb29US0tJaHhUYlEremNTRHVUQ1RKU1lGdXJ4UVBnTFNRVG9R?=
 =?utf-8?B?ZVFTUzJMRE0vbnJVbTdUb3FSeXh3bjR4dTNlaHlQTElvT1hKQUhqMG5qYnFu?=
 =?utf-8?B?U2JXZ1paS3BPWFRKODBiSTZaeWF1RHhZUWtobVpWNkJDbElZdU9HSVExZ095?=
 =?utf-8?B?R3VpOUNCQUxhT2h0MUFIb0JzemdtQytKcTJpU2gydURwMEFFVnowcVhkMDFN?=
 =?utf-8?Q?I4IHTUJ570QBpr2EoYr62qEMu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae5c8de-5237-48aa-207a-08dd8ca204bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:29:25.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3Kw9eV/A0Zicq5Vy1FJp1hDxJk6Z6WXgSTsFvLuSqn5HnWyuAOBY7xHWeX+CQdCsyGJdrreIQ/ji6OII15whQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501

On 5/6/2025 6:25 AM, Runhua He wrote:
> MECHREVO Wujie 14XA (GX4HRXL) wakes up immediately after s2idle entry.
> This happens regardless of whether the laptop is plugged into AC power,
> or whether any peripheral is plugged into the laptop.
> 
> Similar to commit a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard
> wakeup on AMD Framework 13"), the MECHREVO Wujie 14XA wakes up almost
> instantly after s2idle suspend entry (IRQ1 is the keyboard):
> 
> 2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 9
> 2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 1
> 
> Add this model to the spurious_8042 quirk to workaround this.
> 
> This patch does not affect the wake-up function of the built-in keyboard.
> Because the firmware of this machine adds an insurance for keyboard
> wake-up events, as it always triggers an additional IRQ 9 to wake up the
> system.
> 
> I have only matched the motherboard model, as the same chassis and
> motherboard (GX4HRXL) combination may be used under different product
> names.
> 
> Suggested-by: Mingcong Bai <jeffbai@aosc.io>
> Suggested-by: Xinhui Yang <cyan@cyano.uk>
> Suggested-by: Rong Zhang <i@rong.moe>
> Fixes: a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4166
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Link: https://zhuanldan.zhihu.com/p/730538041
> Tested-by: Yemu Lu <prcups@krgm.moe>
> Signed-off-by: Runhua He <hua@aosc.io>
> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index b4f49720c87f..e01012d5ecd0 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
>   		}
>   	},
> +	{
> +		.ident = "MECHREVO Wujie 14 Series (GX4HRXL)",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GX4HRXL"),

This feels like it might be too wide.  Could we match a system vendor as 
well?

