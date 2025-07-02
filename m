Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA6227876A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499027; cv=fail; b=TPOcfG5G29hVvUvxn55li5gMKphv5PuDRFwd/DtRWVFa9p6OLpYIFf9YMSWnPMBImmEIhfAKZ9/QaQR7JhDqadues4OWi9a0cTw5FiMAUzH5McVWogGVhU6L1GhzlhBPjEqfmzZzAJMbVLbbD1r5uRJLywzgaR28BXWQMu1NW0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499027; c=relaxed/simple;
	bh=uZVNTh+QhqxSyRPAIy6yIwTi+yCvIVHCWN6hrSA8LrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e0EMPKiBiR+fj4CsXluwU2nILqb8TvRfULXvdC2DXRfsRMUpcK5jENIpnVv4dPOFEaROPdnpqGLrCJHG7dNVNbT5LH+aDhrMMPV9MAGk5QzNE/VaJxQo/8Dad/7fB1PQksD5NTM3z95uxWIGAJLen3PRkEaAf2spH6TTmLB8LsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=frfxDOQQ; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="frfxDOQQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIMvZJWzbvmDLM1p74tKa5sI2tL35Ivh1vxsN8N1yC2C23gavK55iV3K60wfFva1vGhzRwNWLBo1+BiMo0FmYq+33UYtZV8R2CUOpk2ijEQEuiiEStmZ/ZO2LB/l2ImZHQ4Dlnk9IlBk2apuNz8taDxQ2Sh9COpMQ6AZ4oK8DHEVllWyvUQW9WXmCl2StM6jd65cy0b+6wV8UipD3ZxJPWyBzUlMVHRxFNPQtNh9gRNLmmowWUhRpvE/xJ2UFkn6r15eb883HJjWHhBqRrYnIcPxTSDUx/TdYgj/X9ah+yygnTPkZMvmxLP7J0jj5hQEAdRdu2D66UGDdke611BXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EooeNiZCrDVPdsPu4VFdtT69ODII/KQd6yeDJfpKx0A=;
 b=Yt6Kqj9mY/YxUdns9X03o3TLlsFW1ihrGPax4wrXt9CV91kdTW/H2r1I4mDrsZKnB1mrPDE0JewxAXXcMRmyCuA9egF4LIUuTXvl8YtOP+pC1BNphlUk+hyRo4xaYHnD/DnLoH14zP6fpCAfo19AbaWw8h1QqUP/oct8IBOgusF8eIIlCGwXp1vkZtBYG61AjbU1qAj3PkWjBg/vgU/VjjF6Xmpsm3PkbgpNXmTzhkk07zP0TpKqQPU5gJC6j1AvGc1bT/Asdjot1Wqjhnumb+fkPhU16va1x45Old+IUQnV11TVz8A/oyNISb0lhC6emWA79Rbsg5cU3tdakIvsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EooeNiZCrDVPdsPu4VFdtT69ODII/KQd6yeDJfpKx0A=;
 b=frfxDOQQv3cgGHvRaGuFlq1ciYVuoPuuUlXVyvb/PhkZ9oIoYey/UDPTgMJ+M/S0yRlwmP1ujAWoYtEL3pZsk4QwUqAIF3GOWCW5LPQOh6OOtZw8ZU1IiIvYKNSXpD4LT1CIPFSUgreqH+BdMPyRzfyhaCCVoiV1aO3TWn3v3168fa1Nq71n/D7jpbaoxWHe4roHEJVAv5xEmt+UuBPIRofNR3kArJkYjVVqHY+QuuNLIE57eoQ4wIpqt66p0Re+H2zteYPzA0DL0xe0lSURlwopcpdkQmU+Iwhcql24Spmn8Ah9P01lJNWrS/mEpCEJsqCl+tfniK37b+OxSVOIUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:22 +0000
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
Subject: [PATCH v6 13/14] sched/deadline: Fix DL server crash in inactive_timer callback
Date: Wed,  2 Jul 2025 19:29:38 -0400
Message-ID: <20250702232944.3221001-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:208:32f::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1f4524-def4-4e03-35d2-08ddb9c069cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+FjVaX4XVV45mJ0jJD0Rw5DQ8WnG5SnYfa0Lra5Z4v114neVJU3B1BxtJoC2?=
 =?us-ascii?Q?D8aTJEN944RQWHFMcsICiJZZjZOoSdAfsquMZGPtgtpQqaCckNh3/Mo+Agu5?=
 =?us-ascii?Q?TrdOh04vplPYIU9vTo/WZWsgLvYxZW1GpXSSU0RIxnvIPtk60EwHwL5OevnT?=
 =?us-ascii?Q?AoPn/b7GGfkH9zF8PdF+jsZJ1ZHcvrmix5zvKQ7khqJVwAorcKb7OuyuEiuU?=
 =?us-ascii?Q?6q3toP5fnPLxVn93wiLaerO44wmpp3DTUNasjwQDdeTjKOgB4Lyhfppb7PsY?=
 =?us-ascii?Q?l03dS6KVftTEIS0YKL6PfQkcxS48RZZVHdt2XTaqlHDPLanBcQ6Vbz72xLHZ?=
 =?us-ascii?Q?UbJbX3OVFe0O0wrnMm0PgbHLUECQCTPem1DDs43TYyYE3dH2d12IRKu4G7mb?=
 =?us-ascii?Q?UXneRx/0Gz+0XXzk24XJeVqGl1y+kt8PsuWh4ULoVLcRwg0VKfhPhOaKO7w/?=
 =?us-ascii?Q?86GpAj/Vyfc8lfjcegWPbDPRLuV+/AaW1SjJ+YCmyRb+nPLbuF/uKZDrvC4J?=
 =?us-ascii?Q?DEQmOqSMUI81jqsiE1oRZEPj/7J6bcY4VK06aGVvWgLYgov2n6tTIEt/SPvy?=
 =?us-ascii?Q?4mQyzKmEeZ/9UYz/np7UY0hX+3zv9JUgNEgOa97EtGrpH76C9+G0xIgWUAwj?=
 =?us-ascii?Q?Yb/OhIur7z9wDL/2c+ZVX2+5/QeXkAT59A9Dh4novB7A5fSzZoqCkHfD1v7/?=
 =?us-ascii?Q?Gd1VQ0ccjjl2hvR3a32MNCWe8ZR+5aqkTvvPQkRq+elRNdHuUGBpj/wWOqjF?=
 =?us-ascii?Q?G2Y9wn/qJYgX1bArGk8paQVCStXchYTTIPnRzrkwEJLu72tosQnt1+0w50Xf?=
 =?us-ascii?Q?KYcNVTWASjnSdUmR3dEVPuj2mJyYEIu1jmXCKxTZllNqHHsQ/rKTmM5IyK9M?=
 =?us-ascii?Q?0rbkMtUVRXtgCmYhwcZ38AZshj+4uF/n9U3gUCdGugcqjXvbsG/XNz3aTB+m?=
 =?us-ascii?Q?uzF+GmLFD75ztDjfq4WCRaYMiicRSBOr6Mw0CZ1/EDO3DV0+MnVWWoDSRC30?=
 =?us-ascii?Q?E/GqFRwzA3NXaO2KHhRJCC2LXC4D9nrcp3aa8QKii9d9HDmWZkRl1UFrKU9U?=
 =?us-ascii?Q?jXeoNjYX8yJenxC9pWrWb4XTlZsra58LYS3DVVJ0T3MAorO4YjNb7sja5fIc?=
 =?us-ascii?Q?aw6KZ5HgYvGcV+BEsB6dZKZEeE6F3pG2CvlqE3rSUyfGQNl4rZOzBUEETHcL?=
 =?us-ascii?Q?+8smtNG+zXIfOZip8aP3mWENRSb8haeuSt7G/dHZBM5/iK9gmMBl2c9IfMDz?=
 =?us-ascii?Q?OZ0RnP5eK6MHBLEa41LdJFq/85smvz0oagyYkaEviw+45bl4EC5ETY7/0J+f?=
 =?us-ascii?Q?XwpuOkewrVRfp/S8sq2M7ChARY1+TM9gkMoz1sWjw8LWyqcgvVFMC36pfbsT?=
 =?us-ascii?Q?TWExckheqoA10FenSeL1KlXI7VLsyiEAS6jYGTCcm7tDWV4zfYIbGXF4UGQs?=
 =?us-ascii?Q?kBEbnQUmuxUjP797lagCxU9bWUleYRhBNeb/vXUOKmzOueZP9zDjKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cvpEyJdclFD5T7XR+NJfPj5PXxgsUli5b9VChTg8/0mB+aH0QRfijJMsfwGs?=
 =?us-ascii?Q?lkvtRgZiDjWTCTo5kyWgPh27T7TM9xU2R8WCSrCrvrf5HE5/ksJCtjZB/Qhd?=
 =?us-ascii?Q?oGKik2u9n/i1T331pEGZaxnhuVpmWTg5gYvjlKDnKnmnHucldHBhrJQHoLDy?=
 =?us-ascii?Q?jP3vSmalbIKBPvwr1mRfsaXQaW9Y1kaGyGr3g1xwKIL/FpVCtSTr0c7QUs+4?=
 =?us-ascii?Q?UwhesCs20t+Jpe+7XK/HbN3ihl3UquCFKyBudjxR1J7mMoZnEHTIPk9qtkmY?=
 =?us-ascii?Q?TKcrGjTrHpeh8kV48dJj0GU3GH0J/bcW3cyetReIv6Y1YXzVcmBDmVUtR655?=
 =?us-ascii?Q?KK30IAQraTamTtqCqCcBoYffjRx/wkSjkFhEw2kml2BRGYntN+PhuM9nxxj3?=
 =?us-ascii?Q?vAkaLZT6rlNGAbBvWJ+13gvRvjfvcnI8HX9mQr8OAJm0WcD1Dzrn9F5/kKjq?=
 =?us-ascii?Q?idJOnCd8PTKhdI6lnmlERcszdrI9ZoJTS/pubOcJCFkWinDoX2Ke47lSo/Fy?=
 =?us-ascii?Q?48IExMiteXqPyHzIRDUbPk0QM0cH26GlcttkTioEgE0j8SPBts1nA7GwG+NO?=
 =?us-ascii?Q?r8dtDNJGEWICweD4h5IdzY1r48N36CpVKvFuOha0Odq5S+6UtfItTZcNXka4?=
 =?us-ascii?Q?/Tv3zfLsV+pK3age/DaKt7/cvd6FGazOre69JZnp0y3enFEQCrv9VtsXFplf?=
 =?us-ascii?Q?qZHgtiHn+ZGjiGn8+xFRHOS6Qlipyx34WBgvkST2r66nmY/LJIo7gb7p1rls?=
 =?us-ascii?Q?lSNwN9XjPnzUk4c0Cxu9Ec6KjmvKvfLc0U6Vcq+iuaGWhyPwS9TU51nPdwV7?=
 =?us-ascii?Q?YvbrhxP2tEx/JYvMH0f98fi9MHPrRYWFEJ3FiMoDlFU5wQtf20zUN41XSsJ1?=
 =?us-ascii?Q?L13BIj5CO3yRPx3O1reWhVIK2gd6u0MNW0ZHyqRZvPPAu7k4iWwU3Xz6Gyma?=
 =?us-ascii?Q?Yj8J6Hcuxsxb8opVYlVIDyOW4tc4drTsttUOZ+ef/hInctRq/AQflgvSbKCd?=
 =?us-ascii?Q?8+82H3Qy8hkPj4MF2w0Dv73xXyjDAx7VBdYVqtDjQZzjV0YFepDhpHFkFxvd?=
 =?us-ascii?Q?v7rSjFPumXFAUdm5mwzaBBwaDdpayo8KiUckoi3c1XEXvqx957CN5jVv8CaB?=
 =?us-ascii?Q?YdFvNkGcn69GXYGVF5BZWhan0+AaWbqKXhRlCAW6FSdFUivVF8MeNJl6bZAg?=
 =?us-ascii?Q?09mX880isMtLp4xUmJxT/P2TJI207PI1jj33GJGTo/dPcBVh3wH+NAZRjKXp?=
 =?us-ascii?Q?Og3wHNT/u0N3UaCpoKL1fXgNj6ClgyR5Bj9qptL5tcUOzFNjkASY9bfKEre4?=
 =?us-ascii?Q?IJxFGVzIV6Fn6bV3fEbhRr/F07v4nd/jtJmf/NqsZF8PS60jIOjEnKVIr+V6?=
 =?us-ascii?Q?o76sIHoZTdb+57vyhrZsSddgmyYDqDs9QZMOatOiYzlBMLMbPYzNK1zM56fj?=
 =?us-ascii?Q?qgce6lSmbP/UN7+LY9OglWoc17jyn7tlY1SRiklaBcT7aDhHv5mLQTMAKwNn?=
 =?us-ascii?Q?8KHqPqp9dwOkU54hpxJC/+N8suGCMJW4HrY5eeFxKtb9uJB8P6SL8f0IuvnX?=
 =?us-ascii?Q?eouxzT6qob/uqoYIYUHlcL7zxP/cPS77j/QdfPZf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1f4524-def4-4e03-35d2-08ddb9c069cb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:21.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYzioq13yzYdiwkjHjQGTr/bFnFNkq6vvu9zi6mngRfeWE/1TO6WcxaQ44ga2DkWa6xYlwmMEJ8KB/JbU56JSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

