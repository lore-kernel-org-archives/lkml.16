Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64CB2BF045
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822621; cv=none; b=P89POy0NDFvK3PE8nBKjzFKSJUvZUfZGIR7krWkeA+RCapSrOlSK+EZA5rkiLtupjPIlkDgYx8nfK1n4G9SfMqQz99FnvEq8KjGZvD/IR2Hyoh6tmGBKjpgm1Yxs74MRbdQYIJjc5L8CQAlRUZg5+gkyyUdf0ppWEfTsbz6NPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822621; c=relaxed/simple;
	bh=BA/eHJd6NHglezBenIsBKWPWT0Yq2OM6T/TxcLJstR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i3hTnyujXRpIIvAw0Wf4DQqyDY4+gh0cMIXx8LUKrAb2NjAeJekFe0PVCiHN17lK5DTb0Gu6uODwx33uCKsDBzR2ERzynERyXL8NmzkrQ92aIxbMZRcvr30ohvFPwtaR4fTpafxZ9dO9ZwD/2zFQG3eTJft949AURkpUT5mreeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmocuUvJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmocuUvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749822620; x=1781358620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BA/eHJd6NHglezBenIsBKWPWT0Yq2OM6T/TxcLJstR8=;
  b=XmocuUvJkhtT9bNF9twDSnPcKbVh/GmCV4qBnWxR5nsny1oy6Uk3O894
   mbLqfXSV2x+/j55KPaLvCmIMasSkqzN1fZQFGNL1+hilowm8U9I7kSA47
   d74cLI/S1nGatqQErf4dExGW1DhurVSrU8NjjoEtpUycqkAsOuo15OSkK
   ihCDDy/sVt5dii/RKc0XxWbiZLY2goEie5IFl2qWwX8ADZmCCo5B8Eqni
   O+lTAbh5Z/lGnF2UOAFSvpIKVuy8f+FVXlJ/gblkh857z8ajdxfCVQ67K
   wZTovlxwc9H41ie0CXJl2NQdQpPcEast9+WtTB3j90LuRrOlU78ClI/17
   g==;
X-CSE-ConnectionGUID: 2TdlMx/BTTiWGLanOSE1vA==
X-CSE-MsgGUID: eTXyR3n0T9+U5FijMefoMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55837584"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55837584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:50:19 -0700
X-CSE-ConnectionGUID: n0lFcdzlQPam4EJWBgUe8Q==
X-CSE-MsgGUID: vduRPPKHTMq3RZx59mL3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="171017621"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 06:50:19 -0700
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
Subject: [RFC PATCH 06/12] perf: Support extension of sample_regs
Date: Fri, 13 Jun 2025 06:49:37 -0700
Message-Id: <20250613134943.3186517-7-kan.liang@linux.intel.com>
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

More regs may be required in a sample, e.g., the vector registers. The
current sample_regs_XXX has run out of space.

Add sample_ext_regs_intr/user[2] in the struct perf_event_attr. It's used
as a bitmap for the extension regs. There will be more than 64 registers
added.
Add a new flag PERF_PMU_CAP_EXTENDED_REGS2 to indicate the PMU which
supports sample_ext_regs_intr/user.

Extend the perf_reg_validate() to support the validation of the
extension regs.

Extend the perf_reg_value() to retrieve the extension regs. The regs may
be larger than u64. Add two parameters to store the pointer and size.
Add a dedicated perf_output_sample_ext_regs() to dump the extension
regs.

This is just a generic support for the extension regs. Any attempts to
manipulate the extension regs will error out, until the driver-specific
supports are implemented, which will be done in the following patch.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/arm/kernel/perf_regs.c       |  9 +++--
 arch/arm64/kernel/perf_regs.c     |  9 +++--
 arch/csky/kernel/perf_regs.c      |  9 +++--
 arch/loongarch/kernel/perf_regs.c |  8 +++--
 arch/mips/kernel/perf_regs.c      |  9 +++--
 arch/powerpc/perf/perf_regs.c     |  9 +++--
 arch/riscv/kernel/perf_regs.c     |  8 +++--
 arch/s390/kernel/perf_regs.c      |  9 +++--
 arch/x86/kernel/perf_regs.c       | 13 ++++++--
 include/linux/perf_event.h        | 15 +++++++++
 include/linux/perf_regs.h         | 29 +++++++++++++---
 include/uapi/linux/perf_event.h   |  8 +++++
 kernel/events/core.c              | 55 ++++++++++++++++++++++++++++---
 13 files changed, 162 insertions(+), 28 deletions(-)

