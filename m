Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07C259C;
	Wed,  9 Apr 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185196; cv=fail; b=k5/5xzoqtEDKHprTSdSexwrEDRrCUezU9k7svsNQebHfcwZ7cec6MKRY2FERft8GL+HuZLIytNJMhjsSjE93eodx+P3q4qltlEjWgSkOeyD7mnYFqMcsG5kOAzEpmdV5pwj2CVST6qFyE1Tov8WLwtRF1wmvkZYRhyjm/8+70y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185196; c=relaxed/simple;
	bh=S+3r1qI2eZvbj55yoZzbrZJs4h6lfZ8cu1M4OSoLkw8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d7aY6nZwX3kcjiBA7tsBle9vj28De1KpXQv0XZilnaO5d2j+exd0I/V2aujPBoph3wP+wWWD0EOcZzGb6YcqHM0w7MGszWTGaGta3oraV6mYbrWVFcpWrmpbGeAQAsQ51mHh88xeY87Y4Ee8eeMwzIe0uCC8d2FuqqM+6kcQCBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UpABxwYH; arc=fail smtp.client-ip=52.103.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UpABxwYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB9LcP5XpmOignbmPFi/fj/yIIlMoyo6BiJ9b2gqPOPuthLiEUpEcWMsINdvq7uKUG86ls6+OgZcohnPSW3k5X05YkqNekXv0NUyWKtVLVpFdlc6ZMrt5yJpteGHZCfgpNiDrP5zjYQowjHltAyHqx6LC6UBU95780hnD8ZXZqqH4fUBpt8Ct1NOK9trcgYghMLP8GTZYvkBNQ0KkvaKyUNVDMPeIlZE/mSgDTM6ocbJkHbtFGP2yEWpWDclcX8LKdlveuXs3QTqTw210V5bKRVOGMVUJHZMxSgfPGy99HKLLMNDL1QseL4HIjAsn6YJu+2ippXG5dSpOs9LPwHB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8WI02dU1lX+fdLMw4IJff9BUKwtg7EwsfLv5tIFivk=;
 b=ZrS4t/S3hLrERA+eRUKk8CGgv+5hD8Nq0CXqCmo0uQkCX0Q7R2r5L9ZVJXD3eN40zMJewQCrGQ2xAeuocpqfnIyh09Zp2izZiQgQZ8Ot4F25TO3qZJiDxFNierkbMD/ZUqAwdN3uAGOs+h9vVk8DdSbYNqGrd8VrsD5jxYkVBWrftTkkULgwG8qBZapUr386yNzO6w0qXulxBdtbGs8BUDgFhlQ/nnc/m3dyN/prnSVj0q7ZWBxu/fexISPy4Hb9oPO1K0nL9THALQLEGnuiAultNFCWv9mbz8RCmGMek1CfNm2c4wwVmW6z6EA7njptNEgaFGLtutjKiyXjp8CAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8WI02dU1lX+fdLMw4IJff9BUKwtg7EwsfLv5tIFivk=;
 b=UpABxwYHN37PW9KgwlQCT37gpzJvrVO1ErqhKR1PlNS7nSny8tQ4hJScAc3s3hAQrGPAH375lvsZaiLZ80nZT7ynHtowV4OMbEttwIeMWGhwCVafG0UO0nj6DEYOYncdvEvWsEBfkB0ELjCvygh0sQqtfd5OO/CMeLKRSWwx18oYfQsf2yMvhbrrdSSsZpSgBY+S6XmmWmPc8niTL5TV+rJ6IoDCbOB/hXI3idrUTDQqCFFu5IFFsPD765WRfXCftzi9D6z7puMXpTdpedeiOkZ7zj0yFQXdbuGgANL0tEXHT72JJC4hbZvCR+gDMGbfK11xgLG7QNFPuspMX9iVaQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB1749.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 07:53:08 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:53:08 +0000
Message-ID:
 <MA0P287MB2262DBC84878347B78CA50ECFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 15:53:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-5-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250408050147.774987-5-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <b3ac6688-6a50-41a1-95d3-161012fd18f5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB1749:EE_
