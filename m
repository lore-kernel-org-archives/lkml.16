Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1B2BAF9;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127372; cv=none; b=NcNmZxsIu8YMYzXWJrBlh32s5EexQRvILfnrx3IImmWELVb5o5DDg9lrI8Ytx6Ar7MNQc3OgwWS5y8YpWHaFr3B2NHJ4DLGX+B9uzKR4r+1Fuq+68WqtG5DtpYBv4B5CEa7qZH7Ba9Nxb/fEzIoOeqeSn/0xEy8voQFb947HIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127372; c=relaxed/simple;
	bh=TsjHd3vjaRE+OZ1WrugGGMN70hthcmgsyxPq1MteFRw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEhKcDxTAWVEhRUUCfQ7P9kv4FQrej176vgXWuLbw2mR/huQUPMUL55aoyVjXvUgGNo/dw5tf4i3Xh50LwlfCg0A5ZzqHj4g5zk3LriF/h282Q1kHtUV4PL2jPrTtixRrC+jyW7tJ5F2+BCemg9XO5cj898ww6RgaOP1A5vdMZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nc5hGm5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nc5hGm5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED521C4CEED;
	Sat, 28 Jun 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=TsjHd3vjaRE+OZ1WrugGGMN70hthcmgsyxPq1MteFRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nc5hGm5GBbtw3D3dPqsb/52Ew0xXsKR7Zy5Q8mVaA5PavGyFyqy1Lq+P0pBGNRs2q
	 c3cGhPOlTgUwc+YN9mn9GBm9KaqsN1tPFPGdySqtuckkxuCFEMeg3/OmE3+/Kft+BP
	 a+R50YQrlJP6lYxP5wbnm+YXEr+WUiHSqCs9GU8TC6x4N1M9tb7Je/gGwLOD3vOxGA
	 NbcCa2b29qEBiCL5yVkQEb6alI1rUa/+eFyxT8ZfgfjFZ8r/QAADXSx/TkJDRt93mA
	 60gwtW1BlVRPL+Hh/q3ypK2TfYFUYciRICDlDRSdixI69iHZ3NXbx5W+5wTTk3JgKs
	 0mSzlTlfP2Zsg==
Received: by wens.tw (Postfix, from userid 1000)
	id 57A9B5FD53; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
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
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
Date: Sun, 29 Jun 2025 00:16:06 +0800
Message-Id: <20250628161608.3072968-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
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
index 490f596cad6c..4839411e51cf 100644
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
-				function = "gmac0";
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
+				function = "gmac0";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.39.5

