Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050623C4EA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063094; cv=fail; b=HjsWVpUBmf5Pj29zPK3o8wdi9rRLpYBr4dLBLmCTD1y1qJpNyzpjpj5JFZMpN5tXghXeYyLOoyEpepS5FV3OvJEi8EcdS+gF8ryc1MdNA7skNzHNM3rQ/n/ByAQEQ9I5zUZPusT/IryeY1ibEEb5o7Ql0/ZjaFOqRzwHviD/Eo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063094; c=relaxed/simple;
	bh=mY4Z7VZQsjms2Ih4Qcf+vczPNZHLT7lNGu+JEpavmbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hWSHqBkL1CqtGFrw9KrGsuT/GOfgMI7QMQsHH6K/kN5c47VAfXFvFTqaFipYsBHrWE5wqOq1bDGvwV4NV/VY2h6I3Mxm/3MYchUF0xeKiURIAIfPhuyR6Bm3g8el7dkBfHvfhubynNbPJcqTmGs728lZnV7udtIZ1vILz/njRF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DdR7Awuj; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DdR7Awuj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3C2/JXa9nUk0o/BQDQ+jTkBNrDx21xwv3BUAr3uIowArTmPytf5x5cWo+cPmSSaYHWttsgkS/wjRPob4g/mhfBBB77uzsDxSVnXuEXCOLg7lrDSgHrdf1O+hPgiAIYzjMwmgTQ/rOvUelTwp1xXb4m83yfgiidhN1wu3vIk6TPrgmLtSklXRMhO5MFc3A3W4cXgH2xzyG2iieIwInw2wqQ/7MwV3aFWmXc9sNo8bhHmJk69I1JEjXAM+lOUqmeE+LSYatXx07rNAomd/OF6J7E5SxgBM/2qfJygaw1jenzW5DtS5pLlVo7qPRnhIjEgQC/kB4pjWrLzLudraJbMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcIhcBHqWWD4+q8qfS7R0vePSpqJhqZLLP8uQYucC6c=;
 b=HWvT2g4qZAaVkIATxC0g52gn+xaOLZlyccs6AmwnKaIRzBopG7QnzYpBtTenTf9SbbO3qpdyxT4K6ykzwLOCwUBJz7IpYlvc5HQQOx/m/9Ha7n15dwfVrqFYX6Sn65Nb32xykN24851sk5LzRfk2EyZ7+5BReq6bO4Pc6B552dPgbYHDfr7BQJ1E4WLb3aIiTts5eyM5cBOEsEpU9T2q0iPatNzuQmKSE4Tn1m4ig3cBYcc4pmGLrpQVGlCA+GZzuc6FA30f7vbp9jkMy2xE9a3mDXpWJv72XHDjHdqVPWT9e6MtZ16hKxd2XPFcu9qP8aALu8b0hj49Wyz9LlWZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcIhcBHqWWD4+q8qfS7R0vePSpqJhqZLLP8uQYucC6c=;
 b=DdR7Awuj/bhV/b9AvvyuTi2+abdcU93oiZAlbqsdwhpfR/rAxB485Cijmi2jdDw9e8oTvrv3I9w17byt1yWfGfm4EFYve0ktDRnXkuX20OgaT9W1bUoaGAjNX1XIHLn5pszTLaaC4S8Cilutw4NMeHFfJBo13dF7+S8IkyA1pLEdn6JutTdDjTinXx7VlM7+sZf9bzfkH6z2AvsFYJR7ZPmTUWazCHTEEsutsqqvDltcO5mvt8UePHnZtrbJM4tWksqhbkqzVx2ebxXmKmfjSGaOqop1JEcTmXWhP4hNwcM0UiD99DlHfG8Qw1MfZV+G48FL28lSxj5mIGviTVVhQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 15:18:08 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:18:08 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable from any context
