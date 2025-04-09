Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562C259C;
	Wed,  9 Apr 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185238; cv=fail; b=k1UaG082ecfLWrpsOlzwwKW4/bzoRDoDSLC1n0aXmNQ3cO2lq32joe+Kbxu/G7AVxEC2S3jc2dLTmhMqNK/OyfC1lXhWs2Ye4uzBHwSF916Wq8uTE/6FsRW1w41MXNCFjaUIkqw8BwsXU5RW/YHemIgXavIg72PwlON7BGUAjiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185238; c=relaxed/simple;
	bh=Gc1imWti4RdgthGy/fS01cCBj0oddR976PSP64Mk30s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kn89vO9CWw7HYJF0Wh3FaRNBbKy5YmMmYb+ByGynLBscmbp5UH4TEo23NMv7QTFZ98ZNDJ7IrV5pcHwoqUFxJM2s9cZMWvmc75KarhMSzdkZP1wwQeqqHOIT1LcA8bLfyw5WJ93oPrNFWESvh4BHmprkIjZt6E/BEbwRGfaSv7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IztgELFZ; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IztgELFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENF2+8zpqfrWvfuaRURYg6l7Al0huoIyIF3sCJtLhK2H1W11q6Zr1yIV3NUeHK81rOS5+VgpFr5q3cTv7LDaBue+/svvhmOwUx8taiHMkWTfOU6j21T+TDTbc/xyQqjA0E/ZZZ1CMT7sUfRNTy9wIKCWE4wNUaEJGeciYtjRhLkmy6JRpEUROxfeXdjRVEOc9ti6xi9sk0ya+4TSJOeplUd3lnJIwtsNkRf+PdvxWgqixvNruM7xcf5vhLoHDSj0NIgRFxOQ9GvCyDK57KK82EbXLAJndQ9giNuUXp5rfSNn/TeM5zUij5jenV/mpmw8G/X5C9yuHfyyMJNnADptLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep9yP5saeOo/IH9tSGcSX4gtzMJWMNtxJTG+HBDXJDQ=;
 b=rIx0l0tnmdXOMK+EO6ZRMyhX+PIjvuW+ZF8abFNr1znAndxLy5ZHg2IZn56c1JdW7s8PYXyrCzthI2jNOjdvMBSCxDf1W5i6Tmoc8nN1WQ783MT8xEG7hP6aLLkTYC8+OIB2LjRMpT1PeFyAPBGWtVrxE969nba0mFShqVvryj+VJvkryHd+N7gcSBE7UExfc60R/vth+vr0UTm3QKzZGAx1yaOMFW3ECdTYNaBIk+kSaOK2Kh1oGg4XMRKC1yYUuyIyFF204IJ+k7wyFTlYHfUsnK2sZK9KFuwFIc9YjRONUAb7m7JyPdMTtc6AsrERwGmyONybWKDfZQVj9LcLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep9yP5saeOo/IH9tSGcSX4gtzMJWMNtxJTG+HBDXJDQ=;
 b=IztgELFZ1hbf5nOn4kko32jVmqLE+QRGw8pmXlTDDN87to1wV3+5USkY5prPDquNTpzO0dMGGYVvy74qzeduvyJV+Rd+62pxe6b0fT2hn7UNHW60J3es0KkkMJnUDwxn0PpZmrZchJpz1t6oCXov2rfB0ARTMvN6rqGalrHwxCDUS5uHN5k4NyjoMpxD3BSmygrQ0Uj1mzhNb+60msdgtkn061ZIvRp2Y58SwXLQOpL/uAgowbzCexZljrTkTMOZWfvO+VvxQAChun+zLhhJKIgUED1HIKJpeiNybncLPJwKshfKIyI5IgTT0xtfwkNOkOhD5sozAsVgAD7w1UgExw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MAYP287MB3689.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.37; Wed, 9 Apr
 2025 07:53:50 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:53:50 +0000
