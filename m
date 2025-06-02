Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F21991DD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908384; cv=fail; b=aNnjJFV4KFv8aLZoJY19Rz77WXvESMFSUDQ2CgEkGmXzAKlJuaHf7raIB9vbm6qACrkfB35mIP2rHDmHfLxcx0N7HDYA99n4YdwuX0LjjQXRPog2mAR/2fal/ktEzUZewVZOFJrrfZPrkFoTrqQZF8RvloMY44YoRlwPaFDDBPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908384; c=relaxed/simple;
	bh=6U9w1dKsYh/DEQW00DsMHKBMT+TqlZMfENr8pBytKIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R9djQqMOzDairkBX4kKBfdgHDh+Qqy8NjokZAT1VpouTk3wG7IPDMOdZqXQs/nZtnmV4nxFh8m3kFFvWaiSkpikjMHti7+991D4bqcGizAbI/1Dk18rwfE7Z5y9LI4J9cE8wNtgbTlNEh0EIJoFLo1RXglWg13JhlHbspUw6/hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jQFvogZ3; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jQFvogZ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZykmlmmQfYtZngGQ9XDFDz3awu+VwIrBcwmHi6x03BNjQWbdCa1eAmUYYtQcoUvx8hhjRbAlXbOVA9AmOUfl4vigT+YPHKaSjTJ3nM4v7AJ+D23/nv2dVD7G6OadQln7RXD2eZhx8XVBjxls7aCN0z0ulPEsker5ksMtNAfmHGcmrhpS709CgbmstR6U0dAc25zOujPdgU3leKeOKyxbiWrmJ6vlJp5erDMxq7iH1YgoU1hTZKZ0W6F9Zd+M0KjNBRWN2OeUqA1l+XnG7aZFCVRFcf+1Ofg5kQBCO+MPxF24XFpYPObq6/hOf5GaUJczlXoYTf6mg39QBICDlxNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S32XQEizl/6DUk/6LC99drW7fwx9X9K2aG6VfQn+4xo=;
 b=fLFhAmuzCdA1nI4mWWu+wyioWfPH9q871WCiJMpmgRgdW9es7oHEp/VKezOU31y9yR3tx+h5nCezUsrbyHZba6SIXChiTnYi8/aSJ5chJV/NS4KTSCW4iqbma+HNUYSdrfj46pI4COT2VkQD/G1ddmmB34oojJ5/PaT46K7Dj6z2FnNMyCE6jXrIWItO+xRaHDYa4YY+kABfZ1zJ1adnqhJXtRAHmhtLVepUp9du8OeX8TjjxwLF1J/bWvpMhcoCmfUBBrdBty5mweQ5H7x/TUiKee5m4eRg9xkLDd4bjt6uUT3/IwIyU7DIHcy1Ey9yfc5gDmzgFayxcEAcWofdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S32XQEizl/6DUk/6LC99drW7fwx9X9K2aG6VfQn+4xo=;
 b=jQFvogZ3Xbzi+de188kxcLH4j1hK6cMXTHHZO3AFB0sogXd6o10GNqin4fuJ78dV8K80PTwurUHhr0jFH5szTk5o0PbR2lgBn2T+PSxUq/LkfbTbp9RPWmoJRIBkw+pO2adhzJZ6c/X0HoRh3AWKKUN4dI89jrGjioSMNPS3PN5izU7PYfR/iibIkAzvGNY33UZzD2k9dC1nBxt5MPxmqLZ5RgxMNOPALBpQDPAMm9cuj5QnDmysT8UEbykS6QIGOHNKd6qj+57pQ6Sxm3lE3pUB3dHIl/kFxk5b2vrSLDYnIBvyyf582qmm6hacunFS93kKNbywwPXhyUCsvpO4kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:52:57 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:52:57 +0000
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
Subject: [PATCH v8 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Mon,  2 Jun 2025 19:52:42 -0400
Message-ID: <20250602235247.1219983-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: a3fceb6e-0fa1-4a29-aa3f-08dda230996f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMsYOiIQMkpV50fBvmQGSGB6L+RoR7QSV3s4tXzgVBHeajz0jCVF9P4k7OYl?=
 =?us-ascii?Q?2RTSwvtaFeYovJCJUHeiImJ7tENpabZqwGKz5utu0tzJ7Zn8Y5tckHi3ndYH?=
 =?us-ascii?Q?TvB2sxOOsEP5RCjuGzDqVCFtw9Y28mMS9EX2m8p7EdRHAbl+/V1bHrtkXFYZ?=
 =?us-ascii?Q?Qu66OHrGN+T5gmeN7lNNbTJD9V1LSKFoRiPLP8nKejBmI6A62azbYlKxiWeW?=
 =?us-ascii?Q?6YkYuXgJ3oN1WO9Pacp+su4E9nHly7k4Gu3T3L9y1jWB4Y5caKeQQHQyOLoJ?=
 =?us-ascii?Q?sPWDniPbKOWVSX9LkfSR6bBwbh/eXD+CgOHT5p5MerMUkmY0UivCjfCoXOKj?=
 =?us-ascii?Q?CuKFesY1j4v7OJtOQefVehp2SWMbgJ4IAKgXryqg3Db3Fq2D+B11WlpJftBw?=
 =?us-ascii?Q?X8mPSiMRe7Z5+2HBcxgKW84USPyr0gwn2vuNF/eyX0q9bg3Z4K03ud/3aziI?=
 =?us-ascii?Q?t9J+KmhwVVNaz9OTrVZ0ZRcKz2QHDX6iqVT8lttgCX+ghpfwKtCrPpDf+j2P?=
 =?us-ascii?Q?OvAvXIUQSGPB2M5xt3n3ui+xKYo960DS1XITuZ5FjAPdomCBGJ5w1szZUy23?=
 =?us-ascii?Q?OPOec+lbyNs/tQKTSl5y9uDcsbhO5B//lA0BxUSCza+Nq8wihvs5Kj/nvSrt?=
 =?us-ascii?Q?AImUi/fq0bFhUdPVkWWMVU7QRME4+bN+s9v9ySEGNCyqD+oNuLQelwfTxXEb?=
 =?us-ascii?Q?VlMe2A755qWBS2MuVUIRe6ZSVoaiCiLRFtcsNgEN0s7w9P7L6Ok23fbKrr0q?=
 =?us-ascii?Q?k/pnTDkYXzbTv4DeW41xlAvMCgDrJvF0o77Un8o/8H5tA3qy6RJEx6xSiOv3?=
 =?us-ascii?Q?nOCKyH4Bs7bLifjKUMG+4QsQiKVcqgfh4oFfEpiITJkNtGC2utx0nCH+CPre?=
 =?us-ascii?Q?i/asV73iJMxCS2mkrjuVw0mjDz9OUNWlwxMWekFN6j0IH0AAreNnVySM9Q5r?=
 =?us-ascii?Q?rOCRw6ASvKh9cpOUdpxHge1QC0eDKbdsqkc3WK8dUZ++bMEL7SHB2pVkHRPB?=
 =?us-ascii?Q?BRI29/W2Y5nxFkqJWhUsBkiRYlyliMndCSIUw70t5lm6opHrT2C4zmc/Qu3k?=
 =?us-ascii?Q?zSE8wr/FEiyYNK30hJgoDYs2YJESFdwr0dHHe9KqPqYZgD3zRqkDdersGOnO?=
 =?us-ascii?Q?DD09gthP77FuC6+cPyf3Xbht6A0WgaszfKKKb8EnUzv8YSLYTsCY85H6tTFn?=
 =?us-ascii?Q?RGBiR9qw0ebMaCj2E1ptp2/p0lNEL5zRDS/qyaV0YbEPkqXqWEtGeN7PWjYT?=
 =?us-ascii?Q?4jkq+ohWZTP2IXkhz4gbMatdPk2q4lsMUQQf8zNHscowW8nXPGehy0WflpKT?=
 =?us-ascii?Q?sMS/i/N6UD6RUmZNJmKb6PrJzQPeV9C1gVFZH+mg3vmftSO7ThWD3Myx+txO?=
 =?us-ascii?Q?lVAYUJd1QY/VmoKOSX/nYy0cHq5w+hQ2fFhcTKr/NgFkpwZMhZZcSSWIUFTI?=
 =?us-ascii?Q?+PN9FyhPDjE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPpUAvmDCene9t9O7Qlo30Ad6km3kp9bGDtcXlGD9psz5Xc6mj62+IHgvwXQ?=
 =?us-ascii?Q?PyJVDRAjzlLqwkkTCeOGFjIIFfSmaozaWYPiWQppvJQpSwNfmhZGmzQ4ZNrY?=
 =?us-ascii?Q?ZZhpVgcxFbZgrj+n7Q7uKBkr4K0hmqLQz/efWqnqiJMlIM+e8Q8f4aJCDYaA?=
 =?us-ascii?Q?PFM44kRSKcjPN5oXAkf/yV+f+wPuUC4T8UVVkM0FTppnRLhNJ6He1xxKwH9I?=
 =?us-ascii?Q?MAigLm76a+q4SrqNdaAh9pdPTkbslTHcj5qxvZbvEVQUmSUvd1yy4jK6M5Gj?=
 =?us-ascii?Q?wqLRnhPiGjYUMqN+n30OAjPvzFhI7wTIJ1yqXHjsf601Aj7ZIzTlqRfgVPEf?=
 =?us-ascii?Q?KUTcGEKKCDqde/cW7ssI0gwXTtbgXUZaaOWF8pitCbEhNxyxw8GGB2EdgGeT?=
 =?us-ascii?Q?/zpJcwGJiDRsJOJ5CO7PvSibqjY6Zkoi57vQDnm1Pt2LNvcLdJdvutRC4pgT?=
 =?us-ascii?Q?1/jFjIzG2XnPiRPid6ejvY/11Xj3k4dzIOrqSfMk3h9c/LaPFoL4ww+VljIy?=
 =?us-ascii?Q?nE6NI2XzCFCYODvYI+bdov/0Xea4DbRlb++B3Ed6VUxrpi/quyjTaMzLCG6v?=
 =?us-ascii?Q?6GiF0O+1U6vFiZDOzG18xYIgpKQLG/xUIsQzEVbAUS7r+YQ2yIxZu9f7TK5s?=
 =?us-ascii?Q?5vc+72SfQMT8HtFSK2g2YqcSWczxxB8FvWr7c90OsZVnsYM5EA0OnuN6G0og?=
 =?us-ascii?Q?ntgDjSxi2jOSnZCt9VIFtoMF3p09fe3zwzmnuHwkTAEz1XIvVvYmBK6Ho5ky?=
 =?us-ascii?Q?PY0ln77SOX12W4+ZnuUbi+Z9NND8VE4ZDcYH3we/2flbZp02QEOprOxKt+FV?=
 =?us-ascii?Q?U6nMKsQhC4K09+6aRF0r5xl692BsnLP3H2/d/dfLKx5honJaKdMv1jY9DGWG?=
 =?us-ascii?Q?LWH94UP5V8gyi/Zinqrdbpvt7floD9WR7fdHSeqeKHpNq7dKf3zd6n0UpKgb?=
 =?us-ascii?Q?qAeLB8wrtOXJh/aFMDlfsxeL/Jl5usRAYWanukESbvQKuE2kJcOHgAS5gsdr?=
 =?us-ascii?Q?Kc1PAJXBtljvcfMKIhtiFO8JXLpvAdSgGBQt2A80QBPiSaenH3T96OHrnvOc?=
 =?us-ascii?Q?i6Iqdevl3rMfNJWC6KgjaDMKmyrzFZvKOtDYrP6FASdm9lNf0xB8ydquiaTZ?=
 =?us-ascii?Q?yha63HymYJiMJvR/hDf9eHv3m8szY2v0EKKls9zotPMeYno9/8IThAJPMVaJ?=
 =?us-ascii?Q?YlYz99CYk1ohaTjSa3weUeARqmL8kAPuheDWpe33shjd4lORUsIEdY8qWVmh?=
 =?us-ascii?Q?99xMnI2Jmy0RFFvB78wpmKuilJnA9qQxbkjiYMBzSybqFwHy9rghtfos5Djo?=
 =?us-ascii?Q?7PTLWMvwfh6GND69WdXaq/uS69QNjPzfCVOt+depQzvlHdz4VJ+QWV4yq1J9?=
 =?us-ascii?Q?h4Yri/csuuW3lqjaFxpKD/RWul0xKx9pwz0ZaDbGkKRqIOlq8inWUyWf5eg0?=
 =?us-ascii?Q?QtvZ4KT0QaXVdE989oVHQUi2llW4ovgo1jAooxqMCOb3lLP2X3OXDzROyfW1?=
 =?us-ascii?Q?Lgu4Qxd81vrbQOIJQLwIX84MIsIXSVWe3Sy6brDWbtIZEVuSbP5IxtHhNrdq?=
 =?us-ascii?Q?/NaEEmqkxe2BiTzw4Fe2EdyFpky0i7CJiDxwYM0c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3fceb6e-0fa1-4a29-aa3f-08dda230996f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:52:57.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23624mqMf0/CMhrHs8SjuTNpvJGBIwiAlK5Zkjpg6/SJrd/YfdWBckxqF1bAcFeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

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
index 87a667533d6d..392a03e37610 100644
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
index e73a4292ef02..451b351c689e 100644
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
index b1caedbade5b..4ce5210ea56e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -797,7 +797,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 
 	/*
 	 * TODO now we have a visible range of pages which are not associated
-	 * with their zone properly. Not nice but set_pfnblock_flags_mask
+	 * with their zone properly. Not nice but set_pfnblock_migratetype()
 	 * expects the zone spans the pfn range. All the pages in the range
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cc9577a27ec4..74cb7696e527 100644
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
@@ -3127,7 +3220,7 @@ static struct page *rmqueue_pcplist(struct zone *preferred_zone,
 
 /*
  * Do not instrument rmqueue() with KMSAN. This function may call
- * __msan_poison_alloca() through a call to set_pfnblock_flags_mask().
+ * __msan_poison_alloca() through a call to set_pfnblock_migratetype().
  * If __msan_poison_alloca() attempts to allocate pages for the stack depot, it
  * may call rmqueue() again, which will result in a deadlock.
  */
-- 
2.47.2

