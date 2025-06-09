Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1851C5F1B;
	Mon,  9 Jun 2025 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749460480; cv=fail; b=thM/GqyUnepPWFgcy+IuBM7EAoRxqtePDWlmLO2biHuJth/HHlxJdP7QCrBzArFaTh5s9qtTVBiAMzau0IzfqNy9DfBjc9cZrtrC856nyNyMQhmoa00oNpiqZBPQ7uZVdj9MARk5w+rU7sm7CtfTI2POc46jAsiQdjgJi6R8oRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749460480; c=relaxed/simple;
	bh=RWAT2+zoy2Ynea0faiejujeuEbahCItHb87bJ3UZyH8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BzSjUKC5aEGQdh8YlleKQ7/wFWhclHP3lAq29Cw3ZdaDnLCp/L3dAZ6hA4XekkXDGIg/kxEPiorhYa3nhZ9tGj1oljRabmKhS6CXFD54mNBOoCHrKcTPPTck8YG6IROKYlzcVmrpOVlZo8T4FnMvjLM9QPXiIb4wtbV7dKXSn/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BeHe+JF8; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BeHe+JF8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0fO7D3dWUZd7PVcI/yckLMBS7XGlUy7xmLoN/72If7EFNmoba68CjhH0I7856faXA21FK0fvwAkLu3zVOrWxjuMO5gYUuWbC0fdw7U4QJwefIaeyBzBN5oZFJn21coNkjCGoUapz7jsjuI00l/Etwr5SyKeMBOtn2J3OOUMZ1C8wVAY5ZRam/4L7s96fa+y6dETtfqw/U0Sm7Z7l8w0OxETufzjK+6HCKMCl510ykDWbjBKCcixFGMv+DbCxhD9Kh0foQbSFQIhm6aQ+08AWn0FGcJTAdBGXSeP7emBq5AOr8lXUEBNrT5AoZgVKrljBIWKH/B+600qfRbS5cow3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yYYzXRAs+WBtxNtVVl3v2V01HepfsNY2V3zxzzUWN4=;
 b=LZHr1dy6UuUW9nnv13MSdr41b7jO9+99SgWcBWJLBLltWntdqGRPZIzRPgiaZQOKlxNZhy/f9+rankEAtNChoxN+Xyw+VtVTEOx0D1wU9ThUDjrbZCtgjl0ZcLsnko9xKKVo4yKWh8V3pPjlqAW+J1OCkuXV3XpldbL3h99o/HzC2/TAhS9tdS4kwdiSdkF2Qx9xsJTA4ACQGgI7MIZtZhefT89sbxVR9WZ0OLRqz7Uj/rlD/UAKb+msALjK74PsCZqnlgqQNqbn4zR5Bk5AfLgTIe+BbFAsee29LiDfRT+5HJ/RoRwr7zkwZCAn+GBAVg8jOzq5JPtcbKUo9fC+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yYYzXRAs+WBtxNtVVl3v2V01HepfsNY2V3zxzzUWN4=;
 b=BeHe+JF8EV4wUy7XRoo3Tc8zikMbweyE8A1I8JRl7E04ty8WRzilOJPAEksY1p5/4ZchHHOrDF+k/RJ6n2KKt9K/q0l0goThFKA09FWnCukFlKbH+yJkOUniVUOMldA2O4fUYGsOzZR7aAYMg6V4VNHEoil5vP6ZMwe71ljDw3QwWLECECijOKywG2PFfWUN4FJKUnyx6aRYMwOaOiB2oXjIwLZqYAP3w3RRN1Wwv+20tUJHDU+O0VukuyT0gJxaWHHzQmLthGoS5Ghw5jgeBrawbbRtJ/ByWwWJyV0zKtkEAvNylz/VxRT0v/gS8KwQJxzvCW3WbT7tcIDpSYvdKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Mon, 9 Jun
 2025 09:14:34 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:14:34 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: imx95: Correct the DMA interrupter number of pcie0_ep
