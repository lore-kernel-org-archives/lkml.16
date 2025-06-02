Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031A233140
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877504; cv=fail; b=EcBsMFmzN5i7SQDRKWZxzO9nXFG6p41pGyzhEOWkFee+KkRPftdgdHKMKDVUHUamolpOAfpkix+7NqIIkNDf+uI6M46GoFAocFs/FTZc5QYTVP6UKmJQ460faKGlYG4VIvgoovX0myg95cUYLb+UhArxshe6qg2eTaFTIy5J1+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877504; c=relaxed/simple;
	bh=LhxcHub0OtdzSA45orzN+aD1TFgllLctkqv00XizHAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p13gGw8YTyBeUxWPekgRQ4aynhgC0wE/H9iFEb9fD59P+su6+PAStO3yzCGAwm4jkw8Fz3iuTf1T/DBD0IFeuh1+okncktoiwgEjte9LjSn2027ymScydLO8kl8+EK4BDlswYSaaHafS3SVRZ4mpFX/1e5P6g7axQ/0bueMS2GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i85XzaV4; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i85XzaV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNBMk/mBRNNTwO4kTfCbF10u+ptOZVoOz00eBGxXxPPBt3+OJii+whb4Ll1KR0JApKWRdZiJfOgWhEORhhYRyRULJj3q8indCIhCHyXEiVEVm6vPJQ4Nwlp7a4PmDBCO7qigUdmjJzTdFpKQdDkjsaaEthGHH1FhKat9heq/RO8zKlxIhFlLah+Uz+SRHNcdMrlaECqjzv3+0XLI35+eIKsQ+LpuHzWTQ37l1lC+UQmrUW65E+e9QNz2WKm3tS1hePUFHL52u49PI3nD8WkSrdJuYkVLVHn3/NwoTI2cw+cYi/oS7cSn7dYRqjij46vIuSxJkeLY/UTEwu499c0LtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHSzkPLbidH6Z9sxeXvVezSWHaVdGptkKez5GwKTgDg=;
 b=Y/HOOO66Wbwtrk+4DgfgaXcSyz6cJkT8Y+WMJfbOVY9uNaVfO9gLPtQsyvqacwEmD6JhwlMf3Ty0m1+kBWKztdq7fs3Xe5AB5xvjIF48Ecu1IDVvksQ9zwjadC5K4uWnDUMmABOsElf2OcWir2BE7mvjj26FX+zOJFkn2d6L7lwOia5G8SMmjfpG1E8ZujD3ySIXPPaXw6/QL4yI63SvhZQVPQwuyZfW0x7OfcfmWQZAiEswFGTIDSWTfAA+/+o8H3dVlaOZ4CWnFp5Dx7IYaaRTbjGGEKX5dlkVLtNc5wO2NT2942aDDCMNRbZp3tPPstvdy/8v2lJW9dMoi5fAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHSzkPLbidH6Z9sxeXvVezSWHaVdGptkKez5GwKTgDg=;
 b=i85XzaV4+I6JonNMhumg3Y+ecmLZhgX/JLE7dTWBU3CKajkuJf1y38tEouHVlb2auv+t7kWH1WwG7M7rRpyrt5X3la/l9XrKIrJ1hP3sJKRfD416KD3dhFW4m6wgQXIHhRu/GHwXPjOnwPLclsdwhiH9T5BvBnndC70C2a0ADhxeRlW249UCOWb6sT/romVl28iedV6jEQDBvENJUDkWVAZgwrkx5inUopV/N96tGD0QB9zyAMu0IqZSP1NadoN5x/+cl0oS6vIQDTGRcYq3Mxr+461ZHqQvvkHCeXkSrO1qcMHGnk7+GBbR27wQ7d8DgPpyMR3pxkw9nSIWcyCAdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:16 +0000
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
Subject: [PATCH v7 4/6] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Mon,  2 Jun 2025 11:18:05 -0400
Message-ID: <20250602151807.987731-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0353.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: db9c2edb-b1c3-4b90-e20d-08dda1e8b2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UXudf3ZSr4f8W/3FDR3UGP3UpbSECyTEYOCPcgd8Y1eu3D94uwAvT+ydFxXf?=
 =?us-ascii?Q?lfF7WRKH8HJuthKTScL7AfvG97jpsauAMGhAjNXHwnUDWOWDI4NL+vb9KPbg?=
 =?us-ascii?Q?07bdRzvv2A8ujsCFB/PlYSiGdu2ODinPmYkeTymJnmwRL2mKzxr/iL9Ys6H5?=
 =?us-ascii?Q?1G1FaPEjF/d2qpeUi6O656U3sXS1ILArkDdgNIxF999jNZMjjBcg80id70kU?=
 =?us-ascii?Q?/Tzd88FzP1TIbEazpIVMjYN2PTdXLelWKUZkfeMw39plWG0fo1sGb8KxogR1?=
 =?us-ascii?Q?pQobqBBpHMoEdAs+kv6GoybMXEwhx4EqAQs/UKaugV3nvI6YweNEUVmLzQfp?=
 =?us-ascii?Q?9q1Js57x+yDxexEnKHUmphN6nNW2hxulcU2PINP6LvRgtw1pCSCiLtsQ7z+T?=
 =?us-ascii?Q?TZ1PPXYXb8bnN/bor69L1q6Zi8Mn5eQ29++AHblFi0+vlqtNFKVlQIggLoIA?=
 =?us-ascii?Q?j6DhdT4sPDXGC231R2ZlSi8oiFatVt377g1+QorwKisSBiOCr3m1OCfzEhUL?=
 =?us-ascii?Q?4NuHDTD6FLc/mvI9H4xuq1nfvcy508ZEDkZ+k2S/8Pbw2Ipa63wlilaK3Oq+?=
 =?us-ascii?Q?tqZrjNRWTsDJpObVzLeGPYk/BhpFOLIfTTe6yZsg+p9MtazAr9ZvG8FMsHhj?=
 =?us-ascii?Q?4vHyaB9ZQm1JVRJnV85FSHuc1B+F3mCCPBsylWrO+ubo6xFgQFrELClXpA12?=
 =?us-ascii?Q?JwiDWe5JHSkC5nJADpRfUoFCdn+hN9aoPUoYG7W78NRh/OhK3Jh3Q5W8hsA0?=
 =?us-ascii?Q?B/1iMjzeSS2IBHMBDue9nqw5o9m7MW03uMomqGkCm9GVGv2X26pFb+tEDcM/?=
 =?us-ascii?Q?GZTqpMNjHXe+/s9GqmDmaujvQ7Z2f3G/etXuIh+CaOxkumxw7SW0CEuukdY6?=
 =?us-ascii?Q?kUabeOLkBIIhoqOv7xwgdTGlQ/VXax/0VeJ9XbVZdRVd4Mi/qvX7W8LCLiuN?=
 =?us-ascii?Q?XpHAyA0X5Dj0zw8Jg8OeoBNq0vi7qGVJyOviE3LwQuK9r7KLR3bOB7sSduxx?=
 =?us-ascii?Q?AInheSFEK8lPtvnZLRYbLBPkzMbfemH6KNliN0pr+eW2oKa0hMBcRRTDB2ZA?=
 =?us-ascii?Q?NglnDLCU40orCsYa22lna3FU0MPgB4uTJvnvGtO61qsQlV1JYScQeYQzGG4m?=
 =?us-ascii?Q?kBuM06aV4zjBC+f7vfQ7Ji4heuHPo+hBKpyW0pZkxuLkgU8CK2D6EQ1sMSP3?=
 =?us-ascii?Q?ees4p9pt2zh/db588xLVvfM54qjvYUp3lotz0YvU3ZghTa5yZuqoy41/P88i?=
 =?us-ascii?Q?JNIZ70EYYtW5ycgj6I8wPiZfmhxbCN6P1x/FIU6Jhg66CA7Mk5UW6J8yWzaQ?=
 =?us-ascii?Q?SVs5Fff0iOdT/8VYj59pGMoUCQX/2ZzJnhiNOv5ysK8ydih8booBwNpPQRPQ?=
 =?us-ascii?Q?kw5NTwez9jYTAycPMNJ9E6jEdFQWuHriW8bFG/XZ+m4jjyL+ho38B6hdI6Ld?=
 =?us-ascii?Q?sPGZI8qOgHk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uMBP8EEhrNWYVZJJjsZgpb/YrWyzkBEFUtBaMdE66V0fs/4JY2dTwt0s2Su2?=
 =?us-ascii?Q?mIDpQCckvinwYsNFaQwWOsTDEOwaMEnS1wvru/QW2GuaGn7pKYP1EhKlYYcp?=
 =?us-ascii?Q?7Jb3r7QsY4t92FQdHcu5k6aWle9LKeE1DnJ0ukzla8oCA04Hl9epZMwzKnuk?=
 =?us-ascii?Q?aAsnCOa1DEus93ztAVI+9Z34KeYpXfgVlGjbcSi40GARAVTNe25vMUCjzs/T?=
 =?us-ascii?Q?703wYM56Ilx8SfwpqLrw2I+D/SgBcPIpjGyw/yTempZTRmD/9zKjV2zDcAxh?=
 =?us-ascii?Q?5yNvo8Bu6s65LtQrpY5/Xg3UakyNJP69MAIMNC9ZtNK5QzbkES4DqKiorFZG?=
 =?us-ascii?Q?Y+NpaodbaOQnlb2tqdW+nEjHIH3WFHRhSblvLKmGxmLzIropxxgjMIHhwdKM?=
 =?us-ascii?Q?iUDBr1s7LKaZjF7QfY4/zvYKT1NjlQZWD0/WAk6jL4guZk+zxTixjBqu3SIb?=
 =?us-ascii?Q?ymfPA42DmaObkMA3h5f0qwoGXoiThf11HmmPtEPSR19RkhLZwekUYxXW+tZm?=
 =?us-ascii?Q?RKbHCQt/KD5eB4NDU+aKvJ5LemZi4NkdBWSxUoLSK4AwyL4EVj99ca035EQt?=
 =?us-ascii?Q?hDbmTCSi66dBmx6kv+zhCqCzQsRsLF0B0n/jPjQmj/fJHR65itPXfxUswQV5?=
 =?us-ascii?Q?j/DSU3464uSxPYH+guePj1ESkkT5ZkqrOtmNilE2sICtV3eASbKbeqNwc5of?=
 =?us-ascii?Q?r5VWxNKnWaDXMhLsTMyui8Gd7Ft0Dq3fRjUsszk1E+pByuDekf+iD5l91k5l?=
 =?us-ascii?Q?tiSOqX7v+YO/y5ihSeCWMwiYJEIOD3UFKx4wFkapJxaLXHJEPm03V2LwRNho?=
 =?us-ascii?Q?R+SE1KeD/I1jQPrhzPRW55Xey9bd+uKYWcRWbq465pE8pZ0BW3GfLwSStYC7?=
 =?us-ascii?Q?WDd6pk6mSWk8WKW6+aE5kcdRwqXhPLYQDpM6TEGmEqe8jnWvtG/ibDU4aGWH?=
 =?us-ascii?Q?WnTyjMHOKvOoPvvd4Sq16gO6xJlKAHI5yZeX8ddtdlRKNe1uCpxdpEbBy9Bq?=
 =?us-ascii?Q?tCGTZrrJ5maka+/RhxqKnnSQ+gz2b1072ZYYDWJQf7tTzoEnrXstMfAw0BMT?=
 =?us-ascii?Q?M/h6NsY92tKP8puyli6IiiGXWWbi95QRnSTs7QTZ3hUSp4+dfQ4Q8LocQm/0?=
 =?us-ascii?Q?Bm7iFh2YsEHeIGcKlMynqO3v20HwNnri7lpL22GjZi3CpksfW9m0hnyq4wf9?=
 =?us-ascii?Q?HAbz3cU3/jeG9qwtbTYh8sw3zExS7khzUKdTA1jkzvi6xVzrrlJLfAhMSs1W?=
 =?us-ascii?Q?dlYPG8OE+JMbiBXlwKF1FaCxAcq/57VXeHKR9aRPcPNIWGlxZYTQlpKfgBfj?=
 =?us-ascii?Q?fE/Gdv4ZcO6meFeRBOfe9duVw+0jmAjVefy1ms/wL2o13ZeN0T+XaOosJrvb?=
 =?us-ascii?Q?GdyqGLyloVJnn8XCbeO2PppEM4vlCWktGciosx1s/x2d0aliU1wXDAwlO0jH?=
 =?us-ascii?Q?DUg5cDu7dyiK4IbKistvkQF9DVLjxCKDnIF18czLN9gRAMvu2dPcXUyvGgOv?=
 =?us-ascii?Q?OGatgGrm8t0eJJFpjXaioc13yII+0MWRYNC5gtfgydQ+F/xLnLdAkY/P4Pek?=
 =?us-ascii?Q?Q00tEboat8d7BtyxfjuD6Us8Kj3jVc+LriUeks3a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9c2edb-b1c3-4b90-e20d-08dda1e8b2e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:16.3470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yOvZnF/ayaIFYu7faFraGFsRrgxOPV2/zXAnrEm8IB5rvUThEOeojlPk0cEM39O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

