Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC72147EF
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 22:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536374; cv=none; b=DMH5Fv9IlxB0Hh9PmTlM4u5eBvsjAa/EyUCdxM0Vu0aT9f8JFkpnyBMmnMfj5d+D8DjRcNPof02slxgjRVHB0Dxcl8EaNRC7e2RaHOQLJvpTTs2nhTNEe5IwNg8CzXyAKE8gvQVcoBxbeCxRLH4diGl8bCqhZshkLTWQilRwSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536374; c=relaxed/simple;
	bh=T98S+pGzdNbmV42AhYuKYRj743FzmMjwgcSboUSxCBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s41WdpwbOuMa7NFZGD+Y0EwBI4CeQLrTQXwW3CoMgSFYRKsK6V4KqUht3m3SxqMfrAaR0vQWy658swtmQQwC5FoCGHjCzluCWKUuT+oXEncNW+oTeu/O1rLyqgOzRS3OUCy7I190xEabInrY8grsK/UrNqXsko47iNe1sBlUNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wQqwNU+T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wQqwNU+T"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so38123535e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 14:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738536370; x=1739141170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5vcQu/1K5FdqOrNwmQFEJLgitsrpGAB1g81pZv85Gk=;
        b=wQqwNU+TOXYabLH7TgAEL8TtA+fi3G22fxKiMtiWTEP48J7mTBoDWBeACCrUzYUEdL
         RlOKXtyOVV2S/Ydn5uj3hTpC0SDiAQdMY3OEcT1RfYQ3lCQlaJ8p6MAm3gx/Q5wD+OeU
         m01ltsvgjOMbeXzkCY3JFHePZF+Yut0JMLhHNvC+jaXR05O5Nqg/1MBHD/TY/QMsrLnQ
         5HQIcVwOIXPYbkUhS9+xv5Wbe+5A2GB5LOoCxtnrHr8wJGpKvnK7xlcI3qRFwKc5jmXg
         JEDM35u1eGX5yHIV55Oetiv6MI7/jLS3l4Ooy8iAS+sEILFIG9mtzpmBw5IDUVyQ7hcP
         kYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738536370; x=1739141170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5vcQu/1K5FdqOrNwmQFEJLgitsrpGAB1g81pZv85Gk=;
        b=n93uUjDhgB/pK+MOafIHdKUuraXZU/8tRyOhH0Xvsq8jFlg/wPJ3HOYg6BDJiklnxM
         xjUb4gzmje15tJwYD+bZtPSjSaB9291W1d+6tftPhtHdR6mJL4qkRT/sCuZDgAbyaqJK
         K1LR6rBkqB1xwcs3dIyZRghpqxUKA/smkD3LVjQSY9w42cTj1/paeQ3o7Mvo7vt6egL5
         3Fppo6BUsRBSo3M6e/bB2e6IskZi4vxg7/tKyr7yMsC4lE13EKhHWeiy4xrt3EF8d9YJ
         baBS6WA40CdqNQ56GNHu9vKj3161YzrJN/SPLubWmU4iOCNFvdU3EUMKmhcz1Z0pnn80
         qjvw==
X-Forwarded-Encrypted: i=1; AJvYcCXrDopHFSNjWGV/hR0nU4hp6cVqbjXehOpBWGL2CozMooZLy9JrDJk3NwKxKqC6ISugVnyusddNNkis1cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwihQMFggiIj9aJPMqOaN1mzpB9KyCkgTqH+eid7vDXo4svMfjR
	ILCiKK5xcAQxFgOlO/9n1VvA1tOC1nJqS9CL4MV305FGR1Mm1L+y9MFRsCST5GcIhaISsGhvD+z
	q
X-Gm-Gg: ASbGnctMOSCxLmQ0Lb5j70OECldvVBB1b+Abp9Mpn7jpqJQyBEQsPnXvarkN6a3lPQq
	qAZIRZ+ZVbPRzBOIHeO8nToCL/gaE1KVVKffVK0tVIbRxb8Sd/Wt5aevmrnTxHjlNBmv9myEBSv
	+baPH7gU/lJeM/+I6c1nrRAJTv737KeteKa4GxNJhPZBDPYda196s6u+1vM+GK4DXsnqq4VM+u8
	gUBgDibDNDJs7z19+ljhfjth+KC44fHZU0RKja/xLrGmzDBEPKdanlON700dflR2SOpvh/ncfJy
	+9k32C30m3ayzFrrR6TXiN8dUcs=
X-Google-Smtp-Source: AGHT+IEOcyz26yEYEBloIAD/eX91w98+oR2t4ySWYh7FM1CTMSxD5pq38//Ho8iKHeR37e70liW4RA==
X-Received: by 2002:a05:600c:1c1e:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-438dc40b8e6mr154115045e9.23.1738536370155;
        Sun, 02 Feb 2025 14:46:10 -0800 (PST)
Received: from [100.64.0.4] ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm170849605e9.34.2025.02.02.14.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:46:09 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 02 Feb 2025 23:45:51 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-fp5-display-v1-1-f52bf546e38f@fairphone.com>
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
In-Reply-To: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Configure the MDSS nodes for the phone and add the panel node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 94 ++++++++++++++++++++--
 1 file changed, 89 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 389eca9b9e68187980e92ac921a77a3c3b54f6a5..965e32473a58ae4748e4cb748980fad1d2b06ab6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -138,6 +138,34 @@ vreg_ois_dvdd_1p1: regulator-ois-dvdd-1p1 {
 		vin-supply = <&vreg_s8b>;
 	};
 
+	vreg_oled_dvdd: regulator-oled-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "oled_dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_s1b>;
+
+		regulator-boot-on;
+	};
+
+	vreg_oled_vci: regulator-oled-vci {
+		compatible = "regulator-fixed";
+		regulator-name = "oled_vci";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l13c>;
+
+		regulator-boot-on;
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -597,11 +625,6 @@ eeprom@51 {
 	};
 };
 
-&dispcc {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_EDP_CLKREF_EN>,
@@ -733,6 +756,46 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi {
+	vdda-supply = <&vreg_l6b>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "fairphone,fp5-rm692e5-boe", "raydium,rm692e5";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_oled_vci>;
+		vddio-supply = <&vreg_l12c>;
+		dvdd-supply = <&vreg_oled_dvdd>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi_phy {
+	vdds-supply = <&vreg_l10c>;
+	status = "okay";
+};
+
 &pm7250b_adc {
 	pinctrl-0 = <&pm7250b_adc_default>;
 	pinctrl-names = "default";
@@ -1026,6 +1089,20 @@ bluetooth_enable_default: bluetooth-enable-default-state {
 		bias-disable;
 	};
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	hall_sensor_default: hall-sensor-default-state {
 		pins = "gpio155";
 		function = "gpio";
@@ -1033,6 +1110,13 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-pull-up;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";

-- 
2.48.1

