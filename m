Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE3F2BF05A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822622; cv=none; b=DT7wfjXPC1F38qFf1ZO4dBP5lJ3Wu+xVkbzLHp9FD46J7g2IH9B7clvkJ5r79TF3VGnruTXv7xqFsqqW4UZro1JpM9PdN/3RZpmC9nIPEZ9OBikLZqj5GVo4HdKtJWY6lu89ChqMPR6E/Bptims7prRuvC0hPvHnfgw4mtCb4r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822622; c=relaxed/simple;
	bh=G/dtKnd6cDZjg0GYQYI9hG6P6Van/soGZbLCDpNHpAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0KSn9INSJh+EEnGQuCXETN6fhSc0+c+ILZNtRxRcuDB6j2fmVUrgVwCfQNyoLRDj6CsjabWfoEUgpktDORyD9iodXnOJNkuiL07x52sJvwvWNHqUwXw2NJ2VIAm9EzRdDHNd46Bn38BGlakNikQ4Piq8zkVZi+SHU5ne+KDrOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5Azqf70; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5Azqf70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822620; x=1781358620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G/dtKnd6cDZjg0GYQYI9hG6P6Van/soGZbLCDpNHpAU=;
  b=G5Azqf70zJ2y8vTkVUbO1hFs+jybaT9g1C9U9q0P8b7Wns/SVrzDaAW9
   GaImAIsSOMUPKNxYUHisW+k4P2U6p8cY76W7Dh1aKk+64NGL7n9mIjCTL
   dVYS0uv2lSh8KB6QNyxYob6+a9JX/p/PFTFvnME172XnuP6OgwIL4kaqn
   K+43FhD6JJDIHaf01iJJ5NuazkfExHx7gl7/vaFlr2tmX4wY1C0ouLPNk
   m9J3/JD6yvX4gWQKOhXfm0+gAFvdUheo/UWkU8fZ/o2mz/v010tdrI5Aj
   s5hlVMw4jRhQiXyE5oZmhmy5BvSBvOm0n9+EXHKhXgKafoHv4AcCTj6qG
   w==;
X-CSE-ConnectionGUID: JGqzyuk3Re2anrrGHrKQsw==
X-CSE-MsgGUID: iZ+VuMRqR1y4I139QQprjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837590"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:20 -0700
X-CSE-ConnectionGUID: omFBQQhLQL2m7NJ2nMWthg==
X-CSE-MsgGUID: MXSn1+MuRcqhUUxEUtl1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017625"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:20 -0700
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
Subject: [RFC PATCH 07/12] perf/x86: Add YMMH in extended regs
Date: Fri, 13 Jun 2025 06:49:38 -0700
Message-Id: <20250613134943.3186517-8-kan.liang@linux.intel.com>
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

Support YMMH as the extended registers. It can be configured in the
sample_ext_regs_intr/user.

Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
The value can be retrieved via the XSAVES.

Add sanity check in the perf_reg_validate.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 26 ++++++++++++++
 arch/x86/events/perf_event.h          | 22 ++++++++++++
 arch/x86/include/asm/perf_event.h     |  1 +
 arch/x86/include/uapi/asm/perf_regs.h | 28 +++++++++++++++
 arch/x86/kernel/perf_regs.c           | 49 +++++++++++++++++++++++++--
 5 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 6b1c347cc17a..91039c0256b3 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -422,6 +422,14 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 	xcomp_bv = xregs_xsave->header.xcomp_bv;
 	if (mask & XFEATURE_MASK_SSE && xcomp_bv & XFEATURE_SSE)
 		perf_regs->xmm_regs = (u64 *)xregs_xsave->i387.xmm_space;
+
+	xsave += FXSAVE_SIZE + XSAVE_HDR_SIZE;
+
+	/* The XSAVES instruction always uses the compacted format */
+	if (mask & XFEATURE_MASK_YMM && xcomp_bv & XFEATURE_MASK_YMM) {
+		perf_regs->ymmh_regs = xsave;
+		xsave += XSAVE_YMM_SIZE;
+	}
 }
 
 static void release_ext_regs_buffers(void)
@@ -447,6 +455,9 @@ static void reserve_ext_regs_buffers(void)
 
 	size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
 
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_YMM))
+		size += XSAVE_YMM_SIZE;
+
 	/* XSAVE feature requires 64-byte alignment. */
 	size += 64;
 
@@ -712,6 +723,13 @@ int x86_pmu_hw_config(struct perf_event *event)
 			if (!(x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_XMM)))
 				return -EINVAL;
 		}
+		if (event_has_extended_regs2(event)) {
+			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS2))
+				return -EINVAL;
+			if (x86_pmu_get_event_num_ext_regs(event, X86_EXT_REGS_YMM) &&
+			    !(x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_YMM)))
+				return -EINVAL;
+		}
 	}
 	return x86_setup_perfctr(event);
 }
@@ -1765,6 +1783,7 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 	struct x86_perf_regs *perf_regs = container_of(regs, struct x86_perf_regs, regs);
 	u64 sample_type = event->attr.sample_type;
 	u64 mask = 0;
