Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0618D23536C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812978; cv=fail; b=DAMcoomw7Ew1BsLccdCaRka96DDrYzzZQb3hjqWGy3073CmEla/cSCElIVcGLjXnN3QJVfNV7IDvsh8IJLoHLJRHdGJzi2AfjYuh5cRc1nWTrzacV5kQXxtOrhRq3CVzEZScZ4NlxUPckx4zRs/NJtjyjczwQfwuTe4c+rEO//c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812978; c=relaxed/simple;
	bh=nnmumtu1lsGsbBp3khSEuV0K9dq/qU9c/SPiGsNmcVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dT9+HtFFslsaIF9SjCzD96PnNPA2E7ZTMDDXVcQTddUcNhMPMVaiuTbmpJwevs8bJnMB56ST3isy0W9BJVSRtF/tty3faWRGY5ZpJfxZohc2+P1oNw3hL5jnc/vlr0z3Wd+u7V6TdGRQcjDylFzSW0Vz0+I6fktk+mksOOGU/10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ucUHJlHL; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ucUHJlHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3aEHzXpaBXsWSe5JKDPuJGaE+k5sQcDv8I/4iWxctVbIwPaCsYPAli6ndxC6TMW0ObWNN50gM0kipQnbZBFwLQbBdADzlAVtVr0ZUoo3asteHInMMGCSE1yytPaRbAEgLJacLAvChedxditfpl7CYM+DQYUZ7uLr2f+kCrhSwI2OtBz37Rye4z0/TSPpYvBQIElbw81v9Sq2AXjVABLvI2BT/kLEDfPGbESnQZqmVeAamSTaaoM5dbqOLu/swqG8W29eom7Sv4ho6hrMlvgbctRVzhoHMluHr6tMO43/+tYxm6THtfH/rLsG4uDeO+H+c4itFDJMH3Bj7vp4z5XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT70nh5wz9/QaEFIL2mRvyf70MDTpzzE5rixs2cU9Po=;
 b=nzw9xfeDRdiZHaaPD4thZK6qNx+3kM9KE6VHEJux8tH4Q7HV8VYJryEzexLjUYZqflGP/AvP3HMGUw4jwQecezZ1S7DPQ9ophW8pGItH4wB+1yoci2aepdMCk6xGE1YKFciSy/B7Ft/ZQhN3cAFnb9MbTfVDiNMAB+NO55T5LyKNHwPYv06xA6SMVWBfeS6A/9mXqVmr23jVBi5stuxuWR80Euqw2BmdCoDoGflSk1jzirbfVsm82bHyIDjEr2jMvmxHeFRtOV/F1SP/UhS6yIBDO7kk/QTxt546E16kg7FbYYLCyvW0/MPCISfhQBUqxBkx89SK76Vrzfny5vON9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT70nh5wz9/QaEFIL2mRvyf70MDTpzzE5rixs2cU9Po=;
 b=ucUHJlHLOgDvQX3XgHrnDJbpF15QbAYxjGktbUcckM0Se3mQRNJcO9kDs0dFB3XmPSOIE49kTKoHAL1hAl3zXmmOCsOQEz+xCmeFb/uWeuT2G3XBLxF5h4Mpdovrht0asLjjyqhSZa0VByjrun2+5QhZRhVg2jx0prMENfIDL+L5wlFuAlDfs/pwzIWFq9UnVkVyb4QDUWFkzdLl2i42z8TgIKwPNTKQQBiWfG2H88ABYMTQi2CEme0z+Bze19a2leJQWa+ta/NnU9h/uRc/LBr7dpqG5x7XZY8aDrjIQs9La8K8Vx3uCEOYgn/zjZ7R91PY5JQz+4NptX4vqWM4pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 07:36:14 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 07:36:14 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched_ext: idle: Consolidate default idle CPU selection kfuncs
