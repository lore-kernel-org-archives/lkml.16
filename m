Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD67220685
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004184; cv=fail; b=M73TaPZO8NHYQ+DME6cDwsH9yJFDwGdma8A8u3Ak4+PLwbgTozvZCqF8XAc0lQ8qG+YujgdkW+l3h7SJci+R0IXShMLbgiz9N2gxtTJBG1XGAPSFCyYelm+qIj9tFzj6wLLlJA6vOasiIN0El1fanibAP7S2+LOc3KNf90uI7/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004184; c=relaxed/simple;
	bh=XOPDFubKT8RIoi/Nrc98tdjNL3Sn9z54nrwhKgZorT8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cE3USgWxSsr6++2J5R2txhoaKg4Y19CyrATOq5CHGWFsFcEHkK7b/vNHwNYxFjWpuwafRSzyhpMLwxBCA8Uieal/nLeO/X1tVFiFJtaCacj5xK9I922V1AVjFha00Rb2lJGiCsdpu9X0fFnYFax9ThNNglj/AOo1r2DOmu5VKag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AtV02DCj; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AtV02DCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6pKD39iKBaELkNcwC3sn4AagGXLaI8fJ+hmLia8atryChL4Ru+oL34Jo9nQKW2MeoVct/oCMYCJAyVESfOTSvKPPO48ztVFKsrdsXGt97Tf4XwtmDsAxKfurbTLp4u1jeM29bmVlO4TXz2qJdnb0C5VP/QvsId0IRiIjcyF9ZlZqpMSEmaeR2GrnLlWcXN6pJpiiHfpq8XoyVuP3+tE9zZaOR3Bh+E8n5ZhQaS4iiTsSg9QuY6bQ+sYruA07BqxPQ2lI2Uzv3F2EVqnbYaPCtOrjpPpVHEudLrws2+fapvmcTcZkAw0VZ03BaLkPR9hExsnDuQTvklaPBmnRi1tjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gp1djq+UbuJODCZIGZtWDx6KcJBui8jik1iHMv+uWWA=;
 b=on8O2m1dexflhJ+rK4Ag471G0VF5Fzc1ZCCU+eSLvHbDr4EJO3mTus7ZMObpuc8XGLmv/UcgH9y6q1cuvS1UaGEt4U9nR+kQE2iOFGrC8YcbKdn+WgSWAPix5Td+FmyPZ5/NMIdawZh8oLP52ixdKalTZZBD3Ost0fDeLWfgoyucNL3NEORhAw1Nt5Bx94bhKy1XLyC8QfySQov3JsImuuAHp+T+rgoa3mWFC2Pizp97Blyr6AAeFtNZ0djs0UT8XiMMms+uGwShtAN0k8fjoSJtMkt1FAejaPA0cPw+Q2bujb+ar7mzSnGgMSWuSOi8ww7WtXRJEMzJe/71y+czXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp1djq+UbuJODCZIGZtWDx6KcJBui8jik1iHMv+uWWA=;
 b=AtV02DCjIfNoKn5pqkREIiBl2SpcgmijKDDSIki7ks3t6r0cd5SHH7scvyJN7+O2ZKhuwKbBWPi+rRRFAuEwavEOE9wsCEDYdxA6CP+bUmqHXPv2R+UCfJOAQOqW9H2OltPGqhPXRcYL2SpynxNIVncqkfpz4LJZ6gVo77OzThYzpzcdBHtsBYs6ipYMgIRtNY9lzVDRW2kWDsDzLQgV9O/YWxTRgN5e8x7QREBuOA+sBHUXpS6qNRk6aIq1geEaajk9hw/lv0BEs3FliZHVPzK53fHCCN85O08CTuP0BNZPK/7BUy3WP6NPzPz+9nTGWNcZyohVh8b2Fza2CpraIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Wed, 30 Apr
 2025 09:09:38 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:09:38 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.16] sched_ext: Add RCU protection to scx_root in DSQ iterator
