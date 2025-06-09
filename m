Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFE80B;
	Mon,  9 Jun 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482342; cv=fail; b=LuH5nySX+WEq9/trQmjdKnrvZnMyZgjJRwr4oXfuOWSukzqm5zKVfvOrE+cQY7sQlxEzgWaSu5f9/VD3mIlqitWEadluTaflbeJcTMmN4pFEca8jQS7R/LEgwOF9QcjIfObYhsLmtw5/zAas5SlgS5xKBuAWXyOnoYmKkdT8q1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482342; c=relaxed/simple;
	bh=XAU3RxHZlzJFNsSKy4ysBYtFQiiZdO30NfOUjd6yB84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q7l1SJx53dY/7lFHRMPcoN3jz+DC2KjjJ6bq+Po+xJJMSEDBYSW+qhpMdEfQTVqJuQpgDGPCNkIbcmYh9Sc9uEJck4Kf48WgFeJX7ZlapFcGV275RkuEiVIYILQx0azS7Te6mTLVg21wE4BRJVq2XaeZ0lSJbDGsrcTQCmKKBW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V4Y3fKS7; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V4Y3fKS7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU5C2MHAcLEAkm5DPzJd8K2ZJc3ShiPFQ30/b8NprUjBFlMpoVPrhJrPbjJ2MDm3nlKIEfsEsfhmS/hiWSR+Zx+4tYD6DY5b/Hpv3ev9SGluwCX+6kyH14zewSAOoNDigbIMLOLyjl9KJsWXyADTwk3blCn1DxC02rIskaCFr6ZxEio4snzhNomSSauQ2yTBAJx4fCMKkgBfPOwY0Mg0fgTxN2PtKbk4tEUpL7Xtu3t7iTujNXO9YzfcAtKGnN1LgQukhKxjhbvOqt2IovAi83dulIC9Bn8Seq3m6Cu5mCMPSM5pwrpWhvzxq2eesmjVtPhNkaVtmlAFGLf3v/D0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OERPho4LBeqD55dyUogkjR5CynVm+XP0NoSdefGDN28=;
 b=cekjWSy6B7l9VhfHb1vL5TLCP5lg8EdYng5FrPnr2SHLTAffg6vKWdXIV8aUbUNeMdTf49giWTZ0nOcjKQDo8DjyBT6JqzCa7Qh4KpF6D7xFyUkg3p0e9VNAtAFfWzwoglmU4kTjLSO2PrMpNEr4r0ANc9sbjk/E00PoTJpyjSmvVwg8W4czRtvxOP1WciYzsf+UxpEfZC/8zaFTziOt9AJmMd7SuQSDIzXWKKwFLPD7dWe4W0/lSHp3r+Xa02jm6jA1cFFtX9aHQTZGf3d19tud8dWYcw8HOlLvCyxea7Vmp57wfKf72RIauR/pSLxR4pgSXjRGi2XOeGAnSCxwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OERPho4LBeqD55dyUogkjR5CynVm+XP0NoSdefGDN28=;
 b=V4Y3fKS7zO67rgsKJAfdv87dwgP3LDmY9uskpDQiYcs1N6dm+2lw7jiEVU0FaNpBgz7E1o4/Gdib7CqjNWrMyuCl/nxkGxx6KARWls2VnxXBiyVdhvR+PzxTgYgBBNCZ++zBySpQ3xYJTIDCBRYNDAiXui0Wtrg/25srIkOYFI5dplWQ+PYvBsbnB5AudxuB3N13v4xkZQt3C30yN+DNOI9+tC9LsGunc7x2epQjRVh32M8nOqlYPgZHfyPkUTf6Vp/52uhoKrVUQ/sEUcCDiFj9LFzmjCEn2GR1/72WFT2g4RPJxkUQMau3a2Hl0SuyhfSdW1rs1sFvpTGUayctaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 9 Jun
 2025 15:18:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:18:56 +0000
Date: Mon, 9 Jun 2025 11:18:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM
 board
