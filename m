Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A22798F4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357248; cv=fail; b=i8bNdv6v2KbhpO5hA6kWeIBBuNYHu3DM3ie4J0XHZcrFOZmJIduoGSCR+5Ved8Uzs9926wQvSfg+E757AWtUs7EG2Yogb4qg0L9hrpiZmC57kCOwcbikmu4dN+seR0hhBNuLl5+J2flJ+9reCEHMLzF3onC9mEIskcKvBxj2BYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357248; c=relaxed/simple;
	bh=81fo0kdJkiQGRyowSS/sNiUmqBXvsz70Gc5XMfv0DkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bFvMvKmAgsV/BgSSTIfnmOXi4JsaZANIwHWR8mlyqxSI3YcFmtiHtRfM9qNZ0mmRv6cSV3iqwrEJQ2apG4fsmkqcwKq35FUGa6YpW5DM2o0M8T53nlKb3DStE7qPqkbIy5COsruZ0gOZosiaycy+VJFHMhxor86gUcf+D8CoOVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oZLEBxQM; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oZLEBxQM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOofmatYlKRxbE8tawjt38cu0Jr3nWk/SLZlvWBnVto4kfqL3of0KsTxq644nz6FsOVFT7R8rjY8aYr9JU6VBx0XOWbOIX0GofUGQhfVyP9niLVUUix3GnjggxRWlX9ifd7qOgk2Gd91813OPrEVhwWc+Y0ocyt/5Wib/JV7GO8uccxxBa2XlnTcqArTdWSQQwO4TJahbf51tfyyDjLMgX1+Z44yc809egTY8imRIdIn45obDBhqVHWcQ0BiIEOHQ/HrqILfKt/H9Az56XSW16VYn/jCFd5GpAjmu7283766d9EaSrWwQyikP7STfO92eeWc6PlqY6B7Etc/tEGidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z57eTZ8FVpSVP171m94LLXjX0/0JTJsxOY5kT0lBG6o=;
 b=fjeCJzLOrEWePUtyPNd0yLbsn79hl2EecTlGpeveaL0yhbPzdmKcBxufOIyYqGqGqX+v27sdBeHKRwBxx8Q7C6t8KJ9bERk6RWxvZEAOZiph0yXKAf+pp+GCSlEdMrrsRnMeDryzFK3IqWN8prDNl/gFUZbXiZtwm6m2XjOZGBeFpv0fZ/O2ONufbxa9rJ6yolwBAfxaev4xNP0gELq/XoPKt+h3WabZO5kZUY2bEETwlW+hSiloSPkMQC2YLiooYit8+OvxuA1utJnCnDowComqoMXBV7yclLnO8K2XrObwVldu4Q9Wmv4c70gMotUSm2I04Xtgg8a7BgWyYnyMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z57eTZ8FVpSVP171m94LLXjX0/0JTJsxOY5kT0lBG6o=;
 b=oZLEBxQMFGn2+YzX0nApja2aPm83v9Q8eVGdlNNmD0PnQOFYrNniP9mzugg9B0DbTKxxzq2QYGHSZOZEFkMN/7d4UnAfjq+aFJkU4S7T3Tkp+Aj3DthHQ0WUK7EdafVKtdY4fSSRAnZyeN88jaTEpM0UwF5kY6Ik63HLayAzx8PVnt8tP2W88bWuP8k2cIK9zhwCQXzs3VaGByBStlOPxHuUtjLwLu/dObsfTtMmEgzPiFCdRlbomAD8XxmSneyD5+Isvlj3XLAHZvR83Cmvms6qc83bIoMpx/9Z0nmRAw/TEtMoS0+KqtZh9s3h0nhcuiLFAoGXxE1vBQ73m0L7Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 14:47:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:47:19 +0000
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
Subject: Re: [PATCH v5 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Tue, 27 May 2025 10:47:16 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <FF698439-1CD8-4AC6-8F35-673E0D64D29E@nvidia.com>
In-Reply-To: <bcfe80ec-b5ff-4daf-8183-ef7e2051b16f@suse.cz>
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-2-ziy@nvidia.com>
 <bcfe80ec-b5ff-4daf-8183-ef7e2051b16f@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:208:a8::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb6ef46-a975-4f1f-b9e6-08dd9d2d6141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DVfAHBjhBWykBv1wO6nSI4YdAYiMXXlqB417DLoMeysQhO+g4hrKCxAv9+Uq?=
 =?us-ascii?Q?gGCIX0AOhJNVZMOX4KrvDYzfHTqyTAqn0bQQKD9B7rSObCglZkyuqwjEToYX?=
 =?us-ascii?Q?O/1yaXoTot2ry7zk8vHYjDjgEPLXp7M2W6x4bidPsk5888ncTABLaZPpWdhp?=
 =?us-ascii?Q?YpmCrdgTC8Ev04mDsqRERpZXBfjUif+ONW5o/kBU6B7mhzcr1kaREm8/qVth?=
 =?us-ascii?Q?qLRPlH/HX2COP4p+7x3hDEOok97AU0VCVDF/mIz57yw1H2sfI2oztJJYgF26?=
 =?us-ascii?Q?O1MOtqDOKan7+dR/2cVgt1u77bjTHRN6THJxY8A586+gswxoiBnGm/cYj+F7?=
 =?us-ascii?Q?3NcS3aXExkrapBfAlN3nFFyP8igLTQ+bNzLYLk57VvA6pcIKbGS1WseORhc1?=
 =?us-ascii?Q?TtdwBYNczBir7jOZ24bwlwjhykWDyqO/tZqHqtwjpScKZvMXjlgeXFqARicm?=
 =?us-ascii?Q?6MF5bEX6RLa88PIW4zM0b4Io9hOXO5r8cDoB0R0DAkU3tuv3bE9UY7GnsZkk?=
 =?us-ascii?Q?t/M1zoDp+WV9N6qdM44KH2SsZ5ZdpiGtfKv7Zc4IHYrFC2XaWzkFLbuSHChj?=
 =?us-ascii?Q?da7M8ywl7MMMhsDSTuDPhP1Lm5ZQVBEXpfSP1gxFwYBAyvlyNo921lPQRjCV?=
 =?us-ascii?Q?RU+HCXcU72rJYfeQtgNaQrCwRM48vd0EeFI6vNvnSkCRuAvGFSPCbEpXPCFc?=
 =?us-ascii?Q?z5GiTK32uKNW26i0auF3G9gxbpPyEliEzTtDVw5L+nja3NrwU5lcP/7gGKRv?=
 =?us-ascii?Q?JhaBppnVpiXT4gACRd/HSatRsqL255bCxZqtLU1CCaF/Occ1BnNpbsjKRAXx?=
 =?us-ascii?Q?YeTTBuAxeqkIA2efTHGzc87WkJjcpWmasUHLz9/JvIGrv7hwLfVlfAQkJnwM?=
 =?us-ascii?Q?z1ND37eSFnEfRfrmhY+bY1qlFF8lXELyEsYPr/SBEZ0RHcfSMhaVCHa1O0GR?=
 =?us-ascii?Q?slm0vNy4eYPntNK82GIiFvccLVWABUSSGYOf1GrI7xHCtPscXUpncaK1S7lf?=
 =?us-ascii?Q?4E9sL9Dp9jVBmgtpATL70+RxQWktl/iJWoVeULr27fDaieFzp7hhiy2vDXi0?=
 =?us-ascii?Q?cripeBY6tuuSrq37OfKedDdy12SSahXoqbme2YmY4xLEM2BTNsd46at3kKJQ?=
 =?us-ascii?Q?GYL7ExIxNW96t/5ZcRoJ1GX9otY4r1GtWfWG+Bk4Dz/x66BEeibwpU7XSmmI?=
 =?us-ascii?Q?C7JLJRsz6WpQp2X9+GNJ1UbRhnkV/lFfd40pKvnbH3dGCZVe/oBeregDHFL+?=
 =?us-ascii?Q?PidisYLpbyd7cebVDHZCEDABNEX8U8n2xcocYf0+yxnebQ0btoEF0dLVICY+?=
 =?us-ascii?Q?Rl6d8BYm2rbaSGWwwrLPC1c36I73QkNiVJzkevyPcmLJafk4SEIXbhdr0Y5w?=
 =?us-ascii?Q?R8vTp1Gh/FxMOL9ix9kHBNn3YmhAe9kJGt289QCocHWTDV/JJhUP/E6/qpgi?=
 =?us-ascii?Q?PftRCjT85zo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OS93p1rMIbZWqZbij/6B3LiWZe8laEBsLYxZldrE+MLTo41ywLlq0mf2ikUF?=
 =?us-ascii?Q?dQcZmwwjGN9UT7zBILN8FgxQrbzfebM2y9lyQhZPirO/wCq4se+VCCKsmvS1?=
 =?us-ascii?Q?grbI0TVJAPem2XBC7VQOAlr4HrO0LNtIFJMWp4K1O8tbZK2Ye9wIsaxaZHjr?=
 =?us-ascii?Q?fiU15QFUXgBWg2vv76oYa0Z+Dylbf/eGcz4xU/flNoQu/OYA9rmpGYz7HYk7?=
 =?us-ascii?Q?4jUfc3LH1X00XFh5Xzsq3nu9TeyaIOAKIaemXU09+tggdH2319r1ksqgisba?=
 =?us-ascii?Q?Lc8bOBUcyVKUrgoRe9RDnn/pfnff4LP3KaLs5m0mEuipKyZ1GsymaK8KqDtz?=
 =?us-ascii?Q?rAMHRt7HR0iB+CU110MrqaeGtmcMVbXwYE7fUdcogy+0OTJpIAm6hJgoPpb/?=
 =?us-ascii?Q?gxhswk6ssHYrk1neDw7kvKgTOgVJEad0K9bdc04G7Rwfew2y2KYF9pWyWMcD?=
 =?us-ascii?Q?FgzVX+uBPE+VBun15ekBJT6gkKYeNTdGPC9+f7gRswtg9xP+A5bjFyPVMgky?=
 =?us-ascii?Q?ZbmgZvVSOr+Ds3tP77r2Mu4LaCSKQ8KvdkQQyabb45a0bLVM46QvE6LidSx+?=
 =?us-ascii?Q?aZk1DHvg5cQLHElR4Optac+af2j+bqj3dAikjq8GDv/X0wTHQN2bcds3V7ww?=
 =?us-ascii?Q?uhESspdU3WD1I7sN8VDPule54hdoHPAwt0RbNTLIo8lft8Kuaw3cCKJMY+76?=
 =?us-ascii?Q?OtAA2mwIvSWld+K7iJO4fou8pYi4hX8ENo6uPgQrGC36i7WIA3JiDr2miRcv?=
 =?us-ascii?Q?/nbYAEv+3EnErLklnmkhdXIyUV0scRMYXlVJ39X9R/6U7Q1UPDk8jqyeYbAX?=
 =?us-ascii?Q?pxlQn/Cs7WJ0zjqhP1uuR4L57/GlN/WZ8qlp8b5F1eCPaDchwrS7zVIUtylW?=
 =?us-ascii?Q?6y+8IYBY12aE67B2XLGutQkhOIa/cxiVY0aB9jmHM+6cnCRvyPiqSS0MRaI0?=
 =?us-ascii?Q?LC3c3IQ8CII99/yEq1zycPqdC/D9WHB3/KKAOAXfFYB5Are2ThMiFzK5IS9i?=
 =?us-ascii?Q?Yw+rcTF1nHfW4GoGtoazg9nixcZBVg9SXuOjVaeYYg5tu0nd3wjE9SIM7XL4?=
 =?us-ascii?Q?FbmjzhD6CS21gEDT0hA/duM0W8fnFYsFvHRUGC+ZfO2je+Fu/H2ef5xkGyDJ?=
 =?us-ascii?Q?ndOAiw4Fp0tuMSX8LneB4SRng4+NcmD+DY0Hxb71YSefyEDa+820+y3CMqIL?=
 =?us-ascii?Q?Oi5G/y+JbQGzQD6FdAah0dNvFab4lzyZ6kj0NgATnS1wtVftHtvvijO0QAlr?=
 =?us-ascii?Q?LdM+hgbHgXj3bGmFrISUidP7K0z7KIa9kG64ZlTk1lGj/V2//EXTYWeJ5Kko?=
 =?us-ascii?Q?GlY2BDfLTFVnBRHcj7k/w3XqwQU5Zpm5qpWZILHoYUbByZGKUqDq2f7vvKA6?=
 =?us-ascii?Q?V+cwUM0vT+rKvJAkaqgM2O+Wc+1znIrp3sHN348mONhwP8OxtcxNBvxw7kww?=
 =?us-ascii?Q?DAvr5Wp5y8ooO4vKeDbkAB2Ec0bZNalflWoQi50PiarnLLr0hHUC4AGRUu+K?=
 =?us-ascii?Q?xnBiV+uK2PGlf4LIvsKgWoux2CLDYQRNy4Gs7C/UZ5INj5rRCc02JWNzQMoj?=
 =?us-ascii?Q?NiB+oM0iTk8gvdhKdYvciVtZ3A5NwGUAMWwTdNkT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb6ef46-a975-4f1f-b9e6-08dd9d2d6141
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:47:19.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOVnR0+Tk7EH2zkmXTTUwCieRxjC8NcFnP2TPRUUx+ob6k+vIJxMAVWDOvQ32qUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443

On 27 May 2025, at 5:46, Vlastimil Babka wrote:

> On 5/23/25 21:12, Zi Yan wrote:
>> No functional change is intended.
>>
>> 1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
>>    roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
>>    right amount of bits for pageblock flags.
>> 2. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
>>    like PB_migrate_skip.
>> 3. Make {get,set}_pfnblock_flags_mask() internal functions and use
>>    {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
>> 4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
>> 3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
>>    flags.
>> 4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
>>    PB_migrate_bits.
>> 5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
>>    to use get_pageblock_migratetype() and causing issues.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>
> <snip>
>
>> +/**
>> + * __set_pfnblock_flags_mask - Set the requested group of flags for
>> + * a pageblock_nr_pages block of pages
>>   * @page: The page within the block of interest
>> - * @flags: The flags to set
>>   * @pfn: The target page frame number
>> + * @flags: The flags to set
>>   * @mask: mask of bits that the caller is interested in
>>   */
>> -void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
>> -					unsigned long pfn,
>> -					unsigned long mask)
>> +static void __set_pfnblock_flags_mask(struct page *page, unsigned long pfn,
>> +				      unsigned long flags, unsigned long mask)
>>  {
>> -	unsigned long *bitmap;
>> -	unsigned long bitidx, word_bitidx;
>> +	unsigned long *bitmap_word;
>> +	unsigned long bitidx;
>>  	unsigned long word;
>>
>> -	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
>> -	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>> -
>> -	bitmap = get_pageblock_bitmap(page, pfn);
>> -	bitidx = pfn_to_bitidx(page, pfn);
>> -	word_bitidx = bitidx / BITS_PER_LONG;
>> -	bitidx &= (BITS_PER_LONG-1);
>> -
>> -	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
>> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
>>
>>  	mask <<= bitidx;
>>  	flags <<= bitidx;
>>
>> -	word = READ_ONCE(bitmap[word_bitidx]);
>> +	word = READ_ONCE(*bitmap_word);
>>  	do {
>> -	} while (!try_cmpxchg(&bitmap[word_bitidx], &word, (word & ~mask) | flags));
>> +	} while (!try_cmpxchg(bitmap_word, &word, (word & ~mask) | flags));
>> +}
>> +
>> +/**
>> + * set_pfnblock_bit - Set a standalone bit of a pageblock
>> + * @page: The page within the block of interest
>> + * @pfn: The target page frame number
>> + * @pb_bit: pageblock bit to set
>> + */
>> +void set_pfnblock_bit(const struct page *page, unsigned long pfn,
>> +		      enum pageblock_bits pb_bit)
>> +{
>> +	unsigned long *bitmap_word;
>> +	unsigned long bitidx;
>> +
>> +	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
>> +			 pb_bit >= __NR_PAGEBLOCK_BITS))
>> +		return;
>
> This check appears at 3 places, maybe worth wrapping it in a helper?

