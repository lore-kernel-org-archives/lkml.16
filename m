Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA03170826;
	Tue, 24 Jun 2025 19:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791778; cv=fail; b=LQob0L4O1KuJunTtikQCe6VBJO2D8BDc0SbQWE2DiAEdTEZewJGfh0bn1X3BD2Df9goRwIRGlnZx1L4KIWtgxyWnlwxzjjO/uPSHRbj9hcz9cDX46DtFv7JBQQisjoZxAI5oNbrE1VOBaCiw8XEgm/MgMIwPMq1rFuG3N35e0Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791778; c=relaxed/simple;
	bh=v2BVC4OHlCNR9IWRnDdhAdceJWaif1lX61HwZPCmrxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S1q9yEfNweJYr5m0WD2FzmruGHz81VPM0D1NTitZdupC2P7+TDRKCXa3ocrkPHKoKytJnQIGtNBJAd18qbwNa9qivvJl0hpczaxbZ7ur8y64XFIt+Tci5NpmoKPfKRMvM2uAjmJzM0KYvdAsqS7gMrRrVJsPZt2GojjM3b1JhPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i5VNkJbv; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i5VNkJbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgQlm+XdhLv0x0c4flnr0M/XYoocKHQDyqDzxKwLdhZ3FAnkZ3nZf9W612iJHE4vAMrN0+uRPEXVw1ZXtHCUczQrTt4TC5dA1Tulofld5f/svRMY4jPg7tBndLOSoMc9pD3SLg7DuCvqaXjsV8kN0UYjpmeQtzcDuKgVBPLPPAuMiziNnzIoUqsd8WcYna29vjOflTGiAeuRyvU6K8d+iG6zzVCbkEGmUkRJ84BeDkIf+m2LkK5xCSrMvkfOLzE1/9QLvEN5etS3lgKeJfdIQgR8FbIfxSA9JuD2b5F9Rx3eF0/DKuchq9ZQLwYS13mexpz86tW2fPV+Jz9Tqg2V4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTFVnC+K9kfeK7AfHZ4NnZw0MkTTkSqeE2P1Js8f3c8=;
 b=UMJ2myX5aVbdOEY9THsan/6e7V+BvvcWpcY3D2IHe1PiunDzZD0KrHe3mtJx4XovPZrt1GN1vKnxNlNkR8lJ0++a9ads7hkMIUuQF5CTHjEIiRrOrYXRCXPamRlYYIyK/BEY+1ncEO7fQUGrfEW4i06cCyH8bQPpJTtOzTB1dzKFBpMSYuuYfCZegnK5n4TxPcZMjPRz1KMgKH8o/p3rCDDOdrGyRZ8fi5z2epN1zbxLBv/zVGKfZQKh3ielr2waYQc3gX6L1ESwjHdqz5h/Hp0oTOLxWBnMcb7V8fWo1dLpf9fwAePwFywfAR3B3c4rSbon6gCRIT3gJ/ttq00Fww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTFVnC+K9kfeK7AfHZ4NnZw0MkTTkSqeE2P1Js8f3c8=;
 b=i5VNkJbvdcjUgeKXlYPsxWP5hElQEiXt2vFAuVn2FxJBYNKWHATlHRuKng9RinTttVbk5JaSv1KU8nFxK8la73+Dz040u24UgMOTjGNwzdwJYoIaI2zEs50maAfNOLOem/ljKBQNLd4FLr3pEZfqANrXhwpk0of6ah3UMyLCHi87pp+IN3sz7Y/NzrJIgD6WOGak0UAj8Jh+RsMW8OlrATyhvasJ5drKQRcl4YMji+WQTUDf4THdyVhYBohMGrcmZ6fBiMM70yinzggA3C8nrIZ63KiIqUBa6O80cs5oVTTjuQOW6CZkXvm96VdPbXAIJ7Gb1YUAzuifXXkhKQmfvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 19:02:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:02:50 +0000
