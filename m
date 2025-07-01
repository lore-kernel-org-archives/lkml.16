Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535F27BF84;
	Tue,  1 Jul 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378222; cv=fail; b=hQz6Igx2JwbF3jQR0/y+iwMMwywIMY1xw/JrNGwH/UXak7rFHohp2GVw26gKhOjwyYqq9AtaAc2hDqC/FNVeD/6Hw3Ex526IhGKGH31aJoAK4d5P4PYYmciDhpPWIClM1QSk29h9qz32NAkKnnZv3U56kM5aZ+udzityz+ee6KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378222; c=relaxed/simple;
	bh=Wv8vnYLJBxVn24AwCoVefCjiryRuOtWJgUcdVZ+M+t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W2r+Cd3mmePkA76OxknX03jT4NBdz/VbXZtuH8K2clQBg5k/HpPbYKAUpeJgvrGe7WKSQgT/BiTWWhEHbzyIFhmx8UVkxm1uS5qkrhIWJqQumGezzJ654qepH7XL5Mp6yuQIzRPSd9PzEnWsGCeV3fci3rmme9p+xAKpqeEmEis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DnqjkjwU; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DnqjkjwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diT5Y/AUt/VZZsise4IuGKMsVwJ9VTv26FqbHGa90FwtKSuRlIHGKEa/2lSotpAGGz+k3N1aa8DDnDxEF3lJdn2zxLH24P35XfcSi0GQ3tDdUAlCGZDgkO5zeVtdW7ZhE4JmP3H8fy3yuv2GZ4XQMfMKwe2FA2F/TsSIdUSEzIGXRfV8qyd95+4fOztLO1FeQLASJB/6S8b+dKvgSXkouFYpFNxABvf4Ha74ZCqZpEwevGSH22sS57p+mgvovA8HJxRURcmb0Jnt7RbJ/6qdBLsyZDZ5BoVWGnfwBdzg3LL+1nKqiEirl0qfeqJKpUGnt3D6GLPfriS7POsUu0ATZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJpecS12lbKzjRGPrxoaE9MzBreHsMWfBDP3AuxTnA8=;
 b=DpIgtEQPzAa6QHGNQa26O6iaxiac5RBsOzwB0vHaVrtI5wl89JoMcp2L88NwDk1G7AYquDna/axGjCJX1SyMHFoQeu2ErqDaqmdqh/OYExrm44wZLnc1l7GP9tebVjdtd9gL1h8Es6qkr4TetIyl8kVGn1KrllVC76AElH5SwwyZrtjmFVBTSRPV3Hz79juJ6E6I/iJakylzYJjhqtdOs4pks/sub9O0YerLp4DT3hYD58BrOz1j4Kd8V97pueV6OVcRCr/LTZG7r2TpWzgBX/imCbNTijKNeVodYkBgKLlUPYdiZKDtN2TDGTv5eSSmCzv1zKQhDP82SHXHvzYdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJpecS12lbKzjRGPrxoaE9MzBreHsMWfBDP3AuxTnA8=;
 b=DnqjkjwUtDXe1jlsCRf0FC6MS+z68gG8B7CEN1aR9K95D/qLDHvP6ctZjb8yrs8cU9Q3wsaRW+DE28xq28s8b/PcDM654ZaPI5k/MkjF/TYiuu0N/Ag9pTT9IPdaAy6v/X3mXOjtwS6CyIni7JaRaKGWzQoaNazwcgbL314IdvlUrp58pKhrVV43jYBpkZg9W3DyHVEgwD3AZAvYYQOdkrVQZFzlPRG8opB3O6ioyJD3vqVpBbUrZeydSeOi8ECBRMe/BINkuHuGcsGRo1+q+/Na/jZjfJKYUi5aGhl6xmm5HovDoC/Z7zUPyTPShm1t6Zn/6dSRtQlryhXwH7kvBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10597.eurprd04.prod.outlook.com (2603:10a6:10:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 13:56:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:56:54 +0000
Date: Tue, 1 Jul 2025 23:07:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dhruva Gole <d-gole@ti.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <20250701150735.GD20538@nxa18884-linux>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250624-agile-moth-of-blizzard-c7babf@sudeepholla>
 <20250624145807.GA14878@nxa18884-linux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624145807.GA14878@nxa18884-linux>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d03becd-117d-438f-1175-08ddb8a72323
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vByFnkm+GaWB25+3c6m/hbgUCgUsmVZOj+95G0bCuwa/BOgQqQLA8z2shfO+?=
 =?us-ascii?Q?r73SRB3k6I9HCw64OzM+W1eWXVBj8iQZpm7FQsPKSuxZwMSY5EzThbvu5ues?=
 =?us-ascii?Q?LfiOJlPZpqhEkGuN8jjprrj6N1LX/NSW1A1yY8ikN6JB3bxhCYLpMlXjt+J+?=
 =?us-ascii?Q?45ow7sA5WWC7QhKMaLm7YP1u6BLlLNRLAuHcaKsyf5LCEUdEmjVCwyH7K3DX?=
 =?us-ascii?Q?9Cm2IOkjNDTwAz50OzrMCjLWm8O5l6yYFmpSRvdj7d0pyf44Lg7No4PbbOu6?=
 =?us-ascii?Q?T/JZev56bj1aYOaQZKwmsrgMal2jV7nY0ZQJqETa2OBBqyVzdp9OwZ0Gym9d?=
 =?us-ascii?Q?Uvqr1B3U+1jjZI77GXyQVjm6f9ctnrRZCTlsgbjbsYB9vdljqqnxlAHnTp9D?=
 =?us-ascii?Q?/Wp1Br/o9ij6zAUHxlBMvYi1GTTErAuJfKI6HfeUQasUNMd9Rggrtn+rXf4g?=
 =?us-ascii?Q?8Xc36mZxbGdyRr/nI97+qX1Y1HV0yk/Ok1fVDmSMXBS+WMEd2CCp2eYyOstA?=
 =?us-ascii?Q?etq8ef99efVEcupU+FHWpjWrUSs1dB98BziyyJC6jizMg7tgSfM/2jtjgzV8?=
 =?us-ascii?Q?X/BxvBE9767EUBhrqomN8EsR/BTU9y5xger3oHVTah6aD5m29j0cGH+6GBbg?=
 =?us-ascii?Q?f0CqiPmMvlJtmyaEe1cwaJlYIX5DTMrxO/FrUFg2CthkLxi06Go0Vedrg1Sv?=
 =?us-ascii?Q?iJfZtO/08l6ksrzvt1hT6wMxjzRviRm+AwrkipGGT6ZLUuCLQ3BjZ0jdjvMR?=
 =?us-ascii?Q?U8q3GY98c6DdJ1k11LS0lWIEY9yIwg8w8Y7uhTiMB9YazWCroIgolnTwexcR?=
 =?us-ascii?Q?KB3dpW9wT+qd7nr3ZpqN31s6Dt0xo7VDu/zrWaEIkdxVpfUcEf7qOjAuV+TF?=
 =?us-ascii?Q?tsIlRdQyNtfPZq6ZpC8EMmpBeqMZe/7YD847MRY3HmXz4A3KotFEEYMrQ6Oh?=
 =?us-ascii?Q?sUIsktHgvR9mdFmoFPqWPne56Q+FpDhIgSm4kBTopD85ibah1Q82stbYReyN?=
 =?us-ascii?Q?dGF1tIXxQQOo/GAoSaZnJlOkvc7c9FEZfXt5r7n3e8ZNerlhRbXtpbFdg3CO?=
 =?us-ascii?Q?IonZ5CKYKsmqLrdkqzVeyBgTPFiLlvYiHtK/fncBanct7C+r7x/iXHFZoXFR?=
 =?us-ascii?Q?gWzkS/z1qRtYNUVOrOqLRNH0KiCVhJ91YHSpmK2xb8ixrfd/CL3KWghpksIN?=
 =?us-ascii?Q?UtF/bSAt2Wm14zLGMwCLypLqungCmmz2Ol4z8JlWGt2WtIZjJxpujHG19Wtt?=
 =?us-ascii?Q?JTkDzbNL/2oQNvHkRN1J0CovV4GSNmooFIsHq3ZCuP9MHBsBq57x/1xL8XGB?=
 =?us-ascii?Q?Bn9zdflGFo+DqCicxLDOBEX69yRSvLb15+/a90Ce9dcBIDxKJ0Op5y1TSc8Q?=
 =?us-ascii?Q?qOSqzacaMySlnBjnnGaxqE6rIXv3hcOo2QIQJ3V4kCnhGUvK9S1A/6FJZXjj?=
 =?us-ascii?Q?QrHJcvybZL63c4nD6dc92Yd1gE2bB0OjuhxrxD+4i/5zAAxH+ufY9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQTXShlLiJktlvIpKh+3RfMq7pS9V2L85D0rm1z/zFYCb+AszxetIKv3kXP1?=
 =?us-ascii?Q?gO2nXDIncMKvNTJMvkB0c0u5dqwUEUpGUNT22sD+V+BK+HOG/x4N4jOgoSiQ?=
 =?us-ascii?Q?TMSZOtUkJKfI7cX5SkRv05erCl/WI3UXG/UxC5TKCqLLRY0K4bUS1EI62zeG?=
 =?us-ascii?Q?0o1lHwH9zpLfMu5w8a9R38E2b9qhqebRnyHts9VSGicSoUWWVsZYFYEqkxb0?=
 =?us-ascii?Q?gBy0R+MOU3Q+LtmGsLlinV4Jlcyi5IIbstpmG4gNHg1/NTK39lEvD43y5Y3b?=
 =?us-ascii?Q?83EMsxcW+PJQzlv9wFqLNN/yb2XDjmlFwOvIpLu6aIZaVzRMAVI/YuLzNE9+?=
 =?us-ascii?Q?6Fyg8pABtV0EIlxQkjqU12QeNr1GXuGpqxfwWH9LrOjP7AFT/rsMyG6WljLU?=
 =?us-ascii?Q?G/oqXeOAvTl0edVqqCirEUYbFQlC4pQbXnFw2gmXgdJH2+qkCNWRYwPzz8gW?=
 =?us-ascii?Q?viEfuixXH86D5jRdsKguoKjr7veVG5vr7BmBebYxGgbprW0C55WC72iF2O1W?=
 =?us-ascii?Q?i3/KiTDeS3y9YYga0tTyK97pGHsMj/bFStfCVspl6/opbARAscTLB/HWOdeu?=
 =?us-ascii?Q?ELzzkKK05YDSjH1EWBCGuz2g0BjeenOkHU3snF7zXytzX2kuI+H+adz0UA8v?=
 =?us-ascii?Q?NuVDEwNcehdFbfkxv2l2Ogi0Yuu+m5R9VAgF60i6iyhKkt7YWJ2zrguR45cU?=
 =?us-ascii?Q?d45vLW1BbOt2ewKIXlrxWM0FScO8yKOfxyy/1cRae6EYWTbpKOZG5MZztOpi?=
 =?us-ascii?Q?oEJ9zwn28Vh+PuQXSaxkpRivADVOAfkwYR4YQKz6biRwW4LSrIjsmspJbUUf?=
 =?us-ascii?Q?o97Wz6VinR/1FsHQRTxDv02bbG68kEFOiTKt1SXtl6UH6t1xw8Yp+p1FUHYz?=
 =?us-ascii?Q?NtRyx5PgOkD0gzndyGNqz0KBi1xwpmPqOC8a3XxBTjIO4fYS38NaEFO3b37+?=
 =?us-ascii?Q?NO58oc1J9qAJR7A2AhmQDZ1SRIZoufPrkS5wV+Enx/VHdrNWea3zEN7JCd6h?=
 =?us-ascii?Q?I9oqtSDPua1wPtNHeDfG9vkFy0z5foLQOb0o/4slgKsSKVsKAUjYxkt+vrKn?=
 =?us-ascii?Q?0MjMeAWeQiOQJ+gIEqB9p5NSNAMe2mxDKG5RyzdwhqCj1KZ2aev62SwdCvz8?=
 =?us-ascii?Q?g0T+cJ2K2FrHWDEV21o/PZcb+PIrlgw5tsJM4T9DE3XtpkVXnblG1v2yppI0?=
 =?us-ascii?Q?SODEEBBevZun0o3eK9PT8WmfwT3/ax62UHPkeD4B8ZcP5uHOHwxwYTeMuwC8?=
 =?us-ascii?Q?Qh2cXMBB46kIRyVZfPqFITeFeEUkwqayH0IkQp5uCi5gtCZlK8dAnqNbQXh3?=
 =?us-ascii?Q?rUQZvnLL+DXSWtBn6UXJWZ7vya+M4/7YLAkqxzAoQ/pXVvtnytEZ18f9nnFH?=
 =?us-ascii?Q?+5oOHjX2VrCaBIdbk4ttY2I4mg2dwGFEQcnD3Zene8e7EgN9QEnZ+4HbEJxT?=
 =?us-ascii?Q?GjXpypUpzp7GWd+SSFjiufvXF97e05VPdhr6vwgjIlSp+ki9yf8yez4SaGdu?=
 =?us-ascii?Q?HF0c8m89xfumaHqrnIA8hrcko+4MZdQ6Dro39hWcT0WHs0y7QTH1jluwfl2X?=
 =?us-ascii?Q?zVyUiwUhbelIjBpKLuqyF4EYWrghg7tPk7yceXum?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d03becd-117d-438f-1175-08ddb8a72323
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:56:54.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jz+vxnhM4NSmacn0kqgZZTs2VMS+XNlVazn1UPJVsWIRq5Lf73ZOHepz2/vuN5QaRUGIguJt6e6bWjaZi8DwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10597

Hi Sudeep,

On Tue, Jun 24, 2025 at 10:58:07PM +0800, Peng Fan wrote:
>On Tue, Jun 24, 2025 at 11:21:52AM +0100, Sudeep Holla wrote:
>>On Tue, Jun 24, 2025 at 01:23:10AM +0000, Peng Fan wrote:
>>> > 
>>> > Just to summarise my understanding here at very high level, the issue
>>> > exists as the second notification by an agent to the Linux to suspend
>>> > the system wakes up the system from suspend state. Since the
>>> > interrupts are enabled before the thaw_processes() (which eventually
>>> > continues the execution of scmi_suspend_work_func() to set the state
>>> > to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
>>> > much before and ends up ignoring the request as the state is still not
>>> > set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
>>> > addressing.
>>> 
>>> Thanks for writing this down, It is very correct and clear.
>>> 
>>
>>While I am not against adding bus PM ops as it can be useful elsewhere,
>>just wonder if this usecase is a good use of it. Does setting the state
>>before the pm_suspend() call suffice. I still need to think through the
>>possible race with that solution, but just asking you to check if that
>
>There is race condition if setting the state to SCMI_SYSPOWER_IDLE before
>pm_suspend.
>
>The 2nd suspend notification could runs into pm_suspend again
>before pm_suspend update system_state to SYSTEM_SUSPEND, if my understanding
>is correct.
>
>Per pm_suspend->enter_state,
>"Make sure that no one else is trying to put the system into a sleep state",
>not sure, but I think better not let pm_suspend to handle the race condition.
>
>Since syspower only has one per system(linux), the other approach is to
>use syscore, but need a global variable for state in scmi_power_control.c,
>because syscore_suspend/resume does not have parameter.
>
>we need to set state back to IDLE after linux wakeup and before kernel
>thread scheduling. I only see two interfaces to achieve:
>PM ops or syscore ops.

Not sure you have time to give a look. I plan to post V2 later this
week. In V2, I would still use pm ops.

Thanks,
Peng

>
>Thanks,
>Peng
>
>
>>helps.
>>
>>-- 
>>Regards,
>>Sudeep
