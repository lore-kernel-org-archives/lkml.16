Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2131.outbound.protection.outlook.com [40.107.105.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A5243379;
	Thu, 17 Apr 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891321; cv=fail; b=i4AZzyY1JrsPm9efZep3LB0TcRU1UbkjNGl8CFpxxZZf367iTHyK20gxEp72WViLlD4fXksEKjxcR+PThfza29/NzJgKnyJJlyGlrMnRp3Jk2OaJIbWeD+3YkkAAM9NlDEf4x7JsRLR3hFR4EU20Wul4pdouj0XnSioXgCo1xrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891321; c=relaxed/simple;
	bh=lcmlb3/pF0bCp8FxPM/5orD7sE0/w8z4tSaEQ8Y4DG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Si2S0hDQFKoSweo5nbA2xoOeSyp84jdrdgH7AXTC0+ODCDFX5Fk2AV6WqnW68vkgDp5wd8Jg32P9+bnVaH/Rd8AzWFsHE20Dsi6eDMUjlBw2fMxkmIU4u0jH42F7dRTP1HbTbxi5vqvYT1ZhtiTFmoDgqNHYvOnXEZNaNfSNdyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=JW9BfFio; arc=fail smtp.client-ip=40.107.105.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="JW9BfFio"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8FwFqjNy5JL9ZLgKrRkqKjvrcyZHbQPZoOzgMm55odamSUyRCKJCa9lEQiEl2syo+7+1U0qiLqiUsRiPk13Ug86exroPteWSa/eI1LaFYwMhSl4RC/l5g4fOJmYPAop+HadujHQk33ss7fPsRWHMQl5Rtf890sufIAtWS9yYz4TbN5bMZqey6WOj6IZ1mEPvXUAbOmou+uEUNzc3g5NTTYZP+GK/lNhsJW0hYroePDQbMxnv3SIcY1Tar3vl4BQrQyGrbMuX7gyosqWOtQ9m7SOxIJJWQo+dSs1xxM5T4sffZs4mkroMFauiBobJo/RAiQn3zLyVfu8gf26FkMNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFP7aEmNqpPFB9JJBbYX4zURoVwkDMWL1wFCl9FepS4=;
 b=QP2b6/jAZ05g7P8U8TTLaNRb0abkMxje+3qpR5AOcnA2S3nXXKAvWDRWkexLm/fg6p8l7hmAbxVH/DTZ3NFjo0CLfSofy2AhN9Hh0NCS/Fsd6pazA9HZoIMntMgxeRMLZXZRKtU5RIXzU6foJXTg2bTLdH47XJ2m6b1fwxAy9nBY4zG5Oi5RY40LofK3uc3yVXF47/NCqgrK724WDNkI9FqyN7wSMlGTCSEqEe/nIjQyitwjVc9B8EZO8XKXYVqe8ksjSK/PzOlbqtBiVy22M5mxYxXtfK8ZorCdwXUI9cLYOfeR6bM0vruhxDY0nrJFiruA3CMieb5My+rlUcX+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFP7aEmNqpPFB9JJBbYX4zURoVwkDMWL1wFCl9FepS4=;
 b=JW9BfFioKJsN7G7ThqdzNnvSDgq5BBzMzAGQHGr12H/aF70860zQpw9pwORNO5hodm5uC6rUaRouVixExZwDAWgHrckkFl8wqCtWZEG2E1cCa/oZMmYGgtdSqjbXvE3MZhHbYccY4bkQjnHBVezu/eCREY4iNOMPxArQ33jOl+8iUU6jfu5F1QwDgzSjHIWAC+K54IrQyRKbyEjAIeXH6tP1X/N7XrXqF7B38AHynKTF2uBFCmvvcxjmkmOHhxxr/JY8LJiVkVucGSH6akhmqDEIzE2CFTrvvYRcWwee/LlzTds74BuF9Fka/FfTnNL6hxWpsJKlJR8JYjEAUIvC1w==
Received: from DB6PR0301CA0101.eurprd03.prod.outlook.com (2603:10a6:6:30::48)
 by DB3P195MB2182.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:43c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Thu, 17 Apr
 2025 12:01:50 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::98) by DB6PR0301CA0101.outlook.office365.com
 (2603:10a6:6:30::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
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
Date: Thu, 17 Apr 2025 14:01:13 +0200
Subject: [PATCH v3 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-2-ccb885b38ffd@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|DB3P195MB2182:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c037e1b-a3d6-4398-1229-08dd7da7a2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmtUdXVVR0piVDljVGhMK2FLSEl0S0hGOGV3cGQ5Tm1vdGRKMFpQM0ttRUtK?=
 =?utf-8?B?WlJ4R1RZcCs5TGRyL0hkaHlCci91R3B4RjVRQklXNGNSQkNTWXhsZmpid2FI?=
 =?utf-8?B?dTJSaEc3cjBpYW1RRzVDRnErb0JlK0ZqTSthTWVJWVR4aS96b2lqV2tmTzZB?=
 =?utf-8?B?dUxsb09Oc3hQcU1mMGtMdGtJUFdZYlBma3BrMUg1TU9DeDhlaDN1bGdWVGlK?=
 =?utf-8?B?SmxWWEpzblhHbGJBZUxyMkY5ODhsdlozaWR1MlI2MDFteUpjcnhwUUtVS1RZ?=
 =?utf-8?B?QXBFQjE5MjVySDdxeG1PRWNlZzZQNytFN1gzMk1KWEx2TUhxbW9sckYyOFlU?=
 =?utf-8?B?RjNKN2pCYlNTMldyc0hqcWk3TXlwNUs2UTlaeUtQa1NlYlA4R2ZOWTVxQXhR?=
 =?utf-8?B?aFVGb2VDWFJ5a3BtOVdkMmRnUE5QTkZrTXB5MUVlQVdMcGdMZ09oVk1JYk1L?=
 =?utf-8?B?Tk1XVlVHY21CTUJsTlZkclBWR1J2cXNVNDROMVIzNmNhaWdxaFhoYk14ZUVj?=
 =?utf-8?B?aXRBQWpWZlZCdEk2VjYyMW5CKzlWY0hJOCtMbVZiakRpdDU3Vks2Ni8wZkxn?=
 =?utf-8?B?RW0wdWhiRVJFa003dVJxaG1teUEyaGhZSUszWEc5WHEyekwxTmhTMjlLWEla?=
 =?utf-8?B?Qi90T1RoaVM4WEU0alRnV2NnTkxrUVNYN1RUSjV4Um1oeDRIaXNNaVlxSTRo?=
 =?utf-8?B?emhBancwb2xDM2xlS1Q2YTVhNG5rT0p5ZStqNWtQTmF0OE8zZ3ErU3YyVmJa?=
 =?utf-8?B?bW92a1pkcVd4VGRJaEpNTWtVU3plM05sdlEwRVcrRjk2RHY4bUJGekhMOFBN?=
 =?utf-8?B?YkZYOXl5NFhHTW5kUkhYRTlZMEVIZ1c4bjJsakhiZ1l4V3AwaDJ0VkFRaUVr?=
 =?utf-8?B?YTF5cjlQVlJiYUx5ZU4wMW53L210RWV5OWlCamZDYXFuVlBvZXZJVHpiMkZ2?=
 =?utf-8?B?SWJWOFR5MHFYZnZ0WWhISkJjbENscWRzWXBpUjA3UXM1cmFuLzFJZHpCa1hB?=
 =?utf-8?B?NkJVMGdvbVYxOFAwVTVmbmpEa3N3NklSTW8zNlFOcjU3azhBZFg3Vk12M1ZN?=
 =?utf-8?B?VUZUYzdJRXM3VjRCc0JkYWZOWUxuREtKZVh6cVNqZnRucXFFNDlqMGxDSjIr?=
 =?utf-8?B?RmgvVDRWdTZXbkNCeTNuYTg5TWpQWHBrZ3YvV0F4WU9ONWxBU2dkb1Y0UUlh?=
 =?utf-8?B?TzFuU2hCaVRVTllldXVlbERnb0hiTHVoM1k2VzZwK1poZDdKNWJpUDlydU8r?=
 =?utf-8?B?WnRpUzkwN3JMRk5EaUE4aUZpeFo2QU44Z3ZEd0QweGxseEtCU21BUDFDZFpB?=
 =?utf-8?B?aTBlM012UUZUcWZZNktFTkV3VXRNR1lRZnBWeitNdFYzMTN4MkJlcTZLOTlN?=
 =?utf-8?B?cU1vdzBRcXg0MENYdUFGNEsxeE0ycjk5bWpZSzk3MStJMWxMUXdTbVo2SHl3?=
 =?utf-8?B?U29PNE5pZjVUcldMT09oSGgrRUFjTWowMUMyZzNDRjA1WHpZcHo4RC9lcS80?=
 =?utf-8?B?bUhmWmR6TjNyYkxsMk1zUVVWSnBtdzhKSC9BS2R2MUdOVHRoNkpSOGZOSmZ5?=
 =?utf-8?B?dEEvNVQ3aG0wbzJNQjMxSlFmaWUxdzRFeGE0M255K1J2OTA5K3Vua2RhQU5s?=
 =?utf-8?B?RzA1eThaZDFVeTVWeUJRck56bXFraE9vbGpUMVhrT0ltaVVGOUlHLy9NcGZT?=
 =?utf-8?B?UFVoYVpCME5pajRVNndOTmlHNi9VVzgwdFRpYVVDNkNiaVdHc1ZjNjBNcVVa?=
 =?utf-8?B?M0t3SnBJa05jVW9FdW1qTVNVQmJHdmJvUVR5YVd1WTUzWFFYRGhscWx6TjVu?=
 =?utf-8?B?dVNjVlc3VzJkaXdxRUxkaUtoczZXQ2JMdVdYenBEQlY5eUxHcm1kZUxTbDd0?=
 =?utf-8?B?Y0N2aFJPYitsSGRKR2xRZ05vOVFrcjVzZXJqSnlDM2ZyN3BaTDh1Qjh1b0FM?=
 =?utf-8?B?dVhUT1lLL0JJQkNVdmxTQi8yUGlnbHFJVzFQMy9LUXhiSGJ2aElEbUFEeHEz?=
 =?utf-8?B?UjU0WWx5VUlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:01:50.0997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c037e1b-a3d6-4398-1229-08dd7da7a2da
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P195MB2182

Add device tree for the Libra-i.MX 8M Plus FPSC board. The Libra is a
pure development board and has hardware to support FPSC-24-A.0 set of
features. It can be populated with the phyCORE-i.MX 8M Plus SoM to form
a SBC.
The phyCORE-i.MX 8M Plus FPSC [1] SoM uses only a subset of the hardware
features the Libra board provides. The phyCORE-i.MX8MP FPSC itself is a
System on Module based on the i.MX 8M Plus SoC utilizing the Future
Proof Solder Core [2] standard.

To be able to easily map FPSC interface names to SoC interfaces, the
FPSC interface names are added as inline comments. Example:

&i2c5 { /* FPSC I2C4 */
	pinctrl-0 = <&pinctrl_i2c5>;
	[...]
};

Here, I2C4 is the FPSC interface name. The i2c5 instance of the i.MX 8M Plus
SoC is used to fulfill the i2c functionality and its signals are routed
to the FPSC I2C4 signal pins:

pinctrl_i2c5: i2c5grp {
	fsl,pins = <
		MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2	/* I2C4_SDA */
		MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2	/* I2C4_SCL */
	>;
};

The features are almost identical to the existing phyCORE-i.MX 8M Plus
SoM (dts: imx8mp-phycore-som.dtsi), but the pin muxing is different due
to the FPSC standard as well as 1.8V IO voltage instead of 3.3V.

[1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-8m-plus-fpsc/
[2] https://www.phytec.eu/en/produkte/system-on-modules/fpsc/

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
 3 files changed, 1087 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621234ab84353165d20af9d2536f839..df792553be479afcb6fa50dcd25a7eb63b67bc44 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -200,6 +200,7 @@ imx8mp-kontron-dl-dtbs += imx8mp-kontron-bl-osm-s.dtb imx8mp-kontron-dl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6f3a7b863dca1e0f2de174e0fbff80e953c58dc9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/leds-pca9532.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "imx8mp-phycore-fpsc.dtsi"
+
+/ {
+	compatible = "phytec,imx8mp-libra-rdk-fpsc",
+		     "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
+	model = "PHYTEC i.MX8MP Libra RDK FPSC";
+
+	backlight_lvds0: backlight0 {
+		compatible = "pwm-backlight";
+		pinctrl-0 = <&pinctrl_lvds0>;
+		pinctrl-names = "default";
+		power-supply = <&reg_vdd_12v0>;
+		status = "disabled";
+	};
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	panel0_lvds: panel-lvds {
+		/* compatible panel in overlay */
+		backlight = <&backlight_lvds0>;
+		power-supply = <&reg_vdd_3v3>;
+		status = "disabled";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
+	reg_can1_stby: regulator-can1-stby {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "can1-stby";
+		gpio = <&gpio_expander 10 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_can2_stby: regulator-can2-stby {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "can2-stby";
+		gpio = <&gpio_expander 9 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_vdd_12v0: regulator-vdd-12v0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VDD_12V0";
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VDD_1V8";
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_3V3";
+	};
+
+	reg_vdd_5v0: regulator-vdd-5v0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "VDD_5V0";
+	};
+};
+
+&eqos {
+	phy-handle = <&ethphy1>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x1>;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+		};
+	};
+};
+
+/* CAN FD */
+&flexcan1 {
+	xceiver-supply = <&reg_can1_stby>;
+	status = "okay";
+};
+
+&flexcan2 {
+	xceiver-supply = <&reg_can2_stby>;
+	status = "okay";
+};
+
+&flexspi {
+	status = "okay";
+
+	spi_nor: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&gpio5 {
+	gpio-line-names = "", "", "", "", "I2C5_SDA",
+			  "GPIO1", "", "", "", "SPI1_CS",
+			  "", "", "", "SPI2_CS", "I2C1_SCL",
+			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
+			  "", "GPIO2", "", "LVDS1_BL_EN", "SPI3_CS",
+			  "", "GPIO3";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+		vcc-supply = <&reg_vdd_1v8>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	leds@62 {
+		compatible = "nxp,pca9533";
+		reg = <0x62>;
+
+		led-1 {
+			type = <PCA9532_TYPE_LED>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_LED>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_LED>;
+		};
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	gpio_expander: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3",
+				  "CSI1_CTRL4", "CSI2_CTRL1", "CSI2_CTRL2",
+				  "CSI2_CTRL3", "CSI2_CTRL4", "CLK_EN_AV",
+				  "nCAN2_EN", "nCAN1_EN", "PCIE1_nWAKE",
+				  "PCIE2_nWAKE", "PCIE2_nALERT_3V3",
+				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
+		vcc-supply = <&reg_vdd_1v8>;
+
+		uart1_bt_rs_sel: bt-rs-hog {
+			gpios = <14 GPIO_ACTIVE_HIGH>;
+			gpio-hog;
+			line-name = "UART1_BT_RS_SEL";
+			output-low;	/* default RS232/RS485 */
+		};
+
+		uart1_rs232_485_sel: rs232-485-hog {
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			gpio-hog;
+			line-name = "UART1_RS232_485_SEL";
+			output-high;	/* default RS232 */
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lvds0: lvds0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_TXD__GPIO5_IO23	0x12
+		>;
+	};
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25	0x1C0
+		>;
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel0_in>;
+			};
+		};
+	};
+};
+
+/* Mini PCIe */
+&pcie {
+	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_vdd_3v3>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&reg_vdd_io {
+	regulator-max-microvolt = <1800000>;
+	regulator-min-microvolt = <1800000>;
+};
+
+&rv3028 {
+	interrupt-parent = <&gpio5>;
+	interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	aux-voltage-chargeable = <1>;
+	pinctrl-0 = <&pinctrl_rtc>;
+	pinctrl-names = "default";
+	trickle-resistor-ohms = <3000>;
+	wakeup-source;
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+/* debug console */
+&uart4 {
+	status = "okay";
+};
+
+/* SD-Card */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <200000000>;
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..8b0e8cf86cadbb759dd257dc43d2d63ed5e28128
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
@@ -0,0 +1,796 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/net/ti-dp83867.h>
+#include "imx8mp.dtsi"
+
+/ {
+	compatible = "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
+	model = "PHYTEC phyCORE-i.MX8MP FPSC";
+
+	aliases {
+		rtc0 = &rv3028;
+		rtc1 = &snvs_rtc;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0x80000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		 compatible = "regulator-fixed";
+		 off-on-delay-us = <12000>;
+		 pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		 pinctrl-names = "default";
+		 regulator-max-microvolt = <3300000>;
+		 regulator-min-microvolt = <3300000>;
+		 regulator-name = "VDDSW_SD2";
+		 startup-delay-us = <100>;
+		 gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		 enable-active-high;
+	 };
+
+	reg_vdd_io: regulator-vdd-io {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "VDD_IO";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&ecspi1 { /* FPSC SPI1 */
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	pinctrl-names = "default";
+};
+
+&ecspi2 { /* FPSC SPI2 */
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	pinctrl-names = "default";
+};
+
+&ecspi3 { /* FPSC SPI3 */
+	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-names = "default";
+};
+
+&eqos { /* FPSC RGMII2 */
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+};
+
+&fec { /* FPSC GB_ETH1 */
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_fec>;
+	pinctrl-names = "default";
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+			enet-phy-lane-no-swap;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,min-output-impedance;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+		};
+	};
+};
+
+&flexcan1 { /* FPSC CAN1 */
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-names = "default";
+};
+
+&flexcan2 { /* FPSC CAN2 */
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+};
+
+&flexspi { /* FPSC QSPI */
+	pinctrl-0 = <&pinctrl_flexspi>;
+	pinctrl-names = "default";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "PCIE1_nPERST";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "SD2_RESET_B";
+};
+
+&gpio3 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "I2C6_SCL",
+			  "I2C6_SDA", "I2C5_SCL";
+};
+
+&gpio4 { /* FPSC GPIO */
+	gpio-line-names = "GPIO6", "RGMII2_nINT", "GPIO7", "GPIO4", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "X_PMIC_IRQ_B", "",
+			  "", "GPIO5", "", "", "RGMII2_EVENT_OUT",
+			  "", "", "RGMII2_EVENT_IN";
+	pinctrl-0 = <&pinctrl_gpio4>;
+	pinctrl-names = "default";
+};
+
+&gpio5 { /* FPSC GPIO */
+	gpio-line-names = "", "", "", "", "I2C5_SDA",
+			  "GPIO1", "", "", "", "SPI1_CS",
+			  "", "", "", "SPI2_CS", "I2C1_SCL",
+			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
+			  "", "GPIO2", "", "", "SPI3_CS",
+			  "", "GPIO3";
+	pinctrl-0 = <&pinctrl_gpio5>;
+	pinctrl-names = "default";
+};
+
+&i2c1 { /* FPSC I2C1 */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+		pinctrl-names = "default";
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "VDD_SOC (BUCK1)";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1000000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "VDD_ARM (BUCK2)";
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "VDD_3V3 (BUCK4)";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "VDD_1V8 (BUCK5)";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1155000>;
+				regulator-min-microvolt = <1045000>;
+				regulator-name = "NVCC_DRAM_1V1 (BUCK6)";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "NVCC_SNVS_1V8 (LDO1)";
+			};
+
+			ldo3: LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "VDDA_1V8 (LDO3)";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "NVCC_SD2 (LDO5)";
+			};
+		};
+	};
+
+	/* User EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	/* factory EEPROM */
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+		read-only;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	rv3028: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&i2c2 { /* FPSC I2C2 */
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c3 { /* FPSC I2C3 */
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c5 { /* FPSC I2C4 */
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c6 { /* FPSC I2C5 */
+	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&iomuxc {
+	pinctrl_flexcan1: can1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__CAN1_TX		0x154	/* CAN1_TX */
+			MX8MP_IOMUXC_SAI2_TXC__CAN1_RX		0x154	/* CAN1_RX */
+		>;
+	};
+
+	pinctrl_flexcan2: can2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX		0x154	/* CAN2_TX */
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX		0x154	/* CAN2_RX */
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01				0x10	/* RGMII2_nINT */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27				0x10	/* RGMII2_EVENT_IN */
+			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24				0x10	/* RGMII2_EVENT_OUT */
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2	/* RGMII2_MDIO */
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2	/* RGMII2_MDC */
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12	/* RGMII2_TX_D3 */
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12	/* RGMII2_TX_D2 */
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12	/* RGMII2_TX_D1 */
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12	/* RGMII2_TX_D0 */
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12	/* RGMII2_TX_CTL */
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x12	/* RGMII2_TXC */
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90	/* RGMII2_RX_D3 */
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90	/* RGMII2_RX_D2 */
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90	/* RGMII2_RX_D1 */
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90	/* RGMII2_RX_D0 */
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90	/* RGMII2_RX_CTL */
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90	/* RGMII2_RXC */
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
+			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x140
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x12
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x12
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x14
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x14
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x14
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x14
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
+		>;
+	};
+
+	pinctrl_flexspi: flexspigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B	0x82	/* QSPI_CE */
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK		0x1c2	/* QSPI_CLK */
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00	0x82	/* QSPI_DATA_0 */
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01	0x82	/* QSPI_DATA_1 */
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02	0x82	/* QSPI_DATA_2 */
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03	0x82	/* QSPI_DATA_3 */
+			MX8MP_IOMUXC_NAND_DQS__FLEXSPI_A_DQS		0x82	/* QSPI_DQS */
+		>;
+	};
+
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* GPIO4 */
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x106	/* GPIO5 */
+			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00	0x106	/* GPIO6 */
+			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x106	/* GPIO7 */
+		>;
+	};
+
+	pinctrl_gpio5: gpio5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x106	/* GPIO1 */
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x106	/* GPIO2 */
+			MX8MP_IOMUXC_UART3_RXD__GPIO5_IO26	0x106	/* GPIO3 */
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x106	/* HDMI_CEC */
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x106	/* HDMI_SCL */
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x106	/* HDMI_SDA */
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x106	/* HDMI_HPD */
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1e2
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1e2
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2	/* I2C1_SDA_DNU */
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2	/* I2C1_SCL_DNU */
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1e2
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1e2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2	/* I2C2_SDA */
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2	/* I2C2_SCL */
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1e2
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1e2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2	/* I2C3_SDA */
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2	/* I2C3_SCL */
+		>;
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04	0x1e2
+			MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x1e2
+		>;
+	};
+
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2	/* I2C4_SDA */
+			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2	/* I2C4_SCL */
+		>;
+	};
+
+	pinctrl_i2c6_gpio: i2c6gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20	0x1e2
+			MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19	0x1e2
+		>;
+	};
+
+	pinctrl_i2c6: i2c6grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA		0x400001c2	/* I2C5_SDA */
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL	0x400001c2	/* I2C5_SCL */
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x10	/* PCIE1_nCLKREQ */
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08     0x40	/* PCIE1_nPERST */
+		>;
+	};
+
+	pinctrl_pmic: pmicirqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x140
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT	0x106	/* PWM1 */
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x106	/* PWM2 */
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__PWM3_OUT		0x106	/* PWM3 */
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__PWM4_OUT	0x106	/* PWM4 */
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19    0x40
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0x106	/* SAI1_MCLK */
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI5_RX_SYNC	0x106	/* SAI1_RX_SYNC */
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI5_RX_BCLK	0x106	/* SAI1_RX_BCLK */
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0x106	/* SAI1_RX_DATA */
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0x106	/* SAI1_TX_SYNC */
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0x106	/* SAI1_TX_BCLK */
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00	0x106	/* SAI1_TX_DATA */
+		>;
+	};
+
+	pinctrl_ecspi1: spi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK	0x82	/* SPI1_SCLK */
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI	0x82	/* SPI1_MOSI */
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO	0x82	/* SPI1_MISO */
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09	0x106	/* SPI1_CS */
+		>;
+	};
+
+	pinctrl_ecspi2: spi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK	0x82	/* SPI2_SCLK */
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI	0x82	/* SPI2_MOSI */
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO	0x82	/* SPI2_MISO */
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13	0x106     /* SPI2_CS */
+		>;
+	};
+
+	pinctrl_ecspi3: spi3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__ECSPI3_SCLK	0x82	/* SPI3_SCLK */
+			MX8MP_IOMUXC_UART1_TXD__ECSPI3_MOSI	0x82	/* SPI3_MOSI */
+			MX8MP_IOMUXC_UART2_RXD__ECSPI3_MISO	0x82	/* SPI3_MISO */
+			MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24	0x106     /* SPI3_CS */
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXC__UART2_DTE_RX	0x140	/* UART2_RXD */
+			MX8MP_IOMUXC_SAI3_TXFS__UART2_DTE_TX	0x140	/* UART2_TXD */
+			MX8MP_IOMUXC_SD1_DATA5__UART2_DTE_RTS	0x140	/* UART2_RTS */
+			MX8MP_IOMUXC_SD1_DATA4__UART2_DTE_CTS	0x140	/* UART2_CTS */
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA6__UART3_DTE_RX	0x140	/* UART1_RXD */
+			MX8MP_IOMUXC_SD1_DATA7__UART3_DTE_TX	0x140	/* UART1_TXD */
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DTE_RTS	0x140	/* UART1_RTS */
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DTE_CTS	0x140	/* UART1_CTS */
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX	0x140	/* UART3_RXD */
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3_TXD */
+		>;
+	};
+
+	pinctrl_usb0: usb0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
+			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106	/* USB1_ID */
+		>;
+	};
+
+	pinctrl_usb1: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
+			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
+			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__USDHC1_WP	0x106	/* SDIO_WP */
+			MX8MP_IOMUXC_GPIO1_IO06__USDHC1_CD_B	0x106	/* SDIO_CD */
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x106	/* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x106	/* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x106	/* SDIO_DATA0 */
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x106	/* SDIO_DATA1 */
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x106	/* SDIO_DATA2 */
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x106	/* SDIO_DATA3 */
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
+			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196	/* SDCARD_CLK */
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6	/* SDCARD_CMD */
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6	/* SDCARD_DATA0 */
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6	/* SDCARD_DATA1 */
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6	/* SDCARD_DATA2 */
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6	/* SDCARD_DATA3 */
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d2
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d2
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d2
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d2
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d2
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d2
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d2
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d2
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xe6
+		>;
+	};
+};
+
+&pcie { /* FPSC PCIE1 */
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+};
+
+&pwm1 { /* FPSC PWM1 */
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+};
+
+&pwm2 { /* FPSC PWM2 */
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+};
+
+&pwm3 { /* FPSC PWM3 */
+	pinctrl-0 = <&pinctrl_pwm3>;
+	pinctrl-names = "default";
+};
+
+&pwm4 { /* FPSC PWM4 */
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
+};
+
+&sai5 { /* FPSC SAI1 */
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+};
+
+&uart2 { /* FPSC UART2 */
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+	fsl,dte-mode;
+};
+
+&uart3 { /* FPSC UART1 */
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	fsl,dte-mode;
+};
+
+&uart4 { /* FPSC UART3 */
+	pinctrl-0 = <&pinctrl_uart4>;
+	pinctrl-names = "default";
+};
+
+&usb3_0 { /* FPSC USB1 */
+	pinctrl-0 = <&pinctrl_usb0>;
+	pinctrl-names = "default";
+};
+
+&usb3_1 { /* FPSC USB2 */
+	pinctrl-0 = <&pinctrl_usb1>;
+	pinctrl-names = "default";
+};
+
+&usdhc1 { /* FPSC SDIO */
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default";
+};
+
+&usdhc2 { /* FPSC SDCARD */
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	sd-uhs-sdr104;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
+};
+
+/* eMMC */
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	fsl,ext-reset-output;
+	status = "okay";
+};

-- 
2.43.0

