Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7A2367D8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408067; cv=none; b=MWkz7b8yY7ahZsQaFtVXz2Y6iKqdxRzlpXn6Z0bWDRPIgFWXB/JMIocJjx1ec/M5JR0YHZwbDi1iy6AJC6jXBK78sExDeNEra2+SB6sRBX5PQklr4n6N7DIkv4DFqoki3K7koitjbm9//nY+Ygjti73oUS2UUvtKEX5NR4s8liI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408067; c=relaxed/simple;
	bh=33KJWBkI7rM8jT4VqOLvllhf3AJjAdnqppvUHNnIlHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEjFEB5DPIukS6l7vTT6zJf/VPv0nD8LLZotrd9xSytAL2KNsCQzKDUTiuO6WcUV6KtdJdDKPvViLDleWoiN3cbJK3rr/1OC0D6Y9gqrOhvyESGW+SOwl5IabaTlCz23tRpZyZFeW4XMWdZy8Ailiiuo291ezSVrSH0OHCOtHb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Rit6VGxB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Rit6VGxB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453608ed113so14816325e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408064; x=1751012864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=Rit6VGxBKoG+0u17bG6EzpJUpxcaMRsF41EZhGfHlNuP+mjf72gfGutR2E7Ay3AuDb
         fOEbq0NsfcofBf2fUDzx+bBXrJx039cgNotSBRVGiGQyfUXp/M87wu6/Cd8uaOo1rmOY
         tQugpkQqS4Kp3GRUU4Kx2xBKasGhtwe9AcxlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408064; x=1751012864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=GQcqUhW7wxs21oH0rbhje6i2oS9gjdrfgYl/c1bsozxFUagH49z9KK/YKt3I3/sKX5
         RQRzj2KaFweCwNx0HyNJpnhSAyFbqo1KmiR+sI3wG6PQbJoMrp+n32xX9vcDvVpzOXjd
         m6098RFVgmBgpPt8i1+uJSH5n9bgmMsrR+XnFPu4wSjuIPY3dIYA/zgIVHW78xkURrcf
         R00R0siZ4CfhjPvNqykINEbKuEc9Aot9H6beaH8jLVTkcoo6YL5C0LV2RzvSTOSYFhdx
         Gfvc0a6PdjtD5S0lElXqBl9adN0ycWUU1RAAhtsfoCr4vEvaupRvsDQexW2S/XHGZ1s/
         Ft1Q==
X-Gm-Message-State: AOJu0YzclLh73yF12IKyTn8eOKN1WAoKRYt0YCibeuSERMg7OxbCmoMv
	XAd0H5RWMBII0Xb9T/aQi229lwBFRAdK76PEk6rL6KnnrelKGWhZfLW8TipozPNk9sAwQwN1+tZ
	PcSAg
X-Gm-Gg: ASbGncuZCocU1hkECm+dB45dqo07qB8JWi5i36gY4S2GymAxoMzs9ODq5WgOYZt/W75
	Yn14FI2b/9qYutfnxk+0P24T02X4Gl9IB9sqeyXHQEfCr1FiL+7l7o34cHuKycTxkr58u19LTaL
	bjESzQHE7/PUNUYE8uMvkXY337aBlrEdjJ93HyajL2Gwg+/jE9r5ERf0dzdiOKmjOtI7XVvYdP9
	o8PI0VuBTA5VR9OYG+reQwC99l8ccb8UMDXnEM+bNu1YKtXcVIcf4wrSpTR3t2ljt3uA5eLwaPn
	nkaSB+ybFfjCBrcHDgtoNK0mkNNLYqIT/plBdzuGTKpkK+ttwmu4bo53hW5RK9gGV6E8yPh5RUX
	eua7unZECGAvNfBpEQ+jhOD7lZnB3TdeESbYbg+j6PpbNSr0AlmhB
X-Google-Smtp-Source: AGHT+IE1VwtQP6Ch+qDfZ8PP/Yh9iWUHsjDPpN07ZYphZ4du01lofihUpMs6j9otKEFfHCIR1+ACwA==
X-Received: by 2002:a05:600c:3b8d:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-453659f82abmr14480255e9.25.1750408063697;
        Fri, 20 Jun 2025 01:27:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Fri, 20 Jun 2025 10:27:06 +0200
Message-ID: <20250620082736.3582691-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam MicroGEA-MX6UL SoM with:

 - 256 Mbytes NAND Flash
 - 512 Mbytes DRAM DDR2
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v4:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..43518bf07602
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+ #include "imx6ull.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+/* NAND */
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
+		>;
+	};
+};
-- 
2.43.0

