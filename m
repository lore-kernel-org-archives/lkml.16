Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6117E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747526855; cv=fail; b=ug1X80SJ08icdCYGPIbWG1mvI0+40UtYe4iYDhvtT7bu4ApXhUQagGxk3ABDf3Lez45zxCnrB536awjzuRIPHPfzPItyXBlyVvHCav/sUxwyh9uQpx6qhbkZq2eFUCkYSldfJtO8IeT/baBjPzyBlvgku0allkd7jV+xV0SspGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747526855; c=relaxed/simple;
	bh=epgR2MFJIEV+dv31BTFylVdT7KDP5m6rROfhIdvNLZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VLI+HYICwZLH63ncgscsajyklJHL15qRhKvMLO/KEtThhANGe1/N9+Yf7dIUV0pdT3Bq4y83WYNu30iW2NqcJUfUvdKFivmYGtIPvC6XMjL1sLaQIgah0qf8wLk8jpKH0C2qu9hZUTE0sI2LBpFu+VvHIUoxR/HSu6LkzsR0kbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qo1ypBbU; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qo1ypBbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP0K8ZiXJnTlwcaVjyXVwAbxjtE9mUjCvXJ+ryltTb/xw6yEZFa08dQy7Ihh+DYpINC27i82WjyQQo64NrKk86CFJXhGQMKVXE/Olqhem8KIbCR6blL2ca66Xdv+fxfX5wqfVHoo/awuPQxvQWO94lDiVrzjEDjA7Hw7hwG0YaPePqVo2mhnMU/KV8TNhORF4ehatsqXcwNE56S/SWw1U0jg4CjztmVNjaLyQBx2+uSbkHdpcadnZRU3WXVFQ+B2H0jUjnC3Gn/TNLjb/DECEWzMsRrpwVIGfM1wgRzQkNks8qkwcdQG3YASB+cw/6/mLz3Ikx5ZoW62waY7lNtZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epgR2MFJIEV+dv31BTFylVdT7KDP5m6rROfhIdvNLZ4=;
 b=kW8h7NHqCASIRXDwry6f++DxrDfn8zJPnWX1XbyTTmNt8VfiC2dmI+J2+D2Bhr+ifBfO6TmjjyFQACfWeONA1Evg+hawkqx/+VSJ5+Wl1bdLVXV7vukwFzLaKQJa6eTLXzLVTTBkZi923ub1QdDR4aDCP2RE2H/3cqj0QdFXKVpyrNcXfkaBZAYAV5XQJ7WFBPePeIqgDhxl7L43qlQ9xgobJbIXdBIWqlUInTVx0XddcoxzHPFTNrUKlIQhWshU/nqKrq1aPApUnCDww/wUsVm0lOkDwvJRepGvdTaq9GyXr/DIIyGYosrNgFcmmNm3us4dhP5glEedbrBD0+WogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epgR2MFJIEV+dv31BTFylVdT7KDP5m6rROfhIdvNLZ4=;
 b=qo1ypBbUbEeXSLbX/EaQEBcIvaCjUbqzUYgHV35g0rU/RjFaEQzCUT9J4jhOIyyr8Ju8uxaqlBfnPgm03EC+FYlOhPV7kk2tagKMZpapvFVypDFX2WfAxK1q54l70wVbhqlx4Wi0bfE3ms5Kkx2oRjXXWVuD7jrnd7CA8strvit9ceYZzCIk+j5CMvQymQxQiFeKBNJn3sqVCuXQ/Xr7q+r8Zp32YZzveAfAm/aJ6HxVTVfXilXiO4vGe46lkzHocdf+uuUDVV2HftBFwo0DpZNU9DKmgtAXrZlYkJk4NIeMWowOZFQYrDxoC4aPyDte90E1TCQTNU8vRA5qSj2FQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Sun, 18 May 2025 00:07:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 00:07:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Sat, 17 May 2025 20:07:28 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BB5A1C92-743E-4114-BA09-CB8C488325FA@nvidia.com>
