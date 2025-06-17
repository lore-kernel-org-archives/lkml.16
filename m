Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B41FDA7B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126346; cv=fail; b=Iebhdk3xvjEQWhxs+X9hE5eaJrJ1h1qrY1VJ8OA0FWyXA5tU2p5N3SrOl+0oBo5aMrj9Dsf4kNw4MQajZrbX7abmL8SxUI8LlJ3svY2uzCp9sQQUL4ABLhiHT6SmteiVbZiq5WM4wk7HsY11PsXIBoJaR4a8sKByZVnaTEbrfCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126346; c=relaxed/simple;
	bh=N7UO7wHQXxuCm5PacS6BHJrNgpM2js1V5V2lHd94PiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=slP03kfk1sOver/xTWOgTWWyMQTaQyBFSWL8xRvyhGNnT3+4KH/iBbkGT08WXdhHRJ0dzw/PnhQW6sb6Zxjky1wZYqvlkRwNnOBt0B2vGv8FPUef4rm7QGwGUhgiKd1CxFzlBtOqEI+SZEKVz0QpYH2nLag1/Q9xwGdsRDY1ho4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sR23UqxR; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sR23UqxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrqyck0/9JVXU0fJOdQeaEOWY95q0+lt8RjYwOC1g88HXSa5alksB4wBGVAAX8V4xTLRbQ7Nu5TniuWKEOtzg6y5VBVSpg8vJhXJ7pBag7JU8xJ5NRAMMP8lCbIE1zNqcu/7QcAmNzDyyW+0bFPpGjWkjIEGEPDZrlXL0eQrlgA8CXcH4xk9OQPKQ8Furwhhyb3cy2uw2pO31NNgue092Yv9ouNdZoE1TaBPBk9ZBlDmXDP25V06G9wsUJ6dIEb9q5tIJeOKrzcJwTE+63iVPUhlZGdVksrtOaPhSMHcWZLFqln38kvFktIHmA8IZAED7DNnG7y1ZeQd6MHfz7SUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE8sLxzQaz8zGgNGZIBWr6Ap7mgkheIObVmJrbM19qM=;
 b=aabqOhD+t2UqxWdyNw7eqtg6X2LMGY03GMU8iDYXy1TQCzPc2zfYZgpvuGRE98ObcPJlxNNGlYwo7XJq2SE66eNTFrLeIKtuCmF6zH21aOxKGJk0VrVXdZLUEnjzM3IEh5YxYisWjEdbSJZVQqaGea4p7OyCW45AURwKBiGyTu2bEpESYjuSBM/hkIOxNdPjthEtxqG1Ow/oyqhwmg6SsTn3mI0qN49O2mYKvMtDTHrzzZDZOHCV6BRP3p/gJ3fi/VUlJTcnksPhB9E+ZvkFxGiREE5DlwWm7kjJ80wmeP8l6gwKvWBSb+0N+k1xytMQtvYCv5+bibCYQRQRPz4EUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE8sLxzQaz8zGgNGZIBWr6Ap7mgkheIObVmJrbM19qM=;
 b=sR23UqxRftCauBPfrS9QnKvwhNTxtehvkE3NqKKaQs09eW2nvqJdmbHQT3XHR5oVOkCNuXTJbU15A+bBAhePdf5QqxjcRLqWrBGyYYbu2VQb9pDUDxs4S69TvGO7bYYdlEjWBuKKg4eacGo9LB1NgJFohB/fMHjpin+F4ms/0hEXjHIyKbiFa964das8GKCUCFq0TuCaPj3fGAJbvzNKKWyRScUMKXLnMehEajxOZ8JRPTz6hqoZ9G+L43kxnEpzQqPDvGoFiFTRxN1hhXpr1y42YGciHG1gFmpJWbCMsO5xNTo+X4jLhJz5tIOoEz63iHhuGO+CA/PIGdTAgMCfIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:20 +0000
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
Subject: [PATCH v10 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Mon, 16 Jun 2025 22:11:09 -0400
Message-ID: <20250617021115.2331563-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617021115.2331563-1-ziy@nvidia.com>
References: <20250617021115.2331563-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0716.namprd03.prod.outlook.com
 (2603:10b6:408:ef::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c889f8-53f5-409a-4827-08ddad4463e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zyxlTrFlxskokZh5VvLCUAExUU82JWyw7WN0lElRaM12GeKjDzHULCQH7nbH?=
 =?us-ascii?Q?K62DAp/FeQ8HdoS+Y07aM2naQOvF9BQ5aOBazU+r1qCd6uIQQ8OakTIperAz?=
 =?us-ascii?Q?ikVAGCz2CeNX9rPw8cSupYkLdIhEx0iDWGXkGD4Sae3q7L4q3uwj0z60HSLY?=
 =?us-ascii?Q?lw0TR5Vp7eEhq6JliPjd4LbtqA6iiN/N1QeitZjDNbmBTGggUzp7h1vlC/yc?=
 =?us-ascii?Q?uCM6uXxH6BK5SIU1nCu9INQiBE1vOLeHDcUx9v3VVPbcWJtN4g+fWMZc/+K7?=
 =?us-ascii?Q?rqVFkv36UyL/uD8b6KZ8s2w/LWUcvGXsErOOUoVFuqZJhk6Uxjnl9AJ7UUcX?=
 =?us-ascii?Q?R1Hs+128NpCAm+oYVFYzkexvH5qtvBfP4ecXAytKue8iTSg3tCPa+aJiXDJM?=
 =?us-ascii?Q?jgbJlz1r9IC3NcMruC92dVswGRABb1l7Ofqa+V81pAg6ydk1ir/28VeEv6hq?=
 =?us-ascii?Q?aY7vnieLpGVyzjpoSs9+3VyztIetb8NJV21hfXPfyXXo4rH3vr65qylbmSN5?=
 =?us-ascii?Q?B0W9cTwHP2CNqUsLkhhC2nxYXNcbZO8E4rN3PJtfMuPePc4TXTwYEl7WxuoS?=
 =?us-ascii?Q?naQ1p/IRkwBFaUw3oItVtZ3AdQVw9OcnUAF77d+mb84LUwk4auDNLF0qKkrj?=
 =?us-ascii?Q?mpapj3A1hLSmdAqizP7auuvvEpcHh2AMRYQfOS3mzaF3zCaNSTf2DCB0Y0oB?=
 =?us-ascii?Q?i9n6jribaVSaC9cqCOtdTZ3TwlIEpej9o1NC1jD7FQVBjFGiMd7as2SY7s08?=
 =?us-ascii?Q?yecrglCtKiq2z045hSj5kpZbR0fCBO/yMyyNbqfnYORX8s7815qUmCJed0VM?=
 =?us-ascii?Q?93OvuzOAXqfq6NjzIbbUPEMsHc7ExYlaCBO8q5vsIl/9EurfhaxiGo7xwvxU?=
 =?us-ascii?Q?SOp1a3TxlVEt3XmXvtUR8tqULe3JrJNFMQV6ykC5vKpCXoa4EJD7e+DSqpzL?=
 =?us-ascii?Q?bMy2lyCJu7WOyb5ZbbMbRtHv8BtQ+3Pf/0Uj2UNBwf9SVnXal0kGSCqpXqMW?=
 =?us-ascii?Q?FZeTIzH5/rL9SHO16VufU3Cu8s8o11EhSVfY3DiDZkeONPHURjnk3cs2pzI7?=
 =?us-ascii?Q?KENIl83YztlT5yeQz7Bj1lehO/P4OK4rSLZFovS4JJtMGbSF8e1rBDlGVYfN?=
 =?us-ascii?Q?Vv/vkaRP95vGgIZkwXReghxzviBhfmmkLZOAGCNIjQmIBhdO8dz58tCRO+rc?=
 =?us-ascii?Q?EGKUd4dTBtQeOxl0hGAMwgtvGRgRRhjBKihywNksEfUQJvqBmOxXm1WbW7pO?=
 =?us-ascii?Q?PC31Rx8SIetNKbjL7jDSP3vB+hBoqgu/TWXQ9l3/HDmzTTow/CStJQJiM75e?=
 =?us-ascii?Q?m235489GB13z72iMsabXE6T/skimdspCihUlFMf9uaRXYJZGOunua/xBVt2z?=
 =?us-ascii?Q?XsgytkGRpbTETdnpkfrXUriKJqNZQUrP8MKJr1rcismuzEyVFcl0QRCjWlui?=
 =?us-ascii?Q?E2fQoVX+wRA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npm7AVQCPTUKC48Nk3PuEHCQfi38uW3v4jFNM+pH6/HS/q0zOzf0qXn2P6yJ?=
 =?us-ascii?Q?oAsZHpZlIJOt66A6YnEBnCi74hPvJtd38qLRue48zUaxO21JpvVnN5WCrYyC?=
 =?us-ascii?Q?V5JgO8RwShoFEi9tnGy7mY0P8vpP3r8CAyWoMqMbCjxGik/4AtQKoY7LRJ5a?=
 =?us-ascii?Q?oR3kLe5AOzIj3K6Nl3W5ba1H4Siy4eJGivcknuKAzR4icobjSmvFy01jPheX?=
 =?us-ascii?Q?mf4saugEGwrYFEj15sGN3FdRTQYhP6V4x9JBT585XTy/v5pAx8Y8v9ZgRIXv?=
 =?us-ascii?Q?GHk61M7gV7n2s3su8Uvy0n8m1b9VE5QJjtX/P2kKmjZLA8BfmdPIsGkU7876?=
 =?us-ascii?Q?vJExqDZ+9JbOIJ4z/TJeLAc97sH23BbCGKNlt+64+NvUKdrasTZ9BzlcC19M?=
 =?us-ascii?Q?Rcd6jaY1c1P83wYoNzTnwBX3c5xLfEuwL/tjUidK77nALxGG909QyNybF4tG?=
 =?us-ascii?Q?RZaTWGT+IzcDtyhrnb9q7B27iKWMwIyjCf+lSyq6NrCeIOv4ExSKTq2Uu1FY?=
 =?us-ascii?Q?Kd3kKMoHDjjjs+5zWbaqxyaLjVC4DzZ96GsxkOonp9FFpJaaB4PHia9aHVXl?=
 =?us-ascii?Q?KSCn29KCtNIcVObqgI/+Fjz5hgKbhoyGWJOLgcNqacdyYd94eI11IQQIV2TG?=
 =?us-ascii?Q?y//NyKydYGpPDSBH4fcXsoJymrw6xSkNSScamKg2BVwio2rFrsKuN/vPIenq?=
 =?us-ascii?Q?iAAixYynbsSpy1Jn3YxGlz2HRonlz9sWQ7DEgTQcJzD/Za82eU52J3lyBejb?=
 =?us-ascii?Q?7iSFN4uwpVbqClqSUEL7fqP2ih2/tAT9bcjkFvDybFVAhcf54EsfNn+ls2aR?=
 =?us-ascii?Q?BJWTbxJ+PjLB4c1jo9epk8W3aIMJnLur6M1zw39ln6ckA3+IrFOQlGm1YXxQ?=
 =?us-ascii?Q?i3qiBvzBFUs4XbJs79Gs3G4u8zWiO+4a94r3R+WqFKKjqFZaMY9j7yRE22TF?=
 =?us-ascii?Q?9CeWQ4fgoFwgZ1OoIrK6g+JfJAe5Qih2V8H6SgEMFLqn7jUA8B+wpmpRUNWk?=
 =?us-ascii?Q?6ZG155zjhfcYpxb/gz/YSZcd4MKiHZ7sJDb/vOJZzJwmycz0xqDbq/zeAK1D?=
 =?us-ascii?Q?q2utNHojh0HFBAtbpdp1a4lmU1kJHYa0B/4xQKp9sX4n5YIhsfPoN6wkDLRh?=
 =?us-ascii?Q?1y0WYZcEhO51WMBE9L1Z8jPlod7TBLoNdOZhLfdYcc4lXHEz3Q/s7/moBcHC?=
 =?us-ascii?Q?NthVAzj0wx8G+flXzivIwDpj1P6ccSbVKKA30EbYCQ6cZaqJUxX8xowgSHqA?=
 =?us-ascii?Q?ghOgOODK/mKIjThdqn6ysAnQhTTm95EGZflmS+1ZTSZu0DljzD03sJMB4I2L?=
 =?us-ascii?Q?rDYpN+7CuPT5Ol+73F3j5vm4t66ICX1pQrNL5jhORxbLJA8PpCRRaHmGULGn?=
 =?us-ascii?Q?nziwjwO9R8/lbcLwGQkr32EGnF8bWMMxi/BKfjNJRHvC0SvTKSfFjQv07fPn?=
 =?us-ascii?Q?9ATtdApCMdDTzJoFyzud26mihGxuNwftnggMsPyUlRLZ4k3RQ7sTp60Yl4Bq?=
 =?us-ascii?Q?QUK+eqWsF7G6YRYCIuW/c9Du+fDb6VkbTWF2M6/zjW52pVhXUMPo3H9TWmEg?=
 =?us-ascii?Q?IOWycrrrO9vOa0BlHLIdLT45mneyGnpm1nZPb0B0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c889f8-53f5-409a-4827-08ddad4463e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:20.4709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tepWsWfXvHeBAX+k7k4JgKc7aWDCbvw9WUP/8ubfKfHnYV2erYScBRkh+4faiY3o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

No functional change is intended.

1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
   roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
   right amount of bits for pageblock flags.
2. Rename PB_migrate_skip to PB_compact_skip.
3. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
   like PB_compact_skip.
3. Make {get,set}_pfnblock_flags_mask() internal functions and use
   {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
   flags.
4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
   PB_migrate_bits.
5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
   to use get_pageblock_migratetype() and causing issues.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/physical_memory.rst |   2 +-
 include/linux/mmzone.h               |  18 +--
 include/linux/page-isolation.h       |   2 +-
 include/linux/pageblock-flags.h      |  34 +++---
 mm/memory_hotplug.c                  |   2 +-
 mm/page_alloc.c                      | 171 +++++++++++++++++++++------
 6 files changed, 162 insertions(+), 67 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index d3ac106e6b14..9af11b5bd145 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -584,7 +584,7 @@ Compaction control
 
 ``compact_blockskip_flush``
   Set to true when compaction migration scanner and free scanner meet, which
-  means the ``PB_migrate_skip`` bits should be cleared.
+  means the ``PB_compact_skip`` bits should be cleared.
 
 ``contiguous``
   Set to true when the zone is contiguous (in other words, no hole).
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 5bec8b1d0e66..76d66c07b673 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,8 +92,12 @@ extern const char * const migratetype_names[MIGRATE_TYPES];
 #ifdef CONFIG_CMA
 #  define is_migrate_cma(migratetype) unlikely((migratetype) == MIGRATE_CMA)
 #  define is_migrate_cma_page(_page) (get_pageblock_migratetype(_page) == MIGRATE_CMA)
-#  define is_migrate_cma_folio(folio, pfn)	(MIGRATE_CMA ==		\
-	get_pfnblock_flags_mask(&folio->page, pfn, MIGRATETYPE_MASK))
+/*
+ * __dump_folio() in mm/debug.c passes a folio pointer to on-stack struct folio,
+ * so folio_pfn() cannot be used and pfn is needed.
+ */
+#  define is_migrate_cma_folio(folio, pfn) \
+	(get_pfnblock_migratetype(&folio->page, pfn) == MIGRATE_CMA)
 #else
 #  define is_migrate_cma(migratetype) false
 #  define is_migrate_cma_page(_page) false
@@ -122,14 +126,12 @@ static inline bool migratetype_is_mergeable(int mt)
 
 extern int page_group_by_mobility_disabled;
 
-#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
+#define get_pageblock_migratetype(page) \
+	get_pfnblock_migratetype(page, page_to_pfn(page))
 
-#define get_pageblock_migratetype(page)					\
-	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
+#define folio_migratetype(folio) \
+	get_pageblock_migratetype(&folio->page)
 
-#define folio_migratetype(folio)				\
-	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
-			MIGRATETYPE_MASK)
 struct free_area {
 	struct list_head	free_list[MIGRATE_TYPES];
 	unsigned long		nr_free;
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..277d8d92980c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -25,7 +25,7 @@ static inline bool is_migrate_isolate(int migratetype)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
-void set_pageblock_migratetype(struct page *page, int migratetype);
+void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 				  int migratetype);
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 6297c6343c55..c240c7a1fb03 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -19,15 +19,19 @@ enum pageblock_bits {
 	PB_migrate,
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
-	PB_migrate_skip,/* If set the block is skipped by compaction */
+	PB_compact_skip,/* If set the block is skipped by compaction */
 
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
 	 */
-	NR_PAGEBLOCK_BITS
+	__NR_PAGEBLOCK_BITS
 };
 
+#define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))
+
+#define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
@@ -65,27 +69,23 @@ extern unsigned int pageblock_order;
 /* Forward declaration */
 struct page;
 
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-				unsigned long pfn,
-				unsigned long mask);
-
-void set_pfnblock_flags_mask(struct page *page,
-				unsigned long flags,
-				unsigned long pfn,
-				unsigned long mask);
+enum migratetype get_pfnblock_migratetype(const struct page *page,
+					  unsigned long pfn);
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit);
 
 /* Declarations for getting and setting flags. See mm/page_alloc.c */
 #ifdef CONFIG_COMPACTION
 #define get_pageblock_skip(page) \
