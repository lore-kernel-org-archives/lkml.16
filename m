Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6861A0BFA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537629; cv=fail; b=mjH/Z2AhBvF8zbgx3y26euGX5AXoS+ZuCiYKHHm8a4wrfRHf+Te0d4KDK/gFuNtJLptiLMk/K8neKDUK/Rp8VK6L2PU4dlzf671rMTF7tPvu9/z0/ZYYOE6Cp7bwOyxt9CAnpEfTENUKoAnhlBb3lt4JIGcRylrhvlrlidqtL+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537629; c=relaxed/simple;
	bh=ygZkN1MPqh7SsdgVsy5X7mJt/e0Gw7MqncwrEDmc1j8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IO69CcQ8pS1ivsASoDNegNsHAUE0x/xxhH+Yh3qE6C42/w86lV/cKHXONvR0KVQ6D8/dAGS6zbaFX0S+nCfB19mkGvYBl7qgocZUIxXn6KBPfJXE+VOFfk4Az/VJDkFt2ncflNOU2sxEpXrNFNepd4nHHAy5RKav2coCC5uX6do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qRS/0ScM; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qRS/0ScM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPKvkYkzPc+HW4CYUSdj5aUZJW/6bRPR+M3aAPaX+U4HwKezIG0vbeevH2/DtavJ4iJCJn568KIOSDKc80Uw7mlyYcR5NXKEFg18q0dAOi+6d7RzZlXfMVz9EKQrUoCrKoilCHu0a3uu6DOrel8plA83lS6jpAUzwkr9SoakvJliLw5FfosVDGm7HXSeAr1AUBYCLBLsVsUTToXhihSMESVfdnlvmHBUHMBs4BALVyzZUulKmwM+4rS24ApAyySxS8PoDTd5mC9bA8lc+i4FYyiJlGv24poivaVGkpWC+ngFNFlb4RhEBd3Ec646e0Z8m+K1OOzDwmcbFBKFICoPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRdcxlSs5dQUD5hFtUiMF9zzCOfUOZMeTVJrkBnl7Bs=;
 b=d+4VM1WXi9hETu570nRJJdx7qDLvrptppajIdgmnarekGV3FEExD+XUeOdZpLgM8E5m94GgvBTGcbhlyXcGiqrGTnfDHrQDgIJgZuE+35KpUkNkIGoatr+gJGNcvyxqdt5tN1wuBKCvQoTGzz3Q4pDVbQR9pkpO+LiV05CA379aq0VMm/fdj5H+I24LMbLsBgV1nI6Qj9K6FZdBRHDa3hTtTGfOMJrFngQLeNMkzy6rtUyQUcTi6DDLLW6brhFvg7dCT7ov31YT+zz6/ph+Gu1gZXodRwq7Gay93/0NaV8vdAhHJpY5/n1MZ/1ORUQ0A+mKpTkYb9FIPo+WUmW22kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRdcxlSs5dQUD5hFtUiMF9zzCOfUOZMeTVJrkBnl7Bs=;
 b=qRS/0ScMKRq3UXM8P3tScAQodlhWF0BXCOboEY9huSBizT4oLzdnSuE8fCzChTQ1yZKf9UJ8xXFl0JxFnl5ZVje2drwlzSL2sbmoZsyn14QI3+lXyu53+Kaw8jx29pAO6Q7LNrLnMMddVYMJG4Od3cAfNLLHip3asAdYxX6+Qt0auNlxkayXxlGP2X8V8Pu8ijkQE1Zf2j3bmoIlx2yLUB7oj2EKYn9svu4yQuwZQBK7FXz8oXe3lryY5EPkhxLX139jB7LKDCwwDsXiRV+YRkEW9Jj9vwWF3fEvGSlf27od1dnDebbvoGCi6FilONi9woE0YAYuKYYU/AoJF7sGQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 06:40:25 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.8792.036; Tue, 10 Jun 2025
 06:40:25 +0000
Message-ID: <6eccc2a1-195d-4e4e-b227-a0a372064737@nvidia.com>
Date: Tue, 10 Jun 2025 16:40:21 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory-tier: Fix abstract distance calculation
 overflow
