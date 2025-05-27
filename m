Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627D2DCC0C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355392; cv=fail; b=C2KJVoWbZA8VEsSMEuANj1s9Hc7dTsSW2evs3+RyPrxpswWavYHwZk+L0cucicHhGey1ll+fLU5u5NbJn+wttuqvVbjjFoy9QVdkbPFesxEYmRtIavsZeE6eiU5o/wKmbXb2i3Q361rbbfgv3LkqKI71Di4yowOc0d+cuH/LJ+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355392; c=relaxed/simple;
	bh=az/q7PVweb3Jgp+PuLiyOoFdmihW5AOnMzE/EaHyRXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dVv9pyQqycy3S2ObZvVmUP9UW8+3kIXolkOTn/arhAtPi0o99NBVIUmnLiC4IjYzZ+1wuyiZenFntoTC/U4m4PsYQLvRf7TLJnR5xS07O3rC1o0xzZqayhLxYvUmv64FxlOgnCYEDxFJnqAAEatNfFaMA/eFoYQADVuj+wLHfdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OlShzInC; arc=fail smtp.client-ip=40.107.102.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OlShzInC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/d1JFYuWDd+JzpjpbFtAqyUnaSHerAmjZsHuUdm3UK4AMj5mNM/6HNP/rHt+9TEurM40NERKyCHb+tBQDYv8qxayP2xKre6A/cYHf21oAP9oPkxCofF85rhU/O+pGeP+ft1qXhNheHPNVhfVeJnRCq1IJMzlyLaTxDGVqtY0LM8Yzqvniow5maUiFNLbpN4tLGH7xXQM95xFhiuc58CQm1/ClDN+T8hg/W9XKpEdtsCFwpFr/Ey9ESm58giZYCF25DzfT4K2s+NgFZyxs2/cRnCTz5r6G6rKh9XICdZ/RvZ6aa3h2gJvQu6+hdP4g7Kr0xMjHeOknjOAcq9dWqhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZNQPvjb6nm/pMSHLzROcSVoHoormQMEN4kIFjMt500=;
 b=vgHcv+yP/X78NODdlIofgUF2WW+m9ObEVaeZPPvYWo2WNAsEdhqFeqBVqEOA0ogslTnF0Et0GaH6XkvAKObQ8RRx3jSF4ocXLbL1eAlhyosDQsLTc9tCU/GFEoRU0oK6D3D/oSmtMeinNkiMi/yH6AXtMpXks0p8IBdBJ3rvBrS5p+yaAgDlos1497sVT5YQZryqZt6Q1D07dVyw+XrPpjtziw+jJNJzOFlyh6LA0oAxaZ9Jy21ZyCnHvQ+znW7oliwh+PsGiICjUZsUnOJyuW2DhHOUIkNdM2A9AOzaEp41TF/u0Ifw2bRAIiTlJbZ6JhVgQoiV61XGup8k+SPQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZNQPvjb6nm/pMSHLzROcSVoHoormQMEN4kIFjMt500=;
 b=OlShzInCYtSA58nmdwFs6aLlWo/Dw0nMUqGviR31LiDsdoyN4u8Bm9v+kT2ZfzBRvwkgY+kLiDJMQNG2k36s/9dPHlx99zv6u9wQPlpUFtsw/lFxhN+UjNU5FEgE13ZsgGGuZ7fabm7bz2oRhpLM1o7baEyMjyLs9+wH50rETu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 14:16:28 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:16:27 +0000
