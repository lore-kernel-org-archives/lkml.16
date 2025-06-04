Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30D111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071679; cv=fail; b=Rex3AsPCCoHp32tx0FIRvngnTJxcAU4bBv1pgH6sIRciymE27uv93pWtvdtzg73O0kfsYJ0L0uWTMRA+zAaSfK/bgHJloItE6SpJR3UEzWuEKJHgr8rG16ppYrUyfKGwzZLb1VAfxK9Tc3q09vaq+XpeJ8xm5LJ5MnTSPHmXsOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071679; c=relaxed/simple;
	bh=Z6vRVoTEFxw//we5ENqzsHdyrBlcfh+QXHjJm5I0iRI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZkfoopspwMc3RQcEmCuXi6P+s37ZlkklSjsXnQH5W9yWwUfQ0fjX3NQY8k2R083tpIwWswH7YMMN0afUbWeRdRyQCIhTb6P2mJ+JLg2OT7zWRdrsjh5b/50FQx5va0rayfWOc3x2mmJ4SrcLPGinYqy0X9G8kCnfO3b3FbEl6Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hahm4H2S; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hahm4H2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt08qRudeGd/KvhxjPGnUS8nfKQU8PMUdzglnjQgzRmisUfAN4Q/+N7Og/zciuGNxzhmc486UWJuT4KAy+cPJHYl2kj9Qg22pzCUTiUA68kjoHAQi13aXYEcSTrb/7pNnpPvM7j6aF4f2ZBlk9N1Q5IUfuiPCB7lya0xos+p31qeqUdSUW0hQvCigmTefD5AQkaa2XA4EggK4D9GsjIJLIQJe5Tw5tAtu++FjTPNK2n0O+DBdxS7Fv3oqruW/dU4lHCvhdxhzqyxM/GHXOZTHpIz8+s5krn3StrE3KIYTMZneXC9x8iV6SgW/uMzz4XT5G9xg+jv9M9lkk0TR7pcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ftda8YoFNbQgU+/g34TsFysXCcABjB6iTs2PiWe/Wuk=;
 b=yf8uJoSjhNzkTdB3s6WqgKoAwiNKz6uUi5bno/wqnuDxbBOXL5WP87jTUjTaPrhPphLEUvCL/B44cwYlDqFIJom/IzcUsfZf5jIEEtL8nYxRB0KLKsLEpafytsDucZ01jFHo8fPqGBszKxAmtXhXAL1dU5Co/X7tcOy1ZUmjM9/abIZSx78fZM5AvtIQG1K3M/ihm13Ix1HSj3v4MddaWoRS2kocBlRiG8puZfqOx3+vHD9Os2MHrkxLEdspC6nBwScBP8/U4j2GXezyUBQ1okDVjJg+kMNH/D4dHN6S41tsJpVt+BUZ9lec9nJd83Xd23tjLPj6GOS5mBrAEgLTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ftda8YoFNbQgU+/g34TsFysXCcABjB6iTs2PiWe/Wuk=;
 b=Hahm4H2SncwebcGGgBKfAQoKZzvd4gQ+vvhBPAo13BWDsLbRvif4+YcYfGUdhz+1ZHzV19kdqn2VNOeHPvGNDbt005x97DQ39Vq/sgHaem60xIPHmWhN9d8NRIqy+IRauJr7i0iZs8eUpFw2hJzxM/7CRKWyKamYLrWo0CWhkoXLWuxbugNbSvB/kktt3Ni6IL2/SqjaZe5rZdWCM74aNswrG9+rlDT0tLd5difAsPSaYmAmxfEy3WORC3jfRNcdNj1qjR4Yut+OtUtsngMxprdP0EcOJwb1tO09RAmjspjhUhNaILqDIpCFW6Nv0BFAci/aI57OqpV4k7zOO9mFvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Wed, 4 Jun 2025 21:14:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 21:14:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: david@redhat.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	isaacmanjarres@google.com,
	jyescas@google.com,
	kaleshsingh@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	masahiroy@kernel.org,
	mhocko@suse.com,
	minchan@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	tjmercier@google.com,
	vbabka@suse.cz,
	ziy@nvidia.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2] mm: rename CONFIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_MAX_ORDER.
