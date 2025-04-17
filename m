Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A021ADA2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876003; cv=none; b=jcashHAzFFa/Z9WdUH5dc7BCkH2kFW62mYEJDupMsk5CZuJvTd5jfPZ8K0weyb2aU7jRTXXOLtCHXK6ueGTy569y+UrrEYGkF70/yt5XYOOVOx/hAAbvopXOQ/foI9rDel3U/pVBwt9bb0BPOtvwBC3sgjySe02k0jcnhEfea74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876003; c=relaxed/simple;
	bh=tMQzWzBnniAx5rk+EeqFSOn4cd/MzHon/bXFCu4cUe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZzjeHmb11HuIlvfl8diAl914/VorOe96FCfRqEFCng2qqu1CYEHKD/m4cmJME/Kx/U8Gat9ixw/+KKgQC98gZL8ZQU7i8tJYyfTt2aGWHPg2GAxl0pQeLFnfBElfihw6urgQLdS3TaZogJ59W0u4imfza+6vmdW3YLua0riloX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqPwu8O1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqPwu8O1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912622c9c0so74783f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876000; x=1745480800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqFJhe3fk5yFBKlXHJgDCuqjovr9ww4TiQotyaOjXdU=;
        b=NqPwu8O1ltH0PYNIj5UGuiy+t7C0b5BBvFsPnVmcr56t5KTAISMi3x5a5o5kybTLuR
         Dom+NU6wRfyaBFmvmZPsEzdHbFZi4Mmg4F04l0kvfbirjcpJOOF1mffqBPxKBiDTIlPO
         y11s5yiuS6I29+tztgKCLM5SkXypD6fB+B8m+MeVJCfBlM7kGYnneZzTjGWv3ZzNGn98
         cV7PfT9mf8c18Gg/WdPJG4wzMi+sHeR37MRzwq+kfPtSwz/G2/mvUbBSfPoEX7vezRVv
         Q+kMEIa0wF1iLqV/w2cSb+rJOAUazNqtbp7Bii2zeYzq+OOKFHTMpsOdsp9LO90Vzs13
         o4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876000; x=1745480800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqFJhe3fk5yFBKlXHJgDCuqjovr9ww4TiQotyaOjXdU=;
        b=ugpYY//JyZW0EotXiC7xHeSo5rQ5Is5VHcAKkEr6J9xzsu6Rebdk8qustJAx4WFnJW
         +ml9R70q+tMuzz6qn9foWK4LVEhqE6yaObp69FZtgDELj6vkIb/ZSgZK5AfvaE48d3fX
         Ul9nx8lPFzCfI7fFBWQLVEk/pLKqvyz/r1MOHhnEaFD59RN0gKoArhkkr4o/r4f7FgdE
         u+9vTK9EX2HwWrCvh44LOdaFMph2ZTvCqSix219Mgj1pNDvKCiXGXH7bP8GLaPnjDjvs
         DrEw1mXC5zXbwdzNd58sDAtLEd1bmK/Tehmd7baI6L6YxkCD48VcBAjWVdTdwU4bdjLW
         yB8g==
X-Forwarded-Encrypted: i=1; AJvYcCXGn7KS4kENCF4P4dMc/vFwDEEG0ql9gL/2MFSxd4/it4pDfroS+dPQDBF0e8Z1Z4TN0iaYFgBN7t7EOQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+KnDayeuqNOXe0pgbCT+PDQvqgfHJfPIzEXOyfRjGHQzdcpj
	5TjdCHfwQ0sRpOzY9KhNYrPvt53BN+MuEbFrVdgnNTErX7oNcIbIo76CaKTui90=
X-Gm-Gg: ASbGncsQ7ibLXON8E06GvQNurxUoUBOl+Stko6AOkee+nC+uGy2w8lQn9BcYe++ruHe
	++EFT53p1Mvnuy9PJM9s8e3dAhWPPGIkuTs41hhrVtpaBkZyOm431/yq0Z5CSU0VucGke0TJZnD
	lOEnILSkRojuZ3d1GkEHyBA1cJOKPTOdEVf6XEFUN7wmKI5LSQX4ryPChszP8AtLNvCa0yJ5l6E
	6ML1cmGiwhs89rlQPziTd1k0URkPJbQinQtaRWdHUp16USEk985GflG2Kkh/KpN5mSOUJU8R7k5
	mhpxr8rvnjQIF6lrkwhOVI11309Bds4eovKaauhdMSGtqX5m0hMaurwpFSf8Bx8wA5Q234WfFxV
	VDNsm4u0v8rsuiWvX
X-Google-Smtp-Source: AGHT+IGUHnidkuDlHE8kYyTwUeGcsum4lorsxEkRuIAHsC4LRbi3ea/WsFZ1fQruK2QZL3pK0Ycwkw==
X-Received: by 2002:a05:600c:4f53:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-44061ece26emr6534575e9.8.1744876000074;
        Thu, 17 Apr 2025 00:46:40 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b53f29fsm42835765e9.37.2025.04.17.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] thermal: hisi: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:37 +0200
Message-ID: <20250417074638.81329-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/thermal/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index d3f9686e26e7..510c2b821546 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -257,7 +257,7 @@ config HISI_THERMAL
 	depends on ARCH_HISI || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
-	default y
+	default ARCH_HISI
 	help
 	  Enable this to plug hisilicon's thermal sensor driver into the Linux
 	  thermal framework. cpufreq is used as the cooling device to throttle
-- 
2.45.2

