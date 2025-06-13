Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CA2DD033
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822625; cv=none; b=hzHMD/PwJFQAPBLPDf9D6jHa5uX3n+JFdQnNRoU7ZkvISh5G+KgyyRzDoaLxzHMYUrin6jn90tnSy/kzES0zVCFOBy0k7UQjjrUIj59k+3gYWyVxj1599/MwiAyWAcdQB5TqPugJXanP0U2UeyriRU0Wr860+h+E3QtIVmjvP9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822625; c=relaxed/simple;
	bh=4viLqFODhQf/6D3o1l5DdfiONj6oYIcsCzeLhTNucF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jaW4dqqqrbyd/CCOCXpjUQ2Sv/QgEIvEEi9aU31qG7Sr13d20BaGeBJ8PD8QHwJe2QYIbwiXaxLG7toMsYCpIm8/5xTidlclD3NCSu1fGXuHad+kJ5BKGIvBNQve/ycu4o35uM/je7TCte63O6cY3KQfQSukBJPv2jmoxBMLW10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjYq2XMQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjYq2XMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822623; x=1781358623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4viLqFODhQf/6D3o1l5DdfiONj6oYIcsCzeLhTNucF8=;
  b=cjYq2XMQtZg3avOjjkTQljWsOihUTZbtnr2jEuNWh5rdWqR6cG4fD3+p
   V90EPJQpreYt60Nt1W1CzJp7F0KapkIUVWpuI7jlkdBxsi1InAfIymHRY
   zZPGuZMCkM8RWjF90RE+WF36LZmkfW2YEMGXLrrRfCrp9qGUHJiPvHsCX
   10waeyU/4LgPHXJhO7L5EOm4wXMVXr/678vIhs1oTG8iDqwmQvsAkoNpd
   l7LR0270SFxSTW7pVQv1r2JcOlf0IA6IWt39R3GLT9Mg+aY4ekcuXiPwt
   JvDAbudVpEusfXwb5r4ekxBCOUM+9WM+DQSk934vW2I50NuqKjd5aFQpb
   A==;
X-CSE-ConnectionGUID: bh/thB2AT2eKS8g0xDjaUA==
X-CSE-MsgGUID: dcfVfDvDRNmrz6f639LjJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837620"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:23 -0700
X-CSE-ConnectionGUID: +50EwHsYRn2G1SOHDjiPOQ==
X-CSE-MsgGUID: KKen9iRQTr+CV+8ZmAZcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017646"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:23 -0700
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
Subject: [RFC PATCH 11/12] perf/x86: Add SSP in extended regs
Date: Fri, 13 Jun 2025 06:49:42 -0700
Message-Id: <20250613134943.3186517-12-kan.liang@linux.intel.com>
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

Support SSP as the extended registers. It can be configured in the
sample_ext_regs_intr/user.

Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
The value can be retrieved via the XSAVES.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 7 +++++++
 arch/x86/events/perf_event.h          | 5 +++++
 arch/x86/include/asm/perf_event.h     | 1 +
 arch/x86/include/uapi/asm/perf_regs.h | 6 +++++-
 arch/x86/kernel/perf_regs.c           | 5 +++++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9bcef9a32dd2..65e4460fdc28 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -441,6 +441,8 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 			   sizeof(struct avx_512_zmm_uppers_state));
 	__x86_pmu_get_regs(XFEATURE_MASK_Hi16_ZMM, perf_regs->h16zmm_regs,
 			   sizeof(struct avx_512_hi16_state));
+	__x86_pmu_get_regs(XFEATURE_MASK_CET_USER, perf_regs->cet_regs,
+			   sizeof(struct cet_user_state));
 }
 
 static void release_ext_regs_buffers(void)
@@ -476,6 +478,8 @@ static void reserve_ext_regs_buffers(void)
 		size += sizeof(struct avx_512_zmm_uppers_state);
 	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_H16ZMM))
 		size += sizeof(struct avx_512_hi16_state);
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_CET))
+		size += sizeof(struct cet_user_state);
 
 	/* XSAVE feature requires 64-byte alignment. */
 	size += 64;
