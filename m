Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4B1E5B94
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298621; cv=none; b=RX6BnYNb9NedGlDjIPE+dNzyw6a0XUBhP6SCJhSRLmfXb08KBybVhpSzLr9eR5ptJFWskrd5fXdDnzHghCPqgZ98Env+CQP29qUrS1VQtHftvd8/mxQ7uSR7Oz5hTrdYBU1qLCzkGn3i5cvQdKSHtgTINwE1p0J98bkTAO2F71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298621; c=relaxed/simple;
	bh=ljh+x804fC62Zjq89Q+GJgD75j99Lk55WXN2zidEDas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acCkSEAr2ydQnaJQJAZjaPcORFJ0MkpDejA5ZteYBNUMw9XT8z1BqbX4QwSDj3aPf4hsIbt5Dz23o7K+goqOHBUk5PVM8va/zmnY7q1UR4S8IE8LFw9uK8yeHDrQZP2vjup+UL8JbebaQX9Zr7aJWJVix0Mm8wS3T7oxO9UoAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLFodFHu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLFodFHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2711FC4CEEB;
	Thu, 10 Apr 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298621;
	bh=ljh+x804fC62Zjq89Q+GJgD75j99Lk55WXN2zidEDas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YLFodFHuby/VWTADh1XTREQPgLF8zm8Zsf4Qepn6NufyHBWQZcyEDchrBNZm7HdS5
	 VitZLkZM5ehaBZssJZ1KhFAJlU6IuBMIvKrpfnS6zaG4zzl6rU4XFAvjsZSWxY0CuN
	 UmwcCq5htpVOfdJDAV66kmGRajrA8nK7cQ+4Y/B10AJrVJEQAONwwdG3cCATQ/RA3I
	 dHrNP+Ykjx6IhVG9lwZyk3FiBWZiNgCiE+ofc0Pxi+YApfamUxSRWA/+fVkqyIYDef
	 yB/Ls3829yJuQy0adG4giYgtFoWsr2fV1EqyFpJpFAMFY8tI3S32euaFPpsWP/j7Iw
	 Jhhmi5nhfZ8KA==
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
Date: Thu, 10 Apr 2025 17:23:23 +0200
Message-ID: <20250410152327.24504-3-frederic@kernel.org>
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

Remove the ad-hoc implementation of task_work_queued().

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Valentin Schneider <vschneid@redhat.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/fair.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e43993a4e580..c6ffa2fdbbd6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3317,7 +3317,6 @@ static void task_numa_work(struct callback_head *work)
 
 	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
 
-	work->next = work;
 	/*
 	 * Who cares about NUMA placement when they're dying.
 	 *
@@ -3565,8 +3564,6 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	p->numa_scan_seq		= mm ? mm->numa_scan_seq : 0;
 	p->numa_scan_period		= sysctl_numa_balancing_scan_delay;
 	p->numa_migrate_retry		= 0;
-	/* Protect against double add, see task_tick_numa and task_numa_work */
-	p->numa_work.next		= &p->numa_work;
 	p->numa_faults			= NULL;
 	p->numa_pages_migrated		= 0;
 	p->total_numa_faults		= 0;
@@ -3607,7 +3604,7 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	/*
 	 * We don't care about NUMA placement if we don't have memory.
 	 */
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
+	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || task_work_queued(work))
 		return;
 
 	/*
-- 
2.48.1

