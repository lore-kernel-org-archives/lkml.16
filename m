Received: from outbound.mail.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365C1E7C0B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860486; cv=fail; b=V594KKfORSigfaW8sx9fcJHYB0arttpvppCIz7f3Db+nu0mxW9SAKzp7aap8an38moTUMnNgZXevUEe7d2Aun7HPlOY3zH4QAoi0NgN5t812k0BtXRJTbeF5fOWyesODR8Fwzap01VAkADOPE036NyqTO+Deey4U3MJRgslqq5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860486; c=relaxed/simple;
	bh=8lisLScUg7S1fvXrrBZ8i51CMrcl+d/pXl11+wzsdfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r+Ayx2db9GWlfudK6lUxwjXOoV+LDPCfj3nflw6jRraUZva2IZJ+fG6gudkq+61IZRDI9xnK4jeNxMMWq2jOmMD/zoaYxCswJLR9YiZzKAL7cKO0DkPaKqhj5qIoFfxrPNejIqevNsULyfpp+7iD+xMU5vS7g8nVN7TaKFh+v+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RX1Hyhy9; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RX1Hyhy9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6diphNhIVut+LHHZZ2ENZAgF4tgWW3ndiNnqaRp+wnUeejLAupKrtNaW8IXbipxYHrTMJHzTmGc3p5oXAdZqZqFEidaAMSluEqcvVaj1zfWPzMLd9lDqC+Cj6MLh5T1Np2jXnQF2/RdvUvSshuTtIIcEUCKBeMrrX9U6FLkCdRVNCVxwQ94EIvzi1ip+IC4Y3oa7ns5kN+iPCpYQ2SHf0H0QalXNewRX99y0R9AqZdkTqdGsyemUHUWn1tQcp8nIAUgZgFbXKWxDB3I55D/g7dae4HFniwWdHqkPnwrFGXrgPbJq+nQZV+2aitXomCpVOadCzjzs3MshVcGYbelkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHaMQ1NKnWF4DOs0WR1WS1JnuDT3fd+nf+H1PZnf4gY=;
 b=W0m0mgTEP3I2xXfB/RRVI1wkVn/P4uFjxOydzcxu851Y5lb0rr39YSQCvCnTPgMRX+uINRyVIx9btpmdeRnp/FS4L8XHXVUiP69RrpY6Qv7kDH698qk4+iCNWZ9arS6aeM7v7ldZJO4SjkkdgoNwe69lyxMWkvzh94TBh1NFB/2Y10B0VoTWYHGWbPrmVOaj6Tuggmn2XsAxjwsLLPTxVZAvZSIsRw9jpW33Qe7Z1OcCAePwbrTnshF/wBXDigrSifSgC6Z/dlYcf7ln6qE/C/NUL3zB2kxal3GmyWfzA0gwYomPd+QdE5ENaAI4MKyokBH26GbJ0pAIaRkoStFAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHaMQ1NKnWF4DOs0WR1WS1JnuDT3fd+nf+H1PZnf4gY=;
 b=RX1Hyhy9HV7GgAoRKRMBkT9cih3dIh6FagePq2GCT3IhIK+WYqE9LkXzB+ofWkMc5F0cVs7r7OxEzYvoOevK2ZyRQuKm+sMTbMG4WaXyjNSpUQogk2OCFNlvMKz0kLlNXJTqkZZ5lXAy+Z+QEu6Y4I7rXYu6W8Z/NiFasSOCM0W/ei8grwF8rs4m2i+y7XXCgg/QMV+5cNOndlDINuNVcUcdmCHSRAba9vurD3vqV42j1jJsv4gsn7tu2/sZfQnBBlUcHAJuYfa0IZPVcx4FKDm3jTqwnvVIJAw2pysHvchaWa2DMVu4noxhMqdugwSmQGlciXJX4HXZMgY6lrFpGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Sat, 5 Apr
 2025 13:41:22 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:41:22 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] sched_ext: idle: Accept an arbitrary cpumask in scx_select_cpu_dfl()
