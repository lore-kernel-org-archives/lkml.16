Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5C2F2C7B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967827; cv=none; b=qnE135n8PGNes/ffpfFKDEAfYfMlyIBL7NB15cHGxmZlpHw6ULe84fwYufhhE+fht4fkMzujuH03PPQMGWPpKT1B0sxtOc6wxAr7mBToXAcdMEkqo6GdHazoNN1dsRk5bkR4cJIzZ0yUdUDa+d49o+Bc/ZEA0Uy6rfiF8sKJ19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967827; c=relaxed/simple;
	bh=s6rdrhi9FvkLruDv4uOvKkPwleSqXPdXEoKEuRLbtlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HLSTU5AuC99wTeVOANn9u9QXw4Y3UyPQzoazwg9zFy3RqVLBlsaR/oZrlM7yzTH4fsnie1dK5p7KUjSIGI4c5mYto1ECeRLzPwb/U95L68absRBTaPccvDlyn5abrpUQ4+RqcLxZo7WT1+agv6A+qWRDgt8v0f+jEsauFpcw4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaVEotVw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaVEotVw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967825; x=1782503825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6rdrhi9FvkLruDv4uOvKkPwleSqXPdXEoKEuRLbtlY=;
  b=UaVEotVwMFwltio2u5O1O+uRlQ+u/naekMwCfqq0lZ/Wl0eOrYmLVi1c
   de7dLL8HL0rmhfaloDYXDj9a7bAymeKBNU4QfI4MUyesHm/+kWea0HFDx
   y6M+5R72PKSbTFpSXPkMA4M/Ade0/MV7zRpWNx7tlw/GKN4xZJVPIT8x8
   KFOKwmHGM/GQUoRIW6wUkXZGcg1JLUeCU1OfgQuaoRNpffpueKa1FM+1F
   izpEU1h6ovHuluPKrSNVr8aeg724xhNOdecbQi5YTgj/cPEKuD29bT/Ku
   1JZ1O0sojB0AM0BCF2bm2lqF8vc3Gz5Y3FNJq1M2Hc0dUBIaCEoxJyB6v
   g==;
X-CSE-ConnectionGUID: cndIxIX9SG68hgGNntBorA==
X-CSE-MsgGUID: wA/WnZCdTm+Y0tcnPGPFIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002212"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:03 -0700
X-CSE-ConnectionGUID: UaOGcLnuT3ammFYdnREnJA==
X-CSE-MsgGUID: 78QGSQexQCar3SGXI2Fn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902932"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:57:03 -0700
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
Subject: [RFC PATCH V2 12/13] perf/x86: Add SSP into sample_regs
Date: Thu, 26 Jun 2025 12:56:09 -0700
Message-Id: <20250626195610.405379-13-kan.liang@linux.intel.com>
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

The SSP is only supported when the new SIMD registers configuration
method is used, which moves the XMM to sample_simd_vec_regs. So the
space can be reclaimed for the SSP.

The SSP is retrieved by XSAVE. Only support the SSP for X86_64.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 16 +++++++++++++++-
 arch/x86/events/perf_event.h          |  1 +
 arch/x86/include/asm/perf_event.h     |  4 ++++
 arch/x86/include/uapi/asm/perf_regs.h |  3 +++
 arch/x86/kernel/perf_regs.c           |  8 +++++++-
 5 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 1da18886e1f3..b35b5695e42f 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -431,6 +431,8 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 		perf_regs->opmask = get_xsave_addr(xsave, XFEATURE_OPMASK);
 	if (mask & XFEATURE_MASK_APX)
 		perf_regs->egpr = get_xsave_addr(xsave, XFEATURE_APX);
+	if (mask & XFEATURE_MASK_CET_USER)
+		perf_regs->cet = get_xsave_addr(xsave, XFEATURE_CET_USER);
 }
 
 static void release_ext_regs_buffers(void)
@@ -467,6 +469,8 @@ static void reserve_ext_regs_buffers(void)
 		mask |= XFEATURE_MASK_OPMASK;
 	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_EGPRS)
 		mask |= XFEATURE_MASK_APX;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_CET)
