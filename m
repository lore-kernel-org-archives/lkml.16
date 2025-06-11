Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B1235BEE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628569; cv=fail; b=PF6mTvY6fCGwbQ0405y7jcWXndwGsH4/NsFket3x9NYQUX85t+l/fUQc/jqacXMvFGWrJ098ub5bQI6ZKZAwuWJM6+OLQRqzi25bM45lMk7yC52kAKhnGQFThau9Gy5o9CwPl8Jw8h2583uEFDPklqZwiNIiUl/Hdep4acIy5E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628569; c=relaxed/simple;
	bh=ygq9jH6tc/Q2PgYWF3ALmeIF1uAgcNNaL8ZQLoLyobQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u+2wLALhhfm5Z5iwuW9PvPx0/b7b3eizPdraztwd8JbLSonydFP7leCKCAOK2XBNWAh6O5ecuGayBO+dqsup/EwReuVBEKuMBmUd9pNUbQhGdyvauD1djVXCxgS248R2Ahf1ThWhYMUEF50wBw2rpbkF3do0380xeQQz+j2o7yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RGbboJgu; arc=fail smtp.client-ip=40.107.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RGbboJgu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJs1XDHrEp1uOVGkXHYfiVMIp+tqBNTdt562pctWi+HisCavnxxGXR1YtAEzMAx7w+TzbFFZLwHFt92hAmZHf70eZ+ofQfL1THjlw1YI5ZY9c03bHKDvATiyF14+2q+PmEMRfcTpC33I/sFfbX/OuiVEJYyz60DSuACeqfbvVkdQGC/YtgoQswRT6iz5T7pbmW4/uwo0hsYSIEXtXB3hjT0gOrNAscdp8KP5xKJ8bFxpswcHv3N3W6u7nZkIymRTqwUEy/Y1jQVFQG8s992yJhIfXJ/PCetq1qlrHxsyZxg9FrTTnqGf6TKBAv5pJ9BtQf8GnnlY4ljrVsqniv6dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aALBqwHK/RISEpIv2kcBscer4u16Zr9KGCz8vdbn/TY=;
 b=yh63Iqv/tjKtA/52XuOeUiXbsaB5yTg3XsR9QTRemFmpa8Y2zwu8s7gJH9mxNV4lzPXgizhRu0ZCbf7f7g0Wd3canx6X8kDW8MNKXCqhOe9NsEVpNaIpdPbx/AVj1bhnFzuRx/zHcSGRygSRLJHy8Ccl9zSxNopnT+molD1sKEwwI8qGB0YzQ4br1SF5/HkIZ+Jj8igd6xNl/v7QRJz3QNVw3kIlLNjBc5DLgxcvy2WG+Mr80c8YZcZnTJhkysYAg5TAmpaGL0UG3FEbUG1mtROTFYQjnKkv6mawVuvnDbfC1Q3dZdDqis2rKOT4kOgHi2fXRpp/t+O6mYAc5dnjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aALBqwHK/RISEpIv2kcBscer4u16Zr9KGCz8vdbn/TY=;
 b=RGbboJgunzM0KHm8H6chrz5i1XcZ+MQ/E1LW7YG/JkKgmCiTdsjlF30PlGO4e8/7aCKaX2LMAXL+31CLpDPV4DLW0jq5VQjYZEyjNjLCk8XwOdZjUseE6OY/xeT3/XQP6lFoLbCnTLjCwTM/W/U7UXbvuFJ/2Krq6NMAkpocEqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 11 Jun
 2025 07:56:05 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 07:56:04 +0000
Message-ID: <ba26fba0-f623-4857-8a2c-6c7d0967287e@amd.com>
Date: Wed, 11 Jun 2025 13:25:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: Drain PCP during direct reclaim
To: Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
 vbabka@suse.cz
Cc: surenb@google.com, jackmanb@google.com, hannes@cmpxchg.org,
 ziy@nvidia.com, wangkefeng.wang@huawei.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Nikhil Dhama <nikhil.dhama@amd.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>,
 "Rao, Bharata Bhasker" <bharata@amd.com>
