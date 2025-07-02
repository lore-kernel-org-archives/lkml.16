Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050472F508D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474362; cv=none; b=meSrhBpKa18+XL5ilTEx8keRaGwYuqpySutiVOaLl6KZWF+rpvu8TOrY+2Cqw5C9RT/uim2WSEx7jQcwbqZUNRrCgLIb7aVs5XD1G2c7cvllYI4gHVJf8nxNIlWHO27NigLRMiPhhuCo0CjlAajX2xgNJmeMTnLAWQCbfmO/GY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474362; c=relaxed/simple;
	bh=mkZtPVIJxNSdFw1wPgvwv6fkAXp9yv5nGBIFnYnZ650=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bdgbz+zggOybA4en+WferC7h/1pJRRSlXt7OOWIkAJ+RalrCDB/3g4gA+kNbxPNoQ6fjVt5zm/5vBlwi7IY4RdHe194usycWGoT6KcL/q6teSQNbpCyDmbpDMTAqw9bQbYM5+Ns4JqPImaPzxXmHx9GA8CSb4U1RvV0RX8c+5Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+rChE9M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+rChE9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474361; x=1783010361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mkZtPVIJxNSdFw1wPgvwv6fkAXp9yv5nGBIFnYnZ650=;
  b=W+rChE9MK/+iAGA+2U1/KOz/UNs0LoWZl0LZBwrF7hlhAP8QA+a1+PlA
   C0sCT4OExZ224g7VRZ/kgu15iibwcQS3tqUYF7B/BleHKgB1MI0OTGZFF
   44C8M6AEuDSR0fsx7G4v6xz82m6mH6DM2fkH9R4F7oyLELzIEvz3KK1Wh
   MrZ4DY5OjIVfc0WbUP9H32svzj7Jzww+MaQGS5kqZdCZcSDHN3n6htlX6
   D7tMLXQUV/1DfgW6kJsrv+fMOeRDAYjkq4MxsyT2CAmUUbo8hgSV7VvrW
   irCfq2GMvcfvlmKJ+1pgaIZL+0zRoA33nws5WZSFHvNxzMgx/7EXlqMwe
   w==;
X-CSE-ConnectionGUID: 2SFHJmubQvyvN8u3dMvhYQ==
X-CSE-MsgGUID: sze6evWKSfqyPBhFhFwqdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57459028"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57459028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:39:20 -0700
X-CSE-ConnectionGUID: +6bmY5Z1QaiCFOPx0aXT/w==
X-CSE-MsgGUID: s05pUEKxSAqwk/RSkNnYWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185154451"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2025 09:39:16 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	Chen Yu <yu.c.chen@intel.com>,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>,
	Libo Chen <libo.chen@oracle.com>
Subject: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng task swap
Date: Thu,  3 Jul 2025 00:32:47 +0800
Message-Id: <20250702163247.324439-1-yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported that after Commit ad6b26b6a0a7
("sched/numa: add statistics of numa balance task"),
a NULL pointer exception[1] occurs when accessing
p->mm. The following race condition was found to
trigger this bug: After a swap task candidate is
chosen during NUMA balancing, its mm_struct is
released due to task exit. Later, when the task
swapping is performed, p->mm is NULL, which causes
the problem:

CPU0                                   CPU1
:
...
task_numa_migrate
   task_numa_find_cpu
    task_numa_compare
      # a normal task p is chosen
      env->best_task = p

                                        # p exit:
                                        exit_signals(p);
                                           p->flags |= PF_EXITING
                                        exit_mm
                                           p->mm = NULL;

    migrate_swap_stop
      __migrate_swap_task((arg->src_task, arg->dst_cpu)
       count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL

Fix this issue by checking if the task has the PF_EXITING
flag set in migrate_swap_stop(). If it does, skip updating
the memcg events. Additionally, log a warning if p->mm is
NULL to facilitate future debugging.

Fixes: ad6b26b6a0a7 ("sched/numa: add statistics of numa balance task")
Reported-by: Jirka Hladky <jhladky@redhat.com>
Closes: https://lore.kernel.org/all/CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com/
Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
Reported-by: Suneeth D <Suneeth.D@amd.com>
Suggested-by: Libo Chen <libo.chen@oracle.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..4e06bb955dad 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
 {
 	__schedstat_inc(p->stats.numa_task_swapped);
 	count_vm_numa_event(NUMA_TASK_SWAP);
-	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
+	/* exiting task has NULL mm */
+	if (!(p->flags & PF_EXITING)) {
+		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
+			  p->pid, p->comm, p->flags);
+
+		if (p->mm)
+			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
+	}
 
 	if (task_on_rq_queued(p)) {
 		struct rq *src_rq, *dst_rq;
-- 
2.25.1

