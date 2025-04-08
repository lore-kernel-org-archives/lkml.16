Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE43266B59;
	Tue,  8 Apr 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104707; cv=none; b=pMvdhinH7HfVVa/Pq+2OEyspw/6PzgCXlH/jFEpAEbezHAlYGG7ozDpR6HjkP5G4ZdHfVhxLMqcFnshrZXxwG2V8HMUF4X0K8rnYDmRpR2OLJ3w8lu511Jgxlldcy4Fxt1cK8eNYvCeUE2vO1dsJCztgd2lqWIaBqnVXxbbG77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104707; c=relaxed/simple;
	bh=d89052IXcNu0CH2QWqwTLw9kAS5Xw7bIBoFXHt7yxEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRoRP3yxLwLIFuMShPdGLa9/w4HcNviSuKv3JxnuKMzEqtEDAW4RjIVkL7lYA/uNI858BoHnNq2w0pV5GA4hGU4hTZOrgOHmI79zIQU+tcEV27t4XDH8jxrp/7QgKNOmU8f7Ho+b/ta8aDzsTS63xljVNlyYEyKZ+PGRTILJKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EvYkBj82; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dxm4gcWC reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EvYkBj82";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dxm4gcWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104704; x=1775640704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VsPKq5bnz+xbuaDXmAIW+FHBSb1rIYp7s4cZKf3qJFI=;
  b=EvYkBj82gLIV3LtT6bghyd36Jwi1oE24IvEsOih8iNplkjeYqAvFMzZR
   XWybhwk04MvZNcuGbowy3GbZP6Sp2wDVenkh6BA6Fk4D5+a56EEUPMhdd
   OAaRE3hZJCLu9dndW0GAzmfXJ7HkdTaL+v8RnaAqDhP41iWbxjX+ZQapQ
   1hdP4+zHAA4s+cjMgbCHihszxkP2qOVvXIe8/3BE5/bCbTG0DLoG9G/bW
   nAs0+CGMn+sL9uFYjK+fHqknwBS1OO0HI8tMmpSnKpiLxqJ4LlIvYFMSO
   F3k8juOs6na6EQK+r7A4MbV2fxz1iMcu3GJZ3M5kWBp+3bD009SZH9tX7
   g==;
X-CSE-ConnectionGUID: UPST+TY/SJSRBb7D3z36Bg==
X-CSE-MsgGUID: qKK9JvXZTw2J7t8o/Yputw==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397388"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:43 +0200
X-CheckPoint: {67F4ECFF-4-7141A0B0-E6EDEC14}
X-MAIL-CPID: 46C47596A6C7CF91E3972AD22E8C7313_3
X-Control-Analysis: str=0001.0A006368.67F4ED09.0035,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 822A31694DE;
	Tue,  8 Apr 2025 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsPKq5bnz+xbuaDXmAIW+FHBSb1rIYp7s4cZKf3qJFI=;
	b=dxm4gcWCz6QFFVoVUkHCY1OmHIvGwbZI5a+YpBbGuTXma5oeqELZizngS841P0D6FdA3+K
	kT+ohXvUU0TsNmssN4D3bxMeSVtrVsMAfovyrwn3i4fdujPl5FXyTMmbACYcnAfSol79W6
	sDd+dXm271AVTrZeO0Pgpt0Qwme74D48QD1OjNq2KUe2FcRzim//gqGCe2Z3n8kDD4uFtJ
	nJycUkA1ElejR1co+EqBQocVgVQDyOffwaPGUTivBcRuhtmHHiYOulskeWIO2i6r6NCc6u
	hUQ7aNsfi9ngQTfP7gBxQm77KI2VL7GpjtmOl7bkRdXBMZeSUeNsoD/d61Z+xg==
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
Subject: [PATCH v2 5/7] ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
Date: Tue,  8 Apr 2025 11:30:52 +0200
Message-ID: <20250408093059.551700-6-alexander.stein@ew.tq-group.com>
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

This adds an overlay for the supported RGB display CDTech FC21.
DCU graphics chain is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

