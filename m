Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634B265CBD;
	Tue,  8 Apr 2025 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104711; cv=none; b=FK8WMObh3/ZJG9nFbVWKl+5g+IvW4h9qjqCnplsrCMxP4YFdu1ImqjSpdPGqy2R2FlWleFUJzzVfRsDHtKuha4tv8WjxJcoSDMLjkjKGbOZZUl8IhTHdE/c6LXI5fpmllnEefUi5sSMeYODi17bU5yz39CvbV6XmYZApH/Q0PmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104711; c=relaxed/simple;
	bh=1T/R+EzxlvBLCCOFBNzhlGY83PF6UggOslgTR7HOOAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsjBMzPlD7Lq5KtmWw8ctav9dbbC0oOgoUpBoeMv7wLqJS5C3qWvJ9mps2NZnjy3ehhnIOmJxzB9RLl8d+hb1e3QL/UxZARmzqbdMxSRUGNIwkd214Og7BCHzxHpEC31IM8LcWJsZJ16YNIjAXRAeY6BkPRC/sSqlYGX5dfyVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=TgwJB3mD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZK7O/PK1 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="TgwJB3mD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZK7O/PK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104709; x=1775640709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BC+kwoVAr3DKkerz52sg03mJQPqBZjjq89g1vIcQW6U=;
  b=TgwJB3mDfasbe0PWh8QOTjeXMDdALUIidQ7gMv/cA28+cMEwzKZoUK+x
   dfY4K17IDw5oybiB79YxkNlFDz7UVTVnODTGjAzyh8fdgDHxP2Lg7hkhG
   vd6erPkomiABjHVoSF8l7YyYikJE4awqWX8RrjgSLI9kj298R5WW9mOPb
   gc/I4MdWBKIHzkAQKSfBMIXi+ufItgfm0G6wsVnN58Tihg38yrpMBRzKT
   eCQzVfb0bPhe0+GPukIKey/ZYWpeiElUdjGRJF2vsU0ujIDI77Byq1096
   tk7EeGL3AfGtL+CJfh40DuTdQxW4KtDv/8ULvhXfTueO2Tmv8HJw27tTi
   g==;
X-CSE-ConnectionGUID: JbgMUJd8SQ6ivHccM5rvSA==
X-CSE-MsgGUID: 7BUzCS2bQDaaKFPDC9awTw==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397405"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:48 +0200
X-CheckPoint: {67F4ED04-1C-7141A0B0-E6EDEC14}
X-MAIL-CPID: 85B7DA6F25BE624F0F4F2E5BBE0CCC1C_3
X-Control-Analysis: str=0001.0A006368.67F4ED0E.0042,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D264C1697D9;
	Tue,  8 Apr 2025 11:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BC+kwoVAr3DKkerz52sg03mJQPqBZjjq89g1vIcQW6U=;
	b=ZK7O/PK17MX11bWsdyyzDZzuHy+szGat4TYZHWGlxd8QLQnUIashucVz7o94TFlHe41cDO
	Llnp/Wcg3boWVKI3eKdnWcggisPVWBgw46OZQBrPgWUnaR9B/ZItpzAoBNJK1KesGG6i6b
	OLC8ZPNBaciSkxN6knrArsuT+c+FY4RoU4yNuZCGWdaJU/6Noz0HcU3dglzWNcBxySKjL4
	rTFzuILD/cYyf+NN9qzwlpUB9MO5169C2h58uLexXinYZPEU0mKviBgai0FoccGwwuo/F0
	HN4Nk69O7a+2Q5bl0yGd+lVKOS6KX7M9dxmMmzE0//kgNpKnuk+dIfSwvOH9gg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 6/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
Date: Tue,  8 Apr 2025 11:30:53 +0200
Message-ID: <20250408093059.551700-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This adds an overlay for the supported RGB display CDTech DC44.
DCU graphics chain is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
 ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 7b97b718ebc16..53240b04c9688 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -9,7 +9,9 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 
 ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtbo
 ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtbo
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
new file mode 100644
index 0000000000000..146d45601f693
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
@@ -0,0 +1,55 @@
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
+	compatible = "cdtech,s070swv29hg-dc44";
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
-- 
2.43.0

