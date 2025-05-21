Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD318C00B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828832; cv=fail; b=bi3sWc1ncSxkIIakONPGQQkckLhTy68Z2KUWFAYsr+izHAeSBShjU7bsQgIg7iolAd2Bhs2p9mglQyvRqTs0+TEiG56tZruHv6WP7Rd9ngUNQRnB2fYrDxPHcj+jm1bde/qgfj7ivaYxQiT2VQ98rtnMytAj7X9xPqXNvnzMVQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828832; c=relaxed/simple;
	bh=8RkWd/JmNve9rD2ZJxn8vDs0801OqeMMSeRLw80Blr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tsKsMAEvkHE/fXk7UYXr7GDqux2J0kz3dNPJEcCou6G64bZyYShj4HdgdxN+WRgIc8Y7sC+pBVF4KTa6GUrfJoDaNfLrEVm+J5MkZmxznQyVwTUds7OJAT+fZWKtuJZpWg3w6do/I4XAtT70cbKrvVt7KLc5VKEzVqxIBTYuhy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pOsaRgKD; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pOsaRgKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6xw3NMRlknWLqbdqQnyST/tQjfU2gA+SHKJ/1p95ViUm9XUV3OSKpYId7+6PGXdabOgB4/IQZDLB1V8b3aPiigbWrmeflLRgUrK/QFaL7BC1xnZgfVxL9r/0prkV5tTIeZwdYphgea5odhVVr9xn4S8cY0jDPhBPp5gUhvOZ6W9LA9Bc3owx68OYRq0/3iljZhXlep3DvQevhpazCjqdyLTR+vFRnrz0ZgY/ZJECYUXlxsD49pQXvzAYgj5wHjAvzQBZfpf43HkKujZUdsLDsLJTFI0XJKNFKJNj6QxmYmzMhD+rVK4ySG7lwH7WJPJQ0xbaxSWxlNA4GAJi55umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8TQv+Q550Gc6fSK+cof8D660gsyjHdlxq7kzeine+8=;
 b=j/JoLhcMFRDc128hG7S6AmH7LrTNxJsEXZLLtlIY7PbI8UD17SKWnVEfpWNFU2VzAoLaNr5jQVA5bKD7OKRRcyUGtteHRO/23KOHSGZf3/dh7cmZsv/kHfMQ2x7KgunBHIxR4anj/s47v4x1aZw2lDvZCvtIlVlqZ0BiU5SKyNO1ui1ddA5/qGDbNBoY/KoM5j5n90cQYHu75deXiJe9rgARxoM2GeWzz93zgitJELMMYhVYwBcz9W9VLkPQ0vtOCLryUCHwnonXVlmrkArbSvoZRMXE1xE4RR3xBkJY6LCIpOTsWnTdFkEQW1nd2WsHF6Ig7GjyFmHlRm8O2cDA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8TQv+Q550Gc6fSK+cof8D660gsyjHdlxq7kzeine+8=;
 b=pOsaRgKDTEROEoyrGkKVe3LeEy6CqscPXcbJFNF7xEhdU69VBzHASc6RNF8tGD36X6sGwJlTsJylAV8iameWO+Nd+Wa4ICMr2z04LZf1Ig3EJp62xzPd5CAfEN/qhjYdwV0U/k5qhZebUwsNVk5X9T7p8zN2JBySiOXL/7oj7OTdteSn6rJef4hsvuWnjXgSSfGuilWHYUVEfLChZJqQvWDLZR1Ef0T/nHBkhMqdzH2xSKRd/F8oMKv0SxVGO2quHV1xOS5tsScywRQIjoScGJCaPOmQTcHLLLh+peiZ06vUtcc8DwkWxHstJwzKcxORgtD2s8nWt+RPefWqPl2QZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 12:00:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:00:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Wed, 21 May 2025 08:00:25 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <B21E6F5D-C824-4BB8-974D-A1BA313880EB@nvidia.com>
