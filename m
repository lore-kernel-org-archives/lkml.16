Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930025A635
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738646487; cv=none; b=gdN4YnliEIxoO7xNy7LYRdb7k/U5dkUsPjop4WwxtNIjnQ1aWrS8hH990J8rRamgJtMBW0opLA04rKTBe96ScMszWc/wuIetF2jEJn8JeRckAlInmnzYwQXwlgzFHjzgCSBwu8xpjckUcEGNBN8vr72AaB+r4SvfrvNTpdJysZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738646487; c=relaxed/simple;
	bh=Rmsqs3RbVZLXEtombTMxqagQ8sIbesMxq6d8VcKK9vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjz41JjdFobpVyjnM1oHXMRxyl0r24Opt2/rS3Xxk9C62j5DCJ29oJRES/NSoAbIx2fdstgrDOIJYawLFSmWxHjwwNK0SPRHoLdslQv6u+Z94YaQEve6iRcOlBmPGY+BozIYNvaJ0FJK/HTu8G8PrCB3Y5ZOUk2LSQl8PuJF3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VSjlcYXj; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VSjlcYXj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AJslrF4TGjr61ixox4sklLLk+bB81YEp0Sp/IRhoECY=; b=VSjlcYXjJrqFMCGoGT43N73JqC
	HklC0JV+Nbh09hBBRk0mr1OFGW4f2RlKL08lh84FOiSrASyiaPQHJXXtw0PZFB4e8/AGg3ZR7wkqK
	hLsQiP55qJ1WKzqIjsKm37jjQbqoLKqSnjEtt1eru3NPxNRKKAmuC/ogJivKKAEmYqb76wA0S950f
	ZpqFlSyMJkN1rrmESlL8TJY83evlHFz+mmcN/m62FVIKdnOmBiuHyIj208H+xYlbcU3xcOqNGHLMK
	lW2g4tU/XhkV48kIgxTVocSXtODWkSlmmUXgpdhu7dTm7rBrMmRVJOCXNNSazflXNNZ5LZo+aeLlt
	QhRW5sKw==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tfBMw-003J1Y-NX; Tue, 04 Feb 2025 06:21:13 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 1/7] sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
Date: Tue,  4 Feb 2025 14:20:51 +0900
Message-ID: <20250204052057.67776-2-changwoo@igalia.com>
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

Add a core event, SCX_EV_ENQ_SKIP_EXITING, which represents how many
times a task is enqueued to a local DSQ when exiting if
SCX_OPS_ENQ_EXITING is not set.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index cbb3d059072f..c72ba405a1d3 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1461,6 +1461,12 @@ struct scx_event_stats {
 	 * continued to run because there were no other tasks on the CPU.
 	 */
 	u64		SCX_EV_DISPATCH_KEEP_LAST;
+
+	/*
+	 * If SCX_OPS_ENQ_EXITING is not set, the number of times that a task
+	 * is dispatched to a local DSQ when exiting.
+	 */
+	u64		SCX_EV_ENQ_SKIP_EXITING;
 };
 
 /*
@@ -2068,8 +2074,10 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 
 	/* see %SCX_OPS_ENQ_EXITING */
 	if (!static_branch_unlikely(&scx_ops_enq_exiting) &&
-	    unlikely(p->flags & PF_EXITING))
+	    unlikely(p->flags & PF_EXITING)) {
+		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
 		goto local;
+	}
 
 	if (!SCX_HAS_OP(enqueue))
 		goto global;
@@ -4985,6 +4993,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
+	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
@@ -7121,6 +7130,7 @@ __bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 		scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
+		scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
 	}
 
 	/*
-- 
2.48.1

