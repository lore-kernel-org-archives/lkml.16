Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B53262815
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822263; cv=none; b=XB1NQH/vY2e+lGPDKC5ilX5kGdQnezesmmuaDcLEB23CG/bVAo4wIUBVKcfRRSeZ2OnS71ddzjkOO8C5CcDYIUPPDIg1B/HP33aUJBKW2BZGyR/F330QpvcaIlCpbe48YF4TyEvij/m7Uuh4vyHZMBF6Gv9tjzC5vMVGTB0+rFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822263; c=relaxed/simple;
	bh=sLj//1AcXpvIwBqzWW3CI6S+W+1lUK/SIwxIUMmLcqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ba+zrciI6urCW/ik6ncspk8fCO2lpTS6TNYSlFY+OHFKVgh15F2mIxkSX7icBLuHN0c3fwGg7gPKC5Qobmf04D4jBDYuzr+1YJ+m1/eM/d9hr1duCRZUqWtfVgTkgfVzA230fxftxGmT21MQf/u4vvCp4kLBN5WtPLKAaMpSea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=EcZgoLEn; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="EcZgoLEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1746822260; bh=ehstcimJR9z+3Rt/ETv7WL7WqYg2RyHiNK4ycKLwqgc=;
 b=EcZgoLEnz7ewv6ZRBdjX+KGGQuc/XP86n3R48eMgXo3sk8HIJTPUUBeBDW1VVMXzcfpFAZpNd
 GwuSLWAbt2QnpEjkgDlUdjNJ5DFQsXlR0I9PUVN+pAbJoDN7jVCmbgSU8rOOLINCnSqwb0uhs9E
 gdsuhMCICRiQ/UohvqrkdGuImbhsPWqXt0W2wu00KtWEjugIpCAuelod7sbQlMENUwi7y3R9pmB
 XfKZMT2nu4s+0lFmJ32lhehrEKJvMmb6fBjNlaCcGhKZuGdSetDUaX9ahgFozmWDMSJ7SV+Ji+s
 qUAR3Pk8fGquT6CHNX4vx9/Rd5Vw7G1PFFqIvfYIvoRQ==
X-Forward-Email-ID: 681e6470b323f1ffafd05da1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri,  9 May 2025 20:23:58 +0000
Message-ID: <20250509202402.260038-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa E20C has two GbE ports, LAN and WAN. The LAN port is provided
using a GMAC controller and a YT8531C PHY and the WAN port is provided
by an RTL8111H PCIe Ethernet controller.

Enable support for the LAN port on Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Rebase on top of latest mmind/for-next

Changes in v2:
- Rebase on top of the "Support I2C controllers in RK3528" series [1]

[1] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index d45b6594b2de..506d54337ece 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "radxa,e20c", "rockchip,rk3528";
 
 	aliases {
+		ethernet0 = &gmac1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -184,6 +185,17 @@ &cpu3 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
@@ -198,7 +210,25 @@ eeprom@50 {
 	};
 };
 
+&mdio1 {
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac1_rstn_l>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &pinctrl {
+	ethernet {
+		gmac1_rstn_l: gmac1-rstn-l {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-keys {
 		user_key: user-key {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.49.0

