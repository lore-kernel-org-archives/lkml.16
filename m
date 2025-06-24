Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E812417F0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744758; cv=fail; b=hpLIF3eCB7xcjTk81a8rLzSB6a4wMOHnpTeS2AnkpKpBV/VG6BTnJAYN4RhZV9FWuuGjb6NCt6txvgj7zrayFeA1amaB/o01zuZ5km94Ge7+srwR8X5ZegU7LbkuPlyYrUn9xSinO5uwye86t+QnVeT95ua+OuWYtuPpi1oCx6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744758; c=relaxed/simple;
	bh=KyR2ATLk8X3xjIYnrfHBewEjlYUcshYiDnfpoCputW0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxJUZKP0J4Ai4pS7qwvVqGvq5v/tQyUdN1MtxFiOh71hBLaprYDZUva/3nKu88sEfYKzGbKKpxqwXY0uNoxY19kRvLTew22ktjqIpunV0mTed1oIJXsuKbqxXsdeavPVzUTIiD3QoyedWLd70Qjw2sek4ur2mvLZ9V4Bo8NZYO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kVtyonLc; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kVtyonLc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oS1tGSk33rzvxxQSiTmFKnyq2pwb5hJEavQ0pIuACyfrxs3YT6fQHONTdzbOFvDm1eQMkUJDma71s32jQH0iU8/Y4lScJtzzf9823ewP+02USIcfItogxU9salraDtLkl5QEEtNxSpgEJwqNu0ir+QTQ0tBzg+c9s7ZYThBxTMhUhg2HqJuXDfeuGXwZTPN8ObdS3X8jp8cfOtPm56G3WW9jGRy9zE/gnPYFG2f2u2JzGo/5FSTsXzzp8UnW/OGa2cvYTrTZNK3bGhdxOiZXZMce250QAQi98rfQdSjb7iL3G3PJnIZFJDXzrV5DtIkjE4iBdY0R4kRTrWNz0HvN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pks/CxUpRVx4ri1CeO6Rf+GCF52kOhG3dUuEvxrIVZk=;
 b=FBHHVXsdlnof6ouTkWJfPeyEB7N7It18G7j6Qq1wM14yUSt5dcpem28PT3MYpfr0+FgGEo07gqjGxAEeBg+PeCrvZzMvTRCW9cBHuEvoZUs0FMdndj0Bp0mL/4k8sh92EacsjlQisLZEXsZgtaxza7ikdrH2ffgrSA1UcZBEsogFxyHicKsr84hruuRWmSfffM6d06pFk0m4l0rlBpsi7emIpgUTdcGuDHaxBeAjVhFrqZ6t7LcCmUouKxp/fLbGRnSUEJFVP8tTk9WUX0vJgDjjawcuovktSB373hi/sn4ilZ61AaUSNUZZWFAvp545a67iccB4lQ5Naf+0aevZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pks/CxUpRVx4ri1CeO6Rf+GCF52kOhG3dUuEvxrIVZk=;
 b=kVtyonLcF+yDYjH/04zk7WgdEZIdyqGYHHPASEqy+ouG4CXhLXjgy1tHz+Y86yzlcOIT+jvvGFVGutEwoOM18u7kWP3KJUgWajtM+B8xANYPkO/LKta/dhHY7MAfC4j3gqdQCmzE++N1B5pwipY2TH/FEjdSzuEp9qw4IqWY9j0=
