Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022129.outbound.protection.outlook.com [40.107.193.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4725B697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859872; cv=fail; b=bhg/y9cUO68p9xfk0vM/mWxDsJ4SzGbvuI2KQHDW33IfUr4AI/tg6AkuYVknPqG0MgOicO4ruezi0q17s7lfQNx8qzOCLOhZNz1Nfx2Rh4CtaCwIN+MlofaRQr6269xFT0WTbPPz2STABdfRH3ne/o/5z9wFeAL9/sDbezydyGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859872; c=relaxed/simple;
	bh=7rC/sxtUYLn2U8IWQa4fXtjP99LsBvAf0E5XyFRGt5c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fMnBaZUGxMfC0hsIfHogMroeYmgOm+ud4+NQG0eepmqNL2okbu0E1rrEvPtHvvyBJ6tFmePue82H3RDDfmvZCOL12eYjI3uILiB/dhOR/LP/rE7ZfSqrSxDK1nnpfso/7BVm/+FBA8NH0Phnc5cS3DwFB2Totove5My9BXDwysc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=NUrk++18; arc=fail smtp.client-ip=40.107.193.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="NUrk++18"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHVG/S14joGGiJWtaR6dIezK99rX6OhK2QbBhpQfXMZsBkzhrxpb32p8g9CQwU/uDZBdc8TVHqGWxCQU/lR1mkDRqmdgAWC84+Xn2TRk9WiKXZceid/LuC4AAuCt06W88j0b7SrN36dEdk+KpWFUpblCIRk/bgG90fnWofufMJ1RaYv6VqpbXRZ+k4p8ueWWq6VWNk/jyUwf8NdjAO+Z9NQhJEdD5mHjTWucrAzNiFw+Wp/LNmnykPEJjB9DaKWdmKGz5l0/yctmFa5xTKS+A0OxZgr3SrponvlCHRAFcg2S9d2VGTMqxJAt2UDKOIF1wBolB22jPmXeemosvxB1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSi4VCdDKgrj96zZ2jH8GQDPKKDmfZO4T/5q4FWtDaw=;
 b=JBNSK4PuY5LiKmpNOmASa/918UHR3YtbMcx7N8C1Ka8h7KHopPXxRWu0LFa/OZRfqXZOMb7c+Jq9zrzbjDdm8u+crfjG6EpUVGa4kR+mApCLGSg9V6p+Wmn/rkFAtJTnZ5n2HT5dEneu8iBF9gZC04MTANM+/ruGj9pIX5DycPUEe8DzdyiGTCF9JDs7QLzCZoIj3LAFFeg7M5q9OVZ4csxZBrPz0InuGm0Fnu94OmWpmoHiC/mUx0xFnU6X6o3kbmGC/sYnrDCAlZSKwneftOl7MaKHhRU3Ue6nv/TQAo6OIlTDl3B80OSqJrvmmrG8mgefUTlVAkEnR+OiglSuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSi4VCdDKgrj96zZ2jH8GQDPKKDmfZO4T/5q4FWtDaw=;
 b=NUrk++18Cb+jVyitlt1qn4T9Kl8myqhSbioWiW7KQcRb2DU+rjzmXKE5AoV0LZ7KlCbm5b3+BEwVBEJV/kpzj4RvTDvFQTUiguwgYvOAoVX3sykJCSvWzDzJRhvQ5vZCu/5MOcVKCzGrgFB0Zpx2jpae9VfmDkpNAq3UMK8MmU0FUmIppiLwP53SwyS86hl4q0Ommlj80jirMDhgoqTcaz9yIOueCIaQPEVbFt2xAS4U3HWAT9m2p55t7mW1FMhvCyAliY57Ri94riMBFvKYOaBAabsPMJ8gTQLP4TJ5vlT0ewrTE3RbuegvOAZBoDNwkWMevJ5L3tZT2uPY2LvjkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by TO1PPF7CC024CDC.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::65e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 13:57:41 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:57:41 +0000
Message-ID: <26df8965-a430-4be3-a523-d292905f32fa@efficios.com>
Date: Wed, 25 Jun 2025 09:57:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v13 2/3] sched: Move task_mm_cid_work to mm
 work_struct
To: kernel test robot <oliver.sang@intel.com>,
 Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, aubrey.li@linux.intel.com,
 yu.c.chen@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.org>
References: <202506251555.de6720f7-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <202506251555.de6720f7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0017.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::26) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|TO1PPF7CC024CDC:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6b4262-4768-424f-3d98-08ddb3f04056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlJ1Q21xTlRJdkh1bndNN0xlVjRQcjJrcmxnbXBMUXlFMjZPK3MxWFBpdFlL?=
 =?utf-8?B?VEJIODkrdXJ5Vkc1NDJ1NXlNcitJMlJFRCs0Sm84WnNhRjJLUWxaS0R5eUt5?=
 =?utf-8?B?WWpQS3k0MENOUGZSaVlQVkorRUFiYzA2N1poOXoySHRHNnE2Z2Y3bnRzRndJ?=
 =?utf-8?B?TkxaUHVyOFJVQzRGQkhzeWVHcitxbW9neWYzSjJmMHJ6ZTlCN1BHRUpDRGdv?=
 =?utf-8?B?WDhod0VXL21Edk9URkRrdVZ3c3hNVG51Vm5MaHNKaW5xMWxpSGkrcnErKzRI?=
 =?utf-8?B?c3o2MjhnRzFsaU54ME9vNTNTNDNtbWt2dW9reXlYY2grejI1S0tLY1V5YlUx?=
 =?utf-8?B?ZXZPY05vS1pjWnRzNDRnRnBDUk5COG5leXJldG1pcWdJMTR4ZEw0WGJxVDIx?=
 =?utf-8?B?NnRwMUNYdHVqMFRzdDdFOGJ6SkZ2MnlnYlpCeHVqYmtjaHdhWi91MW52VzVl?=
 =?utf-8?B?QWs3VS92cjY4UkF4UmNtYkxQQlBLMDBmRmRCUjhDeENVU0VFaU1WeEpNYVVw?=
 =?utf-8?B?ZnJwK2JmTVdBWGFhV0crUDN2SVVyUEJ2cUtWYWIwck53T2xCRlJHR1dPYkw3?=
 =?utf-8?B?M0I4QzU3TURkYnZvLzFEb3ozWFlBbmw1eUU2N3J6LzYwNkNCZ3VPcnNjMlpp?=
 =?utf-8?B?cVV2Y0JRSUh1Vm85NEVqaEtuOS9ZUlc1Y3ZxRVc4NTZ4MFY1ZTl0K0pRTDZK?=
 =?utf-8?B?TWxudEhoVkNRUmpqSm10bzFhN2FPdmxSM3dMdUNyZjA3OWNvb0ZRVzh2cnBV?=
 =?utf-8?B?K0xDRDNqVGwzbXlqN2NhTEx3dVhJV3laWjEycDArektxM282Q09XNURWdTVn?=
 =?utf-8?B?ZVU0WWZqSUhRZitGZXlPM0FnR0M4blVra0ptRG9mTm5jRmlMNFpGSkZSU0ZB?=
 =?utf-8?B?NkNhTGxDS25aQlRoQnNCaSs0SDRrOHJhNWVoNzBrelVOZDkxUlN6dis2MU5P?=
 =?utf-8?B?TmF3bGdyNWFnSFh5MzV2aWI4NmFCYnBUOE4wUXZWYndTTmwzUVJ6UER1UGhI?=
 =?utf-8?B?eWlVbzBKb2Z0dVJCUVN6NEhEOG9uWEU2Wnhmc2JGdnBCMnA4TW1oc0I5YTFZ?=
 =?utf-8?B?U2RSZGpsOFBJZlB5ZEJKZDlSNUNOdklWb0xOU1A0b29CenhuMXVEOTcyWVdT?=
 =?utf-8?B?bWgxdmNSOC8xSFZoS25WN1Nyc24yZEZZRkg0dXpaK2tvWE96RTFjZGVMcnpK?=
 =?utf-8?B?NFZSaDJlK2VveXRHQnhwRWtWTXlMbFhzYVZOTzBmeVkrbE9XL1B6N2lmK2dx?=
 =?utf-8?B?L1d4MncrWVp3SmJpWWtHU1o5MGhySWhvdklROWx1TlZqSStNanNXbTRzOUZz?=
 =?utf-8?B?MnYzZnlwNy9ZUStQbUN0ejNBSnUrRlJJYU53V0RqVXgxay9sanBESXVFT3JL?=
 =?utf-8?B?cmFuaHRxM2JDMjZpVHJuNUY5ejFmZFNMdUpzZit6ZDFiaURsbytQcUluWUpw?=
 =?utf-8?B?K1FhYWd4SWF5TmJINXJOMjkwUFJNRHJkWEMwa0JsTW9JYmRpWlQ5OVZCRXVX?=
 =?utf-8?B?aFIwdWgvR0toSy81TklVMmVZNkMwN3V1SGlRUFk0RCtmSkF5YkJ6N0FIOFp5?=
 =?utf-8?B?cWorcGVsWDhQeUVDN1RoNG1haGppRWg0bUl6dmRNT1kwdlYwdy8rS2Y5NVF4?=
 =?utf-8?B?RnhnaXozUUp6dEFBQVVacCtTdllYb1NNQVdqNWhXOEJIeGtWVG9ROVNJdFdl?=
 =?utf-8?B?MkRjNzV4UHVacG93bVU4V1RLRDhtNU5xUGtwbmU2cXA1Z3ZtN2tuMG8yQkRM?=
 =?utf-8?B?RG1QNlpITzltck92ekpDSjlJSlkrTTBMbHVMcG9SVzdtSzY0OWtuUVlyaG03?=
 =?utf-8?Q?Y+gd5S+IbylEQ1DAxTLpZFPWrExt5/b48GoTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGoxNjZ4cUZkOEJxTVhTZUhMM2lDbENFQXg0U0lHTnBhbm5ycitwZVZjTDhG?=
 =?utf-8?B?cjlvZUYybGNsdEhuSnp2TjFMQzZjYnIyejBzdWViT0RJdkpJOTdsbnBsbFdJ?=
 =?utf-8?B?YzZJSFNCbDZCK1l2QWt0K0xhV1lqWFZCSFNKdXFWanNLN0ViL2M4a1VaMDE2?=
 =?utf-8?B?UmpOaHFLNVE1MXd0MkF1dG1MS0kwMGl2aWpoazhqWENhRkNIZTk2N3RJVkVS?=
 =?utf-8?B?TmhyY1JjSm9MNHlnK0N4WFJnZ1ZROERGeWhYNWp6aHhSNm13SEIvOEE1UHRj?=
 =?utf-8?B?ZSt3d2ZSWjREYkpuY05HMFlGZ1hBV1lod2ZhK1hYY1NkSzZBYnpQSncvdlNq?=
 =?utf-8?B?NGdkS2FBRU5DTlNiZEFvQzExM0NzUXVaZVVOZk1OYzhmb1Ixa3UvTG4zS0h5?=
 =?utf-8?B?djI0b1lsdHFNS3NHSnZpcHhJQUZvUnlkazdGZE9hNDZHTUlra3A4d21QV2w2?=
 =?utf-8?B?c2UyMU9qNFFZMy9SZHZKTlY2Q1p4NG5ET0VqQ1N4a1E3VWs5eWRzMnVWKytM?=
 =?utf-8?B?YnRubUdrVTlnMEpDbHNRZnlEbGxqSnpZVklmdnlTK2owSGhTaGRJQXZxRHFO?=
 =?utf-8?B?dDJSdVFuRjFPd3BhOW40NXQxRXZBSDV1eUswUkRDOXRZaXhtNGpkWmIyMy9F?=
 =?utf-8?B?Q25JL0NzL2c2L1hpZTZ2czRsN1BoNEFqOHc3QUJpVy9qSkp5am1TQnV6L3Vu?=
 =?utf-8?B?NTJiM1NmUWhYN0xqc2lGUlR1MHR6WnlIVE9ZV1dTeEpJUVRpNUNrUzFwcitZ?=
 =?utf-8?B?OHcvdUxuRW5ac3hmN2JicU8wRWV2Qi9DTDkwY09IU0FMUTV1YzZKVElhM0Q5?=
 =?utf-8?B?dTFWSTlhdFM4ZkErU1ZNQjZweDZXL0FBTlNwdlMydXBIaUcvd1dneG5zL0xU?=
 =?utf-8?B?ZjZLV1FsZXVFRTBnUkJMOHRjdWlMdzBLbXlqU21GQzFBYm91L3N0VHo1SnRl?=
 =?utf-8?B?ZllpKzFWSUtnbm5SaHh0TGd6UGswNGJiNE9ZWkxxVFc2WGl3RUFUYmFCOS94?=
 =?utf-8?B?NFFpRDI3QUtQOTNEdCtDMEE4MThzYzZwVE9XMk9BSnpRRkg2d2lhVHhDS3Rj?=
 =?utf-8?B?bk8xTWFETXBIbXNLMmU1YlRvWWFjbDV0T2xFZjRwVGNyQlVwcXRPcWowa1U0?=
 =?utf-8?B?QjhVUEN3MWN5M2xlS2w1WHpaRlVEd2ZDbXdqWC9ZZE1QSGNrWTFHaHV5VzN5?=
 =?utf-8?B?UmgvdDVxK1BEb29kV1dtOVZJNlFDMG91aVNZbXh2QmROa1BuQ2JCWG1GNjhO?=
 =?utf-8?B?aVBxaWZpNHRtMmIrR1p2ZitkOUlpVmFxZVRoVGR5K3VkRktVS2JmSGorWjVa?=
 =?utf-8?B?dUlCaSsvZk1Ha2V2R0Q0clE2QUV1MzcrVTlSa1BpSlNZWlZDejhtb1k0cDVP?=
 =?utf-8?B?UzJnN3lpazJyTlBNNFV1KytaazhkeUhqcDRLSTM0dlUvTE9JSGt6RGtESkNk?=
 =?utf-8?B?T0t5aUtSZkFmQnpkdWRJbHlnNTZXbDQzODJvajgwWXhHaDBkaWY5cGdWZTB1?=
 =?utf-8?B?cG1xMTNsdnlCN1pmS0FOOHFDYThRcGZ5U0cwSmgvclV6VjRHOW9FM0UyeHFX?=
 =?utf-8?B?QTJqcFlVcUM0R2VuaFBFeUp3QmI2bm9uemtQbDBOdWVVbFVhL25Lb0U4U2dj?=
 =?utf-8?B?TzZYSW5MTjVLc2hlZDVCb1dkd1BybmJzUTJkQWNrSk0wcE5aQkNId21DTXdz?=
 =?utf-8?B?TWlyd1hLQ2E5cVdwRkw5RXlLYTdvMGVZdmNzemIydTExZUExa2p6NVlEYVJC?=
 =?utf-8?B?TWc2dG1uQmJqcCsvRDliVk1odzlmYjczTEtEWUNDNEpvU25veTZCRGRqRmNj?=
 =?utf-8?B?eDZYT1ZHdUQwaHRtRlRzcGNXc3RWTnJZN3htczM2cGRzZnh0amgvZXlhclZM?=
 =?utf-8?B?bk5mUG5GdW9vcnRNUFNuKy9sZWpMNWhYSWJ0cVFERWk2ajJ0U3oxNU0vd0xt?=
 =?utf-8?B?R3VjdTNMMTdXZ3hwVU9JNUVIeS9hdDM2dG1WbWhOeC9nZVZwZUVZdklEYWw0?=
 =?utf-8?B?NnorZzRoY053ZWVFMjBNVXBrY3J3S1lDOE5rZDl4SEFrdkFqTXp0U1BHTjFD?=
 =?utf-8?B?NGlSMVdNTVVkUHRzaytNRGt5dk03dVhvbkMyclNXSFVJcFU2T0c5YjZ0dXB3?=
 =?utf-8?B?Qnp6TzNKZVladHY4dU9Pa3o4ZzRjdUpiR010Q2RKTm1hRE5wOFExdis1dXJN?=
 =?utf-8?B?Q0NrUFdQSmJiMVZMcUlIUzIxOFc2UWNlV2Nxd29zcGEza200WnFOVFFNWTFQ?=
 =?utf-8?Q?RNub0SlvM8U9jabcOoFwaqtFKOZ6k1EJMY6qkpVogg=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6b4262-4768-424f-3d98-08ddb3f04056
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:57:41.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6v85wg55SnH2y79THhZMYaC1Fto8dNOvSSAtdtysmB1mi1YKc3msf0mxZas/XpnRw+9nPJCkbyyS7E2B3B0jo/SZpFYPCPR+bYY9sO6xIN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPF7CC024CDC

On 2025-06-25 04:01, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed a 10.1% regression of hackbench.throughput on:

Hi Gabriele,

This is a significant regression. Can you investigate before it gets
merged ?

Thanks,

Mathieu

