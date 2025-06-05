Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477127F73A;
	Thu,  5 Jun 2025 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165151; cv=none; b=HgKFWHN22ODabf+pl+QNzl1VAGn/857hgKyZgV6spNm11hQNJvnF/AWg6dGMm0K21XjkokGXLSeEBDEl3xLzP1EyujIJbvKR+ycp8r9haYkasbNjDMg5TT64agr5h6Yj37fBqNyOLznaQsoZ885UrOAuWJkrmys6rkEId9oxs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165151; c=relaxed/simple;
	bh=BHh7miztif8w1TU4C0GYfgNLt8KqIwMDlZP89wOv09E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv/JxSXxO4Qc8Gb1r5VhK0CuIC829b8dE/yKoSY5pRqNQyKGO0S1gt8gH4UT8nbFsbE/sPagCFLO2maLw4b7/+pvINoI3cB/RUEV4P9doV3YJQYHoGrP+q3PwZc2cuO3W8JODiNoQ4qmYE/LWgC8RoeDH6FojEdzMlVr2LmVYT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0UDV2s+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0UDV2s+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234b440afa7so16058145ad.0;
        Thu, 05 Jun 2025 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749165149; x=1749769949; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewyRAYkhZd92b7F4CWKDk1JwMN3zx+3mkjUHQ5qd6m4=;
        b=d0UDV2s+4QnqCtyLE41kHvaeQzahafdg+tCaMHKN8cdwqaFKMRL1uszXe2q67+Igtl
         2WFLHxZDHsGUmu5fKrJ8FoOlaLBPy5YbzlYmLqnt7pH4WLs75QAxkTY8gP9P3vHcQ98B
         Lqv4jERzIkEecenAAHBTeIgAyFa7CpF8QTKLsBaiWHtpPx940qdngy4I0NhMx0IowhyE
         WeTd02Wsmh2k+X2cz8C1dkg3rrkTpSxHNQxIWvAHQCNx1y2awba4zyzUrcfTcptS6Pit
         /Ez51JSSWMqMVDpDwzsf0pCgByWtNUmSxJ0N2+WbnwfyQC8WenUGreakvUiS5nQcZghg
         rYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749165149; x=1749769949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewyRAYkhZd92b7F4CWKDk1JwMN3zx+3mkjUHQ5qd6m4=;
        b=iljdk66NUqKLk5Yppo5cedZh6uXwFLf1AkOqZNdyjtu0qH4zjk5xo1CCjc6EZ87dQp
         pZvUhKkxR7tkv0dxEekPVkI8EtAIkhAzei893wFtC0hy4f+Cpf6KWY58xMi8yxFy5/pe
         qp6HQQNWkJUQH3v6coEE2mqjK4iRTcX+DMnlMEkhd4M8zQihg2tOzPypg3LcsXB6uaae
         jlv4hb7lrFBZhdf7giuMATk2fW17ggSTLoaw1iKWFG0i+m/ZHEkvBtVBbNBa2ldRS6cW
         r0US8+/39a5KmK9xERcQpma0QVy3iTT1X06czpaIwXzxu/l4glnCzkJ5gECe2gLXEoB1
         nQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVbJyGFYDnDMnrkTDYDJ7Xh0hmCrz1bXsG/cM2Pikp0+OtMkSvjhdW/ULkiSk0Rl5Djh8oJNG0LByVtFxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8M7eQq26rSoTa1y9+DxcQzI8SLDCu9aiE1zVTZ5gwvKOwDqb
	kggKIL6mRSxx7BrcXhBgqeyH5Z+dq1cpmks3IPx7hNAkIodv/RIpM9Vw
X-Gm-Gg: ASbGnctOQIROIQ6N3s66M9qECzbpw87GTXeOEyaGDnf4ZhdKdwuBf17/x3bcys/JFiS
	ee2H/FAQkonO1QponvDneY2nnVusLKlYbNuGhKdZCnH99opaPqYjRp3hlpP9N4oh1Z0aDRYaOR8
	P4yYh/8TGsxbO6z/p0TBN8Kn2v1cu+NX+RW5dsgZPHk2gPTElC6MBmGzIYqVoha8OEpdEay5K1K
	3DdozzzFaQqcEcTujXPX6BCpX7rDyEdxorrub4GmqKwu397J/ltMtfXcf6wI9tL62GQ+ElRTDzg
	pfwxF+yPO13w/Gyu4tTe4766cu7xsWq7fKPkhgyBs/swB76ucqIjjHm5XsCrew==
X-Google-Smtp-Source: AGHT+IHKXssEKuHD2t/QD6WQqtRRc34ubHifY7UsopBZFozbLU0lBwQttahY4O2s1U98OBHKHwC4jw==
X-Received: by 2002:a17:902:904b:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23601cf0b1bmr11055435ad.7.1749165148918;
        Thu, 05 Jun 2025 16:12:28 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603097091sm1346175ad.69.2025.06.05.16.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:12:28 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 05 Jun 2025 16:11:52 -0700
Subject: [PATCH v4 2/3] arm64: dts: rockchip: Add rk3588 based Radxa CM5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk3588s-cm5-io-dts-upstream-v4-2-8445db5ca6b0@gmail.com>
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
In-Reply-To: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.2

Add initial support for the Radxa Compute Module 5 (CM5). The CM5 uses a
proprietary connector.

Specification:
- Rockchip RK3588
- Up to 32 GB LPDDR4X
- Up to 128 GB eMMC
- 1x HDMI TX up to 8k@60 hz
- 1x eDP TX up to 4k@60 hz
- Gigabit Ethernet PHY

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 156 +++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d7946fe2bb4e721689e3eb4d60d8e9783402f05e
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
+ */
+
+/*
+ * CM5 data sheet
+ * https://dl.radxa.com/cm5/v2210/radxa_cm5_v2210_schematic.pdf
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+
+/ {
+	compatible = "radxa,cm5", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdmmc;
+		mmc1 = &sdhci;
+		mmc2 = &sdio;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_sys: led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3_s0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus
+		     &gmac1_clkinout>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m2_xfer>;
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8602";
+		reg = <0x43>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pd_gpu {
+	domain-supply = <&vdd_gpu_s0>;
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+

-- 
2.49.0

