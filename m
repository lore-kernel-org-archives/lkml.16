Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012032.outbound.protection.outlook.com [52.101.71.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAE253F02;
	Mon, 28 Apr 2025 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828387; cv=fail; b=Z+mGstwiQSebhzSdYpYFXv+uXliQPdzwVh8zSIXif8rE7zBLOSM4/YkvJsAaJp+i8x7bxa+2EogRxpiX7gDx0m5O6RhNX9TJXPrBFb+//A6/8LtSvPP3a9cM3GJQ7VAC+w3GsnC3Zh8ZAQlAYvAW2NYq4L2Dd/TEYLUyLNVx3Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828387; c=relaxed/simple;
	bh=SIpOkmMQYLYMTkLdmaYq/57lJ5P6vnl++wdGOV9scZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A//sUUafHUXAZISc6o95LATc/ypigeA/M6KHvdhKeARKRIzF/apToArjIh30uF6k+qh0F5AlLO+1bFnY/cR7ACqYZgsXE9PPILhnfSEwnKTv/aQcdi7e/e1ODVaMrFtVQxy4uoHMtNwcHj+CM+plRIozVmjqkfmafTKuPyVemxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=lFBbj2wx; arc=fail smtp.client-ip=52.101.71.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="lFBbj2wx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFkJR3ldW08+dah4ikmF0Zn4MV5LLP+emVh+JMr7yCUuhVQC8SBBhyplpoxdf7JnN6ePyLbdFIRM8Sp7HuLUAEYbbJ7JkejTm/gPrWnb3Ot6eTndKUMJzZtLu/A/OznvZQUmgLoIJrxFrEOhuOMjfxaMxBphFINqR2Vo0iWfRPLOqF8DXWQf01xkG2zOjPXWIJYw8HLkjGZaGJhKs7LyShoabBlT48DhuBQlHyef7wBNFQBv36F7sqoMm/EuyWBe8oKVPb+MOs+qS8l8X2IH4wt8Nk73Y+TMmJk+4tAEiHgppqZDxFQsLp6cFbYsanHAQDMjtvWVo1an0NL4o+VzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKiK1wB8A5u+4qGQRWNn0Ccgll1DnKh3FgVk1iLjQIU=;
 b=xX7y5TXKq0pFoi154PKZ3+yv+kmk4l2ywDd9OcntwYAO9TZrsnbyh3//be1PxL+iTcN+3+KXxm17vMXLhMIXgZNbmvJqaT1lg8FtQMdNQvFjohFbU/ktPF/ktPBsF665mxQ6aOR6IfaSgD/RdGVqkFalKV8WSPqewDPTxqP9rvW2cKOk7XqD+xLzN3pi0yKG1Gdp5UHEl4ZBzf5TWPElSt3RcJ/MbPIm3spdqnnmo/6JWiceylrWaFx7U6MAqQ5mlS+FnsKmGQN3HvRuq4IwCQJOdZNTsVOzbuG+GWMSvpv42bZZR4InnIce2BT9T6FYEaKZeK0EugOhCIDg9xFZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKiK1wB8A5u+4qGQRWNn0Ccgll1DnKh3FgVk1iLjQIU=;
 b=lFBbj2wx0up1EWBBmuu8TMJVPVMIxm4FiKr6F7yLcYup8hnM/QupClfPqLYKVN3ioAHHf9sIqBBBdL5JmVN6PoM48D9H9A+GnICOksTN6EApV63YjtKpavpi6Z29QszHtXGDDZW2lb4jrpMYbvACtU5boEHPmrJdxZv9VnO5fSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 08:19:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:19:41 +0000
Message-ID: <561d13ec-c487-4695-b50f-af8f2a65c61c@cherry.de>
Date: Mon, 28 Apr 2025 10:19:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250427094211.246-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b599fd-dbc5-4baf-6a38-08dd862d6c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlhrRC9rNWk3LzNpYXkyMkZjWTBCbGZaZ2R3VzVQR3IveHhZeUJ5SURzYmRl?=
 =?utf-8?B?aU80R3JFN09pQmV2ZE1tdDJSOEVXS1VPYnoxTHZGY09KZktwNUFKRXkxT25T?=
 =?utf-8?B?Z0d6QXFUaUp4bkpxc1VDNTVKQzZpQ0o5U1g3RVVwVHI4b0dYZ1RGNEEyQ0pE?=
 =?utf-8?B?d2hiS3RxeFRKUjhpb3E4dXY2elRHSlluSEx2UW0yMEZ3MmhRVHdpM3psQWNv?=
 =?utf-8?B?UU5QeFRNWG10MG9icGw1bmNOSHVYMm5YbTJWaXN4NmpuS0ZDUHVMS2NOUWxt?=
 =?utf-8?B?WmRrOWJNbGNicGh4LzRxaFE5eTNXRWo1R2krZEZlZjRMQkRWeFRBcC9ZUW1j?=
 =?utf-8?B?M2F1WTRjNHNheC8rdzl2bVlFRy9vR3lrYTJJQWs1alBnd2dDSzJmNnl1b25l?=
 =?utf-8?B?OFZoRWRHckVUcm50dDY4OStLQjR1SXhmcFNjTUs5ejV1Rm9TYTJaN1F3bmFs?=
 =?utf-8?B?M3FSUnZtYjVXajdRY2xrOXRxc2lUUjdqU0lOYkNoZlJQVk5QZ0xDclEyckJI?=
 =?utf-8?B?TVlWandjeXJQUHVtbXI5WEI0Z255bXpVRmtna1VIRjZWR29FQ2owOHNKZkd4?=
 =?utf-8?B?cnJtUFJHdFJPcTdLSkppeHpBZFFZdmo3OUhleFdJZ3ArbUVqNXY0NEkzQ0xR?=
 =?utf-8?B?YllDUjR3OG9QS2g2SFJoaHBkY0lhd245SHdIall4RUVIWGhHdTdXOG1kakl5?=
 =?utf-8?B?eVUwMDFNTm5mcjlFY0dMcHg1anQ1RklzZ0ZhZnVOT1pxalFsUDNKcUpEdTha?=
 =?utf-8?B?dWNHS09tMXhOVGdEcmk3S2gzQTJ2cWtCaXQ0WklpT0UyR2xXbGY4NVBOK1py?=
 =?utf-8?B?TXZ1VXRZdEtlZ2lwOVdBanJVbG1uWkd6d1JpOEd4ZUZhZmEyZVVyRGhTQ05P?=
 =?utf-8?B?a1FFUGNGVVFVbWhyWEV5S2o3NHFXZWFIWGNuaXRwTUZ0RWpMR1JMZElIbHBH?=
 =?utf-8?B?d0NOS1JCU0ZoeVdjYk10cWlsWmE2YjdRQmltdWdwN1M2VGVDbDg2cHYvcng5?=
 =?utf-8?B?endyZnAyejAwTDNYMk45VUZRdmZMZFRYVi9mRW1KRVdSTmVJNnhIY0srZURH?=
 =?utf-8?B?YWdycGphcDM2eGpJYVpDTGVwNzZlOVRlNldjQjBNV2xVVVRZTHFqVDd4ZXRE?=
 =?utf-8?B?c0ZSWjBkR1EwWEd6ZndEV3NDQi9pZXN2ci9NVk9ycitHNUpCbjJMaVVUemN6?=
 =?utf-8?B?YjlrS2xpQi96ZHRDTE0xWHkwZFV2WkRad2xNMVQySThrNE5DMGFhOUdZMlNt?=
 =?utf-8?B?NVdqVXEwZFFNS1pPVU9KYkhNRU8xYTFSMGJORVh5cmdoTkd6VUYwdXNia0JM?=
 =?utf-8?B?L0I2OHBPRGtBaGd2NnBJa05tRyswK2ViL0tobExWc2lLRzBNY2c0YWhvQjAx?=
 =?utf-8?B?NEwySjFxSGJnY0xlOGJRTUtFcFJrVW1aVzF5YlZFSk5Ha0VmOU9NcEE5QTJ0?=
 =?utf-8?B?WlNKOVRhWmI1QzRIL3VyWUUxT0dTUnF4UkZ4bkxjTXZ4b3JFUE03dTJXTDJ2?=
 =?utf-8?B?bjVxZURzd25QRlkyamFpZDlxOEhWeThlZnovdzNLS0FLOUZCakNaQTF6clR1?=
 =?utf-8?B?UmJrR2dLT3d2YjBCOU5hOWpLeUFnZllaNnR5Z3NaYU1mNDdHR0xXYUIvRnI5?=
 =?utf-8?B?WlBFUjU0R3RjanArZC9STW54RUFEbHdKMm1uQnJGYnBMc1M2VGFtRXVVQUtK?=
 =?utf-8?B?S0QwK2pGUTBQNkFOdnJaZ0VWZ0V1NWhZV0hZa0s3elN2ek83WFVpa3I3WmdP?=
 =?utf-8?B?OWxKZnl1UkRWVW9oN1FpbWdJbXhXWWRtNVZ6VTFFSkYwUGFXSjZMWEU0RWVW?=
 =?utf-8?B?WlBJWGVuaW51ZTQ4VVdHT1laeVFDRU40TzVOanREWHBPRTlqNlFZL29VOWxV?=
 =?utf-8?B?QmdFS1VMa1FJV0hPK1dLc1B4REt2cHZVRmxVWXE2b01nSitUbmdpUWd3L1Az?=
 =?utf-8?Q?HGS0HJ/fR64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0poWmR1SlRWcWw1S0VpbzErYWxZTHVqMGk2YUpkcXRLZWRXYjU4ekt3YzBZ?=
 =?utf-8?B?eTYwcVo0RXcvMmpQUTVUTUh5THlwWnFGZUFRenJXTzhJR1ZrTGE0RzJyeDkv?=
 =?utf-8?B?YkJ2L1AzbzlUYTJpNHBKK0U3UCt0N0VvSnNLRGw0bmlKY3cxYTg2SXJxMTNX?=
 =?utf-8?B?T0RlcnpVQXhJbUtxWnNNYWhwdm9nZ3FZdmZLZm56eHQ4ejlSSG5GeFVMWkwy?=
 =?utf-8?B?MmlmTkVKSHRGdENKNXczQ29Vb0JYOWpzMDEzY1NRNUdyaFdkT2NXZXQreVlR?=
 =?utf-8?B?YjdaeDAreXphcTVhZURnTTJId0Ivb01DOVVUakRMeDRXdXRUcDdXSVEvZnpK?=
 =?utf-8?B?L1J1UFd4aWhrdXF2QnFVSWFXdFFEK2xnTnllM2NuWWZPbFQzSngzeGhKWkgz?=
 =?utf-8?B?ZkJvU3ZxZ00rRmdMN20rQVdMTkZVN3I2WE9vZXRRWktxVU5Ic0FSRHRobEh2?=
 =?utf-8?B?bkQ5ajRkakc5S0plaTh5akxZbHBQU3l0YUh0cVdkSVE5TFBnRFlsSjVFTVBs?=
 =?utf-8?B?Zy85dFo3LzBTUXJkbHlxNWpmNG9ieUZqZjZyRkh1Sk5uSm81NGRTaHdUUEp6?=
 =?utf-8?B?dXJiRkVyWGNkc0J0a3hQbmNGR09aUHpjcnJncEx4VjZhc21YbDJpUnk2L1Yr?=
 =?utf-8?B?cUM1Y0d5c3MzMjlzWkJ1ZnUzZ2R3UWcrbjBkYmoyTkxRcTFaOHpTYUxNTitE?=
 =?utf-8?B?Q0hTcVZsNDRzdTVUU3VMQlBQbXY5aG0zN1VINUJnQjd0UVluY09PNXpKbUFW?=
 =?utf-8?B?cmtCcGhGYXdWVlovSXl1STB3OHRwUmlKcHR0YXQ0dmVZeHJZK2loT0xjTStj?=
 =?utf-8?B?eEpSd3FDUHl1RzBJd1RmcXJ2bVFPSTh5bjFjZEJZLzVQRS93UXE5Rk92bE05?=
 =?utf-8?B?dklaMHY0K1V1NGtyazRnWVBrMWptaExUT1hOOEcxYnNBTzhXRkw3ekNZSmVN?=
 =?utf-8?B?QTU1cmhGQjAvN0gwclc2WkJ1WUsrcjhUUFg5NDl4UkVjUitBK3hvalNOUW9U?=
 =?utf-8?B?K3dvekhUeFRMdUppejYvYlRGREh4RG9SV0ZkeEk4MkY1QVRSSklNakMxTG9J?=
 =?utf-8?B?VEFIKzdhdUdURUlXZGhlTGFNT1owQzllbWZJa2dBcG01OENmTHNKcUtRR0NQ?=
 =?utf-8?B?SC95Z2FVUm9EVlF5UHJ0K1c2aWUxV1BUOUFkOWZyOTYxOVFIMUsyaU9IdWpt?=
 =?utf-8?B?dFRHdGt2OUhlYU44WDNNNGhTZDNZQ0czYU9DWmlBbkUxWXZRVWU0VlhqUjRC?=
 =?utf-8?B?cjJtaDlDMmZBTGpXT2FBalByL1AwRjk3MUVOeTMxcXVZajFSTndCMVI5Z1NB?=
 =?utf-8?B?aUJ6cGJXTkdGMjJheXhqTGg5dXhhVVRaWUk1dEM3SUtyWTdWVFAvdFJUWWts?=
 =?utf-8?B?bm9ZYTJxTmg5aXFheXJRNVN0Ymo5Q2plcTB5TEJ0TXNndmNGZUxQSEJEbW5I?=
 =?utf-8?B?L2p3QWlyL0NQVVpUYWFZN2dKd1p4TFQ5Um5RWGtmNTJFUHVORWVnN1Q3Vmtp?=
 =?utf-8?B?enpwVzJDQlFUcDJPRExJUTkxYXJzQndiazc3RXMxU21QTDNSM2pONndydzg5?=
 =?utf-8?B?T20yYVBnbWc3V2RacjVyTllaMXZFbW5IcjZwRFRyVHZnbWZaWmxwU3JWbUl4?=
 =?utf-8?B?TmRTZ25INzlibmlKWEthSWlQTUdUWHhaZjhRdUJsbSsrazh5bkt5QXdQc0dZ?=
 =?utf-8?B?SEpnOUdXdnNwZUlhb3ovWXE2ZzVkdHBJREpreDFTNE1wOXpGN0FqakV4YU1X?=
 =?utf-8?B?Q0lxQmNkR2FnaUFRWDdtdEdGUVBkaUMvcmJueXl0dmpDMllsQ0FUVG9Ta3dV?=
 =?utf-8?B?SmpHdGIwU3pITUltWmJ6VWp1cU9tSGw5bGxPM3ptamphQncvRGNISzRVbXVa?=
 =?utf-8?B?VHJ3UmRSVU5XSXZRdlZMRGM3dE4wSWNabjVMbkZXVFRqMXhuZ3d1dkcxdnVt?=
 =?utf-8?B?a1FKelZEN1VJSG1KZk5NWWFQNGdYUTZTMEtLZWFWSlhaSnJRU3ZpZ3pSbGc4?=
 =?utf-8?B?YkNpYmVvQTlTOGd2dVZMak9zeDJzdHRKUEFsSnkxYWRIdzJRNzVNcytsZkF5?=
 =?utf-8?B?KzYzNEtKd3d2NjNVUVQ2VmhEWittdjcvampBUWpJSjY4V2o2V1dmMUpmOTBu?=
 =?utf-8?B?UWxGZ1U0N2VnSmtXajhXTGd3aDVSUnVxS1UzYmU1WnFvcm80Z0pOOW9PbTgz?=
 =?utf-8?Q?T+auatPrlxGLmKYB1uMmp/I=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b599fd-dbc5-4baf-6a38-08dd862d6c76
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 08:19:41.0109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enKys7VZaPQB3axeunAbBG4kiabgBWI89EV+ZEXiZSHMhrHwpwXIk+2m/iUvz4bEWzd91ccYQcJ2lgWVj97DHbgXuQSqZ0iRFpINAlPABxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267

Hi Chaoyi,

On 4/27/25 11:42 AM, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399
> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 

Are there publicly available schematics by any chance?

> Tested with HDMI/GPU/USB2.0/USB3.0/Ethernet/TF card/emmc.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../boot/dts/rockchip/rk3399-evb-ind.dts      | 222 ++++++++++++++++++
>   2 files changed, 223 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 3e8771ef69ba..8a3adb7482ca 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-eaidk-610.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb-ind.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-ficus.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-bob.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> new file mode 100644
> index 000000000000..a995d4ff202d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + */
> +
> +/dts-v1/;
> +#include "rk3399-base.dtsi"
> +
> +/ {
> +	model = "Rockchip RK3399 EVB IND LPDDR4 Board";
> +	compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
> +
> +	aliases {
> +		ethernet0 = &gmac;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	clkin_gmac: external-gmac-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clkin_gmac";
> +		#clock-cells = <0>;
> +	};
> +
> +	vcc5v0_sys: regulator-vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +	};
> +
> +	vcc_phy: regulator-vcc-phy {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-name = "vcc_phy";
> +	};
> +};
> +
> +&emmc_phy {
> +	status = "okay";
> +};
> +
> +&gmac {
> +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> +	assigned-clock-parents = <&clkin_gmac>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_pins>;
> +	clock_in_out = "input";
> +	phy-supply = <&vcc_phy>;
> +	phy-mode = "rgmii";
> +	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 10000 150000>;
> +	tx_delay = <0x22>;
> +	rx_delay = <0x23>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_gpu>;
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_i2c_xfer>, <&hdmi_cec>;
> +	status = "okay";
> +};
> +
> +&hdmi_in_vopl {
> +	status = "disabled";
> +};
> +

