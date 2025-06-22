Received: from out187-16.us.a.mail.aliyun.com (out187-16.us.a.mail.aliyun.com [47.90.187.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C1167DB7
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750588671; cv=none; b=OhIBuaNVj72qlaTd86YFZnCZ2eyxDDX3IMO+qhwRzgr4s4gZBCGETEtjL+s0mkPUFNbCcbLmrBcRS1EeYtwSO/Shkc2l10LA1vnO2uvnHHl+EvmI7zxszhCwzduw14269U4cQT6muqJ6Vl8gNDlNSHxZ5IXzoCnc9T5me8etX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750588671; c=relaxed/simple;
	bh=qg1XKwHQlbCxjbJcFtDomYFzmaLIf8X48YrHz/fk7xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEhOdOgomP9bOiTVZFN6NhVvKv3FLsJ/Zk1uYTrcCuLw3Cqu8xiiTxXsqunCtKbUFM3G76tNFK7PEgH5dOn3vJDPsMVvbDVCwEJyU4POtc3tzQ+QoNYZwItTJ/v/eouVtFL8NGkt1pVDxY+1kZ6TkWv1wXNYbR09Cw9bc7JhGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=TUEyoQZM; arc=none smtp.client-ip=47.90.187.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="TUEyoQZM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750588655; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/7LRzQ8TWi10km0kHT15tcByLrhCWbZ/e1nFzvxOMgw=;
	b=TUEyoQZMMe5oNICC+Bq0gTmUuoJQLAPgu0NjAxSz7/tR/crhl8F0GorSVgdOFrBtmhD+YpDQtifquqBWT3SYYCsxOMGJZxaRC4L1GxZVfU/ZFW87//Q1UDPfFzXa2b0W+gingeJJlwtCcYPSFeUNXAz0mAOWQmyCOgrFBSOyEPA=
Received: from localhost(mailfrom:henry.hj@antgroup.com fp:SMTPD_---.dTG5la5_1750584990 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 22 Jun 2025 17:36:30 +0800
From: "Henry Huang" <henry.hj@antgroup.com>
To: changwoo@igalia.com,
	arighi@nvidia.com,
	tj@kernel.org,
	void@manifault.com
Cc: "=?UTF-8?B?6LCI6Ym06ZSL?=" <henry.tjf@antgroup.com>,
  "=?UTF-8?B?WWFuIFlhbihjYWlsaW5nKQ==?=" <yanyan.yan@antgroup.com>,
   <linux-kernel@vger.kernel.org>,
   <sched-ext@lists.linux.dev>,
  "Henry Huang" <henry.hj@antgroup.com>
Subject: [PATCH v1] sched_ext: include SCX_OPS_TRACK_MIGRATION
Date: Sun, 22 Jun 2025 17:36:21 +0800
Message-ID: <20250622093621.1669-2-henry.hj@antgroup.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250622093621.1669-1-henry.hj@antgroup.com>
References: <20250622093621.1669-1-henry.hj@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some BPF-schedulers, they should do something when
task is doing migration, such as updating per-cpu map.
If SCX_OPS_TRACK_MIGRATION is set, runnable/quiescent
would be called whether task is doing migration or not.

Signed-off-by: Henry Huang <henry.hj@antgroup.com>
---
 kernel/sched/ext.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b498d86..9b05bb9 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -161,6 +161,12 @@ enum scx_ops_flags {
 	SCX_OPS_BUILTIN_IDLE_PER_NODE	= 1LLU << 6,
 
 	/*
+	 * If set, runnable/quiescent ops would be called whether the task is
+	 * doing migration or not.
+	 */
+	SCX_OPS_TRACK_MIGRATION		= 1LLU << 7,
+
+	/*
 	 * CPU cgroup support flags
 	 */
 	SCX_OPS_HAS_CGROUP_WEIGHT	= 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
@@ -172,6 +178,7 @@ enum scx_ops_flags {
 					  SCX_OPS_ALLOW_QUEUED_WAKEUP |
 					  SCX_OPS_SWITCH_PARTIAL |
 					  SCX_OPS_BUILTIN_IDLE_PER_NODE |
+					  SCX_OPS_TRACK_MIGRATION |
 					  SCX_OPS_HAS_CGROUP_WEIGHT,
 
 	/* high 8 bits are internal, don't include in SCX_OPS_ALL_FLAGS */
@@ -2390,7 +2397,8 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	rq->scx.nr_running++;
 	add_nr_running(rq, 1);
 
-	if (SCX_HAS_OP(sch, runnable) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(sch, runnable) &&
+	    ((sch->ops.flags & SCX_OPS_TRACK_MIGRATION) || !task_on_rq_migrating(p)))
 		SCX_CALL_OP_TASK(sch, SCX_KF_REST, runnable, rq, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
@@ -2482,7 +2490,8 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 		SCX_CALL_OP_TASK(sch, SCX_KF_REST, stopping, rq, p, false);
 	}
 
-	if (SCX_HAS_OP(sch, quiescent) && !task_on_rq_migrating(p))
+	if (SCX_HAS_OP(sch, quiescent) &&
+	    ((sch->ops.flags & SCX_OPS_TRACK_MIGRATION) || !task_on_rq_migrating(p)))
 		SCX_CALL_OP_TASK(sch, SCX_KF_REST, quiescent, rq, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
@@ -5495,6 +5504,11 @@ static int validate_ops(struct scx_sched *sch, const struct sched_ext_ops *ops)
 		return -EINVAL;
 	}
 
+	if ((ops->flags & SCX_OPS_TRACK_MIGRATION) && (!ops->runnable || !ops->quiescent)) {
+		scx_error(sch, "SCX_OPS_TRACK_MIGRATION requires ops.runnable() and ops.quiescent() to be implemented");
+		return -EINVAL;
+	}
+
 	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
 		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
 
-- 
Henry

