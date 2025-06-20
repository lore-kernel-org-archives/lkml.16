Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812962EE26D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451586; cv=fail; b=W9wpkRARGAJ92JuTrJuLJKDaPX8jhQ/v2AkQITkYtWnsaso7BrUJup4/Qyf5qrYPdaLQ1Let39VaaxETllsuzO2W3Hc4K/Rb3YqCRaKq4fARvgXXWgfgV5xDOC9U/zrrRgaUVWwx6LpQ2YBvDhhyShnPn/Eb5FkW9zY2GZ/keOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451586; c=relaxed/simple;
	bh=+k2Pnt+O7aOj3jS8Or4DNkzQ1DJgXI+BBsjYu2Gun+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XUd2X/rWNLY53fZG+xMs0VO6jKUApx98Kj0yBYtibuvrr5Xn/OaL4RE7Ez2JnwC+Z1c0L3PuBviBegOUgqfXxhP4GaXkZGVMWZuikQTdL7Q7MSosLiOGUYx+OOegUNaD8lIN0Xn6oDcKFDuG0TfvfnIs8ma+p13z/1dq1IhuK/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uoSovZJG; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uoSovZJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfJfpGCPEKZ4ea37+QAy7wKITmYzA5Qd5vTUCOmUCxwdVyi7QfGXdBSyBR2ZvsP0n8nXuuGUo8YQh3DRzVnxMGrS+mOjKQsMy+h6xi3x+ROaRINJYW3xUQ6f9lAlSYbEMGeDT8QN5Nmc/yv/qZafY4WO3OsuSb9id4EHr/wNuRUbkSsMuem+QBMQI6nQ//HkdfXkKoOPIWLSrcSad6MRbbUAqZAlG+fjUFoSegs9jUdi1TFw6GCxLiaJgr1aqjSWN+7wwc1dDRFW2/C0UMW//JsQBhZzxCQ9CZR17L0OLqT8bGS0HL1e10mFpeZ3DmF3zmLqb5lNCWVUhtD3t76ERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WLOZPoZKubTDOTu/uZ4nu9smSkUh91N4GeYPh1xles=;
 b=oWoh/PVW7c3Qam69VYYOkineR3h3R6hQJjRMtiXbKS1AOpiudBsZjFUyIrB/35dg+HJzK/9vo0wQdg0LaAqUKP2Sg0stJDL73wPneTlesU6i8CFxqeIxYuwih4nlVItwXgusmxSmr4LOPyqaa/Gg/29iNsxWEKWkfVsFHL+SU6MMhYzGQ82elv9FYKr/8ue0Pr6L2Lfufac+SaB+3CGMpQR0m0UKUz1fXj26Eldw+85PKzjzJnikG5cgXEQGG5Zb6e1mcDlr3o5asqw4jOknitoVCVF0ioR05MYEqG0OR3aVGWl8t3XyafWCA9khJxFUvxs46CNXsGVkaf3kZ/QQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WLOZPoZKubTDOTu/uZ4nu9smSkUh91N4GeYPh1xles=;
 b=uoSovZJG4RXmqw7b3EX35weu16G263HPGNyvvcp6AOhRtKmPTurdCl1BHxxhJs4esWeXb95bQPqHho+1CDay4xhSsGUkjiY7OQjqcKW72vv4sHYpcv4IDbIlvJ0i+Y8T/W2dzm1qdcMIolqC5wmPwtp5eyOpHbjwecM6jQ5VYm8fvh50ZB2oErmIHmC1rXP8ZNhf7F0Wzbjm/Jocz2mI6PrgvdWB+28Oz5yTOzLYc/JPKQVZ+mB0Ko29qhg/3I7dx4mFAIIteA8nBI2bGD0G06OCsxMEAR8/6WAZciWg9qWWe0Kmh9xlF4fhHtM5+bAV+Cx8BWBUTfIZGJwnTj21yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:33:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:33:00 +0000
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
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v5 09/14] sched/debug: Add support to change sched_ext server params
Date: Fri, 20 Jun 2025 16:32:24 -0400
Message-ID: <20250620203234.3349930-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:408:ee::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: bb47d923-6074-4d0b-635c-08ddb039a5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ix8w/otmzq7gkbo4Wi4INl1RNyRgm8Dlh2FUZsNxTYsXay8mBtoLdEOmYkwZ?=
 =?us-ascii?Q?QnJTvoQt7nMDAZEoRMahz6I2VRkZ44GMB7m0DSE9xaC8oQ/pTD/gKt2e0efy?=
 =?us-ascii?Q?4KOHlOsUex3LK2XJRcQKqfLF5rF4Yx6wt8DHlX980lejMNvdOdq9ezHEr1Xc?=
 =?us-ascii?Q?s4lAWJD9jFVxe4BxakfZQ3/GyV+bQME2xvMLZOyUgCVqiBnGb8OdRyZ2Igoy?=
 =?us-ascii?Q?DiDO6rmzOd2vU82DHCKKnwlwSUdzC8U9XOWIH6/lEdF1D5woL3w5SJGVIYCb?=
 =?us-ascii?Q?hUFBl6gLuMWqjkGq6Yy8CU83QVE9xPxowya+u1NvTeN3P1hIWzJpmxqeMSEx?=
 =?us-ascii?Q?TGW/ZjVtC2uoyTxgNN/oQqH7ZwbzsqSS5Qidov+pRWXJRqTug08/Kxi1Xxx5?=
 =?us-ascii?Q?tkB6LMr2jq49iHcBzH1P8mJM0nxyK/Gf264qtaAdwB3tFdRrmU2QyIf/TYWB?=
 =?us-ascii?Q?oexjOmAnbqTyp8FtVUF2V5kOsIpo4SRAxek7EdSfP8iJkg2f9s6kDvFAWoAa?=
 =?us-ascii?Q?MmcWrwkXTmX9IBooEuqSVwrm8PBh/Kqr8gXddhsOM62k9oycUBci9AAkppeF?=
 =?us-ascii?Q?8NYvs+Xn5kvsaEykNb3LOK0sDN21M2cC9MBT8vTd0NWPhWarizMOHfKU9kBP?=
 =?us-ascii?Q?UqhK1yxdwTC8fk9fgY9eXaONAJWIx+qanMkNdbNWc+Awm/5yrNQ6aToqtBgE?=
 =?us-ascii?Q?8sYjOUO3gu/QXXGrWY1ihp4+1nTcuC9fIGNAWa04boWDj0eX0oFolbMFlkBO?=
 =?us-ascii?Q?OOP1SFYKodRbl22CFpcUDcZUe+kEFY3ketWkmPsO/i6PlTVhAvPM/t0lZEcx?=
 =?us-ascii?Q?NCN2fLf+Z4LaeRqFf2OJ+8WfsB+r6k47pPvgUUr6HhymxlemmDjKtJgb75VW?=
 =?us-ascii?Q?SZekquiKGbR245/i/UfwbM+KsmLUbWfIyQ0mWoqZoIiT9VWMdsxo19xJMvP6?=
 =?us-ascii?Q?zsrIdZXiLDhQ8P2Waqq6J0UJXlCijGd0K7yDCzxHx7Fv+jfz4QvzxHkdQ/qp?=
 =?us-ascii?Q?0OUyt3jvmQsHRrEPSeZS6gKNomPNVrMLem/tIzXXDHZdoRWzdzQKAZ3sYute?=
 =?us-ascii?Q?lAXKHePuCj3zmvH73Q5ICszrbUm1+lqPngOkH0tknFn0vtZyU0R7qls/cfMh?=
 =?us-ascii?Q?PZFIvufLUqoTcleYYMmHReil79r5Wl0EIpDJYQVz/d4FBgEQ1brnQeQd+N/f?=
 =?us-ascii?Q?8J9RFEQdhYECJLXnrv3IcuhnYVWeDddBR7TffwV9CqirtWnXJTL0Xf+GZSY7?=
 =?us-ascii?Q?xYDJnpYWyQa1L4OT+NuYStSurhhWwU9zt2QUIAzLvMmli3Ee44LvwjMpQ47k?=
 =?us-ascii?Q?mBO/j5JhmVarFLXBZIMF3Murrc43APsyfO/XcGPioaKCBY4X6I+eQqCrADLh?=
 =?us-ascii?Q?29QC5p7APqynoq5tAri3fxPkYsnkdqIh9DPZwtrUVmteqSD4VpgbGKuIcuQn?=
 =?us-ascii?Q?oitJvblqB0HBVsGK8/S58o4ASlG4aC8AgEJWPSvCQfLXGgsUR2FMxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?62DYRz+qNn5uRzmRITryY4n9YD8fAFyQfw+lw0zbxMXcDr8GF9D/Xt8A7Vcu?=
 =?us-ascii?Q?J/ewX3AFO/KsB9h5qTXKvrp4wa0NnIiepJEkKJWqjsWPiBXX3oDLFaQ+jrHh?=
 =?us-ascii?Q?iGt/sIhvwOa/DByR2ZZ3U/qWJMcz1y5si84NEukWGc+U1PJJRkrQHAeO1jLB?=
 =?us-ascii?Q?3biyej4XI7ei4YTcAyT2CmRPhLvoVbO7ek1OzKE8tMz24WmqzEnGmUdJV0kP?=
 =?us-ascii?Q?yf2JJ6aR2gBHYsL/+bpSpACs3ugHwUGu7EgkTWqaufRePkgWgVCwDLXpPYZk?=
 =?us-ascii?Q?lm3zfu+5gAhZ+yCpvYealQ1ZTgXCNKrJnbfZ84NGUrcQo/S8bfkXOx+kvz5r?=
 =?us-ascii?Q?0bjn53xhpHd5BM4WT0RJORkEIjB9GAlsfbMmP5xghOO2oed+GhzGt8wa5g45?=
 =?us-ascii?Q?2CXjtjSJzx0k02DfJrEnysSFse160Dwhqo8hBdMT5UiGYGD87UqzM5mPE1ho?=
 =?us-ascii?Q?ml5jsNcY6H9c/eQMIGo6WJmugWYvMvSHlFCYHuIrSER/uj0LCI8SOsetih+T?=
 =?us-ascii?Q?amM197iVnQsmATkaxOmLqnxhADh/wTOO03cf+EXzUspUBoj1RrV6JpoTsPjp?=
 =?us-ascii?Q?Lx+Yzs0wZ8NccFyf4owq2uUD7KfkinYs7QDa9tllVQPWLoY174nLChoUetjI?=
 =?us-ascii?Q?oj1DJtG8VEK3DdvWeLvbjt+EojTg/i9TGMPVIlRNEfggGrJhvFYhM07KvOq/?=
 =?us-ascii?Q?zs/vVD37Oh7Q/qZ97ydtaM8MrFld7t941BjFKicfxtXkUrLfzMHsnujL/DfG?=
 =?us-ascii?Q?LGB3FhaNbNLSUHIYvdnPoFz+YMHz15ZepJaoRQdxV1fPdwa2pQZqQyMF5sUh?=
 =?us-ascii?Q?fgeNdCWmPesngbpnn3jaZsHhR2sYWjoRzthPUny/OU2ak5bHFQTD9ojOsTDZ?=
 =?us-ascii?Q?aUKtz1bwZr+gKAgahWvHSqMIQWvsGy+3oqlXwSpC+c7btAcqe0cgXwzFS0U6?=
 =?us-ascii?Q?SKYG+C70LrzFSxhbrdUcChHwyYVr5zFYDawr6fznxCgQ3nVKbplnOTnIoRCP?=
 =?us-ascii?Q?jNMupBdXO2cQ8QiZSDLslgQYxrD4b8LyHZZAmJ+LmFwxVSaF4E9rT5tVvzn7?=
 =?us-ascii?Q?4UmO/Jt2sFSmgte9J398TdU7BgtHRX6T3Ahr3dfEk+0pTwQ4fLXKZD+uHfse?=
 =?us-ascii?Q?r/Ie3ha6kvHTQ3i6dHQIWtR90pCZXUodB2ORN302GIhQzWCjWmHgKDLwmbvw?=
 =?us-ascii?Q?h+1K/VQOg0JWZW+MZJGVUisMaZN55doWYEVqOaKmtr/Y+VK6ga/mXDHzQjwi?=
 =?us-ascii?Q?m1VYR5MKpB6oUJSdMQYbHSO/CrXamSqGaitvN52liRLQfwOeulNXBX00Xy0t?=
 =?us-ascii?Q?Ge45KnYQh2JFDaANoMU31hVFl/7DAYrEnBDHPx3KVPfp+dn/FQgr5+wAYoyj?=
 =?us-ascii?Q?DxZB964S4ZGfRY7Cd1OkIgfSjGdThWxZglhsAu8SMt3fclDAt6spBo/1bjax?=
 =?us-ascii?Q?A1vdHd4URY6pVoUwQSRDA3QPRkVPG8u7mxEuLRk8iT83+Wt6p6MVe/cMNk9r?=
 =?us-ascii?Q?x4EDpkEh1xuCuAYT3duQjEeK25n+MW1hfcfoR8YtPDqODCeQbGxfEm2Tbexf?=
 =?us-ascii?Q?Rm+J6iGupluSE8V+2EqQFstEDWSHAO7nXq1jJXPg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb47d923-6074-4d0b-635c-08ddb039a5f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:33:00.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jka+suTVyPzumhoincVpgdh9Kj9Cuw3BCQXgx3aIDI/m3xR1f5lDth49sW9Igdm8dnGrOluRZwfcGZ6YgvQ+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

