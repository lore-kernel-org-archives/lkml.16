Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175442F0E2E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967822; cv=none; b=CmvI0v9q2EUFpF3jS79/iAUvSLkpc3E/iEcmU36d+KJFRBqs+QyCSCIVQRMbvhkFkWjppZ/MhCo3I0yZGuc3FV2klcjtOUKl1hE0jzbz85DngWS5B4be1fFKJ7d+gOvGjUCQ+L28HMEqAAWAdZ18ClLGVt2esImddf5fmOXg1pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967822; c=relaxed/simple;
	bh=wZgEjj3If4fylfgepZcFZAdQUGPrMwiwihqqfNK2M7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0kV92UcEDXynXsMHBvReG+CYROod4uXn6CbIXwcCOzZFT1StAuj+DBSYMCqfFw85Hq5/gecFwiWJt3g6rHO4h0J9rhRof+iODYtTK4niGZ0oA6sxosOce42ZhUgcru1rF6iUQSdRmLngd5BY/iTm6IvnKwXTltmHy5THOaIgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeihQiOz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeihQiOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967821; x=1782503821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZgEjj3If4fylfgepZcFZAdQUGPrMwiwihqqfNK2M7c=;
  b=EeihQiOzgbozF09JIpQVQqKloBDgnu3COP7hYBYzlTcV4PaMRmWGD55Q
   oZBsRpY/T3I46L6V5r8OBZbe6LX+RYw+LhfXDmXqEepAaKeLOpN6bM74N
   zg5hmVSOdAylx9FEWM5KnSwxmhWw3xZh2mIV1pk3vrxiuzTz61hGWyVXV
   l9wYxtKl9eigUkdwBudVry1lseLuQa8nQszUc6TjnhHZeacbbaqydNvj+
   YQwY7ms3kRkvNnXb3WNKCYSzG+iOyXzUSqqrSEntEahgjfNv9s1HyOARw
   HRUQQJinOC5jkmMl7XvFdaikNjr0ZX/+H/PE0rwNYnQerWZsZPG3sB0X9
   Q==;
X-CSE-ConnectionGUID: I0XYL2XCQc2RFZX0l9P2og==
X-CSE-MsgGUID: TbYLbu44T6+T6jDlFnrD5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002156"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:56:59 -0700
X-CSE-ConnectionGUID: agdH+hyyRO6+YaotbPOAVA==
X-CSE-MsgGUID: cc5W/s+YTHGyFgGBZsEX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902910"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:56:59 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	irogers@google.com,
	adrian.hunter@intel.com,
	jolsa@kernel.org,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: dapeng1.mi@linux.intel.com,
	ak@linux.intel.com,
	zide.chen@intel.com,
	mark.rutland@arm.com,
	broonie@kernel.org,
	ravi.bangoria@amd.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH V2 05/13] perf/x86: Support XMM register for non-PEBS and REGS_USER
Date: Thu, 26 Jun 2025 12:56:02 -0700
Message-Id: <20250626195610.405379-6-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250626195610.405379-1-kan.liang@linux.intel.com>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Collecting the XMM registers in a PEBS record has been supported since
the Icelake. But non-PEBS events don't support the feature. It's
possible to retrieve the XMM registers from the XSAVE for non-PEBS.
Add it to make the feature complete.

To utilize the XSAVE, a 64-byte aligned buffer is required. Add a
per-CPU ext_regs_buf to store the vector registers. The size of the
buffer is ~2K. kzalloc_node() is used because there's a _guarantee_
that all kmalloc()'s with powers of 2 are naturally aligned and also
64b aligned.

Extend the support for both REGS_USER and REGS_INTR. For REGS_USER, the
perf_get_regs_user() returns the regs from the task_pt_regs(current),
which is struct pt_regs. Need to move it to local struct x86_perf_regs
x86_user_regs.
For PEBS, the HW support is still preferred. The XMM should be retrieved
from PEBS records.

