Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC101714C6
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307413; cv=none; b=mi2FHaK4TRal0W1Piqqgzb7FHk4Pdiohdtj75NWzHQ5Mb0hsY17XqBYIu2N7+0PSis4d5LxvA07YA2xOjUdM2qmsCIqE9Lk5GIo6yCmF+mM2BgdnafrcSzGX/JqZUXo4e4uik5Cn2EHE8/YmrMfphR3LSaeiRRJB0qlHys9Nj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307413; c=relaxed/simple;
	bh=8vHu4xE+SSmDHI0c8AnDSXYni7h7urbVNTurAdRsVuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PebSrpsx5b337r3V74TZuiXhV8wmLzaELPhK8um7KJAojpclS/pL00wH+BRK5+Vmui0TIA0CHn8o30R2NWFV54MdRm13vhD73pK6qDa033reZLtrRF8nQoTw+dyvTRLw9D3Av+E3wOgtco5LJimrTU7bFt30H7jANzbpwiZfxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZhHMT+Wy; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZhHMT+Wy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AOi9u7Zk84KsH8av/AW4gcZtLuwHZ/58/8SnsZwDWjg=; b=ZhHMT+Wym/x/QXRWjybr2beVeU
	+Ssqssn9zrkNZ5Rbli70GQtjXtl2MrfNzXoAylljMWkSiQpYapX9nOSidHbqdEx8tIiDMBEbqbAuR
	Vx1capXZYtw+6JK/LpWgu7RWgikI5j9TqGisLsCXte9dQ2jk7VCRuBQjlR2WelSjoyeWiGMWCFFap
	JqBIxkuofGQkKMfelAiqMeglx6b8ccg2Nxh/3xq0TWWRvYPUqTnxlKQgMTNXKhgPodRwejUsICgnJ
	eh1Ik5oZWcDfwXjfsHEVJCO2ni58GkLabbx+1/raFgrvN5ZO96BF/ibSsHcjy/7Zjfbwicxgi0P/k
	8CkPLnHw==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlA6-001KZB-Lz; Fri, 31 Jan 2025 08:10:05 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 04/11] sched_ext: Add an event, SCX_EV_DISPATCH_KEEP_LAST
Date: Fri, 31 Jan 2025 16:09:31 +0900
Message-ID: <20250131070938.95551-5-changwoo@igalia.com>
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

Add a core event, SCX_EV_DISPATCH_KEEP_LAST, which represents how many
times a task is continued to run without ops.enqueue() when
SCX_OPS_ENQ_LAST is not set.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 041b0af3551a..7147f730850b 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1455,6 +1455,12 @@ struct scx_event_stats {
 	 * the meantime. In this case, the task is bounced to the global DSQ.
 	 */
 	u64		SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE;
+
+	/*
+	 * If SCX_OPS_ENQ_LAST is not set, the number of times that a task
+	 * continued to run because there were no other tasks on the CPU.
+	 */
+	u64		SCX_EV_DISPATCH_KEEP_LAST;
 };
 
 /*
@@ -2908,6 +2914,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	if (prev_on_rq && (!static_branch_unlikely(&scx_ops_enq_last) ||
 	     scx_rq_bypassing(rq))) {
 		rq->scx.flags |= SCX_RQ_BAL_KEEP;
+		__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
 		goto has_tasks;
 	}
 	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
@@ -4978,6 +4985,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_bpf_events(&events, sizeof(events));
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
+	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7113,6 +7121,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
 	}
 
 	/*
-- 
2.48.1

