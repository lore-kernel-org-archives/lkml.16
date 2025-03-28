Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2108.outbound.protection.outlook.com [40.107.247.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDB41DFFD;
	Fri, 28 Mar 2025 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167137; cv=fail; b=aeqFMKH7A3Da+BQ13OwBtILOhgrgNuEhufVbRUPJYkOIXZmkr1RLY4i2NGXgfibblTHMAT2YfPIu6GxFGpBYoxVjFcxIEE8DSIjG0eCxxXSIs9SBBPsXI8DIEpJz7eTtYYiplLqx2FlxmML6i5nQ8vS+mpSY6Uou8tdoIFeUVuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167137; c=relaxed/simple;
	bh=HWnhQAnJ5mxUneCZU5xLNWK1bWkxijrHHPCvgXGjgEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fibznErVpBelb8SuINc2w76mPuJ8dxhiwCE+rJIv8s1hGnkOYqdIBCrQ6naxcDjmnd4V9fwFmq/YIo3ObcBGRnSuT2q/MCXa+vPxdLP3b66Ec3wl51DaW+JXODSh5IpMtOE2Bqd2jYvnJwvYSA1rFe91y+LRmKgbdKcfU2Yeb6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=iqEZFUAl; arc=fail smtp.client-ip=40.107.247.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="iqEZFUAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BijtwdYp676J5Aic4B9nDwZoMXLgcu7oMA1KIIQPXHbYV4qSR10vLIHQTW/ZfbKoZmO2CTxc2GULV/AC+XNmKxvKe1kXcXmg1rx/b5TRFXbs2Lg8xTYUd2z0d6vEKtiB18IR5Z7Fihk4FHR9e12DhuA1QLxoXTVnqUOM9Ssm2sFxl/04YcytQZqivMiZxMJ1aMkDXR/ZPIule6DdblXM/E4N6QdW2FE0ODAnS/Bw4qObG8Bi9vRpuGDjyurwuUKdQvmwS5P9eTlQfBPpn9MCFrfSRdk1whawtM/u+h8CA+Bu2Z57Ld91HyAIZnugIbM5vXiiRIJF5bUmF5Xe4mzDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frEOL01tAwfxl4oNamiQS2H/MrJPK6GxLwja22wCY6g=;
 b=iN+boGwFWUUvt6ZMLrOnbgXOHHN3kOHj6wrckreBjzktPO6PV55BKOUBTPVva9Hl9xy7RpsO5JE6ZTNDQeuHP+rd2BfVVL/bUuKZNR0tphKr22XSUeFMbXwhyZjjvlOJHgn8yfhC3ilocrxaLuiueiBOzbE61eRSuZcHxkwVMXPUTTBODTPjyEZqX6XzPwba0l+X44khtGPrd1VrjkQn+M5AZutruW8egGpRKRjVB4x+xzz2ulM1uc36W+QOBDmgChbVW+p/KoimcAvQDncAq6noxxUlW4XcN930CU2ZwHV8eeLViqpoAjs4izkA6orASD22AmismYiskyTD297v0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frEOL01tAwfxl4oNamiQS2H/MrJPK6GxLwja22wCY6g=;
 b=iqEZFUAlK/2+JdHcpXo+smiBE4E5MbnczfubqCVPnXgr1N/4ET+6iKV3oXTeyYEPGkRIL2UxKT5/PJVpQ6zWmhyTAdkMX9CjG0cd3K5cLjpYiej1ymGGeT8OchUOouFv5lHOROR5mgac2DUYbHJTg3QelvuLm2zP2heL2n9Pc3dM/iNRxQehSITda26p58+rHMYiEpnvcewvZIDnClZYRUcMboaCJHjoljNO8z5WRbyWh74l5xjZefv2urNNM4T6HTN81PaRhko0m/DD5/Cg/1J9vw+JDcFboixds4k8mRPmW1LNYH/IPWf9EFw9SnKXKqUCQsEDE1Xe/wLwfHdBoA==
Received: from AS4P195CA0040.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::28)
 by DB8P195MB0518.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:151::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:05:29 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::d5) by AS4P195CA0040.outlook.office365.com
 (2603:10a6:20b:65a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Fri,
 28 Mar 2025 13:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 13:05:28 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:28 +0100
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Mar
 2025 14:05:28 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 28 Mar 2025 14:04:39 +0100
Subject: [PATCH 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-3-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|DB8P195MB0518:EE_
X-MS-Office365-Filtering-Correlation-Id: 47acc9ee-04c2-433b-8e30-08dd6df936c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzE2M2ZnelFyY1l6QjdvRUtscTRVRkFXa09vaDd6Y2h4bXgrMk5HTnRTWEt2?=
 =?utf-8?B?V0R3SksvVGpOVUVnSWRHd3lYWmxxbjk2Q2d4WFFDazFXOXA5Ky9Ia0VGWndX?=
 =?utf-8?B?SnZCMkhEaXl3U3RleEl6UGR1TWhhYlJJanB2QUNBeGVCYi9EL0R4K2NReW9R?=
 =?utf-8?B?eVpUWGJJUkt3SDYxSi85OHg1RDI2MU1QWUtSQzVhYXZNMWhtUzA1cHlpVlVW?=
 =?utf-8?B?dzZJSnJHWDdUM1ZWamhlNGtmRisvTHdQR1d1ZmJGMTNjU0ViYkIxMXRQYm1i?=
 =?utf-8?B?V1M3d0R6eldKTm1SRG8zZStIS0ZZNnpjQTJEY0dyOXBNT2FQbVJMdndBUXF0?=
 =?utf-8?B?bUI1dGNzb0xTL0JNSnhBbVl6NHk0QkxYYmhiY2ZkMnlHL0RlSHpjbmsvV1Fr?=
 =?utf-8?B?cjZpRnFQTDhFcDNTQWtwNTczR245eWt6NG5MT09ucHN0bnhUWExpOTdSZDgy?=
 =?utf-8?B?MVc0b1prNUM5UmF6MitnUVJnMWNaYmNacDRWM1VGK0x2dk51UUFlMEpFZlZF?=
 =?utf-8?B?K2JuZkwrRGtsYjBjRXlsbmxSSUppTFNKbVhHd01RK3NtYjdkSnp0NUxkT3pW?=
 =?utf-8?B?bmVNaUFNOFVVQUdlOEVER1IzTUZYTkNDNEZ5b0FhazNzVE5ra0lDWStsU2Na?=
 =?utf-8?B?OWkwQStJbHlWdEtxRXZ1RSswQTU1U2ZVenVWVWpCN3hTOWZvdGwzeW1leVMv?=
 =?utf-8?B?cExSYnZzdTErVDJZSXlMNW1JRUpwVzZTdTlBdjlYRHMxSjVrY2xPN2Z6Ym9V?=
 =?utf-8?B?TGZFUGFWNVNlbSs5VDVVNllJNXVCRzBUMzRWWFBNY0FGNmgzMEU2OVMwQXdx?=
 =?utf-8?B?Vk5BcGtRNkw1ZitraXdUeFFWeUtWTkN0cjRtcVE2QnFsYllsUlFjRUtlbGpX?=
 =?utf-8?B?UmJ4U3ROZDIwWWt6SDFsaFpZamZPYzNoRFphOUtvOWpvSWRjdjF5NFJ0ZlJF?=
 =?utf-8?B?OFc1dDRkcUU4MHY2Ulc0RnJzRW5qVHQ1dGRzV2dHeTljTDNzM0dIQmcwMzNE?=
 =?utf-8?B?TXhQNHlNUUNnVUFCS1RKd1lCNjNFU3ZONVpmMmI0bGtyeGI2b2k0MHgyM3Jj?=
 =?utf-8?B?dXJDakU3RTFUemxvVEFFenpNdUgwait4UGRZTXZkcWlGTU1BOUgzNFlpOGVZ?=
 =?utf-8?B?dnlHMmdZN2lVR3c5ZDU4UVlOUjNOUlhCMytvZy9KamNUS3BEdkZmMjJDSFBJ?=
 =?utf-8?B?KzBlMVh3ZlgxM3hodytkdG1oLzVma2ZyWFhJbkFNOEo2VldjUVcycWFVMU83?=
 =?utf-8?B?bHQ0K2VXVGhwbG9QalVHV3pyT3B1WG9ibHR1M3ltdUdZU1AyRGltMlZWRzBa?=
 =?utf-8?B?Nzh1TjV1WEZndUJVR3J6emJMZS9ZZEtXZ1dlekkxMUM2R3BaT0d1OHpxWE45?=
 =?utf-8?B?eDBLUmFuSWw0WDFCTDlRSmE1TmczckRFNjZSVEdnOHpRMW5LQ0s4R2UwWWNh?=
 =?utf-8?B?L0xwVnlCeGFBbnJXMitZOVR3OE1UY3BPT09EbjVKdnBFeG9tMXZXUk1XYzJE?=
 =?utf-8?B?MlBJT1lJeTY2ZWY5eS9oRjMwcmRtSXVHOHFnNGZ4WGd2MlRqUGRvYytmcjIv?=
 =?utf-8?B?ZGpxTFJqLzc3TDNRYmNQNCtSaFRBa0tLTGc1S3lYZ2RBR00zaXd0VWZWM3lJ?=
 =?utf-8?B?azNjbmJ1d2dNbmYzUkRzNWorZEd0ejhoYWVmandFSkhRZjdJYmszTngrL0Jy?=
 =?utf-8?B?alo4MGovbllxUEtuYVJmRmpwTVVISlpBc3d4enhiVmJjMUNPMGl6VEJUNm9E?=
 =?utf-8?B?b2k2bGUxREp4bkNvRWpQNnh0aysvYVE0MXF6Ti85YzFONGFpTFpsVjRqTUox?=
 =?utf-8?B?L0tvK2dsSlM3MU9talBNWjBvUEgvTWJWaUNlQUR6YUs1cGg1dUloOXhPUFVR?=
 =?utf-8?B?NnBYYys0a2E1WFdYT2o2akV1LzFWeWVSNDhaa2owSmRlaitoSndicjVkdjlV?=
 =?utf-8?B?QUtudjJ2RWlLRkZ6ZWt2dWorMURlaFBpR1pFc3dCWUtESUJyaUhwVENmay9S?=
 =?utf-8?B?NHVuc1dYY1dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:05:28.8882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47acc9ee-04c2-433b-8e30-08dd6df936c0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0518

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
2.48.1

