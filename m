Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9C220F56
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820884; cv=fail; b=JhtQpx7NvUoNleU5zRBi+3TEwan5S0cRyox/wIMSvIuhTVFGSzrWJXxtEA+w1LWGvayOgsCz1yJIExVR+V9VMkvHmfgF+2LobT+dUHFXmP0IG8J0Ioux8qTOhxJCajvThMqz4hDTDmR1pD8N5nuJsP5sHECMdWFFDGtGBoefYb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820884; c=relaxed/simple;
	bh=mfvwNILzQHm+3YbfGKWif/OJvRxvOeFYxr6YBUAsQ3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eo6le3vH1o1lKM+Zcqu3gjMSTZiWSWGLvgZTdZ4l2mQp2qReAvCbaxS2hX9dGfZiq7tWCAZ/wjrH1Jn6awsp2ByVLxB9xUVpSZPlSJHWKlu9hprs27Zx1xGRys7XQ5dwkAL38AeUbXtv1c6bVFUb6TI0PE4FELAZVGE+s5Lx3S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LtM0JR0v; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LtM0JR0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM1V6gHsLcUfDtxU58YUGxhusFD344SZMI74kmQnFLw+RcrsCgELDxwh91VMUsuLxagIyxqg96/WgriLxmXpQMQYGzPwpRZzPcSXCeByBzxZVAnJ/pt0Qdd4mCVFVHZgB+xl11vsDfmSc/8Vu+464eRREUH6a+6qKBqM2SCbS9np9/Ub5b61j5bcl55bPDoYQHtA12YgkOP33/RinkS0NuYIVLt8eie4QuOTdOHJbLqPnrmwxbumEyihNCyqPqrLOcp/u0g9nIWJy7KHV66FH6vrL0e51/o3EAk0hslP2OzPfqEc7zCC1gGb3Dfbwnz3nF9wlSIX0WfP5nBTpSOltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OZ7/WIsqPDX1ol75Sgq7QrOKxbU5Qr/pbgfNKeq/68=;
 b=oYbUikeCwcVOGvQabp7HqUK1Oj23UwGeiud9Kg8elX6a3Hs9f6Q/Swr1ym9SFjtFdSY5NBUhuTkpcN8O8h9IlpgcpUa1g6RhjO4PGHRJAcrMyQFdF89PmQwjI8kKgqPHlvKlu7naxgSxdVypGb6+HLzRRQsscJaywHdxumIWTc510boJkI1FyWYkPd35iZ1W8ehEhnjz3hsk/U+7fwt5TzKgPM8xPsW6wWnNZr+FuSWnUVV85UMNdBeyOExh+UG5OzcraiOqH1WL7gyb/N4zzq2c6VRQAYyVJTplYESyipDHHoIht/pihZAYFrZK3YSiq19wp+ZXNWiuMndfPWeK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OZ7/WIsqPDX1ol75Sgq7QrOKxbU5Qr/pbgfNKeq/68=;
 b=LtM0JR0vGYw5NZPRFx3g5wrWvhY0ArGez2+PuKdMI+iriR9bq3Bo00ht4ESAfl58maOCsPtVn7Ursj80ij+7zWLIxBOmpRh1aPq82uG8QpaYylMYDG2vky3zOKyeQkWOtupBlpEUCBGCIbaZcSSFt1uD3DLQDrUZG2mVXBogTNkAx27xys0sFaRujrbDyXpz+CdXym1eX1Vsf8DfA/FWUHNpgEr2TDqpdIJ67p9MVSIeCgZBKqUsZg50xgvPmpDZcKa+JPDZXbr/1JYeeHm5ricx/vZyfPQxJZ0LRebgzudM1IWBgKJ8Cr0f3MdNr8M3+hN7ZmcBqBlsW4sAjhxI3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 20:01:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:16 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH v4 2/4] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Fri,  9 May 2025 16:01:09 -0400