Message-ID:
 <MA0P287MB2262FD85121E6DC702BF0BC8FEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 15:53:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] irqchip/sg2042-msi: rename generic function and
 structure
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-3-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250408050147.774987-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <5e273846-d59b-47cf-b126-47e76be48f62@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MAYP287MB3689:EE_
X-MS-Office365-Filtering-Correlation-Id: 353db5b0-1429-45d8-a00f-08dd773baa45
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|19110799003|6090799003|7092599003|15080799006|461199028|440099028|3412199025|12091999003|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFE5N0NyeTdlMTlKNHpyNXRpMm14ODFTQjJjYkh4RUEyV1lNQlQrVlhFRTZH?=
 =?utf-8?B?SVVnQjREVXZweE1OajY2K2hpSGlTWnZpTnFkVkVSVjNwdDVLbExoYVlBU01q?=
 =?utf-8?B?U2N6RWhNRGRDTFZvMm9YTGMzT1NmZTlmTDdCRHJGdlhVWXdmMUdGSEI3eVNS?=
 =?utf-8?B?cWExWHh0cUVoYTgzemRsTkVSRWE5VXc1WWFoQVh0OFlIaVV1OVBZZGxHQllp?=
 =?utf-8?B?QUpDT0xQRlZPaDV0cG1tTWJrUER5RmdUa0JkZEszYzhoRS85T0pVakppOGdC?=
 =?utf-8?B?S3hNendpQ0Vua0t3S0pmdWVQZzJUSGZvR01UdnBzd0FHQm5zMlkzc2s5WVJR?=
 =?utf-8?B?bDl6S3FQeFA0SW16NG85Z1M0NDNYeXNmcXhRYVRNalQ3NFczZmZWLzQwZDdt?=
 =?utf-8?B?NDNNamF4aHBLcHpKcEF4dlFlV0c1aWVWUXBkQ3IyQXR0U2hpMjA4MWptM0Jz?=
 =?utf-8?B?dEFiWkZ2QzJUUjZPTFAzaUkzRjRrczdZbDFHeTJrQ2ZhRXZmaHJ3YWJsVXZY?=
 =?utf-8?B?QU9yZ2hGYzRsQ3MrM1dQaGZWcnBXWGx4NGlSNDdPOWdJb0pFcTIrbGhaQlha?=
 =?utf-8?B?NlAyYmF2cGM2c2NicmpjTFFjbnVpOVAreHEzc0ZseFdLYmIzdFM5ZFRHSU5t?=
 =?utf-8?B?em5lNEdBVHJ4bEZWTk12ekhhekY4a1BmVmtBcmVjbm9QNy90TVZhaFRZbjEw?=
 =?utf-8?B?b0x1ZmJuUENYN05OMVoyL1lUN1FubkxTRmk3dTA0aHVDaTMvMTFvcFVYM2RL?=
 =?utf-8?B?M3hPR01ESkdDNXVRY2dBVmFzV1QybGdyaXZnL3NQT3FqRXpoK3E5K1N3c2tr?=
 =?utf-8?B?VEo2anpxSEFSR3BrSngvdzMrdWR6WGF4RGdQLy9WKzBsaHJKajlJOHBxV0Q3?=
 =?utf-8?B?Nm5vTXloaXdhVnoxS1dHazdacjk4K1VBb0oyNDN5c21ZR3oxZGpCdzMwUEd0?=
 =?utf-8?B?YTM4K2d3WFpwSkdTUUI2NVEzNFViNjBNK0owYkNyLzNxVXF4T29xczBpa3N5?=
 =?utf-8?B?bzR2UGZDS2E4MjZ1R3p6K29OZGtCSnR3SG1Xb241UTZLdm5DNHkva2RpdVc1?=
 =?utf-8?B?cEM3NW9sem4zUWtYQmNYRGV0YUlWV1V4VmR5STQxM0p5MVlpK2N3Mkc2b0M3?=
 =?utf-8?B?SXJOREl4LzQxUXZZV2NXNGc0b1M5ZitUazVFbmYveWJ2amQ5WUQ3TzBqYkZF?=
 =?utf-8?B?RVd6QTNMSFUwNk5KMk1laVNvcTlIazJSOFBBVFllazZkUXA0d1daeEY4ZjVQ?=
 =?utf-8?B?dUFOSHpwMnNRVWhaWGk5ZlluZkE5UktEcFNZVXZkZmF1SFB2enp6M2g0MTNx?=
 =?utf-8?B?UStwZ1J4UjkrMHpOVERobW93UUpzOVdDb0ZuU0pNNXNuQllPMUYwdFlPdjA1?=
 =?utf-8?B?LzVIc1MvL0crL3JvLzFuWEZ0WFBvL3ZNdFprbVRwZk1MVXVyN1kyRE5wcURv?=
 =?utf-8?B?QktmazI2bTdUUDVkZ3M0Y1NaaHB0T2xNUm1CVEUrREgzQkRzbDN1SVcydTlZ?=
 =?utf-8?B?N3VEV3R6VVE4bENwWUdJNGJHdHBYVXAveGZTZndLRzZ4cWd4Sys2WGVyZ1o4?=
 =?utf-8?B?SXlkazJzUkpLb1BRb3JoRXZIOFFzMVAzVDRaS3oxN3dBT2ZkMHZ2N0grV2xL?=
 =?utf-8?B?dzR6SmlzcHp3OTlPU3dDclhRS1JDcWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmtnSm1yYnFadXRFcWNmb0NacjROeFYxWVZpTy85c2VqVHJlY1BTYnhhL2RZ?=
 =?utf-8?B?S2xVNXN0UWUrNHg1UXQyQnZTd1pRZGVhNTNIUTFXTytsTC81TlVhT3FmRUtw?=
 =?utf-8?B?VkNQM0hjS2ZQWFVLRElQOWsrZGZlL042MHRGanBDNE9HdVArV3JXREo3RDI0?=
 =?utf-8?B?YVhVSmFndmZxZUgrbldDY0tobVBSSWw3dWhMNWtGSTVudDlWblllR0NiQkJL?=
 =?utf-8?B?OHBIV25SV0kzYjc1RVdzeHd3RVVVb3B3UHhTVU1qZ2NhdjE5eUdyb1g5dDNr?=
 =?utf-8?B?QlkxajZtamdjdGQxWDR2Z0JCZVBSeVBuQmdLcWpkNWNyMzV1cDJqVTFmQkRw?=
 =?utf-8?B?U09TNk1tS0FFRVNpWFJaRVhJbWJ2Ynp6ampmZStBSzNzaFJGU1JNbDZLQ2N4?=
 =?utf-8?B?MFBjdER3MFkxNG1KdVE1aWlQOU9kL1d4VTZMNEJZTUY2WkVVc0Vlb0lJMGNi?=
 =?utf-8?B?VWM2K0N5QjZFRVd4MXhZUUFsUHQveXBnbXdxRk9LN1NLWDJubDdzaktTL2NZ?=
 =?utf-8?B?WjVGZUhNOXZNWGlrRWQ4RWR6anRjamNIN2RJclpXVHo1dEVnanl5ek9mQ0l6?=
 =?utf-8?B?dlNvUGgzVEVMRWw3ekdWdFNqUUpSdmx4NVFxRFlCWDM0U2Z4eThNdjJHUnBT?=
 =?utf-8?B?Z01hckpVN2dJYmVxejZjbklSZ2VCcVFIY0xKYkZKZ290K3JjWTc3dGJVZGFl?=
 =?utf-8?B?eHVyRUt4WVB3MjRZaEYxekRETUFCMVdaMFFnWXlvNUdYUFE1QllLeDVQT1Fh?=
 =?utf-8?B?eHRSU09UT1pmeVJNM0F5NEw4c1NSN1RCNldIUzQwblhUVENDdzlBRlFQR3pQ?=
 =?utf-8?B?K0lWVExNaUZoWjg3L1FZNm50Vk9SOXBDdlFGaVppeWlwNTJQZm94ZVpFNkpN?=
 =?utf-8?B?cTJMY0hUWVUyYkpSMHl6RmhpNi9EeXJ4Ri9tTFQxdUEvcUh6UDNMY3BsVWpk?=
 =?utf-8?B?bnMyN0Erd0l5bHc5N21UbWtObkdhN3VuL3NxS1ZNZDVnaHFCdUlPb1RDZXZO?=
 =?utf-8?B?cmt1OWJWTnRQREtrN3RjejRhMlFNekpvYi90YjRuL1RCcjU4NjNxL0QwbzZr?=
 =?utf-8?B?NTZyMHczaU8wNENZYWxVbjhoWkRXLzliMDFvV2REYkhTY2IwMHhKM05SbjM1?=
 =?utf-8?B?UVBnVXFkTE1BcXA2ekpCZnZBSzNxbnZCYk1DeVZYRWhWS2FWKzRUaEVOcTlz?=
 =?utf-8?B?N0E4RXIva1ora2ZJaVQ0bHR4TVI0Lyt3TVJhRWRtQXgzUmhwYjlPd1I3L1Zz?=
 =?utf-8?B?blRqOVlIK3kxMktLQnE0WjBYQTRkTE0vcGxKSzJYVkY1TDlPb0VOYXBFU0Yw?=
 =?utf-8?B?cTByWm1mSUF5YWw5eDZVQitDRjRaOEhaTi9FeGFaWkFoUjJaQmovVjhraHRy?=
 =?utf-8?B?bWdNQ3R1TXFPeUl6Mnh3aGFSMWNpdDNleExhdnpJMTFXclY0MUQ0R2RMS2FM?=
 =?utf-8?B?cy9iS2h2OEROWTNzYlNNZEZLdHlUR1lnV01GaS9TOW11bU1FdTVHdERQa2tB?=
 =?utf-8?B?Y01YVjFnMW9aWURlMjB6K09tU2xCRlJHbTNWczVQb2JHSUJMUmJTYkxTdk1k?=
 =?utf-8?B?YUhpOUg0SHRCbHZBSWIvVituT2JPSmdXL2ZTVWxtOHltNHNuRFJWaXRZOHpy?=
 =?utf-8?B?ZG1WTVNJMytoM2tLWVVjeW4rdTBweVRqaGZKVUhzY1hOTUszdVJRTHFjMzVo?=
 =?utf-8?B?S3BVbWd6VVlZTTZ5VnQ5b3diMFRSZWdWcjNIeXVxMUp6ekpRZVVIcEorZWFV?=
 =?utf-8?Q?n09B0E38WROwBTM2daBmj2mU1Awmuc2oXmGH8nU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353db5b0-1429-45d8-a00f-08dd773baa45
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:53:50.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3689


