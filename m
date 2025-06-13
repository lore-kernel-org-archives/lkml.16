Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6CF2DD01C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822624; cv=none; b=HDILAxaNeGPMLhYwS5ypPHoUHh+KxVG/iO0g+pZCPxPjeMmcLr4KQ+evbimus0B8Em0nfgBWEQ8v36SDUItX/sH0MH6zYL47Sy/GxCLqCH2nha4ChAhYRJTFbrXw4H6+Zi2eHyYzYlO5/GnfFS83dJE7/41ps1rAovxP7S203zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822624; c=relaxed/simple;
	bh=mU88CWHtDu//LZsdO+tWz83VbPYcuTZ7x11tBe3CCpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VIhgSkMGR96Pops+cZcpeJ65nASP6Kzm5uX/VGMkH6Nf3KsP6x+LG0xKCHj5SHLbNSbt1KftXaA0d2+UdK5sw4SJnSQ6YVLDXxridNod8t8AUgLSetr87oD77fww4/rcDXB9GA1khx4C1uZZYG3LgFBgiVvFUu2xycsouxNJVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsTIT/CK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsTIT/CK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822623; x=1781358623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mU88CWHtDu//LZsdO+tWz83VbPYcuTZ7x11tBe3CCpg=;
  b=JsTIT/CKD2R0D16epLR5FpIQJ3hvHA1/C1yqSDQEv4k5nfK/cNbBYG4S
   T1IwJNcOaREcZSvAfzE0XFRNhFUmStUR812Agpqrczu5na6yO280UHlP6
   fVldrQ0xONmL+e4GkD+F91gCyYl/h6gynrNY/Z0oRVF+MUlLPgL5ulhN1
   EABevhE5to8MlrioKsARFtv04ftcboWCFb/ICG1PDDVpsRRwR4YFqs63w
   aQUuBTp+HK9JYd0fDJGfUZ06Zg+BbrheSBNwbN/vAWvsrfpIcJZRkr9qd
   xsr+FSDepVwpggiCBoIqJYyU3n9sjZaFom2Yxc3/pkZsNLyRYAHu4hAzI
   Q==;
X-CSE-ConnectionGUID: YBvxbNTLSECo1v6uBENnpQ==
X-CSE-MsgGUID: OXCg5x92Toa8UEo3MT8NaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837612"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:22 -0700
X-CSE-ConnectionGUID: YH6MdUXZRcSdOYOUbNO+NQ==
X-CSE-MsgGUID: PB8h9Q70TW6uscrRdte8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017640"
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
Subject: [RFC PATCH 10/12] perf/x86: Add ZMM in extended regs
Date: Fri, 13 Jun 2025 06:49:41 -0700
Message-Id: <20250613134943.3186517-11-kan.liang@linux.intel.com>
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

Support ZMM as the extended registers. It can be configured in the
sample_ext_regs_intr/user.

Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
The value can be retrieved via the XSAVES.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c                | 14 +++++++++
 arch/x86/events/perf_event.h          | 11 ++++++-
 arch/x86/include/asm/perf_event.h     |  2 ++
 arch/x86/include/uapi/asm/perf_regs.h | 43 +++++++++++++++++++++++++--
 arch/x86/kernel/perf_regs.c           | 10 +++++++
 5 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 741e6dfd50a5..9bcef9a32dd2 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -437,6 +437,10 @@ static void x86_pmu_get_ext_regs(struct x86_perf_regs *perf_regs, u64 mask)
 	__x86_pmu_get_regs(XFEATURE_MASK_YMM, perf_regs->ymmh_regs, XSAVE_YMM_SIZE);
 	__x86_pmu_get_regs(XFEATURE_MASK_APX, perf_regs->apx_regs, sizeof(struct apx_state));
 	__x86_pmu_get_regs(XFEATURE_MASK_OPMASK, perf_regs->opmask_regs, sizeof(struct avx_512_opmask_state));
