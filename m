Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891C290DBF;
	Fri,  9 May 2025 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793960; cv=pass; b=W80j8uMjvhvYKogRJv6HvJrmy5cqIW7YHWlGpUuJko14PS8upREeMog2ulN6MIWv4Cc4HANFjHT3iEPdCr+Fm55GNxPAU5oEPL+jduYH6W7Q5EM+G+NDzQvI5j+NbOFZ02iWpgYb1BMipujcMOOHun7ZRZ3Vt7KwmgJ1VBDsGCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793960; c=relaxed/simple;
	bh=kmIfL21M0eDjl0pSbXFZnfqVqlW5S6SXBuijKGoJqMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTgLHJFk5rvn6vIaSFjCPen1xu1hjJIxeI6XKeC36pD1weBS4zhjl5pw2Sx9ut6e33fg8DDRSy9PT+EJ2AsWPxqaxEjPJQzp9LeoVR2glmkgSIpIU8BZxAxb/1UIypWqtWFmjPwl0/9w/VAfCUxPnRYJ/ZpxkxEUlpFQLvJIf2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=We3Wo5Gm; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="We3Wo5Gm"
ARC-Seal: i=1; a=rsa-sha256; t=1746793941; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7VXHe948DTKp7d2H26qPUXEhomzSFxR9cRa8Y6nx8TM6VFsXLkkU2Nu4fkrl+Km6TGHr6RlYPhQhCLjnmyau2Z/e9plPyVFWlcq7cDB7ZbafK3tQUqhJ2N/b092CGTcAK/HG1ctb6gdqVPid0mUt7ySRv+Gj9rVQeHYE77vUKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746793941; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wnIutrqgp/730meJXqnExUugfDBuXd3SUC7bTU9HmFk=; 
	b=WKu6rt4vLK9C1qfDjFYzZf8uKsVUvtxQwfLh+fm0w1JYj3IuiCcr08UyrkB2bWVd27GfJeWKXMq8fVKg/Os3vzYOaLeEa1BMwERwN7AbPAFDfc+bhlcgsL4PAhgNxdW9XsotaVgNSQNjAUb010DzyupXBr3zKjLmueUzJ0HyW5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746793941;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=wnIutrqgp/730meJXqnExUugfDBuXd3SUC7bTU9HmFk=;
	b=We3Wo5GmSp/9cX4H6r0+SHvNk3PeAtKI1Vwj2iQjSCOWi4pwZR373XpI2LRQK4Vv
	c6ENe1EMasRh5d/A9ZzfiZY5eRxIKN2e92qNhpLrripH4D0CQcVepnquSUjYOTAq7A+
	QXn0fsirYt58AQ9hwZp0MrQvGxz6cNt3fWgLHG3I=
Received: by mx.zohomail.com with SMTPS id 1746793940560889.20581442018;
	Fri, 9 May 2025 05:32:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 09 May 2025 14:31:43 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add ROCK 5T device tree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-add-rock5t-v1-3-cff1de74eced@collabora.com>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
In-Reply-To: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RADXA ROCK 5T is a single board computer quite similar to the ROCK
5B+, except it has one more PCIe-to-Ethernet controller (at the expense
of a USB3 port) and a barrel jack for power input instead. Some pins are
shuffled around as well.

Add a device tree for it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile           |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts | 105 ++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 7a05bd885d5ecb96c3decbd3f483a6c58b81e0ab..eee0b27ca9f6a330baae8b50ca6aaed5de56227f 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
new file mode 100644
index 0000000000000000000000000000000000000000..258c7400301d7f77517197ab433946bbfa39cf63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588-rock-5b-5bp-5t.dtsi"
+
+/ {
+	model = "Radxa ROCK 5T";
+	compatible = "radxa,rock-5t", "rockchip,rk3588";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588-es8316";
+
+		widgets = "Microphone", "Mic Jack",
+		"Headphone", "Headphones";
+
+		routing = "MIC2", "Mic Jack",
+		"Headphones", "HPOL",
+		"Headphones", "HPOR";
+
+		dais = <&i2s0_8ch_p0>;
+		hp-det-gpios = <&gpio4 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_rgb_b>;
+
+		led_rgb_b {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-m2-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+	};
+
+	vcc3v3_pcie2x1l1: regulator-vcc3v3-pcie2x1l2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie2x1l1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_1_rst>;
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
+	status = "okay";
+};
+
+&pinctrl {
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_rgb_b: led-rgb-b {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		pcie2_1_rst: pcie2-1-rst {
+			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
+			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc3v3_pcie2x1l0 {
+	gpios = <&gpio2 RK_PC0 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_vcc3v3_en>;
+	status = "okay";
+};

-- 
2.49.0

