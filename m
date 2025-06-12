Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12520F07C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721705; cv=none; b=KtBmRny79zTuBJ7+RU2KmZiVw8G9NDqK8oHVnJMURDPXVo8HJPG6JLsX/H0ZEsS0MOWFjv5iE9qrX3TZ7FgQbI8D2+Cr25W0el2XRfRgYOyzyQnr1KOldTVaIyLsLGPi6Fc62Wfx3KIHuhnWOlYFmN8/LOAHnvPcA7mKxFA5PRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721705; c=relaxed/simple;
	bh=s0WO9dFDCSZUvYBIRb4/wfyft3Bl/vsjJiy9qqlHp30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAx2JPQb+GUbD+AV0OoW9hWzfyto/CmiGvPLTibYN61mR++ucDgSlfX5Vr7p4bwzIlJmkeQVmb69xymCJeB6mfJiCThyO/Fgydo8xJLhLRYHaPRGvaLA4ImX1mHVHuP3ME4YnSwtSuo/axJ2nI8jZN8Nnn9qBLCsuydSWaJjL+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuEdWg4U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuEdWg4U"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450828af36aso192805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749721700; x=1750326500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myr5poVQQENs/D3wsYBB3gIB4ThR6y3TggVy/m0W1ic=;
        b=IuEdWg4UIE4kilJpREpfxmkDoiRg7GvQirNGT/vU3w90JtXiO/PL2n+8FQRPv0toek
         xJkRnTDPp2gJGrMxmgomYC3btPnzATNhI0ml8T13YrJU+1KMXpljWO3Q7j84qdJQQxdp
         Ox5XXhXGs0JpA0IIh224NKWv7yG8Lzr2f4siJAIPYT1u+pjod2Vd9u/aK15KZ6rqYiMT
         WiGrsTd37uVLxeIBPOPR3o6kj6RpS8Z+MGPwgytLiO6SxVEKcnFYVJpi2QoXueE/xt9M
         I4Wi17cJC9ZK0jtTXIo8l21fC95NdNkuWW0eF62TvzVhPW3mqdjNTb64qYDuWmloENip
         khVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721700; x=1750326500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Myr5poVQQENs/D3wsYBB3gIB4ThR6y3TggVy/m0W1ic=;
        b=ncIniNqAWqXkk4YsWqYGj6KXGQoQb9sVU7ibCqDgJvcQF2IxdqA3f6Q+gsEyl+0HkQ
         enAGR8UBbPG9to4ZQaZKyGoadEsJm1NRVLBlvdVA8BSz8iJZk7WS6Iu4HoRGuVR+S78C
         Ly5jMeJc6V/pTK7hJIPIvpqWaZ/FLES36VyYrHw8BtFkVox1EEQcCbLMCB5ijwFPMx6t
         y4eX6yZrMWgsLXmayZYiYFaXAD3nPfCTSH77nRFYRMA9ylGq+lEucx1ojC/Hwi866PVA
         FNB5gxGW2cr5Qxg0a6mr8DzswzDHD1M6foBoetiVeTnnnUevOzVqrqnpdGnQlRUrTjgW
         04yw==
X-Forwarded-Encrypted: i=1; AJvYcCXAGp0bJ18XYToMXhHKYjsSh4Iw7P9/eHvOCfr+etAVaLHFJfIw7U8SLqU/weJ1q+1rwr7NrvghpJ3O1sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVeUgwQe/pGD/j0ONacrySP9T8+UjsW64wrUPfhGkQc9B/Tip
	j111KNZ+Xf8X4JjAUfk++VY5la47mX4TbaJfunKcgnRLj6zYb28H291swBMhJaFGayU=
X-Gm-Gg: ASbGnctKjnCjWzHhMri5bGEc1sMStnrEQLlCou8gyfp9s7fu1BCO1vrLzuK8YSuVtUJ
	Iq12FFalgJagXRtq6YbCDLPDUVAI4esDWJDxIc3MUqMGWZEDEQA4jCLY9eSvF9CpHQDHzcnSiLm
	YCK5sDSsXN7oZbo+Y+089QW1uz6BDc+WlFZMic/Mxqp0AvxaYwfeb4l7USEACde5ZNb7/MSZRSI
	tkebWNLx1z50Fb0aNrMs2m0GI0ukJExBDbnUM2d/1Z6t1CmN1bo54Q7K4Zg21JsJlsWyLon/AeL
	LYyKtBvtilP3RRjI3heuFdTpBrJmIepPJeG3JFd6FfHJa2MB2j+MkCI0ngKpARqaiO2+TZbv9w=
	=
X-Google-Smtp-Source: AGHT+IGQXEC55fXNFt2JcDplGna7M5lNHAnmfEE8oJ5P1ElgKnXBGbj/U/t/VrF0AYpAltsnHeHEgA==
X-Received: by 2002:a05:600c:859c:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45324875832mr17428305e9.2.1749721700200;
        Thu, 12 Jun 2025 02:48:20 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8bd0bsm15394225e9.5.2025.06.12.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:48:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] ARM: dts: s5pv210: Align i2c-gpio node names with dtschema
