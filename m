Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09A7482
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888788; cv=fail; b=mKGakDzzUKXq3WZGEUACXLZ/0Y117ZwQCW1fuBPLWAdBRLi8u01Z2wlqqeXh5GjNbviB7hZY7Tb0D470GxldCcBifw9bBmBTc4Quc6gvSWgHqO89N3cneePK4lfwQF+PdeZ6y1yEQ/lmuTRQBK2P7CHRkjVJysu4YgDTFfzZ7T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888788; c=relaxed/simple;
	bh=cWhqTPuURJqjiP5OQnqTe2OvQ3IquIBj/ePqVKqioUg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H0I9/i6jcJgL03TxiBVcGhCSnioi0FGf/S8t9OafQzgLQ+UEUsXdpQpMamo3zPsNGFx0TIvyGT8AdPkUW9UIXokGVpllusKztRkN5ljO1NkMyyFnJkY95HxiIc9zeUl1VgRlzF3pvvDwwjNWJrePDmBZUm1VDpeXLIgbLYStfSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NtWljHSq; arc=fail smtp.client-ip=40.107.102.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NtWljHSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viXnZKhjvclOKyPJQ0wMGF3RshRe+NKajurXOCoqVQkFzLBFwSekJC1TgIrVmUhBKSls/76i1wKt8RmoL3rOux+HjjPZ/x9OfbOAPDH9fqhzsagkUyQpltgQmcGvir6ngsfNxY96PT7yJNTXdnquKtFTjbfgkVbWctxf3bWVDr+JdCXphTV3gQIDHu/zIOwwtq6n5fu4SMhrBItbHMPrXMpF/FtemozWW1dXY8NdPP1/V71wDgGsCOpv+2ERXGl2ToVDI1jxiLxib39LOoWi+HmuIROFJYdBcBjz8g7Vz6J1BpPqDafr9PCBUUm6rbeAr1O/aOKE/FvEi8kZEvYNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4icuzIlu9EHRqlxLzcwjCoHGF17MJU6xdBSp03pwufQ=;
 b=Q624Mv6FUU2tS9l6UxR4HeTyuvlRlov7dMHQNLulFBwMupehpF6AGTKDhcNmidzoPlc/4n+Zv/njmEGjm8OJny+F57xb2ORTLy8WexXIbQmX4cYzipiWR/iWU4M1N6K6Om2ae5cD2RSyWRdJprFHu9oAC0O+pGLDV16AQaTSTaeyBr84u8+L2OiclQIh2xEEb4KRQTPSkdrUAajt+jy0Gdo3+1P/JgAjpaYuij+ehwy0k5n5dhweqDc47fN7DInv7ZjdODdtlrXICFrePSaykzyD1vPyOV3x58b8SOy+pX5Z+a3u0vESemwbnnq9DcveSDT/2qj86LbxfQVWEO9dzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4icuzIlu9EHRqlxLzcwjCoHGF17MJU6xdBSp03pwufQ=;
 b=NtWljHSqTKsyIW4Da9Ouy8WCR3m3XfuNFcCJNWe0sUP4lFlUJFryIh3iZsD998HTCdaFrmkhS7/RZ3glygPfoYqhMJjlUy0tmKGUE0QCWqgvAkfVlVDDIaTffK0GyPuQv0a0a41R72FfiKAgDbWgjwY5DYLYrXZX3W08lsIIzXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 04:39:43 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:39:42 +0000
