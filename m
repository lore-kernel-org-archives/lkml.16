Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A642187FE4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307416; cv=none; b=oXPncRLJZecC56lIVyXz9pss0c4/rAhPuLgEQ+rvxUgi8jG/eBuNwBDe4y9sy2LSrS15LuZt3/2Tcf47ZHR0Xvz36k7NuHmqkw7IKrZBstQsRTm+W9yawadsFK+gWT4PmtzxgJWIz4Cop9tYn1IRwQ5eAA3wY+BUEIU2NP1LdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307416; c=relaxed/simple;
	bh=mDwzX9VrQutUfjwLuixleqNUJED35UXVAOa5fYcdFAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qojp4GHVyI1y37KhjBCGO1ExpKFFKKwAFjDvbPE0hRU0Lf/MKOqybNoTYaObxK1hu7yVSXyjZS/Cf87Djnhb0RKaUhVMDYSLOD34OQsdGkfFxaVseUPhVHhsQpwB7QVtRIZjT5HNh8plXmciICyz4ePJtqxJdhprgXO+niAYoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rba8Y1uU; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rba8Y1uU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bxwZ2LxOeAlK9DczuHndKbfrLafoKJEyndGUY9K2ifA=; b=rba8Y1uUxksQD78vj1/1msY5je
	DEx1gCPqEKSbpyTfKW1yVZoGqG2VDWr9a03o/DcrM75LCqVeODCvJnyEl2VHoo5qcIYNXM/VdOkOw
	BO/vzO3ybO5C8E7hXHe27D1XOV2tveRkXg5cfrylzah8J67VFuVTOq2LxNRjzteBhZTT6faK1nGqF
	0srD+sw4p+GDgFqSHVCJXvNOiX0IE53E7pY2EEBSi+WSsWzyyGlV6rYAcXM0A0TKquhtOwkvD5che
	RN0n83n6LZIv9bSCcp4XiIv4/IX1Ixs3xSTO2Z5aAtrunl4f9s8nICMlPpf/gklKWt2pboOvZAjlp
	nVSgYSHg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tdlAA-001KZa-SW; Fri, 31 Jan 2025 08:10:09 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v3 05/11] sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
Date: Fri, 31 Jan 2025 16:09:32 +0900
Message-ID: <20250131070938.95551-6-changwoo@igalia.com>
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

Add a core event, SCX_EV_ENQ_SKIP_EXITING, which represents how many
times a task is enqueued to a local DSQ when exiting if
SCX_OPS_ENQ_EXITING is not set.

__scx_add_event() is used since the caller holds an rq lock,
so the preemption has already been disabled.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 kernel/sched/ext.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 7147f730850b..37f86a84ac5d 100644
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
@@ -4986,6 +4994,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
 	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
+	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
 
 	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
 		memcpy(ei->dump + dump_len - sizeof(trunc_marker),
-- 
2.48.1