Why disabled?

> +&hdmi_sound {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	i2c-scl-falling-time-ns = <4>;
> +	i2c-scl-rising-time-ns = <168>;
> +	status = "okay";
> +
> +	vdd_gpu: tcs4526@10 {
> +		compatible = "tcs,tcs4525";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vsel2_gpio>;
> +		fcs,suspend-voltage-selector = <1>;
> +		vin-supply = <&vcc5v0_sys>;
> +		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		regulator-compatible = "fan53555-reg";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-initial-state = <3>;
> +		regulator-max-microvolt = <1500000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-name = "vdd_gpu";
> +		regulator-ramp-delay = <1000>;
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};

No RK80x PMIC on this board?

> +	};
> +};
> +

Missing io_domains here no? I guess it'll rely on the addition of the 
RK80x PMIC for this to work?

> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	max-frequency = <150000000>;

It's already defaulting to that frequency in rk3399-base.dtsi so no need 
to duplicate the info here.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	status = "okay";
> +};
> +
> +&sdhci {
> +	bus-width = <8>;
> +	keep-power-in-suspend;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&tcphy0 {
> +	status = "okay";
> +};
> +
> +&tcphy1 {
> +	status = "okay";
> +};
> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_host {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	status = "okay";
> +};
> +
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&u2phy1_host {
> +	status = "okay";
> +};
> +
> +&u2phy1_otg {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&usbdrd_dwc3_0 {
> +	status = "okay";
> +};
> +
> +&usbdrd3_0 {
> +	status = "okay";
> +};
> +
> +&usbdrd3_1 {
> +	status = "okay";
> +};
> +
> +&usbdrd_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	pmic {
> +		vsel2_gpio: vsel2-gpio {
> +			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};
> +
> +&vopb {
> +	status = "okay";
> +};
> +
> +&vopb_mmu {
> +	status = "okay";
> +};

Why no vopl?

Cheers,
Quentin
