Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E4194A59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770388; cv=none; b=srGkFnY4BhyLj72XLQ3QJ0zE1ReAI8Sgbcdtv7+dzzi/JuJ0gFeXhr46OWzZCd4+mgf5Ja2uHTuuX+q9vlpGehNUMeyp587cv8XOTl+n92uDdR5W/z72zFQFSMeGB7/PMaKS+yWZkDYOedqnJ+ulaWfY3+7lc+bh2gLRSSgfL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770388; c=relaxed/simple;
	bh=rWZrTo6CbOAZVlBYr0KMUl0bNmnyRfmlSthZhFH6jXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sk3jp/Ewm09Mglm6nxyaOub8X+ePH+YN/tvqNwLY91K4HGj936zn8gm1ofFEtX2psqpccAI+XNgkP/r3MgNU3Mggo9ocIMDULfo/pchxpNLPBEKvC2/fSoygZWJWKUOEsoUHzYWPSJffvHXulIwSJpObf87GwSByzCT3sI+LYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrXF5FpW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrXF5FpW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913290f754so222640f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770385; x=1744375185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+xv3GCTllU74BY3qzp0YBkubI5fxJJbRLLZjqaSHDw=;
        b=lrXF5FpWI9e1PtDl2+1ChwNy4SLmMRWVaon5B/MHSDauSDYitTv3heMuiGtzEzIQmj
         5TvpBiR6HhcxjVQ8uJIsIYXJrCMxKniCSU9xWBkhXIFnF7vsmaTn2JsJki1SF2md7DBZ
         A+nMQc5hoxeG+glu5+n4fX+TuPyIBpzWS3gNAOGI8G1jFsFKYEqjP5FVm6fth9Uvkqnr
         banfSZx07534KMPVBbPqtnPq1Jw+fCaCDFc8h1rybQ3vH2NM0R3vyUdOXRc28S8uYTnI
         ZJJMWEgyQHahjxvL41vXtV8PoCE3m/+DClrqCgUN7XQ1TD3je1TrVnLHk844ch50ghHX
         JWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770385; x=1744375185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+xv3GCTllU74BY3qzp0YBkubI5fxJJbRLLZjqaSHDw=;
        b=t2dXinEGSNcAaUT2eetVkwpwRy7o/QXPteVEklh0rt/e1gsxEQdNf/MC6zt9Fm53Pw
         OnZxIhJvXCyk1geb1zKzyygcdHRcW4Qaq1IXF4NPpQ4Mf8LQadTXDhUMSUhHEv2KslK9
         tsRipZOkPW/pf6Rq0/rNqGgnAYqyWshEQ3Q/ppvwFbed7QYrWPo3ijAUVZOEv1TX2Qpi
         S2es4j7u4DD5rhiHBjhJTKCUlYg6pZtcl1D5qUZ2kWDNGCl42lVXewdyyndhggf8BNaN
         GfUY8DdChu3K3BIYDkU3BihucFjMwsyxaWo/me/qwL+py3zI+FCW7i+b4SjrYQJGSWVW
         XJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyg19HKuOndfqGvSaHVB/fcMUdSZ+W1FTV+izt8prR7SFYCnfDQkwbN5kg8BFMEcH0d1GqIaQyroZZ0QY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/JP94kS9myTJdFmZQb3QoN46M4dDTVjQM9zwVztFVMzIhJbi
	GZJ0xkoxNhufCsdNlqmr/9+5uvccCb0XcTJn9l0XObKqz4/4H3jn6cE95uAWS/U=
X-Gm-Gg: ASbGncupwfxKbi3mM+VrrZANapevugpdx+pAM/19rfSQ7gLyVsD4k9tE3GuA/cfBv/h
	9DXUTTdxRP0K1ISpl6YT+P9ac35Gf2eJ/Gin8mPSxTUkGQWjRG5k15fERbGef7mYWS7YasNmUOF
	mVsUKjXbTNP1puVlfyc0H/BAXCGT2wwvzH5w7FkvJtF+CeW+/HuOmKiFLdnPX94ZXdVZhDPcfcS
	y7LgukNgLs/5kGHbDRzs39FYp6tgyBg97FSbZ/r1xmswg4S0vuPzxW008YQDTHM1PgPaZ5w7Up1
	U04P3G1pXnZmVZslt74rIe3VrJrj5HmL3t+4oQcswY7KEvhqsCglvA==
X-Google-Smtp-Source: AGHT+IG+lKwfjMi8F019Bso/vFNO0xQAvVFuEUWApO7mpNXS+oQ2lkSC3va++KwObICvSEH0/L4KwQ==
X-Received: by 2002:a05:6000:22c6:b0:38f:2685:8457 with SMTP id ffacd0b85a97d-39cadc76447mr939830f8f.0.1743770385087;
        Fri, 04 Apr 2025 05:39:45 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm4203490f8f.24.2025.04.04.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:39:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] watchdog: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 14:39:41 +0200
Message-ID: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0d8d37f712e8..1d29e5f4f40c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1001,7 +1001,7 @@ config STM32_WATCHDOG
 	tristate "STM32 Independent WatchDoG (IWDG) support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	select WATCHDOG_CORE
-	default y
+	default ARCH_STM32
 	help
 	  Say Y here to include support for the watchdog timer
 	  in stm32 SoCs.
@@ -1869,7 +1869,7 @@ config OCTEON_WDT
 config MARVELL_GTI_WDT
 	tristate "Marvell GTI Watchdog driver"
 	depends on ARCH_THUNDER || (COMPILE_TEST && 64BIT)
-	default y
+	default ARCH_THUNDER
 	select WATCHDOG_CORE
 	help
 	  Marvell GTI hardware supports watchdog timer. First timeout
@@ -2035,7 +2035,7 @@ config 8xxx_WDT
 config PIKA_WDT
 	tristate "PIKA FPGA Watchdog"
 	depends on WARP || (PPC64 && COMPILE_TEST)
-	default y
+	default WARP
 	help
 	  This enables the watchdog in the PIKA FPGA. Currently used on
 	  the Warp platform.
-- 
2.45.2

