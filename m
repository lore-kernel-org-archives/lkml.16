Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDE231CB0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744639; cv=fail; b=NFubV/VCZPWZ7rJ1TZJZRuZuMHsgwtOcVq7aYAwSGnjXJ6yfMT1FnuP22euQIMCLBU/dQs2K7XqtdljDDWhj75fAvJNHUAr1ITaonLbvt6eLCruAdhpEAjMHV6y+zSxpS2c1tZ0sQqqGCi1Q7VjcUFIfUadCqGgeJtptDplLtFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744639; c=relaxed/simple;
	bh=6nTuaXCMsh4Sn6rX4Z7YbTQq6GSm0IVqrPfNUkVprV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rb5SdiV06NR+RDlunBko6dRyS8VJqaOFUA8tdQOhc5Q17UIr7Wjxl/XMCIoYJNhvXkvh8gh1xlx1PqzjzPGtpMKqVaxY85Q8R6K4hkgfAL4fHi0etzMFyYYy9nhr2aQGQOH3zQhGlTaIunUm9GEx/tF8HTtxQScjZg4Q8CGNBDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dovGAxSn; arc=fail smtp.client-ip=40.107.102.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dovGAxSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3r9NK1GzbJE3YTAQkYcfkjcIMksyzcWv1jEoh6Eg6ZmuJ1tuzCW59+7pqLi8912wMCyiyTEgEhXF3EzORUEDO5W/AkyvIlOqkkeX94XdQk6tOLz2mwBv7G7wmub/BbdLMf3qbfK2OTGqcuFUARPva/7aMFUCT6le0uPr2g1hbk7xagLwrIU0KpHpYKcQ/jg7qcPvclK+r8nVZvQAcyfdEWjh3O2r35RXLzSA2hY5QqWArOL3ZY7+rC//F8HPWHmc/T3qfrkApUpSba3x1KQS00UZyPNxMPtrzVq6WBJexvpOihu4f179pDIMYogPC4bzXtiyl9hoSIdd36cLa/Psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbBjlJuKSkKDjaW6EjtJEY38TaofG9xVCZkD4L5OqLo=;
 b=E9zxhQEVRd7/OB36Z4zC4io1Zu50qxM781SCnyGMpUHIo06v4iM4CIOWAAT90RMw2oh4i4qvb111FkyQioS153nHLcJP+/SH2fRN6ForOIDkG2xDhgC/UjX00yWwKM9l94gIONImvjOj4VQDjxQqFc2O5hzvadp95NSi+fXZ9DFCGAhu/wYxG1MxLpBjnF800No1upOVeoC5LLzTrUZ3yW8Y4CBMF9mpg+UI9Nn4IxCTruKj1mCgPjCz0n3AQ0LR9kcuzRssNr/gt6Fjw7gPCg2uKfrJqTU4/ndGYXvl0WIbr0FzQp+wSQ9tj/XwZ1uN/eKVSEoU7/ypMW1oGklc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbBjlJuKSkKDjaW6EjtJEY38TaofG9xVCZkD4L5OqLo=;
 b=dovGAxSnLx27PHEhC6CjNsUpLfiL/cQUUN0Plzjso+4gf8Dqncz97istVVcShgLykHGu6MQqbxYDgNfWi5LZdab1gTfH/fWiUnYga6KENYNK2YAMiA3IFIiX/Hj4nt+aJhM+3iiXnrimcS8dLoXqURENwSEpH30vD7AMtDLgsOc=
