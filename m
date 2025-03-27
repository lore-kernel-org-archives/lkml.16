Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022137.outbound.protection.outlook.com [40.107.193.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775532147F1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081949; cv=fail; b=QB47kAAQfbOVNdEgSksMAtJJ2IO0OXmjaMLyMVgFqeF3hRpHjwFaENUOCVhsZsVK5jwcwB4NeS5GxCorYINzPc47ysSdKCGUoOG9ZI43tNRiVwe015oyqQ+fBKF/GEugA1CQvVOpejV4o/Fd2na4DrSxFeBuZtezip9nybYjoZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081949; c=relaxed/simple;
	bh=F8mrG47Aru+bGFea+S3o1Sm4OIVn5gi/5t/B7bGJmxE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FPx+roZWMuKjrUX5/fHjVHk99/9K7Gr441hu22lhfiiIh1pzmqDyAVyjmuP9Q+uECrLUKiEfwKajsxRRFvr/Qal3ahBwBVo37XAE6RkbleA+Brdq5A6IFzBvLNA9mJGbjBmq3UjBWzMzy7gqurubPqQ0UpNOBhAY8R9AgMzh9o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=Px+3x9ro; arc=fail smtp.client-ip=40.107.193.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Px+3x9ro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ0Q2fh+aAlSAKbIWi+13GvQHzPNeyZkOPveEJtRkg6jcNfSvbNH5Dgxzu5hAVPm7BQAh2hSfSOElU4a8dfvmoh5bWgf9/Duyt+SHlF+EulWPEVemXiBkWjHTFO+NkZptMmF0rn1N1nCOB1Evl0ThTqEv9GhIKA5U1zKq5tJwf9W5M7nQQnD3IUBuGSHIyQM7h2P6yDSTpriaANzl7gMMBqn/obGQ0NSrbTtU6GgDo5LxrsO1WFdhuAVh2qXobAf4f7iNqXNk3hM0vVjOnBv2R5xUPIaLpYwmUz4dhP4cvodOU1vtMYsyRgFTgoWUS2yyDWo8OWNFdKUsr8DcIzMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPPeLiMlCgmicIqYaOThmWwogPTUglxpUOEglsc2wJQ=;
 b=kGW4OF8g4GP+DtIUlBfkb+F4SQKCsXqy83xC/fvJIpJq63+8sKVg8v/2aH//NR1lMt/KMlLNAc/2NS4xQpebVWGaQ8ESE9nWgdSEava6q393M8fl+sMFDFq+OAxpa29XqBAibaZ1MI0TmPkFuGAMKX8JL2qpVLt8H88KkctJ1KoP+csHSck+WncNP0XfvbRz3uhDSOG3C3tF41gZP1GzEZYN+3Qx8Nvf/6npY4IcrcW4PGwovPv/ix7ze09E2IdY0nOEEivw4tORWi9MzgPaSG3CX0Rq7Pga/lOoA7HQX9SPHJNNvbDvJj2YpNrPd8DpKNNiSj93hFvWHRu8/4qQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPPeLiMlCgmicIqYaOThmWwogPTUglxpUOEglsc2wJQ=;
 b=Px+3x9roys/E7Ov2RdwRk+z5o1OsWy7LpIHB1mWr0MODFtAxi949wlGAGGPGAB0Ded/YfgBrGkj7Sz/o999PBoyKFPF4ydIJHR2pyMgloBbxeirdP5eGSzfZymJt/Qtd4ubruV7KEdHI7s4vvcl05UB0QJDG+2xKEldM1KNQ0qxGEOCtPzArwbGPDyhLh1FPf5Tj39b0eXt4nTNySvQo1tdy3DLbdYQDgk1anGWsc98uDTJ3a0KOVfq+3A5tb3y47vGbRvGSYw0MBVcTU1VhcW8h1EVGNEWbXIK4ktoX+YIBGy1EWAUbZtT318+tSWoOYTRt1fq24Ujt7nZEiE/Vmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR01MB11264.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:25:41 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8534.044; Thu, 27 Mar 2025
 13:25:41 +0000
Message-ID: <d0eb3517-cc95-497a-9dc9-f29abf43cdce@efficios.com>
Date: Thu, 27 Mar 2025 09:25:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] rseq: Eliminate useless task_work on execve
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Michael Jeanson <mjeanson@efficios.com>
References: <20250327132041.1548426-1-mathieu.desnoyers@efficios.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250327132041.1548426-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::20) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR01MB11264:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ca5833-1b14-4dd1-8293-08dd6d32dea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnlwQlpwU2trZ2Y1dnZCbTl1aFg5emV2WDFkcjVhRXYvdy9JMkVCazFjNjJh?=
 =?utf-8?B?MXdCMGNPby8zN3dlWVhJQlR5VlZVRmxBU2pZb2VxQlFxeG1yRkk5OFJmYTdX?=
 =?utf-8?B?VHJYTVkxZzNDTDJvRlp0Y0JQUjhQN0J1QnlJZjViVUpLYWJZNFcwSEVPbHhi?=
 =?utf-8?B?N3JwY1Jjc2xISnJwRnpHME1lT1Z3ZVhDaWZ1VS9jZ1k4WFhrY1NaallVWjc5?=
 =?utf-8?B?L2Nha0M1VjRjQm4zZUxybXhmVkpZRkdRVGRCR1VhWi9qdTlCYk5UeHo2MXZz?=
 =?utf-8?B?YWtSeEJLSDhUNTBXNldtYm0zcDA3cmJWdXpFallzRGttaUZobmlhN0llWDhX?=
 =?utf-8?B?RHhNSjJneThydWdBZ1JKVkRCNVJQWmk5OTMwVmovVHRRL1l5VDRPYVVmei9F?=
 =?utf-8?B?ZGE2V2V3VEFnUnJPRlgxZkJZQUhSZ2Q2OER4VTVtSmhzc1ZMRE5yazdnV2ZI?=
 =?utf-8?B?RWFzdWdFU0RPandmbnpVVEhIeG1idXAyQ2ViTVNiaFpad0VnVzlPQm5iNWl4?=
 =?utf-8?B?V2FVQjZpZDBia3dsRmpqdHAraFdDaG5vcjVCMWIzb0RDL2tySHpQY1R4OGNL?=
 =?utf-8?B?di9CM3dvdkhrcENDczF3Q2FYUVhYTndpcjY1c3JyUmhZblU0RTh4ZkVBazEz?=
 =?utf-8?B?azZWMFN3dHJzM2U4b21TUFBRWTNxTVRIQjZudUJUYkJEcFV4bWwwclpkZGxI?=
 =?utf-8?B?b0VoYmFqdmphbjRRT1FHSUh3RUdQZmdGWGIzd3Yzd3Ezb2VaUjFzalJTUmU2?=
 =?utf-8?B?UDhQWkhtRHpDZHRUcGx1OW9jQkJwekxnNnVtVHNFRTRWZ2x0Q2t5dHljUStG?=
 =?utf-8?B?bXY1bVRqVnJTdXplRUxOQzIybDYxTnlBMEtMNXl2VjVaWGlIZlAzcG5NMzVt?=
 =?utf-8?B?Q2NjQm9FN3FCempDaXNsRG4wRXkvRWkvbTE1WFpyRnBiNUJGYmZxL2paNm5P?=
 =?utf-8?B?c0RiUWs2ZmlDd1d2cGpxZEx4d2Q2Z2s4MmQzdUNBMmN0ekVyeGc0eWk2REFh?=
 =?utf-8?B?aERYdmVxS2tET2RGUm1ib09ZVFRkU0h1bmx5cTlRaER3SW5QTGlIMVVxUjVV?=
 =?utf-8?B?cEd6UFFtSHVWbGtpMExpMzE2N3ZBUDhyRDhpV0RZdENxQzUrN0tQbzNreUgv?=
 =?utf-8?B?OUU5and0MC8ybWpSdS9yTk9QbW1pTEduMW1VbVFwWjNkT081OUJuNzkxektC?=
 =?utf-8?B?MEVtMjEycUNGQ1RJa0Z2dWNYSjBja0tQWVl6U0VKczM3ZTZ4ZHhEUU8rRlRE?=
 =?utf-8?B?cE55NU5oelJaamViSHBieGhMelpXWUhweFdpcnpzR3g0U3Z0eDFLQ0tFNHp6?=
 =?utf-8?B?VktJT2hKRHRvNndBS2U2UjU1eStBREd0akorcmptcHMzbVduUE1xeVp4dVdF?=
 =?utf-8?B?MDN5Y0c3SVVvLzJnVmhFOVhSbURYYlI5dUozbDEyMk5JZkt5SUptSnNNNmZl?=
 =?utf-8?B?N0F6ZGVCNGZTU1NzN2YvbHc2bWZTRWpsa3Z4dUFPV05qL3liSVc2eU93SEhZ?=
 =?utf-8?B?SzZDNXc4STR2clYvcC84OVJsaUdjRFRqdlBXQ05MdG9Bc3R1OC85dnV6U2Y4?=
 =?utf-8?B?dHBrMFIxencvbnkwOXd1MHJNZTdSUE54VXNkS1FxVHc1SkZEZjU3c1FzTDNH?=
 =?utf-8?B?bERLUkFURzVxK2c3aVN1VmlYWlptTVRyRmo4YnhqemFUZ25VTHhycyt2UkJY?=
 =?utf-8?B?RFJxcDk2em5PTnJxYnp3WVcrRXMwOFJRZ0pxRGZqNjUvaS9vUlBhMnRYTWY0?=
 =?utf-8?Q?qIjmueOb2yYObL14X//sj1ETiLkKKNlnX7FlgAY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUpDL2RjYUw0dDdVMEVSY0NsU0tuTW12dG9OdWs5bE5qekk1N3luUGJETkJr?=
 =?utf-8?B?SzcxMnQ4VVUrMGI4WXpDUzVXVklIVXYzR3lsTlMrSHlMVXVBM2g4RFJMNm10?=
 =?utf-8?B?OFFTcEE1c3BMejZ5S1MzMFZ4anl1SXpKNDFDZ3dJcGo4Q3ZVUXRtbnRRaXMy?=
 =?utf-8?B?RUw1bG9KRjJhUXZDdGpoTGxqS0RwazFlMVRkdGlnY1BBa09kNGxMOVZPcktD?=
 =?utf-8?B?UFpiTTNmOUI1UWV3cW83VXVZdzM1eDQ0OFp2aTlJcXZHN3VOdkkvT1N1aXY3?=
 =?utf-8?B?QjJhQ0RwMVFQSytlTGUzbnRSbXBTYTVOMHBsMW9UYW94dTF5RmRjREZsMnp1?=
 =?utf-8?B?YjIyeWdXZUJwL25UU00xZEg1c1llRGxvOGtZTTdFWUdSWXFEMFhpUE1BNGxW?=
 =?utf-8?B?aGwycURTMzdrSk96aTZ1YkhFTFl2YWdaU3ZvS1YzRlNTUFlweW1sS1FGQ2VU?=
 =?utf-8?B?TmZiL1J5bysvMGlVY3RuV1VuL0JHc1VjQmUwT0ViVHBidzUxeVptTmRleTVE?=
 =?utf-8?B?WExzTXFzWDF1VTA3TUdqbnh6anpFTGlheXB2UnhnQzB5VENRQ2dRTXdQSmdo?=
 =?utf-8?B?OEZzRWZHQnljcVNBaTdvS2o0ZmN3amswdk1UdUZUeHV6VkVIckRJOHk2Skpw?=
 =?utf-8?B?M0lPUHVpUVJoNllwOTU0MUZlbFRvVFdaRzhrK0dGamRIWTVobDRUNC9IU0RF?=
 =?utf-8?B?enYzbnB1bEJXUnI2SVBXb0NVY3BKOW1rbDNaNzJTM09rMXpoUHFTcnBxSkRa?=
 =?utf-8?B?K3Rad2U0TDQwcjN5dS85ZFFmc3ZUemF4OGJHUEEzMCtaQVJnQkNWcm0rUEJ5?=
 =?utf-8?B?S0V0VUg2MDhwRHpUckFRWk9pZ3VhYStMVHBMQ0o2OHg2NkVjS1hnTTNCRnJK?=
 =?utf-8?B?dkZ5eURWMzNMcUhoSzltZk5NMy9qd1NtNUJUYmdJOUtaeUwvN2VQNlNlR0pv?=
 =?utf-8?B?enhRZjg5dTBhdGNPQys2ZUlqNytTQmhXYXlZZW04MERNMnpkZCsxbUszL3Rr?=
 =?utf-8?B?K0YxWTBmVlVCbm9keU9lRTJXbEJCNG5zZGZFUnBhUEt4anFYdC9vdDVMQW5z?=
 =?utf-8?B?L3BjbW42aTZZblMwU1RLZGpyMjUxdjh3bGkydE9vZ2c4ZUdMbTE0OExYQnhr?=
 =?utf-8?B?MWpodUxFdFpPNEVxYW52ZCtKRU16M3JjUWdvYjVXMDUzUThwVWMydEdseGMx?=
 =?utf-8?B?dUlGL0g4bkZYOHd6VXJpTURncUZqbmxpT0d5TVh3V0Q2QzhLMXhMcUNOQWx0?=
 =?utf-8?B?ZlZraEJCemdxalJPbDRXY2hDc1JMN0NKTlRJVmlnUkhla21CQVFOOCtlczli?=
 =?utf-8?B?cFRmRzI4T1NYMTY4MTNIZ1lqUjNDS0VnaVJFYzNvZ2d1OFRHTUl5SFJIYWJk?=
 =?utf-8?B?YUtjZngrS3NrM3ZCcVRqNElNWUYrRE9WaG10cG5Ba3lqamcxdzF6RjA4U2xW?=
 =?utf-8?B?SEhRdFJOU2kyS21GUGJGVmovamlIZkw1VGVhNWlrb0hUVHROOUU3Zm1jZTBr?=
 =?utf-8?B?OFA1Q1AvMlptZS9XdEpoZ2l2cXg0czZpTnlFRUZtMWcwWmZLblZPaFkvSHdl?=
 =?utf-8?B?ZFRFVm9OS1NCTWxadWp1TkRUUVg1aG4wRndUMk9KQ1lnczZBTXJ5NXcvSXhW?=
 =?utf-8?B?bDNZT1dpMEE4UUZTdXd4OTgzK2pIaTVrVUIxM0pVMDZaNERLTmxROGlsR25w?=
 =?utf-8?B?eTk1V3VHSlFKL0JoU3JSWk9UcnBrc0tONEY1Ri92Z0xKbWZsUExxcTFET3Vi?=
 =?utf-8?B?cFc2VGFzM2w5c0s1T0tWMk5sWnBVVFJMNy9Cdmx0OVZJd1p3cjZmM3NPMU5h?=
 =?utf-8?B?aFhudTVOaFo4N25ISm9YZDV2MVFzYmJoZm53R0xxK0dMWW5GSjdmY3I0a2Jy?=
 =?utf-8?B?NXJmRG5tdlNRamwwa3NpWnE5ZUNZTnI5aisxNm56OVJiam9NdFRjSi9saUx2?=
 =?utf-8?B?RHlseUJmTWt2cnNCcEJVM0dSdS9GWE11OW9pK0EyWDVRWXMvTDhuNWEyNU9Y?=
 =?utf-8?B?MDFScThEbzlzcllBSmNJOWhWUEo5MXNFYlBJY0JPeE1meGM3SGxxb05pamFu?=
 =?utf-8?B?RHlacmswK0RpdUc1YkFXQnlUbDRMdDdJY3ZUYmM4UlFvTDhydGZueHhKcTJT?=
 =?utf-8?B?bVRDWmpja05kZVdhNHF4UCtlYVNtelpIWUtOUDlnNGVWV2NVVUJHTEdQeGtD?=
 =?utf-8?Q?XVoSZfoMUUrazzwv10RyyT8=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ca5833-1b14-4dd1-8293-08dd6d32dea8
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:25:40.9388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhFn77V/XK/vCIig28Q7JlVJkoTxToV6/BmTkvMSeN9kw8GFtudqedlF1ZNJL9ij2Ek9TKEAg4ac/B26Bsfw6BScFa1OBlIpG1Juq1tNRPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB11264

