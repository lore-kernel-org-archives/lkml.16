Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020137.outbound.protection.outlook.com [52.101.189.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520128A3F5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293909; cv=fail; b=afXZ1GI/t3TQipwx5rB2XQhDsVrPsv65to7/AIvy9H39mgLjUzbEIje5R54lrt7jybWrTm73cpi3o5/vJmskXb6ixm+6vkksJXUBaLt6z+IK5rsDaIXpUiF52IWcHrxcqf0Ok/EnQ9QFqFIjzrMFSZP5hMYX2i7bcb7VfV3nZ4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293909; c=relaxed/simple;
	bh=SWGFICjo7RYJZ+v7OlJkz4N/QkzdVrAgC5fN2aSoljY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rhk5991f6p5hA8ARIqJzEfboZDnJb5Pn3fiyNsfhPOTZOHNpw9S85cskSyYE//L1gHBweydcKl4fsiTUvqUbn0XGyfU0jU9T8vCl0S+zMPdK7cGWiMABUFyNfAIN3beF9XLcp5g4nEP2/2XhX5sn6GcXr1S1jKnm/5yFdBplcEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=DRxoCRZw; arc=fail smtp.client-ip=52.101.189.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="DRxoCRZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKrLDBP4zAJr0cDYQJwQrMKKpYhlYJJ/pISDtyzLvAoAc/+fbwhT9gFuNCRw/JhrPlbZbpIYZLKI/9BIlveEJ6fi5RhPHUo7yppzeO7RNmDbhxJRH/S5cqc4Qn4axiYoPr6WzrIRJYoJ6e6nBxQ7MEcvPhUcagHUDVUOeRQDiOjNWbY+DhrkeGuoDSymyCPRjDUhA0cE1LIQV2O4PVjuWJlCtPEBlchAIHNE1eGJG9skiDHCG6YELesn14bdcqp+/O4m3j5ABnf/qO7fxhRY9qlC0FdXRmov1Iis1FE7XKVB/xF90tBGN+kNzplxMcp6XgWFo3gmQbwEut+xLgBx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBP+5/tH/p8NGzQP5CbppJbiTDwyIwpLjnS1D5DPZFs=;
 b=Sf+b/4AXuC5dWS6sDhIrowpoAGut34tmPnCaIPLT1jX/icP1mGh/6MzObQs6tsf/PRZOPhjvl666T5HOARP1p74ZTTRfMeGkfNcM6f1H99OMGQRvHSGMDL7rM3HSt1pi+LDtUYylttUeTqBaSny4B9P9GpS3zVOykd9mh3kMO3fKpMm6SGmqoztRZXl7PTwtWULpVEhR9AmzeT65k9G+bdCssC65mZzbvJuimVI/yh4HXL1+q+L9J0SYT9m6U+26Xtz9vl/xEzjDWIxPpvnoPgGtCVM3Z9dd1PCaTztowdTA4+4sqVQ8l9S+Q0uWXyQYXRaXrdZG1trlbNJqIqAljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBP+5/tH/p8NGzQP5CbppJbiTDwyIwpLjnS1D5DPZFs=;
 b=DRxoCRZwTfLvDOsXqi+MtHEww+Rs8sHtZwfUCtcegjSYcJOfrZZUvcA+Ng7hyfB16YcpC6iNDcyAacErqAt6setTGon2miZM2FbOnqiLaVlQplwrjQp5nTDz0vwk9xg+F94kWAVuj4MmQZoeEU0eRm0fjd/qsT67WZ4kymESdhgRiSj4JM6zJLIN6zOxNx1+P+axjMiIZL/GNZ79In5l0buL8K8gkDX76XXtSfgQwTf9lF8gbl04GmAL1uC2NbEN27tDp8Hma218/ieZ7QC0E4EHLHYBa3I/ohm/xz43M89vFnMgwKkKzRB1Sh9NE7O/u5BoWqvr1ctOnlFBM3MTWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9376.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 14:04:56 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 14:04:56 +0000
Message-ID: <82c5e8c3-09a5-499a-bae2-7f5c70725a29@efficios.com>
Date: Thu, 10 Apr 2025 10:04:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm
 work_struct
To: Gabriele Monaco <gmonaco@redhat.com>, peterz@infradead.org,
 Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, paulmck@kernel.org,
 shuah@kernel.org
References: <e916f393-b18c-4641-ace7-cf23b7508e09@efficios.com>
 <20250410125030.215239-1-gmonaco@redhat.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250410125030.215239-1-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::33) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de9b5fa-1fe2-417b-1ab5-08dd7838ac0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWJmcFBFRjBIdzlXMTNORnEvangwV1pVTUMzSnN1SUZ4TjU4bnBYVnVpSzdv?=
 =?utf-8?B?Mk5pV2NjekZobDdJTjJObEp0UlgwUDgrdHJDc21xSkRRZjhHUG9NeGhQS2o3?=
 =?utf-8?B?SWptNTBMTnJqc3BiL3gyNGNZcTRwbHJuZ0V1OEQ0K3krRldlaHROQjZMU0hl?=
 =?utf-8?B?NjcrQlR5ajhDcHZ4UWZSQUxlYWlWUG8zVVVVQ1p5empMcUhtUzJZUW1tNzdt?=
 =?utf-8?B?b05NdU1qNWZUN1VDK0dZZS8xc2VGSXpPdzRSeS9WV1ljZUFLcnZqbXBhNk1S?=
 =?utf-8?B?cHZ2N295SXA2TFE1aVpBdXFqRkRhNzV0dUpwdnNvb3hTZjF5b3hMRDd4NzdF?=
 =?utf-8?B?eTNNbFRYU1F2akMxRncxd0RITVpOdHlmenI3RjNzK3NLc0orMCtQSm5KZG0w?=
 =?utf-8?B?ajltaWxrU2owc1FTc3RFTGRNNnRtM2xPN1NjdDZFQjFkOHc4RzgxTk5QK2cw?=
 =?utf-8?B?ZkpyWEZ5VUlROStQWWJ0Z0M1OHZpeFozSlM0YnZxL2paZTNVMmRjM1dYTFFF?=
 =?utf-8?B?WCtxcHQzbWVuY2FWQ0o5THRCck9XODRMZkEvcXJBSmZuRmxXTVF4ZDU2Ny8r?=
 =?utf-8?B?UWlIQjRjVWg2LzNleU51NnEyMkFSM2U4S2VvUzBmRCtNblAvRVVtcEJHRmdw?=
 =?utf-8?B?dU1BekM5MmF2NEtENFJIYnZLUnRTMTZCVEFESHpLSGlOWStIQ3ZrNnFkeGVD?=
 =?utf-8?B?MUtmbVVKZWMycnFIeHd4dDBocWtRb2pzaEZYZzFYVDA3eXVFTlNPRWh2cGox?=
 =?utf-8?B?WFpPS0VFRFJOQllDVTliNDk3MFFXVFlaMlM3aUE3VGozQjZDYnRma1NUeDM2?=
 =?utf-8?B?UTg4eXordXBWclRrN2ZaZjlqa2F0Z1dLclU2NDE1NUVVdXNzTHA1V0I0RkJ1?=
 =?utf-8?B?K3l5bmhOaTZUOTlpZWtNdEx2SXA2bDhNazVMeGk4UFkvLzh6eGVPR0tKbGJU?=
 =?utf-8?B?NWNuUE1IcSt5TGhqY3l2ZE9NYzYvS3RlR2RNSlZVNUdjS2RBeWxEYmgxYmZY?=
 =?utf-8?B?REdsejB3RG1GUnNGMndMWTB5VHNVaHFTNjlQVlZpQkFFQjFBYXVrbzdaTG85?=
 =?utf-8?B?Rkl4djNET3Qxai9RcFdldFk3L0JRY3lldjBoUGdLdFA4dnNyYkZ4QjVPQmhT?=
 =?utf-8?B?V2hxblNDRlVmY3JJYjY0dUJOampHRlVON2dkMzQzNFVMN283NEdMREZyL1N1?=
 =?utf-8?B?cFFTcDJkSG1ZbHhtYUN3YkNDSVdCaVQzVC90VDMrbFcwa0FzVGJWWHFmUVBv?=
 =?utf-8?B?R1YzQm92WjJUcUNlR1pjSE9tMlNHMUFhdUlZekxuVE43R2JSdWFCQWZjNEQ3?=
 =?utf-8?B?SU5KZDdGOW9sRU05b3BCVUlrYkZ2Nk5SSjY1SW5zQ3E1dlhxdXRaU1RUdDJB?=
 =?utf-8?B?WS9EVC9TSkhzamxhenBYYXR6MjBSRnZYNGIzKzYrb1pLbGxFeE45ZWk2a2s4?=
 =?utf-8?B?ZzRJZHp5cDRQZ012anhPNUVUMzc1RmdORWZwZEpiTldRSVpTeEpJZWVUckJS?=
 =?utf-8?B?Z1pCcSswQXcvMnhKcWtXVGoxU3dsWFlEejcrZnJ1WkJUNWZyb0h5WnhOQTU5?=
 =?utf-8?B?R3RWaThTQzNVM2k4UzdNQmlVak44QkRLVXJIdlVqNTNsUGMxMmhTcjFCcmlZ?=
 =?utf-8?B?Z2ltTC9LQXNFVytrTlhoWU9vY29NcVpnVm9UVWRUUVhwM3FCcGtxTFZ2eVcz?=
 =?utf-8?B?Wjl5ZDJaR2lPSnJ2bnBTNVRZOFh6cjlzZjlmbi9wNDFlY2hMSC83ak5ha0VN?=
 =?utf-8?B?TUFCSkNPeXVOaE9LMll1bURHTThVbHVFMUgvTHVkakc4OXdVeWFkN0IrVUtw?=
 =?utf-8?Q?Jxtq/ein+n4dYWNqI1aFRSXz/LnTd+EjcPScs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpzbncxa3J1Z2NXRGVpU0RZbitweGQ5eEs4WFFPSjVaTGFPWlNnVWM5NVQw?=
 =?utf-8?B?NFB3V2dBZGJXQlhvNmMxSDNvTVpBa1FpczFERXdKQjVFUURuSnJkQVlnejRF?=
 =?utf-8?B?Q3BsZnZUbHFNMXQ3WHRuZmpialRFSkFsYUxrdmNtNUpIaVVrOE1yVk0xbm1L?=
 =?utf-8?B?ZjU1emxGTk9GajMxamlhVno3V2s2Vk1haDN5YWNrUDN4dGxhVG0wYTlRWVFI?=
 =?utf-8?B?VUlaRzZmdWM0RUVlUTJIWHJUMktQd3h2R1VIbCtXd2k1eWF6b0puMDZkMHp3?=
 =?utf-8?B?Y0s4djgzMm9mSTN6NllUYUJWV3BTdkNTRDJCd1IvNElKK0NRblZEUFlZTHlZ?=
 =?utf-8?B?RHhQZXFPMHBSMTJGUWFwbHJHUEIzcTA4RUQwTlhXbTFzTjh4dUFLQ3ptbkp2?=
 =?utf-8?B?MUhwNkpwenFyOUJpMlJVWXJpTjA3MlR5UkY0QlpPMHcxNUZKa2grTm8xZEFM?=
 =?utf-8?B?TUlxOFhLdmxnajBTdVpjOS9HYjlPZTNjOGpWWk1abS9pbVVreWlPQUxIRkNZ?=
 =?utf-8?B?QlcyeGVybzA4bEt6YVgyYlVWOXhSMDR1R0Q0NVhKOVJMYVpSN2E3cTNIaDF4?=
 =?utf-8?B?VkNpQ0ZtM0krbStnSGlUMkFqa0hqcmNQUHIxZi95YzFFcFZaSkd0aWNnYjg5?=
 =?utf-8?B?dkJ2MUkxZEtVSmRiNUUwU3BYRkV1OEwzL3YyV2tGeUNlRmljaVlubEdDUDNz?=
 =?utf-8?B?YTJEMHJiRlBCWlhXT09tQ3E5bDVNTEhEa1pZNDM1ODZFOWhJNTJaUHdIci9V?=
 =?utf-8?B?UGJyT2JWazEwTW9JQlBPcTMraTUxVWpqcGRDSXN0Zlk2RHIxc0FLT3JtbFln?=
 =?utf-8?B?WW04UFFGZkpoMnNWaVY0OGdmVjN6d3FCMjVWc1IvUlh1WlRacUc3Z3ozOU16?=
 =?utf-8?B?a1pxSkJxU3VwekluS3JmZkV1dWtQbVV1RDBXMGcydW44VkZqRUhBWFgyWG9o?=
 =?utf-8?B?MktPcGlBaExVOGt2MFRUSldMK2xvV1ZvelcyL3FjZ1dVVzhwUy9WYWtoWjB4?=
 =?utf-8?B?QW44a3dCTXlPRDlzZmVlclNTc0dOc205MEJPTDN4amNHaXp0VHdGeFZROFR4?=
 =?utf-8?B?bU9veUxvREV3SDRpSmdLK1N6NjZjNUMrZFVqQVpRM01vTzRyVVQrVEZLZjc5?=
 =?utf-8?B?U1NZL1lTa3lUU1hudW8ralVVd1E4cVE0RXpRaUtyOWtZNFMxb1BkYVp4bWZw?=
 =?utf-8?B?T0tsU2N0ZmMxU2hXZEM4NWxVN3F6TmxaSFlxR1hBeGNhYlBlbGF0SUQzMmtt?=
 =?utf-8?B?dllWUnNBaUlKSHR3emdOVWUzL2FrK3BVM3BCR005NjlyTHRvZ25rTGZDbnZD?=
 =?utf-8?B?SUtqL1RiS3ZjQnhWNG5lUHFqZFpSOVl6NmFuZWZiUUNhZmlCOTRQSTAvYlZl?=
 =?utf-8?B?MGxldEpmOVRYb00xRDJKbDVZdnRkbUZ3SmJvY2FrbkpROUJNZG1ST2o2dnRh?=
 =?utf-8?B?ZUpLTEZ4UW55MGJKQmc0U2JsNmZRSVppc2pSTUJTM09zSmlrRWVTMW1RK0Zp?=
 =?utf-8?B?ZGhsTVF4dlhCWDdIMlZ5SzhLckZHbHlpZ3piVitFcXJWNGEvbFhkcE9Ca2tK?=
 =?utf-8?B?b2pwODlQcVpMSDUxYVRWMWhqak9ERHFsb1pTTnZBa0xkbHczT3VKZjlleWQ5?=
 =?utf-8?B?UlF1T3BLNitOeWZrVmpLbnI0SnIrejE2ZFM0d1drTVhrVlRsSGEvNjI1Q3NI?=
 =?utf-8?B?MWFYeUF6eXNGWS9lVDhaLzlIOHpIMUI4YjVJRC8vR2U1Z3NJRjRTL1VYaHRM?=
 =?utf-8?B?bnE4ZVptT1pNUW12M29MSWIvcUd4cU5IVWh3NkRqWWlUU2FXRU5SK1FpaGoy?=
 =?utf-8?B?NUtkcHVVeGZHRFFXSUE4Z1UvT09WV0lQUmk5US9FVTBFRFhySlBjRnRIcXZT?=
 =?utf-8?B?cUJLN3p6Z20yaGNXdDJ3RC9LSWt6YnJnMmNCclI3TitiTFp0TDh0aVN0b1h6?=
 =?utf-8?B?R09BWEFRMTB6NGF2VytFZFNpaFRwc2ZucmxzYnRwaGNIZnRWYTRZNUswMlBG?=
 =?utf-8?B?MkJXbjNJR0hwLzN6eVZsTFVsWHQ0MkVSRXBEVkZCK3Rvamt5QWJ5QUkzWTlX?=
 =?utf-8?B?RnBBUlF1NWhScmFta3NNZDFsWndhS1k1N0pFdkt1QXNyMkRHSzRZeXJmR0lq?=
 =?utf-8?B?clVHR2RKRkgzeFdaZTNpQXJqK0dsSVJZR2N0TkNzWTRXeWtRQ2lkZGhHQklq?=
 =?utf-8?Q?OKjRjckDFhB8f9mPQKq9WeQ=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de9b5fa-1fe2-417b-1ab5-08dd7838ac0e
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:04:55.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLYU2iyTXRMVZ7eKXqV4umeIt8eqQz4O6QfiQCfnnQNm5cKCPD99KaBdcAFbLuQYwZJ+g+/YLAwE8cmMKxu38j3q5X6ffwDVhGb0I3ajeIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9376

