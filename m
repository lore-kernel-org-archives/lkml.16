Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A891D5178
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067330; cv=fail; b=sAoj4FEzy83eJ2A0eYOCo2XcFCD0n5p+aoMrZvdRu/e4HK8WpiOdpGJ69BA8OLSxuijigbUlskvsHEENdlL3Fnjf/OvpdwbaPBkBoH9OAUY9HnEBdnwGIujx9kjp+cxLpuVgtn5E6sfZRdm6/9IiKHzsHrdGikBQArKHdFlhIOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067330; c=relaxed/simple;
	bh=6DbheiDqnagId6XAMzn8Qq2gRA1CTV/Nj5xbs5ROEbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FH6/If4GAM3ef6uQ0rfnZ04gq8LxbLdv+1meRgsF/wpnEf0JAugtwkNerekva/TyUime8SwLlbriNEt2sX9pCXVw+XFatHPXk6+9wZLGOMwc9EpyUMHN1GoYMvVv2hOubbdNOazItfDv+4oAGh16SOltB5b0jB0zMxaDTYJzIa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PoCJ2vhO; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PoCJ2vhO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJQvLhiL4n2NptL/Z1WTIW6lx2eXjiE1hw4Q+ZllWKN3W0Xq4FQN3p42fGonjL3wRrnj02q1Xu8HHgeQsnrlDx8HPayl/bJVGk3kBuovfeByS8RKEPQR2HltB56wDXyoQ8388xNmdAeFB/evsUmlBBCxan7mQb13jqiyTEs3OeQeJ/xJqxw17rz0mUMqoqBpORol7jz0qo4txiisAqv5Rvh6ENfO2Cx8K1JCymPSfBbkJq/39sGEpE6YcUkpiWtdwtkbDvBcB4Fj8rYwCFi2mUThBlrsM0C30KB8YAZ2PqCfAy59Ngq1rrKR3cHVXXwwtw/7hIrhWQ6FpbZE/4PvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHXSzEi1sEHrvJN3vbnQSnlY94CpW9nH57BP5FacqZs=;
 b=W5rjMMmkTfb/UUgR6mq3XcYBub8Jfl+tpuMYIjEyf4ekCLxQbKueFQ6Op+e9D5PU9EZDrJ8M6rgRRy9bFASzK0fLFzMz864btj2H6F498cuGodrBfitM4SHrffMPrbOVAjCig2IlrHpPQkZhrnaVVDN4t4xeK60mrqHddZjZHU2C13YbKn4YIKU1WS/45bT3/MmVBLlPuBM17oY2691+M2CRB4ysmFnhs0SsUP+knf0kqRdVGZehaff6tOXib4Kt6gXGSFU6YwaO0RTy6JfC9Z4iAvo1GJeMWqjDJy7x5SSLi5Stqp3k2D7axgYMXSjBQSDHBJsP5ZOqGo8TPus1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHXSzEi1sEHrvJN3vbnQSnlY94CpW9nH57BP5FacqZs=;
 b=PoCJ2vhOSmo3sgFtzvpxuMqvA8Teav/O4LY+bhNwo+PkLNTjicsvRHRsyOuZ8LM7CoK0c857Vw2jsmSpBuSRZ+Nt3rpbIzOqmJNjUMvVR/NTjm6ZtPo7i7V1u8e7hNLieHCCsnwEYxTrMWntwA9aVtxj2CYTlN3ES1r6TNlCj/X6CtZICuWz1+CMw2GyTxgm9UG9hfRtrUhRDli9L1TsaoD0QpQryr2jxxq0UyA33G5M1FYgbS1pVfvEdm3mz7WxNJ66469ggprosM8qUHY0QmUJXNrYtDBk13JaD/krrlDwlp52tt+57vmDJU2vDOi3ycxjUUlXHfm9lQDq63cP5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 16:28:39 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:28:38 +0000
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
Date: Mon, 12 May 2025 12:28:34 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <16FFB01F-6F01-4CDC-B3E6-00377A7B6D61@nvidia.com>
In-Reply-To: <f530d7c9-f7c3-49a4-95cc-702403a9aeed@lucifer.local>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
 <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
 <534DC125-A15E-4190-AAE9-663D6B8283F5@nvidia.com>
 <f530d7c9-f7c3-49a4-95cc-702403a9aeed@lucifer.local>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::38) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c15317-4623-412e-495f-08dd91720cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5amKvPRpTDolOIFW/BK18W9jqKDjB8TNtpqhQJ6sjJt2BkX9+GdTwKwf4zKS?=
 =?us-ascii?Q?YGJIo73TJzAHnRv6S9zEhjLe/XMCFw+BLwjxZNa8XfiGVzH+r6kPbhOknu+W?=
 =?us-ascii?Q?Ssw1gQoTKnmUuXkRk5Xur/gX2nNz8fIHG1vHLmE1XtWY7XKic6vXYTekaBB1?=
 =?us-ascii?Q?r7O7Y6Uq2LQDtWfiA2SdxSjokKDPi74jZu9VJ2O+HD7PlsTc1Yieey2SaUrD?=
 =?us-ascii?Q?FF+Zr9Wq8bdqkx21DjslYwZdxh/vXXfdFb0whvdFOnPNWYD+C/0RArgwGRmd?=
 =?us-ascii?Q?Fys6YEcHFJnx61EAjRBV2tHpd3AiXx0cmSSpD7ZSNBMP/LGgwEwwm4rt+xSC?=
 =?us-ascii?Q?q+AAqCz/B4vjF1ms7Qs68l8v0hrO6haLZ09Hd0KP0SuNNxejOz0oG//cXj8G?=
 =?us-ascii?Q?2qO1FHV+ZcnO/ihnyQ7e/KNcSe6tUKpKSTRyYwyPycGHak6pGMddZLwGxvxk?=
 =?us-ascii?Q?Q58xZporkvJ3KKPk8PdCBky4ZriNc4Nsbj1n32iI+AYm2HpVfcao8yx9njvx?=
 =?us-ascii?Q?4bm5+I/lGS9WOXbQ399XAYsKE00puMPQFk66qGd7qh7bF1nNnWaYcXhOTFb6?=
 =?us-ascii?Q?IoYjjG9Ki5Rmj/m4jt8qoXh2mNuQ1stz2uI7pdAqaTF3mGb3Agy393TNBV3f?=
 =?us-ascii?Q?A5DrbEEkicNvkKIQ6BNztIPEOdJi/BL8z2YMBSTw0Pd8EyEH5bKa9KpcfcOg?=
 =?us-ascii?Q?kl5EtUs4W5L9rPHI1qm9PBlJ7IGbq553+PcTtt7wjIff0S85sRxHnjskXlqi?=
 =?us-ascii?Q?l+M4DsWXNavIOdt9zLSb44vkqoaQ/h9F3dzPsv8PQUNENnAEeIrQWz8f4MkK?=
 =?us-ascii?Q?3XKuHiFEzuvwlf+DzVrFfqAmefx6F2rZ6jtFl1lNyqoL1gr9G3t7hYU1fvSV?=
 =?us-ascii?Q?Mpr3ytuJQF8Q+laVydnr0i63yHD5wkE54d3Iuf3EbFEsu9FxKd/L1f3HT14v?=
 =?us-ascii?Q?RLT9XFhXQI4+uKA++5ZiF5KsAjz5JSgYts9R41FLbwYGo81yn8a3k+Rp3PwM?=
 =?us-ascii?Q?jmxCp21PHBFVyMt2hiGUR5Omspdsnx9vXkt7QL3B4kck8F12K00wwEH0d+hy?=
 =?us-ascii?Q?hIFFTFNvX0kkfRUGom1r505mZe4I9BUnJoks1IAYBibRqqu8iFzQ+Id8qbjX?=
 =?us-ascii?Q?znQlnvn7BzZnFPH4o5UnpJf9ncuIZrWJRAvRybrG+2qinl2Y3NW18rYVJONC?=
 =?us-ascii?Q?iZztpoSJNjGZKpeI5w1Bvnlj8yEq+4BuyCjdBMedO8ueueRi2ZAbh1Rhjk01?=
 =?us-ascii?Q?v+4eZxsdWHG6Uda9TapPZwXAas7sq9FOgsLoAcyGzdI94BFxDb3B2euzW4Hu?=
 =?us-ascii?Q?cMVM8N/wbgcsXiYgonkLd7iAo5Epf2vLZWyby6tTaDxSRNGuisl1G/SCMtNR?=
 =?us-ascii?Q?ASmCP+Wsw6dLRm+gqaowcsmPv7nHXmvTGN1CTubh6ECgH0GE7WwfBTILO9tG?=
 =?us-ascii?Q?7GYlHWPLGis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0pOjyrxFY53oz/cC+uId90CGjOjWo0KVdjRcNbpGHuXwWJIdrEOhqpDGvnFh?=
 =?us-ascii?Q?tGMsFcfYqBu8uL/4UOQ0ktNsI+kETvlDh5Fq/+evADGEunoj6ElRE5ONd2QG?=
 =?us-ascii?Q?kAtm7UV75m12Spo5gK5vaHNRrVODIRtK4OJK2uIoUNxi68HBXujJoUlQ6DCI?=
 =?us-ascii?Q?W2JQ+XdyfrpR88BdJqRPXN1IF4Qz+aBsEoy6WRdypcAPdOgj5z5RxECgpSw3?=
 =?us-ascii?Q?OMVvV9rUxGWGH+wiUYHGwyWZiHlHA+HW3pj8cYGS7vYEKsON8kEB8DxuGhsU?=
 =?us-ascii?Q?hmGlSmm6DKnj56jDtL7oHg0j3C8Anuk9XZJ2Ed0246/x1yAWOFHwRa+PfUz2?=
 =?us-ascii?Q?huNYwGmVAfpjw3bnZjsU+NwKAoExmHSDkrLnYwenawQNNgZV1D97165JUxbA?=
 =?us-ascii?Q?IEUzsQeDUxKIZZjnQoQWiUqwsRltAQp41fnKW373adRbydJyZYlumOnE7RT8?=
 =?us-ascii?Q?SDTOeXzdH+Y/x1rjVJs7xxBsZOt0m4hmWRVNYn2uRhIvLaqaoPbX/xybRbgX?=
 =?us-ascii?Q?T3ucu0z3CsUo2dR30dcrPDP3dlhbZtImWysezS3+Z9PoTgooiX4XDFvnBq+/?=
 =?us-ascii?Q?0ECm+Y1J/glz/0fVDVCUMY5qcVfd/EEHgQ9mJqVfJVaCV/OXTU/rK2O/fPf9?=
 =?us-ascii?Q?ojeK2K7kl0LSsb88bfUfBRKUEimtoq5/VOEPRvvT7rM46PGJwl8KKJ4xR2ol?=
 =?us-ascii?Q?y2kfkBhH8VLE1CCOBcI4DN7/4Hp5kopT5oH5r9cVuUJHVkCwJWVR8JrzUhBN?=
 =?us-ascii?Q?G+AWQtvwtlcKjr7ufqMPOv0nCqTKImaBqBD98k17KF9mnMj2uvAQkz5S3jJR?=
 =?us-ascii?Q?NYN/1Q4ZRoyYxHQExLvpDm3aBlzBZGCo7DehZVY8OzKQocx1ZWC/x0Y8mUFq?=
 =?us-ascii?Q?KCcDAdWFD/5iZh9VVx3796lmJ5GFrj/r0ZwE3AD5hG1dsHi1sqo+pOy3PxkV?=
 =?us-ascii?Q?7u6mmhkt1v2hSn2taJ2fCK266vL4rpAZbcDzdykIHgqsYior4IIdU9CAAr9q?=
 =?us-ascii?Q?F+lTt0AIQ0X53BE8dA11NDmA9QFCfrR7/orta3EtTelqYqcXTUQA6F3WtJ0o?=
 =?us-ascii?Q?f5XGhDIwlK3E2ssmMhqdXgLH5JQX83Ae98AObu3d2XuQkLvNeqKyUywU2Z7O?=
 =?us-ascii?Q?X52iVyecJ+vgk6Aw7uIXNBZELAdmiC9n/76jUdQB804b2UaSfNm8VOtM6tW7?=
 =?us-ascii?Q?2itGZn8wYAN2NYPpMDRfUvBRvgdMnPBcZWiFeGSkVVs9onLhEs44u14iB2E1?=
 =?us-ascii?Q?wNALnY/EGJUqgelN5bXjZiKNYhVsoiraur12IARWoThpYG3F3KqKPvLjJvD0?=
 =?us-ascii?Q?ha7xsPHuVoLYgqgFb2Npil2Jmsq1rxr/34Xen0aI1UIzMOL0lmMXHrbzJabL?=
 =?us-ascii?Q?nSPdoYVb6aWQOOatzosM9rUmsYMLqGGUEfMzfUpoCscvT/Vhu7ymOcAp/fI0?=
 =?us-ascii?Q?edm/07V8qhO7KlS3uAbG5NDmkLXiMHO6BEVFTXBx8UoUteSUYe4fgQTOcuqa?=
 =?us-ascii?Q?0diL2eNUsqbItriowpmKPqt5sCnyhuneereDnBEpo5gme3OIcpNxHPg9lXTT?=
 =?us-ascii?Q?8Hm9ff6lfaeseVedpFjnseffATPzwmGxwypB6M47?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c15317-4623-412e-495f-08dd91720cff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:28:38.8300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoZH4GSkftGnsuI12QsNEqHY15E2aqYE8ZivfftRbgwxLT35+rJBvuz3qGoyeA1y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442

