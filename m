Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B0125745A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092015; cv=fail; b=qMoZP4oeXM5XRUh5+WlVm+6QZoubFtd07f6CGkpc/JGU8JeKU6tXb9+TGjYz+R2OO9YxLDNhnRR9lTD3MqKR9LjsReokZwKxvUmPaobUU08t3vSpGemRPDUTjxxYxrOZTI6qPZsd48kgZmoxkntwVUixYG/9UnjxcoZ06/zeDIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092015; c=relaxed/simple;
	bh=d2+6+8vw6YlCOpIZR8mNcEUKvLvhXGGlY9lyeN0YF5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oFaIz1lF+CZq4WsjxpW6RploTiZsY17eL8HMmM7PySSTWYEGP0o/wp0KTRnC+7VRA3ZAgFc8ThSpOHuFibjyLHFU1976GS/2S17IZdzCvNuC8FPHhuVCH1qyHcU9A1PsJ4+wE41LrR7VfehZ5L9YEK3XnGtk6/qHEhLeiT0oO9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=INwgolbI; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="INwgolbI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOVXcY141r1NLZr4FYC4HuDCQxTjRXToe9hknA7I48QGqLsC+6I7mGoBSwXtWh/RTcWh6MzQaD+Ie0/pzNYISAZ68KRvL7fYPzAdCZYhbl+1cB3mgCzLucgO/53xhvzuF+w7TfBVphZ5U7aIN5S9tIxuh6YNrJI30Dt0M0yX176uKUzAwklWxthYHE0y2pDsR+uzIMk0hFeYmJGKf1JAZc6gaDQ4wnoASw/mHOSej+vQ5iV9YipCs+n72YCVWc4KsOL3g8TEKmUhDRrCnHMwTni2t9Ifm3qF8funyKfvVedVdaV1s4OLTyTfPfXdhKVa9PaoR2sZlUN/kzAbCRWHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/L3zoxuNjx33pPdnkbTddiB1NJbcwNaH/p3apAM2sk=;
 b=lF0vxxTEoVdfjhnOirbAUsCzE3cZMC6MArUZfmVF94GKxSXqtORyKdj80/K8DyyuQB9TBM5pfP0tr23Dn23aysqkWXH/m+Eldl623a6aqCupxwVJ5Z5RWUhU+BlalOyLPLNhRa+AYgTstg3u6/PatUcR+t7xYci1DGV5/Lr3eHK2s+4OTSQSKaM4Spkj4ht7oQOdLinmmcqgkRXmZOisBL51F5X1IXLyMD2w253RYxZqfHQuOpCZa4DxaR8BJlge+x6H9//tzxqY9FHyMaG9rxKh70YaqwODZAmaiMkT32iylEiUEAbjM2KuJC3CZJKNNn7k3nVmABKG6t0TSdkSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/L3zoxuNjx33pPdnkbTddiB1NJbcwNaH/p3apAM2sk=;
 b=INwgolbIbM8GbjNNKxB+HyMR7v+K+8T48FqydfdVto9Fi30ZPdKbj8zxI2CfoTqnknDOQBvsLN5uiZ8BROZdpVopdzc8goH82Sg8TFQwEGBAYTboXJ/vESxIGf/0PGrLGTmHECWCK2uEvedlqp72qCuiSjQdQNNJULxE47rDlObImsusRtxbZBYMTCTxvX8STRzbc+fD8xUUsZoUebubHd5ce2ARWIBG9/CiMcSr+PKw5ESgBeqTCfXO6NpaS0qTc/a5EnAGvB67kdy+W5BxCypfJsj1PQsuxZOhsRSrl5kQGpbYw2JpYJ1+TSKJ7lFec3Ye/LpBnanJsoliXthzWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 23:20:10 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 23:20:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Mon, 12 May 2025 19:20:07 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <689BD0D6-E5C4-43D7-ADF5-675B7ED01600@nvidia.com>
