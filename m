Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D65292B5E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075845; cv=fail; b=mlSCjXjAv6IL0ZQ/91/aEcnxBBczdPUWr2TzFpoO8fa14Lqgof+aFTDkFaTYPeIXzXymbdkEPNHaOwbukKMI8ClUWde+PP90gUCHsM/OHIqBhSJkbjIq0+t9sNKHXO/tVQxxUPEEBtP+P4pt63t+Fk3JIpwv2VCmoHuqtN5HGXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075845; c=relaxed/simple;
	bh=TWLr1IJU4hz3dpukg3JsvLk3Xeq3laYv9YFOlk9NsvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ODRrlxQRYOBKnPPh3V7FkhvMw2bQcxYJMYj0iUEyJZrJ6YxbUfInh+uzFHi7vH8RllUgJjSqzZncidcCv/bTz0wHl4ur29562OaFBlMzie1gsgi4nmoVpzXb+fPdPI+156t3ym6za+Ud7lNn64qwodrutv7udy13jV9YKKcon3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WAXZCh2w; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAXZCh2w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnYDIBU6n4HTR3ZYFsbpUV+Bzg6s23FLXlNWgbXPxoE4cOnzmcHZdAgT6zILODMVQfMMlj4k5kCBfWGmoAdgTjm1hT8yA/QVP8ojwUVzQW5jcf1lgLoxvhHxO10tqUBMDXBRu6MQyimM8Vf04oRoTf8Wf0STtYMYB5/Vyj3aXUN5Merk80vmYGendxQv1bxFbjHmt+FYMO48Vgly8FLTuQITdiFOQzNPwSOIsR1b9Rrkc5ZYQepFESfA0Eh6mBmsPP2c6fnz+Z/xGMxK6YKG+klny9RbOqyYx7tgetO6WCScKvTsfYh/V6BWikAlN6P34qId/w7tdDeM0wp8K2Mc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk1w4mfxIjRWH63CBLYERyUbuHzBZIgXXm6bHwmDfmc=;
 b=jMYE+remwFDrh/zHfhcklqcKn4nWPCw8GAQ+urLhEvWA8TxCp+acMftft6zRLdTuF6BXg7UvFk5gXg5TvdpzeS7tnJHBUVrQCTXo3hgJKfD2123wqS57uf2iCdpoqFMjvxknPyvErol6ojmvlSNa0SBRsDa0bwJTDZLiwDZZ7DBq3W9xWenDDZHOR+Dhzdkxcmxr09DT6ipagad3lIFWZBSau/gVehT+yRDp2znZDLTRw7uEEfuTW7bEQFPcORq/pt1GDIDvCLYO589zlOMo75bcmjAUuPUDEAANP7uSzUKZBVPjSMN0hItdVU6+MVZRCttkRZ+c13LJoGo2qAsZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk1w4mfxIjRWH63CBLYERyUbuHzBZIgXXm6bHwmDfmc=;
 b=WAXZCh2wolcCV2ijRbKPSYsnaUjpb1FAeGC4TpfzNzU/3NdrT5l0vM30htq2wU3M0Tdho0GjMdlVQTwj/89MLeYNm35OTk9iER+ultu673PMEQ+fP0VMLTCjrsOkm4xK6K1pdzXeuak4qrG8t1bjaT3ytAHVlZg30048P8c2z0gOW0ZBmxb2kPP5Gxdw8aZxt46xJDfN8KDvMGeFoZ1tycP95tHBhWEkU3mkyaxHQw0i0Z0UxJWKIm9+VT0VE1EXJW7nnxW46UGaj0OlLzVN799ol/meCBcH+ybzOM/wDSsdNj6fJzhmb/anFwlv4SJXgSeH+OiOZsZ17ChQL++Ijg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Mon, 16 Jun 2025 12:10:35 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:34 +0000
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
Subject: [PATCH v9 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Mon, 16 Jun 2025 08:10:19 -0400
Message-ID: <20250616121019.1925851-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0021.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c164cc-98e0-4dab-82e0-08ddaccecc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bqWRK1CE4Q8tJgjnbi603SOmRpvpijLzs/AIwkjm+yY21ubInV5NSLAUx6Iw?=
 =?us-ascii?Q?yHTGh8vX6jnxLTh69CK6yycbh0M9+lKlRyOLc3+lCFaTkMij7B5HVIA43DMv?=
 =?us-ascii?Q?zVQ9juOHf9WT5C6SZOGn/fyc2B81klf66WoRy9zYjCNgD+lFoNx8OQO71D50?=
 =?us-ascii?Q?mka11kju6O2UaBU3HYAic0ukgMos68DALj62V63ZE1LdTsbTBCwL+18yiuhf?=
 =?us-ascii?Q?X8qmuG7i+M5wGB7rx0LLYcYUrxWVE1Ln1NDlQX3oVZNFfqWTqFoLkVIxFI1K?=
 =?us-ascii?Q?d3n1Wpv4M51HPtRpOBPSEieJeu8e8ZrQkIm2YesUvt4VLemb9lIIpQK4zw2M?=
 =?us-ascii?Q?aQ5VWJdRWsUH3R7AZURsXtDNEF9kFaNQFflbCwQl62nzRjtu5oTOBxvvL/ou?=
 =?us-ascii?Q?Nr9Z2egIL8V374tVYcN6c9ufompgDX+e2UA3/iJCdZWz6aETWMcfkXVpVfce?=
 =?us-ascii?Q?Cn75pApDzN5CNWmI7coN47KAh4RZhdWlfKv4z+EiFvQsJ71nCEAnwShlJoBn?=
 =?us-ascii?Q?CM+cARmTEI9+LO8e46uoTjNmZrHxVLSEOJrlI50VtTpWoQBGTKqrS5O0GySy?=
 =?us-ascii?Q?J7ooRHag3suPT//+br1yQqe4X6QN2Dp8aN66TIJ84FHZu155ZFEsFjs0p2gx?=
 =?us-ascii?Q?9jzjLgR51zaNZ/8KdD870sdzTG3oQI3IQxXGvaP4Phu7AL7vA4NYG+EaZKL7?=
 =?us-ascii?Q?TBZPcupfi5xU55hfb4PStsItWoTEg6tdVc70EqYfSoRGvV9h139E7PvENUA2?=
 =?us-ascii?Q?wsKF3P7XjF73PcTpZDO3aHZ7L3wzjsiX6tOyNmmGadViQo68rOfMAR+uexnH?=
 =?us-ascii?Q?oNo4b48x8weKylPYv/j0AJpgOaYqNDEeX1f4KU95HSoNXWVQ4iVo0MgIMkZD?=
 =?us-ascii?Q?t68IxiKQSSPNS7u66G8G9R7FiCTAguaqkrb5fI//ftUXjeg5mGIlQXqIJvtw?=
 =?us-ascii?Q?OpXDL8P8HdvIx4FwICQzm5885x0ru3/AsF+gTKMZvP6DVqQB9qQdDgthfaP/?=
 =?us-ascii?Q?iowXZoEfGuycozLAEcyrIOtyvHDx5ZDGS9zfjIzz6g9T+gdQautkDSDbFVff?=
 =?us-ascii?Q?3omFSCy/UF3Wv9F39XXl0xUqWLcDGyyJZKYzMuILkhxQfSn6MN+7ApvpLWno?=
 =?us-ascii?Q?aq4kDfR/cL3XY1tschKpHErJMQ8RxeVVklr2CKNXjZy7Py3alJ33vOOKYquZ?=
 =?us-ascii?Q?7cPaQOqpF9AkDqFXBE/73KdxMVyi/F3OTHeLefvp0fT0glz8N6b9DOXajv+x?=
 =?us-ascii?Q?Fpw0nl5ZVz8QuRvTVTr4IvAriA4o/50qzTvnezKRW1CDfrse1iWmajpJR8Mk?=
 =?us-ascii?Q?hQ8jSqA3D3Ckk6Q1EruwHiJK2xRS7tNsggi9YrtlVrJrSnpr6wZFuzAilIM6?=
 =?us-ascii?Q?mFjI9EBFMLJS+VzTAKzYzF/Fd0MTGJPDx05yPktMg2vusczbm/GsD2MWolrv?=
 =?us-ascii?Q?04r17bOELuo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+haXXs0hsfJQvkl1ez0nZ06VGTivU0YRUnB6hP4ptGuoAl7BAeHTwLO6qqd7?=
 =?us-ascii?Q?6Lp5CUVOboJ0+oV80krSxvSOa0PVv7plzAajKx1giqSrvAf/uipu9H1hPW/9?=
 =?us-ascii?Q?u8tLQhZLqrePG7PmLLa8YViO4mqMqRx2K9CgBmapr3cXMsKkOqat+Rumaq1K?=
 =?us-ascii?Q?TBYkg++KzYiD0/MVRg4DX+0okLV6GInZvFNSmXMIXfGsr5DMOp4asz+GqeeS?=
 =?us-ascii?Q?9A5H23onM2N7eF/OiBtiBlxXTFNQzefPQdup5uD82m9KC5FkGpXyQaLSy+qE?=
 =?us-ascii?Q?fJRfg9YTGJoksrsyFDVPve/IvUx+GUDM2W/rNkSmtUI910jAMSKWSIY/WtTn?=
 =?us-ascii?Q?Qy44jXbydjRxfpBgwCAfGZgAszN+W7yJrbs1EBd6siUW7b7juCSesvSici0s?=
 =?us-ascii?Q?ovMzZWNo5+f0neGwXJ0SAXZ9dZ+mug8d7ElL62l4ejDd+DD87dAGb3x6LM0T?=
 =?us-ascii?Q?4elaOcFETXHIY+bcGs4FTbiWGkh7Z3orGMDzDas0VEiqQVxlX8UGWo8+X02Z?=
 =?us-ascii?Q?DYYbg4TLHnSrGIAghOwMnmw1QZKqWdr8lisSLpj0L7OtCiE0kvVqQnxkMQXs?=
 =?us-ascii?Q?3JvpIRfwhf91GebJ0B5P/1Z/MAbMp90Lsk3+cMZf9Iue8uGXjXeNZgbsd6qX?=
 =?us-ascii?Q?mMyCyEP6ZyGJVaqSgKAeLimGqIQXi05a7W97kfP+FU0btr58Pp5vC6nBPECt?=
 =?us-ascii?Q?Oq2upTVvtBxL51RNPFlXkEffa8bpDoxegV5Hj/pvIbweLJv9fAdOrROfVDEd?=
 =?us-ascii?Q?XE1sxlQcLjd4PU1NCT/feOhNXUW/RUJq1BgJnvnVOGeyGQqg6QciE0b5RSup?=
 =?us-ascii?Q?PIFdz4kNoyH/MTUQXT9Nk9foWMSE0diDtjfOt95RnYI7kW94x/OI7GlczJ2D?=
 =?us-ascii?Q?ara1pol7Z9C3on7PN6QkYjJuxlZagwSYI/t4Vk4Qo7GEe/C3vSXZ4bnzONYR?=
 =?us-ascii?Q?cjr0F8ikA3AGeh2CZAlau5yHeRy7LbHB1UnDXRZ6iIhwKnF6dEKyfuVq86K5?=
 =?us-ascii?Q?tXQ9k9pZiK5Mrp9a3zQoq0mbWmqHUMF4roKWzHEAUIx0ViYIRcLsSttl5CAr?=
 =?us-ascii?Q?FsobUJ7CMuEAdqx8IlUo5xsxAonBM920FkmLeIcEpeF/CV6D7kWLYmSY7TnQ?=
 =?us-ascii?Q?abWd1QdWlZFiS2l6fYkMc6VEBC5+pO3met61yE/iiaheOWPm7bxXcVrUEg/i?=
 =?us-ascii?Q?sd0M1Bie5rvjbU0QnFq+ZPwuOrC+MIoEG/xnJoPtnB3w7ITxivpTYQfaMANF?=
 =?us-ascii?Q?BV4aKh1uaDeXR8J9+lWwW4nAGPjOpjQjWxGoIDoJmfFOkEW/vzUD+Lf/289U?=
 =?us-ascii?Q?jh8SA7nqyjZdO1Gxf8Z+2zbr3Qzp/XWvAD6Hlx4hnIRUltgaI5+eRaY07xY4?=
 =?us-ascii?Q?RIo2+Z6YuIpTC69LpJ37O2Uk+u7nlLNkjya6vK89w5C8iULGwcTu6eAfs9pP?=
 =?us-ascii?Q?BcSVzCb6rzyJH+D6TyDINvKoUPeEmBaUh0ZNquRTval182rlgJgRQVADsgbS?=
 =?us-ascii?Q?zyrg/GRE6jbrkqdPxNd6kHCbbmcijt7qktJ5HIOd9UmDolBAwmeLfq70xXRp?=
 =?us-ascii?Q?CXFpwVHhAnG21jRYUl1Zr+FGprEt3bO1kzFnFqpy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c164cc-98e0-4dab-82e0-08ddaccecc36
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:34.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpBG+xmki6+hXSK2DCxRvBETIZYUYZlwfCGRQGMBjV4E96sgB/s1IgYAQdw+dP/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
At the same time change isolation flags to enum pb_isolate_mode
(PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
reports isolation failures.

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range(). Add ACR_NONE (set to 0) to indicate
ordinary allocations.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_mem.c    |  2 +-
 include/linux/gfp.h            |  7 +++-
 include/linux/page-isolation.h | 20 ++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  6 +--
 mm/page_alloc.c                | 27 ++++++-------
 mm/page_isolation.c            | 70 +++++++++++++++-------------------
 8 files changed, 80 insertions(+), 68 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..42ebaafb9591 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_NONE,
 					GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..ccf35cc351ff 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,14 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+
+typedef unsigned int __bitwise acr_flags_t;
+#define ACR_NONE	((__force acr_flags_t)0)	// ordinary allocation request
+#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+				     acr_flags_t alloc_flags, gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
 
 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7a681a49e73c..3e2f960e166c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct page *page)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
+/*
+ * Pageblock isolation modes:
+ * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
+ *				 e.g., skip over PageHWPoison() pages and
+ *				 PageOffline() pages. Unmovable pages will be
+ *				 reported in this mode.
+ * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
+ * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	PB_ISOLATE_MODE_MEM_OFFLINE,
+	PB_ISOLATE_MODE_CMA_ALLOC,
+	PB_ISOLATE_MODE_OTHER,
+};
 
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
@@ -49,10 +61,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
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
index bd3772773736..acabc00d1278 100644
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
index 224987824a84..b4ac226795f2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1961,8 +1961,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       PB_ISOLATE_MODE_MEM_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
@@ -2039,7 +2038,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			goto failed_removal_isolated;
 		}
 
-		ret = test_pages_isolated(start_pfn, end_pfn, MEMORY_OFFLINE);
+		ret = test_pages_isolated(start_pfn, end_pfn,
+					  PB_ISOLATE_MODE_MEM_OFFLINE);
 
 	} while (ret);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 64321f6b714f..8eb6f93aaf2c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6693,11 +6693,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
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
@@ -6769,7 +6770,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6840,10 +6841,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
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
@@ -6860,7 +6858,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6875,6 +6873,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
+	enum pb_isolate_mode mode = (alloc_flags & ACR_CMA) ?
+					    PB_ISOLATE_MODE_CMA_ALLOC :
+					    PB_ISOLATE_MODE_OTHER;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6901,7 +6902,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;
 
@@ -6917,7 +6918,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6951,7 +6952,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6994,8 +6995,8 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_NONE,
+					 gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..ece3bfc56bcd 100644
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
+		if (mode == PB_ISOLATE_MODE_CMA_ALLOC)
 			return NULL;
 
 		return page;
@@ -117,7 +117,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -130,7 +130,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageOffline(page))
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
+	if (mode == PB_ISOLATE_MODE_MEM_OFFLINE) {
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
 
@@ -569,11 +560,12 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << buddy_order(page);
-		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
-		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
-			 !page_count(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageOffline(page) && !page_count(page))
 			/*
 			 * The responsible driver agreed to skip PageOffline()
 			 * pages when offlining memory by dropping its
@@ -591,11 +583,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * test_pages_isolated - check if pageblocks in range are isolated
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The first PFN *after* the isolated range
- * @isol_flags:		Testing mode flags
+ * @mode:		Testing mode
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %PB_ISOLATE_MODE_MEM_OFFLINE specified in @mode, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -603,7 +595,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			enum pb_isolate_mode mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -639,7 +631,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

