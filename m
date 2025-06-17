Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B22EE994
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190788; cv=fail; b=aMVk66inM++y+nJngSE3yBW5oxVtwsO5RykPb9b10qHS0uRt8aTOJYrbw4ZtXRS3engCgUJpTRJ9uo+tXrHx1gKE8uDX84ZAoPsdL5PeHfU3iUWsaWhEs+60sxHjnTuh3VthIp308p6X0ohGl/rBZlUFMqT2HZFr7cdHBBytviQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190788; c=relaxed/simple;
	bh=muf5gsjlnMl6TbJuhGR2qVhzkv3L9Yx64hZPKNlgosE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCmsAgH2MpXGNcisaVJgwxnLhUum05xmnR2191Y4Br3ZNXiF/hE/is3ZzyxAJGgpeexNFGJuiduHuJ7yUM2ltZZxwcHerynfTIEVDxtzzk/RACiU+uV4y+F/BRE+/M8m08ZX6UDdsC31grVr22VsurkXSLlU/pQEGi4Tza6JB3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jar+IBya; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jar+IBya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqHJFpm2pabsYkFH95SKfWIuOO0I8UGTMR7yuDVngAe0QTZaR/Aw3xEVUKgiI6x+upeR13cIxDyGoOybp9rHsM+GlAtrnRakWuech3WViSRAaWpZI+P7SQsWTEDVDdPDp8/erj+Ob5h5qFxZBFMzrlWt54SATwcpXT0fHtDd2A+eCbKJdIyBBHltiRmJvUdpES6G/AuKbUwITJFsiOFha6BGAggkUZRodaTOaYqJhpQ4XLA9S5ndc8kkiVAERoGNrR9ocMT2z2GeMUK5EjaiwMMwcKJO8a1QaC1sOwJkaP9yuVFKav1Goi+z6kTyxDML6SVfOAKadnz/cgsn9iQKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDAE20tactVY1Oq8O+mFIzCPhb+kM3bJo1Gu29PvdNs=;
 b=bpDWes8lUqxyPxAcELVcuARz4WzQnmfanDGLbHW/jKBjfca2u9wxDwmTqq+fGeDdGq58y465b4clwEQzbWTUtO+RVDISZiUsjVxfwY3uKCyrFiSwz+aEfV+f1jR5PZWNhjYB2FIg4rd9hN9y+2aVZYdE97g+tKb/JP0gS4BoeJ4VhzIb9TVowQ4Kan+hBNf0ZHS30EhRJg5e2Cm+4q71k3qjv/0zm3nlVfOZvK6UkK4vImMnPApwNmfRyjnRCax73U45goUwlrd/mhM974r2f+moob8fwQmK7MKKoTZAl5vRe5mNxl0dcpcMvzqUU0EQXGexsC+H39g0AGiWFcX8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDAE20tactVY1Oq8O+mFIzCPhb+kM3bJo1Gu29PvdNs=;
 b=jar+IByavXBsa32CvI/CuSr0ahu1+sOPUxVhX41fYwpkgnMnpZC5dCdEhXnuwJlr3QLg/BSu8R2DWqJF0sGRaXLxoG5a9q989OG+oKVWofMCeeTaZKDRm0lIcvjuWgIy5yxM2Lyr6tBKeJGdmyaKvtlSr8HfgrbwE7l+AkBxM2jz4BV15NIei8KByHGqQucWZLYktePjZREsfHS7n/BzR7cqz1wLU+glywnaJnA+9ptmv+caX9HKNEUAwshlRPtrl80v6RUod5gSTqKNz83ayX6IG0O9kOMug6NPrqZs+IHMhh7TiWsm/30jAPG1P0TtJ/RwCqliEzQWexQ1PMsNMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:20 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:20 +0000
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
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Luigi De Matteis <ldematteis123@gmail.com>
Subject: [PATCH v4 08/15] sched/ext: Add a DL server for sched_ext tasks
Date: Tue, 17 Jun 2025 16:05:11 -0400
Message-ID: <20250617200523.1261231-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0890.namprd03.prod.outlook.com
 (2603:10b6:408:13c::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 568a276b-f190-4715-5561-08ddadda6d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oK4dBTe0K8ARr1muSxJgm80TPjAXyR3069gBC+5YgSy5XRbgcN6T3EZC8Y3+?=
 =?us-ascii?Q?ZJuD4G2S0WyNKvrJPEwvLZXSHcI5FSk7rmAJK00N7Z5ewZQla7otUqLcSTYl?=
 =?us-ascii?Q?9hvwt6A63Ky2MeIZYuwmuZ6ADwQ8kObEDw88IoR/LB2V6u8a7YurD6qsfE5V?=
 =?us-ascii?Q?JJONDc9DcgIm/ISWggpx7i+Gd9BwWKDh9mhZ6f2FbP1PmRwMtUhqGzohQLAM?=
 =?us-ascii?Q?+TUeHbv7LGydq4qXFejdmSGo+ri+mdccvPtrVSUPMJePiloU9sGBfh//E1qa?=
 =?us-ascii?Q?pQzmRdNuEOQA9qNLJsstDMGx20rhlzL21hjVZg434j8Ng+Y+Z4/B+Tih2JFJ?=
 =?us-ascii?Q?xJ1vZS5BATD9CkQtKb60oDxFrM3jPxHSW1miaKcRQB5w1UyektOtBDuA2LID?=
 =?us-ascii?Q?MBUHoEnSOwOEX4ar8zUmQQ9EDBqutVC6ncXzZGNYVR/jk2+dZoH5ICR3agjz?=
 =?us-ascii?Q?xAJMRCsinTK3fn9XKXcJvFkrAnGqovmpy3s8402ocTPYozaHkqhCD3v2TPxE?=
 =?us-ascii?Q?SFxm52hMDneRAR2HS0fwSZB5HspcVBjdz/jfm6OUJRe36pLfTh7R/hZgiXVK?=
 =?us-ascii?Q?K6fO/4AWm26S7m5u+GlUJYE1aGKnZPyTlkflyi2nQ3nM9AykP382t9ZhaoPl?=
 =?us-ascii?Q?3kYUJ1RitYoCuJGJEIHXA0vUyty3ExqQuAymJxF3A2BVNo9ZXSSTXAn2Qf0h?=
 =?us-ascii?Q?qVdvdZuJd3z+z8Vz6m1LRXpxyTs0mCl7nTe+cWKQLu6dx4PFgYM0pb0uaq8g?=
 =?us-ascii?Q?1eLzcmf8UmAG90UXO+Px6IbuPaPyUbTDB2spG3Ppwx1Wyjtby7/JNjEO/VhX?=
 =?us-ascii?Q?iAkG43+FnA9r0IkYEdszv5oqc1445IP7MQmL/P2ySERGoGqR39O9ivbHqTtT?=
 =?us-ascii?Q?WzyqMyD4ibSX7RY4791F6l0l91Uuh7NQ22fQbFxVb1EjtZj4ZG270xQJiL7/?=
 =?us-ascii?Q?BKf6NytqIHn3w432alQP4XPV6tvBcge2u3hRT9YrzWszq33MAiVvD6Hqq/Tz?=
 =?us-ascii?Q?4mXnMxOE9ah7vIsiXrl2DALGoRYiVyTs5NnC1S340DqM4/ZHK/LDqY0UQcXt?=
 =?us-ascii?Q?YIentocBuBUrVdTUsNiVecA4hSEPOjV8grMudUGTX6PVzNO3DYT+/uCdCnno?=
 =?us-ascii?Q?FbgObCeHg/c7QrBxp8B1H0sVmrLHsy2QO0CBL9fnFfasm3sz1CwpnND67Viw?=
 =?us-ascii?Q?Dyjp86KtW4IxWSPkdlsyDTSGYI0tBV/0oz6UnDzqcMDx5Xyih0/h6wM6haKa?=
 =?us-ascii?Q?nkfknvzOzAQqJ8WiqItcjTspVkgzD/3aiYTr16lfWjIxHzlEByii149ocp2f?=
 =?us-ascii?Q?TGF6msr6KvwLS9dnHUw/wOJ4irFj1mm8l9Q95MHDDlim4yctQWNFqyHMb5bf?=
 =?us-ascii?Q?eRPoPrhGexN7BLnN6q+h2yqVZ5mNgKiQinbB3pga5qWvD7ncmPUNq+iBP/Ik?=
 =?us-ascii?Q?ZmcANr6RjaBvzNnzvb+S1aAmuHNlF66GzUo+ArORRmMKUc4ur2IK7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BUv9XUaQK/uA1aVg9paUEBLqBXGb2E+FLGtdnHhYCj0/eaXKYiwujIH6lIw5?=
 =?us-ascii?Q?n0vcWPiviDe5bXIac/fwz4SNNTxG08a1u7RitKDDrmyejW4T5Z9R9crmIaQK?=
 =?us-ascii?Q?E2MriJFFaJ9tBS++O3y6jobjnCCl9Sq46PrMe/0tJlx34z2VZMXrjJ+Zkwau?=
 =?us-ascii?Q?KMyuKj3kKmlfQHuuNJoCZ9oTrKMV1YQkDBbE8rVQwNuJvwhSecXICDMVvi6X?=
 =?us-ascii?Q?1spgEnOY3e6aDBrWXNQegg2uViBRPbPs3qcCKz5cvTspZ6KLalPLhK5BqqF1?=
 =?us-ascii?Q?Zr4x61OuZA4/9AXY5wzA5W9TFiCyWesEyaVJa5WTqgFxrmOjvJZJpFlpSRo6?=
 =?us-ascii?Q?IMManHYFKAoYEPobj6kphLXZWuF14+M1KzVhsOOjzSou4+xk3lV5J3ngHSUm?=
 =?us-ascii?Q?bJ2NmTet5eeeA9SKaKS/E1T1Ro3nKt/cV7fG8YsuXP4JV07E3ITPSoyXiNnU?=
 =?us-ascii?Q?s+AhIrejAWa72tHuL2CH94D0H5c2+qtfmQ2aDj4CRHfwvm9oJmumjZBNA5ed?=
 =?us-ascii?Q?XKfa2ucy2r/Mc/0MHctSLVqpG5j9jDCE43x7TKatR4sHbHw2Y2TxzU4Bbqht?=
 =?us-ascii?Q?xF8eEH7pPjrVFOkxVULY2dEvXnnoEZ1NMUrJo+MHiCD6lfhsEaX128XFeijm?=
 =?us-ascii?Q?WBEG7UBvAJhGTwdVq95LaFwmQlxYUFaVzY0Mv0P1u2/LKwHkoUKmewPuym4V?=
 =?us-ascii?Q?qXa/vKLiU8Rds8mnEN1B8smYHySUTgsMUMqmH4sWw5B/FAH3b2XlFVxGK4rE?=
 =?us-ascii?Q?dP0muC4MjVq0BNZxI8IVmvX3ICTreBdCye+1KTnoz4eF/uWU9akBxfsmlCLx?=
 =?us-ascii?Q?arVhmN+EOhyIzl8ku7LnvrMabCXEVxgLKK6ZOEk2XoeMfLvePmBKsENLxZdf?=
 =?us-ascii?Q?EFGrrDysBmtciLSHt+vponFCotW5q5+1wIO/o8ly/jvMq56HijLq+5HlOuzi?=
 =?us-ascii?Q?BhNiKzkyeAnW3qiSrnbKGnm4oa5vSsrw247zr5gSf9Di+u0l0r2ZIVWIlatU?=
 =?us-ascii?Q?CqJ4NEPN2NhaMbGRmfyNjETgJzMYm+eOf5h2EI6+ZzXwrB+C/+1fIju4JWBY?=
 =?us-ascii?Q?7A092OXsYii5NzfJdFReaoQs22g8mblTXNJ9y8ZBJ8dPFIwi33Xq7ScMCT4W?=
 =?us-ascii?Q?Hgwe9Appgom3PzS+LwfqImhbtmFdB0fSVFvm4rN7uf8q4zLCgxAlr5LHOaCE?=
 =?us-ascii?Q?ctArK+AZ08HnUA8FopOggl1gN2ePKayDLEfRG+PXO16ZmxYnMhwMibMihsIs?=
 =?us-ascii?Q?dm9W4PsCdjCX+rpXGz43Kazsoe2pNs06zo54E6az9k/FYR3zBlA9T+l5edY+?=
 =?us-ascii?Q?Jar+w0PbfA1+YNnLn3jtpkIarVzqnkRANk88ezaOAYTDwgTIi+8uVZ7VNFju?=
 =?us-ascii?Q?I6N9e0FMFEjhPxQH/0V+7Q1skBPlyGQAZ33XPmwTqRfk1PMOgZg/oPIEuH26?=
 =?us-ascii?Q?xhuHQUc+HR7IjvtI/o7VcAf3QYZ7iumw4IyqG7tf9fmmks1zfXUbh3K+1FXt?=
 =?us-ascii?Q?ndOnmw1MHY5HWEtkYVQQegJDfzMdt1uskFOhNq5jc+ZiRJpnephuWV49DWa6?=
 =?us-ascii?Q?BU5CnvHnCWFPsFuGWdqWIAtLA8i3/WRAurgwHGPh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568a276b-f190-4715-5561-08ddadda6d4b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:20.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6lv/WYMfXu1LedHP0BWo6OkUHAq58LAHe2G1a2ZpJ2g55+7MFjP+ALjBGklp4K6YmbIVY7/dA2l+2ugGkv0UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

sched_ext currently suffers starvation due to RT. The same workload when
converted to EXT can get zero runtime if RT is 100% running, causing EXT
processes to stall. Fix it by adding a DL server for EXT.

A kselftest is also provided later to verify:

./runner -t rt_stall
===== START =====
TEST: rt_stall
DESCRIPTION: Verify that RT tasks cannot stall SCHED_EXT tasks
OUTPUT:
TAP version 13
1..1
ok 1 PASS: CFS task got more than 4.00% of runtime

Cc: Luigi De Matteis <ldematteis123@gmail.com>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/core.c     |  3 ++
 kernel/sched/deadline.c |  2 +-
 kernel/sched/ext.c      | 62 +++++++++++++++++++++++++++++++++++++++--
 kernel/sched/sched.h    |  2 ++
 4 files changed, 66 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2b6f85c1fc32..5589aa59adb0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8650,6 +8650,9 @@ void __init sched_init(void)
 		hrtick_rq_init(rq);
 		atomic_set(&rq->nr_iowait, 0);
 		fair_server_init(rq);
+#ifdef CONFIG_SCHED_CLASS_EXT
+		ext_server_init(rq);
+#endif
 
 #ifdef CONFIG_SCHED_CORE
 		rq->core = rq;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 562e1e7196b1..c61752c2e052 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1570,7 +1570,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 	 * The fair server (sole dl_server) does not account for real-time
 	 * workload because it is running fair work.
 	 */
-	if (dl_se == &rq->fair_server)
+	if (dl_se == &rq->fair_server || dl_se == &rq->ext_server)
 		return;
 
 #ifdef CONFIG_RT_GROUP_SCHED
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 8c9adaa2c977..a31fa12fac48 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1909,6 +1909,9 @@ static void update_curr_scx(struct rq *rq)
 		if (!curr->scx.slice)
 			touch_core_sched(rq, curr);
 	}
