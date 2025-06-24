Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCBB241116
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744682; cv=fail; b=aMHA4wmvRh3lawfCB4RciWP3tOrF3c4Yg5ZPFZYGRzyzotcnDzNq9X9v362St00yglVZC5xMmwc17v1UF/F3A1546YT7j2z1UefRpbW31UU5hMOnjSnWZyF6rIshrepm+e1650QESAy/o39K0cIcg/koZJUT7vBMExg+ZjONvMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744682; c=relaxed/simple;
	bh=QMxHxEisa9gd/DwGZI+p4bpmKZdWipqdRizPxFi94Js=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHzJ02tUvgisnLdr1FNCA2hXwpyqoRjX3t+jWpoA2vh1CAAUsx6KtruQaXcZm+4mIqGZ5ImOWomHJ+OH3d3V13+X60qfuzdD3JN+P5vZiX9e/WIHk1iHS8FM6iHihleVncgP42LnKgbB7SH/QtVaHKWaWtY3TrGTO2JMX+vpQ1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VSuTX4k0; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VSuTX4k0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWKiEZ2HEUHSKW3ZVtUZAgswzlboMXFosdhc8OcE7EeaOSS29PjOqayh/J697u+DeUFoz+tTRH/O3LUu2EmugU0bgUy9ujSQj0OJAXHDq3MA0cB95AxHW4wRfxy79HPacn0NwBd0v96E7GOqyXMLUNNnVaf1WwGpV55HVHZoAWS5adHGHxN8ot2EZLQvi4ynTcnjsFtjLGfd74RazYDECk3zQSq/L627tCzOQOoaGJVXuVEZU4m5jkGTpIGAiG1uWPK2LwhdoWbkGt58WrpAagbt/M5r21PQUwPyG1gWw2HyICcajel9c79Er+byKdR2xrDkDilrICuTm8cgxog6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk35rIFkUSNo9wlPLmTXZUYQYCvIiEHxKbhpJSS5BDE=;
 b=W467jeNWm0fqw97mEZvtYqW/RFhuBJCaXOzD5p7FxOEpOaiDDb1yrmJBg36Eq7q+H4uZQ4a8aMnt7Lrba0UefojKWgdEJiwbv6NCRe52SMDkccw7WP3s6F8/f2Ho8gzvihV6nH4TaVhklghPjybC/G7sv5S2OB1tjBFj7sX6HYlGdZc4WDrA4FMKS5bAHTsHE78b7d6IhpWqqIk2KeF2oVQGn0lkBk6eNZqAOk8pS9gvw7+IIgu7dlVuWggbVIYQH7dIqK4Tu267r/FuAkU6bY6HrSXbWTRf1LstTpyR7ZnEEC57faE9fGIE6Ts3tULaUrpYsVwfiIK7fG/PzbhLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk35rIFkUSNo9wlPLmTXZUYQYCvIiEHxKbhpJSS5BDE=;
 b=VSuTX4k0dcS8MDaOP2xkl9vxog7XLrAG76ZMirXkPs9gESefdeVtCNi8JYMFRFSuhvwyqXrFUNeuvW48c0/3OGUG5m04d12PsbdJ2WyJN4wUnslc+KuhBXjNdjzM7qkcbzr/+y0Y95lArs4vAHgC5sDtfM8gacNYZ+tp6NErT3Q=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 05:57:56 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9f) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 05:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:56 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:44 -0500
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
Subject: [RFC PATCH V2 06/13] mm: Add throttling of mm scanning using scan_period
Date: Tue, 24 Jun 2025 05:56:10 +0000
Message-ID: <20250624055617.1291159-7-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d367f3d-0163-4ec8-6b32-08ddb2e410da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2W9w5xTgJaqloHejEqnhSUwBdYalnd7Odtt0mrl+mTo5Q8OPAjDuw6HI+7/Q?=
 =?us-ascii?Q?7JUwqTZsnBqZestbQHRm93D+pvk1kJgre2Rg/BErTNyElGuYNnD/zSLIVDBM?=
 =?us-ascii?Q?CbanTofunY0e/XWQxluO1h7EoSRrU46yu5G/ogw8Ipqv0TXZ1/O04GyW0sjv?=
 =?us-ascii?Q?jJYDbmwR6MROn2eMwQen9Bsd5M29qIcW3JIXu7hgYGmnY9AWq+RgEQp6SbE7?=
 =?us-ascii?Q?yb7eEQs9W/5IMxAWiZcvrP+G0efSCwPhZa4TT4GoGI/U5goAQm4rwyHRbjs8?=
 =?us-ascii?Q?fxbtGAbmmz9FlfBNr6htYHqTkd8Rm7GFATgys7rW3hdJ/W//28KsrzdMI/8F?=
 =?us-ascii?Q?CFXmUGrGsbzGqFDl5nQD3uPyQLOiS8UO9a3DzcZbT7MBp/V7HvnfHC+QNkB0?=
 =?us-ascii?Q?jnyX3WzTjXlK4ZDfLvU83hUC4F3evqcP8Chr9T+gFZpRTbIwkrm8XISt6aW0?=
 =?us-ascii?Q?KCGYiV7k1nNq9lz/ITLp2O7ZCNP1uaNTB0CFWklaq89dHSVw7hdrfJI8ghH4?=
 =?us-ascii?Q?5QOZEqxZirVXlirnHZu7RrxQkRJm3c7WBfo2JOsmzt1yRL24/WezmyYHNRVi?=
 =?us-ascii?Q?a1Jw07LzFH7V8Eeb90tpuz3xqsxFX5K6FofEJBFmQ9I33pppQNs+1FVdaqBe?=
 =?us-ascii?Q?Uxr6uWjSuNueBLnURezVKppJJ2kifnimHCGNzL3O4hHkJtpRimnfvFdRkEKr?=
 =?us-ascii?Q?azHpdBiwRptR1XLcOg4ybapK66Wn6M2q0+bgr6wA7Hrfmj/EDTy086a/bYGX?=
 =?us-ascii?Q?ShCLyKtG1cStk6P99K/pwAModkgZr7flO7+jhdAvMEFHML5o2MWgQUuKpTks?=
 =?us-ascii?Q?mWTrGiPGGfRclUGbxUHU2VHtCz60jUEBNBM2v2ELIBxmHg5zIEDcxEbUDTbT?=
 =?us-ascii?Q?iYzEKRMDtPHjpXyjS/ICqsARAJmmtS3rnkbQN89bymktQCcOUszkPrMY6JaB?=
 =?us-ascii?Q?SbwGmIY8AU9WiwGfBdv018v8wuIJa/HZTDqDh5NE4wnGNlbeuGAXbpPX9qGs?=
 =?us-ascii?Q?0e1drJCBF1aXO37dL9SIQf6GuCu24AO6wviDw4aYshI1nN8unzVKkle82uGh?=
 =?us-ascii?Q?y2BYDOis6zqqoYzAG1NlwYp2ijLS1URn9i05k10uboVFhO5YTkj5EGUByzsT?=
 =?us-ascii?Q?EdZ30TAqcE1abhGANWt4BVeBj1VYifgAgyz30TgX1KwNh3G6bY4xC5wmKTRw?=
 =?us-ascii?Q?qoAlGJp1Dru+Tt2/mj+EpSaUH8lulav5InC/d3xyEh2bBIG8DmEj4rfwV0Tp?=
 =?us-ascii?Q?EGR6InlMNq5PFJaluTkYYh9PailWvs9E744SSGrZuUsJqDnzDYOcBcLf336V?=
 =?us-ascii?Q?yzALiWOQYqxSsUoA6yduEeNvNcqXpKiJrB5rvD68xVaXRhqh2j4hc2IRPnQa?=
 =?us-ascii?Q?d4Tl+ndFGvjQbH3d64yc+u9oObEuGd85sqHvYiGOG3UUFqQKVNHEC3xwPe+S?=
 =?us-ascii?Q?W6T1FuSe0bv0UJ551x8rFdM384xLkQOM6fAgz9GFxgu5iailvSIg1gaNpe2a?=
 =?us-ascii?Q?xP49n/TcgJifOJM5r3EH91l+CAiDvklNzKDu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:56.0309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d367f3d-0163-4ec8-6b32-08ddb2e410da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376

