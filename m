Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796527453
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007403; cv=fail; b=CTBw3CC+iAsXtSZd5swK4PabPJ/fi3d+yHxcx3KyxyK9ka+AqFqUpa0oUpAtxbH2cMLKKk+SyKVNSJ9YOvVPFp5OPe5XutioNoDTd9IjCdTWXZ/tY87vWkH1VPoenoyMzB5B3rJd0Hn55VBFT7sHEXtBNAx8++YXTyj1ylFEbZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007403; c=relaxed/simple;
	bh=TMAAr98XsyCx/tElSQ+O6JdqeLFq3w+DvT/SyiFsVwQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPJrl7jU7jfkJ9PbAg4RPQ7YEkw2Q9idOC+JN/TMMfk2URQZhFfo9OSqdCx3bOav85VdtPfqGW+yB9z+F5q4taP9ke8lii3BIBNia8Ci/EiFZToInTPiEPh5TZjRJCju+ZKDOTkyV7zwZz7SpkWIc7GsUsXpeit2p5Xjxh3IvbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ec7n2s3K; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ec7n2s3K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpuVYCeu8S/FN5/rcV+AryomSqCjg0lMx6ddFRB+I7RCd4Av9+C9Dln7aqDD71T7nnz4InHsK2wC2dEwFpAR0xqcEgxVsXargJH/UezoN0dDNQ1SFIEvgn0tL+wMw/f4dQu2BYvu9un8tAp6juwSXD4B/eGq3ox+4JJIPmVvDcccTLipEO/90SX/W5lTOX5cqg/Ism9gnAH2UjfoXKgJ5CJnwcZ5zo1Sr2KsKfkvbPWLM19xqIy1C8pa311UCD4aK7MGn3gxqpAsiQ5kKtHYgCdMN17P3bkky9D8BjRKx2HLO7WcfW+i0t4enL5EA6suDDPW8Sqp9mVY0xZigisAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezd84mvxlJVn7FW9Vvr/ZbGl+vZ3qJOeGDykPBAqeP8=;
 b=h7mNQx/YFFPJspYXVOLpgCARydEY0yCreLalb535YeloeC7ybhpG88jLJnxUirBGGj2qbnzrzST+7TskQVuDDgjn3ikRWagxYwWiQy+SwZXHxGysonKhS/bxs5rFw2hnwi/+u3+qwk1meFaBm0Q9iqxI6cRp++WCrkLQ5i2ctUooppn7/ucMb+ER6nWDYxKQ6A4i8BqfBWKZX+R1oQswWNJJ9jB1yF5r/cbf3yCQjQQ7xaLjAN0tKrtBBPQLXli2PktV/P46jEJ6v8L9L7qp2Q+XtcBvTvU5LogWfsDDpOqePYyS9KjWxgjY9di+xSHcV3DXvJm+oo3LwmLsiL3LtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezd84mvxlJVn7FW9Vvr/ZbGl+vZ3qJOeGDykPBAqeP8=;
 b=Ec7n2s3KR0bT44R4Fb2VSu2y7XSgdSU0Gg9GaJKORmwvb2y7GoC7tcFgc7x/V/Zsl132M58pKrJdrKiGo4OSlUZpwW3hWNDt/Cw9x8qX5cdyfUUkT043feyOPquXWQ2CyP7hfTHE4oajfbzuyCGgm2gko7VWHFpmO/DR35C3Zdk=
Received: from BYAPR02CA0001.namprd02.prod.outlook.com (2603:10b6:a02:ee::14)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 10:03:13 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::cc) by BYAPR02CA0001.outlook.office365.com
 (2603:10b6:a02:ee::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 10:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 10:03:13 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 05:03:08 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V5 1/2] mm: Add folio_expected_ref_count() for reference count calculation