Date: Wed,  4 Jun 2025 17:14:27 -0400
Message-ID: <20250604211427.1590859-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: e2933f5c-bc65-49ad-2445-08dda3accd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJNMRZfhPdXdQiLOFK4oVJoq2ty1IepNWo6loCKGbUkIMYqyNmqsI9bsQQCd?=
 =?us-ascii?Q?QDN9pVKgWJo8xWzKVoyJcEfzHRhQdQGK3HqvRLI/PwEu7HGUT0fKryb8WcKw?=
 =?us-ascii?Q?qCqzx72EePZbBXanfAqPRYDGsgfym+YPb4gRBRqnRk4qtHzBfRilKJI1Kfm6?=
 =?us-ascii?Q?DoRF7jrKxQqxPwab1/AWx6XfFhxFsgLR+e8NhMx8qNLTBCnhLjjY3wC146XT?=
 =?us-ascii?Q?NChrC2+TRVc45bagOAET6jHxTvLy41pC6C5gq7S3AULDcHzhFFehvceLWSMg?=
 =?us-ascii?Q?VwHfsiayGtaEYp9Rl4f7w5EpO3IWoPfXbGM/VqsS+eW7IOVYrrzTCPZFk2KR?=
 =?us-ascii?Q?3QzDXlUDBCAHaWDfc8aBR4Yvk1qjjywGvaxGECCJTZ00DR7lOAIHEwaJvmNa?=
 =?us-ascii?Q?qjnH+UBzEIub+CACqsd7nMrIzhvgSfXdaXxYjjgXKmj0OXQTFE/9my33yvuH?=
 =?us-ascii?Q?0jemM0h1ztdNjIrr5iXRAHRZDdbweWMBRIVd8X77XHzUzch5UfUhTjwC+MLO?=
 =?us-ascii?Q?9g+d10B0hZzAl9Je7m23Cfz0xOMTGKt0xY5FNKbvFEGpbOnyEUDXxvzq4+wV?=
 =?us-ascii?Q?Y3cQZ5r3MgczmxTX0s87hJkz2MPSt0vr7Cm8lf37LbaUt2sMDDQTCfm5Gc/T?=
 =?us-ascii?Q?IDEag6+uTSmNy9diyhTJVtMO/uNEpq9iVPDXzlNoIVngMgHcyVrnrOSM9/Oj?=
 =?us-ascii?Q?s81Nz1xAWDBzwu32JbVUO/Fcs5SfpM2cby6+HSJVGQPIifvn7p7ZVkbQw/wo?=
 =?us-ascii?Q?2Ze5Z/XrFyu+8nHZdZjUUapx4eZzWq1YJ5P6soj2B9Sj0AIWI1vK8UNFYx4R?=
 =?us-ascii?Q?X+1rUkwP5QtWcra7x88JtqKiTEMB4f07EUWdbo/MV7YHY02oM/WLljihdY1f?=
 =?us-ascii?Q?Ki3Idh0zUZyPpc3LMlufrSPdt/+m9kPXbaBlO/IVCWR75djjgNOzkdDVdffp?=
 =?us-ascii?Q?2ZFgoTc0VAWrFtZHEeQXbCG63Yqo74YVNk+PJha4g3pVIQXjrQtbaqo81en8?=
 =?us-ascii?Q?EqbJhWfd6a7ynYrQJt5sLDE+Esp6jyq+VwEvwM0AEOv85uZ6dcv5zyAtLtQK?=
 =?us-ascii?Q?16Q2LDDCxQdWSEKVEkzRjfJIjFe/IE17dBVqsvYE5gOvNxTa/M2v7557paF5?=
 =?us-ascii?Q?Gqoq4zNJdpFYnHk00/sWZNjZ+gOWBOd21L/hkJoTq2/WXVwxmV3bkXMAEfun?=
 =?us-ascii?Q?kxC9v4J6cgopmF4KVKnRMoHWLe8cIiA8nffGoQYH6jxjbs+XKaRVFaIsb+Wq?=
 =?us-ascii?Q?xUhyL2UdezZTNxPdt286lD8ocOUY5e4sQUlbXIYELkh+6IljpujiYH1aQ0HI?=
 =?us-ascii?Q?bZ2mB+r3PGb6IxLluzMDl4tNQBkTAy+IWvZ3aaqO/rVEdw2IvdI3hS2cbubV?=
 =?us-ascii?Q?dLmkLnmkBY5TQ78y56mdN0Et0PiXNPr9T9yyckmgjyf+yHGAn5Vsch58m713?=
 =?us-ascii?Q?88swW4BlS6IWzaDNUTHH750T5vi84hKK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W7vLUwmgKvYCjznD4qgVyogIfhS5H8hjp0L7h+8+QtmwyEzvXCJPil034ug6?=
 =?us-ascii?Q?QNTqiKHvHcYu1QEdy2Ap+6i04o8GwztgitABWsmdkefUPWoaoHNEXn+xMjOB?=
 =?us-ascii?Q?/Djo5J99TQ4SAhxA+EmQqe4nBQwhWr1Xm4bCHXIK4MCWRTHcyyBuIEj00jam?=
 =?us-ascii?Q?Dlb3CmRlCRG/cnHiEvR5ID7CQfiXKyAQ6ALCPxA9jsVEZuSssFPihQxuLlns?=
 =?us-ascii?Q?m/AkHiKEkrX+QxEiYr+99isIFyrEx4MfbB/dyUfjlgTLURAerLIXXH9c1bb/?=
 =?us-ascii?Q?Xjdt7Ap2WD8L38fxs2Rk8Q0oVUlg/GNzSc53m98ozOvhurTrsHNAmpGyr5fy?=
 =?us-ascii?Q?ml67TQdQ1C6748Sz+/NVXc3H0yDANjY+/BCGhTYbPh1ONL6mKfUJhPU2dfNL?=
 =?us-ascii?Q?6W68FDge7/QdrRytxvLKHTexTxkGgvZ40hDj2SeKEDm4B3kOTciRIntL2HdZ?=
 =?us-ascii?Q?KxH8B8KJqFMzL1j3Ke7kJOPWbuD1eHoEbhzSuxFM39NKaJ5eL5aqp0QDuJQi?=
 =?us-ascii?Q?OLzjdWkIRFG5cf5gaj1ci+Z2x6rvnTnsWjASoyoBR3ygXBe/9fB15xrGrtwf?=
 =?us-ascii?Q?YNIBbMTZAdaew/WSZELVeTJUtQLZDEBhm76qUqmlAKsIW0w8NcVr/i5JO5ZV?=
 =?us-ascii?Q?rwrMIsKeZi+ZsPdh9J9yNsEXOkmtWhQ1rAk/RdMYHDeHsf0aYTHCVytYLNbI?=
 =?us-ascii?Q?KKmZobr+scdjaQFuRwDuTCcd/E17w2YFdHJVtF/cWfOWIFadml+CO0n81CBl?=
 =?us-ascii?Q?45LCfIZ75tANsEUCCMqWO4aXuI3nqcrkdPA7E8YWb4cxhohKMDQSNfWrlRiu?=
 =?us-ascii?Q?3bdxC73yHDKZ6CUMAGNxvYHf1QKJAvjdzW3V0KDloE2OmKd3L6fW9NdDRHeo?=
 =?us-ascii?Q?IRCZTQiEXZvTap5q9Q3J32CrQfO5AfWyjs2kieqNFNAWtcYBzQfr1xTrfXXe?=
 =?us-ascii?Q?22OI8dZA5BW6SjqsFPJfeJ9g8f1Ds4epd4pV2hkc9MyCCsvmfFSWcABj/o8N?=
 =?us-ascii?Q?EbexCFWpnC76PvYLT45PxOsVC+5mzwkTlba0NfwO0HTeLkVHvSI0Ogr4KSZE?=
 =?us-ascii?Q?FqAENN8iC4brC5BJCGVaE/fodXpE3LSCjr0mKYM5LuGGR+GzvrORsa+yMAri?=
 =?us-ascii?Q?aCuvEcNCuuDokqcVmmCBnnxK6tO9QbP42TVpyvUZpTb8srR5+Y89ppzxXAn1?=
 =?us-ascii?Q?YCdE/lRIA4yFBCj1wrgoyHPjQZLkML/CO8pywe7Bnv4RhCaFRMmoJuERzLID?=
 =?us-ascii?Q?kd/7V0TJWqwqURG7EKqcNUWmvtVb/1QwyzAxWvynXWtdpy1/oaQ7BaU9UHap?=
 =?us-ascii?Q?nX64lrG8senFas4fujowENLmIyarmKnvvkTCQaC4tGWMqsBeHI4kIO1JAJhY?=
 =?us-ascii?Q?jLk323SLoi0gSAfEX7KN1nxO6Hoow5j65l+9hGYlfEjMTaCQ2OQWoiuVAdfD?=
 =?us-ascii?Q?7qJZ6tskCSNTtVsynUNbM2yL+B805g6tb0fWzYriMmwZSCVTzjNQwhKsBPH2?=
 =?us-ascii?Q?NvdIXSApxstCWC2ojHqMduI2r0KdbCSc8nqf1hHMan6Cs3PkGaKR3cXC4AKo?=
 =?us-ascii?Q?LeiA5NuDfOro95RNpjLwy2dC/st99596yc85weOG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2933f5c-bc65-49ad-2445-08dda3accd5a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 21:14:33.2899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXBZ4u0QtX/FHzPBJrJdjM6d2IBkKugApvL0Bfmpo3wIDJcPftJMTRkHP1lbaWCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599