When a sched_ext server is loaded, tasks in CFS are converted to run in
sched_ext class. Add support to modify the ext server parameters similar
to how the fair server parameters are modified.

Re-use common code between ext and fair servers as needed.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 160 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 135 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 276d51a5690a..fd578a5eb4a9 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -341,14 +341,16 @@ enum dl_param {
 	DL_PERIOD,
 };
 
-static unsigned long fair_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
-static unsigned long fair_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
+static unsigned long dl_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
+static unsigned long dl_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
 
-static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubuf,
-				       size_t cnt, loff_t *ppos, enum dl_param param)
+static ssize_t sched_server_write_common(struct file *filp, const char __user *ubuf,
+					 size_t cnt, loff_t *ppos, enum dl_param param,
+					 void *server)
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	bool was_active = false;
 	u64 runtime, period;
 	int retval = 0;
@@ -360,8 +362,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		return err;
 
 	scoped_guard (rq_lock_irqsave, rq) {
-		runtime  = rq->fair_server.dl_runtime;
-		period = rq->fair_server.dl_period;
+		runtime  = dl_se->dl_runtime;
+		period = dl_se->dl_period;
 
 		switch (param) {
 		case DL_RUNTIME:
@@ -377,25 +379,30 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		if (runtime > period ||
-		    period > fair_server_period_max ||
-		    period < fair_server_period_min) {
+		    period > dl_server_period_max ||
+		    period < dl_server_period_min) {
 			return  -EINVAL;
 		}
 
-		if (dl_server_active(&rq->fair_server)) {
+		if (dl_server_active(dl_se)) {
 			was_active = true;
 			update_rq_clock(rq);
-			dl_server_stop(&rq->fair_server);
+			dl_server_stop(dl_se);
 		}
 
-		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
+		retval = dl_server_apply_params(dl_se, runtime, period, 0);
 
-		if (!runtime)
-			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
-					cpu_of(rq));
+		if (!runtime) {
+			if (server == &rq->fair_server)
+				printk_deferred("Fair server disabled on CPU %d, system may crash due to starvation.\n",
+						cpu_of(rq));
+			else
+				printk_deferred("Ext server disabled on CPU %d, system may crash due to starvation.\n",
+						cpu_of(rq));
+		}
 
 		if (was_active)
-			dl_server_start(&rq->fair_server);
+			dl_server_start(dl_se);
 
 		if (retval < 0)
 			return retval;
@@ -405,36 +412,46 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	return cnt;
 }
 
-static size_t sched_fair_server_show(struct seq_file *m, void *v, enum dl_param param)
+
+
+static size_t sched_server_show_common(struct seq_file *m, void *v, enum dl_param param,
+				       void *server)
 {
-	unsigned long cpu = (unsigned long) m->private;
-	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	u64 value;
 
 	switch (param) {
 	case DL_RUNTIME:
-		value = rq->fair_server.dl_runtime;
+		value = dl_se->dl_runtime;
 		break;
 	case DL_PERIOD:
-		value = rq->fair_server.dl_period;
+		value = dl_se->dl_period;
 		break;
 	}
 
 	seq_printf(m, "%llu\n", value);
 	return 0;
-
 }
 
+
+
 static ssize_t
 sched_fair_server_runtime_write(struct file *filp, const char __user *ubuf,
 				size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_RUNTIME);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_runtime_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_RUNTIME);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->fair_server);
 }
 
 static int sched_fair_server_runtime_open(struct inode *inode, struct file *filp)
