Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5623909F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744736; cv=fail; b=LW9KLx1EK9HUIYqPXycO23s3TwPfhuKt8zsQP0pVw4/WKYuSiqn0lPw6y4EkXuYD2gbsSy0Gh2Cp0EC//Sna9JCtRcdkjmtnVLr5MaduotZ/fvmOYUrYWB2UmAROKYXjUFzMCD9ERzLWsVtqc6eAWOC37ZHU3UOB9dFWQIZqtA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744736; c=relaxed/simple;
	bh=mi5Ld5J0qeg55sZL7uIeJlWfD3SUESBso3PQvYyKL/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SnxmlTCBhYJg/93fonArK4SegX+TxATcWwrgBfGCDkrOKGwN4vtjhX8EziHMimyrgLrf+AGvmUFEw2jxTkimJE/UvXAXvZzZJ4SJbKAmF+8W4XxDhXTnu85qkGtRJfOoyHOa+lvBFBv+QyfXnxGvP0nMSXixCdIn1DhuAU39dOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3qEME/OO; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3qEME/OO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXU6DrKqPinu+WjXflLJPeCIij5yrVcqXNmVtbDwHNn9khFFUtH03uRbQS0flr3n843L+8O+yWMZiI8fhyibMbeXXH/0nGWphybzWHnbXhVORfTb0UzDuwNRpgBVc5VbPH8YyHe9Rg5iH9OvPVmBcv/kS3LLiQh1pN/Gq44v+ry3F0cLVbBIerr+nRbYcuwQyhqbnAMurYpL00IIk2kaqpMLRLjCjk2HnQaeyENSrggsw529eVZubgBuf0MZrvZrlE6OBNz0qbdm4pEmf3HKvgntE9MhsxE3yBgk0Ou9radfgdnmzne2F2+/hEdDEyPjMcF86x8FrQwv5ucnCsGUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPBB6uzuV5RsHsgW28KKO9VKzZHyzSSqRmv8hz2TbHA=;
 b=rSbn27AeLH+LZ+TLrKlh3CTckZnZB6j9N+rwvtIW0xfpb7UhohIPsHmMdaL6Xsp0gMgkseuXSCuZGxc9R/haQOfJs92CwU07TLW0WEBD3v7pJndtCMxI9O+9yupTrGb1+282/07Siw09GGncZbnph7lco6tLhve6HpNsGfKGxXBYFJb7jKM0JQFUdQQrR0za1xMaSLFPYbbEi6/TR/2KlW8EH++HJ3MJuZL/cuhtmCRgQx0jaLNcciaKk3i78SIkIUwILR8iHzVziq75gx1rSSwcbNAhgUp6Jo06t7Yfk++crjIm/o2eM8I3lyMTxHJGupDwu+T7GyS9mkVpvxjhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPBB6uzuV5RsHsgW28KKO9VKzZHyzSSqRmv8hz2TbHA=;
 b=3qEME/OOcJp74VZ5R4EdCiw9MZkLajZD/I2e82vypNqknfbncMjp5w4aX0ym3BdEvOo8vdMjZ1dG50JYDOp8bp2AQWImy7QySAKkQuSvAHa+BQ7L+qg5aPRTs05U3oI/ZEfHh0xUgO4jXoPXZZIyYVlHI/PWo0xuvd0J+EqCk+k=
