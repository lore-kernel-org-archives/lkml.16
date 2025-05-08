Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34050264628;
	Thu,  8 May 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695717; cv=none; b=WUmlMI+TNa4fEC2ep7ZwYnF1026MHatTPcXxzdAKWGJngVuaOGqrgv7hfQmhbZJfxSE5/ht1IxCMKWxnKAXGTKKhylrBc2c36YZoBcaBMncsUVKq/lSTwnOqdJjJOzirrbipFQjKmYnrtp02c4EU9AfIbzijRLQQYg8Mfc2EQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695717; c=relaxed/simple;
	bh=NyVL+n5rGYPAcb25REY5XIOo85q8i2QeJzbkI5aAeRU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGB2LcC4J+xjBlCOaK7ChXHAcDYr9fLswpRHKW3O1xsBQrkUV+2L2doKbNhIWG1zYlMdPC9wIE4qjImWvkzeIi8hSIcGgCVlFZhbySp9L6n0es85onFafcPqqFQ01/xdVz4zbNamKRsFWbgj8YkhPYe8sENDBveva3SKMMrcF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yYMsmMR6; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yYMsmMR6"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5489F1xV1632436
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 04:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746695701;
	bh=rdA0ILL3x5TBG186QLN1JUgQBs6q/6sdNoo7R+4bLtw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yYMsmMR6C2sjB2nJlKvsBTuqTCPfXsadJkzDt/JWxNa8AmE+3tnPu5bI5Ap1zdwDW
	 sN2laWOZ17gADwuhbd2tovZ1kzUtMmgML0q5HCfI/0jffO4vOXUVi6X1EXSkjtjPms
	 k67HaIykn9AheAnCF8EQobBLIp1gKn8YU2TT6yGU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5489F1MD092248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 04:15:01 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 04:15:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 04:15:00 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5489F0Z9110391;
	Thu, 8 May 2025 04:15:00 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: [PATCH v3 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Date: Thu, 8 May 2025 14:44:22 +0530
Message-ID: <20250508091422.288876-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508091422.288876-1-p-bhagat@ti.com>
References: <20250508091422.288876-1-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
designed for TI’s AM62D2 SoC. It supports the following interfaces:

* 4 GB LPDDR4 RAM
* x2 Gigabit Ethernet expansion connectors
* x4 3.5mm TRS Audio Jack Line In
* x4 3.5mm TRS Audio Jack Line Out
* x2 Audio expansion connectors
* x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
* x1 UHS-1 capable µSD card slot
* 32 GB eMMC Flash
* 512 Mb OSPI NOR flash
* x4 UARTs via USB 2.0-B
* XDS110 for onboard JTAG debug using USB
* Temperature sensors, user push buttons and LEDs

AM62A7 and AM62D2 SoCs share several peripherals in wakeup, mcu, thermal,
and portions of the main domain. To improve reuse and reduce duplication,
common *-wakeup.dtsi, *-mcu.dtsi, *-thermal.dtsi, and *-main.dtsi files
have been introduced. Each board will have a dedicated DTS file that
includes both the shared and SoC-specific .dtsi files.

Schematics Link - https://www.ti.com/lit/zip/sprcal5

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |    3 +
 .../dts/ti/k3-am62a-am62d-common-main.dtsi    | 1013 +++++++++++++++++
 ...cu.dtsi => k3-am62a-am62d-common-mcu.dtsi} |   26 +-
 ...tsi => k3-am62a-am62d-common-thermal.dtsi} |    2 +-
 ...dtsi => k3-am62a-am62d-common-wakeup.dtsi} |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     | 1005 ----------------
 arch/arm64/boot/dts/ti/k3-am62a.dtsi          |    9 +-
 arch/arm64/boot/dts/ti/k3-am62d.dtsi          |  123 ++
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      |  533 +++++++++
 arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  155 +++
 10 files changed, 1837 insertions(+), 1034 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
 rename arch/arm64/boot/dts/ti/{k3-am62a-mcu.dtsi => k3-am62a-am62d-common-mcu.dtsi} (86%)
 rename arch/arm64/boot/dts/ti/{k3-am62a-thermal.dtsi => k3-am62a-am62d-common-thermal.dtsi} (94%)
 rename arch/arm64/boot/dts/ti/{k3-am62a-wakeup.dtsi => k3-am62a-am62d-common-wakeup.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a48e7608de8b..1971f30879c9 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 
+# Boards with AM62Dx SoC
+dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
+
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
new file mode 100644
index 000000000000..570a6413165d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-main.dtsi
@@ -0,0 +1,1013 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the MAIN domain peripherals shared by AM62A and AM62D
+ *
+ * Copyright (C) 2022-2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&cbass_main {
+	oc_sram: sram@70000000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x70000000 0x00 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x00 0x70000000 0x10000>;
+	};
+
+	gic500: interrupt-controller@1800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
+		      <0x00 0x01880000 0x00 0xc0000>,	/* GICR */
+		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
+		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
+		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		/*
+		 * vcpumntirq:
+		 * virtual CPU interface maintenance interrupt
+		 */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+		gic_its: msi-controller@1820000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x00 0x01820000 0x00 0x10000>;
+			socionext,synquacer-pre-its = <0x1000000 0x400000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	main_conf: bus@100000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00 0x00 0x00100000 0x20000>;
+
+		phy_gmii_sel: phy@4044 {
+			compatible = "ti,am654-phy-gmii-sel";
+			reg = <0x4044 0x8>;
+			#phy-cells = <1>;
+		};
+
+		epwm_tbclk: clock-controller@4130 {
+			compatible = "ti,am62-epwm-tbclk";
+			reg = <0x4130 0x4>;
+			#clock-cells = <1>;
+		};
+
+		audio_refclk0: clock-controller@82e0 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x82e0 0x4>;
+			clocks = <&k3_clks 157 0>;
+			assigned-clocks = <&k3_clks 157 0>;
+			assigned-clock-parents = <&k3_clks 157 8>;
+			#clock-cells = <0>;
+		};
+
+		audio_refclk1: clock-controller@82e4 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x82e4 0x4>;
+			clocks = <&k3_clks 157 10>;
+			assigned-clocks = <&k3_clks 157 10>;
+			assigned-clock-parents = <&k3_clks 157 18>;
+			#clock-cells = <0>;
+		};
+	};
+
+	dmss: bus@48000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges;
+		ranges = <0x00 0x48000000 0x00 0x48000000 0x00 0x06000000>;
+
+		ti,sci-dev-id = <25>;
+
+		secure_proxy_main: mailbox@4d000000 {
+			compatible = "ti,am654-secure-proxy";
+			reg = <0x00 0x4d000000 0x00 0x80000>,
+			      <0x00 0x4a600000 0x00 0x80000>,
+			      <0x00 0x4a400000 0x00 0x80000>;
+			reg-names = "target_data", "rt", "scfg";
+			#mbox-cells = <1>;
+			interrupt-names = "rx_012";
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		inta_main_dmss: interrupt-controller@48000000 {
+			compatible = "ti,sci-inta";
+			reg = <0x00 0x48000000 0x00 0x100000>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupt-parent = <&gic500>;
+			msi-controller;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <28>;
+			ti,interrupt-ranges = <6 70 34>;
+			ti,unmapped-event-sources = <&main_bcdma>, <&main_pktdma>;
+		};
+
+		main_bcdma: dma-controller@485c0100 {
+			compatible = "ti,am64-dmss-bcdma";
+			reg = <0x00 0x485c0100 0x00 0x100>,
+			      <0x00 0x4c000000 0x00 0x20000>,
+			      <0x00 0x4a820000 0x00 0x20000>,
+			      <0x00 0x4aa40000 0x00 0x20000>,
+			      <0x00 0x4bc00000 0x00 0x100000>,
+			      <0x00 0x48600000 0x00 0x8000>,
+			      <0x00 0x484a4000 0x00 0x2000>,
+			      <0x00 0x484c2000 0x00 0x2000>,
+			      <0x00 0x48420000 0x00 0x2000>;
+			reg-names = "gcfg", "bchanrt", "rchanrt", "tchanrt", "ringrt",
+				    "ring", "tchan", "rchan", "bchan";
+			msi-parent = <&inta_main_dmss>;
+			#dma-cells = <3>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <26>;
+			ti,sci-rm-range-bchan = <0x20>; /* BLOCK_COPY_CHAN */
+			ti,sci-rm-range-rchan = <0x21>; /* SPLIT_TR_RX_CHAN */
+			ti,sci-rm-range-tchan = <0x22>; /* SPLIT_TR_TX_CHAN */
+		};
+
+		main_pktdma: dma-controller@485c0000 {
+			compatible = "ti,am64-dmss-pktdma";
+			reg = <0x00 0x485c0000 0x00 0x100>,
+			      <0x00 0x4a800000 0x00 0x20000>,
+			      <0x00 0x4aa00000 0x00 0x20000>,
+			      <0x00 0x4b800000 0x00 0x200000>,
+			      <0x00 0x485e0000 0x00 0x10000>,
+			      <0x00 0x484a0000 0x00 0x2000>,
+			      <0x00 0x484c0000 0x00 0x2000>,
+			      <0x00 0x48430000 0x00 0x1000>;
+			reg-names = "gcfg", "rchanrt", "tchanrt", "ringrt",
+				    "ring", "tchan", "rchan", "rflow";
+			msi-parent = <&inta_main_dmss>;
+			#dma-cells = <2>;
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <30>;
+			ti,sci-rm-range-tchan = <0x23>, /* UNMAPPED_TX_CHAN */
+						<0x24>, /* CPSW_TX_CHAN */
+						<0x25>, /* SAUL_TX_0_CHAN */
+						<0x26>; /* SAUL_TX_1_CHAN */
+			ti,sci-rm-range-tflow = <0x10>, /* RING_UNMAPPED_TX_CHAN */
+						<0x11>, /* RING_CPSW_TX_CHAN */
+						<0x12>, /* RING_SAUL_TX_0_CHAN */
+						<0x13>; /* RING_SAUL_TX_1_CHAN */
+			ti,sci-rm-range-rchan = <0x29>, /* UNMAPPED_RX_CHAN */
+						<0x2b>, /* CPSW_RX_CHAN */
+						<0x2d>, /* SAUL_RX_0_CHAN */
+						<0x2f>, /* SAUL_RX_1_CHAN */
+						<0x31>, /* SAUL_RX_2_CHAN */
+						<0x33>; /* SAUL_RX_3_CHAN */
+			ti,sci-rm-range-rflow = <0x2a>, /* FLOW_UNMAPPED_RX_CHAN */
+						<0x2c>, /* FLOW_CPSW_RX_CHAN */
+						<0x2e>, /* FLOW_SAUL_RX_0/1_CHAN */
+						<0x32>; /* FLOW_SAUL_RX_2/3_CHAN */
+		};
+	};
+
+	dmsc: system-controller@44043000 {
+		compatible = "ti,k2g-sci";
+		reg = <0x00 0x44043000 0x00 0xfe0>;
+		reg-names = "debug_messages";
+		ti,host-id = <12>;
+		mbox-names = "rx", "tx";
+		mboxes = <&secure_proxy_main 12>,
+			 <&secure_proxy_main 13>;
+
+		k3_pds: power-controller {
+			compatible = "ti,sci-pm-domain";
+			#power-domain-cells = <2>;
+		};
+
+		k3_clks: clock-controller {
+			compatible = "ti,k2g-sci-clk";
+			#clock-cells = <2>;
+		};
+
+		k3_reset: reset-controller {
+			compatible = "ti,sci-reset";
+			#reset-cells = <2>;
+		};
+	};
+
+	crypto: crypto@40900000 {
+		compatible = "ti,am62-sa3ul";
+		reg = <0x00 0x40900000 0x00 0x1200>;
+		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
+		       <&main_pktdma 0x7507 0>;
+		dma-names = "tx", "rx1", "rx2";
+	};
+
+	secure_proxy_sa3: mailbox@43600000 {
+		compatible = "ti,am654-secure-proxy";
+		#mbox-cells = <1>;
+		reg-names = "target_data", "rt", "scfg";
+		reg = <0x00 0x43600000 0x00 0x10000>,
+		      <0x00 0x44880000 0x00 0x20000>,
+		      <0x00 0x44860000 0x00 0x20000>;
+		/*
+		 * Marked Disabled:
+		 * Node is incomplete as it is meant for bootloaders and
+		 * firmware on non-MPU processors
+		 */
+		status = "disabled";
+	};
+
+	main_pmx0: pinctrl@f4000 {
+		compatible = "pinctrl-single";
+		reg = <0x00 0xf4000 0x00 0x2ac>;
+		#pinctrl-cells = <1>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0xffffffff>;
+	};
+
+	main_esm: esm@420000 {
+		compatible = "ti,j721e-esm";
+		reg = <0x0 0x420000 0x0 0x1000>;
+		bootph-pre-ram;
+		/* Interrupt sources: rti0, rti1, wrti0, rti4, rti2, rti3 */
+		ti,esm-pins = <192>, <193>, <195>, <204>, <209>, <210>;
+	};
+
+	main_timer0: timer@2400000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2400000 0x00 0x400>;
+		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 36 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 36 2>;
+		assigned-clock-parents = <&k3_clks 36 3>;
+		power-domains = <&k3_pds 36 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer1: timer@2410000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2410000 0x00 0x400>;
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 37 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 37 2>;
+		assigned-clock-parents = <&k3_clks 37 3>;
+		power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer2: timer@2420000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2420000 0x00 0x400>;
+		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 38 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 38 2>;
+		assigned-clock-parents = <&k3_clks 38 3>;
+		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer3: timer@2430000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2430000 0x00 0x400>;
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 39 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 39 2>;
+		assigned-clock-parents = <&k3_clks 39 3>;
+		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer4: timer@2440000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2440000 0x00 0x400>;
+		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 40 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 40 2>;
+		assigned-clock-parents = <&k3_clks 40 3>;
+		power-domains = <&k3_pds 40 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer5: timer@2450000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2450000 0x00 0x400>;
+		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 41 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 41 2>;
+		assigned-clock-parents = <&k3_clks 41 3>;
+		power-domains = <&k3_pds 41 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer6: timer@2460000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2460000 0x00 0x400>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 42 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 42 2>;
+		assigned-clock-parents = <&k3_clks 42 3>;
+		power-domains = <&k3_pds 42 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_timer7: timer@2470000 {
+		compatible = "ti,am654-timer";
+		reg = <0x00 0x2470000 0x00 0x400>;
+		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 43 2>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 43 2>;
+		assigned-clock-parents = <&k3_clks 43 3>;
+		power-domains = <&k3_pds 43 TI_SCI_PD_EXCLUSIVE>;
+		ti,timer-pwm;
+	};
+
+	main_uart0: serial@2800000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02800000 0x00 0x100>;
+		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 146 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart1: serial@2810000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02810000 0x00 0x100>;
+		interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 152 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart2: serial@2820000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02820000 0x00 0x100>;
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 153 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart3: serial@2830000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02830000 0x00 0x100>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 154 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart4: serial@2840000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02840000 0x00 0x100>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 155 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart5: serial@2850000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02850000 0x00 0x100>;
+		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 156 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 156 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_uart6: serial@2860000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02860000 0x00 0x100>;
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 158 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 158 0>;
+		clock-names = "fclk";
+		status = "disabled";
+	};
+
+	main_i2c0: i2c@20000000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20000000 0x00 0x100>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 102 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 102 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	main_i2c1: i2c@20010000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20010000 0x00 0x100>;
+		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 103 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 103 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	main_i2c2: i2c@20020000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20020000 0x00 0x100>;
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 104 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 104 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	main_i2c3: i2c@20030000 {
+		compatible = "ti,am64-i2c", "ti,omap4-i2c";
+		reg = <0x00 0x20030000 0x00 0x100>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 105 2>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	main_spi0: spi@20100000 {
+		compatible = "ti,am654-mcspi", "ti,omap4-mcspi";
+		reg = <0x00 0x20100000 0x00 0x400>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 141 0>;
+		status = "disabled";
+	};
+
+	main_spi1: spi@20110000 {
+		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
+		reg = <0x00 0x20110000 0x00 0x400>;
+		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 142 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 142 0>;
+		status = "disabled";
+	};
+
+	main_spi2: spi@20120000 {
+		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
+		reg = <0x00 0x20120000 0x00 0x400>;
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		power-domains = <&k3_pds 143 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 143 0>;
+		status = "disabled";
+	};
+
+	main_gpio_intr: interrupt-controller@a00000 {
+		compatible = "ti,sci-intr";
+		reg = <0x00 0x00a00000 0x00 0x800>;
+		ti,intr-trigger-type = <1>;
+		interrupt-controller;
+		interrupt-parent = <&gic500>;
+		#interrupt-cells = <1>;
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <3>;
+		ti,interrupt-ranges = <0 32 16>;
+		status = "disabled";
+	};
+
+	main_gpio0: gpio@600000 {
+		compatible = "ti,am64-gpio", "ti,keystone-gpio";
+		reg = <0x00 0x00600000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <190>, <191>, <192>,
+			     <193>, <194>, <195>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <92>;
+		ti,davinci-gpio-unbanked = <0>;
+		power-domains = <&k3_pds 77 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 77 0>;
+		clock-names = "gpio";
+		status = "disabled";
+	};
+
+	main_gpio1: gpio@601000 {
+		compatible = "ti,am64-gpio", "ti,keystone-gpio";
+		reg = <0x00 0x00601000 0x0 0x100>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio_intr>;
+		interrupts = <180>, <181>, <182>,
+			     <183>, <184>, <185>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		ti,ngpio = <52>;
+		ti,davinci-gpio-unbanked = <0>;
+		power-domains = <&k3_pds 78 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 78 0>;
+		clock-names = "gpio";
+		status = "disabled";
+	};
+
+	sdhci0: mmc@fa10000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x00 0xfa10000 0x00 0x260>, <0x00 0xfa18000 0x00 0x134>;
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
+		clock-names = "clk_ahb", "clk_xin";
+		assigned-clocks = <&k3_clks 57 6>;
+		assigned-clock-parents = <&k3_clks 57 8>;
+		bus-width = <8>;
+		mmc-hs200-1_8v;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-hs200 = <0x6>;
+		status = "disabled";
+	};
+
+	sdhci1: mmc@fa00000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x00 0xfa00000 0x00 0x260>, <0x00 0xfa08000 0x00 0x134>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 58 5>, <&k3_clks 58 6>;
+		clock-names = "clk_ahb", "clk_xin";
+		bus-width = <4>;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-sdr12 = <0xf>;
+		ti,otap-del-sel-sdr25 = <0xf>;
+		ti,otap-del-sel-sdr50 = <0xc>;
+		ti,otap-del-sel-sdr104 = <0x6>;
+		ti,otap-del-sel-ddr50 = <0x9>;
+		ti,itap-del-sel-legacy = <0x0>;
+		ti,itap-del-sel-sd-hs = <0x0>;
+		ti,itap-del-sel-sdr12 = <0x0>;
+		ti,itap-del-sel-sdr25 = <0x0>;
+		status = "disabled";
+	};
+
+	sdhci2: mmc@fa20000 {
+		compatible = "ti,am62-sdhci";
+		reg = <0x00 0xfa20000 0x00 0x260>, <0x00 0xfa28000 0x00 0x134>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 184 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 184 5>, <&k3_clks 184 6>;
+		clock-names = "clk_ahb", "clk_xin";
+		bus-width = <4>;
+		ti,clkbuf-sel = <0x7>;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-sdr12 = <0xf>;
+		ti,otap-del-sel-sdr25 = <0xf>;
+		ti,otap-del-sel-sdr50 = <0xc>;
+		ti,otap-del-sel-sdr104 = <0x6>;
+		ti,otap-del-sel-ddr50 = <0x9>;
+		ti,itap-del-sel-legacy = <0x0>;
+		ti,itap-del-sel-sd-hs = <0x0>;
+		ti,itap-del-sel-sdr12 = <0x0>;
+		ti,itap-del-sel-sdr25 = <0x0>;
+		status = "disabled";
+	};
+
+	usbss0: dwc3-usb@f900000 {
+		compatible = "ti,am62-usb";
+		reg = <0x00 0x0f900000 0x00 0x800>,
+		      <0x00 0x0f908000 0x00 0x400>;
+		clocks = <&k3_clks 161 3>;
+		clock-names = "ref";
+		ti,syscon-phy-pll-refclk = <&usb0_phy_ctrl 0x0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		power-domains = <&k3_pds 178 TI_SCI_PD_EXCLUSIVE>;
+		ranges;
+		status = "disabled";
+
+		usb0: usb@31000000 {
+			compatible = "snps,dwc3";
+			reg = <0x00 0x31000000 0x00 0x50000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
+			interrupt-names = "host", "peripheral";
+			maximum-speed = "high-speed";
+			dr_mode = "otg";
+			snps,usb2-gadget-lpm-disable;
+			snps,usb2-lpm-disable;
+		};
+	};
+
+	usbss1: dwc3-usb@f910000 {
+		compatible = "ti,am62-usb";
+		reg = <0x00 0x0f910000 0x00 0x800>,
+		      <0x00 0x0f918000 0x00 0x400>;
+		clocks = <&k3_clks 162 3>;
+		clock-names = "ref";
+		ti,syscon-phy-pll-refclk = <&usb1_phy_ctrl 0x0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
+		ranges;
+		status = "disabled";
+
+		usb1: usb@31100000 {
+			compatible = "snps,dwc3";
+			reg = <0x00 0x31100000 0x00 0x50000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
+			interrupt-names = "host", "peripheral";
+			maximum-speed = "high-speed";
+			dr_mode = "otg";
+			snps,usb2-gadget-lpm-disable;
+			snps,usb2-lpm-disable;
+		};
+	};
+
+	fss: bus@fc00000 {
+		compatible = "simple-bus";
+		reg = <0x00 0x0fc00000 0x00 0x70000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		ospi0: spi@fc40000 {
+			compatible = "ti,am654-ospi", "cdns,qspi-nor";
+			reg = <0x00 0x0fc40000 0x00 0x100>,
+			      <0x05 0x00000000 0x01 0x00000000>;
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+			cdns,fifo-depth = <256>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x0>;
+			clocks = <&k3_clks 75 7>;
+			assigned-clocks = <&k3_clks 75 7>;
+			assigned-clock-parents = <&k3_clks 75 8>;
+			assigned-clock-rates = <166666666>;
+			power-domains = <&k3_pds 75 TI_SCI_PD_EXCLUSIVE>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	cpsw3g: ethernet@8000000 {
+		compatible = "ti,am642-cpsw-nuss";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		reg = <0x0 0x8000000 0x0 0x200000>;
+		reg-names = "cpsw_nuss";
+		ranges = <0x0 0x0 0x0 0x8000000 0x0 0x200000>;
+		clocks = <&k3_clks 13 0>;
+		assigned-clocks = <&k3_clks 13 3>;
+		assigned-clock-parents = <&k3_clks 13 11>;
+		clock-names = "fck";
+		power-domains = <&k3_pds 13 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		dmas = <&main_pktdma 0xc600 15>,
+		       <&main_pktdma 0xc601 15>,
+		       <&main_pktdma 0xc602 15>,
+		       <&main_pktdma 0xc603 15>,
+		       <&main_pktdma 0xc604 15>,
+		       <&main_pktdma 0xc605 15>,
+		       <&main_pktdma 0xc606 15>,
+		       <&main_pktdma 0xc607 15>,
+		       <&main_pktdma 0x4600 15>;
+		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
+			    "tx7", "rx";
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cpsw_port1: port@1 {
+				reg = <1>;
+				ti,mac-only;
+				label = "port1";
+				phys = <&phy_gmii_sel 1>;
+				mac-address = [00 00 00 00 00 00];
+				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
+			};
+
+			cpsw_port2: port@2 {
+				reg = <2>;
+				ti,mac-only;
+				label = "port2";
+				phys = <&phy_gmii_sel 2>;
+				mac-address = [00 00 00 00 00 00];
+			};
+		};
+
+		cpsw3g_mdio: mdio@f00 {
+			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+			reg = <0x0 0xf00 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&k3_clks 13 0>;
+			clock-names = "fck";
+			bus_freq = <1000000>;
+		};
+
+		cpts@3d000 {
+			compatible = "ti,j721e-cpts";
+			reg = <0x0 0x3d000 0x0 0x400>;
+			clocks = <&k3_clks 13 3>;
+			clock-names = "cpts";
+			interrupts-extended = <&gic500 GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cpts";
+			ti,cpts-ext-ts-inputs = <4>;
+			ti,cpts-periodic-outputs = <2>;
+		};
+	};
+
+	hwspinlock: spinlock@2a000000 {
+		compatible = "ti,am64-hwspinlock";
+		reg = <0x00 0x2a000000 0x00 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
+	mailbox0_cluster0: mailbox@29000000 {
+		compatible = "ti,am64-mailbox";
+		reg = <0x00 0x29000000 0x00 0x200>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+		ti,mbox-num-users = <4>;
+		ti,mbox-num-fifos = <16>;
+	};
+
+	mailbox0_cluster1: mailbox@29010000 {
+		compatible = "ti,am64-mailbox";
+		reg = <0x00 0x29010000 0x00 0x200>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+		ti,mbox-num-users = <4>;
+		ti,mbox-num-fifos = <16>;
+	};
+
+	mailbox0_cluster2: mailbox@29020000 {
+		compatible = "ti,am64-mailbox";
+		reg = <0x00 0x29020000 0x00 0x200>;
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+		ti,mbox-num-users = <4>;
+		ti,mbox-num-fifos = <16>;
+	};
+
+	mailbox0_cluster3: mailbox@29030000 {
+		compatible = "ti,am64-mailbox";
+		reg = <0x00 0x29030000 0x00 0x200>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;
+		ti,mbox-num-users = <4>;
+		ti,mbox-num-fifos = <16>;
+	};
+
+	main_mcan0: can@20701000 {
+		compatible = "bosch,m_can";
+		reg = <0x00 0x20701000 0x00 0x200>,
+		      <0x00 0x20708000 0x00 0x8000>;
+		reg-names = "m_can", "message_ram";
+		power-domains = <&k3_pds 98 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 98 6>, <&k3_clks 98 1>;
+		clock-names = "hclk", "cclk";
+		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+		status = "disabled";
+	};
+
+	main_rti0: watchdog@e000000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x0e000000 0x00 0x100>;
+		clocks = <&k3_clks 125 0>;
+		power-domains = <&k3_pds 125 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 125 0>;
+		assigned-clock-parents = <&k3_clks 125 2>;
+	};
+
+	main_rti1: watchdog@e010000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x0e010000 0x00 0x100>;
+		clocks = <&k3_clks 126 0>;
+		power-domains = <&k3_pds 126 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 126 0>;
+		assigned-clock-parents = <&k3_clks 126 2>;
+	};
+
+	main_rti2: watchdog@e020000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x0e020000 0x00 0x100>;
+		clocks = <&k3_clks 127 0>;
+		power-domains = <&k3_pds 127 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 127 0>;
+		assigned-clock-parents = <&k3_clks 127 2>;
+	};
+
+	main_rti3: watchdog@e030000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x0e030000 0x00 0x100>;
+		clocks = <&k3_clks 128 0>;
+		power-domains = <&k3_pds 128 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 128 0>;
+		assigned-clock-parents = <&k3_clks 128 2>;
+	};
+
+	main_rti4: watchdog@e040000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x0e040000 0x00 0x100>;
+		clocks = <&k3_clks 205 0>;
+		power-domains = <&k3_pds 205 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 205 0>;
+		assigned-clock-parents = <&k3_clks 205 2>;
+	};
+
+	epwm0: pwm@23000000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23000000 0x00 0x100>;
+		power-domains = <&k3_pds 86 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&epwm_tbclk 0>, <&k3_clks 86 0>;
+		clock-names = "tbclk", "fck";
+		status = "disabled";
+	};
+
+	epwm1: pwm@23010000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23010000 0x00 0x100>;
+		power-domains = <&k3_pds 87 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&epwm_tbclk 1>, <&k3_clks 87 0>;
+		clock-names = "tbclk", "fck";
+		status = "disabled";
+	};
+
+	epwm2: pwm@23020000 {
+		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23020000 0x00 0x100>;
+		power-domains = <&k3_pds 88 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&epwm_tbclk 2>, <&k3_clks 88 0>;
+		clock-names = "tbclk", "fck";
+		status = "disabled";
+	};
+
+	ecap0: pwm@23100000 {
+		compatible = "ti,am3352-ecap";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23100000 0x00 0x100>;
+		power-domains = <&k3_pds 51 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 51 0>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	ecap1: pwm@23110000 {
+		compatible = "ti,am3352-ecap";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23110000 0x00 0x100>;
+		power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 52 0>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	ecap2: pwm@23120000 {
+		compatible = "ti,am3352-ecap";
+		#pwm-cells = <3>;
+		reg = <0x00 0x23120000 0x00 0x100>;
+		power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 53 0>;
+		clock-names = "fck";
+		status = "disabled";
+	};
+
+	eqep0: counter@23200000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23200000 0x00 0x100>;
+		power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 59 0>;
+		interrupts = <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	eqep1: counter@23210000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23210000 0x00 0x100>;
+		power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 60 0>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	eqep2: counter@23220000 {
+		compatible = "ti,am62-eqep";
+		reg = <0x00 0x23220000 0x00 0x100>;
+		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 62 0>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_EDGE_RISING>;
+		status = "disabled";
+	};
+
+	mcasp0: audio-controller@2b00000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b00000 0x00 0x2000>,
+		      <0x00 0x02b08000 0x00 0x400>;
+		reg-names = "mpu", "dat";
+		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+
+		dmas = <&main_bcdma 0 0xc500 0>, <&main_bcdma 0 0x4500 0>;
+		dma-names = "tx", "rx";
+
+		clocks = <&k3_clks 190 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 190 0>;
+		assigned-clock-parents = <&k3_clks 190 2>;
+		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp1: audio-controller@2b10000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b10000 0x00 0x2000>,
+		      <0x00 0x02b18000 0x00 0x400>;
+		reg-names = "mpu", "dat";
+		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+
+		dmas = <&main_bcdma 0 0xc501 0>, <&main_bcdma 0 0x4501 0>;
+		dma-names = "tx", "rx";
+
+		clocks = <&k3_clks 191 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 191 0>;
+		assigned-clock-parents = <&k3_clks 191 2>;
+		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	mcasp2: audio-controller@2b20000 {
+		compatible = "ti,am33xx-mcasp-audio";
+		reg = <0x00 0x02b20000 0x00 0x2000>,
+		      <0x00 0x02b28000 0x00 0x400>;
+		reg-names = "mpu", "dat";
+		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tx", "rx";
+
+		dmas = <&main_bcdma 0 0xc502 0>, <&main_bcdma 0 0x4502 0>;
+		dma-names = "tx", "rx";
+
+		clocks = <&k3_clks 192 0>;
+		clock-names = "fck";
+		assigned-clocks = <&k3_clks 192 0>;
+		assigned-clock-parents = <&k3_clks 192 2>;
+		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	dphy0: phy@30110000 {
+		compatible = "cdns,dphy-rx";
+		reg = <0x00 0x30110000 0x00 0x1100>;
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 185 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	c7x_0: dsp@7e000000 {
+		compatible = "ti,am62a-c7xv-dsp";
+		reg = <0x00 0x7e000000 0x00 0x00100000>;
+		reg-names = "l2sram";
+		resets = <&k3_reset 208 1>;
+		firmware-name = "am62a-c71_0-fw";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <208>;
+		ti,sci-proc-ids = <0x04 0xff>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-mcu.dtsi
similarity index 86%
rename from arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
rename to arch/arm64/boot/dts/ti/k3-am62a-am62d-common-mcu.dtsi
index ee961ced7208..537ab8ec524b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-mcu.dtsi
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 /*
- * Device Tree Source for AM625 SoC Family MCU Domain peripherals
+ * Device Tree file for the MCU domain peripherals shared by AM62A and AM62D
  *
- * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2020-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 &cbass_mcu {
@@ -89,28 +89,6 @@ mcu_i2c0: i2c@4900000 {
 		status = "disabled";
 	};
 
-	mcu_spi0: spi@4b00000 {
-		compatible = "ti,am654-mcspi", "ti,omap4-mcspi";
-		reg = <0x00 0x04b00000 0x00 0x400>;
-		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 147 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 147 0>;
-		status = "disabled";
-	};
-
-	mcu_spi1: spi@4b10000 {
-		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
-		reg = <0x00 0x04b10000 0x00 0x400>;
-		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 148 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 148 0>;
-		status = "disabled";
-	};
-
 	mcu_gpio_intr: interrupt-controller@4210000 {
 		compatible = "ti,sci-intr";
 		reg = <0x00 0x04210000 0x00 0x200>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-thermal.dtsi
similarity index 94%
rename from arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
rename to arch/arm64/boot/dts/ti/k3-am62a-am62d-common-thermal.dtsi
index c7486fb2a5b4..5298c9973169 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-thermal.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 /*
- * Copyright (C) 2023-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <dt-bindings/thermal/thermal.h>
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-wakeup.dtsi
similarity index 97%
rename from arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
rename to arch/arm64/boot/dts/ti/k3-am62a-am62d-common-wakeup.dtsi
index 259ae6ebbfb5..2f38a58e8efb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-am62d-common-wakeup.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 /*
- * Device Tree Source for AM62A SoC Family Wakeup Domain peripherals
+ * Device Tree file for the WAKEUP domain peripherals shared by AM62A and AM62D
  *
  * Copyright (C) 2022-2025 Texas Instruments Incorporated - https://www.ti.com/
  */
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index d296e9e17973..662ecc756fef 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -6,170 +6,6 @@
  */
 
 &cbass_main {
-	oc_sram: sram@70000000 {
-		compatible = "mmio-sram";
-		reg = <0x00 0x70000000 0x00 0x10000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x00 0x70000000 0x10000>;
-	};
-
-	gic500: interrupt-controller@1800000 {
-		compatible = "arm,gic-v3";
-		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
-		      <0x00 0x01880000 0x00 0xc0000>,	/* GICR */
-		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
-		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
-		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		/*
-		 * vcpumntirq:
-		 * virtual CPU interface maintenance interrupt
-		 */
-		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-
-		gic_its: msi-controller@1820000 {
-			compatible = "arm,gic-v3-its";
-			reg = <0x00 0x01820000 0x00 0x10000>;
-			socionext,synquacer-pre-its = <0x1000000 0x400000>;
-			msi-controller;
-			#msi-cells = <1>;
-		};
-	};
-
-	main_conf: bus@100000 {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x00 0x00 0x00100000 0x20000>;
-
-		phy_gmii_sel: phy@4044 {
-			compatible = "ti,am654-phy-gmii-sel";
-			reg = <0x4044 0x8>;
-			#phy-cells = <1>;
-		};
-
-		epwm_tbclk: clock-controller@4130 {
-			compatible = "ti,am62-epwm-tbclk";
-			reg = <0x4130 0x4>;
-			#clock-cells = <1>;
-		};
-
-		audio_refclk0: clock-controller@82e0 {
-			compatible = "ti,am62-audio-refclk";
-			reg = <0x82e0 0x4>;
-			clocks = <&k3_clks 157 0>;
-			assigned-clocks = <&k3_clks 157 0>;
-			assigned-clock-parents = <&k3_clks 157 8>;
-			#clock-cells = <0>;
-		};
-
-		audio_refclk1: clock-controller@82e4 {
-			compatible = "ti,am62-audio-refclk";
-			reg = <0x82e4 0x4>;
-			clocks = <&k3_clks 157 10>;
-			assigned-clocks = <&k3_clks 157 10>;
-			assigned-clock-parents = <&k3_clks 157 18>;
-			#clock-cells = <0>;
-		};
-	};
-
-	dmss: bus@48000000 {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		dma-ranges;
-		ranges = <0x00 0x48000000 0x00 0x48000000 0x00 0x06000000>;
-
-		ti,sci-dev-id = <25>;
-
-		secure_proxy_main: mailbox@4d000000 {
-			compatible = "ti,am654-secure-proxy";
-			reg = <0x00 0x4d000000 0x00 0x80000>,
-			      <0x00 0x4a600000 0x00 0x80000>,
-			      <0x00 0x4a400000 0x00 0x80000>;
-			reg-names = "target_data", "rt", "scfg";
-			#mbox-cells = <1>;
-			interrupt-names = "rx_012";
-			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		inta_main_dmss: interrupt-controller@48000000 {
-			compatible = "ti,sci-inta";
-			reg = <0x00 0x48000000 0x00 0x100000>;
-			#interrupt-cells = <0>;
-			interrupt-controller;
-			interrupt-parent = <&gic500>;
-			msi-controller;
-			ti,sci = <&dmsc>;
-			ti,sci-dev-id = <28>;
-			ti,interrupt-ranges = <6 70 34>;
-			ti,unmapped-event-sources = <&main_bcdma>, <&main_pktdma>;
-		};
-
-		main_bcdma: dma-controller@485c0100 {
-			compatible = "ti,am64-dmss-bcdma";
-			reg = <0x00 0x485c0100 0x00 0x100>,
-			      <0x00 0x4c000000 0x00 0x20000>,
-			      <0x00 0x4a820000 0x00 0x20000>,
-			      <0x00 0x4aa40000 0x00 0x20000>,
-			      <0x00 0x4bc00000 0x00 0x100000>,
-			      <0x00 0x48600000 0x00 0x8000>,
-			      <0x00 0x484a4000 0x00 0x2000>,
-			      <0x00 0x484c2000 0x00 0x2000>,
-			      <0x00 0x48420000 0x00 0x2000>;
-			reg-names = "gcfg", "bchanrt", "rchanrt", "tchanrt", "ringrt",
-				    "ring", "tchan", "rchan", "bchan";
-			msi-parent = <&inta_main_dmss>;
-			#dma-cells = <3>;
-			ti,sci = <&dmsc>;
-			ti,sci-dev-id = <26>;
-			ti,sci-rm-range-bchan = <0x20>; /* BLOCK_COPY_CHAN */
-			ti,sci-rm-range-rchan = <0x21>; /* SPLIT_TR_RX_CHAN */
-			ti,sci-rm-range-tchan = <0x22>; /* SPLIT_TR_TX_CHAN */
-		};
-
-		main_pktdma: dma-controller@485c0000 {
-			compatible = "ti,am64-dmss-pktdma";
-			reg = <0x00 0x485c0000 0x00 0x100>,
-			      <0x00 0x4a800000 0x00 0x20000>,
-			      <0x00 0x4aa00000 0x00 0x20000>,
-			      <0x00 0x4b800000 0x00 0x200000>,
-			      <0x00 0x485e0000 0x00 0x10000>,
-			      <0x00 0x484a0000 0x00 0x2000>,
-			      <0x00 0x484c0000 0x00 0x2000>,
-			      <0x00 0x48430000 0x00 0x1000>;
-			reg-names = "gcfg", "rchanrt", "tchanrt", "ringrt",
-				    "ring", "tchan", "rchan", "rflow";
-			msi-parent = <&inta_main_dmss>;
-			#dma-cells = <2>;
-			ti,sci = <&dmsc>;
-			ti,sci-dev-id = <30>;
-			ti,sci-rm-range-tchan = <0x23>, /* UNMAPPED_TX_CHAN */
-						<0x24>, /* CPSW_TX_CHAN */
-						<0x25>, /* SAUL_TX_0_CHAN */
-						<0x26>; /* SAUL_TX_1_CHAN */
-			ti,sci-rm-range-tflow = <0x10>, /* RING_UNMAPPED_TX_CHAN */
-						<0x11>, /* RING_CPSW_TX_CHAN */
-						<0x12>, /* RING_SAUL_TX_0_CHAN */
-						<0x13>; /* RING_SAUL_TX_1_CHAN */
-			ti,sci-rm-range-rchan = <0x29>, /* UNMAPPED_RX_CHAN */
-						<0x2b>, /* CPSW_RX_CHAN */
-						<0x2d>, /* SAUL_RX_0_CHAN */
-						<0x2f>, /* SAUL_RX_1_CHAN */
-						<0x31>, /* SAUL_RX_2_CHAN */
-						<0x33>; /* SAUL_RX_3_CHAN */
-			ti,sci-rm-range-rflow = <0x2a>, /* FLOW_UNMAPPED_RX_CHAN */
-						<0x2c>, /* FLOW_CPSW_RX_CHAN */
-						<0x2e>, /* FLOW_SAUL_RX_0/1_CHAN */
-						<0x32>; /* FLOW_SAUL_RX_2/3_CHAN */
-		};
-	};
-
 	dmss_csi: bus@4e000000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -208,827 +44,6 @@ main_bcdma_csi: dma-controller@4e230000 {
 		};
 	};
 
-	dmsc: system-controller@44043000 {
-		compatible = "ti,k2g-sci";
-		reg = <0x00 0x44043000 0x00 0xfe0>;
-		reg-names = "debug_messages";
-		ti,host-id = <12>;
-		mbox-names = "rx", "tx";
-		mboxes = <&secure_proxy_main 12>,
-			 <&secure_proxy_main 13>;
-
-		k3_pds: power-controller {
-			compatible = "ti,sci-pm-domain";
-			#power-domain-cells = <2>;
-		};
-
-		k3_clks: clock-controller {
-			compatible = "ti,k2g-sci-clk";
-			#clock-cells = <2>;
-		};
-
-		k3_reset: reset-controller {
-			compatible = "ti,sci-reset";
-			#reset-cells = <2>;
-		};
-	};
-
-	crypto: crypto@40900000 {
-		compatible = "ti,am62-sa3ul";
-		reg = <0x00 0x40900000 0x00 0x1200>;
-		dmas = <&main_pktdma 0xf501 0>, <&main_pktdma 0x7506 0>,
-		       <&main_pktdma 0x7507 0>;
-		dma-names = "tx", "rx1", "rx2";
-	};
-
-	secure_proxy_sa3: mailbox@43600000 {
-		compatible = "ti,am654-secure-proxy";
-		#mbox-cells = <1>;
-		reg-names = "target_data", "rt", "scfg";
-		reg = <0x00 0x43600000 0x00 0x10000>,
-		      <0x00 0x44880000 0x00 0x20000>,
-		      <0x00 0x44860000 0x00 0x20000>;
-		/*
-		 * Marked Disabled:
-		 * Node is incomplete as it is meant for bootloaders and
-		 * firmware on non-MPU processors
-		 */
-		status = "disabled";
-	};
-
-	main_pmx0: pinctrl@f4000 {
-		compatible = "pinctrl-single";
-		reg = <0x00 0xf4000 0x00 0x2ac>;
-		#pinctrl-cells = <1>;
-		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0xffffffff>;
-	};
-
-	main_esm: esm@420000 {
-		compatible = "ti,j721e-esm";
-		reg = <0x0 0x420000 0x0 0x1000>;
-		bootph-pre-ram;
-		/* Interrupt sources: rti0, rti1, wrti0, rti4, rti2, rti3 */
-		ti,esm-pins = <192>, <193>, <195>, <204>, <209>, <210>;
-	};
-
-	main_timer0: timer@2400000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2400000 0x00 0x400>;
-		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 36 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 36 2>;
-		assigned-clock-parents = <&k3_clks 36 3>;
-		power-domains = <&k3_pds 36 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer1: timer@2410000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2410000 0x00 0x400>;
-		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 37 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 37 2>;
-		assigned-clock-parents = <&k3_clks 37 3>;
-		power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer2: timer@2420000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2420000 0x00 0x400>;
-		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 38 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 38 2>;
-		assigned-clock-parents = <&k3_clks 38 3>;
-		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer3: timer@2430000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2430000 0x00 0x400>;
-		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 39 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 39 2>;
-		assigned-clock-parents = <&k3_clks 39 3>;
-		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer4: timer@2440000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2440000 0x00 0x400>;
-		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 40 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 40 2>;
-		assigned-clock-parents = <&k3_clks 40 3>;
-		power-domains = <&k3_pds 40 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer5: timer@2450000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2450000 0x00 0x400>;
-		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 41 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 41 2>;
-		assigned-clock-parents = <&k3_clks 41 3>;
-		power-domains = <&k3_pds 41 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer6: timer@2460000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2460000 0x00 0x400>;
-		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 42 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 42 2>;
-		assigned-clock-parents = <&k3_clks 42 3>;
-		power-domains = <&k3_pds 42 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_timer7: timer@2470000 {
-		compatible = "ti,am654-timer";
-		reg = <0x00 0x2470000 0x00 0x400>;
-		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&k3_clks 43 2>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 43 2>;
-		assigned-clock-parents = <&k3_clks 43 3>;
-		power-domains = <&k3_pds 43 TI_SCI_PD_EXCLUSIVE>;
-		ti,timer-pwm;
-	};
-
-	main_uart0: serial@2800000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02800000 0x00 0x100>;
-		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 146 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart1: serial@2810000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02810000 0x00 0x100>;
-		interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 152 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart2: serial@2820000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02820000 0x00 0x100>;
-		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 153 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 153 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart3: serial@2830000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02830000 0x00 0x100>;
-		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 154 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart4: serial@2840000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02840000 0x00 0x100>;
-		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 155 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart5: serial@2850000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02850000 0x00 0x100>;
-		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 156 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 156 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_uart6: serial@2860000 {
-		compatible = "ti,am64-uart", "ti,am654-uart";
-		reg = <0x00 0x02860000 0x00 0x100>;
-		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 158 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 158 0>;
-		clock-names = "fclk";
-		status = "disabled";
-	};
-
-	main_i2c0: i2c@20000000 {
-		compatible = "ti,am64-i2c", "ti,omap4-i2c";
-		reg = <0x00 0x20000000 0x00 0x100>;
-		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 102 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 102 2>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	main_i2c1: i2c@20010000 {
-		compatible = "ti,am64-i2c", "ti,omap4-i2c";
-		reg = <0x00 0x20010000 0x00 0x100>;
-		interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 103 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 103 2>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	main_i2c2: i2c@20020000 {
-		compatible = "ti,am64-i2c", "ti,omap4-i2c";
-		reg = <0x00 0x20020000 0x00 0x100>;
-		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 104 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 104 2>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	main_i2c3: i2c@20030000 {
-		compatible = "ti,am64-i2c", "ti,omap4-i2c";
-		reg = <0x00 0x20030000 0x00 0x100>;
-		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 105 2>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	main_spi0: spi@20100000 {
-		compatible = "ti,am654-mcspi", "ti,omap4-mcspi";
-		reg = <0x00 0x20100000 0x00 0x400>;
-		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 141 0>;
-		status = "disabled";
-	};
-
-	main_spi1: spi@20110000 {
-		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
-		reg = <0x00 0x20110000 0x00 0x400>;
-		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 142 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 142 0>;
-		status = "disabled";
-	};
-
-	main_spi2: spi@20120000 {
-		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
-		reg = <0x00 0x20120000 0x00 0x400>;
-		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		power-domains = <&k3_pds 143 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 143 0>;
-		status = "disabled";
-	};
-
-	main_gpio_intr: interrupt-controller@a00000 {
-		compatible = "ti,sci-intr";
-		reg = <0x00 0x00a00000 0x00 0x800>;
-		ti,intr-trigger-type = <1>;
-		interrupt-controller;
-		interrupt-parent = <&gic500>;
-		#interrupt-cells = <1>;
-		ti,sci = <&dmsc>;
-		ti,sci-dev-id = <3>;
-		ti,interrupt-ranges = <0 32 16>;
-		status = "disabled";
-	};
-
-	main_gpio0: gpio@600000 {
-		compatible = "ti,am64-gpio", "ti,keystone-gpio";
-		reg = <0x00 0x00600000 0x0 0x100>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <190>, <191>, <192>,
-			     <193>, <194>, <195>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		ti,ngpio = <92>;
-		ti,davinci-gpio-unbanked = <0>;
-		power-domains = <&k3_pds 77 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 77 0>;
-		clock-names = "gpio";
-		status = "disabled";
-	};
-
-	main_gpio1: gpio@601000 {
-		compatible = "ti,am64-gpio", "ti,keystone-gpio";
-		reg = <0x00 0x00601000 0x0 0x100>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-parent = <&main_gpio_intr>;
-		interrupts = <180>, <181>, <182>,
-			     <183>, <184>, <185>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		ti,ngpio = <52>;
-		ti,davinci-gpio-unbanked = <0>;
-		power-domains = <&k3_pds 78 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 78 0>;
-		clock-names = "gpio";
-		status = "disabled";
-	};
-
-	sdhci0: mmc@fa10000 {
-		compatible = "ti,am62-sdhci";
-		reg = <0x00 0xfa10000 0x00 0x260>, <0x00 0xfa18000 0x00 0x134>;
-		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
-		clock-names = "clk_ahb", "clk_xin";
-		assigned-clocks = <&k3_clks 57 6>;
-		assigned-clock-parents = <&k3_clks 57 8>;
-		bus-width = <8>;
-		mmc-hs200-1_8v;
-		ti,clkbuf-sel = <0x7>;
-		ti,otap-del-sel-legacy = <0x0>;
-		ti,otap-del-sel-mmc-hs = <0x0>;
-		ti,otap-del-sel-hs200 = <0x6>;
-		status = "disabled";
-	};
-
-	sdhci1: mmc@fa00000 {
-		compatible = "ti,am62-sdhci";
-		reg = <0x00 0xfa00000 0x00 0x260>, <0x00 0xfa08000 0x00 0x134>;
-		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 58 5>, <&k3_clks 58 6>;
-		clock-names = "clk_ahb", "clk_xin";
-		bus-width = <4>;
-		ti,clkbuf-sel = <0x7>;
-		ti,otap-del-sel-legacy = <0x0>;
-		ti,otap-del-sel-sd-hs = <0x0>;
-		ti,otap-del-sel-sdr12 = <0xf>;
-		ti,otap-del-sel-sdr25 = <0xf>;
-		ti,otap-del-sel-sdr50 = <0xc>;
-		ti,otap-del-sel-sdr104 = <0x6>;
-		ti,otap-del-sel-ddr50 = <0x9>;
-		ti,itap-del-sel-legacy = <0x0>;
-		ti,itap-del-sel-sd-hs = <0x0>;
-		ti,itap-del-sel-sdr12 = <0x0>;
-		ti,itap-del-sel-sdr25 = <0x0>;
-		status = "disabled";
-	};
-
-	sdhci2: mmc@fa20000 {
-		compatible = "ti,am62-sdhci";
-		reg = <0x00 0xfa20000 0x00 0x260>, <0x00 0xfa28000 0x00 0x134>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 184 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 184 5>, <&k3_clks 184 6>;
-		clock-names = "clk_ahb", "clk_xin";
-		bus-width = <4>;
-		ti,clkbuf-sel = <0x7>;
-		ti,otap-del-sel-legacy = <0x0>;
-		ti,otap-del-sel-sd-hs = <0x0>;
-		ti,otap-del-sel-sdr12 = <0xf>;
-		ti,otap-del-sel-sdr25 = <0xf>;
-		ti,otap-del-sel-sdr50 = <0xc>;
-		ti,otap-del-sel-sdr104 = <0x6>;
-		ti,otap-del-sel-ddr50 = <0x9>;
-		ti,itap-del-sel-legacy = <0x0>;
-		ti,itap-del-sel-sd-hs = <0x0>;
-		ti,itap-del-sel-sdr12 = <0x0>;
-		ti,itap-del-sel-sdr25 = <0x0>;
-		status = "disabled";
-	};
-
-	usbss0: dwc3-usb@f900000 {
-		compatible = "ti,am62-usb";
-		reg = <0x00 0x0f900000 0x00 0x800>,
-		      <0x00 0x0f908000 0x00 0x400>;
-		clocks = <&k3_clks 161 3>;
-		clock-names = "ref";
-		ti,syscon-phy-pll-refclk = <&usb0_phy_ctrl 0x0>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		power-domains = <&k3_pds 178 TI_SCI_PD_EXCLUSIVE>;
-		ranges;
-		status = "disabled";
-
-		usb0: usb@31000000 {
-			compatible = "snps,dwc3";
-			reg = <0x00 0x31000000 0x00 0x50000>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
-				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
-			interrupt-names = "host", "peripheral";
-			maximum-speed = "high-speed";
-			dr_mode = "otg";
-			snps,usb2-gadget-lpm-disable;
-			snps,usb2-lpm-disable;
-		};
-	};
-
-	usbss1: dwc3-usb@f910000 {
-		compatible = "ti,am62-usb";
-		reg = <0x00 0x0f910000 0x00 0x800>,
-		      <0x00 0x0f918000 0x00 0x400>;
-		clocks = <&k3_clks 162 3>;
-		clock-names = "ref";
-		ti,syscon-phy-pll-refclk = <&usb1_phy_ctrl 0x0>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
-		ranges;
-		status = "disabled";
-
-		usb1: usb@31100000 {
-			compatible = "snps,dwc3";
-			reg = <0x00 0x31100000 0x00 0x50000>;
-			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
-				     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
-			interrupt-names = "host", "peripheral";
-			maximum-speed = "high-speed";
-			dr_mode = "otg";
-			snps,usb2-gadget-lpm-disable;
-			snps,usb2-lpm-disable;
-		};
-	};
-
-	fss: bus@fc00000 {
-		compatible = "simple-bus";
-		reg = <0x00 0x0fc00000 0x00 0x70000>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		status = "disabled";
-
-		ospi0: spi@fc40000 {
-			compatible = "ti,am654-ospi", "cdns,qspi-nor";
-			reg = <0x00 0x0fc40000 0x00 0x100>,
-			      <0x05 0x00000000 0x01 0x00000000>;
-			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
-			cdns,fifo-depth = <256>;
-			cdns,fifo-width = <4>;
-			cdns,trigger-address = <0x0>;
-			clocks = <&k3_clks 75 7>;
-			assigned-clocks = <&k3_clks 75 7>;
-			assigned-clock-parents = <&k3_clks 75 8>;
-			assigned-clock-rates = <166666666>;
-			power-domains = <&k3_pds 75 TI_SCI_PD_EXCLUSIVE>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-	};
-
-	cpsw3g: ethernet@8000000 {
-		compatible = "ti,am642-cpsw-nuss";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		reg = <0x0 0x8000000 0x0 0x200000>;
-		reg-names = "cpsw_nuss";
-		ranges = <0x0 0x0 0x0 0x8000000 0x0 0x200000>;
-		clocks = <&k3_clks 13 0>;
-		assigned-clocks = <&k3_clks 13 3>;
-		assigned-clock-parents = <&k3_clks 13 11>;
-		clock-names = "fck";
-		power-domains = <&k3_pds 13 TI_SCI_PD_EXCLUSIVE>;
-		status = "disabled";
-
-		dmas = <&main_pktdma 0xc600 15>,
-		       <&main_pktdma 0xc601 15>,
-		       <&main_pktdma 0xc602 15>,
-		       <&main_pktdma 0xc603 15>,
-		       <&main_pktdma 0xc604 15>,
-		       <&main_pktdma 0xc605 15>,
-		       <&main_pktdma 0xc606 15>,
-		       <&main_pktdma 0xc607 15>,
-		       <&main_pktdma 0x4600 15>;
-		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
-			    "tx7", "rx";
-
-		ethernet-ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cpsw_port1: port@1 {
-				reg = <1>;
-				ti,mac-only;
-				label = "port1";
-				phys = <&phy_gmii_sel 1>;
-				mac-address = [00 00 00 00 00 00];
-				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
-			};
-
-			cpsw_port2: port@2 {
-				reg = <2>;
-				ti,mac-only;
-				label = "port2";
-				phys = <&phy_gmii_sel 2>;
-				mac-address = [00 00 00 00 00 00];
-			};
-		};
-
-		cpsw3g_mdio: mdio@f00 {
-			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-			reg = <0x0 0xf00 0x0 0x100>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			clocks = <&k3_clks 13 0>;
-			clock-names = "fck";
-			bus_freq = <1000000>;
-		};
-
-		cpts@3d000 {
-			compatible = "ti,j721e-cpts";
-			reg = <0x0 0x3d000 0x0 0x400>;
-			clocks = <&k3_clks 13 3>;
-			clock-names = "cpts";
-			interrupts-extended = <&gic500 GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cpts";
-			ti,cpts-ext-ts-inputs = <4>;
-			ti,cpts-periodic-outputs = <2>;
-		};
-	};
-
-	hwspinlock: spinlock@2a000000 {
-		compatible = "ti,am64-hwspinlock";
-		reg = <0x00 0x2a000000 0x00 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
-	mailbox0_cluster0: mailbox@29000000 {
-		compatible = "ti,am64-mailbox";
-		reg = <0x00 0x29000000 0x00 0x200>;
-		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <1>;
-		ti,mbox-num-users = <4>;
-		ti,mbox-num-fifos = <16>;
-	};
-
-	mailbox0_cluster1: mailbox@29010000 {
-		compatible = "ti,am64-mailbox";
-		reg = <0x00 0x29010000 0x00 0x200>;
-		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <1>;
-		ti,mbox-num-users = <4>;
-		ti,mbox-num-fifos = <16>;
-	};
-
-	mailbox0_cluster2: mailbox@29020000 {
-		compatible = "ti,am64-mailbox";
-		reg = <0x00 0x29020000 0x00 0x200>;
-		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <1>;
-		ti,mbox-num-users = <4>;
-		ti,mbox-num-fifos = <16>;
-	};
-
-	mailbox0_cluster3: mailbox@29030000 {
-		compatible = "ti,am64-mailbox";
-		reg = <0x00 0x29030000 0x00 0x200>;
-		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-		#mbox-cells = <1>;
-		ti,mbox-num-users = <4>;
-		ti,mbox-num-fifos = <16>;
-	};
-
-	main_mcan0: can@20701000 {
-		compatible = "bosch,m_can";
-		reg = <0x00 0x20701000 0x00 0x200>,
-		      <0x00 0x20708000 0x00 0x8000>;
-		reg-names = "m_can", "message_ram";
-		power-domains = <&k3_pds 98 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 98 6>, <&k3_clks 98 1>;
-		clock-names = "hclk", "cclk";
-		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "int0", "int1";
-		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
-		status = "disabled";
-	};
-
-	main_rti0: watchdog@e000000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x0e000000 0x00 0x100>;
-		clocks = <&k3_clks 125 0>;
-		power-domains = <&k3_pds 125 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 125 0>;
-		assigned-clock-parents = <&k3_clks 125 2>;
-	};
-
-	main_rti1: watchdog@e010000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x0e010000 0x00 0x100>;
-		clocks = <&k3_clks 126 0>;
-		power-domains = <&k3_pds 126 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 126 0>;
-		assigned-clock-parents = <&k3_clks 126 2>;
-	};
-
-	main_rti2: watchdog@e020000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x0e020000 0x00 0x100>;
-		clocks = <&k3_clks 127 0>;
-		power-domains = <&k3_pds 127 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 127 0>;
-		assigned-clock-parents = <&k3_clks 127 2>;
-	};
-
-	main_rti3: watchdog@e030000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x0e030000 0x00 0x100>;
-		clocks = <&k3_clks 128 0>;
-		power-domains = <&k3_pds 128 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 128 0>;
-		assigned-clock-parents = <&k3_clks 128 2>;
-	};
-
-	main_rti4: watchdog@e040000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x0e040000 0x00 0x100>;
-		clocks = <&k3_clks 205 0>;
-		power-domains = <&k3_pds 205 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 205 0>;
-		assigned-clock-parents = <&k3_clks 205 2>;
-	};
-
-	epwm0: pwm@23000000 {
-		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23000000 0x00 0x100>;
-		power-domains = <&k3_pds 86 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&epwm_tbclk 0>, <&k3_clks 86 0>;
-		clock-names = "tbclk", "fck";
-		status = "disabled";
-	};
-
-	epwm1: pwm@23010000 {
-		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23010000 0x00 0x100>;
-		power-domains = <&k3_pds 87 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&epwm_tbclk 1>, <&k3_clks 87 0>;
-		clock-names = "tbclk", "fck";
-		status = "disabled";
-	};
-
-	epwm2: pwm@23020000 {
-		compatible = "ti,am64-epwm", "ti,am3352-ehrpwm";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23020000 0x00 0x100>;
-		power-domains = <&k3_pds 88 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&epwm_tbclk 2>, <&k3_clks 88 0>;
-		clock-names = "tbclk", "fck";
-		status = "disabled";
-	};
-
-	ecap0: pwm@23100000 {
-		compatible = "ti,am3352-ecap";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23100000 0x00 0x100>;
-		power-domains = <&k3_pds 51 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 51 0>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	ecap1: pwm@23110000 {
-		compatible = "ti,am3352-ecap";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23110000 0x00 0x100>;
-		power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 52 0>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	ecap2: pwm@23120000 {
-		compatible = "ti,am3352-ecap";
-		#pwm-cells = <3>;
-		reg = <0x00 0x23120000 0x00 0x100>;
-		power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 53 0>;
-		clock-names = "fck";
-		status = "disabled";
-	};
-
-	eqep0: counter@23200000 {
-		compatible = "ti,am62-eqep";
-		reg = <0x00 0x23200000 0x00 0x100>;
-		power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 59 0>;
-		interrupts = <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>;
-		status = "disabled";
-	};
-
-	eqep1: counter@23210000 {
-		compatible = "ti,am62-eqep";
-		reg = <0x00 0x23210000 0x00 0x100>;
-		power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 60 0>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;
-		status = "disabled";
-	};
-
-	eqep2: counter@23220000 {
-		compatible = "ti,am62-eqep";
-		reg = <0x00 0x23220000 0x00 0x100>;
-		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 62 0>;
-		interrupts = <GIC_SPI 118 IRQ_TYPE_EDGE_RISING>;
-		status = "disabled";
-	};
-
-	mcasp0: audio-controller@2b00000 {
-		compatible = "ti,am33xx-mcasp-audio";
-		reg = <0x00 0x02b00000 0x00 0x2000>,
-		      <0x00 0x02b08000 0x00 0x400>;
-		reg-names = "mpu", "dat";
-		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "tx", "rx";
-
-		dmas = <&main_bcdma 0 0xc500 0>, <&main_bcdma 0 0x4500 0>;
-		dma-names = "tx", "rx";
-
-		clocks = <&k3_clks 190 0>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 190 0>;
-		assigned-clock-parents = <&k3_clks 190 2>;
-		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
-		status = "disabled";
-	};
-
-	mcasp1: audio-controller@2b10000 {
-		compatible = "ti,am33xx-mcasp-audio";
-		reg = <0x00 0x02b10000 0x00 0x2000>,
-		      <0x00 0x02b18000 0x00 0x400>;
-		reg-names = "mpu", "dat";
-		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "tx", "rx";
-
-		dmas = <&main_bcdma 0 0xc501 0>, <&main_bcdma 0 0x4501 0>;
-		dma-names = "tx", "rx";
-
-		clocks = <&k3_clks 191 0>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 191 0>;
-		assigned-clock-parents = <&k3_clks 191 2>;
-		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
-		status = "disabled";
-	};
-
-	mcasp2: audio-controller@2b20000 {
-		compatible = "ti,am33xx-mcasp-audio";
-		reg = <0x00 0x02b20000 0x00 0x2000>,
-		      <0x00 0x02b28000 0x00 0x400>;
-		reg-names = "mpu", "dat";
-		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "tx", "rx";
-
-		dmas = <&main_bcdma 0 0xc502 0>, <&main_bcdma 0 0x4502 0>;
-		dma-names = "tx", "rx";
-
-		clocks = <&k3_clks 192 0>;
-		clock-names = "fck";
-		assigned-clocks = <&k3_clks 192 0>;
-		assigned-clock-parents = <&k3_clks 192 2>;
-		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
-		status = "disabled";
-	};
-
 	ti_csi2rx0: ticsi2rx@30102000 {
 		compatible = "ti,j721e-csi2rx-shim";
 		dmas = <&main_bcdma_csi 0 0x5000 0>;
@@ -1082,14 +97,6 @@ csi0_port4: port@4 {
 		};
 	};
 
-	dphy0: phy@30110000 {
-		compatible = "cdns,dphy-rx";
-		reg = <0x00 0x30110000 0x00 0x1100>;
-		#phy-cells = <0>;
-		power-domains = <&k3_pds 185 TI_SCI_PD_EXCLUSIVE>;
-		status = "disabled";
-	};
-
 	dss: dss@30200000 {
 		compatible = "ti,am62a7-dss";
 		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
@@ -1123,18 +130,6 @@ vpu: video-codec@30210000 {
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
 
-	c7x_0: dsp@7e000000 {
-		compatible = "ti,am62a-c7xv-dsp";
-		reg = <0x00 0x7e000000 0x00 0x00100000>;
-		reg-names = "l2sram";
-		resets = <&k3_reset 208 1>;
-		firmware-name = "am62a-c71_0-fw";
-		ti,sci = <&dmsc>;
-		ti,sci-dev-id = <208>;
-		ti,sci-proc-ids = <0x04 0xff>;
-		status = "disabled";
-	};
-
 	e5010: jpeg-encoder@fd20000 {
 		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
 		reg = <0x00 0xfd20000 0x00 0x100>,
diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486a..e9f28343a4c1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -118,10 +118,13 @@ cbass_wakeup: bus@b00000 {
 		};
 	};
 
-	#include "k3-am62a-thermal.dtsi"
+	#include "k3-am62a-am62d-common-thermal.dtsi"
 };
 
 /* Now include the peripherals for each bus segments */
+#include "k3-am62a-am62d-common-main.dtsi"
+#include "k3-am62a-am62d-common-mcu.dtsi"
+#include "k3-am62a-am62d-common-wakeup.dtsi"
+
+/* Include AM62P specific peripherals */
 #include "k3-am62a-main.dtsi"
-#include "k3-am62a-mcu.dtsi"
-#include "k3-am62a-wakeup.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62d.dtsi b/arch/arm64/boot/dts/ti/k3-am62d.dtsi
new file mode 100644
index 000000000000..606da1c1f1bc
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62d.dtsi
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Source for AM62D SoC Family
+ *
+ * Copyright (C) 2022-2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+#include "k3-pinctrl.h"
+
+/ {
+	model = "Texas Instruments K3 AM62D SoC";
+	compatible = "ti,am62d2";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		psci: psci {
+			compatible = "arm,psci-1.0";
+			method = "smc";
+		};
+	};
+
+	a53_timer0: timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	pmu: pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cbass_main: bus@f0000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ranges = <0x00 0x000f0000 0x00 0x000f0000 0x00 0x00030000>, /* Main MMRs */
+			 <0x00 0x00420000 0x00 0x00420000 0x00 0x00001000>, /* ESM0 */
+			 <0x00 0x00600000 0x00 0x00600000 0x00 0x00001100>, /* GPIO */
+			 <0x00 0x00703000 0x00 0x00703000 0x00 0x00000200>, /* USB0 debug trace */
+			 <0x00 0x0070c000 0x00 0x0070c000 0x00 0x00000200>, /* USB1 debug trace */
+			 <0x00 0x00a40000 0x00 0x00a40000 0x00 0x00000800>, /* Timesync router */
+			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripheral window */
+			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* Main CPSW */
+			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x01d20000>, /* Second peripheral window */
+			 <0x00 0x0fd00000 0x00 0x0fd00000 0x00 0x00020000>, /* GPU */
+			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripheral window */
+			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
+			 <0x00 0x30210000 0x00 0x30210000 0x00 0x00010000>, /* VPU */
+			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core window */
+			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
+			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
+			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
+			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
+			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06400000>, /* DMSS */
+			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS0 DAT1 */
+			 <0x00 0x70000000 0x00 0x70000000 0x00 0x00010000>, /* OCSRAM */
+			 <0x00 0x7e000000 0x00 0x7e000000 0x00 0x00100000>, /* C7x_0 */
+			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
+			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS0 DAT3 */
+
+			 /* MCU Domain Range */
+			 <0x00 0x04000000 0x00 0x04000000 0x00 0x01ff1400>,
+			 <0x00 0x79000000 0x00 0x79000000 0x00 0x00008000>, /* MCU R5 ATCM */
+			 <0x00 0x79020000 0x00 0x79020000 0x00 0x00008000>, /* MCU R5 BTCM */
+			 <0x00 0x79100000 0x00 0x79100000 0x00 0x00040000>, /* MCU R5 IRAM0 */
+			 <0x00 0x79140000 0x00 0x79140000 0x00 0x00040000>, /* MCU R5 IRAM1 */
+
+			 /* Wakeup Domain Range */
+			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>,
+			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
+			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM */
+			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM */
+
+		cbass_mcu: bus@4000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x04000000 0x00 0x04000000 0x00 0x01ff1400>, /* Peripheral window */
+				 <0x00 0x79000000 0x00 0x79000000 0x00 0x00008000>, /* MCU R5 ATCM */
+				 <0x00 0x79020000 0x00 0x79020000 0x00 0x00008000>, /* MCU R5 BTCM */
+				 <0x00 0x79100000 0x00 0x79100000 0x00 0x00040000>, /* MCU IRAM0 */
+				 <0x00 0x79140000 0x00 0x79140000 0x00 0x00040000>; /* MCU IRAM1 */
+		};
+
+		cbass_wakeup: bus@b00000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
+				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
+				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>, /* WKUP CTRL MMR */
+				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
+				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
+		};
+	};
+
+	#include "k3-am62a-am62d-common-thermal.dtsi"
+};
+
+/* Now include the peripherals for each bus segments */
+#include "k3-am62a-am62d-common-main.dtsi"
+#include "k3-am62a-am62d-common-mcu.dtsi"
+#include "k3-am62a-am62d-common-wakeup.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
new file mode 100644
index 000000000000..0873c2523607
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * AM62D2 EVM: https://www.ti.com/lit/zip/sprcal5
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "k3-am62d2.dtsi"
+
+/ {
+	compatible = "ti,am62d2-evm", "ti,am62d2";
+	model = "Texas Instruments AM62D2 EVM";
+
+	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
+		serial2 = &main_uart0;
+		mmc1 = &sdhci1;
+		rtc0 = &wkup_rtc0;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 4G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
+		      <0x00000008 0x80000000 0x00000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x2000000>;
+			alloc-ranges = <0x00 0xc0000000 0x00 0x2000000>;
+			linux,cma-default;
+		};
+
+		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x99800000 0x00 0x100000>;
+			no-map;
+		};
+
+		c7x_0_memory_region: c7x-memory@99900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x99900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b800000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@80000000 {
+			reg = <0x00 0x80000000 0x00 0x80000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	opp-table {
+		/* Requires VDD_CORE at 0v85 */
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-supported-hw = <0x01 0x0004>;
+			clock-latency-ns = <6000000>;
+		};
+	};
+
+	vout_pd: regulator-1 {
+		/* TPS65988 PD CONTROLLER OUTPUT */
+		compatible = "regulator-fixed";
+		regulator-name = "vout_pd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vmain_pd: load-switch {
+		/* Output of TPS22811 */
+		compatible = "regulator-fixed";
+		regulator-name = "vmain_pd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vout_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vcc_5v0: regulator-2 {
+		/* Output of TPS630702RNMR */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_mmc1: regulator-3 {
+		/* TPS22918DBVR */
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_mmc1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	vddshv_sdio: regulator-4 {
+		compatible = "regulator-gpio";
+		regulator-name = "vddshv_sdio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vddshv_sdio_pins_default>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpios = <&main_gpio1 31 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+		bootph-all;
+	};
+};
+
+&mcu_pmx0 {
+	bootph-all;
+
+	wkup_uart0_pins_default: wkup-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x0024, PIN_INPUT, 0) /* (C9) WKUP_UART0_RXD */
+			AM62DX_MCU_IOPAD(0x0028, PIN_OUTPUT, 0) /* (E9) WKUP_UART0_TXD */
+			AM62DX_MCU_IOPAD(0x002c, PIN_INPUT, 0) /* (C10) WKUP_UART0_CTSn */
+			AM62DX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
+		>;
+		bootph-all;
+	};
+};
+
+/* WKUP UART0 is used for DM firmware logs */
+&wkup_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_uart0_pins_default>;
+	status = "reserved";
+	bootph-all;
+};
+
+&main_pmx0 {
+	bootph-all;
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x01c8, PIN_INPUT, 0) /* (E14) UART0_RXD */
+			AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
+			AM62DX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C17) I2C1_SCL */
+			AM62DX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (E17) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (M22) GPMC0_CSn2.I2C2_SCL */
+			AM62DX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (M20) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x023c, PIN_INPUT, 0) /* (C21) MMC1_CMD */
+			AM62DX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (E22) MMC1_CLK */
+			AM62DX_IOPAD(0x0230, PIN_INPUT, 0) /* (B22) MMC1_DAT0 */
+			AM62DX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (D21) MMC1_DAT1 */
+			AM62DX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (C22) MMC1_DAT2 */
+			AM62DX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (D22) MMC1_DAT3 */
+			AM62DX_IOPAD(0x0240, PIN_INPUT, 0) /* (E18) MMC1_SDCD */
+			AM62DX_IOPAD(0x0244, PIN_INPUT, 0) /* (D18) MMC1_SDWP */
+		>;
+		bootph-all;
+	};
+
+	main_mdio1_pins_default: main-mdio1-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
+			AM62DX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
+		>;
+		bootph-all;
+	};
+
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
+		>;
+	};
+
+	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x1F4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
+		>;
+		bootph-all;
+	};
+};
+
+&mcu_pmx0 {
+	status = "okay";
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62DX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
+		>;
+	};
+};
+
+&mcu_gpio0 {
+	status = "okay";
+};
+
+&main_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+
+	typec_pd0: usb-power-controller@3f {
+		compatible = "ti,tps6598x";
+		reg = <0x3f>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			self-powered;
+			data-role = "dual";
+			power-role = "sink";
+			port {
+				usb_con_hs: endpoint {
+					remote-endpoint = <&usb0_hs_ep>;
+				};
+			};
+		};
+	};
+
+	exp1: gpio@22 {
+		compatible = "ti,tca6424";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		bootph-all;
+
+		gpio-line-names = "GPIO_CPSW2_RST", "GPIO_CPSW1_RST",
+			"MMC1_SD_EN", "VPP_EN",
+			"GPIO_DIX_RST", "IO_EXP_OPT_EN",
+			"DIX_INT", "GPIO_eMMC_RSTn",
+			"CPLD2_DONE", "CPLD2_INTN",
+			"CPLD1_DONE", "CPLD1_INTN",
+			"USB_TYPEA_OC_INDICATION", "PCM1_INT",
+			"PCM2_INT", "GPIO_PCM1_RST",
+			"TEST_GPIO2", "GPIO_PCM2_RST",
+			"IO_MCAN0_STB", "IO_MCAN1_STB",
+			"PD_I2C_IRQ", "IO_EXP_TEST_LED";
+	};
+
+	exp2: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "", "DAC_LAT_CTRL",
+			"CPLD1_JTAGENB", "CPLD1_PROGRAMN",
+			"CPLD2_JTAGENB", "CPLD2_PROGRAMN",
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"SoC_I2C0_SCL", "SoC_I2C0_SDA";
+	};
+};
+
+&main_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <100000>;
+	bootph-all;
+};
+
+&main_i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	status = "okay";
+	vmmc-supply = <&vdd_mmc1>;
+	vqmmc-supply = <&vddshv_sdio>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	bootph-all;
+};
+
+&main_gpio0 {
+	bootph-all;
+	status = "okay";
+};
+
+&main_gpio1 {
+	bootph-all;
+	status = "okay";
+};
+
+&main_gpio_intr {
+	status = "okay";
+};
+
+&main_uart0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+};
+
+&usb0 {
+	bootph-all;
+	usb-role-switch;
+
+	port {
+		usb0_hs_ep: endpoint {
+			remote-endpoint = <&usb_con_hs>;
+		};
+	};
+};
+
+&mailbox0_cluster0 {
+	status = "okay";
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+
+	mbox_c7x_0: mbox-c7x-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+
+	mbox_mcu_r5_0: mbox-mcu-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+};
+
+&c7x_0 {
+	status = "okay";
+
+	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
+	memory-region = <&c7x_0_dma_memory_region>,
+			<&c7x_0_memory_region>;
+};
+
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
+&main_timer0 {
+	bootph-all;
+};
+
+&cbass_main {
+	bootph-all;
+};
+
+&dmss {
+	bootph-all;
+};
+
+&secure_proxy_main {
+	bootph-all;
+};
+
+&dmsc {
+	bootph-all;
+};
+
+&k3_pds {
+	bootph-all;
+};
+
+&k3_clks {
+	bootph-all;
+};
+
+&k3_reset {
+	bootph-all;
+};
+
+&wkup_conf {
+	bootph-all;
+};
+
+&chipid {
+	bootph-all;
+};
+
+&cbass_mcu {
+	bootph-all;
+};
+
+&cbass_wakeup {
+	bootph-all;
+};
+
+&k3_reset {
+	bootph-all;
+};
+
+&dmsc {
+	bootph-all;
+};
+
+&main_bcdma {
+	bootph-all;
+};
+
+&main_pktdma {
+	bootph-all;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
new file mode 100644
index 000000000000..47566fea4157
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Source for AM62D2 SoC family in Quad core configuration
+ *
+ * TRM: https://www.ti.com/lit/zip/spruj16
+ *
+ * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+
+#include "k3-am62d.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&k3_clks 135 0>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&k3_clks 136 0>;
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53";
+			reg = <0x002>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&k3_clks 137 0>;
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53";
+			reg = <0x003>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&L2_0>;
+			operating-points-v2 = <&a53_opp_table>;
+			clocks = <&k3_clks 138 0>;
+		};
+	};
+
+	a53_opp_table: opp-table {
+		compatible = "operating-points-v2-ti-cpu";
+		opp-shared;
+		syscon = <&opp_efuse_table>;
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x01 0x0007>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-supported-hw = <0x01 0x0006>;
+			clock-latency-ns = <6000000>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-supported-hw = <0x01 0x0004>;
+			clock-latency-ns = <6000000>;
+			opp-suspend;
+		};
+	};
+
+	L2_0: l2-cache0 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+		cache-size = <0x80000>;
+		cache-line-size = <64>;
+		cache-sets = <512>;
+	};
+};
-- 
2.34.1

