Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208A02E92AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551662; cv=none; b=fWKHI2XdZ8N6F6bCf4wabmJ6lhYdlTX46SBnOURBny0w9cLDVPU0/jNXm9V4TFdYq4ezy9GfyOkNMcPjP/UXUTwDkaIBXZZvpcB2r8GKrgpHwaIV+xZznrVJnvwBiSC5Dr1MNuHmEizZsnbXcRuXldOFtKF8Y/GDGARJB1J7iCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551662; c=relaxed/simple;
	bh=X/u6N70lmZ7psbV6ssBZolq4F8KRBqL9Apr7baO/45s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EU2gL5VRBHRudEtQA8HuKwx9uUYfCHTWNFUlg7u9PYqz9dueE7EIMboZcRkDPjPH1eusplNYwR8mmsOQV7/hqAaxcrL56pnDBhvXjahJpBakGbvoOJVcanx/abLjKzLPdvHk9cbpq7io0H1AyD8qjt2Y8iJkx5YJ/ZnD6XnfXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsiUUfLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsiUUfLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3D0C4CEF0;
	Thu,  3 Jul 2025 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551661;
	bh=X/u6N70lmZ7psbV6ssBZolq4F8KRBqL9Apr7baO/45s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsiUUfLDeoYsY9wMs+o30nMR0v75V/D1vnglMQOtKFWss6tuHhnNlgmShoRGFkng+
	 RHjCxuqo378saLlIr8EPpAwDFkVdccWdKINtQoE9q/RkFAEB+wvD5e/PhlYG0H2lD+
	 v5gDiXtwwubU4gVXkvtzNEv8vibqtlec8HRIhegNjBfGIYISqhUbRypCtxqwF8wbuS
	 +Qia0SlBcXD0mamUopfNZm3R8vymX+U1BhYCuq46ggqQcMG4whevkMWIhqiySPysoe
	 AhSwERH3CdtELB7qmA4+yhQb80nRGFrSPcPrNearTIvuTDplZnjEiUYQUhA48YYjR2
	 hE63GnImtLD2w==
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
Date: Thu,  3 Jul 2025 16:07:14 +0200
Message-ID: <20250703140717.25703-4-frederic@kernel.org>
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

Remove the ad-hoc implementation of task_work_queued()

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..35783a486c28 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10599,7 +10599,6 @@ static void task_mm_cid_work(struct callback_head *work)
 
 	WARN_ON_ONCE(t != container_of(work, struct task_struct, cid_work));
 
-	work->next = work;	/* Prevent double-add */
 	if (t->flags & PF_EXITING)
 		return;
 	mm = t->mm;
@@ -10643,7 +10642,6 @@ void init_sched_mm_cid(struct task_struct *t)
 		if (mm_users == 1)
 			mm->mm_cid_next_scan = jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 	}
-	t->cid_work.next = &t->cid_work;	/* Protect against double add */
 	init_task_work(&t->cid_work, task_mm_cid_work);
 }
 
@@ -10652,8 +10650,7 @@ void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
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

