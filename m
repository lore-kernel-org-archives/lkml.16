Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E268148850
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620001; cv=fail; b=ko2iWXA9/IQkMTdMz2m/AYRFIyqRF+xPpyeUzeRy52ZwPW9ygBxn8cV0v5S4JEp24dmZNjPqtU2GpJznXtotbIERhJP1hbWhVTOMKwGoUX0w/JUEiLivBe3mH48ycYvY/3pDW7ySa7sZ7Ew4qw9tZ6R535FQU2xz3CVPMQ156hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620001; c=relaxed/simple;
	bh=smcD1iE8j7wNKS9lhPwBwbxIYJks7M3Lkh3/11Fkrt0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EeyzeVfaFOqwxwL/dFfOrEFQhGUnodE4r6gqkpnT6MxG92eEmZ75tr4lFNT1H28LRp+VFEu2fugRjWjM6yJTq5yoKlaKxtfyzuGSnLxKcXuaVrmwCQ4P13uYCGyrjypJTIoBXUUqJH07rGXBdwaw4d4cbM8biLbdKmOf2YZnYSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UtgVa5gq; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UtgVa5gq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXw/MfnZkhivabo+hjVKfKTlGwW1i2zC8+jfnYLZbHDOrP7Dv8NaiV4e2OTLExLkBwoIAQdfIVKyQcmUGS+daMlNjGdH7ePd8iDaQoPCbwsiPB2Trj5M16uLJpT4ryvgNi2A7RnlOKGTuiukEOtRiyeuJionqrLgzPQBKPqzK67KNSWgYiPsQc2DRRyx9hw+j+Sa+Wdf5FXqbU4Kfc62GyoNtfNQ8sLhMN5phiXSJqRS53OLiAE8aQKoWIMHwnAgLybWfK1IahI4V5vqN6oVKSO+9YaZl4Vk9fIn+XcAl/MuvPci3/5EBguA4dakW3Gyqg4KlRG/dt4UzBfolDGcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NY3R7f6Sgqv9SEJACNYWKP37kUcit3WMvXFjYALaGc=;
 b=StHxVsj6cIGaFvWGlMvi0KEr+btmbSxoHnYyXPsi0ad+fGZBx4xYBMraq0JQ8Zn0Wktqt0mbrN0NmVErjNKf3skyr7qKF7JIX1KQEzawTqVjfoPZqp+nivlq49OfUMWlkZ9CbMxlxrXMV3unTH0w/0je+NmmNo/lJnCMuppFq5TD898nzSsEaJ+f9D0pdByIm26u/6kKYAky+ZpaBhuCU2bh3zTKz+wH3uHyHgZpmmfMfTVjTGVFHkq/ChAbhVmwi+u0HO1zaYLUSQqDC1UIVmEV9lrS2PzAtW6ENUk9+R1ERONqkHQcXrG7aIpYrTdmgZkbY/dws4W7pkwH64Lrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NY3R7f6Sgqv9SEJACNYWKP37kUcit3WMvXFjYALaGc=;
 b=UtgVa5gqf1qRceQOUGMqvwqd3fqCmeQHu6sW9p/LIX/aS23HOt4C4AX2kJUkpd5tmrzJXH3rNi8VoCbkOxAqFTuhdYWS3oAGb1Uf7AY4WJ7siHyy81crg86cCO1OlaBk8ZBxgrr0N3gGpG1DvI7IdVjtfinyrzYE5/j89c7TT097yFnFPTQkWN8Glm5JUjKFLsxFcQeGeztCSV+Aq+ymbQzML92k8SfrhkpKD/IpX5As2wLPeikiIC94DzpRHWS7ajywUXFCZzd9DijguTMmmOkaG7yc/f+884voW/4M/VHXtb+/Fv0YtD+Y017bx50LsYgk+DUtBjOgaXNX99NWSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Fri, 30 May
 2025 15:46:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 15:46:36 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: idle: Properly handle invalid prev_cpu during idle selection
