Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96627AC57
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428902; cv=none; b=AwC2Erf+3qOUfv0/UnGT1KaGvi8qsqmackw1r5kd1FQkhwnqmS4rWdyod3LGXG7zmT0JjJCY0/hPg0cYgvlDV1ho98ivT94b8RQw/1TuRfV2eruLIqKoJKTkfNHzOKsCPXKe6BI1+JwmiM1hO1y5rgsjxCk3OvuqFLbEh5q7pd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428902; c=relaxed/simple;
	bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juacA0712PiSqnKv/T26hs5XF5YSr4betqSpcbKBP8mA5Xx9T0g/+A438DCM2EmwAbgOanwOAsMZpiYVfKzcQhcdJ7jAVepzdZftXAq+fJxJgSChGlK5RtY70K0/VkWp6NGaZpXOlB/fK0OsOpg6EwrBkAPzY3vX2Fnbz3JS9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s58b/9H9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s58b/9H9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-440668acbf3so4924415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428898; x=1749033698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=s58b/9H9Xb23FRjzD7gHPlTSFdA+ODYb1pzBnFDfVnrXU3V8L/pMYQiMmQy3NBvmQQ
         iBSI9pWR5nAs6yDkY0er1/PwDI4wzJG7H6dcrpSnGIB7dC6lYpy63yvFudToVZ2orKX0
         +zi8MGsGtQkus0m3ejGLN8PA24IhMjQhaPrOrrVCQBr70H6VRXgG1oEZr9OwouFXnh7O
         fGv3JGzU/dSHEmIFE6PbyGqgHOt1Ecfg4eW7azw+79+fS8CQSjU9h80eCw/FBGI/sbef
         Cageh0CB4d3jxhMHcxWtOQLsaQ2krssaC7fhWRiEWGok/cIEvDcaqawNJwPQ794OubBX
         bnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428898; x=1749033698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o7kHuq5fh1nhgrBmbItAcmZQfVjyPSWaEBF50baGeo=;
        b=PL9hBUpx0tjLpQiWF3YhVsIsBV45nWLwiKzWClNsKkVRrGGilp7398/lkPI6KcJBzW
         ckyDXR6zKKVTP0y+aJt63M38/YhOVByhOk7fIVPr4bEIp1FUaXIhlMCqpbqcrV/bEs2z
         4WaqhJ5punEQkAthcCb/hiPd7B7yHf5dVFwha3xarM1AG495aSTjP1p1cqtB2JU5B7Cp
         DOgPiwosGnw85nE+odwb2z0Dh1qKrlQXBaIxABAz1YJ7100DVg7rZZEf0r7AteRcEeOh
         5HhQwZLrDw/EbD8pQJ2Q5uyE22zKTrgeEIrA02OikYg2Mou60KwX4puGBUOf5XiAroIU
         dETA==
X-Forwarded-Encrypted: i=1; AJvYcCUdXI1YBj+jgoVmtFT1ZioId44YR49GHwDSuxj+k2mJsEqvrp1TPM17vCGsmzTOvz9JrMTqshJVpMkipgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSGAr/N1wL60bbmz7QvWVDnCStiIBg4SN83Nfa7HlEBSkvT3K
	YX4cZgQfTTbLrBKzxeX7mUo27U5epIUTqgj/M1kK49ymqA0AAbRaQlmlbV2N2Gt/Dk8=
X-Gm-Gg: ASbGncuEJ10XoqY4nzAgJmZttZuaJUuCFMX3ZAE15gDTHpqexqWl02yMf/NWFtXT93N
	tL62S6rZ1w6Isbtlsrpab67QIOsvfiF/V9G18H3LIv8drlpmoUQqKSim28s0Zjw4miarvwsSNLi
	Qgcm2Vtk1uhpLfOB9l9M0MluMlPGHj7q+Okj/JIha/YeGczo4AejhQq+KMj2kwTPd8rpYOUCFMu
	6GNeoCXLlfugl8A+L3Ie11mPQDfJOt7ZGSOR9ABhbBz+IixawFA9OKBpWVTOM8QVv1Hu1lC7Sda
	u6dSKsf32u3pyhVconnN4SaRPJ8zwflZopdLcTe8KpBLko9yvwHnfpmXdiTTL6oUaAjJtAo=
X-Google-Smtp-Source: AGHT+IEqdF3+R9PvjaaVFg6PDyOWyRZc3HR0H7gqLL2irDsUydaByqxkZ9IUn5cux0xSEgLuwczlgg==
X-Received: by 2002:a05:600c:45ce:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-44fcb9e409dmr26120075e9.2.1748428898180;
        Wed, 28 May 2025 03:41:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:40:58 +0200
Subject: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ctLoeYbHiiEBT9tiXppJUMjUFh7QHQFzP0xX2rdTSyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhKnpMXQJB0a7WYDcwZWwHu8C1P+bTuhMNNC
 +EXWDs6a8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboSgAKCRDBN2bmhouD
 11VaD/9bw31tjR68bxVpvaTyp/6cSym928yjCV9vR7oyl3BoFzh4W/a+7D30PLrsKSbtBC0J/LD
 ZSkuCuQRCTdT/n3XZG0T+ABgncoGE8an/aWUK1QeNySdpFSaEb5IitD03FUnLNTrxbziwX2OSOt
 6Z8A1nYodGD43IqazDQ2Xa7koDf9waLjKZ4MmbB8/+UkbSkzvm0UwGsFauOIvDrdj5PPraBwoo0
 W1X4sxPqQbmIu/4DVRh6oGcHsCwbTyAArmCXRUGcCavGlYBMYD0sfBZ14yAoyXbd+TywqhMmceW
 Tgtkyg/cXJ8JinZQIyzaHGnbQKLMukCGj+sTXlEyYG54GXhLmH3szir1Zsww23gOCwDK/qdnObe
 c/31A7IEOIftcgkxejUbOr2hcAttBy7peOBZmeIe2iHS2xV/0B3z4DN69SNuH7YSD06YPSnBrgv
 BPRrGVkzC6QpojpzpZYG1rdP1Mov2N6Xb6lFueCWghnaWhmNte0hYDoOi3sHyHcLTY1RBqCyKVb
 ghPKA7ZSaMhuw3XFjrTUOHMhvO/Qxo44gHjL9XbyoHVDmw2vtEczKKN6madwPnMdoxroiO8Szan
 PthWKLwLidRlevSuV3zpMfPWxCO8gOal4o4jOif7BkNZmL0L1ELFxabGoZqrimpzXrW9si4MeWO
 jCjZimWjAIxLjVg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
headers, thus can be compile tested for increased build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -269,7 +269,7 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN_K210 && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -554,8 +554,8 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_TB10X
-	bool
-	depends on OF && ARC_PLAT_TB10X
+	bool "Pinctrl for TB10X" if COMPILE_TEST
+	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
 	select GPIOLIB
 
 config PINCTRL_TPS6594
@@ -590,7 +590,7 @@ config PINCTRL_TH1520
 
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
-	depends on ARCH_ZYNQ
+	depends on ARCH_ZYNQ || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	help

-- 
2.45.2

