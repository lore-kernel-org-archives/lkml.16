Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25C2E06D9;
	Tue, 17 Jun 2025 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171982; cv=none; b=siH3jBSm6Brux6N2lBGmBCug/X7+iwiJvRsRn/QYvsiab6DZdtCLirT1HEKW+EKK3zDMBIAL/4y+4lmJudXpV0lXGkIBlXMpMzJ1kl4c0skML8HWHzniswkuumtPjViA4puq99GJhxskj3U6Y9C1fqxAZh056mq0H05y+7cEUqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171982; c=relaxed/simple;
	bh=VAfKq6qGNL7z+ko22Uplbze1TDDi2TapEsClIC4UEsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dnFRwDx372is7mETDzvS0pQ95nuZSjH33zOuQYdL0khGVep3PbhxutB9W7iX+GYrI8Z9yuz1qtHtVp8YkmXzO/YV3aLTTdST/S20FQbdz6UCBvR62rm5p54wYkvHGSyvxL+sc5GNQ98ssg2zGTy8aHbYHa6ciDIkc6BMPS6PZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnki1BAi; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnki1BAi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so12926844a12.3;
        Tue, 17 Jun 2025 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171978; x=1750776778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=Qnki1BAivBGvVk6/pndlrOc6PgdCSTfLRLINMUe4JOlUzVS2rcPfD8RGRvP2AIiG9h
         8n7w2+tRSsLojGpl6K4knXQibbPACaCb8GaBupdLvCL1mRvuS+0JVixZNDUBtSmMhgtp
         k0Jf77SkCq3+A8vNZ0q++9Q9WvHl0c69I15C2mVfDM3MBgdwp5eq+b1rd0jeY9LDnXCA
         Kzdxwk2sVpV6/yOYe2TdB0DD2C16sR2Zh4Lq+OJEB2+nxyOKcwQ4dlihIKUyu6avVfI9
         PNJ3n/Onm0l38WHT3ZI6WHA8MlDpCIkPQQvlm8IuLZx02j1veTnobrfcHVZKLhBdVyMG
         eKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171978; x=1750776778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtW5JtQayEuGFuLB8bwS6fi5taZNSc9e/Z9Cc1Nt+Y0=;
        b=OaFZg8ALSQVxjFrQN4/NxD4Eat4XMArEN1nF/4b2hhc2/V6EnuH29uhIi07ziMc4ym
         c4lwbGFvBAncch/bjwM5rLO4Y5UilvVOEvf5x7sZNQmoTCvYJ0gR0FoIkvqnJqlmwp1V
         +HmPNAYDhwTcJKAhAGwhgtv+yrPG2bZlrnv+jNdOHqrsrPlDveI0j8JMQCRey/kP4ILZ
         DoKFReLadFzpt1+QU5aE2UC3lcc+T25nR/Uwtq8VUkyulhzvlY+T0k+DhfBpKWxtKIcB
         NWwXYTZrw2AQSfLONmg9QeM8WySw4LIDZgBglbOa9tUS/lB3YhM5zNyf/86FodUrztj0
         wRKA==
X-Forwarded-Encrypted: i=1; AJvYcCWjAGXFcwoCdgMDrqU4v+Hy8eRAfZCqqnoExGNcP3gYKy7pDSYM12FkkQBmiFpCPvH1Z1DwzpaGJYlU84pH@vger.kernel.org, AJvYcCXbGwdtMsqesGGMuoVsow5dp0vXQnvWtUr+cbp1Q4rIQ0Ad7Qnp6SzLRmTdyJ1kW9dsXpQc+K966eQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5n8uU1wcgxDTjDL1ki8DgV2vh1/rd9RsTzLC9i+OPtzaSCXD
	5XgNRRwZabSLp4oiBEN0v9TlxTG/7WG+b6896+bWxJatP2bUN0P323Nj
