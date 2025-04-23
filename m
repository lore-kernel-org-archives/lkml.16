Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880541E04AC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745434875; cv=fail; b=UEOglmzQGZ8CHIwjXT0J4z3hmOCB3VYYKChnMVad3K5vI7FkQU7HGwqyxI/KqtMLWVz4dMyMPBH+tjg5bYGYhAmZYfl5Z7aW35XT3gjhTilnc2VDbjmLRW9LLzgOSj2Tbo+JA+iTTkP3U6P792ntkjBS3pPVd2F30nwhYnaxyqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745434875; c=relaxed/simple;
	bh=TaHKzbb8SieM7HIjUyWP/ovLyjhp+FooLtuh6Pg7fLE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uvSsQtkU3oh89IVF5B7gAdvPWvq7oTL+TikVRTLdmSD1ObF4GqVeybEu4/MUr40xsmUMWgFYXDFyuXpDsJSZGiabf0g8U5Xy+ybxQsmLY70dISelkr0LqywObOex8qWpmEzv/rreSzSWcLPIByFws4pbNQlpWoSiMnbahLAOpQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WzykStuD; arc=fail smtp.client-ip=40.107.102.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WzykStuD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNMtAE7ZVoYGpozAvJEpXV5j32YL5K+bvJ5qL+GfDddLytOCh4Qa0NDQ95fPpv/7lk2ESZUT+vvki2yiAzXHAAKKnx7pZnbvyn3uw3i4ZJzf9F2dyp6x/lIt2JHx25uuZviSo/7+Vy0aOvavi+JgFfOkIK8MRmjwR5LPGLhmRDx0H5QCQr060Iqy4kJ/BOEoJslGPoXfrv8IAo1QFafC8NeHB6iPnRugmmgjRCeofq1YJQL7503A70Z5cymD2w8T6PYzfzy/CtqHebN+ZsNRzx3t2TcpaPSshzkAmtdTOxPIYMmoTtPCIR4jxckpg9ByphoLB1KKIKNqSSS5xwRdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fKIAdH9lP+RDLRiAIgc9CI8kSOhPyvX7WIIlWxFZl4=;
 b=TVSWxRfNXugEZXJVNHlUSmKp4hycMulOoVCt4+V5quCmSwTQLCeSK1h178wDYGXm8HXtFpQwhQuunuX7pNoxt+Z6r8HXmOIJf5m8aPLM0oAlVVpwo1pZiS4VO5ps0VjMpTirnvDW4tc7FJHW8AD7AXSOJAsDqhK9Rmo1mi6KDrUNSHJZN1xPFDsThYqgUADW+jf6suyR3GCXEXxZr/5d46Ja7UESrF7Jh0bnA/3dWvWfKtIZiaKDt6jnVclpb21ewoHeOFWv9kQF/TbOUFmkmW7OT+JdOcCPNpb4XUd+7JcwQBa870DVZcYx+KZR2EJG/mwGLtGP2E2O6qMth69Zjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fKIAdH9lP+RDLRiAIgc9CI8kSOhPyvX7WIIlWxFZl4=;
 b=WzykStuDgEyhQOy1idrCd4HvWjT89i4GDJsMvIKkI8RhO00wJ+IA4nkArelQcwvrI6kWfIK1Vci3GmyOGzCe2vt/YgAX7z++IqPufjnxUeLCDGwoLlhtmDggg5lBa/PKhHw4TF9jeE4K1q+cdL0Jj6FXwhq3I27JZEKyDeerWWh8BtD4myg9+WvGtnTxaRhY4aksvguRt6K9t6bSif0etBrD1cl3dFOn/XfMVSFRkmJquob0Kg2cOfuq0f8CaURzQ26YnB2PVhX2S1j9iDHQU43E19PF7lReLNf8PF7XS3XuV1bSuAvtqnbPcQxV30aXTHfWMG+qq+6TDw1xYFtVHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 19:01:09 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 19:01:09 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Jake Hillion <jake@hillion.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: Clarify CPU context for running/stopping callbacks
