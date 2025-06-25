Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06573074AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830337; cv=fail; b=toqI8ThC4TvhL/EonrpOdb1URSoER+dmoKm8JI4IscvoK+T2JkScWctwH16Xu95Tu/TVsIxcptab9IsMkbOtUKe9ZOt9NZHlgyieaH+cwSaUQXGPrvjEymub+0gUfnmRFQwZh0pSUVHB1LZIYf29hTJYMujjmIqi+HyiWLYYq2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830337; c=relaxed/simple;
	bh=6aksT9nATla0NzZDOcEQLbPJttPSmdww5NXCddyyEAk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g5nTSbSWpOrMlobnq3maaXo3dCDzYWVUwDWCqa/gF9ACATAloB84c1McL+HfHIwxoXmFjlXBZ4C7EXPEUfBdqDXeBmj/Hh9P8xqa2RMwNt1b0nb5C5ReTWmKWM+Y9tB2YpNckRJPCQ5yXWHkyrkKRGQHAGfZ6u8ZuEVOnTiPqZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T7Pxdl4j; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T7Pxdl4j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7d1o2SFjbbykmK/yBMHKinZICTnmrtfWc+BWALAm5fJKIaGZ+hygQCDs16Ke0gAbwGRV+m/KI/ks5sNn8o5d8ozhm4Wdn+EWbLiIBmUVCrZMr3bR9Py38MjA40n0OMXr93og9J5qCV7vze7HmvOUcaEaQSgR1pgEat/rYjPmM1OAfCTR0P0b1V6pA55rOooeD7pZjnLsaQBJL3tAOlRZ4qnLWy+sDYWt/rslEx1P4Yet/Sx2hqqsx4TDBvI8Od9BA48px41SoYEXWAtaL4ZHtW+WfUvjh7mX8dWvb6aIrH+2Woh428L+RSbXbFLbGc6QlQFYz0QjuhBJYpF8fkObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cqPcsl5qBai0Qt9wGKrE+bkrCqYY7pb6AbSbEAZJkU=;
 b=fxGfYjO4JzYmDa8qRO8viMoCmX+xl+M2qg+xUbS1Md+mPh8yBqSR8RZKdqAZjwsrUk+43IWTlovpSxPMbGqxRv9rW0eS4Tk9TeAOHz8v/7NZZqa+JZV3tJ+5H1uys7VF8BQg6o11g7KCn2jPpNAVhxtx/r+kGdjS66Ns4rHPq+DDHrJEzFxuypUeJQtUOwoic98ym0cqACKq4QCoUiT7iZ67KRRGDjOkShPuSLMKcXv9o/aFt+L8oBZlDK0Y4aTpaLsSmn72HUuSoQYOLj3oQ9erCGiS1Gd7yi35lxun/y8RZPz/gY3ulw4HtU3wZo79qziNNBOleKLqE12Qn43uQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cqPcsl5qBai0Qt9wGKrE+bkrCqYY7pb6AbSbEAZJkU=;
 b=T7Pxdl4jt1VUR2ySZIVx+rnq8NncGrYm6xCZcDIK1NirZZIao6ZOFseYdeqlh2iIn58K+InejUGs6DLJ0mDawR3YXeMXKXKqQjVek3gSOAWbXgeBm8iXH90Hi7XUvyxI5xeZoarxd2ZfLt6ThNGFQmp1SpJw0txsbFHeg9rfWNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Wed, 25 Jun 2025 05:45:32 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 25 Jun 2025
 05:45:32 +0000
Message-ID: <1b706790-2fec-4582-a425-55eeff36c32e@amd.com>
Date: Wed, 25 Jun 2025 11:15:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
To: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
 linux-kernel@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Li Chen <chenl311@chinatelecom.cn>
