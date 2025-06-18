Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378672FBFE4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270916; cv=none; b=e05IFwV/MLqo2ClgaOGWLNSlY10NaanqCNFgdhzJHiSJKN+sh3Zlln5UdTmioRlRhRjp/nMlzDaeMob8JkL6Vnprcb7T4E++++CTqUtUCV4CFP4PSK0vw5A7hPHtk/OEkDT1g3ZfjDaU9iC9y5xW8mEtVA1goM0jAs9Hl7McPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270916; c=relaxed/simple;
	bh=WuCB5SIKo2iM8nX5ebWteeRjxdPAXbYteS+EwA2pE0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oAGm3igrNrOpxMrHQQoLXScf+6Qhzs+QT0b8NDUn/Z1Lg6wRKdWBLm3Z8cBcgmvttwNrNTS1WRshJkfEt9buiwj9p9r7b5+8Pgfu5tiqdhoABS40DvzWpr6d+nOBznhgOieUV5aoD2LXxBNoP4rNF0a9Ez39F7B7HtKZvpqaKlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHLCwYLq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHLCwYLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270915; x=1781806915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WuCB5SIKo2iM8nX5ebWteeRjxdPAXbYteS+EwA2pE0w=;
  b=NHLCwYLqVTRJAuEFNcV41R7MnvuS9z2QmW5K059zPETnEpDlEodn/VG8
   IZzAuJmXE4uhiAbjaKpwaneVSv8DpipBx12ro57h14bYGeGVOnAEqtRC0
   MYOOelRwA6HB65s8wwQlNHjKsFH8Px5CvzkVOr9zfB2+Cf3ZCiBWNjFvJ
   ia6JfMeXbhgywU5X/aCFqFVuO0i7U1S4e/3PZ/4lISImQE5ptcYQvqsVE
   7frWf0qbM3P8Z3xratwf4AuiFQOa5n18Y0HGvqXbmBvbVIX5w1NHG2f4g
   7u4XdLdk1q19T6udH+vKwbKmJFB9NiWgUD4pYJZpJbmpavs+mwAM+IGJz
   Q==;
X-CSE-ConnectionGUID: ABRohcKYRLuwXUvFn04ETg==
X-CSE-MsgGUID: ajqbr60WT6mWJDBrVQIQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931579"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:54 -0700
X-CSE-ConnectionGUID: wKSilpu8SRKhyBsxbDtmNA==
X-CSE-MsgGUID: LTGYQY+lTBaZzmctTTPKPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959948"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:53 -0700
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
Subject: [RFC patch v3 10/20] sched: Calculate the number of tasks that have LLC preference on a runqueue
Date: Wed, 18 Jun 2025 11:27:58 -0700
Message-Id: <0664be8a3e805ed93eb930131951b1a84cebed66.1750268218.git.tim.c.chen@linux.intel.com>
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

Track for each run queue, the number of tasks that have a LLC preference
and how many of those tasks are running in its preferred LLC.  This is
similar to nr_numa_running and nr_preferred_running for NUMA balance,
and will be used by the cache-aware load balancing in subsequent patches.

Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/core.c  | 12 ++++++++++++
 kernel/sched/fair.c  | 42 +++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h |  7 +++++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d9c3e75f79d1..34056eb79ef2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -498,6 +498,18 @@ void __trace_set_current_state(int state_value)
 }
 EXPORT_SYMBOL(__trace_set_current_state);
 
+#ifdef CONFIG_SMP
+int task_llc(const struct task_struct *p)
+{
+	return per_cpu(sd_llc_id, task_cpu(p));
+}
+#else
+int task_llc(const struct task_struct *p)
+{
+	return 0;
+}
+#endif
+
 /*
  * Serialization rules:
  *
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cc804a8c7061..88ff47194faa 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1195,6 +1195,18 @@ static inline int llc_idx(int cpu)
 	return per_cpu(sd_llc_idx, cpu);
 }
 
+static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
+{
+	rq->nr_llc_running += (p->preferred_llc != -1);
+	rq->nr_pref_llc_running += (p->preferred_llc == task_llc(p));
+}
+
+static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
+{
+	rq->nr_llc_running -= (p->preferred_llc != -1);
+	rq->nr_pref_llc_running -= (p->preferred_llc == task_llc(p));
+}
+
 void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
 {
 	unsigned long epoch;
@@ -1298,8 +1310,11 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	if (mm->mm_sched_cpu != -1)
 		mm_sched_llc = per_cpu(sd_llc_id, mm->mm_sched_cpu);
 
-	if (p->preferred_llc != mm_sched_llc)
+	if (p->preferred_llc != mm_sched_llc) {
+		account_llc_dequeue(rq, p);
 		p->preferred_llc = mm_sched_llc;
+		account_llc_enqueue(rq, p);
+	}
 }
 
 static void task_tick_cache(struct rq *rq, struct task_struct *p)
@@ -1400,6 +1415,14 @@ void init_sched_mm(struct task_struct *p)
 	work->next = work;
 }
 
+void reset_llc_stats(struct rq *rq)
+{
+	if (rq->nr_llc_running)
+		rq->nr_llc_running = 0;
+
+	rq->nr_pref_llc_running = 0;
+}
+
 #else
 
 static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
@@ -1410,6 +1433,17 @@ void init_sched_mm(struct task_struct *p) { }
 
 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
 
+static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
+{
+}
+
+static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
+{
+}
+
+void reset_llc_stats(struct rq *rq)
+{
+}
 #endif
 
 static inline
@@ -3939,6 +3973,7 @@ account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
 		struct rq *rq = rq_of(cfs_rq);
 
 		account_numa_enqueue(rq, task_of(se));
+		account_llc_enqueue(rq, task_of(se));
 		list_add(&se->group_node, &rq->cfs_tasks);
 	}
 #endif
@@ -3952,10 +3987,15 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
 #ifdef CONFIG_SMP
 	if (entity_is_task(se)) {
 		account_numa_dequeue(rq_of(cfs_rq), task_of(se));
+		account_llc_dequeue(rq_of(cfs_rq), task_of(se));
 		list_del_init(&se->group_node);
 	}
 #endif
 	cfs_rq->nr_queued--;
+
+	/* safeguard? */
+	if (!parent_entity(se) && !cfs_rq->nr_queued)
+		reset_llc_stats(rq_of(cfs_rq));
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 74eb2f3615aa..6c83a71ac8ca 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1104,6 +1104,10 @@ struct rq {
 	unsigned int		nr_preferred_running;
 	unsigned int		numa_migrate_on;
 #endif
+#ifdef CONFIG_SCHED_CACHE
+	unsigned int		nr_pref_llc_running;
+	unsigned int		nr_llc_running;
+#endif
 #ifdef CONFIG_NO_HZ_COMMON
 #ifdef CONFIG_SMP
 	unsigned long		last_blocked_load_update_tick;
@@ -1948,6 +1952,9 @@ init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 
 #endif /* !CONFIG_NUMA_BALANCING */
 
+extern void reset_llc_stats(struct rq *rq);
+extern int task_llc(const struct task_struct *p);
+
 #ifdef CONFIG_SMP
 
 static inline void
-- 
2.32.0