Message-ID: <20250509200111.3372279-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:52f::10) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: b792094a-9bb3-4f82-f328-08dd8f3441fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlsawbOTBnJ38jcX+eExEQaENRGjLIo7yj4SReqrsJuXHMTU1xVLjNt7KslX?=
 =?us-ascii?Q?qrvGSMycFFE6ifmzhQ4LAnsOQGGuxxJUvLPVksoQ94Ai/dS//qABDSO94f0p?=
 =?us-ascii?Q?jrfFbWLIUnzDHBFipewNk+rTRaNGGGep+h+iek5EeV+at26bbiKL5oc0fVRc?=
 =?us-ascii?Q?xZKHc565xEYNVTiNvvUTlnDZda7i4C63cfr5SQfLC4MlGkF8GAulNN/4dWri?=
 =?us-ascii?Q?pzGPCZZZxWQbKE2FeXyQLEOSsHLK9YQXf7gv9BNk1AhusUJEO28/c2bNPpb8?=
 =?us-ascii?Q?x284jK7qFP8h6zKWzM/MJyA+hSxDn4vqOQQnbkZUnBcnxB3gVhij6YuRrc9d?=
 =?us-ascii?Q?tbSU973qA33oIuRYHKOG4zUEvGlnlzVmVkzKvCxA1Osi92/MQ8tFURTjIjV2?=
 =?us-ascii?Q?E2g3a1A4dqudzHAFz78d1xhHo2YcghiGbt3R7Nr7FkqdgELFb6f7tlUpnHCS?=
 =?us-ascii?Q?dVf7rbxrg6PREmU2mdp4VbDMEM38qaSd0rulUIPBdSnzzSffRqTYiTRrLtXp?=
 =?us-ascii?Q?8drNt00xuH4rpJZii98vzOv2liuWU9gTpDB2+UB6j/wcaKSJgDWO1DNu0lmb?=
 =?us-ascii?Q?NtAHBuAGbt8LpQx1d7dqCgnBEjM6QSJdDf0Bke/49idbqVwkwTr6vT6ej5zp?=
 =?us-ascii?Q?lDCVoPwzrCEQzkQ1C6IDUxDYvNr7p2MltJxceKzaYE+qRZt/H16Ggz4KwCrK?=
 =?us-ascii?Q?lBM0vdSF9Un6e9yzBviupFsqcuqmb0sQUcPgEEJCPSkQLKXYdlGUiC8rTU1C?=
 =?us-ascii?Q?yXjrGsjzuMRqpHc/NcT8XTZNcF6uTa2KrDTdlGIudIkt1IKybAApcEBt5HrH?=
 =?us-ascii?Q?adWZNUftHQeq5qPbAh6bNqZZeuJEg5nYqGPgTdaVeHM3q0kwaQnpR7JqxE8q?=
 =?us-ascii?Q?tv4wBEwpR2AStlT53HQtCgHB3yoPgHrBApnWCcv7XsUSAj9ffyjUEm47Ox8v?=
 =?us-ascii?Q?H3hSQBMWRAj+ei5t4/WSSZYYEeIUJF5gjvey8Nz6O5d03dk9+ErSo+I7WUZN?=
 =?us-ascii?Q?MZdekczGZg6Axb7Va6T2DSQqyKw2CIrZOJ0BbKVxpL1p9C0gTGJuBPSELz4W?=
 =?us-ascii?Q?qYrs0Lm32SFm9Kw77LGZQnHzURAC4+AQ7AeGRCxqZ53eDM/JjxzL9NqVKhjI?=
 =?us-ascii?Q?/rA1Sdyur0tmyTLupMEicGIQDf1tOAFUSPGYOGlmj2mlx++dDFF13Y6sSPmT?=
 =?us-ascii?Q?qAc947igL0ObdK9wdXIYo5oqNWkqP6nxXBIibiKa/oPrwnNDXB/rIkN5Fv7D?=
 =?us-ascii?Q?a4u/mRy3UX0VeVWlC3+NXYfqin9TJU3+9I4wAzn3VIoDoJRdxbxKfK8UByLk?=
 =?us-ascii?Q?IyADEdh6CheGsOL50QQzcbDJvUgzzvnOV33LA3ate0BDkFE1IXgPZfl6tQLp?=
 =?us-ascii?Q?+CO9d8kJkfXqcvKv6refn6dPJvQIIqPDRT8OA3yE0IH8gk/sPHdNZD29IVLS?=
 =?us-ascii?Q?gc0c8XaXc1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hn5/5rHST2IRM9EbY9+LJFTb/+BNXK2LYuV5Vj2Hqy+kFgkK8rpW8dIaU8Jf?=
 =?us-ascii?Q?jjHfCgrFng3jTA39PizBkd/4D6/hJFvT6lWEqioNxNaIQOn7+c+MvpymsTs/?=
 =?us-ascii?Q?uFZYcQOlx5+fCnqRHQhKtIXc5elnLXrJCoAiyqa2mx6hgBhyBHrkZ6Jpc9az?=
 =?us-ascii?Q?VsMt6+zO0yEAB/nk/rsFbrbhHb0fEyh3mycHcZrGgMessMMfT+BWe78RWY4b?=
 =?us-ascii?Q?Lxu2CEgTVbUudjhACeJpeQt5nb32U1HpQcPYMeWaTIsz75uv3yuVULbwyRIB?=
 =?us-ascii?Q?hS75MJ5E2+wf5BWjWmL2NdmU8CPq1KF0kPUN/wuuUh9Eh/+BQJAMZZmZ0WLU?=
 =?us-ascii?Q?tRGGTfD5QK2JhKO+gl4x9Dluz61VLQJSogj9P1ootclOJjK8e3JZXiQAjKNN?=
 =?us-ascii?Q?8ybWimd30j52noeE5RQUgW8Q3dy8294W2ZXikJ1r4Z0JiJ3iUbFQuCPFDhhx?=
 =?us-ascii?Q?WKUhiIkG0djUiP3lzC8xwvtHZhJ4qyQ+1788pn9zC7L54kJJ/PwNrsVw1C3d?=
 =?us-ascii?Q?g9JMjU7yIFt4l1TDliHVH7zXJh1Xz7BNmvp+nsOaGEJ33jX2kr0RnJ9xJZRD?=
 =?us-ascii?Q?b2pVan7QfbZ2SUQx44gx6aLLIXx+89xQw0lqolMbO3MlRz/76Zi+qWAXX8Qh?=
 =?us-ascii?Q?7YrxI1V6e1zeyGRFGZyBY/h7IuSiuDCPBiOwmAfVXhKxah06dy0QTJK97kdR?=
 =?us-ascii?Q?kDQEns+fkBS6yZLJI3hh1L4P6j5Ulynuvq8uOxLNCCl1zP9bpdclYjK8lGpU?=
 =?us-ascii?Q?p8A7dQAnniDdJsWjUm9Inpfakq7xsPCquJRnK+XNW2Lqhyi5/N+AKKNXdwKX?=
 =?us-ascii?Q?yEtF/5EwmbBDaZ3NxIqgijVcJqst1Ygu3QpdzEpRHNc8jbfI6erU2wI4e5Dc?=
 =?us-ascii?Q?a+L8Qufy7F7L03h4BM1XyDeXiSEGDp3th4CCvhipghqg16G0X5moOMTuKkXp?=
 =?us-ascii?Q?J6jQQuNUCmfd4Agwrug4aYWxROTais3lig5z5yS3DUL6up1Z3gTw00SQRWVX?=
 =?us-ascii?Q?jGkbj+pyH6fwDRv5xwMx1S6MiaoCj1Zb4fCtlbLsu7FQvS5t+zGd/CAcmL5M?=
 =?us-ascii?Q?mAP7JmfuaQyRp9tTlzBrna67CTV66p0LpMzCg29kWiwjDkVyKj/EvxyAPg/7?=
 =?us-ascii?Q?3lP1WrGddcwX4lsQkJJjl0s2Hy+kmQq/S7azdUhrC/chRbMGEs3NG87j91Qd?=
 =?us-ascii?Q?CZN+BhuLP/wmGqxETdpGqa4TtspjzGT3yqUX1DYw2Vsfii9YWL+Sul5dg2iX?=
 =?us-ascii?Q?FKwpFjVdyZBkZ8Y5Z8aRcxvpRqrNLQacGzBCXQVSDsiPl4oIEvF9gbIrmFGJ?=
 =?us-ascii?Q?3hTQtX8Ytn1Zn3Npxm2NEyrJ8uo3G54ycoSZAjwzUW1HyjJo8pzpwbUPO3Xs?=
 =?us-ascii?Q?t760rfJH+WLOvUxdggcNJn3YPjCRygbwnvbH5iQ6ymkLZREOzX8ku8jBM6Mg?=
 =?us-ascii?Q?f5tF+LFmADyLCIVLwKQ2LoVNETFb8gyXhdjBLnawiOzNfNjve0HQ6r3YT5/o?=
 =?us-ascii?Q?oJmkrxuOLRsowVoCQDpaczfFmha1gGIUx3R9MatvHLU++gyXnzEUp9JXRe06?=
 =?us-ascii?Q?h0kvhNL9XAI/jlipDnhYpfzrht/anCxEZidZSMwA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b792094a-9bb3-4f82-f328-08dd8f3441fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:16.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AiJ78qe5D1xv2MTzLiA6u13jVyYNwHXam4fALiYi2b+KZ00SBWHt+WjHxnejOev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

