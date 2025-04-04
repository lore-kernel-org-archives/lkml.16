Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C290816132F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765431; cv=none; b=XEo2vuc8BCYRfsIr6v/E/E43CB86AEuosLnNIXyvp3dTnhvBOn5O9K9tvOSKOe5jV8XnQGi8rRLzSMYkRA0ZrFUQAl8j1juk//R6zmunXKFyjzb5cLEOaYpreeT4yx+ZI7gQnYF4qUeVYdFZK5Bc3ql/R/jVEs2pJW/TyNBmWGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765431; c=relaxed/simple;
	bh=QzyUuYe3zsuwZKOvF5UK6gULIps85MQVbSvxkO1+GEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tXjc8wzL3Ur3LNzmz8swd+YAxAFlWj0uRp63/nIfli1Xpg8d+L/9y0LxuQDONm0AysKOorPDf0sQuD+QaMh3DZwa9SYf9mIKQumhDGv5fZoALffHCNH+n1qzuxMqYd0C82O79jCMj9eNk8+xZsyyM/WI2bXEeWPUpvpAzemmw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ByJNf/bh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ByJNf/bh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1390785e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765428; x=1744370228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgfvES34/jQuo5gJMT63Lo7MUqSbZlUCNclRmTokpVo=;
        b=ByJNf/bhnXq5zknTL+p4+EnzssgUa6dCEgBImYayxaxP4IKXosttTvbv5yjXKMUoMv
         1cNWb4GU4s2tazNnRsfNbXH3GA9LYYM93o1VjkZJEl0zp79ouSwUcrnzDp8CrjdveqJW
         AyaiUltq37xlrnlRvQ+Io+yqTTir/ST8A76Sez4hMCUGjk0TC3JnT46urfUQA80JcLch
         gRcHYXxT9a4BxiSgiT+2ObGn8PmoJQZ7oKkSyQ5EAt4ASdwoyfoUJpMP0N7Mu6pnAkc5
         e0bg1Hn4aHzuopwuffYv4EjYBFrvvF6uPgO6DptRtdwUIPV+kCmRHgDSeFhcmlzZ/PNL
         f4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765428; x=1744370228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgfvES34/jQuo5gJMT63Lo7MUqSbZlUCNclRmTokpVo=;
        b=ecru+Qrb7EUCMc0qIb9eC2mIswtInQhzl1XdSLl6C8TgA7eWLBzX88RtHtovwQa6Vh
         6sf/d7iwpQKPZIEWPZYA6lhaprc19OotSKbWfD9V5lpZlYbCh4Ujb6svZWczLs+oBZqi
         0Tlh2V24Rj5jo5+h9IgspPiKC3x+aru9inwIiphLRIVVwsLaUCt8RwGifPRWV0VqE3CD
         yrBoMqxtqKuiqFehn49PddvFghTT3z/3vfQtoNpeyv0APwZL8GqkbLcIr58PBW3aziIm
         NCVWxjlx91WqHpmVX0IEFiGCWm67oZD0pKy/QFxGq4Q3E6lH8sAgftI1877OYqmVJHwy
         N7wg==
X-Forwarded-Encrypted: i=1; AJvYcCV2xzJ4tilZ7c5ZAVYx/bGRShzWjDgqoQ2NItK3FREsRj0WcN8pFVO9Yl7lO8Eveiz0v+7OW9kH6Ou5bb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeLbJI69oepTCaag6S4ZhAMyIYYbqBNfc77XpR34fz/f+oN/T
	r3fPQYIda9uFGNTLbRlmf8mNfBU/gLBfcB6YVKvUAtHUDiWl7aLiAXokTG4yIhd7V99u43Z49vb
	Z
X-Gm-Gg: ASbGncvAzJLKfJDKdv7NUJUUR9vorNYFsQ1XHUADAt27YhNdmitnkiyY+QXVLtsupDh
	bnmPcGhsRo0wV60elZLBsFJvVPwas2ZEMpFPjg5jaqS6VCMv2BLdKJiJTSXPH5VSf4mEk2CnM+S
	/VybqAYdyLJkNbZPhJ05Y0mgPe6AdNxBrF2zy7ys0+XXxtu+Ylt3AZQJ2cdGyEU3WDQ/IIKtKXa
	zqrZQ2Yk3jgiP6JQf7t2Sw61H7i2emhafcXe5TQ/BYJrwgkFjnDCdudcVfaTHee2B36kRtlzIy+
	LTpbR1RnXIUzhCrVCH2UoAlwupXMF9XxZbw+s1kbwCPOp8sC6qIPvg==
X-Google-Smtp-Source: AGHT+IET56a509a9xLEGWv2kJabDzmV8+5tDLZjOc6T+L8wxq7e2lVWdOkbx0eUnmtA+zDDFjG1rLA==
X-Received: by 2002:a05:6000:1787:b0:39c:30d9:2ad2 with SMTP id ffacd0b85a97d-39cb35a0f5fmr912126f8f.5.1743765427755;
        Fri, 04 Apr 2025 04:17:07 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226cf6sm4044377f8f.87.2025.04.04.04.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:17:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] memory: Simplify 'default' choice in Kconfig
Date: Fri,  4 Apr 2025 13:17:02 +0200
Message-ID: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'default y if FOO' can be written shorter (and it already is in other
places).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16ea..0174cbc448b1 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -32,7 +32,7 @@ config ARM_PL172_MPMC
 
 config ATMEL_EBI
 	bool "Atmel EBI driver"
-	default y if ARCH_AT91
+	default ARCH_AT91
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on OF
 	select MFD_SYSCON
@@ -147,7 +147,7 @@ config FPGA_DFL_EMIF
 
 config MVEBU_DEVBUS
 	bool "Marvell EBU Device Bus Controller"
-	default y if PLAT_ORION
+	default PLAT_ORION
 	depends on PLAT_ORION || COMPILE_TEST
 	depends on OF
 	help
@@ -198,7 +198,7 @@ config DA8XX_DDRCTL
 
 config PL353_SMC
 	tristate "ARM PL35X Static Memory Controller(SMC) driver"
-	default y if ARM
+	default ARM
 	depends on ARM || COMPILE_TEST
 	depends on ARM_AMBA
 	help
-- 
2.45.2

