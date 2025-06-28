Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B563A1B6;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127372; cv=none; b=uS+zyPa3U1iRo1oTLIlt5knbjttOPsy4JUwQcYYNPAoGPvT/+sOIPbAId/PRMonUP3RcIgZXgPExKu9j9fxW3pm3ChIFQTkdWMpXw0TyVDYHlFlxzKDdO1qqD3tceYafDHA3rQRW5n9S3csZiGtI/9au2aEfrMRw42pNNe0X0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127372; c=relaxed/simple;
	bh=jrBPbSLIcJ68lougjjnj8b0BgzaQ21Z0SDkMwk7s0Io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cd+mnZTkNfAExk21H24ei1JoPv6A2UHXZA+yOsAFNSzP67QJTn3LNySjxniBP7tQXbUnJ/kz5TKYl5jjCKLCpboOiQWW4MrVpNX8N50vOywHNgBg1VCBCuwhicSbCpOITNktK6kWZciRN+kBtCQ1ksQ6okap5nlMlqaM5hAlicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8a0Xc1u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8a0Xc1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA110C4CEEA;
	Sat, 28 Jun 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=jrBPbSLIcJ68lougjjnj8b0BgzaQ21Z0SDkMwk7s0Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8a0Xc1uHZkCDdxI7EOvYTcnUNpVv8fycGtNwRoe07Qh1i64dMZfab1EfBuqHRCeC
	 mOTaGzHJAvXcUObGpl+s2/hOHNwQ65Gbl9fMVV6KDaYo0x1WEU5txYGutUqeVJMchg
	 qSS4SjoDHYgPZFrUC/9BhE69hMX8gbM9Pj04npGYF1fVXGookhllk1ojNOcjc81ldU
	 4YWK3TWvwGPql8OeCYFUbJUBebPqLkM8uaDD3Jj138n1IKlgj/QNSty7+gxsql7m6X
	 QEIl7Cr0IwwQmF2kC3M8P1YoBKPM2Vo4WEjl08us0yyzPd6fpPQrwVtK2lmfWTCKKC
	 upzGsEFvZq9lw==
Received: by wens.tw (Postfix, from userid 1000)
	id 3BB755FA91; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
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
Subject: [PATCH v3 2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
Date: Sun, 29 Jun 2025 00:16:05 +0800
Message-Id: <20250628161608.3072968-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
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
index 51cd148f4227..490f596cad6c 100644
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