Received: from MW4PR03CA0346.namprd03.prod.outlook.com (2603:10b6:303:dc::21)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:59:13 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::36) by MW4PR03CA0346.outlook.office365.com
 (2603:10b6:303:dc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:59:13 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:59:01 -0500
From: Raghavendra K T <raghavendra.kt@amd.com>
To: <raghavendra.kt@amd.com>
CC: <AneeshKumar.KizhakeVeetil@arm.com>, <Hasan.Maruf@amd.com>,
	<Michael.Day@amd.com>, <akpm@linux-foundation.org>, <bharata@amd.com>,
	<dave.hansen@intel.com>, <david@redhat.com>, <dongjoo.linux.dev@gmail.com>,
	<feng.tang@intel.com>, <gourry@gourry.net>, <hannes@cmpxchg.org>,
	<honggyu.kim@sk.com>, <hughd@google.com>, <jhubbard@nvidia.com>,
	<jon.grimm@amd.com>, <k.shutemov@gmail.com>, <kbusch@meta.com>,
	<kmanaouil.dev@gmail.com>, <leesuyeon0506@gmail.com>, <leillc@google.com>,
	<liam.howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
	<nadav.amit@gmail.com>, <nphamcs@gmail.com>, <peterz@infradead.org>,
	<riel@surriel.com>, <rientjes@google.com>, <rppt@kernel.org>,
	<santosh.shukla@amd.com>, <shivankg@amd.com>, <shy828301@gmail.com>,
	<sj@kernel.org>, <vbabka@suse.cz>, <weixugc@google.com>,
	<willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
	<Jonathan.Cameron@huawei.com>, <dave@stgolabs.net>, <yuanchu@google.com>,
	<kinseyho@google.com>, <hdanton@sina.com>
Subject: [RFC PATCH V2 13/13] prctl: Introduce new prctl to control scanning
Date: Tue, 24 Jun 2025 05:56:17 +0000
Message-ID: <20250624055617.1291159-14-raghavendra.kt@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624055617.1291159-1-raghavendra.kt@amd.com>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ded103-750c-4ef0-8ba4-08ddb2e43ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qge56PGRPLdXHMK+o7XxZdUdH7ITQtYeS9zEMMlG8IjNK8EnziMHTXXfwa/1?=
 =?us-ascii?Q?wL55fHYNG/mXJZcwP7nGzFgto1WMH7vWgjqZNdTbmupKNldMlZSOr/FqvDSp?=
 =?us-ascii?Q?XDgNgaI5lr+eFCB91WQ1+Tguz811sxfYmcPIJmbRuvqGNNiY2/D4We/UdTmF?=
 =?us-ascii?Q?SFZJBmZiRwjd/SqVe7gmZys0s4GRIzoyWKR5Av7uFUwAgmpM57IBgcp+A9Yk?=
 =?us-ascii?Q?ipoO8OPvuovOYXmGWinrpEPPatS3lkC3WuVEotETQwLgWPc4dNpUmzKkTmhY?=
 =?us-ascii?Q?T1pk0iwmuig/xASdeIW49v4cPT8DGn4snkbvhnyH+WOTlrNpD7qGDeIUURnU?=
 =?us-ascii?Q?R03hVF0slzA4jeuCjkvgCMqIWf3fJnksnphLx61O6ixkAYotnHxK9ep3YIc/?=
 =?us-ascii?Q?bRQy7yMMXfsHrxHHp6sALsbwXX/eI0ak9/eThyB5GMpm1FPtShwQvZ7lGxg0?=
 =?us-ascii?Q?kdolNWFZs3GmUygoqWENDXPRa9ph35h2LcWMp3qhU/NoIOFOTMEvxyV5YEmT?=
 =?us-ascii?Q?5PE+ubUz84mz+OB2RyAcxIcFNznmI7NAqPRsZqveJvqyuNGLcXBUHaoD14Y3?=
 =?us-ascii?Q?Lbzy1Fm64Qi6KIZOgy1CAfva4f6lO7p5bhJRUqYzg9YA+0x4f1SSWjDCNU0Y?=
 =?us-ascii?Q?3k5NTPUEgJ/CNStN410l0tYECMUqBppcwjsqc5iJSReuX+UWmM6D8w7Ba7Wc?=
 =?us-ascii?Q?HsltCjp8yS6a+iiE25f8HipVTIq5jaGH/cNKnBbgstsq7Yu/TmsTBHlhPRQ8?=
 =?us-ascii?Q?UnkVLvS1tC9soDLGslEizUcGTkF9/Sy21dB6yq1n5z/EmFpjnKxyixrlIHBp?=
 =?us-ascii?Q?b+Hlm9SHaCQhnhroXf6phUjxkENcXKIIDKBhJBEwLJLymhlpk/odOVk45Caf?=
 =?us-ascii?Q?jC8TRCsvqu6QlJdkxcClU23l+vV7GKDxpOXUt7h1W2aIplJKITf5dblrl10y?=
 =?us-ascii?Q?Vkq/Am7p7mQ4Ug5BqxjfWcVmE6/gd9u7kSjtMe2zIT9eycZyTx5vkuBeVzT8?=
 =?us-ascii?Q?sSUP36DzRVIu8AjXosyCR3GTz5s+QqoW2zLqcZaptn/ZTHh5rzLjJKS4QcdT?=
 =?us-ascii?Q?jPnPpqcCs4ZPh92zyi/gKJjNXzS2H47VhAKKJHCv8aDl5y5Wa+awLHrGo6dJ?=
 =?us-ascii?Q?TDP6RAxhR1xiQ69IjOH3CjXnOnSVMU/ZgCGjFAu9ovCHI4Tmc2UsAxSFutCg?=
 =?us-ascii?Q?wXNU9p86jybyih2Rb4gA6WA84EybkGV0X9p32G/dKxaUR3QbucDzUUYAPObQ?=
 =?us-ascii?Q?mzqtVP2LtXiP5Po8aQ8EOmnu/wSor0b0VM4gUnNlOuhumHwkTMxxqhd+vXJf?=
 =?us-ascii?Q?O7AMRk+zWJtAqT2Qz4G275t1f+fxrah21wqvXcj9UDktdrOiNB1Zehty34zx?=
 =?us-ascii?Q?78KUYzMrxqAFO9MAIqRx/Nsq68JHhq1Ah2608wtkoS4sS1naMg5PILV1Do77?=
 =?us-ascii?Q?3w7gyieS4vg5DZQYSqdrK/dG4CxZgkXwEqa6ZbCXqVkl7mK+fQBxY3OlMTPg?=
 =?us-ascii?Q?YoRhaPOiHsJafynrtZZdxZVRcWzduxJF/dOj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:59:13.1528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ded103-750c-4ef0-8ba4-08ddb2e43ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337

 A new scalar value (PTEAScanScale) to control per task PTE A bit scanning
is introduced.

0    : scanning disabled
1-10 : scanning enabled.

In future PTEAScanScale could be used to control aggressiveness of
scanning.

CC: linux-doc@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-fsdevel@vger.kernel.org

Suggested-by: David Rientjes <rientjes@google.com>
Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 Documentation/filesystems/proc.rst |  2 ++
 fs/proc/task_mmu.c                 |  4 ++++
 include/linux/mm_types.h           |  3 +++
 include/uapi/linux/prctl.h         |  7 +++++++
 kernel/fork.c                      |  4 ++++
 kernel/sys.c                       | 25 +++++++++++++++++++++++++
 mm/kscand.c                        |  5 +++++
 7 files changed, 50 insertions(+)

Rebasing to upstream tree will change prctl number.

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 2a17865dfe39..429409c341ac 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -205,6 +205,7 @@ read the file /proc/PID/status::
   VmLib:      1412 kB
   VmPTE:        20 kb
   VmSwap:        0 kB
+  PTEAScanScale: 0
   HugetlbPages:          0 kB
   CoreDumping:    0
   THP_enabled:	  1
@@ -288,6 +289,7 @@ It's slow but very precise.
  VmPTE                       size of page table entries
  VmSwap                      amount of swap used by anonymous private data
                              (shmem swap usage is not included)
+ PTEAScanScale               Integer representing async PTE A bit scan agrression
  HugetlbPages                size of hugetlb memory portions
  CoreDumping                 process's memory is currently being dumped
                              (killing the process may lead to a corrupted core)
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 994cde10e3f4..6a1a660d9824 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -79,6 +79,10 @@ void task_mem(struct seq_file *m, struct mm_struct *mm)
 		    " kB\nVmPTE:\t", mm_pgtables_bytes(mm) >> 10, 8);
 	SEQ_PUT_DEC(" kB\nVmSwap:\t", swap);
 	seq_puts(m, " kB\n");