Message-ID: <aEb7V2ul73uYtvhP@lizhi-Precision-Tower-5810>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
 <20250609101637.2322809-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609101637.2322809-4-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 0017808c-e2d8-4b5e-06be-08dda768f37c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?TYT8AFawlNlV4Nrz24zcjMhmxULg226tq4mCjlT3YucOvEwt8ak1eoDr8sWi?=
 =?us-ascii?Q?6TxIiIKIYVuTMpagu4p/+tE0Qw8y7lYIBpqIZqQSyEJzSFD1Ybt/6bcPqA2B?=
 =?us-ascii?Q?YOE5BUPBG+bkCm01PUeXF6+651PL27NLoMgpqowlhD229/eJCI603POF8bJd?=
 =?us-ascii?Q?5/ij9bojBkynmOsWiIcb/VYeIYuw59cJ9XadG3ITz2vasZ8dcok1rqHhZkDx?=
 =?us-ascii?Q?llWsYzHEp2xS9/IQoMH+w1WBcij5V+eVw9GeORtS+b6dKr1tUuuKY8Gf2t6c?=
 =?us-ascii?Q?XhsZRnnQ8lo48y2qr9OIDE2xKdTRNmOWHthwvwdso93jc+GC7rJsPl7lYVFB?=
 =?us-ascii?Q?Uu9IqLrjz73318jKy+EF15Be7KyxH5eWJyoYQFejpDNpOkgyyxxafsHwDsvk?=
 =?us-ascii?Q?MZxYLR0elhmbCx/TKJHDCjcbuGaDVXSTb6+59IypWEJ43b0mMaYpA2IEOlpS?=
 =?us-ascii?Q?esxXixnkuhR4quzmbBd8N5xdzagpNyhGBA9Fmz4EjHVea8gRk8qF+wzygJV3?=
 =?us-ascii?Q?0WhUrQh8PMWsnZKDT0mpw47jiPeUMWhmJ96VPJJLwO55Cd75uujy/qY82cQL?=
 =?us-ascii?Q?eVW4rpfI9/vg+gHvdLIfDWXVGNcay0YVORpKyRqx7SshMV1QDPpcHi8Qqpij?=
 =?us-ascii?Q?1c3yYti2rXXtMAfW7olUWzl9y/PIhkq7qyDl5fnG8ctCWMNevnrTPRZL2Vt+?=
 =?us-ascii?Q?FnzDTQ+FVL6mZKsk2hYKKBwnqex9nJYnNOHMAZcKxdntt7fGCjwtxATFkPy8?=
 =?us-ascii?Q?JjmgEq4skjUg3Czuu7n0RH0mYWpcYWSI4fNG0S2tF60WS5yf+jgakWp+PRob?=
 =?us-ascii?Q?Iuho37ZN2Xs+Q0FiVFA87INxgOlKzmax3ZkixPkL59qihDgHNhNsYnbamsKs?=
 =?us-ascii?Q?MhFy9ugxY0+k+BOOypWxoHAqsh0vk9jQCwvdER8/e61XfBByl7JrSN7snjkM?=
 =?us-ascii?Q?JKxdl/nHjgkrTI0DR4qHt7i8y3T4oJw9HN1Dse8HipWi3faZ6V0cY+T1YqCZ?=
 =?us-ascii?Q?bB8W0ulJhKVp3odw3x+ObEHWukHn7hbkwEydvN8OPqhQMRDY/oEbutMHPfHJ?=
 =?us-ascii?Q?tAKPDxw9+IDDS/VVwgGGD6nZ+EljHN+Dp9j1X6JkjuMiF3qVuqM0INKlxcgj?=
 =?us-ascii?Q?F4ZMLLZaGPttX19xpqHJon0BK0iVer8DmH/NSQzjbUVMxRpBEjT2PWAW1rDS?=
 =?us-ascii?Q?naa+OvN48QnwpkHf+cSzeA2Jbfc31GQTw3z2b9R3dueStJhIjJdPkAbVasg1?=
 =?us-ascii?Q?MRLrqoU5soFEtqh/pffLP3uDfHaNkH4wmVBIsJ1h6Xm3YwemYltjnUCiuGr3?=
 =?us-ascii?Q?KR2D1LM1F0Gryt3WX6JxMHonh7OJQYo6E/azGJ/bnazNVLpEA+rGZrEOiChB?=
 =?us-ascii?Q?Pt6S+K2n2zpIvxNhwOV3wrGSt/EXPbR036T3US6Q1eFsqtWNjsgk+ZX47edn?=
 =?us-ascii?Q?dvB35yzl466qchll22HtQJTG3U5otvMMlSLu1/hytMs+Zj7lXK9LrA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3UoZl0oZZNOabHGudjBhYi5246MIYopisB7lcqmOmFZwai8z/4lK6/Ig1SMQ?=
 =?us-ascii?Q?Q5iK9xUspzfpBRQKbHzV+3B4fbwtTv+tooOqmxfw3KnFfXc127CKj84LhGul?=
 =?us-ascii?Q?6TSPW+aSyyY56TNBcRvRJdkygQQTQNXvSa5gm8UQiI2XUe6ggfZi8ddAO9HI?=
 =?us-ascii?Q?V/MMlhN4Bts+DYJNfuXY5S+fZTO71zsKp0zRhBYE+IU3z8Wnm2rdd8isSrIH?=
 =?us-ascii?Q?Op0I3/9z4bsp+XMgCsJFpwCC4ULwsKH5P6vL2EsJPokyfJxvlvYZkhLAkWEB?=
 =?us-ascii?Q?W/e0CQvC1bhob+CRF9lAitx+M+NCZt0dy9TFKp4YPnwbbGmIZTAHwbQKb9ws?=
 =?us-ascii?Q?AObl62HOjLHctrTHu8bHIUd8JRC8K9YjJ+aTORomANv1Uw36kQ2YYTUXVg+0?=
 =?us-ascii?Q?8Jo7VpwbSw0iIkCd1BIpU4Y9Yz9v8MUJ50z+XmOCjz94AI3zesY0Z8nfe63H?=
 =?us-ascii?Q?yf9P0zrkU4xPedMptyT0q/InCgRpuHUt1noI/RJwxVFK9e0iB20FYGz/IVAm?=
 =?us-ascii?Q?wlIaRd8HHaCAhNTH29+sD8N1Cjo8bAMGZ60HV2CwxtzN5DTX6Ocvm8OuKQFl?=
 =?us-ascii?Q?YZRr8YxofPbuLK7SS+b2QvJGurgBH/FCooUv8NiTS7OhhxEdYOjDEodnjI2j?=
 =?us-ascii?Q?hSU74hyr3eLt68LOveeATlwYU8LIZ1ClusOY3LVoiQceCsQ1s4D2VM1kLyR5?=
 =?us-ascii?Q?GKeMD6AQE11ZFeMzUeY+M8jEbd3VJ6XrKuYirU3YEsCZAfJbNofMabmQRYhy?=
 =?us-ascii?Q?14wateAbmq8rDgAABZjni+v9JMcUNH4XThc+bPf1a4wCjgpKpySL5698Q/UT?=
 =?us-ascii?Q?Z1a87c+WHdt1V6tHvKeGvNeMVqNvq/tEueNUyonpsagWEtxBR5rWXDhBv2jI?=
 =?us-ascii?Q?J5ga1Dnp8jWnvhZWQuNrU8X738Mrmratf8kPgVg61TNb0tZS3rcoqEhb7hVJ?=
 =?us-ascii?Q?gl64jQEYSaGINDV5Zt5tpqWyz4VeVX5o2rmdbph0XzR73JfAK83lKegI3Pzo?=
 =?us-ascii?Q?XitVZLNUZzAoEx49yeuTEh4pwi/YUu+v9R3MM7DTYwmhorKj92CLRZDEcMRo?=
 =?us-ascii?Q?1tH3M728bCR4cGiNaK1ux3aUHtNQuKQJW2yLainQoqzC58+RKjuW9/5jwojd?=
 =?us-ascii?Q?CZZICEKcb4pl6LFS3O3DeEiiZr6VjcjXwb890DMRrCjCbyHi8f1vwTDrxb4O?=
 =?us-ascii?Q?CmnUedw+GEHQ9TlVrRlVphBoJbyJ71gLkkhJjfMjZcwRjYldUmqwq8M46dyv?=
 =?us-ascii?Q?tbRnIt3+nm6DQt9bDPNSeCTsccz3jkcjd7K9rqlgOo7aEBtK7FY9LQfXYCid?=
 =?us-ascii?Q?HLh75rv2nEdfAkk0/7CSaOxOcOusw1WOyjafmu8DOqZHpBX9DMvsijLIU0ic?=
 =?us-ascii?Q?HxUdbMnRTFnIlLZ7+Z2jY4JZB2IXxj1zHLSyTrc5G2fiX4+by/uRJvnAgGG9?=
 =?us-ascii?Q?G3z3/4AvzuFoDa/qluSrKUxL8FtLYAv4Z7y3DsoFaWDHgHxFuUmJgueFx6Ro?=
 =?us-ascii?Q?rFZDoQQqevNgmijkl8jkFq7GoSw/YnJgROXEGwTg1a9TrRbM6IfTJ2t/+DUo?=
 =?us-ascii?Q?AQhigOkWwvdz9QGaS7p1zS54V8xyaMx/u4n0xaB2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0017808c-e2d8-4b5e-06be-08dda768f37c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:18:56.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtMhscFzor+fSVx5DVHbNvjnpnAw9Ut/1KN48VohQ0ktMHZ4jmTx8pxiR1kdIHCsoIFgdxydPSkSSUuKEw3D+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673

