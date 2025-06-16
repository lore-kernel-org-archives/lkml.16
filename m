Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312982877D6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081270; cv=fail; b=jE70C3hsJNq8uhWULK9Yjlu3Eqr2jaXE3vJL8IetypPxDScM/DP07E0dg7zbiWrX+C5CInugTVgiOHzDR1pQWwwhiD/Y2qY5SQYhVXVN7JlhUNF3VYUEeGqUGCEH6dM3WaIdBDexyt5QppeuS5/N+xHe/fVyyUDmm6l/2tPfRgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081270; c=relaxed/simple;
	bh=9ZGJa5rYwZnky1bskagr5zhcLs7DRH2wI7Qnjtew8cw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IepcrfM5Od5p7wm5LmiquxCE9KENC0XF4ABbt03HUvA14tCEJzZd0lnywAPo+IulYnjeqnWjX+xJkcS8LrxqCIdo1E+mQwMTN0k9GPX3Eiw6TH9PZJb+1uH8x6F5OzzDl2RryU3mW9I8MEQQF4siiuULK6TxVSI3cCOf1QRwOPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nsqsyWOo; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nsqsyWOo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSGiOFwhAzX6+X9MTJjWBhNfZeBESHA+znyMJYURIvp1iwbVPTK9FnpAhLc5KdtSdo1BB1+Rvvjf2d4HhG/6uJQ1hM8Jlu93CE7u9hmuGEYzkDuVqee8brf9im8HzfQ0W7YbDxwyrpucEDHMsAf+ed58GtR09kkwwlUmOCtK6b5KFzK3VNnYQdj5XsW7qcvp6lQzl4u6o0KK19LsS0aH5bSmGkCKWxpVqTiPpa0DpbSwVUGG6OxFBN72qzUEUSos7t3K+kqlm01lvfNNJf9Q8gm5JEUJrA9p4FpDjr3TuCJw8MoWBDfrs7Bw52wMbop4Lfo3OvNdJjDS8qP9fWssbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtvFA3x7Z9k0MQ6dYrbalvJCVo0G2UC6SLH9leZKv1M=;
 b=Sq2aH9XlUMVJ/RD64IMJS7UNQvvEiuJurOlJLtelFBMDWeBtMI/9Ff7NuR29KICbL1K2PR4M8molv8hGWvKXFmF5copFvQJbmUtugB7mgP6tB1b+lIxUPRXIrkYGtJehyk+Rvwa27Jva3F7ZIUisoeU/tOROUl+dGKMVareijAdqjHTpUUhru14+z1b9Y7WAVG5qps79xte8+HaCcxksseSAWb3IUZJ3rpsfs+CBMLd7iDtnqeGne3i51zRhCeh0chFDFrSK5aABKVtifhr0d85IfiHejFDmhYvQ3XKmA92iDPCA5IX5VSiR6yvAYqPJUPzVwAwXVuNRBXDH7zI5uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtvFA3x7Z9k0MQ6dYrbalvJCVo0G2UC6SLH9leZKv1M=;
 b=nsqsyWOoWNHHoxqPVsBGVmexBCfbp5BQnbDMPslQ/Zyj/MjIv2vJPiLVUiJ3Ca5bKplC6kSrIomBqpqSQd64Qu91MsMHANLsX0mYMcKXZ5aCVodDv8IF2rsFJTkoiaWfCdDW5VdPTIXZ7bVmO5U6GQbAIXdL1mAuPeGPEw+nY2c=
