Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2057.outbound.protection.outlook.com [40.107.249.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46122615;
	Fri, 23 May 2025 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018878; cv=fail; b=qejonNDuLRQch0u9hOglWbP5kUAV+SUR+psACbXJb8d7CEaXLpaVt6h3arjBzcUU+dQMxSjJIGDzUuQdvFAfNDUhrTrkHFIyn1F8z6zKTovxX4gMXrY+ywcAdDIi2tsVXKjQC1k0j7NATkseWz20jWlclslLsN3ZAq1xJntoTi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018878; c=relaxed/simple;
	bh=86hKIcXaCAobbc85AspECJZ44AyXqxR383ejsD4Qlf4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=drSEzkkKWjGPyU+1XK+kl8E7j/kPVeSQhoYYZtEzd+QcRc/N7+qYUMH+ierRPMMlI6llRJcBZ10nClgWNIvpXFySeIRh4iHhrVT7AKqYJwjWf63slM36QcS+IHMh89Eu6E1jeZE8JI2EFgmc4eixGnH0IB59O1Y+oNoxzQZynEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=OQfUYrL/; arc=fail smtp.client-ip=40.107.249.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="OQfUYrL/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+7wdkAOpxmZEeEm2sZXzphGvrlqQeAPx4cu0w+BRYm8o8LOMqDITQVhhVbqhMuJ5yRO3AnW2jZAOqlMSj7/ZGSMPFdRW2Jb+HxX7pPNvfp2C/WGrjv9PL5Ms0ANOsxm/esZXrAveaeKIgzQm/WAhR1bQwcRqAK13s8k1utaaATpOHh4yZpbW1HNgZXdx6BXdnle/iYilDdY+KTSp9OnZWOqDwW86iqunI5uZsXprak+BW3l13W9opAXqoCg0mrLkJrCCqARj4Q4KpN5DWyBQ69b7A1oONqTUm4fWy68ssmcr2/fPyNErU1BUTS2cZWCKsbA5f2QlMghIdVtmXQvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK6oKfHXyQ6Gk0gkz9k4IPlSJKrMMEaNsKm43wn7N+w=;
 b=kzaXtd+cSW09MmW9RW/cxY6ZLGO1/ACukS2AL4fssv2VszK819kheucihFx4gGwMmgQE+LAbz7m53xlZmlXFQDandbyBV5IhbbPH+hGPKjkgbjmEIR2Xd3QsiH7vet6chpmjrIHN/ksboaKnKA+0Um2/5t+Fg6kiFOyL5VPLGWHwB48Dvs3j1YOez0XVic+IJOoGOtJaEfpdqyGs3+PXO7L6XXZ9ffMH9ow1vzX23uIZLKD6qBGUA+1tR0U5L9oLFbBCwCb+kTFlFSA0Xh50AcuHqCR+gDXjt3SomqI1kPkUScuqwqvLx3xEwFqk0nzUjsOPGQSqD8mwThkn4rRx2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK6oKfHXyQ6Gk0gkz9k4IPlSJKrMMEaNsKm43wn7N+w=;
 b=OQfUYrL/Tys5CetHwFBwIvoM5PlAENGzRs/7pQD6bglVSi8P7xmkKo4a7Ds2NEcN594M/NLYxMMRDrQXEUGblj6lua4kOWQfW1o3xDITUjdzWT7OqZRe7pHjrm/s49rR71e2x8Rff2chmxXSCvnT7tOBk/qYcl9IZTGCXySxyac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10167.eurprd04.prod.outlook.com (2603:10a6:800:22c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 16:47:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 16:47:50 +0000
Message-ID: <eac73db9-5747-44a8-aa5e-f1e3edd25e8a@cherry.de>
Date: Fri, 23 May 2025 18:47:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
 <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
 <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
 <9e8f659d-9116-46a6-b7e7-3d4705f57ac6@cherry.de>
 <b322970d-8d56-46fc-b537-22f73a66dc8b@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b322970d-8d56-46fc-b537-22f73a66dc8b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10167:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2edce5-4971-42c8-efa7-08dd9a198d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEF6SzB6cGl6MFpyVk9hODV1bllFN3ZTeVpOZU9JVG12TG13UmFsMk1vZVVm?=
 =?utf-8?B?ejUwZmpsbGlaN3VVdm5POGx5Zm1JRE9NY2dNU2dpWGlBd3ZJRStJN0xHM3E1?=
 =?utf-8?B?WEI0RmxhbUN5T1hlM0xLdEJOMUVJUmtGdjVUdzNBakdzbnBMV0dJZUtYS2w1?=
 =?utf-8?B?M05IaTdSSkNYenU0c2g1elByekkyNFRveWl2ZmdUbGg1NzBOTWx2cEFuVFRv?=
 =?utf-8?B?U0xKQ1BNc1p2QjJKWVFxb1Ivb2VQWVV6YVlDbEVLY3c0YURwVDNHcHp1ZzE0?=
 =?utf-8?B?cWpjR1BhTCtISWY2SlN6ekt6V2dJRWhDOUNuNSswQm1RWERpV0tOZGFtUDJM?=
 =?utf-8?B?N1g5Q3FGVDloS0VzTUZkNGpTZmNmK1VWQjliUHVoS2tHWGlMajcrMW92SE5j?=
 =?utf-8?B?amNublA4eFpwazhUcHN4MGFzelF6Y3RPdm9NM0wzRFZCbmZiOVRUSHp5RTgr?=
 =?utf-8?B?Y0FWRmdDUjA0WFBOWEZ6bzBJeTRzb1dCZmFDVGY0YVZoYXdYcHBObzNqTGRJ?=
 =?utf-8?B?cXlLRFBEVjV4L2ZCQllLaEhUaVAyTVRVSjUrWWJpOEptQld3RThJYmp3emhk?=
 =?utf-8?B?aThkWXZDUUl0cnZZZEhOeVNDOHRBQlF6OXlhL0NlYysrbWtUSFZrL2Zqa2hK?=
 =?utf-8?B?SUZFZmc1U3h3L1JPbU50cmlOeDFOdW8yZUFPYVNLVFUvU09QQ3IwT3JWUjBv?=
 =?utf-8?B?cERBbEVDdTRFeEgyK2xvQ1JxeGk2M2pqVlFsamlMc0xNMHREdUl3VUQyckVT?=
 =?utf-8?B?dnJaZlM5TVBod2RuSUd3MmZBZCtLbFQ1WVZPR3cyc01USVVnKzdSaVFXaXhy?=
 =?utf-8?B?bTRobVluL0wrZm9IZDNrMm40WEdSUHlXcEE1aUhpOXJRcVEvZlZtZWtwL3pS?=
 =?utf-8?B?NWcrank4T1NLQzE3R0RjYWtoanVpVkZMN2N3Q1FxQVhPZ2d6eU9tVno3UVBR?=
 =?utf-8?B?am5YZVFpWjFseU1lODRtYzFTMmZuNi9JWFdRTVgvSEI1NzVQTmVOYm0zZjl1?=
 =?utf-8?B?TmtlNDJoc3FkcktyNTFwa1psNmlzR2syNE92R1JNanZNc1JVYWN1WW1NRTNK?=
 =?utf-8?B?eDVidVBvejFaZG9RMGt0bUhiTHB3K1RHd25KYUJDcGwwQjhXNG5ac1NXbWxR?=
 =?utf-8?B?TU8xR3dqdTBmZUNYdElCSHF2Rms3NlpYM0Y5K2lWeHJqUnVNdU52c1JHSjlh?=
 =?utf-8?B?WUNNczlGaElwNlNNVTRzTDVKMnN2c3dPSTNyT244L2ZTV29tU1VoNjIybWxo?=
 =?utf-8?B?ck5Cek5uU2FXeGNGMVNpOUFRbkN1b1R2RUwrOEtteFhGc3lIWWcwL1FZYVF3?=
 =?utf-8?B?YzFDVzFiU2JIcFJ5WFVDcWNlLzBId2l6VlAzcmcrS3lQcEJib24zYjRIN05w?=
 =?utf-8?B?ZG1uVnZKajFib0FKdUE2aWdCQW43SmVucmViY2FaWXh3ZURUa3NEdFRvVHJN?=
 =?utf-8?B?SDBWczQ4Qi9KNml3ODZKR1BrUjIrVUxjSzdnd0h1dW9DNUEzbEtTSGJqUXhW?=
 =?utf-8?B?emY5bjhpL0U2UWZIa1p2bDFWVzJMNFdqOE42eDBlcW1KQ04rSVZEZisvUjZO?=
 =?utf-8?B?SjV0ZDNMeGpRVDJZUmZIRHBkNEdVYThLWXYwd2ltbTFndWJ6WUlPSE05b0Rk?=
 =?utf-8?B?SHo2b2VMSEdJQ1dBYVB4ZGlPSGk4LzV3MEd0L2Y5OXlCNUJVT0lEOC94ZE5D?=
 =?utf-8?B?aFlETVM2N2R1NmNydFpoZzV2aVNoMDhzbGZUNVdvdVUzVnh0NHBIWXlOSVdS?=
 =?utf-8?B?ek9UVTh4MmZOc2RvY2dQY2FvTlRnVnBQSnRQYUR0NlFZRVJnb2EzU0lEN3JU?=
 =?utf-8?Q?vBzu3ksMGWpuIgtvvjMqWuZevkfsI8g58zFDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFCcFdhZkM2cURuNGdneVh6Z3UvcysxeE14eUVER3YzVTNzWTBsRkNEbTB6?=
 =?utf-8?B?RGRmNXFKVTdSNklCTjEvSkZ3QVpDVmh6cFlQVTgyQzdWS1oyMTlyZE1yTjdp?=
 =?utf-8?B?RXRheVhQZjN3eDc4bUphL2ZDRHQ0RHNDYVRhMkhMS3R2U096cVFJL1NtMHpL?=
 =?utf-8?B?eXZYdVo4YVNPK24vRXpVdFI3RXN6TkJmMWQ3YWF3T2pIM3pJR0IvNkw4R296?=
 =?utf-8?B?cXRocWFOUUIwTW5keFpxc2tFS2d6dkhzQkNXbno5bW0vRW4vVFczcTRWWDQ3?=
 =?utf-8?B?UU02WUJ6Z0trcXdZWHNRRkE1S3VjOFJ2N0Vvc2lxMzlqYXlzVUN4TEp0ZC9v?=
 =?utf-8?B?RFU3NHdaaHdERnowVk1FaWxLK1Ztbnd2UGU5ZVhJeGRUeWpEVUh0S1ViNGxw?=
 =?utf-8?B?d3VmdGdYUkdrTEhQSjRDMHNhN2xwNlc1L1I5ZUVqUHZVdVlHRExYMEh1YnZC?=
 =?utf-8?B?akF2RytvSmtxRHlTUm42TWRqZ096T3daZWI4SWNrb0lUSURzSElwLzNqbkk3?=
 =?utf-8?B?azdNWEcxNTEzVFM4WElBY0dSVHJFczd6d2VzYWo4K0d6eTNuQ2R1MHRWODVZ?=
 =?utf-8?B?VWlSVU02Yi9jR0RLRmV1VVM1UmtGam9TaEVCY0FOeCtlTFRHZEsrdUJ2dzBS?=
 =?utf-8?B?MFpOanV4WlpRQmxVaUh5Qm94MHIzbStRbS90YUh0VHZFSUFXVTlXN3lNcWI2?=
 =?utf-8?B?YU9xUFJQbHk5N2Y1Rks1VzQrYXZkZDQ1UERydVV3NURQS2R5U2Q4akFwblZW?=
 =?utf-8?B?VFowTXIrOWM3STZBTk1Dc0l3SitwZmo0elUzejRjSDRDQTBNZGVKWUxjaWtu?=
 =?utf-8?B?VlpqUzJudmUwdU5Vd3FuM3RVcklud1BFYk9FNWRhbjNIZnFaVVM4RG1KTkNE?=
 =?utf-8?B?TGtjVWJQakFQdTNiZXNTdk9NMkVTS2s5R205RFdmSUFYSmFwcmQrZUxkYmM4?=
 =?utf-8?B?ZURwRHcvR2dIQ01acDY0dHFOMWZiMUU3VDN4K211NHU1QkpTR0ljK0VqUHJp?=
 =?utf-8?B?N3RlZ0Q2b0s2T2lmOFVyS3p5MGRyTkQxYlFWckF0NnRrcHh3Q25za3hwamJz?=
 =?utf-8?B?Q01INTJRVHIwV0R2Q1FBWEdZWEVUTlRqcXFpbWpzTS95eTFPS015bFBnMzlW?=
 =?utf-8?B?dU91WG1oN3hJZTBOZXFUVzB5S3psQzg3VVV2bEUvOHdlbGVxRThUUGZhT2FV?=
 =?utf-8?B?amNPQ1JFWXJsaVdnTk9PUi9maTdURFJsLzcwQlBDR05ZbnNmYmh4QXRUYy9Y?=
 =?utf-8?B?R1duOGNVbmxhNnltS29PZG5wY2lsbFc4VUN6TkFpbHh6OU5oUElaemRPK29D?=
 =?utf-8?B?eHYxZ2JiNWZyNmpPMnpOVGUvdVhWRE1Yb1kvd3RlYkpMQWluL0RMN3UyZEs4?=
 =?utf-8?B?L3BwMWRNQ3NMVVFJcnExY1hlT3hmQXpYdlA4YkIzamtWK2F3REZFbXNKV1ZY?=
 =?utf-8?B?K1dUR1drNTBUaFpCd2VXWERWMzBBWHFZK0xmbWh6cmMvdFVYOUpFR3ZQT0pa?=
 =?utf-8?B?aVl4a0lHYUZhNVVMd3BaYlo3S01rNGJScnpXL1BpcFUwZ05TZGtDd2RKNVhQ?=
 =?utf-8?B?bHV3dHhTSHNnZHRFTVZmZUJIUUtxUWZLdzF2VDlZSGdwUWl5RTRFcjNVYU9T?=
 =?utf-8?B?ZnRjczdnbTREUEo0RUZMSnZacTVhTExuaTVvaVMxNHZmQ05LdW0yWUhpeVd6?=
 =?utf-8?B?N0dsWnNia1lRbGdOWnJPZUdXWW9wazhaR2RMcUxjaG1HaW8zYWxwcDlIQmRR?=
 =?utf-8?B?ai9adjA2bkExZC9DdXVVTXJMaWpENDJqN2JqcnFycjY1ZFgydUpWSEUzQTcx?=
 =?utf-8?B?c1RzbVlRUC9RYStYTEl4bkZBSzVaUlBDME1Ec1RXcUhuR1lEdDdpbU1FME5t?=
 =?utf-8?B?a1pQalhoTVNGK2FKYUVsbEJ6UlAwU0NNVU43QWY0bTNUMm1LZlFITTBXM3Uw?=
 =?utf-8?B?TVg3SS9uckxaZ1dvT1J3VldMKzdIMU9yZEx3aitVVElnUXh4TUxMaC9odGJL?=
 =?utf-8?B?aFpMWGxSYitmM3Y3VGlaV2VuY2pFMmVSbkdqZ1hQbi9BN2pqYU5zTmFuSU1n?=
 =?utf-8?B?NUFMa3ZqV0tXTGp5ZUtwdlgyTy9rMWJyYUlXMHMwVm1HdU84blJ5YTNzemVD?=
 =?utf-8?B?aTJINHd3SzFXeWhFVnZxSDlKVG1tUzZJY2hiNDNRdkxSZ1ovTXN2dmt4NVBS?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2edce5-4971-42c8-efa7-08dd9a198d3e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 16:47:49.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0AMjpz3SCZbXzj7axwPw2WG3PvnvSXrN8i8zJu+8hoNnGW8QMj5IQNGH3ULpvVnW4M0Rs+kpF3f7OGM7zGnph+J/q9lB/YjE+SxyW2LXj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10167

Hi Andrew,

On 5/22/25 6:59 PM, Andrew Lunn wrote:
>> Would the suggested change in the previous answer be acceptable to you?
>>
>> @Kever, is there any way to know what the register values for
>> rx_delay/tx_delay actually mean in terms of picoseconds delay added by the
>> MAC maybe?
> 
> The problem is, what exactly do these values mean? Is it documented
> somewhere?
> 

Those aren't documented in Rockchip's TRM (Technical Reference Manual) 
as far as I could tell, hence why I asked for Kever's input on that. We 
could empirically find direct correlation to a specific value but I 
cannot do this for every version of the IP we have in all Rockchip SoCs 
as I only have access to a handful :)

>>>>> Since this has a switch on the other end, its a bit more complicated
>>>>> with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
>>>>> to the PHY, and the PHY then does the delays. However, here you don't
>>>>> have a PHY. So you have the MAC add the delays. This looks O.K. I
>>>>
>>>> The switch actually supports adding delays on the port used for DSA conduit.
>>>
>>> That actually looks to be the simplest and correct solution. Set the
>>> MAC to 'rgmii-id', rx_delay and tx_delay to 0, even if they are
>>> ignored. And in the switch, also 'rgmii-id' and let it insert the 2ns
>>> delay. You can use rx-internal-delay-ps and tx-internal-delay-ps if
>>> you want, but it seems to default to sensible values.
>>>
>>
>> I don't have control on how much is inserted by the PHY as opposed to the
>> MAC, so I'm wary of using a much less precise (on paper) delay.
> 
> Experience i've had with this is that you don't need to be too
> accurate. Devices generally work with 2ns.
> 

I see, I think I took this 2ns too critically. I thought we really were 
supposed to be close to it but thanks to the tip about the RGMII spec[1] 
we can see that the delay at transmitter needs to be between 1.2 and 2ns 
while at the receiver it needs to be between 1 and 2ns. So "at least 
1.5ns" granularity in the PHY is good enough for us :) (and we verified 
it works of course :) )

