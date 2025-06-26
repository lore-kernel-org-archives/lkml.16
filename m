Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD32F362D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967827; cv=none; b=k5pToAnupb1zJeUodZZbOnGc8P9EI96eA+HU+04l1XCWF6E4uXoscBRuuReBu+Jta62XG7WaxI9503nXV/UTK4yjUKy6TWgaS7Q2AAKUG4wVm7MTN/xuE+L9wR1jYEvaHBuhnFnHrA7p8i5Wr434gZg3Dtro/BZU3SRRwgK7i5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967827; c=relaxed/simple;
	bh=b7ddsw4B1TR/9B431hCDX6tkbkGcagN0Lz2oT/iRcg4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fJlYD9Q4hcpRezg+gKH3LbPIvrW0/592ELt1Tf1JOnzPV1YSfI1pQu59XQufaET3m6hNe+o2BjTv3GncXLbCxlxmzbnD9clTZFgy5Guknuwz3VWj/p3xKY8E3QOoTSxAnYV/7GDYO97HvwuE/zZQDDTbUvfMWPSM2LiBLDWmNxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZECG+uUS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZECG+uUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967825; x=1782503825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b7ddsw4B1TR/9B431hCDX6tkbkGcagN0Lz2oT/iRcg4=;
  b=ZECG+uUSHResyy8wZ5VGP8Sh7Twyfe/kw/1D2msEoErCmnbok5dlInqQ
   74p1+SK9W62Xs7iEoywprESok1CJjS/7axxy9/3XqlGvkif/PB6l8OyEg
   S3Am8uWIC4k5ScZiTrLOr86LkCPMIFPnslopBOEXEqFw78djKIRX1v9gA
   2vuxFtuCEaEjXMTgLm7hHgp6a4tj9OnF1wiChVf1j4+0TuO2gIQZSOdz1
   Ig+oIwEjq88Tz8Ny/WM90dhMM1zhulARACSxqVwjHw8G05SICa4C5Nj8u
   n6pae5tkCdhWYeB1bM8ngZujrsLkU7hl+djZQtNP+Y9283SZuFiMYjmV1
   w==;
X-CSE-ConnectionGUID: CJBSd7nnRfu8dtZ8x9A4HA==
X-CSE-MsgGUID: 4iLyGbHOQhyJIIzBcBN3kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002220"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:03 -0700
X-CSE-ConnectionGUID: DD2unR5/TQ+MbIfD61QlFg==
X-CSE-MsgGUID: yEj+wh9sQ1OGJKcqtw3Zig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902936"
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
Subject: [RFC PATCH V2 13/13] perf/x86/intel: Enable PERF_PMU_CAP_SIMD_REGS
Date: Thu, 26 Jun 2025 12:56:10 -0700
Message-Id: <20250626195610.405379-14-kan.liang@linux.intel.com>
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

Enable PERF_PMU_CAP_SIMD_REGS if there is XSAVES support for YMM, ZMM,
OPMASK, eGPRs, or SSP.

Disable large PEBS for these registers since PEBS HW doesn't support
them yet.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/core.c | 46 ++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index c73c2e57d71b..8dc638f9efd2 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4034,8 +4034,30 @@ static unsigned long intel_pmu_large_pebs_flags(struct perf_event *event)
 		flags &= ~PERF_SAMPLE_TIME;
 	if (!event->attr.exclude_kernel)
 		flags &= ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_user & ~PEBS_GP_REGS)
-		flags &= ~(PERF_SAMPLE_REGS_USER | PERF_SAMPLE_REGS_INTR);
+	if (event->attr.sample_simd_regs_enabled) {
+		u64 nolarge = PERF_X86_EGPRS_MASK | BIT_ULL(PERF_REG_X86_SSP);
+
+		/*
+		 * PEBS HW can only collect the XMM0-XMM15 for now.
+		 * Disable large PEBS for other vector registers, predicate
+		 * registers, eGPRs, and SSP.
+		 */
+		if (event->attr.sample_regs_user & nolarge ||
+		    fls64(event->attr.sample_simd_vec_reg_user) > PERF_X86_H16ZMM_BASE ||
+		    event->attr.sample_simd_pred_reg_user)
+			flags &= ~PERF_SAMPLE_REGS_USER;
+
+		if (event->attr.sample_regs_intr & nolarge ||
+		    fls64(event->attr.sample_simd_vec_reg_intr) > PERF_X86_H16ZMM_BASE ||
+		    event->attr.sample_simd_pred_reg_intr)
+			flags &= ~PERF_SAMPLE_REGS_INTR;
+
+		if (event->attr.sample_simd_vec_reg_qwords > PERF_X86_XMM_QWORDS)
+			flags &= ~(PERF_SAMPLE_REGS_USER | PERF_SAMPLE_REGS_INTR);
+	} else {
+		if (event->attr.sample_regs_user & ~PEBS_GP_REGS)
+			flags &= ~(PERF_SAMPLE_REGS_USER | PERF_SAMPLE_REGS_INTR);
+	}
 	return flags;
 }
 
@@ -5296,6 +5318,26 @@ static void intel_extended_regs_init(struct pmu *pmu)
 
 	x86_pmu.ext_regs_mask |= X86_EXT_REGS_XMM;
 	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_EXTENDED_REGS;
+
+	if (boot_cpu_has(X86_FEATURE_AVX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_YMM, NULL))
+		x86_pmu.ext_regs_mask |= X86_EXT_REGS_YMM;
+	if (boot_cpu_has(X86_FEATURE_APX) &&
+	    cpu_has_xfeatures(XFEATURE_MASK_APX, NULL))
+		x86_pmu.ext_regs_mask |= X86_EXT_REGS_EGPRS;
+	if (boot_cpu_has(X86_FEATURE_AVX512F)) {
+		if (cpu_has_xfeatures(XFEATURE_MASK_OPMASK, NULL))
+			x86_pmu.ext_regs_mask |= X86_EXT_REGS_OPMASK;
+		if (cpu_has_xfeatures(XFEATURE_MASK_ZMM_Hi256, NULL))
+			x86_pmu.ext_regs_mask |= X86_EXT_REGS_ZMMH;
+		if (cpu_has_xfeatures(XFEATURE_MASK_Hi16_ZMM, NULL))
+			x86_pmu.ext_regs_mask |= X86_EXT_REGS_H16ZMM;
+	}
+	if (cpu_feature_enabled(X86_FEATURE_USER_SHSTK))
+		x86_pmu.ext_regs_mask |= X86_EXT_REGS_CET;
+
+	if (x86_pmu.ext_regs_mask != X86_EXT_REGS_XMM)
+		x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_SIMD_REGS;
 }
 
 static void update_pmu_cap(struct pmu *pmu)
-- 
2.38.1