+
+	if (dl_server_active(&rq->ext_server))
+		dl_server_update(&rq->ext_server, delta_exec);
 }
 
 static bool scx_dsq_priq_less(struct rb_node *node_a,
@@ -2396,6 +2399,15 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
 
+	if (rq->scx.nr_running == 1) {
+		/* Account for idle runtime */
+		if (!rq->nr_running)
+			dl_server_update_idle_time(rq, rq->curr, &rq->ext_server);
+
+		/* Start dl_server if this is the first task being enqueued */
+		dl_server_start(&rq->ext_server);
+	}
+
 	do_enqueue_task(rq, p, enq_flags, sticky_cpu);
 out:
 	rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
@@ -2495,6 +2507,11 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 	sub_nr_running(rq, 1);
 
 	dispatch_dequeue(rq, p);
+
+	/* Stop the server if this was the last task */
+	if (rq->scx.nr_running == 0)
+		dl_server_stop(&rq->ext_server);
+
 	return true;
 }
 
@@ -4050,6 +4067,15 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
 {
 	scx_disable_task(p);
+
+	/*
+	 * After class switch, if the DL server is still active, restart it so
+	 * that DL timers will be queued, in case SCX switched to higher class.
+	 */
+	if (dl_server_active(&rq->ext_server)) {
+		dl_server_stop(&rq->ext_server);
+		dl_server_start(&rq->ext_server);
+	}
 }
 
 static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wake_flags) {}
