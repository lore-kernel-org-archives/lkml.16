Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2128F509
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516073; cv=none; b=F46CyYL/5k1l9uoItF4uK7VA+4KTQRwXrT1pGLnLBb50FbfRYVa2ltqyGgvsuAETJMik3X54lisyYVWVMPsisr877364ELvY/CjSNEvMq3I+BOP0ZRv6WNi6keWGkNT4f1Vj+nOCJzlDnNsRAVHiN2I7y82rT+UadOYmJ8w+jUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516073; c=relaxed/simple;
	bh=pcGrEFJSoCPBjP83DKmshQqtiDx/pnJTzB92vC0uUOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuEfLQOz6RFGEw4y15iaPuTZCU26/7M8XXoBhLr5rPmOxTyBn+4L6GaKH+21TLFPXFgmH22lEKYj8S27MeSj4jxeEgLbUugkYwquSiT74jtus4A+31/LXYCI60POamcyYP6WFGv6959M11F/0h2Bai3UilXL5NdUqyzr3kl3xwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=p20Gi+Vp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="p20Gi+Vp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225df540edcso26119555ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516070; x=1746120870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bU2iOKxu5SmLczj4d/R9CrHjankuiJ12CPdEyBdM40=;
        b=p20Gi+VpbgKpr/uUltuaVdKPQL6mEsmtFpp3xzZE6X8JgULhg2Iuy8Nf3b2+VTcvDY
         POMYn815UJ2rD3kc1mh+SZtAw++HD3Bd9R5AYr9xpjPCWmrBQDmxs23zfOMOQ4/GKLja
         m6zH9NxU0A/naTCGn13VImNd1A9ZnGKL6xH9ydt09nWeK1EWmWOKbSzr+O2v/bJ2p7ki
         RMBg0gWc1sh1JT3L+KX2txB3uBLG8P9l00vnWGQZd3cSAg8POC69qZMgkOmwJg+A1sxR
         pHrFYufxmwnjg3pzXU+w5pGCF2TA9UsDWqrPXi/7u/ewNDHYtKlgMlaQayvRZ4cO4Bgu
         GTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516070; x=1746120870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bU2iOKxu5SmLczj4d/R9CrHjankuiJ12CPdEyBdM40=;
        b=UH5bcOqRgch9sQ94aYriK1urw/j3L1X4jXqreCv9MhMHasPvR75/PQ6xDXsWni6Uyb
         Mrjf39JnoAfM0y1qIXyzSm9uYV0WuIH3KVFBlwRdHj0wDKlCFFV2n12nPsBvTuncrZR+
         ucVCFW8th7/jo2Q2rsPEuqmPpLpsSk5Jk4BJL0DsVU53UCDqbAnlJkFUjJV5KSwZ/IK6
         53S8dqZwyI9VQlqD1EdE1Wr/zMPMzhs3Vo79nMjpkd/LnVF5BrjXLtkCLGlqXy6ekApZ
         9guYvzcERe5hhFlq4GdVpfGUYYYptOY3wSjaramKIl52KOlQalS7/DOKwv7xvkhPK2ue
         BtHA==
X-Forwarded-Encrypted: i=1; AJvYcCWt/ymPJLdZ811XONavxnpotZLxOM1BLTaqbO4eeubeD7V7r8PiDDVUoTz4ccT8vvcoyyawYNtHx7bp1PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDyIg/PCWoXLXoh3o4jrVPlZZIpkDETVl0huzpwKIEkKIrOlMB
	3aXxD8C8Nb4pMfsnNEU0D2y7VlkNnYGob8GA321cpDFTwBAwA7Phb/x+AaY/C0c=
X-Gm-Gg: ASbGncuvFUWAAoeLvwcx8njj1CxLxfnTeowwvcylKousJPY8d8bvOC18a5sZ8vFGOZI
	8V2hukgPkReNbvrMKqbEbm5vihfAPOgnxqEyhKg9R6QzmJ6eO3xv482D604jSplxi2WcOlWh3Tp
	rn6NQPlDgK4OzMSxW2EWRac4pZl2mGO1WgDL+ZuR4wMCH6oxEaGUhtrPagsnrc0fhQAY1Ps9V9s
	Bwk4zgITV9EcpAilYQ7mRW2l81yt4XUDug3jNZgrOiaRCZiwpIASZ2EF5W/dykGODZRkfY80sp/
	3SCSa9YX/3KaAsci6lP3egE1j+IoR66xBlA9J5NZvwIHv2S7BVB+
X-Google-Smtp-Source: AGHT+IG3l8kK7kp3RaV5j+GPb4uHqVWvo0jElPOjXjQU/Gw4v40fSw8IcnxpiGG/AbGNwQyQot80lw==
X-Received: by 2002:a17:903:3ba7:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22db4819fdemr42739985ad.15.1745516070298;
        Thu, 24 Apr 2025 10:34:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:29 -0700 (PDT)
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
Subject: [PATCH v6 06/14] riscv: misaligned: request misaligned exception from SBI
Date: Thu, 24 Apr 2025 19:31:53 +0200
Message-ID: <20250424173204.1948385-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
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
index 97c674d7d34f..6bb734abf9a4 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -16,6 +16,7 @@
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
@@ -629,7 +630,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -640,6 +641,13 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
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
@@ -648,9 +656,10 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
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
@@ -682,4 +691,60 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
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

