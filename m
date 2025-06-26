Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013079.outbound.protection.outlook.com [52.103.43.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD423B606
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940639; cv=fail; b=pE3Vlue16h1XSJu+ZWfnSMpVBGk8GqA2Q+a0gd7SUibPEV7GkqSULV/3P4e2BfBzL/+TswrzPWooV8pHkMN4ZOaY4SkVTCNVsphdgAyxjaWL4vfcSRvPzw735/Em5NHHejHdQ54vi1jv1aVei6GhHoApwLjjDltkjR2r0EJPCxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940639; c=relaxed/simple;
	bh=n5vDEt9KcXC7+GGh2m0WTA8Hdcml9pmK81Lcy6fO+jQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Aklpq0W5T3PdIvkVYdgdYqhKi3ciR76SlVwdEb8Zar++xwYxSLZOKPTt6yR8Uvd40SFFwimd+1HGgVL8idcSAFVU9PSRgUsdsLaP3cGE6YAWMVdC5yw4Gfp6A5av1yV9QPWnYXD3lcgIOr+ZIdpD7TAFWyoycP7rwQmRsu7kzjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GcxOQywN; arc=fail smtp.client-ip=52.103.43.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GcxOQywN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBlod0pjkfmW3Kn0XyRiztcxgimJHO9rMFY1ezoipvhQ1eVCjQ57I22FytThFRHKPWYK+/op5iApCcSVPHS9ikrK0r+HOiyRefLvLmFjbuYQOVL3GwoJjY6yQZ3w0MvCGjCfrTOejurA/8u+JmLmPyvFAcCYnd1qSAqia5jIXdZuLkN15mzgdWSFeZQSx7e6CkgB0IjorahVdwcT5veaazGoYoomra1+ssLBPZAw+JiF6oZSrTEwHU2OuemV/sJS3cqaQuuGh3gvFCa5vs9tqKL6RCDa6IISODDD9cs3FO9PL23WLR+Fwo+Jp6Qcur+BCgY7BW+r5SU1JO8IoWqvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O5/Vf/LXCXAQUG6VmN7XNLMGQyZPijJJz38iUwGVnc=;
 b=akmRaIDGSOV5JNMlSXV3Dh3rgCf3fM240pbl7bsBbG3hI/TF+RLrOrgGMjwu+2GKfq3n3zfsccIESA0U6AbgU68ncG7be9jAe0AnxU4Fu8kZLtctB5pe0s3RhE+1UdDultAbsSOwhvXP8jLM5XsY9YLScGFnOFlZlpdSEGLjSpT7s2aTXxdPgDVVT5fbtFwAcrTIOXvnReY1kKxFTGeLoUlkfp16p+aDesgsRu66zFz7ztnGQm/nNptvnsjmXWCBFmERxR8n+PbR+hl6cLMg3V6EXVzdOmR/3Wnni/CSz8W3xPx1xhmz4mar+s1SRc4d/Db4vshcuEaQrtxeY4PZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O5/Vf/LXCXAQUG6VmN7XNLMGQyZPijJJz38iUwGVnc=;
 b=GcxOQywNnFzy26ux+0y68oa82hqytfeRT6LSHbhfYQ5VutFDrb6fQjDiz8fbGdU5v5J8nBhmuzCDqfaghHNsUKhv7djDQdhGaUdBvSMBmMejtOSRCMDFFbdDffYXxHung7X7QQ0XG68ed3+ZlSNQW0e86s5TTXdYYHlBePW254fTgpCPm67oYfyqxN5rZqn2SIP4OLKXFxIPk7tAhwLEd20QbqNVE9ZqR2lE+3q+ANeTaTfxb8HoEqozQt7znIPG1Bk7XDltMJKscCzZPGdvT/L5LQZqgZ9EWi5taprDMzlY3ZQb9HHrNmytqXOLQIoPCpd43fjUH/BblgWEJaN2RQ==
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
 by PUZPR04MB6559.apcprd04.prod.outlook.com (2603:1096:301:f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 12:23:50 +0000
Received: from SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963]) by SI2PR04MB4931.apcprd04.prod.outlook.com
 ([fe80::a6ac:c945:13f6:e963%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 12:23:49 +0000
Message-ID:
 <SI2PR04MB4931D866229A4F148F26CD72E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
Date: Thu, 26 Jun 2025 20:23:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
To: Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>,
 Abel Wu <wuyun.abel@bytedance.com>,
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
 Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
 linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To SI2PR04MB4931.apcprd04.prod.outlook.com (2603:1096:4:149::12)
X-Microsoft-Original-Message-ID:
 <70e8511f-7cff-4110-8fd3-e620f84df4da@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB4931:EE_|PUZPR04MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a640360-4710-4b2d-3f59-08ddb4ac4d7d
X-MS-Exchange-SLBlob-MailProps:
	LVbdfIC7uFA+OhG4Nfrgq+SLSrt4VwE+v0tH6V+EXWCqhp/MGqcyWcF8Pfgd77mQAT33Zsp3a3mXyEjPhT5kdsXjEYMuOljer/vZ0cXe525jmuTBGS7Y9CwTHNGXfOQ1r0VVjPKqArCfTBTavQXxjyO7twoV2ZOHNjF/pgf79vHBUIG0vl19gkLEIKbhJEUBlvl3JzmXSdaDdvCDZHBDF68uGN2vJcwWnQgIDxMiivS3WOciuI+iosvOoR9W0m2M0c04qVB3XW7opCLRBmSlNYQatSlMtAz/JDsVSSkljqOlkZkrNAqgHsycdw6QTSot64D2i9mUP6nAIZlePPiUbDYvSghm2IRhEQ7HML+C1WqJgFTywuhhfbEP3dSPI1ymuWxNKv25/8Yk0MPxR4vWF4Jb8JJtAMNmC3fIzzIO5MhI87i+0NiCyEcvOREVDT5zEA8Ald9jpGbLzuAw8VZi+dHFCU6VIVBBky5Ai6svybpA5SLR/mYkop4L5x+FIOrje39xlgonjApY0ernELIv/NdwAIGTBfrOzV07ctjOB0qWqW8GKKQHF55lGJo7rx6D90rF5Hb6apBqe5++pcs+Ame+8t+wqt/3g7Y1OGqz/UycTa/x5xC8FaQ8h+4M9U96PrNkQDhd8JXmJlg4jb9XugI+9hfkxs4D5MvZajsgxCrjHgjZ/SMGHpDTQJfMl3T9fJW6EyRYQ/0u75+Tj+oyfoV2v44y8Q5kvWZDcZQJlXLdCw8tRgASOw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|12121999007|461199028|41001999006|15080799009|19110799006|8060799009|5072599009|18061999006|440099028|3412199025|12091999003|40105399003|51005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlY1MG8xSDQ3YXlVNUJaUUh2MzV5enh5RVBWcldBNEtOd1RjaFYxYmdvODYx?=
 =?utf-8?B?WEdmWHMzUE1IT2UwQ1dtL3JodktrU0F6UGY5c1plTzJYWTIxZ3oraU8yaU5j?=
 =?utf-8?B?YUU0OWdXMjl1OWl4Q1ZNQ2JOVjQvUE9qOGJPUFRJbWVwSFJrWk5xYllpMUNU?=
 =?utf-8?B?ZXJlWVNaclB1UnJiWXJDMncvMzl6OTUrSlc1clV3OHBQcU5CNHFzTEpidHp0?=
 =?utf-8?B?REdDdFFPeXZWYTN4SzFaaVVNSjJXTWh0UkhIOTU2V3FqNkZ6MmNuYmgzS3VY?=
 =?utf-8?B?dGJMVmdQaGlXMmVQRUd1SnZ1dFptcjZ2UTh0cWYzNE1reisvMk15N2dRR3Vu?=
 =?utf-8?B?MVNjSlpYWDZQZnhWVW9yVWp5YTJJT1hOMmhTcXpzaHhtNzFUbEU5VVh6U3RQ?=
 =?utf-8?B?SStYN3J1VHQrRGRaTzJLN1ZuZzNUQm04TFNlenp0TVMvajc4MWRtQ20ydGE0?=
 =?utf-8?B?ZUhJVjBBei9TSFhQamFFYUtFZU54Z2x6WmV0ajJHeEU3SFErcVpISFp6YnFu?=
 =?utf-8?B?VlloNnJPYkxtb3p2L1lySUtYSE5mL2U5NjFxYlp6TEJGVzNFRU81aGVXUEVm?=
 =?utf-8?B?NGlUQXlJU0EySnpuNGZUOHZwUGFuSG5vU0UrWE1XMTIxZnVqWFJtVUg3TnZN?=
 =?utf-8?B?MEY2SnV5Z1AyRGZnSVNzaUgxUVZXdDk2QUdwRWhrZ2dMcEwzcnQranVCUm9J?=
 =?utf-8?B?SE9DVGkveHVTWUJ4MllKU1JIc3R5MlJrVnJaUkh3ZzBBa0hkZC93NHNvQVFh?=
 =?utf-8?B?azJENUt2VGNQd2VYVWRpZUdOU3dCNHdaTGR0TmtkRDBxa0pmUlFHRnFVWjF5?=
 =?utf-8?B?bU9EVmlnUlREb1BLTnY0QVZnandTdFlta2xLTTBKN2t3T2dwb3F1V0EwaDhM?=
 =?utf-8?B?MFFjVjBSS2FEVlhOUitVbVRKcHVrb3FabE9FRDMzd0RtUzdpbWxCWk5xMmdP?=
 =?utf-8?B?Z0tTR2hiTWRza0w0ZEJOVXErd3IzbU1INjdSdTdneHUxZGJnWnFPNmEvNTVm?=
 =?utf-8?B?M0ZDUGpqZXV6dmQwVlZ1N2FLRysvTHRnRENCNzJFYnFodTNSTXlmdHpQNkJp?=
 =?utf-8?B?TUNEbWFkVHBKM0N2c3pvUWw3QmJKeEtVY1FxMWtJdmRDSEhFOStnL24wSklQ?=
 =?utf-8?B?VDdEQ0VTV2dpTDV4YWxCYjdWMG8xbGxpWlZXWTFYSEMzRkdFckY3NTZRNlhJ?=
 =?utf-8?B?Q25DMkRBUXRiY2RsWFFVUkNjYndTQmx4eWVKRll3RmkwWlBuVXZjaDhlaTN1?=
 =?utf-8?B?M0lxeFFGS0c1dXJYako2SVdUUmJ1ZjRNK0dndUlnNzVqR3pOSUd2ZjlhR0lO?=
 =?utf-8?B?R1FFUURaTUFiTHp4dm1GWmhsaCtIazZRQUo0ZjdsTE9PaHU4aW5zbStUUEdq?=
 =?utf-8?B?UTcrUWdVWW1udHlEWlRQVkJPaWlqaTJ4NElwTDFydnhMa0NoalkzbjJENjlF?=
 =?utf-8?B?anhHZDJuNUw5MzhCQnRwSldZWUlibDlIZk9YdVAyb2FnaFh2bHJzK2xWQ3hn?=
 =?utf-8?B?QklDTlJXWHhMeHRSN0VoL0R1emNOYlZlWENUWmhZdTJPTFdHSGEzYUJDb3pM?=
 =?utf-8?B?ZnNBeGVpTXBzWDVsZG80ZGhCSm9xZXFScVZ2d0pGMmttOFh6L3NrODFaK2Mv?=
 =?utf-8?B?M0NtMXNjK0xLMTBpSmgzalhNUVJoV29vVFhEUlNWRWJvZjhyQWZYeXRDbTdz?=
 =?utf-8?B?Y1o3aWZnbkxXTE1xZjhWcHdyQUlsVXlnN01hMGt1RGZvdW1jMVJYamcvWTJo?=
 =?utf-8?Q?LoDY9phJfDBMl1sj5y0wfRqoQt72qpvRxqTvzAj?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVlYa0c0K1RLbWVxV082Z0RTK2pwcFBpMnExeFYxa1dodlhXT2tzVEZ0c0FP?=
 =?utf-8?B?Z0NCempYNGR0bzhiOEwxY290VGxHcGY3aktDR3Bmb1kvZU40Y2hoUTNwRWtI?=
 =?utf-8?B?aW5GaUwwYmI4K25IRG5LelVyRE44UHlJVXJWaXZUL2IrdVdycVlWTjRrb1Fk?=
 =?utf-8?B?R1BqRGVNWlVsL3l3emczbTFsTE9rTlBVMEs0YXIxUTBuUStQdXdxQXVLTlRP?=
 =?utf-8?B?MHhzUk80OFZZWiswUlVZQnJwUkUwb25yTVJmQmcrc0hzUittNkNHVDBvaUp1?=
 =?utf-8?B?WWI1cGRkV05uc1VQSE1XMkFraGNEL0NTWTFGWmdLL1hYZUVQMzJWcmZNZGNV?=
 =?utf-8?B?Z0JOM3dYUStTYU9hdURaYTM5R0VITmE2UGpZR3lwOWpVYWI4S2FRYVppeGxZ?=
 =?utf-8?B?YjJ2b2k1aFhlZmllMmlOc29uNjJFaVZXd211YmZDbnVONnhmYitaQzlQeGti?=
 =?utf-8?B?eW9CRG9VelhsaWhkUDBMNXVKQVkwZVF2bVUzWmxnVGFKZzdjbDR6ckRudER2?=
 =?utf-8?B?dVV1K0J0cmZ4dm9Ma1RxUGRWZnRGSk9Qb3hWRHo3L2RrWDc5enh0YnVNUjl6?=
 =?utf-8?B?Vk84SFUxSUx0R042MHAvRmRDdXY5ZG01UGFFQkhkTExWSzZka01uSzUzVXBr?=
 =?utf-8?B?b29TTHl2S2RDK0V1TUdGZDhXTVIzM1U5YmJCa3pDUklQK2hOL0phZlROaEhJ?=
 =?utf-8?B?S1FHZnVUbUlmRWpXdnA2d1FUa2RZM3NqOCtRRzloaVlCS3BPcDBNZndsUCt4?=
 =?utf-8?B?ODRSMWx2M2tJa2IyTVdqUURuMjlOMGdVTWlhUm9lc0dvZWpacEF6RFBhajNN?=
 =?utf-8?B?dzUyL1RpQnFYb2tZYmhpTkRiUVAwaldJeEJmN2ZQTHNhaWhWZWR4WDcvUVJt?=
 =?utf-8?B?ZS9FNWFmNk1CbERhTWRnN1ZYMXFFM2N2cHJGY09nU3ZJdmRlQ1FDQjJlOC9Y?=
 =?utf-8?B?YUpzSCs1NzhsSWw4WDE2RzRBcWFsUkM0NmhkVStVOTh2VjRFbW83cE1adCtk?=
 =?utf-8?B?Vm1hcGNxNHhxcStmVWJ1cUhoWjJ2ZWpWeEwrZGI2b1diRmRCOWo5Nmt2Q1A1?=
 =?utf-8?B?Q2kvR1k4UnpaNU53ejZHcmQyb0d0Ry9hWWsrSE1FVmZSRTE2TzhxWTNVTmxx?=
 =?utf-8?B?YTZwOTB5VmZ4UmVSK3VYNHp3N2kzZXBVVUhmdndBSitqY3UrL1VYSzNzZkpH?=
 =?utf-8?B?by9vOGIwK3FPd1VPekhJSWgyclJEbExRMDdmVXA1Tmdad0FpblJwaTNtMFFw?=
 =?utf-8?B?MnhxaG1RYUxxb0pmTHo4TWNUSlRuQ3Zuc3FBSGExRzBCVVFlMDVxNXlLa2tH?=
 =?utf-8?B?dkRFYVhPWWhwQ1pOUWYxc3pMYUQwTHlNSVBpMWlOY2FZNXoxcUhjRnp2eTlt?=
 =?utf-8?B?YmJhaThNanl1VlRPc0ZCZHFqZm14WVJaUFlkTVhLU3ppS0Jtc3h6TUJ5akpF?=
 =?utf-8?B?MU9GdmFsdm91RzM0SVQ0OWNUakRyYWdSODRSS3JKdVpPVFFqTUFJbW5icjlD?=
 =?utf-8?B?OWRkdjZ4RjJScnNQZ2JCcWRZWkNUeHRCSzRjSzBVUi8wWVRTL0g3QnhEd0hk?=
 =?utf-8?B?Z1ZvZ0lzbWliWTVGOUpiNWtIVWUrM3VhNmZsV2ZVRDUvMEVCL2w4TVpYd29Y?=
 =?utf-8?B?bE04aElQYi9ZWEx1VFZvc1dBcEVEK1VET3VVL0hFeC9jUlc1L3Y1dmNzMldN?=
 =?utf-8?Q?oi6cqU3gao3kRfQUPm4I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a640360-4710-4b2d-3f59-08ddb4ac4d7d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB4931.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 12:23:49.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6559

Hi Tim,

On 6/19/2025 2:27 AM, Tim Chen wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Hi all,
> 
> One of the many things on the eternal todo list has been finishing the
> below hackery.
> 
> It is an attempt at modelling cache affinity -- and while the patch
> really only targets LLC, it could very well be extended to also apply to
> clusters (L2). Specifically any case of multiple cache domains inside a
> node.
> 
> Anyway, I wrote this about a year ago, and I mentioned this at the
> recent OSPM conf where Gautham and Prateek expressed interest in playing
> with this code.
> 
> So here goes, very rough and largely unproven code ahead :-)
> 
> It applies to current tip/master, but I know it will fail the __percpu
> validation that sits in -next, although that shouldn't be terribly hard
> to fix up.
> 
> As is, it only computes a CPU inside the LLC that has the highest recent
> runtime, this CPU is then used in the wake-up path to steer towards this
> LLC and in task_hot() to limit migrations away from it.
> 
> More elaborate things could be done, notably there is an XXX in there
> somewhere about finding the best LLC inside a NODE (interaction with
> NUMA_BALANCING).
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   include/linux/mm_types.h |  44 ++++++
>   include/linux/sched.h    |   4 +
>   init/Kconfig             |   4 +
>   kernel/fork.c            |   5 +
>   kernel/sched/core.c      |  13 +-
>   kernel/sched/fair.c      | 330 +++++++++++++++++++++++++++++++++++++--
>   kernel/sched/sched.h     |   8 +
>   7 files changed, 388 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f9..013291c6aaa2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -893,6 +893,12 @@ struct mm_cid {
>   };
>   #endif
>   

> +static void task_cache_work(struct callback_head *work)
> +{
> +	struct task_struct *p = current;
> +	struct mm_struct *mm = p->mm;
> +	unsigned long m_a_occ = 0;
> +	int cpu, m_a_cpu = -1;
> +	cpumask_var_t cpus;
> +
> +	WARN_ON_ONCE(work != &p->cache_work);
> +
> +	work->next = work;
> +
> +	if (p->flags & PF_EXITING)
> +		return;
> +
> +	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
> +		return;
> +
> +	scoped_guard (cpus_read_lock) {
> +		cpumask_copy(cpus, cpu_online_mask);
> +
> +		for_each_cpu(cpu, cpus) {
> +			/* XXX sched_cluster_active */
> +			struct sched_domain *sd = per_cpu(sd_llc, cpu);
> +			unsigned long occ, m_occ = 0, a_occ = 0;
> +			int m_cpu = -1, nr = 0, i;
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				occ = fraction_mm_sched(cpu_rq(i),
> +							per_cpu_ptr(mm->pcpu_sched, i));
> +				a_occ += occ;
> +				if (occ > m_occ) {
> +					m_occ = occ;
> +					m_cpu = i;
> +				}
> +				nr++;
> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
> +			}
> +
> +			a_occ /= nr;
> +			if (a_occ > m_a_occ) {
> +				m_a_occ = a_occ;
> +				m_a_cpu = m_cpu;
> +			}
> +
> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> +
> +			for_each_cpu(i, sched_domain_span(sd)) {
> +				/* XXX threshold ? */
> +				per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
> +			}
> +
> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
> +		}
> +	}
> +
> +	/*
> +	 * If the max average cache occupancy is 'small' we don't care.
> +	 */
> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> +		m_a_cpu = -1;
> +
> +	mm->mm_sched_cpu = m_a_cpu;
> +
> +	free_cpumask_var(cpus);
> +}
> +

This task work may take a long time for the system with large number 
cpus which increacing the delay for process back to userspace. It may be 
the reason that schbench benchmark regressed so much.

To avoid searching the whole system, what about just searching the 
preferred numa node provided by numa balancing if there is one. If not, 
then fallback to search the whole system or just search the numa node 
where the main process locates as there is a high probability it 
contains the preferred LLC. In other words, we can opt for a suboptimal 
LLC location to prioritize speed.

WDYT?

Thanks
Jianyong
