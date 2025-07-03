Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0912E7BD0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551656; cv=none; b=W8TrwGp10Hg2pT6EEkrWYqOYVH0B3XfQcZZ1Fvr7szJIHDANlRngLY1XA/J7KJT5fSxzAC7/s7qSBsqKHk5xSoOgn1Za/AssJReYN/ygZj91+FVsf1ctuL/qChRM8tEbxJHTLo/CPpDtLXWke77yNahI0tF+JYlplSsH84c7Ja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551656; c=relaxed/simple;
	bh=KEyxKF7bbPMo0JctDd19rU2CfoDK6otXeM0XfrzjtAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abTWtLLrMYoWKo1oESV80iHRxU7jgXjKhmu5Ei6RkJEDW6GEjNChVigDQsus9HkQ3fGRYQHFz/mZ4f9gmRn8VvuBWIXBwB/PhLNUmf8m8Qsmnuh1b0bhwtdLyK1Ra4QVML3LdxkAtWtKEh3Zeq21NkwydZqtAa27XCCEjzEEKlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5WdPwK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5WdPwK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E008C4CEED;
	Thu,  3 Jul 2025 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551655;
	bh=KEyxKF7bbPMo0JctDd19rU2CfoDK6otXeM0XfrzjtAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5WdPwK8joJmZRx7kOg1Iee7tBSPqd4RG87rlVXg2TpGSjTEz6TKvXe6YV/0x+IgE
	 qk8vnRZPkMLuadN/8xJckx1lO0wf7RF/L4lmzgI7Nd07gu9uzdbY+YY72UqlIZMPhU
	 KPMiWVijIhE1ReB+DUJk6XamyQceTWG7RvHEREHyLIOxhuBoBTqPggmrjWDfuj2qPD
	 rRkOyUDj4dS/tGxSkN6BTwzxTIxbZEBATG7h/neXGyjE6qZm7Vvve6D71BQJwgo5gm
	 rdNUf6tKSNC+bf6dZ9qRHX+sDjO6CYchzdBO1sziapvzZXDlHK4rEqVQv/UpvOLF6n
	 EHT2CLYq27hTQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Subject: [PATCH 1/6] task_work: Provide means to check if a work is queued
Date: Thu,  3 Jul 2025 16:07:12 +0200
Message-ID: <20250703140717.25703-2-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703140717.25703-1-frederic@kernel.org>
References: <20250703140717.25703-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some task work users implement their own ways to know if a callback is
already queued on the current task while fiddling with the callback
head internals.

Provide instead a consolidated API to serve this very purpose.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/task_work.h | 12 ++++++++++++
 kernel/task_work.c        |  9 +++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/task_work.h b/include/linux/task_work.h
index 0646804860ff..31caf12c1313 100644
--- a/include/linux/task_work.h
+++ b/include/linux/task_work.h
@@ -5,12 +5,15 @@
 #include <linux/list.h>
 #include <linux/sched.h>
 
+#define TASK_WORK_DEQUEUED	((void *) -1UL)
+
 typedef void (*task_work_func_t)(struct callback_head *);
 
 static inline void
 init_task_work(struct callback_head *twork, task_work_func_t func)
 {
 	twork->func = func;
+	twork->next = TASK_WORK_DEQUEUED;
 }
 
 enum task_work_notify_mode {
@@ -26,6 +29,15 @@ static inline bool task_work_pending(struct task_struct *task)
 	return READ_ONCE(task->task_works);
 }
 
+/*
+ * Check if a work is queued. Beware: this is inherently racy if the work can
+ * be queued elsewhere than the current task.
+ */
+static inline bool task_work_queued(struct callback_head *twork)
+{
+	return twork->next != TASK_WORK_DEQUEUED;
+}
+
 int task_work_add(struct task_struct *task, struct callback_head *twork,
 			enum task_work_notify_mode mode);
 
diff --git a/kernel/task_work.c b/kernel/task_work.c
index d1efec571a4a..56718cb824d9 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -67,8 +67,10 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 
 	head = READ_ONCE(task->task_works);
 	do {
-		if (unlikely(head == &work_exited))
+		if (unlikely(head == &work_exited)) {
+			work->next = TASK_WORK_DEQUEUED;
 			return -ESRCH;
+		}
 		work->next = head;
 	} while (!try_cmpxchg(&task->task_works, &head, work));
 
@@ -129,8 +131,10 @@ task_work_cancel_match(struct task_struct *task,
 		if (!match(work, data)) {
 			pprev = &work->next;
 			work = READ_ONCE(*pprev);
-		} else if (try_cmpxchg(pprev, &work, work->next))
+		} else if (try_cmpxchg(pprev, &work, work->next)) {
+			work->next = TASK_WORK_DEQUEUED;
 			break;
+		}
 	}
 	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
 
@@ -224,6 +228,7 @@ void task_work_run(void)
 
 		do {
 			next = work->next;
+			work->next = TASK_WORK_DEQUEUED;
 			work->func(work);
 			work = next;
 			cond_resched();
-- 
2.48.1

