Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2A224B10
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887293; cv=fail; b=rIuvsdLk/P2DJIT7PxwYNZetqK/SHfMv4LV+jfLUTmRb1VDPKFqIy3KwMei0EUDjnJsvsCHIYURIMakMhrD6EhIgFgH59R4mXv3oHV6HPrKXcdbiOTLj++onrgjzpQv0mw6gQ/H4qqFvV2sckfo7nMqmawRpFqc+JFEemVhp7hM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887293; c=relaxed/simple;
	bh=FaID/PWQBUOrwYlCSMUzYNNVrMwPzCfnozzFxB+Abfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i5lMBcbQuMhlAn9Ut6CSRAPE7a/AJWfdJ3CQWmDy2y5Pfu/bPlBfvNq43d7rG03zyCPNfA8w2eAelMhta/REekVvw35gw6plg/7iXgbziM1QEehTBmMzZfIxvPjbnpeOudT+Al1MIo//RkWYGkLO5B7E/UiA0oZ1bV/o9CaQvZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hFNSrQdi; arc=fail smtp.client-ip=40.107.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hFNSrQdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEIROEj3sMbYUeEP5TssOLe103NPnqLMGV0lXSTp8agUsvnCmnrQ1g+qTpE71RAt24OcJ9pPwANXXIaUkrHBM33y9M6p6aZL5UX/2wLgcjn+zjrYEdy+x//cBq5mDpnoCmUObdv3fsBAg9cdXIDlz4ST+KfEafXEio7EZcuvokKgALf/axer4S66GaLiW+5m6ZFD4L2rJWUZyNm42gNY6H4MoREfAh28mzFeX+l4v6eURiBYgknyDNFuceYZ7TqK3rjGk4h3WHpxZ59j2tG3+Il6bpMZ9zkrEg6M30u3MjqFPQhhcFG7lkuYC+EoE+rwriyIUWOYG3KSIj1MetlnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UxvhNEBHWTLZIgzF0PHXYkkBsDqMUdn/RlSrdPWr50=;
 b=NahmfUxpX/c9jqN6TghqVU6mCaUenVu1MjBN+xpqF/Dldjec+p5Oz4IwR0DwQVdEVnGyVMJhIitApzraJQMTbsyAZluObSfD5hxC1nfHEVZv75zZE6t+MbXXH66eHgF8EI6CSmxEGvf/Dn7XqTUbJw1suNlBWBhu8/jzB9cArEMDQkdDAdO0vJJRo73y+DyB+zMbclgyhNlY9K1acXfjoeFv6H91N/nkZtyBmaFXbGQn8D/uh/zEnoQtjPR1TyueGBZ9/yZ7rUeGUQ53scnFt60q+mluRk+h0CkblZdKRKfeUvORDEPthr4vA0AB70MECrUceehshtEjMeij346a9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UxvhNEBHWTLZIgzF0PHXYkkBsDqMUdn/RlSrdPWr50=;
 b=hFNSrQdioqPcrZ4xrAByPqgOc0hdU64JnMyModdYJzFSqPCc7flYUmXseYldqH0mZADsL1fJBONydq1iG6+7UA0+x874NQAOWJKwuW2btYIluwvizp+VqrTUuxbIlcR7MebAu022Rv5KR6RqNlamW+nxfApyr1JW0lSBHl8S5aMqpEpwLZeWZhSL2M96Nd7lvD3X2t8os+GTe7OIOvLKShpaC0D3OuePOuLfUMLIkeUY7hX2PSi9l5eZZbeIplGLA4i9T3RdNU2TR9R9UlwotwQCu68lpgQDUVeOkprB/IDjM4sEG//zsADxrLELLLjiycdx0rCKB0bZG9CQSopO6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 2 Jun
 2025 18:01:25 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:25 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 01/10] sched: Add support to pick functions to take rf
