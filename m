Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7428C014;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354215; cv=none; b=j3DhF5xq6vgK27tvCqHS3GKushR+9fvefycM0IhXc3WtNNJTUJs2Hp1ijbWuTCZAQp7aSWANwXDXcM8V4H9ZqTBSHosOJDpAYngAr79+MFXgNcHpV1bNfDfU5Lnq2i6rOdWOERxyNqONG8XP4rhRFmY+2SPlrF6MeU08ZvM/Bx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354215; c=relaxed/simple;
	bh=aIr3qu6ile1nHg+g5aa59zKENPrBn3sv1ZGDJSdnhpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rn7mkKo++RnQoM/SUioVLkSgttEuZFBAtCC9ujq8CxoumOywevVZNYZxBQ4UW2/wCOKCROIkiGlWMGjbSGBdx5q8lUvC/Vybmbp+F4UhMb1jY8CMYVHsW/xXaXzNqRQi+KKlzqRubgEn6xZixWW3RRMkh5qIbCxlabK7/LxaQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnErTiIJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnErTiIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C5EC4CEED;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=aIr3qu6ile1nHg+g5aa59zKENPrBn3sv1ZGDJSdnhpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pnErTiIJQWLhrFkDH2xNIzoO7E9+xdWsnIw4zWbewhlj0MRFDiCcgP9c6B4F4Mt+R
	 N8+9L2m0yAb5mulJl37xOEI7jDJCz4pdhfq7LNCORJGeGzn8uFiO7it0RgA8G6ipLp
	 nt+v339QxXTJyhO8iO2ntQv9teuonONx0EIxmOrYfP69tzeIls5ZocT8bK5oKg7G3w
	 PjrH5IXxo+1lftGEYYWNL3UeoSzsLeRKOVjR8i1xSWBPnUN3PW8cRf5m/kghMAG4Vq
	 7gi2etfoBbx0e52alSkD51C4pfr2FpzyoSXHiJHR6G80+XuTHqXtL2h27In0KU/iIu
	 gbwAf/13nFgyA==
Received: by wens.tw (Postfix, from userid 1000)
	id 2C81E5FF77; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
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
Subject: [PATCH 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
Date: Fri, 20 Jun 2025 01:30:05 +0800
Message-Id: <20250619173007.3367034-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
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

