Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD81F03DA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860465; cv=fail; b=EgkNJgkKyE9vSr1ke+QA1TaCT8LjJFgNCn/Xxgst0Jas43tgegnIW4zhrNn8R1tPzWpBK9BjeI7aU5dp50R4qMmNTw/mifKljklYAVoq+5P2D4xirQUK0pFuXBL2C9sxFlzptdux4S1UkOWooRdJskC2wRswkt1Nkm3BSP260gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860465; c=relaxed/simple;
	bh=Fi7TBuPrZbUvJNBPL3eDK7HBzzYLFZShjW9Ztmkgqyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tVvGIVdS+5+aqrexx5kz7azx5QogyE7FMfyguAFRz1Y3vKUGpS8suRoJvpDnOhT8NRNjUtMy1fykhYJMTD6tAJKB7yOOU8yHqDFFF8QWgMlYZXahTxSSY9gKE5NZS47IE/7vwWWlpagLeA7LP26sPpjFFhDZkcys5k0QAEbjZrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UiPZzNjs; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UiPZzNjs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kml0VZ8WR6kN8gYx/UlYm9iZPHTAG4DSRhCzhhRMauKc+CwMWfCv7XuHgNMB168EP/o3owCQtj8mOzdU7Q3sIMkHB4QvDyQ/TMEK1KNqvsdExT4OmYm8wD567hssoiP/d6Is659Ppo5cC1A6H3dpqMGw2tIacciw9iRSl4ec31jfXTmc3XMLdPmYNpLHKEZc2UIQqhuuNzHaPlt3V3l5CCly3jrdY7Hxl67wJYlticemz7j/Z+m3FToqIli5GKF3AzbcDAz3lSah4ui67n/RafoprM14lgEc5R2MgqM25madodWl6zh5FUQB/Lw96xU2weCxf9qERmeXdTlJxoPTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYTYXR/mwq9Svv4cmhvQ48UuJmSqZZBS38Jkt4J1WsM=;
 b=sHOpj3aheUKur2nZGe8AFpkIqLltTxl/VVjsdTvo+vjxVuXqHKlj8Pg5Yk/cExbprDQY3g3+50/LdaFtkA/4QSus4xFwpdJCO1gJE7z75lVWgyncvcewIbBceSypBthEBUlEMqPzXLoWzGXG2uSvusYRDoD6PzYvYxyl6KJ47Lzqh334NGxc7Cu9H5V/z1ad4yQ5beeslp16+W0bn4uD5HeIEECcSAzrnfqoZkir9iJQdJhGjFOl0Ts3PIByqbbo6HHS7WoC+sQTqf+W9cdOzKYp6GLFY+85lfyJz0qQYP0B8/A23K/GogrBKQaTe0p7jeU6URR4A6vvMuG9LLj8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYTYXR/mwq9Svv4cmhvQ48UuJmSqZZBS38Jkt4J1WsM=;
 b=UiPZzNjsqrI4mTYL4Cuj8xJemOaJpOPP0wzZGxh4Zl8xkFyjLoFs5AaWsDxvLVsbUjTmqQg6w/I+rBg9KEx2fVZV6Mr8JGQ84BMHpsgUPBhXP9fiFnZSKYCDQvE2uYWEMXZdVeFcMtJrqznNX1OkySiVuMPCFx0HoqDdoE5RQZ3bMLFdvPO2/AHLj74rr1vVVaYSdhC0WxHhf0bnaXyytGde0qruIVHiH/RKbYafk9evbIthgS7Lid4mz2N51e4z+pGU4ifhqYLVuwN8SWv+oJMojUlMsbAP8hgkozRqavRXWIzM4Gv27CJa3RNstCAGyfSidwQaFr7+/3BufqS7OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Sat, 5 Apr
 2025 13:41:01 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:41:01 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] sched_ext: idle: Extend topology optimizations to all tasks