On 2025-03-27 09:20, Mathieu Desnoyers wrote:
> Eliminate a useless task_work on execve by moving the call to
> rseq_set_notify_resume() from sched_mm_cid_after_execve() to the error
> path of bprm_execve(),
> 
> The call to rseq_set_notify_resume() from sched_mm_cid_after_execve() is
> pointless in the success case, because rseq_execve() will clear the rseq
> pointer before returning to userspace.
> 
> sched_mm_cid_after_execve() is called from both the success and error
> paths of bprm_execve(). The call to rseq_set_notify_resume() is needed
> on error because the mm_cid may have changed.
> 
> Reported-by: Mateusz Guzik <mjguzik@gmail.com>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Michael Jeanson <mjeanson@efficios.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> ---
>   fs/exec.c           | 3 ++-
>   kernel/sched/core.c | 1 -
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/exec.c b/fs/exec.c
> index 506cd411f4ac..35ee689ec00a 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1861,10 +1861,10 @@ static int bprm_execve(struct linux_binprm *bprm)
>   		goto out;
>   
>   	sched_mm_cid_after_execve(current);
> +	rseq_execve(current);
>   	/* execve succeeded */
>   	current->fs->in_exec = 0;
>   	current->in_execve = 0;
> -	rseq_execve(current);
>   	user_events_execve(current);
>   	acct_update_integrals(current);
>   	task_numa_free(current, false);
> @@ -1881,6 +1881,7 @@ static int bprm_execve(struct linux_binprm *bprm)
>   		force_fatal_sig(SIGSEGV);
>   
>   	sched_mm_cid_after_execve(current);
> +	rseq_set_notify_resume(t);

t -> current. will send a v2.

>   	current->fs->in_exec = 0;
>   	current->in_execve = 0;
>   
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 042351c7afce..e59a4e2a6453 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10652,7 +10652,6 @@ void sched_mm_cid_after_execve(struct task_struct *t)
>   		smp_mb();
>   		t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, mm);
>   	}
> -	rseq_set_notify_resume(t);
>   }
>   
>   void sched_mm_cid_fork(struct task_struct *t)


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
