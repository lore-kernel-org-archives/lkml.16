Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2102.outbound.protection.outlook.com [40.107.20.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E2522F19;
	Fri, 28 Mar 2025 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743167137; cv=fail; b=Ul9WbP9Ug92KzmKtbzlsfI/b/36X8HJVy3w9vIQ2bjkD68c0h+tZAcmSvHsgRrqKR4EvbKEdHGLTbVAhFCM5huAGSUXN3v1ST4umN1c5Aha5t6WaKRPBKOCm8pU4KRUGn5SY0Q4UAUOJjzAFhBZD5u0YbJJRAyULmtvstf/W7tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743167137; c=relaxed/simple;
	bh=0q9x0u/tDwMHU52T2mMAZkT6RtTjDeWSID6w6S77mNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OtGWlW+Qj2ZT4aejliYgSxoaUm7M9LDTnJ0tRMPm8BHuHT/Gqu0zmkplj1ToRKOvfka3z1hDhLNpl4B+iMmym818dOJjJ0cNHnb3DfgW5jvdBIySloe6w6itTuWKXD8S9092u/HF119zDj0+aZ2xiEjz/K225pxmqEUVrfd5faM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=pBEl9VYp; arc=fail smtp.client-ip=40.107.20.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="pBEl9VYp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTQ0/TQXUpRoJ5HGtaLR7a06LWWPku5Dx3KuylUc3EGjNNS9qI3OAh2YeZ47IdipkmhesgF9HQNTtzsenTVoQhgNqv+ZeKNJ5SglRtTtZwJsRopPV32ZYf30Hgkrg3B1KFoJW36m3O5bzGk3OyeENWAXhru1ngeuAcDJGndWghzQI1baaghGc/iCYHGeDTAOfMfhPMqxN2DXeaq/p/auIcUXq1HHd2l5gNtxviWxaswXi66RE65koGVcixZmrnfrbVuV8a/n97yf6+5jepeYwZXEYZ01W0dFJSPk+pMvVtfpIR4cKaN+DCLHxeFgrVSLwAgaAcDGiPyhCqn2MdkljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEB4j2MG3KFeuO2YLhrirKzQqB3IdC0l/kUt/oYgtH0=;
 b=xpzLvzyG10fhlkiWHwKJh3hwsr47ipAoyMqY0tNJ+MjJcSUYGaH0h0cbY2kriD3yWX2f2S8cZZMJXiRVF7gpU4ozK6kXXH/vGb7TV++bON1Jo6se8ELdh7y7IzkmbYHoBbCJFKxJ6eBDZh7ZGQiip1WIsP1XQejFjzP01qj7t+hGRZcECq1GNaYyW+3nkfKI00f5wPI1Y4OUUQlkr/MmZI0dBhXIDq+Ar+iGnXnGRmtKD72RDi9qYbazZBWi97BDjthkTPfU1CRp2/YBSsBcsWsu+Nw7BflIqZEUs/B8BQ9gKbDPnYhb5QAzqQ5pXEf5MJ0nQexkLlpTTWRRL1PfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEB4j2MG3KFeuO2YLhrirKzQqB3IdC0l/kUt/oYgtH0=;
 b=pBEl9VYp3KAyoQ3g+D6BR806yPKr9ZXo7J42fxdgzswNjOu+DCAMJfsL5yOdJTMOwbEQ43KzuGVeMOMvE91lkBBp4nVtWLnQy+aW1qa32Jz59vLc+Uhp16gR/yxBnI81+C4gLe7DiZn5zJgFiKkeYwuxscrCwOLkcHIdudJ+VJS3/eDdaul2zfjY1JKd0o3JRIQ41iiCLfXrQ71KuBowg6fpgPBGqkvfnbFN3MYW23C2XimOGSAtf86DsfSXAKKvhMhYc0gZMzHijBcnvva6F69MtplNq4mLCj78R9y/0+sF1YfXUq3OM5CKAKWein3ETfYnAxpmqVFi7ZItDZfh/g==
Received: from AS4P195CA0050.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::8)
 by AM8P195MB0867.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 13:05:28 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::a8) by AS4P195CA0050.outlook.office365.com
 (2603:10a6:20b:65a::8) with Microsoft SMTP Server (version=TLS1_3,
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
 2025 14:05:27 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 28 Mar 2025 14:04:38 +0100
Subject: [PATCH 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-2-28324c7f81fa@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|AM8P195MB0867:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ad41c5-fd83-497f-4284-08dd6df93674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlZJSWhtSHg4d2FPWThJbmlxQ2dTMXkzQk8xNGc4WkM4cTdaYno2TFNSaGpw?=
 =?utf-8?B?TkpHN0JLSkk2NGlwNlM0TDhsQ21HR1puL09QR3ZxOFZCRytrRUlmSkZyZjFw?=
 =?utf-8?B?Wk10N1pIN2JDd1VKUm1tSVdrdFZ5dm9tb2x5SFdUWDlVMWtwRVFVVTdBck9N?=
 =?utf-8?B?elNIQnJDT1hzaFNDVWFNbE53V1ZQYXU4K0NKSFBNN1JTYk5qMm5oVWV2VENI?=
 =?utf-8?B?UHhoV2pUdVpIR0lKQ3RESzJFYWh4ZnpvUFpRekd1aExza1hqUkQ0UEk0aUVP?=
 =?utf-8?B?cDRDeHRveTdORVBIWGR4OUs0WkhjdDFDazdiUUcrSFRyVE9rRmprcWl2YmZ3?=
 =?utf-8?B?MkdkUm9NV1dtQzlXQ1ZRWnIxdGZtNGZ4aUtreC92eGkvanJ2K1FoSnk0WjJF?=
 =?utf-8?B?aERnSGVjcXJFNmlvRWpET1ROd0tadGlwcGxXaTYzallXUjVwZ3oxbzhaaEFx?=
 =?utf-8?B?ak1jS1ZLTVJkMUJNVGtkZUUzbnE4Nk5KWWlGbWhzODl2L3gxZkZjSkhIYmli?=
 =?utf-8?B?bU82Y0RkaUg1ODBSYnNPaE9rYjlEdkxWbmZCZktEbFdRR1lzVk5UTkk4djcr?=
 =?utf-8?B?VU51VEZTb2lUeG5aVFR3aUYzM1F6bGRiVzFNMlplUkxmS0h6Ny83WFJUZGxs?=
 =?utf-8?B?SjFYbVkrR0N2WkdiMzFzL0JKcW00dHZxNTdHa29Nak1OWUtTT0Vic0kwZ05v?=
 =?utf-8?B?OStTbjNQUkVqNXE1TXlVSmdxbXZNNkR1cVQ4Q3VyOHd3VmpEM0tablZ6Y3hP?=
 =?utf-8?B?K2orWE9SdE4xeHh3dkFNUXRtTFBvZ3djTkt3Y1hPRkVvdzZ4dEdZeXNLSXZv?=
 =?utf-8?B?a0lLM2xQZG5mbWQvTmhGakIrNlZzeHB1dWpoY0VmWURtVWRxZmZUSkN5RnVq?=
 =?utf-8?B?TDNLZVlXaW5hWU1FVWN4ck1ybG1Lb2FaSG5UZm83TXN6aFBvMnY3WktYRytj?=
 =?utf-8?B?MDViZktFY3YrSUxVdmE5dUl2R1k4aExQenA2Y0x6Q1VwZnA3eUhDTXZvOHJE?=
 =?utf-8?B?K3JuQ2hxREc2OUpWRVN4bjRyZFRRYWwzODJ5Ny9sUWcydUc5UlpISTJEOFow?=
 =?utf-8?B?K08rYW9GTjNmb1pLMERvL1I0aHR4ZzVqZkxUL1FJYzR6K1AyQjZ6QXc4cEd6?=
 =?utf-8?B?K3BGSVVqOCtMWEdHYlNnVGdSbXR6Vi9jbGt0VW5OTlRaM2U3ZG4wTXFTL2tF?=
 =?utf-8?B?REo5S213OHl1bENyK0R6K2xaNU5OTHArNG1sVk9HeVNmS2tqL3VPdnVJZERj?=
 =?utf-8?B?bVFQODU2MEJGYkc3Y09RdTNBNWIzZGNkd1FLWjBoSGVCNjdkUk5GZ3hTc3Vr?=
 =?utf-8?B?cG9nUUJ6S0JwZmlEQjZTQ3N4ZFoyWFJ5TGU5VDBSVmRmb2FrZTA5UzUzYjE1?=
 =?utf-8?B?K29DWThzT3FTTVJzbnR6NWpEWHdLK201SXV1S0dwVCtldzF4SmV5eUY3ZDVo?=
 =?utf-8?B?eFk2eWVsaWNKNmdjcmVJQ3J3MlVGK09ZUmRiUHZFbzhHUEJnb2F1cnlQcUh6?=
 =?utf-8?B?eThWL2VkTnc0RDZxKy9CZ3hCaTdJaExHenYzL2RXODBIZEFJOXhUc3pzcmVG?=
 =?utf-8?B?aUNUMFZzV21UQ2d2YjdTUElHQnNuVUZXaERVUzVRK1MvL1loWXdYVk1wd0Nn?=
 =?utf-8?B?THg4T3QxcGV4YmZFak9aZjhmVDN3eDEvWklMbkdxVEFwTGlhQ1NBTXZqS1Ex?=
 =?utf-8?B?QlErSTdSSElQL1h1aTd6R2g3S2FvUWh1RDlIOUFhNU5SNGk4NUxJdk9ibVBr?=
 =?utf-8?B?eCtETllvOUNQUHhyN2xSam5VV283NmJxTG9Zc1NYUTRkanVQODl2Z3V0TjVR?=
 =?utf-8?B?MTFVZW1haHdLaHRvU2ZZQ3gwOFljMHJxcEJBWmlKVzV5b2FnVjZYcDR2Y1Yy?=
 =?utf-8?B?M2ZqVzdCMjl4eUk5OC90NTdFYnRRU0dtM0pmM1JZRmN1ajB3TVdWS2pHbHd1?=
 =?utf-8?B?YVdBOCtQNXlVcXg3Q1lKaXRyY29MYVhGVHNQUWM4dnU5ZHBCQVg2N1J6NlBj?=
 =?utf-8?B?Z0xaYVY4eFNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:05:28.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad41c5-fd83-497f-4284-08dd6df93674
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0867

Add device tree for the Libra-i.MX 8M Plus FPSC board. The Libra is a
pure development board and has hardware to support FPSC-24-A.0 set of
features. The phyCORE-i.MX 8M Plus FPSC [1] SoM uses only a subset of
the hardware features of the Libra board. The phyCORE-i.MX8MP FPSC
itself is a System on Module based on the i.MX 8M Plus SoC utilizing the
Future Proof Solder Core [2] standard.

To be able to easily map FPSC interface names to SoC interfaces, the
FPSC interface names are added as inline comments. Example:

&i2c5 { /* I2C4 */
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
SoM, but the pin muxing is different due to the FPSC standard as well as
1.8V IO voltage instead of 3.3V.

[1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-8m-plus-fpsc/
[2] https://www.phytec.eu/en/produkte/system-on-modules/fpsc/

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 291 ++++++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
 3 files changed, 1088 insertions(+)

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
index 0000000000000000000000000000000000000000..91976044427f43c50b48e3ed88e193826cc94f76
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -0,0 +1,291 @@
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
+	model = "PHYTEC i.MX8MP Libra RDK FPSC";
+	compatible = "phytec,imx8mp-libra-rdk-fpsc",
+		     "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	backlight_lvds0: backlight0 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds0>;
+		power-supply = <&reg_vdd_12v0>;
+		status = "disabled";
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
+		gpio = <&gpio_expander 10 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "can1-stby";
+	};
+
+	reg_can2_stby: regulator-can2-stby {
+		compatible = "regulator-fixed";
+		gpio = <&gpio_expander 9 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "can2-stby";
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "VDD_1V8";
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+
+	reg_vdd_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VDD_12V0";
+	};
+
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
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			enet-phy-lane-no-swap;
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
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3",
+				  "CSI1_CTRL4", "CSI2_CTRL1", "CSI2_CTRL2",
+				  "CSI2_CTRL3", "CSI2_CTRL4", "CLK_EN_AV",
+				  "nCAN2_EN", "nCAN1_EN", "PCIE1_nWAKE",
+				  "PCIE2_nWAKE", "PCIE2_nALERT_3V3",
+				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
+		interrupt-parent = <&gpio4>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0x20>;
+		vcc-supply = <&reg_vdd_1v8>;
+
+		uart1_bt_rs_sel: bt-rs-hog {
+			gpio-hog;
+			gpios = <14 GPIO_ACTIVE_HIGH>;
+			output-low;	/* default RS232/RS485 */
+			line-name = "UART1_BT_RS_SEL";
+		};
+
+		uart1_rs232_485_sel: rs232-485-hog {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			output-high;	/* default RS232 */
+			line-name = "UART1_RS232_485_SEL";
+		};
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
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	fsl,clkreq-unsupported;
+	status = "okay";
+};
+
+/* Mini PCIe */
+&pcie {
+	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_vdd_3v3>;
+	status = "okay";
+};
+
+&reg_vdd_io {
+	regulator-max-microvolt = <1800000>;
+	regulator-min-microvolt = <1800000>;
+};
+
+&rv3028 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rtc>;
+	interrupt-parent = <&gpio5>;
+	interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	aux-voltage-chargeable = <1>;
+	wakeup-source;
+	trickle-resistor-ohms = <3000>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..bfd235f7ce8d4f38e3f3e07ee3decf66e0c95197
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
+	model = "PHYTEC phyCORE-i.MX8MP FPSC";
+	compatible = "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
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
+		 pinctrl-names = "default";
+		 pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		 regulator-name = "VDDSW_SD2";
+		 regulator-min-microvolt = <3300000>;
+		 regulator-max-microvolt = <3300000>;
+		 gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		 enable-active-high;
+		 startup-delay-us = <100>;
+		 off-on-delay-us = <12000>;
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
+&ecspi1 { /* SPI1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+};
+
+&ecspi2 { /* SPI2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+};
+
+&ecspi3 { /* SPI3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi3>;
+};
+
+&eqos { /* RGMII2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rgmii-id";
+};
+
+&fec { /* GB_ETH1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
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
+			enet-phy-lane-no-swap;
+			interrupt-parent = <&gpio4>;
+			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,min-output-impedance;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
+		};
+	};
+};
+
+&flexcan1 { /* CAN1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+};
+
+&flexcan2 { /* CAN2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+};
+
+&flexspi { /* QSPI */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi>;
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
+&gpio4 { /* GPIO */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>;
+	gpio-line-names = "GPIO6", "RGMII2_nINT", "GPIO7", "GPIO4", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "X_PMIC_IRQ_B", "",
+			  "", "GPIO5", "", "", "RGMII2_EVENT_OUT",
+			  "", "", "RGMII2_EVENT_IN";
+};
+
+&gpio5 { /* GPIO */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+	gpio-line-names = "", "", "", "", "I2C5_SDA",
+			  "GPIO1", "", "", "", "SPI1_CS",
+			  "", "", "", "SPI2_CS", "I2C1_SCL",
+			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
+			  "", "GPIO2", "", "", "SPI3_CS",
+			  "", "GPIO3";
+};
+
+&i2c1 { /* I2C1 */
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&gpio4>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
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
+		read-only;
+		reg = <0x51>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_io>;
+	};
+
+	rv3028: rtc@52 {
+		compatible = "microcrystal,rv3028";
+		reg = <0x52>;
+	};
+};
+
+&i2c2 { /* I2C2 */
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c3 { /* I2C3 */
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c5 { /* I2C4 */
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&i2c6 { /* I2C5 */
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+};
+
+&pcie { /* PCIE1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+};
+
+&pwm1 { /* PWM1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+};
+
+&pwm2 { /* PWM2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+};
+
+&pwm3 { /* PWM3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3>;
+};
+
+&pwm4 { /* PWM4 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+};
+
+&sai5 { /* SAI1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+};
+
+&uart2 { /* UART2 */
+	pinctrl-names = "default";
+	fsl,dte-mode;
+	pinctrl-0 = <&pinctrl_uart2>;
+};
+
+&uart3 { /* UART1 */
+	pinctrl-names = "default";
+	fsl,dte-mode;
+	pinctrl-0 = <&pinctrl_uart3>;
+};
+
+&uart4 { /* UART3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+};
+
+&usb3_0 { /* USB1 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb0>;
+};
+
+&usb3_1 { /* USB2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+};
+
+&usdhc1 { /* SDIO */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+};
+
+&usdhc2 { /* SDCARD */
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
+};
+
+/* eMMC */
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3_ROOT>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
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
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2	/* I2C1_SDA_DNU */
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2	/* I2C1_SCL_DNU */
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
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2	/* I2C2_SDA */
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2	/* I2C2_SCL */
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
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2	/* I2C3_SDA */
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2	/* I2C3_SCL */
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
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2	/* I2C4_SDA */
+			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2	/* I2C4_SCL */
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
+	pinctrl_i2c6: i2c6grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA		0x400001c2	/* I2C5_SDA */
+			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL	0x400001c2	/* I2C5_SCL */
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

-- 
2.48.1

