Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9CA7081F;
	Wed,  4 Jun 2025 20:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067407; cv=fail; b=ZSVS1nyd+8InI5O4Kcv3R752xeWaNX4j/YFyHuGAal6oJh4zXrrUoYObqq3Qj/OYRHe2ihDQdHuhxnuSicTnhSkMS9rCpoka2M/uDuRD1ah7vggBjl/3HBd5fiDoOSvzl9Ykurtc/MQZcBPoigg+7TmJZ0nRuy4QR4ST5D19M7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067407; c=relaxed/simple;
	bh=AVHNoxucM7O42k3Oxti8p1j+Q5Ea/MGilG/u1qMyNP0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RNwyOwkvDlgtOuV8jEPAsUDG2C4th5iLT+99nTcFoaX4Q2LI1OZb0+Ic3NXfPoy8WbIy+JppFH97jXtqOYNRdLb8RsmTtcdTDTUStRFTDkBW6irpNbVb0AWYlHjc2fjLSh5v2VSxUCJSM7QllWcV3FP2F/NuUnbRTVpptFyN/8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fX4QNgJt; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fX4QNgJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOtBoGD7/SMfxTAzfnkIopu2K0I711rbGXOB0U9taL/lFi5ByXOh0gbmC0h6DmCoQZuTbTJJm8J34IW8FqCKMm7PeBwmq4WQkUQlmQMXIp1/7vuf7JZK8bwJRI3IlYi3NSpJPqULMCJqKMwIibCs+Rz5jq88jG6lqaUgvQCodAsSbO8y9VLlUNLBO6eoRq/FHaIH16hjjph2QqWhXBwRhaHGuSjK4CQT8lIRFFOY2XTKFALF+q1IaZAm1ROVxsgDG/ZS2BrQ/oWkLM8DfJqL2HMjKs58t+1ITzPco3xWuTz9bMOUE5Yv4wcqErAq8f6dX+xCwZurkxTNQlmMw0HqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/IixaybdmtP+COgKZRFOZTGvnDQd9cKYRcA7H4vxvw=;
 b=b/2EbhpD+6T9/CsQBLd6RmSCH0IvI6Dob+H8ke/ciYKEQcb6n2Uhlu8VTrh13biZI3mrDT4GDIUV8L5k0YtN/DQGeHYyCW4boh7iEjyfWUp02t47Q9k2RMvMxUAowSc89StBGdZ2vcb4f8KUtmV21G8k0ajyLE5ufWu4G7iE+DU+DJiBCTPKpcj0qyNhAuailAwZE721Iy1GryvYJLhfr6hdMs6TCXh1x8jUToNxcBZSwq+ntE1tMEIPnEn9cJFmxE6Muht5hoYFnU1vAG601zcwP19bHWJePse0V7Y42L8Hnb7lnpZlEcmpK/h4MYPPtP+M/SUgg+JIjJQci9Zpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/IixaybdmtP+COgKZRFOZTGvnDQd9cKYRcA7H4vxvw=;
 b=fX4QNgJtoDqARf52hlIjfH8Pny4KwTOaW+7KcKAmUO7dmJZyEx3hneRWvZFGR2KpFqKG4R405WPUhkB/ORB9ngk/dQFgEkYojyNPACOcE0F0ORT1f5WJj+jetJFwW0hqB9LOvLfIIeWtrlSXEaS5aawfqxEDoCawXJqhT+vhRQcbagYHtrlXt+v75Qbck929iey7tElQBhXpdyDKsYDUxOEPqZ+CyjBfALakpqet6HzLDwWCf1dA9G91BjI+Q5kZvMayntRagA1K3/8Yj37Hoe7VuJtzC55haCYXVvAgynhe1+EOSsdjr9E+359E+0nLqTukpmG3TuIkGSQsJHeN5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9653.eurprd04.prod.outlook.com (2603:10a6:20b:475::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 20:03:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 20:03:19 +0000
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
Subject: [PATCH 1/4] arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
Date: Wed,  4 Jun 2025 16:02:58 -0400
Message-Id: <20250604200301.1192096-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: c19793c6-99b1-4744-9607-08dda3a2d9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dSXDcpS4wfRGV0IQiSZqufdb4O0L5rJczK643pw5kzn+05xtj7nXORhlLtLY?=
 =?us-ascii?Q?YThL2bFYtzZYhtDyJk1qffQSvmIznqULjfscSqA/nDX3k2ygy4hdz1Q987zT?=
 =?us-ascii?Q?XpNwHvZ0RgCWyFOL+q8NtdCs53DUfGU60TXI0qo/tT5qUPyojdljsALtu75q?=
 =?us-ascii?Q?a7P7Oda//qQppQDQVdP4t5xvqsgX/LqowlAVHJiSmPxzzt0KH++D3T3PssKc?=
 =?us-ascii?Q?oCYCJ8tc3/kivLItcfaLQoAdjsX4laozCwr0VdyIFQkxaYNdvseCx6tM7p98?=
 =?us-ascii?Q?1jnFsuYdR1UyFbCP5xL1z3P4FUWrTZVkdbazoPXTqmG5tLXVUaOW/mLN8IeY?=
 =?us-ascii?Q?Gq4E293u9JZRpvLlcAv/dwfI1JN8UNDxHKUt5Xu90jhI992li2rKsrF/uYma?=
 =?us-ascii?Q?0h8aobsQ9boZ5jU8IuUct8lPX5AA9+/0aDmLxRms01AyA17py9JXiLBzlfmg?=
 =?us-ascii?Q?ckKwUcty28477uGvy8k+t4A2HZdShaxglYuFu0kdnN9PRL8HbCkbBazoKAXo?=
 =?us-ascii?Q?uK+Pi/rBud/vmMF/+/2IMu6MbBBx9Mm7VoWdEwEb6aVKVtrgqgUygW27DHWj?=
 =?us-ascii?Q?XCs1CMTOjIYGOKV+2aBUDNIYmi65NrNQc0e587Rae/FVxfRBll28paeMJFPI?=
 =?us-ascii?Q?68OiYDLykarF0ifnxMmlsWirPqO81uOo2Msk5ampfvOG+bIUSFmZtqG/99QM?=
 =?us-ascii?Q?7Xk3AuL06DlVpU5LB8dtYkVGejSaiLZEtOUn9+MvGC+Ea+Dlo+9VTGvBdbnj?=
 =?us-ascii?Q?cD/I2f0DZj1CbjdKMr1XE5qOZu+64lxgnysw22rXlqzZNXck05s0Buy11xVd?=
 =?us-ascii?Q?UZFpubq2vwagFAK6xPjTWLIhBoV6JDrJyWa+xyKnmEbZoijpCWWIvjsd0hI1?=
 =?us-ascii?Q?JppS8sPDeF98S4JaH+RYycXNkdFL3SeGAXNDAhnTkHv5px1PK+zBVM0A0MpS?=
 =?us-ascii?Q?N5On7mrvxQ1Q31vqXw2i74pCIHFfMr8uVFbCtdHxh5EkkUfpELvT3C2q1vGz?=
 =?us-ascii?Q?X+siDt15KBvgC9TANQRaHmzKmdcTW2kC2cRhDT7T2MW6EfTS1NzSVP9llmRE?=
 =?us-ascii?Q?N8GtQ2LqEcoGEsASUBhzUkp6JWIuzY9G2lxdQ1XA3J9zysxb6D4hLMOpc0Cn?=
 =?us-ascii?Q?HWGwrk66XDlQXJkao4e18lTTWsuksSMaLc0OYK1XeML7ZINSVeTEjUAwlCPK?=
 =?us-ascii?Q?+Ee1F728GAq4mw9CoZlwWzemAludQHmjzhWpOP2ZaURAfCrDOvqHT47Gqvh6?=
 =?us-ascii?Q?Jg1E9bIHIFNYjJyCi7o4kYRiZWeguU5xSZ0mgf3g5V+fe1vX2s4WsGC1/vIy?=
 =?us-ascii?Q?KmXaoZu8wQ2w+X9Q1v8kl//y6WUR3z5QxBgqNN8+Cb2ecguFd5tLZacMVfoT?=
 =?us-ascii?Q?1DcBphBB1NCVLi15AjaY9BApdnPVKFTerwpCsYSP8/RGbMFHg6+Nsaumo3fb?=
 =?us-ascii?Q?2aD2BcNqOuIp1oSPwCRcLJjStfgUnQHqrws1jRP/xIDTjbH/0Wf1B7Jec1vI?=
 =?us-ascii?Q?XjLvBbKvhp9asj8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wk70uwr+aKk+7lR99z6sjVLVMljNAc4598qG00T0rVeNxeTb4FL2MLbqUIho?=
 =?us-ascii?Q?i7V5a0rG43E2KP5nI9nxoaeRK2xW0ZyELB2Sa8GGiNsrp3ZpSaNA4fpSjOUG?=
 =?us-ascii?Q?BHlGKwoqlxeyLCv62mGxGcJ8PnIw65AIEFfkF+e7K81LaHzv9DWmHg7T4xOy?=
 =?us-ascii?Q?IpAsTy9nvq/OFikIeZZVCk1cQVc2yF3nNCQf+4EWi1MGapaPx+HxOMuvQ5YS?=
 =?us-ascii?Q?OOIqh2Ch7WUCFY+Qs3pRE35enAW0rW1aWf5j7RePMnOvlqsa7K5ppy8hHY2E?=
 =?us-ascii?Q?o/EW6zLecG3tb9ef46xraaIh6+5uZYQGFWVvsTGQZ70kzD4444AFnqKbkk8Q?=
 =?us-ascii?Q?yOfO+x430iYo/Y96JE5hB2UsFcv8OjDWgyi6ZDxBUUwnaaOCCNBAHOyXvVE5?=
 =?us-ascii?Q?b1xNGpWGwn0J9P6b2CRSiGmNLMKcqRWhdMIksAXxxjT2mb9YU8CXdqQuLzCR?=
 =?us-ascii?Q?4p3fthjmcfQHA+dlcRHJz9OEaDNjuwG8kyiUHv7oGWdaNO54874tFDAnfauW?=
 =?us-ascii?Q?h7IjVTzwXGasy9wqQwDUcD26R8tD2BlYmXHB2iI4+XWgjYXTvAjKfmEzMAmX?=
 =?us-ascii?Q?ntjTsF6ta7pwXUem51ozbd0w+OlHP/nu72P0ldiwo7MDaHuy2fYU9K/a7Vy4?=
 =?us-ascii?Q?NYOjchwl/ZnHJSAyhgU/OB526VslHGFvkvmlifGxXrEBx464UCJEWAHt8+2P?=
 =?us-ascii?Q?oRie1HSOyu/e8xv3Nbpt//ZrzvkTXLDlhTd0fzUB0fmfcu1shM3yKWdvXQj3?=
 =?us-ascii?Q?VJ7d+w7M1KyuXUBwOky9e4H520bWlgAVjvSEFUoILwMvUrGWbmufavaUuY7e?=
 =?us-ascii?Q?hbq04Ev4DrFwi7s4Yy5HuuV6OCNVJjcm2AO26YQ00G6X/b59ByRvgPfT3h+K?=
 =?us-ascii?Q?XpSKQULRlT8wIPfQdpo8hKjvqmhXFy7xdJzibAjXu0QkU1UeNqvbhvvPag5B?=
 =?us-ascii?Q?ks5AgdkfkXKtR/UIEzaQGKMFkY0gLPgDSUY39ct8IQ/MWvuAa36/RLbQEY6V?=
 =?us-ascii?Q?t1ZSTbuZBxvjs5wIY5yZs/7U77s8a9hOpRJZwQzb8JEv5BWGk3/36sbzJzVX?=
 =?us-ascii?Q?nSSHLoy0Fxq2kOpYvZeCTfjQ3bCVFCy5YfU9TyfStxbjrncBwhyfSWGaQ6b6?=
 =?us-ascii?Q?KjdZ5nw6OxmPBN+y7qQ7HHPA06t6PjbPDfx8GhJU7ZtBxofpnHuJHtqjdzBA?=
 =?us-ascii?Q?FU4oOYfD6lXDsbe9oH1hQ0ElXVtaPniGydxZw/0gRpetLoqE8db2+EnseyDI?=
 =?us-ascii?Q?7rVChEf9aBzQljCW08t704PTDt01uzqs/Hz4FrEX0h/yMgl6h/HC26HINIo3?=
 =?us-ascii?Q?EnddkJF+Vad+AFI1MafPv+LtxacJhNGmjqGR27vkn8qhJ7q7/uulTpYBxa/J?=
 =?us-ascii?Q?9xIhG1/iceLM1XrQ9WZDjeHJoQpzm+Yvvjr9AThr2dzB03MpDwL8+bHeWz/o?=
 =?us-ascii?Q?8JcJDMvjxu/fyuU6A/0oomFDHIhG4/S2C82wP/ZIOLDsMMFu0pNuGmjRbr68?=
 =?us-ascii?Q?S1wCj38pd3aGiELhMVsbPgBuT0ijG8e6KPWm9wjsOJFE8dKwUTZ09kTEjd5H?=
 =?us-ascii?Q?Zzq9IL9d0v7UqQJJ4y1OfN28g34ip7tO9stXwgjO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19793c6-99b1-4744-9607-08dda3a2d9de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 20:03:19.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MxQPkaezBs7RKG+RBSwd+UdcQAOZTuSrkVRIIcCKame7N8X1eT7drTU7QVvxtrZtPag4SR52KmGKgpiw7x+zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9653

Add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 tpm3 netc_timer and related phys
regulators pinmux and related child nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6886ea7666550..45015325fd47e 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -77,6 +77,29 @@ linux_cma: linux,cma {
 		};
 	};
 
