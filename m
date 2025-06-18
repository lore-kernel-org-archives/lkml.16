Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571022FCFC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270921; cv=none; b=Au/8Jdq57vaG6zpgwbWDMgAuubIJAHPnTlsoAXwGoHognpeK/aWGydhvQxM3536916CeCjNp7EH7OJ1j+rscZhPywV3siybixACVKTWmKknqhXSmK9iQja3rE6sE7M29Xk/pKSsaah9dw+I+23TM1f6VNcw/zxHYJJuvbu42ScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270921; c=relaxed/simple;
	bh=qHzPg7pOAdSMp76icLDVAZqOGBB1+iXyIxtSLlESXR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvCpUAB1cF+/DlV2OPMao3wito5w7p/P7XCMH0zVQpdX7ISAPe7+UYDSTlR5CXGTWmTgG7MhjDnYZB0VvoII8J7ZwG7QGcKzF1ITC8sBcvoSR2nl05LkQA/9d/FIPodpuCurin5CPmjX8yQEcG/PuH0gr8OoT0oFfJQ9PTGL73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmFBFr6Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmFBFr6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270919; x=1781806919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qHzPg7pOAdSMp76icLDVAZqOGBB1+iXyIxtSLlESXR0=;
  b=FmFBFr6Yj94ghXvPX0OCmpCOy98F1E44OpxMfBpTuE01Up5uaW3BC4dp
   LKM2y1rnTUzZVvsXBUk+n0OQLTLEDTa762KmotgATQyk408JVWd7CeTmx
   a5qvM/9qZL3kEomZaLdyET8OE/W/+gBaxg35o/VfV60g6iC8kUriAFUIK
   FnOkrknbKEmGtpNieAKL4Z11kucxta5+z0O7A4asBMEslen5BktgpvTBS
   OaNU8TXkSuVwDP/FVVia7CCMK0h99Xst5sxVHgrZZz/hLD2iZNRH8LdJs
   at3EQiEbK/gun5R/uTtPhw5w9l5xV9iGjFYl1aRfV6FTSQSAQS5govoCZ
   w==;
X-CSE-ConnectionGUID: l1gKsZfFSOGB2PlCgz10uA==
X-CSE-MsgGUID: vayaBofJRAyAxRdcDQ65+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931650"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:58 -0700
X-CSE-ConnectionGUID: K6PGgga3SImXHYmzMR4M/w==
X-CSE-MsgGUID: l0kLMoLZQamEcnOsk8UfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960060"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:58 -0700
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
Subject: [RFC patch v3 15/20] sched: Introduce a new migration_type to track the preferred LLC load balance
Date: Wed, 18 Jun 2025 11:28:03 -0700
Message-Id: <5b9c5a9ddb5b8b16ad20fbba9d41288de95741bc.1750268218.git.tim.c.chen@linux.intel.com>
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

Introduce a new migration type named migrate_llc_task to facilitate
cache-aware load balancing.

After the busiest sched_group is identified as the one that needs
migration due to having most tasks preferring destination LLC, tag the
migration type as the newly introduced migrate_llc_task. During load
balancing, each runqueue within the busiest preferred-LLC sched_group
is checked, and the runqueue with the highest number of tasks preferring
to run on the destination CPU is chosen as the busiest runqueue.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ab3d1239d6e4..42222364ad9c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9711,7 +9711,8 @@ enum migration_type {
 	migrate_load = 0,
 	migrate_util,
 	migrate_task,
-	migrate_misfit
+	migrate_misfit,
+	migrate_llc_task
 };
 
 #define LBF_ALL_PINNED	0x01
@@ -10143,6 +10144,15 @@ static int detach_tasks(struct lb_env *env)
 			env->imbalance -= util;
 			break;
 
+		case migrate_llc_task:
+			/*
+			 * Since can_migrate_task() succeed, when we reach here, it means that p
+			 * can be migrated even if dst_cpu is not p's preferred_llc, because there
+			 * are no idle cores for p to do in-llc load balance.
+			 */
+			env->imbalance--;
+			break;
+
 		case migrate_task:
 			env->imbalance--;
 			break;
@@ -11779,6 +11789,15 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 		return;
 	}
 
+#ifdef CONFIG_SCHED_CACHE
+	if (busiest->group_llc_balance) {
+		/* Move a task that prefer local LLC */
+		env->migration_type = migrate_llc_task;
+		env->imbalance = 1;
+		return;
+	}
+#endif
+
 	if (busiest->group_type == group_imbalanced) {
 		/*
 		 * In the group_imb case we cannot rely on group-wide averages
@@ -12087,6 +12106,10 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 	struct rq *busiest = NULL, *rq;
 	unsigned long busiest_util = 0, busiest_load = 0, busiest_capacity = 1;
 	unsigned int busiest_nr = 0;
+#ifdef CONFIG_SCHED_CACHE
+	unsigned int busiest_pref_llc = 0;
+	int dst_llc;
+#endif
 	int i;
 
 	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
@@ -12195,6 +12218,16 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 			}
 			break;
 
+		case migrate_llc_task:
+#ifdef CONFIG_SCHED_CACHE
+			dst_llc = llc_idx(env->dst_cpu);
+			if (!cpus_share_cache(env->dst_cpu, rq->cpu) &&
+			    busiest_pref_llc < rq->nr_pref_llc[dst_llc]) {
+				busiest_pref_llc = rq->nr_pref_llc[dst_llc];
+				busiest = rq;
+			}
+#endif
+			break;
 		case migrate_task:
 			if (busiest_nr < nr_running) {
 				busiest_nr = nr_running;
@@ -12377,6 +12410,8 @@ static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd
 	case migrate_misfit:
 		__schedstat_add(sd->lb_imbalance_misfit[idle], env->imbalance);
 		break;
+	case migrate_llc_task:
+		break;
 	}
 }
 
-- 
2.32.0

