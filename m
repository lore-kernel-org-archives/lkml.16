Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61F27605A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081245; cv=fail; b=eyc/LiviyZYzlfzLX64ZVldBaPAH44BGKXj4Zo89WJ0kor/1BEnSjDNAEZTXb8vdmyodw0jJjNBNk3u43aYetwzU0IYTBhlt9mk2cHDGLBHYk4r0Pu2LkNWuiiIyZOKZ85revGYNi0ZlDuYQ81R0yRCLtjlpjjEZQJxvWNNfYhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081245; c=relaxed/simple;
	bh=WpsAEvMnUDf34eJlZpw8U/J3fwHi+PNQD3GFF8QOV0k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubvkqpPG/7zXpen3IX/bV7PbXrWhfYFEcGIzeycYGnbHcnzerT3l4GMlMIhevztbIIuQVO960Kvt76terJp8u02HrwKxPQPVikb80KwRiEAKftc9w+7VvTY5pFP4tWw7+OUYLngUs0yJI72lESMMRB1q9fHLzguSFWWwTNfv08E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nXpYsAws; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nXpYsAws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDDU0Q+cXKZNXNIYmAy3rhAmHpQ9sMyB/Fyx3hzei/tM3vF4oVUAzX6dq6PHAk3kE5zNlffi/8pRBAigKTf1zKW4CLyKW1a5Izj3+SnFp5No0aKGJaYC/0twb8doSW05j2bZxKGQH9nnw5iTujfySnP0tKMlQo9rBANnDPq0Qk0Ike23lg+3A80dT2zffEu4Oz0g4D2FuJ6fqSKmqfENKKQMOtRvg5q8lsaP7sP7roijb56kR2uu59rtfX7ymD8VjlNKdXOuf8lC4cUwofOoMix3l42/i/HYEZKBzqnzdITdaVT8raLhuGzPEVEQMue2CDh8RFrSVneFn9JqrfH9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eZdYa07Ng3zHhaAtg01x0vI5scO5bdFkv3BXOmr10M=;
 b=HytlNuTkdhVaF6nOVrSkBgRoZul9AO/2q7ODWXYkDQjSJg/vnbPj6OURDOG1PtkkPapObkWsXWN9WeJbbnEE78bh6p1pryjMrqp/kLhfCmcAcyjixBUS0nJ7cLPV2YtV+iwcKz5aDWRzK7/O8IhL66Zn33QUbsQxafc0EB/knwOxzqqldxCpA83NksdYR7BPo2fCBzfHqwRvNIhEpvl7p00PwYuLGwy8mpiI4yX6+7t/JK+mfC7YJ+ecm59YBtNcdI4H6lXV/veltrpW9JjKgU3pQ9S9GoSfKsWkejL8/EUilRzqKujKgBlubgR9ri9KKfhN3wwXT/1A7ggYRjpBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eZdYa07Ng3zHhaAtg01x0vI5scO5bdFkv3BXOmr10M=;
 b=nXpYsAwswKdNRIYg1iirRQi7rQnrHxgBKo7MswAANHKPkjaoa44JHVIwVCVspJzRV3qAvwk0tKrwKcy7TCMwDCpPyHWE70ASA8SwmH8abKo1rFWbP5+mgXmE9VQR4QO/ks5BaWsEmMRy6QkPZj0dMz3TZRFSGB0ngtoJXR9AanQ=
