Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC62F84F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635131; cv=fail; b=Hcd2mUHUX5Pwyf8pTCMRIlmI5ofyUd1BEUnQBMEQylBTFyvf51rJeL1IFiqJYvOJIv1BOINpne59lDw0FY34b6Yt6G51wxajryvRd8CaxyJEZgLDXcoyMx9MHk6rbpEHHuCIo45a4JjeMdH73i2Rpf2KLwLmPCj7B2c+A58kxAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635131; c=relaxed/simple;
	bh=3HO2zyc2CO5thoSgiQe3psFtP3JTE/NX8jtDg+eq2o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnRNkXPZbkM7tBfmbYatiHhLNVXdlq/Gj/4vqK20+6W7oHflP9Vuhie92Lduk5Giy+pYNfCYMKGPJAFTxTRerHvHXZjB8cqkrSEVL/hX1EBjUOGcjWNfzlbUXdb8Onzp2b1nTRi42OuujCD5WvVVNeukU0xJayGcKndNwMocTxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TV0GzY95; arc=fail smtp.client-ip=40.107.96.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TV0GzY95"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCnQKw6EOWrrno7yoZv/IG+kXASKk4bHLeIAXlo7Pzm6CeCamDziDj7yZ8/P9BDKdpYm52drTtuVmmycK+R2TEoSvBZVblnWGzJrTZLbkr9hzkszI4XypZhkQ/fVVsxxqFVIfsUbUmxozngxmge3DXc//BZlGMPzuQyuHYbuKEpgXnhlTf3HQXI9MKkErNFvMJoxSwp5cc9GLq2/NhDpuU4a0ocKkjj+d3V+IpSRJp4MrjolRjVBBA6ngl5gCzm4F0SagSHbDlPgE7qIncbsLDU9GSKj8kFUJ5Hg0d9x3KV7+Fwu+OR2Yby2H24BYVQlOCviy+VGal9WY/QowCTcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+5OfyQA8kaO0KOgffMeFVnPpffamKANl1iOy40lwNE=;
 b=Z2RQuYTrIzsJyhbV762jYk+WyfXt0psv/GH9SZ9Xf6GSPqFTpHZZF+GVV77NFU1GhuufvgJEuDd6uBqT+PADkw1CUX9g/11vaURCr+OuC3uDrOy9Ko97kdRlA/jt0J4TTtTZpLsbNcpvKK0fTA5SMsur7ZQUGlkg3GP2GSayATsanNsYWDfqdrGBwbH6mEYmn/W2+K0rjB0hY/fQgbqf/SUtRnpdEyOD5T6Y7Q0vRzpaqnq4+j20aSTVATpBAVBk0w/IQKyG7u4d/ayKrmJbkRM6mO87xIIUw54B3ZxFTlRO/+CAbAEbl3Q4DtGraUHGuUKOEFQ5EnRLzbrRNS8Daw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+5OfyQA8kaO0KOgffMeFVnPpffamKANl1iOy40lwNE=;
 b=TV0GzY95gVFoauP/pO34yECWLsdyKiJni5nJfZ1tF5d2rT/nEb/bHMPlxHsT+vmnQkZRPLA/0gqXwmAtjwBaUG8XaDetrKH8g0WhsCROA89Q6b6WbT3mdh0Z9t4KGDTL0bV/CeKM4zfQtRi4mh5EYgd5VMpBQKOsn56AKJWqjlm/sM9ImE1WUHxUTvAyauNg8T7+ZM9lT7/plzJxQ1JIbi8Z66ekfUu4Y+oazwcztKDmEB7wsy9vRtwb/rJhpE9XXWnkkGzrQs+wZhYJZ1rt1zgGLmT35/QsEhIfwzD6H9ZOD5cJR/qnnPVMJLhZna5b9PRKCtXUiN2nGUfyDHht2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Fri, 30 May 2025 19:58:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 19:58:45 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Fri, 30 May 2025 15:58:42 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8C1EFB3C-0F1C-46DE-878A-3546A86A141F@nvidia.com>
