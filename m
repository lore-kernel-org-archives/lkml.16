Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3B2AF07;
	Thu, 19 Jun 2025 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340505; cv=none; b=CASIboj8y4QyzsM7XfRmDvvMbDOmnBUGvspYubwlN49lsxIs9oB+kV+kZZiKWrZx3ZTe5UtRWyjA0Sr7GvoHAwnJr7P2IUbXxJq4QTmjke1ZuwPX4c9aGYJdjSUWeyyadw1TxXktF1VqkQfM5sxLRyDS1Ea3B5zRxIhVsXl9pW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340505; c=relaxed/simple;
	bh=+dwseforO2BM0AdnV3KhkgIxdx8vHKv7acvhjj7Tpd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=efYhDkA4LRTrUGmEoLEcSMECFWig88B0JBX4SZRrAudqNq165JDsED4UroEXCmQXmHmB4mQ2PkLATP8ErwgFezu5umJxhbxuDaZIkLGsZ2NOmezQyCo2MGBYnxRWaeGHEm9aWQKTWbammZPpX1XpR/To743ckphoUdEKlcOxAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U6UhRPCy; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U6UhRPCy"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06EB4442A7;
	Thu, 19 Jun 2025 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750340495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Vu3ojqeO4nEZGrlEv+MrMGB/iAFdtlTHlUQ6a2DKkk=;
	b=U6UhRPCyisMszMQuQ9+irt0NQEBugn34Ray3XLy55XnpTRmLgtwWlthDhmUb+ZZxycsxRv
	+IosUqV58UdhyU2kRmvmHsv2FEng3dOVxiibyO1OlRopR0rZvzbXyF9G15oiWIB8RtRRu2
	CX2dZLcXKXT8HG0H0sBSRDIUf8wJURT6hF5Ze7E3rJPaxbb0HVkj4aM4AfZgERYvcgB5EE
	thC/YJGxoKAkURrlVEZT8n6m+YArkRrEIQy8pYmbl9XJsLCsGlDhxU7/8k8HEaQwLhxW7h
	qndtgDRT+14KqrGqGZBTFdtEEinmju109AP2KwQppoYMeCrWZJXYyGicSOVMmw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 19 Jun 2025 15:41:24 +0200
Subject: [PATCH v3] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-dtb_fixes-v3-1-9cb02ddd8ce4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIMTVGgC/22MTQ6CMBBGr0Jm7RimAhVX3sMY09JRJlFqWtJoC
 He3uMLE5ffz3gSRg3CEQzFB4CRR/JDDblNA15vhxiguZ1ClqsuG9uhGe7nKiyO2uqnqKvekGPL
 /Gfg75PvpnHMvcfTh/VUnWtp/lkRYIteVbrVxiq05Wu/Huwzbzj9g8SS1Zts1q5DQWKeJHJFt9
 C87z/MHptoQeeAAAAA=
X-Change-ID: 20250618-dtb_fixes-97645402512e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkefhvdelleeuhefgvdekveffieelhfeujefgtdejueelgfeltdefffehtddvfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopegludelvddrudeikedruddrvddtngdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheph
 hgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhopehlihhnuhigqdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg

Fix a few issues in the panel section of the PinePhone Pro DTS:
  - add the second part of the Himax HX8394 LCD panel controller
    compatible
  - as proposed by Diederik de Haas, reuse the mipi_out and ports
    definitions from rk3399-base.dtsi instead of redefining them
  - add a pinctrl for the LCD_RST signal for LCD1, derived from
    LCD1_RST, which is on GPIO4_D1, as documented on pages 11
    and 16 of the PinePhone Pro schematic

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Small fixes to the PinePhone Pro DTS to fit bindings and
suppress warnings at build.
---
Changes in v3:
- Amended the LCD pinctrl name to match the pin's name in the Datasheet
- Link to v2: https://lore.kernel.org/r/20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com

Changes in v2:
- Added the pinctrl definition for GPIO4_D1/LCD1_RST
- Removed redefinition of the lcd panel ports from rk3399-base.dtsi and
  added only the mipi_out definition
- Squashed multiple patches into one
- Link to v1: https://lore.kernel.org/r/20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 33 +++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04ba4c4565d0a205e2e46d7535c6a3190993621d..909ed14035f783fd14362f4e3a9a3fe3b50d5937 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -463,29 +463,18 @@ &io_domains {
 };
 
 &mipi_dsi {
-	status = "okay";
 	clock-master;
-
-	ports {
-		mipi_out: port@1 {
-			#address-cells = <0>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
+	status = "okay";
 
 	panel@0 {
-		compatible = "hannstar,hsd060bhw4";
+		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
 		reg = <0>;
 		backlight = <&backlight>;
-		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
-		vcc-supply = <&vcc2v8_lcd>;
 		iovcc-supply = <&vcc1v8_lcd>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&lcd1_rst_pin>;
+		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc2v8_lcd>;
 
 		port {
 			mipi_in_panel: endpoint {
@@ -495,6 +484,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pmu_io_domains {
 	pmu1830-supply = <&vcc_1v8>;
 	status = "okay";
@@ -507,6 +502,12 @@ pwrbtn_pin: pwrbtn-pin {
 		};
 	};
 
+	lcd {
+		lcd1_rst_pin: lcd1-rst-pin {
+			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		red_led_pin: red-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>

