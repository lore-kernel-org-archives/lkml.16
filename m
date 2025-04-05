Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C761EA7FD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860474; cv=fail; b=aQYQDQQxTRJ8GvveknBbKosbYpgRvxt2bIDvzRsIQElScNS4Hej9RL6ifWuZ5esYvAxJ4W4+w23Wi/x1LhKRMozEP7jczhbs3QbkZHcE0np6KOxjFfLzpW2UHY8rfcK1nyQ+T+oFZMVo3mDFvyudpBJLd1v73v9Vgw/o4rFs9/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860474; c=relaxed/simple;
	bh=1HEmvqb3XPeHN1qAEgDvUxwO8mIfSAZigJsOOzB1z0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ExYnHuhjCQf9bRf4QopBcw0mb9M2CepVgXlDrHjnzc0oOzJE6ONeFIUvLz1pQubFNzWAhEDMyyjegzjm1nPyyyNr/iPfPLFcnD7Z8HbAHsOoFChOPa6qAtdQK90NtkqflObxV2C8duyPMi44Ql4c6w45owOkm6W/oZ3aF4o/lZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e+9TMoav; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e+9TMoav"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmjP0XuxZR98H2GVFjyBIeBMM+8dnEzAju5NqoqoS+VEYVSZ1UhWuJsCj3w8GdjZMJizzvBfah6VdwokH4zVu2zbtT5GBLvOSfXk2wdJ/AYQgR0p7+/EJf9UefhWgWxt2eq3ldq3TNZUs081xETGEzDyPa+RW4+wO0jeB/1r8nLc1NR6J1xz8sPJQKnenGtzBgUmqvg6xjE4BEpUNDxuXxSF5BHQqctwb5TKpQvfy6ipoUjIvOhwegoc6ndIq2A170q+nKQlyLpKALfp7NutJrqTovni3ll0Gn1vIT94t+w5/rpw17JeFDvEFP8K0FntOQ4GuRgrKpSOt15gf7EDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFuecpp1ECIUnGxj4PkrOyemD7gJmIQnK5RcY3Eb9w4=;
 b=O7q+HhYT8lUwM4lPeVYFystwO9uVhSZwDo7FNmu2BZ6GRgwojSUMWHtCCkQM3i046S7GIkbje596By0jt+xgF2ykZ8ZOs8Ucue1dYbDHXRwyDEvEMkSeWjBhlZTHPpW+kt0wKUrREoNHEaRYvdkR6Fmh1oLQfKPgygotgiBFnXOOa3PY+Ox5Qe96/CJKSBIpnWHqiWneZd3KTohvMv7HT+vdiQOLddRpwSks6jf/afkbv+baNVwo7BqVs3JhlftYV/yZPbKaNOUxqLoYp0TPTxZ4tr4gozka8dVFyOzuWN8AaiEzHJ6ulccqyl/NqWX0HlUaTlwZTkTFJIEBq+FSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFuecpp1ECIUnGxj4PkrOyemD7gJmIQnK5RcY3Eb9w4=;
 b=e+9TMoavd21ieHzKk7f54pK5eETCuXtUD6mk42n2Bp2Cq1J9ft1qjjq7AAJldzh7Uzh6NFWDHDM1IVufEcvb87sBfVRzXK+EetlzSgi/PHKPIRZoswRhjOHg5Egkg6397FYvAXa4tly4F3/Ti2TyjM/ZmzGX6/abDwfdRz/r0sUuiXfgFqXo05YYJPWA+LeAJpL/Pw2TRFj3CED7VhzpLknQEwiZuCijDm1VTrN/7F9H3ohu31121iGIOOEs6YqLnviukUGaUWGp5XqdmrpiHslz7XQSUR+2zBkt7CnVnWkN15+4P5XX5ivMecRlCln5zwiL5GvOf7NAY6qV+qFjXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Sat, 5 Apr
 2025 13:41:10 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8606.028; Sat, 5 Apr 2025
 13:41:09 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] sched_ext: idle: Explicitly pass allowed cpumask to scx_select_cpu_dfl()