diff --git a/arch/arm/kernel/perf_regs.c b/arch/arm/kernel/perf_regs.c
index 0529f90395c9..b6161c30bd40 100644
--- a/arch/arm/kernel/perf_regs.c
+++ b/arch/arm/kernel/perf_regs.c
@@ -8,8 +8,10 @@
 #include <asm/perf_regs.h>
 #include <asm/ptrace.h>
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
 	if (WARN_ON_ONCE((u32)idx >= PERF_REG_ARM_MAX))
 		return 0;
 
@@ -18,8 +20,11 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 
 #define REG_RESERVED (~((1ULL << PERF_REG_ARM_MAX) - 1))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
+
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
 
diff --git a/arch/arm64/kernel/perf_regs.c b/arch/arm64/kernel/perf_regs.c
index b4eece3eb17d..668b54a7faf9 100644
--- a/arch/arm64/kernel/perf_regs.c
+++ b/arch/arm64/kernel/perf_regs.c
@@ -27,8 +27,10 @@ static u64 perf_ext_regs_value(int idx)
 	}
 }
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
 	if (WARN_ON_ONCE((u32)idx >= PERF_REG_ARM64_EXTENDED_MAX))
 		return 0;
 
@@ -77,10 +79,13 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 
 #define REG_RESERVED (~((1ULL << PERF_REG_ARM64_MAX) - 1))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
 	u64 reserved_mask = REG_RESERVED;
 
+	if (mask_ext)
+		return -EINVAL;
+
 	if (system_supports_sve())
 		reserved_mask &= ~(1ULL << PERF_REG_ARM64_VG);
 
diff --git a/arch/csky/kernel/perf_regs.c b/arch/csky/kernel/perf_regs.c
index 09b7f88a2d6a..5988ef55bf0a 100644
--- a/arch/csky/kernel/perf_regs.c
+++ b/arch/csky/kernel/perf_regs.c
@@ -8,8 +8,10 @@
 #include <asm/perf_regs.h>
 #include <asm/ptrace.h>
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
 	if (WARN_ON_ONCE((u32)idx >= PERF_REG_CSKY_MAX))
 		return 0;
 
@@ -18,8 +20,11 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 
 #define REG_RESERVED (~((1ULL << PERF_REG_CSKY_MAX) - 1))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
+
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
 
diff --git a/arch/loongarch/kernel/perf_regs.c b/arch/loongarch/kernel/perf_regs.c
index 263ac4ab5af6..798dadee75ff 100644
--- a/arch/loongarch/kernel/perf_regs.c
+++ b/arch/loongarch/kernel/perf_regs.c
@@ -25,8 +25,10 @@ u64 perf_reg_abi(struct task_struct *tsk)
 }
 #endif /* CONFIG_32BIT */
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask)
 		return -EINVAL;
 	if (mask & ~((1ull << PERF_REG_LOONGARCH_MAX) - 1))
@@ -34,8 +36,10 @@ int perf_reg_validate(u64 mask)
 	return 0;
 }
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
 	if (WARN_ON_ONCE((u32)idx >= PERF_REG_LOONGARCH_MAX))
 		return 0;
 
diff --git a/arch/mips/kernel/perf_regs.c b/arch/mips/kernel/perf_regs.c
index e686780d1647..f3fcbf7e5aa6 100644
--- a/arch/mips/kernel/perf_regs.c
+++ b/arch/mips/kernel/perf_regs.c
@@ -28,8 +28,10 @@ u64 perf_reg_abi(struct task_struct *tsk)
 }
 #endif /* CONFIG_32BIT */
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask)
 		return -EINVAL;
 	if (mask & ~((1ull << PERF_REG_MIPS_MAX) - 1))
@@ -37,10 +39,13 @@ int perf_reg_validate(u64 mask)
 	return 0;
 }
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
 	long v;
 
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
+
 	switch (idx) {
 	case PERF_REG_MIPS_PC:
 		v = regs->cp0_epc;
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index 350dccb0143c..556466409c76 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -99,8 +99,11 @@ static u64 get_ext_regs_value(int idx)
 	}
 }
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
+
 	if (idx == PERF_REG_POWERPC_SIER &&
 	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
 	    IS_ENABLED(CONFIG_PPC32) ||
@@ -125,8 +128,10 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return regs_get_register(regs, pt_regs_offset[idx]);
 }
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
 	return 0;
diff --git a/arch/riscv/kernel/perf_regs.c b/arch/riscv/kernel/perf_regs.c
index fd304a248de6..05a4f1e7b243 100644
--- a/arch/riscv/kernel/perf_regs.c
+++ b/arch/riscv/kernel/perf_regs.c
@@ -8,8 +8,10 @@
 #include <asm/perf_regs.h>
 #include <asm/ptrace.h>
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
 	if (WARN_ON_ONCE((u32)idx >= PERF_REG_RISCV_MAX))
 		return 0;
 
@@ -18,8 +20,10 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 
 #define REG_RESERVED (~((1ULL << PERF_REG_RISCV_MAX) - 1))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
 
