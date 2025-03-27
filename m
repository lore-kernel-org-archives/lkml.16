Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E3219300;
	Thu, 27 Mar 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086530; cv=none; b=j/xsFsargs2azsWbt/fLyOBDoL7nYkRxN7+ik6X7fmsCei0FNkTUFM90oqYAWgqwP8Ptp03OaOelDAlOL8SbJSDyNP7RSrS3hDDKcK/Je0I63h4uFLpY6zTvGqUG3YwWntOBrKhj18q2gR6ILSLfRMNfxl+yyG1dRbmBxNhzYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086530; c=relaxed/simple;
	bh=gkHKHE1m9kjM7oZ16R737lHgMEJGmwrBW0Gjtbmewa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERe+P/TNMYy8s3RY2YErSNa/Kh0lLIdM28qDbMa2/8auJRWFP3r/5CFhTTuGhiejG35YMX+xHSaea1UjVx1KY0EqiB12Vd1yH7eU7EiX4kgx4IZo3qbsFzOZgFXDdj8PwkKKeo36C6e74sDQNcYnwzHAS/fbAoNiDcb7VMZdLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gEpkGrBa; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=g3Srv2QM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gEpkGrBa";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="g3Srv2QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086528; x=1774622528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dyd/G8UMS5Ev3nFa2e+b6IUVKqcLbE0qETb17ejIM0U=;
  b=gEpkGrBarrP4NBcp7mw/LfFiOyTDoN4Xx5RDCwg0KMTte3l3ncoQNyJW
   TcQA4skQeoTpmL9gb6VytOfK6LQk1I1EVNfGp1j7APqLKcagYSxkCaSb7
   A4fSBFcYwy/ZUhBtmSEMXJUAjoHPIvsQNMVo2ZQZnkMSNd6hQ3OLrmBer
   MzQtf7iMvZFzBl5edkfz6xbCW+bk8Wa2mI+JAgq+x8zDUBCUlAeBvCdyD
   wyBZ/EsFW0N/dHU+Sks5KbGb8ZlOhUGzVYWSYOKj0fBzag7m7jOfKlejJ
   ATS39fk77npjEBgowYnCw4z9fZuTnprCsHZQktO3RiMRT+ghu8bPpzF6C
   g==;
X-CSE-ConnectionGUID: qfX6IfFPQe+8zvf4J8TqAg==
X-CSE-MsgGUID: KDUy227MTOSbKnd+SqhOhw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199521"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:06 +0100
X-CheckPoint: {67E563BE-1A-2417938-F0170C2B}
X-MAIL-CPID: 273C908C772B6A21BDF104E7C9935432_2
X-Control-Analysis: str=0001.0A006368.67E563C5.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88B3E16C181;
	Thu, 27 Mar 2025 15:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dyd/G8UMS5Ev3nFa2e+b6IUVKqcLbE0qETb17ejIM0U=;
	b=g3Srv2QMwXPymym/Pr7o1MzFNhKRCvNDDcUgOALwTOYU5lFKRo5yhyQ6Kvdo033G+Yt5mf
	BROZdQTHQ+BI4JnGyQX9zk5afgAwxU6e3hCSXUh/X3e3Wxz0WiIzNWO98xwWm0Hw1+6f97
	UMPKotXvDF8n+yT/qDSBP2JfhUei3htdQ6nzd5RwaI8iyCOTOIE10GJxFE0cEj1TMwpAXZ
	uTp54TKGPRoR9DFIihNura7uGzqcxHyX15jFuUPhhva+BiPUAEDUM/ZClXbekI0LNmN+Zy
	dx+4LmwGhr2AGfZVJ+nxJ7b1oGFaUaKrAJUxaNk+sLfdLwvXwPLQ5ZKbw6wPMA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
Date: Thu, 27 Mar 2025 15:41:11 +0100
Message-ID: <20250327144118.504260-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This adds an overlay for the supported RGB display CDTech FC21.
DCU graphics chain is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 7f96de6f80224..7b97b718ebc16 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -9,5 +9,7 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
new file mode 100644
index 0000000000000..31494d9d09f8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "cdtech,s070pws19hp-fc21";
+	status = "okay";
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&pca9554_0>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		/* LCD_PWR_EN -> TSC_WAKE */
+		wake-gpios = <&pca9554_1 4 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&reg_3p3v>;
+		vcc-supply = <&reg_3p3v>;
+		gain = <20>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
+
+&panel_in {
+	remote-endpoint = <&dcu_out>;
+};
+
-- 
2.43.0

