Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB802F5473
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270924; cv=none; b=UcUwkmFrXm1QZiHhRd9nLRLaJcXdFq15Quaiz8ZBN1nnL9SrnbVlLxUTqIyE9whgxAiEKu2+OgsC5VVcnjsA8wMU0p6jVlFPPQ7qmeBTzB6VM8FM85LAnq7ENrafpJvlDPCDIM9KyyIse0EZlGPKURu465AkRFJXtSxWwqh6Huo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270924; c=relaxed/simple;
	bh=LvkJ+My0UyW3xwEVx+qylSLEWrcmxbixkOEWZ10FTps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OB9jn7VvZ/rPmdAtTnDXoDgCyo72RKBXKCzeOdkrfLO6e85bK8hUMUUUOJEZalXFcdLxjZn/HiIycPeaDEtK0UPQwahP6NKXPIqG2XHiIkz2fC4a83E4onHZ8UGT50ZPOtl9Nzhvr5GlVAWllkK6TCvxOkmzUawTYoseeve+8+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlYX1oli; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlYX1oli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270922; x=1781806922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LvkJ+My0UyW3xwEVx+qylSLEWrcmxbixkOEWZ10FTps=;
  b=GlYX1olin1BGUE11MHHJj9SNVdaVYXouh/gB+4N21ppPm9OJp1+kXEIW
   jYKsD82DRpSUkmfbSWF6qlHl4i9BpZM+/sHr7a8DHXRrYaxO/Rj5jbXOw
   +J6epKBAznqSQbDha14UPGm8Z7tWVAxbi3VVbxuqnoizc+7JuMcPHjd8u
   wYx2yGauKvj0wQL3aVlaHP9Wp4NxgHk3BFgHplWMZc9XEc1wUSkwxQzqV
   T9whL5z31EzCyXebtiORr7A5MGjv8KhiLdLGBw82yyfUiT62ZER6bvm4y
   FqiKWIa9GZLlg4Z0hqOBSzlk3RseQZUvCgYBNujCvQGV07FE+Rdzvhqlv
   Q==;
X-CSE-ConnectionGUID: 4oIUGMDbTxGXwK/Erd3pww==
X-CSE-MsgGUID: tbl/Cv7HTzy00jIWW42WkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931694"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931694"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:22:02 -0700
X-CSE-ConnectionGUID: dreUdLK/Snq9Tth5AMDo9w==
X-CSE-MsgGUID: FI0VhmRdTFe0V4qTkbZ9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960127"
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
Subject: [RFC patch v3 18/20] sched: Do not migrate task if it is moving out of its preferred LLC
Date: Wed, 18 Jun 2025 11:28:06 -0700
Message-Id: <cfd95c4e502c5987141afcabc38566de9a5a34e1.1750268218.git.tim.c.chen@linux.intel.com>
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

In the final step of task migration during load balancing,
can_migrate_task() is used to determine whether a task can
be moved to the destination. If the task has an LLC preference,
consider this preference when moving it out of its preferred LLC.
With this check in place, there is no need to retain the task's
cache-hot CPU check in task_hot(); remove it accordingly.

Besides, add more checks in detach_tasks() to avoid choosing
tasks that prefer their current LLC.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c9db32c2df63..e342524481ed 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9787,17 +9787,6 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 	if (sysctl_sched_migration_cost == 0)
 		return 0;
 
-#ifdef CONFIG_SCHED_CACHE
-	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->pcpu_sched) {
-		/*
-		 * XXX things like Skylake have non-inclusive L3 and might not
-		 * like this L3 centric view. What to do about L2 stickyness ?
-		 */
-		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
-		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
-	}
-#endif
-
 	delta = rq_clock_task(env->src_rq) - p->se.exec_start;
 
 	return delta < (s64)sysctl_sched_migration_cost;
@@ -9992,6 +9981,12 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (env->flags & LBF_ACTIVE_LB)
 		return 1;
 
+#ifdef CONFIG_SCHED_CACHE
+	if (sched_feat(SCHED_CACHE) &&
+	    get_migrate_hint(env->src_cpu, env->dst_cpu, p) == mig_forbid)
+		return 0;
+#endif
+
 	degrades = migrate_degrades_locality(p, env);
 	if (!degrades)
 		hot = task_hot(p, env);
@@ -10252,6 +10247,17 @@ static int detach_tasks(struct lb_env *env)
 		if (env->imbalance <= 0)
 			break;
 
+#ifdef CONFIG_SCHED_CACHE
+		/*
+		 * Don't detach more tasks if remaining tasks want to stay:
+		 * The tasks have already been sorted by order_tasks_by_llc(),
+		 * they are tasks that prefer the current LLC.
+		 */
+		if (sched_feat(SCHED_CACHE) && p->preferred_llc != -1 &&
+		    llc_id(env->src_cpu) == p->preferred_llc)
+			break;
+#endif
+
 		continue;
 next:
 		if (p->sched_task_hot)
-- 
2.32.0

