Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282441E5B94
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298625; cv=none; b=GlxLVUagx/HGk93sSN4z+VMBr3crXoiglqXJUlzQuk2AuMuRqB6CkXfI2qnH/zAPi1VIFvfjHz0gjr++7hUTt0CeaHB2s4vBYdpkUkK41mUz6U60WICkWpbsIaZ9iQvDu9RvI4rYxrUipcAzc8pvlxnRJmmpbUJmA1u6mgsP4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298625; c=relaxed/simple;
	bh=Wjj+RxTAFtK3Vg/VxjQp1/LpNlEkwCHswxd2NjU6Evo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWRtaqJQrEuQaC0jITlMADb0mQ6to5XgE5V3m3ByNsBHhSOZpQS/A/JGKFqLnsBK1R+2KvYH9MdAnt+w1JcbY+957ZTLLlM1JIjrD3l8A+XKEkH3v5DXELsXdT1HZe5TYI5v4xFlpN23xTxgbSv/1zA0uv+YVyQxLIhy8ZTN51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M211yw1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M211yw1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153A7C4CEE8;
	Thu, 10 Apr 2025 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298624;
	bh=Wjj+RxTAFtK3Vg/VxjQp1/LpNlEkwCHswxd2NjU6Evo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M211yw1ldc3Hf9hKFJ64zkqx61cUGKq0dplVDOpTKCD36p3MrbzjMq6sR/YZ6iUK+
	 EQ0XiCyR+Ri2pWUNqecLe++qdTdhpNMETeJOUWiz+2wqAktpm2QjYeRUzTdBsKXuPy
	 nTOVOtPqDYTEnxcl3Mwjj2zFwLT/Pu1lqyhtMI+Z0wE547jpwKordX1cpo5s7rt1oi
	 vvDU7kx4xJIFYohPCbHXgjkiQ/EwmroNc15hngyEU6WDaqoWll4Q2hjeJatBQvxznu
	 XHfeXIJhHvgPtnmlK21JUENwFkLsOzHPbVY1CQzDPi+b8r/MFhXtwmbHSlOaS6psxq
	 OtSip1JmsgTPQ==
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
Subject: [PATCH 3/6] sched: Use task_work_queued() on cid_work
Date: Thu, 10 Apr 2025 17:23:24 +0200
Message-ID: <20250410152327.24504-4-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410152327.24504-1-frederic@kernel.org>
References: <20250410152327.24504-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the ad-hoc implementation of task_work_queued()

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cfaca3040b2f..add41254b6e5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10576,7 +10576,6 @@ static void task_mm_cid_work(struct callback_head *work)
 
 	WARN_ON_ONCE(t != container_of(work, struct task_struct, cid_work));
 
-	work->next = work;	/* Prevent double-add */
 	if (t->flags & PF_EXITING)
 		return;
 	mm = t->mm;
@@ -10620,7 +10619,6 @@ void init_sched_mm_cid(struct task_struct *t)
 		if (mm_users == 1)
 			mm->mm_cid_next_scan = jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 	}
-	t->cid_work.next = &t->cid_work;	/* Protect against double add */
 	init_task_work(&t->cid_work, task_mm_cid_work);
 }
 
@@ -10629,8 +10627,7 @@ void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
 	struct callback_head *work = &curr->cid_work;
 	unsigned long now = jiffies;
 
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) ||
-	    work->next != work)
+	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || task_work_queued(work))
 		return;
 	if (time_before(now, READ_ONCE(curr->mm->mm_cid_next_scan)))
 		return;
-- 
2.48.1

