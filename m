Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50DB1A2872;
	Sat,  3 May 2025 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303334; cv=none; b=tEoII0QyUqleF4LENV/klaOSIDW20xsxFdBEcPUNNK68HFxDsH3pogISD5o9cPHPvxbFcFhx0JBHfGVT9psZn6s666WUxARPU3cD7jky7gomhPyoF691oQfqKKldrjdeYsQn9MH223iZfupNtOFWKKV6UJhuIu+vmsqU061vKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303334; c=relaxed/simple;
	bh=qJxt42KMVDqcPvuyF6/k9RqSqww7OCPwkmX0NES6zj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jso19wneRjgjpekAxuKh9UQoBoGPS1cRkO4PLlmxHhTYQXAmocMjoTXIgYtlFGV9cwBIhJdjOCdCKh93qCb/QLNl3f6+skpQicn0HOXGY2wNVbAphk66TbDvO7wbJJHIs8ugWhpcCSXuazcQDUWSqDzwZniwmVp48jp0uQ+KwuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PGqNdqZk; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PGqNdqZk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dRXQYLMOtnePQ7YbWkM8o16EQIb+GohHo7W9tpPQOkw=; b=PGqNdqZk+Q47r5f2uiWdNxBu3Y
	8mX1lBVhj+rLAD4Qx+tZjVikQgZ3JAUcL7Mf507LvCNeb76bitz5cZSmsUZfCaQWLMwwR/ei3XWsT
	TgDMLmnjYCwAZLSGIQvFMsHfJHFxpPbFz4CZWwX1J0R5b4kOCW0AuwIBizoJk5+GoEST0l1KdS87L
	nLpaluc3csD0QCjNkmbelA0+2Y4wwfFQX6NVq2bcyhv6M2S3+2YN9NwkTaPCeW6W23z84iZ+I0/0c
	DX15PRsYQalgHgGGGsXqG/ehJLYSXccQ8lgLBFiI66ErjL77g9vPMyQte5s0HqaeUkl4B7D78emYf
	D3nhoWXg==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGi-0001hY-EI; Sat, 03 May 2025 22:15:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin
Date: Sat,  3 May 2025 22:15:12 +0200
Message-ID: <20250503201512.991277-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rk3036 does contain a usb2phy, just until now it was just used
implicitly without additional configuration. As we now have the bits
in place for it getting actually controlled, add the necessary phy-node
to the GRF simple-mfd.

Enable the phy-ports in the same patch to not create bisectability
issues, as hooking up the phys to the usb controllers would create
probe deferrals until a board enables them. Doing everything in one
patch, solves that issue.

Only rk3036-kylin actually enabled the usb controllers, so is the only
board affected.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 12 +++++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi      | 35 +++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
index 4f928c7898e9..51a74f79c935 100644
--- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
@@ -382,6 +382,18 @@ &usb_otg {
 	status = "okay";
 };
 
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index f4292b586bc2..fca21ebb224b 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -213,6 +213,8 @@ usb_otg: usb@10180000 {
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
+		phys = <&usb2phy_otg>;
+		phy-names = "usb2-phy";
 		status = "disabled";
 	};
 
@@ -224,6 +226,8 @@ usb_host: usb@101c0000 {
 		clocks = <&cru HCLK_OTG1>;
 		clock-names = "otg";
 		dr_mode = "host";
+		phys = <&usb2phy_host>;
+		phy-names = "usb2-phy";
 		status = "disabled";
 	};
 
@@ -342,6 +346,37 @@ cru: clock-controller@20000000 {
 	grf: syscon@20008000 {
 		compatible = "rockchip,rk3036-grf", "syscon", "simple-mfd";
 		reg = <0x20008000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		usb2phy: usb2phy@17c {
+			compatible = "rockchip,rk3036-usb2phy";
+			reg = <0x017c 0x20>;
+			clocks = <&cru SCLK_OTGPHY0>;
+			clock-names = "phyclk";
+			clock-output-names = "usb480m_phy";
+			assigned-clocks = <&cru SCLK_USB480M>;
+			assigned-clock-parents = <&usb2phy>;
+			#clock-cells = <0>;
+			status = "disabled";
+
+			usb2phy_host: host-port {
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usb2phy_otg: otg-port {
+				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 
 		power: power-controller {
 			compatible = "rockchip,rk3036-power-controller";
-- 
2.47.2

