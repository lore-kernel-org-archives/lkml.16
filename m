Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273EB1E570A;
	Tue, 11 Feb 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298132; cv=none; b=doqCgRmr0rNPLGuaS+yvSXBjkKcuOmrtGScHK8yBk8DY0tcG5xgKezKD8IT44QCKlV2J5CnBmBJOU5F5pq7u8jp9roUeexX0ObOzDU7PO+XH18v4I6YkjbIpOpBddmYNplNlr1nR/Lp3C9HdAfYATvykfbIqt7yppu/L6JRsY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298132; c=relaxed/simple;
	bh=drUWznsqYzBFdTs6zoqRvfCReDqxS5DHjVUce0N9hiY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmpEO5WQ0pEvMVQgI7KBj+XJoo0sev7Rv/bT79Q49SlsKqVvNxquvxpsvonyqYxvToA9yfqs3QviHLvFxQcfDJFM6wQQ8BMqnVcqK9OBbfIggBfLB1tcqAt4OcIBl3HCZbBEahm5fpbPvPHr0W5YmPyBWWBn/9sbQuyA7bzB6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Zb7wc66X; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zb7wc66X"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILd70285081
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 12:21:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739298100;
	bh=+l74RiUBFzia65G6oVdyvmIiQ3qIBktj4F8GrgBJkLo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zb7wc66Xd6MJotBsxlf/tI+1xyMfnl/QhLcNtIuXHyq+04S4cVaZodRFkHx20sKP0
	 SebjMvO0wCHQg0gFYA0mGQlYegM0hWhrDijz3BLNHQQ4IDYWDvc0yPVk1JfyJEJATu
	 CEjmtwrO590p8EmEtsPDmq0Bb538fWZqS9jgLyHE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BILdIe013681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 12:21:39 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 12:21:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 12:21:39 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BILcKO122968;
	Tue, 11 Feb 2025 12:21:39 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <c-vankar@ti.com>, Chintan Vankar <c-vankar@tii.com>,
        Ravi Gunasekaran
	<r-gunasekaran@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-am62a7: Add overlay for second CPSW3G Port
Date: Tue, 11 Feb 2025 23:51:34 +0530
Message-ID: <20250211182134.1500867-3-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211182134.1500867-1-c-vankar@ti.com>
References: <20250211182134.1500867-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Siddharth Vadapalli <s-vadapalli@ti.com>

The SK-Ethernet-DC01 Add-On Ethernet Card for AM62A7-SK board supports
RGMII mode.

Add overlay to enable the second CPSW3G port in RGMII-RXID mode with the
Add-On Ethernet Card.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@tii.com>
Reviewed-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Link to v3:
https://lore.kernel.org/r/20240429101739.2770090-3-c-vankar@ti.com/

Changes from v3 to v4:
- No changes.

 arch/arm64/boot/dts/ti/Makefile               |  3 +
 .../dts/ti/k3-am62a7-sk-ethernet-dc01.dtso    | 62 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8a4bdf87e2d4..7f9f0d3b9362 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
 # Boards with AM62Ax SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk-ethernet-dc01.dtbo
 
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
@@ -160,6 +161,8 @@ k3-am62a7-sk-csi2-ov5640-dtbs := k3-am62a7-sk.dtb \
 	k3-am62x-sk-csi2-ov5640.dtbo
 k3-am62a7-sk-csi2-tevi-ov5640-dtbs := k3-am62a7-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
+k3-am62a7-sk-ethernet-dc01-dtbs := k3-am62a7-sk.dtb \
+	k3-am62a7-sk-ethernet-dc01.dtbo
 k3-am62a7-sk-hdmi-audio-dtbs := k3-am62a7-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62p5-sk-csi2-imx219-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-imx219.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso b/arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso
new file mode 100644
index 000000000000..b06362de6642
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for second CPSW3G port in RGMII mode using SK-ETHERNET-DC01
+ * Add-On Daughtercard with AM62A7-SK.
+ *
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	aliases {
+		ethernet1 = "/bus@f0000/ethernet@8000000/ethernet-ports/port@2";
+	};
+};
+
+&cpsw3g {
+	pinctrl-0 = <&main_rgmii1_pins_default>,
+		    <&main_rgmii2_pins_default>;
+};
+
+&cpsw_port2 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&cpsw3g_phy1>;
+};
+
+&cpsw3g_mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	cpsw3g_phy1: ethernet-phy@1 {
+		reg = <1>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+		ti,min-output-impedance;
+	};
+};
+
+&main_pmx0 {
+	main_rgmii2_pins_default: main-rgmii2-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x0184, PIN_INPUT, 0) /* (AA21) RGMII2_RD0 */
+			AM62AX_IOPAD(0x0188, PIN_INPUT, 0) /* (Y20) RGMII2_RD1 */
+			AM62AX_IOPAD(0x018c, PIN_INPUT, 0) /* (AB21) RGMII2_RD2 */
+			AM62AX_IOPAD(0x0190, PIN_INPUT, 0) /* (AB20) RGMII2_RD3 */
+			AM62AX_IOPAD(0x0180, PIN_INPUT, 0) /* (AA20) RGMII2_RXC */
+			AM62AX_IOPAD(0x017c, PIN_INPUT, 0) /* (W18) RGMII2_RX_CTL */
+			AM62AX_IOPAD(0x016c, PIN_INPUT, 0) /* (AA19) RGMII2_TD0 */
+			AM62AX_IOPAD(0x0170, PIN_INPUT, 0) /* (Y18) RGMII2_TD1 */
+			AM62AX_IOPAD(0x0174, PIN_INPUT, 0) /* (AA18) RGMII2_TD2 */
+			AM62AX_IOPAD(0x0178, PIN_INPUT, 0) /* (W17) RGMII2_TD3 */
+			AM62AX_IOPAD(0x0168, PIN_INPUT, 0) /* (AB19) RGMII2_TXC */
+			AM62AX_IOPAD(0x0164, PIN_INPUT, 0) /* (Y19) RGMII2_TX_CTL */
+		>;
+	};
+};
-- 
2.34.1

