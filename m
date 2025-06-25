Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F23199E89;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857425; cv=none; b=AjkBgf+OijimIab84X586Tkm981Hhin4ygOsNslpyU/pXhX/J3DneXnQUVqoYigJUi/vD2gtYFVvX7e76voEI5/I6OfrLaAwkAGsKUmQUoWtZy4TvnqHb42SbdiTeVaxZV8XWnb8Q/CbapsD4Fqb94Bgw0lcRBAyG9FULCs4N0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857425; c=relaxed/simple;
	bh=2K6FEdZJxw9ltrH83HiFUwdVQ5PYFVVIBpHrVuk6Ijw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HQfuaGFdWqNkYsSly+P4JIrxOJm7SieoxgWMWVCX3ERMTw5joUmOYz8AuUrUWx4EDWSbJtGv55S8v9lOW1TJPR7KujPljdxXowzniA+P5k8xr7H45hiKgO+8yWy1/EaEcE9vmOLIoUwDobcnDJyM5vlO4TIFonZl62m1E1IfIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6QDsgUO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6QDsgUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E51C4CEEA;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857424;
	bh=2K6FEdZJxw9ltrH83HiFUwdVQ5PYFVVIBpHrVuk6Ijw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6QDsgUOFY5Lh8fajygvvy0FpyEXt/rCNSAkPDbaNN2OL27rcGdP5KiwuTy++1hse
	 U0Avlnmnro61MJlx3ENbtsF3LJFmwEtl1gZR8SL5whhzQnH0+D02BMfaUYeVItPN14
	 dK6KxGyX3Q83M/b0Y4J5g5atQ9IXUeu1OcUXTvyhbH8xvCxLAyv29wxf9eJvej3UJ2
	 HSsmkMErVkM3X7zKUGW4Qdoo7X0cz2ehR85cCt+lf9wGkJ0llyEanZRjKJpGHCwCWn
	 hM26z/L2Sws/PqmpcuMtSHeAMpGDPAm0UvtFbyJU1ufuB9CO6tLCRpcF3X/SnffkpV
	 +DBFWLKUe2Vrw==
Received: by wens.tw (Postfix, from userid 1000)
	id 6BEDF5FF51; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
Date: Wed, 25 Jun 2025 21:16:50 +0800
Message-Id: <20250625131652.1667345-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

Nodes are supposed to be sorted by address, or if no addresses
apply, by node name. The rgmii0 pins are out of order, possibly
due to multiple patches adding pin mux settings conflicting.

Move the rgmii0 pins to the correct location.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 458d7ecedacd..30613a0b1124 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -126,16 +126,6 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
-			rgmii0_pins: rgmii0-pins {
-				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
-				       "PH5", "PH6", "PH7", "PH9", "PH10",
-				       "PH14", "PH15", "PH16", "PH17", "PH18";
-				allwinner,pinmux = <5>;
-				function = "emac0";
-				drive-strength = <40>;
-				bias-disable;
-			};
-
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -163,6 +153,16 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii0_pins: rgmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				allwinner,pinmux = <5>;
+				function = "emac0";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.39.5

