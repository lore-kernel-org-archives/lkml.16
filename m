Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E62FCE1A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270920; cv=none; b=ASxthUrBX6Z81qbsQocazhyRsc3w4KjSaibX0r0fmO/uPp3e/rDgPPSjzptpfRM65fVEmwToh+9nY+/mmo0DpYzyL1hx2NIpj7GZfFXAuMz7beZVpYQkrh2HNY8gyzOoVYXLKhwer420hvK4In5+4ah/Az0BdRL3g8Qqt51fikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270920; c=relaxed/simple;
	bh=cMgIIHv7v3o6hwLDWo7qzlIUuIJ0MkqCBDVD8FqJjxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EWQtFnwscFIHJgsfTtDl3lp0BZZED+6rJ4mkP26EG71H0KTH1swfv+jnlTEZByRE4fdbCqlRsxWJKQE1P2n1+rbfG/iNowQx5qRuzogKgl+wAixpKa+2O1Es/si7+y0czWh1Gp4kfwIn7pT6wQ0T9XCYr9+UWmHFzVEOypFRnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpQBSzXY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpQBSzXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270918; x=1781806918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMgIIHv7v3o6hwLDWo7qzlIUuIJ0MkqCBDVD8FqJjxk=;
  b=BpQBSzXYfQCuuNQrY07i0oxTUklWpFxgVOI3T2jR9DS0iIIrA0R9YJ83
   A9emVOApgFn/Vtg45BEuMxyBgA2TiW4xddTrQIm5gKRorVrmWRGguFZxO
   nCW/eG3N/h/KeRxeDQDhVLByESmAqIOMi1VfU1gEw2Y77ZQX7MjFWlXNH
   OUxB74DFQr31EirYxBp+QPY8d/5S5jyj2WR0Nq+yVEz01jtl24VXePQsv
   wBg0aK2thwbQ070vTU2iI+McTBs29ChLZRqwba7zv7kzEGNCrqmDUK6Zg
   bhc7UBL3FUSUKcR5z/7hq6ahpD4cObaTjU9buWfjUFBWJ1k3FZrl+UJpI
   g==;
X-CSE-ConnectionGUID: 3Abw6Bt+Qx+VsWy2ZRBi4Q==
X-CSE-MsgGUID: HFq6k7fqT72cxCbUZ+ATOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931636"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:58 -0700
X-CSE-ConnectionGUID: ul8Mak7HRui0K/AZNo//iw==
X-CSE-MsgGUID: NFSnEWS8RbuYiY0YXOwNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960034"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:57 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Libo Chen <libo.chen@oracle.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Len Brown <len.brown@intel.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [RFC patch v3 14/20] sched: Introduce update_llc_busiest() to deal with groups having preferred LLC tasks
Date: Wed, 18 Jun 2025 11:28:02 -0700
Message-Id: <e5b77a2e33a6a98de0468c999e8c94d226b8e6d3.1750268218.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The load balancer attempts to identify the busiest sched_group with
the highest load and migrates some tasks to a less busy sched_group
to distribute the load across different CPUs.

When cache-aware scheduling is enabled, the busiest sched_group is
defined as the one with the highest number of tasks preferring to run
on the destination LLC. If the busiest group has llc_balance tag,
the cache aware load balance will be launched.

Introduce the helper function update_llc_busiest() to identify
such sched group with most tasks preferring the destination LLC.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 48a090c6e885..ab3d1239d6e4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10848,12 +10848,36 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 
 	return false;
 }
+
+static bool update_llc_busiest(struct lb_env *env,
+			       struct sg_lb_stats *busiest,
+			       struct sg_lb_stats *sgs)
+{
+	int idx;
+
+	/* Only the candidate with llc_balance need to be taken care of */
+	if (!sgs->group_llc_balance)
+		return false;
+
+	/*
+	 * There are more tasks that want to run on dst_cpu's LLC.
+	 */
+	idx = llc_idx(env->dst_cpu);
+	return sgs->nr_pref_llc[idx] > busiest->nr_pref_llc[idx];
+}
 #else
 static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 			       struct sched_group *group)
 {
 	return false;
 }
+
+static bool update_llc_busiest(struct lb_env *env,
+			       struct sg_lb_stats *busiest,
+			       struct sg_lb_stats *sgs)
+{
+	return false;
+}
 #endif
 
 static inline long sibling_imbalance(struct lb_env *env,
@@ -11085,6 +11109,14 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 	     sds->local_stat.group_type != group_has_spare))
 		return false;
 
+	/* deal with prefer LLC load balance, if failed, fall into normal load balance */
+	if (update_llc_busiest(env, busiest, sgs))
+		return true;
+
+	/* if there is already a busy group, skip the normal load balance */
+	if (busiest->group_llc_balance)
+		return false;
+
 	if (sgs->group_type > busiest->group_type)
 		return true;
 
@@ -11991,9 +12023,11 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	/*
 	 * Try to move all excess tasks to a sibling domain of the busiest
 	 * group's child domain.
+	 * Also do so if we can move some tasks that prefer the local LLC.
 	 */
 	if (sds.prefer_sibling && local->group_type == group_has_spare &&
-	    sibling_imbalance(env, &sds, busiest, local) > 1)
+	    (busiest->group_llc_balance ||
+	    sibling_imbalance(env, &sds, busiest, local) > 1))
 		goto force_balance;
 
 	if (busiest->group_type != group_overloaded) {
-- 
2.32.0