When sched_ext is rapidly disabled/enabled (the reload_loop selftest),
the following crash is observed. This happens because the timer handler
could not be cancelled and still fires even though the dl_server
bandwidth may have been removed via dl_server_remove_params().
hrtimer_try_to_cancel() does not guarantee timer cancellation. This
results in a NULL pointer dereference as 'p' is bogus for a dl_se.

I think this happens because the timer may be about to run, but its
softirq has not executed yet. Because of that hrtimer_try_to_cancel()
cannot prevent the timer from being canceled, however dl_server is still
set to 0 by dl_server_apply_params(). When the timer handler eventually
runs, it crashes.

[   24.771835] BUG: kernel NULL pointer dereference, address: 000000000000006c
[   24.772097] #PF: supervisor read access in kernel mode
[   24.772248] #PF: error_code(0x0000) - not-present page
[   24.772404] PGD 0 P4D 0
[   24.772499] Oops: Oops: 0000 [#1] SMP PTI
[   24.772614] CPU: 9 UID: 0 PID: 0 Comm: swapper/9 [..] #74 PREEMPT(voluntary)
[   24.772932] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), [...]
[   24.773149] Sched_ext: maximal (disabling)
[   24.773944] RSP: 0018:ffffb162c0348ee0 EFLAGS: 00010046
[   24.774100] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88d4412f1800
[   24.774302] RDX: 0000000000000001 RSI: 0000000000000010 RDI: ffffffffac939240
[   24.774498] RBP: ffff88d47e65b940 R08: 0000000000000010 R09: 00000008bad3370a
[   24.774742] R10: 0000000000000000 R11: ffffffffa9f159d0 R12: ffff88d47e65b900
[   24.774962] R13: ffff88d47e65b960 R14: ffff88d47e66a340 R15: ffff88d47e66aed0
[   24.775182] FS:  0000000000000000(0000) GS:ffff88d4d1d56000(0000) knlGS:[...]
[   24.775392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.775579] CR2: 000000000000006c CR3: 0000000002bb0003 CR4: 0000000000770ef0
[   24.775810] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   24.776023] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   24.776225] PKRU: 55555554
[   24.776292] Call Trace:
[   24.776373]  <IRQ>
[   24.776453]  ? __pfx_inactive_task_timer+0x10/0x10
[   24.776591]  __hrtimer_run_queues+0xf1/0x270
[   24.776744]  hrtimer_interrupt+0xfa/0x220
[   24.776847]  __sysvec_apic_timer_interrupt+0x4d/0x190
[   24.776988]  sysvec_apic_timer_interrupt+0x69/0x80
[   24.777132]  </IRQ>
[   24.777194]  <TASK>
[   24.777256]  asm_sysvec_apic_timer_interrupt+0x1a/0x20

