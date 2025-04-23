Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFE199FC1;
	Wed, 23 Apr 2025 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378481; cv=fail; b=r9BsUfuxAMC8iad81I+AFTVIOoYQK91vexQiPkUPd5FjJ2jNzkAQDPtCR95JJy9N/f44krci6OFFPFVsTGrM5Ezzv0fubr8/EeQByVE04YQSooF89kggRoW8lJ66ubC/4TbJ0ce+MY+oLSpbzOxPBAO26fFaJdboHYIey7Ycrek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378481; c=relaxed/simple;
	bh=FlXt4JPAk79a2OxDo5+yd2B/WowDaocKuHCPW116RAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BznPaT8v3OVIGLEU44RaystXm5mEoqZ1MlAAY/fAyqOeu0RTfuoDNa0bRjs5+rPuqEJmj1jFYwrXfKTD8SKq/hT1AH4O4HvsmDHjODJSg38HLEXkTNf5ySkTnJuHy5QATNbZRRuKmv2MuLZqpLYO6v7V/8jG2VNf0SOE86/tXss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OAkX91X3; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OAkX91X3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uakGeaVqPzOA6TUPnemzb18Gifksw2JHtXlAdhF98nHVs4vZNVtuTlHAoJjf/owgrC42YyYIiGdnRM8M8k5QDf8aEplltmWSkCKHP/tRI2m87teGFv0LJaUsa5NXQJvqAxoxMuW/cqCzIgc8eMdYUdIjAtT3ppz0LYhCs0/DzWKAP6xXWiOzbWXsoN5aHWa2I0JEIWkjH81Nfl5n2hPI5KASgpbKZNitOAZ/y40HZcQkjGs3KJ54wn62Vdscb6ZRLfmCRoPA0C8LJ8pp2cw0Lzfsb7wrc915BO9zPSfSJEBdGba8MfUnaBKWb+pqGWr7EQ56UKZwIakmjjzRF6kQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiLi5PSW3Z9hS5TJxLGYFCNxRFw+jxD1LBDeyIYOYN8=;
 b=IKF21fgQVDBGU9k5M+x3hhSoWlp21jnQOkq0z95Su7W2CgWnYL+SV+bsnKSq0Ow+gI2p5iEOQdUjZlevN59PbWbP8TgSqIayN9q83JmiCSgy+d9F/iPQUAVI44Knq+xwWsuBtMW4KluW5vUCGXWL6r9mw3s89QkfqZE0ErdCCIFW8WvMjvF9WcBNavd7jX5+bS4QCMed7mmJM0krpQrAk3O8mOUfAjK2kYttcymdTY/uFte+EV34ifPOGOvRLRBB0X4TTDwQiy/BLmK8gQeCDN1tX4hYaCT3aM9Bre4pmuYhCp/xeBP0iGAaekmZC3pIT8o8l4Uyg110bM6f3QCMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiLi5PSW3Z9hS5TJxLGYFCNxRFw+jxD1LBDeyIYOYN8=;
 b=OAkX91X3ciG4XDOesBUBENqU7XBAZ8iVChveo/rots4f7bs31ZLUAcVrNGJ3ql5Aau9uYflUTp2TVXlYILW94MO2VOed59f82nO82UK5zSh43AieIboBqM3uZHX+QH+u6DWJeLz7avT7RwdwowbUex38wMBqSUxmJSOfOBXXej+8KRJmDTTxVtJzk/lgArvmOj3Qd5diVA4evlW6cvy9D8fzRvNN+e4CW6wj2wQ/M80KVWAA60Me9mMjLfSmdbOnr3ekv19v77IOyfOzW6UxK3r57O4dwpva5dV7ovld9EwyW1E5XskKzuJpsKOPDg8nVBXUm1HR9vVH4XDf+314sg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1449.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 03:21:13 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 03:21:13 +0000
