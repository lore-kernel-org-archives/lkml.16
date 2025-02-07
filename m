Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B7226198;
	Fri,  7 Feb 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936985; cv=none; b=p9gQT4n2JHom+Vh2hN4zxxA/hOGpo9hOX94bUxZDnCD2FNPb3gS6v0lc59dmhDjhGD/Zz6hbaeq0mgh9HJBAYna0039Y5gOhbZ1FwjtLPeLVThZ0N7aWJvtQ9BRaPrWbMF73Csb5sIok/J/+42ZdWfo3PvNBtn+CF34+EpGlSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936985; c=relaxed/simple;
	bh=QSpzMBCIiH7HGQWLT2zzCYyRKsWpv7LsStbHuNI9Few=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJuKTS1xsG4dkPlIrDWQD/rZk8dyg0oTwK54kMfeNR3EXSA7cQd0EyTO8fXbdyYztKa6KTFDkGZA9A6/O2Zzk17HlvZC3JGtZLo7E17HDjFtAo2Gb9n6hhaf9jmHV20IVpKDwl27SLqxsf0wqiMbOfoO6VCFDXB+w3lRAdcEOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ghrDFjIX; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ghrDFjIX"
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id F0F5F100901;
	Fri,  7 Feb 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1738936516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wCTfjr+f1FafIc1yYmGfv3Kx0C4OjTm44rD+bxKZn5Q=;
	b=ghrDFjIX48psAkBcd6Y88E++Na1OEarqQ/AzlreK1r8oK7UWtxLys6BMoiQjeoExuiQZ5s
	tn+lY+GtEQowoZ3/WDJkYPE1nfkjsOKvF9gqc4002smsB//vmPW+fbizLlcpWIxiBUKw6F
	cBnVmVdYxNLLKWAZ2mw4Aj1hfDGBubs=
Received: from frank-u24.. (fttx-pool-217.61.148.125.bambit.de [217.61.148.125])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 2EE5810010F;
	Fri,  7 Feb 2025 13:55:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
Date: Fri,  7 Feb 2025 14:54:59 +0100
Message-ID: <20250207135501.30741-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 50e4dac5-3d8a-4e0c-87d8-2e55e4fd535c

From: Frank Wunderlich <frank-w@public-files.de>

Sinovoip has released other variants of Bananapi-R4 board.
The known changes affecting only the LAN SFP+ slot which is replaced
by a 2.5G phy with optional PoE.

As the SFP-Ports are not upstreamed yet this patch simply renames the
current board dts to dtsi, creating new dts for the board including
the new dtsi and move i2c-mux channel for sfp lan to board dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
 2 files changed, 407 insertions(+), 400 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 6623112c24c7..431bf066fffb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -2,408 +2,12 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+#include "mt7988a-bananapi-bpi-r4.dtsi"
 
