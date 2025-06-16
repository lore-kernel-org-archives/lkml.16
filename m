Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4B285CBB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075838; cv=fail; b=lKUPHpUHHBTzjZETTHHznMZbZVgERce3fRSuS5sB4j329qQ3gwsCvxgwz4VPe3hcwSWHm76VxfnModW6T3zO0azBhxlkLH+/JzX4Vlf8bwvVUzzvEE4t7OS6g+TkrsEkOcYC6OfGwSSOLb5ZiTMPIPhty1gtVg/CaJRXBX/A7SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075838; c=relaxed/simple;
	bh=EGWpb/EQeiWMZrEmUAFVy8Ia/PUL5CuUPfNWpAowAFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+qHzDE2P+C+H3FkIqB47OxioW7Xa4jmOC0ZBsZYIkPXX+3hOFDiR2CJPDurCmB45Yke18/YllPelLS7Wy6gzRApyUN6lWRSCyVpo/vOE6uk74c63NeiYhzxG1rym6JJ1PR4//mXPxlTWAXmArMzMowhFLoosoSmmXAKk/K9kvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I391AgzB; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I391AgzB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOQ73l06nGu0tEJq82MjHNPiWjNgtef5V8P5ToDp21Oy3G7wtpLS4dt8UhgiXO6jdWugAtinylN8prCTQXNg/Fm7ZnGqK8emi8K+X+qZbgAoVrVq5IYTK7DvcT4BIYbAcEnQ6VkpGicH/LGK54Zba7qAbWWcxnEvu7ga4R+MkQRfWs5DMu34p0KhLHY+n0ChCdNfYMDxt4QaIIi0tp60BFMSXIiX51NLVLe9VpUjSbn59SGoSH0VGxSbGjUZmP2H3xE5VpmPF26uVYsAkuGLXHk7DTpBI3oc4IU1NfLsICb4P62fXpaeFMRvmjwitrelmWehbJDohTGKc4HnqSiaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxI0/1wZBlRnZRVuH9jl4pcmlwXpkQJNlOlcwtgHQek=;
 b=jIzLuaj4RxJ+6A/otBUCLYnY1xeXQ3E63QyNiFaPNpy7oKuy98gpxyBkB8W9pDfgsrkT9sw6xO83PhQZZxBs1HSv92bHutVxB2HHuriRQkhy0s+GMdmftqIiP7VtplScsoHpOkP+wL4QnYbg8nJlkiWduwM4gXtjo1YBAQKMDDc0iG7KLzDvvAx1NFFoiSL1LpvdD49sioVYVtQtn5UcIw5YcIaIFYMYLZ12Gc0a+wxLPBWVcGuJ0P0gCPYJshKiZEiwd4e8u8OgcggWMsvvsTbYBGbn6yCZX+aB18FG2SEkf7SixNHAHll/Bo307Z1RXA1YJmc5o9oBgGwp6QwqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxI0/1wZBlRnZRVuH9jl4pcmlwXpkQJNlOlcwtgHQek=;
 b=I391AgzB9XHKGZrhzf6SftXcvB479drarna1zgOMFS6Q5vq9j8tqj/X9rzC10NBLkmYu5CUp+iIXHDqYMdLHtOPhxWLUYX+0LaltPufCCSVFgcGX7MSA87HvsFZBlyB07vG5VMhcZjFex7Z+kycO3Yg1xo3G70bX8zVAPQMWdpP3wJ6hUD4AakwznRQrUQQAn8z/g7g/oonqfAqJoUlZXuGl3oYKEu28812iJS6pqn5tUHDNLC7XTjuVRAvtnNzg/HNt4soAehzi+gHsIccy1agT+In9As0Z+Tio0isXD/09Nw3cgq8izsFZvvZJc9dGHDdCLnQ8AkqVQSV5vauPtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:10:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:31 +0000
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
Subject: [PATCH v9 4/6] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Mon, 16 Jun 2025 08:10:17 -0400
Message-ID: <20250616121019.1925851-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0029.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::42) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f944d1-017c-4e20-2279-08ddacceca25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DV1mx1JMAUHROQ/0Hru4TgdIj8cBI69b+Gu8wuDmBjuCubA2Lej48uD3iyJi?=
 =?us-ascii?Q?1xTuy76mi68cLZgP+FbzvzDnfRkotru/j21MZChAJVqg6Icvz/+zOa3FiH70?=
 =?us-ascii?Q?ZFVnSuVFko5Lr/ACjX8tS9JhTj3lkMKoqddCoBtIdD6m3zGmLI01z8tTuDCY?=
 =?us-ascii?Q?tjqTMBKSkTBAg4rdHbKki8jXp8+VUBhV2/Wuddi0NwNsC1LDzpXKcYIFSxu1?=
 =?us-ascii?Q?9UdwKcKKp4SOCK0EXNgejkIWtWQmptrifBraqZLcF1NxjoOnktyizsMexqRj?=
 =?us-ascii?Q?u7106rfO89/z50yMgxtYHkNePmfdQmWrHxHzZFNgMZ2bNuFrh4tnOLRUi1t3?=
 =?us-ascii?Q?U2VIWtsmr2q/vaZaJffEOC6NwE0JYq1yAQl05uVZRSb0TXuPzjLeq7vY8VQ7?=
 =?us-ascii?Q?Yf6jKLG2MhTYkaLPRjSol3s2GC1fOew2P0S4f7L7SMbuUNQQ8MZLBLRFShB2?=
 =?us-ascii?Q?Bi/laiW30EXVlqUPmeco9KYyfg8xSLvpeHgSGk7ik+HGN80/H7VGa1XTp656?=
 =?us-ascii?Q?UJ7QN8VESLcYNHD5QxmMcmEOJXMydx/mR0sKRGcyJC9zTiMzRwoL9h7t/9vK?=
 =?us-ascii?Q?Ou64IfkDIH0OtdVf7eWLmvkyJHPb4+Q+dEA3wywP/S2FMLAjbe8PWlnJKRjO?=
 =?us-ascii?Q?BySQ/jZKcdwFqxdwXMutGw2o478J7KWAwVjFifoWi+IAUE9l+iO1Jmwa9Ww/?=
 =?us-ascii?Q?HNWpB+XRdDfrAhymqIZdy7O9j/q7j2G+Ng5NMW1N+wBcw9Dbi64/xaeHS6a8?=
 =?us-ascii?Q?ULthrNu2C41744hNXVo1kKkD9ktsBxcFyOKzs7rdYJtBcRUkHmUrTbqwSFpn?=
 =?us-ascii?Q?RHOPvMuOUNCKnSL4QUze3uYSbvCKcUgjKhJCYEZSAGvHmYL6c0xb8eeAUvb9?=
 =?us-ascii?Q?S+Yn01P2YdSpfMWEYhqfM+3MM1FIv6kvOp8u6azHQ1sTDTJu8TBycI3ohSvH?=
 =?us-ascii?Q?e4r71q3bvRf2ThbMOaBtbTZMtZbWs5hPNw8JCJa9DteyERlPf2N3jtftg1d+?=
 =?us-ascii?Q?HZdwzQVp6WUedKh/cnOdstuE3OdwYngwXQgFA0UfCs6+zI+z0yiOUHJq8fXQ?=
 =?us-ascii?Q?L3HVxO/MA61v8paH23V5+LASvyAkE0c6sRYsXYVNFfIaVb1poBs0x+HCdsze?=
 =?us-ascii?Q?rLGXduUAvevEW0JsFLay/BD4fJ+i9g6HFtRKN7MMeTcXeDHUEx/4LXfQB4Lo?=
 =?us-ascii?Q?7uqC77x5sE7L8+jEZLyi4qyDsHyUGnXW82Sy8mPykzkPuW76q0AgOZMWlMkp?=
 =?us-ascii?Q?RaL8acWia+4wVYfQE/QRvh6ucal6QeAXwnESBqkj3egjt+Tk6TAVnV2ohGcL?=
 =?us-ascii?Q?wAc9Ep0pqyIXs+dV3c4JTyUruKcr0GFjiZDjySsn4nwXPa/8NL5Ptb1eipOB?=
 =?us-ascii?Q?ksLj7qC083VhrtoDjA6Jx+MqGnd7GAoRUVJt6UJsDM5VFhdtRTPuQFDjBYth?=
 =?us-ascii?Q?dhEhPeWFvzE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wR62WxbylBebbqwMSFvXlO3aLwOn9DzFe+IhiTM/MhJ53S4gtTGc3MAriY3+?=
 =?us-ascii?Q?LftPMTD1fRrlLZjvrzhOyOW7u2xqrtIHeWFUXHfbbvciP0tTF8lnZODSC/Zv?=
 =?us-ascii?Q?PxSqiChxsS9L6Mpp1+dh9y62kxBKDaiO9a5jxenp4dg+05q5XXmnnJDCfYOw?=
 =?us-ascii?Q?WpDt8NxoItwapL00SVCi8jdSgzf3ANI1PeLNZgxigCkHqiUZMdBxtb+ovVwH?=
 =?us-ascii?Q?8CUry5A7aoI8mPLYADkvkaWmPmRk2PPrYBKn/2eqamVpVy8zJVUdaWVvQAeG?=
 =?us-ascii?Q?CYPTvEypPGUXJTieeKTNTHvpNpliQXxaLD8j2rgutMcO8L4n8SQvQCuMkOqK?=
 =?us-ascii?Q?0RbKCCrQ/Iem721FvegF+XUO/UXdHC+xBGghKZwDXmNRuq0aGNM1OPpSHo3v?=
 =?us-ascii?Q?qnt5LdL/Kz4XnSR0ZuC4ZQzQgRcDzafTTD511gtBYJeDYdPJUAAM1EwGtj8B?=
 =?us-ascii?Q?MJwM7R+3tXxICy4adHt+nM3eNpsz6bXLvjEuWRb1SUfSHEuKI1pfReowax7G?=
 =?us-ascii?Q?fo6OcUizDPr9wfm77sjcE6OANRXYZX0GOVBroYr6iGFAZ/Qhq6g19L0egKy3?=
 =?us-ascii?Q?/1d7Dp/QTluvroiBrh5jGtKVlCoj2zylh0OhOxLEPYvtHejUECYbFc/4SFvL?=
 =?us-ascii?Q?VHFutXl+up//jF0cI9D6tH/0aXtEz8/+xdFhkTS8JdNUu5z1YmvkfxvctvjL?=
 =?us-ascii?Q?EWK80EM35c+FkkZKjsH23fl94v/Ua3dSq28UQszfrJ2DYTOA5VSIQqkTERII?=
 =?us-ascii?Q?EeAItSdPaeL/teEeqKlM3oWJ/APYYz+HXSKVDkZUlRoeD6mFGIgEH0iJNRTG?=
 =?us-ascii?Q?0EXbvh5BRrisjJgil4kbfA9A3L9BJlZupMOaMbiXNPk5g6a0va6NuBK4J+zq?=
 =?us-ascii?Q?mS4Lc9I1tALJrO0onuJMbRHWoOTvJ3aVh14Ouy+jxzRL0T5zSbBHoTHBnwMV?=
 =?us-ascii?Q?8LOGWc5BOvA5BSXKw0eWxIfhbew9vg6xlVI0niqRsgq2m+pWI/p3YZ3YfJK/?=
 =?us-ascii?Q?LNpNiew1nZGrrOtUPhNskP7EnkD0exreCHhHksgYYY++Ktd7rUoXXiqTOHNy?=
 =?us-ascii?Q?C8Dh30SQ5c2dXDmOpdVaiIs8RCsK2iGdMpZW1rQ6Ws3rSnjDaqvlKxAdhZr5?=
 =?us-ascii?Q?3QtxC1KrN4SSE1YS358eQhrZA5trjKCuXYyZyTk1u5BpKwiGw4iaoH2tHsCP?=
 =?us-ascii?Q?2hUTOhBP96wTU5f+hFkPBRh9ivlmLZKpZ70m0gtzpU+CxruqJFQzgjdyKDcP?=
 =?us-ascii?Q?kqLfjSUadL6XD0q3hskpbTsIcUcP5WitTVOWYO1LsXJbNQJJMsw8O4Krz9iS?=
 =?us-ascii?Q?KLnpaHEcLqNRuM7L15JrFUQ9XCgF141SqEw0ztZbU1nPCH6Kg4TcxlL3gvtX?=
 =?us-ascii?Q?RdeLTAX/CzF/j8vbXn35idO/IiQxkmrflqCst/sMTzoekWcc9TwVzj/o8YIY?=
 =?us-ascii?Q?pVtXRYf/ylsBH2OhBTXvPnahConG4frMFzRpGCoLASaQ8OY3ZYnWz2c9D0AV?=
 =?us-ascii?Q?ygNARtsxLWTgygY0T0RQvRqlkCV6yL6fFYBRJuDO+s8oUwTCG4Dx/y1sOZBX?=
 =?us-ascii?Q?urii+QwgA+z92XwdQcaIUNx8GN5SMchnw8RfiZJe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f944d1-017c-4e20-2279-08ddacceca25
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:31.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeSYlheHw9kSz078akL3CvtxjqrnDBdCL2EvjXXo7fX8TOPaVJurVSFbaY7dWGIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

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
index 3fae0694aaaa..06cc990e2a62 100644
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
@@ -1921,8 +1925,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1954,8 +1958,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -2013,11 +2015,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
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
@@ -2045,11 +2052,19 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -2064,10 +2079,18 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -2084,7 +2107,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -2095,16 +2118,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
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
@@ -2296,6 +2341,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
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

