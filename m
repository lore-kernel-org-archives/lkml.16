Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8711E885A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908388; cv=fail; b=AaBZ2P8QvApmcPfhLs+kHb0sMyHPsJdwyzSv1FwSy/nxGwCuVWmHm+Uo9Pn7zBJOCkwqvRK0AxkbDaliHwjwHWEXF7KG8GfVZu9fUjQ52tooMXj4PX83/lWiS7kXK2z/oRW83I5VMq6Vqbbh3m1tOfzrERYG5t0i+wIJXv7n/Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908388; c=relaxed/simple;
	bh=axbLy5kfGy7ERP+dTcLFkmbbXM7Moc9wuXGtzPhq7Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JS9ycUQoGGMoWXk6UuM1Cak8bMK5baN51rohOgwpoRWHXJ6NltM2HO66/dbw49VR+H/SeGW4n1EOP8q0xiNDHiiReups7wrfmSaLALWUvxB0wASygQ0OKa7c2Ce3ax9Q2YYIRx8y/jIEUF3O+cXk1QdP4N7frLs32O2qb0Izmh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A0X53oOM; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A0X53oOM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3YHMmwS4h73+yCk9Ie1opRy+5O4z2LXRz73yLiNInrME7GQKqhU7DnOjk5v1wAJA/QYxPYG2Q1uDhS8EMkchouqv9NqgBrrCgjVS3dLs4dNBVAepVj6j9x2yPDk9INbzbA4DoTE4u/Jo+R5UlW7M0E/DIRKjO3Yk+ez6DMxbnxvOfjggIxTaRusk9D+FrftbqonrxD37sNDOF0mj84wP9zWNk0Ddj5NOt+CRWsx3QUl6X3f1n9Hqkk20Qvc/uRQAJpEp9lbFwH1CFRXLwhnRfLzV6JO+ww2L0cC4TrFZkIjfDyBwvFUVGbMA4mKMCQ8nuh2KDk5QrIP11sMhe2HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHKcI/NcdlxqGUi8fUIpIqJzLD2YbZ+F2c4iWBCvJbw=;
 b=ugrvlJ9i8nQvbhAYJOgoRxXSKzsOh6pzTgZuaA7OW/+0Z8ZJEeQ1mLVC3osL5BfVBVqsjH2EVYk+jt5woRzULnkBNyyzQE7fAz0J+tKKrz08kSQP0SHAVe1FUQv85W4yhHpiYNvTenjqR3WjQXT3mybsLMaQiZtIjvjlxoNCMdpoJxi3+vi3mN7FUNcUyEJPdxNFiwUlmFWccHpGpkdMV3oLaqQtO2ngbfJbaECAPU6+Fh68A6fL7fN9JTNjEBNowUNBFtFRyatjBAFh5O/k3BqkYAjBkjQcL+69GTGDWCZbLik8m5COPOvgeLkZTu4xHVAoDPkTr3vaIwidTskBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHKcI/NcdlxqGUi8fUIpIqJzLD2YbZ+F2c4iWBCvJbw=;
 b=A0X53oOM+Y4En2tqgxuspEHqXhuoY1Nu7JaygRypdBIhAUTtP7Jo/1g90Mv7KGg5wgcsdpKYhXCBuhICfN3gVqTSRPMxCK9qsDQ8ruuIZJANJT/J1/1RjfNWZ3ZohBdu99C/h1QurJ04sAIuYmmwkJAXI04fjhkkvEV821xFepnyrzSZYL0RNk462i3MTVur0bsa8aJyf/kxqSZcb5yvnYkzP3ETKCWzRlm20dpOQm38nLAnDoAMSWBfgeMfLhEXqZGuy1u+6lU686a4xcXT3MvsQZ2Ss3fnniuYLN9t88R+TXNOA64TeOicYTVpdYGLofSzOCDQOTcTOkIQsI7zxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:53:01 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:53:01 +0000
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
Subject: [PATCH v8 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Mon,  2 Jun 2025 19:52:44 -0400
Message-ID: <20250602235247.1219983-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:160::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b61c700-3913-429e-90a9-08dda2309b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tvx3+cjhEN35LHZ/rDFJv7f0X325kIe1pxRilQUBiI+MPI7lGLvAId1cN3+1?=
 =?us-ascii?Q?SPQQZSmHGfhyZHSzGjnVI6YQZLApb72d5j7HuK1M8S7O5NYrSx908A/xOYeS?=
 =?us-ascii?Q?dRVp5HhMbo6/YBQig56Q5HdbN9iKc1krC/DUmI22V1cReX36KR9D922QHGho?=
 =?us-ascii?Q?oA1FH8QwSW76uewACWe1zXiWUVz2saMYxcDELvqxywYNs3/QaAO9PwMQHsu9?=
 =?us-ascii?Q?n8CLb79li7BjFxDjY2IDVzpAE3y6p1qW++aVqVCSPW7W41Vk+FWTu9qB3H4P?=
 =?us-ascii?Q?pW6AKy/klSmB40lQoLbQ266bsL159lwOs/jIAf23OGTakD0uF2DBu4i9oPrI?=
 =?us-ascii?Q?4o2effsjjMv5YVRy6H6UPLoOPu1od+5WQGgUXJGljp0MLCgTV7cP3N18W6YG?=
 =?us-ascii?Q?LwT2pqBwszyf+KnCZua5iMK/W59YeTF9uzQIdiEcm64QsRbkdDuZbth4uRnT?=
 =?us-ascii?Q?0f2XYHiCwZiDN+V+zLzGv/QNmuLmV9iQ/ZS250bHZU+Gp1+WBg+AjCmR/B3h?=
 =?us-ascii?Q?SF3vtp0C2VxdmSzR4Em70Np3gP8o9k2wLSqHwcTuDaIiWYFAE10aiVBtqG7o?=
 =?us-ascii?Q?y1tCV32UVW6D9+KSURcMU0ol4a7qUFF6e/nb9c60sqwJBSYPFk6PyOmQVwsP?=
 =?us-ascii?Q?9QruKYyQ+8aPT3b+hGzfstOyd5O7EEQeoI8ijYirC/Um0a8mkl+q8xkIk0hn?=
 =?us-ascii?Q?9IvAZwRac/sOTnXGASjcUyo8exoonGopjqxd1aNXyiqai1DAs6zstpSemQsu?=
 =?us-ascii?Q?jDRy9a+Wgc4M5FpR2Au4kP7S/5UOEiC0WhmBtGG98d4F6AkN0H6MFy6TEl94?=
 =?us-ascii?Q?pQM+601VzYq+MezijjZ1dB1MeRfYk/MbFEuV0lY4pLKbNgbyYrJKQVZHp7s4?=
 =?us-ascii?Q?NNknW2iATjmaDxx+arMjcOTGYC95BO4NLZUTXzS0OCsyMSNdd73iOz7F3duH?=
 =?us-ascii?Q?q8ye6iXgqeRuzZ0UWcUYlBvIDFh9ljr6BdDpu+QF+jsSp4QZPoRcYkhLgEcg?=
 =?us-ascii?Q?+3RAfem2msy6iSnebhqiNTuC1ec5ugUCylnAMxTnFUHToJnuIC6cry3pjH3I?=
 =?us-ascii?Q?ABx/EoMMe6oiZPcY84r3Y5/KzaBVBcQ/bxdQq49qlGm7cWYDxRfeXt71oJM6?=
 =?us-ascii?Q?HmYj5JDqVD3RVx9y5TTzTnutIrdEAjYNTuRSPJw5AnU2WxqzPqU0Ks8v5OQm?=
 =?us-ascii?Q?OjuAng6kTXoLJGTn86ix3DfWycOzAHXzKrxOXiIqTMBbLmAyhsvtlC5CEnsY?=
 =?us-ascii?Q?IW9v5LlbxYSIhprSPS0nVmfjLFRZzcVVrI95nwb46DphdmTDS152gFI0Aps/?=
 =?us-ascii?Q?wEKTmwO8K5KaNvae0G89vwtbpggid4OjpjJVlbnjyaNMkbbJRAf+aiVxk6Qo?=
 =?us-ascii?Q?RJ/278mnFxfHROuvbsbWi/NVDIlozcJtXUPnR7D6rLYkTjpWUhUIuAos2xQB?=
 =?us-ascii?Q?eEK9zXUA6tU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LMupQps2pYIDYxJQzgs1iYe+2eqyvhjZQJyph4o62QVPNsTPvN4gSJffc2Nu?=
 =?us-ascii?Q?vYHeeRlsfjZT9EARwXm94ut6zrTQQ11rKkiMt7KSjQ8bePLHDMUK3aT8A2x2?=
 =?us-ascii?Q?hyP/HIC4VnNEsbXZk5zYODvglgPaqC8RIZJtoDe/unCO+g0zCHQ0Cz508R+A?=
 =?us-ascii?Q?1fHaWymCbyFkmWQqN8vc0CrZa11rZAYOvmVsokfsD1OCQXjycATkdV8Qmsbj?=
 =?us-ascii?Q?mYLDeMyLB120pFnDXrje/D8r4cBQh5mAvrC3KiVN9cEfeb7hLeBY2BZZDTEN?=
 =?us-ascii?Q?a+5+Gmn9gnefUlRcbW7rCXiqGveT5i63VD+EP43V7j0NDcdvKKWiGVuK0A2q?=
 =?us-ascii?Q?BX+wrPos4liFFedodsxf0spqecZ2fcyuhV1bdqwHQbvuKNm2/TXbAF/84p7U?=
 =?us-ascii?Q?8hFjx0Vq+brgu72/lDG0hAogqItL0jwe1K2yxYXK/ytF91pu/oqsnlv4FUZT?=
 =?us-ascii?Q?8oFnsP7KNvUHtKkKEJyAjWbP6Q2feDB9B+13aAVnWow4QtZdIU8j0PlqBuFl?=
 =?us-ascii?Q?9hELufyjAu6mXUnjOnHi46ZOEaqoLbB6sr2ehSX7rDq8CY9qwUbcNqoulDJ/?=
 =?us-ascii?Q?GbjqP9nmH0YP+llRMOPg4TquPJrW3L07swWYmGOstZAsxdMfhrPhYFPnIiq/?=
 =?us-ascii?Q?KDiYjTbk+7Qz4Yg6HRxHhh8OyUIWdq9vHQjOJ8dQBj4Si7QXzzB4Qfh21fEn?=
 =?us-ascii?Q?JlftoyKwFsfG5INwdEJH8UL4TjdFb0vs8pIXUbMhHDQdrM3WerkfXlu8tJEJ?=
 =?us-ascii?Q?qcw5hJf2YGGotJ5x8DpJahch4CMHxkyBksJYgVohe8n36pSZ8K0VHEqVyzj8?=
 =?us-ascii?Q?T9xBmelcGlnJADEXoL8/r/+0qIhPnKmhz1Zl6V2HVM3tA5R9usCQAxQba2hm?=
 =?us-ascii?Q?3fXcuE+HH+zLRJemeZnTRS/OuokTZEyc6NcUy2Ccg7j06Q26xzIrEffr2SHg?=
 =?us-ascii?Q?9xRhEAH7UlgHfC6jVPB98w50fKjKqSiGUcepBfCJpFM5CcC2+uapmxDzjlA9?=
 =?us-ascii?Q?Wr1frVFMY/dFu+VYRa/oRfyIDZuaHtojJi9zUP4dewQIsMDA5MRiyn0W9rsJ?=
 =?us-ascii?Q?A6kJd0+Go9ZkYhSwTbfeAvRkiWbqACt/c2ljyubZ7jkPmvCUDrSPS8tAUH3+?=
 =?us-ascii?Q?DgOD86uJcuFZ39lvIPqnaHWYHgp/4MOOOeDEpl7+Yf+qNiFIbHR9lZts3I7Q?=
 =?us-ascii?Q?nfwcBgwgC+21M8e0BBWJK8PoB0ZpFKgeSkAMAhPErB06pZ+7GIJG1nOuLVGZ?=
 =?us-ascii?Q?0dvuzPJXaqgQ47Bs+6zkQ/IsQPmNNQDcEXdDAgFZ1KTC25I8giyi7g7CVmK0?=
 =?us-ascii?Q?l8/MKtSVST7IWLJSmvil/WFZjVMVIopyfNuu5W+FCR6XqE7r+Cr0YBn3aQ+9?=
 =?us-ascii?Q?fAH9vjlCHrgiF/Q95AuDIVHZTsRMQrJPdMkUAasPWvpDyOZpZ1Ieg6jnSRzj?=
 =?us-ascii?Q?ZOBdXYqvW7SMFr4IebBbQkK0+/FoyvJFwpJhciXtIa/sgsLuJ/JsKW7eIlW8?=
 =?us-ascii?Q?yAYVKhEeg4jkOAuTMt42yKqmHUt1wlhaARuQUNwQ19x3mxM7qCnD2B4hsTzm?=
 =?us-ascii?Q?iCq1KTrYftalnL77VjtDtxCv+VDTt3AxXXT5npfF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b61c700-3913-429e-90a9-08dda2309b98
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:53:01.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYY8zZsaWgcEXf6U+aWoATq/2ZYv7FyqMx/oxTMjONSRkktK2IuZoMgLxBnoq32g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
initialize a pageblock with a migratetype and isolated.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memory_hotplug.h |  3 ++-
 include/linux/page-isolation.h |  3 +++
 mm/hugetlb.c                   |  4 ++--
 mm/internal.h                  |  3 ++-
 mm/memory_hotplug.c            | 12 ++++++++----
 mm/memremap.c                  |  2 +-
 mm/mm_init.c                   | 24 +++++++++++++++---------
 mm/page_alloc.c                | 24 ++++++++++++++++++++++++
 8 files changed, 57 insertions(+), 18 deletions(-)

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
index 4ce5210ea56e..16e3ad874144 100644
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
+			       false);
 
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
index 5de23eba0db8..92a368d38d77 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -544,6 +544,30 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  MIGRATETYPE_AND_ISO_MASK);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
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
+	if (isolate)
+		flags |= BIT(PB_migrate_isolate);
+#endif
+	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags,
+				  MIGRATETYPE_AND_ISO_MASK);
+}
+
 #ifdef CONFIG_DEBUG_VM
 static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
 {
-- 
2.47.2

