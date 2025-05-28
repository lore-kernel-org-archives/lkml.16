Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87328C845;
	Wed, 28 May 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447919; cv=fail; b=eHhTbz5RfWKSnw5LLvOcN+0qlA1hvmNucqjgienWt5iUfYIRfqdXE24nXacCm/cwOCoIxu3nDhx77LTW6YiswSxnrTw4tKgr1dCb+wWV4bM8eH/dWrx16L8QT0po6MUnK09WN9lDAH7z4TPXXd/bs3/cyHk8TKlizYEMMibdGtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447919; c=relaxed/simple;
	bh=VZuaJjf27CMtbJssWQuDFYPEQ+ZbKGKphqvUS3AKlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iOXbDeDn/NXjheu7xvUlsqMzkFsSx6xCwVWTsMMrKaeWC2IlqXhQD1/GEwn5qHiMpJnHHDKO9xGAuaOAHQ44jopk69KMr0xqdiP3oM1mlsgrqTXH3q8tC+Jo1pbtrHSaMyeuDBDmwWGaMi9BVwTYVKm/tfdV0bRDnHBVuPoXUug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kpXRD4sX; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kpXRD4sX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5RAg1yv2tduKzsgqonJX68WVKHc3e6doX8U5U5Xll3H+549bnWGzFlQBA/MT9ozIGQtkl9rmuM5xtz9rMrcqY49GV/88Df70P9by47ZUsredr24TgaXK1rIpSp4Q6k50EIk+s5fP9lnJWyoL22krF+aowC35/kA2bz/tNF/F6tP35GTk+ZENOXZZyjwie17Ih/EQnLT49FUSOlp1nXGppbCPK+F1jlLdfQ7IS635/vpx0Ag1RxxbmT1gXMKNJM0vqB4UBo4ZzobvUMBrSCBZSV8GTUJkXaJ3pW94qllZmNPRklMAXOh7hgE0OVkE9zxo1yzLATx93WvlmEFJU2AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1xyJTu+zqQLiwsFSX+/mEbRASyxqDn4AWgtcDbWmZ0=;
 b=V2+x2+80RbqsH6JYtUrbn3x4YGyu9Nbg1CVupVKEshn7NA3SKLuN5+ouxK9EbW1kG8/XVmY0/TUGcwgFn4v/Gt0uJe8S7fqW4THHO7EhKjIOpbDlmHCQ2dqa/ssVArPIhdBOcuP0h20YwK2tIM8hbwEZuHa4BFEWawsYCfjulSGW9wxsfHiO7bIdo3GYVGiOBBtpWmHcakmDO9acvUYsGnuiL2pmiAr35/RQYx//Ww+0xkxtqyA5Wog4L6wevv8b8bRIPnKdQ0TDe9m8oNyCTOnOvYNWmVufxoplEpLkaQULKSqwDk1I2WB1V2IBzyrGwP7L7zJw9TFkH6N/jXVKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1xyJTu+zqQLiwsFSX+/mEbRASyxqDn4AWgtcDbWmZ0=;
 b=kpXRD4sXpTvgEkjUzmGxWkogQnaj6Kyj3armdsMyNcNbTy+3l4gQhNk3iiWqLWhEl2RjdxNuPY17DdIzLe3eCcB5GjCpJ3lKtSIXbfkqTkHqCzaswbHRpwc7HTRiOTBzc65PxUnnY1Tr6uT3hTBPZ6aajmw5K2xqV0/QunS4ROe0XQ7GIEPmDXoEInfQAGHpq+kvkK0ci91dw195Vap30nCussBlKZVrUgUEsAwNwUdZY6bPSYVNQ7qSvt/d/3eIRgKzYThx+l6duuPWYV/HFjoNjTlb30dCeQq2MWg8eXV1hX2Mk2Ahxl0gwWyQNvukKbMF8PoXgC1CmxSGTaenfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 15:58:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:58:34 +0000
Date: Wed, 28 May 2025 11:58:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <aDcypSNblUa1c0tb@lizhi-Precision-Tower-5810>
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
 <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
