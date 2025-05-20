Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2108.outbound.protection.outlook.com [40.107.20.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C27256C7C;
	Tue, 20 May 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741934; cv=fail; b=A0AdVy13X4qpmy0kGmit24mez53sDULeI5WnQY+VE027iuZQhBsXk/TJ/HYPop4m4Hu4xXAev6qGADVJV7n401xYTkxWqmGJbCaYpN9U1jwr7Q+6gEqqBlHpQC1y7gvErwdgL8XrqBolTdEHvFUmsPoD2MSC9pUgVoRHzBDm8ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741934; c=relaxed/simple;
	bh=8dnzEpH8w/72P7VRhHxvnHy7VwrPmcaP9V00Bg+nn8M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b2GmgKT0dmks9szL24b1VKH+o3qMOuvzIH9hOowjOeYO2JIxTMGFYBqW1Hf57ISpw5wfQSRKUQq3A61iOqbIU1+NrW8khhgyl41NGVWDvbbvGyDGMNQAUNqzyrsTqOxyeXV0B1Ehap6mBBi9lwGT+7JpmZCMeaXvSrI0Xl2YfEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=iz9aPydt; arc=fail smtp.client-ip=40.107.20.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="iz9aPydt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8VAEwefSmdLyQYbKo0UNOVDX36AudQFaD8pidgROMZQ+H94DeqZsVXWP/iIJccHOzlbRKVTeX9JlsE4/3wxbrd72hQT8bb10ccj310m8vHoRgkfZmnGI1yZ8tCJJ7SyUOCURt0szB+sLf/DXMzhx8O6Pgq0LknAvkuWJdkEUUYvAsWEfK8MK9g+aHzB6T9pPDR1mu6gzMmqz0MCjpvF2k2yDupSMOxjyzmAHxV2OoxSWwwxwA1zBCO0We6TZVokBflR5XwXw0gNQ74brLvvnwfgqgD0t6zDNR5rYElp/hBkUoxOFJo3IHuhnA2vzGoSbqNmLIoEVCtAhRwPSsLx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghLxwQaEsPNUXjvQ5ZQLfEFInqyv/lBqfcO3Js9ORio=;
 b=vdVNZOmApd/5bKvg0dDTCpwDmL9InTDwNJaihiYDZD7SW4qFvaUxfUBCUmbP4TmGklTjOCOpKiIyv7x1FpR0JCVNOmxt4dC24N28h5obzQPcDUE2xdlMVCkP8K+Loo3bwrzK3RYibvlztX02Nt3BsipCZ3dZuKqM+ICaEXIKsVZXzi7I+Yj6cWZK4D42jZA8aqF3Yf4TR3QhaWg3q1BXLcOEoU5Su6DQYzDGjORE7xlnCe0NL6J2Gz7L1HPGt3Mx6ztkzHvE3LR+y56J704eiDjBWNedWMMrkZWmwvEMzBuRZZ5nsijC2sThzWYTXICoUwrM5rfZAAuA/fj03tgt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=norik.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghLxwQaEsPNUXjvQ5ZQLfEFInqyv/lBqfcO3Js9ORio=;
 b=iz9aPydtsiG0YGZy2qzSZBuQJsQOnF/afO7Qv5QaMFuzIIQU5kCN/Im5hxzGc/PZWSahaBTpq+p7arxQTdwndzbOC9Nj9kGrut+k/zcO5xwqj6wW4ulfiE2fH4FCN5OE7oBDZSPUafTD7v6J1Ycm2L8gpzR0A4SEd/J4LlOvGAUv+7Bq3fAPh5ux7Mhr1n+cjNVYdtmVowXW5L1duraqXntxzKXaPjjHrYQ8atgdZQHp0U1X1oNl0VVQqvixrCG7K5nIyb6ADyuhqHh4GSZEA7Yz+iW/VlwAqr0eOuQN4QVr2PwaXS2b/Z6qPHdWsH3Piy4nTNheXKVnhpC78viu1g==
Received: from CWLP265CA0336.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::36)
 by GV1P195MB1786.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:5a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 11:52:04 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:401:57:cafe::95) by CWLP265CA0336.outlook.office365.com
 (2603:10a6:401:57::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Tue,
 20 May 2025 11:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 11:52:02 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 20 May
 2025 13:52:01 +0200
Received: from llp-stoidner.phytec.de (172.25.39.157) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 20 May
 2025 13:52:01 +0200
From: Christoph Stoidner <c.stoidner@phytec.de>
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Christoph Stoidner <c.stoidner@phytec.de>
Subject: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the phy reset by a gpio
Date: Tue, 20 May 2025 13:51:43 +0200
Message-ID: <20250520115143.409413-1-c.stoidner@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|GV1P195MB1786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4851b1-53a5-4e27-9606-08dd9794bc18
X-LD-Processed: e609157c-80e2-446d-9be3-9c99c2399d29,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tUWN0vs06IHdU6Qd4ywS7Ll6z5ow0UFZLkBzpBygHpx4PIc/IZH360wgjrKk?=
 =?us-ascii?Q?B6FlRTiSoD7aBB0vUf+/0zLu43LHTbPF8QeXCHtM4TPOP1ac+1FPYNOgK3Cp?=
 =?us-ascii?Q?IBkxWrc/RSIXPS3R3ihVlaU6gsjpppxQ32i6EgTBAYl0rUu25h0bq9jkhVPF?=
 =?us-ascii?Q?IRCpUmvATM0KqRffkzIqstaEpEzT/EUIjc/5t+SkXmcjZbAFxxcJz63ovwbf?=
 =?us-ascii?Q?CwMCP4cjUomuAlN7R0ZDte3PoxBzGCTjqpmpMPkvogFknldz4WCQe+0jFAhD?=
 =?us-ascii?Q?88PQOuIbUfyw28U0ezI6EZZWYPtZjAi8/gz9MyBPVNY1rAGBByJJSfi65l3y?=
 =?us-ascii?Q?+RVkBA1xGm1VzgJQi5s2K97kIeEmldDN7Qc3JhlxlSW8gBgPY8Y4QtpezJcI?=
 =?us-ascii?Q?FBPzZhgpkqWuFAx7UaWQyfe5VcwPNPOmqkyoZXurVHuFgTfcdSzy9Ucm5cAT?=
 =?us-ascii?Q?GsF/QXv8aqL25j1KcLhkftKTLeeMYD9aWjbX+Aspwp6XeXFrdtvIt9lDWNmA?=
 =?us-ascii?Q?4w3rC8a1jqpuTlCiaZYpdNolzD237SbtuaPYuebcaMy63f2t1eFcvMl5PzAT?=
 =?us-ascii?Q?58Pdx4O7ffUtHnmjgq+18/8HlPJrvalitsb6YGQKNruMeEqwC3kUfPKyw6QT?=
 =?us-ascii?Q?Ts5sDTbEBEKNvr3us3d+dpa1hZcq27ej9uCuP+2IDlP/iNv9hKtiBP2+wcpq?=
 =?us-ascii?Q?fjp5hJ4TyWySZ4kRM2lkAD4OKALw+676uVVYgPMqjAa+tUWxZZSfGFLcxxID?=
 =?us-ascii?Q?eDXvlcgs07W/g8ZindH3+dVTSz67v34Uuo6/ctS8qpT9jQX9gtafiYtqZ3/1?=
 =?us-ascii?Q?QFxVobqmJ6FZ1sKEhgr8rafSc2r3kie2/ULgJGokWKqajqUSicEH/uBVAf7y?=
 =?us-ascii?Q?uQJHNrAeOVeY3PqoAZiVIpfKP8iMRy3o6l6P9NXP7RFlAHTfv78s16qRk4Os?=
 =?us-ascii?Q?1iGmXsyXO4Yxm7vslPfre+cQbnJPGCAgIsySbTiLvM5O9LGknRJEjo8wT3Uv?=
 =?us-ascii?Q?S8qxDsf1sWZmqzFcBmoPg2P7HPPvaYHfHd6iU+wSrB1xeVLHdrj1e9y0BGFH?=
 =?us-ascii?Q?3dkntSboNGJqFJM7ofJ/dO6GG6y0t4wZvNCgDkU5/w19YXtDL28sTg1lYW2W?=
 =?us-ascii?Q?TFrDNUphLrJSz4pe7qIh/ncfDHrwLFnC4xp+GZF1v/E7LCo6HLbTDs1ifvyq?=
 =?us-ascii?Q?DNYl7Pox9VyPy0Ex8+YYQmfITCORFUHb79TtcftKc2wOneFvBGk32Ev0Gh/i?=
 =?us-ascii?Q?UO15m9r9Eyax7SGpKmL2rCqeaWC4ZrS/5139pzGyvzEZJ/6Q8Kz5fGZB9Wld?=
 =?us-ascii?Q?Z5g6yl+VJ/cOQgME4id8Zt8LyAEMHeku3h5Udu6m60hjb97kGnN1/DJ0+21u?=
 =?us-ascii?Q?W7f77FavLYl42eaP6CcYk5tpxvd4h8jIACgmh3j52cZ7csDeBB/UvJEiQt+6?=
 =?us-ascii?Q?vfvtENeQ9vqL+DU0MsCl0ClxRBnpfys1xJzI2Ri/1EhuSZyzeLdP1Gm5UJC8?=
 =?us-ascii?Q?DBqgJBxE0Heq4Z64Zri5RF9MDKw5ilYiZCqJ?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 11:52:02.2708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4851b1-53a5-4e27-9606-08dd9794bc18
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1786

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
Changes in v2:
- remove paragraph "Fix this in the bootloader..." from commit message
- fix checkpatch warning


 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 88c2657b50e6..c08f4b8a65a6 100644
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
@@ -91,14 +94,17 @@ pinctrl_fec: fecgrp {
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

