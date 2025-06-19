Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124D2206B7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359988; cv=none; b=JVeYGyUQ/oiHqOkeh07+pewTk7d3YOn8CPI5r+mSm5Eyo2AtguWG+ZV9gFdFAQ2F7eZ6S0UQuzHrmRfKIVXxHHtK0Co7TwBMtI7Ng3Dld99j0mzY7jIbzayRJQ6d5p724j3iYgnawq6I0Bj4bBxDf3mBKq7DfLI1HY9vmJ7tMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359988; c=relaxed/simple;
	bh=ILsscL13LJxtd5FJtJ8IdA6dNjxS9nIurbLnjjXA11s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nqornp2+Kjh9tQW/TMzYdwqvU26eVxOdapZ2wqYAFUzdwYqgSvoiPK7fEdcl5ffOiE7TvH+KRCUIVk3QonVMZ4Hc6jrLxAiYA8x10wmCea9UpGNx8KQFUAEk/y8/CH5xGatTDrqFN81VxT7PMhMWl7dUPbWVMEV+eg95S6dvQmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GDJoJwz6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GDJoJwz6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45306976410so309195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750359985; x=1750964785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ1XbwNXTcTz0Un8mjY/Dj+AmwaNTB9PlmuCT/9Ebw8=;
        b=GDJoJwz6DO1n3Y7FKOyWpeBvF8eSR+MrVNwrFj0OjFBlTjDM5pIELgZB2318NP2QG9
         L0FfrV6kn/1YxUf/UETItGYmaaI8Q1H00AQMBHAQPOefKPcisVh2Ga2y6bx0mK0yxbM1
         alZfN7W0OR7GLDq1OihcW+RFzdbyvBAVqDK1t3tvbyAhDO8X3WfB/prL1KapOziGOYjm
         7OGylwiMy9y2SubvUqEXdO58JsbuafAY+29k111xtT7aVvtMaHXu8j3RGOa5//CAjhWh
         3DA7slmSUDf3oybzBTOkZ5HBV9Qu7wXNeJlGbTvATt5SoPaSQl/QXA3/0vyWDNO1k8Dx
         U9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359985; x=1750964785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJ1XbwNXTcTz0Un8mjY/Dj+AmwaNTB9PlmuCT/9Ebw8=;
        b=Qe12cURTW67ltyHDXLblzdrCNOlN5Gml+flB8w+ggDQj00RmEsLQCwUXQQJGDAkKZn
         BKMyNiNm+sE/QNweayITLkGbRcg4fcQkSvyDg9r85pPW43sHmGwiUquPGQVyrScBiJGI
         OVcy/Z86DTdm8LLSHOV0vB09v43PdRGsoeJhCSAeEIE3pbkPppkaurfr81YOYrwmxHf4
         1pfOpPT9AQQ9sT5z/bSKQ2b3OG31qGGL7JGUDeoMDv2xgTMaIUcjc7R5M9EUMuTezGWo
         ViePKwAYc3yPZtii3jY58cPTl1wcGMOhfWHNQaNffGh7BwQzkcae/bieIxmxDjgFue1F
         3ryg==
X-Gm-Message-State: AOJu0YxjyOnT/fVJM4NP6Ckz7E18eNltT7eue8aEXd1G/oobarqTuc+U
	A7NLJYSZCG1qnVURGaS+sp2PBKQVv3jY8eTXqrtgn7TC5pIZQ9hfg6wTflnSt4JzLcU=
X-Gm-Gg: ASbGncsqVtcXINpOYConl3bB7BcHvq7onTndlbP4YtLOjRXoVJj8/UmRFLopZBxYnNa
	7Sjzdwu8SlsJPIdjToVA1NlbkF0+PKPPUfy3xcp5l3IDjCbUQpoX2I8XJYXgjm79M84547XQfft
	3ui8Flfu75LozY/MFqlaXkva4BPjXfTnPpCwsTwB/vmQtSD7nRRUae+OxVZyVooujXeUsBj1aZ5
	jDlcvve4/GfnsyfWlLq+sSup4WchgBUUNlnbq9j+4c7rcWuYq6bhj5utUifhECEM2JZBSAP6YHq
	3hMM5yN3EaFXazzV77Vlr/Mz4CpTiDFF3HiKv2FMjo+ek9uQ6JO0RdF6rPN4ap1i7kNklQ==
