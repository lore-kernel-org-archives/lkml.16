Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6902DFA49
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744775477; cv=none; b=RO+J4ZOVQH6o39HTayqVD5FO5BcHtOcC1Q5uGeNx82BhYGjAJ27DOB4VO+7EnQo6r02UBmX6UicpkpY0ZixKkJBD5kPkIErasWG5jvcHSCUja/hzGgQ1P+lEqcqB4Hf8ofGXCmqCqawXqHbR5i1vrcqxUZL+7ZL6PHleZxHAazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744775477; c=relaxed/simple;
	bh=JwInkB976ZE2MX+AcyWk2PmBMMcKJtR4i+Ev0NkVLDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AYFFMpQP8RReD0l0dQI+d66tCshNSQ07y7mnL8oergxUgPCZk5yaZBl3fVhPwyZQqVHeuPh+Wv/P0t9q1yE0mVJRBaXUNTQF9h6qMwMFL7zSDFAQNsKO4u9sS15pTLETn5mzAYU3mF6HeVgKGECbtVIC1fW4w4T2JXflLzSCfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwWey3TQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwWey3TQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744775476; x=1776311476;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JwInkB976ZE2MX+AcyWk2PmBMMcKJtR4i+Ev0NkVLDY=;
  b=hwWey3TQkoyV1sH2wrIiaWJP3+JNLSDG990iZghoVXqMQ6jxEgC/jWwi
   RhnP7dh3J81CfOxVCiAt5z+VG+tkr+5tDtpsE6AeOVO6JkuRp9N4R/yzE
   seyMLjoFBr+wZsJeO5TDSWL1t3bc4YenURT79GJI/PvvtOVHLTC7iZrOe
   Hcf39DmViSl5KthIaPNmNhDK2dNUfa2I0SqYli+0H+t4pQoArxMpukT6k
   fD4LhyxNEjy3dWtwWHnGsiz4lotqnVsibQETARU1orZHmfdQClqNEFeUe
   f5kqrt6PBnyBX5t3QIAtelewCYI8ATiMqdCVS6/ZiJwRChOIo9xetTiRl
   w==;
X-CSE-ConnectionGUID: cEZbCjsbRVKZbuTWyoyu0A==
X-CSE-MsgGUID: 0QBuuFToSeqy0zK+66k7Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45443186"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="45443186"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 20:51:15 -0700
X-CSE-ConnectionGUID: GdBEIuj6Rw+BBlnqhrG4ow==
X-CSE-MsgGUID: /DNQ1vUmRVa7NFKEbvwpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130855472"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2025 20:51:15 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Doug Nelson <doug.nelson@intel.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched: Skip useless sched_balance_running acquisition if load balance is not due
Date: Tue, 15 Apr 2025 20:58:23 -0700
Message-Id: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At load balance time, balance of last level cache domains and
above needs to be serialized. The scheduler checks the atomic var
sched_balance_running first and then see if time is due for a load
balance. This is an expensive operation as multiple CPUs can attempt
sched_balance_running acquisition at the same time.

On a 2 socket Granite Rapid systems enabling sub-numa cluster and
running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
sched_balance_running.  Most of the time, a balance attempt is aborted
immediately after acquiring sched_balance_running as load balance time
is not due.

Instead, check balance due time first before acquiring
sched_balance_running. This skips many useless acquisitions
of sched_balance_running and knocks the 7.6% CPU overhead on
sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
improved by 11%.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>
---
 kernel/sched/fair.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..5e5f7a770b2f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 		interval = get_sd_balance_interval(sd, busy);
 
-		need_serialize = sd->flags & SD_SERIALIZE;
-		if (need_serialize) {
-			if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
-				goto out;
-		}
-
 		if (time_after_eq(jiffies, sd->last_balance + interval)) {
+			need_serialize = sd->flags & SD_SERIALIZE;
+			if (need_serialize) {
+				if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
+					goto out;
+			}
+
 			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
 				/*
 				 * The LBF_DST_PINNED logic could have changed
@@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 			}
 			sd->last_balance = jiffies;
 			interval = get_sd_balance_interval(sd, busy);
+			if (need_serialize)
+				atomic_set_release(&sched_balance_running, 0);
 		}
-		if (need_serialize)
-			atomic_set_release(&sched_balance_running, 0);
 out:
 		if (time_after(next_balance, sd->last_balance + interval)) {
 			next_balance = sd->last_balance + interval;
-- 
2.32.0