On Mon, Jun 09, 2025 at 12:15:36PM +0200, Dario Binacchi wrote:
> Support Engicam MicroGEA BMM board with:
>
> - 256 Mbytes NAND Flash
> - 512 Mbytes DRAM DDR2
> - CAN
> - Micro SD card connector
> - USB 2.0 high-speed/full-speed
> - Ethernet MAC
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> ---
>
> Changes in v2:
> - Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
> - Add Reviewed-by tag of Peng Fan
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
>  .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 305 ++++++++++++++++++
>  2 files changed, 306 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 8b3abe817e12..57f185198217 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -356,6 +356,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-dhcom-pdk2.dtb \
>  	imx6ull-dhcom-picoitx.dtb \
>  	imx6ull-dhcor-maveo-box.dtb \
> +	imx6ull-engicam-microgea-bmm.dtb \
>  	imx6ull-jozacp.dtb \
>  	imx6ull-kontron-bl.dtb \
>  	imx6ull-myir-mys-6ulx-eval.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
> new file mode 100644
> index 000000000000..e4a3b92e2563
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + * Copyright (C) 2025 Engicam srl
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull-engicam-microgea.dtsi"
> +
> +/ {
> +	compatible = "engicam,microgea-imx6ull-bmm",
> +		     "engicam,microgea-imx6ull", "fsl,imx6ull";
> +	model = "Engicam MicroGEA i.MX6ULL BMM Board";
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 100>;
> +		num-interpolated-steps = <100>;
> +		default-brightness-level = <85>;
> +		pwms = <&pwm8 0 100000 0>;
> +	};
> +
> +	buzzer {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm4 0 1000000 0>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usb1>;
> +		regulator-name = "usb1_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb2_vbus: regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usb2>;
> +		regulator-name = "usbotg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_ext_pwr: regulator-ext-pwr {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_ext_pwr>;
> +		regulator-name = "ext-pwr";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "imx6ull-microgea-bmm-sgtl5000";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&codec_dai>;
> +		simple-audio-card,frame-master = <&codec_dai>;
> +		simple-audio-card,widgets =
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphone Jack";
> +		simple-audio-card,routing =
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +
> +		cpu_dai: simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +		};
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai = <&codec>;
> +		};
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	codec: sgtl5000@a {

node name should be generic name
s/sgtl5000/audio-codec

> +		compatible = "fsl,sgtl5000";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mclk>;
> +		reg = <0x0a>;

reg should after compatible.

> +		#sound-dai-cells = <0>;
> +		clocks = <&clks IMX6UL_CLK_CKO>;
> +		assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
> +				  <&clks IMX6UL_CLK_CKO2_PODF>,
> +				  <&clks IMX6UL_CLK_CKO2>,
> +				  <&clks IMX6UL_CLK_CKO>;
> +		assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
> +					 <&clks IMX6UL_CLK_CKO2_SEL>,
> +					 <&clks IMX6UL_CLK_CKO2_PODF>,
> +					 <&clks IMX6UL_CLK_CKO2>;
> +		VDDA-supply = <&reg_3v3>;
> +		VDDIO-supply = <&reg_3v3>;
> +		VDDD-supply = <&reg_1v8>;
> +	};
> +};
> +
> +&pwm4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm4>;
> +	status = "okay";
> +};
> +
> +&pwm8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm8>;
> +	status = "okay";
> +};
> +
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	status = "okay";
> +};
> +
> +&tsc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tsc>;
> +	measure-delay-time = <0x9ffff>;
> +	pre-charge-time = <0xfff>;
> +	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb1_vbus>;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb2_vbus>;
> +	status = "okay";
> +};
> +
> +/* MicroSD */
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	vmmc-supply = <&reg_3v3>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +

remove this extra empty line

Frank

> +	pinctrl_can: can-grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
> +			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b0
> +			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
> +		>;
> +	};
> +
> +	pinctrl_mclk: mclkgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x13009
> +		>;
> +	};
> +
> +	pinctrl_pwm4: pwm4grp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
> +		>;
> +	};
> +
> +	pinctrl_pwm8: pwm8grp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x11008
> +		>;
> +	};
> +
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
> +			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> +			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
> +			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
> +		>;
> +	};
> +
> +	pinctrl_tsc: tscgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x000b0
> +			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0x000b0
> +			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0x000b0
> +			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x000b0
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> +			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> +		>;
> +	};
> +};
> +
> +&iomuxc_snvs {
> +
> +	pinctrl_reg_usb1: regusb1grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x17059
> +		>;
> +	};
> +
> +	pinctrl_reg_usb2: regusb2grp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x17059
> +		>;
> +	};
> +
> +	pinctrl_reg_ext_pwr: reg-ext-pwrgrp {
> +		fsl,pins = <
> +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
> +		>;
> +	};
> +};
> --
> 2.43.0
>
