Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0AA7482
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888936; cv=fail; b=QBvyGjbLx+6AKa8bYWluJ0a4wwiX35qK5ReSUgb1BUp7XCzLxbQ9aOOq61yWuAkesqts/iyHFMbR980jKBgmUimpYnFKEy4bfcF8sHW65YIi1LYQX+VzPeajPEO+5yrU9iU/ytqGS+568UKwHpPgMGU7UuEBlXZapfdwlFxtW5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888936; c=relaxed/simple;
	bh=qpCGyJrbi66AA9rOVPHE6MfFyxMiKAGJAnMss5QZFtU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sk7L7MnTcsJJp4aLuOQAj0C1cw5NyXCoAU/K8SniWmU+UfY/23tkHS2/dzwH9lU40Nkzkm3hOWzQ32uPk8JQUwWdqwWhP8RhANBHeG8stWwX6VyXCcGZLhOkD8nyQjKkt27gVnC6OvMZ14Inzfjtwo6CCeeUtnOOURmhvO57tOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P3KZcqhG; arc=fail smtp.client-ip=40.107.101.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P3KZcqhG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8Md4sPtJzysNvdAB0gsFSod2PBKIm4+4fjJ9H11b8k4pCegXPxNM1Q5yK4JU4zGVODFWdmAbmlr2e8QtzBB9VMxz7YvZ7zzNLf8QxJJ3GFr1409GzA8TG/3cgabUnOSFi4wucKhGXrAmjcUxKeZAJGhFs9gOjNALQH5jRiiEWno5Dfpr+BOFpdjawyG7OAXOLyVmFVi0J3mN8UuNQipuJQvVbNZEed6t8bPjEk85P6kwAKnMQz2uWyQD4+wLaJ6hhWYFjtVcM1yLRWQZyQXbYmjqvydxx2bkVgU2tmvLhjOrW4KeEn2c+0R37W3QyVm3uU5Elfmn9acw2BXsXpbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+F7CFkXhXSn6TNCV0LQFd/mQTHwziwkRieBReqAfrA=;
 b=L+QclUBwyz4fX6V8c28Jdbjk6wcd1ZCdhgzTxDmx6FFFOBdbMVVDlgD24XISYN6MFcjJXU75aVZbceTUCLYDGg0GwyNa0jYn/sHCTd8vXzS/9gFhmIrgjq0HJCcEyLBKuU6gk/IgDgRqa/1SgxUgfQokXQeUD5YXUATHfuTJMIVNVc0dG4zFo2Sur1YcIDCinNj4vtFNRuLOXw/yF4kCVzZMStsADlzWqvHDuU775QzOFCBnx3mHPGxRb88CLCzeSfZGEA06To08fopJGvUvQ7NxQjZnV5CTMXTBlEi73VpaA9+OWURvyO8QpPYRjFndlOcDb4Bp3XIpzst5rV5bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+F7CFkXhXSn6TNCV0LQFd/mQTHwziwkRieBReqAfrA=;
 b=P3KZcqhGqcRbtATbknHUN+Dd5pq/2ecpoDVVrSn/QW7PPBb8m4S7cJkPh/gmxIlxXzOl1X4eqa01bDSv/KOipxqkSQlcnA58BhSgx9xQfwHU6ps/YZwVUkc8X4Bqy0LTVAjy15fGeGL+SBfFUD+4kjd3FBn6pyuo619QQxPWhPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 04:42:13 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:42:13 +0000
