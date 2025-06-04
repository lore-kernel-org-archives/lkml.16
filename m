Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33C291146
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047788; cv=fail; b=mqUlOqCcketPWKObSVbYt72YmuG3gjCDs368tQcOomxxvOUJZmJUfjUePCNBk2mI6hWE41fWNA8fs3qvjv+pZvGyEKYhaT/Omb2cRFBBYG+H7SMPFUDN1ifSaEalaASk894tr5EofXij2LcD+MSP8PFCIXvNHfQYl8WrkRkDIyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047788; c=relaxed/simple;
	bh=uDbEJx4bS4pBgnZPf219yUlqfTkciUnSR8c5FHaqUDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mo4PfY5MxEi38Ua/kvx3+xOQqY8BXrqrSEZPfKeEVPv4A+FM5jIUTuBdSuy6qrbh+FONr81kqigvi7i2LDfbI6YPpHAyjPJZJx9aOTtGzm6QzOKVBvnM+p0X3cRR0nkmC9VPLTuxpKFBsqf2DlNGverbYbkPRUdXdmspnZ4LBys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=adgbl0TS; arc=fail smtp.client-ip=40.107.101.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="adgbl0TS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFYKhsyuSKx/mGJ/g+c4TcaJ9zUyicYeyE9+jZUOeBiNVxI+GMtEEmaivvGvQm/qvDyNZpTcaTh+e+LpYLUkmugg5XJ8kX7Uj3u4dcOTg/SmMUGN6V9+CNB8K/MPijrjjOl7qfC7rVZCdVapqGi1BDLzrZOTmpA9E74hpXuA3/1f1Rwo/MP3jRBv9lMESvrGtGRUs1fbgKKL37KLJs2a20iJbWeS+JEhSJeO9cts++zUa/QtzZqPGN/vTnjc7WiK9OhfJlCKfOS07xkfAmNdEOjsGUaYvP7Uf8iRQMPk4pG9n2yKRTrPQKB49SSaBvEYQMq/QMKWoJJPWiASqasYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ImMMQBNllFvU3tucg98Gq4hxvL9BQR0wWCrWaLJd/Y=;
 b=MKwe/yTVXjb3r6SBuYFwMqGnRkV1lvlzcQp8Ad/xX+6sufdxxSdrv8PyOg+fuQxPy4Fs+5ixFdcaBWn5yTIhv121MBKOgmQQakQ0a+k1ZrG8TIIW471KnnlDrOzOSymWZ8waJUx/E4Vdk/S0rYSknQ7825NwnrceGFX+Ah2bj8TcX4aGTgxdb/ZHQwonQh+eT2NO4ynBHOa9DMBnJ/1BwSWS0QDfFIdk5dmGNUCoM6fgvbz0s/POwcZ5YJjP0NuD6Du0COPDWexZ1+5DXbnApLo6Cai375Qblfd/NdGZ4V+29GZWssuhSrwx2V+BtLqN7qe2j4fUEdxxboiqF1ut5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ImMMQBNllFvU3tucg98Gq4hxvL9BQR0wWCrWaLJd/Y=;
 b=adgbl0TSg4Emhl5bN260pL3gdBEge2ownJwm2bX5z+gPKj1jqw3EcZnRFglnk4wl7Kr2BuqVCOhkcSj0+jClf4xuzb/Xqaj1PvOqVAKJaAuvn06HTKg5pikey6SPq0eQkQql7HbxnlGnV6xOUN9PiTUruT9hxLlf7MjUIPmGWhlUhl5Lm9WCDCnE4t6u8K6OB482ttHMTfm+GyjGQCSAvogtIH6JE62ykNBzJma8D2gG51XluTuKbtB43geWB7zZBI+nHSd3TzEWp4+pT9BkXRIs6Toq/jXmmN4zSJK245rcB9LFSmRUnav7tKyIbvAPf/6riinMx1BjV3ptgzc2Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:36:24 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:36:24 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] sched_ext: idle: Make local functions static in ext_idle.c
