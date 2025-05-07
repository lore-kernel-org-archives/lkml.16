Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC402900B0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652287; cv=fail; b=RjfZKnA7IbHyeFU9sd9U3lqY3ZK71aDjOMYDc3AtjELRYV7gUt5Hz4JE+3dVIveBTLW970FzNDQc/WCrQMTBio59vfPQ4O8V7OTTSuA0dxEhMK1SkD+cSUkR58nGQnYuBBoQCnUZSznBLZ4f0gH7wr2YX0YGwESSK+LSdiv4kFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652287; c=relaxed/simple;
	bh=YX2ilG7b5+ccimaE0oqE4d6VXV6BBFdn5+InT/cqpLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cbDtazoajM4o54pj3xRficLGANrPXnk5OvekG5bhKrMfDSnPK5h3QUxmfWnhngAeVUoyGijMj3rg80ozFFBBlJiF9ilnuQh0i3EPn25q7BQtyol0I2IJov2Yshu48HVGPneolDxxQYpj93GFUgc7iheIvbLRemIbsudMB+H41fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RimGh36Z; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RimGh36Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Z3jVKBUfbgVQ5Lk6RLPfUXZ+t2rjLFrbeDRsTd27dH8+ERc1jgqhAPTWkyK+y9isbQCbRwmxqW6lR1c729bFB3kXgocWsa1tIN1+laDu4VpPFQQQWIGWsoC5tBDYEBQIWIZe/7VfJaL8wzyvK1Mxafu17dgtvpnuoMTY2SlT0GImWQhc8NLwwT2bgRjUV4A0gGJpDDeCLbmORVLzPcJxllEao+badwmcKUJbt974LJ0p5KqntynqJPIq0Pt1Pt4zdgTwL9EnITGxTBbU5Vq4oJkA4PrDGVyj7G3JumAfGbiJMNRjXe6x195UImAB2kdZBq/OTp06tZG5lWttbcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbtlnInJIQC7BY1Q9h0WU6XySLUIe+P7UaiMHycPBbQ=;
 b=XrUF1GgoDphkuVTpmOy9BQ+vEqVZpMMyX/je1pNK6J3bC3sbStslaXI04VLGdIlh2OXir371oV2+zq0r87Ov2rzBIMwH1v+e89lDf12wmC0pqUyiWyAQ7jD2R/AAfmSq+zbhkdZJ0VCXZPAeKNr3DUMELhf8yhtbML1GvSBJK6BmqyO52LZ40q5A6em3jMT34zywb5Q6SkdST8opF97MHTSsOAfxw+pDWDBxqQt0tPpy9ncdcWFqptVPodqKsaZuH6PWawmNWCEJVJDPQ9cH9Xk3BUazb301MCCeC857BLsqw0X+UYrEz31j85b+WYLMCRY/JXrnlyJI6/L7eyK+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbtlnInJIQC7BY1Q9h0WU6XySLUIe+P7UaiMHycPBbQ=;
 b=RimGh36ZBIv2SyJEwdMbOag046Anavj58TM87yX2rdCWSlTakXeCBKNA7vwKHlTuZ5b3iY+k6qh8xLzJe/U2YrIVIY0K7zHyxXRr3eEzS+iia8RDXOVREjdu/GPMrwH8a9K+SqO5ZhMw5cMF+2sXoP8QdJPiXi+H3fwAztkc4BOTQg7L7oBWanNmR5XxKWfa3MK9HcVXOmv6s8CTCTjtOJovtG5nGLPgYz4VHA1CvVQSrrFHpJ9J3HMz9ExlX/w/YABMNMF2jXvanB8vhOEl/Y4Y6L0dlRraCfg9ASjMJXQqTzTeGBQubkftSnvQsxFrRNSxaqtBBueoduGf/ekjUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:11:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 21:11:16 +0000
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
Subject: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter from more functions.
Date: Wed,  7 May 2025 17:10:59 -0400
Message-ID: <20250507211059.2211628-5-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507211059.2211628-1-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:208:234::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d23303-a59f-4b00-7ac9-08dd8dabb476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z3P5rtxIKhLFkmMJoqZY5GppStor2VzlSsmZYNjDjbfNgEvvkXRF9u3ajU56?=
 =?us-ascii?Q?1MPr+cAuFXdowPwlmjNuazJFZXGf8GRYgUwjWgUkXsryPopG8NGXNWpvbYNE?=
 =?us-ascii?Q?oy6VfTKzytvpzuRr2ZSSAxNcl11WWNyk7GEDY2NeLplXCyW52vWAfqgV/9hq?=
 =?us-ascii?Q?xJ0n+I1fn4ScmsJcN2kkXZ2V7qDEGjqjeSpzEhT37u0vIEg7If+ymNDSFqYv?=
 =?us-ascii?Q?5vEVu3Ph0neTQQp3mmN70Ka4WTNQiEXYrjjjDh7qBTjGAGqqbBxcQyQ7BKqV?=
 =?us-ascii?Q?IOhoeQ1VmuWyViix+rs7ufxLZmmLqkFbRh4k6p4xr8ee98FQbqH4d2Tu49Yc?=
 =?us-ascii?Q?r59CUBLWeYGxUK7zFIbpi2d9ZRB9EBV4YJCwtNDGphRFHNlQ7fNngKg+MfBG?=
 =?us-ascii?Q?vKtZavrHEaOSCvgSZuyBerZ6sUpGdBlJEaK6KJTiWBTNq/D3iolseQQx49D2?=
 =?us-ascii?Q?wpIA+f+Bcm7btsg2xvYbfnG1gX3VCGkfBD2Xz3zM3h6HRAunicIcDI5YCIry?=
 =?us-ascii?Q?s9pZMtN5e/ftQQl3meVDHoxbce0bimexfT0GzeL+zuYjq79d0sKbP2wqbsaL?=
 =?us-ascii?Q?MJ9I2NlbALvZ7YgnQn/R7/ppa1eAizLsaRgwfxgvNGQz8wUin4gqnZV59Pts?=
 =?us-ascii?Q?BafcK904C1+mNRqyCpWw61irbnjpHwDFwLTrWgL+3Mxh+E1gX7wF+KLmSGto?=
 =?us-ascii?Q?xvNmzQDMwZhohRlazBXyEDTv774zxpRmH7UAFK32ZE1zYLcxYzqFWdk/oCv4?=
 =?us-ascii?Q?zHJw30Gzg+4mjwrY2G6q6b1QvmFkmBHTGNBeXenTQpa6e5luP7/7IEp/M9fa?=
 =?us-ascii?Q?848GnPnSZraNBahkMo3Ivyb+UV6+UkxONknmpxZtRRRD1ckN0V1mD+lw5n/G?=
 =?us-ascii?Q?zg5hDxyPvyc4Fty2gPECMu5NU2zNdmsBCCGfsOYSUQ1LBHPu1hCSegZBHnJ6?=
 =?us-ascii?Q?NBMifCZ90a37aupwM7wmNALy+L7u3rRpmeUjgNi0EhANo8yLnrwXwXSM4Pdy?=
 =?us-ascii?Q?tuP+2yU2H+yiaZjZsvOyQGdl5UA7D1F72CGVhkFifyy66p2NWnu4PUMkRBBI?=
 =?us-ascii?Q?a3cOmINx4QPeN99+KUvJR3duBYmDW9FalJL8wQJANplnfkglQtOpDrumCqhA?=
 =?us-ascii?Q?lTepYhaea7XFAOSKRJqG++CfhI95ueN+5uIGT06PP+RcO/v9j2mHASa+mFM6?=
 =?us-ascii?Q?SlxfNUfMevBRBafdempxCsHf/0CeRHxxmckw2QXqBkGPfeo1TlGXrpL/aGw/?=
 =?us-ascii?Q?WS+uS4t/kLl+NaFAvkxsZWpbbWLkk2iuwNOugCayssVIIwkg35Q5ejylNpGg?=
 =?us-ascii?Q?5bAaDfKjRcUHCl7zn1T+PCjvwwVYw/irp1jbhWz0CAWh94+HVlOiw2TtSG/U?=
 =?us-ascii?Q?DTRw+uFQ9Efabg/Qo7fA0dXFLs/lCTQ1QmxH9IpBUxWhHLbUIHXcbRotwF9m?=
 =?us-ascii?Q?tEIGsi2eCag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RKRxpUnITVvbU88trhHXXslUwbVxc7V6Frgmo830W5BG64I9vYnloevCyZtK?=
 =?us-ascii?Q?YTbJ4R9PvSr5P5wUhFxW6Wpj6AuAVl6LInfcRW0cJqG6/GYIMTRYTRfRTpp3?=
 =?us-ascii?Q?lDyyCKoRPsSt5ahnrNgXeICsHDtNnw6kE2fiu79XfyTgFcXdWzBo6ZovmX61?=
 =?us-ascii?Q?ZUURNsH/RKrdE0PGlRqfCeRj/NjXw3KHGiAJEgmzGXRrBEBSkK0e4ny04L1C?=
 =?us-ascii?Q?BaY7kUO21/o6j3zLJoUyzR7Y2fHQk0DPEitovy5oUCmhXa0MhdoNoKf8Wc9g?=
 =?us-ascii?Q?FtKrcxa1XxEc8XHuq4gL0HZf3Ab88viFO0MD37gh2+kw4bAqEZBCnjUvIp6c?=
 =?us-ascii?Q?vdn0M1n0QAp6HwTQJwZUExlFuj5pC11v0sxU6TfPFAgzID+El2mn2syDSIRC?=
 =?us-ascii?Q?hSlsrDxBQlHGAmb+57qgx2K8Pw1ngtQ0ItEFxlRUKJH8u3QvYpuQAj2q54NP?=
 =?us-ascii?Q?k+eS7l/UrHAuEeznLp5rMoGej98X6wQXLPRMrMlFf1LT5GmZuqhHuj+7wDOf?=
 =?us-ascii?Q?s0E5sVBk41tviY/uvnIByZgNmNqubsxaCwF0qrm6YKacaTljOKjlCL3PNp8I?=
 =?us-ascii?Q?FIROp+MRUCSwvto5B+vzBSoTeie0TcTqIBXjRHkiaPJxI1Ivo6D/30RcDgux?=
 =?us-ascii?Q?hfyBJ3troBx+cKvxA5PN6TryXwVBO+nZ2y7df9ub4bFMq6m806MkxGZ7apZK?=
 =?us-ascii?Q?HbAVvHTiEHMNzOPyyC9vtlZTW3zakLwAGLt36D4VwSW0qZRBDMZk7rAwTZpq?=
 =?us-ascii?Q?yM2fH/SZI30QLF8fBr7ep1SqjJ+6Z1wCCaEueW5IiFvF8nP20FAjMGn/6ekg?=
 =?us-ascii?Q?XDBSfPFS1OFyUJbp+kCFjIhD5Dyh1TiY1F1Zm0pVMErDqBjqL1k2dmmUwSQH?=
 =?us-ascii?Q?Scd3Yc2FfQJcw8HUCqZVsU5F/1TRuxYAd6x+5QYMggjN3Qt6xby5/9V5UIck?=
 =?us-ascii?Q?9OaeDkvMKdk5L6IAGZ3FX106uh1Tozo+z4OF4aY39MLgQvwb1moxgr1uAS0g?=
 =?us-ascii?Q?Ae+heT7DQM43iLL3HJzQSihT7qtoydHwckPoB9ReZEZe3IEv9JZDbOZQy2hl?=
 =?us-ascii?Q?qmx967ULyj+RQXtb4zbj0hitfcTIknzEiFzeDYAQJX9VE4p3VO1C0kcLLCWT?=
 =?us-ascii?Q?qWEzhOGfQJ9qQmVGz+mNMkXwLRiwqgToo1mRbG+PUzNHFpNxnejWiGEQ9ELv?=
 =?us-ascii?Q?rEWU15aljVozBvVMuZoFFuFmp/VuHJabOlmHFtICNbyWQ/jBZIVt2Z0ju1z0?=
 =?us-ascii?Q?kZ+yGY0b9Nu0PNgOdB26WEKgaqvy3xOyavhEZAyWeXlnP1ff0cMzO8gKZJkC?=
 =?us-ascii?Q?td+Nb+wintOfhRlPQsF6pGCMR+yDVpoWQiFasoVCHApcYy21Rl6ezd81Oa1Z?=
 =?us-ascii?Q?yI2wtyfo0Av3bflOq+86E+60p9ZnWki0Hc5L0kkhlOKzCnm8b9iTDmgFEKQB?=
 =?us-ascii?Q?iKe7BM/gA7N3Oc65kRZeWLM2XRuRBziV9PflgR8hpu4/IeoSGv145EDD4xiz?=
 =?us-ascii?Q?RO7N4b2JpVqIVuqhnSnVY/oa7MylNXHLGVsw4kCj1ANgGaMpWoBKsU5TKiFB?=
 =?us-ascii?Q?yPgNcldF4PjcvM/lDhnzxZigvBGv+UkrBx6udoPW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d23303-a59f-4b00-7ac9-08dd8dabb476
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:11:16.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkrhcGhlkEAIuZnHGVvjMEcDDhYKM5zuVmpqb6Fy7uoCqMrji/Np1r/2CRjXc/GZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

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
 drivers/virtio/virtio_mem.c    |  3 +--
 include/linux/gfp.h            |  6 +++++-
 include/linux/page-isolation.h | 15 +++++++++++---
 include/trace/events/kmem.h    | 14 +++++++------
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  1 -
 mm/page_alloc.c                | 22 ++++++++++-----------
 mm/page_isolation.c            | 36 ++++++++++++----------------------
 8 files changed, 50 insertions(+), 49 deletions(-)

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
index b8b44d3aacd4..709a807202e9 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -22,8 +22,17 @@ static inline bool is_migrate_isolate(int migratetype)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
+/*
+ * Isolation flags:
+ * MEMORY_OFFLINE - isolate to offline (!allocate) memory e.g., skip over
+ *		    PageHWPoison() pages and PageOffline() pages.
+ * REPORT_FAILURE - report details about the failure to isolate the range
+ * CMA_ALLOCATION - isolate for CMA allocations
+ */
+typedef unsigned int __bitwise isol_flags_t;
+#define MEMORY_OFFLINE		((__force isol_flags_t)BIT(0))
+#define REPORT_FAILURE		((__force isol_flags_t)BIT(1))
+#define CMA_ALLOCATION		((__force isol_flags_t)BIT(2))
 
 void set_pageblock_migratetype(struct page *page, int migratetype);
 
