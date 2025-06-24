Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB9231CB0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744674; cv=fail; b=kKgffPdcyx0JbnbeVtmsRxMRAAzoJAytN5KfCHoVqLpvOrkxsGKTkgSFZnIuLkG6CBwFcSvE+lOQ+U6yxRRA0qWZPaVngI5aKDG8OetsBieCHvC3xBf4wYbQLVX/jUCDsKVxrHIMvzQVqid6LeGAXbTdeEA8DObDNP5jDepaFEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744674; c=relaxed/simple;
	bh=LACgJvTdaMP5BQHMQYLHzkWc+TlbTzL8BGpGZUURSFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCT0O1x1qXeB0AQQlh5j1WSXRDk42RPyYAi1HJOgAl7BktX8oi0CbeoKiwdfik3pCgZMadm33X8wHJ14Zk0Ikyuom5fBLwu02u+EdV1u1WJDgT5UTdX02t1OSRcMTl8U6Iy+E5TyH2lC+HrNfIrpuhYBTPO2F+DOH7yb5+Qparo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Yb7fdTg; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3Yb7fdTg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAW4h6O6BVAtnrRdK322YufSv4Tc1s2g+/pwdqu5sWiiZi0WaBllnIJFrI7nRMZ5Iwupb5k71Fyb2R40Fm1XBjloRG6vUym0/ABlZF+TlrLK4s6Bo+73yHCLxGkcYl+EtSaOKMlwyeklVcLmn6pRQD99WZcIZ6G4USXobx/v6A0l/H1Bo/d8XPDt0NuY+t8kx7OS7fNjMNnUSRPPBfHL4KyawK372J4x2AeAuA1lNPjgDwYRXkccLFrkud+jysMt9YxUqbz92aGQeXvXM1eV8NAT1oEnMm/qAugrZKHAevz6faaAYLegOpSLaiZWr6zS/HS/yAPctNyLE9S6Qw2YcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glQsVyQHnnGhIjor8P2Px5T+5e8BzfooNwGlpwuKpOQ=;
 b=rGW1mrUjdBSUSye1FkfbRDJwjfrB8dLLB6EYxPlj+nGubOlYywas5MX12Pc4AwC5Gd/cqSdL6SIZiN3rQab0cYaYsuhIeMddFVtAM7SPa7HO3zz2AZbyQOlvb1c/Ei2EfQYljJMd20D3f7aQslYtHkWz3EEpTPGUBeNfou3uM3vs1oouEhrKz/DvnGhwnJZu+garbDSCMypKTCRKK8KOvvUayKcOA0+3oY/NQYF/lEGT1hdk0r32VzrkBMn7Kc1awRw7o5QqEmOL11bVQ9OR1eG1ot4iEgp8oE1VHQ+cmfZE15WcT02vyG2Ze+pkYrjss7yzcIoGbPv+c2CQUF4rYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glQsVyQHnnGhIjor8P2Px5T+5e8BzfooNwGlpwuKpOQ=;
 b=3Yb7fdTgGHTR2GoFUxt6LNCkjT8H9YXGQF26xmt/17Zv09ydWbnrqn1fDAHDZJQc2D9apPmSswUrhG+PlBJ+B17+qLm9LiqZpDAbuOg4txLyvgj6nPpxFc1NiA3dusCzQk/RauMEUb57bLA+8MuqOWhZw7KFLRrv+fV2qLcoDiI=
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 05:57:46 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::57) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 05:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 05:57:45 +0000
Received: from tunga.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 00:57:33 -0500
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
Subject: [RFC PATCH V2 05/13] mm/migration: Migrate accessed folios to toptier node
Date: Tue, 24 Jun 2025 05:56:09 +0000
Message-ID: <20250624055617.1291159-6-raghavendra.kt@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bc97f3-ca80-423a-ac18-08ddb2e40aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V6K/j6f+3UYG9U6SzW+Zca6P8Ca2JbvHKgbhtq9+mZbsI3To4XCmCMtiDHud?=
 =?us-ascii?Q?4S4cq3qRmtlm9YEAQjyAOZH2ZYlu9sRF2+aJLPJ1ZOxV4j9pOhV9swzxN426?=
 =?us-ascii?Q?zAhTX2h5xs6ezMAmtfaU/eJ1kTJck+S/FzciYWu9pKBIgZAeOHEb0KTAZHS9?=
 =?us-ascii?Q?sZAsdYg6uidvus5glpHuvWJsMPLGqBPIpESxxk+Tnqe/t4gWBY5EsAq2RfbF?=
 =?us-ascii?Q?wXubFQHaqb9gaxLmU985AwhijvAH+gOS2CjV4pp1oCB/7bMO2LveDrKvN81P?=
 =?us-ascii?Q?4loSOhH/+VPJrB0/Lh7YYxYo4BIpngOkI516itSIUG/enppi1iVzsITT4Laq?=
 =?us-ascii?Q?lroy5PazArCvRWMtYzz60RU3QX5FgvrtQMbvqbyd6Lip200zKFEBYF8zzqPu?=
 =?us-ascii?Q?UxwY5GPVeV28NJZjLwFZ8edfV6gOYKveuUivOQ4VZibtPBP2BF0eXuLiFCGN?=
 =?us-ascii?Q?CS3QUJCdf2hYV3oHdExaT+LuvqXKLqoMN70fUfc+bh+OtcfCcpipntQtsZqR?=
 =?us-ascii?Q?sWBe1ajKbNdRSjZzCMOuvBmcZhwiw+wqso5jAcTugsiVqzCH3N39DoCwRAyB?=
 =?us-ascii?Q?dt14rMX91s/oMajjYbCLUjdTRqfGKkNL7qrZOHDFtmj5CzfEJzrbLaKws6/Z?=
 =?us-ascii?Q?epW16V0gdLPNMwX4bk3u/WruYDDawBTv2F4QOcsStKHkPJ7EaCX7648dIN4a?=
 =?us-ascii?Q?7N9fjxwQh+1hyo6/D3nPxkXUj6RXG4RzENeuI07Q+ISM05LbGjq2x6uhLkuD?=
 =?us-ascii?Q?sKrlMklwEhi1Uets7XtL8mFaJRks0BYvXY1bEC4oAKt48UVS3v/tN5pe639I?=
 =?us-ascii?Q?hZcJVOQA6BvgMyxk8I6ktswC7s118fnJj4VycO58qVfcRLl2n/DncgQk4mHa?=
 =?us-ascii?Q?11zvobOVG3C+oJh0NIA1kmOu/OlESASKgclthyAFCz97DHUckA9Nb7vJ58A0?=
 =?us-ascii?Q?WkFyIez9ZklNPeuYA32K8yWd11eUysbDlI1bLs96LSrD6aruxJ0cb+TdGYeO?=
 =?us-ascii?Q?EvI6SZ0LsKYDGTbfU2cZZCNxeRPe0gRQlRpMcUVvi2V3NyYukCfDeVylYHE4?=
 =?us-ascii?Q?zfQW+PWRn4pg4Ja6xoOCcigiUeSrbNYn5qdBaK4z4UlV2Yh7JLWMCVpTQ4tZ?=
 =?us-ascii?Q?VkGGk0dc0p7YJm8bg5gJ4BM3/xMDlvPX3NyJr0rk7/mdFkemI4Vurc35cZVT?=
 =?us-ascii?Q?OQYqkYKbkWo2SltkAlwjiKueQdwN5NHsLSX9z+34rMseLJvKzAqr8C6Qiltx?=
 =?us-ascii?Q?dKa06el4aOaAbr+9j/Hk3aVWFVnElTwk9giTydsA/l6SEtXfM/oBgzcXv7Bg?=
 =?us-ascii?Q?GPiQ8bA0sn6LzhQc6jgzV4tH1i9cDWH+qogCXCNk4i+PAvlqq4qkb6ZjHf6Z?=
 =?us-ascii?Q?AgHV0GczKAw10wR8/IJfi7LlC1kOTb9Cuvq+KYTlCKLdcoqH46Th71dG1Z7a?=
 =?us-ascii?Q?Bv7exzVcoSSn61+Nrh2xPyG4pSwyNttMm6oeQgxWzu5tIIdDHPZW9M8oXBOR?=
 =?us-ascii?Q?2h1I950ubp8EmRzzgv/Y3E0ZGYZqiuXZwy/f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:57:45.6247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bc97f3-ca80-423a-ac18-08ddb2e40aa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

