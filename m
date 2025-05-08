Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7528468D;
	Thu,  8 May 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717039; cv=none; b=adK2cDUsPoPYzbuBnpKo1lM8rpExvNwMS/Griicc+cU2RrUtItiWgsLH5U5O2GzaQ89WojI91JqcMRiuwIL69EytwAJt2Io5qzQFerM1fD5yYS3BUaYoYWfvQYV650wNcxHXzNf+7rEd8ZWcCi67WFluW40R637Pq58XgdxQOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717039; c=relaxed/simple;
	bh=4clY6zjdX72t09bsA0j5RCRCA/dSROqNIJ8RImooIgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP9YvCUkRwdp/p43fRnzhZC+k18j+SXehJJOq2ETpvkPuxzsiSHhE4oO0YoYtC2i7ic53M6SC+Ksz79bih4TEdwv/77RupflmLjvJMsFewEZGSRbyrJwOdgKfSo/p+Nbz16jYqtP4BuWhncQtOgEdexK+bYuDfVQnjfTIzbQ8LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=znn8OgGb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="znn8OgGb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=v6Lj3OAwwGDjaJkTxr/XS365aD/k3hFs5qcq4+YYQ/k=; b=znn8OgGbdaC154+C8vhI9MKwYX
	olq81jiDghVLyEbBYFNKGPVT6ChEzuizdstYVMOwQoo6VcS/smYBzzW8v6OBpGahzvAUbLcrFLz0P
	Em2IuekeFfLNTBwR4sws22Sr2ZxWdtynRh6MbFCPCL25APaOs6qrwOaj8QQXTqDMvUAg3Cb3Rq4ig
	gbz5QrImXjcvP3zwmX6tSzM6JguFAgS3ifHnhT8aSqv2Z0Xh04ZgN/jFQ5ZD2vJ3Zf6aRZ1h5gLx5
	fSql2Tpb2lNRcxrIudBP6mw//VKwk1+b266qQNgcEQYfq/BH1icAy3r0DKBzJsy71uKUi5Sjn/4Qj
	7Rywv23A==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tE-0005fP-OE; Thu, 08 May 2025 17:10:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/6] arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
Date: Thu,  8 May 2025 17:09:51 +0200
Message-ID: <20250508150955.1897702-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508150955.1897702-1-heiko@sntech.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Using snps,reset-* properties to handle the ethernet-phy resets is
deprecated and instead a real phy node should be used.

Move the Ringneck phy-reset properties to such a node

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 142244d52706..ab232e5c7ad6 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -83,9 +83,7 @@ &emmc {
 
 /* On-module TI DP83825I PHY but no connector, enable in carrierboard */
 &gmac {
-	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 50000 50000>;
+	phy-handle = <&dp83825>;
 	phy-supply = <&vcc_3v3>;
 	clock_in_out = "output";
 };
@@ -344,6 +342,18 @@ &io_domains {
 	status = "okay";
 };
 
+&mdio {
+	dp83825: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&phy_rst>;
+		reset-assert-us = <50000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &pinctrl {
 	emmc {
 		emmc_reset: emmc-reset {
@@ -351,6 +361,12 @@ emmc_reset: emmc-reset {
 		};
 	};
 
+	ethernet {
+		phy_rst: phy-rst {
+			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pin: module-led-pin {
 			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.2