Date: Sat,  5 Apr 2025 15:39:21 +0200
Message-ID: <20250405134041.13778-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>
References: <20250405134041.13778-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: fadf91b5-4981-40e8-adfc-08dd74478127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?papg+2UVPvgG1P9KAJYZsOkjZ5hYWfmEjE6bFRyjntWIba5GoYbFrAl0EIj0?=
 =?us-ascii?Q?KW2w/cGReXzKb8snS9m/cAAvIzv51Kl/epREvVmVVely811g5Vcey29QKiQX?=
 =?us-ascii?Q?46VEUB1jtF/s9p5znZPX074Y7CjaR8mxC/476fKIu7bBYs79BVpe+uLHN/3N?=
 =?us-ascii?Q?2lUJ2hDuVJbg1jMpfOAsms3HcCn/ZzA6dzkth7nBzWyo16N5h3N2ltLKIQUB?=
 =?us-ascii?Q?VUR8KR36tUpNjq2kjx6jVBfqK4Frw0MxndtzgipnpGJTRXH5jyYvTL2GbXdi?=
 =?us-ascii?Q?9ysAeD8TXm5+9lRI9EAQ4D2BSFC+6tE7xg46f3iM51eRY6VTtS+ojeIs3p9U?=
 =?us-ascii?Q?7BNUQrrhnXNw9/Qf/+lwse/+QapTcHWVu6Tzs+Ru00NQ2HDewDpBL0HEA2Y1?=
 =?us-ascii?Q?ClUg1+m78PqjP22ReoWnjHA7JWJ5GEQkZu7jWCm7g+tXlzdfIQck8dXLgH3b?=
 =?us-ascii?Q?RHRcm2X5Eb/3dXGvPu9mu5q54xGJjXlRVQdlz8+vbnP6c3vh/QzclrL5eze2?=
 =?us-ascii?Q?xy8uyR5k/BTwE8ml0ArCIt4/ck9MqC0xAcf+EZEQqe6XFxwoGGR86/X8JKJW?=
 =?us-ascii?Q?e1MSpQeeh5cByyjTQ0UNXpz0iDiVAl0jKfZSIzam1mxaLfEJknaq1uSf46t9?=
 =?us-ascii?Q?D/OettnI7km7OkJNv+QTQltM+R+lsTidTvyJa51HxQkAFQuHYefAVsikJ87S?=
 =?us-ascii?Q?YDMEw0CfrQTO5Uzjtcl1+mKRiTOrSbk8+w/rVIWSzoi9oo4o9wVO+LO3lQsE?=
 =?us-ascii?Q?gZMLYLB4gnTvjYuITNNFYYdgnp1o6oAVuKub35GUUaEfX3NfqCmm64GBcSgC?=
 =?us-ascii?Q?H3d6+yq4YPUJzKisPk+oo4RhsnvBlaHJ0lq6JRz2xcgFPPk+Kb3qBMPxD5xr?=
 =?us-ascii?Q?D2hUffJ8U7QsRPbv3ARl5qVrRPf0A2LBJny8MCf8P8S/W2Eg/xuNwL4IacWF?=
 =?us-ascii?Q?nZj5Ar9H8XVX7K4CMaCOlqAPab3BCu0AeBFFr5hVcNoYNTLTogHA8afSNv20?=
 =?us-ascii?Q?TWmpxooiU1cqcmbQPduAcp1GSCGDnX1VzEX/yG1YO0Dg//hzQSyZteoPy2yq?=
 =?us-ascii?Q?7PGEIB3ZnsHGPvs1gRo7MBK43pc7NTrnOMx7ywwKedQZ2odtiY76kCoXNUOq?=
 =?us-ascii?Q?zNpZEuMzt81QeS49buEWQSJQ3/jZHKRCf9AwsM/jdYloc05HcpM9nBo1CtDV?=
 =?us-ascii?Q?lkcZAZT3yKnzsTATAgFdmssjHUtzlnNXGkyxx0QSXjeWOWWeKf1h6v1+sYsr?=
 =?us-ascii?Q?PyGuhAddLQCeZukdKe7jYyCZB0sg9GhBTLJAePJkzcuYGUOgjwYP3OOUtiAu?=
 =?us-ascii?Q?ao449oQpboCm/evZV1akSwjiSBJZrCtF3UPid6bIw2gfUGoQM2QHT04vZB2e?=
 =?us-ascii?Q?B0G0L/aUUSuDOGARCegW6LVhhbr4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68/hPhMOWdcEoJOnu7iJZEs/kp7EpRW/wqmlu6t7DL5veItytsG4u0kovT/o?=
 =?us-ascii?Q?EUKLJHhozmrheumsZNLVkWdMDu8NKtu4FEWtYvijMrLE5CoC02/XBSiPkCAl?=
 =?us-ascii?Q?13Z0TmwxgymV/bu1J6JV+tst1iTsBf29fidPjIZ+4aHLWmZ1+0pyTUceHq1t?=
 =?us-ascii?Q?NVFwr1x1TEQcpnRdUqdcLLbF/zX+jGaSQYqlschvqbbosth4zPOhrVNRmd/v?=
 =?us-ascii?Q?gr6YoxQ2xTPthSgBlUfY2aC1UZTchZBjHujF4qCSK6QBwDI67wTXXqJ+DEz0?=
 =?us-ascii?Q?GUjTeddkq5C6HIeiJ6WuRVZwxpsAwNnXsEO4t2X+surzVzRSFQinFSg5pILx?=
 =?us-ascii?Q?ALFCj1O0PjueJQia5onBBYfPvbokqynTo8Q9pwiGeMUCthRVb6LG+yOTPUM4?=
 =?us-ascii?Q?t4c9jYMJaelXsLAS45RghEGIXK6NMvkESrPHGid67KIfynQQBkqVXu5uImpk?=
 =?us-ascii?Q?KNxPHs7KKDaT2ASRGvtphIFsiUbItOq+UsP/peeDJaj0P3GniCaHnErzHHBn?=
 =?us-ascii?Q?Id3eKaPkvdIH8uQKahE8LQ0ibWF+d4GxcNJiazcbITtuYZRaPYn1tYU1c7nL?=
 =?us-ascii?Q?+2+1SMCS0/RRMvzsm1YGj6lvxEDZIacxVnrIrwwKis4six53E3YHDEofBzbA?=
 =?us-ascii?Q?wui7D8Z3WCgt9R9IQSrYnrBd6QcS3n6OE00ZEIWtn+SL41MiM3K59omGzGb/?=
 =?us-ascii?Q?hFB49hOHu7SUqdCeQp5iwiXCLMz1yWUufBp+vzxj+xRaSa8SwARYeOxZH+jB?=
 =?us-ascii?Q?be6qKS1uoEw5DcoCRyPJmK4qFA7zj8huQ4TWVdMqTE6j1/n70ekyBRNRV/Kg?=
 =?us-ascii?Q?yO8ZIJi0FcXsAnSeyFrgaPh2Sv2QhF5LY21Y+EoahokCeGJUo64T5Hp7wSTL?=
 =?us-ascii?Q?Ed38RM8cr5zpiqIV2dSKlv2+nHvoQrk0DqJ0tgMFasXXl5ORs55lA0vSSG6r?=
 =?us-ascii?Q?4EkWS3bL5pe9NXkyMVSgdOHW1UQclawqvEzfKsIyoOPkwMSgaRAlQwOEMWML?=
 =?us-ascii?Q?Ik/AiAtiW4z+pmWJl9Uc134kpsptThZiVBIJaYGE8s607cNrESIrzgi2227q?=
 =?us-ascii?Q?Znie60gHlyN+LDZdUY+adaQ1trX86FF9LhmMb3zTJONqj+mh2El0l+oVvdZv?=
 =?us-ascii?Q?/UVm9d4KO0UnwNnEIwDvMdhbltYYu5HxJPv8WbePD0EF67hOasv+0lulvJWR?=
 =?us-ascii?Q?VHuW+16jNPHavmKtp22fG0QZI+0s7AS/IaveK5/XNVdjisPM/DRI49cG+SYR?=
 =?us-ascii?Q?OOG3XAdLE69SBHOQZLVZjjHBsHGAZCROGXHub9Ja2MiVdpIWOChhFiZrYIpF?=
 =?us-ascii?Q?JsQ71enjYQs5qSs4QKNGl5oeRTNgQGGGezbcsXwGpDytqnIRIaA7jXxTkcYt?=
 =?us-ascii?Q?RVH0wjZndEfeKsNIQyYy+7UGDcb79NRhBBn7/SC13JCC/H0NN5Xar7RSerOz?=
 =?us-ascii?Q?9Z+mv0IGHSDjK4F0JchfA7b8GTFEtdkgg66GoWKIHQnBYJ8/QmPnw9+T8q2l?=
 =?us-ascii?Q?chSybvQ8b+EjD5pmiaLMjy2XsviW7QlRm/2avHdsFgtcxtbh1jJdBg8B48IQ?=
 =?us-ascii?Q?qn8Bu57mctrKvr2Pk0j86Y4Sl68dXGQWUq1tDeNK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadf91b5-4981-40e8-adfc-08dd74478127
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:41:01.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwi4+NYIhXllqTdGk+zf2lGfR/mhDbrpERaGeyPPx6gVOIJhmEikw7JWhX/DFe5ruYxXH+Nf0ZL1E6YnZb73uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679

