Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E9318EFD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765855; cv=none; b=Xl7KgNb9JsB3IcFlncHCco91Be6xIeKb/1u+NvZbt9eCCuYOvxjCNPzWWdkN+pRXMXX05LOcbgY2WAVbrHAmX9WOGtBmiJihmDVFDInRdfUQNTtA9/8rMi9y/Npzjtpbjs4USCog0TJMYFKOpovoe0CCLoAJDKJvEVBXr1jjT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765855; c=relaxed/simple;
	bh=ARt7ow4j4CvkmmrzkHoQlA766Qav0eszXFeQQ6d3np0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fn4Xv2PiXfZvtysDy2N7XZdzMoT6gWSQJVkMC1sTwASo6DzQkaZITBQ/r5yUdAwKcwjnha9lYxVlhaIA54ro0qbT52wSPlqroxSF3fCvS+R36n6gvMGWxw54qrMl6k9SO8lt7B/c5lIgESGw2OjRh//7GF+8sVL71LtonnqRyKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DbOMUfT+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbOMUfT+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso150562f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765852; x=1744370652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=DbOMUfT+wSdMJN7XYfn8IQEA3EguXwxS5/sXyvgXlpS8rQkOZtgMdJwf8Yce93QS0v
         QM+cBk0A8tHLSVxp5Gz/FmydDpMz+mroGsiyUVkOuSeqlipfQS8tLF0c1QInXRyJCfKE
         TEUCvK2cOVc8Jqo+dkQsJzBl2pUfvjOZtK512/TKWj9lQhdb1XSVPoGkPx0bvJRgCqsr
         BLZzSuCh6Lgg8r2eKfHiepVmY1mVzGC9EdLVr3FXt1269x8Q9voBAS7DYTgRv2CTQVMw
         S+jRRjTQEA+Xwr/sDWcTpBQycibSabrHG3fqM9o/TMwHuT6Z984Jmhu54gkFkrnzVQiE
         00WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765852; x=1744370652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jUjt+XhjUvh1I0aAWgVoLBSUgPdrIuXqPuTwG7GS8U=;
        b=m0FEzN725cnkg+icMu72hzPeBnRGEwJLOLDbgx+k1etlZbgXIstXJQhuQKBUjHJNNs
         F2zVklP+oDRO/UaMBcyOqHcDZ38FFbcP7ok9b0QYeAiFZ41eksrd7OUlwFz+WEgNxNSF
         mFpvxK0n7pvcclzMd1X0Kxosk/nSS01orNRIvKBgU4Z9W1hrN6aubBWeR/j5O1IdNWai
         Qe3jD7D6DB5mcmGnZWn467H1nMSe7zR6cM/tny5uDfB2Ri/Bujoce3rhri4MLgE/lS2W
         l7pXXYlmVU/vwyXaUWTYOnd5EQEKe7QUtM857P5K42w9mHLhHeckSg8FmvwOMTOovV0T
         tIRA==
X-Forwarded-Encrypted: i=1; AJvYcCUpdB3Tu0EDXJt5mlC+kx1EPmFr2EwRerHZBwVhGfoYmH0TG5SzsBqEoOP6mTMvRmHPEJMqyWSmRFgffgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Qw5rkIGBJyU4R6r2Y/bPew3CvGW8FgW+1N4GbO4oRaSiahTh
	/xqUlHPXtx5thTvl/RaVXxEHIG/45XCxKfNEOa43E0qyfai4gzmjb9TWp+7iusY=
X-Gm-Gg: ASbGncsiLZM2s3PQJJgDAu1ljXJ6GS5QpMNjknsfSVQaCcSj085d1fJluNdtREXStWQ
	OUD9FTTfM/nkS3dwLKwMUOw0k8DrCmBQ76VVXh6sNiZ6I6lskKjP1s0viPu5jJ0K8WM4SU+QiBe
	8cH04lyY2+yLOy1GpfULu9XwGv+JpwLL5N4KQkJP5gqu2nR8aq6rAPmD0m/CExKcdkpbz6Kt8x1
	0i1uEd7CgP5lgMuoCv19NrNcC9xvGYU0+xcJX6nB1388Z0Bn/vqP2lhW35xiipMfXe7kwWmragZ
	L6w0YWwqDZMs5lem8EzWc/9zvOOptPie29pITG11f+9wQyLqajWvNw==
X-Google-Smtp-Source: AGHT+IH0xDqfEbADnFxB7vDYTyNme6txywLT76cZgxeW7WAkJ3R8qDIzLSJ028j7QznnYBlvsuDHag==
X-Received: by 2002:a05:6000:40c8:b0:39c:1efb:ee87 with SMTP id ffacd0b85a97d-39cba934e63mr788410f8f.12.1743765852236;
        Fri, 04 Apr 2025 04:24:12 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b17sm4149403f8f.92.2025.04.04.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: fsl: Do not enable DPAA2_CONSOLE by default during compile testing
Date: Fri,  4 Apr 2025 13:24:07 +0200
Message-ID: <20250404112407.255126-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index a1e0bc8c1757..47870e29c290 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -36,7 +36,7 @@ config FSL_MC_DPIO
 config DPAA2_CONSOLE
 	tristate "QorIQ DPAA2 console driver"
 	depends on OF && (ARCH_LAYERSCAPE || COMPILE_TEST)
-	default y
+	default ARCH_LAYERSCAPE
 	help
 	  Console driver for DPAA2 platforms. Exports 2 char devices,
 	  /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
-- 
2.45.2

