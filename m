Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E7E201270
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197457; cv=fail; b=idygOAyqnYA+zi4cTFCn70YBgaxRKnjrndYCIsopeQm9SNuA1usjWomnmxvMoKimukSqXQSDPWbX16i8OLJcP3Z2jBGAE5Y9GOi9pzeMK4C3WGNc6etQJXcRO8Kw92T/FDJRycudTTA1PF4/4sxG5H23DlNaGB5btNUrYF29160=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197457; c=relaxed/simple;
	bh=W+O2IL7i3QUjqsHTGvLV/M4QESRELmet3e6Clo79x5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9Wlew/1sdShKhmAMbT3F2BPdTGDr9FhlPJu4k4BNCe8JPh0Geh8HHxdAKwslrGgYzbc+Ge2+jO2e1G7+jNxoB6S2no1YbP9nb/9n3GReT1vDrOknPDSQxVp2+WwLfk4EZCRgGUxGFY7zmdSuTAkjIxGfQZGfAYeu4zlmWOGLKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZKUhvn/V; arc=fail smtp.client-ip=40.107.95.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZKUhvn/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOUu1c2JH29TQYloEgDH3HzQiXRNVYYRJ2BBRe8q6idnWCnwYWRTKq8WaNSkcGi4lupKGBOgvRW+8scLDndnFEbZWhd+6mf18Rp2x5Kk8BNMda/gNY08qr9u/fViQtNH6yGPDiZhriAI7so4B1xcJ5X/vTJK7tRMlzb/ET4Bo/tuhwSY73liAe8N6DAaSWAsllb4DR0ic6rMT20hVvB3ggGA/YdvNE58P1GotOjNiMkAYc1lzd1rKkm/Leui9qrJWhZ99sIHWpP1oshqfqxqG0A8AWEm/RMb+mWYZwvPdHRCYz7ZbJ4+nOWm600qojznb5AUnNFFaxz4alP/IRQKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyHCs102wN12l/Q+mT7p6NHp6uL/MCZiVN4LT5dCC3Y=;
 b=mg18bQsVm654s8chnolrItNZpvmS+JKR6ecJBOi9/N0fd9OfW1wkLwdpcHsNOV+wBKHxxnSz011gjx67oVy6dMTICpky9ouedYmrbpdzJGkL1OiOsrkTqGfox7ArFDF3CpoUMRItIfg2rQh72BuqknbWbCZ6dwF/Fi0aEccIp1UB8a5dBp1wwMMNArW8ZYHIoI4AdxpOAHLUhuwbM9uuXFcgBMAgR6YOLhAFSyYhDp9XhmLsEkQDRi31aVQ0KPw70rWM9wqjsB+GAqx+ubw/LGwczuCvYz0rRqL56P1WAVt/5n3Jn8sog/W5oERrzDjxmgK0V/eD8Zb113QHpb3PiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyHCs102wN12l/Q+mT7p6NHp6uL/MCZiVN4LT5dCC3Y=;
 b=ZKUhvn/Vqzc+48F+jpsG80tYyAYt8HGVsTrShU4A+rn5L2Jmo5jiIhYH5ydHMfs53uAOJlftS3k6eQUxz06a/1iN4C1mZ34x0rdNfbpuAZsrDM8STLvIhceH5NodqH/WEHbd91GO9chVgJ4WEFILphFvI3552aeyFi8InaUXJ0A=
