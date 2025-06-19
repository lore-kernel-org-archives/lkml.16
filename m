Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013086.outbound.protection.outlook.com [52.103.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F186242D6B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316397; cv=fail; b=NBWFFdfhDRDeC0aMu6UwetSAGGeUkm/0aWwZCeUEFaPR3Cs37aZBHGRwa9P8EM0S+8achGr/oMVvqMByqgZcSDWvNMZ/U0Ll4OCNNMmEkoXapQVwsltLHuLexRnZx3eM7tLf6jhrLOx7T6y0YtZbNyekafWTaJxtKVNj7jXpXtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316397; c=relaxed/simple;
	bh=vy7M1UpktrWreNlzMTyTHXxljk7ciCWLttTeQECScCQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jwAZAcivZNbdl6Jn3b4fIM5wHCyXnm9ARnTIFHYc+sQ8aiTuvU1uDp3jfXRgkIui40/0WHm0KuBvFUKsw44YJr4iu5XNzHv+6nGDI3OkWsd64JRTJPck1iXcsV7bdISS+XF9PQC7I94oFVAdPA/aSlUi0dsGfUGQZnPRDrtdFIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lw6ZB5iC; arc=fail smtp.client-ip=52.103.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lw6ZB5iC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik3hUiCPf9yT7nUyMvvJaMT5cNBj141gsgRf5fVOSyu102BYCMg8TRo7KcMLq9L5jm0GWqbvvnuSL8fcFOVXl8s5SmpLXnX93jPgut8/NSGsKZj21OijCtcq52eHioiL1K01nOCeFDe//yF8z+FbHiuhEcnOSR/lNJbkx5Hn/iGk5pDsUpAv7S5J3kjQxlyDfmJ8mfy6eiHailqmf4hFtZ/yBYtmowaEM7iIseZy26Hhr43UTebjzZT9BL1y5ZBWTHprVT9emDkgZCiwQP4tuzkJ0DjyuRLr/SMyTrtrDHNWDRqC2QmN7p4ElhNrXPdsUgqbl7raQ+UqwJlpRd0W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwnPZzniMNLPRA3yVwy21jvgOvIsslDJX+Nx78JsY7g=;
 b=xLoC2LiaqAVQV5tJQIPYtj7ppL32H69DDboUjJGZAc7JQ6lCieZW7vyU0GXdw2kSFNkytxOB0lBB5G8C29wWfF7aD9TNEV+aYv/Zv8Jd3jAFCjbGZQXQJxSZKxnLco0dL4fy143IV/pzclBExx7EDaoX0ZBXJaetxTdk7qIH11Rjq3ufyR0+1JgG1QkhuWoSrzTSZZztKMWpx27R/hRzGyWRNjLVAR3bKJn0mJKwHzSUY8HE3KwrohbzA2XimlLR6l/B77YOc7zV4FoZc7NW7R/ZCEPVwzkloPMrvpbj9B87VVP3IZXtwgaEKRwak/wXnH3np7ZnAzQHji2ZRFYynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwnPZzniMNLPRA3yVwy21jvgOvIsslDJX+Nx78JsY7g=;
 b=lw6ZB5iC0HlZ84N06QrRZiHBynurma48ZdG6vWU81xf2D5zRl29MrOmECJWUhO02Pbmmx9j8MpxBbVCOSNuchbfysyXlM/JrAruFzlssGTh32jnU14Jo7LZTNDGlcxDAeHxKgv1d7miRIy/A/NPl+zBlXo9fMy4nC2bcwHy+fRd9pGOdZ5rZ1XuwyA7SjY7f3uK0lBPAgGCMYDT4HjwBKapZGVmTnOLrCGPnVD/azILO73qGZuWr0vtSaI8zQt2ewaxCq8b70z0KBWNK8GY59sa7cUU6UrgsmGpcMA1MgAXIDyggqQmVeQIqyedPvm+oOZFF2A0OmNIvkRyYUJwvyA==
Received: from PUZPR04MB4922.apcprd04.prod.outlook.com (2603:1096:301:b2::11)
 by SEYPR04MB8915.apcprd04.prod.outlook.com (2603:1096:101:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.31; Thu, 19 Jun
 2025 06:59:49 +0000
Received: from PUZPR04MB4922.apcprd04.prod.outlook.com
 ([fe80::9112:18ba:3fe2:5f75]) by PUZPR04MB4922.apcprd04.prod.outlook.com
 ([fe80::9112:18ba:3fe2:5f75%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 06:59:49 +0000
Message-ID:
 <PUZPR04MB4922D5FAC4A8C88023ADB2DBE37DA@PUZPR04MB4922.apcprd04.prod.outlook.com>
Date: Thu, 19 Jun 2025 14:59:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Jianyong Wu <wujianyong@hygon.cn>, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <5216c899-efec-4524-a5a1-1fdcd2834165@amd.com>
 <PUZPR04MB492296C8301DDA9654D7970CE37DA@PUZPR04MB4922.apcprd04.prod.outlook.com>
 <4ec144f7-2b07-4d56-93b9-d23dcbe0d6fe@amd.com>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <4ec144f7-2b07-4d56-93b9-d23dcbe0d6fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To PUZPR04MB4922.apcprd04.prod.outlook.com
 (2603:1096:301:b2::11)
X-Microsoft-Original-Message-ID:
 <bdd3b436-03b6-4a53-9ddf-b7648b298eb1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB4922:EE_|SEYPR04MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: b44f4c2b-488a-4476-a1bc-08ddaefee1ff
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|15080799009|41001999006|5072599009|8060799009|6090799003|461199028|4302099013|3412199025|440099028|40105399003|10035399007|56899033|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU9FS0VTdm5qL3B1ZEZCeHpPeVlNQkxocFFtYVZSN0tSRStHWmIzUFF0blo2?=
 =?utf-8?B?Q1piaU10MTVUeWpKMEVwQUk0K3lSYjd0dnZ5MTJIN2g0azRQS0ZXWDR3OVc5?=
 =?utf-8?B?M1VMczdpUWsrSThVMWYydmV4RjR6Tm13dUxkMDh0TjBPTmEvYmRjSDdPQU9x?=
 =?utf-8?B?dytnYmtKWXB2OWhnNG95ZXNuL0NCbDhBcDY4eTdtdmd4emtvbm5wWm9nMDlP?=
 =?utf-8?B?WmN5SlpLWVFNSW03clBiWDF0MHVTbVdoMFk3aThkMG1ESE1xRWlOanNORktV?=
 =?utf-8?B?cXlhQlVGWGxaWnppTVZhODVLTkxKVVh3aXNvai9LOFZRUFVHdFNFQUxDUktW?=
 =?utf-8?B?dlR6aVliRXV5SVBNVjdxSW9tbkl6NmZWSG8wejNScGlJQjRUU3M2eis5UExB?=
 =?utf-8?B?dnUrK05pODJLY0pRZVVjOHlHN2xFU0d1c3lHdFpUTkRuMmp4aEF5NlNBWTZK?=
 =?utf-8?B?eDNlMFJuVmk1VDlxVzRwZis5dmVQR09LV2U4RnN4RExUY3RjVXdsTWJsUGF5?=
 =?utf-8?B?VmwreFcrditzYXpwWkt1amdrRjhyQTlhU2x1c2RETGpkS0c5WmVBZzFVeXE5?=
 =?utf-8?B?MHhGQ2kxRVY2S0RkVTVqc0tCVDNlRzlTcWdpU3FObEMydmdrYkVQejdsSk91?=
 =?utf-8?B?amZRaDZzMnlkWEtyN3JLL2JRclpCZHVtK2NhRVdRQW1ZU1JjUUxjMjdxUnVZ?=
 =?utf-8?B?cENTSTBKVTk4QkQ5T01objRIVGx3a0NWSU5xbW9SM0xYMUs1RStDNzB2YjVw?=
 =?utf-8?B?R1oxdjZrUVhVbTE4TE4rSEdyT2hpZXplK2o1Vk9haGdNNzBsN2Z0V0d6bjRE?=
 =?utf-8?B?VzFEVUtVQ1g0eEtuODFWaWxFalU0K3VyTm5UbkpiQ1A5K3hJQzJUYzFpWnc3?=
 =?utf-8?B?RDIvZFpZckVYNkd0NnJqMysvNnVramEwQ0xmQnpIUVUxekxLeUZTaDF5ZUJp?=
 =?utf-8?B?WHYxaGd3dDU2bis0azRWdnF2T0hXRFQvNndBd200UGgydGJRNExZZHpVMGE5?=
 =?utf-8?B?NzNqaStGbk0zcGhDWmNFVnZnQXdWblJmdkh5dUU0M2UzOXV2Yjh5YW90blU0?=
 =?utf-8?B?UzZvMDBrOWlWNnQ0YytTdnZpaDhkd0JuZzcrMW9jbnhZSUYwaEx1T2QrVFNi?=
 =?utf-8?B?RzdDeWxqLzdJb3JYaUZmR3prRnJuMnBWK0VRUm1Kb3RXaUNCYTl0bmZZQTFQ?=
 =?utf-8?B?WnVoeFA1K2F4UWErQUtRNWx4K3hqd2sya0ZVVTU1VjBqMmY2ZlAwRGJNa1Yr?=
 =?utf-8?B?WFh4VzM0Q3N6ZVdXMzNLRFY5WU5LSmpoc2xYRE4rNU5GT0ZucjN5d2hlamFI?=
 =?utf-8?B?eThtZHpDb1JzNmQ2OWhEc3Z4RThzMHh2Q3ZFYXlxSERlSVJvbE15UVBHUlky?=
 =?utf-8?B?S1A1RFdIaFZZQ1h4eCtudnhrVThMVWdYSEdiTmdKbExxdkR4OUEvaWRNRVdT?=
 =?utf-8?B?TEhqdEhNWjVCWmRlM3BIR0tLWWo1aVRjbmVZM2lYdjBmVjdHZjBjSjRlclpQ?=
 =?utf-8?B?bEw2TmFHT0pVVTVST203NE01cms4eUhudVZjZHR2eVk0T1NXRE0zQ2NZcVE3?=
 =?utf-8?B?UkRoR3l1N1VJV0lJWk9wZzJ6WTlkdUZuQ1dTbWJ0L3NUekFyZWQzSWZueTc1?=
 =?utf-8?B?N3ZsRlJXT3huV0xOanhUWk9mTXBYTU5MV3BGSzhuejYyU3BKYTcxdDUwYnY0?=
 =?utf-8?B?akVYbXprTE1KeHlNRzlWMUk2emdzeFdlcHBJcjBjdDFYREFVeVBDdFZnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNoQTk5bHR4ZEJVaUJjKzhNdzQ0c0VSQTlrbkl4T3ROcXV4NUN5ZkhuYURZ?=
 =?utf-8?B?c3dVUTZyYVpLNk9lWjgzc0ROZGdrNXZpVk9hMHE5YzVVL3hwZ1Y5Sm9BbFZT?=
 =?utf-8?B?VFE4SlhKQ2x5Z1JjeFNIYUw0Z0hpNjBNQ0RlcHZxUlBLS3REeFV1aHZkaEhR?=
 =?utf-8?B?bDF0eHNQeDJEcUVES3hXcThaR0Vva0srMEdtN041WWxReTNVRGF1Vllhemox?=
 =?utf-8?B?QStuV2YxTGFSb3FBbXZNTkFoRmkvbk03RCtsakxnMlpQa0tXUWtjbVhGOFJv?=
 =?utf-8?B?S1RoNjJjeFdyeWc4ZHBFaXFuU1ZyMXdKT25Yb2J5Y3FPQ21SdzY3MGgwbTNx?=
 =?utf-8?B?YkIxS2RLY3pxd05ITENxVDJSaTREZ2lyVkl2NVBCQlpaZ3JobmdWUVUwZ2hx?=
 =?utf-8?B?d1hXbHVTcEdLS3JtRlNlQ0tUbkJCMnAxMkJWbjgyektCdkNxN3YxcDZmNVJt?=
 =?utf-8?B?U1phTEpVOFJxYUxLc3JwWGlUOXdvMS9uakdEZE1qRXk1TVdIOVdrdGV2ajRC?=
 =?utf-8?B?dHR0TEFnN0ZSbllmN0xsZDVFWkNGdWRCVHR0L0tpSE1DaGJmbThpOG5DTmha?=
 =?utf-8?B?ZmE2SXF6bFBRSDlBV3d1dXVsL1dpUzhPSTgvTnBKZUFDZGFQMHp2Mjh6ZUVP?=
 =?utf-8?B?OXRSVFdwL2RBeXNzWFRacC9nMDdCbFduRlh6NDVrWmlyTGlWbkJnUzJBb1Zu?=
 =?utf-8?B?cmovTzNISm8zYWYzNFZtamxGZjdDNXdLenpuV0Z1bHNVcTlPN3VQZ1FSdkdu?=
 =?utf-8?B?UHgzR3FwNkozclJlWG1GYWRaV3N5U1p3MEhFMjJaOXdINFZhbG9aRHVCOVJh?=
 =?utf-8?B?SXUvK2ZBVHBKM3A0RWJqMHo4RG1MWWZIMjg0VkRWaXNkNTdDRDNsaGlmM3h2?=
 =?utf-8?B?ZFp1YStSaGpaSE5QMkRDME5LWUsrTjUzTnJydlVodHdNNkF0azdQTjV5Nmsv?=
 =?utf-8?B?RnRkSzdmeFpYZGhtRkh4Um55YlRleEpZOU5nbVRkaWQxcHNhTVU3ZlZ2Qjhu?=
 =?utf-8?B?Wkk3R0J4T1ZEdmFOTUE3bDVFdWdYZ1p2b3E4NzVDWE1TRXEvRzJYYWtmaW1X?=
 =?utf-8?B?ZjdyQ3ZOUlQxQUpNVmVhTEQ4c1JYN1Uxa2NZNFBnc0VMbjFUSW9ocWg0RVp2?=
 =?utf-8?B?VXlHK1BsdTdrZnlubDhQaExlTVJoK1RYV2JhVi9sUXNrajc5Z21JVXhKZ3da?=
 =?utf-8?B?OEYycTNmQmV2a0JDS252dEhoY2hZQy9wU241TTVtK29oc2doSzBUV1pRRXJF?=
 =?utf-8?B?NklIck03dTBjOFBGRDQ3R1hNRHV3YmJnTzg4NmVEUFAxakRETUc0S0tZZnpm?=
 =?utf-8?B?Q2tMNWk4QlpoYVZxTHl6TjlGdmdvZ2UzeVZqTUwycy82WVVQano2UFdBR2RF?=
 =?utf-8?B?N2x3Q1pYenhuYWN5aFFKTjJ1ZXhta3FwNWRibHhDTEFhcXpPZzNvNU83Z0Vt?=
 =?utf-8?B?bUdsUkNPMStjMllyNUl1SXF3VlZrVnQ3UFBGb2RJS1VDdDlsMFNQQk9QdFFj?=
 =?utf-8?B?VDNWcGhtemlWZ1pHMFU2N085STVvZ0JiYVNYbjI1QkFHRjZ1QW52OEc2c0hk?=
 =?utf-8?B?WVJhUHF6R3NmQ0E1OXFTV1BHbjRhS2NJNHNPRjVOZ21tTjVwT0ljR3YxTG12?=
 =?utf-8?B?T1dHN3VGL1N2YW5KUTMxaE5iRk5Ha2s5NmxlZmMzdUd2ZXNqaU1kM21wQmZB?=
 =?utf-8?Q?0Xxuo/A0lO2Qd95FPt0J?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44f4c2b-488a-4476-a1bc-08ddaefee1ff
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB4922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:59:49.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB8915

Hi Prateek,

On 6/19/2025 2:30 PM, K Prateek Nayak wrote:
> Hello Jianyong,
> 
> On 6/19/2025 11:38 AM, Jianyong Wu wrote:
>> If this change has bad effect for performance, is there any suggestion
>> to mitigate the iperf migration issue?
> 
> How big of a performance difference are you seeing? I still don't see
> any numbers from your testing on the thread.

Sorry for that. Here is the data.

On a machine with 8 NUMAs, each with 4 LLCs, totally 128 cores with smt2.

test command:
server: iperf3 -s
client: iperf3 -c 127.0.0.1 -t 100 -i 2

==================================================
default                  allow imb
25.3 Gbits/sec           26.7 Gbits/sec     +5.5%
==================================================


> 
>> Or just leave it there?
> 
> Ideally, the cache-aware load balancing series [1] should be able to
> address these concerns. I suggest testing iperf with those changes and
> checking if that solves the issues of excessive migration.
> 
> [1] https://lore.kernel.org/lkml/ 
> cover.1750268218.git.tim.c.chen@linux.intel.com/
> 

I know this patch set. Maybe a little heave. I'll check for iperf test.

Thanks
Jianyong