+	flexcan1_phy: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		enable-gpios = <&i2c6_pcal6416 6 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&i2c6_pcal6416 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan2_phy: can-phy1 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		enable-gpios = <&i2c6_pcal6416 4 GPIO_ACTIVE_HIGH>;
+		standby-gpios = <&i2c6_pcal6416 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_vref_1v8: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "+V1.8_SW";
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -204,6 +227,11 @@ sound-wm8962 {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
 &enetc_port0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enetc0>;
@@ -212,6 +240,20 @@ &enetc_port0 {
 	status = "okay";
 };
 
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_phy>;
+	status = "disabled";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	phys = <&flexcan2_phy>;
+	status = "okay";
+};
+
 &flexspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
@@ -231,6 +273,38 @@ flash@0 {
 	};
 };
 
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-reserved-ranges = <5 1>;
+		#pwm-cells = <3>;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	i2c3_gpio_expander_20: gpio@20 {
+		compatible = "nxp,pcal6408";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x20>;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+
 &lpi2c4 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -378,6 +452,31 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "disabled";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&lpspi7 {
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	spidev0: spi@0 {
+		reg = <0>;
+		compatible = "lwn,bk4-spi";
+		spi-max-frequency = <1000000>;
+	};
+};
+
+
 &micfil {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
@@ -418,6 +517,10 @@ ethphy0: ethernet-phy@1 {
 	};
 };
 
