Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950071EEA33
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767828; cv=none; b=kjr56sBbFFGq/4UHqH3t2DmxFrP3/z7qHD1lWfQZ+OvSAg9pakpD9IBUJCZmw3Nfr4czQPkEPIJP65xoSkmQyWNr3hhWsTQQBPfqOK/wsV/a8OjhBDoHOmpRI8fT+DEvTN0MwR8ZbpZF8iwmSf8LjqD9qI5+53YwKNUHPNb2gUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767828; c=relaxed/simple;
	bh=YI259iMximjELrxM/8u/Qw6/mJUi2mzFrILZsHdPMf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPZuhvbbdV16LZOoE8uh3PdVSr1SDymCJw8a8FevDinpbCQ8DussyQMKMMfYOwwud7L4tNSSeRJ4YMSa31ihCdrPk7l+YCnLLBfT7I9cQE7W1DrKcuYIHOM83RIcYofumTiYlO+yPgFz9kmv8JpmTU+iuLUIkN+wzDQyJ8cP+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6ESB9MA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6ESB9MA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39973c72e8cso195031f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767825; x=1744372625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=r6ESB9MA0w0jbKagB+LZhmE19V47nFepnBxnlxPxrkR/BailqdFKJKdMlXV342S82q
         RxzhM5vQuLfxM1zReNbDxpL9NJO2MA4iRjeeosrPVlycZwMcRlN1zIR0Dvwx0mbpGv/W
         V/Bhb7kCCy6ZvTGOwaja7+Dn2IzOjbr8sb2f2c01+o1Nnfkvy2HtwIVE+RA3ua0aYLEr
         I2lssKaOD/ci3CeMGDElKPZUg2zugnCnehO+8WgSrj6z0sgNsfexWYDTbY877kyqOyBC
         nn50PJ0P96fOyFdCxPdOoaKeCEKPm4sd2fxXyIuS3F5TzKqg6g/LCUTY0iCLt54wUmUv
         HGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767825; x=1744372625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=QBX6LNLhAyQlRF2/UXu2LeAwBst/Ljnz8gt/oy02y6wL9EyWTXubkd0ZSD/bckPYW+
         XVqsrasKGCSzNEIIji/bnk24r8CAjYKtaK/Y3Lomvb7GnsdS6O57rKODndPqE3/64AUu
         skl8O/QTeVg0eNKgO6SyJXOQOqiRQQRspiPwtbn8Ti4LfMCNJfMAb0rHCJ+jsaGY2WFa
         fm205qe5HLpWhRX2k2fx5KQHNcclXCScMbDQX8H7YWiZkUZlWChbzLxFC5WhBt+iOTsk
         mbbzpLX7GfVpLCMjkEr9A/9xYE53bXI0Nn6sVmsqWyJ8A9nFys+pLHVt2OePC+qmDDF0
         z19g==
X-Forwarded-Encrypted: i=1; AJvYcCWVljPo6YM11xr0Yf/X3NQPYTUztNqywP66Odf/eaB1tBwRqWfWizn9vqHDee0TUIMmMOhwY1d8Jp6TUfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhR1n56yE8oGB4Tb6ERTt6d80ogMYm5DK3qPrBkIgE25jRYN9v
	UlA5JaMjd3+wZOqmUVgfRTUv2SFjMjTMO2oVSfets7Dgb0X2d/6otZ+AwsIAE88=
X-Gm-Gg: ASbGncuWohKnJyuJJw92hUXIfULcPBawAVHvsorUHh0QcTT6O58mQCtDySj9nSlUimK
	4CYTgfMX9Bm8hM72dSBll2u74cXu0aV1JVuZiJRBy/8f9j7XOPwLsL6J5MC2bY7S/Q2G5xlHTMa
	5FZInpEZRk7KTCqIdIwVopAMVSU/duK7LM61N+SoU9scx+ciiIcexPXeF3W5JzcxXhwUkJiWUou
	jAe4nfdxHGMU0kBxt5zXcC1O3fhpXPC6sq2b0ELKIrlao0jGfO+OypqxVS+y4gUjUHjvMRgCBE8
	5Ng6IC9Rc+OqNA7a90QWWqk9FfGOE8zA8F1zqzZw5LF27esxWURbPy3hEImYpwWfVfv7dngxHw=
	=
X-Google-Smtp-Source: AGHT+IEbqWVdAZjF0/qLy/H0JxxfBZjOz1OHqDHaLpBpQad1gKc6l1hGJIvzr71knts2F+y5b2ubng==
X-Received: by 2002:a5d:64c7:0:b0:39c:1258:17d7 with SMTP id ffacd0b85a97d-39cba94bb2bmr852989f8f.16.1743767824815;
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:59 +0200
Subject: [PATCH 3/5] clk: stm32: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
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
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/stm32/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..4d2eb993ea0838d408ff5b1e5b6d028cbcaa9301 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -4,7 +4,7 @@
 menuconfig COMMON_CLK_STM32MP
 	bool "Clock support for common STM32MP clocks"
 	depends on ARCH_STM32 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STM32MP SoC family clocks.
@@ -14,21 +14,21 @@ if COMMON_CLK_STM32MP
 config COMMON_CLK_STM32MP135
 	bool "Clock driver for stm32mp13x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp13x SoC family clocks.
 
 config COMMON_CLK_STM32MP157
 	bool "Clock driver for stm32mp15x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp15x SoC family clocks.
 
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp25x SoC family clocks.
 

-- 
2.45.2

