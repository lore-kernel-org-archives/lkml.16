Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9951EB19D;
	Fri,  7 Feb 2025 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941904; cv=fail; b=UKi3IV2EGVjivRtmKGzRJQJRzhLoArGxyYBQ7xkFHhYT8O5PJImkhmbxOh9kihFctgQFgj1gcSgk6dramPJ347uI9VvDsgjnxlTQX4yLlISD+AGQvYFMvT7K5W/etMlsKbelLskZgm8Tb3BwZ7XFcKcOMURLo06WsGPuhR3fJcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941904; c=relaxed/simple;
	bh=ot6iapX2XJYfRwfAFUGTO82kNurZ4i8alg+E0YatSr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pasz1vix1LaXVQ17cFy5vAZTTnntHpTnEnPLMrQTtphCWAoDF7DyinaeXjBxp4/be7BKhEChx5V/cUkBNRmdgpbC0FcR1yQk/T/g7Q7aRivjw1rq6OKH7puYNRhCc1TA8m6k4mrFHoBKiDQ0dnjujTX/C/wLGC6fqA93ryD0N3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nc5ImGSO; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nc5ImGSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnKpUkGUu49cCshAfsZp2qVgJyOP8Djfawhhj2UN6+J24U90uR6p4I4FVoHUqm5v/xtNdhUnqQxOp0y2Djg9pXb3guaDQ+6fQ1hsxxbxkhfs+bE0vC05O2oNa1ygit2uEnQ/qX9P9vYvn8yp8pmBtDKRuJnfJgU04gXcDzzmLYu/9wFeFwo8BCNRuzkcm+27zpSN7FDW379946Zpz9Oy/I2mDiD7Cu+keKkhB06SEMkDPhMB3ppRj2FWneslXBXDdRl3eH95SEXSSsJmgWmy2v2gILzwMvTE1LiWsm2MojN5p5U1DtRV8C7QY1lmxRpbzzrdqxRwnwpUdptEsR3jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIy9gn6o6KCTzioNQ5p+SUs/g9C73sSFU5qqu9QzsP0=;
 b=ZwQvScRsuwPnfgsEobSjYGQqDUZRU9oyDb+dx8E8JqKBYly7Iec0NCYTThVoJwhRaO2u0qn55C2buhOOwmEjIrlJvNtg6L5SBPFiclM8XN1FvF7XZ7dmbTYuIxjMNx1GsRqPD1HgCCEZIyYmXWTq8jdzOH1CwkQwNG+0GEAC4G53fXWNOaIIDlri3JURBEQneyv4xTT2TB/lHid+0DpALBxPPk2IrlnLKOkWND4Ii0pYu6KD3uj3WKdnl++2Bb1bDxmMP6U4O+wwalpoawoXDLFqYVnVrUJylA5hcQmNmNoAObViKJGdnGVtK66/hCEDdECguVLIJ+Lc+K6KcyBlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIy9gn6o6KCTzioNQ5p+SUs/g9C73sSFU5qqu9QzsP0=;
 b=nc5ImGSOIe9omK7+918AjZCiF6QWEJoA2XefMgDjTxUDsXuYr5o6Rgk3K9DP3DNPx4nGoYybdd3sBAAx36Rdj8rqwgp3DI8UUWuniBeNyT0yXjRZcArTkfeKGCWeQIc378cbXEnENV+11BNjyCVW9flHnijNFAA8YKvdQTuN+gzmXlN8vw1IJaTOT0AtXdyR828PA1WUPAGnG7wqqUCi+bcp5z6frVPKa0GqISHxw648PQbJv3XWgr4Sih2m4MrhiO26elSJIZA3/nAvP0uvIRjg1o4hDvWbN7DGV8QXfKFU4iE9y9FiyGHookcGEgTnEk6zDbxu9/Rxn5VGFKhyfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:25:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 15:25:00 +0000
Date: Fri, 7 Feb 2025 10:24:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: imx8mq: Add i.MX8M OCOTP disable
 fuse definitions
