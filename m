Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B220E6E4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288833; cv=none; b=nLe59AmwPqKtRy78wjLcIboABUuYw5riQfWyx8exEMtTAKIRX7URG5UxEqNPcznJI1wDitaOcYoG6AEQrchAwc9CKeFcYp5FrlaqokEt8gQynbQ6v8++eMD4dlOWweDkyuMeUMceddfITdyMAIu5MYAWdE36L59hQA+1OFlHpzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288833; c=relaxed/simple;
	bh=nlwe7h7r3/BITiv4q+dzdvB5lKnHkIgxhj7FM6I1jnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWzKHSzm4Mpd9VZdR/wXdC5YO5iU0hHx7N4q9WkyHJg4J+OTWOKz3YJn6XrEbyGN7cjGftGZCQHYv5tR0HqnLLm77tTOmAkp68feKxLEUBq3ilreVddd6nXY3SK9EJ8O+CSXIjPDGL9pQjvc63L5zAnftZ8nIJDt4wlvF/Y/6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Mnu60MMC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Mnu60MMC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so7803950a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288830; x=1749893630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=Mnu60MMC9Ew9JCQaXtCWIYBHvwD0Mq2bgrsRlstvDNk2aqNENCUjPwAch0TC0o7HAd
         lUdVbL5c1x6RS4w8Adg6TmCHOv2nAe/pa2MCmsSySUPfJOpiUPqnODpprsZHscYoe5sf
         0RCqiDxbmT2+d7DJQeI8Zo8JfLG3MuM5g8OY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288830; x=1749893630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=XRo07knSMLZXkjLsiuIlEhijSO03agpCeLP40ESCUmFAkHPs7QFVGIWBsI4yao+zsv
         f8JTt4LvDbklekCSHh6g/HlqqwIWCb/44fc7JjLysIW0+C3d7PkuABj0FKLSgYiR0srF
         07bqK/8+DHHplEeAfueX1h4ZA9aW3QwHqyah+SS1221BikwM+UPuyisWBPOoG0rkbz4E
         sT88hX4Q1teoTpqqjqGrX4JngDacdXTrh7FymVIHf7v0YY7/MaiAOeYjr1SnXkbtJa9U
         ZnkJhJQ7jCblKEyLRnI3+m6I+Vq7foe5Pe49ynDSdfRVyaZ2ULcEKJkiAaMTQAVMK3uJ
         aG2g==
X-Gm-Message-State: AOJu0YzxwDZzzDxTcuEIJ1RcxzLge4HtGWZgMY+nvCUkbaN3KXROBKYD
	SoHFEGouIX7lVu6da7tbSU4olyg1TZYvut7u+do1x4JWY+kv7nKIKs57ST9W0Yhl5UJnYjg/AHF
	x6Mcb
X-Gm-Gg: ASbGncuSOJafIqESM4uiUvL7JIHEvJ+rIxNMdK7R2cUIC62BNmcMqf2Uw8peIM8z+J5
	7d7q4WIYETZUwJfRFdaKNoybrB1i0ph8ch+s+26ExlktqwzLuNLpqPnL1tQmAviaJnz3o7XyJUm
	sr6YKuqMlmFm6GVE20zAAhNztyHV6nCkWPOqrEsF41EMCoPONwdxeSxBoz4s6GmUN5V0ykv+Krv
	xchlN5Pb9l61BdotuR0Revcxq2mVUqRUWSyPvdit1LkkCWGHr3tCmp5eT4bvJwlcTeVpQMZ70kz
	YoK/AfJFIhkkv7pgyjvR+eIpGv1m5mTy4bwmF+DS7+JkjG90KFAwSaUfaYSxz0Xe1nX22D2H2Sz
	vMrXAz1G2VI59G0cUoAXnBREnB9wO3bnZOWjz1rVzZr1LAldHd5hf91Ts0grYwiQz6O7nqZV/HZ
	kXNPL004h8uPVjJ9o+YURjnfU=
X-Google-Smtp-Source: AGHT+IFwrSoT/bg84mvJeB5tJBoerkyokpFv/ZBrKGOCSANMJJ0LsqpRieQ9b6Ay4j+aF5bsl8WiDw==
X-Received: by 2002:a17:907:6ea6:b0:ad8:9ca4:af7c with SMTP id a640c23a62f3a-ade076350e8mr993166366b.17.1749288830301;
        Sat, 07 Jun 2025 02:33:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Sat,  7 Jun 2025 11:33:14 +0200
Message-ID: <20250607093342.2248695-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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
---

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..8588e9ad7b8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,96 @@
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
+ / {
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
+	local-mac-address = [00 04 9F 01 1B B9];
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
+
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

