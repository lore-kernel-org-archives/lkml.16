Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2A25E449;
	Mon, 23 Jun 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690979; cv=none; b=Xg5DpCByB5y+JBN+HbK4eOW5F9N20cF96/o6GjHqbA8s/mDtV9SUj5X4Ouk868TxG4jJ3aw5x4MDkn9/sN/fVETETfqYLS8wb88pfleM/XIGwFKGWf7Ms9cSlayffmNcU1B2CJMSyqSQjZ4ZLxO1gNtXhCRODi57oQLYTOVFars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690979; c=relaxed/simple;
	bh=FOJL2OjNMuhW48vZHtKj3F+xZx3Pxs2POJzYR2rhh/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QyK/bEKqHdaDkWtKpdPmbqx0073dAD0JB/a9axVNaRl7atkmcWOCFhFo7UVZUnLoVxaR4ca34NNbkzMULCGzuciezqC1nRVQ/qKl3mNRPM94wFm9wzHEajUNcu9byBkd5ixiJHq+FpY5V/hDWoPLYQeNuXetZjrupiJI0UhcGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7EhFgg1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7EhFgg1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso6868502a12.1;
        Mon, 23 Jun 2025 08:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690976; x=1751295776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=f7EhFgg14Si7frLBhg8FxRKvhn0x9JAjNs0DgPu8kJzHOHGsfYnUfA7qYIno/SFs/5
         rkWBzLw5dC0LwlAeHy9Ela12knJ2pKYQOVCNQlUr2LLVLFxFLWFWJR+Txr3EzAmf8stv
         dv2PZLsIf6j3uOnzUUu159NuquZusc8bOTUXfxNqi4RN8i9Ey4EzqG1S1sy4YvnVTSK2
         VjW3SxKpSh7Etgt4sG5b4uRW+O6p4plJUkX4B0EN+Eo+NwkEK7Ui8sWnh3OY82GxZjTN
         Hodm4DrPb+VtSp0xgvFZGnP+UCFrzHyKA3FlW3eY2hKCH1ZiOTFWQzvI60fnJBeTwq9/
         0LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690976; x=1751295776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DVcSJ/dvopLv561u5ZgnhDKEYiQSLuZjoUf/lGc7y8=;
        b=Y2oFzHLsaQIjrhSKccOOmvPxNAIjFWZtPIyN+b6FpLzkVtKnaHKWyg5l9ORnuJw9m8
         QD/lAkZF+0szofMoi877MSZlcSVO24dVnzfNPmWM0xmw002gRn4qCCkHXHpwSqEbHj0x
         L0EU4WG6HTjhJYEA16IWIVFIa5JBZzktCKzoPJaYWiC4m3Lmn0bUqY/USPZ/IeK0JlQo
         RFMQhPjDawCSdDFhXG2Rg9PT1vgxtuzsfbkyHAvgCQ76TWFIbdnDeVFkz2eZfTShBfRd
         LZ7cF5ChwAfzDDAyXYCJL0f7cV3cbpTLtLHDoMSExhb7DP3Iy8U2w71sAmA8uunvC8zP
         pWew==
X-Forwarded-Encrypted: i=1; AJvYcCUm3NVoX1C/xqx5nzIzinW1iK7vHAXccOqtEMxeltheS94io9HMxDhxqCHCLsZTDbWrRFJ1ZFvwq7vE@vger.kernel.org, AJvYcCVZ7mTerGvbA8TpomrWabCcYBvFHDhf3k2f5h4m62V/G0NEd4TLs8i94x5vDM64yqIvi9dAKwBYR4HGo3dG@vger.kernel.org
X-Gm-Message-State: AOJu0YytY/ReBiJeGSCV8FxWiy4feZNra2z29+2Bl3SxuFI5x3AmxsSS
	Y7RB5Dz9P4qE9a/XPVdtohZyy9a4P3dtfU/O4pwiNqtnrkaur9RjJQQm
X-Gm-Gg: ASbGncsCt7mKRexSj3AnhMNo2865vjS+atEqdZEW8EIj2lvCo/HtFJwU0rhFJ0N2Nao
	44axbuyc9rNmJl2UGRvpQdfg2kghTJuDDaqqHfwDEDqJZjSdyok7CxsFo91W/CSnyNS5OOoEeUc
	pm0M2KV5V6DJulTLhnrRB5AzakGvipQBwPwSB2zca4a4+tj8B7jB6TVlrvCg+CGuqIG94l1EWXJ
	OpUt9n6pUfXbXcBrUmrlVGkTTe+ZGvoxkDn0PdS86/jLhfC7qwkj3Lkizbt+OLfIgz85p0prvM+
	gOvdYm6b3nYM5AGJy0C9TO64TETLaSXCkE6fC9xA4rT9SYbl+dEx0qq2PmxCd6ZrlVSK4pXF7Wz
	dD/tHUbd5PhJqZ+Lixwjz+KM=
X-Google-Smtp-Source: AGHT+IFSO4725zW0tfiRfFFvsoN+L2INX8CRqzWeVA5SH7DGUv0pCu2PupV+KgzNzAz1wlydHfE6zg==
X-Received: by 2002:a17:907:1b1b:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae0579d1abemr1091515466b.3.1750690975318;
        Mon, 23 Jun 2025 08:02:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm732870766b.148.2025.06.23.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:02:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 23 Jun 2025 11:01:46 -0400
Message-Id: <20250623150146.1398044-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4da7501ece17..4b288b324d38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
new file mode 100644
index 000000000000..c610ec9aa30e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp-evk.dts"
+
+/ {
+	model = "NXP i.MX8ULP EVK9";
+};
+
+&btcpu {
+	sound-dai = <&sai6>;
+};
+
+&iomuxc1 {
+	pinctrl_sai6: sai6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
+			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
+			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
+			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
+		>;
+	};
+};
+
+&pinctrl_enet {
+	fsl,pins = <
+		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
+		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
+		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
+		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
+		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
+		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
+		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
+		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
+		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
+		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
+		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
+	>;
+};
+
+&pinctrl_usb1 {
+	fsl,pins = <
+		MX8ULP_PAD_PTE16__USB0_ID       0x10003
+		MX8ULP_PAD_PTE18__USB0_OC       0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID       0x10003
+		MX8ULP_PAD_PTE20__USB1_OC       0x10003
+	>;
+};
+
+&sai6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai6>;
+	pinctrl-1 = <&pinctrl_sai6>;
+	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
+	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	assigned-clock-rates = <12288000>;
+	fsl,dataline = <1 0x01 0x04>;
+	status = "okay";
+};
-- 
2.34.1

