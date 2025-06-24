Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771DB235041
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744651; cv=fail; b=ro0C9xQ4bquBUNnB4rrx2gt6Oq58pvLv5wTm4llJ2qBYTAg+PrhK2A0V8XLwwudtW7Kx02OUllwY7DzAzQyM0sa/VpJNx1/1+hRHjtCpoN0qKcdrpo7NlWEigq8liENYnwiY84Auz7ONdJQrxQhWeF5bL1RY6zBhaSRP5d4LVG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744651; c=relaxed/simple;
	bh=DDTvV3EH0oSfBQ4LqDU8leK/MsSOmbUc0njsmecTL9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gS1uI/Xa3eXPSmnqPN2VbvBQZRb/bVHh9jYiuKx++hmcT5wqwPIfkXQxFqc0WYRj7EhkjrQ+grExJfAAoPM9MjjSoImUitQ7vThFnQBFv3CREyrQhZXYrVKu+aV6KagVz/IvA6ObtjfiPyIHw2y8M87Bidu1GNHuvt5ssMsC8Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lWawDI9/; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lWawDI9/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+Oc7nEAaUzkoFmZXQfAiBfRv3fhC7m+2bnWfXZ/xVH04aU+lCQDqIFI1VuEfA7fbUXN7cLJt2xWyfnqtsmrIcobOHItI0aITk0y71DeCi1byig3Dk0tqeVWRl/envNwgQ55M0vSSZw2qoxJe3E6QQdbWadNaUl8kxUhAct+rgAg67ePEVxck2FvTA+xh29FFu0InhMcyAWMRMZubZhR4431+n9KpTPrOktjImzBNeFA2saSki3UuqPbJROvUMPQ2wSDmq1eJa3ygie65UJsPvQ/qRy3EHc8f34KLeR9r+OhMtzMhScFxEC1OZE48+AQNWW5RsH7kC+fomNJrd2Qjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6STkvmOzsktuMwCeKmHnc/mXOYML/fSkkNuBZ+9J9M=;
 b=fA2wKAkVeBbSzqbN7NaJSGopQN7msLIQHyc3ilhG8LzhhScZQHTSnKlO/uISSK2vPbIEvabnBsV/U70s7P5AHqWtt+38anOw8ehJapKfLRLhYJXSqD+O1tIfiZlIvoC+oqot3gD4kLk6DzcouLPYdYgKJFDOmB14+w4FJBDCM4z6n8gPeeRKZnhXWuXDo3fuWSX/iKaqvf224+wKeqcvaV1e9IpnWHWGXpjrYcmpHzfPom7tr5aDv3wa9y6vL+vchIOTKP2i7SbjCEfPilAhPjfU9Sd0AhScvEVeORVHFBSU3doyaHTWqFuF/6OpaZQ/CumX8Bi9o2GfDpsoYSBkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6STkvmOzsktuMwCeKmHnc/mXOYML/fSkkNuBZ+9J9M=;
 b=lWawDI9/rOubQolwHHHKDCR5poq1mm8uebTHUppO5h6BXIQFp5iLabDm0F18+b2+2qnuMEy/mnJVcF29IsJqKIYXKn4zjpXipi3Oic9YqHaIobXE/pPHMwAyNJ24s1QuHqvjDKJqsdKF1kZe6RSa8vAO6S2YYKW0Aq4M+O21dOw=
