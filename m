Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020110.outbound.protection.outlook.com [52.101.191.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E3244195
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203770; cv=fail; b=q0TRslUT7ocKeD9521IvFxwSTy5W7CoK5hzV9NVhCfxeWUWidA/2pD/vhGu2aBg4GeBdssmfEo4AzAC/VubFS+1j0eF5MCRjaLIf1KkLGJodESCILvcjE7kiC0NNxaUxcmrOHODQu1a2iZxhCf3Oiguq62jqoMGH0ygiY/RegzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203770; c=relaxed/simple;
	bh=i4BfPEhK6pUfjQa2A3ogzFnwC5O0zoNDPYoPyVclcek=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dB0ZOoqd/W6ZyBr6m0GTUFEAToISIdBeyYTxVk8yP42GOxFLBIhwQVTKvfE+WB4V9LdOYJk7q2+LeuAOPkxC17tn8/Q1TreQ9Wkc0lAmZbPZuYDyspuA4zTkbS7oVnnD71mXBJQdG7Ths9a2SuiwT07ydbMR3DBL2p09BwV3uLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=shKt6kX3; arc=fail smtp.client-ip=52.101.191.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="shKt6kX3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcWxnsmmwlI5ojXuqbF/olQTmE+Z4GIOXZpDDRvKhAWmtI53AHCAapg6T+xvPBZBEfK3isAks9noMvo1m4LGkvCvSmLpUO+BK5Id6OshWwd3CzuAofG3xB/YVE0fJd3Rkegz5/iGrN0bgU1Nj1sfmKYRvmj+OJ+ElFpmv7I5AJ++nP1Wcpm+Y0Fvo7MXArQzm9AfbiKShdDkpERcrjnj6J7aHVahdDuFYIj0OBy7qiGWxQPf67Dltd5FLAEkfH6HtCTEggTJieSbVQObjqX4StMfx0kLtcXqU+Iu44Rw+0YvygG/DxNiRRb2cQ1Br9xr1+gkRzOod2Cw847nitkThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAH7jm/eaUTFDWADmMRO+tWAQwTO5e2EdyV9v51qJF0=;
 b=F+H3ecxbhB8FofYC39k8d5TOnZ4tMas4hctHWjOTuBzW/9htWE6DXIzd9L/PiA8oJ2AFEpCk1S/KQX1VCgsQgmTTaSEKtXIc5TmbAtKY6Wuk4EkmsLsEc0dTt2y+sm0pZCxtK7qXWRJ6dsylmu+TWl2pARZuYdmtN8wegw0+QgJBh7XFo6DOQk4gM1wrBLJWoqt0sDLv+8v3riKTSGzMs/S6hn/s891TFwCuB9itfXndwnRLRwGCbckd+PkOPkVYTJ/ohkR1uz5zMNkdmrYKwpEpwllg+S/nGHik3noGQa34OGYe3HbiwhoCvM27+tazcPxvVN2p6U9fLbT7HJJDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAH7jm/eaUTFDWADmMRO+tWAQwTO5e2EdyV9v51qJF0=;
 b=shKt6kX3yPyWbHyE2h5R3qZd6X1XPCf/xM6v5Cga7vFPMznrXQz+sSmEtSp8YtG82iSqIza1rYfZwIH6iR8dcXrrq4ah52p1Y4cIlrXyZ3QooJ+atmIg0AoiwwOAJmPjbRRLWaO8iwE0U5Aw+Qx7x7g30RmBHEAaHIvxkiXdCSm9ciA9yIn0KDBiQ80O+VaOW3OFyGQhaR4FWJl2OTtIj4fm99O8F9STy16jbpmyp5nB3ohrIK7o0t63fwEIL49Ias4t5M2ccMk26fZPMWBDbwycZ9A5aaNJMuHWGQlZKuz8XlPCWb1wqTUSClDQs6JUNwOww35qFeTOFVOAbV0nOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT4PR01MB10421.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 16:09:25 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:09:25 +0000
Message-ID: <efa8561c-b417-4b75-b93a-f149c35335b3@efficios.com>
Date: Mon, 10 Feb 2025 17:09:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] sched: Restructure task_mm_cid_work for
 predictability
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>
References: <20250210153253.460471-1-gmonaco@redhat.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250210153253.460471-1-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0011.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::22) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT4PR01MB10421:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a8b8b3-9df0-4a6a-54ac-08dd49ed49ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkhXSkhCZHY5eU51TUdJbVVpdjNORC81em9YbEFvWlVCZzRHZWE4dHQ2OGY2?=
 =?utf-8?B?V1lIVDdZQ3BmSDhzaXdINEZ4VmxmVEFuajd1Z1lMM0crc3pRTVM0YlJJMGlK?=
 =?utf-8?B?QVF6bWcwVXZSNXZibVZ1SWpWdGtWMmtGeFRETGpVODQ3NVhSTWlwYUFuQXJl?=
 =?utf-8?B?UGlwYU1NSHNUQlJNU2UzY2hyVFVqMUVSOGZWVWdiVXZSNWZpOGpMeGh3WUsr?=
 =?utf-8?B?UDluanpMZ3c5dXAwTk15YlJHNHJUdE9pVEpCeERBdHpPMVRIMmY1a2gvdGRm?=
 =?utf-8?B?N3hDaVduKzRBK2Voc3ZiUHpCT2hTYVJTVWNOaU5KWlQ0RGVBeVRwMXNsYS9J?=
 =?utf-8?B?dU04Z2RNTUJ4amc0dzN0bUVFa1JHR3dCZXpoTUNyUXo0VGpJRVpLTVI0c01k?=
 =?utf-8?B?ajZrNXJDemd2NDlKc0RSRk5Wd1gyZkdTMkZZUWRDSllyZGY0b0lVY2w3QUxE?=
 =?utf-8?B?ZVJaS0lEYVNNS0pLR0pEY2IrTVNOejR1dTNjNVJ4ZXVHS01hOUR5R01ydU5z?=
 =?utf-8?B?RXNoSUdDcUl4SVpndGdlZ2dwSWhqL2VCbk02WEkzRjZoWlJtczlFcUt0Z2tO?=
 =?utf-8?B?bkdmUUhzRkNCajhFZkVkQkNMZ3UyKyt0dzRYclNQVnJaL1dKZUFIZDRIcW1D?=
 =?utf-8?B?NHZDRFdPUllBanRvSFYzczlZbkVsUEZRRTA0dFJxN2lyU0hMMlBKWFNhTDM5?=
 =?utf-8?B?YVlVRGdkT0Y5OGtzaXh2anptaEx6VEZGYkpTOEJGaFhmSlFxWTYrQUU5SUFa?=
 =?utf-8?B?RjRrNi93b01Gcm5yMkJTcWFMTkJhem1FRFIvVWprZTY1N245SVpad2dlbW5S?=
 =?utf-8?B?YU04bFlPeFpoVXk3djZiN2x6ZFBkWHNxMXZNM2hJNHo3Qkx0MzBIQWlkQmx2?=
 =?utf-8?B?YVgzSGg3S3JkOWlxMVBJMU82OHBDcW11MDRETVZPQm9FancxTE4ybVdONity?=
 =?utf-8?B?VFFNVkE5bHdBZTNYQlIrSXRjWXZEcjFuc3JPeTBqelhYZGZERUJKMVFBNmhz?=
 =?utf-8?B?V2tyOFNGUkE3RUIrekcwUkxwZ3hRVjRCQTZIVmNGOVA3bW1Gdm01bnVzcVBj?=
 =?utf-8?B?TCsybTloNzdMRXVTS1ZzSnJLcWFkQnlyTDh6aXVaUjRLWnNNV1g2clpIb21p?=
 =?utf-8?B?QjFReC9ROWNFWUlwSmtsTTFxZWM5NDNSTEQxUkVOMUZvc3hqa3pvM0tuaHpL?=
 =?utf-8?B?amltSm9mWk9tTDNUVDZBekU4WWRCeEhrMTU5cmUxaWF5bmlZelpuMXF6YTlL?=
 =?utf-8?B?MXgxS2JoWUUxSkdDZzEzZEJZbmhpU3Z2Q0JZNWNlelpXTk83aGhxN0dPa2Ir?=
 =?utf-8?B?UlZsNWN2VGFTMlBQQ0pvZ0xYRUJIS3Z5dENzY0kwUDdncjR5YmhySnNkUkxz?=
 =?utf-8?B?WTI4NmVkaVk0OGViVEVGa2NraTZtS0pRSkd5YjRwdHNsSUE3anBZNVZsMjV5?=
 =?utf-8?B?UitjcFh3QXFqNjdwNWczOVJOckwzT2dHdzVxMVl4THZ3M1dlQTJueGQ0VW9k?=
 =?utf-8?B?ZTlHY2xuOTR2RStKZWkxR255UVNZVzhTNE1VRGM5VzRKUmhyQzZGcmRrUjhy?=
 =?utf-8?B?S0RCbERVS3cxWktKTlRsMGlkQlZEcW41bHI2UHFuTytRUU91dlpVVmt4d0sx?=
 =?utf-8?B?LzUvUUpaSS9BL0NYaVZ3S0cxTUl3MjgzaTBWMTZEM1U4ZFZ4NldVNk9iRW9D?=
 =?utf-8?B?c0orNWp6amxtQXZhcHlaVFMrR0Q3WEdsWnZpemQ0ZG13UGgvYVNhc3hQOUdo?=
 =?utf-8?Q?TWmnXPkmDjvsdhgsZN/JkTKxcVD4V5O8upVlwsy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1reExWY0pPSWs4VTFucE9oQ2pJaktsN3g0VlVONXZRaWxVbnNXb1d0ZnZR?=
 =?utf-8?B?SGh0Y25pSDJGTWV6ZGxKb0VBUXV6NTBlRHlhK2lZcitzU2R3NG9ndW9SNkpo?=
 =?utf-8?B?T3pjc2Jra2RWcWhoRW5SeWRuOXFDUEg0ei9VR2E2S040YS92SjB3QXNBTGRR?=
 =?utf-8?B?QjVxcGhHTXRENVhTbjVhYlJVOUl0NFJVVEN0N0NTWERMQ2ZWbW9KaFZRZnJ5?=
 =?utf-8?B?WnU2L1YvTW11TEk0WVFyZ1ZDeXhySm1GYUQ4b0JzSGxMVWxrME4zdlBtWGRR?=
 =?utf-8?B?eWZzNEhEUS94UDNacm4wSjFER1dZdEZSZDdzTmdKNTRZL0FYTmNDMkVQYVFx?=
 =?utf-8?B?eUNPajNCaHp0TERDR1prYWxIRjJFbHAvdnRUYkF1VUV3Vk1UdUdXU2lpUlN0?=
 =?utf-8?B?VnhPUTlUT0Q4SDk4bklhL1JNRzZwSFc1TmJKZCt1TGgvd2tOYkN0NTQ0Vy9B?=
 =?utf-8?B?MkUyMnJLTUk2VjVXZUFUek1pSVBTdE9EVzhxRURwcVFmMHdnbzFhT1A1ZUtj?=
 =?utf-8?B?RWFHNlJyY1NBaUpIcTVITTczM0FRNVM2SVM0eFplcmhWSjB0bWM3UGxOR294?=
 =?utf-8?B?cHVZc3lBbXVDYmw1K2psbWxFUGp1UjhZVzQrK0p3Y2FZUUt6Z3N4MER3aGUz?=
 =?utf-8?B?TUl4MW5KMlcrOGdScjJSc0R5Qmt4N0ZmSnd5SWJ3ZWxSaisySUpidzJOWFlx?=
 =?utf-8?B?M1JNdnVhTlFDTW9HaWFiRzd5UWlNZzlGWmFPTXhiY3U0bGFxV29BZHk4MXpp?=
 =?utf-8?B?cXZCWG4rUjZ4WXl3QXBieDdRVGNNNnlRbUtzVVFORHZPS1FWVHRHTE9sV29l?=
 =?utf-8?B?TURzd0t3MmNHUmhKTENIMjVuRDhlWDlHQy9Za2pYQTlLY0d0aTZuYXRmOGFQ?=
 =?utf-8?B?TnppTDhUQkhsZDdpL3MwUTV6QkdBbSsrOWtKQ3FPVVlWUUhFTVlGdGhoMmpR?=
 =?utf-8?B?Q1ZNYjVaZTFTRjk5Z2VzNlZLVHhZNFJ5NmF5MUMxQkhpRlF4dkEzRlByRTEr?=
 =?utf-8?B?bTFYdFZMbU5FbDBYbUlPMXVnc3RzR1VaenlUeVI3Y2lzVjczYjZudmZPS29u?=
 =?utf-8?B?M0RGR2xuajN5MytyNEMwQVBsaUhNdUlZejhUODZyNXUrdk13RFJFbmFmY2la?=
 =?utf-8?B?enIvQmp5ZUNBenRCb0VyTzMxTUkyWkp3b2g2aUs4UTA5TWhPUUNsNTY1b3Ay?=
 =?utf-8?B?Njd1ZnorUzM3WDg1MER4SFFsTXI1QVRveGNqSjlROFdjNndXZDJFMnA0YjNk?=
 =?utf-8?B?OGVwa0U3TGFXcEU0VTZ4RWk0NU1wNFNnVEVTSjV0Um1OY3QrczlxSURTVEl6?=
 =?utf-8?B?NE5ORVhiTmVDWDRkSTZqRllFbEs1NUJCZ3VRQ3kzVGtXMWZ3WmFkY1JobmxQ?=
 =?utf-8?B?MlZ5WjZwZjhUcTN4TWVIdE9XVm9qK3R0NnVIcHZ5VzZvQ0pZVlVvNHZtSG54?=
 =?utf-8?B?REJMcTM5RHNzSTYrbXphdUg2MHZ1cFRGa21oaWdsMDBmN3NnSlh1SVE3NkZ0?=
 =?utf-8?B?aHBUeTBub1c3VTdlb0pWcUY3UEd5OWZhUEI3T2VLUDBaYkpqNmFqdlovV2FE?=
 =?utf-8?B?TmMxVVVIZVJubWZ0VXEyL29RRDAxRU1lZER2UFdFZkxrdyttMDdLV3Q1Znc1?=
 =?utf-8?B?TWFtdXYrZEFqaWpiWjRYVHJjcWdUYVRwR3QreXBBS0F1dWJ3YmRINTRQbDAr?=
 =?utf-8?B?clkzNWtTcStOMnFtT082UFRHdlU4K2svb0l1eFY4WDYybG43Q1cvUmJHT2xF?=
 =?utf-8?B?T0l0dnR3UzlOWWt6OEJuRHZvdU9IY2hzR0tPOXV2K1dmdlNqcXo0ZUdOSzlT?=
 =?utf-8?B?SS9YR09sVU9FSE5FVW1CRjJyNVl2dDJzNGE3RDRIUysxUURiVDFtcDQydGdn?=
 =?utf-8?B?ajBzcWNOVm8xNGJSNHBLSmM0Vng0MHhvRCtYb2I2SEFqeTBSVGZvZTM2ZnFw?=
 =?utf-8?B?ZGtRUWFGM2s4WGZzczI2L0YwanZXNFBhYXJuYlFEb2d1TDZJVjA1SXo1Tk5q?=
 =?utf-8?B?aXBXaWlDTnQ5VG8vL29oc0ZFZTM4bFJIN0VLcFhBRWhlUUROOXN1WTZ1ZkFR?=
 =?utf-8?B?WWFrdGE4ZGRDSStlUllBb0lIUVp5UUlmV0xhUUdsVE5vQnNtVXZFS2x3SHJP?=
 =?utf-8?B?dysrZVhsQ041dzBJUkZURVBKUnFUZ25XblRQWnp4OG51SHpnS2NKbHNjbDJB?=
 =?utf-8?Q?m+yece0NfBDiuibPz+wTicg=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a8b8b3-9df0-4a6a-54ac-08dd49ed49ff
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:09:25.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJl5ABdmcIQLfTulzUb0i5Bbdod37VJ+znWRJ10HOY8BRaOnctlpQprh6dNVNWl3iQFlW7QBL7Don4KQlpJemqhFmA3QYWcyUdHTtxQxlPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB10421

