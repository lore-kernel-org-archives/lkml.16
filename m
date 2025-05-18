Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDE61DC98B;
	Sun, 18 May 2025 22:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605924; cv=none; b=ALd1tzaOY/sngbS+4BKt3/JiG02/+mXwGurNgFCnJcTfWc/SaRt1GIDU961u+JyyOu4TMgEY92m+gpXd7LqGa8L86d+/Kvj9XZW6zP109shNZ7Y/ESAbwq0pxuHeGR7mkg7qVK0bMtfHzD2pHJ3EHS0d9zTTV/UBn1VdH3rWuWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605924; c=relaxed/simple;
	bh=PZyaHlFGGiNPWlVC4YexeYLg+SMdvLrN1on5TuLT14U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IStM2op/UqMXO5ABBGIpEnvEZCfHJcVgSVSezp3a5tgaLFJ+4DDOKVMGOY0giffJP/n55lgTpqmWTEndgNElLx77yiUt89lyp+IdPHA+B8dM4C599CPk0zE4YgyKL2BUm7ji9UUuryYvTeoB2nldWBGbAg9EdPtBQNlpbG7xL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XxIy6clM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XxIy6clM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YbcM1bOFMt6WdPHExqK4799CzGHt6PhTiCIlQuVNo5o=; b=XxIy6clMJgBIwEyNeZA5bMadZY
	HfHalAUEd+mwkWXQsNs7T/Y2nfipGe4tETLYMVWvoBH2J6ggxhO6z7o9/VhjcOcTk8PCIake1OLxV
	efIzEe61rGf+81NSHcDII5ZdEXV1LDR+exWgNBzv95QyRfY3SUpIK3kDZ6SaMQwBNjvF3iciwu2QC
	9ZCBB6Lf+sUN6YASaZqc9yQN9tcEXEWqE5K2BacZ/RdVZS00GRzpo5qEBXWx87QaK1sF9JZBU2CsE
	UKNrx0Xgx2/vPPSRqO9UYZjzgOBLlTNlKp3sTclqDDZ8O4YsjzU5vFPPQvccTKFdC/eJnWMLlp/ID
	UGcD8KPQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7z-0004gv-Cj; Mon, 19 May 2025 00:05:03 +0200
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
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/6] arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
Date: Mon, 19 May 2025 00:04:44 +0200
Message-ID: <20250518220449.2722673-3-heiko@sntech.de>
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

../arch/arm64/boot/dts/rockchip/rk3576.dtsi:2351.20-2417.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property

Move the pinctrl node outside and adapt the indentation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 136 +++++++++++------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 3b62e037772a..0e0a37849874 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -429,6 +429,74 @@ simple-audio-card,cpu {
 		};
 	};
 
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3576-pinctrl";
+		rockchip,grf = <&ioc_grf>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio0: gpio@27320000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x27320000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@2ae10000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae10000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@2ae20000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae20000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@2ae30000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae30000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@2ae40000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0x0 0x2ae40000 0x0 0x200>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 128 32>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	pmu_a53: pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
@@ -2347,74 +2415,6 @@ scmi_shmem: scmi-shmem@4010f000 {
 			compatible = "arm,scmi-shmem";
 			reg = <0x0 0x4010f000 0x0 0x100>;
 		};
-
-		pinctrl: pinctrl {
-			compatible = "rockchip,rk3576-pinctrl";
-			rockchip,grf = <&ioc_grf>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			gpio0: gpio@27320000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x27320000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 0 32>;
-				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio1: gpio@2ae10000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae10000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 32 32>;
-				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio2: gpio@2ae20000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae20000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 64 32>;
-				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio3: gpio@2ae30000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae30000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 96 32>;
-				interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-
-			gpio4: gpio@2ae40000 {
-				compatible = "rockchip,gpio-bank";
-				reg = <0x0 0x2ae40000 0x0 0x200>;
-				clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
-				gpio-controller;
-				gpio-ranges = <&pinctrl 0 128 32>;
-				interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-controller;
-				#gpio-cells = <2>;
-				#interrupt-cells = <2>;
-			};
-		};
 	};
 };
 
-- 
2.47.2