There could be more vector registers supported later. Add ext_regs_mask
to track the supported vector register group.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c            | 128 +++++++++++++++++++++++++-----
 arch/x86/events/intel/core.c      |  27 +++++++
 arch/x86/events/intel/ds.c        |  10 ++-
 arch/x86/events/perf_event.h      |  12 ++-
 arch/x86/include/asm/fpu/xstate.h |   2 +
 arch/x86/include/asm/perf_event.h |   5 +-
 arch/x86/kernel/fpu/xstate.c      |   2 +-
 7 files changed, 161 insertions(+), 25 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index c601ad761534..899bd5680f6b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -406,6 +406,62 @@ set_ext_hw_attr(struct hw_perf_event *hwc, struct perf_event *event)
 	return x86_pmu_extra_regs(val, event);
 }
 
+static DEFINE_PER_CPU(struct xregs_state *, ext_regs_buf);
+
+static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
+{
+	struct xregs_state *xsave = per_cpu(ext_regs_buf, smp_processor_id());
+
+	if (WARN_ON_ONCE(!xsave))
+		return;
+
+	xsaves_nmi(xsave, mask);
+
+	if (mask & XFEATURE_MASK_SSE &&
+	    xsave->header.xfeatures & BIT_ULL(XFEATURE_SSE))
+		perf_regs->xmm_space = xsave->i387.xmm_space;
+}
+
+static void release_ext_regs_buffers(void)
+{
+	int cpu;
+
+	if (!x86_pmu.ext_regs_mask)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		kfree(per_cpu(ext_regs_buf, cpu));
+		per_cpu(ext_regs_buf, cpu) = NULL;
+	}
+}
+
+static void reserve_ext_regs_buffers(void)
+{
+	unsigned int size;
+	u64 mask = 0;
+	int cpu;
+
+	if (!x86_pmu.ext_regs_mask)
+		return;
+
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM)
+		mask |= XFEATURE_MASK_SSE;
+
+	size = xstate_calculate_size(mask, true);
+
+	for_each_possible_cpu(cpu) {
+		per_cpu(ext_regs_buf, cpu) = kzalloc_node(size, GFP_KERNEL,
+							  cpu_to_node(cpu));
+		if (!per_cpu(ext_regs_buf, cpu))
+			goto err;
+	}
+
+	return;
+
+err:
+	release_ext_regs_buffers();
+}
+
 int x86_reserve_hardware(void)
 {
 	int err = 0;
@@ -418,6 +474,7 @@ int x86_reserve_hardware(void)
 			} else {
 				reserve_ds_buffers();
 				reserve_lbr_buffers();
+				reserve_ext_regs_buffers();
 			}
 		}
 		if (!err)
@@ -434,6 +491,7 @@ void x86_release_hardware(void)
 		release_pmc_hardware();
 		release_ds_buffers();
 		release_lbr_buffers();
+		release_ext_regs_buffers();
 		mutex_unlock(&pmc_reserve_mutex);
 	}
 }
@@ -642,21 +700,18 @@ int x86_pmu_hw_config(struct perf_event *event)
 			return -EINVAL;
 	}
 
-	/* sample_regs_user never support XMM registers */
-	if (unlikely(event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK))
-		return -EINVAL;
-	/*
-	 * Besides the general purpose registers, XMM registers may
-	 * be collected in PEBS on some platforms, e.g. Icelake
-	 */
-	if (unlikely(event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)) {
-		if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
-			return -EINVAL;
-
-		if (!event->attr.precise_ip)
-			return -EINVAL;
+	if (event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
+		/*
+		 * Besides the general purpose registers, XMM registers may
+		 * be collected as well.
+		 */
+		if (event_has_extended_regs(event)) {
+			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
+				return -EINVAL;
+			if (!(x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM))
+				return -EINVAL;
+		}
 	}
-
 	return x86_setup_perfctr(event);
 }
 
@@ -1685,25 +1740,51 @@ static void x86_pmu_del(struct perf_event *event, int flags)
 	static_call_cond(x86_pmu_del)(event);
 }
 