On 12 May 2025, at 12:19, Lorenzo Stoakes wrote:

> On Mon, May 12, 2025 at 12:13:35PM -0400, Zi Yan wrote:
>> On 12 May 2025, at 12:10, Lorenzo Stoakes wrote:
>>
>>> Andrew - please drop this series, it's broken in mm-new.
>>>
>>> Zi - (as kernel bot reports actually!) I bisected a kernel splat to t=
his
>>> commit, triggerred by the mm/transhuge-stress test (please make sure =
to run
>>> mm self tests before submitting series :)
>>>
>>> You can trigger it manually with:
>>>
>>> ./transhuge-stress -d 20
>>
>> Thanks. I will fix the issue and resend.
>
> Thanks :)
>
> Sorry re-reading the 'please make sure to run mm self tests' comment so=
unds
> more snarky thank I intended, and I've definitely forgotten to do it
> sometimes myself, but obviously a useful thing to do :P

You got me. I did not run mm self tests for my series, but will do that
from now on. I was using memory hotplug and hotremove to test my series,
but obviously it is not enough.

>
> I wonder if the issue I mention below is related, actually, unless they=
're
> running your series on top of v6.15-rc5...

I wonder if something else is causing it. The warning is the check of
making sure pageblock migratetype matches the free list movement.
Anyway, let me reply there. A bisect would be helpful.