Message-ID: <daaf50aa-896b-4dc3-891c-6595b73f271f@amd.com>
Date: Thu, 22 May 2025 10:12:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Zi Yan <ziy@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org, david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
 <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::15) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b62a3f-66c4-4bca-1b33-08dd98eb052c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC9XeDRESmhadlYyMU5tYmpXZWhLWnpqUW9iSm5rM2U4UFpzL013SjVyVzlq?=
 =?utf-8?B?MUZOVDNtK09kL2NLbk9mZ0FMNWExb212aUQvUG4yWVNHTHhWQkJiTnZDN3NN?=
 =?utf-8?B?L250NzNtblJudFlNNFZ1QjZJZGhrTUhPVlFoZDBCeGJRK243WVJzUStHV1Nl?=
 =?utf-8?B?cktGNFkzNGd0WXQ3Sk5YbjR4VkJ0NXp3WFM1YWk0UzF1enNFMWVaSmdTYkVy?=
 =?utf-8?B?bUd1dHB4VTdEYTZxTUpDa3dRQzlWZFVHb3U2NTJLTGpTM2JmYjRxZFFQWGN1?=
 =?utf-8?B?NzBFNXF5dlRlMnlGZVlUSFJXQk5nWUh0Tm1TNE1iVkVjWlNuK1g2a29XVGN3?=
 =?utf-8?B?R1g5T0dHNmdWRGJ3ZVhCWC82MURmdVFKY1NIa0NoVk9BVTJOV3EyQkVKeVNF?=
 =?utf-8?B?YzlPdW9SZkJqQTJJNG1ocDBJQm8wQkxkVjIwVFdWay9oakUvMHd1VXlFbXJ4?=
 =?utf-8?B?QWUyNkJIVVpjWlR2OWZBNjlXVzQ0Sy9PbS9HNWxLYlBBWUx4THQ4ZWFXMjFs?=
 =?utf-8?B?aTVDUzdTMUNSRUo5YXk4b1I4RkZtbzlYVDE3bjFjWVdieVQ4dzZMZ1lUc1dH?=
 =?utf-8?B?MDRoV1M3ME4xWVFOZ25sV00wbU5Kb2xwaWdrcWlKTktsbzZPWXcybTZmcXlB?=
 =?utf-8?B?OUR6NkYxenUyR3RSYlJKMlpIYlNwZGlDMElLVDNuODYvcEVOcHExTlR3b09W?=
 =?utf-8?B?S0c3V1FXbERlREh4bnErSUxzYjlscVg0eWZVd0UrVzNmN1pwcW1MbTAyMUFQ?=
 =?utf-8?B?eWJZT2lVM2kwM05TckttZ2I4dWZnLytQaDFSbVgyc1FTYTFWUU9mRmRrV2lS?=
 =?utf-8?B?a1lOK1Vnc3hld21zZnlnZFlMV2RNSlpSWWFtSzVFaHF3d0FOMWpjNGh0VS9p?=
 =?utf-8?B?Zi9XRGgwLzNZRFBXQmcxV1drbXFuRDE4L1h0ZEY3YkVUa0M0c2FGd3ZRcGh5?=
 =?utf-8?B?ejlDMDJuTy94RzZCd1B1U013dHE0aytVQ21McWZBR01FYjJNdGN1cTdwaW9x?=
 =?utf-8?B?Y0sxd2d1SHFzMkcwWmtMU1dJZUZEamgvTlAxSm5LdC9GUjdoWkR0Q3h0Ny9x?=
 =?utf-8?B?RXUwR201aXlibTEyT0VzUldWSFExZFl0VHVLVmRKelpySndyZ1ZIWXVWWGhm?=
 =?utf-8?B?RXFvOUE2b2tBaFUrK21HSjM3QXVyVU11bWNHa0dWWWxxVm9KWi9VLzdheTNP?=
 =?utf-8?B?OFZxQTBia2JuTTA1akNjdnN1L241RnIrb1VUZnFiaU55Q2U0Y1R0djFnVEtu?=
 =?utf-8?B?YkViNk1OT3Rpb0ZjdGFscmI1NWxEZzRLOUtUNVkvQmFZRHdqTmNPMlFXdXN5?=
 =?utf-8?B?ajZqTGVtcFFqcDFKYzNIeEh3NGlHQnBmenhiVjY2eHlHamN1UDI0eUxTcjRz?=
 =?utf-8?B?Vk8rMXpZZFdWb0dFR3FORnhuSUdtQ1l0SWdPOHNONG0rUE9lc3pJL2kvVFVR?=
 =?utf-8?B?emZWcU1CRE5TWW5Qd1hVdzJqUVdpZ2NyOXBKZkNTdURhTzZSQVVod1ExQ3Fm?=
 =?utf-8?B?WnNlbEtNL1Y4bDlVTjdqdmpTQWU0aDMyWnFUSGNPVzFyNnRVMkxwNkY0L1Jl?=
 =?utf-8?B?N0QrWkI0amZlMXZCT3AwOWFpSDNQV0JqRGRodlNPSC9BRTdyNGhleVpFYURo?=
 =?utf-8?B?em1pa29OYnlVQ2wzaVQwWTFwUm9WeSszWW1HTlJoSE1iUVZINGdkcklDVmlC?=
 =?utf-8?B?ZThUN3hic3hPMnZYeEQyT29TK3FMUzIxbklJUlhzVCtQclY3T3J0WDFWZGdM?=
 =?utf-8?B?MkRkd05QMi9RRUpsWklxTnVVWlBWUDNjUW01VlhFaXU3aVVuQ3lzSXhEZE9i?=
 =?utf-8?B?VHFzeTZsZkd4V2h6dGJ6RVhoT2ZWT2g4NzdDS3ZzVFlpWU9ub09DeUVPcGhL?=
 =?utf-8?B?MHVsUldiLzdickt5QmZ3UkZ3UVFqZ0EwZDYzbHpLOFppSVJzcFdUQ0FXK0h2?=
 =?utf-8?Q?Vs+nJ8Fwn7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZEUVVhWnpHZGFZaFJZRG9EZFhsMnJiYXd2UlU0S3B0QVV3VjJEOWgwcmRr?=
 =?utf-8?B?c0tsYm1VbDVMUnpudSs0cnRHVUt2OVB2WG1aN2xUMEx3aVZnYi9kVitudVAw?=
 =?utf-8?B?NmozVktWNW0ra0JIWVFnUStEVmtBcDZZR3pTcHlmRTNTbFU4djBUSk1OeDNZ?=
 =?utf-8?B?dzEvRkZZRktGNlpFLzRqRDdUQXVRMThMaGhWNFE2NmdZc0N5OFc3LzcrMG1R?=
 =?utf-8?B?M3BuQjlNeTUwT2d4WXRRZEVVVGpvblJLWDd6Uy9VNUVBNnk5K3VrVXRLUDk3?=
 =?utf-8?B?ZmpXYWZhRi9PQ1JManBlbUQrdk1uZ2NzQUM0b1JiejY4TkpHZ1pwNS9xbTMw?=
 =?utf-8?B?Uy92SzNaYzk2OFdaZGpDcmQxQ3l5bzhxZUhhS0pWc2xoOTNxU3BaOStUeXBH?=
 =?utf-8?B?S2pRbVZDUFBzaHFmdEI0Vk0xd1N0SUdOcE5iZ29VWlAzc0xJLzdnc2lLRWVR?=
 =?utf-8?B?WUgzT1BOWVA3U000dFN6anNHbWM3Q0hVODJ1Z2xwYUM3RWxsZzY3Rm1ZQVA0?=
 =?utf-8?B?clhPbGJ4U29mclVWc1pMcitOd21ST3BPUkdIdjhJYzZaK0RXODdHMmoxL1dR?=
 =?utf-8?B?dUkxWGlMREpYQTRwaWVia2t4RGpSVndFdDlhM2hhNG1WekV2aDhUWnNkd2U1?=
 =?utf-8?B?ZmtIYUErbVlNSW4vUFdpbkIwUjFJdVlUWmppSHdIUGZBQk0rM0VGc3dMOUxK?=
 =?utf-8?B?RUZGZnBGQVo1NDlqOXdBK0ZaYTdFdm44Mm5EVzd0ejlHandsU2ZTcTB5Y1Rq?=
 =?utf-8?B?VU5ydjE5cXV2SlVYaE1tZTNyZCtvK3pIMjkyT1hwaE1hL2NMdkhQNXkwWkNU?=
 =?utf-8?B?UHNPMVBva0U3YmVZOUIxbmZNSGtIazIwQS9JS3ZhM01NOTJ1UlkyK0k2OVdw?=
 =?utf-8?B?YjNmRXRJUTlLaFdPTlVKeU5UODBtNFpPWHdKWnpqVlhQMTJaVHVQNHgzS1pL?=
 =?utf-8?B?NlVjZm93Myt2emZqMXkzakxOeXNTelllQmVkN0hnNytuNC9mVm5EaEVVU3Ji?=
 =?utf-8?B?eXJqWHgyMzFXY043c1ZTaHJsOHh2b05Mem9uajFGbmdXN0NXYVUzMFJnbWgy?=
 =?utf-8?B?WkZzTmMvUWs3YktDTEo5WXFwVENDWVo0WVN3dml1L1BXaE5hVHpYWitkM1J0?=
 =?utf-8?B?dGMxK2FsaFVwVDhheXZseUtMbU9KMzR3UzRuZjZ6WVhXUXpVemNFTTlLYmhr?=
 =?utf-8?B?eUVYeXJWeDhUVk83QkZ3VGQ2VkhFaldmMEZXdDdjckdycU5SM3MvYW1lVXpt?=
 =?utf-8?B?OEtXZGpMd0FQcmMrZlVWSkp6VkRNdUVGcnRZbFExYmFMZ0xHa05JOVRWaGhY?=
 =?utf-8?B?cFQzdzMxMlZPaDFLKzQ0ZnArRFc5MlFWVzB0d2c3bmcyTTVxaHlJcXNjWlNu?=
 =?utf-8?B?MVhBQ2JqSE5tc0MrZGNMc3ZVdjdEeVBrWE5wTW5mRWxSYUF1NVlyTFJxQWZI?=
 =?utf-8?B?ZEdlbmpjTFF3WERMZjNUMWNNd2pSdTJRL1UvTXlQb29EaHROSVdUZFRBaExL?=
 =?utf-8?B?ZjVoT1BvVTZBc2tlNC9zNG5hdzF0bXVJTG9ldXdTaHUyVTUvTGhPOGJnZTBM?=
 =?utf-8?B?TVU5Rk0weUxDZWtyeUVyK1RWY1JZZTlIUWhUWXdvZ1B6VnpXUmN3dWxjNHZt?=
 =?utf-8?B?OWxYdFBGTlo0dFMvUDAwK2ZTblgwSVJUNUd1cnpIaDVVVS9NS0hMZFI5eGZw?=
 =?utf-8?B?TU5YTytGU2Q0YkxTTzNieGJpTnFjZ0ppSEg3OGtRaUZ3bWxQQnd3djJIRmxL?=
 =?utf-8?B?bmQ5dmtUM01OWXMrZEFoemJtYmd2eldRMkNMSWNnajc1U3l0Q2IrU05YdUJn?=
 =?utf-8?B?eFo5bHZWRkFnaS9LWW9nRDVYdkY5a1lmT09xUm1nL00vNjlJQzNROWZzYjZa?=
 =?utf-8?B?cDRpb29vUEZOVHFHZGEvYTRPTEYzZkdiWFB6YnFSZk1LeEIxWXdwbG5JY1lr?=
 =?utf-8?B?NTdVNm5STHJlMEIza3BJVURQZkJiaDFOOUQ1YXN4bkhLc0c4U3hBYU53M2cx?=
 =?utf-8?B?TFcyY1F1NjB2QUs1RlgybUZQekU1VkJRMWVmU3o3Q1pwSDVJdEd6QnZYU05N?=
 =?utf-8?B?ZjQzSlljc2NOUmM0aVdKOElLaURKWDRwcGo4VHJjS2xrT0pIUXlzM2pDcS9L?=
 =?utf-8?Q?e9e4AB8gKKxzjXIUjAj8lW8kC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b62a3f-66c4-4bca-1b33-08dd98eb052c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:42:13.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97OlgTRxPsXgGuFX40owqJMxpbR3UYL5vyHvdEe7kETryunamgjn817syn2NBtRFM9kWanXrPFWFuZ750k9jyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410

On 22-May-25 12:10 AM, Zi Yan wrote:
> On 21 May 2025, at 14:25, Donet Tom wrote:
> 
> In memory tiering mode, folio_last_cpupid() gives page access time
> for slow memory folios. In !folio_use_access_time() case,
> folio_last_cpupid() gives last cpupid. Now it is reused for node
> id. It is too confusing. At least, a new function like folio_get_target_nid()
> should be added to return a nid only if folio is isolated.

Yes, it can be confusing. If this approach of using last_cpupid field to 
store the target_nid is found to be feasible, I will cleanup the names 
as you suggest.

Regards,
Bharata.
