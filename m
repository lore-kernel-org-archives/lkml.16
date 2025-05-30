Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871F14D433
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625058; cv=fail; b=J+Kp7VUFntzX+izDb2RtgHv3XjD8r5VMGscso2sY8e7n5EudwmmgP0QQ1x92+3T/+NvhAJH1pgFeDeo8WSlUtRWnBrwaeUYEF+dFDVQ/S8VSaWjRcPKhYKlOSUNtYRK13K0cOmyKi6pzssi4iWBXfklvb7yxcCAP+TQ6EhGfkc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625058; c=relaxed/simple;
	bh=XcWUFgxKnAMGvGqN61+BQiRXAwU3VWcGf50MggZhNPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cjsE+gNs+sUSoJILeGCvAWBeOCh49AIyqSob/rwY3nz7mea1IvQGS0hOMXlkEnZv1uFYEtenXmhk/wNlY9OwBn0Z6xNN3vLLW9xyJii58l3DCfXl9Ljb61pw4u+WUUKKLHjLH5cFo53+SMnzpX2gyy0LummWld94Fzw8hYn23fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LT58GrwL; arc=fail smtp.client-ip=40.107.92.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LT58GrwL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SywoLYdeH3UzINqz2vqUgKfJmC4CjI7pkmvqyn+5bN2LHdyvM7fLB9chAM3ZDg8Uj5ugyGelJQVl+hYN5WhXMxePhJQhJHF06H+42KvnrB/+fVFq/+cmm+n+t64teRV2IELzRIS6Y7DuTER3vPwGKSHUcRqltVrKFtjir0j6OKfEGbjZUnhYperXF6pO0uCg5NXc0x+otLokhvg8JbXZTZmmiIY3WYeAsMTBLOcoSrwffcaB7rlgMvId0sjjx4LQ7KuICTwjRnnmZFSOe2m5NzaVDY0tW6pYnwvXENSrUD3fKP4bhds+xYkW/bte3hKmRnKrg7hvaEak8guYJhdaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpNxgVU5uD6MDCEtWJs+SBvYdZcaQuiZDGNZiGn6RSs=;
 b=QrlxkqJdXuQTnZO145xWi7WwLqr8H/i1Xggz/tK2m0JvDl53YvzgrHDKP27kN9Onnb5Xf8M14RXARkW/H1FDyA0toogeK2KVLbXSAettKvs+tSaW+s5kOdf+vMGg72cOfLY5r99GL+pzEx1wf0tpw4zPb4uv3BxCw4gtNfFSF4C3II9lqSaYu/tzI7Xlf+YD0L+a6Ob5P2gsJfkkcmOqkQVQHE5d/djsZuKtmW12/VjuBBdIncY6oq0Tzp3lEEQZ5+ifbw9v0l/pwhuKYt+5qC6Ks+XTRpyz98m2TdcbYU0YXeEchpY1+chvZNdC/Rg2+q44DMY2zIw5n0geYSE1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpNxgVU5uD6MDCEtWJs+SBvYdZcaQuiZDGNZiGn6RSs=;
 b=LT58GrwL3eUnibq1iJJto2BibKAkKjlVrNI6iXNwpCf4oGNjfp2i6w6GQ8SJI+YPYhW6h6l3SD6VScYXLuwouvFZzVKiCal6FuXsTQbijPylUDIjngqcprdApzaqD88eSsxtTOlGNvij05nVHbJwieI9wEAh/6kbRbie90+ZYTKpK8hxwsUgA4RDyhsdvQ9X/kosgLmJSHTs+ko6NfFWZxjJ4+po4nfzXuSLHy47NxA6pGWHdTzWwxiDjh+yasVe+8r4TOGSvRV3bZJ3pFLXtDGn8Y0/uTQGUEYSYfw3wAHMUsww0Pa/MP8DA+Ako6Yer9gsq80lJUAoh7a6sppUpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 17:10:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 17:10:52 +0000
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
Subject: Re: [PATCH v6 3/6] mm/page_alloc: add support for initializing
 pageblock as isolated.
