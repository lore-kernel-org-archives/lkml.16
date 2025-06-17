Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0472036E9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126348; cv=fail; b=CVGxYYmD7h1opfWA6JfO2NkH2uq1n/61Fp5wfPPgcyz8RRHjgMyjBg1PC+bJ/GMTOGTyx22F/Je37f0MYhAU3YYsbNvCFDXudjLZJuSIRIXeFknfLuVvlY6n77XXSbSfTzaRO0lE6M57au7hNPVlhHNPQi4JJYKg8/IickkBTx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126348; c=relaxed/simple;
	bh=xMNOBFptsatJunn4GVsHm8dUqDAS7dh3Q2xY9FmORKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4bJ5tVTPIsa5MncKB0z4WzTb9I9Gv9XsJj3qHGlQiEcTA1aN53Aw/UBAUfSmJK/r9nRU0a9d4cj8cZxxFKt7Hg9xyWkqhQesHV+/O9fFxQfGzAeTwy9FVvsKeczuGiedsZmdeVe3CTa0Bbz0ntkUlHL0ghhElyzqQIf3r63vVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=krr0c/Nd; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="krr0c/Nd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFBoBvH0+ExsiMNKb0AdPTdGTfJWISZ+5Z6kqgUIyDc5UmDp7N0i/dPGiPWsiN1hkVPSMVFo3DkyPqE5QjSXm2q7bE2LBqQJ6/2XW7pAOUflX3d9ovRxArV5BtvN2YqkdgLovxOe33z5dnlAGNRSiIBJMpRQYeMYeDhn+mOHioxn1yh8nG6Eze9CAjVrOGG9hHYkebcB3N/K13tJTygtAe7iR6qDfwws9SeVj2+NStJmB55fjJAvKsV7DC5fs3CGv/fuiBQQ78LBVl6WV9dvHSwKoye2523KuiyiAyPwPdfM+HWqGuBhLdF0/NyIyvkZHMF53fXolNAar/Vzeh+H4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aWlbvxfbraMWybz7/Pfg4gx+wiq3tJBlLsue4a5SvI=;
 b=Dq2f7zb3WIPFbp9c57AM4GTPYzltPsgIr331U9javMF+6roCdloxreK31lu8vsTg+BSAtQXByeH/HKdHCPfMilrVb2/d1a3k5pI8buE+K701gh0ULoTi1HRUEm+RxdJcY5C48utPpgYXMO6NWSeNBBDPYiNJYRfxxxnr2NkctNExwEFgEWwcErFoIqgmLYJkDbfkEGjmhQlyLMg6Uw94xJ1kcm3Qg8Bnk9URZLzsg1yfMs8iNJlxipxfdgj2BJu6Xz4GYL8SVhxldZ/p2qkH8mqa4EdeqN0WnKh2sKBLvFfCGPaEmGvVPvFRsxZ0yGrazsP9IgBQiJ/JYd80xb1GUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aWlbvxfbraMWybz7/Pfg4gx+wiq3tJBlLsue4a5SvI=;
 b=krr0c/NdzSQZT85DLleVFXQCANMD7NngSwS4R9/NAHG1PB8UpaerLLK5GBeu/4+rOMGpUU2o3MHR5HFvRgETZxJ6AwjBnSMscB/06LmzYdKcen00roRErmUNsr4D0f6TB87oVTcRyOFaA6V9GIKQVYYvwxS2jNyNCOOCnw4s5V1oSCz/UXPuQJm3qaRFRTBHC6V8T2FTdPQ+ohAmJe/lEgvZC60uKL5fG0vNgtZWpPeCx7thBdhVkCjcvHXrgTtlvz6kCKRRgMRy+EdZwZFvwURhfnQhdVBjl18zApfMXBC1jqK/4OBlroqx3djqd9k6V78CNhYDLo9DnsagJxLdPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:22 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v10 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Mon, 16 Jun 2025 22:11:10 -0400
