Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111915278E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915773; cv=fail; b=GW2Lq/nokwsFt1dW14L+tQY78PPAVmEl0PbNUpk+8mkBUoN7SNyw/FCc69Dabg9zldzVMJt4IcUNsdSaBYkGxRhGXsxZXMIAXgafnC9ONGQJquLMnQhxmSiaEjAuFLPtKszy6/rw98hFn0asEL6RvlL6C63s4fQ/VFL31frcIlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915773; c=relaxed/simple;
	bh=sgSWNuYhuWo+C1/KFqhHqFPFwfOP3r73XUfa88nbAKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rY41AV3nWI8XZCt7D0sM5wLiGPsZmsxy99XKIPl45cQ4ZHmvvDzE6aFjtf8ePX0SaPGwvQ/WDOyECxNP15IZs6ABNX5Gpf7lcWTLrAUuVepI/1a2NWPcoQqpy2OpW35WB32NT2LtiGTIqs6Mb4wrB/9+i7NvNvUTBg9ckJdDiUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lX3C/oNg; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lX3C/oNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxzGSJJcq4cFkLISJu/OyK68Qq+K8dOd8U7cEMxZwPKdQgmW6UIhN6GDTN45uimsm3qNFCFsl+z0rhOvbsY6Ay5gvvsgixWtrwV4UHwn5OjJnY6N4BcLDjs5td0B1WkA3nguJ0w3WaT7ry1L+8KK8LilAvQ+/CVASFRaseKm7NJOiv67Qh9KwPLYGiJXZBLFjR0UWpW1hI7/tGLyz+hIcej9lNjoVR8wISdE3ADiznFkLIVVZi3Cynxd9SW+akAwMqmq0hSXyFup26pZlLFT5aAiFQT0oMBzT8caNi5QbkzZnKXlE+xP3lTd+AVqpppO997Lgs/Udyw/X3bKGHxJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b05IuyF2zKPa3pD34iQ7cEn2IE6VSr3HMZ6XIRdJCZg=;
 b=t/jB/H31oCueeoECCrweS11k9W1REy4f4xeUZCV5vCBo/YTdX6R/841FkULNx59stdjdUWZDy/ZPdMAi3QUqX6j+0orBk2JQ5N7YjqHxXE+7ztBosdO+T/jbjqpGfQTgh3xrvairAC4nP5Wqa7NX5i51M8u0t0XuwqpZCVC9FLKWahCgAHoCUWPy1SnLZ+zOm8zTDYb6Zho0xG9lw8J02qeQaLPIctGXVc7g0Sc+kt3iKQHQjKXn9yYRgBEC9mrfMtFcKWRombfwClbwjddu1gieiATb3JPRzr+TXDcKE0bdbCTrYqLcossiB4yXRzhOwq+ioUlCQf6LvrHpIQy48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b05IuyF2zKPa3pD34iQ7cEn2IE6VSr3HMZ6XIRdJCZg=;
 b=lX3C/oNgVDSlxUatrQvRgBGbyENyKl6nieoz94ruKQ4cYUdpWkRCOnD5tSfnyh78Nde7hB0aFC1wF7FSIjHQL+gPWqW6dIpruiknKg8ytF7apgwY5JdvSVQJFUmZVrw0+7pK5HmQUiXr8PjfKCGFxMZxPpGu1wEHceny+15IXCEwjJajsWz6RCv/eB2XQV9FwlFO0Nri/60IGls0V4ITfaLyINdg53XFAFHQMKG9Kvvrifo5R26iXGwe0dsXM5a4bPsu4QyxUsHtNURB4tIzoEXN8jW6g/SsFPv+nQd0ht++FOQxKJOo2eo0FZ9VR+OyO7zyrn+3ImaTEIJrCA5IEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 01:56:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 01:56:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Cc: Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v8 3/6] mm/page_alloc: add support for initializing
 pageblock as isolated.