Date: Fri, 30 May 2025 13:10:49 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <604F6BEB-7CCD-4C39-A770-E5C5341AE40A@nvidia.com>
In-Reply-To: <4ff13fd3-3bfe-4c29-81dc-5e6c7aaa7af5@suse.cz>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-4-ziy@nvidia.com>
 <4ff13fd3-3bfe-4c29-81dc-5e6c7aaa7af5@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0051.prod.exchangelabs.com (2603:10b6:208:23f::20)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 4388bf30-1427-4b18-3be4-08dd9f9cee55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eBtsBcQxGAXOpfGZyi/wB6zxBochSBxCUbrAufAushK3053ZEUsU9EHSfcJm?=
 =?us-ascii?Q?Lw+15MgEwRQ22hjX829CsYnWfE0oK46e70ta/2lWOgZQaMKPJjyb6kAdBwa2?=
 =?us-ascii?Q?yLjrM8vinPc+kqlAsPzJ3fyKnyagaAgf9iAQquMdbXJZK33XE0vLHs6+OKeH?=
 =?us-ascii?Q?9bhrk8Ve9GNLArOC3ihuHjbN7Bb6HvTZg7LFGvKuM+U2/rlsvhKfzUILF6f/?=
 =?us-ascii?Q?Ph0B5JXsdV9Hffh1L/vl//J/rkBnVwliGluU08ZZGjFdrd5VX8wQ0sCXK/M8?=
 =?us-ascii?Q?j18oKKyj0OqGnWC7d1nIUaJ1USCLOYrzo0NS/46IuGSk00m7JQHcCtmPihZy?=
 =?us-ascii?Q?9kN1Mumn59F4uzBJStcSUu7lOfHV5BKGR2kzokch6XBWi6t/7Kj98jWEEwYf?=
 =?us-ascii?Q?AhDQTzos10GS7lSPjEPCtOp6o2fFkQnKzqOCV7MsXJVtQCCR6Zefw2ZU7krj?=
 =?us-ascii?Q?j/p1WTC7frdD6q8sTP5ekLWNHMT3SH8QMuWsGWHM9C87C1o4EcLeVBwdVAt+?=
 =?us-ascii?Q?2PMc/3pDMQgb5NFnHxjtbXIiCTJbCnhztJ5wFvqute64JbQljpP2kX8dekPJ?=
 =?us-ascii?Q?c+1k1X8fgKcI4O/E3rKbfzmNibO7EtpQn1JrQSer+KVwTet+keuyRMd/n+Lw?=
 =?us-ascii?Q?Bm5zucz8snLEYWGmKK0Zd8YLqfy/GDaLgDOgNB+SPu2tRmLkT1G808sNEsuL?=
 =?us-ascii?Q?oMRp+iAw/sNAC76PTreXicjwd6W9k9vx7LzOrEAZHhZnsTztAXCgyXm0wKTX?=
 =?us-ascii?Q?t8CescRWNztIYzsCuyuCUxdkcho2RmYpC6cOWEAPIcf6sVAl2wr9JSGFe86B?=
 =?us-ascii?Q?JBgjIvInldB7GZtfI2KeDbSSS1RI7RTcHDMGKkswxe18J2wE4dJsVWXANzPa?=
 =?us-ascii?Q?GCAIe33/QPHRXrgT/nAKJzZZ0OuKrcRNbPOkEThA9SYyxrrXZfS/TdspckBu?=
 =?us-ascii?Q?c+9xcIZlw5daV66I/1fOfT/06q1a/pSbD05tAyprCmoYfHjAaZxbVzT2UvoC?=
 =?us-ascii?Q?mygvL+OQdHYFEHCkOBk2QwxwrSvmgJ5kGO65YhqShrDz8Z1xBJ9dY+PjaTZe?=
 =?us-ascii?Q?/GQpEFbsmdW7rK3iszk7sEIra0HTbY05V6cpBSXkcSvFWlAMsLTfwzMtLtyU?=
 =?us-ascii?Q?gA29hF4LE6a8p19nZfGrLwmX+2W0sGr/56rUYnPPz/f9WGNq/GmmXW2nwhg6?=
 =?us-ascii?Q?DRfZl0W6EnlfldTCVixVCOHh5hgECjgrHopICtWEkCp+/GR+c+M+W7b1XRtH?=
 =?us-ascii?Q?tUahhsRJe+jdqXX6NFKNH01UuFd5m20m9hnJcKGO3JOf7e4chH0kq8ZWaXTi?=
 =?us-ascii?Q?Lu2vCvkImlSBxD94mlxoZJtr4TBD1ZPCllHnqh8dj8WGzJLRy1/ce2U9PgXw?=
 =?us-ascii?Q?8V4kMoIGfq34JsvUCWD4zg1sl7zfQBLOe/+lLICwsHJOjslacvj1oEhYPny3?=
 =?us-ascii?Q?6mSRQbK9o8o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BYFs/cQWkDLi5nOo0CK8w7B5D29Eve2DD3wnXU8ZriJT1m43erq8hU9JfC2t?=
 =?us-ascii?Q?BeP25dM7RCQDrisDJo9Qi9v5L89IzJMsPFV9tBbncUUpzVtIF/dU8cqjKaXj?=
 =?us-ascii?Q?RiEFvVXFlQrZXXtf+Tn0gnFNpsTpdWUgC1nPKRj6YgQINlLT81E7da8Wgf4l?=
 =?us-ascii?Q?TiYEF5f2XYJUo/bZ3VFxZyi6EgS877CHa+OdFGULMJtZwU0J7jkAfbfKj59u?=
 =?us-ascii?Q?DEWLQMYigX9vGXa27A5GUO8I0QRLsAGPTWt0+7kYL6Y/O0c/ooeV0Ndb1OXZ?=
 =?us-ascii?Q?eveATJ0xI/RjfXuo54yxsULK6RNUXGkGsE9AgepT2GoX1KLl3rmDllgIYg8U?=
 =?us-ascii?Q?2Hi4GbeOpbRrxSR4QxhEwCdb6VGRl1K4ZsZSq+ryeTPCbmaOTGZHagRQcDgU?=
 =?us-ascii?Q?6TXcTAZrkwX0kYBtv9Ar+kLmfM/y+4X0a3Cjz2542N/WOAzBsoWn+cwUnNst?=
 =?us-ascii?Q?RONdgMjImjwgIJuPSaOX39gdx1at0NjV8alegAmyveKjDGGsNc7z4tcw8yK4?=
 =?us-ascii?Q?/4RHbth6TYGWS6TdiEvJDQ+p49UGJwY4JqwAJy/Uh0Uf7Szpt18PrKjxPapC?=
 =?us-ascii?Q?JWcG4DbNfP1ZXUHYbHnMmygwZQBWJRjJfuYD6Uzdy0SOWw+kmzPVU3cj/oSK?=
 =?us-ascii?Q?UpqDh+rBxmpBbker513TC9dyGf+x2MWzM3ThaE+iDSXz4VXFOxMERJbvzDcT?=
 =?us-ascii?Q?5PdOwwh1nbv4dWWQPd4mPnYT48S8IvqdttVHVa+U5eoXpX2v7ZrVzs6vjfG1?=
 =?us-ascii?Q?8Q7fktazyHSMS+J4Vq+qHV9rzPfP82STZg49rkTQWUSNDrJprcOjSdJUQ6vO?=
 =?us-ascii?Q?me4Zgx2Z56tAlMRZzK7NXvtU4F3UiiqrR+Tou6ZJV+QLgl0bnAcuNo5wDcso?=
 =?us-ascii?Q?NuhvfIMRm0JpDL/eJgqnURqk/w7YtRvAWtNSF1EEr9CN6XAnnba7SZCI4CP4?=
 =?us-ascii?Q?6hs/vu8QXqpUpg+GVn04rg5n7n8TC3bxNYrx9lLcrx7vVUrdQW2ee/MU6Wwo?=
 =?us-ascii?Q?SJNC0ZFb79nXbayy9nkzhZw7KaW7AYM3iNW9zYm+FswrJfnIj0jsKqbIXfON?=
 =?us-ascii?Q?2hTZpq9g/qqLPkC7iXQ8TsGNncqz2YyF+UVJrGxA502ki3hUPii3Nq+4Qeko?=
 =?us-ascii?Q?TyBeIZJdAH03KOGgcy/szBrdx/ZO/KRYHAV0SVSD+538toSK0ibZ1dH0yokp?=
 =?us-ascii?Q?GX2Q1En29+eBMnEiMJo1cc5+m0N4LxaOniN6xqe1fs+TSnZ0fta31mHjv30p?=
 =?us-ascii?Q?Fx5/k69ereTMm5sD8OgDJVLOwHH3LMpRo6PlT3Am0MPSfRug/GttMiCs0fox?=
 =?us-ascii?Q?p9Ea1UUH9cSpy416+f7LLF2fMswvPWTUPLgPrxnpw53z2uU3eYtey/ufdc+8?=
 =?us-ascii?Q?BxtkAoM+p6JIOWZ1ulN5cSY9D87wKsgEotudvVQhgC1I/y46oJ3Rn46ReHLF?=
 =?us-ascii?Q?G3FpodfWO5f4XzO6yhSlz8wDR6g6J6/XZhJCjgFxMun6fdrb4rMJ5kFPOUbx?=
 =?us-ascii?Q?ZK5TPujoYd6Zj6N2rUfMUlBEz8UO9W8yRVU94lHEyQJxld9FSnueG4w2GyBb?=
 =?us-ascii?Q?zm09e6XiaCi3s3dPiy7BaZrfmCYxGJ4PVszWAvGH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4388bf30-1427-4b18-3be4-08dd9f9cee55
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:10:52.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMwuMe3B60vx0XQGmtElqfAkNQ+yG5paTcvbzzxJ4DwNOsLyvZ+BbGvKdyzGoUSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010

