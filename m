Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E582CCC0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358275; cv=fail; b=NMD+ZlwSTBmUCDotz8qKK+mgk1Ef2rHtwUUH2OZkee8pnaWESJzU72oxOSoTJykHiBWj+RnKaFnCM3ohR7l5xPEKHYjX9ipaaHwjMPf00dY6RzvsApFiU4MYI7c+urMO11swXrGzvS7D5jzQ36xLiMb5vGbg+kSpqpu5iTJ5FD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358275; c=relaxed/simple;
	bh=wDMSt2yaMqZZ8v6nPeFghtmEBayCB8OqjNPjWKBUwQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qnq0Ta/gV49mQG+XT3afPZJYtrkfqXSH4bEqy5+lfto1bpbNdMRTG4OzeSa5ji5UF6qqzUmMgLeCcbe6wVYYiN1RKohZthVX6pnv3ZrWQjX0X6BHauKz+6Jl8EXhKF3hUpjmlP/vYxrt8p1LSGXKUcJ/Sq8Hd6YrhetRvemGuXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eevlNSd+; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eevlNSd+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBnh6lNIZkRhO1H3TuYmoRBEtCcBN9xGHalN6HlB/mpa2TsyVBn5zSsvARjd5xVhJRMldGpLU0mY66j4z6DHeInKtDick00Q1Mur+aSmMoPrlBAtZZdj195TV5985rKgMYdCYuG9/9jqEgLL66nh2x/UrqGVe8pVEmLwuNM0F3Gx0tFMyosn/3lmGr4PhdJcbHL3lYf9Pm/a8q8m8bPuWHJZaegvqDJ+pw/LrVune9ELaO/MJZ0rAGQRK9dgctP6UU3ej4hQK7upyte96rmpS0Y8qE9ANpVRi2lVcarIhGDxvocaI5kNKyBNUN6EfmRWm4R1wGFQfKusb7zHj+Xshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zGOonH2GOdd5EWsVUXEf/f3WqGUBDwvooc9DMHrvGw=;
 b=jJxVOaaFmfOgCU89vxexa8Q17GJpXXJiaycY9L6MaypAUOW/zYDOtMmCCA5avBzEqy8QFxOS8idp8UvLDlWS7c5BaakORdp8f4hJppLlbPFbK46S6SS8+f3QtfqyWHm7ncwdCvZOCWdK4rGI5oFmZVGf0F7aATrL4PPiyHp9iHNZCarV3oWfPFL6PB4qWWD67Jw6jjkHotPWCOQT48TWJ3gr3SjKhULozUP12Fwo7oExaCyIF7ZJ9h2gA8S8U+rX2gMoHoqgMkZqNYKwWW4dn/Mn95G/R8YST2HbGKIk4wnRBPkIQ14hTAGX8z9rsfgdtE7j+bnOWWPzWzzcQCsarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zGOonH2GOdd5EWsVUXEf/f3WqGUBDwvooc9DMHrvGw=;
 b=eevlNSd+TnHML7hMcfvpEQoKhYdra2hj5dNKCpWL7FNzj/d+0HOzE2MSd+vWHeJ5YdfM82KclHaUXVHy01yG4uhWK0WahhX/AqioXKevj9H6Z5ZYkWlspDdJLWHuRLjKkNGDi4vHYzOwRrYG+RhZ2xQnqVleqco1g0EfrfArfTTrUlHWcdS61fF/be84bdSMGzr4iXveA57N6gDbNcgF+zt6d0yveg1/b+sUSgptvIv6IslsJlZICf1/l/gfMoDzy4IYo73U9sY6pF0aQSqarEJ28EctJfghCWWUf/zhCE0zudVRw/y9ZNx39z67QJsVqUDbbdToQGdY6qDv4wYb9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Tue, 27 May 2025 15:04:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 15:04:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Tue, 27 May 2025 11:04:24 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <B4F06FA4-AEC0-4B2C-AB1C-FA404A81CD9C@nvidia.com>
