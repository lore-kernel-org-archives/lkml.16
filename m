Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8B52989A7;
	Fri, 23 May 2025 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026752; cv=fail; b=k7oBLZZHElNgDeGUgFTPjvnbkrvYTA+enAj5RJYcUgjhDJ2JpO0JsDZnnvia4vgLftalI9Ee11kCwvuJjr/unwsIcMawJ47a4+E0ZQAHoatbD96dqbmK5NaN2UtN9DzGel7dZiIAtId8cEo5+JlIB6tzPjabBgJVMfdNiR4PTlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026752; c=relaxed/simple;
	bh=CJWAw6zmYUuE3HCvUt8l3Nn46u97gYS/f/t2PN2BxTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KCtx52yu4vsQzGeJdlxg3mIzRAI53VySJj0Y7Tfayu7WAU3pxaJVJwVtgEeaHLbdiz/6DKLCCtAyqIRr5r7VpswOx9oZcU8bI8KcYSIvyA3rbffyl/+6um778hnJZpgwSLER1tu1knLmch/n+3Xat2iqCvQqIf0ycn12RJPtiWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m0mo6GdM; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m0mo6GdM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt0J2axgbXm4aFPCVcQ2DBIzncjdb0jrcZF1WI+BWOl0Ut6U8K+8Qw3BkxRxYhtZA3IfQqPTFKKCHtVtQwnRR1jzx9bQ5JqlACI8CfHCVc2KqsHOuS2+6RwfZOzGcIXnuLjM8Bp4DZUIqycwqRXDBw5TtgChpK4iiRbDy5m8cj5IezPwCqdGSfx/260rs+R+0VH0+ErsSnvHwJ/Xl8s0wJngN9IwwWiL699377g8w3NAVh/RHbfUD9g/6RX4n5dXBDSLKRmNXsLroF9wpAZkV0P0s5a/nlr4wF2LrlW4X+xwRWqusi2m4DfapxIVN7KGXs6pXN8Cg1ukxplcmNsACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iktoWfcKdUXmbKDk742o6u2B5f1JIH6nbZTiF012PuM=;
 b=buZKRfp1M8VV0/Kmg2A/XtD6UXmJLP7g2A6+kJy3xY/F8Jtmpf8lRsb1I6bM+K8gW5CNFaaw/kxpqImZg23F4Z4T9D5OSfWHlkWdNNqQK5EIv27LTQsyu6PEbayVjKicrS+H3gFKzLxp702VTzBJsUbDh3L34/sLdOIAiXwhYXoWkwe/y2sWkqkzfGbG+cM20hZsJlCdh1sQ8Q29E1/qpAtJthVuZ0JAi+r3d0uxWCHgMZW72OmFKYzdAOqPtjD/h7090TrPn/CSLuUbwQJiyzS1PUUaPCBXICLnvSHM1Q2IVMMBFMfZSb8CyPbqrpwLkRlbPdmEHYAAv8Bigz5YAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iktoWfcKdUXmbKDk742o6u2B5f1JIH6nbZTiF012PuM=;
 b=m0mo6GdMj4iQtaJBtr+NVOQ6sUHbqpPqTRnKLMLgg1oGO3PT+HEUp8rl3vMSTkBlpQrQN4tF2EuJysmNWWI1ektG9N5tVm8glJQidErvS8nTVYRK0QnrXExAD8y/ceFOdnumSmjB6ZBVpoDacLQlF0brI0nIzHBn/KKE5qRD/q0C4WgCD3SXEjrrTsWvObTVxV12uWqTZXTghYe+qKlIjf1wYEByifIceFxZaO27FEUJFA7vTvOgilLNKP9HMSeRi1camYSuRD8n07J5yvFea+eBG4J5SaXUXNmGvq4TJy1IW3YLNAG1xOhNP4gsu4SA1OcmYYGqBOcaldjKTdTtWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB11074.eurprd04.prod.outlook.com (2603:10a6:800:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 18:59:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 18:59:07 +0000
Date: Fri, 23 May 2025 14:58:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
Message-ID: <aDDFcjgBsKVr49Ep@lizhi-Precision-Tower-5810>
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de>
 <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB11074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a00d35f-a684-4ec5-d9f7-08dd9a2be4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gofUd5J6equh6MWdzO6DOjnZBKEycc4RgLm+4pUJNUY3I7FC09rZhPntPFvI?=
 =?us-ascii?Q?IA+EteclkgnCU6EBIC8OGwmDaMU5uFZkPmmUl6sjj0aWn2+KgI0W2a4f80B7?=
 =?us-ascii?Q?Kl8yJEla6T62sx6Q0xTmCeTk/G6H3M++6xOqEn1kdur2iLm2Q6oDtgjD9XuN?=
 =?us-ascii?Q?6dJlHeFSLrTKqmdmG4lBt2S8P5XzVOZdo4nnJAAhGH5UuA453ph8Zfb1sBOJ?=
 =?us-ascii?Q?VxWUiNe0FGgmcz0DY0i31LTg0i6ldSY4Ok+ZkAP6tMkju/6P5lZjDHF8iiW1?=
 =?us-ascii?Q?DAFMQSon5rs4xEC9MxjSTs3/WIfeAFfifvWJmVJLWb1PzK9QJY9c9xim2VAk?=
 =?us-ascii?Q?m3H1uACWI1veOIe4Nw/h2LC9ZhTHOaVV4rWSh5FLqmeYOvXQIm6/QpAgGhOt?=
 =?us-ascii?Q?DUbZs9ccatHd/TTxVcGSgINmtJUXeqnxMKBzf3tbSk9LwfrjeHMkNYeqYBov?=
 =?us-ascii?Q?E1lJPh0oDHaTyrFKv8beOGuNdCGWFs7R3rz7KkiNYZDBy2Q8BxAEYAeZHSkJ?=
 =?us-ascii?Q?YKWo7DIUgKOtDPK/sEx2hONHTgSknMNg5C4s8OT70vXcIMi8RvRGDX4d4O5J?=
 =?us-ascii?Q?jMZ2MfPdDy9R0GWjqrWaKcRc86iIUCdB+i7MwTlCSTDPVohCnIHDItjbW1j3?=
 =?us-ascii?Q?ldVdsTytV7uSSMZ3xYSDrF89wLfK5bQEwUTiVHtTgGwPUG0LRLydFWZtUsLD?=
 =?us-ascii?Q?ykmG7AMoiEZSLziwxzz+mvlJvMgWsk6mDswbMep1MAoUvgEMXMurt/21ITzC?=
 =?us-ascii?Q?hBdJeBAeNGhQpO/rK16e6g0k/3XLMuZIzZ+p9aKRim9cV7Vh7JKPQa1sEK6a?=
 =?us-ascii?Q?z0dbdmsr1wZxyOvtoHqAJCzKiD7a04twc9nmlpmcQ9SB6RXDePCBomjj6njD?=
 =?us-ascii?Q?9+9TL3zr9oNcrQFzoqXeGwhoZ7VivY63x++eMJ79H2wnvtTuKuI9FgasN1sB?=
 =?us-ascii?Q?6bmBxj81crRvgxEODSYKBpty1/VZudbE5ZzenNr5yV6n8wU2fA/FdoK3m0xU?=
 =?us-ascii?Q?Wvv4kl0V1+nsLh1+mqZ0LEWhVaLuh8x4aCr6DJAMaJIkgeDJwqSxzoYMob/2?=
 =?us-ascii?Q?6Hemc+WlSvpL0SHt/gFU7grRPqJQi6qourzu+QSCi3ahhwwlUfpUt6LAw7u2?=
 =?us-ascii?Q?+NnMG7SYuaoF/YSe8M7M6YGhqixEaGz3xWIg7Gr5KHJG+ictcTNk/eSP28bW?=
 =?us-ascii?Q?0AhBomoBOfuOSApnYTl/lh4ouhy5sMcYy2k5vfSHGkYqTKpkvUp0Zz9+MTcn?=
 =?us-ascii?Q?p63G0VvYlOqKJa1c4CLqJ5mOqOuk6iVdvDqB84D5cIBnFT1Tvx13Jp72YwYB?=
 =?us-ascii?Q?dSvAfO+S/PEYDq85X60HduUJRWSGSjt1JraSmO+g8pc4ws6rcGl1F7xZYz0J?=
 =?us-ascii?Q?tHm0GnhHlKtlnl0YdBlsXfrDhVGuzYS9pKloW1JIhUayYX9+mxu+j+tdoagu?=
 =?us-ascii?Q?2DJNC7/jSh3ABQOcj8mEGKj6EhQXneZAyRgsYVNyvN4gCQAYCH+SuQNEWo4/?=
 =?us-ascii?Q?vopNPkQ4bokGBSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixJmJzQun7zVrLi0fq1sRBjVcJBOeVDUZbEonOxIp0eppq4xgNjJam32u0G5?=
 =?us-ascii?Q?WRhQ9X2jL62C4c+FCJDQuAQwYnGSEyzl9YFe3O7gdWiKumxNhuYbe3Ehfeix?=
 =?us-ascii?Q?KmK96R8+X8OOrgN5zPIcgSM6fLUBr69nIjLRA+rwAPOpTlBNr7FyXy3hSalD?=
 =?us-ascii?Q?Sc6gNotTxH7jD+52HdDs5L4+I249+ndHlZ/AY4xyuveZD0KX0MgoRCDCwLm4?=
 =?us-ascii?Q?roO6Z0oRX5B+qZi2mCr0XhB3iMQBKGrmVB6WRyTAEcXC+U1BUseuUOJX6ogI?=
 =?us-ascii?Q?PF+qPYVT/rAAQ3Y0CySMrEerGdbwIPOw8LfuW7exMFSXwMB13a9R94f678Vd?=
 =?us-ascii?Q?spxxuF9AOnIkb1PlYQOC4tsZRfK18TeXHbWOdx4L5uXNoZq5MtfYGLSlO2Kv?=
 =?us-ascii?Q?HAgP1jnsKrkqOouzrPf91KYGQoLAfMu/u4R6Dk+QYTL9MbgbDz+2bjXW+6nK?=
 =?us-ascii?Q?JGZEni/iXDufMuqfYdvxJv0lgi+KWPvJHwzKbvenwPh1qOYZLso34m27YPNg?=
 =?us-ascii?Q?ia/7nGBhTX7Z+OturX1E4CabCpqrv+Yy0wqDLOHpH/rwal1jLkXKvluVs52H?=
 =?us-ascii?Q?F3eBtwHbKji1qnNKhacXiYSpfZgJNiuW9Vg29kXX/2oApwhhrGP72VACLiLr?=
 =?us-ascii?Q?4D3ANq3gg4vVPHmnYTD8UKqMIZVIbRLbE6mOr8qlfpTwLeXnwwXxhPrzzcNF?=
 =?us-ascii?Q?RldQs4fnyeq7b1FWr2aGAMMBPZg9hcSQ/kRfrtcDapIOiy865KqX+8cnufmj?=
 =?us-ascii?Q?shn7Mx3WYPhWjWNbFc0XnPDRgYoid4wtXvIqT7py+bNWdkYecaJu6mWWNIXe?=
 =?us-ascii?Q?nq7DhyCDhqWOMfUXWgEbJQo2F/qAXPXRVMoHFToiJhAy6+ommKEyjU1Lcj2y?=
 =?us-ascii?Q?na0HigAsoonIZovV7ShV9pt0mzmGO6zdsYy+8QwbAtlzeoNUqyHXDqi32Nw/?=
 =?us-ascii?Q?rHwvlLCXbR/7vpEmb5rwa2iPBBCfzI6I+JctCZ4YUHceWUD81OS5abNRDImx?=
 =?us-ascii?Q?RjGr8k4vPoQvo6qcUhpGlGZRg1er3FCx97gbCDlBi2+CXB2XUyFHWJKjJQ55?=
 =?us-ascii?Q?eEfxK7mMNJP2uX0scl18tUDhhbDSo1VZmUxEfp0Z4SQ5tG10lu26R5Zg3v1P?=
 =?us-ascii?Q?wFxWlfPU1gu1k+w33fcxqWy6BlcMJvgdYxsPgYmn/60DWCIvjeTxR5/vyADS?=
 =?us-ascii?Q?l2Ogdhct9VeACVt8X5zW3+wg5fEyfGvtee5GJKz5yDrZW0i+MY3GWM/qgAPs?=
 =?us-ascii?Q?vbgH+MhHqinnDD3Uj8liCV/Y4xAxeDVMhqLWjhkmHBsYdOklR20N2jTW8RkP?=
 =?us-ascii?Q?LNu+UB9kagXT4AcZfzgMaTUQ8aHDAEDtJ8q+t4FVHS0qv8aQFGSj0Wi6us66?=
 =?us-ascii?Q?n5q1czFTEGiTnDLBAB+yhNbUZSu4byuZ1S3SAd92dZXuUjq4arl+caKNxXCD?=
 =?us-ascii?Q?O3odC7i4O6o9c90rG/EURJbZUkiRLsh0H/igykClQMRx+MCmu9btY8Zsy+Kf?=
 =?us-ascii?Q?rJcIG+LBbS2ImnKPb9uYUhfnzUHiZdeSPlug2Qj6yOm9M9yCADlOsjDXGjs7?=
 =?us-ascii?Q?qyQTWFMJclcZHMFWnWc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a00d35f-a684-4ec5-d9f7-08dd9a2be4a9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 18:59:07.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZswQlyXUtQczQTKSXxID0KwSMijj57oWCIIkBzRq07V96rQxKyEUc82gnIgKZmULufpnGpCdw+OBzNF88jjpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11074

On Fri, May 23, 2025 at 08:16:48PM +0200, Fabian Pflug wrote:
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
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 630 +++++++++++++++++++++
>  2 files changed, 631 insertions(+)
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
> index 0000000000000000000000000000000000000000..f1422946f7eb5799a9cc21fc93f75fc3a45ebcf5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts

Please run https://github.com/lznuaa/dt-format to keep good order of node.

Frank

> @@ -0,0 +1,630 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx93.dtsi"
> +
> +/ {
> +	model = "NXP i.MX93 11X11 FRDM board";
> +	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			alloc-ranges = <0 0x80000000 0 0x30000000>;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +
> +		vdev0vring0: vdev0vring0@a4000000 {
> +			reg = <0 0xa4000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@a4008000 {
> +			reg = <0 0xa4008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: vdev1vring0@a4010000 {
> +			reg = <0 0xa4010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: vdev1vring1@a4018000 {
> +			reg = <0 0xa4018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@2021e000 {
> +			reg = <0 0x2021e000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@a4020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0xa4020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +	};
> +
> +	reg_vdd_12v: regulator-vdd-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_vdd_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_can2_standby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		regulator-name = "can2-stby";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6524 23 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		off-on-delay-us = <12000>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +&cm33 {
> +	mbox-names = "tx", "rx", "rxdb";
> +	mboxes = <&mu1 0 1>,
> +		 <&mu1 1 1>,
> +		 <&mu1 3 1>;
> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	status = "okay";
> +};
> +
> +&eqos {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			reg = <1>;
> +			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy2>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy2: ethernet-phy@2 {
> +			reg = <2>;
> +			eee-broken-1000t;
> +			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +		};
> +	};
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	xceiver-supply = <&reg_can2_standby>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	status = "okay";
> +
> +	pcal6524: gpio@22 {
> +		compatible = "nxp,pcal6524";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcal6524>;
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +		interrupt-parent = <&pcal6524>;
> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <650000>;
> +				regulator-max-microvolt = <2237500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-name = "BUCK2";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck4: BUCK4{
> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5: BUCK5{
> +				regulator-name = "BUCK5";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-name = "BUCK6";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-name = "LDO4";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
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
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
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
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
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
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	disable-over-current;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +	no-sdio;
> +	no-mmc;
> +};
> +
> +&wdog3 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
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
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
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
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
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
> +
>
> --
> 2.39.5
>
