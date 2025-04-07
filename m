Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50317BA5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995633; cv=fail; b=SGfG1kibjbf39cn0fK+APCWCxhHiKT3kqmDp7S2JKngf6cORcuhA+hk84ZfY9W2hEpwAoz0bYO687WnHYS4kW9cZUHB1gdQ49a+i5B/yItkw+f9bZJLVKoOCr+Ap5xbEyMnhpVHlrNdNz5MazTaA6ItFX81dN10GrCcAXWMcxS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995633; c=relaxed/simple;
	bh=p+986X7FjTT9yJD5F4PIH8POh04usVuI4SoK6de3uTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P2ovepcnJC+ecP/OpNVIQGkcL2MIX/SEM0KeYqmuKTQn2PE0hQOfKHgATMIrKfd2BDoJ2HGzmqT38oLVdbwNd886w59FnJGYxRu+zNZ82Y6V7vkmJGfennPCSWXPMNi2Nx0RJ4kKDUVUXdC6eUouavg/wBGK4FYSaGfjgtoopMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o/S/DpBw; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o/S/DpBw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTRTjWiwuGQRZE19tY7lOyP1M11wHktN40Oj3BPacMKa0T+4MspczUB3t8c7YERq+ZQ2ncHxfvrRDFMJWqyW24+Lhge5tRXvtkOYCYX5ygwR+uPzXMbaqWS3Y8BWHCM8jTXmgcb9zzxuPVB9Je2vBYQyk9sbU/m1j6mptiTCPTGkl/TiuX8DGfv2Yp6kLX31cRdt8D//BHtSjGJ04zbYxViwwulay8rBo8TpbhMk++SBp1fiL/aETaM/Wt3koE/Z7rOy9hplt+lXCyABooGqexRShrpYNUynmVQepQ78JT/FYlRBy2jaPOzhrwm2KaESenrhNi1ykfJt2RHZpswNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUFCNqaa6VmRQ4Xmgiako4nVq/cXBPfS82vjkNPSuX8=;
 b=FwKoyoUdcKo7R5sz9NynKg27d3ML8PK3cqXfqSQ9QXsv+ay4edCTsqr+Pveob4TBbKnujCMFbL50JfomwseJtrYft0EbMCjqKXNWUGpF1dDD2weS9Vjy1j3nKcgh3xU73kWcEIoxBkIrJfSsQufvKXF48/eY3lu4z7gVtjiByWRe6uuY5c2ugwCYz38E6+sLY8fuD2et7wtRJQcmmcmf1aIVGxSQqF+XNUBoaQxGgR3O+Bxz2x1dNa41Zt5/ouY1fzcdEmkNDgPjIFSkP1Lo8wA046Pg3hFGCWKcIoBs5NSH0EA2rPUccK6Rp0Pn4l+rUbJeMio3tnCSK6WoeOMeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUFCNqaa6VmRQ4Xmgiako4nVq/cXBPfS82vjkNPSuX8=;
 b=o/S/DpBwnBINtYc85db1QMOsK34sdgY29JOkPVCPOXdZbvwTBXBOeSUNuEW7TSJHB0Ii0uSOt8B0I6OHQfDNuvPQTwfLVzje5htZWetwC6l4vsSBrRN+0LcSBu36pv2xhqZ/IJTXDtS06HHiffk4eVvdzHq275EDvr+iI45yLnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 03:13:49 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 03:13:48 +0000
