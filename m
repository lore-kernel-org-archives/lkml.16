Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE7C1A239E
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303058; cv=none; b=i/NjFxliYTXxrZupjpVgSaewqKCIvvqecGYeoy8oxvQODJ8jX4NQhpZXIvZ2zj3wiq3LkURQF5dgsvz++7sxYqnuAwyAL1mv7sU67/gc+0AaBoNRsXNufdoTd38t4zdwSzGfwdbH5NULGqxk1WX+NKNsEg5ExqSzZXuyL8tHjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303058; c=relaxed/simple;
	bh=wIGJfR/MUXyWlpCnEUI3FU2sAs7Rm818EuqVDIZlTQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv9pRz03tTW4hmT9tcxwUeNdVQkkploegVTMLOzOoSTubfYZtbRw7fUbl+9UV/fCMHAcngcoievgJrUoZ/az9ZershsAwGfQj+2GRn/P23nWtCAFFOt0F0NGCfkQoLAC/GB2b1gGBNVohmbv+Q6o84GONWRT6JgRbtcfFFsEe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kCxoZz0f; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kCxoZz0f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LDpYXGCICL5+HQSjWT4RobWT3s4Oc60cRVoyBpWaBFM=; b=kCxoZz0fqEwilzbKZyujHumvkQ
	VGV+FXcrpqaDCw6oE5mGNuO0PzshjyugEyHb8PzhxbtI8O+P8H/7+1Rh2IaG+OlzSH4aY1cPUnDAo
	64pb/zOh5PJFMwex7GD2LAEo0xvqNNhVEIBjfFMCZCU1UzoI2RYNWHXmEOor2mO/UFTBAeroJXpTV
	XkIDnI2LCU18QTCujDiUsBdbBB2c8x8GXpVoqUIegN4LC526bND7l+IvkNxUtd8uvJDSPFeBlns3S
	K5acBa3SHJSDez9EEtH+lf5zRgTMAJBG9KFJyPvCvyay5zVCxnvuvPX4uvwm0bsUPHifLvS6vqYQA
	lX2nPrcA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJCI-0001e6-3G; Sat, 03 May 2025 22:10:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: rockchip: enable hdmi on rk3066 marsboard
Date: Sat,  3 May 2025 22:10:42 +0200
Message-ID: <20250503201043.990933-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201043.990933-1-heiko@sntech.de>
References: <20250503201043.990933-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The marsboard does have a regular hdmi-a connector and can simply
use the already existing infrastructure (rk3066-hdmi) for display
output.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3066a-marsboard.dts   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
index ada7dbfc06a5..d2924aca6f2d 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
@@ -19,6 +19,17 @@ memory@60000000 {
 		reg = <0x60000000 0x40000000>;
 	};
 
+	hdmi_con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vdd_log: regulator-vdd-log {
 		compatible = "pwm-regulator";
 		pwms = <&pwm3 0 1000>;
@@ -58,6 +69,24 @@ &cpu1 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in_vop1 {
+	status = "disabled";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -216,6 +245,10 @@ &usb_otg {
 	status = "okay";
 };
 
+&vop0 {
+	status = "okay";
+};
+
 &wdt {
 	status = "okay";
 };
-- 
2.47.2

