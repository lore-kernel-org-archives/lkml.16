Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F22E3AFB;
	Fri, 27 Jun 2025 14:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034449; cv=none; b=lE/pEskaf9clL3fmUiXH3C56jua9fGELLpc2g5v6ovXYtJuTOSLjAt3OzcKi9A0R6yj1o7TPktx3InoKzMJnBrhLZDOmHmh7m4GR1DncefugrA/uoK/k4njzhbYUEHPpOGHJ1S5fkOESLHuRUHUYUfn2VhorweVNPke7b85x9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034449; c=relaxed/simple;
	bh=ieVn41evUKiucK5EdElW+dWxbLMSlux0+pszLx9BUik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6kEcdd6KIH36Wtpp00uXhqL1FwNmuI9WXpQ0rg5FoXCHvakEaegvtl5xUhq3JKqFBK/mkwC40nGQBatOI/mBxPpadYgSK9+l3qO6IsWpcL9zv+ljkDQ/9mJ1evu8f0l81JACbWpJ5kscuWugI2NYlLut8PzGW6Wldc2BkCZIow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y25L6xnl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y25L6xnl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so2755008a12.3;
        Fri, 27 Jun 2025 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034446; x=1751639246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=Y25L6xnlrE2dQXmAq5Mo91LLq8zV+Uk6jrWiSQRJNTS239o6Y4pI77IOtB4BfUuySQ
         d9FilpbuQjTd7yRiQKEJCybQ8PPXuRERIciBk1msNGypfKsJ/rv8uTmAFSMSYLradDpC
         TSTBjVhXsyvX7qQbbZYwKdGUy7POuFr0LXb3052RcJ6TVpEHRhQLeEGsNfqDWcJUJqkw
         /9wDXR0ffSa+NvtsBeMdjGu4p8ia5IeUFTX7ispIoXK5KmCyskt4FypovO4FmlG0Zf0/
         ZTKVk9iQI0Izp3kW7ZEHn2NkxfmY9Qi/Pwy/OPb9WoSlFmsq+WyBUUM+B9YKyv44/Cn2
         TthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034446; x=1751639246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=PWl/OUOfQrEAGS11gqirea8bRuM2gt8icxuQc6+8+ykp+B9zZpgFD1A+WlUWpJdimJ
         BdeIdM/CKPRVwI7FX/0X7Awrrq5lTA/N8XN65MLJCTXnU8qLMBpSuZ1Io7DxFuH6QEcu
         jg+D5dfvlHiahMlcUA/vRTEALpuynAu7btEjxAAszILMCM9KLPhP/jx6ufgd1TwReKkM
         xTsLAxO/qYzLNCEGN2j7UbPg1SugU/jfGI72AjrXFfjVtaKS0vZfhy+fjyMWIK5m3O4n
         Rfuxmy3fXNTDguf08aYCpPuMRXmo8wHFo5Eb/89vv6cgxlokU1IjicBTJOPS3b1eqGLO
         SxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCSQ7YR3Y6oat8n/nExdE5ilcwdD04M9bmIOJmOJttNuBlUvcrR7XkhxgAsui1GuF4MBHNoR2n8Xh7@vger.kernel.org, AJvYcCXrAhG1YT2IvzHhQL8MSba8xwY4mLGeP76oYYdfAw2hTcdZsP39SsJ3xAOvPD5NyFfb+0nJnQushTvLTfpa@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjlGZWdAz5NvVkrGbWNgUGJHMQTbOkzODO7oc3VX/LpnFEsya
	QjUay5og1ENSXCtqnOiwfhDXY64AUN30PRVb5K/mHIN5HdDcoLcNB0l6
X-Gm-Gg: ASbGnctmL2Lv1QUozjpaeLOsPTJZUBPSXbq1kjS6y/hVWh6zqgJor0x3FHTlQm1t00h
	1KvdS6pAwAmGIrR9kvtW1V8ReplDjQCYqLgVp8mMQjgG4uZGd60EY0g+FIAZlSC8QstLVY24nPT
	ehSk30ZByhnDkt8h37Fz36j0ldISgsQQJpNN8e1Nfch70oH2a+UFDKOrGKsiyapWd3LH7xPIQA2
	E8EHsOevXUaiwloRyqX7Bh+BGUtVuMcE2mGFm/OGAoncgGFms+sRsglFOH+X2H0S8bFLv7+zIiR
	T9yjTvnWvE9KUtje+TCB3Pm7F32aXQyXLF+tQH+Ab7iXnNGkNvT4ORJEwR9wz/3CKFunmpMVXoP
	UqCa5ryoBcxv4H8kegQ1XkGlAyP6qGIrHLg==
X-Google-Smtp-Source: AGHT+IFnOD06HjYEqKm1S8KuPS4M3Ez8CyJAs1iLSJ2WT8T4Kt7o/r+8yNxZapY+lwfOAyqb7QEm3A==
X-Received: by 2002:a17:907:961a:b0:ad8:9257:571c with SMTP id a640c23a62f3a-ae34fd6c852mr358792166b.20.1751034446217;
        Fri, 27 Jun 2025 07:27:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Fri, 27 Jun 2025 10:26:45 -0400
Message-Id: <20250627142645.134256-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
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