Date: Fri, 30 May 2025 17:46:29 +0200
Message-ID: <20250530154629.52651-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b0c4eb-d189-4623-2639-08dd9f912931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TNj2/WKFJDq1R52RZDs+BaBH+PQGFScfbdtfwxEvRjqqqryb7UcNZoQC0h2T?=
 =?us-ascii?Q?+Yzze/mUeECcPSWKMkAKforKHCFCOQqU1bqrJxyze8AHKHJrO5MUSxOIx5sv?=
 =?us-ascii?Q?epY8n7sapYAbKnglXo01kv+KOsJyDznVAx6UKxcG9CoqULPMwAFfijr7ploK?=
 =?us-ascii?Q?eWZlOHAkQCD4nm/QrC1i+Uxguyr4FvZFVl433+9R6+G7z5vl/TZb+z4o9i2k?=
 =?us-ascii?Q?I4Lr69ylgpqaNnkxa6AdxXJnJi6qgDhWA4fHw5WskRCDPNyCzRzVL3CIyjOc?=
 =?us-ascii?Q?Yf0W3TOY98sM1aiavRblKwm0nJr4BGoir0tFSbN1q4W3kHHHmGpAkw9u2jqT?=
 =?us-ascii?Q?FlZ5+cYungZRHNihOzCJ/GJVTVWRSgDM8BkeKcBbwqfUfbeWjonHfRtwacic?=
 =?us-ascii?Q?xu5j06FZFpTrHq29cCAARNjbHqFHbuiqCBWaQwdNa7bxT3TJT7BF9MZ3rX5f?=
 =?us-ascii?Q?/0zb0jKZ41Q72IpbveNDP/XjYNJ1u4wNMlE8S1r4+qVQL7o5V6YxOahmQgQU?=
 =?us-ascii?Q?nW7sD/krDJ6zu2+3EISilyTVgfVD8EUQrEnSvvqFegRhA8L/ouLAEx/hqdYx?=
 =?us-ascii?Q?mFTLfN4hbB6RdxkKbNBeeCcZEP/qHh7M0uN41EPqnvbo0MmM5rhNvfiJMOtZ?=
 =?us-ascii?Q?W9bPwn0ii1XVXWW0YVQEXIMBmhlRtqP6FpLQcdHAoXU3JejGVsti+wCaQF/q?=
 =?us-ascii?Q?ETTpt05FFIFZ2tqhL638JvPfJlb4Nqlpfm6yuVGh/DtvBvUqN2Paf2d4rnPr?=
 =?us-ascii?Q?PcaOHMAerhcemv54TVBPfHg/wGgPsqOM49BvanF+Bj6NUN9ur0XJogvci1Ze?=
 =?us-ascii?Q?51LRKK1S4yT2MyzBYqB63ouCdNQFowacwHpzh23ZpR31uBSuKgbTTbqD0awo?=
 =?us-ascii?Q?mw4ZlpPT1LVio82gOGK2GlW8AzoJHYQ5y5EvdJvlQxgZKyRQutTnvgNmOwIf?=
 =?us-ascii?Q?0vRc8lpylT3xFqBJxRut+lj8uvGWnneUAjgPh52ecH36Sxz7SsE9vGA7z76c?=
 =?us-ascii?Q?Qah3N4T9PBTG+AYnnuyfaPgzS/toZF9rxnFdAIDPHnqj3M0xV/T8U6bNg3wl?=
 =?us-ascii?Q?yKBDpML+dgCNIfe+ab8vd3WfPmr7tSKP5eaS+7IwVSP9bquwZTg/geEk2JS6?=
 =?us-ascii?Q?NgnPRjfYZLI+vxM/a8OGop6oPkIJIDOV0kVVGyCcsdXPjt7yesvnAe08GI+L?=
 =?us-ascii?Q?oYnKxcvlCeEUP7FAZ/zLMWeWUwZrvVhrxDKCgMtkIoZw+e0VqRt2efqik11c?=
 =?us-ascii?Q?QWMJxgHPmP4p6CM93LdHadB52p0dZ2ftfjiwNXWXGUTQuDHysd6Yz+nVwfpj?=
 =?us-ascii?Q?+qyoX0wiJ9BlnMYJ+cwEsue/+RZx60tbiKF3sOwZ4zV9JHHIIP2Rd4/z5+Xs?=
 =?us-ascii?Q?lvYd7XbHADhWjjvp49kaOOUxbbfREkQDRlczLhGxYqJB42Pq5wwiL6XBWOmf?=
 =?us-ascii?Q?W6jm1080uSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPRU5EPM1z0X3WoDRgz0RCP0EVEBo2ZNADU1MAu+UKpwIqKynenek5KLAirH?=
 =?us-ascii?Q?V7uI8e95OCwTMyGUxNWhnewrkxjbnwob6i9/P/HWIAIWgMGh+ksY7ugOuqQK?=
 =?us-ascii?Q?AasSsQ9VzQAAGzBtbknDp0ZBjFKJQN9Vqp1bc2MrGfD3YAL5EQttlQSsBHO7?=
 =?us-ascii?Q?80IwTwIfAJMK+4bDEicWSHGT9b3t8tOIcmfCQl5Nv/JAzYjrtzc60pLHaQJI?=
 =?us-ascii?Q?BVLagmhly+nPenma96M2/CrFlzI5ChvfXmeZq1aXpyjmidZBx2J9f2LOfRBE?=
 =?us-ascii?Q?yECwlLT7UIZo/KGGX0PCaVBhF1sfICnSvR2k4oU3f3Z5NOGP+5EH+E/2B/zC?=
 =?us-ascii?Q?bGEIlcMUbAcPPc6kmbjvZPnHKibIc70s8CoGUiAZV0dnCbMZKFWhThBNfJUQ?=
 =?us-ascii?Q?5wnJrT3jLu0YUZLOqDOx33brOBAK0H/vzRV92TqZ7hO8C/sfb/I2JBnbwDwp?=
 =?us-ascii?Q?VaGDfDP68gkC5sWJixs0ybkFzQKF5Fmz6O2wz9kFjP+z0GLZMdMXMpBqV9QH?=
 =?us-ascii?Q?Ky9fgnXcvU0QpTUUQSJRWknNlQJxXVh8CiXGiM4Mxd/OkTErX21Tvg3jOqVR?=
 =?us-ascii?Q?KidwLz97jE0+faD7IWs7a/RcrPDZea7I0Py+3861LcqUDD7unuV2s3ordwXR?=
 =?us-ascii?Q?WLPq7K5CXnziDONoKp61dKiB8zJwDEHPKySiPHgJS79duQs5J4rynO1eHeoJ?=
 =?us-ascii?Q?m32GUBhzKeho29iWzB+sb5mO5sx2S5n8g2qDIFQrz66Rc/4OT8rkBGXhPYbd?=
 =?us-ascii?Q?UDqjYiApQy/d0JlROr+kFFiKA2IgjN739wh39syv4GRu0tMDhUuRcfDEMRbD?=
 =?us-ascii?Q?sObObdEYZcLfpRR0EJ3bWJbXBg1u3kGg0xfUf8Q3qRvgvCfWMj0PSGY+EkW8?=
 =?us-ascii?Q?FFSD//iQtrjooBxARdZ5Yr4nekvhQJTtaepdJdkfaC+dmzubcXcVw/LiGIYQ?=
 =?us-ascii?Q?R07WkaxJkAw89UirERyn6Ck88DpP4WbrW+j2Su54H2RnoeHRN+74GVyux64F?=
 =?us-ascii?Q?Yx0CnmC8Sp0AVbB8p4qru7s8voQs3yH2koDoc9VkG3NY2XRafbttxnK0SYU5?=
 =?us-ascii?Q?dQpDs7QBx+nBHI0t1nV7zSLifyxPzSXBvWAr8YEIyIk3HIUzcYz6TiUz131E?=
 =?us-ascii?Q?bY2HHOEyN68eMSg+VlHpHSO4FENNtF8vIMVw8AhW8MaeL3mBPVQ6QXNwhOjx?=
 =?us-ascii?Q?M9eWO9Uv/LRcfYlXKlL6AX0sYRTPTpNAZC4/tckAd2nre5xD2PYKZhfau+s8?=
 =?us-ascii?Q?x1GQab4Hn2sq4takP/OR20RayEOakJjEGuEuG7HANZGpjjVTMHICsp1ykKcu?=
 =?us-ascii?Q?7h0ltRMaMbEclLpMwmKeOkEtsG5vYb81k468q8CN9WkhQiHO+QMY6mQR3dRn?=
 =?us-ascii?Q?wmtPDrNKq9aNPeTkry3XyZfmWbv9lE50eUs45WJ7kbK7Bt+Bsk+qCK2GNzsZ?=
 =?us-ascii?Q?qunXwweopUu0W1f/TbXZN5JCN3HelGq0nsWedreLEN+6FyF5LpHyIkIiFae8?=
 =?us-ascii?Q?2/z4qwHQEOFGn/rGhZAwVFlbi65++RNXyyxi7MZrXELzlA0S4hAKWThW1axp?=
 =?us-ascii?Q?CCdjQKTlEHSy5MIewG+u9NhJUi5kbikRwf2SrF2S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b0c4eb-d189-4623-2639-08dd9f912931
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 15:46:36.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVH2EMMPas35rgvq8qGYxEyEpT7E0+6vnI/4KRPu/OrPoYPQTmjVUMw3u68FNhwoDU6Fa5tT9OgMq3EdpYH4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876

