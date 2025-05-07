Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845729008F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652285; cv=fail; b=pvcxPQbPtRY02GQ0vb736z81LX7GzX9bPow+L7JwMHNavhJHkYBQO/F+V5lA74roQ9KeBE58nSN/WtwecK0Bjpq9b9K+aR2xQMNMffRSpfJ+reMMjhpburPT4Evc811/9BQXZf3MwrLihETyHJLG42F7Dy7EAoRgTi7Y0bOe788=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652285; c=relaxed/simple;
	bh=DoZgv6Bqai26VE2+plQKVw+cuOAHrVIM5pkgkeANtko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+HnwetUOac/XfspFgHZeD8hJiuG2YjwG0rWxsUwJUi77R4VZyMFg5zlbIvgHg3rrQuvqvgAQjodeOtUxJ04ysOE+sgi2kACtB4OOdIqZ38Ft7mD6F0KeGP2R3rWx44OSpznGXWi5WOs0VQLIKE76qmtGc0yXGkqZW2jbCGMK0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fpnuVN3X; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fpnuVN3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNR+OEem4qnhxz/Fr1Y0RXd43OYJL10D3gCmXGBsmk14zchD32lT7fhj4l4Xb7lsf44FglS235i6qOJd64VxGNZN7swG6GVq89pFbMFJShLvfZ7auIh1EEER+sQlVsko7DztrPgu7YQtshybKnS0spixMIJl4f1Ie9WZfVhvCBaHVe/e1jnMesiuoD0umHHptyX8aOCMb5AORkMV2jBev4KatU82vJUpzvJq8/6Zgl9D4fxF9p3AxXyyzBk2Xq0M/SoxtubwvHKgzJb25ebZ5SDacec+eh9u5gKmp5Lr2EdUD3u8b1BsL1/SHYKa0nD3SwVV+hVVQXP9OPc6hunNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwrAHuO0Wr5qgKfaaa+2KGs6Aes3eMCe78w5CYxZd4E=;
 b=jq4nKKtRTxUG3EbygLBR5zhoGYn09Ch0tSTr49Z+9Z1GbEr1n6tWFhevDOLqFJ9ipiwelaKzTpr7rT+fEKUqAG4aiE+7E7xbkXX5YOnJIP3txaysfkViCdhS+uCvJKEGZ8nBfxFVwzvlWXzU31dowrSM+kHDp5syU9fMumx28VQdBbSU9SVhpEIwKP6teUF9X9ldRqKjtQj2ucv3Qv4Xqd5Y7cIhlVSHOf+UfuXFwI6WcprwagywdMGdGrEZo6Vtp+qVO/xepp6DlxW4n6jklLM9WeyXnZxpwpphA/cfnjBVc6GgvGTLc/rwwTJ5/6xN2x2yKFoetF5eNp9v+sPvUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwrAHuO0Wr5qgKfaaa+2KGs6Aes3eMCe78w5CYxZd4E=;
 b=fpnuVN3XRP1RrQjJkF1RWi6MSahBYexFTAbLc8o5GlCWSJOCcc9da58xz0m+8EgC+nyo/ETuT3zYW3w2LeHAU+UAdfpZl5GPjMU2/DkD3iFDqWsZ+5x3wnvv3nf+nuy5KtU0spRmXD6Ra62WadsQQJkTFvzWFgLRpt+HQqH5SeZMJJ4bm1lymTIa9Mu1DH3YY/QV8VdtQOTsVdAT0IhfOYQHWK6sWgl6HxCT1lgO9zmX4jlStXaSDrsiYsnFJi8aSbDwEQDBxTvkNyaMRichi20PWpczzijjIb1KOSH/Gy4A9eXlfVI0no9a0vcw3nF/OHOd6bexVYyqcoLc9QIQBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:11:15 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 21:11:15 +0000
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
Subject: [PATCH v3 3/4] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Wed,  7 May 2025 17:10:58 -0400
Message-ID: <20250507211059.2211628-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507211059.2211628-1-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:208:52d::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 36221ec0-fac9-4904-3822-08dd8dabb3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XXJnHFx8OTKk83X5FtKdB6EpwQ2xCn/qf+9iLm1zkq9p+WIvh5o19YzAijnn?=
 =?us-ascii?Q?ycqoyBCKTJb1B5+gWukNJkmaeyKfcp5j4cRNmCjzolCOz1ebpXpQeMzjMSeB?=
 =?us-ascii?Q?LmkvIjTx8qXCDEYXbNAyjCZHugEWFBThooWjDzdD+eNCAbxfJt8cBzZptJ0f?=
 =?us-ascii?Q?FaofgizIvtRX5PPAJBE9UmeqCBDMygR3mPUiqTh+Pvr6+f5P+3yJpB1eem+p?=
 =?us-ascii?Q?YsVMbLIrmw77OUv1rfGg+cTzQ6IlfNIltywFF1gIAMHxLgaNtOfLpWaX3OqO?=
 =?us-ascii?Q?mmtCla3lhrb7EJLP+i+cRgNuirRQCQhrK7GRtFILawDx2DeANReaO0PX+DtT?=
 =?us-ascii?Q?vyzkaY7ftEWHJpKTEf921MSC5mWMbJmldlwvYPImIDlu58+NLlL7IyNFUmid?=
 =?us-ascii?Q?5+kVWWZyoGRfGk4LUj1LyVUJH2ziDINaE28QWnCuZajFJtJG3WcoTZXVxUCV?=
 =?us-ascii?Q?iYHgB3hXDsCgenr5b3kViUuLyK4aWCp2rCQnyQKRvdgY/CTxvad6meVox+2V?=
 =?us-ascii?Q?bfZK0Dygw0SA2/yTeQfVIE6RRHSluuGKz2navluaT2eH/HU+xdRadmt5V/qp?=
 =?us-ascii?Q?akURcUDurcSzzMLLMtnkZrsJCp1BwVTTWxK03Z6bnjvkkfWbqYzYj2vY3Wly?=
 =?us-ascii?Q?9wYP4k2liTlnNPbcSCpe2kyVLmnCxyz3nqz3T27Smx9qEWN7yjJFJ0BI6Qi0?=
 =?us-ascii?Q?wY/m1EfCvMLkfpd/flfHpgFeA3byQ4tMTZxEB94dkWzL574fCcN4tg09CAnZ?=
 =?us-ascii?Q?x4CToWVcVIT+RmzwHkTLUNkBXydQRrPlT4xc94C48FHfW2u1FNvbX25wr13/?=
 =?us-ascii?Q?oYsdep7AJ4gxurRwEvTnNSeG9HY5/ixrGV7AuDg6VRK978qgr2h2DYtw1IUf?=
 =?us-ascii?Q?aWpCcQVfnSf8GJ8dLHKEiA0W50wcSAXKBO5zCYbk+JvwVF/EQxbh32oTAJLX?=
 =?us-ascii?Q?NiLeKi/8zPQwddnoJCcP3CXyW04s5q/1WlKdlQv2PAkW37J0c55hXWutRKqh?=
 =?us-ascii?Q?h6sXv3u5ZdZ+XUy7mT5i9ZctDRVVdfs0YzsotXBZm0XOFCsjcSaIhPXRcsAX?=
 =?us-ascii?Q?zSil2KdSBcnL8qbHWiWPZ/pQZO11BObD4xy5IoTgXSrt3BmOlGFdWnZCHzPt?=
 =?us-ascii?Q?UfCVlwUGoHcFNzRq2+itabRx2YVhMC8Qwh182S1ruJ+fZdPMq3mi3ZoDB/Df?=
 =?us-ascii?Q?PL2SxTA3QtpSeYUeTFrBIKz2fcpQ3QzLdfpPviWU8pA7hjzAQtgt2auZXl/n?=
 =?us-ascii?Q?sSwVFFvhdl8JirQVrKFvn55Co14PJ66OV+hxr7zxWt3I8Aoo51d9JAAfu9xo?=
 =?us-ascii?Q?Bg16B1PbRd6VVRCt407556ONRH2RGMPWskFTJ3pC+pEIUIowjXFKVMNm5jM2?=
 =?us-ascii?Q?/VT16pjl1XEaN1dZh9YRQTOb3goHyuNW52ysLztVA4WULTcZhmFDwbN7eb1g?=
 =?us-ascii?Q?EFNZowUwAro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pZgx8+LN4YzpO2ThlXkZGjIYUqW7aw33EA7Gyn87MNyAa2liopTQUS7j2QtA?=
 =?us-ascii?Q?lmtcVoYlNgfAYwwv9HpfZlbf9QeQpIj3eU4ZqVOZFiiL2Bb7Vrm/9rHinJ7G?=
 =?us-ascii?Q?UQNCwKtp0JZvNFlOa463rUeb6rblh2Yt9YPMr18RDuULBDNSwrjpEmL4mMoT?=
 =?us-ascii?Q?ICjWVXmLi4jTKILDy3rg7aXgBcJcEa0kFj+dNUxuHxdiMxGkkf6PnO3hvhA1?=
 =?us-ascii?Q?GeXMUvqRa7g3xIaNBBL39g0LoWtfMk2PC5entNAf3t8G86zAV7fTLLWd/dHy?=
 =?us-ascii?Q?O0B6ueO4/JmDx96hXq7UUDrnjBVompIBU7oWeEhnUBz2gGwecLrSPSdOUJJK?=
 =?us-ascii?Q?rmRVZhTbmfHlF8Ylpa7o0wWMh1osMCt3x1BeCr8Bf9VmOFd83pa5bGqg9Qgl?=
 =?us-ascii?Q?lFJDJHykj7zzL7O1ySfwGt77h/xLD5q3S83dznEeuAY47jBO3ZYGpF04WWyu?=
 =?us-ascii?Q?zJZgo22TVVP/UK+SmzctHXxlDIaIudIgU3Eo6tgB+7DwpthJ4bjq40yaBw60?=
 =?us-ascii?Q?mC6bSMKKig0u1z707a8Dey2cBCs6jHofPKwv6WvmhDGMwETuWtgDcNsrPAfY?=
 =?us-ascii?Q?JDs1JUZmDm/DTp+RPlWEDrNtS/lEUuu7xptiWpYKgEwXYrrHQDE10rQ8CjKr?=
 =?us-ascii?Q?VOoYutKn3DFcISqSur2orR0Kg09RxGwaV/+pOd8soMv1U4UgvB8JuWKWsinJ?=
 =?us-ascii?Q?OXDCEHyQQ9JroodqKGC4VZ6I2BHQ95uN+Y9opAAuulApAZwrMNxaP5X32JiC?=
 =?us-ascii?Q?Qp0evLZoks6kWfvW6vQpn605EtQ1jtsOkVO82hiAUyQDvY2aXF7Bb409UxbL?=
 =?us-ascii?Q?1htFgwKwjq3o5OBoGX9u922GpaK8vrA6+rAK+amhIXmn/C1gCRLzzL3leUSk?=
 =?us-ascii?Q?PUnY/bkMrKGxM4zfvyv+kZ9P0Npu5Kzj8FNkmLiUWGu6ndy1Fv8Eim8XOVW9?=
 =?us-ascii?Q?8AkvNY9NLvdkfkyFOS3J5tl9qY835XiHTUNRrGiQypoNeBxxU1DqvMgDncmP?=
 =?us-ascii?Q?sEM78ABKdIDfA8flDb5TLvFxgBaxWOL5Mz3tNTIs6s6gqatbKNDBU3b9JP4K?=
 =?us-ascii?Q?NDNeCam7JCwfZ258jYlJTl7nciFZ4UfZJNuKqc7uFZM8OCZmvkbb9ZK90g2k?=
 =?us-ascii?Q?1pzyr0yX9sVSCOqtiD2dssal1MKjPY1vjHHp8a2C5uxkCUnI1nBmS4pFKQKP?=
 =?us-ascii?Q?038fNf2YtZhu+T2gF/y8078wZKPbtmI0Bb5HrfYQL3RqU58+gLC4OiLU2D4r?=
 =?us-ascii?Q?G/6KjCsVrPHODBo9dVwfBG1QRRVmO3pVYg5T5Lu82Hyer93BxrhO5EYFbkEB?=
 =?us-ascii?Q?Xs66y6PSW88k0Y71PnyyX98nbesGt5UdqcQ8Ry8MXsjwFhB1rxGVV6reFVUZ?=
 =?us-ascii?Q?0wYI1mMPqjYAnji/G9CUmJPctGYvygwPV+/KSXNqGZ7ZifLq7C4jLRH3n+zd?=
 =?us-ascii?Q?hAZXAxMWgzUJC6xs1E9wXd5cnDiXHOTucQnbybjryXpSS2APCXAx6KMyQks4?=
 =?us-ascii?Q?w9Heg/Mx2S6FCtK3JOnd4qkiU7/ue9rTRFy4SN8uTdvKJ/VFEL9x5IEsGVkK?=
 =?us-ascii?Q?vra8UzPTWxgg1qtAZJ1IYsTYxWRZoyXlTBiznZVR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36221ec0-fac9-4904-3822-08dd8dabb3c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:11:15.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TvhFSCvUs/SFLTCpWTSQMOZiOdylRhRhD7L2r9vkqJPy/36qwCUHhXHMis4xgis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

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
index 28c56f423e34..b8b44d3aacd4 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -33,8 +33,7 @@ bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *pag
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
 
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype);
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 			int isol_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..673d41a06da8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1229,7 +1229,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2115,7 +2115,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	memory_notify(MEM_CANCEL_OFFLINE, &arg);
 failed_removal_pcplists_disabled:
 	lru_cache_enable();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 186d69c9f049..b905ed13c908 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6888,7 +6888,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
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

