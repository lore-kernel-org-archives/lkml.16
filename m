Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B11AD41F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768813; cv=none; b=BY35gtWAMA+4xASnf4wiUwmdwCLYEN/8nAFcp9QTWUwHjXBooKRnVvgswIrsZkoj1f5Ylq6YGt/KkNi3FrFBQG7KEOZvcyiEI/zfJRI8NC8iekfRt1EGhC/0GGBE2AptWw/PfixA2qJF0BhZSUR+Lw6xPluPYNu7iEecZP2+nwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768813; c=relaxed/simple;
	bh=uqEb5kgd4VK3+LRVcuvh/ah2jvKTz9S7t7NclckKBhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yz9duPn6jwZdOLyFSXsf9IKbdVSu19PlwR29i9sb7XxeKScWOncdYQG2ellkK7FlKz9MXzhzB4ebtNTLFMgyecqQY9bnEWQifi3wOdWrdZROBfhtR0cTpYo7w88Y9f1y/L5QdIkpy+80dkJo3tA+5zlLXBzguZR7RZIyxaIx4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7WgKeX9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7WgKeX9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394944f161so2196105e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743768810; x=1744373610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkU6xWzc6lSGa4wrkLknImB41P1wMaOoruxvVliww/E=;
        b=f7WgKeX9i88bgloAkriXhlqdyiFI7uIcw0eYoosAP72V/r3jrkvOX4bKKX4hYq1Wsn
         V81Hoc9tXYdA/al3CSlwtjERQkZFmUPTUNHIdVjgIcTEocA6Zamc3DEzUVq4gd32JhFi
         bGqrXtZOMlCKn06Q8d2NdrOVN4oRmfcxTxOn6sP5QQ9nBcdW3fwa7iIvhGA1o7WaVMpg
         lAe+ZRJrI1rj+2gJ7zSgHiKmH/dZSbysf7R/2T9983oB8t8TlsyEev52Af1Zed7vjYTm
         ly3NYHpllFFh7wgwyoPjrYRQMXQ3wjpnGIpWIfBmGvDH2Epb7SsiUefyBhbVtdKb52JD
         BGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743768810; x=1744373610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkU6xWzc6lSGa4wrkLknImB41P1wMaOoruxvVliww/E=;
        b=mwxssDKw7Y7K3ndTgTqOJomgNeHZLn8/QWOL7HmmpX6/Heqsh64wiO/vAMp26hGOUf
         FSa39k48GLEJudcGcq3BY8CpGZ4VdGzlSDPLnx7QDUD4faRTBZlZz7r/YhJ3PrK4mgD8
         HE4QOvDXB6IVh2drkk6XemSoOY9Hwa/xW47nU+kNob+JYzzE2neY04baN+0ud1hWiBNB
         iHdojBhqPfVK6Wl2N6Ncg1rfrpFRW3qzx67HRJ3EyEH2VPVJT8HaAE3jeXZncCtAep28
         o2Ii2jwCa4F/Qe/rQH4sPKaRGz2Mgf6M+j0rY6yXM/lsGl0Khet1DRM4pWT7iCKeSb1T
         kmPA==
X-Forwarded-Encrypted: i=1; AJvYcCX6vdvznbb7JMvPu6pF6zjcwPS+UK+lYA3RnGLH7pgimG0YA78mu178kmyGTOOioZS/VxxVd72mhLMbOPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtusyt58pILyMbCoprNE8/QvZFOMhkVBA7SmRJYIfv/Bc741F
	Rkk8I0VrUnm3IZL/duanXh1yDBMixIhGT/zaScks2Rz8G1E7yoseQ34/j2apILI=
X-Gm-Gg: ASbGncvxfIK1x9+X92+BzAJ14zcxJE4TweNdCIG9c2KKcMOtHJ0UbirgBThO/P2uSLS
	p/O51uZIky23f6cA64miIg69lLO0xo4u+5Brc8iWFmG/IeIsj+oRyO/V5TeX51do5YOQ3Whnq0B
	IthHf4rXfyAmj1IXn+obRXOgVrQo83Z4WBp6OW0CD934hJ6EHhBPcbSzVCzb8FRDuIGzIlNCszF
	DsAFVm1jJAW3+Iltmu/55zh2ypqN+g2Jh1TeLPnBGu8JS1pxTV5Sex+u6yDgOJxr33Dsrv2Tsby
	2I31rZiTFuNMvvUj2Nr+Q4yg4+RcaLfQWzY8K3WujjntMj60QLv919OeiZhA4cwY
X-Google-Smtp-Source: AGHT+IHA0ZQjK8KraYmZvJELL/Kq9mNLied6TLIbpJo4CZlH3o0zAE5EQTuZmcNVi+hZHBAjCeQKog==
X-Received: by 2002:a5d:64ce:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-39cba934dcbmr862924f8f.11.1743768809991;
        Fri, 04 Apr 2025 05:13:29 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm4140344f8f.89.2025.04.04.05.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:13:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] phy: samsung: Do not enable PHY_EXYNOS5_USBDRD by default during compile testing
Date: Fri,  4 Apr 2025 14:13:26 +0200
Message-ID: <20250404121326.318936-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404121326.318936-1-krzysztof.kozlowski@linaro.org>
References: <20250404121326.318936-1-krzysztof.kozlowski@linaro.org>
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
 drivers/phy/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 6566100441d6..b7ab402909a8 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -85,7 +85,7 @@ config PHY_EXYNOS5_USBDRD
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
 	select MFD_SYSCON
-	default y
+	default ARCH_EXYNOS
 	help
 	  Enable USB DRD PHY support for Exynos 5 SoC series.
 	  This driver provides PHY interface for USB 3.0 DRD controller
-- 
2.45.2

