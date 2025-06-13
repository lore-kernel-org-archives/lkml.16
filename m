Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9A2DD00B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822623; cv=none; b=DOvJcHBODSyPw8AK1sB4gUk7fgJf2go+/ghzFECPuYqVA0Q0GdE1hvkbqH3GRAfiNeqpJ4kcchJgb9o9NR5AWk3aYs2SosJY0C9OAtNIsLgEDCe0a++FuBeGrOEKs8qZ4FydpHJ/lwaszj+qt98Dj8pZB98KmU3hzkEHybUaE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822623; c=relaxed/simple;
	bh=2ZZQQW+13o2rsahnzuLYhSsOMSGkVM3SbB+MIh08WAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d4TFOdKxj+Y69xppAqMabsNskRONSAhWEGWhkj6Mkjn41ojJXZFgfPTEJlbnrJt68LMAvkl3tjNMPYFiWlxLCB132cBEzX+A8WBljJqf1FUotZUlanKHuSGaAmdyVqNHwKUNMCKK3y3obDZ2KCV64gKaqY85igo847pfBLREQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqjqb37K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqjqb37K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822622; x=1781358622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ZZQQW+13o2rsahnzuLYhSsOMSGkVM3SbB+MIh08WAc=;
  b=bqjqb37KgLdUifnOqcZ779ACv4dbO7ssX0pxJ5XGfcwsE/Cb2JtixK7w
   zb0QSadkHLTI9eTKHvXTqrBIPP4jXZ82rvA4hVq/2SWL8VJyOyov0S/SX
   C4dEDXqJOLFwjpNLcF+RG8CE46G4BX7aT82mMJUm+RZAhOuXTStdxeU5j
   EwOYXyD2yFBfHQsMThzaZ9gZbK5M/+tXTuxJIBsrTo6Ql9YTN6NAVDdiT
   1yiPbxLglEJM816WGtx2VhZCHv/bLKJJjnQOQnzqcUf/FsKlsXzQpb43F
   kdN73QOAt5B5qAuIQERRV8PPVEYZHn0LU1nCH5B7dIkP18/SI/F+mWv6q
   w==;
X-CSE-ConnectionGUID: lt8SkZCqTeyEPZmnqBBFSg==
X-CSE-MsgGUID: sFcxmd0CSmGsWdvVsDWo3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837606"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:22 -0700
X-CSE-ConnectionGUID: Ew5AqW2mS2SzOHQ24eBDRw==
X-CSE-MsgGUID: hqPSGureSN25PkXNaAFzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017635"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:22 -0700
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
Subject: [RFC PATCH 09/12] perf/x86: Add OPMASK in extended regs
Date: Fri, 13 Jun 2025 06:49:40 -0700
Message-Id: <20250613134943.3186517-10-kan.liang@linux.intel.com>
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

Support OPMASK as the extended registers. It can be configured in the
sample_ext_regs_intr/user.

Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
The value can be retrieved via the XSAVES.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                |  6 ++++++
 arch/x86/events/perf_event.h          |  4 ++++
 arch/x86/include/asm/perf_event.h     |  1 +
 arch/x86/include/uapi/asm/perf_regs.h | 13 ++++++++++++-
 arch/x86/kernel/perf_regs.c           |  5 +++++
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 67f62268f063..741e6dfd50a5 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -436,6 +436,7 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 	/* The XSAVES instruction always uses the compacted format */
 	__x86_pmu_get_regs(XFEATURE_MASK_YMM, perf_regs->ymmh_regs, XSAVE_YMM_SIZE);
 	__x86_pmu_get_regs(XFEATURE_MASK_APX, perf_regs->apx_regs, sizeof(struct apx_state));
+	__x86_pmu_get_regs(XFEATURE_MASK_OPMASK, perf_regs->opmask_regs, sizeof(struct avx_512_opmask_state));
 }
 
 static void release_ext_regs_buffers(void)
