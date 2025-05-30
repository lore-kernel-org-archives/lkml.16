Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CE1DD525
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622178; cv=fail; b=VTYqbVYEHtArEuD8ofGIgEx0gui6lEhBLIF6uuISI0v5BfbcIH+kAdQmlmYP1aN77ieIJJhQxYcgYbj8yP/8fpC9VHPz1OkiWXsH378tOM0LlV0wEdUXh9ktoX30cq3KbZhG4dZRAhj9LblMJwk35+9S+vs5Wa/tiHQH+np8Jwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622178; c=relaxed/simple;
	bh=U81CblCcrWScAypmQ6acEpxdQZEO2JLgGOfam4mL1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PblGqPnZCG77YZ6Hn90GpC1SYSfVWPgPA8DNCavWLWoaSUPR4JLas2xIz4KJSvu2lGGQhoNeTjhDaUFYdxgyqQBqozrGKYpDq5jI6bdOMAHTWvVZd/eY/86fvgdgBv08rWbDOa+ZK+ZROLXOh7ACjHA1FS4SOPyCsO2fXjBaJE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XHq1bb1D; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XHq1bb1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUghLF3iYaXcno0r9NI9i1v8NYhENIopJC1NvcmIU8WidXMoMT5hyGulrIp0rLYOjdUN5P0ADh1WNLZJR09bei3y6RKiiMw8DwimShCfXPMQv/1ho82kaOb3WaH+F9EDp/ehUnva4azEQHjuUvKSfc7Wwlhb+7MZflQuNnHdaaYivRwA6S9YSNMXa9taGJ/jEmh0Gz5Tbz4OR0IsAI3swRfrMZA0Oc4udkeTuNx7A9kZYpbqo/23jKO+zZ+YtoKoyKCk5DFtkEi0Xc7XZpgokYhwt9P4f5iIWOx7buzv6JdNwSwh3Y4Td5CTW31ght0r3bVr9yT01df98nC5cNEjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQkMhK2uz65pnQJTJn2PE8FmaCLhqJsQihDE4G47oAs=;
 b=QTbPKVBliZjags5M6nbmYEkmOnixCZZhA/hxNL4ROIi6vsjC61lQN0FKDG1zKdzDehnmyZZzoros7nodW23dM5yc64sUnpLdSYZcxqX9vOUPZXE9GeRRAwt49aUmsfi7EH4VxUOQXS4fQ7o18NPzoki8gzzufxwUFmdpYj9lOr80agxhSYvoULZpzo2Nb7y4YDmK5RQmHPGBL3TATC+rQpqxv7bKaP6WMp6nliC/ADQAqmubQfUPsT3N53ZG+zWZZ9le6L45Fx45eyeW1FM98vRsourgBmouOJzc3vZPre3PKLDD5A9sO1QviMYbXXbs2Slmx5QWloh8hL4XWUU8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQkMhK2uz65pnQJTJn2PE8FmaCLhqJsQihDE4G47oAs=;
 b=XHq1bb1DMylO/QGXBKcK2STA9pn8agJCex9thhdMiljdLTdAjd/59YJpOkH4eVhFH1mP1qCEkJYzDKKQsuu4njQ8PG0xqcJzLP1gMioPvld1Tg977oWhsYWyVdEz8F0rFVpB6rbaClo/xx5ZHlW1fs4GQNYZW5BiLaA5Lfe3mxLin+q9IULFRzI4gvk7ptSWcwzoDiWDPA9ErrmdnYzwMTh7yuIY1ANBh7HK4QTvyBL0YQjpO9gAeg9xvjaK7R5kJ39s6vGZkUYi5hpyDsJhfL11o0zFkH5YO7AEGIbpZBflrFH+koNETwWsZ3YL6ykG8PJBGiXjn0b+ZbrrmEYW4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 16:22:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:52 +0000
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
Subject: [PATCH v6 4/6] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Fri, 30 May 2025 12:22:25 -0400
Message-ID: <20250530162227.715551-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0649.namprd03.prod.outlook.com
 (2603:10b6:408:13b::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 699389eb-c9b5-45cf-2f3b-08dd9f9639e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gX73YE8Ft5zF02Ud5a26kmzyXgXrc35gW4av/ZZe8UXb0oaLF6h4hSIh4uOF?=
 =?us-ascii?Q?UG0DGIM1gFZmIbrppi4MkDBMn9IIxKDA9pWxm/zZ3uihlKgTl3xejU8STIaE?=
 =?us-ascii?Q?tI+meswbqTReF2YT6VM0bbmuJj/dRmFUTZeqHq2YHClBN77aar4Cy3mTYB/D?=
 =?us-ascii?Q?OYssU1fy6WryLXzfKJj5FGxl3KTPmCEnE6WV7Ikcw6n1Ai+vgOx0d+sQfbxQ?=
 =?us-ascii?Q?/Xbvd137ISAU2eTXANgYPKcfEoDWd2skPs/BIjJ5+WEgCxBt3tAyVVYDt8YQ?=
 =?us-ascii?Q?rTT7aUxlXVsRRg+DDTQMsyJOpej0USg8S6FHRKNj8cJ0CobP+1ITOAQpTeur?=
 =?us-ascii?Q?B1hkpepOb+jv/Vs5Bq/Mv/XAnYVC/iyjUTZ6fvEn2inQSWtrSOARlQxfI/YS?=
 =?us-ascii?Q?tO+B14X38dbGq0lkYtGJUQRmQAxouC+1DlHzIsYmzAQWSEAO0QMeHRqQgO+J?=
 =?us-ascii?Q?LyiMEkmIXzIXYbnSbuu9TOjXSr7Wu5H5sOSKy9ppTiCoFXJH78vFJIZE41tw?=
 =?us-ascii?Q?DE6cqGc8j4DpP1N8iCruH/a8Lfx+xEgdqbMjstNoz0zEP0/P7jclWkFcIKYb?=
 =?us-ascii?Q?7dzLobcu1oXMn7SDIObS+NYadSWR1ux1KNjKVCgTxQOFM/sUd20GYgHvfGv+?=
 =?us-ascii?Q?FHRi91Vc7VsJ7Tx8JKyBL876hqCduhdUF9UGagphbMdZv8/h03RbAaapza5j?=
 =?us-ascii?Q?N5/XpGU5D2+u+l+V+yrNYro3mHEilrF2d9f+5BWynO9Ut12jdITJYYmn9H2y?=
 =?us-ascii?Q?paaL9l2idxLdOJQmqFKPeK5A3yo+TbU6W/vpWXkG1AcRY70h/RhmKP2WoWep?=
 =?us-ascii?Q?H7WRIWENlJCNTbmU285fEJuo0XXq9S3G2jeJBjLq0BN6AkD3JoeepXZkeTiG?=
 =?us-ascii?Q?QuUFFvO8Koav3YcPpiY++WMkx3cXO7V5wB1cg9/MbcbPNTeKTRXoyiBMT7SX?=
 =?us-ascii?Q?7WhhLKZ1X4244MxnWHMCJa6KlM4iIlEgV+URAT4+TLWU5JK4Hqjz82egkyiv?=
 =?us-ascii?Q?X3grAh10nI+Nza0lXxsW4fzjoh7eQDkxayxqWsQ7Zd/fP+xbjqzVwr7hqddF?=
 =?us-ascii?Q?QqoJqU7WkIm8fOKSQbGCNOm0p2y6/5KDwpztnkhwHcUsXJHiyWeiTvlpKpps?=
 =?us-ascii?Q?czK2UYtZLKEDJ478DsnOQqWHUp+fe1W3YaFLMw1YK1rQT83YIJoTtMQeKd9V?=
 =?us-ascii?Q?I1uEK/b1qEki3bMFAqumgOHZM86g10MZyGs3OCm0w9fBZavoI2KixTDNfm/W?=
 =?us-ascii?Q?vigm3gLvL+RwY/F1FVXk2PfyEZAgJf7aa/ZOfDEUwlwIQN/4kuiUaZKgx1oJ?=
 =?us-ascii?Q?M0TNcuPTybqn56rH8uENfkI/6hTVPMYckQ3sCcQ+31wF4nASRuzHVCzIt4g9?=
 =?us-ascii?Q?iF3MuGsq+J0mI0LIxGwIUddpoV11ZJrWt3qjiKo0K2sHmiqp2ApHuSLBsxAd?=
 =?us-ascii?Q?rCNz3YFpWOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tOwvJ8vsPrUHgnj/YiZbyOrjgpxf9DRgWOlWg0Nb1Crg5w8+Lt0f3mZ3PREr?=
 =?us-ascii?Q?p+KgQzBMcb1uZ9bqXPFEVishZy2O6p367J2Zr1qvEJ+L/N7Q9vmc3+Nf4mr4?=
 =?us-ascii?Q?sKxpHfP3hao0ibz5Ntab3k/Maqx4KBzhWJryxD+W1eg39/i7baJ+pwIfsMHZ?=
 =?us-ascii?Q?tqAKVAQkrPfxjqB1LygzUCWBIpLcWnsr6O1P3PZoTxQlJs5GVQviNMmB6bDH?=
 =?us-ascii?Q?B7tjA6ub3OqMMasnA4PlK3hm+zqcemq/xZ+jcdRLlr9aM6VudDp1cJtJAoLN?=
 =?us-ascii?Q?2kI0OO46rC5DxUWDmos6fnQ16PPv1opuaph3FQur9tBp4tssEzcqOk2AEjlV?=
 =?us-ascii?Q?tmDrw2VRe/VAH5q/uu0VlchZEFr1Rt9gwDWTNcHiqyz80NycToQXOHIv3k6q?=
 =?us-ascii?Q?X6x+FvSgO+7+hCm7iePrq8LCO8YLQwIAC/vGA/IqSkhFJ7JunycS5QxrqTar?=
 =?us-ascii?Q?kzaWO0VDlcgAVf6a2UYGaV3cdwgVWthstoDei6l+v46FqITbOsaXF0m9V6bO?=
 =?us-ascii?Q?hTf2xVcIVTpgk0jwZnKmKrL9b8BbFjEf6tzkuJcAMfTIdacv5clCqJduUK4s?=
 =?us-ascii?Q?oeHaD9ucBwwi17Z9ET5JcH/jzA50ANqu0uFfdn3czjHMADCIUO/4sFyFWA/p?=
 =?us-ascii?Q?DExhpM/JB8JNeBBFYiUmXqOg5uBMnYjqrozJ6nz2QIquxWUOS0nDPC6y+Rv5?=
 =?us-ascii?Q?2YfCt/1HGaHxAUPVAzuoiwgYLPAPcb36RlIm9eLaiN7j95aIvVtMzjfEc3q4?=
 =?us-ascii?Q?lFdyTTauwWQRVd5fXrY1PoRM1/4oxxlguK3+1nmTZq+LHv7Nb+0GNqdZeB2z?=
 =?us-ascii?Q?WmruJWxUljdv0xBWyo8cK+nGSMTuyfw8YTskkyU93ORViErdjiwpjZvFJmyH?=
 =?us-ascii?Q?pS43+9h59ECKgxeJ9Dq+vNYoF+SL3AZhupyioUb6WNOiPPeQ/kuO34uIlCQ7?=
 =?us-ascii?Q?Yik4bM+ayss9/yX3LEQK2eq4GdehI1S8rGoYJcHuDn6qDSz+GrdsS9XIpaIG?=
 =?us-ascii?Q?Nyo++k/RXZZSvgcjozC6GLPx7bGD5znfAoUAY0ZvwXwo10L8wATFfiuKdAhR?=
 =?us-ascii?Q?nLE0Z6S2hdQEJZBOyOxvghqo2cwJSmAJ5Pbm7nbE6Hl6bn9WdkBBz28JoO5i?=
 =?us-ascii?Q?sMVz9TxbbvPmMvJk/9g5ySAb+lFTBhrM5/3XtHtIJkbp5byIJi5CyAPDD9MJ?=
 =?us-ascii?Q?dSr1wgIfs7Jr40nfJr+sglejqy6P1ItQXMPE4WtvWJjc8SSL1zKbrVlRhqIP?=
 =?us-ascii?Q?Xo3mMNG9MSStW9ZreFAFn+CtHfF37f+THwNFAsVOEZWVtuwceVXndDdBG54M?=
 =?us-ascii?Q?IXkGfvRPoYvux3sxo99FCI6suedWFONRjAD6btaLbfSjQfMonJkV9QLWpSEB?=
 =?us-ascii?Q?4RSuZYtYBq+s+kFM1r5e9/c2BKKIRag1NR4EXOxVbB16MuYg6wHzqccvMYeP?=
 =?us-ascii?Q?zTF6cLQycAT/42ABTWwZICT8BltDbiv0TE44sNxq5xx4nP4YOweArdp9vItI?=
 =?us-ascii?Q?/YQRqwtmnLXtykmqgtjH7GSgoF0ty7aAzSsaThESUZHRyCkPAaUe+4ULFFwG?=
 =?us-ascii?Q?ppZFUf2wyZTDnGr7tie9zUiXntisWPd6NwgtJo4k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699389eb-c9b5-45cf-2f3b-08dd9f9639e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:52.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MnpOJpUSOiXFVmlY7GfdtnzLSYAMU/4yMfVq515/EI2MCsPBcJ8ysd+gcJ8hmIp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

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
index 0284d74b6d8e..bab114022829 100644
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
@@ -1925,8 +1929,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1958,8 +1962,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -2017,11 +2019,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
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
@@ -2049,11 +2056,19 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -2068,10 +2083,18 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -2088,7 +2111,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -2099,16 +2122,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
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
@@ -2300,6 +2345,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
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