Date: Wed, 30 Apr 2025 11:09:30 +0200
Message-ID: <20250430090930.355732-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::6) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 83992189-c3e4-4bd6-b28c-08dd87c6bc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMORmnS1Qju5QvWgUX0zLDkj3pdLs7Iounwg3Q1NZmtpieVLUikjnytifkPa?=
 =?us-ascii?Q?/GWDDvrTBg57T6QHTaMy07lWKPIk2ewn4bbcaDCO7W3svgcup62G9A3QHcDQ?=
 =?us-ascii?Q?jx6/ETsyG/KV3brqm2V/rMH/JJVh6AYksKlkbiHyftB08jt/6xyHl3aB0fbj?=
 =?us-ascii?Q?hTvN6s1hfHofYt794CdDMZ9i3MUDpisg8AN4TuSo0BR3tn319YMlWLRjKY4a?=
 =?us-ascii?Q?0jfBlYRw30befAliTcDVOOECZKFSEu02PuBq0Lsagayht0scT8c1UwtiaUUX?=
 =?us-ascii?Q?0crVo8BzswywwLOKheaz/veawvX8jpOCZlNcxP/bWC2XPEJ8ERd2TCWSGDEp?=
 =?us-ascii?Q?fCcIuvllCF6uq8T1VqFQEjwKxy5FEqyFrW84WUy5kH+Zvn3Iza3cNV/NqOAc?=
 =?us-ascii?Q?DhWrxA9jWL0YKoQALax120auvq88akv3vMb/fTGKiYwSdQ6XYNn1biinrApK?=
 =?us-ascii?Q?dD4mc0X5bF+dQ10/7kiLeZtVM5BjmsPsNwYeUVP8+hgO0O/GS7rOXoAkE+qh?=
 =?us-ascii?Q?XK3K21bQAjec9NoEOm5X2Xq5woE6Q7KqsmbF7KP84eL90rnS0XcCBLwF7Hfj?=
 =?us-ascii?Q?WQId+NrnoxELSZ2LpivEgm+tzk1Ur8XZjUBSwue6CHVxeaU9zhaF7ieGeKDm?=
 =?us-ascii?Q?XSv5Cv8MEEfvyOUp+18MycshEgTaoNmTHcE/2fnWqucluWKP1lqTnJBgwPnM?=
 =?us-ascii?Q?urikqcn9rtBQTw+2GFvy6ck3AyQf9B28ivHnjgVU3vz/ih9P8axFk3TLZtmc?=
 =?us-ascii?Q?995g0xQHO/yjc5UZQljHkUsqLYQ6d7APvY2WNkzO4qEYxR0bRCOw0k2kYO9f?=
 =?us-ascii?Q?JpcMRxS/CnaaZVGxh1m0OUsf7CCdfIVYhn+JO+k3IMDmcrrffp37vIDteYxT?=
 =?us-ascii?Q?XoQcdcZ+8VyfcRU0yISSTJvutez0bY86YuKZ6FxLgISZq/hCuJqw/pmT5Lb/?=
 =?us-ascii?Q?BdGfNT3onK0oFMhgRY6iwF1G1OlGmJ/jWaRYHkbvumPXmT6Txnw7iz6oe8Sv?=
 =?us-ascii?Q?mPmTmc62SX55/5tUNYpjRi8M5iwbcjmV1hAoZejafYEPIx297e84hhBNXcK4?=
 =?us-ascii?Q?lnlth2hwemfxYNBJ/vWCIXCYyK3UV84OV/8G63gqXvd5rxFywYij3ei4zZPl?=
 =?us-ascii?Q?WoTy1x2raxA2g0l4GAdBM9KIHt9tXJCWlgW2Xk+NZF5qCU6gFTfApXbtYB2x?=
 =?us-ascii?Q?j0Ur9+tJjiADyxBUfCXBX3YaBTlhl6FaUDAT/hB+i1nScnJOcch4Tnm5RBzG?=
 =?us-ascii?Q?w1MSiSyEQ8kvyxQoo5hl5Cr6Ob+Dni/89k99SxsZTJRheIbhgLQ+BjRy4yrn?=
 =?us-ascii?Q?7Dpiu3XItga/0FkJAiqS7WNyEM2ybxjQYhYXvyfACr3ge6NpRhCAejqSULNJ?=
 =?us-ascii?Q?nIKQPFmQB7wl8hzC1XCFbKvCj4OfSHCg6q38TowYA8lTxEflfBorT0wn8hcD?=
 =?us-ascii?Q?qgfp2RwwCJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4iRJHp//taxdCZ6N6qMmRZ1LmNFMoaWZ7AqDGvOwUNpEY5P2D1MWYutqHZk?=
 =?us-ascii?Q?uLIZmvVRorNQLxGRz2+kJWEJtBfETcP/TkbvvjjbDt6WIUZBQ1q/8ewnf/cR?=
 =?us-ascii?Q?rv4hpgLjK67eEw5Mz7kdz6fN7Y4rD4to31GbC0mE7j11qWCmAlWOyHiVspL6?=
 =?us-ascii?Q?cElsx1aI1btwnDTuJblAg8qWv6e+NSCw3fDZ/GAeAYpZZh/6MjbvYpV1363s?=
 =?us-ascii?Q?vhhLVglVz9QoA1Qb5zEkPjv8ucd4CIHz2jVjLeJvhUAf4SWBjDjzQDc8n+Qa?=
 =?us-ascii?Q?WeyAG3NeL9A/Km+wS7o+DmBmpwXSMs6Mtd2PCERLHt+cwJA83lcKi0azQssU?=
 =?us-ascii?Q?5NeDpbChD+gmxIqtRQjwz6tvBwRR+U49u/2Mqsh+4np8bcjPucsE+80ynG5O?=
 =?us-ascii?Q?j0Hjj9uXq2kLRU5M9sa6wnXtCYjnQ+nDJfxecmD0aCEW6eeIhRhstKZqIYAH?=
 =?us-ascii?Q?E1fmuqJNwtFQCIwD6rhn2tjL4HMBmfWa5zZFugHZJ3cKyDh1BNkepjp14CzN?=
 =?us-ascii?Q?ySWBQMnMiIaGU/ZipmLuXfQpfcp4mw1iVt67ur99Y3tELTf/A6NkRX4WVsMS?=
 =?us-ascii?Q?RS6ZyymoYyEShDia0BlUkNHQtByXrUq8GWaMRcXCW32a/YKsEM79nrk64FLb?=
 =?us-ascii?Q?pKxn+V1pdcS7o59nHFLkDkY60qyLULfyejFVS3TAUftxcyIv+AmTztBpgopx?=
 =?us-ascii?Q?pHPiK+vzOo86zaUI+wSkSDbyGXY8GDtL/h5xH5lheHpAQyMk88mUKN4bD6iG?=
 =?us-ascii?Q?9JtfehIlQF5NiSuBkktDVegmQsNsajSDPVLlrDT2/7xHQAsakQRHGLsafX57?=
 =?us-ascii?Q?CwJWOoQBi0mVXiJWBSkEZn2ZdSWpRDwIN/7zr07B48T37bqgGDW/X0va89uU?=
 =?us-ascii?Q?h6LWJHQItpNX3gaGMTR2R/tj+Ab0CD84J/XyfIRpZnpLRQ07GRO2x/sHoARe?=
 =?us-ascii?Q?DiIXzJ2y/mqzz5IdVy3CcHiCxHljdft0pM0eaeRIrkce9NrREwO46BhkvhF5?=
 =?us-ascii?Q?ivM7EtV7cZcflP9mHNluzw5Z6btzbtILyIdPGNoce+ZmqkKv1SLzGVF73u7E?=
 =?us-ascii?Q?BJnkLfaTMvf3Vh+IqRE91NFE+BOpxoksYZPkV/WHi2HwAgzkOjumHuGZizV2?=
 =?us-ascii?Q?FGZ575astZSJ4vnAFeg3kjqg0dn5Tb7blE3QQAR4E0GsWhdu4XhRtkBNizpI?=
 =?us-ascii?Q?QO3PvPi/ZvtOOy8y8HCE1uZsztgpkHwrd0B/6jjptpp/oSw9TteltmS0rzOI?=
 =?us-ascii?Q?11nlUlfEZuFLAheG2lafpLwh3JdhEX3lu1yVtGLdldB0TxDbqV6jBQLDyi7s?=
 =?us-ascii?Q?yKHuTEpMoF2EjQ2AFcux+IchXrPEy04e7wHVkXs0y9NYZofVM2c+M1PGvnAF?=
 =?us-ascii?Q?Y6AVWp7WNsYusVRwzyN2X2W8sGStDNt8fk4TTR73cRfzk9Lj0o7CTSZ8MK1h?=
 =?us-ascii?Q?cXMBWvDw3Z8JcO0YRUKS/POnYyrvMBKRlw5X8H8vs84UJXxhGkg42NN1CT0T?=
 =?us-ascii?Q?SiqQwgA7Re68c7XXO0gDsG9HXz2x8a6TBBiY3v2oJBdepavK859r1QalyhZT?=
 =?us-ascii?Q?c5rXotdWFWL/fo6g77tamxUiQPPJD4HrfOhOgSoN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83992189-c3e4-4bd6-b28c-08dd87c6bc36
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:09:38.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4y4LO7Np42XwnURsu+KRGiwT3h5WM+yWgKhUc/za1WTVyD3svYPGmCkeq7VGxYV3J7fR3jOgayMJftyHqTuXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

