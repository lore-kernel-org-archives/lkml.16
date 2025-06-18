Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EE2F5476
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270922; cv=none; b=MFTVX6qRlvnmcnypqJAnNUvjVFnCj+BYWehMpFkjTBU+YkJWvxgKrAJGcPlOnWFlULsIE0HJF5adxlSs+4NcBPZqPwLUEpp3DyzPS31YqqskBVjcvxtKVfWLg48hqUzzgp9v2j0fKtLs13VTywRh7Dh2csNg/XDFtX5FiqAZvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270922; c=relaxed/simple;
	bh=UQoBqN95xnQudsJ44o6C5oD7PSQHCIXgA6EcclP4fcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDrGI2/xX7+VWoIaZPAxSQ62lLIbd2FIobNRajXdY8S5xE+UkDaqRZV9oSWRZyNefE1ch1lBYfvNcBa+4ghO/kDKZP04UYkGh8gv4TzDurIYTenC4Ns0bIWzJq0lXhvHvCBGCuNffM2eKs5JKCc2O0pb2ptRCWrh8hgx0OzEDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwPPS4Py; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwPPS4Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270921; x=1781806921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQoBqN95xnQudsJ44o6C5oD7PSQHCIXgA6EcclP4fcc=;
  b=gwPPS4PyJxuWZjpqppzzQNy6oNFS2apouvtFBoztM3FRMsIZNoXOCYZS
   4ZGsvXZ1GBKYWiosJJLy3Afvyz6rPjZGp6kTCMd3SEk6QElyc++ZHbpeH
   U+87HjtVKO3MPeHlo5eycdT091abyiOHsWsk02bh++KLCXtrZChonH3SN
   EXN9QhBQhTsKkKvGvzRjZJXx+5ylM+EmAu0SlP86VdBwSp8bjkVa10OXt
   tZ/lEtGqbQUS8nYQOIluXmFXapZZs3teRfaTMOdaD+49KrQPZjXrq2Ex4
   mkaL045bqiOr9hiagrNO4Meh5T5RKF9itXcTr61PJGxchTt1XfKGFw5XC
   g==;
X-CSE-ConnectionGUID: Yl7CRBbAQ5iJFKjFcNyJkw==
X-CSE-MsgGUID: JmWjpB8BQ8SyduLVhShd6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931677"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:22:00 -0700
X-CSE-ConnectionGUID: PriWcHtzQ+CMXjb98vjSvg==
X-CSE-MsgGUID: 4FJAHvYoQNmNJWCnl/pw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960102"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:22:00 -0700
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
Subject: [RFC patch v3 17/20] sched: Consider LLC preference when picking tasks from busiest queue
Date: Wed, 18 Jun 2025 11:28:05 -0700
Message-Id: <9d28a5a892f0413a96498bbf711eaa9b354ca895.1750268218.git.tim.c.chen@linux.intel.com>
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

When picking tasks from busiest queue for load balance, we currently
do not consider LLC preference.

Order the task in the busiest queue such that we picked the tasks in the
following order:
	1. tasks that prefer dst cpu's LLC
	2. tasks that have no preference in LLC
	3. tasks that prefer LLC other than the ones they are on
	4. tasks that prefer the LLC that they are currently on

This will allow tasks better chances to wind up in its preferred LLC.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 66 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3a8f6fc52055..c9db32c2df63 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10056,6 +10056,68 @@ static struct task_struct *detach_one_task(struct lb_env *env)
 	return NULL;
 }
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * Prepare lists to detach tasks in the following order:
+ * 1. tasks that prefer dst cpu's LLC
+ * 2. tasks that have no preference in LLC
+ * 3. tasks that prefer LLC other than the ones they are on
+ * 4. tasks that prefer the LLC that they are currently on.
+ */
+static struct list_head
+*order_tasks_by_llc(struct lb_env *env, struct list_head *tasks)
+{
+	struct task_struct *p;
+	LIST_HEAD(pref_old_llc);
+	LIST_HEAD(pref_new_llc);
+	LIST_HEAD(no_pref_llc);
+	LIST_HEAD(pref_other_llc);
+
+	if (!sched_feat(SCHED_CACHE))
+		return tasks;
+
+	if (cpus_share_cache(env->dst_cpu, env->src_cpu))
+		return tasks;
+
+	while (!list_empty(tasks)) {
+		p = list_last_entry(tasks, struct task_struct, se.group_node);
+
+		if (p->preferred_llc == llc_id(env->dst_cpu)) {
+			list_move(&p->se.group_node, &pref_new_llc);
+			continue;
+		}
+
+		if (p->preferred_llc == llc_id(env->src_cpu)) {
+			list_move(&p->se.group_node, &pref_old_llc);
+			continue;
+		}
+
+		if (p->preferred_llc == -1) {
+			list_move(&p->se.group_node, &no_pref_llc);
+			continue;
+		}
+
+		list_move(&p->se.group_node, &pref_other_llc);
+	}
+
+	/*
+	 * We detach tasks from list tail in detach tasks.  Put tasks
+	 * to be chosen first at end of list.
+	 */
+	list_splice(&pref_new_llc, tasks);
+	list_splice(&no_pref_llc, tasks);
+	list_splice(&pref_other_llc, tasks);
+	list_splice(&pref_old_llc, tasks);
+	return tasks;
+}
+#else
+static inline struct list_head
+*order_tasks_by_llc(struct lb_env *env, struct list_head *tasks)
+{
+	return tasks;
+}
+#endif
+
 /*
  * detach_tasks() -- tries to detach up to imbalance load/util/tasks from
  * busiest_rq, as part of a balancing operation within domain "sd".
@@ -10064,7 +10126,7 @@ static struct task_struct *detach_one_task(struct lb_env *env)
  */
 static int detach_tasks(struct lb_env *env)
 {
-	struct list_head *tasks = &env->src_rq->cfs_tasks;
+	struct list_head *tasks;
 	unsigned long util, load;
 	struct task_struct *p;
 	int detached = 0;
@@ -10083,6 +10145,8 @@ static int detach_tasks(struct lb_env *env)
 	if (env->imbalance <= 0)
 		return 0;
 
+	tasks = order_tasks_by_llc(env, &env->src_rq->cfs_tasks);
+
 	while (!list_empty(tasks)) {
 		/*
 		 * We don't want to steal all, otherwise we may be treated likewise,
-- 
2.32.0

