Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C512F271D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967825; cv=none; b=HtI5Y/FnjEiqFKDUoWECqdqE93qBPao3UGrVqeC8FF7YHJBDJQVhx5M9Yo/0o9bIN1R4Uu7buY7AoBheNhfQVETsbhZPpk3yjSRnPw1H1DVvXR7aYs9Lm8Y3ZAmwWt8hQBQukXli2/+4x69/A4qZZxEyBTN7iuN8NPASu9W29Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967825; c=relaxed/simple;
	bh=7nUh86q/nRmzY0g6gz2a8jMcMeRzIyFvhvxqJbELXTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bSXlyKhO6WhdJSVxXY2qJMIDU6eDCA8ipz9CMw2ZYlcfLLMEEx4ujTKIEAY60gMqF2RYzJ2N0U2zD+k0lJsTBvmcbtX8+9Khl+79Ag73dahdK8GDLvoHd0B5eooe7kyG645Na4HfQXFs2f8ivzXaYuPKPhicjOV3O2XEdKENHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0Ay/UA0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0Ay/UA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967824; x=1782503824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nUh86q/nRmzY0g6gz2a8jMcMeRzIyFvhvxqJbELXTA=;
  b=H0Ay/UA0ph+YVCI6vURzwuE2DH7qTRtfjBeCvNGRXZG/N4MgYfIUW58v
   QS33ZHx7yEpLkxpqm98ZrrxMuHpgWvdmQsFCQC2CGhfQPDV+hfFmNdHwa
   TzTG2rRHU1k9KEai6luvK4uJ8YlR3ocH2kV7Bkhm6vneXPRaMXOfNnWDr
   /syE+iTpBZg9VY/k1wYUHDS2l+pQ9UKpaPMN55sJYAXvkl+NRdxJkcE6B
   kSx1s5jOeYoY4gln1rd3xwAl9F02T+xf2o94AE2AwWrZqDtd4rZQFNfnd
   qyMYGu+9J+Eu9v68xECE10nGdozjOzHwlRMb1g7bIc/pCxwJXTi9KGkVv
   A==;
X-CSE-ConnectionGUID: 7f3HialcSHOttDAh9f/bzA==
X-CSE-MsgGUID: trWaZIIRQhSroNmLM7jZKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002196"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:02 -0700
X-CSE-ConnectionGUID: dThG1ugEQBGSKGbK6sEhaA==
X-CSE-MsgGUID: ywlBy3PXTMSqdf+B3m2h4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902926"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:57:01 -0700
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
Subject: [RFC PATCH V2 10/13] perf/x86: Add OPMASK into sample_simd_pred_reg
Date: Thu, 26 Jun 2025 12:56:07 -0700
Message-Id: <20250626195610.405379-11-kan.liang@linux.intel.com>
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

The OPMASK is the SIMD's predicate registers. Add them into
sample_simd_pred_reg. The qwords of OPMASK is 1. There are 8 registers.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 15 +++++++++++++++
 arch/x86/events/perf_event.h          |  1 +
 arch/x86/include/asm/perf_event.h     |  4 ++++
 arch/x86/include/uapi/asm/perf_regs.h |  3 +++
 arch/x86/kernel/perf_regs.c           | 15 ++++++++++++---
 5 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 3c05ca98ec3f..d4710edce2e9 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -427,6 +427,8 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 		perf_regs->zmmh = get_xsave_addr(xsave, XFEATURE_ZMM_Hi256);
 	if (mask & XFEATURE_MASK_Hi16_ZMM)
 		perf_regs->h16zmm = get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
+	if (mask & XFEATURE_MASK_OPMASK)
+		perf_regs->opmask = get_xsave_addr(xsave, XFEATURE_OPMASK);
 }
 
 static void release_ext_regs_buffers(void)
@@ -459,6 +461,8 @@ static void reserve_ext_regs_buffers(void)
 		mask |= XFEATURE_MASK_ZMM_Hi256;
 	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_H16ZMM)
 		mask |= XFEATURE_MASK_Hi16_ZMM;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_OPMASK)
+		mask |= XFEATURE_MASK_OPMASK;
 
 	size = xstate_calculate_size(mask, true);
 