+#ifdef CONFIG_KSCAND
+	seq_put_decimal_ull_width(m, "PTEAScanScale:\t", mm->pte_scan_scale, 8);
+	seq_puts(m, "\n");
+#endif
 	hugetlb_report_usage(m, mm);
 }
 #undef SEQ_PUT_DEC
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 571be1ad12ab..ffdb9207cc4f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1112,6 +1112,9 @@ struct mm_struct {
 #ifdef CONFIG_KSCAND
 		/* Tracks promotion node. XXX: use nodemask */
 		int target_node;
+
+		/* Integer representing PTE A bit scan aggression (0-10) */
+		unsigned int pte_scan_scale;
  #endif
 		/*
 		 * An operation with batched TLB flushing is going on. Anything
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..2f64a80e5cdf 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,11 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
 
+/* Set/get PTE A bit scan scale */
+#define PR_SET_PTE_A_SCAN_SCALE		78
+#define PR_GET_PTE_A_SCAN_SCALE		79
+# define PR_PTE_A_SCAN_SCALE_MIN	0
+# define PR_PTE_A_SCAN_SCALE_MAX	10
+# define PR_PTE_A_SCAN_SCALE_DEFAULT	1
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/fork.c b/kernel/fork.c
index af6dd315b106..120ee2ba7d30 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -106,6 +106,7 @@
 #include <uapi/linux/pidfd.h>
 #include <linux/pidfs.h>
 #include <linux/tick.h>
+#include <linux/prctl.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -1311,6 +1312,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	init_tlb_flush_pending(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
 	mm->pmd_huge_pte = NULL;
+#endif
+#ifdef CONFIG_KSCAND
+	mm->pte_scan_scale = PR_PTE_A_SCAN_SCALE_DEFAULT;
 #endif
 	mm_init_uprobes_state(mm);
 	hugetlb_count_init(mm);
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..aff92ff2c7dd 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2146,6 +2146,19 @@ static int prctl_set_auxv(struct mm_struct *mm, unsigned long addr,
 
 	return 0;
 }
+#ifdef CONFIG_KSCAND
+static int prctl_pte_scan_scale_write(unsigned int scale)
+{
+	scale = clamp(scale, PR_PTE_A_SCAN_SCALE_MIN, PR_PTE_A_SCAN_SCALE_MAX);
+	current->mm->pte_scan_scale = scale;
+	return 0;
+}
+
+static unsigned int prctl_pte_scan_scale_read(void)
+{
+	return current->mm->pte_scan_scale;
+}
+#endif
 
 static int prctl_set_mm(int opt, unsigned long addr,
 			unsigned long arg4, unsigned long arg5)
@@ -2820,6 +2833,18 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = posixtimer_create_prctl(arg2);
 		break;
+#ifdef CONFIG_KSCAND
+	case PR_SET_PTE_A_SCAN_SCALE:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = prctl_pte_scan_scale_write((unsigned int) arg2);
+		break;
+	case PR_GET_PTE_A_SCAN_SCALE:
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = prctl_pte_scan_scale_read();
+		break;
+#endif
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
 		error = -EINVAL;
diff --git a/mm/kscand.c b/mm/kscand.c
index 029d6d2bedc3..2be7e71c2c8f 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -1228,6 +1228,11 @@ static unsigned long kscand_scan_mm_slot(void)
 		goto outerloop;
 	}
 
+	if (!mm->pte_scan_scale) {
+		next_mm = true;
+		goto outerloop;
+	}
+
 	mm_target_node = READ_ONCE(mm->target_node);
 	if (mm_target_node != mm_slot_target_node)
 		WRITE_ONCE(mm->target_node, mm_slot_target_node);
-- 
2.34.1