In-Reply-To: <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:208:a8::43) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dab181-ae27-4f2e-3d58-08dd9fb4628a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CHaqhzxRuOnfYIlRVr0OCYiYbK2170fazbSRX/8drz0LLBFE9BEPCvtKdQlZ?=
 =?us-ascii?Q?wEl3KItimVd3pzcMqt0ti4U5qs5CTml/lpGuTMQJRebzn8kFG/AVf/H+h+Iz?=
 =?us-ascii?Q?7HdTeOVpl1Zvf2Ih8C+vmR2GBxypHCrEfxQg9Z9kRtklsRfx1iE2djI09Vrz?=
 =?us-ascii?Q?aBY3jFmaN7a4Eupchx9rxp/N/Mcsfsa1BCOT0LnBLjDIojIYSrCws7E5fitA?=
 =?us-ascii?Q?JuWlZQ0ijLzJDBaI3YqjU3lht6JVcIoGGih4iB9uEWFn05S2qcR/i5Lef4+n?=
 =?us-ascii?Q?CPRejiCrybDAu0lC38C/vpT/8xUw0Ehmbk76A8HoTBLdC0ajLLd6i7RVUGpf?=
 =?us-ascii?Q?l4gExskmBPf5L4g/vKAW0f5zOPy5crPa14+5dHF5A53wJf//Uk9eNPIQlq1U?=
 =?us-ascii?Q?X0ZprIS3ijdPgOshQ3cg0JFZVLchgtulPXqoFgRIHUNk8Ad5TLIFLU2l9PLN?=
 =?us-ascii?Q?nl+L7jcSc5UBa5OwVXM8Q7dxAiImmXWfPqYzddM+dnmstQW3P2oxDQveGBOP?=
 =?us-ascii?Q?fPcpso5qPtK18MpgRsdevE1+At11/TfzfQbncUgmjMd1KIgC+4Q5q9r7R/+E?=
 =?us-ascii?Q?hpnR/r86EA6DwqS1uZgTFhvL5mr43EYhoR6DZGlywq3U8Qp1rDuy8Cm5wWkZ?=
 =?us-ascii?Q?pbD/Ki8UNmlLFonScX03LoKPQY7qmHbsVY9/yn0EEzdLt9TU5marYqbbOq/0?=
 =?us-ascii?Q?s9QtkU5MuPftztr8uf/W/PaSWMPLaQ0JwJlPgSK8T/EgRfDFFmvCTgRu6DdY?=
 =?us-ascii?Q?w0zYtrMyJogawPHTuaZNeTYWfPUiSDvW5TuPC4wc7OfY5u4j8PG3Yf9bw8LU?=
 =?us-ascii?Q?l0nqnEWUC9k0bEAcBHFknvFrUWQfbAJscFpEiI07gOpgk29U5x+YtPpSd6Js?=
 =?us-ascii?Q?FQzIaWHWmYHM+bzNVhh0bhOFB65jrywzf/OqbxNQGogvjLv8UdTJA3dCAoz+?=
 =?us-ascii?Q?zN15aS9pDaNre6iDi0RJ1B35wU+/zQex6Rwiv61FQPMYZzmAZyMC2zGn0vOu?=
 =?us-ascii?Q?LxNf6PspfIuh6ka33nDlVq7ruDPyPb/iGNP2f2N9632qaIvj3vXGPUNX4moL?=
 =?us-ascii?Q?I8wBB6msWlaFsllnEJ7ME45l1EygugwjYl8rRDwMnABmGwIBUrvcFOvRGy79?=
 =?us-ascii?Q?X5XNGDpp63wHnkLZj9hGZl+470tTzUPN370WbbsQ14kml99FlobPZ584DWch?=
 =?us-ascii?Q?anzmNiPTz5Y1IOmJx529X80mZztTqs/kX/Hxc+hCBILTD7t/U1GZskaoQi1X?=
 =?us-ascii?Q?KFl4F5RnnFxYg1tS86HiocE5E/FnINOtlVDG6ug4zZt9xDGmn6VqMOiKOY/z?=
 =?us-ascii?Q?tRcwfRaKKtzDUnd+OJenIqXuFs5k8CyFo1qDOe6LLhZDpWT/XXlt98WlDzm2?=
 =?us-ascii?Q?bDM9MDTc4rVf9i4h1dyBWsszbngtkEaCXSOpTo2ws2m2e9evam37O2SsvuY1?=
 =?us-ascii?Q?XXoIZXPZxdM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?65mtHgybvCMtxn+PiBH/LD3dP/nzErNDUM5zOCee9ooO/qWG0TyXChK90h5e?=
 =?us-ascii?Q?cFfo7RSKovJAICuwHwr1z3oECACwjUlB9xcE5CUsHTagW1WKdaTe3fiKcxa+?=
 =?us-ascii?Q?UgcNkEbso0APFJt0DdvL/TqIVk4E1r2w8u49r1cF25J7vcBIRcKZkno/Gp8N?=
 =?us-ascii?Q?CRoVugjNM8F2GjIeJ74QJiQnwLTmtouCeBwzriuzqGyC+WszluY38anNoPGb?=
 =?us-ascii?Q?4fOv+n5rmUWC+cXjivUvV/YN1DJffzEd4n7/DTCYSj9Zz+FpZ+/FjqhOiSMY?=
 =?us-ascii?Q?L8elzMCK+/9bdCyEVju790TltGW9UTm1M+TrgBbwL7GEGQtm5u+ctddGBBeV?=
 =?us-ascii?Q?6y8szPch+EkVyX+IcheEJQpznGNX1LAbWi/E31rwQ2m7iW1GArvdnaz3VGfC?=
 =?us-ascii?Q?TTvYIHFaE8ArJl3K8jsnof+RkpxcJPvxdLTxJp/OfWWuF3Xwpmya1/W6Xpgs?=
 =?us-ascii?Q?V4YNscf/oXX9Bl3yTr85myUsJXB8RdFlioQ4tgIMEiUjwgyEsV1XBFP9WdH2?=
 =?us-ascii?Q?BDuSQlGUA49ELRpViGQEu/cqd7wjcOJGK1+ukvAQLDl03bynY2VHw4lrBCVr?=
 =?us-ascii?Q?WVa1z8a+EHgMDPNWlHdxBrMS/h9TUS8na3hEh1TWsIyTeNL957Ualk29iZbz?=
 =?us-ascii?Q?ZmkMEpj6Ve8OrCPpBi+8ZKUCBZE6FZuRGfUL0ImXI4HHERBhxOmR3Te8qxsg?=
 =?us-ascii?Q?p1R+BxzFneirrsfcS6tzke3itCV3gfhAIGtuzMHt0zZxcsdF7gqutD6ch9jS?=
 =?us-ascii?Q?1bu0pNJ5adLX+xsxo4Tq75BLOpoJGMknLx2jax9BJsmJqZYMcS6DiC1OB6zp?=
 =?us-ascii?Q?N+RRtPGIRVbauZQehA1KdvEEH9YwvYE7q2xOKDmlrKs0CX23YSAeYU9Qgx2B?=
 =?us-ascii?Q?2GZ7a33nk/bRVmkIRrYF4tXeutbaWXjhamBsKh+XsZ3k5uC7nyujP7LMSO+i?=
 =?us-ascii?Q?5Gu4OZPNC8YOKUc5pQLxFoRGJ2q1yXqcRdJQ7pgkfBSWkOsSpF0Vcq6qF5JQ?=
 =?us-ascii?Q?zaKbaJL/K2FzsBrO695Sz3lnpffWhU1rnarer/iik/7bMhOXBlEikoLllwqA?=
 =?us-ascii?Q?O3u7VQ1R2kkmo+yDrZTQETtTBwSt3x1pGp2XHsnds4ZZ3uVw9l3fFSNggMVp?=
 =?us-ascii?Q?K7amf2RK1qnWInL4EzdXHd8ER5lF/2/ZSPxiOmn5UN5DLI2GT+fEyTeGkBPa?=
 =?us-ascii?Q?ZjW8LwIo7V0F4xi7e8NX1786wETy8aXExlHyzvAVnpLPYpILKMkbWYfZaiz/?=
 =?us-ascii?Q?FT6T5Po9fLlLsTrHk2FRahlXxgjJVpeZLT5Ohmu7vK33IkxHypCHRxUGhbWt?=
 =?us-ascii?Q?2SMH3cdXjZxwcqf5jQc4W9kWrlivWQaGfnAhg+yyOEL92lqwDhpJCwiBWVKR?=
 =?us-ascii?Q?I9lkuzG3PF5cKn+xnLYIDAHJkwwDj93pL0+5wnXn8j7JycVSZG0/yuHH2Vh7?=
 =?us-ascii?Q?8j45M+3UUi1VKhvHQomszcXIujIfT8NcsYvhkDTjCXidOUkZOQv6iGK2g+5R?=
 =?us-ascii?Q?lPSHDCXqJPjmziO44u3HceQhe9f2AukCG9iUilRwTkcHL44wuldREDkOFGF8?=
 =?us-ascii?Q?lvzeIc3YTaGeXXW/ZUtQuggbVIO+xuF/vcgV9fcj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dab181-ae27-4f2e-3d58-08dd9fb4628a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 19:58:45.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUAv5VzHYYlyOKIS6BxKO1pBFmXEvo36p6rDMJkG8eQgPUfEE8KAWOGsgf6AgSwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452

