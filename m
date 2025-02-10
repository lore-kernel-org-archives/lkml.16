Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6E25C71C;
	Mon, 10 Feb 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218628; cv=none; b=ht0pxGwgduE2a+yMfvsnynAsc1ajzBPWjjYZ6Oxna/Dw5anCeonoH1WGihKmlJcMmS0tTeI+s0sHOLh71ByISOWai+5BZ15sqgcZOkveKJkgxZhBCGIyEf8Yd9TJ13DZ9X01UhINecHYvNRj4sNwLxRbifrO4IEye4DTOfcKlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218628; c=relaxed/simple;
	bh=vlkVKJonWlpRUktWLGSFKhzFzIh4oI79zssquo91Teo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QSJMdK3gVKXUJHRTfLVqCEFKN6+84fdSvbkoQR4WgaHm3jdgDb/+uqCw8XHo3iDx2CddFO6bnsJjd2eyhMOyA+o/plS8bD3JYNM98tz8vUSPJlCbviyI55u6RLDX5gJnY4hsBdE2pQtyrrzA1dvdNyC9PLRIZRIzloeY7+pYNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=IhlLpxqk; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="IhlLpxqk"
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739218624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dV5w3UHBCGcbAsXZRRMC2zTxiPj8XCL5iTAd+5Q6CJ4=;
	b=IhlLpxqkJJL6dNK5E2+EUEooDerJiXSj4mLQXWRdr0ETtimSMCE4KJG+5yj9mTjaibyXAF
	ZEt0pv07TsKdBhIgJq5dygzn0OiFol+k2u9hmEyGYIYRO7RIcK6k+fgBcJYyhUSG0THH8/
	iQeme1JgJEjtopGYntiKfb6y/SWkc2FkEpSeFm+8i28Oz9iGdyEfnl6Ji622oiuq0Pb7fP
	VZPP7IufmFL9olgINwvyi1pdOZ5woL49uvSwrbP15qu7lajvdexo6K8e4BIIFOOCKTnlC4
	va9EgM1TlIc5j7rl8dPrHqXTkK210GfgVtl6CXBpIULxNAnPZ5c+J+HaJ8pYAg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [PATCH] arm64: dts: rockchip: Reflow Quartz64 Model A/B board dts files a bit
Date: Mon, 10 Feb 2025 21:17:00 +0100
Message-Id: <7eea4ebdb19d5f43d24074a166e6c46bb5424d46.1739218324.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Going over the 80-column width limit, and using all 100 columns, is intended
for improving code readability.  This wasn't the case in a few places in the
Quartz64 Model A/B board dts files, so let's reflow them a bit, to both obey
the 80-column limit and make them a bit more readable.

No intended functional changes are introduced by these changes.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 98e75df8b158..3c127c5c2607 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -265,8 +265,12 @@ map1 {
 };
 
 &gmac1 {
-	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>,
+			  <&cru SCLK_GMAC1_RGMII_SPEED>,
+			  <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>,
+				 <&cru SCLK_GMAC1>,
+				 <&gmac1_clkin>;
 	clock_in_out = "input";
 	phy-supply = <&vcc_3v3>;
 	phy-mode = "rgmii";
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
index 24928a129446..5707321a1144 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
@@ -173,8 +173,12 @@ &cpu3 {
 };
 
 &gmac1 {
-	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>,
+			  <&cru SCLK_GMAC1_RGMII_SPEED>,
+			  <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>,
+				 <&cru SCLK_GMAC1>,
+				 <&gmac1_clkin>;
 	clock_in_out = "input";
 	phy-mode = "rgmii";
 	phy-supply = <&vcc_3v3>;