Received: from BL1PR13CA0206.namprd13.prod.outlook.com (2603:10b6:208:2be::31)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 24 Jun
 2025 05:57:11 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::ba) by BL1PR13CA0206.outlook.office365.com
 (2603:10b6:208:2be::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 05:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:11 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:00 -0500
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
Subject: [RFC PATCH V2 02/13] mm: Maintain mm_struct list in the system
Date: Tue, 24 Jun 2025 05:56:06 +0000
Message-ID: <20250624055617.1291159-3-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f167fb-d69e-44ea-a7f8-08ddb2e3f625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1hnd2Oq1faSHF+l57IX4+5lxZPYT3d4pYroxGz5/oHnFIG8BL3jMsBvdBtj/?=
 =?us-ascii?Q?IuURy9y+41C7fQWg+iAJKnfb6M6CX3uumpWIXWAZqtIVIjpmb/HNW1so4Mok?=
 =?us-ascii?Q?UERa5mpxXzxe+fH2lJi0/6fLw00KK8y2r4uUA9KY9ZZEaqHdpiWSq3VS2kps?=
 =?us-ascii?Q?j0+RNgLrx/WXSxYpAr4Mo1MRNN3vkJ73+3hZFeggSH/jDjLETA06qi4XLlc7?=
 =?us-ascii?Q?dl22EthVt7nWwkUhpfqSCRYEkNYs4+Gw4jKzY+kBxMECn0KPfmVOYXb6vfhe?=
 =?us-ascii?Q?OxVhu6pTRk3PtGut7rou+01nu/GmWVOxaIyncPcWwwg9qmU91IKpIQvg3uzv?=
 =?us-ascii?Q?l9aRxkUgbdrkkRLjWXglZpNYvgYbtxqYiB6/24K+iV3sQKNwpX8zmfX9XeJ5?=
 =?us-ascii?Q?O+sI3OAyFSIw+9OFXH3qMlxy0UR9tLX2YlFf7TvqAnab0i95+es8nFAW7+QQ?=
 =?us-ascii?Q?QzLHDBxweeBzrge8Jfel//w8s0WBJL4iMS4OCfMlx85YI4+1MONw9G/Yg9zi?=
 =?us-ascii?Q?nAHeisNJnqO1C6RhKgLn7SgdjMVDPZd0tKzf9FoY0kxLZ+0Pg1e8UX7rf1vo?=
 =?us-ascii?Q?yeY0ecxJ6mrtKu2tULr+gYrr5kiDKKJIVJzcF5xC5L8ZGibl/Q/9NGaLtxBh?=
 =?us-ascii?Q?tfsncS8iA3qNvWExACoUn2YPhGZpRFlXoC7VGLUuBuRkkCENxVgzEDCsFS99?=
 =?us-ascii?Q?fneIHRxo8f+QbofEGAxmVzGT9KsITVNr5o9+SnEWFP5CE7UwTsIgY0KYZsDs?=
 =?us-ascii?Q?VflRpOzEOQ4tVbFyhsMq2Cv24nlkmiW99F1dSfAiMjXstV+XOk5shbe4Glyb?=
 =?us-ascii?Q?ipb/wcCEv9RdH0CLh5P+EKu9pN6Fx21qiXCphozkV8GGtM9m0ZlS1padtNah?=
 =?us-ascii?Q?rd1JW1fjLWN//8o5/JmLnd0unzgr3uB815JD0pktQXYu+7++rFbFbK15F7BM?=
 =?us-ascii?Q?UbhFwVu2mvzk1rZ0D8NVS2PIJAQbDFLChy2tafyx4kQ75DQAEozf1I3u1nhF?=
 =?us-ascii?Q?dR1FPb0XOZtqephBrXov7STCck4AhBDB6WACd540jBU27J+krLRpZRhqNQWE?=
 =?us-ascii?Q?8npNIefpeD/6GihfHYE1eFa/ghWhhHgb9pj3UiD5J05rsECLUPv7yEk/7yxd?=
 =?us-ascii?Q?4oCv0NeUaWc4uB2uZu+vT6H1Dedyp5W4w/O6ygXbs9dY0f5hH+fXNfaSw0VP?=
 =?us-ascii?Q?j6F8Fpnf4+xJX/k4bppgdJ5wwHjCTGjmFrkgTsqsRFUlQ13b3ev1MBfCVe0p?=
 =?us-ascii?Q?JjK1cWKSWF67onDlff6DpVcKzqqbmQJYZvXGlIY4zp77lWqyCSU2oSXsvCLG?=
 =?us-ascii?Q?iN9hoiBi1k4VrgGqrGIaTB+/ETPIKllrothiwJ0i7CXALHj/rcw9iMmAs6Yk?=
 =?us-ascii?Q?uBPh/iRnoRZySqHuAUZwsoUWMVZEk7OzX2v1h1CQNxvmhIN7CCBi6aIE4t42?=
 =?us-ascii?Q?wgaLjum8wKE3SkyP0KdrLr+DOvSDHMYQ3q/fy0g7fDoqgXpQ7Z169VO4xORu?=
 =?us-ascii?Q?9vrXfDYfflvy+QGfAVqz0igkoGymbfHbUWrQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:11.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f167fb-d69e-44ea-a7f8-08ddb2e3f625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840

The list is used to iterate over all the mm and do PTE A bit scanning.
mm_slot infrastructure is reused to aid insert and lookup of mm_struct.

CC: linux-fsdevel@vger.kernel.org

Suggested-by: Bharata B Rao <bharata@amd.com>
Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 fs/exec.c              |  4 ++
 include/linux/kscand.h | 30 +++++++++++++++
 kernel/fork.c          |  4 ++
 mm/kscand.c            | 86 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 include/linux/kscand.h

diff --git a/fs/exec.c b/fs/exec.c
index 8e4ea5f1e64c..e21c590bfdfc 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -68,6 +68,7 @@
 #include <linux/user_events.h>
 #include <linux/rseq.h>
 #include <linux/ksm.h>
+#include <linux/kscand.h>
 
 #include <linux/uaccess.h>
 #include <asm/mmu_context.h>
@@ -266,6 +267,8 @@ static int __bprm_mm_init(struct linux_binprm *bprm)
 	if (err)
 		goto err_ksm;
 
+	kscand_execve(mm);
+
 	/*
 	 * Place the stack at the largest stack address the architecture
 	 * supports. Later, we'll move this to an appropriate place. We don't
@@ -288,6 +291,7 @@ static int __bprm_mm_init(struct linux_binprm *bprm)
 	return 0;
 err:
 	ksm_exit(mm);
+	kscand_exit(mm);
 err_ksm:
 	mmap_write_unlock(mm);
 err_free:
diff --git a/include/linux/kscand.h b/include/linux/kscand.h
new file mode 100644
index 000000000000..ef9947a33ee5
--- /dev/null
+++ b/include/linux/kscand.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KSCAND_H_
+#define _LINUX_KSCAND_H_
+
+#ifdef CONFIG_KSCAND
+extern void __kscand_enter(struct mm_struct *mm);
+extern void __kscand_exit(struct mm_struct *mm);
+
+static inline void kscand_execve(struct mm_struct *mm)
+{
+	__kscand_enter(mm);
+}
+
+static inline void kscand_fork(struct mm_struct *mm, struct mm_struct *oldmm)
+{
+	__kscand_enter(mm);
+}
+
+static inline void kscand_exit(struct mm_struct *mm)
+{
+	__kscand_exit(mm);
+}
+#else /* !CONFIG_KSCAND */
+static inline void __kscand_enter(struct mm_struct *mm) {}
+static inline void __kscand_exit(struct mm_struct *mm) {}
+static inline void kscand_execve(struct mm_struct *mm) {}
+static inline void kscand_fork(struct mm_struct *mm, struct mm_struct *oldmm) {}
+static inline void kscand_exit(struct mm_struct *mm) {}
+#endif
+#endif /* _LINUX_KSCAND_H_ */
diff --git a/kernel/fork.c b/kernel/fork.c
index 168681fc4b25..af6dd315b106 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -85,6 +85,7 @@
 #include <linux/user-return-notifier.h>
 #include <linux/oom.h>
 #include <linux/khugepaged.h>
+#include <linux/kscand.h>
 #include <linux/signalfd.h>
 #include <linux/uprobes.h>
 #include <linux/aio.h>
@@ -630,6 +631,8 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
 	mm->exec_vm = oldmm->exec_vm;
 	mm->stack_vm = oldmm->stack_vm;
 
+	kscand_fork(mm, oldmm);
+
 	/* Use __mt_dup() to efficiently build an identical maple tree. */
 	retval = __mt_dup(&oldmm->mm_mt, &mm->mm_mt, GFP_KERNEL);
 	if (unlikely(retval))
@@ -1377,6 +1380,7 @@ static inline void __mmput(struct mm_struct *mm)
 	exit_aio(mm);
 	ksm_exit(mm);
 	khugepaged_exit(mm); /* must run before exit_mmap */
+	kscand_exit(mm);
 	exit_mmap(mm);
 	mm_put_huge_zero_folio(mm);
 	set_mm_exe_file(mm, NULL);
diff --git a/mm/kscand.c b/mm/kscand.c
index f7bbbc70c86a..d5b0d3041b0f 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -7,12 +7,14 @@
 #include <linux/swap.h>
 #include <linux/mm_inline.h>
 #include <linux/kthread.h>
+#include <linux/kscand.h>
 #include <linux/string.h>
 #include <linux/delay.h>
 #include <linux/cleanup.h>
 
 #include <asm/pgalloc.h>
 #include "internal.h"
+#include "mm_slot.h"
 
 static struct task_struct *kscand_thread __read_mostly;
 static DEFINE_MUTEX(kscand_mutex);
@@ -29,11 +31,23 @@ static bool need_wakeup;
 
 static unsigned long kscand_sleep_expire;
 
+static DEFINE_SPINLOCK(kscand_mm_lock);
 static DECLARE_WAIT_QUEUE_HEAD(kscand_wait);
 
+#define KSCAND_SLOT_HASH_BITS 10
+static DEFINE_READ_MOSTLY_HASHTABLE(kscand_slots_hash, KSCAND_SLOT_HASH_BITS);
+
+static struct kmem_cache *kscand_slot_cache __read_mostly;
+
+/* Per mm information collected to control VMA scanning */
+struct kscand_mm_slot {
+	struct mm_slot slot;
+};
+
 /* Data structure to keep track of current mm under scan */
 struct kscand_scan {
 	struct list_head mm_head;
+	struct kscand_mm_slot *mm_slot;
 };
 
 struct kscand_scan kscand_scan = {
@@ -69,6 +83,12 @@ static void kscand_wait_work(void)
 	wait_event_timeout(kscand_wait, kscand_should_wakeup(),
 			scan_sleep_jiffies);
 }
+
+static inline int kscand_test_exit(struct mm_struct *mm)
+{
+	return atomic_read(&mm->mm_users) == 0;
+}
+
 static void kscand_do_scan(void)
 {
 	unsigned long iter = 0, mms_to_scan;
@@ -109,6 +129,65 @@ static int kscand(void *none)
 	return 0;
 }
 
+static inline void kscand_destroy(void)
+{
+	kmem_cache_destroy(kscand_slot_cache);
+}
+
+void __kscand_enter(struct mm_struct *mm)
+{
+	struct kscand_mm_slot *kscand_slot;
+	struct mm_slot *slot;
+	int wakeup;
+
+	/* __kscand_exit() must not run from under us */
+	VM_BUG_ON_MM(kscand_test_exit(mm), mm);
+
+	kscand_slot = mm_slot_alloc(kscand_slot_cache);
+
+	if (!kscand_slot)
+		return;
+
+	slot = &kscand_slot->slot;
+
+	spin_lock(&kscand_mm_lock);
+	mm_slot_insert(kscand_slots_hash, mm, slot);
+
+	wakeup = list_empty(&kscand_scan.mm_head);
+	list_add_tail(&slot->mm_node, &kscand_scan.mm_head);
+	spin_unlock(&kscand_mm_lock);
+
+	mmgrab(mm);
+	if (wakeup)
+		wake_up_interruptible(&kscand_wait);
+}
+
+void __kscand_exit(struct mm_struct *mm)
+{
+	struct kscand_mm_slot *mm_slot;
+	struct mm_slot *slot;
+	int free = 0;
+
+	spin_lock(&kscand_mm_lock);
+	slot = mm_slot_lookup(kscand_slots_hash, mm);
+	mm_slot = mm_slot_entry(slot, struct kscand_mm_slot, slot);
+	if (mm_slot && kscand_scan.mm_slot != mm_slot) {
+		hash_del(&slot->hash);
+		list_del(&slot->mm_node);
+		free = 1;
+	}
+
+	spin_unlock(&kscand_mm_lock);
+
+	if (free) {
+		mm_slot_free(kscand_slot_cache, mm_slot);
+		mmdrop(mm);
+	} else if (mm_slot) {
+		mmap_write_lock(mm);
+		mmap_write_unlock(mm);
+	}
+}
+
 static int start_kscand(void)
 {
 	struct task_struct *kthread;
@@ -149,6 +228,12 @@ static int __init kscand_init(void)
 {
 	int err;
 
+	kscand_slot_cache = KMEM_CACHE(kscand_mm_slot, 0);
+
+	if (!kscand_slot_cache) {
+		pr_err("kscand: kmem_cache error");
+		return -ENOMEM;
+	}
 	err = start_kscand();
 	if (err)
 		goto err_kscand;
@@ -157,6 +242,7 @@ static int __init kscand_init(void)
 
 err_kscand:
 	stop_kscand();
+	kscand_destroy();
 
 	return err;
 }
-- 
2.34.1

