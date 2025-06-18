Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A22F9488
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270912; cv=none; b=trjx3OlHRA8G6/xha0gDitGyeQDoeJ3CWSLlk3i5tVcRLQ172YBtygleCjw//E9Ox3BBaWN+ph357z6VKUSjNpOMgeWNiH6GkUqOMtdSlowllHpGMFXca9dnbLicNEyUsvDUBI3SRpuyiOyhA3wQi6hex0PK3QdUEepICMIjXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270912; c=relaxed/simple;
	bh=o9ssIKZoupCUY+RNkWM8+C2a5S5kPuUisQEegnB07u4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iGg9GEruTAvKeZoWaAvOBUnqouWOODirEVRQZXGYRmNvKmUBtFTbO+hnJ2kyJkTtn96ZqswISYcW/8MaFKP99lSrk/CuZH9xxItsJABocbfde14vreP3VS50k7ELI9JacoChlVu0tLEaIQCSl73iwrgLFU0W1jkrM5FMDR2/bjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB32GMi+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB32GMi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270911; x=1781806911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o9ssIKZoupCUY+RNkWM8+C2a5S5kPuUisQEegnB07u4=;
  b=gB32GMi+ZsCEz3HcthojXq5IZgpULXknP3fum+zJzV6sVIWDquFR+WL7
   p4aRxUvmzJTtGtb6DbOhdfWcTMwfYPeBoThNWTLkO+kN/Gx/5mzI4RDN3
   3JDAP4eXcOHwI+Xgzs+L46NGuc3oyWxTcDIB8oNEL0esdpvR2zH9nzgTk
   s/AtWUC3ubNeM+NWKgu756KSw8M2pErJkISkQA7CeZMciVqZKfTbgApS0
   EUcI9uAwecjVzzaaA+BEUO8jqFgqqlw3NL3G9rPT6t50c2BEIqPjRs/ed
   abvo42eYS3OUZKzeI3iJnnkUKHv/OSzErtpgNUBNHgkLcvq3ke4HuEw9u
   A==;
X-CSE-ConnectionGUID: PSo7rU+bQcqeonMNyHQ+LA==
X-CSE-MsgGUID: ps4xpG3nQJSMcwDcH4WDhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931523"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931523"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:50 -0700
X-CSE-ConnectionGUID: SALh/A1xQRqjZut3f9eZCA==
X-CSE-MsgGUID: 8pi5QrQxSdKOJKN1adsLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959857"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:49 -0700
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>,
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
	linux-kernel@vger.kernel.org
Subject: [RFC patch v3 06/20] sched: Save the per LLC utilization for better cache aware scheduling
Date: Wed, 18 Jun 2025 11:27:54 -0700
Message-Id: <22f5c52b3e904bd782c43bc4bfc6fcd4b447ea54.1750268218.git.tim.c.chen@linux.intel.com>
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

From: Chen Yu <yu.c.chen@intel.com>

When a system gets busy and a process's preferred LLC
is saturated by too many threads within this process, there are significant
in-LLC task migrations within its preferred LLC. This leads to migration
latency and degrades performance. Ideally, task aggregation should be
inhibited if the task's preferred LLC is overloaded. This implies that a
metric is needed to indicate whether the LLC is busy.

Store the per-LLC utilization calculated via periodic load
balancing. These statistics will be used in subsequent patches to
determine whether tasks should be aggregated to their preferred LLC.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 include/linux/sched/topology.h |  3 ++
 kernel/sched/fair.c            | 53 ++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 7b4301b7235f..b3115bc1cbc0 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -78,6 +78,9 @@ struct sched_domain_shared {
 	atomic_t	nr_busy_cpus;
 	int		has_idle_cores;
 	int		nr_idle_scan;
+#ifdef CONFIG_SCHED_CACHE
+	unsigned long	util_avg;
+#endif
 };
 
 struct sched_domain {
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7fb2322c5d9e..02f104414b9a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8806,6 +8806,22 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 #ifdef CONFIG_SCHED_CACHE
 static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
 
+/* expected to be protected by rcu_read_lock() */
+static bool get_llc_stats(int cpu, unsigned long *util,
+			  unsigned long *cap)
+{
+	struct sched_domain_shared *sd_share;
+
+	sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
+	if (!sd_share)
+		return false;
+
+	*util = READ_ONCE(sd_share->util_avg);
+	*cap = per_cpu(sd_llc_size, cpu) * SCHED_CAPACITY_SCALE;
+
+	return true;
+}
+
 static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 {
 	struct mm_struct *mm = p->mm;
@@ -10646,6 +10662,42 @@ sched_reduced_capacity(struct rq *rq, struct sched_domain *sd)
 	return check_cpu_capacity(rq, sd);
 }
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * Save this sched group's statistic for later use:
+ * The task wakeup and load balance can make better
+ * decision based on these statistics.
+ */
+static void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
+			     struct sched_group *group)
+{
+	/* Find the sched domain that spans this group. */
+	struct sched_domain *sd = env->sd->child;
+	struct sched_domain_shared *sd_share;
+
+	if (!sched_feat(SCHED_CACHE) || env->idle == CPU_NEWLY_IDLE)
+		return;
+
+	/* only care the sched domain that spans 1 LLC */
+	if (!sd || !(sd->flags & SD_SHARE_LLC) ||
+	    !sd->parent || (sd->parent->flags & SD_SHARE_LLC))
+		return;
+
+	sd_share = rcu_dereference(per_cpu(sd_llc_shared,
+				   cpumask_first(sched_group_span(group))));
+	if (!sd_share)
+		return;
+
+	if (likely(READ_ONCE(sd_share->util_avg) != sgs->group_util))
+		WRITE_ONCE(sd_share->util_avg, sgs->group_util);
+}
+#else
+static inline void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
+				    struct sched_group *group)
+{
+}
+#endif
+
 /**
  * update_sg_lb_stats - Update sched_group's statistics for load balancing.
  * @env: The load balancing environment.
@@ -10735,6 +10787,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 
 	sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
 
+	update_sg_if_llc(env, sgs, group);
 	/* Computing avg_load makes sense only when group is overloaded */
 	if (sgs->group_type == group_overloaded)
 		sgs->avg_load = (sgs->group_load * SCHED_CAPACITY_SCALE) /
-- 
2.32.0

