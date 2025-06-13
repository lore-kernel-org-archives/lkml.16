Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB18F6C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857157; cv=none; b=bFxOwGHMNqRgzfyd3obGu5Kz5hB6HvKdBFJpifJRXIREBIxWWNnXpeKn/TRqu+uNv3dXrHJoQJZB69s7aD6EM7h9q9+zeTXN/+8izVN4NrdxqUfN7uMY4bNKYixhB4vP40v4WpCIqw9Bt9cpL+sIh24PA8t41JxnhZ7uXgx7HOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857157; c=relaxed/simple;
	bh=IEXN+n5qdOk1V2msHLry4HZSsSFYxaYDfiuyJL9kEN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPslikIFBcFykjC9qiCxXNQueXSyPxnYxvea5vQZu6ts6yh8grcDn3ywXdHiwuub9bxQdpbbvEaNmGxlaBH0qdqdxrBooOPdGEGtBvTwLI6PywBpQ8D2O2Umd6vT9LQK+9Y2iyDMuM/gWj+rd9ei1grj+uN8oiH3/tt7tO0HkkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fqxci/jt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fqxci/jt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D166C4CEE3;
	Fri, 13 Jun 2025 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749857157;
	bh=IEXN+n5qdOk1V2msHLry4HZSsSFYxaYDfiuyJL9kEN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fqxci/jtE8dSY+VbfwQDsuTR/y7+u89TK5XEOk/silkA5ZYPWKkU40oJFRAw1H3wA
	 yeDwgnf1jWM1JyuN57+pGWTXLgf/UK5B69sbErIH2ab1XE5dqRRnLSn30rs33Zgpeg
	 VWBJNM4xdv/SonSj1OR/0SJv62VguUVUtNGtT6i9erdWqOj8CbcWSDv9gDRAXXE7id
	 Z0dEiRVQvoLPmT1rc2Fhlu+uWMQSsYBIRO5BzIAMituWGwHgmP4dz4Xqbzesbk8Bex
	 4f2oDoQuq5q97DOFuV/hOluez42AiPptOtUWGY1rRdqH5/oSsTj15f6SywOkWtN3Zq
	 oG5AH6sE1wecA==
Date: Fri, 13 Jun 2025 13:25:56 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 2/2 sched_ext/for-6.16-fixes] sched_ext, sched/core: Don't
 call scx_group_set_weight() prematurely from sched_create_group()
Message-ID: <aEyzhBAl5zkP6Ku-@slm.duckdns.org>
References: <aEyy27BecPPHDWHc@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEyy27BecPPHDWHc@slm.duckdns.org>

During task_group creation, sched_create_group() calls
scx_group_set_weight() with CGROUP_WEIGHT_DFL to initialize the sched_ext
portion. This is premature and ends up calling ops.cgroup_set_weight() with
an incorrect @cgrp before ops.cgroup_init() is called.

sched_create_group() should just initialize SCX related fields in the new
task_group. Fix it by factoring out scx_tg_init() from sched_init() and
making sched_create_group() call that function instead of
scx_group_set_weight().

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 819513666966 ("sched_ext: Add cgroup support")
Cc: stable@vger.kernel.org # v6.12+
---
Ingo, Peter, while this touches kernel/sched/core.c, the changes are trivial
and only affect sched_ext. I'm planning to route it through
sched_ext/for-6.14-fixes. Please holler if you want it routed through tip.

Thanks.

 kernel/sched/core.c |    9 ++++-----
 kernel/sched/ext.c  |    5 +++++
 kernel/sched/ext.h  |    2 ++
 3 files changed, 11 insertions(+), 5 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8544,17 +8544,16 @@ void __init sched_init(void)
 		root_task_group.shares = ROOT_TASK_GROUP_LOAD;
 		init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
 #endif /* CONFIG_FAIR_GROUP_SCHED */
-#ifdef CONFIG_EXT_GROUP_SCHED
-		root_task_group.scx_weight = CGROUP_WEIGHT_DFL;
-#endif /* CONFIG_EXT_GROUP_SCHED */
+
 #ifdef CONFIG_RT_GROUP_SCHED
 		root_task_group.rt_se = (struct sched_rt_entity **)ptr;
 		ptr += nr_cpu_ids * sizeof(void **);
 
 		root_task_group.rt_rq = (struct rt_rq **)ptr;
 		ptr += nr_cpu_ids * sizeof(void **);
-
 #endif /* CONFIG_RT_GROUP_SCHED */
+
+		scx_tg_init(&root_task_group);
 	}
 
 #ifdef CONFIG_SMP
@@ -8985,7 +8984,7 @@ struct task_group *sched_create_group(st
 	if (!alloc_rt_sched_group(tg, parent))
 		goto err;
 
-	scx_group_set_weight(tg, CGROUP_WEIGHT_DFL);
+	scx_tg_init(tg);
 	alloc_uclamp_sched_group(tg, parent);
 
 	return tg;
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4092,6 +4092,11 @@ bool scx_can_stop_tick(struct rq *rq)
 DEFINE_STATIC_PERCPU_RWSEM(scx_cgroup_rwsem);
 static bool scx_cgroup_enabled;
 
+void scx_tg_init(struct task_group *tg)
+{
+	tg->scx_weight = CGROUP_WEIGHT_DFL;
+}
+
 int scx_tg_online(struct task_group *tg)
 {
 	struct scx_sched *sch = scx_root;
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -79,6 +79,7 @@ static inline void scx_update_idle(struc
 
 #ifdef CONFIG_CGROUP_SCHED
 #ifdef CONFIG_EXT_GROUP_SCHED
+void scx_tg_init(struct task_group *tg);
 int scx_tg_online(struct task_group *tg);
 void scx_tg_offline(struct task_group *tg);
 int scx_cgroup_can_attach(struct cgroup_taskset *tset);
@@ -88,6 +89,7 @@ void scx_cgroup_cancel_attach(struct cgr
 void scx_group_set_weight(struct task_group *tg, unsigned long cgrp_weight);
 void scx_group_set_idle(struct task_group *tg, bool idle);
 #else	/* CONFIG_EXT_GROUP_SCHED */
+static inline void scx_tg_init(struct task_group *tg) {}
 static inline int scx_tg_online(struct task_group *tg) { return 0; }
 static inline void scx_tg_offline(struct task_group *tg) {}
 static inline int scx_cgroup_can_attach(struct cgroup_taskset *tset) { return 0; }
