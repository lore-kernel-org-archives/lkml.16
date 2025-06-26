Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8C2ECE8E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967825; cv=none; b=cwY8dgGz6U0VDJJkVQEczHKHtbAy0ntrdNLKKOOQUfv+07Jo05p7Vu9LAAoYZghNsVziyOo4SIU38aqNL20FyGcI3c5MSIyCECL43RekcpRhRizzwbzPXQhDesBeJmfn5WrlopQ2uBoRxfYDHhTRpv3H9XVWAjbjpT6SWsVRvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967825; c=relaxed/simple;
	bh=bEBghAayTWVTiz8GLTNBDauW0F84HxRjwynMyY9tdQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hyovFGmdjKgXuVJi2jdi3iE10SDN6peX8zepFpJ9Vp7LIZ4IDKJK91pJdaY1jH8F8S99zFhMlOmAncBPyiuvKisrI5B0O18oRVG4hwXNBpBzt1rowwLJNDtwp7N413l5jcTvOFSYO5V7s1+LYyh4+Efq5PWQcpZ3UeCuY9W/DVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYBdmJAD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYBdmJAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750967823; x=1782503823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bEBghAayTWVTiz8GLTNBDauW0F84HxRjwynMyY9tdQE=;
  b=EYBdmJADH240zwZ7dcptHqzE6rdRMOWYF8q5/5OUqh1GCeSZtr8/c7j1
   wBG6ruWo25Jn5X3gQtCn5EGsYNlTR4PtUyhXROR1kVh1AFSps7f+h91IG
   EMrLZ+goNdHglw0YW5xhOI1DyVWh+vdtFtt23fgf9G1f16XDc1DNyYydm
   cZZSSXPpVsiNv5YjcaJLzII/95Ey1XnLHbSr/GWrNcs87CPkKzAU/OzbL
   hY9TPee+uFOrqBY3yOdT5SO9IGu8NncDxO383z4dqP2cIO/NObuAqTckw
   kd9X6m//SP58/r1FFTtB3+WreKe0njWTiZtcTihCwiXCO/m02Wsy3ORx+
   g==;
X-CSE-ConnectionGUID: RH6v7JFsSJWfyeixBBFLzQ==
X-CSE-MsgGUID: XEn/xBq8SVeYixDbFLNZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53002188"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53002188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 12:57:01 -0700
X-CSE-ConnectionGUID: BVwXKmUvRtazBhGxnLTC5Q==
X-CSE-MsgGUID: Wd1mSsTFR+eVsjfThy/6UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156902923"
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
Subject: [RFC PATCH V2 09/13] perf/x86: Add ZMM into sample_simd_vec_regs
Date: Thu, 26 Jun 2025 12:56:06 -0700
Message-Id: <20250626195610.405379-10-kan.liang@linux.intel.com>
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

The ZMM0-15 is composed of XMM, YMMH, and ZMMH. It requires 3 XSAVE
commands to get the complete value.
The ZMM16-31/YMM16-31/XMM16-31 are also supported, which only require
the XSAVE Hi16_ZMM.

Internally, the XMM, YMMH, ZMMH and Hi16_ZMM are stored in different
structures, which follow the XSAVE format. But the output dumps the ZMM
or Hi16 XMM/YMM/ZMM as a whole.

The qwords 8 imply ZMM.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 24 ++++++++++++++++++++++++
 arch/x86/events/perf_event.h          |  2 ++
 arch/x86/include/asm/perf_event.h     |  8 ++++++++
 arch/x86/include/uapi/asm/perf_regs.h |  8 ++++++--
 arch/x86/kernel/perf_regs.c           | 13 ++++++++++++-
 5 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 20c825e83a3f..3c05ca98ec3f 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -423,6 +423,10 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 
 	if (mask & XFEATURE_MASK_YMM)
 		perf_regs->ymmh = get_xsave_addr(xsave, XFEATURE_YMM);
+	if (mask & XFEATURE_MASK_ZMM_Hi256)
+		perf_regs->zmmh = get_xsave_addr(xsave, XFEATURE_ZMM_Hi256);
+	if (mask & XFEATURE_MASK_Hi16_ZMM)
+		perf_regs->h16zmm = get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
 }
 
 static void release_ext_regs_buffers(void)
@@ -451,6 +455,10 @@ static void reserve_ext_regs_buffers(void)
 		mask |= XFEATURE_MASK_SSE;
 	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_YMM)
 		mask |= XFEATURE_MASK_YMM;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_ZMMH)
+		mask |= XFEATURE_MASK_ZMM_Hi256;
+	if (x86_pmu.ext_regs_mask & X86_EXT_REGS_H16ZMM)
+		mask |= XFEATURE_MASK_Hi16_ZMM;
 
 	size = xstate_calculate_size(mask, true);
 
@@ -734,6 +742,13 @@ int x86_pmu_hw_config(struct perf_event *event)
 			if (event->attr.sample_simd_vec_reg_qwords >= PERF_X86_YMM_QWORDS &&
 			    !(x86_pmu.ext_regs_mask & X86_EXT_REGS_YMM))
 				return -EINVAL;
