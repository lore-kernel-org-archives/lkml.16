Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CF2E426A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075836; cv=fail; b=F8w2CbkGDYJVdUVJD1VbdhaGJLrJ7ZHZBiaiwy2KkRu2P1bM8bd7X4KKJ2YxTJTWkQecVayHTw03PJWRfku09UDFX6QZi6otk+qvHVeHU+uTot89m9isdK94EKmHpYsW63bKG6NNdfsXGAMsukswk1PPmzikJwfDUw3tT+dEnc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075836; c=relaxed/simple;
	bh=R3FnvYprIf8vL5sGqzgIS2s6TTfd0SOtyt3sQdeM5jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LRR1bHWvHzrzeFr8VsgHN2CKT308QNeSglxrVl35u8UmGEAufnNI+Fu0F+5QxQNRRfIvc+CIamUXOtDj5iRL9GLhV6eAwvVNL3haQOuH1WhME4n0zmrcVbdWehGdKIyMlt0xGmrDzXlE+mYaeQuJxdjTnhFXEGj9FCbxisUNBgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RypWRML7; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RypWRML7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8ptj2vZgajF5awI+l0rdF+wM0pzcqkV6V3Cgq91OrWROt3wvcM5DAuGOxLvm0ciEATYbQixWBb7gxO+sDB3OEwfilOoFWyKJF1DMYOL4o4blc6KLLp/uN6cUZph+DXPVc9K36EkSyhE2ErgCqALbfZ7aSdS++TUdtkPiP1cSyeH769U8LKWb70lvT5jRprG7s1uU7fmdyEivuXP1XjV5JY3PWSNYxNn+rvi6nMZrEzaWZTabr/0eYGIR3pclF+H21iXxGt15Q7UC9SVMdgBVmlxZghwlARHay+sEA6doEUFTNb8g/fPr8qpjrFUBWHAcR2uvRjI9xdh8kE8VYe1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS5g8DEOfQZrx4Ln+5mZoGBlbyOzV3zhfgR2vmKq4k8=;
 b=b/GYgNfWeWs77WIHhlXOQkJxOIGvXYmABpUC/bo6Je68mOV7bYMOOgkna6vry+DwOWiymVkTN5sZOC9WQIqMYldfDCc698vUqeLwEYR1DR+h3FBUtjny+pR50e8CZCF7U4dzeadc0jKdvfhmLc+1peLLgwky1l29rW9FUOWptICiszikcGexVY8kIPOY5M+cWfA1R9ILHGBumgpu7SqCgaiE4HWFXYlMPAk+gNWiVCxqf+T1LvcaQAxtioBQNOhlR4YYc2XZTdCmYU9mz2582RjzNxys6msRbM9hFYM98Ngpkqp3opj465XXCO5lwhiqmHcaYv39BnpjoT5Zj6FwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gS5g8DEOfQZrx4Ln+5mZoGBlbyOzV3zhfgR2vmKq4k8=;
 b=RypWRML7ntwwj3Sso2lizkhhITlx2RJk9hG7UToBnsWAE1dhxoTHMwBGzKNiFbmGp/XMHiWMdAnNq9wZ+xztxaOG68DxXSvEP+ib9OjAqrATo0reerGKRPSSM0FlpgGWnWvzdeiv/xRFpET7q6P4zqluJWIZ3ms/oXEdUpQH6rP3/02j6IwA4GClCC81Kf0KYAjFBzXi7AYGz8s8VQlGwtLv+jR2R6r5dPnS6yffXc434cv9dToZgoyDGXJDbMtRpHctv/qjmukbiOd94cboLzWV5coe/2IGFw6TT9eRmqJfb1IH4O1PVIlL2R3Ff4lIPU4aSDFsA/T91O3ljcreQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:10:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:29 +0000
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
Subject: [PATCH v9 3/6] mm/page_alloc: add support for initializing pageblock as isolated.
Date: Mon, 16 Jun 2025 08:10:16 -0400
Message-ID: <20250616121019.1925851-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0035.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::48) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caa833d-2ab4-4edb-0378-08ddaccec8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sthWU6t4z4/QtaiauBAUc/Fjk193FOywkHwi4dgMP1d6A7ARgkakIELssjnF?=
 =?us-ascii?Q?KEnTScUX00vJYeG5vvn262MtNIu4vgAP0myWrjrODxcblnyqjzfaFqZhH8Pi?=
 =?us-ascii?Q?/QNZq+RVsJNSdxp/AySugPyVNx4qxAvyK1D4eRAsF6Ak6ozjwcoz4GNyvC08?=
 =?us-ascii?Q?qN1qYGdlRl3Z3XtuKqKf81XiXRDVy2RX+8C1jS6A0/G+zZVkN3OEmRHLOw9f?=
 =?us-ascii?Q?Td60Y/0qfZGtj4P7xFWVx20cT3aO7E9D+uIqUSjLnoV1luWm3WZRcAGkTGL7?=
 =?us-ascii?Q?k5M9AFyxV7ifIEc4pGsISY7D0TkekX8FUz1dKv13wpEvo2RbBCAGbDKEpZVp?=
 =?us-ascii?Q?M2qPuKoEik5F1SZuJ4DD366puHQ/ZsWeWCVYmoJ/hrwyB+BI5PFHFZ/+2WgW?=
 =?us-ascii?Q?VX965/RXUPYfv52YO1P5d5e15lpyF5hqFRwceFChRFoNy8S8mJOB+RLoY7oh?=
 =?us-ascii?Q?QU3TSqUDHAhUXfcb9BVJ5ng0DcM+D3Zo5ZsM53FI9LRNlpnnWNt0C7WzlUAA?=
 =?us-ascii?Q?tW8240Wnxzqbh/N/PLgu7p3+V2/iCM2Iu0LzCfydKrbZkmIO79xmhycpkgnr?=
 =?us-ascii?Q?nZkVDjVn7P6mMQtGN2/Gn5mbC8dQzFD9r3vPmLsxKfTpog+HaB1i4ZaN0t74?=
 =?us-ascii?Q?PZY1vKt80jGSBp5rZgd050zUbRd6gbsz2qZmb2RTVmNAWpU+DO1occ4QW3/1?=
 =?us-ascii?Q?89MnuLP6vdgmw1C5V+W+vwCjqByRcZ2/pBVz4LfCxQoe5bmyMjwFRIKXos//?=
 =?us-ascii?Q?qWco6Wt9MXtXGOB0qc0Tn5aBuhf7IuL7egmhwIACJfviS/WG/dEv+8AhgGPJ?=
 =?us-ascii?Q?aCWYIX7hAU7tbaR99zMVD6q0/TT3Jnm+YKneFj1PhOXYdEXx3XsfGGocaYa9?=
 =?us-ascii?Q?lT9QWAEbAkITsQqfeg81GUWh6Fp+EOlOuXQPlwBnZoMM7bPxYbD19cGsJFd4?=
 =?us-ascii?Q?5cdAYdgWl0/Q49BfUO62Wt8n8UAbWRrPCq4iunrhXP20cH0/XlnECuO+aDAh?=
 =?us-ascii?Q?bmdy+FvzHktNU39dwh5AmKlDbAws1YCMTByS9Q2UUkpgwyNjVMM2QF3qAh7m?=
 =?us-ascii?Q?3a+5y8QIeeMZFWu4/Mki+ifpo9k4rhrTsZOxSBOJmzibulP1VZ4hypkOezv4?=
 =?us-ascii?Q?KOI1lI0pxZWQPQhEqx+N52IqBz8qSlaFXptqLrQj6pK5x8GK8MLpYMm2gRRL?=
 =?us-ascii?Q?8SjUivcPehKuyGUCxlQ/DC/h1O5L3ByoFnkUKZBl45n5lkhP3ysfjD+AuT4O?=
 =?us-ascii?Q?DSZl+3WnwNGTce6WEhNUveEFvrx/g/I3WdNMNpq1TXpiMBUq1Fiz8eRpkDwI?=
 =?us-ascii?Q?gVl+GnbUR0UF7VFPNIk7u6SV2M4F87BI4R1Xg9GEl/rqpl7bwb28TNxC3R2z?=
 =?us-ascii?Q?e1A4/95HzIbNz+Pjb8hW4Opb4A20exGhutUNW3NU1yhZW3IE16AwloZCxy14?=
 =?us-ascii?Q?54M1dxXGOLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BxINXdqXDk65yVd7wdNphblqH67X39KzlRPnL0hLVn9Abz/4qAdXZ+m+3N4h?=
 =?us-ascii?Q?WB7Odo0AVTgYbTqZDsuzze+mKpu0ZfdZ+8S4HR6agWdveQLYSnotpSN8RtkT?=
 =?us-ascii?Q?6sRVoCZsx8xBWcbCcoA6wCj9AE+3PtMTxNU7vAdEzZJOAugo+l2h4tpXQrme?=
 =?us-ascii?Q?vUieEpT81YR0Lk6dJwJIJ7TjVBv97B9jiU1F/8MddDBoVRzRC0OW0XyYig1j?=
 =?us-ascii?Q?TAiqqtYPH0+iTH50YQtlRGa/MwlKPb/zUvao37AZGufqBMbEYrpwIdmo5J1D?=
 =?us-ascii?Q?Ak3IS0SoPf6EqNa5lCRPUSqBd2Bv13tr8PSzwQNefyGIsaAOnQpG5dVNR0Fu?=
 =?us-ascii?Q?maF8pHSuUZe1uoveXPMtux6CJ6JbuYZBt/QDPq9/7qaR3EO8v7TuhCGA0XUA?=
 =?us-ascii?Q?E8IvZZK4w6g+4zS5SGoxDesIuSs4+DaddirFlwn1B3t6LvbCD+7iCXBCdiZc?=
 =?us-ascii?Q?p27+2XnezPIpqifh4ePTS7Qpafo6InnFrQeBqjK3fMAOwwUrSLlg8XUnTVAB?=
 =?us-ascii?Q?Re3rkJtoynqJ7Z11Uekhsle0KvpOv5LNr4bUqTyBNSzPmkp9GScB0xhom5zy?=
 =?us-ascii?Q?dZ6j1YYswbSV/0YsHaNrfJ0hH8dhVqLiT8lRy9xbaLcq9ZUlFSWouG3s7D9r?=
 =?us-ascii?Q?TxfY0hqr7v20ysqvW5LPWC0JXzOCbprYzI0H3uSEdmx7og9rLtleH/2JCIcN?=
 =?us-ascii?Q?4SrG9oBjE+teQEMb2JZZq8tFRkdMJxohL4vb8MhDNsR/9sQcSA9Bx1DYqaHz?=
 =?us-ascii?Q?vuVppwBWatPcodeDuw/PaNdnIYVaMAUidjTguyaIJrCtVWiH9sbN6dck5odA?=
 =?us-ascii?Q?a+L7EnMuud9vNhQu0i2LH4DhnKoVrAwr95t4F9yoV+FKe1fwC3lLOkfbVjrR?=
 =?us-ascii?Q?pHXyBcjdcwU9VAtib/IgYQZIJsNjX+m06Yck5Uhxhe21RX3YLjeVs+EdOmIL?=
 =?us-ascii?Q?umBmN67IDEFIZKFJCSO4B7D0cBpiUDdoVyJ9S0f7f4gU69+jmDvBK2KuNZU2?=
 =?us-ascii?Q?WT+qfwRrV+b1Ql5BNZ1TlNyqHBP3aZEIaFo3ngFhFGRxd+R+5RXV0Cmary+O?=
 =?us-ascii?Q?LJcz7a5GsEqVL5oIEo5cmsaN5VImZ7s8swjrLFZipEFCyIVum75DSed/5wdg?=
 =?us-ascii?Q?GOSZS5P44S0hdrFnuVdlOVJdiFwVWqkSuG6XVkx8TWG+lOlwdf8J+asOZsiM?=
 =?us-ascii?Q?2IJdikTVWiNM9OfcPVV4oXBZ0dzuf+UG6cXKdY7Vw4qZokPTbOdbvU2CHEwV?=
 =?us-ascii?Q?w3vbFIIzDlvrlXiS+Kl/KKqKnXfDgoK4E5qBszbp0DHITFVeaDqII9dqlkSQ?=
 =?us-ascii?Q?he2DKySHJA5vlPgRyu4X8kXbqJxEbW809ddEs1ZVRMNeafCpLDvV6/ZqKF5Z?=
 =?us-ascii?Q?0N8hMjt/kckAgiDDoQBiB43eYKJcZKT8TPuyMk1PH4CMX8GbvRuIBJfdOeXD?=
 =?us-ascii?Q?IuKbarh3SXpTJMj1c1iNS22uTKzwP6137Bg5Dx0pPh75ImxtIDNWx+lmGTYp?=
 =?us-ascii?Q?Qp2/1LcsPm9No1hH9mxCl/eaE0WJQRUYMu6HtIcJ33GuW4KqaGrN++gl8pQY?=
 =?us-ascii?Q?9ggOwSOcHOOkz53VmTSKNOzH9vbaKKDfm8IncOuQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caa833d-2ab4-4edb-0378-08ddaccec8fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:29.4373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXEF05qpzbnz0kCTBnLa5c+q7eahddAlOAmc4gpSjf1gxU3Pp5U/zwRy/dap7axs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

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
index 7a7df0b2a561..3d61ec17c15a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3299,8 +3299,8 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
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
index 3823fb356d3b..79955ed9ac0a 100644
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
index ddc6c6c63a30..35f008364698 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -747,7 +747,8 @@ static inline void section_taint_zone_device(unsigned long pfn)
  */
 void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				  unsigned long nr_pages,
