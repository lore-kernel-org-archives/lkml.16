Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A91F5433
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665358; cv=fail; b=P2n6b886FScHPL9bmIHVz/7L1r9zJRzCvwuFgABwDteehRlPEoUCGUpWEQloVSQ1/ZAZBvQvyRO6h/xmr10v7oCOtb4YmObhgiBV3Ya5ApcrUZLs6rR1q1M1YKdoy6z6hz2Eqw7tP/e45aSNvEklqcUrxsq65dXZyb8/i2vOZIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665358; c=relaxed/simple;
	bh=C61WOlfWFsWHvY8/ZUO57HwsyGGtQGBoqM/apawNPHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hn4VdP+rxM+1ob9+Mzf2jG9YBXQDL/E+7TrSGFrFKncocKIdD/FGPdXl7s3iq69LlgYd73eUY4bcinUxdWfcHqZGFhyB4ZHewuUnL2FyWI4nG0QDMIna5Spx9BBM2FmJ8SjHsG091H/D3GOq9YoO6rngnpLIT4hCYufZwmeP6mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ckCArHwT; arc=fail smtp.client-ip=40.107.212.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ckCArHwT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghs6b5Xux8mYlpJdD2nh7qo5415km/Um/O3ChjQC1UR+4iDWTi4MAHqkZNa10RN0++XGAdkHz4r4lV0N2yTJEw8usMRDeWe9MRhwtIgEEL58TvnlknEJon5cTqAKO2tGuvrMPBrwXPXrUxYbTQPjFcV0XWfWEtkKdqXDmiba13FwnSpEEtMeegdVOklvU3o+tkI8SYj78ZW9xYu5O1hfLNVWNq9ZnJGWiSndq8DsRpQ4wmdJLfD2Melu5Q+yE+4YVOxdFAE+taI7Qa3deBDfkuqmkHQB1v9wQVIC9IUbusclCq5USX7wCLW0r5wemLgFa3hM9UGUxInwcfpYK2KRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C61WOlfWFsWHvY8/ZUO57HwsyGGtQGBoqM/apawNPHk=;
 b=KqzQOyNkZ528o9W8VSBUhKo1qI3Li7v4bwesfc8gxMIOOqe59ackNmhxmY73t3YwLCVqBMX3QkAkyVT47HONedu1/cE4viTHxMl7SE3DxGTxGTDTdkZF/yK0GuR0dYB7uULaNMm4DpT783Ktp5SuJyw3ndXIiHnEDUZazLxqtWp3IAQsg6VcncG/hOyzWRB3rWE31b2xfwo8Xvek1Il9W1OpqibZo2pdk2yuiuQZvnM04PJMgX3GNr0EgITXkpvswKV2aF8VXN48r6Yo6itY/O7E79yN4okgXkfu3Hn9aw2GWkijhaVfOF+m9PzYEficvB4fOGM0+NBc1MmNF0NzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C61WOlfWFsWHvY8/ZUO57HwsyGGtQGBoqM/apawNPHk=;
 b=ckCArHwTU9PAayHOe7cNdVXVfeL1lCpqtWYE+n/X3O2utql/H6sDqHvrNKIUVhd2d7czR/hCsjmafJW/QT60RtsHeVBmy8tqdmyp5zyCspIczvJEJL0U4CppH/XCKiDVzp+6XH9c43c3dD6F3LS/ih8T1nXVrQ+s6ZE4id8DG4oScwZh64GeEyWStzZeufn0UXbShUBb8P1Xg+HEIs0W66PPKoAJ/YaisyiDHuP8gwIZLomoOtEL4DljiC+TyDJ6hDTXTsx6JIkucl0WiQHlXQis757dkhVUTU2tU/JuXGi14sgBCx2HIJcYo7DgCFDcbv6Ea0HaD/LLilfd2Bk23Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB6312.namprd12.prod.outlook.com (2603:10b6:8:93::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Mon, 19 May 2025 14:35:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:35:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Mon, 19 May 2025 10:35:50 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
In-Reply-To: <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0337.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3734b100-1e9b-49a2-8ef8-08dd96e274f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dVgUhixI4YsCu1fpb+QFjKNqdkz17VeJeyQvNMR0TgjJqd1eJCReLlOI3kRV?=
 =?us-ascii?Q?NdhgIjtNCcikl7tyQvq6AlHx5w17hNV196tM4FUxj+qdLWHWsfsjuUcpb0QE?=
 =?us-ascii?Q?zFAa8zvU1Nz6XAQj9whSpd71UHCArJS0N5fKvdpAlmJkvVxVTYo6grC9UtDO?=
 =?us-ascii?Q?IGVf/BPOvY6T0QTMm12stODLYJlX3fPSWnQmfU34LEWZ344vnSLPMmc70vAz?=
 =?us-ascii?Q?YFdkyQDboa08ypmmzOSKdPxtbeULAe/yy4/Nb9cCiTVEbUbJyg125x+tnxnl?=
 =?us-ascii?Q?rU2W23r9vNHPF9P64fQX4BK+atJeMNvgMMSXDSPgNcTiKZ5ISEoM00Y4NZY8?=
 =?us-ascii?Q?XPfpUmohvCi5ZUbhYYVCVhHlwUMzmmj7rQ5v90Ov/I3Iy6kkm2v06hBuvVVP?=
 =?us-ascii?Q?5eDWflA6MVpJFpM8zsHeX7RCCCPFI6ORXnQVxn+Bi5tTD9hmO7C/JrvOMhdU?=
 =?us-ascii?Q?TnnFjyZgrjbq5gsmyFER/TQY8bS9Nm0cV0QSUXALXm/BCFQy6BYoDNVzTtKm?=
 =?us-ascii?Q?ngB4ie5i5CxBTIZccTUCO7s5AV4u9tJqpE4yEHEc5KlOZQtv//OGsG8iiD5B?=
 =?us-ascii?Q?7GxhrhifezG5vP7uf0AvVf52dVCI/u1UZg+Ptdtd4x+iWhjZMR2Mwdjpk6GP?=
 =?us-ascii?Q?u/r/QHHDnVYXPJlPAx6eMF+622rHSGfRgBFpWijsdiuySC8J6xM9jaS02jsL?=
 =?us-ascii?Q?MJ3X8r2yNjz282OPO4hnI8AKQEeBr+42iQfdIdGs7STM5z8barVQn3toCG8T?=
 =?us-ascii?Q?aGuZngd7EUT9nMOMui/a8eANArFAgO7xZGcOcRzJ55T6tdZ3ubsO95BqO9l+?=
 =?us-ascii?Q?TAD9hzOOXcZPtd24FiG5eZV2yTtsIMMfHD9dxagWh6QmFPrkLaIxpweO2PzZ?=
 =?us-ascii?Q?Cl45Xkq6KD7e0Uk34xttqyXnoJW7jHQUeCUxPugv7qPPoNw0aytckxoIfkF/?=
 =?us-ascii?Q?LYXnEbx8EHvN/WCuoF1HPVqv/2ImLAVK4fV4dgyyuFbzWcqswTDogYzuf2eX?=
 =?us-ascii?Q?jorZcPDpvSecSSa8NP5woUoPrzdQ3aWLPkgDR4r4v+Db+Fmw093nje0V6bIN?=
 =?us-ascii?Q?fHtlEHaL0gdPvWGXQp0c0sbk+u2vXSAmRg0JyVBogUsmq8xncIJ2djg0BBgY?=
 =?us-ascii?Q?ew0b3qMHU22cFWyLq19xkU9wPbu7qlCwzgH75hcYn8cU+xwMesqEfhXm43j3?=
 =?us-ascii?Q?nEqKNljbyggO0wvEgsvokRgZoG12C/1N8HEhI/rqIQBRXJBmmixdv4tS9+p9?=
 =?us-ascii?Q?5kxe5nKzOi5ckS4W9wrgd3NDGrfB8OsNgMGcpksh1d+7MMnwnvXh5egM23lb?=
 =?us-ascii?Q?fTwMOmfV97T9N6hhmHRnT46QIi2g9FWk/E1qpvZqndQHDtdqn+TUjoLyHdmX?=
 =?us-ascii?Q?GRbyO3xO3GJ/hoBYFbREWFk7IBy9O0I2JAx+GpRSXfjvcdgcmr+KEwHP3DfD?=
 =?us-ascii?Q?N3nskQjifuE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6rXxAEsC4quiPw2IAba3wAuGsQOa/ZYsl+MA06aTO3bliMxX9ups3x9ae08G?=
 =?us-ascii?Q?CX4Dzo02uQaukRA/x8NgqTxRLammbxihqOjgVugzfo9hwFhSkaCMWdOXSJtq?=
 =?us-ascii?Q?8pJ/60vrfzL3kBv5zpeD5bKvZ3wQJvgEfFndTVDh+mfiBQBDd3L9rlYl4c7p?=
 =?us-ascii?Q?TRna08D+4vERfYlAFWpZGcmzT1Mk0/+518nAX7xZgRrezle8sYJz1g9dKKY8?=
 =?us-ascii?Q?/z43mxvIzS5cYBETn19yIGgOVObGAjB4qz8P0nfipr8pZeN2SJv7wnaDfHgO?=
 =?us-ascii?Q?QDHlI523J8h0SCdmc6tkatZw3/eZIS+n1cTH/eEZmwZjnNxSF49VTqqz9JMb?=
 =?us-ascii?Q?PB/Kg5hbqjLWYwmOj94n2x9//G+DOjJc8SNf+3SwqFW0YsxYY+Bmm3r8tjyI?=
 =?us-ascii?Q?nvDvFG2lZjPcKyEjNBZxMKAoIqy5umQRboVdCosANnrnaPAOi278BCl9Lg88?=
 =?us-ascii?Q?L52J9/1Ko2LOZgrBKOns3H3bTTXmhoBkMsFEj6084WTRN97aJ77GRHCLXhUz?=
 =?us-ascii?Q?u5/I0STGn9lWTqP2kRK20+EETheKJ+UCBslqzqpjhj0LfV8fJ+owEwpcNf2z?=
 =?us-ascii?Q?dx508qXxxFvemyhlbPEuKRYZeMLUcX03LtV0cG3LeEQfIwDurJHYDAhAKhC6?=
 =?us-ascii?Q?08vHkVmrXjU0Z93SroQJ5TsLXs79LJ4bFHopzuPdyhWjnGnldj0rJKVlG3DS?=
 =?us-ascii?Q?a0zZCxMLQ1TprxYfGtPKY2YgSp1cecatDjakouCQfQd74gzo1QY3HXk4PklR?=
 =?us-ascii?Q?YJsZIEUj8lUO3cIKkZAzte9lo9a6hKVf2vfqdnu9MGNBdpHOcqKQbr+kCeUI?=
 =?us-ascii?Q?tLgVMT8QdSnTViAC5Fu8iQ4DLl3BPORcBb8rnAUL6hhcWE7nMC4nfAfFisFG?=
 =?us-ascii?Q?2kSyT2tTkTQGBstHvTTRQ4yLoIe81IjTuMpzkTRoJ+w5mj90+6lwYilI2Jhj?=
 =?us-ascii?Q?rlHfgCmCmNcXz0djrv33vYkcAA1FgU9/cz9OrJ8jsJiyz61Rp7sBMGqx5sRW?=
 =?us-ascii?Q?UBZXNqdz8pcUWpi3MnjaG9BqMXVpVMMcnUbRYS9in/pHpWSnX1v2fEYpsvJK?=
 =?us-ascii?Q?gGA+KjiwlF3eJbVxNWHW2HhN4aENHB6AYWrCo1+L+/cIlR+o8KcXDFgpgnBN?=
 =?us-ascii?Q?5wjbfqeKjEWqvB8cEcgy1KmepxUIL9BpyqKmbjTaJsV+SIJAS5gSBkDOVlSP?=
 =?us-ascii?Q?mFtfyG9CJfumEsUkFZSVHUo0jrI6m7jmGUjaj7lioVdmfBlQwHfJPsdGTvJX?=
 =?us-ascii?Q?1aWCiqTIDQKxke/nYaoAKcXiRwcRfDHSVsBQ3nI9iHml6A8i1edXr2yCvXrE?=
 =?us-ascii?Q?V+EGiPWRbbB/ka/tABC/nFbRXgwGLIC3GFpU+wWAl2+LQ+2CKGz5qOBg53Jg?=
 =?us-ascii?Q?gIP0BqPjupvmPC2sS3s5S6D/H44WpOoeoZ7lL1gurlBKo2CSGg0DG0AMTZxk?=
 =?us-ascii?Q?cBJQTxGzIq8hPhuI2mqGpwle7+hFBm3/L/Z5+wJLOJpYY2EApi0KL6ynRaPI?=
 =?us-ascii?Q?hW2S+D/EynL90frdhTXeykdFWGBcN/A7IaW/wtTyY91IC8APwPLSfEIWL0xE?=
 =?us-ascii?Q?Tp1/LuyiTnf8rv/asNpP13HXR3liHD6hXUBxbfqw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3734b100-1e9b-49a2-8ef8-08dd96e274f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:35:52.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EJKCiPCPpu5zzucpOYEPafuN5sQjWyonR5T7lpEZsbGGeJdXwzbKWbfpsvMr4zh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6312

On 19 May 2025, at 10:15, David Hildenbrand wrote:

> On 18.05.25 02:20, Zi Yan wrote:
>> On 17 May 2025, at 16:26, Vlastimil Babka wrote:
>>
>>> On 5/9/25 22:01, Zi Yan wrote:
>>>> Hi David and Oscar,
>>>>
>>>> Can you take a look at Patch 2, which changes how online_pages() set=

>>>> online pageblock migratetypes? It used to first set all pageblocks t=
o
>>>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblo=
cks
>>>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, =
all
>>>> online pageblocks need to have a migratetype other than MIGRATE_ISOL=
ATE.
>>>> Let me know if there is any issue with my changes.
>>>>
>>>> Hi Johannes,
>>>>
>>>> Patch 2 now have set_pageblock_migratetype() not accepting
>>>> MIGRATE_ISOLATE. I think it makes code better. Thank you for the gre=
at
>>>> feedback.
>>>>
>>>> Hi all,
>>>>
>>>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>>>> being overwritten during pageblock isolation process. Currently,
>>>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone=
=2Eh),
>>>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original=