Message-ID: <5f309bc0-8e43-40ab-a103-f22954422adb@amd.com>
Date: Tue, 27 May 2025 19:46:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
 <20250523145942.GL39944@noisy.programming.kicks-ass.net>
 <20250526113352.GA2993700@bytedance> <20250527065836.GA3373486@bytedance>
 <8501f4a8-8480-477e-8ab1-1d7796b978f1@amd.com>
 <20250527114245.GA3578119@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250527114245.GA3578119@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c9ab15-9437-4c9a-b010-08dd9d2911c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmRubHU5emUyRjl0S0JsSEcyVXMzWS9LeDZ3ZnVhR25sbHdNV0RNVGJoYjI0?=
 =?utf-8?B?Y3FPWE00YUVqakx2MVVjZjJtT0IwNG5RWWpQc0FsSlB6azlvZ3ZnYjZlbjNC?=
 =?utf-8?B?VDArNlNJVnYyVWo4V0lZY3dTM2lsR1drcmo4Z2xVNjRHd21rNUdNZC9BTFZi?=
 =?utf-8?B?eEYxcE84VGhUVFpWRXZ5WDhsTWpMdDVZYVRacnFiM2Q0cGxHSGgrMzNLN3R2?=
 =?utf-8?B?ZERVUHhYVU1jY2hjZTVpNlJvN25XenBhZlczVlM2UVhhejVyTGNiUXlOQ2I0?=
 =?utf-8?B?Z1k2cTJPOTd4d1NRaUZFczcvTjIvRThvQloyK2VxWThCLzBwZXNtZkFaQ2F4?=
 =?utf-8?B?a2YvSVJ3Vlc3SXV0d3p5Nnh3RXNvbjVHU29RdjF3c0xMQnNBaXc5Y1E5eVVo?=
 =?utf-8?B?RFB4Ymh3b2FrNmY5ZkdmYXowVVFOSFpsQzZZaDZ4Y0kwVHpDYXdoNUd3SnJn?=
 =?utf-8?B?VjZkSjJvbGc5VS9LZVJaZHBpYzMrSjFLbEJvOTRKY2dlZnNJSjFDSUpSdjVY?=
 =?utf-8?B?U3RlUGU4bUwvWGJvbWNMYkpndmdOUVJNUzdrOUxOMUdicVpWQThVdzRaZjVI?=
 =?utf-8?B?M1VISUN4YkEwSjlPNWtxVWVWNlpUNWJRbHBHWXJ5WUU3N0J6MFM3NTkzYzFk?=
 =?utf-8?B?V0xaOXl4c2EreHNVZ1pOQW5xa2JBaUdTa2Y3eGpZeW00UUVHME8wRk85bUNo?=
 =?utf-8?B?UUhFNUFRdTZXZ3R5MERpT1RCS1FYWFhOeFBNWDRjRWVBQkg2cmtYYkdCQkZn?=
 =?utf-8?B?NXBySVhXREo0N01pOGR6WGxzUFNoaDNmU1hlV2l2bUljcURaL2JrRCsyeEZB?=
 =?utf-8?B?OTZYRGRvbFBVMWFjbVlwUjRFa3RLVGxvOTRzWnlhUkNYOFpONHo4SWFSRURU?=
 =?utf-8?B?UHErRXl3TXg0bno1THByazRGbGFBYW9BUmpaMVJKVmdaUkZkcUZsQ0VYMWhV?=
 =?utf-8?B?SGdMTm4rdUpPNzU2bFNTNHQ4UkVwVkVKME54enZuaEU2MXFuK216ekR3SjBB?=
 =?utf-8?B?OWRIb1pEckRzakxnTTNuUnY4dmZYL3B1eFREOXNhVXhPaENCc1dleFhPZHRB?=
 =?utf-8?B?d1U5a1NEY2g0N3NlWmI3dHdLcGx0OENsbjZNM1FveU10KzZEUFd1M2lYOVZa?=
 =?utf-8?B?Wi9WVnlyK1orai9Wd294azZvdlhBSURwMVVjc1hvS1VRU3F1WlNIenBML252?=
 =?utf-8?B?UVdMdHZRaDJJSlNBTjRFTStQZ3hQMGpmMVdsbjdSNHVaM2wwNlFxMXRkRi9p?=
 =?utf-8?B?dHY2eTVrVWkxb0NuZytOT1NiUUs5Vy96NlFWaGNNNjBVNEVRTThRNE5OZU56?=
 =?utf-8?B?cHBEL29vYW5CTVY0aTF4bFBadFBmWEd3ZVhTUzB4NVhiaWNRckpsQ2MvUm1P?=
 =?utf-8?B?SDdGU1ZvdjV5K2w5NU9wWnVjTTBDSTErMnNmejBDQ0lpcXNCU0F5QjRGS1JV?=
 =?utf-8?B?ZCtHTnhVZ1R3YkRRbmZlVW5JT05ZY3IvNkovR0RNOGNGd0JvM1lHck5Fc2hh?=
 =?utf-8?B?NnI2a01DOUY5M3d3Y2t5b0lkanAydU9WWHhWMnpEK2tTSm9kSGU1QWtUTXla?=
 =?utf-8?B?TFV5bHJpSlRXdGs3cmF0WW41ZTk5VEJvZzkvTFFHclNLK1VJUDNCOTlrUmpN?=
 =?utf-8?B?a2p5REVmWVkzYm50RGxWUmVuTUZQZmFnWG1vRytMK29TZEFFSDVUYzJocWxu?=
 =?utf-8?B?RkUza0xsODdzb2lzZVRGZitTTDRpSUtrM3ZCWk94dDBkNnhFZ0RTY3AwcGw1?=
 =?utf-8?B?TEdrNzB2K09oOE5FSzdoVXBwRXBWOWlUOFg2TGFYUGdaN0JTWEF0R3FpNzVJ?=
 =?utf-8?B?Z2JWT2xXTEhCV0d1TEFTWkt0UkRSYXpHVU1OV2dQdzFVWTYxVkQ2VDVCVUpo?=
 =?utf-8?B?WWo0eFdSUUJOMHdqWXFHV3oxUXBjTXZpb0xGbi9BWVZ5dWptVlZyaWpqSW9B?=
 =?utf-8?Q?SaCQRyjOTv0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzJsWG1ZWWdveWJ2bVFVcFNEZDMranZ0a01rZDBRUGpkd2Z1ZHYrNmI3bmtE?=
 =?utf-8?B?MEtIdFF2STNpUmg2Si9rNXVlV1pheFFJZDUrREpsZW40RFJrQmNHQ3ZabGNw?=
 =?utf-8?B?MkZKRUhhOWN6N0NiN1BINXFsNStPR1BhdnhoMXNYTVF6Q2J2aUxWU0dmOXJj?=
 =?utf-8?B?MXNodVBXTWJ6bEJMS0dFWkx3czF6d29MV0cwVHduWkVXR0Jwak1BaXNPbGI4?=
 =?utf-8?B?MU44VGhMMmhxMGoveFhURmFXVG1wL2lUTk0wWGpvSzNISFRjNW4vQm9ZRXlM?=
 =?utf-8?B?SjNPU25BaE1MWEM4bjNRU1g0OWR1MTZKMHV4ZWU2TUlBdWtWd3VGd3E1d0pG?=
 =?utf-8?B?dGd5SGRqK3JDM3Q5bzBtMXBIYytNS2IycHhidWdIYmhhZjU3aDhTaUFldWJP?=
 =?utf-8?B?OXd4dHFMcHIwdFNFNlhKMUdHMTZJSDk0Nkhna1djN1BVWWJuZSszT2tNWVFt?=
 =?utf-8?B?UjcxKzNaU0VqZEF5WDlhTGsreHFJSFNQSU5hMGNsSUVjRFR2Z1BIUyt3a0Jh?=
 =?utf-8?B?RGszNkhDTVQ4akl6eGRaVjlkZ1dYM3lJLzRIMHRjS3JWclVISDJmbVhnM2lY?=
 =?utf-8?B?dDFqRFZCWURlci94RnErWERRODJ4NDFIRW10dVJaaDNuT25mTFNZYy9xZjdB?=
 =?utf-8?B?dzVaSis2cjM3U2tjVFoxMWRXVGs1eFduNloxZit5ZmRpQlBBd2l0WkhibzBV?=
 =?utf-8?B?QzQ3Y0lFTWhHZ1M0SWxUZXpyTk9WU3hoMFRPK1ArQUQ0bnZNM0ZZSCtCUEFy?=
 =?utf-8?B?SWwrcGhMVzJZeFdvMm9aZVlUWCticWEvdWJJTVRXZm5VUzUwSXpkeTNWUk9k?=
 =?utf-8?B?enBGTjZ3elYvbWNjclBvT0UvbHJ0Q0JpRUhMNXdFOVViRHhNeFNPOVJ4UW9M?=
 =?utf-8?B?YWdUVUgrcm9ncVJkOWJlTUI2Q2pybm5PNXFwblNjTmcxdUZPT3pvN0JKYXZ1?=
 =?utf-8?B?b0QxRGlwTUxwK0RHWlFWcEdDRzYvaWtXdVlSMHU4Z3JvWlFiMktGZFNWbjli?=
 =?utf-8?B?MjNiUHpSSmw5bDR1SEZtUytlTWk4Zk9HTlNHM25jN3l5czgvcGNlYjZxTW9x?=
 =?utf-8?B?N0dIZ3ZCbm1GeHh2Z3RJaDRpc1RRa25vbmpBay9yZFV5Sy9XT0syRVZmcUc2?=
 =?utf-8?B?RGIwWXl6eHI0cFAvQXhGZWtleTFjbXM3TURISkwwMkR2STVleHh2WmVONlZP?=
 =?utf-8?B?U1ArV2VnbWdLaXZWQnRXOWJEQTA1clUrNCs0WUZlMHJXa3ZyQmFjZmwrTnZU?=
 =?utf-8?B?bEFjb3V2NGo5NXFHemJLMkc0NFEyckNhS29ZTkVaR0FUM2p3MDg1UGRhY3U2?=
 =?utf-8?B?SWtNbTBYYm9mdWJNMDlJVVpNb2pGbzY1SXcvOVVEQkZrTjRVNzFDRW5vVldN?=
 =?utf-8?B?b2twTkRnOGYwbnNvSXlabnlqc2NZakhFTFhHVTFaVCtBblBKOFVQWDNveC9w?=
 =?utf-8?B?bzRMMzdIa0NXRytEcjhYSzdYVmV5Z3kxWkM1WVdaNUorQm1QNG9USC9BSnVK?=
 =?utf-8?B?Y0VSZHFmN2hrV3FyMXFUcENUNlo4UDMyN3Y0QlNiZEdHcE82cTVLTG9ySlNQ?=
 =?utf-8?B?V0taZXZ3dEFVQ2dGbnAreExGTnZuaUQ1ZE45TmR5a21XMUdSYkdoYkZZakZv?=
 =?utf-8?B?eTJzNUk3WGcxa2dKbjhQY3VvZ3pxRXMxS01vYmxabExqVlVCVTJkNElRQjlo?=
 =?utf-8?B?N1FwaDMyMXBUNkl6MVBUN1Z1eU5vS2hlMTRHMHA3cGRDbnlDZWhWWlpySUFr?=
 =?utf-8?B?b2NuV1VqcXJsTjdPZE1NbUxMTGpGWkZyVFdpbllXQU9lRjYwUDlnRlJaMEh3?=
 =?utf-8?B?a1Z5WE42YVhQYmdIdjBDTXVER3dMem5qOXFVcHFqMHJpdjJWdjBuZkkyejZ4?=
 =?utf-8?B?empoZjQwNUU2dUJFWTh1eEJid0dPdmlFakhWejNhZ0cwWlJlMUIvRVZmNFdj?=
 =?utf-8?B?Q0V1d1dBS2dxTFloai92ZDBLZVRqK0lqNDdqVWZxdUZtTFdGSmZhSGYwQlBD?=
 =?utf-8?B?eENIeXZHV3NFMmZRcEdtN1dTZC9YcmxNS1JZTXBtaWRDWFFXb1lNanBaTEJ1?=
 =?utf-8?B?RlRacmdWNGVYTEJrWXhTbkdCVXpGR2hBSCtMWGVCZ2JldEdMU01iUkNENm12?=
 =?utf-8?Q?4bXkQdgEJTTHCpT/YDR5fNVR/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c9ab15-9437-4c9a-b010-08dd9d2911c1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:16:27.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsS7NcNAIh0VqvkcVvZV6HxbjccZScbq0avnpCw65OfOa4FbyjyHRlH8Mu9pmvomVIwXJKN+tuvpdaAHh6C9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

On 5/27/2025 5:24 PM, Aaron Lu wrote:
> Hi Prateek,
> 
> On Tue, May 27, 2025 at 04:49:36PM +0530, K Prateek Nayak wrote:
> ... ...
>> Since we now have an official per-task throttle indicator, what are your
>> thoughts on reusing "p->se.group_node" for throttled_limbo_list?
>>
> 
> I'm not sure. I can easily get confused when I see se.group_node and
> thought it was something related with rq->cfs_tasks :) Maybe using a
> union could make it look better?
> 
> Anyway, if space is a concern then this is a good way to do it, thanks
> for the suggestion. I'll leave it to Peter to decide.

Ack! Was just trying something out. I don't think space is actually a
worry (yet!) looking at the amount of members behind
CONFIG_CFS_BANDWIDTH :)

Union is a good idea but if space is not a concern, it is great as is.

-- 
Thanks and Regards,
Prateek

> 
> Best wishes,
> Aaron

