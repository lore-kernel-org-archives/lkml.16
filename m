Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DE2FC01C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270919; cv=none; b=nmqdaWDatMrhBkfjuY3zJis51UO9eAa5aRb1rJdWVySUjW3tfYRxyj1Xkvi+fNpajS95RQl1kNM/Uc2yZ/0qy4Yr0n5zWNCB62WmrDP+LPoiGxGjwroeiGueYQuwTtAOG6KXPOSjIfKn4GM4dEwjzo3+VttU3Mxq2/vSBP1gjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270919; c=relaxed/simple;
	bh=qbjVDBu0+RR9cVBkMVV/EEaCntO2T94kbrD7rZkO8yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XnMghoHFlyLEgu+Wh96kFEDjFxOvIdG1kYivt+ooFQzL7JHqy7Y2tRCCgBmmjgXcODTYXXNN9TLYbc2t4TSsUmKPzAY7GwTWviiMJPDQpqTfLl+bgoY1YdlK7e1ynWuUJ9NxwRUCfO0asQkBgDzntM+cRVZ3lV7tz/MiGA6JuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coUsxsM/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coUsxsM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270917; x=1781806917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qbjVDBu0+RR9cVBkMVV/EEaCntO2T94kbrD7rZkO8yA=;
  b=coUsxsM/ixxY43XGQ61Df5pL4/CwC9wk7zMajcpFP2eKll8eBCTuGhU1
   TDmuCcPGg5tMI5ZhS8hwToyQBxfmHALCjIHPMRTTN7NWZkIjloQEW5hzf
   8OM/inZ27wXqGy9oddWdVppotNblwyx73zjRCiYiilRwXBDqWBWSJby2f
   mn56QOTvTT4uucpyocRsNzlz0tvki+S25xv2mNIZJ1GFIXdpAREJ2ZZvQ
   7hlrzMUkv6jPGBx21WWsulHPgdDzFpzgrgy7hSF/p1HI793hc8L9jfEZv
   KcS4ylrKsFNBqYOFqL6hfs7PvPzeeEHhVD6z0cM0apx9kBQCg3dCDjTKK
   Q==;
X-CSE-ConnectionGUID: tZPMCIUPT5iVlY3/j2c6gg==
X-CSE-MsgGUID: qbFq77/RT1KHBqt/bJ6sEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931622"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931622"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:57 -0700
X-CSE-ConnectionGUID: btZ9nZi5QCuWcK+hX1K3bQ==
X-CSE-MsgGUID: 68bF5Nl8R3yXe/gNzr0YHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960011"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:56 -0700
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
Subject: [RFC patch v3 13/20] sched: Tag the sched group as llc_balance if it has tasks prefer other LLC
Date: Wed, 18 Jun 2025 11:28:01 -0700
Message-Id: <936c261e6283b8fa8c2d7e60493721f6594ce176.1750268218.git.tim.c.chen@linux.intel.com>
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

During load balancing between LLCs, check whether there are tasks
preferring the destination LLC. If so, balance those tasks to the
destination LLC first.

Tag the sched_group that has tasks preferring to run on other LLCs
(non-local) with the group_llc_balance flag. This way, the load
balancer will later attempt to pull/push these tasks to their
preferred LLCs.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 99f3cee7b276..48a090c6e885 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10454,6 +10454,7 @@ struct sg_lb_stats {
 	enum group_type group_type;
 	unsigned int group_asym_packing;	/* Tasks should be moved to preferred CPU */
 	unsigned int group_smt_balance;		/* Task on busy SMT be moved */
+	unsigned int group_llc_balance;		/* Tasks should be moved to preferred LLC */
 	unsigned long group_misfit_task_load;	/* A CPU has a task too big for its capacity */
 #ifdef CONFIG_NUMA_BALANCING
 	unsigned int nr_numa_running;
@@ -10818,6 +10819,43 @@ static inline bool smt_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 	return false;
 }
 
+/*
+ * Do LLC balance on sched group that contains LLC, and have tasks preferring
+ * to run on LLC in idle dst_cpu.
+ */
+#ifdef CONFIG_SCHED_CACHE
+static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
+			       struct sched_group *group)
+{
+	struct sched_domain *child = env->sd->child;
+	int llc;
+
+	if (!sched_feat(SCHED_CACHE))
+		return false;
+
+	if (env->sd->flags & SD_SHARE_LLC)
+		return false;
+
+	/* only care about task migration among LLCs */
+	if (child && !(child->flags & SD_SHARE_LLC))
+		return false;
+
+	llc = llc_idx(env->dst_cpu);
+	if (sgs->nr_pref_llc[llc] > 0 &&
+	    _get_migrate_hint(env->src_cpu, env->dst_cpu,
+			      0, true) == mig_allow)
+		return true;
+
+	return false;
+}
+#else
+static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
+			       struct sched_group *group)
+{
+	return false;
+}
+#endif
+
 static inline long sibling_imbalance(struct lb_env *env,
 				    struct sd_lb_stats *sds,
 				    struct sg_lb_stats *busiest,
@@ -11000,6 +11038,11 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 	sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
 
 	update_sg_if_llc(env, sgs, group);
+
+	/* Check for tasks in this group can be moved to their preferred LLC */
+	if (!local_group && llc_balance(env, sgs, group))
+		sgs->group_llc_balance = 1;
+
 	/* Computing avg_load makes sense only when group is overloaded */
 	if (sgs->group_type == group_overloaded)
 		sgs->avg_load = (sgs->group_load * SCHED_CAPACITY_SCALE) /
-- 
2.32.0

