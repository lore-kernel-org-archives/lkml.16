Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E55253F2D;
	Mon, 12 May 2025 23:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092903; cv=fail; b=PgdgegkruB61CSIVRGK8dMDSVEc86tJE30BDVMwDHN6yXci7p8RFSanCaaMiaXsU7n5VUnS46iQ8ih32XqIXy7w5O4s/s5wR4TOLEiSivTlL2OjknX0UxnujF1K5dpmf5Na2BU15jtDm6ctb6jpxqs4hpLv+IU2/dnKIOpvf70Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092903; c=relaxed/simple;
	bh=XGwUAb4kMgHd4JHEANOFe1I9Ebs+RqHQYN2ESKEaKNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hI37G4F6EZ0W6J2b9xh6F56GzOLGcgW1BNsvDJN19KtWXEERixhybPAmRJZlWr+oQ11mpnZsuG7lLjJCLf2Gn1DYICh9ClOX0nDrtjwhStLcwI1hFrIlgy53NRcKW9l3mVh5hbaitSG7Dl77trjPvjnQJlC3ACpJZmMKzfmKnPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZCVjcz7K; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZCVjcz7K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5TVJNgWXOk6GirCWxcOH9CpihPERo/Pr1visrDHc004/OaQggw/xxCXJLn0UZdVJNRGyZGmnVzO5s4H3HEMHsUGEkTHdfYkRdGS0wwX0TgM1ba5A+C814+SwyzU4UdsOMqxuC/KIJQ1gL5beW0zr3tWAaJ2PjVcNgVQs6eEYRVS23oEBwXPoXk/EvF9etXfVmjT8iXDAL3+RqLtP8NI0HcUoTRLiv79JE1kXGz1FpzAMxP4KGLR/sWiZPKoo8etolaiOKtTKuZNNTqTh0R1K6ZTtLfubcKOrda/BLcZi+zvmgF8Qw83F58cCtTvF4r/zhw7MzE6itYnRCtnbulH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByQaxxVmotj32spGeQpF6syeRDepQ/CNJXIVMNiHDME=;
 b=Q7jjXUbBWpDbF31pinjn8rQebUir0jNzERMi/y4BFzKRAIqcZoa2eBIAEhMZLN8e5M+jrBEQ1I6wDVRHJuHYSh0gylbZsKJziKxKG35FjlYW20o5cj3FgvK73EjtA2OrVRO+QapzeVrmhDj21qdc+Jm4JTd7mpKS5W0N6w/CKYMzykntDeJd2NjcfWmc7caBda6ClzebvtkloXxoJxsedwZGeaKPbvMw/rDcalRUdXkwanfNqLLwYN+9fG0VUj9Kyvs8fV8ot+Iu6kpVsof63qzJAd4W1YovzALV5YYm/F1FFiuPRuZ6Nz+1Fa7nWlW8R5sv1YlYM1sVXEJ1pc5cHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByQaxxVmotj32spGeQpF6syeRDepQ/CNJXIVMNiHDME=;
 b=ZCVjcz7KxWs6CbQBERj7q0mJiSOKauMu4lxba28Yq7NYzOVHzMdYGeF1DXuhXwD843mYkrT3wz20GgPPDxox45pHn2Z4IKQ8j6LMZa/gIPdDnLz7cEz84ZAy2hNiihMVyJC7ncDUYe6odBzTT6enMRHR+Ax9cXVsUt7zIsTbDLhnokrdvalW59sF5TAF4d/BmMeD60+KWJcyxx4ezBzi+/lGcT0XRqo2sl3DPH9/4arbV7h1GXbk633FRd1wN28NzRiKAkxK/Gap6vxcpkiTQ4GVBG9uZVF6vORe6jqrkcxkqM6jC+QPZD7UsyLl++s6Dt5/MwFGU4bzLWdwYfyKsw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB1798.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 23:34:53 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 23:34:53 +0000