Date: Wed, 21 May 2025 09:34:06 +0200
Message-ID: <20250521073548.140307-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521073548.140307-1-arighi@nvidia.com>
References: <20250521073548.140307-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:510:23c::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: b1343a9a-5ba4-4e90-9c5e-08dd983a2a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xp50sL0lh7jt1492KJ0lWRV0NXItPxStdZ+IloVzIo4PHrtvfVTJG2nuN3qi?=
 =?us-ascii?Q?HcKV8Iyfao5zFWqsMLMd+y3BGXsZANwg7QSWIGEqEcy1y1T10ABFYpH14J70?=
 =?us-ascii?Q?jJdMh7jSZpEGLUUvSeVi+dum11fCmzG71txDV/aFryf9IgVwJjmrNCfnCi5W?=
 =?us-ascii?Q?31FiiZoiUlvEUktqK8Ymy5NAcDZUbHtdnCcdO0NAYxZGoJB1oATfs1AxxaUS?=
 =?us-ascii?Q?WERcE6PzOL5UczIe315MK61vvQOMU+NdibxYQ79mS8taJHjw66EwFayOSWI1?=
 =?us-ascii?Q?X+QZb0KkHlFLldJQm+mmr7hZf9ObbSuMthIKHIEcgkhfbFT97YlxNpfgf6XN?=
 =?us-ascii?Q?gUeSuXM8JdstoQGya9oxoDmrWPAaHIIQRrX2jIlMXlyqq5So45mAnkVyAPzM?=
 =?us-ascii?Q?PELNmyxc3m8jPRp5gKCEvD+pkmocL45psmv0KqaTyslstWqnYe7L21KmhTY/?=
 =?us-ascii?Q?xDyM/vm1sbLkKO+22rf93H6vuiGp6ogJ7R4nA4u1zIPPsd1jKDZEMjexEqNW?=
 =?us-ascii?Q?d/u4GbCY5fmDbaEI/UFBbxd+hT+QRPvNetw8rUjJcn1uiHr0p2TdSDBpJi5u?=
 =?us-ascii?Q?WFkijLjp+mHIlQOXMTfBcBOoki7F44wdanMu1Y8Nax6lBTApj3Zfy07XFuBJ?=
 =?us-ascii?Q?uKpagIL66WFv5Fn1z0QTGK2WugJw/XL6/NLmv1m7v9RRCU9kBNSZl3ihbrTl?=
 =?us-ascii?Q?bns6VlbCKclai45sPXA4M9O1481BDyxg/tT8TukZk+syKuEH6e3u/WTpS0hW?=
 =?us-ascii?Q?0AsoAL+bUMk9E6yyELCPWNYCi1SE3mgfwEa6QPTCdEcbzXWAtN66o99Vg2xt?=
 =?us-ascii?Q?mup02aqllxjAPmtgOgO5UucQpVlBX1UDkKJyBmQ5JkTNfWhPNnBfteQpSURV?=
 =?us-ascii?Q?IN5RS4mAVfiYq01RKzh8sgqbILXnykOEJeeBzXSx8PcDnjLkp2UY7hKPJF5R?=
 =?us-ascii?Q?5rm9JfqCoQrAltt37dRhSXtZ9O0Y6QJQsXnVQo1/M49Hp4YdFLNDUz87xSHx?=
 =?us-ascii?Q?2UClZqi24f8lcn28LbDcGImzdPH/S2FKHvkrNmIR6aRO5oG+V/LQ7RzQ7Kzq?=
 =?us-ascii?Q?43jASF/8pZRrYAefpL7T4h6vXWoOFFOVb26JFPFOTrZmnAqgktX1RZ3walLd?=
 =?us-ascii?Q?4t431nunB5HL/sonXmVkYhvdbMcodLU2cBOkYbYgfuucUik8jksclG6zRW0P?=
 =?us-ascii?Q?RD+qvxqxx1KCb/+rF+X945RKbaWZJ6v1Zt0cyls3IVoCq/4Z+/zLLaAU9rKy?=
 =?us-ascii?Q?Xfcb5SXnHaeSacF0jGNpO88hnKQWAkPDQ2wwZv2j/yc333n3D/1XGdE/sDx2?=
 =?us-ascii?Q?ZL2PCXLtF18kX8fADGtL1/qKyvgEgfF2eXzE1tq04vD6kbtn8aeIzidTPGjA?=
 =?us-ascii?Q?CBQeNDTQuLKEn9GYlMWz5FxtA4DL1odW5+9Z8Omb9gb+k7Q/mu30hIj91KOa?=
 =?us-ascii?Q?wJKGEFl9VkQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7MlTWD7+inaCUy+Vm/YJYbJiQu6aBuIFpCrPsypNwDe3op2RwJa0QhdvOeyN?=
 =?us-ascii?Q?aE2VoQ9MUWQ27kCm9JHpO+HdQ0GJmiqdr9bYhPxg4BSmyn3jQ7K29atuzoy8?=
 =?us-ascii?Q?gQmTFA7Wf7vPEMQ45YLaYhKoUS6I2ENMpxLc2n/43PgFCsjh145SC2MKFtG+?=
 =?us-ascii?Q?o6ABbdkNzh2d+tR8/ZyNCLFaMSi7fG0g+uoKPEMdAYFX4ZBgSLZs1iqlnlNJ?=
 =?us-ascii?Q?3hpJj68e19MknclfKYauLMF/SZG0NcevHYt3Ys1nYzO7TMP4Z8WVCON5rbeT?=
 =?us-ascii?Q?wVCVfM6ovw9G4GWMTmVn3148Aei/y3qsJhBkG7P7xXJIPiCnQGPfpta/6m+V?=
 =?us-ascii?Q?idOyxRkicl0GEMiE9sU6Eh1LSAzaKCQm5sLGYAKEbB/Lyc643gJS6BUnhfRe?=
 =?us-ascii?Q?LKSyuFfZGD8YkDhIjUjXUwxArLi6CDDeBIU0X26ZwbsvHxcBraPAzlrtX46k?=
 =?us-ascii?Q?x8yawDhFH3k8stokQ7b+LQlMnRm7T7L16e206UdoWle77fsDMFZ54UWDb/d/?=
 =?us-ascii?Q?mDygzmep7k9VN8q2NxrBTPx61eYj7SRWXyP5U6/w/nqWhW3ekhi/3kfbdZSN?=
 =?us-ascii?Q?gKMALpjxztMyY49Mzm/rQN5rzURI53lVGZ+xK9HvmiftBkblQNW0CuP8ZKbv?=
 =?us-ascii?Q?NJidIa6mBORWQdIq4Ds2/V0NSW39nvPMhWN66AezL4pmKEuKfk1Sp5lHK4F8?=
 =?us-ascii?Q?rhgZDK72de4AMZio/7AtqFpBqoXwumdISmCs0+RcZTOeO6SrM21xMn7Dv+On?=
 =?us-ascii?Q?gpt+kijQnteqxEZj0+3oLt5J9VX76lm+XIzGTorkLnsu8OhH33UFyKckVtGB?=
 =?us-ascii?Q?eHQNwBW347Lr4/B1hz1u/egSnKzI8tpkDEmxH4xkx+g1rIaYkcWp+DwQAHzB?=
 =?us-ascii?Q?DtFWlwkvXiPsEHP4qw7PC/WKVW0cyZiGdtCGzdybZ0pWi6yjQtPJkCdsDpuM?=
 =?us-ascii?Q?ka5G3USR8kDUm3DR/7Fh44YbA4KNpEGhf+sR4jCU6rhYV/LMu+Ri72RWrEzV?=
 =?us-ascii?Q?VhVdtwxWQVAI2Dl74MQEnODcdHjpveo4nlXO8kEW739YTBJgJgfbMwDlJn92?=
 =?us-ascii?Q?hkaU3hcNrWtL1uOYgBFGcXC74g0HH/Rtu9fAnLhlwrlgWeHnnikU9eKWBNiV?=
 =?us-ascii?Q?lvW+W46yi0K4nl29ELEVaApHo+Nrt58AIw0a+rbG/MeETRpwhtIK0j4QQe/U?=
 =?us-ascii?Q?tKIaB7nxULnKFXBgNfk+ulw8y1UUHJuy9ELw7O04odi2mYoAy5we4o/7vMfM?=
 =?us-ascii?Q?cd2h8Pm0kM3gn+CN1FTPiTC/V6jYmSfQjyiR8YKbr/y1HB5Qoj/GDWRj8RHi?=
 =?us-ascii?Q?Csm6JflOnzfysRqPaSvGxXWssgKiwOd8iJQjCHhAl3kJUAO0dgsf6+20QQf2?=
 =?us-ascii?Q?W0K6LJa+/mYFHeRvoWvoGgd8A+WLQW7QGLf1wCJHjTv8iRcrnBtAqaKhJK78?=
 =?us-ascii?Q?psOm1uzQsAwAeVlNEPlqRyiyilm+De44aNCjihSwMfgsNnUTENTvGTkAu+Pj?=
 =?us-ascii?Q?i9lfYvmL0p26PtDDIG7xyrv2dlLYmkaEfChG8RXysCLNlTbbE7G7YSHtLJDA?=
 =?us-ascii?Q?vfIK3aGoRi/ccdvZ38dD8nmMwTZ7LskEPb/att12?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1343a9a-5ba4-4e90-9c5e-08dd983a2a4f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:36:14.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xi+cm9HmaQIVs8KdOBGGEVNPN6mPVIvhmDGCIN/+HUjILcIsnGNQ/gnGOt2srlux8D6AVgWgvl46miyxUDpfxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

