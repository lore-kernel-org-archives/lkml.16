Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F118DB16
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935014; cv=fail; b=XZg6abm2QfyxiOVytiH+t4BTNesA+AOQq9/AemwPlw54ulHfZu9k+cMOvfF4od3EWQK+nEYMFvrCof+u9fNpGd5x5TdDHKN9ZTYzO04IPAOK80ovkeWF8wpseIQ3fr3tkT487qlF4eihPIRDG33ert7cJxkA5UNW8huK+cU4tx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935014; c=relaxed/simple;
	bh=UxMMR+QdOOY/vqZ5H4+0GpLt45D0elMgW2TnFqzpKOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lqo93h4sgeUQ8FdBxF1RaH9AirXnYKcv3HnT/m3H6My4gTIRcZnokQJ5H5EbFQUDqVo8BoFQ0Wsj9HSqkXF06TE7pt9XAClnYerspv9HxPbuqshI4ElT1czvEFEo9rZuy3pnD7hItTeme+jHBQOTnzZmAtM48hMp46bKHCqatMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AtbkB+zm; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AtbkB+zm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwOMcfQDVp+q3vZ+CxbUc2y51sLotHqrhmtxoA6mW5w5gCGCnE/9T+IfrCiOTwDWyqhA/BV/gJoTr9xh85ap0fR9e7yroTBCFeChFI55K9oaLMX+z2MgFRAzZJ65BYyzAukFCs7jRouFXrIMfqmCf+8B71hgIj6oWaJLLUbQfRdqOj8wj9byM2sGYhBj6QY8B/H0plZL9me4s3NeMQ+wItWq0liq44IYNtBEn7KGtSGcuD26y9ziYUPT3cbnzk3iDpC5ZSYlYK07wQeW+FWmyzsZrFWLEFLQcOykuQPpMMlSwCojdI4YdKO3KSHeNxwiw0/VanlH0lfYl7N+nD2B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbJ5aepG6vGMTM+PRIXfVALBap59JIIydexljlcS1AY=;
 b=Q5Wq4YfV1pjxMe1oRAWpRg9w40wZkY06MnYrOYJsxPqvetOy5xelB0q9n4IsNZI8CWonAyZdNGD2ShuYWz5O3WSRnjMLuBaoTJRXLv4VQvVCYxmZmBnPlTfgIiRnf97MXj/zrUxENZDa8ch+YUqwCrOvkC0m4uARLRLGlORwOARylZS7ZEO6j00StYt0i65VyDvDgG1ngPRO5oKcRxwLXKgQj1tao34EfzACwxggesSblnay7WyIpy5rZMZu8YN1ntGWWkmBugm6dTastB9NS4rmILdjkE33hIYT9Uwq1ZGLQpbLy6Y5SZmZ/B6Z3ajuW3S+OUWgASroOij97M1FLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbJ5aepG6vGMTM+PRIXfVALBap59JIIydexljlcS1AY=;
 b=AtbkB+zmhxMNTO2lYY+HBlqEzleZMoXUjzaUxnQexaCsFTbHXQwpdgTKlSw3NBrUQoeoYTbUWQRDLHvxohkjNq12McPcOBJ6OFczi7bMVU+1fkJlc9+lGLTorHK1p8tR+6HVvRvqWPtxzRg3E1lrzONdYDzDt6//TToh5VGsQ4lDAG2eWgv7suFzzfdrC/qCUQVBGlQ7QdiFjA1v4I5OP3yZUadvBUEHaAH9q3N+vX3O6OfhheCyGQ+/dc4YP61S1VNUv47Sx2lCSElo6Y51jKDlGHb/e6c1J+20RfpZzG6JEkQy9843rVJsIVl0VLysKbO0IP4tYLeRB7a5wp4qIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 17:30:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:30:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Thu, 22 May 2025 13:30:06 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