>>>> migratetype. This causes pageblock migratetype loss during
>>>> alloc_contig_range() and memory offline, especially when the process=

>>>> fails due to a failed pageblock isolation and the code tries to undo=
 the
>>>> finished pageblock isolations.
>>>
>>> Seems mostly fine to me, just sent suggestion for 4/4.
>>
>> Thanks.
>>
>>> I was kinda hoping that MIGRATE_ISOLATE could stop being a migratetyp=
e. But
>>> I also see that it's useful for it to be because then it means it has=
 the
>>> freelists in the buddy allocator, can work via __move_freepages_block=
() etc.
>>
>> Yeah, I wanted to remove MIGRATE_ISOLATE from migratetype too, but the=
re
>> is a MIGRATE_ISOLATE freelist and /proc/pagetypeinfo also shows isolat=
ed
>> free pages.
>
> The latter, we can likely fake.
>
> Is there a reasonable way to remove MIGRATE_ISOLATE completely?
>
> Of course, we could simply duplicate the page lists (one set for isolat=
ed, one set for !isolated), or keep it as is and simply have a

That could work. It will change vmcore layout and I wonder if that is a c=
oncern
or not.

> separate one that we separate out. So, we could have a migratetype+isol=
ated pair instead.

What do you mean by a migratetype+isolate pair?

>
> Just a thought, did not look into all the ugly details.

Another thought is that maybe caller should keep the isolated free pages =
instead
to make it actually isolated. We might need to keep per-order isolated fr=
ee page
stats to fake /proc/pagetypeinfo.

--
Best Regards,
Yan, Zi