Date: Wed, 30 Apr 2025 10:01:51 +0000
Message-ID: <20250430100150.279751-2-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430100150.279751-1-shivankg@amd.com>
References: <20250430100150.279751-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f214a8-a16e-4b94-6e32-08dd87ce386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AfRaPPBhbkboz2Nf5Hp/4Nj83ADT5RadOGxvnMzOicZormnjvrd4wl4VgFKf?=
 =?us-ascii?Q?zaK0rUv22Xj/5RWHjbmyrSbbVD2r9JtIK5nShoS7oQL8j+yweacrUYv5keeH?=
 =?us-ascii?Q?90bzcTiSUio0njggMZ0wkdolTw6vxaBW8JnzaT/whWbtxFy9+W3Wyh2snyOJ?=
 =?us-ascii?Q?a/01sCShYrafv4e1l89pFaKPhSPRkgy9T2pn/uVu65FcyL02CIVPVuvbgQUc?=
 =?us-ascii?Q?dClT7EirlaIZa0UtejdYVp5gi2wCWEPl6wQBlcdPB/gTzIbBVSpKd8ZJny0M?=
 =?us-ascii?Q?eTs2cvJtrkyPTwcsrMeTqBTIHYCNro1q+jpx4BtMioZcFRsF+4i4kHqU707u?=
 =?us-ascii?Q?QBbR1ga0dMqeK6mmratzGWh0tkpY080hT+8CjLUh2AwB9OK0v5+yn34vNOdR?=
 =?us-ascii?Q?JCqHZ1lvN2a7g9fNNlMlaX+B8so8FUq5tle7htLujnDw6KGqUbzZOp7kI4g7?=
 =?us-ascii?Q?E8Amu2Nd4rayYlh9/KXuzDK/qo2XVfrT/1SgeFEDUdrFRAi6GuhLMkgSqfcr?=
 =?us-ascii?Q?k9VRiEX3thwvLBPy+f/a+jf4zCzgbQNkhQL9iRgwS1Tru6ScePnconVFadws?=
 =?us-ascii?Q?gSNuBAJtEMXhAYYUrHBjmpYTMeLyz6JSu7XpPUJ/cA5XtlxH1nLDvILXJs/r?=
 =?us-ascii?Q?DOAobRCQGiNT5jn3b4/o07p27nKNVF8bfYcu4Vpm9R6vFzbTFqRxCQsyhA3N?=
 =?us-ascii?Q?9O9T9Rx169XP2zj4A0jsP7pvgEavEfyGYJn4dt3Mez+xN2bS+DOy/0jVsASI?=
 =?us-ascii?Q?iKndg6vIpHmOPaTqLTGU1dbJ+MlfBoplg4a3wP2UluIhRDUqBU9E32jTy6c3?=
 =?us-ascii?Q?RjZraX2Zda5h1Im5J3XxZmcOOc5rm118Bi1iJeOvTQIiaL9RLaEJcLIb6IJv?=
 =?us-ascii?Q?9mNwZN2niwy45AO4LocmtSCo4vGt2tOquTGAtDud0zUN1AqOD4734I8Jf1NX?=
 =?us-ascii?Q?FiCKXuP+kPF9kmAvobf8jfzYSI2jz+KfzM5QSyGLpXt9m94bGo7sFHdTXBaG?=
 =?us-ascii?Q?caVUVuS3gBK8SuiOzT+CUbuZ4mpL1jzqUDIZs36N1czZjT7v6q3mxU4ss9Hu?=
 =?us-ascii?Q?AcEAdgcVN/fweoAeQKELR9FJGHLsTxOpHpUUl2uIlnJsFW1zzsqIw6tilFXt?=
 =?us-ascii?Q?OpJCdNg6cBRPhUZ/FNwKFUvfvShd5Q1C6PX3xZ79cp5sPHnC+ppD9bS0/2rv?=
 =?us-ascii?Q?wmYkxgarC1g6yc97OuMJV9Wkr+NZVkj4Hb/ZcZm2VbEsBjPlzs8GefsHCLxy?=
 =?us-ascii?Q?T5HY95ab7I6ICkildM717ujmq+rTSLpH0o4ZagXgR/DJBFqjQMihAWRv/diI?=
 =?us-ascii?Q?KpY9hSN+GZXzfuDgSRQKDlFkJ3RfgpSnd50O1jQ7tciVwgJTVpRQ4KVjxplA?=
 =?us-ascii?Q?c6j6RRrto3WJlTd+leh+n++ijCYr9mqhu5aL4FaeeUVUFIoCSElJbDhSaHna?=
 =?us-ascii?Q?rks5adz9gVab0LCBA4nOaoWhqQQVgTUSLuv142D2CZRaUMXfoeCnm83SZ7iD?=
 =?us-ascii?Q?AlQboqAQN16liT+dLdwLhgNQmyN3MOFQyWYD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:03:13.4567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f214a8-a16e-4b94-6e32-08dd87ce386a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211

Implement folio_expected_ref_count() to calculate expected folio
reference counts from:
- Page/swap cache (1 per page)
- Private data (1)
- Page table mappings (1 per map)

While originally needed for page migration operations, this improved
implementation standardizes reference counting by consolidating all
refcount contributors into a single, reusable function that can benefit
any subsystem needing to detect unexpected references to folios.