Date: Wed, 23 Apr 2025 21:00:59 +0200
Message-ID: <20250423190059.270236-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0177.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::11) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 211b8f57-9849-4f6f-adc2-08dd8299353b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1aO2m/Cu7Nlipc3mzD0Yi9u1e/uwlpo2Lzyn1CbEEnuMzhQhRFGKMqKPBmd?=
 =?us-ascii?Q?M9I8/CVolMxNf8IQFulr/XiCMVfS6QOzIsPc+HP74sS54SDQneRy4gZoxe/7?=
 =?us-ascii?Q?mliZ3tE1geIXsq1C6NMRL/MXEShw49aO02eabcDyDKUSoCQlRsbWdL4mMDe1?=
 =?us-ascii?Q?1zZWGnfcUssXS24AEGMFKDO5d83SDrPbH0Fg0scM5Q9Yhi8L+xuiQAl5wxm7?=
 =?us-ascii?Q?Jq/WmIiBaMZQgetCnKZ47XykD1HkxgnRTq2q1DcymsVJz2A0KbR9YWB05gHh?=
 =?us-ascii?Q?VD3Iiy56jeyRKtm1XkA75YHK+zuzKrbWpe+dez3AzJXkifG3GAPad7AiWt2G?=
 =?us-ascii?Q?6Tr41aaIxwVtsegvhzOPVuOGB2wA+xQxWUj+THfQhbna32wvACMSWo29o+oK?=
 =?us-ascii?Q?09PqsFxXdRig95VdrL7/qN/GozpMI6jVV7RobEgNAZBY2jNVqCa2cX/5TPxN?=
 =?us-ascii?Q?xkecvtczbg0ww9yCl+d/iFfcyJo96zD4UL0psWyjOmcN/aqCBjVmlOWC7d2j?=
 =?us-ascii?Q?hRFEpbqOSzuEwoqH9dh2mOt4AMBhi0ynpymb6JPt7E249tcn5hM8SiitDax4?=
 =?us-ascii?Q?stkmf0gmHiJRhnWvFe74ntDmmZ9de534Y59ceazSNYwA4Ke8uEylqiRE5Nry?=
 =?us-ascii?Q?Lhlz7mb5p5mDLqmDoxVRw0mzDaXXZSCyQ+P+HOdqX9mmn3/TL+08qH9dFnUS?=
 =?us-ascii?Q?GdtBJcQUA2M9khS4MpZyp+TNDKaG+NY40M428ZccDdHx3vsm5jArLVhdPchw?=
 =?us-ascii?Q?MhORqARBrRXN8D1dDgKpMROTRHeWFJzogzSN/TWesNOEEmLa42JqAHqrW1nc?=
 =?us-ascii?Q?w4kmddThjjovXObOEeFnvlS+stYmM77jxW2RB2vX9JoaQ6af7M3f3Fkkk/N5?=
 =?us-ascii?Q?AURNk1X6OlCWn7QkipHcOQzQgXW+ARYlMRNw+1kZeWpujyE9ztuhcXQkS0hs?=
 =?us-ascii?Q?TgKAs3+EQ8L75iK+k22ywPVH1ydcH7Q1wzIfZn/uuTUuiVNLaom9JOuKMLJU?=
 =?us-ascii?Q?WNXSKo/c1MyIxQVx2I+DLBOPtQntZzosPdJNYjewWGGHBeJ0Rl8n2gdlx9Yp?=
 =?us-ascii?Q?z0GYb4gzCUlY4Si0J554xV7IQufvYfIrYHB0VbZTqKHh9EYTU5PXuuyCbc64?=
 =?us-ascii?Q?Mi/cxddEjr4FLwuZ8TQt1ZKP36aYolyOixc/ATr0l8Uv3YOWMiBlbSvYPX9f?=
 =?us-ascii?Q?TcespL2454rBSvjs5I3V2qjJyOpf7QYQncn3679oyqGZSRTgbsTwo3obt1BX?=
 =?us-ascii?Q?dQ3zL/a6LR1DvZafQFt36V916PC6HZhAceSNSgmllRM857EMMP8giXKekTKP?=
 =?us-ascii?Q?mzkilE+FUqtu/WquI+35gKQhwc/Gqm6CGq7x7977u6hPBz/zp6FlsRcciloz?=
 =?us-ascii?Q?EbnalHFdJLUdIDxiB6iIxpEXXBzyeT23airgkqjbnxwh1jLxVKhhwI3BkZPj?=
 =?us-ascii?Q?x2Jv1ClAYpY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?923TnbSqsycUM/qNHsHrGY2D+6W/11eSzaBm3fw5m1s4DTCWO+cSQs8T6ZEj?=
 =?us-ascii?Q?CxGAx/PbtcfIBHyX2h3lH7ZHWrQ/9FOdFOv6z33XvTS6ydTR+AK9XAhIVoW6?=
 =?us-ascii?Q?OYLDbw4yJBunHICsUDTItMiQV9KvQILDs+x8kP1kpbcIE+gKiXJQVjetVbE+?=
 =?us-ascii?Q?o7e+3L22lJS+T+90MzVbtWIjjSIdnJmOKbNhRy8CATV1XMIJAkOMTpx4vlWM?=
 =?us-ascii?Q?qubTMrChxTM9n+4utF+C6ceyxsR9zwkJom18XWTfgaIfA3MFfVyShnIZ7HCd?=
 =?us-ascii?Q?lskSygWXCV5FVojVzOgfS2HMgM2zN4R/8wq5Rx7kpk21pEFpBmrM0GMDJKZX?=
 =?us-ascii?Q?pmqnYDtwlrADcuBQCJGaFuOmYw6Gej5Eez56NFSwV+rc+EzdNZSHwd6AOdyd?=
 =?us-ascii?Q?wciB8RueNDVeXOyOlBCTyKhWhALoAdUTcMdxshLacBoKS7WMFZOhmakLgOgH?=
 =?us-ascii?Q?XIymTsAz6z+/nmNsIb6aRfr6Wa95XM3RvH9mfnarEZL3OzBQtvfhToWevycf?=
 =?us-ascii?Q?GScIiP4HEXsEUR3Wlgj3PIy8whZaI5YY9uN/WY5KYtRmv5pjdvvNqIV+gJP7?=
 =?us-ascii?Q?b+d0nt4g0gqRmmLr20EOEVvrY5AxZ2BeS2lPWiqOHnPDWt47NjwBJ7ZhAzg0?=
 =?us-ascii?Q?+SCccP2yDpi7gB8JzJNCIRzlYib+4nZlw8X0vJaUuJCxfMu1TJD4OgegHnlw?=
 =?us-ascii?Q?KMCuSu+8AUexR8jwIGt415WASw0cBMUf9EUNZ5KCVRXu8iP8qi7PiO5pYxnj?=
 =?us-ascii?Q?WcB1qpWKDHljFQoo108YZ7ZMk0+qXnobxLdQIZYFqiZ6rcf1NC/KLwCvyZSg?=
 =?us-ascii?Q?uFZNOKJ5U8rJE9SzjAsAmjJJvp3OOTuMYqo8mZN13mYsOLQ8/BX0Oa5OB1Gv?=
 =?us-ascii?Q?4ukm8qsvZI6/RO1mKyQfanxl+yZ1HgeA/baUmjjtBvgJMgUq71iWiKzpNWXx?=
 =?us-ascii?Q?YOkb7VIa3Fn/VzpnfGfuKUb9H578R4Ja+5zpfLeKnibTL/PTKrt5RioHqJK1?=
 =?us-ascii?Q?ZYFKzERhQR7UO05finiWVe3fmqd7B8gXseZskzlB3YA0XIl3jh6QEg8e58wJ?=
 =?us-ascii?Q?PrelIIrxxtTUn8rGY42wMNrgPdPMQ+TBNe20+HsFo+GKn7l3HbxDrdYrZDqF?=
 =?us-ascii?Q?p1Z9l293dMFlmeb4viQInWM/5TP7AhfrGI9ALrEiOaEM72RTc/jHXrAG9SSm?=
 =?us-ascii?Q?Z1095o198Kax3CDG6aO/uzMLVO/BR+nzBBJtU41mVr0VpZO8Nj5P7XLUIR63?=
 =?us-ascii?Q?JCsSHnu4kesXBRK//GljMtyWMZPm0tFPQ9NxGZvKd6BR+a62CKRsr4hnxEk2?=
 =?us-ascii?Q?POTBKDpxL0kHw2P/S7WLX8rrybwPCX87F/oM1bU9tUC9riou5Bi2PRpIoqTn?=
 =?us-ascii?Q?1duvwTLIFRnbu97px+qHc1qGKxNmrXRR8C3yIRtTQS9+m125sdbzH8LHtF8A?=
 =?us-ascii?Q?IDHvzVRM6WxFOAJSNrQyU+6TQ411gpQV+XaFPSFPLTmnbc6hXINQ1UrPLByA?=
 =?us-ascii?Q?MDxKovaWN+5Rg0eAT4unqpGv1v+xtmFBQtDeqc2urwZwL4z6WOinHNQHsJX3?=
 =?us-ascii?Q?zqv6qgUSVPaVfliy/8GV4xLKPotuXa1KdfKJRyU3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211b8f57-9849-4f6f-adc2-08dd8299353b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:01:09.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEAQ5BBRA5XQAoZLTD+XmA325GVqcYSeIb6sZd6EEdFLJXRAtJ3mVKXLHuG3a8O35/bQwTpHQfZBs7Uy3TvKbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375

