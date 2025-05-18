Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578037DA6A;
	Sun, 18 May 2025 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605922; cv=none; b=WZy+GlOkPPrL1ZuCYUVy5G4AhifafI2e/3Ngwu8tA5mCS1Hfp88Zhg4JY+dZkAy7qgmqKyi16MfH5s/ILta0w0R8RyT8hAsxJkfGiit1FJ/kirPxa81ELdIPQNR3W9kWlpjyA47yzmN6YqO8cEGlH3j7QeeQL3gQvzYjs8+DZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605922; c=relaxed/simple;
	bh=NU40cp6KiJ+yXld4sOYhC3plOaqExos+8xMFH+GRwVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5GwwJn2+hJCT/h5caCumV0Blkmnk66DgISL05j8e0WgigSc5qCTwnUy5YUtPsuhQSHvfweLloe8fEuNHlbtgoSsyYJa7nsNvHQMLxPByGtZcp6l3ZVwljCZl7rVPvuHHfmb3NWgUZuynX+UCtGA/BUotxyfoLgh6eIvCk4Wx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AaF+5M+U; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AaF+5M+U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3vhXblRFFwM/P/okDicuxONQXGTlkPhFwvYUgdAVGKI=; b=AaF+5M+UvBJEspTTK4LVn+ALh8
	1tcASx13Vmu96SIhGVcZoqQwS68qSQPmMXWw+DQCIb1gvy9MBuot+KgEdqmLiQ/2JWxUuMEVhSCgW
	RCrWq6IYtvVYaSxB/Uo9+CQiuY1CahOj+KBDGiS45wDrHvDGX4GoGbnRRZfY48eOIXWB9fGh/rgf0
	d72g2mrulIATZXkK89mFQ5qWQY+O8e8kPWKqviIbrCeWT8wjIRw37pkSnW4kveR633QUkk5EVNjbY
	AsZ7L5eoYjXTpiPdA1VxT+0M53HSZEkr6Cw8SUEHbSS87Ol3UMX42n3yyDJwxdEnntVftpCoJHnvW
	aq5ibW2Q==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm80-0004gv-Bq; Mon, 19 May 2025 00:05:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
Date: Mon, 19 May 2025 00:04:46 +0200
Message-ID: <20250518220449.2722673-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-mmio pinctrl node is not supposed to be inside the soc simple-bus
as dtc points out:

../arch/arm64/boot/dts/rockchip/rk3528.dtsi:870.20-936.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property

Move the pinctrl node outside and adapt the indentation.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 136 +++++++++++------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b2724c969a76..d1c72b52aa4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -95,6 +95,74 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3528-pinctrl";
+		rockchip,grf = <&ioc_grf>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio0: gpio@ff610000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xff610000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@ffaf0000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffaf0000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@ffb00000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb00000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@ffb10000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb10000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@ffb20000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0xffb20000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -866,74 +934,6 @@ dmac: dma-controller@ffd60000 {
 			#dma-cells = <1>;
 			arm,pl330-periph-burst;
 		};
-
-		pinctrl: pinctrl {
-			compatible = "rockchip,rk3528-pinctrl";
-			rockchip,grf = <&ioc_grf>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			gpio0: gpio@ff610000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xff610000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
-				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 0 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio1: gpio@ffaf0000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffaf0000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
-				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 32 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio2: gpio@ffb00000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb00000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
-				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 64 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio3: gpio@ffb10000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb10000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
-				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 96 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio4: gpio@ffb20000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0xffb20000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
-				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				gpio-ranges = <&pinctrl 0 128 32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-		};
 	};
 };
 
-- 
2.47.2

