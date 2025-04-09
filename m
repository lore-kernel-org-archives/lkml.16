Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED3255255
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197443; cv=fail; b=ClaWy0znjiChnW9yrC76dZWMvLH36tB2bWHg+bfb7pwyC7zDEJySk/l6/4ma9ru2Lh3bBn7ZmmHvYNVKlFGW+5sbYixz3J3tWR1mdHwfGar9DWRWwKU0GcdzK7+AH2eVBQ/9USW1VgIRYcIT/s7iWXPxFifTC0sWzLf0+M6HwaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197443; c=relaxed/simple;
	bh=qIwYxhRon9WtBcT/lz9dO1Cc4SOnOXWVnbn6XpiuXxU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9/J10jGCQkCNLi35caVyrGoZlEWrOKDVEj6mgC3jrdmflTIg5up8Mu8kzhtZJISIToiM39BqkDD/mjAgVha/MDNgmObrn6CpNk4kStv05Hj758rtYaIUaWC/J6y35ZVZaXb143bWvixf+cOtHHnX+tXju28jzElEA5gn6cHMFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yyR9xG+l; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yyR9xG+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4oxhYLgPp0L9jHK5f8jdnqesRD5DlgEcmqg345Bh9emGoP5vIGYbLglqDX5wCVmUId5vh0e9qOU1BPv9FtxWbwvZ6ZjcEu37Wn95XJlNY05v2CqXgwiE4DhsDLVYqdPpDYJC7x01vXxvqYXsIgOOMeDWt7z4GVOlXl8nWTXAQryRrNEFIn9D/KDF08D2yFvBS9KYqD6/VXLH8XJmBWrj8Ejf50ZchAmsTs7WtNX2R3gCuWfG8XPcuyt/tz5qAb+e3/k1MShQKNtDW1sHKFagBq73aV7h/FIX4soxA10FlHT0BPJJwgTwbOisuRK0yKherFVC8QuVzQap6zW+7iizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy/LaKZc1iEDiA9PIm7E4I9O97NIIJzAUR3c861G43o=;
 b=wbZV0wMYYyJzyOts5n1TLzkkiIGBEMn0R/FV2MgqdRfJpFYKEvtaK4Gh2ARrc2CC+l8h4lVqbTNh4BI9+rCnC5Ux48ydcikSq+ZI/mY8umIHXmszRuS00d9HUm0dd6otPy1TsEedqTh83z5M0wG8VZOl/GDEpSxQXu4G2Ptj06+6F+QFNcIqNqK9Qjk2CZqbG3mzfghJqt8o/aC9FY1AYYpE8rWMy7tBFyQ5YHEg9vvXGn0T0npUNtadO0q29Y2yb7OJFzYkD5339YeuHjNqB2cU1psDQxLtgQnzDXjuT9Bi8QfhrjyxCy8QeRkhJihd8foi1YaPIsPRKUzYFNIB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy/LaKZc1iEDiA9PIm7E4I9O97NIIJzAUR3c861G43o=;
 b=yyR9xG+l9+EISzfXdnL5b6vE58JNVZ5HLJlhdaEZQFpeJozJzq+7m0jNR7EvFk2JoHiIn+MfzpcV2yYvSy+KHxaH8mHAF+AYRFOuuXrQc5eQsikkZtdYfF8rPjeLhDhiQeZzIuUA7uCsEnY4LhdodB46ZNavemMO6IVwF6VLNbA=
Received: from BYAPR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:74::20)
 by PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 11:17:19 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::16) by BYAPR05CA0043.outlook.office365.com
 (2603:10b6:a03:74::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Wed,
 9 Apr 2025 11:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:17:19 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:17:08 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 4/5] sched/fair: Rework inter-NUMA newidle balancing
