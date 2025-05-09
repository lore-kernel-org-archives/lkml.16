Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C92125F7AF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820891; cv=fail; b=FedzhVUjhfL880S3tQCzsydvzY9Cf26uX0uj37gKmWFd26YJ6n3jI7+YwI6cw6wInIg1vjQM9/hs54Hyv+eKqYlhRi9qwwJ+v60lMPbLA6u9hL8jYrHanJyTJ1obJoSKLgHGSoVlJY1Kv1oJOkia/nsVu9ksq7XNVdghEpVlo2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820891; c=relaxed/simple;
	bh=A69B4go+63kFPJ6XmlGmtJ+fKYMjWtG/vFBPpX3e/k4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mvduSZBLQxMTNpW9q4EdtxBfRLj6CITNQzzkwzfJYvtJGHrj3UbNp4ZP0aEDCsetjwQgIJgRUaQB3a8c0w0UigUhATCLejY5JP6o3CCVs08DcXLskvXwEZjVmnehnstOCNaVHLJuKq5aLBcHtkfc0ixstFS9RNbGjFRvh99c/zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=al5u43+H; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="al5u43+H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7h/+XlsryNEmvK5mutVDF2vIAyFOV65ugEh47O6qyVvH4fghxKBi/l2AA8WNssEmBQx63cpOtL3BpeU4TklSouLawPq7q9JLWflh0SLzXob+x808e1RnbO3VzGfpDkfMpPAbka4kWp5B2Ojgr9qGS+7pT8rJfo4jbG9PNfPwliFOJ3nLtICSmguxL/2zvv0/PHVZgroXSR8o5x+QsJoGuUFRM4ubudc9B3Uqbry+7rkp8+zaqFz2i/n+O54A+Conir9GgtSD4oV72vnLL8qo3ip9eQ1aTNg2H3311Rg8g71zDU+BgjhUZCGQTJVdIfrEofgrPYt4j7vRdnx2zVNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvjTEbyN5vP8uqEmqNzQrIPg73GWbXUYzgYe/5FpSIo=;
 b=tjXClh4jmy9SVk3LgcUWtrE0upOlA0jQkB0dRZMFqOFXziF7luyFnu9mRBImdMRZGD83siDTB6WWzRF8Aj/IbR0t8xy2ziZgp1rNvPl3tXlsfRskracZcPfY6Q8HFwfE3NV4/E/2WMssmXrN0TLd1vZ37jXycr8wJUZ11PkRpRX2JEfQWy4rakH/XaS9xcm/Pnwx25eqqTH5dHQau6ebjaxz4i60oFh1xxZ6uUGVmGhKFOoPBZ9aSp7mqvdtUJ15MztW1FZ19w4dXhCQsmegVArbebvQhFmwuvdHBve45USaPJWk1qLAFeuKTn98msDXNMMSsIrEtmqiIlST03O+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvjTEbyN5vP8uqEmqNzQrIPg73GWbXUYzgYe/5FpSIo=;
 b=al5u43+HlEWMpUlKFQ+iVYIgLfIg3DVEtuuzSebTvk7D0BjKrPB6KC8h4w6EW0oP7osqsoWKwfIXjhBzwBh3YX6vOHR3eNFHAzBdshJqApqAJzfA07ur6/n6xP+UiD8JDkGPr64a+5lPZCtI/yothMomeboJ6yD54WwPWg3wbicNaoOl0NEFm/wff4nSBwy/ovciEP+5f6uqkGvWDxhI+QOtAbGSpHNd8E3XNI006wABib29lu35iPNaQUA7zCkQDmncrKaQyqNDRAH8YhuKywHC2CY9Dqsmj8UNR6sfRAVoEdezCMpPMEfNfQ/Cw2x+ynVtw5Kp2e+qKprjyNAQ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 20:01:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:19 +0000
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
Subject: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter from more functions.
Date: Fri,  9 May 2025 16:01:11 -0400
Message-ID: <20250509200111.3372279-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 129c15dc-5739-472a-1b99-08dd8f344377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daeAftTpw2Ph9MNiPcShfx5vH/0HHwKeON7K2CjcgQwWhGx1InuhOIcEDvvb?=
 =?us-ascii?Q?yb9lSl/zeGCO1iWpNgx23PhsPOUozomR9v62LHpWrAugdoI/q7BJMhaid8Zo?=
 =?us-ascii?Q?AgoF5SGEdAOzlgq+UgzWwC6SsjRPsgrrpoHPECVAkoZQjMM55mh5PbHVThzx?=
 =?us-ascii?Q?nPUvV2elphGuI0LUTX/JVHscaZzym8JxVVmCLP+7m+0oOtXIt3e0GchmxBqk?=
 =?us-ascii?Q?ytlAWPNwbOnAcHuSvnJ8OMh/C+S5Zye50EweMjBkfJlOo5Zn/RJzL5c63eKf?=
 =?us-ascii?Q?Kym0E+PQt++JIF/l3l5QPKnBpbNRrtvBGxPyPk5zWfQpL75dyAzhdbfhLtVY?=
 =?us-ascii?Q?exTY2lPB8lkYRIdRu9CEHhMJg0Z+W1ar6efrr35zLNpYY/qpiPo5gu/EeEJ9?=
 =?us-ascii?Q?Wzs/GnHfidlZPHUqj4KztG6RI/jxDFFupj2USSt5dsJJYwEwRwX45Idt0lTP?=
 =?us-ascii?Q?JukJCmGzXPtyjxBMAmQOcrlywU08s/jw6J2eSRhBhgIaDpwXaYPVd8WqcBvl?=
 =?us-ascii?Q?lutRY4bXUtAjgDdYyl30sqWsLjvQpp/enmzNIIV+NaTRAgh+DCyVSUyfFTvO?=
 =?us-ascii?Q?iR8nxuf6b+tC7ql2hR2JgHoeljBPrIh8d9h74jRpDkKeCHRoQ+Iul9rM1orq?=
 =?us-ascii?Q?1qDkr4JrrRsrwDBv7dOlDwx9/67+Ds3tKX1spKcG1m/r7Aa4wRZ+vGlf2HXB?=
 =?us-ascii?Q?1LnL610zv9Zj0a+cFXcvu5ddaFhTS2LglvGWlnNrYXPUuIOTRR7YMpq+PsRk?=
 =?us-ascii?Q?UTYCZW2oljkHBuwTF/F765XjINmD4Jl3RRsG3vs/KIkxkNHC9ArJxA0eMBLV?=
 =?us-ascii?Q?+4QA6MPr3nkdb5HjRKEgD83fYsfcy+u7jAr/CA6c0xmBXpqME/SnDWWwOB4c?=
 =?us-ascii?Q?MolizANxWrBrYUEc76HqORsgLHrvq6LJoZWPOAvZa+gGUzG7OgBmWT1i3EOM?=
 =?us-ascii?Q?vNFGwELTCP7pKq7trGBsyzM9BBGKm1Yh+PJRseAVN6xaj8zLAMzic11xGxkS?=
 =?us-ascii?Q?adSgNOfElO4jYHcn6XkfWhUdZgpcuO2uQEoBB/sT4aszZ88lXAqva0fOsT9O?=
 =?us-ascii?Q?vgigN9EcgxG8yGFQInGVOr1RHBm3ZecCcjWK2AsI7CHe0EIfLADft9vyFWdC?=
 =?us-ascii?Q?3vDXSfaPder9owk5noHCHY9JUadK117UqcC7oXLAfkRpbi1cbQ6nRBEZ/Lh8?=
 =?us-ascii?Q?x5MJCd9kV4aawMBPWCQNsnOmLbW+tbuR8j01Z3CYU5skDmNv0NFRpOQvVZXL?=
 =?us-ascii?Q?5XMD61eXaS/TljdhrMqB6Lvph1cztJVNp+I1bNQbQXAQPZPKR69j2XRu2DQf?=
 =?us-ascii?Q?JnvcsLOUV+ktSWATuTeJpn6UdS35jINFjJO3zXxRCL5wAoHXVvyoVai/l5J5?=
 =?us-ascii?Q?Im4vBmGko9IQP+pFSJPikzEooYeaG4gqSil02pUXsYiURgT3meTyfkknZWnf?=
 =?us-ascii?Q?TjntDQmv3sQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ml3BFpUCoChZpXNkxcxXLlHgPFTiBM5D7ZlXl7eWNnFn4jOY8AlXFj9/S241?=
 =?us-ascii?Q?X+Vh3RBgrWkYeUhTDoLpIQrXlgpeCmM6uk9zrtHWkA6ibp8KUKlod1fhw2eB?=
 =?us-ascii?Q?TpvwOgCtTrWYLtUUwySupqvm/IlnO2RPszaEoTtDNcQ494AUtawacQr98bZP?=
 =?us-ascii?Q?LXIYD8S544Jm6J2NZE23mfjrxAe8Xb1nq2M9s0yCHFOivtxrprilif1Nciwd?=
 =?us-ascii?Q?n9eBNvyKYR1auK+Nxv5dLsL1ZlQRIHJcTm/xn7juYbwtdtLIGmgtb2JJa/4F?=
 =?us-ascii?Q?xfa/9RR8BYrxfeZ5ceco++N/b7PweRMe5FPUIngS7t6rHgIKu6EwAy9PYb3z?=
 =?us-ascii?Q?oojjOccnMwdP9W8YtYXbShyxYPA6qJHVqhE44l/oSSarxd1eDryQ0Ffg82Fv?=
 =?us-ascii?Q?sCAjCfGhD4oJVkht7kMM7gr1WtM/Xyo9KI0cH5dP/qKe4MZFmS1obnder3pG?=
 =?us-ascii?Q?TIKWq0VcXKWKK7u3GvC5Eodzb1cWNW7gELiAMQp6bUhAr9tcKyEdakbmgVFk?=
 =?us-ascii?Q?6CkYgv4i7A1FIkr6DP21XlfGC+Gt6GQoHDl0tgqfGNSRrYKBmRw0D8pYB5jU?=
 =?us-ascii?Q?JDCBBirwHW96X4spKzzElkaF6ROsxeue1z/eJFN6MYZVU7aimO6TgETYuX20?=
 =?us-ascii?Q?Neg8YLIjoOLfFNUjAaNcotLhex6WA/EE1ezdZQY1bDWWi3n8Q3osNgDprRnz?=
 =?us-ascii?Q?Ht5EmJ5x06BV4HgzYvvjVh70mQyij4RW2Gdj5R2uCoIsaNZ1SLtQAiDMR+ci?=
 =?us-ascii?Q?HNFkLnFQBZTUy6c6MKueHX9VR4g0uz1WQjv3B/hZQdLqKyNNUbunJhyAZ8Ix?=
 =?us-ascii?Q?ua7LHJxANs066teLY4mOQwOe/kOxwSCYv1qLgM7/7SB8btokd76ylkvQNeHs?=
 =?us-ascii?Q?XP2N1GcCNy67wZbKJnr7oEUKI5nLIWW1q17jQkmQwGKTyJY8XHgphu2WO1Cx?=
 =?us-ascii?Q?pvGslQQ2o32mjKYa3tTv5QheFinIpYTyAOcgRENose/zv2nenmmvHryyFOXK?=
 =?us-ascii?Q?TezJTCaGhkKCDap5SRFrAUSNIDJ4CeVb8tttdLoWtZcf8/dIe1Kje+DuRpZj?=
 =?us-ascii?Q?6f9vhnzKISiam3RIf5Kwg/au5e0p10+EyYjRnnfk3g143SiPNfTe7cAbKDhJ?=
 =?us-ascii?Q?/ZkMsLYWBvZP/S1/BV044vdkis2xehd9Dhex3AErTd2/BZemKnxldqGNAkCx?=
 =?us-ascii?Q?fDpbjnI1p6Q0EFgSgZtN2dp3Frda/uBkhKX8uYfLLXdljImyXbKPlfy5koHW?=
 =?us-ascii?Q?cpalCElDyFPYa3BF3RVUK8gII7pGFwtihiiZKIar26tTTe4XAFqNE0W7nuWD?=
 =?us-ascii?Q?0COpBZp+9q33tDmG1MOwIsYeFelfIYTLV4ODPfd7deQiBoogV53BVUmmZq6W?=
 =?us-ascii?Q?3ZNiAAIj+Sa+tPuNyfaVCse8o6bsKmxoEtfbPTQwXh5OR5NSYuL6AzYkUHWk?=
 =?us-ascii?Q?v3n5w0OEmlXnSaEE+fW6F5q2hTxpMkDQTh2jZyzzt3R2ZhbAu4YUGEjZoO59?=
 =?us-ascii?Q?Ly2YJnvSx5nyMVwd7ZJlwcrpipd12iwyJQOX6YsE2Ry1R6etBkeRVADVDJey?=
 =?us-ascii?Q?05EBFJH71YJ1II8IGEU9FiLj9Jjr4BtCb6rr5LSU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129c15dc-5739-472a-1b99-08dd8f344377
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:19.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPiq0sQrb1U0CGIM0iw8fzlnzxW+Ue+EDIk47x1Oif1vTE77M19JnDJt3bGQGtgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding CMA_ALLOCATION to isolation flags to provide the
information.

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/virtio/virtio_mem.c    |  3 +-
 include/linux/gfp.h            |  6 ++-
 include/linux/page-isolation.h | 25 +++++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  3 +-
 mm/page_alloc.c                | 25 ++++++-------
 mm/page_isolation.c            | 67 ++++++++++++++++------------------
 8 files changed, 80 insertions(+), 65 deletions(-)

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
index c9fa6309c903..db4be1861736 100644
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
index 5e6538ab74f0..7aed5bf18cc6 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -22,8 +22,25 @@ static inline bool is_migrate_isolate(int migratetype)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
+/*
+ * Isolation modes:
+ * ISOLATE_MODE_NONE - isolate for other purposes than those below
+ * MEMORY_OFFLINE    - isolate to offline (!allocate) memory e.g., skip over
+ *		       PageHWPoison() pages and PageOffline() pages.
+ * CMA_ALLOCATION    - isolate for CMA allocations
+ */
+enum isolate_mode_t {
+	ISOLATE_MODE_NONE,
+	MEMORY_OFFLINE,
+	CMA_ALLOCATION,
+};
+
+/*
+ * Isolation flags:
+ * REPORT_FAILURE - report details about the failure to isolate the range
+ */
+typedef unsigned int __bitwise isolate_flags_t;
+#define REPORT_FAILURE		((__force isolate_flags_t)BIT(0))
 
 void set_pageblock_migratetype(struct page *page, int migratetype);
 void set_pageblock_isolate(struct page *page);
