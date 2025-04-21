Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7BBA53;
	Mon, 21 Apr 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745232201; cv=fail; b=n+aQ5JxHiyZdpxYTx6WYzAw7B6hTaegjRgTQyO5apybn2FaVTmVK5N67GY7e5es5AEbC6snoQhKYeujprsllFTfQ+yGhjywreZ6cxuwqbl3L3/6T1RXtD9UuSPse1+w3KAWG53MkzGjFFkoxIJBoRKvzchE6ac+X5bDD2cvdYJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745232201; c=relaxed/simple;
	bh=9usfQOxMPr4L79N6FCl/bZCe49AVF2wrUPt2ZccBB5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=imPnJ+tAXB+AUbw2wZx+NTEhUoFQBNUUynM4BaY5foSpHkddEWtOrU9WGQ7yoLIvY8wOFvdWhjzpSk8kOargvQ2qI4eoNznnViBdVGr0BcQ7RTM/q3mgb57uS6TWCy0tIoaZKyKYJwkMomEQFCa6LAcpZnCYNdDsHwkQzRUKWRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UT7DX4wu; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UT7DX4wu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSnbNZSBf3EmK201fpPz47V0C369R6dsCI5oeN6gSgbVF+ObksIgF10UH7xxxJL6/axY6naZMmcx0Mw/z4Y9R0y20OP5G/Uh7FmMuvn2GtQDgFHeNdOiCvErAvr4DXElUXzD8+JIx761fQOCkRiiEX82/5wfSPBlgtQgRcI9tC9OMS3bNWt81mpV7Wsv/yNsqlqNx3Nn8UmmKalhnhQp+iHddYMlhCLukxF5tK/fdstWkq4TwdnP0b+hL1Vu/AcFMe1IB15FxuHwPXJksu/bQyQPtQWRbIltHSRVnaRPscZJdE8MD40zDCarWq2fYI/cYgVKnxc7t7aJTSIrmdR3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR3TUfkJ3UvFJHZYGnTPRez5ZwtR7PDVm8O2fgk7AKs=;
 b=ZthuGsZbpUuMv3ZFGLFVQzvf8lSZCca5iAQ4Bmgw8KB5qXL6RBnidF9AawKyXcvzsusPeSUVF1roRg7Dw8co4YLjvwnyFSmDXt2rpV7BMMnuLYZgxm5d28nkx8UJqTpl9Mr/D1wGkxEYQt8AwYHI9Zd0pIXwtXaTC9ppb5Wn0IlDpoB95inn0yYMX5UynLgFDdy1onYGwTEIpu//q6fTa0ib7y2K8J+B7W3AAkyfWvayNM83Pkq4MnvuJQx992oDQ7bfME1ER6aPillXM8oSzJ24jmjGWfZc8sHzjybUdUbGQSt4L1RchFnUS3nIaTonnJg7CyDaofx3obD7Oyr4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR3TUfkJ3UvFJHZYGnTPRez5ZwtR7PDVm8O2fgk7AKs=;
 b=UT7DX4wuNaNu13h6P3vugLWs5uMfVNGKt6u/ZxImRmz+aXPaiiFD31S5WulsVPVpfJJGhYZE+zYv4/E/LsNaHAewy0WMDSjWV6F7L9AmQtVHSQV3DGe2CGGvDxASUeanosrOCnDHy105VIc7Px+D8UzTKxWH65HQx9vroUi4gzkF0O7ji/5KJdHjdyzkfsel3ZvS4ABLVDTwQlyOPul7WHZmmziJxRazbYTXQnL3xBQv0r74KYDsyrtrgl1YwjTGFeZQbLk8nDmdA6EreEyh8tBlqHBF5ciM4boPH2LwpA+vJXhUZ7Osi91h1FxKN2G5Xv1zZ/dXSLg8ns4+E5WoAw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0665.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:43:10 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 10:43:10 +0000
Message-ID:
 <MA0P287MB2262F6D556E48A73E317553AFEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 21 Apr 2025 18:43:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: Xukai Wang <kingxukai@zohomail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <db5d29ae-0804-47b3-b3cc-32ec5526f1e0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0665:EE_