Date: Wed, 9 Apr 2025 11:15:38 +0000
Message-ID: <20250409111539.23791-5-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409111539.23791-1-kprateek.nayak@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: af03fa58-efc4-4b96-728f-08dd77581788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZM098wXqRsjM863ZqBB7Dxn+Ehxq2bZ66SFmuLYlPJbRc+oJt8QF/ZhI7/qK?=
 =?us-ascii?Q?uG4EigBv0iEoaDy+ZWTdOieKPJ1ovwmKkjxxytJRyBYGF3vjdZhqyhuflMQt?=
 =?us-ascii?Q?iiep5yxWE/BZuXjMvJiCocbesJNg0ojv+A5DJJ+SP152cUB4miL9BFNJJG/N?=
 =?us-ascii?Q?jdx5OmLNqX887oOkoTW5TQXjmZAC6SJ1ljEo1Oog7tUEiJpZs0UxwlOZKHlx?=
 =?us-ascii?Q?WDG6+AGso8s1e98o1+Jsn++49CkpPziTyF4y65ol71TwwC2oAcdsfE+JUYX7?=
 =?us-ascii?Q?+YfG1rYWCLhA6x7ui+aBRPakSkVgN0q+sygCqi5YoehPDMQQdQNFk+wPRKkQ?=
 =?us-ascii?Q?fcSjUJI8sfYu986T/BLADX2Gzd//Yp1Hr/9EgPVwzfSVWXc3IbKP26OIti4c?=
 =?us-ascii?Q?1nCSPyEhpOOBZgUyujOCTGteObzD3j4gaIvR1DC8k0ILOqUpW1uT74cIqnyj?=
 =?us-ascii?Q?M8Dlw2Lq9RC7010DMwD9tQrq56kCvU5dpJaOqLhenlX4b6/+PWeYZcEllxmW?=
 =?us-ascii?Q?ggr0SsDdQ7JyX/AAMQ649AzRUZHdf9rrP8xH+x+jGoo3jmKg5tu8//EQuhNE?=
 =?us-ascii?Q?ZDxErufEsZlMzsTe84xpcXQeHKLczysNnbKHs62TC7Alui56hB4s2rQZkN3Q?=
 =?us-ascii?Q?+Yydt+w1CGsrrr4UCSZoeE6TPPulxRhycRM5Jln9BZNNMpS2Ok14xAX5qKih?=
 =?us-ascii?Q?aaTdKakAwyx5Ga5IlxWyojy9eUyOqqLT4dFFoSEaLYKSmsip+YCLXpTm0MNx?=
 =?us-ascii?Q?tpmtorYwfdrdAvI8o20218p6/whfnGiF8vizovhA95Bn/OXJqcebx478sovG?=
 =?us-ascii?Q?QiLjQu+3ze5rpxJ3rVnStEiHw6EMXYQ0eVMrss1XMBTS+JtDT4DGedCsaZ97?=
 =?us-ascii?Q?D7gnYV/glbptXVyfvcqJRa4d8SAFImXgyOUZeDxGiUBQpMhwJEyA4HlXJva0?=
 =?us-ascii?Q?UQRxH1HObHjgbjpwKniKPM9ZR6pzYIio4EzG80I8XJRym7nx5GUkApFR970N?=
 =?us-ascii?Q?PFFCCI98dEASIgDek5aVtOFpdLxaWzcULLEMovfLywPAfrOswl3qz7GuhZP0?=
 =?us-ascii?Q?d4r2TizQIUD/J4GOxpyCuulTlBOquSqeygv99RUS8fmakFlhrPy4GEF0U1bA?=
 =?us-ascii?Q?tSNJHs1PHCGf0SgcCI8NK8fXd0U9v+fgfsXvo2dJgYluVRJQF76yICcz7EVI?=
 =?us-ascii?Q?BU3kwd/qsAid6YoeobBR89FawPxlxKyXMUtBQqXpiJ2lHtLtTlN1Z3p5dqbM?=
 =?us-ascii?Q?F9xqaXoRFRTxI7M40aMaUaqzm8qJEiw8RIRCFb5GDxTwk1iASPmwM9eXBgdy?=
 =?us-ascii?Q?evs8AhkIaDwdXp0BVaGvQJCOw62H9/nrlPslAFVZVHTA5jnhah+HlkbQ/eK8?=
 =?us-ascii?Q?5jPfayYfK7+hQDi1JRCfkoL4vhSGOACaDTDYeXAyXMX9ijlKdY8QF0JtvQGD?=
 =?us-ascii?Q?X9u9sipWXUS/kobVoGhPhzsXWk2Lw75hDehYREaxabDYzzw8sjK5/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:17:19.0717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af03fa58-efc4-4b96-728f-08dd77581788
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724

With the introduction of "overloaded_mask" in sched_domain_shared
struct, it is now possible to scan through the CPUs that contain
pushable tasks that could be run on the CPU going newly idle.

Redesign the inter-NUMA newidle balancing to opportunistically pull a
task to the CPU going idle from the overloaded CPUs only.

The search starts from sd_llc and moves up until sd_numa. Since
"overloaded_mask" is per-LLC, each LLC domain is visited individually
using per-CPU sd_llc struct shared by all CPUs in an LLC.

Once visited for one, all CPUs in the LLC are marked visited and the
search resumes for the LLCs of CPUs that remain to be visited.

detach_one_task() was used in instead of pick_next_pushable_fair_task()
since detach_one_task() also considers the CPU affinity of the task
being pulled as opposed to pick_next_pushable_fair_task() which returns
the first pushable task.

Since each iteration of overloaded_mask rechecks the idle state of the
CPU doing newidle balance, the initial gating factor based on
"rq->avg_idle" has been removed.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 129 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 117 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 834fcdd15cac..93f180b67899 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12864,6 +12864,100 @@ static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle
 static inline void nohz_newidle_balance(struct rq *this_rq) { }
 #endif /* CONFIG_NO_HZ_COMMON */
 
