Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711427464A;
	Wed, 28 May 2025 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422485; cv=fail; b=EXIZnfkwStBAtm83SLoK9/XCLhHpph8PjXQ/6wgQnuo5d3Q/+XaJ54YY46f2+j7TUUpTrETWBrN4DfUDl5WLte2v1GKLkJKS5q3JUxrfu49oSkwA039LghG4JCprqmPl3v4c3iKKeAux5vcERfhYCeu8Bb3jnnmBbulQ7gUct4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422485; c=relaxed/simple;
	bh=lNoOkMjkDCl4f0Mq4ZQSA6dGXMWaFFsGhmUJiwPnHhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lkPAMT7BSDPKOpQTk/o937SXQRBDxgLdSb56v2xBYT+Bm2QYYwA3H4oUFUUiQ4RdrSjsOp8UsrH5ULT/hay58fN1ZLlA40mKRMpiiJNKLQ0fErWTqixdMBYaHFuOifOFvUQwCmV18RZRd7z3fYpJqdhR+oZu3/UjkhW1sU1klnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M7EzFrqx; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M7EzFrqx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VirjKwNP5xuuZ1UbWzxM/EQ3c9kiLEn5TI1wjG0sk0LZPaj391pB0b8EJ3DgM6c7nyQYux5VyUv28w6D5WGMWqg+w7h6DAvN+ZA8WmF7ElV+95tPi4oX4CK90PnVuTA8BqaOzMduwG8wK/U066lGnYVbP8l2wTKXmlP4LxM12cmXaqOLdz8p2rml0hMMYFf9ccfhouR4CVN1MsrWoM4vIfpxyp7z38ELASTHQK4gAtGwHFh+UTUf5zFnqq3ps92Fmd1EV8ZYvlkIeaCR/ioDKDA/lmaTjoJsPUrokPrT13R+cT45nWbGreQDJKn+TbLAXl+o5QzVIxNOp4qO7fwboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VFwmLtb3S3AadcEXOz34LCU0G0WJ/sA1WUpmJhM/hA=;
 b=h0i6mkav3OQes7NdSce4iLC7iUlmt4QddB8cWaKT+vkT+jyOfoSiYAVlNrHo3kcv5r7S8vTZcwl5hA8tNQqZid923g/ANB1xzzIUeFYkFrV4y9S1w9JqeqAsfUto3sz6g1+a+AXp9SGk62Rc78nfgEAUr2xASY8R6Z5GbRUQbuJtGZ4PviN7jrRO7/vA5xeIAbVbHNGnunJUE+XY8u30vBf8UJLSXaVyy5+V4T2ibP4p2BIMtUvmzU5nnqXD3dtLu9mecr5aJlsqwGCRVCB3mp7ThZm1GhMp2ddz/vj0WGWGZsWbX2dEsojcZQLM0c0D6riMuIRxNC89g4P3Rs1cTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VFwmLtb3S3AadcEXOz34LCU0G0WJ/sA1WUpmJhM/hA=;
 b=M7EzFrqxEWlXrn7j9QoKXtDLszGBrpVRfKXrE+D0W7lAE88T5z4eZyxl3WSmIp5sIALb/8sYKdPu8LiBFVtgHV0MZipzqktaAOQlunquTuO35VvoJSpruZIxru6fPphMuWwT+UIgEIH3VZmuAnrtSZ6Mav1nHLzfkJhJUxWtDUdNDOAJfHIb1fSt77S5iEDGTbJR5zQw1KzU5sxK1DBLfqL2ALl4mRnLlKCyVBsL5ugqxirX194pat2s7yYrT2w+WCXmw341I3kz6V0yoyHzcsqUmLq+KSyRc9VfUZ2F+qf2xvP/fG8Qqq0t8VkC6eguD0fqjp5D/2eTB9kkOjmzsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB7166.eurprd04.prod.outlook.com (2603:10a6:800:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 08:54:38 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 08:54:38 +0000
From: Wei Fang <wei.fang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: imx95-19x19-evk: fix the overshoot issue of NETC
Date: Wed, 28 May 2025 16:34:31 +0800
Message-Id: <20250528083433.3861625-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528083433.3861625-1-wei.fang@nxp.com>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: ab368ada-8b5a-467c-4f98-08dd9dc546f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6kH8L3dl++hF8qHqQFD1r6dcDXnD2L+AuW0ULGaXfy7hfb7omO5hwf32LWy0?=
 =?us-ascii?Q?0ZssdK1ZnCXTYjPNMBrkAO9G+1196KnhG1INyWjY4JvNy6s3ll+cml3c74gT?=
 =?us-ascii?Q?dmknVsTS/fx+KgOQkOuy7IEj4yKgHw2yai0TPR8MsFtFanUb06v31ByIu2g6?=
 =?us-ascii?Q?TqLzVx3KN3VF/Cn9KDze5ojIaWRs3f6IvM5iaC83p0ZGxVXXwxiWVxeL5/G+?=
 =?us-ascii?Q?CI8C8Lj1QJL8C7YJAsE88F3cThfa5bW+w1F0yS4u5NP6OpNduj2VbW8j3Cxq?=
 =?us-ascii?Q?nn2g41EkYRJ3jPXfeu7LEcXshiKa8o8WWUrMX6WFxz506A2SOlnbkffW2wcX?=
 =?us-ascii?Q?DTdFh99WW+K41vNPmBFeNUhVNUBrUGV2YAJqhJZ6sMd/MNC91PSdYkodcyty?=
 =?us-ascii?Q?ioj+CHS5ma2zGowu3cbyzIyq0/zeU2wbvRUONyWPb+ISp3jD5eumdijS15YO?=
 =?us-ascii?Q?+ooN3v50tKxeO3vK+4c4RPY/XCrAVkYitD7Uc4oSSAxdaUdXiJyLFijVA3Gt?=
 =?us-ascii?Q?XzHb3QSgiYbZ93mv4niqiD8MxWh9dsKCXkMWPGVKXy1Amc79ILYz/OBmdFiT?=
 =?us-ascii?Q?XY90wpiWtdxfpaKG+jF1h6/U1mI3YaltE0iMlGNtLaiEsKG9EUbQexOdh/jn?=
 =?us-ascii?Q?p8ZIusRrIOOqevKVkn6y6ouqfyZx+98HyApzqQ7/gujHXa372Mc6RjaiMGA4?=
 =?us-ascii?Q?XjlwmTpHewgk98sFc5oeQv/coPo8YTnt3RWqLrLq1GpwaRkq0W1TibWGdO0w?=
 =?us-ascii?Q?DQP545xp+yJ5MfXnRq3gMi54TaGiDr0OOoO/V8kytsJ3EbgMhySQIoaOYmVb?=
 =?us-ascii?Q?5MS3CFFIJGbynV5NU4Pgt8FBOHRc2zsoM4dQSOx6Ajme7z8okuMM/DpvdiZB?=
 =?us-ascii?Q?3kKkkDlODXgNZujHwBb3HfdevKaNrRzDXTACWVpz3x4tOM/tFhJ9cTgS0+CA?=
 =?us-ascii?Q?fW2/YfDGjaPL8sPJqmHQrPrU4lMvLSMYUJV52Sw0NuioFIZqJlk9qpbPT/a8?=
 =?us-ascii?Q?YHW4upgOjwXkWlsxGjDk3tKsdtA59MSqqbK+/9iEm0tSyRTrZ6ku8iLKFbet?=
 =?us-ascii?Q?EAleQHe34p/t9kD/Bp8DNnuHre7o00eFV4zeGwIxFV1Yec+mdIkZYqnmzCzU?=
 =?us-ascii?Q?WQdDYe5XJ3KMujColmC+drB5OOFejamoiJ1wmi1fHwQcJ9uscwvbV1Ir88Gf?=
 =?us-ascii?Q?kRISp8DrmoRP17J0UeGHSuN6l014n12ser5Y+zW3snIGQYre5S8Ku0MJ+f1l?=
 =?us-ascii?Q?aWogZTy2NF+BFTHUzx7zYw2CONXRhAVQvgDvXw2aiJ3gBlNlb0Tbgx6KnYvj?=
 =?us-ascii?Q?g5HrsZYNWoOgSKeBfD8mt2crzhpA4UaQuGV92zdnKN+dI7ncfqY6LNOv0wIg?=
 =?us-ascii?Q?a1IDdxVc/H4Yw8AE0KePRuyCYuYlcjYue3uF5eGBsSbyB1uxw9UDrjD5HlmX?=
 =?us-ascii?Q?tU+MCZ+XL/x2rSXqVYhMXdrfGeIPai5MNjx1M5P815Uc0KE7jMsK9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D4dT1jGU3Q9cFreuQCmlIorU0JMjIzpwkPRW2DgRnAD7gMBE9S6yg1/20mmS?=
 =?us-ascii?Q?M2qQ2I0fgOZzI0aN1DufPZXZBEoZs9/TVQYHYklY/b8jr8LMcCs3HB6d/Iu3?=
 =?us-ascii?Q?u3GCk4vqc+pngEvXUux850caAV2hEtMbwgQFeSEQvIjKN2zJV8LJirbW3w4v?=
 =?us-ascii?Q?PLgawMe5pqXaaXOcFu9iX7gGvSGm6c5n7WkwEI7t4RNdCXdh/K6HQj2F9GQT?=
 =?us-ascii?Q?tntcYVd5YlbzzQyE9+/qzoUwl+ANkh8MyQsKSpGhHbXat6A+kwKZU9Wj1CVL?=
 =?us-ascii?Q?uy4baiQnj+EevnCUJXDfYPKX2nq9Z002em8MuOoJ93nkq6C38WDDaJmW4tf1?=
 =?us-ascii?Q?kSv+XQ+RKCipMyJxdUoJA5U0eRlloKpyaiBb4y0CVOLkMddQIRB6o9anOI3G?=
 =?us-ascii?Q?+b29hfUXpumGJh7zWH+k5ZAnvmwwnMfZJ26R1x1NM9lga5e471pxGAe4g5Oc?=
 =?us-ascii?Q?lH2Rn1I952LXfzn2mvb2pfJNduSIvGxN0z3AWYxkLa322wIhG0n1meobaXBq?=
 =?us-ascii?Q?52LAiDJXlW9giowm8Ir41uwRBul8xRg7qVGfP23SJY9Gly4W20+01zmoUrLk?=
 =?us-ascii?Q?DszRv0Owkh2vrzQPboyHpiDm9embzs4CYUxrwz1TMQ6ev8FpGKOngVwDoYal?=
 =?us-ascii?Q?eGYvCkW7A6xtbhc2ZxhmTJYW5kZLYlUB9dPdyyx03z1Vws+6kyr7zjeaSNJy?=
 =?us-ascii?Q?7ijnuvFTMy59Z8Z65j1gtGncP7lb6W4M28FuEfV02Z4I6HRRIkYyKUmZzyfo?=
 =?us-ascii?Q?lozQksykbLGHXd1jqpkEpEjeu+E3Wg8oWjypI8OU87nuNG6ENq/vM1JIqPdl?=
 =?us-ascii?Q?M9l5G4gCJ6zF4rKbz+pOrYfPLdLZOSeClqvZsHBYrYxLOaZX7S4HvzmJGrHR?=
 =?us-ascii?Q?j+lS654bbMoeK+B8h/eUSPC+ecB/G9qzw6sQs6LKgJ3HXNcOlxZE9XB7OP+w?=
 =?us-ascii?Q?Bln2Vh6gzmeumj5cVgLjamCqotxvJPWu/0Y0TnmlOgGqaex03AGSeO/Dz5hh?=
 =?us-ascii?Q?L73lTQ+b/oQFf37bIo2fpuUk54ITxJRyQABOBcrZK6TRz8k+058liPoz900Q?=
 =?us-ascii?Q?sO7/pw8ACP/COH63+csmjivQYGje+P/O1Nf/9ALd8OvggkC1N6Nmv0Z19zZX?=
 =?us-ascii?Q?2bK0pdPnOj9Ms3Lzqksa8OkLR1IxfKhtZkKnyYSbZfNLscvwAFZkoj0sLQk2?=
 =?us-ascii?Q?5TM4iNLSmbH8ckJ6sX0DTDVW79DCuXad82yXPmx4BikIPxY3q8eIA2DZysJ9?=
 =?us-ascii?Q?KacS3GZyIlhfa8mjhAk7S+lOZMx1YNaD/rBkftc1JgeyrxHMw4OePK/+ffFH?=
 =?us-ascii?Q?XWrvJCRHJj09Bz3kBzrTklkF72AvnCkmNTt+nRw3HQxY8IlnhRItHEAkV+2E?=
 =?us-ascii?Q?tWAw41AsMhQFXrNQnn5B0M9FQWJ6j+K2aZOmyOsa9XS++df4IdImMSUyi2tM?=
 =?us-ascii?Q?jJrkyFa5H9A+m1eKNwZEtWIb7IHQeFXxA/Uw4kStBo3bQc5zGULsTxV9A4R/?=
 =?us-ascii?Q?idycNGwGS0iNesA3yqjkzoyQXs4Q5wpylF9Y+mn6FBC/2JRRyitFQ60IghfI?=
 =?us-ascii?Q?Dfzz9LLkqEyXTY7uzO8UpwgfHORvwAYxdk8TKj2A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab368ada-8b5a-467c-4f98-08dd9dc546f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:54:38.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAKee269C0Ov98m2G1jlOI8asNYIGkdgEOzWJ+4sNvy3a4MoMXLCyJWc1I86h4xoYx5DEgkAFf7HScQ9OpYGrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166

The overshoot of MDIO, MDC and ENET1_TDx is too high, so reduce the drive
strength these pins.

Fixes: 025cf78938c2 ("arm64: dts: imx95-19x19-evk: add ENETC 0 support")
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6886ea766655..d7d845231312 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -566,17 +566,17 @@ &wdog3 {
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp{
 		fsl,pins = <
-			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
-			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
 		>;
 	};
 
 	pinctrl_enetc0: enetc0grp {
 		fsl,pins = <
-			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
-			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
-			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
-			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
 			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
 			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
 			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
-- 
2.34.1