Date: Tue, 24 Jun 2025 15:02:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx: add dts for the imx8ulp evk9 board
Message-ID: <aFr2VREWciBYuWGt@lizhi-Precision-Tower-5810>
References: <20250623150146.1398044-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623150146.1398044-1-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: AS4P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: 95619298-2f3d-41d5-63b0-08ddb351b6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Une+bv+Vs8oXwHRiTJ7r4EXnqpu6AdC494CZQGraVbT7ufjqOEpTlU4dcKF?=
 =?us-ascii?Q?4vAIqECKc5Ic55J/6sQy4a10n6hSR6XGYpNTZLY8Os3Tcf6cguWMRltqEcPP?=
 =?us-ascii?Q?xYk8yqIePIEd7hK0DPQ68II4fGGkgy2RfXhyks5xitNKFzKEWLzax9/ZlrxG?=
 =?us-ascii?Q?prEr8L0aYAmRFk4Oy/SguugaBajGf3anfDB2bWgSOCsVCLCHixY7RdKcKSce?=
 =?us-ascii?Q?itrDqJopaVY4cH6ph/5OcEQUqtm6a3x/DH7Smm7ftlrUnM6RFN9OX8v46Tda?=
 =?us-ascii?Q?ZaAoJnfJEslKIQ+zRzPIrnnEZCrcwTgN30ROd5oedzL2+h6yETtbkVczqu6u?=
 =?us-ascii?Q?A3FIbaC1X+3m3rhYUmGdOcyQcTVqECRnmz9jTvNlcI8xn2iUTb5LHpXWPj0p?=
 =?us-ascii?Q?bWhAHuoA+cMWMFq+72U/PEAXd4RBrfcUUHOx2ol02CpTDufvmMOrg5Xq+vjg?=
 =?us-ascii?Q?FxyGSq4KflTHAx29Rf4O2hyQJ4n+tfDYUFtU2gRu1Rdle6kPuTOBq0dDva6O?=
 =?us-ascii?Q?jGSapoQnbz35hOEsI8Z7S49wRobXt3R4BpuMB4flmWPyNp5ZCZ+bslCYLCoq?=
 =?us-ascii?Q?6BdtLzkiIBsVcrRjxCiquxxDBv761rS+IKQvGwK5CjieQe7Ab9jUi/1uiisG?=
 =?us-ascii?Q?UaTE68aoouYZ/SjiD8cITwgLh7FRjxBdK0d2ggRY1MjafIGnxTTh4ze+dKZP?=
 =?us-ascii?Q?P9iI527la7suenpSuyT3nGFU6kh67dU0n04bOo9kfrP3nAgl8bpYFb/PDfTM?=
 =?us-ascii?Q?Img+V4Nv6vh2q0IeQMLxYp9xmg8jdcxOXAInP1WNhh6QcM9RHi83mt3mQT1Z?=
 =?us-ascii?Q?JLuBXmLyMZXQhWIavfwC0c7I2ld79Jz1JrKROb7U3xNW7qJBjCa4NYvmonrc?=
 =?us-ascii?Q?hojnUTWzCh58T8gMtjLhw8v+98AZbydRpg9witdyAmQlG0Ugu2u7uBdBTlcO?=
 =?us-ascii?Q?4s6NwH+MauL9KKru6IQVQreWYtl7P+XXEXad44YCGJTVrpDTFdcU5NXdcyVM?=
 =?us-ascii?Q?am1Y+wlzaZ0VUsF4V9f42fAKQmiVq3x2nNo/Oedf4yICIJRf5ifLBlTnlY93?=
 =?us-ascii?Q?i6zTHfNFAUhvu9odbVcIs7avJBZwhj9zsO+iz4ZoU+ua01aLFgUO3J5cyyXx?=
 =?us-ascii?Q?JwsiFKo3OK0BxvBofNJtEq/cLnFOUga8LEJeo5vBtWGrfaUkyamNN/8w1ISc?=
 =?us-ascii?Q?8hx6iEQhb72jaDe4VtzsyM/LP+rVX84xxny+2Gd3rIKoM2SQMIJBuaO8XNAt?=
 =?us-ascii?Q?8DrEXAKvgZI2kNPibmdXtXgjLqOwQurLCq/Gh+knIv1g/SkH3KbXKqXfjz8O?=
 =?us-ascii?Q?UrOf4uvZepIaH8wJQ1xWSj60uv8qTvvDSk1oPZJ7Z6RK97BGI38KwnWIUBSC?=
 =?us-ascii?Q?0q9M5JNpJn8d/KpvYUqGbDfHdZt3oOzBsdxKyQf+tXglLlbk6HmmnIu4RoG0?=
 =?us-ascii?Q?QmjTEr1JBXbtuDGb4MGKh5sIETaBQFCwBo1xAxrKqmlSwzWPp6g7Qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xu7pXyFAJFaqLtU4we9ShQpIv6ExKrKGfJBjUghziGeMU+M2omDRqARNWrLZ?=
 =?us-ascii?Q?q0QzjsfXjZ8NPmXwkE5rt6SX0kQEjV1Cxc5Wq8t7krye5Nc/zKSprbm9Kw+I?=
 =?us-ascii?Q?VCJ4oz1xCObdEqQxNw6ghzGyYf/pL/fakxuk4igTtVCON64QGNV0sshSqLgF?=
 =?us-ascii?Q?HpgDL/vAz4sb2Kl4Pg5l6X0LGhalPVCABRCcC0+y0hp8sEg8YPfcMGJbQLPq?=
 =?us-ascii?Q?2p9piVXJM7XJxlUxKSjF8WyelUx2/oK86JdeyGztdr4/j/u1c+lgsU6s1jAm?=
 =?us-ascii?Q?CobferApWcGEhsWGKsz49frDN2qEN2mHL7CTTRIf01rBxj4SCZ6wEA9leDjS?=
 =?us-ascii?Q?r5+fGUztDVmRAGqzAKsfkLRMQxKltenmqzytW+4GBwFUeQf80MU8baICVMth?=
 =?us-ascii?Q?Xj629PIe0IaDZN70esAVpsYWoB7JCSX82E80MMnQSvzgIZiiW5Hx4l3QTkYQ?=
 =?us-ascii?Q?GeU0SkaAYiA+8n9L7b/5mwDVEx3JJCyEEPtI1Xjwayw2sg+6AU7O/8F+882h?=
 =?us-ascii?Q?jh4mSM6iQy9SeZcKpAiXk3brMMON0ss803dcIlX3CK4XAPFiNxj4SF+nVRVf?=
 =?us-ascii?Q?5lCqSwLBOkD4AfR2wIxTTIxm9stMKV5wXZ8VdhngrfuVIAAyvhKZV5bNCPA9?=
 =?us-ascii?Q?42JjDUzqJZa7a+QQ48jXJcvgjKTXulZltbuQf4I2tk0ZAZHsB9UihbZktCH4?=
 =?us-ascii?Q?nWDGDBc9WrnG4nqSMDYcSqkM3A6wtq0OLMoRXBOo4HO7uBh1Lr9S9t9tg7WY?=
 =?us-ascii?Q?8feKzgVqPukHnZHswvLnxHIrmKUx7cx5ljKw6lReNwRt+GRdS5LqKnSfhULT?=
 =?us-ascii?Q?u5vxmTRzfMIGGo+W2utexdpiijhvqmbPLr1VVCcsMP89Rk+dqMpSt5WqC6TW?=
 =?us-ascii?Q?/P+lZrsTOrPm2M2Wwc419RZz1zPc5Tcw1YcOhTdNH2vUcVQsillhxH7+MRlA?=
 =?us-ascii?Q?ygturxIMseyzHrjgt2pC0v5OWERELaRpdr0T332vYcPOh4hi+owclCOQ1uym?=
 =?us-ascii?Q?qMAZk6SvjnReleMSj08e+Vhdj2O2sVpArHsoOp0WhI/3QUvuqCO8uqBgwsWf?=
 =?us-ascii?Q?E2fCV96QA0hjpM9AUy0pa8eOVxhnMal7RQ1/IpQj5KXxHIlcbINM8Mr+K08L?=
 =?us-ascii?Q?uflKOV2kTioqwvToQDLTNlGtaSOybr2oEJX+YCXnryNqHnSUyu7OkTbil0/D?=
 =?us-ascii?Q?OTgrPY2CtXGi2C47vCSaDFxJuhBo8kUmXAADM8LjaE28l2oNZ4bPFiuhgj3f?=
 =?us-ascii?Q?+QFtZTPCivhI0pujiy/TCMb5J3AJEnvcCJ1pvH4X99zPgI4Zu5GubV1rvuQD?=
 =?us-ascii?Q?MVJx+bm/ZGIp9Me7OjHAA73PAHMfXTXhcy/paWEOObWEGZrHi2qsssAmUTgp?=
 =?us-ascii?Q?QB6cyR6fpe0ClASv/cy7CQyBLqqCDXLUxLJZ2Xlx7jKiiBGEgFhEZ/gzZdBr?=
 =?us-ascii?Q?amFp8VXT8R/qpzzIHE3BERFWnnV1ErZqY5TIZt971q6VVteJEz+zv9ptkf+n?=
 =?us-ascii?Q?RWy7Q8dthJJWPUtxHgTnlh50ZleRrEyWIanCxAhJ3XWW+/tfXaLo4muyeD3T?=
 =?us-ascii?Q?QxNg7/0ilHrn5KLDz2JGgp7vG5Igo7L8SeShEOSR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95619298-2f3d-41d5-63b0-08ddb351b6ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:02:50.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6Z46Bs1UxwKI/1qjBcRA5ioNEt3rzeyoOCuddrg+4HnkGWCmihI/hVn2G4PXtBLV0z8XwmmoZQIYrHM2pLWOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

