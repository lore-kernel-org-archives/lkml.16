Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B98A285C9F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075834; cv=fail; b=C1Xrti+5eGYELRyAB3OZ5nrCOqE+fkSO+GFrdLEGZdRGFmot57yCloZiA5vGNWBMtmoNM8Oml0O3SpP5+tM41y2RaOZizVaguw/+XjquOEcPEB5Xo1pzSLWUn+g+Oi/SCr8lfHg30GXg7vAuGV2VvrwW6wBZYu1sCGUMbteQb3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075834; c=relaxed/simple;
	bh=xMNOBFptsatJunn4GVsHm8dUqDAS7dh3Q2xY9FmORKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ngQDyL6JnPqqryNiZNjKvHl4BbPVQuA49jzir9hg9vVmRoPUsK7mJ+8U/1vDWsEkEQwYu4RlHSgwh5wpbrtCn6p8jWQPPFF25SDGARetN6E8/7rgLoQlzKCkLYR05eijVSZWTp4FMGjHsMi5XMbsr5m/hGvO4ZP4aCUJ4OPciiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FSMgsS+o; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FSMgsS+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULTkU+FFDfryWARvvKNPYjEMprx0/13gtVt6cLTspg4c/lWbxEOxKoCIuxlr5KC7yyHWbPqV5mCfidNOy/4FOLJNdiSurOSdQxoCMZOaawCimxcxn2kaWrY9riUbSBsMXVH/ef+zGr2QlOS5hNzDAB9hQKJuYc7P0BimLZYl1d/YJ/fbAgxJsUCMc3ejHmuu5viz5A2Jxhv2/Ky4JKBAkyzsqOeIhVVDWkWIaUXdg0BPIjlgB+GjTgs8FETQwbr+gBKuIa0tF0xVYRxkITDGmwBdc3q4U74eS2kSXB0tbglS3zIUBILlX8pWfeEpzxCQaeSrCNcXEXcy7G/ynKSk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aWlbvxfbraMWybz7/Pfg4gx+wiq3tJBlLsue4a5SvI=;
 b=WKLkdo9cN4GsHf5Pxi+5Azfm3ZP3wDD/Pe9zBRkEjg/OK4pUsuB7jdAjzkmz30VVCg9WzCXfIWA489aa0BxPf0x6FnpfbRAukrXpoRTYKwo+Jsb6s8FjwPbLmhLYgY8F0/j7ZYtxM0Y1ebeCfUDkbXXgJ8q0aeKaoMAmq1GkhjAplxeYOonZWE0nkdKwEr41jYcHUSBFeGi62+97AgX2tdafHytShhLwhpfHbl/t6EQcqFAYvzCU0Nng/lueUEgQ/ebTYNaVlkco1svW2Oj6lTvWXKGyl0KKF9tkVe1PRttJfYkjBiIIzZB00ZvnM+3LCb1AP9i+iYSBptRlOAycyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aWlbvxfbraMWybz7/Pfg4gx+wiq3tJBlLsue4a5SvI=;
 b=FSMgsS+olqZTyrJiikt1k6KdLp0FoKTbj87KGytJE8K1JzFfjGBmbALtQY1RASuPYdN28mFYZ54ysZqVyM4O0yaKc0P8PBwLjqR5YklrUDKiw/b+e+LTGBHad9e01nJlZD0Z/texCpOLOjth3p45pbzRtOEZh+0aZu4jVD6QfkmVlE0zfzk6HrO0YXp/dijQT0xwkHvZdLM1QBAxi/gotdKwuaGZQTBj8VM2uhNHPa1TKpPRAQEiSY53xeeNzb7jctJ4Pp9Ysi738CDQd8lAp76pk0JtUWz4l+mVcbTwkNad983wjuBa4bWRZRZ7YLS04/uyz6HrwPqD8+rzzIsLpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:10:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:27 +0000
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
Subject: [PATCH v9 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Mon, 16 Jun 2025 08:10:15 -0400
Message-ID: <20250616121019.1925851-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:408:143::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: d320346b-d1a5-4ecf-9613-08ddaccec7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIGYqcKruEyT58my7RSOE8FVc+og/EJQFvDQMhFm4SQfL8nzYI7h77RypRQ6?=
 =?us-ascii?Q?V3lz+vbcvtpRIVa+aWTYQHOPQKp4tgU3eTJntIyoh1hjpwKKIcWIxsRJpDdw?=
 =?us-ascii?Q?6C38yvY30j1OMGPiOdMOkWXKt3jM2xZ8ixLdDYFtSHoRj0dMTrCV+qPfqe0T?=
 =?us-ascii?Q?OfgdsN2K81Ptcic/MR3Jj9tdwq+UwH2SA4lRmIQ8UnCZoFy/jj7MehsMaoP0?=
 =?us-ascii?Q?kqd/RSnsKLwkZkphwWr8wWPW1/s9oiGYzNtNxUPbkR6y5O3wmUWbFf2jV+eu?=
 =?us-ascii?Q?wLKS4c5RXKi5psoZNq667UbbtGk2izUub7z+bEKGj4HwkOMFqe0Kk5BHOvKB?=
 =?us-ascii?Q?Lde5JZ+Du7XBzCXt9Nt60+rCb9T3V0bwrmqBeaaFDmsdqLaDXAElGpQfw/Uh?=
 =?us-ascii?Q?Riq72hguzYMFjgGD8smEj4UiD93LmoFB4TSbruiMTr9sUEO532c+EfF4yljx?=
 =?us-ascii?Q?Zp+0xZPdeLU0O92QNIP86V5hGVAbxOc2n0SOVpw73EjSnTjTpEFK/pD8/XMO?=
 =?us-ascii?Q?x2NfIq74rEZ5/B+FrTpMujEyzcfWAQ84kt29DZ9KivFnwD17/Qnc9dbtXHDE?=
 =?us-ascii?Q?ZLVj1kvkf34zAuHYKAqWNvj8lp4UjXmhvbgt190jQpCHWReMdwWIGOSs3i7d?=
 =?us-ascii?Q?63tBfYX1A9BoL8+DrTuc3LXqOKd53y8nBOmT5e0WklILRNFLRsAYUhHoBcc3?=
 =?us-ascii?Q?9JXaXAFA/O/fWqUKfI2zi0x1uZUb+1B1BNGsNiXAA2T2sxa4PGRA1FEQqxak?=
 =?us-ascii?Q?OuJiZ/iOw0AHmo6nmEL9phCLGAI2oesgswP6fK9IpnmyvPktC2lZIqp2+Wp8?=
 =?us-ascii?Q?bRGHTjwe2CHxUtNVz+bt0snp8A/XB4m0Vw/fgAxC2gAQ1M8xMQM06/5z9eGM?=
 =?us-ascii?Q?cSQL66KTVWuS7DcqwwQJewUpAYCHlmN3e0zMS3JNfQFSd5mi2OXz3O2HdNjn?=
 =?us-ascii?Q?y1yV40cWeblk1f++s4tPKsik3qjeSLiUEgCJkL46rBOS5X78QyYBK3hM7/8C?=
 =?us-ascii?Q?RmaWEsatFSiBazhblNV8GNuIIZlhuiITJNsOVyxtckDKabRqlFQP+VvWJldA?=
 =?us-ascii?Q?4FcaghUpMGdqgZ8dladQGpv+v74WM1ir2xnLF5ET30Z0WRkNrADABhaCEVBM?=
 =?us-ascii?Q?cK/wKQDTYQDw42eZryLyDVVif4qcK7MdqxZzPxSZBbWgUQnHZwht7w1HzOv5?=
 =?us-ascii?Q?vpyz+nZSqJHPGqFp0Wpzc7Fp75ltjprXb1cCFwN8vwYZmKDUiA2fx8pr33kR?=
 =?us-ascii?Q?6b7WP4nKCH4zxZrPd3L7MiWh5O1NTLrTtnyX5tMk8fQGcKYgM+VCTFTa9hwp?=
 =?us-ascii?Q?kSrKh5OhcGsstj7zevbDb2dfjO4xa2CEupMqYWW1kLXOecuRRw/uPE105VA+?=
 =?us-ascii?Q?hGNsq7tFsVcuDqRoettHgkfnhkzkthma0d1gfcHygoEY81CAoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZAD6u6Oec3QkkZV4uQlm+vLP/zXAUPQ+M6/IoFcqU9lTuh4BcDw4MCZS3BPf?=
 =?us-ascii?Q?gMzYqFwK14W2QSZMfUkEVdD46liVIwAZyR3VzSjSy0ivvDWrfyQk7Hgg9JGl?=
 =?us-ascii?Q?RmfFmi/0g30Mn4WdZ2+nr/0JHPurF26ywXLPBIodSJaNgq9CogpDSca8SQZf?=
 =?us-ascii?Q?3NxSKejCmEtT6/QDsqWb2wxgXgP+L+Knyoe/y9dz94nva7rjNnIra4mLKX1s?=
 =?us-ascii?Q?u1X0/DDDsGWWO2lfYNSRQuUhZzyWDbI2cW/vGSxLLaTW+GhCF0tzzAP5Zj8b?=
 =?us-ascii?Q?ryB7AUCy6zVaz9yxtM2LlwxOlS9UsboKHGqYM57C+OV4AGob4TJ6VI9poJPW?=
 =?us-ascii?Q?aeoyXgD5mWmbCtULpA99MctShSXfX/OwUoJVT013xKv77tguWSnBY/UnVnnm?=
 =?us-ascii?Q?mSm6b2lZFdJ6JDzoFoVW4t1rC+Ewz4gAxwRDmvIuYebL4h8N8J/skH/sJ6Lo?=
 =?us-ascii?Q?q7dz+pHipE9bDpLDLCPH14c/ncJAGO2CpviafA9ELNQx05zAA+2lc76hftmN?=
 =?us-ascii?Q?UUZVdk4XeKM5p5C2Uew85/ODfZvp/U5bkNJ1sH56ya2g0IQp8BLBjfmsYsR1?=
 =?us-ascii?Q?XpF78jqCIMrccEvwHr3diAt8+o63eAlx5d1n7bjxVcDuDvxWaX6+3jApUJ81?=
 =?us-ascii?Q?i2/OC6okPzvjY9dSsgtn12bC77YK4bFLRk8iwkq9UQwRj8DrQQS8g8z+p3QI?=
 =?us-ascii?Q?JML1ALsuSJi3HlT36QraEr12wb6fUk6R5erBqfZS3MX4wooUd4CooyLwQilr?=
 =?us-ascii?Q?i75bjODjcUVjkpOXq8YOmY72OIWRzRBAyNXmh2C+ZdmBmlXAXDZzoYdhu8sO?=
 =?us-ascii?Q?nBq4u8x7c6eBBZjcs0ArGk00ZxhZmRkmI7QaUOu7mBP8C9NTTf1lm/jaYNNI?=
 =?us-ascii?Q?PV1uteWPi7cey6zOzaqqPPzXjZzWSWER8nUC5LA6KQXbOk0LxTa9D7zqmHO/?=
 =?us-ascii?Q?YDm+ugu0FpMgjW6d0uNxOJ0+IItSsiC66rpByKc/Y5z0f38kO4Alanx3Fuvo?=
 =?us-ascii?Q?jLOUHr9WjDrxnr46YPrhfYB21QAbaKsOQbx+G2nnG2fbQuyMcuiw0/HEl77W?=
 =?us-ascii?Q?7AYoF6qBJFU1MesKY2skGImPR8imjNM4azi8IGgRJc9D8Fb2Hp5jtgQrGsZW?=
 =?us-ascii?Q?nxSZzajj4yu6KCO1vgPVuAwF95QaViRy0o5EOXsvr4ZxZTiRrIvSXT91aDbM?=
 =?us-ascii?Q?zh6IOZZ5j7/WKZFjp0caVuQm3DJmz226/a7BqpiXwEE6PaKeHwFpLdAdiu0r?=
 =?us-ascii?Q?zWLeFwftK/gSIdqbUeTL4ooheyfKXxvM0ZY1aumAxLrbYy04TRlocwI7V/Nf?=
 =?us-ascii?Q?6ZlasivKmUHdLdP7XqtWB8Mhn0hUz2PdAR/8XCYVd2bX8UX9IH7MrOdf5NPN?=
 =?us-ascii?Q?z6auQuVCNH0f9WMDCCcV42pwTeh50I5i2IX6UrR6YayqSOp+ncqICDsBYWOt?=
 =?us-ascii?Q?nQK3WCddcYufNlaPIviQhJQuYvFX6NzwPxbViD8STT9D9X7zjPstaiUW9GP5?=
 =?us-ascii?Q?wcr4oE3fTGxISaXZlEC0D7kOEthit45KBBMOobOtxVblE1NvVNbloNU5G6af?=
 =?us-ascii?Q?9m1u3npPlLrdJGG+9Y5ZPaE63ssmdyxEFRtD3YDO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d320346b-d1a5-4ecf-9613-08ddaccec7f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:27.7185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuCg1h+dwvGX0x5NEe/rHFLMKpMUTAtRldeWP7tZ3f1PgvLh5cxRRbJaKxGshHR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

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

