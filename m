Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FC9235364;
	Thu,  8 May 2025 23:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748193; cv=none; b=CR2QoMGVvFJCp0eiG5809FxL5GhmbAE2f3foygrn/iWo9HdGHjlT+Z7+A9EVlKN+AayS3u8r80PbD28Ip+nNm6nAO9YvWqr8aNxKb0c/EiiumpVNCd6AkvebjgwKaQlV4Q32Fsi4aFmtY9XFC/4syzSMKGi4UtKlF4cj5UQHd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748193; c=relaxed/simple;
	bh=kijDMJqlKD9yOwTzumhm7hP9dmi1d/mq0EYroDcjheQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZvvI8EHboJuEk87Jk1gAwMasryF9gL50oDWrZCXd7sesI6O+m4xIEoj/ip37IqZBDge7hNVvCFY5qwweaymERdTRsHDUck8zEAWR+OBtHeXhb7xnc7Y/LDRv7KRek0QuadCz+h4lBt+RSIsgZUAg6ukPJ8/ktIf6IrPA0s9sR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=f1c0b3M7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="f1c0b3M7"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 33436260B4;
	Fri,  9 May 2025 01:49:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPESXp933hLo; Fri,  9 May 2025 01:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746748189; bh=kijDMJqlKD9yOwTzumhm7hP9dmi1d/mq0EYroDcjheQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f1c0b3M7TFg29F5QhsevI49hCuPo4IrRvwmi8ks6DNd5Z/g60gSAXZ4rugDMUihhF
	 PzsKj+ojPPyp5hq/zLgn5WKV8GgJSItjZVs2oe+ghP54ne6GU0Xqaaq81bMqHGVi+o
	 PjA1vSGT6uvbfCIqDC8m4KkoAhRUAHHzAMZQMrUyES+bn7QomuB5ac16dAmBIMgxXV
	 YJw8se8qNqodYfORFxtgSB8rBxN5+Nn0ck04iuAWtykgHlgLFMZ3HaBubBb9jVPiQF
	 MEr3xEU9+9Q44CWW7MvAEfxSvQoQnwygerzELOC01ldEwSNOCal9i2ua7SNSfn7DD9
	 Qph50B6duksmQ==
From: Yao Zi <ziyao@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] arm64: dts: rockchip: Enable SD-card interface on Radxa E20C
Date: Thu,  8 May 2025 23:48:30 +0000
Message-ID: <20250508234829.27111-4-ziyao@disroot.org>
In-Reply-To: <20250508234829.27111-2-ziyao@disroot.org>
References: <20250508234829.27111-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SD-card is available on Radxa E20C board.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 0942baba6b8f..d45b6594b2de 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
 	};
 
 	chosen {
@@ -130,6 +131,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 		regulator-max-microvolt = <5000000>;
 	};
 
+	vccio_sd: regulator-vccio-sd {
+		compatible = "regulator-gpio";
+		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <1800000 0x0>, <3300000 0x1>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vdd_arm: regulator-vdd-arm {
 		compatible = "pwm-regulator";
 		pwms = <&pwm1 0 5000 PWM_POLARITY_INVERTED>;
@@ -205,6 +218,12 @@ wan_led_g: wan-led-g {
 			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	sdmmc {
+		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm1 {
@@ -235,6 +254,17 @@ &sdhci {
 	status = "okay";
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
-- 
2.49.0