[1] https://etherealwake.com/2025/03/ethernet-rgmii/rgmii_2_0.pdf

>> I have no
>> clue if doing this in the PHY is going to put us in the center of the eye or
>> not. Thanks to Rockchip's kernel tool, we are expecting to be in the center
>> of the eye right now.
> 
> What exactly does the tool do? Can you run it when the 'PHY' is adding
> the delay and see how good the eye alignment is?
> 
> arch$ grep -hr "tx_delay =" | sort | uniq -c
>        1 	tx_delay = <0x0>;
>        4 	tx_delay = <0x10>;
>        1 	tx_delay = <0x1a>;
>        1 	tx_delay = <0x20>;
>        3 	tx_delay = <0x21>;
>        2 	tx_delay = <0x22>;
>        5 	tx_delay = <0x24>;
>        2 	tx_delay = <0x26>;
>       15 	tx_delay = <0x28>;
>        2 	tx_delay = <0x2a>;
>       17 	tx_delay = <0x30>;
>        1 	tx_delay = <0x3a>;
>        3 	tx_delay = <0x3c>;
>        3 	tx_delay = <0x42>;
>        5 	tx_delay = <0x43>;
>        2 	tx_delay = <0x44>;
>        1 	tx_delay = <0x45>;
>        1 	tx_delay = <0x46>;
>        6 	tx_delay = <0x4f>;
> 
> So 0x30 is the most popular, and i expect it maps to 2ns. The 0x28
> value is interesting, given that 0x2a is not used much. That makes me
> think there might be a common PHY used with these boards which has a
> small built in delay when it should not.
>   