Date: Mon, 12 May 2025 17:14:56 +0200
Message-ID: <20250512151743.42988-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512151743.42988-1-arighi@nvidia.com>
References: <20250512151743.42988-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: c34d9989-c9ec-4990-8402-08dd91683370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SZUOWXDOaAhca7r7Bfh0ZIxZks1oBu8c/5sZlIPlQD1pWZZkVaq5lH7Tcv4y?=
 =?us-ascii?Q?j+XwwDV6WHQinOq95Ylkuo2EiRSTqGWyrfziNTMgb7wjkEn+FKq4BDx4V06C?=
 =?us-ascii?Q?YtTD1XmjPk9SC+t3KMNbRRjwPGBxbOcqKlJwuylCN9Als8S8roL+PBl/Gh3V?=
 =?us-ascii?Q?F4SdukLQ1Ia7UKslgKOY70/BnKgvUXK4Py6+RgZDbNhMeSoP5oXhalphQdai?=
 =?us-ascii?Q?4ZiWyZ2r32ZMtD6IzmzzHmtKBzurcKCT0eKBm74B25GlFma/FYaW/U0Mco3t?=
 =?us-ascii?Q?M3Vv3eDVPhJg1GLpF7yWXvZm5yknoQH4ESEL5gLnRVbq/tAFSJJz6b+0l1B8?=
 =?us-ascii?Q?C+NWgMHBF5LTM4sONjcqNNgUvlAOCDKTtDY/zoDA75EFttUz/rZW2XYhfrTR?=
 =?us-ascii?Q?JSRdw2D460C/d8YONSuClnu9eZU6Bc7ihSXfzQQ7nxk6Y/AC4EcXLs4tbRsn?=
 =?us-ascii?Q?YNEXdwNlcf1Y2842mQPOthB041xFoO/Xp+yen+/0y6VIW2N1Cw6D9R7L9jS9?=
 =?us-ascii?Q?SZZwThPG8e5LiuA0kufwDtNi2Ga72RHw0pJnuCVibXb3HpmtMKgQUt/mGMAe?=
 =?us-ascii?Q?RkvnIo50FQqX9soANW9kK0T6KdwLT1Vul0oseboYy3XebMWcQJtjvLm5GhVH?=
 =?us-ascii?Q?v+4Edw8dWdRJCKYD2ZHUQi8TpyWN30H9kseyyjD60JrrY1y+2m0lF2uCrPj+?=
 =?us-ascii?Q?HPyW8kcp5eGOXi5tDrxCGuzbcqNr+lsPjtvqCsf72HZk/jxQ+7MmVERt7c9W?=
 =?us-ascii?Q?PY2DvD+ItgxITX0JP+mz4gjL1SuHIhRTzUuORCaJA2e+3sJSc7ChJrTX5ow4?=
 =?us-ascii?Q?0WynILmNn2kyQGEWdUnIvDgJiqqJa9bUMYBF3pmCD0HJ+Dp99FNRmyTk9eeP?=
 =?us-ascii?Q?WibRLwCFEXkcKBB4usGpEsnmULzaqkvv2jQQZoBKXm4EBeS5GXnOgPW60D7N?=
 =?us-ascii?Q?LmxGlpmVcqEe+nugIhSNujVtS0K9UpaO/nnRjyR7OYrWoPTo+riUaVlTjRcQ?=
 =?us-ascii?Q?n5Zx59nV6VqZjxJw7RdBxWytkoTISv6RUOyLxc1R9LcExaS60MlKp9x7j7t7?=
 =?us-ascii?Q?QBnVRT9AxXvEIgr4Alxo6waPtiJNEwMkJlusxTx/mcxAEkfX/+t8wNChF+iq?=
 =?us-ascii?Q?Lh3AfAGE4IbmcY7eoyi/OrvYgDYHpGOoihwgZbSubqyrXVpuFJiyXPdKgmHf?=
 =?us-ascii?Q?4WWxiUtnUB6jt84ZWALnS11NF8Py3SMWsXB3WLKMmJK8Ysdlv+wBdsrgHoDa?=
 =?us-ascii?Q?PSvMDO0JCZsXDqwj2mXsnyc6fse0W21H17rN3FgijYbGP6NIdBICYzFOlNX4?=
 =?us-ascii?Q?wPmQ22AkCT0cyF816dvNdLkBsJbIkQo7Q4pqNbDomlswzXpxNsU4YPM69wVl?=
 =?us-ascii?Q?4RxYWZe++1BD8ENEvZwfwF00X1H0/0Rcj/djvaSHJyHpSAVWYuwYdqQSkElP?=
 =?us-ascii?Q?w3CSgXFCntI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sUBN1hdPVf5vz7D6Wppz+FgasGdiKRAOWst8vnCGaxhmP7b56bcx3wiE07w0?=
 =?us-ascii?Q?H472uZA9zlrU22LMb5OOV4zrAYjNGZNLa1bgZRTHbUXTwaxi2VZt5xtZ7Q5q?=
 =?us-ascii?Q?ymnXAQRPD/MYSYdO9Lbu19WzmKZsuRtIHL1CBNlGUzl1B597k1adtAouwNGH?=
 =?us-ascii?Q?fwgGCbgRE6u1IgHgqjBdyr0nFThEd36owFE73a7QY/Am4kcsfWKwDqW5lHCt?=
 =?us-ascii?Q?nZC93Qp+JMztgNyLHzuGGc9kkuIILfWHeiFGJlrdWEPA9M72bAmtd5sjGAaK?=
 =?us-ascii?Q?jzGAflbVfcdF9ObvllLWRPOMQLal1DAM/b4vKa6uIIABLDDXolACG/zkoocp?=
 =?us-ascii?Q?Wja/F85I9dbwncuoCkz6oOLGFB5F/aHVd6tiYNSsVY9Iii8rv1hNUZJb+rnQ?=
 =?us-ascii?Q?/i4YLtws0s7ZwV19SnoeTvfipjRW82il0BamU79CAFhRkBH5qXUl7wWQwzmD?=
 =?us-ascii?Q?oJ9wp9RQVsJl5ibWq4LSoPOquQVd3evvIKe4xkFVKBc9tQkM6mgyuIcgzSje?=
 =?us-ascii?Q?Ge9FI5ujH97/ZHAj+ahdRgEQQ7XNRfCky6G8DsUbfZraTDFhDNixBziWnTTl?=
 =?us-ascii?Q?jLCs2Chh9cSQlh3E2EToOfCmHsQfLXxzlq/Q1wf8uW9puv/ZhzNOIp575U2R?=
 =?us-ascii?Q?U/VPyFvuXeixcTe8PiTuiqSfOmAdbnVxSuMNnmwWv/q3KLexWQ2lalWiq4PJ?=
 =?us-ascii?Q?GEoSfwyeL6byhoeMGbAhuzsNeYvzR/7ad00yYGtoJj7hjZba+edRRfbNKypi?=
 =?us-ascii?Q?TAyLiEAVWl61eSmJdmqqxjorheB62lgKjGw8kt+A/xmaWgbjIyXxlKaV99Ed?=
 =?us-ascii?Q?9r/yYO+uY9v6gpRObcFhOzyKFXjMFID0a/n/+LFvQupD3i7gxKxXTt8ekOtE?=
 =?us-ascii?Q?BPUXHiCW0G/IQDgCkUH7SwR4sbyolX5bwG62kdMclKXT0lA8JuP7/cSV72za?=
 =?us-ascii?Q?EupogV7J/7dBWBVRchkMwMWzmjIw18PxcVk0VSLu0fFrHtNHfDlKywtODtng?=
 =?us-ascii?Q?Fj/LC3WAq8Do4ZYUjyKbte4npg28m+ZiqNUFSkSYg1o/detgPY+eT0p3GduR?=
 =?us-ascii?Q?1iQHJ/Br9MiTb0/gl9hnBvSAw5jbhpZ91/arTGuEgEgG/mOjnA5Wa1+Ea11t?=
 =?us-ascii?Q?dDvtaTqxIrm2LXJXrMwv+bmXGvDKcRV1fwExJV2kFg+l1g2DBg79Pdtta3z0?=
 =?us-ascii?Q?esUewf8uSx3m8eZEmBxObeRnODRKaTfQUhmo8QkRS88JF7kQURzxM22tAbtf?=
 =?us-ascii?Q?wnTbD/MkkRvtMunDFdfc0Y8awbNowNKgFYuIJKGpn86+32GHZVeQc887QwgD?=
 =?us-ascii?Q?mu6sO/adVmNXzSwT4IZV9tfk7ciQmUeEJrWuG4nbSdXnLV9fQCre9MM8YN2X?=
 =?us-ascii?Q?P1x5KYv8F6GOwJQ5S2cITJ/Byh/SuY9I2JMKoCWkAcJmwHjkY+AJQ4JMxhJa?=
 =?us-ascii?Q?+gHIYW1XYe0k4ybENCMP3KUftpiJzJfyML0pHIwWlvgdfINfndW3kvE15In7?=
 =?us-ascii?Q?3xbT+U6SFqzdDGL1xqmWaIPdl1QvVEIwd7eLJGJOxsu7Ibdv1RbaDrxb6AJr?=
 =?us-ascii?Q?qlfyJl3GwUXn3c+eQL4Wq3LoF4qvtHwTmw8kBKhl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34d9989-c9ec-4990-8402-08dd91683370
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:18:08.3010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIVs3/lJvATIeNdSjgG16rC/tDOvkECaIe+3urfv0BfxCBSiPyUoD0ZwY2I29ouwFcUBr9fmrE/4CYnxQi704Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619