References: <20250625034552.42365-1-me@linux.beauty>
 <20250625034552.42365-3-me@linux.beauty>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250625034552.42365-3-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::11) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DM4PR12MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: f06433ec-cbf8-4369-7c16-08ddb3ab7f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFNWYkgwYllaNlNpaEc2dkhybGxjQUZtV3U1RzljYTJFMTRZNitiSC9SUE01?=
 =?utf-8?B?UkE3VHcrdHRXL2RvWjRqWTNDell4UUFTOFlmekpKRWxRZXhBb0s5M3hub1BF?=
 =?utf-8?B?RDlKRnNjcHBKSXhSNjFTd1MxL25xSndNVk5yRERRcERRS0o3SHF5emI0WXpa?=
 =?utf-8?B?aURzOWpzdWE2RzZDb21UY3R5MXNkWHNITjhHU2o4VU11QnQ1ZXdHcGxpREdJ?=
 =?utf-8?B?akVUdmlseVdaczhJR2o3bnBhNGtnQloza3kvaUNjYnM5TVlreUdWVXZ5bzNr?=
 =?utf-8?B?V3VxaStOZWVTRGN2cEc1clhWT1NiaVB2YWlweHBMc2xPOE1XSlFRejQxQUNU?=
 =?utf-8?B?TzNOcUM2M01OQkRMVTVhdmdOYnNOVnJKU1JKeUFYZ1RyenpHbUs4K2d0RU41?=
 =?utf-8?B?SkFUQm9WdWFPN2VyVXNoTmp2MWtZUjdxSWpRWFRnc2x6RmZJTWNtakZ5UG92?=
 =?utf-8?B?UjVhWDR3NzFEYVpIUEJIQnVIQXNxcmZzdkU1VjVNT05HelBxclFRcE4xMVd6?=
 =?utf-8?B?ZWwvMGhmNGhFdG9rZTdCTm9oTHM2Tk5CY2pnTWhoTTc4TGxYdHdUWmlqVFBl?=
 =?utf-8?B?OEE5cnBsdy9wUGc0ekh5NjkvdnE5NGVlU3dNdElBWkNxcGJHS0IyN2VpRFBM?=
 =?utf-8?B?Tmc0dTFuNjFuRVg5S3BVOEVZUkw5OVFmWCtpWUhTQVNBVGk3bkNOT2lMdWs2?=
 =?utf-8?B?M2hndUZmWXBOVjJkSTFSeFd3UHozeER6QXhKaFNaMnZzd0xhd0xaT29DTncr?=
 =?utf-8?B?TGJJK0xJdnZmcDFvRzM5NG5rTSt5VXJTaDZ2ZzY0UGRxV0o1QUhJVWlxQWhq?=
 =?utf-8?B?MGxieXcyZGJxZjEzekI3dDFubHZGM0FXNVo2cExsU21oVE5JWGtYek5Qb29v?=
 =?utf-8?B?L0w2REJhMW5lcXlVWGYyeEV5Y29NT2d5V2lOUHYvdTBWUi9Dd3JBV3hOQitx?=
 =?utf-8?B?aWdScS9ydG5YY0xHMEJVdGw5ZVBFdzdlVGY5czlTVWVEV1FPeE5lTUNsb21M?=
 =?utf-8?B?dXhLNS9IQnVNcEFSN0pQWUNMQWNBL2JuaXNzZ2MzdytxK2kyVmVTN0VWa3dl?=
 =?utf-8?B?Ym5sSGUyaTdiZ282QkJ6ZjFvRmtwVEQyYXBaMFI4MEFNZ2xzZjZLbjhBU2Ja?=
 =?utf-8?B?VnFidVNodGM1UGFuSVAwbDByZDdyNldhZitOZVpYWmpYTVpsZUxBS3RwK2hF?=
 =?utf-8?B?UW5hSUZ1N042aWRhQ2l0VTV2dTY2MFpNWFhOeXVTVTBoTG9aWFlocEt3TlFh?=
 =?utf-8?B?TllCaFNlSU4raytEYlVoNloraWZEWHJRR2NYUVJYcjgrN2dLVzB1TlEydEFa?=
 =?utf-8?B?a2pDQ0g2MCtSSTc4YitlY3paM0Y3T1RLTE5LRE1yUlZJSkp0Vm1hNDlpZHF2?=
 =?utf-8?B?a0JEZ29rTzZnR0M4SFcrNXpjNE9kc3ErdEVHc2lucjlnei9XMWU0U3NvOGlL?=
 =?utf-8?B?NERzMjhteW5uSjFPblZjNnZOWnYrbnVoTjIrMkRKUXArdm16MlhNRWZ6WVdt?=
 =?utf-8?B?SjJXZ3BMRGJ1cEVoRGVlOFdqbjk5TW95eDhnL2NHeHhZRXpuaFRwcFJnaFJR?=
 =?utf-8?B?NTVjWjVRaC9RaXZtOHJKQzQvbnNnNGFFR2NIb2dTL0lNQ2FHaDZmdzRGYmdQ?=
 =?utf-8?B?ekdHaVdMKzQ2dUZKcHBYcXlnM3ErSTloaU5WeUszaENBeHJwakE2ZGZJSDJS?=
 =?utf-8?B?dThuVzhVOHgyUDlrSENiRFpBbFZWQXA4VjV5TWJxdHkxQUdrYUZCRUFaMDln?=
 =?utf-8?B?dG5WaE90bC81d2EzUUhqNDRkb2EzemtPVVRHMnNNSzFqbTk0M0wyUFhrcHJF?=
 =?utf-8?B?c0p1a1lNanV3cENZWnRocjgyWldSSXhNS3ROYXAwVDJqNjlrbkMrMElZVlBD?=
 =?utf-8?B?WTBiT21US2MyVUwxWVlKd0hNUjJTZExZZkRnWEpWSEFYTVEybHgvZTR3d3U0?=
 =?utf-8?B?dWlibVhyRWRQMjRMMElQZXZCRWovYnJSUlJCT0Naak40eTZLYllhaXcwRHgr?=
 =?utf-8?Q?dpQ7kErY3REAWhE6qW+ohJSGwbUoBI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVSWHJQS0I2NUVuajkvVkVMK3RDN04zckxIWkhOemloRWtwZk5mcTVIUUhG?=
 =?utf-8?B?MU9DSUp5T1FQZ3N0aThycjNJSS9VRUVHTGFLa3VORnFFVlFyRG91RU5kSmpU?=
 =?utf-8?B?SDViN0ZkL2ZzUW5oSjh1dHcrc1ZpY1c3TGM1WnRNb1NoSGorNzY4RHBTUmxR?=
 =?utf-8?B?Y3BJNVgzNmNPRXNEajRSOC9CZThKWi82Q0JyWHpjVEx4R25peUdmdVNHSWV2?=
 =?utf-8?B?bkJiL2M1R0dvQ3pQZnZKb3Q4aTg4MTEzQlU5UmVYS3UwcllhNWt1Nml3N2dq?=
 =?utf-8?B?d0ZDVkFUaFRMV1ZpR0tTK0lDV1ZZY205d3hFTHB5b0xvQ1RiSkNKRk45ZGF0?=
 =?utf-8?B?TkZJODduM3dyVXhUNVMxMjNvenM5RFo4U0tscVhXdnRxb1BmNExYR3U2L25G?=
 =?utf-8?B?ajlScklWYUNOaFFHMVVLSm5vUlFLQ0ExeVRnYWRMMndBQzRFY1oxQ3Y2dkxJ?=
 =?utf-8?B?RlQ3eDdFL3JoRGhVWEhtL0lYTXlDQnlNVUd6NkNsaWZiSlhYbkZiYUk1TGFm?=
 =?utf-8?B?WVh2K3JoMVRDODFtbTl5L1luUTYyUk9aRU1aeVllMVF1dzFnNTdDM2x6TnNh?=
 =?utf-8?B?QW9ua1N5cjRPRDk0bDE4azhINkoyb0ova2traGgwMlRMRHBFL3lOZjE3Ymhl?=
 =?utf-8?B?bE9NSitBU2UzaFFzT0Q1ZFBEV1FYOTBOT0svZUFnS3AvY05YNkRpZjV3c0hE?=
 =?utf-8?B?RzdiQXhNenZ5M2N4endmSEE5d3MzWnQzTGpPMzFsQjVYN2pUeUlHQzdDZXlR?=
 =?utf-8?B?MHU0dmxrU0NxWFdFRXFjYkhSNlZsTkRIS1ora3RNbytib0JQbzB1M25pUTNM?=
 =?utf-8?B?UncwaklBblJnUndXVEY1T0RLS2wxSFMzQXRwU1RnL0thdHIvSDB6K2VIbGox?=
 =?utf-8?B?cDdlRnFva1ovcjFPckw4bW9QTDJJUjhGUnFYQW91TmY4NVVhRGZKbDJCUHlp?=
 =?utf-8?B?SGl4YWpoeHRtRXRPR0NsZTREQndiaWJrSXVDU2x6UE9GRmtXZk9jTHpqYjVH?=
 =?utf-8?B?b0VNM3dDNDhpVi80TzFvNy9vNk4xWmRsdHZjRVJBSWpiekdTbDgrd1l2TEsr?=
 =?utf-8?B?bnpkcFNWbjFZbytrRDBGM1NhbCtFR1h5VUQ5REFBUHl0aHNYbjJGaGJxa0g0?=
 =?utf-8?B?UUZqblI0bUExbW5TZi9NOXNWNUFNU016UGM5YmpRMlNEU0dmNjBEMzZqN1Jj?=
 =?utf-8?B?NE1hYjBFektPaHM3bGFaVFRsRHpiZjY2cVNSK2hOdWdkS0RuQkM4QkRZY0RX?=
 =?utf-8?B?bkZPaXd6Skl3N3hCN08yODgzVXN4YTJ6cmN6aDR0K2NJRnNNRElxMCtSMEh0?=
 =?utf-8?B?dlpGaTBUeTdVRThHckVuLzl2Q1ppUVNLbzhmNmViTzhUdm0xUk1ZM2FQWFh1?=
 =?utf-8?B?TnRiT2xlajRIN2ZrcTZRdTVtSzhjZFlCR09aZWhHaE1yK1ExSnp1NEJOZGk3?=
 =?utf-8?B?OXhVQXFibERtUHlNVUFrV0ZuQU5WaktPNGZkN29KdGg2Q0JoOHdYZitwK2VG?=
 =?utf-8?B?OEREOUtUNFZNSnRLZG82NUcwZ2YwekNKZlUvalFCOHlNc1lkOWdXSkw0SDNT?=
 =?utf-8?B?TWJkSjZ6d3JJVXk1cERZR3NWQW84d0V1dXdiYkJZTUZVcWw3d3lva0ovR0RC?=
 =?utf-8?B?clIrQnNEaXZScFJkcjZlRExuL1JyOWd5MUI2U1IzZzEwVUVJN3VaUDEyN3lp?=
 =?utf-8?B?cFBPTGs1TDhaMzV5MWFkVlRCSHdhMnJOTGt5SFRzRjQ2UmZFTUhsVldGYU1y?=
 =?utf-8?B?elVyTnlaK29pVW4yek1iL2Y3c2t2MjQ5Vk5lMm1ZUGhHbVFFY1loR0lPVGlL?=
 =?utf-8?B?NjJJVXRFb3U2Z2cxWklqZS9lWm1vM2JVdi9GRmE1Y3drTEEwMWlnUmRLbyt1?=
 =?utf-8?B?MCtremlhTUZKSWdpZHoyOVA4dHhBUC9sM2VuelJMOGNqQmNHRC9Hb2lwZWZT?=
 =?utf-8?B?WVlCNHlkN2ZtWGo3STFPby8zRlBpRGJCZ284Q3JXQ2RuQ2owb1RuR0pMTVNH?=
 =?utf-8?B?Uk5UVkZueDh6NnhrMk1sZ0x0d2F4Wm9DZ1diRXZRdVhOZll2NTVvVGR6OVY4?=
 =?utf-8?B?aXhVNnRtRC9VcXVWZ0YzSElrUll4ZnBwWVdVSVFhY2F6bHdqYlR5THFwZXVj?=
 =?utf-8?Q?Uqn8W39ESFF7WSXNNB8QVY2h1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06433ec-cbf8-4369-7c16-08ddb3ab7f65
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 05:45:31.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h78cf7CE76ofrfIOYcUNKBe1K+e6R7Hs3zaHx/p0NZTPTvawxc5nNyTQ0ZNmIx68i6KdKIiHq6Gmx3MTaGRKzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592