X-Gm-Gg: ASbGncu3okEatp9gYE0pvtyIlV5+nNIHe+B56SPKA8o/DVShHfy02W7nSkTEQyB7/q0
	vFwUcF7IQKu9Xn307vrbVU41EvoNetu1NnXjax7EAILB/y6cogNXZwf2zO8R2l4uzR9rUgxoDFI
	ytgab1Hs4Bss7MGqeAhstWCyXMjHLRJmScSUvWG1gUWWL0ATWJy5CRbsEDGTAtgHaR1T6IbQpKF
	NEgL85q4TfOCRoXnj2QpACE2WBj2MsCMBmPEAuuDu2KCb1OEu5/6oMh2HZdsS/uAlZmBhrfBdJh
	5l0nb6SmT10m1kMv6SZnOcSLLDyf1RbNwiI/D643QoSGZ6lz4xWvnDseamxE4bGKFgCQAyYkuEJ
	+O1D8RIqXq91FghBSo/jCZaw=
X-Google-Smtp-Source: AGHT+IH4znlknzxjUuzAcuPGkxhqPfS4ORXrTA1d31lol12/rKTAlx/Bqtho85nLPCL5G4FiwkKZNA==
X-Received: by 2002:a17:906:f584:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-adfad34ae98mr1370234266b.27.1750171978175;
        Tue, 17 Jun 2025 07:52:58 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8qm-mek: support revd board's wm8962 codec
Date: Tue, 17 Jun 2025 10:52:20 -0400
Message-Id: <20250617145220.1131165-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
References: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The i.MX8QM MEK RevD board is a reworked version of the i.MX8QM MEK
board, which includes some sensor and component changes. One of these
components is the WM8962 codec, which is meant to replace the WM8960
codec present on i.MX8QM MEK. To avoid having to introduce a devicetree
overlay or another DTS, the WM8962 can be supported by using a virtual
I2C MUX since both of the codecs share the same I2C address.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 101 +++++++++++++++----
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 353f825a8ac5..e1023ca55929 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -131,6 +131,72 @@ lvds_backlight1: backlight-lvds1 {
 		default-brightness-level = <80>;
 	};
 
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		mux-gpios = <&lsio_gpio5 3 GPIO_ACTIVE_HIGH>; /* needs to be an unused GPIO */
+		i2c-parent = <&i2c1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8960: audio-codec@1a {
+				compatible = "wlf,wm8960";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				clock-names = "mclk";
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				wlf,shared-lrclk;
+				wlf,hp-cfg = <2 2 3>;
+				wlf,gpio-cfg = <1 3>;
+				AVDD-supply = <&reg_audio_3v3>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8962: wm8962@1a {
+				compatible = "wlf,wm8962";
+				reg = <0x1a>;
+				clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+						  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+						  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+				assigned-clock-rates = <786432000>,
+						       <49152000>,
+						       <12288000>,
+						       <12288000>;
+				DCVDD-supply = <&reg_audio_1v8>;
+				DBVDD-supply = <&reg_audio_1v8>;
+				AVDD-supply = <&reg_audio_1v8>;
+				CPVDD-supply = <&reg_audio_1v8>;
+				MICVDD-supply = <&reg_audio_3v3>;
+				PLLVDD-supply = <&reg_audio_1v8>;
+				SPKVDD1-supply = <&reg_audio_5v>;
+				SPKVDD2-supply = <&reg_audio_5v>;
+			};
+		};
+
+	};
+
 	mux-controller {
 		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
 		pinctrl-names = "default";
@@ -314,6 +380,21 @@ sound-wm8960 {
 				"Mic Jack", "MICB";
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&wm8962>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN1R", "AMIC",
+				"IN3R", "AMIC";
+	};
+
 	imx8qm-cm4-0 {
 		compatible = "fsl,imx8qm-cm4";
 		clocks = <&clk_dummy>;
@@ -511,26 +592,6 @@ &i2c1 {
 	scl-gpios = <&lsio_gpio0 14 GPIO_ACTIVE_HIGH>;
 	sda-gpios = <&lsio_gpio0 15 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	wm8960: audio-codec@1a {
-		compatible = "wlf,wm8960";
-		reg = <0x1a>;
-		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "mclk";
-		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
-		wlf,shared-lrclk;
-		wlf,hp-cfg = <2 2 3>;
-		wlf,gpio-cfg = <1 3>;
-		AVDD-supply = <&reg_audio_3v3>;
-		DBVDD-supply = <&reg_audio_1v8>;
-		DCVDD-supply = <&reg_audio_1v8>;
-		SPKVDD1-supply = <&reg_audio_5v>;
-		SPKVDD2-supply = <&reg_audio_5v>;
-	};
 };
 
 &i2c1_lvds0 {
-- 
2.34.1