Allow scx_bpf_select_cpu_and() to be used from any context, not just
from ops.enqueue() or ops.select_cpu().

This enables schedulers, including user-space ones, to implement a
consistent idle CPU selection policy and helps reduce code duplication.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 6915685cd3d6b..5373132db02b6 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -943,10 +943,15 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 	if (!check_builtin_idle_enabled())
 		return -EBUSY;
 
-	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
-		return -EPERM;
-
 #ifdef CONFIG_SMP
+	/*
+	 * If called from an unlocked context, try to acquire
+	 * cpus_read_lock() to avoid races with CPU hotplug.
+	 */
+	if (scx_kf_allowed_if_unlocked())
+		if (!cpus_read_trylock())
+			return -EBUSY;
+
 	/*
 	 * This may also be called from ops.enqueue(), so we need to handle
 	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
@@ -956,10 +961,16 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64
 	if (p->nr_cpus_allowed == 1) {
 		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
 		    scx_idle_test_and_clear_cpu(prev_cpu))
-			return prev_cpu;
-		return -EBUSY;
+			cpu = prev_cpu;
+		else
+			cpu = -EBUSY;
+		goto out_unlock;
 	}
 	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
+
+out_unlock:
+	if (scx_kf_allowed_if_unlocked())
+		cpus_read_unlock();
 #else
 	cpu = -EBUSY;
 #endif
@@ -1266,6 +1277,7 @@ BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu_node, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu_node, KF_RCU)
 BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
+BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_idle)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
@@ -1275,7 +1287,6 @@ static const struct btf_kfunc_id_set scx_kfunc_set_idle = {
 
 BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
 BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
-BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
 BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
 
 static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu = {
-- 
2.49.0

