Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3613A3ED
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307404; cv=none; b=T1tymZThtEbtIL2DvJQIS0x7Aglo23XFJi2nvIgFO5DqGoXWMn9FTjUis2MCkKQvxSEVRUJqOQQuJSjh/IL5wMikAf+pcytAIOkCyZs2Bb//UaKF1bcQ6LwAJadXsy1FjazPvwHbVwg4pE2zwdAyhxtrl5gz+I5UbnyrWBM6w0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307404; c=relaxed/simple;
	bh=EVM2OyD7ITS8CjCs3HeW0si0C7xpIaQVqCPuwTKw9aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9FWIVf1CvaIy7tT1nMQjwqU9+ZdGUlywib9vb1eeynElscoAHNH0KX91JXf5mdG8oCW+wRsrZRsNjjuWY80SZLMu17Xko0DDDEO2Olc06KqtRvRxGQTjFMJncrqUL9uK7kS6k7BYP9lpdeMT/JrmiJ/BYoT1caaY02LJAS25UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Pa1dEgA8; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Pa1dEgA8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bGbZyxBQi2Nkt3T6KZ5le7N8O0Lnv0KnbNQBek0nrjI=; b=Pa1dEgA8aZuwFenNNcmqidmZFL
	ngWjhImKhX/rV0+U6jcz0YxWrJJlX10VzfUj9Ee79R6es2vqKS8VbQxf5ZNPYIvjWvstUPwOcZS84
	cEIbvmx7TXTuim9vyf4mMF8GuUSMBNMn+HEaaF49Zf2jHDX1EFnhlqwhrSgkZFoNvw0zpey93bVLR
	vjdefWPbfnfTNs+NzfqGkVk3YNiuRR4/EzresgcNKsZ7NqBYCSELoFRF4W3s+WfeKEDJ8Fz21I5tw
	aG0bg1vNLTWIEucw6wykMUOh8aM/gkj7U1BQlnW5iuRs8RCOcNvjKwIlFI6eZubWZZf3knSskxNb8
	sLfEbh6w==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdl9x-001KYP-Lz; Fri, 31 Jan 2025 08:09:56 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 02/11] sched_ext: Add an event, SCX_EV_SELECT_CPU_FALLBACK
Date: Fri, 31 Jan 2025 16:09:29 +0900
Message-ID: <20250131070938.95551-3-changwoo@igalia.com>
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

Add a core event, SCX_EV_SELECT_CPU_FALLBACK, which represents how many times
ops.select_cpu() returns a CPU that the task can't use.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 include/linux/sched/ext.h |  1 +
 kernel/sched/ext.c        | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/sched/ext.h b/include/linux/sched/ext.h
index 1d70a9867fb1..f7545430a548 100644
--- a/include/linux/sched/ext.h
+++ b/include/linux/sched/ext.h
@@ -146,6 +146,7 @@ struct sched_ext_entity {
 	u32			weight;
 	s32			sticky_cpu;
 	s32			holding_cpu;
+	s32			selected_cpu;
 	u32			kf_mask;	/* see scx_kf_mask above */
 	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
 	atomic_long_t		ops_state;
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 4e28e88e88d4..4d3b32aca48d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1444,6 +1444,11 @@ static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
  * Collection of event counters. Event types are placed in descending order.
  */
 struct scx_event_stats {
+	/*
+	 * If ops.select_cpu() returns a CPU which can't be used by the task,
+	 * the core scheduler code silently picks a fallback CPU.
+	 */
+	u64		SCX_EV_SELECT_CPU_FALLBACK;
 };
 
 /*
@@ -2170,6 +2175,11 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	do_enqueue_task(rq, p, enq_flags, sticky_cpu);
 out:
 	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
+
+	if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
+	    (cpu_of(rq) != p->scx.selected_cpu)) {
+		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
+	}
 }
 
 static void ops_dequeue(struct task_struct *p, u64 deq_flags)
@@ -3240,6 +3250,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 
 		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
 					   select_cpu, p, prev_cpu, wake_flags);
+		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
 		if (ops_cpu_valid(cpu, "from ops.select_cpu()"))
 			return cpu;
@@ -3250,6 +3261,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		s32 cpu;
 
 		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, &found);
+		p->scx.selected_cpu = cpu;
 		if (found) {
 			p->scx.slice = SCX_SLICE_DFL;
 			p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
@@ -4957,6 +4969,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	dump_line(&s, "--------------");
 
 	scx_bpf_events(&events, sizeof(events));
+	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7090,6 +7103,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 	memset(&e_sys, 0, sizeof(e_sys));
 	for_each_possible_cpu(cpu) {
 		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 	}
 
 	/*
-- 
2.48.1

