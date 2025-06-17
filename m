Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486F2DE201;
	Tue, 17 Jun 2025 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171980; cv=none; b=sM+e1ujQ4jmLF/Vj1ne3XQV8ho6R4MeBkJV+hMUsvY2Drbh8B+4I5Sg6uaP0DFZe/+/eqZ3DP0wfl2T+WLZ7fa5whUj8kqeX9aWa3v3PrJno+hAPvB1W6REK/nohX1BtsBRUEh7/QtkA0GXRMwYbaY1ryr6Cez5wpGf6pbBC8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171980; c=relaxed/simple;
	bh=s0J0zHVK7eOhYt6YfYQYyOEVSEgkosPc1x9JfD3iP1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMUBZGb1Or2643J03L/Gp7H1n/+F0g7MqFQF7ireqBtKpOCf3Tsy9j6qX/ghiKol0Jyo5EboAw/s0lLy1J4AJ/pRDxcHIF/wmBGU/he0rhkq8Vm2cF1gVqbvJAsbP8lsoRPC73bNG3Qj14KnYLoe12bI7+fKRjVmidmAqUgXAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHqhtPHk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHqhtPHk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso7552541a12.0;
        Tue, 17 Jun 2025 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171976; x=1750776776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/y6UpSCNA62dZIucPryUmUTc08c/RNFpCO7PPFXPF4=;
        b=WHqhtPHksLMlQfTMv6anXQIpxaDyw6I09Zki60adYgTaZvk4AqhnONYIYf/NdU0ua0
         3C2wKc1likHqgBjy4QlXnLkaOkbEWmsrecN9LMMkyE+Qa2XL5u4MS4OynVeZpSbIb8pM
         Sc3dVGOATKykEh8fCK0GmB8cwub/g6LsrhvKMfPMtEQUb77cDpGUCxMAOV74Fcr7jLzk
         6AfRrkUuG+HV5/c/2zF9NB4qbQcKttHQAzWCL96j+6E3I2R+lBinFipuDet2X+VqEeSD
         PZoacdLWlgI4PIbNEUdtoXcf+A2UFRaQz8FrjP+MhUdvywVPlg2wSKriKuawKVZnX/tJ
         6J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171976; x=1750776776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/y6UpSCNA62dZIucPryUmUTc08c/RNFpCO7PPFXPF4=;
        b=tYm3k95sonjERnhBK9IkG6STdObcgBSkRl/3/IA+0CWHJ6Nxfg5s9w3tLkX6jLHXRI
         4OzksRZ/tXZWRZmNjzM5keZT9JKnyxfpW/6TV2i5s8VtNSgY23nwqDM3D9HR90zjiGri
         bXB8F4TjlZFvMdAVTLF+2GnvE/b2dxbnjheh7BAV/eOh0vyOxESbDkNUQxiMNnV6TupE
         vwwRnw6cqhcqF8Tj0f/0BA5woQKfYr2SxzHmss64YokZRh2VEdN588QNB3KN4Gfi2k2m
         uv9PzBz0D8ILIM6bV60SMm5APZ4WbErrzDGJAq82AK6lF/2LeO6Fxlfc/BYwbuWM7/TR
         PzFg==
X-Forwarded-Encrypted: i=1; AJvYcCUEfNRuglT0toD5qXnwEq9ZRbe6Tywo2en/EmBfy0TN1Cedzom5SQkq9FS8twv3Deq7OfOzMTTneoWxNviZ@vger.kernel.org, AJvYcCWCCrr4lBegt0CHZz/dwK8uH0i0qRYavm7gUE1Yecsa3UEx/04U6wHSifpO7c+zR5Vh8nbrJQ3QVXD9@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyBgGyI8Br7uoEuMeSPa8AycE/M9mwh7yzcQ0r9dly7pPdB2D
	8HMGO2iHvPl9Tr/GTP0GQb0e4xGRdAve9unMQYX9VEnNmzgpV5xJzsEz
