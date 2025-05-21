Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB320D509
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814705; cv=fail; b=twT3nYH4ghs7o1HnnxDLR3iRDjjMAZhm6TLgUyQuDc1jCB+VfFuScmNCeMUEYXTI/gHoahW4HHSTPaU4kBTo7vYUGNnLeF7WBwxMXP6/XDVAeEms1HxAJHBrfnz73tIbIdS+uK4OuEKfADnimPf9AoDZlYLHaPF0gqXKvVygQkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814705; c=relaxed/simple;
	bh=6Nv+sZcRe4cseEUcVuEgogjtncqQ6JnCgyFh76W4HkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HA2ifKQ5JPUog0v9uuDc5Rcdf7AmZCvrxsyUsyQAkhwKwR0jd2hPRb5nETE+wM4+jazCf0N1P5/8g9CYSzEuLh3Gae3qz5zi2EjeJ9lpYAE8VTEU3nfVxKqTG/DDO4rbT/44ABhpKLAxG6AfV0iKsfhQYi9ctt+KUsBQUg57pSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YzfW55Dc; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YzfW55Dc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcxiTNX/RliENQQGGAIVo6sJ6MkHOnkT+f8ZAEQeVWALSuTOsGitix5X6Xk2liHWnOG6IOqzKF1wvr0gdAus8kNaAuRmI/Z+sY/V1bSamqTPbEiO0o5REKdzG7+M0YqZwCxkzNYr4r0vTzcKkiOhqS5VZD+0wFwkjJ9TBHyBsKjdlXALQf2Eh5vV+lc5Bxibfa/fdIvMtOELX58TrLkOKuMpEWfTDphA48BPDBAQLUGcpUIWn2wbYplmQ0a11YdnHUTYb0xPiAUsm8mP133cjN1+l8zdCF1E3jAJ8DuMoPNT0Fw14RxtscAfNY7mPMtkgJvoSJWOAqScPPZNJsZS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW6vB0r/b/8yFSizvGvpUEKWG6/vnpS6qXGLcnTnUkA=;
 b=hJa0VY7Zxdi3CVp/MUaviVYhyLrLQOjpepT8EE3UNj0MrvB97T8lmZvFHIbQD0sflN9sSdFBJ+RLPFwPICnL5lJKOCX9gBIIlgGDTtPMaLuqe/dJFs+ghUZY5oJHaN9saqmFnWvqQiuD18RYPBwkHqCBEWWve42Hau8Waf0Vq+wv28eOE/w8QcCycWp1QpeMfAtzHdP7h+G1lf79JCTEyH0mincCBSqJdFhQMZ8FfbYSDdyAjun3NxvCLxVKQ7q5VqDnddVPboK//Ljc+aQ3r4YNEbBbBjwK5GBwVWr6wU10zUfm1QHq7X+ePt4IPqRTOmvxqgPwOePSHMpeEMzRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PW6vB0r/b/8yFSizvGvpUEKWG6/vnpS6qXGLcnTnUkA=;
 b=YzfW55DcUUv/CgZnPZHgKLrKVhNaWmdDo5PKj+Fr8YKyrWoQPeKirTggzaY8U8G4b4rcmNEAJQD34fmPN9/FTOC6QxH6L5gH2yFmPBcPQ2QO6qhj0xjSVWCuMf85T81jDh/RZExdD4Hqv4RqKryI+T5N8cYkzZGdJe1drTN6xks=