+&netc_timer {
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -484,6 +587,12 @@ &sai3 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm3>;
+	status = "okay";
+};
+
 &usb2 {
 	dr_mode = "host";
 	disable-over-current;
@@ -588,6 +697,20 @@ IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
 		>;
 	};
 
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			IMX95_PAD_PDM_CLK__AONMIX_TOP_CAN1_TX			0x39e
+			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_CAN1_RX		0x39e
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO25__CAN2_TX				0x39e
+			IMX95_PAD_GPIO_IO27__CAN2_RX				0x39e
+		>;
+	};
+
 	pinctrl_flexspi1: flexspi1grp {
 		fsl,pins = <
 			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B			0x3fe
@@ -628,6 +751,27 @@ IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16			0x31e
 		>;
 	};
 
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins = <
+			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL		0x40000b9e
+			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__LPI2C3_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO01__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
 	pinctrl_lpi2c4: lpi2c4grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO30__LPI2C4_SDA			0x40000b9e
@@ -656,6 +800,15 @@ IMX95_PAD_GPIO_IO09__LPI2C7_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4		0x3fe
+			IMX95_PAD_GPIO_IO05__LPSPI7_SIN			0x3fe
+			IMX95_PAD_GPIO_IO06__LPSPI7_SOUT		0x3fe
+			IMX95_PAD_GPIO_IO07__LPSPI7_SCK			0x3fe
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e
@@ -716,6 +869,12 @@ IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0			0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO12__TPM3_CH2			0x51e
+		>;
+	};
+
 	pinctrl_tpm6: tpm6grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO19__TPM6_CH2			0x51e
@@ -729,6 +888,15 @@ IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX      0x31e
 		>;
 	};
 
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
+			IMX95_PAD_DAP_TDI__LPUART5_RX			0x31e
+			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
+			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
-- 
2.34.1

