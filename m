Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774928FFE5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652283; cv=fail; b=e/lxduLR0KgIx1+MEM3zHjUXIrQzIT1FDH703U1ttUUqU+8eQAbCbkoedyTJrZqTAbiZ9Qf8iNubIUlQIZFilFcETs+IUEIYXMR6QsOqCrrUShlXesVQ9CNK0OhDrYtmjwNt2L4YO1Q1Lc7YGfUTzfbjed5s+cFUTJlL4Yw8a/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652283; c=relaxed/simple;
	bh=x7cBj8NKCF6JUUECk7d9g6a36pv/OzJ90PTpffSwrEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C3ENvfdaFXkVjeiKujXOxBDN08Q5r00fJT31cN2LHZ+1jdNxwqGzWE9OeLLinlHL4iXPij3gYjY16mfcFkrPH4ep8mrLtjObPidA/wKTjtCLvHhoD73uk52ufTqHXdnul7qQq/A2xKdA+A6nbA3SJeoM3bRWE2k1sKExKdpEYhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bfS2PNIt; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bfS2PNIt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAUY88Ztu0JCaOqp8bpinJnaMQb04QaSr+Aag07N/TXWAoief4h4vvjWSEYBVNqxPlVWdkENKnsCj5M86v9aZacMREoZ8kYP6f6O/kmqlu+rZnUWx5ar7/jjC8H39J6yrfDkaqgRbKkTq7NbNOta4IWBsK2U5uDBdTGSHM7o5NOHaxli2cjDknSCqcM9g4kvC6JtpHMJdp1Cab+fChCDxutMhBT5j/0i9BPaJf5Mn60ZU/yAmktSab2W8XaFAPUcpn5IwunGezs8Ag+pZ1IdiS2Lu4D7C9cIO9/qHlLzi4T1ZWODd6sB4Ex7b4d+EjjABqRwTw/KOcLdCz6E5NWJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzF8ufaltHRAQkyS8p1M18gw6jY/H1TjtpborJvdGJE=;
 b=ebfIP3hPQcDr1dkVBTTejj0NTMTORUfOh/Box05Cf6G8BzTYRNgOoBPg875uT+TAiwBE7sDF/STPUoJNxtgqb+ApRp7eA+gjVK5XfYtBJA/JAhXAI489EecqlpMbBMxSnHffeg6WrVGII1uCzfBXeqA63oqFQ1sro4syKd0TVHMizZ9cV1DPxRSQNXUFvOzyDBFN4cIw3S/y1ODCa+Du26EgaRIPc1GrntlvjAgwSugKJFO5QQMV5H8qiUgGGe0eEeQDe+vF49JBWgg7ZiWUbo3zRpssdmuqcZQkyiHEhFHVu1VuHGXicNzubmP0JyqPPcba+tUHhJPn+Rf6KyxHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzF8ufaltHRAQkyS8p1M18gw6jY/H1TjtpborJvdGJE=;
 b=bfS2PNItIV02N4KtMM5/JM44we1AcEoE2HEPsg0a+MINadZq91BIzedtu/uFuo/xbgD+qHIl60g27z2pxHWqlkdXXUUEXK8wdBtRHfsBhEZjzafKd2wCfQC7PyVG0m4QX8iufTds6WcJkOzJ2v7d98djBwQa+lq39n8LqViiX4+AdA64O9GfrE2ilw8hhPagb+bn60Ul/5fS8Q0hohPE0ofFhrNSJLN1lt3d4+EcJhfURd03c5rPdGrZ2y4QgqSkJ4xXEB1THr5QpzhAdXzoCqCHK2f0+c9trHVQounzppncacKBAfRMvuyRG3zbGhC0No+cAG1oPJWcYY3JbXTyzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:11:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 21:11:13 +0000
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
Subject: [PATCH v3 2/4] mm/page_isolation: remove migratetype from move_freepages_block_isolate()
Date: Wed,  7 May 2025 17:10:57 -0400
Message-ID: <20250507211059.2211628-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507211059.2211628-1-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013DFE.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8ba573-92e9-49ad-3a33-08dd8dabb2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uqJ8F78TJoeWL3KhEf90Y2uYQ/yV+j1tx8SvJIc/bUuDcapm9EGrhy3/BgS3?=
 =?us-ascii?Q?5baSQtSBcUbrflRYVkU2G5MXNUZXNxiefpDX9rMPLUOnE3j43ENhkJ7EsQSu?=
 =?us-ascii?Q?WP9lQKBWWjgVzQxdlcjjKuoGmVvaHC+/gCj6AfyzDl/pOhLa5wogxIJpdfvl?=
 =?us-ascii?Q?wdZpXcEjFDZjupot2kw+bkuqlImqLj47F0j26CLu4lHFXLbfxf0owxMlUY01?=
 =?us-ascii?Q?353puxc37NO9VhWB27OGktgzG7xxH7SegAa9TDxwRwn8j8ewe/CEqyjaQHVy?=
 =?us-ascii?Q?N++pTJq9tk6hJnh6Ok2K2F7PiixJi0oWVi6mDTSjCoXpzcqWtWZgXq+L55is?=
 =?us-ascii?Q?VNWK9Qp20CAe167xfbZANd/QSEPNGJY5YBxPoif0Tul6hzpamXGXGTfcolVQ?=
 =?us-ascii?Q?LpcxmM63kGco2TvYmsTAAlpBqZoz2XG0cgCtqM/HiEEGlMNUsFwjTGNvyu+r?=
 =?us-ascii?Q?63DCE9nnnbbNwM2Iqzd9Ou4h1zL7GxVnAr0jRIXI74iTOdtbgZF485wRv5uH?=
 =?us-ascii?Q?jH/9sfFoATVZoty/u66lmBsUWtI82jb7Evmv3Ff31O7Toj+nuVkbT60Mg2bZ?=
 =?us-ascii?Q?GNXbw+bRV2xgEffeuzii7M6FUicNiLzTUK86oIVlclLJzVJ1RVUZTPPc7A41?=
 =?us-ascii?Q?O50IEe8aC6zVpmBx4VS9D58JDC3Z6kswfCLHAmfPpTb2Fhfdf9tQDPtTUJIz?=
 =?us-ascii?Q?x7/O7AfFv+stFHN4RwVsOlwEJp+TiqICvAgYB+AJfL+I/1SlTsy/HZXiliBB?=
 =?us-ascii?Q?aG0Udyt9H/NOThYUFJSmUEX/J0f7sZze2rm0749URexxSgj/pOudCCX3kOXT?=
 =?us-ascii?Q?G5+e8e84mYdEKpuPhiGd+9PZUvzQiqJwHug8oUfq2uU8A6Vp5DQh07JYUarR?=
 =?us-ascii?Q?7+17w6Bktwzwg/igEDfJ7G123Gagq2IQknwkICyFEMKS7/wv2TDKAvedu7PB?=
 =?us-ascii?Q?0bjMzsG4pcFHujDvGaTv91bRIXcXEiWt+O8lpw6F6yQPLjVUv89m8Q2/g/sr?=
 =?us-ascii?Q?lWIgXaLDoNVBtTBphKXV3PB02iDEgGhQ3OuMwtv7tvbfS3KkSiKwTw2YVSdx?=
 =?us-ascii?Q?qaOKM85n4ScFNHvmUJYe1/JdxCCnJY78lbyQ/HCnJoAsleC1hiNGN0tspJtE?=
 =?us-ascii?Q?wyCG+Zn39V9Z8b1RKhmlapU+1mx03i7D/A4t0K26KYKy74nN+ypnvH5M9E4z?=
 =?us-ascii?Q?YSjii24goYi6YfLD0Fgi0I/ajQdsz8XPbbV4wumcllR3Dc+e+DcmZWlskFhI?=
 =?us-ascii?Q?exTJKKF6XM4qhNdK9Ij/cvJ1K3VN8i/hxyB43F271sToploJxBM04cuowuhZ?=
 =?us-ascii?Q?QvvtzcpRg7bRAKTD6Pf+3PSvkTW7nvEdjZBZQC7h2sHN6RjdEInQKXufmIGx?=
 =?us-ascii?Q?d8cN5G6f0NlNxsPvcZxSBoKAs/3sWCZWb8uFWF15PgyF0uKdAEPfCrCLvZ0+?=
 =?us-ascii?Q?Y8t33SrBP08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?esoRvZo0PcDucXUg6L+wm8NV9Y+AG8bCqygPyvM5VoncSv6LQpn+jNtYsBUx?=
 =?us-ascii?Q?UPQzqc63bebmoZkXdFWdB1eqtwemDwdoS2TvRAkfSYUIE2Tmzpsh/NR1louM?=
 =?us-ascii?Q?JnQ3LDx6fPt2MWdQ6bVUM6ob2oo+pjbcXqgEgB0gRhcTc/XvCz2S87Z5PAHE?=
 =?us-ascii?Q?AYy/h7D7WutbMf2rUY2CBEHsj5A1xENZkM7XLZD5P6eAhjRDeTd2dytrntWU?=
 =?us-ascii?Q?qUemgabm7DqucJ0veS01va1dD+CSySsDUvThxehkKi+nE3fjrnaz1fTcQjYg?=
 =?us-ascii?Q?ftLlJFMjopwcBz4vPTs+YuOhC5AK/WueoJYF4YMLcUmP3jVug0AtbyWakD6D?=
 =?us-ascii?Q?WeMZ1CVCDaPEpvqabVqs0X0oqskVIvt3Yc0vTF+nXDI+YqgrerZzmo/bcz86?=
 =?us-ascii?Q?JFs+hr4AmNpiF9FjaZxSOY9coymtWdohqcJi+Vkn+EH3jqn0Rh8KXP0qCQeC?=
 =?us-ascii?Q?MWnA5iz8Qvq8gPodUAfVA3etTzK6lUwwkhqWn4H9hT+yiU8AfwjBzBA108/P?=
 =?us-ascii?Q?X18pF8LdHILu0f6WNKbjcOT/05GdF+WctlSMR+rsBbVFvnCF6+v580HxoMl2?=
 =?us-ascii?Q?pahmh6K/qDCTeV/3Vbcw1g8EYEyPpKLmbPzXtnB8yvQE3PZeXBeVLihml0t6?=
 =?us-ascii?Q?c/2UKcj7xn6UVYcKkgRVBg9rnZpuMqXbbrxzGzJP6WYnH8cvXrmSLwuXJXWV?=
 =?us-ascii?Q?7HQwVD8toOHQBDhZiUPr8Aa8GbCfjXTwMleFgjMWImNy1uxuAAau+Mphqrkd?=
 =?us-ascii?Q?wEqMDbeKA4N5aboF8p1UOJOHx7Fb1GVakG3TApI5LhnaMbOAx+sbG26cnq+V?=
 =?us-ascii?Q?EyJuYs3Hi5BLGPtBhwvaq6pO8N88lZB5k7pZATV83TsKgl1URAu8KEZoQQVi?=
 =?us-ascii?Q?LrGVk+NrY4JziIcjpDOR9OoMqDzzvXVZT7MNvXM5nbCKZTZct6C9jo6iC5+/?=
 =?us-ascii?Q?22MgQ3XNjG+FJtYDbiaGIog72QiZ+xyA71jjOLi/+e0xtX2pzA65mEY4Qjqp?=
 =?us-ascii?Q?fPZ0E5c8NRYmTTyMshDqRbCdRxVy2s5ucq72q0ju2yrg54CgNBZmFXNv//A6?=
 =?us-ascii?Q?r65gAWmKu3iXQGIQJrznyRosGXiBfYmh+8MJWk9gMqdndPBaFDnWNCZT0hlc?=
 =?us-ascii?Q?DK5xh8DzbQKwnv1ZZvSqAtAh8rCpYA0xA3ShSipe1ZgXsDSbZKQDDAW4yaOV?=
 =?us-ascii?Q?arIcn3n/YN4y+waqKkVqJpIYxx9r+ZKn1KhPS4UCJoWblqieGtzoJgAMh31a?=
 =?us-ascii?Q?6fqswHVXhPPVA2Kyx7jiwAHv4QXgQt74VQ3JncG8UCDUybBZXfYG+sopSBk+?=
 =?us-ascii?Q?ijWUTdXpRdkHsdJADylk7C7xYOiSmE0RHuooK/NhWvfy7yHISFQVtauUt+hl?=
 =?us-ascii?Q?9VC2LbM4EC/I99Jx0ahTtDILpVlZgzRrsKYrBAkhEaa507o2Jf1BSdZ2rg6k?=
 =?us-ascii?Q?tkJACaxWd4WxR2CWwWkZqaxzCMDl/Ivs5m/V+JvHEGB9dkrMVcJDRJUkMTFf?=
 =?us-ascii?Q?MZ2xY1rZVlzODkJB9xVp2gnAMPHQSRZu5Gm2F/Ers7DvXQ9gIAyQ0YObZ3YD?=
 =?us-ascii?Q?c9Kt3p4hjQk35E02wxNtTBvly7n/6UqBiz29qND3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8ba573-92e9-49ad-3a33-08dd8dabb2f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:11:13.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqO9V5rxdjxcWnQ+oeYtzFsVR9VFEmOA5DJG1z0MgQh/dlC3kgV+t26ldqDgKcqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

