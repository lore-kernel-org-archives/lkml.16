Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9D2459CC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892713; cv=none; b=WpByuU0E3kImxp0ac81KgVX+s2V37YrCJufvGMs9ojjp5iZqeblY1nLiuhWc791Avj75VC6siMyBi4GHrsWVEi4IjCHfpkqAQuQlRDSdxXEmJBRFo1kp0CRHCEtS3FiLB6N1xujogi//r39STcZbAfmKCYpylCD/Epx8kBiCt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892713; c=relaxed/simple;
	bh=Y2lqZNq6iLqWqOnSydPOH5JyZ2wkgBYP5IWsduUOFdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsxUL1OJhpY1kEMPwQup3y0oR8ZxDVWnGsRVzHlLOpGZgtM9B0fcO39Seck+j/cuCeQ+ljGL9kKvX9Ag0iVmzu84RxoPPrHcgKyMgQ6eqe1Dk4gruJ9K5s31wS4xHZx9u1H0v6xlMPSBFiSq3m050XIoKpmPEl7mri5oROjJc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ki1fBIHL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ki1fBIHL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b45cso10722215ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892710; x=1745497510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=ki1fBIHL49ytpWv4z9SYrRoy95lBCJ0DSli9Jrt4gG3l5hVK5uTiAkQFL4ZG48ByAp
         9+zreDoPqeBo2LtHMz/gYzfcOMDcyDiSoXoq0NjM1acWkLmAhz2t604Xv3t1ru8wLpy0
         /2WTeZlYL+j/ZHKVu7iri2IDJOBRrs0e9opbK5XTkOO1kKnGKWn4XS0YixGIT5fawPMp
         fNRkn18JJ4UffAdcyFZEKFCATVNVbdXlV8Cp4Behmx7Yb/G4dJ5GJFHzCWS6XZffUgl6
         7dQaGXcUsfgG2+sC0iTNazdcTnYU4lIaXuQ9ufuOSll/1mWEF8LIWdG/zVekZxubpNYE
         5iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892710; x=1745497510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=NLDg1JJG6EFLfYL95RmaywADMKS5l2YUfajdgpQtjaPgSlHg/f+6lbQxuIp3pKm92w
         rkCIXf5RpyH+IJRGpQQD0QclI12Op7jBygXxA+sMdniKrdutbc/pixmrfOviDPmZ+tb5
         OIIcSGu7IEfsRIUy7zKANv+lrVUdW5IIg16jEDk+ppad3gEOTIVuOLpoMrQvRyE5Nha9
         PECVAVK6GEgr2CQo6do4VNCH3IiUOjvAIALORaIms76jeMmWGYdZJeYh841h+e+Ta+Jg
         p8imwNviuM6uECbXt73YQGVK0nuMxQpHzk3q1vZ/L6XjRAMSnN58KV5CFeWwJKygqu7V
         Ok9g==
X-Forwarded-Encrypted: i=1; AJvYcCWS7l5KQSoWl8E0fy2BKyybTZiGehwEq3mTTtXsgeY+KJHei6zF9R6FUCgNWRIfP7fB+g+vtFaFyIJJsMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5On+QewkS3CbVj6l/PosgmSsyrEy8wbqGjGLJ+uHGwbi3BKby
	yNqjYQTXrq3Nizisn2L4ibzpavQAke7457uy+Akqf46rY2b26X4oTJIBsBBrQDY=
X-Gm-Gg: ASbGncumlyNKXFC3g0miOamosEt7Jc8ziyjFX7j4xS7KbttB7YqesVu8IYiRpMsPZ5s
	jBlr3RuwPjeKuuU97tZZtQ1lKhGBhcxP8UmmOu/gSdITjB6v1bharZw8p8hPyxxJJdOYwcScjEj
	++DOET0CIs1IqAcEhMCMzZ8gQuuec5gRbfRa6irmalctLLtFFLSGzfBJTLBfc47NwiMlkOhswpw
	C674BmjXmYuGLG13q9cQ5gE7Vvhs2OWJkV3ftiRiSg/C2g2lKYipAT0iHAc4sadTQw8+5bMtqa9
	Mp9AQUnZpB+5+H7QmtopZhNDouQvvTsIgJ3CAXXUBQ==
X-Google-Smtp-Source: AGHT+IFHVZ6ZCfLmCo/4Wa4FBs9EaC8NbnVck/zV+hCmYDXn9aie+ex4Lrhj5kJpm3i3DZVuvfUSqQ==
X-Received: by 2002:a17:903:2a85:b0:229:1717:8812 with SMTP id d9443c01a7336-22c357b1125mr88299155ad.0.1744892709956;
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 08/13] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 17 Apr 2025 14:19:55 +0200
Message-ID: <20250417122337.547969-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index c99d3c05f356..a0007552e7a5 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -666,10 +666,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 	return 0;
 }
 
-bool __init check_unaligned_access_emulated_all_cpus(void)
+static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
 
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
+bool __init check_unaligned_access_emulated_all_cpus(void)
+{
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -677,10 +687,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.49.0