There is no reason to restrict scx_bpf_select_cpu_dfl() invocations to
ops.select_cpu() while allowing scx_bpf_select_cpu_and() to be used from
multiple contexts, as both provide equivalent functionality, with the
latter simply accepting an additional "allowed" cpumask.

Therefore, unify the two APIs, enabling both kfuncs to be used from
ops.select_cpu(), ops.enqueue(), and unlocked contexts (e.g., via BPF
test_run).

This allows schedulers to implement a consistent idle CPU selection
policy and helps reduce code duplication.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 156 ++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 85 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 37279a09900ca..ae30de383913d 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -854,6 +854,68 @@ static bool check_builtin_idle_enabled(void)
 	return false;
 }
 
+s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+			  const struct cpumask *allowed, u64 flags)
+{
+	struct rq *rq;
+	struct rq_flags rf;
+	s32 cpu;
+
+	if (!kf_cpu_valid(prev_cpu, NULL))
+		return -EINVAL;
+
+	if (!check_builtin_idle_enabled())
+		return -EBUSY;
+
+	/*
+	 * If called from an unlocked context, acquire the task's rq lock,
+	 * so that we can safely access p->cpus_ptr and p->nr_cpus_allowed.
+	 *
+	 * Otherwise, allow to use this kfunc only from ops.select_cpu()
+	 * and ops.select_enqueue().
+	 */
+	if (scx_kf_allowed_if_unlocked()) {
+		rq = task_rq_lock(p, &rf);
+	} else {
+		if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
+			return -EPERM;
+		rq = scx_locked_rq();
+	}
+
+	/*
+	 * Validate locking correctness to access p->cpus_ptr and
+	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
+	 * otherwise, assert that p->pi_lock is held.
+	 */
+	if (!rq)
+		lockdep_assert_held(&p->pi_lock);
+
+#ifdef CONFIG_SMP
+	/*
+	 * This may also be called from ops.enqueue(), so we need to handle
+	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
+	 * selection optimizations and simply check whether the previously
+	 * used CPU is idle and within the allowed cpumask.
+	 */
+	if (p->nr_cpus_allowed == 1) {
+		if (cpumask_test_cpu(prev_cpu, allowed ?: p->cpus_ptr) &&
+		    scx_idle_test_and_clear_cpu(prev_cpu))
+			cpu = prev_cpu;
+		else
+			cpu = -EBUSY;
+	} else {
+		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags,
+					 allowed ?: p->cpus_ptr, flags);
+	}
+#else
+	cpu = -EBUSY;
+#endif
+	if (scx_kf_allowed_if_unlocked())
+		task_rq_unlock(rq, p, &rf);
+
+	return cpu;
+}
+
 /**
  * scx_bpf_cpu_node - Return the NUMA node the given @cpu belongs to, or
  *		      trigger an error if @cpu is invalid
@@ -878,9 +940,10 @@ __bpf_kfunc int scx_bpf_cpu_node(s32 cpu)
  * @wake_flags: %SCX_WAKE_* flags
  * @is_idle: out parameter indicating whether the returned CPU is idle
  *
- * Can only be called from ops.select_cpu() if the built-in CPU selection is
- * enabled - ops.update_idle() is missing or %SCX_OPS_KEEP_BUILTIN_IDLE is set.
- * @p, @prev_cpu and @wake_flags match ops.select_cpu().
+ * Can be called from ops.select_cpu(), ops.enqueue(), or from an unlocked
+ * context such as a BPF test_run() call, as long as built-in CPU selection
+ * is enabled: ops.update_idle() is missing or %SCX_OPS_KEEP_BUILTIN_IDLE
+ * is set.
  *
  * Returns the picked CPU with *@is_idle indicating whether the picked CPU is
  * currently idle and thus a good candidate for direct dispatching.
@@ -888,28 +951,15 @@ __bpf_kfunc int scx_bpf_cpu_node(s32 cpu)
 __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
 				       u64 wake_flags, bool *is_idle)
 {
-#ifdef CONFIG_SMP
 	s32 cpu;
-#endif
-	if (!kf_cpu_valid(prev_cpu, NULL))
-		goto prev_cpu;
-
-	if (!check_builtin_idle_enabled())
-		goto prev_cpu;
-
-	if (!scx_kf_allowed(SCX_KF_SELECT_CPU))
-		goto prev_cpu;
 
-#ifdef CONFIG_SMP
-	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, NULL, 0);
+	cpu = select_cpu_from_kfunc(p, prev_cpu, wake_flags, NULL, 0);
 	if (cpu >= 0) {
 		*is_idle = true;
 		return cpu;
 	}
-#endif
-
-prev_cpu:
 	*is_idle = false;
+
 	return prev_cpu;
 }
 
@@ -936,62 +986,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_struct *p, s32 prev_cpu,
 __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
 				       const struct cpumask *cpus_allowed, u64 flags)
 {
-	struct rq *rq;
-	struct rq_flags rf;
-	s32 cpu;
-
-	if (!kf_cpu_valid(prev_cpu, NULL))
-		return -EINVAL;
-
-	if (!check_builtin_idle_enabled())
-		return -EBUSY;
-
-	/*
-	 * If called from an unlocked context, acquire the task's rq lock,
-	 * so that we can safely access p->cpus_ptr and p->nr_cpus_allowed.
-	 *
-	 * Otherwise, allow to use this kfunc only from ops.select_cpu()
-	 * and ops.select_enqueue().
-	 */
-	if (scx_kf_allowed_if_unlocked()) {
-		rq = task_rq_lock(p, &rf);
-	} else {
-		if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
-			return -EPERM;
-		rq = scx_locked_rq();
-	}
-
-	/*
-	 * Validate locking correctness to access p->cpus_ptr and
-	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
-	 * otherwise, assert that p->pi_lock is held.
-	 */
-	if (!rq)
-		lockdep_assert_held(&p->pi_lock);
-
-#ifdef CONFIG_SMP
-	/*
-	 * This may also be called from ops.enqueue(), so we need to handle
-	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
-	 * selection optimizations and simply check whether the previously
-	 * used CPU is idle and within the allowed cpumask.
-	 */
-	if (p->nr_cpus_allowed == 1) {
-		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
-		    scx_idle_test_and_clear_cpu(prev_cpu))
-			cpu = prev_cpu;
-		else
-			cpu = -EBUSY;
-	} else {
-		cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
-	}
-#else
-	cpu = -EBUSY;
-#endif
-	if (scx_kf_allowed_if_unlocked())
-		task_rq_unlock(rq, p, &rf);
-
-	return cpu;
+	return select_cpu_from_kfunc(p, prev_cpu, wake_flags, cpus_allowed, flags);
 }
 
 /**
@@ -1294,6 +1289,7 @@ BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu_node, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
+BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_idle)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
@@ -1301,21 +1297,11 @@ static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
 	.set			= &scx_kfunc_ids_idle,
 };
 
-BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
-BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
-BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
-
-static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu = {
-	.owner			= THIS_MODULE,
-	.set			= &scx_kfunc_ids_select_cpu,
-};
-
 int scx_idle_init(void)
 {
 	int ret;
 
-	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &scx_kfunc_set_select_cpu) ||
-	      register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &scx_kfunc_set_idle) ||
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &scx_kfunc_set_idle) ||
 	      register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &scx_kfunc_set_idle) ||
 	      register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &scx_kfunc_set_idle);
 
-- 
2.49.0

