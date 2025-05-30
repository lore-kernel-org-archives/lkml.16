Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7DBAD5E;
	Fri, 30 May 2025 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748566522; cv=fail; b=jeM/FIvfbD+g89jq8akLDjBaQmks8tKNvXuDkYYnm5w8/SsNIqpzfeoOBNDttF6wE/bGQQGaakWeCGcrJdaFxiSbQgMIYX/WVCN/kv4ec6mRfikQJXcA9aJWdrPRhnPNRbsYHfIPYq33wuODXrNA6EHCnu4bL/jCAGKNQr9pTbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748566522; c=relaxed/simple;
	bh=k5LGyYYNq2pT7+sC9zjeT7lC2zNbZwv3lggAxl8eKEE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sba5PKVWtAscWSsGKjuGZgd6BCqSBmYsGfBwTicgSxH04/bM1HyghAVtRHJwOi0DQYk4tbCOuCDaSCDMM+05O2D2bm61tppjmIK3f/aSTAndq7kpdauYwhmSG+0JTMHSxSBTgGp/rpG2PYvvZSevyUYOM3BkdUUuoqS4d9bgLxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NMGUv3ax; arc=fail smtp.client-ip=40.107.244.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NMGUv3ax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXMixhCvOelGQnn2kOAaH466L62b7R/yonl448GKvpDnxkw7oBZ8ua4MY4o+BpmMP9IbioOc5gyzaKe66ZyQAfPA0G9gC+FOah704HczYuq/t+56ev4mJ+gaTu4yH8UvXuFSHXsVY6xEgBLtfgew60Cw3z2Ch4k6D7FRepUK0Dn+BncWkCK4jqnYgfpIIqgtyGdg/NuBTFjOzVyhvduyjM0Y+Cvul3UQcfJ3GOuUlKMPMiKIPavRz6vzigO/pG+vHb3igaldWbiznIubX/vKoojXVdnpjyAMXJgDbJRMmFMKD8nBrvtR/nqg10bdOCXNdXGb9jVuyvTLgQNBQQZAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGOydw3jjvsJZjRcYRz962sQ/FCqSdMams3R34IffS0=;
 b=hKneSHoox5pe0hIZq1LjcxHRtsvPLHs9POZgNcJBWqWsfEOooBDjG6fj9XdAQOVyK4oZKCy1+pZR6GaFy1J4/qfRenmgA4Y4brd6Q7RPnKVAGuWpljId+8FJfBZwnguqPi08s8Ese5MBm0y4mT9Tx9i7XUvY4JvCtVK4O36oopbrCfzyL5YhbhP43o7fLc9M6/Xpgii9ba4UEzqKzDepj+68AhY+wmCUTlbEirmWc+dOVzVkAvmrS75EickFdwTauNaOvOmT7332C2Zm5rHt6GczcADp5Oe/ZCh95cFFi/RNhqLwyNChf5HIMt55vRri0JFKDC7rICUof1JiBfOjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGOydw3jjvsJZjRcYRz962sQ/FCqSdMams3R34IffS0=;
 b=NMGUv3axqImOonOuNmf6nNiD7eQrR6xS0M1yfixFYl6E2UBDFp7Lq4KB4jpzJFssDR5PloUzx0a/nKR+umJkaF+XDAzSCg/39ospOOGfKWaMwOQOFT1BRPOCUYVyqXcEZJHwg+alpB45imnpg9LYtOfFqCc6t1gdvObEet/JeNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 00:55:17 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Fri, 30 May 2025
 00:55:16 +0000
