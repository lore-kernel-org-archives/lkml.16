Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525622561CE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197383; cv=fail; b=h+kuveMUWOZL6Go+7iBuMbQWzffiz4WI/bmWPesBSsqdWC1B6Cajz2QUp81hVNm9ZDV12lM55hFqdnJ/GXAjpIbP3Yx/ehxqyhysw+KT9Z9CVjXqZ1gHilviGulK92x+ekG/JPkGjji8DIfwGAM8crp4EZ9rQeVW4Maku2SgbLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197383; c=relaxed/simple;
	bh=K4QmAXWan/Gfh4IaOG/Go2kfyw+qoo0me0o6FHn61WY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhV7zaqSu7GC1qxNkfPG0PqtP+kX9GIK1pT87GK7vXupNCzN0xdDEGjiBG8YzlV6l6fJSKMQ7ufzIvn2Lbxj0zK+vR1MikwZHEA3UWEJisI6lAhz+A/mNiEK+I6O9CCOI4pmXyejyerLcKG4zkbacQa/QeYFZ8AcagHVqUHOmQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=neZ87bgR; arc=fail smtp.client-ip=40.107.94.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="neZ87bgR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/8vv0ocioFKVbDF6yZ8LiXJ8zPgXvSh6lJpW0LqFY+/bWl+VyG/RoOnTa+HMlCgXzrCWCoSrQsIQXSvL+pw9j2Pm4MNDaYSxPhEf9YKuVzVY5/PbGY+8LCxUY9+tmYQkNLJwFK7c9r1ZdqeLvyHTSpEuQi7+HxwJyzNrmJRmtIA4/CIF+MOP8pEGx62rdxiutVUm4j/dfttzxh1rlHQnucQiHOCFAzrf/AogQla/UeEsgZRp89aOt4nhXBGV76zX82Duoob84eqEd+S42FjSJTx5gBGWt8jNU468DdywIgPSs4k/kLjkVlPXgARHk+rm1Xlh692y1gE7IET1l8i7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPVaxz21b+77MaWG9eBfmcoXKISJNR++9KE9ZeXUHHw=;
 b=AmzRrpg10NJPmsDo09K9tRx2Dw3eB3CjMNKcnqBZrJI1dgOTIFxj2EkyS9KOAofkFJcocyCNBX1nWe0LYHVxGyhGhXPOKQU/iYQRxWDlISxxTheCXVeUM2KxOabOA17vmXcMxOnU1wTBPmmvqPVRRLKy7U5hEQsuht3vdAvVf89jPDaL8L6sJLVi/YtEue1+6An866b+sx1B3e6b6lrTAjgcrNn/XKJIO4TqDwZ6hJmvjL2NBbbnxAb9y+nKODikGBD+jPG3x48bv3g92eoB2HuYxifMTV2oESHt5U0QszSHAZk8wqtpRGjOX+plrHzCbjQwPALG4+C2Svsz1Xrv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPVaxz21b+77MaWG9eBfmcoXKISJNR++9KE9ZeXUHHw=;
 b=neZ87bgReiSZckgPbuD4r5sa+xxI3a8TjX5Et6UNEpiRLzXjLudljyxawKIQSYlif+K3llv2Nb9s2nKieOrgCxjtDukV5POoTSS1dhKpQ34pkOFLtfhBgn/67CHh5THDZWOohOcLv/czqqjyPFd6JAn4Efe+IexvlCXP0QuJoJQ=
Received: from CY5PR16CA0017.namprd16.prod.outlook.com (2603:10b6:930:10::6)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 11:16:18 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:10:cafe::ca) by CY5PR16CA0017.outlook.office365.com
 (2603:10b6:930:10::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 11:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:16:17 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:16:12 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 1/5] sched/fair: Add push task framework