Since migratetype is no longer overwritten during pageblock isolation,
moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.

Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
when a pageblock is isolated. It is used by move_freepages_block_isolate().

Add pageblock_isolate_and_move_free_pages() and
pageblock_unisolate_and_move_free_pages() to be explicit about the page
isolation operations. Both share the common code in
__move_freepages_block_isolate(), which is renamed from
move_freepages_block_isolate().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h         |  4 ++-
 include/linux/page-isolation.h |  4 +--
 mm/page_alloc.c                | 49 +++++++++++++++++++++++++++-------
 mm/page_isolation.c            | 21 +++++++--------
 4 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9ec022a0b826..b88b98fb8a54 100644
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
index 51797dc39cbc..28c56f423e34 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -27,8 +27,8 @@ static inline bool is_migrate_isolate(int migratetype)
 
 void set_pageblock_migratetype(struct page *page, int migratetype);
 
-bool move_freepages_block_isolate(struct zone *zone, struct page *page,
-				  int migratetype);
+bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
+bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index acf68ef041d8..186d69c9f049 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1948,11 +1948,17 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -1967,10 +1973,15 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
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
@@ -1987,7 +1998,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
 		del_page_from_free_list(buddy, zone, order,
 					get_pfnblock_migratetype(buddy, pfn));
-		set_pageblock_migratetype(page, migratetype);
+		toggle_pageblock_isolate(page, isolate);
 		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
 		return true;
 	}
@@ -1998,16 +2009,36 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 
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

