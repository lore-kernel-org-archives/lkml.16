Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11010060.outbound.protection.outlook.com [52.101.51.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6E211A35;
	Wed, 28 May 2025 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.51.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428156; cv=fail; b=d2bZPKXIXS4wgXyphB47u/zlLeTbRGysVcN2TXL6e8UhI4LCtY3JczgE/LliBQHLP8iZ80tVnzR2dMvgw5uQDSCc/y/IHELwJ7aaXbnsZmAdbExok3ykJtbzL64WaFBoQ2zud0kwy51vylEbf+yY8LcBANB1AkcXmj4j4VrxoJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428156; c=relaxed/simple;
	bh=lcqcNqFQpPpOIVoPD4SRwXBqHtI25WBw23Z4EwhJjk0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KOSzHQ/SR3ypIIKuFPU6sAeKlyZlxqeOmWdkioRNFnE6q0ELDxupvxifzWE98gqfzOiNETKjMi2e8dmO+6vRPAFDhSaRondI36Y4wTFHXt4f5uXG0BHX941t0PVgGyA0YlU+i4IWKQj9KvAE3vQI8XuIOyqua/kaZl/aj8hiZ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wMdjYH7R; arc=fail smtp.client-ip=52.101.51.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wMdjYH7R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMV3Qkcze7k3wtCcsGtxL1flQmRcM+z/EL2pQ9wRWmQdag9iK89NLlhztezokIzElGIz0f+tw9sOoRzv+FelDSR3p9Ofcq36VmS6iRSJpgSAZkGUq6sxyFUKax2o3AWWC0UDXEukGljJq26JmB5Hir8fKjYr9dRvUfEPFRUnhwInB1IKCR5DZh0y02yFZJLN22ZMTLikSVHNvyB0PTfqLDiJXxBtwt9fEB5wlOc8iTmCwL2bCvWJ0V1ud9k2+JQO0L4UKWX1Ld7XH5bIex6G7KHk0P3h57dpglSm/HWRnJJVulKs7Q/JOKqy/Zzt8FrxOlvfKkuFczscP9khzgkFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVFQ385IfMWP+dmdQn3UliBRM7KkvEf7cViU3m0wzHM=;
 b=gnEtNXX0iWoxzuyxstFfHidZ1bM+7/rHm2d7cK5xyEKP2wx5zjr83M4NoU1ghO1fHHfnXXHt4D3uE7UwwNQWzijvVYI1i9oZec2dbSf8KoEssHzI5WYf6cg7qABAgMI0h0Og6wbHmdbFj03BD9wBe9KcFzC9VUkvsAiaBmDKgkmlCAqSAK3fQ4KB50xErh42WMRZ0+LKVvMrGf34KuNfM5tIDavIwnSWjMsUB+1u49YRMWfvSMToUiAz/q3l5A6Ur+ll5Gd3Ob6i/sPVrymL0fybcUu8FlITaeuQ7OmrN/mNCbkXplKQcyiBkDhpJVU6/VFxko7ao2hWtofHP7jQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVFQ385IfMWP+dmdQn3UliBRM7KkvEf7cViU3m0wzHM=;
 b=wMdjYH7RougFIpMDg4fndDkJe479ctbE6Jk8DS2ARW2ePLLf8adPOhYF825Ke7l30EK3qsHmF5nMsPlObYbcqkBmn4InHsWS2lc5Iz19ofNgdpf+kurAerzV9qNVWH2m+gSSk3gf4d87+q6uOG8bwsEcJP7hgq1mH7lnbKzi/9BnvCn7OakwdafAHiX+gJIF111Xg+LNGhlFqUh48FwiGxieYnGjcPPQoFRgOHQf6N23Yg6LT9z0kwJjW6qQHBUu32/atRGFmQypGCIwp1ocRGGLT1zDkM6cvjNoq1kL7L0PVhmI0O1aIjEvMllsEO3l90e9K5dZOT8HO+mbCW/ptA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 by DM4PR03MB6176.namprd03.prod.outlook.com (2603:10b6:5:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 10:29:12 +0000
Received: from BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e]) by BN9PR03MB6201.namprd03.prod.outlook.com
 ([fe80::6b16:5fd0:112:ab8e%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 10:29:12 +0000
Message-ID: <0f74ed36-13bd-4b6c-9d5e-f52cc25235f8@altera.com>
Date: Wed, 28 May 2025 15:59:05 +0530
User-Agent: Mozilla Thunderbird
From: Mahesh Rao <mahesh.rao@altera.com>
Subject: Re: [PATCH v3 3/4] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-3-6a08a4502de3@altera.com>
 <3a76c7b1-ce02-41eb-a4c0-ae065e9b99f3@kernel.org>
Content-Language: en-US
In-Reply-To: <3a76c7b1-ce02-41eb-a4c0-ae065e9b99f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To BN9PR03MB6201.namprd03.prod.outlook.com
 (2603:10b6:408:11e::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6201:EE_|DM4PR03MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: aca553fe-93ad-4bb9-93f8-08dd9dd27cfb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVlheFFGTVpUYjVOYlVIWm5nRS9iQVpnRjhwTWNUVnMyRlVnSzV3OXVHUXA0?=
 =?utf-8?B?QndBNk1MbW1PSVY1WDk4MXRLd2F2OTg0cjNnSnlDeHNrUC9XMm5kNVdNZHhK?=
 =?utf-8?B?aWRjSHpobnZ5dlpMQ25zeE9XMCs2OFI0Z0h2VE9FT3Y5M1hyL1kvRml3TGFX?=
 =?utf-8?B?blBEamtPcW91bU45aE1pVEx3T21LRGJsVTBRc1pmK28zVncvSjl2YmpscEwv?=
 =?utf-8?B?bnIzWVcwL2lUQ2NsQkZtNklTcEM5QVdkVGJ1bm5RL1N6QVczUHJMcEJRQWxD?=
 =?utf-8?B?ZWpMN3dZQnBCN0lySmNTWEdpalE2WjFhaXNablpyV05KemFPTTdPV2t4Zmg5?=
 =?utf-8?B?QkFUcStFd05uTGpxd1FsSGVOc3gzVHArZ05hTGc5Y2psUlJ1cDIxUnB1czdj?=
 =?utf-8?B?TVJ0UzVDMW5yY1dnYWRHSG92L1dQbHlSTVpzQ3NBUjZDVElEWTVMZE5TaHVJ?=
 =?utf-8?B?SmVHZ1VmQ2FuL2RSRksyeWZVQ0hVTCtNbmhrbXMwditRSU1SRW80UlgreGFZ?=
 =?utf-8?B?ZmwxbDRxWFFQYWV5VmMwUS8rNnVJUGdieGt0L09zeDIzOXJ6UlptVWR6dkw5?=
 =?utf-8?B?VFp4MGpVOVA2UWh3TkIzTi9pQ2dVL2xxMk0zRHdqd2RZYTRyd2NHM0N3S2ZY?=
 =?utf-8?B?OUFLMjFqM28rY0xucnpkV2Q4bGxoNityRnhYQ0hzNDdxNm9OSng0aDk3UWNm?=
 =?utf-8?B?dXlTbU1DUDlHeUpWbUkzbzkyanBNNmhIS2xVSWM5SVpscTlPSXFFWGpJV3d3?=
 =?utf-8?B?SFlrRG1taEhGaVoxTzBUeFMxYlZ2MDdEWnlQYUhwMEhtRVlmUFp2ZGxRbmxL?=
 =?utf-8?B?SU5yamJZN2xDc2JpbDNpK1dUaVJRSEJ6RFdzRGptd1RIUmZsMVp6WGluSU9D?=
 =?utf-8?B?YWZDSExScjJQaERBUU4way81NDFxeFBabFV5K1JKTzJtcm5MQzlEcG8zcHRk?=
 =?utf-8?B?TVpDM0I1TXNXRVEzUUlIVmx3UGIzNjUzMm5Wa0UyTjd0MWFpNUZHdlRRSXNI?=
 =?utf-8?B?b1dvSUdya0VacGhZL2R5RU1PejBhRXVibllITHV3cVdwM0F5NVhDNmFqbGFW?=
 =?utf-8?B?Z05zTDM1amxhNExMTVlMaXBOT2lFZDFrWDBkMk1URE95NTB1NkxhN2FTUDB5?=
 =?utf-8?B?ZEVVakxYdCs0THpuYWxuNjE5WUdib2J3T1JTOGQ0MERvZlNGeEFwdWtEVUZI?=
 =?utf-8?B?V24wOEJXTTVPemdVRTgxVHBzNVFhUWpYb1lqT2c1YzhNMGhhN0lCOStQSmZo?=
 =?utf-8?B?Um50UnZEQTYrOWtEbFQxZGF6bSt5bGdjM3d2c1FDMSt1OEZMZ2R6a2VDYVdF?=
 =?utf-8?B?VDVHblZiamJIdUdVdEw1ak9LWHhaRml6Y3htdDZkeVlnb09WczJFQUM1WTds?=
 =?utf-8?B?NHhZSXR1ZHdEdVdYY3hrL3lRaXhFYm85cWJ1R2x2Z2VnZ1FrYUxyWWFQcUlN?=
 =?utf-8?B?S2Y1RC9MNmFQcVJOYkJCSW04M3N2NllmSkJFaEM0aXl4WWQ5dnBmT0xtdEVu?=
 =?utf-8?B?VUZ3SGdOcVFzZ2NKKzZKMEgwV3VwQ0czejRpWDg2QzNJdzVMM29GbHc2Vlhr?=
 =?utf-8?B?dkZ5ZWNkOGYvWDhFOHNEMkZDMVF3U0dsU0NTYkNLdTFOUEhULzFseGE2ZGk2?=
 =?utf-8?B?ckhUQlFabFVicVlzVUV0eUFSK3RCTjRIaytFZkswSlVLbytabVVxS3VXemlv?=
 =?utf-8?B?R3l3WGRCT1VOTXlRaTlnOHE1NVBGK0ZGbkUzcWYwQ1FBblB5WVFCeDdTZSs3?=
 =?utf-8?B?SWlvWnFKSXBoYnNFRWo1QzBncE10SitKZDFsdCtKQjJnQ0toUVVEcTNkelhh?=
 =?utf-8?Q?oLiL8nuznjJ1z7RqgPjgcSLY+OS0WHvcl4C1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6201.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVpWUUp0MHdZYnljVVVXS1V4eU5hMlBmNUxTTGpwOFEzODgyc29sdFBabmw5?=
 =?utf-8?B?ZmpTSlFoZTRaZG4yZDk4aUNHR2V6aXRwUTdkK1BJeFpZUmJHK3pwU3NMbDM3?=
 =?utf-8?B?MklWMTZSZTNnZWlpVlRBTmZsVGlaaGNPOE42QTA1dnhKSzlUQzJFak16VXda?=
 =?utf-8?B?K3kwQ1hXN25JR2xCNzlodnF1c3VQcUR0YnB4b1BHMU16ekZCTmdydUpvRG1w?=
 =?utf-8?B?OEwza1VLS1JMQ1gwSk1xVTBOMDg5ZDJwNkh0UG42SEoxTWhRa0Fzbml3ZUVl?=
 =?utf-8?B?aG44bkxPcU5NbFp3TTlKUzBETzh0RlVZTlFMeE9XcG9aWWROMlg3RWNKa1BR?=
 =?utf-8?B?dFpFbkJUbmYvbm4xNVd1QVNtakhaMUVDUktQdDJKbkxLVnBnRTNNT0VXSGpO?=
 =?utf-8?B?SVNLWFNUQ29CWXIyZXp0Mll2TjlKN0JNOXRCQUVGRXJ1WjNoT1JiQkxiY05M?=
 =?utf-8?B?RkxmZWZUMU1SeVNMT3hTMGMzWldLVHJHNFFsbmVRanZrVjJacGRiZkZHRGN1?=
 =?utf-8?B?SjZ3VlZNOUVEdk9aRTh2eTN2akhaSEN5LzRqbUk0c09ObFVIdmJqdjVaL1FK?=
 =?utf-8?B?bnliNGJKUEJwL3BrdzZRaTdhU3hiZWpCNzlISkJQdEhvTUFYcVIwTUE5VXJx?=
 =?utf-8?B?NWc5bEwzRjFha3hoekROU0R1UjVkN3lVYWNaRXVkUVB3WUcwVU1DYmFvNmYw?=
 =?utf-8?B?NWtYcU5QMENzeDhZR0xKS1F3cytzTFZ6UENHaGlTQjR4dnF3OWJMN3hLRkNT?=
 =?utf-8?B?YlhWTTM1SnorWFJ0dkd3VDlhUDgrU0l2NXQ3ZVJjUjJ4cnlWdzB5OHdLZ2ZM?=
 =?utf-8?B?cXBmU1N5Q2ZScXpUTzZUbEwzRVFJd3JVWTBCb2trRWpzRFN2bGttVGF1M1BP?=
 =?utf-8?B?NE1HYXhkS1M3M1dYQ25yYmtqcEVqSDhCM1BMSERzQndmRG9GTyt4VU1yWkEv?=
 =?utf-8?B?WHN0TUhxbW13THBVUGljd09rU0w1bUZ5Y2dESUl5amc0ZkNhMXN5cFR4dzZm?=
 =?utf-8?B?cm5HVFVQbzdxdmRlT003Sk00OWVOUmtFNk1CcUpJMHFGVW5Lbmg4bGFkY2lT?=
 =?utf-8?B?QjQxUG5iTGI2aVFNY05YQXdrYkR3bVdVVkJiVXEyemJRSWxOTWVHbEppaVNn?=
 =?utf-8?B?RzQ5S2YyTTZhbi82WTNzREk1aWFHbFFWL1ovS2FLQzR5S1VBNGd3U1dFdzlV?=
 =?utf-8?B?WGx3eEpoYkZwU1lTSkRzWEUxL3Flem1VSWlKUEtKYXptZG13SUxsc3pybVU1?=
 =?utf-8?B?aVVWSzRrVHpldDNkNWttc2wzTUZDYlBNSWE0Wm90OVB4VW84Yzg5cm5jRVEv?=
 =?utf-8?B?UjNUZFlqQk9acDEvaHoxREwxRVVRZWFCc204a2RKVDlZV3Z6UjFKVjJHMTN5?=
 =?utf-8?B?NGRRVDNtZ0pKR281WGovUElqR0VlQlBQSm56Zkp6amxUbG92TEY1NDRtTkQ4?=
 =?utf-8?B?TFhsY1h0aS81ZlhhNXVtQ3BuRG5NSnVrU3Y3N1J0dWNianl6bUZJcnZCb0E5?=
 =?utf-8?B?TEF4OXZySzc5K1B0YnVnRS9MQitXREF0aEgrbDdUampUSHQzMzY1dm5BWDhp?=
 =?utf-8?B?LzkzQXgwQVhEQy9HaGs1L0ovZVVPU0NTUHdIU2Mwa0R6RU1lNCtkTkRBNGR4?=
 =?utf-8?B?UmtUVVU3TWNONEREeEd0Z2M1U25vSzV4SDdpdlZIRVF6dm16WjYrV3dYMkQx?=
 =?utf-8?B?djJQa3FEY2I0aWN1dlBPVjFCR1pjOUtKc2NsOElqbXlYK2RIL0VsSnEwTENG?=
 =?utf-8?B?YW1DMzJ0SjZzMkJFVEw1S1Y1Vk0xS0tKMEwzbDZlZFRwdzlVcGFUNld4Y0Z0?=
 =?utf-8?B?SUpDTER6YUIzbGZoRnMzV2JMQUJnVmVzd3piYjB2Z2lNNFFFZFlTaU1Sajdl?=
 =?utf-8?B?SjBhWXBrTlNWS2p0RmpSUy93V3NyRmF6b1VYekE5Q01VVVRZTDk4QVZYQTFG?=
 =?utf-8?B?Y0pzdkxqd3VRZUordzl4b3NreXVpUlBGNEcyUlJGOW51YVpaUjExOUZ6c28v?=
 =?utf-8?B?QXl3S1BiQ1pZS0Vhb29IVUNkQWl6NmI2RDlTa3hKMkZ4MmJBaVh6MWtvcUlT?=
 =?utf-8?B?Y0ZDMTJ1Nm5xYk9IY3l0b2J0THNONU1NZ21vdnFvdmtsMEQrT2M0QnRSbHh2?=
 =?utf-8?Q?oHJatiRuWmzAinvHYDVvrmADJ?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca553fe-93ad-4bb9-93f8-08dd9dd27cfb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6201.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:29:12.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ6+SZZ/IXZYmE3fhk91qjqfXenoszc5s5Wa0a2bFLswSTNLcPW1r4kUK3yMDyzc/IoC3l7JyFTxtsR+s84cRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6176

Hi Krzysztof,
	Thanks for reviewing the code.

On 27-05-2025 02:14 pm, Krzysztof Kozlowski wrote:
> On 26/05/2025 08:25, Mahesh Rao via B4 Relay wrote:
>> From: Mahesh Rao <mahesh.rao@altera.com>
>>
>> This commit adds support for asynchronous communication
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Will incorporate the change.

> 
> 
>> with the Stratix10 service channel. It introduces
>> new definitions to enable asynchronous messaging to
>> the Secure Device Manager (SDM). The changes include
>> the adding/removing of asynchronous support to existing
>> channels, initializing/exit-cleanup of the new asynchronous
>> framework and sending/polling of messages to SDM.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Will incorporate the change.

> 
> 
> ...
> 
>> +	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
>> +	args.a1 =
>> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>> +
>> +	actrl->invoke_fn(actrl, &args, &handle->res);
>> +
>> +	data->status = 0;
>> +	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>> +		return 0;
>> +	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
>> +		dev_dbg(ctrl->dev, "async message is still in progress\n");
>> +		return -EAGAIN;
>> +	}
>> +
>> +	dev_err(ctrl->dev,
>> +		"Failed to poll async message ,got status as %ld\n",
>> +		handle->res.a0);
>> +	return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
> 
> No, drop entire function. There is no user of it. You cannot add exports
> for dead code.

These functions have been newly introduced for the Stratix10-SVC 
platform driver. The client drivers that will utilize these APIs are 
currently under development and are planned for inclusion in a 
subsequent patch set. Would you prefer that I include a sample client 
driver using these APIs in this patch set instead?

> 
>> +
>> +/**
>> + * stratix10_svc_async_done - Completes an asynchronous transaction.
>> + * @chan: Pointer to the service channel structure.
>> + * @tx_handle: Handle to the transaction being completed.
>> + *
>> + * This function completes an asynchronous transaction identified by the given
>> + * transaction handle. It ensures that the necessary structures are initialized
>> + * and valid before proceeding with the completion operation. The function
>> + * deallocates the transaction ID, frees the memory allocated for the handler,
>> + * and removes the handler from the transaction list.
>> + *
>> + * Return: 0 on success, -EINVAL if any input parameter is invalid, or other
>> + *         negative error codes on failure.
>> + */
>> +int stratix10_svc_async_done(struct stratix10_svc_chan *chan, void *tx_handle)
>> +{
>> +	if (!chan || !tx_handle)
>> +		return -EINVAL;
>> +
>> +	struct stratix10_svc_controller *ctrl = chan->ctrl;
>> +	struct stratix10_async_chan *achan = chan->async_chan;
>> +
>> +	if (!achan) {
>> +		dev_err(ctrl->dev, "async channel not allocated\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	struct stratix10_svc_async_handler *handle =
>> +		(struct stratix10_svc_async_handler *)tx_handle;
>> +	if (!hash_hashed(&handle->next)) {
>> +		dev_err(ctrl->dev, "Invalid transaction handle\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	struct stratix10_async_ctrl *actrl = &ctrl->actrl;
>> +
>> +	spin_lock(&actrl->trx_list_wr_lock);
>> +	hash_del_rcu(&handle->next);
>> +	spin_unlock(&actrl->trx_list_wr_lock);
>> +	synchronize_rcu();
>> +	stratix10_deallocate_id(achan->job_id_pool,
>> +				STRATIX10_GET_JOBID(handle->transaction_id));
>> +	kfree(handle);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_done);
> 
> No, drop entire function. There is no user of it. You cannot add exports
> for dead code.

Same as above.

> 
>> +
>> +static inline void stratix10_smc_1_2(struct stratix10_async_ctrl *actrl,
>> +				     const struct arm_smccc_1_2_regs *args,
>> +				     struct arm_smccc_1_2_regs *res)
>> +{
>> +	arm_smccc_1_2_smc(args, res);
>> +}
>> +
>> +/**
>> + * stratix10_svc_async_init - Initialize the Stratix10 service controller
>> + *                            for asynchronous operations.
>> + * @controller: Pointer to the Stratix10 service controller structure.
>> + *
>> + * This function initializes the asynchronous service controller by setting up
>> + * the necessary data structures, initializing the transaction list.
>> + *
>> + * Return: 0 on success, -EINVAL if the controller is NULL or already initialized,
>> + *         -ENOMEM if memory allocation fails, -EADDRINUSE if the client ID is already
>> + *         reserved, or other negative error codes on failure.
>> + */
>> +static int stratix10_svc_async_init(struct stratix10_svc_controller *controller)
>> +{
>> +	int ret;
>> +	struct arm_smccc_res res;
>> +
>> +	if (!controller)
>> +		return -EINVAL;
>> +
>> +	struct stratix10_async_ctrl *actrl = &controller->actrl;
> 
> Do not declare variables in the middle of the code. See coding style.

Will incorporate the change.

> 
>> +
>> +	if (actrl->initialized)
>> +		return -EINVAL;
>> +
>> +	struct device *dev = controller->dev;
> 
> Same here.

Will incorporate the change.

> 
> 
> 
> Best regards,
> Krzysztof