Message-ID:
 <MA0P287MB226271093B2CC475E80784DFFEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 23 Apr 2025 11:21:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
 <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <8ac714fa-2518-4a44-9135-6211bd4bf493@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1449:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b70eea-9b89-469c-49cd-08dd8215e699
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|6090799003|5072599009|8060799006|7092599003|15080799006|1602099012|10035399004|440099028|4302099013|3412199025|12071999003|12091999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZCtkeElUa0dZSmhsNzNIN2FXVFFOcjdDa3grSUZYb3JVd3gwTTdMQjZhNVZV?=
 =?utf-8?B?ZFU3R0pvVWQzb3lyRXpmWHloUUtaRnZSd0FSSkNoRnpQRjZPSmJEaDFVK1Mr?=
 =?utf-8?B?MXVSZnJXKzdZMldOOVJvcUVxbHo3djRvNktXc1Q2SlBFVFVRM0NvYVQ4cFhy?=
 =?utf-8?B?K1ZlZzFrdDAyRExPMm82eUtpZG5XUnVlWVBPK3MzRGszN1ZsVFY2Ymhjbk5S?=
 =?utf-8?B?VGM4MFJzQnB3c0ZLTmxHdmpEeE9PSkRwU1oyTk1BWVJGcjhaQVl4RzZCUC9G?=
 =?utf-8?B?L0xIZERNaXRlVlIza1JrblR0T0xsQnRDNU5vSHlvTHhRSFNRckV4bEVrUzNy?=
 =?utf-8?B?TFg3Zit1enJCWWpTZGg4WEliUlA3YmpBcFhFS21nU0NQRDJmSnowNFFHL2FB?=
 =?utf-8?B?YUVnTkZmZ3d2SzRMQVkrKzNQazYrVTh5NDY1M2U0Qko0aDlYOXlRUDE0WDdL?=
 =?utf-8?B?b1JUcjRHRXo4TEdPS25hUDFvb3BHRkh6eDExY3MxcVY3UW9LY05aUXgyeE40?=
 =?utf-8?B?NllmdElLdXdPYTlza3ZMY2pkTmxKZmtNVXpKU0VRbnhrekdWRHEvSVpXbnNI?=
 =?utf-8?B?c253WHlWdnNkUGdGbG45b1E0ZjVOM21pN0g1OHJ6eXl4L1YxN0ZxZEVZNDJa?=
 =?utf-8?B?OEl1RVh2WE1HMWRYZ01ML3NrOVFaZDV2aUYyalZYK2U5eklWdlREY2FFZWFi?=
 =?utf-8?B?MWZnQ2tFb2svZTZJVGN6V3dIYk0zOU95R3REUHVCT3ZjdXVxR29tUXJRRGpl?=
 =?utf-8?B?SjlaQTN4dWlCN0ZCVlVLdHZRR3NHcTNNdjU1UjhDYTZXQUhDdzVBalBmVmlu?=
 =?utf-8?B?Q1J6K0VpWFUrR21QcGt1TE5XamJMSDRJUUFPZVpjVStLbDgzYzFIZ1hTOGtH?=
 =?utf-8?B?clVnUnVrUlc1bUNPckJxcUlRT2RteU42Ymx6RVBITXB4Z2tqbGRzcFRrVW9o?=
 =?utf-8?B?dDBnNHJXUzlyNkdubGxITlRraHZybEpKWDB0UXZPTWkvL3B1MXJYZCtvQk92?=
 =?utf-8?B?QWxrNCtraEtETkp2YjRVWHBoS05kWU9qb25pZllOWnZpamkxc05kL1JzVjNj?=
 =?utf-8?B?OVRNUG03ZUNCZ2x6S0lneWZSVUdoNXVtNXBZY283TGp6VEI1VlY5ZkQvSzhh?=
 =?utf-8?B?RTRNZnpzb3ZCdjRJKzVUM3ZoTWc1SHZsWUViRDRQQXZjeFNYS3lrQ3JpU2hr?=
 =?utf-8?B?ZG5GcHR3RWp0QmV6Yko1M1BEa0NFdE9MbjhDY1czampobmYrWlhyRGE4d0R1?=
 =?utf-8?B?ak1aT01vQWdET0YyOHlXTjhETmJITXZTTitQMnZSSk9RRDNmK2VRV3JrVnJa?=
 =?utf-8?B?MFg0cDQ2NWNxNElFdW43bXVBSmpqUGFTNU1KdW9zVkNoUkZnelp3NFQ1WGhw?=
 =?utf-8?B?ZjdSbElBeitsU1NoOU9BWHZ2aUpZMzlVSzdDUlJmU2N5aVV6UnRTVnpVcjg4?=
 =?utf-8?B?RDNsL0tYODUzdDFJZXNOVVp5cHBmZnovLy9WQ3ROcXZNRExzdUVHNXA0UFNm?=
 =?utf-8?B?QjQwL3pIcXpQcEpTZGZ3UERsU1ZodFhKMW44bnhDK3VkNnJFTmkvUnF6SzJD?=
 =?utf-8?B?ZWRUWHNxQVJzRGhPUU1BSEJrcytpMXRrd09DZHMyMjJRWVI1TllXRUYrc24w?=
 =?utf-8?B?Q2oxWkRMWWFPeGxSV3FXUytjakgrR00xL2hhWlh2Y2RBaDNwU1NJckgzVTk3?=
 =?utf-8?B?akNpcXJtS0xQN1hyK0FmbU94bzRGRHU1bVY3bkZQOVovUWFwcVlnUUJXRUlH?=
 =?utf-8?B?M1k3OHN2QldsazZMS0pjeVVPSExJNkNXUlBLems4NWdjQUtLWnN3R0NZVnFZ?=
 =?utf-8?Q?hfGm81tSA6N4N78Rr/fC2vTWMmMcNxGPLgmV8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JLU3lzMnA3Qmg2RzlhcjdXVlVwdG9QR1dkYTh6alhPT1V2RldnNTlqR3dw?=
 =?utf-8?B?bUpGRWJ5ZURhUEpObzVzYk1qUTFCKzliMlYvMTUvTnRJZUNmajJ2dGNWNTIy?=
 =?utf-8?B?RERybkRMV2JpWm9mZ2d4eTJFMHdSZE5CM1ZFUlNCWSt5S1JKRXFBYXM5SVJl?=
 =?utf-8?B?bG4rOUJ4UjVnQUQvYlhIamgxeHBuaS9VcnBXZ3pPd09hZDM4czhBdlNncjRS?=
 =?utf-8?B?eU1UL01LOGRPSlhwYnpWZExTMEc0cVp5RlNqWkNUYnlMTjZzb1kvKzBma1VW?=
 =?utf-8?B?QXE3MnhlNDA0WjJIb01uK1RHU1VsWURYMG9Hb01qQm5aV05rNVZJdlMwQmhi?=
 =?utf-8?B?eUhqWGlTTytNSHIvV2tSa2U0TFFlSU9YWmpwLzdiM0JzVDhiQUpreDk0MlJo?=
 =?utf-8?B?bmZVZEYwS1cyNHBUSWRBVVlIcnBiVkdESk83Wk85a1hWSkJMZ1lXNjA2NnRo?=
 =?utf-8?B?QmVLTGErNVNlTGFpQ0pXS0RwbmgvMkx5OW5lTzJGTFo4NElHUUV2Tkw0aGtn?=
 =?utf-8?B?QVNKaDF3QmsxUE9NQjZIUmdEOVZPbURROHEvc0c4WGoyNzdXbzQvTE9ERUsy?=
 =?utf-8?B?Ym95K3pUYVhxWU5lOVdlU3ExV25RZDJxd2JGWG5IRXA2YWJ4RDJpMkp5VVB2?=
 =?utf-8?B?YXdJaUgwdFIvdVcwUlQvZ2syaDR6MEhJNzF2WXVReWtFdzhYejIvUTkybVhP?=
 =?utf-8?B?OTZxQzhUdHA1ZE1XeXRVOEU4elBMS2NSQ3ltem5KWjVzOVByN2RYYW4vNXJp?=
 =?utf-8?B?RXFGSnQ4VHZjWDNnNktvbkpJQTlwcTUvRXFhYUY5bFFrRS9KMHB2bE9yS1Jl?=
 =?utf-8?B?cUJxSUJRQ1BSakFvMDhNUVBTNzQzVi9pYm9TVlRQQWhsT2VnNWJRUTUzS2dN?=
 =?utf-8?B?YURMWVhUMjJtWHNIc3lnT21NRVB1aC9USThuZXZqKzZ6SmxxOGsyZkxMekh4?=
 =?utf-8?B?VWxVZ2RPWmpLR1lSUExGSjM4b1paTzByVXVkTEVIRWFIZ3Q1L0EwMWhkWG1J?=
 =?utf-8?B?alZkUmV5SzBvS3ZBQkVhdVpiM1lKSXI5TlRVamRpWXBjTTNTY0t4cjg3Z1ZR?=
 =?utf-8?B?c3BmZytTdER4eHEzQms5KzZyanVGVnJnanc1NE0xRmU3R0NYaGcyV0l2bFA3?=
 =?utf-8?B?Y2VnRzZVQnd6NEQxY1NZTlM0YWlzZlg4U09hWGlwR21qQWFSZ1dZS1ArVjlL?=
 =?utf-8?B?RS91WU5JSHBKNHJnMWxQSkprZ2FVTzJLT0FFVEdiTnNreHZEdjJoVTd4RTdt?=
 =?utf-8?B?TFpESmVCYk9STTI1Qk9vOVlDRVpmSk9Rdllvak5qRXl3aE1VQmx3dVBrbll5?=
 =?utf-8?B?ck12eVRhQTVxY2hPZ3pzOWFLK0hERk91czRsNUF4Y1lsOTg2alMzaW1UMDZW?=
 =?utf-8?B?NllZL1o5bWZFYldYSEgzem1HS0pjeDd3ME9OQjlIM1B1NU9RSThINm5kVHRl?=
 =?utf-8?B?VUVwYVhJK2lOZE5yalFOdXZkMjNNL0ZNYmJWd3c5NXh4SjB6SWdXcEFoTDhR?=
 =?utf-8?B?QzRUYXhWUmUza1J3MHl0VmdXNzhKT0NHKzFENmhTZm9vM2luNHBRaS8yc2Yr?=
 =?utf-8?B?WWh2bUZCVnRTdGFZZ1JlY0lPYjBwZE1nWTFYQ0dsWXRLcVNGU1VCajRKcmh5?=
 =?utf-8?B?Rm5iY2duQ1JiSnZtQzVXTUMxRkZ6MHBJWC9tT0FxeC9WZG15SHIyUEh0Tmdo?=
 =?utf-8?B?Z1AwZUMzY1cwWlh6akVjbFc0cGYwaFd5NzlJc05HQ1lGTk9ERmhhY283QjIy?=
 =?utf-8?Q?MIyx7iu1f2IYD3EgeOEVyLFPaJfh3efBxLGQqnZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b70eea-9b89-469c-49cd-08dd8215e699
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 03:21:13.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1449