In-Reply-To: <e8a6247b-c3cc-4f40-b41c-1a38e90ccaf0@suse.cz>
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-7-ziy@nvidia.com>
 <e8a6247b-c3cc-4f40-b41c-1a38e90ccaf0@suse.cz>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:52c::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8e1885-314c-4877-699f-08dd9d2fc690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Af6fAIo08fcDZxJ8dYCLAtRbtYRMSY/J8JYY0s/nH9ecnS1qRpF3VWiX1sKL?=
 =?us-ascii?Q?SaS2RFQNRLJZbQY0w65ziyQMNdwh/JljTMVuqn6KfTr23UOTer+v5YdkUmae?=
 =?us-ascii?Q?Oor7JCZ4Jq4URfVy+QKIHf+96X/5iJFKzzaGKtXHuEp02Hd8gHRa0UslVJpL?=
 =?us-ascii?Q?//PEvXV8yVajCeSCECYKPTDXXNpgVi+d8GkKym5tAhOpWxbASjnSGIhOWUVr?=
 =?us-ascii?Q?Mw+lhyCJB0wQhu/p7zLeymXwpWemfkLGM1FKGhW4hVx+tLhPz3vzWY0izgxU?=
 =?us-ascii?Q?0yQQxmel2om2A7QSWWUsy+nixYcecV8vY7ampbJoPpoRWT5/9FRcSXYx0TmJ?=
 =?us-ascii?Q?fZMuzAOuwgrU0FVeuMQOs685ArfrqFe612pNlsmmeUMqdU17ecpqwPkmiB2L?=
 =?us-ascii?Q?uMwdz4+8137JRyUq7NPZ/0p7N+7xdoENqjNWOn+2nA0MH69MNqCSIOzBtGhB?=
 =?us-ascii?Q?9L8HS/jS8dZ8mUFgzEJIYna6N5s7YTTbyMMWTxrAmxfzBZ6rXBsH2wgNYI5t?=
 =?us-ascii?Q?ym9GAoPfXMtMQtfx8ruZYbi5CclOGmZHleaJaFdns2uTH488xVSHKPb2fYmN?=
 =?us-ascii?Q?BsP0xn8WNplOD71/WYmE2nwveM/aT/TWs1tsAX9TkcfW1ynNM7LkzmDKurQg?=
 =?us-ascii?Q?wRIwa4cN2i94hm+zE6Xo+LaOGKQW4U/MNVmpeq+uRQA1K2vAA2bH9lnOYu8r?=
 =?us-ascii?Q?Eh/sCtN5b+5XG7J3SeBc70CyCpn21Xf3VOirVnU1C6RkhWghyHBi6RQdmqM9?=
 =?us-ascii?Q?eor7vFq33hF7JR/Dchf6wnHhbTaQRsVWNWWRVTGS9Nl4PTMhxgMIHZKL1+Xa?=
 =?us-ascii?Q?2lv3tO4GJcehhNkeFRKhQG6WeiaxImx8alXie/NtjFZBkCByRGgILlMs1+bM?=
 =?us-ascii?Q?h06uw0kmDvXAScQG3eKd3sYCCMb9GdiF4M2RUOJU4eEEBklN7A4g75KXyPul?=
 =?us-ascii?Q?ehqC88xnPDpEKXR9Rin29Qg5CvzAUFcjy93720jO/yvZnf6r6PzqiVvT8hLu?=
 =?us-ascii?Q?DiDg5pOi5QUXygPjalfLNaDJA/L0eUZ6oKQfXzkItAIj0CgNn9HWvzn7UjED?=
 =?us-ascii?Q?jEpYGGCVcsCunsAIZ+RIadiSWjDkW57CVyaQruoPKm2Ltpxk2npuC45b25ta?=
 =?us-ascii?Q?NP4WVbCnoZefNSD6JCcjHeae01N76AogyoE359dPw1AZKDEIYffPbRKXQ4dD?=
 =?us-ascii?Q?RPq4RaAw5Jv5xLwnTZ7V59Ogtj77CXm0DnS476TiY5shPgpgceo7IR2DJtvt?=
 =?us-ascii?Q?7AaERZNn5Dx7vt2k4aWDykGKfMKeDTshERQipujR4ZZu14hgfQhKa02iOhIF?=
 =?us-ascii?Q?JQLtLclL9P+6ntG3dErHdxFNKrUwIHp27HNNyPMKZ8qqeIxVaNBgZ+7q+vNz?=
 =?us-ascii?Q?ZDRCk2tb3kVNIe+KXbo8ITq7RMl7fsHwGiWwj2YGIbbxpBGidkAFQzKDCPGy?=
 =?us-ascii?Q?e0ZFPX/oFTA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ApLhM2uvl211+JYcm5tH4Ofr2pOBtYcW5BhIhTohSk5rK85aduFj1vxazqRD?=
 =?us-ascii?Q?4cBjM4fDw7TVT28sGXrlLQXtuboUO/AREg7e7EI4I5RbS+gztoI5dAfCx0s/?=
 =?us-ascii?Q?Rw+EE114GBYGKAgG2TuY8rpz0VfpTYrBCxe+oY+4iumn3Ne2lPoIUM+lwDmy?=
 =?us-ascii?Q?edogBBUYVWMxCDLgcLeYFort1p6TeED2MbU3TNwbmp2i+1daWibCnzgphuOD?=
 =?us-ascii?Q?y4SJtDbjwWewRnYWnPhEkIP7AjFcHgzSHzo5jM3ePIjv9lqGMJft7VsbprxK?=
 =?us-ascii?Q?0OU3T5azj/KvIBVyFBFo0b1eg8irUBNSm9LPou/qS6eBiep2W3r01kMCPlPS?=
 =?us-ascii?Q?MkbaL7CFIohWRKudCYQHvsA4UvfGLttYyCCR5ICbUiEXIL1LHkTgcUKgS7Vi?=
 =?us-ascii?Q?tGldvchVc7RNTcOTsm8//9LFZUR1o2G8xVe7CbXSaGodjr5wP7rgyQC4I8vY?=
 =?us-ascii?Q?ADVQN/LCylx6rHw0cIHzVPE8Le7BOkRLSFb/xJJFSghKo6D3+TvXP2Yq+GiF?=
 =?us-ascii?Q?Owz6zcZwXmO9FeI7YtzgeddNqPUy1qNAgyJnRbx0N82mitocrIzL3B376b/D?=
 =?us-ascii?Q?rMx9U1o52CZKnTjOaSJNOoTNMvHSMnJPznAHxHJ5blTMgVylOutnwLUM3WK+?=
 =?us-ascii?Q?cV82OLhNmocQbjf4SUFb+5OukT4H2C9zeoM37F2swhCdGjmB2Ij8vu0OJeWh?=
 =?us-ascii?Q?qMTqCflKJmWhU+fjzBJBbi38vPY+sKyJiHVbsnHeGhhNEwmAqp88j7rRATWy?=
 =?us-ascii?Q?6cbgL4FBS2coHuO/TIh9JPQgLxlm6UM/MbjC4aFXa9HIKzhKsxtFm3zw4nlC?=
 =?us-ascii?Q?M34xREGUpUXjhZCs/PB7Uo0TuHDURjf6sJ+LsNAj2smQINyZ4fpHc588i/lq?=
 =?us-ascii?Q?dCjGePoaZGqdoYzV53iXF4IIRBL2UmfdfQwQsLBnMrHmd+oIPrOr78OiNwC5?=
 =?us-ascii?Q?rr61VDreOUYhc3CXF6Uo5tCtHFHFoohEg7qKUD5DP2YfQsndXPpGdB9CzTMa?=
 =?us-ascii?Q?4KnDTmbTg/tIbUu9GZpVfJx5PMXQ6w9ly8W2y0co/mMsqECTSUjVPPOFCCgI?=
 =?us-ascii?Q?ld4LGntjkEnFMf7QLByqTda/8kUkKnAyG32B1rop97o7folZoTDw0fcldeED?=
 =?us-ascii?Q?9uDDLCrYb6Jep5x5+46k+jF0MDzO7vQe1kKcoDJeVzAIFipiONVq+TuZMgSK?=
 =?us-ascii?Q?UrEmEfC0nmGqdO7SS2RyUXDPFUdZezGWx762aXuy+kpzsJCkioJr2/rgSKBk?=
 =?us-ascii?Q?mlSm4CRNPwcIseQvAdrvfQKFFzCa48RmxHtgdyRlDGvUXON5/6YdXYBQHJY6?=
 =?us-ascii?Q?ri28HQ+3DBZlN8XkRIY/CVhXYVwcxlzsQBHmQzIy/zAs5DbFkJpkKrTYidy0?=
 =?us-ascii?Q?YXPn9Q8fIJxDZsV3d7We0WjVz0T3CBQb0fXmUPIpLcihRiNl/tqIIehtCHPq?=
 =?us-ascii?Q?1bwZbLWwWgjHLeZx/1ZLa0iPR4debxdBoRuv7VflG8C4zMugL4xve/lIigRs?=
 =?us-ascii?Q?wgoQpzsVO3N9tAou+isvw+c/Tl6t9jmOIe/Cm5PkO1rkJh5wOU7gmSo3dZn1?=
 =?us-ascii?Q?E9Ejc2gbJkoJey3zR/KV/0SYVDfyfjDvrlHi1xXl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8e1885-314c-4877-699f-08dd9d2fc690
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:04:27.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc6exn+tVpAcVHyb+0/cE3zAZug/09WpBx39jI471xD9pUc72rKBwCn4D6FJWk0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

