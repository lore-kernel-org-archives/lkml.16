Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12F20F090
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610522; cv=none; b=RTbRLsFNvi8FO8iA3Eq5L0Fog7/9+lw7m5/qNh8oWAuemOTPODaOmJhhSMNSJ01sAjL14fwRU4fxzvq/wrXID3lqUEqZ8j/oqNH/0SzXurr8tBd7YUsH5lWKaoDzaQ5HWNBlI8PEuP4bnuMGW06YsGSQNjLiI5+Fru7T8VkYI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610522; c=relaxed/simple;
	bh=3nO4VnjQYdiRE93Jm8TiezOlk61htEB38J2trNtm8CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFPQzjvSqLw6aJohrnazVOuq8BawNOnYn6XbnofcKpnh70mVg2W3L1Eo/FSYzQBvJdY0xSD3KQGx2gkUkrhuQZYGThOopBgddHOOM/2Zp5K7OS94SykX7ugPKIrBKPnLw7jbd4N1EMNUE+lpOelMoI0958/ObHidpZMnTV5CuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXRAuEE1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXRAuEE1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3191615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610519; x=1746215319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpXcnovWinsYVCqQ5oTKECuPZPlUX4I8oy6VDRcWxpc=;
        b=pXRAuEE1PYBVCSq0tzcLNcjcjvQ0aZW79Dbv39L2jnzfwDi5kZEVPexHvqGp4M3vMD
         8Lpq63GNj4TLvRDTkHJk2G2ZWeNJzRMJ/qqq2gkjfzzPD3DOBZC66QovoSN61QyDpGzc
         qa3+ZWzE+nVJDqf3Wz1yrfnGWCp2aPjfH2Ymm1LSIlIfd5a0AMRpZ+z4PYqo3byq53sn
         ji3Ct0LWqHIOXDhff+dfjGgTtA8g7XgrIWERuzCJBnVU0ZYlALGQfn3ZUpQNP/CSdC6F
         7ENX+ge958uccLn+PkR8g/s4+AA4wh/LS/sWJDuBq3f/48C+peVgSe2LXFLlu4IhEclY
         z+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610519; x=1746215319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpXcnovWinsYVCqQ5oTKECuPZPlUX4I8oy6VDRcWxpc=;
        b=p2vLsV6g7cDT0EvUyb+nYsVhOr/JjyqTs6XIjjS6LuJDagxftpPgu91dsv70G4R+pY
         xOXP0BUirN57Fe/polKb+BXm741O89zMaQHpZERVvssxyx8Qb+XscyFdh9TvtijWEXlv
         G77vgeB41J6s04DtZEFEpX5YYs7M5tZVxl/xu2mokT8y8vLzfrEeZW1reXd/Jb10n0/+
         f8QVMGFzCFoHqCe2I9yzQEg24So5ItHvNXeob6EUcO/X0+2MKCQGQMS+7lDVn67NpSYI
         WULL99rX95gX1lQUmkuLpdxIHT4NRhWIIROdvmV0z2Ld14mFHXkm0cYCPg14JmVPyEGQ
         AY1g==
X-Forwarded-Encrypted: i=1; AJvYcCVO0RxeQf6/6bkR4JyHt4XzIuGDm6VsiiUycwTft8VBPB5pAS3Nfkh4/96uSG3mIq65X1fuz/1Tto4VAHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnyA02BpMYELej1h0oSlfVshwCUraWj5huStGrs1Dhu0Ta3VLa
	lXznXfEooqf+kWWpnrac68UW6L78ED0Q5sYTKi20WjpE4NRdYlTlN+9kj6Qb1Qc=
X-Gm-Gg: ASbGncsRPgwPvHzgh4m/i1KEfMbCm1lybKegre66XQwGaC0EnvySDmixvGqBcthcsRt
	Yks9wBZxdksD78oabuWQiQOX2jgJTDWkra5NEK0beTPOdCDuH6RLQuqEq4N6YNmcHTHHOlt+Mvc
	eTMwwuuaPFlQLc0byDKDCwScc4n0SrkU6MKCTEE6J1uu6fRILEMk97sVxUBaWTw92IZoDAsmlCg
	Inxa92WXtXKE2QciS/BYps+kosGhPk5RtREavBNyf63GrYK9At5xoQ6WhH4NbCnRui0TkxROXgY
	Yyznysil7Tm7jn7Uk3shtFcOhZM449evueSa3VqMN+rwG3qDHnZpO75wpUEfwcEDOtO5gA==
X-Google-Smtp-Source: AGHT+IHRqZBqJkZjO0mitzu3CzYyV21ZT5Y2akCem/fgDU2yyxukK6COGTfisLBqPKgA6rVkJ2RM+w==
X-Received: by 2002:a05:6000:40e0:b0:39e:cbe0:415f with SMTP id ffacd0b85a97d-3a074f964camr998386f8f.14.1745610519049;
        Fri, 25 Apr 2025 12:48:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:24 +0200
