Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453B2EAB70
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038057; cv=none; b=YGEBBzxZa8lCDjo8o8Wfdx0p8Mi9o/3Y+Uu4L1ARl3Vybgb/D8eFUGkgINPkG+gyURrUoq//dEJLOWZU0aXzR+LUWWg8BE1M07nGzgEADgcKvbAC8gFHl+hGEXeFQYGflzTN1Q9qVsZyld2O/VEjyKV1n+ODQZ4leOtDjP7BkOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038057; c=relaxed/simple;
	bh=05pqTowLjnDViJGWxYMkBBcnQyspvNYYdaCb6Q7B7G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRMS21dpM3hAyD0VflUyujjtMdEpVtWWvfSXAZYbKU5MEjZE0xz+hsMttLraf0+SCsV7DRPSAUuVv4/BzZQGPZ+RlnMfRoE753DVAS46zIU+FV0zf6PaI6Hfw9uuiUDHVCuhTvE6GKXK4Asc0u0CcZ7/p820wBCRQhUN0zrjxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=H0f14+DY; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="H0f14+DY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMKQA2Hff0W4zw/ZMVDybuR5/9kD8JNjNzdYjPOLJ3Y=;
	b=H0f14+DYd+SwlsGBPOL62TErrrtwA0SHuFNG59lnsFRuD/aZKiVcPh+0CbYd+5NgOKcM0/
	mdndG4UFcbpf/TeZ/EkP5om5g7hIj4cTkIYjfV2IQl6c9K1mC96tgtrpQMbHcQe/hePBSP
	jxxd80MQKPUvZZ5fIxWK3nA9hKPrMxQAAjDsjR3AR5vK/agW0fihZDdh8dkhAakx4k4vf1
	d3olMJk9TKM6CbRVsiEtqPkKI9QX+LyxDwWMgeuY/p6PtTcmYXSKFhG5meCUDrsPWMuxVx
	n1pODpYSvgEkgqNQthqihA/loB90k0U1o7xhSTFl2XHYkCnbLqAF6y9CEORbNQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 8/8] arm64: dts: rockchip: Drop regulator-compatible property on rk3399
Date: Fri, 27 Jun 2025 17:16:27 +0200
Message-ID: <20250627152645.740981-9-didi.debian@cknow.org>
In-Reply-To: <20250627152645.740981-1-didi.debian@cknow.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The regulator-compatible property has never existed in the
regulator/fcs,fan53555.yaml binding, so drop it.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts   | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 81c4fcb30f39..352c8efb37e0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -211,7 +211,6 @@ &i2c0 {
 	vdd_cpu_b: syr827@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_pin>;
 		regulator-name = "vdd_cpu_b";
 		regulator-min-microvolt = <712500>;
@@ -229,7 +228,6 @@ regulator-state-mem {
 	vdd_gpu: syr828@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_pin>;
 		regulator-name = "vdd_gpu";
 		regulator-min-microvolt = <712500>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index 15da5c80d25d..962b8b231c96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -421,7 +421,6 @@ vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_gpio>;
 		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_cpu_b";
@@ -440,7 +439,6 @@ vdd_gpu: regulator@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_gpio>;
 		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_gpu";
-- 
2.50.0

