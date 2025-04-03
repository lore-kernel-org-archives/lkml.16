Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2120.outbound.protection.outlook.com [40.107.21.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30024BBF5;
	Thu,  3 Apr 2025 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679818; cv=fail; b=lMtyvzQ31NADzXJ4ciVvBCl/Iohv/gzuM6hOUXablRy23Hz3IA4F6JN3SE378sxi0JB048WbDfJDDqDekHg9VsLY+n87weJKoQtQ1Gzy+tIDsRBUbAFFfSHSGCXsNINwMtefQhHjfLUteij6OuF2yrSESNvH6M1IAclNl8TScWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679818; c=relaxed/simple;
	bh=9WBkdyFAeajkna399VkCXM77pPebS1WMbZveb6cywZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I49LMOZiwiFWvdNlcYTyxkHdZRsKAcBLToH7999EvRpmy8ot+1KxwJdyejK7bdKjOWRlePMIGcGcuEaZvQTlPtUyKQH7/z/Ao+YjGWPn4r3WBh/53uBQkn911FpbUpsdwvBh8X4lezMCYwFF94ehS2NqekAPEZYmZxqXcAVubW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=VOpnrqv0; arc=fail smtp.client-ip=40.107.21.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="VOpnrqv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxXQ35PtHo0vN6UhONQeNhbAoma0cVrntcI8x6oEzRhdLctt7ag7xXu9OmjN+sXfDI6VYxOEcy20ZvbZnnc810EWkMOsyFJ2N8PEKnGefpJvNZ0MuCW0iZp38XKi/hhHXvJAEcM+JzyyupBtc8PoZZwfkuBpqCupwcXtvoyvpXH3cFvhAWpCl4GeeTZMCrq99o5tuyUF7E+OAH1ud1IZ+OEIMSG1YaQ/nxiPPN40LS9jpPESR7qrJvs27795/Bh/wakysgF/3pfRLT8p2SHSdIWUO4qG69TBvofFrkbUr5+5Ej45oNMg6ykGsEedAMPXh7GumHuex6cbR8CqGCnz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjov56LUBoRQX68sHGn6BZmrDJZifE5y7ubMWaOecVs=;
 b=TviRourtPPSjtSCOtv6TkzgsOBzd2tIm3MpPBVG3VjtSTjZCgT9sA6X1yYZIgv8N663zf/f6iMDb7baTUqWb31Cwo4LlHGwEBuTvhx2x6njEXsDiz+ajuzn5APs3K1A5Lkl3O8JOoEdfLh1kZzGa0/auAQ2suPiNEgUO3TC92BzfBcCCDPRhH6TdWQHlM0igj428Ii0vlffeNgjdtmsHqsNAI29l898fvMBS4PD2D9wbiHRHMaXBm+ZwUz+C4jLt60MYB6tTfhdTuKIpw6EAfWjZgYghlqURifBSr58tsbg9JEDoaesAiCbEwdKaUHhfMn+cZ8AO2vnK7hVHuHh2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jjov56LUBoRQX68sHGn6BZmrDJZifE5y7ubMWaOecVs=;
 b=VOpnrqv0PdIhJObJkSu+bxh8wnpziGcaOba0OEvWaaGE0lRb8idrCYNbFtPlfcUk3Bth+L8KCWtdA+kfI1KdGNQY5Zud++BT7LtJIgham9lNtl/Rqw7gJpqlbc3nHL6GoSXHNeL7mbz8Ar1qp3qJSW+Q+6spf6H2C4cYlkqlGULZhp46uNTBOCkVL2CfEySECp2DuS6htZMPw2h0Ai0vEbyVaE9RFRR9FxomTZY4aq2grKZlKnLbWEF2bIKomq72enEd3r5+q6vyi9NiKRG3SreZIrKBe+n1NULINLb1Ec788mvF30pKlPoTZXmNak2Ri3eZruVaGGdqTCdGpfdADQ==
Received: from PAZP264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::14)
 by AM9P195MB1364.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 11:30:09 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::ed) by PAZP264CA0045.outlook.office365.com
 (2603:10a6:102:1fc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 11:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 11:30:09 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:09 +0200
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:08 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Thu, 3 Apr 2025 13:29:29 +0200
Subject: [PATCH v2 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-3-c0d2eff683ac@phytec.de>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
In-Reply-To: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|AM9P195MB1364:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b61b5a-0ac9-46b0-0f9d-08dd72a2e45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWU4blZEVmViSnlVNUhHVzdpN3JVVzJ6MHhmUnY1TGwyVURGc1J3c3hXUVRI?=
 =?utf-8?B?Vkt4cHFPWjVTY01RRVhkTzZZaWJIaS9KU0NyK3Y5a3UzbVlveTA4V0NqQXRz?=
 =?utf-8?B?MDZoNWdRMUhKYysrVTFQMCtKZ0JPbUhaTkNLOUs5TGpZVDFZbUdWdXVmSUw5?=
 =?utf-8?B?MzJMeE84MFRmL0xPRGJ4cEU5TE1TMlhrOUhFa1hzV3pOMWFVTnNHUnU2YUlT?=
 =?utf-8?B?ejJ2RytzcUcrb2VFWTlORzBNM0Y4V1hCdkYyMkhqb1VnVk1zaDR0dGM4a3Ix?=
 =?utf-8?B?S2MxUFpGK2J0ZlJWNWgvZTBFR3RtRVY3UG9rYktPN1o1TTByZStCMHREUVFx?=
 =?utf-8?B?TmtoQyt3ZmNnWGU0Z3BpMUhtcmluTVhDMFZ6NFJla0tGc1BBUVhrZ01lN1du?=
 =?utf-8?B?ODZNbGVyVG15ZkNlZHREN1FwTGsxZDlWb21pTVBnd254VEo1VDhBRGdpdnp4?=
 =?utf-8?B?OUZOMXpZcEpJWXdwSVpNYmF2WkFkMmFBNHhZbHl6bnNSRTJBY0J2UjQ0ckla?=
 =?utf-8?B?SVZhOUJlQXVwbWRWWFdqUlEwd1FwNm5oa1pPa2FZa0x0aXVxZWRsampXZnRj?=
 =?utf-8?B?NUhVRXNLWDVPemU1YUFFR25IT1pUTFZrWWZRelVGS1J3TUNFc1Vaa1lpWmJm?=
 =?utf-8?B?QVNMdzNlb0VkS1dsUUxlZENTMVZHUXptVjRrckRzMG84SzJhb2pucXdQWkVr?=
 =?utf-8?B?UEdWZlZKZnoxK3RmVlo5KzZUeTU4eHpOQ1dLME1hR1NseGNKejhhWjgwamtx?=
 =?utf-8?B?aDY2T0FQb0tZN0EyNFBXYU1YelJ4dzU2L0FJL1h6TzQyTTlGdm5yejFxNTFa?=
 =?utf-8?B?eTFmYWtqNWpEOW0vZlhXdTE3OUhUUVdFQmxaWE9Ub1d6TnR2N2JCTHlFZnBo?=
 =?utf-8?B?NjlvWElTK1FXaFVPaDBoRDFjZE1OMmdRMkkzamoyNmNVQVFURUQxN1NuRHBC?=
 =?utf-8?B?M1RERVF3dVFWUTNrZE9qMHBMREQ1NkExdHplc21xWFlpc0g2R2lpRTczbWJm?=
 =?utf-8?B?SUNoZzJMak93b2NLd1dnUkF0bGFMYzIvSU5xRTJqb0hzUDVyOGhXTzlhS08w?=
 =?utf-8?B?eENlMXdsNkRqTmdQSEh4bFN0a3BOSzJ2dnFFYjFzMHN6UEY3K1d3bzUwdjJt?=
 =?utf-8?B?YWNSSjNTQVIyMTJHRXh6ZTRYUlFodk9DNnlxN2JCT3ZpcjBqaWRUVGRJK2VT?=
 =?utf-8?B?QkdmZXNYSHJmTXZZOE1MQ2pWd3NyRlVMRnlNS0E4dnFCeHVTem9zaWVncXJa?=
 =?utf-8?B?RTBRaVM3aFNGOGJDYWt5VFVsYVNiNUF3dkd0bklJRnN6czdPTXVhOEtkS2hh?=
 =?utf-8?B?OEJaRHd5akRSZG91ZVZaVVJQSjlmM2lWd2w3VTBiUjBqNnI4eDlhQW5DclR5?=
 =?utf-8?B?dkhjVlIxNlJSWTVVS3lkTTgxY29lM0t2eGt0RXVYNDY5Vzh2L2JLSTQ2Nm8x?=
 =?utf-8?B?dDBaVi9kaTRxbm9EdTgrMWxNSmJZT1o0THpzQStzV2VLcDJBbjBFUWtmWUNV?=
 =?utf-8?B?OWFiby9EVTB2UlJ4dDd4dEREdUFxYnVBZ01SSlNMaGp4dGRBczU3VzFIK25F?=
 =?utf-8?B?cHRSbnJnRWNzTmtnd1FzU0s4aWMvLzd5TVBWcWpUclNsRkhjajdoYWg0Qzdo?=
 =?utf-8?B?ZDBrbWNsSnhKR0E4T0FEdVptSHdoUUMvdG5zMmt1ZDBTbXQrVk9uT3QrOTZo?=
 =?utf-8?B?aHNERG42OVBWWkxoNVhCN2FWTDJ3VEZ2NHhZUXVZN1lJVUQvT1JVSUZpSURp?=
 =?utf-8?B?dDl3Wm5VU0lVMG9ETzEzVFNNNk0vMVoxNlF5U2tlQldBcHpTVWVRWnAySVJm?=
 =?utf-8?B?TkR4ZU0yZmFNQ3NXenFldFNUTmpTbEhOV1ZCMDBoWGR1U0dSa2tFMk4wSmJF?=
 =?utf-8?B?dFIrZEhpTjZhbjF0K2puMWsvaDd2SmI1dk5ZcWlmbDJrMGpRUlhlaHRqdkha?=
 =?utf-8?B?TFJtSm84Y0E1ZEVDNDQ5amlyMTlQdDBBRkhGbHJqK2p4Y1QyUUJ1QXNhSjFq?=
 =?utf-8?B?c1ljWEhTUTR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 11:30:09.7541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b61b5a-0ac9-46b0-0f9d-08dd72a2e45a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1364

The Libra board has an LVDS connector. Add an overlay for an
etml1010g3dra LVDS panel supported for the phyCORE-i.MX 8M Plus that may
be connected to it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  2 +
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index df792553be479afcb6fa50dcd25a7eb63b67bc44..aa349ee35d5b310512f05c92390d5c2a27df81bb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -201,6 +201,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc.dtb
+imx8mp-libra-rdk-fpsc-lvds-dtbs += imx8mp-libra-rdk-fpsc.dtb imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..1dcf249ca90d2b4d9720a55de39e3f8564780dc3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm1 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 72.4 MHz.
+	 */
+	assigned-clock-rates = <0>, <506800000>;
+	status = "okay";
+};
+
+&panel0_lvds {
+	compatible = "edt,etml1010g3dra";
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};

-- 
2.49.0