Message-ID: <825d87a7-8e9a-44f8-90f0-01cf3f1b8e52@amd.com>
Date: Thu, 22 May 2025 10:09:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Donet Tom <donettom@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::14) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: dee90a7c-245c-44b8-1275-08dd98eaab52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVM0RHpGcUlqUkUvRmlYWUZuY1FBbTNLWWxYMXdvWWdYdWhrbFVUTmVwZnpl?=
 =?utf-8?B?K0d5bTk1S1dzc2IvWGpwTDlQaXV2WXlSYm54eHMxWUlWUG94QTRRcXVuNzAy?=
 =?utf-8?B?bW1IWmdDRkdIU2VnUFA4enFwcnNVS1Nzd2VPc1ZuaUd3SndnRkw5cFEvcGVT?=
 =?utf-8?B?TktGa1BaSldiRXRZNXUzTFM4WUttdnFJYkwxRWxpTEQrbkVjRGNBOHV2aVVJ?=
 =?utf-8?B?K0MySWhVdXBMUEZsak9jVTNJbFdySUxNcWs3MGZMRFlLeEM5Zy9SL3B5TFFv?=
 =?utf-8?B?KzNCS2xRZ3RqWWxsYjVHNHJCZlMwTGFpVFdwRXpCSUNQMWVEMzlPbnNsMTFn?=
 =?utf-8?B?d3ZRRmdodjIrUjZHelE0cUQ1RXFPR1hMQkVqS3ppWS8yQVZoUWtGUXNvVFNU?=
 =?utf-8?B?NS93WTdoekRvMGZJcjJPZHBmMnl2RmZ3UjBodHh2OU9DZFYycEZpVFE3OC9T?=
 =?utf-8?B?UlhKbktxTzMzd3pjUVRZK2cwQ0Iwd2VHMkd0a0laMmtIRzZGOGxpSmx5U1ls?=
 =?utf-8?B?V2kyM0pZZlB4UmdsSlhHSDNJKzlCZGdGZ1NMeEJnQTV6c01SVFc1MVdjdmRJ?=
 =?utf-8?B?bFZrSlAzNWZWelJXWDExdWNuNFRpNU5uaGJZR05mL0k0NTQ4RU1GdjBtK2Z5?=
 =?utf-8?B?b3dQQjc5MFlvTmRIMWNXZ1NKR2dEa2VVREduUU81OVoxSUVRZCtQenZBb1Zs?=
 =?utf-8?B?YmEwcG10cmhveElaOUZEY3NTMndPRzFybHgrUGU0SWp5d3RtRjRDaVZ6VXJj?=
 =?utf-8?B?RkpOaVBXSVgzdjBHNnpKNnEzMEt3K0luWE1Vdm5DZTJRM0dMQkliTnhSMURD?=
 =?utf-8?B?bTc0ZEFpdHYxZzZ5VUwrQzBwaTNla0FyRXNsd0FkeXp4UGNKVXVPVTBLeWNl?=
 =?utf-8?B?V0R0SFJCT3VnZ2xFa3FPRSt4ckZxWDNGVHkyNlVxZ2hQbEhLN0ZrSW90S0tx?=
 =?utf-8?B?UVJ1Yjg2a3ZSS2NZNHkzS3pRb1MxSUFJVTE0RnlJaGxScWU3UjBtN3BjQlh6?=
 =?utf-8?B?YWdwU2FMWVFnMWJpNWJPZU9SUk9WVm5iUzJrV3RIQk5KUzhvL3AzbHpueUI5?=
 =?utf-8?B?c3JESTk4L3ZlNDRyWlhWUUcvZllEVlJ0K0tXcFhKV3UvYldCd0c5ME9WSGlF?=
 =?utf-8?B?UXFqMFhXS0tpNEFXdlBDK2Z1U2sxaEsxL1U1TFN3UmlWME9Zam55dnBPcHdy?=
 =?utf-8?B?eE9UVzFHaUl6MzVpWHFPK3pQSENhbzNxTU9lTkhwdEdxYzQvN0h0a0JJNWhF?=
 =?utf-8?B?VjNvNHBFd1ZZcEVoSjNZeFBsVlBydGhhOWVrL3N4Tlk5VWZ1amUrbU0zR3RI?=
 =?utf-8?B?ZzlJTHpWU2NPYXR5TWVPbnNnMnpJc0Y4Y1BIWTNkSE9RRkhmWGRMOXFzVUdn?=
 =?utf-8?B?ek5OY01kUDZJUU5MMFJkSm1kTjJyZWZMYVlub3BLOHRVbUpPL1d1MTM2UVNa?=
 =?utf-8?B?N0lBTHN4NGU0QVZkY2MwUzQwODBKa00rQUxkRCtUc0x2NjRoem9tUnNzSVNV?=
 =?utf-8?B?RnMva2VoeTgvdnRiVDRaSU5xc3MvSkZjenprVUdXY21HSmwvQ21JRWU3dS9U?=
 =?utf-8?B?ZGdHRm9wb0NFbnZWVGswSWF5U1kwWmhTbzhUYlRkM2c0VjhUK2tHUG05emN1?=
 =?utf-8?B?bnJYTHl1Z3JIWEhOZ2V6SW5ncmxxVkVJdVJJSjgyb2M5ZWd3ODlSNHJoZjli?=
 =?utf-8?B?UnNqd0pXSkNXYmd3NFpRUm9uM0UweWFwdU9vTDZZME9idkJOZ1NIM0xkZy8y?=
 =?utf-8?B?M1BSQjlyVXdJcFJncjhPQmtNNjh2S0V4Z3NwS203cTFYTWc3a2ZHQzFwU2gz?=
 =?utf-8?B?WnMyb3RsYlhZS1lwQnpaNkU5WktiOVMydm1PejdkS0JsRnJRTjhDYkxES1Zk?=
 =?utf-8?B?NFIxRUNvQytpOEhaaTRDbEt5a3llVXZaQVROL3I4K3NiZHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVR3QjRVUUk1ZmljR1didEw1RmViNWdCcldXenhYQ0xnN0drU2lSMmpEMWZB?=
 =?utf-8?B?WlpBSG1KWGFPT2dBUk80TFdVTzVQNlFPcE1taExmYVROajJ4Y3J4QVZpTi9s?=
 =?utf-8?B?VjBPQUZjaUJSKzhCNklYZ0VTTVdFMWhJcUU5NFl0QStBWE9YdW00YWhXaElw?=
 =?utf-8?B?VEV2RXNzZ2FkVFFmV2NWUVltd2FKTjVYSi9qNmxKTW1pZHVGZkxJUFdkSDhw?=
 =?utf-8?B?Y1JIYUs0dk81dERLSEtmMXRYVnpTSmR1eFRNNWZhQVROQmxIM3JyQTl1bmNS?=
 =?utf-8?B?WUJSckp5UTVMaTlqZWRHY1dBV1d0cHl2bmYyb1NzTVpQcDBjYlVzWStnM2wx?=
 =?utf-8?B?ZDZMMjZCcUxHSy91TWRsMzBMQXFjSGNONEFDNHRjZTROcEQvd3R1bEtuRVI0?=
 =?utf-8?B?d0Vobmp1N2tvZXJTS2wxN3ZrVDUxV2lLSkhxUmRIU3lhVFE3a0RTdlBjcGx2?=
 =?utf-8?B?Q1RBMlhKQ3dnVFRxT2J1b0g5N3VjQkRDaVBJN05uaWxMODMyUWtUWDlLcVlT?=
 =?utf-8?B?ek4zWUdZbitaMVo5YnRaY3VmZXE0UENOZDFEbk1odHp2MHdxbExSaExaSnNy?=
 =?utf-8?B?WTkxZ1FDK2oxOFhZVC80MlZyQU9CYUwzWTFPMkdac0thUkpnajVnKzVDTy9r?=
 =?utf-8?B?aGlOYzVxNldQRUF4S1c5NkxyUHFLMHZiSDFIL1B3N2thb1RIQ1IxWHZpdjFl?=
 =?utf-8?B?Y0RCV01KcWtqUU1TMFZCcS9LVFlldjB1SC9ma2ZuWGd0czczVGlMRHBQYUcr?=
 =?utf-8?B?dVVhd1VHTi9DMjFLemUxODAySE4wVEFQU2pkZkxZZUEzbGorL0dUL1AvS1hL?=
 =?utf-8?B?MlBtTXhHODdQeENFalBVdzY2bG1yNHl2cU1RNWY1RENVQmswTW8rRVlWeDA0?=
 =?utf-8?B?dlViNklwY1RFeG5obEdsU3oyaExxb1BjRWZ1Vi8wQmdGQ3Z2MlVCekFMTVNF?=
 =?utf-8?B?RXYyc2FmK2ZvL3ZKNGJZcEdHeWZOTEx5Um12Zjgwa1hJb1lXMG83ZG5EK3Bo?=
 =?utf-8?B?eEpVWGVPS0phdjdxUVVsUzBVNU5lcFJiQkhDS080eXNJN1J1dlA5aXdpdjhV?=
 =?utf-8?B?em42d0lIZnZoaEdQb3BhTkx2YzVRY3JManZuNlhQUXhrMWhCSGc1OHEwZ2U1?=
 =?utf-8?B?NGxYMFZBdGkzMUFPUkJSOWR1TDMrckkvUXhsdWRHM3RkOXBTSkkrd3dpYjV1?=
 =?utf-8?B?RnQwUGtHZXBSTGthaVYrcmt0NUtqaTNkYXBaYnJ4QkltZ055MktBdnNwUHc0?=
 =?utf-8?B?K1NNb1JaR2IzejY5blhRZWdoajliTmV4UWNEYTVpWlRpY3FWclVjMjNpRGlO?=
 =?utf-8?B?ekxvN1FqUVFXMkkxdnhXZzEwcmVOVXRRanVWN1JNVzdXajJMTUV2dmxXTHZZ?=
 =?utf-8?B?dXJ2S3lOb2dRb1VVd1gvV2VLSC83TVBhQXJZM2lnSFhPWjZKT0d0RTQzUWt6?=
 =?utf-8?B?MnRmTlVETnJzYVlnemZuYzhITlZyb3pnSFY5djIxZTdRNU9XMlJ5NWlySlFX?=
 =?utf-8?B?bGx4UHBBRmYzaE9TOGNySWt4Q2RKQ0c3NHIvbnZKc2JQTVI5YmkxVENqRTFt?=
 =?utf-8?B?bWExY1lpUTh4NmdQS2p1NWp0dG1HeGNkYmZsSzg1THZwb3hiUWJMcDJ5dnNv?=
 =?utf-8?B?UUt5VFpkSmFHZUY3V0ZZNHRoN0RjSDJubkllOTJ6ZTVOU0hOSmJXYjllNkNn?=
 =?utf-8?B?RVZkZEVnZUV3aHdvZVJ4ak1vNVI5WnJUaTl2WmJabGNnMzVOMk5rT0E0TkxP?=
 =?utf-8?B?NXlpUzNJNUg3c0srVWx2cGdScExvbkdjd09CdEFzNWlPNSsxN01oRURpTm5l?=
 =?utf-8?B?K2VhRWNxMVNDT0xJbDl5RFA3UE93VU1rczhJRlRtU1FPOXh2eFJpMm5iWWVl?=
 =?utf-8?B?bk1Ra0ErSFI4T2ZvUXdqTmJpbDlUaWpZUjRkSmFkNldlaDh5K0JQOUo5SFQ4?=
 =?utf-8?B?c0dPV21NVG9ZUGt1dk8xUlNHWVBUeStHd3Vmb0tCdnJuSnBBMnBiUGYyVTE1?=
 =?utf-8?B?eGUvWUdVNXg2Zm9uZGwreGJzNEx2alBtMDlTT2llUno4bHd5WnpRTlU2YnFn?=
 =?utf-8?B?ajVUL2JsUXYvS01QTXJlblh1Z1o5VUJVcnlLR2N1K3Fya1crUFRVNUlPOXN2?=
 =?utf-8?Q?lG7t0PvV7+OM+9rJuIGdZ9HdT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee90a7c-245c-44b8-1275-08dd98eaab52
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:39:42.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMvsu0VF1R4ipeUu+W5zS8S1C8C0mK4TGReQYxnTPHsQ467oxpr/K4Td+HDe1R5wC4y4EhDUOrzALLMVDo3kQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410

Hi Donet,

On 21-May-25 11:55 PM, Donet Tom wrote:
> 
>> +static void migrate_queued_pages(struct list_head *migrate_list)
>> +{
>> +    int cur_nid, nid;
>> +    struct folio *folio, *tmp;
>> +    LIST_HEAD(nid_list);
>> +
>> +    folio = list_entry(migrate_list, struct folio, lru);
>> +    cur_nid = folio_last_cpupid(folio);
> 
> Hi Bharatha,
> 
> This is target node ID right?

Correct.

> 
> 
>> +
>> +    list_for_each_entry_safe(folio, tmp, migrate_list, lru) {
>> +        nid = folio_xchg_last_cpupid(folio, -1);
> 
> Just one doubt: to get the last CPU ID (target node ID) here, 
> folio_xchg_last_cpupid()
> 
> is used, whereas earlier folio_last_cpupid() was used. Is there a 
> specific reason for
> 
> using different functions?

This function iterates over the isolated folios looking for the same 
target_nid so that all of them can be migrated at once to the given 
target_nid. Hence the first call just reads the target_nid from 
last_cpupid field to note which nid is of interest in the current 
iteration and the next call actually reads target_nid and resets the 
last_cpupid field.

Regards,
Bharata.
