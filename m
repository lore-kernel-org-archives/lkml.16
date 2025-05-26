Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DF79E1
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236818; cv=fail; b=WdcqU/8vEB1z4hDWJs5v4Uhuoq3g/1GUePboc0Gp9vrQjO33jmrRzj02lKlB2UoXZr/mGlQjrSFBSjZ3QV3W1V7FmlRUFJmyWFf1D69pZTbuQJc9rVnquB9HVyWKfvESxV3+1j2t+jbTfseUk/VcFk6KnbeK3PtH1TBypXu72/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236818; c=relaxed/simple;
	bh=+q9x4ILzREP/ZoYfb8FMNqGvIFeFswsmfGegIVkLDrA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D7Ns5a8WP0r6oT4Jnq+z+ts6eGFfvffQhhVP9YXei85bU9Nu9XJrA5vUs5SMOEz0w42U2EDVE2FXK2ZCj91HRCdbKP+vtR7g3rm4wCDapmc/ETpJBt1QkbfvtSR/v1SIe12aVMGCi9iYcsfCwtSiSZMVuHa0gGC2K4zjGa5kq/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g8CNNra+; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g8CNNra+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwnEZ5ql7KmQlhS/AZ/rRbI/If1LkICtYOfA4l/6NQTHBI3w2TduiVTp/LY78rzngh0aYx6YFOsqbb5LnvjP58iidOO/AOSaz7x0u/mbS+Ljd5wrlMEtMGR0H0pXKwCGwEfEJAyGkk0QpLKt1fpjQxnltIKibSXlFeqk4KtB+3akJnE1N736JtMHE4UUoPMOL8IXBQeAIl8wCramTTybK5gbLAppEeWD/lrBprQXPihIm3ZQnobh3JDIbet2gC3PTz2o5SvLGr7Q/O1MvL3CAkNf8FHWFw9G/PU6d+06Y7sggnaZfwKFK2A2q1AdWL8CL6vRb7XJRrcQF1aGPnZfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUxUdnZhRXP/zVn3KCDOdOAQQUpozE3VFWvgb4kOxVQ=;
 b=Os08rpSsmYrbRietnDG1bfiG6CH62y1oDrSX0clgSgEjOoSHjWAOoN81LWziiAGc/Kk0+I1cyRWH3Fj9wFk/Ss4qHp0LBiYQl3fOLttEbdg6XNo8CLQgsWOkx7lMhgv+zP9d0lnh4+75SgFRxXV4qD4Wz0Inbd/t6ONiVR3Sb5lqB9APltqD0H6Y9+Zf5Y8fzO2+n0d7m68h8DN6M++7c7sB9e4BNbWXXk6z8+hAQ0U71/Ipn2sLprSc/qJfo77d6YpqT+kiQjGeugH24T7JEf7tUf4qIysDcVDwweLE1PpTUrAREo7o9rKBji+CEDxToeqAJ1yzbcIOM1AkEUhc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUxUdnZhRXP/zVn3KCDOdOAQQUpozE3VFWvgb4kOxVQ=;
 b=g8CNNra+4ftRcP4yefawff5COsQUU1vskSsIYIZRMbAlU+DcSeaI+QfuApk0M3zs9POp14LrnuE4gDpZ+iy2egU3HQWukj2EvURyCaRGPCyeGQmrtCIOCJ9UiDYp+d6mHrg5JD4369/huuTcv8elzut1BkYxVcU0c+pTxO9Urhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by MW6PR12MB8834.namprd12.prod.outlook.com (2603:10b6:303:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 05:20:11 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 05:20:11 +0000
Message-ID: <ad5e9cdc-9bdd-4824-9c11-171bfcc39b38@amd.com>
Date: Mon, 26 May 2025 10:50:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
To: SeongJae Park <sj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
References: <20250521184552.46414-1-sj@kernel.org>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20250521184552.46414-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|MW6PR12MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 05daf8c6-c2ab-4ad1-b834-08dd9c14fc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFVGSHk5L01XMUxHY0xMZ1lkS2RORVNsT3dZSVNkMVh6ZHRMcXRnYTY1dHdN?=
 =?utf-8?B?dURLVEZDdFJHT2IzckxpbDVFbnR4VUhhaVl1Nnh3dkF4c0JOZnBZN3p4KzZ3?=
 =?utf-8?B?YnNBcTBkQ1dURndtQ09JU1lFK3NjNERhczNSUG1LWHlHMHo0OHQxQ1NlNWQ4?=
 =?utf-8?B?YkdoL1FENitWcTRoc3g3S0I2cEJzNWQ1djUyQnAzWXNQRkk1aDhBbU94bWJL?=
 =?utf-8?B?amkxUGpRbVVyTDVpWWxLdlY1ZXFPUDRQUDYxSFlKekIydFJOdnp2eHNTTXhp?=
 =?utf-8?B?dlhuRFovZDNKVXJNQk1NNWdUSG9PSG5CTm5WVE1yek8wU1ZkZWFoNzdHaFAx?=
 =?utf-8?B?aWpiRVk0L1VNbGIrc1ZoaTdHVVBkQlQ3UHBSWGoxVDUvMjBrdkVSN1phL3Nz?=
 =?utf-8?B?RG5SVllJUzQxYVpkZlMzVm9EQXdGTUFjd0xQdFFUSTcyOUZwdWF0TWVvWG9h?=
 =?utf-8?B?QWhhaE1RODhhNVoxcTI3bkwrb2o1cithTUltMmtHY3EyODd1dTU4TE4ya0pB?=
 =?utf-8?B?SUxlMTJCM2UyQVA0ZW5Ta2MyaVh0ckdzSlJ4UStxUVZadmp2SGtxN3NHNXhW?=
 =?utf-8?B?V2plV2ZqVTZSaDJKQTZ4dmV0cFJMbXFtMDlodHh6aFdJUnpKOFJQK3AyL3J3?=
 =?utf-8?B?cFEreUFjL2tXSnBPSmdBbTVpblpieTlsZUduY1dCVTg3VllTVGxhWXI0N3FW?=
 =?utf-8?B?Y0E1RUdZTXIxUVgvOXpuQ1RtSERMOGtVVUV3QUFUTG4ycGl4aFRhWGwvSGR3?=
 =?utf-8?B?VHFQZllJaXBVN0xHaHpOOHZBZ1kwL3BVdktlb3pYcVFndHhtaXFVL0R3cXRL?=
 =?utf-8?B?SmVFRmF4WjJPZUJlYXlia25ZTXN2ZndnRmdvK0tMOTFIRGQ3T2ZQQTd3NDlJ?=
 =?utf-8?B?NG4raXdqc3NzVWljOEY0dkZTZWZUWnZVdTlWM2xMQ21pZEVHSzdaMUIvbmth?=
 =?utf-8?B?SnZDMVNwS29VV2R4TzczTEduVmJ2aFVGNjBwUHlkaWMyVnJ4YXpVbXljMFJi?=
 =?utf-8?B?bUhMMkRuUngza1ZoSGU5OHA5aTA4MDBvNWtoOW1jNkVWN1lRUGZJZXZLMisy?=
 =?utf-8?B?RU5WZGdiKzdwK2RPakw3ZERnOUhLY2F0dUp1K21JaUtMbWtvZzJyWFhkRk55?=
 =?utf-8?B?TFlhRHFOZldhR09USWhCSUNsYjdITFFEemlST252QTBFYzIrRXhUMmlyZXpX?=
 =?utf-8?B?TW5vRVFrSlc0QW5uUVhWcWVwNEFtUWVzWTFGSjRDbnVySVpTVVFyZGdWTHdi?=
 =?utf-8?B?dVcrQkhrek04V09YdDU4QlZMK1hUTTlqenBDRm5wYzN5YlNpSDZLN0lhNThW?=
 =?utf-8?B?QThYUnAzVEZ5K0d3OW5ReW9SU3ZjRVFEWHBXdmRkU3VhWUxTUFoxa3dwZ1Fp?=
 =?utf-8?B?aVMzdisyQ0hieGRlelNLUkM2MFhGd0J5OHNCamx1OU9zaE9sSFdBajYrRFNQ?=
 =?utf-8?B?djJCWG5rWFZSVVpNZlgxUlErZVpmTWQ2TkRwK2hvY1pZdFYwSnFKYUw4NzJj?=
 =?utf-8?B?aVhpOHlEL1EyWGpRNkZsb2xlbWhZcnZvUGk4bWZNTTZyZnRCV3p0T0dLUEd0?=
 =?utf-8?B?QmJkbkdLdkk5K1JqR2VlTUhkUkpCek5YSjJtSC91RDNLM2Ezd0lScXNFd1F2?=
 =?utf-8?B?aGRIZUFXYzF4bm5wOUM3NlNoYWduelIvNDJ3RnQyQlZqb2R1ZG5PYW45Zy83?=
 =?utf-8?B?NndYSTNORVNqUktGY0wrR1dYNW9LQllBWFlTVVpoOFRhTTdHYmM0RjVQc01j?=
 =?utf-8?B?VlJJNXZJa3IvL29sdEdtUllRNW5zZXEyeWE5dmtDaTBPTzg4Z0p1RnJRUjE3?=
 =?utf-8?B?YkIrSXQ4c29WZlFEYlBiaDJuTGVOcUJ1UU5nTEg2ZXJRcFVQL25uRm5FRzll?=
 =?utf-8?Q?2AmLwmbVBJHPo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHBGTDdzOXBnRWs2aG56YzVwemJjTEducTRMQ2tvUm9TV01taGhDMDBWUEF0?=
 =?utf-8?B?TUg2TmUrSXM3NmwwZXMvdnJzMndLZ21XZXBWTythSUUwdHNmSGV4aUVoZGhw?=
 =?utf-8?B?WnBJZEZzeFA1MkhWNStOZ0tHdTRaTmdYNEdWblpaeXhzODR1dmsxY1FoOVkv?=
 =?utf-8?B?NXN2Wm91MmJUQVNXQU4yMWpZWVZPczMxNW03NmlMbStCaW5oQndRc2lmUllB?=
 =?utf-8?B?QTlvSlNZdTZtTmpVaDZQWVZoZU5YTkluYy9PLzNIYjJZbUZUbVo1TVN6RDZt?=
 =?utf-8?B?RFREYlFFQ0FrNldwMnd2M0ZmRHVESFovaXF1VWh5SVNzK3VxL2JrUUFaVG83?=
 =?utf-8?B?aDJSQU9KRFIyejRpR2lCM05tQkxIUmhVTkpteG54bmVFc0VDVTlJYUNKQVVQ?=
 =?utf-8?B?ZnFBclhoaHlDUU12Um9LZUhVdFQzY3kvTHprcVJYTmtlWVZ3WGU5Yk1vZy9O?=
 =?utf-8?B?azNqNXFxZUN1dzlpekdQeFRLbUFiOHVvdEJLRm1Cc0FtTHJkS0R3WUNFR09t?=
 =?utf-8?B?a2NtNndYWjdERFNIZEtlZ0hNVTJodUZZS05nUWFONmhibUxPbkM3RHFiWjU5?=
 =?utf-8?B?UE9TSWNpSlBhNGxGS3M5QVhqTngvNUtRNTRkaGxQNGRQZGM1dGlOMWNWbTl5?=
 =?utf-8?B?UHNuVG52TUhCcW81ZEYvV0tmNHBPeHJ4bWgzbGlFOWpyOWIzSjIwaGkrWk5h?=
 =?utf-8?B?bGxRK0VPczVoeU9OTlpYcDBseG1saDVJT09CNGRWSDl2eXc1M3JsQlZSWDEy?=
 =?utf-8?B?Q05sSTNhbmxGQ2NQVk0zM0xpZnFOcG5lS0RhNTh2Rkg1RXMvUi9BL3BLREpt?=
 =?utf-8?B?TFRlcVgxNTMwOGEya25oRWhCbnIvZlpiZlRzaXZPNkVxNnYraEpSMjhyS0JQ?=
 =?utf-8?B?ZUgvNTlOZVdHb3AyVkVFcmpMczVyckpPbit3WngyaGNTM0t6cTlrRHpYS2VP?=
 =?utf-8?B?WndmRlhFeHR2M1pWaUt4K09sYVpLN09HZVdRd3ZBT1IyWnJTV0NrUGJVRjNX?=
 =?utf-8?B?S0hKNGJsR0NrRVJtK1Vyd29zK0pNOTFsUVJwZVJxd0QvRGd4Z3k5aUVNa2Q5?=
 =?utf-8?B?Z3hVTHl3OUcyak51bU1qa0s1RnY2Y3BabzFVWnVxYWJ1Rncrc1YxczlrRHp0?=
 =?utf-8?B?UFpiZFhkcEY0dy93Vk90MHVaQWx6ajVlSzdTbUxieVRsMmw4NXdITkI3bC9O?=
 =?utf-8?B?VFVkb0d1cWNNSi93eFhLTnlYTTJRZW9wU1lqTUdKLzNQU3hWR2E4cWZWUFQ1?=
 =?utf-8?B?RWQvWlJPNlo5M1ZZZHJ5WXEwcUd5QXZpR0tZWWZrTVE4NHdRS2tvOEl1MXk1?=
 =?utf-8?B?RjBSclhUWXpNMm1QRU9OT05NR1Y5WHduRTZmM0c2QjBLY0FVa0V3eDVpZ2wy?=
 =?utf-8?B?T2Q1OXdIeFE1bFRXR080Mzg3TlpxaW5zWmU4VE15VTM4SDBTd09abjI4ald2?=
 =?utf-8?B?ZitRM2t3MzhqbER3WHhhekFBazhQVkJ5YmxSRG12dzQ5aGlnSzNMTHkrbjkw?=
 =?utf-8?B?bnlUNXRLakk4TkRXL2lQR1EySWFUQ1NMU1FCcG80U0gvTHdISlRRaThrcTNM?=
 =?utf-8?B?Z0t2VHh0aWNISnEycmJKaFlWZTVPMEZyN1VJeHJYSFRYYVpYSVFMYkk1Tytl?=
 =?utf-8?B?MFY5ZjV5ZTd3eXlkL244b3F6eENhYUVQOUhVM0dnZUVOc0Y0N2Y5R09MblFt?=
 =?utf-8?B?M1NldVNKd1h6MDJ1YlpnTUF6N3BmWmN3K0ZYbmFCYnowbWxWQ1RSTStRMWFu?=
 =?utf-8?B?U00wL04wVktuM0crMUZkMzdNL1ZyY21FUEhPd01RblJvZlhoMzJxZUVJNFRq?=
 =?utf-8?B?ZnY3Wk5pS0IwbEl1Rnptd3hvWTlBTDJ2TXVMb2RpcHJvUVl1UTh1bHM0anhw?=
 =?utf-8?B?Sk9YeXl2YlRlVWgxUGlmZjNPNzJPNXlsdXRJbVd2SGFmUlNzWCtPY1JXcm9P?=
 =?utf-8?B?RFNiVWVEUXNucUVZWndSQmpOR29MZnhjdEpLMUJpbFd4RWRaLzhpOXV1NEZq?=
 =?utf-8?B?WGdYRVY3WEd0dzZpZkV6ZkZyRWtFR1JPL3U4SzJpdnVvTURRSFRwU0JGZHhB?=
 =?utf-8?B?SDdna2FyRW1WL1dDZ05nRmNmdDhIeVlka3ljcW1XcFI0cjhWckNHQS8wRW44?=
 =?utf-8?Q?p6+0P6581SPHELRt0g+MrVnPR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05daf8c6-c2ab-4ad1-b834-08dd9c14fc93
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 05:20:11.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWW9PbZbA1Tl7d/SiArKWtuoMu6zvFzd70MP6/DvyIGSkHUYvAGvAg7lR7GXalb6INePyrLCvFW1qeohzrnGDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8834

Hi SJ,

On 22-May-25 12:15 AM, SeongJae Park wrote:
> Hi Bharata,
> 
> On Wed, 21 May 2025 13:32:36 +0530 Bharata B Rao <bharata@amd.com> wrote:
> 
>> Hi,
>>
>> This is an attempt to convert the NUMA balancing to do batched
>> migration instead of migrating one folio at a time. The basic
>> idea is to collect (from hint fault handler) the folios to be
>> migrated in a list and batch-migrate them from task_work context.
>> More details about the specifics are present in patch 2/2.
>>
>> During LSFMM[1] and subsequent discussions in MM alignment calls[2],
>> it was suggested that separate migration threads to handle migration
>> or promotion request may be desirable. Existing NUMA balancing, hot
>> page promotion and other future promotion techniques could off-load
>> migration part to these threads. Or if we manage to have a single
>> source of hotness truth like kpromoted[3], then that too can hand
>> over migration requests to the migration threads. I am envisaging
>> that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
>> and CXL HMU would push hot page info to kpromoted, which would
>> then isolate and push the folios to be promoted to the migrator
>> thread.
> 
> I think (or, hope) it would also be not very worthless or rude to mention other
> existing and ongoing works that have potentials to serve for similar purpose or
> collaborate in future, here.
> 
> DAMON is designed for a sort of multi-source access information handling.  In
> LSFMM, I proposed[1] damon_report_access() interface for making it easier to be
> extended for more types of access information.  Currenlty damon_report_access()
> is under early development.  I think this has a potential to serve something
> similar to your single source goal.
> 
> Also in LSFMM, I proposed damos_add_folio() for a case that callers want to
> utilize DAMON worker thread (kdamond) as an asynchronous memory
> management operations execution thread while using its other features such as
> [auto-tuned] quotas.  I think this has a potential to serve something similar
> to your migration threads.  I haven't started damos_add_folio() development
> yet, though.
> 
> I remember we discussed about DAMON on mailing list and in LSFMM a bit, on your
> session.  IIRC, you were also looking for a time to see if there is a chance to
> use DAMON in some way.  Due to the technical issue, we were unable to discuss
> on the two new proposals on my LSFMM session, and it has been a bit while since
> our last discussion.  So if you don't mind, I'd like to ask if you have some
> opinions or comments about these.
> 
> [1] https://lwn.net/Articles/1016525/

Since this patchset was just about making the migration batched and 
async for NUMAB, I didn't mention DAMON as an alternative here.

One of the concerns I always had about DAMON when it is considered as 
replacement for existing hot page migration is its current inability to 
gather and maintain hot page info at per-folio granularity. How much 
that eventually matters to the workloads has to be really seen.

Regards,
Bharata.

Regards,
Bharata.
