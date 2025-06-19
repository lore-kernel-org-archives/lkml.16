Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E12472B7;
	Thu, 19 Jun 2025 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315207; cv=none; b=FUvRerBioDpKieWsb/Cj01YM49WGsTQDpMqvA5ji/+2l3Hn+hHC/Q86OL35VS0zh7MEnz8y7WxA11SlNelYjZPgzQXEMRKpXLOFOR6FC82L0CAvNUcx5Kqj9HuRp0hpFzZ5tx8VrKNOBLw0dVPCkgHAMWy3mAGvGsZpWzzeVcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315207; c=relaxed/simple;
	bh=m89LuRhuilhNOEPU7jdFXM4BYUChUAWndiUjdyijU9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YtCAm8PzXumK1IyXVTxbVfVDle5N4mYQrYDwc6WsdeXgIZxsa1zneQD/RYlwy+SQJxot5xN5eKIqt/wAUyPOBxxGCPihDuOOTZTgxJsbrM4Z42JUibk33Hnsr7p7g6ic4T50twS2wI6L+n3FPrEFVAjE6k+KEUfcPCMFwRggprA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=h4gnuVG+; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="h4gnuVG+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7W8ismKFO9S/MJfCzgUb7stsYTeX3FdgTl1tq7cBadg=; b=h4gnuVG+OJ0gA7D82s2lN4OQPG
	6CH4z0miRlYmiypgOZOPVOdPAx1YOWoS0vLNF4ukxJV9jhaf2XH0ubMjHGuj4MNqYAYeQHoWLYxjv
	ThPpxu1+acqxeBaeC4nAZaXeRwJ5TugJQ12Xjt4Jjuba4uJdxWIIZzVjHu3BXFwUzN5cJE9uWHRZj
	KhLoeJ7QDnXaNZhcN/P+Qc1W6tH3ZOnNP/PpAmMPsaYC9Tx4BXqa/s4l/j6N9OTohInr8mTkmF4L9
	DjTTTTONOAtl0nEvIZRBDRhGXWiGl1RmfeI/DjT9mYi3mMPV3W8rSSyFQT858PAyZHR3doOYF0fcT
	6++ayeew==;
Received: from [89.212.21.243] (port=44058 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uS8wG-00EVcY-1t;
	Thu, 19 Jun 2025 08:39:56 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
Date: Thu, 19 Jun 2025 08:39:52 +0200
Message-Id: <20250619063954.1730231-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619063954.1730231-1-primoz.fiser@norik.com>
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add overlay to support PEB-EVAL-01 adapter on phyBOARD-Segin-i.MX93.
This is a PHYTEC evaluation module with three LEDs and two input buttons
that users can attach to the board expansion connector X16.

Note that, due to compatibility with existing PHYTEC platforms using the
phyBOARD-Segin carrier board such as i.MX6UL and STM32MP1, we face some
hardware limitations and can thus only support one user LED (D2) and one
button (S2) on the i.MX93 variant of the phyBOARD-Segin.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-phyboard-segin-peb-eval-01.dtso     | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 08a1de299538..011b2d58e4f7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
new file mode 100644
index 000000000000..8039aa1ddfba
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Andrej Picej <andrej.picej@norik.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		button-s2 {
+			label = "sleep";
+			linux,code = <KEY_SLEEP>;
+			gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	user-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_user_leds>;
+
+		user-led2 {
+			gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_keys: gpiokeysgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x31e
+		>;
+	};
+
+	pinctrl_user_leds: userledsgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_RD3__GPIO4_IO13		0x31e
+		>;
+	};
+};
-- 
2.34.1

