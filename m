Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9F29ACF3;
	Wed, 25 Jun 2025 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847429; cv=none; b=C/t0gNa4JY2JmWKlt69qwNK/DB/MQ+4H22xqSe19nHPJXSbC4fDeortgwBT36I7zvgompZ8g2HnAEUkzNe/S3DONLEQI3UCXp7l8ezitm/RPIxD44Xl6cyzRerTkNyQWVjts2iYjnH0XgOQKP0stUFKgd/3YneR05VLnkciTiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847429; c=relaxed/simple;
	bh=YBuJbRZXELECNZqD3/9cEIoljzOL95bOblwK60NxZwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n7l+4wHKqFJohOx7LMwyVFuhs/ydyX5ySlbCI+Mxh0btCdV0Z1s0ZO6KdqisA5J3OKvhOHK5W5bc7PQdz2U3vEJARxgT6hTdutjirREXlEHm99XyjVMSTO+Pa3VByxYkw/J6aq+rbExjRMwhlx4TMEaGtTcNn92/QvY/U8WIoVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYXcoNQP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYXcoNQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750847427; x=1782383427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YBuJbRZXELECNZqD3/9cEIoljzOL95bOblwK60NxZwE=;
  b=kYXcoNQPeSv7mku2+C19Haqxj70QfKaX+snWIEQrv+LJ8Q2LWSGW7GJC
   iSrz+Tj948pWAV16KCbN5lAFxA2YL/yKtbJiRHumZQ7G+dSQiA7w4ShPz
   oJFV2dOsMlrsRrNa/KAf1LzU0ZCSfhfUSt9CdOeokisXt6+X48FV79ms/
   YPz3PLnSPIYGTrzty6F4EbZzUa/tPH/OY2JUKb+PogBoDbAblTkrVRtq4
   +m8ByBFuKtwjeGYwj7Eobn4IzzLm9iS80NyXWtoR4ZDEsnF6ciCtBErYy
   +ikF2IiBjxV5rG0kgz9dlW2k6U0yIX3ra1lgUQ8u0W7WmtUOwL1yvAGka
   w==;
X-CSE-ConnectionGUID: V6Hrx+MMS+uEAT5o3y1JHw==
X-CSE-MsgGUID: U3ZhtJ/ZTl2QYWWPNSOg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52975786"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52975786"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:30:27 -0700
X-CSE-ConnectionGUID: hBDZ77QHQ0S7tJvgRXim5A==
X-CSE-MsgGUID: wIh4g88qTq+twcTIuj/xyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152313416"
Received: from chenyu-dev.sh.intel.com ([10.239.62.107])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2025 03:30:17 -0700
From: Chen Yu <yu.c.chen@intel.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Libo Chen <libo.chen@oracle.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Phil Auld <pauld@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Aubrey Li <aubrey.li@intel.com>,
	Tim Chen <tim.c.chen@intel.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
Date: Wed, 25 Jun 2025 18:23:37 +0800
Message-Id: <20250625102337.3128193-1-yu.c.chen@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Problem Statement]
Currently, NUMA balancing is configured system-wide.
However, in some production environments, different
cgroups may have varying requirements for NUMA balancing.
Some cgroups are CPU-intensive, while others are
memory-intensive. Some do not benefit from NUMA balancing
due to the overhead associated with VMA scanning, while
others prefer NUMA balancing as it helps improve memory
locality. In this case, system-wide NUMA balancing is
usually disabled to avoid causing regressions.

[Proposal]
Introduce a per-cgroup interface to enable NUMA balancing
for specific cgroups. This interface is associated with
the CPU subsystem, which does not support threaded subtrees,
and close to CPU bandwidth control. The system administrator
needs to set the NUMA balancing mode to
NUMA_BALANCING_CGROUP=4 to enable this feature. When the
system is in NUMA_BALANCING_CGROUP mode, NUMA balancing
for all cgroups is disabled by default. After the
administrator enables this feature for a specific cgroup,
NUMA balancing for that cgroup is enabled.

A simple example to show how to use per-cgroup NUMA balancing:

Step1
//switch on per cgroup Numa balancing.
//All cgroup's NUMA balance is disabled by default.
echo 4 > /proc/sys/kernel/numa_balancing

