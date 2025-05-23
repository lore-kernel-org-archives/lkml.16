Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8B29C339
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027609; cv=fail; b=mSBSx3gUQ3qAvb8qPDbvlGZO6LIlNbjt0ehICiBeJcNbnfYQiHmgSqVu6xL4EwedTLe3GZnqIdMbNBQACjFn08LblhWc3VerzTnIP/uzhpOwZID30SzUdVcKF2D+fgSj2ZXggsuojhH5eRU6uNSGMEhQI2mu8lthusppg6XU7Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027609; c=relaxed/simple;
	bh=OUdGfhRwiIyvvyeknpF6ODQg+aXrcpgxdAMOuwAKwz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K3HxjYMMHg5Ip5d7Xvfi2epVtWRIpdubgzngdt17zNvuQREmXtEuqUL5uu/DKix9VUAMwsSY4b/mNiQxsKcWd+n4lkHGyz3a+RUgQkpxberXNKwZV7FrG07E0EFK6beoHc9+3foikjlrY3HksYBzWYlyAaI1TWXs/G8canwcERU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pqn1CXOX; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pqn1CXOX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlgfJFtsj6e6vKoPrFT5khpRLFk4PWhNuGDUr0gB7YTMCtgNCJK25AIxaicfngnCxDjKYjkGzpL0R0Hc1GMlPUdLI1CTMyD+u11K2XVXuHfHVvX9xS+dc1ML4HfT7DflQAJXQMJGYMpUoLFY8Hoi9Ugbd2lboHx/eJz7g6tczVxQnIXnysxQZy1BoM6OBc44XLfVG1Qm0pTYz4VSMbl3aA5sji7CLHv1DG84ievMv9HWZ0UAeNk42EHf+lUb7Qpyhz1VhRDoZ7wLd6dFScyiKVyAkoqY3txxswW9cJ2sOU2+ro+cZ1MZlbDFAe6B7sbXnldo/8hxyOwZi/2fbrYmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTdTDcqx9F40HQdpZ8OgJjE0444u38OVVyqU1iKegxA=;
 b=vyisrwsZgQat8qnn0q2TWEnU4Gba+zvzb/wCWwRg01fRK8R6zfLia8p3IPodW6Y9ZFSrzst3vp7ttplY5COkRxevd8C1Cj/o+ScA02EtrRwGgpA3ES6m4PYr6OJ5yPKQHYkUnzBtu42bE01jFyX4gwM1RTyRyIimlFN2fjTKfkFPIw+jgDaArcRb6waXaPBSutOg79ECuE0+ZZYEln8+XZOcdQjqEzkZoEf+1jbG9Q1bL5ueOfMVL5eMXWuFCCTM0N4m+txzrO/A3yj17u/N8CMTOp5o2rxHreXVpB1FvXyoRYM9TetXjehLCDEASxTPmzPW/ZdMj9wYrUESLK/U2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTdTDcqx9F40HQdpZ8OgJjE0444u38OVVyqU1iKegxA=;
 b=Pqn1CXOXZzqTlf0BSruSHhyT7WlzW9TokYIawAMVkB2SGuACveKQVybP1gaEyWd2vo8ifq7GUw8yoKmDG71YegVrL3PrNp1141FFOAxVnP1gmygCeYSPKdt8TYAPU8d0cikJ7BeEnswzLIZa4iYT6HjOGP2mDViDQjNZ6Ws3upDXLbXiBQhL7G40QEqm/UiKBJeMVB4tPlU+oBbExUSsqwC0wdjk7g2IGnZ8j2Jt7ioh9gxcSKNBTRYpIbr5OEB3FBz/sKjDRJ+ha/2R5pjbI9fJ0o0TIeIIOoHp31negY3f/Phih8bdjkeM3ygdmxL1QNIM9B1NshPSKf9SE++pBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:20 +0000
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
Subject: [PATCH v5 4/6] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Fri, 23 May 2025 15:12:56 -0400
Message-ID: <20250523191258.339826-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:208:256::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: da989298-337d-4e89-b766-08dd9a2de168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uK5iok49NbCqPt67K+ndUSinvOXHA0aQ66+SZsGr7UUwzmUkXYxfQT6a7wx4?=
 =?us-ascii?Q?jsGXOD5VhknNUdePwOVmPjBpgQHZ72dqYHhUSJeJXMZUzubE96oTUFiFZbJW?=
 =?us-ascii?Q?sdLbhV8v8+4UaAUHOcvq3GA3NybfifWSVFekmJbqqNUAQ1NYbvt//OeSqplU?=
 =?us-ascii?Q?1tCH/i3CAO8YJpvzWPFHpwgLqaemb9l4D9wbWSKeCvSZgeo1m6I0Z/XNrYDB?=
 =?us-ascii?Q?1CiO/1iNkpzuhjmYyQkbcmj/aLSZl37DzaB/yom23hCFst/K3kiYZiD1TmTl?=
 =?us-ascii?Q?Cvfm6iQpWlNf4HZfka+pZEJKEMJy2q8kmsPbhWpW0LDG52XXv1RZSP2XQwzO?=
 =?us-ascii?Q?zrkRmihnpc3BIQiYOm68ZzHI6V0C6EL9dddkBzUCjgafSJLLLUyphXeV00y/?=
 =?us-ascii?Q?Wey2IF5NrtgAWGSYVFzejK6erL5E9Gcw5OLxTfdmDHx+S7c8h5LelFrijeUC?=
 =?us-ascii?Q?aWw8iyTO9Tx64sxNkTVnPvIToIAC5rOWrUVnqAbAHRwGHO3rHIyzV5VnKxGe?=
 =?us-ascii?Q?ZftMqJ6QrLr4vs0EU2rJOquHxWilrElvnsGofpu24YgqeT5AScjZd0Tjnqjb?=
 =?us-ascii?Q?lBRO+mZ+Rj3FGZUd+utaqiKDx2i+3QWkZyVOD51fMmbaWbCUEPjckPmEd1Fu?=
 =?us-ascii?Q?zpAXhaVI/UweLzUsuUDvedpQjX1jHVyIEsQM/H9cZyP8n3a1u4yLmaMjqBVI?=
 =?us-ascii?Q?xwIgS4YqvWt+yT2QyiQBv/9u8zBAIXEuo1wQbf8Lx+kB2XA5sNwHtfWLp37d?=
 =?us-ascii?Q?IUl2yN4PX4dqleC2GkhdANp1NCQoSm8mD9cgMecKxHRp/ClGJhcWaNW+kEv5?=
 =?us-ascii?Q?N5O2fDczqj9reU5z5YVD4om5m6jhJMe7xrbyvsMlrap1u6pnf3ZSFtpUqRnf?=
 =?us-ascii?Q?Qp1I0T5FrGtTqnk7GNeVCNFMGGt+OF/HxqhPgjbTRgotT+YHsItLIFU2TDXk?=
 =?us-ascii?Q?zQ5fCp2GbnG5nhUHI0XAlX2cQKoEybeCVkgWjTaWC9x+TmA53GhuYPD11bfF?=
 =?us-ascii?Q?57TVizePMm29gr/D6cW0yAuN5jHOEbabTl3tmHv0cog4m7K+blez1gpmY2Ky?=
 =?us-ascii?Q?pLFJmVMAtj5D3M49z7O0RA++iO1uKofuYuIRrw2pMXDwX5gLgEwmv/qw3wlZ?=
 =?us-ascii?Q?erRtK2AfGA37u/wGZyRPLiqLIKvx45V2ryE4SS9fVwiU0NrfaF61KJgRgNPT?=
 =?us-ascii?Q?XFJuZe+qEDXLs7hfPFTUCU1/jcsTafan/DUICOL9txhByf+K2mG3g1ziL/BJ?=
 =?us-ascii?Q?JaJTnOXJTG6jvu+nOroa6b6eSxqsTDCVjVWhoATQVqgeLG6leoQ6EvHo8uEg?=
 =?us-ascii?Q?3zS7EIq2ZdOgn+/DOprAO0/LeSbz14J3gAePlK2bpXrnwFlYDC7q/EPCHzLr?=
 =?us-ascii?Q?cqUrtxRQA87bFGNcIB6m0+FFHfSJWZQ/dv+xSPHuFyDU6oAFvXVPu87UyyOU?=
 =?us-ascii?Q?A7qZ4S4FNwU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CZnlsABu1+p87v5ckQfqt8fvub40tMXxqYSyeGA4JkUUz9uI5Hyj+oNGDs4a?=
 =?us-ascii?Q?sGK9NwT0mCQrqr0hPqo6meWrpstoA7Yg5TWC7mUAYQl4r3OX5vP7r++tFAuc?=
 =?us-ascii?Q?hZRXeBAkR/c61NKE8qKnXL7ME5gaUezT6Y85ABK3GC+Aoj6moAKJy1V8MrwY?=
 =?us-ascii?Q?OR/Thry6zt4SNx5TpOlR+Ef1tyiPRo5mdN1IUCltyZqVeEuO0r60ages520S?=
 =?us-ascii?Q?HHYQuaTMj9AF88y0DeYyeGO9PGO/r1EaAC60Hux77l8iZT2kCp/1hq4yd71v?=
 =?us-ascii?Q?tl+2d96Aa3+uiTnsdBeTlsSG24DUyJ4SdiLMpM+ZM2RQIrUnwk2SzC+qDAI1?=
 =?us-ascii?Q?U73cy0r+Hq2bsFKVnQSHoWyBSFyZZn+ujoqJJDP117ZCkXOTYwD9rzB/cjFn?=
 =?us-ascii?Q?i3ec1KMgU+qGfNu44En/lgi1burWRL11Gk0NurJ/rUN2ppigZZsaPQha/ZQc?=
 =?us-ascii?Q?7Sk2uWQyOwF/MuLVyjO/5OBIWe2yvY8JFO27Z7SgpLR5OUZd5xELLKTPHkXi?=
 =?us-ascii?Q?lPV5n3rNcUtZcvMZ/+ymmoakoT7h2bGp3pIDa8G01uSbMhpahJqRIXybQHBI?=
 =?us-ascii?Q?BdJSmeIMPhcM9vNB6XA+7XPDpXHDXbnfoi2oSiiXVypNxneby6L9SeE7mXOu?=
 =?us-ascii?Q?zMXrTthaN6i2imJBAR91a2a0Cx26wXtW4AEJIW9RbOHfJ6DDt3LvSeARR+FQ?=
 =?us-ascii?Q?PU/dD1SxH7A/L8aiXEYMBFEiZV32SXm/APYxIoVak5wrL9EeWuslSVm1P2Ws?=
 =?us-ascii?Q?+jM7W8NAcFsDkTMuNjaznAux997J/Om7Xks+ndALUTl3kvmrX2CyfYC1ftBD?=
 =?us-ascii?Q?5QolJILoc+bBYOCBbC8QhDQBoAoY/X7GYNPKa08bSnULsBD2hcExhacSG4rR?=
 =?us-ascii?Q?8EHy6OIxyJkQSmThC/F9xmjB4889H/6ENkd5JKm93qThmYZva8toYm1fBcRe?=
 =?us-ascii?Q?duv9v39/Lsft0EoDU8TCYF9MFghFy5eRQZIC6xsFgWk+9Gr25EHEzybjZHGW?=
 =?us-ascii?Q?miA0AFIiBO0nkC+6LWoUdGtH4UnWbgMfEEh+C6NkIh7wmllzHPcgMBmiMEaS?=
 =?us-ascii?Q?pEIsZLnethJrZPQl60zQjd3FJltMpBsAuykPshw0BwnLQ7/boF9+gKksmku4?=
 =?us-ascii?Q?Sa8AUqZDdctv4vsg2F7/BWjrqeL0XP+ybmN8nHi2GHY6A/IuyGJdC0YIeumE?=
 =?us-ascii?Q?RmOnvWj9S6W/8UJwcPazPxqOUc3sSzd/NlDd6q27QS9d0Hh4q6eBduIkHutI?=
 =?us-ascii?Q?kBKSpHBteKpiDmId1Na+KkrBaDrPb2yekCOj8mw20a3DIXk9GSaQiF+B58RI?=
 =?us-ascii?Q?pIyXpNuMHv4nVrMejbUhzf3iNx7s358NGkTBvP9nk7TnSw2vwYxr8qDKEHpL?=
 =?us-ascii?Q?NDRS4BrEYiCw/N09a3lJnEJQYhYaEf/Vdjr1To4sD5QOVt46EMILxQVT51B4?=
 =?us-ascii?Q?gu8rdadFgd6okM91OgHzAEVRXMc7YA6k0wa+lxfDJ9kCKNkzNPnuxh0ylytY?=
 =?us-ascii?Q?4gKXpDOE+reX9oajwQ5XEb2jY6tMiSRcYSisPE0d8zeULYvQfk0SyozrbA6/?=
 =?us-ascii?Q?9oKktmYMKtj2a1HknIsh0BKnGF3SnJ1BRrv2oXtB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da989298-337d-4e89-b766-08dd9a2de168
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:20.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1EivfHWH1RkJs2BRGjR72sjNq/091CerWpkCNjz/YDuUf6RVgbV2WjGyeJMdBfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

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
---
 include/linux/page-isolation.h |  5 +-
 mm/page_alloc.c                | 97 ++++++++++++++++++++++++++++------
 mm/page_isolation.c            | 21 ++++----
 3 files changed, 92 insertions(+), 31 deletions(-)

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
index 8fcbd7fa13c2..44a08b1a9de4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -524,13 +524,36 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
 	__clear_bit(bitidx + pb_bit, bitmap_word);
 }
 
