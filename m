Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46621B9C6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610529; cv=none; b=eqsjzs8n4UpvWdhqAWx3zu+82a0fsQrjaUJ0vAYDYq66FGAp922+uj5bKKFjfhc4Jmz6FJdvbVUW3v1a9U13ipbQSSJdE+WmGYorctZuqFuzFIS929tDpHqT6aUh1Px+DtP9OYxPdlo/Z+L8XeA+MrJuYpZOvr5rLpBm9V41oCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610529; c=relaxed/simple;
	bh=42Bpm3LHEmtVmQsrqnD99bk04O4x432C9JaHWtmjDWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lpzc86PdWVgHYK8HvWaqkCYR9RqveeQ81Pls+ruRLvpekbppmqECyOoFXHLQG9JlWHdWcVbsatn4wJfQexpzLqX5yJU3/LCmlfT8IQXtbWLAyk1rEYJlHRA3EUztYpKP/EJZCWG/cOKxMg21NcynRbPG8RirTa8OIgu5TCa2GBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4Zx5apM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4Zx5apM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so3420865e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610525; x=1746215325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etxEC12lMB+ejp9f/Y42bos7wLJ3Y7W974k3fpFSzHk=;
        b=R4Zx5apMYw+3f6GwbDPSG/z44mA0HGPad2bMycDuCrkMiNKBjyoEcWZv7sP8gET7R+
         1Uyjg8jlAEdWbe+7v7/+FhMJgzCDle+ubnO5Mnr3X//6o/+9AYCopczAdKkrTEy/MInY
         qTPH8vYMWFgnJ5boJuPUY1I0OruCHg9gUhOOe17xIBj2HEvg2OpAb8ZZ8dZKE4AMOTP5
         RhQLOVAkBvZHrBsinK8MgPmlXVO4ZrIG6PjBJD+xPPh7b0Hqacjwx3eVeK+QuxIujr3d
         yxJsORDaqAR1O2kCcRTZmgEh6+WNJQRXr0BdeXAkYZycCei7fg1hCNvD4P4HlXVI5bAA
         TV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610525; x=1746215325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etxEC12lMB+ejp9f/Y42bos7wLJ3Y7W974k3fpFSzHk=;
        b=M+kGHiHhumHWSUs4At+jCAqFb9qmCccBycDLZhZkJcQwDYrgBj68yNZEwgwjSd2II1
         q+mnKrBZjYTo/XdBvbXIBbGPJL1/W3dzIjp3cu42jNgvJv/VZzJQx03LAeX8+pTwyt9p
         GpRpb1d+ejUbGHNC9VldRGcFSE+m/UbCmLh1x3oDv3SX2meUkdp9whrjkVfU97alXyqv
         768oXnQQB++fgwCBlgtFytMFdf0KmbwzcUFE1cg7wch7ZPBasJ5YHF5j6QEPz3RX+tfY
         2c1KUyB4HyoGstTFgWaJr2G96/31OrONVobsq5MXr5yLqVA2D/mVff4vukwfeLvKk7k6
         Sldw==
X-Forwarded-Encrypted: i=1; AJvYcCXxgls7z4IpS0EjlwPEw6oAp3u/+aNF8A9+JBBFCvMR6dqNT/9rKb9GN3T8BDvKfwHdlvKldEeetrHmgFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTC41yh53XH8TX8nQoK13sQ6nA0e7lehNkn9KBjNq9dGzqJb/d
	5GhwNLtlulImbfZovIBzN90HdQlHkCpjN7mCVStbwD3/CR3BMIfny6ZBnrUB1+U=
X-Gm-Gg: ASbGncvLVP7ldNf3nae3bvesuduJEUG9tIIR9h7MGO0VOHSj6fN06McDGbacSTy9pWO
	haCTf7ue/uaGM3lo8/C5rqLxNrHjudkZyWWkDcipVZ42FVx+nRMXsaCtMEMVFQn+2GFIeYo/72S
	o0teRp2ClngiZBcJsrbF/WfrsrwlAyqGTJyTW8YR0ddziXavKHVvWZg6AsLyJn6Ww8a8e2wJBbh
	c2EaAsQv8xcEHIRdTJ8UwJfSO0GMsIrp9YbuTNy8qN6TFyQ+eKM1urK70RDDNB62p8IS5BCrBh7
	Rh5BdCB7oQo1IBBjRj2cyazaIMGnH3Uv3C2zK5V1GxWluc37xc8R9RXAGVgPYXvOLJEaWA==
X-Google-Smtp-Source: AGHT+IGZVtZLkR9nxPkUbvzOCdFjLRhSjWHRmpkwHUAsb2AXquVCMi3+Gvn4z8qa544N9iD+XiVgsw==
X-Received: by 2002:a05:600c:ccc:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-440a65ceab8mr12011905e9.2.1745610525364;
        Fri, 25 Apr 2025 12:48:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:28 +0200