X-ClientProxiedBy: AM0PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:208:14::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: aa49640b-03b0-453e-5d7c-08dd9e007fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?redDGAQsMGkAWbMiYAK/gFEirpP34Zgp+L8qfCVbEZtDb7fk91LBeRXseMCh?=
 =?us-ascii?Q?vu5rvVow1qDdihhsjClrOCvpKZBKCGqbrrTUBhD0B58IC+48e9r5mFM2LHRQ?=
 =?us-ascii?Q?vvdQnsL7wZgBncBCAo9XzEN90UGTZn9GsLqWO1E/xUNYrmVKNqk97RF3JaRL?=
 =?us-ascii?Q?5ERPRfKMOKG33Nzx54FERXP3ILyoramVJif/k7wgAckDY70B19sS5fKZ1AOe?=
 =?us-ascii?Q?74UFjEeSumuzj93Vk5kg76+xP/ixta12YJpHLmhz0gyrTHggA2Yphfh3Z96x?=
 =?us-ascii?Q?O/1t+hbcWfo9Nt0qNbY1c8VasGIkYVTG/ABvodBQPXyC2zkhW6r3+pAQ0N2F?=
 =?us-ascii?Q?OT8gctSjgmO0sKUdzqNwivz0Ax0LKcY/5Ul7TRjRtZ2vSVhsvb/ma4PLm7c4?=
 =?us-ascii?Q?5d7J98Q+3RCP/1tuF2UwuHChwkR+//oSdhsOreCJ8njTcIJc7l5vYhYhCU1W?=
 =?us-ascii?Q?Hse37WK1OI+cNEZyc1glsDKHGIJ0J740XmdbRXmcIvjHZOZX6JQtZs2kxdqh?=
 =?us-ascii?Q?B4Unvq5iXE5Y5fnUf1nEwpFIsA1qNC1So4EeLSjC7a8VVVKnQw6aQNAPJsAu?=
 =?us-ascii?Q?a/hXAiuz8/uGoviN2ti9TmmIy5tBYqHzQ8/hNC2GCiasTzNV359QR/P4/hs0?=
 =?us-ascii?Q?+DJ3E3wj8ODWfoeOoxcCOn2B9hLPgolnfvk/ibitJ8XGdNuMjr4QRc3SfOQk?=
 =?us-ascii?Q?bODETaE85nz+32fGOtOUsqYtZZ3AGGL/3Riw6Fe/hDq3/Hx2Nr9RSY2XFeFw?=
 =?us-ascii?Q?c3UI77UNWx09q5xaT+p2h2K1KcIYRP3i8UkJDDf6gCOV99pHEu8c0uB7yN9j?=
 =?us-ascii?Q?nAoDiN6zhlf2njEruwMzJlza/QiHsRyr6lh+FYhnEzDFVqC6bRqsxa9OYtDH?=
 =?us-ascii?Q?9bMK2CM8X4u5cBW7JGB7FgXTy8pP26G0i0kZzD4ZGDVps7+Q0G0QY3Jwq9vG?=
 =?us-ascii?Q?eb+9wzQ15q9/fs2yuelaDyg1Zke/F/ZdMw1koms/rxMyMqI0j54b4DrbL9oK?=
 =?us-ascii?Q?r8zHTg7H/KsYA6F9kcD0H85gd80YnDmx9pzkcvVGOVU8U9DZ8tVr5W/d5XLj?=
 =?us-ascii?Q?cWPmgDRuZTNH61TTMd1ULzHM9X9ZzHntWNflaY8AdZxE7W2O6j7VrL6kbhZ1?=
 =?us-ascii?Q?oVCAuZ4dmBsue8sPQiKU4EV5gkuTlr7GNkSB/XNSTMImylKOSwaEXB+r7Kc1?=
 =?us-ascii?Q?t6DhNY46fCpcbZICaLtYXgiTaaqDNkOEhhhGaoqxae2J2d0WWO8LkEDCez7Q?=
 =?us-ascii?Q?PoK3Y1I1zne3RnimLDgGiFKKxMUxPjQFAsnFXwXAZYFN7dpPcyS4PxKURkSa?=
 =?us-ascii?Q?CMdoVxjkGnHFXWrE/Zsls8VYP8xGBzKl6+qtB3R8CniqXiYLx1vExBPaIgYb?=
 =?us-ascii?Q?WEHdeoKeKKkQ3XjRx2drW1Oa1RBp4KH0jR3jWTukDh9ikrL7LmHcQk6H1V2Z?=
 =?us-ascii?Q?SxgEQmBzz8sl3/0teM4sNCP39+cNAch2yU3T5YBGzLDTsU3Y8bHhzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7b1r4723Sxxzu7qTb6AsD8qBulSiPnIzhJI0mg7MJrfhxdrbA95ua0ukN6WU?=
 =?us-ascii?Q?JqAprKv3d3w3/cu+d97iStYahsdgFfDJ8K67Uk7hXtt2oczh+OFeAfvEe59z?=
 =?us-ascii?Q?TMSAjKU9/z43geHEOeQQkVoZeh8YQH6TW5+53qZI8ZkYvJMwC7wzoa8LumFi?=
 =?us-ascii?Q?uT7Uj0SSGV5UVlRpk27yUSvq3ZHsNFB3FyYs3Rg3LNWWPM/gZBQFhVPH0dSi?=
 =?us-ascii?Q?mwQ4wJVAibhqK6w4PvZt8o3hlsH4kqPVPEyWtIZpT7yTmowzhOXSTMofv8qq?=
 =?us-ascii?Q?bXeGLp5M4Mb9d5Yx8kEBGnNhj4YS0A/CLiEHdVLMbP9zXyT4Y9aVQwa9cJlW?=
 =?us-ascii?Q?u9292MFDo86CMt7qm8xBQ0/I1+HrbgGSchSoaAftVKcgNVTK/5SoCoF8ewtJ?=
 =?us-ascii?Q?tG8TAsXWkJqiDwbbHP43cJAYIlWhiO8hPp+HXdsfGsQL0WZaTq//71wJy+FX?=
 =?us-ascii?Q?ZweKJDCBYBYdsKnCHQVu3Y5lXQnIkdo1BRMY6KeSjZO7MuNkEL29sVh5aUFF?=
 =?us-ascii?Q?UxFbUacpqEsT/UcXufngLTsQzywuzelGQuUB9vdmYma9olZY7Sy+hz7bCpGf?=
 =?us-ascii?Q?KwBksT9BGQf4+udubXnG3/8MM8WOIjbZFnwFhVPdTCZ6v88vGZbc9wAscf27?=
 =?us-ascii?Q?Wi10x7RNYrX2X7uFf/ovpbkuEWfoiI09iWvRGQO2g42eJxJZhpihW/dWXe3v?=
 =?us-ascii?Q?BHyDiIb+zo3e6adLy36C9iR7MUZiX2CIC7PDUyw3rscnbzmrnr/nYmBu/b8I?=
 =?us-ascii?Q?14uyDUvHJRi0LsV4O+fzcQ1jgy+2scow29tGfUOeh+t7Ulb0eI+ymg48Yt0i?=
 =?us-ascii?Q?6h6DYHGHk4USG++kipPGcjkVzUe2u0MUkvsgkIHL5CEisN5+PHWvBLnxrqI7?=
 =?us-ascii?Q?zRsKD7J5AaliEh9SEApQdThaFvybG801BnLQerjWuEUJQMroTQLb0q5iSo0H?=
 =?us-ascii?Q?jYbEbHgCSwS6B71NtMTqXUp2bFh3aQmu20D1OjeqJw+q9pc+3rzMfjAYDKax?=
 =?us-ascii?Q?GAAX6UWsOcceV07+pvIKvhzoncvnNHFj0isneGjqhJq1HvfEiGoNCBGe1Dqr?=
 =?us-ascii?Q?g8ww/MNkyXBU84WDUjHqGixNGbIoBlC52WpnUG+UZVl7vlpeIjViSEpuLBwy?=
 =?us-ascii?Q?suc/JC9T70FjFAvqcXlWc6dGg6Q0h3goNnBRmQuQ8ldzKlgR2Q6GBed5i4k+?=
 =?us-ascii?Q?ImhgRzeMagoJFWq5VRzGyyO+z9tP8+ZvUjelFPt21HcK7VuRr2nTgGWvGERF?=
 =?us-ascii?Q?mh/qrSd/wMF6LpdBuQQw0Cn7L+01sAOuY6UacSsvWpCyRDWO+aAaphvSrjnH?=
 =?us-ascii?Q?7ZsF/rxpDRq4076su1Eff50anWzvOLP60eISNVTtLbiqc8KjA9RBdkyLcNQ+?=
 =?us-ascii?Q?o/RNm2RwwfYVxf8lMZO+P7AXTTDvsotdAItJRCoIRhte/wZczSzeoHDn2IwZ?=
 =?us-ascii?Q?0cNOo1sV/QH7qsD0wC3FYkPCOQAyBHDgRjy2nHZpfZAOdl0MsirnIAnSUa28?=
 =?us-ascii?Q?3zOUkpZy8TZXzZUhyHbD4aJFqC5vUmy0tr2CJEFTEnW6tnuvekh0M8a6ztII?=
 =?us-ascii?Q?RbVcwjjsWF1oPfvctrwi1x1I+AA7cDmIgL3o7NMg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa49640b-03b0-453e-5d7c-08dd9e007fd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:58:34.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjVM3xYW/7nr1AgIczyKJ3T0PKmqaYYmESjTONgo9m4FwFkzsfP8W/IaeB1sS4qY5DfV4WjI8yr3xc44RzMIpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

