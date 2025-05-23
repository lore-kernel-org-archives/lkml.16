Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2129B8DA
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027605; cv=fail; b=DPXR2RmYNEr4YVWKAbeCYIkohyjsZQxmuhz4Qt5f4/TFNWETZqNylddVGYfaXeqPbQDEZbq2QBxhEwJ/vnNuJAQst6NnrSkxLug1kKLfLrcuzQi7e53eQE5zMQdnu/4PTJhSJdgoQ5sTaWynDOHP1eLPK7vJIxpmthY5noS0sY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027605; c=relaxed/simple;
	bh=pdgIhT0lY9uxl9vKUMQPK64fBZNL5RtVup3exWNBRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZTPjN/kWEV/TukUMYCeL49b8ZK/f7PJ2GKHhiLagEhxaHHdWq5cOOpoljrWracwcKvDaihMzrYA0244ZHl9d7ondAo3qioh3cwt/Pb2ycKqvB5aeeNe0Dfvg5LTpKcOOtIQ43JRJN7RUgID914Q2FojMFfBevBSXm6mWRRXITBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cVBm7SZ8; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cVBm7SZ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8rzANGDg1iRacT+dnbVsAkCtewVtKheThcClVOkI8ULNXvIxCGx5qunN0Hon613kJBiqpowpVTFoJmz4+UtIoa36Ef8mGeKVRkvrBAlv5qovs+Q9vAw8Z4yktgxyyCcnXa+Ye2MGK+wJL/aIwsYJygIwqLuZ6SA7He4sYTL0UK02eXpzzcZxOGPiDLgEkIjqeW1UHy8daukWUeoXgHqJtUYySQ959PuoPkKkhhJl4RlCAA+VggSw9mWuNgZwD9dUk16HKD2ZskNY9HetR59Xjj1cOCxmSHwHsK4MzFmYL6QeVGlA9B/xZU23Whkw56eZdcXHwmjzhjY+PaE26RVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E594aYiquQwC5VWHr8AS7at5/I01hy0lXAtazGW4ZUo=;
 b=KXE+1/EECokTMVSCONk+WGScZISCi6xC06FFuqxqKgleGF6ZltT0xYL2PAAJAViPW+GCN3tydhn+y2Lc3/a83kgXyU6YF/4VTVMYmyEt5IvcgzTCvj9A6UWrOU3pIIcM1Sknvx2wYPpvkXqc4dQqrh5US8Kptnw5xwl+kBktIQqz+i4/Q97G7yfg8+w/zsn7PbXlcVWzaL1ToEXKJZrKcqlVkutwVQOV/IxIZys5AkutXc0mtmKbBmZftPsjDhErCCXmCOHzCkouon5vxJdQ910Pqnf2f/AEirYGuW6Bw6IlzNC/j9pAHNCMChMwG+OoGTbg0MM27ZO2bblC6rMM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E594aYiquQwC5VWHr8AS7at5/I01hy0lXAtazGW4ZUo=;
 b=cVBm7SZ8Eis6AjynGI6vl4PLp0P/ehimJdZidfwMbBUUrclqurQQTpV6TY3QcGHSE66b4mYS+nThZ5Co8sw34gzqceeP9fhSucs08bminM0A34UDWddsOY3G1JzlRrAEGbkH6u9b5myNSN6kbrhwzcIwJhycKsDMWXt1BGqEnT6NieHQ7cAmy9I6t7l1T9b/L4YLGYi/0D2I6t9AEaGtqzhaEMWw+5ecgw03fcQ81izpTQG2B4EYQgLef2lQqntO1uWT9gdacPELrFXqzlJeQxOO0LExI0Rf2IEGuJkixwVQ5/hZKAWpUsJJndlSjfFn8bM8RntLaUm0UDOiXa6ZyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:17 +0000
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
Subject: [PATCH v5 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Fri, 23 May 2025 15:12:54 -0400
Message-ID: <20250523191258.339826-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:256::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: d69cb1b1-3f25-473a-fbaf-08dd9a2ddfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZbpwLdEoCMAFwpne26/+s6F74gBaiEZkY4h7qZZlJ15D8Dv5f9oEQRnlFZh?=
 =?us-ascii?Q?YhcCBsBp9QvvbyHqyLeP/l68ou2IUrPXKikahjrZaAr6Xqshvsca5SXVmLB/?=
 =?us-ascii?Q?CXqaCSSJZhXpS+WUgNd8xT+FPd5KzFWgUAdOWgMQlaGvyYreqsnKJ52Zqwbx?=
 =?us-ascii?Q?xA+oeMgkGN/vubfcrqDWi+Jcl65os7bd6mmxyd1UFuBbsl0ZbSSYfokIv8tX?=
 =?us-ascii?Q?DVnGC1ISIy6ZUeJ4TimKrK8vM/spyWMKwTbgsi6/7H69iKTk8v7YxMYKO0aC?=
 =?us-ascii?Q?YkNwQqDiTrfm3aEOOA24TY7dsHaiQkwB732JxyQYzhgRlGTKd07hUUV6dvz0?=
 =?us-ascii?Q?wefdRPKHjEK4Tsj/UswF7Zw1J3kcgRRyN7bQcN+Welmhkzt/Ir5mX4DnsPct?=
 =?us-ascii?Q?LTw4eYz+ord9v1eDkUaTPrsVMIA8gj0LurqF1dG7WEfSNqwZSzjOawlMA6WZ?=
 =?us-ascii?Q?XKDFLxIke+73mXRBmk0KPtP3rH67y7IJrrtQjFrVLXJ39ADkt0EZNCsnGncu?=
 =?us-ascii?Q?QLqjddFMpZBUInzj+74czdjbW0V+Sct8UTOQnO9Rb5+Fg5EVgqM0z15hplIH?=
 =?us-ascii?Q?SQ2iPxaQ/S3d85Dmlz3DwVHKYYx8KYRaZrPDmqOyXPANM5aSgEo34eeebq/o?=
 =?us-ascii?Q?i8RgtuJmBgrZUaEEBhGZj2mey4aasa7GhHlzDe/UabI7vIKzssRhluAu5R1R?=
 =?us-ascii?Q?4/DcMyLFDQaicQAZ201NqB32GCOWijGd9mLE8x4V+BXn+OxidOW002qtQTjv?=
 =?us-ascii?Q?2hxTeVXEJkbAD3IRNSqGi3rkUj78u8EiRJ911FvddrISvhSgzWa++ibbtGF2?=
 =?us-ascii?Q?VHttynHNL8qeGuc3+ufUP+vZApxDfXO2MZQl5oJOv6TXvajFO0iRgHDgMijU?=
 =?us-ascii?Q?X/U7gHgMrlmHb08X3GPtIrWe6KMSaXikgB6q3jMoqIviO4O3LDdjNVSCFwhs?=
 =?us-ascii?Q?nI5Sp1hV0KWSR6XNaaYAxIC/mPZYQx3c26ST64PhoUL1JjnIDzpoz/euaz8p?=
 =?us-ascii?Q?+h3D2lU4dGoTfshFtZaZ5aUS7RJnXLAIjXRxM68OrW7llMNZti9N/6NGBuF7?=
 =?us-ascii?Q?6r5Y0NfV22W8UH0xHvlO2Wp8WRYLGfCaWjk0buvzob+udlFce+CjD9Qvu1qE?=
 =?us-ascii?Q?zEnpnEAjU7uj29eLXSoVgo2LVB9jANCewPp1PMIsTgrDssyAjJuago0eUQfd?=
 =?us-ascii?Q?oh+/jbfWrMu5o5ruoyAGFeQ+pl+W3A9lynTp3DYk3hCMG3Ba7GxR3sW+HOqn?=
 =?us-ascii?Q?sbiwRMxTVGnDRVT8IzYLpTzUgeBU812A0V074wpcjRxMkaMPk9KH6Dwlu3m3?=
 =?us-ascii?Q?TlW1zQwxrC2trAY+URH1lzF0S9biC8IgaOMVGxx7bQIsrl8iU3dsntv0x/M5?=
 =?us-ascii?Q?xCxvf0YjftQnOor2BsQ08/+WUXw9e0Wai0zfv8K3naHziTVEs4DZ7o8zxp1Y?=
 =?us-ascii?Q?wRzvZqz4O60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?egnSgJlrOHvYp51b/uMXBnR+nZ5tkxt2lD4HYGpwXYoGLZIzq00OdxWm1e4M?=
 =?us-ascii?Q?DJcmth9FOezOlavi3beuuR43I76hwaRR1TqsX3I94haXEMAA+rfjpE5IKfS7?=
 =?us-ascii?Q?iyyJB+nbQ1XNvzTCCi43p5xr/+Z59glwrpAZixiNJvYbmDOmiIw5lIjfvP/J?=
 =?us-ascii?Q?gVwRsMaTycj1RuJiC1TZuhvOTyrPXuCuxmTBEE0zoWuXjtpRDkkCTs3q7ou/?=
 =?us-ascii?Q?2qVTGaW3zTM1/8x20YPVIWGIZVmEekm+7yUYTJcF3AjKIyOSHkwP88WNmpeD?=
 =?us-ascii?Q?jq1iC9h610SxLK704xgN1nm7O9xhldcw5MxTzvHreleli//Lm7WAn9PBmOCZ?=
 =?us-ascii?Q?kbnQsSUj98mGk5wopic+6jDpWtPERfMfickLZFh4PFErIU0mwcInC+lS3Z8Z?=
 =?us-ascii?Q?5qv8Okhog8Y6bnWuQUxno/VM7g8bvQwVnOEamgHd0DO9Z8pzxBMmoKEBAYU6?=
 =?us-ascii?Q?fr351UUDGqyzqfgZY+Sxwi/pI4MTzxsZ8tA42G/YMv2CRBE+TIUZPBM1VkxD?=
 =?us-ascii?Q?yNTsbL/vXiwqwfddPNepgDOSORD4oOUPQnd+1goq0sHgLrELBBRKCG+v/26l?=
 =?us-ascii?Q?Ril3XYSAE75FYPUXBVLHIX+CSMLlRlOHxNt3RzDDOonxLARAZ1HgLGGNqBLe?=
 =?us-ascii?Q?QjEKACYf+tSMJ/MFRLfp9JKjqpL6IDyee9C0414CXpjXOMAK1vmNKlPfMGr/?=
 =?us-ascii?Q?BpB7LF0vXveZWLj7utqQsgihcQIa+POKU1d+QS4k9M+3ydna6LrphHId+ifH?=
 =?us-ascii?Q?EphgtdvxChBOFRjUXrQVTu/NFgjj4HEgbQc4wLaE+S5I6oqqLhqgFZrOUDGD?=
 =?us-ascii?Q?bP7y1W26iTnYnYPxBIx9WXXenGn2Y9klu764JBKmW5dgoroMUDD2SHr9WDTb?=
 =?us-ascii?Q?rM8aNv3521Tn8eo/Yi7PclGoXR/qCTXqHsWuSi9ICmWWdUfZZPiUPuaPl4sl?=
 =?us-ascii?Q?uuS9GUqbxwKUTXvB+bRHVPqdWn5FezJ6Zcv/K/YAz1lvzzL0tDc/Qibamnqi?=
 =?us-ascii?Q?XpGL8XoGkUkuNVjIEg7V4Eakm0FT/rNnv6L1eAP4gZQVEgrIU9YdPyCHrOf9?=
 =?us-ascii?Q?3a9rNjk/wspzaF1XX9m56wOd3sWxB9PPO6+KafWh6ILxmopqHk1XGHcyVXrR?=
 =?us-ascii?Q?yNe6BZcEguQ4WqS9aAHHrTIgC/bC7bu7iQEnSFj3M03rhqUL0A/+9BLUcX2L?=
 =?us-ascii?Q?kpNgGWLAJWnD25GyJPUA52G2UWHK6Y0eqzeSldYg6lDCvJ4p4MHLD05H/EYH?=
 =?us-ascii?Q?dL54qy34W+wUPR/VYA+sWp1vkUkWyvIpE3nuuUNJuDq/psDjyyjS6W2bEjyF?=
 =?us-ascii?Q?XL7jbxiqR93fc7Ew5oREHkg1Hq/Xp8Fic7iOK9b0iIdT0LWa8RU03GVibqiw?=
 =?us-ascii?Q?F0GDxyApLW1by7voE4A4u7LJ05Kb/E7O7hQw1pZgiZDjt0j8F7WQLNXkPI+B?=
 =?us-ascii?Q?hN1F0zTyomuY22edO+p85NOcrUjTIcU/piGD2siN6s2zGNSyjjMaXkpu0ptG?=
 =?us-ascii?Q?idISqUEi9ZKhVUr0wHclv1s0qYWjhX1ncnfXQovG2WVJgPQOaHANvBjFh7LS?=
 =?us-ascii?Q?cvkeky3UILK4xyuPBX3HYUSOU+gPpPuVJhY+VuEi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69cb1b1-3f25-473a-fbaf-08dd9a2ddfaa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:17.4362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y04CTDLMS1fkieUcWyV2fvqIxIfcnFgbUq8eZ8B+/F4pW3qz+Zh6f/7ifwbt9wou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_migrate_skip, so that migratetype is not lost during pageblock
isolation.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-isolation.h  | 16 ++++++++++++++++
 include/linux/pageblock-flags.h | 13 ++++++++++++-
 mm/page_alloc.c                 | 33 +++++++++++++++++++++++++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)

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
index 3acbb271a29a..f2f8540b95ca 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -20,7 +20,13 @@ enum pageblock_bits {
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
 	PB_migrate_skip,/* If set the block is skipped by compaction */
-
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
@@ -32,6 +38,11 @@ enum pageblock_bits {
 
 #define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define MIGRATETYPE_AND_ISO_MASK \
+	(((1UL << (PB_migrate_end + 1)) - 1) | BIT(PB_migrate_isolate))
+#endif
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0207164fcaf6..b2c623699461 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -360,8 +360,14 @@ get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
 	unsigned long *bitmap;
 	unsigned long word_bitidx;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
+	/* extra one for MIGRATE_ISOLATE */
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
+#else
 	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
 	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+#endif
 	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
 
 	bitmap = get_pageblock_bitmap(page, pfn);
@@ -435,7 +441,20 @@ bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
 __always_inline enum migratetype
 get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
 {
-	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long mask = MIGRATETYPE_MASK;
+	unsigned long flags;
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	mask = MIGRATETYPE_AND_ISO_MASK;
+#endif
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
@@ -513,12 +532,22 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
 __always_inline void set_pageblock_migratetype(struct page *page,
 					       enum migratetype migratetype)
 {
+	unsigned long mask = MIGRATETYPE_MASK;
+
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		return;
+	}
+	/* change mask to clear PB_migrate_isolate if it is set */
+	mask = MIGRATETYPE_AND_ISO_MASK;
+#endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
-				  (unsigned long)migratetype, MIGRATETYPE_MASK);
+				  (unsigned long)migratetype, mask);
 }
 
 #ifdef CONFIG_DEBUG_VM
-- 
2.47.2