In-Reply-To: <c8265d22-5cbb-4211-b91d-87965b8505e2@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
 <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
 <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
 <CA27CAF4-DD4B-4350-90A6-AE9A808F05C0@nvidia.com>
 <c8265d22-5cbb-4211-b91d-87965b8505e2@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:208:256::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b46a08e-dda4-40c4-2c8d-08dd985f13d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sQQdVfRpKTk4Y743fBLwI78rzEZXlFa46etVgoZHia0oAzHqQ7KYRS7kCrmm?=
 =?us-ascii?Q?gEiK776k8ezTad3lFXU6svW2AYtfRjKjRsEr9UqDXCd5w8ERQGcOdSDd5HHX?=
 =?us-ascii?Q?0LPUbd5duY9LKm0R3rcqDXMfgC3pGHP32eD00ROOzvYHsUvsURnXVvt8lNEI?=
 =?us-ascii?Q?68Ql3/q9Z/aV0JGSuYPY0YyPnBoygKJgbL2TfYmHnrSbHHJTj9QyqffOj7cR?=
 =?us-ascii?Q?xNed8tpEBRaxv6CM86jfyEwbcjagQ5WC4COvVLjnH9UWKn1fr2z4Y9aJ6vm1?=
 =?us-ascii?Q?ZX9Kg4llKkfiZ7XikdY0MIqg8FtQzD2FKbRdoOGiBxpXF4yEyj9wj6uEYwty?=
 =?us-ascii?Q?PRCBC4qsx/ZTFQjw/c7yxZ/WVb1Cjfut3uD8C+skkOoWl9zYO4Enk4aSFFku?=
 =?us-ascii?Q?G1szYC9nV0jZiG9bo3WUQ2wd2+YJo+q70Jn/IpWgayY2ySTuBa8GbFP76WL1?=
 =?us-ascii?Q?dwUVUff18iPgfCIn5sx8kIFeGLVHh9J0N/xGfx73WfbF520tgt/c+o2vzPe9?=
 =?us-ascii?Q?a5qcAhFDyEvkDFpeuegrHecotAVFMnMoXXKXRfrP4q1RS7yDPVq4WRmkQv53?=
 =?us-ascii?Q?3Cx6iGQ8gWme7mzX02TyD7Lj/5MOr6QiReISHuJ/OsshT91bbw783Nj2NZ7a?=
 =?us-ascii?Q?tU+0oNak9gQbQyDLVBqZ69vJlbTmHkDYNvE1mizYoLwZE8CVFZ9aTTK3U244?=
 =?us-ascii?Q?ClrZzBMiq96jb17hn3hgIXmu5jhiM8UrNdf4gSXdpRuDlPz260hF4groCH2b?=
 =?us-ascii?Q?Cw5+PgYMYhK1G+y12fQD8bfWC0b2BuczCwX4lY91zPXhddQHrjYjopTPfxh9?=
 =?us-ascii?Q?9+rOST8XLPAusr7qIzjVDwrNJn1IzgbbZyZo96cHMO6+B2NexkUPpkQaYD27?=
 =?us-ascii?Q?6VYyu4cs95OuSMRXZYp73lU0+xcts/CxkA8nhXCz8BDv2XQnmJVgOHY5v1o6?=
 =?us-ascii?Q?hW6FRyBPDPA0g0ncsebxSZNu8x1p38CUvYHs3mGPhLrJKjMH8oU5uhwDLQHc?=
 =?us-ascii?Q?8kLcrqXCKM4tFkvRmzIq3kLmjVof7cQYdm1wVvhrr8R1FT4lM3ZZD+88FLGI?=
 =?us-ascii?Q?3vmlup36xO0MlJ8wvd1OydxmsY8ksI1wqSrVBbrc4QgUBL4FVlag/Cdkt619?=
 =?us-ascii?Q?SPgUceszmIx0QVQdf7NLFZcKQTnlcmNElqU27HwOLCmeLgbR2OnhwvawsK6K?=
 =?us-ascii?Q?DVqM15/TBZodUIFaLWQAu84mAlR97MYSRECvObwnep+ZdYxQWl+9pTyHrHjk?=
 =?us-ascii?Q?t+hEkrEwUf0befGwm5wGrMiOtpguWeb/01dJIzpAATnDieKlG0gJKcU0HNXY?=
 =?us-ascii?Q?YuwAg/4ZluJBc/n6ohQIampyJduZ5oshABYgtmbKNkQAloVmOXjRgyyjrAZP?=
 =?us-ascii?Q?l9W8+kh1fKhWjN9GP1bVSLkaccRfj4dNJK1LpBuX7Qe8uhRqDwVyDY1jpuNH?=
 =?us-ascii?Q?Yj3C0D7azrE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?brDpFTPiLtXuf9y5bcMt4+IeGmfe9FDYGM+OZxwCKEKTq6TnIykEN5eDNfEy?=
 =?us-ascii?Q?HPlHSIhH1ER9Efwb1+iExqBhlvlCMJ/OoikaZkKvHfkSNH/lAttJHs+l9BHV?=
 =?us-ascii?Q?qydfA9HudVaOkU0oBLJspUFDaIxYcfUtPhWjewXp67Cz/QSuwjAbwqOudsch?=
 =?us-ascii?Q?Le9njQmTKKfXrmRaVqYbVQEXyp1/G07V00ngZPJ5tW780Cv5tRDpHSmO67zA?=
 =?us-ascii?Q?H/bHhtFARJFmTc2GXUlcyPIE3LFuP88oCYJPA8H1PkDbPVQgtTAblziNIZAt?=
 =?us-ascii?Q?GxD53iVxIZJAQXAWieN1xJX1XjFByzoqGip0WNcRtPZpr/UVgHI09ArGdQvC?=
 =?us-ascii?Q?0+cW12Ji+1a2Mdv9DTzIwETlqDZYv1K0fj+D/k7RCiJeyciBZj5WZAfC2fQq?=
 =?us-ascii?Q?ApwSHg0HKLnE6V2XEYmiynDIPDY7fYtr/a6xc0pSelSowADduh9t+cnRs8vs?=
 =?us-ascii?Q?+Hc0DVr/6KLgUaU/plj/AbI996bC0LNXegWcNk0UF9pmbx4bVNcKWpET5Hk8?=
 =?us-ascii?Q?psNXvn+m1za7bkpGj5md7K7yXnh5nu1GkORRkrftSngYdN3qObN0BrfWQlcO?=
 =?us-ascii?Q?Yr8uruWEQ1UOJVX76Cowcfh+VhYfVY7DRbSNsCGLQ+Ns8XypvH1yjKa4Ho8w?=
 =?us-ascii?Q?Yi1MBWFd/c6a4tLg/tUvYxo6p95xx0HyrKo49Or7GWtdUeA5Igc6sT/nR4/Q?=
 =?us-ascii?Q?jDR/urKsBWehIfVzgiTzCrjRjOrh/0hKJyG688VKRuNdkfixvHdcYpPa7zy8?=
 =?us-ascii?Q?xKRwOqDTwD/d3ocJKDpim3UFKEYD5IrpSctEcbm+96QXFXz8YAQjuAYShdLp?=
 =?us-ascii?Q?2dXvTzQqYLT+4I1jcPlG9nCBInAQ+ve5lYba11xRB3fAf7En9KY7ePraDW7y?=
 =?us-ascii?Q?AQFBp1RoworvlpO1vUq859A1uaBhEMrUM/FTwkaX/epYlquVyWozz1XFg7xF?=
 =?us-ascii?Q?ztNDIik7yAXgt1J4DrxUvcqgCpw+qwS0DGS4s3Ig2IXMNHJklsd7HU5ADWi+?=
 =?us-ascii?Q?QWNkhWpfBPpMK6OukOWBQmVgWaFuJxgXKhbUe8406ArWEi00Keh3WHplWbR1?=
 =?us-ascii?Q?LPDBbwYPeqqS5vYjGwrkt6FKQHwQGs0K1PrXpFWQ4jyPGd75SbtUVNbnc/Es?=
 =?us-ascii?Q?e1v2FcpF4ECmThf1X3dOGYJBPL+S1pJPNwwNnphOvt5sMUHwMJncFlCCDqLY?=
 =?us-ascii?Q?bJayVxfRX06NWPUbhWm4ci3gFfM6LcxTlIuz3Ne+pkzNfhugD0DfyHYZIc0V?=
 =?us-ascii?Q?VSC6VPjLuAUL/jEsXiDYTrya++K99iC8WxjMUIhoeuoqEPkhQPDTTdsNZC2R?=
 =?us-ascii?Q?voPFBcWdhNCj9/VjWJsWXBhenUns+UTQMFidCGlCdf8DZvJIL95ejDglBKh5?=
 =?us-ascii?Q?F0TS82pjIJsZ4cvP/LApuG/VgGIefOLMiUqiRW2vzkNyvK/si9kZ9lf+WblV?=
 =?us-ascii?Q?g/kFFV5KIjAxwbyL35dYCHzHecXd1xwz1xzTtPYs68dmMqpqS8Vw5KiDaZI5?=
 =?us-ascii?Q?mJZTIkDwabBiiVpRCOu53lwRK+BuFfvk+kBhfZgW9IQQipvGigozVVaRJisO?=
 =?us-ascii?Q?TFDq0uR2gnUyCJWNFV8t+25FsGslXWbHsmkpAW4F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b46a08e-dda4-40c4-2c8d-08dd985f13d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:00:27.9824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC2olhX7WBT6ySfoS0hJK/sg3puYOvOlThuODQrO2Ogb/BVAMSEa9A+trJyw8g2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781

