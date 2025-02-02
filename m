Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84111D63D2;
	Sun,  2 Feb 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738489028; cv=none; b=VjeJOWaQKZxrPniyztZX7dwHN6tSMkodzeaMmDPwD0TWaJ8JTMB7ACofsNcydm4z7Qax/Q87ROJTUJvn5/d5ndsqWyVa9sEvn5PhCP39mKh2/88EkWXbKk4FZsKQXcZGAPTYNZJYLEAuPM4xoTx4gJqG8809HKHnE2RB6Uetl4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738489028; c=relaxed/simple;
	bh=ow2ZTVjd38YI22jo7d288Np7wUFFVj/yYu/+yNBu0og=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgylYQOBnXEIGHKvRAv+XY9a2KngixKW7bpdSLV17X7+yKXdrpVT5fNOJDOWhFlXUK8Z+um41IfeZ42FAwZsuW45NuiaO8mT2vxD8JH1feOjT6Zz9dDdbjMpof4zeL6gysbXEEw49eHZVGze+wRc7oxhebslETZu5iD/UmED02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C5CUMQvz; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C5CUMQvz"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129amjC2766294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Feb 2025 03:36:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489008;
	bh=WPVFyv0iH4U+Lt/kTEEv9lZCi5x+nZS5Ejh/zHNQ8WQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C5CUMQvz8oJGU27/B2jYl0TYuoJ8v1WMRb6rEDFbq+/MDxRBSmRYsDVKrNhydsUcV
	 9JueagME0ZsuA10UfiO8zZ+dogPy5FMhb1qhMnIXNQ9ceXiqr+R1sMdlYQpjH/80jC
	 dk957YGYhRZg5lYhLCotSBDnP0emTMhJJwyugwz4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129am5B086764;
	Sun, 2 Feb 2025 03:36:48 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:36:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:36:47 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129abbk119794;
	Sun, 2 Feb 2025 03:36:44 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
Date: Sun, 2 Feb 2025 15:06:29 +0530
Message-ID: <20250202093636.2699064-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250202093636.2699064-1-s-vadapalli@ti.com>
References: <20250202093636.2699064-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

PCIe NTB (Non-Transparent-Bridge) allows connecting the memory of
multiple PCIe Hosts (Root-Complex). The number of such hosts is
determined by the number of PCIe instances configured for NTB operation
on the device which intends to enable NTB functionality. Add a device-tree
overlay to configure PCIE0 and PCIE1 instances of PCIe on either J784S4 EVM
or J742S2 EVM for NTB operation. This shall allow connecting the memory of
two PCIe Hosts via PCIE0 and PCIE1 on J784S4 EVM or J742S2 EVM
respectively.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  7 ++
 .../dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso | 92 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 1097ab30f5a9..dbeb5d7401f7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -212,6 +213,10 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j742s2-evm-pcie-ntb-dtbs := k3-j742s2-evm.dtb \
+	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+k3-j784s4-evm-pcie-ntb-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -247,6 +252,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j742s2-evm-pcie-ntb.dtb \
+	k3-j784s4-evm-pcie-ntb.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
new file mode 100644
index 000000000000..e44173f670fa
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling NTB functionality using PCIE0 and PCIE1 instances of
+ * PCIe on the J784S4 EVM and the J742S2 EVM.
+ *
+ * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
+ * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	epf_bus {
+		compatible = "pci-epf-bus";
+
+		ntb {
+			compatible = "pci-epf-ntb";
+			epcs = <&pcie0_ep>, <&pcie1_ep>;
+			epc-names = "primary", "secondary";
+			vendor-id = /bits/ 16 <0x104c>;
+			device-id = /bits/ 16 <0xb012>;
+			num-mws = <4>;
+			mws-size = <0x100000>, <0x100000>, <0x100000>, <0x100000>;
+		};
+	};
+};
+
+&pcie0_rc {
+	status = "disabled";
+};
+
+&pcie1_rc {
+	status = "disabled";
+};
+
+&cbass_main {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic500>;
+
+	pcie0_ep: pcie-ep@2900000 {
+		compatible = "ti,j784s4-pcie-ep";
+		reg = <0x00 0x02900000 0x00 0x1000>,
+		      <0x00 0x02907000 0x00 0x400>,
+		      <0x00 0x0d000000 0x00 0x00800000>,
+		      <0x00 0x10000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
+		max-link-speed = <3>;
+		num-lanes = <4>;
+		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 332 0>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes1_pcie0_link>;
+		phy-names = "pcie-phy";
+	};
+
+	pcie1_ep: pcie-ep@2910000 {
+		compatible = "ti,j784s4-pcie-ep";
+		reg = <0x00 0x02910000 0x00 0x1000>,
+		      <0x00 0x02917000 0x00 0x400>,
+		      <0x00 0x0d800000 0x00 0x00800000>,
+		      <0x00 0x18000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
+		max-link-speed = <3>;
+		num-lanes = <2>;
+		power-domains = <&k3_pds 333 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 333 0>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes0_pcie1_link>;
+		phy-names = "pcie-phy";
+	};
+};
-- 
2.43.0