-	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
-			(1 << (PB_migrate_skip)))
+	get_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define clear_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
-			(1 << PB_migrate_skip))
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define set_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, (1 << PB_migrate_skip),	\
-			page_to_pfn(page),			\
-			(1 << PB_migrate_skip))
+	set_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #else
 static inline bool get_pageblock_skip(struct page *page)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index dd1c4332347c..ddc6c6c63a30 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -774,7 +774,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 
 	/*
 	 * TODO now we have a visible range of pages which are not associated
-	 * with their zone properly. Not nice but set_pfnblock_flags_mask
+	 * with their zone properly. Not nice but set_pfnblock_migratetype()
 	 * expects the zone spans the pfn range. All the pages in the range
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1d46d0fb1f61..b303f60b6ed1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -353,81 +353,174 @@ static inline int pfn_to_bitidx(const struct page *page, unsigned long pfn)
 	return (pfn >> pageblock_order) * NR_PAGEBLOCK_BITS;
 }
 
+static __always_inline bool is_standalone_pb_bit(enum pageblock_bits pb_bit)
+{
+	return pb_bit > PB_migrate_end && pb_bit < __NR_PAGEBLOCK_BITS;
+}
+
+static __always_inline void
+get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
+			   unsigned long **bitmap_word, unsigned long *bitidx)
+{
+	unsigned long *bitmap;
+	unsigned long word_bitidx;
+
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+
+	bitmap = get_pageblock_bitmap(page, pfn);
+	*bitidx = pfn_to_bitidx(page, pfn);
+	word_bitidx = *bitidx / BITS_PER_LONG;
+	*bitidx &= (BITS_PER_LONG - 1);
+	*bitmap_word = &bitmap[word_bitidx];
+}
+
+
 /**
- * get_pfnblock_flags_mask - Return the requested group of flags for the pageblock_nr_pages block of pages
+ * __get_pfnblock_flags_mask - Return the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
  * @pfn: The target page frame number
  * @mask: mask of bits that the caller is interested in
  *
  * Return: pageblock_bits flags
  */
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-					unsigned long pfn, unsigned long mask)
+static unsigned long __get_pfnblock_flags_mask(const struct page *page,
+					       unsigned long pfn,
+					       unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 	/*
-	 * This races, without locks, with set_pfnblock_flags_mask(). Ensure
+	 * This races, without locks, with set_pfnblock_migratetype(). Ensure
 	 * a consistent read of the memory array, so that results, even though
 	 * racy, are not corrupted.
 	 */
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	return (word >> bitidx) & mask;
 }
 
