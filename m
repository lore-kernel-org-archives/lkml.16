Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F221B9F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 01:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755812; cv=fail; b=ETgiKNS60X6uH9PF5Fi5vCNrh9pnFYkkfAPVQ+BO/+3lAEPtOpHO7wG87Y5b+A98FblViyKfDzTxFk1XmzysxvjnI7zToYSRbv6gNUvnSs1oS5seXSfwA6Xu2b3i6XQLwAO/hi48O84cJqEI/A0hXpZQPx2yjGpE0Hp4/ovH7Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755812; c=relaxed/simple;
	bh=33hE7qHnhc+9gJ1WXxDZa4tojMI/WyEbM87MAseay54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nh4v8SAVI6DUPX4fc4icqCVAbP9Kcy8APAITqcdnIp2X1ntSU6IaxQK7iBMlfeSJ6AEzMKLjlQi3RzaYBuI9FHCLC5hYJyG/C5xE+cZkW4IOL88zPUVEpOD+s5tXH+5DU8ERg47l5rD3Zfv55Db3+2lm2tn2kEhEXr34nr9B7Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+E5yq10; arc=fail smtp.client-ip=40.107.102.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+E5yq10"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+SYQXps0x1rEhSnyWK+loSxh5LFCOhEnHdCb7RDtizurzJ/0jUCA8WDN9QK/SgcOlEbzHy3saM2TCRw/5pB3qZD4MS5tU8iv7411jibTswDj0EI5+rqVL/WEeVgEpqbBWwLx90bxZHQF46UO+BlfR2sdgKYepOmbagyY4T2B+ZjdgC2j3HDpUH2vnbh/DXcLwTvZVMZ2NVTjBBfBON+RDXgMOIneFZQNRN+2Cp1kroUuwOj/dWmMsNM/H2k013j8fqXT1UH09O9g0Cl106mMJ3MtokwzuoDWhgn4DWWvLiowO0sHi/PNeVB4SPgAM5NF7lH6DxxlPZkj8vk2j28qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1lrfQ8nlOAx0nimIh5IlrZgOxaRTdvmCT8cDCtdCsc=;
 b=W85x84h6wXtgRQm9xOgUzjAMXkyaBqGnLXvsQp7b4RIRW21sQrBn/bOVa9rRZB06Mad4P8w1WTpHzDZQ6tSWDtlFF2Bokn4JUXWNO98XYFb5MUqGLWLfH4PDRok5yXak7eLsgNK9x5mAd/4fUhjpzzlR6Z6fhyGIDvbS7n8ZYgKajAhxeIgwI15w2GczM2ema1wGFR7GdnJODNZ9pVJey9QexZz/ta49dyaR0YcRrDAXBZyqdh9iN7kG/1Y8fpArnZnVbVHwXetB7LaxjAO7X5y8Q7VBWhEUocVwBT0WrFVqk6pO/fWMnXQvXF7vsTUDvHOplpWXlYqzpwgvjpMdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1lrfQ8nlOAx0nimIh5IlrZgOxaRTdvmCT8cDCtdCsc=;
 b=N+E5yq107wt2XvzLSSDw+yDp35PnmELaoPgkyXHKHk+E2sC54Fm1pEe0+rmsaqZwpdZLOAIbrTeEDOtjLAyoR50UesV8zAizLlkZFJjR1Y/nYJ5fmh7YhxwF8CWb0+nz2VVEq8zvJiL6OBWd44YSzDA0wtYl0CT84siioaHVthiWMs6rbptCM1pdJvSs9533w5QWkCZrRBjOApiZZuJ1cWosAW31X7IY46LUpncJf73QDpALCqdLogDfJRqFsvbvFn79HDWi7g70ULNlqOs/R6MaUCiMQOwNpQCUaaWGJi1JDrAM1S2EgRYDGhMsqW5icKojcZHAszhB31LrY/AFNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 01:56:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 01:56:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, <linux-mm@kvack.org>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 <linux-kernel@vger.kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Thu, 08 May 2025 21:56:40 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <970A26A3-6E75-4474-997B-67B9547E15AC@nvidia.com>
