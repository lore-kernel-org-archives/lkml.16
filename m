Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353F914AD3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105140; cv=none; b=V44auuIU29u/SM+Vx4mtIsVUvZcYgDtZvWqXOWLVCFqO4YokxRXPjTQ3aS/x/OhcUr5waWWSiqVNghswU9E/pQ3rdnpRjZscko86lZRKQI+y5C1FotMhifkdIi9RAdllHMWKXU/9Bx1lMV/c8ESoevKt3edwfR6kQpWbScfYJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105140; c=relaxed/simple;
	bh=Z60DvuBqEK9JYTKRdo2TrAuShZt4c0gK+1WnFjvgzX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MSeuGFDrPCOogbgB8nke3mrQ17/I/F9iUptWb+c6+pUA9391Ps1B3cyCYOO+HgiE6kWRho0egjc9a4zFVxCKcD0B/2L84fiMWIBY+gLDlIHZb7TLEbKZzF6X8UhoJkevFAgcEX09zHnY9BqjbhL9mjPknyOAH1UJqRWeT8W51io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hf/fAKZQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hf/fAKZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743105139; x=1774641139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z60DvuBqEK9JYTKRdo2TrAuShZt4c0gK+1WnFjvgzX8=;
  b=hf/fAKZQtSdsdS7kVBtWZaRk6MbUyiXDs51tladpK0IPjMPWPnuz6ouQ
   RGjbu2OnhjbGMbEkdxBecqLcwYIwNMYICXxcv1k7mTWWrCUmEbz7PrzAa
   yXMoMHsUNc/1vV0HNoR9cVBYyL/YDTZ9d860g71PUnRKSOAaAfvt19UGV
   sIzKVjH3/mB2g8AJDPHYRoqQwn5hLV0qgitQ5X1JOAwBYbCtP8UmjwkHR
   IAIONNtY3vFS1agUFjav1kEeDYv4tUCasiHmqHmQN0PneLIKs0ozZyq0d
   WmVqTfJew1iBEed8tRj9Nn+IrmEyvwLWMcrZVJG1+GjXhuT25cSTT1j+/
   g==;
X-CSE-ConnectionGUID: LEsRJwEbSrOxVCYsmIom9Q==
X-CSE-MsgGUID: 0vBtXtuQRuKyZ3qB4hz1iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48115662"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48115662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:52:18 -0700
X-CSE-ConnectionGUID: TNX2H4qwQ+etby6wQjhc1Q==
X-CSE-MsgGUID: eCza2K8ORH2At5A0PbFj1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125207685"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 12:52:17 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	ak@linux.intel.com,
	linux-kernel@vger.kernel.org
Cc: eranian@google.com,
	thomas.falcon@intel.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH V4 1/5] perf/x86: Add dynamic constraint
Date: Thu, 27 Mar 2025 12:52:13 -0700
Message-Id: <20250327195217.2683619-2-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250327195217.2683619-1-kan.liang@linux.intel.com>
References: <20250327195217.2683619-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

More and more features require a dynamic event constraint, e.g., branch
counter logging, auto counter reload, Arch PEBS, etc.

Add a generic flag, PMU_FL_DYN_CONSTRAINT, to indicate the case. It
avoids keeping adding the individual flag in intel_cpuc_prepare().

Add a variable dyn_constraint in the struct hw_perf_event to track the
dynamic constraint of the event. Apply it if it's updated.

Apply the generic dynamic constraint for branch counter logging.
Many features on and after V6 require dynamic constraint. So
unconditionally set the flag for V6+.

Tested-by: Thomas Falcon <thomas.falcon@intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/core.c       |  1 +
 arch/x86/events/intel/core.c | 21 +++++++++++++++------
 arch/x86/events/intel/lbr.c  |  2 +-
 arch/x86/events/perf_event.h |  1 +
 include/linux/perf_event.h   |  1 +
 5 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 833478ffbbf5..e30a7d8a3929 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -674,6 +674,7 @@ static int __x86_pmu_event_init(struct perf_event *event)
 	event->hw.idx = -1;
 	event->hw.last_cpu = -1;
 	event->hw.last_tag = ~0ULL;