Note that Rockchip SoCs typically have integrated PHYs as well (which we 
don't use at CHERRY but the option is there). The answer otherwise is 
usually of the kind of "we followed the reference design, it works with 
the DT from the evaluation board, this DT was accepted, we do the same". 
For contributors, I don't think it's feasible to figure out whether the 
PCB lane length matching is done properly or how much is actually 
required except by modifying the delay by hand and find both extremes 
where it stops working and empirically decide the eye is in the middle 
of those (for your board, which may differ from another board of the 
same kind).

>>>> I'm a bit confused by the following sentence:
>>>>
>>>> """
>>>> Normally, the MAC does nothing and passed rgmii-id
>>>> """
>>>>
>>>> is this something that the MAC driver is supposed to do or is the subsystem
>>>> handling that somehow? How do I know how/when to rewrite the phy-mode passed
>>>> to the PHY?
>>>
>>> A small number of MACs have hard coded delays. You cannot turn the
>>> delay off. So the MAC has no choice but to do the delay. 'rgmii' is
>>> simply not possible, so -EINVAL. For 'rgmii-id', if you pass that to
>>> the PHY, it will also add a delay, and 4ns in total does not work. So
>>> when the MAC is adding delays, it needs to mask out the delays it is
>>> adding before calling phy_attach() passing an rgmii mode.
>>>
>>
>> If I understand correctly, if phy-mode is rgmii-id in DT and the MAC is
>> adding the delay, I need to force PHY_INTERFACE_MODE_RGMII phy-mode when
>> attaching the PHY in the MAC device.
> 
> Correct. DT phy-mode describes the PCB. Does the PCB add the 2ns
> delay.
> 
> Once you get to the MAC/PHY pair, what the MAC passes to the PHY is
> about what remaining delays need adding. It could be nothing, because
> the PCB adds the delay. It could be all of it, because neither the PCB
> nor the MAC add the delays. It can also be nothing because the MAC has
> already added the delays.
> 

Clear thanks. I'm not sure whether Linux already has a way for the MAC 
to provide which delay the PHY is supposed to do? I (now) know we can 
override the phy_mode via one of phy_attach*/phy_connect* function which 
take a phy_interface_t as argument. I see a phy_get_internal_delay but 
not the setter part of it. Anyway, don't want to drag this too much as I 
don't need this anymore since the delay will be added by the PHY.

> For linux, we have the policy that the PHY adds the delay, in an
> attempt to try to make all systems the same. And most boards follow
> this. And then we have a few systems that totally mess up delays, have
> odd configuration knobs nobody knows what the do exactly, and put the
> delays in the MAC.
> 
>> Does this also mean you cannot have mixed addition of delay? E.g. having 1ns
>> from MAC and 1ns from PHY? It has to be only on one of the IC?
> 
> It is not recommended, because of the policy that the PHY does the
> delay... You can, if you make use of the rx-internal-delay-ps
> properties, assuming both the MAC and PHY support them.
> 

Thanks to your and Jakob (in private)'s explanations, I now understand 
that this is very likely not required as I would assume HW engineers for 
the IC would essentially allow to add some delay between 1.2ns and 2ns 
to satisfy the RGMII v2.0 spec but there's no need to be precise or have 
granularity. So this scenario is theoretical and could very likely be 
due to accumulated HW mistakes (either in ICs or routing)?

>> In the comment at the bottom of the dt binding there's this following
>> sentence:
>>
>> # When the PCB does not implement the delays, the MAC or PHY must.  As
>> # such, this is software configuration, and so not described in Device
>> # Tree.
>>
>> Why do we have two possible locations for rx-internal-delay-ps: PHY and MAC?
> 
> Sometimes both can add variable delays. Sometimes it is fixed 2ns.
> 
> I would actually prefer that these properties were not used, because

I assume we would therefore need some kind of negotiation between the 
PHY and the MAC at the subsystem level to figure out if the PHY can do 
the requested delay or if it should be handled by the MAC instead?

> they indicate somebody messed up. If you read the RGMII standard, it
> says a 2ns delay is required between the clock and the data. It is as
> simple as that. If you need to fine tune it, it means one of:
> 
> The PCB is badly designed, care was not taken to ensure the PCB tracks
> are the same length.
> 
> The MAC is badly designed, it does not add 0ns/2ns, but some other
> delay.
> 
> The PHY is badly designed, it does not add 0ns/2ns, but some other
> delay.
> 

Just need to be in the 1-2ns but otherwise I fully agree, thanks for the 
hint of the RGMII spec that helped!

Thanks for taking the time to write this all down and your patience, 
that was all very helpful!

Cheers,
Quentin
