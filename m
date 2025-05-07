Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151428FABA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652281; cv=fail; b=SUXdo+MsJsA/2Zr/ULhMUhzPiZh+7+WWoe6i9QFvoPUpEK0HHh0mR4vrht04IYBHRrFihee2ibsUHNo/EJRyUIReuHKNpnYBy5XTtaEV6GMeS/+Ng/k1UYYU9k/Njud/+Hy+ZQO1QnKpFpXPELdTs72GZxt0/Zywb45RXEFl5vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652281; c=relaxed/simple;
	bh=PcyjqwWP4580JRgYXEGoKdyrIlA3ARXJF6pi2hIReME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QaqlHYkgQC0wJG/eN+LN/reJnFosfytAir7Tn39N68iWSC7xsN4jRQFcZHg9pFyH9teJvJQSv4QjkhtgN2McyzfLsWzzBc5ijN34MzUM57vv9Q/rmnoJcVoBhlvWsnLojJ1WISpCVIDEqpFtU3Z3Jui6ivHwZhooQjrulyYvQds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Brtpqoxt; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Brtpqoxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0QorKW9WK34aiS5iuyO593K5hSKnszFXaAj7JXZy9RO5NpDIQx2Tr+5svop1olCo8egIEO3057efBXZKE50CEGC7ZTczZyrX1m47JKBmL1o8nhqylAAuxxp9vlVhLYKkYXHfSc3Tj53d3ohk3SLqih6TcM8+U3CD+pn+9K1YHxxCiF1QCaJXYt8cxXeuGEzxbGk1HDfKdt0gpuDNgaS42XGLwhb2EXpNfK+TLgxMowBph7bq8MyasPIkBJ9NOTutLtx7wWHj+QnuvUKQyhltEB5Ah7yRENFCJh5zfudhEePzJtWx7SYg4D7j6KQ2W9ScgGkVbAHMupfRO+IUgSNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqSBdB+ndQIH/ScFGeGpnzkQXhF3T8QlfM6Qxz04vIQ=;
 b=azIsjTHaLE2dYVD9NufvXXJPYrgVyBEt0gN47gOMXAqZH3Y1zR3Aef8GwHdRvcmREiVhbFOO5DUyvpiHFva3VmttFoBQHVAEIwfvCk7YzFFWy9pYYNCBo8oQQ3ZZFnPkLUPqgvaLSakLYjDoHpRLM49tDBjYn+bGczeVAHtokvcavE8Y3TmQ+0304DWozgDnpq5Y3vt0LpMaJwghQwzBuxFidPAyLs4cxMGCkRW2Czw7D3GKFSCnJoAuVZK0dxfW8TR8Sc5g0pGouC80BFzmcLBtCj+KleumaMIaO9WRda75r218bTRTrWiGT4mhh+b6f4d5NCSNvMl/iMJutjbAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqSBdB+ndQIH/ScFGeGpnzkQXhF3T8QlfM6Qxz04vIQ=;
 b=BrtpqoxtoiOj5X5zxO3DDY3cd8UN/Xdx8eoKDTG1VEazL1DGxJjJf4bNU3D+2YgX5OH2udVIFXIOGp7p0vmACDt+Q9dUIXYp1jC4r2TyV19ogMxA5rb3Lv/AXy7DhX10c98oodNIeYN0x9OFEBcPmu/20zgklFK0OUx31hFC8aG546I9Tj0Qh1RKNRaQIfDBZMDHrz2pIP7db811SugrBXUeCAl3PYiqmV384ZF8i9hBwiWB7dccZRitb32VhiIFoISvXcUb2tdhUcIz5N6BUAkR0/1fcpSdq2Fho9SeLmGbmc6AK5Q/EQ6FnLjHJ90ODJTyd73FxJ5otH8QTrXMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:11:12 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 21:11:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v3 1/4] mm/page_isolation: make page isolation a standalone bit.