On 30 May 2025, at 13:06, Vlastimil Babka wrote:

> On 5/30/25 18:22, Zi Yan wrote:
>> MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
>> to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
>> initialize a pageblock with a migratetype and isolated.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
>> +void __meminit init_pageblock_migratetype(struct page *page,
>> +					  enum migratetype migratetype,
>> +					  bool isolate)
>> +{
>> +	unsigned long mask = MIGRATETYPE_MASK;
>> +	unsigned long flags = migratetype;
>> +
>> +	if (unlikely(page_group_by_mobility_disabled &&
>> +		     migratetype < MIGRATE_PCPTYPES))
>> +		migratetype = MIGRATE_UNMOVABLE;
>> +
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (migratetype == MIGRATE_ISOLATE) {
>> +		VM_WARN_ONCE(
>> +			1,
>> +			"Set isolate=true to isolate pageblock with a migratetype");
>> +		return;
>> +	}
>> +	if (isolate) {
>> +		mask = MIGRATETYPE_AND_ISO_MASK;
>> +		flags |= BIT(PB_migrate_isolate);
>> +	}
>> +#endif
>> +	__set_pfnblock_flags_mask(page, page_to_pfn(page), flags, mask);
>
> Nit: I think this could have also used MIGRATETYPE_AND_ISO_MASK unconditionally?

Yes, let me send a fixup patch. Thanks for spotting it.

>> +}
>> +
>>  #ifdef CONFIG_DEBUG_VM
>>  static int page_outside_zone_boundaries(struct zone *zone, struct page *page)
>>  {


Best Regards,
Yan, Zi