Received: from CH0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:b0::32)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 08:04:59 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::87) by CH0PR03CA0027.outlook.office365.com
 (2603:10b6:610:b0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 08:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 08:04:59 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 03:04:49 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<joshua.hahnjy@gmail.com>, <xuezhengchu@huawei.com>, <yiannis@zptcorp.com>,
	<akpm@linux-foundation.org>, <david@redhat.com>, Bharata B Rao
	<bharata@amd.com>
Subject: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Wed, 21 May 2025 13:32:38 +0530
Message-ID: <20250521080238.209678-3-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521080238.209678-1-bharata@amd.com>
References: <20250521080238.209678-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 519e9c91-95d9-4691-f178-08dd983e2e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RPS3qK0Zg5J1OyWcY9kta1njzx7eOWbD41YWeZioHwBl55IUQ1syhuo8KRuz?=
 =?us-ascii?Q?oYISiXH4n42TxAoD4p/0w5vHmLti2a3VdtHtrSqVdF8qYwILwZnWI7uj3WL3?=
 =?us-ascii?Q?GMpN1Zx7gaVp/M5qZQxLMdrGnxJVDGsYmdzqC8iiQuHRTPCZLYKJWxKXQ+SY?=
 =?us-ascii?Q?H/Xk0ZwJ9hut1tmQ3p6HBZjaIH6sYdf5UASnLazAatKwohSscH6jbS1ewC4W?=
 =?us-ascii?Q?8Jgufen1Fpf1axTpcO9WUwhDH6z4pw2ylpjyvhRoc9Gr48VXVagWqooAIfMA?=
 =?us-ascii?Q?uKLrYHxrmLEEivD9LfiE9v75iF5IjNi7xqgYJA2FUBZba8yevFSuiBn6fgV4?=
 =?us-ascii?Q?Soo/mErfSMIMtN+9+/QCYypEH7v6Kd00YlR+VkDSMGFN6rVvW4H3oZ7SaS0H?=
 =?us-ascii?Q?2u85h6XoT7IwBDiYIowJdSIrNIuk41wpSoSg1eAtlYO3Hj4/PdvDYAo3svCJ?=
 =?us-ascii?Q?U0V7DHm8DAwUeqJV/P+1DovlF/sjWEJ9UU/zBP+fU1M+kVmiiEx8mNpGSn8Q?=
 =?us-ascii?Q?MOMBzR8euKgdlYU0AMMz3h3VpIlZwH+cjT2MrbxgIm3r+LaNTyKLak80sCOU?=
 =?us-ascii?Q?bmFTFXYJGWKzpflHs1504zCir2VU2BZnpZn6cYb2ctRszrcolW+gJ9/acr4m?=
 =?us-ascii?Q?K3ThnVVG4Uk1cEVNnOWGuqfJuGtFKHgE1oHHqAtKZbF6WNShmhlL1sP/8mCq?=
 =?us-ascii?Q?y93H/MniKOU1sVh1ppzm7dB5Ve0QVzOk88CFkQyNIinxJKca7DJkBqyQuJwP?=
 =?us-ascii?Q?szjBKRUQJQuUQWLukIBMvq2e0pv+TKR9KKPGCadD3IdGEqYlJU3gW/7aRoYG?=
 =?us-ascii?Q?YKZ3in5s8nI6TN7MbNTAtnOhl3A9OrTucbsZFznSSaL6J0IS9uDFCSa60tlu?=
 =?us-ascii?Q?0zQf9CmHvUhKzVgSRT9WZPUFOnD1bluWes7DR6Fnm+56nPli5jiHaVnkVLDv?=
 =?us-ascii?Q?ltRq0q0C4AoyS70zXTxzyj/SPHTcesBjmip9cP9VH5TT3Nepb93h7JmNRxCx?=
 =?us-ascii?Q?+PQOxW21nJWF1q5oIqyA1503rdmRn/OZs3hnS+zeJPwhDlvG2jcfbyFxvEru?=
 =?us-ascii?Q?UHa0WhOTmNBztSBv17KetKT23A/aqmrsoJbuUa93K3F0TyrapgcgPJ2qvgzx?=
 =?us-ascii?Q?l1HTUTHvKmiyjYAYAdlTYf0G9JnFORjRT1EjL6LCJtVakhqTKZPzZIc4Ga7k?=
 =?us-ascii?Q?h3p1+YWGJ2Z5VDyb7kLpa21TQwUJGVJ2OpVo9muMD0z679N2RoyrVOjLE7Ez?=
 =?us-ascii?Q?HKkbKXdQIAYsFAJZUDRdSHL2g3+qjXUzH+Cssh0UiMm8MM8KAnGO0iRGtnbf?=
 =?us-ascii?Q?dGC51l7HTE2tJUFz2+qQyA+0Ds4WAs03kl4eu8IWLWpUgmGOsC4p04G0nyHO?=
 =?us-ascii?Q?FkJX3i+ULW3/CJNZJiI8tM6rukS6B7h4eNkd2B+30T4boAekqG53qTWxEPEs?=
 =?us-ascii?Q?ogXOkWoi9nKF5qPbh27XQpKjZFsKbA5JVaK7GVtK5jnvEEpk7cqhP3JZX+G4?=
 =?us-ascii?Q?i/iPsJ/LS6eoO0NxT8+lM4dgY3lpbV5bhbOD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:04:59.2198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 519e9c91-95d9-4691-f178-08dd983e2e8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929

Currently the folios identified as misplaced by the NUMA
balancing sub-system are migrated one by one from the NUMA
hint fault handler as and when they are identified as
misplaced.

Instead of such singe folio migrations, batch them and
migrate them at once.

Identified misplaced folios are isolated and stored in
a per-task list. A new task_work is queued from task tick
handler to migrate them in batches. Migration is done
periodically or if pending number of isolated foios exceeds
a threshold.

The PTEs for the isolated folios are restored to PRESENT
state right after isolation.

The last_cpupid field of isolated folios is used to store
the target_nid to which the folios need to be migrated to.
This needs changes to (at least) a couple of places where
last_cpupid field is updated/reset which now should happen
conditionally. The updation in folio_migrate_flags() isn't
handled yet but the reset in write page fault case is
handled.

The failed migration count isn't fed back to the scan period
update heuristics currently.

Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 include/linux/sched.h |  4 +++
 init/init_task.c      |  2 ++
 kernel/sched/fair.c   | 64 +++++++++++++++++++++++++++++++++++++++++++
 mm/memory.c           | 44 +++++++++++++++--------------
 4 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..4177ecf53633 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1360,6 +1360,8 @@ struct task_struct {
 	u64				last_task_numa_placement;
 	u64				last_sum_exec_runtime;
 	struct callback_head		numa_work;
+	struct callback_head		numa_mig_work;
+	unsigned long			numa_mig_interval;
 
 	/*
 	 * This pointer is only modified for current in syscall and
@@ -1397,6 +1399,8 @@ struct task_struct {
 	unsigned long			numa_faults_locality[3];
 
 	unsigned long			numa_pages_migrated;
+	struct list_head		migrate_list;
+	unsigned long			migrate_count;
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_RSEQ
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..997af6ab67a7 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -187,6 +187,8 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 	.numa_preferred_nid = NUMA_NO_NODE,
 	.numa_group	= NULL,
 	.numa_faults	= NULL,
+	.migrate_count	= 0,
+	.migrate_list	= LIST_HEAD_INIT(init_task.migrate_list),
 #endif
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	.kasan_depth	= 1,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0fb9bf995a47..d6cbf8be76e1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -49,6 +49,7 @@
 #include <linux/ratelimit.h>
 #include <linux/task_work.h>
 #include <linux/rbtree_augmented.h>
+#include <linux/migrate.h>
 
 #include <asm/switch_to.h>
 
@@ -1463,6 +1464,8 @@ unsigned int sysctl_numa_balancing_scan_delay = 1000;
 /* The page with hint page fault latency < threshold in ms is considered hot */
 unsigned int sysctl_numa_balancing_hot_threshold = MSEC_PER_SEC;
 
+#define NUMAB_BATCH_MIGRATION_THRESHOLD	512
+
 struct numa_group {
 	refcount_t refcount;
 
@@ -3297,6 +3300,46 @@ static bool vma_is_accessed(struct mm_struct *mm, struct vm_area_struct *vma)
 
 #define VMA_PID_RESET_PERIOD (4 * sysctl_numa_balancing_scan_delay)
 
+/*
+ * TODO: Feed failed migration count back to scan period update
+ * mechanism.
+ */
+static void migrate_queued_pages(struct list_head *migrate_list)
+{
+	int cur_nid, nid;
+	struct folio *folio, *tmp;
+	LIST_HEAD(nid_list);
+
+	folio = list_entry(migrate_list, struct folio, lru);
+	cur_nid = folio_last_cpupid(folio);
+
+	list_for_each_entry_safe(folio, tmp, migrate_list, lru) {
+		nid = folio_xchg_last_cpupid(folio, -1);
+
+		if (cur_nid != nid) {
+			migrate_misplaced_folio_batch(&nid_list, cur_nid);
+			cur_nid = nid;
+		}
+		list_move(&folio->lru, &nid_list);
+	}
+	migrate_misplaced_folio_batch(&nid_list, cur_nid);
+}
+
+static void task_migration_work(struct callback_head *work)
+{
+	struct task_struct *p = current;
+
+	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_mig_work));
+
+	work->next = work;
+
+	if (list_empty(&p->migrate_list))
+		return;
+
+	migrate_queued_pages(&p->migrate_list);
+	p->migrate_count = 0;
+}
+
 /*
  * The expensive part of numa migration is done from task_work context.
  * Triggered from task_tick_numa().
@@ -3567,14 +3610,19 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	p->numa_migrate_retry		= 0;
 	/* Protect against double add, see task_tick_numa and task_numa_work */
 	p->numa_work.next		= &p->numa_work;
+	p->numa_mig_work.next		= &p->numa_mig_work;
+	p->numa_mig_interval			= 0;
 	p->numa_faults			= NULL;
 	p->numa_pages_migrated		= 0;
 	p->total_numa_faults		= 0;
 	RCU_INIT_POINTER(p->numa_group, NULL);
 	p->last_task_numa_placement	= 0;
 	p->last_sum_exec_runtime	= 0;
+	p->migrate_count		= 0;
+	INIT_LIST_HEAD(&p->migrate_list);
 
 	init_task_work(&p->numa_work, task_numa_work);
+	init_task_work(&p->numa_mig_work, task_migration_work);
 
 	/* New address space, reset the preferred nid */
 	if (!(clone_flags & CLONE_VM)) {
@@ -3596,6 +3644,20 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	}
 }
 