Date: Wed,  4 Jun 2025 16:33:12 +0200
Message-ID: <20250604143547.708202-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143547.708202-1-arighi@nvidia.com>
References: <20250604143547.708202-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: f87db35e-8dbd-45e8-dba1-08dda3752e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/lpUUbPms4Ucqaj5PKm7bGzuQlOeR69vosY6N7s4WmR5cA+nmx2Pvbb3zvyE?=
 =?us-ascii?Q?/frOQSMN3Hz5yqvh8QbQGSlm8Hq5kTdn0pQtUAPDF2Lsqb8OjiGvD0z0p2+p?=
 =?us-ascii?Q?wmzUZDwxNFRlVtm8vXzNZ+FNN2tdc2yimmCiTde9+cVgpsM3+u4XvHZqKKkD?=
 =?us-ascii?Q?gri/7s8pHlIUGOxXOmDLKxMDDt2w/d18t35SQmwb7eytzHV9iB6Gan5j37y1?=
 =?us-ascii?Q?IBRGfDrCXIEME042dgRmYJOBE6PtI5QBp8LARVjE1flZ6fmFYte6gPcDX1XO?=
 =?us-ascii?Q?5TMXStjORjAPQ/V1Bvtmnnw/FkDXYVr/Vav7NyUVXZ1AKs+dVRZKjJ1rr3AN?=
 =?us-ascii?Q?3/dvIeHh+jdRgdveMugDuUqDQyDAgZqzJzyrgUbPtZI/ci58YbNe/lnMO3v5?=
 =?us-ascii?Q?1qqZoPiP1pb7bWcQxMhcHN7gRbU48NG54XRXC1aflsVmYsfzGG3SJv5XCRze?=
 =?us-ascii?Q?XhfVIemVG6HtaCKf7ywri/hBCXEr9PIAWQaGtx5xRKxvkXm1BT0RpkBSqMYu?=
 =?us-ascii?Q?bJYktjTttgYgdRTCN1oHLAwd5LPtMgt+TvjbHpq84KL4Dn/Mt2/LX74+ANwf?=
 =?us-ascii?Q?gLU0o1EehoWzE1UCy0BVu5VhdvQgjuKUijfXwmlZ1zDa19IhfBfdsZA64ybU?=
 =?us-ascii?Q?EGNAIo9utN4xxIj2slLuFF/9soNHcJBflYinUbyddFdZU8RTj+iLnjcqp2/w?=
 =?us-ascii?Q?k2FRAvS2++IXMjM7UGmxOXy5R1mHPaVSNnV3I1eU4ir4GPl9WC3332tw3X3I?=
 =?us-ascii?Q?p7ddR3UjAFTM4el8O/KiU4FbeKGITI3w8f2WFPx1spcKQwji+I2cEoIwF/Gy?=
 =?us-ascii?Q?5xqeq3nvz76TMTG/xU3PDT6+7xyo1Wv/mQ/uMJM524uD++2gZC24S1XU2nVS?=
 =?us-ascii?Q?fdLr9RLGoUeheESMg6XO+HUI0xDpUKiXNopaZvOAQzSfstASo1+PwH6BFOPG?=
 =?us-ascii?Q?7GvIDukJaltutYgFNVr2xgPhnj9/JShZni7Oa3wNDi6oKTCeYUQ/UB61S6Im?=
 =?us-ascii?Q?gs/o/sYUou838lZK2S7T7fxnIa+aa7+JP7Vzetc6o6i78tnaCz+Hac+J7Tx7?=
 =?us-ascii?Q?GT7J6Ip/ahRklf9g1sxwaQ/5cmdz6exNfo/HI2VO1qv1l4aoKpE5nacvBpmo?=
 =?us-ascii?Q?7hXN4ZGym4WJfpP1+EO3cyQCfzLNkou+k5EXixDMI5z+DGoUHfTajFuSJB7b?=
 =?us-ascii?Q?2hrn1JioEDVU0lFYG6L7bzTjgbRVCrQKgv2oJvqfmcjtj7t57lRzTIYQbD1t?=
 =?us-ascii?Q?BJJCSVm4job9ufWITvIDecEU0Y0lqmDqOrIguXSGGLfT5kA4t1byd9UpMNbQ?=
 =?us-ascii?Q?Hx9hWuVtEWGXBum+kPw4HOBcbVN/K0d6PwvcgoaF20c/yuxHhz31RKGAFiMO?=
 =?us-ascii?Q?hNCEf86dldIC8M/2IoPEONEbrpeCEkaYxfdx4YtVlLNTI+pR7IDKEy3oAOjM?=
 =?us-ascii?Q?nqOJDBue+2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MMtMN8vQn60asnohRcnu3k9T0wkqFljjlX8Ngk65Qu9NTPrXRS8W44Sj6oyL?=
 =?us-ascii?Q?kHfFIfY/aaChjSOnB1UhUCEYvLpZ/P7xJgIKbPpLEASml9fNV6Sc901ttOsh?=
 =?us-ascii?Q?5EQHBimPhso8PUnAKrray6MVOzzDP+IQPKUkPaI0h/c2ivqEEnVYN2VIFaCc?=
 =?us-ascii?Q?5aT6KVoeAQhlTAJRmlusrHKgLfP20Hvh0syYZrTPKebCUO9aHBave53agW+y?=
 =?us-ascii?Q?Y6xxhjOubBEXjqbmQq60GIoJMGqkTHB4X/o+Gmc04gkOrYJqGftqclXBKq3V?=
 =?us-ascii?Q?JiXcdC96Xvn/o/V3voIK1hglYgs5imaP7Lfi8VaOwOmkIQj8yVavtav4xa4P?=
 =?us-ascii?Q?p6f9Z3WrCz04MIFK2n/mUB4DfxvxaGhSUo6w48Crw0LX6tdCvTtg+lDHPS5G?=
 =?us-ascii?Q?LJYeW8uhMK2mabci4wzoZ5EAiTlkbIDyqjpzLGRtQoRcZ0wTsnXP5s2R3SlR?=
 =?us-ascii?Q?6OyIo7QjX4orQd43nhz0LMUMchVuLQ3eVfsebfB08ZeWB3kj9wlZyXQjWxQv?=
 =?us-ascii?Q?RM9GL/5jjd5nlfCW8MUf9sjNUkf0jpGjSWZsETX6e18E1ISEqyAxAiQsK3lf?=
 =?us-ascii?Q?cLCXnklMTP0R18WgbBBczMASJJm6tCAhYgKhVAez78gf3HqE+PTfvOJuGCYQ?=
 =?us-ascii?Q?dgKg9+NYSPKLogjXvWIPG1biyOVHqBRquuuJ5r/huL+Yo4WunfipfN8aSvXv?=
 =?us-ascii?Q?S0Z1P8PGQli+Wi8bWil+M9HVYHZ6vpNFHXkC51k7+xBc9+jJ7FyiaQMeOxNu?=
 =?us-ascii?Q?9zEuKFwCdfT8u4d+roiKLyUM5fQL/YQIN2EyxWvwt2idjUkJeduKPjkIq6Ko?=
 =?us-ascii?Q?JAeEeIEI699TRijKRqQeRvWPK5Xs9GVLLrZmkAxepwbgR3aSj/Vq0FDmjJBn?=
 =?us-ascii?Q?8zno0R7ZMG1d+AITcw9uZC9WTGo3Z52SVoZOcki1mXaAhGOphF9BZP1TtrRC?=
 =?us-ascii?Q?ccmNffQpfqCp3Sel0dvplcQOnhQhtut8jWgUpvPDvWwiUisSv1HXZgk2OjJH?=
 =?us-ascii?Q?8XGx/J2wYVhT0pXrcvMDrh6STcGf5AD6COuSCWs78k4TGtW0xS4hw1yo47IL?=
 =?us-ascii?Q?f6ZxtO7rbYpRwxbZqTF8qh/Dgma/jMSTRjzsyYx5jaDeVNF8TgClVwWaSJg6?=
 =?us-ascii?Q?NWrpHwX3MC3vbcvA5+fMjDzn5q5aKg0QVOryCroSsGTEdVu0LN1qcOJzq4G5?=
 =?us-ascii?Q?C1WG1h5mVB/+CzcCatCDei+ZWLLbWZsksRtotx0ytHZUszQ6cIH1zS3OZmd8?=
 =?us-ascii?Q?LWQgFPkiComCfbKuRgZuh9sJwSEUL1vBcWbCAIrcISGN5kuNLwpOv+ViRrzC?=
 =?us-ascii?Q?9CztJXW+c+JUdBOrpy8DptEo9UhkGQ/oknd+NTn3AyrfJiOmZNqlSOL4vzAy?=
 =?us-ascii?Q?fm15Tvszu1utFVwf9UNPTPmVlcxDWmp+C+KTO1f0R+xWuTf4JQXRCJC7es+O?=
 =?us-ascii?Q?01+7I7ocKlciD99I4QgjHhGiCMWfZWjXtWT6NL6Q+74OlqKeyJ92t+7Q3jqK?=
 =?us-ascii?Q?e9bTXfEruevFS3JWScJneZNd3V8hj1LTQztkTVyAzy/RRIQIo/6+nD416E45?=
 =?us-ascii?Q?/OOf+4MhrI8MWJ/exBnqr4t9FepyqhU1gTO0hWnt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87db35e-8dbd-45e8-dba1-08dda3752e4b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:36:24.1524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtBpIa7dOMwPTY2VzWCIdByEz/zuPhIqWIp+XWZ7Clz+sn0r6s1FdC/3+dlYe2HUUoTCnBOh0tPqcSlxEdsyTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

