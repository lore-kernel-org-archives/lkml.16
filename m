Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA71F4E31;
	Fri, 31 Jan 2025 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357736; cv=none; b=on94ZoOp9ERTTpATK3a49S/vdGoC9cScd5DvOar319RYrUNl0IZWuc9KFtGL0NUmVCq8zFAZtGU/4zhHrXtRNrSUaUNqHKJh6uXMoEIOucTpLlBdrLcZq6vDzENcJhh4Zg6Ir8dsVGrkjkmF6H2VQUmOXpzg2phBVCUw6BgI6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357736; c=relaxed/simple;
	bh=y1XRJOOEojK7aHlX06znA6wDgkwys+QMiT/chEEavzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBXGOoWQJkQyTALho/xEvmv1Y6oNFvu5uPIXaxoCTx/mg1sT55wiHxVWZtDctyV2A5/Jx16/JE9e2NQaI7ddh1ToXj6+XPgpnuqU9SwtkNyR0Lp5hjmbuz7gjmu6MI5tYRFzxWqFeiyI8b5PqvftdwBHgF/6JFnluVDxGsSAHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VclobnRr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VclobnRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3831C4CED1;
	Fri, 31 Jan 2025 21:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357736;
	bh=y1XRJOOEojK7aHlX06znA6wDgkwys+QMiT/chEEavzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VclobnRrgpKlObwrwzhaDtJM0gusceIxnEajayKElBUfWzXjo6x6cEwD1msRJMwXC
	 EY8YQmF/6eR2kiOJL11RWyTT7L1A7o/lTaIHC+x+YCoK71rWVAce2+V/8wiwm/x9Sj
	 uVFG4q26hEyh4wKXfql3X+Mq8RPEDPdZdDLD86WZgujaHYhUQckpExiDM7jO6+WiEw
	 rtngVPnUmGp9FffKJFv6QobySq2qNtVgxUjInfKxKW73KkE49it/ZOtX+8GjOy2JWI
	 PT+t+/TNczBLyBeCP4gbgeu0ukgqrXebt05T6BcyAHNwYXRcY9AcNqvlYHU1n3Rq5F
	 BL9RugIBtW8ng==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:29 -0600
Subject: [PATCH 5/6] arm64: dts: marvell: Fix missing/incorrect
 "marvell,armada3710" compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-5-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

"marvell,armada3700" is not a documented compatible value. According to
the schema, "marvell,armada3720" SoCs should have a "marvell,armada3710"
fallback compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-db.dts                  | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts    | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts   | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts      | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts         | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts           | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
index 0cfb38492021..bd4e61d5448e 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -18,7 +18,7 @@
 
 / {
 	model = "Marvell Armada 3720 Development Board DB-88F3720-DDR3";
-	compatible = "marvell,armada-3720-db", "marvell,armada3720", "marvell,armada3700";
+	compatible = "marvell,armada-3720-db", "marvell,armada3720", "marvell,armada3710";
 
 	chosen {
 		stdout-path = "serial0:115200n8";
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
index 6715a19c1483..5c4d8f379704 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
@@ -18,7 +18,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board (eMMC)";
 	compatible = "globalscale,espressobin-emmc", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 };
 
 &sdhci0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
index b3cc2b7b5d19..97a180c8dcd9 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
@@ -13,7 +13,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Ultra Board";
 	compatible = "globalscale,espressobin-ultra", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is WAN port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
index 2a8aa3901a9f..75401eab4d42 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
@@ -19,7 +19,7 @@ / {
 	model = "Globalscale Marvell ESPRESSOBin Board V7 (eMMC)";
 	compatible = "globalscale,espressobin-v7-emmc", "globalscale,espressobin-v7",
 		     "globalscale,espressobin", "marvell,armada3720",
-		     "marvell,armada3700";
+		     "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is wan port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
index b03af87611a9..48a7f50fb427 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
@@ -18,7 +18,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board V7";
 	compatible = "globalscale,espressobin-v7", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is wan port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
index c5a834b33b77..1542d836c090 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
@@ -16,5 +16,5 @@
 
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board";
-	compatible = "globalscale,espressobin", "marvell,armada3720", "marvell,armada3700";
+	compatible = "globalscale,espressobin", "marvell,armada3720", "marvell,armada3710";
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..9f4bafeddd82 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -7,7 +7,7 @@
 
 / {
 	model = "GL.iNet GL-MV1000";
-	compatible = "glinet,gl-mv1000", "marvell,armada3720";
+	compatible = "glinet,gl-mv1000", "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		led-boot = &led_power;
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index 54453b0a91f9..f4d73c8b1a6d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -14,7 +14,7 @@
 / {
 	model = "CZ.NIC Turris Mox Board";
 	compatible = "cznic,turris-mox", "marvell,armada3720",
-		     "marvell,armada3700";
+		     "marvell,armada3710";
 
 	aliases {
 		spi0 = &spi0;

-- 
2.47.2

