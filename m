Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3072D8DC5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822621; cv=none; b=S8bsG0uQxwHO6AtyEglRfOSAAuPv/4qpH/6cZEGG176MiF6XaINl5m8eWSsQHemM04bTlz5c1wB+fvYjnBMG8lLMVbd9IzOrnTBMehveywZl8Au2COq2WU9WogvEivTWElBx760oyQ0YzvEAcguMzUC3vKIpDZGLYfzimN4+BVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822621; c=relaxed/simple;
	bh=SCLpVJbkXdLm+MhgaXpua/1aVakeODy6Utk7X5aFoC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TkPFlYhvWF+Tsv9jmo3Rwg9U4Am+BMzAzA1OlMdP8gZkWWhDq1X1B4iWkCNihNTiTV4YhwVtzuh4Brf4gODUmg74x1x3k9Gs3hkLrNQYNQKYiAg/dOdBI9fvZuG9yP6tE/L6KLgPg3S8OH03MiI4T4T4D/5hDDVonFfFUzRUodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ei2wd6IA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei2wd6IA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822619; x=1781358619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SCLpVJbkXdLm+MhgaXpua/1aVakeODy6Utk7X5aFoC8=;
  b=ei2wd6IA76OpTXT3DMBI0aue4BldI6Gam0sPtlqpDx8TGswx2cEOpL48
   XABzFnx716I1imYzzMX0PdenDteCmTH0PVSG7ZJjWhDJBT8PB/Q1VkkGz
   qqelxZ3U0FAu8bU2tWphRNe2maBXXi+Il98zoRFekw9pCNScSTicwS5w7
   j4bOnb+/yLVqP+SzpKWeIjVthXFTRq2EKVOVJr1KiwynuTE1LOWWQkwgI
   P3D9O5chgGep9ES7MoyUsmvIoKnYjdMXumSR3qHVoBL7+zWeplZc4cnBb
   vUVMnZbqlSFd5NaM0H0gc2xRJHZR9JdlCKk7LIzFPoFC4HluM//HD6kmN
   Q==;
X-CSE-ConnectionGUID: zFBGH/6IQp6A6IE9dyshfQ==
X-CSE-MsgGUID: 4jRvI8oXQCmsScdBudhiFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837577"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:18 -0700
X-CSE-ConnectionGUID: uWPSj/4iQoW5A87jXFxUUA==
X-CSE-MsgGUID: QLtzenPoRxStkfNTd51RtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017616"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:18 -0700
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
	Kan Liang <kan.liang@linux.intel.com>
Subject: [RFC PATCH 05/12] perf/x86: Support XMM register for non-PEBS and REGS_USER
Date: Fri, 13 Jun 2025 06:49:36 -0700
Message-Id: <20250613134943.3186517-6-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250613134943.3186517-1-kan.liang@linux.intel.com>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Collecting the XMM registers in a PEBS record has been supported since
the Icelake. But non-PEBS events don't supported the feature. It's
possible to retrieve the XMM registers from the XSAVE for non-PEBS.
Add it to make the support complete.

To utilize the XSAVE, a 64-byte aligned buffer is required. Add a
per-CPU ext_regs_buf to store the vector registers.

Extend the support for both REGS_USER and REGS_INTR. For REGS_USER, the
perf_get_regs_user() returns the regs from the task_pt_regs(current),
which is struct pt_regs. Need to move it to local struct x86_perf_regs
x86_user_regs.
For PEBS, the HW support is still preferred. The XMM should be retrieved
from PEBS records.

There could be more vector registers supported later. Add ext_regs_mask
to track the supported vector register group.

For now, the feature is only supported for newer Intel platforms (PEBS
V4+ or archPerfmonExt (0x23)). In theory, the vector registers can be
retrieved as long as the CPU supports. The support for the old
generations may be added later if there is a requirement.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c       | 119 ++++++++++++++++++++++++++++++-----
 arch/x86/events/intel/core.c |  27 ++++++++
 arch/x86/events/intel/ds.c   |  10 ++-
 arch/x86/events/perf_event.h |  12 +++-
 4 files changed, 148 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index c601ad761534..6b1c347cc17a 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -406,6 +406,63 @@ set_ext_hw_attr(struct hw_perf_event *hwc, struct perf_event *event)
 	return x86_pmu_extra_regs(val, event);
 }
 
