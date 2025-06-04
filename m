Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555E21421A;
	Wed,  4 Jun 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067411; cv=fail; b=a5seWi2WPckD1Iay51zqB7GoAPLy2gbGOrVKmVOQfk2oReIVpmq8YPMPnzoRT9e15HEJUP8/FdBP5HVdz/dBJhaQcmHixi1iXHEdRdHJldeSh7PFEbO+YYsGhtF6NYPzznZojTSyUTwCIHA+yL34ccODkWeZnwGzOW+HGTD7lAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067411; c=relaxed/simple;
	bh=xkC9ZDTdgDJXolGkTkNnEfcwOmQOki3VqIFs/wYApPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=up06UKMnO6fGfQJ2I99ze8g8SJnAxgIDcsF0cAOvWiCmig7NmyAWV+wba5QNW/zi+bcF47M/Txn7PM8ILsIzuDnlSUezvc4GvY/A4D5qATQiKHJ2v/DjDvNEpofHts6kW2eAG7chBAH07YcsTusUVDNzhfwDlZK/xQjfLjHGUng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kEGUI5Sy; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kEGUI5Sy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cI5rCmysgrFpKxwhptOUbOgmRDBHH8D6qjUdw7RYfKo7CZFXrYoSJ5ggOb7kAp2FQPerIVYVOvtVHJjv7yb5iBrIFivmiKBwMstzbd6vkZ3wSy9hQS7Cx1FTV+4I09p5aGa5UF9EU7kdcRl88iXtJRRjsNiv5W5rI11BMPZ6NYMLiQi/TceXXqT87T0sp/VOeWxR3tCamZXci5IwokHtlDr/+ac0JojxuUaAWobZ7Qhm5z15RZ92pppZp5/F+cfCoMWWjjbztmSmO6MdQfqpdgLJroSpJOPak1+Dg/rdbvFT9bZ9n0C3dXXaI9MZ8H3YD7S+jF0FSoDqCXy6dbw0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rkDGsxV3+TWRcEvyXfViEhzGP9NaCOavTaWTmImCG4=;
 b=vd41VRw5sWzu4KGIAVFFIlC4ThjtTgT3THYI2Iwo/UXO2S2li654JjMVTrs9WFT0H5Ke6xDClmp8CmReBvgtivezslEraY0iFitoW1TQ4D6TVSquYWoKWBQh3M5c/hQ9JMmmEiV99jNR8BHLXYuBJwrY+6DJVRzz7oGvOMtIkI8xy1EvOmbZHC/6XQ4eELOUaFqFXQDtcCd7SzTy/p2EKR7KiAdfzCedrRECCoawzQ4GX63tqVogXWgu6Gqof/btRsD3WGV5Zl0je/8vbj2qRC2t6ifs9/gh0lFHWjX/JzrQkfM9BfB9LG8Oj0P673syDOB0CFIjFFh/E28ggMIUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rkDGsxV3+TWRcEvyXfViEhzGP9NaCOavTaWTmImCG4=;
 b=kEGUI5SyaHrVkreQde7ZxKqKKOJQZKBCuHZkeHVXw70j/cl+GBrNjcvW1+eTQB39cpQ2kv1VjQSQCEgS7eeoy6t8DwFoJGEMOPlgkhWYYm3mow7AVPc3GXOU9AXuMoN+VTpPYYQCzMJR25QgOBFvK7P0/q4lmV4Dv20kP9116rHlju2JHLe5fedFOA1/mQ9SxOhNHtxb3dEDTCdCqLGkBWugvrtr6MQpmZd6L67ncrkw3tFrInYRENc62g6ilotGC6a5LYrC1rvH+Up8wKNIhVpxnW0Dbs0Op6MwjwxAOJYjWhqJV8VgMZhb3w9vvRDGVXXyJz2fSKHTm7NKOzZnfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 20:03:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 20:03:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 3/4] arm64: dts: imx95-19x19-evk: adjust pinctrl settings for usdhc2