Message-ID: <Z6YlxhckC7H32GU6@lizhi-Precision-Tower-5810>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA1PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a15641-4547-4f82-e3d1-08dd478b9616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0SPbN8b2K2jx/vRqb3/mwNEGe6QZmKJI4wiJaaV5QoEX4OH0o4VtjEe5H+U?=
 =?us-ascii?Q?BYgfjF2usVOdGHd5mYoz54FlL15Ne7OR/ug15Z6nLYfXT9VGOHn/02+prKhU?=
 =?us-ascii?Q?DTX8DUS/DbINMfmcB6KfNfwm+ZceHHyZo57IAN3IgvWE0Oyru4Kr+MhSweTL?=
 =?us-ascii?Q?SfFvbcSLt6+7lvZqKmgSY7BNO5BBb2d6UzZihBovcgrQpteVZ1nIKN5KNuuV?=
 =?us-ascii?Q?w/Suca5JyL40mjN9jLnlHHtxesoeBGgOjSrB/b9V37MFlChqmyMK3n3RL6ut?=
 =?us-ascii?Q?cqKczsVTFFP38TwlnoiIaFxLnKMdHpFNdCB1UbcuolvGR0P+EX3Fyl1mxcYl?=
 =?us-ascii?Q?woaUuk1OeP3iomhRbV0JNx0fpbvQDyx9fuvBKJWDEX8yJ9H07oHBJn765gdh?=
 =?us-ascii?Q?96mNpWM74IuHSbnmq0ubOLcCX8aqcrT+b8RWkT0s8spUiTNbrWcV+XpQOTvM?=
 =?us-ascii?Q?TS/EPbxGcbK6fnG2SNmRKICEtzbIWoRW4fGiNS2aSWwJxgnRiRcR0QGeYjoD?=
 =?us-ascii?Q?FvEQ2N1A1gH7iKe5WRF4XbUeST/Jmt8kgPYUAJrAqMnTAbJRKRfLAXBWw/Kr?=
 =?us-ascii?Q?3NzQahDczbT0j/d6/HnURX4BTzUS1E5aI1mk47neul3G3XBAnBqeK4BRSr9O?=
 =?us-ascii?Q?QCtuT8Xfgq1UzFoRPnLXn8Obi8wgkDk0uGNKwb9O6RoLDNPmzd6UxGO3vcT7?=
 =?us-ascii?Q?h3haGAGNP3rLf4ScW8X1ZLN3g27icaI2lnolxwmJwO0fMe4Z2ZuHSNF9E9nZ?=
 =?us-ascii?Q?2zUUCj5heWK9BFEvsDiC/kGTRcnzkO633qmYgzfTzC1N/o1KBjNsd+31pWIW?=
 =?us-ascii?Q?DEb17PONHK21NeO8UGysSggTvshCAsRxyFDnAxPULc1zxGUPjgv6tLRxTmg4?=
 =?us-ascii?Q?Mgae86mS+FmOtN0YzQgGRNDVcU7nTHlr5L9/zZAf6KR24RiZa/sVkvoFsbSX?=
 =?us-ascii?Q?BFCRl1rXLKBKK1wwqjKADVoIBneMJNFQ+yjzZSvlPelcpBdBbE2/xukdJ4Nk?=
 =?us-ascii?Q?6syRk1qhmj1MnZuFr2/skyoDt6DBSXELhtxDWVH+MOBpelkgZEqml8Yf+6O9?=
 =?us-ascii?Q?YfsmLu8hTtcsdOU3TQ78gbTLvJOV0QbDChJGc39H/2Bl1Wj0PZTKdvlhM3vK?=
 =?us-ascii?Q?CTPziedFv3sK3qzL0n7XjEdN0d+3IHvyWLOoknjJJI5X/OtQhYPuMCHYtLdX?=
 =?us-ascii?Q?vCxW2ZQ7h900I2QVQEla0RN9GSvtIA2R9TKHxqwMBx4IAZlPW2/mvOuQ+QLT?=
 =?us-ascii?Q?VSas/Il8Z4bLvtTSIQjac6XTIFdRak80KD+fF4Zqqzr9LVqvB/ST/FlXDfur?=
 =?us-ascii?Q?xKXmZ7SJ6kpuSvvPbziDOqo9mByenNl4PSFDJpNZEqGClphFG2Gemh/3MUn0?=
 =?us-ascii?Q?STPTgyJSfDciNVOUL1Coc1OAgkL0ug1E3petGJtfVjZzuHdlKGAgeaiHRO+L?=
 =?us-ascii?Q?iu/TaxlKJyX/KtdwBdJsct7UueDyGkni?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DOUlw6PUixCCqdcSmfsyeNei2Ww0J8/aF0SVpha6DvsdpgE0wYHSKOw1UVZf?=
 =?us-ascii?Q?syZRLtDW9eDrUd9n/0/AuZSg6CC7ZDhKJ4ZDUEsmdg38i0KU2hHu7hkHYinO?=
 =?us-ascii?Q?czsiJO+0A0RNE1M/EKt+bQBdO+hGsi7B9oSzJ5OOVMBdq5CIQ2ETM0F81jBQ?=
 =?us-ascii?Q?cVngZnnqkM45rZxTm2aUo+bsB0y4c5M+KRgmYDQJAvefkFjur1SyeRdgBprk?=
 =?us-ascii?Q?mofOUjerceZRDze1IQC65Wy0WqQ0DygkC5BU+CtGSW/Q3oQ53YVTxUyqa3Nf?=
 =?us-ascii?Q?NsCvoupHWJAfkbX27gYL1PRwoXdvbYBVhPjRB8iv8zfRx/IyGP2xPFaImxm+?=
 =?us-ascii?Q?UqUVe82H6/Uj6xM7r8msdcmoes6lmL3EK+0Wcd9mknSJr4EI6BI1rK01v0jQ?=
 =?us-ascii?Q?f3av9Rv65jyDOZqobQpR6mUUwNhjQeJlJ3Lh1fQGfWS550YQWzzUz0yOMjMS?=
 =?us-ascii?Q?MRjxSckuMMTyv3zyh5SyFdfmd7hnA2SfsdrX02j4nIUnu6OodjBXRUzHh+MB?=
 =?us-ascii?Q?xNL2P0urdGHIF5e8WD5lPWdCDh2PGltye57BxrpTKBW6aVcK3Erv90LaUg9B?=
 =?us-ascii?Q?5uYSfwqIYvT5nQj2U9VFs0EXPlGO2QwNNryMdLyry0v+xh98RTefLQFhnqz6?=
 =?us-ascii?Q?2i2Ol8nluYn3DcFkblWTDYBoP1K8158PPHGbf+XsJ9dUgZ8wP1Ner3VhYpWE?=
 =?us-ascii?Q?CbjolA2FqOTh8bsWlS4ieawR3np2DIWOXD1Xxswr1LA6OADMAxVVGV3VNgIL?=
 =?us-ascii?Q?lRvbY75+rjTpyQKlb1Pe70SSyPojboceXTj6NMor9/8SwMOhpCR0hK6eBD3y?=
 =?us-ascii?Q?+qLmmssnCpxlu8UboIawSBZThbWBym495cVQxx+HlrDeTeTfati+h0rYCXdm?=
 =?us-ascii?Q?MCxixhyYIYuCrpVkwwtqevkf0UZH5Ow/G8UpCUScVZpVykzvx4B/vrj5FmLL?=
 =?us-ascii?Q?IAq1tnlxlpnOdy0QZBQoXM/KAZ4zugN7JEvuo8H/veO3lU+fjfPuEjfUHjgW?=
 =?us-ascii?Q?huLxNZernqGOjZZ4HhlLFRC4Hp5wkrctCNmL3zR0TiCfMKUrcqJwlKiWKgXb?=
 =?us-ascii?Q?tIhwigX1mT4ihFZp8+FthQo7JS0hLkmA94X5xe9IEFinAakEGlERRhNi1tyR?=
 =?us-ascii?Q?iOxwoJEDuAph5BCdhuvc7bwHkMlvb3STeoisl0mQZw7G5fPqocG+cn3U/Bfz?=
 =?us-ascii?Q?nIhHIh0OP01G5n/vuK0XzB8Y4Ut7JhPIB2C+vw2fVUYjV/EeOF3fvjbNu6ok?=
 =?us-ascii?Q?1Hb/Lo7nM+9PnPvmp598RnAeRQOWcRlIoWa4RdTRyWTmRUTnV5e79exxwldR?=
 =?us-ascii?Q?xliHcmDxAEa3VXuzzeN8Ddg0iU6fFx1pIe1AD8+w+OIVJEq7bLhZClhc2hfx?=
 =?us-ascii?Q?BII3ffvTLqHHk8qK9V5/ZBb5IMzsQNYauxV8MC2rlaLsyjU5sf4N14b2aH9K?=
 =?us-ascii?Q?ocxN0gQGz8YbDVbQfG9rjU+0bPP/glw45E4JP6UtqIOVyPgaVmY6AWeRwrFk?=
 =?us-ascii?Q?zYVyunEDXLhwXGxR8PunViIqJ1AZH4Ts+jfq83zGJ87icut1v/cbtpbuys0m?=
 =?us-ascii?Q?M0N+Kvk06ywgosh/Zfpw/1saERPF2/fHxvEyi+oE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a15641-4547-4f82-e3d1-08dd478b9616
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:25:00.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCpHjMvxbXozoYxxtPt8TUufGg3gfWqkyFn0tqPuolXu5J/8HlR2g9SPiteV3++hlWuOGP5Jy4Dwe0m7nJR4CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