In-Reply-To: <72e15406-ffd2-4344-8cc6-1d54005138ce@suse.cz>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-5-ziy@nvidia.com>
 <72e15406-ffd2-4344-8cc6-1d54005138ce@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0040.namprd19.prod.outlook.com
 (2603:10b6:208:19b::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d47310-4c5e-41d2-b976-08dd959ffb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x0wdhmrFAe/8FGLbHgX3RAGvHMzS6nh+kQHHvsX2ogRLsUx0fbYLGRU81RUa?=
 =?us-ascii?Q?uRqRWKLzmf7i1eG1hSckkG5kfslWgHFe287tp0YyxsHgr1Ru+rMGDiP7lQX6?=
 =?us-ascii?Q?P/QRjb8eG7zEEmzcQolqi7kLDEf/9SjBINowj0NordFr17Rw8U+CLqD4Od0x?=
 =?us-ascii?Q?gYLufbMdKALmRtbLe0xSsIzRAs0RiCaTslBbaQKr8HZExpdQySSqki+WGwby?=
 =?us-ascii?Q?tdc1JlIyGgsfxY3ji8/v1IsiN3W30FzJa9XycdJKqlfe376OVKVJIS5onnGd?=
 =?us-ascii?Q?mjBUDDo8BG2RKETbcwYatmTRa+NehtXEMEmayvW8fX9Nqi1sWW4DM+zAbW7u?=
 =?us-ascii?Q?qib4XZtKgmrpK7TlRUo1crDXaq53Fd47N7bN1US03y0Kh0sbLm0oJwZCWJlX?=
 =?us-ascii?Q?htFHPyA7FosfLVC//U20pv1jHnfm0QGwqtUu5NuQQgta8OauKkfshG7dp5gg?=
 =?us-ascii?Q?dz6FG+TC/9mWIz63DmMOXjaS7YpmSfOG6QvWsGpRvUuy1z8dkMWWwFjTJyQ8?=
 =?us-ascii?Q?XUM3GXiLcNL5Tns24K6vpcGyk8djlGFpgXxxrqya8VX9T/RN0OunQ6Fh+lcr?=
 =?us-ascii?Q?F5+0TiAHgMyLJMv26+CNR46s3a+P4ZpUuFlfqa3HpKFmdKU66km1DN8UtofJ?=
 =?us-ascii?Q?oCDnKZSlIhbqD5ol2i06Qxfqske+WEpxaC300Km8HdVeC8rwIbZMAxjc9cbc?=
 =?us-ascii?Q?X64qp5EqSK+TYAediUpDfHWmcJi5cX3fznkjJb1Yztpg0gWHXtYE+LeBHsW+?=
 =?us-ascii?Q?Z7RM4PweUR2GFBrC/E/EwVh+qc0lWAV1tu/49o7DwzE6xLL5KOCe9iIwC1Qd?=
 =?us-ascii?Q?ovv6ndu8YMXhAYfV9RoD1Bea3+9jk1pikcd/5LOIeT5ERMP/HQOa5AIQlXzY?=
 =?us-ascii?Q?EBS1pa1trXjlb5GQfi1LcxRznGoRGUvvR81IaKJ4ztuWtTg5Fu2RMF4iwybL?=
 =?us-ascii?Q?AlV9ip/Y0/5M2Zrw2P69ZavCVQjmiVcnM7DuAmjtLfFXGOFbHnbnUSxF04iY?=
 =?us-ascii?Q?hhqDUlWq/h4ZKadTqpQOEfvtwbl7jg8r/i8hkE1Cpm+YY/ij2Qu7V6FoP6Z/?=
 =?us-ascii?Q?U1MZrZBJPiFurZm22lQNM9ennGvfHb4B/x2p6eVaR2W6mbGS16ANFTKVd3Oi?=
 =?us-ascii?Q?tqF1KFjR19xx3i3m9DEj12QnfTSMq2QVk5rIj8UDUfBEzg72h42ESYbzFKvi?=
 =?us-ascii?Q?27fLZnu5YU/rnX6MsunLPi0SOfB0QHsN/m3yJLKEJTsufRPfyTI7G4KQFdnJ?=
 =?us-ascii?Q?ZEnqwtYUebb5UY8H5N6Hf/L9jMjY4QZidv85Po9JUhn3ccmCfqblGgSoU3ww?=
 =?us-ascii?Q?xqQ27vM7By9oM9gaPCPEgFErXYBzrtk0OC0wGj1e2lzSayT+VYoxqqRTbWRc?=
 =?us-ascii?Q?+BLXhMXQ5TkDAaMK5o2gmWlW2ZCNC87vERxQv1ygSKRvSI6Rmw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Wh1mpoXo1R1+FunYf059V7Jr1Tw7uwEMEbPDSAC7D6HCuuzTTe2gk2l9z+L?=
 =?us-ascii?Q?kJF/PHNa30eWYlXfhMu+n6Syq8qJcfnmztgU78WwZXrybKOG1Wppk09JRQ8A?=
 =?us-ascii?Q?eC7tC2AimgsowqFnKp3BMvlLUu2X/2+X9R1Kh5I3Bne87Q/0jhqjhi3pzqAj?=
 =?us-ascii?Q?0oaMpM7N+uRuEUoNBqmd1FtgoMsRziZZhWWafpkovrN3jf/yjeSb3I0qKWQz?=
 =?us-ascii?Q?6dNiUxCiyIpjKtOGJWfTNn+FHLnAy1uMfbNYEO882hhzKegzOAhDK4RN0DOQ?=
 =?us-ascii?Q?0y9ioJOVXHJe5A475rIf/GJDa+AnXtJK7nmJiBOs5eRBS1NiD0GXI1W5X1yR?=
 =?us-ascii?Q?fSg/prdy8vzbUUCyQ/xqZ4iP08WbORJxgZclhPH5ShiuyUU99IeMHQFM1ipr?=
 =?us-ascii?Q?434G09yCq4g+f2I/CJliUMh6fqt+fgONU+Fo5TLaFpfA0/Vv7oyr9bvScg4h?=
 =?us-ascii?Q?m5JP/+hD13/exVg+O/XS7y44DDPdYe2uFv8Pt5DmCxeMvF18SL/k9VIBfL0L?=
 =?us-ascii?Q?LM4dd0GJt5a/oLiENg2ZRp4cEqSXhLy1a7E+Ex6/xiNJndor/d8Q5YHu38MF?=
 =?us-ascii?Q?kdRvXnJqXwucsXiEMziZ6FM23rTn1PXd8bltib38Gt0V63p+VRcNytY8C48N?=
 =?us-ascii?Q?4GUxthRa27XeFxVhf4PVDr34wscm0kaMt0qUabOI4EhkYRb3Nweac+QgHC73?=
 =?us-ascii?Q?5VlYmSECWRepFxOKBJGbPA1nRFH/e8ioyM8QT4ZDn61jrD1dfJNjW095FK+1?=
 =?us-ascii?Q?tD4TobdtrBezFjRofa+zROffRhjVZuJJOXCNXnW+9cBiiE3Irz0t9MQg0Dr+?=
 =?us-ascii?Q?a+cA5p9PXJ5BjAlXRLSnTqVd7GRV/4+cW+yREhomH7xZGLJvkKcMUxaUZr3O?=
 =?us-ascii?Q?tC+FPqu3YaQR2HvujWgEA9++tHwMbNBS/z1RJCOGvKnXsqZfnzOop6hkywtv?=
 =?us-ascii?Q?Az8a8pgRFPoFxvh3r6+ZiQAuySwuwBdFmJNHU0nYrJEPhaVRXV9BhKM9KMg0?=
 =?us-ascii?Q?/m2uE9RaYL+RTnBCJWAPUt7HjJ3tHQbPFIJPycVsSnD9Ay5ZS1SUVs6SMS2+?=
 =?us-ascii?Q?f2VSXdEN3Z9YZlsaYV0KWTvKpoFHjf+0Wgc3PQowYCLoz7w4xoI00tLZo1yd?=
 =?us-ascii?Q?Eq1zY5fPqb7KPx2D3Pftqcj/yHufpKLtS9uHEkm3uwRiKjPEKlyUIsYUEbl5?=
 =?us-ascii?Q?YPd+17Ppy1EeZahBz5ae3Z/33eDAaIpyrNxU96Q+p+R4MewCZH8ur9jrHn6q?=
 =?us-ascii?Q?qm2yDTBzeIAlir3nSi8GWtdrHiuAsF6fsJhw4EzVZgIavPWCp5cHeyAEYpBo?=
 =?us-ascii?Q?aki8QmpYAnG4BsZSuHZAenE8M8Yi3iD/2XAR2nvlZ5/Hr8nm9NF5KocLyMZ0?=
 =?us-ascii?Q?46iQhqZWAO1HM9NFq44sOrNnRoyFbUdUjPaLULTzzoNl6+RRPWNqVMz1q79S?=
 =?us-ascii?Q?Y3+sW+KFKvTIWNGM5ATGuoI1mFy/MS8vccCi6sbSwMF/0ZSNCSOArDXEJli3?=
 =?us-ascii?Q?yJWsHAzDyftQk+3kzsRrv3/2Rkh4VTem9Z8Ds95FvdYCowXubt9esIi8rbvv?=
 =?us-ascii?Q?rwFjMVQDmTh2kjO8PxZOg90tWu7AMz3osFk97Ejf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d47310-4c5e-41d2-b976-08dd959ffb29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 00:07:30.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdyx58df42WkL+mXwYOJwRd6rX60HiTT0tuNxF3WxLe+K7M/CHB4L/G/wjb5nM9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276

On 17 May 2025, at 16:21, Vlastimil Babka wrote:

> On 5/9/25 22:01, Zi Yan wrote:
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA
>> allocation, so adding CMA_ALLOCATION to isolation flags to provide the
>> information.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> a newly defined acr_flags_t to tell if an allocation is for CMA. So does
>> __alloc_contig_migrate_range().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>
> AFAICS has_unmovable_pages() adds the flags parameter but doesn't use it.

Yes, will remove it.

>
> But also, I think having both mode and flags is just unnecessary complexity
> in this case? CMA_ALLOCATION could be just a new flag? Even if some flag
> combinations wouldn't logicaly make sense, this has only so few users so we
> don't have to care to make them exclusive with the mode thing.

I was doing that until v3.

> Also I think REPORT_FAILURE is only used with MEMORY_OFFLINE so it could be
> squashed?

Yes, let me do that. Johannes also pointed this out but I missed it.

In the next version, I will remove REPORT_FAILURE as it is implied by
MEMORY_OFFLINE, including isolate_flags_t, and keep the existing enum
with MEMORY_OFFLINE and CMA_ALLOCATION.

Thanks for the review.

--
Best Regards,
Yan, Zi
