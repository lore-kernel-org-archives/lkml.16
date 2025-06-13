Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763B2BF079
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822623; cv=none; b=eHLKOm5JIJIOdlQ3HUe6RupbKnhRkuxzazRtsdO7lNEA4e49b9n5FZBU32X2z+gdA0PuqmUJEaa3S5J2U5qXAOMEh23tqonpZQTPUG3dPJRvsRIMG4WfkncKwsi5k3Nw+k6w7dowvVxpPtlilVU3AFXkR4aAp1OkzZkSNTsGKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822623; c=relaxed/simple;
	bh=L+oybvM8m2kMnFTwzhYuivmdWwqoG89QEMSYZi2Md7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dmbj0bb96m6dlH7QiADT6MyMy7vCeaWEl4gPOFBvQD0qUVVC+U/y38IlS0e1WG7MQ6r/gvd/5nloFgR4lhDBR+clm845oSf9e4Z3LY1NZqqAIiTvbieq3AKf6bt5gRCdbeGomBDuoai5PIU1Nv06YQmV/iZ8dTOUs8lcYaMYfPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdOkcykB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdOkcykB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822621; x=1781358621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L+oybvM8m2kMnFTwzhYuivmdWwqoG89QEMSYZi2Md7A=;
  b=NdOkcykBfg13uvWH47owlbhoPhHGnDfdSTMhDWXTAwDzlAQ0dZuiJoRI
   UPqnctAROxewkpSbIrcF3Oh44xt5KMTdD9h3hT5r+SezxpYC0XGz76WI2
   m4XVZRn7JowDm+6c5q83g5J6LzKJv0Y+3+iWFalJTa6l66VC/LoRpnHwo
   /w9sUrrH1wqJX4XNVgse5DH+DJwstHlwsxW3Oc1XcErPWIye11VF2SF8m
   UkOoTJRP1pYCYiHXxS0gaBZ9I2IWNhn99ISbAs7BgDqfEpnT10/HZzG3c
   zoFqe4LSHnghYkaSN1biX0YswLzfjaWDYuuP0R/txj1KyX4wJNpk2bbIB
   A==;
X-CSE-ConnectionGUID: KJ1KWz8ySRO20D4qT83Uww==
X-CSE-MsgGUID: 80QC9EllQ0CF0aRRZEk4+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837598"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:21 -0700
X-CSE-ConnectionGUID: xhUTbX4RTNayPBRTAAe8gQ==
X-CSE-MsgGUID: 7tE5aZitTCe+hKZHSeWISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017631"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:21 -0700
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
Subject: [RFC PATCH 08/12] perf/x86: Add APX in extended regs
Date: Fri, 13 Jun 2025 06:49:39 -0700
Message-Id: <20250613134943.3186517-9-kan.liang@linux.intel.com>
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

Support APX as the extended registers. It can be configured in the
sample_ext_regs_intr/user.

Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
The value can be retrieved via the XSAVES.

Define several macros to simplify the code.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 48 +++++++++++++++++++--------
 arch/x86/events/perf_event.h          |  4 +++
 arch/x86/include/asm/perf_event.h     |  1 +
 arch/x86/include/uapi/asm/perf_regs.h | 21 +++++++++++-
 arch/x86/kernel/perf_regs.c           |  5 +++
 5 files changed, 65 insertions(+), 14 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 91039c0256b3..67f62268f063 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -408,6 +408,14 @@ set_ext_hw_attr(struct hw_perf_event *hwc, struct perf_event *event)
 
 static DEFINE_PER_CPU(void *, ext_regs_buf);
 
+#define __x86_pmu_get_regs(_mask, _regs, _size)		\
+do {							\
+	if (mask & _mask && xcomp_bv & _mask) {		\
+		_regs = xsave;				\
+		xsave += _size;				\
+	}						\
+} while (0)
+
 static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 {
 	void *xsave = (void *)ALIGN((unsigned long)per_cpu(ext_regs_buf, smp_processor_id()), 64);
@@ -426,10 +434,8 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 	xsave += FXSAVE_SIZE + XSAVE_HDR_SIZE;
 
 	/* The XSAVES instruction always uses the compacted format */
-	if (mask & XFEATURE_MASK_YMM && xcomp_bv & XFEATURE_MASK_YMM) {
-		perf_regs->ymmh_regs = xsave;
-		xsave += XSAVE_YMM_SIZE;
-	}
+	__x86_pmu_get_regs(XFEATURE_MASK_YMM, perf_regs->ymmh_regs, XSAVE_YMM_SIZE);
+	__x86_pmu_get_regs(XFEATURE_MASK_APX, perf_regs->apx_regs, sizeof(struct apx_state));
 }
 
 static void release_ext_regs_buffers(void)
@@ -457,6 +463,8 @@ static void reserve_ext_regs_buffers(void)
 
 	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_YMM))
 		size += XSAVE_YMM_SIZE;
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_APX))
+		size += sizeof(struct apx_state);
 
 	/* XSAVE feature requires 64-byte alignment. */
 	size += 64;
