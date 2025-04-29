Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B07725291F;
	Tue, 29 Apr 2025 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926299; cv=none; b=W/snAhNHAbREEQ6QoKGEixMuqQ7LsJqswfXyTUazrIPIqRyHIHWS7ZjGUAQLj2IKpTw7PBZ9NixtWTx7ISi/CPBdoVnBHQmC4Bai6bfevF3GLHtxEnXu6GpmoZPsiAytOxt+bhpOP+ZsmX3LVbze9z+4ITd1SoMEU0BFU3Bl+NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926299; c=relaxed/simple;
	bh=hJ9/xMbFZ1auCXeEumyuc8pjR7+H6EOvLh3/XqQbb1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c9lZl5EbK23pB1IbpuuIXb8lODgGiVF93Kt8+cQ/UgP62VSLVNMgAVnsA+AnThOEpMZy0bWmyIT+K5Oxpk1KP3n7aU3fKi+h8ewQeQcy/JwwfeeGAciMK510FkpWC64wdnjzhqQbhV/CgAAUfyoO21ePV03SDI5MlHmTUzNq6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=L1/KTm31; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="L1/KTm31"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B2B391F9C7;
	Tue, 29 Apr 2025 13:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926290;
	bh=WGtQcFOkR3P6lXc8Dxo93r1W4pTAA0FrpNH5NilciEc=; h=From:To:Subject;
	b=L1/KTm31msK5qiUquI9I+shB1t7o6QMWrV5Fu2FgrsZusPXh5DQPdMHG+b9jBgolj
	 C6NqR+o4q50BAH3yBKSjo6JDEFAlUZ2mnh6KVI51xX72EtibBnGYo3Zv6gzCK/MnQ4
	 5MxSjxn+Dk99q/XYc6/ZFDpb1DM5uSK0fCiwof+Vooffavp+vdwAchpf2pzxSAiW2y
	 l0hRbeploNUGE5/1QUpDpy2+HiK6gv0FZTUJ2FgDgK5b5u5J+0jasK0U7uXbLgIyc5
	 /rpScbXN+4Qtc6sCHLtoWxBB6b/NMYK2nKjMpPMsbzXg2dIYxwqDfxGM2KPERBDSPD
	 W31miQThzMYgQ==
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
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 3/4] arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
Date: Tue, 29 Apr 2025 13:31:18 +0200
Message-Id: <20250429113119.124427-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add gpio expander node to the device tree and the related nodes.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index c4ca01ce60d0..de84e7e52efd 100644
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
 
+	som_ec_gpio_expander: gpio-expander@29 {
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