>
> I pinged there anyway just in case.
>
> Cheers, Lorenzo
>
>>
>>>
>>> (The same invocation run_vmtest.sh uses).
>>>
>>> Note that this was reported in [0] (thanks to Harry Yoo for pointing =
this
>>> out to me off-list! :)
>>>
>>> [0]: https://lore.kernel.org/linux-mm/87wmalyktd.fsf@linux.ibm.com/T/=
#u
>>>
>>> The decoded splat (at this commit in mm-new):
>>>
>>> [   55.835700] ------------[ cut here ]------------
>>> [   55.835705] page type is 0, passed migratetype is 2 (nr=3D32)
>>> [   55.835720] WARNING: CPU: 2 PID: 288 at mm/page_alloc.c:727 move_t=
o_free_list (mm/page_alloc.c:727 (discriminator 16))
>>> [   55.835734] Modules linked in:
>>> [   55.835739] Tainted: [W]=3DWARN
>>> [   55.835740] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),=
 BIOS Arch Linux 1.16.3-1-1 04/01/2014
>>> [   55.835741] RIP: 0010:move_to_free_list (mm/page_alloc.c:727 (disc=
riminator 16))
>>> [ 55.835742] Code: e9 fe ff ff c6 05 f1 9b 7b 01 01 90 48 89 ef e8 11=
 d7 ff ff 44 89 e1 44 89 ea 48 c7 c7 58 dc 70 82 48 89 c6 e8 1c e3 e0 ff =
