Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2132.outbound.protection.outlook.com [40.107.20.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0B23F40C;
	Thu, 17 Apr 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891318; cv=fail; b=qdeYyubcnkHsSgl80JXAGqWXruG7BA6z5DcKQZT1uA5hcb2drcx01B+H+/XWGSuuU/8pRvIpv1/xSIdVqppT0rIc1XWDnCatSsN+c0GwgSOg2dQ69nGo1PWrhLffUVd4XG1InzXwzEyGM7U4Rpcd6PsDeR17xh9S4fkfcm2GrK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891318; c=relaxed/simple;
	bh=qxktC67upwidBVE4T/BevJnHWcx8AGFpfNkCjrJzrLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fHLLlBbezUweC0t9JrwjE2bSE/Y60fa3TiwojLL2Icrz01vrCLhlCqA/HP5zec/inkd6C6AmNODFoybeoKAlp5SIhp0ZaykI/I0T5s+0djYHquWGqiftGwtFYk0u+bqjeZTS2kRkaUAoCnr0YyBlSomMEoEIDYEo7/z7KmkaBUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=mTo6KIWT; arc=fail smtp.client-ip=40.107.20.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="mTo6KIWT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVzTcnwZWPDc0BkVPWhufPWyD+rpGDfTouX0B16Cb+aVD/hY2xsEsQJC0JYK/NzJu8b7I5SMIDS91WzBXvNTcT6RZOcIvC0M7aG03S2dZO4cX6BCJE5lBhX5tYdzUzg1VzXXr2qj0N085BvtE9kgbfsFzbVDZZZ3OlNjzTjMdV1c9fon9fn2ykryD/1yX9cEkAo5sn8TVn/hj8TcpwFZV8wUqRJeZKoFiD+9nohmM6GM+B0EE/yQPQjD6R1m8ZE28PBEb5f/m8PwLKeDE+SMv3wwPOlT8mVQF8BtrxV5CIZRlxankAV/YeFAhjbfEA6nUx1wBYnQ9Jd1Lj1zBIF+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o63pCPSVTsRQ3VwlJXTyiGqS4LVTMoba1YZSR7DMRXE=;
 b=sJyI2KqPo0j6j0qVroNXF8q/2KKx5f6vEfUGaThRWQs5Bw/14wAP8Y41mOjaUnysVIKlxdvhxl7CBxQdKTrXpvlXehtIH2uNpOXXSzuP/KxSOdNoX8edPuIY/EuWUA4/66BHLSNlGiIpZBGqcWcElsbcIrT0pL/8uO29gCsR52GqtUMD8eZG6PmgbznLubaHUaZW9oUvupKna51efCpxxjyLD1U5k+ctUefKo14U/ifyUxGNifF5fvjQPBZpkxwzl/heV8qKs9zfVOUobGiI4mMMl7C5HzQ3FquZ3vR0UOjTxycx0MOhxOxaSqsIUfjfMscnILnC2JEAn4OuLmSB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o63pCPSVTsRQ3VwlJXTyiGqS4LVTMoba1YZSR7DMRXE=;
 b=mTo6KIWT94hV50v3GnaIuesDqZ+RuiAG0H4Flx/9Lu3Bl/qCGOHp2z5TBnmLz2CUEkCaiHqbcEH3n/TuF+i7ki6gpLDoCsl4jyxkGHIBhja/kMcZUsO5pijakGeBI70YUvezAoBRGPo1a94wesRgZE8XAL5ix52cgW19yvDRfjCzouL0VEgpkAwaE0VhmLvOJSLaw3EIF3UtbwVHfRFrkG6jjRdPj7wwJsgUZzEOvB+pYZWTQQ5wBWhtar5Xa85xHw4S6r0lGiNKxp78Lhqi6B/MK8SCDZ3bMb1HlmDdh1ffjHbNRNtnlLYn2FrQpCmi246DxO43mYygjISEabenBw==
Received: from DB6PR0301CA0090.eurprd03.prod.outlook.com (2603:10a6:6:30::37)
 by AS4P195MB1526.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 12:01:50 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::5b) by DB6PR0301CA0090.outlook.office365.com
 (2603:10a6:6:30::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 12:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:01:50 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
Received: from llp-moog.phytec.de (172.25.32.59) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Thu, 17 Apr 2025 14:01:14 +0200
Subject: [PATCH v3 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-3-ccb885b38ffd@phytec.de>
References: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
In-Reply-To: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS4P195MB1526:EE_
X-MS-Office365-Filtering-Correlation-Id: a15bd86b-5348-4b18-420f-08dd7da7a313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmlVRVlpYTlPMUE0Z2pmY1FESUpoaDgzUmtBVEVVWUh0Vmx5bW5YbzVjZWVj?=
 =?utf-8?B?cnV4bkpWcDZjcHN5cFl5dk01NmhoVzRkNkFkMXhxZjc2SWZZdmhidnhXTnhV?=
 =?utf-8?B?em1NRGtlVkdyOW5jYldGUlRrWm83TnA0cGk3b2dBYjlmRmpkWkUwSHFESzlH?=
 =?utf-8?B?aGROb3owSDBRQnlVbU42R200c1EydVNZUGlBNWVoUDlsUU5scEk4VytOWWVU?=
 =?utf-8?B?L1J3T2paTkdqMlljWVBuWjQ3TFE1N1RWWmdmZHA2eVlWZC9MZTRqVUVEbjFy?=
 =?utf-8?B?SjVLWVdwV1dPR1BJSWVpQW82RFhuQVAxUXNSN0p3c0RvZE94bVM1amZPZTdR?=
 =?utf-8?B?dzlRTG1PMFJvbW1jeng3MC9aOFE3RHdSN01scFhFbHJwWmovbnRvZlg0V3Bo?=
 =?utf-8?B?VFoyVlJQbCt2dXQ2TVpuenJadXVEU2gzT0M3SXpndlJnOGhrVWNpbFh2NE9L?=
 =?utf-8?B?UEV3VWNmZGl4SnIwL0oxUWJrNm43U1gxVGkyMWFSVzM5OWE4a1h2UHZRb0dB?=
 =?utf-8?B?ckpvYUkrZ2Q2RVBQUVNxUVNyOERKaTF6Z3lwUmVGN01IQmhiUVV6anVoMzgr?=
 =?utf-8?B?VGFXQTZkV0dpSHNScWluS3FOUVdZcGJhNlUrUjQ0bUZOcEt6Y0ZiNUY3WWwx?=
 =?utf-8?B?aVNoTE1zckVlOHcwVTBmbnBhc24rRXJMMC9pcDBKWlgvUENLenVVTG11YThP?=
 =?utf-8?B?aUhZT2lTQkhaUCtHbDZZSTFrVlducVpibXB5ZzN2cGRSTGVaNG9VbjZpRDNN?=
 =?utf-8?B?T0VWMWxXNEJHN3lZUHRSRDJ2V094aFEzR0M1TnpkUk5QcGxzMDVNSEpFa1BZ?=
 =?utf-8?B?b05SM0d4M2E4VnVNOXNhYWRZbGZFZkdrV2FUb25ISGlnTW9yM0ZhdHZOUXZS?=
 =?utf-8?B?d2FDVWhRaTJpa0RQSlhoajkvc1RwWkExUzRkWFNHY3VvdmFCZ0w5NHFMT0NE?=
 =?utf-8?B?eTVlUGg1M2hUQlhPb1Erckc5dGF5ZzdVSXNBVm9ZR05kS0o4czl1U1B2WVpY?=
 =?utf-8?B?eTMySXlrbThLZHRGa25CTkc5Y2lSUVVoNEZqbjVQWUVPb1pENllVSy9xTUZ5?=
 =?utf-8?B?Z2hWNjlZRTdzMWcvMW1XTTJvOFZRR2tYek02bUcyclFoeUlVTnlDUVhnQ0lM?=
 =?utf-8?B?YjE3S1p1R0I4WFJ1c3FvVmZGOTJ0TUkxb1lhWXUwRHcwcjRpbVE4Z3dZb0I3?=
 =?utf-8?B?SE4wZHVCWndyYU9WUFhPZTNnVm1ieTFDUVZLZDdlSXdHZXFjV2R3WWprZzNZ?=
 =?utf-8?B?bUYyVDJVamxDS3l6bUEwTjlsNXgyT0g0YXFSdUVBTkEyZnRMVldFc1pjQ3hY?=
 =?utf-8?B?TDk5SkJibzhPMFUvTFMrSno4NXRmNnRqL0NIeE1aZ3lnVzNmNWdqNGV5dE5L?=
 =?utf-8?B?bU9mdUJzSVlrMlEwSzVWQWp5WjZmMVNTSlJrMVcvVmlLVVYvZ2FCUEgrMERu?=
 =?utf-8?B?NXRFQStjTTV3OCtMNlBkNkl6dVpRLzNIMW1HdkF4UVVwYjJJSVlCTGYrYmJN?=
 =?utf-8?B?VjdrZ3dhaEpWYW9lT2RJT3VkZWdmWUsvam9iWFZTQmpaczQ2Y2R1d2lxSklk?=
 =?utf-8?B?bnN6YkF5R20vaWdvVGloRGQ0NWtKb2FydG8wQzB2a0h0eG5zcnhMZmQ4T01H?=
 =?utf-8?B?aXcvT2xNSnh4V1p2dDRsSFRLM2F3d1BUQlJNUWdHNG1LbzV0eGI3TVp0UDFm?=
 =?utf-8?B?aDVST3hBU002djF2ZUpJRGJZVC8vZnFoeThORG91Vm1ldG9NTnppQnNPa3R2?=
 =?utf-8?B?NmJZWmJEQmVXejgzdHM0NklNeWJIVFpwMGtRUXZmR0VKa21aUWtta0U2em9p?=
 =?utf-8?B?UW02MjNrWGx5VHJqcDZSeFBiNWhWSVhDOTIydGZ3Ym8rQUpwMlZDQVEwNGdM?=
 =?utf-8?B?dFBFYS9nN1BrMUhkSHRxbWpIME03dkV2ODd2SXFhck1vOXJiU0tWYVMvMGE2?=
 =?utf-8?B?MkxQUGJtaG9pczNaOWdGSnNPdXFoY0Q1dkR4YlorbFcwejdhRjNONi9paTNn?=
 =?utf-8?B?WG44ZkRHZFRUOEl2RnNYS2hNd1REajQzU1Rtc0Z6eXV2SDdrbHUvckJQaGxL?=
 =?utf-8?Q?sMdSaz?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:01:50.4747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a15bd86b-5348-4b18-420f-08dd7da7a313
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1526

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
2.43.0