Functions that are only used within ext_idle.c can be marked as static
to limit their scope.

No functional changes.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 24 +++++++++++++++++-------
 kernel/sched/ext_idle.h |  7 -------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 1598681b681e7..17802693e3043 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -75,7 +75,7 @@ static int scx_cpu_node_if_enabled(int cpu)
 	return cpu_to_node(cpu);
 }
 
-bool scx_idle_test_and_clear_cpu(int cpu)
+static bool scx_idle_test_and_clear_cpu(int cpu)
 {
 	int node = scx_cpu_node_if_enabled(cpu);
 	struct cpumask *idle_cpus = idle_cpumask(node)->cpu;
@@ -198,7 +198,7 @@ pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u6
 /*
  * Find an idle CPU in the system, starting from @node.
  */
-s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
+static s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
 {
 	s32 cpu;
 
@@ -794,6 +794,16 @@ static void reset_idle_masks(struct sched_ext_ops *ops)
 		cpumask_and(idle_cpumask(node)->smt, cpu_online_mask, node_mask);
 	}
 }
+#else	/* !CONFIG_SMP */
+static bool scx_idle_test_and_clear_cpu(int cpu)
+{
+	return -EBUSY;
+}
+
+static s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
+{
+	return -EBUSY;
+}
 #endif	/* CONFIG_SMP */
 
 void scx_idle_enable(struct sched_ext_ops *ops)
