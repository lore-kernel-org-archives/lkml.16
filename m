Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F329B8F7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027607; cv=fail; b=uF48l7LAHVEbP1QCfzG4xt6wfpz+uPc34tS78+/Gmbaczqryy0vfqcANezT8tVQaI9oApXKvagazOAU9q72qgkOEwmdN/+W5wR6Iu0OyW5U2MGIQMXCOiOFRhprhfZBDbclGN8GgK7fet24+voUl7Le+JnaAov9w1Hlaxou77Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027607; c=relaxed/simple;
	bh=6EWWL7W9ceh4iOFdwK+4zl5iblwWh90pF7L6+PUiux8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mEcoru7AldCx+bfFcfiUG2kwKbb2GWwSu/IM0SskGzwpdYNQmYDjrArtChqKaOw/Tin+5GSIC1n/BCU623REXTi562TvtMnplEC8TSAnVwJPMwBJmjJ6UYYkMA3WwZTLmLguZabZ07kfQRRbSeWAQBn9iOH0+6cQspWQ5U4yR6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RcaBvYYU; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RcaBvYYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyl1A+DoK9trSyXgkB/ApTTTFhtbrQ3y6hFXZvwhB9pN363jdgBbHnJyEDG2uRVlZZQ4SB4vsgYQyYOAK5d2zU7vx3dNfSri4zlBri5RgHBf9uTJE15rV+0bw7VhpzBIXh8+qaXDSdRH7HByRSFUwnBm9W8MAgcidUv6WFNvjGYYmciXolXRCm4sr5AfmVK7ZWuEc8BGVuLeGkvw+CB86cEh4q6BTj5wRZ+BQSQnzbgJjkQGccLGtuvSKTyw3mepGTaV2CSBmNXkLvvxxc8h87Mvg9iCwqpoTQR3NdIZVF4EyLgyO8fSqIze5Ldkn23e4yhYsROHzHYc2BBB6/GxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq6BItPI7CaktlEy3uoEPSTvMgNx147oHoj3GeZ2Mgg=;
 b=WIq9JpvGbLPDvoWN+aDiSLV5LfSBDUxT8IFp1F6fBoplRTdEsnGqr20UxoZdD2USVP4gpYedzcu2tFoceF486RTWIBgTwdi3FzaogvnWCKaCMWIWG3tQZVpBvP32A+yZxES0mVed+6XoO3ocj8bLvm/VyJhi/gnIs/hI+E7xhS/7ESqz6ON+q0vHpgLTK4OHaE4xbnYqYnIwPfkpbFISRhlIU4hNny/k5IXHraGr1RPMYvSjcMR8eot0VgkxLChndcpzG95aSF0UMW3DtWafjC5+qt6PjfOMtaVwnYSlzegreQ6avjuAPV7C1hdpSKwedBJ9ndSDDb6cjMdWxtlbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq6BItPI7CaktlEy3uoEPSTvMgNx147oHoj3GeZ2Mgg=;
 b=RcaBvYYUK7cxl+ab991uenX9tkozmYsJ2brh9RKY5xnroJaau1iVpmAqpi5flodIa0yjLYPUhljMFwGt8QdUh5kV11gnGnAPo604ReTYKL6uNIJevSaqFXbQUUAUN+E6xgu/8OzbJFnzuQwd7g/+J1t1r+FrxF2JsAu0DOOXJbEehbkF4Rs5GGK1koEhgNqSng2KSZ7qIDJEL2ha9t4OpYXmnHRzDoquW2A7kVqLQ+IQU7atVnuLNgvN7NThdvGj6PEworLEXLJ+FwPF27dcy4LEVHWkKxeV/TkkfBFI/TFi0eLHyP/yxmCs/noQoo2J2HWekmIi+Zc+riXHCNzrLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:19 +0000
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
Subject: [PATCH v5 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Fri, 23 May 2025 15:12:55 -0400
Message-ID: <20250523191258.339826-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:208:256::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 179ccae7-60e5-407a-242f-08dd9a2de0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1oTAJ0smVHD7s7dd7VNNhKpPzl7jkzHbMDAQs40d0GJms2jZx4ul2SFOkWE?=
 =?us-ascii?Q?91UwzrgmWdi59qDnjo/aFreIa5LqOsj4goGoce5c9N98xyBGn34MBtdfM6iM?=
 =?us-ascii?Q?wt/UyUZ+7Tlz0jRGXq05M5HURQhGRFCSBpZkoBG3rF1QaMd/eswVqjKzaJQw?=
 =?us-ascii?Q?E5SJZqfenPt5G81cU+OPG/s8kh/lsrb5egNBxMttokeHsQkySV2OjUH86v6A?=
 =?us-ascii?Q?o7IztiKPC+Sk0ggL9Q2Mu1HVZvWYk3fRoXMmppBT3GXtNRAjaEqIYZ0NFUKw?=
 =?us-ascii?Q?DISXLhfB3MwTF/Hs/1igoKJY06F1gTeP1rPcXnV7nTyC/4Kgu8hpV9LAR5Da?=
 =?us-ascii?Q?9Z0/gtw5/32Hupp8Z3v1wSyySLdbusnV8g6pmLWnCMv1ZLJ4lDiqdB6900Tj?=
 =?us-ascii?Q?MTyGaVVGExLFB1TzXoyjpiHNAO+upGr/r00Y+6GsQZwggZlN2YxLlTBADtbw?=
 =?us-ascii?Q?+FRmeNB6BRWtaj8gm0uilEsheqU+cNtEWfaTRC4L4CJ246+OWfsvHTI/eoQk?=
 =?us-ascii?Q?1xXw1iuLKTjSYigpa++oa7EN1HaIhcZAYRYuuiWX7M39X4LBjUYnSaxpbM8C?=
 =?us-ascii?Q?3PvyfE93cxb2/bXteuE1+vEZgcVkxJkK5Hph/gExFEmKojnptulDxCbRzmoq?=
 =?us-ascii?Q?y/40WTNxMyXsPqo9vpzJu0Eq7CTVwXBC4m1++9wbN4lDsnETQ5mUsSpeySwO?=
 =?us-ascii?Q?jYqOMz3Q0LOHiyvdSy0V2MyRgqjajCiCpzMak8O5AMCXTqCNpuQRKNSWcnmb?=
 =?us-ascii?Q?WuAckB5li9Ppcl1iDBO2XMBqW1AeDD+jbPXeFYfNgWmMTPYnSgfoFCEIPxsL?=
 =?us-ascii?Q?OhDpjBxCMGbrceb0iriA5PbIlC2Vxhlwm38dZ9k3ruKCU6ggIH6WbbgtW0lg?=
 =?us-ascii?Q?Xzn6HB6iTqq6Z1lv233eos5oEBGP7jqk+ZZJAAFr0jL5fkc5R5OsIGhRMQY2?=
 =?us-ascii?Q?unB2Zd9VvfP61gvXj7Q1h/pGeYC0chLDBkgVIpzpluKghOV6Z789ackqI96B?=
 =?us-ascii?Q?QXbl2LrjjkibHShvOWmo/1ks8tqw7fFMdTTmx++NwuS/TQANTnTXnyMjtmZW?=
 =?us-ascii?Q?/b0RF1RNfcHTJYPzrDu/Qm5FkIJDpUZDm/GQ/CI7kkKzMDNSlrewR4R7nGYl?=
 =?us-ascii?Q?ReHeypWmQ2SVBHvk5lkw9r55nfy/Wejzvuk6qhhN0edmXcOwNJ1BrspuBw33?=
 =?us-ascii?Q?x+6OvH1unSX1m71fGmiHSb3ZDSbjuyhErrFLHQ4lMZww0DykLu+AQxnI+E2d?=
 =?us-ascii?Q?LT3H3luP4td670J9eMBbA4IOgMJ+dUKF9t/eaSsR3wXme50c8iJtrGGwbSre?=
 =?us-ascii?Q?dzNZB6KTXNybFX1Pz/duJlc4QqHUz1mGdhX/9VjtswGECxtTqK8D1NtG6BCr?=
 =?us-ascii?Q?bAxrhXndz4Qzy7hIgTBpgUdpxY5YpMZQm1ljgG466jngvAgv7MV+uI54zWq2?=
 =?us-ascii?Q?qt8AIEoEyaM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vHJIbvlXi8mblhg+A7aXVfb/Xz5Ga5zTfTqzlD5xio7R9hwMrXY3Qi+vL6hR?=
 =?us-ascii?Q?ZuD/lzZSEMglg3KXxP0nu5Aa4S045NmYBPTsKue+Uo5ooZNNE5vqELvSa2q1?=
 =?us-ascii?Q?szSHGVAVoAsHgQzYSNNDZk7NeJP5+/9nnGcsJgeN3IXsm/xhySfbtyCCkAZc?=
 =?us-ascii?Q?LmaZDhEVzd5jPArCL1pnfOAGTf9AKe470yGDnLad4jcKKPPRtQRHyh+DQKS+?=
 =?us-ascii?Q?9/fLBRB2CQ2FkLRb0hFUUOdpiFm/ST9ghe0IZCctP4Z0i/UqYbfNgPwan3ZQ?=
 =?us-ascii?Q?G85voAPt0v2nR4RKBz7u1rtDFDe2Az/dKtfM6+cu9xacTGs6cHD7UERy+Tre?=
 =?us-ascii?Q?ii8B4urFQ/nAwSPO8sqkNHALyJnDXePIteBsSN0eKO2V5S4C1IBKVhROOvNt?=
 =?us-ascii?Q?n8vQNKsrwcChtlhH+09BS0W/mRogsJkP/cO7d+cGLTbklOWcQoQ+vwSHIAOg?=
 =?us-ascii?Q?RXBzcdq+EMhvWcu2rz4jcVuJ0ybuBtVAVhlgcj+y9F8IylTYlTbGpULA/oaT?=
 =?us-ascii?Q?rqlXpB2om+f1La9LJ0zrHj/OsLp0fAbxkKmxKnDUynSL9tIayxQpKlkuBonr?=
 =?us-ascii?Q?lHMUG457xvapUPAKPLkeW/kDpB68CcnzUOvJ0doKe577wlhl5XeSRooTD+nb?=
 =?us-ascii?Q?re4U+B46UlF02fdQCUsaXlV3LAzR3R5CV4ljjKs7T3748lfQS0+s4VhQum6P?=
 =?us-ascii?Q?mf98NC72laFazRtqcMrhF+RVhh5RlWufT2y4hUM+30ESTNmuWt3uXLVi68rK?=
 =?us-ascii?Q?KNYl6JuvGP4A9BMZvJ91ZMy3A5guuWjHgY/aFHyvepMvFZ4JxtOwzMLjZDOa?=
 =?us-ascii?Q?cYIJs8s6xsCM2WTXBSTlTXCUUI5tCRAKheDagVtEABwyST9UQ+rGiIzS6Ohq?=
 =?us-ascii?Q?lAwGLRiLJnXsr1ZYyRGstpfHyVhLnLJE6W56zueAoJ6Arnh7GyQtfab+5WEr?=
 =?us-ascii?Q?zTMiFZsNPlOjOzWldK7OwOAHgUt5/zAtF6kuLQ5FSXSBSY4hQYomjZb93rP4?=
 =?us-ascii?Q?sEreilgt6X7iGQhFyWTjbrISp+QOfS1fKgERfjFU+RewdexjErCuLW2nf+as?=
 =?us-ascii?Q?3MBKe4tfzN77AMrJEr5tD4dyanzS+n3ZwyFDEMxMJy7dW6YfWdUCUQRa1XXq?=
 =?us-ascii?Q?tsYuECLlReQp4S819zH4hZW6/OMQGFbZzMpcw/2+gE8eVy2w31gSwdkyv+Et?=
 =?us-ascii?Q?LoZz7yBlOhK/LSxQChvvb0BdEJ6dlm9vcL5oxO46u7TSLKbff0HyEIZ8dTT8?=
 =?us-ascii?Q?7uPmB15t0e82ZbBTSFlmcFJoBZONDku7EkSNYijapxBDoDQ5m6zaWfTh78T+?=
 =?us-ascii?Q?+EQ3vpWn+2L8F1IZdVl2c+wDY7EQEPFhyzZx10Di97tn13cgbD0F8Z1Cc7y8?=
 =?us-ascii?Q?PQdXAZ/2VEtu2zUnO1ZwebD/kUdjT/69y7s6g/vbcDH0e2fNVVOVgt27bhbg?=
 =?us-ascii?Q?ee0s7JT+OzjfGbm2m7QscpnKjk+y8cx96Oludx6azmHBsmMthiEFUxK7u/Ct?=
 =?us-ascii?Q?QM5RtOPmUpgWJUrdbWJYYAFO8EH7h5hgvP8X4VWS8v7X6razhtI7mYkhQ0fC?=
 =?us-ascii?Q?zyuoBdzrqAooFkFYSI73vr2Q1sJYd/+zYfBiR+ue?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179ccae7-60e5-407a-242f-08dd9a2de0a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:19.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7k9tTiEGGq2WFhU/VXTDR6QHAc0X8FXSvNDo+d0oxUa5W+rq07Y3uH5IawaJ21F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
initialize a pageblock with a migratetype and isolated.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/memory_hotplug.h |  3 ++-
 include/linux/page-isolation.h |  3 +++
 mm/hugetlb.c                   |  4 ++--
 mm/internal.h                  |  3 ++-
 mm/memory_hotplug.c            | 12 ++++++++----
 mm/memremap.c                  |  2 +-
 mm/mm_init.c                   | 24 +++++++++++++++---------
 mm/page_alloc.c                | 26 ++++++++++++++++++++++++++
 8 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index eaac5ae8c05c..23f038a16231 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -314,7 +314,8 @@ extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     mhp_t mhp_flags);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				   unsigned long nr_pages,