-#include "mt7988a.dtsi"
-
-/ {
-	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
-	model = "Banana Pi BPI-R4";
-	chassis-type = "embedded";
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	reg_1p8v: regulator-1p8v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-};
-
-&cpu0 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu1 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu2 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu3 {
-	proc-supply = <&rt5190_buck3>;
-};
-
-&cpu_thermal {
-	trips {
-		cpu_trip_hot: hot {
-			temperature = <120000>;
-			hysteresis = <2000>;
-			type = "hot";
-		};
-
-		cpu_trip_active_high: active-high {
-			temperature = <115000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-
-		cpu_trip_active_med: active-med {
-			temperature = <85000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-
-		cpu_trip_active_low: active-low {
-			temperature = <40000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-	};
-};
-
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins>;
-	status = "okay";
-
-	rt5190a_64: rt5190a@64 {
-		compatible = "richtek,rt5190a";
-		reg = <0x64>;
-		vin2-supply = <&rt5190_buck1>;
-		vin3-supply = <&rt5190_buck1>;
-		vin4-supply = <&rt5190_buck1>;
-
-		regulators {
-			rt5190_buck1: buck1 {
-				regulator-name = "rt5190a-buck1";
-				regulator-min-microvolt = <5090000>;
-				regulator-max-microvolt = <5090000>;
-				regulator-allowed-modes =
-				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			buck2 {
-				regulator-name = "vcore";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			rt5190_buck3: buck3 {
-				regulator-name = "vproc";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-boot-on;
-			};
-			buck4 {
-				regulator-name = "rt5190a-buck4";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-allowed-modes =
-				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-			ldo {
-				regulator-name = "rt5190a-ldo";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-};
-
-&i2c2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_1_pins>;
-	status = "okay";
-
-	pca9545: i2c-mux@70 {
-		compatible = "nxp,pca9545";
-		reg = <0x70>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+&pca9545 {
+	i2c_sfp2: i2c@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-
-		i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-
-			pcf8563: rtc@51 {
-				compatible = "nxp,pcf8563";
-				reg = <0x51>;
-				#clock-cells = <0>;
-			};
-
-			eeprom@57 {
-				compatible = "atmel,24c02";
-				reg = <0x57>;
-				size = <256>;
-			};
-
-		};
-
-		i2c_sfp1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		i2c_sfp2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
+		reg = <2>;
 	};
 };
-
-/* mPCIe SIM2 */
-&pcie0 {
-	status = "okay";
-};
-
-/* mPCIe SIM3 */
-&pcie1 {
-	status = "okay";
-};
-
-/* M.2 key-B SIM1 */
-&pcie2 {
-	status = "okay";
-};
-
-/* M.2 key-M SSD */
-&pcie3 {
-	status = "okay";
-};
-
-&pio {
-	mdio0_pins: mdio0-pins {
-		mux {
-			function = "eth";
-			groups = "mdc_mdio0";
-		};
-
-		conf {
-			pins = "SMI_0_MDC", "SMI_0_MDIO";
-			drive-strength = <8>;
-		};
-	};
-
-	i2c0_pins: i2c0-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c0_1";
-		};
-	};
-
-	i2c1_pins: i2c1-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c1_0";
-		};
-	};
-
-	i2c1_sfp_pins: i2c1-sfp-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c1_sfp";
-		};
-	};
-
-	i2c2_0_pins: i2c2-g0-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c2_0";
-		};
-	};
-
-	i2c2_1_pins: i2c2-g1-pins {
-		mux {
-			function = "i2c";
-			groups = "i2c2_1";
-		};
-	};
-
-	gbe0_led0_pins: gbe0-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe0_led0";
-		};
-	};
-
-	gbe1_led0_pins: gbe1-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe1_led0";
-		};
-	};
-
-	gbe2_led0_pins: gbe2-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe2_led0";
-		};
-	};
-
-	gbe3_led0_pins: gbe3-led0-pins {
-		mux {
-			function = "led";
-			groups = "gbe3_led0";
-		};
-	};
-
-	gbe0_led1_pins: gbe0-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe0_led1";
-		};
-	};
-
-	gbe1_led1_pins: gbe1-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe1_led1";
-		};
-	};
-
-	gbe2_led1_pins: gbe2-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe2_led1";
-		};
-	};
-
-	gbe3_led1_pins: gbe3-led1-pins {
-		mux {
-			function = "led";
-			groups = "gbe3_led1";
-		};
-	};
-
-	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
-		mux {
-			function = "led";
-			groups = "2p5gbe_led0";
-		};
-	};
-
-	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
-		mux {
-			function = "led";
-			groups = "2p5gbe_led1";
-		};
-	};
-
-	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
-		mux {
-			function = "flash";
-			groups = "emmc_45";
-		};
-	};
-
-	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
-		mux {
-			function = "flash";
-			groups = "emmc_51";
-		};
-	};
-
-	mmc0_pins_sdcard: mmc0-sdcard-pins {
-		mux {
-			function = "flash";
-			groups = "sdcard";
-		};
-	};
-
-	uart0_pins: uart0-pins {
-		mux {
-			function = "uart";
-			groups =  "uart0";
-		};
-	};
-
-	snfi_pins: snfi-pins {
-		mux {
-			function = "flash";
-			groups = "snfi";
-		};
-	};
-
-	spi0_pins: spi0-pins {
-		mux {
-			function = "spi";
-			groups = "spi0";
-		};
-	};
-
-	spi0_flash_pins: spi0-flash-pins {
-		mux {
-			function = "spi";
-			groups = "spi0", "spi0_wp_hold";
-		};
-	};
-
-	spi1_pins: spi1-pins {
-		mux {
-			function = "spi";
-			groups = "spi1";
-		};
-	};
-
-	spi2_pins: spi2-pins {
-		mux {
-			function = "spi";
-			groups = "spi2";
-		};
-	};
-
-	spi2_flash_pins: spi2-flash-pins {
-		mux {
-			function = "spi";
-			groups = "spi2", "spi2_wp_hold";
-		};
-	};
-};
-
-&pwm {
-	status = "okay";
-};
-
-&serial0 {
-	status = "okay";
-};
-
-&ssusb1 {
-	status = "okay";
-};
-
-&tphy {
-	status = "okay";
-};
-
-&watchdog {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
new file mode 100644
index 000000000000..1ab09ed2f151
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+
+#include "mt7988a.dtsi"
+
+/ {
+	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
+	model = "Banana Pi BPI-R4";
+	chassis-type = "embedded";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu1 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu2 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu3 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu_thermal {
+	trips {
+		cpu_trip_hot: hot {
+			temperature = <120000>;
+			hysteresis = <2000>;
+			type = "hot";
+		};
+
+		cpu_trip_active_high: active-high {
+			temperature = <115000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_med: active-med {
+			temperature = <85000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_low: active-low {
+			temperature = <40000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	rt5190a_64: rt5190a@64 {
+		compatible = "richtek,rt5190a";
+		reg = <0x64>;
+		vin2-supply = <&rt5190_buck1>;
+		vin3-supply = <&rt5190_buck1>;
+		vin4-supply = <&rt5190_buck1>;
+
+		regulators {
+			rt5190_buck1: buck1 {
+				regulator-name = "rt5190a-buck1";
+				regulator-min-microvolt = <5090000>;
+				regulator-max-microvolt = <5090000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			buck2 {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			rt5190_buck3: buck3 {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+			};
+			buck4 {
+				regulator-name = "rt5190a-buck4";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO>, <RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			ldo {
+				regulator-name = "rt5190a-ldo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_pins>;
+	status = "okay";
+
+	pca9545: i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			pcf8563: rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+				#clock-cells = <0>;
+			};
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+				size = <256>;
+			};
+
+		};
+
+		i2c_sfp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+};
+
+/* mPCIe SIM2 */
+&pcie0 {
+	status = "okay";
+};
+
+/* mPCIe SIM3 */
+&pcie1 {
+	status = "okay";
+};
+
+/* M.2 key-B SIM1 */
+&pcie2 {
+	status = "okay";
+};
+
+/* M.2 key-M SSD */
+&pcie3 {
+	status = "okay";
+};
+
+&pio {
+	mdio0_pins: mdio0-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio0";
+		};
+
+		conf {
+			pins = "SMI_0_MDC", "SMI_0_MDIO";
+			drive-strength = <8>;
+		};
+	};
+
+	i2c0_pins: i2c0-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c0_1";
+		};
+	};
+
+	i2c1_pins: i2c1-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_0";
+		};
+	};
+
+	i2c1_sfp_pins: i2c1-sfp-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_sfp";
+		};
+	};
+
+	i2c2_0_pins: i2c2-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_0";
+		};
+	};
+
+	i2c2_1_pins: i2c2-g1-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_1";
+		};
+	};
+
+	gbe0_led0_pins: gbe0-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led0";
+		};
+	};
+
+	gbe1_led0_pins: gbe1-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led0";
+		};
+	};
+
+	gbe2_led0_pins: gbe2-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led0";
+		};
+	};
+
+	gbe3_led0_pins: gbe3-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led0";
+		};
+	};
+
+	gbe0_led1_pins: gbe0-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led1";
+		};
+	};
+
+	gbe1_led1_pins: gbe1-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe1_led1";
+		};
+	};
+
+	gbe2_led1_pins: gbe2-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe2_led1";
+		};
+	};
+
+	gbe3_led1_pins: gbe3-led1-pins {
+		mux {
+			function = "led";
+			groups = "gbe3_led1";
+		};
+	};
+
+	i2p5gbe_led0_pins: 2p5gbe-led0-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led0";
+		};
+	};
+
+	i2p5gbe_led1_pins: 2p5gbe-led1-pins {
+		mux {
+			function = "led";
+			groups = "2p5gbe_led1";
+		};
+	};
+
+	mmc0_pins_emmc_45: mmc0-emmc-45-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_45";
+		};
+	};
+
+	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_51";
+		};
+	};
+
+	mmc0_pins_sdcard: mmc0-sdcard-pins {
+		mux {
+			function = "flash";
+			groups = "sdcard";
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		mux {
+			function = "uart";
+			groups =  "uart0";
+		};
+	};
+
+	snfi_pins: snfi-pins {
+		mux {
+			function = "flash";
+			groups = "snfi";
+		};
+	};
+
+	spi0_pins: spi0-pins {
+		mux {
+			function = "spi";
+			groups = "spi0";
+		};
+	};
+
+	spi0_flash_pins: spi0-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	spi1_pins: spi1-pins {
+		mux {
+			function = "spi";
+			groups = "spi1";
+		};
+	};
+
+	spi2_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+	};
+
+	spi2_flash_pins: spi2-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi2", "spi2_wp_hold";
+		};
+	};
+};
+
+&pwm {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&ssusb1 {
+	status = "okay";
+};
+
+&tphy {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
-- 
2.43.0