-static __always_inline int get_pfnblock_migratetype(const struct page *page,
-					unsigned long pfn)
+/**
+ * get_pfnblock_bit - Check if a standalone bit of a pageblock is set
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to check
+ *
+ * Return: true if the bit is set, otherwise false
+ */
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
 {
-	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return false;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	return test_bit(bitidx + pb_bit, bitmap_word);
 }
 
 /**
- * set_pfnblock_flags_mask - Set the requested group of flags for a pageblock_nr_pages block of pages
+ * get_pfnblock_migratetype - Return the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ *
+ * Return: The migratetype of the pageblock
+ *
+ * Use get_pfnblock_migratetype() if caller already has both @page and @pfn
+ * to save a call to page_to_pfn().
+ */
+__always_inline enum migratetype
+get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
+{
+	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+}
+
+/**
+ * __set_pfnblock_flags_mask - Set the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
- * @flags: The flags to set
  * @pfn: The target page frame number
+ * @flags: The flags to set
  * @mask: mask of bits that the caller is interested in
  */
-void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
-					unsigned long pfn,
-					unsigned long mask)
+static void __set_pfnblock_flags_mask(struct page *page, unsigned long pfn,
+				      unsigned long flags, unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
-	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
-
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
-
-	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 
 	mask <<= bitidx;
 	flags <<= bitidx;
 
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	do {
-	} while (!try_cmpxchg(&bitmap[word_bitidx], &word, (word & ~mask) | flags));
+	} while (!try_cmpxchg(bitmap_word, &word, (word & ~mask) | flags));
+}
+
+/**
+ * set_pfnblock_bit - Set a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to set
+ */
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	set_bit(bitidx + pb_bit, bitmap_word);
 }
 
