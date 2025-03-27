Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B817BB21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105141; cv=none; b=OWZDK3tEyrCOSAvtb2BIXX8e5MKJ157d6oUr5Q5MbcmbhyGvjgcBNdz6j1a24vZWUWfkT9/Yf8SI2cdiOwt3JuKcHgt2QAnBk5ImMjnfmj6f7ythAUH9UnVPmH3ID1ait+M2LIM9l+uVdXPbmBjlr4z4kwuzMgBZStpkk3h1suw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105141; c=relaxed/simple;
	bh=+fdqIDe6IZhKndHvkhWjgqzlWgI592YvC7I1hrip3vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5X94qH0nDV8ADrnPUZAeEQ0gxtbucsjzOe38ltEKDtGJ1Xa7LML83sh2g0hq8jJPKNh6zQbgQiZXJow4SnC6xccU4N/Ey4WXr9ckAb+2L0aTfbqH1lJPhjLrwMbkEKxC781zRxmhit8mPRdX7s+8MH68zuDhh34wAMR1Q2lpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+fyvt/4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+fyvt/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743105140; x=1774641140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+fdqIDe6IZhKndHvkhWjgqzlWgI592YvC7I1hrip3vA=;
  b=S+fyvt/4lJhHNjGdTUEvYWKWOr/dYlLDwdD9seidiBSo4zSQWcxW1HYG
   O0Tmvu85CuL86DBp9N6KOO650lU2bRZLqBX/zIdabbSjMJ7+szE1t7TYy
   tuM6FbnpaC/VQyb7BK4gnQNGXzvn3Kzt1xt9Eovm2mRJ6S1zgAKY9a5a1
   ZYmRPqDyGrSzGn0mPVmWlo373fvHx6TbWcvZuntXRQSAoExlXB+bqd14V
   LoCFZrNd8Hg3Uf5lxchmuWracwRTP4Hwd3hWe3J2iGY1RyHWdKIEwOCfO
   x0ziEel65taZJ7exEcc8QlESAdt2NDkQXcnsG+db+aoMUcoUO1vFFQAz6
   g==;
X-CSE-ConnectionGUID: hqww/MSJQtqwHILISN89cg==
X-CSE-MsgGUID: LFvoSiIoSCeQad75yCkasg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48115667"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48115667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:52:18 -0700
X-CSE-ConnectionGUID: Tfbb/jUYTD6CftDED50nLA==
X-CSE-MsgGUID: a88/Py6rTam2CyWaKNq3fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125207688"
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
Subject: [PATCH V4 2/5] perf/x86/intel: Track the num of events needs late setup
Date: Thu, 27 Mar 2025 12:52:14 -0700
Message-Id: <20250327195217.2683619-3-kan.liang@linux.intel.com>
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

When a machine supports PEBS v6, perf unconditionally searches the
cpuc->event_list[] for every event and check if the late setup is
required, which is unnecessary.

The late setup is only required for special events, e.g., events support
counters snapshotting feature. Add n_late_setup to track the num of
events that needs the late setup.

Other features, e.g., auto counter reload feature, require the late
setup as well. Add a wrapper, intel_pmu_pebs_late_setup, for the events
that support counters snapshotting feature.

Tested-by: Thomas Falcon <thomas.falcon@intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/core.c | 14 ++++++++++++++
 arch/x86/events/intel/ds.c   |  3 +--
 arch/x86/events/perf_event.h |  5 +++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 2a3f802e3ab9..66c42f856636 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2603,6 +2603,8 @@ static void intel_pmu_del_event(struct perf_event *event)
 		intel_pmu_lbr_del(event);
 	if (event->attr.precise_ip)
 		intel_pmu_pebs_del(event);
+	if (is_pebs_counter_event_group(event))
+		this_cpu_ptr(&cpu_hw_events)->n_late_setup--;
 }
 
 static int icl_set_topdown_event_period(struct perf_event *event)
@@ -2914,12 +2916,24 @@ static void intel_pmu_enable_event(struct perf_event *event)
 	}
 }
 
+void intel_pmu_late_setup(void)
+{
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
+
+	if (!cpuc->n_late_setup)
+		return;
+
+	intel_pmu_pebs_late_setup(cpuc);
+}
+
 static void intel_pmu_add_event(struct perf_event *event)
 {
 	if (event->attr.precise_ip)
 		intel_pmu_pebs_add(event);
 	if (intel_pmu_needs_branch_stack(event))
 		intel_pmu_lbr_add(event);
+	if (is_pebs_counter_event_group(event))
+		this_cpu_ptr(&cpu_hw_events)->n_late_setup++;
 }
 
 /*
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 1f7e1a692a7a..486881fe162e 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1355,9 +1355,8 @@ static void __intel_pmu_pebs_update_cfg(struct perf_event *event,
 }
 
 
-static void intel_pmu_late_setup(void)
+void intel_pmu_pebs_late_setup(struct cpu_hw_events *cpuc)
 {
-	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	struct perf_event *event;
 	u64 pebs_data_cfg = 0;
 	int i;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index d6d56568e11f..84943243b05d 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -261,6 +261,7 @@ struct cpu_hw_events {
 	struct event_constraint	*event_constraint[X86_PMC_IDX_MAX];
 
 	int			n_excl; /* the number of exclusive events */
+	int			n_late_setup; /* the num of events needs late setup */
 
 	unsigned int		txn_flags;
 	int			is_fake;
@@ -1598,6 +1599,8 @@ void intel_pmu_disable_bts(void);
 
 int intel_pmu_drain_bts_buffer(void);
 
+void intel_pmu_late_setup(void);
+
 u64 grt_latency_data(struct perf_event *event, u64 status);
 
 u64 cmt_latency_data(struct perf_event *event, u64 status);
@@ -1654,6 +1657,8 @@ void intel_pmu_pebs_disable_all(void);
 
 void intel_pmu_pebs_sched_task(struct perf_event_pmu_context *pmu_ctx, bool sched_in);
 
+void intel_pmu_pebs_late_setup(struct cpu_hw_events *cpuc);
+
 void intel_pmu_drain_pebs_buffer(void);
 
 void intel_pmu_store_pebs_lbrs(struct lbr_entry *lbr);
-- 
2.38.1

