Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27A1E130F;
	Sat, 24 May 2025 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748085819; cv=fail; b=mTIX5woxMt5Yg0PXcaWJA27gH12wjoP9cd+BQs6ygHtS3fqk30daY3OhXxiiI4uB9s17WKCr9dAvwOGZ5STuE/EMoVPGHikzuGPF2Qo2XGXtjCCBDYzzyzLWQr0E+I7qhrf6vDXHOfwQTP4KeGqroeYMutCKmoB14Y+wCycDDx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748085819; c=relaxed/simple;
	bh=1MJD7myIZtxYGvB4+YWQbNWuyUdp8wjCd9dWu2S1D0k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NgHHPNWMi87e4vdqk3w+zTTfWYDgNfRwSyEP9MT+Tm3WYxc0UviMQj+GII9EmRm82GClaUCQhlDE+pSG/gCLEyirapmGqOGwO4QYLFTYk1OvlY/dmwHBt4o3VsnQULM7pu0uht0AUVfzcSjRCJyDV4FiVqzx3ApVP07aJPg/3I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=u2dJ/Lv1; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="u2dJ/Lv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsJr7ZhErQ5GI4t9bAvu+Qa+rj/LZ7ccIx21u0RTqAS2v7g+gp08DTGf8LD4o6uUaNbg9PP1BLJJ6R2BXeqQZ/hzXN/bKr0j6ZggoR4hmvs7T5tNixwpnNDjNq98XI0pfnCp1l2GKReDgaphUtT3ssx62GXmBrAVkXsNwTfx37zpmZcSzfHcP8SFGqmS0gSp/aU+vtBT6c2BFZnjiypLKG3JIUDFikC6KAha+tHeugig8cNoej2QblkTvQlawXI6LNa79YKtt0EUyWnlxhJJMlbodFv6D/9bFtTHZruMAwEheBEOTPCwolhjRM/NwRie8TXqJnqYYSb4Lkvn09Yaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqEtNxXkPCfLE9lfWqvfZpKR+Cn0SjiqoEBuxWcVEXs=;
 b=PZoLGTyjg8aPgeF1SKSyU3eYDgw7f14o2ZwJSyXSOHazWmVvXpzPC1ZPf+Vof0hz1fAXCVBhqZlZpa00y8jCOSt5AVzTeHtc5kxBDMxQ1xpY1yaKjg2hqkZh0bZPAAa/3YZuEGFEehOicEAxqQUBP2Cdzu3vn57COf5ICYAYolyOT92xeoc0zX3MGzxQunajDxCcyeimUMxM7lj8zyhx95jCALnPfBqdHGVUquoV6Y34LfIzIGrRs1lC3KIv5jZyiWeA3a5lISLXYryylLJqNBjvMxyZth0dLfh5nVSTyB60O5kW0qD/T6JAjRHdzivU96u/sJnrZqJTqinezGkhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqEtNxXkPCfLE9lfWqvfZpKR+Cn0SjiqoEBuxWcVEXs=;
 b=u2dJ/Lv1xAMM/X6VbeOMuhzZ43CcaKBawvj1/Xur2B8Q7NKPqnJTmlXnolgzAD+aVcZIYxFoSimoc0u9NTVotvS1glhJLZpSEnhYE3X9It8GqV6blw8pP7caJ+g3XWpBOOT6X+/VE1NMlPEN+3Ac7vkW/aPFqpsPPu320qiq5fGuJnK7gKOPqFSUd9KNEW1h0rQACPeJK1px038AD89UzbW/mjZ46UGVLany07D4ONWON5dcLCV4iYbLDDhIZC9K6rigLvaQ+uBxzM438Xmas7/2udrVEPGNo8Lk2TFFeAaEbNLVRtk/G5wBh4T01yMRplMRj2S6FT9Yo2MHnA3HzQ==
