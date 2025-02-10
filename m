Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010000.outbound.protection.outlook.com [52.103.68.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B82C9A;
	Mon, 10 Feb 2025 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739148970; cv=fail; b=VKA8+oABBGfp0JdshXBrmNI3DCk1UlmNk9XceRzmZBe25a88pxQ5HcQaMtIJaQu9EmLFchpGzMIEG2Pt/yaJcwRV4xQU7VXdHscH3vZTj92NaugyM5Jqka4Db2MT2S5FAanVEuJa+/K2EX/yi1uQ96nA6OJck/4TS0/cAKmdCvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739148970; c=relaxed/simple;
	bh=XlkvVUMStXbPHmotR6OidUb/CgMFsgWREVnozr0LRpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pr6OohpmKnZjYIGpwk/DQNGFCkC74DBE//gnPnneNH661ZzVyasr+IVyV06DQdRQLFXQwdBEJUP5iaqk0nL8gDwdr9v/MLCfs8ncJ6TeeZkzeENBbl+XJLh5ApsET7YS3BOc87WGfoHqCoRc2JHtzN/12AOSybdZ++M3t8TqMRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZshcOJkS; arc=fail smtp.client-ip=52.103.68.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZshcOJkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnzx7IzdP6Rnu46Bx3hXr0/8OpnzRubz1U/w4tyucw7e07olVC78Dsai9XEdzb/3FLtPpHBBDC7Ld1sDjSTKESYRbOPwPprNgnuEzttquKrl4e5YVAm95c5YaU+YHtoCDE1LdBC/pYdgVCVSMSiBAyy3DGcM76ipjQC6G7ndoxl/Cv/IKSk3qgeg6PWpaSubd/BEj7FZt6EzGS8pqzWUgUZQu1d93Uyv8/JnarBsMwe8zGBfcz5eyy5LAdP3SjlHH4Umc3Zd/5x3pxxb3HrhEwMsSCXh5oBlXE98rMuQb1L3L8v03m2ImDINTdo8DNnUwbqBGOVPEWqLgFyeJoHgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2pbcn2EsKk5LGfBYsdqnEATEuMtBOfMghU2CUh4hzE=;
 b=DL/MtA7zDX1kUV+F0F9xUvWkKmpfMPKN9Eh4HwS21Hfezp/yNWaYcKQSPKFYp5qj3heV+yjHPc4iWR4cECXXNHxvgvNJfRWAqB/1JGy4RJcs4krizBgei/loELB/xlToyFxsRgkh9nE5QCxO+BUgcXTtDRXFZCvRwn8jawKZnHWSqLwLXVw90yRxsmxXwGrCYetaaiyXoDUGihJJHC79J6s3u8Ue9SfXxDJ4J+zSU4+hriZPeVy31HGIWLaPpe9YbKWLmsnAkaSttdB/zWkBAqBBkO+MTOZNh/TY320p7xT13mmavHAYZuoDAu+foCsTWsQ8wdK/ECF54iU+L7cjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2pbcn2EsKk5LGfBYsdqnEATEuMtBOfMghU2CUh4hzE=;
 b=ZshcOJkS0UnElCWklfJmjWN1EIq0qRg/hhNnzED66wjhh/dOg5yY/VQqFkxbCwsfaIGc9YsbSs48U5e1YF344GBVugY7JzM05ofFuMDB4A8a/ABqNjtWm9eJPN3/jMpXBEGn158h3KKOwtlgPZH1aVd1WM1hRL9ymKPknyqc0T6WWQGY+hSdD4QgVn8DGyNZEXrktnT9M3PV57eL5FfEXettmCUxxYJChr1e9Z2NjLO6EdqUMURink1spmJcYOTH1ApkTaK8jOtwQvFbZcIEvLyMvm06erOCtoaKh0F7Qqmj3JTuekfJVeDDZQEUrMMIV+fXSsxgBBhwfRPKzNGc6g==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by MA0PR01MB9729.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 00:56:00 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 00:56:00 +0000
Message-ID:
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 08:55:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250209122936.2338821-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::18) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <572fdc26-86ff-4633-9f60-07fd44a6b236@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|MA0PR01MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f21cde-283b-4f5a-e13e-08dd496daf7c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|5072599009|19110799003|6090799003|8060799006|461199028|15080799006|440099028|3412199025|12091999003|12071999003|21061999003|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHJ3MGp2VE4vYlF2R29UakFYOEZBQ3hBMXk3WWg0OENaN1BWZm9Gd041YllR?=
 =?utf-8?B?WkR6NUhCbitPUVJyajZTMExjOU5WcHN1UXdmYlFYVDFSVW84aHlFcEh1ZnZl?=
 =?utf-8?B?RHpvRVRGdXV1YnZ2V0kxL1paRGplNDNnNENIMnZvMkNtOHJvcnlEMm8zaW8v?=
 =?utf-8?B?ZW9qemQ1a2dUMTZpeTI3cUdtdFZDSVRpa213RzRtVGlueSt5UzBVZDladUg1?=
 =?utf-8?B?OElvdkFyYjd2R2NJcUZ0djZGUkhxZy9EQmFRSnVFRVpndmpCbjFxQkZaZzdU?=
 =?utf-8?B?MnZZREV1RTdLQzNlMjZCTWpGV2FDOWM3S29MZjRKWm5VdWp6L2ozeWFYN3ZF?=
 =?utf-8?B?b21pRVFUV01QUXN1RjhTWkd1NStIbHNaM2NFVHEzSlFwQkJvUm91dnRYdmRw?=
 =?utf-8?B?VmR4MzZXeVBhNjZaWTRnbGFzWmJjV2pQOXprem9qMlJNOU5CeUFnTGNWeUJE?=
 =?utf-8?B?Q05JZ2tSd2F2c3E0SUprY0ZmOUJwM3VsMHNBQXhKSGN4WExBY1UreFBwbGpu?=
 =?utf-8?B?a2lsODZBV1JFd3pxSEF0MDIrZkdheEVqUndwUUd6OXlnS3l1T0RFaUdvNFd1?=
 =?utf-8?B?SGdDT1ZKOTFZbVBZM3ZUeUw3b1BqaXd1S0JsenhKZTY2VUhZSjB2c01vV3Fn?=
 =?utf-8?B?THpITllsZHZYK3doQzNnUzJXZjE5aWl4KzFMQkFMTVNVNCtWQVM0ZlphTDBI?=
 =?utf-8?B?aFNwTnpUYVJMV3RWVVdwZ0JFSVUrZ3Fia2NqNXdVMVQ3eGlHK2QxU3R2b0FG?=
 =?utf-8?B?OWpSNUpEVlNUY0hyQ3FwNkhwRTBpKy85WUVOQWlHc3dwVUREOWxCbFhGY0My?=
 =?utf-8?B?aDBEWTBIYVNPSlBxVzA3RVhsM1JUSWZWSWxZMVJaRWFlMytqOSsyclVyekJt?=
 =?utf-8?B?bXZxRG1TTW9UVlBqREdBNzBHdHZIV29QYVMvcmVsamFmM3RGcE0yekVmVVdQ?=
 =?utf-8?B?M2V5aEhXNjgrUmZUbmlaakFoYTZlUm0yVHR1eHBXYW92TUVwTVd6Sy9Ra2Nv?=
 =?utf-8?B?Y3RsSEtSakhnMVoxMHRJcmZaaFNNTUhVV3FhQXJoelR4UXJ3eUp2YjZmQThr?=
 =?utf-8?B?MjlOMTdqL0F3WHN1M2pOVjUwemV0VXd4RExqOGRrS1BldG9lR3BsRE9mZVF2?=
 =?utf-8?B?K2VJR3JzNEJKK1RQdnpWT0xsYkh4S005S2ZDNzZtT00zeGl3OHF2cEpFcHc4?=
 =?utf-8?B?c0VuUVFvaEQyMnhLTWVZTnhTcnZYZkd0UVBjdnlSbTRzSTUxcnR3emFhRUxQ?=
 =?utf-8?B?Mk5CbytiQ1lja0VTcDVOUk1ERXdJVkF4L1F5QjlSci9UUmM1eU5IdnpIMERO?=
 =?utf-8?B?elpmMk9Td1p0ZzFpdTQwREMySENMVDEzdkJnNTVkcnlQUFBScXhUeWMvTHd3?=
 =?utf-8?B?TUtvUkIxOGZGekFLQnR1WWFIdEgySW54Mm5SMFpsUHl6Q281U0YvanZhSEpu?=
 =?utf-8?B?NGZXREg4UjZaWkVTVG9wSmJKclljV3JjN2hZdnF5Y1BhN1ZBYzdPUUhKd3ZY?=
 =?utf-8?B?a2dFajN5aWtzeHc1VTFseXl1QVBYajVmOTByaDk3b0lLV2ZrYmp0MExMS1lS?=
 =?utf-8?B?UkJ4Q3JaZTN5VkEwdFdwL1U3SXFreE5oZGpBMVAwaWRKdkpzMk9Cak1WWXlF?=
 =?utf-8?Q?TMjn//ZCV4EbsO7EZJL8Cbi3x+W4+8mzYuSmiXHQ1r60=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGU4Y0JnaGdiZWdWRVgxYXcraHJ2c2J6ek9xZjVMc2lsWEJ4RjJSUHZuTmZB?=
 =?utf-8?B?eHJvbnVteHgxZ29xQ0FTZEFva0w1L25Gd1lRcjh0RkxoZzBtZXFwcXZsODdR?=
 =?utf-8?B?NXh2bzBUQmFRbWEwVVlESCtJUGRHdCthYnVXRXZ0VW4yOEFReHVYeVVFcE51?=
 =?utf-8?B?RUNRSjM0WlZObE0xVWJZYkYwekFwM2dxcHZQKzFnOEUrWFdsYmF4b0RMTjBD?=
 =?utf-8?B?elRMK05VdzRjRkVaZDZ6eXI1dmlFa3BxcE0yZGM0NnI5U0VCTUtZRTg5Y3F4?=
 =?utf-8?B?aGVPb041cWxmYXR6V2lIcVdqRXozbWJUQmxaL0V5MW1JRTJDbVVzQ3NjNWVq?=
 =?utf-8?B?ZERaeUFRVVR5MkM0dG0ybm0rU0pJMUlWeGQvWHQzZnVSbVM1NGdHbUl4MnNl?=
 =?utf-8?B?Vk9QcCtzMEVRM1BBZlpFV2Vsb1UxeHBrS2pVM1FhNXA4UTJnTHpXUlFFZmtz?=
 =?utf-8?B?SmUyZFN6N0xrdHpvRjBzSVJsNzZPaTZaTlpiWUVVcTV2amJmNWdNMElHTWMy?=
 =?utf-8?B?NU9sTGhVOFVZYWFRTklDZVY3ME5YRlN4T1k0SGgyZ1lTZEJIOUw0aGhBS1dZ?=
 =?utf-8?B?MjFwbVc1VSt5WENYOFVPd2dSK0hVZGhYam5LZm9ickh2YmJsYUFMNWlHZy9C?=
 =?utf-8?B?ejdvVGxOR1A5bWJoTWFzVC9JekVHdWRYalBTamhBeHJxN1RaSG9kbnZFOXpp?=
 =?utf-8?B?bjdVWkgwWko4R291VkY0UzJjV1I1ZjVPNkxTY3pFOXRrYk5WWUFZNUZicVhp?=
 =?utf-8?B?S2hSY3ZlOE1ZR3d4TWRIaStXcHM2VDRuTjFpWVMrZ2pQUktRQWlQR1Jva1d1?=
 =?utf-8?B?dWJWM0JORERHRkJkTlhXYnh3K3hoMVdWTmJPOHVoSTR6M1lHT3QxTm45dmhk?=
 =?utf-8?B?My9oZ1VabVZURGpFZlFMLzJGbktqTUZjNldMTk15WFNpei9WSjVuNWdZcW9n?=
 =?utf-8?B?STQ5NzR4RmVEWklPVDJMbWxYeVdlQjhqbGhyM1RjKzArelpzVDJDekhsSFRM?=
 =?utf-8?B?Z05HSjRMaDJZQVV4ek14cDgxbjMxbFlkOHY5LzJka3VmbFgxVG9HZUdTeGtj?=
 =?utf-8?B?TTQ4aWlsRjZ5MEJpNEI4clgvU202UVNobktkRHZsZVVRbzc4R01lRTNjZWNa?=
 =?utf-8?B?VVdZN0RMZDVydncxTVpDT3l6REl4RG8xOStwNjlud2dVVnk5djhabVlLR3Fx?=
 =?utf-8?B?ZXMyUW9iMXc3bUlmSjVzblBuRm1obWkybEp4UTdQYWkrOVZISXNJTlFudFRG?=
 =?utf-8?B?dDdSZy9IVmdNeXA0QXN2bExhV1U3Sm9MN3dIR3doeThsaDQxR05HcHpKMFpq?=
 =?utf-8?B?NGN3S3BsaytGQW02OG1sK2JhNE9odzFNUG9NNHE1NU9UVHJLc0ZYRzBDblFS?=
 =?utf-8?B?MGFJbEUyV3JEY0xvVHRLbkFmTjRza05aZUsrK0FpMVd1dW5idmc4bm4ybm95?=
 =?utf-8?B?WHpBQ2F5Mk5BMXpUVDF6Q0VsdmpEbVdqTkNlbCtiamprM1lUcFpWY0JJL3Fi?=
 =?utf-8?B?aU9tdnhJYnpvOVN4Z2hsNDdxTVAyd0taY0x0bjdRbVdDWm5ud1phV2JacVJR?=
 =?utf-8?B?MFcxcTAyVlM5cG5aVWdFNEM4V2FvZUp5bnA0RXhkQXBMbjh3U0VOVkJkcWMz?=
 =?utf-8?B?cVFQZUsrZUp6Vlk2WnNpYll4Q1VyYXVsV3ZBQm0ybWorQWdqUGVjbzB1OUp3?=
 =?utf-8?B?VVZhSGxEa2luMnE3Ym5YUFpld0o0WWtHTHdEVXJZWVFCSzVEK29vV1hGdW94?=
 =?utf-8?Q?4yGz/55x2jaI54fyI03Oy90b7MHJV5VYNr8tm9T?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f21cde-283b-4f5a-e13e-08dd496daf7c
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 00:56:00.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9729


