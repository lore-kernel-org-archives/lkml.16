Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730622CBEC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744626; cv=fail; b=OoLnqnwXASlEpcavnLTA5XlFWxD+rEU/tnCCEvqYkhYSD89mLrPmQyTnLITPtEpjUYGNRztuylMUumaIS1ItWec/ctC4ctcc7R26GnTZwRqit+ab5VUbPNQG2qkNqKM+UkdMU/tAXnyf1PuDP67Gny8zbC6Y4/alIcaCrvkMnvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744626; c=relaxed/simple;
	bh=Y9BBbN0giuULO+dtcOaFqnffqgXakuiQQ8se8ggY9+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5PUl4KlrrWLKOyV+g+qavKl4GjUJUTCpq3SXctneDChyJDb+SgWwqcPKBdh0NqTtAo90vSJCB5ngXtXdsriz4bhCT2muUkWOF9NT80xtY+rWxLreI7Sn/I/JO6I5OQdqw8wdlCNaA0q57ThNaouCSd5rQchOngMc7p9j3Q+rzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3j9zdA5e; arc=fail smtp.client-ip=40.107.95.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3j9zdA5e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtIRBR2/Gi5Y6FDtq+3XQEBbxzqOJ876Xa4VMKSN8PWzkYY8tXp+seXPABckTuekXMRPWpDSNX7XkzHx/TCN07QEwrYHjCEcqjbt7tCkHPbuoof9pa7i6CZI6Jm2IRbR1NDvlXjJeJVQuVTb5lqGCxrti+PhTpD9XQe5Z+VdK4egKVCzIrQZqJW5eSDpL4NHjSvCvz+3O5Z4rhC357whoXIloayhCv1henTM3Lh8ZBJAi4BgBrA2kI4tlHZzYNApRrf9RSA7pKQNu6s0t0BqacbsNq0FtoO0NdNGQTqjTAQTDWVHMgscvjDPg61v/cxgjrHt3D68qxJ6Q1tbqaR1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hglcXND/1hQIbXGjSGlRxrAVs0gQHvtkwFHzUUuRDYI=;
 b=H2LUO9RDmIvRlQ6likFOoupMalR0dH8eXZ0RnnJZd6I6Mc/0N3W/8Mem0xB+lNcyytBUbUqvkB/1I2eI9BPbF2HGzthfLGNTJm/Ds0BHe0PsBfyRG7V5JU374zQ7+2CrbkaW0KQCdRSJBl9Czee8VVAVTcoBT8vHPuhPbh1msQbe4u0rI0GU/9JLdFzLcEZu+O+sebEVRatVhU7WWjasgb3kUNU9MgTUoh7nOkWwtgmowBb/CaWGLWqsO5oc35JRtYacRQtkk8hbr0+tOmqSlul2tt92EezLS1KThWLJ5LGjDUgUTLKGjETgDXGW/Nx2FZBv4jEKeKD7yTjChDU+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hglcXND/1hQIbXGjSGlRxrAVs0gQHvtkwFHzUUuRDYI=;
 b=3j9zdA5e4CkPTCimLti1pqQhJc2Gl/Ae1g4p41aXZtqQLTtY3eANj5+7DicnESsC3ohsJjLEYFK4n+xoMDLJiaaKdWMw70GorsJfFMR1yulIocwuRTC4V4n38+VT9RNfsZJSnSI0o+CFbsqoMI+ScpQBzo4MPLdPmkjGZfGCA7M=
