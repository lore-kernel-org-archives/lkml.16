Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D1221F34
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876016; cv=none; b=mgtMpA/68C9/GvuroWPQ0N4QhaX4KgRWKIePFw2crO6gf5xLi9AHb452hHUeX6+ZJXhD52mR/sz3F/6whljzF/4fYbIgaOwmVQoboCR2/1fMDeQI/qVdem11cRpBJFfSE3hrJ8h8rN6BvA2CGGVWeENBnlvULFdcHOCghWR/piU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876016; c=relaxed/simple;
	bh=zotOVX0GKcJhB9q8CrlCdh+sHyQP9XdYbY/hluH4ZmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9xIHOsGiQL3TP4LvgSKkNr+q6SqCrI5UN8JM1+hf9B6FtK5scbVJLjw91NaNCishzg3NSVim6p0voBGizNyeKudC/FY2STc4nOUcgLk9eUCyTdX0IcQRudoxDudkDxMplMxdSrlocjWAIhSKhYcpdqZvCtYKma9uEpGDkeJSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liuwXAUu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liuwXAUu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913290f754so83923f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876013; x=1745480813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mRl6BLXH5K84xhTJUJU2+Misv0b0a4XYQFm5AwA7mY=;
        b=liuwXAUurUD2lTGbGqmvs4pyYh1kwb7dCRFxXLelH6TqkJ/hbde29ix//0m1YyQ0uC
         rmTtfsVAMw3CUIPwu61oU+iTXpIHHnHlXYK/LaGWe0v/272P9oNH1qKJ1Xy2prfaj2pq
         CF9qcDGx9XyMJSays/7Y25Tp+csAvLSwbCkMUNKdV0mix8Q3fqhJ2IQ3ro/0a4dB9Sri
         ABst3LQkmIh/7WCiUMMW/L6Vri7yv4wkK/XEbhJAcm2v+Ov02YPHLxKmH5fvkQdoxnOI
         ZLus9haAguM84dyh5Dt81o/6Iw/5txt3ToiE5ST6euSC9EzAQ0DeCf0LTJjZuWDKwfR6
         IYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876013; x=1745480813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mRl6BLXH5K84xhTJUJU2+Misv0b0a4XYQFm5AwA7mY=;
        b=JTCpsM1AmiLVPjM9weqAKyZaza+nFah4L9cC6wbc3QSDqX8QLLl0mdc9IQ4i5QZ10B
         4Bbk4Rxq4OZBbNx1dtWEWhsuu6q9KKWiCvAYCOd1INaQ38XPChE5r1qxxjbxCOZCwDPn
         R6C8FDtSkN2QhVuGmpQR7hN2QxeHICHButYEjMuyJeKrjs985y+nIg6uwlePOn6NazoR
         lWFPSkR+3QoO6A5kWGZQvHRLl50CXjbTUjMZ+3UAh10kaeji15A1Kt4NUzhqho7OHEut
         R++aRskcT6QOOSUVRac1TFA88BgdEvQnpLhrGDspe+pyq5RKTMwlHmPZsyKQdPYCtduF
         Oz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXes7wae9u1hzkCSyfg7cGhiyyTyHNjhMBdoQ85GITk24Fi79kva5OnQYy08W8W9V3JTbN/z+l40S7zWig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGIjvsZDgMDUn1nY8hDjUeGAGKQi+V2pfEHmHQ2fmjAQJWG23
	rjKEYkO0gKubb+hTgh5Ov0jYX9mNk7JMaxSKQcVCkkmdhW+C72bzUBO/JZNOkzmetBfks7Y3TMW
	+
X-Gm-Gg: ASbGncui2Miq7aDJJXFZBHsb6cFMucm/pftXnSyvD142CaPxNXSMRSUPmAlaIt/e+38
	6NYS6JEzPlWlyKwp8ojcLO8/xCXlG0wd4eHqKUOBBGDykeX+w0CggbvOPtCymeMKnIX89zFyC14
	NglVM2Fa97npHrKyE16NYkl/ciBe4Zlbl30HmLTDYLGfD+3RA8ewQNf95eyMvPZLEqCfQf7wKHo
	WoYqmu9poaC3uAlHupP1chMNBm91GdGZyB+uCvudP7NzZUKjlTTvfPg81Iprtb+ITEhshSgOinN
	uQC2jl/W9SOk23hK5HXj5PEQDRnD4BwNgs+RLLiolUhcrxPOFEYMlFp/G1umXy1Lpz7Y3u5gXVJ
	NiNSH2Q==
X-Google-Smtp-Source: AGHT+IHLmIpfEcWfWbVkxDsxe2X44HIa3xR8bweYVogbYXiAiMnpleL2yNH6D8LfGendAwXp5oxeGQ==
X-Received: by 2002:a05:600c:46cc:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-44061eb67a3mr8079575e9.6.1744876012631;
        Thu, 17 Apr 2025 00:46:52 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b526ee9sm44037705e9.32.2025.04.17.00.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] perf: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:50 +0200
Message-ID: <20250417074650.81561-1-krzysztof.kozlowski@linaro.org>
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
 drivers/perf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 4e268de351c4..278c929dc87a 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -202,7 +202,7 @@ config THUNDERX2_PMU
 	tristate "Cavium ThunderX2 SoC PMU UNCORE"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
 	depends on NUMA && ACPI
-	default m
+	default m if ARCH_THUNDER2
 	help
 	   Provides support for ThunderX2 UNCORE events.
 	   The SoC has PMU support in its L3 cache controller (L3C) and
-- 
2.45.2

