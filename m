Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB72874EF;
	Thu,  8 May 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726561; cv=none; b=fKRjZj1INVgazovQmnCdMxAM+cLJwaLtlnvdf0RoKQ7Afy/xWd/tcY4HYv/Ja36pWfFsW4KeDsvf3sCXU9HUaKzGdmY7jpL/U2b8Smb7RBvAz4KbKt7cb4MJKiXOeqUzHQfV/rqCms9MPic4gngC42RLWDlIkri3fP0EQAEPlj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726561; c=relaxed/simple;
	bh=ab6aAqtGy1bZZeuXPkx80OYbA7f4f4wlEr4vVLzuEQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2ISWXN+BKtg4t2eIqoIqs+lN9eIqOnNizL64QzZzul8HJzGa+x7n3mJli0086oepK086SSufGUZeltxKW6Sgapxz7AxkAOrBv3fAEU8iSaR3CALqBfVBZ2fnDt8uXWYuk0980HpE1UkQs9dxCVX0BGq4lwKHefRBKcZL0gH7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pydYdzAE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pydYdzAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726548;
	bh=ab6aAqtGy1bZZeuXPkx80OYbA7f4f4wlEr4vVLzuEQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pydYdzAEjiKwaBd8gLFfMW2E43xIPJ3hW4D8+iOvCLJr7dZ/F+a95XZrHx9lcAOBS
	 SvSvyp0Lead+vJRGjRPf/BFuwBi8O3o00dtNHjs2T63YrDRSepQbB/6Ou+03SXLxH9
	 2Ti9R9S/8nADRwfJQSIyG4Ei6webZqcsIOkiEBq7ah+12ZZ9Mgy6z6N2TtYD9tGdGF
	 N4BMUs34HX6UZAGHSohCuS7pBE5vBBPuC6aRkflgCc6wdxJYNrcSjDHxwR/hKPkL2K
	 nyibhoXytwp/YRMozFE/qHC6GsbFsvsDUvsmgjIlWVEou8wDgIvhYwePQhSdb3A+cv
	 fvr2nw4kILYAw==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A5DB17E0811;
	Thu,  8 May 2025 19:49:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 749F8480048; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:54 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add USB-C support for ROCK
 5B+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-5-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7862; i=sre@kernel.org;
 h=from:subject:message-id; bh=ab6aAqtGy1bZZeuXPkx80OYbA7f4f4wlEr4vVLzuEQA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pMbQcTDAcrfXIVmLGh2WY7Fc08UDMBsL
 MJMInhM7LYmzokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qa5GQP/2kUyL6+9dqKxVJ286w782CmymK+LslLrNBBVUvuegbAx737nXymg1niQqZUv2qLiwC
 XL4B/erg+DqV6ccPD2Bd0JVKf+X8Wr5KYsKqk1lXt6jOOMLTsE2im8hk52JzsIhz8Gg6g8l1smg
 QYIB1AiDaAfBKPN00SUnN32C+UDqN7Z5VEVQDFjfXP61KmC+xmkOPrzZwlckoUWeyKAGHRRpUVb
 oPfn5Z083GSpm+4gy3Ltto/ESauVf/kQcwM/146++/yC8+3P/dTiKsFwHaeS0r0KODAufYUCArR
 b73MDjlFUeoAIEfNGFeTcIjmghUZVrJ9d6FYXgM/Fe4+UyslbTcFQZcMlmOB3g/6l2RrrRdHTAw
 IzufS14vVJYq/AVAuKobO0BTai+P9wIHTQjIeXNewPzWWNxIvWHWp89BB1vivxrGV8lGsI12T1U
 AB3CU11sFxvw+6Yk4H6nch5l25sMPOD7uIX7FkGpxNRxsDDsGdbqBQCnepmFTIoKtU7tVjo2Rnl
 ticuQ1rGKMGPxsRr1Owj1ijnuupJsaab8ziAvASSj4oZgH6WE0VoY5tTWSS2fEVBMj7cJtOisJ0
 1E+5EfqNOHrZMVY8aawt2lyj7d3xLg5EUjLfoWGVeOPjED+cLK5NSJj29Xp6NdEsyOhOnvlkxHH
 S/wAnEj/wwdm8Hp7HltcspQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add hardware description for the USB-C port in the Radxa ROCK 5 Model B+
