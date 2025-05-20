Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2090.outbound.protection.outlook.com [40.107.241.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375915E8B;
	Tue, 20 May 2025 07:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726518; cv=fail; b=TGVq1obI781hUznlfdU9Hm2L3SyMKv2bFjX0qKffHpBgYClM0d+ZGg2ovVXTB+VQn8KX1eCuWj24VNzCYHAqBrFPv7YY1h7sNmwh24Qi16NoT2AdPeZl0KKCqRAtoKUgJU5dexPGSW0QvaXF2dHuNlzHBn+VffmAUF5m1pJiruI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726518; c=relaxed/simple;
	bh=3vjkbWSIKYSELWgg/Rsivq++Xa9abhK0W1svrGn2m8c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cyE2+T0GOd84O7b9iPRCBwrW8J+vsRLYXuUs1D7Yfint9Ff+8brE4kTZdlW7NoL9sofln1lqErxvVW+zx9kDCuCENfmP+JS3jzBxLo46zq99cJlKGMhFeCBx/dGpdk7zzL6leN3ZeYAc0Jp3l2wBp4k+LbC3TtyISPCCz2ZnKio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=rE/vY/Si; arc=fail smtp.client-ip=40.107.241.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="rE/vY/Si"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJULVp+19iNUgto+ORE05EwQbYHJowfb8kqP14HnkJAFk7D4Pc7jzzHaQgcFWTFn8pAkmyJ1UWKgZA8RtF+4au5Ww5odvSoIXSmtgd8F4fG5GTJ4yMojwN23w+hJb7DhQZoLdFZt6M44JI5AumOCVr77kdi2x0Bte78ZVPd/Bzcm9MDAWFhU2o807xa3hFSafOVeUEm7aVGybjp8x35YcmqCpQgxEnRrOZCOXTIlQggPa9rRbkQiEOlN+MPf5GyqwGhFx5+dw1bN6ww4YZ6lz9FxU3V9VdOVk4N2QtYQXmz1aANn0GxSGM3EsfxIcPwCUReaaNmGDysIgGLHn2RWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uZLHbxCZSGFaoPD2HjsSQPs1GfgUUi/JHnbAVOktuM=;
 b=K8HHznAWMnE62x0OCzL4ouI/BpTCmWE36DMAbAxghUZwlPP3Xumgg2OlF4w6p18cQtk+dHR4tcZmegnmxvkcr5FIuTBycawlPPrABg8LZa3e7p11UkEXdULkILFEKf2frlKVaKPzVem1FpoEobFuxorrM/luV1BIgBKbd9QqLu245LV2RJoth1rwVxXPW8yATZLZQWOH8wpTtonYc9qdM2KsvXIao3rZZFEPdW6ja91XgGBbxudof22hoGZu2XAqmjEpcub3KOe296epDuHoeNCMkwsxsI700kjTDey6D1IM7ErnAbSlX4BIl7gmTI17jw/ExPkNTF5oSc5bl0CQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uZLHbxCZSGFaoPD2HjsSQPs1GfgUUi/JHnbAVOktuM=;
 b=rE/vY/Si7DbU7Il6BBfCA4yafdMD6Vfq81w4+IbvCd81PE9YhKosh7a/qlX0/csMFURuSMYtaZoBZbOqOqYnRu8gAe4c1VgnngQUCz7AfA3R870HdHjJUdaU46dxq/fzSswecwN8rWroz8oGds3NUecLD4cgXI2IO8w80aGp1PK5NKCqlXH4O1sQ7sQ6j7L4PHf40prvhDFWagS3Vgpf3tfJJf4LVw7YQjlhX5bbMSxaiI8dI2mjbkSjyHtcGmr5oRdBHE/cz21+uWUUOWoTToMUoCgCwojWsviq6X4w5ZIievdur/95eGRtSaqEK/BfQ8krrt3UPrk7mdHVqX4hyw==
Received: from CWLP123CA0087.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::27)
 by AS8P195MB2098.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 20 May
 2025 07:35:10 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:401:5b:cafe::1a) by CWLP123CA0087.outlook.office365.com
 (2603:10a6:401:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 20 May 2025 07:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 07:35:10 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 20 May
 2025 09:35:09 +0200
Received: from llp-stoidner.phytec.de (172.25.39.157) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 20 May
 2025 09:35:09 +0200
From: Christoph Stoidner <c.stoidner@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Christoph Stoidner <c.stoidner@phytec.de>
Subject: [PATCH] arm64: dts: freescale: imx93-phycore-som: Delay the phy reset by a gpio
Date: Tue, 20 May 2025 09:34:50 +0200
Message-ID: <20250520073450.388989-1-c.stoidner@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B7:EE_|AS8P195MB2098:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e5bed4-d9f9-46e1-8f7b-08dd9770d9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VyWlP7/z/qRbVq37CoDUH4zigNdriwxSoNPsJitVUcgNDq7+Bv2OUz855A16?=
 =?us-ascii?Q?6LlX1svRP5p5CLL+U+Ni/YxUE4UZXXc2EA9Ik+lxCXtxg1W2DH8nAukACx/5?=
 =?us-ascii?Q?/qjdqM9r/+ItwTV+EZ5AomtJGpE557+OqE/rGCeJC1qmZVFHwUfdv7YYmyIr?=
 =?us-ascii?Q?D6B24dqMQWWsOpHFYpAymlS2F2Nqur9r773b1dMwTt8dslLeyl3wplZxseYT?=
 =?us-ascii?Q?lY90LuuMzBAzguEzMAoj32+gO2AgAtDXLACJHOumezf6sRoEOWhmRPh6LCeo?=
 =?us-ascii?Q?3kRrI7rBfwz48soaBEnoepvMx7PreOeRgKwOFGiaes8M6n2hWjAW8D0MB+Ph?=
 =?us-ascii?Q?oBCxb/7XIM93oP74EMR7E9DW5fGvnJmDK97RpL4eajcWsc+VrnPJdlkBK6Mk?=
 =?us-ascii?Q?+YCbKfLIHnnOexhHOOdKEOfrYFrQBFX0FZAoHNIo/waQRDbLvUZ6TpNeIoyK?=
 =?us-ascii?Q?L3hf9y11IrqevpRLT7flBP2cfEZ7Q6N09b2Xwe9+Gia6KPMq/J7P0LoLGJqn?=
 =?us-ascii?Q?RUhUr8f1ajkU2i4U8levdqTq7MEA4oGnHNVL7r5BPH5k0jlirhayYLKJnlQj?=
 =?us-ascii?Q?u1ntutkjAbHee0lzGfp7PdWgpdxzTFXnsn7/3L/5a7VajwAK0WVvW+f5GLq3?=
 =?us-ascii?Q?tMrJsf75S+hHpo7u46Mwxkdkif3qm3Aqwaz37Bucxu891ZoUpYaGVcpi7Lhr?=
 =?us-ascii?Q?9wmKMSU14uNY4kHphffP61MN87gmudm5CXaWcKh/KFc5G1IpE57DIoriiDHF?=
 =?us-ascii?Q?S5f/IopAduzUqOO+OAtiusDlYT/tq8vzxdCYgnr41cfVS9QJluTxdevUup+/?=
 =?us-ascii?Q?A3++ypmu7v4eB2MU8q8vjGniBYmscsK2bcN86+ILcS2oxN9GI0r/tg/36E9M?=
 =?us-ascii?Q?ErgBsQydtb3bsTPfH2ewj1Ec9YQYW6h4p+Mwm7Ax3oVToMfPju97VRimWynB?=
 =?us-ascii?Q?QDbrhSh2kmQpVPN0AUivgJToSioEofK6Ad7etP9FpMYuTBYWE+DcEgV+b9jI?=
 =?us-ascii?Q?8idVAwRK5sfPNNATQWDYlyWJwzCjURIlNY2Xctqdylkb+FSch5XAEyCl+qBS?=
 =?us-ascii?Q?YZ88NXayisl+gJY7qdUm6EJ4YQuAPLIezIPf/o+eg4U9W1r4nGfFrtf0DHZM?=
 =?us-ascii?Q?itE0lAh8Vvc99K0Wjk0bwSVCAD3mr7uLwnW+LHXAr07F7JybWYJkrYnnGIVs?=
 =?us-ascii?Q?L0xMnSJ27onzKJ24kZe1omo4VOxD0uex/MEEOBqze9WMbgcLB5a99y2RQSHf?=
 =?us-ascii?Q?hi+pUg8W/7ckT5rKMpfOzv2FW4qfgAlBkVjeBN9doLWLgNpkH0SuYbCB0BbO?=
 =?us-ascii?Q?8kkpdkyUoHE0DetiFQA+JWQzQNZdBlf7TP02floY4bMFbY0ZFghXkb+6ueae?=
 =?us-ascii?Q?YboAs8KowZLsYFr84ebElw3jXHHyntEEWog0BUZ8wPgV28H00W5/yFbdDXJ7?=
 =?us-ascii?Q?HaqEM6txaOPGc3kEoL21IdK6k8LE+NSVxEVP/LGHNrv/dFS6IP3YtLTaw54x?=
 =?us-ascii?Q?P9VtayDgZUI8BWnVwT+WvvrBmDMgM/7qZ5dN?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:35:10.0447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e5bed4-d9f9-46e1-8f7b-08dd9770d9b1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2098

According to the datasheet the phy needs to be held in reset until the
reference clock got stable. Even though no issue was observed, fix this
as the software should always comply with the specification.

Fix this in the bootloader, as this is the point where the reference
clock gets initialized and stable first.

Use gpio4 23, which is connected to the phy reset pin. On the same pin
RX_ER was used before, but this signal is optional and can be dropped.

Note: This comes into effect with the phyCOREs SOM hardware revision 4.
In revisions before, this gpio is not connected, and the phy reset is
managed with the global hardware reset circuit.

Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 88c2657b50e6..f8e2f3f3baa8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -58,6 +58,9 @@ &fec {
 				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
 				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
 	assigned-clock-rates = <100000000>, <50000000>, <50000000>;
+	phy-reset-gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
+	phy-reset-duration = <1>;
+	phy-reset-post-delay = <0>;
 	status = "okay";
 
 	mdio: mdio {
@@ -91,14 +94,16 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x50e
 			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x502
-			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
-			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
-			MX93_PAD_ENET2_RXC__ENET1_RX_ER			0x5fe
+			/* the three pins below are connected to PHYs straps,
+			 * that is what the pull-up/down setting is for. */
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