-				   struct vmem_altmap *altmap, int migratetype);
+				   struct vmem_altmap *altmap, int migratetype,
+				   bool isolate_pageblock);
 extern void remove_pfn_range_from_zone(struct zone *zone,
 				       unsigned long start_pfn,
 				       unsigned long nr_pages);
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index fc021d3f95ca..14c6a5f691c2 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -41,6 +41,9 @@ static inline void set_pageblock_isolate(struct page *page)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate);
 void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 5a0bf1ea48f9..001c8ad48819 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3311,8 +3311,8 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 		if (folio_test_hugetlb_cma(folio))
 			init_cma_pageblock(folio_page(folio, i));
 		else
-			set_pageblock_migratetype(folio_page(folio, i),
-					  MIGRATE_MOVABLE);
+			init_pageblock_migratetype(folio_page(folio, i),
+					  MIGRATE_MOVABLE, false);
 	}
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 6b8ed2017743..c43180bea6b4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -821,7 +821,8 @@ extern void *memmap_alloc(phys_addr_t size, phys_addr_t align,
 			  int nid, bool exact_nid);
 
 void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
-		unsigned long, enum meminit_context, struct vmem_altmap *, int);
+		unsigned long, enum meminit_context, struct vmem_altmap *, int,
+		bool);
 
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4ce5210ea56e..43ac34ee8d2e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -770,7 +770,8 @@ static inline void section_taint_zone_device(unsigned long pfn)
  */
 void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				  unsigned long nr_pages,