@@ -1831,6 +1835,9 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			data->dyn_size += hweight64(attr->sample_simd_vec_reg_user) *
 					  sizeof(u64) *
 					  attr->sample_simd_vec_reg_qwords;
+			data->dyn_size += hweight32(attr->sample_simd_pred_reg_user) *
+					  sizeof(u64) *
+					  attr->sample_simd_pred_reg_qwords;
 			data->regs_user.abi |= PERF_SAMPLE_REGS_ABI_SIMD;
 		}
 		perf_regs->abi = data->regs_user.abi;
@@ -1850,6 +1857,9 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			data->dyn_size += hweight64(attr->sample_simd_vec_reg_intr) *
 					  sizeof(u64) *
 					  attr->sample_simd_vec_reg_qwords;
+			data->dyn_size += hweight32(attr->sample_simd_pred_reg_intr) *
+					  sizeof(u64) *
+					  attr->sample_simd_pred_reg_qwords;
 			data->regs_intr.abi |= PERF_SAMPLE_REGS_ABI_SIMD;
 		}
 		perf_regs->abi = data->regs_intr.abi;
@@ -1875,6 +1885,11 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			perf_regs->h16zmm_regs = NULL;
 			mask |= XFEATURE_MASK_Hi16_ZMM;
 		}
+		if (attr->sample_simd_pred_reg_intr ||
+		    attr->sample_simd_pred_reg_user) {
+			perf_regs->opmask_regs = NULL;
+			mask |= XFEATURE_MASK_OPMASK;
+		}
 	}
 
 	mask &= ~ignore_mask;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index cc42e9d3e13d..cc0bd9479fa7 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -704,6 +704,7 @@ enum {
 	X86_EXT_REGS_YMM	= BIT_ULL(1),
 	X86_EXT_REGS_ZMMH	= BIT_ULL(2),
 	X86_EXT_REGS_H16ZMM	= BIT_ULL(3),
+	X86_EXT_REGS_OPMASK	= BIT_ULL(4),
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 2d78bd9649bd..dda677022882 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -609,6 +609,10 @@ struct x86_perf_regs {
 		u64	*h16zmm_regs;
 		struct avx_512_hi16_state *h16zmm;
 	};
+	union {
+		u64	*opmask_regs;
+		struct avx_512_opmask_state *opmask;
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index f74e3ba65be2..dd7bd1dd8d39 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -55,11 +55,14 @@ enum perf_event_x86_regs {
 
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
 
+#define PERF_X86_SIMD_PRED_REGS_MAX	8
+#define PERF_X86_SIMD_PRED_MASK		GENMASK(PERF_X86_SIMD_PRED_REGS_MAX - 1, 0)
 #define PERF_X86_SIMD_VEC_REGS_MAX	32
 #define PERF_X86_SIMD_VEC_MASK		GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1, 0)
 
 #define PERF_X86_H16ZMM_BASE		16
 
+#define PERF_X86_OPMASK_QWORDS		1
 #define PERF_X86_XMM_QWORDS		2
 #define PERF_X86_YMM_QWORDS		4
 #define PERF_X86_YMMH_QWORDS		(PERF_X86_YMM_QWORDS / 2)
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 74e05e2e5c90..b569368743a4 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -82,8 +82,14 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 {
 	struct x86_perf_regs *perf_regs = container_of(regs, struct x86_perf_regs, regs);
 
-	if (pred)
-		return 0;
+	if (pred) {
+		if (WARN_ON_ONCE(idx >= PERF_X86_SIMD_PRED_REGS_MAX ||
+				 qwords_idx >= PERF_X86_OPMASK_QWORDS))
+			return 0;
+		if (!perf_regs->opmask_regs)
+			return 0;
+		return perf_regs->opmask_regs[idx];
+	}
 
 	if (WARN_ON_ONCE(idx >= PERF_X86_SIMD_VEC_REGS_MAX ||
 			 qwords_idx >= PERF_X86_SIMD_QWORDS_MAX))
@@ -130,7 +136,10 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
 			return -EINVAL;
 	}
-	if (pred_mask)
+
+	if (pred_qwords != PERF_X86_OPMASK_QWORDS)
+		return -EINVAL;
+	if (pred_mask & ~PERF_X86_SIMD_PRED_MASK)
 		return -EINVAL;
 
 	return 0;
-- 
2.38.1

