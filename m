Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F462144A4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230599; cv=none; b=B0mBZhSvjbIqrVEVz/+2WBoWvSQ7OF35tUNQH41Y9eGmf2OTnuL9ocdw2J2DVoxTQfGBgT3KeI3R0LViythVVtUM6+0AAFTIfjW6L9ahLXDsmbMpdNTsjxTYKeK4s+3HuzHNiFYMK6ldTdMp3GpR75Yr0BsZg9RHLbI0XG4uHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230599; c=relaxed/simple;
	bh=oYzsRDnWm40F7n6c395OYC8D3VVWwC8jMLmIvGkl00Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D87tIurqcVuoDjjQjhCKMGAUOXUPU+ZXOIR0DFSnsEakBIeJophsbsiukSQ49Qait7lkkh//3oNydWdoSoUzKTleZm1bHgiyDxf6v0u77G3ULK846fPhnRNTN/yti4MpBa0DKRPlp+Ecr+QCzgvw4aAg+rIbF5KZu1XQhV91AgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GilBaafO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GilBaafO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4734C4CEED;
	Wed,  9 Apr 2025 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230596;
	bh=oYzsRDnWm40F7n6c395OYC8D3VVWwC8jMLmIvGkl00Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GilBaafOwvBtf1W1s+3wWc1bwo+ogrs7WTDyCXdU/jIawHMOsYgvtFeUtoSqfq0XS
	 0litvRe5dmoIpw6pBB28+uPOR3sbDMiJuLVFIay6wa4YhvYKsdVPK6M+4Hq3UuVrSG
	 DD+oc1ROmcHKugAvwJY27km3qiE0TQtgoqNriFQFYtfjB8M9qYHsdYnK9G3ASu2bM1
	 aQn2f8E7uTKIwLn8nTDsBRF88y79wY05A8yoifHvcalIhJn5NN2IZIpQolPLfsDodo
	 CjVcGAZHnps7TLrTXui8PJi00ARRF+qWbFzpTKHzOAIohwATBPvmSaaGsFheWm3IHo
	 e91tEhaO9UPrw==
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
Subject: [PATCH 14/20] x86/msr: Rename 'wrmsrl_on_cpu()' to 'wrmsrq_on_cpu()'
Date: Wed,  9 Apr 2025 22:29:01 +0200
Message-ID: <20250409202907.3419480-15-mingo@kernel.org>
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
 arch/x86/include/asm/msr.h                         |  4 +--
 arch/x86/kernel/cpu/intel_epb.c                    |  2 +-
 arch/x86/lib/msr-smp.c                             |  4 +--
 drivers/cpufreq/amd-pstate.c                       |  6 ++--
 drivers/cpufreq/intel_pstate.c                     | 34 +++++++++++-----------
 .../x86/intel/uncore-frequency/uncore-frequency.c  |  4 +--
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 850793b381c6..4335f914d6f8 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -330,7 +330,7 @@ int msr_clear_bit(u32 msr, u8 bit);
 int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
 int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
-int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
+int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
 void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
 void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
 int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
@@ -355,7 +355,7 @@ static inline int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 	rdmsrq(msr_no, *q);
 	return 0;
 }
-static inline int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
+static inline int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 {
 	wrmsrq(msr_no, q);
 	return 0;
diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index 54236defb666..bc7671f920a7 100644
--- a/arch/x86/kernel/cpu/intel_epb.c
+++ b/arch/x86/kernel/cpu/intel_epb.c
@@ -161,7 +161,7 @@ static ssize_t energy_perf_bias_store(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	ret = wrmsrl_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS,
+	ret = wrmsrq_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS,
 			    (epb & ~EPB_MASK) | val);
 	if (ret < 0)
 		return ret;
diff --git a/arch/x86/lib/msr-smp.c b/arch/x86/lib/msr-smp.c
index b6081fc2217f..b8f63419e6ae 100644
--- a/arch/x86/lib/msr-smp.c
+++ b/arch/x86/lib/msr-smp.c
@@ -78,7 +78,7 @@ int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 }
 EXPORT_SYMBOL(wrmsr_on_cpu);
 
-int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
+int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 {
 	int err;
 	struct msr_info rv;
@@ -92,7 +92,7 @@ int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
 
 	return err;
 }
