Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE491F4736;
	Sun, 18 May 2025 22:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605923; cv=none; b=qtgztCacJ354plTpwoDL90WAxE7T3XtWSFuWbA9Bk+Fo0phee+aZS93SW3yrzN/FEhRctGc2wkzVVBmP/kvnjkJGDcvFY5WcN4ofgKPReJqLscDR4F1oBzgU7o0D+dbagvA/uSnnPD3aW6TIgEGUStyA7gDcPrOJrdgMqN/Wq4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605923; c=relaxed/simple;
	bh=uJ7kEC35Tl7HhJpalOGTwGu3l9PgsCwPG8VRXQRWXzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbaBRN1i+ZTwngX4o4drwavja613SvPaQBeHFNEhGgE3ndR4HcIvBWCIwaetRMUBJlr3Sea0VKlYE3T7MRez2JiP9N4zoQdRxBmO21X0dENdXeYPcMXtveBDki43vsG1G4H6V2xv7CY6eRx0uvtHt0g7slud+CN6jzTwnsw3fTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MJjarBC7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MJjarBC7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4c0/h5O89NEh//kKOA3P/rcNgyur1rYbiL5S7VTGzjg=; b=MJjarBC7NH33DQTOZsIoRh8/Dr
	EyDCga3YnmDAsQSuCgBmij5Oj/ddu2Fm9St1FwiP5rXY1p8BNHD0NqzKZpViLXqp3TgHQYZIUxFFg
	E+0eGXMet+nAh64Jv5yllYcUlFV37ttNuKbz0z5H9r2NbIZRtOTZOtNcO4Yc4+rVXvSdwa96SKK9M
	2Q2QMdHxHLJT4E0SCJXH9JMCtUe8I5s9r+LJDQChWsAUhQLamBzBEddhoFQ/IknEqgMondS0k/RKO
	edWJuv3YEh/G5K9HJEn03O6zwlq/VDCNKmM0eAF7bevLuN7v8Vs7l1nRSwC2lk8L4ac22kuVhRoWH
	iRRsNoYQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7y-0004gv-Sm; Mon, 19 May 2025 00:05:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/6] arm64: dts: rockchip: fix rk3576 pcie unit addresses
Date: Mon, 19 May 2025 00:04:43 +0200
Message-ID: <20250518220449.2722673-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rk3576 pcie nodes currently use the apb register as their unit address
which is the second reg area defined in the binding.

As can be seen by the dtc warnings like

../arch/arm64/boot/dts/rockchip/rk3576.dtsi:1346.24-1398.5: Warning (simple_bus_reg): /soc/pcie@2a200000: simple-bus unit address format error, expected "22000000"
../arch/arm64/boot/dts/rockchip/rk3576.dtsi:1400.24-1452.5: Warning (simple_bus_reg): /soc/pcie@2a210000: simple-bus unit address format error, expected "22400000"