In-Reply-To: <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
 <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:32b::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b1610f-3e81-452b-f02b-08dd91ab8a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SBEv3MQHY/czxhtODCzD8g9bawAlDAoUjalUp2/3LWwBUJ2nwCICGhocJz0W?=
 =?us-ascii?Q?A6BZ75GEVRYTgx4biK1SjHa/dZ/6jk3DAy3hatww41hmEUsswPVp7sSh5llh?=
 =?us-ascii?Q?7KAYWubINHkMmmugVZ3tdH0IYVEOunRz4hWLpXX2XJc2QHjV8UYE/MifyxPV?=
 =?us-ascii?Q?1czvVH2zrofS5xu/EoC+1oh/awSVB5XZbYejeDYC3x75Y4NVldzB+3E2sm5X?=
 =?us-ascii?Q?riIO+1S4OViH5jnlCPuJk6U6bMyt5XGL3SeF0VtC0ZGWwSE2mFpuvgKUfsEt?=
 =?us-ascii?Q?mMpMDwaZLnwJdlzxkiW1Q/CavTNh9tqvRfxPwyh1wjEG8cVNZLcyI1wOT+CO?=
 =?us-ascii?Q?04LskJr6eHlB5gCNduQUc+BndyAnPkbyd6mMcCCmwMB039SuHhFooQwQwm+F?=
 =?us-ascii?Q?6WZwTX2NFWSRN7u8d/nn2K4y8OWimFPv4zTOkzgxbl2D64bzeS95UjSgQFt/?=
 =?us-ascii?Q?jkl/+7ZQsP3k1dnnO/9/0HtMS8UqIEKs/n1KZnKpC0ssm8dymYiNLLJyw7sy?=
 =?us-ascii?Q?0G79mKdsKrYGYddOMI1CdInpvlskTpijMkvnX2rD9Mbjdo4+T2XcU1a0dDlK?=
 =?us-ascii?Q?YKgTa0cAu82mtnKZyZjXt1QmtxMqy5Mg5E7PC7uFoZTxzOIscDQ1PdtsaOAK?=
 =?us-ascii?Q?1JxXVqoWdauEzjlXe97VMBMX9PC/5Zd1fzbq0YpQRdCWSwjAB7bgvJDlSjS9?=
 =?us-ascii?Q?tuFaDGODAEcP81euBYS6pr4CRtTqkXsbB45XnpuUNUE6pQVbPOyNT3wcT66x?=
 =?us-ascii?Q?SBGA58tR5xUHTC/pokS5N6fp2p6Agw6MY3wihjVqfQR9/fYAjSekQ67CZemK?=
 =?us-ascii?Q?JNY3FN+aNoaga2wpBSQoYjTbUB4ag88H6F1ue1lVufBzjGQjl7pEJ+GMt4XQ?=
 =?us-ascii?Q?M/NB1J/VeWLlp+LKLEEY6npbMPk3307e+gJJJsk60UcYhuQiy9VD1Zhq4oz2?=
 =?us-ascii?Q?vayegNmJiNu8evM3WM5yXRLDqX7LUY9yotTfegN5MHcBkwFHIezDAvAKJL7A?=
 =?us-ascii?Q?dXs4evxayfCbc2KnlSOSoX7XQrXbsM9+8yxDzl0a82Klhluy8cAN1oKLUGfa?=
 =?us-ascii?Q?fhGca+2uVIbX3yoNllzdiF1cvirzsGAZXLlPHOKwm+xSXLdh4Pih+gKDl2wS?=
 =?us-ascii?Q?Ro82xVH+ySZeTWLj72Qr2XFl8XUiNVMyg517xsqMIkGSd5BPKLUoDcZQgxXu?=
 =?us-ascii?Q?BY23x9f3sjubNSIZnI+QeGIXxO2Y9JX1/FzNPd2d7fNksDJp1QwGtmJA8q1k?=
 =?us-ascii?Q?D8bAXjImd2dOWxeSJzfXOyrJHLvQYM9popAC+cI17hGqDshsqFGtkasz6X3O?=
 =?us-ascii?Q?kHje26kaKu/PaVBg9/j132HCkyDtkj/DWr3jY2Y8mWixMzWKV0Z9k5YvC1VV?=
 =?us-ascii?Q?SEMlFvgDvaNK2Nc3DXXz4H5E3hVEbtxEPHIU53Caze3fW9b3UwJl47i8idsS?=
 =?us-ascii?Q?lEL+rMEOOTg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YPzPK4HML0alIHtgc7nBo8zYNlimvq2nBz9YQF78iM/U8DRqAD2YV1/91701?=
 =?us-ascii?Q?127cCCfWM9mtYSSBwAvOmxU1SPy6+aMudQUKdsGo6Fu2On3oC4FeQgxwEuXI?=
 =?us-ascii?Q?uoCWeJvosiByMqDgDjYeLCwdoKYZZWm2uDyHeB+YZNA5nuc35AlDxuMMAlbB?=
 =?us-ascii?Q?NC8SICFpqutehuxLiUpxdlaxFc7cCuDEZXtZXHxaE4B0YnJnau0GJ9noAjdy?=
 =?us-ascii?Q?QGHeOiIP/GrPr2+S6LxQ2PmO5jIIbW+V2QNVJnhhf51idkNDwKJSYLcBJy2o?=
 =?us-ascii?Q?Sa0rYEVj9u0Cobss4jrU9j7ZgwQA9xlgKW7ewX5wPOdelBhj1FI+trrGiZ3V?=
 =?us-ascii?Q?W9iDsZQBnmqKhFpKfMdaNNGp0F7NhIrxYIdTb47GKPU1IvT10gLwl62TZRHo?=
 =?us-ascii?Q?qhlWqS0/mGc0F9303jN8HMxq/fEz3Sx4ah+chg+B1tMTh8la21J1RyQJ5h+i?=
 =?us-ascii?Q?5wedIAyn54TKWEud+QZ68Cy4LhIOL9Iwnu/zeK6ozKS5rvK1tebg8lniB41w?=
 =?us-ascii?Q?wvKdD65AxKF5fyL109hWUMAjTaFdgLolzQVlkDkTQdqfitF41ILX3r5xZGQl?=
 =?us-ascii?Q?1xYwBTNPiEzdIJ9no8B/fx5s0KwMMdNRGR1wGFP4OPK2AejJ/Jq9MNPuGt9K?=
 =?us-ascii?Q?ApU8hjUobm5+yAXObaKYIheLqxm9WU43RPR/99qy3zp35sHbC4ieDsvKDTan?=
 =?us-ascii?Q?W8H1s68WQ9LI11He3QeMtXBB+aNpBdigyjzL4u22nVy8Bktr4YfmxjT06Vsv?=
 =?us-ascii?Q?ypNguhtRw962HY5yOl8jUJd5rXZDpeLjQPAxLzEMvmkcQEVolxQTZFLsmPMk?=
 =?us-ascii?Q?4WBuiuTQ7xv5udA3ql+OeA3ZhxgJrNJyfJj20z/1PkMe4URxoDPl8YoZ4qlJ?=
 =?us-ascii?Q?GuYR4d+0gua1ZKS+s+DqJRyVCe5LwoymaGRDysRxaBJT/BcZMApLJoLXuo8a?=
 =?us-ascii?Q?YiBydETYbl+q66GkyLPeWXBUuXQCfcAbv065/cAnDRPDFtmis0HT8IVcokMY?=
 =?us-ascii?Q?vCpsgoFkdna4Q0Jia4frcw3xGAwX+enmVIkPK6pupj9dr4cezpIKtCGSiPAv?=
 =?us-ascii?Q?QF10HAzxPSJ0TNQlmXhPmFSd6cbjidYl0RuBiK4EuPTgSQGWQXY0jc0R3TPA?=
 =?us-ascii?Q?AyB8lQEzqe1NcqYck+6hzQ9wBqyaLe9ovBoP8nbXbXziiEzIFEkReZuVa7Y0?=
 =?us-ascii?Q?qu5pPZgwWS/DYzboyiijoznsF2aj8UiDRLogmOOnEZ7TyGTN1AoxKDCTqVAR?=
 =?us-ascii?Q?zpFYuDQ0kxtTvfJVfQmvCE0KHug60PrirSPa1yUllo77OCISDcpj+e5qfllH?=
 =?us-ascii?Q?sh+SjTF7pJtp0LF/nq3THjbkf9xZTP303MwLN39cwsX2CwougBIiJg/aSal8?=
 =?us-ascii?Q?b5Z0rxrI2LZHiRY7tuRM5Cw8FaMzcTutOgV4Z0NGgwMjKrTLR1r/d/9SC40e?=
 =?us-ascii?Q?VTj8Qj0mtnUYQyeAOxG6jUaO6et9Pfzx7eLWPP8jhOas+FbL8qrN2zaGc+Eo?=
 =?us-ascii?Q?y6aZHGyK4NTnCCkh//NLBF4R+bI2oiqULuq4QnsUFPAZNenDZHH5EEk4DTMC?=
 =?us-ascii?Q?EsdJqd/bYaw7CplX+8Mqn6QScR4Mk/gnOln8nKI0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b1610f-3e81-452b-f02b-08dd91ab8a35
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:20:10.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAu7Q92krLfkYBJY+yglmWLGw1QozObAlDrVIgMeZWUBL1yXNWOC9s6b7WqiRseX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335