diff --git a/arch/s390/kernel/perf_regs.c b/arch/s390/kernel/perf_regs.c
index a6b058ee4a36..2e17ae51279e 100644
--- a/arch/s390/kernel/perf_regs.c
+++ b/arch/s390/kernel/perf_regs.c
@@ -7,10 +7,13 @@
 #include <asm/ptrace.h>
 #include <asm/fpu.h>
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
 	freg_t fp;
 
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
+
 	if (idx >= PERF_REG_S390_R0 && idx <= PERF_REG_S390_R15)
 		return regs->gprs[idx];
 
@@ -34,8 +37,10 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 
 #define REG_RESERVED (~((1UL << PERF_REG_S390_MAX) - 1))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask || mask & REG_RESERVED)
 		return -EINVAL;
 
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 624703af80a1..b9d5106afc26 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -57,10 +57,13 @@ static unsigned int pt_regs_offset[PERF_REG_X86_MAX] = {
 #endif
 };
 
-u64 perf_reg_value(struct pt_regs *regs, int idx)
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
 	struct x86_perf_regs *perf_regs;
 
+	if (WARN_ON_ONCE(ext || ext_size))
+		return 0;
+
 	if (idx >= PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
 		perf_regs = container_of(regs, struct x86_perf_regs, regs);
 		if (!perf_regs->xmm_regs)
@@ -87,8 +90,10 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 		       (1ULL << PERF_REG_X86_R14) | \
 		       (1ULL << PERF_REG_X86_R15))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
 		return -EINVAL;
 
@@ -112,8 +117,10 @@ void perf_get_regs_user(struct perf_regs *regs_user,
 		       (1ULL << PERF_REG_X86_FS) | \
 		       (1ULL << PERF_REG_X86_GS))
 
-int perf_reg_validate(u64 mask)
+int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
+	if (mask_ext)
+		return -EINVAL;
 	if (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
 		return -EINVAL;
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 74c188a699e4..42b288ab4d2c 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -305,6 +305,7 @@ struct perf_event_pmu_context;
 #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
 #define PERF_PMU_CAP_AUX_PAUSE		0x0200
 #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
+#define PERF_PMU_CAP_EXTENDED_REGS2	0x0800 /* sample_ext_regs_intr/user */
 
 /**
  * pmu::scope
@@ -1496,6 +1497,20 @@ static inline bool event_has_extended_regs(struct perf_event *event)
 	       (attr->sample_regs_intr & PERF_REG_EXTENDED_MASK);
 }
 
+static inline bool event_has_extended_regs2(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+	int i;
+
+	for (i = 0; i < PERF_ATTR_EXT_REGS_SIZE; i++) {
+		if (attr->sample_ext_regs_intr[i] ||
+		    attr->sample_ext_regs_user[i])
+			return true;
+	}
+
+	return false;
+}
+
 static inline bool event_has_any_exclude_flag(struct perf_event *event)
 {
 	struct perf_event_attr *attr = &event->attr;
diff --git a/include/linux/perf_regs.h b/include/linux/perf_regs.h
index f632c5725f16..6119bcb010fb 100644
--- a/include/linux/perf_regs.h
+++ b/include/linux/perf_regs.h
@@ -16,23 +16,42 @@ struct perf_regs {
 #define PERF_REG_EXTENDED_MASK	0
 #endif
 
-u64 perf_reg_value(struct pt_regs *regs, int idx);
-int perf_reg_validate(u64 mask);
+#define PERF_EXT_REGS_SIZE_MAX	8
+
+/**
+ * perf_reg_value - Get a reg value
+ * @regs: The area where stores all registers
+ * @idx: The index of the request register.
+ *	 The below @ext indicates the index is for
+ *	 a regular register or an extension register.
+ * @ext: Pointer to the buffer which stores the
+ *	 value of the request extension register.
+ *	 NULL means request for a regular register.
+ * @ext_size: Size of the extension register.
+ *
+ * If it fails, 0 returns.
+ * If it succeeds, for a regular register (!ext),
+ * the value of the register returns.
+ * For an extension register (ext), ext[0] returns.
+ */
+u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size);
+int perf_reg_validate(u64 mask, u64 *mask_ext);
 u64 perf_reg_abi(struct task_struct *task);
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs);
 #else
 
 #define PERF_REG_EXTENDED_MASK	0
+#define PERF_EXT_REGS_SIZE_MAX	8
 
-static inline u64 perf_reg_value(struct pt_regs *regs, int idx)
+static inline u64 perf_reg_value(struct pt_regs *regs, int idx, u64 *ext, int *ext_size)
 {
 	return 0;
 }
 
