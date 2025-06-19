Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE971E502;
	Thu, 19 Jun 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317240; cv=fail; b=h5mLBfN46MI6GRSC7N6bWfxOtuJEjKZHTA9ECXkjxyXGLlGq9Fkwy/Dc4egwqT7aMxSuXhKL7sphRxD6eIVnN0QIcdAbjSBSJrZWJmR8ANVWS+rmlf35TWTxgpyA8F0tVVtXJxMrW2Jzhvghu4xqR5A6OzIj/9ir46Z3Kzmxm04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317240; c=relaxed/simple;
	bh=Rqjo/94dxfPCyQlHNYDqgJbMeVdBwmX04aPM7iaecF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cdeHTORBzCAlvfdvLacnrz95ddhFJuOFog53rl8tuikMNRhO8Lgl6PSbm6N8Ph0HculRU3bJRJ8yUWq6/KMBSaXdd//0R2RaGyZX5tOvRis7aCXbUpNGHwZ2JskSOVVtU2TKyUzeFzh9gfW+g8CB29cEu4UwxXOVdNKbqkRUoJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HLhZF292; arc=fail smtp.client-ip=52.103.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HLhZF292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8c03ZcRtQDbjAi0a5VBzVGMIkCa1EggQq/FSxmggZGlaxcjm5Zz97lSn6j5pZ3YYZsDrCTBZEuKT5+0yt440WLrBZtOk2RIA+7ESpsgMM1T5aAgZzsjeV4DwgSzdiAdb444YKwE1XM1o+LrFBOA05RfAL1YaLr6js2K5bWAS8P9gDePcThxwd7lTI4a1RgYfBP+tUbgnkWisUsLOnHp3syvy8RwkFR22Xf169ZhnJS0amx3L1Ca+ap7tKSF2BMDYP5TspRt2Popt8W7xq4TkhDJiylBd1jZEsDOdli+8qgEGYjygJgvlg3marxtl+moGWvUqfjBsrf6GziM+u21zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAz/FXwOH5BeeNcsFI2Fb6QJ73tG1sSzRQWHJKoCgFw=;
 b=gec9D7zOdUSyqAESxWCEji1kiSA0QCI9coRo4BPU1ia6psc6LI11OMCLdK40XdCdtvFGw3/vZOPI24poMLuR2LGRlCSEFShytJ53ydg9KpWA8yDP9fifVoNzCuDXERmIahjeQ58uZm8gVlLOiIAJ/lOOVXGwCCTlIHWcMYaKFlQah/uI/pW2XJcL4owHuLp09V79pRqaJGBGDmiOsxzBmCXDmbfnBh7OHFrnrhXZaqzNyEDv2wdbf/SotKrgfX+Vee848BHS9N3bfInW/42+LM/UYvUlN1Dt0pqOxaE8WRB1Xdq8vuRmj0yxl0XhbFeM3gYELz0cAbjjpp42MWbVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAz/FXwOH5BeeNcsFI2Fb6QJ73tG1sSzRQWHJKoCgFw=;
 b=HLhZF292TOxNQ4ShNpaImBo8Q3fbEuEzPEFaQDTrTljkdX0L2nH2PuLg7RN3oC30ZVv2b9NgVfy3NnFR/iMRCFhYUV6dUddfwAAIbU9o//bmYNKxQQVPfAuawzdhpHod7qyg8WbA/xBIN47DxFl5Q6SEGLp1RY+k222c8i9Ka+M0r6duYWLmqhxhhwjQSgDpO2LihRmO0R4187D1vTRPnv/5K3GdM3OG9OHD7+eLKp1OEoWifBp1F8zafaybQwX2l0fq/4JbCEPg3hhAF1WalVAfMIUDig1pC7mCGSuDOu0f5PY/FrFrte/f/x03VhxVgClM+okJNflhTRxNhgVjIw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0489.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 07:13:50 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 07:13:50 +0000
