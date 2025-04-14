Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61C2BEC3C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634220; cv=none; b=iZ7D5LgF252TDr2cuun0zwRyy5qDEp8Vz6961t/58C1p05quArTczPdEVX0VZByfaEFLhTF6hhQbaiuFjLzL/9GFRqH9TzhDqhsHMEp1db8b7SXbUc1b901HZ62+2602fp/4Pa+rls5xvECjbkNpxPzoReCspAlp9siOK5cYuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634220; c=relaxed/simple;
	bh=LIed4pNhbjT8jKQfbxUbdYppD6PY93k1T6aJzk3p8hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpGJtZBPKJfykKD5ou1mmtB/S+336zPcsp8Zcqj4pF1h6RgQCk+iGkZeIedBs+UaFEa9NE+ZFOCYE56lBjp2yHLKdH6yo/VZKaQbXRbiYCxph3WqlHz5FdS7jH4eDReojlREGpofPwQCbRZ1Aktpc9ty+9qt6jCMDCl4xMr4ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBDmEm8s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBDmEm8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744634217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnMpwB+OC17oOgETa4xZkxb6KgyH2Yh5tCklz6EI9Fs=;
	b=gBDmEm8sloqC2MBrWt9MiLFTvmC9W7s9SQjStsujkGT9dZcl6gUFs1Xu8Zp4nDCglCOS1T
	BCN2NXetPofrpZFAMKyil7NKEfiU8XnHVupbdxZNHzOVgAfuekr394G5kFUPKnGTtkMhwn
	cOhd8zFK95fVmurvUJbDzFhm6wnAhQA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-jh1qp7uxMNK3m7JW1cuQfA-1; Mon,
 14 Apr 2025 08:36:54 -0400
X-MC-Unique: jh1qp7uxMNK3m7JW1cuQfA-1
X-Mimecast-MFC-AGG-ID: jh1qp7uxMNK3m7JW1cuQfA_1744634213
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F694180035C;
	Mon, 14 Apr 2025 12:36:53 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.225.177])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C56521828ABA;
	Mon, 14 Apr 2025 12:36:50 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	"To: Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
	"To: Peter Zijlstra" <peterz@infradead.org>,
	"To: Ingo Molnar" <mingo@redhat.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v13 1/3] sched: Add prev_sum_exec_runtime support for RT, DL and SCX classes
Date: Mon, 14 Apr 2025 14:36:32 +0200
Message-ID: <20250414123630.177385-6-gmonaco@redhat.com>
In-Reply-To: <20250414123630.177385-5-gmonaco@redhat.com>
References: <20250414123630.177385-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The fair scheduling class relies on prev_sum_exec_runtime to compute the
duration of the task's runtime since it was last scheduled. This value
is currently not required by other scheduling classes but can be useful
to understand long running tasks and take certain actions (e.g. during a
scheduler tick).

Add support for prev_sum_exec_runtime to the RT, deadline and sched_ext
classes by simply assigning the sum_exec_runtime at each set_next_task.

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/sched/deadline.c | 1 +
 kernel/sched/ext.c      | 1 +
 kernel/sched/rt.c       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245e..8387006396c8a 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2389,6 +2389,7 @@ static void set_next_task_dl(struct rq *rq, struct task_struct *p, bool first)
 	p->se.exec_start = rq_clock_task(rq);
 	if (on_dl_rq(&p->dl))
 		update_stats_wait_end_dl(dl_rq, dl_se);
+	p->se.prev_sum_exec_runtime = p->se.sum_exec_runtime;
 
 	/* You can't push away the running task */
 	dequeue_pushable_dl_task(rq, p);
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 66bcd40a28ca1..4bb4f0ee23d75 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3109,6 +3109,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 	}
 
 	p->se.exec_start = rq_clock_task(rq);
+	p->se.prev_sum_exec_runtime = p->se.sum_exec_runtime;
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fa03ec3ed56a2..1ed4a133fdc79 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1682,6 +1682,7 @@ static inline void set_next_task_rt(struct rq *rq, struct task_struct *p, bool f
 	p->se.exec_start = rq_clock_task(rq);
 	if (on_rt_rq(&p->rt))
 		update_stats_wait_end_rt(rt_rq, rt_se);
+	p->se.prev_sum_exec_runtime = p->se.sum_exec_runtime;
 
 	/* The running task is never eligible for pushing */
 	dequeue_pushable_task(rq, p);
-- 
2.49.0

