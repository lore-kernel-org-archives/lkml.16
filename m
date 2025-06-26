Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012048.outbound.protection.outlook.com [52.103.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EA4632
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938464; cv=fail; b=rqskadztg4xBPx+YQ64ZS3+QF++etjONI78aLYAoIT1eKZ76osRCA1I+JYEqxV2UTCK4AzMh2FI83vHmzdio8fWRUhDhwkq5GHBdLe06kOEVvhNdR6XHscLpPsWL98jAAYUeZqnY9issc5cP+C2j22bwLQTPU6VUR8T+V13FVB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938464; c=relaxed/simple;
	bh=wjI4vjFNbr745QsvplesAT5pu1MOL+UI7AXBzZIl0KU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hTBpQINCWyoFhar73anipaqjhMmFkqjV7DOj5Mrg/Z7Hpv1v8H2lUmymrXwbMh3tufK6dT5uaorWC02fIyAQxXogMRygrJJyPREv3IvmaKtmlvILryVcoc5TzGaITnSDK1xpnQyaKij6A7B+gW8cuKc8OLGJNt1IW/EhwmqJhmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aIo2vxQv; arc=fail smtp.client-ip=52.103.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aIo2vxQv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sK+1JrCCx7I7xbcBc4DQFLzGAiR1abdiezeiMZSGLA8HIyzwni1KSKa0wsTAbUF0qOkYaEicNS2odeprhb4r31CUCybeqlgUnuE4d7N2hS4CYn7ZBKYRYqRN+vEK/G3TuytPkxTGuqKqH9ZxbKnk8/DcTRbb/D4K5DLgDj0L+zLn+Bkjmm+qSifsOTY1PCaoS+67Eis/8z267gvzDKrjuTl4+SYn09nvWjDkPQBxdGZQynWRMhHggRKTahSUdsTaXhLqKX34AEHXJIFFXkl7wNXeEnK2z88yngy4X2MkBO8WO50npHSFlPDPoHrySLT66uw9PzVHld0cqR7qfya27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWNQ4+4h//HK1n+y5a5JN0nTcbpl5raW6S1Dccl+P0s=;
 b=sRA9PopT3v1uze1Rzs6k3FJBq9+xAYtyIvsTQzlK7gN2FdAo9L/N/v0guZIhyUr1lbuQNAIh9bsHxWS6DdgCxCrsAp0RDqSaKxUrdAELSkvm3kGtSO49od5oJ/PL7mILYDSQaH0nu1L1xILw2YfsWlL/pmSYWP+UeJ/1t/oM7Cyhoy8OooG7uV5GoEiUCQDN29Gq2DHGNCb3qW5UvOFl7SPtauiGrA4pZspOddrvcnpJbcB9y6Q+M43erOtwY79HOYpU54/YFPUwy4kv089Xq/hE1J6X3istdagP/2YcLUbAxXGnCOiZmeNNPkR/F4A+VQcIsfcVQeKvJHiSTD2mHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWNQ4+4h//HK1n+y5a5JN0nTcbpl5raW6S1Dccl+P0s=;
 b=aIo2vxQvrdmIQB0VCFzB5aN2+g9GuJefGb0tGcX4csXF0kPSgk1eZNDPgYGEfJvJt0bv6OZSCl7YFwJzu6HVR9o00+1My69fQNH8la0c5wpOGPvJVarOd7PMmAoxNC00xcId4NIZ65i2GcvL+OXcJMhN6PgpxePOyh4trlJE+McaBNBq1fV9Jndqx3dQEdRH5l3RnZTS72bcsj70NbkfE1oactD/1KOovU2OqbaykpYLhIuTanS7p/M1LGHh6arVccMc5HUWc6hkN94Wpov/yT+S8Vk8qVDH1tADwGW0OAVwmZ8sz9zjSKBN08jdhxlJ6X+uKwQphr7i6dut9zBPPg==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by SEZPR04MB7049.apcprd04.prod.outlook.com (2603:1096:101:17e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 11:47:38 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 11:47:38 +0000
Message-ID:
 <SI2PR04MB49312C83A5E6B68086954B41E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Thu, 26 Jun 2025 19:47:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>
Cc: vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
References: <20250624204942.715206-1-clm@fb.com>
 <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To SI2PR04MB4931.apcprd04.prod.outlook.com
 (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <892d274f-1a54-4186-a81e-69402e9df6e9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|SEZPR04MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 66825557-5bdc-45fd-e898-08ddb4a73ebb
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TUMmfyLMGAjMExomx+nJB+WT91yRhTtRufa7He4gp6mfL3Zw72Tk5EYYz0Putcg4hcr3ommJlF+l72xY382rIq007jLY2iXBWbxhRWn55Z3M3NsscAdM3IC7TMHX7hWqMGBarMAD8zfr4VHiizkL8mTudvf/t5hK72aQJXchsHRk/LA2gh+Q6XXNxOQ/KXmaWsWvF/0bcNoL/ap5cWSBOIfBNqb0X6jt9i8YOxiVOMQ1gBLUdaOnkxajw/d6z7LbubgaTKn5fx5Z07NKMqWDFTK0P85G71mBJDebeoE4SD65YtHWCl4exgHEJV7Wy69VqnpSeJGtsqpfFMrpW0WSE36j3LAs7QVcGbWy8TSAa9k4sXaa40e7Hw/mAdarfyjOSqUsLQLfh3zfvJSDEKcfpNpaSOPs46apgP778MEAEhbqInmn1pivsOE/bx8Bc1S1bM8YRRU15aPeueRBH093fd1t6y4TR9hFAC4uvqUQ2dk1MJOkkmpRVKk0xFJSpMd27RjigTjTOfIJ8qsHPYpfNK+XmaPxdi/3xr9GZ8ZT06TzbOYJME7qua4/ST9pfWOOqLR8gcL1XMNhG9IxX58mVRlKZb+2b+bT/LJ8LO6F/8dpxpZs/mrQ8chw+G/3ZmEmvRK3H4C4ZDyOFWktYnG+xT1UTkmYvaJ0Jua9x27tSbZVfMjOSasYb2HaV/zdd+J8RzB7ocz3tp4lMjmsC1NdzzAs7Y21og0VjFbfmc4JcCDmI3AjuV1cEOuSpTWiU07ikEQ65URJO06y7F7s+notuNksz7VUxv2DE4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|11091999009|461199028|15080799009|12121999007|8060799009|19110799006|41001999006|40105399003|440099028|3412199025|51005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0FuSk5pQXpsaHlWdTVXM3loUTdTUVpoNldVZlFRL1RWY2F2WFdDM1Y3dG1B?=
 =?utf-8?B?ZzVlYk9YKzU1c0pLSWNFNUFHUTErbnBKTUJSUFptcTRLdEl4WGJmT1pjY2VP?=
 =?utf-8?B?R3RRWDB5bGVFR3lUS0M2TnI0R3lkdmVWUVJyaXRIS3EwQ2tzM253N05ZZ3hD?=
 =?utf-8?B?U0djZ2VLTHVsOTJ3NDh4Um9VRGFTS3JyYUVDOHFaWnE0QndXQWtzMTFGQXEw?=
 =?utf-8?B?RmZFSkliOEM2WmswMk1HYVZraENlMUkzTmtXaXIvWFFIQ0R6TTZDVDNHemtE?=
 =?utf-8?B?NDVTTXhaTjFOK0tKVjNPT1JubldLYisvZzFUZUZKbXBvRStDOCt2SDV5YXEv?=
 =?utf-8?B?UEtxZmlQQlpoR0J2RjVXTWhyWm0xK3E1Sm9yUjMzTDkraWtYdTRCYmVkLzlF?=
 =?utf-8?B?MDFmZW5RTGQ3dXEyaU8wL3NmYzZCQmVpWTR2Zlp2WHhRZFFpOW8vV3lFZUlE?=
 =?utf-8?B?bGQvWCs5VmIrZzcrTXNtNUpHNHdvMFcrc0xyNFB5RWNrampXSTU3b3NsZWRE?=
 =?utf-8?B?ZnlPODFFdzlYbk1HMXlZUExtYlkzV2l0V1Y1SUxvWXJ4UEg1d2dYK3BvamxG?=
 =?utf-8?B?bTcyK1JKcUZ2T1BSRkFNTGJWdTVWc01FUE1wTVJYcWswdUZ4WllEOHZqamlV?=
 =?utf-8?B?b0puYnhsOEtqazlzckxhdHVrUk1abmY0MmNVWjRwaU43WkFzQlQrNXd4TTdX?=
 =?utf-8?B?VE9CNFVROEVsSzZGODFkSkF2N2t0U2REdk1sY3FTVmhuSkFudlVsMHdaREF4?=
 =?utf-8?B?aml1eDlhUXNtRm9WZVAxd09YN0xob0ZZK0NOcjBYQytJMFBBRnA1RXRPdHNz?=
 =?utf-8?B?VG84TWhtWVFZWDdJWG9ZeWwwekFqVEhnT1V2VE1tU09pYkFRQklzcysxMG54?=
 =?utf-8?B?UTJDUWYzRGVzeWk5b3ozRWk2QXFuN1plTG5XdEpCa0d5RW9Ta3FqUElmcUZW?=
 =?utf-8?B?eHVuaFl2dmpFWTd4aE0xRXYrTC9zaXVPdHZ5R2tYa3VvTDUyeTFUK2pUK0xn?=
 =?utf-8?B?T3QxWk9hd2RnODZtZ2k3QjlCczhoYktCZUgxUjcrV2Y1bkdXUWdSZlhqaXpN?=
 =?utf-8?B?Q0E2SmtQRWVGUGVCb01CVUhDTUsvNkFCNUxMcjB1b0Fvd2kyTnd2Rk9tV3NU?=
 =?utf-8?B?cm9DQjZDRk5xTXFOREtYVkdqYi9sME81YWpMd3VUbjhBSjNMdGxEM1Zvc0kr?=
 =?utf-8?B?M29mK0UrOW5hbmd0QVpPU2VYUFovY2pRMmsrd00xdnRBOFpSSDNlNEtEY1ln?=
 =?utf-8?B?ekdTQU1lNVJ3YWlRVEpRYmIwUWg3SHNWY2R1MGlRVWJoZURLWDYzUlpEb2RW?=
 =?utf-8?B?UkNTOW1WY1AydFM1Z2R4UFYwSlJzTWdXelRGOTVyT2RuMCt4b1p6UTIwSndV?=
 =?utf-8?B?amllMVpTRGt0ZTZxUStiOUsyV1ljZlM3dVpYWlEwdzA5TEhGSU1LWXhTZ282?=
 =?utf-8?B?UzZ2azI4Ti92d09vK1Y2T08zRXJRNGJTSU1RcmltYUZ1UCtPQXRmUzVKNjRk?=
 =?utf-8?B?YUZ5bjNmV0Rhelhpb0lWbE1CRmJUcGl1ajNRbUQ4UHdHcVJkc0RhWVJ3UHN3?=
 =?utf-8?B?cm5rMGRNMG9ZS1JrRmN2MENoOCtyOS9OOTVBT3hUbmIrSXJZeldMU0NTUUJ1?=
 =?utf-8?B?bGxjYmhmZ1daQlVldXc0WlhyZG4vMHlMVGR5NVJHWHNoR0VaZU5VWk9MUVQ0?=
 =?utf-8?B?SXlvNVp3U2NxWVFwN2lPOWU4QjJVUUZONU1VQWUrZWtzQmJsSVlOd3Z5UXRQ?=
 =?utf-8?B?Q2poUkFtUzBJQkRFQytXRkRaS3JJRDZhREdzR0NUL0g2UGpCK0J0aVRRNU5p?=
 =?utf-8?B?SVZ2UkFpbVMrTG1vK0xwTHU1VkhWVERmdGZIMnNFd0paWktTSXVwZW9CYlZz?=
 =?utf-8?Q?ys1q0C6cS/pbM?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEY4Q2J4SjZLOWxQK0lEaVZsZmZ6V09BS0NBeW42OVNmbUoyNGtiSGJ6UCtM?=
 =?utf-8?B?WUtmY3dOOWxtcUx2L003ZTlzZU9VbmZadUx1SXBJWHp6Z25nSzRCNXQ5SEFj?=
 =?utf-8?B?U3NHam1OVTJPK081Tk9PeWhmUXVpTTFaOE9TYW44Wm5udWFLbjc2Z0tOSm5Q?=
 =?utf-8?B?N05wczUwWHk2WUhsTnN1K1FMUE04VG5tMmxoci9PbURKWmJkK1hJWXhCOFBJ?=
 =?utf-8?B?Ukd1c3BPWFdWVXRydUFEeHdLUkNEa1lnSFZXQnVNek5VdG50QXE5c2VQaGVY?=
 =?utf-8?B?N3FWVlVsdjhteW5pZEdTRytWUzBjZkllNE8zV3pQeE5ram5RVjhqb2VaNmdv?=
 =?utf-8?B?TWpqR0thMUFLeW1rS3I3WE4zT205QUdvU1JvTVlGaitmT2YzUkI4aUJGZis2?=
 =?utf-8?B?dW0zSFZ6RFh3Z01yR0g5L1Y3MUl4ZTBIVWY2NXNOaHlodTRRb0hISTRidVIy?=
 =?utf-8?B?VVcvdmlmSDVPNGZqeUlwRS93eHkvWXcwbk40YXQ1Z2w2aDNPVGUrcjZRaXNT?=
 =?utf-8?B?bDgrdytsK2hPdm0zT1E2SXBIbmxmNUdzcEZGbHdCZHhHcUVkT1hzSFBwWjdx?=
 =?utf-8?B?dlVqZU14SUU3bC9reS9kZHZjQjE5ZTBoYTdyZm9nK3hNVXl5WmwxL2M3RUlD?=
 =?utf-8?B?THpZQ3ZYZWMrNVFWM3hUQ1o5YVVWcExRcGNMQ3QrWVNkWHZjTll2bWtYKzFm?=
 =?utf-8?B?VFozSkIvQ1ZaeXk5Njd2TVI1L2QwaTMzVkUzOVhtdU12UFY5NjZ3aGZJcFk5?=
 =?utf-8?B?Z0JZQWJtb1h3L0NYNk0rblYwajBENmUzRkFhYlVwZ3hWUEZRQisvYVJBQ2lp?=
 =?utf-8?B?VVlPWTlYQnBVRHZpRGFoL0xvaFZyTzVVYjBkcWxYNEdncHBYeVZwQVVNZzQ5?=
 =?utf-8?B?SjBPRW84VlhJcmJoKzdsbFhIMnhmM2VhWk5lQzMxdjR6Y1EvZnhBcEc2Qm1K?=
 =?utf-8?B?NlJydnV5SGozSmdSUUpsZDFvUUJFWmdUb0lWb2VPVERkRlFRb0c3YU5zaVhp?=
 =?utf-8?B?bkx1VnIvdUtsOUw0cm1xSWczN1BOM3JkUk1NTDZGRi8vUVNaaUNjWjlxTkRY?=
 =?utf-8?B?VnVvU3RNNndUMlQ0YTdzQ3RKNGRsMWdOOWNHNHRrRlFTUXoySWxjRHdJY3U0?=
 =?utf-8?B?bHF6MUNPc1NjYURCekEwWDIzVWxKNzRGN0pyczlFeVJlam1HNkE2ZmFvdk14?=
 =?utf-8?B?SGNndFU5SnkzM0czbktHYVJaSEpsbkVCdlM0ai8wdmZKbm9GbVJpZmd6Smo5?=
 =?utf-8?B?ZDVHNVhod1VQeFZsUG5HWVBUeUh6cG1ManJ2d3Zucjh2ajNsejVaMWwvZnJ0?=
 =?utf-8?B?RitqS2Z0ZmNGSmp0alNBbUgwREU2S0YrclRsejdqU0lCYjZQQTNtTjJRTFky?=
 =?utf-8?B?dnhMbEQ4dDVJNGFKbTZOWTBHLzFkaHhLKzF2YXA4Nk1PWjdzRDFkazBBVU16?=
 =?utf-8?B?K01BNnhLd2h5ZEdBQk04dmtlNTNWVjNuaktSelJ3M0xGUnBPUmM1MURrL3p0?=
 =?utf-8?B?WWxqRFFxeDRleE1NQnNKMnR2NGRQRjgxVDc4MythWkhRb0VQcmdUZk1BMVRz?=
 =?utf-8?B?S1ZHeDlZRzhkdS9aREF0T3RVbXdRY3NyUUtCeGF4RmlTcXd2THpvS3pXUDFG?=
 =?utf-8?B?YU94WkJuamlGTW12Sm9qZTA4ZHRiejFMcGlNY2RGVjNOZXZaU0cwYVNQclBE?=
 =?utf-8?Q?3BhnMXBiv6p+ssCABH9f?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66825557-5bdc-45fd-e898-08ddb4a73ebb
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 11:47:37.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7049

Hi Peter,

On 6/26/2025 3:00 PM, Peter Zijlstra wrote:
> On Tue, Jun 24, 2025 at 01:48:08PM -0700, Chris Mason wrote:
>> schbench (https://github.com/masoncl/schbench.git) is showing a
>> regression from previous production kernels that bisected down to:
>>
>> sched/fair: Remove sysctl_sched_migration_cost condition (c5b0a7eefc)
>>
>> The schbench command line was:
>>
>> schbench -L -m 4 -M auto -t 256 -n 0 -r 0 -s 0
>>
>> This creates 4 message threads pinned to CPUs 0-3, and 256x4 worker
>> threads spread across the rest of the CPUs.  Neither the worker threads
>> or the message threads do any work, they just wake each other up and go
>> back to sleep as soon as possible.
>>
>> The end result is the first 4 CPUs are pegged waking up those 1024
>> workers, and the rest of the CPUs are constantly banging in and out of
>> idle.  If I take a v6.9 Linus kernel and revert that one commit,
>> performance goes from 3.4M RPS to 5.4M RPS.
>>
>> schedstat shows there are ~100x  more new idle balance operations, and
>> profiling shows the worker threads are spending ~20% of their CPU time
>> on new idle balance.  schedstats also shows that almost all of these new
>> idle balance attemps are failing to find busy groups.
>>
>> The fix used here is to crank up the cost of the balance whenever it
>> fails to find a busy group or busy queue.
>>
>> Signed-off-by: Chris Mason <clm@fb.com>
>> ---
>>   kernel/sched/fair.c | 52 ++++++++++++++++++++++++---------------------
>>   1 file changed, 28 insertions(+), 24 deletions(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 7a14da5396fb2..0c4701564ce01 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -11744,6 +11744,32 @@ static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd
>>   	}
>>   }
>>   
>> +static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost)
>> +{
>> +	if (cost > sd->max_newidle_lb_cost) {
>> +		/*
>> +		 * Track max cost of a domain to make sure to not delay the
>> +		 * next wakeup on the CPU.   Add a bit to the min so we don't
>> +		 * have to worry about <= vs <, and to handle the sysctl set at
>> +		 * zero.
>> +		 */
>> +		sd->max_newidle_lb_cost = min(cost, sysctl_sched_migration_cost + 200);
>> +		sd->last_decay_max_lb_cost = jiffies;
>> +	} else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
>> +		/*
>> +		 * Decay the newidle max times by ~1% per second to ensure that
>> +		 * it is not outdated and the current max cost is actually
>> +		 * shorter.
>> +		 */
>> +		sd->max_newidle_lb_cost = (sd->max_newidle_lb_cost * 253) / 256;
>> +		sd->last_decay_max_lb_cost = jiffies;
>> +
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
> 
> For the non-RFC version, please split this into a code move and a code
> change -- I had to stare waaay to long to spot the difference (if we
> keep this code movement at all).
> 
>>   /*
>>    * Check this_cpu to ensure it is balanced within domain. Attempt to move
>>    * tasks if there is an imbalance.
>> @@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>   
>>   	group = sched_balance_find_src_group(&env);
>>   	if (!group) {
>> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>>   		schedstat_inc(sd->lb_nobusyg[idle]);
>>   		goto out_balanced;
>>   	}
>>   
>>   	busiest = sched_balance_find_src_rq(&env, group);
>>   	if (!busiest) {
>> +		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_cost / 2);
>>   		schedstat_inc(sd->lb_nobusyq[idle]);
>>   		goto out_balanced;
>>   	}
> 
> So sched_balance_rq() is used for pretty much all load-balancing, not
> just newidle.
> 
> Either make this conditional like:
> 
> 	if (idle == CPU_NEWLY_IDLE)
> 		update_newidle_cost(...);
> 
> or do it all the callsite, where we find !pulled_task (ie failure).
> 
> Specifically, we already do update_newidle_cost() there, perhaps inflate
> the cost there instead?
> 
> 	if (!pulled_tasks)
> 		domain_cost += sysctl_sched_migration_cost;
> 
> or whatever.
> 
> 
Maybe it's meaningful to do the inflation here and no need to limit for 
just newidle part. Because when we do the regular load balancing and 
find nothing to pull, it means that there are no busy group here and we 
should not start newidle balancing either.

If there are concerns that the newidle cost might grow too large, we can 
implement a decay mechanism here.

WDYT?

Thanks
Jianyong

