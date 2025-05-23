Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539D29CB4C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027613; cv=fail; b=LiLMQBS+U917SsTvRjB3XaBh0LipfEqRq5QXCMsF8175CUG5e3iAlTJMF3nu0OxDYafPQ7Zw0efq6MeVqi/1HNoX1cHHU1cehWk2JoWHcmGHEGUSavlDP+I4tBdWZs0FWLspRy+VClo4Ppux0BdrviHcbeDoG2USuaZ4CmBa1HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027613; c=relaxed/simple;
	bh=hmL18ByaK19MHoAk3edaiIqeQCxM2NTtoxjZESF3GZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tkA++f5h/2ZevZdKWHzZBHXxpR3F8WIolLRgKbls8ls8VajO+0MMREF9HuxLYdgymVagHKfK6C8EijoqSJKSVOADtdMIom4vSEGBqkJPECPYohkLHN4aQ/mnzy1dlmF6w/GPQBZeXbkKeUal+nWCye4XYX2MY88Ou76Q3pHGCD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YZzA0FJD; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YZzA0FJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipbnUYg8n5N5Y4+Nwl0qKIhEnrhKybKAD8j2yzHy88RThK+TVVwUEJAw1PUB+2ckTlzgWU3ShU7XFAq4bryoilKHzeiOBgbYv5B5/8wgVZxz8rPhO45+BQHH4aE7UldYVavV9T4rh+OV9Pg/KotDGCmHKEx1HQDNgv6c+bzp8AkDZ4jYkDAos19ZthGs8GW+bYieI5FQGEVFmRNRXmdVxVXsElQOSgvE+ayR6aXxv0Ldld7OkHKr9ucZYzrWxUj3NubCmYBXT/EG0Q9K1+TLh+nm/t+dRRQ62J9hWMpm/ktC7TI9Gv0WAv2irkDaBLlpLdG+gbLmG0bkl2qbjkkUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLE6JgsZ/zDAuvUyjHzrhg/A4SphG5j0r5A9tL/U78M=;
 b=fod/I+3scVYyum/1boOUT6N/CPYg8JCP1qYav2sKxZIIVAHkHsYSVm816UEFO8iFeIkURF8UJmdxfI+fmZnDgWP8UFQe49+CRpeptgwg4QuWWzjX7f/MbGI2dMv/R4TZ5qTETubJSwFWQA6vnpWYPWPTnIi+t+u5vjtVnjV8d4iwl+RptB5N20shvSvvfc6/4BgjMVSDZOFmma9Ji0K3hTKLeXGxHZTAqUURFOM+0NxFMH8oYViGAl3f4lxFiu7B+Zm8hAWBxFGIhJajG5ZxIjX0P5L0SVBEqVqOxsT8kPNEw+9HkXLQ5Hkk60efdF14/8/yzyxjwCvjFRPmQnA/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLE6JgsZ/zDAuvUyjHzrhg/A4SphG5j0r5A9tL/U78M=;
 b=YZzA0FJD40j4c9sNzw3Q0KwmJ05+bxiA+no4bil0j1lSoPDQj4yOWAugb6miLhEltmcQEzDAsYdAXbasbi1gMYUv5GqFc+OJObIKxo3LNytADclpIHa4LusNZ3wDiRX6rW5B3n4ljchpEIuVLefmtU+BTNzZyOJ35vpndTTYths8m/fHa6s5AUWlfNGn5KldbpgF7lS3+cp9URWPnqDmbgFi0p8tq19cohiBfcA2NZfGwxLkCm0Zj3a2HtSqSL222F6J3rNImWqJ46A3filH5Feo8FdiZN3WAidA9USXx0TwCpcYhzJ4JM8lVf3+G1jDtdt3mRCEwZspCJLE4jzzqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:23 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:23 +0000
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
Subject: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Fri, 23 May 2025 15:12:58 -0400
Message-ID: <20250523191258.339826-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 762740c2-03cb-4929-6d22-08dd9a2de343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7M0qJJCvllLOHG7RjCo98ENa1JvX4aixJ4xGc0TrrkQYufX8IC6gpfKGycGr?=
 =?us-ascii?Q?sDYrBG3MIqFvrGm0zNrjYH5Bdq6tjVsfcHJEZr9aFiJsjmKGxtoJ479bWOak?=
 =?us-ascii?Q?N7ZU8y/anhuIyiX2W/4xuu4bF6I6ZVl+iWOvpv/PT4l0ArkCg5miSDKu7j6U?=
 =?us-ascii?Q?dKMQW4E8WvU4J5SsvUaR4MCmMYHyRoo+EHtKB5gUBxikSV6QqV868BIRtOT9?=
 =?us-ascii?Q?8xfPwNjzjgnEscNgQrDFTzh5WGG1+TFkyRJsRZyjg5ABX5rBgAP9QWIhUgxb?=
 =?us-ascii?Q?5LGFifUutql9o054O8foyU/q/BUVIXqFiaSIQdlkDW7H4LT0Wez9E2ZnlyRn?=
 =?us-ascii?Q?mmychtYETB8TJQgsUfdWtaNF31jv0miF14BfmyvmzNJ7TKSE219a7gHeaeAO?=
 =?us-ascii?Q?8g21AghoGIFmNULtet1CsDt5eYlBWRZayNa0TJ+TB++XCMGgS+I8sxOMsnps?=
 =?us-ascii?Q?1MX63/5aey3NXMRmyE0gSyStObt0OFdAemlDHMmomUEgZQuKT42avwWPyUPV?=
 =?us-ascii?Q?KJtu6bQKO6fGxeiQyEhUXuizvMWO3bIFPaJwkQndazw6/+aSz438X4XussX8?=
 =?us-ascii?Q?i0TL97+tV4/x3W114gstsiIxIvKPRvNo/NvEvf2cSFsDO0rJ7OF86yl/vrfh?=
 =?us-ascii?Q?808FZXODfreAh+2H3OGn3uLYpaAkZpq5UvtRTQ3UpsGyq7glFxGu6VwnzUWq?=
 =?us-ascii?Q?z/PvTTvKPutMKKjgg9FrHGVeQ+LiWB8cUJ6GgXwzpOZwIjDOzbwRweyDk3QM?=
 =?us-ascii?Q?Ye9GlRR1bp+IAueJtFP99C0gbf1K6lboEF/QVvADn+S0sC+svGjEn9DFuJhB?=
 =?us-ascii?Q?2aI8K0O9hp1Wh1gJNeL7Wu3AaCMoq3cZxy7KiTmIskrE8m/q2PgChKug1Yd2?=
 =?us-ascii?Q?hiE8hqQ0uM3SNDyxnWFbUSY3Yjw3WaJthCl3jKfX8L8jj8nrW/BY2ZEf2SXh?=
 =?us-ascii?Q?VQR+qDI2GWdgZ1PWx6J1EVRezPVPb7r6EmpQXed0GexsS+WA5hgnDKl3M4mC?=
 =?us-ascii?Q?BpuQIjO0EwnMBcVVMTrDkrxiZ9QVQMxZCzofSuBGGAq5WtGY78FPtZKeXfcb?=
 =?us-ascii?Q?wNKyUSLSlD9ceSWU4T0APwSYduuFkQlyGphR2boCA45deS8pSl3No3G6UhhF?=
 =?us-ascii?Q?wxwlyiQKdl1AH2fHAkN6ntVoTBBYV6uYzUkurTkU2r+m+ktpUc4E9O1CWYP9?=
 =?us-ascii?Q?SYCIzp8IwcD8tBgrur+GuJo/bgdKoglaLSLtOoouJWxgs/V9vtW2ia9II4Pn?=
 =?us-ascii?Q?6DEMyUd/fpJMflcn1l/THSwHbZ8hp3Aq9EuTbQ95QJnTGnHdkMoQu19qKvG3?=
 =?us-ascii?Q?SXz2X9Fyrxu59N0CJcc2TvhWChxoNXJ+rcr1NuLWY57pdWicQb5hhhprvWjH?=
 =?us-ascii?Q?c9HJmN7+C11QjOyw7PeSiHDFGCr13Irwbh8iGf1+L9/NXHr//IA+chjk6vPa?=
 =?us-ascii?Q?LMwIZFb31yM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d5fkUob42+JzkJAdSCSWzzj+DzvtPYUiVqR4maFm33+s0u8edz+Q/fV/spK1?=
 =?us-ascii?Q?mhY1oDx581mzIoWPRsQVn5vxwFLjxqW62CLDrfoWnavayjj8iQr1JMW4GC2G?=
 =?us-ascii?Q?6Hovpv0sYcvsQvKNHuMnfnH3x8NvG6YalvclS3eRs/rX0vVkZ/VY97/c7rr3?=
 =?us-ascii?Q?GRN1xw9+TtvSZYhNfa9uaIrW1vhKTnepas1zQFZlCOq29SOn7At8wX5u4yNS?=
 =?us-ascii?Q?PHpuN1P4wkE9bCb6cL7Vuo+ovNC2XINupYJ3FtYQyGBfUAj2uY4zv3x1tqGc?=
 =?us-ascii?Q?t4dcZOEcaV4nMYlxfXNF2M7EKXiL5XEYoTd0gYmcSbYqPLBH2+tbQr+TI2LT?=
 =?us-ascii?Q?M4LuS9h56Fbl5C+9JF/PAT8xMTqkvigBf3AXWdIzXRUfaPOv3NDSTQVNiBjJ?=
 =?us-ascii?Q?qu3Fi1nXwrXEWedHxyTxK5jrFYzwiMjY4uGMlMe1Ij+MDkTqfYk8ctwq8W1n?=
 =?us-ascii?Q?2o2Iq2nOjmgawPBgrAMrPA19k9eB6bvriw3UX6i6ckbaddfjMNlbTH7+VxOR?=
 =?us-ascii?Q?B1HTMGDcecEWhgKqZnFG3MdL8HY/XP78BEkgtyI51ze4vzP+RJV3FR8LQoDm?=
 =?us-ascii?Q?0LtYXkyxLz0KdKLom89BlhL/FFCmfS90BrT7i0hxCz1bV+Q+WOHbt/K8um6X?=
 =?us-ascii?Q?g2Nrni3vOOuoUAEWkTa1S8WWz9aOoVZ+ocb/ehu83qF6qA8EUrxu72aZsoqf?=
 =?us-ascii?Q?WxcQWIZhe+VEqil67VxUn8gLJJ64r+WpAbcnkHlt2C3kGsc0muL8Z6cHg6H1?=
 =?us-ascii?Q?HMUBj+OuIP1yrDTTrUduG66rh11KDqMG4IaoDI/A6YYqA233imRgCU9fT4sC?=
 =?us-ascii?Q?akI1TK1Q3ofm/lTa1HNLjdkJTI6VUwNs9bHQPAUnGcw9ZuBQoXQFC/1ony9b?=
 =?us-ascii?Q?LyhQ7a61HW8taoJTprjMsl1oJ5o9+Cyc9e8lQFT4keooZaYymeLDTeOxqhEg?=
 =?us-ascii?Q?UCX/rrRtsXfdRfwGY/MnDWv6eIYjY5p+ahkcWwwAgmsqyUXvy5RpoiKhbEZi?=
 =?us-ascii?Q?sH7uFxnDYH2UDjmdxAZ8QFfSS7gS4QR4xv3whyM/EEfP8ShiwPEwjRDGCnbL?=
 =?us-ascii?Q?Bt2wE1I0CQIXxiq3348HaT91KH0jK9aHqsWU+ZH4b+NwDk4GUlx+AC26LhWy?=
 =?us-ascii?Q?IxkdTf+/tMsv4d6QGDGaMrJrLv0aBjFpc8MiPF6jwFISW07wL8fPxhhxO8Br?=
 =?us-ascii?Q?MaHsQ6wSH4NFt/lUBi5eKlwPauzMaYVc+weFb0+8syUqL6QSGOY1a+pvQpi9?=
 =?us-ascii?Q?PvwdwIBA+lmv9i7GI4FlKuoRmLW56a6QR6Wvx4jyHDKB55gOhOkb5f7mm7eS?=
 =?us-ascii?Q?+YSU1WlIZD3cEL2A1fgXhnc3a/VGQuPcrLD3b41u+ft0F1DebCpyK30VoOwS?=
 =?us-ascii?Q?WfL4XwpDPMxM+RB1nptKI8kHhU60IxBQ94Bk/Huu16Xfay1mRXrQGsUJIFTB?=
 =?us-ascii?Q?kOg8/X808c77cmkGjsGMJFLj/SDyBbHsNfy5BiS9QjI8BguMWsAPt67zbhDl?=
 =?us-ascii?Q?FrFHvSr/NnBFUfiT18Cj4TTiJVVo5JTdtbBn1tO/RBeklcyT2dOudmO3xmjN?=
 =?us-ascii?Q?EDtPLEJIUv2krWOVQ3v5//U8QEj+0IYdjM6TRzjm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762740c2-03cb-4929-6d22-08dd9a2de343
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:23.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/pblZUsXVc2P8D6kwgmfd+F1YI3nZtU7Mu7qgX87Kyd24dBLY3LD8PoMaX/WQDh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding CMA_ALLOCATION to provide the information. At the
same time change isolation flags to enum pb_isolate_mode (MEMORY_OFFLINE,
CMA_ALLOCATION, and ISOLATE_MODE_OTHERS). Remove REPORT_FAILURE and check
MEMORY_OFFLINE instead, since only MEMORY_OFFLINE reports isolation
failures.

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c    |  3 +-
 include/linux/gfp.h            |  6 ++-
 include/linux/page-isolation.h | 19 ++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  4 +-
 mm/page_alloc.c                | 25 ++++++-------
 mm/page_isolation.c            | 67 +++++++++++++++-------------------
 8 files changed, 72 insertions(+), 68 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..8accc0f255a8 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,8 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
