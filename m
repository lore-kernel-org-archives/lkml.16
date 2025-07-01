Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B5148832;
	Tue,  1 Jul 2025 00:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329454; cv=none; b=fjlxRBsqdWfRXTgh4ulXgtvt1XTak03qQg5MFZyjc4QP5JRwXPECe0P3QjD50kR2dhMJna9fQqTgio0De52HtIqXW2eC8q/PQ/sTU36wdC3jAq+/jstkM0lGgYxZfWBYIltPi0Y+N2iVaAyGPi0MGnNxqBuGq12xlALzOcfiOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329454; c=relaxed/simple;
	bh=ieVn41evUKiucK5EdElW+dWxbLMSlux0+pszLx9BUik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FNm6rIbRMj4wtEptfiJN22kKoMge0nqiJVwRiWNiVMp9RjR3y3yreLZei71vJQpgqG/D1B9sVWhLv0GggwqafhbahOSsgYWZI8eg41Jui172RyQb2eFH3or2WyqjwZRVksvTfVz95Xlb7tR2ko0lKWg0C2/coTNy4yvM1WNm5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6GJh26L; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6GJh26L"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so9626205a12.2;
        Mon, 30 Jun 2025 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329451; x=1751934251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=H6GJh26Lhd8xvnuoiVUgO93QH/MPe+/65vmO2kLBK8gg5Pq8gdOTrAr6RLaoPZmzp4
         opayA4WPyTYd5++tcvdQiJ0qHoFt5LeoMetkhAxH1Z8jEhOw5jS/wD14ZI10ymWreqcX
         sD5V2aNlEtWlllCRMjKCbnTr80N6RV0K/fu2ae5hUkQQlkN6QphNiw4gWgWPk6SYXMPL
         2RW38wDs3b7x0/iT1QF55RnrXrfN6P1N6oDiIlOoqZXanDuQ6tFIPH0Ihr/aJUNSC5It
         ujQ97D1R0O7QYc3OCUgUEOAbv4fV876oFGgEpoweHJnMqwXyr746FoJNBShs83zmerk8
         B8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329451; x=1751934251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=V2TPqVGV1S4Guxac0KHehPBCiYc5lGluPrnsOfpaMLWV5b4tLnXuOwQwz6LQOOKV8K
         RuNV4RMERf8qsbV147RPg45AL2uSUdj7B7PjojKPcufAYY1ulKRZqbcZ4ZGfauaafRYG
         iEADzJv6VVHoxG1+lff6O/O+SbPzn7+yfTCFTL9cBHIIfs0VBvB+xHDzWhIqgx4r3cAH
         u42TrZu9pbuqufatK9YvpEI/l+Fl8He5CL9Qqii/wZQluHCdBNxld9XBhgjf1V1ltMOp
         lQGSBHz6rQJlDXJpvpjYkLPoQVsHUhIXFeUnvCLYDRITwHj9MXAdB/mrFMsE2SbDyxLE
         b3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXGaRJ6OQocJd0m8R06/5ugZAydSnhVlXyBua2eTXBTEh8CT2qtACQDIHSGFqi8rHtzw/Pv9nDKjxcD2dQF@vger.kernel.org, AJvYcCXwl2a8bbG3pUxeXmDtEiDXYVXYxfS+k1o7r59OfcjOZpc54VIQ327nxGrF7yDGwP6Vl61v1GwIdB3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdNs1OKVTprhzwULKxPq+P+4ugsUQdZotOKYuy2Cu1dZinHtk
	7aALc4xgdv421iwA9wur/HtKbhZm7RV0nAKVGsqj8csM2Z/27tgJULYe
X-Gm-Gg: ASbGncspph0evbmthRjmvUBEzYhpQk1/lhXg+dMOi90iqTXUwvH+AcL++B9DuIL5iC1
	m8JE0XM2+gn0Ofc05uXGp0C1t/dbEKDPmQhqoYcPzT/OpTetpFvymLEZVzm7MfwFPKCHrSiCRwj
	bDhkIeOjan0ox3OmCQ6JSgMLTDBMQ+mzmagDTc2YyVQtDcC79VOWPnhuJ+Z/LaY3j0vfJso36lz
	FQYjKWX9rMgM8M3kAdFpF4023vjV0ZywprvaU0wJ6gd0KoRNJF+nAeFWGua3KO0F7rvYItpE8zZ
	qJGcyLine0g8yK4wp46/OdejDGWWlWfr/BP+TK+wSM2J2Lo5Q6SLMP9HkJlh5eV6a6+AAlIMw1h
	qVNvhFOeHN7a82ZVDwMuVcYo=
X-Google-Smtp-Source: AGHT+IEAfpopEL8Ya8sEfPn6VusJkqolqPXZlhfkBFbQaxAdvhUnPxryh5fslzeOetzbNMf/U+Ltjg==
X-Received: by 2002:a05:6402:40d5:b0:606:dee2:42df with SMTP id 4fb4d7f45d1cf-60c88ddd2c7mr14791183a12.17.1751329451100;
        Mon, 30 Jun 2025 17:24:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 30 Jun 2025 20:22:39 -0400
Message-Id: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
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
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
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
index 000000000000..5497e3d78136
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,69 @@
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
+	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
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
+		MX8ULP_PAD_PTE16__USB0_ID		0x10003
+		MX8ULP_PAD_PTE18__USB0_OC		0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID		0x10003
+		MX8ULP_PAD_PTE20__USB1_OC		0x10003
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