The config is in fact an additional upper limit of pageblock_order, so
rename it to avoid confusion.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Juan Yescas <jyescas@google.com>
---
From v1[1]:
1. used a new name: PAGE_BLOCK_MAX_ORDER,
2. added the missing PAGE_BLOCK_ORDER rename in mm/mm_init.c[2]
3. dropped the Fixes tag.

[1] https://lore.kernel.org/linux-mm/20250603154843.1565239-1-ziy@nvidia.com/
[2] https://lore.kernel.org/linux-mm/202506042058.XgvABCE0-lkp@intel.com/

 include/linux/mmzone.h          | 14 +++++++-------
 include/linux/pageblock-flags.h |  8 ++++----
 mm/Kconfig                      | 15 ++++++++-------
 mm/mm_init.c                    |  2 +-
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 283913d42d7b..5bec8b1d0e66 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -38,19 +38,19 @@
 #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
 
 /* Defines the order for the number of pages that have a migrate type. */
-#ifndef CONFIG_PAGE_BLOCK_ORDER
-#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#ifndef CONFIG_PAGE_BLOCK_MAX_ORDER
+#define PAGE_BLOCK_MAX_ORDER MAX_PAGE_ORDER
 #else
-#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
-#endif /* CONFIG_PAGE_BLOCK_ORDER */
+#define PAGE_BLOCK_MAX_ORDER CONFIG_PAGE_BLOCK_MAX_ORDER
+#endif /* CONFIG_PAGE_BLOCK_MAX_ORDER */
 
 /*
  * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
- * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
+ * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_MAX_ORDER,
  * which defines the order for the number of pages that can have a migrate type
  */
