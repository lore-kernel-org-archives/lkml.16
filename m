Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BC233129
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806513; cv=fail; b=EJjVXyPB8OfO3JXmqopIqCwXMcXyUV2eAjC7IJMuuF196B4KPsbeJ90yFgzbz8azMv4fxQKX93jfI+4nfHhn5S5L3rH/YVlY52FM8sQbnMrFFVVk12ZCm+VWST7HXvCCW3JVgigvj57evoz0NWW2XGWl5/Sa86B+OUziPTxNmSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806513; c=relaxed/simple;
	bh=BhNnau9+dI9B0GqzM2Z9FKxpa5LzTUi2UraoO5MWroE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KB7AWbn2VsHdaGeBEAr+Ei5YlJwmKOcPLKriQChWEek9BgVKeDgHB7dMmmqhegBnbiAva1vkzhqL22671GRgw6vu/TeAMTg9/PNiSAGrm2z2i/FviNbkAxAWfpy5oKs3sDmhnrunZnCo8tQZ0K/t1y4Q1EWVQbYxEPoQJq6hDIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BUVO8l6D; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BUVO8l6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVB+e6q/rR3aPvDpG/DyGt8Oc0Evly9LxV5NaQ79kRWSHuSdYJencQeilGzeiEVBYw+p1l3t9l/TA6FI4hV5QOjekjHI09xn3zApXCCxEQqcoHrKbLeX0pOJfgHEhg2RB0fyr9SyM9SZhVIxOX23/3vCkLdlGDJF4qacS4sAi7g+VZrBEAv9sib9rBRHxm+0EYR2NUQxUJnaMQxNqB0ulZNd6ESMMvyS60c5gNmJBDdVyPnZUk/pn7XwBOdM5+j50gyWb8T7ovurofVVZ4BJEugYnCNJ1YiyxpSYQjmuk5gwHYIDpcPAaC+hySCdi2nghegUIdgFgdcxIUAm1bUyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk1OUUeTDu3+OgkhTtS9NTjTn1xpT35TdXoihJOPVw8=;
 b=vpilngjYr7Y94gtqH6gt1JogYHLharwzLs1kZ/MBPZPf78wBjagxVItJUyxz6BEzqY5VCuOjLx3KZZslaDBHOop/Og297yFB48Da11gSPt35mIYjnm5SGnpBPfLdULpflG5lDgxCqP3JP2DiWfxfKbh7TetlpXAtuFS+jXmE4LfDGVs8ZaJ9REgVm7TeposPvn0UH7trOiw473FP0jeVjvRmhDUbn9jkgGm7Icb2pJJgiOtu580GhxlTfuXv56NaoaY5q9ac1gtPt3bbvC0LOjMVLN+1tOKL8+EFlXm89ldf7CIOSEduzf2vZ6aBwGLvagLhzJI9Jmm6HTK3YRw3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk1OUUeTDu3+OgkhTtS9NTjTn1xpT35TdXoihJOPVw8=;
 b=BUVO8l6DirF4szVD7FUqVhV8+CVhm4TlU1FK8NER4pLKNJGdljNU2ENZDH3fUY6C3DCNK+fGIA+Aw5bgeCaV+GH+Qv6k+Pu7DffPo6evmL5M3/dVNIOVymRZ1fDhhsYxN1gFaQ52VyuXEOyx1LweZUELVgxPNTPLoKVi8syo2st0CpMq0M+S4K9xh3Tga9bqXzjgqztKf7xjQuQCAwIqNgBXotmLlMDWWvTuTDVgvGTVKg+7dkiPM2P5EKON4fo9fYIDEXMVnIKNTMRfmKVECsygxS8Z8Jh9bdcM1RP/xQR4T6OdU0eYmPn/a9iTapMKCyFJvvstLZ4mmZa0ASPPQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB6780.namprd12.prod.outlook.com (2603:10b6:303:20e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.37; Fri, 9 May
 2025 16:01:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 16:01:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Fri, 09 May 2025 12:01:44 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <EB70C64C-4D97-4EAB-8BD6-180BE3297764@nvidia.com>
In-Reply-To: <970A26A3-6E75-4474-997B-67B9547E15AC@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-5-ziy@nvidia.com>
 <C4D87FA7-4B3D-440F-9E5F-B57561AB4FE8@nvidia.com>
 <970A26A3-6E75-4474-997B-67B9547E15AC@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ced1b4-f460-4bad-1c4b-08dd8f12cc7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YPiSqHoM/KR07/T2HH7FdOG3E234gJqDrojNZBmXqjPCK4XfqI4PQETsKMmI?=
 =?us-ascii?Q?5wrhr2io63gOSIGpy8t/eaSQkOBCJaZrk9hds0QDhnqA4elNgBcRsYew15Rm?=
 =?us-ascii?Q?HPZMVvX7CJe9n7+lmA+/uuL35wVAbJzn+wAo9qbTQQeAmiXDGa8W7v+2eoZs?=
 =?us-ascii?Q?u+drSdOQn2FJW6VHh2hRmPgWfdftPAtuUGPzN7GGUZUh1tfrxs5h743PezNe?=
 =?us-ascii?Q?SFPIM61/a6jM9yGGfIX9XVt2cJ1ElilEjkc//M97CxPhRezmkxMOp9oyDVbC?=
 =?us-ascii?Q?Rm/kjKSc/WjyDcf6b4oitm4v3ahiNdIlVDa+nhPv4p+7GWGHaPa9TG9qdBgs?=
 =?us-ascii?Q?kO1E1FXvM61P1KGRETpEDjzTpW801bsHERm3hA0iKAKEV2+Ljdc7T5FgS7nO?=
 =?us-ascii?Q?Nk1P1+lypZU0k7Sgh122SBiHE4/SSCYcflxYmktxPKdEDec+mfSxRmuA2k9R?=
 =?us-ascii?Q?oMabBqks7wHwxQWXIiRUuw6N0FIaE/zcJd7LhpVr+hqUlKXmTSi71SG0g/Bq?=
 =?us-ascii?Q?p30NIsmDQhy1GqUkV2+j7uBV7sX01gVy1iPCqpCxYm5DnfIwrFHYHTJAR2KT?=
 =?us-ascii?Q?AX6MG48GOteO5BBZm4hZHtcrP1fskWw4LI0PdGS69HBHJ5S9K+OmHU7RN4ZA?=
 =?us-ascii?Q?U0DNZpIEyXv7OcVtFzTzMpiVAtK4EHifHpVKvGjqr7QKq3IhVvhK7JFSkPSn?=
 =?us-ascii?Q?hqtiWgxLgBXHFCVK1R4sCK7ooAryCa46JkQOns1SLOiBILPRw2PKJaiV7RDh?=
 =?us-ascii?Q?lgIR9sT0DuZzXI8kcyxaWMQx7T7qUjiuiSuH09O7bs1Rn9kA4Q+f4Yvcfl7f?=
 =?us-ascii?Q?9DEl7/yymDdlMCZpNAihbOWjCuBlRm1r1oGB7W3YPYr8a6kbiBUDJXMtxpfV?=
 =?us-ascii?Q?u5AvhQCXT6axj55Tf2iYVtnGvyKrh3Ey5gdimvubwMgsY9sSWZ8L7KvfnUTu?=
 =?us-ascii?Q?hCzH+dJoVWSIu0JDFfK+s2KbyRJ4lK4W7FILjeVrrdW0J4gYbYBfbsuR9sJ5?=
 =?us-ascii?Q?2/xxrhfMbjCsSwoL1plBxywdIbD7+EH1pvmJxie/DzL9KEZn2jAzu55T4X/U?=
 =?us-ascii?Q?xgr637LvGPcSVaH42dH05bkeenwJrPGWmnrUaHKuYiOgvX+8W3oie+ze7ly4?=
 =?us-ascii?Q?DjwVBvaTWGWUHZFYCh/dYCWafAkzumfpuN9V0kEXTgQ5yYvMIb9PNKSBAbLo?=
 =?us-ascii?Q?iSyR+WfFdaB2tK1s74Mvpen9XmXju18Bpl3VX3IUJQNMHoE8LwAxbMvRgbgg?=
 =?us-ascii?Q?bUjUKbBb2l5GxLlKTPMR7hw6FwE7hyGW9P6+wAkkgY8IxuQyEn/hGUDFZiz4?=
 =?us-ascii?Q?tkRhOrtj8gm/ZH4EuS5Wo1Jgv6V8OZEWhgHKwXQmv8nXstXjw1InzvMQX1Qb?=
 =?us-ascii?Q?qp6EqYdkOHFhK5H4YCgwssWrmz5sGA6aLcfZJR+dIy0YWaJ0GEi6ZVJvQF8y?=
 =?us-ascii?Q?nfq5tx3PjM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ZHOqkQ1qH3Oep/KLDLIE3XXMAUXevompvUoWP4aX9DC7j9tNRRNsBvHI108?=
 =?us-ascii?Q?NsvEv9FwCqxHOu4PfZPenGfCGj0tI/O7scFsJtqsQJsLWeHJ1QmTK+lw7a62?=
 =?us-ascii?Q?/x87v2QUeR29YbWu96J/AFvJuxziDp0DmyjV+ZK/QCh4PKKjm3Sw2A9RVpOT?=
 =?us-ascii?Q?ZMF4/yyRcIeceoVaoemvUPGc/Es4mZRBu9lEsShLvOAiv3pcbZQ+dcRCUV2B?=
 =?us-ascii?Q?3gcPN5+TtsUarNjRlulZM5yaX/ws8M13kcFA0RyGq2cCrVqsRzmeBNTOjHYG?=
 =?us-ascii?Q?TI4USwvU/d1vCgBSqWbqKwWUZiROnaNl4DI7d14Jz30bRqd0FLBYyWmUVeNj?=
 =?us-ascii?Q?xOFgz+fBbFmCb6JRxvlzupwZCeKavJeZ1gwkj3JkgZjyUdxUkKjwHfg9raTz?=
 =?us-ascii?Q?sVbrqQIQ5SqSegfIAWTX6T22ch7aWNFTH3uBDWaOCGE747SeXZf0Scxb0+cs?=
 =?us-ascii?Q?CJ7BKFUh7fdOddcne2YVmT8fQ150gbGd8ctB2t/Xot09W1GNq7KUZ78HuZuz?=
 =?us-ascii?Q?E1Pozjz27b17euhPmezgc0+0vVfzRFgPmumXYFm8j6kZii42RaaPrtIp/Ck+?=
 =?us-ascii?Q?Vp2T37JwajZlexX21Gf5q8iOau1CaICszsPc1/ctXfgp0OKt5SLZWIA3n6Wo?=
 =?us-ascii?Q?atZqQ9n5xlC4PNzUF3IYU+cY5NWK+DfOkQzjIY/CA+zRW/K5b9xMm+UZ/nz0?=
 =?us-ascii?Q?TrC0/RKCUaBofTxPE2B7XI+6nftzd8NmaWLtaFYy9T1OHueE9sZ3UvveTslr?=
 =?us-ascii?Q?o4GnNAexX/DubeLEbIR2FZrJGC+9lfQlfgECSBbIJgekg/nCSJDv8G6eFEOh?=
 =?us-ascii?Q?4VJOPjQNIi7lBpsGsJewN1Wu4hn1zuFAnUMsYwFHEvQ/BIolgYARLWFCm1jI?=
 =?us-ascii?Q?603D9kcCf+f9AhKmgelTGH4GQnLqLruhYitt2eXqB91TO6Jo/sP1woaj728y?=
 =?us-ascii?Q?zdeYT3DaRviR8kIDJ31dzCZW0fEuXrQUN6DuUshmvaK5LhH0SzboYSQ0GVH4?=
 =?us-ascii?Q?xZWKc8NXs71O0qJIOM66LKNNPb9y5e9siVwAyNw7hSd3OF3ozOmnrS4BTviE?=
 =?us-ascii?Q?mAckqse5/Florjc2ml7L2GDjb7plbEcsLS39dv0rGmJqfNNmbUGeeINZvH2R?=
 =?us-ascii?Q?XyAaq6g0UKKoBmZoIOIsoGwG3R74qC7jx8NrUxlDWw64hj4+wWcwW2Q/BnPP?=
 =?us-ascii?Q?5ToZUVEDKuBLgfZLdeMgaDNeTq4mzTXT0Zfgz9abE3+TiI1K1MmINoMCfj/U?=
 =?us-ascii?Q?xpfQVJ+S6tORPwGvkM5kbFN4fi9JX1lZULzmQGWXzWPFhqb9aCr4pa0XBqEb?=
 =?us-ascii?Q?k+itBtgzhGQrD7fx+t6+v/b2C/HU9wOEchxUBM4MX0deTySkBK/0r3Z4aPA8?=
 =?us-ascii?Q?+cpZg2PlQp1rpXfVLrpFWwvm3wgIbMJOAetSODsWrgDveBpJ6cyyUPXQ8TLs?=
 =?us-ascii?Q?zF0O6z/0D1pDwsMY0T1F+gMVvYepUVjRf+ChCf5lYlbyEHkimiXzWYiGzpN3?=
 =?us-ascii?Q?xdIOmU33oNIfKRu828PBb8fdkwYhZnhKl0vrVlap01TXXzw7qesqyv+pv6pa?=
 =?us-ascii?Q?nkvAVpTZuKSgy/h1ftTxm6ZB+7dmdMybKEN4J4LH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ced1b4-f460-4bad-1c4b-08dd8f12cc7a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:01:46.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiPVVR13J4JztQrcGaeK+rVBCeCtWi9ctJFQ5oboe3ekC0I/7L8b7OnefR5724DT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6780

On 8 May 2025, at 21:56, Zi Yan wrote:

> On 8 May 2025, at 16:25, Zi Yan wrote:
>
>> On 7 May 2025, at 17:10, Zi Yan wrote:
>>
>>> migratetype is no longer overwritten during pageblock isolation,
>>> start_isolate_page_range(), has_unmovable_pages(), and
>>> set_migratetype_isolate() no longer need which migratetype to restore=

>>> during isolation failure.
>>>
>>> For has_unmoable_pages(), it needs to know if the isolation is for CM=
A
>>> allocation, so adding CMA_ALLOCATION to isolation flags to provide th=
e
>>> information.
>>>
>>> alloc_contig_range() no longer needs migratetype. Replace it with
>>> a newly defined acr_flags_t to tell if an allocation is for CMA. So d=
oes
>>> __alloc_contig_migrate_range().
>>>
>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>>  drivers/virtio/virtio_mem.c    |  3 +--
>>>  include/linux/gfp.h            |  6 +++++-
>>>  include/linux/page-isolation.h | 15 +++++++++++---
>>>  include/trace/events/kmem.h    | 14 +++++++------
>>>  mm/cma.c                       |  2 +-
>>>  mm/memory_hotplug.c            |  1 -
>>>  mm/page_alloc.c                | 22 ++++++++++-----------
>>>  mm/page_isolation.c            | 36 ++++++++++++--------------------=
--
>>>  8 files changed, 50 insertions(+), 49 deletions(-)
>>
>> Here is the fixup 3/3 to address the type issue reported by kernel tes=
t robot.
>>
>> From 3c439f1f09b03c8362b43c0ac05e5f174f1a6655 Mon Sep 17 00:00:00 2001=

>> From: Zi Yan <ziy@nvidia.com>
>> Date: Thu, 8 May 2025 15:42:18 -0400
>> Subject: [PATCH] fixup for mm/page_isolation: remove migratetype param=
eter
>>  from more functions.
>>
>> 1. fixed test_pages_isolated() and __test_page_isolated_in_pageblock()=

>>    signature by using the new isol_flags_t type.
>> 2. fixed test_pages_isolated() doc: flags -> isol_flags
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  include/linux/page-isolation.h | 2 +-
>>  mm/page_isolation.c            | 6 +++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> This is the second round of fixup 1/1 to address Johannes' comment on P=
atch 4.
>
> From 760c00e808c74d62e8d879f281f38d6608c89296 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Thu, 8 May 2025 20:54:40 -0400
> Subject: [PATCH] fixup for fixup for mm/page_isolation: remove migratet=
ype
>  parameter from more functions.
>
> 1. change MEMORY_OFFLINE and CMA_ALLOCATION to isolate_mode_t enums.
> 2. rename isol_flags_t to isolate_flags_t.
> 2. REPORT_FAILURE becomes the only isolate_flags_t.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/page-isolation.h | 26 +++++++++++++++++---------
>  mm/memory_hotplug.c            |  2 +-
>  mm/page_alloc.c                |  3 ++-
>  mm/page_isolation.c            | 31 ++++++++++++++++++-------------
>  4 files changed, 38 insertions(+), 24 deletions(-)
>

This fixup has missing pieces. Let me send another one.

> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolat=
ion.h
> index 20c3f98b5afb..29b4ddcaea7a 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -22,17 +22,25 @@ static inline bool is_migrate_isolate(int migratety=
pe)
>  }
>  #endif
>
> +/*
> + * Isolation modes:
> + * ISOLATE_MODE_NONE - isolate for other purposes than those below
> + * MEMORY_OFFLINE    - isolate to offline (!allocate) memory e.g., ski=
p over
> + *		       PageHWPoison() pages and PageOffline() pages.
> + * CMA_ALLOCATION    - isolate for CMA allocations
> + */
> +enum isolate_mode_t {
> +	ISOLATE_MODE_NONE,
> +	MEMORY_OFFLINE,
> +	CMA_ALLOCATION,
> +};
> +
>  /*
>   * Isolation flags:
> - * MEMORY_OFFLINE - isolate to offline (!allocate) memory e.g., skip o=
ver
> - *		    PageHWPoison() pages and PageOffline() pages.
>   * REPORT_FAILURE - report details about the failure to isolate the ra=
nge
> - * CMA_ALLOCATION - isolate for CMA allocations
>   */
> -typedef unsigned int __bitwise isol_flags_t;
> -#define MEMORY_OFFLINE		((__force isol_flags_t)BIT(0))
> -#define REPORT_FAILURE		((__force isol_flags_t)BIT(1))
> -#define CMA_ALLOCATION		((__force isol_flags_t)BIT(2))
> +typedef unsigned int __bitwise isolate_flags_t;
> +#define REPORT_FAILURE		((__force isolate_flags_t)BIT(0))
>
>  void set_pageblock_migratetype(struct page *page, int migratetype);
>
> @@ -40,10 +48,10 @@ bool pageblock_isolate_and_move_free_pages(struct z=
one *zone, struct page *page)
>  bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct=
 page *page);