Using a DSQ iterators from a timer callback can trigger the following
lockdep splat:

 =============================
 WARNING: suspicious RCU usage
 6.14.0-virtme #1 Not tainted
 -----------------------------
 kernel/sched/ext.c:6907 suspicious rcu_dereference_check() usage!

 other info that might help us debug this:

 rcu_scheduler_active = 2, debug_locks = 1
 no locks held by swapper/0/0.

 stack backtrace:
 CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-virtme #1 PREEMPT(full)
 Sched_ext: tickless (enabled+all)
 Call Trace:
  <IRQ>
  dump_stack_lvl+0x6f/0xb0
  lockdep_rcu_suspicious.cold+0x4e/0xa3
  bpf_iter_scx_dsq_new+0xb1/0xd0
  bpf_prog_63f4fd1bccc101e7_dispatch_cpu+0x3e/0x156
  bpf_prog_8320d4217989178c_dispatch_all_cpus+0x153/0x1b6
  bpf_prog_97f847d871513f95_sched_timerfn+0x4c/0x264
  ? hrtimer_run_softirq+0x4f/0xd0
  bpf_timer_cb+0x7a/0x140
  __hrtimer_run_queues+0x1f9/0x3a0
  hrtimer_run_softirq+0x8c/0xd0
  handle_softirqs+0xd3/0x3d0
  __irq_exit_rcu+0x9a/0xc0
  irq_exit_rcu+0xe/0x20
  sysvec_apic_timer_interrupt+0x73/0x80

