Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC04219A93
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230590; cv=none; b=eDGmks2lzyISJApoxQzCCH2azCvdX1cC3ZgeAEOao4jQtLeLCtO3ASYHqMzz3GjR9W14OZRPjeZiCwfOtUwhNvZDIxdQBqTFsZaAvosqBuXRp7MiVesF6oAIx15ln13WwsVbbGWGMC9v2cJeuEVK7/g3VRqIeE7hKvAsJsoo2NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230590; c=relaxed/simple;
	bh=5BGZ4GxszY+czBKkfYoJb6RS0gGNvmKNBR/F5w46/yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKUIPe8XLVwIWuLR5s4aYCx2q7wDMqCWAUlFwl1ukoLYaA0SH9ToG6oVKDC2pWKH4zWxXPRaC/p8PCULgPcAMah+XVC3o0bDm0P3MWH53BIe8rGmEMrD8XTp00v73353OWLnKmOxe0u6RIqUiv3rnvmuPMD/7XoZ7ZGB4krgweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q06cx4ez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q06cx4ez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEECC4CEE2;
	Wed,  9 Apr 2025 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230590;
	bh=5BGZ4GxszY+czBKkfYoJb6RS0gGNvmKNBR/F5w46/yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q06cx4ezD8GFDOoz3sfiqMOUkeOa8efhXRkALNzfLyBtTAvs7oG1jcbXEsOBbCPu+
	 HuZItaDMPtF2/o0re6tlzybc5GMcKgiyOEFNmk9PsiZmmsnHqFz+lCYRhfMqtEFe/5
	 /PG8VmAFyIkvRkzseoKLV1DZtXpXxRKgvdFV3tfaQAyk9z8WHQohzCqI6lbX7FNmGr
	 BKhzMuJvokJ/pGO25B//iXCf+N5kjhRneO/oprLupmTO9FWY+ewxMtX82A28t2lgC7
	 pgwL3sSi8yefv3ziZuDHdTVH9dpRUM/FvT8EfY7js7rJuoqIESE1duwEdmQ4L056W1
	 3YBDQVnfV6/9Q==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 12/20] x86/msr: Rename 'wrmsrl_safe_on_cpu()' to 'wrmsrq_safe_on_cpu()'
Date: Wed,  9 Apr 2025 22:28:59 +0200
Message-ID: <20250409202907.3419480-13-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/include/asm/msr.h                                  | 4 ++--
 arch/x86/kernel/acpi/cppc.c                                 | 2 +-
 arch/x86/lib/msr-smp.c                                      | 4 ++--
 drivers/cpufreq/amd-pstate.c                                | 2 +-
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index c86814c35dec..52983279c953 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -336,7 +336,7 @@ void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *
 int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
 int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
-int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
+int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
 int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
 int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
 #else  /*  CONFIG_SMP  */
@@ -383,7 +383,7 @@ static inline int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
 	return rdmsrq_safe(msr_no, q);
 }
-static inline int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
+static inline int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 {
 	return wrmsrq_safe(msr_no, q);
 }
diff --git a/arch/x86/kernel/acpi/cppc.c b/arch/x86/kernel/acpi/cppc.c
index 6a10d73cb88b..78b4e4b40985 100644
--- a/arch/x86/kernel/acpi/cppc.c
+++ b/arch/x86/kernel/acpi/cppc.c
@@ -74,7 +74,7 @@ int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 		val &= mask;
 		rd_val &= ~mask;
 		rd_val |= val;
-		err = wrmsrl_safe_on_cpu(cpunum, reg->address, rd_val);
+		err = wrmsrq_safe_on_cpu(cpunum, reg->address, rd_val);
 	}
 	return err;
 }
diff --git a/arch/x86/lib/msr-smp.c b/arch/x86/lib/msr-smp.c
index 0360ce20aae8..434fdc21a86e 100644
--- a/arch/x86/lib/msr-smp.c
+++ b/arch/x86/lib/msr-smp.c
@@ -204,7 +204,7 @@ int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 }
 EXPORT_SYMBOL(wrmsr_safe_on_cpu);
 
-int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
+int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 {
 	int err;
 	struct msr_info rv;
@@ -218,7 +218,7 @@ int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 
 	return err ? err : rv.err;
 }
-EXPORT_SYMBOL(wrmsrl_safe_on_cpu);
+EXPORT_SYMBOL(wrmsrq_safe_on_cpu);
 
 int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 16a3fe2207ba..0615c73306cf 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -371,7 +371,7 @@ static int shmem_set_epp(struct cpufreq_policy *policy, u8 epp)
 
 static inline int msr_cppc_enable(struct cpufreq_policy *policy)
 {
-	return wrmsrl_safe_on_cpu(policy->cpu, MSR_AMD_CPPC_ENABLE, 1);
+	return wrmsrq_safe_on_cpu(policy->cpu, MSR_AMD_CPPC_ENABLE, 1);
 }
 
 static int shmem_cppc_enable(struct cpufreq_policy *policy)
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 46b96f1aa522..44dcd165b4c0 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -191,7 +191,7 @@ void isst_resume_common(void)
 			if (cb->registered)
 				isst_mbox_resume_command(cb, sst_cmd);
 		} else {
-			wrmsrl_safe_on_cpu(sst_cmd->cpu, sst_cmd->cmd,
+			wrmsrq_safe_on_cpu(sst_cmd->cpu, sst_cmd->cmd,
 					   sst_cmd->data);
 		}
 	}
@@ -524,7 +524,7 @@ static long isst_if_msr_cmd_req(u8 *cmd_ptr, int *write_only, int resume)
 		if (!capable(CAP_SYS_ADMIN))
 			return -EPERM;
 
-		ret = wrmsrl_safe_on_cpu(msr_cmd->logical_cpu,
+		ret = wrmsrq_safe_on_cpu(msr_cmd->logical_cpu,
 					 msr_cmd->msr,
 					 msr_cmd->data);
 		*write_only = 1;
-- 
2.45.2