References: <20250606065930.3535912-1-mawupeng1@huawei.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <20250606065930.3535912-1-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::31) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 0483d3d2-05d3-4be2-e31f-08dda8bd6a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWkwMFVaMEo4VHJST09pcnhnSmFkREp4UFcvd0NaV1JJRE1iOVBHdmd0aUtC?=
 =?utf-8?B?MVpkMTl5YU5JQWtVNDBMRWxNSEVWejJHV0x3ejgwTWwzWEFRRFU1QnZ1N2dQ?=
 =?utf-8?B?cjdOVkE2WTZxNEFmTE9jMnZzdGNjc01NMUd2RDBubEM2WGVYZ1J0OUpoeTFn?=
 =?utf-8?B?bG9aVm1aaDY1Q1pETjNVT0RIODZWb2lqSDgrdDJGL3pRV0lneWJaTDM5ZnN3?=
 =?utf-8?B?emhEZ2tLZlZNcXAvZDR3STY5Mjd3cGU3bTBpUlNkVGo0WHBnbjU2c3I2RjBh?=
 =?utf-8?B?K3JoLzdWSm9JWE11ak5kYUhYa3BzVkV3Sk1pSVYrdTRBWWh5dGRZSU9BQUdI?=
 =?utf-8?B?ck5NMkxqd0g2YlhBK0RWdkljY3JnUHBPcUV2NzZmZERKYXYxbHVGQ3RuWkRm?=
 =?utf-8?B?R2tTUmxDTjhmMm43TkZYcG4rTjY4bWNVSFlxdk05ajRxMG1BeSszSUpMaUxp?=
 =?utf-8?B?L3I1T1A2LzVRc28waHJMemlBdUpZam4xeWJ4M0hGSzZhdWQxa2xwbXRpNHZo?=
 =?utf-8?B?WWZoc1djNDhzR1VWU0NFc2JDQXU0VmNZaXBXamZhdG1sMndXekMzV0c0ZWZC?=
 =?utf-8?B?L3p0dnJ2WWRhVXBEN3JLQ3JjeEpxTTFoVVprNTBiRFI2eS9rWi9yM055SHM0?=
 =?utf-8?B?NTFESnp2cnpPbEVicndHdEZYMEp4aWNpaXczTzFSblBNRWRoeGF4d3cvekk3?=
 =?utf-8?B?dyt0VHFXZG95MDhiUjRnTmFmckw3NnRCYkZrZzZBT0lsYUpXMTEyTlAwZkRB?=
 =?utf-8?B?U2RTY3pmODZIN2JqdUpKYm4yREMrdjk3SytqMHdNSGtiamtnYWF4YUtsazdh?=
 =?utf-8?B?ZXE1cnBjZHhleUFkR2FQVVZta1BJdFVmMEd6YXdrci9MeGJwdWlJZG1FTXAx?=
 =?utf-8?B?enNtNUpnMXpHallKN0ZXUmh3QUc1YmZKRHJrMDZQQ3FvNEYzN1Q3dElpanBF?=
 =?utf-8?B?MzVKWDY2VGF3ajNVWitoNjFMZVd0bTh5V3FCTUtoKzRhUU0rWGRqZHVyL2da?=
 =?utf-8?B?enZMSyswRnR4MG9sL1JDQzJrbXFVN2Q4eC9HaXdvYm1OZGJ1eW0zOGJLQ1A0?=
 =?utf-8?B?VURjazVvVDBlcnY5QXhYM21WM3Mza2pCZFQ3S3BrTTN2em04UjdHNnhlMEZK?=
 =?utf-8?B?YWlzbHRqYmczVG9IdThOeTdGbExnL1hPVENOd205dHExa3l4UndvYU1DTFVo?=
 =?utf-8?B?alRIMUhrZXpYWk1CbTVyaHovNGd4K0V2YmxjSTIzNy9ERnZxNTlhUzljTm00?=
 =?utf-8?B?dThKQXpnOWxFTEdmNVk2a3JneEpZMWcxYnppZHVHR2lzQ0w1OURvdDd3U1U0?=
 =?utf-8?B?UExackNLUDJBbXlVVjRWem5sVDRScVQzNnlrUlVIeGhqU09xRE5SMTA1WE1u?=
 =?utf-8?B?a1NMWFprb05TNXFPVGZlQ2F0SlY2VVArc01maysxRkZNeDBReEQxRTFSQ3dL?=
 =?utf-8?B?Q2h6aDhrOWd2UEIwdysrNWVRakFRM2w1TU1KYlBaQ2JnWEVnMG9CQ00wSzlB?=
 =?utf-8?B?U0RjTzFFYXg4emJnQWk0Q1ZnQTNZVVdrU0x0aHNZaVlmWVlNOEg3cnJNQ2Fy?=
 =?utf-8?B?MG5lYk5TVGJLb0MvcFVXdm1tUXg4bDZJcktHcjlXeUd0ZXlKQU5HV2pwazU1?=
 =?utf-8?B?WEdnMFFXVERlM3lERys3RGlNZndvekVmOTFoSE5ieHdmdjdOUmJ4RDA4eW0v?=
 =?utf-8?B?ajZtM0FOVGVpRmtoM2wwdER2ekFVWXhiajBITHBaekd5RmNDaFRaVVdNNGdL?=
 =?utf-8?B?Wk9PR2NSN1VPSmt0RG9QemREZDZBQUFudVVZK3VpQ2gzanVCVDdwSUJLd3NH?=
 =?utf-8?B?M05DclF0eGcvYVBXbEFoTVpKeVVQZU1UNHJ0MGtsWlg0VXVVdGplNHlPeCsr?=
 =?utf-8?B?MXJLc0NwMlRTZ2tnc1J6WlYrR082aDY1SDI0blVYc3dzL3VsRENsTW96dWcw?=
 =?utf-8?Q?SfBvA9/NFK4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2lwSGVoWTFUaC9Xc3RGQ2dYTXFWZGdZRmkyY3Byd2RjcFR1VXJ0RjVjUU9J?=
 =?utf-8?B?a1hia3hab3BlMkJOaUlzRnFyZDk1MTVXVk5HdHA0ZTcvWHpKT1RoZ0R1YjQ0?=
 =?utf-8?B?eW1lUGFwRkxkQWJCSHpCdytSczVVelVROGFOYVlqY2N2WEc0L1JvdVhXeWhO?=
 =?utf-8?B?WHVlQXR5VUxId253cjVJeDZucitGSnlRdVJ2NExzZThCbjVvMU5QUnpJMndS?=
 =?utf-8?B?YURHMVl6RHFESXlSUVdzT1BDYldSVE4xU1JKc2VQMzJVczZ3enh3c0ltS0Vx?=
 =?utf-8?B?WSsyUkZQSXE5aXdjZHNaVk15eEtibytjUUtNWUxqd1JxbXJsQ2lxalo4TDYz?=
 =?utf-8?B?TmZJTlljdVFtZmhiM3pwc3JDQktNSkRWMjhsSk51Y3Z3Y2FqRlh4M3IzTWwr?=
 =?utf-8?B?L3ZWZm1Dd3BHV2RlNWZoZFhySGtzREhQZE9JdVVnaWwyMHlUYnlNSEVLMGI1?=
 =?utf-8?B?YlUwQ0NkZ1VkS250NnFFTVpLQXppQVFXRlBSeVdpbmRhUUJQd0NPWUZCWnpj?=
 =?utf-8?B?UnRYVFlXNlc0VGFJVzRPMVI1clBWbVNRR1JPTlRYNDluL0l1M1BxV3VJTUR1?=
 =?utf-8?B?eG1GWHcwNHNLZ3c4NGZUWTBtVC9LRlJ4Y3FtalJPdkYzd0pHSFRXOFJ3dStM?=
 =?utf-8?B?bXVTYUFTb1JlcDU3ZmpFcndaMTJjTFloZzdNekRJUFlCeEVGSlZ1NlY1VCtS?=
 =?utf-8?B?YWxYN0RuZit3c1Y1VmhzeVZmdUY0OTROSVdpKy80ZENhRGdSemNuRlZoMWxu?=
 =?utf-8?B?VWlTa3EvSUlqMDZFZEphMVlTTkdMb2FZVTFUc2ZZaU1kYUpHUTcyTjd0aloz?=
 =?utf-8?B?aHVUVGVSOUZOYkRJZk1ncXEyMVlJdURydkJscFVPV2JIU3ZuRjFLKzc0TEJC?=
 =?utf-8?B?R3FmNktpVExhYmdBMHplUkVCOVNDWVgvRkJ3bzQreWhxbFI2YUlMa1piUEMr?=
 =?utf-8?B?eER1akJLelFLWm9XUTVGYVl2SzlFOWR2RUJQYWhudS8xaG05b0RIUVM0dDlI?=
 =?utf-8?B?Nlh2QTFLM244QURiUE9NSzMwOVJsT2ZRdWU3ZTg2M3dZM3E3VEs1bGpCcjhL?=
 =?utf-8?B?MDF2dFp4WDVIdVBaRG5DSFBtOGdRb09aSVRtMDJibUFBZ09OWjBVT291c3VY?=
 =?utf-8?B?eWQ0QVBsbktwNmhkdHZmeUF0OUlZSmF6emV1UU05LzBUU2JJdlhsL2x1R29w?=
 =?utf-8?B?c09VNU5xYzhlMFdqdWhhdVFMVTN2a0dpNDhNc3k0Y21YTDdOOHJxK2tncjdx?=
 =?utf-8?B?Rjh6THNENTNtYmxQTjUydHh2U0dMVTM2RmZBLzNCUXFzbmJPOXc3bXJsL01J?=
 =?utf-8?B?U2p2Sk10MkNKdmpydlNEaVpXdUdtYlpyQjFGZ1JRSXZObUdTcktUSk9vdzZS?=
 =?utf-8?B?NEMzU3FydzB5RUh0YWM3WmNuaC9vSDBJRlhlYzR0TXp2UDhmaVVXMkpiQ1lj?=
 =?utf-8?B?YXprZHZBKzFCRS85dWxRWFU4Si92WFF6c29qZVBFby9kSXJ6cTBHYnU2SWNL?=
 =?utf-8?B?TDNRT2hUTjd6NllFdUFSS21LQ3dRemhBdTZQaGFxOG0vS1pTK2tDVzhkY1R2?=
 =?utf-8?B?ZlNHN1ZxSGFWSkxmcElMZk5MbUVNTHpscVIzRjRrZjBSY2h4NXVWUjQzcFE1?=
 =?utf-8?B?Y01nUUJ5a3JUSlgvZmdtOEcrNUVoMnNaQlBWSUkwM3IyTG9zeCtEQ0tnUDd2?=
 =?utf-8?B?b3BOc2wrZkpWaFBIM2I5TmNxaU5maHBiQmNyQlFEVjhxaEdReklBSzN6Vjhv?=
 =?utf-8?B?WGpmTENheEhYZ0FWa3Z0Q1hOdGxmZFMzcUpWQVU0U2d4VlNBdGRIVGc5WE9V?=
 =?utf-8?B?V0ZYbVNQTy9HcDdPR0pLMmNNS1FJTEtubTdlRW5TbE12V3ZzSHJNV1JPdXlt?=
 =?utf-8?B?bzJuOTM0OWZZQ1FIOTFtaHd0QjdQOVF1N0V1YkV2V2RJKzdmZ0hlU1VBeWVY?=
 =?utf-8?B?RFE2ZDBxUEFVK0VVVndKSkE4Wk5qTVFDOE0veW8xMjJtSGlucnZ0cS95Q3Vt?=
 =?utf-8?B?Y1c4ZHVRc0swTW41VjFWK29vR1pqVllDSkFObG84MGtKaEt4RTJmZEdXSFNa?=
 =?utf-8?B?QUhJTnlRWVVWNjBITDJPMDZCM25UQy9FelZWTDZDeVk4VnNabDdnMlFJeWdW?=
 =?utf-8?Q?t857E6JXETtghr5q/raknd6h1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0483d3d2-05d3-4be2-e31f-08dda8bd6a3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:56:04.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtahwOjlr1RbqZcxnWc0pb31Lq3nv+zB2oiic0uzpqKHvwDDxBvNV4BqRvdRKspJxkaP7WLSXG1ebydePTafbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660

