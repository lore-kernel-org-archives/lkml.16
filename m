Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016062C0338
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746044527; cv=fail; b=Jy4MQL+UP8BQGJvOak75hJFldcFbyLcwGMnMzBtSV4DtXELmqyhGj2Dhwsc/NoAr4s5rKai6EarmYciw9tzKJJ9WIjrzgxUT6iDeyeLx8elpQZA2157nNQYc33hYPDHKMQfFYcG6l9ka1yNepL887muXi/Fl3lAnyAAdk2ZODkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746044527; c=relaxed/simple;
	bh=cl5JfOLueKurQROV/aWEZbCjUz0txvb09lAhgucfwuo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TVv3uzffQquxBoCjHzwTUGz46GAESbme5qevE3GUHzDrnbKuLthQmODifNWVXPmATfUVndetxx/FrzVRZ+h2l42NvWkwLOsX4++HMx2F8HHiwFOVNVGrCUVk+M+cQfv0Md+iaHRnfP1SsmfVA1RN+gRtWLlmwFr2diANSuVB0i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rwbyQLYY; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rwbyQLYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdFxfHC0tMkJVfxuUz7coRxVsTFqMYQ3zJEfE22hYPQCa93PAkYX0ViEe6x5BEOF6dliT2Jyi/WDPoWmW3IXiSOBTEGWE8Bk9nCzlztN8OdiPMuy5+s9TPUiYO+BK+mTYC2iLjwPmnB6lEo/c1KPSAuAg9GMzNsYohxild5FSuySimz131Uf5PjSdKwcfplQ2jwRfrjn4lkwjzC09VGAOMsins2l3hSQO52uckkzcXRyXoaA8MqxVwPNWHBP1C4iV9jM+FyFCR/q3UdiRGHcddDccxWugH1QXmWBveyQ7ltdNPoFYIZx1TZ3+QghWbv2oQy8DHCAoKZM+BUFDSa+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EOHwJ8SKafLPFLj/CpDzhxrygiBxu6gaNMavbbSpYA=;
 b=Gp43Cx/eHH9JkZFNQogeGIl2cC8G7EKNK6/ChYdhaIUJWddpTg30TamszeL66ZwCF8VppS2VH8FIUykoUc3HSzJMK04+ziJvT+pvvd2ZGWITlIJwB/SK0N7L8FfRxhPBW86aB3w7Id6S/s1su5RAitYNHz4+DVfvS4GeQcByCn0c/QujkbKuRjv0wNY6tL5+47gXLn5PNlBVtfBKJOM4wUFNjFUf0vzspogLqH8tTSOp8qyJjAQ6D4ceOe8D7P35rVtndbVRlGgvtRAYiJkd/Kcbrd5jaGnklFuuagnTmsknKgD+0GtNkNU49OerDGJ4WRHGCg5FEw2ldAXbAT4ljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EOHwJ8SKafLPFLj/CpDzhxrygiBxu6gaNMavbbSpYA=;
 b=rwbyQLYYkEoJD92X74dHyUPlaq7vFPNcbZzWIfgLGbOUZkFV4knNdHFdjpKk6oMS07Qt/His72uey392bGBepMfN10OjGCYw1124jar7ShX0OmMK19+vZJ2Ml3boMjVKBN2/wxR0ITSM8AgRPVOu4y8DurOdI8XIJuZaq7Or4CkrBcZ1CBXHNLrAZvMwHKcrU62kwl6LmRhffvkMERRvlCOENH/bn/VaF0di2yZgvpLuLA/26Ta+9qJPtrrlqFJlrqeA1GGNv3IpE7z8+ZUHKDTGxlSV86JKaV4Co+SvaCt58j0hCBMXK9g/XjBsVMVyMeyOo4Leb1loNVcdW52jUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CY8PR12MB7756.namprd12.prod.outlook.com (2603:10b6:930:85::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 20:22:03 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 20:22:03 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 sched_ext/for-6.16] sched_ext: Add RCU protection to scx_root in DSQ iterator