Subject: [PATCH 1/6] arm64: dts: imx8qxp: Move Ethernet aliases out of SoC
 DTSI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-1-15b9d5cca611@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3nO4VnjQYdiRE93Jm8TiezOlk61htEB38J2trNtm8CM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cO0jxEu7fTSVXD+grEAB5mtaGYKM/NqhPqM
 EY7HpNzfIGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnDgAKCRDBN2bmhouD
 1+NyD/94+FK8H6crh1/uF1W4/NURW5TctzERkargXwjN+yT87P+dz+mKZpeNj4YdgcyvJaHGidh
 qk1xrWfVXQhx8YgDIaBNYlLY9jPlOCQ5XJOAgrex3/AKf7X1ngtmu9XS4+Uis1DtIZrmbeebhZ9
 nohamtR22KSlDG0QZAnUirLsExyg/LMW+UdEbTTn19vxZwBPwcJqy1n9T/81IeOwqDWLN7PLtC3
 /En17nWBJS+Ser5tHo0N5c2D61vOjMhPfJJst5kjCw3sNYWUs/jesgNlX8abfBYjnfQhyrgi6p1
 TKKu/Dec//QMZm+LgCMzYt1Nmh+fF8a55upqDc3UkmGeoJUvDVZFTS3M0e5PpqyP2RFY0110dMt
 zNh4/3GCftFdAB/b/fV18JmjC2wWTA3Bb/1PZu9dKfp3C8+6Qh75cpVOnPXlwWnfS88CYbwsijv
 mF3/eHOH/l8k7gGUq/IKrmN/qxYQp6FhDhpZ2Z2V7YYa2jGHweEIiclbmvutTFTBShJS1ITUX04
 XIyRMKgqysuGU2hil68KyhA+XfoVB9/wrpgPEp4Dkvfjb6wt/4Od1lY80SmUReD/Uy0yOTcJirO
 oyTlSNbOE2XHrNOjSSk7C6dTuc44mgU4i333FMb+QoGSbYjwP8uXDY3UxsgLJ/mcsL4ifnw8+f4
 EGs5oNLoZvuAwyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts          | 1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts            | 4 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi               | 2 --
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi   | 6 ++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi    | 1 +
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                | 2 ++
 7 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
index 50bf7919c86305403dc9fe2d75ee312dead03b40..2586cabad31ef61594fbe74247d3868639095320 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "einfochips,imx8qxp-ai_ml", "fsl,imx8qxp";
 
 	aliases {
+		ethernet0 = &fec1;
 		serial1 = &lpuart1;
 		serial2 = &lpuart2;
 		serial3 = &lpuart3;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 4ba8ddd472234704d05db51fb5fb0929e6b15567..b5b14cb20cbef9a67a7661531031fafc702dcbcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -12,6 +12,10 @@ / {
 	model = "Freescale i.MX8QXP MEK";
 	compatible = "fsl,imx8qxp-mek", "fsl,imx8qxp";
 
+	aliases {
+		ethernet0 = &fec1;
+	};
+
 	bt_sco_codec: audio-codec-bt {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a572f45122f5ee425089f945fdc656..6d8386bdac00d150d272b62ad68c136c0da6ba2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -20,8 +20,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
-		ethernet1 = &fec2;
 		gpio0 = &lsio_gpio0;
 		gpio1 = &lsio_gpio1;
 		gpio2 = &lsio_gpio2;
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
index f7bbb2153ae01a2e97f1e28be0c23f9de4172102..7be0b9ecc8aab1f271c1b658babdb316bae41cc6 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi
@@ -3,6 +3,12 @@
  * Copyright 2018-2021 Toradex
  */
 
+/ {
+	aliases {
+		ethernet0 = &fec1;
+	};
+};
+
 /* Colibri Analogue Inputs */
 &adc0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
index f75499765d85dc78808af9ddadc92e133b0c3499..a7159a842d74306f372db793959cdc8e2555eb3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
index 54393a0c5cbfcd55dae080a9f07879748bbd4486..1e588d76a6ddb1bd7f94f444d72e2819f267c490 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi
@@ -5,6 +5,7 @@
 
 / {
 	aliases {
+		ethernet0 = &fec1;
 		rtc0 = &rtc_i2c;
 		rtc1 = &rtc;
 	};
diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index c4b5663949ade617fe9b7be20a3aebf0b322623a..a64ae67ef70cc6a624b06f4ab1f3a8ab03ffd1f6 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -16,6 +16,8 @@ adc {
 	};
 
 	aliases {
+		ethernet0 = &fec1;
+		ethernet1 = &fec2;
 		rtc0 = &pcf85063;
 		rtc1 = &rtc;
 	};

-- 
2.45.2

