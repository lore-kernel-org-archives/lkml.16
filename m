Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDF1E1A3F;
	Wed,  4 Jun 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067409; cv=fail; b=da2BfcI4bSpSzme1qQ0m6adeqpGSRDO11aKEGGkLUQ9lOIRSwVCVxv6z54VFK+klDvlLaJ4lsvcJ5lfSBFvrHMBOh6xZj0H3SIGCYWGfxPW6KElveIq6bfInr+sRyIsGwqnNqyiE8q/eGQ/ENVItXrJmWUk4RXF0gtxHpcLne/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067409; c=relaxed/simple;
	bh=3AIoZv4gqtfD7gtJH7ZvI/2O4eRCeahCAWesy9XS1ZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDZaicQjabaiDeurGUsafwu6PWTpiHU0aZMD7uhBO+RLJrHecT6bGZ7Vh1L/vV0xAskvxeB52IQgeD5oi+N7UcxZ28LqnhnCAn6VCOitfsDd/U6XjJB34Ms+3Nn44yFipcLpKPNzh0s3OaV0HSIbcK9JsUYxXZL7cnFDEo9PZ7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fo1dtnFk; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fo1dtnFk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcOoKfbQXOrGHJ9cSXVUh7tf8QQswfjtwJvDennXM0pI6Yu/NjKmbf2DhpCHhcZl6ZKlSMzY3T/eW/irVf1+tGrtEGtwDbudk2igqJg4eKG3h+gC70mf8sTgZEqsxiDlDYFQqefT+XSHqceijX/Ft09IZDNFFCClMMY3i3gIULWhcbXo0rk5vTLjVFf7wLw197ouWWNa6+8SJ1vkw03nkglymJjdMQl8FRKcn4h686ns/g3mY3fyLQ9e4zYKWeOWs0qk81F++xFyLYsvinmIXT8K43tb3LkTLRqSQyzGr7WdwiWyl3IWahSYKL1WXcABETkZccXLvy5bD879HoilTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5epM74oN+rw3msmoOdXzV97Cr0G/R1bNZL2ErTkir8=;
 b=tiB8ATTPtZFetBM77DuzkgQzirCxgI4b44g2voGuijWPt6HB++fFkV1/EyWHDKN61KpFImTULePz47t3PQ1vRWC2CYQ2eIj+KTeZvlp2WdgnzfT90GlwsRSo9p8hk4JsLRC6ZY0dzSi73hbcFxJdW68ifMneSewldo+0ybHKOkx3DfJruEhwRAwJP2lEG/xGy5LwaC07OO9pROzlxEdduTS21uv7DLw+o/XOWrXSAFIvM/84j8P4wcCKu0Qj1yuiGWF9I+MpPd8hOAZdcox/f8/LAse8JemmfDblGwKloy2NMFO1uFO6VIaoN/5qFANYktdjJPxMBmccDrOlaNBNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5epM74oN+rw3msmoOdXzV97Cr0G/R1bNZL2ErTkir8=;
 b=fo1dtnFksoV9WWKJcY1J3KCaAbxcwLxTIt1AlT48vdEtAcBU/DdEbbBLhmJlMIgsBX0DpfqlLoLBqQJvuqtVu2n9I99+JLnmm/oJk5nLdvlRKmkh1aL3sewUgAyIY28sqbfZLbHOr/W30naequ8MlzVmvpH2zT1098ECEFDpKqqNFDcPtJg4p2oubyw3KgVH4fV97LCTQPgLswaNimwnuNvu7g0ynJwpoMY3Yutq3+3hCUi2p96jaP6goQRnntURad32UN+PwtOzwZAh1xr1HkHc2f6U8Kfrc8n2zm5ltCOv2QEfXJXG9+WUpCihqhQDnoVSGMHym4Df9PxmZT1Y8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9653.eurprd04.prod.outlook.com (2603:10a6:20b:475::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 20:03:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 20:03:23 +0000
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
Subject: [PATCH 2/4] arm64: dts: imx95-evk: add USB3 PHY tuning properties
Date: Wed,  4 Jun 2025 16:02:59 -0400
Message-Id: <20250604200301.1192096-2-Frank.Li@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 75699b8b-c08d-42e2-1303-08dda3a2dc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qo05wnUSoD3KcceEbtNU6b6YrF7I06vTKoZoHSppc9JDmaCwNuB2K6nlHpOk?=
 =?us-ascii?Q?iExH4ABkF+Cvo4+ohM8Q1H5LzonCLnb4Af+BnLv18Z5uisZyWZmJCb+yHyiI?=
 =?us-ascii?Q?EcTmvGB2XYA47wdkQMH8zQUV3gewjtO3ABm6BftxyDdpVBUax2c8TTglH8hI?=
 =?us-ascii?Q?ZkONZXEAbQyke/jJxG7rW++H/m79R/c/9cvv+y5tx/5lXWnNweO5MTBVSt7w?=
 =?us-ascii?Q?sz+PeTvzZy5IO64nJgTLSKY1o6xDpOqXw47stMFColLQIWGE4PKUEJDCggC/?=
 =?us-ascii?Q?avZkiFxstyXN/mymqd7X/Atif3+JrpXFdbNwj0w2vKKwny23fg1PkBRb8n2c?=
 =?us-ascii?Q?3N0PSsRvb72qkKVQA0bpWtw/mL/GgMibLNNEfBRNGPXr4O1E2wtTJmnf1UGd?=
 =?us-ascii?Q?Tqe4pSeSPbvyzeI3KJMsK7Qedgvh1x2TFd76dhCcw5imV1wrEMV63xZzsv6Q?=
 =?us-ascii?Q?4Qfu6c5C4IbIxy+2i/ovI3FTCVD5l9zU2XV9qE+uxJvhKWFL5sFutVtsJdYi?=
 =?us-ascii?Q?m2e0pG6Ys1Mf7+MNxs9nULSPCXQ45Bi+mT13tBCMz9BYhHcETsBj4FCFdftD?=
 =?us-ascii?Q?Ho8vBjR/w9ZwKiIfQc7vf7UeE66Wj4RmPN0tZ6Oe1Lzsydv1HfeSDn74s4mh?=
 =?us-ascii?Q?wSJXh7jjAE4vIaD2LEqwQdAXRAYToj0ma3PbnfkFkc4XwzUC55oyycqLcUJ+?=
 =?us-ascii?Q?pLaSy/PF/qTYrIrM7An/U5iEulEttGi62uHv5X6bubCu9OVbDQwL/kKQHCmW?=
 =?us-ascii?Q?Dlv+WNksufNBVIcNduCi8pXAF/qfAisOT+rYVowbcVs5v1BTCbcSuybLhnkA?=
 =?us-ascii?Q?m1e/7OyA+mDeZNa/cyTyFXTJwZw1PH8J/e8HbI24eouL8I34ZirHZGJ3hKp4?=
 =?us-ascii?Q?mSNYZmQACIn5Hf0taq5xd02wMBS1N9hQljyqUhcwT7Us/Y5dM10lo6+qa3ee?=
 =?us-ascii?Q?6rdZPJGpzRLxQPxl29lg/AoXhTcsZLwH9+ln4pgfZA10UUdcDyCklYsy3v2n?=
 =?us-ascii?Q?WIZt0VtKRmkOOc+7YLBZad0DM90Dhx5wEc93qPn5yXh+pHIgEmQ49QGmc6Dz?=
 =?us-ascii?Q?Y841JzQiQPOq9iPVEHLJJ1U0DlkYIhypGAJ2ccUcKm9yosbAzhsUwj92HbOw?=
 =?us-ascii?Q?nmq/0nJlcBp7ubZ+tuMseB+p1FsyBQJQecgRiq/uRc7sYh3deiBuJ9s8UupW?=
 =?us-ascii?Q?SIpAmoD7NAzBYu0Vs0eS5x/9bOG3lydVNZLjFP/Es6JsWoroOMoeot2f7aVL?=
 =?us-ascii?Q?7viMFiGLjd0sqf/LdriHaRHlHZQ9kisRma2aqVyh+757TdmhiaJxLzL1M1wx?=
 =?us-ascii?Q?MslRWAYpNcUS8knC17sX7bNl4XH0exSBxoclAfQZ36Qen+Ulfgu4/zKbLkGt?=
 =?us-ascii?Q?sD+xKFlfaV0WHNmrROkT7jbo26UosmlF5NZERnN+LIDPae/pfv/K5bPErkOG?=
 =?us-ascii?Q?c3fG4SorDbNrXsBu1OMHiFE2AP1c1nTZvPiF+mtb76UoLthzbAR5aw9EEDsp?=
 =?us-ascii?Q?ZYLcr9cVG4nqI60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9C2oScJrRfhw+9XnsnVwIb/dea8jQaHXgVde6gllo6aZurhu5SEqUD5Q1urF?=
 =?us-ascii?Q?kH2vPcGpo4u0nWsFq+xkkkwaxstUJrc0K7WbledxaWxAbZoQiwcKDtFD8qwU?=
 =?us-ascii?Q?9YSZ9U9YTAliB6iW1/OxdESu9Nv3YWjAF3ZHEsKcqSkBBpS+iEj3nEP2INIn?=
 =?us-ascii?Q?heEGAFkfO5tOqazcRzXuKS+uWizwcuJYEdW8398AmDmSJeRAigmZ62Z1GGqn?=
 =?us-ascii?Q?wJVCo7N+lfYnJiziFqOI08LaCs7j1e6MrI+g1jgbJP8fyzDO3mZdqR07p5cy?=
 =?us-ascii?Q?bOIGnWWlh3vbryaW7qFWnjPCMyJeO2M98r/fYgiVnJkd4Mt+byZMjE9Emxom?=
 =?us-ascii?Q?y+eXM1vg2oVHn8z+Ul0SGbOLoUxbSol8PGFrWq8e5mQZgwBWTU2ty0VE8vcP?=
 =?us-ascii?Q?z0KAHroI0pUsVEUR0Ea9StS2lEeTEHAuWM94sYiMzz0bI1vOn1AFQmZwFqFm?=
 =?us-ascii?Q?uP/beiAmYUQPiut7IykF9d+pSJ2HU5mfuJMO3OTdj1WCgsm6ATJJwyTHq2U1?=
 =?us-ascii?Q?cXW6B6ssKxpDhOPlTmgPSXQhNXWs2NGfmwPDkL5Cmw6LzKuXxcWbdZkNspGp?=
 =?us-ascii?Q?ExCLPzenPC61lmAcq1K0pXjfDx5A+ghx7CADhqPsI7jAAfQ7seCK/bZeIOhN?=
 =?us-ascii?Q?cqrxuOqLB3yit9BnuMXRu+lVunVLYhlhP2R1QW6whTbKSS+ioEYCraV83w15?=
 =?us-ascii?Q?EPLb8sdnd9ROeNbk85xVBURMr2zVf+AlEMqm6XZE5ekncJprHu2mw+y1Y4aY?=
 =?us-ascii?Q?mGG7FjebLFQFVShfxD7oaO93jFLT+9ewcY1dJ4VS55bmgnQ7z6gIPjSCny0/?=
 =?us-ascii?Q?TXN7qDqVixkUGImek6jN9Msn17D5CS8YyVnCL6wmlPFk8TQih3pB0PUyg30z?=
 =?us-ascii?Q?RSoVvqch6mJrdNCtNysbFC7E7xI2WEdgxRsTVHajUO7/Ohqs/u7ZJNdWN0jA?=
 =?us-ascii?Q?C6c3n1i6h3UJ381fuFz/9yKQ8XScg08q/ixjlQ4YPbbiJZmzb9k9Wgeh4Xz0?=
 =?us-ascii?Q?FCl1NQjrMOi3OLhcmN01gtpOeYZH+qHPGZewlPvSptifCU3mMkYq8mgC28aI?=
 =?us-ascii?Q?lKp+BV/kfI0bnuiI0NXArtjWNzX4T0PrWteu7EhQflATBBhqYuxoQvweMbWf?=
 =?us-ascii?Q?pE5Sa1UHza67VMN4KcK74478/xalFyaO5QNL13EarLVWJVModUWNFw6T99sJ?=
 =?us-ascii?Q?5Hrc53ce4ShYxTSw/YPHCgnELqsPSJPhTvUU3ckpbjQ/weB58435tjXXZGQ4?=
 =?us-ascii?Q?aPyAiZ/yWI4O41mlJ97rGhLdeLKmUYrZlr5iE3tx0hNdZkOGFzZFAgGG+gLH?=
 =?us-ascii?Q?+8IlSs199G4oNfbU7TWCiuQiU1hBzxOkbm3HfSmnF0nHyMj3GnAfyyTML2Tb?=
 =?us-ascii?Q?R66hiEiT6jZ6HI3IMIVl9c22UwLXs3VNC5jCEherXNCJpj1nAV3hGJ1wXdMb?=
 =?us-ascii?Q?OItT6FUK9UxyH4tx2DxkRtT4GGr+Z6ADkCAiCVrtxS0jzKyix8sCLVPMp+kR?=
 =?us-ascii?Q?6zEeuSwS+7T8IryECmMVHd49LJiVJUorCHRr+r+ZVdQp/8y2PNJprSxyIIfU?=
 =?us-ascii?Q?vcAQ/ybsQBe2p5bgdWql6QihntqssTy3HH7FlYxF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75699b8b-c08d-42e2-1303-08dda3a2dc05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 20:03:23.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44zW2sMKyTOoCqDvLn540F4adWhmskVMZHRB6LEakk6cp6LQluaReq78//5vo80KDir02kMrKhlePxtSfe3GRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9653

From: Xu Yang <xu.yang_2@nxp.com>

Add USB3 PHY tuning properties for imx95-15x15-evk and imx95-19x19-evk
boards according to signal measurement results.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 3 +++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6c47f4b47356a..e54f3b982127a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -1070,7 +1070,10 @@ usb3_data_hs: endpoint {
 
 &usb3_phy {
 	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 45015325fd47e..cf693c86fd454 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -623,7 +623,10 @@ usb3_data_hs: endpoint {
 };
 
 &usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
 	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
 	orientation-switch;
 	status = "okay";
 
-- 
2.34.1