@@ -7305,8 +7331,8 @@ __bpf_kfunc u32 scx_bpf_cpuperf_cur(s32 cpu)
  * relative scale between 0 and %SCX_CPUPERF_ONE. This determines how the
  * schedutil cpufreq governor chooses the target frequency.
  *
- * The actual performance level chosen, CPU grouping, and the overhead and
- * latency of the operations are dependent on the hardware and cpufreq driver in
+ * The actual performance level chosen, CPU grouping, and the overhead and latency
+ * of the operations are dependent on the hardware and cpufreq driver in
  * use. Consult hardware and cpufreq documentation for more information. The
  * current performance level can be monitored using scx_bpf_cpuperf_cur().
  */
@@ -7598,6 +7624,38 @@ BTF_ID_FLAGS(func, scx_bpf_now)
 BTF_ID_FLAGS(func, scx_bpf_events, KF_TRUSTED_ARGS)
 BTF_KFUNCS_END(scx_kfunc_ids_any)
 
+/*
+ * Check if ext scheduler has tasks ready to run.
+ */
+static bool ext_server_has_tasks(struct sched_dl_entity *dl_se)
+{
+	return !!dl_se->rq->scx.nr_running;
+}
+
+/*
+ * Select the next task to run from the ext scheduling class.
+ */
+static struct task_struct *ext_server_pick_task(struct sched_dl_entity *dl_se,
+						void *flags)
+{
+	struct rq_flags *rf = flags;
+
+	balance_scx(dl_se->rq, dl_se->rq->curr, rf);
+	return pick_task_scx(dl_se->rq, rf);
+}
+
+/*
+ * Initialize the ext server deadline entity.
+ */
+void ext_server_init(struct rq *rq)
+{
+	struct sched_dl_entity *dl_se = &rq->ext_server;
+
+	init_dl_entity(dl_se);
+
+	dl_server_init(dl_se, rq, ext_server_has_tasks, ext_server_pick_task);
+}
+
 static const struct btf_kfunc_id_set scx_kfunc_set_any = {
 	.owner			= THIS_MODULE,
 	.set			= &scx_kfunc_ids_any,
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1ac2fb398982..576b69cee6b1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -389,6 +389,7 @@ extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p,
 		    struct sched_dl_entity *rq_dl_server);
 extern void fair_server_init(struct rq *rq);
+extern void ext_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
@@ -1137,6 +1138,7 @@ struct rq {
 #endif
 
 	struct sched_dl_entity	fair_server;
+	struct sched_dl_entity	ext_server;
 
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	/* list of leaf cfs_rq on this CPU: */
-- 
2.43.0

