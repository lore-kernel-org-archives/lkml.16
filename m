Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF031AF0C9;
	Tue, 13 May 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148582; cv=none; b=SkWcn5+Cp6TYYh6nJJ4vxYugNbQ5Ex+EPo/Ca2RL9mZq4ARxmUJlKf972aJ6wgAROPXNjPQOGJeYjcrD/Z/BHY4B0bnB3itjuuII6O0wikqKWG9MmEtXrZEzs9pw+ew+ZP/KDfj26xxQgoFQjDbI8fUolyZdbuZSXabogKFgwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148582; c=relaxed/simple;
	bh=m5vCvjfOgtsdOdZeYm5gSkKK2NkNNaRASLMycHBQAyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+AZpCyR1hKEJqQtwkZc4GA1Yc0PfT1/UF/dVwgMl/f94eBHiXMwKauInTJDbgnUxDFtbAE4EOLnv55/oTBNOcSM/k8vJEHOAm4oi2PVebk3AMgJpdoWfH8CbPbc4TMZur9JW+t8sb+ykuKkwkjLSEnVMq+/vche7LSwOFj00LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Z4hI895U; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Z4hI895U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bup6NhA6evSSr2vJWZ/rxyhkcFN8+wVdFF6iyZzNxv0=; b=Z4hI895Uza0VBpF/RhOi6Tt5Mt
	8NC2Se+CimmK3/ALd67hCKhcW1+lcNUtzs3XmWv0WBNhQH0cb2NdT7EW7REi+LgzI0twZuecF7r9J
	ZD95YsCivgVyAmammsEM+xVly38FIOg6oIGMHd++oDvPyFgbZNjy9owaSYRgGRr5MeoTNgriPhCjI
	p5jHqLaTMPe7VAlx2jBbdDZBDRW2FzxCMiONVU4VXryCzg347oVM0niEGjOxSQCwMjoIU5dAraaCl
	p9lcGLc954nRZIWGiraDdQ7bgRuWGwW3B7K1x9B6vxSGEhbWd4oOLFGwZ9f3BaFOLAaijH4XsOySb
	hzduA7DQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEr9b-0008L7-DQ; Tue, 13 May 2025 17:02:47 +0200
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
Subject: [PATCH v2 2/6] arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
Date: Tue, 13 May 2025 17:02:30 +0200
Message-ID: <20250513150234.2331221-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513150234.2331221-1-heiko@sntech.de>
References: <20250513150234.2331221-1-heiko@sntech.de>
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
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
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

