Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967E23C514;
	Tue, 13 May 2025 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130300; cv=fail; b=S90dwEwwXlzx5v32xjZsxk6bix3/H1Eg07ixEQOF0IUY+ncrvBT3XK7FenKPevQRWxLQ+U1bS5PtALUfj+u4fGAsDeM1yoMbv8DVavt+Wv2salFR5PdFRd49pWXbifXobkh+HqJpeNn1jn6jMkM0N06XYb5wdErNsWvKscN65LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130300; c=relaxed/simple;
	bh=KgSyx51Ze2IgCw/OY6ZfydsvpJTF8RK4oGP1iOxCn6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SJIDWZ/TyExRiYhgQe3bZ7j7ZVXDyYLE7TXaGDiY1HTiXZx/JAQxH6+prClz4sbt1Gtkw6uCbEZt+tMCp18YM0ylVWiBhXctY3Aoshmvz+9AVKpS790D+4a3qPyRXHx8zQOjXZRbLLZwNE7pPGq4Qif+Ze5ElobXFtnGAT+cNTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ksDwJsRx; arc=fail smtp.client-ip=40.107.22.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ksDwJsRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFjHlatWblbNI5D/YfoH3hzrWUPEinN4t4WPKVVBL8pon3SM/c8IJaE63xDYfKsE/om9F88AoDlAw3a68iWcGJ3TgtblDX0kVw6qvAnee0hom831fpm8wi1TOIMdjtfqNX9KUJayVGYUWJdNTu0SMSljqrdB3UFUlUU2C88mnCesXMqTb7RvZmYKG7luTsvs8OwyOd+ZrYkzran4elC2vlAVAJL5+7uWySZqZ1NtTCTZMPtRERFIb46CeFFbKaGoDGqXOaQhn/etNOEcmaxMdSDpazw+cCFy88Fnnas4Un1pLl97eQbTRCD/Ch1XtFHYEcV4bJ97Jm/SLXi8zyiuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4w+kUTzjSApva2bK2a2HPC9Y+4o9LSgRkKn9WELS6w=;
 b=CtKpx+L+X3F++sTX6cfY2ycE7f5CJA++kXoj9Up81TESCWDfbrBvyVRIqOd+O4AB2f5XHZ890A+D34ZxiGthBiUQWSrQdYp+L3vNqEWlOscwwrTLTgKi5D6BDilt5Mg/f0T/4oAeE05bdm4rUM/EPHQdczAC+GwxuGw0rZrBieOJKVPuOUUeGkuKAcejXpA2jPj2jsROBY8ysyF7a+LCfTnopK36cwZEUrtZQmfSpis9iKcmz0NzhjFpRljebkp7K0QYEyWk8Bjg58/w6WSCVwZlcw9WHdrxDrt7sohz/A466OjUw1qNXBZZAWEzuf0bMfCU42XIsywjhJD4OEwPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4w+kUTzjSApva2bK2a2HPC9Y+4o9LSgRkKn9WELS6w=;
 b=ksDwJsRxUy8QJH7UcAZ9rgwcKMyxLM4qnfcuURntSpFGZcB6MpYwgFWG4zKMlFnCQPzRSSyYlenJq2o6EpFsQbG7gQw5VwIRIH9g+2OFIhe8BWLxJVStalHocN+QaRiRLUMEChBezisLe9zk+jQyikUvKIocyW+JfZ4kPA5gnWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10277.eurprd04.prod.outlook.com (2603:10a6:102:407::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 09:58:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:58:11 +0000
Message-ID: <2d931577-169b-4738-bf4c-4931f1d4ca47@cherry.de>
Date: Tue, 13 May 2025 11:58:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: add px30-pp1516 base dtsi and
 board variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-7-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-7-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a42c327-0817-4a2c-e1cd-08dd9204aba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkdrY1dhWkJWKzQ3K2x6ZFliOEkyOUZZQnpLSEthZ0tLRkhHMEQ0M2NyUWlo?=
 =?utf-8?B?M2F0VUhhMk0zTUZDSG1uMzUzdlVxYUg1MTdxTWNVT1czSUYvZXlTZlNmNE9T?=
 =?utf-8?B?RDJiY08zVDU1bkF0dGRTSUhKZFBQK3ZjNWNyY25QWU00dElJL1FieXM4WXBI?=
 =?utf-8?B?S1pWWDNBcDQxV2QzZy9NdzlSMG5XQjdKWmIrNjUwbVQyK2lQREdIVy83Sk1V?=
 =?utf-8?B?UlRQM25sQW9tZWpkOCt1cU4va2M5Q0hWYmR4eDFnNWlCeHc0OXgybTJTRms4?=
 =?utf-8?B?WW1OTnBEazc1eXdSaituTVhWVDRObnBGdUFJZXE1cVRTb0hKL203MXVaam4z?=
 =?utf-8?B?N3h0VndTbmNiMmp3aWpiVkxkQlhOZE9UMWNqT0F6dkpjaVJCUjBDalF1L3Bh?=
 =?utf-8?B?MUhoZ1loeURwQ0ZIWnZhUUx4WHkzd01uTjh2dzlXbG9NbS82blJQTTNLS0s2?=
 =?utf-8?B?LzRxcW03L0VyNWMyRlFFT2gyb3JpR2pIWGFSbFNFcFY1MFowWTluZWJ1SThw?=
 =?utf-8?B?eUlDZWtDSmVzeTlSTS9LUVl1TTFzaFZSd2toZk1VMmc0TmpjTWNVOXJOU0lk?=
 =?utf-8?B?TThia0VKdWt5R0RmQjZQdmxHV0kwb0pZVmRxUEphOWNqU2hISFFtUjR5M08y?=
 =?utf-8?B?OGk0bjF0eUFCOXh4RnhDalpUbXpTSDlqRURnaHNDem9SYW1iWDlqVytyVm83?=
 =?utf-8?B?ZFZsWUN6Um5BeEt4TFdmdlRKSUlVTmxqZlh5SEQ5L1M3Nkd0cjh4bzJIbFBo?=
 =?utf-8?B?eGsvWFlHc0FRSmRzMXV5NFF5WnlSWDFrTmF3S2g2Y0ppZWpJOFBpRkorTTc0?=
 =?utf-8?B?Q1M4cEZYd2tJSmE0OForWlVoNEZUQjVWQ09SeVExZWdBTTB2MzloeTRMQTVW?=
 =?utf-8?B?d0p5QVpYNWkvRE1PQzdVV2J6WVlSZy94UjV2Y0hMbWhIU05Da3IvYmNKOFFa?=
 =?utf-8?B?bDJ0dkhUbWFETFlFNjF5OFR6VFJHUk9mUXlzdmpJNDFHL1U3STZ2bUlTaG9J?=
 =?utf-8?B?eFN5Mm9HS3VMT0lmb0ZIT25TamZIcFFyUzJnVzdxdUVHbzNPaGdkK0UzRC9N?=
 =?utf-8?B?M2pHaHNzeS9heS9Qb0FCVjNTTHQ2ditaMjk0aEcyMjZ4TThPMEpiSU1VVDRZ?=
 =?utf-8?B?RVVuZEdoMzdrcDJrN2dHYncrMTZvZ0NKSHQvbktFaVZ0Ti9nME9LODNLL20z?=
 =?utf-8?B?RDBoejYzaTUvbWhlYmFrM3hiMVpMUFR0UmRFdlYxUTVkblVob2ZpOWxzLzBx?=
 =?utf-8?B?elRQU2hLaXlFR3I5Tm5iTDg3ZlozZmdlYXgySW9zQXlvZ3B1K2pjRFZIQjNs?=
 =?utf-8?B?anRCTWZXT2NtU1Z0bFVUN0VpMlZFb29HTDdwOTlTYnRHaFk2MEM4V21xUmoz?=
 =?utf-8?B?OXRmUC9UZU1aUnpXNGtHanVyU0ZNYUxyU1A5VlBEdVczQXVzZTFObHcwZWZr?=
 =?utf-8?B?bzNITzliSUMwOEJwREU3R2NNcjFNcnBSaVVHUk4yTkJhV0dETkJDcFhERGls?=
 =?utf-8?B?RWlWTVd2eTA5QjZRZ2VMeXpTR1IraDhkQjY3OTR1OFkwRkpTU2tEVFk2V3Y2?=
 =?utf-8?B?VzhaS3RZUkU2YWJlaW5weGZJUytRTTJwVThBZVE2T1kvUFY4V3dNbHZjeTRX?=
 =?utf-8?B?WVBZSzVxRFJoY2RSSXpLWU5VcHQrZEhWSTIrR2J6bTAzaWQyTkozUjl5eGpC?=
 =?utf-8?B?dDUxOUF0VkJHU0dUelJ4QmJSRjJNZnFYbnBxNHVOOHJyYTF2QzZtbytjaDNH?=
 =?utf-8?B?SmNPRGl3clRQN3ZXQWNBd205UC9GUjFRVTU4WENsUXdLL3djNVZEV1NZWXZs?=
 =?utf-8?B?Zy9xeU5tOVJWTkxBZXMyMnVBY2REZlpZSzFmeG1CZkEvdzljRG9wZ3EzcnVG?=
 =?utf-8?B?bjBHSE5KWEhaREpOZ081VnFPUmgwbVBva2xVTmtQRFpXUTNvQ3BiVzZrMEM4?=
 =?utf-8?Q?DkM7yUngh3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGlDWWwvTG9YeDY5OXY0MXBqdFoya3kzQ3dYUkczY1VubEFFR2ZaZkMrKy9Q?=
 =?utf-8?B?NlNmSkRDMXNMRG1JMzlXRlBVSklaWDV2WmR3VTdtTHpNRG9vY2pMQmJaM2Vn?=
 =?utf-8?B?NVhXWjdCOVFkUks2cFdVNXI3Wk5tdndkeE04K2RQNWRhVWFVTGpGb3dRZFlh?=
 =?utf-8?B?MjcvbHB2N1AwdkVxKytOQlhqYkNJd1l1UDhVRUpkNmgzbkE1K1hrd0lNSnpP?=
 =?utf-8?B?dW90YmdKSHYrVnhuRXNSY0kxRzFiMWtPTHRVc09ycmR4QkkvQVY4cXBUaG43?=
 =?utf-8?B?OHdJU05RYXl1MWlmdEFQTWVUQ3E0a0Fpa1l4WVJybjVxS3BZRURFUEN3OTB0?=
 =?utf-8?B?K0VDeHgwR0EwUmVZUit4V3I5Y3ZKdWJ2Sm9XcVdHUmZNT0YreG1HSFM2R1lp?=
 =?utf-8?B?ZW5qeDYwTUNGZGMyWDArUjJjZG9tRk9FTDZrQTlwQThwRUtBckpYOU56U1Rj?=
 =?utf-8?B?ZU5EWHo3VDJ3NWFIQnFIYXJra0ZrSXduSlB2SUJkYUtlUUZIVTNzYVF4bHJ1?=
 =?utf-8?B?WEhUNmFFcmppNFB6NG1mYjB2U0dkVDIrdWhOQnp2NW9xWlNSUWF5c2dKWGdI?=
 =?utf-8?B?TjFITGZ0Yk5mbkMxOEJ2Q2s3S0N6cUtTUUVMeVFIWFNzeUNtaEZ2RHE5ajdN?=
 =?utf-8?B?cnpPdGMrTUFBNjRiMG56ZE9halJGVlRiS29rblVnc25sa2YyOFQvbTJ0RWtL?=
 =?utf-8?B?dDA2NDM3bzV5WDVSNGU0T2JEem96OFVkQXZCTUROU1BiNWJzM3g2UXNpNHJi?=
 =?utf-8?B?SjFhMm1SRU1XQ3dpUURFNCtMcE5LYjNPL0xZZ3hQL1pCZnhpRHZBWWxtakdi?=
 =?utf-8?B?SFJGckFZSW0xOERyQzYrblJvdm8xVEkzVjVQMUxjTnVkTkdWajBNbTFYem1U?=
 =?utf-8?B?NjhCVU5uMi84NEVBaExYcm9BeUQyNEYrNWVoWWNMSjRVUGVEUWV4WUZNbWdC?=
 =?utf-8?B?M1dIbEpFQ1BpN09NaENVOEhZWjNWWXVZRGdmSmZrRGFhUE1VWUxIM2s5TWho?=
 =?utf-8?B?bFdMbDhZZFczano3R1hvL2hxNVRnVUV6N0ZTc281anpQM00yNnM0ZkszYmpr?=
 =?utf-8?B?cFdYVjZFVURUOXYrT2drbXlrQ1U4aFl3clEwZWVFTUg5RjN1T1I4OEtEU3Zp?=
 =?utf-8?B?V3ZoUll2THRUNWI4bzNDeVpERWVIamUyOGIzYUhzRDBZcTZhRkdadTJ6dG14?=
 =?utf-8?B?OGZWUlpTREZyNXpYakhEZU5lWWQ4TVY1MnpQR21IczBSMnNXbmRWaVVGTHpE?=
 =?utf-8?B?TTNURjFiRVBBdDAxQU16QlRqMHgwWW1KY2lwMmozN0tmQmV5bG12L1VqL3Vl?=
 =?utf-8?B?QWxNOUlRRHNDODlobXBpOU83TVpWZm5RMk9odWg3NTdTVjVlS1oxSzhKMXNl?=
 =?utf-8?B?NHhGT3ozUkt5c1FrL2E4ZllhcjVPeWd5Z1Exd00yMldGdXUxVE9DVnN5d0tp?=
 =?utf-8?B?bGEwZExRQjczaE9Tc2hJZzdhSGlSbXAwSitnT0RycmYzREozYUwrYTF5WnQ4?=
 =?utf-8?B?RW9QZHNwMWUzTTQ1dHFYZVNFaENUUVVEWEd0WEo5ZkRVQkNnWC9KUW9RM0c4?=
 =?utf-8?B?Tms2cjhtdlN6RlZwalNTS09sU0Ezb0JtUkQ2ZEpvMUV3S0RlZmNubmY3bVlp?=
 =?utf-8?B?TFhGbVhCeWZDTUI2TGRkcUJXL05nRXdLNWlhUmpKeUc0VVh6NzlQeS9STFZy?=
 =?utf-8?B?R1RRZ1pRWjhieGs0QTFDNUZoU3loOW9xWUt1bTR6TVRHdC9ZcUM4cWduWEFG?=
 =?utf-8?B?ZEtvZ1MxVTFWNVEyS0hZSVlFZ25EZEpmRkd5aGNOVEduay9VZWR5NnZkVjdS?=
 =?utf-8?B?WUF1SXpGb01PcTJoanVrK3FKcHpvSGxieUI4bmpmRDViaFhEdCtpdGQrTk4x?=
 =?utf-8?B?cDFPYXJoMnE1c3BIa3lGRXJyTXNsZ3VFb3ovTitDa3poZEpLcElndWU1K0ZI?=
 =?utf-8?B?T0RzM2grdlhEQWEvaTllbjZCY3BpdE85KzYxTldJWnNvQ0RnOTI0WVhOYmtF?=
 =?utf-8?B?T1E0UThnWjZodktVNU5BcGdYV0pjbnRUQ2RhTHExNWVlZTZHSHFxVWxoalR3?=
 =?utf-8?B?ZGhhNUFqdWlDcVJjK3Z2WDE5Q0FWdTZiaFFYMVBDOWUzQXpoV1llRUN6d2RT?=
 =?utf-8?B?UmlqOVRXUzczZ043R0RNQVNrWk9JOTQzT2t1Z05mREhlTlFjdldWTDI4NHVQ?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a42c327-0817-4a2c-e1cd-08dd9204aba9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 09:58:11.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbRTBnRl9MmaU4D1kLxUt747/penMFQlvCY47DDOOCz/8XPGt3+Ot2HClncQySar1o4mob/u2XatGuw6OglfAHZg6X7wsBkcNoH0KfzbH2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10277

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> PP1516 are Touchscreen devices built around the PX30 SoC and companion
> devices to PX30-Cobra, again with multiple display options.
> 
> The devices feature an EMMC, OTG port and a 720x1280 display with a
> touchscreen and camera
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   2 +
>   .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
>   .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
>   arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 601 ++++++++++++++++++
>   4 files changed, 681 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 8151e8bb1cd3..899113f88a29 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2-of10.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-edimm2.2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-firefly-jd4-core-mb.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-pp1516-ltk050h3146w-a2.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-pp1516-ltk050h3148w.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-lvds-9904379.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-video-demo.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
> new file mode 100644
> index 000000000000..b71929bcb33e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-pp1516.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems PP-1516 with LTK050H3146W-A2 Display";
> +	compatible = "tsd,px30-pp1516-ltk050h3146w-a2", "tsd,px30-pp1516", "rockchip,px30";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3146w-a2";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
> new file mode 100644
> index 000000000000..a9bd5936c701
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-pp1516.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems PP-1516 with LTK050H3148W Display";
> +	compatible = "tsd,px30-pp1516-ltk050h3148w", "tsd,px30-pp1516", "rockchip,px30";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3148w";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> new file mode 100644
> index 000000000000..121654b17764
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "px30.dtsi"
> +
> +/ {
> +	aliases {
> +		mmc0 = &emmc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial5:115200n8";
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		power-supply = <&vcc5v0_sys>;
> +		pwms = <&pwm0 0 25000 0>;
> +	};
> +
> +	beeper {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm1 0 1000 0>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		pinctrl-0 = <&emmc_reset>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		/*
> +		 * LED2 on the PCB, left of the USB-C connector.
> +		 * Typically NOT populated.
> +		 */
> +		debug: led-0 {
> +			label = "debug";
> +			gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "none";
> +		};
> +
> +		/*
> +		 * LED14 on the PCB, left of the PX30 SoC.
> +		 * Typically NOT populated.
> +		 */
> +		heartbeat: led-1 {
> +			label = "heartbeat";
> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};

Missing a pinctrl associated with both gpios property, I assume it'll 
need to be added to the gpio-leds parent node and not led-* nodes.

> +	};
> +
> +	vcc1v2_sys: regulator-vcc1v2-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v2";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +

This only exists prior to PCB v1.3 and the HW department says we only 
need to support v1.3 as that's what made it out on the field. So you can 
remove this one.

> +	vcc5v0_sys: regulator-vccsys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc_cam_avdd: regulator-vcc-cam-avdd {
> +		compatible  = "regulator-fixed";
> +		regulator-name = "vcc_cam_avdd";
> +		gpio = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_avdd_en>;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_2v8>;
> +	};
> +
> +	vcc_cam_dovdd: regulator-vcc-cam-dovdd {
> +		compatible  = "regulator-fixed";
> +		regulator-name = "vcc_cam_dovdd";
> +		gpio = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_dovdd_en>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_1v8>;
> +	};
> +
> +	vcc_cam_dvdd: regulator-vcc-cam-dvdd {
> +		compatible  = "regulator-fixed";
> +		regulator-name = "vcc_cam_dvdd";
> +		gpio = <&gpio3 RK_PC5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_dvdd_en>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc1v2_sys>;

This should be vcc_3v3 instead starting from v1.3.

> +	};
> +
> +	vcc_lens_afvdd: regulator-vcc-lens-afvdd {
> +		compatible  = "regulator-fixed";
> +		regulator-name = "vcc_lens_afvdd";
> +		gpio = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_afdd_en>;
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_2v8>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&csi_dphy {
> +	status = "okay";
> +};
> +
> +&display_subsystem {
> +	status = "okay";
> +};
> +
> +&dsi_dphy {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	/*
> +	 * For hs200 support, U-Boot would have to set the RK809 DCDC4
> +	 * rail to 1.8V from the default of 3.0V. It doesn't do that on
> +	 * devices out in the field, so disable hs200.
> +	 * mmc-hs200-1_8v;
> +	 */
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	non-removable;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_emmc>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_log>;
> +	status = "okay";
> +};
> +
> +/* I2C0 = PMIC, Touchscreen */
> +&i2c0 {
> +	status = "okay";
> +
> +	touchscreen@14 {
> +		compatible = "goodix,gt911";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA1 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tch_int &tch_rst>;
> +		reset-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc_2v8>;
> +		VDDIO-supply = <&vcc_3v3>;

Same remark as for Cobra wrt alphanum order being case sensitive.

> +	};
> +
> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xin32k";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;

Please use RK_PA7 here.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		wakeup-source;
> +		rockchip,system-power-controller;
> +
> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc_3v3>;
> +		vcc6-supply = <&vcc_3v3>;
> +		vcc7-supply = <&vcc_3v3>;
> +		vcc9-supply = <&vcc5v0_sys>;
> +
> +		regulators {
> +			vdd_log: DCDC_REG1 {
> +				regulator-name = "vdd_log";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <6001>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vdd_arm: DCDC_REG2 {
> +				regulator-name = "vdd_arm";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <6001>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-name = "vcc_ddr";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v0_1v8: vcc_emmc: DCDC_REG4 {
> +				regulator-name = "vcc_3v0_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3000000>;
> +				};
> +			};
> +
> +			vcc_3v3: DCDC_REG5 {
> +				regulator-name = "vcc_3v3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_1v8: LDO_REG2 {
> +				regulator-name = "vcc_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc_1v0: LDO_REG3 {
> +				regulator-name = "vcc_1v0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vcc_2v8: LDO_REG4 {
> +				regulator-name = "vcc_2v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <2800000>;
> +				};
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-name = "vccio_sd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3000000>;
> +				};
> +			};
> +
> +			vcc_sdio: LDO_REG6 {
> +				regulator-name = "vcc_sdio";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc_lcd: LDO_REG7 {
> +				regulator-name = "vcc_lcd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vcc_1v8_lcd: LDO_REG8 {

This one's named 1v8_lcd in the schematics actually.

> +				regulator-name = "vcc_1v8_lcd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcca_1v8: LDO_REG9 {
> +				regulator-name = "vcca_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +/* I2C2 = Accelerometer + Camera */
> +&i2c2 {
> +	/* MEMSIC MXC4005 accelerometer is rated for I2C Fast Mode (<=400KHz) */
> +	/* OmniVision OV5675 camera is rated for I2C Fast Mode (<=400KHz) */
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	focus: focus@c {
> +		compatible = "dongwoon,dw9714";
> +		reg = <0xc>;
> +		vcc-supply = <&vcc_lens_afvdd>;
> +	};
> +
> +	accel@15 {
> +		compatible = "memsic,mxc4005";
> +		reg = <0x15>;

There's an interrupt line routed there: ACCEL_INT GPIO2_B4. According to 
the MXC4005 datasheet, it's active low and is released only when the 
interrupt register is cleared (by writing 1). Considering we have a HW 
pull-up (R32), I guess we can have pull_cfg_none for the pinconf?

> +	};
> +
> +	camera@36 {
> +		compatible = "ovti,ov5675";
> +		reg = <0x36>;
> +		clocks = <&cru SCLK_CIF_OUT>;
> +		assigned-clocks = <&cru SCLK_CIF_OUT>;
> +		assigned-clock-rates = <19200000>;
> +		avdd-supply = <&vcc_cam_avdd>;
> +		dvdd-supply = <&vcc_cam_dvdd>;
> +		dovdd-supply = <&vcc_cam_dovdd>;
> +		lens-focus = <&focus>;
> +		orientation = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cif_clkout_m0 &cam_pwdn>;
> +		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
> +		rotation = <0>;
> +
> +		port {
> +			ucam_out: endpoint {
> +				remote-endpoint = <&mipi_in_ucam>;
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <450000000>;
> +			};
> +		};
> +	};
> +};
> +
> +&io_domains {
> +	vccio1-supply = <&vcc_sdio>;
> +	vccio2-supply = <&vccio_sd>;
> +	vccio3-supply = <&vcc_1v8>;
> +	vccio4-supply = <&vcc_3v3>;
> +	vccio5-supply = <&vcc_3v3>;
> +	vccio6-supply = <&vcc_emmc>;
> +	status = "okay";
> +};
> +
> +&isp {
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_in_ucam: endpoint@0 {
> +				reg = <0>;
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&ucam_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&isp_mmu {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	camera {
> +		cam_afdd_en: cam-afdd-en {

afvdd and not afdd.

> +			rockchip,pins =
> +				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		cam_avdd_en: cam-avdd-en {
> +			rockchip,pins =
> +				<3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		cam_dovdd_en: cam-dovdd-en {
> +			rockchip,pins =
> +				<3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		cam_dvdd_en: cam-dvdd-en {
> +			rockchip,pins =
> +				<3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		cam_pwdn: cam-pwdn {
> +			rockchip,pins =
> +				<2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	emmc {
> +		emmc_reset: emmc-reset {
> +			rockchip,pins =
> +				<1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;

Still no HW PU/PD, so need to check the JEDEC standard to check what's 
expected there.

> +		};
> +	};
> +
> +	panel {
> +		tch_int: tch-int {
> +			rockchip,pins =
> +				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		tch_rst: tch-rst {
> +			rockchip,pins =
> +				<0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		dsp_rst: dsp-rst {
> +			rockchip,pins =
> +				<0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;

Same remark as for Cobra, need to check the display controller 
datasheets to figure out if we need PU/PD.

> +		};
> +	};
> +
> +	pmic {
> +		pmic_int: pmic-int {
> +			rockchip,pins =
> +				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		soc_slppin_gpio: soc-slppin {
> +			rockchip,pins =
> +				<0 RK_PA4 RK_FUNC_GPIO &pcfg_output_low>;
> +		};
> +
> +		soc_slppin_slp: soc-slppin-slp {
> +			rockchip,pins =
> +				<0 RK_PA4 1 &pcfg_pull_none>;
> +		};
> +
> +		soc_slppin_rst: soc-slppin-rst {
> +			rockchip,pins =
> +				<0 RK_PA4 2 &pcfg_pull_none>;
> +		};

Same remark as for Cobra, I don't think those soc_slppin* pinmux are 
actually used? Maybe OP-TEE/TF-A maybe? But I don't recall we actually 
pass the DT to those in any case?

> +	};
> +};
> +
> +&pmu_io_domains {
> +	pmuio1-supply = <&vcc_3v3>;
> +	pmuio2-supply = <&vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&pwm0 {
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	vref-supply = <&vcc_1v8>;
> +	status = "okay";
> +};

Doesn't hurt to have it I guess, but there's nothing routed to the ADC 
so maybe we can simply keep SARADC disabled?

Cheers,
Quentin
