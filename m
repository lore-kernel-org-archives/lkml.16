Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF9274FD7;
	Mon,  7 Jul 2025 06:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868671; cv=none; b=CUmMYp3CmwU2kWEIjZcsWgOsdOUUDGqfveeysTBhEadOiHsEBtlSnj6lcAFhNLdKNYmlHCzExjLMzLa8tPMDu1Kib5dNM1LZ+tiT/CzSanCUmYb+3Y1BAd/VNbUszoym+QwzRj87Zi2IXCeifX0Ztjpht4kg5n+FZdN+qBJcfO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868671; c=relaxed/simple;
	bh=52KNtqpppTWU+cxm9wuauyUql2R4BBum7NHRep7vVEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KB+y223Y3qroLhda/5ofQTWshKfqedp60ObKjLo8F+AjFyk49d3zv9OsmGGQc62s6AISoRnjEeYlsWFhLtj7k1G2LoT6qCmxvPeEu0Uxm2V12JYJag0jeYyzHKwsyjEgvtFqMbYOs6guApyiHdflVcJkPraT8DrKhJiHH2IO3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=56226 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYf4B-00DKr8-1U;
	Mon, 07 Jul 2025 08:11:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 4/4] arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay
Date: Mon,  7 Jul 2025 08:11:01 +0200
Message-Id: <20250707061101.1194618-5-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707061101.1194618-1-primoz.fiser@norik.com>
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add overlay to support PHYTEC PEB-WLBT-07 WiFi/Bluetooth evaluation
adapter on phyBOARD-Nash-i.MX93 board. Adapter uses the u-blox MAYA-W2
module (IW612 chipset) which is capable of Wi-Fi 6 and Bluetooth 5.4 LE.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes 

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-phyboard-nash-peb-wlbt-07.dtso      | 88 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3166684ab558..699c3b1d80b2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -325,9 +325,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
new file mode 100644
index 000000000000..c7553e39e763
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Primoz Fiser <primoz.fiser@norik.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	usdhc3_pwrseq: usdhc3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+/*
+ * NOTE: When uSDHC3 port is multiplexed on GPIO_IO[27:22] pads, it only
+ * supports 50 MHz mode, due to introduction of potential variations in
+ * trace impedance, drive strength, and timing skew. Refer to i.MX 93
+ * Application Processors Data Sheet, Rev. 3, page 60 for more details.
+ */
+&usdhc3 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wlbt>;
+	pinctrl-1 = <&pinctrl_usdhc3_sleep>, <&pinctrl_wlbt>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX		0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__USDHC3_CLK		0x179e
+			MX93_PAD_SD3_CMD__USDHC3_CMD 		0x4000178e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__USDHC3_CLK		0x31e
+			MX93_PAD_SD3_CMD__USDHC3_CMD 		0x31e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x31e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x31e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x31e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x31e
+		>;
+	};
+
+	pinctrl_wlbt: wlbtgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO2__GPIO3_IO27		0x31e	/* WAKE_DEV */
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28		0x31e	/* WAKE_HOST */
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29		0x31e	/* PDn */
+		>;
+	};
+};
-- 
2.34.1

