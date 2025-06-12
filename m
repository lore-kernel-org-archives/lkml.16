Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5323D280
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735876; cv=none; b=Yb3mtr97fH6uFFAHEJs1uh5sTdwvBDEM1tgJIE7zjbEjz5cgE/XQ8NiBtK5YCpWtxO2P+Fpt/Z64LItEA+34HNp60vU8h+5HlSJ8hO+Xh7rHZVIPc/j5OCpZMY3dL5whuj1eHrCW8Agkgkx//qKE+LDhliCjp0rwc0N3mrCCF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735876; c=relaxed/simple;
	bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW3qEvzujOSU0ns+Hpnu0UM6Pn1RyYaqz+2MEjOkUoWKeYw2HngxMhU2KyT4kk847ceMerzugjsuB/ePk7L1PCB7vQ+Wr+I+QP2O76bKNH4YnzuoszI19g74uKFu7dvAj25doQTGAKAk1dwsrkkb8RifDk1iP7lvqQyxTevMCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCl7eH8V; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCl7eH8V"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a52878d37aso193482f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735873; x=1750340673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=HCl7eH8VGSpLTUNUE4eIi4qwk82oC5GC5PFGItZPrQQ6zx1H6UGN+adbN/euJR7pMJ
         kldBJd6YpwBb4dNC9U8H/ro1FD9etHe0PmlBrGs4FZO9+CSXFRWg+9a8vKChOSs0kxzk
         rXlVYtjkOv9j/dsvCae+RqD8EenFNe6DVfQMZgP5wrsqwUJ40hiTgCST8oyVx1yxE4Z8
         KEs/2YRrDZV3Dqq8csZl2dEoG7GEH5milEdH6hAiHhliGIAJa67vMbqiFJwAXmMwLd/z
         m3VCzRaAAv68En7TeBD+zOHAHYREOIf59NYFGEhooHSd9qJ8O+QZL30SxUSstDLLg9OR
         V/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735873; x=1750340673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wLh0Bfznwrpy2ODyPunjDZzKz1nyvlK3wv3RxF8avk=;
        b=qX6dNutAM0qLIY3mqmR13vqmOfTqKM1dgtdM2Be085ycFazyhLVQydCI7iulV+fLG9
         Tx58Wm6BApBSbFgec9w4jBnVIej6Rfd1cYFgOZotO6pU1MWGtOFnebPyeDi71QoAhA/t
         xHnMy3b3UKATAXlP0lzON0SNmH7YvC6bW2gC4ZZFWsegGiGD2xCwy6M5EpbPzAr0bgxg
         fn+BtaB4XIcJ3gvhc7o59cz7Pn0/HD6usR5MW2l0oUtlBDklZRi0UPLTilrrj4HxmK7R
         3yoEXBxx+zJRFJ3rwCvvjtiqGOfhYQSwbkWcuJbqPaHxJHmEg3Wj4yYB+MACB+C/ywoh
         sHqw==
X-Forwarded-Encrypted: i=1; AJvYcCVDeubtfFvg611RZUojfKdfVmY9K6eNmTplYXxadvSuv5ItLhYdDMoPlUXUad0UXGPAkSNiVYcGF7Flm9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6PJuV7yEIuUqoXbRlnO5MPvAF7upVX3ALgwGKuNz8+ZF/Bnn
	1z+c1JFKKG6to3vxeDRkNHq1RJHKr4gagL5G6JzAN229hid9HN/vhrbBt+cuD7wHL3w=
X-Gm-Gg: ASbGncsWpVxKG4Owo/MpM4TdY6ubCGBEd7fLKuS1rgsRzmt2ejHoUra4WAQDFtvqXNq
	vDCFflFsxs4X4m9XIzucQoO3nbLTig53VElHlkI3fh6pRrLt2J5zKwachhJa9uSKtLCqnOKturd
	4+Cbv3vnCKK9AZjyRM6nGZOR4NPMrNVKmaaVmMwaWmGjYjDGHB0lUN3ThMO+Jq0xRcHfaYY4OJL
	19eo3cjCPrmyFiyzJTylEFFwGxLKCgsG+q8ca5vPYBit0wGSS6o/Fzj7SW92z0U5CXI19/YmdfG
	EkiCI8f6tudEkzOANoUtoOAFsJMnF0KRlg4L0u1oIjFyLiF4p2Q0tybIrQtrGfWlPj7Z5+W/Wg=
	=
X-Google-Smtp-Source: AGHT+IHtHbOKUROa0ve5oP7CqlT0tuVP3Uhvzz+OcfUoUTB8LdEAWIqsjOFYSVDtkpJs1KvalbK6XQ==
X-Received: by 2002:a05:6000:2409:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3a5586cbc4emr2389747f8f.8.1749735872804;
        Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
Date: Thu, 12 Jun 2025 15:44:23 +0200
Message-ID: <20250612134421.95782-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=KY0F8+kc7mm5xaiPKfTg64NGT6LMQadpTVG2dcSzIOw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm2S0PrTSvMJ4T068lWmaIsuO1xRYGmPZ7xW
 PrQgJMoVw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtgAKCRDBN2bmhouD
 17NtD/sG7Qwg74MQDSYs/mqC4KOD2fT4ykjXIqRK6biOw7HMjliCiQOw+XynSblUFD9TbDeyzqT
 wIL4LCWYQ6kd47NBX8GSUpB/ShaOaI09o8Nuy1Kvj8aEljhdiGp4ckeF295qq5RG3oWInFtoM5Y
 Ld1HGX2nOK137IibuLsWIZ2ZNYbWdHCfIu6ZJi2KGD016k91JQ7RHI5oe/O48vpG8smsfj88clN
 D+d+D7N3TACVgoKNVdvwcG++7BfJHe/0N0kc/KcYGAZHkZW0RxMRV5CRa5JTFFT8HcofN4enuDQ
 tAJvQkDehFT+nBaBrM7fcnC2yO1q7SPya558nohVVCvhDhTgxuZsMEkH+1HMhwKU9IrEePtSGLB
 kvhxRHRZkeRVjucthVP2BvwQTOyzfsdGGWN/h2bVSY03neVozbnN4xg1jtBDtGDYwQ09NmCpykW
 xuEhh8DUGiQXNfvIgZu2azW39j6MrXpfIPSpY3PUarMkn9Hu/YsUtylj9Nk85JewomYhwYmsdRK
 DoSNGbvJ2vuJG3IOsdCLweB/RzSo3K3RgXz1/OJMl5IcAnQX4zbf/k0QYip6Iz9mrwZNuP5asAc
 hMFMPaGNU2Lri7c8q57FPcMmeXna0xFDfiEBqGfP/ESJTFcH+68lzwGlgAhFImmUaNS3AcKdz38 7U6Cs+MlvUiIVcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

SND_SOC_ES8328 is selected by SND_SOC_ES8328_I2C. SND_SOC_WCD939X is
selected by SND_SOC_WCD939X.  None of these are user-visible options so
their presence in defconfig is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 14fcd0a85f5b..a47e1616b4ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,7 +1057,6 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
-CONFIG_SND_SOC_ES8328=m
 CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
@@ -1075,7 +1074,6 @@ CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
 CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
-CONFIG_SND_SOC_WCD939X=m
 CONFIG_SND_SOC_WCD939X_SDW=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
-- 
2.45.2