Received: from BYAPR05CA0101.namprd05.prod.outlook.com (2603:10b6:a03:e0::42)
 by CYYPR12MB9016.namprd12.prod.outlook.com (2603:10b6:930:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 24 Jun
 2025 05:58:51 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::cf) by BYAPR05CA0101.outlook.office365.com
 (2603:10b6:a03:e0::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 05:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:58:50 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:58:39 -0500
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
Subject: [RFC PATCH V2 11/13] vmstat: Add vmstat counters
Date: Tue, 24 Jun 2025 05:56:15 +0000
Message-ID: <20250624055617.1291159-12-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CYYPR12MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c8cd30-f8a2-4a43-9ea0-08ddb2e4319c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LPhrc0L55uraJKyXWK+Gu08xJWpDSUbya7vjUcpASaB45PbMMwV7d7Iamp7P?=
 =?us-ascii?Q?TgiJ3c/bvAeEtZoJsltDrRC5CAYdvrYNf65/l8WiqPFm1ZMN5PibfENdMnln?=
 =?us-ascii?Q?eZeyHALtO9tOSJKg9wfekSYauBAYKiAaLFxLhbAQCrdotNm7UWaP4TWeuEv1?=
 =?us-ascii?Q?WBy7fmBTKg8xLPFQE7fNhLJDzRwRb2V5KFga0Bq8BB29NK0jQqlnlyB4y6lD?=
 =?us-ascii?Q?85DokvSRi6SBtQyf4KHXyXPJvYO3tgB/JCXSpUxL0cEMdckVzJfZJyqJMZ7R?=
 =?us-ascii?Q?LTkMkrDQKMWkrdr0WAwM2qb4UVwEDkGYKM6CGJH0lvEyGzSyj976vLq1SREQ?=
 =?us-ascii?Q?rM3vEXm2y/D+sNhEGzuSRMoJnD5fCyY7JcxsITyaldJHSCY9AfMKhLmCJ3bZ?=
 =?us-ascii?Q?oJ140QhytjTFQ068mP2NLH/7tNmQDANEn1AKif8+NHUtVZsmfAoQNWbbZR6h?=
 =?us-ascii?Q?ovVjSyd7ekdCGj0sMZqrSn7kZ/AwceAuaZzuantsCNCifVJUWzvuEY6bF1xU?=
 =?us-ascii?Q?pW51IDowJ3H58yrnktOrEUGk1mNgvUCGdUfEBi2C2lx61wrnT93U9KyJ5Qfk?=
 =?us-ascii?Q?nwM5dDdwT2Vy+zoCSEK/R+nWdzubUh12U8IlHFZcLIBZHkckRwTwQrHPntg4?=
 =?us-ascii?Q?Rqcnkr9SVNAgXQvaBAqlORx8C1a7ehpqe7m5DbGEBpnzZQJUSIvM2k1DvO14?=
 =?us-ascii?Q?JNmAYJM72/kB5tXOKiKV2NSOS2fBmAYomsbiJtme1YcP1+YT9W4Ay3UX20z2?=
 =?us-ascii?Q?kndH+M/spNY9LqAgDxORo+mOT3XBEJsZth8PRJ+LyFVI/VHKtTWtbVrU3SN2?=
 =?us-ascii?Q?jDQ09NixPvw6IFW2/FaQYTOHmbcrgK74JJnrbs9Y3dHRyrqjYxrUm6Up3K0W?=
 =?us-ascii?Q?Ie0DaSXaw1vZpPLOgwQmk1ozYeilVxRxAP1sR7vWGwSZShTZPSt/TF2gd12w?=
 =?us-ascii?Q?PQocfLXfaLEpQwhjW+Jt9EcbFOuc7Djisqk2zOy6nDTd82leqxgkPfCtgC5A?=
 =?us-ascii?Q?THA5f+EKCy1RoICZs8kCndwukSvKmOgkt+IFqnT2votF7yn4GjMDVJYl7NGY?=
 =?us-ascii?Q?vU3gBixswKtmufpKRXVbSWU0ATPdsfSHNR921I2bO9Pt0uuJFEP+rvnAk9qZ?=
 =?us-ascii?Q?PyFyRIz6cytrpxtOJ+wm5lkxXvCGvbId0a+gctT19nrlz8u0XlJismT0e4c6?=
 =?us-ascii?Q?aWQStmV1dNr994P1dA7l+EpaqPEyCpZykT6UrwBLCA66qsZnTYYHwY2pvPcQ?=
 =?us-ascii?Q?FFE3Sv0kOXV1xVBSH784g7wQ0C41Zcxl7mfWtFa9N5SAWNzxsT53Z1P8igjr?=
 =?us-ascii?Q?KI0ZcUoVVnTGgWPLdvWtSNCTvZeZA0Ie51ppmJ3i1u+aC0mQDwdUQ03/8M+5?=
 =?us-ascii?Q?ux33OHMcBs6R0PiGsErA08zRcEzz91s4rHYqwFvdKo6RojHxLGzAaBDzvd2K?=
 =?us-ascii?Q?JwWXKK5xUMB6dMdRC5eRfZHoRZ0QgM2S7u5SanVPmfr8n8at3X2Y2qOSkfYN?=
 =?us-ascii?Q?d/Q+p69d/hgGUC0LXL50y2Ce3lMhLtW4SqhZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:58:50.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c8cd30-f8a2-4a43-9ea0-08ddb2e4319c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9016

Add vmstat counter to track scanning, migration and
type of pages.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 include/linux/mm.h            | 11 ++++++++
 include/linux/vm_event_item.h | 10 +++++++
 mm/kscand.c                   | 51 ++++++++++++++++++++++++++++++++++-
 mm/vmstat.c                   | 10 +++++++
 4 files changed, 81 insertions(+), 1 deletion(-)

This implementation will change with upcoming changes in vmstat.

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fdda6b16263b..b67d06cbc2ed 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -656,6 +656,17 @@ struct vm_operations_struct {
 					  unsigned long addr);
 };
 