The folio_expected_ref_count() returns the sum of these external
references without including any reference the caller itself might hold.
Callers comparing against the actual folio_ref_count() must account for
their own references separately.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 include/linux/mm.h | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 mm/migrate.c       | 22 ++++---------------
 2 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 68d3dd14b323..1db540bb9381 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2115,6 +2115,61 @@ static inline bool folio_maybe_mapped_shared(struct folio *folio)
 	return folio_test_large_maybe_mapped_shared(folio);
 }
 
+/**
+ * folio_expected_ref_count - calculate the expected folio refcount
+ * @folio: the folio
+ *
+ * Calculate the expected folio refcount, taking references from the pagecache,
+ * swapcache, PG_private and page table mappings into account. Useful in
+ * combination with folio_ref_count() to detect unexpected references (e.g.,
+ * GUP or other temporary references).
+ *
+ * Does currently not consider references from the LRU cache. If the folio
+ * was isolated from the LRU (which is the case during migration or split),
+ * the LRU cache does not apply.
+ *
+ * Calling this function on an unmapped folio -- !folio_mapped() -- that is
+ * locked will return a stable result.
+ *
+ * Calling this function on a mapped folio will not result in a stable result,
+ * because nothing stops additional page table mappings from coming (e.g.,
+ * fork()) or going (e.g., munmap()).
+ *
+ * Calling this function without the folio lock will also not result in a
+ * stable result: for example, the folio might get dropped from the swapcache
+ * concurrently.
+ *
+ * However, even when called without the folio lock or on a mapped folio,
+ * this function can be used to detect unexpected references early (for example,
+ * if it makes sense to even lock the folio and unmap it).
+ *
+ * The caller must add any reference (e.g., from folio_try_get()) it might be
+ * holding itself to the result.
+ *
+ * Returns the expected folio refcount.
+ */
+static inline int folio_expected_ref_count(const struct folio *folio)
+{
+	const int order = folio_order(folio);
+	int ref_count = 0;
+
+	if (WARN_ON_ONCE(folio_test_slab(folio)))
+		return 0;
+
+	if (folio_test_anon(folio)) {
+		/* One reference per page from the swapcache. */
+		ref_count += folio_test_swapcache(folio) << order;
+	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+		/* One reference per page from the pagecache. */
+		ref_count += !!folio->mapping << order;
+		/* One reference from PG_private. */
+		ref_count += folio_test_private(folio);
+	}
+
+	/* One reference per page table mapping. */
+	return ref_count + folio_mapcount(folio);
+}
+
 #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
 static inline int arch_make_folio_accessible(struct folio *folio)
 {
diff --git a/mm/migrate.c b/mm/migrate.c
index c80591514e66..67f2bf1eb51e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -445,20 +445,6 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 }
 #endif
 
-static int folio_expected_refs(struct address_space *mapping,
-		struct folio *folio)
-{
-	int refs = 1;
-	if (!mapping)
-		return refs;
-
-	refs += folio_nr_pages(folio);
-	if (folio_test_private(folio))
-		refs++;
-
-	return refs;
-}
-
 /*
  * Replace the folio in the mapping.
  *
@@ -601,7 +587,7 @@ static int __folio_migrate_mapping(struct address_space *mapping,
 int folio_migrate_mapping(struct address_space *mapping,
 		struct folio *newfolio, struct folio *folio, int extra_count)
 {
-	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
+	int expected_count = folio_expected_ref_count(folio) + extra_count + 1;
 
 	if (folio_ref_count(folio) != expected_count)
 		return -EAGAIN;
@@ -618,7 +604,7 @@ int migrate_huge_page_move_mapping(struct address_space *mapping,
 				   struct folio *dst, struct folio *src)
 {
 	XA_STATE(xas, &mapping->i_pages, folio_index(src));
-	int rc, expected_count = folio_expected_refs(mapping, src);
+	int rc, expected_count = folio_expected_ref_count(src) + 1;
 
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
@@ -749,7 +735,7 @@ static int __migrate_folio(struct address_space *mapping, struct folio *dst,
 			   struct folio *src, void *src_private,
 			   enum migrate_mode mode)
 {
-	int rc, expected_count = folio_expected_refs(mapping, src);
+	int rc, expected_count = folio_expected_ref_count(src) + 1;
 
 	/* Check whether src does not have extra refs before we do more work */
 	if (folio_ref_count(src) != expected_count)
@@ -837,7 +823,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 		return migrate_folio(mapping, dst, src, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
-	expected_count = folio_expected_refs(mapping, src);
+	expected_count = folio_expected_ref_count(src) + 1;
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
 
-- 
2.34.1

