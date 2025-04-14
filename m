Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011033.outbound.protection.outlook.com [52.103.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4D19A;
	Mon, 14 Apr 2025 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744591498; cv=fail; b=lLMu7hUFQnTPEG4fUsPJeQCR2/2OFIxDTpuGHu4fEs8m0LvHomNI1BD9a1IZQXQJb/CbSNQPPTaS+Mxcort+fNm+HyIVWMfILRZQKrNY2vhjUfBsQky71V+2kioaKO8hYxIdPyqbpeWO05DgvBTpD9GqxMVbnFqgOUoOWM3PH/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744591498; c=relaxed/simple;
	bh=YjS9FB8NjtI0pR44rdcPrT4UZvbbI3l0F8VqIcR9Jgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pnYQlN1Jn7FyiZ/WF0O7H3kJBrob2ZpgcBmWq6Kz/pmixdFvx08xL52Vsw1ff3PPeDkQdsyrjBOx7ssIadkVsF109cFpEbsqwwubPpBEklK04YNBM4mh78syHdoLj4CE8PKRBICxIFC6QhXtORLrsOXb04GRtk4hcOn2jQLBMzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=n17ThWDq; arc=fail smtp.client-ip=52.103.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="n17ThWDq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT4nNjPQGGY9RTUVAQbLDLI/FqMgEuHw3hFACYBw8l8eTdvTEeQKMMLtKyMQdcwJYbnUckSRFAGAROoiV5svyOvYXHBsxHDqzEOW/i5c+oYFjJiIVz+4SicNHPMgK8TAucYDBqqJCRF1zqRB5rVf4YX/mJCiDSANakhAr2HUb88j/xHAGoRC5R3SUf2uEyrTUa3Pts2uK/zMGyr/+Pj7tOjBy6gCULVDHIQVGRQCLhZRyJizUBuVTaEOxBDrgJSvZO/qG7U2/hBoEnzKfyPjdP6CfRRFZRydnrmaAkHvqutCO4ypmXK35smbyMTnt5qgUf1Mmee/eK9zNNFyq7/KpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqgmkfwYKlXUdTRrDAA/LGzzGydfY0Bf4HuxntnTCxs=;
 b=c6FqviF3YPgDLTOfIiMnlgoqxEneusrAoyBtEmdefo/CF9fGBhIpnnhZhtNp6k1oMfZH9VFZ9Xw13xfXUQaPgNjVdCz3GFBY1lf6pG2MkHDeF3z4m6J+6//W+34P4XDQftLiTZw8Da+iJLUHoKm1ehAjSuUnDsBUUtSQTPtv6y/dOpPhwYZkLBLRPjh8HoPItkKaJOOw4Lhp15x3cRXMKITsAMYUhLjkJeKMBPhfloISDTgkEMuQGt1OiR3E0DsiinPSTIg9z5B7OvhB1KkhFuGZXYvfX2v/q+RtKi/EnA0P65O3i9IDVJsYazXxvcIv/duZbvAoc+lP7Z6I1xWbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqgmkfwYKlXUdTRrDAA/LGzzGydfY0Bf4HuxntnTCxs=;
 b=n17ThWDq3nGz1QFr9tc9mejoTn/Z3zyU7B1eKcF4C6TKobvb4e3goydW5yRYqMtqpCKoae4qTWce7smZSxTOrujMNk1+Agn7MTxbXZhHugAh2u1GTeztWRWpRML0qQbBSaWpmFgrv42DiQ72GATcObhRoj6PtWwpl+aXCKQwZIn/I2ulhmZBESh+5YJe2DLZQGRYOkpAAnuDo7SjvL/cPcy91xFvhdWQgVVB3jZpPZDupKsofpmmXhmqmH5Mi85lW6DacJkqAl3J4mdJmm1Ik+eg998OGTUIs92gXjdh2Qv9/9JjCgPnw0wB/3N7rB6slHMmAJSgw6vY9VtBzbY08w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB1488.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 00:44:51 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 00:44:50 +0000
Message-ID:
 <MA0P287MB226272482F161A5C6A74638DFEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 14 Apr 2025 08:44:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] irqchip/sg2042-msi: introduce configurable
 chipinfo for sg2042
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>, Chen Wang <wangchen20@iscas.ac.cn>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250413224922.69719-1-inochiama@gmail.com>
 <20250413224922.69719-4-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250413224922.69719-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <b5003c90-4a0f-4101-b373-8cc82950f62c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB1488:EE_
