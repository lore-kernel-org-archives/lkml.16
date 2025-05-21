Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85DF24886F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867876; cv=none; b=LkVC0QuFLTXK5lwZGt/TGLSEjIieKpZqHx3N8Wgqv8V/Z9Ve5iPv0B0RVSsTIKtj4zShiLIKZaIxRRwqUWnsCulbTEaBWmeSkdgg737gHfR7TxuP+kHoHwFdOjtu4bDYHGNpblphdJa+pVBgixrGu5JmuBybo5PbuH+j3BqiKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867876; c=relaxed/simple;
	bh=JFDhcWFdpPeO9F/sP8unuhO2mLfulMtfa551HkDW0Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yy/w/IG/bH/Ccs9nUdcPRLnmFcZhRlbBXIpjYjre0/9iqSI8bfs8tJrVKq5Me8HjQv3IMo4lhFnYK9XvRtKIhrMbIOa7C2EtD0j15cA95/tkFo+/C6BrUH+LVKd00VDwO3Phrzc6RclgMBLasIqm1h8rNrT9xVuTw9hemFytgQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6uynKwa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6uynKwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867874; x=1779403874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JFDhcWFdpPeO9F/sP8unuhO2mLfulMtfa551HkDW0Ig=;
  b=b6uynKwa4rKgfanHzwyJ8fghY7sd1Vkrbg8MB856j4HKuAyMDKq18Xp/
   2CO4c1zVoE4ZMQ+3qJ84366AUsgLq+zjSGIMNiAs0gKuDr57Qwg7n5P7k
   g6Makjq0CrX7jcwKNXw8rPEO6PNDwq45uRDwRS/Q1yjjUsT8kOsXWdv4/
   KsY6EoT1+6k2Fz8O9jEgj4YNVvlg+nhI2X9IIYxE1Q2YQExeWIcY4C8kN
   aTWwCg154oUHjGHXfu/wiCDYqkrkxTjViy+RT1hnQ7bvo5255YKX/a+qw
   lVRKgj7mrsYTqU4g84urPldmmvPaYA6L1Ibc3JO1PpEyKQjtIZT0r8Mk3
   A==;
X-CSE-ConnectionGUID: xAJkestNQZqCsnQ4TL2p/g==
X-CSE-MsgGUID: RSPPNTGHTm6p9UymOazhvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53677831"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53677831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:51:00 -0700
X-CSE-ConnectionGUID: GnBbC+6+S2+xP7/Aur9XrA==
X-CSE-MsgGUID: wCPA3aTzR7+LZ57BImkWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141352200"
Received: from agluck-desk3.sc.intel.com ([172.25.103.51])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:59 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v5 25/29] x86/resctrl: Handle number of RMIDs supported by telemetry resources
Date: Wed, 21 May 2025 15:50:43 -0700
Message-ID: <20250521225049.132551-26-tony.luck@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521225049.132551-1-tony.luck@intel.com>
References: <20250521225049.132551-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are now three meanings for "number of RMIDs":

1) The number for legacy features enumerated by CPUID leaf 0xF. This
is the maximum number of distinct values that can be loaded into the
IA32_PQR_ASSOC MSR. Note that systems with Sub-NUMA Cluster mode enabled
will force scaling down the CPUID enumerated value by the number of SNC
nodes per L3-cache.

2) The number of registers in MMIO space for each event. This
is enumerated in the XML files and is the value initialized into
event_group::num_rmids. This will be overwritten with a lower
value if hardware does not support all these registers at the
same time (see next case).

3) The number of "h/w counters" (this isn't a strictly accurate
description of how things work, but serves as a useful analogy that
does describe the limitations) feeding to those MMIO registers. This
is enumerated in telemetry_region::num_rmids returned from the call to
intel_pmt_get_regions_by_feature()

Event groups with insufficient "h/w counter" to track all RMIDs are
difficult for users to use, since the system may reassign "h/w counters"
as any time. This means that users cannot reliably collect two consecutive
event counts to compute the rate at which events are occurring.

Ignore such under-resourced event groups unless the user explicitly
requests to enable them using the "rdt=" Linux boot argument.

Scan all enabled event groups and assign the RDT_RESOURCE_PERF_PKG
resource "num_rmids" value to the smallest of these values to ensure
that all resctrl groups have equal monitor capabilities.