X-Google-Smtp-Source: AGHT+IHQG2zcbYwMwXYE5bB9wHUmYmgz/zB2Z25qG0x2H3MwJgmqDV6XnjvtVVAiFz3kAt4jB7hAcw==
X-Received: by 2002:a05:600c:154d:b0:453:c08:a1fa with SMTP id 5b1f17b1804b1-4536478f2efmr973295e9.0.1750359984550;
        Thu, 19 Jun 2025 12:06:24 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:5b14:46b0:5c7a:61f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470903asm2693935e9.40.2025.06.19.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:06:24 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
Date: Thu, 19 Jun 2025 21:03:14 +0200
Message-ID: <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
pass the actual numbers of arguments for each SBI function.

The remaining trailing 0 are intentional as they represent an argument.

SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
but allow it by passing 0 is the reserved register.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
v2:
 * add some missed trailing 0 in pmu [David]
 * adapt to the new sbi_ecall that doesn't allow a single argument
---
 arch/riscv/include/asm/kvm_nacl.h |  4 +--
 arch/riscv/kernel/cpu_ops_sbi.c   |  6 ++--
 arch/riscv/kernel/paravirt.c      |  2 +-
 arch/riscv/kernel/sbi.c           | 57 ++++++++++++++-----------------
 arch/riscv/kernel/sbi_ecall.c     |  2 +-
 arch/riscv/kernel/suspend.c       |  4 +--
 arch/riscv/kvm/nacl.c             |  7 ++--
 drivers/acpi/riscv/cppc.c         |  4 +--
 drivers/perf/riscv_pmu_sbi.c      | 49 +++++++++++++-------------
 9 files changed, 66 insertions(+), 69 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index 4124d5e06a0f..5849af11c945 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -96,7 +96,7 @@ do {									\
 
 #define nacl_sync_hfence(__e)						\
 	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SYNC_HFENCE,		\
-		  (__e), 0, 0, 0, 0, 0)
+		  (__e))
 
 #define nacl_hfence_mkconfig(__type, __order, __vmid, __asid)		\
 ({									\
@@ -196,7 +196,7 @@ do {									\
 
 #define nacl_sync_csr(__csr)						\
 	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SYNC_CSR,			\
-		  (__csr), 0, 0, 0, 0, 0)
+		  (__csr))
 
 /*
  * Each ncsr_xyz() macro defined below has it's own static-branch so every
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index e6fbaaf54956..d5de532ca082 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -29,7 +29,7 @@ static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START,
-			hartid, saddr, priv, 0, 0, 0);
+			hartid, saddr, priv);
 	if (ret.error)
 		return sbi_err_map_linux_errno(ret.error);
 	else
@@ -41,7 +41,7 @@ static int sbi_hsm_hart_stop(void)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP);
 
 	if (ret.error)
 		return sbi_err_map_linux_errno(ret.error);
@@ -54,7 +54,7 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STATUS,
-			hartid, 0, 0, 0, 0, 0);
+			hartid);
 	if (ret.error)
 		return sbi_err_map_linux_errno(ret.error);
 	else
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index fa6b0339a65d..9d00743a96c1 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -60,7 +60,7 @@ static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
-			lo, hi, flags, 0, 0, 0);
+			lo, hi, flags);
 	if (ret.error) {
 		if (lo == SBI_SHMEM_DISABLE && hi == SBI_SHMEM_DISABLE)
 			pr_warn("Failed to disable steal-time shmem");
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 53836a9235e3..af23b8759a13 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -57,7 +57,7 @@ static unsigned long __sbi_v01_cpumask_to_hartmask(const struct cpumask *cpu_mas
  */
 void sbi_console_putchar(int ch)
 {
-	sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch);
 }
 EXPORT_SYMBOL(sbi_console_putchar);
 