+		mask |= XFEATURE_MASK_CET_USER;
 
 	size = xstate_calculate_size(mask, true);
 
@@ -723,7 +727,7 @@ int x86_pmu_hw_config(struct perf_event *event)
 
 	if (event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
 		if (event->attr.sample_simd_regs_enabled) {
-			u64 reserved = ~GENMASK_ULL(PERF_REG_X86_64_MAX - 1, 0);
+			u64 reserved = ~GENMASK_ULL(PERF_REG_MISC_MAX - 1, 0);
 
 			if (!(event->pmu->capabilities & PERF_PMU_CAP_SIMD_REGS))
 				return -EINVAL;
@@ -738,6 +742,11 @@ int x86_pmu_hw_config(struct perf_event *event)
 			     event->attr.sample_regs_intr & PERF_X86_EGPRS_MASK) &&
 			     !(x86_pmu.ext_regs_mask & X86_EXT_REGS_EGPRS))
 				return -EINVAL;
+			if ((event->attr.sample_regs_user & BIT_ULL(PERF_REG_X86_SSP) ||
+			     event->attr.sample_regs_intr & BIT_ULL(PERF_REG_X86_SSP)) &&
+			     !(x86_pmu.ext_regs_mask & X86_EXT_REGS_CET))
+				return -EINVAL;
+
 		} else {
 			/*
 			 * Besides the general purpose registers, XMM registers may
@@ -1915,6 +1924,11 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			perf_regs->egpr_regs = NULL;
 			mask |= XFEATURE_MASK_APX;
 		}
+		if (attr->sample_regs_user & BIT_ULL(PERF_REG_X86_SSP) ||
+		    attr->sample_regs_intr & BIT_ULL(PERF_REG_X86_SSP)) {
+			perf_regs->cet_regs = NULL;
+			mask |= XFEATURE_MASK_CET_USER;
+		}
 	}
 
 	mask &= ~ignore_mask;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 4dd1e7344021..1d958059db07 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -706,6 +706,7 @@ enum {
 	X86_EXT_REGS_H16ZMM	= BIT_ULL(3),
 	X86_EXT_REGS_OPMASK	= BIT_ULL(4),
 	X86_EXT_REGS_EGPRS	= BIT_ULL(5),
+	X86_EXT_REGS_CET	= BIT_ULL(6),
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 4400cb66bc8e..28ddff38d232 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -617,6 +617,10 @@ struct x86_perf_regs {
 		u64	*egpr_regs;
 		struct apx_state *egpr;
 	};
+	union {
+		u64	*cet_regs;
+		struct cet_user_state *cet;
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index cd0f6804debf..4d88cb18acb9 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -48,6 +48,9 @@ enum perf_event_x86_regs {
 	PERF_REG_X86_32_MAX = PERF_REG_X86_GS + 1,
 	PERF_REG_X86_64_MAX = PERF_REG_X86_R31 + 1,
 
+	PERF_REG_X86_SSP,
+	PERF_REG_MISC_MAX = PERF_REG_X86_SSP + 1,
+
 	/*
 	 * These all need two bits set because they are 128bit.
 	 * These are only available when !PERF_SAMPLE_REGS_ABI_SIMD
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 3780a7b0e021..f985765a799a 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -70,6 +70,11 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 					return 0;
 				return perf_regs->egpr_regs[idx - PERF_REG_X86_R16];
 			}
+			if (idx == PERF_REG_X86_SSP) {
+				if (!perf_regs->cet_regs)
+					return 0;
+				return perf_regs->cet_regs[1];
+			}
 		} else {
 			if (idx >= PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
 				if (!perf_regs->xmm_regs)
@@ -157,7 +162,8 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 				 ~((1ULL << PERF_REG_X86_MAX) - 1))
 
 #ifdef CONFIG_X86_32
-#define REG_NOSUPPORT GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R8)
+#define REG_NOSUPPORT (GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R8) | \
+		       BIT_ULL(PERF_REG_X86_SSP))
 
 int perf_reg_validate(u64 mask)
 {
-- 
2.38.1