Date: Wed, 9 Apr 2025 11:15:35 +0000
Message-ID: <20250409111539.23791-2-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c57013-712e-46a7-f199-08dd7757f300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FiJo86WTMzdqjtw8VtlRltDI1mxluBlTos1eCb1O7UXU1jZK5OofhT9Z5Sdj?=
 =?us-ascii?Q?jQaIPAC0A9/lTPkrAPscOk44++HPcijChJujDIaKAS+Cv3TltR1w8zSEy7DF?=
 =?us-ascii?Q?VbFOPX70/hkzC6CrjwDyudLRUXaH++h4rICl1SI9nY8JrpzbvSdzp25TXLC0?=
 =?us-ascii?Q?9cLvxBWEStrh2DE4MEmmIs5tcmKX3rvaH3Y8Hz5aPeGL6RVPEQbdUC+i4CRt?=
 =?us-ascii?Q?jcG/THORVYGbso+NeOcUkmrCXi5WLygWvJWtn4SgJSVzky+3Wu1B1rxr0Vnz?=
 =?us-ascii?Q?1F/IpUPyGeHRZZdrIMDZSSTn0T9SRlvv/CymkgoX0rHNXSsPRkIPdJ0adPr6?=
 =?us-ascii?Q?u8KPlDLDi+kJR6QRGaPGapWeWU4qiro1DOSOC6jHWxGGHL9qzoYyX0jIGHrW?=
 =?us-ascii?Q?sfvfKkyKbyggG2H/cTTllLz49EI9ynoZ9Mew6baSznMXfHw9zU9IHjVLXQxt?=
 =?us-ascii?Q?uXOcKGysu3WhMBo3ktGgKJy0Z0qvPvioJjkSer8he27u3MjlUgKSJBFgGx2q?=
 =?us-ascii?Q?wD7TDxw7mAVaJK7oq057eD68+swMSGwFfANOYmLCwFrwKTRq3a9Z/aHfh5oa?=
 =?us-ascii?Q?rYyBtmKufV4IVYlnngQPbuXe7nDUx794Ps1F6rORnoxevMdiz+T8hILBiHcX?=
 =?us-ascii?Q?A71f7IH6otKzcdgbvft8zMVN/9yHBkuPhNmUenGPJM9ZStPUqHQXiP3RIRqY?=
 =?us-ascii?Q?Q8wRGm4JfBwdXkc8qCWMbbfwBZh85bu87bGftaa7gyNS0aNyS6MjUJP8+xDJ?=
 =?us-ascii?Q?yHMIWNKE1/E1QwuhsJ0DzhrSCIwW9/X6JpW2+tUKF7v8RKmd8pufPXStA2VJ?=
 =?us-ascii?Q?OoQomA5usXb8BXmePH7TrPss89TzA1Jjb8Ub4enYoIDeJtsVbcdD4nHYQ+iW?=
 =?us-ascii?Q?kC3WqDJfJmbGe4AcaBbLRE5L5lBY4VUtgMRKY/C8fsidAdSOzxN5E+aDkOUp?=
 =?us-ascii?Q?G8JlcNEZG3N1lu6S/609ESk/yRm2qA7pMsdxR9Zy2Lg8LQbwVYK4lW4jpPx6?=
 =?us-ascii?Q?1luFWjmor1Dog7uSn10uIZxPF7OxmV8aNQolWY3P31K9AbYZZN1N7OKXpedR?=
 =?us-ascii?Q?i0z+BWvC3HQulB2mcp2Q/9gSjfFytAxZ75bDz4Od+wRZtMF5BIwlaYTGZwZS?=
 =?us-ascii?Q?ZXhcKHJ833+Ju66f5IDW9wrzfhBQhJa+Jk62ebaiQTGIsL/jHvEZBRihdOza?=
 =?us-ascii?Q?O9dlFiwNye6Mr0HfcwcTYNlA4fJzDF0igVv/Bka5w/Up3Uc+/3nErvPHY51N?=
 =?us-ascii?Q?22wIgVqmv8g25jV07aaK9nVQaAMyqF+tlmmpYCRrbLAyRXbnQ+WX3KmvEUSH?=
 =?us-ascii?Q?iiQXDdqBIMAJWvdg6jv6BczIqd1Eku7I0y6gRBoui3NY21CNUu1e7eRLew0i?=
 =?us-ascii?Q?wGtnjyq9XxyFeKHmfFuRrRh+WtjyAuYQeyRdUKDdzpodNS5iX81PHk19ecJZ?=
 =?us-ascii?Q?9R2tErBiDz33NOce6fFu23JF6r79/VbJVGeWYwKQtv+Ev0OmgNu8ulxynzSt?=
 =?us-ascii?Q?GVC/D9p2GRhKCHjHzHHbd6M9xeSfjyrpuJTPzixhv/oo72drl+v1AFm08w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:16:17.7701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c57013-712e-46a7-f199-08dd7757f300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115

From: Vincent Guittot <vincent.guittot@linaro.org>

Add the skeleton for push task infrastructure. The empty
push_fair_task() prototype will be used to implement proactive idle
balancing in subsequent commits.

  [ prateek: Broke off relevant bits from [1] ]

Link: https://lore.kernel.org/all/20250302210539.1563190-6-vincent.guittot@linaro.org/ [1]
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c  | 85 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  2 ++
 2 files changed, 87 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c19459c8042..98d3ed2078cd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7044,6 +7044,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	hrtick_update(rq);
 }
 