Before this patch, scanning of tasks' mm is done continuously and also
at the same rate.

Improve that by adding a throttling logic:
1) If there were useful pages found during last scan and current scan,
decrease the scan_period (to increase scan rate) by TUNE_PERCENT (15%).

2) If there were no useful pages found in last scan, and there are
candidate migration pages in the current scan decrease the scan_period
aggressively by 2 power SCAN_CHANGE_SCALE (2^3 = 8 now).

Vice versa is done for the reverse case.
Scan period is clamped between MIN (600ms) and MAX (5sec).

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/mm/kscand.c b/mm/kscand.c
index f79e05590cde..fca4b7b4a81f 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -20,6 +20,7 @@
 #include <linux/string.h>
 #include <linux/delay.h>
 #include <linux/cleanup.h>
+#include <linux/minmax.h>
 
 #include <asm/pgalloc.h>
 #include "internal.h"
@@ -33,6 +34,16 @@ static DEFINE_MUTEX(kscand_mutex);
 #define KSCAND_SCAN_SIZE	(1 * 1024 * 1024 * 1024UL)
 static unsigned long kscand_scan_size __read_mostly = KSCAND_SCAN_SIZE;
 
+/*
+ * Scan period for each mm.
+ * Min: 600ms default: 2sec Max: 5sec
+ */
+#define KSCAND_SCAN_PERIOD_MAX	5000U
+#define KSCAND_SCAN_PERIOD_MIN	600U
+#define KSCAND_SCAN_PERIOD		2000U
+
+static unsigned int kscand_mm_scan_period_ms __read_mostly = KSCAND_SCAN_PERIOD;
+
 /* How long to pause between two scan cycles */
 static unsigned int kscand_scan_sleep_ms __read_mostly = 20;
 
