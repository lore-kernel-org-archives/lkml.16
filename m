Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA041A5B85
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622173; cv=fail; b=TqgOKx3rMDuoqSIOyfQPwqc6DhJW1bdFe72YmmxsP0ulNscNTExQrLeigw9wzkwz8+IMoAstK+am9SM6vFynrSkJQGaIhEyb8SOsP8IZ5aRxdGxuifuaZyUst3Ju+ihWzyXiTKLi8oC6+0Zxbmtv1/m05+xW8lQmKWtMpP5ukUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622173; c=relaxed/simple;
	bh=uZcrBxC33RZOU3DBKeTbakPVeujulD65cdi6z4n8XVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=upsu5c4eIx8+orWAFE/faUoWcvmBhmpVXBULzDZ7/uxeN6odvxtLmQBSD48sCkmCuDTVcf1hK5vG3uvdibZubOdEhazIhtUvRKJMa2bAXko4wY6aXDGpFTcS7IK8nCAs7ibvPhZ25A+ZYa+QJVfnYoCcxF9xDkS3AqDZfqdt8TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fEDcZAVS; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fEDcZAVS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=totBCeueVE5UrwBG+NjYw/V7CRDJmJyjdNXD6sCAxeodubEmfM8NXQkWoeG6L6i1XInj0YH4ny2xvdsEPWuEIBga7NSJMD0IpumASQeW53Hl2mbCk8c20Idkfaztd8ms+aMfohBOaINWXFUIaQrYFRYOXoFHBdij/sBm8j6oQlvV+ue3SQZ94HTTTUe/vbvK/HRdqGIMeBIrxQl1yq1/JtRndogzYXikylsLUKSsVBAeh7bOfMXyGbEEPbb0t0WEJ9LFKgSYHdb8SJcDJ7nuH63nI8w1P/0gIsGRjIVN9rI6dk8OUP0fb8jCBdNJGC5+YQm9KyXMD+Wa3ciQjU/+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hiK3kLot4o7xS1s5Cj3Ucc8b+4P6Dh6DmiQNaN80VM=;
 b=SNUlPWVzl4zBZWpOm1YpRkCvjOaZs4QXxjskO/mvee6X41q2yRGbCCn+hcQmAX/xpJfGDmrWYkDBWVPHGDQIfgwE0Co3l0GQm+7nbraJxIJQdpeXl9w9PZL9ZbvJnvmiecrepJwb+GWTQU3EDrOyoLJWFMhLkDGQrMbO1WI3LhHtrWhRHUiN3eKqyOWGz/ed4G1lafkRDTuA7IxpznIwo7NzUxkSCmT/N+Cp3zihKIMi+jXdBDqxZ/dRg6B323DHfpoKpT+nBjQsWncSlN8vSXJ4dbRV1AXTMedwkVYi2BeTE0bisjKcaRWZg+NUZgNGSUVf79hVIF5ECWNYJM2v8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hiK3kLot4o7xS1s5Cj3Ucc8b+4P6Dh6DmiQNaN80VM=;
 b=fEDcZAVS+A9zoXcGu3eGSfUh8NHJwPncH+DVmA8DvLkL9qrTpN3kzB6HKUNpLa2sSvZGBKWX2WgJE9SE/sZW/VTDfXvR3gw6mqTIDX9Pq29CFbS3CYCmf/KeVKk1LQmWTa2CipuMAZUNSjVe1JXLs5H5H5Wq32+hC8ebxL3laxyFa2Selq47LFH5qh84ymjbolNapLjFBcgrLxl2UCKrq4ZSmwLJxplS7dmvZ6nYqhHb8dA1MzDJSkY+80Uhgjp2dpSdLsKaF2tUr90jy+IVVFnCw58rP1jtXziIkU3PQQ2WFFzBwSMdVkzXlsynyp0mBJLNa8ed0gd0MWKRFWT5GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 16:22:49 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:49 +0000
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
Subject: [PATCH v6 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Fri, 30 May 2025 12:22:23 -0400
Message-ID: <20250530162227.715551-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0021.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 835ec09a-6d87-487a-50d4-08dd9f963844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hvylag61y7I4lrJ2XyXSgkjQK8+T5mUQq7kdWGKImhvGLsXzEjDu7j8sGBSw?=
 =?us-ascii?Q?QZaIEkmz7dDej41YLVBHyD4W7TiQsHzk/M/Q/ap5wi9pLQ7ZNemFOPvVvlqS?=
 =?us-ascii?Q?IQvHLECwGKxrzXwDoClaFb/wgTlLA+JvDaAEDwGpjp1DyglDpJ1EMs15KwTk?=
 =?us-ascii?Q?DsDJie+edqoLESwBRcjZUDGfDphEx4oBibUa7NNmNYsKxGHIokfwlszyIVx9?=
 =?us-ascii?Q?7AshqRgwzzw1SGvQv+Vrii3HUq/Oe/F+lRBkCG/N5R9AKZZoeOqH1V1k1uNF?=
 =?us-ascii?Q?Q1XzNF0SQtvXUMHYRroBzsudyD5jV9jT8JtAlTqlZHyKC+m7TXRhDkJFsQ6S?=
 =?us-ascii?Q?9m0Pf4lNBo7+qs9pGhMrea4BpmO9yVI/ThOuO9JTIDPIn937cfSv7VQTq/ib?=
 =?us-ascii?Q?NfTKs/mCoSO5+darkCmQH4mWdprqEtgDF2Psfy60EaaDu1sLWq19Pq4Vd88M?=
 =?us-ascii?Q?KFFb1IfGXAIZfYu9qUoPV8gL1xcU/h15+ymLx1f7sAkuq/kgGWBNiV0+cLbY?=
 =?us-ascii?Q?MRDnDKK56R4xUHjffjx29AFEoAml67z0UTRuimIXc/gNabqDlr5bkYmshodI?=
 =?us-ascii?Q?2XRBEvQQ3N2AafuLpQ/5gyXdbiI5LS8F1iBwBys4LQZH34iAFAEQiOwsW02u?=
 =?us-ascii?Q?TsJd6aXn5j/1yH+dGYPZBe5a5VQ/uR+qX9iigyiMQNS0NIa7czHdMLmfQxWY?=
 =?us-ascii?Q?0BgCXl7eN2KFCb/AHsFgc/7WvFV4PlKBQamgnepOxTNO2VbRnyEpjpvm5Hfd?=
 =?us-ascii?Q?m4b+YlQM4CUW/e0/P3kZXz/T6qtlJUQGMbQkl7veaT1HpLY3ZZDDeX2zxs8r?=
 =?us-ascii?Q?op2kLCODXzhvrV9bEkqedrQmayQtt8qT+KWZiq+Pe5hG8h6j2GHI+0GGDXRV?=
 =?us-ascii?Q?o5mTqY8Bq5FTHaOsRmtT3BzaTfohgjroRZnZ5hARzn6Ql4Izqm2/ErJvGqKK?=
 =?us-ascii?Q?Hg5aCqab1K0UgTuMhRjvwzfAPr4CTjQnfvV6y5x7Et9f3tcGpDGvN8GIMT5v?=
 =?us-ascii?Q?LSToRYNgoOy/mbdL0kJ/AQ/h2mPi0BnzjQmWZi9mYH1UJ0+ljcPZ2PFwqXpa?=
 =?us-ascii?Q?lyTxXT7fvGnxwT022mQagTglEk5UrwcD72kzVMtOCK6UBKknLSgqbyclYDyL?=
 =?us-ascii?Q?vcZGLNKuISDbkEcO8jNWvjWTnLrUuEOJmH3ZsjlAeY1csdDxx2GVS9jzT4Q6?=
 =?us-ascii?Q?rQART2VO4hdaRgSDAXEdawhgl1Fg8po0qPzCA0TWLQ59m8lTuojzvccvb/ti?=
 =?us-ascii?Q?HN5E/IiFqc2LWu/7BSlucIzKjoBMazzcRsOOoUB1yHErt+sy8MRs046Cbf2m?=
 =?us-ascii?Q?bNcXWNtQmV4g6Kr1naBzvBbcjsCrWPIiMQvTAG1lONcNrw+JG4jkHsCxZ+jW?=
 =?us-ascii?Q?XBKrRVbhgb8DJbQWQHpwnOLjS8fhlEYpQ5aVtmT6rI9/efBkTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOwNr2Av/G+I4GW1QsK0KNfA9HZespTFH2eTw/j92wuU1pUFnhINS2vSKJNR?=
 =?us-ascii?Q?pEdTUvRJ+/w0z3/9W18a4PJjsw0ntkdeKiYU56zZlJ7tHb6HF/lupfEzh4J3?=
 =?us-ascii?Q?vnerrTH43tVBFr3hLHhhuhri4ySLZ23y2iQTnf/bayJCOOlkgLDtyIO/lSu2?=
 =?us-ascii?Q?rsY1DvkuVFZq1/31wHWT3v2uPfEV/rSeq1UQYGTRuVY8dwg8WKctFxmmHPJi?=
 =?us-ascii?Q?ZsaFRhGUTRg8y2webEnGPLJpRvBZbm2QP5nTxoWiagc5ZdCC2b3lhyAOOiiw?=
 =?us-ascii?Q?cB4/kr8NpMin/JrEXWWI3QK21huAoz8/aTJzPLjLDR4cH0YRCPOtoB3KKsI8?=
 =?us-ascii?Q?FYxsubzrUPAKuO0gfkYLFYohxW4aTfrhCra7hZN4S44FwkQUvZEwDwqz2i8x?=
 =?us-ascii?Q?l5kQOtt1DFoPnfeT+IVLUMEab9iup9CJC2QJw6kaenrK5rbDLLh1tury50Mq?=
 =?us-ascii?Q?gcrACSRMRWNBpz8Ol/eRps+VOgfE9iibGuq8t1q8wecut+nH9Oh5RjBwGl1L?=
 =?us-ascii?Q?O95aCdSuffskzRp7QQDCUZrqYJ+F8qauX4GFhDBpKFTSC0d73IOM03hiNmBF?=
 =?us-ascii?Q?pbKmAAe0xJ9QL77A6pl/c+mcVPk6N+gIYufuiudwRahdGvZ8Bf9N+sub1Gfc?=
 =?us-ascii?Q?ho82fWcbA024KupujaM9aMeiDr+yj7JV0uv0h6jlx/oTyk1KQ9viJo2iGU3O?=
 =?us-ascii?Q?wC0DSs1kqaBvQ5AnAk/F1CZP2051GgcbVxLiSXfFXIF5/+7SCib0Yfbk7LA4?=
 =?us-ascii?Q?ZtiEHJ7aNUQ0jOwfeg3pbv2x7Fo8zlXYkP1MFp7FjJN9Kv3Pg+edocsYPkfe?=
 =?us-ascii?Q?rvdkP6SaI/AYrxYr0yWnowzRNwvAeOoTR3y/vjSViYN6Rhxi8RnBHzuk1wvX?=
 =?us-ascii?Q?4IQ5rOLMr4PQ39oeSqqteEweAUmKu78s6cXaCkuBoFKSTME+n6995Gc/KYF8?=
 =?us-ascii?Q?zV+MUsJGsGXZIhtm9fUMqM8YdnpluyxqagbrbSH0X6Mb2kQChjeE/aiNuyTx?=
 =?us-ascii?Q?xSqSUa0asF7BcWJwjkPAbDzS6JBL2E4xerw/5m8qE9KI1do+bETgDDEzWn1w?=
 =?us-ascii?Q?mKclE7A2sL1jy7AsIWR152Bcw5Ml9NRTB7TvTa+pYHbxj1fObT/aPLAw1KTl?=
 =?us-ascii?Q?iNDKcimQxu1hMO0KRSvMsaL+HOTmyByaHIlbyVdjP4WWxx1Gy8sun8DDGFCG?=
 =?us-ascii?Q?Ss9lZkbPo7dQ4dmncXEH6tmlJ4Mdfi7oxLrfZ1HUI9RZ1JEXiCQ2Kd649Ks/?=
 =?us-ascii?Q?Yv0wxvlSvkJsjzfi4Ffx+f7YbBssocqtdWzEg6sghms1pW6imn8HRUlyLIXw?=
 =?us-ascii?Q?aMWeNPI0gps08SYyJuaDi9ylFmU8RmKmY/yUyWTPCgdfeB7EFTn+s5Llb3tu?=
 =?us-ascii?Q?JX8grPpreBNTky7BfEZiu4/jMYmcoLH6hDHPE2cBtgrpA9Wf1nwbQ3bQfIj4?=
 =?us-ascii?Q?PWQPygTaWN/SNPkC5yKPipnrR3LgptzmUIMpAwdtgjhg0BfHjh1wlot/2YG4?=
 =?us-ascii?Q?nUCqGHW4Np9i1JCPEKLmiFaC4z532eRAGqugcsz6cnEK0aU9hvvhRUOhFz2z?=
 =?us-ascii?Q?mVsoJO0P1wSAFRIpj+OErQg9HmKRAxHBlKmad+Tf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835ec09a-6d87-487a-50d4-08dd9f963844
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:49.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3qLjEezvwlWmPhmxu1c8GX5CazhWVUY7rU4d/iRnhSCAgltXcahur8rH4PH1YRf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_compact_skip, so that migratetype is not lost during pageblock
isolation.

Signed-off-by: Zi Yan <ziy@nvidia.com>
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