Message-ID: <2211f443-1d79-4686-912d-a031a52e48a9@amd.com>
Date: Thu, 29 May 2025 19:55:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 23/27] x86/resctrl: Introduce mbm_L3_assignments to
 list assignments in a group
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <e0fe5863ad1801183047196d212ff3b1b79898fe.1747349530.git.babu.moger@amd.com>
 <b197893b-37f2-47de-ad4b-801192ea3e7a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b197893b-37f2-47de-ad4b-801192ea3e7a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5dd8bc-2559-4e01-91da-08dd9f14a49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUl6MFRLYUxhSjBEbndaSjh4OHBmb1dRRFBUUWhnVEhNUHVRaVZkeGZwTXBR?=
 =?utf-8?B?R01Ycy8ycXZIUGJGcTk2cjdNMlZ2OFh0SDNTMEUxYTVpZ2paa1o5R0F3UktP?=
 =?utf-8?B?L0F3K2IzRGdWUXUrTWtwcG1KSndQY0xFZy9IRnZtUEZCVVNOYlpURXo0M0Yy?=
 =?utf-8?B?YVo0WUFjQ2lKMjE5NWZwN2hqWlYvUmVySDE3dG9GbERBVjhHT1dzdElkK3FN?=
 =?utf-8?B?Q3lmemVvWEt4bytZaFlhblJ2eXlNZW5HS0t4ajRyY2gvdEkxUnd3azBQVnVI?=
 =?utf-8?B?cC9LQkRRdFRnV3ovSlRQaUJaWFVidFp2MkpOSlJaaS8xMjFwLzRXeWJVZS9G?=
 =?utf-8?B?b3dBSWU3T1BpTzhCcEJ5dkE4ZDY0TUE4VGlqdE5BemlyTGxIQWhvVHczeUlt?=
 =?utf-8?B?bG5BQTFRNmlCT2F5NzVvQit0QXBELzRaUk9UcGJGTEJkL3ovc20yYlF3YVZ4?=
 =?utf-8?B?WFFTVFRBSlFrU0VHbUtSR2ppbTkwVnB0KzBYQ3dRRjl3QklDb1RRajdVSGJF?=
 =?utf-8?B?VGhCL1MrMFVRRW5uQnV6UCtGUHhRTlJXK095bGtXNnJETmsvU3hJWHBiZUxk?=
 =?utf-8?B?dDJ5ckdsbE1ISWtISDhJWElGTGVtMnZFcnJ6QW92RlJWR0FIRm1nTDBNTVMw?=
 =?utf-8?B?TUZiOGMzSnV6c3cvZ0NQNTBHSTl3ajJiM2t3emRiYmhOL0ZyNC9qMERXbzVW?=
 =?utf-8?B?Sk1ZWnZsQytHVGxwQ25ZS1N2T3BadHczM3FoMjhvMlMvT0xjdm9ZTXIrNCtx?=
 =?utf-8?B?eXJ5L3dpcEtKdTk5eVdqYk4xZWcvMzZuRUx5UnZXWDZoZENlTVRMRmxmLzZR?=
 =?utf-8?B?NkxkNUVSeTNuZWJvVlBXbDk0RnNVdW9jM1BoUEZjWG90RVRKRTFmK1VOYytW?=
 =?utf-8?B?SlJiYktKeTBVN25mV0pLdkFzU3I4TjV6SFFCS3M3TGJXSmdFT2pCTTdOa0I3?=
 =?utf-8?B?QVpwNmpTbExsSlIveTRBWHpYQ2o5b2M0R25ZS0xxcW1nUGVuY0N2Zi9hbk5m?=
 =?utf-8?B?R1NGbDNsT0NGbklOMzVrWHVyYllPdW5nOWJId204RU9OVXVzRk01N2c1RWtj?=
 =?utf-8?B?WGRuMWYxSHorQ3JqbHlYUzBmOHJGald1NGRzTkNIdmN1cnFDSEp6VFRXMDQw?=
 =?utf-8?B?SVN5WDRTZHJabzJOaXdKMDRydWhuSHBSSkk0R0l6VUNHRmZibmtIZFQrTngx?=
 =?utf-8?B?YUl4eGE2THg3QmJLd3ZzNks3ZzBkcWpaR0I3RTV1Z1JIajc2dGxLN0U5WU9E?=
 =?utf-8?B?VFdUOVhSZHdWV0cyczBYZDdiV3hpK0E4endJNC84TkRnTXF4NXBkK2xpN2JT?=
 =?utf-8?B?TlpIQkFJS0g1cHl6RlZjSnVaUUo3NVRheHVoVlNJanpoL2xQQm14ZXVEWGFB?=
 =?utf-8?B?UE1BK3p6SU00UjFWRjE1VnlhU2s5eHcvaVF4dVJJZWhvMjhnUnJaM1gzakdQ?=
 =?utf-8?B?cnlUb2NLUmJxQ0xzV01UZzJxNHdVSDdNbkdzcU1rWjBnd3I4aUpGM3hZRXFa?=
 =?utf-8?B?NjYvUUpTUzhnSFZEVlBGaVRxVC9rQzJEeE9ObTBRWW1iWFpqaUFsb3krSGZJ?=
 =?utf-8?B?dmZIaTJ1WUUrZ2VGdzB3NjZjUXpPSEFZc0M5dUdmWjZyMkdvRG1xZWx0b2xn?=
 =?utf-8?B?WFM0WkQ2VkNSRTlCOGlPUmhPTjhXc1JGOEt1cFcrNzF0eno4WDRkQWVQMTVQ?=
 =?utf-8?B?S01pTFRZOThpeXNBSzdYaGtEZnNoajZ6QzYxQkVIL2RtODQ2WDkyWGFDcFZD?=
 =?utf-8?B?TFFlbjRmL2ZMd1NXM1JQc1MyRmNLMEJNQjdSMFhsU2U4Yk1oRjRKbEs4SEtB?=
 =?utf-8?B?TzY0d1lJZXVBaWowck9OL1FaeVNWVGlzMUhLby8yV2NxcmYyczBxdTB5Q1l1?=
 =?utf-8?Q?bf4P+raPbrF6F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2I5TWZvaVczNldvK1RVUUZZdllWd2dWN0FBc0YzTVArSk1zSlhHZmpSSlE4?=
 =?utf-8?B?dnY5dWZjMm9QYXBIN3FVMFdpU09FK2k0Vk1Qalg0T1gxSjYrYzluMTR1QmxZ?=
 =?utf-8?B?YnhpRHdjRnhhOWFqTHRxMnBBT2NtQUo2Q3dwOURTSmc5RXgvQngzcmxpOWxD?=
 =?utf-8?B?czVzQzdSckhRdXBGdUg4am5kaDVxM1RzQWg3UXZ1YlpOdGRUU014ek50bVh6?=
 =?utf-8?B?UjNncFhBTEdmS3VCa0RvaUR0UEVpYXhmVHA0M2JpVlYzdDBXK0JIWm1HeGZx?=
 =?utf-8?B?aXQybVRZaDRTbzdEeTQrbXVMWHhiMDhoMlpyQllTVm9od1pxa2luU2E3TlA0?=
 =?utf-8?B?K2tXcmxhbVphZGRMQ3YyNGg0RlMxZnJGczZzSXhFazBkQWhJcldRNUJ2UHBF?=
 =?utf-8?B?YU0yYjdBcEIzMi92eDYrVWhNbENkSVdrd1FHR2pIeThnZ3Fra2RMRFVrQkR3?=
 =?utf-8?B?dEVzSUU5bUNNaUlFQTFmaXgwOW1Bdm4rR3g4aG5rM0o1K00rSUxCWDBWTFZF?=
 =?utf-8?B?U2NFZDNheE5XUnFMZmFJYW5wUkZ5OTVpZFQ1TVB0ODVVTmhMVXlaczlJYnZ6?=
 =?utf-8?B?TUVTanhrSXdpRjNqSnJ6dVVPSDZDVW5TakpucDJCYW5pYUc0b1kzdkkvUHg5?=
 =?utf-8?B?T05RMEFQd0NrQkJtbTdEOFlXdjdpVkNINzkxV1ZYSURkNFpFR3RRcVZjKzhr?=
 =?utf-8?B?TGNnUy9UMlRKcyticHBjTXV5L1ZzVXJMS2ZLaGV4Mk9kbFpjYnRLK2tvTnVX?=
 =?utf-8?B?a1VuQ3ZUdEVwenBmSXUya3VVWXU5NjlveTF1UmlmbjBLNnFUTS9pZUZyN3R2?=
 =?utf-8?B?S1hMNlRuYkF3VUJWRHdTR0Vnck5RVm5La0cvNklySlltU2EzTERvU1Z1YXBZ?=
 =?utf-8?B?bi8vMUswT1ZtVWd1MzBqYU9MK09Rd2dPMjBnQWNlem0zWUNyODJ3Q3g5YVZK?=
 =?utf-8?B?SjFLNXVNcndBWjJXSEl3UTBFT05UVi9pT0c3dDRCd0p2Ym1YWWIraExVUzha?=
 =?utf-8?B?dThoRE96anNTN1NmcFNZa1NxbWQrNytpL2hIakZxNldubnhjQW1lRm4yODIx?=
 =?utf-8?B?aGZJTWVJY3Bva0xGcC9oMUFDL0xiYTkxWXo0V29YNmdOdDlNd3FneDBodzlu?=
 =?utf-8?B?K0g0eDM0MXliZFFFc3RSVGlkWVZIQTBtbWRoQ3RkS2lrUWJYVWdLOW1CMDhU?=
 =?utf-8?B?MXpIUnBVcWN2QmsxYWF3eGFUckM1ak9TbjdsTjdsaCszM2pXT0lhNEx0VjFY?=
 =?utf-8?B?M3JXQUtLMVpyUitRMCtoYzl3VWRFaWNLRnJEQTRxUDVXV3REcGduYXlRbEIx?=
 =?utf-8?B?UU82SmUxQm9zZ3czd0JJeEdFZU8yT2xyMFA0cVp4eTBZLzl2Ukl5VmNUVG9w?=
 =?utf-8?B?UXQ5UzNCK2NTR0N1aVlsT0o1KzQ0ZlNZY2FWRWY3YnpXZG4rWkgxRFJGU3lD?=
 =?utf-8?B?UHNvVVNkY3FmSllMQmF6dFpYSEhiMUdjNDJZbzBqdlY1M05HMml1azlDa0lJ?=
 =?utf-8?B?bGpEVHJqK0w3U0l0WlZiVXJ3d29SaXA0bDFZSkpjT2oyQUxmWTl6a01ub0pm?=
 =?utf-8?B?a1pReGNXZ3RienViQVpmNkVFWHJyeTQ0amNxZ1hpbjBwb2xicXpHTXJPa0Zt?=
 =?utf-8?B?RHhkbXNqK1dyU2swbkFBVUFubmYybnIxV015OGtHUmg3ZG94WFJGUitmK1k1?=
 =?utf-8?B?VVp1V3ZpSldRVFBuVVpwMUNhYnJaYmZiWWRNbUc0VXNkTGo5d01xK1NYVVZj?=
 =?utf-8?B?RXJUMHB6SFRrTlhEeVNwRkNraGFOYkRuVDYvL3pzUThLalJBUHc1SkZCTTdl?=
 =?utf-8?B?WVVwNGVwdXhiSmtHbXNFUXp1VXA0UXB1RHVGcnFTNU8wSGxQZXlaZVVUQ3Np?=
 =?utf-8?B?RzBUbHp1L3ZHZCtLVDlyK2pNbDFRVnZRdVQxd2tNZEJwbElYWjNCeUluZ2VF?=
 =?utf-8?B?bVFTQkxGcENHTkVISWJTNkkvTFdKbUVaRDBwY3ZidDNvZDZpTUt2elFNS2Nh?=
 =?utf-8?B?c0ptYkRNdUFTTTlEdVZKZ2FXRnRQdGRLOU1uVEtxSGJwR1lXMDJuaHVEMFBk?=
 =?utf-8?B?SzFQOVgvRUJxV0xQSEJ5UEx2bjFXOFhZY0t3b3pYZ0FsRitCRCt1LzlWYitT?=
 =?utf-8?Q?tEdk4pvU3RlBIRTTfsvMM/R5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5dd8bc-2559-4e01-91da-08dd9f14a49b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 00:55:16.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF5vVtB4370ahM9Rnrhg4o6eKAkx4NE3NfvrkT2TChvtPFOeSThbgt9tl37xbO/Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

