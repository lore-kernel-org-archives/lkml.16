Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E83521ABB6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230593; cv=none; b=pVkrGt85uoGmUOdQeDC9uvFbClObq2ixI6+ocEV77rUHgK0nejyj5QyHifdLvNoNJ4FVyJ5fKZifTHXXm1GoiESeH1xEePRKlBrI6fq+RSDxHBNdcIS2ySpGqBxlKM7tE5JR+gZ5QX8qJHNLervMWWb6mgLYS2pev4od/RiQDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230593; c=relaxed/simple;
	bh=HocDaJV9ocg69kJPgGyzsZWj0m5u40SOuSkD2IkPKuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcFNNIbF6kfdDu1wW4v70i88S8AfCYIV9bKWLcD/PdJX060r/3wr3vHXtfBX6JUpQzxGjDWh0EXkehnmzbqyMCu8dKCF4CY7nky67TfQnrGDnYCw8UZBNVFhQQuvlDmOno48VSAy9qdrlMEyNgK3PzQVnAC5z/VZeJdcDuTSeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szXmZ2VG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szXmZ2VG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27170C4CEEA;
	Wed,  9 Apr 2025 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230593;
	bh=HocDaJV9ocg69kJPgGyzsZWj0m5u40SOuSkD2IkPKuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=szXmZ2VGnqGpL/5Ss74AGnxUg8CfTBVs2LpbKJcxzgOKKHpdoo8dn295MA+UVV/yD
	 hgSmbgxiBIpibgECjt3Jr3plg5zlPMbyEKm9zMJQC7aBwuycoLL6A31lYY8vvHZAPy
	 4E0nBrkieGw/CLFuZTAV4Sa40B62WiLBO6weKn2nhwL6jM4R+hVjbI5qo39e1kXW/S
	 ZGX8WabSFrQnqbUdHg1/Diyw3r8QuHbfNzlMMFd1wDSudy7H1OlkCijbXldmyvZ25w
	 iCq7sup8CpWdb6aPAMLlqfCu/A4zrPcNLJzWZ08yRPnQx5befixpsJtqbHzdoAMJps
	 5IqLPjdmXkbaA==
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
Subject: [PATCH 13/20] x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'
Date: Wed,  9 Apr 2025 22:29:00 +0200
Message-ID: <20250409202907.3419480-14-mingo@kernel.org>
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
 arch/x86/events/intel/uncore_snbep.c               |  2 +-
 arch/x86/include/asm/msr.h                         |  4 ++--
 arch/x86/kernel/cpu/intel_epb.c                    |  4 ++--
 arch/x86/kernel/cpu/mce/inject.c                   |  4 ++--
 arch/x86/lib/msr-smp.c                             |  4 ++--
 drivers/cpufreq/acpi-cpufreq.c                     |  4 ++--
 drivers/cpufreq/amd-pstate.c                       |  6 +++---
 drivers/cpufreq/intel_pstate.c                     | 24 +++++++++++-----------
 .../x86/intel/uncore-frequency/uncore-frequency.c  |  6 +++---
 9 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel/uncore_snbep.c