> 
> 
> commit: f3de761c52148abfb1b4512914f64c7e1c737fc8 ("[RESEND PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct")
> url: https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/sched-Add-prev_sum_exec_runtime-support-for-RT-DL-and-SCX-classes/20250613-171504
> patch link: https://lore.kernel.org/all/20250613091229.21500-3-gmonaco@redhat.com/
> patch subject: [RESEND PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
> 
> testcase: hackbench
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	iterations: 4
> 	mode: process
> 	ipc: pipe
> 	cpufreq_governor: performance
> 
> 
> In addition to that, the commit also has significant impact on the following tests:
> 
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | hackbench: hackbench.throughput  2.9% regression                                               |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | ipc=socket                                                                                     |
> |                  | iterations=4                                                                                   |
> |                  | mode=process                                                                                   |
> |                  | nr_threads=50%                                                                                 |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | aim9: aim9.shell_rtns_3.ops_per_sec  1.7% regression                                           |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | test=shell_rtns_3                                                                              |
> |                  | testtime=300s                                                                                  |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | hackbench: hackbench.throughput  6.2% regression                                               |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | ipc=pipe                                                                                       |
> |                  | iterations=4                                                                                   |
> |                  | mode=process                                                                                   |
> |                  | nr_threads=800%                                                                                |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | aim9: aim9.shell_rtns_1.ops_per_sec  2.1% regression                                           |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | test=shell_rtns_1                                                                              |
> |                  | testtime=300s                                                                                  |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | hackbench: hackbench.throughput 11.8% improvement                                              |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | ipc=pipe                                                                                       |
> |                  | iterations=4                                                                                   |
> |                  | mode=process                                                                                   |
> |                  | nr_threads=50%                                                                                 |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | aim9: aim9.shell_rtns_2.ops_per_sec  2.2% regression                                           |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | test=shell_rtns_2                                                                              |
> |                  | testtime=300s                                                                                  |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | aim9: aim9.exec_test.ops_per_sec  2.6% regression                                              |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | test=exec_test                                                                                 |
> |                  | testtime=300s                                                                                  |
> +------------------+------------------------------------------------------------------------------------------------+
> | testcase: change | aim7: aim7.jobs-per-min  5.5% regression                                                       |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory     |
> | test parameters  | cpufreq_governor=performance                                                                   |
> |                  | disk=1BRD_48G                                                                                  |
> |                  | fs=xfs                                                                                         |
> |                  | load=600                                                                                       |
> |                  | test=sync_disk_rw                                                                              |
> +------------------+------------------------------------------------------------------------------------------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506251555.de6720f7-lkp@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250625/202506251555.de6720f7-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
>    gcc-12/performance/pipe/4/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/hackbench
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       55140 ± 80%    +229.2%     181547 ± 20%  numa-meminfo.node1.Mapped
>       13048 ± 80%    +248.2%      45431 ± 20%  numa-vmstat.node1.nr_mapped
>      679.17 ± 22%     -25.3%     507.33 ± 10%  sched_debug.cfs_rq:/.util_est.max
>   4.287e+08 ±  3%     +20.3%  5.158e+08        cpuidle..time
>     2953716 ± 13%    +228.9%    9716185 ±  2%  cpuidle..usage
>       91072 ± 12%    +134.8%     213855 ±  7%  meminfo.Mapped
>     8848637           +10.4%    9769875 ±  5%  meminfo.Memused
>        0.67 ±  4%      +0.1        0.78 ±  2%  mpstat.cpu.all.irq%
>        0.03 ±  2%      +0.0        0.03 ±  4%  mpstat.cpu.all.soft%
>        4.17 ±  8%    +596.0%      29.00 ± 31%  mpstat.max_utilization.seconds
>        2950           -12.3%       2587        vmstat.procs.r
>     4557607 ±  2%     +35.9%    6192548        vmstat.system.cs
>      397195 ±  5%     +73.4%     688726        vmstat.system.in
>     1490153           -10.1%    1339340        hackbench.throughput
>     1424170            -8.7%    1299590        hackbench.throughput_avg
>     1490153           -10.1%    1339340        hackbench.throughput_best
>     1353181 ±  2%     -10.1%    1216523        hackbench.throughput_worst
>    53158738 ±  3%     +34.0%   71240022        hackbench.time.involuntary_context_switches
>       12177            -2.4%      11891        hackbench.time.percent_of_cpu_this_job_got
>        4482            +7.6%       4821        hackbench.time.system_time
>      798.92            +2.0%     815.24        hackbench.time.user_time
>    1.54e+08 ±  3%     +46.6%  2.257e+08        hackbench.time.voluntary_context_switches
>      210335            +3.3%     217333        proc-vmstat.nr_anon_pages
>       23353 ± 14%    +136.2%      55152 ±  7%  proc-vmstat.nr_mapped
>       61825 ±  3%      +6.6%      65928 ±  2%  proc-vmstat.nr_page_table_pages
>       30859            +4.4%      32213        proc-vmstat.nr_slab_reclaimable
>        1294 ±177%   +1657.1%      22743 ± 66%  proc-vmstat.numa_hint_faults
>        1153 ±198%   +1597.0%      19566 ± 79%  proc-vmstat.numa_hint_faults_local
>   1.242e+08            -3.2%  1.202e+08        proc-vmstat.numa_hit
>   1.241e+08            -3.2%  1.201e+08        proc-vmstat.numa_local
>        2195 ±110%   +2337.0%      53508 ± 55%  proc-vmstat.numa_pte_updates
>   1.243e+08            -3.2%  1.203e+08        proc-vmstat.pgalloc_normal
>      875909 ±  2%      +8.6%     951378 ±  2%  proc-vmstat.pgfault
>   1.231e+08            -3.5%  1.188e+08        proc-vmstat.pgfree
>   6.903e+10            -5.6%  6.514e+10        perf-stat.i.branch-instructions
>        0.21            +0.0        0.26        perf-stat.i.branch-miss-rate%
>    89225177 ±  2%     +38.3%  1.234e+08        perf-stat.i.branch-misses
>       25.64 ±  2%      -5.7       19.95 ±  2%  perf-stat.i.cache-miss-rate%
>   9.322e+08 ±  2%     +22.8%  1.145e+09        perf-stat.i.cache-references
>     4553621 ±  2%     +39.8%    6363761        perf-stat.i.context-switches
>        1.12            +4.5%       1.17        perf-stat.i.cpi
>      186890 ±  2%    +143.9%     455784        perf-stat.i.cpu-migrations
>   2.787e+11            -4.9%  2.649e+11        perf-stat.i.instructions
>        0.91            -4.4%       0.87        perf-stat.i.ipc
>       36.79 ±  2%     +44.9%      53.30        perf-stat.i.metric.K/sec
>        0.13 ±  2%      +0.1        0.19        perf-stat.overall.branch-miss-rate%
>       24.44 ±  2%      -4.7       19.74 ±  2%  perf-stat.overall.cache-miss-rate%
>        1.12            +4.6%       1.17        perf-stat.overall.cpi
>        0.89            -4.4%       0.85        perf-stat.overall.ipc
>   6.755e+10            -5.4%  6.392e+10        perf-stat.ps.branch-instructions
>    87121352 ±  2%     +38.5%  1.206e+08        perf-stat.ps.branch-misses
>   9.098e+08 ±  2%     +23.1%   1.12e+09        perf-stat.ps.cache-references
>     4443812 ±  2%     +39.9%    6218298        perf-stat.ps.context-switches
>      181595 ±  2%    +144.5%     443985        perf-stat.ps.cpu-migrations
>   2.727e+11            -4.7%  2.599e+11        perf-stat.ps.instructions
>    1.21e+13            +4.3%  1.262e+13        perf-stat.total.instructions
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.__intel_pmu_enable_all.ctx_resched.event_function.remote_function.generic_exec_single
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl.perf_evsel__run_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp._perf_ioctl.perf_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.ctx_resched.event_function.remote_function.generic_exec_single.smp_call_function_single
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl.perf_evsel__run_ioctl.perf_evsel__enable_cpu
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.ioctl.perf_evsel__run_ioctl.perf_evsel__enable_cpu.__evlist__enable
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.event_function.remote_function.generic_exec_single.smp_call_function_single.event_function_call
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_for_each_child._perf_ioctl.perf_ioctl.__x64_sys_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.generic_exec_single.smp_call_function_single.event_function_call.perf_event_for_each_child._perf_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.ioctl.perf_evsel__run_ioctl.perf_evsel__enable_cpu.__evlist__enable.__cmd_record
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.perf_event_for_each_child._perf_ioctl.perf_ioctl.__x64_sys_ioctl.do_syscall_64
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.perf_ioctl.__x64_sys_ioctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.remote_function.generic_exec_single.smp_call_function_single.event_function_call.perf_event_for_each_child
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_for_each_child._perf_ioctl.perf_ioctl
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.perf_c2c__record.run_builtin.handle_internal_command
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.__evlist__enable.__cmd_record.cmd_record.perf_c2c__record.run_builtin
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.cmd_record.perf_c2c__record.run_builtin.handle_internal_command.main
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.perf_c2c__record.run_builtin.handle_internal_command.main
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.perf_evsel__enable_cpu.__evlist__enable.__cmd_record.cmd_record.perf_c2c__record
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.calltrace.cycles-pp.perf_evsel__run_ioctl.perf_evsel__enable_cpu.__evlist__enable.__cmd_record.cmd_record
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.__x64_sys_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp._perf_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.ctx_resched
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.event_function
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.generic_exec_single
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.perf_event_for_each_child
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.perf_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.children.cycles-pp.remote_function
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.children.cycles-pp.__evlist__enable
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.children.cycles-pp.perf_c2c__record
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.children.cycles-pp.perf_evsel__enable_cpu
>       11.84 ± 91%      -8.4        3.49 ±154%  perf-profile.children.cycles-pp.perf_evsel__run_ioctl
>       11.84 ± 91%      -9.5        2.30 ±141%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
>       23.74 ±185%     -98.6%       0.34 ±114%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
>       12.77 ± 80%     -83.9%       2.05 ±138%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>        5.93 ± 69%     -90.5%       0.56 ±105%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        6.70 ±152%     -94.5%       0.37 ±145%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
>        0.82 ± 85%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        8.59 ±202%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       13.53 ± 11%     -47.0%       7.18 ± 76%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       15.63 ± 17%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       47.22 ± 77%     -85.5%       6.87 ±144%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>      133.35 ±132%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       68.01 ±203%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       13.53 ± 11%     -47.0%       7.18 ± 76%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       34.59 ±  3%    -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       40.97 ±  8%     -71.8%      11.55 ± 64%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>      373.07 ±123%     -99.8%       0.78 ±156%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       13.53 ± 11%     -62.0%       5.14 ±107%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>      120.97 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       46.03 ± 30%     -62.5%      17.27 ± 87%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>      984.50 ± 14%     -43.5%     556.24 ± 58%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>      339.42 ± 12%     -97.3%       9.11 ± 54%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        8.00 ± 23%     -85.4%       1.17 ±223%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       22.17 ± 49%    -100.0%       0.00        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       73.83 ± 20%     -76.3%      17.50 ± 96%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
>       13.53 ± 11%     -62.0%       5.14 ±107%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>      336.30 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       23.74 ±185%     -98.6%       0.34 ±114%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
>       14.48 ± 61%     -74.1%       3.76 ±152%  perf-sched.wait_time.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>        6.48 ± 68%     -91.3%       0.56 ±105%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
>        6.70 ±152%     -94.5%       0.37 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
>        2.18 ± 75%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       10.79 ±165%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        1.53 ±100%     -97.5%       0.04 ± 84%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
>      105.34 ± 26%    -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
>       29.72 ± 40%     -76.5%       7.00 ±102%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
>       32.21 ± 33%     -65.7%      11.04 ± 85%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>      984.49 ± 14%     -43.5%     556.23 ± 58%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>      337.00 ± 12%     -97.6%       8.11 ± 52%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       53.42 ± 59%     -69.8%      16.15 ±162%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>      218.65 ± 83%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       82.52 ±162%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       10.89 ± 98%     -98.8%       0.13 ±134%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
>      334.02 ±  6%    -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
> 
> 
> ***************************************************************************************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> =========================================================================================
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
>    gcc-12/performance/socket/4/x86_64-rhel-9.4/process/50%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/hackbench
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>      161258           -12.6%     141018 ±  5%  perf-c2c.HITM.total
>        6514 ±  3%     +13.3%       7381 ±  3%  uptime.idle
>      692218           +17.8%     815512        vmstat.system.in
>   4.747e+08 ±  7%    +137.3%  1.127e+09 ± 21%  cpuidle..time
>     5702271 ± 12%    +503.6%   34419686 ± 13%  cpuidle..usage
>      141191 ±  2%     +10.3%     155768 ±  3%  meminfo.PageTables
>       62180           +26.0%      78348        meminfo.Percpu
>        2.20 ± 14%      +3.5        5.67 ± 20%  mpstat.cpu.all.idle%
>        0.55            +0.2        0.72 ±  5%  mpstat.cpu.all.irq%
>        0.04 ±  2%      +0.0        0.06 ±  5%  mpstat.cpu.all.soft%
>      448780            -2.9%     435554        hackbench.throughput
>      440656            -2.6%     429130        hackbench.throughput_avg
>      448780            -2.9%     435554        hackbench.throughput_best
>      425797            -2.2%     416584        hackbench.throughput_worst
>    90998790           -15.0%   77364427 ±  6%  hackbench.time.involuntary_context_switches
>       12446            -3.9%      11960        hackbench.time.percent_of_cpu_this_job_got
>       16057            -1.4%      15825        hackbench.time.system_time
>       63421            -2.3%      61955        proc-vmstat.nr_kernel_stack
>       35455 ±  2%     +10.0%      38991 ±  3%  proc-vmstat.nr_page_table_pages
>       34542            +5.1%      36312 ±  2%  proc-vmstat.nr_slab_reclaimable
>      151083 ± 16%     +46.6%     221509 ± 17%  proc-vmstat.numa_hint_faults
>      113731 ± 26%     +64.7%     187314 ± 20%  proc-vmstat.numa_hint_faults_local
>      133591            +3.1%     137709        proc-vmstat.numa_other
>       53696 ± 16%     -28.6%      38362 ± 10%  proc-vmstat.numa_pages_migrated
>     1053504 ±  2%      +7.7%    1135052 ±  4%  proc-vmstat.pgfault
>     2077549 ±  3%      +8.5%    2254157 ±  4%  proc-vmstat.pgfree
>       53696 ± 16%     -28.6%      38362 ± 10%  proc-vmstat.pgmigrate_success
>   4.941e+10            -2.6%   4.81e+10        perf-stat.i.branch-instructions
>   2.232e+08            -1.9%  2.189e+08        perf-stat.i.branch-misses
>    2.11e+09            -5.8%  1.989e+09 ±  2%  perf-stat.i.cache-references
>   3.221e+11            -2.5%  3.141e+11        perf-stat.i.cpu-cycles
>   2.365e+11            -2.7%  2.303e+11        perf-stat.i.instructions
>        6787 ±  3%      +8.0%       7327 ±  4%  perf-stat.i.minor-faults
>        6789 ±  3%      +8.0%       7329 ±  4%  perf-stat.i.page-faults
>   4.904e+10            -2.5%  4.779e+10        perf-stat.ps.branch-instructions
>   2.215e+08            -1.8%  2.174e+08        perf-stat.ps.branch-misses
>   2.094e+09            -5.7%  1.974e+09 ±  2%  perf-stat.ps.cache-references
>   3.197e+11            -2.4%   3.12e+11        perf-stat.ps.cpu-cycles
>   2.348e+11            -2.6%  2.288e+11        perf-stat.ps.instructions
>        6691 ±  3%      +7.2%       7174 ±  4%  perf-stat.ps.minor-faults
>        6693 ±  3%      +7.2%       7176 ±  4%  perf-stat.ps.page-faults
>     7475567           +16.4%    8699139        sched_debug.cfs_rq:/.avg_vruntime.avg
>     8752154 ±  3%     +20.6%   10551563 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
>      211424 ± 12%    +374.5%    1003211 ± 39%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       19.44 ±  6%     +29.4%      25.17 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.max
>        4.49 ±  4%     +33.5%       5.99 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
>       19.33 ±  6%     +29.0%      24.94 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.max
>        4.47 ±  4%     +33.4%       5.96 ±  3%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
>        6446 ±223%    +885.4%      63529 ± 57%  sched_debug.cfs_rq:/.left_deadline.avg
>      825119 ±223%    +613.5%    5886958 ± 44%  sched_debug.cfs_rq:/.left_deadline.max
>       72645 ±223%    +713.6%     591074 ± 49%  sched_debug.cfs_rq:/.left_deadline.stddev
>        6446 ±223%    +885.5%      63527 ± 57%  sched_debug.cfs_rq:/.left_vruntime.avg
>      825080 ±223%    +613.5%    5886805 ± 44%  sched_debug.cfs_rq:/.left_vruntime.max
>       72642 ±223%    +713.7%     591058 ± 49%  sched_debug.cfs_rq:/.left_vruntime.stddev
>        4202 ±  8%   +1115.1%      51069 ± 61%  sched_debug.cfs_rq:/.load.stddev
>      367.11           +20.2%     441.44 ± 17%  sched_debug.cfs_rq:/.load_avg.max
>     7475567           +16.4%    8699139        sched_debug.cfs_rq:/.min_vruntime.avg
>     8752154 ±  3%     +20.6%   10551563 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
>      211424 ± 12%    +374.5%    1003211 ± 39%  sched_debug.cfs_rq:/.min_vruntime.stddev
>        0.17 ± 16%     +39.8%       0.24 ±  6%  sched_debug.cfs_rq:/.nr_queued.stddev
>        6446 ±223%    +885.5%      63527 ± 57%  sched_debug.cfs_rq:/.right_vruntime.avg
>      825080 ±223%    +613.5%    5886805 ± 44%  sched_debug.cfs_rq:/.right_vruntime.max
>       72642 ±223%    +713.7%     591058 ± 49%  sched_debug.cfs_rq:/.right_vruntime.stddev
>      752.39 ± 81%     -81.4%     139.72 ± 53%  sched_debug.cfs_rq:/.runnable_avg.min
>        2728 ±  3%     +51.2%       4126 ±  8%  sched_debug.cfs_rq:/.runnable_avg.stddev
>      265.50 ±  2%     +12.3%     298.07 ±  2%  sched_debug.cfs_rq:/.util_avg.stddev
>      686.78 ±  7%     +23.4%     847.76 ±  6%  sched_debug.cfs_rq:/.util_est.stddev
>       19.44 ±  5%     +29.7%      25.22 ±  4%  sched_debug.cpu.nr_running.max
>        4.48 ±  5%     +34.4%       6.02 ±  3%  sched_debug.cpu.nr_running.stddev
>       67323 ± 14%    +130.3%     155017 ± 29%  sched_debug.cpu.nr_switches.stddev
>      -20.78           -18.2%     -17.00        sched_debug.cpu.nr_uninterruptible.min
>        0.13 ±100%     -85.8%       0.02 ±163%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
>        0.17 ±116%     -97.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
>       22.92 ±110%     -97.4%       0.59 ±137%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof
>        8.10 ± 45%     -78.0%       1.78 ±135%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>        3.14 ± 19%     -70.9%       0.91 ±102%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
>       39.05 ±149%     -97.4%       1.01 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
>       15.77 ±203%     -99.7%       0.04 ±102%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
>        1.27 ±177%     -98.2%       0.02 ±190%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
>        0.20 ±140%     -92.4%       0.02 ±201%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.path_openat
>       86.63 ±221%     -99.9%       0.05 ±184%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.18 ± 75%     -97.0%       0.01 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.step_into.link_path_walk.path_openat
>        0.13 ± 34%     -75.5%       0.03 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>        0.26 ±108%     -86.2%       0.04 ±142%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
>        2.33 ± 11%     -65.8%       0.80 ±107%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
>        0.18 ± 88%     -91.1%       0.02 ±194%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
>        0.50 ±145%     -92.5%       0.04 ±210%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.getname_flags.part.0
>        0.19 ±116%     -98.5%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.commit_merge
>        0.24 ±128%     -96.8%       0.01 ±180%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
>        0.99 ± 16%     -58.0%       0.42 ±100%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>        0.27 ±124%     -97.5%       0.01 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
>        1.08 ± 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.96 ± 93%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        0.53 ±182%     -94.2%       0.03 ±158%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
>        0.84 ±160%     -93.5%       0.05 ±100%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>       29.39 ±172%     -94.0%       1.78 ±123%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       21.51 ± 60%     -74.7%       5.45 ±118%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       13.77 ± 61%     -81.3%       2.57 ±113%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       11.22 ± 33%     -74.5%       2.86 ±107%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>        1.99 ± 90%     -90.1%       0.20 ±100%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>        4.50 ±138%     -94.9%       0.23 ±200%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>       27.91 ±218%     -99.6%       0.11 ±120%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        9.91 ± 51%     -68.3%       3.15 ±124%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       10.18 ± 24%     -62.4%       3.83 ±105%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
>        1.16 ± 20%     -62.7%       0.43 ±106%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>        0.27 ± 99%     -92.0%       0.02 ±172%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
>        0.32 ±128%     -98.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
>        0.88 ± 94%     -86.7%       0.12 ±144%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>      252.53 ±128%     -98.4%       4.12 ±138%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof
>       60.22 ± 58%     -67.8%      19.37 ±146%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>      168.93 ±209%     -99.9%       0.15 ±100%  perf-sched.sch_delay.max.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
>        3.79 ±169%     -98.6%       0.05 ±199%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
>      517.19 ±222%     -99.9%       0.29 ±201%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.54 ± 82%     -98.4%       0.01 ±141%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.link_path_walk.path_openat
>        0.34 ± 57%     -93.1%       0.02 ±203%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
>        0.64 ±141%     -99.4%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.commit_merge
>        0.28 ±111%     -97.2%       0.01 ±180%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
>        0.29 ±114%     -97.6%       0.01 ±141%  perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.exit_mmap.__mmput.exit_mm
>      133.30 ± 46%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       12.53 ±135%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        1.11 ± 85%     -76.9%       0.26 ±202%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
>        7.48 ±214%     -99.0%       0.08 ±141%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
>       28.59 ±191%     -99.0%       0.28 ±120%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>      285.16 ±145%     -99.3%       1.94 ±111%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>      143.71 ±128%     -91.0%      12.97 ±134%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>      107.10 ±162%     -99.1%       0.95 ±190%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
>      352.73 ±216%     -99.4%       2.06 ±118%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        1169 ± 25%     -58.7%     482.79 ±101%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>        1.80 ± 20%     -58.5%       0.75 ±105%  perf-sched.total_sch_delay.average.ms
>        5.09 ± 20%     -58.0%       2.14 ±106%  perf-sched.total_wait_and_delay.average.ms
>       20.86 ± 25%     -82.0%       3.76 ±147%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>        8.10 ± 21%     -69.1%       2.51 ±103%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
>       22.82 ± 27%     -66.9%       7.55 ±103%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        6.55 ± 13%     -64.1%       2.35 ±108%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
>      139.95 ± 55%     -64.0%      50.45 ±122%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
>       27.54 ± 61%     -81.3%       5.15 ±113%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       27.75 ± 30%     -73.3%       7.42 ±106%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       26.76 ± 25%     -64.2%       9.57 ±107%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>       29.39 ± 34%     -67.3%       9.61 ±115%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       27.53 ± 25%     -62.9%      10.21 ±105%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
>        3.25 ± 20%     -62.2%       1.23 ±106%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>      864.18 ±  4%     -99.3%       6.27 ±103%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      141.47 ± 38%     -72.9%      38.27 ±154%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>        2346 ± 25%     -58.7%     969.53 ±101%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>       83.99 ±223%    -100.0%       0.02 ±163%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
>        0.16 ±122%     -97.7%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
>       12.76 ± 37%     -81.6%       2.35 ±125%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>        4.96 ± 22%     -67.9%       1.59 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
>       75.22 ± 91%     -96.4%       2.67 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
>       23.31 ±188%     -98.8%       0.28 ±195%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
>       14.93 ± 22%     -68.0%       4.78 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        1.29 ±178%     -98.5%       0.02 ±185%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
>        0.20 ±140%     -92.5%       0.02 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.path_openat
>       87.29 ±221%     -99.9%       0.05 ±184%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.18 ± 76%     -97.0%       0.01 ±141%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.path_openat
>        0.12 ± 33%     -87.4%       0.02 ±212%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>        4.22 ± 15%     -63.3%       1.55 ±108%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
>        0.18 ± 88%     -91.1%       0.02 ±194%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
>        0.50 ±145%     -92.5%       0.04 ±210%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.getname_flags.part.0
>        0.19 ±116%     -98.5%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.commit_merge
>        0.24 ±128%     -96.8%       0.01 ±180%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
>        1.79 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.98 ± 92%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        2.44 ±199%     -98.1%       0.05 ±109%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>      125.16 ± 52%     -64.6%      44.36 ±120%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
>       13.77 ± 61%     -81.3%       2.58 ±113%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       16.53 ± 29%     -72.5%       4.55 ±106%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>        3.11 ± 80%     -80.7%       0.60 ±138%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>       17.30 ± 23%     -65.0%       6.05 ±107%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>       50.76 ±143%     -98.1%       0.97 ±101%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>       19.48 ± 27%     -66.8%       6.46 ±111%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       17.35 ± 25%     -63.3%       6.37 ±106%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
>        2.09 ± 21%     -62.0%       0.79 ±107%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>      850.73 ±  6%     -99.3%       5.76 ±102%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      168.00 ±223%    -100.0%       0.02 ±172%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
>        0.32 ±131%     -98.8%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_strings
>        0.88 ± 94%     -86.7%       0.12 ±144%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.perf_event_mmap_event.perf_event_mmap.__mmap_region
>       83.05 ± 45%     -75.0%      20.78 ±142%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
>      393.39 ± 76%     -96.3%      14.60 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
>        3.87 ±170%     -98.6%       0.05 ±199%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
>      520.88 ±222%     -99.9%       0.29 ±201%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>        0.54 ± 82%     -98.4%       0.01 ±141%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.path_openat
>        0.34 ± 57%     -93.1%       0.02 ±203%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.path_openat.do_filp_open
>        0.64 ±141%     -99.4%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.commit_merge
>        0.28 ±111%     -97.2%       0.01 ±180%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
>      210.15 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       34.48 ±131%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        1.11 ± 85%     -76.9%       0.26 ±202%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
>       92.32 ±212%     -99.7%       0.27 ±123%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>        3252 ± 21%     -58.5%       1351 ±103%  perf-sched.wait_time.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
>        1602 ± 28%     -66.2%     541.12 ±100%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      530.17 ± 95%     -98.5%       7.79 ±119%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        1177 ± 25%     -58.7%     486.74 ±101%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>       50.88            -1.4       49.53        perf-profile.calltrace.cycles-pp.read
>       45.95            -1.0       44.92        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
>       45.66            -1.0       44.64        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        3.44 ±  4%      -0.8        2.66 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter
>        3.32 ±  4%      -0.8        2.56 ±  4%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg
>        3.28 ±  4%      -0.8        2.52 ±  4%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable
>        3.48 ±  3%      -0.6        2.83 ±  5%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>        3.52 ±  3%      -0.6        2.87 ±  5%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
>        3.45 ±  3%      -0.6        2.80 ±  5%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_read_generic.unix_stream_recvmsg
>       47.06            -0.6       46.45        perf-profile.calltrace.cycles-pp.write
>        4.26 ±  5%      -0.6        3.69        perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
>        1.58 ±  3%      -0.6        1.02 ±  8%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
>        1.31 ±  3%      -0.5        0.85 ±  8%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
>        1.25 ±  3%      -0.4        0.81 ±  8%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
>        0.84 ±  3%      -0.2        0.60 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        7.91            -0.2        7.68        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
>        3.17 ±  2%      -0.2        2.94        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
>        7.80            -0.2        7.58        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>        7.58            -0.2        7.36        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
>        1.22 ±  4%      -0.2        1.02 ±  4%  perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.schedule_timeout.unix_stream_read_generic
>        1.18 ±  4%      -0.2        0.99 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.schedule_timeout
>        0.87            -0.2        0.68 ±  8%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__pick_next_task.__schedule.schedule.schedule_timeout
>        1.14 ±  4%      -0.2        0.95 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
>        0.90            -0.2        0.72 ±  7%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.schedule_timeout.unix_stream_read_generic
>        3.45 ±  3%      -0.1        3.30        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
>        1.96            -0.1        1.82        perf-profile.calltrace.cycles-pp.clear_bhb_loop.read
>        1.97            -0.1        1.86        perf-profile.calltrace.cycles-pp.clear_bhb_loop.write
>        2.35            -0.1        2.25        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
>        2.58            -0.1        2.48        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.read
>        1.38 ±  4%      -0.1        1.28 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
>        1.35            -0.1        1.25        perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
>        0.67 ±  7%      -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
>        2.59            -0.1        2.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
>        2.02            -0.1        1.96        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
>        0.77 ±  3%      -0.0        0.72 ±  2%  perf-profile.calltrace.cycles-pp.fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>        0.65 ±  4%      -0.0        0.60 ±  2%  perf-profile.calltrace.cycles-pp.fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
>        0.74            -0.0        0.70        perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
>        1.04            -0.0        0.99        perf-profile.calltrace.cycles-pp.obj_cgroup_charge_account.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb
>        0.69            -0.0        0.65 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
>        0.82            -0.0        0.80        perf-profile.calltrace.cycles-pp.obj_cgroup_charge_account.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags
>        0.57            -0.0        0.56        perf-profile.calltrace.cycles-pp.refill_obj_stock.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg
>        0.80 ±  9%      +0.2        1.01 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter
>        2.50 ±  4%      +0.3        2.82 ±  9%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
>        2.64 ±  6%      +0.4        3.06 ± 12%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.unix_stream_read_generic
>        2.73 ±  6%      +0.4        3.16 ± 12%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg
>        2.87 ±  6%      +0.4        3.30 ± 12%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
>       18.38            +0.6       18.93        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
>        0.00            +0.7        0.70 ± 11%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>        0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write
>        0.00            +1.5        1.46 ± 11%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
>        0.00            +1.5        1.46 ± 11%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>        0.00            +1.5        1.46 ± 11%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>        0.00            +1.5        1.50 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>        0.00            +1.5        1.52 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
>        0.00            +1.6        1.61 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        0.18 ±141%      +1.8        1.93 ± 11%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        0.18 ±141%      +1.8        1.94 ± 11%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>        0.18 ±141%      +1.8        1.94 ± 11%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>        0.18 ±141%      +1.8        1.97 ± 11%  perf-profile.calltrace.cycles-pp.common_startup_64
>        0.00            +2.0        1.96 ± 11%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
>       87.96            -1.4       86.57        perf-profile.children.cycles-pp.do_syscall_64
>       88.72            -1.4       87.33        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       51.44            -1.4       50.05        perf-profile.children.cycles-pp.read
>        4.55 ±  2%      -0.8        3.74 ±  5%  perf-profile.children.cycles-pp.schedule
>        3.76 ±  4%      -0.7        3.02 ±  3%  perf-profile.children.cycles-pp.__wake_up_common
>        3.64 ±  4%      -0.7        2.92 ±  3%  perf-profile.children.cycles-pp.autoremove_wake_function
>        3.60 ±  4%      -0.7        2.90 ±  3%  perf-profile.children.cycles-pp.try_to_wake_up
>        4.00 ±  2%      -0.6        3.36 ±  4%  perf-profile.children.cycles-pp.schedule_timeout
>        4.65 ±  2%      -0.6        4.02 ±  4%  perf-profile.children.cycles-pp.__schedule
>       47.64            -0.6       47.01        perf-profile.children.cycles-pp.write
>        4.58 ±  4%      -0.5        4.06        perf-profile.children.cycles-pp.__wake_up_sync_key
>        1.45 ±  2%      -0.4        1.00 ±  5%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>        1.84 ±  3%      -0.3        1.50 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
>        1.62 ±  2%      -0.3        1.33 ±  3%  perf-profile.children.cycles-pp.enqueue_task
>        1.53 ±  2%      -0.3        1.26 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
>        1.40            -0.3        1.14 ±  6%  perf-profile.children.cycles-pp.pick_next_task_fair
>        3.97            -0.2        3.73        perf-profile.children.cycles-pp.clear_bhb_loop
>        1.43            -0.2        1.19 ±  5%  perf-profile.children.cycles-pp.__pick_next_task
>        0.75 ±  4%      -0.2        0.52 ±  8%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
>        7.95            -0.2        7.72        perf-profile.children.cycles-pp.unix_stream_read_actor
>        7.84            -0.2        7.61        perf-profile.children.cycles-pp.skb_copy_datagram_iter
>        3.24 ±  2%      -0.2        3.01        perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
>        7.63            -0.2        7.42        perf-profile.children.cycles-pp.__skb_datagram_iter
>        0.94 ±  4%      -0.2        0.73 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
>        0.95 ±  8%      -0.2        0.76 ±  4%  perf-profile.children.cycles-pp.update_curr
>        1.37 ±  3%      -0.2        1.18 ±  3%  perf-profile.children.cycles-pp.dequeue_task_fair
>        1.34 ±  4%      -0.2        1.16 ±  3%  perf-profile.children.cycles-pp.try_to_block_task
>        4.50            -0.2        4.34        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
>        1.37 ±  3%      -0.2        1.20 ±  3%  perf-profile.children.cycles-pp.dequeue_entities
>        3.48 ±  3%      -0.1        3.33        perf-profile.children.cycles-pp._copy_to_iter
>        0.91            -0.1        0.78 ±  3%  perf-profile.children.cycles-pp.update_load_avg
>        4.85            -0.1        4.72        perf-profile.children.cycles-pp.__check_object_size
>        3.23            -0.1        3.11        perf-profile.children.cycles-pp.entry_SYSCALL_64
>        0.54 ±  3%      -0.1        0.42 ±  5%  perf-profile.children.cycles-pp.switch_mm_irqs_off
>        1.40 ±  4%      -0.1        1.30 ±  2%  perf-profile.children.cycles-pp._copy_from_iter
>        2.02            -0.1        1.92        perf-profile.children.cycles-pp.its_return_thunk
>        0.43 ±  2%      -0.1        0.32 ±  3%  perf-profile.children.cycles-pp.switch_fpu_return
>        0.29 ±  2%      -0.1        0.18 ±  6%  perf-profile.children.cycles-pp.__enqueue_entity
>        1.46 ±  3%      -0.1        1.36 ±  2%  perf-profile.children.cycles-pp.fdget_pos
>        0.44 ±  3%      -0.1        0.34 ±  5%  perf-profile.children.cycles-pp.set_next_entity
>        0.42 ±  2%      -0.1        0.32 ±  4%  perf-profile.children.cycles-pp.pick_task_fair
>        0.31 ±  2%      -0.1        0.24 ±  6%  perf-profile.children.cycles-pp.reweight_entity
>        0.28 ±  2%      -0.1        0.20 ±  7%  perf-profile.children.cycles-pp.__dequeue_entity
>        1.96            -0.1        1.88        perf-profile.children.cycles-pp.obj_cgroup_charge_account
>        0.28 ±  2%      -0.1        0.21 ±  3%  perf-profile.children.cycles-pp.update_cfs_group
>        0.23 ±  2%      -0.1        0.16 ±  5%  perf-profile.children.cycles-pp.pick_eevdf
>        0.26 ±  2%      -0.1        0.19 ±  4%  perf-profile.children.cycles-pp.wakeup_preempt
>        1.46            -0.1        1.40        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
>        0.48 ±  2%      -0.1        0.42 ±  5%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
>        0.30            -0.1        0.24 ±  4%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
>        0.82            -0.1        0.77        perf-profile.children.cycles-pp.__cond_resched
>        0.27 ±  2%      -0.0        0.22 ±  4%  perf-profile.children.cycles-pp.__update_load_avg_se
>        0.14 ±  3%      -0.0        0.10 ±  7%  perf-profile.children.cycles-pp.update_curr_se
>        0.79            -0.0        0.74        perf-profile.children.cycles-pp.mutex_lock
>        0.34 ±  3%      -0.0        0.30 ±  5%  perf-profile.children.cycles-pp.rseq_ip_fixup
>        0.15 ±  4%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
>        0.21 ±  3%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.__switch_to
>        0.17 ±  4%      -0.0        0.13 ±  7%  perf-profile.children.cycles-pp.place_entity
>        0.22            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.wake_affine
>        0.24            -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.check_stack_object
>        0.64 ±  2%      -0.0        0.61 ±  3%  perf-profile.children.cycles-pp.__virt_addr_valid
>        0.38 ±  2%      -0.0        0.34 ±  2%  perf-profile.children.cycles-pp.tick_nohz_handler
>        0.18 ±  3%      -0.0        0.14 ±  6%  perf-profile.children.cycles-pp.update_rq_clock
>        0.66            -0.0        0.62        perf-profile.children.cycles-pp.rw_verify_area
>        0.19            -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.task_mm_cid_work
>        0.34 ±  3%      -0.0        0.31 ±  2%  perf-profile.children.cycles-pp.update_process_times
>        0.12 ±  8%      -0.0        0.08 ± 11%  perf-profile.children.cycles-pp.detach_tasks
>        0.39 ±  3%      -0.0        0.36 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
>        0.21 ±  3%      -0.0        0.18 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
>        0.18 ±  6%      -0.0        0.15 ±  4%  perf-profile.children.cycles-pp.task_tick_fair
>        0.25 ±  3%      -0.0        0.22 ±  4%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
>        0.23 ±  5%      -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.sched_tick
>        0.14 ±  3%      -0.0        0.11 ±  6%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
>        0.11 ±  4%      -0.0        0.08 ±  7%  perf-profile.children.cycles-pp.update_min_vruntime
>        0.06            -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.update_curr_dl_se
>        0.14 ±  3%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.put_prev_entity
>        0.13 ±  5%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.task_h_load
>        0.68            -0.0        0.65        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.46 ±  2%      -0.0        0.43 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
>        0.52            -0.0        0.50        perf-profile.children.cycles-pp.scm_recv_unix
>        0.08 ±  4%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.__cgroup_account_cputime
>        0.11 ±  5%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__switch_to_asm
>        0.46 ±  2%      -0.0        0.44 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
>        0.08 ±  8%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.activate_task
>        0.08 ±  8%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.detach_task
>        0.11 ±  5%      -0.0        0.09 ±  7%  perf-profile.children.cycles-pp.os_xsave
>        0.13 ±  5%      -0.0        0.11 ±  6%  perf-profile.children.cycles-pp.avg_vruntime
>        0.13 ±  4%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.update_entity_lag
>        0.08 ±  4%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.__calc_delta
>        0.09 ±  5%      -0.0        0.07 ±  8%  perf-profile.children.cycles-pp.vruntime_eligible
>        0.34 ±  2%      -0.0        0.32        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
>        0.30            -0.0        0.29 ±  2%  perf-profile.children.cycles-pp.__build_skb_around
>        0.08 ±  5%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
>        0.15            -0.0        0.14        perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
>        0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.native_irq_return_iret
>        0.38 ±  2%      +0.0        0.40 ±  2%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
>        0.27 ±  2%      +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
>        0.05 ±  7%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.handle_softirqs
>        0.06            +0.0        0.09 ± 11%  perf-profile.children.cycles-pp.finish_wait
>        0.06 ±  7%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__irq_exit_rcu
>        0.06 ±  8%      +0.1        0.11 ±  8%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
>        0.01 ±223%      +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.ktime_get
>        0.54 ±  4%      +0.1        0.61        perf-profile.children.cycles-pp.select_task_rq
>        0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.enqueue_dl_entity
>        0.12 ±  4%      +0.1        0.19 ±  7%  perf-profile.children.cycles-pp.get_any_partial
>        0.10 ±  9%      +0.1        0.18 ±  5%  perf-profile.children.cycles-pp.available_idle_cpu
>        0.00            +0.1        0.08 ±  9%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
>        0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.dl_server_start
>        0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.dl_server_stop
>        0.46 ±  2%      +0.1        0.54 ±  2%  perf-profile.children.cycles-pp.select_task_rq_fair
>        0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.select_idle_core
>        0.09 ±  7%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.select_idle_cpu
>        0.18 ±  4%      +0.1        0.31 ±  6%  perf-profile.children.cycles-pp.select_idle_sibling
>        0.00            +0.2        0.18 ±  4%  perf-profile.children.cycles-pp.process_one_work
>        0.06 ± 13%      +0.2        0.25 ±  9%  perf-profile.children.cycles-pp.schedule_idle
>        0.44 ±  2%      +0.2        0.64 ±  8%  perf-profile.children.cycles-pp.prepare_to_wait
>        0.00            +0.2        0.21 ±  5%  perf-profile.children.cycles-pp.kthread
>        0.00            +0.2        0.21 ±  5%  perf-profile.children.cycles-pp.worker_thread
>        0.00            +0.2        0.21 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
>        0.00            +0.2        0.21 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
>        0.11 ± 12%      +0.3        0.36 ±  9%  perf-profile.children.cycles-pp.sched_ttwu_pending
>        0.31 ± 35%      +0.3        0.59 ± 11%  perf-profile.children.cycles-pp.__cmd_record
>        0.26 ± 45%      +0.3        0.54 ± 13%  perf-profile.children.cycles-pp.perf_session__process_events
>        0.26 ± 45%      +0.3        0.54 ± 13%  perf-profile.children.cycles-pp.reader__read_event
>        0.26 ± 45%      +0.3        0.54 ± 13%  perf-profile.children.cycles-pp.record__finish_output
>        0.16 ± 11%      +0.3        0.45 ±  9%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>        0.14 ± 11%      +0.3        0.45 ±  9%  perf-profile.children.cycles-pp.__sysvec_call_function_single
>        0.14 ± 60%      +0.3        0.48 ± 17%  perf-profile.children.cycles-pp.ordered_events__queue
>        0.14 ± 61%      +0.3        0.48 ± 17%  perf-profile.children.cycles-pp.queue_event
>        0.15 ± 59%      +0.3        0.49 ± 16%  perf-profile.children.cycles-pp.process_simple
>        0.16 ± 12%      +0.4        0.54 ± 10%  perf-profile.children.cycles-pp.sysvec_call_function_single
>        4.61 ±  3%      +0.5        5.13 ±  8%  perf-profile.children.cycles-pp.get_partial_node
>        5.57 ±  3%      +0.6        6.12 ±  7%  perf-profile.children.cycles-pp.___slab_alloc
>       18.44            +0.6       19.00        perf-profile.children.cycles-pp.sock_alloc_send_pskb
>        6.51 ±  3%      +0.7        7.26 ±  9%  perf-profile.children.cycles-pp.__put_partials
>        0.33 ± 14%      +1.0        1.30 ± 11%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
>        0.34 ± 17%      +1.1        1.47 ± 11%  perf-profile.children.cycles-pp.pv_native_safe_halt
>        0.34 ± 17%      +1.1        1.48 ± 11%  perf-profile.children.cycles-pp.acpi_safe_halt
>        0.34 ± 17%      +1.1        1.48 ± 11%  perf-profile.children.cycles-pp.acpi_idle_do_entry
>        0.34 ± 17%      +1.1        1.48 ± 11%  perf-profile.children.cycles-pp.acpi_idle_enter
>        0.35 ± 17%      +1.2        1.53 ± 11%  perf-profile.children.cycles-pp.cpuidle_enter_state
>        0.35 ± 17%      +1.2        1.54 ± 11%  perf-profile.children.cycles-pp.cpuidle_enter
>        0.38 ± 17%      +1.3        1.63 ± 11%  perf-profile.children.cycles-pp.cpuidle_idle_call
>        0.45 ± 16%      +1.5        1.94 ± 11%  perf-profile.children.cycles-pp.start_secondary
>        0.46 ± 17%      +1.5        1.96 ± 11%  perf-profile.children.cycles-pp.do_idle
>        0.46 ± 17%      +1.5        1.97 ± 11%  perf-profile.children.cycles-pp.common_startup_64
>        0.46 ± 17%      +1.5        1.97 ± 11%  perf-profile.children.cycles-pp.cpu_startup_entry
>       13.76 ±  2%      +1.7       15.44 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
>       12.09 ±  2%      +1.9       14.00 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
>        3.93            -0.2        3.69        perf-profile.self.cycles-pp.clear_bhb_loop
>        3.43 ±  3%      -0.1        3.29        perf-profile.self.cycles-pp._copy_to_iter
>        0.50 ±  2%      -0.1        0.39 ±  5%  perf-profile.self.cycles-pp.switch_mm_irqs_off
>        1.37 ±  4%      -0.1        1.27 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
>        0.28 ±  2%      -0.1        0.18 ±  7%  perf-profile.self.cycles-pp.__enqueue_entity
>        1.41 ±  3%      -0.1        1.31 ±  2%  perf-profile.self.cycles-pp.fdget_pos
>        2.51            -0.1        2.42        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
>        1.35            -0.1        1.28        perf-profile.self.cycles-pp.read
>        2.24            -0.1        2.17        perf-profile.self.cycles-pp.do_syscall_64
>        0.27 ±  3%      -0.1        0.20 ±  3%  perf-profile.self.cycles-pp.update_cfs_group
>        1.28            -0.1        1.22        perf-profile.self.cycles-pp.sock_write_iter
>        0.84            -0.1        0.77        perf-profile.self.cycles-pp.vfs_read
>        1.42            -0.1        1.36        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
>        1.20            -0.1        1.14        perf-profile.self.cycles-pp.__alloc_skb
>        0.18 ±  2%      -0.1        0.13 ±  5%  perf-profile.self.cycles-pp.pick_eevdf
>        1.04            -0.1        0.99        perf-profile.self.cycles-pp.its_return_thunk
>        0.29 ±  2%      -0.1        0.24 ±  4%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
>        0.28 ±  5%      -0.1        0.23 ±  6%  perf-profile.self.cycles-pp.update_curr
>        0.13 ±  5%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.switch_fpu_return
>        0.20 ±  3%      -0.0        0.15 ±  6%  perf-profile.self.cycles-pp.__dequeue_entity
>        1.00            -0.0        0.95        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
>        0.33            -0.0        0.28 ±  2%  perf-profile.self.cycles-pp.update_load_avg
>        0.88            -0.0        0.83 ±  2%  perf-profile.self.cycles-pp.vfs_write
>        0.91            -0.0        0.86        perf-profile.self.cycles-pp.sock_read_iter
>        0.13 ±  3%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.update_curr_se
>        0.25 ±  2%      -0.0        0.21 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_se
>        1.22            -0.0        1.18        perf-profile.self.cycles-pp.__kmalloc_node_track_caller_noprof
>        0.68            -0.0        0.63        perf-profile.self.cycles-pp.__check_object_size
>        0.78 ±  2%      -0.0        0.74        perf-profile.self.cycles-pp.obj_cgroup_charge_account
>        0.20 ±  3%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.__switch_to
>        0.15 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.try_to_wake_up
>        0.90            -0.0        0.86        perf-profile.self.cycles-pp.entry_SYSCALL_64
>        0.76 ±  2%      -0.0        0.73        perf-profile.self.cycles-pp.__check_heap_object
>        0.92            -0.0        0.89 ±  2%  perf-profile.self.cycles-pp.__account_obj_stock
>        0.19 ±  2%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.check_stack_object
>        0.40 ±  3%      -0.0        0.37        perf-profile.self.cycles-pp.__schedule
>        0.60 ±  2%      -0.0        0.56 ±  3%  perf-profile.self.cycles-pp.__virt_addr_valid
>        0.71            -0.0        0.68        perf-profile.self.cycles-pp.__skb_datagram_iter
>        0.18 ±  4%      -0.0        0.14 ±  5%  perf-profile.self.cycles-pp.task_mm_cid_work
>        0.68            -0.0        0.65        perf-profile.self.cycles-pp.refill_obj_stock
>        0.34            -0.0        0.31 ±  2%  perf-profile.self.cycles-pp.unix_stream_recvmsg
>        0.06 ±  7%      -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.enqueue_task
>        0.11            -0.0        0.08        perf-profile.self.cycles-pp.pick_task_fair
>        0.15 ±  2%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.enqueue_task_fair
>        0.20 ±  3%      -0.0        0.17 ±  7%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
>        0.41            -0.0        0.38        perf-profile.self.cycles-pp.sock_recvmsg
>        0.10            -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.update_min_vruntime
>        0.13 ±  3%      -0.0        0.10        perf-profile.self.cycles-pp.task_h_load
>        0.23 ±  3%      -0.0        0.20 ±  6%  perf-profile.self.cycles-pp.__get_user_8
>        0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
>        0.39 ±  2%      -0.0        0.37 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
>        0.11 ±  3%      -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.os_xsave
>        0.12 ±  3%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.pick_next_task_fair
>        0.35            -0.0        0.33 ±  2%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
>        0.46            -0.0        0.44        perf-profile.self.cycles-pp.mutex_lock
>        0.11 ±  4%      -0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__switch_to_asm
>        0.10 ±  3%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.enqueue_entity
>        0.08 ±  7%      -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.place_entity
>        0.30            -0.0        0.28 ±  2%  perf-profile.self.cycles-pp.alloc_skb_with_frags
>        0.50            -0.0        0.48        perf-profile.self.cycles-pp.kfree
>        0.30            -0.0        0.28        perf-profile.self.cycles-pp.ksys_write
>        0.12 ±  3%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.dequeue_entity
>        0.11 ±  4%      -0.0        0.09        perf-profile.self.cycles-pp.prepare_to_wait
>        0.19 ±  2%      -0.0        0.17        perf-profile.self.cycles-pp.update_rq_clock_task
>        0.27            -0.0        0.25 ±  2%  perf-profile.self.cycles-pp.__build_skb_around
>        0.08 ±  6%      -0.0        0.06 ±  9%  perf-profile.self.cycles-pp.vruntime_eligible
>        0.12 ±  4%      -0.0        0.10        perf-profile.self.cycles-pp.__wake_up_common
>        0.27            -0.0        0.26        perf-profile.self.cycles-pp.kmalloc_reserve
>        0.48            -0.0        0.46        perf-profile.self.cycles-pp.unix_write_space
>        0.19            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
>        0.07            -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.__calc_delta
>        0.06 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.__put_user_8
>        0.28            -0.0        0.27        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
>        0.11            -0.0        0.10        perf-profile.self.cycles-pp.wait_for_unix_gc
>        0.05            +0.0        0.06        perf-profile.self.cycles-pp.__x64_sys_write
>        0.07 ±  5%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.native_irq_return_iret
>        0.19 ±  7%      +0.0        0.22 ±  4%  perf-profile.self.cycles-pp.prepare_task_switch
>        0.10 ±  6%      +0.1        0.17 ±  5%  perf-profile.self.cycles-pp.available_idle_cpu
>        0.14 ± 61%      +0.3        0.48 ± 17%  perf-profile.self.cycles-pp.queue_event
>        0.19 ± 18%      +0.7        0.85 ± 12%  perf-profile.self.cycles-pp.pv_native_safe_halt
>       12.07 ±  2%      +1.9       13.97 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> 
> 
> 
> ***************************************************************************************************
> lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-ivb-2ep2/shell_rtns_3/aim9/300s
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>        9156           +20.2%      11004        vmstat.system.cs
>     8715946 ±  6%     -14.0%    7494314 ± 13%  meminfo.DirectMap2M
>       10992           +85.4%      20381        meminfo.PageTables
>      318.58            -1.7%     313.01        aim9.shell_rtns_3.ops_per_sec
>    27145198            -2.1%   26576524        aim9.time.minor_page_faults
>     1049306            -1.8%    1030938        aim9.time.voluntary_context_switches
>        6173 ± 20%     +74.0%      10742 ±  4%  numa-meminfo.node0.PageTables
>        5702 ± 31%     +55.1%       8844 ± 19%  numa-meminfo.node0.Shmem
>        4803 ± 25%    +100.6%       9636 ±  6%  numa-meminfo.node1.PageTables
>        1538 ± 20%     +73.7%       2673 ±  5%  numa-vmstat.node0.nr_page_table_pages
>        1425 ± 31%     +55.1%       2210 ± 19%  numa-vmstat.node0.nr_shmem
>        1194 ± 25%    +101.2%       2402 ±  6%  numa-vmstat.node1.nr_page_table_pages
>       30413           +19.3%      36291        sched_debug.cpu.nr_switches.avg
>       84768 ±  6%     +20.3%     101955 ±  4%  sched_debug.cpu.nr_switches.max
>       25510 ± 13%     +23.0%      31383 ±  3%  sched_debug.cpu.nr_switches.stddev
>        2727           +85.8%       5066        proc-vmstat.nr_page_table_pages
>    19325131            -1.6%   19014535        proc-vmstat.numa_hit
>    19274656            -1.6%   18964467        proc-vmstat.numa_local
>    19877211            -1.6%   19563123        proc-vmstat.pgalloc_normal
>    28020416            -2.0%   27451741        proc-vmstat.pgfault
>    19829318            -1.6%   19508263        proc-vmstat.pgfree
>        2679            -1.6%       2636        proc-vmstat.unevictable_pgs_culled
>        0.03 ± 10%     +30.9%       0.04 ±  2%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.02 ±  5%     +26.2%       0.02 ±  3%  perf-sched.total_sch_delay.average.ms
>       27.03 ±  2%     -12.4%      23.66        perf-sched.total_wait_and_delay.average.ms
>       23171           +18.2%      27385        perf-sched.total_wait_and_delay.count.ms
>       27.01 ±  2%     -12.5%      23.64        perf-sched.total_wait_time.average.ms
>      110.73 ±  4%     -71.1%      31.98        perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1662 ±  2%    +278.6%       6294        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      110.70 ±  4%     -71.1%      31.94        perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        5.94            +0.1        6.00        perf-stat.i.branch-miss-rate%
>        9184           +20.2%      11041        perf-stat.i.context-switches
>        1.96            +1.6%       1.99        perf-stat.i.cpi
>       71.73 ±  4%     +66.1%     119.11 ±  5%  perf-stat.i.cpu-migrations
>        0.53            -1.4%       0.52        perf-stat.i.ipc
>        3.79            -2.0%       3.71        perf-stat.i.metric.K/sec
>       90919            -2.0%      89065        perf-stat.i.minor-faults
>       90919            -2.0%      89065        perf-stat.i.page-faults
>        6.00            +0.1        6.06        perf-stat.overall.branch-miss-rate%
>        1.79            +1.2%       1.81        perf-stat.overall.cpi
>        0.56            -1.2%       0.55        perf-stat.overall.ipc
>        9154           +20.2%      11004        perf-stat.ps.context-switches
>       71.49 ±  4%     +66.1%     118.72 ±  5%  perf-stat.ps.cpu-migrations
>       90616            -2.0%      88768        perf-stat.ps.minor-faults
>       90616            -2.0%      88768        perf-stat.ps.page-faults
>        8.89            -0.2        8.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        8.88            -0.2        8.66        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.47 ±  2%      -0.2        3.29        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.47 ±  2%      -0.2        3.29        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.51 ±  3%      -0.2        3.33        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.47 ±  2%      -0.2        3.29        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
>        1.66 ±  2%      -0.1        1.57 ±  4%  perf-profile.calltrace.cycles-pp.setlocale
>        0.27 ±100%      +0.3        0.61 ±  5%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>        0.18 ±141%      +0.4        0.60 ±  5%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       62.46            +0.6       63.01        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>        0.09 ±223%      +0.6        0.65 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
>        0.09 ±223%      +0.6        0.65 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
>       49.01            +0.6       49.60        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>       67.47            +0.7       68.17        perf-profile.calltrace.cycles-pp.common_startup_64
>       20.25            -0.7       19.58        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       20.21            -0.7       19.54        perf-profile.children.cycles-pp.do_syscall_64
>        6.54            -0.2        6.33        perf-profile.children.cycles-pp.asm_exc_page_fault
>        6.10            -0.2        5.90        perf-profile.children.cycles-pp.do_user_addr_fault
>        3.77 ±  3%      -0.2        3.60        perf-profile.children.cycles-pp.x64_sys_call
>        3.62 ±  3%      -0.2        3.46        perf-profile.children.cycles-pp.do_exit
>        2.63 ±  3%      -0.2        2.48 ±  2%  perf-profile.children.cycles-pp.__mmput
>        2.16 ±  2%      -0.1        2.06 ±  3%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>        1.66 ±  2%      -0.1        1.57 ±  4%  perf-profile.children.cycles-pp.setlocale
>        2.69 ±  2%      -0.1        2.61        perf-profile.children.cycles-pp.do_pte_missing
>        0.77 ±  5%      -0.1        0.70 ±  6%  perf-profile.children.cycles-pp.tlb_finish_mmu
>        0.92 ±  2%      -0.0        0.87 ±  4%  perf-profile.children.cycles-pp.__irqentry_text_end
>        0.08 ± 10%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
>        0.10 ± 11%      -0.0        0.07 ± 21%  perf-profile.children.cycles-pp.__percpu_counter_init_many
>        0.14 ±  9%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.strnlen
>        0.12 ± 11%      -0.0        0.10 ±  8%  perf-profile.children.cycles-pp.mas_prev_slot
>        0.11 ± 12%      +0.0        0.14 ±  9%  perf-profile.children.cycles-pp.update_curr
>        0.19 ±  8%      +0.0        0.22 ±  6%  perf-profile.children.cycles-pp.enqueue_entity
>        0.10 ± 11%      +0.0        0.13 ± 11%  perf-profile.children.cycles-pp.__perf_event_task_sched_out
>        0.05 ± 46%      +0.0        0.08 ± 13%  perf-profile.children.cycles-pp.select_task_rq
>        0.13 ± 14%      +0.0        0.17 ±  8%  perf-profile.children.cycles-pp.perf_pmu_sched_task
>        0.20 ± 10%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
>        0.28 ±  9%      +0.1        0.34 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>        0.04 ± 44%      +0.1        0.11 ± 13%  perf-profile.children.cycles-pp.__queue_work
>        0.30 ± 11%      +0.1        0.38 ±  8%  perf-profile.children.cycles-pp.ttwu_do_activate
>        0.30 ±  4%      +0.1        0.38 ±  8%  perf-profile.children.cycles-pp.__pick_next_task
>        0.22 ±  7%      +0.1        0.29 ±  9%  perf-profile.children.cycles-pp.try_to_block_task
>        0.02 ±141%      +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.kick_pool
>        0.02 ± 99%      +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.queue_work_on
>        0.25 ±  4%      +0.1        0.35 ±  7%  perf-profile.children.cycles-pp.sched_ttwu_pending
>        0.33 ±  6%      +0.1        0.43 ±  5%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
>        0.29 ±  4%      +0.1        0.39 ±  6%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>        0.51 ±  6%      +0.1        0.63 ±  6%  perf-profile.children.cycles-pp.schedule_idle
>        0.46 ±  7%      +0.1        0.58 ±  5%  perf-profile.children.cycles-pp.schedule
>        0.88 ±  6%      +0.2        1.04 ±  5%  perf-profile.children.cycles-pp.ret_from_fork_asm
>        0.18 ±  6%      +0.2        0.34 ±  8%  perf-profile.children.cycles-pp.worker_thread
>        0.88 ±  6%      +0.2        1.04 ±  5%  perf-profile.children.cycles-pp.ret_from_fork
>        0.38 ±  8%      +0.2        0.56 ± 10%  perf-profile.children.cycles-pp.kthread
>        1.08 ±  3%      +0.2        1.32 ±  2%  perf-profile.children.cycles-pp.__schedule
>       66.15            +0.5       66.64        perf-profile.children.cycles-pp.cpuidle_idle_call
>       62.89            +0.6       63.47        perf-profile.children.cycles-pp.cpuidle_enter_state
>       63.00            +0.6       63.59        perf-profile.children.cycles-pp.cpuidle_enter
>       49.10            +0.6       49.69        perf-profile.children.cycles-pp.intel_idle
>       67.47            +0.7       68.17        perf-profile.children.cycles-pp.do_idle
>       67.47            +0.7       68.17        perf-profile.children.cycles-pp.common_startup_64
>       67.47            +0.7       68.17        perf-profile.children.cycles-pp.cpu_startup_entry
>        0.91 ±  2%      -0.0        0.86 ±  4%  perf-profile.self.cycles-pp.__irqentry_text_end
>        0.14 ± 11%      +0.1        0.22 ± 11%  perf-profile.self.cycles-pp.timerqueue_del
>       49.08            +0.6       49.68        perf-profile.self.cycles-pp.intel_idle
> 
> 
> 
> ***************************************************************************************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> =========================================================================================
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
>    gcc-12/performance/pipe/4/x86_64-rhel-9.4/process/800%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/hackbench
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>     3745213 ± 39%    +108.1%    7794858 ± 12%  cpuidle..usage
>      186670           +17.3%     218939 ±  2%  meminfo.Percpu
>        5.00          +306.7%      20.33 ± 66%  mpstat.max_utilization.seconds
>        9.35 ± 76%      -4.5        4.80 ±141%  perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_events.record__finish_output.__cmd_record
>        8.90 ± 75%      -4.3        4.57 ±141%  perf-profile.calltrace.cycles-pp.perf_session__deliver_event.__ordered_events__flush.perf_session__process_events.record__finish_output.__cmd_record
>        3283 ±  7%     -16.2%       2751 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.avg
>        3283 ±  7%     -16.2%       2751 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
>     1522512 ±  6%     +80.0%    2739797 ±  4%  vmstat.system.cs
>      308726 ±  8%     +60.5%     495472 ±  5%  vmstat.system.in
>      467562            +3.7%     485068 ±  2%  proc-vmstat.nr_kernel_stack
>      266084            +3.8%     276310        proc-vmstat.nr_slab_unreclaimable
>   1.375e+08            -2.0%  1.347e+08        proc-vmstat.numa_hit
>   1.373e+08            -2.0%  1.346e+08        proc-vmstat.numa_local
>      217472 ±  3%     -28.1%     156410        proc-vmstat.numa_other
>   1.382e+08            -2.0%  1.354e+08        proc-vmstat.pgalloc_normal
>   1.375e+08            -2.0%  1.347e+08        proc-vmstat.pgfree
>     1514102            -6.2%    1420287        hackbench.throughput
>     1480357            -6.7%    1380775        hackbench.throughput_avg
>     1514102            -6.2%    1420287        hackbench.throughput_best
>     1436918            -7.9%    1323413        hackbench.throughput_worst
>    14551264 ± 13%    +138.1%   34644707 ±  3%  hackbench.time.involuntary_context_switches
>        9919            -1.6%       9762        hackbench.time.percent_of_cpu_this_job_got
>        4239            +4.5%       4428        hackbench.time.system_time
>    56365933 ±  6%     +65.3%   93172066 ±  4%  hackbench.time.voluntary_context_switches
>    65085618           +26.7%   82440571 ±  2%  perf-stat.i.branch-misses
>       31.25            -1.6       29.66        perf-stat.i.cache-miss-rate%
>   2.469e+08            +8.9%  2.689e+08        perf-stat.i.cache-misses
>   7.519e+08           +15.9%  8.712e+08        perf-stat.i.cache-references
>     1353061 ±  7%     +87.5%    2537450 ±  5%  perf-stat.i.context-switches
>   2.269e+11            +3.5%  2.348e+11        perf-stat.i.cpu-cycles
>      134588 ± 13%     +81.9%     244825 ±  8%  perf-stat.i.cpu-migrations
>       13.60 ±  5%     +70.5%      23.20 ±  5%  perf-stat.i.metric.K/sec
>        1.26            +7.6%       1.35        perf-stat.overall.MPKI
>        0.11 ±  2%      +0.0        0.14 ±  2%  perf-stat.overall.branch-miss-rate%
>       34.12            -2.1       31.97        perf-stat.overall.cache-miss-rate%
>        1.17            +1.8%       1.19        perf-stat.overall.cpi
>      931.96            -5.3%     882.44        perf-stat.overall.cycles-between-cache-misses
>        0.85            -1.8%       0.84        perf-stat.overall.ipc
>   5.372e+10            -1.2%   5.31e+10        perf-stat.ps.branch-instructions
>    57783128 ±  2%     +32.9%   76802898 ±  2%  perf-stat.ps.branch-misses
>   2.696e+08            +7.2%   2.89e+08        perf-stat.ps.cache-misses
>   7.902e+08           +14.4%  9.039e+08        perf-stat.ps.cache-references
>     1288664 ±  7%     +94.6%    2508227 ±  5%  perf-stat.ps.context-switches
>   2.512e+11            +1.5%   2.55e+11        perf-stat.ps.cpu-cycles
>      122960 ± 14%     +82.3%     224127 ±  9%  perf-stat.ps.cpu-migrations
>   1.108e+13            +5.7%  1.171e+13        perf-stat.total.instructions
>        0.94 ±223%   +5929.9%      56.62 ±121%  perf-sched.sch_delay.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
>       26.44 ± 81%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      100.25 ±141%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        9.01 ± 43%   +1823.1%     173.24 ±106%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
>       49.43 ± 14%     +73.8%      85.93 ± 19%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>      130.63 ± 17%    +135.8%     308.04 ± 28%  perf-sched.sch_delay.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>       18.09 ± 30%    +130.4%      41.70 ± 26%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      196.51 ± 21%    +102.9%     398.77 ± 15%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       34.17 ± 39%    +191.1%      99.46 ± 20%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>      154.91 ±163%   +1649.9%       2710 ± 91%  perf-sched.sch_delay.max.ms.__cond_resched.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>        0.94 ±223%  +1.9e+05%       1743 ±120%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
>        3.19 ±124%     -91.9%       0.26 ±150%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>      646.26 ± 94%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      282.66 ±139%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       63.17 ± 52%   +2854.4%       1866 ±121%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
>        1507 ± 35%    +249.4%       5266 ± 47%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        3915 ± 67%     +98.7%       7779 ± 16%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       53.31 ± 18%     +79.9%      95.90 ± 23%  perf-sched.total_sch_delay.average.ms
>      149.37 ± 18%     +80.0%     268.92 ± 22%  perf-sched.total_wait_and_delay.average.ms
>       96.07 ± 18%     +80.1%     173.01 ± 21%  perf-sched.total_wait_time.average.ms
>      244.53 ± 47%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.anon_pipe_read.vfs_read.ksys_read
>      529.64 ± 20%     +38.5%     733.60 ± 20%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.anon_pipe_write.vfs_write.ksys_write
>      136.52 ± 15%     +73.7%     237.07 ± 18%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>      373.41 ± 16%    +136.3%     882.34 ± 27%  perf-sched.wait_and_delay.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>       51.96 ± 29%    +127.5%     118.22 ± 25%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      554.86 ± 23%    +103.0%       1126 ± 14%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>      298.52 ±136%    +436.9%       1602 ± 27%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>      556.66 ± 37%     -97.1%      16.09 ± 47%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      707.67 ± 31%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.anon_pipe_read.vfs_read.ksys_read
>        1358 ± 28%   +4707.9%      65291 ± 27%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       12184 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.anon_pipe_read.vfs_read.ksys_read
>        1393 ±134%    +379.9%       6685 ± 15%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>        6927 ±  6%    +119.8%      15224 ± 19%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      341.61 ± 21%     +39.1%     475.15 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.anon_pipe_write.vfs_write.ksys_write
>       51.39 ± 99%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      121.14 ±122%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       87.09 ± 15%     +73.6%     151.14 ± 18%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>      242.78 ± 16%    +136.6%     574.31 ± 27%  perf-sched.wait_time.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>       33.86 ± 29%    +126.0%      76.52 ± 24%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      250.32 ±109%     -89.4%      26.44 ±111%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
>      358.36 ± 25%    +103.1%     727.72 ± 14%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       77.40 ± 47%    +102.5%     156.70 ± 28%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
>       17.91 ± 42%     -75.3%       4.42 ± 76%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
>      266.70 ±137%    +431.6%       1417 ± 36%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>      536.93 ± 40%     -97.4%      13.81 ± 50%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      180.38 ±135%   +2208.8%       4164 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>        1028 ±129%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      312.94 ±123%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>      418.66 ±132%     -93.7%      26.44 ±111%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
>        1388 ±133%    +379.7%       6660 ± 15%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>        2022 ± 25%    +164.9%       5358 ± 46%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
> 
> 
> 
> ***************************************************************************************************
> lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-ivb-2ep2/shell_rtns_1/aim9/300s
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       11004           +86.2%      20490        meminfo.PageTables
>      121.33 ± 12%     +18.8%     144.17 ±  5%  perf-c2c.DRAM.remote
>        9155           +20.0%      10990        vmstat.system.cs
>        5129 ± 20%    +107.2%      10631 ±  3%  numa-meminfo.node0.PageTables
>        5864 ± 17%     +67.3%       9811 ±  3%  numa-meminfo.node1.PageTables
>        1278 ± 20%    +107.9%       2658 ±  3%  numa-vmstat.node0.nr_page_table_pages
>        1469 ± 17%     +66.4%       2446 ±  3%  numa-vmstat.node1.nr_page_table_pages
>      319.43            -2.1%     312.66        aim9.shell_rtns_1.ops_per_sec
>    27217846            -2.5%   26546962        aim9.time.minor_page_faults
>     1051878            -2.1%    1029547        aim9.time.voluntary_context_switches
>       30502           +18.6%      36187        sched_debug.cpu.nr_switches.avg
>       90327 ± 12%     +22.7%     110866 ±  4%  sched_debug.cpu.nr_switches.max
>       26316 ± 16%     +25.5%      33021 ±  5%  sched_debug.cpu.nr_switches.stddev
>        0.03 ±  7%     +70.7%       0.05 ± 53%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.02 ±  3%     +38.9%       0.02 ± 28%  perf-sched.total_sch_delay.average.ms
>       27.43 ±  2%     -14.5%      23.45        perf-sched.total_wait_and_delay.average.ms
>       23174           +18.0%      27340        perf-sched.total_wait_and_delay.count.ms
>       27.41 ±  2%     -14.6%      23.42        perf-sched.total_wait_time.average.ms
>      115.38 ±  3%     -71.9%      32.37 ±  2%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1656 ±  3%    +280.2%       6299        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      115.35 ±  3%     -72.0%      32.31 ±  2%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        2737           +86.1%       5095        proc-vmstat.nr_page_table_pages
>       30460            +3.2%      31439        proc-vmstat.nr_shmem
>       27933            +1.8%      28432        proc-vmstat.nr_slab_unreclaimable
>    19466749            -2.5%   18980434        proc-vmstat.numa_hit
>    19414531            -2.5%   18927584        proc-vmstat.numa_local
>    20028107            -2.5%   19528806        proc-vmstat.pgalloc_normal
>    28087705            -2.4%   27417155        proc-vmstat.pgfault
>    19980173            -2.5%   19474402        proc-vmstat.pgfree
>      420074            -5.7%     396239 ±  8%  proc-vmstat.pgreuse
>        2685            -1.9%       2633        proc-vmstat.unevictable_pgs_culled
>    5.48e+08            -1.2%  5.412e+08        perf-stat.i.branch-instructions
>        5.92            +0.1        6.00        perf-stat.i.branch-miss-rate%
>        9195           +19.9%      11021        perf-stat.i.context-switches
>        1.96            +1.7%       1.99        perf-stat.i.cpi
>       70.13           +73.4%     121.59 ±  8%  perf-stat.i.cpu-migrations
>   2.725e+09            -1.3%   2.69e+09        perf-stat.i.instructions
>        0.53            -1.6%       0.52        perf-stat.i.ipc
>        3.80            -2.4%       3.71        perf-stat.i.metric.K/sec
>       91139            -2.4%      88949        perf-stat.i.minor-faults
>       91139            -2.4%      88949        perf-stat.i.page-faults
>        5.00 ± 44%      +1.1        6.07        perf-stat.overall.branch-miss-rate%
>        1.49 ± 44%     +21.9%       1.82        perf-stat.overall.cpi
>        7643 ± 44%     +43.7%      10984        perf-stat.ps.context-switches
>       58.17 ± 44%    +108.4%     121.21 ±  8%  perf-stat.ps.cpu-migrations
>        2.06 ±  2%      -0.2        1.87 ± 12%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.98 ±  7%      -0.2        0.83 ± 12%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>        1.69 ±  2%      -0.1        1.54 ±  2%  perf-profile.calltrace.cycles-pp.setlocale
>        0.58 ±  5%      -0.1        0.44 ± 44%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__open64_nocancel.setlocale
>        0.72 ±  6%      -0.1        0.60 ±  8%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
>        3.21 ±  2%      -0.1        3.11        perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64
>        0.70 ±  4%      -0.1        0.62 ±  6%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
>        1.52 ±  2%      -0.1        1.44 ±  3%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.34 ±  3%      -0.1        1.28 ±  3%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>        0.89 ±  3%      -0.1        0.84        perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>        0.17 ±141%      +0.4        0.61 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
>        0.17 ±141%      +0.4        0.61 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
>       65.10            +0.5       65.56        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       66.40            +0.6       67.00        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       66.46            +0.6       67.08        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>       66.46            +0.6       67.08        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>       67.63            +0.7       68.30        perf-profile.calltrace.cycles-pp.common_startup_64
>       20.14            -0.6       19.51        perf-profile.children.cycles-pp.do_syscall_64
>       20.20            -0.6       19.57        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>        1.13 ±  5%      -0.2        0.98 ±  9%  perf-profile.children.cycles-pp.rcu_core
>        1.69 ±  2%      -0.1        1.54 ±  2%  perf-profile.children.cycles-pp.setlocale
>        0.84 ±  4%      -0.1        0.71 ±  5%  perf-profile.children.cycles-pp.rcu_do_batch
>        2.16 ±  2%      -0.1        2.04 ±  3%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
>        1.15 ±  4%      -0.1        1.04 ±  5%  perf-profile.children.cycles-pp.__open64_nocancel
>        3.22 ±  2%      -0.1        3.12        perf-profile.children.cycles-pp.exec_binprm
>        2.09 ±  2%      -0.1        2.00 ±  2%  perf-profile.children.cycles-pp.kernel_clone
>        0.88 ±  4%      -0.1        0.79 ±  4%  perf-profile.children.cycles-pp.mas_store_prealloc
>        2.19            -0.1        2.10 ±  3%  perf-profile.children.cycles-pp.__x64_sys_openat
>        0.70 ±  4%      -0.1        0.62 ±  6%  perf-profile.children.cycles-pp.dup_mm
>        1.36 ±  3%      -0.1        1.30        perf-profile.children.cycles-pp._Fork
>        0.56 ±  4%      -0.1        0.50 ±  8%  perf-profile.children.cycles-pp.dup_mmap
>        0.09 ± 16%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
>        0.31 ±  8%      -0.1        0.25 ± 10%  perf-profile.children.cycles-pp.strncpy_from_user
>        0.94 ±  3%      -0.1        0.88 ±  2%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
>        0.41 ±  5%      -0.0        0.36 ±  5%  perf-profile.children.cycles-pp.irqtime_account_irq
>        0.18 ± 12%      -0.0        0.14 ±  7%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
>        0.20 ±  7%      -0.0        0.17 ±  9%  perf-profile.children.cycles-pp.perf_event_task_tick
>        0.08 ± 14%      -0.0        0.05 ± 49%  perf-profile.children.cycles-pp.mas_update_gap
>        0.24 ±  5%      -0.0        0.21 ±  5%  perf-profile.children.cycles-pp.filemap_read
>        0.19 ±  7%      -0.0        0.16 ±  8%  perf-profile.children.cycles-pp.__call_rcu_common
>        0.22 ±  2%      -0.0        0.19 ±  5%  perf-profile.children.cycles-pp.mas_next_slot
>        0.09 ±  5%      +0.0        0.12 ±  7%  perf-profile.children.cycles-pp.__perf_event_task_sched_out
>        0.05 ± 47%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.lru_gen_del_folio
>        0.10 ± 14%      +0.0        0.12 ± 18%  perf-profile.children.cycles-pp.__folio_mod_stat
>        0.12 ± 12%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.perf_pmu_sched_task
>        0.20 ± 10%      +0.0        0.24 ±  4%  perf-profile.children.cycles-pp.prepare_task_switch
>        0.06 ± 47%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.__queue_work
>        0.56 ±  5%      +0.1        0.61 ±  4%  perf-profile.children.cycles-pp.sched_balance_domains
>        0.04 ± 72%      +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.kick_pool
>        0.04 ± 72%      +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.queue_work_on
>        0.33 ±  6%      +0.1        0.38 ±  7%  perf-profile.children.cycles-pp.dequeue_entities
>        0.35 ±  6%      +0.1        0.40 ±  7%  perf-profile.children.cycles-pp.dequeue_task_fair
>        0.52 ±  6%      +0.1        0.58 ±  5%  perf-profile.children.cycles-pp.enqueue_task_fair
>        0.54 ±  7%      +0.1        0.60 ±  5%  perf-profile.children.cycles-pp.enqueue_task
>        0.28 ±  9%      +0.1        0.35 ±  5%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>        0.21 ±  4%      +0.1        0.28 ± 12%  perf-profile.children.cycles-pp.try_to_block_task
>        0.34 ±  4%      +0.1        0.42 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
>        0.36 ±  3%      +0.1        0.46 ±  6%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
>        0.28 ±  4%      +0.1        0.38 ±  5%  perf-profile.children.cycles-pp.sched_ttwu_pending
>        0.33 ±  2%      +0.1        0.43 ±  5%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>        0.46 ±  7%      +0.1        0.56 ±  6%  perf-profile.children.cycles-pp.schedule
>        0.48 ±  8%      +0.1        0.61 ±  8%  perf-profile.children.cycles-pp.timerqueue_del
>        0.18 ± 13%      +0.1        0.32 ± 11%  perf-profile.children.cycles-pp.worker_thread
>        0.38 ±  9%      +0.2        0.52 ± 10%  perf-profile.children.cycles-pp.kthread
>        1.10 ±  5%      +0.2        1.25 ±  2%  perf-profile.children.cycles-pp.__schedule
>        0.85 ±  8%      +0.2        1.01 ±  7%  perf-profile.children.cycles-pp.ret_from_fork
>        0.85 ±  8%      +0.2        1.02 ±  7%  perf-profile.children.cycles-pp.ret_from_fork_asm
>       63.15            +0.5       63.64        perf-profile.children.cycles-pp.cpuidle_enter
>       66.26            +0.5       66.77        perf-profile.children.cycles-pp.cpuidle_idle_call
>       66.46            +0.6       67.08        perf-profile.children.cycles-pp.start_secondary
>       67.63            +0.7       68.30        perf-profile.children.cycles-pp.common_startup_64
>       67.63            +0.7       68.30        perf-profile.children.cycles-pp.cpu_startup_entry
>       67.63            +0.7       68.30        perf-profile.children.cycles-pp.do_idle
>        1.20 ±  3%      -0.1        1.12 ±  4%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
>        0.09 ± 16%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
>        0.25 ±  6%      -0.0        0.21 ± 12%  perf-profile.self.cycles-pp.irqtime_account_irq
>        0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp.prepend_path
>        0.13 ± 10%      +0.1        0.24 ± 11%  perf-profile.self.cycles-pp.timerqueue_del
> 
> 
> 
> ***************************************************************************************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> =========================================================================================
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
>    gcc-12/performance/pipe/4/x86_64-rhel-9.4/process/50%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/hackbench
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>   3.924e+08 ±  3%     +55.1%  6.086e+08 ±  2%  cpuidle..time
>     7504886 ± 11%    +184.4%   21340245 ±  6%  cpuidle..usage
>    13350305            -3.8%   12848570        vmstat.system.cs
>     1849619            +5.1%    1943754        vmstat.system.in
>        3.56 ±  5%      +2.6        6.16 ±  7%  mpstat.cpu.all.idle%
>        0.69            +0.2        0.90 ±  3%  mpstat.cpu.all.irq%
>        0.03 ±  3%      +0.0        0.04 ±  3%  mpstat.cpu.all.soft%
>       18666 ±  9%     +41.2%      26352 ±  6%  perf-c2c.DRAM.remote
>      197041           -39.6%     118945 ±  5%  perf-c2c.HITM.local
>        3178 ± 12%     +37.2%       4361 ± 11%  perf-c2c.HITM.remote
>      200219           -38.4%     123307 ±  5%  perf-c2c.HITM.total
>     2842579 ± 11%     +60.1%    4550025 ± 12%  meminfo.Active
>     2842579 ± 11%     +60.1%    4550025 ± 12%  meminfo.Active(anon)
>     5535242 ±  5%     +30.9%    7248257 ±  7%  meminfo.Cached
>     3846718 ±  8%     +44.0%    5539484 ±  9%  meminfo.Committed_AS
>     9684149 ±  3%     +20.5%   11666616 ±  4%  meminfo.Memused
>      136127 ±  3%     +14.2%     155524        meminfo.PageTables
>       62144           +22.8%      76336        meminfo.Percpu
>     2001586 ± 16%     +85.6%    3714611 ± 14%  meminfo.Shmem
>     9759598 ±  3%     +20.0%   11714619 ±  4%  meminfo.max_used_kB
>      710625 ± 11%     +59.3%    1131770 ± 11%  proc-vmstat.nr_active_anon
>     1383631 ±  5%     +30.6%    1806419 ±  7%  proc-vmstat.nr_file_pages
>       34220 ±  3%     +13.9%      38987        proc-vmstat.nr_page_table_pages
>      500216 ± 16%     +84.5%     923007 ± 14%  proc-vmstat.nr_shmem
>      710625 ± 11%     +59.3%    1131770 ± 11%  proc-vmstat.nr_zone_active_anon
>    92308030            +8.7%  1.004e+08        proc-vmstat.numa_hit
>    92171407            +8.7%  1.002e+08        proc-vmstat.numa_local
>      133616            +2.7%     137265        proc-vmstat.numa_other
>    92394313            +8.7%  1.004e+08        proc-vmstat.pgalloc_normal
>    91035691            +7.8%   98094626        proc-vmstat.pgfree
>      867815           +11.8%     970369        hackbench.throughput
>      830278           +11.6%     926834        hackbench.throughput_avg
>      867815           +11.8%     970369        hackbench.throughput_best
>      760822           +14.2%     869145        hackbench.throughput_worst
>       72.87           -10.3%      65.36        hackbench.time.elapsed_time
>       72.87           -10.3%      65.36        hackbench.time.elapsed_time.max
>   2.493e+08           -17.7%  2.052e+08        hackbench.time.involuntary_context_switches
>       12357            -3.9%      11879        hackbench.time.percent_of_cpu_this_job_got
>        8029           -14.8%       6842        hackbench.time.system_time
>      976.58            -5.5%     923.21        hackbench.time.user_time
>    7.54e+08           -14.4%  6.451e+08        hackbench.time.voluntary_context_switches
>   5.598e+10            +6.6%  5.965e+10        perf-stat.i.branch-instructions
>        0.40            -0.0        0.38        perf-stat.i.branch-miss-rate%
>        8.36 ±  2%      +4.6       12.98 ±  3%  perf-stat.i.cache-miss-rate%
>    2.11e+09           -33.8%  1.396e+09        perf-stat.i.cache-references
>    13687653            -3.4%   13225338        perf-stat.i.context-switches
>        1.36            -7.9%       1.25        perf-stat.i.cpi
>   3.219e+11            -2.2%  3.147e+11        perf-stat.i.cpu-cycles
>        1915 ±  2%      -6.6%       1788 ±  3%  perf-stat.i.cycles-between-cache-misses
>   2.371e+11            +6.0%  2.512e+11        perf-stat.i.instructions
>        0.74            +8.5%       0.80        perf-stat.i.ipc
>        1.15 ± 14%     -28.3%       0.82 ± 23%  perf-stat.i.major-faults
>      115.09            -3.2%     111.40        perf-stat.i.metric.K/sec
>        0.37            -0.0        0.35        perf-stat.overall.branch-miss-rate%
>        8.15 ±  3%      +4.6       12.74 ±  3%  perf-stat.overall.cache-miss-rate%
>        1.36            -7.7%       1.25        perf-stat.overall.cpi
>        1875 ±  2%      -5.5%       1772 ±  4%  perf-stat.overall.cycles-between-cache-misses
>        0.74            +8.3%       0.80        perf-stat.overall.ipc
>   5.524e+10            +6.4%  5.877e+10        perf-stat.ps.branch-instructions
>   2.079e+09           -33.9%  1.375e+09        perf-stat.ps.cache-references
>    13486088            -3.4%   13020988        perf-stat.ps.context-switches
>   3.175e+11            -2.3%  3.101e+11        perf-stat.ps.cpu-cycles
>    2.34e+11            +5.8%  2.475e+11        perf-stat.ps.instructions
>        1.09 ± 14%     -28.3%       0.78 ± 21%  perf-stat.ps.major-faults
>    1.73e+13            -5.1%  1.642e+13        perf-stat.total.instructions
>     3527725           +10.7%    3905361        sched_debug.cfs_rq:/.avg_vruntime.avg
>     3975260           +14.1%    4535959 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
>       98657 ± 17%     +84.9%     182407 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       11.83 ±  7%     +17.6%      13.92 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.max
>        2.71 ±  5%     +21.8%       3.30 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
>       11.75 ±  7%     +17.7%      13.83 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.max
>        2.68 ±  4%     +21.2%       3.25 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
>        4556 ±223%    +691.0%      36039 ± 34%  sched_debug.cfs_rq:/.left_deadline.avg
>      583131 ±223%    +577.3%    3949548 ±  4%  sched_debug.cfs_rq:/.left_deadline.max
>       51341 ±223%    +622.0%     370695 ± 16%  sched_debug.cfs_rq:/.left_deadline.stddev
>        4555 ±223%    +691.0%      36035 ± 34%  sched_debug.cfs_rq:/.left_vruntime.avg
>      583105 ±223%    +577.3%    3949123 ±  4%  sched_debug.cfs_rq:/.left_vruntime.max
>       51338 ±223%    +622.0%     370651 ± 16%  sched_debug.cfs_rq:/.left_vruntime.stddev
>     3527725           +10.7%    3905361        sched_debug.cfs_rq:/.min_vruntime.avg
>     3975260           +14.1%    4535959 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
>       98657 ± 17%     +84.9%     182407 ± 18%  sched_debug.cfs_rq:/.min_vruntime.stddev
>        0.22 ±  5%     +13.9%       0.25 ±  5%  sched_debug.cfs_rq:/.nr_queued.stddev
>        4555 ±223%    +691.0%      36035 ± 34%  sched_debug.cfs_rq:/.right_vruntime.avg
>      583105 ±223%    +577.3%    3949123 ±  4%  sched_debug.cfs_rq:/.right_vruntime.max
>       51338 ±223%    +622.0%     370651 ± 16%  sched_debug.cfs_rq:/.right_vruntime.stddev
>        1336 ±  7%     +50.8%       2014 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
>      552.53 ±  8%     +19.6%     660.87 ±  5%  sched_debug.cfs_rq:/.util_est.avg
>      384.27 ±  9%     +28.9%     495.43 ± 11%  sched_debug.cfs_rq:/.util_est.stddev
>        1328 ± 17%     +42.7%       1896 ± 13%  sched_debug.cpu.curr->pid.stddev
>       11.75 ±  8%     +19.1%      14.00 ±  6%  sched_debug.cpu.nr_running.max
>        2.71 ±  5%     +22.7%       3.33 ±  4%  sched_debug.cpu.nr_running.stddev
>       76578 ±  9%     +33.7%     102390 ±  5%  sched_debug.cpu.nr_switches.stddev
>       62.25 ±  7%     +17.9%      73.42 ±  7%  sched_debug.cpu.nr_uninterruptible.max
>        8.11 ± 58%     -82.0%       1.46 ± 47%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.anon_pipe_write
>       12.04 ±104%     -86.8%       1.58 ± 55%  perf-sched.sch_delay.avg.ms.__cond_resched.__mutex_lock.constprop.0.anon_pipe_write
>        0.11 ±123%     -95.3%       0.01 ±102%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.exec_binprm
>        0.06 ±103%     -93.6%       0.00 ±154%  perf-sched.sch_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.exec_binprm.bprm_execve
>        0.10 ±109%     -93.9%       0.01 ±163%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
>        1.00 ± 21%     -59.6%       0.40 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.anon_pipe_read.vfs_read.ksys_read
>       14.54 ± 14%     -79.2%       3.02 ± 51%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.anon_pipe_write.vfs_write.ksys_write
>        1.50 ± 84%     -74.1%       0.39 ± 90%  perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
>        1.13 ± 68%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.38 ± 97%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        1.10 ± 17%     -68.9%       0.34 ± 49%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>       42.25 ± 18%     -71.7%      11.96 ± 53%  perf-sched.sch_delay.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>        3.25 ± 17%     -77.5%       0.73 ± 49%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>       29.17 ± 33%     -62.0%      11.09 ± 85%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       46.25 ± 15%     -68.8%      14.43 ± 52%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>        3.72 ± 70%     -81.0%       0.70 ± 67%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>        7.95 ± 55%     -69.7%       2.41 ± 65%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>        3.66 ±139%     -97.1%       0.11 ± 58%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
>        3.05 ± 44%     -91.9%       0.25 ± 57%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_read
>       29.96 ±  9%     -83.6%       4.90 ± 48%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>       26.20 ± 59%     -88.9%       2.92 ± 66%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        0.14 ± 84%     -91.2%       0.01 ±142%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
>        0.20 ±149%     -97.5%       0.01 ±102%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.exec_binprm
>        0.11 ±144%     -96.6%       0.00 ±154%  perf-sched.sch_delay.max.ms.__cond_resched.filemap_read.__kernel_read.exec_binprm.bprm_execve
>        0.19 ±118%     -96.7%       0.01 ±163%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
>      274.64 ± 95%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.72 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        3135 ±  5%     -48.6%       1611 ± 57%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1320 ± 19%     -78.6%     282.01 ± 74%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>      265.55 ± 82%     -77.9%      58.70 ±124%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_read
>        1850 ± 28%     -59.1%     757.74 ± 68%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>      766.85 ± 56%     -68.0%     245.51 ± 51%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        1.77 ± 17%     -71.9%       0.50 ± 49%  perf-sched.total_sch_delay.average.ms
>        5.15 ± 17%     -69.5%       1.57 ± 48%  perf-sched.total_wait_and_delay.average.ms
>        3.38 ± 17%     -68.2%       1.07 ± 48%  perf-sched.total_wait_time.average.ms
>        5100 ±  3%     -31.0%       3522 ± 47%  perf-sched.total_wait_time.max.ms
>       27.42 ± 49%     -85.2%       4.07 ± 47%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.anon_pipe_write
>       35.29 ± 80%     -85.8%       5.00 ± 51%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__mutex_lock.constprop.0.anon_pipe_write
>       42.28 ± 14%     -79.4%       8.70 ± 51%  perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.anon_pipe_write.vfs_write.ksys_write
>        3.12 ± 17%     -66.4%       1.05 ± 48%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>      122.62 ± 18%     -70.4%      36.26 ± 53%  perf-sched.wait_and_delay.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>      250.26 ± 65%     -94.2%      14.56 ± 55%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        9.37 ± 17%     -78.2%       2.05 ± 48%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>       58.34 ± 33%     -62.0%      22.18 ± 85%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>      134.44 ± 15%     -69.3%      41.24 ± 52%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       86.94 ±  6%     -83.1%      14.68 ± 48%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>       86.57 ± 39%     -86.0%      12.14 ± 59%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      647.92 ± 48%     -97.9%      13.86 ± 45%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        6386 ±  6%     -46.8%       3397 ± 57%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        3868 ± 27%     -60.4%       1531 ± 67%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>        1647 ± 55%     -67.7%     531.51 ± 50%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        5014 ±  5%     -32.5%       3385 ± 47%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       19.31 ± 47%     -86.5%       2.61 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.anon_pipe_write
>       23.25 ± 70%     -85.3%       3.42 ± 52%  perf-sched.wait_time.avg.ms.__cond_resched.__mutex_lock.constprop.0.anon_pipe_write
>       18.33 ± 15%     -42.0%      10.64 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        0.11 ±123%     -95.3%       0.01 ±102%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.exec_binprm
>        0.06 ±103%     -93.6%       0.00 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.filemap_read.__kernel_read.exec_binprm.bprm_execve
>        0.10 ±109%     -93.9%       0.01 ±163%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
>        1.70 ± 21%     -52.6%       0.81 ± 48%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.anon_pipe_read.vfs_read.ksys_read
>       27.74 ± 15%     -79.5%       5.68 ± 51%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.anon_pipe_write.vfs_write.ksys_write
>        2.17 ± 75%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.42 ± 97%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        2.02 ± 17%     -65.1%       0.70 ± 48%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
>       80.37 ± 18%     -69.8%      24.31 ± 52%  perf-sched.wait_time.avg.ms.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
>      210.13 ± 68%     -95.1%      10.21 ± 55%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        6.12 ± 17%     -78.5%       1.32 ± 48%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>       29.17 ± 33%     -62.0%      11.09 ± 85%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>       88.19 ± 16%     -69.6%      26.81 ± 52%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>       13.77 ± 45%     -65.7%       4.72 ± 53%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
>      104.64 ± 42%     -76.4%      24.74 ±135%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
>        5.16 ± 29%     -92.5%       0.39 ± 48%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_read
>       56.98 ±  5%     -82.9%       9.77 ± 48%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>       60.36 ± 32%     -84.7%       9.22 ± 57%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      619.88 ± 43%     -98.0%      12.52 ± 45%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.14 ± 84%     -91.2%       0.01 ±142%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
>      740.14 ± 35%     -68.5%     233.31 ± 83%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.anon_pipe_write
>        0.20 ±149%     -97.5%       0.01 ±102%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.map_vdso.load_elf_binary.exec_binprm
>        0.11 ±144%     -96.6%       0.00 ±154%  perf-sched.wait_time.max.ms.__cond_resched.filemap_read.__kernel_read.exec_binprm.bprm_execve
>        0.19 ±118%     -96.7%       0.01 ±163%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_link
>      327.64 ± 71%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        3.72 ±151%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
>        3299 ±  6%     -40.7%       1957 ± 51%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      436.75 ± 39%     -76.9%     100.85 ± 98%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_read
>        2112 ± 19%     -62.3%     796.34 ± 63%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.anon_pipe_write
>      947.83 ± 46%     -58.8%     390.83 ± 53%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        5014 ±  5%     -32.5%       3385 ± 47%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
> 
> 
> 
> ***************************************************************************************************
> lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-ivb-2ep2/shell_rtns_2/aim9/300s
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       11036           +85.7%      20499        meminfo.PageTables
>      125.17 ±  8%     +18.4%     148.17 ±  7%  perf-c2c.HITM.local
>       30464           +18.7%      36160        sched_debug.cpu.nr_switches.avg
>        9166           +19.8%      10985        vmstat.system.cs
>        6623 ± 17%     +60.8%      10652 ±  5%  numa-meminfo.node0.PageTables
>        4414 ± 26%    +123.2%       9853 ±  6%  numa-meminfo.node1.PageTables
>        1653 ± 17%     +60.1%       2647 ±  5%  numa-vmstat.node0.nr_page_table_pages
>        1097 ± 26%    +123.9%       2457 ±  6%  numa-vmstat.node1.nr_page_table_pages
>      319.08            -2.2%     312.04        aim9.shell_rtns_2.ops_per_sec
>    27170926            -2.2%   26586121        aim9.time.minor_page_faults
>     1051038            -2.2%    1027732        aim9.time.voluntary_context_switches
>        2736           +86.4%       5101        proc-vmstat.nr_page_table_pages
>       28014            +1.3%      28378        proc-vmstat.nr_slab_unreclaimable
>    19332129            -1.5%   19048363        proc-vmstat.numa_hit
>    19283853            -1.5%   18996609        proc-vmstat.numa_local
>    19892794            -1.5%   19598065        proc-vmstat.pgalloc_normal
>    28044189            -2.1%   27457289        proc-vmstat.pgfault
>    19843766            -1.5%   19543091        proc-vmstat.pgfree
>      419715            -5.7%     395688 ±  8%  proc-vmstat.pgreuse
>        2682            -2.0%       2628        proc-vmstat.unevictable_pgs_culled
>        0.07 ±  6%     -30.5%       0.05 ± 22%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>        0.03 ±  6%     +36.0%       0.04        perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.07 ± 33%     -57.5%       0.03 ± 53%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
>        0.02 ± 74%    +112.0%       0.05 ± 36%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.path_openat
>        0.02           +24.1%       0.02 ±  2%  perf-sched.total_sch_delay.average.ms
>       27.52           -14.0%      23.67        perf-sched.total_wait_and_delay.average.ms
>       23179           +18.3%      27421        perf-sched.total_wait_and_delay.count.ms
>       27.50           -14.0%      23.65        perf-sched.total_wait_time.average.ms
>      117.03 ±  3%     -72.4%      32.27 ±  2%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        1655 ±  2%    +282.0%       6324        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.96 ± 29%     +51.6%       1.45 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
>      117.00 ±  3%     -72.5%      32.23 ±  2%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        5.93            +0.1        6.00        perf-stat.i.branch-miss-rate%
>        9189           +19.8%      11011        perf-stat.i.context-switches
>        1.96            +1.6%       1.99        perf-stat.i.cpi
>       71.21           +60.6%     114.39 ±  4%  perf-stat.i.cpu-migrations
>        0.53            -1.5%       0.52        perf-stat.i.ipc
>        3.79            -2.1%       3.71        perf-stat.i.metric.K/sec
>       90998            -2.1%      89084        perf-stat.i.minor-faults
>       90998            -2.1%      89084        perf-stat.i.page-faults
>        5.99            +0.1        6.06        perf-stat.overall.branch-miss-rate%
>        1.79            +1.4%       1.82        perf-stat.overall.cpi
>        0.56            -1.3%       0.55        perf-stat.overall.ipc
>        9158           +19.8%      10974        perf-stat.ps.context-switches
>       70.99           +60.6%     114.02 ±  4%  perf-stat.ps.cpu-migrations
>       90694            -2.1%      88787        perf-stat.ps.minor-faults
>       90695            -2.1%      88787        perf-stat.ps.page-faults
>   8.155e+11            -1.1%  8.065e+11        perf-stat.total.instructions
>        8.87            -0.3        8.55        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        8.86            -0.3        8.54        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.53 ±  2%      -0.1        2.43 ±  2%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
>        2.54            -0.1        2.44 ±  2%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>        2.49            -0.1        2.40 ±  2%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
>        0.98 ±  5%      -0.1        0.90 ±  5%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.70 ±  3%      -0.1        0.62 ±  6%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
>        0.18 ±141%      +0.5        0.67 ±  6%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
>        0.18 ±141%      +0.5        0.67 ±  6%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
>        0.00            +0.6        0.59 ±  7%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
>       62.48            +0.7       63.14        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>       49.10            +0.7       49.78        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>       67.62            +0.8       68.43        perf-profile.calltrace.cycles-pp.common_startup_64
>       20.14            -0.7       19.40        perf-profile.children.cycles-pp.do_syscall_64
>       20.18            -0.7       19.44        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>        3.33 ±  2%      -0.2        3.16 ±  2%  perf-profile.children.cycles-pp.vm_mmap_pgoff
>        3.22 ±  2%      -0.2        3.06        perf-profile.children.cycles-pp.do_mmap
>        3.51 ±  2%      -0.1        3.38        perf-profile.children.cycles-pp.do_exit
>        3.52 ±  2%      -0.1        3.38        perf-profile.children.cycles-pp.__x64_sys_exit_group
>        3.52 ±  2%      -0.1        3.38        perf-profile.children.cycles-pp.do_group_exit
>        3.67            -0.1        3.54        perf-profile.children.cycles-pp.x64_sys_call
>        2.21            -0.1        2.09 ±  3%  perf-profile.children.cycles-pp.__x64_sys_openat
>        2.07 ±  2%      -0.1        1.94 ±  2%  perf-profile.children.cycles-pp.path_openat
>        2.09 ±  2%      -0.1        1.97 ±  2%  perf-profile.children.cycles-pp.do_filp_open
>        2.19            -0.1        2.08 ±  3%  perf-profile.children.cycles-pp.do_sys_openat2
>        1.50 ±  4%      -0.1        1.39 ±  3%  perf-profile.children.cycles-pp.copy_process
>        2.56            -0.1        2.46 ±  2%  perf-profile.children.cycles-pp.exit_mm
>        2.55            -0.1        2.44 ±  2%  perf-profile.children.cycles-pp.__mmput
>        2.51 ±  2%      -0.1        2.41 ±  2%  perf-profile.children.cycles-pp.exit_mmap
>        0.70 ±  3%      -0.1        0.62 ±  6%  perf-profile.children.cycles-pp.dup_mm
>        0.94 ±  4%      -0.1        0.89 ±  2%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
>        0.57 ±  3%      -0.0        0.52 ±  4%  perf-profile.children.cycles-pp.alloc_pages_noprof
>        0.20 ± 12%      -0.0        0.15 ± 10%  perf-profile.children.cycles-pp.perf_event_task_tick
>        0.18 ±  4%      -0.0        0.14 ± 15%  perf-profile.children.cycles-pp.xas_find
>        0.10 ± 12%      -0.0        0.07 ± 24%  perf-profile.children.cycles-pp.up_write
>        0.09 ±  6%      -0.0        0.07 ± 11%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
>        0.08 ± 12%      +0.0        0.10 ±  8%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
>        0.10 ± 13%      +0.0        0.13 ±  5%  perf-profile.children.cycles-pp.__perf_event_task_sched_out
>        0.20 ±  8%      +0.0        0.23 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
>        0.21 ±  9%      +0.0        0.25 ±  4%  perf-profile.children.cycles-pp.prepare_task_switch
>        0.03 ±101%      +0.0        0.07 ± 16%  perf-profile.children.cycles-pp.run_ksoftirqd
>        0.04 ± 71%      +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.kick_pool
>        0.05 ± 47%      +0.1        0.11 ± 16%  perf-profile.children.cycles-pp.__queue_work
>        0.28 ±  5%      +0.1        0.34 ±  7%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>        0.50            +0.1        0.56 ±  2%  perf-profile.children.cycles-pp.timerqueue_del
>        0.04 ± 71%      +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.queue_work_on
>        0.51 ±  4%      +0.1        0.58 ±  2%  perf-profile.children.cycles-pp.enqueue_task_fair
>        0.32 ±  3%      +0.1        0.40 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
>        0.53 ±  5%      +0.1        0.61 ±  3%  perf-profile.children.cycles-pp.enqueue_task
>        0.49 ±  4%      +0.1        0.57 ±  6%  perf-profile.children.cycles-pp.schedule
>        0.28 ±  6%      +0.1        0.38        perf-profile.children.cycles-pp.sched_ttwu_pending
>        0.32 ±  5%      +0.1        0.43 ±  2%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>        0.35 ±  8%      +0.1        0.47 ±  2%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
>        0.17 ± 10%      +0.2        0.34 ± 12%  perf-profile.children.cycles-pp.worker_thread
>        0.88 ±  3%      +0.2        1.06 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
>        0.88 ±  3%      +0.2        1.06 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
>        0.39 ±  6%      +0.2        0.59 ±  7%  perf-profile.children.cycles-pp.kthread
>       66.24            +0.6       66.85        perf-profile.children.cycles-pp.cpuidle_idle_call
>       63.09            +0.6       63.73        perf-profile.children.cycles-pp.cpuidle_enter
>       62.97            +0.6       63.61        perf-profile.children.cycles-pp.cpuidle_enter_state
>       67.61            +0.8       68.43        perf-profile.children.cycles-pp.do_idle
>       67.62            +0.8       68.43        perf-profile.children.cycles-pp.common_startup_64
>       67.62            +0.8       68.43        perf-profile.children.cycles-pp.cpu_startup_entry
>        0.37 ± 11%      -0.1        0.31 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
>        0.10 ± 13%      -0.0        0.06 ± 50%  perf-profile.self.cycles-pp.up_write
>        0.15 ±  4%      +0.1        0.22 ±  8%  perf-profile.self.cycles-pp.timerqueue_del
> 
> 
> 
> ***************************************************************************************************
> lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
> =========================================================================================
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/testtime:
>    gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-ivb-2ep2/exec_test/aim9/300s
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       12120           +76.7%      21422        meminfo.PageTables
>        8543           +26.9%      10840        vmstat.system.cs
>        6148 ± 11%     +89.9%      11678 ±  5%  numa-meminfo.node0.PageTables
>        5909 ± 11%     +64.0%       9689 ±  7%  numa-meminfo.node1.PageTables
>        1532 ± 10%     +90.5%       2919 ±  5%  numa-vmstat.node0.nr_page_table_pages
>        1468 ± 11%     +65.2%       2426 ±  7%  numa-vmstat.node1.nr_page_table_pages
>        2991           +78.0%       5323        proc-vmstat.nr_page_table_pages
>    32726750            -2.4%   31952115        proc-vmstat.pgfault
>        1228            -2.6%       1197        aim9.exec_test.ops_per_sec
>       11018 ±  2%     +10.5%      12178 ±  2%  aim9.time.involuntary_context_switches
>    31835059            -2.4%   31062527        aim9.time.minor_page_faults
>      736468            -2.9%     715310        aim9.time.voluntary_context_switches
>        0.28 ±  7%     +11.3%       0.31 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.stddev
>        0.28 ±  7%     +11.3%       0.31 ±  6%  sched_debug.cfs_rq:/.nr_queued.stddev
>      356683 ± 16%     +27.0%     453000 ±  9%  sched_debug.cpu.avg_idle.min
>       27620 ±  7%     +29.5%      35775        sched_debug.cpu.nr_switches.avg
>       84830 ± 14%     +16.3%      98648 ±  4%  sched_debug.cpu.nr_switches.max
>        4563 ± 26%     +46.2%       6671 ± 26%  sched_debug.cpu.nr_switches.min
>        0.03 ±  4%     -67.3%       0.01 ±141%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exec_release.exec_mm_release.exec_mmap
>        0.03           +11.2%       0.03 ±  2%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.05 ± 28%     +61.3%       0.09 ± 21%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
>        0.10 ± 18%     +18.8%       0.12        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>        0.02 ±  3%     +18.3%       0.02 ±  2%  perf-sched.total_sch_delay.average.ms
>       28.80           -19.8%      23.10 ±  3%  perf-sched.total_wait_and_delay.average.ms
>       22332           +24.4%      27778        perf-sched.total_wait_and_delay.count.ms
>       28.78           -19.8%      23.07 ±  3%  perf-sched.total_wait_time.average.ms
>       17.39 ± 10%     -15.6%      14.67 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>       41.02 ±  4%     -54.6%      18.64 ±  6%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        4795 ±  2%    +122.5%      10668        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       17.35 ± 10%     -15.7%      14.63 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>        0.00 ±141%    +400.0%       0.00 ± 44%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>       40.99 ±  4%     -54.6%      18.61 ±  6%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.00 ±149%    +542.9%       0.03 ± 41%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
>   5.617e+08            -1.6%  5.529e+08        perf-stat.i.branch-instructions
>        5.76            +0.1        5.84        perf-stat.i.branch-miss-rate%
>        8562           +27.0%      10878        perf-stat.i.context-switches
>        1.87            +2.6%       1.92        perf-stat.i.cpi
>       78.02 ±  3%     +11.8%      87.23 ±  2%  perf-stat.i.cpu-migrations
>   2.792e+09            -1.6%  2.748e+09        perf-stat.i.instructions
>        0.55            -2.5%       0.54        perf-stat.i.ipc
>        4.42            -2.4%       4.31        perf-stat.i.metric.K/sec
>      106019            -2.4%     103509        perf-stat.i.minor-faults
>      106019            -2.4%     103509        perf-stat.i.page-faults
>        5.83            +0.1        5.91        perf-stat.overall.branch-miss-rate%
>        1.72            +2.3%       1.76        perf-stat.overall.cpi
>        0.58            -2.3%       0.57        perf-stat.overall.ipc
>   5.599e+08            -1.6%  5.511e+08        perf-stat.ps.branch-instructions
>        8534           +27.0%      10841        perf-stat.ps.context-switches
>       77.77 ±  3%     +11.8%      86.96 ±  2%  perf-stat.ps.cpu-migrations
>   2.783e+09            -1.6%  2.739e+09        perf-stat.ps.instructions
>      105666            -2.4%     103164        perf-stat.ps.minor-faults
>      105666            -2.4%     103164        perf-stat.ps.page-faults
>   8.386e+11            -1.6%  8.253e+11        perf-stat.total.instructions
>        7.79            -0.4        7.41 ±  2%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
>        7.75            -0.3        7.47        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        7.73            -0.3        7.46        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.68 ±  2%      -0.2        2.52 ±  2%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
>        2.68 ±  2%      -0.2        2.52 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.68 ±  2%      -0.2        2.52 ±  2%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.73 ±  2%      -0.2        2.57 ±  2%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.60            -0.1        2.46 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve.exec_test
>        2.61            -0.1        2.47 ±  3%  perf-profile.calltrace.cycles-pp.execve.exec_test
>        2.60            -0.1        2.46 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve.exec_test
>        2.60            -0.1        2.46 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve.exec_test
>        1.92 ±  3%      -0.1        1.79 ±  2%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
>        1.92 ±  3%      -0.1        1.80 ±  2%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
>        4.68            -0.1        4.57        perf-profile.calltrace.cycles-pp._Fork
>        1.88 ±  2%      -0.1        1.77 ±  2%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
>        2.76            -0.1        2.66 ±  2%  perf-profile.calltrace.cycles-pp.exec_test
>        3.24            -0.1        3.16        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.84 ±  4%      -0.1        0.77 ±  5%  perf-profile.calltrace.cycles-pp.wait4
>        0.88 ±  7%      +0.2        1.09 ±  3%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
>        0.88 ±  7%      +0.2        1.09 ±  3%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
>        0.88 ±  7%      +0.2        1.09 ±  3%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
>        0.46 ± 45%      +0.3        0.78 ±  5%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>        0.17 ±141%      +0.4        0.53 ±  4%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>        0.18 ±141%      +0.4        0.54 ±  2%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       66.08            +0.8       66.85        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>       66.08            +0.8       66.85        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>       66.02            +0.8       66.80        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       67.06            +0.9       68.00        perf-profile.calltrace.cycles-pp.common_startup_64
>       21.19            -0.9       20.30        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       21.15            -0.9       20.27        perf-profile.children.cycles-pp.do_syscall_64
>        7.92            -0.4        7.53 ±  2%  perf-profile.children.cycles-pp.execve
>        7.94            -0.4        7.56 ±  2%  perf-profile.children.cycles-pp.__x64_sys_execve
>        7.84            -0.4        7.46 ±  2%  perf-profile.children.cycles-pp.do_execveat_common
>        5.51            -0.3        5.25 ±  2%  perf-profile.children.cycles-pp.load_elf_binary
>        3.68            -0.2        3.49 ±  2%  perf-profile.children.cycles-pp.__mmput
>        2.81 ±  2%      -0.2        2.63        perf-profile.children.cycles-pp.__x64_sys_exit_group
>        2.80 ±  2%      -0.2        2.62 ±  2%  perf-profile.children.cycles-pp.do_exit
>        2.81 ±  2%      -0.2        2.62 ±  2%  perf-profile.children.cycles-pp.do_group_exit
>        2.93 ±  2%      -0.2        2.76 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
>        3.60            -0.2        3.44 ±  2%  perf-profile.children.cycles-pp.exit_mmap
>        5.66            -0.1        5.51        perf-profile.children.cycles-pp.__handle_mm_fault
>        1.94 ±  3%      -0.1        1.82 ±  2%  perf-profile.children.cycles-pp.exit_mm
>        2.64            -0.1        2.52 ±  3%  perf-profile.children.cycles-pp.vm_mmap_pgoff
>        2.55 ±  2%      -0.1        2.43 ±  3%  perf-profile.children.cycles-pp.do_mmap
>        2.19 ±  2%      -0.1        2.08 ±  3%  perf-profile.children.cycles-pp.__mmap_region
>        2.27            -0.1        2.16 ±  2%  perf-profile.children.cycles-pp.begin_new_exec
>        2.79            -0.1        2.69 ±  2%  perf-profile.children.cycles-pp.exec_test
>        0.83 ±  4%      -0.1        0.76 ±  6%  perf-profile.children.cycles-pp.__mmap_prepare
>        0.86 ±  4%      -0.1        0.78 ±  5%  perf-profile.children.cycles-pp.wait4
>        0.52 ±  5%      -0.1        0.45 ±  7%  perf-profile.children.cycles-pp.kernel_wait4
>        0.50 ±  5%      -0.1        0.43 ±  6%  perf-profile.children.cycles-pp.do_wait
>        0.88 ±  3%      -0.1        0.81 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
>        0.51 ±  2%      -0.1        0.46 ±  6%  perf-profile.children.cycles-pp.setup_arg_pages
>        0.39 ±  2%      -0.0        0.34 ±  8%  perf-profile.children.cycles-pp.unlink_anon_vmas
>        0.08 ± 10%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
>        0.37 ±  5%      -0.0        0.33 ±  3%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
>        0.21 ±  6%      -0.0        0.17 ±  5%  perf-profile.children.cycles-pp.user_path_at
>        0.21 ±  3%      -0.0        0.18 ± 10%  perf-profile.children.cycles-pp.__percpu_counter_sum
>        0.18 ±  7%      -0.0        0.15 ±  5%  perf-profile.children.cycles-pp.alloc_empty_file
>        0.33 ±  5%      -0.0        0.30        perf-profile.children.cycles-pp.relocate_vma_down
>        0.04 ± 45%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.__update_load_avg_se
>        0.14 ±  7%      +0.0        0.18 ± 10%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
>        0.19 ±  9%      +0.0        0.24 ±  7%  perf-profile.children.cycles-pp.prepare_task_switch
>        0.02 ±142%      +0.0        0.06 ± 23%  perf-profile.children.cycles-pp.select_task_rq
>        0.03 ±100%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.task_contending
>        0.45 ±  7%      +0.1        0.51 ±  3%  perf-profile.children.cycles-pp.__pick_next_task
>        0.14 ± 22%      +0.1        0.20 ± 10%  perf-profile.children.cycles-pp.kick_pool
>        0.36 ±  4%      +0.1        0.42 ±  4%  perf-profile.children.cycles-pp.dequeue_entities
>        0.36 ±  4%      +0.1        0.44 ±  5%  perf-profile.children.cycles-pp.dequeue_task_fair
>        0.15 ± 20%      +0.1        0.23 ± 10%  perf-profile.children.cycles-pp.__queue_work
>        0.49 ±  5%      +0.1        0.57 ±  7%  perf-profile.children.cycles-pp.schedule_idle
>        0.14 ± 22%      +0.1        0.23 ±  9%  perf-profile.children.cycles-pp.queue_work_on
>        0.36 ±  3%      +0.1        0.46 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>        0.47 ±  7%      +0.1        0.57 ±  7%  perf-profile.children.cycles-pp.timerqueue_del
>        0.30 ± 13%      +0.1        0.42 ±  7%  perf-profile.children.cycles-pp.ttwu_do_activate
>        0.23 ± 15%      +0.1        0.37 ±  4%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
>        0.18 ± 14%      +0.1        0.32 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
>        0.19 ± 13%      +0.1        0.34 ±  4%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>        0.61 ±  3%      +0.2        0.76 ±  5%  perf-profile.children.cycles-pp.schedule
>        1.60 ±  4%      +0.2        1.80 ±  2%  perf-profile.children.cycles-pp.ret_from_fork_asm
>        1.60 ±  4%      +0.2        1.80 ±  2%  perf-profile.children.cycles-pp.ret_from_fork
>        0.88 ±  7%      +0.2        1.09 ±  3%  perf-profile.children.cycles-pp.kthread
>        1.22 ±  3%      +0.2        1.45 ±  5%  perf-profile.children.cycles-pp.__schedule
>        0.54 ±  8%      +0.2        0.78 ±  5%  perf-profile.children.cycles-pp.worker_thread
>       66.08            +0.8       66.85        perf-profile.children.cycles-pp.start_secondary
>       67.06            +0.9       68.00        perf-profile.children.cycles-pp.common_startup_64
>       67.06            +0.9       68.00        perf-profile.children.cycles-pp.cpu_startup_entry
>       67.06            +0.9       68.00        perf-profile.children.cycles-pp.do_idle
>        0.08 ± 10%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
>        0.04 ± 45%      +0.0        0.08 ± 10%  perf-profile.self.cycles-pp.__update_load_avg_se
>        0.14 ± 10%      +0.1        0.23 ± 11%  perf-profile.self.cycles-pp.timerqueue_del
> 
> 
> 
> ***************************************************************************************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
> =========================================================================================
> compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/testcase:
>    gcc-12/performance/1BRD_48G/xfs/x86_64-rhel-9.4/600/debian-12-x86_64-20240206.cgz/lkp-icl-2sp2/sync_disk_rw/aim7
> 
> commit:
>    baffb12277 ("sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes")
>    f3de761c52 ("sched: Move task_mm_cid_work to mm work_struct")
> 
> baffb122772da116 f3de761c52148abfb1b4512914f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>      344180 ±  6%     -13.0%     299325 ±  9%  meminfo.Mapped
>        9594 ±123%    +191.8%      27995 ± 54%  numa-meminfo.node1.PageTables
>        2399 ±123%    +191.3%       6989 ± 54%  numa-vmstat.node1.nr_page_table_pages
>     1860734            -5.2%    1763194        vmstat.io.bo
>      831686            +1.3%     842493        vmstat.system.cs
>       50372            -5.5%      47609        aim7.jobs-per-min
>     1435644           +11.5%    1600707        aim7.time.involuntary_context_switches
>        7242            +1.2%       7332        aim7.time.percent_of_cpu_this_job_got
>        5159            +7.1%       5526        aim7.time.system_time
>    33195986            +6.9%   35497140        aim7.time.voluntary_context_switches
>       40987 ± 10%     -19.8%      32872 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       40987 ± 10%     -19.8%      32872 ±  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
>      605972 ±  2%     +14.5%     693922 ±  7%  sched_debug.cpu.avg_idle.max
>       30974 ±  8%     -20.9%      24498 ± 15%  sched_debug.cpu.avg_idle.min
>      118758 ±  5%     +22.0%     144899 ±  6%  sched_debug.cpu.avg_idle.stddev
>      856253            +1.5%     869009        perf-stat.i.context-switches
>        3.06            +2.3%       3.13        perf-stat.i.cpi
>      164824            +7.7%     177546        perf-stat.i.cpu-migrations
>        7.93            +2.5%       8.13        perf-stat.i.metric.K/sec
>        3.41            +1.8%       3.47        perf-stat.overall.cpi
>        1355            +5.8%       1434 ±  4%  perf-stat.overall.cycles-between-cache-misses
>        0.29            -1.8%       0.29        perf-stat.overall.ipc
>      845412            +1.6%     858925        perf-stat.ps.context-switches
>      162728            +7.8%     175475        perf-stat.ps.cpu-migrations
>   4.391e+12            +5.0%  4.609e+12        perf-stat.total.instructions
>      444798            +6.0%     471383 ±  5%  proc-vmstat.nr_active_anon
>       28190            -2.8%      27402        proc-vmstat.nr_dirty
>     1231373            +2.3%    1259666 ±  2%  proc-vmstat.nr_file_pages
>       63763            +0.9%      64355        proc-vmstat.nr_inactive_file
>       86758 ±  6%     -12.9%      75546 ±  8%  proc-vmstat.nr_mapped
>       10162 ±  2%      +7.2%      10895 ±  3%  proc-vmstat.nr_page_table_pages
>      265229           +10.4%     292795 ±  9%  proc-vmstat.nr_shmem
>      444798            +6.0%     471383 ±  5%  proc-vmstat.nr_zone_active_anon
>       63763            +0.9%      64355        proc-vmstat.nr_zone_inactive_file
>       28191            -2.8%      27400        proc-vmstat.nr_zone_write_pending
>       24349           +11.6%      27171 ±  8%  proc-vmstat.pgreuse
>        0.02 ±  3%     +11.3%       0.03 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
>        0.29 ± 17%     -30.7%       0.20 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.xfs_file_fsync.xfs_file_buffered_write.vfs_write
>        0.03 ± 10%     +33.5%       0.04 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
>        0.21 ± 32%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        0.16 ± 16%     +51.9%       0.24 ± 11%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.22 ± 19%     +44.1%       0.32 ± 25%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
>        0.30 ± 28%     -38.7%       0.18 ± 28%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>        0.11 ±  5%     +12.8%       0.12 ±  4%  perf-sched.sch_delay.avg.ms.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write
>        0.08 ±  4%     +15.8%       0.09 ±  4%  perf-sched.sch_delay.avg.ms.xlog_wait.xlog_force_lsn.xfs_log_force_seq.xfs_file_fsync
>        0.02 ±  3%     +13.7%       0.02 ±  4%  perf-sched.sch_delay.avg.ms.xlog_wait_on_iclog.xlog_cil_push_work.process_one_work.worker_thread
>        0.01 ±223%   +1289.5%       0.09 ±111%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.xlog_cil_ctx_alloc.xlog_cil_push_work.process_one_work
>        2.49 ± 40%     -43.4%       1.41 ± 50%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_file_fsync.xfs_file_buffered_write.vfs_write
>        0.76 ±  7%     +92.8%       1.46 ± 40%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
>        0.65 ± 41%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.40 ± 64%   +2968.7%      43.04 ± 13%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        0.63 ± 19%     +89.8%       1.19 ± 51%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
>       28.67 ±  3%     -11.2%      25.45 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.__flush_workqueue.xlog_cil_push_now.isra
>        0.80 ±  9%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
>        5.76 ±107%    +152.4%      14.53 ± 10%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        8441          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
>       18.67 ± 71%    +108.0%      38.83 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_trans_commit
>      116.17 ±105%   +1677.8%       2065 ±  5%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>      424.79 ±151%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
>       28.51 ±  3%     -11.2%      25.31 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.__flush_workqueue.xlog_cil_push_now.isra
>        0.38 ± 59%     -79.0%       0.08 ±107%  perf-sched.wait_time.avg.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_state_get_iclog_space
>        0.77 ±  9%     -56.5%       0.34 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
>        1.80 ±138%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        6.13 ± 93%    +133.2%      14.29 ± 10%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
>        1.00 ± 16%     -48.1%       0.52 ± 20%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
>        0.92 ± 16%     -62.0%       0.35 ± 14%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.xlog_cil_push_work
>        0.26 ±  2%     -59.8%       0.11        perf-sched.wait_time.avg.ms.xlog_wait_on_iclog.xlog_cil_push_work.process_one_work.worker_thread
>        0.24 ±223%   +2180.2%       5.56 ± 83%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.xlog_cil_ctx_alloc.xlog_cil_push_work.process_one_work
>        1.25 ± 77%     -79.8%       0.25 ±107%  perf-sched.wait_time.max.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_state_get_iclog_space
>        1.78 ± 51%    +958.6%      18.82 ±117%  perf-sched.wait_time.max.ms.__cond_resched.mempool_alloc_noprof.bio_alloc_bioset.iomap_writepage_map_blocks.iomap_writepage_map
>       58.48 ±  6%     -10.7%      52.22 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__flush_workqueue.xlog_cil_push_now.isra
>       10.87 ±192%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        8.63 ± 27%     -63.9%       3.12 ± 29%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.xlog_cil_push_work
> 
> 
> 
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