@@ -465,6 +466,8 @@ static void reserve_ext_regs_buffers(void)
 		size += XSAVE_YMM_SIZE;
 	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_APX))
 		size += sizeof(struct apx_state);
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_OPMASK))
+		size += sizeof(struct avx_512_opmask_state);
 
 	/* XSAVE feature requires 64-byte alignment. */
 	size += 64;
@@ -743,6 +746,7 @@ int x86_pmu_hw_config(struct perf_event *event)
 				return -EINVAL;
 			check_ext_regs(X86_EXT_REGS_YMM);
 			check_ext_regs(X86_EXT_REGS_APX);
+			check_ext_regs(X86_EXT_REGS_OPMASK);
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1846,6 +1850,8 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			   XFEATURE_MASK_YMM, PERF_X86_EXT_REG_YMMH_SIZE);
 	init_ext_regs_data(X86_EXT_REGS_APX, perf_regs->apx_regs,
 			   XFEATURE_MASK_APX, PERF_X86_EXT_REG_APX_SIZE);
+	init_ext_regs_data(X86_EXT_REGS_OPMASK, perf_regs->opmask_regs,
+			   XFEATURE_MASK_OPMASK, PERF_X86_EXT_REG_OPMASK_SIZE);
 
 	mask &= ~ignore_mask;
 	if (mask)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 1c40b5d9c025..c2626dcea1a0 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -691,6 +691,7 @@ enum {
 	X86_EXT_REGS_XMM = 0,
 	X86_EXT_REGS_YMM,
 	X86_EXT_REGS_APX,
+	X86_EXT_REGS_OPMASK,
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
@@ -1332,6 +1333,9 @@ static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
 	case X86_EXT_REGS_APX:
 		mask = GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R16);
 		return hweight64(ext_regs[0] & mask);
+	case X86_EXT_REGS_OPMASK:
+		mask = GENMASK_ULL(PERF_REG_X86_OPMASK7, PERF_REG_X86_OPMASK0);
+		return hweight64(ext_regs[0] & mask);
 	default:
 		return 0;
 	}
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 9e4d60f3a9a2..4e971f38ff94 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -595,6 +595,7 @@ struct x86_perf_regs {
 	u64		*xmm_regs;
 	u64		*ymmh_regs;
 	u64		*apx_regs;
+	u64		*opmask_regs;
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index e23fb112faac..b9ec58b98c5e 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -92,12 +92,23 @@ enum perf_event_x86_ext_regs {
 	PERF_REG_X86_R30,
 	PERF_REG_X86_R31,
 
-	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_R31,
+	/* OPMASK Registers */
+	PERF_REG_X86_OPMASK0,
+	PERF_REG_X86_OPMASK1,
+	PERF_REG_X86_OPMASK2,
+	PERF_REG_X86_OPMASK3,
+	PERF_REG_X86_OPMASK4,
+	PERF_REG_X86_OPMASK5,
+	PERF_REG_X86_OPMASK6,
+	PERF_REG_X86_OPMASK7,
+
+	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_OPMASK7,
 };
 
 enum perf_event_x86_ext_reg_size {
 	PERF_X86_EXT_REG_YMMH_SIZE	= 2,
 	PERF_X86_EXT_REG_APX_SIZE	= 1,
+	PERF_X86_EXT_REG_OPMASK_SIZE	= 1,
 
 	/* max of PERF_REG_X86_XXX_SIZE */
 	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_YMMH_SIZE,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 518497bafdf0..34b94b846f00 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -87,6 +87,11 @@ static u64 perf_ext_reg_value(struct pt_regs *regs, int idx,
 						    idx - PERF_REG_X86_R16,
 						    perf_regs->apx_regs,
 						    PERF_X86_EXT_REG_APX_SIZE);
+		case PERF_REG_X86_OPMASK0 ... PERF_REG_X86_OPMASK7:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_OPMASK0,
+						    perf_regs->opmask_regs,
+						    PERF_X86_EXT_REG_OPMASK_SIZE);
 		default:
 			WARN_ON_ONCE(1);
 			*ext_size = 0;
-- 
2.38.1

