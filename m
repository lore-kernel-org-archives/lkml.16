Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73631A0BD6;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090760; cv=none; b=WicnVxwWarfaOaQHyhYLp1B36MAFEg8UuOUo3FCJdh4NSmB8Lf7JC7zW1dZ0hPpCQNWyIpKvQud6ltEhcyAQXU4bvaBZNxxFsBS6A8r06lS2Pivk9S4oCHbgjsAF23/oSiTkMpZM8L3+Lboui3y3YcnnVqkoT/8K+ncbHta1B7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090760; c=relaxed/simple;
	bh=8z3q0NpA8wnAUP/RdTgWmIU4i7imBPWC0McgSQvYNf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGSnH3DkYOz002P0hnAwjxq3kDGdIzak7L3NFEchrANtsi/MLkHZLmIefSNtguHDRT2crc27u5PQKNWQX/eWfu8rKufQ4NJSvNyyNE5XvYodk98YGuDeHdY6djFNOftMgov3KSL7jqqfLuszJ2hkikhZtttQfGNk5Y1nMWH9aXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5EaS9AV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5EaS9AV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84E18C4CEF9;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=8z3q0NpA8wnAUP/RdTgWmIU4i7imBPWC0McgSQvYNf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o5EaS9AVobNdejiUNROqnpNAo98LS9GeRC4bx8lTx2Q55rsK7lkWo/zeToccefmF1
	 3ENAiDU7D5bwJIpLGXf+DQNO3rW4c7IJ9N8Xoye00MpVkrgpXRHXAsCooVxeLQHlDs
	 MVRbROcEGpWcWiMCm6NQpG8uU6G6dCSQyukOaXGNwqz9+8eVoRQ60E5fS2WCGLur+/
	 956wtsxYft/gjSJKXwoAJXchV/hvONikvH4cIB/EvWglNLOVpPSyc9VjMXWJvX2Wc4
	 ABibHeTFkAZ9XaSHOaY7hHatDLCb+bzGRlxbMjGR1ZNjWD/UboBAR2S05do/ktgzRz
	 Ar0/5G2DBuvSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9F2C36011;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:42 +0100
Subject: [PATCH v3 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-7-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=3190;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=9JsvZTh+jeRunr4jwSFH14Q7W1rkRvW/yMNW6oZgbRA=;
 b=7fVRYA7EtUaSt65eRTx5ZTYZdQw7B89AExlyQNxaJfW1Lz/8RyUmgHlALufUAT0QLW2agbGBt
 qxV3/eLTlpADqOGL4JBIrTYbzZDX7EvJ7aLiyxsRgK1h0Qh1Ar683XD
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
comes with a 10.1 1280x720 display with a touchscreen (not working in
mainline).

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.

The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
I know is not supported upstream, the driver we currently use for this is
a mess and I doubt we will be able to get it in an upstreamable state.
---
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts
new file mode 100644
index 0000000000000000000000000000000000000000..1917e22001a1815a6540f00cf039ff352801cda8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"
+
+/ {
+	model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
+
+	panel {
+		compatible = "boe,av101hdt-a10";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_3v3_per>;
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+
+	reg_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-c-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		power-supply = <&reg_6v4>;
+		regulator-always-on;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+
+	port {
+		usb1_hs_ep: endpoint {
+			remote-endpoint = <&high_speed_ep>;
+		};
+	};
+
+	connector {
+		compatible = "usb-c-connector";
+		pd-disable;
+		data-role = "host";
+		vbus-supply = <&reg_vbus>;
+
+		port {
+			high_speed_ep: endpoint {
+				remote-endpoint = <&usb1_hs_ep>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+	<&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1054620000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157 */
+			MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159 */
+			MX8MP_DSE_X1
+		>;
+	};
+};

-- 
2.49.0