Date: Wed,  7 May 2025 17:10:56 -0400
Message-ID: <20250507211059.2211628-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507211059.2211628-1-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E0E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:f) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7a58a6-0c50-4efc-ffdf-08dd8dabb217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?47WSR0Rsh4HuTAW+cEbC+3m0v5p7Pw3ij2krDgNkKs8g6F+C6MLFEaPw+25G?=
 =?us-ascii?Q?EHzwIAR62b9GtYIDKyjuP6aqC4tX77d/uMdVvGS1XHbx62tBhgJ7m0LB6g+S?=
 =?us-ascii?Q?mEI69kbIATwzr1V/DgLBOlIp7p+4gKyv1ZcMI+rifYnT4xzoEHaUzC/p2fpj?=
 =?us-ascii?Q?WR4D+7w+jnnc8JXw5T+4V7JGobxQSIw8NbmoKqdhH29MS9LGWwmmzhg70g8O?=
 =?us-ascii?Q?73Qjo2gUjNGGmX1Sr8A37wN+Vo+Da7iYSxmMN9Nbs4d2Nn4WIZOGmkmZ6Rks?=
 =?us-ascii?Q?A+QxAdHiTXjeyvhZynHHJiO9G8UCtoNh+ix0pbrCX/XPpwPl39SalQQLVofC?=
 =?us-ascii?Q?EZ0FaqaAITQ5YYY/91t9U7iLrgnxlvz/p0Csel76TSM4d6CVfxAdiO9sSNsz?=
 =?us-ascii?Q?zbYflzwn35gJ+1ZBHKH/8K2aKMTVntGLuLskMDb918a0BuOnxEzjv9hyNyEW?=
 =?us-ascii?Q?bTAeref83iWyK/TNoCcPzG2H+WvNt/VsCRwiavcGIqt04R4ZHXUA4S7YAeOd?=
 =?us-ascii?Q?aZsPra+zVV/sRi7e1GdvWlG/lkdxrFuQ3WcsrlStcqjU8IdxW87nXKAo8qGA?=
 =?us-ascii?Q?GlI+GmfeUU3ZhLnfQVvAwNUrdq851bllagrLkvl4GNz5v8W6faS7uqe1mrT1?=
 =?us-ascii?Q?tFWd8t9Y2Jy+PAvwFfEnob7I0SoN7ZA+vEWcxaxq8lV+3yXJpnJECmSxHls2?=
 =?us-ascii?Q?xDZMu3/a0wohSjQ9Dx4AODcZZ+p4Wlw6RG9nTuRoT+khDMF55QY7ZIfYjgVw?=
 =?us-ascii?Q?kfL6/kJQc8XeIo1R95fqbzMC7NBYYEh+6YoHizbgIp6QwUqmiYZmVfBqvbq1?=
 =?us-ascii?Q?jb5A8MI6cwicmjrah24ZlvNcCKd5AAAA31aYJ5OLtiBb+MHlAphS3BaxeO9P?=
 =?us-ascii?Q?My44X6qO4QHm5Vskj6njj3C35p5cBhxXso2qjlrqxvx0qo/Pw+PWOFF7wQ5K?=
 =?us-ascii?Q?1Ln1/Hhs9aIOxyHiu9ctk0ks1Z00tPik7SLmrTZSgIfibL+qF2UIWFYhMRio?=
 =?us-ascii?Q?jZ8Nb/2lGoj4jNzTocTvPrX1rNhioV3z5b16RfYpeVk6TYR2zFkTezn9mvEc?=
 =?us-ascii?Q?YqaEqgQm72bv5/8jYQRPGmjAVE8I9yW0oUtRqxsnSijULnKeS4czSEUTkCWq?=
 =?us-ascii?Q?ZDy6W7ZHWwBi8jfgktHFKAlrFdnXq6iuRYEQXKSJGzZsKax5QwPZa1HCLafK?=
 =?us-ascii?Q?fk6g2YuvRm/h+kjNIS+gJP7S7eox0f1gNcRMStdnKjv3bklN0yHPZxtZRpt4?=
 =?us-ascii?Q?sAlpQIzWwta21aaB/xSmHNZ8FnU3QkLyxgojei7V7CXMh0hH+aHFgaHpp4Mb?=
 =?us-ascii?Q?1Rq0Zrf1FJPrki8zEjpDEGO1YgnfYO68IWKhgK0MNrmdcsDXyK2lKyl6aLnX?=
 =?us-ascii?Q?/aOhP/BsTLOzfDES2QKeoLaoO6vXkGDp9rWaSIyY3X2LUEstR0BTaFCnoiD/?=
 =?us-ascii?Q?AHKAXtzhPLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPIWziGMHdMeYCMMEHvR1zznzpNuQllh6j0LQCiFlrWeiROgnofz2cs4dWKN?=
 =?us-ascii?Q?giVvAA6wYEbkzXNEpc9ieOYiUGDYkMYEcxn3Y87tTEBS/X1nNPLmL0Bn1Byf?=
 =?us-ascii?Q?WQoomZVK6tgKhF5iF/qcZ4dJLbUMuXE+zATEGWtnP330Z7NBBehC226+5uBB?=
 =?us-ascii?Q?ezmP6pGCoMJaVouUN9p2SKRaFafJqst2BgZkkA5iAZl02iIYodhwo8KXg0l6?=
 =?us-ascii?Q?bdSq16p1czZuZLwHAmEqrwMwQslozWvk1Rf6BmNJhxAOPmY/oCmLJ1OBbLUQ?=
 =?us-ascii?Q?xyD27hK/g4DRVrfdToLigE44U3FCPzhCzA4XAyy4t6D/iPRLNvfM/UXL6U1Q?=
 =?us-ascii?Q?Y6idBC0waVCR1PD+uf0aADvk1lNQcoV5NAswdaPa+lpf1k7Xm85jBje6UIMa?=
 =?us-ascii?Q?WEHoEId/vNVZw+ykd67PEjj7Gq8Ow39qrYXi8kF2OV8HRAt6dFPHbadvhCfo?=
 =?us-ascii?Q?ZSYgIlu9rc18TbljZM/gRUAVvOSHIFvA4+sEB3GVQYrf/7+CWfLICgTI9gFm?=
 =?us-ascii?Q?YyutEmAnYRdfCl5Awu8GZPgI2BR7BT5cCTav760NV8A5I5FXEdqtmju7f6x+?=
 =?us-ascii?Q?V51/9p0lwZtw+j6ug5DtUVTyE9ViHT4i6TPSU5Kh8QSNld18KyQTRovgBlZV?=
 =?us-ascii?Q?7UajGkiwR7Yi3RM4VCq3grcySdZvi7znaZbl8mdvcn8YnNDNnjET5XRZvYEC?=
 =?us-ascii?Q?JOP937Rc0lsdGMaL81Es2AwyYOc/GHxA8xoH1oR1LbHotoS1u2cqUlE5ZrLg?=
 =?us-ascii?Q?JSNRwYiSnK84IHM3YW6OGEz3GySaSVAp6DTISHe511vf7H4XxvGgI9hsH0kw?=
 =?us-ascii?Q?YFJ41b4RS2QQuQN0uk6WhxwycaMfsF8NgtLwjVsc17Gl4tKX/uXEFTvwHaki?=
 =?us-ascii?Q?vpuR/69Fszb+xOjyMGJ75xcu2FeNg63CuHZsOo2ZXslhHX7wO+ypPmEMkN1V?=
 =?us-ascii?Q?JailB2/xcj4jjVkRS1fSx6+9y/4UL9/OufgUW+ITLOrHnPmtxWWXa9Jky09T?=
 =?us-ascii?Q?STfqx7UJg48OCefpBpPp3+hTfkDA0jgqYq3rKPGOxSRrWDQgz/R5BKWyYCeL?=
 =?us-ascii?Q?5dM/Td3QlN57Aqs8ouMbOXyg9+fZscFsyoUKCMO0rD3kacBzv76VCvDjCf8i?=
 =?us-ascii?Q?OyBqmCJZSOTJf2In49dPB+6NHkd+Ke5SWt904aLMQvbxq5mIS7Cyn/vT4YVi?=
 =?us-ascii?Q?9zvB1HLRL5iY779/iT63ghjYx5kkleOJUUkb1MtMgjwnADMKKNUAxKwyNl81?=
 =?us-ascii?Q?PqltWanEkd6RR8XIsNAra5QUhFV8hdvxhawDz+85LCDRciWYx+gMmzgtzdU4?=
 =?us-ascii?Q?sVKEwoq9CW3kuHsM5+KA19L+HPcTpbHqvUwWzVRbknxk9Wr5XxCvEb/4yS5L?=
 =?us-ascii?Q?5/2Gs4iOmRB6/hjlmbpcPNqYenIRzRcjlrxP84P+W5oBzpMSMYGnwzqMvgQe?=
 =?us-ascii?Q?nybSlDJd0Hc0tGn9yF/Mmxlv9OJfIVYBvAR4TigR9hMvQlKamLEWZYjYazzu?=
 =?us-ascii?Q?1tSsacmgQ3S3IZfpWorXdSe9HxuuoUYaT3UCh60HOvh+bFWbUEmrHb+ukV+B?=
 =?us-ascii?Q?JNR5/llZf5LJt3Om0k4ngfFeUDHG2MOj8pn6hQ6M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7a58a6-0c50-4efc-ffdf-08dd8dabb217
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:11:12.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byhiS2kImxSUAWfpP2mVLCPoho2ogMVTKrc9ISBcAIV0wjZe7L2lLtmp+X6xKW/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_migrate_skip, so that migratetype is not lost during pageblock
isolation. pageblock bits needs to be word aligned, so expand
the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h          | 17 ++++++++++----
 include/linux/page-isolation.h  |  2 +-
 include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
 mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++-
 4 files changed, 86 insertions(+), 7 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b19a98c20de8..9ec022a0b826 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -106,14 +106,23 @@ static inline bool migratetype_is_mergeable(int mt)
 
 extern int page_group_by_mobility_disabled;
 