+	__x86_pmu_get_regs(XFEATURE_MASK_ZMM_Hi256, perf_regs->zmmh_regs,
+			   sizeof(struct avx_512_zmm_uppers_state));
+	__x86_pmu_get_regs(XFEATURE_MASK_Hi16_ZMM, perf_regs->h16zmm_regs,
+			   sizeof(struct avx_512_hi16_state));
 }
 
 static void release_ext_regs_buffers(void)
@@ -468,6 +472,10 @@ static void reserve_ext_regs_buffers(void)
 		size += sizeof(struct apx_state);
 	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_OPMASK))
 		size += sizeof(struct avx_512_opmask_state);
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_ZMMH))
+		size += sizeof(struct avx_512_zmm_uppers_state);
+	if (x86_pmu.ext_regs_mask & BIT_ULL(X86_EXT_REGS_H16ZMM))
+		size += sizeof(struct avx_512_hi16_state);
 
 	/* XSAVE feature requires 64-byte alignment. */
 	size += 64;
@@ -747,6 +755,8 @@ int x86_pmu_hw_config(struct perf_event *event)
 			check_ext_regs(X86_EXT_REGS_YMM);
 			check_ext_regs(X86_EXT_REGS_APX);
 			check_ext_regs(X86_EXT_REGS_OPMASK);
+			check_ext_regs(X86_EXT_REGS_ZMMH);
+			check_ext_regs(X86_EXT_REGS_H16ZMM);
 		}
 	}
 	return x86_setup_perfctr(event);
@@ -1852,6 +1862,10 @@ void x86_pmu_setup_regs_data(struct perf_event *event,
 			   XFEATURE_MASK_APX, PERF_X86_EXT_REG_APX_SIZE);
 	init_ext_regs_data(X86_EXT_REGS_OPMASK, perf_regs->opmask_regs,
 			   XFEATURE_MASK_OPMASK, PERF_X86_EXT_REG_OPMASK_SIZE);
+	init_ext_regs_data(X86_EXT_REGS_ZMMH, perf_regs->zmmh_regs,
+			   XFEATURE_MASK_ZMM_Hi256, PERF_X86_EXT_REG_ZMMH_SIZE);
+	init_ext_regs_data(X86_EXT_REGS_H16ZMM, perf_regs->h16zmm_regs,
+			   XFEATURE_MASK_Hi16_ZMM, PERF_X86_EXT_REG_H16ZMM_SIZE);
 
 	mask &= ~ignore_mask;
 	if (mask)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index c2626dcea1a0..93a65c529afe 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -692,6 +692,8 @@ enum {
 	X86_EXT_REGS_YMM,
 	X86_EXT_REGS_APX,
 	X86_EXT_REGS_OPMASK,
+	X86_EXT_REGS_ZMMH,
+	X86_EXT_REGS_H16ZMM,
 };
 
 #define PERF_PEBS_DATA_SOURCE_MAX	0x100
