Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21271EE007;
	Wed, 23 Apr 2025 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374900; cv=fail; b=kxmARO54L9NjI6rGV8e2H14t7F2Lznb9qn2fd4iHoikPUB1gmdym3VOT/Aty8NrS1XmLNYxL3ntmRcofPdN9Q3ScMWPnDGLHCRzAvKpk8GHe7rY2NmdxVcUlaxdTpHFvLzoVL0UpqpGlDkwz8N618VaXSrGTLTDjGZGujr6lBWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374900; c=relaxed/simple;
	bh=aYBV5yNVJyVRvC24HGMoAYlEsqca8DyUEvTENGGapYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aoiUe1K2W+/YZOcx2N4+7ZHVMDTJp1k76fdMHfPMsOZaJ430xyOH1UvDNWH1MQz15Exc0iTIacBE+C8NwKROFxyX3JUB1rSX+M7itJxQsthmIrPaY7Y06ANVlN6amks7HvFkVeZMNT92VPeolprBlhsaeciMtZ708Y9Tu8REKCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RfWpz6vC; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RfWpz6vC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXIQkD5sidbu6ml3DzAWY1fRlRm23NKndMR5FnULeFjmlsDxSqV51zhHW1Uz5UKQM2r9QomkNU94iHIidZ5SkNflrHZw5sfFjzu3GJrqUYACrBTWnoJ6ijJMJWr7ZLDBANYEYgzuZ9hq20qM/CF0YkmyIdmj8YkskgZ6vojjpRxggAe/ZNh7JE3kbPgJFWUfuon9d6t8K1r9QLRV7ePcMUSZuzN+6nw8Ifwkh2BGObGspSz1F/79kiqE73JPLNazCDm73P3S8ZseCM9cGxXIN3SLMcT9gHNzNONn73jNOyuMwpDlwHgT68ribTIqi4DMbSbgTIoQ6LfgY/L/fzL/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cgCRukgHhpCT2SOk8EUtaVmdd5zQdn7SZ2qJgY7ybw=;
 b=lHb+M4eGdbm1ww8ZTAhNuM0OCuWgIuBwM6HBcaiGQxJ6aJfmtq01N9I6kOTh+vA/bJMk7c+Fi6kjix6cz2oXOu3r126Ul0RDrc+JGxzmZilZMNOpH28MFHsxNHK0bWJXRsx6EMoOzrAlSCFcjYe4BxBkZ87ipzYQ7Lh56/oFdSLNJ1mQgCmCTHBuE2vfFdb5VBTaccy5Ynm8fOWPCog7qDdIJOZddlsvJrvaiWfIQ/rp14QFIo2qTV0Ml7g1iabqNB9dtbudFv8urqy4Qv9RXofHpR+jbkQBgkrdN1AHQB983YAVv86ekEysCMCOEEdo4mD319I2HVkpfPcpgTeT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cgCRukgHhpCT2SOk8EUtaVmdd5zQdn7SZ2qJgY7ybw=;
 b=RfWpz6vC3zV2T0QF9PpPhWIH4Q8wcUlP+xqDBJ+zmxkiKkJJd3ztGl8hqLVseYp7jHM0I8E4xjRwxmtoAocfDaf7pJNmNBqNxvsEbpfVFOb3SjfEzRMpzFl286clAAylD3cIj28AZhBGI1fhErQhCzy+cSnEsRpavFguQrx9nwzzj3PqWoAPAX55a+673kDWse1har6g8XQLPM/r1iPTSgBq14KQtDn9o99IVTYpzc3NT+h6UXo6YkcQcAiKe+HkIhPQ5nm6Deq3x0Jgwq58A7mGLdqM9r8NPHepvKrinHT4KzEN3Fe7ZsO4vnte7oAF3zz3DJJJAto7J1claRS44Q==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MAYP287MB3788.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 02:21:32 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 02:21:31 +0000