@@ -450,16 +467,55 @@ static const struct file_operations fair_server_runtime_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_runtime_write(struct file *filp, const char __user *ubuf,
+			       size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_runtime_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->ext_server);
+}
+
+static int sched_ext_server_runtime_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_runtime_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_runtime_fops = {
+	.open		= sched_ext_server_runtime_open,
+	.write		= sched_ext_server_runtime_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static ssize_t
 sched_fair_server_period_write(struct file *filp, const char __user *ubuf,
 			       size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_PERIOD);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_period_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_PERIOD);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->fair_server);
 }
 
 static int sched_fair_server_period_open(struct inode *inode, struct file *filp)
@@ -475,6 +531,38 @@ static const struct file_operations fair_server_period_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_period_write(struct file *filp, const char __user *ubuf,
+			      size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_period_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->ext_server);
+}
+
+static int sched_ext_server_period_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_period_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_period_fops = {
+	.open		= sched_ext_server_period_open,
+	.write		= sched_ext_server_period_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static struct dentry *debugfs_sched;
 
 static void debugfs_fair_server_init(void)
@@ -498,6 +586,27 @@ static void debugfs_fair_server_init(void)
 	}
 }
 
+static void debugfs_ext_server_init(void)
+{
+	struct dentry *d_ext;
+	unsigned long cpu;
+
+	d_ext = debugfs_create_dir("ext_server", debugfs_sched);
+	if (!d_ext)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *d_cpu;
+		char buf[32];
+
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
+		d_cpu = debugfs_create_dir(buf, d_ext);
+
+		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &ext_server_runtime_fops);
+		debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &ext_server_period_fops);
+	}
+}
+
 static __init int sched_init_debug(void)
 {
 	struct dentry __maybe_unused *numa;
@@ -538,6 +647,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
 	debugfs_fair_server_init();
+	debugfs_ext_server_init();
 
 	return 0;
 }
-- 
2.43.0

