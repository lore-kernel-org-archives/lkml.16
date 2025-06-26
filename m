Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FB22F2360
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967824; cv=none; b=FfQhxr2e08c4Rb9/Z6MatZYnGaP024Kg2CUe5E2gY7hj5dD4xc1SbbyPsxS985b+C2mCFcXgCt02RzM6bAZnb/6ph+vHVTD7dZCKr7fn0J1Eign2ch34YezQ9BwGAkApvuzvUj1iUo81rnx1wC0/Uvo9fzHoQfK4PUw9kMwh/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967824; c=relaxed/simple;
	bh=ZxzlL/+/sTE7rS8L9N1ph6EFfIM8Tc5SpvtuIBJHoLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G7zg91Sg7wNwhAGsQcb9/0u4QngGoguoq1jCxlTrIUOZmVLvE2qcM/Ph096alyDoJ0ijAjBqs3vI56mXy5CONi9VbWZ1sM2wifyw06CEwTeN3QpwviayCsEfWrlAS/hPjMFAe/qYfQAfbRKvYSZlRdiHHvwZIqSUfJgsaqs2N18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6fTwYhz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6fTwYhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967823; x=1782503823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZxzlL/+/sTE7rS8L9N1ph6EFfIM8Tc5SpvtuIBJHoLQ=;
  b=I6fTwYhzusFtoYPlR4iNfA638Z31aCDgq+FmKTYGeVTzEEyeQQfbTGTY
   xnl9UO5nAwkuUBvzVwEYYIJjyyS/bmZb+Rt0/KS1rIHWup26YRPfS15Rb
   LJ/P0fg+dkKkzgvhj74l/FoPW5o5oLAcl+9fY524vEcj8Mbkwko3Nl6Ye
   k/CXCJGBaIv9JIl9fdrJJ9SwVybTVV5Udg/ltOwh42rGCWd0fmrBNYjhj
   Wcq3l+bxSSLx/VBAUh8974315hojv2ZWfwetzHO2djtjJoH0z9omqvKUJ
   yW7MKy8jAo+gKYbo5uoG08PnYIICAUGqK3uH5M9Ke/FKyw0ThpKuLtY7+
   A==;
X-CSE-ConnectionGUID: G1uGWbi4QUKlF5Z+MPYV0w==
X-CSE-MsgGUID: KTdLNBVhQLuuiWLQW204eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002180"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:01 -0700
X-CSE-ConnectionGUID: xmJi9pPzS4mmfryv91NG3w==
X-CSE-MsgGUID: x9aerAo3SjyOM9vNpeLQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902920"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 12:57:00 -0700
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
Subject: [RFC PATCH V2 08/13] perf/x86: Add YMM into sample_simd_vec_regs
Date: Thu, 26 Jun 2025 12:56:05 -0700
Message-Id: <20250626195610.405379-9-kan.liang@linux.intel.com>
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

The YMM0-15 is composed of XMM and YMMH. It requires 2 XSAVE commands to
get the complete value. Internally, the XMM and YMMH are stored in
different structures, which follow the XSAVE format. But the output
dumps the YMM as a whole.

The qwords 4 imply YMM.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 15 +++++++++++++++
 arch/x86/events/perf_event.h          |  1 +
 arch/x86/include/asm/perf_event.h     |  4 ++++
 arch/x86/include/uapi/asm/perf_regs.h |  4 +++-
 arch/x86/kernel/perf_regs.c           |  7 ++++++-
 5 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 2515179ac664..20c825e83a3f 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -420,6 +420,9 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 	if (mask & XFEATURE_MASK_SSE &&
 	    xsave->header.xfeatures & BIT_ULL(XFEATURE_SSE))
 		perf_regs->xmm_space = xsave->i387.xmm_space;
+
+	if (mask & XFEATURE_MASK_YMM)
+		perf_regs->ymmh = get_xsave_addr(xsave, XFEATURE_YMM);
 }
 
 static void release_ext_regs_buffers(void)
@@ -446,6 +449,8 @@ static void reserve_ext_regs_buffers(void)
 
 	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM)
 		mask |= XFEATURE_MASK_SSE;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_YMM)
+		mask |= XFEATURE_MASK_YMM;
 
 	size = xstate_calculate_size(mask, true);
 
@@ -726,6 +731,9 @@ int x86_pmu_hw_config(struct perf_event *event)
 			if (event->attr.sample_simd_vec_reg_qwords >= PERF_X86_XMM_QWORDS &&
 			    !(x86_pmu.ext_regs_mask & X86_EXT_REGS_XMM))
 				return -EINVAL;
+			if (event->attr.sample_simd_vec_reg_qwords >= PERF_X86_YMM_QWORDS &&
+			    !(x86_pmu.ext_regs_mask & X86_EXT_REGS_YMM))
+				return -EINVAL;
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1838,6 +1846,13 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 		mask |= XFEATURE_MASK_SSE;
 	}
 
+	if (attr->sample_simd_regs_enabled) {
+		if (attr->sample_simd_vec_reg_qwords >= PERF_X86_YMM_QWORDS) {
+			perf_regs->ymmh_regs = NULL;
+			mask |= XFEATURE_MASK_YMM;
+		}
+	}
+
 	mask &= ~ignore_mask;
 	if (mask)
 		x86_pmu_get_ext_regs(perf_regs, mask);
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 69964433a245..7d332d0247ed 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -701,6 +701,7 @@ enum {
 
 enum {
 	X86_EXT_REGS_XMM	= BIT_ULL(0),
+	X86_EXT_REGS_YMM	= BIT_ULL(1),
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 538219c59979..81e3143fd91a 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -597,6 +597,10 @@ struct x86_perf_regs {
 		u64	*xmm_regs;
 		u32	*xmm_space;	/* for xsaves */
 	};
+	union {
+		u64	*ymmh_regs;
+		struct ymmh_struct *ymmh;
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index bd8af802f757..feb3e8f80761 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -59,6 +59,8 @@ enum perf_event_x86_regs {
 #define PERF_X86_SIMD_VEC_MASK		GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1, 0)
 
 #define PERF_X86_XMM_QWORDS		2
-#define PERF_X86_SIMD_QWORDS_MAX	PERF_X86_XMM_QWORDS
+#define PERF_X86_YMM_QWORDS		4
+#define PERF_X86_YMMH_QWORDS		(PERF_X86_YMM_QWORDS / 2)
+#define PERF_X86_SIMD_QWORDS_MAX	PERF_X86_YMM_QWORDS
 
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 638b9e186c50..37cf0a282915 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -93,6 +93,10 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 		if (!perf_regs->xmm_regs)
 			return 0;
 		return perf_regs->xmm_regs[idx * PERF_X86_XMM_QWORDS + qwords_idx];
+	} else if (qwords_idx < PERF_X86_YMM_QWORDS) {
+		if (!perf_regs->ymmh_regs)
+			return 0;
+		return perf_regs->ymmh_regs[idx * PERF_X86_YMMH_QWORDS + qwords_idx - PERF_X86_XMM_QWORDS];
 	}
 
 	return 0;
@@ -109,7 +113,8 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 		if (vec_mask)
 			return -EINVAL;
 	} else {
-		if (vec_qwords != PERF_X86_XMM_QWORDS)
+		if (vec_qwords != PERF_X86_XMM_QWORDS &&
+		    vec_qwords != PERF_X86_YMM_QWORDS)
 			return -EINVAL;
 		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
 			return -EINVAL;
-- 
2.38.1