Sure.

>
>> +
>> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
>> +
>> +	__set_bit(bitidx + pb_bit, bitmap_word);
>
> I think it's wrong to use the __set_bit non-atomic variant because e.g.
> compaction's PB_migrate_skip (actually a misnomer at this point I think,
> e.g. PB_compact_skip would make more sense if you wanted to clean up things
Will rename it.

> some more) can be modified with no lock. It's why
> __set_pfnblock_flags_mask() above uses try_cmpxchg() even though changes to
> migratetype are normally done under zone lock.

Got it. Thank you for the explanation. Will fix all *_pfnblock_bit() functions
and add a comment about why atomic variants are used.

>
>> +}
>> +
>> +/**
>> + * clear_pfnblock_bit - Clear a standalone bit of a pageblock
>> + * @page: The page within the block of interest
>> + * @pfn: The target page frame number
>> + * @pb_bit: pageblock bit to clear
>> + */
>> +void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
>> +			enum pageblock_bits pb_bit)
>> +{
>> +	unsigned long *bitmap_word;
>> +	unsigned long bitidx;
>> +
>> +	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
>> +			 pb_bit >= __NR_PAGEBLOCK_BITS))
>> +		return;
>> +
>> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
>> +
>> +	__clear_bit(bitidx + pb_bit, bitmap_word);
>
> Same here.

Ack.

Best Regards,
Yan, Zi