+	event->hw.dyn_constraint = ~0ULL;
 
 	/* mark unused */
 	event->hw.extra_reg.idx = EXTRA_REG_NONE;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index dc38dec244c1..2a3f802e3ab9 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3730,10 +3730,9 @@ intel_get_event_constraints(struct cpu_hw_events *cpuc, int idx,
 	if (cpuc->excl_cntrs)
 		return intel_get_excl_constraints(cpuc, event, idx, c2);
 
-	/* Not all counters support the branch counter feature. */
-	if (branch_sample_counters(event)) {
+	if (event->hw.dyn_constraint != ~0ULL) {
 		c2 = dyn_constraint(cpuc, c2, idx);
-		c2->idxmsk64 &= x86_pmu.lbr_counters;
+		c2->idxmsk64 &= event->hw.dyn_constraint;
 		c2->weight = hweight64(c2->idxmsk64);
 	}
 
@@ -4135,15 +4134,19 @@ static int intel_pmu_hw_config(struct perf_event *event)
 		leader = event->group_leader;
 		if (branch_sample_call_stack(leader))
 			return -EINVAL;
-		if (branch_sample_counters(leader))
+		if (branch_sample_counters(leader)) {
 			num++;
+			leader->hw.dyn_constraint &= x86_pmu.lbr_counters;
+		}
 		leader->hw.flags |= PERF_X86_EVENT_BRANCH_COUNTERS;
 
 		for_each_sibling_event(sibling, leader) {
 			if (branch_sample_call_stack(sibling))
 				return -EINVAL;
-			if (branch_sample_counters(sibling))
+			if (branch_sample_counters(sibling)) {
 				num++;
+				sibling->hw.dyn_constraint &= x86_pmu.lbr_counters;
+			}
 		}
 
 		if (num > fls(x86_pmu.lbr_counters))
@@ -4943,7 +4946,7 @@ int intel_cpuc_prepare(struct cpu_hw_events *cpuc, int cpu)
 			goto err;
 	}
 
-	if (x86_pmu.flags & (PMU_FL_EXCL_CNTRS | PMU_FL_TFA | PMU_FL_BR_CNTR)) {
+	if (x86_pmu.flags & (PMU_FL_EXCL_CNTRS | PMU_FL_TFA | PMU_FL_DYN_CONSTRAINT)) {
 		size_t sz = X86_PMC_IDX_MAX * sizeof(struct event_constraint);
 
 		cpuc->constraint_list = kzalloc_node(sz, GFP_KERNEL, cpu_to_node(cpu));
@@ -6657,6 +6660,12 @@ __init int intel_pmu_init(void)
 			pr_cont(" AnyThread deprecated, ");
 	}
 
+	/*
+	 * Many features on and after V6 require dynamic constraint,
+	 * e.g., Arch PEBS, ACR.
+	 */
+	if (version >= 6)
+		x86_pmu.flags |= PMU_FL_DYN_CONSTRAINT;
 	/*
 	 * Install the hw-cache-events table:
 	 */
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index f44c3d866f24..05acd6449ceb 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -1618,7 +1618,7 @@ void __init intel_pmu_arch_lbr_init(void)
 	x86_pmu.lbr_nr = lbr_nr;
 
 	if (!!x86_pmu.lbr_counters)
-		x86_pmu.flags |= PMU_FL_BR_CNTR;
+		x86_pmu.flags |= PMU_FL_BR_CNTR | PMU_FL_DYN_CONSTRAINT;
 
 	if (x86_pmu.lbr_mispred)
 		static_branch_enable(&x86_lbr_mispred);
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 8e5a4c3c5b95..d6d56568e11f 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1059,6 +1059,7 @@ do {									\
 #define PMU_FL_MEM_LOADS_AUX	0x100 /* Require an auxiliary event for the complete memory info */
 #define PMU_FL_RETIRE_LATENCY	0x200 /* Support Retire Latency in PEBS */
 #define PMU_FL_BR_CNTR		0x400 /* Support branch counter logging */
+#define PMU_FL_DYN_CONSTRAINT	0x800 /* Needs dynamic constraint */
 
 #define EVENT_VAR(_id)  event_attr_##_id
 #define EVENT_PTR(_id) &event_attr_##_id.attr.attr
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 63dddb3b54f0..2fa0cd6772f1 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -158,6 +158,7 @@ struct hw_perf_event {
 		struct { /* hardware */
 			u64		config;
 			u64		last_tag;
+			u64		dyn_constraint;
 			unsigned long	config_base;
 			unsigned long	event_base;
 			int		event_base_rdpmc;
-- 
2.38.1