Received: from AM0PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:208:14::31)
 by AS4P195MB1669.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:510::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Sat, 24 May
 2025 11:23:30 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::a8) by AM0PR03CA0018.outlook.office365.com
 (2603:10a6:208:14::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.28 via Frontend Transport; Sat,
 24 May 2025 11:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Sat, 24 May 2025 11:23:29 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 24 May
 2025 13:23:29 +0200
Received: from llp-stoidner.fritz.box (172.25.39.157) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 24 May
 2025 13:23:29 +0200
From: Christoph Stoidner <c.stoidner@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Christoph Stoidner <c.stoidner@phytec.de>
Subject: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the phy reset by a gpio
Date: Sat, 24 May 2025 13:23:15 +0200
Message-ID: <20250524112315.695376-1-c.stoidner@phytec.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|AS4P195MB1669:EE_
X-MS-Office365-Filtering-Correlation-Id: f559f7ff-101e-4d21-4f33-08dd9ab56923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cDu2jWnQ4TWGonJb+DCSg+dl+xTrSsxAopW7A6F1u2W8mnK1cATLivysyahh?=
 =?us-ascii?Q?YuH4MBe2l8tY8n+Tt7HWJodlg5yA5Me6eeiZJetlzcofzG6zNVz0RzgoyjG/?=
 =?us-ascii?Q?fS/fVcMfoL+bk5YiF9QUJ4r8XyzBYdY0zGlRwsd5GUWaZx1uqN1B+Tb/cC6l?=
 =?us-ascii?Q?oOE1tODjqS9VmDBtIoHuzugRx7ACsiHMT7YdrDOZyml5pY3j1CICPGYYdnme?=
 =?us-ascii?Q?uhTjfUUtQpeHT/757sj9Af4IiFpOW6/Hmvix7fO7JZROCGJ4CJRSRxUsIa4e?=
 =?us-ascii?Q?5yML3PfbPCPKsx2UTowTxNZ4SKj5VlikDii//joxNcRkFSsQERDVdwTmIgo9?=
 =?us-ascii?Q?k2pMELb6oTVOOdLj/0vBtpxMT7m+niCxv5rqjJPU9IIyoxBfZNAq4O608wJy?=
 =?us-ascii?Q?JlKr9c+EuBVkNP3qvuLJXyckt/o+yztTWgCrnxJZ/QSYryJdUnA3Xj2zJt/K?=
 =?us-ascii?Q?f0oYsDHgPwYXYkWrsETIl7v5U1lbPBLhGupv8uCu/me9lxaoX/CUXahEeTNW?=
 =?us-ascii?Q?mb0hPaMJ1UFSAHhfST9QQ3UjwuY300ka1JKtMp3HCvYSdD4NWfSSlwLDdoJ1?=
 =?us-ascii?Q?KhFQUb1QKgvbp+dM37JyvsRDX5A47UFSakKHPUpgEPaOS5YwZS8f1MtW3TQi?=
 =?us-ascii?Q?s4pnMzvZ2zhQCHFNydQFnU8fDGS1BLiD045VLnvfbYMJnu7K1pszMMSc8jBQ?=
 =?us-ascii?Q?8X8tLNFCLt6amNDk49t3HaK3ItPo/53GJ9lauUiv0A5kgRITirJ4IhiH/mip?=
 =?us-ascii?Q?B8ArCTLDjuc8J5F058REJZofd3SQg9s9z7uH5JE/ivGw10X9o6eMK/WJf2J9?=
 =?us-ascii?Q?WUox2qSsPDF2eIgtTcagZ6sFITF7mybyjohbC+s18bYQm/yYhEAOipWgp39u?=
 =?us-ascii?Q?TFBFPOk4ji0TU8vub/OGLOieaJr12kRfwSP7Rv+xj6Vkk0Op/ZJ+uQihTRxw?=
 =?us-ascii?Q?rWN0l5P6i2QH1n1faXSxSloijDDCirMtwgS9zS3SizQooWNBHgqf7LyxTToG?=
 =?us-ascii?Q?MNWObDbH3spX38Wz9Qfhwlgw3WrqEJ4us/GOq+sNVHhdnztgBfv5kQCWchbC?=
 =?us-ascii?Q?sLzyvc08NetgAnq3lkQIV0qpvjBWSoFp9CbNThbyqKXz4mdUzA1/RAp5wBEu?=
 =?us-ascii?Q?5MG5CkUSjqdhUafSlKtchak/Fl7BlLVx00UX7VbSsRavL+RKshsfd8nU8zns?=
 =?us-ascii?Q?yOUcPED8IzIEac0H3Ra16XgS/MQ+SkO0K3NFpy0fzQL+QHqqdHmgtppetB70?=
 =?us-ascii?Q?Ea2Xt7CFw1Ye8U/Kx0M7/a6Sj60OrPoZKOFhuJCRbz0PQ/38c9NUo/8Fo8KA?=
 =?us-ascii?Q?mCAzsT1mYIhcf22ENEJVMRxvEH+2txtfoWpVL9VPwft0O8JFp4PuQ3o2Li19?=
 =?us-ascii?Q?j9DYvUDZdjx3/6rg1txizHdNCN2VlS4H2VYaVd60Ae2XbpZoLDy0lxaBldFm?=
 =?us-ascii?Q?zWBjGFd9ZR/SzEAw0u5mTCWipxgbZIP6HXuX6lUqDVikG/kl20u6RHV5a1et?=
 =?us-ascii?Q?fYBasyzB00HNz9DQ9P7tu5VKMtiIWde+l6i3?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2025 11:23:29.9755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f559f7ff-101e-4d21-4f33-08dd9ab56923
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1669

According to the datasheet the phy needs to be held in reset until the
reference clock got stable. Even though no issue was observed, fix this
as the software should always comply with the specification.

Use gpio4 23, which is connected to the phy reset pin. On the same pin
RX_ER was used before, but this signal is optional and can be dropped.

Note: This comes into effect with the phyCOREs SOM hardware revision 4.
In revisions before, this gpio is not connected, and the phy reset is
managed with the global hardware reset circuit.

Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>
---
Changes in v3:
- use reset-gpios (from ethernet-phy.yaml) instead of phy-reset-gpios

Changes in v2:
- remove paragraph "Fix this in the bootloader..." from commit message
- fix checkpatch warning

 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 88c2657b50e6..b481097f08a4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -68,6 +68,8 @@ mdio: mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
+			reset-gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
+			reset-assert-us = <30>;
 		};
 	};
 };
@@ -91,14 +93,17 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x50e
 			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x502
-			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
-			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RX_ER			0x5fe
+			/* the three pins below are connected to PHYs straps,
+			 * that is what the pull-up/down setting is for.
+			 */
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x37e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x37e
 			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
 			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x50e
 			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x50e
 			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x50e
 			MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
 		>;
 	};
 
-- 
2.43.0

