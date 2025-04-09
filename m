Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA13218AD1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230588; cv=none; b=pkd8/6FnbgDRdsxg/ROlNQMFFSye2TnnxUs5tGpXs8jAoE9KD1JUSUqyFJNB4vXwzJzANgJhJ2/fLXc7dUi5QwPgMHDzF0OIvpbg4w28ywf18l8hFhBO5x7WQQMX85p9jWKIef4eFOu/fvnVdKSzqAo4b7X/NesnGq0eja9KJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230588; c=relaxed/simple;
	bh=LqKl9GMcHRQZghtbRXaflNO6MSkEBXPmwWvrfQk5DuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByrUJv7XoXvUait9GBWZaQoXVQ2t6iU5MVlEb7vSnh5TI3aM8Qjev1EJfaihabb7zcp1yVNvqxPrGXq/dz7+BQgs2pmDxmFFfx5hf30N4wAkVPpJKN3/KaQix6/WuX0NGmhd18ecPMU0r0LTQGErFGnGJ+gjZws0TheDMCtePU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoNkOBQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoNkOBQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D6C4CEEB;
	Wed,  9 Apr 2025 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230587;
	bh=LqKl9GMcHRQZghtbRXaflNO6MSkEBXPmwWvrfQk5DuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoNkOBQ43zYYRUaSJGQpFpQg1z5m9YKlMIrpCC8EBWkigL7QDzAiRAqXtG/ev5A1y
	 R/KUKmVaCqkN0ce6KDpm/GKPPigSZlvhWsEF1UhggPJ0BesYe6PlIuovOxTZOJB8MY
	 9JPE6YQsaq1IC+J9Gsl9Kkvz6YJqyIJR+DqamvqYEFsPYIacVWECKieFasPmqAYSd8
	 CgeJHrjZUMGZdFRxg4OsEhSu2GA9ixDrMAVSTR1MU4vV6vW+lAqDNF+IxQserYxBP+
	 Zbyjcvp5IbJGl/WAy1JG9qdx9Qhd6oaahE5b6D1F3wFMeqAPdbLIfLSuBjHjNcG4C5
	 1Hqmbp5KTlcIw==
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
Subject: [PATCH 11/20] x86/msr: Rename 'rdmsrl_safe_on_cpu()' to 'rdmsrq_safe_on_cpu()'
Date: Wed,  9 Apr 2025 22:28:58 +0200
Message-ID: <20250409202907.3419480-12-mingo@kernel.org>
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
 arch/x86/events/intel/pt.c                                  | 2 +-
 arch/x86/include/asm/msr.h                                  | 4 ++--
 arch/x86/kernel/acpi/cppc.c                                 | 6 +++---
 arch/x86/lib/msr-smp.c                                      | 4 ++--
 drivers/cpufreq/amd-pstate-ut.c                             | 2 +-
 drivers/cpufreq/amd-pstate.c                                | 2 +-
 drivers/cpufreq/intel_pstate.c                              | 6 +++---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
 drivers/powercap/intel_rapl_msr.c                           | 2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index a645b0993d83..d579f1092357 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -1839,7 +1839,7 @@ static __init int pt_init(void)
 	for_each_online_cpu(cpu) {
 		u64 ctl;
 
-		ret = rdmsrl_safe_on_cpu(cpu, MSR_IA32_RTIT_CTL, &ctl);
+		ret = rdmsrq_safe_on_cpu(cpu, MSR_IA32_RTIT_CTL, &ctl);
 		if (!ret && (ctl & RTIT_CTL_TRACEEN))
 			prior_warn++;
 	}
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 231757554236..c86814c35dec 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -335,7 +335,7 @@ void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *
 void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
 int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
-int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
+int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
 int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
 int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
 int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
@@ -379,7 +379,7 @@ static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 {
 	return wrmsr_safe(msr_no, l, h);
 }
-static inline int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
+static inline int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
 	return rdmsrq_safe(msr_no, q);
 }
diff --git a/arch/x86/kernel/acpi/cppc.c b/arch/x86/kernel/acpi/cppc.c
index 77bfb846490c..6a10d73cb88b 100644
--- a/arch/x86/kernel/acpi/cppc.c
+++ b/arch/x86/kernel/acpi/cppc.c
@@ -49,7 +49,7 @@ int cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val)
 {
 	int err;
 
-	err = rdmsrl_safe_on_cpu(cpunum, reg->address, val);
+	err = rdmsrq_safe_on_cpu(cpunum, reg->address, val);
 	if (!err) {
 		u64 mask = GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
 				       reg->bit_offset);
@@ -65,7 +65,7 @@ int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 	u64 rd_val;
 	int err;
 
-	err = rdmsrl_safe_on_cpu(cpunum, reg->address, &rd_val);
+	err = rdmsrq_safe_on_cpu(cpunum, reg->address, &rd_val);
 	if (!err) {
 		u64 mask = GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
 				       reg->bit_offset);
@@ -147,7 +147,7 @@ int amd_get_highest_perf(unsigned int cpu, u32 *highest_perf)
 	int ret;
 
 	if (cpu_feature_enabled(X86_FEATURE_CPPC)) {
-		ret = rdmsrl_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &val);
+		ret = rdmsrq_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &val);
 		if (ret)
 			goto out;
 
