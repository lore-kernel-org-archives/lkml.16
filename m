Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62071187FFA;
	Sat, 26 Apr 2025 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745651821; cv=none; b=IXXkD5ftSUGonesM7d7nVBUmJ18niPu49UOuW2GidkSinBVOHkvjl1tM0TMJiYdTjJynTHRve0zX7D5BMMllDvcJwr3ez4JiX2x9bYrP/s6UuamvyZrm+NZsFaNyZz3hrqLp7nAO/4Q7khPX/Zb2acfMHn9wmkyrx2iSlEBxj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745651821; c=relaxed/simple;
	bh=RZs2dAKJe9VKR+N9+Zul2QDjzytVTXQkvTXnhgdAz3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ur1lpAV0XK6hVAXR2YtLNakDUhRLY9Fva9bP4/qkJC3wNmgE50EPRf4ka87w6rh+VJFB1e8AmRN+65NtrkLb8uDI6TFTykUHEEJi5UHUhCo8AYOGfz4YBTZwzpx0JCwoe1SQgc0WXiyYpylPoUmMVAHaw47egAUYIs75OI3DcJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aFbWVctW; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aFbWVctW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mXo6Y
	IPjrSN2c1K17qouHUGEumJJRJfHpUXH7X0cEzI=; b=aFbWVctWoxty0ezwkpQMe
	JctZBqkfM+f/sRtxMmdyvKwTfzo4qdi9SkEYwGomYOQAm1zHZn0c9fU/bS0Jygu5
	57KgATMyS4Ep6XLUzzQHb5oAz7Ez/y6nfM0a1y71QYM7jwMH388XofUAJO0Nw3P6
	Uy8McZb+MGMQ34tuyU8N2o=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H1s0iAxo+8N6Cg--.20762S3;
	Sat, 26 Apr 2025 15:16:09 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook
Date: Sat, 26 Apr 2025 15:15:41 +0800
Message-ID: <20250426071554.1305042-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426071554.1305042-1-andyshrk@163.com>
References: <20250426071554.1305042-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H1s0iAxo+8N6Cg--.20762S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWxtFW8Ww1DKw48Jr1kXwb_yoW8Zr4fpw
	nrAFZagF1furW7JwnIyrn7GF1rJw4vyrW3Ca4fZFy8tF47WFykGasrW3ySyr1UJFWIvayr
	AF1qqFy2gF1qqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE0PfJUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAE7XmgMf-Tn0AAAss

Cool Pi CM5 GenBook equipped with a 1080P eDP panel, the panel
connected on board with 30/40 pin connector.

There is no hpd hooked up on the board, so we need to set
hpd-absent-delay-ms in dts.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 .../rockchip/rk3588-coolpi-cm5-genbook.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 6dc10da5215f..738637ecaf55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -148,6 +148,40 @@ vcc5v0_usb_host0: vcc5v0_usb30_host: regulator-vcc5v0-usb-host {
 	};
 };
 
+&edp1 {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			hpd-absent-delay-ms = <200>;
+			no-hpd;
+			backlight = <&backlight>;
+			power-supply = <&vcc3v3_lcd>;
+
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&edp_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+&edp1_in {
+	edp1_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_edp1>;
+	};
+};
+
+&edp1_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
+	};
+};
+
+
 /* HDMI CEC is not used */
 &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
@@ -170,6 +204,10 @@ &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c4 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -383,6 +421,8 @@ &usb_host1_xhci {
 };
 
 &vop {
+	assigned-clocks = <&cru DCLK_VOP2_SRC>;
+	assigned-clock-parents = <&cru PLL_V0PLL>;
 	status = "okay";
 };
 
@@ -396,3 +436,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp2 {
+	vp2_out_edp1: endpoint@ROCKCHIP_VOP2_EP_EDP1 {
+		reg = <ROCKCHIP_VOP2_EP_EDP1>;
+		remote-endpoint = <&edp1_in_vp2>;
+	};
+};
-- 
2.43.0