90 <0f> 0b 90 90 e9 ba fe ff ff 66 90 90 90 90 90 90 90 90 90 90 90 90
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>    0:	e9 fe ff ff c6       	jmp    0xffffffffc7000003
>>>    5:	05 f1 9b 7b 01       	add    $0x17b9bf1,%eax
>>>    a:	01 90 48 89 ef e8    	add    %edx,-0x171076b8(%rax)
>>>   10:	11 d7                	adc    %edx,%edi
>>>   12:	ff                   	(bad)
>>>   13:	ff 44 89 e1          	incl   -0x1f(%rcx,%rcx,4)
>>>   17:	44 89 ea             	mov    %r13d,%edx
>>>   1a:	48 c7 c7 58 dc 70 82 	mov    $0xffffffff8270dc58,%rdi
>>>   21:	48 89 c6             	mov    %rax,%rsi
>>>   24:	e8 1c e3 e0 ff       	call   0xffffffffffe0e345
>>>   29:	90                   	nop
>>>   2a:*	0f 0b                	ud2		<-- trapping instruction
>>>   2c:	90                   	nop
>>>   2d:	90                   	nop
>>>   2e:	e9 ba fe ff ff       	jmp    0xfffffffffffffeed
>>>   33:	66 90                	xchg   %ax,%ax
>>>   35:	90                   	nop
>>>   36:	90                   	nop
>>>   37:	90                   	nop
>>>   38:	90                   	nop
>>>   39:	90                   	nop
>>>   3a:	90                   	nop
>>>   3b:	90                   	nop
>>>   3c:	90                   	nop
>>>   3d:	90                   	nop
>>>   3e:	90                   	nop
>>>   3f:	90                   	nop
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>    0:	0f 0b                	ud2
>>>    2:	90                   	nop
>>>    3:	90                   	nop
>>>    4:	e9 ba fe ff ff       	jmp    0xfffffffffffffec3
>>>    9:	66 90                	xchg   %ax,%ax
>>>    b:	90                   	nop
>>>    c:	90                   	nop
>>>    d:	90                   	nop
>>>    e:	90                   	nop
>>>    f:	90                   	nop
>>>   10:	90                   	nop
>>>   11:	90                   	nop
>>>   12:	90                   	nop
>>>   13:	90                   	nop
>>>   14:	90                   	nop
>>>   15:	90                   	nop
>>> [   55.835743] RSP: 0018:ffffc900004eba20 EFLAGS: 00010086
>>> [   55.835744] RAX: 000000000000002f RBX: ffff88826cccb080 RCX: 00000=
00000000027
>>> [   55.835745] RDX: ffff888263d17b08 RSI: 0000000000000001 RDI: ffff8=
88263d17b00
>>> [   55.835746] RBP: ffffea0005fe0000 R08: 00000000ffffdfff R09: fffff=
fff82b16528
>>> [   55.835746] R10: 80000000ffffe000 R11: 00000000ffffe000 R12: 00000=
00000000020
>>> [   55.835746] R13: 0000000000000002 R14: 0000000000000001 R15: 00000=
00000000005
>>> [   55.835750] FS:  00007fef6a06a740(0000) GS:ffff8882e08a0000(0000) =
knlGS:0000000000000000
>>> [   55.835751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   55.835751] CR2: 00007fee20c00000 CR3: 0000000179321000 CR4: 00000=
00000750ef0
>>> [   55.835751] PKRU: 55555554
>>> [   55.835752] Call Trace:
>>> [   55.835755]  <TASK>
>>> [   55.835756] __move_freepages_block (mm/page_alloc.c:1849)
>>> [   55.835758] try_to_claim_block (mm/page_alloc.c:452 (discriminator=
 3) mm/page_alloc.c:2231 (discriminator 3))
>>> [   55.835759] __rmqueue_pcplist (mm/page_alloc.c:2287 mm/page_alloc.=
c:2383 mm/page_alloc.c:2422 mm/page_alloc.c:3140)
>>> [   55.835760] get_page_from_freelist (./include/linux/spinlock.h:391=
 mm/page_alloc.c:3183 mm/page_alloc.c:3213 mm/page_alloc.c:3739)