In-Reply-To: <C4D87FA7-4B3D-440F-9E5F-B57561AB4FE8@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-5-ziy@nvidia.com>
 <C4D87FA7-4B3D-440F-9E5F-B57561AB4FE8@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:208:23b::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b2ef4e-9691-4e2c-4fd7-08dd8e9cbea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vtbwf+t6fiRa57awHp6cd8PHOppWeoPOD2e0MS7EmIYwBhL1dHHGHYofmS9T?=
 =?us-ascii?Q?9bjaZsIruBbJoJZn2VZbdXCeNwoRc6AfhlxBugNhdIFNJP6lb9Zw5w+XaZuE?=
 =?us-ascii?Q?NVa1Tdud9IPph/Qow27GXEXyorCRwiUgbTsTrAVcWYa9r6u1JLXAudoypvQc?=
 =?us-ascii?Q?kp04+UXL0bOKxiJn16AQwYkj9V6S19PG5OHAdpyD37X7JhG8mIZsC50d+i7N?=
 =?us-ascii?Q?PHZOniWh1nTmyHcB9IRLy/n5YMsIpkwMoCUweGEAD+uPH/647gCiUqpdxsN4?=
 =?us-ascii?Q?xi5frk9nB+sUoUoKHZWzbMcx8Hdw5YvYTKU6T3WJALBKbiBNO7xHy0qPN1dp?=
 =?us-ascii?Q?PGQFz86hbaXCWVJEjUsBQa3NfdkzdEKCayunAOpxze6xuw98w78Kr1W4Pzof?=
 =?us-ascii?Q?So5yH4EkYhYV2MAXptt4KRx+P1OEZrBCZNwAAmIa/dJctAM6Hl+a1WuDFZ/D?=
 =?us-ascii?Q?sTuzpiH9BzvY58l4ke7bBiFuuu22uWRIjdYzNM1PkxQYaR7KcKryjGgE8Cia?=
 =?us-ascii?Q?92I9fchpkcTDmI9APNEEUmKG04FRPLAFmzDE6zH5rVduVo2gj+9pEPAHbhyY?=
 =?us-ascii?Q?KOJiEOqY9TbMajDoo7EOepybLYZUagwRdt7rjG9XUwuNiie4IVAnCPndryMD?=
 =?us-ascii?Q?QrfYhPx3bocOwYJXhoPwcJDSxhMbJjoZBPHTqqBFujga7ORnBeHgk9Nyl4f/?=
 =?us-ascii?Q?ErD5h20XBuRIKA/wGphKvvZiaDyt7FE/6LyHMOxTKS66ItaCbAZ9axn1n1C0?=
 =?us-ascii?Q?ixPBdQvXI8HJe62NS8Vo/FeVXYIP59ATeMdu+1GvNBM8XXb6mfWqT+jRxO7A?=
 =?us-ascii?Q?4oY+O87bG5fHYOOey1CgMrwC2MdAVW4cSCQ31idjDvuwUC1ydBLvIS1yw/Bd?=
 =?us-ascii?Q?eSkhsLld9i1uHSvqNVShABebjS7gfeHg3mG9yPX1A9ifKwuJp9/vAVuLZD90?=
 =?us-ascii?Q?//SPiFjMYonUftPf/p1S06mY07+xatvA4Mf21AZAG57wiVKvAF94m9K16H81?=
 =?us-ascii?Q?eohXeJiszZhPyykM+4/juWkZ9KiJV1cHkKYrIi6SpmBqzWkKvyH+VCGwRSaI?=
 =?us-ascii?Q?nKJ8rkJ151smrvnlYz7ACy61oWZMPDrzOA/c/NL88JpULD7Ekh2b0C+ecQ6U?=
 =?us-ascii?Q?mWqFJVkmzH5y3EaVAvSMYQRsr0jTE1L5+xeBiRKPZcz02iUstJuJYl4yvAsL?=
 =?us-ascii?Q?9uhqazKpxQHh2TWqgMgpHY6dDC/Aa2eeyIGXNHqro56xpOQOMnFEKbbVpiSW?=
 =?us-ascii?Q?IjJCH/JPAdFfwI2M/uCww0D+JTyLkX+iBogcabSTKClJ8LBp4xSbuNQA9wKd?=
 =?us-ascii?Q?xs8fVVmNXgeEi09P1UlPdbbRsHfKRXR91BdU5zxMasHdMeJPQR52teD9q1Uq?=
 =?us-ascii?Q?mtZ4H1fCAC7ASG147HbiNYVx6EtD/h2RTHdqXMR1hzgXvkT4waw81KPMXNS6?=
 =?us-ascii?Q?IijbknVsP/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O6W3jQcawly0R7V/Q+NWwk34xyKhAm+KMu4HnFFPOjRivRzGK17vctBZgdUa?=
 =?us-ascii?Q?mlJ0VXezFhHNSneyhVjWE0UR0/mg2fVpAhD+u1JDZXfC7cg40AeIpJkvJFCo?=
 =?us-ascii?Q?OxDQ8F6fMJJK7DRIql57fSFGnf3DwZpY/61BDJceQOFo1mtbzpMo4T8LGbwB?=
 =?us-ascii?Q?oBr8ktITFYAbp0bqfNX25qJQjJwvLHGWnaOMrmMqsRaoaoq3uFK7Y+zUqVEW?=
 =?us-ascii?Q?h97IMu6IBWtJhaIZdg5lpDuFg74CQ23flq+IHdBDC9tjToArt73mkzb+IEwn?=
 =?us-ascii?Q?/h1uEezSCcbDY4/gjz9twRnNiCK76z/tqR3zT8buuHQl9NZyvIhzgnMaIyXh?=
 =?us-ascii?Q?KCvbqSz4bIdEhRpca+2+mLHq1sjByGYekiYFJEiHTfv2Zv+6b5CuTZQjBvas?=
 =?us-ascii?Q?OWTqjNnWKMU1ulQ4LGtF8Kt7sI4FUvTsbXv0a5Ce8dO27oJZmcA/GEW0RvGf?=
 =?us-ascii?Q?aX9a4qODwZrYF01mIZDDnTNFlTjxqWlwqZgGISWD9Mpk2ICOjGBcwHAmh38q?=
 =?us-ascii?Q?qeCEjXtw15PaKHZTeD33cdTCxQ+jc6j27fzpdAVMQWpEvtUbrRzyYGy3p1NK?=
 =?us-ascii?Q?TNEA7XBwgGiAQVdEeAlC479fzXaap9TPJqrUcS6hXx7M7PUIwGdl4moqk/TS?=
 =?us-ascii?Q?HqnNh0avMq+w2ER9QOU1YxNRUL/65AP3enxAQHJ4lVClYwxRpdavJ6jIwjRa?=
 =?us-ascii?Q?CNApSvHKvzR8tqUkvA9/ShuZKTJq3vwtT5PkHS8yIk5mAnF2taK4HdcX13GH?=
 =?us-ascii?Q?YeVNZM6Ep/C6dkwdM/wfEvWZcT+9mPs006Ocu+hEr3i2Y5paz4AGmW3D6FkH?=
 =?us-ascii?Q?arxyb0NhngfHXUStBgEf49nYe9e3bNKjSmlodO9RwLxVZLhNyTWB7/hLUbLX?=
 =?us-ascii?Q?La+jsoNZI+5Kz22HNmoro0DZWQvb8ybf+omd0NmrMhrOMQr91lirgU0mSznF?=
 =?us-ascii?Q?GBvibfJyddfG91e7EZpB0ZWenNdoqn9AHdMgHrpueqxUwjyNRum5x5s+XRC+?=
 =?us-ascii?Q?BPFPDU/yDJl+9o0avLWAfjjqeA+V1X1jTdekx+lqEswwDHEO2Kyb3VJIQ5Ov?=
 =?us-ascii?Q?JrzUzYpJ7YBI8roldN6qOX4X+t3pW1YavryIYARB3BIgF8nnUchbrfNdJvgG?=
 =?us-ascii?Q?SOIvF95U7Ey9IW3SoIMF1Hbs3ramQhRdV7edW3gJ1O7+i/+iSWycw/tcifIF?=
 =?us-ascii?Q?Ui+f/DIDk6YUb0vQWqKx/Li2ghYU/UApuHiN/p62JWMcv1GIaEXpbxscHW4x?=
 =?us-ascii?Q?QjK85YOP+Kew2g2GZG4oaQVZW1x0VI1THNMfXpzPCFXCYT1/Su8KXNcu7A2G?=
 =?us-ascii?Q?EmuFnuJl2s+gEbMV2Ap24wknXNkPZqMAXqL21Ik95jxaXjh5+IZHAjcP93di?=
 =?us-ascii?Q?OIT4HPaezSOEhxJEFXd43szHGW2eiJqmb1v5NU0uAvofMetQiZDD8ZM1YWRl?=
 =?us-ascii?Q?5dIREcPIZrwKBIciJXeEEIW7TN9+VqrolHQEg13pW+dAw8fMCAXZ3XqgDJ7X?=
 =?us-ascii?Q?mq2aU5rcdJgJozui2297uhUACvKBqZbTp/UZ1oEKAFgQ9Xri+zVip/WhbF40?=
 =?us-ascii?Q?fgxIX7AB3JRUDnCOcKSd3jDN8OxUGOAM61HmGv5E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b2ef4e-9691-4e2c-4fd7-08dd8e9cbea3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 01:56:42.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/D5s3F3Pxg3zLWzN9b78rlZ8nc/ADQvgLCNp4qo45os+tBCMDaQwIx/1z1A7IyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