+static void task_check_pending_migrations(struct task_struct *curr)
+{
+	struct callback_head *work = &curr->numa_mig_work;
+
+	if (work->next != work)
+		return;
+
+	if (time_after(jiffies, curr->numa_mig_interval) ||
+	    (curr->migrate_count > NUMAB_BATCH_MIGRATION_THRESHOLD)) {
+		curr->numa_mig_interval = jiffies + HZ;
+		task_work_add(curr, work, TWA_RESUME);
+	}
+}
+
 /*
  * Drive the periodic memory faults..
  */
@@ -3610,6 +3672,8 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
 	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
 		return;
 
+	task_check_pending_migrations(curr);
+
 	/*
 	 * Using runtime rather than walltime has the dual advantage that
 	 * we (mostly) drive the selection from busy threads and that the
diff --git a/mm/memory.c b/mm/memory.c
index 49199410805c..11d07004cb04 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3375,8 +3375,13 @@ static inline void wp_page_reuse(struct vm_fault *vmf, struct folio *folio)
 		 * Clear the folio's cpupid information as the existing
 		 * information potentially belongs to a now completely
 		 * unrelated process.
+		 *
+		 * If the page is found to be isolated pending migration,
+		 * then don't reset as last_cpupid will be holding the
+		 * target_nid information.
 		 */
