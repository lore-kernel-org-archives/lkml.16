Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261A224AFE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826602; cv=none; b=PLT3t4+pBKOuWJfG3J2ka06AsukdhxhDLIMI30mxCPLzVb+E21oMXw75GiALPU4UAkXoIIw+MQxlnKKznCueuWvXVa5U/VN1FtFTgxhVSUnrKowDsSb0QaO68pC+bOUhNXOkrE5beR5X6QWY5Yfxe/20U8x6kXK1v2zalNPqBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826602; c=relaxed/simple;
	bh=F4DjoUBQe6/kcWYhbsJGiKZXxvav9OH07q13dJJ6i5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHmuqf2psCBOYM5gO4jcxxXxZpda8cOKI8Dsh3lG1I+rv4h8ylEt8btoJC5FXIA81GHfQrhDsSyQw3wxpx0YOWR7NMhXGdlsteV345bagncRvhfYpHRKoOpyBfvn5VnQ2AbH3dMG3AnGZPOgK5M7bc+R86yR92rW5C2/gtRcqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xxxU4FDI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xxxU4FDI"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so1038402a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826600; x=1739431400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJ5m0Zv/n9Oaz8jMiZ4dpuMO84fRe+qZfct3W6wk+oc=;
        b=xxxU4FDIkzqcdMWvIo2kFinhVHpZ/mWZb077tx1GJkYDvQmJ4c4oae1du7zCTQJBGt
         GAxAZJG1cjH8FNSzqi1UjSVbg7eJJ54bqb+brQDGxX+qGvvwdjXqQ0msqQCoAPTmjAyu
         biVbSp7FXOn8YQFUJZH/47umxscS2UFiaAfX2cRWaSxEHJhZK7PZORodEqsVnEg0wptm
         MjdMYCb/ZCTMrMbCXwJCgEV/5zAzDYMciGQWXz2DhbmjDxHvuvuo66cPwn/v1GfOTs9M
         7m4tBEkPZfE0i/yrquwDzIYmjPSZzk3rZLoyqrV1AQ3pOai1FdstaME6M1HjXl4/ln1P
         OMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826600; x=1739431400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ5m0Zv/n9Oaz8jMiZ4dpuMO84fRe+qZfct3W6wk+oc=;
        b=i2A3JO/sMXtPTKI2tl5OZxulwTvofuqMebbZEgx0VVeDjOUwl4fieSyxb9tM50JgmX
         zvM3Abp/JlZ+u06OcUJUz1/obEDm2n0FqrhPXI4E9KoVnXP8sVfHFfLvqpvVUbcIYI84
         +uAohmUWGaVggPLb1L1ph8YurfXlzGV7BvW+jT7sAnOE+Mx2415zOqz6XEE1kctNt+G/
         r1FDbdCOKUR3/XyXEOYnaULzeVaiXLu3WRQKVi8rh+8pMtQTYFFPrktEj0DiTQHdoNUV
         Azqaudcy8dS9U88+eVCwF63SL+dc8E1cmW78leh618UYl6Xi6PxW9hlI4OZoZn8PhYLf
         P81Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSbMfcFEy42gCFtgAOt9/ZgkWYiZcJt3Czq+GF3SSh14DLJzsx+iOJ90Nx7DUHiVFl2s09M9g2RC+cYLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjjDl7sNCAt0YcXkzDe6JPMhV60od8Stk9sbMLq+ynHlK5YCRv
	BYgpPuL6wbhGGsdCngpIG+vElNiaLmXz2gdTIdNpM/f0obbnIUrI8qaN41pYOVQ=
X-Gm-Gg: ASbGncuswyXqvI9QidbNPsh1OrimW1BgBj4ojqYXZtF3CtqDvKb8v6qLj24U0uP6SKS
	2g+yQLbovTqIHJ70jfBgAt5t/1kH/6pVkqYz6SkJ6EHYUMl/9yLsJxs230Ivq5wY5TBs7Z+cWzy
	5RAcQeyjsKRJAg0gCciSuLuLlUjP4Y6JNhVWMNO/XscnLIJLIJpjSGURRnHHWhC3YI7SlzJ2IGI
	JkHoPeqZR2Y23Nc3B0vwk0xBBj608QxZkPPVOlmkfVGmWFLuDYpRRxFtxRg3vTC7wmReBNv6kxr
	0fbAZ0MOvft2K69GE1HjyxJRfZ4a
X-Google-Smtp-Source: AGHT+IF7N62GzT6UR79bVSug46033WXYgVAcquwI6oHxNyG08rwtx9LdnCcav0B0Haf/hbAqjbl9EQ==
X-Received: by 2002:a17:90a:12c3:b0:2fa:ba3:5451 with SMTP id 98e67ed59e1d1-2fa0ba37cd6mr1441805a91.35.1738826600432;
        Wed, 05 Feb 2025 23:23:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:08 -0800
Subject: [PATCH v4 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-3-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..3d6e706fc5b2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SSCSRIND		94
+#define RISCV_ISA_EXT_SMCSRIND		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -109,9 +111,12 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..c6da81aa48aa 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,11 +390,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0