X-Gm-Gg: ASbGncu1MjZvOH+8W7Myc55iw9ZqgmjcTfEBQNP64KnPuOoDzkvY35NhMQTydMY2RJu
	Qnh0TOs/8MU1850ukbKuEJrCVsSH2WpKzIEdUyE0vUtZApLMcfAa3ee3rlx0oi4+86fLiYXdYg3
	lA247LSa63vX/06xb8DIcVW3BJG8c1bjiK09HBTp2KM1jxlzZwue7mIBTuv2KpRt4lwvxS5UvJK
	gPBAGNoCPfj/l+IiE8LGicfCXbReYZXlzj/GPheNvJGThtqSmO6UJzB2vzSQAecExfLJPwthNHm
	kb6u6NzUxya7gPdoiG8jzu7kBymc5wJaZRMe0N0aAwVegY3wVyhbw698WbRKYvfH6cFAItNodmE
	yNgJxk8vVtS8yUUuVjtk0Xak=
X-Google-Smtp-Source: AGHT+IEZSDzyRtxrQnGm2AhPyrRTVzxmewbBOlwTyNq6Rp9877ZwBnTJ1HhbQpt/6K73DqX77rkvHQ==
X-Received: by 2002:a17:907:96a4:b0:ade:3dc4:e67f with SMTP id a640c23a62f3a-adfad29b8b8mr1173387366b.9.1750171976516;
        Tue, 17 Jun 2025 07:52:56 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:56 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
Date: Tue, 17 Jun 2025 10:52:19 -0400
Message-Id: <20250617145220.1131165-2-laurentiumihalcea111@gmail.com>
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

The i.MX8QXP WCPU MEK board is a reworked version of the i.MX8QXP MEK
board, which includes some sensor and component changes. One of these
components is the WM8962 codec, which is meant to replace the WM8960
codec present on i.MX8QXP MEK. To avoid having to introduce a devicetree
overlay or another DTS, the WM8962 can be supported by using a virtual
I2C MUX since both of the codecs share the same I2C address.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 103 ++++++++++++++----
 1 file changed, 80 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c93d123670bd..38ebf06f2c40 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -64,6 +64,71 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	i2c-mux {
+		compatible = "i2c-mux-gpio";
+		mux-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>; /* needs to be an unused GPIO */
+		i2c-parent = <&cm40_i2c>;
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
+	};
+
 	reg_pcieb: regulator-pcie {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -248,6 +313,21 @@ sound-wm8960 {
 				"LINPUT1", "Mic Jack",
 				"Mic Jack", "MICB";
 	};
+
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai1>;
+		audio-codec = <&wm8962>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		audio-routing = "Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR",
+				"Ext Spk", "SPKOUTL",
+				"Ext Spk", "SPKOUTR",
+				"AMIC", "MICBIAS",
+				"IN3R", "AMIC",
+				"IN1R", "AMIC";
+	};
 };
 
 &amix {
@@ -427,29 +507,6 @@ &cm40_i2c {
 	sda-gpios = <&lsio_gpio1 9 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	wm8960: audio-codec@1a {
-		compatible = "wlf,wm8960";
-		reg = <0x1a>;
-		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		clock-names = "mclk";
-		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
-				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
-				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
-		assigned-clock-rates = <786432000>,
-				       <49152000>,
-				       <12288000>,
-				       <12288000>;
-		wlf,shared-lrclk;
-		wlf,hp-cfg = <2 2 3>;
-		wlf,gpio-cfg = <1 3>;
-		AVDD-supply = <&reg_audio_3v3>;
-		DBVDD-supply = <&reg_audio_1v8>;
-		DCVDD-supply = <&reg_audio_1v8>;
-		SPKVDD1-supply = <&reg_audio_5v>;
-		SPKVDD2-supply = <&reg_audio_5v>;
-	};
-
 	pca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
-- 
2.34.1