This describes the OHCI, EHCI and XHCI USB parts, but not yet the DisplayPort
AltMode, since the bindings for that are not yet upstream.

Support for the ROCK 5B is prepared, but not exposed at the moment,
since it results in unreliable boot behavior due to hard resets killing
the supply voltage. Some further investigation and fixes in the kernel's
Type-C Port Manager (TCPM) state machine is needed before exposing the
port. The ROCK 5B+ has a dedicated port for powering the board and thus
is not affected.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  16 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  23 ++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 137 +++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
index 74c7b6502e4dda4b774f43c704ebaee350703c0d..4096cd853f9a909e4233d2c61a1fe5ee83904c4c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
@@ -99,12 +99,28 @@ pcie3x2_rst: pcie3x2-rst {
 	};
 
 	usb {
+		usbc_sbu_dc: usbc-sbu-dc {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
+					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
 
+&usbc0 {
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc_sbu_dc>;
+	sbu1-dc-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+};
+
 &vcc5v0_host {
 	enable-active-high;
 	gpio = <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 9407a7c9910ada1f6c803d2e15785a9cbd9bd655..ab0c572ea9234f373af4a47db93fc1786f0e6fbf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -36,8 +36,20 @@ &uart6 {
 	status = "okay";
 };
 
+&usbdp_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc_sbu_dc>;
+	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+};
+
 &pinctrl {
 	usb {
+		usbc_sbu_dc: usbc-sbu-dc {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
+					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
@@ -50,3 +62,14 @@ &vcc5v0_host {
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc5v0_host_en>;
 };
+
+/*
+ * Do not yet offer USB-C support on the Rock 5B. The current U-Boot
+ * Linux setup is quite unstable and for many power-supplies needs multiple
+ * hard resets to boot to userspace. Let's enable this once the issues
+ * in the TCPM kernel code have been solved. Without this any automated
+ * boot tests will run into problems.
+ */
+/delete-node/ &usbc0;
+/delete-node/ &usb_host0_xhci;
+/delete-node/ &usbdp_phy0;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 6052787d2560978d2bae6cfbeea5fc1d419d583a..314fdc0c1c20b25b0fdc5254f3b090586c169a00 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
 #include "rk3588.dtsi"
 
 / {
@@ -92,6 +93,15 @@ rfkill-bt {
 		shutdown-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
 	};
 
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
 	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -146,6 +156,19 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 		regulator-boot-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vbus5v0_typec: vbus5v0-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus5v0_typec_en>;
+		regulator-name = "vbus5v0_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
@@ -309,6 +332,67 @@ regulator-state-mem {
 	};
 };
 
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4m1_xfer>;
+	status = "okay";
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+		/*
+		 * When the board is starting to send power-delivery messages
+		 * too late (5 seconds according to the specification), the
+		 * power-supply reacts with a hard-reset. That removes the
+		 * power from VBUS for some time, which resets te whole board.
+		 */
+		status = "fail";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "sink";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>,
+				<PDO_VAR(5000, 20000, 5000)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_role_sw: endpoint {
+						remote-endpoint = <&dwc3_0_role_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&usbdp_phy0_orientation_switch>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dp_altmode_mux: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -481,6 +565,16 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
 			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vbus5v0_typec_en: vbus5v0-typec-en {
+			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm1 {
@@ -866,6 +960,14 @@ &uart2 {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
 &u2phy1 {
 	status = "okay";
 };
@@ -893,6 +995,27 @@ &u2phy3_host {
 	status = "okay";
 };
 
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+
+		usbdp_phy0_dp_altmode_mux: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_altmode_mux>;
+		};
+	};
+};
+
 &usbdp_phy1 {
 	status = "okay";
 };
@@ -905,6 +1028,20 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usb_host0_xhci {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dwc3_0_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
+};
+
 &usb_host1_ehci {
 	status = "okay";
 };

-- 
2.47.2