A per mm migration list is added and a kernel thread iterates over
each of them.

For each recently accessed slowtier folio in the migration list:
 - Isolate LRU pages
 - Migrate to a regular node.

The rationale behind whole migration is to speedup the access to
recently accessed pages.

Currently, PTE A bit scanning approach lacks information about exact
destination node to migrate to.

Reason:
 PROT_NONE hint fault based scanning is done in a process context. Here
when the fault occurs, source CPU of the fault associated task is known.
Time of page access is also accurate.
With the lack of above information, migration is done to node 0 by default.

Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
---
 include/linux/migrate.h |   2 +
 mm/kscand.c             | 452 ++++++++++++++++++++++++++++++++++++++--
 mm/migrate.c            |   2 +-
 3 files changed, 443 insertions(+), 13 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6..59547f72d150 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -142,6 +142,8 @@ const struct movable_operations *page_movable_ops(struct page *page)
 }
 
 #ifdef CONFIG_NUMA_BALANCING
+bool migrate_balanced_pgdat(struct pglist_data *pgdat,
+				   unsigned long nr_migrate_pages);
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
 int migrate_misplaced_folio(struct folio *folio, int node);
diff --git a/mm/kscand.c b/mm/kscand.c
index e4d8452b0c50..f79e05590cde 100644
--- a/mm/kscand.c
+++ b/mm/kscand.c
@@ -52,9 +52,18 @@ static DEFINE_MUTEX(kmigrated_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(kmigrated_wait);
 static unsigned long kmigrated_sleep_expire;
 
+/* mm of the migrating folio entry */
+static struct mm_struct *kmigrated_cur_mm;
+
+/* Migration list is manipulated underneath because of mm_exit */
+static bool  kmigrated_clean_list;
+
 static unsigned long kscand_sleep_expire;
+#define KSCAND_DEFAULT_TARGET_NODE	(0)
+static int kscand_target_node = KSCAND_DEFAULT_TARGET_NODE;
 
 static DEFINE_SPINLOCK(kscand_mm_lock);
+static DEFINE_SPINLOCK(kscand_migrate_lock);
 static DECLARE_WAIT_QUEUE_HEAD(kscand_wait);
 
 #define KSCAND_SLOT_HASH_BITS 10
@@ -62,6 +71,10 @@ static DEFINE_READ_MOSTLY_HASHTABLE(kscand_slots_hash, KSCAND_SLOT_HASH_BITS);
 
 static struct kmem_cache *kscand_slot_cache __read_mostly;
 
+#define KMIGRATED_SLOT_HASH_BITS 10
+static DEFINE_READ_MOSTLY_HASHTABLE(kmigrated_slots_hash, KMIGRATED_SLOT_HASH_BITS);
+static struct kmem_cache *kmigrated_slot_cache __read_mostly;
+
 /* Per mm information collected to control VMA scanning */
 struct kscand_mm_slot {
 	struct mm_slot slot;
@@ -90,6 +103,26 @@ struct kscand_scanctrl {
 
 struct kscand_scanctrl kscand_scanctrl;
 
+/* Per mm migration list */
+struct kmigrated_mm_slot {
+	/* Tracks mm that has non empty migration list */
+	struct mm_slot mm_slot;
+	/* Per mm lock used to synchronize migration list */
+	spinlock_t migrate_lock;
+	/* Head of per mm migration list */
+	struct list_head migrate_head;
+};
+
+/* System wide list of mms that maintain migration list */
+struct kmigrated_daemon {
+	struct list_head mm_head;
+	struct kmigrated_mm_slot *mm_slot;
+};
+
+struct kmigrated_daemon kmigrated_daemon = {
+	.mm_head = LIST_HEAD_INIT(kmigrated_daemon.mm_head),
+};
+
 /* Per folio information used for migration */
 struct kscand_migrate_info {
 	struct list_head migrate_node;
@@ -108,6 +141,11 @@ static inline int kscand_has_work(void)
 	return !list_empty(&kscand_scan.mm_head);
 }
 
+static inline int kmigrated_has_work(void)
+{
+	return !list_empty(&kmigrated_daemon.mm_head);
+}
+
 static inline bool kscand_should_wakeup(void)
 {
 	bool wakeup = kthread_should_stop() || need_wakeup ||
@@ -118,6 +156,16 @@ static inline bool kscand_should_wakeup(void)
 	return wakeup;
 }
 
+static inline bool kmigrated_should_wakeup(void)
+{
+	bool wakeup = kthread_should_stop() || migrated_need_wakeup ||
+	       time_after_eq(jiffies, kmigrated_sleep_expire);
+
+	migrated_need_wakeup = false;
+
+	return wakeup;
+}
+
 static void kscand_wait_work(void)
 {
 	const unsigned long scan_sleep_jiffies =
@@ -133,6 +181,85 @@ static void kscand_wait_work(void)
 			scan_sleep_jiffies);
 }
 
+static void kmigrated_wait_work(void)
+{
+	const unsigned long migrate_sleep_jiffies =
+		msecs_to_jiffies(kmigrate_sleep_ms);
+
+	if (!migrate_sleep_jiffies)
+		return;
+
+	kmigrated_sleep_expire = jiffies + migrate_sleep_jiffies;
+	wait_event_timeout(kmigrated_wait, kmigrated_should_wakeup(),
+			migrate_sleep_jiffies);
+}
+
+/*
+ * Do not know what info to pass in the future to make
+ * decision on taget node. Keep it void * now.
+ */
+static int kscand_get_target_node(void *data)
+{
+	return kscand_target_node;
+}
+
+extern bool migrate_balanced_pgdat(struct pglist_data *pgdat,
+					unsigned long nr_migrate_pages);
+
+/*XXX: Taken from migrate.c to avoid NUMAB mode=2 and NULL vma checks*/
+static int kscand_migrate_misplaced_folio_prepare(struct folio *folio,
+		struct vm_area_struct *vma, int node)
+{
+	int nr_pages = folio_nr_pages(folio);
+	pg_data_t *pgdat = NODE_DATA(node);
+
+	if (folio_is_file_lru(folio)) {
+		/*
+		 * Do not migrate file folios that are mapped in multiple
+		 * processes with execute permissions as they are probably
+		 * shared libraries.
+		 *
+		 * See folio_maybe_mapped_shared() on possible imprecision
+		 * when we cannot easily detect if a folio is shared.
+		 */
+		if (vma && (vma->vm_flags & VM_EXEC) &&
+		    folio_maybe_mapped_shared(folio))
+			return -EACCES;
+		/*
+		 * Do not migrate dirty folios as not all filesystems can move
+		 * dirty folios in MIGRATE_ASYNC mode which is a waste of
+		 * cycles.
+		 */
+		if (folio_test_dirty(folio))
+			return -EAGAIN;
+	}
+
+	/* Avoid migrating to a node that is nearly full */
+	if (!migrate_balanced_pgdat(pgdat, nr_pages)) {
+		int z;
+
+		for (z = pgdat->nr_zones - 1; z >= 0; z--) {
+			if (managed_zone(pgdat->node_zones + z))
+				break;
+		}
+
+		if (z < 0)
+			return -EAGAIN;
+
+		wakeup_kswapd(pgdat->node_zones + z, 0,
+			      folio_order(folio), ZONE_MOVABLE);
+		return -EAGAIN;
+	}
+
+	if (!folio_isolate_lru(folio))
+		return -EAGAIN;
+
+	node_stat_mod_folio(folio, NR_ISOLATED_ANON + folio_is_file_lru(folio),
+			    nr_pages);
+
+	return 0;
+}
+
 static inline bool is_valid_folio(struct folio *folio)
 {
 	if (!folio || folio_test_unevictable(folio) || !folio_mapped(folio) ||
@@ -142,18 +269,116 @@ static inline bool is_valid_folio(struct folio *folio)
 	return true;
 }
 
-static inline void kmigrated_wait_work(void)
+enum kscand_migration_err {
+	KSCAND_NULL_MM = 1,
+	KSCAND_EXITING_MM,
+	KSCAND_INVALID_FOLIO,
+	KSCAND_NONLRU_FOLIO,
+	KSCAND_INELIGIBLE_SRC_NODE,
+	KSCAND_SAME_SRC_DEST_NODE,
+	KSCAND_PTE_NOT_PRESENT,
+	KSCAND_PMD_NOT_PRESENT,
+	KSCAND_NO_PTE_OFFSET_MAP_LOCK,
+	KSCAND_NOT_HOT_PAGE,
+	KSCAND_LRU_ISOLATION_ERR,
+};
+
+static bool is_hot_page(struct folio *folio)
 {
-	const unsigned long migrate_sleep_jiffies =
-		msecs_to_jiffies(kmigrate_sleep_ms);
+#ifdef CONFIG_LRU_GEN
+	struct lruvec *lruvec;
+	int gen = folio_lru_gen(folio);
+
+	lruvec = folio_lruvec(folio);
+	return lru_gen_is_active(lruvec, gen);
+#else
+	return folio_test_active(folio);
+#endif
+}
 
-	if (!migrate_sleep_jiffies)
-		return;
+static int kmigrated_promote_folio(struct kscand_migrate_info *info,
+					struct mm_struct *mm,
+					int destnid)
+{
+	unsigned long pfn;
+	unsigned long address;
+	struct page *page;
+	struct folio *folio;
+	int ret;
+	pmd_t *pmd;
+	pte_t *pte;
+	spinlock_t *ptl;
+	pmd_t pmde;
+	int srcnid;
 
-	kmigrated_sleep_expire = jiffies + migrate_sleep_jiffies;
-	wait_event_timeout(kmigrated_wait,
-			true,
-			migrate_sleep_jiffies);
+	if (mm == NULL)
+		return KSCAND_NULL_MM;
+
+	if (mm == READ_ONCE(kmigrated_cur_mm) &&
+		READ_ONCE(kmigrated_clean_list)) {
+		WARN_ON_ONCE(mm);
+		return KSCAND_EXITING_MM;
+	}
+
+	folio = info->folio;
+
+	/* Check again if the folio is really valid now */
+	if (folio) {
+		pfn = folio_pfn(folio);
+		page = pfn_to_online_page(pfn);
+	}
+
+	if (!page || PageTail(page) || !is_valid_folio(folio))
+		return KSCAND_INVALID_FOLIO;
+
+	if (!folio_test_lru(folio))
+		return KSCAND_NONLRU_FOLIO;
+
+	if (!is_hot_page(folio))
+		return KSCAND_NOT_HOT_PAGE;
+
+	folio_get(folio);
+
+	srcnid = folio_nid(folio);
+
+	/* Do not try to promote pages from regular nodes */
+	if (!kscand_eligible_srcnid(srcnid)) {
+		folio_put(folio);
+		return KSCAND_INELIGIBLE_SRC_NODE;
+	}
+
+	/* Also happen when it is already migrated */
+	if (srcnid == destnid) {
+		folio_put(folio);
+		return KSCAND_SAME_SRC_DEST_NODE;
+	}
+	address = info->address;
+	pmd = pmd_off(mm, address);
+	pmde = pmdp_get(pmd);
+
+	if (!pmd_present(pmde)) {
+		folio_put(folio);
+		return KSCAND_PMD_NOT_PRESENT;
+	}
+
+	pte = pte_offset_map_lock(mm, pmd, address, &ptl);
+	if (!pte) {
+		folio_put(folio);
+		WARN_ON_ONCE(!pte);
+		return KSCAND_NO_PTE_OFFSET_MAP_LOCK;
+	}
+
+	ret = kscand_migrate_misplaced_folio_prepare(folio, NULL, destnid);
+	if (ret) {
+		folio_put(folio);
+		pte_unmap_unlock(pte, ptl);
+		return KSCAND_LRU_ISOLATION_ERR;
+	}
+
+	folio_put(folio);
+	pte_unmap_unlock(pte, ptl);
+
+	return  migrate_misplaced_folio(folio, destnid);
 }
 
 static bool folio_idle_clear_pte_refs_one(struct folio *folio,
@@ -257,7 +482,6 @@ static int hot_vma_idle_pte_entry(pte_t *pte,
 			folio_put(folio);
 			return 0;
 		}
-		/* XXX: Leaking memory. TBD: consume info */
 
 		info = kzalloc(sizeof(struct kscand_migrate_info), GFP_NOWAIT);
 		if (info && scanctrl) {
@@ -298,6 +522,115 @@ static inline int kscand_test_exit(struct mm_struct *mm)
 	return atomic_read(&mm->mm_users) == 0;
 }
 
+struct destroy_list_work {
+	struct list_head migrate_head;
+	struct work_struct dwork;
+};
+
+static void kmigrated_destroy_list_fn(struct work_struct *work)
+{
+	struct destroy_list_work *dlw;
+	struct kscand_migrate_info *info, *tmp;
+
+	dlw = container_of(work, struct destroy_list_work, dwork);
+
+	if (!list_empty(&dlw->migrate_head)) {
+		list_for_each_entry_safe(info, tmp, &dlw->migrate_head,	migrate_node) {
+			list_del(&info->migrate_node);
+			kfree(info);
+		}
+	}
+
+	kfree(dlw);
+}
+
+static void kmigrated_destroy_list(struct list_head *list_head)
+{
+	struct destroy_list_work *destroy_list_work;
+
+
+	destroy_list_work = kmalloc(sizeof(*destroy_list_work), GFP_KERNEL);
+	if (!destroy_list_work)
+		return;
+
+	INIT_LIST_HEAD(&destroy_list_work->migrate_head);
+	list_splice_tail_init(list_head, &destroy_list_work->migrate_head);
+	INIT_WORK(&destroy_list_work->dwork, kmigrated_destroy_list_fn);
+	schedule_work(&destroy_list_work->dwork);
+}
+
+static struct kmigrated_mm_slot *kmigrated_get_mm_slot(struct mm_struct *mm, bool alloc)
+{
+	struct kmigrated_mm_slot *mm_slot = NULL;
+	struct mm_slot *slot;
+
+	guard(spinlock)(&kscand_migrate_lock);
+
+	slot = mm_slot_lookup(kmigrated_slots_hash, mm);
+	mm_slot = mm_slot_entry(slot, struct kmigrated_mm_slot, mm_slot);
+
+	if (!mm_slot && alloc) {
+		mm_slot = mm_slot_alloc(kmigrated_slot_cache);
+		if (!mm_slot) {
+			spin_unlock(&kscand_migrate_lock);
+			return NULL;
+		}
+
+		slot = &mm_slot->mm_slot;
+		INIT_LIST_HEAD(&mm_slot->migrate_head);
+		spin_lock_init(&mm_slot->migrate_lock);
+		mm_slot_insert(kmigrated_slots_hash, mm, slot);
+		list_add_tail(&slot->mm_node, &kmigrated_daemon.mm_head);
+	}
+
+	return mm_slot;
+}
+
+static void kscand_cleanup_migration_list(struct mm_struct *mm)
+{
+	struct kmigrated_mm_slot *mm_slot;
+	struct mm_slot *slot;
+
+	mm_slot = kmigrated_get_mm_slot(mm, false);
+
+	slot = &mm_slot->mm_slot;
+
+	if (mm_slot && slot && slot->mm == mm) {
+		spin_lock(&mm_slot->migrate_lock);
+
+		if (!list_empty(&mm_slot->migrate_head)) {
+			if (mm == READ_ONCE(kmigrated_cur_mm)) {
+				/* A folio in this mm is being migrated. wait */
+				WRITE_ONCE(kmigrated_clean_list, true);
+			}
+
+			kmigrated_destroy_list(&mm_slot->migrate_head);
+			spin_unlock(&mm_slot->migrate_lock);
+retry:
+			if (!spin_trylock(&mm_slot->migrate_lock)) {
+				cpu_relax();
+				goto retry;
+			}
+
+			if (mm == READ_ONCE(kmigrated_cur_mm)) {
+				spin_unlock(&mm_slot->migrate_lock);
+				goto retry;
+			}
+		}
+		/* Reset migrated mm_slot if it was pointing to us */
+		if (kmigrated_daemon.mm_slot == mm_slot)
+			kmigrated_daemon.mm_slot = NULL;
+
+		hash_del(&slot->hash);
+		list_del(&slot->mm_node);
+		mm_slot_free(kmigrated_slot_cache, mm_slot);
+
+		WRITE_ONCE(kmigrated_clean_list, false);
+
+		spin_unlock(&mm_slot->migrate_lock);
+		}
+}
+
 static void kscand_collect_mm_slot(struct kscand_mm_slot *mm_slot)
 {
 	struct mm_slot *slot = &mm_slot->slot;
@@ -309,11 +642,77 @@ static void kscand_collect_mm_slot(struct kscand_mm_slot *mm_slot)
 		hash_del(&slot->hash);
 		list_del(&slot->mm_node);
 
+		kscand_cleanup_migration_list(mm);
+
 		mm_slot_free(kscand_slot_cache, mm_slot);
 		mmdrop(mm);
 	}
 }
 
+static void kmigrated_migrate_mm(struct kmigrated_mm_slot *mm_slot)
+{
+	int ret = 0, dest = -1;
+	struct mm_slot *slot;
+	struct mm_struct *mm;
+	struct kscand_migrate_info *info, *tmp;
+
+	spin_lock(&mm_slot->migrate_lock);
+
+	slot = &mm_slot->mm_slot;
+	mm = slot->mm;
+
+	if (!list_empty(&mm_slot->migrate_head)) {
+		list_for_each_entry_safe(info, tmp, &mm_slot->migrate_head,
+				migrate_node) {
+			if (READ_ONCE(kmigrated_clean_list))
+				goto clean_list_handled;
+
+			list_del(&info->migrate_node);
+
+			spin_unlock(&mm_slot->migrate_lock);
+
+			dest = kscand_get_target_node(NULL);
+			ret = kmigrated_promote_folio(info, mm, dest);
+
+			kfree(info);
+
+			cond_resched();
+			spin_lock(&mm_slot->migrate_lock);
+		}
+	}
+clean_list_handled:
+	/* Reset  mm  of folio entry we are migrating */
+	WRITE_ONCE(kmigrated_cur_mm, NULL);
+	spin_unlock(&mm_slot->migrate_lock);
+}
+
+static void kmigrated_migrate_folio(void)
+{
+	/* for each mm do migrate */
+	struct kmigrated_mm_slot *kmigrated_mm_slot = NULL;
+	struct mm_slot *slot;
+
+	if (!list_empty(&kmigrated_daemon.mm_head)) {
+
+		scoped_guard (spinlock, &kscand_migrate_lock) {
+			if (kmigrated_daemon.mm_slot) {
+				kmigrated_mm_slot = kmigrated_daemon.mm_slot;
+			} else {
+				slot = list_entry(kmigrated_daemon.mm_head.next,
+						struct mm_slot, mm_node);
+
+				kmigrated_mm_slot = mm_slot_entry(slot,
+						struct kmigrated_mm_slot, mm_slot);
+				kmigrated_daemon.mm_slot = kmigrated_mm_slot;
+			}
+			WRITE_ONCE(kmigrated_cur_mm, kmigrated_mm_slot->mm_slot.mm);
+		}
+
+		if (kmigrated_mm_slot)
+			kmigrated_migrate_mm(kmigrated_mm_slot);
+	}
+}
+
 static unsigned long kscand_scan_mm_slot(void)
 {
 	bool next_mm = false;
@@ -327,6 +726,7 @@ static unsigned long kscand_scan_mm_slot(void)
 	struct vm_area_struct *vma = NULL;
 	struct kscand_mm_slot *mm_slot;
 
+	struct kmigrated_mm_slot *kmigrated_mm_slot = NULL;
 
 	spin_lock(&kscand_mm_lock);
 
@@ -356,13 +756,23 @@ static unsigned long kscand_scan_mm_slot(void)
 
 	VMA_ITERATOR(vmi, mm, address);
 
+	kmigrated_mm_slot = kmigrated_get_mm_slot(mm, false);
+
 	for_each_vma(vmi, vma) {
 		kscand_walk_page_vma(vma, &kscand_scanctrl);
 		vma_scanned_size += vma->vm_end - vma->vm_start;
 
 		if (vma_scanned_size >= kscand_scan_size) {
 			next_mm = true;
-			/* TBD: Add scanned folios to migration list */
+
+			if (!list_empty(&kscand_scanctrl.scan_list)) {
+				if (!kmigrated_mm_slot)
+					kmigrated_mm_slot = kmigrated_get_mm_slot(mm, true);
+				spin_lock(&kmigrated_mm_slot->migrate_lock);
+				list_splice_tail_init(&kscand_scanctrl.scan_list,
+						&kmigrated_mm_slot->migrate_head);
+				spin_unlock(&kmigrated_mm_slot->migrate_lock);
+			}
 			break;
 		}
 	}
@@ -458,6 +868,8 @@ static int kscand(void *none)
 static inline void kscand_destroy(void)
 {
 	kmem_cache_destroy(kscand_slot_cache);
+	/* XXX: move below to kmigrated thread */
+	kmem_cache_destroy(kmigrated_slot_cache);
 }
 
 void __kscand_enter(struct mm_struct *mm)
@@ -493,7 +905,7 @@ void __kscand_exit(struct mm_struct *mm)
 {
 	struct kscand_mm_slot *mm_slot;
 	struct mm_slot *slot;
-	int free = 0;
+	int free = 0, serialize = 1;
 
 	spin_lock(&kscand_mm_lock);
 	slot = mm_slot_lookup(kscand_slots_hash, mm);
@@ -508,10 +920,15 @@ void __kscand_exit(struct mm_struct *mm)
 		free = 1;
 		/* TBD: Set the actual next slot */
 		kscand_scan.mm_slot = NULL;
+	} else if (mm_slot && kscand_scan.mm_slot == mm_slot && mm_slot->is_scanned) {
+		serialize = 0;
 	}
 
 	spin_unlock(&kscand_mm_lock);
 
+	if (serialize)
+		kscand_cleanup_migration_list(mm);
+
 	if (free) {
 		mm_slot_free(kscand_slot_cache, mm_slot);
 		mmdrop(mm);
@@ -563,6 +980,8 @@ static int kmigrated(void *arg)
 		WRITE_ONCE(migrated_need_wakeup, false);
 		if (unlikely(kthread_should_stop()))
 			break;
+		if (kmigrated_has_work())
+			kmigrated_migrate_folio();
 		msleep(20);
 		kmigrated_wait_work();
 	}
@@ -603,7 +1022,9 @@ static int stop_kmigrated(void)
 static inline void init_list(void)
 {
 	INIT_LIST_HEAD(&kscand_scanctrl.scan_list);
+	spin_lock_init(&kscand_migrate_lock);
 	init_waitqueue_head(&kscand_wait);
+	init_waitqueue_head(&kmigrated_wait);
 }
 
 static int __init kscand_init(void)
@@ -617,6 +1038,13 @@ static int __init kscand_init(void)
 		return -ENOMEM;
 	}
 
+	kmigrated_slot_cache = KMEM_CACHE(kscand_mm_slot, 0);
+
+	if (!kmigrated_slot_cache) {
+		pr_err("kmigrated: kmem_cache error");
+		return -ENOMEM;
+	}
+
 	init_list();
 	err = start_kscand();
 	if (err)
diff --git a/mm/migrate.c b/mm/migrate.c
index 676d9cfc7059..94448062d009 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2598,7 +2598,7 @@ SYSCALL_DEFINE6(move_pages, pid_t, pid, unsigned long, nr_pages,
  * Returns true if this is a safe migration target node for misplaced NUMA
  * pages. Currently it only checks the watermarks which is crude.
  */
-static bool migrate_balanced_pgdat(struct pglist_data *pgdat,
+bool migrate_balanced_pgdat(struct pglist_data *pgdat,
 				   unsigned long nr_migrate_pages)
 {
 	int z;
-- 
2.34.1