Received: from BN9PR03CA0274.namprd03.prod.outlook.com (2603:10b6:408:f5::9)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 05:57:23 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::b2) by BN9PR03CA0274.outlook.office365.com
 (2603:10b6:408:f5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:22 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:11 -0500
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
Subject: [RFC PATCH V2 03/13] mm: Scan the mm and create a migration list
Date: Tue, 24 Jun 2025 05:56:07 +0000
Message-ID: <20250624055617.1291159-4-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fe6c97-093e-418b-b181-08ddb2e3fce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cuXkVDsJeDTK03J3IUvB14rPiyNpLXSXJ+WnirzEit4wCmzYQxDPZZ7HJRpj?=
 =?us-ascii?Q?v53PN8MoZiXrE+SAmc80ZxaV+KTg4QSQuDuTgmVF18qwFCwFT4l2DItTgxXU?=
 =?us-ascii?Q?CA/FC6OeTHi8KdpRXpGy5ny/1XVg4jtfOx0QJOaOR3iypSWuHlfSBJ2n6cRk?=
 =?us-ascii?Q?f7vS4cCAIFMj2Zc6KnD/jcRm0hWKab4A9vcw6w+nlWj8Dy1jvEvm0yqrDyTq?=
 =?us-ascii?Q?e5jpSwg64y+JJj/T23gn1siT34CYN58qwt3qgfHxX7AueXKZw2WykfKltKnU?=
 =?us-ascii?Q?x+FWKvYkYmTTBPfMv/W0sA1Jl25RleQ4OQxB4qJz9s1rZYwDn0TbzopuCBO+?=
 =?us-ascii?Q?vJYgGNMdjU/jFn+OrevsGiJX6tbAwmbIR3HMkUeD0o0kIiCy/UU8r/AjbYD5?=
 =?us-ascii?Q?2/BJJUdYeUMAjUrDAphAM4dt4Ovi2Igo3FA3a3i/eIHnm0Ev+/44WKkaR9IG?=
 =?us-ascii?Q?b/TkPjhtkdidpo2MGOAturKMJn9j/JJYLRvdZHPvn6nqK4xKTiaZgtioUXU6?=
 =?us-ascii?Q?rYbEko820QOrHPaEfeO15SpD9goDEIrpotn9X1799k1zErp9xeldtMi4w+bf?=
 =?us-ascii?Q?GQFXwQJOUU0KNzQUjPl4rCnQBdQSMQishGks8yktTlUOA/mWGQpHjl29dFhO?=
 =?us-ascii?Q?GCgFLKVSpOp1lwTCvUCsmxAayY3eUk7zKCMl9SIQ8JVZaUeq+KIEzXUMYmKy?=
 =?us-ascii?Q?X5k073l1CgvdxK41HVq+gyi1acOBeri9ikwS1klkR/6hmfYLSUwbnb+qwZeA?=
 =?us-ascii?Q?JLlKjA50HfHDuJFagVig4LAHntQTb1F7ql/nfXk7tttli4uZaM7Ka0QqXoDB?=
 =?us-ascii?Q?nqmHpwlTxmuPQ4zgz4OuTgr0AB1Z9DzrIZDWLcx2OZcdt5AcuhihdmTn89aU?=
 =?us-ascii?Q?ZdPuoIThO+xs5aEq5OztVbNLFJI8CZ31rz4cUucpGGOdab9yZPP+lhnOs5dO?=
 =?us-ascii?Q?yR+9RquAsgkF3S99MCD5Tb28UyjcJqhX8hrUnVxZEAhGRmzG3NLIG1vUuOog?=
 =?us-ascii?Q?SGZxuXu1pxvbEiVXfqp0cBOq3V34dr6NVbZXO0W6YJpxwIFLQUe9gB0Og4cs?=
 =?us-ascii?Q?E1qLz3Im0db+Bnfnn3b7ixLBSXV96t8NvP0yQU3ZRWhRJn4daOaCYeu8aO3E?=
 =?us-ascii?Q?Q8N2JySrBzT6b0dxJGdDJdikM1Ux+go8OYjUgzog/A7YFE1ED9f7L5GL8X7h?=
 =?us-ascii?Q?RiN1XvdTCVbaVdrgJEpRVlRZL8vsYQtgrpk7qoMhjDnQzh+81DQq7Za5fo7C?=
 =?us-ascii?Q?U5LjpMN9O2jD4LV0eOTQkRv9AIl2AovqEBe/9jCqLw7nP1M8pFThZk5I/Oj7?=
 =?us-ascii?Q?ktATp7DewuOHzc0XUhSEVUK7zLtX8Pmv5WX0sinCQxrQgwplbqfgFer8ILN4?=
 =?us-ascii?Q?Fo3TEa8icz2DVylqdXkKoXLz/PeVcDZUtofDe4vwITk7wfGfOZPbbvL30Czd?=
 =?us-ascii?Q?QG4Dz/Pr1Pi3wxdQ5OYRwgB/yVcpHzZtCKU9cBxtd6uyC08GsVjZ+dGsZ36B?=
 =?us-ascii?Q?5ebKFi7X80m7RXP6SgVza+lpcp/dkU68PSKa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:22.6029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fe6c97-093e-418b-b181-08ddb2e3fce1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154

Since we already have the list of mm_struct in the system, add a module to
scan each mm that walks VMAs of each mm_struct and scan all the pages
associated with that.

 In the scan path: Check for the recently acccessed pages (folios) belonging
to slowtier nodes. Add all those folios to a list.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 mm/kscand.c | 319 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 318 insertions(+), 1 deletion(-)

diff --git a/mm/kscand.c b/mm/kscand.c
index d5b0d3041b0f..0edec1b7730d 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -4,10 +4,18 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
+#include <linux/rmap.h>
+#include <linux/pagewalk.h>
+#include <linux/page_ext.h>
+#include <linux/page_idle.h>
+#include <linux/page_table_check.h>
+#include <linux/pagemap.h>
 #include <linux/swap.h>
 #include <linux/mm_inline.h>
 #include <linux/kthread.h>
 #include <linux/kscand.h>
+#include <linux/memory-tiers.h>
+#include <linux/mempolicy.h>
 #include <linux/string.h>
 #include <linux/delay.h>
 #include <linux/cleanup.h>
@@ -18,6 +26,11 @@
 
 static struct task_struct *kscand_thread __read_mostly;
 static DEFINE_MUTEX(kscand_mutex);
+/*
+ * Total VMA size to cover during scan.
+ */
+#define KSCAND_SCAN_SIZE	(1 * 1024 * 1024 * 1024UL)
+static unsigned long kscand_scan_size __read_mostly = KSCAND_SCAN_SIZE;
 
 /* How long to pause between two scan cycles */
 static unsigned int kscand_scan_sleep_ms __read_mostly = 20;
@@ -42,6 +55,8 @@ static struct kmem_cache *kscand_slot_cache __read_mostly;
 /* Per mm information collected to control VMA scanning */
 struct kscand_mm_slot {
 	struct mm_slot slot;
+	long address;
+	bool is_scanned;
 };
 
 /* Data structure to keep track of current mm under scan */
@@ -54,6 +69,29 @@ struct kscand_scan kscand_scan = {
 	.mm_head = LIST_HEAD_INIT(kscand_scan.mm_head),
 };
 
+/*
+ * Data structure passed to control scanning and also collect
+ * per memory node information
+ */
+struct kscand_scanctrl {
+	struct list_head scan_list;
+	unsigned long address;
+};
+
+struct kscand_scanctrl kscand_scanctrl;
+/* Per folio information used for migration */
+struct kscand_migrate_info {
+	struct list_head migrate_node;
+	struct folio *folio;
+	unsigned long address;
+};
+
+static bool kscand_eligible_srcnid(int nid)
+{
+	/* Only promotion case is considered */
+	return  !node_is_toptier(nid);
+}
+
 static inline int kscand_has_work(void)
 {
 	return !list_empty(&kscand_scan.mm_head);
@@ -84,11 +122,275 @@ static void kscand_wait_work(void)
 			scan_sleep_jiffies);
 }
 
