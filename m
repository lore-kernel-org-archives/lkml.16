Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7C23537B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622176; cv=fail; b=ZEqLkmVM6ZnIsKPwzeSXZ9fuMu3FpcQQG4S0YZX1MOz3Y/SHZ5CZv4jiNI69EhwD1aMb0i+pYKncDy4KAcUmcc8cZ9/xsi2Cg5L8Su6CdyirTzCHs2f8w5WbYyWttQBap8122oZiSXjgJZgh0Uv4z1VbzFkTIe3tBeIlUQt97ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622176; c=relaxed/simple;
	bh=B8HBxEoKXnWhpqSBNXkNRCip/JGvhgw7uFeSYz2Uegk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gfZsr9LT+fIoMpCkFMzFTAm4ydrWeTUFhTKfYxTo4BWFW6OnYFRAgUtg2VAoI7pGBAGSf+tfI0UlsMib12WHtKWjDVtAGf+Gi790smzqsLBksp5dsmImPWw6sbH2UJdhSHbIbWmGyrqfJQQdjSKJJlPgmbT7TO2bafn4C6YumoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n9tu83gg; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n9tu83gg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmPHvuAqPM8CKmwM0wsko1vn3dUbDwZNCc4Ssk5nsAovri3m+R2Pwn/tU7A4/84bXJaVdW9tIzQWo2QimeRMc3I1BVOvnd59j9aF36QZJpUtMfKZCLZMLyNDV1RvDBm6UtIgIWR7ieB8A1/925DZapcyzJNFFISzPxv6GMgVIbNu1UFbfn8AQeD+Esaz6uOxLY/fBAivG4i8yt+V8YRDJ3ociEr13GMUaioqYfs0djZlwo3T2OBlTpOktsB5aKZRQUJhja+SeRu2DMZHW21TD4mrZZSBqsSx5YVRdJLbr9FnWHNjclbnYQ/VbNmL5DSVJxXMcLGFwbiCNT42aIQ5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixF44OA4L7wU4LPtCvDuK+emluTWtTBTmb32LZwOjT4=;
 b=yXxWMdSuDeCqjjx958dL5INaokm9Qfpr+i6Ho/uURJ+tdN18ReDinovHI9VEoeu8pgSw6k3M1oPEtUCyMeD2Jv3jlVpkwZRT3cuWVu0P2DVzCYuhBH5wNGRCGNcHHos0eoBwqQWWCSiG7nbo9OtNdTCLig+3Val+Yb4ve7KYq11m+tXVo3GCWCQxwmDn6R/lYV9nnFG5E4rzdp0CCwqM/6u32U8BB7RValQzb29pmmjeOR7M3RMDolrKUPT5pxzbpFXiKqDaX7mcMQnPyxf0mR9HVdObF44Ef59gzR864PSJR+i94CmB9BMpZJSEfnZkTF75X2nWAx0DptUauUEPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixF44OA4L7wU4LPtCvDuK+emluTWtTBTmb32LZwOjT4=;
 b=n9tu83ggfN9Z5MezWtcve2HW/zPErgR/pK8N6P1bCDKxhNkgii2QICDZ77QvLysvZnVQShjdLmbNCvLUxgMMTdYnIfM8Qr79vk52xX1it6JUJadWnQDkNM7aw+QAoXHZDOOydkUK++DDHYwosmx8wGYzNKYm4fX0Ln/fhA4YpAR7rGJzq+N9c2XB8QPVGymRyrzO+ZJ6un1f5tt7C2rc7D2LuERkiwmZaz60tmchM2mpFkOvlevA01VHdRSNGwQfFhlKeYGDcMao0pwYkORlz/OlDbHLsJluHE40mvmZS9gHTI3pioYsD2kegBr37OQN7LNeO5m3DzOJb90dSHYWWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 16:22:50 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:50 +0000
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
Subject: [PATCH v6 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Fri, 30 May 2025 12:22:24 -0400
Message-ID: <20250530162227.715551-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0706.namprd03.prod.outlook.com
 (2603:10b6:408:ef::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: ad25eab5-8be5-4b8e-73b3-08dd9f96390b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0T+g6stCLhU5h4slPhgdswiKGzhhYlHzF+VVMpjmMsi+ZhoQ1WlGC3gWXZt6?=
 =?us-ascii?Q?WHRd2Dy4ju+Su7vzuzsJxXgvdHtEK6Py3AxZ09PRrr5HHgMXchf1bt4McwyE?=
 =?us-ascii?Q?c6JCHZzGVit5CpKmKYLeczYL4IzmBMWKZMP4gnq7kDMXrcr8/uBJrIMJscKi?=
 =?us-ascii?Q?WS6xC2wJDLB8sOd0VQBl+LELOxlz13lQm9wPnKA+qOPfQDHEJC3FoynRk329?=
 =?us-ascii?Q?zyNn65QdBv2/HCI+Y1eDngVLiKIGUvEmk+FvbSWA0VVQcEsEU8HX28cHDkxm?=
 =?us-ascii?Q?ZgnyDBSlRdP3pHCVgSMTv+/C86UQge/0omW/2spORu7k7hnCmxBTU+g60+sT?=
 =?us-ascii?Q?lvr04sBgu+3M7yTpSPNQ6SNaE4hF2hFZ/2sjRDPjonk69ZQqty6p2s3uI10k?=
 =?us-ascii?Q?bhwx9+fwpaNCrT21qnZ8JffZNIAMQ/ChBWqAjUUcEffC6RYZOsVdHn4iFnLb?=
 =?us-ascii?Q?NQ/1os252DFwwAdPwi85ukC+9ScoZetvAZXmFvsj0vK7bL6+dEp2E5hgDCW/?=
 =?us-ascii?Q?7vbMPTDEJY+wNW1B2lQl6wAyxglVxW9a7vjSNECFFL0J+VAPAqfNhOwcBax0?=
 =?us-ascii?Q?7BkoSdWjVfYCKPJ7l0sIUh2p1mg1+AgTDzUho9fFonfq2GDThK9SKERLJpfA?=
 =?us-ascii?Q?WFEoe50GdooBkZaxW/QWflm9YuMs5ds2w61n3bhbecLanYNxORPul/dggN7O?=
 =?us-ascii?Q?uA/9nWvQ+sX4L/rSUi5TDNRYzZFS+mXt5sV4msMRxoow9IZUYXGzFHnJx7xV?=
 =?us-ascii?Q?sXVI7ZIfvni8ichtr84/AmVwfEXDBpNpgHZbhCiRxxT/EOJ+rf1YUjo6gnvH?=
 =?us-ascii?Q?Kjp0jGpSuLK3AoWUK/mJUH6sRJEON7YMVmNYDCFM7PeAEmQmVWiFu4+HSOYk?=
 =?us-ascii?Q?iRGGPTmx+ZR5Ii6st5TXNSAtPc/9KNqkeglIOsexLgqblMJqFatUAuU8/m5R?=
 =?us-ascii?Q?IpkMuSYnRkEf4F6EJRE9OO0pwfy1JWEzyDoYUVZZEzcgdQz+PX2A0Zj3YrQY?=
 =?us-ascii?Q?ZktPWQHRnAzKbfUkxilT71fSQPFzMUEw/7Vqv2JdDd54NhAAISETPqQFJ5Un?=
 =?us-ascii?Q?e6t3WV5NGQHCY3thFb44dHnG3iBEyb8KUE7Kpp2/Fyl063uxLk16RdOZdYhP?=
 =?us-ascii?Q?cwX1g+Jt3afjn0kJJEyL18o22MxWKp5e1WqGKJkvpYOUGlVaaRw4P0C+DVm5?=
 =?us-ascii?Q?eFxxItldBxR0qz7uNDG6fImEFzH4QyCE69L/BhAhkcpFwTvfCefuJCmqbcO3?=
 =?us-ascii?Q?+5A+0+3sjHGj+mg5QI4pkpQo1F8M2zdcEJH4pRjQplESlbU1Icq70Hij/A/i?=
 =?us-ascii?Q?wdT7XCGqF7IaMl5+XzzQCwl8XFeJfhxlgujFMKyioEpYT9iM1B0wwBGjoN0J?=
 =?us-ascii?Q?ZnMBAKzsd7387GsdjFm2Q5Cy/vncR4C/mi3ZSIPJS+XgARojBjts8R0kSxCg?=
 =?us-ascii?Q?DLWrJdcoye8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KXZ6oI69a/VggIJpl4PBJlVguU22FSEBGDqkGiTmXd17krTPBfqKtXRh0DDp?=
 =?us-ascii?Q?Te6s+ca6we9jd321z9hRG7vdxDcwyomMvhW7qDilycdjKm6qpPtt5mNkbs4e?=
 =?us-ascii?Q?rhHve8CD667BLfGzjS69HuTafd1VLMeo6YKkdmBdEuLPVc7mhhjIB62jPDfX?=
 =?us-ascii?Q?71DEVGuR9mR5idIrYq3lyWe01HqqAbKSmbNwCTPB7Ahxlf/MN/bVpzFmJgqR?=
 =?us-ascii?Q?pkrKS453gM8XXA8YcFaHZl6LK1d5NgKETFXET8Kk9K94HoNclzJaLagrkXDm?=
 =?us-ascii?Q?hpJRGBaiAgefCG0aE1aie69JHb5zbdJEhaWB0JyxllKdjeP6ymyBxiMqTqKs?=
 =?us-ascii?Q?Q2cJVsC0ZGMa5k9TUVcDYrNixxs04pgFHWVZL3HgnxXapkHQ2khE54+aXbzO?=
 =?us-ascii?Q?miXYEouZ6Sn24CvRMYz1ORPYrVj3IXws43NWvCdBDhnX1uT72GVCuShx/Xmx?=
 =?us-ascii?Q?BTP4KOAy2WCptCCLx6l95dq+u8jRaGUWWMXkXmM6udATKjlqbCk+o0kwPupW?=
 =?us-ascii?Q?P7sUZC3frvYZKEo833buvqU6xdiITDN5RfCXpYMzvjvN14viNiEut0YlbRTh?=
 =?us-ascii?Q?LT5GZLo4MT/pCGSu9tPUVzWYdltV72Gng3otEOKKHbqwX2KUPMWn+R/tJPhc?=
 =?us-ascii?Q?l+CnlbTg7NaP1VIE7yWn6/3Bf5qdxzi6ZWXJtlFjVMAhiEex3GiwMbelM8+8?=
 =?us-ascii?Q?7UJLt8vFkuwIpTL2aa1pcQ/1RTZyYYruFGiTTJvMT6ys/W9D8U7INR7c8ys+?=
 =?us-ascii?Q?4AQJJy1rRSKqWhMxLEDcRa8gDuuUHczLarwBUFZBgx+NV+uRdZewvH4GgmMJ?=
 =?us-ascii?Q?7hYCsU7phSkL2y9YZ7Uc7DxgvTCQoAgTfH07b312bHu6f1/g/o0/JLi+Kfv2?=
 =?us-ascii?Q?u+PsUL2QPrGLAbuOFO+pbpeQ6n4CH5wbEaIsMk2Mke9uJxCZ8Vc2l2JBF/4T?=
 =?us-ascii?Q?WqxtEsqiOU9wnXBI1Q0qjhI811TbcLUohLD0SXInhx3r9my+vCqDoCAvOEHQ?=
 =?us-ascii?Q?H8UAcgQbk+zrw6sp2I6oIyCEYvb6LvGV4Z2E9gXN9qDL/R57RElFYZqLVXi3?=
 =?us-ascii?Q?ptsrpZh4HkSc/pKyCEBrPb81xeW9uhg0Jbzu13R1WASbfQJIWdtgxVmmcspI?=
 =?us-ascii?Q?Al4Hjv792nh2gdNNZ04j9KawUKxiqlxdJLaByFJi2+wjeNiEnjy2ZuyQEoGc?=
 =?us-ascii?Q?lKqR7IJsVF5DZVqBBSeta5Q5abJ3ftiBXXtrsKMDjFeaLSi2ksWF/oHTqe7x?=
 =?us-ascii?Q?8CDHtK/mqRamNzil7WePlSivqK4LawxHeHBsw8SfLJ1vLmiqrWi0ugiJbQat?=
 =?us-ascii?Q?j1mZxD4UctcYfF+nRwnwAdRiFAuFffnCigidfeZtTD/tuPpyVUGRdoTxRO2S?=
 =?us-ascii?Q?12o5KsKri7M4NyezNWgr0tL/NcPqL4GznnttRcFsdSTX3sWFukqxO89UGUZg?=
 =?us-ascii?Q?piA6aerG8pXR8WrGzOzMFCjMVoM5AfloF7xoRQwk9xGOaT9ZyGw8KL7VlNKl?=
 =?us-ascii?Q?a0BaLXEVAoAH+XgjoaXmBLgeMlRZYHW6ffEXbJly17dMC+ffaKz9f//uGrHx?=
 =?us-ascii?Q?1Ab5qQnUVb+SDdJ381iMkE8c55zEO8TRefECks9c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad25eab5-8be5-4b8e-73b3-08dd9f96390b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:50.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK8BK37x8771qsY91bQdtg4wBLxrJHagqp1HWSjR489BKowFiTGyRE5J4rjj4uPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
initialize a pageblock with a migratetype and isolated.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/memory_hotplug.h |  3 ++-
 include/linux/page-isolation.h |  3 +++
 mm/hugetlb.c                   |  4 ++--
 mm/internal.h                  |  3 ++-
 mm/memory_hotplug.c            | 12 ++++++++----
 mm/memremap.c                  |  2 +-
 mm/mm_init.c                   | 24 +++++++++++++++---------
 mm/page_alloc.c                | 26 ++++++++++++++++++++++++++
 8 files changed, 59 insertions(+), 18 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index eaac5ae8c05c..23f038a16231 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -314,7 +314,8 @@ extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     mhp_t mhp_flags);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				   unsigned long nr_pages,
-				   struct vmem_altmap *altmap, int migratetype);
+				   struct vmem_altmap *altmap, int migratetype,
+				   bool isolate_pageblock);
 extern void remove_pfn_range_from_zone(struct zone *zone,
 				       unsigned long start_pfn,
 				       unsigned long nr_pages);
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index fc021d3f95ca..14c6a5f691c2 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -41,6 +41,9 @@ static inline void set_pageblock_isolate(struct page *page)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate);
 void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8746ed2fec13..afeae59b29e1 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3319,8 +3319,8 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 		if (folio_test_hugetlb_cma(folio))
 			init_cma_pageblock(folio_page(folio, i));
 		else