Date: Sat,  5 Apr 2025 15:39:22 +0200
Message-ID: <20250405134041.13778-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>
References: <20250405134041.13778-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 997992bd-f90f-4cb4-b62e-08dd744785fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iDoHI2ssg1PWKJbaJhVTttibdD3XGuppt9jtF8sbk8MZFHV13zw4gXyqKET1?=
 =?us-ascii?Q?4AZQkuo+lu1porJNbc29cK2OqPNDz6iWRHqo9+tuGZi2BH5ZhCT5WXRAx2FK?=
 =?us-ascii?Q?1e3D+OvDXFfSrB1HiyAfRzAc3Fh4dPIL+OYvvlWvFbrsEZlVzJyXuNafH0ud?=
 =?us-ascii?Q?kw5lgMFUS+hrILkbgohLZng8WD3w+e32u/31LFb6DnE70zpXy2TcfZb04sZ5?=
 =?us-ascii?Q?gx9HZONxdZO1IR0+yqgVS9on9CZOA7aBvi07uF1Pp4/troc6yZvimEqDCTsv?=
 =?us-ascii?Q?RoDfXZ9CPI8Lcm0/WS4kDTiVnN37wEX4bYtwg4sINsKtP8jfzlKM/oRjh0dq?=
 =?us-ascii?Q?0vEGDjtDqwvMkKZqB3rkjF8RCzyOjWKHf05/Ixrgm4+ni9bJ+GzzCWbOOlfo?=
 =?us-ascii?Q?rUC1KsZxTOigm2ZqEs0LcbcdBPhWjUETQDumk9xcqEK0C6b32hQHTb05pAzV?=
 =?us-ascii?Q?UPN4AFIyKbIlPn5LzrUuRfmxqkXBWJ4R+JcbjfarQGPCdijIkDLj695Bh1Bl?=
 =?us-ascii?Q?G+hK7YlPFSoVBUEVwKG/zh25fgNSQnxqecExH9bP4ik5+lFsNb6F5plsuqDb?=
 =?us-ascii?Q?2f2qI34zZykTMe0SXKiYvU8QcOdW8621gugMzQyPMJ7JzAwQcc4FIJOAG8/+?=
 =?us-ascii?Q?xyhW/39rfojt+yToIzzaYnSvz3tf92hPxBPYnp8Pb8yEoDOl+oSk2uV20rc7?=
 =?us-ascii?Q?piMKmUuzOc9lOyDYncYmAICIXPVYeZvXdb7FCoDMrmimSnMPrTJlYBLM8wU8?=
 =?us-ascii?Q?ZslWkaTGbjadq7FXJwK5K8f2GkJW7QQNFubr1n5qUfQmI3VaIOaZewn8UVcm?=
 =?us-ascii?Q?H5eVZDFE069QgQtmrlT9VJSurky4+zLYnXAjkiLpnhV8GLFil1IHQtA+rUsS?=
 =?us-ascii?Q?65LMiNECsL4nC0+avMCG16cJJzoyyEkjy0ZNVLe86kC5us0AnCydeTBVlYp3?=
 =?us-ascii?Q?wIR3o9v9nQ9taWWZdjN8AUage+J8aTau3wGnZDZy3H39leZs7Q94w9MIlnJ4?=
 =?us-ascii?Q?AxjvrAtTR0E3rHHnefdWFvT4cS2TmmClhwtmN9otPfT86APe9lbbNNxPuKMP?=
 =?us-ascii?Q?loEyVuJ/Hf5E2NriUCRVnPcgDLJy+hl/duCJS6Ze7cseQIH8T0HWVQIjfknM?=
 =?us-ascii?Q?aY52qhCZtq5SLsB9cEHRKmblQDhtczP5rD4v4ua/54bsDRH8kgXO8xfofu5A?=
 =?us-ascii?Q?oWGOACg8Q2NacvPnAvj3DQ6cjN1evrexFDesVl4oF87q8KUz7JNdWsTzkAEF?=
 =?us-ascii?Q?TThspb1W3HPNuRExYvtPrkkMbjSDH6UEZfJ5JCONwfODnca5wysBGvmTz1S6?=
 =?us-ascii?Q?4GVQH4JmBNM6wNMTi9eC992QBkfXlEgkhKDwM2xP7ARQD3ErKP/sS7WyYHTv?=
 =?us-ascii?Q?tsX8Pv5pKNP91fTOG7QV98LCHLe4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ExSR6AO4tkZhvZAt7qwB4axrd47C4XmaUZGhekubHZ9eZBBBslyF2k6LjmvB?=
 =?us-ascii?Q?0MLBGVCNvtvNnaVcgIbl5eaBkdQttCdDHAMzl3VpJovWXr2EReRnar4wavMD?=
 =?us-ascii?Q?H7s+pKtVFYdSJiwIWQwiDtjyNE5GO7qRVEK8ruacdsUREBxqpFUCmcJQNQ/U?=
 =?us-ascii?Q?hMcxo0xDEc2jRAXPWAE+wMqLKQNcxd2vPyn0CogHrPain19slf+s7cNlb+qL?=
 =?us-ascii?Q?9qAkzuCPoUgH41/Dz3N4EapG9rbeq06SRBE3UP6F/XSvhCbacpwZ6GjdfKRX?=
 =?us-ascii?Q?qMJVJue/+laDYYC1/koeg9a+kCUgVEkZWkyh7QlFPsgIt6F5lIhBJ/D8Dq89?=
 =?us-ascii?Q?WKmO5fLm6KVKTTfYNaVnscF1IvFobhRMUGtDtCewtB7+06HqR2kicjQwUI7t?=
 =?us-ascii?Q?8a1UomrUb1V0Pdb6eURuldATvm8eKNT8Gxq55iSMD1D94TkZbq7DkexY+/C6?=
 =?us-ascii?Q?q92mGFJonLytiZFZcsPRXoZ6Qc0aTW2OVsPqZs6F50gDOEIY8iXzIEQgY5oD?=
 =?us-ascii?Q?SZ+6G/WlRbrFQx/ffPHNVlH6y267CyJB66AQyhoRxv7wVYT+DuugB/Yb7T+q?=
 =?us-ascii?Q?omIhj0+wg9M+2HEyFaCvl0QYJ9e4tbdidpN4TwsHGamxY973Y4BR8tMkMPtN?=
 =?us-ascii?Q?1hkpZLbHVzfRppNp86CHf36RZbvtKYe9x7Zh9XVp+Rqq1AFY5hdcVHy7wwFb?=
 =?us-ascii?Q?8P6RGfu/U/6PGMvZBCSvtVEGu4lLfBblzz0qICMLRsNqcxuiSzrFfylkFF6T?=
 =?us-ascii?Q?lGkTNcdccwJfTxB885t+ola4lIx18CFJK6rLSLKtcC9OiGB+PM18OZq/3BdQ?=
 =?us-ascii?Q?bGPjnULqpSx5D16ucTAqn+5wHq39xrDmoywSwAa3lpvrOSCvtsi97EoxwT6S?=
 =?us-ascii?Q?Yh1Ent48DD22N+cIDKiSDylxPjgbvhi0U114TbqrwNGn66bVhKjfjrsUFfsI?=
 =?us-ascii?Q?eFk6z6sjwXZoRrDyYWyF/p7sm1cyBHDQAX0/wiE9LOPHAOr9Wl1kR181ZBzT?=
 =?us-ascii?Q?jLNcoaUR8IPnlPlgcYkDqoaIozbwUXVpJghy3D/ltBlZYMQ/de6QylO7BAB9?=
 =?us-ascii?Q?XArbFPh2l5kV9X3FANk+2rHtQpnxA75yOPnbYOYtqzsSZSRMFQndR4D5E2a4?=
 =?us-ascii?Q?WTFUpp/Y9a5jJ36zlVAf6TINRqxK2DvTvWlVjhYFyuhB4QNE5miYrYP4eJdA?=
 =?us-ascii?Q?HNELJsugi6c79Tu2kHpHFz4FMHxr919a0e5S6QiF6jk/zpXcnpHq+jvBaG//?=
 =?us-ascii?Q?jAWTrG+sG2VDtf4JqeRtg1VtuLjxZLQRb6vsahAsp89D0O+b02JILlLcwyf/?=
 =?us-ascii?Q?L+2f6KuI4NvA7N/T2ZyuCSoVUusj1LlHdLpJZpLn9tNI9AlE5eFKGQBTqL6t?=
 =?us-ascii?Q?AOtZAz6GD3m22TqfNb3KHATQTpvmMT4T0ZJcDByNu44Jaqk1XcGTWbbCl3FJ?=
 =?us-ascii?Q?zFdlOxzHeq3yF/Bt3FjyZXMFjG+vnDcgxk4H5rZRyBVMKb+yhFg5ey42qZIS?=
 =?us-ascii?Q?0G3CKIiNTgn412DRLSUOv8WYu5bkMUgf3oytd34Bg4tvPds9ftoDxvIUpd15?=
 =?us-ascii?Q?tdb5HK7eguOepgc1Bwex1arUVimU1g3R1KZeaeCH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997992bd-f90f-4cb4-b62e-08dd744785fd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2025 13:41:09.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+P642ma6v7ytK0QvrrPkv/zzb8AvaWcwHgdoqG2NOUAKo5Bx/h7uKTW0mgXEaLZN+FwQjAk+yejuCo4LVgmkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