Hi Reinette,

On 5/22/2025 11:47 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> Introduce the interface to display the assignment states for each group
>> when mbm_cntr_assign mode is enabled.
>>
>> The list is displayed in the following format:
>> <Event configuration>:<Domain id>=<Assignment type>
> 
> Should this just be <Event>? The information is just the event name, not
> its configuration that will be in the "event_filter" file.

Yes. Sure.

> 
>>
>> Event configuration: A valid event configuration listed in the
>> /sys/fs/resctrl/info/L3_MON/counter_configs directory.
>>
>> Domain ID: A valid domain ID number.
>>
>> The assignment type can be one of the following:
>>
>> _ : No event configuration assigned
>>
>> e : Event configuration assigned in exclusive mode
>>

This needs to change as well based on comments below(resctrl.rst).
This is note for me.

>> Example:
>> $cd /sys/fs/resctrl
>> $cat mbm_L3_assignments
>> mbm_total_bytes:0=e;1=e
>> mbm_local_bytes:0=e;1=e
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Changelog update.
>>       Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
>>       Resolved conflicts caused by the recent FS/ARCH code restructure.
>>       The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.
>>
>> v12: New patch:
>>       Assignment interface moved inside the group based the discussion
>>       https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
>> ---
>>   Documentation/filesystems/resctrl.rst | 28 +++++++++++++++
>>   fs/resctrl/monitor.c                  |  1 +
>>   fs/resctrl/rdtgroup.c                 | 52 +++++++++++++++++++++++++++
>>   3 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 356f1f918a86..2350c1f21f4e 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -504,6 +504,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>>   	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
>>   	event.
>>   
>> +"mbm_L3_assignments":
>> +	This interface file is created when the mbm_cntr_assign mode is supported
> 
> "This interface file is created when" -> "Exists when mbm_cntr_assign mode is supported"?