The ops.running() and ops.stopping() callbacks can be invoked from a CPU
other than the one the task is assigned to, particularly during affinity
changes, as both scx_next_task_scx() and dequeue_task_scx() may run on
CPUs different from the task's target CPU.

This behavior can lead to confusion or incorrect assumptions if not
properly clarified, potentially resulting in bugs (see [1]).

Therefore, update the documentation to clarify this aspect and advise
users to use scx_bpf_task_cpu() to determine the actual CPU the task
will run on or was running on.

[1] https://github.com/sched-ext/scx/pull/1728

Cc: Jake Hillion <jake@hillion.co.uk>
Cc: Changwoo Min <changwoo@igalia.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a2380a6bba210..f146e678cc261 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -373,6 +373,10 @@ struct sched_ext_ops {
 	 * @running: A task is starting to run on its associated CPU
 	 * @p: task starting to run
 	 *
+	 * Note that this callback may be called from a CPU other than the
+	 * one the task is going to run on. Use scx_bpf_task_cpu(@p) to
+	 * determine the target CPU the task is going to use.
+	 *
 	 * See ->runnable() for explanation on the task state notifiers.
 	 */
 	void (*running)(struct task_struct *p);
@@ -382,6 +386,10 @@ struct sched_ext_ops {
 	 * @p: task stopping to run
 	 * @runnable: is task @p still runnable?
 	 *
+	 * Note that this callback may be called from a CPU other than the
+	 * one the task was running on. Use scx_bpf_task_cpu(@p) to
+	 * retrieve the CPU used by the task.
+	 *
 	 * See ->runnable() for explanation on the task state notifiers. If
 	 * !@runnable, ->quiescent() will be invoked after this operation
 	 * returns.
-- 
2.49.0