Date: Mon, 02 Jun 2025 21:56:04 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <56683268-92C8-4FAE-9BAF-645C35227F24@nvidia.com>
In-Reply-To: <20250602235247.1219983-4-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
 <20250602235247.1219983-4-ziy@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:208:fc::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8adcdd-d743-48f6-18dd-08dda241cdd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wqlPdJYoe7hENOGAcXeHPqecXyj0oJ5d1NVdhyrJIeoPBZ7zOtJIEm8VcP+r?=
 =?us-ascii?Q?QwfAD+4TJFiaepqqBw4HTms1RDqjiKlQX5vu5dSi3FkYjeRMXt44pVk0uB2G?=
 =?us-ascii?Q?EJgY1iJyjffbyBF+zzLAy9YVfi5fRl1gqoh5p0sbn/gbw8K2iV8svC+uoa6P?=
 =?us-ascii?Q?UZlwkOJoTgQA66FngyTZEdgsDVJdxHHHGHBAwAxcinF9CASpohqDXC8au7gx?=
 =?us-ascii?Q?bexCxMHhvoAwvTZmLf2uS2b8fiMXFOsmOeLqn9hyYI7exDWt9r/ZHEyEJ+ho?=
 =?us-ascii?Q?WCkwFAkPLoOVigRkv2kQW9NkRrrggnPNnTjXOtGk4DbjWv9e4RT8sOZtq+FU?=
 =?us-ascii?Q?yKOnyTYkdduH7lLgWZ2Ry+HNQZV7zUnL/S2qdmV4v2OhEx8jah2ZPsV/eUOX?=
 =?us-ascii?Q?uJ5Izr1FBbXhcyDYXcSzWid9AxIuBV2vmfBPEW663OtbZk3OvfzM7Omsd5Xj?=
 =?us-ascii?Q?M2smpnVyfwh2ikEZvJzPJIfIHfE+Fsx8KtJKoXd+lmhlyqc4gTuAE7SfNVu+?=
 =?us-ascii?Q?Dzfo2isK2ukXqc1NJmNrIQYiw6wh2Q7uURtxgxUi3siKDpHam9hIC/l819hu?=
 =?us-ascii?Q?C4xEa1ICsPbpyC/Ac9iRBuQy9o1QxF2BQKRKX4gJXX95fnuKxoeYFVzDpoVR?=
 =?us-ascii?Q?uR2+sVRelaDC2Ry4540KYK2qkCpcQ+yJCEcakex5zFQLtfr+wvhCdJjL+BML?=
 =?us-ascii?Q?WrSWRocF18ivRZm49iQwFEZgqyItbr+NG15U4xWG/WUrbfoRewsRjjAKkPpd?=
 =?us-ascii?Q?/8GL8B4ssxKUMcxDErAHsdeTabsyJrJTqOZl0llGGhfdS5kvLQotnkUZublG?=
 =?us-ascii?Q?5UjdUQKbRgyikDqeZKnWZq0lxN4JW7buOS3ajO1gqLkHqpYjYueBVBWkOljU?=
 =?us-ascii?Q?iEhlHVurFBRxMk0qNTJBnnh/ck2PQNBM3PtNygT1xYjRSQes29caWzg91QpF?=
 =?us-ascii?Q?VkoRP3BIJyshLUmZzmhFbBLxqdIRuOtycqG0kaawaMhJx4laPFXp+JJKnaSI?=
 =?us-ascii?Q?voiOU7KHEfCr0jzDpoMVtKO8S0xAtpKqAyPhGvdtUDzT41Cz00T+GGnjyYof?=
 =?us-ascii?Q?eLC3yBprbjLJx6/epVvCsBgxLTBiAbml8qXLcTPWLkaHl8u85lZ9FEu9gXnn?=
 =?us-ascii?Q?WwcN4XaOrSDcvpXmlVg6I3/ErclBvbNSSpMfyo93uQlOYt/LlcxEMIpYa2wh?=
 =?us-ascii?Q?JjayLHzRj/ZNuUuMkGVulldmRziCeswhTbs1Lk1OYu7zhEEYOnFGyXV6rChu?=
 =?us-ascii?Q?55c5DrDEQtVXyA4OKWhATWyCQvWdJa6CdmNi9rdEi94C395ePsjxAKR2N1o+?=
 =?us-ascii?Q?rvOwgngjdodPahXZmsKq6Bzc1TF3in8TXu72Uyuou3kD5xZOILJMwaGFtpwe?=
 =?us-ascii?Q?v+zT26d8EetftGD6EGxA9OGiLkwHwQAysECZTmJwhbxBMauPpfSc5hvVOm9N?=
 =?us-ascii?Q?+wJ0xJ/kvNw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v8HV4c/qGS69qibPdfK7gfdoq1sbsemT0v3nu0fX+cH12v7XaKSxU0yMDORN?=
 =?us-ascii?Q?QYii6zhgPifMGGzG2PShCi+/2u411GOk7NKj9E9FjF4y5SwHyenvU6Zdy07A?=
 =?us-ascii?Q?6Y2dh69ZH7x6L32Ga4T+lSgrkXatOJdTMJn1oHDTLeF7DeUpnjP184b1Ez4C?=
 =?us-ascii?Q?81ERHitSek9pyQAEXKnPxEVGovHpM/9CeaOpgCnAKT0X4LUrv5w0Ur9WiZhx?=
 =?us-ascii?Q?2gEVpiwhHdkwEr5LfpUG/OpH/dkdrDZdb+9NJbe1t7IRzyxBTlDsqEkW0R7N?=
 =?us-ascii?Q?77Ngyvh9oldM6aoAOOGHBBq6XOVjgxCC8ZTzmW1QcRYWcij/+3/nXgXROg9U?=
 =?us-ascii?Q?lI6uHUF04jty5Ed+4a40ReQ1YMAS4Hnb6Rop26nK/xXnXHu9ERLcb6bxNY+A?=
 =?us-ascii?Q?zEhZbYDpumljBZU1u5iKsErFJsM3J5ike0mYIEtT2Xwubq4UjgLhaotCO/Fk?=
 =?us-ascii?Q?uUnxZDlRfU5ykKeoRmczKKhiyF5A9yy6MwEhMVHuIZLTpkL1CEpbw705nAGz?=
 =?us-ascii?Q?FTfG5e6+Q4FGVLKYisBgY/Lrsqk9ZyIDP5m/l7GX/ckc8+QPd9lgEAuxHmMC?=
 =?us-ascii?Q?reWndWrcIY4wu18F7WieNq5l3sXa5LrqSoL3fS7XbE1TfjJLc5eP79uuyuTH?=
 =?us-ascii?Q?frD74jgyJqh+GiTmIfKAoMLPViP/5UbYrZhSYAmr5CJdM10gLFeL/FdOQg6K?=
 =?us-ascii?Q?SBnmKSe35UfFpuq7ZjjbaF7cTMVpPnt7Uqdx/Hl/w4QzBJcAhrNrtzMpcXAi?=
 =?us-ascii?Q?m3TVZQoqKtUpBC0nUHB6c4wFqEVclwwy7ZLLSuqE4dYdJsE8iBlGMFcPpbb3?=
 =?us-ascii?Q?tPb0+rvb3Ir9kGocXLNB7otdLAiJfpYUhefaC9ahqs2yudMBbumDWkX8qx8V?=
 =?us-ascii?Q?34Rx8asUN18grW2uAwq+QJJgZGZPcqZmarP2QZzuTH657oOK8KwuHaGgqCE2?=
 =?us-ascii?Q?CIKS5GtVv9NbORBuQ8I+b62u/9bmqVl4JhkM2VitvbKmUng39tG3vAvy9PKM?=
 =?us-ascii?Q?PDlYjpccaHqy6U7JOI5qSOMPT33SMYTiU3t96Mlll4lLTL/o2msKdpo0EClz?=
 =?us-ascii?Q?4LxW/FIjGcf8JobRZLD2PDe/SdQ2LCzHs4V8RdRIujBxdQowYnIpzrONcCtd?=
 =?us-ascii?Q?oNFW6r5EMkovyaPY0iLeRj1tQrSTtWKpB2Xu5gNO5cMq6BS8n+XHnM0nco05?=
 =?us-ascii?Q?1Rls1JKyxJHDUFC8A6MIZSoTJWEV26d/5oBd2kDhA9KNk/99/or81qmzSL0a?=
 =?us-ascii?Q?vwM4KvxVVRrqm5cm2BT1ib2/WVUpsMoEIOEYuWWJsupM3umkIV3/3DxW8ywt?=
 =?us-ascii?Q?FXMSxFiUXaWdQ3iro2++rrYawWSwG5A0zeLgdVozUA5lmi+rBAcGcPlSt4Zt?=
 =?us-ascii?Q?fR9mONm7nXddkUL6pnEXqtM2pD3RDs2rmKIs8HsixkIrFKD9YR1Vwa5/61DS?=
 =?us-ascii?Q?QLzR7xBXL0g5CNDcG+Xll63IMvJRZ9J3sE77GorMFts5Uc5knumNqAq+aDcu?=
 =?us-ascii?Q?RAfQUy8CNb5aO8yD4oCJauPPmgDkmEELsp7Rqip+UgNEyLiHjRKw1rQpivX/?=
 =?us-ascii?Q?CO6tO0DM1twS+H/eWXgOnsaSdtdfRoKqQ0zZy0Yg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8adcdd-d743-48f6-18dd-08dda241cdd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 01:56:06.7399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekXtST7kOzflmDUVQTB11f6G10hMzT+pTcqqKq367HRnCsp9xHlIqTUVR0YuZeNY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072