@@ -70,7 +70,7 @@ int sbi_console_getchar(void)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_0_1_CONSOLE_GETCHAR, 0, 0, 0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_0_1_CONSOLE_GETCHAR, 0);
 
 	return ret.error;
 }
@@ -83,7 +83,7 @@ EXPORT_SYMBOL(sbi_console_getchar);
  */
 void sbi_shutdown(void)
 {
-	sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0);
 }
 EXPORT_SYMBOL(sbi_shutdown);
 
@@ -97,9 +97,9 @@ static void __sbi_set_timer_v01(uint64_t stime_value)
 {
 #if __riscv_xlen == 32
 	sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,
-		  stime_value >> 32, 0, 0, 0, 0);
+		  stime_value >> 32);
 #else
-	sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value, 0, 0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value);
 #endif
 }
 
@@ -107,8 +107,7 @@ static void __sbi_send_ipi_v01(unsigned int cpu)
 {
 	unsigned long hart_mask =
 		__sbi_v01_cpumask_to_hartmask(cpumask_of(cpu));
-	sbi_ecall(SBI_EXT_0_1_SEND_IPI, 0, (unsigned long)(&hart_mask),
-		  0, 0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_0_1_SEND_IPI, 0, (unsigned long)(&hart_mask));
 }
 
 static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
@@ -126,17 +125,16 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 	switch (fid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
 		sbi_ecall(SBI_EXT_0_1_REMOTE_FENCE_I, 0,
-			  (unsigned long)&hart_mask, 0, 0, 0, 0, 0);
+			  (unsigned long)&hart_mask);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
 		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA, 0,
-			  (unsigned long)&hart_mask, start, size,
-			  0, 0, 0);
+			  (unsigned long)&hart_mask, start, size);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
 		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID, 0,
 			  (unsigned long)&hart_mask, start, size,
-			  arg4, 0, 0);
+			  arg4);
 		break;
 	default:
 		pr_err("SBI call [%d]not supported in SBI v0.1\n", fid);
@@ -180,10 +178,9 @@ static void __sbi_set_timer_v02(uint64_t stime_value)
 {
 #if __riscv_xlen == 32
 	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
-		  stime_value >> 32, 0, 0, 0, 0);
+		  stime_value >> 32);
 #else
-	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
-		  0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value);
 #endif
 }
 
@@ -193,7 +190,7 @@ static void __sbi_send_ipi_v02(unsigned int cpu)
 	struct sbiret ret = {0};
 
 	ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
-			1UL, cpuid_to_hartid_map(cpu), 0, 0, 0, 0);
+			1UL, cpuid_to_hartid_map(cpu));
 	if (ret.error) {
 		result = sbi_err_map_linux_errno(ret.error);
 		pr_err("%s: hbase = [%lu] failed (error [%d])\n",
@@ -212,32 +209,32 @@ static int __sbi_rfence_v02_call(unsigned long fid, unsigned long hmask,
 
 	switch (fid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
-		ret = sbi_ecall(ext, fid, hmask, hbase, 0, 0, 0, 0);
+		ret = sbi_ecall(ext, fid, hmask, hbase);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, 0, 0);
+				size);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, arg4, 0);
+				size, arg4);
 		break;
 
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, 0, 0);
+				size);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, arg4, 0);
+				size, arg4);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, 0, 0);
+				size);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
 		ret = sbi_ecall(ext, fid, hmask, hbase, start,
-				size, arg4, 0);
+				size, arg4);
 		break;
 	default:
 		pr_err("unknown function ID [%lu] for SBI extension [%d]\n",
@@ -334,7 +331,7 @@ int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
 		return -EOPNOTSUPP;
 
 	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
-			feature, value, flags, 0, 0, 0);
+			feature, value, flags);
 
 	return sbi_err_map_linux_errno(ret.error);
 }
@@ -510,8 +507,7 @@ EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
 
 static void sbi_srst_reset(unsigned long type, unsigned long reason)
 {
-	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,
-		  0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason);
 	pr_warn("%s: type=0x%lx reason=0x%lx failed\n",
 		__func__, type, reason);
 }