On 21 May 2025, at 7:57, David Hildenbrand wrote:

> On 21.05.25 13:16, Zi Yan wrote:
>> On 19 May 2025, at 12:42, David Hildenbrand wrote:
>>
>>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>>> +	if (flags & PB_migrate_isolate_bit)
>>>>>> +		return MIGRATE_ISOLATE;
>>>>>> +#endif
>>>>>
>>>>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how co=
uld you ever get PB_migrate_isolate_bit?
>>>>
>>>> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_iso=
late_bit),
>>>> so it gets PB_migrate_isolate_bit.
>>>>
>>>
>>> Oh ... that's confusing.
>>>
>>>>>
>>>>>
>>>>> I think what we should do is
>>>>>
>>>>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>>>>
>>>>> 2) Remove the mask parameter
>>>>>
>>>>> 3) Perform the masking in all callers.
>>>>
>>>> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
>>>> get PB_migrate_skip. I do not think we want to include PB_migrate_sk=
ip
>>>> in the mask to confuse readers.
>>>
>>> The masking will be handled in the caller.
>>>
>>> So get_pageblock_skip() would essentially do a
>>>
>>> return get_pfnblock_flags() & PB_migrate_skip_bit;
>>>
>>> etc.
>>>
>>>>
>>>>>
>>>>>
>>>>>
>>>>> Maybe, we should convert set_pfnblock_flags_mask() to
>>>>>
>>>>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>>>>> 			      set_flags, unsigned long clear_flags);
>>>>>
>>>>> And better, splitting it up (or providing helpers)
>>>>>
>>>>> set_pfnblock_flags(struct page *page, unsigned long flags);
>>>>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>>>>
>>>>>
>>>>> This implies some more code cleanups first that make the code easie=
r to extend.
>>>>>
>>>>
>>>> The same due to PB_migrate_skip.
>>>>
>>>> Based on your suggestion, we could make {set,get}_pfnblock_flags_mas=
k()
>>>> internal APIs by prepending "__". They are only used by the new
>>>> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{=
skip, isolate}().
>>>> Then use {get, set, clear}_pfnblock_flags() for all migratetype oper=
ations.
>>>>
>>>> WDYT?
>>>
>>> In general, lgtm. I just hope we can avoid the "_mask" part and just =
handle it in these functions directly?
>>
>> After implementing {get, set, clear}_pfnblock_flags(), I find that
>> get_pfnblock_flags() is easy like you wrote above, but set and clear a=
re not,
>> since migratetype and skip/isolate bits are in the same word, meaning
>> I will need to first read them out, change the field, then write them =
back.
>
> Like existing set_pfnblock_flags_mask() I guess, with the try_cmpxchg()=
 loop.

Are you saying I duplicate the code in set_pfnblock_flags_mask() to imple=
ment
set_pfnblock_flags()? Or just replace set_pfnblock_flags_mask() entirely?=


>
>> But it will cause inconsistency if there is a parallel writer to the s=
ame
>> word. So for set and clear, mask is required.
>>
>> I can try to implement {get, set, clear}_pfnblock_bits(page,pfn, bits)=
 to
>> only handle standalone bits by using the given @bits as the mask and
>> {set,get}_pageblock_migratetype() still use the mask.
>
> We'd still have to do the try_cmpxchg() when dealing with multiple bits=
, right?
>
> For single bits, we could just use set_bit() etc.

Mel moved from set_bit() to try_cmpxchg() a word for performance reason. =
I am
not sure we want to move back.


--
Best Regards,
Yan, Zi