Date: Mon,  9 Jun 2025 17:11:27 +0800
Message-Id: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DU4PR04MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e41ff37-0f72-4461-5c5b-08dda7360cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qay3qFxtcTDyRqJPjLVeM/+Y17YrWnY1+i3uEad/7ZDKKLJQFrziCSCOWIU7?=
 =?us-ascii?Q?thRCYz4OVbVa3mqV/8w2sVG8NlGIY6qxF6eYq1uMCZMn1P7jigYqA1wu9ZrG?=
 =?us-ascii?Q?IYdtG//j3PhEyuoknPS0prOtp7oiOYpD0FJg/n9EFinw9aQ1/4xdB6y53NTz?=
 =?us-ascii?Q?OTHwzYd/pBFdAXDyN8YbFgXOXLxPbeBMPm2XPnIzyRAxMN6Ech+z2VthTFi7?=
 =?us-ascii?Q?BIlzDmdFsZJ+wbt1+Tbqk8AcuF/pENmPyGexNP5CsXBEdHt3y+JrF1rNrD+K?=
 =?us-ascii?Q?T/88w1YEAaIw6frq3SHlX/CkSDPOCDPtI3U4CciQmZMm9B5+VEZ0tVi3ZXtI?=
 =?us-ascii?Q?6UOJuMPFqfme8GCKM43DhFUuEEwHCTuoiVabKePLCMux3ORHlCE6gCDMzpx9?=
 =?us-ascii?Q?B4110+6ogii+b4Uqmiv9mofkeKR+ECXbS8LeRtllRfXW44IuY0Xau/VW5jOv?=
 =?us-ascii?Q?OzwBOS124Juu0rHw3eI5IN3YF736du8zQwT0XDzXMo0BM6h02dhnFPxpB9Ci?=
 =?us-ascii?Q?x6IB7U0Ia3oM+hDSdzT5bHDm20g3L7LuGh9MYQD5XJwo9nSRL2eXw6/PzhL4?=
 =?us-ascii?Q?sJzGVCt34vg7UKuVi+E6GTEm9xnGSMKfP2WTjcvEtikf9q88N5NUqNhMLg9z?=
 =?us-ascii?Q?f3HLBTriaysbKvljY3erSJNAnoIvz6fm9tH8IHM7xUXmIh+GupjbaMrIOEEB?=
 =?us-ascii?Q?zwYtXIl+0sPW2S+ykshqaOuFiRUc+wtrCi8yYouT05v7Yv9/zibDDTyORr4i?=
 =?us-ascii?Q?3GRM5eLwrhdTDfjcXErrcowEx7YfaQVb/oCqAcKlPcU/dMmBiFpsgc0gaaDl?=
 =?us-ascii?Q?EMhOvUbQBYEafWWJMDy9uY0dBzxdj5adMgfQETegMON/LxjhyeWIVilRPUv8?=
 =?us-ascii?Q?NahHkrEdgFBzeu8D+RtDvqnbiFmo3xrbfsvQgHYPfHJM8xaWBAfWbXm/rsl6?=
 =?us-ascii?Q?r9uPreBFZVQ+LNM41S89jWd7klsjtR6qMfmhSxIFnHEgy08GB7WidZjYKqec?=
 =?us-ascii?Q?/r9xdnX4xjrNjPF+eCl/CyWh0jCwWxFJjN8c3kYKXsyPjydX8u5J4GVqk1i2?=
 =?us-ascii?Q?q5sXP/bD7wH8FNWXn3TouwqxrYAhRqiyaiAH2nA4F5/Q0m9vXeQrHtmyruSV?=
 =?us-ascii?Q?OI9gbDLGCQdFuDbwoeeeysJubjLoPqznrpSPExVpT4uBFX/cJsOuyX5Yu9GA?=
 =?us-ascii?Q?0S8kfaIk/P1PXIkeOx0pk/UXzr4qrJ3cSNSZ3CSbJ6oJqZOxUQMUB08UpqiO?=
 =?us-ascii?Q?TYPgKu+UQyHoUYblwmMQg4rduBmo91iZNbn8f2TjPByZydzwsj4J12h0IT3U?=
 =?us-ascii?Q?tHzUpY7OoBIIL6YDRGX2ao6q7IS69c8HQ+U5cIB9Il2WOS11Lsg6JNOpqR3H?=
 =?us-ascii?Q?2WcNHdcEbYYGj5XPjG1AVW1cn5Dw6s0Vv8496j7PNIAZB/yBs3Zx59EBsvXp?=
 =?us-ascii?Q?9cHHlhVLAcycaK5vF0cOGEmcg6fKwLwncocWfIZa91i/T1w/1vdZLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bd3opRD9XXJbGt8H/9+QxbVxM0xIUR50+ZvZtXVJc/+UgzYNgIfRWyzZ29Qd?=
 =?us-ascii?Q?K6Cr0Mj0SoyYzJw7lwLlhAmQhggewvxZF+/Dbxf3zz0O4Gn9MlAy8jFUn9CU?=
 =?us-ascii?Q?EOB1c9U4PCZcDa4SNsqRJM3dgsLW2IoZK7Lw5xfXTqXhnMDWrwr9Z6SZlMEu?=
 =?us-ascii?Q?K6xIc63VU04/i8l7/Sei38q1edInqKFxNR/LDJQHSJVTIXFrL4PBs1nbZIyg?=
 =?us-ascii?Q?q+yDfmKW0oUBNC1L04VrOXP1ouNSPFCk0Rs7TU1Hlo0JNUmdYmxSBZAxi9b5?=
 =?us-ascii?Q?Ay/UOA+X3GRr0gkBYsiPHItiu+p7vcAcG51ipI6E/QSb1YAkQnsvJWRGa25M?=
 =?us-ascii?Q?+iimR4lk3j2UWiyiJOvZhfRZOAEbAv9ZMQHGyIxWlSc9xroyV3txnt+M/OZn?=
 =?us-ascii?Q?u3/aTRdKGPWN99lUBAzde1xxeCIUsvi7Bm90Dm6DVOZJm7eYVlNQuVDv0h/b?=
 =?us-ascii?Q?1BlJ7TV2aJDARie0lYWzF5FJIpPP4MJszbvmHTMimPUEZK+DI4mtkhjOU4nb?=
 =?us-ascii?Q?UIvG1+JUcxYquYrJcYCAmBjX0X09Dxlm/wA5QOXB1Tpr6/b1DyJ+GdEfG6ek?=
 =?us-ascii?Q?oITyGJ+CCXQlBihqEy3oRG2R1Xaq1Nna29lsuczLsFSxtoLGkwVhv74dhqxt?=
 =?us-ascii?Q?Az9KdmkMEyt4g6hmg2EbWONvLNZ5/2EGDIQg9ahZTwoJObFAamDhLE2MOilQ?=
 =?us-ascii?Q?OSjMPV6SGNwjAosoIdVQGAVUhp2g6SGVxns/HCxJEpwt1DHFwCnSbR/9fBQ7?=
 =?us-ascii?Q?/FF0Tg81DaJJmsmRPzoP/cKYWFUdZTGWghnwnq9GARWa09bVV9np37LxYXJE?=
 =?us-ascii?Q?g918PKOmacIGMa/KO71wewFDi0MhDXpC/aVt6BXmN+CyszegZnDJrnXAM/YI?=
 =?us-ascii?Q?Isj9B6+NS9ftJAtOEXlvHzfuedryIYC35eZ1vJZHfOPMP/SkFKi/tiEqRKO+?=
 =?us-ascii?Q?94frZeyZxVNVuGvwyaCLq0E8VxubX8Q/xJX3jV67oHgTammd1uXYg13WLVjd?=
 =?us-ascii?Q?NlKCBShZHgkXrGfdV91pryAlpOxwMZgmMEnXYl82ceEQEG4D3y9wSG29D4Y5?=
 =?us-ascii?Q?YiRZiD7YA9yRL9taT+Ga18QVuVbACJ2YhY9LeekN6/jBc0s3AEKFQnW8l2fM?=
 =?us-ascii?Q?n4v9DnvGU7iiVXNguvaNtTyQW6cWi0M+KzuoMMemWOeLX/WP83fYi5EFPv6D?=
 =?us-ascii?Q?wnukWVJ98i5ofApRJbIKNlWIL99nAJKCwdaLq6sDpgRqX4A7PD8AK3vfNk6U?=
 =?us-ascii?Q?fVbrpOE2uVq2p15UueoierRDTS9AlZo9Hs8WKNmwFsEgnZmZXz5/N5CUcNuU?=
 =?us-ascii?Q?FPUzQdc/xYgEctltgLgKFwUcf03KXzvfT1ljalL/XLN4qY8qNqh9NiHO2cOg?=
 =?us-ascii?Q?BoMIM7v/y8jC8JpEW7h7wcdkKWjqi45NjpUJTODIYtJPEW5tmQkM6GylhqVL?=
 =?us-ascii?Q?yMCMC7LlWhHwr9+uoIilPQsTveFjJlWIyuxCbLTRCkzrivzjgyjtj1DhCxMk?=
 =?us-ascii?Q?NJ+B+V0XNjsdVwc4Xx0ukJevawi8//llNhHNxluf24xZBvjCOohT2Jj7uvZp?=
 =?us-ascii?Q?t8Os3fUs7BD2ddSkf1Eu8O27XxgwHIt4m0OZeD7t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e41ff37-0f72-4461-5c5b-08dda7360cfd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:14:34.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+Bw2vByjA61LSVUbrKtNRvRvX+U4pKbRLxdaqREv/Ki4HLuTi9/y1XogicQ/ktAHq52JrUyky4gLLuSU71QgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984

Correct the DMA interrupter number of pcie0_ep from 317 to 311.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 59f057ba6fa7..7ad9adfb2653 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1678,7 +1678,7 @@ pcie0_ep: pcie-ep@4c300000 {
 			      <0x9 0 1 0>;
 			reg-names = "dbi","atu", "dbi2", "app", "dma", "addr_space";
 			num-lanes = <1>;
-			interrupts = <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "dma";
 			clocks = <&scmi_clk IMX95_CLK_HSIO>,
 				 <&scmi_clk IMX95_CLK_HSIOPLL>,
-- 
2.37.1