Message-ID: <20250617021115.2331563-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617021115.2331563-1-ziy@nvidia.com>
References: <20250617021115.2331563-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0008.namprd19.prod.outlook.com
 (2603:10b6:208:178::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 946a2a86-626d-4b31-e5c2-08ddad4464e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0a5czOCnLfSRAR4ptKu8astLKU5Y7MqwmigochKfiqSEI9LFuBd8XxElQrj+?=
 =?us-ascii?Q?t9xGwYTsrOOI/Qg+iQlEJdj2Tm72FcRtgcgUZGiKAt64v6D+UE9VTcoed1s8?=
 =?us-ascii?Q?3XPWgvyDAV8DfGWXwy1YSlNTGLMEGyFpDvOYvFGeVEW6iIPfRozns7IlbjGX?=
 =?us-ascii?Q?ePnCT8RzDPr5q94j2NZ9pIa6f8JOKyn2/HB1sPmyTBuwDq852px5JDbfR4WC?=
 =?us-ascii?Q?caNTHn6d0y39XKaxhZwgeeLzhxlJ60lO/KYBCMiOP2UW2W++5QfovUNe9L+Q?=
 =?us-ascii?Q?WKhTmjrCcJKpEaFnzKzTJFA/36liRu43TzGbV5GSc7DAMkiO0A6D5Rd0ohTt?=
 =?us-ascii?Q?/fQbivp+IgBgN+4nxmquYXTJeWpJ+BZraH7C3NMSNGORW/YqTrAeGOccQMmV?=
 =?us-ascii?Q?IXZels/4bRXqqCkSHUuXPYUDdT34f9qMpKf5LVOu/fAXfbaqTx/A/bLjiOHO?=
 =?us-ascii?Q?Yl2ebYAnp1ZsnSju2tZ2XbnMwnTnyg5GTluswLPgj1lfx4RLhFjSIF4UtrHh?=
 =?us-ascii?Q?zs+Ejz29C04e3Jvh21l9TpGEQTxVdGZO8NiJ3ydoRG7UhlfFT66+X1eJEAR/?=
 =?us-ascii?Q?5lq2KQWT+rbtBTaDOiaBn2GqdF2bNx9lW4o9gObtPu7hUZj6jveFUuc+2uzk?=
 =?us-ascii?Q?D3JEGRgC4iXDmonGcnxJ9s6OqBATgQzCSukT2DTWbGh9pLDUIyqRY/ETQfhr?=
 =?us-ascii?Q?1KgXrUF33GAUhYtMenkMZB/wREUp/qVfS1eBk1SWTepKSljbR8X/QvxV8u0Y?=
 =?us-ascii?Q?JbGcbBlhmDASzUm91Sjt1mpY3kurm+eTy/mMdsSG0xUoCTiixq6iCvNJFC4a?=
 =?us-ascii?Q?yl2fSn8rwX5gbOaF+fsEvfbRQtJuMXOxW4RtjFbHiXJoDgaYhEBVEy6R0g3S?=
 =?us-ascii?Q?tsTU/9sw78qZjgscdST6HKzYOl7VgVMDElXnaICODacMhXXKv7j8ZlvOoygw?=
 =?us-ascii?Q?KqZv7WmFWi35ZvYRFU8iYz5Y6FxEoWzyo4iB0A211QAAI5alm/yb4wOZ7AWo?=
 =?us-ascii?Q?gEPBFq5idPlriIFpiDRkaYsEnvbpfR3KX0gCI7VecBZyARe7imJB71bfCoYU?=
 =?us-ascii?Q?L6LUF5C9flNQOd1xsViyJ0oQNUuP72KCjSCk5tfEzI26fJuvs8Mnf+oZURn+?=
 =?us-ascii?Q?251C4NMxq3XvZf/yn+7m7z5ASX5S/Mvy2T9zLUWPlIkT0bQfukea6msd8eps?=
 =?us-ascii?Q?V310jN5yQG3fVnJ4avT633PTs69IaeREfZFOTb//xnjeMTRm3VCRZu/0lWuI?=
 =?us-ascii?Q?woaYQ//5VbwMcI1b0Ng54zeb7ISJ3/M+3p1ItOworMylsrXe4QnHtvsVinlY?=
 =?us-ascii?Q?mJRAkCKdMHVu/gx5LvcNy24LdV/BB0ukQs+r74/fUHKHEGO6X0AWvY2QOvah?=
 =?us-ascii?Q?OzDCR8keTtI5WNvFdFk5BXYaYV2gAioVX9MnDs6ie0Kql610ww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P1clOo0elRtxRQHSKLYEW9uPU1xz2+A1kQUKVRhI+0oW+MkFQFb3O7J3OQvO?=
 =?us-ascii?Q?pJjqxFoONJsGZJnaMi+G6relYgrSQIFSVBfjFxek1nBKUN1wUmP0sGVlKAtB?=
 =?us-ascii?Q?6jv3jnHtW7Q4aDR2FknQWfZu193u6RHGT69CEl5gdU7eli8Dz0867JglYkSj?=
 =?us-ascii?Q?uq5eEbZ+CHndP4jstHcsyGWIdLIRD2lFr2NC2zzp5dO/xsAsnM51k/i04VoM?=
 =?us-ascii?Q?wMo2Ja2zkNz7fvewAX8CIrE5Q6eS+l8D58bZIfM7q0mGrcR5gqNtluqubVoH?=
 =?us-ascii?Q?rYgtoHZpVe+YJaije7AULdrtdb+vuTne3LH5tbXbnNsgnXBVAJHBlnLuYMxY?=
 =?us-ascii?Q?OKUyOhMLy345zihcBO0SeMzBYQcdXasJlicbnYvqYrB2MdLO/g7AGgfrjnZ9?=
 =?us-ascii?Q?2SY0fe7qPYo9hiDcZDNng1H/KrIDSlxrkK4v/v34pUlF6yjj/vvWZ88FzRbq?=
 =?us-ascii?Q?ydSp34N9k3d24dudnnV41pjzEhCNHIn6uBxoyKWm2r6kfWJ1BQDfodiOXtjP?=
 =?us-ascii?Q?pbS+Dmrs4yPCx8u/u7XRUwO6vbcuD4By1c7fgiM2nkBKPJfKil0k6brXDq4i?=
 =?us-ascii?Q?odMzBX0rKrAg8w/kxK5MpAsA97RN88Y6EMGIMXr6GV7PX4Ag6x2pqKuXr+9n?=
 =?us-ascii?Q?Ip4xjNj37VFxFAnpoMNyBJYfrSQrPNlA3c/Zcp9Zl4AUjbHBIOdtoMR9fpPG?=
 =?us-ascii?Q?4JSAS99gqjUPtrzLKNFECGcEzpeKT863pPC51jF9NNg18k34ZttSnk1r2Av2?=
 =?us-ascii?Q?8IomcJ98x16HKVo8293loBgVA+Zg+sdB5CG1Az6uiXDhkfWfuZKyvtU5Onqg?=
 =?us-ascii?Q?jHepCNNYnWCv0wyIbiEVh08bpt223JxVaaukCIExSOkZ+3Rwh2O2LySGuXmn?=
 =?us-ascii?Q?HvrO8OuL+yHNVpqvC7Kb4JjD0DfDrL509tQ00DCQn3jG+19DyOFlxVy48xCU?=
 =?us-ascii?Q?YXdKZsGSdqIfx+lbHyJRk69axdH8y8VjNWB90R0UwHGY1jTCaKwGic1kZ8u1?=
 =?us-ascii?Q?zLkjyCxYAnmympeKAgOXoxGgrpZQbTj1in5Aib//z6TmhRsN9S0Z6unV1cxu?=
 =?us-ascii?Q?hYmbtcp+UlqN6NXPV1QM13Gvp4ml+q+vics435kXhqIYbibj4thLPSr8uoou?=
 =?us-ascii?Q?oNOkUaOuroxfLqRF/8JNv70BE0ar01Dt/YZjYtZ6QjpDDTq6uEN3lAJ/Hp1x?=
 =?us-ascii?Q?WboxXz6cJu/BGioaM9mSce3/KhIJ6MLKXAAgI3VomTD7IPhQQIXIrKZE4RPR?=
 =?us-ascii?Q?TzsL1GxQfYULnFNASKwCXAaWz/8V1QC3TdorPbjN3GmHy7MdtxqNvEnnQ4Fq?=
 =?us-ascii?Q?MeYIlbSQg3WsL185jRYT4TAscrKlVmhEXMAqTVEespIF4Tog/hLyjD3Yme9X?=
 =?us-ascii?Q?J3+4mT2OXK89AAQmQRrRrOdXgA5E5EZK1/GtiPGMsqzYTLJqefrC58G8omWL?=
 =?us-ascii?Q?joDebjFqwJ36ZlhDEayXKwhBBT+w0TvOGcjoh6sTvcbCYKkNvTHK2lTHwjpG?=
 =?us-ascii?Q?kRGn5seeo5vqCm9ql52EmZZAqFJM+sKsHV7jztr+KCDEBaHcjmA40qvRWzeX?=
 =?us-ascii?Q?EYtSjIJNL0Yt5ddW3hsv+0L7in+eTAJ6orF31Idn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946a2a86-626d-4b31-e5c2-08ddad4464e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:22.1008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXj3c1I8qxCQRGoQpJctIH2O4R4Gzv3e4b1YXe7kD1PfMQ4OIJkVELpg/VRf/Rro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_compact_skip, so that migratetype is not lost during pageblock
isolation.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mmzone.h          |  3 +++
 include/linux/page-isolation.h  | 16 ++++++++++++++++
 include/linux/pageblock-flags.h | 14 ++++++++++++++
 mm/page_alloc.c                 | 27 ++++++++++++++++++++++++---
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 76d66c07b673..1d1bb2b7f40d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -79,6 +79,9 @@ enum migratetype {
 	 * __free_pageblock_cma() function.
 	 */
 	MIGRATE_CMA,
+	__MIGRATE_TYPE_END = MIGRATE_CMA,
+#else
+	__MIGRATE_TYPE_END = MIGRATE_HIGHATOMIC,
 #endif
 #ifdef CONFIG_MEMORY_ISOLATION
 	MIGRATE_ISOLATE,	/* can't allocate from here */
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 277d8d92980c..fc021d3f95ca 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -11,6 +11,12 @@ static inline bool is_migrate_isolate(int migratetype)
 {
 	return migratetype == MIGRATE_ISOLATE;
 }
+#define get_pageblock_isolate(page) \
+	get_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
+#define clear_pageblock_isolate(page) \
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
+#define set_pageblock_isolate(page) \
+	set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
 #else
 static inline bool is_migrate_isolate_page(struct page *page)
 {
@@ -20,6 +26,16 @@ static inline bool is_migrate_isolate(int migratetype)
 {
 	return false;
 }
+static inline bool get_pageblock_isolate(struct page *page)
+{
+	return false;
+}
+static inline void clear_pageblock_isolate(struct page *page)
+{
+}
+static inline void set_pageblock_isolate(struct page *page)
+{
+}
 #endif
 
 #define MEMORY_OFFLINE	0x1
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index c240c7a1fb03..6a44be0f39f4 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -21,6 +21,13 @@ enum pageblock_bits {
 			/* 3 bits required for migrate types */
 	PB_compact_skip,/* If set the block is skipped by compaction */
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	/*
+	 * Pageblock isolation is represented with a separate bit, so that
+	 * the migratetype of a block is not overwritten by isolation.
+	 */
+	PB_migrate_isolate, /* If set the block is isolated */
+#endif
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
@@ -32,6 +39,13 @@ enum pageblock_bits {
 
 #define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define MIGRATETYPE_AND_ISO_MASK \
+	(((1UL << (PB_migrate_end + 1)) - 1) | BIT(PB_migrate_isolate))
+#else
+#define MIGRATETYPE_AND_ISO_MASK MIGRATETYPE_MASK
+#endif
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b303f60b6ed1..a6e191f86ea3 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -365,8 +365,12 @@ get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
 	unsigned long *bitmap;
 	unsigned long word_bitidx;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
+#else
 	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
-	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+#endif
+	BUILD_BUG_ON(__MIGRATE_TYPE_END >= (1 << PB_migratetype_bits));
 	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
 
 	bitmap = get_pageblock_bitmap(page, pfn);
@@ -439,7 +443,16 @@ bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
 __always_inline enum migratetype
 get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
 {
-	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long mask = MIGRATETYPE_AND_ISO_MASK;
+	unsigned long flags;
+
+	flags = __get_pfnblock_flags_mask(page, pfn, mask);
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (flags & BIT(PB_migrate_isolate))
+		return MIGRATE_ISOLATE;
+#endif
+	return flags & MIGRATETYPE_MASK;
 }
 
 /**
@@ -519,8 +532,16 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		return;
+	}
+	/* MIGRATETYPE_AND_ISO_MASK clears PB_migrate_isolate if it is set */
+#endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
-				  (unsigned long)migratetype, MIGRATETYPE_MASK);
+				  (unsigned long)migratetype,
+				  MIGRATETYPE_AND_ISO_MASK);
 }
 
 #ifdef CONFIG_DEBUG_VM
-- 
2.47.2