Message-ID:
 <MA0P287MB2262FA77FD547D60257FCC1CFE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Jun 2025 15:13:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: sg2044: add MSI device support
 for SG2044
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>
References: <20250618015851.272188-1-inochiama@gmail.com>
 <20250618015851.272188-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250618015851.272188-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:15::31) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <4cacf407-3853-407a-9701-83e11c7751e3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0489:EE_
X-MS-Office365-Filtering-Correlation-Id: bbee5730-63da-4b3d-f9db-08ddaf00d6ea
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|5072599009|6090799003|19110799006|461199028|8060799009|7092599006|3412199025|40105399003|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXBodytUdDFDOGpQb0tsREN0dWRaMEgrVE9aOEVWaWFVS0Q5WVFWS05iQmtE?=
 =?utf-8?B?YkhNcTU0b1NER3B1QUFLRWF5eW1xZ0JCM29sbWNyb1ZSMWdnQlR6YndXSTRp?=
 =?utf-8?B?VjZVQzgvR1k4TWlXbmJzckFzSzFROXJKbGtDaVM4eTdTeTBEZ216ZktGWmNj?=
 =?utf-8?B?cTEwcGQzQUZFZXVIOGdQQXF4Um5UUXZzUG1hcnVTVFFMRHVxaEp2eWlOYXhv?=
 =?utf-8?B?U3YwVjM3YkRkL1FxN2R2VzVRSkFzSXFkak91QitadmpiRTFmdmtOeHJEZkVE?=
 =?utf-8?B?ZlpPT2NvWHVnUXN2WjJkbWNhWURZSnZDa1BrZ0lpU2lyeTFUcEFDbTV3eFov?=
 =?utf-8?B?OHZzRmxwRnh5azNVelJ0bHZVbzQxM0lFVC9HTS9mY3ZtVGxMY3JsSnJZb2lX?=
 =?utf-8?B?bm1HMURFUXdodG15aVlBWHRvaHJHaXJ1UmlYdHY4c0dOM2JjT05XbW1qTDU1?=
 =?utf-8?B?OVg4UDF6cW10eEVzWkZWM3VGcjZaMXordkdncTNYSENBUnVlMWk3TU1QMVJH?=
 =?utf-8?B?eVh6aWphejRWcmg5M295cTd0THQyU2pTMFljTnU1UFVMM1duNWNNcmJyeUhE?=
 =?utf-8?B?QjJtUFdrdmRLNkVPRXYvZXY3ODVvMnpsZUU2UW9Ub3E1eU1uOVR1OFRpSjlo?=
 =?utf-8?B?QmlVMkhqTXgvMVc4WG5zTXBZbG9KUGtsckJmQ3JSbis2LzhmQzFZdFNmdUQx?=
 =?utf-8?B?cjI5d3FiSkMzb3NyZVkyM1lJaGhIRlJhekR2di9WSFd3TzdFbmptL3ZzbENp?=
 =?utf-8?B?VzdiUnplRTNVSGExbnpkZTFPcU1pQUpPaHRQQXpUeDZMNTN5U3VFOC9RZmxK?=
 =?utf-8?B?ZXhFczZEcXJ5WGZIMnhpbmJmM05TaXRWU0tXL28xWGtGanZZNytuZE43OWdj?=
 =?utf-8?B?NEIvYmlmZHpNUTJJeWE0dkNlc2RuQ2xwR0gzcGV2ZFRheE1RSjNuVTB6R29Z?=
 =?utf-8?B?SFF6WVpEM3A2UWZQKzBZQ1VDK3Rzb2RXU1FoOXl1WWVSL0thZTdZOVNPYnl4?=
 =?utf-8?B?RnliVjhrVnZYWW5leG0rRERpOVZJenQyTXdvOFVOaXdMU015NnZCb0w0Z1p4?=
 =?utf-8?B?cG5WM3YzckdBUFUxR3dISVBBVzdGeTZIdW0xdTIvUTcrL1FQNktNTG5yY0JD?=
 =?utf-8?B?ZnI2RVFDdXdkeHhjNFA5aXdjek5wVThjSDFtY2FRRlNNT2tLYkpLOHpJOWpK?=
 =?utf-8?B?NkRpbTVWMW1QNXlZSTJtdW5TamNHOUZSZkFsVUVjZjgyZDcxaEJ6bVVJeDNK?=
 =?utf-8?B?MFhSL0hLMXB4VkMzLzZJQThQMDMrK2dCWjhQbmNZNDdkZnJEeDRZVy9aMkhH?=
 =?utf-8?B?NEFpY2FGc2R4VEdibG5ycTdob0F3UDA5U1JCRmtzcGNOdTUyS3ExZkN3VkFR?=
 =?utf-8?B?V3Q4cXRLY21GdUFBTEZIZkxEQTB0WkZ3aWpsd0lSeGg2clcwQkFHWmw3TUtX?=
 =?utf-8?B?WDhVZitsdFdPVXlKZzB2amNDeXd0RlhEd2ZKM05rYm9TaVFYYmp0c2NuNGdl?=
 =?utf-8?B?bkRjbzV6ditwcjJOczV2MFdhMnVmcmRZV1ZjZVRYWHNINGdsMkFlNVNERUM3?=
 =?utf-8?Q?Z6OFsebHtcRfoxsf6E0ltyPNc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHFvVmoyc2lxQXhhQ0gxTEVTbHpMU2RGbkwvZXJybUorVHF0V0pQS2Z6QkRQ?=
 =?utf-8?B?WUJSZlNsMDdOZUVsLzBIenMrZW01dkR4R1RyL0VnZ0VBN0ZILy8zZFp4WWQ4?=
 =?utf-8?B?Nk9qNVc3ZlpzdUh3TXE4SFdiUmpVVEgzaVNCTjRaQzRQbmdOMkc4eUttWHIv?=
 =?utf-8?B?NTJScmMvaERPd09lR2N4VU53cGhYZ29VMzVEczVvNFFOeFlSYXR0ZEF3ZFZN?=
 =?utf-8?B?ZGpGcHZQQWkwd1d4QXR4YUoyZG1YQTZEU0lVZy9rbWhKWlFwaGd6ZVhtUDhr?=
 =?utf-8?B?MlNkZmlHZ1N4eXZFYnY2U2hoTkRwcmhUT01aRmhlODN4VnJRMnp0VDhvMlgw?=
 =?utf-8?B?YlhQMjN0L2dtNktjMTNZZTdmWXpOaEVVMmJtT2hCQ1VZQnN0YytRY1dPeHBj?=
 =?utf-8?B?a2JGb2dNaHZXN04vUzV3NUd0Yzdxc0NwNzVmbTA1b1ZzUzZTT2dKM2lrS3Jz?=
 =?utf-8?B?dVpLQ0NKNUdQaXpKdlA5aWsxQ1Axak04ekNHWXlVWFdFSXludmxFTnUzeGVX?=
 =?utf-8?B?U242RmlkV2tmRjR5bnUybW53SnNScnpVTjM3NGxuWE4rcGRveVFxSU9saFVN?=
 =?utf-8?B?eHF1RUIwYVVHWnJjL0RmSzJDNUlKUU0vMEtHWnJIWnNpcUtRdG1OL212TXdC?=
 =?utf-8?B?VzBmd1M3VnNBTTN2UnN1V1VVa3pCaEpwRW5KYmZyLzJRb3BFYWQwN0J1SUNB?=
 =?utf-8?B?RWtCSkdnd1VJYXI3aWpQVmJFZ0YrVWJPOFFGZk1lOENGSUtXR1FqRUM0WTZL?=
 =?utf-8?B?akdseW9ma2w2dlNpdklZTUN1dTdKNFQ4K1dOQjRBaW1IR2ttTEhybHdiQWdG?=
 =?utf-8?B?NEZNNWVBclo3YkZPczhjMnluc0trTGsxSFY1dm50US9wRW1sMzhweVV3Szg3?=
 =?utf-8?B?T214MGZmWlVIdFhhWnhyd3R3T2NKczVaRUJ5b0VlcGFabzFsemhVNzlMTUFl?=
 =?utf-8?B?Z05SblRMeWxVZ1BWbGN2cDJuQ0JMa0hRdGU2WitUc0FwSkxTUzFVeWtWZGM1?=
 =?utf-8?B?UVZQMjVBOEk2UURMZEM1Uzd0azBYYm5tSWR2MEszV3JMQ0FSNUZpcFdPbXFL?=
 =?utf-8?B?anRSTWU0bjY0R2RpWmp6dlN5eXI0RGZhN2hiRVBVWGhDMU9XWGgzSmdsZFI2?=
 =?utf-8?B?MVJoOFBpeHJQMFVVdWpvYXQyeEg4TUQ1b3BYZWl2ZFY0VU53Q3JPTWQ0YWwv?=
 =?utf-8?B?SUUvYUEyLzVhUXdTbW00YXZYVCs3T0NGTkJpY1dRM2hOMytDdmw3Zk5QWkdJ?=
 =?utf-8?B?ZW1OaFZQYW8zWjlGT0plOXlwNFlmSEJQYnFLNWxheUxGWEdWTUxBR3p5SEhO?=
 =?utf-8?B?SHlNdC9EeUM0REtRQzI3bWVLTVJtNTFhdTBCVUZkOWZBMXNTNzN2bWtmeVE0?=
 =?utf-8?B?cUtsU0RYN3NRaUFHRW5Nbzd0cjJkbkJzdysrKzVsVVZIakkrRDdjczZwSFRQ?=
 =?utf-8?B?aWxPZWY4VWRjQzNkOEhUc3BOdWJwN01sYVZhei96cEt5RFl6VDNVbkNHVmZo?=
 =?utf-8?B?bDBUVzZPSEw2dmxpV2hOS2dQbjBWZThCamZjQlpBNkxrbm1ON05wZ1pzZ1Fz?=
 =?utf-8?B?cGRVQ3B4d0laZU1EVGt2RG5kS0lncFJFYkJ5V0g5ejhsSnNkTUZidm4rKzJ1?=
 =?utf-8?B?am01L2FXVlJWa2FOMHF3Z1lMSjI1NjduWHJFbTgvN0tRVkVucDZwQWpUYWdv?=
 =?utf-8?B?OGM1Q3hoL3Jhc1F5dXRjQUZ6VmZ4R1lZdXNHdnowM3dlR1VnS1g3WkVpeFFy?=
 =?utf-8?Q?s3UHTwn9beR9zpbroUWnb0lI9UxUeRSzuC5Jwsr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbee5730-63da-4b3d-f9db-08ddaf00d6ea
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:13:50.1606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0489


On 2025/6/18 9:58, Inochi Amaoto wrote:
> Add MSI device tree node for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 11 +++++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index b50c3a872d8b..c97bd62e5f06 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -63,6 +63,10 @@ mcu: syscon@17 {
>   	};
>   };
>   
> +&msi {
> +	status = "okay";
> +};
> +
>   &pwm {
>   	status = "okay";
>   };
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> index f88cabe75790..aae4539dea98 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> @@ -32,6 +32,17 @@ soc {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		msi: msi-controller@6d50000000 {
> +			compatible = "sophgo,sg2044-msi";
> +			reg = <0x6d 0x50000000 0x0 0x800>,
> +			      <0x0 0x7ee00000 0x0 0x40>;
> +			reg-names = "clr", "doorbell";
> +			#msi-cells = <0>;
> +			msi-controller;
> +			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
> +			status = "disabled";
> +		};
> +
>   		spifmc0: spi@7001000000 {
>   			compatible = "sophgo,sg2044-spifmc-nor";
>   			reg = <0x70 0x01000000 0x0 0x4000000>;

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>