Date: Mon,  2 Jun 2025 14:00:57 -0400
Message-ID: <20250602180110.816225-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 4669cda9-9108-4c6b-8cb4-08dda1ff7d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKjLuA3Tls+4ezS9Ncj+l7IlEr+1O4AuqdiQ1OvwmK1nOHUCSTPVbYIOLtXf?=
 =?us-ascii?Q?0CMJgVBD5lU2p6oiydBJd4nErI5CqL3/2p4+bwwMMbXqg7UFqE4a9+wQJgyI?=
 =?us-ascii?Q?rBPYA+fKKTjIj7iivmKXXqyFqrpKknmdfUApCOfydSY/18CN+GPRcpO/MlBD?=
 =?us-ascii?Q?LzbBMiaPVZOJeFCSqP5oq+KYJi4PEZAdu32V6GOy4Gg24EOeyF+lblzHnsq5?=
 =?us-ascii?Q?qwJWjVt3ZDoTVt+0nc8YPJefONph2qoE/Pauo3OrjFUDi4yafBRbkIRtA65T?=
 =?us-ascii?Q?Zmy1nP4q5PBVnIObUroX+Wrq+dQdsj6EYlAulUJqxMaKlPglcFrCSUyaD95V?=
 =?us-ascii?Q?VKvqDq5i0VBpIVveduLRogfAovo6onBOan0jDcP8fc6Arl7Trf1F62JSWPv3?=
 =?us-ascii?Q?/U/V3O024DzY06p71FpxOtmyoA1WZ3K9ccHUp99dR1w1JEpWY7kLuKNWspgd?=
 =?us-ascii?Q?18I9JOAg6Ux4Ywle6VeGPhmSTk+/MMvx/n2o8dtDVPRigd3rMZc06JYJuUl7?=
 =?us-ascii?Q?Q6aGXOoO91CeTQq7yt1TJwtsCya/W/vyJZ6BzTaweifCPg9Kgv1TN6eEuFKa?=
 =?us-ascii?Q?lKI2iErAyoqPWVjbnXuC7BYTbLk/XqOm76MjaLECZUC6VwKkM+AYTX+0mPI1?=
 =?us-ascii?Q?3TndUZcpE7h1s7znYl4FhAX4KyqqZ/fgq+TdjXzH0kFASVk8cocHWR7wXNr5?=
 =?us-ascii?Q?g+zD3+NyALh9kMu08gBOlTeMeQZxXYJp2hm+EQteCtxPmsgHBNIQQrAlWpkX?=
 =?us-ascii?Q?mpy7hh0yVqgDuDBemapjK3cq6MK8T8LtGsDuOMLXRBqOs3T1ecxjGd3WEVp5?=
 =?us-ascii?Q?lk06UaJHjZMaWx86T8ytOXOgysD3ii/nDqR4W7rGptkn5xWaFIbpnMmRMZF2?=
 =?us-ascii?Q?qRU+UU/lpLZP3TCSI+ThWH15X0MTfErmQnUnp8NuFAOfm74KooX8EzQGYK+9?=
 =?us-ascii?Q?KDe3sfadCHoVLu/3eNEts+ulJmTBvMQ5Uwc+CYZ9Ib8MN5qhcta+nNnpbaJ2?=
 =?us-ascii?Q?HLq/AsimS2w5AI3SSr6PP1A0enumm1tkk9a7FL3IyA/4jYtpaLs0HRDxLdGN?=
 =?us-ascii?Q?wt/vJlVrsffIqsm9a5Twwm7pShpJr8UyXv4JqFBS6rZM9gCkXdaS+Izwyely?=
 =?us-ascii?Q?okI3bHA6QzkWdoXDTxu2oETFOdul+91nbs4zeL3M1bRZGsgmo3ikJn4oC9k7?=
 =?us-ascii?Q?pn/QZTyDkJb3dt0DsO6IUE5CTU5Fj7E7xhXCg3wuqXlv17gZxkpvpuZ4OeKz?=
 =?us-ascii?Q?zpUghG0ro+KPbxKt3eko3eXKgJwHC07vI3lJBVTvw9l2WHzZKlyeECFliW3Z?=
 =?us-ascii?Q?NM8PEdxiZdwxSrfdaPFfEl3TWe1HOKBxTPcj9T7GhkDo46AGgqhDMWwJ4FM9?=
 =?us-ascii?Q?EPhqjqotCVNhtLClFDOp7NqrOByXeLbX5NHpR5kB9pMxEqOCG8nqIakhpfB/?=
 =?us-ascii?Q?VVVM20NJ2D7145LJKocBzUCU0UzRGAaXVo4wwyEasQ+e4MJCQGJ53Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n159RUwH3RZwRpfh2k5UscH1Z76a3W6oMCR+Tegz6pv1HahHpErH0zdl5M/i?=
 =?us-ascii?Q?EwNO79ehU/cHuvkO4loQ85nmlEYqZpHLsQ/2Dep5uwbMtbOJOWhSHn/qzBBp?=
 =?us-ascii?Q?jSCiZHxc2Z2SMCC5bAcvFzEI2ZvMifq1ERDGsPw8l4PsM529VCJ8NEonanss?=
 =?us-ascii?Q?Nx5ACr59ZQTCC71kf01dXkpHV+L2d1pPBo8/RqAfNZDUSgxaON7ncz629Y+W?=
 =?us-ascii?Q?9tWwFqpidIALM+bNsBa+XgW5/8fRJtyMYTJNVP/McAbW3t89WeDFhdGEaKqf?=
 =?us-ascii?Q?ECUr2UEwrLq3MVa/rc+8bpx+GLAUad0lxik2PzcLi1eEpCV2/OT+BIZx8H/V?=
 =?us-ascii?Q?cM4rW69MdP38vbDxf2j60Kz9BFnSLlOjGvyG8kPCeGqPbQz+Yr8E1KmkjVYs?=
 =?us-ascii?Q?N0aBSIl7Cqjy7Rb1rAYDwJo3na2achyPil5pVaUBuoDrJTFJYCTl9ONg/L8v?=
 =?us-ascii?Q?wdAG5nxvlG3yvqBMtmaA7VahvZzDL4l70aYKIyyVS4L6NdP916fbaDR/N7uU?=
 =?us-ascii?Q?PD6oqDB2f7r5c7Kb3sSvD/T0oml4jZpE6DbhVa6ZxQVFCVsu+xWWONINABXL?=
 =?us-ascii?Q?P/2SIozpSrGnir+IuKl2NERQTm9ffjiqS5oyO93bY4WYHpNicBHsHaigcfJV?=
 =?us-ascii?Q?TPw3VNWh9zxDAI10OoutgS0xteufFbAZz6Q88QmRaEpgE8I2GH6WO/bxZ/g7?=
 =?us-ascii?Q?SpvX2U0LL6loS3F3mvSvkn3Gq9M+PubOwEHQ5vXsF+ywCXBrbD69jr0NwbPP?=
 =?us-ascii?Q?QYJRJuXDvZ5akb7OBikop5q6RebxUHnlC2TnpFHkRyBA5CbkZM6u9cJHTGcc?=
 =?us-ascii?Q?yDkX9FQiONTnSTo0cC8DHGJoOmFUD3IGMSJc+U1ePziQ5qWISj12JqWGll7F?=
 =?us-ascii?Q?nJf7XeBGQw+eYN0XMqibSqonK2dE6DkREQ1GsX3Aw67/4YuRShtmxatvhuSC?=
 =?us-ascii?Q?uDhtEu4+1LL5/B+Xy2ghDwHXHXa/nYm0tFWkfhbLor7WWNW22I0NpEviJruO?=
 =?us-ascii?Q?vAOD77kCtEnpWUFFP5hx7Qq6OTU9PtDlOoyNDME8Fqy6iHtB9AylAYCQZmXL?=
 =?us-ascii?Q?FbCa5RpkNIUvWWoAAmH6+TMXxYrMhsloYVVO0KlkCB38Uqb5zTSLeiED3ppv?=
 =?us-ascii?Q?G+qJ/bU0xXai4VxfhHiEqGBfeYZLoI+Sst+gXaewwO8FleVmk70z0XvN6rdt?=
 =?us-ascii?Q?yOaZq/2nf4oip3qbvszLk4aesdPqDza4CFvne1GXw3TI+qlbcyrklWWwom3u?=
 =?us-ascii?Q?VPz6K01DYMh7x1LrEV+R73YQvvRZ/jR1VUYwhjyO5RGpJ7X3MkmXKHqvjAJn?=
 =?us-ascii?Q?EyO01LKOLAb/LMsn98Jw3otIXV/QaGNRFBGkxj09rM0URSAdtx5pwE22rjmK?=
 =?us-ascii?Q?R22qEKfL4U8al5sl8xYBNm577JXcG4Pc7UrSsLFoQszJ5nIp2j8Hf7dtEMWn?=
 =?us-ascii?Q?QXEuQnSL04dBzmZo/CUx18/cg1Oa/ftHRUgcd1+lO4n8pO/CFEfWvdYcjZ/p?=
 =?us-ascii?Q?Sm77bIvaZzGhLrNTqbBgwhD2/2ZksD7qDRYg3wbbIa/kTwp3B9G4MAAZiOML?=
 =?us-ascii?Q?qOP9EzQRKsY/t/c5/hg+xz0dBP5SU8uwcmD5cJT3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4669cda9-9108-4c6b-8cb4-08dda1ff7d54
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:24.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy71LwmKauG1j4YEitqR7Ru9ykWRKHaPGeOB05u9qsyaU39+0n75Tj2Mf2j7lsvc58FYaZz3iBMEZRm0lcdy8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