@@ -78,6 +89,11 @@ static struct kmem_cache *kmigrated_slot_cache __read_mostly;
 /* Per mm information collected to control VMA scanning */
 struct kscand_mm_slot {
 	struct mm_slot slot;
+	/* Unit: ms. Determines how aften mm scan should happen. */
+	unsigned int scan_period;
+	unsigned long next_scan;
+	/* Tracks how many useful pages obtained for migration in the last scan */
+	unsigned long scan_delta;
 	long address;
 	bool is_scanned;
 };
@@ -713,13 +729,92 @@ static void kmigrated_migrate_folio(void)
 	}
 }
 
+/*
+ * This is the normal change percentage when old and new delta remain same.
+ * i.e., either both positive or both zero.
+ */
+#define SCAN_PERIOD_TUNE_PERCENT	15
+
+/* This is to change the scan_period aggressively when deltas are different */
+#define SCAN_PERIOD_CHANGE_SCALE	3
+/*
+ * XXX: Hack to prevent unmigrated pages coming again and again while scanning.
+ * Actual fix needs to identify the type of unmigrated pages OR consider migration
+ * failures in next scan.
+ */
+#define KSCAND_IGNORE_SCAN_THR	256
+
+/* Maintains stability of scan_period by decaying last time accessed pages */
+#define SCAN_DECAY_SHIFT	4
+/*
+ * X : Number of useful pages in the last scan.
+ * Y : Number of useful pages found in current scan.
+ * Tuning scan_period:
+ *	Initial scan_period is 2s.
+ *	case 1: (X = 0, Y = 0)
+ *		Increase scan_period by SCAN_PERIOD_TUNE_PERCENT.
+ *	case 2: (X = 0, Y > 0)
+ *		Decrease scan_period by (2 << SCAN_PERIOD_CHANGE_SCALE).
+ *	case 3: (X > 0, Y = 0 )
+ *		Increase scan_period by (2 << SCAN_PERIOD_CHANGE_SCALE).
+ *	case 4: (X > 0, Y > 0)
+ *		Decrease scan_period by SCAN_PERIOD_TUNE_PERCENT.
+ */
+static inline void kscand_update_mmslot_info(struct kscand_mm_slot *mm_slot,
+				unsigned long total)
+{
+	unsigned int scan_period;
+	unsigned long now;
+	unsigned long old_scan_delta;
+
+	scan_period = mm_slot->scan_period;
+	old_scan_delta = mm_slot->scan_delta;
+
+	/* decay old value */
+	total = (old_scan_delta >> SCAN_DECAY_SHIFT) + total;
+
+	/* XXX: Hack to get rid of continuously failing/unmigrateable pages */
+	if (total < KSCAND_IGNORE_SCAN_THR)
+		total = 0;
+
+	/*
+	 * case 1: old_scan_delta and new delta are similar, (slow) TUNE_PERCENT used.
+	 * case 2: old_scan_delta and new delta are different. (fast) CHANGE_SCALE used.
+	 * TBD:
+	 * 1. Further tune scan_period based on delta between last and current scan delta.
+	 * 2. Optimize calculation
+	 */
+	if (!old_scan_delta && !total) {
+		scan_period = (100 + SCAN_PERIOD_TUNE_PERCENT) * scan_period;
+		scan_period /= 100;
+	} else if (old_scan_delta && total) {
+		scan_period = (100 - SCAN_PERIOD_TUNE_PERCENT) * scan_period;
+		scan_period /= 100;
+	} else if (old_scan_delta && !total) {
+		scan_period = scan_period << SCAN_PERIOD_CHANGE_SCALE;
+	} else {
+		scan_period = scan_period >> SCAN_PERIOD_CHANGE_SCALE;
+	}
+
+	scan_period = clamp(scan_period, KSCAND_SCAN_PERIOD_MIN, KSCAND_SCAN_PERIOD_MAX);
+
+	now = jiffies;
+	mm_slot->next_scan = now + msecs_to_jiffies(scan_period);
+	mm_slot->scan_period = scan_period;
+	mm_slot->scan_delta = total;
+}
+
 static unsigned long kscand_scan_mm_slot(void)
 {
 	bool next_mm = false;
 	bool update_mmslot_info = false;
 
+	unsigned int mm_slot_scan_period;
+	unsigned long now;
+	unsigned long mm_slot_next_scan;
 	unsigned long vma_scanned_size = 0;
 	unsigned long address;
+	unsigned long total = 0;
 
 	struct mm_slot *slot;
 	struct mm_struct *mm;
@@ -744,6 +839,8 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	mm = slot->mm;
 	mm_slot->is_scanned = true;
+	mm_slot_next_scan = mm_slot->next_scan;
+	mm_slot_scan_period = mm_slot->scan_period;
 	spin_unlock(&kscand_mm_lock);
 
 	if (unlikely(!mmap_read_trylock(mm)))
@@ -754,6 +851,11 @@ static unsigned long kscand_scan_mm_slot(void)
 		goto outerloop;
 	}
 
+	now = jiffies;
+
+	if (mm_slot_next_scan && time_before(now, mm_slot_next_scan))
+		goto outerloop;
+
 	VMA_ITERATOR(vmi, mm, address);
 
 	kmigrated_mm_slot = kmigrated_get_mm_slot(mm, false);
@@ -784,8 +886,10 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	update_mmslot_info = true;
 
-	if (update_mmslot_info)
+	if (update_mmslot_info) {
 		mm_slot->address = address;
+		kscand_update_mmslot_info(mm_slot, total);
+	}
 
 outerloop:
 	/* exit_mmap will destroy ptes after this */
@@ -887,6 +991,10 @@ void __kscand_enter(struct mm_struct *mm)
 		return;
 
 	kscand_slot->address = 0;
+	kscand_slot->scan_period = kscand_mm_scan_period_ms;
+	kscand_slot->next_scan = 0;
+	kscand_slot->scan_delta = 0;
+
 	slot = &kscand_slot->slot;
 
 	spin_lock(&kscand_mm_lock);
-- 
2.34.1