Received: from DS7PR06CA0014.namprd06.prod.outlook.com (2603:10b6:8:2a::11) by
 SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 13:40:41 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::84) by DS7PR06CA0014.outlook.office365.com
 (2603:10b6:8:2a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Mon,
 16 Jun 2025 13:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:40:41 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:40:34 -0500
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
Subject: [RFC PATCH v1 2/4] migrate: implement migrate_misplaced_folios_batch
Date: Mon, 16 Jun 2025 19:09:29 +0530
Message-ID: <20250616133931.206626-3-bharata@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: d1473e6c-f478-4824-c6ba-08ddacdb62e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P2ZcE34/UDrSbP7y1ismNghP+NvTVso+BLF6GaSRdVy+OT4xtcem7KXtBDLU?=
 =?us-ascii?Q?oYw7i38/pYUx/D2J/oFZGdNYhP1YacfPFKh+AsWzS7l1WwfMVf1aSYT5lkj7?=
 =?us-ascii?Q?wUWIvErhdJwi6asK/qZJF8U/83O7myJ6NGAWmwy8+LsjjoFAG0UMfuKojbLu?=
 =?us-ascii?Q?jCEY36l0O+wMj3ptI1fc1yCN5rB72en453OckQeZzxOfy9x8aVrfTR8pdJoO?=
 =?us-ascii?Q?F2crQuEN1gMf//EI6i0SEZxJNBYfbzEhoaexRc5bS+9rWSEJoJ3xy8M8ZZWi?=
 =?us-ascii?Q?LS+oCVtPOOaLXO5swVmiwmOB95hufoNgaR7UehkVuRKDOMV8BaovKQ35W4XB?=
 =?us-ascii?Q?cNdGQ0KxJ0t8AYwUrVMPoHM6s/OaIl00mxXxJetpL/iut4tck6u9VLtThEkE?=
 =?us-ascii?Q?zaj9pBJ38bmMkIbsqfo+R/TqfmHw6i041969gAY1vn8lk2+nhiJ52w3+ukf2?=
 =?us-ascii?Q?SLrfNj+AUoyyWnJiYIf7tq4gGpu3AgeCc+SBZ82EgwzodHI6B4MJrSO2S5iS?=
 =?us-ascii?Q?D0Vjxw/pZNwc/xli6ZRKpXio2F3lTb1pCT2UbyVeM6qr+TgnyOv1l/J3jM9M?=
 =?us-ascii?Q?kKJ/t83fuzurw3UdRaRa3JlcoFL1xBwr3f+BEEMqYvONfNgZz7Fq1BNDhkMO?=
 =?us-ascii?Q?rtKsZLij+/YC+I2WAroHiKcAZpsIzhd/gNQnrT/IU8c0DRMuEwWFiuNFibIb?=
 =?us-ascii?Q?6PA9luO+X8v5QicGvKVNlw0K3b7vPG0R0kPrJIB4mcGhMFLvrKcERYvUz21f?=
 =?us-ascii?Q?lmsz2LtClRNMNcdZrojn1bLg7TaEvtCd/3e4+UPAI1eXK/pqiMUK1GiGJxrO?=
 =?us-ascii?Q?8pnnqqF2cYd8L7wGAvrMTuMm/5uEfVW/X/4e9ijA/PlH81f+XvdqCG1+9Vj0?=
 =?us-ascii?Q?AG8rNlxm01aJ9u20JOWiGB+jcyywo532gU3EQk7A/Gt3B/f5KaIQHILtQX0g?=
 =?us-ascii?Q?ziVYFdSfgYvf6kc7vj9+a6RTckX2Z4vXUhIckGRc8XDY94WsLJdQ+pI7lbez?=
 =?us-ascii?Q?K5iNNUjVEmo3lV0JXj/Zcltb+lQ3kgfgGTgfXkUHK1d9J4kZfMWrjuv2Fc3D?=
 =?us-ascii?Q?2zRS41kZsAhBm1SgY+E1m1aoylvkRxNvHR37tkwHCdc6ts9pqcNoCfPvu7Fz?=
 =?us-ascii?Q?Av1NZvSNlY+0LacooMkti8wSSfbxknCHWaKc/zbT4N3iIHFTtgM1YNNoV0S/?=
 =?us-ascii?Q?dHtHjPnpbTBvCL3HVM+tv+PLA2ElSjXrGiVZLgxFgsbvXwSp+Nw+t3HXqV5T?=
 =?us-ascii?Q?h4PGKRRp1NCshZHvp/6hd3KI6hP/mM3Dqu4GJHVhGmg17AEj8ZqQhOIEGSSr?=
 =?us-ascii?Q?nbOptpKsII0gjBM510AJUzQuZEZBRHvVlHaVQY4ZaAD1wONzTnslTE0RHq+l?=
 =?us-ascii?Q?KwfxdXqPV1VzeOTTxAPqAr+XeShWqXA0zCrRIx6O+ssFRuHwhOePvMZ2h5dd?=
 =?us-ascii?Q?T8WMe82gEZLn2szb6AFaD6DNCYxH4XvLnxpYSAdXKnO9qj64adDveX8vS2+v?=
 =?us-ascii?Q?v2LFz3qeUEoWj/1qyM02MLkNDW7fhrKbMjRV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:40:41.2646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1473e6c-f478-4824-c6ba-08ddacdb62e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445

From: Gregory Price <gourry@gourry.net>

A common operation in tiering is to migrate multiple pages at once.
The migrate_misplaced_folio function requires one call for each
individual folio.  Expose a batch-variant of the same call for use
when doing batch migrations.

Signed-off-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Bharata B Rao <bharata@amd.com>
---
 include/linux/migrate.h |  6 ++++++
 mm/migrate.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..90baf5ef4660 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -145,6 +145,7 @@ const struct movable_operations *page_movable_ops(struct page *page)
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
 int migrate_misplaced_folio(struct folio *folio, int node);
+int migrate_misplaced_folios_batch(struct list_head *foliolist, int node);
 #else
 static inline int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node)
@@ -155,6 +156,11 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 {
 	return -EAGAIN; /* can't migrate now */
 }
+static inline int migrate_misplaced_folios_batch(struct list_head *foliolist,
+						 int node)
+{
+	return -EAGAIN; /* can't migrate now */
+}
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_MIGRATION
diff --git a/mm/migrate.c b/mm/migrate.c
index 9fdc2cc3dd1c..748b5cd48a1f 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2675,5 +2675,36 @@ int migrate_misplaced_folio(struct folio *folio, int node)
 	BUG_ON(!list_empty(&migratepages));
 	return nr_remaining ? -EAGAIN : 0;
 }
+
+/*
+ * Batch variant of migrate_misplaced_folio. Attempts to migrate
+ * a folio list to the specified destination.
+ *
+ * Caller is expected to have isolated the folios by calling
+ * migrate_misplaced_folio_prepare(), which will result in an
+ * elevated reference count on the folio.
+ *
+ * This function will un-isolate the folios, dereference them, and
+ * remove them from the list before returning.
+ */
+int migrate_misplaced_folios_batch(struct list_head *folio_list, int node)
+{
+	pg_data_t *pgdat = NODE_DATA(node);
+	unsigned int nr_succeeded;
+	int nr_remaining;
+
+	nr_remaining = migrate_pages(folio_list, alloc_misplaced_dst_folio,
+				     NULL, node, MIGRATE_ASYNC,
+				     MR_NUMA_MISPLACED, &nr_succeeded);
+	if (nr_remaining)
+		putback_movable_pages(folio_list);
+
+	if (nr_succeeded) {
+		count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
+		mod_node_page_state(pgdat, PGPROMOTE_SUCCESS, nr_succeeded);
+	}
+	BUG_ON(!list_empty(folio_list));
+	return nr_remaining ? -EAGAIN : 0;
+}
 #endif /* CONFIG_NUMA_BALANCING */
 #endif /* CONFIG_NUMA */
-- 
2.34.1

