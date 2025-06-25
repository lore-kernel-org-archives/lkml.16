Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7C25FA31;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857425; cv=none; b=jPl/YZ3moIzfpj6jkLziXQh2Q1z2rWAWzMIk8AuhC/We/4lrhRsjbnoBOy1BSu+f1EGUrbFOqsD3XnApJ7ph6NwHjECEyB1p4RkBQiFKmA0su3JbT57K3R42CfEc7mITeueAxQoaI82XxPwXiQT4LaxrvCBMWXMBffTVu0XuUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857425; c=relaxed/simple;
	bh=bRr/5nBVNTrO8h20FoPhHm0wRk96HyeoMwIQD4LmilM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8/5NEg5RqpM6NnA8ZgZEjAU8iKP77OdrA1Slm5qgRS5fanrAfYnrff7DbTTr5FBzcKSaSUfG02iEWgKaOh3n94+K+2DGEEUXuEeHXKm6VQqVj8XPhmnKJIv7/NKBWOr5+acPk8airOZZP1832AGwLq9vLUs0zjHeEvI4VNGfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k++/2pzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k++/2pzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81D9C4AF09;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857424;
	bh=bRr/5nBVNTrO8h20FoPhHm0wRk96HyeoMwIQD4LmilM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k++/2pzAGuY4XdUVV8YAqUHG2uxVs4d9ZCHK82L+bB0W50e04qc6lcpiQfnVenQNh
	 yckW3BuZy9cXoG18Db6m5qQAB925pd+zfbEHFuu35UwK3929/pKQBDGmZRRgbWp2zN
	 Wk8Ixx6u1BlyQMqKvSk296ltnMOFho3SIgAdKPge34Rpd+zckdRd7tsWqBcHQip5QA
	 W21UkbwKpOc56N3/4x6EZEMkTnxwP67HjmSk/tXm6xK41WL+q1mRhA95T3nckRZVdS
	 IkA3AlYHb/ujGaWRCYRq4QUT+u2Mj+VQYhCFpSQlX0k61vGKevF6dFtNgmsW1kztFL
	 riqE1hn3lu6iw==
Received: by wens.tw (Postfix, from userid 1000)
	id 5DFE05FF19; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
Date: Wed, 25 Jun 2025 21:16:49 +0800
Message-Id: <20250625131652.1667345-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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