To: Li Zhijian <lizhijian@fujitsu.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Ying Huang <huang.ying.caritas@gmail.com>
References: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 42384e2b-9789-4dfe-6f6c-08dda7e9ae63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHZpczVOWmhySXJmdVpBVUc1aWhaTEJ1NkUxWkFKSXpWWFpxTzdZSGhuQUJm?=
 =?utf-8?B?M0ZVcHhZZysyZnM2RVEwRWdDT0ZKTit0SGlGbTJOR05kMzVDakJ1TitWb3Ex?=
 =?utf-8?B?Z2JrbU5aTW1kbDB0YzE4dndBZGxuN3hSbllLQmZoa1JITEc3SlNvQkVkdzdU?=
 =?utf-8?B?Vi8yQWpMbDhIQzFaVVRKNUNXVk1TY2VXTDlaUm1ac2xiR0VJYi9wUW1hQndy?=
 =?utf-8?B?RmVXbWQ5WjJGMWt4Z1VDcTZhZ1Jkdmx6aUhyVHF6dHJqdUFQb3RmVXB0TmFr?=
 =?utf-8?B?UngzWCtnZlU0ZlQ0NldvdkgvNlVUTHkxdGZQV3E0T2ZmVmFhTXhwcEFIdWcy?=
 =?utf-8?B?V1llTmNqYXFFTExYWDcvTG9GNDlyYmcveGZxeGQ3dDBLV2VTMkFyenM3a0pk?=
 =?utf-8?B?MHUvLzliSmd3b1BibVBaaHVVcnBXdEVtM3ZBbFA5WVJncVZNYkhTbzMyK3pw?=
 =?utf-8?B?UnlhK2tyNWhUbVNRY3YvUHhWejF6OWpGQ2xsREREcWc0MWpib1cyc0ZGT293?=
 =?utf-8?B?bFZWeXA4VzJYWjBoWHNIM3JBUm9ZdGVpS2VNY1NJQkVGMTl0UE1MTzd5YXRG?=
 =?utf-8?B?Z0tsSGhPRGZ4S0VIUVd5R1IzeGE5WkYvUExBWUtuUWoyWFY1OXNCd2UxYUti?=
 =?utf-8?B?dU5WMGU4S3BDK3pzcDBBZnllN2hBN1Zpa202d1FDSTVLR2s0T2R6clJhSzdF?=
 =?utf-8?B?di9DU1c5YXFWeTdCbmFsUDJTYXY5MDNvYmdNcEtyais2TVhNNDFxZVVleUJP?=
 =?utf-8?B?OXVwNkpHUDZsS0lSZUpxbnIydmxFSTR0azhOaGtoa0JiaGhlL2FESFdMRUEw?=
 =?utf-8?B?M0VoRUdPYmM0Y0hJRUhQQjVpSnpBaXRROElFTjZxZ2Zlb2IzR1hjc0RLSXcx?=
 =?utf-8?B?enh4dVFzQ3MyRWlZdXFVNU1IOVZQTDllM0htQ2dVY00wSFl1c3d3K3BBczlz?=
 =?utf-8?B?ZHl2KzNOVy9Ta0ZJeGRpbzRLYmV4UmJySmNicHNYMUhySUNDcFMxOVRIUTNm?=
 =?utf-8?B?NUQ1WUpTUEFuVC9Scm5aYTF0cFdraWdXMVlOamdTcVFOeVNJazJoWnhld1FK?=
 =?utf-8?B?ZWFXcU11Y0x6UHNtbklNNE0xS0diczhmOTV5M0t2WktZQ0pyQUhuUURSSGsr?=
 =?utf-8?B?UUx4Q0EzRytSdjRtY05WV3dYWGQ2Wlp0a2xaS2JsTGxqbnhwRUh0TXVMckJ0?=
 =?utf-8?B?ai9JYXNyUExGUTRHRUhjM3dwUDZLVVN3NzkvZm9mL0lIUWdOWFpWcDdtd0VT?=
 =?utf-8?B?bUpvL1Y5MklKbzBZR2xVaWVCUE0zZUVqT1hBTEEvMjZhVlVjQW9XWVlNU2o5?=
 =?utf-8?B?VnZRNGVKUEVJclZXZm1xMENrRFROcXUzdlRORXcyNkdVNU9ZWTZHbHUzVWVM?=
 =?utf-8?B?VVJHalBlNFZ1Vmpna0pFeDdsS2VKV0ZRWFluTjZjTUNXWDRiRFhjMDJnZUdl?=
 =?utf-8?B?dVpsSnhPWHI2dDNUenNmTXlhb0p1cUVvdkc1bFFRVjhkaWNlM2RQMVViS1Vk?=
 =?utf-8?B?ZU4xemI4cUMwZkJISElCVi9sS3FDNEtIUnowZUJ6RTBmeHZNZHc5TVplaUsy?=
 =?utf-8?B?Z3NHbUxtVmY3M0hzOXc2cDJOOHdHODRreURlMldGYXkvR2ppK2hNbkcxSXZ3?=
 =?utf-8?B?Y2NQUVA1VE5YYWgxSjhabUNOc1N4Yk9aZkttYlQ3blZuVGMzQ0tRdFltVG00?=
 =?utf-8?B?OElLaitUSVVzSUhYSzZWZ2d1R1Ezc1lLcUdXY0c1Q2JsOGtXekg5YS9ybHY3?=
 =?utf-8?B?YUNOaG9hbEZjVS9SMHJ6eFFtenB1MENvZFJLbjR1MUJNY2ZtLzNvc0NuemtI?=
 =?utf-8?B?MUNtbVl4bGJSWjB5M090d3Fuamg3ZTU5WWVjU0dUcXJ3SGt5WTJudjBObnAr?=
 =?utf-8?B?YTFBSFBmd0lYSldBOEt5WFNudXEzMC9SMXlGQnRhbTc1VkRoaURiRG9KbHp4?=
 =?utf-8?Q?3fpgROoURrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ExWEkvUC90b2VFUVd1Z0lFZXQwWS96MjZHWWZLcHVzVjJiMW41QmFiQ2Jr?=
 =?utf-8?B?ZkFTbXRUUjZ6bmlsMjlScU9WbEFXbEd6emZvWEF6amVFSUFPUEVDcFIzUXBh?=
 =?utf-8?B?ZEplQ2c5aVFMQW11Ty9RMUx0OERvVmZwWTlTeFZTOVJ2ZFk3N0hzMGtoLzg3?=
 =?utf-8?B?RGx2bFRvQlRYU2hpQktaR3gxTFZYUzM0MHNLMnFEdHQybS9ub1VYRFRYVVNs?=
 =?utf-8?B?dmhkTnhwT2k5dStaSndRUDZiTGI2SGIzUVJocklUK2VqSEYyOE5BVHJMMjUz?=
 =?utf-8?B?dzJWbUM4VVlYL2dUVmcwaENxdkR5NTdaOHBSRnFleWtlN2JEL0RaajBqMU01?=
 =?utf-8?B?blV2U1hQb0duTDZiYUFITWR6cW5Ed052bzBiVlpwN2ZWSmw3azZxS1pWMXQy?=
 =?utf-8?B?UXNvbXN6NkxyOUl1SGRTNkV2Mm9rRHhXYWcwWTNNZm9qNlZKQmMxM25jdW9G?=
 =?utf-8?B?aURFbU9jaG92b0lHSkFMNE9yaXQ0anNlK3ZMUVMzR3ZGRllER1g0TWJkbEpP?=
 =?utf-8?B?ZEN5NmlLTHNnS21ZZmJ0dEVnT1ByUFVKTU84U3NXanJHNGNBcG9yVDN1anNE?=
 =?utf-8?B?K1BNbWluR2tjNDZLV05zb2gvQUNER3VIRFZtU0N5WHhzNFFiY2xaQWVsZW1l?=
 =?utf-8?B?T0RWcWRhVnB1VGlQdHhHZ3dzalZCK2U2QUNMak1TeklnNFkyRHdUNk5paWp6?=
 =?utf-8?B?Uy91Yi9hRHlETEszanMrMGY3b3k5US9yQjYweEpIVGE4bFNYYUFmTU1RL0hq?=
 =?utf-8?B?aWtqSDNnSUlqclJHckxvZk9jTjI3cGtRR0l6bi80NkFYS0tVbzQwM0d0REVL?=
 =?utf-8?B?OVhSZ280MmMwT0ZSckZiK1JMY1hIaVZxM3llWWJ2K05FZjQ0WDVMeVAxblMx?=
 =?utf-8?B?dmk4NGMySXltaTRFcDgyNWFOT1QwQ3pJWGlGSTdZLzZSSGU3OWpINlBvdG5o?=
 =?utf-8?B?N1NQOU0zYlp5Uml4MnYvSzNLa2FuMEZMNFMvTnBINGFUbmpLYzdySmNrd1du?=
 =?utf-8?B?OW9tMnp3TUJHNnFrQS9ybEJnd2pxTmcrVjlQMms0M1BzeUQyeGhkRVlhT2dE?=
 =?utf-8?B?SUtWN0U3OUU4bGs5c1ZxOUNKMnYxeGEvVUZtRWp5SmQrS3dhMk01eTBKOEs1?=
 =?utf-8?B?azFSanNKR0pwRHBoVTQ5eHlKNE1hNDlHNnBVd2ZlYmlMQk1SOVBuRFlpNmhX?=
 =?utf-8?B?MzZINHgwRE1lVnl4aDR4RThlY1FrNDU5Ulk4RFA5NlhmRWdXSER0dmZMU1FU?=
 =?utf-8?B?VFFJMzVpbSt2ZnJWZmJwSlgxUEhNTVAva3FkVVdNNVFIVHA2V0J0d3lhMVpP?=
 =?utf-8?B?SUFxK0psT1REWnF6U0pXUGFFLzVzS3JFQkJvVDBkMzhvYnlKanVhZFk2OVlH?=
 =?utf-8?B?R1JuL1d3b3FoZVBlT01ZZVdGa1ZlaVdZRG9ST3BEWCtsYWU5cFc4YXFIZ0di?=
 =?utf-8?B?UGdhTWdkVTN1VXhSQld1Y1VxSnoxeDFYeVJrRGFPaEt0NzA4amJjRTA0V3k0?=
 =?utf-8?B?bzRlV2VkaUlwaktZejV3Y3huUlZnQ1ZXa09iSjY3czRhU2RXUHkyWkxYS0lW?=
 =?utf-8?B?dFRFTjRuMkNNZXRja1V5Qm4xQ2hBVlk1b21iRkZpYzIrOUU2WmwxNG9sM21y?=
 =?utf-8?B?aWVyU3gzNVpBcTkwRHIwTTY3ZmxobmlVS2VReUIyZDZRQ1k2MmFjazVKeWs5?=
 =?utf-8?B?QVBJeVgrRVVTUFFqUm5ieHlRZzdzaDVSeG5yZ2xFMXpvL0dLV3E2NWJyYlkz?=
 =?utf-8?B?R3dzQkdMM1hqZkxFUktscWRzQk1FaWdYSXhqMlpaVnlQM25WeTBPSzJWMmFS?=
 =?utf-8?B?aURSYUtxbmFGRkl1dXc0aHl6Wkc5ZXFlbzJjSklLY0RLOTBOTXJOSCtaVko2?=
 =?utf-8?B?enN3eEIzdUtXQkxCK0d6L0t4WHA0ckFHcXBGdTRlTWRoS042ZFUraFVPcm9P?=
 =?utf-8?B?NTFRSWFDSWhQVnExNkROOUJaRUF5WHJqbWdWU0piK3RhTWZPN2lOd2NhcTRo?=
 =?utf-8?B?UHhNV0dSYzROSEZlVTc2VDVmQjNpY1g4eC9Tb2RacHdjMmJ5bjl1OE1NU3Bq?=
 =?utf-8?B?cjdwdmdLVWE0QVVaV3J4OXFSemRYYzYyY1dRWmxKRDlERDRLQzcrMHA1UStQ?=
 =?utf-8?Q?a1lf4I22Xbul3ajGAx6hU9QGB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42384e2b-9789-4dfe-6f6c-08dda7e9ae63
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:40:25.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOTyx+JCO37BDu0fn1S4bK0vvLCPySolR/y6OgDHC89f/Xh4KT+/xM3VuKxw5mNraiaXL5MIQhWFl7jO2nT2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829