On 30 May 2025, at 15:56, David Hildenbrand wrote:

> On 30.05.25 18:22, Zi Yan wrote:
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA=

>> allocation, so adding CMA_ALLOCATION to provide the information. At th=
e
>> same time change isolation flags to enum pb_isolate_mode
>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports=

>> isolation failures.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> enum acr_flags_t to tell if an allocation is for CMA. So does
>> __alloc_contig_migrate_range().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   drivers/virtio/virtio_mem.c    |  2 +-
>>   include/linux/gfp.h            |  9 ++++-
>>   include/linux/page-isolation.h | 20 ++++++++--
>>   include/trace/events/kmem.h    | 14 ++++---
>>   mm/cma.c                       |  2 +-
>>   mm/memory_hotplug.c            |  6 +--
>>   mm/page_alloc.c                | 27 ++++++-------
>>   mm/page_isolation.c            | 70 +++++++++++++++-----------------=
--
>>   8 files changed, 82 insertions(+), 68 deletions(-)
>>
>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c=

>> index 56d0dbe62163..6bce70b139b2 100644
>> --- a/drivers/virtio/virtio_mem.c
>> +++ b/drivers/virtio/virtio_mem.c
>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio=
_mem *vm, unsigned long pfn,
>>   		if (atomic_read(&vm->config_changed))
>>   			return -EAGAIN;
>>  -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>   					GFP_KERNEL);
>>   		if (rc =3D=3D -ENOMEM)
>>   			/* whoops, out of memory */
>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>> index be160e8d8bcb..51990d571e3e 100644
>> --- a/include/linux/gfp.h
>> +++ b/include/linux/gfp.h
>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t g=
fp_mask)
>>   extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>    #ifdef CONFIG_CONTIG_ALLOC
>> +
>> +enum acr_flags_t {
>> +	ACR_CMA,	// CMA allocation
>> +	ACR_OTHER,	// other allocation
>> +};
>
> Hm, enum !=3D flags.
>
> If you want to use flags, then just have ACR_CMA. ACR_OTHER is implied =
if not set.
>
> And ACR_CMA would then have to be "1" etc.

