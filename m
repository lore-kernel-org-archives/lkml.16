Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1C221F2E
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200739; cv=none; b=GX7Jt0YUJxA7BppfBv9FPXlDQLrvs0xMRw6cIsf6BDVgaLFVCPPBK2AsN6z/KMWfmYmO6DUEU0I7Z6uJEh14Dvad0f/AcFDAbLga/W7OkyJ1K0N78UIf5k2WuP/ydbNCt+30g/i9qkZyqHnldKHGnRR9KajCFG3rXZiJvyQ6DEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200739; c=relaxed/simple;
	bh=++WUmsmG42FBtz0N90d+3dm2z4DuzAvjfBgwxUM5j6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVhvWcgK07RVlpJ0TXwYJasWOfTNg/8db4/U9z6X8CG0OrUz93JcgKorPSSxs6OCSva7272gC5Zf7GD6fYBbFVBsZZzpHyvYqJSxl8iBNiU9Cn/igI9QBWY11hIZS8F02+M6fYLgfqix+0866X2BczKiOOG70VICvxHKc8dzGec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=vKSekn20; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="vKSekn20"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXGz2WRYkb5YR3U/LDov8OvZiUYlL4TD2HwVbGHyw/0=;
	b=vKSekn203hbxm2jhDb074mCRi/0F4J7Q4kHF/Do0SJFrZcxFGDY+aBdSkxRF1NOnQ0p4g4
	bVWtkJUqjVeD1Nro9M9Mb7RP0F68r000Zw3UDjbOo5nRTKNmazMdIBMQ5hMzRXyiLgiN9c
	edUU4f/Anfvwc4316s7xEWcu+RoJvJzvOFNRhEgU4jmk4EpuenEv02PXunqWXcapCzdYjG
	aOaTLE4LbCiHyBKr0xJ/nM9IpkrEPkNszos6NIygVgejmk2iZyrOVqMNNT1BHLLMX9VuM8
	r5sXxohLRUnjZIV9e1+x+apf0tPSZb4u9zlARBEBpQxns5fo5nfZe9rFxBLFJw==
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
Subject: [PATCH v3 05/10] arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
Date: Sun, 29 Jun 2025 14:34:46 +0200
Message-ID: <20250629123840.34948-6-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The only thing actually added here is a single endpoint on edp_out,
which is already defined in rk3399-base.dtsi, so it's simpler to just
reference that phandle, which allows the removal of several properties.

This fixes the following DTB validation warnings:

  graph node has single child node 'endpoint@0',
  #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi | 15 ++++-----------
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts    | 15 ++++-----------
 .../dts/rockchip/rk3399-sapphire-excavator.dts   | 16 ++++------------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index a9ea4b0daa04..9d07353df52c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -250,18 +250,11 @@ &edp {
 	 */
 	assigned-clocks = <&cru PCLK_EDP>;
 	assigned-clock-rates = <24000000>;
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 5473070823cb..5a8551d9ffe4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -404,18 +404,11 @@ &edp {
 	pinctrl-names = "default";
 	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index fdaa8472b7a7..a4ceafe6dd7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -142,21 +142,13 @@ sdio_pwrseq: sdio-pwrseq {
 
 &edp {
 	status = "okay";
+};
 
-	ports {
-		edp_out: port@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			edp_out_panel: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&panel_in_edp>;
-			};
-		};
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
 	};
 };
-
 &i2c1 {
 	i2c-scl-rising-time-ns = <300>;
 	i2c-scl-falling-time-ns = <15>;
-- 
2.50.0