>>> [   55.835761] __alloc_frozen_pages_noprof (mm/page_alloc.c:5032)
>>> [   55.835763] ? __blk_flush_plug (block/blk-core.c:1227 (discriminat=
or 2))
>>> [   55.835766] alloc_pages_mpol (mm/mempolicy.c:2413)
>>> [   55.835768] vma_alloc_folio_noprof (mm/mempolicy.c:2432 mm/mempoli=
cy.c:2465)
>>> [   55.835769] ? __pte_alloc (mm/memory.c:444)
>>> [   55.835771] do_anonymous_page (mm/memory.c:1064 (discriminator 4) =
mm/memory.c:4982 (discriminator 4) mm/memory.c:5039 (discriminator 4))
>>> [   55.835772] ? do_huge_pmd_anonymous_page (mm/huge_memory.c:1226 mm=
/huge_memory.c:1372)
>>> [   55.835774] __handle_mm_fault (mm/memory.c:4197 mm/memory.c:6038 m=
m/memory.c:6181)
>>> [   55.835776] handle_mm_fault (mm/memory.c:6350)
>>> [   55.835777] do_user_addr_fault (arch/x86/mm/fault.c:1338)
>>> [   55.835779] exc_page_fault (./arch/x86/include/asm/irqflags.h:37 .=
/arch/x86/include/asm/irqflags.h:114 arch/x86/mm/fault.c:1488 arch/x86/mm=
/fault.c:1538)
>>> [   55.835783] asm_exc_page_fault (./arch/x86/include/asm/idtentry.h:=
623)
>>> [   55.835785] RIP: 0033:0x403824
>>> [ 55.835786] Code: e0 0f 85 7c 01 00 00 ba 0e 00 00 00 be 00 00 20 00=
 48 89 c7 48 89 c3 e8 4a ea ff ff 85 c0 0f 85 51 01 00 00 8b 0d b4 49 00 =
00 <48> 89 1b 85 c9 0f 84 b1 00 00 00 83 e9 03 48 89 e6 ba 10 00 00 00
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>    0:	e0 0f                	loopne 0x11
>>>    2:	85 7c 01 00          	test   %edi,0x0(%rcx,%rax,1)
>>>    6:	00 ba 0e 00 00 00    	add    %bh,0xe(%rdx)
>>>    c:	be 00 00 20 00       	mov    $0x200000,%esi
>>>   11:	48 89 c7             	mov    %rax,%rdi
>>>   14:	48 89 c3             	mov    %rax,%rbx
>>>   17:	e8 4a ea ff ff       	call   0xffffffffffffea66
>>>   1c:	85 c0                	test   %eax,%eax
>>>   1e:	0f 85 51 01 00 00    	jne    0x175
>>>   24:	8b 0d b4 49 00 00    	mov    0x49b4(%rip),%ecx        # 0x49de
>>>   2a:*	48 89 1b             	mov    %rbx,(%rbx)		<-- trapping instruc=
tion
>>>   2d:	85 c9                	test   %ecx,%ecx
>>>   2f:	0f 84 b1 00 00 00    	je     0xe6
>>>   35:	83 e9 03             	sub    $0x3,%ecx
>>>   38:	48 89 e6             	mov    %rsp,%rsi
>>>   3b:	ba 10 00 00 00       	mov    $0x10,%edx
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>    0:	48 89 1b             	mov    %rbx,(%rbx)
>>>    3:	85 c9                	test   %ecx,%ecx
>>>    5:	0f 84 b1 00 00 00    	je     0xbc
>>>    b:	83 e9 03             	sub    $0x3,%ecx
>>>    e:	48 89 e6             	mov    %rsp,%rsi
>>>   11:	ba 10 00 00 00       	mov    $0x10,%edx
>>> [   55.835786] RSP: 002b:00007ffd50b1e550 EFLAGS: 00010246
>>> [   55.835787] RAX: 0000000000000000 RBX: 00007fee20c00000 RCX: 00000=
0000000000c
>>> [   55.835787] RDX: 000000000000000e RSI: 0000000000200000 RDI: 00007=
fee20c00000
>>> [   55.835788] RBP: 0000000000000003 R08: 00000000ffffffff R09: 00000=
00000000000
>>> [   55.835788] R10: 0000000000004032 R11: 0000000000000246 R12: 00007=
fee20c00000
>>> [   55.835788] R13: 00007fef6a000000 R14: 00000000323ca6b0 R15: 00000=
00000000fd2
>>> [   55.835789]  </TASK>
>>> [   55.835789] ---[ end trace 0000000000000000 ]---
>>>
>>>
>>> On Fri, May 09, 2025 at 04:01:09PM -0400, Zi Yan wrote:
>>>> Since migratetype is no longer overwritten during pageblock isolatio=
n,
>>>> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migrat=
etype.
>>>>
>>>> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratety=
pe
>>>> when a pageblock is isolated. It is used by move_freepages_block_iso=
late().
>>>>
>>>> Add pageblock_isolate_and_move_free_pages() and
>>>> pageblock_unisolate_and_move_free_pages() to be explicit about the p=
age
>>>> isolation operations. Both share the common code in
>>>> __move_freepages_block_isolate(), which is renamed from
>>>> move_freepages_block_isolate().
>>>>
>>>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE typ=
es,
>>>> so that one should use set_pageblock_isolate() to isolate pageblocks=
=2E
>>>>
>>>> Two consequential changes:
>>>> 1. move pageblock migratetype code out of __move_freepages_block().
>>>> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zon=
e() is
>>>>    called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all af=
fected
>>>>    pageblocks are isolated afterwards. Otherwise, all online pageblo=
cks
>>>>    will have non-determined migratetype.
>>>>
>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>>  include/linux/mmzone.h         |  4 +-
>>>>  include/linux/page-isolation.h |  5 ++-
>>>>  mm/memory_hotplug.c            |  7 +++-
>>>>  mm/page_alloc.c                | 73 +++++++++++++++++++++++++------=
---
>>>>  mm/page_isolation.c            | 27 ++++++++-----
>>>>  5 files changed, 82 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>>> index 7ef01fe148ce..f66895456974 100644
>>>> --- a/include/linux/mmzone.h
>>>> +++ b/include/linux/mmzone.h
>>>> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int=
 mt)