Received: from SJ0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:a03:2ef::12)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.37; Wed, 9 Apr
 2025 11:17:33 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::4c) by SJ0PR03CA0187.outlook.office365.com
 (2603:10b6:a03:2ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 11:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:17:32 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:17:26 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>
Subject: [RFC PATCH 5/5] sched/fair: Proactive idle balance using push mechanism
Date: Wed, 9 Apr 2025 11:15:39 +0000
Message-ID: <20250409111539.23791-6-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e6b74e-7085-4388-b662-08dd77581fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ufErXVD5lQfMCPX+O/EsE1+bETI2cHdgs15L40UVNk2bAD8HWz9TkvQZ/60f?=
 =?us-ascii?Q?ktFjqtJtZV6p1DI/ECwjIZP8jOKuLGkJHr0YoY3bmqvMp0lIfu5N4uD+eqvT?=
 =?us-ascii?Q?YLp2T213MIFcF+22W5OrgH4w7Wk4S2j5rnWxEFTjEjbbRICiswfLXwjiIaXN?=
 =?us-ascii?Q?iZoPaGaUFrIFmnQ3eQUBWO9ZFRGiFV7w+9GTf3FQ9CcTL0gJKtyY4i4KflTw?=
 =?us-ascii?Q?c9hWIpToTAcaQjj+PwVk6R/58v4CCr9QaV1xAZF5KfkPEBGytDBjwhqxdZ37?=
 =?us-ascii?Q?ADBXl8gaidAtSute5S2es8V7IZS0lxwx+2vZ3N1AA+PebMzVZwz+ggwuynwh?=
 =?us-ascii?Q?pHdA1lewC1o5pIVgcQ76m1T+j0/7ZIR91IeKaXJmuGKPh61iLPs4UcvxGacr?=
 =?us-ascii?Q?Q8QaPZUOCQUrqLnMbjSa6Wvq/CSbERnIxk8JIZdC2k5M3vknxYDQu4I9TfB2?=
 =?us-ascii?Q?urRs1k5PF+uuY0C9DtInG4aLYvP/YylvRPgkiMIYot9TTeC2CRq16uoJw7YM?=
 =?us-ascii?Q?dumRkvRGqsWl6KbXshVIksR6eAqdAGz+SnaCmOCn4JJzGFmV234FlrG+aoF7?=
 =?us-ascii?Q?MYQISKWq46P2WY4FEBW8iuh50KYXye2ESGxj/Ot8X/XBWOiITJmD+sSThLQO?=
 =?us-ascii?Q?xqa2F3kD6Ha+Xez98TdWLlhIATq1g1H3cjp+sKMAqXJINptimbfgGpwN0RZc?=
 =?us-ascii?Q?StqcPCgLBXX3c2LXragMFmxVzLI4MZHRsF9PbN/dw1Sfbukhhs33gn2VqoH3?=
 =?us-ascii?Q?9uLCuj0nUorBgjms7/1/Bmp1RQ88CnQaK2+sNZ+gr5eDzmE4NAmHcFmWxW20?=
 =?us-ascii?Q?n3vRhMa3urrrISsb1gjTblM+4I+z884BGZ6mcnu/lIPloomvW4cIGD7skhkH?=
 =?us-ascii?Q?T37yRC+kKe49j0jFOf0/WEcdxL3v65Wt6nr7tZjcN7m+rM5uue7mDzUa4h7z?=
 =?us-ascii?Q?b6whWKwXj4hK0igxZ+pqaqi5LBDekvyMWpmx/oH4HafQsdXnIJ97Wh07+ri9?=
 =?us-ascii?Q?RHZSReqfCCqqIgqADQ3Yk0BUPlm9E3vpvu03uWDRVz6MdQw+P7krLO9aJM7X?=
 =?us-ascii?Q?lRtY4g3Dq3QrorLgFho/nJzub+4IH6+MSTrPx8qL3swTgC6rh/rxe879hCpd?=
 =?us-ascii?Q?VxHaRnpZRgP32+68HGBjdfcL9uWL+R7Fuh+W36vRvNapdLbc5cSCe6dl6xro?=
 =?us-ascii?Q?Rz1gC2Cbo5Po59zhKDPLLWr3NCJnEuS+pmLDlsfX4UXSyjye9F0MIQxvhH59?=
 =?us-ascii?Q?OoaCVTVbEisly7qND8r9nJvCSpKcIpDPRwEZwpNvCSEwpdMHHpDmkeFdmtjf?=
 =?us-ascii?Q?2XI5hDMqFD21GD4J9tmrJDkbCS/MIhXuHaQ1uHi3Mfh5eo1WVNZRZNqycAHH?=
 =?us-ascii?Q?HkKu9zu6p3EuWbSP6u1dBGhsFG1oMphm8DrzH/yLOARH+LJfXCxK4cWnkTZi?=
 =?us-ascii?Q?OxZ88jrhsAlxYq9dIo2QPWvILpoo0u2gwLQ+7tqeZIDkibsFDVx2SuJf/gd+?=
 =?us-ascii?Q?bj7wp3oluYD/EXRv7kHUXYxKp6PxpErdUUp+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:17:32.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e6b74e-7085-4388-b662-08dd77581fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299

Proactively try to push tasks to one of the CPUs set in the
"nohz.idle_cpus_mask" from the push callback.

pick_next_pushable_fair_task() is taken from Vincent's series [1] as is
but the locking rules in push_fair_task() has been relaxed to release
the local rq lock after dequeuing the task and reacquiring it after
pushing it to the idle target.

double_lock_balance() used in RT seems necessary to maintain strict
priority ordering however that may not be necessary for fair tasks.

Link: https://lore.kernel.org/all/20250302210539.1563190-6-vincent.guittot@linaro.org/ [1]
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 59 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 93f180b67899..b2b316e75ad0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8596,12 +8596,71 @@ static inline int has_pushable_tasks(struct rq *rq)
 	return !plist_head_empty(&rq->cfs.pushable_tasks);
 }
 
+static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
+{
+	struct task_struct *p;
+
+	if (!has_pushable_tasks(rq))
+		return NULL;
+
+	p = plist_first_entry(&rq->cfs.pushable_tasks,
+			      struct task_struct, pushable_tasks);
+
+	WARN_ON_ONCE(rq->cpu != task_cpu(p));
+	WARN_ON_ONCE(task_current(rq, p));
+	WARN_ON_ONCE(p->nr_cpus_allowed <= 1);
+	WARN_ON_ONCE(!task_on_rq_queued(p));
+
+	/*
+	 * Remove task from the pushable list as we try only once after that
+	 * the task has been put back in enqueued list.
+	 */
+	plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
+
+	return p;
+}
+
+static void fair_add_pushable_task(struct rq *rq, struct task_struct *p);
+static void attach_one_task(struct rq *rq, struct task_struct *p);
+
 /*
  * See if the non running fair tasks on this rq can be sent on other CPUs
  * that fits better with their profile.
  */
 static bool push_fair_task(struct rq *rq)
 {
+	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
+	struct task_struct *p = pick_next_pushable_fair_task(rq);
+	int cpu, this_cpu = cpu_of(rq);
+
+	if (!p)
+		return false;
+
+	if (!cpumask_and(cpus, nohz.idle_cpus_mask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)))
+		goto requeue;
+
+	if (!cpumask_and(cpus, cpus, p->cpus_ptr))
+		goto requeue;
+
+	for_each_cpu_wrap(cpu, cpus, this_cpu + 1) {
+		struct rq *target_rq;
+
+		if (!idle_cpu(cpu))
+			continue;
+
+		target_rq = cpu_rq(cpu);
+		deactivate_task(rq, p, 0);
+		set_task_cpu(p, cpu);
+		raw_spin_rq_unlock(rq);
+
+		attach_one_task(target_rq, p);
+		raw_spin_rq_lock(rq);
+
+		return true;
+	}
+
+requeue:
+	fair_add_pushable_task(rq, p);
 	return false;
 }
 
-- 
2.34.1

