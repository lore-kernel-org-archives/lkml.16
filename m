Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4619E96D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066171; cv=fail; b=apXTTLjG1DmCU+mw4tApGKGxLqdknCwAjW/egX7/9IN14J8TPaH8lQsuZryX3GP09aTp9Zx0hhjtT03IYTlwlFAfH9SsqGry329PwtNqye8h1Vrek9fD9J1Acpu+q4sH34IEd8KXMbX1WvZa7dak/SlN12U+ycJCwKySC/rHxfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066171; c=relaxed/simple;
	bh=tYgI7FGD/dH8FkOc2DtC3RPqO/Z7gvCWKeG91d4ZBtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jFdNs0eCIb0wYG1j5Sw1Nio6G8Jk9YESqOBXi2y1tr051+FQxYy6FyWQRlvE8WaVkPIEuf+F5sDBzAVKZsmIQA6anH37vaB4D+7zF0Hgegyb43uen847Sct7MiyEL3KpNx1YcALpW3E6kahnYOwkdIChUlB3L7An+krurRrAayo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ullNnuEe; arc=fail smtp.client-ip=40.107.96.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ullNnuEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZdgQu8OXmOdqJxBCa7YbZvdiuF4z3Y26cbdPQyonoyxcJjAFpbiXd4UrAkM8ISia6SbHG81jhzb8cluU1tUZAFvuNjPfJxJkbo9jqFcaMKL+x7ML0Pacp/R0BK+uAk/d5z76GsMKeoUvML9CJRs5d6+Ovwqa6pUPwsjdr0KHm6KGjtgZo1/IGXVhp2y5G6Gak7kKfgUSnpbr+jwKlFSW16lHC0vPpe7C8N/DvtKpz4TNqUrvVqX1bwXrACSxmS5UFxHK3lE/qBi4ggaXaUjPWEGpDJJKzAW0fq6S82Of8/bkJxvfxDKyKbP2X3AGhs20MnnFgkzh9gM2Ww85PChKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNlOVTYzilWt7xHkdWlgFekyQThUWjTELXLwGfDcb+U=;
 b=FQh+LO+57oUvBa+NrGRtifQ9TOR6Go+KCKyouSoMFhmSkiA8zvQPfxgK3/ye+fczoG3PbBRoMnc8LTlqadDLTpK9F/bBNHbeCSLfqwTCc729leyGub9FWnoWGBbRZwL61GkVyTRX7vDGXWcKLFLt9eAFBMmjINRFbs7l3lYuwNFjLmaeE2Vva4qiDg9k2QYGV1o9e6rbv5Z3j+Nd5shC+tBrYJMTTajH4AKw1g5KhnluRUMAho4aNTymj+tkzcI8Ma5Q7OP0PlfW7q8JpsspSHu2WYa6uNMkBBxW+keAyYuxegQ/BmqL1mkwjCdvgZ//jPH3bxNsOSfdNkcvK2QRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNlOVTYzilWt7xHkdWlgFekyQThUWjTELXLwGfDcb+U=;
 b=ullNnuEeddK6oN+nDMKdbemvUdIfaPrwW0ErHiHQ9Tm/eU4hxDH6FpFEQCiiDww0F7O2sct8XhgrlsdNsZP5JWUYzKG0M6989z1WeM6X3fLM5iNixL01w2hu1UNxr7T5q1Ft4Yj2lt8P84aEkX/4S6Upcj7ACGxMW8SpD3npOoCK4wuJ+PbCOxdGX0ZBZV8/16iF3k6JpmpdUHneLRUQSlS5qDdFeWQZa/Zu4DnqIKY/Wqz2gVhItiwJ/kCWqFpgy8xxc9XBWgj6IYtkf6LQ0ouUTi+rromwkNhpIH1aKB8WYA1SahDq0BjJ2ofuZ5CgsnVCdEuSK3zALoosx8LIqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Sat, 19 Apr
 2025 12:36:06 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 12:36:06 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Date: Sat, 19 Apr 2025 14:24:31 +0200