Since migratetype is no longer overwritten during pageblock isolation,
moving a pageblock out of MIGRATE_ISOLATE no longer needs a new
migratetype.

Add pageblock_isolate_and_move_free_pages() and
pageblock_unisolate_and_move_free_pages() to be explicit about the page
isolation operations. Both share the common code in
__move_freepages_block_isolate(), which is renamed from
move_freepages_block_isolate().

Add toggle_pageblock_isolate() to flip pageblock isolation bit in
__move_freepages_block_isolate().

Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
so that one should use set_pageblock_isolate() to isolate pageblocks.
As a result, move pageblock migratetype code out of
__move_freepages_block().

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h |  5 +--
 mm/page_alloc.c                | 80 ++++++++++++++++++++++++++--------
 mm/page_isolation.c            | 21 +++++----
 3 files changed, 75 insertions(+), 31 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 14c6a5f691c2..7241a6719618 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -44,10 +44,9 @@ static inline void set_pageblock_isolate(struct page *page)
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate);
-void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype);
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 92a368d38d77..6ddf4fd6b2bd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -525,8 +525,8 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
  * @page: The page within the block of interest
  * @migratetype: migratetype to set
  */
-__always_inline void set_pageblock_migratetype(struct page *page,
-					       enum migratetype migratetype)
+static void set_pageblock_migratetype(struct page *page,
+				      enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
@@ -534,9 +534,13 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 
 #ifdef CONFIG_MEMORY_ISOLATION
 	if (migratetype == MIGRATE_ISOLATE) {
-		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		VM_WARN_ONCE(1,
+			"Use set_pageblock_isolate() for pageblock isolation");
 		return;
 	}
+	VM_WARN_ONCE(get_pfnblock_bit(page, page_to_pfn(page),
+				      PB_migrate_isolate),
+		     "Use clear_pageblock_isolate() to unisolate pageblock");
 	/* MIGRATETYPE_AND_ISO_MASK clears PB_migrate_isolate if it is set */
 #endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
@@ -1923,8 +1927,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1956,8 +1960,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -2015,11 +2017,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
 				int old_mt, int new_mt)
 {
 	unsigned long start_pfn;
+	int res;
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return -1;
 
-	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
+	res = __move_freepages_block(zone, start_pfn, old_mt, new_mt);
+	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
+
+	return res;
+
 }
 
 #ifdef CONFIG_MEMORY_ISOLATION