@@ -860,8 +870,8 @@ static bool check_builtin_idle_enabled(void)
 	return false;
 }
 
-s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
-			  const struct cpumask *allowed, u64 flags)
+static s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
+				 const struct cpumask *allowed, u64 flags)
 {
 	struct rq *rq;
 	struct rq_flags rf;
@@ -1121,10 +1131,10 @@ __bpf_kfunc bool scx_bpf_test_and_clear_cpu_idle(s32 cpu)
 	if (!check_builtin_idle_enabled())
 		return false;
 
-	if (kf_cpu_valid(cpu, NULL))
-		return scx_idle_test_and_clear_cpu(cpu);
-	else
+	if (!kf_cpu_valid(cpu, NULL))
 		return false;
+
+	return scx_idle_test_and_clear_cpu(cpu);
 }
 
 /**
diff --git a/kernel/sched/ext_idle.h b/kernel/sched/ext_idle.h
index 37be78a7502b3..05e389ed72e4c 100644
--- a/kernel/sched/ext_idle.h
+++ b/kernel/sched/ext_idle.h
@@ -15,16 +15,9 @@ struct sched_ext_ops;
 #ifdef CONFIG_SMP
 void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops);
 void scx_idle_init_masks(void);
-bool scx_idle_test_and_clear_cpu(int cpu);
-s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags);
 #else /* !CONFIG_SMP */
 static inline void scx_idle_update_selcpu_topology(struct sched_ext_ops *ops) {}
 static inline void scx_idle_init_masks(void) {}
-static inline bool scx_idle_test_and_clear_cpu(int cpu) { return false; }
-static inline s32 scx_pick_idle_cpu(const struct cpumask *cpus_allowed, int node, u64 flags)
-{
-	return -EBUSY;
-}
 #endif /* CONFIG_SMP */
 
 s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
-- 
2.49.0

