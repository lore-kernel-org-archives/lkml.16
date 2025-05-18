Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC21F5402;
	Sun, 18 May 2025 22:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605924; cv=none; b=r6uEbzXbWejGy07KO7G7pMnbKb0kIlyL85tRWkabhU+aLxqq8PeNFdkd4LjV349oS/BGEY8E2J2kLHkNOgkaNnhbr1cYVKzHl889JDNQ3mtpMBqGGNzX5dBDK8znj654bi7ztO8cR+abVP4vrIJm9+1dgv7exsBUUDWMHdHAZcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605924; c=relaxed/simple;
	bh=cpqKky3nfGuSMgtV1Pwd/tS1kng/Qpa81cqUHFlL2LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HY4J+SlqdM8k/zOOFx1kMnQSwdDFWHDSLAwvVBJKK4D/8+qGKD+aZplmbyXX2fBFgiovxLVa74W6X0WP77+UtSOTNhGXFsfQSSRxQAhxQZllBu37YHgS/QGuUAHuSddxo5ph+URhuUoam9cPyFp/3ZIh8g3nrFG66HtDUUNRnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JYLI3Pl7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JYLI3Pl7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KLs80DRngycvg8mfju1hywH7qb6aCCKjt+E8URewsKw=; b=JYLI3Pl7iThnhQCIZMLSRXC+yL
	UC3NkfoDUWYu+NNfmGyVZ3fN+M0zcT7XAbD0vnc6NQZNzczdDD6sjZQzj8hPbd8vVq90EARUZUrem
	IAXPpv9h8wDbcLIXDilErMjwuNMsBGiiFvzJ7u1umkilVSLG2JSanELHht3zXLrisWpgOPCkn/A5F
	Uf8HR06FIr962ig/Xl6KYny/GxBLRKpZtO6aaNPmofCEWMKRCSpAa+HsjOGLJwbfU02PUE966wkhB
	l8s1/PlaDRzQT5Yp2ejDZWDeFZVB3EJzwJwnKrzmBwJGYuX1wXlTvXEEtUIg59sxdb4tCzVDE56e3
	78Xwn40A==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm80-0004gv-RL; Mon, 19 May 2025 00:05:04 +0200
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: rockchip: fix rk3562 pcie unit addresses
Date: Mon, 19 May 2025 00:04:47 +0200
Message-ID: <20250518220449.2722673-6-heiko@sntech.de>
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

The rk3562 pcie node currently uses the apb register as its unit address
which is the second reg area defined in the binding.

As can be seen by the dtc warnings like

../arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expected "fe000000"

using the first reg area as the unit address seems to be preferred.
This is the dbi area per the binding, so adapt the unit address accordingly
and move the nodes to their new position.

With the move also move the reg + reg-names below the compatible, as is the
preferred position.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 106 +++++++++++------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
index 6268f84efa13..292e82ec5d45 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
@@ -249,6 +249,59 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie2x1: pcie@fe000000 {
+			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
+			reg = <0x0 0xfe000000 0x0 0x400000>,
+			      <0x0 0xff500000 0x0 0x10000>,
+			      <0x0 0xfc000000 0x0 0x100000>;
+			reg-names = "dbi", "apb", "config";
+			bus-range = <0x0 0xff>;
+			clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
+				 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
+				 <&cru CLK_PCIE20_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk", "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie2x1_intc 0>,
+					<0 0 0 2 &pcie2x1_intc 1>,
+					<0 0 0 3 &pcie2x1_intc 2>,
+					<0 0 0 4 &pcie2x1_intc 3>;
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			num-lanes = <1>;
+			phys = <&combphy PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power 15>;
+			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
+				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
+				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
+			resets = <&cru SRST_PCIE20_POWERUP>;
+			reset-names = "pipe";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie2x1_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		gic: interrupt-controller@fe901000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -621,59 +674,6 @@ gpu: gpu@ff320000 {
 			status = "disabled";
 		};
 
-		pcie2x1: pcie@ff500000 {
-			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
-			bus-range = <0x0 0xff>;
-			clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
-				 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
-				 <&cru CLK_PCIE20_AUX>;
-			clock-names = "aclk_mst", "aclk_slv",
-				      "aclk_dbi", "pclk", "aux";
-			device_type = "pci";
-			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie2x1_intc 0>,
-					<0 0 0 2 &pcie2x1_intc 1>,
-					<0 0 0 3 &pcie2x1_intc 2>,
-					<0 0 0 4 &pcie2x1_intc 3>;
-			linux,pci-domain = <0>;
-			max-link-speed = <2>;
-			num-ib-windows = <8>;
-			num-viewport = <8>;
-			num-ob-windows = <2>;
-			num-lanes = <1>;
-			phys = <&combphy PHY_TYPE_PCIE>;
-			phy-names = "pcie-phy";
-			power-domains = <&power 15>;
-			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
-				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
-				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
-			reg = <0x0 0xfe000000 0x0 0x400000>,
-			      <0x0 0xff500000 0x0 0x10000>,
-			      <0x0 0xfc000000 0x0 0x100000>;
-			reg-names = "dbi", "apb", "config";
-			resets = <&cru SRST_PCIE20_POWERUP>;
-			reset-names = "pipe";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			status = "disabled";
-
-			pcie2x1_intc: legacy-interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
 		spi1: spi@ff640000 {
 			compatible = "rockchip,rk3066-spi";
 			reg = <0x0 0xff640000 0x0 0x1000>;
-- 
2.47.2