Date: Sat,  5 Apr 2025 15:39:23 +0200
Message-ID: <20250405134041.13778-4-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>
References: <20250405134041.13778-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::9) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f19b32f-ad6a-4d65-50a4-08dd74478d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5VmdqLd3j9DgH+s1+6gEuaoE0IhwSjtnLUgQvn9FDurpewvmdpjsQHx/fV4C?=
 =?us-ascii?Q?Ate5uNGUIgl0a6qRmzoXR8BiKvvJ7MT5p5EFD0TmJCd2JG5xP5LpT4cYFZFr?=
 =?us-ascii?Q?frvYFUBunfClOTjViA90BobaH99B+AQHSvWv0mKyKJBN90IS4hDzSRVvhUBf?=
 =?us-ascii?Q?xe0VmNMVulUQ02hJUSE2AOTMS5tyBSXE7zt/chMbQbV49w+zXSTawfu25jrm?=
 =?us-ascii?Q?axvkSaLvsPxB3e/hZmYkI+IK0zFSXdsOq3ouT4FIi+PnPAeVn/EGGNy8sPLR?=
 =?us-ascii?Q?No7hNFPVM5/FIdkSjA3b8kiAVL/BYq74620FY2Oq/1ImU+AUlYtAa2bhboOb?=
 =?us-ascii?Q?3uux0r4d4aLZ7qNmuyKcD0nNY1ei9w+sE2ZOiKjCITEmGs4NNScTHscOUBGT?=
 =?us-ascii?Q?NB5SWV4jN+MNoWHBgG7wWvuPvWVcHcZu4ZmCEQX23vnYn3oNSm7xzmsy0jyA?=
 =?us-ascii?Q?EmHtslp/bQB7mWfvZGvoctuG09FGQPLahdEGxJLRe2kN52wHNwmtr4fnPtw6?=
 =?us-ascii?Q?2Ncv68J4P8Y9sUEUqxiA3hiOB1egEdmGr058CU1FX1l01BnjTGzk96wxe7Xs?=
 =?us-ascii?Q?9vsPYjFawHqwIjf4kzGejdocva7HDCYaqdAMePbkx8D/vcRMD2VK9zpWpD8u?=
 =?us-ascii?Q?ZPMSBeF5jS5tCbmzB/zS7YiTeDMMUZ6glm7TJfoDA65ZexvcFNZmErh25jxk?=
 =?us-ascii?Q?27Unx7Zc8g6cRV0DBG2R6WyvdqS3c3ULig3p3SqldLka4WeQ3mObk/KJ3tY+?=
 =?us-ascii?Q?PguQSaTPbAo1tlkB2e08f5m5+xEiw7vTTzZ9jG4JXcSdq2U15j79XD9msjT8?=
 =?us-ascii?Q?EI0Ac0YfZcTnSKeoSlpR9w5gC61PP0xFGu+U1Yfrziwd25GuEjGnzIhnMrCP?=
 =?us-ascii?Q?LvYOCvxf3gBJGCJVBchGq8SxozPJSrmuo9sG3AdQA8JJXNhrgTrfOhwIKEeZ?=
 =?us-ascii?Q?oYfst9TlDJQm0NOUw1IAva/QCTCLj2tkuF3/0q1JpatMmLv5wH5IwWdWHPmi?=
 =?us-ascii?Q?Hqab16g59oUu03tufEtSkguD7odHoNYm2GIBMGFQCK8357iqtsZHuwK3FJ85?=
 =?us-ascii?Q?huiOG9o6CEghZfPHW3ieQgTpcSO4vt4r1IsexHvR8mCJ4+m/oiMY50PNUSWF?=
 =?us-ascii?Q?3LaxZ6iyvOgXhb+bSej4scB7yyYNRFdOU9Cqioe9kFND2Hbz8ret3TjP3oXz?=
 =?us-ascii?Q?tBPZX2RSIQgHhffYk0C6E0tanpgt79l2MG++3aCyUkJ6vfFFWoIDYPg5Vzdr?=
 =?us-ascii?Q?iRLwlUa3L3jnvHmRH88dWJYWFdrGuxTC2ibI0t0ktZBSaaGfZ7xgOHQrRuHI?=
 =?us-ascii?Q?CQTvPt25X5qnCBv2thepf2Tf8z8d21Eba91n7PJvT4twvHA9g7QQdt0sJJtI?=
 =?us-ascii?Q?sT57b04dEVXYhKJKj+hb+aK/7mhX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S4YavodkkzPIErg8u6Z/9ckAyjvNkIgAsXkAR0sDaK5n4z9BeeZyHmP0F2L8?=
 =?us-ascii?Q?fNXLQj6PSEvbn7uKDIVvtV3pZkhF9zIzh+bBRh8VPWRpaebcURtQZ5WA3ned?=
 =?us-ascii?Q?d6hbnkcldc1fAOAlqTh4IGP3xSymTcgRthQBmmCVLmQ7KeY1T/64MsbGKxqG?=
 =?us-ascii?Q?4b4mj+lrb5inGejsjMIpfxyTrpKc0LnRZbXlP8fg0GNgr/rHxo1V3+PT1ayV?=
 =?us-ascii?Q?ThG8WY4HvwVctmUr/sYLA1iIYER5+LVp8X3m8I8R901CJgJQ0s/BSbvGJUXJ?=
 =?us-ascii?Q?mR3+boqsCP/F3Y0t/CJqRAFtv41fRY0i8pg6r1KGt6ncvhUELSB5TmRlmLCD?=
 =?us-ascii?Q?c5T+WGmZV7sai21HGBacmgxoC7SMwt+DkVfEa8anm9LzOVRlPFgB4Nh8EmcE?=
 =?us-ascii?Q?PxXCq0tdh3RGX94HR6qfLYonntrN7yovZIp/ep5AMKhQldYywXHx155zE6Yz?=
 =?us-ascii?Q?l8PHWWKJseC0yq2Z0YosWzGHqT/wHam+m6jjp7ahDadeqVm7mvMCDLBehGUC?=
 =?us-ascii?Q?sBoYu4bhZQ/TJd7URINn4w/pukwo/uvrnb1/ZfSwuKE2UDFiExz2uewWwqNE?=
 =?us-ascii?Q?qsIk8RTtUduomzKJHzYB7RPIIGqViZL81Uk3NOSK7V3fe5gppWvnAJXTCKxl?=
 =?us-ascii?Q?DeGmDxfnV6mEYqrsxBJn94r1fmTeKPRGW4bOXi8llig9P3RIInT2N+5f/nGT?=
 =?us-ascii?Q?B4+ULq3AkgPEjjZthTqNgPEICLdEgV2wEa7zAHPFxhavHlgXFWke23XtveRN?=
 =?us-ascii?Q?r9fF1zh8Jod71a2ehJti67fs07hZiMC1WXu4r0EofsWsViXR/Ecc/Oiax2CJ?=
 =?us-ascii?Q?z0IYWfn4o+qx+sgvF7XLKZBrqJ4ZGvgk3Vp7HSPNsbdKVQtlqYAm6yKOvbcT?=
 =?us-ascii?Q?VW5hxpVO/VUClmH5/TXGC6sATQNOWApGvEj3huUOwmSPVpf5YIaPY4L3MdEQ?=
 =?us-ascii?Q?16gr5znHpR9KN1TJO9Eb3XTHjASOxj2bDBezhkEaej0Efa4z0V2kJpAY0J0h?=
 =?us-ascii?Q?IMtGJo4oNW+1/NPTffkxZ2qi28PQT7oL20P7vyX8KLYPCW9KhzFQDgIKprLC?=
 =?us-ascii?Q?Qc9ZTlS/XPYHgEcDR2kLM0ZcadNA7HhgMA3i6ujDy6FZS7tdPNYAwljdM1Fe?=
 =?us-ascii?Q?NZpsQG0jqjlBFIPnSDpH2VV6R6QInY8Ow4n3fnjCiBc/XVnMOrm2iZsEN1wB?=
 =?us-ascii?Q?ZyHj9KFTvn6AomNZeFyYnM9JfGVebydEVdxrPFmlQgN4YdISlUwPmNTjDWkU?=
 =?us-ascii?Q?C5p1V5nXTz6wwm1KcxcBbtHzWvAH9ByBYWHbpi/fuZRANjuejGSFy9/WD5jI?=
 =?us-ascii?Q?tDWn975BPqjxq4A1ezJmzsR9oBehc6UrsyPZD7OO2fqTqC9pHaHXrEdFaO59?=
 =?us-ascii?Q?ME6+3d3xw4adsbiPQKnR8s9LTa3+gax5zNjGAqZJ3Ob6ZI0yNanCkI2QAQ1t?=
 =?us-ascii?Q?MTqu8vc4niNajUQ7imiFyG76K+ukon3/DGUqrCQOgSV+yRm8iEbBwSaldY80?=
 =?us-ascii?Q?LV+XCjx2Usb4PCQNJULX7u18z9IaHmiSz0jMoFy91nog7UvIYGj9q7RCI92h?=
 =?us-ascii?Q?iYEKpXiMQ0TihsNOEsEMCoOgM+eaPa7UJU94yiKw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f19b32f-ad6a-4d65-50a4-08dd74478d89
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:41:22.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E16m0ISL9Njwoewsihq12R8iaB+NEnYO/b6QOfNu+QORhOlVZhV99Ezc4ttEIVZZBMzwyHGUV+fsXOK5B1rurA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

