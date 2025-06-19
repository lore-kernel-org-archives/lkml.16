Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057923C8D3;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354215; cv=none; b=XdVjuHRBti9EcfXsEDsNG5CodjRQMBSthWD5bb63H54guM8kKwQudG34HwijRnDI6yh/1p6tMcJvgkliYZGmDGj/Upo+L1vELm2isLwkafz7fUJuaJUly9AcP+FAKV5w5qNogmdP6zqvHh70eFjuaBVoYAi9cI0O+JG6dVA7+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354215; c=relaxed/simple;
	bh=wCB6x+x+rj6RDpHRZY4HD76LxIfQ6M7f4ACdL/qmmIg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S9orCDDm/HtGWMgkxPbVbUCQeA54aPn6ndfUrysc0WaTA+ZGW2r7OcfcEkHBpOa+cV2kbxlW/pFhD0HGqnEcb+F+5ywcr12Y9yffZo11d4ISb8cd2pasK6GDcpafGAC7htbmu+lJHK5UStFqB7sFqMoBr4nwqK23L2WThR2XagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbGvVzdH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbGvVzdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661DDC4CEF2;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=wCB6x+x+rj6RDpHRZY4HD76LxIfQ6M7f4ACdL/qmmIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbGvVzdHbUtWcUe5zogrNMWHrikLfYW7CiqIm9magQRZamU51Bz3bIPrs08YON8eY
	 MsAoHl/0ZxMBtYfxmP6gpDhQOGriw/kmXXA70phtpov5VunsRmNKxK4LpDzO9J2KUs
	 muXcN51nqvp3hfBVBnrahfk9Gno1ozMskt+/8FJJ4jA0KU9FJFIWA01jg2PbsHs2Wh
	 V/39gC/0Kv1CkQi7eqNEp9DzlEj4Gv+wDi3nvH9DXvJbZMK24FRalFsKC+9lm0myg0
	 NUKXryWBH3zpxt1b8vE1r7Gc9VOjGliFOeYVzmI2oosATVZhuPMWY7aYCoTHzIxCut
	 dFUoH07Ie8DmQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 23E095FF4F; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
Date: Fri, 20 Jun 2025 01:30:04 +0800
Message-Id: <20250619173007.3367034-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

When the mmc nodes were added to the dtsi file, they were inserted in
the incorrect position.

Move them to the correct place.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8b7cbc2e78f5..458d7ecedacd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -181,69 +181,6 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
-		mmc0: mmc@4020000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04020000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC0>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc0_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		mmc1: mmc@4021000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04021000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC1>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc1_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		mmc2: mmc@4022000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04022000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC2>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc2_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
@@ -449,6 +386,69 @@ its: msi-controller@3440000 {
 			};
 		};
 
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04020000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04021000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc2: mmc@4022000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04022000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc2_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun55i-a523-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.5