X-MS-Office365-Filtering-Correlation-Id: 111611ec-3ee8-4e2d-b056-08dd80c14f43
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|8060799006|5072599009|461199028|15080799006|7092599003|1602099012|10035399004|440099028|4302099013|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c09WY2w0SXhIbW40VGlQVnV5cWNma0JQeUMrU1lLbEpWbGpYc1hVTTRmcjkr?=
 =?utf-8?B?SU1Jcmc2UHJUR2xqcUQ3MHY4K0ozOUFEdXBjT3M1MHYrRUZTU0IzN0dsT0px?=
 =?utf-8?B?aGVURkljU0ovb1NpWGoyeUpMM0swNnBNRkVkdDJ0aWpsSXlQVmk5aVU0MTgw?=
 =?utf-8?B?UVJiQTJwL040Z3ErU1lucEMySmRWdlRPbitSd3o2ZEhweGxLVTlmVzBFQjhQ?=
 =?utf-8?B?ZVBySjFmcDhDL1pjM29XaWhFZ2lMTmVwTlpaSFQvc01zZEtOSDJYcjhvYVIy?=
 =?utf-8?B?aCtxYVI2Ny9iMGdhVytoYXVxbVVCVE5MUEJOc1M1WldmOFdLanhzejVjRXV5?=
 =?utf-8?B?SURHbW9jWXBxbTRzN3ZxaElKRHY4SUZjN0xpdC9HTGViTGRTVjJqUmV4Y1hv?=
 =?utf-8?B?WGtwK0lQcGN5WEYwckpYektkVnJUVEVKTWVlNytiQ1NTaWFJUlMvNXJSdUZD?=
 =?utf-8?B?Nlp0eDJ6QXdQcEhEWWxRbWFUbGI0L2R3QnB1UDA0S1hsTTE1OVp0VXdXcHBk?=
 =?utf-8?B?dStNbUlkaTRVN1R1SWRJWURaK0s2ZDB2d2lNcnM0cEZyd3dGZllIUGlUMUFD?=
 =?utf-8?B?d0IrTXZ3VkdjaEl2N2dYZmcxZ25FbEpHdU1FY3pheUpwTU9EWUNRQ3BIZHZ5?=
 =?utf-8?B?MlB4SzVoNE4wYlNtclhwbkEzQVhCTSs0NGRUNEw0UThlSGhabW1CQzQ3ejJJ?=
 =?utf-8?B?L3RQYjUzRENBdzBxaUpmSlcxMGd1cUppcEYydklTT2JVYnB1MHF1UHNQQkZK?=
 =?utf-8?B?dzlleUFCWmJPRlh6RTFmZDdLai9ydVpXV1g3djQ3UVBmdUM0UjRaQ09Denc0?=
 =?utf-8?B?Q3RPRnJsRjlUTlRoQlJrRjNrMWh0aW9ldVN4dStjVis2VEVhRWRCNXpJWVM3?=
 =?utf-8?B?T21WK1dZYU9ZWVhHSGZPbjBXVnJUeE1zZG5LbElkQ2FlbzVyZ1lCQis1MFp2?=
 =?utf-8?B?VXMyYzFpNUloOVk3dzlTU2RlT3pOZEdxZzEvdlZMTU10THZ2bFB0aVJCMlBT?=
 =?utf-8?B?dlNpSDVDbVcwaHVIUHJzYnBBVHlsVCtIVkttaEU3OTJvWDZqdTNWS2RCSStZ?=
 =?utf-8?B?bE11WVkvUzR4UlhVTW1mMU1zbHdqbDFlaERpRUhOa2hpSWwvNUZqTFJXOTdv?=
 =?utf-8?B?VjM5SjdWOEptSjJZM3hnOFdRWElidEdmQnBELzBjSGFYQjJvUmZqZ2w4K2Iv?=
 =?utf-8?B?NTdhdTZObWNoZEJSSUdZSzY5VmRtSlFNSDFlTXl6U1FVUHRYMTY1VGJPREto?=
 =?utf-8?B?VXhXaHhqTW9PMHBZNEM3R2FaZzNYdUExNlJFUlZDWEw4eTcwWEw2SHFpSlRF?=
 =?utf-8?B?enl0OGE3R0IxektUS0FROXI1S1dIQlZ6YndWMkFHMm5LQ2Z3cE4wNDhXWU5K?=
 =?utf-8?B?MzkzMTR0eWcxOHlvMThMb0M0b2hDVWtWeXRaTzBWVUZwK20vemhhbjBMczNG?=
 =?utf-8?B?OFVVenU4elhpK1BHYWYySXE1dXNEcHpxdU9NeXcvbjd6NkhzNHVXNXBpRSti?=
 =?utf-8?B?MFZaajlCNjlTcG9TSGNLWGlKUjlEbWpMdUppMnltU0Yzczl2YlROdy9CUDRn?=
 =?utf-8?B?aFAxbVZUOWQ4ZnplcEhPUEdkRXRWKzhxMnBreGR2a1F0Zml4ZDIwdGE4MU45?=
 =?utf-8?B?RHdCbmk3MElBK1dYL0FIUmZnQ2VHY1krcHNiVE5KQlVKSGpoVWlCNGswdDFO?=
 =?utf-8?B?aHEwQzd5cUt6bWdRd0dVbEJXMjd4QVlYSXFvamlBcGc2bEp4NmplTGZmQlpz?=
 =?utf-8?B?ckpIMFc2dkZFSHhhYXFlNlRqbDlWWmhPbVk1cDN1dk0wUit0VUIrREVkZkhx?=
 =?utf-8?B?RkNPM1FHMzAyRDRoVEFzdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2dNY1hNdWk1RG1SYXJPMlo0MzQxelZZZmdvQjcyOUIwMm9mL0lIRzVOM0ZT?=
 =?utf-8?B?YWhkd0d3QnZaMHlsNHBpZ1ZPLzg2SkV1a21SQWd5emxpMG1idkxDd1h1eGt4?=
 =?utf-8?B?Rmx2YkIrKzhNNFhzdGpONU10aFc5VFN6QnlmMTEzY3BBN0dxcW81T3k5ZWhG?=
 =?utf-8?B?TW5GTjJWWnRzKysvSXZqdUFNL2hoYU9lQXVmdmlvd0dLamFQbXB4ci9KMjNY?=
 =?utf-8?B?UytJdlFtMklpMTZyaDk4VkgyL0dzOWdSRGtmSENmYkxOU3J5SURUZmp0UmFV?=
 =?utf-8?B?OWE3bnBLYStZZGpJcTFpUkxtOStmVE9YK3g3UDhOdy9IWkNtd2dFbmxJcm03?=
 =?utf-8?B?Z1F1L0d4eGNIc0VpcDZEVFJtUWhwSnZJUlBBWXhKeFJqZlc2TmsvWU9LZUhG?=
 =?utf-8?B?TGZIbmUxZGF3dVVwemZiN0NnSjVScWFDMEk4eWdKKzdKVHVYc09mS3ZKZmNn?=
 =?utf-8?B?dDZWZ1lJUE41d2tvd1hkQzBZbHpyd2tlL0JXYml3OGdESmRXZXBBeWU4SG1Q?=
 =?utf-8?B?V0s2bXpiKzUwNCtSaVlkcVg2L3I1YU5rWXh3L0JoZHZkNmlPaEEraldaZlVp?=
 =?utf-8?B?RVhMbmxha1diOGc1SWZQa3BQWVVLOUFZODFIMXNjb3FoQ0U4VG5ocEVzdWNh?=
 =?utf-8?B?WkIzcWRsaVE5TFNFUnRXS1Nad0dISVpPWFM1SEJCaWdSRDZ3VllXdmZJc3Mv?=
 =?utf-8?B?V2RrRWZKeUJoRDArdEZuWkpoYXVlV0IyeDNjc1Qwc3JBWEFVYitSZkZ5cTFv?=
 =?utf-8?B?cU1lRDNYWmZpazFqY20vRjNVTDBCQlZqRXk2TmpDdTNqaVVJdVdsWXdoOXVn?=
 =?utf-8?B?ZEpwTHNCNDJNa0NVUzc1SU1vdU51SDhZMmExTDlPRE9tTTdCRmY2L0VXTU9K?=
 =?utf-8?B?YlZsL1Z6Nkt6bDZLU0gvWVVPa29oSGpseVVaWlZ4eWtMUWVJakYrNmh0Z1Rl?=
 =?utf-8?B?Tnp1WFBhU05sVisrbGMxeEp4SXNnSXovYkVWaENRbjVPQ1ZHaTlmNXBFN0ds?=
 =?utf-8?B?Zi8yWWlTbkE2WDYzUXlDaFUramR4dkdzUlVsUlA3c1lUUkVDSCtXbTZRTlI2?=
 =?utf-8?B?UnRUZTZzbTZTRk9kRFdQeGNCZFlORlFEdGJlcXhXU093R1dYblI2RzVSSXVL?=
 =?utf-8?B?dklqUXpIU04wWHprUC90WDdwOUljTjRqK3NJa1Q1SEdLb1ZDbWNRRVhHZGJ4?=
 =?utf-8?B?Ykk1VE55bU0zVjJ1OUhZWG5xTmU1b0o3MkRyRjVlY282V0VweVNheUJyMTY5?=
 =?utf-8?B?QlZ1djFNMnJRR1loNkx2ZVpyOVBOajNUVWdhdHBmYVlBamlhaWM4U2lJZ3ZI?=
 =?utf-8?B?Y2VianNyK2tIQmRTOStpUDlxV013c1JoNVc2UTRNb2hPQkJINVFJUXJNakUr?=
 =?utf-8?B?NGE0MlFqMm1TcVJiZUJiNVJUQnpoSmQvQ3hpRHdCdlU5bi9NaXdvNUhqRjRa?=
 =?utf-8?B?Q0h1dmRXMXkxTnp0VXNPSzlKK3pUYVc5Tm9jZTB0V3QxWVRsd0o3VlVjWVFk?=
 =?utf-8?B?c0hBTXVxY25iSm9ldGhicThMcXQyYklyS29KVHFKQlRSWGZ2QUhoYmxoUzBv?=
 =?utf-8?B?TzRtZER3SWRXSGFNNzgwWitSNzdoUlRCT0E1YmYyRUE1VnJkcmZocFVHM0dk?=
 =?utf-8?B?WDJNRXorKzIyTkE0RHluREJvV0VjNCt3eXZiWkJEeVl1cG1RT1NMMUxVUUVZ?=
 =?utf-8?B?Mkw4RUhWWkV1UkNVcEZUNGFxVElIRlVaTlNmUnk0THRLMzhMclRMQTNTTStl?=
 =?utf-8?Q?lablGHpQsJB95LV+hFlIhZ3tEROLvN3L00aHcfU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111611ec-3ee8-4e2d-b056-08dd80c14f43
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:43:10.6969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0665

