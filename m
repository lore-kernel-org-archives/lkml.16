Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED4130A54
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 22:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746914483; cv=none; b=qkC1t1Z1pzRLxfFk5XaYplyhs5TcBLDajrxpccnuc9ls3Y0be8ae25cige34lVTXHkXBwbYuRHiX0QOHD5ZbC2NbLP4o5nTfY8i+kauLDugJO7ThjGSVAMsWA4OYc42aIQI5zOM7d+DDTnksyQ+qtVXFXnOU785A7HTfRerd6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746914483; c=relaxed/simple;
	bh=hJo/CjgNE/ExB6fgao/L4wMg39dAJ8inr8ykGOVijcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swjHYVqbCxoDPLBcFEPg2vWx+Ht5lnbjQAPPO9If4GRap0G22EjhgIM1st6/FgkEKM+f6Gtd4UBREvkumHaEkSfFRZzw4hbZRALcawRps3e0bztNjg9igmhopEJLQl4nJj+VOZJr+BjqUhXI3af9imJ8dgCqdh8cgcukyyKesHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=R83QxQId; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="R83QxQId"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KjN1nBhdxQaGDQyrmYVR1VzvPD+o09XYSFx1g7uAoQo=; b=R83QxQIdH8NYNnrP3EEGoBvw2f
	noLkPoo2eSYooZLrPxk4w5mKdQ0z0ZQC8DpHBpKTgMlkR9RrSjajNU6KKhP8u7fsIOffvtNyCUWJU
	QjaZOPSetUm3vUwJJXRAvKGDuJx5A3debRjRr8ni7b9ECglvtbaJUvBnZNr/4fkVLeFsUa9hxxehR
	1Y2VdjhnuhKQJIK6nQpwXoxdxgW1n2C/pM+k8YC0Uv9XZ8NTm3t1OySTYg3Vo+lN0u9KIB1NG0FP/
	QhOIyBByNTnPIjL7KxkzLazejhqUXXKla+0C6OzDML3TXrn4gQ6ok83pqYHXWcvfDfpbTUthXfpw5
	3ITXQ/hQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDsFy-0007Ay-M3; Sun, 11 May 2025 00:01:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
Date: Sun, 11 May 2025 00:01:06 +0200
Message-ID: <20250510220106.2108414-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though they will be the same for all boards, i2c and uart aliases
are supposed to live in the individual board files, to not create
aliases for disabled nodes.

So move the newly added aliases for rk3528 over to the Radxa E20C board,
which is the only rk3528 board right now.

Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3528")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 506d54337ece..9f6ccd9dd1f7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -18,8 +18,10 @@ / {
 
 	aliases {
 		ethernet0 = &gmac1;
+		i2c1 = &i2c1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
+		serial0 = &uart0;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index cd8ef389ccf3..b2724c969a76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -24,22 +24,6 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &i2c6;
-		i2c7 = &i2c7;
-		serial0 = &uart0;
-		serial1 = &uart1;
-		serial2 = &uart2;
-		serial3 = &uart3;
-		serial4 = &uart4;
-		serial5 = &uart5;
-		serial6 = &uart6;
-		serial7 = &uart7;
 	};
 
 	cpus {
-- 
2.47.2

