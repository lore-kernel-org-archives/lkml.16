Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA42F2733
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190776; cv=fail; b=gncfqEO4Mj4PQtabTA0oAG+o/gXsFAaWhmdqt2Jn1oTLeissnvXYxHuUVem4CYzay1LYhRcVUNdaQBwLFf53deBuhQ45/Sl29jwU1t3somH1TDNFXAB9G/FqG1QM6jEStCwsDigM1jnmitqX6nMZ9WlOwhHCXgykiB0ALluC1n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190776; c=relaxed/simple;
	bh=QhxUDThs67x0k8qqo08vISFBwIeTJOcica1WhY2mVMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Frzenjuqsd13kEkXqmj9ul4LiVg2Ewt7pRaunNrNaZLucioKubryRqOglDTiJaicdELk0P3ybJAkztrxfnzGwCjJ3et9qdQPjJUVDEaTIc218iQGxQFjwtXfzNrQKnKAiXoLXr0DxS212Wf1ngZ9YGVBFHlxd61Vaw7tHCoiT6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L5ZLLtiB; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L5ZLLtiB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz+z8YDGMHZA86783Tx1UVZN3yLWV2h7jLoDd9QgOSeGonho3D4SDiBOY+m0m/25lwWY1+azt0as0LexmZGGnEACE9haRjCukSyiehbAj3huWxa+QGC3Y2pF5fLPoMTxjBUPIm1410a3gdhSUzDNYQ1RgDv1w7Dl2odTiJFcK4K47ksrjFMY+Hp0tcq0X3uULczzkfyr4qLmQAFqICHNVXCg5mcDannaT6IKgYkRQLINQ3uCHBchkdoQ21c1EI6RENxttmnbUE9mAFvAMUbyyrOWBBjTLA25kHc1noyvusmUz2s4QXv3rkuu3ZHCWWZQk9f3WagXjZQwuV+pLvvH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugt2KV14dwIST7JdQy7v5q9Q2dpKYvMlxlYi34outxY=;
 b=id1y8q5wAp7OUJm9vOLiBlP/5/XcdrHC1+ZIk5rHgh/eDjJmPIX+TKOOyIBtcs3pnd59T8lrFqRn6jVeEMc11fc7iJUU4WNAg9C9Cx40SNDaAHdAvIriI9V+c/nQQ49zDBpI7ZXMq92WIAV4MKjGfaEUF7jDen+1mBuRQVYHIrNCaohcR3ZZ1pcPz/WWQB6/O7VjNCKbtwmeNmGJIYzXEGGUcKbH2NrGz0wv53sSGfjz/ZmWCU0DGZjiWO4276WAbJ0MBH3eSbxbil/0RJEk1GJZ4xL6pHtBjx8MfmKm7XjDVhn6zOmzq/4Wc75L7savVpFdYCT7MgFsX5jo65+SRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugt2KV14dwIST7JdQy7v5q9Q2dpKYvMlxlYi34outxY=;
 b=L5ZLLtiBHx9N6Ox5jTEZIFaAJ1fBJPttjsFMgSHCfr76NvFyidZOQ9Jn9L6rr3/XcLeDiO0go0t/xZ3ty04ZAKi6olXIHGZKZGfXOgVp6sqGJbWuNIfxTA69iBGH6OMN2MVkrH95kBZLLBXqKifAOXUQvgtDXWrPnAf329j9gbL1Ha7uBNuFTOqM+HWHMw25z5W/ZWZWDKp72UGL88RjZ+c8ibuE7dSRAbKP4xysmdQTDySeTbfJUVc+XbDZzcnfx+zfbqp+eg22Xf5q4ILPlW1QkdwVw6w86kYbeusowLVj3Ake2U8hp4F/sA6X6UR8XJjrGiChVt6YulFqGuYY2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 20:06:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:12 +0000
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
Subject: [PATCH v4 04/15] sched/deadline: Prevent setting server as started if params couldn't be applied
Date: Tue, 17 Jun 2025 16:05:07 -0400
Message-ID: <20250617200523.1261231-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e8a43-ddbe-4078-d3a7-08ddadda682b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tvNgKJDHm3N2CmgBozgdQybeg844BTmFl9w/8rXiQXW+HL+Y95kUnkyDItmy?=
 =?us-ascii?Q?K1Zde2UA17HMD8GT6wbwWTexucrs/pF5ht0kc0DSdQQLDE+rLS9FEEHY7n9d?=
 =?us-ascii?Q?Rs9bHZxzdlode+6QBMKUjib6j4v42uqycvrqoh+zzmkUMKdBybXjflzryoSM?=
 =?us-ascii?Q?/mfhZDLYLWvL4OVWby9W+Fnl8g00zidMz5+wEdt8st9SQ2hPRx7AvsyAhJ5K?=
 =?us-ascii?Q?YJAbKc/WI5sDYSQoBNTv29U7M3l0ADL2YNN7c2zR190I2pNjGl63on1K27Gy?=
 =?us-ascii?Q?N2r+bHNphIe5HmK4HgUw3KhWBtaI+y4QbPHOc49h/Ponba9tpbVceVj1PmUE?=
 =?us-ascii?Q?fb8DcM8vXvD2CkHu8JD+gYJ82qOgzTFDiDJRJ0sEhzU4rBH3CnxQ6KGUlqWU?=
 =?us-ascii?Q?ETzHStS7FcGqX4KunXtESfaWGnyXUatI5HjYdPoaNpgn9Wzi6tX9ckr1umfF?=
 =?us-ascii?Q?f5uaiQPFnELlCN0qDtXEh4hamNwjbrq3bHIwDwcMgzsN8r7acJ2Y2pcpfxRQ?=
 =?us-ascii?Q?ApqrZ2ktsJN1zWN+m7iWcctep4X2ZN/2UfHAdnavhOCdYY4j/CnM7E9MnvZ1?=
 =?us-ascii?Q?uXavNXot04YTW8M90uP71eWtyz6p1w9fpoGuHU38ylYeaflPcFpmtylUVIXg?=
 =?us-ascii?Q?jjn3rcj97qJVAqyZP6lG04fiej1w9PjlWjtNgx88MgjKzHk7BTuHzbm7sydB?=
 =?us-ascii?Q?q3BRUMkMc20M3FZ0Gh5gnVEzer2dJdRkihg7yOjcpaXF9b3LPmCG/WjyuE4V?=
 =?us-ascii?Q?DEuR17O70MkKHZJHMLkSD8+Dcrbpm3VsvCdgL1XX/SFo6Vqouz7njFucU2bz?=
 =?us-ascii?Q?6Qftmq8wDCpotovFNj8i6OILNJfN0xqQ50AoO8w8xz5tRjSldJ4dFo0GLrR/?=
 =?us-ascii?Q?Hszy855FxVt3ebn4NJIgdqt9OEGameYGank+edhIMTkJGYUQguCPhyIrXF0k?=
 =?us-ascii?Q?oVwKA3teWWzp/HNFrARRDe6JzghhKyWvEYEMLL9qIQm8oAM33TrTcU7OjXfI?=
 =?us-ascii?Q?tyLb+1Q6MWKORMypYE4091u1LiwE0QX45cHWz+iO3Wvw0G/3hV6D0GuVDhHG?=
 =?us-ascii?Q?Fk+TCrUb409QiCtnR30pHTAVDxgCs7cSxKtKv6ENMCUZRCSkYMNV7s15l3A1?=
 =?us-ascii?Q?V0JKb/9WaMAV0lqPdeirJqx/lBQl8ZCVPUiDSiT5b7NpMmp9HmL5ZrgVBJLK?=
 =?us-ascii?Q?+gTgc9DDov5L8OAnEzbHphijAT+Q+gy3Q2A8NgTf9Aba1a4DTR9Je5vHkdi9?=
 =?us-ascii?Q?QvPkCMU5KlPfX6CNre70xyosmySBJrNXUuWM+PbwsTIGre8pJxpUPD83BopB?=
 =?us-ascii?Q?kL8XXRlpZyt6JLoS+QoxwHrDen06H6trqL5Jidnm4buEMISDGkYqQMpjfUSK?=
 =?us-ascii?Q?AmPYBBZafmFzGw5I3e7M7NnioKVHxRPyaYrFmRg5iBpuyVhG2WHnqDwDLEt6?=
 =?us-ascii?Q?H1cMuB2iodI9A7kQp0wgK/Fe6CCakW546Uy2FPM6wq5ks66DS9qhHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AApksaSQ8Q5CizatJCdHZYHuUWUFzNngyyDqG4zKGuFP1/o/ciTkweAas2oi?=
 =?us-ascii?Q?FxxdrhnVr5eRpYV7et4Ti77RyYz/j5DJ9sUMKMob7fzVVkbxsEL7kLpZm8tL?=
 =?us-ascii?Q?8IOaNa3rBOivztkIQtbtzFyIwkItJISoGJ6QzeKRfPN75Py9uGF+gAgfNvBI?=
 =?us-ascii?Q?RmxOlg5RGQqExXe0CDDl0tn4/iDFEHDbqpxYlgvCx2SlWcr2ArMbIlLrHJYD?=
 =?us-ascii?Q?iLgjx2jgp/n3MJZAI45xw+oiI4yDIdh8u+bIyQY+IXfsmvKW75BqZnVY5Tar?=
 =?us-ascii?Q?Kb7zgd9ypmWP6+wE9A5VOgKByrbyywBlCkXm3aGL+96yjBuh398+u/gLAOCN?=
 =?us-ascii?Q?uS5zCY9Sgt1TwWVJ7KhPvxBzMkABs64TmFYEK7fdbVhLHlN41e2yUaKDzFhw?=
 =?us-ascii?Q?7H8rHVrdKGYxYj8bc3koyOwNFz8VCFEw4LpMFbHGN1YG9u6zJ1GtbZlXyg6z?=
 =?us-ascii?Q?QgQloqsOSNK7LJ8vhV9+wrUI4qtw+4NT7Rrzpjovg8/zEhc7xRT7Ek7iws0g?=
 =?us-ascii?Q?fbwGwb3xlxT1hLdQaa2BdTVjGy5fJHmXRBNiqdRe/ih5S6A++wmmKy1aKeSb?=
 =?us-ascii?Q?5iCBgK0IHfWrDF5N0C2xvr/XhI9tH9m/swi3JHOVzqiEVpnUqAymTy43pkzQ?=
 =?us-ascii?Q?3kVPaGrVvdzV/7W0OiyAh+pq4TfZuZUZ3E7Qfiym2nIUUm0hixEvbNSjedIF?=
 =?us-ascii?Q?uh1fE02EdKA3xUK/0nViGdD6htpuQULgm6f9eTH8isEmU0+h20U7bwIQdsLP?=
 =?us-ascii?Q?JLY5u6dpPVEKOwFG8kFeCfaFeSra8IIeNo7mikJLKGb+UzKKxzOcPComih/z?=
 =?us-ascii?Q?mC9/geIJa6FveqCCb2xDMKSvMTI7bJ4Tl5NZ8w/csE2jmTzerCnJW0XJDs1V?=
 =?us-ascii?Q?GEHu+pDsqNAsnWvb6tRlzL/oKR8xKEwzxmUO0O9Hocngz02l9Opky6MeT7Nd?=
 =?us-ascii?Q?elhlfVCJE3063JyKuxdq8hqGH94o6enoahFXj0k0iyGW6VZh8DZr3hbc4UmX?=
 =?us-ascii?Q?chSx6E0u+mN5D/kpP5GSSpds5E8GkH7lxsVsStJNYpw62iTWZp66yWbA34Oq?=
 =?us-ascii?Q?QumHFXoxwfj6fqMKdsLyQCoWV8ZoeI2naZ/3bWr1WTV7jEOi436CJYzWxahN?=
 =?us-ascii?Q?owdqXX38uYiCW+1rIey4Tka66WDJbQrsSOV7dF3SUsgYa9BirVwjoVbBE+/q?=
 =?us-ascii?Q?sxpBEyFqauTYXR9psECjAG9RB0Sy9hsazDrXTREFOIKOxvesTyax1h7N9lvq?=
 =?us-ascii?Q?63/GinEtq+AsEMnqA4oMRVGMf7gfyiUnOjkzTNy00mR2NKu2R87vKUnhAYUl?=
 =?us-ascii?Q?b2bn9FkcmnLOg6wjrUUR2D5zjTY1uv3gwQ5iSsiWj5daMwGVA+UJEENS1N7F?=
 =?us-ascii?Q?7JE63I6juYRTrYt+90AK9ASDgUzMbx57GWkihq/POiHwdQvNVLu7Buf1fudh?=
 =?us-ascii?Q?t+6pR7p2QjuM0qB6iCN7d5tKxMZ7CcnhIkBWJ9DIe0g1pHNIN+M8MY5tBNkD?=
 =?us-ascii?Q?d+FptZAffD98Y+gKM5rB1YZFv5Kq2j7GQX7RkfQGhZ7fJ5LjDlBQTCdj4NcC?=
 =?us-ascii?Q?l0838zOWzpVlIS6wTyDuqC+grOsCYBLRJx6CuOyY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e8a43-ddbe-4078-d3a7-08ddadda682b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:11.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02ZTW+f4V3o0+xNPiDU2CS3o1o/3kylH9073QnqOVvboAqxDFf9SEKaWuLFxMchSJVxMtAXYbQzT28l2uMySOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731

