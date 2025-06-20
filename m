Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EC2ECEA4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433042; cv=none; b=NgT2H5KaE2FOZ+viLJLOo1hrLkQdv9RRDIsZ1tfdV4gtRvK25UJnfLUGuFStyCp9tISWnCJDW7dKdY5tTLwqTRIZZXYfBbkluCMuI0wpr2AnmS082/TV3jn0DbIPOFqJKT8SwrqX35tA565BdKDPSN969F9b+sank/84XbRnF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433042; c=relaxed/simple;
	bh=7S3CpVL6musulW7mm8cZzqVZcBLY7SkCm9k5f0nN0Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIdKoy/hoVsnHO8DiTmC4GP373nzHdSkz4o/+6LiFuB7dvgfh/y+YhPvGFii0E3++TvOwLVj7JfWegqTmHnQtL1g6zdu1hHeOTiULrXawC1ZJiBEnLqiYGrhmOTeQkWYem52CrXA/3l4PJ5YvUOEiTniNnOwMbrzYoPivekJKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utNbcnMD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utNbcnMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CEEC4CEF0;
	Fri, 20 Jun 2025 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433041;
	bh=7S3CpVL6musulW7mm8cZzqVZcBLY7SkCm9k5f0nN0Cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=utNbcnMDJu/YLI/m4XSsSSTIdVdwIeqVEAjH7AgIx3D6VKXFn4skDnOTrHOoCMbQk
	 01x9V0JVqAdLoqkVCsc+E5oVb5/Q0yXNy0+GcoGkuT95M/n56WSfDzV+ppSIHh+8eH
	 WMedA5yPeC7mYpiNxNcSLKMUn+/6EcyqUUkKUotROdtp+84g+mFY/wegouzQCLqfHF
	 k5A/nQjSvEyGtlKogMlvtUEMc5G9CamOIRrNGhPjAw7kyRZXkDqDZ8Ym9t/tAm1RH6
	 IND+cMVAvxDqjBuULmW5YFVCGzO7SQWECP2ple3oRL/wIEhXipu9Pqd4bZEdzPhDKd
	 ZDi8rwJfD4wDg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH 17/27] sched/isolation: Flush vmstat workqueues on cpuset isolated partition change
Date: Fri, 20 Jun 2025 17:22:58 +0200
Message-ID: <20250620152308.27492-18-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>
References: <20250620152308.27492-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime.
In order to synchronize against vmstat workqueue to make sure
that no asynchronous vmstat work is still pending or executing on a
newly made isolated CPU, the housekeeping susbsystem must flush the
vmstat workqueues.

This involves flushing the whole mm_percpu_wq workqueue, shared with
LRU drain, introducing here a welcome side effect.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/vmstat.h   | 2 ++
 kernel/sched/isolation.c | 1 +
 kernel/sched/sched.h     | 1 +
 mm/vmstat.c              | 5 +++++
 4 files changed, 9 insertions(+)

diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index b2ccb6845595..ba7caacdf356 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -303,6 +303,7 @@ int calculate_pressure_threshold(struct zone *zone);
 int calculate_normal_threshold(struct zone *zone);
 void set_pgdat_percpu_threshold(pg_data_t *pgdat,
 				int (*calculate_pressure)(struct zone *));
+void vmstat_flush_workqueue(void);
 #else /* CONFIG_SMP */
 
 /*
@@ -403,6 +404,7 @@ static inline void __dec_node_page_state(struct page *page,
 static inline void refresh_zone_stat_thresholds(void) { }
 static inline void cpu_vm_stats_fold(int cpu) { }
 static inline void quiet_vmstat(void) { }
+static inline void vmstat_flush_workqueue(void) { }
 
 static inline void drain_zonestat(struct zone *zone,
 			struct per_cpu_zonestat *pzstats) { }
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 6fb0c7956516..0119685796be 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -141,6 +141,7 @@ int housekeeping_update(struct cpumask *mask, enum hk_type type)
 	synchronize_rcu();
 
 	mem_cgroup_flush_workqueue();
+	vmstat_flush_workqueue();
 
 	kfree(old);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 53107c021fe9..e2c4258cb818 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -69,6 +69,7 @@
 #include <linux/types.h>
 #include <linux/u64_stats_sync_api.h>
 #include <linux/uaccess.h>
+#include <linux/vmstat.h>
 #include <linux/wait_api.h>
 #include <linux/wait_bit.h>
 #include <linux/workqueue_api.h>
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 53123675fe31..5d462fe12548 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -2095,6 +2095,11 @@ static void vmstat_shepherd(struct work_struct *w);
 
 static DECLARE_DEFERRABLE_WORK(shepherd, vmstat_shepherd);
 
+void vmstat_flush_workqueue(void)
+{
+	flush_workqueue(mm_percpu_wq);
+}
+
 static void vmstat_shepherd(struct work_struct *w)
 {
 	int cpu;
-- 
2.48.1