On 2025-04-10 08:50, Gabriele Monaco wrote:
> Thanks both for the comments, I tried to implement what Mathieu
> suggested. This patch applies directly on 2/3 but I'm sending it here
> first to get feedback.
> 
> Essentially, I refactored a bit to avoid the need to add more
> dependencies to rseq, the rseq_tick is now called task_tick_mm_cid (as
> before the series) and it does the two things you mentioned:
>   * A) trigger the mm_cid recompaction
>   * B) trigger an update of the task's rseq->mm_cid field at some point
>     after recompaction, so it can get a mm_cid value closer to 0.
> 
> Now, A occurs only after the scan time elapsed, which means it could
> potentially run multiple times in case the work is not scheduled before
> the next tick, I'm not sure adding more checks to make sure it
> happens once and only once really makes sense here.

The scan is gated by two checks now:

> +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
> +		if (mm_cid_needs_scan(t->mm))

And likewise for the periodic check for preemption:

> +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
[...]
> +		else if (time_after(jiffies, t->last_rseq_preempt +
> +				      msecs_to_jiffies(MM_CID_SCAN_DELAY))) {

Those second levels of time checks would prevent adding significant
overhead on every tick after the threshold is reached.

> 
> B is occurring after the work updates the last scan time, so we are in a
> condition where the runtime is above threshold but the (next) scan time
> did not expire yet.
> I tried to account for multiple threads updating the mm_cid (not
> necessarily the long running one, or in case more are long running), for
> this I'm tracking the last time we updated the mm_cid, if that occurred
> before the last mm_cid scan, we need to update (and preempt).
> 
> Does this make sense to you?

It makes sense. Note that it adds overhead to rseq_preempt() (a store
to t->last_rseq_preempt), which is a fast path. I don't know if we
should care.

Also part of task_tick_mm_cid could be moved to a helper, e.g.:

static
void task_reset_mm_cid(struct rq *rq, struct task_struct *t)
{
         int old_cid = t->mm_cid;
         
         if (!t->mm_cid_active)
                 return;
         mm_cid_snapshot_time(rq, t->mm);
         mm_cid_put_lazy(t);
         t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, t->mm);
         if (old_cid == t->mm_cid)
                 return;
         rseq_preempt(t);
}

