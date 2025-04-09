Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010006.outbound.protection.outlook.com [52.103.68.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75225A2DC;
	Wed,  9 Apr 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184680; cv=fail; b=Gnbf4VP8LbV7pGUZW2NpMq8oPLr3UYABstI/tmbFRK7a5DQ2lPgJPHRXsZcPsl9ehj24BS7J6mKzk93q6XG9xtGa4LBC9wolcTDwXMWgFYFCXywARdqeLmj+UqcIAjI8AiTjpNbrMQvAosuBq9sJZUdELnbmobNrT/h4pBkqDgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184680; c=relaxed/simple;
	bh=SZ71IHaeSHRU/JzGco1dHZNV+aQJIZmIMRlu+BD9RLw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gpf8f5r56aNeucgR0Y0DzRQMltTfImwSoFH6IUOG7UMs9p/Ay78Ol2+jYc0X8aLBBuXNlzNPNiisHrdgdFL3JmGujQj3Hqph9vGixh+h1Ui47kQyFpyEku2B2/Igar1VN9Njj3cz7GdP5pjhIuXU1JQBxwKDbwZJzCodQ8V0G/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RdkuGMAz; arc=fail smtp.client-ip=52.103.68.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RdkuGMAz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+Zo7Z55tXMTMDiriBczXs/XkVokoyU05eoevMCpQPcHktVDUy+lYAhdWVsIrWRukHTmu3TFDDxlaU8QqUzUiMpeapmu/eQFsjvpTkZhJ2FNDVrHSKnyAxUw2oWuqYxCnUkSWWER4ryHCp0iWmCKLi+SJdk2UXpgVZdRgis+hw4frAlbGWSCb73neT6yraACKC3rznC2UkyP9J0IeT7wbixoDztV5VNKdN6UOIaXt1S3Rqg4LaJ8Y4SkpChwinbAX+9V8FxgTstlzpug7653ng9Dw+ctFkpLnyLS53mNQleQCErTF925PBrWBtC+TwsgqHUsnGxc/cNecgcubppRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t04B2XO776OmwAE2X4Di/1QLZPn71CZPv/2yB8AHr6Q=;
 b=XZDpelZ/6SuCJLKECzGcMuf/xoYRSbeVc5av+k+FWknczC6CWB2dU5aYFq7JXwYSFEI7LJjlPxMABlXEKiAB8Crl03HECDsjwSp4vob2HtxCbqqg128hhAjBPRjrOtYSERIIbp2KfOJ9Up2eT+7y3w7/H5YQLzH20o0K+TYfdJmZgA0V4t/vn73rbooOv02BJML5YAWmV/jsnfLXR09g73U8Utoa+H4KDiuXI4RyHEoSebIQI8cAVu0vH5x2OiNJ5UFMV7dxtyA0mhiGKqvoMYywSLBWBkNHYuVNhzXpQIQnl4e82It/hsdO60bd4sUgHVdLOcZFSvvtkh0TljHZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t04B2XO776OmwAE2X4Di/1QLZPn71CZPv/2yB8AHr6Q=;
 b=RdkuGMAzcUQW+g2xxHBTihgj6qf24KzjWLlCUHd5BkMJdoFyiMIrGJvgheFmior8OBGQkjTnYF7duZBpAWWIYDnvlPigloWYpnTbDTwLWpfO06VTOYNiKs3qnRtZqvq63TtPJh9qFyxM5xpoeQ21GId0v3UH/XvxpPkgP2jqJQCIzpvyNXIIJjbpRBXhZ7ghRJxmZzeRlSg1N3ah/nD5/FSnLRRfXcTepRGSnmsbcEj78uM58UAsOqOfxf2m6fbWnEky5F28XxxvcqdW8cdh3W/10ZQ5sYVJvnYQZruiqcQmgugMnFpicQdpfTHAiQHA4/bcX95pBl7/g4Oia1jHRQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0233.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 07:44:31 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:44:31 +0000
Message-ID:
 <MA0P287MB2262E07EF5871631C6576F9CFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 15:44:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] irqchip/sg2042-msi: introduce configurable
 chipinfo for sg2042
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-4-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250408050147.774987-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <0e3e74a7-8fe0-4636-9e5d-c484129f32c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0233:EE_
X-MS-Office365-Filtering-Correlation-Id: 0231da70-e571-4146-38b0-08dd773a5d60
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|5072599009|6090799003|15080799006|461199028|7092599003|10035399004|3412199025|440099028|41001999003|19111999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFN1S00zRlA3MTBtNDFmNlFnb0tQQmx6VktTcnlBMWhqRUlNMzIrcEFUL0E5?=
 =?utf-8?B?a3lEWUpqVnVPQVJLUTYxWDUwa0R3R2dtemlLbzlQbHphaGMrTWNIZkJUSnNU?=
 =?utf-8?B?alFoLzlKUWRpU3ZWSEFpeXNhMkcyY1E3VWxKQ3JlaHpyQk9weDREbVpSVTJi?=
 =?utf-8?B?aHMvRlQ4RWNVb3dSSHlKK0pUZXJFdTFmYzdUVGEzWTUxQVdlMzArbU9LZGtm?=
 =?utf-8?B?eDcwbm9tRlVWVnN1R2RZMllDOGg2Rmd3MTRselB2MHdLUDA5L1VUY2NNUWpH?=
 =?utf-8?B?UkhSL0xudTk1djJud0F1TFlueUFjcG5rMUxSbHlldDRNampGY2xOZGtud0lH?=
 =?utf-8?B?VnUxbXMvZE9ZRWt6SmduWXp3b2gxTmtxUloranRsMENsOWNQaU5CRTlXNXJC?=
 =?utf-8?B?a01EcXc2dGl4RnA3VTJSaHBjS0IrUVdMMkJLOHVWbzM5dGJVZTBielJ1U3JM?=
 =?utf-8?B?U0NYTHNYeWpjTkVDY29pTzYrYzZUb2ZMbUhTVHR6clhSZjFsSlRRd2VhQlla?=
 =?utf-8?B?dll3WEFISXpVS3RPalBNdXpaSVBra011alppc0VSY3lBRTRCVDRGWlI4ckl3?=
 =?utf-8?B?blVWeEtiWTJZaXZxc2tRSnBUUmRzL0NHMHdBcll5M1VGYlVaS2RDY2pOc25Q?=
 =?utf-8?B?QmpsdzJJZWNIamhKUmNHbzVoRnMrNTJFb2xYNk1KbnhySEVwWkV5TUk4cU9x?=
 =?utf-8?B?L1pDSnI3bysyTlVBWHJJcHFhWTY4VDRJa05hYml3YnFuU0x4bi8vV0RLZzdj?=
 =?utf-8?B?Q1pvVXgvT1Vxdy9aRTd4alI2dW84N1p1U2FsOUw3U3YzOG8rOFdnY2d6YUNU?=
 =?utf-8?B?aDlHVXpsSjVWcnhkMmlQeEZyNStTZ3lsQ1M0bmpWQ3VidEpKSnZWY3hEVzdm?=
 =?utf-8?B?MWM0Umh1Nk10ZjBzNjdMNTJIc2hTTmJLekpwV1VYNHVTUkY3b1I3YlViaDRx?=
 =?utf-8?B?QkV0MmYrc1Azb20yZTlDTy9jcTdPTXlhUURpQUVJYWxDcFZPVVR6QmxoQWJW?=
 =?utf-8?B?NkFSTnFCYXFaUVVXdGYyVi9nRlBJcDFsbjlaVFBRNHZNcXZVY2pEeGlSVlJM?=
 =?utf-8?B?UFZJb0JDRTgySkQ3R2RqS1orM0dlVWtyZ1JpZDd0SVc3NkZBWWRtZjJ5VUN2?=
 =?utf-8?B?R2xBM3RnRUFxbEpleFcxUG5nRmxoUTdtVEM0Qld0Vk10RjFHNlRUT3ZLSDlN?=
 =?utf-8?B?NHRoMzV0cnBOaHJrc29DRUhnVy9hNmY3N0N0OVZDUFdjVFRBWHJjN05yRUNv?=
 =?utf-8?B?bGhva0xnMDYzWlNITUZhMkg5SFVyYUdLclZ0UW55WjhkQ04rUk9FZHl4Q1gr?=
 =?utf-8?B?RTNSc2szWWRweFZwaTFTWmM3L0YzYW9RanRVS3YyQmxkM1N2Rm8xVmVkendK?=
 =?utf-8?B?c3p3YnI1cng1enY5ejJuUnJ6TWdxN2NpTm83Umd5WUVBU0JRQ2gyUUg5bUlq?=
 =?utf-8?B?Y2YrVURlVThKcTNndCtiTzZOb1VrbkVvelJCSFJjRlA1MEROc1puckV4Nkww?=
 =?utf-8?B?V3FWdW04bHJ4SnhhTWZ2UDZQVmlLUU9NVjlEd0x0bUZFR0l5UVJYenBMWkdy?=
 =?utf-8?B?NmF1TGJncWFmL3Y5dEVIWS9xQU9CZ2M2d3J4aVdEbWhPa1d0aEFld2RkRkxN?=
 =?utf-8?B?K3F3SGYyL1ZOdTVlVXVoT2tGbGZ5cXAzTy9kSXdNd3AwRU5XUk5hQTZ1Q3ZP?=
 =?utf-8?Q?WXyni7+BADovOkfCAp7O?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFZmVHJRWi93akxoS1Z6TjlRYXgrV1hSWlRVMGtYb3kzTHdTQ2dCTVpzU3N0?=
 =?utf-8?B?VGlNeU81YWY2UVlhMC82OXVnUGhwYU01bnFmUDQrQW5LcEYvZ3M4YUZLU295?=
 =?utf-8?B?VlZ5NnhXblcwa0gxdjdLTnRkUmpVVUxQSjBCMkMzak5aaFk0WEU2TTdtN2RW?=
 =?utf-8?B?M0RzQldEQUtLM013RDQ1VGZ4NVpkaXBqdFdJQ0s3OTlZTkNhcVBTeUxXMlBR?=
 =?utf-8?B?Zyt2aEhHS2lleDg2SEZsQnZleW4yR2lRYjlhUEJGT3RqMG5CdG5MYlAwajZM?=
 =?utf-8?B?OUZoMmg4NkQzZjN3Um4wMjlhN1VGd0FVdlFrN2RwbHFFL21iVlFZTkhDTkZx?=
 =?utf-8?B?Z1JyY2hhaTRpMXFOTlg0eExrTzJnbTE5MVNCUmRmK3JLUlJRK0I4RWhyN1lj?=
 =?utf-8?B?dHV4MTU4akVrbkN3bGJEWmxtOXZUd2oxZjZ2YkxBaEt2RndySnNjdnN5ZmdJ?=
 =?utf-8?B?dE0zYi9ORmFvOG5JZ21rWkpYNkx5OUUrRU50aTIwSi9yYUdmcnFZem1yTXZo?=
 =?utf-8?B?bUYrTkFmcWVBVUpQa1QxNWhrcVRQNkE4VHVDckV3dTVvNkR5VmwwQkRUV1d1?=
 =?utf-8?B?VHUzbTYxaHkvR2ZCL1kxUkV4WlhYOEdndW5ETWdTOStVR25xSXJzTWRNZEVr?=
 =?utf-8?B?NFFGbU1FdVc4VlRGZmdtS285ZzJWVXlKNTFBcjlHVGhqamxkMG83NHhQSytF?=
 =?utf-8?B?VjhBZEtqMnJWNFZWZ2FFd2hlbUxaSWR0M2xHU0sxWlg2N3kvdkVDcDJHdm1T?=
 =?utf-8?B?OW9scnZaL1RrQm12UEtYZEF3cms0LzJlY2hBVWREV01QaExxOXRQdVNWV2hL?=
 =?utf-8?B?MXRZMnVkVWpnakJvbE83ZmFjZi9KQkhSbWVJRzRoWDdoQ2xDbkUxUWpYTllz?=
 =?utf-8?B?emNqckN1VlBxd3Z2aGRNOXhMS2pBQ2I0YzEzSk41azM0aFo5T2grWUhudDlV?=
 =?utf-8?B?WXlmYktZUytMcFNNU2UwNkd5WldCOElOMGh2L1kwa0VTL1JJQlgvd0RBOXp4?=
 =?utf-8?B?Q0hQeTBFWUlhUzdnZENQT0hZZjI5YjRmRzd1SXN4WWZhNTkvM2ZrN0NObStH?=
 =?utf-8?B?K1gyVzNycGhlcWNQWkR2REJzWFlxek5yY21wanh4aVRtdDJLaVZkYkgvM2Ra?=
 =?utf-8?B?RXdxV2FUUHVaeTRuL29UN0JEZWFyZDJDNGoyMGdkTmlFVjdvY2pVbGJpbTdo?=
 =?utf-8?B?QnpvZ1VyNVRJR0hFUk8yWGlMM1BpYnlueTRSUEJWN1dPMENCQ2thUHcySHBH?=
 =?utf-8?B?WWNveXliTFNjekJmNHI1S0J4YzRkaGY0UlgxWVVFWFkyVlVpeVdJeUtWa2VE?=
 =?utf-8?B?cnAybm9QQ015enNjY1ErV0JIbzA4VzJ4QmQxRUxrZXNPS2pCbCtuT2RFVXI4?=
 =?utf-8?B?SFBoLzFPQmJ0YWQ5K0xSaWVneGZmRzdVY3JjMVpWOEsrSDhCcUthclpQSzVz?=
 =?utf-8?B?Ym10elQxbDlUUFBUcDF3M1N6NGRGSXhqNWZwOVlkMVJPS1FhQkhZS001akU0?=
 =?utf-8?B?R05mckdrS2ducmt4L2hBYUd4UVR3SGxwSFArQnlMYXdSa0F6WU1wMDhEM3dC?=
 =?utf-8?B?VXRpMDhSOUZyL2l4ZW5FclRuYUlubkgvcjJKd3VkUnpJWHJSam42NCtWakpv?=
 =?utf-8?B?UGhwenRSMWZIbXRUUmYzVUllYWxXMElsRzZieVl1Y3kyU0c1bHZ5NUdZdHRk?=
 =?utf-8?B?R0tzM2tqWGhyVWd0dHc0QWpibVFMdkRSd2tUeXBqbkNITUtuQUI5OUVpTjR0?=
 =?utf-8?Q?4HZDE3pSwkxVQxzk27VETJ5eSLcxJXIvih9i7fk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0231da70-e571-4146-38b0-08dd773a5d60
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:44:31.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0233


