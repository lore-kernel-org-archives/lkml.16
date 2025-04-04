Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9174F101EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768812; cv=none; b=NLKQNtchyPw+8Ywvvxjc19k7igms0hpN0Z72Sgh0ujZZZUE4fECol4kL2km5XhyotI40fVPst360yhisBYv6mLp2VCKxNd0Egfgn0wWkqEhvEmXnvs+tCU+y5T57qfSE0sVrng+aUkjOf87uNZknlniayzgTnsVSailvZSLQhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768812; c=relaxed/simple;
	bh=PsaTwBufi09N7yjP3bEKeRiWlFOsFNyA+HHT2d4ryec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBHQCMt+if7fasUY11/CXdXKuuhjP2vNYh/KCmZzRYI48nC36+9ilnVQlFdmpsylwAEGczBUNAAqxEwA6NfuHcN3DaLhJxKzcy9HIbXEUK9QVOLT8njr08tnPmnw5TLVq+IKtrZVGoTOWVIGUGddh3OiPusK45xlh5NXnr6KzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7O8/Ba4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7O8/Ba4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso155186f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743768809; x=1744373609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCrk6cV7dA6AvJCKRlUey2b+xo8EnSHwCLZ5f42ogPo=;
        b=k7O8/Ba4ADNXbfhsX4DUUANpGvVM0NEz1YR8JdDhuEt/GN7q/tOxUMTcrzvM4PYkQ4
         zaTxP47FY1tdPp3AaVMzvyjG9lmzbcU+WXW8AGjyMNFXf0juwAlQiafN+3ktZvN9tbYP
         aqJcRe/a02KEMh4pqlMeDPpIi7O+v0SBPYqzvrlKz6DsC54+z2Kf4Nk/G4IOWu9GQjRp
         A48ADoA6e1AjxvVNHhto4eEKgDttOctdaToAT1GsbEZbl8GSqcSs+ciMbZqi8FYdLLoD
         jWOnvi479jC0CEhE2Ll8tiBJNSWqx9vjKJ7il2ws8jE8EIQ7PR+UGFuBL7ycOERPQCV2
         O1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743768809; x=1744373609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCrk6cV7dA6AvJCKRlUey2b+xo8EnSHwCLZ5f42ogPo=;
        b=O8e1KPPyW4+Y6pCOZ6BdBKsPIAhSYbO8qbpHEb8o+goxusmIlrjWca1YSI4ZeG9u9H
         UhluD7T1s+J7JAV7xj8iszmvAtLhjy4WsuHfd4MVr1LT4OiLLN2JZl1bST3FMqfo2a9Y
         1sY9X3Lq3N2Qj/rx6EX4Yx3TDzYASe6PKa2IMPdiiSMr8fomHmRC/JHs7/Wp5uEStDLk
         DWVvGKrr0tM9B6AfwXnd02d9Jy0/VjF3MD3gmXiJ9LXOnOSyIF7TRiLUw82m9roTIKln
         yuJdzAgpyZ2Dia/dJPk6i1RzQhb1Dw9V11Y4dv7inkNImA3SCOR9nYXHew6rlYHd+AYR
         5x3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXovo/aZODNQ0anCz99aVKN/LoSeIEyPZXJaJGW21kGiMVFX1PJUb35QOJf1w4n9VNwIisEqunzuZa8O8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6jGzoZFOmVPQ7ZeB7TQsxl3+0v5SkpK9z8N/jIVy8QxO0yC6
	uz5dLEkWFAHNue/37H2KUgcrKGI6o1HI9HWkDjlfQZiaF5rMhSPEemkzLiok21lkKAC8joB3e64
	U
X-Gm-Gg: ASbGncsaWSKMaNkVQb3+0L7l5264ZgBjsy/VgQR4uv6oc05974hXbDSFXyXKa+CN5mD
	qJEwhm/uoyJpl4E6wcdL8+2mimhzfHjhaCyexT1uUEefDKLWEChg1ld79gVZzPgtJqnVX417qqn
	UTkeO2v1FWzrDmzVxhZk/TkoUmeNDbwSedaRd4Ad+0B2DI+mzZCYKeNapJ6x+erTM8iPY0SKFx1
	Hw/10WdIefRTfHzew4KOGvQhAQkEqFF8jFXcWkHrXJRZqMcH8sDX2X3dzwFGsnvasm5Q/P3lOn2
	KOVirqhqNTSDikwGnpGQznG35iLaNzaVCIT8NSehlkleIIq9BIF4Qg==
X-Google-Smtp-Source: AGHT+IFDNVJaVv8BTUMTy2B8iBBvdj+QxuWwYbdyak/PIbEAyuqvg0EqV1eAnhkPorQ5j8Iws2ew0w==
X-Received: by 2002:a05:6000:186f:b0:39a:c832:4f3b with SMTP id ffacd0b85a97d-39cb35a97camr908140f8f.8.1743768808836;
        Fri, 04 Apr 2025 05:13:28 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm4140344f8f.89.2025.04.04.05.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:13:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] phy: marvell: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 14:13:25 +0200
Message-ID: <20250404121326.318936-1-krzysztof.kozlowski@linaro.org>
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
 drivers/phy/marvell/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/marvell/Kconfig b/drivers/phy/marvell/Kconfig
index bdb87c976243..bccd72dccb77 100644
--- a/drivers/phy/marvell/Kconfig
+++ b/drivers/phy/marvell/Kconfig
@@ -29,7 +29,7 @@ config PHY_MVEBU_A3700_COMPHY
 	depends on ARCH_MVEBU || COMPILE_TEST
 	depends on OF
 	depends on HAVE_ARM_SMCCC
-	default y
+	default ARCH_MVEBU
 	select GENERIC_PHY
 	help
 	  This driver allows to control the comphy, a hardware block providing
@@ -40,7 +40,7 @@ config PHY_MVEBU_A3700_UTMI
 	tristate "Marvell A3700 UTMI driver"
 	depends on ARCH_MVEBU || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_MVEBU
 	select GENERIC_PHY
 	help
 	  Enable this to support Marvell A3700 UTMI PHY driver.
-- 
2.45.2