On 8 May 2025, at 16:25, Zi Yan wrote:

> On 7 May 2025, at 17:10, Zi Yan wrote:
>
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA=

>> allocation, so adding CMA_ALLOCATION to isolation flags to provide the=

>> information.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> a newly defined acr_flags_t to tell if an allocation is for CMA. So do=
es
>> __alloc_contig_migrate_range().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  drivers/virtio/virtio_mem.c    |  3 +--
>>  include/linux/gfp.h            |  6 +++++-
>>  include/linux/page-isolation.h | 15 +++++++++++---
>>  include/trace/events/kmem.h    | 14 +++++++------
>>  mm/cma.c                       |  2 +-
>>  mm/memory_hotplug.c            |  1 -
>>  mm/page_alloc.c                | 22 ++++++++++-----------
>>  mm/page_isolation.c            | 36 ++++++++++++---------------------=
-
>>  8 files changed, 50 insertions(+), 49 deletions(-)
>
> Here is the fixup 3/3 to address the type issue reported by kernel test=
 robot.
>
> From 3c439f1f09b03c8362b43c0ac05e5f174f1a6655 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Thu, 8 May 2025 15:42:18 -0400
> Subject: [PATCH] fixup for mm/page_isolation: remove migratetype parame=
ter
>  from more functions.
>
> 1. fixed test_pages_isolated() and __test_page_isolated_in_pageblock()
>    signature by using the new isol_flags_t type.
> 2. fixed test_pages_isolated() doc: flags -> isol_flags
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/page-isolation.h | 2 +-
>  mm/page_isolation.c            | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

