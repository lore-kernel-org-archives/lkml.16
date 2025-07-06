Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4173207;
	Sun,  6 Jul 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751801972; cv=none; b=YYFSyQ/dnBofqpw7slcZPkh2+MtwKfKgVF9CPY4Nu9pLo6+Wi0sV1hay3lteQc0tfBzU7yZx17rIixfLNPKSZBVHi+cHmH63jB5Wf9W2p02DhFCeRHlzg7yNnJ3MHCsi1LN6xxGjJAL//LLNupLa9XYS9UiTKq7nbmcHsa9HJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751801972; c=relaxed/simple;
	bh=l6n6rqv1q1b/wEmd9g7QV0/z96jLuaK1hDjyrKq+SKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SYfSszrTMjc/uFxYW+gDei6IY5PAf3qF80DjNQr+nL7YOIoJUZkSQCBgXUsIip4PpORd/fD8dDLvub1LfoyKitpiQYh2kqy+Kr9U33Zgm/V/VV5Fk6dlFKbsviBAbPNgbSG9+BwDmzNbqsFvrCj2VG0CEsYCy3+OBM9LoPfH5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NO3dJ6nS; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NO3dJ6nS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ci
	N8aT9Et5jhNJ0SP8OnU+4yqCjb+pcPmRVpPHf+LEg=; b=NO3dJ6nSfWxw/LePkm
	4FSukGXk5iZQtQKsIqKtbCb8H6tDHm23Wg7JAQ0fLSPRcFFeDRwPD8fuJPUu2F81
	5TbgU9RTPZtMTGbIF30g2MifhW4A2Kt/HfUlJCmyIvXtKFLg+rpOw+gkuuJP8l3N
	YpovnIq96OV0rM3oOWi82K234=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wB37yQ4YGpo5RCCCw--.60201S2;
	Sun, 06 Jul 2025 19:38:36 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	didi.debian@cknow.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: Enable mipi dsi on rk3568-evb1-v10
Date: Sun,  6 Jul 2025 19:38:24 +0800
Message-ID: <20250706113831.330799-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB37yQ4YGpo5RCCCw--.60201S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4rCr43tr1fKr48XF1kKrg_yoW5Xr17pr
	nrCw4Sgw4xurW2qw15tr1kJrn5Gan5AFWxGF17uFyIyrsFqa4vg34IqF98tFyUtF18Z3yY
	qrnxAFy29anFgaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8txfUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgmCXmhqWtxqyAAAsh

From: Andy Yan <andy.yan@rock-chips.com>

Enable the w552793baa 1080x1920 dsi panel on rk3568 evb1.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 66 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
index b073a4d03e4fb..a28bb90b85bed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts
@@ -22,6 +22,15 @@ aliases {
 		mmc1 = &sdhci;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 25000 0>;
+		brightness-levels = <20 220>;
+		num-interpolated-steps = <200>;
+		default-brightness-level = <100>;
+		power-supply = <&vcc3v3_sys>;
+	};
+
 	chosen: chosen {
 		stdout-path = "serial2:1500000n8";
 	};
@@ -184,6 +193,47 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&dsi0 {
+	status = "okay";
+	clock-master;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+		reg = <0>;
+		backlight = <&backlight>;
+		vdd-supply = <&vcc3v3_lcd0_n>;
+		iovcc-supply = <&vcc3v3_lcd0_n>;
+		vsp-supply = <&vcc5v0_sys>;
+		vsn-supply = <&vcc5v0_sys>;
+		reset-gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in_dsi: endpoint {
+				remote-endpoint = <&dsi0_out_panel>;
+			};
+		};
+	};
+
+};
+
+&dsi0_in {
+	dsi0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dsi0>;
+	};
+};
+
+&dsi0_out {
+	dsi0_out_panel: endpoint {
+		remote-endpoint = <&panel_in_dsi>;
+	};
+};
+
+&dsi_dphy0 {
+	status = "okay";
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
@@ -581,6 +631,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm4 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
@@ -672,8 +726,9 @@ &usb2phy1_otg {
 };
 
 &vop {
-	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
-	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru PLL_VPLL>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&xin24m>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <0>, <132000000>, <132000000>;
 	status = "okay";
 };
 
@@ -687,3 +742,10 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp1>;
+	};
+};
-- 
2.43.0