On 2025-02-10 16:32, Gabriele Monaco wrote:
> This patchset moves the task_mm_cid_work to a preemptible and migratable
> context. This reduces the impact of this task to the scheduling latency
> of real time tasks.
> The change makes the recurrence of the task a bit more predictable.
> We also add optimisation and fixes to make sure the task_mm_cid_work
> works as intended.

Ingo, Peter, this series is ready to be pulled into tip.

Thanks!

Mathieu


> 
> The behaviour causing latency was introduced in commit 223baf9d17f2
> ("sched: Fix performance regression introduced by mm_cid") which
> introduced a task work tied to the scheduler tick.
> That approach presents two possible issues:
> * the task work runs before returning to user and causes, in fact, a
>    scheduling latency (with order of magnitude significant in PREEMPT_RT)
> * periodic tasks with short runtime are less likely to run during the
>    tick, hence they might not run the task work at all
> 
> Patch 1 allows the mm_cids to be actually compacted when a process
> reduces its number of threads, which was not the case since the same
> mm_cids were reused to improve cache locality, more details in [4].
> 
> Patch 2 contains the main changes, removing the task_work on the
> scheduler tick and using a delayed_work instead.
> Additionally, we terminate the call immediately if we see that no mm_cid
> is actually active, which could happen on processes sleeping for long
> time or which exited but whose mm has not been freed yet.
> 
> Patch 3 adds a selftest to validate the functionality of the
> task_mm_cid_work (i.e. to compact the mm_cids). The test fails if patch
> 1 is not applied and is flaky without patch 2. We expect it to always
> pass with the entire patchset applied.
> 
> Changes since V5:
> * Punctuation
> 
> Changes since V4 [1]:
> * Fixes on the selftest
>      * Polished memory allocation and cleanup
>      * Handle the test failure in main
> 
> Changes since V3 [2]:
> * Fixes on the selftest
>      * Minor style issues in comments and indentation
>      * Use of perror where possible
>      * Add a barrier to align threads execution
>      * Improve test failure and error handling
> 
> Changes since V2 [3]:
> * Change the order of the patches
> * Merge patches changing the main delayed_work logic
> * Improved self-test to spawn 1 less thread and use the main one instead
> 
> Changes since V1 [4]:
> * Re-arm the delayed_work at each invocation
> * Cancel the work synchronously at mmdrop
> * Remove next scan fields and completely rely on the delayed_work
> * Shrink mm_cid allocation with nr thread/affinity (Mathieu Desnoyers)
> * Add self test
> 
> Overhead comparison in [4]
> 
> [1] - https://lore.kernel.org/lkml/20250113074231.61638-4-gmonaco@redhat.com
> [2] - https://lore.kernel.org/lkml/20241216130909.240042-1-gmonaco@redhat.com
> [3] - https://lore.kernel.org/lkml/20241213095407.271357-1-gmonaco@redhat.com
> [4] - https://lore.kernel.org/lkml/20241205083110.180134-2-gmonaco@redhat.com
> 
> To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@kernel.org>
> To: Paul E. McKenney <paulmck@kernel.org>
> To: Shuah Khan <shuah@kernel.org>
> 
> Gabriele Monaco (2):
>    sched: Move task_mm_cid_work to mm delayed work
>    rseq/selftests: Add test for mm_cid compaction
> 
> Mathieu Desnoyers (1):
>    sched: Compact RSEQ concurrency IDs with reduced threads and affinity
> 
>   include/linux/mm_types.h                      |  23 +-
>   include/linux/sched.h                         |   1 -
>   kernel/sched/core.c                           |  66 +-----
>   kernel/sched/sched.h                          |  32 ++-
>   tools/testing/selftests/rseq/.gitignore       |   1 +
>   tools/testing/selftests/rseq/Makefile         |   2 +-
>   .../selftests/rseq/mm_cid_compaction_test.c   | 200 ++++++++++++++++++
>   7 files changed, 246 insertions(+), 79 deletions(-)
>   create mode 100644 tools/testing/selftests/rseq/mm_cid_compaction_test.c
> 
> 
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
