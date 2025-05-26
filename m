Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1C249EB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748223245; cv=fail; b=ud8hwWyR+0sQmQbFiEQyedZHH5xL07GLHiHsiycQVz+//0HvQOmdGSCT3USqY+SyTGbOy38TbH3N30LjnScBfhOF3Hu0evcqZvVVnx4QbmKeJcIxWpELWCdVRLAs1+R7W8I31wDQTi3KQSkmsM+4UnEHOtWz5QcFvSzA/EmVUzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748223245; c=relaxed/simple;
	bh=KOIi2DEhVRHjMspRthxrMHCDBU7uA8sYktjfWfDXt7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyD7GkGsqdiNbJFizn9fV3dWT81OMnfxwOrpfcIwazx1D5FKQxrUGtG+osHosEhG/gxsqjNNuT9DbP+kBzfaFQg+Fr+561bl0otqR+2yghcDWHSCSVJCmIuG+2FHyMmfAR8yH/SUBEYT4H0L3Uw2f/NrbYs624mz9r73wc3kDaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bYwp58P3; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYwp58P3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYUWg+tHh+FDAZ0aCKNElaPxaozk8Z2+x9mZJevrD32yYUAb3XR2og5V9L8WtrTmkuHROEhAd9XSvvOxKx2DVv415DcklCiySyd0ZnzsBGSlT9o97fj2gy9/TyX4LDxyhQ0GS7VBC58LXEhYUEkUiX9tdUEftbyLxz76d1O3R6JUDLU/Zhzg8Hy+6SolFrh0+uIfOhOnEhhMstbWDbrmx1VqE9ZZDQDHy2uOqUN7FqSjgYAEH0x6rbLla3azNbo4RWaDN2busn9v6ov5hyHBAb+9zzHqaGKfUyR0V8suqUK1eOCOgBMbM9CX2ji5twIeaQpAPt6B0wUTSpe6+b9tRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGXjnj0lpxRu3x1EN3gVapykuV/QgW47NraBJhCjIhk=;
 b=Qc0GfJytNL84t/OuhhxiHBgbKyQeYT7XK+ON4gxePqHcrYwsDCnTr+yCHkFY4nrERu3yjzjQcNx98L+aZmmA+oKpAdHL2qe2tcwCxNjGw8Fv4uMkTBch+FhL1wUVxMRO+4YnWaQpthGNdMA2DJz5PKd0ZrUaCx6gXwre53UuwTNv50KFTuyxklaRxaiDUyW7CzflT6c4VgcWxCHsTW9XupjCduDjoyRO+kpyu/BReyjk9Zo+oje4JKM75lVU3tl0jopOkISngPTggOdhVqvmvLbuwqKLmLjk2WW+ntBJhjxsrswfxtQlhskFV26HRDADKVFjiviPf05xcGVOjOGz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGXjnj0lpxRu3x1EN3gVapykuV/QgW47NraBJhCjIhk=;
 b=bYwp58P363LvJWMRUa8UxcAdCXnVXQG8XDXGcBYd/q0Nqe7O8RKk/17TXsENARorFregdFlm1fOnm+5H1NoWQX7r5aoN2SqpN11G46dSTJAU6ckO72gQIBuVKgz4RZ9uj67QpTjbpRpZ9jjCsfvgHpPa/ILiQJuw9cpHX92mMiRySLh1vcwO3e3aYoGZH+NBevpqnXu7njApwrMfcnJY693UGnvpq5LfOcFMv6K893c7czQ2gv+XQIfsRo4M3AX2B0HK1fmM1yTvbPHnRA5ikC3Fs1keeyKsYFsFHdzv9trwTQZzpm6j8qL2QexVDUqpMOQQMW5UpfVuOprnmLlQEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 26 May 2025 01:34:01 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 01:34:01 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 <linux-kernel@vger.kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Sun, 25 May 2025 21:33:59 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <B94EE1C1-ED99-4A11-AC6D-9342C89AB450@nvidia.com>