Modify scx_select_cpu_dfl() to take the allowed cpumask as an explicit
argument, instead of implicitly using @p->cpus_ptr.

This prepares for future changes where arbitrary cpumasks may be passed
to the built-in idle CPU selection policy.

This is a pure refactoring with no functional changes.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c      |  2 +-
 kernel/sched/ext_idle.c | 20 +++++++++++---------
 kernel/sched/ext_idle.h |  3 ++-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 6781e6da059b7..ac3fd7a409e9a 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3392,7 +3392,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 	} else {
 		s32 cpu;
 
-		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, 0);
+		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, NULL, 0);
 		if (cpu >= 0) {
 			p->scx.slice = SCX_SLICE_DFL;
 			p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index ed37fb8e45180..5d6253c6ed908 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -438,9 +438,11 @@ static inline bool task_affinity_all(const struct task_struct *p)
  * NOTE: tasks that can only run on 1 CPU are excluded by this logic, because
  * we never call ops.select_cpu() for them, see select_task_rq().
  */
-s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64 flags)
+s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+		       const struct cpumask *cpus_allowed, u64 flags)
 {
 	const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
+	const struct cpumask *allowed = cpus_allowed ?: p->cpus_ptr;
 	int node = scx_cpu_node_if_enabled(prev_cpu);
 	s32 cpu;
 
@@ -460,9 +462,9 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_numa_idle_cpumask);
 		const struct cpumask *cpus = numa_span(prev_cpu);
 