++
On 6/6/2025 12:29 PM, Wupeng Ma wrote:
> Memory retained in Per-CPU Pages (PCP) caches can prevent hugepage
> allocations from succeeding despite sufficient free system memory. This
> occurs because:
> 1. Hugepage allocations don't actively trigger PCP draining
> 2. Direct reclaim path fails to trigger drain_all_pages() when:
>     a) All zone pages are free/hugetlb (!did_some_progress)
>     b) Compaction skips due to costly order watermarks (COMPACT_SKIPPED)
> 
> Reproduction:
>    - Alloc page and free the page via put_page to release to pcp
>    - Observe hugepage reservation failure
> 
> Solution:
>    Actively drain PCP during direct reclaim for memory allocations.
>    This increases page allocation success rate by making stranded pages
>    available to any order allocations.
> 
> Verification:
>    This issue can be reproduce easily in zone movable with the following
>    step:
> 
> w/o this patch
>    # numactl -m 2 dd if=/dev/urandom of=/dev/shm/testfile bs=4k count=64
>    # rm -f /dev/shm/testfile
>    # sync
>    # echo 3 > /proc/sys/vm/drop_caches
>    # echo 2048 > /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
>    # cat /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
>      2029
> 
> w/ this patch
>    # numactl -m 2 dd if=/dev/urandom of=/dev/shm/testfile bs=4k count=64
>    # rm -f /dev/shm/testfile
>    # sync
>    # echo 3 > /proc/sys/vm/drop_caches
>    # echo 2048 > /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
>    # cat /sys/devices/system/node/node2/hugepages/hugepages-2048kB/nr_hugepages
>      2047
> 

Hello Wupeng Ma,

Can you also post results of iperf/netperf for this patch in future?

Thanks and Regards
- Raghu

