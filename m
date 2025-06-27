Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012049.outbound.protection.outlook.com [52.103.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F854430
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750990402; cv=fail; b=FPmcfMIOd4cp6emgw9C001yOBfdJr8QLgB+kZuOY9KS46y201IGZdt8iEFZZ3KdcbyvkumzeD/y64NaXuDETZwbPy3gPVHggVShd+29Rb0BrnvhazwqK8Jqd6R/IJm82oFhPZgriYFTBeGAUzpdXedIbCImD2hCdelZpmRYuCZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750990402; c=relaxed/simple;
	bh=uI98ZVQ7U2p2z8NnsGsbQP+VNyrYLNLIatcbkBo37rY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jfPxoSJ0FY39JBcSf790BL5xIGBcZRJ8GzYTFigYvRRONkIfMzN6Cb1x137N3Ttg81uvc4T22/3IeR2f0gvASLu/mbStUGNVGv/8/Bmer8Bo+PYGQRYZj+UaRvSqIW1vKqaLVIlxMpYXuvUeWtgvImniuR4l1FidFRvfIS2Iufs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=S1I0yYO4; arc=fail smtp.client-ip=52.103.66.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="S1I0yYO4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW6dtYDip1g/eTCaWpIJ9rSzm3Oqyr3x0kt6z7z5SicpUJlQ+BCiD8SPzmWvt9sF4Wvrc9uoCvvfSojKltQjkoCt58LNAHtfaGp1jI2ht4DP+yrttVze1JeTDFw+9sK7rqHKbAXdHBcnfzJ3GvN9LUsw7M4DKClJXnuxt6gIBGE6yk1QPUAajqo9m1iirMNa9wscxCE991CP8VnT5UR2xbg44Zrfg2gcWUB4zaiEa4CI83J1UkRWtG6P+XWEpeH6L+1wz/UqV3NMD/N+pjV0ILmsuVfExW4QBa5Dug6uBHMXY2WuoEPCWzangZEBydy/mEDGpmolVnY+HIiai1XH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPt2GtVO43EtbXvgOWgluf/ADNQ7u5y6Gl5pUhvs9WY=;
 b=orsx7pu/OP5b3xUeWaczcnvNEJRWphfqWNWT7OcYtZPW8cHOsZKZSzc0rgtQr5iehl/3LqaKJ1qBA8qDdLavRCtv6BN/DeyN8VVBe4j4WZT/tiYjOSd06rIbSo4NerXkCG2G8GJUyCFLxg8MYU5r4htJugyA4N454ASNKCuoheQFjNX6NSiXG7UTMD2SIRfghWjloPHKDTLWx8TB/FQOpL+wdra1eByxWqe6JbEX2UcNptXOWJIWawU4ceeUI+Ut5Ln6wSsoYM8HOU/aHFbUXISakI8zNi+OmINz60LQvuJDfgMAwF1gSYe83spd87YTedPMh5BagM0RmcU5C4tYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPt2GtVO43EtbXvgOWgluf/ADNQ7u5y6Gl5pUhvs9WY=;
 b=S1I0yYO4eCy+TaoAFbEeMoN5gRrO4bVLvty0g90hcK6OGeg6rl5UDUOHwCtsxhGTBVWu+DCsjAsg2WNbkcXqGh9+FzvB984qkq6nj2kEmedy55sGgsJN83u9S/+er0En6pv2HNpmZhVAwYj49PVEr0PAlpFR0PSKDgUJYwD00NbX71UMHt3uMcV34uhA/cRPK5Xpf3DjeRgEqzEC0JA3wa9FN6S7TchrWk+Q0R0cgvKDpUabyKBZKnrDa3Azlojr+6u8MSLA0w8IjWqvVJNmg/PupCXmRsCOXZJPeD2/3gtrKyu35TovGnkofgJ64C+dpedQaXMV6JLi6ujXrpYJUA==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by TYSPR04MB7550.apcprd04.prod.outlook.com (2603:1096:405:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 02:13:09 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 02:13:09 +0000
Message-ID:
 <SI2PR04MB49319E2695AFFD2DE74B2740E345A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Fri, 27 Jun 2025 10:13:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
To: Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org, "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
 Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
 <SI2PR04MB4931D866229A4F148F26CD72E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <b3062fe0-da79-4f5f-8361-e2002dae9a35@intel.com>
 <75e763df63fdddc77fcb2a02bfc3b94eb22aadb2.camel@linux.intel.com>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <75e763df63fdddc77fcb2a02bfc3b94eb22aadb2.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) To
 SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <83ea3721-9983-4b0d-89b3-313be232f7f4@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|TYSPR04MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fad23b-b52d-4546-feb3-08ddb52027ed
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|41001999006|8060799009|5072599009|6090799003|15080799009|19110799006|56899033|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aENnYkV3ZkhiZU9VY1N0OENrdWNyYXpaaGJxZlJMTjhjSFJVZmRQc3lPd0dj?=
 =?utf-8?B?UFhMM0grSW5ndG4rWHQydmVGd05jRnNwdjlhR2hKbTFnZjFVaGtTRmY1VHE4?=
 =?utf-8?B?NFR1QmpkY3BNK3RNZEZqNGRtZmcvNnR4MW5QNHh6dnlGWjlzbjA1dStMVFJU?=
 =?utf-8?B?YStPbU80Z200U1lOWGhoSXFjN294amxZQVAwMENUbkphRUVJZWtKRXdHc280?=
 =?utf-8?B?bEZQSVZFUWFZb3lRY2NRb2lPQlVjL2xOTUZaNzROTW5YengzdGNlRjdaK2l2?=
 =?utf-8?B?UlNMUTBGSTJIdHc0V1k1L2tiNnZFbTVjNSthTUFFWFVHQWlxVXl0WEVQSnBl?=
 =?utf-8?B?OFE0clNjOGx5Q0M4cU51T0xaakpNRmVsNGlBaFA3WHdKUlc4dVN5UEdLNlRh?=
 =?utf-8?B?U1R5UGxMWnVNWFJYM3F3Wk1uSnZjU0VXOTJmdVgveForTUxFek5oSEVmMXkw?=
 =?utf-8?B?S3VlQUxhN1lIZXprVUtZcDlWNHBhUzMvbGRtemptVFRDMjFJU2pNOExqck41?=
 =?utf-8?B?S01XVDlzM1dwMlFOcjBhVHp5ME9lRHlYd3lxdXFKenpJQ3hKb2NqSHFZN20z?=
 =?utf-8?B?TFhjYk9UNWovdWVHTWlnVXF0MVRnaGFtNTZ5YXBKUVIwS2lMMXpQblMvd0Ew?=
 =?utf-8?B?eThtQkRpeVVwRGRGb05KUlFMVjFIbzBkaGpjaGh5K3BRbFBxWDY2OEVTd3Ju?=
 =?utf-8?B?NXhxZ2VhSHNjU1NNZ3FUelRwN0w2UmRLbCtwZm04SXRabS8xcjQrL3pNNjli?=
 =?utf-8?B?WWNJcWp5LzZBQWd3SDdxaGpINktnUDk4VTdpbHV0WnhuejFyZ2JpdlRkM0w0?=
 =?utf-8?B?U295SUxqQWtnczdTVTJJanhHRC9sNlRrdHdhSldOUzI5cmp2OVY0MEZlT1Rj?=
 =?utf-8?B?TVRqaThSRDJrNGxmaFR4aExRNVI1V1VpVXh3dldPTnBCL2VqUCtzYnNCN0V4?=
 =?utf-8?B?TWFrcGR4RXI4NFFaTkNaemRWWDc2N3RrVEYrK29MamRjY2Vkb1g0NlZJWGs3?=
 =?utf-8?B?STRheGdGcjh6Ry9hbmw1ZXFmSldadHdmcThvMUpCU2FzcFh2VFV0ZVVYR3Bl?=
 =?utf-8?B?Sk02OFBPZDhMVEFGQkl0cGg1MEovSFB2NjB4Q1d0dmNVYXU4L1lhS0VPeHFT?=
 =?utf-8?B?OHN4S20vc1dKZUJ4NFNSaHJDVnR1RXVZb1JsaDlZT1czS1l1TjMxUWxUMTky?=
 =?utf-8?B?eUwwNjBDTGJWOXFHNTE0Y2pIVzJ6Q1pXZXFPUlpSaEFSNU5mWUd6OGhoaGRC?=
 =?utf-8?B?TVZDUmEwM1lubXlzdnM0V0V5aFcydzBMUjU5VUg3ZUVoYlFYOUtZTTg2czdo?=
 =?utf-8?B?d1hEcjlrVTlIWEd4VEhhTGp6a2grZ0h6MFAreHVTdm00Vi9MQ2w5Ylo2S1pI?=
 =?utf-8?B?MUJXT3ZaandEbGcyZ2UrNWJPYlZ6bDFhWDhrcW1Qb0RyNzJKak1FT1B4dWFO?=
 =?utf-8?B?bHM4WjVDV3N6dXZsa0k5STBxSklnc0pKN0tpL1hTNGczQ1lJVWVDQ3ZPblBN?=
 =?utf-8?B?UmZGNEhOOGdib3EzaXJNUXc0Qm5oWHF6WC9nTi85VC9ka1Jsb09JdkJHTnpI?=
 =?utf-8?Q?ab5YzufjhK8vDxG80HgMG9slw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2dIMUVqTEdGZTBjNDlPMXhXNVhkZ3F5WSt6QnBpS3o4SngzOU1CU2tEZmUy?=
 =?utf-8?B?VFppRW9kb0h6eHVjRjFiVExVVkxDNWNOV09lcXVFZUVCTnlwamJUS2JVNERH?=
 =?utf-8?B?ck9uYzVVVTY4Q2U4MDVwSzIvdktTeCtYYTZqR1B2aG5ZUFQrYWpxSDEzdVRo?=
 =?utf-8?B?NVRFZmR1Y2MxRzEyUURuWHB3NXpYYlltdTRGT25CUmh3THQvR2JoU3VlcS9T?=
 =?utf-8?B?Ym0ydlc0TUg4bHd5NWhJemtVbXMwSUtuWjl0S1IvNlFCK1VmNU8zZldLL3Ri?=
 =?utf-8?B?N092N1UwMDl1MVh2ZHZJd3NvMEVqekorVTdYUEhrU29vY2xlYThzWVJmVzFL?=
 =?utf-8?B?L0hKUlNvVkZlNW9VYVg3WFZrdWdFcSsxdGdncDNIdFYvbytPZ21YSFZYQUN4?=
 =?utf-8?B?Z0FqT2hCREpqMUU4YVlEVHhOaHd3b1NEWUtEdWh1U1ZURDJHbkprMG9wRXV0?=
 =?utf-8?B?MlVBZnhuOHZ0VlJpMmVQZFhGNzh0WVJxWTdxZ0ZRUGNZZm9mbndGb084Tk1p?=
 =?utf-8?B?eHNqejVmRllnRVdkTmt6MElDdjBISU9JdnZmZHE5TjFnam9EbGI3Vmdzb3Jh?=
 =?utf-8?B?NzI0T0FJdEkxRHZrellkcWpsMFp5bzE2UzFYYmVWbm9aa05rQ3crdVZxRVph?=
 =?utf-8?B?TU81SVl3OVJ4WUlYOUZ0cWdSOUFXbENEcDVxVHJMNGpQNjNFNTdxMFZCOWpx?=
 =?utf-8?B?aGk0a0huYWsxeWZwYWFYb2tGZDl3bDEwbHlxWWhoaUxqcXJHUzZFc0JaWVlL?=
 =?utf-8?B?TEpialNqR3RoeHFCZkwzTG5IRWZxNkVEMVYxUVlVaXJSSHhuWUpqS01UNHJN?=
 =?utf-8?B?T1NRL3QwS0VZWEhvQkdhRU82M2tkZmRiSjhhOEc0Q1ROaUZESDBBTXlBZFBI?=
 =?utf-8?B?SGpINTNaa21OdUxHR2U2S2ozeGhydS8wTEtDNHBvUG9PQzBGOFI5OXB3dnRO?=
 =?utf-8?B?QSt3T2cxNVZUY3NXcHNGY0ZCS2VDckVSdjRMN2MyWS85S3B1KzlVd2c4UCtG?=
 =?utf-8?B?SDZTdEZjL2JIY2dVdTYvNzVhSnd2WDRYRGpIWUlOY0szR2hrbXBDRjVhTEhu?=
 =?utf-8?B?OVFHcVE0WmRteDY3RWNIdXU4bDhFZjdDcnhkU0tvVUF0STR1SE55Nkgzdjh1?=
 =?utf-8?B?dEhYb1NIUHJzT3NMYmx5UGRWYWk3b1A4a0oxbXNVOWp6aXQrZHNuVnF2LzF0?=
 =?utf-8?B?QWNGVUpQUk1oaXBCeVpnMm1jYnZDNkVGblhNU3U2M2Z1aU5ENUFBRzZtUGNC?=
 =?utf-8?B?SlhMbldQRVVQcUttejdGSDRSK25xMDNNcVA3NjI5cnNGVGx2WUJIL0dva2F4?=
 =?utf-8?B?ZHlkMFR3anRKeUNkanZCSHZNaTc2QXJEbGU4YWp6ZHg2c0prK2UwV2NESnI1?=
 =?utf-8?B?b0tlelVJMTdQUVJkcldSeGNsTnFLV3RyeFRTUnB1Y2QyeFZ2dGNhVi9KalVp?=
 =?utf-8?B?Ukt3VkROSWoxbGJ3V25TSGxsRDdWZW5ESytiZ2JzOUlwQThjR2NTSVpoRnF4?=
 =?utf-8?B?T2NHdjBSZnM0MUt1NmpEbTVWTTBSZ0FxbVE2U2wvc01oR0VUV0hvOUtlM1pj?=
 =?utf-8?B?Wm1oU3VpYVdGTjBiekpodkRTOVFHeWo2VHN2MTdiYjZTUXdJRmdpcER0VWxF?=
 =?utf-8?B?RzgwOWNRaE9ncXRBa1BJVUQwVXJUSDdRc3VSUXBGZHFyODFIc09LU2MxZ1dY?=
 =?utf-8?Q?eJKOi8OrdwCaq32PKEBn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fad23b-b52d-4546-feb3-08ddb52027ed
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 02:13:09.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7550

Hi Tim, Chen,

On 6/27/2025 8:10 AM, Tim Chen wrote:
> On Thu, 2025-06-26 at 21:32 +0800, Chen, Yu C wrote:
>>
>>>
>>> This task work may take a long time for the system with large number
>>> cpus which increacing the delay for process back to userspace. It may be
>>> the reason that schbench benchmark regressed so much.
>>>
>>
>> Thanks for the insight Jianyong, yes, the scan on all online CPUs would
>> be costly.
>>
>>> To avoid searching the whole system, what about just searching the
>>> preferred numa node provided by numa balancing if there is one. If not,
>>> then fallback to search the whole system or just search the numa node
>>> where the main process locates as there is a high probability it
>>> contains the preferred LLC. In other words, we can opt for a suboptimal
>>> LLC location to prioritize speed.
>>>
>>> WDYT?
>>>
>> This is a good idea. Previously, Tim had a version that dealt with a
>> similar scenario, which only scanned the CPUs within p's preferred node.
> 
> Yes, we were also thinking along the line of looking only at the preferred
> node.
> 
>>    However, it seems to cause bouncing of the mm->mm_sched_cpu because we
>> set a 2X threshold for switching the mm->mm_sched_cpu in patch 5. If the
>> old mm_sched_cpu is not in p's current preferred node, last_m_a_occ is
>> always 0, which makes the switching of mm->mm_sched_cpu always succeed
>> due to the condition if (m_a_occ > (2 * last_m_a_occ)).
>>
> There were some regressions on schbench during out tests and preferred
> LLC bounces switches a lot with preferred node as mentioned by
> Chen Yu.  For schbench, there's really not much NUMA data and preferred
> node bounces around. We'll have to figure out the right thing
> to do if preferred node changes and preferred LLC falls outside the
> preferred node.
> 
> Tim
> 
>> Anyway, since it
>> is a software issue, we can find a way to address it.
>>
>> Maybe we also following Abel's suggestion that only one thread of
>> the process is allowed to perform the statistic calculation, this
>> could minimal the negative impact to the whole process.
>>
> 
> 
Thanks for explanation. Get it.

Thanks
Jianyong