@@ -544,8 +540,7 @@ long sbi_probe_extension(int extid)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
-			0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid);
 	if (!ret.error)
 		return ret.value;
 
@@ -607,10 +602,10 @@ int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
 				num_bytes, lower_32_bits(base_addr),
-				upper_32_bits(base_addr), 0, 0, 0);
+				upper_32_bits(base_addr));
 	else
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
-				num_bytes, base_addr, 0, 0, 0, 0);
+				num_bytes, base_addr);
 
 	if (ret.error == SBI_ERR_FAILURE)
 		return -EIO;
@@ -636,10 +631,10 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
 				num_bytes, lower_32_bits(base_addr),
-				upper_32_bits(base_addr), 0, 0, 0);
+				upper_32_bits(base_addr));
 	else
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
-				num_bytes, base_addr, 0, 0, 0, 0);
+				num_bytes, base_addr);
 
 	if (ret.error == SBI_ERR_FAILURE)
 		return -EIO;
diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
index 2a3f31edb08f..b783a46fff1c 100644
--- a/arch/riscv/kernel/sbi_ecall.c
+++ b/arch/riscv/kernel/sbi_ecall.c
@@ -9,7 +9,7 @@ long __sbi_base_ecall(int fid)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_BASE, fid);
 	if (!ret.error)
 		return ret.value;
 	else
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..bef83043e8c7 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -115,7 +115,7 @@ static int sbi_system_suspend(unsigned long sleep_type,
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
-			sleep_type, resume_addr, opaque, 0, 0, 0);
+			sleep_type, resume_addr, opaque);
 	if (ret.error)
 		return sbi_err_map_linux_errno(ret.error);
 
@@ -153,7 +153,7 @@ static int sbi_suspend_finisher(unsigned long suspend_type,
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND,
-			suspend_type, resume_addr, opaque, 0, 0, 0);
+			suspend_type, resume_addr, opaque);
 
 	return (ret.error) ? sbi_err_map_linux_errno(ret.error) : 0;
 }
diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 08a95ad9ada2..bc0ea3157645 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -61,7 +61,7 @@ int kvm_riscv_nacl_enable(void)
 	nacl = this_cpu_ptr(&kvm_riscv_nacl);
 
 	ret = sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SET_SHMEM,
-			nacl->shmem_phys, 0, 0, 0, 0, 0);
+			nacl->shmem_phys, 0, 0);
 	rc = sbi_err_map_linux_errno(ret.error);
 	if (rc)
 		return rc;
@@ -75,7 +75,7 @@ void kvm_riscv_nacl_disable(void)
 		return;
 
 	sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_SET_SHMEM,
-		  SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0, 0, 0, 0);
+		  SBI_SHMEM_DISABLE, SBI_SHMEM_DISABLE, 0);
 }
 
 void kvm_riscv_nacl_exit(void)
@@ -106,8 +106,7 @@ static long nacl_probe_feature(long feature_id)
 	if (!kvm_riscv_nacl_available())
 		return 0;
 
-	ret = sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_PROBE_FEATURE,
-			feature_id, 0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_NACL, SBI_EXT_NACL_PROBE_FEATURE, feature_id);
 	return ret.value;
 }
 
diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 4cdff387deff..21e2051b3e35 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -53,7 +53,7 @@ static void sbi_cppc_read(void *read_data)
 	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
 
 	data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_READ,
-			      data->reg, 0, 0, 0, 0, 0);
+			      data->reg);
 }
 
 static void sbi_cppc_write(void *write_data)
@@ -61,7 +61,7 @@ static void sbi_cppc_write(void *write_data)
 	struct sbi_cppc_data *data = (struct sbi_cppc_data *)write_data;
 
 	data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_WRITE,
