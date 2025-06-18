Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9D2FCFE0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270921; cv=none; b=P+N3O5LY+75YpxuXAxCziwrhSLux4hrlWTDJ+f8IcG0rzPNOVsWLmvsBedk/2+jdPdqDw1wzG7atrrNckzm5Yyg74mjwX53XlvX5jdoIe7rAPpy4h3viBerEuO6WUgh96xv+h8Lwf0GEIyOdryyHXJYAAnIgHDvJPZSQuXjuTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270921; c=relaxed/simple;
	bh=v21t2Zwrb1Nh/wAuSkK34PJS3ovpgrP9JoFKO8zGmaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ajQTLgiN8PnOKWjIVod1oKlrsTKQVI7OTOmzFXtG+73wlaVQvWGhqk0WMJJXjNaJRuZH21mpCLXZaDLmAm/qdrOjIx4FzgPZZPymYhkjL6psVeBZGckQhtba+IMm3kDkbtawrmcsQMOZ+Zwe6kb6VuOntBmYomWGuxm13ODEJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNKkiPXx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNKkiPXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270920; x=1781806920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v21t2Zwrb1Nh/wAuSkK34PJS3ovpgrP9JoFKO8zGmaY=;
  b=eNKkiPXxlLeUp9MrxUVzTWIyvBs9ufToarQslgq0bYk5s/czMppb7IvI
   h6f2ZKRMsVlGKRrHwIGJjWC2qE8qaTMXUEdQj3r8D+h0SN43VWG+hMsrT
   RYlk/KgtxAMp9QrgVWboKznJ7vUI8egFwzA9KbPGigmWN87qDwRCRj+PI
   1DVrQqjN70cltKuzihCwLLBClt53KvfL9NiCkywt0JuRcLKIP2iJEokrX
   ajvz3jtkrzeg38383zwJHxSMbB8WBku1/QPExsvxhxX+x84ckOTN+YWR0
   r0W/M6eCut34E/W0ufbrbXos01UbUqSL73VaxS852oWlwl340CVxjghCK
   g==;
X-CSE-ConnectionGUID: WN1cDgRBRjePAqtNlvvThA==
X-CSE-MsgGUID: GG9U87oTRii/aNSvr7x6sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931663"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931663"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:59 -0700
X-CSE-ConnectionGUID: RBeMMmkDTB+RrdOWQJsvcA==
X-CSE-MsgGUID: 9zB/bWW2R3GKVE6WyIDfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960082"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:59 -0700
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
Subject: [RFC patch v3 16/20] sched: Consider LLC locality for active balance
Date: Wed, 18 Jun 2025 11:28:04 -0700
Message-Id: <1ce821178bf178ce841ea94bb8139fd9a197b86b.1750268218.git.tim.c.chen@linux.intel.com>
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

If busiest run queue has only one task, active balance is enlisted
to actually move the task.  However, before moving the task,
we should consider whether we are moving the task from its preferred
LLC.

Don't move the single running task in a run queue to another LLC, if
we are moving it from its desired LLC, or moving it will cause too much
imbalance between the LLCs.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c | 51 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 42222364ad9c..3a8f6fc52055 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12294,10 +12294,43 @@ imbalanced_active_balance(struct lb_env *env)
 	return 0;
 }
 
+#ifdef CONFIG_SCHED_CACHE
+static inline bool
+break_llc_locality(struct lb_env *env)
+{
+	if (!sched_feat(SCHED_CACHE))
+		return 0;
+
+	if (cpus_share_cache(env->src_cpu, env->dst_cpu))
+		return 0;
+	/*
+	 * All tasks want to stay put. Move only if LLC is
+	 * heavily loaded or don't pull a task from its
+	 * preferred CPU if it is the only one running.
+	 */
+	if (env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable &&
+	    (env->src_rq->nr_running <= 1 ||
+	    _get_migrate_hint(env->src_cpu, env->dst_cpu,
+			      0, false) == mig_forbid))
+		return 1;
+
+	return 0;
+}
+#else
+static inline bool
+break_llc_locality(struct lb_env *env)
+{
+	return 0;
+}
+#endif
+
 static int need_active_balance(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
 
+	if (break_llc_locality(env))
+		return 0;
+
 	if (asym_active_balance(env))
 		return 1;
 
@@ -12317,7 +12350,8 @@ static int need_active_balance(struct lb_env *env)
 			return 1;
 	}
 
-	if (env->migration_type == migrate_misfit)
+	if (env->migration_type == migrate_misfit ||
+	    env->migration_type == migrate_llc_task)
 		return 1;
 
 	return 0;
@@ -12762,9 +12796,20 @@ static int active_load_balance_cpu_stop(void *data)
 		goto out_unlock;
 
 	/* Is there any task to move? */
-	if (busiest_rq->nr_running <= 1)
-		goto out_unlock;
+	if (busiest_rq->nr_running <= 1) {
+#ifdef CONFIG_SCHED_CACHE
+		int llc = llc_idx(target_cpu);
 
+		if (!sched_feat(SCHED_CACHE))
+			goto out_unlock;
+
+		if (llc < 0)
+			goto out_unlock;
+		/* don't migrate if task does not prefer target */
+		if (busiest_rq->nr_pref_llc[llc] < 1)
+#endif
+			goto out_unlock;
+	}
 	/*
 	 * This condition is "impossible", if it occurs
 	 * we need to fix it. Originally reported by
-- 
2.32.0