X-MS-Office365-Filtering-Correlation-Id: 67aad883-4e8d-4b0f-0f5a-08dd7aed906e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025|41001999003|19111999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEgwREZiaitSZ2tuOEE2anhmVUJXczFSU0dLb0FReUp2VnY1V1p5eHg1bWhR?=
 =?utf-8?B?ZEVzN2x4QnBoVnNzYk4yS1liZDNLL2VpU2NGS2RMaTY0TnM0VjA4b2hIYitQ?=
 =?utf-8?B?L2dTdUlkb0FZT0krM05YMDlCZ1Zzd2JoenlWYWxFN2JpL2hIWE12THlqejR6?=
 =?utf-8?B?NGxmakhYM29YbmQ4QmdRcG44NjFyaCtFZFAzNDgyZHBhbmZUSm53aU1CaHkv?=
 =?utf-8?B?Ym9jNFl6eVFxM1BLdUlKLzJVT3BKbEhIUUdSdjZjeEw3OVFnY0NQOWdKcEE0?=
 =?utf-8?B?V1Y4OHAxVG5ycnJzbGRCQXVOUGQ5Mld4RUFyRG5DcEFHanpkR29ZYU9KSHcy?=
 =?utf-8?B?RUNWK3ljWXgzd1JtU0lYOTNQYnRKNnIyT0RLOHB5Nm44U2tkdlhZajl4Ung1?=
 =?utf-8?B?eDhjRysyNTRmYnFYa3dRazRBaUFvck53ZmtGOSt2M0ttZHhiNGs2Y20ra2E1?=
 =?utf-8?B?TkllQUk0bUJ6YUdnMktrcDZMZjA4WFc4b2MxTnFqTzRERHNoTnRITEZhRzQ1?=
 =?utf-8?B?UjZLdDVJT3VmTGtjMFhqOUN5dnUwbkVSbnd4Y0J5RnRndExXdjVWcnJvUmNC?=
 =?utf-8?B?VXMwZ3NRKzFFdGg4azFEUU13cEppQjlmSGxHTmMyYmtiRTZxczNRZ2tTYjFm?=
 =?utf-8?B?TE1yb25HSExzMWdnKzRjbVgrV2h0TzZ4cldsVGRjVHFrd2VVVEVYVTRSc2Jr?=
 =?utf-8?B?MVA3cTBWUUp0U2ZXMDQ5WTZhQWFzU0xRY0gzRVFiMkNacndHdHJvM2ZGd0lW?=
 =?utf-8?B?aGpwUlJjT0hzdFQ1MVVXRnpuQktMbGJ0Ti9iMmdzMDdOWGc3NFlIczhkbFVG?=
 =?utf-8?B?dkFOb1RZSGpoYno3WnBySGlmS2VKbWtkRVoxQk9KT2NkeWxxZEt3U2tXc0lw?=
 =?utf-8?B?MEwyK3ZpeFRuTXdDWWhob3VyeWNNQkwyVDhsOWRCSy9CUmNtbWIrd1Nud0xw?=
 =?utf-8?B?Ri9wa3Rtb0kzWm0wWHRKNkE1dWwyaGx2dHYrcWx4elZHdzloSG9RM2hUeitQ?=
 =?utf-8?B?a2ZwWXNBcjlkcTJ2bHNlb1VEcHBHYWhEaFVtNlJCQ08zS0lhWmo0NkFDZWk4?=
 =?utf-8?B?NXhuTk54UkR2ZXhPVE9BSUcxUndSRTlKT1pTbVI2ZVQxdmpXQ1M4V1I0RDBN?=
 =?utf-8?B?TElZU0FnbkZya2E4L0Y5N0M1b0ttNUhIWmFIVE9WT1JUanArY3ZzMFJTZERB?=
 =?utf-8?B?a0l5NUQ1WGdHZ1dZOUVoZFptMDFjT3cwcC9ScjJ5VkxacklhbGNGZGk0M2Mx?=
 =?utf-8?B?elpJZFplSis2MkE0R3FCcUFYZGZQeVlwWkJQV2cwT0s0MVZkbjJwT2wwQUJY?=
 =?utf-8?B?c1lLWFBad0tiY0cxTkdHVm01OXJwd09kOUdndE5KcGhRSzdvU01LT2dud2k5?=
 =?utf-8?B?V0ZlRjBGRXg4SGkwOGZDRnZBVitoTjlmQkZLbkFvMUdWNEhXbE00dkRIQUJM?=
 =?utf-8?B?OHNKRzJvTFJZcGNhNVpvSE1hRnpjUUlTKzRTN0g1TDUwWFhYSWMvSVNOSXgx?=
 =?utf-8?B?bEcyYmNoYWNNT1pqTVhqZy82b3NBaWk1KzNZNmoxazk0UEFncHY3MXhLYlU3?=
 =?utf-8?B?L2NObE0wSldmVlBPZHhacjFTdENhM1kxdGcxeE0zcVhaUmdzUzNIdFVkS3R1?=
 =?utf-8?B?NWMvdEllaC9tVmMwTUlPYlpGc25ETVE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNEbXJwcnVsMENSL0VFdHhaN01SSlRxdHhQbFllYXIvZE9vTytzUktTOTFJ?=
 =?utf-8?B?ZWUxN1lhUVdEcTA1U3lMOWsybHBVWE55TGxJMTZVNmdmc29KekdZcGw4b3lB?=
 =?utf-8?B?YlBPNG4zZ21qRStlK3RkQUVPaFBqK0JQSGUrTzRIbHdjY3RjTnpDTlpsN1cy?=
 =?utf-8?B?ZmtXckRac3QzN2lNQ1B3MEhwYnM4RFdkakhEYUxGNEdKTG1jSXhKZ3Vidk1F?=
 =?utf-8?B?NVBVcTdLSGJHcXdiaXBSTHJOSlFRdVdxTDFoMmhSVktsYjBEbjM1M0xMWHVR?=
 =?utf-8?B?NHk2eDF6SzBONU12dXFBTVZwaURRcHlIT3NMaUtQa2lITHhVd2JhSk1ULzRw?=
 =?utf-8?B?cG91RVd2K2d2OVlQMVJmMHg3UjJFM1R0Vjg5dUFrdGdrU0pGVFFVaTdWbDVy?=
 =?utf-8?B?bTAyRHVwUThjaUkvazZGaHc1dlVJUzVLdGFoaVRkUExnbjZEMnZ1eUVFdnAz?=
 =?utf-8?B?bEtxb3V2ZU1Wanp2NGN1S3lnUkt1ek12Tml6VHdSclFhRVd3dHZ5Q2ticURX?=
 =?utf-8?B?UXg0TTFSMHRhRXRXOE1IbzlhUUZuQ0ZjM3cxeFVXL2ZadXFXYVYyYlhlaUZs?=
 =?utf-8?B?SXRPcHNUanBiRzVMTktmS0NoN1ZpeWltTURmbTNSU0c2NmVaejVicjQvRGV4?=
 =?utf-8?B?ck0yVGNScWhJVW45VVN3RTUzWHVRaW1kc20xYm1yT1prVDZpdG13bXV5cUcx?=
 =?utf-8?B?MlM3V1RXT29ZdHY1UVJTS0VIQnd1OWVxY1Bld3ZXcTM2VFcwS1NSbzdGcnRB?=
 =?utf-8?B?Q0VacFh2QmIvWTZUQ0pNYnd3YTN4UnFLbFJUa0pyUHB3U0FkWHhza1ZzR1hZ?=
 =?utf-8?B?dENkY2sxZmYvZzlNWWNMOWdnU056NDlUc2IrRjdLQVZmb3JqWU5BZUdjeXFI?=
 =?utf-8?B?WGV1WHVPMXRWVnFzZ1c3eHk1bTA0eFBIY2hlSFhCMFNNdGRVMHpxTlZBekI0?=
 =?utf-8?B?RTRQYW5EeFFqcXlQYnVQM21vNlh6YmF0SytJMUxQZFRJS2xVdHJ4TlhlcnFE?=
 =?utf-8?B?MXNnL1lLRkF2Tk1VTXY1TVFhWFJFUk9lNkhFMDlLS2FiS1dXSHBjUVFXTWRp?=
 =?utf-8?B?NjhXRnpHWE9XSy9jaUxQTEVvM2JGbEdMamd5MFBRWWFlUTZSN3JaMmY5K0Mw?=
 =?utf-8?B?M2JNNWY3b0FDbHRySGY4a2swUjJXUlZ5c3VjVHBtS0g3YkMxSUxsenkyNWRG?=
 =?utf-8?B?VTI0UUhzNmtETnhmZUl0NWxraW1oUE9ycU83Q3J2U2NYNGhXRVYxS29Ba2lR?=
 =?utf-8?B?eDUyRGVjRVpzYWp3TWJKeWNVZXB5NWI0NS9tSENHV2lZUW1IcGVuZkc4dTV4?=
 =?utf-8?B?VzhDNmhNNkw4elRiNzBFdGFYWE50M3lJYlVDbi9xajZONmlTdEdBS2pOeS9j?=
 =?utf-8?B?Syt1NStpOW1vWXF3dEMyUG5QWHpnTnRZQW1oWEdDZjhLV0pUNmtqUndUSWVX?=
 =?utf-8?B?RVhoSzJyYU4wWmwwL3QyWUUzTGdlL3lhZVRXQmhWMkR2dmxzTDVkUEhYaDBS?=
 =?utf-8?B?cmZGejFVNG5SZGF3SnJrSTd3ZnpWbFh4WTNjbXFaK1QvSHJDcTY2S0tXc09x?=
 =?utf-8?B?ZHpnTkhtOHNPeVZnYzV0czh6R2ZHUlpQRSs5Vy9TN1lHTVVBQXZxNWFrbVVS?=
 =?utf-8?B?ZHIvYmVGVTZIYkZCRVlaTE9UR3RIOGZIazU2OE5OY0c1Y3NubVhRSW0yb3Ni?=
 =?utf-8?B?cGY3dEIyVXdka0tRd2JGelh1WDl1b1ZhdFZFSEJyWVovbEhZUENPenNsemJm?=
 =?utf-8?Q?CIASh5tmk/05YMWMBAOxmnVR48LDNeaIY5CsA80?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aad883-4e8d-4b0f-0f5a-08dd7aed906e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 00:44:50.8497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1488

