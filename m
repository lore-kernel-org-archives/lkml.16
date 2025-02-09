Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB9241130
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140219; cv=none; b=HgwI9cJx2GuyHBOBdOEx+M6N3YPJFiTdl/P5GFmg5UTXexrPTBlAvcz0+nAXwPQA/H1ZwdeXcQlHk2K90Te5IFfybzdV7ORiMvgdRPE9u/cSf9PEz0lz9XzbCfold/nsw5SydhZHtgJku84mQogTgrV0IOTuzxHcAAcmmLLyY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140219; c=relaxed/simple;
	bh=ZSwI4jjw4GwkwAYOaWT3SF4KhLf9zm4bvh5Jlfu1Q2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djV+rk6YkB2cP0v26Ze1USYKcui1Wnt5XHQUGo4RLv73DeKFClsU4zJUZ7BZL4Vihv4IiHNVHUE1kI43jc5ek1UrwasO2Eor7oxfGChHbo2/Uo3sGPb6EhMhXdnJ+CgoQRCSB8ocs8iP7mcaM60SMZg7PeIRyMiHG4orjcGiIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwO/kDlD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwO/kDlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960E4C4CEE5;
	Sun,  9 Feb 2025 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739140219;
	bh=ZSwI4jjw4GwkwAYOaWT3SF4KhLf9zm4bvh5Jlfu1Q2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EwO/kDlDiWWnwTYOvc8Wn8BZKybBl8uluDwXw+J8N/hg8bPkRKhsgmNiGp96wemhW
	 pK9lDV47kMS4n9Q9dVw7HhKnYg5h6s+YZTZw9Cfo23iUx0wgHGiMeUmOm/kLmSjmCH
	 EtXXDe6Oyuvv8wTXW2OEfMWsrIiCM0JlEpKMRyoc5ERxfiBW/wZQ31kenSphOApFmF
	 96QgMhFEQuNq0gGlKvCZauQLWQVQZd9rwHiRQdoUwM2sdD+gY+1H+O44p8J7VokeEt
	 jDbHxzNwUMnuFEm9LfXRfs4n5e9xWmozs7DdkyXijWLGxrhjbp0fX0Rax8A5Y9SpFn
	 wYbMkbB7Vm0Bw==
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
Subject: [PATCH 2/6 v2] sched/fair: Use task_work_queued() on numa_work
Date: Sun,  9 Feb 2025 23:30:00 +0100
Message-ID: <20250209223005.11519-3-frederic@kernel.org>
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

Remove the ad-hoc implementation of task_work_queued().

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/fair.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ce2e94ccad0c..6a2f45821dc0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3303,7 +3303,6 @@ static void task_numa_work(struct callback_head *work)
 
 	SCHED_WARN_ON(p != container_of(work, struct task_struct, numa_work));
 
-	work->next = work;
 	/*
 	 * Who cares about NUMA placement when they're dying.
 	 *
@@ -3551,8 +3550,6 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	p->numa_scan_seq		= mm ? mm->numa_scan_seq : 0;
 	p->numa_scan_period		= sysctl_numa_balancing_scan_delay;
 	p->numa_migrate_retry		= 0;
-	/* Protect against double add, see task_tick_numa and task_numa_work */
-	p->numa_work.next		= &p->numa_work;
 	p->numa_faults			= NULL;
 	p->numa_pages_migrated		= 0;
 	p->total_numa_faults		= 0;
@@ -3593,7 +3590,7 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	/*
 	 * We don't care about NUMA placement if we don't have memory.
 	 */
-	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
+	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || task_work_queued(work))
 		return;
 
 	/*
-- 
2.46.0

