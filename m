Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35822FE0A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877502; cv=fail; b=JVG9aHV3hOlnlIBPj4RhzYSlsEtx2tIz+VxcZMZtgQ1mr3i6H+GAsn4uJYBC9D8mmjQa0flf62QShjo3voGnipn6Go1uVT+yG7FGZi/R03w7LETvFgDDtcpcwqgleL2xdazlgaP6k/jHxk0n718NBnBG39opkS0QHTpzUjqBZ3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877502; c=relaxed/simple;
	bh=axbLy5kfGy7ERP+dTcLFkmbbXM7Moc9wuXGtzPhq7Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yo+dyhhmQL1zquahBrzXzFgxW4I8TIc1I6kgabVYZxPuL5zMRfcR70BFFam0REjdby4bDuuEmTP3G9PtqgY417I3X7QmzFspyWqVPxzmFhsbzsDi0IJRB5hVW+QYn2mmRax0T9H+OOoRJN2+oarvS8n99hVxVlNrqtcO9Y2Czac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U1xFUs9b; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U1xFUs9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtFlOIQI0S6JHqKzQnlM+Egg26AXIeghYtzNExiotf9S8ppGM8iiA3YbXZ9jvkc8whdY82fNr273IxO+zZ+6nzaIvgUwMAuqT8XEESeVFDXyTjrWY1WoNBjObzc6l5exDrYpVH/PC+UOVF5RYTtJjSjE/7hM8z/IQ60Ir50VDECD5YyfSRNLD6pXwb8VkO/U7uZiY4o458cdEvVmYCb+r2brAeuFLoUqp7quG+GJwJSoiOhrowkUur9tg0YrFiasOtsC7NnehYzzDv77iqXAJXHc/kf/543DGz6rwk1Sj3FlCjdfqvPyI+wxRDD9UU/pt1uqNnALU/2A8oGSnHlwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHKcI/NcdlxqGUi8fUIpIqJzLD2YbZ+F2c4iWBCvJbw=;
 b=ii3y2Nq8JAINc+sBABGrp3yTM6iWFCsSDCtSdL+9HEc//4GRX6HFkenhWWAp/TTtzv0THggjPndLNQjxlGhTWuFz0RKVXOZhahLuvcTAMY7of9Hd5s1k0nWoUbKuAfOrFCJudoEl47ALKRtD63NV7lptFKDydccmp67bHXuxRxYWt+oVO28ov6kauj/hTC16hv6R+qE4fYTPunhspE8UjKJ5pMT782WnhZROO04eQ563oS1+XubbfUuRJERY0V4udSefJVe8a9aVpyWmMfayu0f2vVyLK2KrAd19xEzbwwjYVGq67TxIcONl0IVeNtv5+p4xVLby8IgX/hzYivCYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHKcI/NcdlxqGUi8fUIpIqJzLD2YbZ+F2c4iWBCvJbw=;
 b=U1xFUs9bTTLR7EhJAXHVshyR7S3R3iTbEdifxHy5KE0eWCQ6MIfZZDj6upTkyxkHvbCVWXLT7DdhZrfbMVhoeUhAzyqQZzgGLcbqFWDXF16un8vDNKbSqCJ85zXkzqD/uj5lrTUoZa2KOk7doZUNzu32afBfq00VUt57J58VeASKJMfupfIad5kfOB8QIet2AJ1Gk98DW/9CMeJ6gDF0nj8Z7Gg/xpyqCjYBDV3gEideeX25aU2lDbaVVycAnOwxUXWKuB/Y7TzWEbY60a/OyPvuD6Hif9dtckjprPnWuAY2Nyfup/DQoHlmaUk75Lg2zIgBScDtbTX+M2I+V8PJOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:15 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:15 +0000
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
Subject: [PATCH v7 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Mon,  2 Jun 2025 11:18:04 -0400
Message-ID: <20250602151807.987731-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0345.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 750aabe6-8ed0-4de2-4ef8-08dda1e8b21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hxx1DPpqulA5k4FvIhMIfoBzmuUpSMEHNK4U+VTvRNkiNU/Setioo700UNB/?=
 =?us-ascii?Q?ahI9r1JIt1LBULhrRQH7wIvugUBb4tWPHGlsDSaTVDugqLWqrHebOEo5qTGb?=
 =?us-ascii?Q?GDPRfaEGcFDAF+y2Nvlv1A/7/8x9iEdeYFDHddyee0bPDnpos79GK5kXycK7?=
 =?us-ascii?Q?BnPcUiij52+w0wNEvdrESsx0+2K5UH1Vz6v9Whx8DWrRXdpsdixiz1Vh052y?=
 =?us-ascii?Q?K+qdOb1PhGu+FJ+3h4VmnNHHr4lMZ60aJ4Z8nOqikZ5oebp1hdjVyAcE7rhE?=
 =?us-ascii?Q?SgcmWnErQ3dSFIMcVGqoiMKB6kyQunwchHieKBINjZKkcQZtIfEZJb9K9Ks3?=
 =?us-ascii?Q?p1hAobtZg+/HoEexoq/yQgDaLJfxg8WutJ34xvlN/fvM64vkI9yhvOOgUS/B?=
 =?us-ascii?Q?o5W3DzMVDRnh9jG5QacB8aRjLt2dIZ3DFfkRbW49OMew3nSJ1FHUvZ7K+HFl?=
 =?us-ascii?Q?N3yA6z95NRd100psCXZPFL7YdJCIQmCn79qt1OYdECNiYjzda9foeWc/+VP/?=
 =?us-ascii?Q?nCLGkoDOywhBHxH4x4WUqj1VD/6cHcFRAE2LvztA4JlFqYpIjmE2UNAM+GFU?=
 =?us-ascii?Q?ntIdojzy7eaVu+JtTO3mCiPTM+6ConY2gZpSOMYus/hynzEfIBOjVJ9zGXs1?=
 =?us-ascii?Q?8ht/5qwWHXw7YtkXHM81okhm3GBAEcMaSKdpdcWPP9w7/RZGhAD3VqQ4j8ne?=
 =?us-ascii?Q?NWuumiW/lorWZIl447xQNzXLkdOesM82uEba1sOqcG+qlrd0JbjQF3f8olDN?=
 =?us-ascii?Q?I0mgP0O9BAn3xTTC6rqOO6bX4y2Mvxs3aBdPZ8Iv9TyHfe5kk79D+q0KJ4VE?=
 =?us-ascii?Q?pJhtyEokTWQ3AiSYwFZmzOdnK9QN6+Ll80DO0pDedkarbVNrRa+yTu5tQYry?=
 =?us-ascii?Q?6cvkoZT0RRzGmlv/OsYr14dGGOSvmrCmAF263nq0srVHzi8nUGG3j3D9btBx?=
 =?us-ascii?Q?6SoJFHZUasBjd3oLYnYIWWtxXvqq+jx2vBl6DKiZorvNuxxLmrNN0SWoknPI?=
 =?us-ascii?Q?TmV196iczKZer4aTIj+5Czp1j8EE00WhFQeULV9G0EkNV35U1Ixd95RaDWAq?=
 =?us-ascii?Q?nnjTVJvBW/5SE8NoCOSaKrZk7tdfsRm/soPljYv4ms7Lc6i28vhdfJkinXlV?=
 =?us-ascii?Q?shmSfi26MexcbqW1hHNY1f3MlkX83gb/JNPa41Of/NktHxxGnPsvkbEDByQ8?=
 =?us-ascii?Q?EkxWjqPWpKQaJYQgzFQcpby0LUOW7aaT8GfWKTNPcrUHbred3Fs3zJwpimY4?=
 =?us-ascii?Q?08FZbuY2t0fT3s/Le91qgDC0QuBJp4t2/mm8efa5Z0MgLn+RgQ5nkTUCiBT7?=
 =?us-ascii?Q?Oby809btRn3mUAXzyhqCz9EVYmIEW7UXt0VG4Ul8VUOvk6SIdjCEDOMZau6T?=
 =?us-ascii?Q?W7qTvis+7MRldNIYzVW3K7wyeUGfmXJEtfxYBYshQ2DU2kh5YYJxjl32pxXS?=
 =?us-ascii?Q?9cyJ5y5XyH4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2eTrf7SSvyJW2aIsztvAWO2sQrxJxgK4IEXMOY6ds7lhHKqLeRq6q5eKifeT?=
 =?us-ascii?Q?lzl27tIgdg4castnBGpdorUZjjjsr40pwkLEitjKAzLucwR8OOh+56gxvWMT?=
 =?us-ascii?Q?O7YNxPKuOkDnkENjycgbU5ZNHFPKqSBQ87chdpp3bKN8bz7qNsXSKMbXahjp?=
 =?us-ascii?Q?y1LD/b77+D47aGMG/4cPrZrOtYSzEsPLVfBYd39yITgkz6ZzA1G7zlUn2Cnj?=
 =?us-ascii?Q?+BpxFuj2kt862HPZgZHBAXoIAtxymcUGdkvzzKq9+KhEkQbQh7l9E7nro7lr?=
 =?us-ascii?Q?12mGAQ1Sm3Rl5JXTtKZ4TW7pqpX3cdqMdGrtXEvbdbJ/apVkVZLtykq8NBCE?=
 =?us-ascii?Q?L/lHOBLc3ctX1rBXp+He3Dvh2NthgQV7CFrnjpugG6yBlp5uXqBfau8JbRII?=
 =?us-ascii?Q?q4gCTVDnz+Cv6G8QC9QlbQWivt7WVuPjA/UXX9izukyGa8JPFjOU4j1Auv2k?=
 =?us-ascii?Q?anxWxvq0GD4s9Fw1BHmq8d5+zW/UreNp9DG0+r/ACAWWiOmHlw2VEjIJhRX4?=
 =?us-ascii?Q?cgSsVHeMBIZgkwCaBIJW86lL3vxLVbV5eO9r4rjY99yS+hby4MWXzpbXLo8b?=
 =?us-ascii?Q?s1LHViW4jMPhfA1Ixy4+Rp5QPFoMI32b2riEcqMIyBVLlxajkMoFfbda+LX/?=
 =?us-ascii?Q?hiPe9X4mpuGGamdLKWMIvlC+bHY6j/Gx2LIESLM4b/ng8lhhAhhaSeAWqxOE?=
 =?us-ascii?Q?Jhf1vslXjkvsOl7xgGBkGE7MlVF1vsHkonUyxL1HRaZE/up11FVe88LQsfcy?=
 =?us-ascii?Q?cbtraPZFxTCwqJMCW9cSF2kcZHzymTvr5bvxorV82A1qd6QWG2y9q/wg8WBa?=
 =?us-ascii?Q?QAN9gFAJ2t9KpDvVcoFUxdt6Evm+qnHBTPCt02NSxJCYafBWX3pvIlwL+9tq?=
 =?us-ascii?Q?QqPg5cZlQGfsWvtsioGxFgt0BPxACpI4ptWbsQPC9FgTC68jO9XUZ4fCn3gJ?=
 =?us-ascii?Q?oCmCJgyZFCIkiKGTTtgaxzjdKogH7Z5AYQy4mhBLox73+28u33nNrxUo9mK1?=
 =?us-ascii?Q?9Ggc5dAgJCroSBtS2bKVAyDoLH0Y3ARFaNvAXvNw5G0yE76VA1WkZjQB0fLj?=
 =?us-ascii?Q?IDBdSFiW1IBE5fqrv7yDQgTw6Mbk4wwTj11ZwQkNaX9ht9f27FBlBdtZ8JdN?=
 =?us-ascii?Q?R01IfoXa8rGk2MUe0KyhmpPRpk9MKPfczrwM19CUVw/53qnZ9NCwxzaepLTk?=
 =?us-ascii?Q?5emd7HwmiSNLiXyZecxmeP51jCUkQ1gfLl1APZSXlrpZqWEtMxTHtxuyXTzP?=
 =?us-ascii?Q?ZVWEAEtwW79nvT7DJwJlzXLaItQcU00nHt3kVZ5e3swR/oUtLpv4Xp7n7MQo?=
 =?us-ascii?Q?PAD8ceBCtSv31RAxMWSSwmpEkdImvUDrJ6icULRRi1ZkcYyun+Vx0qQUjZU5?=
 =?us-ascii?Q?JrkIhkZ55RTbiqvtFVgM9Bb0Yok9km//HfOBEJeYaBncEH6rJZTr5My4rr46?=
 =?us-ascii?Q?U4hnXPvidU23YUDFJdYuYbkgthRYckvLLTQEnTjZ045xg9ZqvQeiYh9TPA5N?=
 =?us-ascii?Q?TsAcvqI2oOaOSnxPtc5wj6BiPcvCeCMrZwJm215hJ/qpow+ZOrH7WQ5K16xg?=
 =?us-ascii?Q?S6j+3ncXmb4iUU+CMyNFOL+Ctp8WhYrCcvy9Fv4w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750aabe6-8ed0-4de2-4ef8-08dda1e8b21d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:15.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btfPM/r3+/NlNlXAVO+6BAxWiXW439Tdizqt8l/jV2957nM/AniykbiGc98FhCQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
initialize a pageblock with a migratetype and isolated.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h |  3 ++-
 include/linux/page-isolation.h |  3 +++
 mm/hugetlb.c                   |  4 ++--
 mm/internal.h                  |  3 ++-
 mm/memory_hotplug.c            | 12 ++++++++----
 mm/memremap.c                  |  2 +-
 mm/mm_init.c                   | 24 +++++++++++++++---------
 mm/page_alloc.c                | 24 ++++++++++++++++++++++++
 8 files changed, 57 insertions(+), 18 deletions(-)

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
index 8746ed2fec13..afeae59b29e1 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3319,8 +3319,8 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
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
index 4ce5210ea56e..16e3ad874144 100644
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
+			       false);
 
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
index 8684fa851b84..6e753ca2c338 100644
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
index 5de23eba0db8..92a368d38d77 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -544,6 +544,30 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  MIGRATETYPE_AND_ISO_MASK);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
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
+	if (isolate)
+		flags |= BIT(PB_migrate_isolate);
+#endif
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags,
+				  MIGRATETYPE_AND_ISO_MASK);
+}
+
 #ifdef CONFIG_DEBUG_VM
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
-- 
2.47.2