The built-in idle selection policy, scx_select_cpu_dfl(), always
prioritizes picking idle CPUs within the same LLC or NUMA node, but
these optimizations are currently applied only when a task has no CPU
affinity constraints.

This is done primarily for efficiency, as it avoids the overhead of
updating a cpumask every time we need to select an idle CPU (which can
be costly in large SMP systems).

However, this approach limits the effectiveness of the built-in idle
policy and results in inconsistent behavior, as affinity-restricted
tasks don't benefit from topology-aware optimizations.

To address this, modify the policy to apply LLC and NUMA-aware
optimizations even when a task is constrained to a subset of CPUs.

We can still avoid updating the cpumasks by checking if the subset of
LLC and node CPUs are contained in the subset of allowed CPUs usable by
the task (which is true in most of the cases - for tasks that don't have
affinity constratints).

Moreover, use temporary local per-CPU cpumasks to determine the LLC and
node subsets, minimizing potential overhead even on large SMP systems.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 73 ++++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index cce2746f9f34a..ed37fb8e45180 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -46,6 +46,12 @@ static struct scx_idle_cpus scx_idle_global_masks;
  */
 static struct scx_idle_cpus **scx_idle_node_masks;
 
+/*
+ * Local per-CPU cpumasks (used to generate temporary idle cpumasks).
+ */
+static DEFINE_PER_CPU(cpumask_var_t, local_llc_idle_cpumask);
+static DEFINE_PER_CPU(cpumask_var_t, local_numa_idle_cpumask);
+
 /*
  * Return the idle masks associated to a target @node.
  *
@@ -391,6 +397,14 @@ void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops)
 		static_branch_disable_cpuslocked(&scx_selcpu_topo_numa);
 }
 
+/*
+ * Return true if @p can run on all possible CPUs, false otherwise.
+ */
+static inline bool task_affinity_all(const struct task_struct *p)
+{
+	return p->nr_cpus_allowed >= num_possible_cpus();
+}
+
 /*
  * Built-in CPU idle selection policy:
  *
@@ -426,8 +440,7 @@ void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops)
  */
 s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64 flags)
 {
-	const struct cpumask *llc_cpus = NULL;
-	const struct cpumask *numa_cpus = NULL;
+	const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
 	int node = scx_cpu_node_if_enabled(prev_cpu);
 	s32 cpu;
 
@@ -437,22 +450,30 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 	rcu_read_lock();
 
 	/*
-	 * Determine the scheduling domain only if the task is allowed to run
-	 * on all CPUs.
+	 * Determine the subset of CPUs that the task can use in its
+	 * current LLC and node.
 	 *
-	 * This is done primarily for efficiency, as it avoids the overhead of
-	 * updating a cpumask every time we need to select an idle CPU (which
-	 * can be costly in large SMP systems), but it also aligns logically:
-	 * if a task's scheduling domain is restricted by user-space (through
-	 * CPU affinity), the task will simply use the flat scheduling domain
-	 * defined by user-space.
+	 * If the task can run on all CPUs, use the node and LLC cpumasks
+	 * directly.
 	 */
-	if (p->nr_cpus_allowed >= num_possible_cpus()) {
-		if (static_branch_maybe(CONFIG_NUMA, &scx_selcpu_topo_numa))
-			numa_cpus = numa_span(prev_cpu);
+	if (static_branch_maybe(CONFIG_NUMA, &scx_selcpu_topo_numa)) {
+		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_numa_idle_cpumask);
+		const struct cpumask *cpus = numa_span(prev_cpu);
+
+		if (task_affinity_all(p))
+			numa_cpus = cpus;
+		else if (cpus && cpumask_and(local_cpus, p->cpus_ptr, cpus))
+			numa_cpus = local_cpus;
+	}
 
-		if (static_branch_maybe(CONFIG_SCHED_MC, &scx_selcpu_topo_llc))
-			llc_cpus = llc_span(prev_cpu);
+	if (static_branch_maybe(CONFIG_SCHED_MC, &scx_selcpu_topo_llc)) {
+		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_llc_idle_cpumask);
+		const struct cpumask *cpus = llc_span(prev_cpu);
+
+		if (task_affinity_all(p))
+			llc_cpus = cpus;
+		else if (cpus && cpumask_and(local_cpus, p->cpus_ptr, cpus))
+			llc_cpus = local_cpus;
 	}
 
 	/*
@@ -596,7 +617,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
  */
 void scx_idle_init_masks(void)
 {
-	int node;
+	int i;
 
 	/* Allocate global idle cpumasks */
 	BUG_ON(!alloc_cpumask_var(&scx_idle_global_masks.cpu, GFP_KERNEL));
@@ -607,13 +628,21 @@ void scx_idle_init_masks(void)
 				      sizeof(*scx_idle_node_masks), GFP_KERNEL);
 	BUG_ON(!scx_idle_node_masks);
 