This is the second round of fixup 1/1 to address Johannes' comment on Pat=
ch 4.

=46rom 760c00e808c74d62e8d879f281f38d6608c89296 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 8 May 2025 20:54:40 -0400
Subject: [PATCH] fixup for fixup for mm/page_isolation: remove migratetyp=
e
 parameter from more functions.

1. change MEMORY_OFFLINE and CMA_ALLOCATION to isolate_mode_t enums.
2. rename isol_flags_t to isolate_flags_t.
2. REPORT_FAILURE becomes the only isolate_flags_t.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-isolation.h | 26 +++++++++++++++++---------
 mm/memory_hotplug.c            |  2 +-
 mm/page_alloc.c                |  3 ++-
 mm/page_isolation.c            | 31 ++++++++++++++++++-------------
 4 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolatio=
n.h
index 20c3f98b5afb..29b4ddcaea7a 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -22,17 +22,25 @@ static inline bool is_migrate_isolate(int migratetype=
)
 }
 #endif

+/*
+ * Isolation modes:
+ * ISOLATE_MODE_NONE - isolate for other purposes than those below
+ * MEMORY_OFFLINE    - isolate to offline (!allocate) memory e.g., skip =
over
+ *		       PageHWPoison() pages and PageOffline() pages.
+ * CMA_ALLOCATION    - isolate for CMA allocations
+ */
+enum isolate_mode_t {
+	ISOLATE_MODE_NONE,
+	MEMORY_OFFLINE,
+	CMA_ALLOCATION,
+};
+
 /*
  * Isolation flags:
- * MEMORY_OFFLINE - isolate to offline (!allocate) memory e.g., skip ove=
r
- *		    PageHWPoison() pages and PageOffline() pages.
  * REPORT_FAILURE - report details about the failure to isolate the rang=
e
- * CMA_ALLOCATION - isolate for CMA allocations
  */
-typedef unsigned int __bitwise isol_flags_t;
-#define MEMORY_OFFLINE		((__force isol_flags_t)BIT(0))
-#define REPORT_FAILURE		((__force isol_flags_t)BIT(1))
-#define CMA_ALLOCATION		((__force isol_flags_t)BIT(2))
+typedef unsigned int __bitwise isolate_flags_t;
+#define REPORT_FAILURE		((__force isolate_flags_t)BIT(0))

 void set_pageblock_migratetype(struct page *page, int migratetype);

@@ -40,10 +48,10 @@ bool pageblock_isolate_and_move_free_pages(struct zon=
e *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct p=
age *page);

 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_=
pfn,
-			     isol_flags_t flags);
+			     isolate_mode_t mode, isolate_flags_t flags);

 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_=
pfn);

 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			isol_flags_t isol_flags);
