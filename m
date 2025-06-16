Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E491898E8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104807; cv=none; b=kt1kE07YbTRQeFiYp/Voy7FRX73jRlHF3V+MxEvtByM0KUa2GdAaF/XjTAhffdW+r1jfCCY7UjfM9K/Zcqec6N9bAzigFlboFzgOdXiaVzByA+x/SMYvZJnT7kC1b/BJOnkmKrTWC0OtP5xoSF9edlnilSJBfsnryLgp3veNIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104807; c=relaxed/simple;
	bh=rm2cm6leHzxDp92hNDKcjjotXJWyVbcCrZHVpdjT+Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6aEGSNuiaaOHkDwWLlR8pMWrVdDNynKXh+9W5+IxjVJGbpsq3o6wdmUgZWiOQSB13H8ZpPFGEV8ZVsZjFiqAYKimXR6qB0zgO4HSTBxw7RRiFW/ILMxnbZgcCG9qfO9pf1QTTIv/vy9b4/EWaWPn0yIDNVpI2s+boRlqmVpHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma10h3nb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma10h3nb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA0CC4CEEA;
	Mon, 16 Jun 2025 20:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750104806;
	bh=rm2cm6leHzxDp92hNDKcjjotXJWyVbcCrZHVpdjT+Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ma10h3nbgcMypzEjwGvkb/8ehPfXSj1zZzZgZjxydI5QqZYV7X6pEQSd8ocnBDQlc
	 H7eXIwC/MFY16MDO4Zfmkpy5pwlLbhDYIbgm8BE/qthcjRu1KqZky30RTclqDcI4+m
	 TBfwMOm1rzbX8OFoTuVw+kedRfR7W2WQrui4QSrZonw1rujNRsQ1HWrmY6qWjBeNpB
	 wGfw4YbMZB5VUe3OZji1pOx8ZKRiK2/0/QGjGzWbIbD4V4ibx8tl4wzjK/hfqwB0Rq
	 WZJ87Y4RjMNggy86AGcghPRoYqVcKhBXHz3SHjBvyD/UdJO9pcn5bVJJ9twXFORCJE
	 9dLJh0g/u/L4g==
Date: Mon, 16 Jun 2025 10:13:25 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 2/2 sched_ext/for-6.16-fixes] sched_ext, sched/core: Don't
 call scx_group_set_weight() prematurely from sched_create_group()
Message-ID: <aFB65Zfis1iBvKoc@slm.duckdns.org>
References: <aEyy27BecPPHDWHc@slm.duckdns.org>
 <aEyzhBAl5zkP6Ku-@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEyzhBAl5zkP6Ku-@slm.duckdns.org>

During task_group creation, sched_create_group() calls
scx_group_set_weight() with CGROUP_WEIGHT_DFL to initialize the sched_ext
portion. This is premature and ends up calling ops.cgroup_set_weight() with
an incorrect @cgrp before ops.cgroup_init() is called.

sched_create_group() should just initialize SCX related fields in the new
task_group. Fix it by factoring out scx_tg_init() from sched_init() and
making sched_create_group() call that function instead of
scx_group_set_weight().

v2: Retain CONFIG_EXT_GROUP_SCHED ifdef in sched_init() as removing it leads
    to build failures on !CONFIG_GROUP_SCHED configs.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 819513666966 ("sched_ext: Add cgroup support")
Cc: stable@vger.kernel.org # v6.12+
---
 kernel/sched/core.c |    4 ++--
 kernel/sched/ext.c  |    5 +++++
 kernel/sched/ext.h  |    2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8437,7 +8437,7 @@ void __init sched_init(void)
 		init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 #ifdef CONFIG_EXT_GROUP_SCHED
-		root_task_group.scx_weight = CGROUP_WEIGHT_DFL;
+		scx_tg_init(&root_task_group);
 #endif /* CONFIG_EXT_GROUP_SCHED */
 #ifdef CONFIG_RT_GROUP_SCHED
 		root_task_group.rt_se = (struct sched_rt_entity **)ptr;
@@ -8872,7 +8872,7 @@ struct task_group *sched_create_group(st
 	if (!alloc_rt_sched_group(tg, parent))
 		goto err;
 
-	scx_group_set_weight(tg, CGROUP_WEIGHT_DFL);
+	scx_tg_init(tg);
 	alloc_uclamp_sched_group(tg, parent);
 
 	return tg;
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4056,6 +4056,11 @@ bool scx_can_stop_tick(struct rq *rq)
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
@@ -95,6 +95,7 @@ static inline void scx_update_idle(struc
 
 #ifdef CONFIG_CGROUP_SCHED
 #ifdef CONFIG_EXT_GROUP_SCHED
+void scx_tg_init(struct task_group *tg);
 int scx_tg_online(struct task_group *tg);
 void scx_tg_offline(struct task_group *tg);
 int scx_cgroup_can_attach(struct cgroup_taskset *tset);
@@ -104,6 +105,7 @@ void scx_cgroup_cancel_attach(struct cgr
 void scx_group_set_weight(struct task_group *tg, unsigned long cgrp_weight);
 void scx_group_set_idle(struct task_group *tg, bool idle);
 #else	/* CONFIG_EXT_GROUP_SCHED */
+static inline void scx_tg_init(struct task_group *tg) {}
 static inline int scx_tg_online(struct task_group *tg) { return 0; }
 static inline void scx_tg_offline(struct task_group *tg) {}
 static inline int scx_cgroup_can_attach(struct cgroup_taskset *tset) { return 0; }