-	for_each_node(node) {
-		scx_idle_node_masks[node] = kzalloc_node(sizeof(**scx_idle_node_masks),
-							 GFP_KERNEL, node);
-		BUG_ON(!scx_idle_node_masks[node]);
+	for_each_node(i) {
+		scx_idle_node_masks[i] = kzalloc_node(sizeof(**scx_idle_node_masks),
+							 GFP_KERNEL, i);
+		BUG_ON(!scx_idle_node_masks[i]);
+
+		BUG_ON(!alloc_cpumask_var_node(&scx_idle_node_masks[i]->cpu, GFP_KERNEL, i));
+		BUG_ON(!alloc_cpumask_var_node(&scx_idle_node_masks[i]->smt, GFP_KERNEL, i));
+	}
 
-		BUG_ON(!alloc_cpumask_var_node(&scx_idle_node_masks[node]->cpu, GFP_KERNEL, node));
-		BUG_ON(!alloc_cpumask_var_node(&scx_idle_node_masks[node]->smt, GFP_KERNEL, node));
+	/* Allocate local per-cpu idle cpumasks */
+	for_each_possible_cpu(i) {
+		BUG_ON(!alloc_cpumask_var_node(&per_cpu(local_llc_idle_cpumask, i),
+					       GFP_KERNEL, cpu_to_node(i)));
+		BUG_ON(!alloc_cpumask_var_node(&per_cpu(local_numa_idle_cpumask, i),
+					       GFP_KERNEL, cpu_to_node(i)));
 	}
 }
 
-- 
2.49.0