I have a fixup to change acr_flags_t to acr_mode.

>
>> +
>>   /* The below functions must be run on a range from a single zone. */=

>>   extern int alloc_contig_range_noprof(unsigned long start, unsigned l=
ong end,
>> -			      unsigned migratetype, gfp_t gfp_mask);
>> +				     enum acr_flags_t alloc_flags,
>> +				     gfp_t gfp_mask);
>>   #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_nop=
rof(__VA_ARGS__))
>>    extern struct page *alloc_contig_pages_noprof(unsigned long nr_page=
s, gfp_t gfp_mask,
>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isola=
tion.h
>> index 7a681a49e73c..3e2f960e166c 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct pag=
e *page)
>>   }
>>   #endif
>>  -#define MEMORY_OFFLINE	0x1
>> -#define REPORT_FAILURE	0x2
>> +/*
>> + * Pageblock isolation modes:
>> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memor=
y
>> + *				 e.g., skip over PageHWPoison() pages and
>> + *				 PageOffline() pages. Unmovable pages will be
>> + *				 reported in this mode.
>> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
>> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
>> + */
>> +enum pb_isolate_mode {
>> +	PB_ISOLATE_MODE_MEM_OFFLINE,
>> +	PB_ISOLATE_MODE_CMA_ALLOC,
>> +	PB_ISOLATE_MODE_OTHER,
>> +};
>
> It's late on friady, but it looks like we are duplicating things here.
>
> Let me think about that once my brain is recharged :)

Sure. Take your time.

Best Regards,
Yan, Zi
