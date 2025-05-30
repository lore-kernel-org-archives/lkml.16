Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012061.outbound.protection.outlook.com [52.103.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD620101D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590618; cv=fail; b=AjGA9FLDsxstYaBAUf6qqtsxatV4zxReeAS8cbpVo786EcuUne1gvjNcw3+WRNGOhxjrkDwEUZ6+zpsPGoxXyw6yJ3tgUIOA/kkxOwL41uogeLhjzMyQEZuNg+Y2zsFDfs3M3JoLbOO64fHzMnNspuwtQjc9k45p0XsVF6Futv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590618; c=relaxed/simple;
	bh=2oKE4SJ5ORo0AH8wkyrh33JU6DEMNaXUkufR1vxPu9Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d/9kDcIkEZtIsnzfHamNMfQrQ/a+/eCkvkeV0j3Zrth8aJtLQCwV8k9ATTYlrvhdfavIaDrPC4NKsnt+hol9CUJ2l0DDyzDQWDFaR/3Wv4QyUuyklS9hCIPoMr39lms80kskqMftFid1kRck9trPH4x7MLM5i6bwUQfPAwuS3t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MV0WdPme; arc=fail smtp.client-ip=52.103.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="MV0WdPme"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1QAcE7Ilh05h8SGbwqV/kwr2hUjyDwsdN5q9pHZaQqOgWpdN3d0u6r4Krj5uJe6T+hpb8FnTYp4+5ZDCrEatkaWXP/EAvb55QTYRuklp6CqUjeVIrdCN++Fp+j926RpSy5u/noKYMIz1YsLoLlAFT+sV7gvWIkEPcS2cjBbmSNjRElItkgd48tP5FvAIk+GJZad3YK1r7KJsXkRe1DfCU7MNASe5wUbVKZjYizDpNZ6x37j+LUaestqpih2VH8+aAnS2UwoqwQDcC5SJ+cMMZugMd24MhaukucbLHS9MFHLyYwJewmOIHL0+59qQTaR4qK6TvHjOM1nS8+jdVQ+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfM8Muy+UHfbnCkxzI9/aDEhycEGWw4J/wbdxv2Ki2A=;
 b=i0VUMpxhkOVYzBjw1s+OUvjyrGKDpXVg9Cj1ZFRLpR9+edj4U903d1BhFHrnSlMzhFwBOlpTEsFSv5wY2kJUNZEmL+UpOcMl87M0TLc4lWcglWRzZ7f/rxhR/nKgqHd8i1D9s+g7lcJ0PP6fevicj6r07RXOdGbCr3+DvWE7+GWMweBatrqhgRruaBzvjXlcu/hcRFpf3G+WaruuI4zv/0kZsWjwRz907DDoBwWODIXO/sCNRF+8EosCcs/zJY4xsYwsed1jh1AB/Nviz2oAhx9p9yQ9CpyNxB175bE7xtWqsl4CMvTg8VjtULabelFKhkOiiBsp2gT0pcTg7vj67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfM8Muy+UHfbnCkxzI9/aDEhycEGWw4J/wbdxv2Ki2A=;
 b=MV0WdPme5SeknYECkdv/1YWfiH+EZvtrZMMyk9Q7E/iq+ISQWVLmQau1jfVlbDqen3CifMUYzhHS9vxF1sh0npU6upQQCVGvARH7S7CTVNzdLKGvoX8RWWFn5EYqduVJutDyOrq3b2vr42RD1xjq8i34R+RM1Ub/d/zksFioW2CnPv7gjD8aT10AuXFab2MX/4BbPfuS/qULR4uQi6mZaVxQk6dACxdUIj6sMVFRsoyQ0dOGpPHvpq4I1b2R/Zahg5Z+U11hzazclnRvp5SfP2Hy3yZAwyWEJn0tFts0nHpYDERfT1n2zZFnBye4nDKdZXPsUUttCb+kyLZ0Z6hcaA==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by TYZPR04MB8019.apcprd04.prod.outlook.com (2603:1096:405:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 07:36:50 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 07:36:50 +0000
Message-ID:
 <SI2PR04MB49315B9161865FB1D319EEDAE361A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Fri, 30 May 2025 15:36:43 +0800
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
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MEWPR01CA0104.ausprd01.prod.outlook.com
 (2603:10c6:220:1ce::15) To SI2PR04MB4931.apcprd04.prod.outlook.com
 (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <98e0c7fb-1493-42d3-a113-0060407076b6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|TYZPR04MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c83946c-7a79-472e-c791-08dd9f4cbd47
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwVu6ov8hlKZu5ytU8AWxKlxQPOsTislm8pKksS2ps9ZevyaNhSsja1WbO8/QaxR/qCIAwTtKmCKMwnqLozXSM6mm3IcDQitlEe8NCVu+xmXX0lChwc0cg6p7148rGnw7sDu52abBAK1TURuouYJVva24hnmvk7unBKoXiUwvDCQFkiqjyWVEt2f6yOf5ch60mjykHvl36wUSQXp6I1bhjmni8omo9p11RSgNYTNBTZ7upU5Fre0so6bnaVgMKC34rUP1/mg+gcoKdKdq89Py9f9JRZ8KIDOmh4yAxej4fKdeBqPrRagWB2370C7ewWW9C9Gqj77BMlbZlyqJjFMQPM7mtRM+sc+xKY90D/2oi29HwzhCslcu9BCwdsGlkneclUPNQeLXgHt0gdduQMxOycNRiSutYLZsJrV+6TADH6jkS8rTtw+qjikOaFzHr8UsqQIz9yLHJdQsKtlAs7te9z5191B0reKH5rlbjVdgtYEwd3sK6Vk0XAqEp9XkQkSYFLgz9um9wlIu4bU3QZQPMQcTU11GAWrUivIYhzcK0gAKqp7MB+neXROAgicg645sZgqBu+U98kZvWwSrYlv41lY8l7HuPitR8o2CcYd7qFP0TJFFeKtbACBNXjakL+Se7hew7MQ6aa5fHskipHeuEbh5Us/uJkZpdVrwzcYvjAHN0AONhw6F/S9faEZHRnxCV4aRFJLMxq8uTo59s2471aFdMVAgcA6VOSnRFTfFKARv1IFF7CU8mdDAEqjZQK1MdA=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|12121999007|5072599009|41001999006|6090799003|19110799006|15080799009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWxlYTlTR09mUjFnQzFzRUZuNHRYa090dmNnSkp1VnRjdE9WVHBheHZuN2RV?=
 =?utf-8?B?ckVQWFg0V2hMUnVyNy96OUJFYXZjTStPTnpvaGRlN04vRTdkVC9xdGtpUita?=
 =?utf-8?B?RkVLa2lSZVdpME5sSTEvbjk2Wmo2WTh5ZGZvaFpaaUZybGxqaHZrMjR0K3FD?=
 =?utf-8?B?UmhGdUxYaW9pd1NVYTNyMTZRNGhKb09xQTBJaE9EeldDblhVOWE3TjRqbUtu?=
 =?utf-8?B?UHlRbFRLR2pPL2xaWnowaDUzRXl4QU9EUmJ0Z3dvVVlGTzM1WkNJMXUreFBy?=
 =?utf-8?B?Ty9JSU9uRnNIL1VNekloVjhJN1VuZUwwZE5ZVmQrMkhheDk5dnowMlFJSlJr?=
 =?utf-8?B?VUd3S1A0eTQyVWU3WGJDS2ZIcmhTVk9yU3AzdS9BaUE1dndkekdCN1Q5KytV?=
 =?utf-8?B?QlA2S3kvRzFQUzBJa3BIVVBKditJTXhQQ1JITDd0QzZ4dlZJcksxeUNjWDFK?=
 =?utf-8?B?UmRISWZWOWU1UHY1RjQ0WC9xOFcrS1dMSit6RS9iQmVMOEdzRTBpWWJRc2tY?=
 =?utf-8?B?cUk5RXo0ZVpBeEQ1WjBFaVo5TjVUemRuTDhGZ1ZvZExaWVd5M2RFTklSTzNr?=
 =?utf-8?B?cWV5UlZHZUJLRlMydnl0WHBLc0hsaE1nL2NTVkZWQlBuSWhmREcxZzdTU0hO?=
 =?utf-8?B?bkFueUtnU3dRNUVwdXlNSU1MT2dHVUhVS0pwK1pZR3JScFFGNThNWElSbE44?=
 =?utf-8?B?US90R1U2OHo0V2hjQ3pNTm1xaC9Oa3JBVXVhRTh5enpJK1NCVkpJdGdBdDVi?=
 =?utf-8?B?MVl3RjVXYXAvcGdWOUNxUjFzYUNBVmtDNUdtYklGMHVGSUxPRDJWdnJtZEhk?=
 =?utf-8?B?TWRRZlJiYU1idXgzRnJad0FZQWZMblg2cCtCVGJKTnVjTHl0dlpQR3RFdURh?=
 =?utf-8?B?M0ltUVNqUWlpTXN5QjFseHRSMjFBMkNRa3hmaDJEbUgwNUgwbEFWc1J4RVNT?=
 =?utf-8?B?NnE2OUcwb2tTeEZaNWJuYWhHUStlYStYMnNaT2ZWOG5TbE92V2hZeXV0MWZz?=
 =?utf-8?B?a0dZRnh3TStLRFdra3EySnF5ZzlHbTRzaEZiUXZheldDYTZ1TC84VW1Nc29k?=
 =?utf-8?B?QVVkQXkzMkFCOEtyQlVGUk9sSmltTE52YnpwOVVPeStCTmNlQUd5amJPNVo2?=
 =?utf-8?B?R3VwWmpJay8xMEtoYWNEejhWMlpJeUYvUlJGTVBvSEM2dWFkTmgxOEpjR3NN?=
 =?utf-8?B?Mmc0blVqUlk4M3hzeEhhZW5Qd09LUzdTRUhQdnltZGtPTnJwcTdnMmlUc3Jv?=
 =?utf-8?B?M2MzNSt4TlRWdjZoQXF2S3FycFBlTDJXOTVYUlYvNERQeGdtSEU5VkRXcmor?=
 =?utf-8?B?cml2S01VbkZRS04wUGVJclpjTnFQOHcxM0RXSUp1ZWNJQU1QbXJBWDcrK3pl?=
 =?utf-8?B?ekhQY2JRWmg3d291SnJLbk1hVHN6cUd1cm1rNjZBSjRGRkpHTng2R0c4NEZ0?=
 =?utf-8?B?RmhsSU5JUXFtLzlKNHFiUytiWEMwQXYzQkpwQXlueEtjbythRWhRMDY3QWVP?=
 =?utf-8?B?TFVObkxMV0h2N3lrSjdSaWZKMklmNXNsWEphYW1idTBNM3huZEIrVHpHaUdU?=
 =?utf-8?Q?FW/yAsjIQ2knHe2ftnJOQxQrA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGJLb0lBWFBCRWdsUWIwcDF5TGFVeWppamFORGdMME96bEJVUklsVWcwTGUx?=
 =?utf-8?B?SmdHWWY1V004RUVPZU9PcnVpWnRjeFhhMnVrQ3dqd0JtUUxWMnBKRk5WV3hr?=
 =?utf-8?B?SFJzeFhPWjV1M0NBM29naHIxNHZ1YUg1N2diQ04zc2VLNHhkdzZTMXVadXJE?=
 =?utf-8?B?NlZ0UTM1TkZHakJEUzVRWmM0VjIvNThMZ2xWZ09iYWlFQ05HVDRIeHFLUXBq?=
 =?utf-8?B?eXNHU0FqS3p5SllSNkwxN0gyTTFaTElzYkRKNlpvUk9BVzY0RXE5Sm5RUXI4?=
 =?utf-8?B?M2p2bG5NTG9kWWhJbzNjM2ltUEFVNGZSbnZOb1RHeHB3dlV3RlJlWVVNWlV2?=
 =?utf-8?B?MmoxWHVVam5JRVBIZFNTTXpySHRLdmE2OVd4VzJMTE9MQjhkcHhVV0FQTmhW?=
 =?utf-8?B?S3YxbW4vajlmVnNlbDN2MzBud2ZLUUl2bVh4NUVpZzhRY0VLKzEzejVGS24v?=
 =?utf-8?B?aEdDbkhRL2JuQUxRaHpIbkprOXhyeEM2SVM2WU5kTXR1WWlRazVxZGlzU2Zi?=
 =?utf-8?B?aXdtWlFnclpTQVdnakw5eU01MjFiNDd1ZzBNVXVIRTk0enh4ekVZYlNYZ2My?=
 =?utf-8?B?NGloeG9GWGgzYk5YUWd0Um5hSTNLYkRWOVIwQU1hWXJialkzSDJxZFdienBQ?=
 =?utf-8?B?dTlNYmtoZ3REMjU3SmNBaEloVVlCbm1hWVNTb0ZZeElSNERsajd6MGdUK2lW?=
 =?utf-8?B?UWFDOGFJbHcyS01vbnFjZTlIaUd4Z2pBbG4zSlZORVZOYUxJU1doai9sUm56?=
 =?utf-8?B?Q2czU1RGTEF3cjhaZ3JYQlAzbzBaTFlvTkRCRGlvaE1WYSsveXJ6YTBYUkdG?=
 =?utf-8?B?R1V4QWJnem83U3h1S2QxcEFrOWs3UncrWC9abU1KN2xiY1lwS3ZudmNId2sr?=
 =?utf-8?B?UXQvcFp3MHdZTlppaTQ4YzI4ZU9JcFhoa3drOEZLM2tydk90R2tiWDNWbU55?=
 =?utf-8?B?bStPdVZSK2pkNzdYNytCa2JHYXpTWnU4SkZ6SUhXdzhUM2VqUllGazMwQnVK?=
 =?utf-8?B?N044Qmo3Q2d4Nk1FOGJKWm5EQWphMHROSVY2bXJncllrNzM2dks0SDBkWWFW?=
 =?utf-8?B?ejVpT3NUZDdzanpoeU51Q3pzMmpLcWpFd3FZWW4zVFZFSm1CQS9haExtdUUr?=
 =?utf-8?B?WklibFV6VzZjb1pPc3UvVFdaRVJXOGc4WHpIOUFDTGRMWkhiRVpmMmE3UGZ6?=
 =?utf-8?B?VGY0eWZBdEdSY0VtUzUxaDRNMXJxK25aMzZLZUsvRTlvU3IzTDd0dTdtVmta?=
 =?utf-8?B?Zk43NjlBL3h3S0NlQnBubnZXRzlXL1o4VC9DRDdIVzVIMlE2VXJhVXNWYk1O?=
 =?utf-8?B?VmxLZGJMZVdVQWdTWFIwcFlQbWR1ZFlkZDRtVDJtV2JqaGhkRWgzL3ducENp?=
 =?utf-8?B?dVJhZXc4cVR1ZUVYdkNqVTlCcWd0c3RLeVJaalMrVmR0QW0zL0VpR29NdE9l?=
 =?utf-8?B?NFJTMlcrZnRPS3NSSFR6YjEzK1dDaGJneUgvbHoxc1dZOFl5RVhsbjFNd0Nj?=
 =?utf-8?B?TXFGdmQ2RGYyN3Z4dlVJUVZNamtFb2V5S05RZWUyYmlSSmhLbElYODRudkF3?=
 =?utf-8?B?c2VKRFlTUmJKUnZnK0pmT3FPbSt1RmNCN1IzMkQzd0g1cnVmODBQMDNCbEJY?=
 =?utf-8?B?MmM3SS9jRlFienUxczhWVkYwbHlaQXJTT0hOOERaUWU2TXFSK2ZyaHVXY2N3?=
 =?utf-8?Q?LPCoD7smDQoW1u+/aE/a?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c83946c-7a79-472e-c791-08dd9f4cbd47
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 07:36:50.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8019

Hi Prateek,

On 5/30/2025 2:09 PM, K Prateek Nayak wrote:
> Hello Jianyong,
> 
> On 5/29/2025 4:02 PM, Jianyong Wu wrote:
>>
>> This will happen even when 2 task are located in a cpuset of 16 cpus 
>> that shares an LLC. I don't think that it's overloaded for this case.
> 
> But if they are located on 2 different CPUs, sched_balance_find_src_rq()
> should not return any CPU right? Probably just a timing thing with some
> system noise that causes the CPU running the server / client to be
> temporarily overloaded.
> 

I think it will.
Suppose this scenario. There are 2 LLCs each associated with 4 cpus, 
under a single NUMA node. Sometimes, one LLC has 4 tasks, each running 
on a separate cpu, while the other LLC has no task running. Should the 
load balancer take action to balance the workload? Absolutely yes.

The tricky point is that the balance action will fail during the first 
few attempts. In the meanwhile, sd->nr_balance_failed increments until 
it exceeds the threshold sd->cache_nice_tries + 2. At that point, active 
balancing is triggered. Eventually, the migration thread steps in to 
migrate the task. That's exactly what I've observed.

>>
>>   I've only seen
>>> this happen when a noise like kworker comes in. What exactly is
>>> causing these migrations in your case and is it actually that bad
>>> for iperf?
>>
>> I think it's the nohz idle balance that pulls these 2 iperf apart. But 
>> the root cause is that load balance doesn't permit even a slight 
>> imbalance among LLCs.
>>
>> Exactly. It's easy to reproduce in those multi-LLCs NUMA system like 
>> some AMD servers.
>>
>>>
>>>>
>>>> Our solution: Permit controlled load imbalance between LLCs on the same
>>>> NUMA node, prioritizing communication affinity over strict balance.
>>>>
>>>> Impact: In a virtual machine with one socket, multiple NUMA nodes (each
>>>> with 4 LLCs), unpatched systems suffered 3,000+ LLC migrations in 200
>>>> seconds as tasks cycled through all four LLCs. With the patch, 
>>>> migrations
>>>> stabilize at ≤10 instances, largely suppressing the NUMA-local LLC
>>>> thrashing.
>>>
>>> Is there any improvement in iperf numbers with these changes?
>>>
>> I observe a bit of improvement with this patch in my test.
> 
> I'll also give this series a spin on my end to see if it helps.
> 
Great! Let me know how it goes on your end.

>>
>>>>
>>>> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
>>>> ---
>>>>   kernel/sched/fair.c | 16 ++++++++++++++++
>>>>   1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>>> index 0fb9bf995a47..749210e6316b 100644
>>>> --- a/kernel/sched/fair.c
>>>> +++ b/kernel/sched/fair.c
>>>> @@ -11203,6 +11203,22 @@ static inline void 
>>>> calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>>>>           }
>>>>   #endif
>>>> +        /* Allow imbalance between LLCs within a single NUMA node */
>>>> +        if (env->sd->child && env->sd->child->flags & SD_SHARE_LLC 
>>>> && env->sd->parent
>>>> +                && env->sd->parent->flags & SD_NUMA) {
>>>
>>> This does not imply multiple LLC in package. SD_SHARE_LLC is
>>> SDF_SHARED_CHILD and will be set from SMT domain onwards. This condition
>>> will be true on Intel with SNC enabled despite not having multiple LLC
>>> and llc_nr will be number of cores there.
>>>
>>> Perhaps multiple LLCs can be detected using:
>>>
>>>      !((sd->child->flags ^ sd->flags) & SD_SHARE_LLC)
> 
> This should have been just
> 
>      (sd->child->flags ^ sd->flags) & SD_SHARE_LLC
> 
> to find the LLC boundary. Not sure why I prefixed that "!". You also
> have to ensure sd itself is not a NUMA domain which is possible with L3
> as NUMA option EPYC platforms and Intel with SNC.
>
Thanks again, I made a mistake too.

Thanks
Jianyong
>>
>> Great! Thanks!>
>>>> +            int child_weight = env->sd->child->span_weight;
>>>> +            int llc_nr = env->sd->span_weight / child_weight;
>>>> +            int imb_nr, min;
>>>> +
>>>> +            if (llc_nr > 1) {
>>>> +                /* Let the imbalance not be greater than half of 
>>>> child_weight */
>>>> +                min = child_weight >= 4 ? 2 : 1;
>>>> +                imb_nr = max_t(int, min, child_weight >> 2);
>>>
>>> Isn't this just max_t(int, child_weight >> 2, 1)?
>>
>> I expect that imb_nr can be 2 when child_weight is 4, as I observe 
>> that the cpu number of LLC starts from 4 in the multi-LLCs NUMA system.
>> However, this may cause the LLCs a bit overload. I'm not sure if it's 
>> a good idea.
> 
> My bad. I interpreted ">> 2" as "/ 2" here. Couple of brain stopped
> working moments.
> 