On Fri, Feb 07, 2025 at 09:36:14AM +0100, Alexander Stein wrote:
> These definitions define the location of corresponding disable bits
> in OCOTP peripheral.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
> new file mode 100644
> index 0000000000000..d991d57816264
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Alexander Stein
> + */
> +
> +#ifndef __DTS_IMX8MQ_OCOTP_H
> +#define __DTS_IMX8MQ_OCOTP_H
> +
> +/*
> + * The OCOTP is a tuple of
> + * <fuse_addr fuse_bit_offset>
> + */
> +
> +#define IMX8MQ_OCOTP_M4_DISABLE		20 8
> +#define IMX8MQ_OCOTP_M4_MPU_DISABLE	20 9
> +#define IMX8MQ_OCOTP_M4_FPU_DISABLE	20 10
> +#define IMX8MQ_OCOTP_USB_OTG1_DISABLE	20 11
> +#define IMX8MQ_OCOTP_USB_OTG2_DISABLE	20 12
> +#define IMX8MQ_OCOTP_DOLBY_DISABLE	20 13
> +#define IMX8MQ_OCOTP_VP9_DISABLE	20 18
> +#define IMX8MQ_OCOTP_HEVC_DISABLE	20 19
> +#define IMX8MQ_OCOTP_AVC_DISABLE	20 20
> +#define IMX8MQ_OCOTP_VPU_DISABLE	20 21
> +#define IMX8MQ_OCOTP_PCIE1_DISABLE	20 22
> +#define IMX8MQ_OCOTP_PCIE2_DISABLE	20 23
> +#define IMX8MQ_OCOTP_GPU_DISABLE	20 24
> +#define IMX8MQ_OCOTP_HDMI_DISABLE	20 25
> +#define IMX8MQ_OCOTP_DC_DISABLE		20 26
> +#define IMX8MQ_OCOTP_HDCP_DISABLE	20 27
> +#define IMX8MQ_OCOTP_MIPI_DSI_DISABLE	20 28
> +#define IMX8MQ_OCOTP_ENET_DISABLE	20 29
> +#define IMX8MQ_OCOTP_MIPI_CSI1_DISABLE	20 30
> +#define IMX8MQ_OCOTP_MIPI_CSI2_DISABLE	20 31
> +
> +#endif /* __DTS_IMX8MQ_OCOTP_H */
> --
> 2.34.1
>
