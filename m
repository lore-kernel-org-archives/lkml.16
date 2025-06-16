Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012062.outbound.protection.outlook.com [52.103.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB81DE2D8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750040539; cv=fail; b=jZqZQLUlvYzCG6pGuSO8aaJmJa6yrGHbuJDfA6hZA2dDLkSeVit9RByVZ6xBAKoT2ccSiqtiK5vKREOjIiTJBS7Koi1BDBGCGvAJfAemctrwKEmH+tG+Vr64jNOePc2s4GdJZdO3GJFrXSJcqD0ZjvDmXNVrkXe3L2Ny7V95AmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750040539; c=relaxed/simple;
	bh=kwiuxPYMxLf2HcT1ImF1mPNnggU6Q8/z1XtFsZHQ53I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IbP2ZCXMelHpjyUEAiVBYASOOtfIyTWcmV5mULIRfHH3Ow8vvFagZVOeYlB7MWNUCuLDeSU1QyvXxQgPRC+DpGhOeeVWf8d8R5nfXgrEo7maMBRmy5OS6VjQ3Ykg3xPDLoE12BxiJ9wAYrRO1pKJnMEcGp7FhgFUSsk5t+OhRFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gWReKRan; arc=fail smtp.client-ip=52.103.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gWReKRan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIuxrJtwR4/Se66iRPdjiQMAQKX4rRiDrKDG681JcxoEUuHNBDl5uUSV3jsLIAMZtjY8fdnEe/BcOBv9fWhtJJhzKq7RYNHy1Y4IqBMN0KqzsR6KswrkVXcYyY8wQ/LXRq7QR4f7xHxMX70eJYXU6TkL2Etzupl2SZWVK0HWIWxIxaWemdMsm/grl8Yj6kx3bplqH+Q2r4DthHrJElYfhIzSlHatQDebA1vUwaIZgeznA9xZ6KDrf3mg/8DYGJASKIPJOhRpLA4NGXM0ucyR/kZi0zIbIHodsIBy/m4lH5rXEhvb6FxcYSq/eIpQfyxPVD9s1XWE1lAL3Lcg/I5DHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5ElhmOK1fbh5XQNIJvMVXhYTY2Ae2/MT1z9TlBQF0I=;
 b=awlJ0PsvFs7og/9aZOAS8dMXL9rGlL89rX72DkePlZU/YdVeva7f3ebYZ3wWA6YWexcZr36jFY5Ox7aBieVsMM1D9jCrw4vSdAupNKG8gqoCZL+ddVVLqrp8yY8lgYiETYKRqsp659HLOr5yd9SSyG696M7DUIhUt027wQf/gdMPpmcsEHP2kwS8S4UWG1syazHpzZyv3EqHRwSce8CpH57sptH3Mjtt8Nq/CoouZ2Rd8Xt6Az2r98AVYtSFNBEn8BmJjDHpvM2yAPTdortVemcd2oCn3dM44+4f4fbDouiiMrmn+qIGALnhwqIr9na0hflFbfrMuAtjVPJwhWLfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5ElhmOK1fbh5XQNIJvMVXhYTY2Ae2/MT1z9TlBQF0I=;
 b=gWReKRanPIMYxbWnEuDvI8cMwEGEu5hoLwnVsPWU1VHrKE34gypvkFLx+Md4EVyyPLbThb4nairHrh1NqZhW5N104EFwYez9z9xi7MglSOsER5+PJHtbDQPr3lr62J1CcwojzPV+yDDY+GmtNs/mO0JwGlTP1kWV0T4YMA2Ykf9iwag+Wqo5Sy90HqvsUWbjK6TlwuqPfM581kAJIaVYhFVfhJgjjhTava9AIU/90ys2TJ0SZcKR1Y1oYkq5p0LKFIDXUT1rkJa0GEC9Awe0V0iBezHSQBPH90NP16SAMGp1K2IkMpDFAX003wuwJXfN9rH4BNLaoFNKdctvwLAkOg==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by TYSPR04MB8158.apcprd04.prod.outlook.com (2603:1096:405:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 02:22:12 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 02:22:12 +0000
Message-ID:
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Mon, 16 Jun 2025 10:22:04 +0800
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
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To SI2PR04MB4931.apcprd04.prod.outlook.com
 (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <68be6126-b88c-4f92-a657-7fe837fd25b6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|TYSPR04MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcccc74-bb7e-49f4-a5ff-08ddac7c97ec
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwXEkPgdKd+m+MrUL/sqDF1WRoaplOJ7pDWypl+f/eEpUZTsrumczXxav+8RhpQp8nYxLhwa5oitoXCRlgnFZKSa12fD1NJ9OFrVFZcoGddnH2enA4FbOsc56kfTWRJCHboateKR4ZtJOFPYrZx7rOxHYsYQ6rP9J26QPJNoI1wN8FeQNFwFR6EawUjW9BdlbHa07LsbXsBiDbKWHSHMT7jZRUGxa1YsnnlBf2urfX0MRpES7Pf/r/XjV1G3V782DkUsdIdhEpQHcf6wwA/8Sym7mA0hCq2MW1lnE+o0Bu491LS1ewRjmUKVMOCgWbkMgoXY1uYUxk5xYAUYJFuKDpAZJ2kqrCsNDPfqnoM4qXkiFIcRZY/yJTTvIt80FC2w1gEUD6EbBkckFKz0deiKQhUwe1I99WY4NlovI0FQUJ2+Pf2dUzqhhzTbG8VagHgorolzGz9d8qj3MhTm2lpuac0WoDiQMPjA3455EevvMaAQYTOBc+PnIl0XgxwTLUu8KtPcuTADrqVUEXBsWpd48BliKohe9+HGYSVKcs7Qchc2dUqr28u8JMac1fireEThn/Y26ZpaklPTbSU/n3DbbHHdhB+TK+bF5/5qVIx/KnqGYvR5sCjQ/qVYJIp3rZtQmlkzQNUSEj9ak9yXKIuF2u5Z0EDJXg7ohoFSMWcLPGxHGSpeV49PQ/3i55Mgd9khkfqs2x2drwI8GSSU6exFj1WLeMUWBNHS8myZ+PV3eaLGFbVuu+fZ8Y4VXtIOa44iqsg=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|12121999007|461199028|6090799003|8060799009|41001999006|15080799009|19110799006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek9USlE5YVU2VjlRSlVzUjc4KzJuVXRuZzI3SXljYkp3NjIyMWlFTzZBYTZY?=
 =?utf-8?B?U2JmbXNnM01WRzVxeHQrVTZkS05UTHlLQUI4WE5DdE85Y0dVNEZuMDVYSjlv?=
 =?utf-8?B?bE52V3ZhRUIrYlVxZGp3dm80UVptRHl0cHphekNpUVc5RWZQYU9qYytkdVpI?=
 =?utf-8?B?UStVMnNacnc1YUI0UHRwbkduZE5rUGRwbGx1RHEzNlpzRGp1bUZSSFphWGFK?=
 =?utf-8?B?Z0V5c3AwWm0xVmhRdjhkN1ZHZUNISkNWV0FnajVSNzBjOUs1dmZPdklJSk00?=
 =?utf-8?B?VXdMQXFCZE9WWUlxbHRNWlpxN1IzYjFXTzdnQUxEU3lBTW9lUHRpS1JOL2FE?=
 =?utf-8?B?N0Y3WTl3cVZFTnFtWmpGSXE0ZFhzT0cvQ0V0cWx4N2ZEcURLY1dheHkzeE5Z?=
 =?utf-8?B?and5ak1PRW5kS21aMHFiL0tSbithaXNwTjNkSFFNN2N6N2NZTlZkLzRDZHdH?=
 =?utf-8?B?aTkrQUcwbC9oamlETjJGMUszMnpwQUpTNzJyVm5WVk1jeUJESmNTelBjRU5x?=
 =?utf-8?B?NXBEbytUZkVlZktuR0ttWXlteHVpZUE3ZnJIZkgxTlF6N1Z3TVc3bjA4WVFL?=
 =?utf-8?B?UlJEQ3V4WVp5bDhiTktWYzQ4TW5aN2N5RnhaSituUlUyclNFbnphWDZCNi9O?=
 =?utf-8?B?eXdidHdEVEhNNTBzT1hodUdQOXlJdUV0eTZlTm5xYXBYbDZ3cm9oeDlmMVdx?=
 =?utf-8?B?eU9scU9ZSXdXZ091Sm1KU2pPTi9pa09QMjNsOTM4ZFJkU0E1dS9Bb2MycGJO?=
 =?utf-8?B?RUcwTDdhMGxEYjZpZlIvVDR0RHo4aTh5TDRlZkJ1VWFKVHI4TlVFMTFOck56?=
 =?utf-8?B?akkxTjExbDZZQTFjN1IyNnNxVDErQVZTSUtTWjNoWStia1NCTVZTdUs4cVc0?=
 =?utf-8?B?bTJ2NVJmNEswNDJpOVFEcWYxamRmazROa0MxVWZKaDh4eFZEUC9TZUJYcXNm?=
 =?utf-8?B?YlpvckdGbTZWelpQVEhXODFOcER5YzcvVjIrcmZiNXFFaDZTVWpnUGJXNlNw?=
 =?utf-8?B?SFhUMUdaUUcydFFjZml5L2dXUWlJMWlEaVdvamxKZUdlUk1SRjFvNXVFUGtX?=
 =?utf-8?B?ZGQvTUUrVHQ1ZDQySzZ1N2NLdFo4VkRFL1FrU1hSV0FyQnRkZ0xiQ1JUdHpn?=
 =?utf-8?B?dXlENHFNY0JsWjdLOEF1R3JYUGJkS1VvTllnRjJkMEpSS28xWEZpazNOWWNO?=
 =?utf-8?B?N1VIL1ZUR1E4a21KMWV0ZFBGU1R1MXlkb253WEJwdVhCNDlWV3FKd0xTYW1z?=
 =?utf-8?B?MlRyR1hGZFJsYm1oUXJIRHIzK0dUa211ZWdqWDlXQktzNTErd3pDcjBxUXA0?=
 =?utf-8?B?Z09lWGl1Y0VySU8zc3Q3SlQ3OW5Ca0pLakFqcENaN1lVdXByMjhXQjlDdEpr?=
 =?utf-8?B?ZUplKzNHTGNtZ0dmeWlwek14VnJSM1FjRnBvNVRXNzhNWlBadExvNnF4S3g0?=
 =?utf-8?B?M0QveUVGZitRaGVKYVp6eXpuejhCZzY1cWR0MzUyc0RzdEFTNnpoNlpvbjU3?=
 =?utf-8?B?Uy9pbktHM1BNbHNKYklXaDlQeloyOFdtU1NIeWhKL3RHbXNsanIwdWF5bjIz?=
 =?utf-8?B?MEd2WitSeTl1SU0rK1hIdkk3ckpuT1hMKzJVTXFUQkFKL2dBdzJsa0JKMngx?=
 =?utf-8?B?eUliZGwrWkVLRHRqcFBUcEc4K3pneGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG5rTTY1dnllOTdycFJYdEJjdUpKSEJKY1R4ZTVTdTNUZWRvRDdjQlkvOG04?=
 =?utf-8?B?UEFEWXYwdHFNWjdyM3N0TGNsaXBuVzNXYkFZWEUxbHdkV1lMdmt3Z1RUUkp5?=
 =?utf-8?B?VmluaXNzNHZmRVFjN1Byb2ZWSng5Q1JOYlFpMnRwdi84WUUwUzVZelMyVmhR?=
 =?utf-8?B?VXRXOU4yWFltRXEvcm0zak5Dbk9PSWVJNkZ6KzdiZm1wNUdnaDNWeHRVT1M0?=
 =?utf-8?B?VGIwa01kNW5hVHI4UFhydStGOEQ4ejlVNkJYU3JRTFB6MkI4MzhzOGxDR1Vm?=
 =?utf-8?B?OWZNNXkrYzdjTlIzOE1hMkdrUjg0cy9FcUZ4REdidG04RmZBMURZVVRTTGh2?=
 =?utf-8?B?UXZIT0hEd0JxMFNxTDQ5OTl6WlZidkIvWVlXTWhKblNwblo4M2FvWGc0Z2F1?=
 =?utf-8?B?TklzTEVQOHRqTEU3QjE5Tjlack1yQS9aSkZXR1pjNHpGV3NCTXoxbHo0bVRG?=
 =?utf-8?B?QWdwdVVkdVBnS1FnY205SUxmKzZRZyswOWZyZkZpYnpGU1VCRHc5cHV2aUVV?=
 =?utf-8?B?Rys0cTNnck9nUHBkcnp2cmNrMHRCZHU4Q2hSTENhMytZaXQwbCt0V3d6ZEF4?=
 =?utf-8?B?b2pOc3VEWnd4QTlXKy93Rmk0Q0tQMG1JUVlDWHlOYmNMYTNFK1J0dTRrbUFJ?=
 =?utf-8?B?dGpMZzU0dzVHK0J4R2l0QnFVZmpSdGpQcERzS3RJVUJoZWZuRGd0YmprZmRw?=
 =?utf-8?B?dmdOK3EvdWNYZVJaeGRlMWQ0SWxHQk1YTUtFa0ExOEc0NldzMkRVa0YzSWU3?=
 =?utf-8?B?WUhpSE1FeGJIWkRSQ29sckZFdTIxdExQbWs3YUV3ZXkzR3BCLzhCN1FuVldm?=
 =?utf-8?B?b2l4ZU1jT1JFdDNONytKUUFPTlBhNGt2a3BvMnZneEg5Z1I1SEp4WmV0UENR?=
 =?utf-8?B?ZUt1Nzg1WXZGY2ZBVENCcmFSalpTdEVvdk9zUk5pekc0ZklpSVp5cUh2eG1p?=
 =?utf-8?B?NG90clcxZzVtWWtmcWZzTmtkd2VsZnhrNWpNNjR0c1ovVitTS3RUQzJ5U0Zl?=
 =?utf-8?B?NUNPek45ank1SHNJVjBHSVZlcVNCM1FXU0c3SnRvTmJPV2daVjFBOENPeVRR?=
 =?utf-8?B?U3ZqRHF1RlZzRWtyS0hzYmRoZmJacmRPc3JQWkpYWElwSjdiV1IzY2hBRTBq?=
 =?utf-8?B?STlWZnlPejIrOEQrYXFieXlNbkdHNkdGNk9GSWpWUHBmNHVFeXplZVR6L1dn?=
 =?utf-8?B?NzF0dnNVZlNXa0J1aGRzZHJJMGJNdDdHK2hTQlA2MHJRZXdZSjFVMnovaUlY?=
 =?utf-8?B?ck1mVUJ4QWw4RVFUdHpSZlNlMkZYalB5Y2pzMTZYL1hPQ01oMXRXRUV2bjBB?=
 =?utf-8?B?Y1JWbm4vNUUrTGRpbDkydm5jdENqTHJaRCtTVzR0MUE1YWc2K1hObVJadlFq?=
 =?utf-8?B?OUkzQTJFMmt2NGxQZ29Pd092VHlPNE9FeHZzSGRIWTlLYndDaHJJMU1URThX?=
 =?utf-8?B?ZVFrWmJualRpM1BTbWRnbHg4Vnp0dUV2VTJDRjdYcHFXWUJCVkF2YStNZ05L?=
 =?utf-8?B?RWxUWlY2N3FSN0JSVm1zWXd4akxJZmpvREgzS1k5WnBiY3N5UDFtUG4zQjlU?=
 =?utf-8?B?WjFCaUFYcCtFaGNmcWNrUFhVN0xWTUlJa1N4SmptTmtYdkNTMkVGdThpZE93?=
 =?utf-8?B?YlJ0dHhUSVJUbmhUaGgvdUp3THBxTytXREpQdzRoNzZ6dTVpcTdxcDVVd3Rs?=
 =?utf-8?Q?WEJtZ4KT3ltAcMU3lcQI?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcccc74-bb7e-49f4-a5ff-08ddac7c97ec
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 02:22:12.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8158

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

Would you mind letting me know if you've had a chance to try it out, or 
if there's any update on the progress?

Thanks
Jianyong>
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


