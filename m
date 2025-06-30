Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB528FFFB;
	Mon, 30 Jun 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297829; cv=pass; b=KvFLxSskyS6W2kWnY+JK54Tea8lAO9E3955zQKHO2Ewe0l/PHUZWtkv68Fpd1DfJRf2erVEafSR0sMfLVbmsi2hQ2BMnhoZwqsEw59Fm+2uyiVnJGZZ2+bo/MwS45SGPZhfSSYRmGhQa3KBXCEdrMKAGJ+wVpXusw/HA8j8IrNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297829; c=relaxed/simple;
	bh=YU/Z+9agLAWqFJU3lpZ2vtyfL8pPcqzPSLXgf5oizrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqqNQzkuOcRhdx2NlNNhwpHxGvWmOQSuVRtZqWG34xmYgcxz5ftyuCZ4grZBtLJSeyBR+9hXkHZLT9flsOFmD8ZHw2rS5eL50UxpXc/ZVbIZaX00E2x0qO0DL+/zNzMaAW+qhnqjABV4yS7Km+GHdOxIW6pi/rFJ0S4fMkHjLac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=KqJ9LBf3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KqJ9LBf3"
ARC-Seal: i=1; a=rsa-sha256; t=1751297809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fcmnJxw89CijL3dQAiVqrbC3o+mSiPlb1gYaPODOuAZahrqXh9Q7MJljPbl44c3H/s3kbDYiCDMzkZkdxKrwN7xZPRlE1Yecxe5+RwhFTezM7jcr+9O1u4syuMyDRpjT4aP71sTEJLMyU/uWbpi++7xMfctgSDv6bkYH46z826s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751297809; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c1YGdk2ZohmIABV7Pc0xmFdEGzRW5c9+R0A8R/9CkYc=; 
	b=BPP1iDvvCXrrHNJkMnE4/qjD5+IbRSfoot+73k/vBhYIHSffcEY6FukWmLMDlXtoOWnLzYiJa59ya9G10YL5Yt0uGfDPV1tzgX0jr9Sgxzr/8VzzcmXr46kNLj0iWXyT91JmTCBPueM829ZjIaJJc4nStXYDDjsUHQ9gtCTucxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751297809;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=c1YGdk2ZohmIABV7Pc0xmFdEGzRW5c9+R0A8R/9CkYc=;
	b=KqJ9LBf36QU99xqK9haLS0d6mQ8XIfJD3kVIrNtDq+I3TaZvYX6jgdjABgiRdLAh
	5tBfT9rky1ou9xADQ86BCgcetbK+TAAv4c6ND92/45/m26CfeLGb7VckzJFa/HVh/Nd
	+7cIqMrNdv8MA2GH7ez/oa/PvfkVavXz4vPQ+SQw=
Received: by mx.zohomail.com with SMTPS id 1751297807261784.8387235480643;
	Mon, 30 Jun 2025 08:36:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 17:36:34 +0200
Subject: [PATCH 2/3] arm64: dts: rockchip: complete USB nodes on ROCK 4D
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-reg-usb-wifi-v1-2-1057f412d98c@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
In-Reply-To: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The ROCK 4D uses both USB controllers, and both of which in host mode.
However, it still names one of the supplies for them "OTG" in the
schematic.

Fix the "host" supply's input, and add the "otg" supply. Enable the
remaining USB PHY nodes, and the first controller node as well.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 41 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 352e3df165688219bfedc19734d9eb32c547ec44..ed8b018539acb77328627c24b88a5a220fe085d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -180,7 +180,21 @@ vcc_5v0_host: regulator-vcc-5v0-host {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc5v0_host";
-		vin-supply = <&vcc_5v0_device>;
+		vin-supply = <&vcc_5v0_sys>;
+	};
+
+	vcc_5v0_otg: regulator-vcc-5v0-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_pwren>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc5v0_otg";
+		vin-supply = <&vcc_5v0_sys>;
 	};
 
 	vcc_5v0_sys: regulator-vcc-5v0-sys {
@@ -682,7 +696,11 @@ pcie_pwren: pcie-pwren {
 
 	usb {
 		usb_host_pwren: usb-host-pwren {
-			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_down>;
+
 		};
 	};
 };
@@ -721,15 +739,34 @@ &u2phy0 {
 	status = "okay";
 };
 
+&u2phy0_otg {
+	phy-supply = <&vcc_5v0_otg>;
+	status = "okay";
+};
+
 &u2phy1 {
 	status = "okay";
 };
 
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usbdp_phy {
+	status = "okay";
+};
+
+&usb_drd0_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";

-- 
2.50.0