On 2025/2/9 20:29, Inochi Amaoto wrote:
> Add reset generator node for all CV18XX series SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++

Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?

Regards,

Chen

>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
>   2 files changed, 105 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> new file mode 100644
> index 000000000000..3d9aa9ec7e90
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_RESET
> +#define _SOPHGO_CV18XX_RESET
> +
> +#define RST_DDR				2
> +#define RST_H264C			3
> +#define RST_JPEG			4
> +#define RST_H265C			5
> +#define RST_VIPSYS			6
> +#define RST_TDMA			7
> +#define RST_TPU				8
> +#define RST_TPUSYS			9
> +#define RST_USB				11
> +#define RST_ETH0			12
> +#define RST_ETH1			13
> +#define RST_NAND			14
> +#define RST_EMMC			15
> +#define RST_SD0				16
> +#define RST_SDMA			18
> +#define RST_I2S0			19
> +#define RST_I2S1			20
> +#define RST_I2S2			21
> +#define RST_I2S3			22
> +#define RST_UART0			23
> +#define RST_UART1			24
> +#define RST_UART2			25
> +#define RST_UART3			26
> +#define RST_I2C0			27
> +#define RST_I2C1			28
> +#define RST_I2C2			29
> +#define RST_I2C3			30
> +#define RST_I2C4			31
> +#define RST_PWM0			32
> +#define RST_PWM1			33
> +#define RST_PWM2			34
> +#define RST_PWM3			35
> +#define RST_SPI0			40
> +#define RST_SPI1			41
> +#define RST_SPI2			42
> +#define RST_SPI3			43
> +#define RST_GPIO0			44
> +#define RST_GPIO1			45
> +#define RST_GPIO2			46
> +#define RST_EFUSE			47
> +#define RST_WDT				48
> +#define RST_AHB_ROM			49
> +#define RST_SPIC			50
> +#define RST_TEMPSEN			51
> +#define RST_SARADC			52
> +#define RST_COMBO_PHY0			58
> +#define RST_SPI_NAND			61
> +#define RST_SE				62
> +#define RST_UART4			74
> +#define RST_GPIO3			75
> +#define RST_SYSTEM			76
> +#define RST_TIMER			77
> +#define RST_TIMER0			78
> +#define RST_TIMER1			79
> +#define RST_TIMER2			80
> +#define RST_TIMER3			81
> +#define RST_TIMER4			82
> +#define RST_TIMER5			83
> +#define RST_TIMER6			84
> +#define RST_TIMER7			85
> +#define RST_WGN0			86
> +#define RST_WGN1			87
> +#define RST_WGN2			88
> +#define RST_KEYSCAN			89
> +#define RST_AUDDAC			91
> +#define RST_AUDDAC_APB			92
> +#define RST_AUDADC			93
> +#define RST_VCSYS			95
> +#define RST_ETHPHY			96
> +#define RST_ETHPHY_APB			97
> +#define RST_AUDSRC			98
> +#define RST_VIP_CAM0			99
> +#define RST_WDT1			100
> +#define RST_WDT2			101
> +#define RST_AUTOCLEAR_CPUCORE0		128
> +#define RST_AUTOCLEAR_CPUCORE1		129
> +#define RST_AUTOCLEAR_CPUCORE2		130
> +#define RST_AUTOCLEAR_CPUCORE3		131
> +#define RST_AUTOCLEAR_CPUSYS0		132
> +#define RST_AUTOCLEAR_CPUSYS1		133
> +#define RST_AUTOCLEAR_CPUSYS2		134
> +#define RST_CPUCORE0			160
> +#define RST_CPUCORE1			161
> +#define RST_CPUCORE2			162
> +#define RST_CPUCORE3			163
> +#define RST_CPUSYS0			164
> +#define RST_CPUSYS1			165
> +#define RST_CPUSYS2			166
> +
> +#endif /* _SOPHGO_CV18XX_RESET */
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..9aa28ade73a4 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/clock/sophgo,cv1800.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include "cv18xx-reset.h"
>   
>   / {
>   	#address-cells = <1>;
> @@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,cv1800b-reset";
> +			reg = <0x3003000 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>   		gpio0: gpio@3020000 {
>   			compatible = "snps,dw-apb-gpio";
>   			reg = <0x3020000 0x1000>;