>>>>  extern int page_group_by_mobility_disabled;
>>>>
>>>>  #ifdef CONFIG_MEMORY_ISOLATION
>>>> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migra=
te_isolate_bit)
>>>> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
>>>> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isol=
ate_bit)
>>>>  #else
>>>> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>>>>  #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>>>>  #endif
>>>>
>>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-iso=
lation.h
>>>> index 898bb788243b..b0a2af0a5357 100644
>>>> --- a/include/linux/page-isolation.h
>>>> +++ b/include/linux/page-isolation.h
>>>> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migrate=
type)
>>>>  #define REPORT_FAILURE	0x2
>>>>
>>>>  void set_pageblock_migratetype(struct page *page, int migratetype);=

>>>> +void set_pageblock_isolate(struct page *page);
>>>>
>>>> -bool move_freepages_block_isolate(struct zone *zone, struct page *p=
age,
>>>> -				  int migratetype);
>>>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struc=
t page *page);
>>>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, str=
uct page *page);
>>>>
>>>>  int start_isolate_page_range(unsigned long start_pfn, unsigned long=
 end_pfn,
>>>>  			     int migratetype, int flags);
>>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>>> index b1caedbade5b..c86c47bba019 100644
>>>> --- a/mm/memory_hotplug.c
>>>> +++ b/mm/memory_hotplug.c
>>>> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned l=
ong nr_pages,
>>>>  	const int nid =3D zone_to_nid(zone);
>>>>  	int ret;
>>>>  	struct memory_notify arg;
>>>> +	unsigned long isol_pfn;
>>>>
>>>>  	/*
>>>>  	 * {on,off}lining is constrained to full memory sections (or more
>>>> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned =
long nr_pages,
>>>>
>>>>
>>>>  	/* associate pfn range with the zone */
>>>> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE)=
;
>>>> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE)=
;
>>>> +	for (isol_pfn =3D pfn;
>>>> +	     isol_pfn < pfn + nr_pages;
>>>> +	     isol_pfn +=3D pageblock_nr_pages)
>>>> +		set_pageblock_isolate(pfn_to_page(isol_pfn));
>>>>
>>>>  	arg.start_pfn =3D pfn;
>>>>  	arg.nr_pages =3D nr_pages;
>>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>>> index 04e301fb4879..cfd37b2d992e 100644
>>>> --- a/mm/page_alloc.c
>>>> +++ b/mm/page_alloc.c
>>>> @@ -454,11 +454,9 @@ void set_pageblock_migratetype(struct page *pag=
e, int migratetype)
>>>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>>>
>>>>  #ifdef CONFIG_MEMORY_ISOLATION
>>>> -	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>>>> -		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>>>> -				page_to_pfn(page), PB_migrate_isolate_bit);
>>>> -		return;
>>>> -	}
>>>> +	VM_WARN(migratetype =3D=3D MIGRATE_ISOLATE,
>>>> +			"Use set_pageblock_isolate() for pageblock isolation");
>>>> +	return;
>>>>  #endif
>>>>  	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>>  				page_to_pfn(page), MIGRATETYPE_MASK);
>>>> @@ -1819,8 +1817,8 @@ static inline struct page *__rmqueue_cma_fallb=
ack(struct zone *zone,
>>>>  #endif
>>>>
>>>>  /*
>>>> - * Change the type of a block and move all its free pages to that
>>>> - * type's freelist.
>>>> + * Move all free pages of a block to new type's freelist. Caller ne=
eds to
>>>> + * change the block type.
>>>>   */
>>>>  static int __move_freepages_block(struct zone *zone, unsigned long =
start_pfn,
>>>>  				  int old_mt, int new_mt)
>>>> @@ -1852,8 +1850,6 @@ static int __move_freepages_block(struct zone =
*zone, unsigned long start_pfn,
>>>>  		pages_moved +=3D 1 << order;
>>>>  	}
>>>>
>>>> -	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>>>> -
>>>>  	return pages_moved;
>>>>  }
>>>>
>>>> @@ -1911,11 +1907,16 @@ static int move_freepages_block(struct zone =
*zone, struct page *page,
>>>>  				int old_mt, int new_mt)
>>>>  {
>>>>  	unsigned long start_pfn;
>>>> +	int res;
>>>>
>>>>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL)=
)
>>>>  		return -1;
>>>>
>>>> -	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>>>> +	res =3D __move_freepages_block(zone, start_pfn, old_mt, new_mt);
>>>> +	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
>>>> +
>>>> +	return res;
>>>> +
>>>>  }
>>>>
>>>>  #ifdef CONFIG_MEMORY_ISOLATION
>>>> @@ -1943,11 +1944,17 @@ static unsigned long find_large_buddy(unsign=
ed long start_pfn)
>>>>  	return start_pfn;
>>>>  }
>>>>
>>>> +static inline void toggle_pageblock_isolate(struct page *page, bool=
 isolate)
