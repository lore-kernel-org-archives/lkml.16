Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F327CCC5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321541; cv=none; b=jOCNWt60wG3RkRQnyz1VAv8dOVUzpdyGsDbc19W4XTfZBndetu5iJ8JnaR9ePNqr1T5rnqsUav0QkvMfUaaDRUawj3TpuBx4Xhc+DGDZojMAxDbWUUo8yReJHgoslLSODQmxUH0LPKMXoYQPoBubyPVY+9GUI4pMovgGmHd3m3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321541; c=relaxed/simple;
	bh=pBi1MUo8cyhJVlwqE0as22e2neYDMnkEOd5dFu8AL0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8BrjhJnOnub6UGfLRTJMYL0/8JweGfKGtbtYniNh0se+jVuUd5EzRh3jHdjFoI6T/YUiPjw33ve9h4h8uT0+iwzegWojX4JBrtbFjFIbGxRvtsXg52kV1fhBxVKQjZogeEUCiImxfcVM8bYTbKoQYCJ5ZLY4UCd8Mpw2qEmDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYPl6CiW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYPl6CiW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4370139f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321537; x=1745926337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=KYPl6CiWNaoCBimlWWGfgTjsi76msswKk699gf2ZPm42O+rozUPrSO+49drweDDGHn
         X9KXjPBPmL4eewNa2tTeuuNnEToxiSvFR5Y4tiEN8sbNfZilc6B8lyEzA23iCYNPoIp9
         KQQcHXBcq3nM4042JgS0AtFjyBU1c55z3l8AH1qzPUXV4ha6rdKY3UMETJF0uuP304QG
         L9QBOoJWWUbb8X4c5zz7Bbbltum1D2Z5q1VgloYhv53O+vnKZFMPFxJcY9kd10jN1Uen
         wx+eGM1HtyRcNo53C42tZ6InADhlwgDVW3R3WBAWvbWlb5PnN85al+ttdhZo+3ggmvwo
         +1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321537; x=1745926337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy9n9cFpVQUkUpiWIEsm4sdpu3oKdgg9Qw5HeontsNc=;
        b=ACFwpopHue9GUAEHX2E+biqklKZMsPldRAULRhNwah6tSNTz486y9dQaZfVE1gAmDs
         RFDsxyI0D3IPrJZi8l3rFEEdcNjWVelGUypVibbcckT1ygcddV5ng1aWHxAUXuVKlHUp
         ubJW7Evz5p2TU5bqd+S46k6GhGOkYPux05Bp15WgrkqBs0Cfv5Oql/CrjDSyaTPdVlAU
         KSWSmK4huNyTJYRVjC78Ds5Tq1l2a1xbCZ+kYrqB2kRU8Ys7JDqWNP/mLKw8qPDWJSw0
         FzA4S0ArXkUv3JdXBpcFxR86zskqcbzFyHGHKcre9zcrFEGDrytlyBBnjvTzQrlRa7PP
         QFfA==
X-Gm-Message-State: AOJu0YzTFjdLNyMeJZe6cN39LmiGuniMMtZC5uVZpfYqkLbkm2sjWHG9
	8VkPdXoxxxpPrXCHz2Ml0MgMD+4vKlq72aXw9KrE/v3goBkHIoDtTbJojJ5wHSq5FNPg1eJLJJt
	h
X-Gm-Gg: ASbGncsxAETZLI+bpAxj2lSfUnvV3/BV8RiZugKRdNiGvpGPe0xTnh5sgD6FUQLpO2k
	Yh9heC4kuVJfHVru/H7dHipawI7bsLrI3Eq74v3cBFLij5Dfr6Z5AgvUY1wjsYw56FozjNiZBKl
	i4PbLlmNBKi36Ak4Sg8xjHFWjjmIBLLL/HN8HdwHVWqPhcYaiYLAeweq/r+u2cqhzKiPs+/9I4J
	fyTsDjSDa/b1VMtXkzlH8Zr5pC/JItt7yXPx5nVbxgfT9JQYwSQonh6hqwxO+dM/CtlJOeDEx3H
	ya+PKNvKmp1ZAjuoNt1u8HzyyV3z0uLgJyvD+v1Ix5tMnEBB5PnScrAwKhF6fLE=
X-Google-Smtp-Source: AGHT+IENApvlIOcfQcL0LZP5BuyV0lmfNKeMfWGxAbuT+pNZSoLQJuZ1V8if61aOzV5wetgPKLvcAw==
X-Received: by 2002:a05:6000:2510:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39efba5a86fmr12045598f8f.26.1745321537318;
        Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:16 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 05/14] Documentation: kmemdump: add section for coreimage ELF
Date: Tue, 22 Apr 2025 14:31:47 +0300
Message-ID: <20250422113156.575971-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add section describing the utility of coreimage ELF generation for kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/kmemdump.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
index dfee755a1be1..b67dc166905a 100644
--- a/Documentation/debug/kmemdump.rst
+++ b/Documentation/debug/kmemdump.rst
@@ -17,6 +17,12 @@ kmemdump allows a backend to be connected, this backend interfaces a
 specific hardware that can debug or dump the memory registered into
 kmemdump.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and specific
+ELF NOTE section with vmcoreinfo. To enable this feature, use
+`CONFIG_DRIVER_KMEMDUMP_COREIMAGE`.
+
 kmemdump Internals
 =============
 
-- 
2.43.0

