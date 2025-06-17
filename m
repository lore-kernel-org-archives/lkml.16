Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013014.outbound.protection.outlook.com [52.101.127.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3823B601
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151460; cv=fail; b=H3vmp1lHmRwoonA309gEkUNv7E2FLak3aJXZkWNdCo+J80Bz2xs/Ouo8Gt6afRRwhsqPqRUg9iG6W2yAt0t8IFfmMevWuD0wQI+Ad0/isx9g0snrysHfnsto2zYnvJ3zMden2kcRLC33DDO9p7mox+lqhK+bh2/nhgujICmZQlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151460; c=relaxed/simple;
	bh=1L0DvgB3tkIwcZLZ8SQYepJtQEI9kqVCFUDmJ8WtTcM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GmoMsXz9KlW0q9dsH3Q1jduWvS4LOM2DuX5uZyJjJxD8csuOc8iYXnVXQ4+B4MthuzJ++XlQHoO5L+Fiass/wfJ3haxueO6T78xV2zxOdU//wnfFI6eGCC6JTX/2/9H5Sjauf6+pAkL7yu54ehgdRU1qDUqypEohev3l4cWU6yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Y6wuV5uv; arc=fail smtp.client-ip=52.101.127.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Y6wuV5uv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhPUKRZrYwmHqEgvyGRhoDfvii/x60OAN/iCFy/z/WrwmqXdAtw/wWAZsXyqBiRhlDVexHt0DpJoZ51acVjGBInxG7a15U8ApozjxiMGPuk787TwRR6YWo1ozXFS2StjBM+iYzwCT/QnxXlC0uS2EgTvhYHeAXj8IBpUU+4c+TB/TPKLhx3oo2P6sM+x+E0LtAYQZ0NwWYXI0j/DGC5BwIob8+KfXOP3SLN61G9RqrVYrUZ3pl0t/SjUsISL/AlS2q7jYinJbpuLMRm9S/2GXhs1czyYDbVDpiypJODdGjNpXV9F9mvxUOQD408TVLwdCmodhUDFSoF5IHRv4X3kcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4HC7o1TAE/UOMIPvHlJI52ljMYyaSj6BwJXQg7lqkg=;
 b=BfiLunqbDHZq8WPETDZAdR8oT+yL60NOA5ZnFuj9eLzZbAaA37hr/QlFcScjgs1p/0MQFcQQHNzgkYR20z8IATY8bdTzNhzpd6zl+iMumaCp09NsaEGuzcVBhoE8gmymH4qx6Vv86AVe+5adI5l+PRqBJEHGRrcJz99JwQDd4W4FZsE1Xhl7Jq3h45zO0eMNjPCYLkw3POvTugOQLguiYgOKRiHZZosF0kWF7hMlY3dGQzj7eJ2fvK+gX1IZOuGdJzEDh8AVHsOXK+poJsOcCkskNBvqjXmjwmY0S34SObaqXNmGqid9vGkGZOLJommjoUBoGlbwX4DYZz3T7CSwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4HC7o1TAE/UOMIPvHlJI52ljMYyaSj6BwJXQg7lqkg=;
 b=Y6wuV5uvy83Oup8cVMiOQ+yKLcJvCIuwG1BQPVkhLjsEZS5/qaM6moRywC9koLy21TVcoQaD/a6oy0f4jBmKNsJApgx2jelRpMlg0rIdfEGdN1GkpIsLjFylttr/yoMpgk4r1anCgyocNEkZFet06WDxwNyl8no9Xc1iDqgL5S5YL92mJTvqaCgA1mzEwZEZsLZxm1IhXEPGcagwjBUC1GrgjoOLyYY4HbdaeCMFO4msFaPcU4A3KE60b0V7ra/gHepJHVViqcUz9eF+IAx1WktvTtlbNsWqq2iLlleLIFjy57nifKcRBckEIcrqblWr8h64TmcXATRHNQ7AxMVhtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by TY1PPF9851F8D71.apcprd06.prod.outlook.com (2603:1096:408::91f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:10:54 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:10:54 +0000
From: Zhiguo Jiang <justinjiang@vivo.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Zhiguo Jiang <justinjiang@vivo.com>
Subject: [PATCH] mm: rt-threads retry mempool allocation without delay
Date: Tue, 17 Jun 2025 17:10:44 +0800
Message-ID: <20250617091044.1062-1-justinjiang@vivo.com>
X-Mailer: git-send-email 2.41.0.windows.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0183.apcprd06.prod.outlook.com (2603:1096:4:1::15)
 To JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|TY1PPF9851F8D71:EE_
X-MS-Office365-Filtering-Correlation-Id: a5360c91-a8ca-46a9-57c6-08ddad7edd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mt5yO/vgMsaHJhMoiIsVwRBPkgLMnupXcXVJ1Fx9pEjz+bzDtIRyOfgqHAju?=
 =?us-ascii?Q?CNalUt7EZUZ9D5XWpLnbiNipCre+hzejYZAmjp9Q4jboNykZkF1lYWEF8hEu?=
 =?us-ascii?Q?Q9f8k86Y+0gwRv2Mi1gwmhe2PRbNlUw+gEKoZI//TxKI02/ZfWOU1TK+4qb3?=
 =?us-ascii?Q?uKERQ7qfv4OTwrDr5xrmmCfMwTsofYVpoxWnkXt91KQZuFXzGfgRNgIKdJIl?=
 =?us-ascii?Q?JfuKVSGyzqpGi548wgD2kaq/WMg4LC1aIKJHJo1vZwRWcmcf5iss1dXzMGgu?=
 =?us-ascii?Q?jQT1HafpAZGB8b9/eImmpYhZfQUADSgbTMRhQxssv2u0ZRiFHGIN/tOtslCv?=
 =?us-ascii?Q?ooiSsriuvG+ieLuPr5kZZn2BAcaZlumAmlywg6GqPV7iFUXNGET+b1C/0i1R?=
 =?us-ascii?Q?Gm64yaVEEKM/+VR8qKtjjFOMcDbbJHferQju/kU3B7gEmA4DV3dqKh9yqLDK?=
 =?us-ascii?Q?Uflccv2O2v7EUue7t8PdeVtkTORfEzeMw/u/+ID0+UZ2YP3gEI0HQ1kgZ14X?=
 =?us-ascii?Q?fNazpmsUfyk7+2Mb5PpghQRSxfG8E0TWXS+ikUAx6SS6vo4aQrPyS+qS6s2b?=
 =?us-ascii?Q?QtRlKwVyi4wHDNohZon2XjeXzOKxBkjl3aHpEns+E91/aVbWa2nOzGh434q3?=
 =?us-ascii?Q?Hh8OGDOAo9D8X9oIIuXSwftIq36wVuYQHMYQw3PCQFhJj7HWUINK5lJwD8I7?=
 =?us-ascii?Q?JeIUqA7KulR6fXqaHIcQgN7C/Q7neN1Xs0a055AHwhbDcsTd790OY9TVuu6y?=
 =?us-ascii?Q?dBEo+MrNDG5fZwOm2oUgI69TdsKNRT6CUzKmfJQ3kSrFaxDFxs2mCmh2S0zH?=
 =?us-ascii?Q?ImzEAcBi/h1omA8eb6ChMm28UJejAOQ+LVpgAaADTOeLDLkSnBUj9IceY8t1?=
 =?us-ascii?Q?wRIAdTibq/igU5stGloMIROWftNKQZM9XUAi3NUStHTfB/YxIqdNhK3J37L/?=
 =?us-ascii?Q?NbEOYNJOIlNcr9lVail+bu1K/O/w8ijY+Kb7VMZ8VCW0lfOhC1Patug62Q1m?=
 =?us-ascii?Q?zdlRbmB2n3nlJPqnyChScVnWVfqwMARuMfNwvqQQd9c3d70pxB7jJoNNe5LL?=
 =?us-ascii?Q?kDpcRU6Ja75fVv+UYben9HXuOYtkLUZcVyeAv7vO83zBrSQbbXay3QJt5nVm?=
 =?us-ascii?Q?80BHcCngCndDSkdbui5gG6uHnZOcruJAH/auxpRO7KaVK+XPDx7CrxBgjf7j?=
 =?us-ascii?Q?9HQC20ciZiwOsJcCLq61cw1MJ6GFNz4zV+IVS7IQThYhfiSzXyDvhNgqgNn6?=
 =?us-ascii?Q?M2xgEVfpsS0R+rO6FKRG8OJtQYKDnllzyDRgUrbp3mu6B80sPx/3f37KQNku?=
 =?us-ascii?Q?QKws0I99exMiy8xNsIjGnctzlzf2+KITxBul8+nkLEYbb1bxG7bogM2JY1Ts?=
 =?us-ascii?Q?Jl0aXhd0xO4OA6snCGE+hy0/Ipw2oihexu3jkUeSOTywA6MWnAneBcEpbYDf?=
 =?us-ascii?Q?B6yY9Hod3osoHT092vFBU4mtZ2EJQMJid5QLMk8CiKc1AFrOCs6Cxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB6849.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tXdku+MdoP//FYuNtpsggGyGHa1MemOB6ho2M65Upte9yoHoukYsCBUMtBr/?=
 =?us-ascii?Q?8abkm4Ri3/sFrKzXSMgV9A5OYzn5JWeGYZTIsnIaq489j2ih21NsF+uBuwQQ?=
 =?us-ascii?Q?FL2vHf4QvLeqwXTYSxW6GDrHt6CQ/RXnDcK5U27I99e/CEz9u85/FkwMKjJq?=
 =?us-ascii?Q?9hkUqhuqLZBvszEYw6zLXhRKCb0UsTmv1fcly+mgvDiP5b+mM4PwVV2Zjcyw?=
 =?us-ascii?Q?zWlfcsFrZER6sVGBOrht9+j5wuwRyokY3W46amd2hF4WaaGDfJqYeYUOz4My?=
 =?us-ascii?Q?MH6bBs2mU5ql5Iek/7Q8PsMK6zg/AF3hU3EjQVmAvNtWklTTnsxgWpSyDvPH?=
 =?us-ascii?Q?UwvuK+KsKUoOGQRG75Q0OJ0ERxhazfTQH7uphRQWyjd+fz9LyCIvs1uljhzz?=
 =?us-ascii?Q?S2MoX+N4Z04/0M8RZmxZvHf3N+nZHvFaiu8q8qLYZt/Mhssm8WzAHa6xTryv?=
 =?us-ascii?Q?mpOihSOk3OjjioMIjSqSY0Ipd0ZyKJoF8zoBxmuJVtErqNkxQhccX+xH6t4U?=
 =?us-ascii?Q?0av8l1LebeaWf1Y+aml3wak2inwcyHrtxNveFzSZewbFRQMCpJ+LHlYXnQGp?=
 =?us-ascii?Q?5vqdt4Xz+OSPjgyOrWZc2D2KHXiLPFvj2oSOeeT4QCIrgPjG3VCEA4OAF1yG?=
 =?us-ascii?Q?35wdSNeTLkquUEa/zpMuLlyDKmPVuKjx1oNwgxEJpD4St/CFjj3ZkTtIyt+b?=
 =?us-ascii?Q?734D//43nfA5euCGp/eGFtvm78vP5tWJiSu3JA4vpnvYy4x7idreNoFcfN12?=
 =?us-ascii?Q?5cOz0E0ev8oDj/ZX7/bqMHrX2j1zSC+4oIJCbKMIFu1q0GjDoaP6uN9mkFO+?=
 =?us-ascii?Q?H5euS45BEYXUBZO9ssX8K9bFKzObTyhQFHlw2cgowLPm0TKg1f5+JL3dGPw/?=
 =?us-ascii?Q?V/VPFaRaN6Jv5zAmBjm3knxCfEWRmpvNSGEcSxAD7iMT2uHYdJOv4sROX6rx?=
 =?us-ascii?Q?xm1NHPGXCZO4WsOIiD0Ib7ZjVP3wqlLZRNkPbH4uemJDm68sbmO0pIdPCNyC?=
 =?us-ascii?Q?4957eaWnImxoY6TmNziJBh0AsY+RhA4+HpGuZOhcy5KazB5QQUgI4QEuDgf1?=
 =?us-ascii?Q?4FUeqPUpb0neefo9E2lCEGJuNGgIaS8ubxXUJqEO28gHeI+31PWaAymGLh0m?=
 =?us-ascii?Q?1vwSVBd56ZUZ0+oiB+0ZBiHB7nUF5YNbU4Ywor7pkVAmTY3N0ISRjDYMWC3h?=
 =?us-ascii?Q?VFfEHMel/1+EBrRE/MH/OH8+RDnC1M9OnZ4zuWFsfeKjgVuC3J+H6usQ9Pzv?=
 =?us-ascii?Q?u8LtWsscNE8Xnu3iLG5Z7RyIVPim7OlljlCf/aGLKKIQVkrEyD9/44SQt8Vx?=
 =?us-ascii?Q?7TgZ3ec2zWQ1DL9DzgUJM0w55zxOKgKvAx70DassvSFMwaULZdiVZcXENfhO?=
 =?us-ascii?Q?FD8fn9OziIciw79V05KDxelSyz9S24IGLiJw6X2OJfelbM3oKGog5jNN5FTq?=
 =?us-ascii?Q?RyM/rPA5Lf9MrqvRDT2+t8r/EkfI3bkcievFUwUar73qX6xGqb20tD2t5lGt?=
 =?us-ascii?Q?fdLCLwPDFD7lwu9PmIKA7yPmO+9+g073B61pJwAXhamonjUDzvwbH+UV5+zJ?=
 =?us-ascii?Q?p9OhcNB4jiEIkVrP4bw7zsgSnNusU9cG6CLp5t5N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5360c91-a8ca-46a9-57c6-08ddad7edd4c
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:10:54.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt+ibXCRXTncKu9+vrP8ME3HL4d7HUEra3KK6xt5i2qFLiCoKQDz+MeLr/81btyF51ExEUqR3ma1ClYgaCZOgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF9851F8D71

The real-time(rt) threads are delayed for 5 seconds in mempool_alloc,
which will seriously affect the timeliness of front-end applications
and the user experience lag issues.

The real-time(rt) threads should retry mempool allocation without
delay and in order to obtain the required memory resources as soon as
possible.

The following example shows that the real-time(rt) QoSCoreThread
prio=98 blocks 5 seconds in mempool_alloc, seriously affecting the
user experience.

Running process:	system_server (pid 2245)
Running thread:	QoSCoreThread 2529
State:	Uninterruptible Sleep - Block I/O
Start:	12,859.616 ms
Systrace Time:	100,063.057104
Duration:	5,152.591 ms
On CPU:
Running instead:	kswapd0
Args:	{kernel callsite when blocked:: "mempool_alloc+0x130/0x1e8"}

   QoSCoreThread-2529  (   2245) [000] d..2. 100063.057104: sched_switch:
   prev_comm=QoSCoreThread prev_pid=2529 prev_prio=000255001000098
   prev_state=D ==> next_comm=kswapd0 next_pid=107
   next_prio=000063310000120
 [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209675: sched_waking:
 comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
 [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209676:
 sched_blocked_reason: pid=2529 iowait=1 caller=mempool_alloc+0x130/0x1e8
 [GT]ColdPool#14-23937 (  23854) [000] dNs3. 100068.209695: sched_wakeup:
 comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
 [GT]ColdPool#14-23937 (  23854) [000] d..2. 100068.209732: sched_switch:
 prev_comm=[GT]ColdPool#14 prev_pid=23937 prev_prio=000003010342130
 prev_state=R ==> next_comm=QoSCoreThread next_pid=2529
 next_prio=000255131000098

Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
---
 mm/mempool.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/mm/mempool.c b/mm/mempool.c
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -18,6 +18,7 @@
 #include <linux/export.h>
 #include <linux/mempool.h>
 #include <linux/writeback.h>
+#include <linux/sched/prio.h>
 #include "slab.h"
 
 #ifdef CONFIG_SLUB_DEBUG_ON
@@ -386,7 +387,7 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
 	void *element;
 	unsigned long flags;
 	wait_queue_entry_t wait;
-	gfp_t gfp_temp;
+	gfp_t gfp_temp, gfp_src = gfp_mask;
 
 	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
 	might_alloc(gfp_mask);
@@ -433,6 +434,16 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
 		return NULL;
 	}
 
+	/*
+	 * We will try to direct reclaim cyclically, if the rt-thread
+	 * is without __GFP_NORETRY.
+	 */
+	if (!(gfp_src & __GFP_NORETRY) && current->prio < MAX_RT_PRIO) {
+		spin_unlock_irqrestore(&pool->lock, flags);
+		gfp_temp = gfp_src;
+		goto repeat_alloc;
+	}
+
 	/* Let's wait for someone else to return an element to @pool */
 	init_wait(&wait);
 	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
-- 
2.48.1

