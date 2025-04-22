Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF510957
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745286409; cv=fail; b=HAq2Wk6t8nanFyrXXE+ddV8gL+kYl0Pz4ght5fqlRSAQFrGIyTxaLhFcU7+mQvwtwvhvC5f5+fPB6YyQwDiErlWOGOPvjYN9PM/h6+2ruIMjDI44plm74McAJi7EXjdn/FGu0GMDLHXR52wiLI18jkw/cqjQU5IUvW5ARj1/DP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745286409; c=relaxed/simple;
	bh=MmwqVYgWrGfVZMY168cusloF5b4J4YrI0/f1+EdNc90=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AJz+fhEjY3E3A7NRHjczrdy6vEyBNDgEG/24Ao7OfLzYmHlXwtk77BSAG3d9R1SabtjUhfRRSieoe1ous01JB6wFHNItNctgJgAP+AX3pPyHBRmmRnb9IZzHvV+WMPHgiWTOMDPOP1WmWYTvc3YAvfLUu99NY5egJB5xoYFp3CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Mey7+zui; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Mey7+zui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGqZ/7P6xOgZk7vlROtUTc3swZY2pq/aXiynuGnW5xGgaoWD1ZEezyh+7rUI9El9qoJvYjmwyLB61dzWnK2S7KIAUI54OeJY0tt2V1ZIVBxHgIMHyYWENUPCE+vQfttpAWtTjyGFRMWc52bowZCCbf+cYKRDtWvvUjLOi+Jg/p9tZZzhx3eM/V+WBImT7Q1AEi1zLckpKOPKEiFW2iaYORtgfFAceQpJiMPoD0LsiResziasx0oXwtjmN+raobl9dRmVRf4pJG+aKIz0D9KMRDivH6Zo2ThCmTgA/vFT+zWg55DpKvK3D/wlSgJQntxpVDjlhRcuDvMnYMGLWc6zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxfsWZXNkjBXlZdbz3pDg/uTaRI/gr6mCC3hIeGNr84=;
 b=WgQXMbo6MHiSj9JAE3oKccFyimyiCYpc8xzec7GLmS/2N9zWU+252KAiCPrM5savknO7TvsT8JTRHvHOSgZpBIobJeCTRhjRF9JYDbsYmU1D8Dx3WgZhK7+ZGUAyi38Mbt/cGzqW70lyGCDGA8UPtkzGsks90ccQuHvFSkLqED8S/mvgV+ZDFFkrQNhcnwjI91oNO9YQUBYzmaGyG0LKjbBT6MCVWVdHMRfIkr1JViPAE2+gvR1LJiw8xxhntnMih+UgnhgjTUFzk6zYmZ+/drlDeAQyVqN630nyECHTCQnxt54OTeXYmYZA17v4M7gxddJANW2AfwTJzFlTVTWt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxfsWZXNkjBXlZdbz3pDg/uTaRI/gr6mCC3hIeGNr84=;
 b=Mey7+zuiq49n2Ml+350+by4tJ9DeoaI8ruBLaYyMaS2LeXXSEHiFa5CG0g2b0OUxeWvFyX89FKQJfSu083XXMpuH1LTmVxkcYtc7AoE5zeT2UYwHgEcsDanwDnqaTAp8VJa081IPwHCr67p9hg+QFt7BYIs4CxdR66kxbYqGycYovI38xuAG7cwpy+xNOjuN59nU7NPu0nl4z/bQpYL9VVouzrQlVUwKXTbaPwyM4Qeqku17l6UGhO5kKV+5efIzX8UGKFA/bjiQuMW88UeG3a7HuXtZEfLzB5DtPERV1/Fb2yhdRMB8obLUH6lzEZaiqz5rafzccqFtM4q9+MAZew==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2P287MB0287.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 01:46:42 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 01:46:42 +0000
