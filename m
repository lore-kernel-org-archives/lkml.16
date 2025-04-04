Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8833A1E51E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769281; cv=none; b=C7MkIIZ7SKF9njB8h41d9wn+U5vCtzDAfBwegZ6lyqQ/JbBMkmEiEGo3aP/kQ9Jer45HnXrwyrvhDuqvvZbYUAMq52DM7YwRkUXiCoy6U3uYXe2WQPaCDj+KbRIQN3CEnb+KmXDdC5ALq8d/0rJ/+b97y4HgH2hPo/tx5r8fDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769281; c=relaxed/simple;
	bh=5PptzN+O4dMipDdNH3CCDo5Nu5+4qV4mMTDC3UC7oNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tY1aaUup+MoP4Yc7DzHy1jU5I75gx1zmwotBnTN+cCgG3ZdeaPjUHskkbEuW2P9wbo5qhbL3xF7ldd6jkBjPruQGjlaZKX7rVnu6Hpc3+bv7WbcTJnMuK77TReFaQetHb3EPx1J1auLeXtB1nSLe6ejSDIKKMsr84jweJ32k+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2e7IiXC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2e7IiXC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso168829f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743769278; x=1744374078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOKOdMC80B9ZgR2kKa4A3uKCR6IYOVE6PeV1L1gst64=;
        b=W2e7IiXCk48RdXCPDtShLWS9Lf+jB37Qhe7ivmR7tIJIU0NqUT80iUkAy8KFS+ojId
         f0A8csIP3zxAoQkt4oJYnxjWlN+930bY9bDapqlgPPWAWqTMPbS9cnu2A6eZlGuOJ48g
         0hfoEEBSdZ9qjGRNsh3gIsimb/G1ycQbpFS5l+72y/bmHwjJG1A43I8FIBH82ilaQoda
         +pFOG+fzmK8/ZjEUE3Rxl8lfVDSYz3/aq21ryQG5vPrfBSLtf3JDQzl+mDUC/5qieTQj
         KlLLsdTbuqQJtN/lN+e+Q5IqmyIHN9aqJGk5yzwzrTrSI1euIAj7MgpraTvbuJQqzkXz
         nTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769278; x=1744374078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOKOdMC80B9ZgR2kKa4A3uKCR6IYOVE6PeV1L1gst64=;
        b=V2OP1us/n4m8S8aIVtTwzmcJXrX7RJTOLM7jW6+cQchcLSEUvMG7ezK+qjkXY6sG2m
         aHnhjWRm/iAKkbPnRCOMd6aCkNxxmpdkImcLKgZ/ZiJ7PJYHYgxpDEibEDAhrkYnoJbz
         a1bgM7oSXVnbP3os0AXPakIOYU3BrPzUrAi6Amv7bsh8Ip3qo6z0XtY8avmN0p40LIZ/
         JeYLMWAzZxlzKaxCWhd6GUT+L11kcE15IL0lQG2cQHlb1G8I23Ro6qM638ehHtZYIj/H
         8b1lnyJE2kpHJnrwBq4sXtFzE/2CVk+uxpFyhD7cdEa/pStuldwDw9G+xDvWNp95L4Kp
         T11A==
X-Forwarded-Encrypted: i=1; AJvYcCXGI1stXEB7eSMD9udz+7FAre3tJXcShToUUzIZZHn0zkOPzZVhNiMBmRBAcUowpdVsHH1jqb4gCjDP4II=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEhCbhy7bLfJ5lif5adtOWDzDf5wvBC+z/hIim513OygkLFC5x
	dsSrvBtogl5WEyFRYa4/PK8TmCiguGs8POqYX61vUzhbtbOJcc8dWCpbGzJ7sO4=
X-Gm-Gg: ASbGncu/4T98a4V0/hyEDXqcwntp7IZ4KJjpNV4AmxFqGcqb51bLRcEcWBebh8L+avn
	VWkvoT0fNWT9l2w2eXNkxze1/LmAKcM/YsqGGsR7rJ+sWB+Sw+staJjWoYH30JbHqiGThN3tvQ0
	zUbPQTu+egXQODcG0KbQxOmMn2N2HAt+ZKgNqStlD5qgZuDcDyRiqappP9/Lq0WsBpze+yNtqtt
	olhBScLrLWlI15J1QaJegrT4Wujn07xz9CVrxNt3UsU6dVyNONYpH3eBJymz0VbtxPanR+jQocW
	idHdR/k0IXxJoKff+QjY25hmliq/rHeefvWEc+IZtxqtW0Uf4zbKCA==
X-Google-Smtp-Source: AGHT+IFK5JnOLqYkjMnRXzO913j6er0HGEDwkEB73eYTE/X5Rh0zki0MaFEoC1XvaQYeqZ2DlmoXNQ==
X-Received: by 2002:a05:6000:40c8:b0:39c:1efb:ee87 with SMTP id ffacd0b85a97d-39cba934e63mr852165f8f.12.1743769277821;
        Fri, 04 Apr 2025 05:21:17 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6c89sm4183439f8f.28.2025.04.04.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:21:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dmaengine: sh: Do not enable SH_DMAE_BASE by default during compile testing
Date: Fri,  4 Apr 2025 14:21:13 +0200
Message-ID: <20250404122114.359087-1-krzysztof.kozlowski@linaro.org>
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
 drivers/dma/sh/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/Kconfig b/drivers/dma/sh/Kconfig
index 6ea5a880b433..8184d475a49a 100644
--- a/drivers/dma/sh/Kconfig
+++ b/drivers/dma/sh/Kconfig
@@ -16,7 +16,7 @@ config SH_DMAE_BASE
 	depends on SUPERH || COMPILE_TEST
 	depends on !SUPERH || SH_DMA
 	depends on !SH_DMA_API
-	default y
+	default SUPERH || SH_DMA
 	select RENESAS_DMA
 	help
 	  Enable support for the Renesas SuperH DMA controllers.
-- 
2.45.2