In-Reply-To: <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
 <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
 <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:208:530::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd6e492-3d55-4104-3b14-08dd99564c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VW3912SDnieME8hnuUJ1voZCBRz0syL5lsaKt/BjqFtjigNjHGktl6VMafGZ?=
 =?us-ascii?Q?uYJxP1WpcbAHJz5ko8kj2SPIx6ioQx2jvReF+PIVy+9ZXJytjjLw1z4nbqvM?=
 =?us-ascii?Q?qISL95rKCUEHgVujNSZxpk2Gj2GJwFjuic00FgXapM6mAWGp3Z2ZsR5yPlCl?=
 =?us-ascii?Q?j5rO1Sbr2MSQmzlMIkCRlId/x+uAsZY+Rqzre8juhsgh+UZVBnbRMdXMq+Gi?=
 =?us-ascii?Q?1TB0GwrnUzBHNcH2yHVa6BC+QjnJNC9hE3ugwAmJgd5/L9bnXFIWuSmYtnnd?=
 =?us-ascii?Q?gDd73ZWCPZO3S7poUtNmYTd/uAuZoh/Vd2Asl0GH8cGYDzOw6MsGsyUQhmlh?=
 =?us-ascii?Q?+uToEccdPvyqU+6NRKnYWj5oJFCYjPUZSyJ8t+dP6B7KbRM2hWjuKHv+KG44?=
 =?us-ascii?Q?SWAbMfNxjKtEy/OitUOCzg7eR4v6Z99OXthoqAg6kTymYUPFkPnA0OSRGTsT?=
 =?us-ascii?Q?U5aFjoNAg9z4a7SQ2FP42HVVpWvrqCXNUNHujqVNrbzNYwg83ZGJFvaoQyqg?=
 =?us-ascii?Q?0uetI1l+X1vVvmLrMmyl+sKRCgFpG1qqXkohYJBrWeiFYeFqmKdXzeEDTL3e?=
 =?us-ascii?Q?cciR1x90JXWnGSbKZLLIEr1a9Qg9EN1G43zlXCYgiofl26pRUxNiHYux9Kiy?=
 =?us-ascii?Q?3c/q7hnbVsm18owpuF9vKREX+eOoCDIR5wnZwsSjgYPvsIJ8p8nEuJ++e8Lb?=
 =?us-ascii?Q?Um3qAA8hpZR+w7/6/bEVIC+x+D31aYBcv1mcyjodbZI/z2GrAxXASNQnN6Tb?=
 =?us-ascii?Q?1hWAhruk785YxM+3JbuT33EeWVGPYJKya3YTylTdVKf+HXfKasrUSR5V0UHp?=
 =?us-ascii?Q?xofx/awbTcjIzkpE9436MklzRWf8Naqg7aJeXUqXVkVKZMVivBKUBrkQFbtz?=
 =?us-ascii?Q?m6LRie3plfJgv3wPUVTmK5CFfDL9S7u2ThN50Rn4YNR10Nu1kXXkqwFLCDBV?=
 =?us-ascii?Q?XlO9CP2HzCLhoI+wHJbU4d3/SaxpOB0JI29hip9x3RLumK5KR2zNL04bMg84?=
 =?us-ascii?Q?fa3f2FywtsVQiEtbfV+01T/O6ESZkyQrKTUva5P0VYKUt5BVVKImIXMXsu+F?=
 =?us-ascii?Q?wrHgRiEw5hzp5TWj8bQMX+jk5lNATctBmt4JpXc1QK39oF34fMFTAHmGnCmh?=
 =?us-ascii?Q?9W8vnrK6X3JMFtWgY1jpndVvMhbCbnYLPC5dhMekJnm14jh3OZ0uz5m79vYo?=
 =?us-ascii?Q?9334tGCVQv9vKwu20pZ1iz92yNXH2DI4eQdBqFpNO/Budk9E03W4tozZYGPs?=
 =?us-ascii?Q?e2elSV57LZVjLAINyUyo5r0BbjZ5MRCJfL/NXbpQNhCzgfWigOrRxL2ZWySS?=
 =?us-ascii?Q?CowU7mbXoGC26U5I0menVkB0meloDFdd4pq2+YYzUGr2wt22GBT9QepZeG6b?=
 =?us-ascii?Q?Y3gJu5Gs0JzWXM3GHg67up6f+okHwOBQgAvNF1kZlAZZv3HDe6u2snsmt4qg?=
 =?us-ascii?Q?HH4e/Tfogs0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A6bnIISYZsdkAGjBq8YPiuf2tITMlbplYi9Dpga8uE/t2g41Mmnks3Y+fzS8?=
 =?us-ascii?Q?8nQpYdAevEvn4G2IrgPnqx+5x6NLRxbvgPZAbOnIaSPixHd6B7MzJXDo51IH?=
 =?us-ascii?Q?8gJC+qpwxTHJVg3bo9O810TtDoMPhLQoqZEcWFnLzJoQ3DzqOBtCNGt3WLUm?=
 =?us-ascii?Q?6b6uJs9PPMeicKVshq6rOcIsPC/IBpOSrnXzOVDDZURRdSSTxZyMHuz844lx?=
 =?us-ascii?Q?2lqq1YqZqMmiIZOBHtyrQJtC8E7LYgiloOpzvbgkRwywzIF0UtJmM6CqA9r7?=
 =?us-ascii?Q?ascF4BWS0zvVAgdLUlnilAhzBtKzey+vhaZYoDUFlj1CCo5F+4Yx8bMWLVkm?=
 =?us-ascii?Q?QS7sckbueGiuNyD8WHK2+4RgYG0oIoGCLsuZ//zINrrORWrOiMzTSqOEDIBF?=
 =?us-ascii?Q?0/8L39SfT7aLz2mKc6kU6SC+0UYwZiTvd3BH9tzn3B5thEBn+bpdH4z19Eoi?=
 =?us-ascii?Q?Zyw4PtL/305VfuRcKLehSJCEgkEhOt+QSuuZBXiNoduBBYe/Ci07XlFWAliW?=
 =?us-ascii?Q?JAP56kByDVowp/jycFyBIaXC4v5q43bVMCi43WYOFwKAAG/JQkpDrKcE8mS7?=
 =?us-ascii?Q?+jYGcWRpONaqKsLpCH60hb4MHt4b+/msbaRxULtKKpBTvm4BmcjjfasJE598?=
 =?us-ascii?Q?ExW0XJuhfMidLeWse6EViLhFJAcdu8h4NltKITXUr01WsBHNQsGU2qwoVxws?=
 =?us-ascii?Q?TRNsfmn/22/UFy4SNq7dXH/MdxJTigcE8osaoVsv1MkuJytf6EjfVD0fdi6W?=
 =?us-ascii?Q?vmGm8UjVXyKqa5Vj1y3cNlG+KXUNM0yDLYd8MUs6kPmxqu2OPogJPsWu3tDh?=
 =?us-ascii?Q?X3N642hYfXOB3/M67N0BUw2PvJRiBhgI6SrKXIP8ChF6GSQ6M59qqf1HOlfd?=
 =?us-ascii?Q?mmNhmhqiXVSfTbjA44101wVBxDjTGmswgYe41cdZezpTzXZpYbYCM3hDNnoD?=
 =?us-ascii?Q?GDm9Seaz34LClNDAy9c6clpzvr2Ub0vP1oQEXx55RRAlXZapEyVDdMC0GS9+?=
 =?us-ascii?Q?ZDW0Oj1Rg48uLl4+7wEgnVp1FLAvWe2TrxiYCiBP7ot1nBiskClTtNBJJNJD?=
 =?us-ascii?Q?4YrdrtMtpA+zS5BDnC1JTnLRbvr06CPeVKfwVDdJ41RYgzpI/MresgYf4iZU?=
 =?us-ascii?Q?FbvP77nlgWYNmNRYre3EC4dDPG4W+8vIQj0gjVIs3u8GWDORJkHtiln5CcsJ?=
 =?us-ascii?Q?gIpZHtIWp5Twr77t9+q7PGzcTJsx8i2EVXF7d8U0ANe3u4JCBc5Kzw4trbO4?=
 =?us-ascii?Q?EruL1AZct68fPKNWq6OVcJYPe6Rz+0+dCQhzGfpHYDsBtjv7HK8/FC9PHtU3?=
 =?us-ascii?Q?Yu1LAdqwevfx/u6S0KEO992cw3P5jqBQTPM5muD04s+ZNU6Ege0lLJ5hU7to?=
 =?us-ascii?Q?2Cm3Z3nNU3xkQnVtInwbR/5LW0jLV8HBQdagOkoe+D2uvmF6bsofeuTrOCgQ?=
 =?us-ascii?Q?UVVvFZc0/ZLhNagaDi0Uglcj6X8/BjUdNc99FcKOFtaS1vz5mw+b5dGRTe7v?=
 =?us-ascii?Q?FM87EiQBeUHihQbyviNQujwsTEI+YM/bh62cl9KTSsEofmlNQEHw6luUtCBX?=
 =?us-ascii?Q?dq+vOWPSfHRIX6FsUnksS+OnGrEj5vwMU+xCgs+7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd6e492-3d55-4104-3b14-08dd99564c81
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:30:08.7591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Cy2I5ZP81egPGuNkdSmVIwTPWUiG4ay/3JAMvns5gb8aXDskafXNz5Nk1lH0gj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