@@ -32,10 +49,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     isolate_mode_t mode, isolate_flags_t flags);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			isolate_mode_t mode);
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
index 15632939f20a..8606bfe19e5d 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -818,7 +818,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index e63e115e2c08..029a65b6ad27 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2010,8 +2010,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       MEMORY_OFFLINE, REPORT_FAILURE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8ff7937e932a..b3476e0f59ad 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6580,11 +6580,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
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
@@ -6656,7 +6657,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6727,10 +6728,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
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
@@ -6747,7 +6745,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6763,6 +6761,8 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 	bool is_range_aligned;
+	isolate_mode_t mode = (alloc_flags & ACR_CMA) ? CMA_ALLOCATION :
+							ISOLATE_MODE_NONE;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6789,7 +6789,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode, 0);
 	if (ret)
 		goto done;
 
@@ -6805,7 +6805,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6839,7 +6839,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6897,8 +6897,7 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, 0, gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 7b9b76620a96..71ed918deeb3 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -48,7 +48,7 @@ void set_pageblock_isolate(struct page *page)
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				isolate_mode_t mode, isolate_flags_t flags)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -63,7 +63,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (mode == CMA_ALLOCATION)
 			return NULL;
 
 		return page;
@@ -134,7 +134,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == MEMORY_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -147,7 +147,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == MEMORY_OFFLINE) && PageOffline(page))
 			continue;
 
 		if (__PageMovable(page) || PageLRU(page))