Many scx schedulers implement their own hard or soft-affinity rules
to support topology characteristics, such as heterogeneous architectures
(e.g., big.LITTLE, P-cores/E-cores), or to categorize tasks based on
specific properties (e.g., running certain tasks only in a subset of
CPUs).

Currently, there is no mechanism that allows to use the built-in idle
CPU selection policy to an arbitrary subset of CPUs. As a result,
schedulers often implement their own idle CPU selection policies, which
are typically similar to one another, leading to a lot of code
duplication.

To address this, modify scx_select_cpu_dfl() to accept an arbitrary
cpumask, that can be used by the BPF schedulers to apply the existent
built-in idle CPU selection policy to a subset of allowed CPUs.

With this concept the idle CPU selection policy becomes the following:
 - always prioritize CPUs from fully idle SMT cores (if SMT is enabled),
 - select the same CPU if it's idle and in the allowed CPUs,
 - select an idle CPU within the same LLC, if the LLC cpumask is a
   subset of the allowed CPUs,
 - select an idle CPU within the same node, if the node cpumask is a
   subset of the allowed CPUs,
 - select an idle CPU within the allowed CPUs.

This functionality will be exposed through a dedicated kfunc in a
separate patch.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 48 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 5d6253c6ed908..f39b34fbb8a61 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -49,6 +49,7 @@ static struct scx_idle_cpus **scx_idle_node_masks;
 /*
  * Local per-CPU cpumasks (used to generate temporary idle cpumasks).
  */
