Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094C28C2D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298853; cv=none; b=kIUTExMlCZNwCDh3gfRZLIuObt6Svg4DK5zq7ahSRMOljNL7pHAec3n+L/yzYzt4pFgPD4fEM7YRWRtWAagreTOabQMdv0l9F2Af9yfzeafXAz7RuIUrMWRZsx94nc4GEs7TW1mA4YwFbIIehi2bvNBOGqD9G26sn6u0wmT5t5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298853; c=relaxed/simple;
	bh=PGXvcUd7AEZN3/JlvOlbni86hFgiQ4HPyrDarRZ8hOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5JJvo3Y6kZKfzcoTlionGg40xXRWUxg25tXLtvrdwibbHFWMNq6SHsUsj3act9DeP8dpRTbRVPFjL9cP7GYW3mcIRaoSury+kxbQOYnUyXYMRufRbizqy08FGGcM1hGhrBeZ0AeO1swvI5tf6JdhcXtspU8riURNRca+EeG8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KgS6AzuS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KgS6AzuS"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fcffd6b9dso718195e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747298849; x=1747903649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=KgS6AzuSOj+ExGajtNBCwXnQXzgh86OkKvO/PiSHNp5I6DCWr18z1NY3WceF3Yl9T+
         zqLScMhCcePhbr5Tg42h4pZThpMTo6IzFW6nFm0nTqj+Z6ZSuN76OAySMd0AC1tIuqpR
         WCcizBdFY90Mjzg4kpgx9CymCHrGh6zXf4rcYJRbz1WGtAO/y/9tVPeRa7D7rIix2YAQ
         lJ9K8MAMPLb/76THwjQIzexYuRxtbiBM6y76G4QFLi27JHk+dQAIxl+9V8WkW5fbXUpD
         rbEzVz8z4MVcehyg2icKD11Ztr2J3ITye5OEbAb9n+QxRxaAxIUQNFS84n8r0dZI35YB
         Vjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298849; x=1747903649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=eiaS+6LAHy7VsMvyeFkQCv521GBa1DBztsGCp8QQI27bZ86beUzIoCIuhKaeHv62Q5
         8ByM8I2Lmp8U2fWLjDTnjKSdzovR9ggUMiefunvGy7+dJKIJA49ZnC2yPBZEVpy1wnl7
         aI1zoWCFOBGgTS6vKATyZ0N8UROrqXWle4i0gtiysF/XW2KOeXMXSDWSoG/bDZiRpzK/
         LWZau5Abx2laisGFyL22l7PPspfZwpe71TNpGVSR3sxs46mrxCDpOgV5EFcud+0GCRMZ
         ufHCDtqVirt4KiDjVHRNe7NMcfMGdF3iox3H+7zzPJGIBmw9ERct+4IkYrJ7PsFT7fld
         apyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGOHSM8wrJL1Cf1xytEGsuTLgzmapkJ1NPcgVS9SafJwctN3QxnuVyvHBQHnOpYPMllrabrHFSjDZPL8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgjt9rJDMKHklCMar3uOOsWnuhYik4WRoLdUUz6dDV5NGWSvyF
	GNnUMgTH/eELQjF+5AcV+76WBQ0xpoLGooODbjL1Uw5mvWNja04RR8N023nNd/ilFBB2CEmhN9J
	o
X-Gm-Gg: ASbGncvqf0Gku5s7Z7fyfy0w5OXRCjIeIT3ofUgPMztAZYA7WOkRQXktOQvTbUZNeLb
	591FKd6IcLZYMe104ITuGcYaVCQCSMVITEASm+x0HQVNVRJA8UKIayGnRfwgqNY70EpjRx42snY
	AsnrCxscESj3TBFca2JHzUeFEayZJ1vvp64uRNhD9JtG8U+6rW7BxZIvfzF+jyjMvlmqfcQUqbb
	748rp1+ShSsDYHxaxTDowP7/v/xxQ/XJOCT0UrCFRMX4cODMILIpKtKZBAdmQGTGDuRwoeRDzx0
	d5JqBBrBMfl8r/WiQd4KvFEvtb5rA+NOL0+A56tdx4Wa0ba4jjc=
X-Google-Smtp-Source: AGHT+IGnVdWt5OD2bKCz++KFVpJxcO50pC03iTHgGj6sIJhut7VYuKCl9xAAlL4aqjVD7tiXjB6LOw==
X-Received: by 2002:a05:600c:c0d2:20b0:442:f482:c421 with SMTP id 5b1f17b1804b1-442f482c78emr24654775e9.22.1747297431669;
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 06/14] riscv: misaligned: request misaligned exception from SBI
Date: Thu, 15 May 2025 10:22:07 +0200
Message-ID: <20250515082217.433227-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the kernel can handle misaligned accesses in S-mode, request
misaligned access exception delegation from SBI. This uses the FWFT SBI
extension defined in SBI version 3.0.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  3 +-
 arch/riscv/kernel/traps_misaligned.c       | 71 +++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c |  8 ++-
 3 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index f56b409361fb..dbe5970d4fe6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -67,8 +67,9 @@ void __init riscv_user_isa_enable(void);
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
 bool __init check_unaligned_access_emulated_all_cpus(void);
+void unaligned_access_init(void);
+int cpu_online_unaligned_access_init(unsigned int cpu);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
-void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 77c788660223..592b1a28e897 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -16,6 +16,7 @@
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
@@ -646,7 +647,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -657,6 +658,13 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
+}
+
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
+
+	check_unaligned_access_emulated(NULL);
 
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
@@ -665,9 +673,10 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	 */
 	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 bool __init check_unaligned_access_emulated_all_cpus(void)
@@ -699,4 +708,60 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_RISCV_SBI
+
+static bool misaligned_traps_delegated;
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
+{
+	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
+	    misaligned_traps_delegated) {
+		pr_crit("Misaligned trap delegation non homogeneous (expected delegated)");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void __init unaligned_access_init(void)
+{
+	int ret;
+
+	ret = sbi_fwft_set_online_cpus(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
+	if (ret)
+		return;
+
+	misaligned_traps_delegated = true;
+	pr_info("SBI misaligned access exception delegation ok\n");
+	/*
+	 * Note that we don't have to take any specific action here, if
+	 * the delegation is successful, then
+	 * check_unaligned_access_emulated() will verify that indeed the
+	 * platform traps on misaligned accesses.
+	 */
+}
+#else
+void __init unaligned_access_init(void) {}
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
+{
+	return 0;
+}
 #endif
+
+int cpu_online_unaligned_access_init(unsigned int cpu)
+{
+	int ret;
+
+	ret = cpu_online_sbi_unaligned_setup(cpu);
+	if (ret)
+		return ret;
+
+	return cpu_online_check_unaligned_access_emulated(cpu);
+}
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b8ba13819d05..ae2068425fbc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -236,6 +236,11 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {
+	int ret = cpu_online_unaligned_access_init(cpu);
+
+	if (ret)
+		return ret;
+
 	/* We are already set since the last check */
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
 		goto exit;
@@ -248,7 +253,6 @@ static int riscv_online_cpu(unsigned int cpu)
 	{
 		static struct page *buf;
 
-		check_unaligned_access_emulated(NULL);
 		buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 		if (!buf) {
 			pr_warn("Allocation failure, not measuring misaligned performance\n");
@@ -439,6 +443,8 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
+	unaligned_access_init();
+
 	if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
 		pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
 			speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
-- 
2.49.0

