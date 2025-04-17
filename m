Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCB22B8A0;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884850; cv=none; b=ugZAoj5iZMBDiTw+YilUZxRxmRVzU/f37yoVq9JLadE5IXUYr7XQNX76pAshMUEr5FatJ9tQNAjm/XIFvuWwFW7U7VD5A7hZA8tXA+yzLL+WkwoJkwZwhDBkq/IDJLZK6eMzqFGTEQr2EaHiWWjEfUdyQZBWqsAYysAOE2xZLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884850; c=relaxed/simple;
	bh=U/HBmPy+GDcafhGGDUmjDBSu34YLOVYx2WKJyUrGsIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOdl48YZd2NjKr8wYGIeYhOuD0FbfUYjXqhkzHyX5JH7JhQPNwMv7VyWxmhm9mVdgj32GQT24g6d+qj7NdcaOe1TgEJ/F0QxXQvsJ/H2SvsJLJQ5ghUSRLPaDhKG/tEhrkTAF7SPazj5BijxJzuYpTbAFqpMhcnNagAkurgxPqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFC+2EZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFC+2EZT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EFE3C4CEEA;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884850;
	bh=U/HBmPy+GDcafhGGDUmjDBSu34YLOVYx2WKJyUrGsIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EFC+2EZT48i5W98EhL2pbX6nIgkAAA436Eq1UHcIRi1edqeBTJdJNONiWyypVuBpM
	 y3dn74zzFWOWL+MTDz9+VYdc+le/L5kybvMvi4TRAUR3u0l/oZe+LzlS8c5rCwv19k
	 CgXrvzN6qSgV6OB997cr+/HZzyAJ7Mwp0dFQqfBS7aV+Xo5QpEmevunTtNG+qRyaE4
	 eSi87AjcfMytxfoyo167I7lg3gGVgVHfGZtyZ7rkaeWVQ8W6c395PZCVhhBqF++DRT
	 BMCQo8nS+M94x+xHkj/8xyR6LVreUwsPG+emtNWzcz2SU3xOsTRiI28AQ0NYxDKdus
	 gOcWmUQCgV6Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426CFC369C2;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:09 +0200
Subject: [PATCH v6 8/8] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-8-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=4676;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=LByPw/mrn8RNYJR8lwlP3ksUPIStEdKRG9cNVPBNlbg=;
 b=lidWz8njW14UUsQ0voyR+nU0nzt7tzng4IUx4pH0aF1JQf8m+7mmhmjt72Io933wGLrjm9ZP0
 vxDL52BSsfIB09wRvUDbi1X7yZ8Zn4lo8z9qso4Eu060oKdh5qQuHUk
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
comes with a 12.3" 1920x720 display.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.
---
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 +++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ca3255aa9e18187b33d54c836992aca5dd5d0465..c821f9eda332abd1db1867dab196c09929316728 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -217,7 +217,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
+imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..c723d13b95a61fa5ff0e41516f8a053f9d0b7768
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "GOcontroll Moduline Display with BOE av123z7m-n17 display";
+
+	panel {
+		compatible = "boe,av123z7m-n17";
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_panel>;
+		pinctrl-names = "default";
+		power-supply = <&reg_3v3_per>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in0: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in1: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* sn65dsi85 */
+	bridge@2d {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2d>;
+		enable-gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_lvds_bridge>;
+		pinctrl-names = "default";
+		vcc-supply = <&reg_1v8_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lvds0_out: endpoint {
+					remote-endpoint = <&panel_in1>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lvds1_out: endpoint {
+					remote-endpoint = <&panel_in0>;
+				};
+			};
+		};
+	};
+
+	/* max25014 @ 0x6f */
+};
+
+&iomuxc {
+	pinctrl_lvds_bridge: lvdsbridgegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14
+			MX8MP_DSE_X1
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07
+			MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09
+			MX8MP_DSE_X1
+		>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	/*
+	 * burst has to be at least 2x dsi clock that the sn65dsi85 expects
+	 * display pixelclock * bpp / lanes / 2 = dsi clock
+	 * 88.000.000 * 24 / 4 / 2 = 264.000.000
+	 * range gets rounded up to 265.000.000 - 270.000.000
+	 * 267.500.000 * 2 = 535.000.000
+	 */
+	samsung,burst-clock-frequency = <535000000>;
+	samsung,esc-clock-frequency = <12000000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = < &dsi_lvds_bridge_in>;
+			};
+		};
+	};
+};

-- 
2.49.0


