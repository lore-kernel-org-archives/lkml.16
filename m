Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60022E00E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069258; cv=none; b=jtrszsOyBczifLLCQ7h6jzv/NxZpk8APTCOZ/+wyqzUoiU1IUnPgm78IY7Psm/RlSbIhmeAAmqMcRydzEQ3tLdRoMgr9I4YNZHIiTBaHSwhNUyPCzQjr4ykrrJCkanHRoTTETriYMve8deHV4bpIhABy5FBpdYI0yekjL3CxuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069258; c=relaxed/simple;
	bh=D+/doTh4X9NPl3WJ6EQtZZeiH6Fnf/tvGghmhvlFsHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeX8EwyrRQ2+91hemFwXL8fTDHp37bmXQKCAeECKkBltnP/JERNok0/h/jza2DbRPgj9pORduNxZ0ndtGsXToobPMKH+Jw8uEbM5SiZlFxDLqv/vIC2MlQ/eciSIZ2xKEIBAsLa/JrrczHnE2uzdhUUDpBVPzfUb38YW8XTszQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFeb+SpB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFeb+SpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744069256; x=1775605256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D+/doTh4X9NPl3WJ6EQtZZeiH6Fnf/tvGghmhvlFsHA=;
  b=ZFeb+SpBTt1QNz9MAQCBn7nRyRsuaarquoT3sxt4pqoeQYXhvNpJnWfs
   AjZblcmV7vJlcRyJlAa6nzeH2ADrxPHAd8wSLQwZNZfTM5IS9yWAF7QCN
   OCP8GGpP+BF9a24Y6hbvQ/SnvkC4xCnStcMfglpPLzirekH6MONg+PgQc
   ZTtNfmSOh39c5LP9uLVfsRQ9xp6HP6dOrihYUQT1MaQT5S3qh9Hs+U3k+
   FIplAez2FAkkIz8hPeX0eorpc4lNVVWW3laicl/97jV4/Ly7UZC7H6joA
   DcPBur8LONVbh5LGhXjgyEabYiET1eKmKf3CLX7erUigpo0eVkE2Jefbf
   A==;
X-CSE-ConnectionGUID: KajURoEKSh6QdPWP8+dJSw==
X-CSE-MsgGUID: axWj6mM8QXqiK4a38AWZig==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48193218"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="48193218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:52 -0700
X-CSE-ConnectionGUID: rlirKGB4RkqHYn8NPUQh8A==
X-CSE-MsgGUID: 20i26qUzTcSQGTPXoIylSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="165315491"
Received: from agluck-desk3.sc.intel.com ([172.25.222.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 16:40:51 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v3 14/26] x86/resctrl: Add first part of telemetry event enumeration
Date: Mon,  7 Apr 2025 16:40:16 -0700
Message-ID: <20250407234032.241215-15-tony.luck@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407234032.241215-1-tony.luck@intel.com>
References: <20250407234032.241215-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OOBMSM driver provides an interface to discover any RMID
based events for "energy" and "perf" classes.

Hold onto references to any pmt_feature_groups that resctrl
uses until resctrl exit.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h  |  8 ++++
 arch/x86/kernel/cpu/resctrl/core.c      |  5 ++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 62 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/Makefile    |  1 +
 4 files changed, 76 insertions(+)
 create mode 100644 arch/x86/kernel/cpu/resctrl/intel_aet.c

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 45eabc7919c6..70b63bbc429d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -172,4 +172,12 @@ void __init intel_rdt_mbm_apply_quirk(void);
 
 void rdt_domain_reconfigure_cdp(struct rdt_resource *r);
 
+#ifdef CONFIG_INTEL_AET_RESCTRL
+bool intel_aet_get_events(void);
+void __exit intel_aet_exit(void);
+#else
+static inline bool intel_aet_get_events(void) { return false; }
+static inline void intel_aet_exit(void) { };
+#endif
+
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index a066a9c54a1f..f0f256a5ac66 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -718,6 +718,9 @@ void resctrl_arch_mount(void)
 	if (only_once)
 		return;
 	only_once = true;
+
+	if (!intel_aet_get_events())
+		return;
 }
 
 enum {
@@ -1063,6 +1066,8 @@ late_initcall(resctrl_arch_late_init);
 
 static void __exit resctrl_arch_exit(void)
 {
+	intel_aet_exit();
+
 	cpuhp_remove_state(rdt_online);
 
 	resctrl_exit();
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
new file mode 100644
index 000000000000..8e531ad279b5
--- /dev/null
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Resource Director Technology(RDT)
+ * - Intel Application Energy Telemetry
+ *
+ * Copyright (C) 2025 Intel Corporation
+ *
+ * Author:
+ *    Tony Luck <tony.luck@intel.com>
+ */
+
+#define pr_fmt(fmt)   "resctrl: " fmt
+
+#include <linux/cpu.h>
+#include <linux/cleanup.h>
+#include "fake_intel_aet_features.h"
+#include <linux/intel_vsec.h>
+#include <linux/resctrl.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+static struct pmt_feature_group *feat_energy;
+static struct pmt_feature_group *feat_perf;
+
+DEFINE_FREE(intel_pmt_put_feature_group, struct pmt_feature_group *,	\
+	if (!IS_ERR_OR_NULL(_T))					\
+		intel_pmt_put_feature_group(_T))
+
+/*
+ * Ask OOBMSM discovery driver for all the RMID based telemetry groups
+ * that it supports.
+ */
+bool intel_aet_get_events(void)
+{
+	struct pmt_feature_group *p1 __free(intel_pmt_put_feature_group) = NULL;
+	struct pmt_feature_group *p2 __free(intel_pmt_put_feature_group) = NULL;
+	bool use_p1, use_p2;
+
+	p1 = intel_pmt_get_regions_by_feature(FEATURE_PER_RMID_ENERGY_TELEM);
+	p2 = intel_pmt_get_regions_by_feature(FEATURE_PER_RMID_PERF_TELEM);
+	use_p1 = !IS_ERR_OR_NULL(p1);
+	use_p2 = !IS_ERR_OR_NULL(p2);
+
+	if (!use_p1 && !use_p2)
+		return false;
+
+	if (use_p1)
+		feat_energy = no_free_ptr(p1);
+	if (use_p2)
+		feat_perf = no_free_ptr(p2);
+
+	return true;
+}
+
+void __exit intel_aet_exit(void)
+{
+	if (feat_energy)
+		intel_pmt_put_feature_group(feat_energy);
+	if (feat_perf)
+		intel_pmt_put_feature_group(feat_perf);
+}
diff --git a/arch/x86/kernel/cpu/resctrl/Makefile b/arch/x86/kernel/cpu/resctrl/Makefile
index c56d3acf8ac7..74c3b2333dde 100644
--- a/arch/x86/kernel/cpu/resctrl/Makefile
+++ b/arch/x86/kernel/cpu/resctrl/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= core.o rdtgroup.o monitor.o
 obj-$(CONFIG_X86_CPU_RESCTRL)		+= ctrlmondata.o
+obj-$(CONFIG_INTEL_AET_RESCTRL)		+= intel_aet.o
 obj-$(CONFIG_INTEL_AET_RESCTRL)		+= fake_intel_aet_features.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
-- 
2.48.1

