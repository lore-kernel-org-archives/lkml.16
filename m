Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103B11CAA7D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425990; cv=fail; b=PjA39L+gZ87UfmEli8B+bMPpqcXFuypAkRsFQUgs0KLBy9pHHOd/Ap+gfVIAsu+AC3s1kyukpkekJa/eUXHhBHoc1kvxzMS6z+AuEbJlWOqkB4eUJggECQi5u8jQDY9Lvja+BPCh9QHuX+jsbRXrYkPjtQNX7J+7OfhAfsKVW0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425990; c=relaxed/simple;
	bh=jJVdMvnm8l4eygAxJQ1d8DEycjw0slcvc7u79KN0HOY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XiBtzTjqfuS/ELiCvfQqjV+ubG5jL/tZOtS5HnQpMFdTkV34m8C4xWULe0fBU88OW035Auz8lhmMfcE+yRu7iOCYH8LxJLnYc7kcosThaFCiSJ/E+tgpDVtkawwOebiwVYJBFtx+7gBAdVCn8GjoXCeaAGAK+AF8ViH3zohdX9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qUBDNDO0; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qUBDNDO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD4KNpTRMLBFHyj9tg4eOhK5FMf3tNF+QW61F5sem5EbmXm0eL5T2fcIUsL3KHZWpVzyL67hgAMfMD9Knijgw4U+bhLIG4MQaV3J3uaJRmmif0C37/vrOhJAVz4rqlFinlb1/F1SfBmc5ASwyFEN0S2EdnU8Y2RMk44QKAzq3uvt7UlrMXS/xwi7xQStvwg8jOOJv6ktyqFMUmqVmWVZArZhAsMJqqKqYJkHhE33U9O0A4i7IG7D3NQyFGX/HYb74tZhfOLOdB3zxC4zHfLRbAjctQEQsNn2UhMQnd9ffL4XHAXwMOQ7dDA3kkCAB7ewXfO3O5IFiZVgJHBQhTL3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmfpMpOS8ls72nUCAagt+UNGpniJPPQjJtPrIVylnRU=;
 b=nChWwjSUIKuDUChMCwO3JiWNfjO65K7WtARz7CcU5MHfgPhb3pUT+48QOEuAlUuqWtlMDySz0wAf+Wnz//1C4lThuVo4rGHN6xdG6IoUv/1rr9Hbjz3A//B2WyBOcxDF2ZewBUjGHuC83UJAHt/moIM7fZjTe36KZrM1TKoZaaHmyk2coDnZiNGVqTU0EghnoQCvuhIn0qmLrcbBHh9KCRVL+XV2TQHFG+1231TL/yhLCj9zi6Bvu8t0D37fpCCNA20Uas7c/s86gVdlCJF6/M2I7LXX0OducHBETY1971KTzEsMdjitjTnVD6g2zuSfjpxdPLIpteeX+PWDUI0R2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmfpMpOS8ls72nUCAagt+UNGpniJPPQjJtPrIVylnRU=;
 b=qUBDNDO04Kk9TxLWzSK4X+K55pFGpK15cCrodQzmgnWp3Snx4v6pu/vETdqA5vyyMF1MFkESphdvjQaBh7S1uqltQlmkCzAfaoyuKnrDGvUkDqP40gtohSYAFl00wlncN62Bmbv8X3cjUuYjq55SlNF9oSwNmdO0KKteb9JUKAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DM4PR12MB6135.namprd12.prod.outlook.com (2603:10b6:8:ac::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Wed, 2 Jul 2025 03:13:07 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 03:13:06 +0000
Message-ID: <1b0a41ce-5fcc-4ea8-83ca-a2bd5ef765c9@amd.com>
Date: Wed, 2 Jul 2025 08:42:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: Zihuan Zhang <zhangzihuan@kylinos.cn>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kuyo.chang@mediatek.com, juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
 <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
 <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF0000017D.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::48) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DM4PR12MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: b71c5277-6e76-43a1-7b45-08ddb9165d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEUxWDQzTXlkMXVvY1FnL2NVVm5sd0dNOHdQZmJXY2hJK2M5MllLUy9pWTVI?=
 =?utf-8?B?dFBSZGp3RWhRK24rWGZxa1lwOHBKWEZPWjdaaFNEZmhlQ2kyRkkyb2JVOXV2?=
 =?utf-8?B?TTd5SHVaOUNXS0dPTDVaaXh0OW8yVjNKNS9IS0Zna0lBRENyd2Zabi94bFB0?=
 =?utf-8?B?SURpUDJodzk0TFp2aWlOTlF3dUtoYU5LSXpMeUtucU1VRTZaMVd5UlFKaXpw?=
 =?utf-8?B?RTdtQXhwREkveEx6TlJ5Rlp4RFJQNDh3bVNMSEFENGcwZHZDeUF2WGxEb3ly?=
 =?utf-8?B?dGxvdkc3SXBmNDVOa21RcGRjTHVFYnVNdjBNLyt2YjlJbGt0eXI2M2R1Q1Bv?=
 =?utf-8?B?NlRDcm1MU2ZoUHcyNTZxa3J5Z2hmb1c2YWJyajlzVHNBdWpiSmFoZEVZUzBI?=
 =?utf-8?B?eFBHN3J4cGs1UmkyYzZOZGdSRjJybXFlekF0WUZhb2dubnBmSjJOVzh6ajBG?=
 =?utf-8?B?cjY3THhGanE3TWsvbUJwTkRxMEs5eTluS3Z6SDJGb0ZKWFhvaHZxaW9ZTkJ5?=
 =?utf-8?B?cVQxNktscDRESGVDTC9uNFdzVGFxajFKdXI3OGlHeDlYdGtLME9QNG5tdUdJ?=
 =?utf-8?B?SG5vaktjT2x4WmR3OTd2enZRMWhjVjEvWVVxZkpCdUQzQzFmT2dvYWFVZGVL?=
 =?utf-8?B?SDhqVmlNUVVVUmlzckl0WVpmWFc1RmVlemkxVUlMMUp1ZDQrY0MrUmpPcDZR?=
 =?utf-8?B?N0VmTFk4dGw3N2ZxRk5LeXZXekVvT21JV3h2QW43d250d1JLOXVPN1dobGph?=
 =?utf-8?B?SzcrRG5MSTBEcHVRVnhiTGJEMWlvZm02WkUrcTk4UllFaHc3MnNXalpxSmZD?=
 =?utf-8?B?WTJoaUlWR3ZnOHJUVllsYXNJdjlmcUdVQm0yV3hROWZwTFRxbnIwUStLK0Jz?=
 =?utf-8?B?MXlmaEkrQVpOa01jYjJPZG1vYTcvM01uVUNaSjB6ZnRhZ3JLVXNZL3lCNFRp?=
 =?utf-8?B?My9xbXA4dzA2K3oxNWZobURNODJhcTdObVNIWU1XNU1OdGt5a0dKTy80dkY5?=
 =?utf-8?B?TU9MQlBBSjU0eEUvMUFjYVZtN21VaTRJdS9ENFhucDJTenZJMjNhV25xbzVH?=
 =?utf-8?B?cSsrMGZCWWc2ZXJyY1Ryc0xNak5LbDVPbVFPRmFZV2NOeDRZcWtGbEd0T1Y4?=
 =?utf-8?B?QUx4eWcxUENaRjl4QkxJalZTZXd5R0R0WDBEcStEbFZhSDc0RHIwOG9uT0V4?=
 =?utf-8?B?TXlsaUJXNTFrMENLMWlOZVBQUjhhbm5rKzVoWFYxRGpyRXUzY3dNRzBJb3BS?=
 =?utf-8?B?dWNjVXFTa2paZzBMbkg3TmhPQ3pGWDFuSTQ4bnFMNGdUbkFidC9tdWV2YWJl?=
 =?utf-8?B?NjFreVlBODlwZjE3NEFpdURkSldCcTdhK21KUElJV0phbU1rUlNCeWVocEJW?=
 =?utf-8?B?L3YyeXdPSERxbEtNcGIvTjI4Z01jOGRoV2E5UnQ1dmsvbEgvL1J0Mk9LOWZj?=
 =?utf-8?B?ak43VC8yZldIcEwvd3ZmeVRRUEc1dWtTWlJ1SG5nczdiSGlUY1RMRUYraFhi?=
 =?utf-8?B?S1Fja1dEdTIxNUhvOWtHQVJvNUFQNVFaeisxZm9WOEpYUU44bzdKSVpOcStz?=
 =?utf-8?B?K2JTRDZLaGh6emh0VTdraTRWRVl5OFM5M3JSRFFEOXJhK21oY0R4YzFoSUVD?=
 =?utf-8?B?akxicUZ4bW9JNHhDeG1laHJVZk16YmowbG9qRGdVa3RZUGFybHRJTi9yOXBQ?=
 =?utf-8?B?a3R3WHJyMUZsWlJoS1U2UWNtY1Zub2J1Q3c0Yzk3ZzB1R0R6T1N6ZUpNYUxF?=
 =?utf-8?B?NW9DOGZLRWZISytsYnhiQWNLMisxTFlZZTRlRDlWWVB0ODhIMitlLzlnMlE3?=
 =?utf-8?B?aVh5RXNBMGYyK01XdGhNbi8xMDJmNktCZnl6YnhaU3FaWDRJdk5QckxjZDlu?=
 =?utf-8?B?eEthZG5uTklnWGhYT3M5aFJtNFFhWUY1OENqa010QVh0OUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdZNkROeUhXL0RQVTR5ZEh3cjlRNGNlNmt0RUlaSStYU040dGpYNXhFYnhh?=
 =?utf-8?B?cThKdXhnRW9zdUJnRVByWnR5YWh3Qmc3bERIY2czVE9nc21HUFIxSGhVcmtL?=
 =?utf-8?B?cUxJdFNSKzJER3d6QVdkcm9FSXRJamRic2FFNlQ3VTJRV0hYR2VoUCs4ZERK?=
 =?utf-8?B?cjE3L2U0eHJGS1JxTGF5WDFoR0pFRFdzMWVLRG1ZUWRSaHVNNHV5dHkvWGNr?=
 =?utf-8?B?YTUwSzQ3RnlacitvT29DSm8rUGlISmhzeUZFQXA5ZDFqVExnSHVpY3AxWnc1?=
 =?utf-8?B?VTdTL1M0bzdZKzdyZER6aGtza01sc3RuamxJbjh6eElITWNrV0ZFbmlxaTRl?=
 =?utf-8?B?eEdVcXpvMXR5aDNERURscVh3Z0I4NHpGR0FvdGVqV1o1RlU3TVQwOVpYWnBX?=
 =?utf-8?B?cjh4STMrejlUTTBNNjh5K05jWTJSY0ZGN2JDdXZWM3FrUzA0TkhVRFlua0hX?=
 =?utf-8?B?eDZ5S3A5VzA3dmVURTBDTUpreGxZYS8rd0E2emxxTFp0VitaVTEvWHFFUGpl?=
 =?utf-8?B?VVFkdVNWZE9Xb1lETHkzOGFkaENYSlE5bkNkeVRabERDRlpaUFBXemFpME9F?=
 =?utf-8?B?US9CZG9QbE9nU09PanM3TG9hRVVRWWdGdFlLOHE0b3loTTlhZWdjbTFOcjBu?=
 =?utf-8?B?N3FjMVNuaHJRZkpDTjhxODZTN2NOMTd4YVVtbWRlM0RORFR1eWN2VWxTaHZ6?=
 =?utf-8?B?V09qamFEMENEUDQxR3BiQWpYc0FTMEpNUlJJMUpYb1FXRnRwU3V5eERYSzFQ?=
 =?utf-8?B?cXZKWk1pOFJVTDB0dzlOa09pemFLY0pSazU5aFVoRTlURmZEQjVMaDM5ejZ5?=
 =?utf-8?B?QWk4MVlydkdIV0RVVmtDcG55Z3Y0Z1R2ZkZsUGM1MkZtV1pSUGNrb3I2dUNj?=
 =?utf-8?B?aDVLc3B6clBrcEFtVStHY1BuaWlYZWtNVHRmUEh4clJIUy9hemhSU1MrckNk?=
 =?utf-8?B?TkxPdmtxb0p4bi82SmJqNWRrUmU4RW82WkNkakdKalpqRHdHazNwaVdJN2dU?=
 =?utf-8?B?WnRCVTFwUUhxc3dZN1R6WUV2djlRSVF4cENMd1hzWTZaZDBHVC9xQ2dxeDJL?=
 =?utf-8?B?VHFpOEc5cWhkU0ZLMjJFeHh4NUNUQ0FEK0JsR1p0RjJXZDJtdmN5NVVDbDlG?=
 =?utf-8?B?aFVKdy9YazlWOHVnZTQzWUQ5QVZFQzg3Y0JZb3AxNDB1anp3dkdwK096MG5Z?=
 =?utf-8?B?d1dFTGI5OWZjQ3VKRFVFcGxzclhwTkFrRkFKQ09PUjVKSXFNUnpyRVZFZkh1?=
 =?utf-8?B?SlU1QTZMVzBha015VjNYb2tlMXdXN1VTOFBtdkE4TUdBM1VMZWtZSWs4a2ph?=
 =?utf-8?B?NnpuUjB6SjBrQWRzLzI2V1ZsWFJwVDQ4SkE2blRlUG11QTF6MlRtdm8zNDdC?=
 =?utf-8?B?RFRNZmtocUF2aVEyK04rTkZuZ0g2bGM5SE9TYmtiRGVubDhPUFlKUWxWeDRt?=
 =?utf-8?B?b0hhZGVWbXpCeDkrZHoySEQzRlVpNzIvc3ZLUFIxdDlpQTZDMXZjeU1ybEIw?=
 =?utf-8?B?TDdyWTdiOU5DYkdYZE9GYmk1cWc1NVJINUppTWFzQk40QVducjNZek84b3Bs?=
 =?utf-8?B?YklRVUtqb2lUbXdFWUZqTEs1Z3c2V2NJTVNOVVhxdDRETkg2SWl0alV2bjZr?=
 =?utf-8?B?bU5VM3k4THJWK01Tbk14S29PMC9SVVJjRDdYSHhrcmx1TjhRQWVkMkFUc1Iy?=
 =?utf-8?B?WG5MSFBHeit6SXAvVkJqZXY2VFV6N2xZRThzamhmU0RsYVZ0S0JiaFVZMUFh?=
 =?utf-8?B?VWJOOGpMdWYxWjJaZnkxajZLeHdGR2dkNUw4NzNHUTk1cE1WcXNuekhwVldB?=
 =?utf-8?B?cXJndURlOXVZT2NBa1JBT2lGaTJOc3BLM0tFRTRleFZ4OXBDZW0rWHpvVnhO?=
 =?utf-8?B?c0EzY2ZVOFVVVXYvbi9PM2NOWkxSbXJGaUNvRnJiVnpaR0c2TlhLTS9taHlo?=
 =?utf-8?B?Q1cxc1QxU3R3WEFZMmpVYzZ2Y2xobEY3VWVoenE1RWE5MXc1eDJzQVV0VUpu?=
 =?utf-8?B?ays3cjEweGxuNG5EVnJUUnNMUXlnUW15dGpmREZoZm1YNm9NaW9ZWGFMN1Nt?=
 =?utf-8?B?QTJEN0tGZ0RXNyswM24rT2pNK1Q2ZDNReFEwOTlXRFFwMnh6TmlzaE1KdUo0?=
 =?utf-8?Q?3/p4FPNKrQzj0F0UuPe/QCES7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71c5277-6e76-43a1-7b45-08ddb9165d11
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 03:13:06.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmD41MTA4cPoMUDKZ4hEmgDuSTi0EAcVDz4depoBJ70axUEF4EZhLHy0b5M92otvSlsilE82InbDpSRjnvA7JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6135

Hello Zihuan,

On 7/2/2025 6:23 AM, Zihuan Zhang wrote:
> As a follow-up question: would it make sense to defensively guard uclamp_rq_dec() with something like:
> if (!task_on_rq_queued(p))
> return;

uclamp_rq_dec() is only called from dequeue_task() and that
should only be called when task_on_rq_queued().

> I understand this is not required with the current call structure, but I wonder whether such a check would be reasonable to prevent accidental double-dec in case of future changes or obscure paths.
> Or would this be considered unnecessary runtime overhead and better caught by path analysis?

On a closer look at uclamp_rq_dec_id(), I think "uc_se->active"
will guard against a double accounting. But that is not a good
reason to sprinkle redundant calls.

-- 
Thanks and Regards,
Prateek