diff --git a/arch/x86/lib/msr-smp.c b/arch/x86/lib/msr-smp.c
index acd463d887e1..0360ce20aae8 100644
--- a/arch/x86/lib/msr-smp.c
+++ b/arch/x86/lib/msr-smp.c
@@ -220,7 +220,7 @@ int wrmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 }
 EXPORT_SYMBOL(wrmsrl_safe_on_cpu);
 
-int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
+int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
 	u32 low, high;
 	int err;
@@ -230,7 +230,7 @@ int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 
 	return err;
 }
-EXPORT_SYMBOL(rdmsrl_safe_on_cpu);
+EXPORT_SYMBOL(rdmsrq_safe_on_cpu);
 
 /*
  * These variants are significantly slower, but allows control over
diff --git a/drivers/cpufreq/amd-pstate-ut.c b/drivers/cpufreq/amd-pstate-ut.c
index 4a1f5b1fbd84..707fa81c749f 100644
--- a/drivers/cpufreq/amd-pstate-ut.c
+++ b/drivers/cpufreq/amd-pstate-ut.c
@@ -137,7 +137,7 @@ static int amd_pstate_ut_check_perf(u32 index)
 			lowest_nonlinear_perf = cppc_perf.lowest_nonlinear_perf;
 			lowest_perf = cppc_perf.lowest_perf;
 		} else {
-			ret = rdmsrl_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
+			ret = rdmsrq_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
 			if (ret) {
 				pr_err("%s read CPPC_CAP1 ret=%d error!\n", __func__, ret);
 				return ret;
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index b7caaa83a649..16a3fe2207ba 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -391,7 +391,7 @@ static int msr_init_perf(struct amd_cpudata *cpudata)
 	union perf_cached perf = READ_ONCE(cpudata->perf);
 	u64 cap1, numerator;
 
-	int ret = rdmsrl_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
+	int ret = rdmsrq_safe_on_cpu(cpudata->cpu, MSR_AMD_CPPC_CAP1,
 				     &cap1);
 	if (ret)
 		return ret;
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 83a43c64c404..6f6c14e31795 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -2106,13 +2106,13 @@ static int core_get_tdp_ratio(int cpu, u64 plat_info)
 		int err;
 
 		/* Get the TDP level (0, 1, 2) to get ratios */
-		err = rdmsrl_safe_on_cpu(cpu, MSR_CONFIG_TDP_CONTROL, &tdp_ctrl);
+		err = rdmsrq_safe_on_cpu(cpu, MSR_CONFIG_TDP_CONTROL, &tdp_ctrl);
 		if (err)
 			return err;
 
 		/* TDP MSR are continuous starting at 0x648 */
 		tdp_msr = MSR_CONFIG_TDP_NOMINAL + (tdp_ctrl & 0x03);
-		err = rdmsrl_safe_on_cpu(cpu, tdp_msr, &tdp_ratio);
+		err = rdmsrq_safe_on_cpu(cpu, tdp_msr, &tdp_ratio);
 		if (err)
 			return err;
 
@@ -2149,7 +2149,7 @@ static int core_get_max_pstate(int cpu)
 		return tdp_ratio;
 	}
 
-	err = rdmsrl_safe_on_cpu(cpu, MSR_TURBO_ACTIVATION_RATIO, &tar);
+	err = rdmsrq_safe_on_cpu(cpu, MSR_TURBO_ACTIVATION_RATIO, &tar);
 	if (!err) {
 		int tar_levels;
 
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 4368d598beac..46b96f1aa522 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -535,7 +535,7 @@ static long isst_if_msr_cmd_req(u8 *cmd_ptr, int *write_only, int resume)
 	} else {
 		u64 data;
 
-		ret = rdmsrl_safe_on_cpu(msr_cmd->logical_cpu,
+		ret = rdmsrq_safe_on_cpu(msr_cmd->logical_cpu,
 					 msr_cmd->msr, &data);
 		if (!ret) {
 			msr_cmd->data = data;
diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index c7f15b01fad8..6d5853db17ad 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -103,7 +103,7 @@ static int rapl_cpu_down_prep(unsigned int cpu)
 
 static int rapl_msr_read_raw(int cpu, struct reg_action *ra)
 {
-	if (rdmsrl_safe_on_cpu(cpu, ra->reg.msr, &ra->value)) {
+	if (rdmsrq_safe_on_cpu(cpu, ra->reg.msr, &ra->value)) {
 		pr_debug("failed to read msr 0x%x on cpu %d\n", ra->reg.msr, cpu);
 		return -EIO;
 	}
-- 
2.45.2