The default idle selection policy doesn't properly handle the case where
@prev_cpu is not part of the task's allowed CPUs.

In this situation, it may return an idle CPU that is not usable by the
task, breaking the assumption that the returned CPU must always be
within the allowed cpumask, causing inefficiencies or even stalls in
certain cases.

This issue can arise in the following cases:

 - The task's affinity may have changed by the time the function is
   invoked, especially now that the idle selection logic can be used
   from multiple contexts (i.e., BPF test_run call).

 - The BPF scheduler may provide a @prev_cpu that is not part of the
   allowed mask, either unintentionally or as a placement hint. In fact
   @prev_cpu may not necessarily refer to the CPU the task last ran on,
   but it can also be considered as a target CPU that the scheduler
   wishes to use for the task.

Therefore, enforce the right behavior by always checking whether
@prev_cpu is in the allowed mask, when using scx_bpf_select_cpu_and(),
and it's also usable by the task (@p->cpus_ptr). If it is not, try to
find a valid CPU nearby @prev_cpu, following the usual locality-aware
fallback path (SMT, LLC, node, allowed CPUs).

This ensures the returned CPU is always allowed, improving robustness to
affinity changes and invalid scheduler hints, while preserving locality
as much as possible.

Fixes: a730e3f7a48bc ("sched_ext: idle: Consolidate default idle CPU selection kfuncs")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 66da03cc0b338..9477fbb8d6254 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -447,10 +447,17 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 	const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
 	const struct cpumask *allowed = cpus_allowed ?: p->cpus_ptr;
 	int node = scx_cpu_node_if_enabled(prev_cpu);