hi, Inochi,

On 2025/4/14 6:49, Inochi Amaoto wrote:
> As the controller on SG2044 uses different msi_parent_ops and irq_chip,
> it is necessary to add a structure to hold the configuration across
> controllers.
>
> Add the chipinfo structure and implement necessary logic for it.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
> ---
>   drivers/irqchip/irq-sg2042-msi.c | 52 ++++++++++++++++++++++++++------
>   1 file changed, 42 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index c9bff7ba693d..1001c1117b00 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -19,18 +19,33 @@
>   
>   #include "irq-msi-lib.h"
>   
> -#define SG2042_MAX_MSI_VECTOR	32
> +struct sg204x_msi_chip_info {
> +	const struct irq_chip		*irqchip;
> +	const struct msi_parent_ops	*parent_ops;
> +};
>   
> +/**
> + * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
> + * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> + * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET

I remember asking some questions about this last time, but you didn't 
respond.

Chen

> + * @irq_first:		First vectors number that MSIs starts
> + * @num_irqs:		Number of vectors for MSIs
> + * @msi_map:		mapping for allocated MSI vectors.
> + * @msi_map_lock:	Lock for msi_map
> + * @chip_info:		chip specific infomations
> + */
>   struct sg204x_msi_chipdata {
> -	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> +	void __iomem				*reg_clr;
>   
> -	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
> +	phys_addr_t				doorbell_addr;
>   
> -	u32		irq_first;	// The vector number that MSIs starts
> -	u32		num_irqs;	// The number of vectors for MSIs
> +	u32					irq_first;
> +	u32					num_irqs;
>   
> -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> -	struct mutex	msi_map_lock;	// lock for msi_map
> +	unsigned long				*msi_map;
> +	struct mutex				msi_map_lock;
> +
> +	const struct sg204x_msi_chip_info	*chip_info;
>   };
>   
>   static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
> @@ -115,7 +130,7 @@ static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
>   			goto err_hwirq;
>   
>   		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> -					      &sg2042_msi_middle_irq_chip, data);
> +					      data->chip_info->irqchip, data);
>   	}
>   
>   	return 0;
> @@ -174,7 +189,7 @@ static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
>   	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
>   
>   	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
> -	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
> +	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
>   
>   	return 0;
>   }
> @@ -192,6 +207,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	data->chip_info = device_get_match_data(&pdev->dev);
> +	if (!data->chip_info) {
> +		dev_err(&pdev->dev, "Failed to get irqchip\n");
> +		return -EINVAL;
> +	}
> +
>   	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
>   	if (IS_ERR(data->reg_clr)) {
>   		dev_err(dev, "Failed to map clear register\n");
> @@ -232,11 +253,22 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>   
>   	mutex_init(&data->msi_map_lock);
>   
> +	data->msi_map = devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL);
> +	if (!data->msi_map) {
> +		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
> +		return -ENOMEM;
> +	}
> +
>   	return sg204x_msi_init_domains(data, plic_domain, dev);
>   }
>   
> +static const struct sg204x_msi_chip_info sg2042_chip_info = {
> +	.irqchip	= &sg2042_msi_middle_irq_chip,
> +	.parent_ops	= &sg2042_msi_parent_ops,
> +};
> +
>   static const struct of_device_id sg2042_msi_of_match[] = {
> -	{ .compatible	= "sophgo,sg2042-msi" },
> +	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
>   	{ }
>   };
>   
