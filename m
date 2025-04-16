Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989EF206F0C;
	Wed, 16 Apr 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744816524; cv=none; b=T1neVYN6LRetKdQ5kFuN5Uuqpm9e4pOMAIM8mgufs+xl7kb1E3QY9Od6OjNamQHUP46TEScZ1ty3OpnnBRN4pHLb+GF1nxDlUorlQiUS9KaMkz/jnlPlcv4MifChz6zvRW5cT+cWxDpswYzY7xWDvhuGg/mgMTU8rMVTDo5IEa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744816524; c=relaxed/simple;
	bh=HpU6VloERQNeMMx8yqX2bXPiTYCq+K5EnDiKMZtvK64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+9TdKyqfSZdm1dpxRjGQpD4uPnvER63HzO3AuOTQ6buXljrwzZiGOGuJksJ4I9Y5PhhdkJBZJ6KKkQ3b6wrkNGFu0of0oxdv0ZrZiiL1Zmujdi7QT4MwSGDCWFDn1JyAar4R8sHfbfC9Jwab0zvz3u2rxnES19xLNuW7zYHSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iShgXaC1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iShgXaC1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb39c45b4eso147624766b.1;
        Wed, 16 Apr 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744816521; x=1745421321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f54xB8jAzZGxPN+eurWEBlbBBztYq662AJjtmWBvOs8=;
        b=iShgXaC1QDlq5hgI2guInaHvvJ0XgoPt/qWHYly0woKgah0bW0TAd/LXtpt1JTO9Xh
         08xA/q/r78YE7sn4Qs74r9WLVcizJPptBiwaUnHo2E+WotO/QcUyZR71xQj4fPAtO2nI
         BIvxfW1WFex+w+ahHSZ44pLJRWASLAbTZ/5ixvIKu2RGTzwCkMvNDKkwg3xwqsGBC/Dk
         4yQ/9Bl4BjyEeBi7E5TFTGoZW+cvpG1lVc8//Vma93Tr7AVb5Hoo/IOkWWLlgv9BPGTx
         CbkIqgt2xERGymWkUseXZadwq01fpm4Xjj3cjky5GvKJWNXj+Xe5ds6VNHtYrx0pWPWL
         8ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744816521; x=1745421321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f54xB8jAzZGxPN+eurWEBlbBBztYq662AJjtmWBvOs8=;
        b=Zp9LOSas92e5dClXaOoilfuJlvr7V654nI1ZuUjmcRAPQr2ttTj44FETydFF4DqXAG
         H5xE/MFUesyPDOdi+4EUIYPlcAcYWMZOvb+eNXt5SKIL7amCDD9H6nvulIdTbG7EDMR4
         /QD/GS/ju7YT4GQuZhGU8it8XUrWFHvA1KcmpsVafAZRomFelrt32sx1QFswlSi0WoSC
         NqkEc+EVFp0CqgMI/qR6cSJPVhHrocC3Ql2IAJgcU9fJ3h7FUTQU/jRr9Mo6oq3apRmU
         kg/+9DOy70dIFmSA+qD3yDjmoHIxEZJpwzi9KL1Dd06hvk4cMG/BcRhlVjGoBF3gv0zB
         4nLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMqJIwOZydffQ1ocVedRhl/SID/s3O8UJK0DFKZg901JRu3nhqlBHUSvf7lkafo//wJ5/wTh/G7fAGUTt@vger.kernel.org, AJvYcCVHUmsOd7dC9IXkx9FF71X2C3khdwm0sDXhJ5bd59BVqJhGDVnczBGWcn4l4tilK3P00W2sw6tEWHjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YznXfl9e0CF9IpKrbBz9dPwn41Teu+nZnAA085r6Ejb2im7e09g
	XWgcMW27AMTXgfQxmLS3EmZ0tJJyqf4I9g42Egj4Vzn7Yo6tvr0u
X-Gm-Gg: ASbGnctsr72zQLcnVC8zL4oOtqKjPdbbn8uUXF8IsrwDWcWtNICVQ6haz72bpfAY5dA
	EwqHbqxtb2ZQgTB3lsI+d+IkMR0jsFhWT06+NB1mWzCZ0yNQ5Xu/lf6aLjyRPdXVZureyrfK+Rs
	L4RpijEkAQe0fHKo/A0FBoc/8m31GKaOAO2cznrMhlC7wQ1jMPWKchCvsp9kSS5W5wLwQjrgMsz
	1iXdq5v1eaEQLDVltmSuzoZULTS3NtNOzcrHzXKkunqi8qBgCPePJFXGBqO63vdR2a7gDrHlk8g
	pxvJpCnFgzjRrD4anBEQpA2ZuJIZ1jjCCj+08ftSWmWSgiFc7SaBhpml07sjzj4/VtnFImQNcOa
	GPpJVj6D9xNcLAuBuCQ4=
X-Google-Smtp-Source: AGHT+IEYDMPTAVgdmlNNu9P4Oui1LjNbVBOfvMZvnfG/4JzHe+Ej8lmr2fDQnm8jtO40TBJR4xN3QQ==
X-Received: by 2002:a17:907:3e03:b0:ac8:16fb:7c85 with SMTP id a640c23a62f3a-acb42bffb7fmr219117566b.41.1744816520410;
        Wed, 16 Apr 2025 08:15:20 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3ce5dbaesm143286166b.85.2025.04.16.08.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:15:20 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: imx8-apalis: Add PCIe and SATA support