Since migratetype is no longer overwritten during pageblock isolation,
moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.

Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
when a pageblock is isolated. It is used by move_freepages_block_isolate().

Add pageblock_isolate_and_move_free_pages() and
pageblock_unisolate_and_move_free_pages() to be explicit about the page
isolation operations. Both share the common code in
__move_freepages_block_isolate(), which is renamed from
move_freepages_block_isolate().

Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
so that one should use set_pageblock_isolate() to isolate pageblocks.

Two consequential changes:
1. move pageblock migratetype code out of __move_freepages_block().
2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone() is
   called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all affected
   pageblocks are isolated afterwards. Otherwise, all online pageblocks
   will have non-determined migratetype.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h         |  4 +-
 include/linux/page-isolation.h |  5 ++-
 mm/memory_hotplug.c            |  7 +++-
 mm/page_alloc.c                | 73 +++++++++++++++++++++++++---------
 mm/page_isolation.c            | 27 ++++++++-----
 5 files changed, 82 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 7ef01fe148ce..f66895456974 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int mt)
 extern int page_group_by_mobility_disabled;
 
 #ifdef CONFIG_MEMORY_ISOLATION
-#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
+#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
+#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolate_bit)
 #else
+#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
 #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
 #endif
 
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..b0a2af0a5357 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratetype)
 #define REPORT_FAILURE	0x2
 
 void set_pageblock_migratetype(struct page *page, int migratetype);