index 756dd11742ad..dd53dd87cdec 100644
--- a/arch/x86/events/intel/uncore_snbep.c
+++ b/arch/x86/events/intel/uncore_snbep.c
@@ -3765,7 +3765,7 @@ static int skx_msr_cpu_bus_read(int cpu, u64 *topology)
 {
 	u64 msr_value;
 
-	if (rdmsrl_on_cpu(cpu, SKX_MSR_CPU_BUS_NUMBER, &msr_value) ||
+	if (rdmsrq_on_cpu(cpu, SKX_MSR_CPU_BUS_NUMBER, &msr_value) ||
 			!(msr_value & SKX_MSR_CPU_BUS_VALID_BIT))
 		return -ENXIO;
 
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 52983279c953..850793b381c6 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -329,7 +329,7 @@ int msr_clear_bit(u32 msr, u8 bit);
 #ifdef CONFIG_SMP
 int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
 int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
-int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
+int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
 int wrmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
 void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
 void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
@@ -350,7 +350,7 @@ static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 	wrmsr(msr_no, l, h);
 	return 0;
 }
-static inline int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
+static inline int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
 	rdmsrq(msr_no, *q);
 	return 0;
diff --git a/arch/x86/kernel/cpu/intel_epb.c b/arch/x86/kernel/cpu/intel_epb.c
index 01d81b78d09e..54236defb666 100644
--- a/arch/x86/kernel/cpu/intel_epb.c
+++ b/arch/x86/kernel/cpu/intel_epb.c
@@ -135,7 +135,7 @@ static ssize_t energy_perf_bias_show(struct device *dev,
 	u64 epb;
 	int ret;
 
-	ret = rdmsrl_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
+	ret = rdmsrq_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
 	if (ret < 0)
 		return ret;
 
@@ -157,7 +157,7 @@ static ssize_t energy_perf_bias_store(struct device *dev,
 	else if (kstrtou64(buf, 0, &val) || val > MAX_EPB)
 		return -EINVAL;
 
-	ret = rdmsrl_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
+	ret = rdmsrq_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
 	if (ret < 0)
 		return ret;
 
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 5226f8f7fc98..338aeee95bd2 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -589,7 +589,7 @@ static int inj_bank_set(void *data, u64 val)
 	u64 cap;
 
 	/* Get bank count on target CPU so we can handle non-uniform values. */
-	rdmsrl_on_cpu(m->extcpu, MSR_IA32_MCG_CAP, &cap);
+	rdmsrq_on_cpu(m->extcpu, MSR_IA32_MCG_CAP, &cap);
 	n_banks = cap & MCG_BANKCNT_MASK;
 
 	if (val >= n_banks) {
@@ -613,7 +613,7 @@ static int inj_bank_set(void *data, u64 val)
 	if (cpu_feature_enabled(X86_FEATURE_SMCA)) {
 		u64 ipid;
 
-		if (rdmsrl_on_cpu(m->extcpu, MSR_AMD64_SMCA_MCx_IPID(val), &ipid)) {
+		if (rdmsrq_on_cpu(m->extcpu, MSR_AMD64_SMCA_MCx_IPID(val), &ipid)) {
 			pr_err("Error reading IPID on CPU%d\n", m->extcpu);
 			return -EINVAL;
 		}
diff --git a/arch/x86/lib/msr-smp.c b/arch/x86/lib/msr-smp.c
index 434fdc21a86e..b6081fc2217f 100644
--- a/arch/x86/lib/msr-smp.c
+++ b/arch/x86/lib/msr-smp.c
@@ -47,7 +47,7 @@ int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
 }
 EXPORT_SYMBOL(rdmsr_on_cpu);
 
-int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
+int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
 	int err;
 	struct msr_info rv;
@@ -60,7 +60,7 @@ int rdmsrl_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 
 	return err;
 }
-EXPORT_SYMBOL(rdmsrl_on_cpu);
+EXPORT_SYMBOL(rdmsrq_on_cpu);
 
 int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 {
diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index d19867cf816a..8bc08f3b0d5d 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -79,11 +79,11 @@ static bool boost_state(unsigned int cpu)
 	case X86_VENDOR_INTEL:
 	case X86_VENDOR_CENTAUR:
 	case X86_VENDOR_ZHAOXIN:
-		rdmsrl_on_cpu(cpu, MSR_IA32_MISC_ENABLE, &msr);
+		rdmsrq_on_cpu(cpu, MSR_IA32_MISC_ENABLE, &msr);
 		return !(msr & MSR_IA32_MISC_ENABLE_TURBO_DISABLE);
 	case X86_VENDOR_HYGON:
 	case X86_VENDOR_AMD:
-		rdmsrl_on_cpu(cpu, MSR_K7_HWCR, &msr);
+		rdmsrq_on_cpu(cpu, MSR_K7_HWCR, &msr);
 		return !(msr & MSR_K7_HWCR_CPB_DIS);
 	}
 	return false;
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 0615c73306cf..e987486cbb34 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -197,7 +197,7 @@ static u8 msr_get_epp(struct amd_cpudata *cpudata)
 	u64 value;
 	int ret;
 
-	ret = rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &value);
+	ret = rdmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &value);
 	if (ret < 0) {
 		pr_debug("Could not retrieve energy perf value (%d)\n", ret);
 		return ret;
@@ -769,7 +769,7 @@ static int amd_pstate_init_boost_support(struct amd_cpudata *cpudata)
 		goto exit_err;
 	}
 
-	ret = rdmsrl_on_cpu(cpudata->cpu, MSR_K7_HWCR, &boost_val);
+	ret = rdmsrq_on_cpu(cpudata->cpu, MSR_K7_HWCR, &boost_val);
 	if (ret) {
 		pr_err_once("failed to read initial CPU boost state!\n");
 		ret = -EIO;
@@ -1491,7 +1491,7 @@ static int amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
 	}
 
 	if (cpu_feature_enabled(X86_FEATURE_CPPC)) {
-		ret = rdmsrl_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &value);
+		ret = rdmsrq_on_cpu(cpudata->cpu, MSR_AMD_CPPC_REQ, &value);
 		if (ret)
 			return ret;
 		WRITE_ONCE(cpudata->cppc_req_cached, value);
diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 6f6c14e31795..8ce9d54ea32e 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -620,7 +620,7 @@ static s16 intel_pstate_get_epb(struct cpudata *cpu_data)
 	if (!boot_cpu_has(X86_FEATURE_EPB))
 		return -ENXIO;
 
-	ret = rdmsrl_on_cpu(cpu_data->cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
+	ret = rdmsrq_on_cpu(cpu_data->cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
 	if (ret)
 		return (s16)ret;
 
@@ -637,7 +637,7 @@ static s16 intel_pstate_get_epp(struct cpudata *cpu_data, u64 hwp_req_data)
 		 * MSR_HWP_REQUEST, so need to read and get EPP.
 		 */
 		if (!hwp_req_data) {
-			epp = rdmsrl_on_cpu(cpu_data->cpu, MSR_HWP_REQUEST,
+			epp = rdmsrq_on_cpu(cpu_data->cpu, MSR_HWP_REQUEST,
 					    &hwp_req_data);
 			if (epp)
 				return epp;
@@ -659,7 +659,7 @@ static int intel_pstate_set_epb(int cpu, s16 pref)
 	if (!boot_cpu_has(X86_FEATURE_EPB))
 		return -ENXIO;
 
-	ret = rdmsrl_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
+	ret = rdmsrq_on_cpu(cpu, MSR_IA32_ENERGY_PERF_BIAS, &epb);
 	if (ret)
 		return ret;
 
@@ -916,7 +916,7 @@ static ssize_t show_base_frequency(struct cpufreq_policy *policy, char *buf)
 	if (ratio <= 0) {
 		u64 cap;
 
-		rdmsrl_on_cpu(policy->cpu, MSR_HWP_CAPABILITIES, &cap);
+		rdmsrq_on_cpu(policy->cpu, MSR_HWP_CAPABILITIES, &cap);
 		ratio = HWP_GUARANTEED_PERF(cap);
 	}
 
@@ -1088,7 +1088,7 @@ static void __intel_pstate_get_hwp_cap(struct cpudata *cpu)
 {
 	u64 cap;
 
-	rdmsrl_on_cpu(cpu->cpu, MSR_HWP_CAPABILITIES, &cap);
+	rdmsrq_on_cpu(cpu->cpu, MSR_HWP_CAPABILITIES, &cap);
 	WRITE_ONCE(cpu->hwp_cap_cached, cap);
 	cpu->pstate.max_pstate = HWP_GUARANTEED_PERF(cap);
 	cpu->pstate.turbo_pstate = HWP_HIGHEST_PERF(cap);
@@ -1162,7 +1162,7 @@ static void intel_pstate_hwp_set(unsigned int cpu)
 	if (cpu_data->policy == CPUFREQ_POLICY_PERFORMANCE)
 		min = max;
 
-	rdmsrl_on_cpu(cpu, MSR_HWP_REQUEST, &value);
+	rdmsrq_on_cpu(cpu, MSR_HWP_REQUEST, &value);
 
 	value &= ~HWP_MIN_PERF(~0L);
 	value |= HWP_MIN_PERF(min);
@@ -2084,7 +2084,7 @@ static int core_get_min_pstate(int cpu)
 {
 	u64 value;
 
-	rdmsrl_on_cpu(cpu, MSR_PLATFORM_INFO, &value);
+	rdmsrq_on_cpu(cpu, MSR_PLATFORM_INFO, &value);
 	return (value >> 40) & 0xFF;
 }
 
@@ -2092,7 +2092,7 @@ static int core_get_max_pstate_physical(int cpu)
 {
 	u64 value;
 
-	rdmsrl_on_cpu(cpu, MSR_PLATFORM_INFO, &value);
+	rdmsrq_on_cpu(cpu, MSR_PLATFORM_INFO, &value);
 	return (value >> 8) & 0xFF;
 }
 
@@ -2137,7 +2137,7 @@ static int core_get_max_pstate(int cpu)
 	int tdp_ratio;
 	int err;
 
-	rdmsrl_on_cpu(cpu, MSR_PLATFORM_INFO, &plat_info);
+	rdmsrq_on_cpu(cpu, MSR_PLATFORM_INFO, &plat_info);
 	max_pstate = (plat_info >> 8) & 0xFF;
 
 	tdp_ratio = core_get_tdp_ratio(cpu, plat_info);
@@ -2169,7 +2169,7 @@ static int core_get_turbo_pstate(int cpu)
 	u64 value;
 	int nont, ret;
 
-	rdmsrl_on_cpu(cpu, MSR_TURBO_RATIO_LIMIT, &value);
+	rdmsrq_on_cpu(cpu, MSR_TURBO_RATIO_LIMIT, &value);
 	nont = core_get_max_pstate(cpu);
 	ret = (value) & 255;
 	if (ret <= nont)
@@ -2198,7 +2198,7 @@ static int knl_get_turbo_pstate(int cpu)
 	u64 value;
 	int nont, ret;
 
-	rdmsrl_on_cpu(cpu, MSR_TURBO_RATIO_LIMIT, &value);
+	rdmsrq_on_cpu(cpu, MSR_TURBO_RATIO_LIMIT, &value);
 	nont = core_get_max_pstate(cpu);
 	ret = (((value) >> 8) & 0xFF);
 	if (ret <= nont)
@@ -3256,7 +3256,7 @@ static int intel_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 		intel_pstate_get_hwp_cap(cpu);
 
-		rdmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, &value);
+		rdmsrq_on_cpu(cpu->cpu, MSR_HWP_REQUEST, &value);
 		WRITE_ONCE(cpu->hwp_req_cached, value);
 
 		cpu->epp_cached = intel_pstate_get_epp(cpu, value);
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 40bbf8e45fa4..5295cd1483f4 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -51,7 +51,7 @@ static int uncore_read_control_freq(struct uncore_data *data, unsigned int *valu
 	if (data->control_cpu < 0)
 		return -ENXIO;
 
-	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
+	ret = rdmsrq_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
 	if (ret)
 		return ret;
 
@@ -76,7 +76,7 @@ static int uncore_write_control_freq(struct uncore_data *data, unsigned int inpu
 	if (data->control_cpu < 0)
 		return -ENXIO;
 
-	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
+	ret = rdmsrq_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
 	if (ret)
 		return ret;
 
@@ -105,7 +105,7 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 	if (data->control_cpu < 0)
 		return -ENXIO;
 
-	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_PERF_STATUS, &ratio);
+	ret = rdmsrq_on_cpu(data->control_cpu, MSR_UNCORE_PERF_STATUS, &ratio);
 	if (ret)
 		return ret;
 
-- 
2.45.2