+static DEFINE_PER_CPU(struct x86_perf_regs, x86_user_regs);
+
+static struct x86_perf_regs *
+x86_pmu_perf_get_regs_user(struct perf_sample_data *data,
+			   struct pt_regs *regs)
+{
+	struct x86_perf_regs *x86_regs_user = this_cpu_ptr(&x86_user_regs);
+	struct perf_regs regs_user;
+
+	perf_get_regs_user(&regs_user, regs);
+	data->regs_user.abi = regs_user.abi;
+	if (regs_user.regs) {
+		x86_regs_user->regs = *regs_user.regs;
+		data->regs_user.regs = &x86_regs_user->regs;
+	} else
+		data->regs_user.regs = NULL;
+	return x86_regs_user;
+}
+
 void x86_pmu_setup_regs_data(struct perf_event *event,
 			     struct perf_sample_data *data,
-			     struct pt_regs *regs)
+			     struct pt_regs *regs,
+			     u64 ignore_mask)
 {
-	u64 sample_type = event->attr.sample_type;
+	struct x86_perf_regs *perf_regs = container_of(regs, struct x86_perf_regs, regs);
+	struct perf_event_attr *attr = &event->attr;
+	u64 sample_type = attr->sample_type;
+	u64 mask = 0;
+
+	if (!(attr->sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
+		return;
 
 	if (sample_type & PERF_SAMPLE_REGS_USER) {
 		if (user_mode(regs)) {
 			data->regs_user.abi = perf_reg_abi(current);
 			data->regs_user.regs = regs;
 		} else if (!(current->flags & PF_KTHREAD)) {
-			perf_get_regs_user(&data->regs_user, regs);
+			perf_regs = x86_pmu_perf_get_regs_user(data, regs);
 		} else {
 			data->regs_user.abi = PERF_SAMPLE_REGS_ABI_NONE;
 			data->regs_user.regs = NULL;
 		}
 		data->dyn_size += sizeof(u64);
 		if (data->regs_user.regs)
-			data->dyn_size += hweight64(event->attr.sample_regs_user) * sizeof(u64);
+			data->dyn_size += hweight64(attr->sample_regs_user) * sizeof(u64);
 		data->sample_flags |= PERF_SAMPLE_REGS_USER;
 	}
 
@@ -1712,9 +1793,18 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 		data->regs_intr.abi = perf_reg_abi(current);
 		data->dyn_size += sizeof(u64);
 		if (data->regs_intr.regs)
-			data->dyn_size += hweight64(event->attr.sample_regs_intr) * sizeof(u64);
+			data->dyn_size += hweight64(attr->sample_regs_intr) * sizeof(u64);
 		data->sample_flags |= PERF_SAMPLE_REGS_INTR;
 	}
+
+	if (event_has_extended_regs(event)) {
+		perf_regs->xmm_regs = NULL;
+		mask |= XFEATURE_MASK_SSE;
+	}
+
+	mask &= ~ignore_mask;
+	if (mask)
+		x86_pmu_get_ext_regs(perf_regs, mask);
 }
 
 int x86_pmu_handle_irq(struct pt_regs *regs)
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index edebc8dfbc96..c73c2e57d71b 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3285,6 +3285,8 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 		if (has_branch_stack(event))
 			intel_pmu_lbr_save_brstack(&data, cpuc, event);
 
+		x86_pmu_setup_regs_data(event, &data, regs, 0);
+
 		perf_event_overflow(event, &data, regs);
 	}
 
@@ -5273,6 +5275,29 @@ static inline bool intel_pmu_broken_perf_cap(void)
 	return false;
 }
 
+static void intel_extended_regs_init(struct pmu *pmu)
+{
+	/*
+	 * Extend the vector registers support to non-PEBS.
+	 * The feature is limited to newer Intel machines with
+	 * PEBS V4+ or archPerfmonExt (0x23) enabled for now.
+	 * In theory, the vector registers can be retrieved as
+	 * long as the CPU supports. The support for the old
+	 * generations may be added later if there is a
+	 * requirement.
+	 * Only support the extension when XSAVES is available.
+	 */
+	if (!boot_cpu_has(X86_FEATURE_XSAVES))
+		return;
+
+	if (!boot_cpu_has(X86_FEATURE_XMM) ||
+	    !cpu_has_xfeatures(XFEATURE_MASK_SSE, NULL))
+		return;
+
+	x86_pmu.ext_regs_mask |= X86_EXT_REGS_XMM;
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
+}
+
 static void update_pmu_cap(struct pmu *pmu)
 {
 	unsigned int cntr, fixed_cntr, ecx, edx;
@@ -5307,6 +5332,8 @@ static void update_pmu_cap(struct pmu *pmu)
 		/* Perf Metric (Bit 15) and PEBS via PT (Bit 16) are hybrid enumeration */
 		rdmsrq(MSR_IA32_PERF_CAPABILITIES, hybrid(pmu, intel_cap).capabilities);
 	}