Step2
//created a cgroup named mytest, enable its NUMA balancing
echo 1 > /sys/fs/cgroup/mytest/cpu.numa_load_balance

[Benchmark]
Tested on Xeon Sapphire Rapids, with 4 Numa nodes. Created
a cgroup mytest and launched autonumabench NUMA01_THREADLOCAL.
Each test runs 6 cycles.

baseline:
29360.56user 16280.68system 3:33.29elapsed
29788.41user 16060.31system 3:34.38elapsed
28307.51user 17043.45system 3:33.03elapsed
29552.49user 16307.65system 3:34.20elapsed
29847.41user 15966.15system 3:34.65elapsed
29111.10user 16532.78system 3:33.19elapsed

per cgroup NUMA balance:
7589.78user 16494.90system 1:53.18elapsed
7795.54user 16537.65system 1:54.11elapsed
8295.66user 16391.21system 1:55.98elapsed
7836.34user 17312.31system 1:55.71elapsed
7773.26user 16856.19system 1:54.08elapsed
7534.43user 17604.58system 1:55.01elapsed

The user time has been reduced to 33% of the
original, and the elapsed time has dropped to
45% of the original (lower values are better).

cat /sys/fs/cgroup/mytest/memory.stat | grep numa
numa_pages_migrated 10238503
numa_pte_updates 24378124
numa_hint_faults 16921590
numa_task_migrated 253
numa_task_swapped 4

to-do:
Per-cgroup NUMA balancing should consider the
hierarchy of the cgroup. Initially, NUMA balancing
is disabled for the root cgroup. A cgroup that has
NUMA balancing enabled should have all its parents
enabled. For example, suppose cgroup A is the parent
of cgroup B; if A.numa_load_balance is 0, even if
B.numa_load_balance is 1, NUMA balancing for B is
disabled. This idea is derived from
commit e39925734909 ("mm/memcontrol: respect
zswap.writeback setting from parent cgroup too").

Suggested-by: Tim Chen <tim.c.chen@intel.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
v1->v2:

Add documentation in Documentation/admin-guide/sysctl/kernel.rst.

Add comments in tg_numa_balance_enabled() to explain that
the newly introduced NUMA balancing mode is naturally
exclusive of existing NUMA balancing modes. (Tim)
---
 Documentation/admin-guide/sysctl/kernel.rst |  6 ++++
 include/linux/sched/sysctl.h                |  1 +
 kernel/sched/core.c                         | 31 +++++++++++++++++++++
 kernel/sched/fair.c                         | 28 +++++++++++++++++++
 kernel/sched/sched.h                        |  3 ++
 mm/mprotect.c                               |  5 ++--
 6 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index dd49a89a62d3..ff88d1153c19 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -709,6 +709,7 @@ The value to set can be the result of ORing the following:
 0 NUMA_BALANCING_DISABLED
 1 NUMA_BALANCING_NORMAL
 2 NUMA_BALANCING_MEMORY_TIERING
+4 NUMA_BALANCING_CGROUP
 = =================================
 
 Or NUMA_BALANCING_NORMAL to optimize page placement among different
@@ -729,6 +730,11 @@ different types of memory (represented as different NUMA nodes) to
 place the hot pages in the fast memory.  This is implemented based on
 unmapping and page fault too.
 
+Or NUMA_BALANCING_CGROUP to enable the per cgroup NUMA balancing.
+This new behavior can be opted-in/out on a per-cgroup basis via a new
+cgroup CPU subsystem file named numa_load_balance. By default, per
+cgroup NUMA balancing for each cgroup is enabled.
+
 numa_balancing_promote_rate_limit_MBps
 ======================================
 
diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
index 5a64582b086b..1e4d5a9ddb26 100644
--- a/include/linux/sched/sysctl.h
+++ b/include/linux/sched/sysctl.h
@@ -22,6 +22,7 @@ enum sched_tunable_scaling {
 #define NUMA_BALANCING_DISABLED		0x0
 #define NUMA_BALANCING_NORMAL		0x1
 #define NUMA_BALANCING_MEMORY_TIERING	0x2
+#define NUMA_BALANCING_CGROUP		0x4
 
 #ifdef CONFIG_NUMA_BALANCING
 extern int sysctl_numa_balancing_mode;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8988d38d46a3..8e9aa59193df 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10078,6 +10078,30 @@ static ssize_t cpu_max_write(struct kernfs_open_file *of,
 }
 #endif
 
+#ifdef CONFIG_NUMA_BALANCING
+static int numa_balance_write_u64(struct cgroup_subsys_state *css,
+				  struct cftype *cftype, u64 enable)
+{
+	struct task_group *tg;
+	bool was_enabled;
+
+	tg = css_tg(css);
+	was_enabled = READ_ONCE(tg->nlb_enabled);
+	if (was_enabled == enable)
+		return 0;
+
+	WRITE_ONCE(tg->nlb_enabled, enable);
+
+	return 0;
+}
+
+static u64 numa_balance_read_u64(struct cgroup_subsys_state *css,
+				 struct cftype *cft)
+{
+	return READ_ONCE(css_tg(css)->nlb_enabled);
+}
+#endif /* CONFIG_NUMA_BALANCING */
+
 static struct cftype cpu_files[] = {
 #ifdef CONFIG_GROUP_SCHED_WEIGHT
 	{
@@ -10126,6 +10150,13 @@ static struct cftype cpu_files[] = {
 		.seq_show = cpu_uclamp_max_show,
 		.write = cpu_uclamp_max_write,
 	},
+#endif
+#ifdef CONFIG_NUMA_BALANCING
+	{
+		.name = "numa_load_balance",
+		.read_u64 = numa_balance_read_u64,
+		.write_u64 = numa_balance_write_u64,
+	},
 #endif
 	{ }	/* terminate */
 };
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb..dcdee3bf9960 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3161,6 +3161,29 @@ void task_numa_free(struct task_struct *p, bool final)
 	}
 }
 
+/*
+ * Return true if the NUMA balance is allowed for
+ * the task in a task group.
+ */
+static bool tg_numa_balance_enabled(struct task_struct *p)
+{
+	/*
+	 * The min/max of sysctl_numa_balancing_mode ranges
+	 * from SYSCTL_ONE to SYSCTL_FOUR, so it is safe to
+	 * only check NUMA_BALANCING_CGROUP because it is
+	 * impossible to have both NUMA_BALANCING_CGROUP and
+	 * NUMA_BALANCING_NORMAL/NUMA_BALANCING_MEMORY_TIERING
+	 * set.
+	 */
+	struct task_group *tg = task_group(p);
+
+	if (tg && (sysctl_numa_balancing_mode & NUMA_BALANCING_CGROUP) &&
+	    !READ_ONCE(tg->nlb_enabled))
+		return false;
+
+	return true;
+}
+
 /*
  * Got a PROT_NONE fault for a page on @node.
  */
@@ -3189,6 +3212,9 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	     !cpupid_valid(last_cpupid)))
 		return;
 