Hi, Xukai, I have some comments below.

In general, my suggestion is that the code can be further optimized, 
especially in terms of readability.


On 2025/4/15 22:25, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
>
> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
>
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>   drivers/clk/Kconfig    |    6 +
>   drivers/clk/Makefile   |    1 +
>   drivers/clk/clk-k230.c | 1710 ++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1717 insertions(+)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>   	help
>   	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>   
> +config COMMON_CLK_K230
> +	bool "Clock driver for the Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +        help
> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
> +
>   config COMMON_CLK_SP7021
>   	tristate "Clock driver for Sunplus SP7021 SoC"
>   	depends on SOC_SP7021 || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
>   obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
>   obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
>   obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
> +obj-$(CONFIG_COMMON_CLK_K230)		+= clk-k230.o
>   obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
>   obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
>   obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
> --- /dev/null
> +++ b/drivers/clk/clk-k230.c
> @@ -0,0 +1,1710 @@
[......]
> +
> +struct k230_pll {
> +	enum k230_pll_id id;
> +	struct k230_sysclk *ksc;
> +	void __iomem *div, *bypass, *gate, *lock;

No need define these iomem address, just calculate them and use them 
when use them. The clock reading and writing efficiency requirements are 
not that high, so there is no need to waste memory for this.


> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_pll(_hw)	container_of(_hw, struct k230_pll, hw)
> +
> +struct k230_pll_cfg {
> +	u32 reg;
> +	const char *name;
> +	struct k230_pll *pll;
> +};

Can we combine k230_pll and k230_pll_cfg into one to simplfy the code?

> +
> +struct k230_pll_div {
> +	struct k230_sysclk *ksc;
> +	struct clk_hw *hw;

I see k230_clk use "struct clk_hw", but here we use "struct clk_hw*",  
can we unify these?

Just use "struct clk_hw" and init it as static global var should be 
enough, see drivers/clk/sophgo/clk-cv1800.c for example.

> +};
> +
> +struct k230_pll_div_cfg {
> +	const char *parent_name, *name;
> +	int div;
> +	struct k230_pll_div *pll_div;
> +};
> +
> +enum k230_pll_div_id {
> +	K230_PLL0_DIV2,
> +	K230_PLL0_DIV3,
> +	K230_PLL0_DIV4,
> +	K230_PLL0_DIV16,
> +	K230_PLL1_DIV2,
> +	K230_PLL1_DIV3,
> +	K230_PLL1_DIV4,
> +	K230_PLL2_DIV2,
> +	K230_PLL2_DIV3,
> +	K230_PLL2_DIV4,
> +	K230_PLL3_DIV2,
> +	K230_PLL3_DIV3,
> +	K230_PLL3_DIV4,
> +	K230_PLL_DIV_NUM
> +};
> +
> +enum k230_clk_div_type {
> +	K230_MUL,
> +	K230_DIV,
> +	K230_MUL_DIV,
> +};
Please document what's meaning of MUL, DIV, and both? They are type for 
what?
> +
> +struct k230_clk {
> +	int id;
> +	struct k230_sysclk *ksc;
> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_clk(_hw)	container_of(_hw, struct k230_clk, hw)
> +
> +struct k230_sysclk {
> +	struct platform_device *pdev;
> +	void __iomem	       *pll_regs, *regs;
> +	spinlock_t	       pll_lock, clk_lock;
> +	struct k230_pll	       *plls;
> +	struct k230_clk	       *clks;
> +	struct k230_pll_div    *dclks;
> +};
> +
> +struct k230_clk_rate_cfg {
> +	/* rate reg */
> +	u32 rate_reg_off;
> +	void __iomem *rate_reg;
> +	/* rate info*/
> +	u32 rate_write_enable_bit;
> +	enum k230_clk_div_type method;
> +	/* rate mul */
> +	u32 rate_mul_min;
> +	u32 rate_mul_max;
> +	u32 rate_mul_shift;
> +	u32 rate_mul_mask;
> +	/* rate div */
> +	u32 rate_div_min;
> +	u32 rate_div_max;
> +	u32 rate_div_shift;
> +	u32 rate_div_mask;
> +};
> +
> +struct k230_clk_rate_cfg_c {
> +	/* rate_c reg */
> +	u32 rate_reg_off_c;
> +	void __iomem *rate_reg_c;
> +
> +	/* rate_c info */
> +	u32 rate_write_enable_bit_c;
> +
> +	/* rate mul-changable */
> +	u32 rate_mul_min_c;
> +	u32 rate_mul_max_c;
> +	u32 rate_mul_shift_c;
> +	u32 rate_mul_mask_c;
> +};
> +

What's "k230_clk_rate_cfg_c", and what's the difference against 
"k230_clk_gate_cfg". Please document it and clarify this.

It is recommended to add documentation comments to important structure 
types and their members.

Regarding how to document kernel code, see 
https://docs.kernel.org/doc-guide/kernel-doc.html.

[......]


This structure definition looks a bit complicated, with nested structure 
pointers. Can it be simplified, similar to struct k210_clk_cfg in 
drivers/clk/clk-k210.c?

And can we use composite clk here?

[......]

> +static struct k230_clk_cfg k230_cpu0_src = {
> +	.name = "cpu0_src",
> +	.read_only = false,
> +	.flags = 0,
> +	.num_parent = 1,
> +	.parent[0] = {
> +		.type = K230_PLL_DIV,
> +		.pll_div_cfg = &k230_pll_div_cfgs[K230_PLL0_DIV2],
> +	},
> +	.rate_cfg = &k230_cpu0_src_rate,
> +	.rate_cfg_c = NULL,
> +	.gate_cfg = &k230_cpu0_src_gate,
> +	.mux_cfg = NULL,
> +};
> +
> +static struct k230_clk_cfg k230_cpu0_aclk = {
> +	.name = "cpu0_aclk",
> +	.read_only = false,
> +	.flags = 0,
> +	.num_parent = 1,
> +	.parent[0] = {
> +		.type = K230_CLK_COMPOSITE,
> +		.clk_cfg = &k230_cpu0_src,
> +	},
> +	.rate_cfg = &k230_cpu0_aclk_rate,
> +	.rate_cfg_c = NULL,
> +	.gate_cfg = NULL,
> +	.mux_cfg = NULL,
> +};
> +

Suggest use Macro to simplify the code here, see 
drivers/clk/sophgo/clk-cv1800.c for example.

[......]