-			set_pageblock_migratetype(folio_page(folio, i),
-					  MIGRATE_MOVABLE);
+			init_pageblock_migratetype(folio_page(folio, i),
+					  MIGRATE_MOVABLE, false);
 	}
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 6b8ed2017743..c43180bea6b4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -821,7 +821,8 @@ extern void *memmap_alloc(phys_addr_t size, phys_addr_t align,
 			  int nid, bool exact_nid);
 
 void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
-		unsigned long, enum meminit_context, struct vmem_altmap *, int);
+		unsigned long, enum meminit_context, struct vmem_altmap *, int,
+		bool);
 
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4ce5210ea56e..43ac34ee8d2e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -770,7 +770,8 @@ static inline void section_taint_zone_device(unsigned long pfn)
  */
 void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				  unsigned long nr_pages,
-				  struct vmem_altmap *altmap, int migratetype)
+				  struct vmem_altmap *altmap, int migratetype,
+				  bool isolate_pageblock)
 {
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	int nid = pgdat->node_id;
@@ -802,7 +803,8 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
 	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
-			 MEMINIT_HOTPLUG, altmap, migratetype);
+			 MEMINIT_HOTPLUG, altmap, migratetype,
+			 isolate_pageblock);
 
 	set_zone_contiguous(zone);
 }
