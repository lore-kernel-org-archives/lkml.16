Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E492F4A06
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270909; cv=none; b=OfHuG3LBktIYQ17A0wezDcBygFYIqQGnVMGi+J74hfqxXToXJOkcfe/QAshk8VQr3iHhepGalcue2+Gh9lXUo6YIap3bPlMoXEKyEF/uKj/HOqBRTfPfSFVzKLCzuG1BPrKVWm/9VqF9CtRE/PxcAkoHlqkKJK38pOqYBIlTkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270909; c=relaxed/simple;
	bh=bDfBIxEdnv+hYygaV+u3o+TV5wT/EFTyHlaYTI7nFpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UKMgGxYucBL+0GlD7p3d/Zom0U72DS+gR1yhIB67WE5LMqkpy3l5lREKGfo/WMbkvVplPyT3O4LIWAcMuzVNNgwy1U2yRPrfXUYrbe55jB5Ido4zUO7riYoUV38Tur4ZomgT4/03W4QWQnIXvK43x1VsVDq4rpLILrJkc0MLRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPYgHNmn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPYgHNmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270907; x=1781806907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bDfBIxEdnv+hYygaV+u3o+TV5wT/EFTyHlaYTI7nFpw=;
  b=ZPYgHNmnGkft4GpxmGCyeKoUkQ215gIizexSy0kMiXa/NTiZo/gGlfyT
   kUMF1ZHUyeWicU44K6z5ga9ude/u1b7dOInRSMexJBl7xg2wWzt43htgN
   0SZD8bKm1Psl9VbJQzK0J75KsgRFBxuGgnNUxw1QIktunEAn4cwXF97df
   RDtco1RU/rA4YaqRY//20xf5f/vHjT5XptItMKZ8mzjiE8ikBvrqvp2HQ
   6dxxSgUzxm0LyOJqknyMhoG24RtRQixTDOHtv0zR/a3Etu3Yfy4fbLcgR
   4fJb3VSDSPIj3CLVFTTh/id7nCY7gUsIPDC9MnN4GNRnUeVr8jGQaTFWv
   Q==;
X-CSE-ConnectionGUID: YR1pxp3JSTSWW1r6sY2fCw==
X-CSE-MsgGUID: N3vXqxYJSWukJNGgS8J6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931471"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:47 -0700
X-CSE-ConnectionGUID: 4Lza8fDiSzyAbCqKOh54VQ==
X-CSE-MsgGUID: sumQVaeBRRG5ZeV1Vg8XHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180959777"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:21:46 -0700
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
Subject: [RFC patch v3 02/20] sched: Several fixes for cache aware scheduling
Date: Wed, 18 Jun 2025 11:27:50 -0700
Message-Id: <d73418022de76dab9f60c0c5432d783b3b2833dc.1750268218.git.tim.c.chen@linux.intel.com>
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

1. Fix compile error on percpu allocation.
2. Enqueue to the target CPU rather than the current CPU.
3. NULL LLC sched domain check(Libo Chen).
4. Introduce sched feature SCHED_CACHE to control cache aware scheduling
5. Fix unsigned occupancy initialization to -1.
6. If there is only 1 thread in the process, no need to enable cache
   awareness
7. Add __maybe_unused to __migrate_degrades_locality() to
   avoid compile warnings.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 include/linux/mm_types.h |  4 ++--
 kernel/sched/fair.c      | 27 ++++++++++++++++-----------
 kernel/sched/features.h  |  1 +
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 013291c6aaa2..9de4a0a13c4d 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1411,11 +1411,11 @@ static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumas
 #endif /* CONFIG_SCHED_MM_CID */
 
 #ifdef CONFIG_SCHED_CACHE
-extern void mm_init_sched(struct mm_struct *mm, struct mm_sched *pcpu_sched);
+extern void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *pcpu_sched);
 
 static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
 {
-	struct mm_sched *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
+	struct mm_sched __percpu *pcpu_sched = alloc_percpu_noprof(struct mm_sched);
 	if (!pcpu_sched)
 		return -ENOMEM;
 
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index df7d4a324fbe..89db97f8ef02 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1175,7 +1175,7 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
 #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
 #define EPOCH_OLD	5		/* 50 ms */
 
-void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
+void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
 {
 	unsigned long epoch;
 	int i;
@@ -1186,7 +1186,7 @@ void mm_init_sched(struct mm_struct *mm, struct mm_sched *_pcpu_sched)
 
 		pcpu_sched->runtime = 0;
 		pcpu_sched->epoch = epoch = rq->cpu_epoch;
-		pcpu_sched->occ = -1;
+		pcpu_sched->occ = 0;
 	}
 
 	raw_spin_lock_init(&mm->mm_sched_lock);
@@ -1254,7 +1254,7 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	if (!mm || !mm->pcpu_sched)
 		return;
 
-	pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
+	pcpu_sched = per_cpu_ptr(p->mm->pcpu_sched, cpu_of(rq));
 
 	scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
 		__update_mm_sched(rq, pcpu_sched);
@@ -1264,12 +1264,14 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	}
 
 	/*
-	 * If this task hasn't hit task_cache_work() for a while, invalidate
+	 * If this task hasn't hit task_cache_work() for a while, or it
+	 * has only 1 thread, invalidate
 	 * it's preferred state.
 	 */
-	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
+	if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD ||
+	    get_nr_threads(p) <= 1) {
 		mm->mm_sched_cpu = -1;
-		pcpu_sched->occ = -1;
+		pcpu_sched->occ = 0;
 	}
 }
 
@@ -1286,9 +1288,6 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 
 	guard(raw_spinlock)(&mm->mm_sched_lock);
 
-	if (mm->mm_sched_epoch == rq->cpu_epoch)
-		return;
-
 	if (work->next == work) {
 		task_work_add(p, work, TWA_RESUME);
 		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
@@ -1322,6 +1321,9 @@ static void task_cache_work(struct callback_head *work)
 			unsigned long occ, m_occ = 0, a_occ = 0;
 			int m_cpu = -1, nr = 0, i;
 
+			if (!sd)
+				continue;
+
 			for_each_cpu(i, sched_domain_span(sd)) {
 				occ = fraction_mm_sched(cpu_rq(i),
 							per_cpu_ptr(mm->pcpu_sched, i));
@@ -8801,6 +8803,9 @@ static int select_cache_cpu(struct task_struct *p, int prev_cpu)
 	struct mm_struct *mm = p->mm;
 	int cpu;
 
+	if (!sched_feat(SCHED_CACHE))
+		return prev_cpu;
+
 	if (!mm || p->nr_cpus_allowed == 1)
 		return prev_cpu;
 
@@ -9555,7 +9560,7 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 		return 0;
 
 #ifdef CONFIG_SCHED_CACHE
-	if (p->mm && p->mm->pcpu_sched) {
+	if (sched_feat(SCHED_CACHE) && p->mm && p->mm->pcpu_sched) {
 		/*
 		 * XXX things like Skylake have non-inclusive L3 and might not
 		 * like this L3 centric view. What to do about L2 stickyness ?
@@ -9633,7 +9638,7 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 }
 
 #else
-static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
+static __maybe_unused long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle)
 {
 	return 0;
 }
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 3c12d9f93331..d2af7bfd36bf 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -87,6 +87,7 @@ SCHED_FEAT(TTWU_QUEUE, true)
  */
 SCHED_FEAT(SIS_UTIL, true)
 
+SCHED_FEAT(SCHED_CACHE, true)
 /*
  * Issue a WARN when we do multiple update_rq_clock() calls
  * in a single rq->lock section. Default disabled because the
-- 
2.32.0