In-Reply-To: <20250523191258.339826-7-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-7-ziy@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:52f::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 00febeb6-162e-40a3-13e0-08dd9bf56472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DiPWTob2D/73aw1VpgghuASHyMI1o9OIzlMSHPneV/gSpc9m/1o6rtkNmEDM?=
 =?us-ascii?Q?nYV9hsjpZC3UdUU4CjmgyH0u7MAI4+Cda3T+yY1ojNzwO6Ci3tWwzDvssXrM?=
 =?us-ascii?Q?REP0sHPnab2bMByBBpSjIUoVVXDqEKCVffykq6PMagoIiMbFVZHnwKNYfJqH?=
 =?us-ascii?Q?bwZOULpRIhBnHQC/j65z4VHWvAbp2iOcQQ4K99DKGLbRsVL1dBNopKU43sbU?=
 =?us-ascii?Q?0IifvCYTPZ1Gd0nypGpd+IRuPwIl40YERrYeoGN6KW+DnbMgC7S8sNkTRjvU?=
 =?us-ascii?Q?0D1afwkDLmpc6SFg4A+6iIBbIV+9I82jPryiUcfQyXiBxmG25ht36yfsKdkM?=
 =?us-ascii?Q?XOsfajPUcAhIZnRs57jU66nhcSuq7nnGre9EOb96U6c1Dskvs/26Tn0nI4UQ?=
 =?us-ascii?Q?UOsN6HITy79VCTKWxUjZwP/3A77UojA9g4UWOxNvuUFglsG60qu82Yge5MVG?=
 =?us-ascii?Q?PQJzU5UZK9jj+2lBRuFhOpNZYTQEsbthzCKmhrlADd00P5GynZ1xaxjhkjk+?=
 =?us-ascii?Q?cNVQBa9I/gFbWm1GQajFCDAocubzslw7QMTbIKh1ybQVDjfip6/luw86MrN7?=
 =?us-ascii?Q?MNhcKyxgvTuX/R308NaXslGKp3DVDybD90VMnsBa6XAmLE7fWjI+c0Hbjlxq?=
 =?us-ascii?Q?eeI6yB8fstzU8WvAczx11wLfXbdTaZ42VakrGjjSr6A7N9pguygOatOsO/BO?=
 =?us-ascii?Q?ivFE+EZKL4iufY+eMEQ0r42jzcXcTS2+OI6sZpTbJmT1uHaOMGCRedfAJ8Yd?=
 =?us-ascii?Q?QaD/Sr+9VUNYtZqOHWzGoSTEBQ8dwemGRDk7W4HH1UAKB25sDHc5LaERwzNc?=
 =?us-ascii?Q?SHtByRAnoi2f6g5QnArhf86K3H8SkZhfxKLBTNkMC0OI6nZ2X3yvCQ+fDt4n?=
 =?us-ascii?Q?fdBdwRshSsO4P3/Tch+Ygi0lFsV4vzwgbE/aomTsqIBWHw0sR3df6QD4ZdsY?=
 =?us-ascii?Q?GeOaMgYfwBZsjBoBR8l/RYQc10YjzcgFItFw4VAQM/p2mIRgHNmYhEh2MQrU?=
 =?us-ascii?Q?VHqB7v1GGcfNzaMr6oXRNBu1NwnbGb8Yonj18nGf4sEnhbjK3lqVnqDOOwl5?=
 =?us-ascii?Q?JKAarxhF/6YXZgPGJq1HG61FR3CERtHLOIKqRsz9Eegugs3AgJvNGfBAbQMW?=
 =?us-ascii?Q?3d0M0KqjM4J0yG9iXHftZLFkLU+ciWsQHVla4GJhkLT4PKREFFmQsHwz3zru?=
 =?us-ascii?Q?lYrM6EfDun6GwfeeYrhEODdAu0LGf1bLze3B3Dmraz5EdfTSoDCgPwJmrlQI?=
 =?us-ascii?Q?9qqmiP/TpiTdMToJPGyL1yr+VOsyiEB2sVXZKNR1qePuMXVEtpKEC2ox5PUU?=
 =?us-ascii?Q?AA00ZlySWRyiryq5BOcm1VAgF3eK5MH+mFOl2Hz6pjt8voGvyzq3jNF1VJ7N?=
 =?us-ascii?Q?H+sRKbv4y8/mSKwUo2YQopMe00wWqrdEFYBTpFGklz77Csz2amhgfZDRimsQ?=
 =?us-ascii?Q?wijKj61Y524=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NRhWelvhs7wXExQ78WIwMPH2N8UVETOmPa56VxEeV+/OgZoYREDkplDEYHVZ?=
 =?us-ascii?Q?D83+bsNxUtHxvE6QgOMSHxhgWrR16G3qew0Cc63Zk91XHoSEzAs6gaQ8V4Dz?=
 =?us-ascii?Q?+QLWp9Gcix2RMVhRn6H3WLo07Uxj+6fM1qEgpKR4CFeN/mkycJUJmV2TIk+3?=
 =?us-ascii?Q?voQiApeDdaEAh2yFdOQ4bZD/8u8wip0UqsmmU6990uF2U2pnVn6sx6FYeygO?=
 =?us-ascii?Q?M5+uNb4FM4QmdWHvIcS3rmJZo7gUbziCFX7Aj8ucEC8shkO1wMWqKJxj06Dx?=
 =?us-ascii?Q?j/htseofvymPGro2Mh14/R+DaC5G5c/dmuI9x32k0c0Rw32SBNoCDsDEXxTZ?=
 =?us-ascii?Q?pWD4sjQwWH8OVBPmmxAGSwLY3PgJNUpu6LfHGt6KxNCFSTPYz2F1jgODi+v9?=
 =?us-ascii?Q?G1dQNMZWs/PABhSqDx/Vn191SQk3pCg6G2/uhj5/HjByV0qCUENh8ql/kXKG?=
 =?us-ascii?Q?Effwkp+1ygRk+2MvHVVGiNQqSWPe+f+HZM/vrI9zaM4HCYNC+N+rxBnLli/j?=
 =?us-ascii?Q?vRQgino7d3TvLAzQ8bIAa8AZAwnCzT68evwoXh+dxQs2XfsYzen//LGMw3OJ?=
 =?us-ascii?Q?ezIwquXcUCtV7nlXnDSmdHqxcUo+GrA44IVdgFHM7o/pG0n1aGTj+gOpU5wQ?=
 =?us-ascii?Q?iyAd3Us49Z0lIj42yk4lCwnuLkVJ/ZG3TKPHQxpukDbfaeXnfL8kIg28SLCK?=
 =?us-ascii?Q?lVXrOP+xYdj3XAkuRuokhwSuITONbGuIh+7qyAQ7nQy37sIRgvWTM3OytVIZ?=
 =?us-ascii?Q?UEZSzDB5ddtKNh+yuBC3kxQ50XZG3CrfRTWEB8tppcQUIqZVhACodtwYTEHC?=
 =?us-ascii?Q?YJTOd4VaJJ7dgeNwJPOnS7ToCae2k5l4EhAT/Jj0WuF4mraRIqk3pLypuTwG?=
 =?us-ascii?Q?XHSJdotv8SmuHAErGztRkyv/2GqjEdrbUDbVUplLFa4st/78ggQxXtJBZP5G?=
 =?us-ascii?Q?DExPNyYGUkDxAKQIvgjb5vjJlGBjCP0z/5Z8ftQ8bLc9clLMHq7pAH1b0sEm?=
 =?us-ascii?Q?yoIaLCf7C1bJCswNojD8EMdsU4xxMbSyNYZGwvhN2xi+5M2OGNpenIM67oiz?=
 =?us-ascii?Q?xsLOA3DDcaaPhDb9y4axBXdcqGvT3uYQRbdYLCtNS8uftuTKZYYiWPMZOq2E?=
 =?us-ascii?Q?RLcImsVKkpKWX4kq3Vavkx+/4FlSEtKkXYLmyYr9M5RxwqfMtOXuLPJXC8nb?=
 =?us-ascii?Q?EosZm/gQQIq7O7Xbz8D6hsdOLadyof3htWG2AUbn79gs3kPScl7Wn3evvklH?=
 =?us-ascii?Q?F8Y8RqGinlq7OC1HtMpieSMAY62krKP+RYoxhFwMa3uA3JNQAsupeQ2l/1Vj?=
 =?us-ascii?Q?NJ02x6vDJfHie4nmfY6kKYiCVdv4fImvYwH5Ofr+7tVi/ILa1hfeyiooLYPx?=
 =?us-ascii?Q?7y3t6JndJS2ZApWMhE3T1FTCkj1UWjb+ru92TOLUSpxW6XVDGRyop7mpApCL?=
 =?us-ascii?Q?uqagneLPFcRhsPvfU8kWTJPu3eXAhsbcQuX1lnprfVrCw43GQYbqtHnup1aO?=
 =?us-ascii?Q?sKxQf4Un8jrrxnJAACzqbO+gnsYFddCpSd5nIrZeVE6FxDRoeaHtxeLXNYqm?=
 =?us-ascii?Q?4b3F94igaTXVXHH1Og8hnOcyqR5vep3y4uSKYTKz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00febeb6-162e-40a3-13e0-08dd9bf56472
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 01:34:01.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOygUIhEEXth20T0nVhSfbx/RhdOzB/BTDDrxFO9dZFUL5mxN+SkStPAgjdjjcXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442

