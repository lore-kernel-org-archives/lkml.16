Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F942D9EE9;
	Fri, 27 Jun 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030854; cv=none; b=l+sWJSbapCDHH23WCBcVOQFiRPia1C+HR4B8qOc+8i+rvKfY72PIc+77//2G2AN4XaoH6sawbjQK6pozcQbcUa8frRwDGOA7NFnVBAYDn3ATNWQ0AlRW8IG9kg0VLKRx74XqGgnSH9kho4kOOmtcnKohqaZ1WHgDm9J9AkUm1cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030854; c=relaxed/simple;
	bh=9W1JgSKeDkaeUxmYu0M1nTGZ2j3jE/5h9HLHIlPEjrY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UB4YK+h7f6HDeNUWENe3quaxsybn9LokWFNjUD2m5E252Iv5nNusZfAGv19BpPYV1xN11WrKkD6Zt1hd1rSKujJQWZ3PwC7rPKUG1lZTE6A0/r3sSxz58guBUNK3nO35jhanmGQhsgxZ6DSA1FCJQZ5/ni8i0qtsO8k4ZzUhTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=julKciE+; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="julKciE+"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RBw2Bk2747738;
	Fri, 27 Jun 2025 06:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751025482;
	bh=S6WQg2nTz8+rn65F3UHXN0fs/bGijiuQFzqFHHyFcog=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=julKciE+Ouw6W/r+SwkDqt4wHBkBv6h/IcZ/O14zTSNmghUFlvvz/o0Z87Mh0lY+4
	 HZ3aRX3ZJcoC0GjFpOWQz/1e+afuDzBDKIn/SioIjeG/pANn4pE4E/h7Db3qyazv3F
	 YwSU33yGOgnv8HGelFBpKbaBjjDgY1DvtTSQpm9k=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RBw2m23207858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 06:58:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 06:58:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 06:58:02 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RBw1oN2754960;
	Fri, 27 Jun 2025 06:58:01 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v5 1/4] arm64: dts: ti: Add bootph property to nodes at source for am62a
Date: Fri, 27 Jun 2025 17:27:50 +0530
Message-ID: <20250627115753.2246881-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627115753.2246881-1-p-bhagat@ti.com>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add bootph property directly into the original definitions of relevant
nodes (e.g., power domains, USB controllers, and other peripherals)
within their respective DTSI files (ex. main, mcu, and wakeup) for
am62a.

By defining bootph in the nodes source definitions instead of appending
it later in final DTS files, this change ensures that the property is
inherently present wherever the nodes are reused across derived device
trees.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    |  1 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 63e097ddf988..770f1258b0aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -51,6 +51,7 @@ phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
 			#phy-cells = <1>;
+			bootph-all;
 		};
 
 		epwm_tbclk: clock-controller@4130 {
@@ -96,6 +97,7 @@ secure_proxy_main: mailbox@4d000000 {
 			#mbox-cells = <1>;
 			interrupt-names = "rx_012";
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			bootph-all;
 		};
 
 		inta_main_dmss: interrupt-controller@48000000 {
@@ -131,6 +133,7 @@ main_bcdma: dma-controller@485c0100 {
 			ti,sci-rm-range-bchan = <0x20>; /* BLOCK_COPY_CHAN */
 			ti,sci-rm-range-rchan = <0x21>; /* SPLIT_TR_RX_CHAN */
 			ti,sci-rm-range-tchan = <0x22>; /* SPLIT_TR_TX_CHAN */
+			bootph-all;
 		};
 
 		main_pktdma: dma-controller@485c0000 {
@@ -147,6 +150,8 @@ main_pktdma: dma-controller@485c0000 {
 				    "ring", "tchan", "rchan", "rflow";
 			msi-parent = <&inta_main_dmss>;
 			#dma-cells = <2>;
+			bootph-all;
+
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <30>;
 			ti,sci-rm-range-tchan = <0x23>, /* UNMAPPED_TX_CHAN */
@@ -220,16 +225,19 @@ dmsc: system-controller@44043000 {
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
 			#power-domain-cells = <2>;
+			bootph-all;
 		};
 
 		k3_clks: clock-controller {
 			compatible = "ti,k2g-sci-clk";
 			#clock-cells = <2>;
+			bootph-all;
 		};
 
 		k3_reset: reset-controller {
 			compatible = "ti,sci-reset";
 			#reset-cells = <2>;
+			bootph-all;
 		};
 	};
 
@@ -254,6 +262,7 @@ secure_proxy_sa3: mailbox@43600000 {
 		 * firmware on non-MPU processors
 		 */
 		status = "disabled";
+		bootph-all;
 	};
 
 	main_pmx0: pinctrl@f4000 {
@@ -262,6 +271,7 @@ main_pmx0: pinctrl@f4000 {
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
+		bootph-all;
 	};
 
 	main_esm: esm@420000 {
@@ -282,6 +292,7 @@ main_timer0: timer@2400000 {
 		assigned-clock-parents = <&k3_clks 36 3>;
 		power-domains = <&k3_pds 36 TI_SCI_PD_EXCLUSIVE>;
 		ti,timer-pwm;
+		bootph-all;
 	};
 
 	main_timer1: timer@2410000 {
@@ -651,6 +662,7 @@ usb0: usb@31000000 {
 			interrupt-names = "host", "peripheral";
 			maximum-speed = "high-speed";
 			dr_mode = "otg";
+			bootph-all;
 			snps,usb2-gadget-lpm-disable;
 			snps,usb2-lpm-disable;
 		};
@@ -745,6 +757,7 @@ cpsw_port1: port@1 {
 				phys = <&phy_gmii_sel 1>;
 				mac-address = [00 00 00 00 00 00];
 				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
+				bootph-all;
 			};
 
 			cpsw_port2: port@2 {
@@ -764,6 +777,7 @@ cpsw3g_mdio: mdio@f00 {
 			clocks = <&k3_clks 13 0>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
+			bootph-all;
 		};
 
 		cpts@3d000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index ee961ced7208..df4aa131097f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -12,6 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
+		bootph-all;
 	};
 
 	mcu_esm: esm@4100000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 259ae6ebbfb5..9ef1c829a9df 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -17,6 +17,7 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			bootph-all;
 		};
 
 		opp_efuse_table: syscon@18 {
@@ -67,6 +68,7 @@ wkup_uart0: serial@0 {
 			reg = <0 0x100>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			bootph-pre-ram;
 	       };
 	};
 
-- 
2.34.1