-		folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
+		if (folio_test_lru(folio))
+			folio_xchg_last_cpupid(folio, (1 << LAST_CPUPID_SHIFT) - 1);
 	}
 
 	flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
@@ -5766,12 +5771,13 @@ static void numa_rebuild_large_mapping(struct vm_fault *vmf, struct vm_area_stru
 
 static vm_fault_t do_numa_page(struct vm_fault *vmf)
 {
+	struct task_struct *task = current;
 	struct vm_area_struct *vma = vmf->vma;
 	struct folio *folio = NULL;
 	int nid = NUMA_NO_NODE;
 	bool writable = false, ignore_writable = false;
 	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
-	int last_cpupid;
+	int last_cpupid = (-1 & LAST_CPUPID_MASK);
 	int target_nid;
 	pte_t pte, old_pte;
 	int flags = 0, nr_pages;
@@ -5807,6 +5813,13 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 	nid = folio_nid(folio);
 	nr_pages = folio_nr_pages(folio);
 
+	/*
+	 * If it is a non-LRU folio, it has been already
+	 * isolated and is in migration list.
+	 */
+	if (!folio_test_lru(folio))
+		goto out_map;
+
 	target_nid = numa_migrate_check(folio, vmf, vmf->address, &flags,
 					writable, &last_cpupid);
 	if (target_nid == NUMA_NO_NODE)
@@ -5815,28 +5828,17 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
 		flags |= TNF_MIGRATE_FAIL;
 		goto out_map;
 	}
-	/* The folio is isolated and isolation code holds a folio reference. */
-	pte_unmap_unlock(vmf->pte, vmf->ptl);
 	writable = false;
 	ignore_writable = true;
+	nid = target_nid;
 
-	/* Migrate to the requested node */
-	if (!migrate_misplaced_folio(folio, target_nid)) {
-		nid = target_nid;
-		flags |= TNF_MIGRATED;
-		task_numa_fault(last_cpupid, nid, nr_pages, flags);
-		return 0;
-	}
-
-	flags |= TNF_MIGRATE_FAIL;
-	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
-				       vmf->address, &vmf->ptl);
-	if (unlikely(!vmf->pte))
-		return 0;
-	if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return 0;
-	}
+	/*
+	 * Store target_nid in last_cpupid field for the isolated
+	 * folios.
+	 */
+	folio_xchg_last_cpupid(folio, target_nid);
+	list_add_tail(&folio->lru, &task->migrate_list);
+	task->migrate_count += nr_pages;
 out_map:
 	/*
 	 * Make it present again, depending on how arch implements
-- 
2.34.1