Date: Thu, 12 Jun 2025 11:48:09 +0200
Message-ID: <20250612094807.62532-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5159; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s0WO9dFDCSZUvYBIRb4/wfyft3Bl/vsjJiy9qqlHp30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSqJaVNvr5Yz4vK8Qo57gsKiWk04AUVgqe6ECk
 xIlKvemSS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEqiWgAKCRDBN2bmhouD
 14XHD/0Yd7qjZhOwXmX0UZYY1e7KP75JIg60MWwMUTtusGK+CZk2Q16AOMkU4TJrVKeEzu0f5XA
 mk2NDcSH1+XoY2wcAmkIRHTHDr5xah1V2950DpiIq2vpgpDCZ/lceMZuor3gIFmxm+yIm/usmvf
 nR38ZUs04llYMwekUBRhGvvvZhsfhBoDD37oOy6NAiBS4v1PJDvGGtHjzOHBgv6PALRrnxCeQ8Y
 ooNKR2OIu12Qk9rXrrNh1iC+jHwY7L6hMWNk8u7uwRZ2khiheJgrIZBis+D3FPBcX2mBCCUk64w
 cIC9lKOEtf6y1cOJ9gaLPBQPyyMqZxCeAjB9FZ6DMt7WAkvzx1ZG7lODoxEEy80bLJU35OTOpDC
 CqelG2bU796EliLF7Ac/bqe1Z+BiqHCWc/Nv/WTJxdVB17fQYaMQAo4tnJSSO2tMiNr5tFJRtDC
 kWGDYvqTuxSO8A4atYT2futOlWbzyauhwCJNtK5NqKr6Z6MT4XoJ9siiUGV4rWcizIR+4NBUJI/
 Y+ZFHzXOnnFfaCpjgQLwidBByuteJP+7/FpXO92WxL42GTbAtg/LD7gTMLJRH2qdwax8sHmrLs8
 YAHG2tlDvz/XHZz4TgbhEEf305sEYQr3mDLxN/NUiglK+oEFjKFaIpk57MoBij/wIOYhgRxuHJc L+dE2mFHiK/84Gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

New dtschema v2025.6 enforces different naming on I2C nodes thus new
dtbs_check warnings appeared for I2C GPIO nodes:

  s5pv210-fascinate4g.dtb: i2c-gpio-0 (i2c-gpio):
    $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
  s5pv210-fascinate4g.dtb: i2c-gpio-0 (i2c-gpio):
    Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'audio-codec@1a' were unexpected)

Rename the nodes to a generic i2c-[0-9]+ style with numbers continuing
the SoC I2C controller indexing (3 controllers) for simplicity and
obviousness, even if the SoC I2C controller is not enabled on given
board.  The names anyway would not conflict with SoC ones because of
unit addresses.

Verified with comparing two fdt (after fdtdump).

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Closes: https://lore.kernel.org/all/aCtD7BH5N_uPGkq7@shikoro/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts  |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi  | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
index 0f5c6cd0f3a1..e9ec2cc718e0 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
@@ -62,7 +62,7 @@ bat_reg: regulator-2 {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	i2c_pmic: i2c-pmic {
+	i2c_pmic: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpj4 3 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index 153514e80c9a..0a1a35f4f7cc 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -102,7 +102,7 @@ wifi_pwrseq: wifi-pwrseq {
 		power-off-delay-us = <500>;
 	};
 
-	i2c_sound: i2c-gpio-0 {
+	i2c_sound: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -150,7 +150,7 @@ wm8994: audio-codec@1a {
 		};
 	};
 
-	i2c_accel: i2c-gpio-1 {
+	i2c_accel: i2c-4 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -170,7 +170,7 @@ accelerometer@38 {
 		};
 	};
 
-	i2c_pmic: i2c-gpio-2 {
+	i2c_pmic: i2c-5 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -420,7 +420,7 @@ safe2_sreg: ESAFEOUT2 {
 		};
 	};
 
-	i2c_musb: i2c-gpio-3 {
+	i2c_musb: i2c-6 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -442,7 +442,7 @@ fsa9480: musb@25 {
 		};
 	};
 
-	i2c_fuel: i2c-gpio-4 {
+	i2c_fuel: i2c-7 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&mp05 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&mp05 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -459,7 +459,7 @@ fg: fuelgauge@36 {
 		};
 	};
 
-	i2c_touchkey: i2c-gpio-5 {
+	i2c_touchkey: i2c-8 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj3 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -485,7 +485,7 @@ touchkey@20 {
 		};
 	};
 
-	i2c_prox: i2c-gpio-6 {
+	i2c_prox: i2c-9 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpg2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpg0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
@@ -513,7 +513,7 @@ light-sensor@44 {
 		};
 	};
 
-	i2c_magnetometer: i2c-gpio-7 {
+	i2c_magnetometer: i2c-10 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpj0 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
index 879294412381..5863a1300cc1 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
@@ -51,7 +51,7 @@ key-home {
 		};
 	};
 
-	i2c_fmradio: i2c-gpio-8 {
+	i2c_fmradio: i2c-11 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpd1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-goni.dts b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
index d32f42dd1bf5..079581f4dfec 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
@@ -74,7 +74,7 @@ tsp_reg: regulator-3 {
 		enable-active-high;
 	};
 
-	i2c_pmic: i2c-pmic {
+	i2c_pmic: i2c-3 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpj4 0 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpj4 3 GPIO_ACTIVE_HIGH>;
-- 
2.45.2