On 22 May 2025, at 13:21, David Hildenbrand wrote:

> On 22.05.25 18:38, Zi Yan wrote:
>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>
>>> On 22.05.25 18:24, Zi Yan wrote:
>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>
>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>> hint fault handler as and when they are identified as
>>>>>> misplaced.
>>>>>>
>>>>>> Instead of such singe folio migrations, batch them and
>>>>>> migrate them at once.
>>>>>>
>>>>>> Identified misplaced folios are isolated and stored in
>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>> handler to migrate them in batches. Migration is done
>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>> a threshold.
>>>>>
>>>>> That means that these pages are effectively unmovable for other pur=
poses (CMA, compaction, long-term pinning, whatever) until that list was =
drained.
>>>>>
>>>>> Bad.
>>>>
>>>> Probably we can mark these pages and when others want to migrate the=
 page,
>>>> get_new_page() just looks at the page's target node and get a new pa=
ge from
>>>> the target node.
>>>
>>> How do you envision that working when CMA needs to migrate this exact=
 page to a different location?
>>>
>>> It cannot isolate it for migration because ... it's already isolated =
=2E.. so it will give up.
>>>
>>> Marking might not be easy I assume ...
>>
>> I guess you mean we do not have any extra bit to indicate this page is=
 isolated,
>> but it can be migrated. My point is that if this page is going to be m=
igrated
>> due to other reasons, like CMA, compaction, why not migrate it to the =
target
>> node instead of moving it around within the same node.
>
> I think we'd have to identify that
>
> a) This page is isolate for migration (could be isolated for other
>    reasons)
>
> b) The one responsible for the isolation is numa code (could be someone=

>    else)
>
> c) We're allowed to grab that page from that list (IOW sync against
>    others, and especially also against), to essentially "steal" the
>    isolated page.

Right. c) sounds like adding more contention to the candidate list.
I wonder if we can just mark the page as migration candidate (using
a page flag or something else), then migrate it whenever CMA,
compaction, long-term pinning and more look at the page. In addition,
periodically, the migration task would do a PFN scanning and migrate
any migration candidate. I remember Willy did some experiments showing
that PFN scanning is very fast.

--
Best Regards,
Yan, Zi