@@ -168,8 +168,9 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
-			unsigned long start_pfn, unsigned long end_pfn)
+static int set_migratetype_isolate(struct page *page, isolate_mode_t mode,
+			isolate_flags_t isol_flags, unsigned long start_pfn,
+			unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
 	struct page *unmovable;
@@ -203,7 +204,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			mode, isol_flags);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -309,11 +310,11 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
+ * @mode:			isolation mode
  * @flags:			isolation flags
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -328,8 +329,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			isolate_mode_t mode, isolate_flags_t flags,
+			bool isolate_before, bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -355,12 +357,11 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
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
+				mode, flags, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
 			return ret;
@@ -458,14 +459,8 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
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
+ * @flags:		isolation flags
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -498,7 +493,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     isolate_mode_t mode, isolate_flags_t flags)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -509,8 +504,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_start, mode, flags, false,
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -518,8 +513,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_end, mode, flags, true,
+			skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -530,7 +525,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
+		if (page && set_migratetype_isolate(page, mode, flags,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
@@ -573,7 +568,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  int flags)
+				  isolate_mode_t mode)
 {
 	struct page *page;
 
@@ -586,10 +581,10 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
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
@@ -608,11 +603,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
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
@@ -620,7 +615,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			isolate_mode_t mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -656,7 +651,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