Fix, by also checking the DL server's has_task pointer which only exists
for server tasks. This fixes the crash.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index aee1aa6c74e8..aa200350f600 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1822,7 +1822,13 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	struct rq_flags rf;
 	struct rq *rq;
 
-	if (!dl_server(dl_se)) {
+	/*
+	 * It is possible that after dl_server_apply_params(), the dl_se->dl_server == 0,
+	 * but the inactive timer is still queued and could not get canceled. Double check
+	 * by looking at ->server_has_tasks to make sure we're dealing with a non-server
+	 * here. Otherwise p may be bogus and we'll crash.
+	 */
+	if (!dl_server(dl_se) && !dl_se->server_has_tasks) {
 		p = dl_task_of(dl_se);
 		rq = task_rq_lock(p, &rf);
 	} else {
@@ -1833,7 +1839,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	sched_clock_tick();
 	update_rq_clock(rq);
 
-	if (dl_server(dl_se))
+	if (dl_server(dl_se) || dl_se->server_has_tasks)
 		goto no_task;
 
 	if (!dl_task(p) || READ_ONCE(p->__state) == TASK_DEAD) {
@@ -1861,7 +1867,7 @@ static enum hrtimer_restart inactive_task_timer(struct hrtimer *timer)
 	dl_se->dl_non_contending = 0;
 unlock:
 
-	if (!dl_server(dl_se)) {
+	if (!dl_server(dl_se) && !dl_se->server_has_tasks) {
 		task_rq_unlock(rq, p, &rf);
 		put_task_struct(p);
 	} else {
-- 
2.34.1