On 2 Jun 2025, at 19:52, Zi Yan wrote:

> MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
> to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
> initialize a pageblock with a migratetype and isolated.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h |  3 ++-
>  include/linux/page-isolation.h |  3 +++
>  mm/hugetlb.c                   |  4 ++--
>  mm/internal.h                  |  3 ++-
>  mm/memory_hotplug.c            | 12 ++++++++----
>  mm/memremap.c                  |  2 +-
>  mm/mm_init.c                   | 24 +++++++++++++++---------
>  mm/page_alloc.c                | 24 ++++++++++++++++++++++++
>  8 files changed, 57 insertions(+), 18 deletions(-)



From 0e48cfc8fc9e10c1d2fe9bc080af737b4f852347 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 2 Jun 2025 21:51:25 -0400
Subject: [PATCH] fixup: make init_pageblock_migratetype() set right
 migratetype.

when page_group_by_mobility_disabled is 1.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_alloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0867e2b2e187..ff098523a501 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -552,12 +552,14 @@ void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate)
 {
-	unsigned long flags = migratetype;
+	unsigned long flags;

 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;

+	flags = migratetype;
+
 #ifdef CONFIG_MEMORY_ISOLATION
 	if (migratetype == MIGRATE_ISOLATE) {
 		VM_WARN_ONCE(
-- 
2.47.2




Best Regards,
Yan, Zi