Message-ID:
 <MA0P287MB22620E425A4AC72E5C32D325FEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 23 Apr 2025 10:21:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: add support for
 canaan,k230-rst
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
 <20250420-k230-reset-v2-1-f1b4a016e438@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250420-k230-reset-v2-1-f1b4a016e438@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <dcb14542-2094-4b29-8181-62b589c0ef70@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MAYP287MB3788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb4526a-1d01-4f4c-8e59-08dd820d8e2f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|5072599009|15080799006|19110799003|461199028|7092599003|8022599003|12121999004|6090799003|440099028|3412199025|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnpucGZpbzQ4ekdvY3YxcktrTjRyTjQ2cmJhZ0djeFJ6aXJNOVAycWZrVzZp?=
 =?utf-8?B?MElVVnA1Z0ZBNTdRVDFMdEdsb1g2bzYyNi9uamRneTFkdUdhMzlaYndZMENG?=
 =?utf-8?B?endrNExaeDNWV3hZSW9jRGhqcDFIU0F3YURxZ2pMKzhyK09KdzBkTXlLZzZj?=
 =?utf-8?B?VmxRZityNlcyTWY0UjJ4NFA1c0s4cDNvRk1HS3M2K05LT3dRQUR6KzlWOUY2?=
 =?utf-8?B?WjkzWnh3U0JUN24xRWdZOWVUNWJaeTBHL2c0a1BqWWExNCtzbURDMWZLTE5H?=
 =?utf-8?B?VjArTmVlS0V3OVJZc0pQc1ZxbXozTmNBVFFGYk5NOExuQ2Yrd0xuWmw1MkFP?=
 =?utf-8?B?eTNOdE54KzJKTXk3ZFRjU3hwM3RGVWZvRkhlZjZqMjVoSFIvOXdpbnZsL2Y0?=
 =?utf-8?B?WkQzaEpyWkRHWWlnWGhyRUVxczFobzlYRXoyZm45cElvTFBOSE1SSTNkMk9k?=
 =?utf-8?B?MGtyVEdxczdFNWJPUG9sVTVxdTQvWDN5YUZTNEQ4Zi9zYUlmNERnd29kTUdo?=
 =?utf-8?B?T1paOFNjaUR4ZHRKMStGdy9ML1IvcE0zN0FPejJVWjNFNlBubGlrWDFBMzI1?=
 =?utf-8?B?VWkxSHgxNFh2NGQ5bFdiR2NoK0lUOVlndnFleWh0Mm9GRlJXWHdBeGFjTTFF?=
 =?utf-8?B?UmplRm1CT25HUWI1bDZUVjdhbW5RVXA1dFRCdHJWMVdET0pZWWRaVFdYV3h1?=
 =?utf-8?B?Z0JZMjdFLzNWT3BleHIyWFZUUklYSDl5ZE55YjhqYm80M1BHN1hVNGVxY3hM?=
 =?utf-8?B?Z1dmNk82TlUxQkp6a1VvOVBma1diUURQbGhGNEN4azVxTzVha0tBbEl2b3pW?=
 =?utf-8?B?UjdoK2dqdzZRaHRkUlNxZnhQNWd3UEkyUnZ0Y2Q5MTNvdldwTDl1TTgreEZl?=
 =?utf-8?B?bmQ4VS9wMi9SOXRkZHA0TndUZEZUUnJBeENtL1g3YmNCNEI1Y0pSWm8zaUh4?=
 =?utf-8?B?VTJDcXZHWHRHVk56R0FhN1l2YXRRSGoxRXc3K3ZTMzFKaFQyTVQ2OHhzcnM4?=
 =?utf-8?B?Z1pMNUNJTFdyQ2JBMzRDbVRJRjBaSXR1bldUOGpVd1pjNS9hbXZkeWV1ZEQ2?=
 =?utf-8?B?S0VQVUxRTlJEK1ZlRkhNQ2lyVzYzbDhVOXVoYXdaOENOL0ZlZ080MGQ2SXZ2?=
 =?utf-8?B?bW00OEtnRTFESzJTWTZueGc4b2Ntc29ZSll3bEdBT0lEWjRuOXhjaytOVEVB?=
 =?utf-8?B?UXRZVzVQRzRWVnpBUEdWZHpMcmp3MGJHWkNjMFB4TXY4MHRzaTJhKytsT1By?=
 =?utf-8?B?b0NxY012ZTBsaVhZYXhhVWFkQ1FWOVNpbE5neGhIVFMxalFvWDJWVWZTSkJk?=
 =?utf-8?B?NlFkbktBQnJYQ0NIN0dxWmk4VW51L2VKNVRRRjM1T21FeHN0eisrMlFmWFBt?=
 =?utf-8?B?U3dTZFh3MUJiOGxzalN3RUFGOGhXMzZNN2lSNE1PN3ptdyt1NlNGd2VJM25y?=
 =?utf-8?B?aEJLUTVpdDQ5ZFBFalEzMllqQzJNazdRVFBUZ08vUVViOUJyeWxKWFlQVVQ0?=
 =?utf-8?B?VFdhZ3pDaHQxUXNVenFIb3ZSdlNFYlcrSXJrbmRyZjhiQlRjNjBFS3JZdWFa?=
 =?utf-8?B?RnRCNDFlQmtrejFUbDZoa0NGemtGWVFRRER0TUJLajZ5UVZndnNtQkVDT0FY?=
 =?utf-8?B?QTN3S3FYUEcxem1FQTFQNFFRcjg2OXJ0N1pEVUNKNkh6bTVzVFA1NFUxQ25T?=
 =?utf-8?B?a0g3WkJWQ3lMbERwLzA0TE5WRmFPNks4K25DMnpjUDhGaFlnWmZjUjNRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmJ0N1lLWTlJTUx2dHNsaGJ0bVJDdjlJdTZ2cTU0RkRVY0tybUlqeEcxbEs4?=
 =?utf-8?B?RU8yWmJuQzJIUTlCRVhvQmZzOTdwUlJQS2oyc3VVdHFrcjg2ekJxdGZxM0dP?=
 =?utf-8?B?VWQvNytYbkg0V2Y3bkcrRnhrSjFyT1B5b3RkeWpLOVpRUzQ1b1gxT3RoMTR1?=
 =?utf-8?B?UkZBMHp5Y0Z6WU9vbTdleTZkZ3BJWkd1dEM2UjRIQTlEeWZiWC91ZnV0dXNX?=
 =?utf-8?B?S1VaRGhFdTRRVGZFM2hiKy9zY2g5eSs0cHNJVmViYUZXOXNENnpiUWswbUpr?=
 =?utf-8?B?YjJUWWhtc3FGRXd3UlQyVFR5NGlpeXpjZXJ2WXJnWXJ3eG00MjNYajRITklu?=
 =?utf-8?B?L3FMNEh2Rndud3BDQjNuMXQyZTltWkNnalVRNWIxeGpoTlpBVm0rRXN4S2x0?=
 =?utf-8?B?OWl2TTV4TEdjRWJIeVo1L2p5eTJpeDFmTnZXN29ibHZ3SUJjcFROVTBlTkZm?=
 =?utf-8?B?VVpzT2dPM2lING5saGhnL2ZmcG5JOVo5azVxUUdzRjF3cnFxczBqNDJXN2M1?=
 =?utf-8?B?aUt3QmZ4cjk5bndodWZSMkR0VTFleHJocEQrSm1oTkFnTWwzYUpwZ0l1Qk4x?=
 =?utf-8?B?UTBMOFZFVE56OTdBZlV6SDl1RDdNTGcwaHhySGxJRWd5WVREV3d6bm5FRzlF?=
 =?utf-8?B?VVozT1pEU2cwUkdLbWlPRmJVdE5UZkwrNnk5bnZUUStUeWd3RGhnQXdEZHB3?=
 =?utf-8?B?dFFvU2REMUFuOUduZjFONk9waU16RE16YjRMSlp1bmtTR09OemxhdCsrOUxL?=
 =?utf-8?B?b0FVM2hSdGRoT0hyeXhHZ1ZFMWptcy9ZSmpLaXZLT1Bub05PcG42RUQzSlBj?=
 =?utf-8?B?aWJFVjJvSkxpU0RaVlRzWWdLMzlsb1hkaXY3N2RQNlVnaUxNUlA2aXpTRWFX?=
 =?utf-8?B?OGtEVFVLYWdiK1JVTTlWSjlBMjkyaWg0RFNvMVlLSnNDaDhZblpiNGdQa2h6?=
 =?utf-8?B?c2hLaTZVSnBwL1BCZkZ6VTVvL1lEYjZ6TmJLYlBUaTVlT0R1SFJnL2NVOEVD?=
 =?utf-8?B?VG92Z1hIUXRUZ3dDeHRXVEltcDF2dmFvMFY0cjFRYWtad3NrM2g1TTV5ZGdP?=
 =?utf-8?B?RXEzdEJrM3MzMktyQWlORm9FcTFPU3U4RlNDaGFLMFRnWXpzOFdwZS9uN1Bj?=
 =?utf-8?B?dTFQd0svN0Y2ckFobVljRE9UQU1zeldiVWVoMXRXUE9MMyszYWFZa0kyN1Ft?=
 =?utf-8?B?Z2lFMFFIT3V5UWQ2anhlWVhyVFNpTEl6QlQzOFNDUFJqTTJQSGM2Q0hUMFR6?=
 =?utf-8?B?LzBpbWNoNnliUFVWc3hGRjVkNm1zdUZwSXNaOFFuTlM2Y1g4dmY0WWZvdEFG?=
 =?utf-8?B?WEJMZHB1cVpvbGV3TkRDdUZSZ2ZpMkNDL2FvNCs3RHRvK3ozT3FDQ0tCZVJD?=
 =?utf-8?B?aXNuN2ZzV2RtRE9KTFhoSkhJZzVTUk14TzQ4S2FCZnJoZUN2Mk84YWtXOUZP?=
 =?utf-8?B?aGF2K3lGRnl3UmluZjZvNVNNMFU0YW1FSitpT1pKOUQyblpIcS85ZllYcTF5?=
 =?utf-8?B?bmVLNUFQOGNTVUpBMFpMaXAyQzlXeVRmMEI1Mm9LYWdmYnc0bDNWSks0MHBE?=
 =?utf-8?B?VlgwZnREeVJYcjdtLzFvWkpGSC9RdlFZbHZtOGdIUUtGVlpERUxvWkhkdGp3?=
 =?utf-8?B?anBWOHdsZ05yck1VaDQ1VGNGUE1VMUNFZGM0cFVqODRNRlA5bEcrMytOb29O?=
 =?utf-8?B?eTdGYkRObERPK1hUU3VNWGhYSGw5RTEyMkxVSzgxdHhlL0hYV3NJQjVIR3Rw?=
 =?utf-8?Q?aNNhP9qWcNELVUlTC3CtCjC9dU6y6NiAf5BoNAt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb4526a-1d01-4f4c-8e59-08dd820d8e2f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 02:21:31.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3788