Sure,

> 
>> +	and shows the assignment status for each group.
> 
> This doc is in the portion documenting files in monitor groups. So rather:
> "the assignment status for each group" -> "the counter assignment status for the MON group"?

ok.

> 
>> +
>> +	The assignment list is displayed in the following format:
>> +
>> +	<Event configuration>:<Domain id>=<Assignment type>
> 
> <Event configuration> -> <Event>
> 
Ok.

>> +
>> +	Event configuration: A valid event configuration listed in the
> 
> "A valid event in the /sys/fs/resctrl/info/L3_MON/event_configs directory"

Sure.

> 
>> +	/sys/fs/resctrl/info/L3_MON/counter_configs directory.
>> +
>> +	Domain ID: A valid domain ID number.
> 
> "A valid domain ID"
> 
>> +
>> +	Assignment types:
>> +
>> +	_ : No event configuration assigned
> 
> hmmm ... since the line has event as first field, would this not reflect the
> counter? That is "No counter assigned"

Sure.

> 
>> +
>> +	e : Event configuration assigned in exclusive mode
> 
> "Counter assigned exclusively"? (with exclusive defined somewhere)

Sure.

> 
>> +
>> +	Example:
>> +	To list the assignment states for the default group.
> 
> "the counter assignment states"?

ok