Some pick functions like the internal pick_next_task_fair() already take
rf but some others dont. We need this for scx's server pick function.
Prepare for this by having pick functions accept it.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 include/linux/sched.h    |  2 +-
 kernel/sched/core.c      | 16 ++++++++--------
 kernel/sched/deadline.c  |  8 ++++----
 kernel/sched/ext.c       |  2 +-
 kernel/sched/fair.c      | 13 ++++++++-----
 kernel/sched/idle.c      |  2 +-
 kernel/sched/rt.c        |  2 +-
 kernel/sched/sched.h     |  7 ++++---
 kernel/sched/stop_task.c |  2 +-
 9 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 45e5953b8f32..1000d2aa8482 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -630,7 +630,7 @@ struct sched_rt_entity {
 } __randomize_layout;
 
 typedef bool (*dl_server_has_tasks_f)(struct sched_dl_entity *);
-typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *);
+typedef struct task_struct *(*dl_server_pick_f)(struct sched_dl_entity *, void *);
 
 struct sched_dl_entity {
 	struct rb_node			rb_node;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 62b3416f5e43..19b393b0b096 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6045,7 +6045,7 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 		/* Assume the next prioritized class is idle_sched_class */
 		if (!p) {
-			p = pick_task_idle(rq);
+			p = pick_task_idle(rq, rf);
 			put_prev_set_next_task(rq, prev, p);
 		}
 
@@ -6057,11 +6057,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 
 	for_each_active_class(class) {
 		if (class->pick_next_task) {
-			p = class->pick_next_task(rq, prev);
+			p = class->pick_next_task(rq, prev, rf);
 			if (p)
 				return p;
 		} else {
-			p = class->pick_task(rq);
+			p = class->pick_task(rq, rf);
 			if (p) {
 				put_prev_set_next_task(rq, prev, p);
 				return p;
@@ -6091,7 +6091,7 @@ static inline bool cookie_match(struct task_struct *a, struct task_struct *b)
 	return a->core_cookie == b->core_cookie;
 }
 
-static inline struct task_struct *pick_task(struct rq *rq)
+static inline struct task_struct *pick_task(struct rq *rq, struct rq_flags *rf)
 {
 	const struct sched_class *class;
 	struct task_struct *p;
@@ -6099,7 +6099,7 @@ static inline struct task_struct *pick_task(struct rq *rq)
 	rq->dl_server = NULL;
 
 	for_each_active_class(class) {
-		p = class->pick_task(rq);
+		p = class->pick_task(rq, rf);
 		if (p)
 			return p;
 	}
@@ -6199,7 +6199,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	 * and there are no cookied tasks running on siblings.
 	 */
 	if (!need_sync) {
-		next = pick_task(rq);
+		next = pick_task(rq, rf);
 		if (!next->core_cookie) {
 			rq->core_pick = NULL;
 			rq->core_dl_server = NULL;
@@ -6230,7 +6230,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
 			update_rq_clock(rq_i);
 
-		rq_i->core_pick = p = pick_task(rq_i);
+		rq_i->core_pick = p = pick_task(rq_i, rf);
 		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (!max || prio_less(max, p, fi_before))
@@ -6252,7 +6252,7 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 			if (cookie)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
-				p = idle_sched_class.pick_task(rq_i);
+				p = idle_sched_class.pick_task(rq_i, rf);
 		}
 
 		rq_i->core_pick = p;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..fce08e232926 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2419,7 +2419,7 @@ static struct sched_dl_entity *pick_next_dl_entity(struct dl_rq *dl_rq)
  * __pick_next_task_dl - Helper to pick the next -deadline task to run.
  * @rq: The runqueue to pick the next task from.
  */
-static struct task_struct *__pick_task_dl(struct rq *rq)
+static struct task_struct *__pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_dl_entity *dl_se;
 	struct dl_rq *dl_rq = &rq->dl;
@@ -2433,7 +2433,7 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	WARN_ON_ONCE(!dl_se);
 
 	if (dl_server(dl_se)) {
-		p = dl_se->server_pick_task(dl_se);
+		p = dl_se->server_pick_task(dl_se, rf);
 		if (!p) {
 			if (dl_server_active(dl_se)) {
 				dl_se->dl_yielded = 1;
@@ -2449,9 +2449,9 @@ static struct task_struct *__pick_task_dl(struct rq *rq)
 	return p;
 }
 
-static struct task_struct *pick_task_dl(struct rq *rq)
+static struct task_struct *pick_task_dl(struct rq *rq, struct rq_flags *rf)
 {
-	return __pick_task_dl(rq);
+	return __pick_task_dl(rq, rf);
 }
 
 static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_struct *next)
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index f5133249fd4d..d765379cd94c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3281,7 +3281,7 @@ static struct task_struct *first_local_task(struct rq *rq)
 					struct task_struct, scx.dsq_list.node);
 }
 
-static struct task_struct *pick_task_scx(struct rq *rq)
+static struct task_struct *pick_task_scx(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *prev = rq->curr;
 	struct task_struct *p;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 125912c0e9dd..2b7958d2fb06 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8842,7 +8842,7 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
 	resched_curr_lazy(rq);
 }
 
-static struct task_struct *pick_task_fair(struct rq *rq)
+static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
@@ -8880,7 +8880,7 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	int new_tasks;
 
 again:
-	p = pick_task_fair(rq);
+	p = pick_task_fair(rq, rf);
 	if (!p)
 		goto idle;
 	se = &p->se;
@@ -8959,7 +8959,8 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 	return NULL;
 }
 
-static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev)
+static struct task_struct *__pick_next_task_fair(struct rq *rq, struct task_struct *prev,
+												 struct rq_flags *rf)
 {
 	return pick_next_task_fair(rq, prev, NULL);
 }
@@ -8969,9 +8970,11 @@ static bool fair_server_has_tasks(struct sched_dl_entity *dl_se)
 	return !!dl_se->rq->cfs.nr_queued;
 }
 
-static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
+static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se, void *flags)
 {
-	return pick_task_fair(dl_se->rq);
+	struct rq_flags *rf = flags;
+
+	return pick_task_fair(dl_se->rq, rf);
 }
 
 void fair_server_init(struct rq *rq)
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b455f..01e9612deefe 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -463,7 +463,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, bool fir
 	next->se.exec_start = rq_clock_task(rq);
 }
 