+	if (!tg_numa_balance_enabled(p))
+		return;
+
 	/* Allocate buffer to track faults on a per-node basis */
 	if (unlikely(!p->numa_faults)) {
 		int size = sizeof(*p->numa_faults) *
@@ -3330,6 +3356,8 @@ static void task_numa_work(struct callback_head *work)
 	if (p->flags & PF_EXITING)
 		return;
 
+	if (!tg_numa_balance_enabled(p))
+		return;
 	/*
 	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
 	 * no page can be migrated.
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..4b0dc656688e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -485,6 +485,9 @@ struct task_group {
 	/* Effective clamp values used for a task group */
 	struct uclamp_se	uclamp[UCLAMP_CNT];
 #endif
+#ifdef CONFIG_NUMA_BALANCING
+	u64			nlb_enabled;
+#endif
 
 };
 
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 88608d0dc2c2..c288ffb92bfc 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -155,10 +155,11 @@ static long change_pte_range(struct mmu_gather *tlb,
 				toptier = node_is_toptier(nid);
 
 				/*
-				 * Skip scanning top tier node if normal numa
+				 * Skip scanning top tier node if normal and cgroup numa
 				 * balancing is disabled
 				 */
-				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
+				if (!(sysctl_numa_balancing_mode &
+				    (NUMA_BALANCING_CGROUP | NUMA_BALANCING_NORMAL)) &&
 				    toptier)
 					continue;
 				if (folio_use_access_time(folio))
-- 
2.25.1

