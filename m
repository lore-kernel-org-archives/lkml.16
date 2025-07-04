Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857712E36E1;
	Fri,  4 Jul 2025 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650334; cv=none; b=MOOzpfni4BttLRxqmvbi7eYcIIa4yqloGiiv4s1IIL5b6RbrCogfEfT2JZWGzkZDtWXMqP3FkrYIZcNERr/+PylQebvzPGS2/iOG2GNgxPhcY98wiIYBv9M63AbeuI0Pn9SKyR3rSmrTtxveWp1XSMDyy32o2m0OW6Jubc9Sglw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650334; c=relaxed/simple;
	bh=3HlCyLBTGav/NM6Og4Z9SyTGsQu3ubUJXpozkmfc/48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T7TCc3UgmHTe5/Xtp8nLU3dGQ0jvNmomW1+LO4nJeyljPORzXVb5+NY8aUoajmCfksj6mAl9G9PRisEVS+YSZzczOqCnf2jlYiQG9Usxe8RDJAx6QDUrbz7RtwknN76c1pntVZ6AFZ4Fj0qWW+I1SyfHnpnxp7AcVqsKVQJWLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PEO/zFVr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PEO/zFVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751650330;
	bh=3HlCyLBTGav/NM6Og4Z9SyTGsQu3ubUJXpozkmfc/48=;
	h=From:Date:Subject:To:Cc:From;
	b=PEO/zFVrWAoxzRBs6psKovdtDRzsj0OarIT4c5FtOegZtrxhLJX5dT0lMTMdhdzyG
	 3zSZVzniSjvxjWtEHiRiXyaWABfc/3nADclJ0TYGrMNaL+/JafKc/RquBmXKB1jncF
	 x2u6PgS+DrycaGzwn4F61LBT53pftytOVFIdpzeO7XMpkU3OZCz1ZQ7ax8UsLn8h53
	 xZ7WLnfX5WKb5Tw2Wgk5FL0a28DOzg1OIw6f1ohuzdg5E6Zg4B2f9S4ph3BGMmGOB6
	 0Egf8bQKNNiWexkZmcnRO7B/IOIJ9TYGaNzbIeDQDiVUhHsLcPp46JnqHyRfc2/qmP
	 eTWZ9ErkeAkAA==
Received: from jupiter.universe (dyndsl-091-248-191-229.ewe-ip-backbone.de [91.248.191.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8938E17E0497;
	Fri,  4 Jul 2025 19:32:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1F988480039; Fri, 04 Jul 2025 19:32:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 04 Jul 2025 19:31:59 +0200
Subject: [PATCH] arm64: dts: rockchip: fix PHY handling for ROCK 4D
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org>
X-B4-Tracking: v=1; b=H4sIAA4QaGgC/x2M0QqDMAwAf0XyvECm7Sr7lbEHaaMGpUoK4ij+u
 2GPxx1XobAKF3g3FZQPKbJlg+ejgTgPeWKUZAwttZ4COdSl8+GFusXFJdznH1qWVskTjnJyQfJ
 uiGFMfXQEttmV/8Iun+913UFlhJ9yAAAA
X-Change-ID: 20250704-rk3576-rock4d-phy-handling-fixes-054ac7fd8c40
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387; i=sre@kernel.org;
 h=from:subject:message-id; bh=3HlCyLBTGav/NM6Og4Z9SyTGsQu3ubUJXpozkmfc/48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGhoEBoTtZ9ECP5S4iU9jzszYGAsDJTKx5UY/
 gpOQl0cD67gjIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoaBAaAAoJENju1/PI
 O/qahLAP/RK1HzGMX9QG9jBQOmeS4LVWCxoMBCCNqX4keR9zSW28xkuujCndnypBIqe8ROJ1vLH
 /IA07FMKqQGsBevdMvltvxBkN37SzdfKo1r5apIvCvoZoyFr2RRm1yghAlXp13DqoLwGQG3KTec
 lRIiXmildR10R7fyDWWgXumasD756UekyM68V5jlgOOnL0vu3bmN+jYWNLrUIcq2RRF6anyITrP
 HTjtqP18pgslFmd6ZAddzH51YRUksK8kAIWhEbVGFgcGE0K97oPLyVZdF72nNVQ4nDPixtw2eDS
 on/kqXYdB8ZByto7LUb1J241dc44SriGL63PTlqAI+STNRzOB2pl6EjDhyGQ3nRyL+vPz0lQS4p
 Gpy4uIhSMTmaHn6oYzvYbqhbnXz+o5afkdXN3bTLfhGL2Gyxdn2WHChKzlBFxGhRCaaCEXSQ2+Z
 bE0c+F9wCu7ZccYCnbSHz+t/xuObCOumn9M4crnhqTHxx9VXpGTu2UIRGscX1CS4Lj33Pv//W3A
 2JS1j5VMKp1qkSunPWz1zuUNXPW33nQDMx2hQrqyliDKPA1Bz8vD5hqO3Pl8qxE0QMp2FaqIx6s
 SmkkBawGqw5vr1NmTPFiCe0OfMxjUdhzP5R/kLpU0Zgbp4iDxVecOUKuwctFoOFpBqbhrBhFqcM
 2pxLQQtpxCJ4M/NpLCjsjVw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Old revisions of the ROCK 4D board have a dedicated crystal to
supply the RTL8211F PHY's 25MHz clock input. At least some newer
revisions instead use REFCLKO25M_GMAC0_OUT. The DT already has
this half-prepared, but there are some issues:

1. The DT relies on auto-selecting the right PHY driver, which
   requires that it works good enough to read the ID registers.
   This does not work without the clock, which is handled by
   the PHY driver. By updating the compatible to contain the
   RTL8211F IDs, so that the operating system can choose the
   right PHY driver without relying on a pre-powered PHY.

2. Despite the name REFCLKO25M_GMAC0_OUT could also provide a
   different frequency, so ensure it is explicitly set to 25
   MHz as expected by the PHY.

3. While at it switch from deprecated "enable-gpio" to standard
   "enable-gpios".

Fixes: a0fb7eca9c09 ("arm64: dts: rockchip: Add Radxa ROCK 4D device tree")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Note, that there is one additional problem, that the PHY driver
needs to assert the reset line after enabling the clock. I will
send out a separate patch for this problem.
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 0388d72076bf79ee4f20ac1d3bc04fe1859f857b..02839bb489ec67536678bb6464b04f1658dda53f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -645,14 +645,16 @@ hym8563: rtc@51 {
 
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clock-rates = <25000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rtl8211f_rst>;
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
-		reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 	};
 };
 

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250704-rk3576-rock4d-phy-handling-fixes-054ac7fd8c40

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>