On Mon, Jun 23, 2025 at 11:01:46AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add DTS for the i.MX8ULP EVK9 board.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 68 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4da7501ece17..4b288b324d38 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> new file mode 100644
> index 000000000000..c610ec9aa30e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8ulp-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX8ULP EVK9";

It is new board, need compatible string for it. please update binding doc
also.

> +};
> +
> +&btcpu {
> +	sound-dai = <&sai6>;
> +};
> +
> +&iomuxc1 {
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
> +			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
> +			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
> +			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
> +		>;
> +	};
> +};
> +
> +&pinctrl_enet {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
> +		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
> +		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
> +		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
> +		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
> +		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
> +		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
> +		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
> +		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
> +		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
> +		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
> +	>;
> +};
> +
> +&pinctrl_usb1 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTE16__USB0_ID       0x10003
> +		MX8ULP_PAD_PTE18__USB0_OC       0x10003

can you align these number to the same column?

Frank

> +	>;
> +};
> +
> +&pinctrl_usb2 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTD23__USB1_ID       0x10003
> +		MX8ULP_PAD_PTE20__USB1_OC       0x10003
> +	>;
> +};
> +
> +&sai6 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai6>;
> +	pinctrl-1 = <&pinctrl_sai6>;
> +	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
> +	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,dataline = <1 0x01 0x04>;
> +	status = "okay";
> +};
> --
> 2.34.1
>