@@ -2047,11 +2054,19 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
 	return start_pfn;
 }
 
+static inline void toggle_pageblock_isolate(struct page *page, bool isolate)
+{
+	if (isolate)
+		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+	else
+		clear_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+}
+
 /**
- * move_freepages_block_isolate - move free pages in block for page isolation
+ * __move_freepages_block_isolate - move free pages in block for page isolation
  * @zone: the zone
  * @page: the pageblock page
- * @migratetype: migratetype to set on the pageblock
+ * @isolate: to isolate the given pageblock or unisolate it
  *
  * This is similar to move_freepages_block(), but handles the special
  * case encountered in page isolation, where the block of interest
@@ -2066,10 +2081,18 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
  *
  * Returns %true if pages could be moved, %false otherwise.
  */
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype)
+static bool __move_freepages_block_isolate(struct zone *zone,
+		struct page *page, bool isolate)
 {
 	unsigned long start_pfn, pfn;
+	int from_mt;
+	int to_mt;
+
+	if (isolate == get_pageblock_isolate(page)) {
+		VM_WARN_ONCE(1, "%s a pageblock that is already in that state",
+			     isolate ? "Isolate" : "Unisolate");
+		return false;
+	}
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return false;
@@ -2086,7 +2109,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -2097,16 +2120,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(page, zone, order,
 					get_pfnblock_migratetype(page, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, page, pfn, order, FPI_NONE);
 		return true;
 	}
 move:
-	__move_freepages_block(zone, start_pfn,
-			       get_pfnblock_migratetype(page, start_pfn),
-			       migratetype);
+	/* Use MIGRATETYPE_MASK to get non-isolate migratetype */
+	if (isolate) {
+		from_mt = __get_pfnblock_flags_mask(page, page_to_pfn(page),
+						    MIGRATETYPE_MASK);
+		to_mt = MIGRATE_ISOLATE;
+	} else {
+		from_mt = MIGRATE_ISOLATE;
+		to_mt = __get_pfnblock_flags_mask(page, page_to_pfn(page),
+						  MIGRATETYPE_MASK);
+	}
+
+	__move_freepages_block(zone, start_pfn, from_mt, to_mt);
+	toggle_pageblock_isolate(pfn_to_page(start_pfn), isolate);
+
 	return true;
 }