+void set_pageblock_isolate(struct page *page);
 
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype);
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..c86c47bba019 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	const int nid = zone_to_nid(zone);
 	int ret;
 	struct memory_notify arg;
+	unsigned long isol_pfn;
 
 	/*
 	 * {on,off}lining is constrained to full memory sections (or more
@@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 
 	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
+	for (isol_pfn = pfn;
+	     isol_pfn < pfn + nr_pages;
+	     isol_pfn += pageblock_nr_pages)
+		set_pageblock_isolate(pfn_to_page(isol_pfn));
 
 	arg.start_pfn = pfn;
 	arg.nr_pages = nr_pages;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 04e301fb4879..cfd37b2d992e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -454,11 +454,9 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
 		migratetype = MIGRATE_UNMOVABLE;
 
 #ifdef CONFIG_MEMORY_ISOLATION
-	if (migratetype == MIGRATE_ISOLATE) {
-		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
-				page_to_pfn(page), PB_migrate_isolate_bit);
-		return;
-	}
+	VM_WARN(migratetype == MIGRATE_ISOLATE,
+			"Use set_pageblock_isolate() for pageblock isolation");
+	return;
 #endif
 	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
 				page_to_pfn(page), MIGRATETYPE_MASK);
@@ -1819,8 +1817,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Change the type of a block and move all its free pages to that
- * type's freelist.
+ * Move all free pages of a block to new type's freelist. Caller needs to
+ * change the block type.
  */
 static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 				  int old_mt, int new_mt)