Message-ID: <20250419123536.154469-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419123536.154469-1-arighi@nvidia.com>
References: <20250419123536.154469-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::23) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e4f07a-b253-4b1d-55b5-08dd7f3ec128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c0g8Drn0gjcJZ6OOojZNxE/D99amUSHMPmjoNh6zzAMI3OLC5djU9tgKbsAX?=
 =?us-ascii?Q?OYZAHCHof5Lx05n47gNFIKGYuJNJa09kF1KBkHiC2tCYpYVjuwtC06HXD/dz?=
 =?us-ascii?Q?6ZzMceP/KMbqGuxo30Q0n78CWdjJUoZbybNupTgPivYEN/xn+sTNrCJKl2P5?=
 =?us-ascii?Q?HwvZohei26BZlSREM3kkE9jTgoFafwUKyOE9NYLtozoXo0BwRAMXrnzXGgrW?=
 =?us-ascii?Q?3NRkwBptrWswEZAzXIGk4EVgWho+4VXwM7hJfS67MNbFTAV5fmm+JowpAWQ9?=
 =?us-ascii?Q?L9XzS72DzEbe/REji0Xa5penEqolle43b225wZxQuNxgCN61oaPIrHY26GSu?=
 =?us-ascii?Q?jCQR4igmSzhF5VK4qbqHwtG7pfDAsWKg1Nw/ncl0Bd39BZVkN1wgQHxMgefB?=
 =?us-ascii?Q?0axuLqA5HGWS9srUqi/hjRjefKCNzJER3T8pL3+CrKZU1RoQemjAZ149YMx9?=
 =?us-ascii?Q?cpBuA/3qSPUBY8J0XgwiuDtk6DDacnwP7ZpGpQjKPzRUyQoA/LhQoPbJfVPm?=
 =?us-ascii?Q?OSQ0ghKsREgcq4fflt07hxBjUOuF93/xQsVBwMFUWZ0WJErVfUj4RoHwX2nY?=
 =?us-ascii?Q?xXO+aJM3mkh2J31AKrbm1tg8dS+t4WPT07+0zihe7y73K41WZhGb1gN1n+WJ?=
 =?us-ascii?Q?Q/vK1sRsayPGLMMgbVmHxUO/9zf+pTWepiBD/kSpP/Ul/4rXgxUQuIZUvM77?=
 =?us-ascii?Q?Jsq2Y09ivvMQGixPsiCHq8D5jfLNIzU1S4esuuqJbv30RYOy82APpMlqfKiQ?=
 =?us-ascii?Q?IzTnLWMbfmLdvTe67jNgWogwsyLPcgfJW0iE0Z8yfvWvzK0v787Uo0DaR2Vw?=
 =?us-ascii?Q?ZhefQWL7aqVEHfuMwJapo3pIQFGn2KSwES9BcnWhmjQzdzDVj6p3rF+BOl0X?=
 =?us-ascii?Q?2Qfn641Eb2Ry6Jmi/kT4iUDkrh1A3qiYe+pexL0g9AIpZ5iWCda1fN9Qdgmx?=
 =?us-ascii?Q?TjXASVdQofbGA3ntPnvhPc6daF1lD4raBZ0hxEgg1M9zBAqYzhsWo3JZMrZI?=
 =?us-ascii?Q?QXpD4XCnZE7O6fJRA9WkITExuGinGFZ37x9KlSRDtZ9oXZymyhAOsBGCMRYA?=
 =?us-ascii?Q?MENl8PMIxuaBVQ/P/siByn4h6qHXFP/UZUrl9etfZbCH74X4pJ8CFskk2nG7?=
 =?us-ascii?Q?hliwoQGEhqc6IqLCeKFQJ/XG3f8lY3fXU6RyWLIXPIUNZ+B5DOXhqwIKPExr?=
 =?us-ascii?Q?Ij6G29UDmp8xe3VPMwxXshruxBB6E7Q7DsBnyayTHVAS/S6sJSOZTEOKUJi5?=
 =?us-ascii?Q?quIBleIOn2dTxaACy+/FYCP2N9LirKSiyPVGLC4mquE/goHEAua/z95lbAcu?=
 =?us-ascii?Q?byHUf5o9TFItikTXq2lUYlg3GyN/lYOrgoaxGaztysGhl1UxeobnttWJ9feo?=
 =?us-ascii?Q?mE+oWUuctuUdWMJmkguzeKpUKz+zu98yIQRriQ36W5rF3XyrjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Io3p49R57E3QhRT0hmhqWQe6DmZA27PQofnJOCRYuFkvCp2fXIMvg1ZQAwPK?=
 =?us-ascii?Q?v51E9Ihrv9sYadWGjinyhm30/HteMK9t18duuv3/obNZElKKt6QotJfYpFZm?=
 =?us-ascii?Q?NzMbptf/H4Lq7AeHXqC8NFhJ4qJnJejTv7TIxK9lHQsIsQExOFcetA1g2zmv?=
 =?us-ascii?Q?8CHpLJcD0MjdX0dkQlsGMeCIHWNUIXJuFf04mS5tq18P6DzQf6nikpBpcpcA?=
 =?us-ascii?Q?JruzrW4qEzng19wQlmBMGtloFZAWAH9NOjdUgGqRwNIzmT3cylGJot95D0oS?=
 =?us-ascii?Q?G55HwyuLuW4S3Fpf1lAAl7z4gFEdVWxfpOp5I4uAoCj0rj5bthFmCsClXAi7?=
 =?us-ascii?Q?ICIDiV4RN1rRtQdivV32lbSete+Ww0oCHOmavlaUdQIp8ZxeS29ab/CWnXGd?=
 =?us-ascii?Q?Cji6cLDVkSYu0QiCQgGK1KNMSHQoyC2PesKQq3iXvsSdWzg4B3R7n4u10n3S?=
 =?us-ascii?Q?jhR8tUJK1MH2RY0FtwOkWi5vClZm0DUexgYhTz1/+p+HMJIKNtbN6H3cuf3L?=
 =?us-ascii?Q?uJrXRZ4kcbBhVeud7z5XLRfCAkWBlE8wFSsnac/ZURNwMvES+oGpusbNqXxl?=
 =?us-ascii?Q?NFqBFXMbIuNpb3yv0qskXIRLhItO9BrEj/ipRjBceEuDfZUQs5MnTqz6eF2L?=
 =?us-ascii?Q?f5EBc8rHLvLjYTw74Rer102NaGxi1O8LDwcQdK+u+tx4XMcQSQfkd1g3NyCL?=
 =?us-ascii?Q?+kBqmJX9Fg244DgkmGZo50biPTkOPQAtnqDHnUAxM4ri3A8Kq/62CICENhSI?=
 =?us-ascii?Q?cntnM0w6ONpKnQ8Z7/yACrW0o71vjjLKQD6LqcfsHMT0jn2NjMmnNLc19lMt?=
 =?us-ascii?Q?avA863EtT8jZ2Ab2ohaU8GBqKrj/VWxEfGQIEAbD2hA/X4U5sAwb0LzBr5ea?=
 =?us-ascii?Q?Tez8tIPnovdOqB/Ap4JFWtC8mQJpm4P6PtwxHDHL3XE9pD/vkPEh5lAe4uBr?=
 =?us-ascii?Q?0Lg9B4Fh2m58turL/l2rAy3rdK7q50ZTxajONmQ+EYMBaxygXJu3/M0MT5/n?=
 =?us-ascii?Q?/3eqNfSllW7/TQ87VNvW54ReOMwUaGKexjrp+xjksryx5TQv8ukNec70CENw?=
 =?us-ascii?Q?y3sdITUHiXksLRUihwAZOhEHxdd6gtUVi/oJ+7iNaVEcK7KpGiZC4Am2nqrg?=
 =?us-ascii?Q?oUwthQ8P6zpEA4vOxbEkWq/g7ykDzLjrCDatvza/w+k8D6P1IufLj69rAR44?=
 =?us-ascii?Q?Es1Eq5DtgnsywPN/RqG/fDsJcRbv6Fw7s8L2Rqdjm95ya2s+JM4NpR+bKMhj?=
 =?us-ascii?Q?/WMnrF+nG/c3FSego1snKYYmBDfivLk5XYN52XfteR/M5YC7bYb0xpqY48ME?=
 =?us-ascii?Q?/3PV8aS/ho2Gj3jQQKeqDJ8xqUiSAsesrT7f+21LOtzsv88G5Jj7twBg9Wka?=
 =?us-ascii?Q?pvWOxW1wwi5NZXebu4ACzoUotnMlsBpUHCQj3pnHtVHJyto77R0UsZW/5QCp?=
 =?us-ascii?Q?HF69lkMivLFr+lPqreuSTsY7FdR1ihTMUNq7QPr/3lvHI6ArykyyWgE7LkQp?=
 =?us-ascii?Q?IgCOZVjhELMPpm53o4FwCYoz6opX7tG4ryi4/DATVne3cuszHWyt5b5Rwc1M?=
 =?us-ascii?Q?T32S7/xag1uBvXcruPVD8NK/LHzUePtAWO67BKcq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e4f07a-b253-4b1d-55b5-08dd7f3ec128
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 12:36:06.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdfULtcpPSHj3KGFuEFwyO6QzCBZWmxuCqwife5hGcGJ2EeTg1DeBIIQUhobdPBZapaur0U13it/INxujBPqfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083