On Mon, May 26, 2025 at 01:02:36PM +0200, Fabian Pflug wrote:
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
>
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
>
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 613 +++++++++++++++++++++
>  2 files changed, 614 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index b6d3fe26d621234ab84353165d20af9d2536f839..c703fce2ebfd8074bd0c6ee76f3c6f9bbd9cf179 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -295,6 +295,7 @@ imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..dc6348858024d833a450a6b5d2e54e4fefe9e9cd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -0,0 +1,613 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx93.dtsi"
> +
> +/ {
> +	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
> +	model = "NXP i.MX93 11X11 FRDM board";
> +
...
> +
> +	eeprom: eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +	};
> +};
> +
> +&lpi2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;

Needn't it, common dts already set it.

Frank

> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec1_con: connector {
> +			compatible = "usb-c-connector";
> +			data-role = "dual";
> +			label = "USB-C";
> +			op-sink-microwatt = <15000000>;
> +			power-role = "dual";
> +			self-powered;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec1_dr_sw: endpoint {
> +						remote-endpoint = <&usb1_drd_sw>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	pcf2131: rtc@53 {
> +		compatible = "nxp,pcf2131";
> +		reg = <0x53>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&lpuart1 { /* console */
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	adp-disable;
> +	disable-over-current;
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	usb-role-switch;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +
> +	port {
> +
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	bus-width = <8>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
> +			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> +			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> +			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> +			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> +			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> +			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
> +			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> +			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> +			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
> +			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> +			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> +			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
> +			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqossleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
> +			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> +			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> +			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> +			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
> +			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
> +			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
> +			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
> +			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
> +			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
> +			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
> +			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
> +			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
> +			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> +			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> +			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
> +			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
> +			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
> +			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
> +			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
> +			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
> +			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
> +			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
> +			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
> +			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
> +		>;
> +	};
> +
> +	pinctrl_fec_sleep: fecsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> +			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> +			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> +			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> +			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> +			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> +			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> +			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> +			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> +			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> +			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> +			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> +			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> +			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> +		>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> +			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> +			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> +			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
> +			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
> +			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> +			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
> +			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
> +			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
> +			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
> +			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
> +			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> +			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> +			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> +			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> +			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> +			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> +			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> +		>;
> +	};
> +};
>
> --
> 2.39.5
>
