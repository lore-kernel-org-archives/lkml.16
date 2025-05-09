Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC932620CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822259; cv=none; b=JB7+bqr93NawJLY5lTQdMzN0srQHuHuhtZ+1qyMOPufZTQ0i8Ss6WLdF0y67PWYau+ILY98By37iRgJDqsHJ+hUWdWfnTLoKDowfeSI6Y2uDv6rI4HsmPb3BMCxFWRQ/tO3W7lJSNTeC71Icyr6vUvNDBiODyKvkVOoIqc4hsI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822259; c=relaxed/simple;
	bh=LLIxxoBDzxYG2uJACxJxA1r+yY2RSipZNIL8OPUJ/mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UM3ETPJDK1nLUIDVbDbR7hfdi2KFPM1dErIM+h2cz30rjoQzy2KgJ9uQHzzaXkauleJGbbAffdeoiMaYB+9ScpWq02uWeRuofsJvPZ9CcuJoCKCOq5Iatht0g0rzmpoGFGCsBT+PYCQ6sHNjxvfZ7nPt9wjZHvrsQheEc7WFch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=xbwddUkK; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="xbwddUkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1746822255; bh=P7gThKkrMd1a1lQEc13hoEpYQxfaSplFlrYwQwnShkc=;
 b=xbwddUkKV7NmBe8h4fy0WmF2iClgrq7KUYh4IhQLGlRgX24hFFjrxFLF53GKuDYYrTEQ7Q1Yx
 4bwSTHwGnUhChmlpQadJsnD9Tb27EiAFDhzX/KtFrXVEyIMFOxi43tbu3+z6Bm+byn9dKR4QJSL
 TN2L77BuFOsOoHHkWvJymW8FawSqztTPo2mK8vBjrDU+yds/yWU7IvFhqO/lLr/00f+mmcqdIHn
 Ht+oTI7Ks1fqgg2BACewQ4vSHg+q1i/sD6aZIlxZEL4K/II01IwdKqutoz2FeLcrMfjs1zpTiRs
 kZB55tP5O60+WOANag/ZPXW+ucHmVZEUcFnb312AWeFg==
X-Forward-Email-ID: 681e646cb323f1ffafd05d85
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 1/2] arm64: dts: rockchip: Add GMAC nodes for RK3528
Date: Fri,  9 May 2025 20:23:57 +0000
Message-ID: <20250509202402.260038-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
Ethernet QoS IP.

Add device tree nodes for the two Ethernet controllers in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- No change

Changes in v2:
- Add ethernet-phy@2 for the integrated PHY

I have no board that expose an Ethernet port for the gmac0 and the
integrated PHY. However, the PHY can be identified on addr 0x2 as
0044.1400 and in vendor kernel this relate to the Rockchip RK630 PHY.
A proper PHY driver will be needed to support real use of gmac0.
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 105 +++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 193b84b5e912..cd8ef389ccf3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -677,6 +677,111 @@ saradc: adc@ffae0000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@ffbd0000 {
+			compatible = "rockchip,rk3528-gmac", "snps,dwmac-4.20a";
+			reg = <0x0 0xffbd0000 0x0 0x10000>;
+			clocks = <&cru CLK_GMAC0_SRC>, <&cru CLK_GMAC0_RMII_50M>,
+				 <&cru CLK_GMAC0_RX>, <&cru CLK_GMAC0_TX>,
+				 <&cru PCLK_MAC_VO>, <&cru ACLK_MAC_VO>;
+			clock-names = "stmmaceth", "clk_mac_ref",
+				      "mac_clk_rx", "mac_clk_tx",
+				      "pclk_mac", "aclk_mac";
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			phy-handle = <&rmii0_phy>;
+			phy-mode = "rmii";
+			resets = <&cru SRST_A_MAC_VO>;
+			reset-names = "stmmaceth";
+			rockchip,grf = <&vo_grf>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,tso;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <0x1>;
+				#size-cells = <0x0>;
+
+				rmii0_phy: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0x2>;
+					clocks = <&cru CLK_MACPHY>;
+					phy-is-integrated;
+					pinctrl-names = "default";
+					pinctrl-0 = <&fephym0_led_link>,
+						    <&fephym0_led_spd>;
+					resets = <&cru SRST_MACPHY>;
+				};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <8>;
+				snps,wr_osr_lmt = <4>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+		};
+
+		gmac1: ethernet@ffbe0000 {
+			compatible = "rockchip,rk3528-gmac", "snps,dwmac-4.20a";
+			reg = <0x0 0xffbe0000 0x0 0x10000>;
+			clocks = <&cru CLK_GMAC1_SRC_VPU>,
+				 <&cru CLK_GMAC1_RMII_VPU>,
+				 <&cru PCLK_MAC_VPU>,
+				 <&cru ACLK_MAC_VPU>;
+			clock-names = "stmmaceth",
+				      "clk_mac_ref",
+				      "pclk_mac",
+				      "aclk_mac";
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&cru SRST_A_MAC>;
+			reset-names = "stmmaceth";
+			rockchip,grf = <&vpu_grf>;
+			snps,axi-config = <&gmac1_stmmac_axi_setup>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
+			snps,tso;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <0x1>;
+				#size-cells = <0x0>;
+			};
+
+			gmac1_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <8>;
+				snps,wr_osr_lmt = <4>;
+			};
+
+			gmac1_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac1_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+		};
+
 		sdhci: mmc@ffbf0000 {
 			compatible = "rockchip,rk3528-dwcmshc",
 				     "rockchip,rk3588-dwcmshc";
-- 
2.49.0