+
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
+{
+	return __move_freepages_block_isolate(zone, page, true);
+}
+
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page)
+{
+	return __move_freepages_block_isolate(zone, page, false);
+}
+
 #endif /* CONFIG_MEMORY_ISOLATION */
 
 static void change_pageblock_range(struct page *pageblock_page,
@@ -2298,6 +2343,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
 	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
 			page_group_by_mobility_disabled) {
 		__move_freepages_block(zone, start_pfn, block_type, start_type);
+		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
 		return __rmqueue_smallest(zone, order, start_type);
 	}
 
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b2fc5266e3d2..08f627a5032f 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -188,7 +188,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
 			migratetype, isol_flags);
 	if (!unmovable) {
-		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
+		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
 			return -EBUSY;
 		}
@@ -209,7 +209,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	return -EBUSY;
 }
 
-static void unset_migratetype_isolate(struct page *page, int migratetype)
+static void unset_migratetype_isolate(struct page *page)
 {
 	struct zone *zone;
 	unsigned long flags;
@@ -262,10 +262,10 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
 		 * Isolating this block already succeeded, so this
 		 * should not fail on zone boundaries.
 		 */
-		WARN_ON_ONCE(!move_freepages_block_isolate(zone, page, migratetype));
+		WARN_ON_ONCE(!pageblock_unisolate_and_move_free_pages(zone, page));
 	} else {
-		set_pageblock_migratetype(page, migratetype);
-		__putback_isolated_page(page, order, migratetype);
+		clear_pageblock_isolate(page);
+		__putback_isolated_page(page, order, get_pageblock_migratetype(page));
 	}
 	zone->nr_isolate_pageblock--;
 out:
@@ -383,7 +383,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 		if (PageBuddy(page)) {
 			int order = buddy_order(page);
 
-			/* move_freepages_block_isolate() handled this */
+			/* pageblock_isolate_and_move_free_pages() handled this */
 			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
 
 			pfn += 1UL << order;
@@ -433,7 +433,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 failed:
 	/* restore the original migratetype */
 	if (!skip_isolation)
-		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
 	return -EBUSY;
 }
 
@@ -504,7 +504,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
-		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
 	}
 
@@ -517,8 +517,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn, migratetype);
 			unset_migratetype_isolate(
-				pfn_to_page(isolate_end - pageblock_nr_pages),
-				migratetype);
+				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
 		}
 	}
@@ -548,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		page = __first_valid_page(pfn, pageblock_nr_pages);
 		if (!page || !is_migrate_isolate_page(page))
 			continue;
-		unset_migratetype_isolate(page, migratetype);
+		unset_migratetype_isolate(page);
 	}
 }
 /*
-- 
2.47.2

