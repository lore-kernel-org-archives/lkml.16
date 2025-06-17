Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A7B21C16D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126355; cv=fail; b=UwErIB5urGWmBUQ5fL+Iie49Po3d+es5C5z+puybgEz/9fd3HPzmkPVsDZqJXWAuhPUZ7rGgzJPcVfkRoags+73JtKG5g1+9ToC8jbuMA/0QalkmQIVIsmzc46w3Lv+uiPLbJzPjDUBesAPPdMab+Bbkgn5MqLDViHbFPIKQlHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126355; c=relaxed/simple;
	bh=Vaw4uKXFktsK2QkoVycqkyBrM2YsK1BHmChTsh1BKI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0Mm2BlrX2QEdBoXi0B3btCkJmBwrulFk/2erXxg0dHTw2/6iMHZxIXZLFsA5G5JkgYA/AD/RLHBBPvGniswWwrA6FzyIWj88M3Vcscf4W57jopbbqZJVetOM0ZwL/OSYL7rO5ZCHyLIGkLYvFZYxXe7iZNVf2xgA1luvTZ8EOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+LL3fG6; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+LL3fG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4YSaVLnrscSTbASdsfOYu1RjkV8am5B0OhDVoAIIDpLzpU+0H4JPWvYvy5lUvjKNKi8ihsyj8S+/xCCWxOdq46rZCp6zjIzLTdaeFu8cgD2YojZyO7V5VtLVaorj7lop0FmQWIYpqbqms/zyqUSi2j23J8L+EVqox68cgTSO/7VGhMTYYYy1LTvJrxT4O2ipLBRlmpt9UVj/TARulLV1F9AkPFvTO59mxoarb5ZJX1dLudA37gUYIRUab/yIt6+7a/tvWlWYQWNuZXHQ/QKRcxKDpk5NTNds170ZQxpGbSIGEJnBzf/Wv05mfcFCzfKS91jCYHo361wedXTTf7qsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjP6KZAdN18Ayzcw+VYjsBh+lBRJyJFtgmNXEjUOicY=;
 b=i0GAQVrWCDPuKGOGr21nxjrRYONkUJmvBkDO2QzETMFrJ3ZRoHaS5NxvgGfTFFn+9M0FY4fQJLqsAYKQXyZHtkzAIa73oKG3raH9u9DbO/OL/4HOtdR8xarovUZ/lXlPkLdfk9x2my2zrhfrg6N2q3YfYjXwaSj8TyLS0FH66vwmGlC70X8pDHU7Xh8d/qEqaXWZNETG/HzNFiXGzX4Hk6uzAgAs9tsJf/DbJPHyDzq9knnKA9tLo7VqRmd2Au4ECYwm520jZSmqI3Q8kHKhvprfpjwHWivV6NGdM3rpw47adtffnpUaMtp1Qc5tKxE5a8rBm8n06zB/jT1qSs9dMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjP6KZAdN18Ayzcw+VYjsBh+lBRJyJFtgmNXEjUOicY=;
 b=N+LL3fG6lCTuw2D9QoKP7wjeQkMTKwnOx29LpGdrBGP6/hqICJkuvEJTHf3NPl7TkxrN28guOyaxudWlRlVFCvjEDCtZxIN2CEJ/psk+88uA9CBK1AK7reVT81QqnB3w8uIldEOSMD/C01uiSnBkqBtj8z3aM8r+lnm048Wd7uBYyCQ51Ju/ovUDPiey7E57leukmTh/XoOvUU8zEQ77j8W90vFprfBDBrUQ2VvBfR0QsSwVbGsQGUevuujeOY6I0tLXlioT/Yq6P3IesDsFuiQU7EY2lOD+G5b7uKQzUoRm6QZ/Ur7oqG2jje/U+UtK0eJo/B/qmke9hUmX2obYlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:27 +0000
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
Subject: [PATCH v10 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Mon, 16 Jun 2025 22:11:13 -0400
Message-ID: <20250617021115.2331563-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617021115.2331563-1-ziy@nvidia.com>
References: <20250617021115.2331563-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0023.namprd19.prod.outlook.com
 (2603:10b6:208:178::36) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 4326986e-daff-4f51-7cdd-08ddad446800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a14vd5IVigjaq4iZZR4s7upaRBmSYYCKp5+5kyY1pFxtSrOcK4vHBMNcHT71?=
 =?us-ascii?Q?eZJnNaCRR6s2yvy7N4HSPS0b3zq0bL1EbrR3iKmVlx3KVAGE/IAkd4YZ0hmB?=
 =?us-ascii?Q?ha65TLdv9xL0AmIZCJ9ouUqLvV3CTbdZHfgMHLqOKb9NdFXXrUxN8u1+7HYS?=
 =?us-ascii?Q?yFkWHhHKf0e+wnI2fu0L15sApDzywSFQ4tVw8LlyyBDI1eRiRNG07NT6p52T?=
 =?us-ascii?Q?QTP9GlQmCO3+ReObl8fYJiG2q86Ba2FgbAQAJnXPoQwaABPa8/i93ooA4kYJ?=
 =?us-ascii?Q?IIjk85CcZYf2sGpSK3758z0JMg6aOa19eJegGe+reyK7LAG28+JhQCUnMQhe?=
 =?us-ascii?Q?k9S/xLcoGqPYSx+oJVM0cuK0xln8mA9jiqzll/ZCOaUtKb/evcl87Gfv23mS?=
 =?us-ascii?Q?d7Dgngi8MpmGt/r1B332nS2B/tUey1GSr8itCnpGP4sI65bBNdIvonUd6xd7?=
 =?us-ascii?Q?1d7AiiJGqG4/v4UryQPkiwcoS+1yoVFwNbU6HoNfaxgRicGVZ+DDld++IPLP?=
 =?us-ascii?Q?YM88Bu5tjwYkQqpSvkEBhc5Abv6jjzd6CE3IK6l49CHbI92m0QOsTl2erM04?=
 =?us-ascii?Q?JhmPHaY0f2mrxu6xUIRZz1etzQt7st3Y/Y6ooTqSQvvgLMUfv1lTy54K/DJA?=
 =?us-ascii?Q?7C92jXeDi0uIT+9Bb2+Gv5lM/lQ50A9mvwMNdakZWXJK4WdvdgFtkSrsNWWn?=
 =?us-ascii?Q?YvxJ6I1aaAXamKtyKJgeGz6ZDKekBvEcluGgFF9yhPgublAoWH5poZLQauAs?=
 =?us-ascii?Q?I2z8cbtcQ264NKWDT4Q40qJouyoSWW8Mu+RqSopjin+9m0HLZx6xINAb70DG?=
 =?us-ascii?Q?WAvCQ1WTpSHFHw23jIRljkYy2nvOSxaWtHbQ4ImaYbYA8PgxwYTh6oZDEMwy?=
 =?us-ascii?Q?u5zR6JyyE4RCunm6o48TOaqGcqhQSXAWZAvVM+N8NTaIOOVo5t99czCwcMPP?=
 =?us-ascii?Q?WgPfl1PVqd9BgRaiXWNQSYCNxGvu9F1OKDoVWInoszp3rWNEekGpw52M8tyT?=
 =?us-ascii?Q?OHo4/FydHSpHhwFf1VGTA9cu5Ye+C96odISmKnL/xpuByLseUcZgAtJybQWZ?=
 =?us-ascii?Q?fLpxk2OvSzUrzNNJ2KDVk4T8/EDyeavq5Rv/P6FzEkgP6RMbaIzl+DC3UqZe?=
 =?us-ascii?Q?W4eChu5evsjF6bB6bbqOjdAHMbQAygRr0ZoTNwjvvL35JWprCbBAmOhbi4ZA?=
 =?us-ascii?Q?uuxT/+8ZnpR5mpVYxTGWtfWA047QXOHCAioq0ZZLlMviCZiusQT4H6J95DC2?=
 =?us-ascii?Q?Ur7TA0lFtfSk0hclChlxdOn8Cd5mukhxrN3sGq72g5Kp2IDmpleCYM1pgYP/?=
 =?us-ascii?Q?JXD7+hVH+sroBG9uawr8uXHdqeDHiS3mKNoAvnnXAjV1LCUTyb3onN8rZXfC?=
 =?us-ascii?Q?Ee/VaJr+LFx5zfP/ZngY7OGS3dhqZCZJtyPwGHBwR1ho7vaDshrBljwLWJI7?=
 =?us-ascii?Q?7n4XTLqn+ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FSqLEJER7ff0BuItlJUGjSNlB144oj14/yt6JuqZF6musZF2idJ3QR/5Gs1i?=
 =?us-ascii?Q?Emjevl5fCbY8bs5qWqWqH9loK/KfRbhxfFtV+09f17HsQ13n0gITh94WOH1U?=
 =?us-ascii?Q?v4090iNmdShM4pGyPHxSTf3a8/LNPz03A9tae1TPwB+WqvSbpMVazEsKEML+?=
 =?us-ascii?Q?ZK5dbI9SjmgrkvF/XRxx2jxIt1ENEIJMt3hg2h4u658NF2/1IhFGkB0TJDbI?=
 =?us-ascii?Q?f2IxcU0V8KlJjT4lg+9yflXT0tNiGuFTOTJZCjy0T2Cy0dRu6PblgKHORAiT?=
 =?us-ascii?Q?fmEK2agKX7oKevNiCXk8/KNBkTaCHlOGJ+JfKkKj1DZJ/lz+yZ+baVkcZZHi?=
 =?us-ascii?Q?mBp10BI3Pm4SbqKDQeQT1orexGRkes2eUQl2L1WLd3U4YFE8wGtAkrS07eZJ?=
 =?us-ascii?Q?Up2tSwm6c1wZn9h5o52hYZ6Ch1xr/pcbWXuM+urKTe7r/1SoXQq5kVexc9C3?=
 =?us-ascii?Q?KfuCqsRSF7ZoVdHF5YMNd11H8D7mhZ18XxG9JIvIhydGQmMNOn6EzRaCE/JA?=
 =?us-ascii?Q?Xn8QcgOh0BeqJXf9zLoy+EBITonOjaIF0sHB7FC38C8wsp80tH5mjOVQ9cSf?=
 =?us-ascii?Q?1IKwhP/q+10tU4EZZRkfZC9MLAq+MiFzzaGuiXYi43Pd92+BWfRoos0J7p4m?=
 =?us-ascii?Q?p50R5T3bqpvE2gcxLkAFeaKUy6YygCA9QCY82g+hcQdfgsQlGc3kY7dZBpeI?=
 =?us-ascii?Q?35N+0OUhNzawkL1ppwDeNx22zTyXiiDbQuDQ4aV0rQV2nYLC7lwUtXVLLVIJ?=
 =?us-ascii?Q?BUmiYXwygdPYFMfa0rbCJqUoJhqppzqiiX/QCId2be3RzMSVFZF5ZjOBwoUa?=
 =?us-ascii?Q?TfeZF3prnQJLXSWKHBDTcGfJsVAf9ViTImUR4HyqeaR/X+UB0aFRMJqBsLQV?=
 =?us-ascii?Q?IjKSWFQIAl4XokUgg0mYxd7Csj/JEnfCZTldP4mfHLvD11RnjQ2mm+xiV8XQ?=
 =?us-ascii?Q?xhMmghCabGzNkTvVIpAUdEusw5QGKmoOZ3ICCzM/VyHXyAfh1w0+CGOeKBGn?=
 =?us-ascii?Q?JRPZiHQD6wEiuR/ghAaIL6WsFX2KSy4blwY1Tw8i+lsgX017mxqJyb31bALI?=
 =?us-ascii?Q?5Yx45lTuTrBpa/GfRfWSrgZiso7yU775UiwSFGAObSnrNZMQ7J7t690mssXi?=
 =?us-ascii?Q?lFKp/gLUtFGX5Wb4kuDho3Q2YL2hgkoCYvb3AA06aMuxoGR6DZbs/mri4zuh?=
 =?us-ascii?Q?56qk9VlYkUFY+ZICFn9vVqbcRpRYKvr1pNDKFXLSx5tZlC10CHiWiYXvm2Y8?=
 =?us-ascii?Q?RliYt7ygEpMwVtfo82Mx3sUzmZRyA2CWiTi+3DQ/XaWrbTZR45yuSA6Rn7g1?=
 =?us-ascii?Q?GNjcyB8ftajEsPvCcG2jwxZKCQ0TIjdmUer2w4KPjPUQdiZUhAN7sW3xUo/g?=
 =?us-ascii?Q?lvTL3Hl9cNP63cdTSQIdwErhDhwi8N8i9EmBSsHlWk7E+yPcr28vbPIIND8i?=
 =?us-ascii?Q?i6ou4MLNaMYzw8FBbsBQVccBYaHD46Y7qWU+4YzoaK8EfX8xnGjTRS2kNudk?=
 =?us-ascii?Q?lSEddOoK8BH6FkbiqjJlsRJlAipvmUKkppAPSMiStos+rmFnAH0MZxaXv8nX?=
 =?us-ascii?Q?HY63bTMkvqibrK5n7Mab9j+G/wUx3+kVMgekbjer?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4326986e-daff-4f51-7cdd-08ddad446800
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:27.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUxMaJN1arS0Dw41r3S9/LBzi1M7lBYubUY9zVVjNVKuV3pYn6PMT5Crt4Y+efMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

Since migratetype is no longer overwritten during pageblock isolation,
undoing pageblock isolation no longer needs which migratetype to restore.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
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
index 35f008364698..224987824a84 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1223,7 +1223,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2092,7 +2092,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	if (cancel_mem_notifier_on_err)
 		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
 	if (cancel_node_notifier_on_err)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 06cc990e2a62..64321f6b714f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6984,7 +6984,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
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

