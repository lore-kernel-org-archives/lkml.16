Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412C2E88AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551659; cv=none; b=X+EZOJrsfBWuYODyAWmpl061KzVrxit7tRfhN1Fd3ZVwW4J/RUyaxqxylB/Oz+hyzTdWiOvqQQtu5bwZVa5Hko3mkAX7hQ3zfjPt2KSyfRsRvKEQQ+N2yRSuB/3qsNIqF/mD3i7a3WmeyQorv4pXulU9TZBp3mEnwSrCuaub12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551659; c=relaxed/simple;
	bh=pCxc4nxfv0WShg8suY1U89MW7fSVleiCrPCrhGMxvUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwQkq9rDc2giArom8LQ7dBalVRibK/3gXHRsJ7tP9XtIRdbzJc6/0U+GmjiQfLdpPZk7AzK7KA9WBu3mOLwbZWfW3VUyBP7PpWnTAmur979XCTtBPPlOtQ2mVV1FFs+DIw0NN0I3O/bG421Mpw0/evLZW4qPfnQWypUNuuu8Tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmjUVF8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmjUVF8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4717DC4CEE3;
	Thu,  3 Jul 2025 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551658;
	bh=pCxc4nxfv0WShg8suY1U89MW7fSVleiCrPCrhGMxvUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jmjUVF8smGiBdaJpDYUBMLyv/HEqgN8HproRARYCC5NsKiL3pETBMB0d2DOK1kU1l
	 4fPMo6Dr0mhgusJQqqwp3/i5FYuUuhJg1CF4T6qMLkLOgjZPVDvbjrptsXN08cpTcY
	 VHgHigKzeGXXBvCQv/zZjiwjNapHiQA5TVYEWR801QtkTuae6IKmqnxYBtGHEFiU7T
	 K83LlSrd218SLELj+FB8CnWMEur58U/z88FYr2QemwuYcUY6AygcHPo3M3P3n9KPnh
	 b8dR6zUYrlp/Qpbf5yGNrqaJaKSCGeLZ+O/i/GQKjxeUkik7IB7Z49H4yUVrsEtYi1
	 Ye2VEhjuta9cw==
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
Subject: [PATCH 2/6] sched/fair: Use task_work_queued() on numa_work
Date: Thu,  3 Jul 2025 16:07:13 +0200
Message-ID: <20250703140717.25703-3-frederic@kernel.org>
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

Remove the ad-hoc implementation of task_work_queued().

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/fair.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..b350b0f4e7a5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3318,7 +3318,6 @@ static void task_numa_work(struct callback_head *work)
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
-	work->next = work;
 	/*
 	 * Who cares about NUMA placement when they're dying.
 	 *
@@ -3575,8 +3574,6 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	p->numa_scan_seq		= mm ? mm->numa_scan_seq : 0;
 	p->numa_scan_period		= sysctl_numa_balancing_scan_delay;
 	p->numa_migrate_retry		= 0;
-	/* Protect against double add, see task_tick_numa and task_numa_work */
-	p->numa_work.next		= &p->numa_work;
 	p->numa_faults			= NULL;
 	p->numa_pages_migrated		= 0;
 	p->total_numa_faults		= 0;
@@ -3617,7 +3614,7 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	/*
 	 * We don't care about NUMA placement if we don't have memory.
 	 */
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
+	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || task_work_queued(work))
 		return;
 
 	/*
-- 
2.48.1