Received: from BN9PR03CA0169.namprd03.prod.outlook.com (2603:10b6:408:f4::24)
 by CY1PR12MB9604.namprd12.prod.outlook.com (2603:10b6:930:108::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:57:00 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::fe) by BN9PR03CA0169.outlook.office365.com
 (2603:10b6:408:f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:57:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:00 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:56:49 -0500
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
Subject: [RFC PATCH V2 01/13] mm: Add kscand kthread for PTE A bit scan
Date: Tue, 24 Jun 2025 05:56:05 +0000
Message-ID: <20250624055617.1291159-2-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY1PR12MB9604:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ad5650-416b-4b1d-99ef-08ddb2e3ef9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Byw9aLpx2wPmNIAXmc6rLjZLr1GTfNzk/9vMW9JpL60l82Us8AjjONfOotR+?=
 =?us-ascii?Q?oVhZ5i0arDyMhcwspKRGeWi0uo3Jha3kuwbjrt6bQNMEcBr0C0pYw+yuKyrk?=
 =?us-ascii?Q?FFyVyBKQyiwlB4GlvtS7gu6Cj1238vya2dncqL7ngpKfELP7B13g6wbv/ze7?=
 =?us-ascii?Q?yhsIlagU0jA+aPCToK7qpZwSwsswtvnTqpg8p6j8OsSwnPlM1YAuptRUFXKV?=
 =?us-ascii?Q?5pLpiDAtJWkGUFyerZBqJi3NjY2z5jPZacZwNHvaDfMiU4rYKAHiNoFgVuc3?=
 =?us-ascii?Q?yS5p9h9asvxILIlGcfp4Z0RO2ziFuou5sxvIUWsk5UXSLuqtCd/htvoRpiha?=
 =?us-ascii?Q?PJoTgP/owZLXANXMmJKRv3TO7qYvQzhWKa8NqevYApyT23QWwZxyvIRXs/GS?=
 =?us-ascii?Q?t7W2dtp9nyf16ZERWLliUR3DtNNt414rwUUiZDuvNkhxcRSB7zYqHVm7+gd3?=
 =?us-ascii?Q?/Ze2aqQZYynWINiiED+o+bP/L5fcsF5WPn/e1zAptqTzBJquUDEw+hJhYQEe?=
 =?us-ascii?Q?th4++IXvhSvLnJuNUFjvFgP7vxAeXwVZ0eOaxA3Ac9GW6iJuUlcV3hJ0MizP?=
 =?us-ascii?Q?TBWZRB0jIV3hCp39R2A5jqyBeXROeBfEFtLPrHgOiQSyZmZ4c2CLCic1HBq+?=
 =?us-ascii?Q?yNqEGDzCt7KP3ZVzwbiVKLl0O7kDkD9jU+ytlaYEFtKoWEIjw/xEHV3ocCzo?=
 =?us-ascii?Q?taKaBfVXS5AnSVTJlb9kcHxg1AUWAY3P8zRQ9trxDjZWdrnDS4Kvz6gpe7Wl?=
 =?us-ascii?Q?E0X8DYqwBAPTHEUbbms3td4SL+sHPxAJDdQ9KsL5yQHjyWiW/vo4TN29R0KX?=
 =?us-ascii?Q?cISUORp+smjjFkyc+lubGipRkbsG8eDyvDO9wbd/Acudw4QdVMa0lYV+NBGI?=
 =?us-ascii?Q?qpOOLa/Rp3r0wMFVCJLebIG4e3XdxWmQd/AYBkmsfH0ktUDKeua2inXkMg9j?=
 =?us-ascii?Q?geCnX45Ha/U8B51l4D/bDUHTEU4Sz3/qNS1h3JlRtVFQ6VXdfG9oDNf8iAA8?=
 =?us-ascii?Q?ymJdp0tNNsbm/pH/5M072EgNE5JILO8VWhiUj1+WVcc21w650S1AXji7WWh0?=
 =?us-ascii?Q?+gQCCiGS1/Unmf/8tzGjMke8+sSq5povuxuhzPr8xel2X1PtP6ZpXBaaiq6Q?=
 =?us-ascii?Q?zyaQOJMOf0SSlDtVMIw9LcL9kZyRH2e9vog7RnfqsCiKTuPm5u7YmczxUCgI?=
 =?us-ascii?Q?IyhGstlEp0Ziufx9AK7i1h2ZLYtB+JWvLX4a7oaOK1hh+ZHyH4vPqLJyC85+?=
 =?us-ascii?Q?IyW4PpfirrYyq54tZdg4G1s22QGwO1hA91WOUMyD52EhKLQL1LiiJ8ZqJhLW?=
 =?us-ascii?Q?AlZuxPSdSiPlt4zpQ039nNJsyxdMxzmLH121YSRAgb3TRscuT7KY6H58uA3p?=
 =?us-ascii?Q?jJhocTwuGz5YwNvxuJcUbG4PlgG/2xI54p5u3hWLbesT0ebYVT/EYohWdDKv?=
 =?us-ascii?Q?TU4hWQ8XXhMgrZaR3eq6BXbpeD2qCu/Kuj4ok7d1AnBqmWu72DqfIQDDRu4p?=
 =?us-ascii?Q?AUv87WhyBq9sjhoHoHBhaPfJiR8l3HPZd/Uw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:00.3331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ad5650-416b-4b1d-99ef-08ddb2e3ef9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9604

Also add a config option for the same.

High level design:

While (1):
  Scan the slowtier pages belonging to VMAs of a task.
  Add to migation list.

A separate thread:
  Migrate scanned pages to a toptier node based on heuristics.

The overall code is influenced by khugepaged design.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/Kconfig  |   8 +++
 mm/Makefile |   1 +
 mm/kscand.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 mm/kscand.c

diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b493..062fa6bdf3fb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -746,6 +746,14 @@ config KSM
 	  until a program has madvised that an area is MADV_MERGEABLE, and
 	  root has set /sys/kernel/mm/ksm/run to 1 (if CONFIG_SYSFS is set).
 
+config KSCAND
+	bool "Enable PTE A bit scanning and Migration"
+	depends on NUMA_BALANCING
+	help
+	  Enable PTE A bit scanning of page. The option creates a separate
+	  kthread for scanning and migration. Accessed slow-tier pages are
+	  migrated to a regular NUMA node to reduce hot page access latency.
+
 config DEFAULT_MMAP_MIN_ADDR
 	int "Low address space to protect from user allocation"
 	depends on MMU
diff --git a/mm/Makefile b/mm/Makefile
index e7f6bbf8ae5f..f5e02d6fb1bc 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_FAIL_PAGE_ALLOC) += fail_page_alloc.o
 obj-$(CONFIG_MEMTEST)		+= memtest.o
 obj-$(CONFIG_MIGRATION) += migrate.o
 obj-$(CONFIG_NUMA) += memory-tiers.o