Hi, Junhui,


On 2025/4/20 1:09, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>
> ---
> The reset management module in the K230 SoC also provides reset time
> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
> the time period when reset is applyed/removed but the clock is stopped
> can be set up to 15*0.25 = 3.75 us. For some RST_TYPE_HW_DONE cases, the
> time period can be set up to 255*0.25 = 63.75 us. For RST_TYPE_FLUSH,
> the reset bit will automatically cleared by hardware when flush done.
>
> Although the current reset driver does not support configuration of
> reset time registers, delay has been added to the assert, deassert and
> reset functions to accommodate the longest reset time.
>
> Besides, although some reset types have done bits, the reference manual
> does not explicitly indicate whether the hardware removes reset or the
> clock stop time period has passed when done bits toggle. Therefore, I
> think it is a safer way to keep delay for reset types with done bits.
>
> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
Regards these notes, please move it to the beginning of source code, see 
example: drivers/pwm/pwm-sophgo-sg2042.c
> ---
>   drivers/reset/Kconfig      |   9 ++
>   drivers/reset/Makefile     |   1 +
>   drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 365 insertions(+)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,6 +140,15 @@ config RESET_K210
>   	  Say Y if you want to control reset signals provided by this
>   	  controller.
>   
> +config RESET_K230
> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>   config RESET_LANTIQ
>   	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>   	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>   obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>   obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>   obj-$(CONFIG_RESET_K210) += reset-k210.o
> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>   obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>   obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>   obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
> --- /dev/null
> +++ b/drivers/reset/reset-k230.c
> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2016-2017 Linaro Ltd.
Linaro? Are you sure?
> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/reset/canaan,k230-rst.h>
> +
> +/**
> + * enum k230_rst_type - K230 reset types
> + * @RST_TYPE_CPU0: Reset type for CPU0
> + *	Automatically clears, has write enable and done bit, active high
> + * @RST_TYPE_CPU1: Reset type for CPU1
> + *	Manually clears, has write enable and done bit, active high
> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
> + *	Automatically clears, has write enable, no done bit, active high
> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
> + *	Automatically clears, no write enable, has done bit, active high
> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
> + *	Manually clears, no write enable and done bit,
> + *	active high if ID is RST_SPI2AXI, otherwise active low
> + */
> +enum k230_rst_type {
> +	RST_TYPE_CPU0,
> +	RST_TYPE_CPU1,
> +	RST_TYPE_FLUSH,
> +	RST_TYPE_HW_DONE,
> +	RST_TYPE_SW_DONE,
> +};
> +
> +struct k230_rst_map {
> +	u32			offset;
> +	enum k230_rst_type	type;
> +	u32			done;
> +	u32			reset;
> +};
> +
> +struct k230_rst {
> +	struct reset_controller_dev	rcdev;
> +	struct device			*dev;

Why don't usercdev.dev to store the dev, so we can save a pointer.

> +	void __iomem			*base;
> +	spinlock_t			lock;
> +};

[......]

Thanks,

Chen


