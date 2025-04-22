Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA81F03C9;
	Tue, 22 Apr 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322668; cv=none; b=V19Zt9TXsChURvbykcvPdbgucNTKWD9IeqcyPe8okpG0rdssRTodSExRVy2qnKMmr0quE5iNudcDUUoVA5Qa1595oA3iLWmChc1sJaUIgHGHU3Qxf9EfqGqU6FHwiQgYYLVYXlCavgXuS/4xYcZCR0+9erEQcbvGMb/3pTbQkBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322668; c=relaxed/simple;
	bh=VEhajbJhenyOwhDiqNi6r8q5OP8gwjnJXRhckqsJOpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRZM0O8tgk0bW50yEOaZvk1s8cClYQoWBPgof+vMyPx+E1K/9XFyloC2Mj/a/jKmaSyo6DeIstGsCfRxsalylVidiE3+U4Y0H7Ng03dCr2rM/yzZC4CggD3z6Omr5OMX6fjIUPGk/69Tx9XWBSIAYqTZgXdrCwAILqV1BD5xdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDZmkUj0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDZmkUj0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913b539aabso3041267f8f.2;
        Tue, 22 Apr 2025 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745322664; x=1745927464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=bDZmkUj0LVox8L2Eq66Z7NNMC7GdMSCvQjmnBaM0WA5Fe7E6vu7GsADfRMfZSYeBGq
         vPOtZ3Dzsy0zjFrQ8eXFXtkZumCE/YwI8ioESM9L25BmRTQJ26iJq68ryjLDiVR65nIr
         2Dir9y/MQ1ozXC7/60t531hdjkPjX7IchMWbY5xQ43Fyq7qQWocset2lg3xZm5dixAjK
         8i57UxD732oqwFUNsMCsPP6pNH1jEGKo49K7CXDV+iZJVxwpTJmvOpt6HleTzoXO2eYq
         tApT/WlJ3BNf1m6orN9ulsemICfUmuZDa8dWG7SMQxHBdTJocUAhZW/vuUeeXFtBmsYL
         bWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322664; x=1745927464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm+C1Hrf5PZav1kH12OZ68FgqFY1vN+rQWTlgliz2cs=;
        b=E1FVbgRJA6lBQ2tmjKkIDhcOpaNDs9rqUBbQ7cIOxhoqL7sbEuS/LLtHiBcVK8dkSM
         HTDGhXELKIKfi18o5j8/cT9WhVS7S+Hj1IktbJP7qn3H4U4sf3NLAzSjNBO8t/moYhpM
         BdpzxG+KAzsq3z1ZgxkI5hGlHDHCCeN0Igw08f/H9MA/ZD9mtQ0cZNe6eMkKCqBa0Gan
         Mg0fx3EI5YVUstA4GGAB4/LWFFcZrEZGQDiPsb1f2ynPzqyTGqCFxjjBw2ARC1vAWoLt
         kBRHG3UKerOU3a7Ygrf32nXPLIB3iI8cLlP5EE5oocZd/gQ8pXv2AqiArtFM37Afg2Dq
         yuWA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Eq7Om7DSuaKN+D1IupLXGW1+/97YdGhv0GbUcBJTeW0QuGMwEbLpWVHVMUNZ1cqqtlzkOIvJjS55@vger.kernel.org, AJvYcCWrn3EGrqKxOZZOVzsOXzMUW9RM5iGjA5L2B6dSIv1vtbUTKzLcPv8CxJ4ttBbfm/dANXw2p1Pp1GmHI0ir@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69szsrsmNYX3s2Z38KAyN5tod/m/ObVb1UBh/laluwKaTaQ+b
	QK6U5DaZa+1/iwUS/7Z7LIljwTOlGTMS4MqpypaLqUwUupS7LG6i
X-Gm-Gg: ASbGncvrtTGPDbTeSr4Bn+24vRKPngga4hPEqsn4cTNY5cWuCx+YwZzNwGkCmrkrjnv
	TTS8rQKW83bIiYaX5G/Xkiadd3FDzc3QKBgVcs/FnoLkoKQv5aFCHOWshwENc0Q+y3vS0N9DhxL
	cBmFxF97TWQKWC3pgAOGUY9x/99DPvmu3PrdGUc8lnYOEAh907N9/DMhoFcaJYVkLJIhxAoo51C
	b0lS/rhaiLztV7KhXl4mSDUuv06AqMExShN7Fq+/ZmmkDsZl3Fx8DHY4qiVZ/P6QNFt7jdQRgRn
	WZGFwCYz/l0nd7PRl26B1TkNryZU8NT13V3U2t4iIR8ZgN1cySDlo2SShqoLDhRCcg2PTrjl5S3
	xUy80L4il
X-Google-Smtp-Source: AGHT+IEDjgGNVWbzB6Xc4tHbi6ZRWUATDYuf4z8WnnwDr13qOhSHxOiNofBtLV/8u9BXBgZvL8GMGw==
X-Received: by 2002:a5d:6da5:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39efbb09d5bmr12222914f8f.52.1745322664453;
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm14767410f8f.101.2025.04.22.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:51:04 -0700 (PDT)
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
Subject: [PATCH v1] arm64: dts: imx8-colibri: Add PCIe support
Date: Tue, 22 Apr 2025 13:50:49 +0200
Message-ID: <20250422115051.1867349-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The needed drivers to support PCIe for i.MX 8QXP have been
added.
Configure PCIe for the Colibri iMX8X SoM.

The pcieb block is connected to the on module Wi-Fi/BT module.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 .../boot/dts/freescale/imx8x-colibri.dtsi     | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index ecb35c6b67f5..e602d147e39b 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -52,6 +52,15 @@ reg_module_vref_1v8: regulator-module-vref-1v8 {
 		regulator-name = "vref-1v8";
 	};
 
+	reg_module_wifi: regulator-module-wifi {
+		compatible = "regulator-fixed";
+		gpio = <&gpio_expander_43 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-name = "Wi-Fi_PDn";
+		startup-delay-us = <2000>;
+	};
+
 	reg_usbh_vbus: regulator-usbh-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -261,6 +270,16 @@ ethphy0: ethernet-phy@2 {
 	};
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
+&hsio_refb_clk {
+	enable-gpios = <&gpio_expander_43 3 GPIO_ACTIVE_HIGH>;
+};
+
 /* Colibri SPI */
 &lpspi2 {
 	pinctrl-names = "default";
@@ -454,7 +473,15 @@ &mu1_m0 {
 
 /* TODO MIPI DSI with DSI-to-HDMI bridge lt8912 */
 
-/* TODO on-module PCIe for Wi-Fi */
+/* On-module PCIe for Wi-Fi */
+&pcieb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
 /* On-module I2S */
 &sai0 {
-- 
2.42.0

