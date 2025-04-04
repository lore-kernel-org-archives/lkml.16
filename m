Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831F1F0E47
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767846; cv=none; b=GzFyIikA1pebpAEXBAmYJPhBiPLVo499c1a2FcmCyYIX82/EWF9pHsEPMfP+jpfGXPA6sbk4T+QKcWJR6K+LPYMSOd2kdvmt14h5tyWoqS135YH2kdkv1JL0+KjusCJOWZui6JZNjv9DUJ0gTUP+kyOLSkq84qz5QYmRpdIroD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767846; c=relaxed/simple;
	bh=ua5zgSNobMAzdOd3gGboXIkQUVeUMK5UKTmz1jdpjmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiYo9Eee9LeRXBVvT+TkB881m1shQB3PTWh2qnHsurEAiOpFsDRKR7R4XtZtICxMWiUHk7B19DvjjEHZ9yuudFWHU17PkL6SyZ/IYeUorSgPW5jbBIL5P17v4Muxs8VBkRy/AeTTkInhZoizC3nCIkU4Knq+fHE/iNlHPojlqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=adcyiKhl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adcyiKhl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39127effa72so177494f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767843; x=1744372643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=adcyiKhlByv36kKW009qNqbAjIymcypcbpQty+vq11AcRCuhVI3iiKyPpSpJ4u1B2+
         KLIbhiB+SNi6i/rS0IaVETZxBU/W+EfQdp0/1Shllia92pFXCukjjff0ABMjnMLqUTPv
         fGsUywHlbW2HzS4RRvymW6nKjJ8FF+Hq9qVvgqUsV2PdqOZHTt3nBFt1LSr8zRv6Xmxw
         6XJhdiBsvo9M5rDdB98BWLThAvnsZzpMlgcCCgZiV85YYXLcIDVIfGYwEJEqmVdf4jnI
         Qy1slrV0TZMhtjWdBhu4ubMwobl/tHK0uNU+MXQohlARKralP2hADmpiihG7oPvDAVsn
         dI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767843; x=1744372643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3JdFQg9OP+vObOtg3YucUTBQsfmVEuB77cG86LXLR4=;
        b=dxGsYg0uuwiNEOb7wjIaTWHHbY2i5lIFepNPukzdPwNOcgygczy2l0rhxitL1srQ+n
         oi5kgSwu43y7kX6jw10gPwV2Dd7mh0lrmRryBEk9ILqp8/51dVZ01zSazWdmYBKan/A6
         lH/qSCWEx5kiSV+wJ5VDPxVGlLlfj16Ab99cNhbL3xZPxukddLOxBKA+ve5lCJbMhH1O
         ki81Lcx/7Fntcd/HDvq9B3Wp913xJOjItBXtrfUw+/6hsFFG8phM7AfQHNtwkOlIcAb1
         5jZVDRDtq3zAwsAstytLv78ZxtP2PjOd5eNSQkWoF4RzX3qC/Uay+3FtfvJ5129J+GTT
         JvDg==
X-Forwarded-Encrypted: i=1; AJvYcCVwzR35avm8emtuMl7nzYb2VbXAbYsDjdDLBnhnlgUWqKQzcIC48o/9LwDJbNiUCZDJFVIgskmOOM+A4oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9iKLwRL2DnB709thQxNB5QMUAWe/iY9Ues0v9w+qqeCccrn1
	yMfDI/yapxCBEaTQ0xoycQM2UoKMmXNSDlsSKEVvS8NaQ/M1oqtTdhAqsLo9ydc=
X-Gm-Gg: ASbGncudNWoa2nBYLiXrmkfflCoj8ErREN29iBgmxsf4CoOXSLV5fYOPi/t2HNmpNQv
	ZPiQATS/kKLzOIHxAL8YBZQgQDJjkPVBi/rHwQo41JnKsR64XRTmceGudh3JLfdhN9NGt5fVJNE
	wG/raFmTbEsMfouZC/uf/luVQxZrWIM+dJnKvpWaeO8ZUX6xbxJe2Ws9HGZ51Lfs7U+ZGHlU1jL
	luqonUK+OsAi8tAecj0qMqlmuC0YmEseWkah9RWwgwzo9sF30TYq9qJqNbkq6GsELM0lV6XLLF9
	sO6RFL3d7/5NQY+d1BJ8OL6+PVNUzXu9qUd1QiKmMMyvHgsdqbov6w==
X-Google-Smtp-Source: AGHT+IErSp1UfkWiyQZSYQ4Fs3U5j3CAQMjPo78hcc56nmGo8lsKvG80Q29kD9bY+/gtM61oyOPwyg==
X-Received: by 2002:a05:600c:1c1c:b0:43d:fa59:bce9 with SMTP id 5b1f17b1804b1-43ecfa4d95bmr7235225e9.9.1743767843351;
        Fri, 04 Apr 2025 04:57:23 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] pinctrl: meson: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:18 +0200
Message-ID: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual drivers, even
though their choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 90639bc171f6..0315e224bce6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_MESON
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -17,25 +17,25 @@ config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
 	depends on ARM
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON8_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON8_PMX
 	tristate
@@ -44,7 +44,7 @@ config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_AXG_PMX
 	tristate
@@ -53,24 +53,24 @@ config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
 	depends on ARM64
-	default y
+	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
 
@@ -82,12 +82,12 @@ config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
 	depends on ARM64
 	select PINCTRL_MESON_AXG_PMX
-	default y
+	default ARCH_MESON
 
 endif
-- 
2.45.2