On 6/10/25 16:27, Li Zhijian wrote:
> In mt_perf_to_adistance(), the calculation of abstract distance (adist)
> involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
> ```
> *adist = MEMTIER_ADISTANCE_DRAM *
> 		(perf->read_latency + perf->write_latency) /
> 		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
> 		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
> 		(perf->read_bandwidth + perf->write_bandwidth);
> ```
> Since these values can be large, the multiplication may exceed the maximum
> value of an int (INT_MAX) and overflow (Our platform did), leading to an
> incorrect adist.
> 
> Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
> 'L' suffix. This prevents the overflow because the multiplication will then
> be done in the long type which has a larger range.
> 
> Fixes: 3718c02dbd4c ("acpi, hmat: calculate abstract distance with HMAT")
> Cc: Ying Huang <huang.ying.caritas@gmail.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>  include/linux/memory-tiers.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/memory-tiers.h b/include/linux/memory-tiers.h
> index 0dc0cf2863e2..7a805796fcfd 100644
> --- a/include/linux/memory-tiers.h
> +++ b/include/linux/memory-tiers.h
> @@ -18,7 +18,7 @@
>   * adistance value (slightly faster) than default DRAM adistance to be part of
>   * the same memory tier.
>   */
> -#define MEMTIER_ADISTANCE_DRAM	((4 * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))
> +#define MEMTIER_ADISTANCE_DRAM	((4L * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))
>  
>  struct memory_tier;
>  struct memory_dev_type {

Acked-by: Balbir Singh <balbirs@nvidia.com>

Balbir