Received: from DM6PR21CA0006.namprd21.prod.outlook.com (2603:10b6:5:174::16)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 13:41:06 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:174:cafe::55) by DM6PR21CA0006.outlook.office365.com
 (2603:10b6:5:174::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.4 via Frontend Transport; Mon,
 16 Jun 2025 13:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:41:05 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:40:57 -0500
From: Bharata B Rao <bharata@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <hannes@cmpxchg.org>, <mgorman@techsingularity.net>,
	<mingo@redhat.com>, <peterz@infradead.org>, <raghavendra.kt@amd.com>,
	<riel@surriel.com>, <rientjes@google.com>, <sj@kernel.org>,
	<weixugc@google.com>, <willy@infradead.org>, <ying.huang@linux.alibaba.com>,
	<ziy@nvidia.com>, <dave@stgolabs.net>, <nifan.cxl@gmail.com>,
	<xuezhengchu@huawei.com>, <yiannis@zptcorp.com>, <akpm@linux-foundation.org>,
	<david@redhat.com>, <bharata@amd.com>
Subject: [RFC PATCH v1 3/4] mm: kmigrated - Async kernel migration thread
Date: Mon, 16 Jun 2025 19:09:30 +0530
Message-ID: <20250616133931.206626-4-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616133931.206626-1-bharata@amd.com>
References: <20250616133931.206626-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: e6728915-fd4f-4c3f-1e60-08ddacdb717a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?739xXXvgMLrc+N9JQUsddEWmjc+cjfR6+vuwxUPpx3PCF72ORs/jLu1S8oM1?=
 =?us-ascii?Q?Kp2kIlKeDbdijv4zxDFQYwQ9T9Wp/UBL3riFmm9rdNJ2OMKvRGCAF/3c3sjR?=
 =?us-ascii?Q?BkIzED7YDdRCGn0SYFnJfYGZFUGKAOlhpL5t/N6NU3oY7/bEU04cBieOHaEL?=
 =?us-ascii?Q?r8gI9MuDmGbSPK4Ws+JV1mnTI5x9fmiFrjF8pGrDDR9WO075TN5lPwPGjCRv?=
 =?us-ascii?Q?fU8+XkVv8nbQeu0KyWm4NycK5to8Pc60KCutSK9VoVae0KcEcN36jf/vDKLP?=
 =?us-ascii?Q?SVXWp0X8EoDrIePIIgVOpyRBy1iBoUz1Ru4nJrTTITQmvMl6SNHp6LFs7Umd?=
 =?us-ascii?Q?XteO+Fb8IbmtOrSO2CURSrUFmp+F02hP+z3OSWhVR+YwqFkIbg5jZMWUCOUq?=
 =?us-ascii?Q?aGyVsTG1fTqw51GNdN7yAXKFE/K6ku/1JyKNzjtrIhEiVr9p+oDhvKM0Yaxx?=
 =?us-ascii?Q?eBz6pjTcNW5TA5SPAtw9NEO/z0pIZ8JDQrp/rpymoNM7uM2Zs14634SRKWFd?=
 =?us-ascii?Q?yI9hZ90RwUy3CllF/xp+KjYpOvgE5NB7ExOHjEhDpeWZdSyc6/V/0zlXoTAj?=
 =?us-ascii?Q?5lf6gla1Vm0ozMf4z4hfgHb+rMkH6zz9dhRvPk1rbhVGYliuCE4oFqwrHMS+?=
 =?us-ascii?Q?IyUUedf8CKI+DdrjoNQHX4cPcqgGehYAWML8V4+yNIyhZmj90gJknIEh/63K?=
 =?us-ascii?Q?kno6n1BbaGP14YPsoIr4Ptl72vxbL4vJZrz7EY7zzgkx2ytAlnQRmd0i+o5n?=
 =?us-ascii?Q?69XLPuhxVRAOOHxHQisJ01ab/Fz3Qa6X3AlYyfZr4IpO9789Zd5rxJcSofWf?=
 =?us-ascii?Q?vnvoNtWici9PDukip1uoD5/kAkVvWHBmVVjwkivk+G8//zhoEVizqmvH2IlY?=
 =?us-ascii?Q?aS3KAeeWRkMF1NVYATZPz+W0kzt43qjO6TkzgHo5Q2trgg/cXgjEiqNHnT/V?=
 =?us-ascii?Q?0jtWlrfQ1gsYX1/wnircebp2lt+CjOUZDwLTQae1mhs3IYv1DXNBWd7AOiE8?=
 =?us-ascii?Q?bAIKvIgRtQABG8LZGrlwMg2vC/6A7YffHB5jjQgOmyYQV9RQuLZYzXi/VzZL?=
 =?us-ascii?Q?mWsyujAjQAc/sbcyfUuLiK+O5eo35us7k4XCpv/9i43vOVR8Bxrd01QU1t95?=
 =?us-ascii?Q?/tdrHkDfEcfdcP3jqDxETulebf+o9Qu1U7jPAvgHyU4DslLVNOn5c/iPG4vg?=
 =?us-ascii?Q?oquukHQys/9hyp6yKPIWCh2gLuvZR+LxiuEV3cMMyrw5rbT8fCXpLdSZE5zK?=
 =?us-ascii?Q?ntb1vV8cHaPuTLEhsc/hP2dHxLeyN6/chRchs8WmycODNkF+NzEUPXtb20qZ?=
 =?us-ascii?Q?U8F096sSpyCxnt1KlsOLEAOhrOR8DKP7WQMeN0rEH0CMBm8SxNqrJtigl9Se?=
 =?us-ascii?Q?NIM/kbx6MS+10om4S8awRtJGU8fSRmYZ+0a3c8yZJ/1o16+YZIvDec6iXfSy?=
 =?us-ascii?Q?6jD7JWmqlAQDVVNibmxD2l5LHjH+SKhvwLbBCMS06v+sMFzqdL7nRqEve3jD?=
 =?us-ascii?Q?xmfyISY/Wk8lEp7Iv5KTxNdgtBBQ66xPq5tj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:41:05.7319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6728915-fd4f-4c3f-1e60-08ddacdb717a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384

kmigrated is a per-node kernel thread that migrates the
folios marked for migration in batches. Each kmigrated
thread walks the PFN range spanning its node and checks
for potential migration candidates.

It depends on the fields added to extended page flags
to determine the pages that need to be migrated and
the target NID.

Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 include/linux/mmzone.h   |   5 +
 include/linux/page_ext.h |  17 +++
 mm/Makefile              |   3 +-
 mm/kmigrated.c           | 223 +++++++++++++++++++++++++++++++++++++++
 mm/mm_init.c             |   6 ++
 mm/page_ext.c            |  11 ++
 6 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 mm/kmigrated.c

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..5d7f0b8d3c91 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -853,6 +853,8 @@ enum zone_type {
 
 };
 
+int kmigrated_add_pfn(unsigned long pfn, int nid);
+
 #ifndef __GENERATING_BOUNDS_H
 
 #define ASYNC_AND_SYNC 2
@@ -1049,6 +1051,7 @@ enum pgdat_flags {
 					 * many pages under writeback
 					 */
 	PGDAT_RECLAIM_LOCKED,		/* prevents concurrent reclaim */
+	PGDAT_KMIGRATED_ACTIVATE,	/* activates kmigrated */
 };
 
 enum zone_flags {
@@ -1493,6 +1496,8 @@ typedef struct pglist_data {
 #ifdef CONFIG_MEMORY_FAILURE
 	struct memory_failure_stats mf_stats;
 #endif
+	struct task_struct *kmigrated;
+	wait_queue_head_t kmigrated_wait;
 } pg_data_t;
 
 #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 76c817162d2f..4300c9dbafec 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -40,8 +40,25 @@ enum page_ext_flags {
 	PAGE_EXT_YOUNG,
 	PAGE_EXT_IDLE,
 #endif
+	/*
+	 * 32 bits following this are used by the migrator.
+	 * The next available bit position is 33.
+	 */
+	PAGE_EXT_MIGRATE_READY,
 };
 
+#define PAGE_EXT_MIG_NID_WIDTH	10
+#define PAGE_EXT_MIG_FREQ_WIDTH	3
+#define PAGE_EXT_MIG_TIME_WIDTH	18
+
+#define PAGE_EXT_MIG_NID_SHIFT	(PAGE_EXT_MIGRATE_READY + 1)
+#define PAGE_EXT_MIG_FREQ_SHIFT	(PAGE_EXT_MIG_NID_SHIFT + PAGE_EXT_MIG_NID_WIDTH)
+#define PAGE_EXT_MIG_TIME_SHIFT	(PAGE_EXT_MIG_FREQ_SHIFT + PAGE_EXT_MIG_FREQ_WIDTH)
+
+#define PAGE_EXT_MIG_NID_MASK	((1UL << PAGE_EXT_MIG_NID_SHIFT) - 1)
+#define PAGE_EXT_MIG_FREQ_MASK	((1UL << PAGE_EXT_MIG_FREQ_SHIFT) - 1)
+#define PAGE_EXT_MIG_TIME_MASK	((1UL << PAGE_EXT_MIG_TIME_SHIFT) - 1)
+
 /*
  * Page Extension can be considered as an extended mem_map.
  * A page_ext page is associated with every page descriptor. The
diff --git a/mm/Makefile b/mm/Makefile
index 1a7a11d4933d..5a382f19105f 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -37,7 +37,8 @@ mmu-y			:= nommu.o
 mmu-$(CONFIG_MMU)	:= highmem.o memory.o mincore.o \
 			   mlock.o mmap.o mmu_gather.o mprotect.o mremap.o \
 			   msync.o page_vma_mapped.o pagewalk.o \
-			   pgtable-generic.o rmap.o vmalloc.o vma.o vma_exec.o
+			   pgtable-generic.o rmap.o vmalloc.o vma.o vma_exec.o \
+			   kmigrated.o
 
 
 ifdef CONFIG_CROSS_MEMORY_ATTACH
diff --git a/mm/kmigrated.c b/mm/kmigrated.c
new file mode 100644
index 000000000000..3caefe4be0e7
--- /dev/null
+++ b/mm/kmigrated.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kmigrated is a kernel thread that runs for each node that has
+ * memory. It iterates over the node's PFNs and  migrates pages
+ * marked for migration into their targeted nodes.
+ *
+ * kmigrated depends on PAGE_EXTENSION to find out the pages that
+ * need to be migrated. In addition to a few fields that could be
+ * used by hot page promotion logic to store and evaluate the page
+ * hotness information, the extended page flags is field is extended
+ * to store the target NID for migration.
+ */
+#include <linux/mm.h>
+#include <linux/migrate.h>
+#include <linux/cpuhotplug.h>
+#include <linux/page_ext.h>
+
+#define KMIGRATE_DELAY	MSEC_PER_SEC
+#define KMIGRATE_BATCH	512
+
+static int page_ext_xchg_nid(struct page_ext *page_ext, int nid)
+{
+	unsigned long old_flags, flags;
+	int old_nid;
+
+	old_flags = READ_ONCE(page_ext->flags);
+	do {
+		flags = old_flags;
+		old_nid = (flags >> PAGE_EXT_MIG_NID_SHIFT) & PAGE_EXT_MIG_NID_MASK;
+
+		flags &= ~(PAGE_EXT_MIG_NID_MASK << PAGE_EXT_MIG_NID_SHIFT);
+		flags |= (nid & PAGE_EXT_MIG_NID_MASK) << PAGE_EXT_MIG_NID_SHIFT;
+	} while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
+
+	return old_nid;
+}
+
+/*
+ * Marks the page as ready for migration.
+ *
+ * @pfn: PFN of the page
+ * @nid: Target NID to were the page needs to be migrated
+ *
+ * The request for migration is noted by setting PAGE_EXT_MIGRATE_READY
+ * in the extended page flags which the kmigrated thread would check.
+ */
+int kmigrated_add_pfn(unsigned long pfn, int nid)
+{
+	struct page *page;
+	struct page_ext *page_ext;
+
+	page = pfn_to_page(pfn);
+	if (!page)
+		return -EINVAL;
+
+	page_ext = page_ext_get(page);
+	if (unlikely(!page_ext))
+		return -EINVAL;
+
+	page_ext_xchg_nid(page_ext, nid);
+	test_and_set_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags);
+	page_ext_put(page_ext);
+
+	set_bit(PGDAT_KMIGRATED_ACTIVATE, &page_pgdat(page)->flags);
+	return 0;
+}
+
+/*
+ * If the page has been marked ready for migration, return
+ * the NID to which it needs to be migrated to.
+ *
+ * If not return NUMA_NO_NODE.
+ */
+static int kmigrated_get_nid(struct page *page)
+{
+	struct page_ext *page_ext;
+	int nid = NUMA_NO_NODE;
+
+	page_ext = page_ext_get(page);
+	if (unlikely(!page_ext))
+		return nid;
+
+	if (!test_and_clear_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags))
+		goto out;
+
+	nid = page_ext_xchg_nid(page_ext, nid);
+out:
+	page_ext_put(page_ext);
+	return nid;
+}
+
+/*
+ * Walks the PFNs of the zone, isolates and migrates them in batches.
+ */
+static void kmigrated_walk_zone(unsigned long start_pfn, unsigned long end_pfn,
+				int src_nid)
+{
+	int nid, cur_nid = NUMA_NO_NODE;
+	LIST_HEAD(migrate_list);
+	int batch_count = 0;
+	struct folio *folio;
+	struct page *page;
+	unsigned long pfn;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		if (!pfn_valid(pfn))
+			continue;
+
+		page = pfn_to_online_page(pfn);
+		if (!page)
+			continue;
+
+		if (page_to_nid(page) != src_nid)
+			continue;
+
+		/*
+		 * TODO: Take care of folio_nr_pages() increment
+		 * to pfn count.
+		 */
+		folio = page_folio(page);
+		if (!folio_test_lru(folio))
+			continue;
+
+		nid = kmigrated_get_nid(page);
+		if (nid == NUMA_NO_NODE)
+			continue;
+
+		if (page_to_nid(page) == nid)
+			continue;
+
+		if (migrate_misplaced_folio_prepare(folio, NULL, nid))
+			continue;
+
+		if (cur_nid != NUMA_NO_NODE)
+			cur_nid = nid;
+
+		if (++batch_count >= KMIGRATE_BATCH || cur_nid != nid) {
+			migrate_misplaced_folios_batch(&migrate_list, cur_nid);
+			cur_nid = nid;
+			batch_count = 0;
+			cond_resched();
+		}
+		list_add(&folio->lru, &migrate_list);
+	}
+	if (!list_empty(&migrate_list))
+		migrate_misplaced_folios_batch(&migrate_list, cur_nid);
+}
+
+static void kmigrated_do_work(pg_data_t *pgdat)
+{
+	struct zone *zone;
+	int zone_idx;
+
+	clear_bit(PGDAT_KMIGRATED_ACTIVATE, &pgdat->flags);
+	for (zone_idx = 0; zone_idx < MAX_NR_ZONES; zone_idx++) {
+		zone = &pgdat->node_zones[zone_idx];
+
+		if (!populated_zone(zone))
+			continue;
+
+		if (zone_is_zone_device(zone))
+			continue;
+
+		kmigrated_walk_zone(zone->zone_start_pfn, zone_end_pfn(zone),
+				    pgdat->node_id);
+	}
+}
+
+static inline bool kmigrated_work_requested(pg_data_t *pgdat)
+{
+	return test_bit(PGDAT_KMIGRATED_ACTIVATE, &pgdat->flags);
+}
+
+static void kmigrated_wait_work(pg_data_t *pgdat)
+{
+	long timeout = msecs_to_jiffies(KMIGRATE_DELAY);
+
+	wait_event_timeout(pgdat->kmigrated_wait,
+			   kmigrated_work_requested(pgdat), timeout);
+}
+
+/*
+ * Per-node kthread that iterates over its PFNs and migrates the
+ * pages that have been marked for migration.
+ */
+static int kmigrated(void *p)
+{
+	pg_data_t *pgdat = (pg_data_t *)p;
+
+	while (!kthread_should_stop()) {
+		kmigrated_wait_work(pgdat);
+		kmigrated_do_work(pgdat);
+	}
+	return 0;
+}
+
+static void kmigrated_run(int nid)
+{
+	pg_data_t *pgdat = NODE_DATA(nid);
+
+	if (pgdat->kmigrated)
+		return;
+
+	pgdat->kmigrated = kthread_create(kmigrated, pgdat, "kmigrated%d", nid);
+	if (IS_ERR(pgdat->kmigrated)) {
+		pr_err("Failed to start kmigrated for node %d\n", nid);
+		pgdat->kmigrated = NULL;
+	} else {
+		wake_up_process(pgdat->kmigrated);
+	}
+}
+
+static int __init kmigrated_init(void)
+{
+	int nid;
+
+	for_each_node_state(nid, N_MEMORY)
+		kmigrated_run(nid);
+
+	return 0;
+}
+
+subsys_initcall(kmigrated_init)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f2944748f526..3a9cfd175366 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1398,6 +1398,11 @@ static void pgdat_init_kcompactd(struct pglist_data *pgdat)
 static void pgdat_init_kcompactd(struct pglist_data *pgdat) {}
 #endif
 