N.B. Changed type of rdt_resource::num_rmids to u32 to match.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/resctrl.h                 |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h  |  2 ++
 arch/x86/kernel/cpu/resctrl/intel_aet.c | 27 +++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c   |  2 ++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 4ba51cb598e1..b7e15abcde23 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -286,7 +286,7 @@ struct rdt_resource {
 	int			rid;
 	bool			alloc_capable;
 	bool			mon_capable;
-	int			num_rmid;
+	u32			num_rmid;
 	enum resctrl_scope	ctrl_scope;
 	enum resctrl_scope	mon_scope;
 	struct resctrl_cache	cache;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 524f3c183900..795534b9b9d2 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -18,6 +18,8 @@
 
 #define RMID_VAL_UNAVAIL		BIT_ULL(62)
 
+extern int rdt_num_system_rmids;
+
 /*
  * With the above fields in use 62 bits remain in MSR_IA32_QM_CTR for
  * data to be returned. The counter width is discovered from the hardware
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
index c1fc85dbf0d8..1b41167ad976 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -14,6 +14,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
+#include <linux/minmax.h>
 #include <linux/resctrl.h>
 #include <linux/slab.h>
 
@@ -57,6 +58,9 @@ struct pmt_event {
  *			telemetry regions.
  * @pkginfo:		Per-package MMIO addresses of telemetry regions belonging to this group
  * @guid:		Unique number per XML description file.
+ * @num_rmids:		Number of RMIDS supported by this group. Will be adjusted downwards
+ *			if enumeration from intel_pmt_get_regions_by_feature() indicates
+ *			fewer RMIDs can be tracked simultaneously.
  * @mmio_size:		Number of bytes of MMIO registers for this group.
  * @num_events:		Number of events in this group.
  * @evts:		Array of event descriptors.
@@ -69,6 +73,7 @@ struct event_group {
 
 	/* Remaining fields initialized from XML file. */
 	u32				guid;
+	u32				num_rmids;
 	size_t				mmio_size;
 	int				num_events;
 	struct pmt_event		evts[] __counted_by(num_events);
@@ -81,6 +86,7 @@ struct event_group {
 static struct event_group energy_0x26696143 = {
 	.name		= "energy",
 	.guid		= 0x26696143,
+	.num_rmids	= 576,
 	.mmio_size	= (576 * 2 + 3) * 8,
 	.num_events	= 2,
 	.evts				= {
@@ -96,6 +102,7 @@ static struct event_group energy_0x26696143 = {
 static struct event_group perf_0x26557651 = {
 	.name		= "perf",
 	.guid		= 0x26557651,
+	.num_rmids	= 576,
 	.mmio_size	= (576 * 7 + 3) * 8,
 	.num_events	= 7,
 	.evts				= {
@@ -253,6 +260,15 @@ static bool get_pmt_feature(enum pmt_feature_id feature)
 			if ((*peg)->guid == p->regions[i].guid) {
 				if (rdt_is_option_force_disabled((*peg)->name))
 					return false;
+				/*
+				 * Ignore event group with insufficient RMIDs unless the
+				 * user used the rdt= boot option to specifically ask
+				 * for it to be enabled.
+				 */
+				if (p->regions[i].num_rmids < rdt_num_system_rmids &&
+				    !rdt_is_option_force_enabled((*peg)->name))
+					return false;
+				(*peg)->num_rmids = min((*peg)->num_rmids, p->regions[i].num_rmids);
 				ret = configure_events(*peg, p);
 				if (!ret) {
 					(*peg)->pfg = no_free_ptr(p);
@@ -272,11 +288,22 @@ static bool get_pmt_feature(enum pmt_feature_id feature)
  */
 bool intel_aet_get_events(void)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_PERF_PKG].r_resctrl;
+	struct event_group **eg;
 	bool ret1, ret2;
 
 	ret1 = get_pmt_feature(FEATURE_PER_RMID_ENERGY_TELEM);
 	ret2 = get_pmt_feature(FEATURE_PER_RMID_PERF_TELEM);
 
+	for (eg = &known_event_groups[0]; eg < &known_event_groups[NUM_KNOWN_GROUPS]; eg++) {
+		if (!(*eg)->pfg)
+			continue;
+		if (r->num_rmid)
+			r->num_rmid = min(r->num_rmid, (*eg)->num_rmids);
+		else
+			r->num_rmid = (*eg)->num_rmids;
+	}
+
 	return ret1 || ret2;
 }
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c99aa9dacfd8..9cd37be262a2 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -32,6 +32,7 @@ bool rdt_mon_capable;
 
 #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
 
+int rdt_num_system_rmids;
 static int snc_nodes_per_l3_cache = 1;
 
 /*
@@ -350,6 +351,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
 	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	rdt_num_system_rmids = r->num_rmid;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
-- 
2.49.0