-		if (task_affinity_all(p))
+		if (allowed == p->cpus_ptr && task_affinity_all(p))
 			numa_cpus = cpus;
-		else if (cpus && cpumask_and(local_cpus, p->cpus_ptr, cpus))
+		else if (cpus && cpumask_and(local_cpus, allowed, cpus))
 			numa_cpus = local_cpus;
 	}
 
@@ -470,9 +472,9 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_llc_idle_cpumask);
 		const struct cpumask *cpus = llc_span(prev_cpu);
 
-		if (task_affinity_all(p))
+		if (allowed == p->cpus_ptr && task_affinity_all(p))
 			llc_cpus = cpus;
-		else if (cpus && cpumask_and(local_cpus, p->cpus_ptr, cpus))
+		else if (cpus && cpumask_and(local_cpus, allowed, cpus))
 			llc_cpus = local_cpus;
 	}
 
@@ -511,7 +513,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 		    cpu_rq(cpu)->scx.local_dsq.nr == 0 &&
 		    (!(flags & SCX_PICK_IDLE_IN_NODE) || (waker_node == node)) &&
 		    !cpumask_empty(idle_cpumask(waker_node)->cpu)) {
-			if (cpumask_test_cpu(cpu, p->cpus_ptr))
+			if (cpumask_test_cpu(cpu, allowed))
 				goto out_unlock;
 		}
 	}
@@ -556,7 +558,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 		 * begin in prev_cpu's node and proceed to other nodes in
 		 * order of increasing distance.
 		 */
-		cpu = scx_pick_idle_cpu(p->cpus_ptr, node, flags | SCX_PICK_IDLE_CORE);
+		cpu = scx_pick_idle_cpu(allowed, node, flags | SCX_PICK_IDLE_CORE);
 		if (cpu >= 0)
 			goto out_unlock;
 
@@ -604,7 +606,7 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
 	 * in prev_cpu's node and proceed to other nodes in order of
 	 * increasing distance.
 	 */
-	cpu = scx_pick_idle_cpu(p->cpus_ptr, node, flags);
+	cpu = scx_pick_idle_cpu(allowed, node, flags);
 
 out_unlock:
 	rcu_read_unlock();
@@ -858,7 +860,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
 		goto prev_cpu;
 
 #ifdef CONFIG_SMP
-	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, 0);
+	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, NULL, 0);
 	if (cpu >= 0) {
 		*is_idle = true;
 		return cpu;
diff --git a/kernel/sched/ext_idle.h b/kernel/sched/ext_idle.h
index 511cc2221f7a8..37be78a7502b3 100644
--- a/kernel/sched/ext_idle.h
+++ b/kernel/sched/ext_idle.h
@@ -27,7 +27,8 @@ static inline s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node
 }
 #endif /* CONFIG_SMP */
 
-s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64 flags);
+s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+		       const struct cpumask *cpus_allowed, u64 flags);
 void scx_idle_enable(struct sched_ext_ops *ops);
 void scx_idle_disable(void);
 int scx_idle_init(void);
-- 
2.49.0