-				  struct vmem_altmap *altmap, int migratetype)
+				  struct vmem_altmap *altmap, int migratetype,
+				  bool isolate_pageblock)
 {
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	int nid = pgdat->node_id;
@@ -802,7 +803,8 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
 	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
-			 MEMINIT_HOTPLUG, altmap, migratetype);
+			 MEMINIT_HOTPLUG, altmap, migratetype,
+			 isolate_pageblock);
 
 	set_zone_contiguous(zone);
 }
@@ -1127,7 +1129,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
 	if (mhp_off_inaccessible)
 		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
 
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
+			false);
 
 	for (i = 0; i < nr_pages; i++) {
 		struct page *page = pfn_to_page(pfn + i);
@@ -1192,7 +1195,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 
 	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE,
+			       true);
 
 	arg.start_pfn = pfn;
 	arg.nr_pages = nr_pages;
diff --git a/mm/memremap.c b/mm/memremap.c
index c417c843e9b1..3319e7cc2898 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -254,7 +254,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
 		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
 				PHYS_PFN(range_len(range)), params->altmap,
-				MIGRATE_MOVABLE);
+				MIGRATE_MOVABLE, false);
 	}
 
 	mem_hotplug_done();
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1c5444e188f8..a3d9ea02e07b 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,8 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid)
 	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 
 	if (pageblock_aligned(pfn))
