Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6349E241130
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140216; cv=none; b=D4605DrOeC6bF1C4DRMh3Zobd/f+pZlbcTA5/FqZJ/0TGaUl9uV0gCam2KlF6pYup8RVNcDmPCHIXLVqW5lydSjKD3fPVOpzkG0wuBnfHJE76pgIThUJubRpAsxhqmKDZFd770cw1p8Aa3d8njHLvwGq1cAh64ZCUeJbG99Krlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140216; c=relaxed/simple;
	bh=Wqntl1ggAaL74aa0p3y2a++/5r9dcdOK0C0/zF8B/OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNICrKQVFA5u2roOcjeoXc+N3etORVBAoKLni2BmtrphT3cB1KC0RDgsdCgqZNsvnK1wUxJ0ZkD6fTGd2mqRUAnTb4T+tY8cbGUzbokjSz/2JM7mK0tzkKbdzPQocbs9yFpzii2qC1IybPTGFPqQlGTac/hX4P3eJfx9KN2PA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAPDlktu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAPDlktu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12FBC4CEDF;
	Sun,  9 Feb 2025 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140216;
	bh=Wqntl1ggAaL74aa0p3y2a++/5r9dcdOK0C0/zF8B/OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAPDlktuV4x4lOY7dt1MX379eFc7iOHZYEvyz50M+V1vMYLZ7fvi/DNn8BHL0uWC0
	 cXq25hvD0Trn40F1pWIwz9IczyCePognvXVQCGaIAKDvM2xUvzI6+hvU03b5Cy6676
	 LrZm7F5c4pvdz6EE7y7SE2gv1dj+bDk7jWASzAw/FMf9AVm6+e4zikrFJvFmLs4lOd
	 5iO3Oxaf7du0MevTy+0WWhJdedrBIABnQJ9GZ2QAeADelMF09h3j9edOOY4Ltj8gEI
	 9LAaHzsaa8DCVFuBbzU19CGwd0mRHpbQgpwddFBVCMCemNmiHRz8OEsri+qzxovymK
	 LVdtWCPkeLQxA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 1/6 v2] task_work: Provide means to check if a work is queued
Date: Sun,  9 Feb 2025 23:29:59 +0100
Message-ID: <20250209223005.11519-2-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250209223005.11519-1-frederic@kernel.org>
References: <20250209223005.11519-1-frederic@kernel.org>
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

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/task_work.h | 12 ++++++++++++
 kernel/task_work.c        | 11 +++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index d1efec571a4a..0d7b04095753 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -56,6 +56,8 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 {
 	struct callback_head *head;
 
+	work->next = TASK_WORK_DEQUEUED;
+
 	if (notify == TWA_NMI_CURRENT) {
 		if (WARN_ON_ONCE(task != current))
 			return -EINVAL;
@@ -67,8 +69,10 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
 
 	head = READ_ONCE(task->task_works);
 	do {
-		if (unlikely(head == &work_exited))
+		if (unlikely(head == &work_exited)) {
+			work->next = TASK_WORK_DEQUEUED;
 			return -ESRCH;
+		}
 		work->next = head;
 	} while (!try_cmpxchg(&task->task_works, &head, work));
 
@@ -129,8 +133,10 @@ task_work_cancel_match(struct task_struct *task,
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
 
@@ -224,6 +230,7 @@ void task_work_run(void)
 
 		do {
 			next = work->next;
+			work->next = TASK_WORK_DEQUEUED;
 			work->func(work);
 			work = next;
 			cond_resched();
-- 
2.46.0