> 
>> +	::
>> +
>> +	  # cd /sys/fs/resctrl
>> +	  # cat mbm_L3_assignments
>> +	    mbm_total_bytes:0=e;1=e
>> +	    mbm_local_bytes:0=e;1=e
>> +
>>   Resource allocation rules
>>   -------------------------
>>   
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 5f6c4b662f3b..b982540ce4e3 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -935,6 +935,7 @@ int resctrl_mon_resource_init(void)
>>   		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>>   		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
>>   					 RFTYPE_RES_CACHE);
>> +		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
>>   	}
>>   
>>   	return 0;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 931ea355f159..8d970b99bbbd 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2080,6 +2080,52 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>>   	return ret ?: nbytes;
>>   }
>>   
>> +static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +	struct rdt_mon_domain *d;
>> +	struct rdtgroup *rdtgrp;
>> +	struct mon_evt *mevt;
>> +	int ret = 0;
>> +	bool sep;
>> +
>> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> +	if (!rdtgrp)
>> +		return -ENOENT;
> 
> Missing a rdtgroup_kn_unlock()?

Yes. Will add it.

> 
>> +
>> +	rdt_last_cmd_clear();
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode not enabled\n");
>> +		ret = -ENOENT;
>> +		goto assign_out;
> 
> grep goto fs/resctrl/rdtgroup.c

Will change it to "out_assign".

> 
>> +	}
>> +
>> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {
> 
> can use for_each_mbm_event() and then below will not be needed?

Yes.

> 
>> +		if (mevt->mbm_mode != MBM_MODE_ASSIGN)
>> +			continue;
>> +
>> +		sep = false;
>> +		seq_printf(s, "%s:", mevt->name);
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			if (sep)
>> +				seq_putc(s, ';');
>> +
>> +			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
>> +				seq_printf(s, "%d=e", d->hdr.id);
>> +			else
>> +				seq_printf(s, "%d=_", d->hdr.id);
>> +
>> +			sep = true;
>> +		}
>> +		seq_putc(s, '\n');
>> +	}
>> +
>> +assign_out:
>> +	rdtgroup_kn_unlock(of->kn);
>> +
>> +	return ret;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
>> @@ -2218,6 +2264,12 @@ static struct rftype res_common_files[] = {
>>   		.seq_show	= event_filter_show,
>>   		.write		= event_filter_write,
>>   	},
>> +	{
>> +		.name		= "mbm_L3_assignments",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= mbm_L3_assignments_show,
>> +	},
>>   	{
>>   		.name		= "mbm_assign_mode",
>>   		.mode		= 0444,
> 
> Reinette
> 

Thanks
Babu