X-MS-Office365-Filtering-Correlation-Id: 327850b9-af56-4884-6a77-08dd773b9144
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|6090799003|7092599003|5072599009|15080799006|19110799003|3412199025|440099028|41001999003|19111999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alNXeERUQXZPeVdnYTg2Z1MzVUVEdzcwMWxWalE4T0M0RU5qQVlCc2VkQ0x1?=
 =?utf-8?B?b2lGN2hhcDZTWHlEQitDcGJmTDN4d3Q5N1JOQWtWWjBKaTMvRzJHWncxd0U0?=
 =?utf-8?B?YjM3Uzh3T1djN0VKQnNqcTRnZVg0akhLeC9rVnZONndHVjFJYi9iMkF1MWs4?=
 =?utf-8?B?SmxiN3FjSG9BdmlxdktvUS9OdGhsKzQ0aUZvS3hwS041WEZNN2l6eDRla3dm?=
 =?utf-8?B?V2xBZFJzZ1pBcCs1aGNHaVRlbDhvYmk3VExMcCtSQmh0VjRCN0JoMmFsTytK?=
 =?utf-8?B?NG1ZbnloeFNSbkpwbkxMamo4SFNoNlgyL1FYOHRVTE91STZVU2t3R3NVUDVV?=
 =?utf-8?B?ZTJRdGkzUTRpa2QxWEVFUURWVmZaNmI5SlhHNDR4aXRDOXJqbjg4cHJpcXNw?=
 =?utf-8?B?RnhzdVJmblRqTDdiQkU4TkRNTmRIeG1CMml2YWVmK3NrNXY2Tm9oMUJ3bm1N?=
 =?utf-8?B?am1xWGtTem5lNSswMUh1SFZmT1dmeWJtT1ZpUENoKzh5RktVa2VMR2N6MEZl?=
 =?utf-8?B?dGM1NHp5K2ZQL1RCNHZKVEpKSE12RlMwd1ZtYkJyd21vY2VhRkdOdGFTWGN1?=
 =?utf-8?B?anJKaXBMeGFianh3OTNib1JHbmQ4MFVnUEhsTWE0WkVpRDRaUlFvMWJJKzZM?=
 =?utf-8?B?YnVyb1A2QTE1SVRlOUJRYmFDT1N4bm9XVUVCOGN1NU1tdTBjSTNVK0szcXl1?=
 =?utf-8?B?SGpmblFQbGQyUTJkRjVyRXVPQ0lHMTlNNDJ1OHVrWDBGMmRSVkdWRlRkSFVW?=
 =?utf-8?B?U0xnNDlQNWFBdGlPSkpWcXR4WFVBc1Zqazg0RTZjNEw2WU1ocjFBR01NcmNh?=
 =?utf-8?B?bE5LWEdYNXcrQ2x1eWtHc1MrazJuNS9OVWxUVnoyQkpDdkR1WTgrZGlSYlpZ?=
 =?utf-8?B?bURLSTFNSEFub0U1SXBHZlpmMjZqVEhtbGkxYThWR3FEMWZ3T1RuQ3V5T2VS?=
 =?utf-8?B?V1RzQWFSQUNkUFEyZEE5TEwzMnF2T1I0Smo2NFFqRi9SYmg1MFQyNmt6ZnZP?=
 =?utf-8?B?N212K2ZMSjNOclRmRmEyem1NSUNyQnZ0bGp5ZSsvUGFrZHYyUmx4MGtIUUVY?=
 =?utf-8?B?OUZJN3NWWmptYk1HdHZqUm9ISjFtWll4N3Z1VFhQRHNsR3drd0VCa08wcEFB?=
 =?utf-8?B?WmplTVU4cE5ITTdIWm42OENOK1M1am9TY2hBeDNUczRhQmRSenIvQU00elhW?=
 =?utf-8?B?OW1JS1FHN2pJN2JtTkZURUNFbE1DejlRK3lGb3d1TnU4MjJWTGRPR1k3ckNY?=
 =?utf-8?B?V25qcTEzT21YbE1oVTYrMkkyaW5pRzB6dnZ4U0FGQWpxcFZxSng3ODJURTVJ?=
 =?utf-8?B?VHdHUWxhWVMyNzdvWGpZMUxKaElTTDJITGRaYzZFdWIrVWFhMm53MmRSOE1x?=
 =?utf-8?B?RDhzTUJjS1lMdmdpWDN1RmhXQTJsN1BFOEhnanQ0MkpUS0hadmNPZmR1RzB6?=
 =?utf-8?B?VVRnMGJiN1JXSnpwUWdjV3JDUW15M2o4c3ZHVHJBQzk4T0pyZ1NVTyt5RERv?=
 =?utf-8?B?TldRanlGVkM4S1FwQzFtWVZOdDdPb3g5NVNqc0xYdUplbzg0b2tUcmpsYmlQ?=
 =?utf-8?B?dGJDTGx0clA5QXVZek10L2FRTEo1bEFMUUFvUlQzdnhzUHNBREYvWlpPdXpP?=
 =?utf-8?B?eHY4cjhRRmZEaDBMajhUaUhFVkZqa1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVdYa05qdjJQdE9IY3diRjJlRnBqS2ZzblBYR0VkdVJMQ05sVEIyNWZsQUNS?=
 =?utf-8?B?S0s2NFkwT0Y1KzJ3Z211QTd4NkN1ODlXeDVUdU1Hd0dhaktFUGhFZGhRdmNK?=
 =?utf-8?B?T2lQOUpHQUttMTNuemRKazNPWG5OR0NPay9JODlhaEl4VlhkYlJJaWwxWEwy?=
 =?utf-8?B?enFkSXdyK0grdDV0ODArUnJ1R05BS28vUXJRL0w5VmVjWGtaTnBRWklWM1hy?=
 =?utf-8?B?ZDZkMmtCT1dQUGhYbFhYWHlORGpmVUtXTmVtY0Y3NUJKTGdWbENiclBISndm?=
 =?utf-8?B?LzFVeDUxNHExeHpMMm5oRkpQK1NHMEsrY040QTViaGt1eVBlUVVIdjBoZG0z?=
 =?utf-8?B?L2crRHdMdHRwN3c4b0s4SmVVSjdtQzR4VVZxa0RwWHZGTG15bmRXS0dvM2hq?=
 =?utf-8?B?YlpYdVlnTGxsUjdnUEFYTEtuZkFHdmxaS1lQaHBNdU83M3NKajhCUWQ2V1pq?=
 =?utf-8?B?bmFvcEU0VUVWdkxRcVpocUR4aFFWNlVhMTg4eTZqenZlY1RZN2JnZW1QRXIv?=
 =?utf-8?B?MU9kSGgwaU5vUTVEVU5MUytCSitkaU8zQWZ0MjRVN011VFpocEd6N2h5UHpN?=
 =?utf-8?B?MmlreUtnYkRYRXkwVHpNUEJ1aEFPKzcxREtOTUJsNnIrMHoxOGpENDBLc1FM?=
 =?utf-8?B?NGtsanZpVlNHK01NbGNjWkRMdElTNGNwUDllL1NnaHlKODdIeks0bnIyMHJK?=
 =?utf-8?B?N0I2ZlVaeG9pdEhDbjFJM0lWbnBhRTBMYVBOQlI1akZNMWpGZFdFOTZONmFx?=
 =?utf-8?B?VzNab1JmQ1JmSFQ1UEJTb2xjZVVyMzg5Ry8xcjNzRmNaamVmMytQUm02Q3lY?=
 =?utf-8?B?dUZuZEc4SGZ4OWRIQklVM2NwTWdWNWtIQm1HWm9ZdzNXWFhEUFhKbTJub1Nu?=
 =?utf-8?B?aXNmYXhCQjdobmRwWkJsRElrVnUvNURWcmZUODVlMkQ4OFlvV2pYVi9oZGxt?=
 =?utf-8?B?a0wwVUNwL0s4WDJ4TDVEL1VtNittWEpIZEdNMTl4eWt4eUZBc2loVzBHQnpM?=
 =?utf-8?B?QXdoWVhKL05uN0hXZUlxd3g3NzQrVXU1aHlWQllKMkM0YnNQelBGL3NtaUJr?=
 =?utf-8?B?TEUwQUxDcVQzN3grL1dyNk5vc2RKOUloNWx6anU4TDV0SmUrVktoYjdzbTZX?=
 =?utf-8?B?b215NlRBT1pHYXpaVWxUREVGR2NuMGFkTHFlOEEwUFZLczBqR3QvVGVEdjMv?=
 =?utf-8?B?b3VtcCs4eHByZlBVTk9WYVhZVWp2UnJJbktGY3FhS2lwNHFkdTVWWHJQdEVE?=
 =?utf-8?B?MmVjNjJqdVFtdmVGbDVheUJvbERTQTVGVVREeDRCSVpJQ091b2czajIxM2c2?=
 =?utf-8?B?MnVsR2RCd0VzWVVLdEZ4eGtjMzhSNFJiVHhJTU9oSXFGbDBubEg3Y2pRWWds?=
 =?utf-8?B?Nmx3WUJqTjFZaVNDWVVjM3g3Y3E2a0JiNjRHQ1cvN3VVYjR3OVhKNFVFM1lL?=
 =?utf-8?B?TnphVGxEV0o4bDh3UWU1TUdKWnBmQzF5SDhKQ0plRmp1SlhaN2tuUGprRnhm?=
 =?utf-8?B?ZVpTcysrZEs0Tlc4eEVTTGhOeUNRWkE5bXR4RUdmK0FqczB0b25lSWhuTGdx?=
 =?utf-8?B?Qkl1NEdUb2hnY1UvRjltb0loK1djR0VoUFpqOGVkU1pneitIaWUyV1dxMDVT?=
 =?utf-8?B?czF0WXA5NlRxSlB4NEh1M2tnU2YwMEMxc1hzdlo3YXVtcXk5VXh2VlphWW5L?=
 =?utf-8?B?MTgwMWxxRWxiejc4VkxlYVFxNFV4Um9PNjZRTGFVK2NKbU9CWEhvVVUrVVdI?=
 =?utf-8?Q?/ZKO1xqNE5Ywk6SeG+1jCBoE3uuJwPneOFJAv2n?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327850b9-af56-4884-6a77-08dd773b9144
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:53:08.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1749


