Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1476222652D;
	Mon,  7 Apr 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049422; cv=pass; b=mjCVLiBnkxGDk6B3PeAjUX0Lgy5VewO9R4Vm6+FpJM9u+YL1W6kkgagY5Kd4eCbMj1UuChj9pS00AOA7+anN3oSo5ae7m/Tm6I3Rh+hXPWw+ZIPlc7iONk6pmnOsrCt/IASSEiAIPnxwMp5uLV+Ed1JA0wlVWx2/HKGKGE9k9d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049422; c=relaxed/simple;
	bh=3up7opuehpBhT967vNE90K2e+CH2SO/lQi/Ygllvxcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sdyMevfdahFvm1QqeSMo9tYecp11biyBbhfm7cY4Gq1mUY7WkbkO5jHjL2lzKSJyu9VKjQybzavg66UVW1uFxeLbaguSS5M2NCHiaHHzrGusG5y3aXls5xvIZjPK73FuuAICURPzQeWUpAUbJ/ZHsaF6nphJuH6hVouXD7VfD5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=AVHCswuj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="AVHCswuj"
ARC-Seal: i=1; a=rsa-sha256; t=1744049398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L7ZIIBXp64pKw0YfQAJ9eeFkBk7MKn3P4PYa0AVapVsvjZYiwVvIKuBFERU0O1JdoFzsHfhOD+jYAr3AqmA2+0DJevZRGymFAIMUzkXDTFyKnRsI6RrHPE8l126IsYGbj8E8DGb8SIZ6g5GA64hgA+hoSKUxXHkhOXn2bumAk18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xnv5MfaFzomawaxWyH7pWxpw5ddTb5bXnqTSVdYnSdk=; 
	b=c3s68I/jQrQklNJHmiEynxXfmNyb++bmmR2YyFtXhGG3VRM0Rjkmb6YWWM94u9forsAEWzzPQN9JqgMByjVf1vgk6mc+uZu4Ib9JyWv7Wcj+RfjzPo1nbMApYbo7+/OAOa+bbowKAEo7KkAT3pEJuOvoTW58AAQPLaetHve5j8w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049398;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Xnv5MfaFzomawaxWyH7pWxpw5ddTb5bXnqTSVdYnSdk=;
	b=AVHCswuj8QKflz+JtHurC86AVR5fkFb2a+xHP+VdU+cKoyStT4rU/Dad1vFZqCB0
	UHhq9ZU0FerqTM2ga2bweLJe2xnV8bVQT54v5XdBQlIVfc5UEDE002shiofdDBRllIH
	anSpgvwL5g4gtqgn16lVKcNBrt5WOPIHfnx8Eojw=
Received: by mx.zohomail.com with SMTPS id 1744049396610968.3321994444946;
	Mon, 7 Apr 2025 11:09:56 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:17 +0200
Subject: [PATCH 4/4] arm64: dts: rockchip: enable USB on Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-4-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The ArmSoM Sige5 has several USB ports: a Type-A USB 3 port (USB2 lines
going through a hub), a Type-A USB 2.0 port (also going through a hub),
a Type-C DC input port that has absolutely no USB data connection and a
Type-C port with USB3.2 Gen1x1 that's also the maskrom programming port.

Enable these ports, and set the device role to be host for the host
ports.

The data capable Type-C USB port uses a fusb302 for data role switching.
It currently does not have functioning SuperSpeed with certain Type-C
cables in one of the two possible orientations.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 828bde7fab68dc6bcbd13d75c8a72540b3666071..cdd8f8b2319105b1dae34395be20e50d45cd4431 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -175,6 +175,33 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg0_pwren>;
+		regulator-name = "vcc_5v0_typec0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+	vcc_5v0_usbhost: regulator-vcc-5v0-usbhost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+		regulator-name = "vcc_5v0_usbhost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0_device>;
+	};
+};
+
+&combphy1_psu {
+	status = "okay";
 };
 
 &cpu_l0 {
@@ -605,6 +632,58 @@ regulator-state-mem {
 &i2c2 {
 	status = "okay";
 
+	usbc0: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_interrupt>;
+		vbus-supply = <&vcc_5v0_typec0>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
+			power-role = "source";
+			source-pdos = <PDO_FIXED(5000, 2000,
+						 PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs_ep: endpoint {
+						remote-endpoint = <&u2phy0_ep>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					usbc0_ss_ep: endpoint {
+						remote-endpoint = <&usb_drd0_ep>;
+					};
+				};
+				port@2 {
+					reg = <2>;
+					usbc0_dp_ep: endpoint {
+						remote-endpoint = <&usbdp_phy_ep>;
+					};
+				};
+			};
+		};
+	};
+
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -655,6 +734,24 @@ led_rgb_g: led-green-en {
 			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		usb_otg0_pwren: usb-otg0-pwren {
+			rockchip,pins = <4 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		usbc0_interrupt: usbc0-interrupt {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+		usbc0_sbu1: usbc0-sbu1 {
+			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		usbc0_sbu2: usbc0-sbu2 {
+			rockchip,pins = <2 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &sdhci {
@@ -683,11 +780,67 @@ &sdmmc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+
+	port {
+		u2phy0_ep: endpoint {
+			remote-endpoint = <&usbc0_hs_ep>;
+		};
+	};
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_usbhost>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usb_drd0_dwc3 {
+	usb-role-switch;
+	dr_mode = "otg";
+	status = "okay";
+
+	port {
+		usb_drd0_ep: endpoint {
+			remote-endpoint = <&usbc0_ss_ep>;
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbdp_phy {
+	mode-switch;
+	orientation-switch;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbc0_sbu1 &usbc0_sbu2>;
+	sbu1-dc-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio2 RK_PA7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	port {
+		usbdp_phy_ep: endpoint {
+			remote-endpoint = <&usbc0_dp_ep>;
+		};
+	};
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0

