Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F421DE4E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770406; cv=none; b=oWF2L4nJ8dtdlE+u/vh9Q4DzHERFr+WlrGG9grVwDwIgCOIZGRn6k+kAXLi3iOXiRqUncNSPlVINi6BTVQjG58OvnPvmZmDjAGSKG5Llow/Ok6k3I6HjAnCglbhhFWJtv2QqdorGodW/1vzNvt9mhReviAuiSfeUV/1COwYejck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770406; c=relaxed/simple;
	bh=ow9gqO7eFp2FYxDOYnJaH2KbWRrtLsiqWzo5C4iyYoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p357GN0itEufx4Izo6tJTZ1eRi2b7LtJuFrQsH9E2chp+J3GhCZBXgqsCtGV8N/rzkU+7jKenF/MNGznxNQSIg2DijSnRj+oMa0Zh0gVjubmvYUGp2ZuyM5l+7sZfn3WjjFWC1X6b+xWXGX2TaZXBM0shwf/GJxdYr2FGxCAPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ltm12TlY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ltm12TlY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912387cf48so104093f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770403; x=1744375203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXiYIvn+BUcCubjmRBFccQD3FCRydhDd1RRaxLlQdJw=;
        b=Ltm12TlYpzccwVKpicknmdaKFqEO7K55kTae4hNgQmWePKlAxfhZNPiB1WLLT3NU5i
         GZ+xnupH1ASjkxhOrCRn/FsJTlL7NFXGPVzULqIJLhHGJaTgx3WOT705thE3n941QR8Q
         Xpmog16qgg+IRIJpb/x2UDSIJ322aMWvhUq5NADrEZYGhv7j5yNY3LlSyP2GtRfE8YTG
         VeVRXGqzDPixLi/KUNZEmdz/5OIPZYjpU+pz1JNnfjCWMeb4lCEzqlQ5tBAKiWjodXXo
         6fZeXIy5PSDvW/y0Kuxtwi6Q2xtDl8QQddx3Jlgk81OHwzDPUCfRcThRWJrT52ouOi2q
         9y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770403; x=1744375203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXiYIvn+BUcCubjmRBFccQD3FCRydhDd1RRaxLlQdJw=;
        b=k90sgco+uLg+0eMgXnX/M/JYxW3vfu8gDZJCXUmbBhMun2epm8XLcYnmod4WJkfocG
         /RZZ0V8ZKXLplzDw9oEWCVFUCN/2EOjwK8CJG3G1tDiKKgTZ4xVGB8q3rfCil7hHGZGG
         Ohj4Tf14OWs/NpvinV8FjBA8NuRmDyv7Yb8tz8HxUZw9T176e+vrnuykAGMlVf0eMclg
         XzgThrJBpuUX5ZDoZdzKqzmV+oOBviLPmj/Vgh7jYJI+Xwj9ovClFcBwIJ94NMe6MhAe
         G9UQQkVAKzUzAKUAqyS1d+BvoCvmICLqkcuJZhzCl8BCfB+2Wo/de3m6ZUwvi7ynt+8m
         N0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUIcIaQiH+ByFgM11CA4PpPnt3uq9myBVTjs37GI0xqc9fIER86/DQ/S/B8/I3gPR4rDApn404hCZGYqXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqZ5S3nLr7Fst6YIu+O19+2LCQkKD5EfhK0TehomYQRjX3ebl
	UZpXxzby2N73lT3fikgiFfg9QXNk1+y63ABVzDVjDwewZZOTi3Kh6syU+SLGc5g=
X-Gm-Gg: ASbGncs7pYHqwvQzCzSOftQyXZEwMIxxICEj/dsSeo4wlDHzb+Ib4qjLFy+ESL1T2Sx
	RvjQRFB00SzAZuK+Y8dMqaAQrnDQCKEeML/YBnajnfK9nz11UkAWroCT0drlH1oTHzkCZEXz9K+
	n4ukTYOXSGsZV+jqf/bwNDrWNnakHaiOHpQTsVrUxwmoqQGByMDsptN+OikrRaLWjy0/Z1AqPJq
	CXztzqB4RJ24/Qj8DfIDMWjdGsz6ocnzalHT59jYO1d2MIgH0AkxZ6vUdn8+pfwZwiIEavgQBCC
	UXm/1JFcuGzS3OY/F39RxczVyJSJhaHeDBVKtPfcXDykkHpIR2DySw==
X-Google-Smtp-Source: AGHT+IE5wWt/yUGgqvhavSp6KwjTdVBZAE3cjP4dZHsK7r6/lTQwPIXiPHRLMZ4AJ3sKwHjJHHtgPw==
X-Received: by 2002:a05:6000:4022:b0:39c:30f1:beaa with SMTP id ffacd0b85a97d-39cb37a8010mr866634f8f.7.1743770403153;
        Fri, 04 Apr 2025 05:40:03 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226dfesm4308954f8f.97.2025.04.04.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:40:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] cpuidle: at91: Do not enable ARM_AT91_CPUIDLE by default during compile testing
Date: Fri,  4 Apr 2025 14:39:59 +0200
Message-ID: <20250404123959.362684-1-krzysztof.kozlowski@linaro.org>
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
 drivers/cpuidle/Kconfig.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index a1ee475d180d..4d095f435b86 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -89,7 +89,7 @@ config ARM_U8500_CPUIDLE
 
 config ARM_AT91_CPUIDLE
 	bool "Cpu Idle Driver for the AT91 processors"
-	default y
+	default ARCH_AT91
 	depends on (ARCH_AT91 || COMPILE_TEST) && !ARM64
 	help
 	  Select this to enable cpuidle for AT91 processors.
-- 
2.45.2

