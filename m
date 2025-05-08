Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F827A11C;
	Thu,  8 May 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717042; cv=none; b=TD+NYtA4dtWe6zn8l9vIecGcI0Px7F2kYKZmEN4uPg3aKTD79bh8U/3NnKN2vARV2JdDt+8LR71r8XOJW4axMjfN3p2CRdrejIXHfj8+YyE/RgmEXkSueMwKLDDBs7jn+yGDHONBNU4+68gu0jerAhFZqzISQSKE5X7nVZbh7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717042; c=relaxed/simple;
	bh=VsZJM4fdgTC4TBsJStz1wEpdUgPObcJD8shMbI2R9Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpJ/1Mlp/LSym3Zq/TkRTC9sqJq+zffgyFJ1mUN0vNazOWWNUsgfKx9wDttmLe9/Ckc6k2GyMZdGAjU/i2LJZ7OACy+sCyRsyIOobzPygPd2LCpsaoUO/I2ikMEmA5cKY5lYUS5/61oHlBWiOQE7xhkUq8rfEdkPnLeIRxO4p+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DPBnjYC9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DPBnjYC9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QxndbpgSNr0cYULeSq6GWDTM3BOUwJ9UwSQ4i+jhzdA=; b=DPBnjYC9VvLA1k1DxrxMKjwsqd
	9XFI13phL5Pigm43MuKdoXV94t46mU7vZ6YvRGdFA9lnczL5Qx448YsXOwd4T4sYQotsLhI9vAA7/
	ew7DqZ9DMMxzU487udci9mPt7YmCR1YBpacaJQqKSXxJkFXk3p5qTjCWSe8v57uUzQuy46u0zOUZu
	dI1HKBQ8TGRaix2ozfBcb88ZEl1SzTVydmLSsw6xatnhns8Dax1n2RDYU01yltbmApM+KK6mV8d+7
	oel5qf7Fzh7p3DUd0Z6VCGGzaQ8V3uYzBoCP/PgPNGj+w85pd0YhZDCWZ7exoBP6zHr5h/m5VdV7x
	1wZZfUaw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tE-0005fP-AW; Thu, 08 May 2025 17:10:24 +0200
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
Subject: [PATCH 1/6] arm64: dts: rockchip: add basic mdio node to px30
Date: Thu,  8 May 2025 17:09:50 +0200
Message-ID: <20250508150955.1897702-2-heiko@sntech.de>
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

Using snps,reset-* properties for handling the phy-reset is deprecated
and instead a real phy node should be defined that then contains the
reset-gpios handling.

To facilitate this, add the core mdio node under the px30's gmac, similar
to how the other Rockchip socs already do this.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..feabdadfa440 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -985,6 +985,12 @@ gmac: ethernet@ff360000 {
 		resets = <&cru SRST_GMAC_A>;
 		reset-names = "stmmaceth";
 		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	sdmmc: mmc@ff370000 {
-- 
2.47.2

