Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39D2F2C55
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967826; cv=none; b=rOcOYVEV5NFUdqjZmEpZmR0/CFMCaMVP2dZack9EH/CHgjcCACiEs+RhTVKF2l7UeGK97cITO4BUZgE2YM6jCRkUm1QSWqUiVwRaDUUz1UQR19ukEI2C8LKyWMbso2sMmPiVuNJmE5S007yW2AVp1CGJiPORJjLByUe17XuBqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967826; c=relaxed/simple;
	bh=glk68Jbo3iXxlobGAf5SkFMLYktxFZc/qGKRnZxka8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FXvQyxJpWQTTeOdJmFn9fEgZ20mXe84mHZmcEdyXmYsjVvPcTSU3phSUjCRs2qJMPrwSIXupOAdehkSIu4i83EK+OHufqYIS5nP6eZsWWK8zEe1PYMpzC8nG6DE40VKCZt+h5NVoORdzJ+tWK+XgtrR3X1PqPCfdPtevddCEU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaoJEHR8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaoJEHR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967824; x=1782503824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=glk68Jbo3iXxlobGAf5SkFMLYktxFZc/qGKRnZxka8w=;
  b=DaoJEHR8XKfoz5bwMdw35lcmkXVF7GxJRwReqr1YecfBJsOE4oyaAauP
   wtd0NJVIGcAx3k+v+Y2PLlw9AkSSgBscAoTwFplFbpIAhCCbOH+m3D8kg
   aYtHgcedH5hTR2Ni7JJZOgL9EMcYrvYxQaY7cH4I0mJ0HlmG+8FV/6VRT
   FpT6KXqYBY6sOIuQya7MPWEMEo0cj7qgj25j+L11aLiviPpRTSCTY2c4r
   Yf9MS3zw61yYQ74VWlvc4cwKRpj4wc1SbQy8sVYx6G/6GTRmfoYCftGKJ
   Nel9gQTq5fDxFXcoLC3qrXT4rD8xSdPaRNQ7qPPLHWHfrf/YawogRqQMT
   A==;
X-CSE-ConnectionGUID: eXkyhl+aS7qOXyKazjO84Q==
X-CSE-MsgGUID: X19dfrpKTv21OBQEEX87NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002204"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002204"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:02 -0700
X-CSE-ConnectionGUID: oj8YrI88R2WcWdDc5vJk6Q==
X-CSE-MsgGUID: VWRHCeK7RdirOWjfIKZO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902929"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:57:02 -0700
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
Subject: [RFC PATCH V2 11/13] perf/x86: Add eGPRs into sample_regs
Date: Thu, 26 Jun 2025 12:56:08 -0700
Message-Id: <20250626195610.405379-12-kan.liang@linux.intel.com>
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

The eGPRs is only supported when the new SIMD registers configuration
method is used, which moves the XMM to sample_simd_vec_regs. So the
space can be reclaimed for the eGPRs.

The eGPRs is retrieved by XSAVE. Only support the eGPRs for X86_64.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 41 +++++++++++++++++++++------
 arch/x86/events/perf_event.h          |  1 +
 arch/x86/include/asm/perf_event.h     |  4 +++
 arch/x86/include/uapi/asm/perf_regs.h | 26 +++++++++++++++--
 arch/x86/kernel/perf_regs.c           | 31 ++++++++++----------
 5 files changed, 78 insertions(+), 25 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d4710edce2e9..1da18886e1f3 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -429,6 +429,8 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 		perf_regs->h16zmm = get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
 	if (mask & XFEATURE_MASK_OPMASK)
 		perf_regs->opmask = get_xsave_addr(xsave, XFEATURE_OPMASK);
+	if (mask & XFEATURE_MASK_APX)
+		perf_regs->egpr = get_xsave_addr(xsave, XFEATURE_APX);
 }
 
 static void release_ext_regs_buffers(void)
@@ -463,6 +465,8 @@ static void reserve_ext_regs_buffers(void)
 		mask |= XFEATURE_MASK_Hi16_ZMM;
 	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_OPMASK)
 		mask |= XFEATURE_MASK_OPMASK;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_EGPRS)
+		mask |= XFEATURE_MASK_APX;
 
 	size = xstate_calculate_size(mask, true);
 