+static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p);
 static void set_next_buddy(struct sched_entity *se);
 
 /*
@@ -7074,6 +7075,8 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
 		h_nr_idle = task_has_idle_policy(p);
 		if (task_sleep || task_delayed || !se->sched_delayed)
 			h_nr_runnable = 1;
+
+		fair_remove_pushable_task(rq, p);
 	} else {
 		cfs_rq = group_cfs_rq(se);
 		slice = cfs_rq_min_slice(cfs_rq);
@@ -8556,6 +8559,64 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	return target;
 }
 
+static inline bool fair_push_task(struct task_struct *p)
+{
+	if (!task_on_rq_queued(p))
+		return false;
+
+	if (p->se.sched_delayed)
+		return false;
+
+	if (p->nr_cpus_allowed == 1)
+		return false;
+
+	return true;
+}
+
+static inline int has_pushable_tasks(struct rq *rq)
+{
+	return !plist_head_empty(&rq->cfs.pushable_tasks);
+}
+
+/*
+ * See if the non running fair tasks on this rq can be sent on other CPUs
+ * that fits better with their profile.
+ */
+static bool push_fair_task(struct rq *rq)
+{
+	return false;
+}
+
+static void push_fair_tasks(struct rq *rq)
+{
+	/* push_fair_task() will return true if it moved a fair task */
+	while (push_fair_task(rq))
+		;
+}
+
+static DEFINE_PER_CPU(struct balance_callback, fair_push_head);
+
+static inline void fair_queue_pushable_tasks(struct rq *rq)
+{
+	if (!has_pushable_tasks(rq))
+		return;
+
+	queue_balance_callback(rq, &per_cpu(fair_push_head, rq->cpu), push_fair_tasks);
+}
+static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p)
+{
+	plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
+}
+
+static void fair_add_pushable_task(struct rq *rq, struct task_struct *p)
+{
+	if (fair_push_task(p)) {
+		plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
+		plist_node_init(&p->pushable_tasks, p->prio);
+		plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
+	}
+}
+
 /*
  * select_task_rq_fair: Select target runqueue for the waking task in domains
  * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
@@ -8725,6 +8786,9 @@ balance_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	return sched_balance_newidle(rq, rf) != 0;
 }
 #else
+static inline void fair_queue_pushable_tasks(struct rq *rq) {}
+static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p) {}
+static inline void fair_add_pushable_task(struct rq *rq, struct task_struct *p) {}
 static inline void set_task_max_allowed_capacity(struct task_struct *p) {}
 #endif /* CONFIG_SMP */
 
@@ -8914,6 +8978,12 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 		put_prev_entity(cfs_rq, pse);
 		set_next_entity(cfs_rq, se);
 
+		/*
+		 * The previous task might be eligible for being pushed on
+		 * another cpu if it is still active.
+		 */
+		fair_add_pushable_task(rq, prev);
+
 		__set_next_task_fair(rq, p, true);
 	}
 
@@ -8986,6 +9056,13 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
 		cfs_rq = cfs_rq_of(se);
 		put_prev_entity(cfs_rq, se);
 	}
+
+	/*
+	 * The previous task might be eligible for being pushed on another cpu
+	 * if it is still active.
+	 */
+	fair_add_pushable_task(rq, prev);
+
 }
 
 /*
@@ -13260,6 +13337,8 @@ static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool firs
 {
 	struct sched_entity *se = &p->se;
 
+	fair_remove_pushable_task(rq, p);
+
 #ifdef CONFIG_SMP
 	if (task_on_rq_queued(p)) {
 		/*
@@ -13277,6 +13356,11 @@ static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool firs
 	if (hrtick_enabled_fair(rq))
 		hrtick_start_fair(rq, p);
 
+	/*
+	 * Try to push prev task before checking misfit for next task as
+	 * the migration of prev can make next fitting the CPU
+	 */
+	fair_queue_pushable_tasks(rq);
 	update_misfit_status(p, rq);
 	sched_fair_update_stop_tick(rq, p);
 }
@@ -13307,6 +13391,7 @@ void init_cfs_rq(struct cfs_rq *cfs_rq)
 	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
 	cfs_rq->min_vruntime = (u64)(-(1LL << 20));
 #ifdef CONFIG_SMP
+	plist_head_init(&cfs_rq->pushable_tasks);
 	raw_spin_lock_init(&cfs_rq->removed.lock);
 #endif
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6d..aa92c0d75de7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -716,6 +716,8 @@ struct cfs_rq {
 	struct list_head	leaf_cfs_rq_list;
 	struct task_group	*tg;	/* group that "owns" this runqueue */
 
+	struct plist_head	pushable_tasks;
+
 	/* Locally cached copy of our task_group's idle value */
 	int			idle;
 
-- 
2.34.1