On 2025/4/8 13:01, Inochi Amaoto wrote:
> As the driver logic can be used in both SG2042 and SG2044, it
> will be better to have a generic name.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>   drivers/irqchip/irq-sg2042-msi.c | 46 ++++++++++++++++----------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index 375b55aa0acd..c9bff7ba693d 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -21,7 +21,7 @@
>   
>   #define SG2042_MAX_MSI_VECTOR	32
>   
> -struct sg2042_msi_chipdata {
> +struct sg204x_msi_chipdata {
>   	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
>   
>   	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
> @@ -33,7 +33,7 @@ struct sg2042_msi_chipdata {
>   	struct mutex	msi_map_lock;	// lock for msi_map
>   };
>   
> -static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
> +static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
>   {
>   	int first;
>   
> @@ -43,7 +43,7 @@ static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_r
>   	return first >= 0 ? first : -ENOSPC;
>   }
>   
> -static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, int num_req)
> +static void sg204x_msi_free_hwirq(struct sg204x_msi_chipdata *data, int hwirq, int num_req)
>   {
>   	guard(mutex)(&data->msi_map_lock);
>   	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
> @@ -51,7 +51,7 @@ static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, i
>   
>   static void sg2042_msi_irq_ack(struct irq_data *d)
>   {
> -	struct sg2042_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
> +	struct sg204x_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
>   	int bit_off = d->hwirq;
>   
>   	writel(1 << bit_off, data->reg_clr);
> @@ -61,7 +61,7 @@ static void sg2042_msi_irq_ack(struct irq_data *d)
>   
>   static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
>   {
> -	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
>   
>   	msg->address_hi = upper_32_bits(data->doorbell_addr);
>   	msg->address_lo = lower_32_bits(data->doorbell_addr);
> @@ -79,9 +79,9 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
>   	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
>   };
>   
> -static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
> +static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
>   {
> -	struct sg2042_msi_chipdata *data = domain->host_data;
> +	struct sg204x_msi_chipdata *data = domain->host_data;
>   	struct irq_fwspec fwspec;
>   	struct irq_data *d;
>   	int ret;
> @@ -99,18 +99,18 @@ static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
>   	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
>   }
>   
> -static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
>   					  unsigned int nr_irqs, void *args)
>   {
> -	struct sg2042_msi_chipdata *data = domain->host_data;
> +	struct sg204x_msi_chipdata *data = domain->host_data;
>   	int hwirq, err, i;
>   
> -	hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
> +	hwirq = sg204x_msi_allocate_hwirq(data, nr_irqs);
>   	if (hwirq < 0)
>   		return hwirq;
>   
>   	for (i = 0; i < nr_irqs; i++) {
> -		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
> +		err = sg204x_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
>   		if (err)
>   			goto err_hwirq;
>   
> @@ -121,25 +121,25 @@ static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
>   	return 0;
>   
>   err_hwirq:
> -	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
> +	sg204x_msi_free_hwirq(data, hwirq, nr_irqs);
>   	irq_domain_free_irqs_parent(domain, virq, i);
>   
>   	return err;
>   }
>   
> -static void sg2042_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
> +static void sg204x_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
>   					  unsigned int nr_irqs)
>   {
>   	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> -	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
> +	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
>   
>   	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> -	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
> +	sg204x_msi_free_hwirq(data, d->hwirq, nr_irqs);
>   }
>   
> -static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
> -	.alloc	= sg2042_msi_middle_domain_alloc,
> -	.free	= sg2042_msi_middle_domain_free,
> +static const struct irq_domain_ops sg204x_msi_middle_domain_ops = {
> +	.alloc	= sg204x_msi_middle_domain_alloc,
> +	.free	= sg204x_msi_middle_domain_free,
>   	.select	= msi_lib_irq_domain_select,
>   };
>   
> @@ -158,14 +158,14 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
>   	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
>   };
>   
> -static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
> +static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
>   				   struct irq_domain *plic_domain, struct device *dev)
>   {
>   	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	struct irq_domain *middle_domain;
>   
>   	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs, fwnode,
> -						    &sg2042_msi_middle_domain_ops, data);
> +						    &sg204x_msi_middle_domain_ops, data);
>   	if (!middle_domain) {
>   		pr_err("Failed to create the MSI middle domain\n");
>   		return -ENOMEM;
> @@ -182,13 +182,13 @@ static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
>   static int sg2042_msi_probe(struct platform_device *pdev)
>   {
>   	struct fwnode_reference_args args = { };
> -	struct sg2042_msi_chipdata *data;
> +	struct sg204x_msi_chipdata *data;
>   	struct device *dev = &pdev->dev;
>   	struct irq_domain *plic_domain;
>   	struct resource *res;
>   	int ret;
>   
> -	data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(struct sg204x_msi_chipdata), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> @@ -232,7 +232,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
>   
>   	mutex_init(&data->msi_map_lock);
>   
> -	return sg2042_msi_init_domains(data, plic_domain, dev);
> +	return sg204x_msi_init_domains(data, plic_domain, dev);
>   }
>   
>   static const struct of_device_id sg2042_msi_of_match[] = {