@@ -718,17 +722,33 @@ int x86_pmu_hw_config(struct perf_event *event)
 	}
 
 	if (event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
-		/*
-		 * Besides the general purpose registers, XMM registers may
-		 * be collected as well.
-		 */
-		if (event_has_extended_regs(event)) {
-			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
+		if (event->attr.sample_simd_regs_enabled) {
+			u64 reserved = ~GENMASK_ULL(PERF_REG_X86_64_MAX - 1, 0);
+
+			if (!(event->pmu->capabilities & PERF_PMU_CAP_SIMD_REGS))
 				return -EINVAL;
-			if (!(x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM))
+			/*
+			 * The XMM space in the perf_event_x86_regs is reclaimed
+			 * for eGPRs and other general registers.
+			 */
+			if (event->attr.sample_regs_user & reserved ||
+			    event->attr.sample_regs_intr & reserved)
 				return -EINVAL;
-			if (event->attr.sample_simd_regs_enabled)
+			if ((event->attr.sample_regs_user & PERF_X86_EGPRS_MASK ||
+			     event->attr.sample_regs_intr & PERF_X86_EGPRS_MASK) &&
+			     !(x86_pmu.ext_regs_mask & X86_EXT_REGS_EGPRS))
 				return -EINVAL;
+		} else {
+			/*
+			 * Besides the general purpose registers, XMM registers may
+			 * be collected as well.
+			 */
+			if (event_has_extended_regs(event)) {
+				if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
+					return -EINVAL;
+				if (!(x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM))
+					return -EINVAL;
+			}
 		}
 
 		if (event_has_simd_regs(event)) {
@@ -1890,6 +1910,11 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			perf_regs->opmask_regs = NULL;
 			mask |= XFEATURE_MASK_OPMASK;
 		}
+		if (attr->sample_regs_user & PERF_X86_EGPRS_MASK ||
+		    attr->sample_regs_intr & PERF_X86_EGPRS_MASK) {
+			perf_regs->egpr_regs = NULL;
+			mask |= XFEATURE_MASK_APX;
+		}
 	}
 
 	mask &= ~ignore_mask;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index cc0bd9479fa7..4dd1e7344021 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -705,6 +705,7 @@ enum {
 	X86_EXT_REGS_ZMMH	= BIT_ULL(2),
 	X86_EXT_REGS_H16ZMM	= BIT_ULL(3),
 	X86_EXT_REGS_OPMASK	= BIT_ULL(4),
+	X86_EXT_REGS_EGPRS	= BIT_ULL(5),
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index dda677022882..4400cb66bc8e 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -613,6 +613,10 @@ struct x86_perf_regs {
 		u64	*opmask_regs;
 		struct avx_512_opmask_state *opmask;
 	};
+	union {
+		u64	*egpr_regs;
+		struct apx_state *egpr;
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index dd7bd1dd8d39..cd0f6804debf 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -27,11 +27,31 @@ enum perf_event_x86_regs {
 	PERF_REG_X86_R13,
 	PERF_REG_X86_R14,
 	PERF_REG_X86_R15,
+	/* Extended GPRs (EGPRs) */
+	PERF_REG_X86_R16,
+	PERF_REG_X86_R17,
+	PERF_REG_X86_R18,
+	PERF_REG_X86_R19,
+	PERF_REG_X86_R20,
+	PERF_REG_X86_R21,
+	PERF_REG_X86_R22,
+	PERF_REG_X86_R23,
+	PERF_REG_X86_R24,
+	PERF_REG_X86_R25,
+	PERF_REG_X86_R26,
+	PERF_REG_X86_R27,
+	PERF_REG_X86_R28,
+	PERF_REG_X86_R29,
+	PERF_REG_X86_R30,
+	PERF_REG_X86_R31,
 	/* These are the limits for the GPRs. */
 	PERF_REG_X86_32_MAX = PERF_REG_X86_GS + 1,
-	PERF_REG_X86_64_MAX = PERF_REG_X86_R15 + 1,
+	PERF_REG_X86_64_MAX = PERF_REG_X86_R31 + 1,
 
-	/* These all need two bits set because they are 128bit */
+	/*
+	 * These all need two bits set because they are 128bit.
+	 * These are only available when !PERF_SAMPLE_REGS_ABI_SIMD
+	 */
 	PERF_REG_X86_XMM0  = 32,
 	PERF_REG_X86_XMM1  = 34,
 	PERF_REG_X86_XMM2  = 36,
@@ -55,6 +75,8 @@ enum perf_event_x86_regs {
 
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
 
+#define PERF_X86_EGPRS_MASK		GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R16)
+
 #define PERF_X86_SIMD_PRED_REGS_MAX	8
 #define PERF_X86_SIMD_PRED_MASK		GENMASK(PERF_X86_SIMD_PRED_REGS_MAX - 1, 0)
 #define PERF_X86_SIMD_VEC_REGS_MAX	32
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index b569368743a4..3780a7b0e021 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -61,14 +61,22 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
 	struct x86_perf_regs *perf_regs;
 
-	if (idx >= PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
+	if (idx > PERF_REG_X86_R15) {
 		perf_regs = container_of(regs, struct x86_perf_regs, regs);
-		/* SIMD registers are moved to dedicated sample_simd_vec_reg */
-		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD)
-			return 0;
-		if (!perf_regs->xmm_regs)
-			return 0;
-		return perf_regs->xmm_regs[idx - PERF_REG_X86_XMM0];
+
+		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+			if (idx <= PERF_REG_X86_R31) {
+				if (!perf_regs->egpr_regs)
+					return 0;
+				return perf_regs->egpr_regs[idx - PERF_REG_X86_R16];
+			}
+		} else {
+			if (idx >= PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
+				if (!perf_regs->xmm_regs)
+					return 0;
+				return perf_regs->xmm_regs[idx - PERF_REG_X86_XMM0];
+			}
+		}
 	}
 
 	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(pt_regs_offset)))
@@ -149,14 +157,7 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 				 ~((1ULL << PERF_REG_X86_MAX) - 1))
 
 #ifdef CONFIG_X86_32
-#define REG_NOSUPPORT ((1ULL << PERF_REG_X86_R8) | \
-		       (1ULL << PERF_REG_X86_R9) | \
-		       (1ULL << PERF_REG_X86_R10) | \
-		       (1ULL << PERF_REG_X86_R11) | \
-		       (1ULL << PERF_REG_X86_R12) | \
-		       (1ULL << PERF_REG_X86_R13) | \
-		       (1ULL << PERF_REG_X86_R14) | \
-		       (1ULL << PERF_REG_X86_R15))
+#define REG_NOSUPPORT GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R8)
 
 int perf_reg_validate(u64 mask)
 {
-- 
2.38.1