hi，Junhui，

On 2025/4/20 1:09, Junhui Liu wrote:
> Introduces a reset controller driver for the Kendryte K230 SoC,
> resposible for managing the reset functionality of the CPUs and
> various sub-modules.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../devicetree/bindings/reset/canaan,k230-rst.yaml | 39 ++++++++++
>   include/dt-bindings/reset/canaan,k230-rst.h        | 90 ++++++++++++++++++++++
>   2 files changed, 129 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d352d0e12d8106a232bb5e6d7e138697d2106937
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

The copyright statement in yaml and header files should be consistent.

Othres LGTM.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks,

Chen

[......]
> diff --git a/include/dt-bindings/reset/canaan,k230-rst.h b/include/dt-bindings/reset/canaan,k230-rst.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..53e3fd8177071aef8983c631706d67ac86ab645b
> --- /dev/null
> +++ b/include/dt-bindings/reset/canaan,k230-rst.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Here.

[....]


> +/*
> + * Copyright (C) 2023-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +#ifndef _DT_BINDINGS_CANAAN_K230_RST_H_
> +#define _DT_BINDINGS_CANAAN_K230_RST_H_
> +
> +#define RST_CPU0		0
> +#define RST_CPU1		1
> +#define RST_CPU0_FLUSH		2
> +#define RST_CPU1_FLUSH		3
> +#define RST_AI			4
> +#define RST_VPU			5
> +#define RST_HS			6
> +#define RST_HS_AHB		7
> +#define RST_SDIO0		8
> +#define RST_SDIO1		9
> +#define RST_SDIO_AXI		10
> +#define RST_USB0		11
> +#define RST_USB1		12
> +#define RST_USB0_AHB		13
> +#define RST_USB1_AHB		14
> +#define RST_SPI0		15
> +#define RST_SPI1		16
> +#define RST_SPI2		17
> +#define RST_SEC			18
> +#define RST_PDMA		19
> +#define RST_SDMA		20
> +#define RST_DECOMPRESS		21
> +#define RST_SRAM		22
> +#define RST_SHRM_AXIM		23
> +#define RST_SHRM_AXIS		24
> +#define RST_NONAI2D		25
> +#define RST_MCTL		26
> +#define RST_ISP			27
> +#define RST_ISP_DW		28
> +#define RST_DPU			29
> +#define RST_DISP		30
> +#define RST_GPU			31
> +#define RST_AUDIO		32
> +#define RST_TIMER0		33
> +#define RST_TIMER1		34
> +#define RST_TIMER2		35
> +#define RST_TIMER3		36
> +#define RST_TIMER4		37
> +#define RST_TIMER5		38
> +#define RST_TIMER_APB		39
> +#define RST_HDI			40
> +#define RST_WDT0		41
> +#define RST_WDT1		42
> +#define RST_WDT0_APB		43
> +#define RST_WDT1_APB		44
> +#define RST_TS_APB		45
> +#define RST_MAILBOX		46
> +#define RST_STC			47
> +#define RST_PMU			48
> +#define RST_LS_APB		49
> +#define RST_UART0		50
> +#define RST_UART1		51
> +#define RST_UART2		52
> +#define RST_UART3		53
> +#define RST_UART4		54
> +#define RST_I2C0		55
> +#define RST_I2C1		56
> +#define RST_I2C2		57
> +#define RST_I2C3		58
> +#define RST_I2C4		59
> +#define RST_JAMLINK0_APB	60
> +#define RST_JAMLINK1_APB	61
> +#define RST_JAMLINK2_APB	62
> +#define RST_JAMLINK3_APB	63
> +#define RST_CODEC_APB		64
> +#define RST_GPIO_DB		65
> +#define RST_GPIO_APB		66
> +#define RST_ADC			67
> +#define RST_ADC_APB		68
> +#define RST_PWM_APB		69
> +#define RST_SHRM_APB		70
> +#define RST_CSI0		71
> +#define RST_CSI1		72
> +#define RST_CSI2		73
> +#define RST_CSI_DPHY		74
> +#define RST_ISP_AHB		75
> +#define RST_M0			76
> +#define RST_M1			77
> +#define RST_M2			78
> +#define RST_SPI2AXI		79
> +
> +#endif
>
