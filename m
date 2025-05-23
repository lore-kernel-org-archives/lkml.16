Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4292029CB34
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027611; cv=fail; b=QryHw536/6bazVF8vux/0LlFZxz83drMYJhaRIl8uwoS18OfBNWZDP79c2aZFiIuVrrD5D4Pf2QCfJNyESlzNXdzdI5rJGb6BdHWLBdJJ9+euCp4AdN+x7b1UZ4n4ChzC9kpPcE7JDBQeYxJuommo6nI1XFJ6LARvEzeL0b4Azg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027611; c=relaxed/simple;
	bh=EgKufcdzvqLXl1nbtDRVT3FNbnz1P70iW24lwKk6Qtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OukK0/BSYfeNILU6x9XfEkb7bBVipxWYdWNUOh+phycmx1AODZagl0TNZSw+awlpjk4SUJ2W1zCuvJDx+AYSgrLDCJgAHfCkJBH+8wltOMocdMWi7xPHBxhr6aawdO/1vWi55zK2Wokyt8Tuuc0Bg0GWPYZSuB/hNcOwgmJuKj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=magZl4Wa; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="magZl4Wa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC2iyr1X70UBuVIw7niSUZuRRuuTFJoeeowrMA2u1WHsLuh8F7ksNm0CmyG65WphZbTvze6OfLz3jCV59ZwUvX9tMhhGTNnzTcmqK7vYH6qEt2sr3I0+ojZQ5aE+qjkR6rXnqssIHumwAzSOQIIG7HWspmJT1uRYGf3fyRaQ5my7f61SmtoGU+qYMD1/egI2HxrUAubE7OlE/8vHnFqNkts+WWs03ypUW96z9f6jauC8PEt11HBl9MAL7plIs7CFepsGEW+bUJNgbRuCJCQwmntjKZfsdmzB1yNsY5lTq1EoqAhym3cFIEYPAvOuKzSJRRWs1FdWfdSL7LIIHPAaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6z3bocu1Y/MYneunan6jixWCvEdXHtI0cKily/vhHo=;
 b=Mj0MYehCTDrQAbPXjBUa2NBd5ArRmbh5nzB+kUjSe5ZXR+2SMSWq7qxCm4GNPIXs/Mt5mDKdTSe8joBANsj9WawXNALuIBT1hui/9LN8m/xhxJI9t43kevlWcP4c0w2T2RnqhCyY/qiEMHGeakD7zVxMdymBuTBbDj79W9SYsWmSDShQPcL7bYCJQ7clOm17xB2eK7l7DKnRw2Xup/gRoIaQX+xIR7e5RBqGZbq7SdRrwfGcFCX9R+FLaHtsLZADwZAQXD9p9NiJ4IqrxO2YZPtyRGBcW+gcUoXGkBXFl/2hiIAXRLnxpaj1njJIt9fOxi7sm4iPHtpAhXEoMqGA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6z3bocu1Y/MYneunan6jixWCvEdXHtI0cKily/vhHo=;
 b=magZl4WaSeUNCpQRrvgrBsbLx9+Jp3k/Pv9D0IZkfKzFaRQbqX38uiQ1qIngt7tym6jdNMFjJsW4z5PU6vO9TQhKXDG25CUBCMyREWSZ6Kp1ORsjodI56/lVFk7cj6YVFdPG63EDMnZZr0DMflC8ui69alSU5PJuGBqIG3QSgTml8zVakz2u2UA3VHxDiZ/1479Dtiar2tAFAq8XsCx8ZYGxY8f+yZv6cCGXIQyfhBP2Oj4/pKfLmA92u9rC2KaXNM2Y3mPybTnFvbda6nBnn3Lkp/2zlHzblIz67XgCUnBplOrJ2osFa94EUeR27/405QQXysiLP1hlUYjEA1oA9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:22 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:22 +0000
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
Subject: [PATCH v5 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Fri, 23 May 2025 15:12:57 -0400
Message-ID: <20250523191258.339826-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab445cb-fde8-47f6-9ce1-08dd9a2de266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I/WieTrdfb5++QhUUrllWLqj7j7DTto9q+NQCQxjIx2SvE/ohXpHVq1jGm8w?=
 =?us-ascii?Q?3rKQETqyc+cALOIaLbZd4VwX3/HpWdJ9t8LvytYrbwLOommP0VvIbIhNKAHl?=
 =?us-ascii?Q?Vq78+n63x76WnrBziPgcx5r6mb15IVm53gfDdzd3M8M0gBAL1Y+NxtnIsotZ?=
 =?us-ascii?Q?qumxLx0Ns+JzORbE+mK+GZlXKVwgLQ2a2/Bz9SiieGNppo/LUm6/W+royfcB?=
 =?us-ascii?Q?3ucV3l4P0C2gZ+ZDXdR0pP2kbLAbRs7dAmA3R90B8IBtkqsObe4Q7KHwrFl3?=
 =?us-ascii?Q?DlaeWwDTFC49RGyXhRgm7+Brq7WWYflLPYu2RUtFzdsYp4WivojyBOtX4z8n?=
 =?us-ascii?Q?WCPSlLEaV3QXGOYLQzps0CDbrcIg9XNuSV7/zpNIw4qOa1oCBv5Qg+Xe7N4+?=
 =?us-ascii?Q?nv6GH6BUYo2uab6iyCdDhVZpZoM4UnKI//V4Lry4e4e4OhZJupsQZiEa9QBs?=
 =?us-ascii?Q?kgz+6kTl2/db5dDW9WxJvnIk690XHcvmn+gpDjIuMAOVCAwFYTw/ohKQEo2E?=
 =?us-ascii?Q?7PCua2J7C0uIDdLf0Q5KcyTWtZhCEWHyI/D5KQ27CwUl5s1h7p+URTjOcIJJ?=
 =?us-ascii?Q?+HFIDkzmr/QEQORXmKyFGqXeGHnygbWnVO3ozOA45VlRzsAsull9IeUaCAKk?=
 =?us-ascii?Q?/O15CbZOdoGuLF0hCma3xZY4P1BMgucefnEi0FZzE8KxX+0QpSKRSPmAIpPf?=
 =?us-ascii?Q?Xq9VIyMKVfUeVgyf9RO46Jv0NQYIrjMbop5TXEN8M6HsipW5Y6iADnV/Ou/F?=
 =?us-ascii?Q?biHY5flqe/nFJ7SnRBJNxRsh6XfucrBrvH+Mqohek0UWRv8a53mRv96yw6wx?=
 =?us-ascii?Q?iZtQKGLh7zKLbSGi6My6ao8HO8kXKP4R5XV+4YLUnGZ+eEnHOsHfIrbFisL6?=
 =?us-ascii?Q?u1RVinF/1KIRHkoyPJRqQMY9HwZ30DwturmK8cFqA7v3WzeOzJjEeAkaxUUG?=
 =?us-ascii?Q?wAH/gDMo7p+2KMOxB8tslJh/tyrP/bLF3XkAPdvhq4k87Zcux5rzjVsZuDzE?=
 =?us-ascii?Q?R8QIZ/lAjeEyA/XPKZVsMFfJZgAw3VOp4rB4AX3HEFfIdrOub9GsgBPLS3f9?=
 =?us-ascii?Q?UA5THhrzu9uJYnVIlG8zojKaRVcDqGrVvmD2gHFOdmZaLG2SG1dr6V4GvIr0?=
 =?us-ascii?Q?tZ4/CouQxt3Gh3mTRCGuSgLYzdhHrU2sDK4QusCB1299J8StsIsZYQHObTuB?=
 =?us-ascii?Q?dDqMY74ylGeBi5htqujSEZAjXZfci9HKd8rB53fBUB4h+2UxRU5BqTaEFdzF?=
 =?us-ascii?Q?V9rXjP0D6F17N+I279yN7lka/mjIwd2fsi9+y54nVNXfChZwiFXck5s8CScU?=
 =?us-ascii?Q?Z9nANCjfuU+9vR7H/wSeWEEO6S5j09IcCTUQ0LQJAOhUn++xpWzNfB/xZxSQ?=
 =?us-ascii?Q?vm7bAliduEbLR9vSrofMOKVOltUe21I6oDd64ZW093SahPddnsmGMNoElGJk?=
 =?us-ascii?Q?NPnNqHAg/Kg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L2lvJSTWP8VKe5xMtOh+AX8iFmMogPn9kxhEEdB1dth4/ozT1Lyh8KcLlSAt?=
 =?us-ascii?Q?iFlz5VSYzHZ9lOr/foGHOFT5WFxyV/yQHEY6omIdvhUn5LBqmvuJ1rZyUW5n?=
 =?us-ascii?Q?bP1wYzosxfFv3NrQ1SipOtiNP6He9rRMZRfXLqnsdi2SDt/JGLt4p/vnDh10?=
 =?us-ascii?Q?Rd/VxVi9oLnU3JkrtfdAOie/cV3C/YRzza/9mCEwLxMkV0u3wU8W3zcfnJyW?=
 =?us-ascii?Q?w/cj5QanlNiHxxEz/v04em3wp3/Y4M52iyHng+cftbOY+vw8jn3aikioBx0c?=
 =?us-ascii?Q?nWUEMBMlz4GlfOvr6/dh0hLBBc9XRsn8BWqujHzMqpt3SKiXKytVr23/2pPg?=
 =?us-ascii?Q?cp8bfTHjciaGWvjzV6uOdXMtxGWvzh8goqRaGWKHm/xVWQL1fmJfcUFE/Lhv?=
 =?us-ascii?Q?821pU4lP7iU6keVWngfptXcAjenU+AWWqrZM6NoGEcGu3Ho3OgiAPjGDdBsO?=
 =?us-ascii?Q?9EHopCTHQDIqhkVEkSz2HbhKhfJElGYz4f/tbvAwwXH+GLZpPsJEl+tcbGXJ?=
 =?us-ascii?Q?3QWjIJzXnmtwUckuwk8wxOSwAbmx86vW+yKwYys0rmsgobqQhNFdeXIyKXaN?=
 =?us-ascii?Q?PC3vO/q4odhULV3mSs4yynyPW7oKk/LCWJje8ibz+i0PvMIuA8paxD2/vw6c?=
 =?us-ascii?Q?X+kTOavDBEnXtv7bVzBTmejG3SDAoSB503Fpuf9WJLS3VXG9zXU3t43Jl2Cn?=
 =?us-ascii?Q?V0aZObIktizmSQXk1kTtSIAtXWw/oClWhpjEeEVD403PRkeDLYdr8FAjAWFW?=
 =?us-ascii?Q?fQVbBSwIi1i517+IHshj97eYboo8IBog0lUsinBTnGheixyh73XqDcQu69FR?=
 =?us-ascii?Q?RjtLYY0qxQ1VqWG8GER/3kOSgeBbF0mynW+Fmn9ewiCaN1xyMFXXuxI9R662?=
 =?us-ascii?Q?wa0fHsEOucdiSqrGO06ZRtQG0siFHHopUN9Fel54DTTeFTXee3AiF/KxdfWC?=
 =?us-ascii?Q?AaRkGtJGUUhZVsg+ze0KvLuClRUqBJIYiMcHpyMq3HSLk4zVWI6fotHU3325?=
 =?us-ascii?Q?u4vxLS8rEdnRUsgZOMRvgTN9TLsQsLA6rTYHKiVVTMWFFOdIdQOePHtQmaDj?=
 =?us-ascii?Q?2hvWYZEs707G9ECXe9/pbIo4hTWw1sETbcmEjYnVvABNFhfDZe3ihRYLlOzs?=
 =?us-ascii?Q?v5HewD6buir1XXRBXdXCD4/QH1AMNx0uVRD4XvwNFJwjP2LTNgB5KvuDb0dB?=
 =?us-ascii?Q?DZA79GzwB5YhAoHf1sQJbvYGvzZfDxRvOnBApIkwZBa32PZQWPnuuP1KnSJZ?=
 =?us-ascii?Q?Kv/fqa9l5ysKPEPG8s3A9ZjOIwLvvrGSQYnpTU/+asEuA1DZdNMtj5PzK1aP?=
 =?us-ascii?Q?Av1SarYolRU6KDLnMt1Iy51VhleTY8oab7qIPavl53EjC1H4S15+Vu3hDBKK?=
 =?us-ascii?Q?ZwZlqfQ9fBdR8SYdvMmsBsvH5HgrRotMPumE0sCBxlEhiGIsbuKjZyYL9Ozh?=
 =?us-ascii?Q?QibI14hOR8paHu6ObOzCshjWm75rfR/qg95kIHr4k9kTXEAb+aI14TgX0se2?=
 =?us-ascii?Q?dJLu64qKMiL6wr/x0KygiCwa1AOoY9UjeDHx1Rq555qTQRPhdccnyqZrnunD?=
 =?us-ascii?Q?sVDZSHxXU0Wgomo5n/JIu/RB5gWIA+IIemVu+jnA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab445cb-fde8-47f6-9ce1-08dd9a2de266
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:22.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKz9xL9QDmlZAUVi1nDrrn6xOSYTvLDjQQfdagl9/8Lu19tHVNQ14LcvrTfHWEWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

Since migratetype is no longer overwritten during pageblock isolation,
undoing pageblock isolation no longer needs which migratetype to restore.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h | 3 +--
 mm/memory_hotplug.c            | 4 ++--
 mm/page_alloc.c                | 2 +-
 mm/page_isolation.c            | 9 +++------
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7241a6719618..7a681a49e73c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -51,8 +51,7 @@ bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *pag
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
 
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype);
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 			int isol_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 43ac34ee8d2e..ab66acd3e6b3 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1233,7 +1233,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2119,7 +2119,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	memory_notify(MEM_CANCEL_OFFLINE, &arg);
 failed_removal_pcplists_disabled:
 	lru_cache_enable();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 44a08b1a9de4..499c3f40851f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7027,7 +7027,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		     start, end, outer_start, outer_end);
 	}
 done:
-	undo_isolate_page_range(start, end, migratetype);
+	undo_isolate_page_range(start, end);
 	return ret;
 }
 EXPORT_SYMBOL(alloc_contig_range_noprof);
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 08f627a5032f..1edfef408faf 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -515,7 +515,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		page = __first_valid_page(pfn, pageblock_nr_pages);
 		if (page && set_migratetype_isolate(page, migratetype, flags,
 					start_pfn, end_pfn)) {
-			undo_isolate_page_range(isolate_start, pfn, migratetype);
+			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
@@ -528,13 +528,10 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
  * undo_isolate_page_range - undo effects of start_isolate_page_range()
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The last PFN of the isolated range
- * @migratetype:	New migrate type to set on the range
  *
- * This finds every MIGRATE_ISOLATE page block in the given range
- * and switches it to @migratetype.
+ * This finds and unsets every MIGRATE_ISOLATE page block in the given range
  */
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			    int migratetype)
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
 {
 	unsigned long pfn;
 	struct page *page;
-- 
2.47.2

