Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023077.outbound.protection.outlook.com [52.101.127.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CD26D4C4;
	Fri,  9 May 2025 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774779; cv=fail; b=fjiLuTIxw8Ot0obJxqmiHSULR7tJJ4ucWNWiLr3U7d5v7uxhtDH+F/fKCy1zKNtiLM7HP5taEJRcF6oykjZBdUZv0ZDlMxKVg7yMTO/nb5AnegKH09BWHKJAtVLg4Mmp+iXsbN1++CjeZhwL/owjSvP5oYr4wAjDDD8gbDPbQZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774779; c=relaxed/simple;
	bh=mClctoHwicTI6EVCqeSYf5lVSaXkqUgrQ5oC3uZK8po=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u6YQ7NfdsXVmZ9NoIRqjtgDKDHJmMYZ59UUad9FxjEfQ1QgQIZN8210/A2Qg7cWPVMA93W20lo23go7sN60CCQFfQrFPuVs25zRb/gLgbKp6PHWBdvE96G56+Lh/2oaV9miPsyNnN6OvNbDVTkzMVd7lE90CdvRm3wbJrMfjDdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=IqNZVScY; arc=fail smtp.client-ip=52.101.127.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="IqNZVScY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw6NCQP/sBf0w17J3Xft65rhiR5i7t6g5ZazIYanmsJedoYvhGHmEK4jVVULWQmE1ule9MUqfTuYkQi/qU8Fx1jNYGGNM83EbF8/IXaxibi86GPf1LyRwyT3Ooy26WJ7ZowNj93w3DacZOifknAhpaCHIdiv4jIRc8AGtsUSj0aPYHqkyiQr/fzdtqQzV6/bPRWB0N5YFjW9gARdZvIlGQU1B8DVN/ebjHQS604TBV/gECPSrEb/qzq7dXgh6UB1RSm6Xwotrw3ovjR2OCENEuQzXD5Vhk/34zRY7JmRXxRzdyFA8fuXH7UtmsdxcRjyXv5QyIs0JkyVmkN6rhA8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67L0lV6J0JISHq3uqzFRbkEj1617+BlmEzL3bRC2beg=;
 b=LPeAicGL9wqcU6n+vmupWi7jcHx5GdIAQ4Wpa0oPtW/afOSdP4zgpv06AVrlK5fTV7Bpx0ODcvjPuiQZX+k1Z0K6YLYf6vYVu/qhI43/zMjiQlafdOwiL7tqHhauYpkYSBStSwM0DE0uIPck2jwM9EUQ5cwy9WlBsZhOTGu58FDLnQ+9d67av3CaTYJXim4U7cgpdPBxGKS/rtLvG5XjUhN9+Xm1IC3DxYu0bwocA90aLu4OB8dXlIpkQiGuH5AkljTfQnXAPJZ/WIJrTJ6UoCjI1HU1VoyLSbaKxnWm/okZ/VH4o3PKJh5yVmA514jwTLNCG5LdjUrAuXOi7/J97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67L0lV6J0JISHq3uqzFRbkEj1617+BlmEzL3bRC2beg=;
 b=IqNZVScYuEHC9X10q2ytY4oxJAkUWGHUZ46vqXig0iiZGcpAIPptnsC4j4wjBpb0IRDQO9N61gyZaxbQlRSfMotQTnFIyMfDq6I784trfeSBoFconaEVJqTt3OjjrP0ZM+zapJ5M8kiU4Q7U8myL8D9Y2ScpGSj3cI2aVbDLz3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYSPR03MB8719.apcprd03.prod.outlook.com (2603:1096:405:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 07:12:53 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 07:12:53 +0000
From: Richard Hu <richard.hu@technexion.com>
To: shawn.guo@kernel.org,
	sascha.hauer@pengutronix.de
Cc: rob.herring@kernel.org,
	krzysztof.kozlowski@kernel.org,
	conor.dooley@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	ray.chang@technexion.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Hu <richard.hu@technexion.com>
Subject: [PATCH 2/2] arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SoM on WB-EDM-G carrier board
Date: Fri,  9 May 2025 15:12:42 +0800
Message-ID: <20250509071242.12098-1-richard.hu@technexion.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0006.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::16) To KL1PR03MB7454.apcprd03.prod.outlook.com
 (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYSPR03MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 764bc9ef-728b-485b-fa47-08dd8ec8ea5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7fAYqOKHno++4iwTNulSJfcpPuS9WdRo8DitPwbcbVCRUs3JkGaqdQVPSqEr?=
 =?us-ascii?Q?jvaU1mYQPVIE+Or/NCCUEAkJ8Gr2Ghv+jNxHX4y1qwNurXfOxoVa0XZ85Tq6?=
 =?us-ascii?Q?sPIa1xvJu/4BTBu6gSAzmaahGNC7Yz3feyENh6Xk+tifzK0xBgvLu5/6FSjx?=
 =?us-ascii?Q?hyohvE1Z/0nD/Yg5wDpNJUsoBacQhUCJMQvL/rzEzHyKJFfh8uggOtZETIAk?=
 =?us-ascii?Q?2leUxC4R869IGKRODePXreCAQEFLAfJsOPJWI4+4DP4F8faF4rYkMqjcm1CA?=
 =?us-ascii?Q?2lXoYKqeeqG0Azku1VTQZINh+96ip+2WIkwyhfrjh+0x+A1JBDX1mdhRFgZh?=
 =?us-ascii?Q?DrxW/NsBtgCC5TUJhh72OR1Ig6Rens19INCjlF5pGSnWKQhut0bC4OwZ0ItX?=
 =?us-ascii?Q?HmCQNbrhDt+2Cb4YCHBOVp4h5IVGchH+RWKSuA3qkug5EmQm2UjUOhG/EMDj?=
 =?us-ascii?Q?Jl5CIzZL/tcxboUKgzUKO/IJwjhTFSw/i/m57yDQXQmavsn9iEqBOT5HDh+n?=
 =?us-ascii?Q?8VUwPMoSb9TOYiwOL+OMHVkphwtWnd/zWIlWMrtipBaZ2+dg2OPa80qZHaEf?=
 =?us-ascii?Q?9d+ivHKclP6gGtZgkfVdpHCM71IuLVHw+/SwoHoWoOvh0W/ulqhO6/CNhKY9?=
 =?us-ascii?Q?Uj13teXvDYnO0lRc5qxTrcCuGZ/dZEJQkmyvM+9OqUnybfJ7aXd38xWyvC63?=
 =?us-ascii?Q?BPgvtswMDsFvQ6eItQ+vB7ijsRn+X+025+MYCei8E+iNVj7XINAYJSD5J8PQ?=
 =?us-ascii?Q?XfM3yzRkzX8goMhPqrWkEGukXqVflr5KTVAzGVrm9m+uwrMrmlHak/mLqhHn?=
 =?us-ascii?Q?7kiiKuNM2JyheN77Y+0HSXVcrBR62far0FLUjJ6ATvoyEUcTyNZ8BYzm/I2M?=
 =?us-ascii?Q?vBtNZWhbB6gA4oVcM1+WLNpoNySUeozeA9mKCt3l/VN3ukgw0U5vd4DMBhEJ?=
 =?us-ascii?Q?KC5yxlFt0q6EPVcXzwczKqhygBuytRZwoylUbYjuO7MxTPBiwSPwejm2E8ER?=
 =?us-ascii?Q?qs1dRDqdWcA6FlDB42Ayx7UxIiTeuBHhnMXjeIf4se5cnAB3ec03eO2DvbcD?=
 =?us-ascii?Q?Q436LtusrJ2KgFNSVHJdixdDg7tc7imhnr1mgzYkz5XeED3pr0qGiuZYfInG?=
 =?us-ascii?Q?sBFH2aEh+mkixDTpKb7zIsffvQ9NsL4unCwDzvih4Tdz4D2WNxvyDUHLW8xJ?=
 =?us-ascii?Q?jcgp4kmQlEOHr02y51DgnIAhXKv6aVUPSAB77BXMuaGFVeFL/HYXkvY3/SDh?=
 =?us-ascii?Q?HR1ux5OioqfP35Fl2se5+Pf2ag4BXiqWwW3nlCW7D+IaG1QL4bs+DmsFYkGf?=
 =?us-ascii?Q?iTXixPkBYVw+jIbPYh4B7GAYhDiljOX9bkoJDluRT/Y2Zn8FdYvywWvX1NID?=
 =?us-ascii?Q?zyJai7K7ORvPNOPPqpabumNBaWZnKbIICJBYOGO5zuUEuaBGOSPZwqVSJNtu?=
 =?us-ascii?Q?Hkd1HBEhH8v77SCG1i/beipGzHXU0jEqW01WETUr9lc6Ap6HjTRedw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E0JauE0BAVB/cKlxzt1ylcDK16gG+hd18RlndiPQfLHhDe31/4/wT+EN9J2Z?=
 =?us-ascii?Q?kkYUkFRo7tIk4Gs1p581RYU3aHlpzGYFaESK4uAi/ac8y0sSqzDWuiVK2XqT?=
 =?us-ascii?Q?EaKAYslEsTHsKBPXfeJGKg/VZwRYOVLRzy/QXzu4l4suYhAIZdT8btHXIo7E?=
 =?us-ascii?Q?IyzOSSLGKL5fQ+XB7qPczDJv6m0UUHovRIOlBTvsMqNWs1IZUA0FVFYpsnRI?=
 =?us-ascii?Q?P4SVR0lW1wMDa/Anf9JJ0PNqctHIvEKba248uPSmH8GI680wh6ClShQYaDTW?=
 =?us-ascii?Q?ysCX4Yac0LZrCef4+eGI/USlLXfvToIg7/i3aYfyLbkB770Ub/VZ1L2Tk8iS?=
 =?us-ascii?Q?X4qVYG+EjgE74v0yAJ/Vydb73JPnxBlRxyXX/Kel2UDDxfeiKUejhRQ0VKCz?=
 =?us-ascii?Q?NYPRj+2t9l/r2crxJV0+3ub3w8SsdyfG4mO2Ssplmu5SMjCU6QfsizpyTYxS?=
 =?us-ascii?Q?aebudv2ZiusR81+3qkmMdh3bnWWGS0cSxoThpOCrxiuNs/kr0q6cZDXkIyq1?=
 =?us-ascii?Q?Rtlc6zPjEpEAJXmvGjHVAesSckjhUPi7oD50QJ+ud6YFhWfrH26wuxB2LZmD?=
 =?us-ascii?Q?FD1X0PyUuuXC9fOhNvPHKKWFWDSVjDqAPium1DhVe8E3+GmYs9OC9LLbG23x?=
 =?us-ascii?Q?M5fe+FgQEaXY60Jvyl02Riaj6IbDyeMA89YXvKByWc7Ot1b1bh0C/deBp80f?=
 =?us-ascii?Q?RJRTM9g8NPGNJPYO1oD5EKjXmPzkzhw8CLtfyx3j5vRw4HAwSSvmJx/ook7N?=
 =?us-ascii?Q?WZZTuDD6fqLZ5f4FuCpg88327dkTg2h9pYo1uitNVKISzgS1/i++EtxMiF42?=
 =?us-ascii?Q?FCcn3888ZT0T46ya1gbyN4CgX41NlnQoBGpUb7vQ7RVMWmPZ7YuRzoGKh99N?=
 =?us-ascii?Q?nri84pq+WH2OA2cCqtI7yaqiDa2CGpHTJ45Rnf/urjR9DVa1Wiqikz0W4cjQ?=
 =?us-ascii?Q?VUqXB1JRD03MCA0Fog53VIv4PXdwMjT9k3Gb/0m7yQKwsJOsFjXng7hNyM1z?=
 =?us-ascii?Q?kOxY8L1wrU3/w9AJMi4pE6vdMjFaUELPu1m8pLIzmBQNZkT8eH5/qTasUIok?=
 =?us-ascii?Q?SK3KRjCybhj8Nd2e41ZSCRYy6YFm6z/RVzJkheyUexyfvcvSgIFGCsgrLMBS?=
 =?us-ascii?Q?qFJEYp8WjcactVLq1CMu3JhXDgLeBZfTxvpl46YxeGB0bap08quBitW7hF7r?=
 =?us-ascii?Q?WnjLTVMtiyJNrtXcYv2vUoUWKig/IHCzemP2JGKBRNJ/Vc1Tx0qY9YUAW5mH?=
 =?us-ascii?Q?uA0rcaPHqwxgCC8Atkh0SyvvpbRtZubSgyAqFzPQKQsJZ8VgeXufYIbm6E/9?=
 =?us-ascii?Q?/KngLBYdJ+uq5kQsdpVOTzCH26cPsbA2xoAVGIl1K+IHtJJ+FjuwxSIP8oAy?=
 =?us-ascii?Q?6vDP3i2U7U6wvRMUyNx9UTv9vzvglOy+8EGsxxIwKDmZJOvnnxHPko+VV/zO?=
 =?us-ascii?Q?g84TwQhRPg72upcpdtK3aCQOqDGwZ3+FycP+we0ADZobWKDrw/Vh9dI4JK7E?=
 =?us-ascii?Q?fC0o8RT0XnewpBIIZTIJPF9SH9JB5WWrUAAmJrnGQKeJK3RVQgLlfxw3nLdm?=
 =?us-ascii?Q?sTkgFT+WlOWUxjDm6nnkrskjoAA1tTU/2RfPQr3grLUVh9e9kTIaDOBlzPd9?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764bc9ef-728b-485b-fa47-08dd8ec8ea5b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:12:53.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FP8lS2f2YtimFTXwXcTMLh6DTpv9Db1xQGiilyCrE6BUIt9ljr47MQ6gzDsBDFXqHEuWFGbQTQxAeeI5D952d7jbkFsgcuHRDSclpXZ6NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8719

Add support for the TechNexion EDM-G-IMX8M-PLUS SoM on the WB-EDM-G carrier board.
Key interfaces include:
- Gigabit Ethernet
- USB 3.0
- I2S, UART, SPI, I2C, PWM, GPIO

Signed-off-by: Richard Hu <richard.hu@technexion.com>
Signed-off-by: Ray Chang <ray.chang@technexion.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8mp-edm-g-wb.dts    | 404 +++++++++
 .../boot/dts/freescale/imx8mp-edm-g.dtsi      | 791 ++++++++++++++++++
 3 files changed, 1196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..6acd2408f936 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,6 +191,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
new file mode 100644
index 000000000000..26bc836c4a19
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 TechNexion Ltd.
+ *
+ * Author: Ray Chang <ray.chang@technexion.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-edm-g.dtsi"
+
+/ {
+	compatible = "technexion,edm-g-imx8mp-wb", "technexion,edm-g-imx8mp", "fsl,imx8mp";
+	model = "TechNexion EDM-G-IMX8MP SOM on WB-EDM-G";
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led {
+			default-state = "on";
+			gpios = <&pca9555_a23 1 GPIO_ACTIVE_HIGH>;
+			label = "gpio-led";
+		};
+	};
+
+	lvds_backlight: lvds-backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 36 72 108 144 180 216 255>;
+		default-brightness-level = <6>;
+		pwms = <&pwm2 0 50000 0>;
+		status = "disabled";
+	};
+
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_lvds_backlight_pwr: regulator-lvdsblpwr {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_lvds0_backlight_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "lvds0_bl_en";
+		gpio = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lvds_pwr: regulator-lvdspwr {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_lvds0_pwr>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "lvds0_vdden";
+		gpio = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "PCIE_CLKREQ_N";
+		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_pwr_3v3: regulator-pwr-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "pwr-3v3";
+	};
+
+	reg_pwr_5v: regulator-pwr-5v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "pwr-5v";
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		model = "audio-hdmi";
+	};
+
+	sound-wm8960 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,name = "wm8960-audio";
+		simple-audio-card,routing = "Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"External Speaker", "SPK_LP",
+			"External Speaker", "SPK_LN",
+			"External Speaker", "SPK_RP",
+			"External Speaker", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"RINPUT1", "Mic Jack",
+			"Mic Jack", "MICB";
+		simple-audio-card,widgets = "Headphone", "Headphone Jack",
+			"Speaker", "External Speaker",
+			"Microphone", "Mic Jack";
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	reg_usb_otg_vbus: usb-otg-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_otg_vbus>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "usb_otg_vbus";
+		gpio = <&gpio4 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&flexcan1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names = \
+		"", "", "", "", "", "", "DSI_RST", "",	\
+		"", "", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "";
+	pinctrl-0 = <&pinctrl_gpio1>;
+};
+
+&gpio4 {
+	gpio-line-names = \
+		"", "", "", "", "", "", "GPIO_P249", "GPIO_P251",	\
+		"", "GPIO_P255", "", "", "", "", "", "",	\
+		"DSI_BL_EN", "DSI_VDDEN", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "";
+	pinctrl-0 = <&pinctrl_gpio4>;
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-0 = <&pinctrl_hdmi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+
+		port@1 {
+
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_pwr_3v3>;
+		DBVDD-supply = <&reg_pwr_3v3>;
+		DCVDD-supply = <&reg_pwr_3v3>;
+		SPKVDD1-supply = <&reg_pwr_5v>;
+		SPKVDD2-supply = <&reg_pwr_5v>;
+		wlf,hp-cfg = <2 2 3>;
+		wlf,shared-lrclk;
+	};
+
+	pca9555_a21: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "EXPOSURE_TRIG_IN1", "FLASH_OUT1", "INFO_TRIG_IN1", "CAM_SHUTTER1",
+				  "XVS1", "PWR1_TIME0", "PWR1_TIME1", "PWR1_TIME2",
+				  "EXPOSURE_TRIG_IN2", "FLASH_OUT2", "INFO_TRIG_IN2", "CAM_SHUTTER2",
+				  "XVS2", "PWR2_TIME0", "PWR2_TIME1", "PWR2_TIME2";
+	};
+
+	pca9555_a23: pca9555@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "M2_DISABLE_N", "LED_EN", "", "",
+				  "", "", "", "USB_OTG_OC",
+				  "EXT_GPIO8", "EXT_GPIO9", "", "",
+				  "", "CSI1_PDB", "CSI2_PDB", "PD_FAULT";
+		pinctrl-0 = <&pinctrl_pca9555_a23_irq>;
+		pinctrl-names = "default";
+	};
+
+	typec_hd3ss3220: hd3ss3220@67 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x67>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_hd3ss3220_irq>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&dwc3_out_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&dwc3_in_ep>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_csi0_pwn: csi0-pwn-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07	0x9
+		>;
+	};
+
+	pinctrl_csi0_rst: csi0-rst-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08	0x9
+			MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1	0x59
+		>;
+	};
+
+	pinctrl_csi1_pwn: csi1-pwn-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05	0x9
+		>;
+	};
+
+	pinctrl_csi1_rst: csi1-rst-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04	0x9
+			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x59
+		>;
+	};
+
+	pinctrl_gpio1: gpio1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x16 /* DSI_RST */
+		>;
+	};
+
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__GPIO4_IO06		0x16 /* GPIO_P249 */
+			MX8MP_IOMUXC_SAI1_RXD5__GPIO4_IO07		0x16 /* GPIO_P251 */
+			MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09		0x16 /* GPIO_P255 */
+			MX8MP_IOMUXC_SAI1_TXD4__GPIO4_IO16		0x16 /* DSI_BL_EN */
+			MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
+		>;
+	};
+
+	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
+		>;
+	};
+
+	pinctrl_lvds0_backlight_pwr: lvds0-bl-pwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14		0x19 /* LVDS0_BL_EN */
+		>;
+	};
+
+	pinctrl_lvds0_pwr: lvds0-pwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD0__GPIO4_IO12		0x19 /* LVDS0_VDDEN */
+		>;
+	};
+
+	pinctrl_otg_vbus: otgvbusgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00		0x19 /* USB_OTG_PWR_EN */
+		>;
+	};
+
+	pinctrl_pca9555_a23_irq: pca9555-a23-irqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXC__GPIO4_IO11		0x140 /* GPIO_P247 */
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&pcie {
+	vpcie-supply = <&reg_pcie0>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dwc3_out_ep: endpoint {
+				remote-endpoint = <&hd3ss3220_in_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dwc3_in_ep: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
new file mode 100644
index 000000000000..d9b00d17f553
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -0,0 +1,791 @@
+
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 TechNexion Ltd.
+ *
+ * Author: Ray Chang <ray.chang@technexion.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx8mp.dtsi"
+
+/ {
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	enet_power_en: enet-power-en {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_enet_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "enet_pwr";
+		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	i2c_gpio_brd_conf: i2c-gpio-brd-conf {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <100000>;
+		pinctrl-0 = <&pinctrl_i2c_brd_conf>;
+		pinctrl-names = "default";
+		scl-gpios = <&gpio4 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio4 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VSD_3V3";
+		startup-delay-us = <100>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		name = "rfkill";
+		pinctrl-0 = <&pinctrl_bt_ctrl>;
+		pinctrl-names = "default";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	wl_reg_on: wlreg-on {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <20000>;
+		pinctrl-0 = <&pinctrl_wifi_ctrl>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WL_REG_ON";
+		startup-delay-us = <100>;
+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+		device_type = "memory";
+	};
+};
+
+/* I2C_B on EDMG */
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* MCORE on EDMG */
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* I2C_A on EDMG */
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* I2C_C on EDMG */
+&i2c5 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* AUD_B on EDMG */
+&sai2 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI2_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	pinctrl-0 = <&pinctrl_sai2>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* AUD_A on EDMG */
+&sai3 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* BT */
+&uart1 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* UART_A on EDMG, console */
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* UART_C on EDMG */
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* UART_B on EDMG */
+&uart4 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart4>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+/* WIFI SDIO */
+&usdhc1 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
+	assigned-clock-rates = <200000000>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&wl_reg_on>;
+	status = "okay";
+};
+
+/* SD card on baseboard */
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+/* eMMC on SOM */
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
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
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	spidev1: spi@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+	};
+};
+
+&eqos {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			reg = <1>;
+			/* Atheros AR8035 PHY */
+			compatible = "ethernet-phy-ieee802.3-c22";
+			eee-broken-1000t;
+			reset-assert-us = <35000>;
+			reset-deassert-us = <75000>;
+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+			realtek,clkout-disable;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-names = "default";
+};
+
+&flexcan2 {
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pca9450@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+
+		regulators {
+
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK1";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK2";
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK4";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK5";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK6";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+				regulator-name = "LDO1";
+			};
+
+			ldo2: LDO2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO2";
+			};
+
+			ldo3: LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO3";
+			};
+
+			ldo4: LDO4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO4";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "LDO5";
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_bt_ctrl: bt-ctrlgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05	0x41 /* BT_REG_ON */
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x41 /* BT_WAKE_HOST */
+		>;
+	};
+
+	pinctrl_ecspi1_cs: ecspi1csgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09	0x40000
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK	0x82
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI	0x82
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO	0x82
+		>;
+	};
+
+	pinctrl_enet_pwr: enetpwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x11
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC			0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO			0x23
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0		0x91
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1		0x91
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2		0x91
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3		0x91
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x91
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0		0x1f
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1		0x1f
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2		0x1f
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3		0x1f
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1f
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09			0x19
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12			0x19
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD2__CAN1_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD1__CAN1_TX		0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000019
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001a3
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001a3
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL		0x400001a3
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c_brd_conf: i2cbrdconfgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x1c3 /* BRD_CONF_SCL, bitbang */
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x1c3 /* BRD_CONF_SDA, bitbang */
+		>;
+	};
+
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x41 /* PCIE CLKREQ */
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x41 /* PCIE WAKE */
+			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x41 /* PCIE RST */
+		>;
+	};
+
+	pinctrl_pmic: pmicirqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__PWM3_OUT		0x116
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT	0x116
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK	0xd6
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+			MX8MP_IOMUXC_UART4_RXD__UART2_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART4_TXD__UART2_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA7__UART3_DCE_RX	0x140
+			MX8MP_IOMUXC_SD1_DATA6__UART3_DCE_TX	0x140
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS	0x140
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DCE_RX	0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DCE_TX	0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__UART4_DCE_CTS	0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__UART4_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12 	0x1c4
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
+
+	pinctrl_wifi_ctrl: wifi-ctrlgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00	0x41 /* WL_REG_ON */
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x41 /* WL_WAKE_HOST */
+		>;
+	};
+};
+
+&pcie {
+	pinctrl-0 = <&pinctrl_pcie>;
+	pinctrl-names = "default";
+	reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
+};
+
+&pwm1 {
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-0 = <&pinctrl_pwm3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
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