-struct task_struct *pick_task_idle(struct rq *rq)
+struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
 {
 	scx_update_idle(rq, true, false);
 	return rq->idle;
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index e40422c37033..6e62fe531067 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1744,7 +1744,7 @@ static struct task_struct *_pick_next_task_rt(struct rq *rq)
 	return rt_task_of(rt_se);
 }
 
-static struct task_struct *pick_task_rt(struct rq *rq)
+static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
 {
 	struct task_struct *p;
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6d..b4b9c98f0c6d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2401,7 +2401,7 @@ struct sched_class {
 	void (*wakeup_preempt)(struct rq *rq, struct task_struct *p, int flags);
 
 	int (*balance)(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-	struct task_struct *(*pick_task)(struct rq *rq);
+	struct task_struct *(*pick_task)(struct rq *rq, struct rq_flags *rf);
 	/*
 	 * Optional! When implemented pick_next_task() should be equivalent to:
 	 *
@@ -2411,7 +2411,8 @@ struct sched_class {
 	 *       set_next_task_first(next);
 	 *   }
 	 */
-	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev);
+	struct task_struct *(*pick_next_task)(struct rq *rq, struct task_struct *prev,
+										  struct rq_flags *rf);
 
 	void (*put_prev_task)(struct rq *rq, struct task_struct *p, struct task_struct *next);
 	void (*set_next_task)(struct rq *rq, struct task_struct *p, bool first);
@@ -2574,7 +2575,7 @@ static inline bool sched_fair_runnable(struct rq *rq)
 }
 
 extern struct task_struct *pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf);
-extern struct task_struct *pick_task_idle(struct rq *rq);
+extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
 
 #define SCA_CHECK		0x01
 #define SCA_MIGRATE_DISABLE	0x02
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 058dd42e3d9b..1c70123cb6a4 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -33,7 +33,7 @@ static void set_next_task_stop(struct rq *rq, struct task_struct *stop, bool fir
 	stop->se.exec_start = rq_clock_task(rq);
 }
 
-static struct task_struct *pick_task_stop(struct rq *rq)
+static struct task_struct *pick_task_stop(struct rq *rq, struct rq_flags *rf)
 {
 	if (!sched_stop_runnable(rq))
 		return NULL;
-- 
2.43.0