The following call trace fails to set dl_server_apply_params() as
dl_bw_cpus() is 0 during CPU onlining.

[   11.878356] ------------[ cut here ]------------
[   11.882592]  <TASK>
[   11.882685]  enqueue_task_scx+0x190/0x280
[   11.882802]  ttwu_do_activate+0xaa/0x2a0
[   11.882925]  try_to_wake_up+0x371/0x600
[   11.883047]  cpuhp_bringup_ap+0xd6/0x170
[   11.883172]  cpuhp_invoke_callback+0x142/0x540
[   11.883327]  _cpu_up+0x15b/0x270
[   11.883450]  cpu_up+0x52/0xb0
[   11.883576]  cpu_subsys_online+0x32/0x120
[   11.883704]  online_store+0x98/0x130
[   11.883824]  kernfs_fop_write_iter+0xeb/0x170
[   11.883972]  vfs_write+0x2c7/0x430
[   11.884091]  ksys_write+0x70/0xe0
[   11.884209]  do_syscall_64+0xd6/0x250
[   11.884327]  ? clear_bhb_loop+0x40/0x90
[   11.884443]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

It is too early to start the server. Simply defer the starting of the
server to the next enqueue if dl_server_apply_params() returns an error.
In any case, we should not pretend like the server started and it does
seem to mess up with the sched_ext CPU hotplug test.

With this, the sched_ext hotplug test reliably passes.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ae15ec6294cf..d2eb31b45ba9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1656,8 +1656,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 		u64 runtime =  50 * NSEC_PER_MSEC;
 		u64 period = 1000 * NSEC_PER_MSEC;
 
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
+		if (dl_server_apply_params(dl_se, runtime, period, 1))
+			return;
 		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
 		setup_new_dl_entity(dl_se);
@@ -1674,7 +1674,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
 {
-	if (!dl_se->dl_runtime)
+	if (!dl_se->dl_runtime || !dl_se->dl_server_active)
 		return;
 
 	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
-- 
2.43.0

