Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9125D8FD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009202; cv=none; b=Vqgx5KAYk70j2Hm9ivziPHQiPzRD0QpyI2z7jF7Fu47JkmZms+5ta9EJJRa6KdmNhkPh6WxS/fFRYLfVF+T+tu76pFBF0Lqf3al9WFgZC+rSI2bmn7serBXbBzT+3sCfiG3I9HJh8XZa3nZnGTsnLveRV5i8lHGd6VEl+9Gzv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009202; c=relaxed/simple;
	bh=/qb3LqOk0CPpYt1EbGZXh/Cw0pmf2cmac/XhDTHJc/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv7J0dQt1W7NzxCSbRTqJDxXSMVXH8EQU1t9z8rGHU9hiBuwv/aucMngQOdl9bN4aC1B1cSnrLxrm2NsBFskGx25GO59Q04G8yprg2u2oaM7IsRz0PFRa73AMOXkeuzwZ6qbuW41P9cMPq3d6wco9CvDVQDb+fbmn4+5ptZnb7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FmUjbCUe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FmUjbCUe"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acec5b99052so325069266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009198; x=1746613998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=FmUjbCUel/sDyoT96HiYbVfnZDo+v2BW0CCcZWw0bXzJ++Q4SVcTJ49ikGG0R++cfq
         aXg03AGEJAXs54SuWkde7nF8hOWT036NHNkkwZyQsmFXJJLUa13uq3yJbgxKKdfn/axD
         oS2YzykAKuXhdWJixjv+yoMhJcDe+ZMoicXN3L0MfJ6CaV5RkevYwhMZSzU2eEK8xjBz
         BSp8I4HfY6DB/hd0OxI22CAhdUvJZKRe0xh3HFZm1j4vSWyszzyczuAsbnvBEbr1EbaP
         0GkgnSQ1h6N0FyWhYWwsBoKgXXTSv41dldS8FRWOFIUv5RkGduvGzmRT1Jx6Y3LR4/br
         7QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009198; x=1746613998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=K49G+BNVnu5cCZ3VSBKDtvHJet1UjKsSeoBBFLTaFplE3v8KiMOgh5c+mt3AnDvubh
         oIzQkOQJrrmFjC/eTLryEfWOH7yAXTctMCYFYCjJvYpiFf5VEulT5Vdst4FXExp43Jcq
         io5XPRuehW3nZJWEQsAjSH9L5l0fy8DVCz5EDssYM1v8XMkWIze5BdbcjKz21+8sQPOp
         9xO9nyySaf0imkZSpiC2V1fstQSmXGV07uO/sa0xrtJmjaAiBqPFHzLQZcDSOhbOW8CY
         2KZNyKr2nG059/qPl4ImFSqqXkK9H9kX2kzyuZw9jG+aNsUgx1S/NkciON3tvIR6c+AB
         dHvw==
X-Forwarded-Encrypted: i=1; AJvYcCXGVE7wHy2txDspYvWo65tGe7az9xsWa3VlJ0eEHGiSQXGIOmmbG9vnDGcf63T0bt+xuLjmdJPL4TUwavk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWIbw2LJxkKTcWD+sW42ZiPUDXgyihsKztqFk3WVPfWVrOFa+R
	6LaMaEJNAe7AHI6c/9gJiLdwU6PMDkGwQlLz4+95HJjQW/XaVDb7XAF03Td8ZAQ=
X-Gm-Gg: ASbGncsYQTYFL16vPfzvfYmqWiKZRh/g41IyeAqWKXeg4WP16GYCxGbETMLoS3UQ5/4
	Gcp54+i+d1UyUSzaYg1avkxcDTvLbqF67+a17CkOHgvToIKw/VqupqfQ+iRSd2YvJQvoYSM1h2K
	6SXMUdqs3t5vFErEGegUI1vqcU+ZEj37n7SwfdUTxeYmKa7qpJAVo3Ax74x1+3Af/rxb/ujKkg5
	xOc559gi5Ao7ybMlD0xW698dkVQndVuPIp9Spxk0CkRfvWPL2rgY2sP96ZVl0i4XY51niAHpC7M
	195o6tN7MeXh+59Sj4qeq6fPvNp4u/UC//DniHwKEC5MvV4SjLVGBGv2bhiDkx4GOGpq1vE=
X-Google-Smtp-Source: AGHT+IHBcCruFD2Sx7wtL0cb9Uodi9fNatKRjptTZekaQF3eLuwGTgjpuo5/jbKcvNzZcB+Y1bBY1g==
X-Received: by 2002:a17:907:3ea2:b0:ace:da39:7170 with SMTP id a640c23a62f3a-acedc768b2fmr307149666b.55.1746009197623;
        Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:36 +0300
Message-ID: <20250430103236.3511989-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..b36a96777018 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0

