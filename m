Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623DB149C7D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446227; cv=none; b=Lfs/lqcKTpiAyx18KNa3TTnuWAgJsZ/EH/RzoijqBVExtNehKvhp0y3SZ3WPNCps087GVqVpXZw9sGLEQmjkRWVz8hQp7qsJPYKmwIahc+i9Gci9lQrK7/8Rgb7qDhtXwwKQYwPADE+s6dYjY6ed5Dphtzfm1IHqZcRsBAMU5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446227; c=relaxed/simple;
	bh=QU2jZV0/JbR5kjtHqgr7yHrHv1HN5U3C+fJYMCRIF6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lVj2EyEx0wVmGLuaUDXGgdN9b4kKaAX+rbxsrT5ZPN46z/Qqs3Y7/cw3FIWbiqkC5LUbb7CuYmTuzVl1NWX+EwpsZLxJw1fu5yt09+8APIEfYCWLnTtShh6Jf5f17b+Rv2Uu9JP87g236U1Xr40BVzxX0ypnSPOwBA6SWXCvB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8WrnCkV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8WrnCkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745446224; x=1776982224;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QU2jZV0/JbR5kjtHqgr7yHrHv1HN5U3C+fJYMCRIF6s=;
  b=Y8WrnCkVI8v+iitZf+K3JGemBMfzJ+U0qt6uwCploK+x7NQzH2IWiorL
   sLIK1B23E1CCQFBqGCk8G1nXhaZcKOgigsQWmWFMFqwUIsT3XUxHihM6R
   JWaX8Z0ggLuOthsxy1EDAYbst51mbZEseV/nwNh5JhUSMuvYh3Tb8MauG
   hs6Mgzb1p2qZb8HK3/uY7L6lMQJXv3OS1oYzxic71jOsJlJ2oZWFeSWcz
   B4xBe9avHu7wm40lj8YiXBFUgcH6KxkMv5SOZHjHtJjFGql5f44Qxjmch
   vWT0oZInjz9mcPlrh1L+im2Z6a/X89Lf63BzuI1UWQeBh6nRuIPMm61gm
   Q==;
X-CSE-ConnectionGUID: /Duam/5DRk2MHpkbMDCdsg==
X-CSE-MsgGUID: rr38YFT6QZi057y/LZWnCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="34673156"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="34673156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 15:10:24 -0700
X-CSE-ConnectionGUID: 8MYHgI7ASvuRDWP336NROw==
X-CSE-MsgGUID: IMUFvbvuQKGG8OEt5YyHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132967190"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 15:10:24 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>,
	Luo Gengkun <luogengkun@huaweicloud.com>
Subject: [PATCH 1/2] perf/x86/intel: Only check the group flag for X86 leader
Date: Wed, 23 Apr 2025 15:10:14 -0700
Message-Id: <20250423221015.268949-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

A warning in intel_pmu_lbr_counters_reorder() may be triggered by below
perf command.

perf record -e "{cpu-clock,cycles/call-graph="lbr"/}" -- sleep 1

It's because the group is mistakenly treated as a branch counter group.

The hw.flags of the leader are used to determine whether a group is a
branch counters group. However, the hw.flags is only available for a
hardware event. The field to store the flags is a union type. For a
software event, it's a hrtimer. The corresponding bit may be set if the
leader is a software event.

For a branch counter group and other groups that have a group flag
(e.g., topdown, PEBS counters snapshotting, and ACR), the leader must
be a X86 event. Check the X86 event before checking the flag.

There may be an alternative way to fix the issue by moving the hw.flags
out of the union type. It should work for now. But it's still possible
that the flags will be used by other types of events later. As long as
that type of event is used as a leader, a similar issue will be
triggered. So the alternative way is dropped.

Reported-by: Luo Gengkun <luogengkun@huaweicloud.com>
Closes: https://lore.kernel.org/lkml/20250412091423.1839809-1-luogengkun@huaweicloud.com/
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/perf_event.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 902bc42a6cfe..cc7717a1d6f3 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -110,19 +110,26 @@ static inline bool is_topdown_event(struct perf_event *event)
 	return is_metric_event(event) || is_slots_event(event);
 }
 
+int is_x86_event(struct perf_event *event);
+
+static inline bool check_leader_group(struct perf_event *leader, int flags)
+{
+	return is_x86_event(leader) ? !!(leader->hw.flags & flags) : false;
+}
+
 static inline bool is_branch_counters_group(struct perf_event *event)
 {
-	return event->group_leader->hw.flags & PERF_X86_EVENT_BRANCH_COUNTERS;
+	return check_leader_group(event->group_leader, PERF_X86_EVENT_BRANCH_COUNTERS);
 }
 
 static inline bool is_pebs_counter_event_group(struct perf_event *event)
 {
-	return event->group_leader->hw.flags & PERF_X86_EVENT_PEBS_CNTR;
+	return check_leader_group(event->group_leader, PERF_X86_EVENT_PEBS_CNTR);
 }
 
 static inline bool is_acr_event_group(struct perf_event *event)
 {
-	return event->group_leader->hw.flags & PERF_X86_EVENT_ACR;
+	return check_leader_group(event->group_leader, PERF_X86_EVENT_ACR);
 }
 
 struct amd_nb {
@@ -1129,7 +1136,6 @@ static struct perf_pmu_format_hybrid_attr format_attr_hybrid_##_name = {\
 	.pmu_type	= _pmu,						\
 }
 
-int is_x86_event(struct perf_event *event);
 struct pmu *x86_get_pmu(unsigned int cpu);
 extern struct x86_pmu x86_pmu __read_mostly;
 
-- 
2.38.1