-void set_pageblock_migratetype(struct page *page, int migratetype)
+/**
+ * clear_pfnblock_bit - Clear a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to clear
+ */
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	clear_bit(bitidx + pb_bit, bitmap_word);
+}
+
+/**
+ * set_pageblock_migratetype - Set the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @migratetype: migratetype to set
+ */
+__always_inline void set_pageblock_migratetype(struct page *page,
+					       enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
-	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
-				page_to_pfn(page), MIGRATETYPE_MASK);
+	__set_pfnblock_flags_mask(page, page_to_pfn(page),
+				  (unsigned long)migratetype, MIGRATETYPE_MASK);
 }
 
 #ifdef CONFIG_DEBUG_VM
@@ -667,7 +760,7 @@ static inline void __add_to_free_list(struct page *page, struct zone *zone,
 	int nr_pages = 1 << order;
 
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	if (tail)
@@ -693,7 +786,7 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
 
 	/* Free page moving can fail, so it happens before the type update */
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != old_mt,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), old_mt, nr_pages);
 
 	list_move_tail(&page->buddy_list, &area->free_list[new_mt]);
@@ -715,7 +808,7 @@ static inline void __del_page_from_free_list(struct page *page, struct zone *zon
 	int nr_pages = 1 << order;
 
         VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	/* clear reported state and update reported page count */
@@ -3123,7 +3216,7 @@ static struct page *rmqueue_pcplist(struct zone *preferred_zone,
 
 /*
  * Do not instrument rmqueue() with KMSAN. This function may call
- * __msan_poison_alloca() through a call to set_pfnblock_flags_mask().
+ * __msan_poison_alloca() through a call to set_pfnblock_migratetype().
  * If __msan_poison_alloca() attempts to allocate pages for the stack depot, it
  * may call rmqueue() again, which will result in a deadlock.
  */
-- 
2.47.2