-EXPORT_SYMBOL(wrmsrl_on_cpu);
+EXPORT_SYMBOL(wrmsrq_on_cpu);
 
 static void __rwmsr_on_cpus(const struct cpumask *mask, u32 msr_no,
 			    struct msr __percpu *msrs,
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index e987486cbb34..fd1ae77142ad 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -261,7 +261,7 @@ static int msr_update_perf(struct cpufreq_policy *policy, u8 min_perf,
 		wrmsrq(MSR_AMD_CPPC_REQ, value);
 		return 0;
 	} else {
-		int ret = wrmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, value);
+		int ret = wrmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, value);
 
 		if (ret)
 			return ret;
@@ -309,7 +309,7 @@ static int msr_set_epp(struct cpufreq_policy *policy, u8 epp)
 	if (value == prev)
 		return 0;
 
-	ret = wrmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, value);
+	ret = wrmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, value);
 	if (ret) {
 		pr_err("failed to set energy perf value (%d)\n", ret);
 		return ret;
@@ -788,7 +788,7 @@ static int amd_pstate_init_boost_support(struct amd_cpudata *cpudata)
 
 static void amd_perf_ctl_reset(unsigned int cpu)
 {
-	wrmsrl_on_cpu(cpu, MSR_AMD_PERF_CTL, 0);
+	wrmsrq_on_cpu(cpu, MSR_AMD_PERF_CTL, 0);
 }
 
 /*
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 8ce9d54ea32e..8e23f3175db7 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -664,7 +664,7 @@ static int intel_pstate_set_epb(int cpu, s16 pref)
 		return ret;
 
 	epb = (epb & ~0x0f) | pref;
-	wrmsrl_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, epb);
+	wrmsrq_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, epb);
 
 	return 0;
 }
@@ -762,7 +762,7 @@ static int intel_pstate_set_epp(struct cpudata *cpu, u32 epp)
 	 * function, so it cannot run in parallel with the update below.
 	 */
 	WRITE_ONCE(cpu->hwp_req_cached, value);
-	ret = wrmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
+	ret = wrmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
 	if (!ret)
 		cpu->epp_cached = epp;
 
@@ -1209,7 +1209,7 @@ static void intel_pstate_hwp_set(unsigned int cpu)
 	}
 skip_epp:
 	WRITE_ONCE(cpu_data->hwp_req_cached, value);
-	wrmsrl_on_cpu(cpu, MSR_HWP_REQUEST, value);
+	wrmsrq_on_cpu(cpu, MSR_HWP_REQUEST, value);
 }
 
 static void intel_pstate_disable_hwp_interrupt(struct cpudata *cpudata);
@@ -1256,7 +1256,7 @@ static void intel_pstate_hwp_offline(struct cpudata *cpu)
 	if (boot_cpu_has(X86_FEATURE_HWP_EPP))
 		value |= HWP_ENERGY_PERF_PREFERENCE(HWP_EPP_POWERSAVE);
 
-	wrmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
+	wrmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
 
 	mutex_lock(&hybrid_capacity_lock);
 
@@ -1302,7 +1302,7 @@ static void intel_pstate_hwp_enable(struct cpudata *cpudata);
 static void intel_pstate_hwp_reenable(struct cpudata *cpu)
 {
 	intel_pstate_hwp_enable(cpu);
-	wrmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, READ_ONCE(cpu->hwp_req_cached));
+	wrmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, READ_ONCE(cpu->hwp_req_cached));
 }
 
 static int intel_pstate_suspend(struct cpufreq_policy *policy)
@@ -1855,7 +1855,7 @@ static void intel_pstate_notify_work(struct work_struct *work)
 		hybrid_update_capacity(cpudata);
 	}
 
-	wrmsrl_on_cpu(cpudata->cpu, MSR_HWP_STATUS, 0);
+	wrmsrq_on_cpu(cpudata->cpu, MSR_HWP_STATUS, 0);
 }
 
 static DEFINE_RAW_SPINLOCK(hwp_notify_lock);
@@ -1905,8 +1905,8 @@ static void intel_pstate_disable_hwp_interrupt(struct cpudata *cpudata)
 	if (!cpu_feature_enabled(X86_FEATURE_HWP_NOTIFY))
 		return;
 