+#ifdef CONFIG_KSCAND
+void count_kscand_mm_scans(void);
+void count_kscand_vma_scans(void);
+void count_kscand_migadded(void);
+void count_kscand_migrated(void);
+void count_kscand_migrate_failed(void);
+void count_kscand_slowtier(void);
+void count_kscand_toptier(void);
+void count_kscand_idlepage(void);
+#endif
+
 #ifdef CONFIG_NUMA_BALANCING
 static inline void vma_numab_state_init(struct vm_area_struct *vma)
 {
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 9e15a088ba38..8f324ad73821 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -67,6 +67,16 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		NUMA_HINT_FAULTS_LOCAL,
 		NUMA_PAGE_MIGRATE,
 #endif
+#ifdef CONFIG_KSCAND
+		KSCAND_MM_SCANS,
+		KSCAND_VMA_SCANS,
+		KSCAND_MIGADDED,
+		KSCAND_MIGRATED,
+		KSCAND_MIGRATE_FAILED,
+		KSCAND_SLOWTIER,
+		KSCAND_TOPTIER,
+		KSCAND_IDLEPAGE,
+#endif
 #ifdef CONFIG_MIGRATION
 		PGMIGRATE_SUCCESS, PGMIGRATE_FAIL,
 		THP_MIGRATION_SUCCESS,
diff --git a/mm/kscand.c b/mm/kscand.c
index abffcb868447..db7b2f940f36 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -337,6 +337,39 @@ struct attribute_group kscand_attr_group = {
 };
 #endif
 
+void count_kscand_mm_scans(void)
+{
+	count_vm_numa_event(KSCAND_MM_SCANS);
+}
+void count_kscand_vma_scans(void)
+{
+	count_vm_numa_event(KSCAND_VMA_SCANS);
+}
+void count_kscand_migadded(void)
+{
+	count_vm_numa_event(KSCAND_MIGADDED);
+}
+void count_kscand_migrated(void)
+{
+	count_vm_numa_event(KSCAND_MIGRATED);
+}
+void count_kscand_migrate_failed(void)
+{
+	count_vm_numa_event(KSCAND_MIGRATE_FAILED);
+}
+void count_kscand_slowtier(void)
+{
+	count_vm_numa_event(KSCAND_SLOWTIER);
+}
+void count_kscand_toptier(void)
+{
+	count_vm_numa_event(KSCAND_TOPTIER);
+}
+void count_kscand_idlepage(void)
+{
+	count_vm_numa_event(KSCAND_IDLEPAGE);
+}
+
 static inline int kscand_has_work(void)
 {
 	return !list_empty(&kscand_scan.mm_head);
@@ -789,6 +822,9 @@ static int hot_vma_idle_pte_entry(pte_t *pte,
 		return 0;
 	}
 
+	if (node_is_toptier(srcnid))
+		count_kscand_toptier();
+
 	if (!folio_test_idle(folio) || folio_test_young(folio) ||
 			mmu_notifier_test_young(mm, addr) ||
 			folio_test_referenced(folio) || pte_young(pteval)) {
@@ -802,11 +838,14 @@ static int hot_vma_idle_pte_entry(pte_t *pte,
 
 		info = kzalloc(sizeof(struct kscand_migrate_info), GFP_NOWAIT);
 		if (info && scanctrl) {
+			count_kscand_slowtier();
 			info->address = addr;
 			info->folio = folio;
 			list_add_tail(&info->migrate_node, &scanctrl->scan_list);
+			count_kscand_migadded();
 		}
-	}
+	} else
+		count_kscand_idlepage();
 
 	folio_set_idle(folio);
 	folio_put(folio);
@@ -997,6 +1036,12 @@ static void kmigrated_migrate_mm(struct kmigrated_mm_slot *mm_slot)
 
 			ret = kmigrated_promote_folio(info, mm, dest);
 
+			/* TBD: encode migrated count here, currently assume folio_nr_pages */
+			if (!ret)
+				count_kscand_migrated();
+			else
+				count_kscand_migrate_failed();
+
 			kfree(info);
 
 			cond_resched();
@@ -1202,6 +1247,7 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	for_each_vma(vmi, vma) {
 		kscand_walk_page_vma(vma, &kscand_scanctrl);
+		count_kscand_vma_scans();
 		vma_scanned_size += vma->vm_end - vma->vm_start;
 
 		if (vma_scanned_size >= mm_slot_scan_size ||
@@ -1237,6 +1283,8 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	update_mmslot_info = true;
 
+	count_kscand_mm_scans();
+
 	total = get_slowtier_accesed(&kscand_scanctrl);
 	target_node = get_target_node(&kscand_scanctrl);
 
@@ -1252,6 +1300,7 @@ static unsigned long kscand_scan_mm_slot(void)
 		kscand_update_mmslot_info(mm_slot, total, target_node);
 	}
 
+
 outerloop:
 	/* exit_mmap will destroy ptes after this */
 	mmap_read_unlock(mm);
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4c268ce39ff2..d32e88e4153d 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1348,6 +1348,16 @@ const char * const vmstat_text[] = {
 	"numa_hint_faults_local",
 	"numa_pages_migrated",
 #endif
+#ifdef CONFIG_KSCAND
+	"nr_kscand_mm_scans",
+	"nr_kscand_vma_scans",
+	"nr_kscand_migadded",
+	"nr_kscand_migrated",
+	"nr_kscand_migrate_failed",
+	"nr_kscand_slowtier",
+	"nr_kscand_toptier",
+	"nr_kscand_idlepage",
+#endif
 #ifdef CONFIG_MIGRATION
 	"pgmigrate_success",
 	"pgmigrate_fail",
-- 
2.34.1