-					GFP_KERNEL);
+		rc = alloc_contig_range(pfn, pfn + nr_pages, 0, GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
 			return rc;
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..dea27ed24f8e 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,13 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+
+typedef unsigned int __bitwise acr_flags_t;
+#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+			      acr_flags_t alloc_flags, gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
 
 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7a681a49e73c..b61bca909ddc 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,8 +38,19 @@ static inline void set_pageblock_isolate(struct page *page)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
+/*
+ * Pageblock isolation modes:
+ * MEMORY_OFFLINE      - isolate to offline (!allocate) memory e.g., skip over
+ *		         PageHWPoison() pages and PageOffline() pages.
+ *		         Unmovable pages will be reported in this mode.
+ * CMA_ALLOCATION      - isolate for CMA allocations
+ * ISOLATE_MODE_OTHERS - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	MEMORY_OFFLINE,
+	CMA_ALLOCATION,
+	ISOLATE_MODE_OTHERS,
+};
 
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
@@ -49,10 +60,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     enum pb_isolate_mode mode);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			enum pb_isolate_mode mode);
 #endif
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index f74925a6cf69..efffcf578217 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -304,6 +304,7 @@ TRACE_EVENT(mm_page_alloc_extfrag,
 		__entry->change_ownership)
 );
 
+#ifdef CONFIG_CONTIG_ALLOC
 TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 
 	TP_PROTO(unsigned long start,
@@ -311,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 int migratetype),
+		 acr_flags_t alloc_flags),
 
-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, migratetype),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),
 
 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -321,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(int, migratetype)
+		__field(acr_flags_t, alloc_flags)
 	),
 
 	TP_fast_assign(
@@ -330,17 +331,18 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated = nr_migrated;
 		__entry->nr_reclaimed = nr_reclaimed;
 		__entry->nr_mapped = nr_mapped;
-		__entry->migratetype = migratetype;
+		__entry->alloc_flags = alloc_flags;
 	),
 
-	TP_printk("start=0x%lx end=0x%lx migratetype=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
+	TP_printk("start=0x%lx end=0x%lx alloc_flags=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->migratetype,
+		  __entry->alloc_flags,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
 );
+#endif
 
 TRACE_EVENT(mm_setup_per_zone_wmarks,
 
diff --git a/mm/cma.c b/mm/cma.c
index 397567883a10..9ee8fad797bc 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index ab66acd3e6b3..44f140dee0ce 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2008,9 +2008,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	lru_cache_disable();
 
 	/* set above range as isolated */
-	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+	ret = start_isolate_page_range(start_pfn, end_pfn, MEMORY_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 499c3f40851f..48f458f7143a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6720,11 +6720,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
 /*
  * [start, end) must belong to a single zone.
- * @migratetype: using migratetype to filter the type of migration in
+ * @alloc_flags: using acr_flags_t to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-		unsigned long start, unsigned long end, int migratetype)
+					unsigned long start, unsigned long end,
+					acr_flags_t alloc_flags)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6796,7 +6797,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6867,10 +6868,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @migratetype:	migratetype of the underlying pageblocks (either
- *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
- *			in range must have the same migratetype and it must
- *			be either of the two.
+ * @alloc_flags:	allocation information
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6887,7 +6885,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6903,6 +6901,8 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 	bool is_range_aligned;
+	isolate_mode_t mode = (alloc_flags & ACR_CMA) ? CMA_ALLOCATION :
+							ISOLATE_MODE_OTHERS;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6929,7 +6929,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;
 
@@ -6945,7 +6945,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6979,7 +6979,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -7037,8 +7037,7 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, 0, gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..bcf6525ea238 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -31,7 +31,7 @@
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				enum pb_isolate_mode mode)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -46,7 +46,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (mode == CMA_ALLOCATION)
 			return NULL;
 
 		return page;
@@ -117,7 +117,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == MEMORY_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -130,7 +130,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == MEMORY_OFFLINE) && PageOffline(page))
 			continue;
 
 		if (__PageMovable(page) || PageLRU(page))
@@ -151,7 +151,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
+static int set_migratetype_isolate(struct page *page, enum pb_isolate_mode mode,
 			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
@@ -186,7 +186,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			mode);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -198,7 +198,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	}
 
 	spin_unlock_irqrestore(&zone->lock, flags);
-	if (isol_flags & REPORT_FAILURE) {
+	if (mode == MEMORY_OFFLINE) {
 		/*
 		 * printk() with zone->lock held will likely trigger a
 		 * lockdep splat, so defer it here.
@@ -292,11 +292,10 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
- * @flags:			isolation flags
+ * @mode:			isolation mode
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -311,8 +310,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			enum pb_isolate_mode mode, bool isolate_before,
+			bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -338,12 +338,11 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 				      zone->zone_start_pfn);
 
 	if (skip_isolation) {
-		int mt __maybe_unused = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
-
-		VM_BUG_ON(!is_migrate_isolate(mt));
+		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
-		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype,
-				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
+		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock),
+				mode, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
 			return ret;
@@ -441,14 +440,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
  * @start_pfn:		The first PFN of the range to be isolated.
  * @end_pfn:		The last PFN of the range to be isolated.
- * @migratetype:	Migrate type to set in error recovery.
- * @flags:		The following flags are allowed (they can be combined in
- *			a bit mask)
- *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
- *					 e.g., skip over PageHWPoison() pages
- *					 and PageOffline() pages.
- *			REPORT_FAILURE - report details about the failure to
- *			isolate the range
+ * @mode:		isolation mode
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -481,7 +473,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     enum pb_isolate_mode mode)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -492,8 +484,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_start, mode, false,
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -501,8 +493,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_end, mode, true, skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -513,8 +504,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
-					start_pfn, end_pfn)) {
+		if (page && set_migratetype_isolate(page, mode, start_pfn,
+					end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
@@ -556,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  int flags)
+				  enum pb_isolate_mode mode)
 {
 	struct page *page;
 
@@ -569,10 +560,10 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << buddy_order(page);
-		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		else if ((mode == MEMORY_OFFLINE) && PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
-		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
+		else if ((mode == MEMORY_OFFLINE) && PageOffline(page) &&
 			 !page_count(page))
 			/*
 			 * The responsible driver agreed to skip PageOffline()
@@ -591,11 +582,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * test_pages_isolated - check if pageblocks in range are isolated
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The first PFN *after* the isolated range
- * @isol_flags:		Testing mode flags
+ * @mode:		Testing mode
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %MEMORY_OFFLINE is specified in @mode, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -603,7 +594,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			enum pb_isolate_mode mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -639,7 +630,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