-#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
+#ifdef CONFIG_MEMORY_ISOLATION
+#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
+#else
+#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
+#endif
 
+#ifdef CONFIG_MEMORY_ISOLATION
+unsigned long get_pageblock_migratetype(const struct page *page);
+#else
 #define get_pageblock_migratetype(page)					\
 	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
 
-#define folio_migratetype(folio)				\
-	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
-			MIGRATETYPE_MASK)
+#endif
+
+#define folio_migratetype(folio)					\
+	get_pageblock_migratetype(&folio->page)
+
 struct free_area {
 	struct list_head	free_list[MIGRATE_TYPES];
 	unsigned long		nr_free;
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..51797dc39cbc 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -5,7 +5,7 @@
 #ifdef CONFIG_MEMORY_ISOLATION
 static inline bool is_migrate_isolate_page(struct page *page)
 {
-	return get_pageblock_migratetype(page) == MIGRATE_ISOLATE;
+	return get_pageblock_isolate(page);
 }
 static inline bool is_migrate_isolate(int migratetype)
 {
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 0c4963339f0b..9fadae5892b2 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -20,7 +20,10 @@ enum pageblock_bits {
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
 	PB_migrate_skip,/* If set the block is skipped by compaction */
-
+#ifdef CONFIG_MEMORY_ISOLATION
+	PB_migrate_isolate = 7, /* If set the block is isolated */
+			/* set it to 7 to make pageblock bit word aligned */
+#endif
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
@@ -28,6 +31,10 @@ enum pageblock_bits {
 	NR_PAGEBLOCK_BITS
 };
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
+#endif
+
 #if defined(CONFIG_PAGE_BLOCK_ORDER)
 #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
 #else
@@ -105,4 +112,28 @@ static inline void set_pageblock_skip(struct page *page)
 }
 #endif /* CONFIG_COMPACTION */
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define get_pageblock_isolate(page) \
+	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
+			PB_migrate_isolate_bit)
+#define clear_pageblock_isolate(page) \
+	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
+			PB_migrate_isolate_bit)
+#define set_pageblock_isolate(page) \
+	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,	\
+			page_to_pfn(page),			\
+			PB_migrate_isolate_bit)
+#else
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
+#endif /* CONFIG_MEMORY_ISOLATION */
+
 #endif	/* PAGEBLOCK_FLAGS_H */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c77592b22256..acf68ef041d8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -381,12 +381,40 @@ unsigned long get_pfnblock_flags_mask(const struct page *page,
 	return (word >> bitidx) & mask;
 }
 
