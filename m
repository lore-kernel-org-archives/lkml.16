Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DB19FA92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756384; cv=none; b=QuPVYL4AwnDHUBrN56iDQL51zwkOC4RIxWoRM4svnrZB+8VhDmouSFJ2r+dPXgEwS9EMIt+85Pv3M0lIR8zx+OWvRg/zefDyk5+Nj6AUJ7k2D5cbMF/YSKlR4C/l2+meR2gVNFyHkTpQnHb08V9ZV2o8ytchWZmCe4ob51O/fN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756384; c=relaxed/simple;
	bh=sl7FJWKpiJnwBHISlGmRh2PVdiT/xXJxWgfPfgh/FZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH5OxZInDKkLkYoWQppy05NtaUy3Vjq7TCxuPoOfkxPJT/yVOjw3pD2MQutNFpwndZ3ot+8VU4RCKOR6bcPTEtAcDO7YJDk6SRJyYcQ11o9YXSZXKWOHCDiiRK1QmCPvxA/K4eHDazEW/4uoaeyRPAhQ7dxp1gvaGPR/pl+GeTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0+m+S5H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0+m+S5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743756381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhjEUJ4tBBUr4Z43+VO+6l4qMHWkClGKYDVJczgnbdM=;
	b=M0+m+S5HnduI3mBmI3ATMzrs7puDBYXm3zVH9OOeochEXRE2QURI+cyQd6l5bxz8KORa/+
	lTm3wtHNTkvlXTpInQZeW9Qvxm/uaG9XEvobsMs6d8iLFIjIQG8Z8zE1ibBRepuQ6P23Gn
	9awbvmlKF6PEfN1yhXqNva1XfLMFHfI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-acDumnTMOC2X4HrYlBGkhw-1; Fri,
 04 Apr 2025 04:46:19 -0400
X-MC-Unique: acDumnTMOC2X4HrYlBGkhw-1
X-Mimecast-MFC-AGG-ID: acDumnTMOC2X4HrYlBGkhw_1743756378
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3F8F19560BB;
	Fri,  4 Apr 2025 08:46:18 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.143])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF12F180A803;
	Fri,  4 Apr 2025 08:46:14 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>
Subject: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending signal as wakeup
Date: Fri,  4 Apr 2025 10:45:19 +0200
Message-ID: <20250404084512.98552-17-gmonaco@redhat.com>
In-Reply-To: <20250404084512.98552-11-gmonaco@redhat.com>
References: <20250404084512.98552-11-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

If a task sets itself to interruptible and schedules, the __schedule
function checks whether there's a pending signal and, if that's the
case, updates the state of the task to runnable instead of dequeuing.
By looking at the tracepoints, we see the task enters the scheduler
while sleepable but exits as runnable. From a modelling perspective,
this is equivalent to a wakeup and the tracepoints should reflect that.

Add the waking/wakeup tracepoints in the try_to_block_task function and
set the prev_state used by the sched_switch tracepoint to TASK_RUNNING
if the task had a pending signal and was not blocked.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/sched/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f2f79236d5811..48cb32abce01a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6584,7 +6584,12 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
 	int flags = DEQUEUE_NOCLOCK;
 
 	if (signal_pending_state(task_state, p)) {
-		WRITE_ONCE(p->__state, TASK_RUNNING);
+		/*
+		 * From a modelling perspective, this is equivalent to a wakeup
+		 * before dequeuing the task: trace accordingly.
+		 */
+		trace_sched_waking(p);
+		ttwu_do_wakeup(p);
 		return false;
 	}
 
@@ -6721,7 +6726,9 @@ static void __sched notrace __schedule(int sched_mode)
 			goto picked;
 		}
 	} else if (!preempt && prev_state) {
-		try_to_block_task(rq, prev, prev_state);
+		/* Task was not blocked due to a signal and is again runnable */
+		if (!try_to_block_task(rq, prev, prev_state))
+			prev_state = TASK_RUNNING;
 		switch_count = &prev->nvcsw;
 	}
 
-- 
2.49.0