+			if (event->attr.sample_simd_vec_reg_qwords >= PERF_X86_ZMM_QWORDS &&
+			    !(x86_pmu.ext_regs_mask & X86_EXT_REGS_ZMMH))
+				return -EINVAL;
+			if ((fls64(event->attr.sample_simd_vec_reg_intr) > PERF_X86_H16ZMM_BASE ||
+			     fls64(event->attr.sample_simd_vec_reg_user) > PERF_X86_H16ZMM_BASE) &&
+			    !(x86_pmu.ext_regs_mask & X86_EXT_REGS_H16ZMM))
+				return -EINVAL;
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1851,6 +1866,15 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			perf_regs->ymmh_regs = NULL;
 			mask |= XFEATURE_MASK_YMM;
 		}
+		if (attr->sample_simd_vec_reg_qwords >= PERF_X86_ZMM_QWORDS) {
+			perf_regs->zmmh_regs = NULL;
+			mask |= XFEATURE_MASK_ZMM_Hi256;
+		}
+		if (fls64(attr->sample_simd_vec_reg_intr) > PERF_X86_H16ZMM_BASE ||
+		    fls64(attr->sample_simd_vec_reg_user) > PERF_X86_H16ZMM_BASE) {
+			perf_regs->h16zmm_regs = NULL;
+			mask |= XFEATURE_MASK_Hi16_ZMM;
+		}
 	}
 
 	mask &= ~ignore_mask;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 7d332d0247ed..cc42e9d3e13d 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -702,6 +702,8 @@ enum {
 enum {
 	X86_EXT_REGS_XMM	= BIT_ULL(0),
 	X86_EXT_REGS_YMM	= BIT_ULL(1),
+	X86_EXT_REGS_ZMMH	= BIT_ULL(2),
+	X86_EXT_REGS_H16ZMM	= BIT_ULL(3),
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 81e3143fd91a..2d78bd9649bd 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -601,6 +601,14 @@ struct x86_perf_regs {
 		u64	*ymmh_regs;
 		struct ymmh_struct *ymmh;
 	};
+	union {
+		u64	*zmmh_regs;
+		struct avx_512_zmm_uppers_state *zmmh;
+	};
+	union {
+		u64	*h16zmm_regs;
+		struct avx_512_hi16_state *h16zmm;
+	};
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index feb3e8f80761..f74e3ba65be2 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -55,12 +55,16 @@ enum perf_event_x86_regs {
 
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
 
-#define PERF_X86_SIMD_VEC_REGS_MAX	16
+#define PERF_X86_SIMD_VEC_REGS_MAX	32
 #define PERF_X86_SIMD_VEC_MASK		GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1, 0)
 
+#define PERF_X86_H16ZMM_BASE		16
+
 #define PERF_X86_XMM_QWORDS		2
 #define PERF_X86_YMM_QWORDS		4
 #define PERF_X86_YMMH_QWORDS		(PERF_X86_YMM_QWORDS / 2)
-#define PERF_X86_SIMD_QWORDS_MAX	PERF_X86_YMM_QWORDS
+#define PERF_X86_ZMM_QWORDS		8
+#define PERF_X86_ZMMH_QWORDS		(PERF_X86_ZMM_QWORDS / 2)
+#define PERF_X86_SIMD_QWORDS_MAX	PERF_X86_ZMM_QWORDS
 
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 37cf0a282915..74e05e2e5c90 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -89,6 +89,12 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			 qwords_idx >= PERF_X86_SIMD_QWORDS_MAX))
 		return 0;
 
+	if (idx >= PERF_X86_H16ZMM_BASE) {
+		if (!perf_regs->h16zmm_regs)
+			return 0;
+		return perf_regs->h16zmm_regs[idx * PERF_X86_ZMM_QWORDS + qwords_idx];
+	}
+
 	if (qwords_idx < PERF_X86_XMM_QWORDS) {
 		if (!perf_regs->xmm_regs)
 			return 0;
@@ -97,6 +103,10 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 		if (!perf_regs->ymmh_regs)
 			return 0;
 		return perf_regs->ymmh_regs[idx * PERF_X86_YMMH_QWORDS + qwords_idx - PERF_X86_XMM_QWORDS];
+	} else if (qwords_idx < PERF_X86_ZMM_QWORDS) {
+		if (!perf_regs->zmmh_regs)
+			return 0;
+		return perf_regs->zmmh_regs[idx * PERF_X86_ZMMH_QWORDS + qwords_idx - PERF_X86_YMM_QWORDS];
 	}
 
 	return 0;
@@ -114,7 +124,8 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 			return -EINVAL;
 	} else {
 		if (vec_qwords != PERF_X86_XMM_QWORDS &&
-		    vec_qwords != PERF_X86_YMM_QWORDS)
+		    vec_qwords != PERF_X86_YMM_QWORDS &&
+		    vec_qwords != PERF_X86_ZMM_QWORDS)
 			return -EINVAL;
 		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
 			return -EINVAL;
-- 
2.38.1

