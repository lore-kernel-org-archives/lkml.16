Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C538231856;
	Wed, 30 Apr 2025 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006125; cv=none; b=YJfSb2El1M62EkTpSwBM+cc/jTHijIVAJu+lMaSImz14TMQFd2mJjAEc2nE79+5IXsxh0HwBxFlQn1GOiVsSHBEc7CVRi3bIUphYMmVF8ZuUfBhk6hE7Zr1bJUo//aNaUaGK9SZ4BEBH67KOsga10lbu4czE9spsiCOUaU1JU1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006125; c=relaxed/simple;
	bh=7D2Ep9acFCW0yu0dO3CNwljDZn0Z+jApxognHWwVa/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qwdcU3G7XHxx1tX+maT/HSazYISeWOV76VLmBMpd8Yt8BcP1uUc2TCXQ8vKHkHg0ttwzgxuaxr8LnmUBQTXSHH3r51j+y8RyFiHECvnI+f8+N1Y6H5eMgJrLv1WRBSlk3HnCWmdownsNDBvcbs/BsMVVNNV4HjatVU2zg8ehqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=DIgppJcl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="DIgppJcl"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1529B1FC7A;
	Wed, 30 Apr 2025 11:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006120;
	bh=7NIEIJ/FCUKFcAXMy0195R/aYRKztB8r29LUVtuIC4k=; h=From:To:Subject;
	b=DIgppJclgxz+jRLz+hPnq/w1eBK/hGiuWLT1jcSZNz2IbfcdfjsrB+Y67ZbWjsRNk
	 UYj7mL/pzrEo06n6N55Qzy+HCNoI0Wd/moeM92WeOxN6LyoUoKK2RX0duadI/jhHa5
	 L7rd6jFTt5nwpM6KkoYKHsnkSy6j2A7zEfSOzKSj5gUJXx69ZnpQq/lmO/bktq6X5U
	 MOol6nJ84zmLOAjCRR8b/GT0qn6rD/rFd1Xx/NtC7UG98z3IXSTX63Cr0LHYdgyfhT
	 fDlD2oyHdMn4FQcROxN8GiO4MFXW3guUqyd1aTPIq+S92JCnHBOunWKpcoTDjcu0GE
	 uMvLqAHhVs6xQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
Date: Wed, 30 Apr 2025 11:41:49 +0200
Message-Id: <20250430094151.98079-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add gpio expander node to the device tree and the related nodes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng, use generic gpio node name
---
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index c4ca01ce60d0..0cd04c3c96bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -54,6 +54,13 @@ smarc_key_sleep: key-sleep {
 			wakeup-source;
 			linux,code = <KEY_SLEEP>;
 		};
+
+		smarc_switch_lid: switch-lid {
+			gpios = <&som_ec_gpio_expander 2 GPIO_ACTIVE_LOW>;
+			label = "SMARC_LID#";
+			linux,code = <SW_LID>;
+			linux,input-type = <EV_SW>;
+		};
 	};
 
 	reg_usb0_vbus: regulator-usb0-vbus {
@@ -539,6 +546,24 @@ embedded-controller@28 {
 		reg = <0x28>;
 	};
 
+	som_ec_gpio_expander: gpio@29 {
+		compatible = "toradex,ecgpiol16", "nxp,pcal6416";
+		reg = <0x29>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mcu_int>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio3>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"SMARC_CHARGER_PRSNT#",
+			"SMARC_CHARGING#",
+			"SMARC_LID#",
+			"SMARC_BATLOW#";
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5