Subject: [PATCH 5/6] arm64: dts: imx8mq: Move Ethernet aliases out of SoC
 DTSI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-5-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6930;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=42Bpm3LHEmtVmQsrqnD99bk04O4x432C9JaHWtmjDWU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cSrpxTKzVN9MQW5WEKhUCnxySOLJmHDaUV3
 1rTpgOcecKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnEgAKCRDBN2bmhouD
 13A9D/9AxkwwLjRniz+C+Uyac2kCQOPoMKIv3737edtkN6sEd6hYzK2WxGqFoiNRGYAUCo2r4F7
 ZeBJbKngrwsS2oc6FTeOTKoQE48MGvZ4zns1l23uXgH0PTozqTWOwABIG9FmROWoyoNRjM5fFDB
 8njGYm9AOJc3KJvBgmKILVUQOeblAytOyRn8R2mv5Gl1+2f9zEZMCCEw1qwqEVkiLMO2cAAG/j2
 olEVbusgWYM+T7GOrW51JvwL+Vdz0R7iU/4h+u76LGltprGq9uJlLjtvnSYe3dwFtJRmf3zwNqY
 GAWzY/Je82zkk5iYgmi9/GlHfRNBu/R+t7FLlDrQt1+41eSIhWzJ7dDQ+7v/qxbwsVq6ziIg4m4
 FyRWcpCKHJp2uQ32PnSVCCQCyQMMSg99E2YCv50DkpaNlrS0SjxIiTZ0RZdkhbIUaPYAL99uK82
 pRnuZTntNYQGsnWTPYEEsixouLVdXzeH+PAsofKvNQUbkT+aeP//pMtNmUHCSBkgQsEuJFCqmBi
 MvUBHpBLtr99DCLyJubZzAfeRtNLMRdKc9spMtnV3A7k7a7G7xkyUcqwzoC8h3wqwJCiuCwe/Zb
 E8aTzYw3uB4SCexXFymPkMV9+Um5NOrCH2AxpAoS/aPtFTmRMclVfGIBN1vfKVJC4uvOJF3w9tG
 zwvwnDyvujCMvGg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts     | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts           | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts           | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts            | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi            | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                   | 1 -
 11 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index a87d0692c3bb372f77c04d5190e3741f93a142ec..1d11ebf1c8449541331aea51a6b2841f6e6c790a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -12,6 +12,10 @@ / {
 	model = "NXP i.MX8MQ EVK";
 	compatible = "fsl,imx8mq-evk", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
index d8cf1f27c3ec8a33b7ad527c1fc2b489747a2d84..6ab8e2e07b8d403f1fa00ebe2e381e8e7ac5699a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "kontron,pitx-imx8m", "fsl,imx8mq";
 
 	aliases {
+		ethernet0 = &fec1;
 		i2c0 = &i2c1;
 		i2c1 = &i2c2;
 		i2c2 = &i2c3;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index d9f203c795197a8d02e6bfa831df6eacdefdc4b3..b1726e0a46bc591f617f25f9fa3ea39509657aba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -16,6 +16,10 @@ / {
 	model = "Purism Librem 5 devkit";
 	compatible = "purism,librem5-devkit", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	backlight_dsi: backlight-dsi {
 		compatible = "pwm-backlight";
 		/* 200 Hz for the PAM2841 */
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be0271f8c5804faf63eaf51aafde9875f..0794abfcb8ac78d7487bde8b2d7008f1b602bd31 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -14,6 +14,10 @@ / {
 	compatible = "mntre,reform2", "boundary,imx8mq-nitrogen8m-som", "fsl,imx8mq";
 	chassis-type = "laptop";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
index 767819cce886cea8828fff68150f64fd21ad8f89..d84f566b85fd6918052040a71b9915b44c7cb846 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
@@ -12,6 +12,10 @@ / {
 	model = "Boundary Devices i.MX8MQ Nitrogen8M";
 	compatible = "boundary,imx8mq-nitrogen8m", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index e34045d10a12fd8060b0bb5e512ca7d4eae95695..bd9e41e09a03cc692a2228dbee8cc6c51a7cc0c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -12,6 +12,10 @@ / {
 	model = "Google i.MX8MQ Phanbell";
 	compatible = "google,imx8mq-phanbell", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts b/arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts
index ec89b5adeb93d4a0ae4f8338117c196039961241..e9e54558d77e86744954fa55c9b3f562bfa3c7fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts
@@ -15,6 +15,10 @@ / {
 	model = "TechNexion PICO-PI-8M";
 	compatible = "technexion,pico-pi-imx8m", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi
index efc00f4abeb12ce41325ecc04b50349106a56337..915d14e9961830f181298c9cc394b42ec2f71a62 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi
@@ -6,6 +6,10 @@
 #include "imx8mq.dtsi"
 
 / {
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	reg_vdd_3v3: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
index eaa9d0c0fcc180b42301be5641f33b1ecb6649b5..9b3d9d235ee114b147322e6f7d9cc55fb4e90ba4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-thor96.dts
@@ -12,6 +12,10 @@ / {
 	model = "Einfochips i.MX8MQ Thor96";
 	compatible = "einfochips,imx8mq-thor96", "fsl,imx8mq";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	chosen {
 		stdout-path = &uart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
index c7bbba45f368525e0afa3e22e10bd76b5cf372ac..04dee72be03757abc997a4856c13e778ba5ec056 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		mdio-gpio0 = &mdio0;
 		rtc0 = &ds1341;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 07925b387677b35766fd0e7ee4b8aff99b587c55..c3cecbf60d8276bb41c58d7f2bc71a3b5d2d97d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -21,7 +21,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;

-- 
2.45.2