Thanks,

Mathieu

> 
> Thanks,
> Gabriele
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>   include/linux/rseq.h  | 14 +-------------
>   include/linux/sched.h |  1 +
>   kernel/sched/core.c   | 42 +++++++++++++++++++++++++++++++++++++++++-
>   kernel/sched/sched.h  |  3 +++
>   4 files changed, 46 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/rseq.h b/include/linux/rseq.h
> index d20fd72f4c80d..7e3fa2ae9e7a4 100644
> --- a/include/linux/rseq.h
> +++ b/include/linux/rseq.h
> @@ -7,8 +7,6 @@
>   #include <linux/preempt.h>
>   #include <linux/sched.h>
>   
> -#define RSEQ_UNPREEMPTED_THRESHOLD	(100ULL * 1000000)	/* 100ms */
> -
>   /*
>    * Map the event mask on the user-space ABI enum rseq_cs_flags
>    * for direct mask checks.
> @@ -54,14 +52,7 @@ static inline void rseq_preempt(struct task_struct *t)
>   {
>   	__set_bit(RSEQ_EVENT_PREEMPT_BIT, &t->rseq_event_mask);
>   	rseq_set_notify_resume(t);
> -}
> -
> -static inline void rseq_preempt_from_tick(struct task_struct *t)
> -{
> -	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
> -
> -	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
> -		rseq_preempt(t);
> +	t->last_rseq_preempt = jiffies;
>   }
>   
>   /* rseq_migrate() requires preemption to be disabled. */
> @@ -114,9 +105,6 @@ static inline void rseq_signal_deliver(struct ksignal *ksig,
>   static inline void rseq_preempt(struct task_struct *t)
>   {
>   }
> -static inline void rseq_preempt_from_tick(struct task_struct *t)
> -{
> -}
>   static inline void rseq_migrate(struct task_struct *t)
>   {
>   }
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 851933e62bed3..5b057095d5dc0 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1424,6 +1424,7 @@ struct task_struct {
>   	int				last_mm_cid;	/* Most recent cid in mm */
>   	int				migrate_from_cpu;
>   	int				mm_cid_active;	/* Whether cid bitmap is active */
> +	unsigned long			last_rseq_preempt; /* Time of last preempt in jiffies */
>   #endif
>   
>   	struct tlbflush_unmap_batch	tlb_ubc;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 52ad709094167..9f0c9cc284804 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5663,7 +5663,7 @@ void sched_tick(void)
>   		resched_latency = cpu_resched_latency(rq);
>   	calc_global_load_tick(rq);
>   	sched_core_tick(rq);
> -	rseq_preempt_from_tick(donor);
> +	task_tick_mm_cid(rq, donor);
>   	scx_tick(rq);
>   
>   	rq_unlock(rq, &rf);
> @@ -10618,6 +10618,46 @@ void init_sched_mm_cid(struct task_struct *t)
>   	}
>   }
>   
> +void task_tick_mm_cid(struct rq *rq, struct task_struct *t)
> +{
> +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
> +
> +	/*
> +	 * If a task is running unpreempted for a long time, it won't get its
> +	 * mm_cid compacted and won't update its mm_cid value after a
> +	 * compaction occurs.
> +	 * For such a task, this function does two things:
> +	 * A) trigger the mm_cid recompaction,
> +	 * B) trigger an update of the task's rseq->mm_cid field at some point
> +	 * after recompaction, so it can get a mm_cid value closer to 0.
> +	 * A change in the mm_cid triggers an rseq_preempt.
> +	 *
> +	 * A occurs only after the next scan time elapsed but before the
> +	 * compaction work is actually scheduled.
> +	 * B occurs once after the compaction work completes, that is when scan
> +	 * is no longer needed (it occurred for this mm) but the last rseq
> +	 * preempt was done before the last mm_cid scan.
> +	 */
> +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
> +		if (mm_cid_needs_scan(t->mm))
> +			rseq_set_notify_resume(t);
> +		else if (time_after(jiffies, t->last_rseq_preempt +
> +				      msecs_to_jiffies(MM_CID_SCAN_DELAY))) {
> +			int old_cid = t->mm_cid;
> +
> +			if (!t->mm_cid_active)
> +				return;
> +			mm_cid_snapshot_time(rq, t->mm);
> +			mm_cid_put_lazy(t);
> +			t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, t->mm);
> +			if (old_cid == t->mm_cid)
> +				t->last_rseq_preempt = jiffies;
> +			else
> +				rseq_preempt(t);
> +		}
> +	}
> +}
> +
>   /* Call only when curr is a user thread. */
>   void task_queue_mm_cid(struct task_struct *curr)
>   {
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 1703cd16d5433..7d104d12ed974 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3582,12 +3582,14 @@ extern const char *preempt_modes[];
>   
>   #define SCHED_MM_CID_PERIOD_NS	(100ULL * 1000000)	/* 100ms */
>   #define MM_CID_SCAN_DELAY	100			/* 100ms */
> +#define RSEQ_UNPREEMPTED_THRESHOLD	SCHED_MM_CID_PERIOD_NS
>   
>   extern raw_spinlock_t cid_lock;
>   extern int use_cid_lock;
>   
>   extern void sched_mm_cid_migrate_from(struct task_struct *t);
>   extern void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t);
> +extern void task_tick_mm_cid(struct rq *rq, struct task_struct *t);
>   extern void init_sched_mm_cid(struct task_struct *t);
>   
>   static inline void __mm_cid_put(struct mm_struct *mm, int cid)
> @@ -3856,6 +3858,7 @@ static inline void switch_mm_cid(struct rq *rq,
>   static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
>   static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
>   static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
> +static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *t) { }
>   static inline void init_sched_mm_cid(struct task_struct *t) { }
>   #endif /* !CONFIG_SCHED_MM_CID */
>   
> 
> base-commit: c59c19fcfad857c96effa3b2e9eb6d934d2380d8


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