+static inline bool sched_newidle_continue_balance(struct rq *rq)
+{
+	return !rq->nr_running && !rq->ttwu_pending;
+}
+
+static inline int sched_newidle_pull_overloaded(struct sched_domain *sd,
+						struct rq *this_rq,
+						int *continue_balancing)
+{
+	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
+	int cpu, this_cpu = cpu_of(this_rq);
+	struct sched_domain *sd_parent;
+	struct lb_env env = {
+		.dst_cpu	= this_cpu,
+		.dst_rq		= this_rq,
+		.idle		= CPU_NEWLY_IDLE,
+	};
+
+
+	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+
+next_domain:
+	env.sd = sd;
+	/* Allow migrating cache_hot tasks too. */
+	sd->nr_balance_failed = sd->cache_nice_tries + 1;
+
+	for_each_cpu_wrap(cpu, cpus, this_cpu) {
+		struct sched_domain_shared *sd_share;
+		struct cpumask *overloaded_mask;
+		struct sched_domain *cpu_llc;
+		int overloaded_cpu;
+
+		cpu_llc = rcu_dereference(per_cpu(sd_llc, cpu));
+		if (!cpu_llc)
+			break;
+
+		sd_share = cpu_llc->shared;
+		if (!sd_share)
+			break;
+
+		overloaded_mask = sd_share->overloaded_mask;
+		if (!overloaded_mask)
+			break;
+
+		for_each_cpu_wrap(overloaded_cpu, overloaded_mask, this_cpu + 1) {
+			struct rq *overloaded_rq = cpu_rq(overloaded_cpu);
+			struct task_struct *p = NULL;
+
+			if (sched_newidle_continue_balance(this_rq)) {
+				*continue_balancing = 0;
+				return 0;
+			}
+
+			/* Quick peek to find if pushable tasks exist. */
+			if (!has_pushable_tasks(overloaded_rq))
+				continue;
+
+			scoped_guard (rq_lock, overloaded_rq) {
+				update_rq_clock(overloaded_rq);
+
+				if (!has_pushable_tasks(overloaded_rq))
+					break;
+
+				env.src_cpu = overloaded_cpu;
+				env.src_rq = overloaded_rq;
+
+				p = detach_one_task(&env);
+			}
+
+			if (!p)
+				continue;
+
+			attach_one_task(this_rq, p);
+			return 1;
+		}
+
+		cpumask_andnot(cpus, cpus, sched_domain_span(cpu_llc));
+	}
+
+	if (sched_newidle_continue_balance(this_rq)) {
+		*continue_balancing = 0;
+		return 0;
+	}
+
+	sd_parent = sd->parent;
+	if (sd_parent && !(sd_parent->flags & SD_NUMA)) {
+		cpumask_andnot(cpus, sched_domain_span(sd_parent), sched_domain_span(sd));
+		sd = sd_parent;
+		goto next_domain;
+	}
+
+	return 0;
+}
+
 /*
  * sched_balance_newidle is called by schedule() if this_cpu is about to become
  * idle. Attempts to pull tasks from other CPUs.
@@ -12881,6 +12975,7 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	u64 t0, t1, curr_cost = 0;
 	struct sched_domain *sd;
 	int pulled_task = 0;
+	u64 domain_cost;
 
 	update_misfit_status(NULL, this_rq);
 
@@ -12913,28 +13008,34 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	rq_unpin_lock(this_rq, rf);
 
 	rcu_read_lock();
-	sd = rcu_dereference_check_sched_domain(this_rq->sd);
-
-	if (!get_rd_overloaded(this_rq->rd) ||
-	    (sd && this_rq->avg_idle < sd->max_newidle_lb_cost)) {
-
-		if (sd)
-			update_next_balance(sd, &next_balance);
+	if (!get_rd_overloaded(this_rq->rd)) {
 		rcu_read_unlock();
-
 		goto out;
 	}
 	rcu_read_unlock();
 
 	raw_spin_rq_unlock(this_rq);
 
+	rcu_read_lock();
 	t0 = sched_clock_cpu(this_cpu);
-	sched_balance_update_blocked_averages(this_cpu);
 
-	rcu_read_lock();
-	for_each_domain(this_cpu, sd) {
-		u64 domain_cost;
+	sd = rcu_dereference(per_cpu(sd_llc, this_cpu));
+	if (sd) {
+		pulled_task = sched_newidle_pull_overloaded(sd, this_rq, &continue_balancing);
+
+		t1 = sched_clock_cpu(this_cpu);
+		domain_cost = t1 - t0;
+		curr_cost += domain_cost;
+		t0 = t1;
 
+		if (pulled_task || !continue_balancing)
+			goto skip_numa;
+	}
+
+	sched_balance_update_blocked_averages(this_cpu);
+
+	sd = rcu_dereference(per_cpu(sd_numa, this_cpu));
+	while (sd) {
 		update_next_balance(sd, &next_balance);
 
 		if (this_rq->avg_idle < curr_cost + sd->max_newidle_lb_cost)
@@ -12960,7 +13061,11 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 		 */
 		if (pulled_task || !continue_balancing)
 			break;
+
+		sd = sd->parent;
 	}
+
+skip_numa:
 	rcu_read_unlock();
 
 	raw_spin_rq_lock(this_rq);
-- 
2.34.1