-#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
-#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
+#if (PAGE_BLOCK_MAX_ORDER > MAX_PAGE_ORDER)
+#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_MAX_ORDER
 #endif
 
 /*
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index e73a4292ef02..6297c6343c55 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
  * Huge pages are a constant size, but don't exceed the maximum allocation
  * granularity.
  */
-#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_MAX_ORDER)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
 #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
 
-#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
-#define pageblock_order		PAGE_BLOCK_ORDER
+/* If huge pages are not used, group by PAGE_BLOCK_MAX_ORDER */
+#define pageblock_order		PAGE_BLOCK_MAX_ORDER
 
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 65089552e124..3afac26d3594 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1017,8 +1017,8 @@ config ARCH_FORCE_MAX_ORDER
 # the default page block order is MAX_PAGE_ORDER (10) as per
 # include/linux/mmzone.h.
 #
-config PAGE_BLOCK_ORDER
-	int "Page Block Order"
+config PAGE_BLOCK_MAX_ORDER
+	int "Page Block Order Upper Limit"
 	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
 	default 10 if ARCH_FORCE_MAX_ORDER = 0
 	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
@@ -1026,12 +1026,13 @@ config PAGE_BLOCK_ORDER
 	help
 	  The page block order refers to the power of two number of pages that
 	  are physically contiguous and can have a migrate type associated to
-	  them. The maximum size of the page block order is limited by
-	  ARCH_FORCE_MAX_ORDER.
+	  them. The maximum size of the page block order is at least limited by
+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER.
 
-	  This config allows overriding the default page block order when the
-	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
-	  or MAX_PAGE_ORDER.
+	  This config adds a new upper limit of default page block
+	  order when the page block order is required to be smaller than
+	  ARCH_FORCE_MAX_ORDER/MAX_PAGE_ORDER or other limits
+	  (see include/linux/pageblock-flags.h for details).
 
 	  Reducing pageblock order can negatively impact THP generation
 	  success rate. If your workloads use THP heavily, please use this
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f2944748f526..02f41e2bdf60 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1509,7 +1509,7 @@ static inline void setup_usemap(struct zone *zone) {}
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
 {
-	unsigned int order = PAGE_BLOCK_ORDER;
+	unsigned int order = PAGE_BLOCK_MAX_ORDER;
 
 	/* Check that pageblock_nr_pages has not already been setup */
 	if (pageblock_order)
-- 
2.47.2