Hello Li,

On 6/25/2025 9:15 AM, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Currently, the SMT domain is added into sched_domain_topology by default.
> 
> If cpu_attach_domain() finds that the CPU SMT domain’s cpumask_weight
> is just 1, it will destroy it.
> 
> On a large machine, such as one with 512 cores, this results in
> 512 redundant domain attach/destroy operations.
> 
> Avoid these unnecessary operations by simply checking
> cpu_smt_num_threads and remove SMT domain if the SMT domain is not
> enabled, and adjust the PKG index accordingly if NUMA-in-package
> invalidates that level as well.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
> changelog:
> v2: fix wording issue as suggested by Thomas [1]
> v3: remove pointless memset and adjust PKG index accordingly,
>      as suggested by Thomas [2]
> 
> [1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
> [2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
> 
>   arch/x86/kernel/smpboot.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 7d202f9785362..4b6daa1545445 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -494,13 +494,29 @@ static struct sched_domain_topology_level x86_topology[] = {
>   
>   static void __init build_sched_topology(void)
>   {
> +	bool smt_dropped = false;
> +
> +	if (cpu_smt_num_threads <= 1) {
> +		/*
> +		 * SMT level is x86_topology[0].  Shift the array left by one,
> +		 */
> +		memmove(&x86_topology[0], &x86_topology[1],
> +			sizeof(x86_topology) - sizeof(x86_topology[0]));
> +		smt_dropped = true;
> +	}
> +

Instead of this memmove, wouldn't just passing the "&x86_topology[1]"
to set_sched_topology() when "cpu_smt_num_threads <= 1"  work?

Something like below:

(Only tested on a QEMU based VM)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 3818b16c19e1..1793248d28cd 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -494,6 +494,8 @@ static struct sched_domain_topology_level x86_topology[] = {
  
  static void __init build_sched_topology(void)
  {
+	struct sched_domain_topology_level *topology = x86_topology;
+
  	/*
  	 * When there is NUMA topology inside the package invalidate the
  	 * PKG domain since the NUMA domains will auto-magically create the
@@ -504,7 +506,15 @@ static void __init build_sched_topology(void)
  
  		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
  	}
-	set_sched_topology(x86_topology);
+
+	/*
+	 * Drop the SMT domains if there is only one thread per-core
+	 * since it'll get degenerated by the scheduler anyways.
+	 */
+	if (cpu_smt_num_threads <= 1)
+		++topology;
+
+	set_sched_topology(topology);
  }
  
  void set_cpu_sibling_map(int cpu)


>   	/*
>   	 * When there is NUMA topology inside the package invalidate the
>   	 * PKG domain since the NUMA domains will auto-magically create the
>   	 * right spanning domains based on the SLIT.
>   	 */
>   	if (x86_has_numa_in_package) {
> -		unsigned int pkgdom = ARRAY_SIZE(x86_topology) - 2;
> +		unsigned int pkgdom;
> +
> +		if (smt_dropped)
> +			pkgdom = ARRAY_SIZE(x86_topology) - 3;
> +		else
> +			pkgdom = ARRAY_SIZE(x86_topology) - 2;
>   
>   		memset(&x86_topology[pkgdom], 0, sizeof(x86_topology[pkgdom]));
>   	}

-- 
Thanks and Regards,
Prateek