On 2025/4/8 13:01, Inochi Amaoto wrote:
> As the controller on SG2044 uses different msi_parent_ops and irq_chip,
> it is necessary to add a structure to hold the configuration across
> controllers.
>
> Add the chipinfo structure and implement necessary logic for it.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/irqchip/irq-sg2042-msi.c | 44 ++++++++++++++++++++++++++------
>   1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index c9bff7ba693d..30a1d2bfd474 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -21,16 +21,33 @@
>   
>   #define SG2042_MAX_MSI_VECTOR	32
>   
> +struct sg204x_msi_chip_info {
> +	const struct irq_chip		*irqchip;
> +	const struct msi_parent_ops	*parent_ops;
> +};
> +
> +/**
> + * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
> + * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR

Does the TRM chapter information also apply to SG2044? If not, I suggest 
to indicate that this TRM information only applies to SG2042. Or simply 
delete these chapter information and only keep the explanation of member 
variables. If it is convenient, please help to add some comments at the 
beginning of the file to explain that the MSI register information for 
SG2042 can be found in Chapter 10 SYSTEM CONTROL of 
https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM.

Thanks,

Chen

> + * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
The same question as upon.
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
>   	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> -	struct mutex	msi_map_lock;	// lock for msi_map
> +	struct mutex				msi_map_lock;
> +
> +	const struct sg204x_msi_chip_info	*chip_info;
>   };

[......]

Otherwise，LGTM.

Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>

>   
>   static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
> @@ -115,7 +132,7 @@ static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
>   			goto err_hwirq;
>   
>   		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> -					      &sg2042_msi_middle_irq_chip, data);
> +					      data->chip_info->irqchip, data);
>   	}
>   
>   	return 0;
> @@ -174,7 +191,7 @@ static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
>   	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
>   
>   	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
> -	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
> +	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
>   
>   	return 0;
>   }
> @@ -192,6 +209,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
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
> @@ -235,8 +258,13 @@ static int sg2042_msi_probe(struct platform_device *pdev)
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
