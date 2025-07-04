Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD051273F9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637761; cv=none; b=ZUYgvaEi71DbUeZ7LHnX6VZZP5NRie5VFGGdr7BAVoaTv8GO5hTMfcFe8bP9YxZNkJtppy+jke2R/lDsqnQZr7bcQYQSlvR3OkIb+dfRdoRVOxNJxeHHNtHtUnBpW/bjB7vFVnlLPYRYETcqibSy5FHCulJkDMyylnDoVT02O9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637761; c=relaxed/simple;
	bh=z4NiysJi/pzKaPKoYnPgtRUlk8zSuboSjm4/VXDO7/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=puDHQgKCfOET+cRKWC7b4YCr7YNG+IIre7Xa4rIiZ6TKkX0rod7k7bg3lgKMqENMbylfttkAQ1Eqy1OWji0dlPFw/kZiT3gZgHNUxnosm72QW72Kas90sfhDtjs+7048AL2sms+6Oui/1hL4nUGKITBboYQ+NfV+OTFWZN35sOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgwK/LqK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgwK/LqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751637760; x=1783173760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z4NiysJi/pzKaPKoYnPgtRUlk8zSuboSjm4/VXDO7/Y=;
  b=WgwK/LqKyuFK1AYJICCr0fvL97dnI30Xfou41dFu+aF3Er0IjqEK1axN
   sQIqJHGq7uorRRU5DLHZBFs+ytr54U7HpkOTuLYY3ZzJb/1Eyr5HlRMrt
   oV+h7FtY6OFYzinVUko6HkvtHv2AJ5I3qLvdfG306aENsYZ54jRs8XL3Q
   IfMMmYFJZYFjTOE93GtQsAj2nn15BhZEB8sKPuqJAnjpcDEFHf8+/Sd25
   ZsPv2cH5n0rZeruu/eOiQCY37yDYbA6JTUmzqp+Jq/Pkxu+HE71NUU4nZ
   Ltr41q+jTFWI4nXLw/l1PZqc0zYK7JOFGHkBmJ9WLFMP8KvQxScraFwyB
   A==;
X-CSE-ConnectionGUID: 9NdTSnViQIaT+sO9Qa8r1g==
X-CSE-MsgGUID: Gh38vDFBRH+C4ikAFwkSvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53944878"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53944878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 07:02:39 -0700
X-CSE-ConnectionGUID: jusLOYYHQVGTsi8V2vLmmA==
X-CSE-MsgGUID: aPqqQyJ3RxO/KtTi85zdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="158994295"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2025 07:02:36 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>,
	Libo Chen <libo.chen@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "sched/numa: add statistics of numa balance task"
Date: Fri,  4 Jul 2025 21:56:20 +0800
Message-Id: <20250704135620.685752-1-yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit ad6b26b6a0a79166b53209df2ca1cf8636296382.

This commit introduces per-memcg/task NUMA balance statistics,
but unfortunately it introduced a NULL pointer exception due
to the following race condition: After a swap task candidate
was chosen, its mm_struct pointer was set to NULL due to task
exit. Later, when performing the actual task swapping, the
p->mm caused the problem.

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

task_lock() should be held and the PF_EXITING flag needs to
be checked to prevent this from happening. After discussion,
the conclusion was that adding a lock is not worthwhile for
some statistics calculations. Revert the change and rely on
the tracepoint for this purpose.

Fixes: ad6b26b6a0a7 ("sched/numa: add statistics of numa balance task")
Reported-by: Jirka Hladky <jhladky@redhat.com>
Closes: https://lore.kernel.org/all/CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com/
Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
Reported-by: Suneeth D <Suneeth.D@amd.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 6 ------
 include/linux/sched.h                   | 4 ----
 include/linux/vm_event_item.h           | 2 --
 kernel/sched/core.c                     | 9 ++-------
 kernel/sched/debug.c                    | 4 ----
 mm/memcontrol.c                         | 2 --
 mm/vmstat.c                             | 2 --
 7 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0cc35a14afbe..bd98ea3175ec 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1732,12 +1732,6 @@ The following nested keys are defined.
 	  numa_hint_faults (npn)
 		Number of NUMA hinting faults.
 
-	  numa_task_migrated (npn)
-		Number of task migration by NUMA balancing.
-
-	  numa_task_swapped (npn)
-		Number of task swap by NUMA balancing.
-
 	  pgdemote_kswapd
 		Number of pages demoted by kswapd.
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 4f78a64beb52..aa9c5be7a632 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -548,10 +548,6 @@ struct sched_statistics {
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
 	u64				nr_forced_migrations;
-#ifdef CONFIG_NUMA_BALANCING
-	u64				numa_task_migrated;
-	u64				numa_task_swapped;
-#endif
 
 	u64				nr_wakeups;
 	u64				nr_wakeups_sync;
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 91a3ce9a2687..9e15a088ba38 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -66,8 +66,6 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		NUMA_HINT_FAULTS,
 		NUMA_HINT_FAULTS_LOCAL,
 		NUMA_PAGE_MIGRATE,
-		NUMA_TASK_MIGRATE,
-		NUMA_TASK_SWAP,
 #endif
 #ifdef CONFIG_MIGRATION
 		PGMIGRATE_SUCCESS, PGMIGRATE_FAIL,
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..ca0be74e865b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3362,10 +3362,6 @@ void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
 #ifdef CONFIG_NUMA_BALANCING
 static void __migrate_swap_task(struct task_struct *p, int cpu)
 {
-	__schedstat_inc(p->stats.numa_task_swapped);
-	count_vm_numa_event(NUMA_TASK_SWAP);
-	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
-
 	if (task_on_rq_queued(p)) {
 		struct rq *src_rq, *dst_rq;
 		struct rq_flags srf, drf;
@@ -7934,9 +7930,8 @@ int migrate_task_to(struct task_struct *p, int target_cpu)
 	if (!cpumask_test_cpu(target_cpu, p->cpus_ptr))
 		return -EINVAL;
 
-	__schedstat_inc(p->stats.numa_task_migrated);
-	count_vm_numa_event(NUMA_TASK_MIGRATE);
-	count_memcg_event_mm(p->mm, NUMA_TASK_MIGRATE);
+	/* TODO: This is not properly updating schedstats */
+
 	trace_sched_move_numa(p, curr_cpu, target_cpu);
 	return stop_one_cpu(curr_cpu, migration_cpu_stop, &arg);
 }
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..557246880a7e 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1210,10 +1210,6 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
-#ifdef CONFIG_NUMA_BALANCING
-		P_SCHEDSTAT(numa_task_migrated);
-		P_SCHEDSTAT(numa_task_swapped);
-#endif
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 902da8a9c643..70fdeda1120b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -474,8 +474,6 @@ static const unsigned int memcg_vm_event_stat[] = {
 	NUMA_PAGE_MIGRATE,
 	NUMA_PTE_UPDATES,
 	NUMA_HINT_FAULTS,
-	NUMA_TASK_MIGRATE,
-	NUMA_TASK_SWAP,
 #endif
 };
 
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 429ae5339bfe..a78d70ddeacd 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1346,8 +1346,6 @@ const char * const vmstat_text[] = {
 	"numa_hint_faults",
 	"numa_hint_faults_local",
 	"numa_pages_migrated",
-	"numa_task_migrated",
-	"numa_task_swapped",
 #endif
 #ifdef CONFIG_MIGRATION
 	"pgmigrate_success",
-- 
2.25.1