-static inline int perf_reg_validate(u64 mask)
+static inline int perf_reg_validate(u64 mask, u64 *mask_ext)
 {
-	return mask ? -ENOSYS : 0;
+	return mask || mask_ext ? -ENOSYS : 0;
 }
 
 static inline u64 perf_reg_abi(struct task_struct *task)
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..e22ba72efcdb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,10 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_ext_regs_intr */
+							/* Add: sample_ext_regs_user */
+
+#define PERF_ATTR_EXT_REGS_SIZE			2
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +547,10 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+	/* extension of sample_regs_XXX */
+	__u64	sample_ext_regs_intr[PERF_ATTR_EXT_REGS_SIZE];
+	__u64	sample_ext_regs_user[PERF_ATTR_EXT_REGS_SIZE];
 };
 
 /*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7f0d98d73629..c4279e1bf91a 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7385,11 +7385,40 @@ perf_output_sample_regs(struct perf_output_handle *handle,
 	for_each_set_bit(bit, _mask, sizeof(mask) * BITS_PER_BYTE) {
 		u64 val;
 
-		val = perf_reg_value(regs, bit);
+		val = perf_reg_value(regs, bit, NULL, NULL);
 		perf_output_put(handle, val);
 	}
 }
 
+static void
+__perf_output_sample_ext_regs(struct perf_output_handle *handle,
+			      struct pt_regs *regs, u64 mask, int base)
+{
+	u64 val[PERF_EXT_REGS_SIZE_MAX];
+	int i, bit, size = 0;
+	DECLARE_BITMAP(_mask, 64);
+
+	if (!mask)
+		return;
+	bitmap_from_u64(_mask, mask);
+	for_each_set_bit(bit, _mask, sizeof(mask) * BITS_PER_BYTE) {
+		perf_reg_value(regs, bit + base, val, &size);
+
+		for (i = 0; i < size; i++)
+			perf_output_put(handle, val[i]);
+	}
+}
+
+static void
+perf_output_sample_ext_regs(struct perf_output_handle *handle,
+			    struct pt_regs *regs, u64 *mask)
+{
+	int i;
+
+	for (i = 0; i < PERF_ATTR_EXT_REGS_SIZE; i++)
+		__perf_output_sample_ext_regs(handle, regs, mask[i], i * 64);
+}
+
 static void perf_sample_regs_user(struct perf_regs *regs_user,
 				  struct pt_regs *regs)
 {
@@ -7940,9 +7969,14 @@ void perf_output_sample(struct perf_output_handle *handle,
 
 		if (abi) {
 			u64 mask = event->attr.sample_regs_user;
+			u64 *ext_mask = event->attr.sample_ext_regs_user;
+
 			perf_output_sample_regs(handle,
 						data->regs_user.regs,
 						mask);
+			perf_output_sample_ext_regs(handle,
+						    data->regs_user.regs,
+						    ext_mask);
 		}
 	}
 
@@ -7971,10 +8005,14 @@ void perf_output_sample(struct perf_output_handle *handle,
 
 		if (abi) {
 			u64 mask = event->attr.sample_regs_intr;
+			u64 *ext_mask = event->attr.sample_ext_regs_intr;
 
 			perf_output_sample_regs(handle,
 						data->regs_intr.regs,
 						mask);
+			perf_output_sample_ext_regs(handle,
+						    data->regs_intr.regs,
+						    ext_mask);
 		}
 	}
 
@@ -12535,6 +12573,12 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 	if (ret)
 		goto err_pmu;
 
+	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS2) &&
+	    event_has_extended_regs2(event)) {
+		ret = -EOPNOTSUPP;
+		goto err_destroy;
+	}
+
 	if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
 	    event_has_extended_regs(event)) {
 		ret = -EOPNOTSUPP;
@@ -13073,7 +13117,8 @@ static int perf_copy_attr(struct perf_event_attr __user *uattr,
 	}
 
 	if (attr->sample_type & PERF_SAMPLE_REGS_USER) {
-		ret = perf_reg_validate(attr->sample_regs_user);
+		ret = perf_reg_validate(attr->sample_regs_user,
+					attr->sample_ext_regs_user);
 		if (ret)
 			return ret;
 	}
@@ -13096,8 +13141,10 @@ static int perf_copy_attr(struct perf_event_attr __user *uattr,
 	if (!attr->sample_max_stack)
 		attr->sample_max_stack = sysctl_perf_event_max_stack;
 
-	if (attr->sample_type & PERF_SAMPLE_REGS_INTR)
-		ret = perf_reg_validate(attr->sample_regs_intr);
+	if (attr->sample_type & PERF_SAMPLE_REGS_INTR) {
+		ret = perf_reg_validate(attr->sample_regs_intr,
+					attr->sample_ext_regs_intr);
+	}
 
 #ifndef CONFIG_CGROUP_PERF
 	if (attr->sample_type & PERF_SAMPLE_CGROUP)
-- 
2.38.1