-		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
+		init_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE,
+				false);
 }
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
@@ -874,7 +875,8 @@ static void __init init_unavailable_range(unsigned long spfn,
 void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone,
 		unsigned long start_pfn, unsigned long zone_end_pfn,
 		enum meminit_context context,
-		struct vmem_altmap *altmap, int migratetype)
+		struct vmem_altmap *altmap, int migratetype,
+		bool isolate_pageblock)
 {
 	unsigned long pfn, end_pfn = start_pfn + size;
 	struct page *page;
@@ -931,7 +933,8 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 		 * over the place during system boot.
 		 */
 		if (pageblock_aligned(pfn)) {
-			set_pageblock_migratetype(page, migratetype);
+			init_pageblock_migratetype(page, migratetype,
+					isolate_pageblock);
 			cond_resched();
 		}
 		pfn++;
@@ -954,7 +957,8 @@ static void __init memmap_init_zone_range(struct zone *zone,
 		return;
 
 	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
-			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
+			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE,
+			  false);
 
 	if (*hole_pfn < start_pfn)
 		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
@@ -1035,7 +1039,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * because this is done early in section_activate()
 	 */
 	if (pageblock_aligned(pfn)) {
-		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
 
@@ -1996,7 +2000,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 	/* Free a large naturally-aligned chunk if possible */
 	if (nr_pages == MAX_ORDER_NR_PAGES && IS_MAX_ORDER_ALIGNED(pfn)) {
 		for (i = 0; i < nr_pages; i += pageblock_nr_pages)
-			set_pageblock_migratetype(page + i, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page + i, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, MAX_PAGE_ORDER, MEMINIT_EARLY);
 		return;
 	}
@@ -2006,7 +2011,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 
 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
 		if (pageblock_aligned(pfn))
-			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, 0, MEMINIT_EARLY);
 	}
 }
@@ -2305,7 +2311,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
 		set_page_count(p, 0);
 	} while (++p, --i);
 
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	set_page_refcounted(page);
 	/* pages were reserved and not allocated */
 	clear_page_tag_ref(page);
@@ -2319,7 +2325,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
  */
 void __init init_cma_pageblock(struct page *page)
 {
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b2c623699461..8fcbd7fa13c2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -550,6 +550,32 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  (unsigned long)migratetype, mask);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
+	unsigned long mask = MIGRATETYPE_MASK;
+	unsigned long flags = migratetype;
+
+	if (unlikely(page_group_by_mobility_disabled &&
+		     migratetype < MIGRATE_PCPTYPES))
+		migratetype = MIGRATE_UNMOVABLE;
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		VM_WARN_ONCE(
+			1,
+			"Set isolate=true to isolate pageblock with a migratetype");
+		return;
+	}
+	if (isolate) {
+		mask = MIGRATETYPE_AND_ISO_MASK;
+		flags |= BIT(PB_migrate_isolate);
+	}
+#endif
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags, mask);
+}
+
 #ifdef CONFIG_DEBUG_VM
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
-- 
2.47.2