+#ifdef CONFIG_MEMORY_ISOLATION
+unsigned long get_pageblock_migratetype(const struct page *page)
+{
+	unsigned long flags;
+
+	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
+			MIGRATETYPE_MASK);
+	if (flags & PB_migrate_isolate_bit)
+		return MIGRATE_ISOLATE;
+
+	return flags;
+}
+
+static __always_inline int get_pfnblock_migratetype(const struct page *page,
+					unsigned long pfn)
+{
+	unsigned long flags;
+
+	flags = get_pfnblock_flags_mask(page, pfn,
+			MIGRATETYPE_MASK);
+	if (flags & PB_migrate_isolate_bit)
+		return MIGRATE_ISOLATE;
+
+	return flags;
+}
+#else
 static __always_inline int get_pfnblock_migratetype(const struct page *page,
 					unsigned long pfn)
 {
 	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
 }
 
+#endif
+
 /**
  * set_pfnblock_flags_mask - Set the requested group of flags for a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
@@ -402,8 +430,14 @@ void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
 	unsigned long bitidx, word_bitidx;
 	unsigned long word;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
+	/* extra one for MIGRATE_ISOLATE */
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
+#else
 	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
 	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+#endif
 
 	bitmap = get_pageblock_bitmap(page, pfn);
 	bitidx = pfn_to_bitidx(page, pfn);
@@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
-	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE)
+		set_pageblock_isolate(page);
+	else
+#endif
+		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
 				page_to_pfn(page), MIGRATETYPE_MASK);
 }
 
-- 
2.47.2