@@ -642,6 +650,13 @@ int x86_pmu_max_precise(void)
 	return precise;
 }
 
+#define check_ext_regs(_type)					\
+do {								\
+	if (x86_pmu_get_event_num_ext_regs(event, _type) &&	\
+	    !(x86_pmu.ext_regs_mask & BIT_ULL(_type)))		\
+		return -EINVAL;					\
+} while (0)
+
 int x86_pmu_hw_config(struct perf_event *event)
 {
 	if (event->attr.precise_ip) {
@@ -726,9 +741,8 @@ int x86_pmu_hw_config(struct perf_event *event)
 		if (event_has_extended_regs2(event)) {
 			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS2))
 				return -EINVAL;
-			if (x86_pmu_get_event_num_ext_regs(event, X86_EXT_REGS_YMM) &&
-			    !(x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_YMM)))
-				return -EINVAL;
+			check_ext_regs(X86_EXT_REGS_YMM);
+			check_ext_regs(X86_EXT_REGS_APX);
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1775,6 +1789,16 @@ x86_pmu_perf_get_regs_user(struct perf_sample_data *data,
 	return x86_regs_user;
 }
 
+#define init_ext_regs_data(_type, _regs, _mask, _size)		\
+do {								\
+	num = x86_pmu_get_event_num_ext_regs(event, _type);	\
+	if (num) {						\
+		_regs = NULL;					\
+		mask |= _mask;					\
+		data->dyn_size += num * _size * sizeof(u64);	\
+	}							\
+} while (0)
+
 void x86_pmu_setup_regs_data(struct perf_event *event,
 			     struct perf_sample_data *data,
 			     struct pt_regs *regs,
@@ -1818,12 +1842,10 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 		mask |= XFEATURE_MASK_SSE;
 	}
 
-	num = x86_pmu_get_event_num_ext_regs(event, X86_EXT_REGS_YMM);
-	if (num) {
-		perf_regs->ymmh_regs = NULL;
-		mask |= XFEATURE_MASK_YMM;
-		data->dyn_size += num * PERF_X86_EXT_REG_YMMH_SIZE * sizeof(u64);
-	}
+	init_ext_regs_data(X86_EXT_REGS_YMM, perf_regs->ymmh_regs,
+			   XFEATURE_MASK_YMM, PERF_X86_EXT_REG_YMMH_SIZE);
+	init_ext_regs_data(X86_EXT_REGS_APX, perf_regs->apx_regs,
+			   XFEATURE_MASK_APX, PERF_X86_EXT_REG_APX_SIZE);
 
 	mask &= ~ignore_mask;
 	if (mask)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 911916bc8e36..1c40b5d9c025 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -690,6 +690,7 @@ enum {
 enum {
 	X86_EXT_REGS_XMM = 0,
 	X86_EXT_REGS_YMM,
+	X86_EXT_REGS_APX,
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
@@ -1328,6 +1329,9 @@ static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
 	case X86_EXT_REGS_YMM:
 		mask = GENMASK_ULL(PERF_REG_X86_YMMH15, PERF_REG_X86_YMMH0);
 		return hweight64(ext_regs[0] & mask);
+	case X86_EXT_REGS_APX:
+		mask = GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R16);
+		return hweight64(ext_regs[0] & mask);
 	default:
 		return 0;
 	}
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index c30571f4de26..9e4d60f3a9a2 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -594,6 +594,7 @@ struct x86_perf_regs {
 	struct pt_regs	regs;
 	u64		*xmm_regs;
 	u64		*ymmh_regs;
+	u64		*apx_regs;
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index f37644513e33..e23fb112faac 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -74,11 +74,30 @@ enum perf_event_x86_ext_regs {
 	PERF_REG_X86_YMMH14,
 	PERF_REG_X86_YMMH15,
 
-	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_YMMH15,
+	/* APX Registers */
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
+
+	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_R31,
 };
 
 enum perf_event_x86_ext_reg_size {
 	PERF_X86_EXT_REG_YMMH_SIZE	= 2,
+	PERF_X86_EXT_REG_APX_SIZE	= 1,
 
 	/* max of PERF_REG_X86_XXX_SIZE */
 	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_YMMH_SIZE,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index f12ef60a1a8a..518497bafdf0 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -82,6 +82,11 @@ static u64 perf_ext_reg_value(struct pt_regs *regs, int idx,
 						    idx - PERF_REG_X86_YMMH0,
 						    perf_regs->ymmh_regs,
 						    PERF_X86_EXT_REG_YMMH_SIZE);
+		case PERF_REG_X86_R16 ... PERF_REG_X86_R31:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_R16,
+						    perf_regs->apx_regs,
+						    PERF_X86_EXT_REG_APX_SIZE);
 		default:
 			WARN_ON_ONCE(1);
 			*ext_size = 0;
-- 
2.38.1