scx_bpf_cpuperf_set() can be used to set a performance target level on
any CPU. However, it doesn't correctly acquire the corresponding rq
lock, which may lead to unsafe behavior and trigger the following
warning, due to the lockdep_assert_rq_held() check:

[   51.713737] WARNING: CPU: 3 PID: 3899 at kernel/sched/sched.h:1512 scx_bpf_cpuperf_set+0x1a0/0x1e0
...
[   51.713836] Call trace:
[   51.713837]  scx_bpf_cpuperf_set+0x1a0/0x1e0 (P)
[   51.713839]  bpf_prog_62d35beb9301601f_bpfland_init+0x168/0x440
[   51.713841]  bpf__sched_ext_ops_init+0x54/0x8c
[   51.713843]  scx_ops_enable.constprop.0+0x2c0/0x10f0
[   51.713845]  bpf_scx_reg+0x18/0x30
[   51.713847]  bpf_struct_ops_link_create+0x154/0x1b0
[   51.713849]  __sys_bpf+0x1934/0x22a0

Fix by properly acquiring the rq lock when possible or raising an error
if we try to operate on a CPU that is not the one currently locked.

Fixes: d86adb4fc0655 ("sched_ext: Add cpuperf support")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index a14a5c3bc38ac..eddd84731c019 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -7078,13 +7078,32 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
 	}
 
 	if (ops_cpu_valid(cpu, NULL)) {
-		struct rq *rq = cpu_rq(cpu);
+		struct rq *rq = cpu_rq(cpu), *locked_rq = scx_locked_rq();
+		struct rq_flags rf;
+
+		/*
+		 * When called with an rq lock held, restrict the operation
+		 * to the corresponding CPU to prevent ABBA deadlocks.
+		 */
+		if (locked_rq && rq != locked_rq) {
+			scx_error("Invalid target CPU %d", cpu);
+			return;
+		}
+
+		/*
+		 * If no rq lock is held, allow to operate on any CPU by
+		 * acquiring the corresponding rq lock.
+		 */
+		if (!locked_rq) {
+			rq_lock_irqsave(rq, &rf);
+			update_rq_clock(rq);
+		}
 
 		rq->scx.cpuperf_target = perf;
+		cpufreq_update_util(rq, 0);
 
-		rcu_read_lock_sched_notrace();
-		cpufreq_update_util(cpu_rq(cpu), 0);
-		rcu_read_unlock_sched_notrace();
+		if (!locked_rq)
+			rq_unlock_irqrestore(rq, &rf);
 	}
 }
 
-- 
2.49.0