On 27 May 2025, at 8:55, Vlastimil Babka wrote:

> On 5/23/25 21:12, Zi Yan wrote:
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA=

>> allocation, so adding CMA_ALLOCATION to provide the information. At th=
e
>> same time change isolation flags to enum pb_isolate_mode (MEMORY_OFFLI=
NE,
>> CMA_ALLOCATION, and ISOLATE_MODE_OTHERS). Remove REPORT_FAILURE and ch=
eck
>> MEMORY_OFFLINE instead, since only MEMORY_OFFLINE reports isolation
>> failures.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> a newly defined acr_flags_t to tell if an allocation is for CMA. So do=
es
>> __alloc_contig_migrate_range().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  drivers/virtio/virtio_mem.c    |  3 +-
>>  include/linux/gfp.h            |  6 ++-
>>  include/linux/page-isolation.h | 19 ++++++++--
>>  include/trace/events/kmem.h    | 14 ++++---
>>  mm/cma.c                       |  2 +-
>>  mm/memory_hotplug.c            |  4 +-
>>  mm/page_alloc.c                | 25 ++++++-------
>>  mm/page_isolation.c            | 67 +++++++++++++++------------------=
-
>>  8 files changed, 72 insertions(+), 68 deletions(-)
>>
>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c=

>> index 56d0dbe62163..8accc0f255a8 100644
>> --- a/drivers/virtio/virtio_mem.c
>> +++ b/drivers/virtio/virtio_mem.c
>> @@ -1243,8 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio=
_mem *vm, unsigned long pfn,
>>  		if (atomic_read(&vm->config_changed))
>>  			return -EAGAIN;
>>
>> -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
>> -					GFP_KERNEL);
>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, 0, GFP_KERNEL);
>>  		if (rc =3D=3D -ENOMEM)
>>  			/* whoops, out of memory */
>>  			return rc;
>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>> index be160e8d8bcb..dea27ed24f8e 100644
>> --- a/include/linux/gfp.h
>> +++ b/include/linux/gfp.h
>> @@ -423,9 +423,13 @@ static inline bool gfp_compaction_allowed(gfp_t g=
fp_mask)
>>  extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>
>>  #ifdef CONFIG_CONTIG_ALLOC
>> +
>> +typedef unsigned int __bitwise acr_flags_t;
>> +#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA
>
> Would it make sense to define ACR_NONE as 0 so it's more descriptive th=
an
> seeing 0 somewhere?

