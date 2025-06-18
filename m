Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF22FD899
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270924; cv=none; b=rqcnz4lr519vfb2X2M9DeLf5O+erdaRAJSoZ2E9S2odeoi76dMp/OZU1NB58Qjs+uncaH3qLdMqonjZ3kQl6htfGCrXwxMWgW2YZT8y6e/FYDEkDc76bmoSAGQbtAHi6zdd/a0QMbqOAiPFDTuQ/Av7Zd2Z3POZHWg4NK1E6gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270924; c=relaxed/simple;
	bh=RBEoEDu2A+FwLyh++5jokg1I7TUhNUbkFf08/S4koCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u++l74ct5wI88qe+ZhTxahgVxibbraZWIJUXAiGrfYKDyKJFt9lgn/tcRZtplKvjvmasXpdfWkYumF3dDOdoABJmyCFInhfV661Idkc/VE7bFkTegUBPg18Oyk856hhDCaV4uOx+JU6Wj+pkcN21wugnWmWN1myHTXggm5UEej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxZqIyLs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxZqIyLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750270923; x=1781806923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RBEoEDu2A+FwLyh++5jokg1I7TUhNUbkFf08/S4koCY=;
  b=OxZqIyLsJSroJ2i9MdsrROxH70E3NsG6kvAKifMPTRvyyrGMmXsUYxD3
   CPzVxg8vQa7ptoVtXf4Q8V1g+8odAq77fXL+wB1Yz3cOwa5oIFmdnB5YW
   BortfRVvhpa+xJaYKcO1/iYGTjoGzZlBvQ4DqinF+ijFvIH3FXFHUY7Yw
   dnqNv+RspKaZf5GkEERusnRttKQTb+Ybdex2YDNmVMcMaLi3YqDVwQEd+
   zvko7J7nf4iHqzRFD8LqvQWYwg1aAy+yQ4qBaHEh90PM1XJHSY8jbNW6c
   NQxsij/EBLJiRtqClKTlBCTYmaEChOOO3OgR1tIMqHZLc+QmYryVKIQJ7
   Q==;
X-CSE-ConnectionGUID: DbGqwajpS0SQ1kimRCqNOw==
X-CSE-MsgGUID: IxguJ0uxQf2FmLjSrT5dxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63931707"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63931707"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:22:02 -0700
X-CSE-ConnectionGUID: 55fSL6zAQZGOckEnYdnVsw==
X-CSE-MsgGUID: LUEEbBOqRk6qNZaG5v1xSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180960148"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2025 11:22:02 -0700
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
Subject: [RFC patch v3 19/20] sched: Introduce SCHED_CACHE_LB to control cache aware load balance
Date: Wed, 18 Jun 2025 11:28:07 -0700
Message-Id: <ac0e58b587dcd1e3ebe7a7a97973c5763d02a5f8.1750268218.git.tim.c.chen@linux.intel.com>
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

Introduce the SCHED_CACHE_LB sched feature to enable or disable
cache aware load balance in the schduler.

Co-developed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
---
 kernel/sched/fair.c     | 18 ++++++++++--------
 kernel/sched/features.h |  1 +
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e342524481ed..af742601f2d7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9982,7 +9982,7 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 		return 1;
 
 #ifdef CONFIG_SCHED_CACHE
-	if (sched_feat(SCHED_CACHE) &&
+	if (sched_feat(SCHED_CACHE) && sched_feat(SCHED_CACHE_LB) &&
 	    get_migrate_hint(env->src_cpu, env->dst_cpu, p) == mig_forbid)
 		return 0;
 #endif
@@ -10068,7 +10068,7 @@ static struct list_head
 	LIST_HEAD(no_pref_llc);
 	LIST_HEAD(pref_other_llc);
 
-	if (!sched_feat(SCHED_CACHE))
+	if (!sched_feat(SCHED_CACHE) || !sched_feat(SCHED_CACHE_LB))
 		return tasks;
 
 	if (cpus_share_cache(env->dst_cpu, env->src_cpu))
@@ -10253,7 +10253,8 @@ static int detach_tasks(struct lb_env *env)
 		 * The tasks have already been sorted by order_tasks_by_llc(),
 		 * they are tasks that prefer the current LLC.
 		 */
-		if (sched_feat(SCHED_CACHE) && p->preferred_llc != -1 &&
+		if (sched_feat(SCHED_CACHE) && sched_feat(SCHED_CACHE_LB) &&
+		    p->preferred_llc != -1 &&
 		    llc_id(env->src_cpu) == p->preferred_llc)
 			break;
 #endif
@@ -10910,7 +10911,7 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 	struct sched_domain *child = env->sd->child;
 	int llc;
 
-	if (!sched_feat(SCHED_CACHE))
+	if (!sched_feat(SCHED_CACHE) || !sched_feat(SCHED_CACHE_LB))
 		return false;
 
 	if (env->sd->flags & SD_SHARE_LLC)
@@ -11021,7 +11022,8 @@ static void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
 	struct sched_domain *sd = env->sd->child;
 	struct sched_domain_shared *sd_share;
 
-	if (!sched_feat(SCHED_CACHE) || env->idle == CPU_NEWLY_IDLE)
+	if (!sched_feat(SCHED_CACHE) || env->idle == CPU_NEWLY_IDLE ||
+	    !sched_feat(SCHED_CACHE_LB))
 		return;
 
 	/* only care the sched domain that spans 1 LLC */
@@ -11083,7 +11085,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 			*sg_overutilized = 1;
 
 #ifdef CONFIG_SCHED_CACHE
-		if (sched_feat(SCHED_CACHE)) {
+		if (sched_feat(SCHED_CACHE) && sched_feat(SCHED_CACHE_LB)) {
 			int j;
 
 			for (j = 0; j < max_llcs; ++j)
@@ -12368,7 +12370,7 @@ imbalanced_active_balance(struct lb_env *env)
 static inline bool
 break_llc_locality(struct lb_env *env)
 {
-	if (!sched_feat(SCHED_CACHE))
+	if (!sched_feat(SCHED_CACHE) || !sched_feat(SCHED_CACHE_LB))
 		return 0;
 
 	if (cpus_share_cache(env->src_cpu, env->dst_cpu))
@@ -12870,7 +12872,7 @@ static int active_load_balance_cpu_stop(void *data)
 #ifdef CONFIG_SCHED_CACHE
 		int llc = llc_idx(target_cpu);
 
-		if (!sched_feat(SCHED_CACHE))
+		if (!sched_feat(SCHED_CACHE) || !sched_feat(SCHED_CACHE_LB))
 			goto out_unlock;
 
 		if (llc < 0)
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index d2af7bfd36bf..11dbd74cd365 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -88,6 +88,7 @@ SCHED_FEAT(TTWU_QUEUE, true)
 SCHED_FEAT(SIS_UTIL, true)
 
 SCHED_FEAT(SCHED_CACHE, true)
+SCHED_FEAT(SCHED_CACHE_LB, true)
 /*
  * Issue a WARN when we do multiple update_rq_clock() calls
  * in a single rq->lock section. Default disabled because the
-- 
2.32.0