Message-ID:
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 07:34:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::8) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <5108e6af-5d35-41ff-ae0d-160dbcc09567@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB1798:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c753db-f05e-4e16-e17e-08dd91ad9851
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|7092599006|19110799006|15080799009|5072599009|6090799003|461199028|3412199025|440099028|34005399003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3NjM0ZxUm1YbUZBTTdJczZWSUZKcUVPYXU0YVN1cEJPMUhUdm1UL0F0R3lt?=
 =?utf-8?B?UDZBaVJtSlc1N2Z5RHBCek5XRUkzOEQ3WHhRQTRnLzNraEFFa3l5MGttZENC?=
 =?utf-8?B?Nmd6clNXblkvelBXeDVkSnBHQ001MFo0VWgwM0pjcUk0aXBIUkRFQTJVZWN6?=
 =?utf-8?B?UmJKZ2FGUzZvOUgrc1dFOElOeFdzWUJ0SDA3Z1NobUsyQkQrTHFJQmpjUS9a?=
 =?utf-8?B?V0VEbld3ZzlNc1pYbU0yZTlraEVUU1A2dlNnM0FNZnlWTFJGc0NxbVgyM0xH?=
 =?utf-8?B?L2hoMGRMN1A3bWlHbVlycVdFSFcvb1Z6UGxlMUtlUHVRYW9ZOGxsTEJ6dW83?=
 =?utf-8?B?RkIyZncvYmQ3QmphR0pzMFdwVW52M1k0SFVjbmRpUldEMWxxTEYxcVg5ck02?=
 =?utf-8?B?eWYwb21rc1hzZW5BWXVGUnBHN1lzV2FnT2ZoaDB3R1pZZUQrTFRDaVhCT0ts?=
 =?utf-8?B?TU55cjNDOW9xTkg0eDRyVFJXUlorRzNTUnJ4S2lBbWpibm5qeWxVdGVKUkxO?=
 =?utf-8?B?V29ONWJVWlp6UHRxSmsraVBSazZ0NDVzUUtPN3ByNFNtR1J3THViZHVLbGF5?=
 =?utf-8?B?OTdhODQzRWNWckVSUlRicTl5Ri84YSswZEpRV2NiUEIrUTlXT011VWNtRjBR?=
 =?utf-8?B?T0lkRUlvNDZFWkkxSzNTTXVVNVJ4d0FGYlpaU0Nza1pnR2VuYzdRT2lBQ21Y?=
 =?utf-8?B?OWFDRHNSbmVSZDRMUHFMNHpmdnVnQmhtdWRPZzRGRGFHSUZNZ1V5MXRCQTFX?=
 =?utf-8?B?NW9wUnQxWW8yNlViek9QY0FWRmFRZ0ZqVTdGM0tFc01QeU1WUlhtRmJ3ejdj?=
 =?utf-8?B?UTM4QVJMNUlNTVQ0cXFpTk1EWVpNWlB1eG1Zc2I3aEhXczhmdHlMeXV4MnUv?=
 =?utf-8?B?TlFMdFpQUitLaENQUnp4Ynp0QVo5QUIwTmVpTUcyLzBBeVpucyszU2dETW5N?=
 =?utf-8?B?aGFtTzVSR2FaU2V0ZWp2WlRudmRmZ2JFZkxWZEIybUhrQ09uZ2VZOFRDYTM2?=
 =?utf-8?B?QkJlbDY1RnhPVmhqdnFuMkxOeGlsVnNiQjg4MkpSMldEZ0R0WkpCNjRadnVE?=
 =?utf-8?B?SXJabjhwM0Q2TDBjVGpVWU9BeWxoWTdKL2kwdmtpa3gvTjhqaHJKU3FvcGI2?=
 =?utf-8?B?NVNFWWUxclF4TjFCMzhuTUJsMFlRRnZCTGJVVytlWnB6ZjA2NlNaUmpneHlD?=
 =?utf-8?B?M0trREwyQTlDczdjaXBEVGZWemMvMzVrQitUdmN1VDMyNWQvdkM2N0VEWSta?=
 =?utf-8?B?ZzV6akkzdmpQYk5mTU1iSm1hRHN1d0hHK0g0Q3pYWUZzcFBOM3FraC81OGV3?=
 =?utf-8?B?UmlYaGUrVUhTMlJldzNTMnM0YUZEMmdXNFZkakFjM25LQ1MxSlBVQWlGYVZV?=
 =?utf-8?B?OTQyTXBuRGRrK1UzaHVyK0M3aGJ1UEtpMERsRGd4MkZKbkd0RitBTGxlU3BN?=
 =?utf-8?B?T1VWUzA3ZnBoS0hheTRCSzE4UlA0SGVlV0dtVHQxNjMxTmNMcDJ0Q0lUZm5O?=
 =?utf-8?B?WlJaRXBWeGtWeEU5MFdUVlRnK1BqVWhHazFLbjhpa2Ivckl4eURrRC90RzJE?=
 =?utf-8?B?dllqbjF0QWxFVTNMTDlCbVNZeU4rS1E4MERhQ3lLSFo3SkdiZDJRRW05Mmlw?=
 =?utf-8?Q?61DiQJL+zYhYtqlwY/9zmeQKUVrDP+ZYekoeULMzAIcI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1Y4WG96ZGRRK2dpY1RWZ3V6bERzTnlVWFBKN2FReUx1QndCdUhYZGduR1FV?=
 =?utf-8?B?RFlBcW9GaGY1WHVRejQycVZJU1FpR0liY1hXV3VvdWVyamt6UEROWWdoSFE0?=
 =?utf-8?B?VHU4cy9nWEdtc1l3MFpiUUZNV2NXa3ZHNTUyUzg5YUNHdE1JSXJPUzRFanZy?=
 =?utf-8?B?RjloRUlOd01xVnJRVGhpSnRvVTBlclVCWW9EeW9NVnVEYm8rcE81ZGNDaUpj?=
 =?utf-8?B?M3M0TkhyUXRnUlk5VTBLWVpUem94d2ZTMlNlWmNITEpiVXFvVE5GU0xQQU9W?=
 =?utf-8?B?S1c0UDZ5MFBteEk1aWpwR3U4TzdCLzByam9FcUlqMHUzdHZqRVQvKzlsbENo?=
 =?utf-8?B?Rk1iYys1Wmt6ZFhrUGtac1R6dVZqUjNhbXNWcTJFd3RhWEhnWGI5UlJLZS81?=
 =?utf-8?B?SVdodUp5YW5uOEFGSUY5NGRGLzFQNXk2QytiUzFxVTdEdmQ5T3ZKaWJUMVBa?=
 =?utf-8?B?Zmw4RnF6MHhPRnZWbnBzSW94YzdHaUF5cUhJeHcwTUJISnJUUHFoR3ZOOUFN?=
 =?utf-8?B?aFg5UnVVYi91WUpiY2FtczVkZ3E1NUttcHlnbGVzSmV5NXExZjlYOWxHVnZh?=
 =?utf-8?B?TTl3clg0MTlmMENLTFAvYzZlcEpKdmlLY0RPdWd2UU93Y1M5cm9JUTZyOGxK?=
 =?utf-8?B?MndEYUNGc2JpVWhIckpMWmdoc20zY2ZiSkZ0VUJQTXliazJPeTREb1JLa3BO?=
 =?utf-8?B?S1FpZ3RMK0RLY3FWaXBqRnVIekl6WXR2Tko4dlNNWFIrSHI3YktWdmcyWjA2?=
 =?utf-8?B?ZEJncGYzcEpoSlpEUkpCZWtqNThDV0tQRGdzVzEzZU9NenlSb1UvckhiN0N0?=
 =?utf-8?B?djhZVTB2WVVvb0llSHJ2SnQ2bmU4OExxSnFySGZDamVSUW9kRmVCZDltM0Fo?=
 =?utf-8?B?U3pwa0hkSlpnWG5pTDZlZ2VTWEthUHZmL0dJOUs5cGI3WTFMRFBqbUFRQnRt?=
 =?utf-8?B?aHB4d2RoSVdpdjdQc0o5YmF2SEdhQ2gzNCtWRGtTR29hTEVSTjRkcC9xazgw?=
 =?utf-8?B?QWs0NC90UllyYTdUcUh1dGJMU2F3enFOU0Q4RUlsZ2VWcW9NRGhMTEpoVS9R?=
 =?utf-8?B?ZTBhZ0ZDa05NWGlHU21uNHdZaE5GVTVDR25LTU9id3hFeEkvcjF6VjZKa091?=
 =?utf-8?B?MklkRzJQWU4xUDJjc0NOQjJCOHBjd1N1YzA0K3BsLzlCbk5ubGdHdGtFTTZn?=
 =?utf-8?B?Q0IxQS9pQlhNZUNmZG84NkUxMXlVQTRUTEJJdDlob2s4Q2Y1dEQrVm1pTXZm?=
 =?utf-8?B?YWVVVFdkN0FMZUk1aEkyQ1hha3I5UDNIdXJac2NhamhYNzFMem13cWdTK0dE?=
 =?utf-8?B?V1MvUHJPcWFqS1BRdDVSU2ZqMmhzOER1eTI0KzJ5bFpncmNnTm0rS24yVTZm?=
 =?utf-8?B?QTArSm5uenhURnFmZW96UVZCUS9VRnNPRFpWc1ZTci9vMk1tN25HUTdVY2FV?=
 =?utf-8?B?R1ZWeUUyVmhvOGJGQWFqL3NUdC91aHNaa2xMQlArMHBObkdpMm1SMnhOQW1j?=
 =?utf-8?B?RG5OVG8vOGtibVU2elFDYy8wc0ZqYTBpQUQ5RzI1b3ZWS3hISktiV2RDd3M4?=
 =?utf-8?B?WTE5V2FXUFViNVpZSzZTMzdPWUVxVU9IOExaSkxPWHYzYUk5UjBHMFYrWmRs?=
 =?utf-8?B?bWhzV0hIYkdTSC81a2xkVUpCRDFOWjlveEF1KzQ2Q0t2LzdKeUJVQXkxbmhw?=
 =?utf-8?B?M0pxeGdZVDRLcDNHdUtyNGUzYk91SlpDQTZlWjBRbG84TmF2OUFKcFV6R0Zz?=
 =?utf-8?Q?nGBOjFxA6N+4AURiAeEWNmAbtxLddZJhUWYy1FV?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c753db-f05e-4e16-e17e-08dd91ad9851
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:34:53.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1798


On 2025/5/10 2:13, Han Gao wrote:
> Add DT binding documentation for the Sophgo x8 EVB board [1].
>
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index a14cb10ff3f0..ee244c9f75cc 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -34,6 +34,7 @@ properties:
>         - items:
>             - enum:
>                 - milkv,pioneer
> +              - sophgo,sg2042-x8evb

I wonder the product name is x8evb or sg2042-x8evb?

The same question to x4evb.

Regards,

Chen

>             - const: sophgo,sg2042
>   
>   additionalProperties: true