@@ -1852,8 +1850,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
 		pages_moved += 1 << order;
 	}
 
-	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
-
 	return pages_moved;
 }
 
@@ -1911,11 +1907,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
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
@@ -1943,11 +1944,17 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
 	return start_pfn;
 }
 
+static inline void toggle_pageblock_isolate(struct page *page, bool isolate)
+{
+	set_pfnblock_flags_mask(page, (isolate << PB_migrate_isolate),
+			page_to_pfn(page), PB_migrate_isolate_bit);
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
@@ -1962,10 +1969,15 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
+	if (isolate == (get_pageblock_migratetype(page) == MIGRATE_ISOLATE))
+		return false;
 
 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
 		return false;
@@ -1982,7 +1994,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -1993,16 +2005,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
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
+	/* use MIGRATETYPE_NO_ISO_MASK to get the non-isolate migratetype */
+	if (isolate) {
+		from_mt = get_pfnblock_flags_mask(page, page_to_pfn(page),
+				MIGRATETYPE_NO_ISO_MASK);
+		to_mt = MIGRATE_ISOLATE;
+	} else {
+		from_mt = MIGRATE_ISOLATE;
+		to_mt = get_pfnblock_flags_mask(page, page_to_pfn(page),
+				MIGRATETYPE_NO_ISO_MASK);
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
@@ -2194,6 +2228,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
 	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
 			page_group_by_mobility_disabled) {
 		__move_freepages_block(zone, start_pfn, block_type, start_type);
+		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
 		return __rmqueue_smallest(zone, order, start_type);
 	}
 
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 751e21f6d85e..4571940f14db 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct page *page)
 	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
 			PB_migrate_isolate_bit);
 }
+void set_pageblock_isolate(struct page *page)
+{
+	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
+			page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
 
 /*
  * This function checks whether the range [start_pfn, end_pfn) includes
@@ -199,7 +205,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
 			migratetype, isol_flags);
 	if (!unmovable) {
-		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
+		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
 			return -EBUSY;
 		}
@@ -220,7 +226,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	return -EBUSY;
 }
 
-static void unset_migratetype_isolate(struct page *page, int migratetype)
+static void unset_migratetype_isolate(struct page *page)
 {
 	struct zone *zone;
 	unsigned long flags;
@@ -273,10 +279,10 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
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
@@ -394,7 +400,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 		if (PageBuddy(page)) {
 			int order = buddy_order(page);
 
-			/* move_freepages_block_isolate() handled this */
+			/* pageblock_isolate_and_move_free_pages() handled this */
 			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
 
 			pfn += 1UL << order;
@@ -444,7 +450,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 failed:
 	/* restore the original migratetype */
 	if (!skip_isolation)
-		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
 	return -EBUSY;
 }
 
@@ -515,7 +521,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
-		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
+		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
 	}
 
@@ -528,8 +534,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn, migratetype);
 			unset_migratetype_isolate(
-				pfn_to_page(isolate_end - pageblock_nr_pages),
-				migratetype);
+				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
 		}
 	}
@@ -559,7 +564,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
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