+static DEFINE_PER_CPU(cpumask_var_t, local_idle_cpumask);
 static DEFINE_PER_CPU(cpumask_var_t, local_llc_idle_cpumask);
 static DEFINE_PER_CPU(cpumask_var_t, local_numa_idle_cpumask);
 
@@ -417,13 +418,15 @@ static inline bool task_affinity_all(const struct task_struct *p)
  *     branch prediction optimizations.
  *
  * 3. Pick a CPU within the same LLC (Last-Level Cache):
- *   - if the above conditions aren't met, pick a CPU that shares the same LLC
- *     to maintain cache locality.
+ *   - if the above conditions aren't met, pick a CPU that shares the same
+ *     LLC, if the LLC domain is a subset of @cpus_allowed, to maintain
+ *     cache locality.
  *
  * 4. Pick a CPU within the same NUMA node, if enabled:
- *   - choose a CPU from the same NUMA node to reduce memory access latency.
+ *   - choose a CPU from the same NUMA node, if the node cpumask is a
+ *     subset of @cpus_allowed, to reduce memory access latency.
  *
- * 5. Pick any idle CPU usable by the task.
+ * 5. Pick any idle CPU within the @cpus_allowed domain.
  *
  * Step 3 and 4 are performed only if the system has, respectively,
  * multiple LLCs / multiple NUMA nodes (see scx_selcpu_topo_llc and
@@ -446,6 +449,39 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 	int node = scx_cpu_node_if_enabled(prev_cpu);
 	s32 cpu;
 
+	preempt_disable();
+
+	/*
+	 * Determine the subset of CPUs usable by @p within @cpus_allowed.
+	 */
+	if (allowed != p->cpus_ptr) {
+		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_idle_cpumask);
+
+		if (task_affinity_all(p)) {
+			allowed = cpus_allowed;
+		} else if (cpumask_and(local_cpus, cpus_allowed, p->cpus_ptr)) {
+			allowed = local_cpus;
+		} else {
+			cpu = -EBUSY;
+			goto out_enable;
+		}
+
+		/*
+		 * If @prev_cpu is not in the allowed CPUs, skip topology
+		 * optimizations and try to pick any idle CPU usable by the
+		 * task.
+		 *
+		 * If %SCX_OPS_BUILTIN_IDLE_PER_NODE is enabled, prioritize
+		 * the current node, as it may optimize some waker->wakee
+		 * workloads.
+		 */
+		if (!cpumask_test_cpu(prev_cpu, allowed)) {
+			node = scx_cpu_node_if_enabled(smp_processor_id());
+			cpu = scx_pick_idle_cpu(allowed, node, flags);
+			goto out_enable;
+		}
+	}
+
 	/*
 	 * This is necessary to protect llc_cpus.
 	 */
@@ -610,6 +646,8 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 
 out_unlock:
 	rcu_read_unlock();
+out_enable:
+	preempt_enable();
 
 	return cpu;
 }
@@ -641,6 +679,8 @@ void scx_idle_init_masks(void)
 
 	/* Allocate local per-cpu idle cpumasks */
 	for_each_possible_cpu(i) {
+		BUG_ON(!alloc_cpumask_var_node(&per_cpu(local_idle_cpumask, i),
+					       GFP_KERNEL, cpu_to_node(i)));
 		BUG_ON(!alloc_cpumask_var_node(&per_cpu(local_llc_idle_cpumask, i),
 					       GFP_KERNEL, cpu_to_node(i)));
 		BUG_ON(!alloc_cpumask_var_node(&per_cpu(local_numa_idle_cpumask, i),
-- 
2.49.0