Date: Wed,  4 Jun 2025 16:03:00 -0400
Message-Id: <20250604200301.1192096-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604200301.1192096-1-Frank.Li@nxp.com>
References: <20250604200301.1192096-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 087f9720-d864-42a3-13aa-08dda3a2de4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NGzOf4ejstPlKnnfmhd69wysV2ulxzW/uV32tJtBFZ4YwJGDt6v/Kf+2IrAT?=
 =?us-ascii?Q?kr9wKvQk5J6q9xoWSLehqkO3QGtsSgdClXo2+17LuOwhgKo6HXv6xQj+FFH+?=
 =?us-ascii?Q?f6DLj/j8YiJuQ1BeCu/LUGaX6omM3upNOOgpQH0AFM18gfayxMJKIH4JBEwH?=
 =?us-ascii?Q?DigRKQBZrhoyaF5rL3lMQpQZARZ1Ul2EP1W8yybwQ7w4s2PW8irlb/yDOd03?=
 =?us-ascii?Q?X7fzqQx8/2fFtnBWgzFEtwcnmXUtNDDk/ZZhEhasT8o8FHdY5Pd+Gjvp3AFL?=
 =?us-ascii?Q?y7M7JliPSavUtNkUnewkGUiIp5gX5qz1Z6mhuelLE9PrPHokuI8pBn7ekzck?=
 =?us-ascii?Q?V7qo6zFQDojIlXCZ656MFMNdOep3+3SasxNadBL6NytjcJDxFcXiidqdASYr?=
 =?us-ascii?Q?sxmkLWYG/JyamJZUFLrGw+mV2jtjYMbYerGNyb0A36A44Mng1zOJlEsGnRlT?=
 =?us-ascii?Q?4ioZ/j9nW1X5YXCQU2c9ZmDegyUPZCXt8RjEyDdjMrWYcwo4qgNGjt7Mi1it?=
 =?us-ascii?Q?MZStEJfipMe89ojWjlcMp2TP7O52BifSuXqaAMCvVi2sU3hVU6Rx1fMKm+5I?=
 =?us-ascii?Q?Xml+mr931ma5L91PuIUMtmREpPOyV4RBKLMn/25cxcq310wR+gfkBY7czJDR?=
 =?us-ascii?Q?kSr+bQHsrcUFyF8yx0Ro2Rb/P2SbGinIm0Q6WZR9A9mlN6OoxYxLaGYhvCua?=
 =?us-ascii?Q?wNReEpAbf0jENy6LaSRykNT82kL9lQBjr4GXElSCMXFEz7T6eNCtwLCeYgKB?=
 =?us-ascii?Q?vcycjD2vJ8buontz4su4adX26530VDjIT1gmronWrWDZx5gsiHG8FbRyzX45?=
 =?us-ascii?Q?zMNK60UBFG5NuviLc6sOynJxNw6GVt5e8t9nFXIwmEnk8Jm9G7BBLoxvlj7r?=
 =?us-ascii?Q?in40fO+91FWVoYlh+WWWwdM1myZh9Itu+dF0nqjZmeU/ckiXEdhqYt055tbk?=
 =?us-ascii?Q?T1o9j5dEdZN+dLAyhFS41ii1XQ2t5MYn/h4dwSZJeuIukPyjRvIdwgInmmTo?=
 =?us-ascii?Q?qMzhGVwJJJudrOuj7ZERISjsUVcj0M76svKKU3oKQ+gBoUKhY0ZgShs8I80x?=
 =?us-ascii?Q?FrKFFbsDCmJBo+e1/wdQGQER/xhHzr0sLmjURlc89PeVHq1U3Uj/oSuHgsyu?=
 =?us-ascii?Q?KoStRgNDeA4jB3eiAOo0e370S9l+YkhLGCPRN6hoZmkh+v/l8prpGiXNWo6U?=
 =?us-ascii?Q?24vi0S42oQNDWap+boQ8o08YkjGM74oZySf94DeFW95fzy66BfowvhS3s1WD?=
 =?us-ascii?Q?1MMIoacrNF1zFVWzuYPUXEg85t2mCi9vVXOfz4SVgUddKKghwQ4grMPprml+?=
 =?us-ascii?Q?2QiPGu6rCMeaOlIVMGI9FZIlujBeOddsZx+hpxPUBFpAqE/jXfbJhBWul9IJ?=
 =?us-ascii?Q?HyoLzilRq+CF79QRLEqpYzidak/mdjSQ3w4xUjkLUE2QKrJvhiM+tWqIVjDL?=
 =?us-ascii?Q?Xjh3fPPMVv0rdGPM8SHRR0sxVfelBaFVe9fVqBq+n3msGD7y5xBf1c54eMZt?=
 =?us-ascii?Q?8PFJuMC8fdFSLww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvghj1l+yulgqFy/iV4xgwvAASUu30VWNc9i0Y+B9bcXrY7DPmro6eZcInEw?=
 =?us-ascii?Q?hdZT1SDcjHn9TcXg1brO7g9Z2etHhpfCQjFCIz8ndAadH6sfUqzycSzaj7Of?=
 =?us-ascii?Q?1CsmdQRjVf4CmQUL+uy+ImP6lhTxu+bKYhfAIarsumkWK1zqJkIBQEiSFcof?=
 =?us-ascii?Q?zrC/rht62UV3bYPxo5M8DYlq5alr0BC6jjczl6Pn/whKHMjQeq6M1Gei7WXj?=
 =?us-ascii?Q?NPXZpiTRdxZ6OawNj8utDRlmh/tldLKGv1rNDlYmZb+toYUD+pK7iKFdEkEp?=
 =?us-ascii?Q?p2WuzCwNDZ+DIflao3lp9eHtg7fs+izwZcKVzmBMPzbIx7VfvTCLZqtyPEnu?=
 =?us-ascii?Q?QsYpJ7hR8ZXVsBigBEWeWxFX36yhpcWKSyaTdL+WLySCs9tBStND2QKd3C+w?=
 =?us-ascii?Q?qX/hNoXMh8MmdNFPPFGj7113+EzFKiUIg/8HMjJEMtjTOo0pl7xuHDslccTS?=
 =?us-ascii?Q?GvRi/NVO2XxuDDZt5ubbbAFW777Iyon3OWIm11TRWgyHR0NC8dE7anpa9IK5?=
 =?us-ascii?Q?UeDj2Suw9URT7ZZrILW5cUi0djzGKBrKcjNXrwdbwiyq0wa5Hvt+qbyb5Siz?=
 =?us-ascii?Q?4iHSGj7pYfBfcjCYmJHbwFSXV72oSAdX07bsm2Nu7lIc0crA0Zcs6BrpeqHj?=
 =?us-ascii?Q?4tp9pDazU2MxXTyUI2hVGPiZs+/LAXUXH30+0mhPXjH6peGcxOfnhPJDmh6H?=
 =?us-ascii?Q?qmPQSaLbZdoZc5Gm5f7LK73ANNjIKFYiQnnWHkUSheJJ2u06Vi6V41LOA2ZS?=
 =?us-ascii?Q?Km5GEufue9nc63l6eexGu+AGJ5NYRYBdeVueyEV9XL1rIsW1IZZ2v/XVUQpu?=
 =?us-ascii?Q?DE/EbpK8YDMumHYcsQjTUi4db5cL/icCNMyytEE2oajTUMsYdpIHgf8H0rw+?=
 =?us-ascii?Q?UgsqZul+OFJhec2Nhv8JuXUwqcIlgt0iiEEbpxfA+1ToL3ioNAiXgPICBAAr?=
 =?us-ascii?Q?Ej807eCpHAZUL0/DO1KCWdR0HEI++b3hOgMslEphnnWZ4kvQLaJ020FDDgwB?=
 =?us-ascii?Q?VoGy4dE3nwjt4ud4D8xYssMzHHUxSqYSayvMIAiDX9ZJGrbpEr7kMqiQHP08?=
 =?us-ascii?Q?p07a47UA1Yxh3MmOqnJq3ftK7krcUo1E5LsjmsAqKRBCZnQg6y7ByCvAFTsk?=
 =?us-ascii?Q?xnP7Z8Fs9xc2kfw5ok5uhXhC451vvdvTDmpdEBtO5C0h6Ce/ZTzdtrhOXlkh?=
 =?us-ascii?Q?eiLaO/j71UMhAgMzlSIYtzvMGEXcppbUJZbyqFfuQGzsUbMjVqqK1exFKGiV?=
 =?us-ascii?Q?FikC4mc4J6PKoRuS2kyKHif3pV96PHDfO3M7cqr/ilXzQRuVwoEUITOqZr2M?=
 =?us-ascii?Q?auHD82rCpML51Jq6BglaFuPnK5I08v/v9ip7Dd3Le/XKvutjIJaS5rvdEFfO?=
 =?us-ascii?Q?1PE8iyyItQZNrnl/HV9cKdIZ9LwdxqgcJ5Ym+Iv+p7ABXcc9NYaB631/rXJ6?=
 =?us-ascii?Q?T55DlosBGCyelwQxDoGpJDdHP3Ge3vT+6CuFdcMS7WddBu/Cnk0Z/kJSkxNv?=
 =?us-ascii?Q?BOHvUUWZZtGWc79/bx/QKYnbvFHYWVh5X7eUcSfZdwZPmWd6BrqY3girN0fx?=
 =?us-ascii?Q?vM3T8Hi4GLTR3fKbCllgL0lhEX7krJuYT4l2FRcN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087f9720-d864-42a3-13aa-08dda3a2de4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 20:03:26.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCfmbdQrrNerrSjrbkzmjUtWq7lNQXwKdIyTMdq2aYM6MU7p1O4y6oeCFq4k/dhkSwc1ZBzn08I4qdSzZUTG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

From: Luke Wang <ziniu.wang_1@nxp.com>

The driver strength is too high for SDR104 mode. Change the driver strength
to x3 according to hardware recommendation.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index cf693c86fd454..7fd2b12cacf40 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -992,12 +992,12 @@ IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe
-			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe
-			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
-			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
-			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
-			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
 		>;
 	};
-- 
2.34.1