Date: Wed, 30 Apr 2025 22:21:56 +0200
Message-ID: <20250430202156.418769-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9)
 To CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CY8PR12MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4570aada-111e-402d-44f2-08dd8824ab82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JlI0P9njbAfUdgZeeqR+qsqd2rF2pxrUPXC26vYHP72u9JWn7eRPDP2tpbDK?=
 =?us-ascii?Q?OlhA6OheLKd51YjJBAtmmCOqBUXynLwrm+686E93X0jLThpkD8X64YtU5yv3?=
 =?us-ascii?Q?PcOzmv5r0Zbu2PC/yoISmiMpA4v2mJzqZ4oz7tXv1z7ZMIuMnTO+XYeHK0C8?=
 =?us-ascii?Q?4haBB8JGjyEdhAboOYKOtiqjfcErUAOvleGocbG+9X/b5MmJu2KtprNp1U9a?=
 =?us-ascii?Q?j9yfBZav3KbEJCy6J5cZyTr9RJ/Id0bHGDUc/VK0cFutcyz1pKKAjAtqWMg5?=
 =?us-ascii?Q?cOfBb5MVwUagwney6XK1ilt8gFNVs+gaAAp9bnKGHKToy24q3DA9Be166Ozt?=
 =?us-ascii?Q?cbJnAI5/IuSNUQmf+UtUqndEqYEEO1Ab5lp63ZuI5goq5wdPh3ML6l0LKkqI?=
 =?us-ascii?Q?Q+vtnO82AvvDjVMy4+CCLLwL4jH9G8pjNMpQenXi2Pghg6MFqygyKUNKCKJA?=
 =?us-ascii?Q?autkyZS/noWfBFhDXzZYPHxEf2u8x4Kj2GfbmnoDUqupipk01+vbEeGCNuLA?=
 =?us-ascii?Q?3F4uf6bxudjwd69ek7z4rpyVY6IoMKyTF2j17GoXZThBao+pxvakxJ03nNsn?=
 =?us-ascii?Q?dbMXT6a1VYcq8qd7ggCmSVH5tU7z252Pp+AuUamrH9sGr6djJysePDWyBFKT?=
 =?us-ascii?Q?vdaYCJ0idofRPRexipJ8W2qFpeFQtmsVE3meWALS9SF786GUJdSrsDA1tiTM?=
 =?us-ascii?Q?dbCWlgHeg2PoNPQqMr1FuXOC22fDW1Mdg8ij4smUzWpUUE78V2D+cNQEMvt9?=
 =?us-ascii?Q?NbjFGvsbCuZEP6qkzlVHmA9hspXZMbrLObUmeQP9ffzhqWGAnqU1SO/AjiHN?=
 =?us-ascii?Q?6IReaSL99vypsuRfdnVwTu3TzsJ/yPG0fK+r0XWgAw9UYgW96qEu3y1oFZi8?=
 =?us-ascii?Q?+DvwNFvK4Hm7czAbs+4QQtevqNeIlhM0J2sta0Fze6MXP1ut7aH6BdMvK91x?=
 =?us-ascii?Q?JU/UHWhntAiMDqfZKcW+S6nJSRR0PN0cetT83f4cFsUSkgCtCwsqQjveucTE?=
 =?us-ascii?Q?7xQeL1eOBkB78tiv3wggTKq01Yv9gUBwKs1Yab+ZYNwoDHRaqVMo+LH+Vkqh?=
 =?us-ascii?Q?uX8iNhuDLUHLbut18BiBrVCM8Fvkv9/84f5dQAAGoN1NZ2ud6zEvdZ+GNTD5?=
 =?us-ascii?Q?CwhSlW0Gd2Ubs/holOGymGM7mDZtx4FoDEdcHMdmwEUIRa4MbOz2Iv62R9PA?=
 =?us-ascii?Q?ZKmUCqaDfHuWS862i7LBR2eNWDfyil1mO5DQ+5Q13uMGlCgwpjcOpjtGwe3e?=
 =?us-ascii?Q?2dhDfH4WaDzr9URVFBW/NIS4ZwT5H0Jj1tTT2nhbPdZifMVxiwlh9ER/tle5?=
 =?us-ascii?Q?ZtF0IZTpu0AAbqRXIJHAi1V1yo/7r1wgG5e1z7dwAELznEoQXItPkQ7YKzIo?=
 =?us-ascii?Q?KRMaYM7YCVith/8v2uxzXFv12EUdQFSOSAWNGNbtUtYqktZLPimncgJCGg9U?=
 =?us-ascii?Q?qwUAqhrHYuY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?chvUKf2bxfzg8IEPEwIL5PSIFGn+uZMOtL5MR+Q4YDM/iDLREud+Rqa3irV1?=
 =?us-ascii?Q?I+s+JPibdmu57sgShppf9l0MScWmMsuXUx5Htd17zjJuaEikzEZjtrRnRXnR?=
 =?us-ascii?Q?vP8D76DkVTRNap78iX54nA6u0gZiVl4mfxWVkpWW93Oyw2VIPM/f9/cp6i+U?=
 =?us-ascii?Q?pfrnTUjRboxv3Z+YnCOcG6/NEfU4gnOMecYywazRzlJ7Cy4yv8+KwR/KBvF6?=
 =?us-ascii?Q?TdLcNkq6B0BoXoXC2WKTIHlnZd9nsRG0kBe8xzUil5HLIiaTcjwxQNp6cO1p?=
 =?us-ascii?Q?i9cB7tgiDziqtq24Z5FUjW/8s1xbNp/M875/xs5vpEiDuCe9PLUgqi253s8n?=
 =?us-ascii?Q?R4Qu93JtSrTaxg1PhyJ+O8kS2O5qSs5p/zn3uNxAoYhg8axLwMmsPzuHw7ak?=
 =?us-ascii?Q?/ZJaUj3YBUP7AjvvrmArG1umexbE4vgz2+xC9A/dvQBtr6nEyalYyO1nrgtB?=
 =?us-ascii?Q?krBXLn/Z1mrkLB6/DDCE34LlVpS69LqR6gLiq3leUjR6S1BmU4hJrVangJ/h?=
 =?us-ascii?Q?ZruW6kctIjuph35/YC/TE1pU/NmQgi7DTjoe5nE61vbise3ABD5U7uh9A5l8?=
 =?us-ascii?Q?OnVHsJracYLZakfFmWI6tiyRndtZIo4HyLfxVS3xgJrBLJGSkPt/ESZRRbfl?=
 =?us-ascii?Q?3OZ2tfh7UTZOa+wcq0LADo+cS1qCitZeA5wVToBlanJ/7PUViEptrCOu3mSJ?=
 =?us-ascii?Q?ZWDIRAhyR/7fuF0lnJVjx6W449NaKQhp3qfTGSuoZRvwLzV4f+3m+kQlDGo8?=
 =?us-ascii?Q?nLc00IJNKdq+N+jPvWoB/xe8V8iSpLWCNBSy4rZGt38elLjDaGEqMNwA0d39?=
 =?us-ascii?Q?vdkqUvZn8ClzRhxL102dB0dkF3Im7ciX6kiBNiH/MNwaEHu16+lVAb0YLac0?=
 =?us-ascii?Q?hcVcP4BDaa2Jy2kUpn2A2+IYCfVuO5tPPK/9kOIvTPm/xrOdwPi/CR3wI8su?=
 =?us-ascii?Q?98E4bSq+p8mMXoaESfKuZ3mFECf3TNxXSo4rH48xTLm2orIdOaUeMKsaSZ2i?=
 =?us-ascii?Q?29LTIF3mI+UVb2QLtV0qshtBBAWyuCOIV3rVNLGzJ10chlk0YajcwPDjB6SP?=
 =?us-ascii?Q?nSWg6DnL6HGukGdQYnPr8EugrRH7MtXbla8VsViUHTY1fU2mOoygKwxCZhX1?=
 =?us-ascii?Q?+ItNa9u/Ajt2/ZRuN4GV+27CmMjj5QaW6K0O8+Yzx1RTxHlgVFBPwATCrm64?=
 =?us-ascii?Q?kQilQGFJVOk6wsoz9KmCtXw4lN2AtHLRxemzSbdPwCZw0LsuByvBmTICqmXF?=
 =?us-ascii?Q?JkL1hoeAyCEn27gF2xTSNPE4BjDQoZ6fUWK4Ef7jPwE5RtR5o5kUcronnXeK?=
 =?us-ascii?Q?Fchmxt+/rU/Rc+N4Z4ZiIWzrHqZ9oHWAKN6MpiPSu3xxYVgFyawLmiKY56jW?=
 =?us-ascii?Q?YyC+N9nNy06Q2vI9j5s0WflxwPfbH322t0gKsDc7oRSCopIcPZ8Q4syBVtHC?=
 =?us-ascii?Q?wQdKsXDHwgHHqB6X6FH56jq2+8v+JmUpt+mYDl/XEP1J29svNZSSXCkLOQp2?=
 =?us-ascii?Q?W7zvpMTHlRUyLQr0HaO05qE49gZ3qvZxfDMhRsHIL5VqQtPZX3MpvepuQUfS?=
 =?us-ascii?Q?SxuDFw21cXnKYfAeMLG2ULtuSAvTXuK66OZ+IwHL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4570aada-111e-402d-44f2-08dd8824ab82
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 20:22:03.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l37PBPj5zr0RTvGEkaIXl/Aaq6rg0q3ipn3jn8GlQ20pJcDV0KY1/ftUa1ifDOWnPaQUePUZou7dA9iuJX+rzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7756

Using a DSQ iterators from a timer callback can trigger the following
lockdep splat when accessing scx_root:

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

Add a proper dereference check to explicitly validate RCU-safe access to
scx_root from rcu_read_lock() contexts and also from contexts that hold
rcu_read_lock_bh(), such as timer callbacks.

Fixes: cdf5a6faa8cf0 ("sched_ext: Move dsq_hash into scx_sched")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes in v2:
 - check rcu_read_lock_bh_held() instead of adding rcu_read_lock/unlock()
 - link to v1: https://lore.kernel.org/all/20250430090930.355732-1-arighi@nvidia.com/

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 1ee5a0088b1a1..00e18eb072bf8 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -6913,7 +6913,7 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
 	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
 		     __alignof__(struct bpf_iter_scx_dsq));
 
-	sch = rcu_dereference(scx_root);
+	sch = rcu_dereference_check(scx_root, rcu_read_lock_bh_held());
 	if (!sch)
 		return -ENODEV;
 
-- 
2.49.0

