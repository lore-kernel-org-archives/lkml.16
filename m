Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90162512E6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223377; cv=none; b=f9zX4X3yySZL2l3JN50gkhReV8D3DzX8QoaC2TuOzv9DFg//oi2ZwsG2sn+1wJpCGCtcgCnz3n1JxOJtCEoqrnc79ikg7lDfXQQC0BITeII6cZF4+KM/+V7cUPrSmFQdZ3AQ2QQvsi9BkJbTxwkeYroVYzCGnTdIup6tGZFBkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223377; c=relaxed/simple;
	bh=B4l5ww4xM3ybuxVDnFD7O4s6SCugiqPi0tOYv0B/adg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aruVUB5SZTMzdeiUHZshsoRqoaFKN8vLH7NAQm1yAJP1d9JQ10Cryug5UklN+MqZAWGqHz+COY0qjnyW67kXNngrLpBZjdERykf2eCrcsA/JgLafDhXGGCG+5jxb7dK5GHG70Y669NqLCfswh3bVJLXAJbHvDBbVcd9D8mrkgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lMnD5CEG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lMnD5CEG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso25636275e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223373; x=1739828173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=lMnD5CEGFmwiNpSSMeoO/Ijj/7bK4sm+7xlJhbqHB46ItuSs7YjGvWsRNeqtq+F7gU
         8kazmQuKtzPzM84J2JMdTCIwzHWHPsaloE3AvmZHNnJWFEoXLZThW1k9yI/DOJ4Uktgd
         SGkpLKKsF7mONDnKPyp4LDutV65sFEahCgvWLW4+PebcS780PaGFlyekCr6JPbc1qlGJ
         FfK3ftWt025K7F8L+t44FdUjC9hfnz0F18ep0z3epCdy7VdK62pAmapa1xg4kd+U1yHU
         XVIm6rUw6quQ/Y59o1zqZY0loMfzEPfUj03Rkz1/3XaWNPEE2sLd9KyEg/IFkEiL/EVx
         11Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223373; x=1739828173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=NuhyjC/C1331UcVYenWX+sEo/izXHoDDTzK8NdjhA71bdaB/XQ78OnSssk5WdDM0O7
         Ay07H0QHWaiEYCS8lwymvxMPAe1bj4khyjUSU/WTmVMcbbD+2bpLwXWSWeUL9phjM4MU
         eb1l+O/afCtvuBQu8Qk+Vj9FDeqIkN0MH2APTmP5xKD1WcjaiNbA1bamZ4f6C7tOgEA4
         haHB9I4ppypWmtnCVWnw0oAwpkWr/zXxaNmHXTX78plJ6Rg4prGqJlFAbnxyV4t1FeKI
         EzM3mbvnnRbzPmdLWnE0PdPklCmLqabDi9RkopY4YjsqpZIpfqwrCa1/oPROoDW9gqM+
         v+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEFKc0G89P3kGRDN+n/H+D2kEfDibnF+s7aPkxpO56kzGhj39SKuMFiUhe0/s+pmZEuXvULJ2BVMTuyYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5O4Et0BTn5gO4NJXTRFOA+DQ/KcOIwWBosegqaKkRKk9FY1V
	k8Uje5D7F22Nf9l0LfkB+PGDhE6bplP1t/0MVNdenLvjprxBKoXKZqjDBVarJI4=
X-Gm-Gg: ASbGncuLTszTLFI+xWKKT3S/pwtKHFA2reaHFegDqoqClulZW3x1vKPO2t8ZbZl1ECM
	ATIH3iRT4rnishe2qgAGW3wrsUWh+tOij4zIqHjQoX3cPhcdMdkM7jExqmRZdayDO67y6VpdAUT
	sMMJOLHRuHKQcls0aib7Ju5ZNlVZee3457yoqlHBchnwLYvpi0k2jZm3LYM8AQXLMkMalA2OAvx
	ADsLa7xOFHVg99qohmHgKzeAT3OdqWqJV42NdHEiDnSgdh3u4hTViy1cU/mF8l0EhhFOGUKHBc6
	aBCBMCRTgsC54m96
X-Google-Smtp-Source: AGHT+IFIy2UHszvgSyStziow4xh4NgDeIiWhARHb24tahmr62iRvzSTuU8RezdSX8BLezNfYx/izdg==
X-Received: by 2002:a05:600c:1da8:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-439249a7534mr117351975e9.21.1739223372921;
        Mon, 10 Feb 2025 13:36:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:12 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 07/15] riscv: misaligned: factorize trap handling
Date: Mon, 10 Feb 2025 22:35:40 +0100
Message-ID: <20250210213549.1867704-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

misaligned accesses traps are not nmi and should be treated as normal
one using irqentry_enter()/exit(). Since both load/store and user/kernel
should use almost the same path and that we are going to add some code
around that, factorize it.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 49 ++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8ff8e8b36524..55d9f3450398 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -198,47 +198,38 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 
-asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
+enum misaligned_access_type {
+	MISALIGNED_STORE,
+	MISALIGNED_LOAD,
+};
+
+static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
-	if (user_mode(regs)) {
-		irqentry_enter_from_user_mode(regs);
+	irqentry_state_t state = irqentry_enter(regs);
 
+	if (type ==  MISALIGNED_LOAD) {
 		if (handle_misaligned_load(regs))
 			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-			      "Oops - load address misaligned");
-
-		irqentry_exit_to_user_mode(regs);
+				      "Oops - load address misaligned");
 	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
-
-		if (handle_misaligned_load(regs))
+		if (handle_misaligned_store(regs))
 			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-			      "Oops - load address misaligned");
-
-		irqentry_nmi_exit(regs, state);
+				      "Oops - store (or AMO) address misaligned");
 	}
+
+	irqentry_exit(regs, state);
 }
 
-asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 {
-	if (user_mode(regs)) {
-		irqentry_enter_from_user_mode(regs);
-
-		if (handle_misaligned_store(regs))
-			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-				"Oops - store (or AMO) address misaligned");
-
-		irqentry_exit_to_user_mode(regs);
-	} else {
-		irqentry_state_t state = irqentry_nmi_enter(regs);
-
-		if (handle_misaligned_store(regs))
-			do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-				"Oops - store (or AMO) address misaligned");
+	do_trap_misaligned(regs, MISALIGNED_LOAD);
+}
 
-		irqentry_nmi_exit(regs, state);
-	}
+asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+{
+	do_trap_misaligned(regs, MISALIGNED_STORE);
 }
+
 DO_ERROR_INFO(do_trap_store_fault,
 	SIGSEGV, SEGV_ACCERR, "store (or AMO) access fault");
 DO_ERROR_INFO(do_trap_ecall_s,
-- 
2.47.2

