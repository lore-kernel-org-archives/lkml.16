Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212729CE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155682; cv=none; b=svsxDwYzc0sFxl+43o2CJGAcPThXkQp4Fmk0QR4sfNTbyszhiD3hK0uP3weMumaIkB9cDCosyNyD18NjnpoENlInvvyL9r8yPclv1Gc1FVSakRoBV34pYtUvVPeAWTRXLjRlseaEu8Gx8sRrkCTaZZRGogYngfcQOVM31low5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155682; c=relaxed/simple;
	bh=szT5c7yJzLi5b7IM3Uiz+loSlGaMIvgDJwNDOS4+2D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImFv2DGZu76Ohqa9QNv8L+Vg9k2EZHWL2DETfI/9FLP7lNFqsySMSUqSyVI2q8CEe9/o7OKypELLCcDZ61c5QH54KINOrA40KOihSAktxB7DfabkBTA+dIxGJCBLCnZrqn1wLfccutIqMAQxtAC5Bn8TXuoVQctF4MoKASfM0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Otc68QU8; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Otc68QU8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747155674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zxp5saJ00M0V4HD55ygHhJp7ySrhrAQhBKVNcX+nZcA=;
	b=Otc68QU84N5ZqYJGbMPb31Z9ICWeBRz9p/HX0/+qKkt37fDhjWsr9FQCOwbDW/cyICpCMU
	vYdzQ7SzmLwNmd5/MSwXmAZmaS9J0AZ6q435rWS7Zq6lLuX3XL+0tx3GRj850YH8QxG3Sv
	+ZnjrzgbEprC5Hf+82AMa4JaAZkHkaECyd4adpcMrLJnzRl0qXN3eeNB1cfQSxXmaeZvBV
	15xh8kPFVeq36oS+lOsPgT9DrD4a3Wt+/aCPiFQ7sprgNrJeSlQaGIurXD38flngsr4LEs
	UdgT0fSwAfKanyXq9LA47m56u42KjID6Ag8p/QV0sNkWnK/5neWrwBdxiQoiqg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Improve LED config for NanoPi R5S
Date: Tue, 13 May 2025 18:57:27 +0200
Message-ID: <20250513170056.96259-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The NanoPi R5S has 4 GPIO LEDs, a RED one for SYStem power and 3 green
LEDs meant to indicate that a cable is connected to either of the
2.5GbE LAN ports or the 1GbE WAN port.

In the NanoPi R5S schematic (2204; page 19) as well as on the PCB and on
the case, SYS is used and not POWER. So replace 'power' with 'sys'.
But keep the 'power_led' label/phandle even though the kernel doesn't
use it, but it may be used outside of it.

The SYStem LED already had "heartbeat" as its default-trigger.
Set the default-trigger to "netdev" for the NICs so they will show when
LAN1/LAN2/WAN is connected and set their default-state to "off".

Also assign labels as close as possible to the labels on the case, while
still being descriptive enough in their own right.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../boot/dts/rockchip/rk3568-nanopi-r5s.dts    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 4cb8df1129c0..3b31f0dd8f3b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -20,33 +20,43 @@ aliases {
 	gpio-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-		pinctrl-0 = <&lan1_led_pin>, <&lan2_led_pin>, <&power_led_pin>, <&wan_led_pin>;
+		pinctrl-0 = <&lan1_led_pin>, <&lan2_led_pin>, <&sys_led_pin>, <&wan_led_pin>;
 
 		led-lan1 {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			function-enumerator = <1>;
 			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
+			label = "LAN-1";
+			linux,default-trigger = "netdev";
 		};
 
 		led-lan2 {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			function-enumerator = <2>;
 			gpios = <&gpio3 RK_PD7 GPIO_ACTIVE_HIGH>;
+			label = "LAN-2";
+			linux,default-trigger = "netdev";
 		};
 
-		power_led: led-power {
+		power_led: led-sys {
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_POWER;
-			linux,default-trigger = "heartbeat";
 			gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+			label = "SYS";
+			linux,default-trigger = "heartbeat";
 		};
 
 		led-wan {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_WAN;
 			gpios = <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
+			label = "WAN";
+			linux,default-trigger = "netdev";
 		};
 	};
 };
@@ -126,7 +136,7 @@ lan2_led_pin: lan2-led-pin {
 			rockchip,pins = <3 RK_PD7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		power_led_pin: power-led-pin {
+		sys_led_pin: sys-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-- 
2.49.0

