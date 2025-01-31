Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5D1991CD
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307425; cv=none; b=uvrIYHsvvAuGhavHUcl6vGcL1H8ExWMMIGTDcsGK/qTceQhLuSz1nQ0+lcicGutRNChK2M3ezufQNOYV+2jKm6m6AoXl+PKMuV2h0IJvOPne+/RwEyDSBOmI/SI0WH+VTH24F6yqmUPhyC/8lhyYfGv0MrTf+qmqW3a2uOoEuUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307425; c=relaxed/simple;
	bh=mXdQzqXcH4zKY5o96idyYEdbQkIzhskgmnZIKyFbBcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXLjCVi7iPJiPYeTLY8farKTngP18154pFVBKIR7Ece5gxtMtGwcu72XYhS7ht7VGCzaXtRS/MNRy8CzEfWVv4XuBJQhDa1vRCFEfFi00Aj7grmhG2jVycNYW2xYVTOHL2dLlUzPKDPQGf4gjo0eRYtBCaMZUYAAM9MkaLKxNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=sBB+tfEP; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sBB+tfEP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fWzhjrX4qthxXZF2x/QTL0MwkUO4yL8TN0VU/ObpBQc=; b=sBB+tfEPw2hzTaW01saDldMcNM
	3tG1ng38mQlgWrXohbYY5pOMohM0WxQC21K6kWSw16R8lolvTQOqD/hyrRGc78dRrRoBNWkaSxtxw
	x5ygpBqXizOF2NccX72Kzv+N8EMiA951RpmiKY4YpgsBcKROJwzb69srNtYCOaLofgRUl0BOt1NUa
	nlUn9zt2Hi8x+r944MLwRt4y3sf1bZOMWZ4D45syfQvsdcKv6enA9+rOXqa910/z8CjLQy0biw2nf
	pDcd03MclhM7+hFZeS5gfwKhvcCJmW3WTL/3jnBkCWzTINHStf2A8gkwRB6vZF2YkIRuRzPEoczxG
	sWyMU/LA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAK-001Ka9-9w; Fri, 31 Jan 2025 08:10:18 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 07/11] sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
Date: Fri, 31 Jan 2025 16:09:34 +0900
Message-ID: <20250131070938.95551-8-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131070938.95551-1-changwoo@igalia.com>
References: <20250131070938.95551-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a core event, SCX_EV_BYPASS_DISPATCH, which represents how many
tasks have been dispatched in the bypass mode.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 07d54b52e971..236cdb0071eb 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1468,6 +1468,11 @@ struct scx_event_stats {
 	 */
 	u64		SCX_EV_ENQ_SKIP_EXITING;
 
+	/*
+	 * The number of tasks dispatched in the bypassing mode.
+	 */
+	u64		SCX_EV_BYPASS_DISPATCH;
+
 	/*
 	 * The number of times the bypassing mode has been activated.
 	 */
@@ -2869,11 +2874,17 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	}
 
 	/* if there already are tasks to run, nothing to do */
-	if (rq->scx.local_dsq.nr)
+	if (rq->scx.local_dsq.nr) {
+		if (scx_rq_bypassing(rq))
+			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 		goto has_tasks;
+	}
 
-	if (consume_global_dsq(rq))
+	if (consume_global_dsq(rq)) {
+		if (scx_rq_bypassing(rq))
+			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 		goto has_tasks;
+	}
 
 	if (!SCX_HAS_OP(dispatch) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
 		goto no_tasks;
@@ -2899,10 +2910,16 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 			rq->scx.flags |= SCX_RQ_BAL_KEEP;
 			goto has_tasks;
 		}
-		if (rq->scx.local_dsq.nr)
+		if (rq->scx.local_dsq.nr) {
+			if (scx_rq_bypassing(rq))
+				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 			goto has_tasks;
-		if (consume_global_dsq(rq))
+		}
+		if (consume_global_dsq(rq)) {
+			if (scx_rq_bypassing(rq))
+				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 			goto has_tasks;
+		}
 
 		/*
 		 * ops.dispatch() can trap us in this loop by repeatedly
@@ -5001,6 +5018,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
@@ -7138,6 +7156,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
 
-- 
2.48.1