>
>  int start_isolate_page_range(unsigned long start_pfn, unsigned long en=
d_pfn,
> -			     isol_flags_t flags);
> +			     isolate_mode_t mode, isolate_flags_t flags);
>
>  void undo_isolate_page_range(unsigned long start_pfn, unsigned long en=
d_pfn);
>
>  int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn=
,
> -			isol_flags_t isol_flags);
> +			isolate_flags_t isol_flags);
>  #endif
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 155f0b4ff299..3dab006a537e 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -2005,7 +2005,7 @@ int offline_pages(unsigned long start_pfn, unsign=
ed long nr_pages,
>
>  	/* set above range as isolated */
>  	ret =3D start_isolate_page_range(start_pfn, end_pfn,
> -				       MEMORY_OFFLINE | REPORT_FAILURE);
> +				       MEMORY_OFFLINE, REPORT_FAILURE);
>  	if (ret) {
>  		reason =3D "failure to isolate range";
>  		goto failed_removal_pcplists_disabled;
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 51d66f86b93d..3f208f8656f4 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6787,7 +6787,8 @@ int alloc_contig_range_noprof(unsigned long start=
, unsigned long end,
>  	 */
>
>  	ret =3D start_isolate_page_range(start, end,
> -			(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : 0);
> +		(alloc_flags & ACR_CMA) ? CMA_ALLOCATION : ISOLATE_MODE_NONE,
> +		0);
>  	if (ret)
>  		goto done;
>
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 5f00d7113766..fd4818862654 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -48,7 +48,7 @@ static inline void set_pageblock_isolate(struct page =
*page)
>   *
>   */
>  static struct page *has_unmovable_pages(unsigned long start_pfn, unsig=
ned long end_pfn,
> -				isol_flags_t flags)
> +				isolate_mode_t mode, isolate_flags_t flags)
>  {
>  	struct page *page =3D pfn_to_page(start_pfn);
>  	struct zone *zone =3D page_zone(page);
> @@ -63,7 +63,7 @@ static struct page *has_unmovable_pages(unsigned long=
 start_pfn, unsigned long e
>  		 * isolate CMA pageblocks even when they are not movable in fact
>  		 * so consider them movable here.
>  		 */
> -		if (flags & CMA_ALLOCATION)
> +		if (mode =3D=3D CMA_ALLOCATION)
>  			return NULL;
>
>  		return page;
> @@ -168,8 +168,9 @@ static struct page *has_unmovable_pages(unsigned lo=
ng start_pfn, unsigned long e
>   * present in [start_pfn, end_pfn). The pageblock must intersect with
>   * [start_pfn, end_pfn).
>   */
> -static int set_migratetype_isolate(struct page *page, isol_flags_t iso=
l_flags,
> -			unsigned long start_pfn, unsigned long end_pfn)
> +static int set_migratetype_isolate(struct page *page, isolate_mode_t m=
ode,
> +			isolate_flags_t isol_flags, unsigned long start_pfn,
> +			unsigned long end_pfn)
>  {
>  	struct zone *zone =3D page_zone(page);
>  	struct page *unmovable;
> @@ -203,7 +204,7 @@ static int set_migratetype_isolate(struct page *pag=
e, isol_flags_t isol_flags,
>  				  end_pfn);
>
>  	unmovable =3D has_unmovable_pages(check_unmovable_start, check_unmova=
ble_end,
> -			isol_flags);
> +			mode, isol_flags);
>  	if (!unmovable) {
>  		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
>  			spin_unlock_irqrestore(&zone->lock, flags);
> @@ -309,6 +310,7 @@ __first_valid_page(unsigned long pfn, unsigned long=
 nr_pages)
>   * isolate_single_pageblock() -- tries to isolate a pageblock that mig=
ht be
>   * within a free or in-use page.
>   * @boundary_pfn:		pageblock-aligned pfn that a page might cross
> + * @mode:			isolation mode
>   * @flags:			isolation flags
>   * @isolate_before:	isolate the pageblock before the boundary_pfn
>   * @skip_isolation:	the flag to skip the pageblock isolation in second=

> @@ -327,7 +329,8 @@ __first_valid_page(unsigned long pfn, unsigned long=
 nr_pages)
>   * either. The function handles this by splitting the free page or mig=
rating
>   * the in-use page then splitting the free page.
>   */
> -static int isolate_single_pageblock(unsigned long boundary_pfn, isol_f=
lags_t flags,
> +static int isolate_single_pageblock(unsigned long boundary_pfn,
> +			isolate_mode_t mode, isolate_flags_t flags,
>  			bool isolate_before, bool skip_isolation)
>  {
>  	unsigned long start_pfn;
> @@ -357,7 +360,8 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, isol_flags_t fla
>  		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
>  	} else {
>  		ret =3D set_migratetype_isolate(pfn_to_page(isolate_pageblock),
> -				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);=

> +				mode, flags, isolate_pageblock,
> +				isolate_pageblock + pageblock_nr_pages);
>
>  		if (ret)
>  			return ret;
> @@ -455,6 +459,7 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, isol_flags_t fla
>   * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
>   * @start_pfn:		The first PFN of the range to be isolated.
>   * @end_pfn:		The last PFN of the range to be isolated.
> + * @mode:		isolation mode
>   * @flags:		isolation flags
>   *
>   * Making page-allocation-type to be MIGRATE_ISOLATE means free pages =
in
> @@ -488,7 +493,7 @@ static int isolate_single_pageblock(unsigned long b=
oundary_pfn, isol_flags_t fla
>   * Return: 0 on success and -EBUSY if any part of range cannot be isol=
ated.
>   */
>  int start_isolate_page_range(unsigned long start_pfn, unsigned long en=
d_pfn,
> -			     isol_flags_t flags)
> +			     isolate_mode_t mode, isolate_flags_t flags)
>  {
>  	unsigned long pfn;
>  	struct page *page;
> @@ -499,7 +504,7 @@ int start_isolate_page_range(unsigned long start_pf=
n, unsigned long end_pfn,
>  	bool skip_isolation =3D false;
>
>  	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pagebl=
ock */
> -	ret =3D isolate_single_pageblock(isolate_start, flags, false,
> +	ret =3D isolate_single_pageblock(isolate_start, mode, flags, false,
>  			skip_isolation);
>  	if (ret)
>  		return ret;
> @@ -508,7 +513,7 @@ int start_isolate_page_range(unsigned long start_pf=
n, unsigned long end_pfn,
>  		skip_isolation =3D true;
>
>  	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock =
*/
> -	ret =3D isolate_single_pageblock(isolate_end, flags, true,
> +	ret =3D isolate_single_pageblock(isolate_end, mode, flags, true,
>  			skip_isolation);
>  	if (ret) {
>  		unset_migratetype_isolate(pfn_to_page(isolate_start));
> @@ -520,7 +525,7 @@ int start_isolate_page_range(unsigned long start_pf=
n, unsigned long end_pfn,
>  	     pfn < isolate_end - pageblock_nr_pages;
>  	     pfn +=3D pageblock_nr_pages) {
>  		page =3D __first_valid_page(pfn, pageblock_nr_pages);
> -		if (page && set_migratetype_isolate(page, flags,
> +		if (page && set_migratetype_isolate(page, mode, flags,
>  					start_pfn, end_pfn)) {
>  			undo_isolate_page_range(isolate_start, pfn);
>  			unset_migratetype_isolate(
> @@ -563,7 +568,7 @@ void undo_isolate_page_range(unsigned long start_pf=
n, unsigned long end_pfn)
>   */
>  static unsigned long
>  __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end=
_pfn,
> -				  isol_flags_t flags)
> +				  isolate_flags_t flags)
>  {
>  	struct page *page;
>
> @@ -610,7 +615,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn=
, unsigned long end_pfn,
>   * Returns 0 if true, -EBUSY if one or more pages are in use.
>   */
>  int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn=
,
> -			isol_flags_t isol_flags)
> +			isolate_flags_t isol_flags)
>  {
>  	unsigned long pfn, flags;
>  	struct page *page;
> -- =

> 2.47.2
>
>
>
> --
> Best Regards,
> Yan, Zi


--
Best Regards,
Yan, Zi