-				  struct vmem_altmap *altmap, int migratetype)
+				  struct vmem_altmap *altmap, int migratetype,
+				  bool isolate_pageblock)
 {
 	struct pglist_data *pgdat = zone->zone_pgdat;
 	int nid = pgdat->node_id;
@@ -779,7 +780,8 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
 	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
-			 MEMINIT_HOTPLUG, altmap, migratetype);
+			 MEMINIT_HOTPLUG, altmap, migratetype,
+			 isolate_pageblock);
 
 	set_zone_contiguous(zone);
 }
@@ -1104,7 +1106,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
 	if (mhp_off_inaccessible)
 		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
 
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
+			       false);
 
 	for (i = 0; i < nr_pages; i++) {
 		struct page *page = pfn_to_page(pfn + i);
@@ -1171,7 +1174,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 
 	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE,
+			       true);
 
 	node_arg.nid = NUMA_NO_NODE;
 	if (!node_state(nid, N_MEMORY)) {
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
index 02f41e2bdf60..5c21b3af216b 100644
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
index a6e191f86ea3..3fae0694aaaa 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -544,6 +544,32 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 				  MIGRATETYPE_AND_ISO_MASK);
 }
 
+void __meminit init_pageblock_migratetype(struct page *page,
+					  enum migratetype migratetype,
+					  bool isolate)
+{
+	unsigned long flags;
+
+	if (unlikely(page_group_by_mobility_disabled &&
+		     migratetype < MIGRATE_PCPTYPES))
+		migratetype = MIGRATE_UNMOVABLE;
+
+	flags = migratetype;
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