Message-ID: <ebf2b8e7-8978-4e8f-9a44-cb06e6e69a83@amd.com>
Date: Mon, 7 Apr 2025 08:43:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
To: Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org
Cc: gourry@gourry.net, nehagholkar@meta.com, abhishekd@meta.com,
 ying.huang@linux.alibaba.com, nphamcs@gmail.com, hannes@cmpxchg.org,
 feng.tang@intel.com, kbusch@meta.com, Hasan.Maruf@amd.com, sj@kernel.org,
 david@redhat.com, willy@infradead.org, k.shutemov@gmail.com,
 mgorman@techsingularity.net, vbabka@suse.cz, hughd@google.com,
 rientjes@google.com, shy828301@gmail.com, liam.howlett@oracle.com,
 peterz@infradead.org, mingo@redhat.com, nadav.amit@gmail.com,
 shivankg@amd.com, ziy@nvidia.com, jhubbard@nvidia.com,
 AneeshKumar.KizhakeVeetil@arm.com, linux-kernel@vger.kernel.org,
 jon.grimm@amd.com, santosh.shukla@amd.com, Michael.Day@amd.com,
 riel@surriel.com, weixugc@google.com, leesuyeon0506@gmail.com,
 leillc@google.com, kmanaouil.dev@gmail.com, rppt@kernel.org,
 dave.hansen@intel.com
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20250123105721.424117-1-raghavendra.kt@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::35) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|MN0PR12MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d0ada4-b0b6-4d6d-3a57-08dd758236c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjlpaEhFZHVRYXA3dnQrWXg0VUFxTUJWOXpLTm9SNHdBMk54eG5MQXpwbnVK?=
 =?utf-8?B?eFA4eGl4SXBTMHdXZWRrdi81M2c2SksxVlMxVzVIR201SDVSd3pFQUFOTUFS?=
 =?utf-8?B?UzNYMWlzcEUzS3hUZFNxOXNVVkQwUm95MHRLM3VyRzh2MzBzTDl2ZG8vTStu?=
 =?utf-8?B?N3IrTjNxMFNjM2FjTlJoTkI0L2l3RTVlWVJ4R1ByMUxEV3RMOFBOdGdJTDRl?=
 =?utf-8?B?Tmk4UDFuWlB4WGRENWFVclo5WDVDeUZQclFHSzViOVZyWWtzZTM1d0xvM0hM?=
 =?utf-8?B?NlZQTUNlczFERnJLcVBBMnNqdGIwSXR4M1JNMkhqTk1jVFIwVDltWWo1Y3Rz?=
 =?utf-8?B?N01ITVF5UzBYZUVBeG5teHlqMWhJYWFjak93K2NwbzhlOTJ2YWRrdFcvb2FW?=
 =?utf-8?B?R2tvQ0M5dWFFZEtCeHpjWGVmQkxzWnlNZXVUYmVPanVSMnZaTDY3Y082RkZI?=
 =?utf-8?B?ZnpFZlFVL3FmTTJiNUxqRHd2RmtIT2x4ZDF6blBBU2QzcWJ4QXh6VE5YUFZM?=
 =?utf-8?B?SU40YjQ0Z3YwL3crRytua2dMNlhaUTJ0NnNrYWhFZ1FiZjdrL0VwR2R3YlNn?=
 =?utf-8?B?Wjh5VG1zUmw5c2tSUnk0NVdxOTRzNmNwOEc4NzhYR1haeDRNMzdWOGNvOGgy?=
 =?utf-8?B?SFVScXovQkQxQXVkclVDWEJWaFU4dXdsTmw4VTkvemdMelV2NXExTjVCbEVF?=
 =?utf-8?B?Ui9zcmF1Nmpkc0xoRXZjeElEUVRXaWh4WUlWakNXY2pPN1kzUXJBeUxOTjRQ?=
 =?utf-8?B?ZU0wMkNxNWRhTVhoeG1WbzVKSlVNQ0tSRzI4UXFVeFpESW04OFBMcGhDZTRQ?=
 =?utf-8?B?aG1YMnN4Ty9Gc05qcVBJVnNFQTBrZTBRd2VzZ1pqdFk0TTI4TWpuSWlwZVhV?=
 =?utf-8?B?WlVCd1EzR3llZGhjcEl5RitDdmpFRWZBR0FzY1BST3pVNlZyVlNiRUJlbUl5?=
 =?utf-8?B?S25SV2x6bU9xK0dpckpXQVd4TFFkUlZOUHBoL2lqREMyWnM4ZmdDY29NRkZZ?=
 =?utf-8?B?UXdzakdCVWhScE12RTRLZ2hEU1g1b2xkV21uYmZCNDJja3VFTDJPeTF6cnpz?=
 =?utf-8?B?M1EwUHlJaW1NREF0a0ZheEJPZzZiSUJaQmlQZGFRbEtMMS83SUVSNEdiZTZG?=
 =?utf-8?B?elVCbHRDdGE5bWRzbjdKZzl5S0dpUXg1ZXNnK2lWcFB0RktaWnYwZVNPc1F5?=
 =?utf-8?B?djlIUWNzem5vTGZZVDNUc0ZQTG82TExvaEp1ekZLUU9aTjhpTFVXZkRteUpv?=
 =?utf-8?B?QmRERk1QcS9OWmc1WW5CR3ZyYUVZSGNqWTJkeDNoVUVLaCtVdTJvYWQ5dmJn?=
 =?utf-8?B?TlhWc1A5a1lGamI0aDJYTXlCSkw0UHlXTnV3US9weVl5MURNR1pwMUd3Q1RK?=
 =?utf-8?B?UEVIOVR0ZktZYUErdS9iaXhGOEt0bEJjVE5GRnFMbk94MEpKdm1Ec0V2RVEw?=
 =?utf-8?B?T1QxY0tYY0wzam9uaEUrSFdwaHFIeWNodVBNdjRiQlVxS2dzY1RzM1RuZUh0?=
 =?utf-8?B?d09ueVh0dlRFUDZnSzV3YUt0Q1lTSjBUaEdxNHI1ZVhvWmdWdFlpU2JscHVp?=
 =?utf-8?B?dHhkdStZblR2VGpMZkhlMkZYa1p3WUZwY202aTdQR09UdEtqUElKOW1EUERV?=
 =?utf-8?B?dElYMXZqOFZxbE43Y3lBT3JjNW1nN3JVS3dYeUM5WjFqNWVXeDBmYUxSTVps?=
 =?utf-8?B?akkweFdNYVVDSUhLQjk2NEFCdDM2OXRBY0RLQ2NxOEVOL2V6REpkcU8xY0xS?=
 =?utf-8?B?NFVTU2hQMVo2dmdqSE5ZU1lleVk3VkZQbW1VWnVqQU9LWk91b2srS0RRcEhn?=
 =?utf-8?B?V3p6bkUwbHM1WGpkL0dUQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVRrenEyWlROMmc3SGZ2MFhKR1I0RFNIYmg0VEwyZHRnKzhsdUc4VzA4QTBt?=
 =?utf-8?B?RjJKUXo0cWJBeDVQM1lZSHl4WUNmcmRkZHZMSjVxL0djRHlYeEhpUkVwbE94?=
 =?utf-8?B?NzRVRTN5QVhGNE82YVh0MjAvckdxWEhoNWh5SkQ1cGtjMmgzUzFqNlBnSUJi?=
 =?utf-8?B?Q2tmQU5kTkhndkFJb0lyaTBuOU0zNTlvZmZrMGs1eWJCTUxMaXBLekcrQVA2?=
 =?utf-8?B?WEhlaW9BS1dENitrb3BKaVFzQTZjd1hSSG1PUlBNNDNlSE0rcXloMUFzQ3dt?=
 =?utf-8?B?TVpwb013NUh1TWJoWExBcWxZSlU5SGxNTGQ2Wnl0R1F0ZUx3bnR0dXAwTk1m?=
 =?utf-8?B?K28rYkc1WXBtY1pDSU5GZXhyeS9JSUM3bE5rTnF2TVNGVTZzTC9kSUhlWFJl?=
 =?utf-8?B?T09zMFUrL2kxUkppc055dzBGQmxyTzFuc2FqSmJrNkRVaDBPTTg3eFR3VEpY?=
 =?utf-8?B?R1NWanJ3L2dzRDZSOFZGNkQwVUNyd1FiZDdpdTZtUzcwWUdBYy9aczBXZ0NV?=
 =?utf-8?B?bHloMS9EZXZ0UzRybEpBdU9GNkgwdmp0TFdqYWd1MEsxVEFwcEU5Qnc1ck5W?=
 =?utf-8?B?LzZ2RnArYm0vMUM5ZngxOWhTSFVYN0J3bHVIUDVDS2lVajFqVXY1akNCNDhy?=
 =?utf-8?B?ZUVoN3didlM4VzRxQUtsL3JvRnZ0VUlDM1NoL1p0UHRxUzYzakVITEhXZ1cy?=
 =?utf-8?B?MFBGTWhEVHVjQTZUc3BObThCTGhXWS9EQ0R2cStBUzRacGRIMkEzVm42NHhr?=
 =?utf-8?B?SEN6ekMrWXRQSno0ellTQVgyQnJxUlh2ZXRrYkg4MWlzQnE1WERKbHh6cmR6?=
 =?utf-8?B?S3UvL1ByRXhmOWJlSHJmLzc2TUVlQnBaSEsrYnNNNERDdFlxb3p3OWdNNHNI?=
 =?utf-8?B?VmpzQzZKaEUrYzlEOWRyRGxTK2V3VEdZUGI3WGd0VVhycGlFM0FKUFBCWXM2?=
 =?utf-8?B?WkhkV0Y1UEczN1NWcnN6aFJPME5SN3BTK041eGxzaUVFU0hWT1k4QzdHVUlG?=
 =?utf-8?B?YWt1dkIySUpiWFlhTTc2ZTJhWUZHSWxHc3k4L25FVXpFbEFBZ1R4YW44b2J1?=
 =?utf-8?B?RzJzZE82UUtPNjhBM1pJUXRQWFVWYnlNaGhFT2l5WktOakNXZ21tOHRuTWth?=
 =?utf-8?B?Wk80Um0zaUozQUwxQ2lTL29idmF4L3Fpc1V3YUVZTGpqMXp3eE12T3YrYity?=
 =?utf-8?B?QllxYWhCZ3VTaGN3OFAxSEkvWk1zY3Rpejgxa3dyMW5FdG9IVHVyaDRFejNF?=
 =?utf-8?B?bGdYQTFwWW1ud2dhd1ZPbnVjTTFoUHV4a1BMUjhrNFFEcE81emlVMDI2bGFp?=
 =?utf-8?B?WjM0eTllQlowbEFQQ0hjbnZrMjU0WWhteS9SVE1meDkraXdoaFk4THIxUGdF?=
 =?utf-8?B?RXJxbmZyV0Q2S3JqUnVpb1ZIWUE4ZDQ3QmZQbEh4RDlRZ0dKK2ppN3pOcS9J?=
 =?utf-8?B?OVd4VGZCTFd2dmhKenlxZTdudDAyNXVsNkh2WXlLeTFrVUEzSkl4WG8wVGhH?=
 =?utf-8?B?aFV6ODdQVUprblFLSlV1aWdENG1NQlVvT2VYdGFWaEtETUFaOThNNUtMenZF?=
 =?utf-8?B?N1crNlNrYVE2eUg1bVdXQTJ1cVNuUVZRNWxMcTkwSm8yaXh5QThWNWUzZmpH?=
 =?utf-8?B?MVhGbDYveU8wU1o4VFhtMTB0Q2ptd0d5a3hVeEFBZ2N1ckpMRHBNdlpXQUd2?=
 =?utf-8?B?WHBpeHBpeHdaSjh2bmJmVXZLRk1nZEpYdGsxRWNQaDVQd0IyVE5pOVhxd0xT?=
 =?utf-8?B?ZHB6eElaNk1ZeEw4SG5wOHFhUmN2YnhReHRYTTlYYTFFTmJvcXNWeDBEMGVY?=
 =?utf-8?B?dkU4RjRKc3FoOGVpNlNmK2dmcU9GcE5jcXNVeGp6RTFZNXlBYUdKd3Myb1lh?=
 =?utf-8?B?ZE5VOEFpMjZ1WFdCY3g3MkoxL2JSNkFUSHd1T0d4TGJTc3ZkcStHa3BSLzA2?=
 =?utf-8?B?NDczVlkyQVgvcjRoODRpdm91SkUxWEVWT3RxdlN2V2F3M2VmQTlvdVRQSkln?=
 =?utf-8?B?Z2FiNVhkTG9PWldRY0M4UDFVaDdQbmlsU1hkKzlaQVUwYmhFdVM1ZWlBaWhr?=
 =?utf-8?B?RkU0MU9WYWtPV3d5V0RvK0JUSzZxcWdNaC9IT0pYNFBVd1JFZGlTcXUyRjdK?=
 =?utf-8?Q?i01bHHYxNUlfaT7BJFVDDKwp6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d0ada4-b0b6-4d6d-3a57-08dd758236c0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 03:13:48.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7d9O/SMXqVlVrCxd4oxut1B/WGi5A8Cc9DCf1JK6JrS6q+g6bSfN7lH5feIMASVD/jI64htKHEiLqfWqQqHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833

On 23-Jan-25 4:27 PM, Raghavendra K T wrote:
> Bharata and I would like to propose the following topic for LSFMM.
> 
> Topic: Overhauling hot page detection and promotion based on PTE A bit scanning.

Slides that were used during LSFMM discussion -

https://docs.google.com/presentation/d/1zLyGriEyky_HLJPrrdKdhAS7h5oiGf4tIdGuhGX3fJ8/edit?usp=sharing

Regards,
Bharata.
