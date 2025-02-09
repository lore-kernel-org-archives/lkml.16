Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA42241130
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140222; cv=none; b=k2NeekwXoc4yE75JXt4D4isjH1Yn0zkqPwZCfRC7C205s5gyglJCx8MVgNVZIbWtQKUuLYlpW9u7GOx3aeJPMeW1SqG/xcN+xaufIY9gkiNSNAc3eCcjNDnShDa17y4oGT4FWvdOqgJJVuuMnvyKkC5wZtkycE55rKgEYayYL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140222; c=relaxed/simple;
	bh=FqNJ6UqFojjpII8sBMn0id8eG6MSR2NFISi/uXoXOtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSqrrWB7DpOMBbI6ysDqtj2b3DuQ/cZcquWtH9JuCLpGFOz227oXnJGAyrpSuIBqkEpedegFY3zCQz1xiZS4/VmbqZu6Kf4fAbnfd7t2EKLag7fLRP+gYlc8hdWugRGVbqoFf0+9pzCMG48fIJn/grg7bt2WCN90zFlxWb4aDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3yc1Tcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3yc1Tcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBEFC4CEDF;
	Sun,  9 Feb 2025 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140222;
	bh=FqNJ6UqFojjpII8sBMn0id8eG6MSR2NFISi/uXoXOtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3yc1TclMFUBV7la89jwOBPVVcbWq9j9foLUc+l8S0j49dsWRkglTHczvWZ8vSUbr
	 wD8rxcG6eePf4kB/0zJICVTMcSta23HMamwJHE6fo8Fp0v0A/ZkcOUtU9XTzHwlNZy
	 +Gyep4bt1xDGZTNwnAkA2n28MRQnXc6BcSBuVaqslF+JGVWoaypjRynftsYAbPdiKf
	 C7J0qpFDBdeJpw12H1SK8BUhLmUyc5msm80v3jZ7Ryi0H+ejgxjDYhgQGw+HwxKjQo
	 x7TmecEPgKUGc1ZAqYnJ6g+Y9xrKsHJG2JEsdQx1RPMLftIKiFUFxpU+TT64Gd/iyV
	 6KMEvGDKLmi5Q==
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
Subject: [PATCH 3/6 v2] sched: Use task_work_queued() on cid_work
Date: Sun,  9 Feb 2025 23:30:01 +0100
Message-ID: <20250209223005.11519-4-frederic@kernel.org>
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

Remove the ad-hoc implementation of task_work_queued()

Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..606f596a6e0d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10538,7 +10538,6 @@ static void task_mm_cid_work(struct callback_head *work)
 
 	SCHED_WARN_ON(t != container_of(work, struct task_struct, cid_work));
 
-	work->next = work;	/* Prevent double-add */
 	if (t->flags & PF_EXITING)
 		return;
 	mm = t->mm;
@@ -10582,7 +10581,6 @@ void init_sched_mm_cid(struct task_struct *t)
 		if (mm_users == 1)
 			mm->mm_cid_next_scan = jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 	}
-	t->cid_work.next = &t->cid_work;	/* Protect against double add */
 	init_task_work(&t->cid_work, task_mm_cid_work);
 }
 
@@ -10591,8 +10589,7 @@ void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
 	struct callback_head *work = &curr->cid_work;
 	unsigned long now = jiffies;
 
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) ||
-	    work->next != work)
+	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || task_work_queued(work))
 		return;
 	if (time_before(now, READ_ONCE(curr->mm->mm_cid_next_scan)))
 		return;
-- 
2.46.0

