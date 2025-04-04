Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A181F461F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767831; cv=none; b=QpbdTJq2HObbrC0Ev0T4MEm52bQpJYSH0NuaRlfvdMKFGy5CBCmBaQPUiji5C9fmuG4d9oMcosIWsLG5lHRe7+65YP7NT8HvPWziM0zqGM9f3hP/6c6a8vTAKFLdcCkr05eQAZFkuCUOc8o3eOL7/c/dv7A+LNQnSx7AixrCwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767831; c=relaxed/simple;
	bh=uxxC2+rJC3Z2VSNCxxoKI1uj53Ey55YFQVhXgUJlMmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bw3JHn3bDUPs1emL0OYpxHU1GmJWEPbnRRS+48krJ8/FwoUlZiw923hEpFOB3oS3vYxGLWhiBoyblGaRVMntm7U6NpQNO/219YDNzIP/1Rq6juqQWY0QSE8/K2drnzQrZenHj8Gy9R9gSsZ2DLYj90itQEC/o3U0BBngEPjisVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KE0oJY8K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KE0oJY8K"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1880845e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767827; x=1744372627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=KE0oJY8Ko+uG4iv2WCdHr2Gz0AO0ftR+YrN9X6gnkJ7tXit85VfVvhiNuD1WFHrlfq
         52rIIqZAdJnQay9rnheQspL4GTZXqJUpdG99JD7W9xLjySHrEaU35VhZ0aQJVRtZC5M/
         Xu2sg4mZoCo8SvJZzWqGRxioi0VlR/8jMh4tVziF44PyPb/UaJYaMRHCOptkTMUaaTkb
         l2B8MPHz0LLVcr3JiHlvqsaICvZv8sey3QKN3IwetYnofuIeWV1+Bc3+R0gyCdwI+RCN
         Remnt121HcJztRmineUjJ/aPC9vAc9h3YUm6e7/zMSPVgpiIjqth5zmLm8P1mojfXBIy
         WPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767827; x=1744372627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWTh0iUxbFDZj1OSxB2YpSs0Atj06C+ykZmPKxNCsxA=;
        b=tGqX8BqJZ0loTIPUwYPhb4gIeyZvBjvJnOSuLrTD6M8XNV4qSMjaWQEvTtP+c++JVc
         rn0L204RUyJ2IrbUwmHxBfDrc7s/fwph64neAMMKs9og+SOh+afJBQFl5R1KZqTamkUS
         XdFA71i7mWiMRcxURFYnxNX9mcFxsaEJcUJ2xmOkJoPSDkephDXuvNbZ6Xwzo481sKFu
         /vmRYxJnYilGbGfmRwbMWguH6mw3J/t8kR7l3VyxpPcic0AJiOpTW6dYjSXXnC+Lm1Y/
         Gi/yHMIDjf0SXTSnkrmxKFCTDQRiPQS+HakuYJ2XGhG+sdLxjBDKbY6cMFj5sOSF327x
         ZPMg==
X-Forwarded-Encrypted: i=1; AJvYcCURTqF7uOYyxIRBb5ofwJIEmyUe8D+GAZzNMGVU2ot0i0Flg4FLx1y8ktc3tcm86TSAkPFJr07koYJYgHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzM3oMG9Ci5x2kK0TRxT6EeeRthRsiHPdKZIqDUm6kXw8VpDSZ
	8BDzOVMacbwXaPplfr/V3aUAWO+SPcSovic/g2oEG90Ra/QDGvj3rlNs3W7pVbE=
X-Gm-Gg: ASbGncvoCLGmcUmMa7G2BFL+vsceZx6P9OxD8vu5Lbq8uq6gmvQ2JOP2pshmpOrHTsy
	bAH4U3Qj1FRV/dP/jrT7IaEYWWZ3KpNgNg7m/FHWXTKtVbjbUgakUMhtdRDky3VmBQ13MFfc8IZ
	75HIgBGOmimIPENqo7lYIp+QsFdMkqRNsjwToUDtg2l5adL8TkinGHz/vkfiRmRI3q2kWhYvKK+
	7tInnw027f3gHQ+yaYhF4ypxHp5Ksps2MfP8Mg6z773Xq3C1c6mzu2rt93cdRdpMDRV6qFeFNgb
	4QscgxU7XmE5FQNYho5B+aShs9yYNDaEix1BHVqSO4J6xf6D+dNWWYpgmUkvkZ4=
X-Google-Smtp-Source: AGHT+IHHD7HuendpPytpQj7rstsIi+Mc3ng61xMnf8Qu66Hus393p51dcdiyAL39bcJzERvr8KKSjw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr9352835e9.6.1743767827420;
        Fri, 04 Apr 2025 04:57:07 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:57:00 +0200
Subject: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 5830a9d87bf25d536ac787fe83669c64c8214952..8896fd052ef1784d60d488ab1498737c1405deb2 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -9,123 +9,123 @@ if SUNXI_CCU
 
 config SUNIV_F1C100S_CCU
 	tristate "Support for the Allwinner newer F1C100s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUNIV || COMPILE_TEST
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1/R528/T113 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1/R528/T113 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_CCU
 	tristate "Support for the Allwinner A523/T527 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN55I_A523_R_CCU
 	tristate "Support for the Allwinner A523/T527 PRCM CCU"
-	default y
+	default ARCH_SUNXI
 	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
 
 config SUN5I_CCU
 	bool "Support for the Allwinner sun5i family CCM"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN5I || COMPILE_TEST
 	depends on SUNXI_CCU=y
 
 config SUN6I_A31_CCU
 	tristate "Support for the Allwinner A31/A31s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN6I || COMPILE_TEST
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A33_CCU
 	tristate "Support for the Allwinner A33 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_A83T_CCU
 	tristate "Support for the Allwinner A83T CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || RISCV || COMPILE_TEST
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || COMPILE_TEST
 
 config SUN9I_A80_CCU
 	tristate "Support for the Allwinner A80 CCU"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN9I || COMPILE_TEST
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default y
+	default ARCH_SUNXI
 	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 endif

-- 
2.45.2

