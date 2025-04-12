Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498F28FF;
	Sat, 12 Apr 2025 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744453885; cv=none; b=Jp/HjHh7Ga4qmCCGikCReem52tmqywzFhR5mmIX4IUMZ+tSNawtms6RxNaOTE5J/4Zb8HRR+EHVhITJn8K2U47YXPcQLNqVRMD+9Ql2dTt+Oc3OAjw2Il+IgLL9Z4DBomXbU16JOc0eBGyxX4eCnjgoYikQBYKJYyfhqX0h4nh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744453885; c=relaxed/simple;
	bh=urZiRLAp0aoNUYUITEgwgx5XgHsoaRYj67OdOVlu9ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIfvDvxs4lYYxgXq96nHzzEHt6NDrq+37EebetLPIvx0AzcHudLXrNQyMjHzATDLWHdPyipDsSndC4VjiIQ5x3szb37hBmz+jEKj1BNVsJg7va0LdUab4+btnIv3ZnYf4q3MOVMYvkymhqJm2KJV8hiy850hFwPMliI/sBxAdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ubHfoeyd; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ubHfoeyd"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 7B5055FDD4;
	Sat, 12 Apr 2025 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744453294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9yyHzze+oCaHafYrSUqcLsH/ROgdWzv/1y2Xpf4//kk=;
	b=ubHfoeyd/duRAyUXsHw39Wm1HZB6CuDk//SHWPBqAaPHtMcCuQDU8lVhKqjNlzOrq8/LXA
	KuJx+T2KvOuOw+DN9msky47WBlhNogxWfpGIS5mv6vdpntjinrRoJJRYMN8/HlKgXjb0tR
	h28iN9YrQ0Fi3fk8GHV7Yu4Z9YpowLs=
Received: from frank-u24.. (fttx-pool-194.15.86.2.bambit.de [194.15.86.2])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 838DB803AB;
	Sat, 12 Apr 2025 10:21:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
Date: Sat, 12 Apr 2025 12:21:08 +0200
Message-ID: <20250412102109.101094-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 6b0e37a7-b3fa-40bc-9b71-d54df8b01019

From: Frank Wunderlich <frank-w@public-files.de>

Sinovoip has released other variants of Bananapi-R4 board.
The known changes affecting only the LAN SFP+ slot which is replaced
by a 2.5G phy with optional PoE.

Just move the common parts to a new dtsi and keep differences (only
i2c for lan-sfp) in dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- added basic dts for 2g5 variant
- moved i2c used for sfp-lan to board dts
---
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
 4 files changed, 414 insertions(+), 400 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..a1ebc9aa4ba6 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
@@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
 DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
 DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
 DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
+DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
 DTC_FLAGS_mt8395-radxa-nio-12l := -@
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
new file mode 100644
index 000000000000..76eca976b968
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+
+/dts-v1/;
+
+#include "mt7988a-bananapi-bpi-r4.dtsi"
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

