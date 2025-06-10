Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011026.outbound.protection.outlook.com [52.103.68.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CDC9460;
	Tue, 10 Jun 2025 03:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749525295; cv=fail; b=emt3j63+YWneUsRggbl8Hr8lO66YM1D7AxqojJx5ptBsZphXyTWJhmoUwG+tUnEA/ZQSia7Nz0j43hF2rPRFIukhh+I/ngfnn0Kx/napUsjJ3arfQxYS6ArA4a0ccVnvooWCXLgncRjiHhKZvOlUPcpP4kOZ7ITnk4dt0l/zDxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749525295; c=relaxed/simple;
	bh=lqc9q9TleY/MqB6D1J8UUBETwgfDNV2Vlz/biXFJDBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OAIqaFZgkt+dGC2DKK/40AZKMKsouom6qS+aB6s1a4l/VS5NHnf25dY6kXiaYSaVE6c1ieXdfmaCc/kUIpUYpH+smz3ssQq0KeQMYn1q+h2q9OWAdJz1WGAOv4olx5VWjzY73wLv1JLM7UAp8CsR80s4AYgIocO/3XN9pnkWTAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JUEBf255; arc=fail smtp.client-ip=52.103.68.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JUEBf255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmUuMXxJbccmhHH+sFEg6VLjMJqVC43u0RdvG/Dg2bzUFnA+qAZFB5z5T/KoPuSHeK/up1WA6wJfHQzDCwgHG85HwArCIOtAGETaCnoLR9mvMOjcQuqAk69cKFX5PaFc87+jNj1n5wvE8tha92Qr1vy778kQ7ezelLPTSg4g/74bHxWmNhfk8UXM87J5NTfYB2MbqtjzCRFl0fov6zttjHkWmM4J4S20BjONaOi6Vm+UPGzQmju6/UODncxTQmcSmQCVVbxSVfNwYHr0RnXY24BIoo5g1G+UTEYi2FNxulCSiEqQRabi9FUlUE2c0JtoMRvIlYM9merqWz4YtlABAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/lyWr1Re9IVyVxtPdrLil8fhQnIQCiAKS31YIP1K6M=;
 b=L2hKVjIAqtY9fG0TW1ccvqza5EJ0902kT69xE3e/tIrdyxE6g5YyJwRnM3F6/ygV5zHjPBekHmNMttq8ELJT+hICymy3RLPHie3BCZ+3U6jqv2ebjd0Gx805WuQSi/8LKjAGtmau8iJXoaRgdpfAQTlRMBvZwHrw+D8ffqqh4AsJavyAySSeSsJI+NPR/xASKfdVBPhGzlf1bZNWUAev0UonsqhTJp48BKUjZMiD7lw8XkmpE/XS0jTa1hFMLKZrVxP3jvmgFewihw/HL+xChGv55GXGaJ2ZIMwzcdDV7djjjs2SEnMcIvGlR3EE+mwqehKAe10W5xQQW8iX1zSciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/lyWr1Re9IVyVxtPdrLil8fhQnIQCiAKS31YIP1K6M=;
 b=JUEBf255RguT/XqdBTEfnvg3AW6u/zv/fQ838x3VnTIL/fxPt+J/cMBfTW77+yfG9SJpE/FuaE+ilmmI91Py5V9YaBGeJeJuDH7bAECovcGEROhwQj9s9IRkT8/DHxupTtYdcCSA6isGB1Ev54eMPMkoGiKWBPLY0/4zdK3o1HfAMRUMLF3Wkrzi35cTzI166MebS88adtVs19Ai/VI8dfFqJn+X8FRtKDg2vJvY9k+oWmyWNuWRJKSUEHKtXsdH/ci0F4rWRzevNp04IE9K5/zQcaPlJ2ahAXsed258T7+0EDqxqd9CV/jUThXUfHaLkNBYqg3ka+DP/0CYEbZZgg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0924.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.32; Tue, 10 Jun
 2025 03:14:47 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 03:14:46 +0000
Message-ID:
 <MA0P287MB226219F30F51CC5DA84B4B4CFE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 10 Jun 2025 11:14:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: reset: sophgo: support SG2000
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev
References: <20250609230417.620089-1-alexander.sverdlin@gmail.com>
 <20250609230417.620089-2-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250609230417.620089-2-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <d2bfc355-0d60-4f07-9d55-49ec35764eca@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0924:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1b18f5-e3a5-4006-5821-08dda7ccf2a5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|19110799006|8060799009|5072599009|15080799009|7092599006|6090799003|21061999006|461199028|1602099012|3412199025|4302099013|440099028|10035399007|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2RoVGcreTJleE5KMXlxSDdGRytoUUhXb3NKa1lIY3ppeDZ4NjhuL0VPekZH?=
 =?utf-8?B?S1FLYUpOUEV1TmxJSkhOalhFZUtGS25DVXAyWnZxekhFQzQ4NDV5c3NVNkow?=
 =?utf-8?B?TVl1bXZzT0c2blBWN3FFSTZwTi9EWFVhSnJkaEtZSkVrbGxTdUwwbmpzR25H?=
 =?utf-8?B?MEQzVnFqSWNOc3dwRC9HaVNlSG16aGU5UFZHSCsyZmxuUzFRZURldVFzV2Mx?=
 =?utf-8?B?MXBWTWFwa2o3c05LSGJLdGY4bGVUdTZnYjFVbmZERlRLYThvYVlxUytyN0RK?=
 =?utf-8?B?cGZBTjRkNEdLQS9TMzhabXBBRVRQbE94UUZiTy9ub2Ixam01Nk5KZm5HVWti?=
 =?utf-8?B?TUVSbVNrYVhnejFwbm9hWUJvbVlXWXFndkNGSkQzNDJpOEdrWEFlUldHVmZ0?=
 =?utf-8?B?aGVSSHVRTTFBdW41MnduVmZiNTdyYjBQUC85b1dPS0xiU1ZXU0k3QzhOL2hv?=
 =?utf-8?B?QlB6a1VVNlBFdjk2NGVqZnAzTjBEb3ZXaUplUElnZGJaa000MUdZdnAvR21N?=
 =?utf-8?B?MnpiQ2FQTHhEUkx1SlJMUEdkRGxRNTNKOEpTZCt3UGlkVUg3YUk5NFR2UzVV?=
 =?utf-8?B?eDFDMVNvcy9ZQ3BSMHNOREk0cktrRzdMbzBvN1RoRkJ4eEc1MVBuWlhQZmpI?=
 =?utf-8?B?a0JCR25VVnJoUDEvSmozaWF1TVFYV2VFSmtHZks3ajdBdjB6eEg0ZFBraVFa?=
 =?utf-8?B?aGFwVnBOWEgwMFA5cE1nY3paa3hwWXpRRmZoaVFjZ3N2YWJvN1ZVNTA2cTY3?=
 =?utf-8?B?UlZ3Mm50ekxFMnhONkZ3aSs2cml1MTNLRHU5cDYwREVCUkFrZlNPaVVORXBu?=
 =?utf-8?B?R3FZTVhJRDBCd1pTY1E2MEthMmZuMUtKRWpzOW0xTkk2V2VIdGZ5d3UrWEpy?=
 =?utf-8?B?Q25Fd244Q1RONEwwVEZZdlo3R3p5L24zMWpqRU1zMmo1NFZvQVQwOHdZNDZo?=
 =?utf-8?B?MnZpT0VDa3JjbjBpZlI2SEt5L0NWODFSSjFZeUNEZ3A5VkRtTitpaEpabGdh?=
 =?utf-8?B?cEtkSld1TnVuTmV1QW1VNGo3UnBvZDF4b3ZUL1dubC91K2NkQWkrR0hValk4?=
 =?utf-8?B?aGZtMjBsNWgzYkQvaGxlUXd4VXpyOWNMSWFGQUMwZUpTT0NlT0pOUDRyZUpl?=
 =?utf-8?B?bWRLMlRJdEZmclpTSEQrWXcrU2dpeW1pLytxTkZsOUVMSU9QdmYxTEhrVnlh?=
 =?utf-8?B?QmFLSld4RlBncXI3bytiVG1vaDZ2cEZsQ1ZJSUFscG5tRWJyb21mK2x2Tit4?=
 =?utf-8?B?Mjk5QSs5TEVONDQwSzV1VE5CWmlleWNuc21La2ZVNUgwQXhsYkRVSzA3ZGZH?=
 =?utf-8?B?aDcvY0FsM1l4ay9pQU1XazI0c3VNdmRCVU1hbi9tdWYyM0VSbEVkakdleEk3?=
 =?utf-8?B?cTI1cmFKOXY4QVdFK1IxaGpuL2hXNmJPSmtDUURZZEJHeXc2S0pWejI1UGxJ?=
 =?utf-8?B?dFJpYlBkTUZmQnZnYmRiRUR3T3FiOVVVY0xyalhFVmVQckJJclR3WVFxcWFF?=
 =?utf-8?B?TGY0bTF5dkkrQ2loeWhQSlVxMnkvZXh1Nnl3VC9rME5hZnEyRitZUlRVek9i?=
 =?utf-8?B?RFZMQ3UxQVBQN1BXL0xYa3Fxbk1zZ2h3MVFRamM4YzZoYXR4SVI5N0tlOU40?=
 =?utf-8?B?dURjM1p5RlAxUjVqaHI2TjZwdW5qOWxLWEgzK2hkVlhERElkUjVuWG5ZcTNu?=
 =?utf-8?B?YTJjNnpPaEdVMDZmS3RUK0NMU2dqWjlSaHNLekJQVitOeXpDT0Q1S0FsMXVh?=
 =?utf-8?B?KzhGNEg1RUc3dnhxYUQrcWxSemZVYnY4S2plZ1NNM0NDK0pncjhmRXd6dyt6?=
 =?utf-8?Q?v9q5XV7Wm/cm4uVCH0toiPohwskcalD4nC+HU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlZZEpWZDZRQnhQZVBCcEdSU2M2dTJWL25XQTVPTGJ5TzNoL1Q4QVIrRjFa?=
 =?utf-8?B?VlJNTmJuT0hRVEFoaVNJTXQzNXFteWNQclRSYi92YTE0ajJoWXBUb25uRkVa?=
 =?utf-8?B?bzF5TGFXYXVCRVZFK2I5bzRCTGw2K2xPMG5hNFVrL1hLNXdZVkJlVUJJL2JD?=
 =?utf-8?B?SXdiZUVpM084bVhXUDUrNWZ6ZmJkci9ZVEh6cjBHVkNHbVJ5akZmVkxHUzI0?=
 =?utf-8?B?SFZna2NJYlhMM2QzMGNiY1M3aW5kRW9HSTUrcmQ0K1ZyN2V0Rm5iMlZWNWM2?=
 =?utf-8?B?SVdCSkkwenpEV3ZYRmd6aENsUTdML1VaWWlGVWVXS3g4R3E3SHpQYlIranlF?=
 =?utf-8?B?S2IvcG5JUkVCWWRaVGNQQmpLRkFJUVNTUDFEZ2poelRqSDNiN0lzT0lYaEJW?=
 =?utf-8?B?cmZxaVhtUkZBcysyVFVBc1dwdEZIVXp2SGhOOWZIZ0NEUlRvRmVBbGxPREVQ?=
 =?utf-8?B?R0dRVVc5dmw0ZGd2K2hZZ3d2bENJKy9UN3BldC9jM1pJeXY5dXFuVmJFZ0hB?=
 =?utf-8?B?MHZSa3A2dHYrSGdQUTlObUNRa3E4WWlqS3JucXJBR1JJekZzTThDV0Y3bW9z?=
 =?utf-8?B?LzZFRHNpdUFUUFFudXh4RUNnVUVRQkRTWmhmQUhXNjhuSkVwbVBJN3JxdEFo?=
 =?utf-8?B?NWRZTGFjd1dENzRKUi9DYnZ1YTZwb280cVRqZHhqVXl1aUxhYWFneUdWNUN6?=
 =?utf-8?B?MWZ3c2pGclh4U3lOaHVQaDRPL0JiWVNXcjVzenVBbTV6WTFkczFGdVoxZXl0?=
 =?utf-8?B?Nlg0MzY0bGFDYkNPOEJZeHBxSVNobzRFQTBYcDQxZFhjN0Zycm52ek0yVk1w?=
 =?utf-8?B?R01ibU5Ya2l1elhNTGxNWkErRExjZ3FXZVFWQS9iN29LTmxpemEzL3dwdFVD?=
 =?utf-8?B?cEZvVzdzNFRLZUo0RlorQ3RXeU1pSitLb2VSNzVoOURvTmwxLzkzOTA2eE9a?=
 =?utf-8?B?QS9WWUh3NGJaWUZkUmlqeExUZkI1Y3pVbmhGaThsbW9IU0FzeWk1cjVBTXZ2?=
 =?utf-8?B?UDYwSENObFBKbXMxMFNJelAvUlJoeDNZRTFmYTNaN1htNTdCODJjZGUxeWhh?=
 =?utf-8?B?Tys4V1pLTFdjMnhNSllRRDhZNitWNTFZcy8yNFdCWWtlRGkxWjlKQ1Mwdkdu?=
 =?utf-8?B?U0xaekt3QVBocTJabTVoU3pzVndvV0JKaVFSUmpzYTZDS1hGOHhsOUREd2hj?=
 =?utf-8?B?VDI3YUNiMEYvN3JFd0NEZUs5UVd5V2RVbkFHazFQU2w3K1ViemExRC9xc1Nn?=
 =?utf-8?B?OTV2TmNzb2dXTnp1YTdzNmlhVlJZcytMWWFxT05hUkJxRDh3MW91RkgzbzNM?=
 =?utf-8?B?R3NURDlOWXNad1R5cDIyM2c5OVBWdTlUOHl6TUpvbnYrZ285RmNqbmNRejNR?=
 =?utf-8?B?S0dUeFp3QkYxQlA1OGtPMWw0aWxJRk15TjA2bC9vYm1tSEhSYTlZM2srTmFl?=
 =?utf-8?B?SS94RTVXNkwrTTQ1WmMvbUQrQ0NSM2lvR3NUSWxBaTEzRFdJQWRoZjZvMXJI?=
 =?utf-8?B?QW9TY2YyRkRRbThZeWJab2RMM1czaXJvUVVhdjA1R0wrMU1ua3NWU3hlbzdH?=
 =?utf-8?B?NHVOQzluME5CYXRJVElJcnlLa1NUaGpNdmd5S2dISVZSSDZGNnFEVHVqakE1?=
 =?utf-8?B?RTRsbG50cjhoemorcXRMSVJONEJ5ekwvODdpZ2d3cENuVWYyZStxMDRydnpR?=
 =?utf-8?B?MUlNNkNwWHRDVkg4bnNkQUQrQk83dVd4RWJ0c1NOSENuYncxSTZ1aXhvanpJ?=
 =?utf-8?Q?TT1gVhzfVCm7e3jIitChUFnHmqOt46CWaca9OQO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1b18f5-e3a5-4006-5821-08dda7ccf2a5
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 03:14:46.7460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0924

Hi, Alexander ~

On 2025/6/10 7:04, Alexander Sverdlin wrote:
> Add bindings for the reset module on the Sophgo SG2000 SoC.
>
> Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>   .../bindings/reset/sophgo,sg2000-reset.yaml   | 35 +++++++
>   .../dt-bindings/reset/sophgo,sg2000-reset.h   | 92 +++++++++++++++++++
>   2 files changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
>   create mode 100644 include/dt-bindings/reset/sophgo,sg2000-reset.h
>
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
> new file mode 100644
> index 000000000000..ab44d45ae061
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2000-reset.yaml
Need not a new reset binding for sg2000, you can reuse existing 
sophgo,sg2042-reset.yaml.
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/sophgo,sg2000-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2000 SoC Reset Controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>

Use your contact info if really need this file.

In fact, I think your patch can be combined with another patch [1]. 
Because SG2000/SG2002 are actually developed from CV18XX, their reset IP 
is almost the same.

Link: 
https://lore.kernel.org/linux-riscv/20250608232214.771855-1-inochiama@gmail.com/ 
[1]

Can you talk with Inochi on this?

> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2000-reset
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rstgen: reset-controller@3003000 {
> +        compatible = "sophgo,sg2000-reset";
> +        reg = <0x3003000 0x28>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/reset/sophgo,sg2000-reset.h b/include/dt-bindings/reset/sophgo,sg2000-reset.h
> new file mode 100644
> index 000000000000..23604a800f66
> --- /dev/null
> +++ b/include/dt-bindings/reset/sophgo,sg2000-reset.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +
> +#ifndef __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
> +#define __DT_BINDINGS_RESET_SOPHGO_SG2000_H_
> +
> +#define RST_DDR			2
> +#define RST_H264C		3
> +#define RST_JPEG		4
> +#define RST_H265C		5
> +#define RST_VIPSYS		6
> +#define RST_TDMA		7
> +#define RST_TPU			8
> +#define RST_TPUSYS		9
> +#define RST_USB			11
> +#define RST_ETH0		12
> +#define RST_ETH1		13
> +#define RST_NAND		14
> +#define RST_EMMC		15
> +#define RST_SD0			16
> +#define RST_SDMA		18
> +#define RST_I2S0		19
> +#define RST_I2S1		20
> +#define RST_I2S2		21
> +#define RST_I2S3		22
> +#define RST_UART0		23
> +#define RST_UART1		24
> +#define RST_UART2		25
> +#define RST_UART3		26
> +#define RST_I2C0		27
> +#define RST_I2C1		28
> +#define RST_I2C2		29
> +#define RST_I2C3		30
> +#define RST_I2C4		31
> +
> +#define RST_PWM0		32
> +#define RST_PWM1		33
> +#define RST_PWM2		34
> +#define RST_PWM3		35
> +#define RST_SPI0		40
> +#define RST_SPI1		41
> +#define RST_SPI2		42
> +#define RST_SPI3		43
> +#define RST_GPIO0		44
> +#define RST_GPIO1		45
> +#define RST_GPIO2		46
> +#define RST_EFUSE		47
> +#define RST_WDT			48
> +#define RST_AHB_ROM		49
> +#define RST_SPIC		50
> +#define RST_TEMPSEN		51
> +#define RST_SARADC		52
> +#define RST_COMBO_PHY0		58
> +#define RST_SPI_NAND		61
> +#define RST_SE			62
> +
> +#define RST_UART4		74
> +#define RST_GPIO3		75
> +#define RST_SYSTEM		76
> +#define RST_TIMER		77
> +#define RST_TIMER0		78
> +#define RST_TIMER1		79
> +#define RST_TIMER2		80
> +#define RST_TIMER3		81
> +#define RST_TIMER4		82
> +#define RST_TIMER5		83
> +#define RST_TIMER6		84
> +#define RST_TIMER7		85
> +#define RST_WGN0		86
> +#define RST_WGN1		87
> +#define RST_WGN2		88
> +#define RST_KEYSCAN		89
> +#define RST_AUDDAC		91
> +#define RST_AUDDAC_APB		92
> +#define RST_AUDADC		93
> +#define RST_VCSYS		95
> +
> +#define RST_ETHPHY		96
> +#define RST_ETHPHY_APB		97
> +#define RST_AUDSRC		98
> +#define RST_VIP_CAM0		99
> +#define RST_WDT1		100
> +#define RST_WDT2		101
> +
> +#define RST_CPUCORE0		1152
> +#define RST_CPUCORE1		1153
> +#define RST_CPUCORE2		1154
> +#define RST_CPUCORE3		1155
> +#define RST_CPUSYS0		1156
> +#define RST_CPUSYS1		1157
> +#define RST_CPUSYS2		1158
> +
> +#endif /* __DT_BINDINGS_RESET_SOPHGO_SG2000_H_ */