Date: Wed, 16 Apr 2025 17:13:41 +0200
Message-ID: <20250416151353.1692373-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The needed drivers to support PCIe and SATA for i.MX 8QM have been
added.
Configure them for the Apalis iMX8 SoM.

The pciea and pcieb blocks each get a single PCIe lane, pciea is
available on the carrier boards while pcieb is connected to the
on module Wi-Fi/BT module.
The SATA lane is available on the carrier boards.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 .../boot/dts/freescale/imx8-apalis-eval.dtsi  | 10 ++-
 .../dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 10 ++-
 .../dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 10 ++-
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 70 ++++++++++++-------
 .../boot/dts/freescale/imx8qm-apalis.dtsi     | 10 ++-
 5 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index dc127298715b..311d4950793c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -104,7 +104,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -121,7 +124,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index d4a1ad528f65..3d8731504ce1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -191,7 +191,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -208,7 +211,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5e132c83e1b2..106e802a68ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -240,7 +240,10 @@ &lsio_pwm3 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	status = "okay";
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -257,7 +260,10 @@ &sai5_lpcg {
 	status = "okay";
 };
 
-/* TODO: Apalis SATA1 */
+/* Apalis SATA1 */
+&sata {
+	status = "okay";
+};
 
 /* Apalis SPDIF1 */
 &spdif0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index dbea1eefdeec..6f27a9cc2494 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -339,6 +339,25 @@ &flexcan3 {
 	pinctrl-0 = <&pinctrl_flexcan3>;
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-pcieb-sata";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&hsio_refa_clk {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_sata_refclk>;
+	enable-gpios = <&lsio_gpio4 11 GPIO_ACTIVE_HIGH>;
+};
+
+&hsio_refb_clk {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_wifi_refclk>;
+	clocks = <&hsio_refa_clk>;
+	enable-gpios = <&lsio_gpio2 11 GPIO_ACTIVE_HIGH>;
+};
+
 /* TODO: Apalis HDMI1 */
 
 &gpu_alert0 {
@@ -514,7 +533,10 @@ &lsio_gpio0 {
 			  "MXM3_112",
 			  "MXM3_118",
 			  "MXM3_114",
-			  "MXM3_116";
+			  "MXM3_116",
+			  "",
+			  "",
+			  "MXM3_26";
 };
 
 &lsio_gpio1 {
@@ -586,15 +608,6 @@ &lsio_gpio2 {
 			  "MXM3_183",
 			  "MXM3_185",
 			  "MXM3_187";
-
-	pcie-wifi-hog {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcie_wifi_refclk>;
-		gpio-hog;
-		gpios = <11 GPIO_ACTIVE_HIGH>;
-		line-name = "PCIE_WIFI_CLK";
-		output-high;
-	};
 };
 
 &lsio_gpio3 {
@@ -660,16 +673,6 @@ &lsio_gpio4 {
 			  "MXM3_291",
 			  "MXM3_289",
 			  "MXM3_287";
-
-	/* Enable pcie root / sata ref clock unconditionally */
-	pcie-sata-hog {
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pcie_sata_refclk>;
-		gpio-hog;
-		gpios = <11 GPIO_ACTIVE_HIGH>;
-		line-name = "PCIE_SATA_CLK";
-		output-high;
-	};
 };
 
 &lsio_gpio5 {
@@ -771,9 +774,30 @@ &mu2_m0 {
 	status = "okay";
 };
 
-/* TODO: Apalis PCIE1 */
+/* Apalis PCIE1 */
+&pciea {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_reset_moci>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie_switch>;
+};
+
+/* On-module Wi-Fi */
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
+	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
+	phy-names = "pcie-phy";
+	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
-/* TODO: On-module Wi-Fi */
+&phyx2_lpcg {
+	clocks = <&hsio_refa_clk>, <&hsio_refb_clk>,
+		 <&hsio_refa_clk>, <&hsio_per_clk>;
+};
 
 /* TODO: Apalis BKL1_PWM */
 
@@ -806,8 +830,6 @@ &sai5 {
 			       <722534400>, <45158400>, <11289600>, <49152000>;
 };
 
-/* TODO: Apalis SATA1 */
-
 /* Apalis SPDIF1 */
 &spdif0 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
index c18f57039f6e..f97feee52c81 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi
@@ -22,6 +22,10 @@ &fec1 {
 	phy-mode = "rgmii-rxid";
 };
 
+&hsio_refa_clk {
+	enable-gpios = <&lsio_gpio4 27 GPIO_ACTIVE_HIGH>;
+};
+
 /* TODO: Apalis HDMI1 */
 
 /* Apalis I2C2 (DDC) */
@@ -188,12 +192,6 @@ &lsio_gpio4 {
 			  "MXM3_291",
 			  "MXM3_289",
 			  "MXM3_287";
-
-	/* Enable pcie root / sata ref clock unconditionally */
-	pcie-sata-hog {
-		gpios = <27 GPIO_ACTIVE_HIGH>;
-	};
-
 };
 
 &lsio_gpio5 {
-- 
2.42.0

