Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2520715B546
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307407; cv=none; b=FS1jNmmV+OBYA/baxNUQ3+eKIGl6rgsV/9g+QJc3/VQ0DnkQB2ZBpWUQ58jrYgkFf+LG459O2TKvzkok9Rt9Ele5FboiqUbV650/4Phul0kJQPgFbGIGMVFFLgxzpnLVu6Nzy32LVM1IzW/b3DuKi147c/b3l9sFuhQzd0ZiT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307407; c=relaxed/simple;
	bh=c1Il5sS3fT3lVg9aTCV1w+wu5xAvQXF+dUafJxi9yvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTfWq50+3MhkFD3x48u6R9CqBKirAIYozE4BOpLz9uu8RV9uZXG6jjVRSMX6/+xaBgQrnhtLpjUDNomTDTNSPovoLxnrBKrct/VrHYaTolba6GnegRFEdoqlCAYwXLj1mzVIciJ4R4km3i4fK4SUhaUmDzfsx/99RQrwl2iARTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=C6fTr8O+; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="C6fTr8O+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ynq2LvCTfrKNO0aYPqmVtw2j6T8KCcEwVFZ3rO6djNY=; b=C6fTr8O+MvS331Ah+3j3neyvxf
	g1qVkjo+8kH1rWZD7FjLdU4rLNP0ilGZipfTBnzQZjyZoBrb64WSOy8PofUF4qKcjuMJANERLHLe4
	t66RxSMVoVvTSTrvH6EQGB5S4M5IGUK0kDCeXgjhzSsI3SY1nI/7LZHTYGfT7b+GwdCqLfMDTNPas
	P1y1pCij2bfAYHVImEDF38GCdjV1f90BE3McSsD4CoynVVRd87mswEROoHlcA5sOqH/WlOeo6r2LM
	4b+dy+PIaQLrF1S8I3f0zbfOd5PHIQz6fyL1B4+ajX8IpuNMDm6929Ca2QlZ4c0UpzC6GfV3wbpUz
	ZX/2PZ5A==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlA2-001KYq-BU; Fri, 31 Jan 2025 08:10:00 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 03/11] sched_ext: Add an event, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE
Date: Fri, 31 Jan 2025 16:09:30 +0900
Message-ID: <20250131070938.95551-4-changwoo@igalia.com>
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

Add a core event, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, which represents how
many times a BPF scheduler tries to dispatch to an offlined local DSQ.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 4d3b32aca48d..041b0af3551a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1449,6 +1449,12 @@ struct scx_event_stats {
 	 * the core scheduler code silently picks a fallback CPU.
 	 */
 	u64		SCX_EV_SELECT_CPU_FALLBACK;
+
+	/*
+	 * When dispatching to a local DSQ, the CPU may have gone offline in
+	 * the meantime. In this case, the task is bounced to the global DSQ.
+	 */
+	u64		SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE;
 };
 
 /*
@@ -2644,6 +2650,7 @@ static void dispatch_to_local_dsq(struct rq *rq, struct scx_dispatch_q *dst_dsq,
 	if (unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
 		dispatch_enqueue(find_global_dsq(p), p,
 				 enq_flags | SCX_ENQ_CLEAR_OPSS);
+		__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
 		return;
 	}
 
@@ -4970,6 +4977,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 	scx_bpf_events(&events, sizeof(events));
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
+	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7104,6 +7112,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 	for_each_possible_cpu(cpu) {
 		e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	}
 
 	/*
-- 
2.48.1

