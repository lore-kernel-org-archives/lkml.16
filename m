Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF9155321
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910474; cv=none; b=MHgzYOu/KvEoVd7X0Y25BnY+V3yciPjM5deMvGzwGuF8rdb8/ZaMBKMSoZuiXfPK+OiYKfxffIDFbmhsmgxDbKCA5dkB9g1dhy9X5Zr8bVMVgptJHsEzJKU2LtHHI2VWEmsBbb6ov8l4qf0VCMxkFgyM/fNTe8iCkwGlIgr4pd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910474; c=relaxed/simple;
	bh=mFfNvPNFCNmFfkbdbE71PXRRXs4xWgHXOxGXwMJU8HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeCwcXnZZg6BP1y3jtwdXn7uLBqQYbc8EuHmpub2J3j1+FL3lyivpSl3HByxDABBIq8uVyrWhqXxR5bt/zTyJnlgzlPVR9gq9Zst/yfQo6j/l0ypCdo3VKMube5tMnEWl4vj3/54KNvU5Vn1GAefL4vhDgdlCFbe1zuk9xzjjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DQA5Jc5Q; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DQA5Jc5Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0BtpovqkvtmThTHwOLdaDpdhsnbOIfbSwVOEKFIXNKc=; b=DQA5Jc5Q1RPuslD4GlbvLVqS/P
	MO9V6/TUEXHfuclrvaQMoj/JIx6U3KR9DT4yb9M7yfgMeFw6sB1/Nlw+QrGc2N3LeK0YioPcxNK01
	R3IhGbxNpNuRwH7vJ/CnQjNmYg6V/3usc3kxQmihpyqlOTZrKQ4sfrPJAb5qCHktSJtnCVv+mjrYt
	3YypkliemjVkjQ8vX0ZjgQtYYqmIU2KZI7t3teqbXfCTvWz0oXyjGQJaAcLUk9e26hGif1DhCWuRm
	3KiQ9XrIrk7M14UXaGMMgjcKKLGsYggNwmMgYrDG2fGPTvbCC81HsottQy0CEFmIq9bi0yfrPJObV
	8RRDrUng==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgI2r-005gha-Vw; Fri, 07 Feb 2025 07:41:04 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v2 1/2] sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
Date: Fri,  7 Feb 2025 15:40:51 +0900
Message-ID: <20250207064052.399227-2-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207064052.399227-1-changwoo@igalia.com>
References: <20250207064052.399227-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a core event, SCX_EV_ENQ_SLICE_DFL, which represents how many
tasks have been enqueued (or pick_task-ed or select_cpu-ed) with
a default time slice (SCX_SLICE_DFL).

Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
scheduler bugs, causing latency spikes, especially when ops.select_cpu()
is provided.

__scx_add_event() is used since the caller holds an rq lock or p->pi_lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8a9a30895381..5ef90d9bcdd2 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1468,6 +1468,12 @@ struct scx_event_stats {
 	 */
 	u64		SCX_EV_ENQ_SKIP_EXITING;
 
+	/*
+	 * The total number of tasks enqueued (or pick_task-ed) with a
+	 * default time slice (SCX_SLICE_DFL).
+	 */
+	u64		SCX_EV_ENQ_SLICE_DFL;
+
 	/*
 	 * The total duration of bypass modes in nanoseconds.
 	 */
@@ -2134,6 +2140,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	 */
 	touch_core_sched(rq, p);
 	p->scx.slice = SCX_SLICE_DFL;
+	__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
 local_norefill:
 	dispatch_enqueue(&rq->scx.local_dsq, p, enq_flags);
 	return;
@@ -2141,6 +2148,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 global:
 	touch_core_sched(rq, p);	/* see the comment in local: */
 	p->scx.slice = SCX_SLICE_DFL;
+	__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
 	dispatch_enqueue(find_global_dsq(p), p, enq_flags);
 }
 
@@ -3202,8 +3210,10 @@ static struct task_struct *pick_task_scx(struct rq *rq)
 	 */
 	if (keep_prev) {
 		p = prev;
-		if (!p->scx.slice)
+		if (!p->scx.slice) {
 			p->scx.slice = SCX_SLICE_DFL;
+			__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
+		}
 	} else {
 		p = first_local_task(rq);
 		if (!p) {
@@ -3219,6 +3229,7 @@ static struct task_struct *pick_task_scx(struct rq *rq)
 				scx_warned_zero_slice = true;
 			}
 			p->scx.slice = SCX_SLICE_DFL;
+			__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
 		}
 	}
 
@@ -3306,6 +3317,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		if (found) {
 			p->scx.slice = SCX_SLICE_DFL;
 			p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
+			__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
 		}
 
 		if (rq_bypass)
@@ -5023,6 +5035,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_ENQ_SLICE_DFL);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
@@ -7163,6 +7176,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SLICE_DFL);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
-- 
2.48.1

