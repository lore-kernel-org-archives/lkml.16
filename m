Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCD122FDE8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877502; cv=fail; b=kFu43UCkrlclNfs2N0jiK02TDQNI0l1Afuu3vMfN/JaelrbMBB57Pc9lvOcI4EWZUnwhhuW1Rgsegql+hCkDh/+CLfLVvYq4NpHyZjSCrRI/tUbNA76jzjuMTPlh20j47plHW6JpPKe4RF8zJaCfsECSxXjqapQaUuA3j4feFiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877502; c=relaxed/simple;
	bh=CTAG4sYZwfXNpQc1Ac1m55h4u4WrybEEqbXezJHBoFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iQdhc9OnUy31bjfND4RT+nAEtWk5PI98R6SPtEafoYRfewzp6Bvi15cH9tT4DDSAC/yWRYaFVTI091KDvu5upOSQHWZmPImEE7r3EgCVseM5PGqsyL4civRFdAQTgk9Pz4rAZSmKSqivRs7EUyNgO15N1FukBEPkQWfMokmnEk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxRNnsOf; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxRNnsOf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZl6R6MzuvrqsZfGA0mQLrNUZ5iy8hUvu8mCA9irhUqLSR20j+1IR2E0FQISJuSUZ//Ot1axNAwOkJ876Y/UQ2ORjfrj2MESvb9fmuwW0yHzdONVss3IrhwNkL/LZFRIuRNwUNsrcDR00PLm9iT/RsvbO4QnRxkSUAXEsMyjKrb/EvmydeFSfFNf7UD/4S3HAEZjEe4YyHyohAY8fMD+AI7NbaeRisJEGlzeL8gK1WmzbiMBSWKRuClyCxR9GWURs9i9LKt/JHJfwiKyTpMUMMz8yTOARigRzPr4Q/I98xYQC3ifUNr897KdDE5lh7VslB6XM/A0nkYVxQzso8qPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwi20KomilEllyctI1+J40cz0JDU1TIzlORODcSer18=;
 b=xUvOTJcGp6eSga3oQOLQDRIybN65u/ECckhkzJTElIKYCzWMJgWQnpJtkH0YHPp9gfDL1KukAXV2zS4jXtBt6KNSl2zo6ILLpZKCTGTqOCnE+ylKsoIRFcmsQrt0COFMvytbKUo3HatQVz94D40EdNIAHPjyfWKQGcuKPhhQAa/8wS1Vr5vHEEhz1oAjYZh+gNRuoKdfDN1ZzEd8ri8cgkTVImqx9Jx2n7b8cf0ebM6ykIzeIU9Os9qQiXiNAkwvRmq2uKlUt2qYxZ7UlmqDV0B9CZvB4V2ahcp60YD5bt8K2xseMMzJGhStcWO831GDNJlbuu8EZ/hySajWA+QjOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwi20KomilEllyctI1+J40cz0JDU1TIzlORODcSer18=;
 b=MxRNnsOfgGcjXhgtZ2HG+85PPFbc3ehTOijuPBBT/A435gT0qSYRn3oxhqx0x765GYMv6z0Ywezt7y+yPPzXOt6rqbmKBGAgMFwvldaRUAOuyQbAsmSQUkpIcnJvqwwNN1nt1+W7eaAxpOT/+1zjUIfp8AO9YuhkdEPelbFR3bLZdsE5wlkY8QsCVE2ZK6hGtGKzTlXVN/TQwPLMRdsfs5lmUNtVtTk3+3+6ijiLxfrvFjv7cmmz9qpF0UOYeC2J6A7Ue0eE9rnSURNT+RetNruArqFIYR9TBjmsCcQdBG87xgr95QtKULhXNfTICerzY0omwhRvPWbaTFux0yS/rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH v7 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Mon,  2 Jun 2025 11:18:03 -0400