+static inline bool is_valid_folio(struct folio *folio)
+{
+	if (!folio || folio_test_unevictable(folio) || !folio_mapped(folio) ||
+		folio_is_zone_device(folio) || folio_maybe_mapped_shared(folio))
+		return false;
+
+	return true;
+}
+
+
+static bool folio_idle_clear_pte_refs_one(struct folio *folio,
+					 struct vm_area_struct *vma,
+					 unsigned long addr,
+					 pte_t *ptep)
+{
+	bool referenced = false;
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t *pmd = pmd_off(mm, addr);
+
+	if (ptep) {
+		if (ptep_clear_young_notify(vma, addr, ptep))
+			referenced = true;
+	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
+		if (!pmd_present(*pmd))
+			WARN_ON_ONCE(1);
+		if (pmdp_clear_young_notify(vma, addr, pmd))
+			referenced = true;
+	} else {
+		WARN_ON_ONCE(1);
+	}
+
+	if (referenced) {
+		folio_clear_idle(folio);
+		folio_set_young(folio);
+	}
+
+	return true;
+}
+
+static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
+{
+	bool need_lock;
+	struct folio *folio =  page_folio(page);
+	unsigned long address;
+
+	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
+		return;
+
+	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
+	if (need_lock && !folio_trylock(folio))
+		return;
+	address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
+	VM_BUG_ON_VMA(address == -EFAULT, walk->vma);
+	folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
+
+	if (need_lock)
+		folio_unlock(folio);
+}
+
+static int hot_vma_idle_pte_entry(pte_t *pte,
+				 unsigned long addr,
+				 unsigned long next,
+				 struct mm_walk *walk)
+{
+	struct page *page;
+	struct folio *folio;
+	struct mm_struct *mm;
+	struct vm_area_struct *vma;
+	struct kscand_migrate_info *info;
+	struct kscand_scanctrl *scanctrl = walk->private;
+	int srcnid;
+
+	scanctrl->address = addr;
+	pte_t pteval = ptep_get(pte);
+
+	if (!pte_present(pteval))
+		return 0;
+
+	if (pte_none(pteval))
+		return 0;
+
+	vma = walk->vma;
+	mm = vma->vm_mm;
+
+	page = pte_page(*pte);
+
+	page_idle_clear_pte_refs(page, pte, walk);
+
+	folio = page_folio(page);
+	folio_get(folio);
+
+	if (!is_valid_folio(folio)) {
+		folio_put(folio);
+		return 0;
+	}
+	srcnid = folio_nid(folio);
+
+
+	if (!folio_test_lru(folio)) {
+		folio_put(folio);
+		return 0;
+	}
+
+	if (!folio_test_idle(folio) || folio_test_young(folio) ||
+			mmu_notifier_test_young(mm, addr) ||
+			folio_test_referenced(folio) || pte_young(pteval)) {
+
+		if (!kscand_eligible_srcnid(srcnid)) {
+			folio_put(folio);
+			return 0;
+		}
+		/* XXX: Leaking memory. TBD: consume info */
+
+		info = kzalloc(sizeof(struct kscand_migrate_info), GFP_NOWAIT);
+		if (info && scanctrl) {
+			info->address = addr;
+			info->folio = folio;
+			list_add_tail(&info->migrate_node, &scanctrl->scan_list);
+		}
+	}
+
+	folio_set_idle(folio);
+	folio_put(folio);
+	return 0;
+}
+
+static const struct mm_walk_ops hot_vma_set_idle_ops = {
+	.pte_entry = hot_vma_idle_pte_entry,
+	.walk_lock = PGWALK_RDLOCK,
+};
+
+static void kscand_walk_page_vma(struct vm_area_struct *vma, struct kscand_scanctrl *scanctrl)
+{
+	if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
+	    is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
+		return;
+	}
+	if (!vma->vm_mm ||
+	    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ)))
+		return;
+
+	if (!vma_is_accessible(vma))
+		return;
+
+	walk_page_vma(vma, &hot_vma_set_idle_ops, scanctrl);
+}
+
 static inline int kscand_test_exit(struct mm_struct *mm)
 {
 	return atomic_read(&mm->mm_users) == 0;
 }
 
