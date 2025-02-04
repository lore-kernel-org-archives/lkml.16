Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788C1FF60F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646490; cv=none; b=oz0Qon7+oK6Z1PuB70q5aVtbM0YVAGPpma2joWN8eDfFB5v9oUhCgCEcMtbqdbGMs7JY1jhdiehSzreWGGEF2xiuoTr56nvfb7dfS2uu8k7br1YJL0D7fJlwXymy0R3mQpCnH6YVg4Vo++eEGlqvOHPaqhvAKF0/8MxCO5mfdrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646490; c=relaxed/simple;
	bh=RWQPikr6/2PFn7rXegDVoYHcUAAeX35+X8ko8U0Kyqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7Dz/BUp6aVWIpaMH6MHPrZFapPDBgJiMSwivcS2wKlqQnPUq3qRXuhpnyX5G1pChh2rxqqJ0B553+L5+HYSaqpvKbDV75PgkinIKPQ/ROqv/9qALvsYsQOJEsEffq0Pz01T9fi6be6sZeJKrmnWZHd3AZsohBPDiwrMsAzG1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HrFpcLrr; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HrFpcLrr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+xfAgz/xADnGtdCmEKkYbmb7MoEwI80n8XgCfoENi64=; b=HrFpcLrrQ/1U2EdolLh80pB682
	kwNZxjiob/n4E4DAOHggldfBeOxAlmJCyCbUyd8vFEL80Z7nTkwcVWSbbT3tPD4a9cD14Lq3K2fRC
	hwNWZm7hwmJinYqjCvLj6YfefAbR4GmRwmx3bnwcJLx/ZpYVmj4i5BAbSw9S2L7A8qV42gE/zb/i3
	LdADx+vH1vrHOyhoIqsZfnXm4Y8YcsUH4XKgrl7pLPPL2qWqACJWNq4LZCYYTCo3EjK6mlCM80COT
	dCidEDM92+qypCwieNDwbPoeVTM8rjhv7HmwR4SX/Po/RwxQQx3d5GpFrGn5L3BlNj0r88ecXzNhI
	qZtk99iw==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBN5-003J1r-61; Tue, 04 Feb 2025 06:21:21 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 3/7] sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
Date: Tue,  4 Feb 2025 14:20:53 +0900
Message-ID: <20250204052057.67776-4-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204052057.67776-1-changwoo@igalia.com>
References: <20250204052057.67776-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a core event, SCX_EV_BYPASS_DISPATCH, which represents how many
tasks have been dispatched in the bypass mode.

__scx_add_event() is used since the caller holds an rq lock or
p->pi_lock, so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 377c2e99cf4f..0ed2db44ae33 100644
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
@@ -2071,8 +2076,10 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	if (!scx_rq_online(rq))
 		goto local;
 
-	if (scx_rq_bypassing(rq))
+	if (scx_rq_bypassing(rq)) {
+		__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 		goto global;
+	}
 
 	if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
 		goto direct;
@@ -3253,6 +3260,8 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 
 static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
 {
+	bool rq_bypass;
+
 	/*
 	 * sched_exec() calls with %WF_EXEC when @p is about to exec(2) as it
 	 * can be a good migration opportunity with low cache and memory
@@ -3266,7 +3275,8 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 	if (unlikely(wake_flags & WF_EXEC))
 		return prev_cpu;
 
-	if (SCX_HAS_OP(select_cpu) && !scx_rq_bypassing(task_rq(p))) {
+	rq_bypass = scx_rq_bypassing(task_rq(p));
+	if (SCX_HAS_OP(select_cpu) && !rq_bypass) {
 		s32 cpu;
 		struct task_struct **ddsp_taskp;
 
@@ -3292,6 +3302,9 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 			p->scx.slice = SCX_SLICE_DFL;
 			p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
 		}
+
+		if (rq_bypass)
+			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
 		return cpu;
 	}
 }
@@ -5000,6 +5013,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
+	scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
 	scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
@@ -7138,6 +7152,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
 	}
 
-- 
2.48.1