+obj-$(CONFIG_KSCAND) += kscand.o
 obj-$(CONFIG_DEVICE_MIGRATION) += migrate_device.o
 obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += huge_memory.o khugepaged.o
 obj-$(CONFIG_PAGE_COUNTER) += page_counter.o
diff --git a/mm/kscand.c b/mm/kscand.c
new file mode 100644
index 000000000000..f7bbbc70c86a
--- /dev/null
+++ b/mm/kscand.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/mm.h>
+#include <linux/mm_types.h>
+#include <linux/sched.h>
+#include <linux/sched/mm.h>
+#include <linux/mmu_notifier.h>
+#include <linux/swap.h>
+#include <linux/mm_inline.h>
+#include <linux/kthread.h>
+#include <linux/string.h>
+#include <linux/delay.h>
+#include <linux/cleanup.h>
+
+#include <asm/pgalloc.h>
+#include "internal.h"
+
+static struct task_struct *kscand_thread __read_mostly;
+static DEFINE_MUTEX(kscand_mutex);
+
+/* How long to pause between two scan cycles */
+static unsigned int kscand_scan_sleep_ms __read_mostly = 20;
+
+/* Max number of mms to scan in one scan cycle */
+#define KSCAND_MMS_TO_SCAN	(4 * 1024UL)
+static unsigned long kscand_mms_to_scan __read_mostly = KSCAND_MMS_TO_SCAN;
+
+bool kscand_scan_enabled = true;
+static bool need_wakeup;
+
+static unsigned long kscand_sleep_expire;
+
+static DECLARE_WAIT_QUEUE_HEAD(kscand_wait);
+
+/* Data structure to keep track of current mm under scan */
+struct kscand_scan {
+	struct list_head mm_head;
+};
+
+struct kscand_scan kscand_scan = {
+	.mm_head = LIST_HEAD_INIT(kscand_scan.mm_head),
+};
+
+static inline int kscand_has_work(void)
+{
+	return !list_empty(&kscand_scan.mm_head);
+}
+
+static inline bool kscand_should_wakeup(void)
+{
+	bool wakeup = kthread_should_stop() || need_wakeup ||
+	       time_after_eq(jiffies, kscand_sleep_expire);
+
+	need_wakeup = false;
+
+	return wakeup;
+}
+
+static void kscand_wait_work(void)
+{
+	const unsigned long scan_sleep_jiffies =
+		msecs_to_jiffies(kscand_scan_sleep_ms);
+
+	if (!scan_sleep_jiffies)
+		return;
+
+	kscand_sleep_expire = jiffies + scan_sleep_jiffies;
+
+	/* Allows kthread to pause scanning */
+	wait_event_timeout(kscand_wait, kscand_should_wakeup(),
+			scan_sleep_jiffies);
+}
+static void kscand_do_scan(void)
+{
+	unsigned long iter = 0, mms_to_scan;
+
+	mms_to_scan = READ_ONCE(kscand_mms_to_scan);
+
+	while (true) {
+		if (unlikely(kthread_should_stop()) ||
+			!READ_ONCE(kscand_scan_enabled))
+			break;
+
+		if (kscand_has_work())
+			msleep(100);
+
+		iter++;
+
+		if (iter >= mms_to_scan)
+			break;
+		cond_resched();
+	}
+}
+
+static int kscand(void *none)
+{
+	while (true) {
+		if (unlikely(kthread_should_stop()))
+			break;
+
+		while (!READ_ONCE(kscand_scan_enabled)) {
+			cpu_relax();
+			kscand_wait_work();
+		}
+
+		kscand_do_scan();
+
+		kscand_wait_work();
+	}
+	return 0;
+}
+
+static int start_kscand(void)
+{
+	struct task_struct *kthread;
+
+	guard(mutex)(&kscand_mutex);
+
+	if (kscand_thread)
+		return 0;
+
+	kthread = kthread_run(kscand, NULL, "kscand");
+	if (IS_ERR(kscand_thread)) {
+		pr_err("kscand: kthread_run(kscand) failed\n");
+		return PTR_ERR(kthread);
+	}
+
+	kscand_thread = kthread;
+	pr_info("kscand: Successfully started kscand");
+
+	if (!list_empty(&kscand_scan.mm_head))
+		wake_up_interruptible(&kscand_wait);
+
+	return 0;
+}
+
+static int stop_kscand(void)
+{
+	guard(mutex)(&kscand_mutex);
+
+	if (kscand_thread) {
+		kthread_stop(kscand_thread);
+		kscand_thread = NULL;
+	}
+
+	return 0;
+}
+
+static int __init kscand_init(void)
+{
+	int err;
+
+	err = start_kscand();
+	if (err)
+		goto err_kscand;
+
+	return 0;
+
+err_kscand:
+	stop_kscand();
+
+	return err;
+}
+subsys_initcall(kscand_init);
-- 
2.34.1