+static DEFINE_PER_CPU(void *, ext_regs_buf);
+
+static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
+{
+	void *xsave = (void *)ALIGN((unsigned long)per_cpu(ext_regs_buf, smp_processor_id()), 64);
+	struct xregs_state *xregs_xsave = xsave;
+	u64 xcomp_bv;
+
+	if (WARN_ON_ONCE(!xsave))
+		return;
+
+	xsaves_nmi(xsave, mask);
+
+	xcomp_bv = xregs_xsave->header.xcomp_bv;
+	if (mask & XFEATURE_MASK_SSE && xcomp_bv & XFEATURE_SSE)
+		perf_regs->xmm_regs = (u64 *)xregs_xsave->i387.xmm_space;
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
+	size_t size;
+	int cpu;
+
+	if (!x86_pmu.ext_regs_mask)
+		return;
+
+	size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
+
+	/* XSAVE feature requires 64-byte alignment. */
+	size += 64;
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
@@ -418,6 +475,7 @@ int x86_reserve_hardware(void)
 			} else {
 				reserve_ds_buffers();
 				reserve_lbr_buffers();
+				reserve_ext_regs_buffers();
 			}
 		}
 		if (!err)
@@ -434,6 +492,7 @@ void x86_release_hardware(void)
 		release_pmc_hardware();
 		release_ds_buffers();
 		release_lbr_buffers();
+		release_ext_regs_buffers();
 		mutex_unlock(&pmc_reserve_mutex);
 	}
 }
@@ -642,21 +701,18 @@ int x86_pmu_hw_config(struct perf_event *event)
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
+			if (!(x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_XMM)))
+				return -EINVAL;
+		}
 	}
-
 	return x86_setup_perfctr(event);
 }
 
@@ -1685,18 +1741,40 @@ static void x86_pmu_del(struct perf_event *event, int flags)
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
+	x86_regs_user->regs = *regs_user.regs;
+	data->regs_user.regs = &x86_regs_user->regs;
+	return x86_regs_user;
+}
+
 void x86_pmu_setup_regs_data(struct perf_event *event,
 			     struct perf_sample_data *data,
-			     struct pt_regs *regs)
+			     struct pt_regs *regs,
+			     u64 ignore_mask)
 {
+	struct x86_perf_regs *perf_regs = container_of(regs, struct x86_perf_regs, regs);
 	u64 sample_type = event->attr.sample_type;
+	u64 mask = 0;
+
+	if (!(event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
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
@@ -1715,6 +1793,15 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			data->dyn_size += hweight64(event->attr.sample_regs_intr) * sizeof(u64);
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
index c2fb729c270e..5706ee562684 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3284,6 +3284,8 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 		if (has_branch_stack(event))
 			intel_pmu_lbr_save_brstack(&data, cpuc, event);
 
+		x86_pmu_setup_regs_data(event, &data, regs, 0);
+
 		perf_event_overflow(event, &data, regs);
 	}
 
@@ -5272,6 +5274,29 @@ static inline bool intel_pmu_broken_perf_cap(void)
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
+	x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_XMM);
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
+}
+
 static void update_pmu_cap(struct pmu *pmu)
 {
 	unsigned int cntr, fixed_cntr, ecx, edx;
@@ -5306,6 +5331,8 @@ static void update_pmu_cap(struct pmu *pmu)
 		/* Perf Metric (Bit 15) and PEBS via PT (Bit 16) are hybrid enumeration */
 		rdmsrq(MSR_IA32_PERF_CAPABILITIES, hybrid(pmu, intel_cap).capabilities);
 	}
+
+	intel_extended_regs_init(pmu);
 }
 
 static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index e67d8a03ddfe..ccb5c3ddab3b 100644
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
+				x86_pmu.ext_regs_mask |= BIT_ULL(X86_EXT_REGS_XMM);
 				x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
 			} else {
 				/* Only basic record supported */
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 12682a059608..b48f4215f37c 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -687,6 +687,10 @@ enum {
 	x86_lbr_exclusive_max,
 };
 
+enum {
+	X86_EXT_REGS_XMM = 0,
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
 
-- 
2.38.1