+	bool is_prev_allowed;
 	s32 cpu;
 
 	preempt_disable();
 
+	/*
+	 * Check whether @prev_cpu is still within the allowed set. If not,
+	 * we can still try selecting a nearby CPU.
+	 */
+	is_prev_allowed = cpumask_test_cpu(prev_cpu, allowed);
+
 	/*
 	 * Determine the subset of CPUs usable by @p within @cpus_allowed.
 	 */
@@ -465,21 +472,6 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 			cpu = -EBUSY;
 			goto out_enable;
 		}
-
-		/*
-		 * If @prev_cpu is not in the allowed CPUs, skip topology
-		 * optimizations and try to pick any idle CPU usable by the
-		 * task.
-		 *
-		 * If %SCX_OPS_BUILTIN_IDLE_PER_NODE is enabled, prioritize
-		 * the current node, as it may optimize some waker->wakee
-		 * workloads.
-		 */
-		if (!cpumask_test_cpu(prev_cpu, allowed)) {
-			node = scx_cpu_node_if_enabled(smp_processor_id());
-			cpu = scx_pick_idle_cpu(allowed, node, flags);
-			goto out_enable;
-		}
 	}
 
 	/*
@@ -525,7 +517,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 		 * then avoid a migration.
 		 */
 		cpu = smp_processor_id();
-		if (cpus_share_cache(cpu, prev_cpu) &&
+		if (is_prev_allowed && cpus_share_cache(cpu, prev_cpu) &&
 		    scx_idle_test_and_clear_cpu(prev_cpu)) {
 			cpu = prev_cpu;
 			goto out_unlock;
@@ -562,7 +554,8 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 		/*
 		 * Keep using @prev_cpu if it's part of a fully idle core.
 		 */
-		if (cpumask_test_cpu(prev_cpu, idle_cpumask(node)->smt) &&
+		if (is_prev_allowed &&
+		    cpumask_test_cpu(prev_cpu, idle_cpumask(node)->smt) &&
 		    scx_idle_test_and_clear_cpu(prev_cpu)) {
 			cpu = prev_cpu;
 			goto out_unlock;
@@ -611,7 +604,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 	/*
 	 * Use @prev_cpu if it's idle.
 	 */
-	if (scx_idle_test_and_clear_cpu(prev_cpu)) {
+	if (is_prev_allowed && scx_idle_test_and_clear_cpu(prev_cpu)) {
 		cpu = prev_cpu;
 		goto out_unlock;
 	}
-- 
2.49.0