@@ -1324,7 +1326,7 @@ static inline u64 x86_pmu_get_event_config(struct perf_event *event)
 
 static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
 {
-	u64 mask;
+	u64 mask, mask2;
 
 	switch (type) {
 	case X86_EXT_REGS_YMM:
@@ -1336,6 +1338,13 @@ static inline int get_num_ext_regs(u64 *ext_regs, unsigned int type)
 	case X86_EXT_REGS_OPMASK:
 		mask = GENMASK_ULL(PERF_REG_X86_OPMASK7, PERF_REG_X86_OPMASK0);
 		return hweight64(ext_regs[0] & mask);
+	case X86_EXT_REGS_ZMMH:
+		mask = GENMASK_ULL(PERF_REG_X86_ZMMH15, PERF_REG_X86_ZMMH0);
+		return hweight64(ext_regs[0] & mask);
+	case X86_EXT_REGS_H16ZMM:
+		mask = GENMASK_ULL(PERF_REG_X86_EXT_REGS_64, PERF_REG_X86_ZMM16);
+		mask2 = GENMASK_ULL(PERF_REG_X86_ZMM31 - 64, 0);
+		return hweight64(ext_regs[0] & mask) + hweight64(ext_regs[1] & mask2);
 	default:
 		return 0;
 	}
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 4e971f38ff94..eb35ba9afbb4 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -596,6 +596,8 @@ struct x86_perf_regs {
 	u64		*ymmh_regs;
 	u64		*apx_regs;
 	u64		*opmask_regs;
+	u64		*zmmh_regs;
+	u64		*h16zmm_regs;
 };
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
index b9ec58b98c5e..c43a025b0c01 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -102,15 +102,54 @@ enum perf_event_x86_ext_regs {
 	PERF_REG_X86_OPMASK6,
 	PERF_REG_X86_OPMASK7,
 
-	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_OPMASK7,
+	/* ZMMH 0-15 Registers */
+	PERF_REG_X86_ZMMH0,
+	PERF_REG_X86_ZMMH1,
+	PERF_REG_X86_ZMMH2,
+	PERF_REG_X86_ZMMH3,
+	PERF_REG_X86_ZMMH4,
+	PERF_REG_X86_ZMMH5,
+	PERF_REG_X86_ZMMH6,
+	PERF_REG_X86_ZMMH7,
+	PERF_REG_X86_ZMMH8,
+	PERF_REG_X86_ZMMH9,
+	PERF_REG_X86_ZMMH10,
+	PERF_REG_X86_ZMMH11,
+	PERF_REG_X86_ZMMH12,
+	PERF_REG_X86_ZMMH13,
+	PERF_REG_X86_ZMMH14,
+	PERF_REG_X86_ZMMH15,
+
+	/* H16ZMM 16-31 Registers */
+	PERF_REG_X86_ZMM16,
+	PERF_REG_X86_ZMM17,
+	PERF_REG_X86_ZMM18,
+	PERF_REG_X86_ZMM19,
+	PERF_REG_X86_ZMM20,
+	PERF_REG_X86_ZMM21,
+	PERF_REG_X86_ZMM22,
+	PERF_REG_X86_ZMM23,
+	PERF_REG_X86_ZMM24,
+	PERF_REG_X86_ZMM25,
+	PERF_REG_X86_ZMM26,
+	PERF_REG_X86_ZMM27,
+	PERF_REG_X86_ZMM28,
+	PERF_REG_X86_ZMM29,
+	PERF_REG_X86_ZMM30,
+	PERF_REG_X86_ZMM31,
+
+	PERF_REG_X86_EXT_REGS_64 = PERF_REG_X86_ZMM23,
+	PERF_REG_X86_EXT_REGS_MAX = PERF_REG_X86_ZMM31,
 };
 
 enum perf_event_x86_ext_reg_size {
 	PERF_X86_EXT_REG_YMMH_SIZE	= 2,
 	PERF_X86_EXT_REG_APX_SIZE	= 1,
 	PERF_X86_EXT_REG_OPMASK_SIZE	= 1,
+	PERF_X86_EXT_REG_ZMMH_SIZE	= 4,
+	PERF_X86_EXT_REG_H16ZMM_SIZE	= 8,
 
 	/* max of PERF_REG_X86_XXX_SIZE */
-	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_YMMH_SIZE,
+	PERF_X86_EXT_REG_SIZE_MAX	= PERF_X86_EXT_REG_H16ZMM_SIZE,
 };
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 34b94b846f00..d5721ea85c5d 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -92,6 +92,16 @@ static u64 perf_ext_reg_value(struct pt_regs *regs, int idx,
 						    idx - PERF_REG_X86_OPMASK0,
 						    perf_regs->opmask_regs,
 						    PERF_X86_EXT_REG_OPMASK_SIZE);
+		case PERF_REG_X86_ZMMH0 ... PERF_REG_X86_ZMMH15:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_ZMMH0,
+						    perf_regs->zmmh_regs,
+						    PERF_X86_EXT_REG_ZMMH_SIZE);
+		case PERF_REG_X86_ZMM16 ... PERF_REG_X86_ZMM31:
+			return __perf_ext_reg_value(ext, ext_size,
+						    idx - PERF_REG_X86_ZMM16,
+						    perf_regs->h16zmm_regs,
+						    PERF_X86_EXT_REG_H16ZMM_SIZE);
 		default:
 			WARN_ON_ONCE(1);
 			*ext_size = 0;
-- 
2.38.1