+static void kscand_collect_mm_slot(struct kscand_mm_slot *mm_slot)
+{
+	struct mm_slot *slot = &mm_slot->slot;
+	struct mm_struct *mm = slot->mm;
+
+	lockdep_assert_held(&kscand_mm_lock);
+
+	if (kscand_test_exit(mm)) {
+		hash_del(&slot->hash);
+		list_del(&slot->mm_node);
+
+		mm_slot_free(kscand_slot_cache, mm_slot);
+		mmdrop(mm);
+	}
+}
+
+static unsigned long kscand_scan_mm_slot(void)
+{
+	bool next_mm = false;
+	bool update_mmslot_info = false;
+
+	unsigned long vma_scanned_size = 0;
+	unsigned long address;
+
+	struct mm_slot *slot;
+	struct mm_struct *mm;
+	struct vm_area_struct *vma = NULL;
+	struct kscand_mm_slot *mm_slot;
+
+
+	spin_lock(&kscand_mm_lock);
+
+	if (kscand_scan.mm_slot) {
+		mm_slot = kscand_scan.mm_slot;
+		slot = &mm_slot->slot;
+		address = mm_slot->address;
+	} else {
+		slot = list_entry(kscand_scan.mm_head.next,
+				     struct mm_slot, mm_node);
+		mm_slot = mm_slot_entry(slot, struct kscand_mm_slot, slot);
+		address = mm_slot->address;
+		kscand_scan.mm_slot = mm_slot;
+	}
+
+	mm = slot->mm;
+	mm_slot->is_scanned = true;
+	spin_unlock(&kscand_mm_lock);
+
+	if (unlikely(!mmap_read_trylock(mm)))
+		goto outerloop_mmap_lock;
+
+	if (unlikely(kscand_test_exit(mm))) {
+		next_mm = true;
+		goto outerloop;
+	}
+
+	VMA_ITERATOR(vmi, mm, address);
+
+	for_each_vma(vmi, vma) {
+		kscand_walk_page_vma(vma, &kscand_scanctrl);
+		vma_scanned_size += vma->vm_end - vma->vm_start;
+
+		if (vma_scanned_size >= kscand_scan_size) {
+			next_mm = true;
+			/* TBD: Add scanned folios to migration list */
+			break;
+		}
+	}
+
+	if (!vma)
+		address = 0;
+	else
+		address = kscand_scanctrl.address + PAGE_SIZE;
+
+	update_mmslot_info = true;
+
+	if (update_mmslot_info)
+		mm_slot->address = address;
+
+outerloop:
+	/* exit_mmap will destroy ptes after this */
+	mmap_read_unlock(mm);
+
+outerloop_mmap_lock:
+	spin_lock(&kscand_mm_lock);
+	WARN_ON(kscand_scan.mm_slot != mm_slot);
+
+	/*
+	 * Release the current mm_slot if this mm is about to die, or
+	 * if we scanned all vmas of this mm.
+	 */
+	if (unlikely(kscand_test_exit(mm)) || !vma || next_mm) {
+		/*
+		 * Make sure that if mm_users is reaching zero while
+		 * kscand runs here, kscand_exit will find
+		 * mm_slot not pointing to the exiting mm.
+		 */
+		if (slot->mm_node.next != &kscand_scan.mm_head) {
+			slot = list_entry(slot->mm_node.next,
+					struct mm_slot, mm_node);
+			kscand_scan.mm_slot =
+				mm_slot_entry(slot, struct kscand_mm_slot, slot);
+
+		} else
+			kscand_scan.mm_slot = NULL;
+
+		if (kscand_test_exit(mm)) {
+			kscand_collect_mm_slot(mm_slot);
+			goto end;
+		}
+	}
+	mm_slot->is_scanned = false;
+end:
+	spin_unlock(&kscand_mm_lock);
+	return 0;
+}
+
 static void kscand_do_scan(void)
 {
 	unsigned long iter = 0, mms_to_scan;
@@ -101,7 +403,7 @@ static void kscand_do_scan(void)
 			break;
 
 		if (kscand_has_work())
-			msleep(100);
+			kscand_scan_mm_slot();
 
 		iter++;
 
@@ -148,6 +450,7 @@ void __kscand_enter(struct mm_struct *mm)
 	if (!kscand_slot)
 		return;
 
+	kscand_slot->address = 0;
 	slot = &kscand_slot->slot;
 
 	spin_lock(&kscand_mm_lock);
@@ -175,6 +478,12 @@ void __kscand_exit(struct mm_struct *mm)
 		hash_del(&slot->hash);
 		list_del(&slot->mm_node);
 		free = 1;
+	} else if (mm_slot && kscand_scan.mm_slot == mm_slot && !mm_slot->is_scanned) {
+		hash_del(&slot->hash);
+		list_del(&slot->mm_node);
+		free = 1;
+		/* TBD: Set the actual next slot */
+		kscand_scan.mm_slot = NULL;
 	}
 
 	spin_unlock(&kscand_mm_lock);
@@ -224,6 +533,12 @@ static int stop_kscand(void)
 	return 0;
 }
 
+static inline void init_list(void)
+{
+	INIT_LIST_HEAD(&kscand_scanctrl.scan_list);
+	init_waitqueue_head(&kscand_wait);
+}
+
 static int __init kscand_init(void)
 {
 	int err;
@@ -234,6 +549,8 @@ static int __init kscand_init(void)
 		pr_err("kscand: kmem_cache error");
 		return -ENOMEM;
 	}
+
+	init_list();
 	err = start_kscand();
 	if (err)
 		goto err_kscand;
-- 
2.34.1