+			isolate_flags_t isol_flags);
 #endif
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 155f0b4ff299..3dab006a537e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2005,7 +2005,7 @@ int offline_pages(unsigned long start_pfn, unsigned=
 long nr_pages,

 	/* set above range as isolated */
 	ret =3D start_isolate_page_range(start_pfn, end_pfn,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       MEMORY_OFFLINE, REPORT_FAILURE);
 	if (ret) {
 		reason =3D "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 51d66f86b93d..3f208f8656f4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6787,7 +6787,8 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 */

 	ret =3D start_isolate_page_range(start, end,
-			(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : 0);
+		(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : ISOLATE_MODE_NONE,
+		0);
 	if (ret)
 		goto done;

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 5f00d7113766..fd4818862654 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -48,7 +48,7 @@ static inline void set_pageblock_isolate(struct page *p=
age)
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigne=
d long end_pfn,
-				isol_flags_t flags)
+				isolate_mode_t mode, isolate_flags_t flags)
 {
 	struct page *page =3D pfn_to_page(start_pfn);
 	struct zone *zone =3D page_zone(page);
@@ -63,7 +63,7 @@ static struct page *has_unmovable_pages(unsigned long s=
tart_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (flags & CMA_ALLOCATION)
+		if (mode =3D=3D CMA_ALLOCATION)
 			return NULL;

 		return page;
@@ -168,8 +168,9 @@ static struct page *has_unmovable_pages(unsigned long=
 start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, isol_flags_t isol_=
flags,
-			unsigned long start_pfn, unsigned long end_pfn)
+static int set_migratetype_isolate(struct page *page, isolate_mode_t mod=
e,
+			isolate_flags_t isol_flags, unsigned long start_pfn,
+			unsigned long end_pfn)
 {
 	struct zone *zone =3D page_zone(page);
 	struct page *unmovable;
@@ -203,7 +204,7 @@ static int set_migratetype_isolate(struct page *page,=
 isol_flags_t isol_flags,
 				  end_pfn);

 	unmovable =3D has_unmovable_pages(check_unmovable_start, check_unmovabl=
e_end,
-			isol_flags);
+			mode, isol_flags);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -309,6 +310,7 @@ __first_valid_page(unsigned long pfn, unsigned long n=
r_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might=
 be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
+ * @mode:			isolation mode
  * @flags:			isolation flags
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
@@ -327,7 +329,8 @@ __first_valid_page(unsigned long pfn, unsigned long n=
r_pages)
  * either. The function handles this by splitting the free page or migra=
ting
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, isol_fla=
gs_t flags,
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			isolate_mode_t mode, isolate_flags_t flags,
 			bool isolate_before, bool skip_isolation)
 {
 	unsigned long start_pfn;
@@ -357,7 +360,8 @@ static int isolate_single_pageblock(unsigned long bou=
ndary_pfn, isol_flags_t fla
 		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
 		ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageblock),
-				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
+				mode, flags, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);

 		if (ret)
 			return ret;
@@ -455,6 +459,7 @@ static int isolate_single_pageblock(unsigned long bou=
ndary_pfn, isol_flags_t fla
  * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
  * @start_pfn:		The first PFN of the range to be isolated.
  * @end_pfn:		The last PFN of the range to be isolated.
+ * @mode:		isolation mode
  * @flags:		isolation flags
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in=

@@ -488,7 +493,7 @@ static int isolate_single_pageblock(unsigned long bou=
ndary_pfn, isol_flags_t fla
  * Return: 0 on success and -EBUSY if any part of range cannot be isolat=
ed.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_=
pfn,
-			     isol_flags_t flags)
+			     isolate_mode_t mode, isolate_flags_t flags)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -499,7 +504,7 @@ int start_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
 	bool skip_isolation =3D false;

 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pagebloc=
k */
-	ret =3D isolate_single_pageblock(isolate_start, flags, false,
+	ret =3D isolate_single_pageblock(isolate_start, mode, flags, false,
 			skip_isolation);
 	if (ret)
 		return ret;
@@ -508,7 +513,7 @@ int start_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
 		skip_isolation =3D true;

 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */=

-	ret =3D isolate_single_pageblock(isolate_end, flags, true,
+	ret =3D isolate_single_pageblock(isolate_end, mode, flags, true,
 			skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
@@ -520,7 +525,7 @@ int start_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn +=3D pageblock_nr_pages) {
 		page =3D __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, flags,
+		if (page && set_migratetype_isolate(page, mode, flags,
 					start_pfn, end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
@@ -563,7 +568,7 @@ void undo_isolate_page_range(unsigned long start_pfn,=
 unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_p=
fn,
-				  isol_flags_t flags)
+				  isolate_flags_t flags)
 {
 	struct page *page;

@@ -610,7 +615,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, =
unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			isol_flags_t isol_flags)
+			isolate_flags_t isol_flags)
 {
 	unsigned long pfn, flags;
 	struct page *page;
-- =

2.47.2



--
Best Regards,
Yan, Zi