Add rcu_read_lock/unlock() around scx_root access to prevent this.

Fixes: cdf5a6faa8cf0 ("sched_ext: Move dsq_hash into scx_sched")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 1ee5a0088b1a1..d2856529711d7 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -6907,28 +6907,39 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
 {
 	struct bpf_iter_scx_dsq_kern *kit = (void *)it;
 	struct scx_sched *sch;
+	int ret = 0;
 
 	BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
 		     sizeof(struct bpf_iter_scx_dsq));
 	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
 		     __alignof__(struct bpf_iter_scx_dsq));
 
+	rcu_read_lock();
 	sch = rcu_dereference(scx_root);
-	if (!sch)
-		return -ENODEV;
+	if (!sch) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
-	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
-		return -EINVAL;
+	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 
 	kit->dsq = find_user_dsq(sch, dsq_id);
-	if (!kit->dsq)
-		return -ENOENT;
+	if (!kit->dsq) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
 
 	INIT_LIST_HEAD(&kit->cursor.node);
 	kit->cursor.flags = SCX_DSQ_LNODE_ITER_CURSOR | flags;
 	kit->cursor.priv = READ_ONCE(kit->dsq->seq);
 
-	return 0;
+out_unlock:
+	rcu_read_unlock();
+
+	return ret;
 }
 
 /**
-- 
2.49.0