+	int num;
 
 	if (!(event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
 		return;
@@ -1799,6 +1818,13 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 		mask |= XFEATURE_MASK_SSE;
 	}
 
+	num = x86_pmu_get_event_num_ext_regs(event, X86_EXT_REGS_YMM);
+	if (num) {
+		perf_regs->ymmh_regs = NULL;
+		mask |= XFEATURE_MASK_YMM;
+		data->dyn_size += num * PERF_X86_EXT_REG_YMMH_SIZE * sizeof(u64);
+	}
+
 	mask &= ~ignore_mask;
 	if (mask)
 		x86_pmu_get_ext_regs(perf_regs, mask);
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index b48f4215f37c..911916bc8e36 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -689,6 +689,7 @@ enum {
 
 enum {
 	X86_EXT_REGS_XMM = 0,
+	X86_EXT_REGS_YMM,
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
@@ -1319,6 +1320,27 @@ static inline u64 x86_pmu_get_event_config(struct perf_event *event)
 	return event->attr.config & hybrid(event->pmu, config_mask);
 }
 
+static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
+{
+	u64 mask;
+
+	switch (type) {
+	case X86_EXT_REGS_YMM:
+		mask = GENMASK_ULL(PERF_REG_X86_YMMH15, PERF_REG_X86_YMMH0);
+		return hweight64(ext_regs[0] & mask);
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static inline int x86_pmu_get_event_num_ext_regs(struct perf_event *event,
+						 unsigned int type)
+{
+	return get_num_ext_regs(event->attr.sample_ext_regs_intr, type) +
+	       get_num_ext_regs(event->attr.sample_ext_regs_user, type);
+}
+
 extern struct event_constraint emptyconstraint;
 
 extern struct event_constraint unconstrained;
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 70d1d94aca7e..c30571f4de26 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -593,6 +593,7 @@ struct pt_regs;
 struct x86_perf_regs {
 	struct pt_regs	regs;
 	u64		*xmm_regs;
+	u64		*ymmh_regs;
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index 7c9d2bb3833b..f37644513e33 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -55,4 +55,32 @@ enum perf_event_x86_regs {
 
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
 
+enum perf_event_x86_ext_regs {
+	/* YMMH Registers */
+	PERF_REG_X86_YMMH0	= 0,
+	PERF_REG_X86_YMMH1,
+	PERF_REG_X86_YMMH2,
+	PERF_REG_X86_YMMH3,
+	PERF_REG_X86_YMMH4,
+	PERF_REG_X86_YMMH5,
+	PERF_REG_X86_YMMH6,
+	PERF_REG_X86_YMMH7,
+	PERF_REG_X86_YMMH8,
+	PERF_REG_X86_YMMH9,
+	PERF_REG_X86_YMMH10,
+	PERF_REG_X86_YMMH11,
+	PERF_REG_X86_YMMH12,
+	PERF_REG_X86_YMMH13,
+	PERF_REG_X86_YMMH14,
+	PERF_REG_X86_YMMH15,
+
+	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_YMMH15,
+};
+
+enum perf_event_x86_ext_reg_size {
+	PERF_X86_EXT_REG_YMMH_SIZE	= 2,
+
+	/* max of PERF_REG_X86_XXX_SIZE */
+	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_YMMH_SIZE,
+};
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index b9d5106afc26..f12ef60a1a8a 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -57,10 +57,46 @@ static unsigned int pt_regs_offset[PERF_REG_X86_MAX] = {
 #endif
 };
 
+static_assert(PERF_REG_X86_EXT_REGS_MAX < PERF_ATTR_EXT_REGS_SIZE * 64);
+static_assert(PERF_X86_EXT_REG_SIZE_MAX <= PERF_EXT_REGS_SIZE_MAX);
+
+static inline u64 __perf_ext_reg_value(u64 *ext, int *ext_size,
+				       int idx, u64 *regs, int size)
+{
+	if (!regs)
+		return 0;
+	memcpy(ext, &regs[idx * size], sizeof(u64) * size);
+	*ext_size = size;
+	return ext[0];
+}
+
+static u64 perf_ext_reg_value(struct pt_regs *regs, int idx,
+			      u64 *ext, int *ext_size)
+{
+	struct x86_perf_regs *perf_regs;
+
+	perf_regs = container_of(regs, struct x86_perf_regs, regs);
+	switch (idx) {
+		case PERF_REG_X86_YMMH0 ... PERF_REG_X86_YMMH15:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_YMMH0,
+						    perf_regs->ymmh_regs,
+						    PERF_X86_EXT_REG_YMMH_SIZE);
+		default:
+			WARN_ON_ONCE(1);
+			*ext_size = 0;
+			break;
+	}
+	return 0;
+}
+
 u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
 	struct x86_perf_regs *perf_regs;
 
+	if (ext && ext_size)
+		return perf_ext_reg_value(regs, idx, ext, ext_size);
+
 	if (WARN_ON_ONCE(ext || ext_size))
 		return 0;
 
@@ -117,13 +153,22 @@ void perf_get_regs_user(struct perf_regs *regs_user,
 		       (1ULL << PERF_REG_X86_FS) | \
 		       (1ULL << PERF_REG_X86_GS))
 
+static_assert (PERF_ATTR_EXT_REGS_SIZE == 2);
+
 int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
-	if (mask_ext)
+	if (!mask && !mask_ext)
 		return -EINVAL;
-	if (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
+	if (mask && (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
 		return -EINVAL;
 
+	if (mask_ext) {
+		int h = mask_ext[1] ? fls64(mask_ext[1]) + 64 : fls64(mask_ext[0]);
+
+		if (h > PERF_REG_X86_EXT_REGS_MAX + 1)
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.38.1