Message-ID:
 <MA0P287MB226200249253571617B14BDBFEBB2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Apr 2025 09:46:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sg2042-msi: Fix wrong type cast in
 sg2044_msi_irq_ack
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250422003804.214264-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250422003804.214264-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <c0d9e96b-5f01-4c13-854b-d6963b36dae8@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2P287MB0287:EE_
X-MS-Office365-Filtering-Correlation-Id: 192b2b55-e7fb-4e19-6dff-08dd813f870f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|15080799006|19110799003|8060799006|5072599009|461199028|8022599003|7092599003|1602099012|10035399004|440099028|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnN2N0xDUlhWdWhWbVJrTXExRWFwNlEyMDJjMWs5aHRQbDlFcVpkS2pVa1Ri?=
 =?utf-8?B?eEJmSXZQTExUSC9PUWoyUGhrQThSWGJUaElxQnZyclhOMkJIRlVxUytCcW9n?=
 =?utf-8?B?VHdETTE5NXBNMVcxMnRCdWdXMUJlTXV4OFJZSWxYQmY0ZU13MHZWWWZaem5j?=
 =?utf-8?B?eEQvajdhR0VsU1BhNzlpWS9IRTc5bXM1c0cyb0luQ1BiVlE1cEowSC9jWEhY?=
 =?utf-8?B?TmdJYzRiTGdHTWlvcTdjRWFmc1B5YmxnQ2R0QmJMRjkxSUJUV0xUc0NKZGgw?=
 =?utf-8?B?TTc5NjVqTkppMTA3dm9JcUVHa1E2R1dYRzErdElNcjFGc2ZDTDNNWEY3RmJ6?=
 =?utf-8?B?eDM3emRVeHpUN2NUL1gvajZrN2JoRUhFaHhUd0NrUG9Yb0hhb2NDUGQ3azNX?=
 =?utf-8?B?c1NqRlV1NTl5WXVaRklDTFRjT01lQmNhaDVVTkFCbmxEQmlTZkRLK2FnRDM4?=
 =?utf-8?B?Wk9SVlBhcWJ0WEJqd3BQYWRtaDAyVHZYS2tTbUEzUWY1MFZ3ejF0YUJGNUJF?=
 =?utf-8?B?c1Vob3N1b2RKcERBb1VuNmdzazYxVTc3YUx0OEdnczNvQnYxYVBBV0dZWWQy?=
 =?utf-8?B?ek1JcnlicjcvWTdOMUpoK3c5MVJESllsTm5BT0tEN0ZjWFpFUGtORFcyT2FP?=
 =?utf-8?B?Ulh6cklSZUZyVHI2dTJYZjQxZUtCTDVleUNzSFRVWXVhY1B5VWlFU3pkQ1BO?=
 =?utf-8?B?RnBtZkVIYjdhcVcyeUE0UmR5ZGJHcUlObm9kTFVzRERrRkxDTWM3WW9OdTlY?=
 =?utf-8?B?aG1QSE02dHk3QVRsRTNVcmV6Q0dBdHQ1bUgwUjU5eERIZzNrU29IbWZjK2wv?=
 =?utf-8?B?VjhZV2hjREt1K2dMOE5yOGZnUW1wRjc5SmxvSGo0TThtUG5JK0NxNEdoTjRj?=
 =?utf-8?B?RVV0c1NXVXpWeDNUZGNEV0k4cUV5UW9kMHJPbWVEUmZTT0E3OW8xeEllSkU2?=
 =?utf-8?B?YmJSTzc0ekZyVG1hSGUxcVRuVkVScXNDV1JBdWZkRHpWSnhnSkxpclJrUjNT?=
 =?utf-8?B?UG9oMXMwblN3RC9yV3NOck92TVZRS2FHNDV4bnhsVm94dFZOUFlaaHNuS01F?=
 =?utf-8?B?N2phaWJxVGZ1RG90SlM2N2hHcW94bmluOVlqMmdOMEpUK245OHdDWUplUGQ0?=
 =?utf-8?B?S2ZOOW5zSDdtbFFiMytGMUJuRjRKOW8xNkRXemZTSjIrZng2dVREdDRjNkc1?=
 =?utf-8?B?Y0JqSWljTHF4R0hNYXB0Q0pVRkVmSGFIQUJwU2NGOHJBRFJ3ditNK3d6Nnkw?=
 =?utf-8?B?dGdjWGx2MUNNeTB5Y0hZWXdGODh5T3E3N2k3SVFrY1RiZTRzeS9ibjhlck9r?=
 =?utf-8?B?bnVZYzlWQWFXS0xNSE5BRlN2T3p6TnhTeFlRUnZjMXgvQ29wZ3pjdjhNSktr?=
 =?utf-8?B?a3dBUkJ5bnBXc0pyNk1xYmRGRjRxMC95NXMvNGlUWFFvZThZVFh4VXlHUlRu?=
 =?utf-8?B?ZEYzT0YyYk1HakJXSmNwaGoxL3NHT2FpSlcxZVlqQXpaYlY4T3VWdk1QTjBw?=
 =?utf-8?B?SFZwNjlsY2lKRy9EaTZ6VnNlaFZoUTdSNDNRQWJsTDJScjFXSXpWUjMrdzhX?=
 =?utf-8?B?Mk9qb00xMkdqSkdXdHI1NDZWYjRmTi9FdGszUUtPOWpnUGVqR0Nzd20wYjdJ?=
 =?utf-8?B?OHRzUUdUOUU4WG1ZRlpqWHVSMkI5dU9DTnZld2oyZ0ZZaHUxR3VYWWtqV05D?=
 =?utf-8?B?RHZEdEgxSXcxc28zb0lQajNyRGkwTnZFZ2Z5RmJ6TS9INUk3RGVvV253UWlO?=
 =?utf-8?B?RjdPMW9IeGVaSjR3cHlTM3UyWEFWN1FRbUF1SUQvdHBLbTduMVQ5SlQvR1Er?=
 =?utf-8?B?TkszS3psc0dRZFdCaXVjQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmt2UzRTK1RBQ3gwNG9lSlVoSkdGWjFteFd3dXYvdm1aY2pBK2ZEcTRLbGkx?=
 =?utf-8?B?RXZyZ1NZS1QzcTRiR1BvL3gxVEg3ZytQcTBLQ0gvTGI1aHlObmhrKzE1aHBj?=
 =?utf-8?B?YndJbnFQQVlnL2Q2NklIOVlMemxXbzZmOEp3WU5SVkNEUnd0WklpUmRTUnda?=
 =?utf-8?B?YzVweUR1UDFnaGowMWk3ZmVlYW9jdjRWNnl0OC9nTlVQZkFpcGE0cFFqSDEy?=
 =?utf-8?B?V3hQblNKQndZRys4SUxRdmMrZitQc0JKWWhHQXZkT1pHWmZNYU9XT3hLZ1FJ?=
 =?utf-8?B?ckdsUVBRTnFQZE5Da0RVTTNZOHZDUmx4U1dXZ3NBRXRhYkxVcGkwOUdFZVFZ?=
 =?utf-8?B?WmhDWFVrSklEcjN1UFQ3L0dQMWFraW9KTmtMdmlWWGpTRVhoUVA5dE9FbWlt?=
 =?utf-8?B?UElTNG9oYmdVOHI1L01RRE9LT3htbis4UllzbytkR1pLemtTZmF2L04zWXF0?=
 =?utf-8?B?VzFHU1owcmFkWTFQbW5jNEVNNE94NDMyL29LQkR5NmhhWEl0Q3hBT3NhU3Nu?=
 =?utf-8?B?ZWlEVFBkdjNGZnVTcURtS21JZ0FMcW9tUTd2V1VqSHVWRUE5STFBUStQZDk5?=
 =?utf-8?B?L2tNT0Q0N01FbmhQVmZ0MUp5NkhWanJiV1VDOFVMZWVZT0JNbzBPQ0lrQnow?=
 =?utf-8?B?bWZWaFhQZVM2M0Jaa3BvOW5GR0w1NHQrU1VxK1VTRjZ1cnpWM2JjdURMRThX?=
 =?utf-8?B?QlRuUjJmRGt0Rlh6VHcvWiszbi9QZXJERk5kbGNFK0xTSU9FQ3I4QjRpNDRX?=
 =?utf-8?B?WkoxMHJnUUVqMmpKZ0lRQUZ3eGl3Q0tVUXNmZVYySW1RbVdaY0owd3J5dWhP?=
 =?utf-8?B?VklnN1NYYkhjSHhxWHBHeFdHUEF0NFBSM3JyQ0dZSFc1Wk1MdGQ2d2JPTzdt?=
 =?utf-8?B?VHNqc1c0TUowUUZueVRCTlNPcDFXWUZlMldPTXNQdEZFVzd1aUUvZzc4TWNP?=
 =?utf-8?B?UjZOMm15amdTVitLTnlTZzYraDF5T1JoTVl5OUhOcUpOK1pJSitRZzF2VDZw?=
 =?utf-8?B?QVpmSE5mL0pqV3Y4MnhsbW4xQ25IcHZ5b21vbkxNVDFZTW1FMnh3QkhRaURo?=
 =?utf-8?B?Yms0Ri9obUtnM1RpeS9sUUV4M0pCOWhDRDZiZnBjdzRhcVZ2dEdiTncvbWgw?=
 =?utf-8?B?Zjdjb3kwOWV4eGxFVGNNRnhsTG9jZWd5SXRnY2RQazdrZ1czWkgzYU1henc2?=
 =?utf-8?B?NVc1RmdrUGFscjg2UHpuM29uR3pZTHRPV1BZbUYvS3VUUnJYMjhBRTlGZzIr?=
 =?utf-8?B?QmVkcmphdUFHTmw5RE0rTjlrVmxWR1lteWdsYWNJZTZSRytLS0F3TUxhQmZR?=
 =?utf-8?B?Zm9ua1Q4cXRRallsbzRyYm1iU2tqZ0x2UzBpcDl3dml0RzZuSCs3ZG5yR2Vr?=
 =?utf-8?B?dWdlcVNueFhNeE93TXBOVU80YytNVEwwQXVDLzNveGp4b2JwMDg0Z0tOd0hQ?=
 =?utf-8?B?NHgzWkJPNHN2QS9ROWZqQ3lMa1ZCUnRtRldPZSs4TitEczBxeDVqSTdSTjVD?=
 =?utf-8?B?ZlpWcGlaS1BNdnVkc1Y1YlZwdTd1T1N6ZXplWkZJTnVFRmFDSXV1cXlqR3pU?=
 =?utf-8?B?OGFvRk02T1ZjSXU2OEw0UmE1cHhFUDVGMzRtRlhDTExrbklrbzZPOUxKelRu?=
 =?utf-8?B?c2ZSd3drL0FkZzc2bnRFK1ovZktxRzRSa0FldkEreE9TR2RLd2c3bEFTMGlt?=
 =?utf-8?B?bXFCUnBGSjdGb0orZG5nZVd4b09VblpvendEZmttUFJNdHA1ZTl0SHVyUjlw?=
 =?utf-8?Q?F9zTyUAdT1dpFi/opgh0DDMfiAmXhtcrrDK85Fj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192b2b55-e7fb-4e19-6dff-08dd813f870f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 01:46:42.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0287


On 2025/4/22 8:38, Inochi Amaoto wrote:
> The type cast in sg2044_msi_irq_ack lost __iomem attribute,
> which make the pointer type incorrect.
>
> Add the miss "__iomem" attribute to fix it.
>
> Fixes: e96b93a97c90 ("irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504211251.B3aesulq-lkp@intel.com/
> ---
>   drivers/irqchip/irq-sg2042-msi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index 8a83c690b760..a3e2a26d8495 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -98,7 +98,7 @@ static void sg2044_msi_irq_ack(struct irq_data *d)
>   {
>   	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
>
> -	writel(0, (u32 *)data->reg_clr + d->hwirq);
> +	writel(0, (u32 __iomem *)data->reg_clr + d->hwirq);
>   	irq_chip_ack_parent(d);
>   }
>
> --
> 2.49.0

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks,

Chen