On 12 May 2025, at 12:10, Lorenzo Stoakes wrote:

> Andrew - please drop this series, it's broken in mm-new.
>
> Zi - (as kernel bot reports actually!) I bisected a kernel splat to this
> commit, triggerred by the mm/transhuge-stress test (please make sure to run
> mm self tests before submitting series :)
>
> You can trigger it manually with:
>
> ./transhuge-stress -d 20
>
> (The same invocation run_vmtest.sh uses).
>
> Note that this was reported in [0] (thanks to Harry Yoo for pointing this
> out to me off-list! :)
>
> [0]: https://lore.kernel.org/linux-mm/87wmalyktd.fsf@linux.ibm.com/T/#u
>

The patch below fixed the issue and all mm tests passed. Will send v5 later
and hopefully I can get some feedback on this series before that.

From 81f4ff35a5e6abf4779597861f69e9c3cce16d41 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 12 May 2025 17:57:49 -0400
Subject: [PATCH] fixup: make set_pageblock_migratetype() set migratetype.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_alloc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b3476e0f59ad..4b9c2c3d1b89 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -454,9 +454,11 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
 		migratetype = MIGRATE_UNMOVABLE;

 #ifdef CONFIG_MEMORY_ISOLATION
-	VM_WARN(migratetype == MIGRATE_ISOLATE,
+	if (migratetype == MIGRATE_ISOLATE) {
+		VM_WARN(1,
 			"Use set_pageblock_isolate() for pageblock isolation");
-	return;
+		return;
+	}
 #endif
 	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
 				page_to_pfn(page), MIGRATETYPE_MASK);
-- 
2.47.2



Best Regards,
Yan, Zi