@@ -757,6 +761,7 @@ int x86_pmu_hw_config(struct perf_event *event)
 			check_ext_regs(X86_EXT_REGS_OPMASK);
 			check_ext_regs(X86_EXT_REGS_ZMMH);
 			check_ext_regs(X86_EXT_REGS_H16ZMM);
+			check_ext_regs(X86_EXT_REGS_CET);
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1866,6 +1871,8 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			   XFEATURE_MASK_ZMM_Hi256, PERF_X86_EXT_REG_ZMMH_SIZE);
 	init_ext_regs_data(X86_EXT_REGS_H16ZMM, perf_regs->h16zmm_regs,
 			   XFEATURE_MASK_Hi16_ZMM, PERF_X86_EXT_REG_H16ZMM_SIZE);
+	init_ext_regs_data(X86_EXT_REGS_CET, perf_regs->cet_regs,
+			   XFEATURE_MASK_CET_USER, PERF_X86_EXT_REG_SSP_SIZE);
 
 	mask &= ~ignore_mask;
 	if (mask)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 93a65c529afe..e4906c0b33da 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -694,6 +694,7 @@ enum {
 	X86_EXT_REGS_OPMASK,
 	X86_EXT_REGS_ZMMH,
 	X86_EXT_REGS_H16ZMM,
+	X86_EXT_REGS_CET,
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
@@ -1345,6 +1346,10 @@ static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
 		mask = GENMASK_ULL(PERF_REG_X86_EXT_REGS_64, PERF_REG_X86_ZMM16);
 		mask2 = GENMASK_ULL(PERF_REG_X86_ZMM31 - 64, 0);
 		return hweight64(ext_regs[0] & mask) + hweight64(ext_regs[1] & mask2);
+	case X86_EXT_REGS_CET:
+		if (ext_regs[1] & BIT_ULL(PERF_REG_X86_SSP - 64))
+			return 1;
+		return 0;
 	default:
 		return 0;
 	}
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index eb35ba9afbb4..e49a26886e64 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -598,6 +598,7 @@ struct x86_perf_regs {
 	u64		*opmask_regs;
 	u64		*zmmh_regs;
 	u64		*h16zmm_regs;
+	u64		*cet_regs;
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index c43a025b0c01..82df5c65d701 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -138,8 +138,11 @@ enum perf_event_x86_ext_regs {
 	PERF_REG_X86_ZMM30,
 	PERF_REG_X86_ZMM31,
 
+	/* shadow stack pointer (SSP) */
+	PERF_REG_X86_SSP,
+
 	PERF_REG_X86_EXT_REGS_64 = PERF_REG_X86_ZMM23,
-	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_ZMM31,
+	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_SSP,
 };
 
 enum perf_event_x86_ext_reg_size {
@@ -148,6 +151,7 @@ enum perf_event_x86_ext_reg_size {
 	PERF_X86_EXT_REG_OPMASK_SIZE	= 1,
 	PERF_X86_EXT_REG_ZMMH_SIZE	= 4,
 	PERF_X86_EXT_REG_H16ZMM_SIZE	= 8,
+	PERF_X86_EXT_REG_SSP_SIZE	= 1,
 
 	/* max of PERF_REG_X86_XXX_SIZE */
 	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_H16ZMM_SIZE,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index d5721ea85c5d..6a5936ed7143 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -102,6 +102,11 @@ static u64 perf_ext_reg_value(struct pt_regs *regs, int idx,
 						    idx - PERF_REG_X86_ZMM16,
 						    perf_regs->h16zmm_regs,
 						    PERF_X86_EXT_REG_H16ZMM_SIZE);
+		case PERF_REG_X86_SSP:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_SSP,
+						    &perf_regs->cet_regs[1],
+						    PERF_X86_EXT_REG_SSP_SIZE);
 		default:
 			WARN_ON_ONCE(1);
 			*ext_size = 0;
-- 
2.38.1

