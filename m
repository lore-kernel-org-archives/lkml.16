Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080621A3149
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765432; cv=none; b=glHIhuux2oYVe4PaMcLRPuslJ5YwbQlxCNqrTB4acFajqDVNGLyIGlqjT4MUf10nr63GQqpQ27jUIB3RFgWBpldZihaI6LMDCtAxpUTQsQsfi98h7yeaK34a7wT+9MZKkaJ33RL6hZIZqDHSSjStE/NxVX2GW5EDgV7RuTNPtXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765432; c=relaxed/simple;
	bh=JzgjzKapw5ruGykD9dozmhYg/WR1vmM3CkupC5JaPY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRSRrOyvPihlr4T1UJN/oy0Uwyyliqs3hs2cAlv73qy7RFGVzWkmpujgtRKGZYJwOPeO9gKYS8rY19uDHP8jR9oBNYLvPZ+m7NLa2ixc6su58j6Ifzofsa+zIhyxW58hl4YIF9gfSoUsuQQgLFU8hnOv1lF7TkZFqispMhyM1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6/HPPZN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6/HPPZN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39123d2eb7fso187332f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765429; x=1744370229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpV18robQpM1aQBorpHsla5rBJ39P6gOdClL/3spUBc=;
        b=q6/HPPZNjAcEQWHsFq5kbmBoKoq7go33x/KOXX2TXqfEyBdHWtwRjNlzI3fE9L522W
         XUeQdjXQVU3XGQ96+ANEvM7X6h1EtNEjP7n3+4zoSQKZ9i1W8VuRn2Ijak0eMjZVpeC6
         cnb5nG6c3EBqI0i4tLGqkyOTgKyeK6yNTR+3czbMX+5z6PCF3YL7N+9HZM+wVuMWYPjo
         5B6yd05G1YVzc7F/U0+i3yGPCO96r2QGQuHddm0LI2NRLD8kvsJrnv57xVh4X3sGFmDg
         Ej86WTTMm+ad1wxnrTZodJ5MioymUcfM4C6gYOS5BrxNFZtGaiBRh1zzqpUZ8kMQeddv
         ZdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765429; x=1744370229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpV18robQpM1aQBorpHsla5rBJ39P6gOdClL/3spUBc=;
        b=ubctoVpZhYqgsjJ/uleeFiMBGGruwC10VKZ9brcCJUTb2Y6a/tGPlfvvVVaVtV37TA
         MuuXowwGTprkQBswRyTcI++ceMLsbwMUkgDg+KXc5iLRyIxBkUNqA5AuC4iT/PiQZprh
         Wv8VbkuArox8B/7XS+JDatUga4JLPNs652USbYqXPKzvbWSGT+pbwGy76hdud0XiDAmS
         cWqSWrUpsyohCY8yynuben8jqTzdpH6DUvUHtd6cu6KV3vheroP8AY7NDTVXO7rTs/D4
         +b7wBk2IHc+BMp0BjFBsZmjCxxRMcrjlZD7HJEHxKLjpsWIjxi//SKxaiNk6DoxC4XpI
         q8yw==
X-Forwarded-Encrypted: i=1; AJvYcCWZeXL4clx3EwqrW0VSm7qSgkzVkDe7wLvmR1piSdJJ07SGDP2ACDUJdaVrZwV32CxivlRaiM0QnAQ+WAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDF3//w4Sd8Pmvtk98o/VwhriC9KN+rKfCig9zU4xVv+uFbxs3
	vaUZIqiPOmBe1/FhnKmjjbkuT9tDbFNoemyeo748iR6W0QMdf5obBPa4V9HhS3U=
X-Gm-Gg: ASbGncuDT+PEidgvFKQWfRdqeolMaFLuS8daNGUJLSzqyvEhwk2aTHdfvxVE24dU3VF
	poBDOQItRV4tto1YJ/K4D1+2m7mM24c+nsyGbS2dCYrVPsbgkdY2swD105doPdv2S5szJTa2c5Z
	S9hzPWyK/nOHID32gHBNjHWyyw2fc9gcn99H1F5AFeEqTbXRCcAl6/ZKtCZlIBwZrRB8FceG9Wu
	TXlCDC1bU5BuKBFp4nMARqKJNo+gagol+7utj4ZEKEJPEAxjIWTXJlY50jYJUtPuBAPw5Ub/sd2
	lRXirBrtVHVQpW4srKd7KuwfyTzKVBFCvDxmNhIgq29bvC0HNMCfEA==
X-Google-Smtp-Source: AGHT+IGXTrB28QDGBIjr1yPNyJxSbkOVOn21EqPmAGDTOL7vnSPAbrdSAJF9mdzI+7xxHc407ChNMg==
X-Received: by 2002:a05:6000:2586:b0:39c:16a0:feea with SMTP id ffacd0b85a97d-39cba93789dmr827869f8f.11.1743765429146;
        Fri, 04 Apr 2025 04:17:09 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226cf6sm4044377f8f.87.2025.04.04.04.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:17:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] memory: tegra: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:17:03 +0200
Message-ID: <20250404111703.235455-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
References: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
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
 drivers/memory/tegra/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 3fe83d7c2bf8..fc5a27791826 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config TEGRA_MC
 	bool "NVIDIA Tegra Memory Controller support"
-	default y
+	default ARCH_TEGRA
 	depends on ARCH_TEGRA || (COMPILE_TEST && COMMON_CLK)
 	select INTERCONNECT
 	help
@@ -12,7 +12,7 @@ if TEGRA_MC
 
 config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
-	default y
+	default ARCH_TEGRA_2x_SOC
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
@@ -25,7 +25,7 @@ config TEGRA20_EMC
 
 config TEGRA30_EMC
 	tristate "NVIDIA Tegra30 External Memory Controller driver"
-	default y
+	default ARCH_TEGRA_3x_SOC
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
 	select PM_OPP
 	select DDR
@@ -37,7 +37,7 @@ config TEGRA30_EMC
 
 config TEGRA124_EMC
 	tristate "NVIDIA Tegra124 External Memory Controller driver"
-	default y
+	default ARCH_TEGRA_124_SOC
 	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
 	select TEGRA124_CLK_EMC if ARCH_TEGRA
 	select PM_OPP
-- 
2.45.2