+#ifdef CONFIG_MEMORY_ISOLATION
+/**
+ * toggle_pfnblock_bit - Toggle a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to toggle
+ */
+static void toggle_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
+			 pb_bit >= __NR_PAGEBLOCK_BITS))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	__change_bit(bitidx + pb_bit, bitmap_word);
+}
+#endif
+
 /**
  * set_pageblock_migratetype - Set the migratetype of a pageblock
  * @page: The page within the block of interest
  * @migratetype: migratetype to set
  */
-__always_inline void set_pageblock_migratetype(struct page *page,
-					       enum migratetype migratetype)
+static void set_pageblock_migratetype(struct page *page,
+				      enum migratetype migratetype)
 {
 	unsigned long mask = MIGRATETYPE_MASK;
 
@@ -540,11 +563,15 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 
 #ifdef CONFIG_MEMORY_ISOLATION
 	if (migratetype == MIGRATE_ISOLATE) {
-		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		VM_WARN_ONCE(1,
+			"Use set_pageblock_isolate() for pageblock isolation");
 		return;
 	}
 	/* change mask to clear PB_migrate_isolate if it is set */
 	mask = MIGRATETYPE_AND_ISO_MASK;
+	VM_WARN_ONCE(get_pfnblock_bit(page, page_to_pfn(page),
+				      PB_migrate_isolate),
+		     "Use clear_pageblock_isolate() to unisolate pageblock");
 #endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
 				  (unsigned long)migratetype, mask);
@@ -1931,8 +1958,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1964,8 +1991,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -2023,11 +2048,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
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
@@ -2055,11 +2085,16 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
 	return start_pfn;
 }
 
+static inline void toggle_pageblock_isolate(struct page *page)
+{
+	toggle_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
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
@@ -2074,10 +2109,15 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
+	if (isolate == get_pageblock_isolate(page))
+		return false;
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return false;
@@ -2094,7 +2134,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -2105,16 +2145,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(page, zone, order,
 					get_pfnblock_migratetype(page, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page);
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
+	toggle_pageblock_isolate(pfn_to_page(start_pfn));
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
@@ -2306,6 +2368,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
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