-			      data->reg, data->val, 0, 0, 0, 0);
+			      data->reg, data->val);
 }
 
 static void cppc_ffh_csr_read(void *read_data)
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..69b7948d85ca 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -303,10 +303,10 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
-			0, cmask, 0, edata->event_idx, 0, 0);
+			0, cmask, 0, edata->event_idx, 0);
 	if (!ret.error) {
 		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET);
 	} else if (ret.error == SBI_ERR_NOT_SUPPORTED) {
 		/* This event cannot be monitored by any counter */
 		edata->event_idx = -ENOENT;
@@ -433,7 +433,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 			hwc->config >> 32);
 #else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			cmask, cflags, hwc->event_base, hwc->config, 0);
+			cmask, cflags, hwc->event_base, hwc->config);
 #endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
@@ -606,7 +606,7 @@ static int pmu_sbi_snapshot_disable(void)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, SBI_SHMEM_DISABLE,
-			SBI_SHMEM_DISABLE, 0, 0, 0, 0);
+			SBI_SHMEM_DISABLE, 0);
 	if (ret.error) {
 		pr_warn("failed to disable snapshot shared memory\n");
 		return sbi_err_map_linux_errno(ret.error);
@@ -630,10 +630,11 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 				cpu_hw_evt->snapshot_addr_phys,
-				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0, 0, 0, 0);
+				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32,
+				0);
 	else
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
-				cpu_hw_evt->snapshot_addr_phys, 0, 0, 0, 0, 0);
+				cpu_hw_evt->snapshot_addr_phys, 0, 0);
 
 	/* Free up the snapshot area memory and fall back to SBI PMU calls without snapshot */
 	if (ret.error) {
@@ -667,14 +668,14 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
-				hwc->idx, 0, 0, 0, 0, 0);
+				hwc->idx);
 		if (ret.error)
 			return 0;
 
 		val = ret.value;
 		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
 			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
-					hwc->idx, 0, 0, 0, 0, 0);
+					hwc->idx);
 			if (!ret.error)
 				val |= ((u64)ret.value << 32);
 			else
@@ -717,10 +718,10 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	/* There is no benefit setting SNAPSHOT FLAG for a single counter */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
-			1, flag, ival, ival >> 32, 0);
+			1, flag, ival, ival >> 32);
 #else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->idx,
-			1, flag, ival, 0, 0);
+			1, flag, ival);
 #endif
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
@@ -746,7 +747,8 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	if (sbi_pmu_snapshot_available())
 		flag |= SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+			hwc->idx, 1, flag);
 	if (!ret.error && sbi_pmu_snapshot_available()) {
 		/*
 		 * The counter snapshot is based on the index base specified by hwc->idx.
@@ -771,7 +773,7 @@ static int pmu_sbi_find_num_ctrs(void)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
+	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS);
 	if (!ret.error)
 		return ret.value;
 	else
@@ -789,7 +791,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 		return -ENOMEM;
 
 	for (i = 0; i < nctr; i++) {
-		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
@@ -816,7 +818,7 @@ static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 	 * which may include counters that are not enabled yet.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
@@ -837,7 +839,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		/* No need to check the error here as we can't do anything about the error */
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
-				cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
+				cpu_hw_evt->used_hw_ctrs[i], flag);
 		if (!ret.error && sbi_pmu_snapshot_available()) {
 			/* Save the counter values to avoid clobbering */
 			for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
@@ -877,8 +879,8 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
 		/* Start all the counters that did not overflow in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
-			0, 0, 0, 0);
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,
+			  i * BITS_PER_LONG, ctr_start_mask, 0);
 	}
 
 	/* Reinitialize and start all the counter that overflowed */
@@ -889,11 +891,11 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
 #if defined(CONFIG_32BIT)
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, init_val >> 32, 0);
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
+				  1, flag, init_val, init_val >> 32);
 #else
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, 0, 0);
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx,
+				  1, flag, init_val);
 #endif
 			perf_event_update_userpage(event);
 		}
@@ -932,8 +934,9 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 			sdata->ctr_values[idx] =
 					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
 		/* Start all the counters in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
-			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,
+			  idx * BITS_PER_LONG,
+			  cpu_hw_evt->used_hw_ctrs[i], flag);
 	}
 }
 
-- 
2.49.0

