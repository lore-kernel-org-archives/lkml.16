Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B624BCFD;
	Mon,  7 Apr 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029636; cv=none; b=XFN6rZM5SpuCME7A24RLrFuUK5EPlnFyWhTqOmgBAVjY3XjwTG7UViJVM6pxv0GOLE+03g/X/VFpf44xCnYD7+6p4mvUVbkEg6TLF73yu+B0KxsppUxqZZqH+yyqRehAKaOZ/O2I02l1pj/lbasRPZbTK9y3XbAZcNQtbjeCzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029636; c=relaxed/simple;
	bh=9b/CmXLUb4oO7usHoGG4t62ZEhc9XM1xbRBgYVUAIi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7g1UcW6u7g/er9fAPXwcL4w/4GJrSwWrSCO2w0/WCBto3rurwi/193Tqs/OWNEOxlQmeMv2RjSBiYWjAgjf1rsfnQMN7+jIL3cEvdroOdlDy9D0Tmysiu9o9QpFuYDKR1lJKK6+OGlotfTfIXllWZ2cC+OElCDONtgTYCylw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10f021907;
	Mon, 7 Apr 2025 20:40:19 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:52 +0800
Subject: [PATCH 7/7] riscv: dts: spacemit: add usb3.0 support for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-7-bf0bcc41c9ba@whut.edu.cn>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huangze@whut.edu.cn>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=4966;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=9b/CmXLUb4oO7usHoGG4t62ZEhc9XM1xbRBgYVUAIi8=;
 b=3KOUzEqgq3ngS8e6srGkEQ9llihvefBkIa8EYXsF8TW74OrzSONs6LXCSRXUK8I5VWyz1+N0r
 I7ecfweIWlhCt+kdQHfdPCR10sWfIpcv4hO+OU7QGL2NcGBdLp1l/yG
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQksaVh4dTRhKGBlKQxgYH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a96104417d303a1kunm10f021907
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzI6Mww4DDIBH0wMKBcDGjMo
	OCwaCkxVSlVKTE9PS0lCTUlMSkNKVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU1NS043Bg++

Add USB 3.0 support for the SpacemiT K1 SoC, including the
following components:

- USB 2.0 PHY node (usb_phy2)
- USB 3.0 combo PHY node (usb_phy3)
- USB 3.0 host controller (dwc3 glue + core)
- USB 3.0 hub and vbus regulator (usb3_vhub, usb3_vbus)
- DRAM interconnect node for USB DMA ("dma-mem")

The `usb3_vbus` and `usb3_vhub` regulator node provides a fixed 5V
supply to power the onboard USB 3.0 hub and usb vbus.

On K1, some DMA transfers from devices to memory use separate buses with
different DMA address translation rules from the parent node. We express
this relationship through the interconnects node("dma-mem").

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 55 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 52 +++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec490aff184d5915d680dbd9f00cb..9353432f171fc895fdd465654bc8166a1bc65e0b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	usb3_vhub: regulator-vhub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VHUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_vbus: regulator-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &uart0 {
@@ -35,3 +54,39 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+	vbus-supply = <&usb3_vbus>;
+
+	usb@0 {
+		dr_mode = "host";
+		phy_type = "utmi";
+		snps,hsphy_interface = "utmi";
+		snps,dis_enblslpm_quirk;
+		snps,dis-u1u2-quirk;
+		snps,dis-u2-freeclk-exists-quirk;
+		snps,dis-del-phy-power-chg-quirk;
+		snps,dis_u2_susphy_quirk;
+		snps,dis_u3_susphy_quirk;
+		snps,dis_rxdet_inp3_quirk;
+		snps,xhci-trb-ent-quirk;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hub@1 {
+			compatible = "usb2109,817";
+			reg = <0x1>;
+			vdd-supply = <&usb3_vhub>;
+			reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index dc675f7e9b131256c50e2ca4ff347ae54e4b62ae..be3648cdcecd715e656fb8bde8a434ace752c012 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-ccu.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -350,6 +352,14 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		dram_range0: dram_range@0 {
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+			#interconnect-cells = <0>;
+			status = "okay";
+		};
+
 		syscon_rcpu: system-controller@c0880000 {
 			compatible = "spacemit,k1-syscon-rcpu";
 			reg = <0x0 0xc0880000 0x0 0x2048>;
@@ -362,6 +372,48 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usb3: usb@c0a00000 {
+			compatible = "spacemit,k1-dwc3";
+			clocks = <&syscon_apmu CLK_USB30>;
+			clock-names = "usbdrd30";
+			interrupt-parent = <&plic>;
+			interrupts = <149>;
+			interconnects = <&dram_range0>;
+			interconnect-names = "dma-mem";
+			ranges = <0x0 0x0 0x0 0xc0a00000 0x0 0x10000>;
+			resets = <&syscon_apmu RESET_USB3_0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0 0x0 0x10000>;
+				interrupt-parent = <&plic>;
+				interrupts = <125>;
+				phys = <&usb3_phy0>, <&usb3_phy1 PHY_TYPE_USB3>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
+		usb3_phy0: usb-phy@0xc0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_phy1: combphy@c0b10000 {
+			compatible = "spacemit,k1-combphy";
+			reg = <0x0 0xc0b10000 0x0 0x800>,
+			      <0x0 0xd4282910 0x0 0x400>;
+			reg-names = "phy_ctrl", "phy_sel";
+			resets = <&syscon_apmu RESET_PCIE0>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.49.0