Message-ID: <20250602151807.987731-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0349.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c56996-edfc-4b27-c7f0-08dda1e8b15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uenIwWxWfbxLTTe124ES15j0+OTHPY1AKxNQv12YyvSJ+WCyfsSQfRsyXfT7?=
 =?us-ascii?Q?vj2M9Cg5wg+5KG32Z8Qoei7TKUqkkX+/XCbRPBmfwWkKMcLV7C3IvEbHqMwl?=
 =?us-ascii?Q?4/ZjwabsFvNYAByT5qX6DjRvBGHetd+7pjeRxFW1VmUvhuVNWkVbJbRMfvOi?=
 =?us-ascii?Q?Y1Z+IyDlsBB4EbaKzUH1z0vL7T6Wp+/m8+oQvHns89EQoDMsgfzdlD/+q8Tf?=
 =?us-ascii?Q?eu7F6lMEjfr0BW7fBsjX6yn0K+S/CYaB7QhFiPl7MLnMsKNS47eg+QIirt8w?=
 =?us-ascii?Q?dv7MWprdsR5J+PocMD6AG8P4fP44JZfPzihVERJ1kLdBUjA8/t+v/bNOED+4?=
 =?us-ascii?Q?f+hrZV13i1gEPQLIeR+NRD3uFjh7EwH5Rg295PJdcnIMClGJMgHFBdlSfow+?=
 =?us-ascii?Q?qSWEyU9JJrFeGpJB+z2q3+1TeUbRojGidr8GLlsMWBB27Uaro9LwJlmK1SrE?=
 =?us-ascii?Q?/ZDiMan7IaXHQ/W85/sARXHcSrdrefXA8i/KzA45BAJ7g6heYyHc3Xx3ZO48?=
 =?us-ascii?Q?sp6usea5zqOO0Qr2SYWU8YJsI+O1GdB9BX54FkLoCVb1FK8DJM4Rk/BgWpyM?=
 =?us-ascii?Q?kllBWBQLwBcLZQt23ODjla4x//cqnEsRmIz3wbGTL7xCn6tVgnjtKa8YpLPO?=
 =?us-ascii?Q?KViPa+s9LOgn/ajroUiscKCn/zZrz+9TYDK6I8Vmi+nXeW1Y9jRYPii+JPTy?=
 =?us-ascii?Q?x1xMQHieH03VQuuESd0aoxqaHZYyujirkUOHYOm/ORnmqI2FPE9ZbQWRKOTO?=
 =?us-ascii?Q?nyFN4p7POmgqiO/1hPpa7dSI34Qy6QzgkSzQ83uSUmOLzRaAQbthOJA9wRnj?=
 =?us-ascii?Q?koUlIGgkcT0+y5pt5EXpn3F+6JOdCE/Pe8wcwu6hCUWfrYdBOIGEtmBOHvR4?=
 =?us-ascii?Q?llpPdpyBk0vlQq9nNfMnt0xU4fnwymCd+ducluP7gkOAIKileLfPdqnTjmSy?=
 =?us-ascii?Q?4YIIZcLc3NltkZ19KelBAdWdRsr8++k2Xa/2ZnAVuIJZaVk6K29q0o43fZlX?=
 =?us-ascii?Q?moolQI4z3/ah1bUtnfv5qLWutGbzAwGbOmJX+b1k1yKVgRAjI0v8TfSfkBPc?=
 =?us-ascii?Q?wv4Nznul53DlOwPqo3jtWJYeE+cblo8jWuWj8/ycD6NO2GGXLnDmPGCsx99v?=
 =?us-ascii?Q?ldqhS1Ci+85RI931qp+wMHwL1bu0zuBUjWSX1G09vMrCd6wQeWZ2l7nTgdwm?=
 =?us-ascii?Q?zfk5hAQ7Y6nOoWw6Z9Ck9uyGltdxkwerJ1gXYCChzW0iErK4U3OTqYoWe6xF?=
 =?us-ascii?Q?aCrEI7sxLE3Ek/nl2VTz0kWGck9zmf1/D2/UW9Galg/ace/TZm/kF5l0lbFF?=
 =?us-ascii?Q?aL4YkSHIlePhQ7zyoNX1vMbYZD9kFIHzxEWWgRQtG28eSvd89EvwLQTvZ5h7?=
 =?us-ascii?Q?dBJHDq71GeEbZgdeWOgjX97epadWuX5+FP+Kw99V/pZ4uMbnz4j6fTHmIfg+?=
 =?us-ascii?Q?8KnX7v6UCVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DP5Ya1CPGWgUL0w7J08jfSYe7k7F8AIlHfcwE810GaO3oQkT4pLU+bN55sB0?=
 =?us-ascii?Q?uYh/6c6B9RCzcGgSNZop/JkDPPry3eRqCfcCsRWvv6bwJTE3/kTk4NE+moX5?=
 =?us-ascii?Q?AQ0rgQb5FbsLa+Hi1sg70ESlXmLyEpRIut64GxMwfAaw0fI5UPx1YrzgUNwe?=
 =?us-ascii?Q?Y+hDYKWiMoETCXIDVpaRtbUF+WN5sB+42GRp0+Ga3fiytuRWHz9iX7zK1d9Y?=
 =?us-ascii?Q?tGXfVqa0+TnA7dUh399vn7J5EPaJ606rLCOeIbt/0WqeTLq5g33GCFlJqndr?=
 =?us-ascii?Q?3ko7w1ReAbiPt+yFKQFxKrpgx7HwMARhhs1BiT3pqCMfwXkI2Ek88dE15F3r?=
 =?us-ascii?Q?NwXaCNKQKDIqQ8/fLlUGUKTfs735SvhyWx7HhbjUCkQ++VQA2IXkjJLloLTi?=
 =?us-ascii?Q?/LYklKxPuyMkPg8CJnXarpeCsvQA+Xzn2iDDEBVoK6LLe9B7AyYAzSNyzD18?=
 =?us-ascii?Q?fRM6O9xF3HEC6MKPlF5zBcHYCeL/tu6hdrtzpPupRE/0yCtWTqyM22ATyxhW?=
 =?us-ascii?Q?gGwACqlko3TC/wlgFZqocVRhTFWOqwqYo2UW6+YBlMfT7riUwKclNhN+xqGm?=
 =?us-ascii?Q?CQ1s8bWuvDpHZnfWU4tXrat6fxF/KaVGUrm4dTjjXikNGbM/0HrAFftdhifu?=
 =?us-ascii?Q?WWTppYYmC846TygqqD25wsZ6GLzdYDyPVtcw1E2p5B7PcPZKF1hJtMl/D/tG?=
 =?us-ascii?Q?hvjgQl0cyVjZyfwhRHuLyJUKxE/J6p6WdeArQTiFnjIQ1HlPTIm6mf0xDMTr?=
 =?us-ascii?Q?VBI73TT1kVRoNwbqXTET/CLlMbeVsGkbEX4gnwdeiKzQT58O/dYElXi7Vshd?=
 =?us-ascii?Q?BG26L/QOxJ2qWO5ExS1OOmaPq7q3IBnzpvTWG7m9syEqkVvyjZ6dF+HysZrH?=
 =?us-ascii?Q?1XxK8jUzOa9F/4E3hbVwVRb0MfasWFiZe91+GCbp6ilifrzR6PSC9Vpp9PD3?=
 =?us-ascii?Q?n3ftb1F3L+2bn/c4HKMkgIOVYQkiJKZKjB/x90t8dqdz0rvAb4qw+Oh7Sfre?=
 =?us-ascii?Q?JcrCck4GA3Mzl527oZBjh1kIZkcUlxFZQD65rbvL+WbZF+HlBVN48ZNsEAq2?=
 =?us-ascii?Q?GNJ2umEWpMuxZ64PLeWtcnDho/IGFu936KeaM5NLqMIbgUwWwcl7sJYi2k2b?=
 =?us-ascii?Q?KdzBIwObOHCAJRmlMlOLai1Bt9REEKlY/u0TrVRI4il6kR1bAP5WPLjLjfcd?=
 =?us-ascii?Q?rP+eLYqW43qQzAPla2g/s7RsFV62SVWa+/FSDdkycl0wzoA7BGQeraQmSINE?=
 =?us-ascii?Q?SGvwZsV7n7GfWrd3CYAFG0BTGVhQGquKWQ2TPUePJtrr2XW0IctUjU9LrQrn?=
 =?us-ascii?Q?yX5fZ+RtYVZFQ5/9K3wkiBaemzcSeL7RnIot5nrcerdCjcJARoqiBidFTe14?=
 =?us-ascii?Q?CcPwNokNqdXVX0ehGyw/WftfnNrxLZCSMRJ37/sYmwSIbb7/jjl7/20qcG+1?=
 =?us-ascii?Q?APAJVN+P+G2eN+o8RGz8Ifyf2hQmk3ifHXRkf5fkZKcz9Qk/Mhe4+/0jxaKg?=
 =?us-ascii?Q?JDG8tOQHZIoQviw9KwlNm9m3WEhwO0Du4IG7U17vC0FWAwtyEwOBi/oidnin?=
 =?us-ascii?Q?pLj4rxbUgUV0UOrR7DtPQsuk37RHhza73WRhUDfh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c56996-edfc-4b27-c7f0-08dda1e8b15b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:13.7363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQlJDvyyzLPhRS1r08k4Toz+yrZWqe88pTBjN5to+zY6l06fzD2bleKthdxglFyd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542

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
index 392a03e37610..0a5cdc52b405 100644
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
index 451b351c689e..1cf5f0fbd627 100644
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
index 74cb7696e527..5de23eba0db8 100644
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