using the first reg area as the unit address seems to be preferred.
This is the dbi area per the binding, so adapt the unit address accordingly
and move the nodes to their new position.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 216 +++++++++++------------
 1 file changed, 108 insertions(+), 108 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 79800959b797..3b62e037772a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -466,6 +466,114 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie0: pcie@22000000 {
+			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
+			reg = <0x0 0x22000000 0x0 0x00400000>,
+			      <0x0 0x2a200000 0x0 0x00010000>,
+			      <0x0 0x20000000 0x0 0x00100000>;
+			reg-names = "dbi", "apb", "config";
+			bus-range = <0x0 0xf>;
+			clocks = <&cru ACLK_PCIE0_MST>, <&cru ACLK_PCIE0_SLV>,
+				 <&cru ACLK_PCIE0_DBI>, <&cru PCLK_PCIE0>,
+				 <&cru CLK_PCIE0_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk",
+				      "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie0_intc 0>,
+					<0 0 0 2 &pcie0_intc 1>,
+					<0 0 0 3 &pcie0_intc 2>,
+					<0 0 0 4 &pcie0_intc 3>;
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			num-lanes = <1>;
+			phys = <&combphy0_ps PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power RK3576_PD_PHP>;
+			ranges = <0x01000000 0x0 0x20100000 0x0 0x20100000 0x0 0x00100000
+				  0x02000000 0x0 0x20200000 0x0 0x20200000 0x0 0x00e00000
+				  0x03000000 0x9 0x00000000 0x9 0x00000000 0x0 0x80000000>;
+			resets = <&cru SRST_PCIE0_POWER_UP>, <&cru SRST_P_PCIE0>;
+			reset-names = "pwr", "pipe";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie0_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
+
+		pcie1: pcie@22400000 {
+			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
+			reg = <0x0 0x22400000 0x0 0x00400000>,
+			      <0x0 0x2a210000 0x0 0x00010000>,
+			      <0x0 0x21000000 0x0 0x00100000>;
+			reg-names = "dbi", "apb", "config";
+			bus-range = <0x20 0x2f>;
+			clocks = <&cru ACLK_PCIE1_MST>, <&cru ACLK_PCIE1_SLV>,
+				 <&cru ACLK_PCIE1_DBI>, <&cru PCLK_PCIE1>,
+				 <&cru CLK_PCIE1_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk",
+				      "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie1_intc 0>,
+					<0 0 0 2 &pcie1_intc 1>,
+					<0 0 0 3 &pcie1_intc 2>,
+					<0 0 0 4 &pcie1_intc 3>;
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			num-lanes = <1>;
+			phys = <&combphy1_psu PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power RK3576_PD_SUBPHP>;
+			ranges = <0x01000000 0x0 0x21100000 0x0 0x21100000 0x0 0x00100000
+				  0x02000000 0x0 0x21200000 0x0 0x21200000 0x0 0x00e00000
+				  0x03000000 0x9 0x80000000 0x9 0x80000000 0x0 0x80000000>;
+			resets = <&cru SRST_PCIE1_POWER_UP>, <&cru SRST_P_PCIE1>;
+			reset-names = "pwr", "pipe";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie1_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
+
 		usb_drd0_dwc3: usb@23000000 {
 			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
 			reg = <0x0 0x23000000 0x0 0x400000>;
@@ -1343,114 +1451,6 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
-		pcie0: pcie@2a200000 {
-			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
-			reg = <0x0 0x22000000 0x0 0x00400000>,
-			      <0x0 0x2a200000 0x0 0x00010000>,
-			      <0x0 0x20000000 0x0 0x00100000>;
-			reg-names = "dbi", "apb", "config";
-			bus-range = <0x0 0xf>;
-			clocks = <&cru ACLK_PCIE0_MST>, <&cru ACLK_PCIE0_SLV>,
-				 <&cru ACLK_PCIE0_DBI>, <&cru PCLK_PCIE0>,
-				 <&cru CLK_PCIE0_AUX>;
-			clock-names = "aclk_mst", "aclk_slv",
-				      "aclk_dbi", "pclk",
-				      "aux";
-			device_type = "pci";
-			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie0_intc 0>,
-					<0 0 0 2 &pcie0_intc 1>,
-					<0 0 0 3 &pcie0_intc 2>,
-					<0 0 0 4 &pcie0_intc 3>;
-			linux,pci-domain = <0>;
-			max-link-speed = <2>;
-			num-ib-windows = <8>;
-			num-viewport = <8>;
-			num-ob-windows = <2>;
-			num-lanes = <1>;
-			phys = <&combphy0_ps PHY_TYPE_PCIE>;
-			phy-names = "pcie-phy";
-			power-domains = <&power RK3576_PD_PHP>;
-			ranges = <0x01000000 0x0 0x20100000 0x0 0x20100000 0x0 0x00100000
-				  0x02000000 0x0 0x20200000 0x0 0x20200000 0x0 0x00e00000
-				  0x03000000 0x9 0x00000000 0x9 0x00000000 0x0 0x80000000>;
-			resets = <&cru SRST_PCIE0_POWER_UP>, <&cru SRST_P_PCIE0>;
-			reset-names = "pwr", "pipe";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			status = "disabled";
-
-			pcie0_intc: legacy-interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>;
-			};
-		};
-
-		pcie1: pcie@2a210000 {
-			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
-			reg = <0x0 0x22400000 0x0 0x00400000>,
-			      <0x0 0x2a210000 0x0 0x00010000>,
-			      <0x0 0x21000000 0x0 0x00100000>;
-			reg-names = "dbi", "apb", "config";
-			bus-range = <0x20 0x2f>;
-			clocks = <&cru ACLK_PCIE1_MST>, <&cru ACLK_PCIE1_SLV>,
-				 <&cru ACLK_PCIE1_DBI>, <&cru PCLK_PCIE1>,
-				 <&cru CLK_PCIE1_AUX>;
-			clock-names = "aclk_mst", "aclk_slv",
-				      "aclk_dbi", "pclk",
-				      "aux";
-			device_type = "pci";
-			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie1_intc 0>,
-					<0 0 0 2 &pcie1_intc 1>,
-					<0 0 0 3 &pcie1_intc 2>,
-					<0 0 0 4 &pcie1_intc 3>;
-			linux,pci-domain = <0>;
-			max-link-speed = <2>;
-			num-ib-windows = <8>;
-			num-viewport = <8>;
-			num-ob-windows = <2>;
-			num-lanes = <1>;
-			phys = <&combphy1_psu PHY_TYPE_PCIE>;
-			phy-names = "pcie-phy";
-			power-domains = <&power RK3576_PD_SUBPHP>;
-			ranges = <0x01000000 0x0 0x21100000 0x0 0x21100000 0x0 0x00100000
-				  0x02000000 0x0 0x21200000 0x0 0x21200000 0x0 0x00e00000
-				  0x03000000 0x9 0x80000000 0x9 0x80000000 0x0 0x80000000>;
-			resets = <&cru SRST_PCIE1_POWER_UP>, <&cru SRST_P_PCIE1>;
-			reset-names = "pwr", "pipe";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			status = "disabled";
-
-			pcie1_intc: legacy-interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
-			};
-		};
-
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;
-- 
2.47.2