@@ -31,7 +40,7 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     isol_flags_t flags);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
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
index 673d41a06da8..155f0b4ff299 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2005,7 +2005,6 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
 				       MEMORY_OFFLINE | REPORT_FAILURE);
 	if (ret) {
 		reason = "failure to isolate range";
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b905ed13c908..f2c148a3675a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6581,11 +6581,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
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
@@ -6657,7 +6658,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6728,10 +6729,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
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
@@ -6748,7 +6746,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6790,7 +6788,8 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end,
+			(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : 0);
 	if (ret)
 		goto done;
 
@@ -6806,7 +6805,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6898,8 +6897,7 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, 0, gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..d1ec98fab6a4 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -31,7 +31,7 @@
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				isol_flags_t flags)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -46,7 +46,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (flags & CMA_ALLOCATION)
 			return NULL;
 
 		return page;
@@ -151,7 +151,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
+static int set_migratetype_isolate(struct page *page, isol_flags_t isol_flags,
 			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
@@ -186,7 +186,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			isol_flags);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -296,7 +296,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -311,8 +310,8 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn, isol_flags_t flags,
+			bool isolate_before, bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -338,11 +337,9 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 				      zone->zone_start_pfn);
 
 	if (skip_isolation) {
-		int mt __maybe_unused = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
-
-		VM_BUG_ON(!is_migrate_isolate(mt));
+		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
-		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype,
+		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock),
 				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
@@ -441,14 +438,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
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
+ * @flags:		isolation flags
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -481,7 +471,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     isol_flags_t flags)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -493,7 +483,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
 	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -502,7 +492,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
 	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+			skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -513,7 +503,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
+		if (page && set_migratetype_isolate(page, flags,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
-- 
2.47.2

