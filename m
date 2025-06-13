Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C80C25A659
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791895; cv=fail; b=MgBsbYciG6J3VHFa+iK2mU1CG3ORx3O5sYz8TObFuP8nNXsUfEi6Ze2ff3bXdroR49LZvX6LxtfUTXUxXBspZQXx2QvaBmcxW6mJVN0D2itgca5fRVtRaSoIpL5KIse9z+sV6+NFFsDX5IBxfp8tbCQY5FPsY88yFSrsvkSyhME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791895; c=relaxed/simple;
	bh=YeEGsOH31dy1mvVZQi0J6NycKpLmc8k8by8r98r+Y50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0StK6G8w+c9TDRU7f6XhlcYCP+89FIwKq4fRzdSmpOS0+nlztabCWcSJZjfXlz5509m3wm1GXn7mT/NJEmE3V15JX6YN/3CRkB1tI0BvTOIADKXHHqBZlninbcCUqdA7HQl4TqGWdhVmqdArMOI5djwbWh2VaeegcvgRkfNLvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n4HpUb5I; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n4HpUb5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUQshMUM8kighE3al9L/QR9zfEjysXH21K/d31eCz+7LuxY2bxmcpxdZpnt2tyQEZX+OOCdL3FVyBjp/ffy1NFOvWRjiXST9qrkWMU3m5DyeIFaBzR1WvVNHIjh8ZlyR2njeXA/5biUN6WQ7820L0Z6QMaNQkB5wsbXVerVK8dhxoaSBjC4+8xaQa3BDbjjQLRXFrYGfUsuyZnSt6UrOhbKEUA/+7csyxE1ToX8+oFWjLtYO3/CGqrK/wioRDOXEJ606S+DRNqUmstL+OYQoqzqHuysGrkPu96dTOoV1WFWgegACMdkkOoQifEWqK2RjKsiDioOxjWYtwzt3UAsi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyw/T+Z1fakuMVk8+VzbJclbO6euf9gk+Qz4ls/Bm4E=;
 b=mGWLyEelFGfNoS6uzfsZHiBNKYKwoteZ/YkMS+5857/XnvZIwVRRxoZUfycbM6WTOMaojUGXeVtervIt+EswxOMXzmP/PGbs7HsTBn/spwMyzHVgGEcStcolSkXdaHH+qUtItYK79xhKiMZd3AeCIg+xmibz+XOvDXuFnd3GJnBddAUByzNXy8z29extcQN1f1+KdNJJKf0O3GFdcq4FuYqvi5y/2Ko5v78bKmFYspqxkLPpL7iZU5UBXUcWIih6324XPet1MB2708X/1l88P5qhWzLAGMe9mwQmKiXrbLO5+CjmFJaUefZuBTsn21q94Oy6HDUC9k5YgdX8c6Kf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eyw/T+Z1fakuMVk8+VzbJclbO6euf9gk+Qz4ls/Bm4E=;
 b=n4HpUb5INzMAclLzYbQKiWeB3yONuZMd7CI8AdvODANVlETdpQzhVqUPaqgrsAG1fy3Q9cYfqadk976LiR4iahYq5TjM0uttPtiLiUpRPQvtvVrBCY3NCnmLuYcT8Z6hr6S9knU2nvHCaVeP3OmQqzBkChEfhhOkERKonoMFXdHuiOnvDF35y4vvGbdV3iGW5fsCiB9xGqgKYTvM1DTGDBvcBM5djxwlxcfjbTjCtbYUpLrMVBXFsfBq6LNy+8xihnl+ec/Q2Pjvgz9PBNTdTn260uRHZVJb557lp/iHyEJ0g62S8z85SjncXXobk8IK/YuIF9U9pzTLMb6qejvq8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:18:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:18:10 +0000
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
Subject: [PATCH v3 07/10] sched/debug: Add support to change sched_ext server params
Date: Fri, 13 Jun 2025 01:17:27 -0400
Message-ID: <20250613051734.4023260-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:408:142::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c63637e-1d7f-4078-6612-08ddaa39affe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3TOMeQGq93EdYux468/CQfLF4rdlP6lTxXvUMVbXZ3r3zujO5QCU118FR4BZ?=
 =?us-ascii?Q?wnyVjrnRsdoR/UM41K+cLzal+ijghG2TRnhzvKQeuEBVUf5TiSNWl7zsSuti?=
 =?us-ascii?Q?yQD+90tPTZ53XFK1ryYfCqpiBdCpVQhdBYJIRmw7kYU9B66q1HkKZOXy2WJ0?=
 =?us-ascii?Q?0b2q6twYW525Qjcz7dZpAJCdJWgueqR5qbbe8PaGVWKUhEUYqzd1uLccQTZ8?=
 =?us-ascii?Q?wm7K3Ol0++q+yoOk7bkr9UGbFva2+0yINoh26WSPFUy/GXM9PrMsVG+4/LaN?=
 =?us-ascii?Q?xXe/KbK88zLDDHl1Uein57pZTOBVZhQLCernBb6mbZAnLv5Cxpuv8ekCCgBp?=
 =?us-ascii?Q?7R4C0F073CzkQeF2nN+7R2wqzY9aUuJrl8Py2Kyt4SxF+xXRHM0ZBQZpjmh0?=
 =?us-ascii?Q?jBZF8Ccj0iX/uMwv65QGKxR31ULOOZOw9mWvNujprxc2ZIqLgZ96AUmhpnIa?=
 =?us-ascii?Q?pUJqYgfy7T8hNMSqU6EeKjTJFG7LNVQbq7k4eMPShUyNj5vQaaqcKh6fDVLe?=
 =?us-ascii?Q?Qm6OfH0DVnzITzAtsys4kXJGg8sRnStgyhEGfhD23E8qXNoDg37XT/op4Y38?=
 =?us-ascii?Q?+ecICQuO2vJW+KdMLUgic1DGzQUB0uGxC0iDvuKlq6SPtisHjQybs2bNw5cU?=
 =?us-ascii?Q?rGfZsFfD1J5sWyD822GNSnVd5TxPoOsd4trW4exi8c+bO2J6+xlSfMcZTG/5?=
 =?us-ascii?Q?ainuznU9iLAsQzUTPOAUAz1YlDyEWVJzxBZvEbdIaU3T03VjEJKoKm6uWxjT?=
 =?us-ascii?Q?/eBWhYLDngK1kCRFGHWRbfEIF3VBxFbvkz3rzyWo40Oqy9DG5dxYTPFPx4hg?=
 =?us-ascii?Q?AmISN9noGswyT+BXgkPYptssp4tyd3nBmdO7VVerEvsHOBvrOOhM9FMixsQB?=
 =?us-ascii?Q?of+Hv7DGv4DV/5LHAkPE/D+5w0Of0bcHkWzUnXlakOVDsuVrouJkyfIup26J?=
 =?us-ascii?Q?Gq2YxYkm3RkJZgbqK0QRUtdRmvPRkDc24bS78O5wgvtrG8Vvh32xOhp1inR1?=
 =?us-ascii?Q?2RiSJFF3u4CyO64V79rRpSvzQIPx45d/bV3ZlycrCmFXP2UuPRvl5V3JCJEo?=
 =?us-ascii?Q?Pt0pN2DXQOAqXE4tsCfQnmz3oamDnpgU0hmhYqOAdk8GNCjKTEIHANdeGqPs?=
 =?us-ascii?Q?dpAHdz25FeQx3+Ca7/D9gYg9+i+62uq+5kAvCaMMH3+wwVnaJI73pbAUAUcG?=
 =?us-ascii?Q?eUeKq8do8XCfoV+DOy3FeH2MKKszrWx8l6BFAlAFKlXhljn9jYI0ABKrSQAE?=
 =?us-ascii?Q?ZbhE4PWoWfDy1Q1C/M4niVaVQV+uCVmQFG5FFIrPM/N2Qr7oUVSYrS1DSC0O?=
 =?us-ascii?Q?+XjX+RSFhg5bsQZ2TLexv2kpGPsXj5fVdDdBizB3IpxVtpzRSfzw4IBr+KWl?=
 =?us-ascii?Q?ORxxH8AVZysFt+t4oTnt92vQOu/2INiZgYcpw+UqldXkCcvoJ3KQ7oC6L5gR?=
 =?us-ascii?Q?wDxnW9mlfcqaGbILn4xjv+XhsbT+wRAJDxxx1JR0454JXQ3/zpoYvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ezSdwTudC9TjDHQjPipzxMtAQTZJYn8kZtBbUodJBu0Xm9ZOY+S3mlUsZVhB?=
 =?us-ascii?Q?FEIuCUwxxHZ5eIglzhhNmfxWmeWzQe1iB/tnwMQyWlSdJZFnddGHzc+S7SYd?=
 =?us-ascii?Q?l8MXEvYFcVA8A7uVA5BOxHpHb7aEV25HVNY46C3ADhhEj6QmwP3P44EV5vxJ?=
 =?us-ascii?Q?Ph2W8fotuziQMI3PMNjWonkgwoe5uXdCCqYMmhvn7oTnodiIUkvWr2FHgBo1?=
 =?us-ascii?Q?wpHD1mkp/yPcKyg6UtU+pLHKPCg2CKtOqzje09607x69jhEuUMti62ahxmi8?=
 =?us-ascii?Q?UMYzkNXyz9wiePYXYV2qbdc1x5RLIzeG7ZxjBIzNx3zbHk3Xef+nRFgRW7g7?=
 =?us-ascii?Q?8NP2pj4iYRsWUAtFxkaohZ7EEL5LveaueOukbj5Bwnk+Z5UtZCbWVJIhLiby?=
 =?us-ascii?Q?CnUP16zZ5THXsmwlJzFXUx3MWB6FbMwcc22rfZbo3bawevzYMaglVZsuTGtD?=
 =?us-ascii?Q?o33LOJBamPq5FLWQMCIN/IlIyde7T9vPhRXEZttCxKPOkX8356wYje89O5ku?=
 =?us-ascii?Q?NJn//zvrm5B0SCTzO1VIr4DW9ZIsrjg5r2ZG4tW1qSQ5h7JVVyT2su023Wrt?=
 =?us-ascii?Q?AU2vJL+oUi7hNMrL926hQKh7rT+xKziFscQJSWUpQ/SUaNPereEA0jlGYY8p?=
 =?us-ascii?Q?GMTmRxgBAcMmSpjp6yj7wUXxBT+2ki+NqjqFy3SqUzS8IT47C+JwNWLDuJw7?=
 =?us-ascii?Q?EEgZiq4orQYvRTjDIQL6MxUeQUROTpOgPFWn7SByzkCh4rEaQ4LjPFsjucUc?=
 =?us-ascii?Q?3OPAy6likFgp36BrotizP5KqMN6Z/pmGqkAHk/QsSGGxkMbDzYvZMIw3gvqd?=
 =?us-ascii?Q?HyHDyd6TrN7pagn3SN/qqpeb9ce+ddWCSrmxpR52iq1STGHz4VtOFvwJz1Ki?=
 =?us-ascii?Q?QKMen4kp+LNc5s7Nc2qXao7KgeM3GGPUyFIa/a1VQg3/aI77YYQidJ61keWe?=
 =?us-ascii?Q?E1ysgoFhYrGT99a0psywfZLK2jmE99sNghW+mv8+oo6QqgBSComI6fiBu830?=
 =?us-ascii?Q?SzYeVv4o12LK7N5YNQZMc12/oFcUXVstgXOiNssOgr3VIFzTgp0gGv+ZdgUp?=
 =?us-ascii?Q?gUKEt80/7o+5nObWTCaq4FwjOix1kNl8svLbtEjeIiAuErhl//iICOjC292J?=
 =?us-ascii?Q?GCJw6TAQS14F6Ur8KahyYdk+hboibWJ1OrKdCorStogRSc9f3NjLe9jrDGRf?=
 =?us-ascii?Q?hIkvhq7fEhnGAOOG/o5vl5JFnYvUKccpw6ya697g4/lp+iI54FBgIzqQ5h8x?=
 =?us-ascii?Q?sf8o6u7IMqHQMBTVRMWSXf+DUoCDfIbgjpi17uSayFMnBbmXxABLpzG09ckZ?=
 =?us-ascii?Q?JEnn0zzeUvS75gpn0DSHflRVXnoI3wDPovdTjwk0Ed+b6mvZIcQaDW0SXm1t?=
 =?us-ascii?Q?FWN2ovjVcdupwGiyCzA/E+s4hzwYTWXQQjhVuUz4ia18m7BYa8RyhgnZyjff?=
 =?us-ascii?Q?MalpXxzPgAvBvNibL5zozH7vko0rz1TEo63FU+AVkqkhX0xelDYY26BnSHqA?=
 =?us-ascii?Q?h7XAMkuF+dI4wrm0vxZFQC3j5pgQ9r65LbPz682mXpMcOfTz1QbTiBRMs7z2?=
 =?us-ascii?Q?HerrPzNpGRBoiLUYxPtqqf5PT4xB1M2Sn/Lrcbap?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c63637e-1d7f-4078-6612-08ddaa39affe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:18:10.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN+R1vJHNJMnNRx/KRx6ppwfhRmXmJGtJh368B44mEnGQ9edrM2ybzn0t/kIDwGyU7hhfzqpRNAqxJzuIYe6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

When a sched_ext server is loaded, tasks in CFS are converted to run in
sched_ext class. Add support to modify the ext server parameters similar
to how the fair server parameters are modified.

Re-use common code between ext and fair servers as needed.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 160 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 135 insertions(+), 25 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 6866f0a9e88c..de1f14f73077 100644
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
2.34.1