On 2025/4/8 13:01, Inochi Amaoto wrote:
> Add support for Sophgo SG2044 MSI interrupt controller.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   drivers/irqchip/irq-sg2042-msi.c | 61 ++++++++++++++++++++++++++++++--
>   1 file changed, 58 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index 30a1d2bfd474..2935ca213306 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -19,8 +19,6 @@
>   
>   #include "irq-msi-lib.h"
>   
> -#define SG2042_MAX_MSI_VECTOR	32
> -
>   struct sg204x_msi_chip_info {
>   	const struct irq_chip		*irqchip;
>   	const struct msi_parent_ops	*parent_ops;
> @@ -44,7 +42,7 @@ struct sg204x_msi_chipdata {
>   	u32					irq_first;
>   	u32					num_irqs;
>   
> -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> +	unsigned long				*msi_map;

Regarding the common parts of SG2042 and SG2044, I noticed that you 
changed DECLARE_BITMAP back to dynamic application. If there is a next 
version, I suggest you mention it in the commit information.

Otherwise, LGTM.

Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>

>   	struct mutex				msi_map_lock;
>   
>   	const struct sg204x_msi_chip_info	*chip_info;
> @@ -96,6 +94,35 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
>   	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
>   };
>   
> +static void sg2044_msi_irq_ack(struct irq_data *d)
> +{
> +	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +
> +	writel(0, (unsigned int *)data->reg_clr + d->hwirq);
> +	irq_chip_ack_parent(d);
> +}
> +
> +static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
> +{
> +	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +	phys_addr_t doorbell = data->doorbell_addr + 4 * (d->hwirq / 32);
> +
> +	msg->address_lo = lower_32_bits(doorbell);
> +	msg->address_hi = upper_32_bits(doorbell);
> +	msg->data = d->hwirq % 32;
> +}
> +
> +static struct irq_chip sg2044_msi_middle_irq_chip = {
> +	.name			= "SG2044 MSI",
> +	.irq_ack		= sg2044_msi_irq_ack,
> +	.irq_mask		= irq_chip_mask_parent,
> +	.irq_unmask		= irq_chip_unmask_parent,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity	= irq_chip_set_affinity_parent,
> +#endif
> +	.irq_compose_msi_msg	= sg2044_msi_irq_compose_msi_msg,
> +};
> +
>   static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
>   {
>   	struct sg204x_msi_chipdata *data = domain->host_data;
> @@ -175,6 +202,22 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
>   	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
>   };
>   
> +#define SG2044_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
> +				   MSI_FLAG_USE_DEF_CHIP_OPS)
> +
> +#define SG2044_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
> +				    MSI_FLAG_PCI_MSIX)
> +
> +static const struct msi_parent_ops sg2044_msi_parent_ops = {
> +	.required_flags		= SG2044_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= SG2044_MSI_FLAGS_SUPPORTED,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
> +	.bus_select_mask	= MATCH_PCI_MSI,
> +	.bus_select_token	= DOMAIN_BUS_NEXUS,
> +	.prefix			= "SG2044-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
>   static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
>   				   struct irq_domain *plic_domain, struct device *dev)
>   {
> @@ -255,6 +298,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
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
> @@ -263,8 +312,14 @@ static const struct sg204x_msi_chip_info sg2042_chip_info = {
>   	.parent_ops	= &sg2042_msi_parent_ops,
>   };
>   
> +static const struct sg204x_msi_chip_info sg2044_chip_info = {
> +	.irqchip	= &sg2044_msi_middle_irq_chip,
> +	.parent_ops	= &sg2044_msi_parent_ops,
> +};
> +
>   static const struct of_device_id sg2042_msi_of_match[] = {
>   	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
> +	{ .compatible	= "sophgo,sg2044-msi", .data	= &sg2044_chip_info },
>   	{ }
>   };
>   