@@ -1127,7 +1129,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
 	if (mhp_off_inaccessible)
 		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
 
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
+			false);
 
 	for (i = 0; i < nr_pages; i++) {
 		struct page *page = pfn_to_page(pfn + i);
@@ -1192,7 +1195,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 
 	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE,
+			       true);
 
 	arg.start_pfn = pfn;
 	arg.nr_pages = nr_pages;
diff --git a/mm/memremap.c b/mm/memremap.c
index c417c843e9b1..3319e7cc2898 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -254,7 +254,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
 		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
 				PHYS_PFN(range_len(range)), params->altmap,
-				MIGRATE_MOVABLE);
+				MIGRATE_MOVABLE, false);
 	}
 
 	mem_hotplug_done();
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 8684fa851b84..6e753ca2c338 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,8 @@ void __meminit __init_page_from_nid(unsigned long pfn, int nid)
 	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 
 	if (pageblock_aligned(pfn))
-		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
+		init_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE,
+				false);
 }
 
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
@@ -874,7 +875,8 @@ static void __init init_unavailable_range(unsigned long spfn,
 void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone,
 		unsigned long start_pfn, unsigned long zone_end_pfn,
 		enum meminit_context context,
-		struct vmem_altmap *altmap, int migratetype)
+		struct vmem_altmap *altmap, int migratetype,
+		bool isolate_pageblock)
 {
 	unsigned long pfn, end_pfn = start_pfn + size;
 	struct page *page;
@@ -931,7 +933,8 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
 		 * over the place during system boot.
 		 */
 		if (pageblock_aligned(pfn)) {
-			set_pageblock_migratetype(page, migratetype);
+			init_pageblock_migratetype(page, migratetype,
+					isolate_pageblock);
 			cond_resched();
 		}
 		pfn++;
@@ -954,7 +957,8 @@ static void __init memmap_init_zone_range(struct zone *zone,
 		return;
 
 	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
-			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
+			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE,
+			  false);
 
 	if (*hole_pfn < start_pfn)
 		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
@@ -1035,7 +1039,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * because this is done early in section_activate()
 	 */
 	if (pageblock_aligned(pfn)) {
-		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+		init_pageblock_migratetype(page, MIGRATE_MOVABLE, false);
 		cond_resched();
 	}
 
@@ -1996,7 +2000,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 	/* Free a large naturally-aligned chunk if possible */
 	if (nr_pages == MAX_ORDER_NR_PAGES && IS_MAX_ORDER_ALIGNED(pfn)) {
 		for (i = 0; i < nr_pages; i += pageblock_nr_pages)
-			set_pageblock_migratetype(page + i, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page + i, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, MAX_PAGE_ORDER, MEMINIT_EARLY);
 		return;
 	}
@@ -2006,7 +2011,8 @@ static void __init deferred_free_pages(unsigned long pfn,
 
 	for (i = 0; i < nr_pages; i++, page++, pfn++) {
 		if (pageblock_aligned(pfn))
-			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+			init_pageblock_migratetype(page, MIGRATE_MOVABLE,
+					false);
 		__free_pages_core(page, 0, MEMINIT_EARLY);
 	}
 }
@@ -2305,7 +2311,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
 		set_page_count(p, 0);
 	} while (++p, --i);
 
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	set_page_refcounted(page);
 	/* pages were reserved and not allocated */
 	clear_page_tag_ref(page);
@@ -2319,7 +2325,7 @@ void __init init_cma_reserved_pageblock(struct page *page)
  */
 void __init init_cma_pageblock(struct page *page)
 {
-	set_pageblock_migratetype(page, MIGRATE_CMA);
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5de23eba0db8..0284d74b6d8e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -544,6 +544,32 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  MIGRATETYPE_AND_ISO_MASK);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
+	unsigned long mask = MIGRATETYPE_MASK;
+	unsigned long flags = migratetype;
+
+	if (unlikely(page_group_by_mobility_disabled &&
+		     migratetype < MIGRATE_PCPTYPES))
+		migratetype = MIGRATE_UNMOVABLE;
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		VM_WARN_ONCE(
+			1,
+			"Set isolate=true to isolate pageblock with a migratetype");
+		return;
+	}
+	if (isolate) {
+		mask = MIGRATETYPE_AND_ISO_MASK;
+		flags |= BIT(PB_migrate_isolate);
+	}
+#endif
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags, mask);
+}
+
 #ifdef CONFIG_DEBUG_VM
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
-- 
2.47.2