Totally. Will add one.

>
>> +
>>  /* The below functions must be run on a range from a single zone. */
>>  extern int alloc_contig_range_noprof(unsigned long start, unsigned lo=
ng end,
>> -			      unsigned migratetype, gfp_t gfp_mask);
>> +			      acr_flags_t alloc_flags, gfp_t gfp_mask);
>>  #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_nopr=
of(__VA_ARGS__))
>>
>>  extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages,=
 gfp_t gfp_mask,
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isola=
tion.h
>> index 7a681a49e73c..b61bca909ddc 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -38,8 +38,19 @@ static inline void set_pageblock_isolate(struct pag=
e *page)
>>  }
>>  #endif
>>
>> -#define MEMORY_OFFLINE	0x1
>> -#define REPORT_FAILURE	0x2
>> +/*
>> + * Pageblock isolation modes:
>> + * MEMORY_OFFLINE      - isolate to offline (!allocate) memory e.g., =
skip over
>> + *		         PageHWPoison() pages and PageOffline() pages.
>> + *		         Unmovable pages will be reported in this mode.
>> + * CMA_ALLOCATION      - isolate for CMA allocations
>> + * ISOLATE_MODE_OTHERS - isolate for other purposes
>> + */
>> +enum pb_isolate_mode {
>> +	MEMORY_OFFLINE,
>> +	CMA_ALLOCATION,
>> +	ISOLATE_MODE_OTHERS,
>
> Since this is in a .h file, I'd prefer more consistent naming, and long=
er
> names shouldn't hurt as there are not that many users.
>
> Even something like:
> PB_ISOLATE_MODE_OFFLINE
> PB_ISOLATE_MODE_CMA
> PB_ISOLATE_MODE_OTHER
>
> ?

OK. I am going to use more descriptive names below:

PB_ISOLATE_MODE_MEM_OFFLINE
PB_ISOLATE_MODE_CMA_ALLOC
PB_ISOLATE_MODE_OTHER

Thank you for all the suggestions and reviews. :)


Best Regards,
Yan, Zi