+
+	intel_extended_regs_init(pmu);
 }
 
 static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index e67d8a03ddfe..8437730abfb7 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1415,8 +1415,7 @@ static u64 pebs_update_adaptive_cfg(struct perf_event *event)
 	if (gprs || (attr->precise_ip < 2) || tsx_weight)
 		pebs_data_cfg |= PEBS_DATACFG_GP;
 
-	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
-	    (attr->sample_regs_intr & PERF_REG_EXTENDED_MASK))
+	if (event_has_extended_regs(event))
 		pebs_data_cfg |= PEBS_DATACFG_XMMS;
 
 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
@@ -2127,8 +2126,12 @@ static void setup_pebs_adaptive_sample_data(struct perf_event *event,
 		}
 
 		if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
+			u64 mask = 0;
+
 			adaptive_pebs_save_regs(regs, gprs);
-			x86_pmu_setup_regs_data(event, data, regs);
+			if (format_group & PEBS_DATACFG_XMMS)
+				mask |= XFEATURE_MASK_SSE;
+			x86_pmu_setup_regs_data(event, data, regs, mask);
 		}
 	}
 
@@ -2755,6 +2758,7 @@ void __init intel_pebs_init(void)
 				x86_pmu.flags |= PMU_FL_PEBS_ALL;
 				x86_pmu.pebs_capable = ~0ULL;
 				pebs_qual = "-baseline";
+				x86_pmu.ext_regs_mask |= X86_EXT_REGS_XMM;
 				x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
 			} else {
 				/* Only basic record supported */
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 12682a059608..37ed46cafa53 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -687,6 +687,10 @@ enum {
 	x86_lbr_exclusive_max,
 };
 
+enum {
+	X86_EXT_REGS_XMM	= BIT_ULL(0),
+};
+
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
 #define PERF_PEBS_DATA_SOURCE_MASK	(PERF_PEBS_DATA_SOURCE_MAX - 1)
 #define PERF_PEBS_DATA_SOURCE_GRT_MAX	0x10
@@ -992,6 +996,11 @@ struct x86_pmu {
 	struct extra_reg *extra_regs;
 	unsigned int flags;
 
+	/*
+	 * Extended regs, e.g., vector registers
+	 */
+	u64		ext_regs_mask;
+
 	/*
 	 * Intel host/guest support (KVM)
 	 */
@@ -1280,7 +1289,8 @@ int x86_pmu_handle_irq(struct pt_regs *regs);
 
 void x86_pmu_setup_regs_data(struct perf_event *event,
 			     struct perf_sample_data *data,
-			     struct pt_regs *regs);
+			     struct pt_regs *regs,
+			     u64 ignore_mask);
 
 void x86_pmu_show_pmu_cap(struct pmu *pmu);
 
diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index 0c8b9251c29f..58bbdf9226d1 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -109,6 +109,8 @@ void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
 void xsaves_nmi(struct xregs_state *xsave, u64 mask);
 
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+
 int xfd_enable_feature(u64 xfd_err);
 
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 70d1d94aca7e..f36f04bc95f1 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -592,7 +592,10 @@ extern void perf_events_lapic_init(void);
 struct pt_regs;
 struct x86_perf_regs {
 	struct pt_regs	regs;
-	u64		*xmm_regs;
+	union {
+		u64	*xmm_regs;
+		u32	*xmm_space;	/* for xsaves */
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 8602683fcb12..4747b29608cd 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -583,7 +583,7 @@ static bool __init check_xstate_against_struct(int nr)
 	return true;
 }
 
-static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
 	unsigned int topmost = fls64(xfeatures) -  1;
 	unsigned int offset, i;
-- 
2.38.1