On 23 May 2025, at 15:12, Zi Yan wrote:

> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
>
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to provide the information. At the=

> same time change isolation flags to enum pb_isolate_mode (MEMORY_OFFLIN=
E,
> CMA_ALLOCATION, and ISOLATE_MODE_OTHERS). Remove REPORT_FAILURE and che=
ck
> MEMORY_OFFLINE instead, since only MEMORY_OFFLINE reports isolation
> failures.
>
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So doe=
s
> __alloc_contig_migrate_range().
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  drivers/virtio/virtio_mem.c    |  3 +-
>  include/linux/gfp.h            |  6 ++-
>  include/linux/page-isolation.h | 19 ++++++++--
>  include/trace/events/kmem.h    | 14 ++++---
>  mm/cma.c                       |  2 +-
>  mm/memory_hotplug.c            |  4 +-
>  mm/page_alloc.c                | 25 ++++++-------
>  mm/page_isolation.c            | 67 +++++++++++++++-------------------=

>  8 files changed, 72 insertions(+), 68 deletions(-)

This fixes mode's wrong type.

=46rom 0c9792cd7ad1d1cd16b276b70d972e5b871ff653 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 25 May 2025 21:29:06 -0400
Subject: [PATCH] fix mode's type.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 48f458f7143a..3096304d1b58 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6901,8 +6901,8 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 	bool is_range_aligned;
-	isolate_mode_t mode =3D (alloc_flags & ACR_CMA) ? CMA_ALLOCATION :
-							ISOLATE_MODE_OTHERS;
+	enum pb_isolate_mode mode =3D
+		(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : ISOLATE_MODE_OTHERS;

 	gfp_mask =3D current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
-- =

2.47.2



--
Best Regards,
Yan, Zi