+static void pgdat_init_kmigrated(struct pglist_data *pgdat)
+{
+	init_waitqueue_head(&pgdat->kmigrated_wait);
+}
+
 static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
 {
 	int i;
@@ -1407,6 +1412,7 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
 
 	pgdat_init_split_queue(pgdat);
 	pgdat_init_kcompactd(pgdat);
+	pgdat_init_kmigrated(pgdat);
 
 	init_waitqueue_head(&pgdat->kswapd_wait);
 	init_waitqueue_head(&pgdat->pfmemalloc_wait);
diff --git a/mm/page_ext.c b/mm/page_ext.c
index c351fdfe9e9a..546725fffddb 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -76,6 +76,16 @@ static struct page_ext_operations page_idle_ops __initdata = {
 };
 #endif
 
+static bool need_page_mig(void)
+{
+	return true;
+}
+
+static struct page_ext_operations page_mig_ops __initdata = {
+	.need = need_page_mig,
+	.need_shared_flags = true,
+};
+
 static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_PAGE_OWNER
 	&page_owner_ops,
@@ -89,6 +99,7 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_PAGE_TABLE_CHECK
 	&page_table_check_ops,
 #endif
+	&page_mig_ops,
 };
 
 unsigned long page_ext_size;
-- 
2.34.1