>>>> +{
>>>> +	set_pfnblock_flags_mask(page, (isolate << PB_migrate_isolate),
>>>> +			page_to_pfn(page), PB_migrate_isolate_bit);
>>>> +}
>>>> +
>>>>  /**
>>>> - * move_freepages_block_isolate - move free pages in block for page=
 isolation
>>>> + * __move_freepages_block_isolate - move free pages in block for pa=
ge isolation
>>>>   * @zone: the zone
>>>>   * @page: the pageblock page
>>>> - * @migratetype: migratetype to set on the pageblock
>>>> + * @isolate: to isolate the given pageblock or unisolate it
>>>>   *
>>>>   * This is similar to move_freepages_block(), but handles the speci=
al
>>>>   * case encountered in page isolation, where the block of interest
>>>> @@ -1962,10 +1969,15 @@ static unsigned long find_large_buddy(unsign=
ed long start_pfn)
>>>>   *
>>>>   * Returns %true if pages could be moved, %false otherwise.
>>>>   */
>>>> -bool move_freepages_block_isolate(struct zone *zone, struct page *p=
age,
>>>> -				  int migratetype)
>>>> +static bool __move_freepages_block_isolate(struct zone *zone,
>>>> +		struct page *page, bool isolate)
>>>>  {
>>>>  	unsigned long start_pfn, pfn;
>>>> +	int from_mt;
>>>> +	int to_mt;
>>>> +
>>>> +	if (isolate =3D=3D (get_pageblock_migratetype(page) =3D=3D MIGRATE=
_ISOLATE))
>>>> +		return false;
>>>>
>>>>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL)=
)
>>>>  		return false;
>>>> @@ -1982,7 +1994,7 @@ bool move_freepages_block_isolate(struct zone =
*zone, struct page *page,
>>>>
>>>>  		del_page_from_free_list(buddy, zone, order,
>>>>  					get_pfnblock_migratetype(buddy, pfn));
>>>> -		set_pageblock_migratetype(page, migratetype);
>>>> +		toggle_pageblock_isolate(page, isolate);
>>>>  		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
>>>>  		return true;
>>>>  	}
>>>> @@ -1993,16 +2005,38 @@ bool move_freepages_block_isolate(struct zon=
e *zone, struct page *page,
>>>>
>>>>  		del_page_from_free_list(page, zone, order,
>>>>  					get_pfnblock_migratetype(page, pfn));
>>>> -		set_pageblock_migratetype(page, migratetype);
>>>> +		toggle_pageblock_isolate(page, isolate);
>>>>  		split_large_buddy(zone, page, pfn, order, FPI_NONE);
>>>>  		return true;
>>>>  	}
>>>>  move:
>>>> -	__move_freepages_block(zone, start_pfn,
>>>> -			       get_pfnblock_migratetype(page, start_pfn),
>>>> -			       migratetype);
>>>> +	/* use MIGRATETYPE_NO_ISO_MASK to get the non-isolate migratetype =
*/
>>>> +	if (isolate) {
>>>> +		from_mt =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>>>> +				MIGRATETYPE_NO_ISO_MASK);
>>>> +		to_mt =3D MIGRATE_ISOLATE;
>>>> +	} else {
>>>> +		from_mt =3D MIGRATE_ISOLATE;
>>>> +		to_mt =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>>>> +				MIGRATETYPE_NO_ISO_MASK);
>>>> +	}
>>>> +
>>>> +	__move_freepages_block(zone, start_pfn, from_mt, to_mt);
>>>> +	toggle_pageblock_isolate(pfn_to_page(start_pfn), isolate);
>>>> +
>>>>  	return true;
>>>>  }
>>>> +
>>>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struc=
t page *page)
>>>> +{
>>>> +	return __move_freepages_block_isolate(zone, page, true);
>>>> +}
>>>> +
>>>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, str=
uct page *page)
>>>> +{
>>>> +	return __move_freepages_block_isolate(zone, page, false);
>>>> +}
>>>> +
>>>>  #endif /* CONFIG_MEMORY_ISOLATION */
>>>>
>>>>  static void change_pageblock_range(struct page *pageblock_page,
>>>> @@ -2194,6 +2228,7 @@ try_to_claim_block(struct zone *zone, struct p=
age *page,
>>>>  	if (free_pages + alike_pages >=3D (1 << (pageblock_order-1)) ||
>>>>  			page_group_by_mobility_disabled) {
>>>>  		__move_freepages_block(zone, start_pfn, block_type, start_type);
>>>> +		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
>>>>  		return __rmqueue_smallest(zone, order, start_type);
>>>>  	}
>>>>
>>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>>> index 751e21f6d85e..4571940f14db 100644
>>>> --- a/mm/page_isolation.c
>>>> +++ b/mm/page_isolation.c
>>>> @@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct=
 page *page)
>>>>  	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>>>>  			PB_migrate_isolate_bit);
>>>>  }
>>>> +void set_pageblock_isolate(struct page *page)
>>>> +{
>>>> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>>>> +			page_to_pfn(page),
>>>> +			PB_migrate_isolate_bit);
>>>> +}
>>>>
>>>>  /*
>>>>   * This function checks whether the range [start_pfn, end_pfn) incl=
udes
>>>> @@ -199,7 +205,7 @@ static int set_migratetype_isolate(struct page *=
page, int migratetype, int isol_
>>>>  	unmovable =3D has_unmovable_pages(check_unmovable_start, check_unm=
ovable_end,
>>>>  			migratetype, isol_flags);
>>>>  	if (!unmovable) {
>>>> -		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {=

>>>> +		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
>>>>  			spin_unlock_irqrestore(&zone->lock, flags);
>>>>  			return -EBUSY;
>>>>  		}
>>>> @@ -220,7 +226,7 @@ static int set_migratetype_isolate(struct page *=
page, int migratetype, int isol_
>>>>  	return -EBUSY;
>>>>  }
>>>>
>>>> -static void unset_migratetype_isolate(struct page *page, int migrat=
etype)
>>>> +static void unset_migratetype_isolate(struct page *page)
>>>>  {
>>>>  	struct zone *zone;
>>>>  	unsigned long flags;
>>>> @@ -273,10 +279,10 @@ static void unset_migratetype_isolate(struct p=
age *page, int migratetype)
>>>>  		 * Isolating this block already succeeded, so this
>>>>  		 * should not fail on zone boundaries.
>>>>  		 */
>>>> -		WARN_ON_ONCE(!move_freepages_block_isolate(zone, page, migratetyp=
e));
>>>> +		WARN_ON_ONCE(!pageblock_unisolate_and_move_free_pages(zone, page)=
);
>>>>  	} else {
>>>> -		set_pageblock_migratetype(page, migratetype);
>>>> -		__putback_isolated_page(page, order, migratetype);
>>>> +		clear_pageblock_isolate(page);
>>>> +		__putback_isolated_page(page, order, get_pageblock_migratetype(pa=
ge));
>>>>  	}
>>>>  	zone->nr_isolate_pageblock--;
>>>>  out:
>>>> @@ -394,7 +400,7 @@ static int isolate_single_pageblock(unsigned lon=
g boundary_pfn, int flags,
>>>>  		if (PageBuddy(page)) {
>>>>  			int order =3D buddy_order(page);
>>>>
>>>> -			/* move_freepages_block_isolate() handled this */
>>>> +			/* pageblock_isolate_and_move_free_pages() handled this */
>>>>  			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
>>>>
>>>>  			pfn +=3D 1UL << order;
>>>> @@ -444,7 +450,7 @@ static int isolate_single_pageblock(unsigned lon=
g boundary_pfn, int flags,
>>>>  failed:
>>>>  	/* restore the original migratetype */
>>>>  	if (!skip_isolation)
>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migrate=
type);
>>>> +		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
>>>>  	return -EBUSY;
>>>>  }
>>>>
>>>> @@ -515,7 +521,7 @@ int start_isolate_page_range(unsigned long start=
_pfn, unsigned long end_pfn,
>>>>  	ret =3D isolate_single_pageblock(isolate_end, flags, true,
>>>>  			skip_isolation, migratetype);
>>>>  	if (ret) {
>>>> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype=
);
>>>> +		unset_migratetype_isolate(pfn_to_page(isolate_start));
>>>>  		return ret;
>>>>  	}
>>>>
>>>> @@ -528,8 +534,7 @@ int start_isolate_page_range(unsigned long start=
_pfn, unsigned long end_pfn,
>>>>  					start_pfn, end_pfn)) {
>>>>  			undo_isolate_page_range(isolate_start, pfn, migratetype);
>>>>  			unset_migratetype_isolate(
>>>> -				pfn_to_page(isolate_end - pageblock_nr_pages),
>>>> -				migratetype);
>>>> +				pfn_to_page(isolate_end - pageblock_nr_pages));
>>>>  			return -EBUSY;
>>>>  		}
>>>>  	}
>>>> @@ -559,7 +564,7 @@ void undo_isolate_page_range(unsigned long start=
_pfn, unsigned long end_pfn,
>>>>  		page =3D __first_valid_page(pfn, pageblock_nr_pages);
>>>>  		if (!page || !is_migrate_isolate_page(page))
>>>>  			continue;
>>>> -		unset_migratetype_isolate(page, migratetype);
>>>> +		unset_migratetype_isolate(page);
>>>>  	}
>>>>  }
>>>>  /*
>>>> --
>>>> 2.47.2
>>>>
>>>>
>>>>
>>
>>
>> --
>> Best Regards,
>> Yan, Zi


--
Best Regards,
Yan, Zi
