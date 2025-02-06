Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABA22DF84
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826613; cv=none; b=Y4wvwJ1bsqFdNqJ9FWH/a9vReYc86u6GmXdoN+QX/nVai0fsFnfhdcp9bxFe1yl4lEGKzmBsrrpLYUhocYGFB6+dfOEPkupuhzpcHnaO/jU2aDIrD2Lur9bMqak6vE70wMQnykoQgD3cVqNZSfX6l8MJL9vCNyCPiQKM9lxTdkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826613; c=relaxed/simple;
	bh=Cw8hFyaXgWy3bdMMjpJ7k6K4Vod4OUBAmQtKBzIis4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYB2AUnjhdWy4cLPxsqs+ZkE4I6RVeEiO8hENdOln7lXziGT+LwJ2V58n15OonMSt1z5haMREU2RjRe6o2rjJTm/CjF73H2IVCN/Z26F8wwABORmBubUCPc6YENaAmfnWAbXgzkCZiOwc/bF8h9H9c1Kuzhe3nmqr6mRWKFZFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CF2o03DB; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CF2o03DB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso955604a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826610; x=1739431410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYw8eDaBPoa3lZTMqvm38RPB8/mlpG4q3+7Mk5EH9kg=;
        b=CF2o03DBBQXjqy2rAabOZOI0ks1+kzNgDtZ+sh2plQt9LIT63z2tfyp2xTGewu/ZjO
         d2OvY2BJiko+sSlB+4htIYejV0wKgfj5zpzLjtrbzY0v7QElw2rFW0JgB2WfMMhfrhRa
         753pFhOVtBTJv1rWw2IsKSlivRZCnjlS8uGpvhD1OQUWoop1fg0n7YKttlcn/VJ5qiJw
         um6zeb30Sk8UI62aD63Kc62iJ66Y6FLGFob3PlkbSBpT7WpL+s8Zbd+Cnzekwdlp6eDN
         Ot7Uk5JZch3MJWxc55J0I9JYliJW2Rzvrw9QTSxE/SnHdfiggHXIVFRxz4P5tVb8UGqN
         WGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826610; x=1739431410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYw8eDaBPoa3lZTMqvm38RPB8/mlpG4q3+7Mk5EH9kg=;
        b=Uf8SqdnmavHE6bUsCyyb/Msm6MJRNB+sRjo1BNIoncOOa48auHMsG8rdDKrfkzt+fU
         ptXXQ4BgdZK0EWkke1jRvLai+mXWit1EEwWz4TX7DSeNq17zSRMTAvHMEL4uYKZkH4vw
         oIxboeNgPinK9ojZIyIoSRQyHw1emAowmWto4VyPOYoeGJcuZESzysvTBYporKbEs/ub
         9kVKr4Qrl1TmGf6rFTZ0rXUKQfxo2sp7jpvACzH+ehHr0UVgZad/fk9XsO0ffr2yhQtt
         TX8pNJ60NzjBE6DS8yNTONnSvxaKxpmIaG3426VyCuCLK8uKW5GVaO2zaJGoYsmt8Avt
         6T9A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3hMRI0Nwanm/tlKpox9Ni6xz3cL7BGkCM4nO6YnqHydEwKC1z3i97DPwbkFmAdquB6AG6pI6wpRhM3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS241NtdrOKpe0SpiUcIviYixhQyci/D/8bSaDv48nejmyHpA4
	1BcTWoP1A5iif23oT4PKRevNiM1bHol6lEAccaG6jxupfU4ojpeVb+7ZMs5LPnA=
X-Gm-Gg: ASbGncvLkNDYP1ZGUSKphFJbytAyBE1pMNUfflTTSRuAfR8J7dKrjwV+4hKqBexE6KR
	Spk3nzdSdueudOcz6vL3dj7txv/BOrGTm1sGU0Mz56y4Eu+QcrY0M5dNR+aX3qZt1XSAbt8bvzX
	U9/WFVIS6jRBerAJLo1JJkyP91lQzGSnT5/ZwGPQX9NxLutw3HLFLB1HnJIrBp71ggGA7bq1+yh
	JYpgsBRz5EdHPsOsWrvxm01gjGISSBmigJOQVoDT75oad3SLzzrgs8aBp/rSBhbROZvyq26Jk5N
	NYN4zNoqG+cBUCtAMB1+B41oVJej
X-Google-Smtp-Source: AGHT+IFmp7b1yh0QEKdLgrjIIYD49wESbW2YfC1lavQg5SmkfBv2dPjIMLPytR1zKx8iqVccmwXu3w==
X-Received: by 2002:a17:90b:2b4d:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2f9e07673b6mr8850611a91.13.1738826610015;
        Wed, 05 Feb 2025 23:23:30 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:14 -0800
Subject: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
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

Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
extension, ‘ccfg’ for Counter Configuration) provides access to
delegated counters and new supervisor-level state.

This patch just enables the definitions and enable parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b4eddcb57842..fa5e01bcb990 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -103,6 +103,8 @@
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
 #define RISCV_ISA_EXT_SMCNTRPMF         96
+#define RISCV_ISA_EXT_SSCCFG            97
+#define RISCV_ISA_EXT_SMCDELEG          98
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8f225c9c3055..3cb208d4913e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -390,12 +390,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),

-- 
2.43.0