-	/* wrmsrl_on_cpu has to be outside spinlock as this can result in IPC */
-	wrmsrl_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, 0x00);
+	/* wrmsrq_on_cpu has to be outside spinlock as this can result in IPC */
+	wrmsrq_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, 0x00);
 
 	raw_spin_lock_irq(&hwp_notify_lock);
 	cancel_work = cpumask_test_and_clear_cpu(cpudata->cpu, &hwp_intr_enable_mask);
@@ -1933,9 +1933,9 @@ static void intel_pstate_enable_hwp_interrupt(struct cpudata *cpudata)
 		if (cpu_feature_enabled(X86_FEATURE_HWP_HIGHEST_PERF_CHANGE))
 			interrupt_mask |= HWP_HIGHEST_PERF_CHANGE_REQ;
 
-		/* wrmsrl_on_cpu has to be outside spinlock as this can result in IPC */
-		wrmsrl_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, interrupt_mask);
-		wrmsrl_on_cpu(cpudata->cpu, MSR_HWP_STATUS, 0);
+		/* wrmsrq_on_cpu has to be outside spinlock as this can result in IPC */
+		wrmsrq_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, interrupt_mask);
+		wrmsrq_on_cpu(cpudata->cpu, MSR_HWP_STATUS, 0);
 	}
 }
 
@@ -1974,9 +1974,9 @@ static void intel_pstate_hwp_enable(struct cpudata *cpudata)
 {
 	/* First disable HWP notification interrupt till we activate again */
 	if (boot_cpu_has(X86_FEATURE_HWP_NOTIFY))
-		wrmsrl_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, 0x00);
+		wrmsrq_on_cpu(cpudata->cpu, MSR_HWP_INTERRUPT, 0x00);
 
-	wrmsrl_on_cpu(cpudata->cpu, MSR_PM_ENABLE, 0x1);
+	wrmsrq_on_cpu(cpudata->cpu, MSR_PM_ENABLE, 0x1);
 
 	intel_pstate_enable_hwp_interrupt(cpudata);
 
@@ -2244,7 +2244,7 @@ static void intel_pstate_set_pstate(struct cpudata *cpu, int pstate)
 	 * the CPU being updated, so force the register update to run on the
 	 * right CPU.
 	 */
-	wrmsrl_on_cpu(cpu->cpu, MSR_IA32_PERF_CTL,
+	wrmsrq_on_cpu(cpu->cpu, MSR_IA32_PERF_CTL,
 		      pstate_funcs.get_val(cpu, pstate));
 }
 
@@ -3102,7 +3102,7 @@ static void intel_cpufreq_hwp_update(struct cpudata *cpu, u32 min, u32 max,
 	if (fast_switch)
 		wrmsrq(MSR_HWP_REQUEST, value);
 	else
-		wrmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
+		wrmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
 }
 
 static void intel_cpufreq_perf_ctl_update(struct cpudata *cpu,
@@ -3112,7 +3112,7 @@ static void intel_cpufreq_perf_ctl_update(struct cpudata *cpu,
 		wrmsrq(MSR_IA32_PERF_CTL,
 		       pstate_funcs.get_val(cpu, target_pstate));
 	else
-		wrmsrl_on_cpu(cpu->cpu, MSR_IA32_PERF_CTL,
+		wrmsrq_on_cpu(cpu->cpu, MSR_IA32_PERF_CTL,
 			      pstate_funcs.get_val(cpu, target_pstate));
 }
 
@@ -3323,7 +3323,7 @@ static int intel_cpufreq_suspend(struct cpufreq_policy *policy)
 		 * written by it may not be suitable.
 		 */
 		value &= ~HWP_DESIRED_PERF(~0L);
-		wrmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
+		wrmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, value);
 		WRITE_ONCE(cpu->hwp_req_cached, value);
 	}
 
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 5295cd1483f4..6f873765d2d1 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -88,7 +88,7 @@ static int uncore_write_control_freq(struct uncore_data *data, unsigned int inpu
 		cap |= FIELD_PREP(UNCORE_MIN_RATIO_MASK, input);
 	}
 
-	ret = wrmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, cap);
+	ret = wrmsrq_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, cap);
 	if (ret)
 		return ret;
 
@@ -207,7 +207,7 @@ static int uncore_pm_notify(struct notifier_block *nb, unsigned long mode,
 			if (!data || !data->valid || !data->stored_uncore_data)
 				return 0;
 
-			wrmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT,
+			wrmsrq_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT,
 				      data->stored_uncore_data);
 		}
 		break;
-- 
2.45.2

