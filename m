Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C61DF24F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731841; cv=fail; b=t1aRSSGxpivJj48Q+6nuCL2Y/zWP9xa9HL/cbTfoYs6edsYvBmV5yzk8g71NNtBnGvVpxgVMHwJVaSzIVs9FbOyo/p80TIGKrP2RbEYgLm+FvDGEBUzDcmM5ZpPjjmFmZe1Ar4pMIs70/vcD+TaHJVmhvGNeZholiCYIkdWiCF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731841; c=relaxed/simple;
	bh=20KpIxeHcQrUs8z92Y/gEUqnrn/VPCkqBIEh55xZx3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hmp6qmQUHtR6CtkJvtpD/sQ8EsfE0dIPlx8aU6qTbAdalvdPXwcY4SLC8O4RE/YY0MAlb+zi50SifdPCy+Fv/pAq7Qnt38XGz+omT/3tV8ogefa6OEb+/riYI4B8TiQRW0ReYXTGtOrIOWD10cxxjKjX6RL6iByiwNgK75kH2SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=er9oft4D; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="er9oft4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpTsRjWPaerAZAzxnP/UffJ4VchyEkoZCgqMgli+nI4mFzIU3LtIDbxfblc5zwLTRHwkKthN6C0ZQSByyLuJwacR8Hx95V3fK7nIKRJR4NVcte5p/O0F4i/F5yNLlVcO6/V3/Y+8myFNVp//jvVUOB1e/7YlIz/yTpmR4YpqcPSnweOZG9/bnHuQ+qvYr8B+krBmZ8a3hMyzuCaPRIT5NG8D86wd+RRh/RMyI+omI60BOfS6G9ued6dZS+XV9PCoighQbQBcFTIb7BJ5Be76Lnh/UYLUBzKr/+T6ICZbWva9Y0W8SGOetJcN34vt7pZy2MmMCo0pDxSCbNlY5qm8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug4Vhbyd20u+Wm8LaeCnTY809MgpGFFinMyATCaIZ4g=;
 b=lbtncTr4UCGO8OwLI4+kL7BeXwamsAnpNx4gQKRYmTjFOSHICdq7bhaF2bee2JegwphbfTXW0+O2+xLd05xoTrADSmNxrdUTBp9e6gCafgsHDYN0TWBCFeb3R7NyiCfxxVtOPq+4U8jIxV17/triVHZrXoNmsuEd1dIz5V06kRuiFmJKW5/XEOPLZWP/tl4w2TfXesyqO6QX/WhM3VMD+uhde43LxvFrkC00Z6D9/+FHo75JkH8vB5npDyCbaToJ8BclYpgDea52KCjqasElaZbLAiF5Le3iuzPii+MJ7rEmAaa35EyjU4pSfFz+qS7LVo0wEl+9L5Kz3ViiVHgZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug4Vhbyd20u+Wm8LaeCnTY809MgpGFFinMyATCaIZ4g=;
 b=er9oft4DW4vwDm3IncNMbyoZDo0TKcdFOgzE+YjlbDARTlcomDWnYfY51Jtf3loy9MbZrI7KQ9hUklVQoZAsGtd9ARN7xZUMtPqtPwFYXqGzpvdvpbbfnIz7/u/TbisS3PtG1uNHpWkX6eChPToEvgGypeT2BsanW/LYPLhtueD2FgITB346zz1vINqN+RyyG+ZK+zhOrKIo6Ow47tNiBD1td7HsEBTRCCIqtLa6PjU6MnPSNAwy+Iw9sxzEY4waTOjHawNiZgJYMhBjrneBv9LTVbE8xUXP6hbbl7FbHDTiBoIMWlj/OLlwAxMSLFmU3v6lGnvwhBofTKRmBcJkRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 19:17:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 19:17:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Thu, 08 May 2025 15:17:05 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>
In-Reply-To: <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
 <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b93b00-30c1-439c-cd05-08dd8e64ece9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3s52FteKvBhhhqN4994/9ifuKLSb5DolshwSJyXsDmwYztbpEfcnayLzUtcv?=
 =?us-ascii?Q?GsZznkB5SRtzs8ObHEvsThWfRfAX2qC6g4ZD9eixkQwRrXUW1R20gEfIQLLr?=
 =?us-ascii?Q?00OADr3f/aGY1k/HrcpzxqSJfn9JsOc5Ylg80ivVT75gmbDZ+rv05uk1ZVad?=
 =?us-ascii?Q?fyaJd1oRzguacLqj/45JkjCFhaJ04pxqS2p34d06Rv62pNUdbgcOinmGk+tH?=
 =?us-ascii?Q?JAMaIm/AKxLSJh9fiZm6/qcwoB92nrM43fXMr+JeTuOwW6EaJqMOP4N9UNAg?=
 =?us-ascii?Q?rhTMG+ztvJVf1IBhwMES3iIlnERi4dF5cotHgkAO7hnRnEgBf5ilU045vYW0?=
 =?us-ascii?Q?2zboWMcsUuw8X73zNDEIUEpPPbjXPbW+SMfhB3B9EVTes3LFkT3h9uFoCacx?=
 =?us-ascii?Q?nInfkFwDgHheZ/UI3Rgc34PDqCATIOJ7IthaUL63qkH66ROHjLvFrj0/joEH?=
 =?us-ascii?Q?RpesRRhu4/8R+hwHYZjQqP/7910b/teHEI+yekKrBFjRUryuNbwJIn8FgNdS?=
 =?us-ascii?Q?Sm6KGd0gYi0n1KZs2u62MQlX8cS1UkwGnGPF6nkLEVIlxmestzdj5A7cwiEv?=
 =?us-ascii?Q?85YV6hkwuuapKmcVJIFOnEER9BgqV62pR9jviqhFA+FlVVzXTicTaFlZjHvg?=
 =?us-ascii?Q?aTyo2Wab6Y9QT6sveM9o0Gg9yfRoCNBviIOeYPCZlRYYR5O8p11w1TroLXZ2?=
 =?us-ascii?Q?YHzuRwuLNZmTbtYymtw+ooELROZodoXpNomhCGf6TPKYgKdwKwxuoptbIteR?=
 =?us-ascii?Q?yh3Ff17mU/53ifBXwQvlwxPZLO2ARpuwFgjOAD7zypcoYr+EYBHjPL+RleMa?=
 =?us-ascii?Q?3GqkLJKwWw56c+O1rWQS5rrO4clQ51qeODO5kYKCt6yLRB2l9wGyCXO9XL2n?=
 =?us-ascii?Q?rT6T6UHunfC4E7pWRil1hLc3GwiRRZWq4W1EZiQLICF1qC+EKTc7fu34H7+a?=
 =?us-ascii?Q?anFXA6VumvnIvjTi/Hojsv3pQ9C98SDkCyVsqFGXhWOOmpMjKSabRjLgbX+g?=
 =?us-ascii?Q?1HDjGWQ9hVxGuAAVMMOcohMh/Gn8p6vN8kW3GqiRerIhsFVARAwSz2SiEfke?=
 =?us-ascii?Q?oYi5OA8ULxNLF9L56a739gTogk5y+W8OIwBNWWajMvDzfPIj3RNDkDEPTpax?=
 =?us-ascii?Q?qkKiP96+9qhP5yfPIGPCvWfS7oQfKaxEBghl41W9Y/td4rFpS1jtCEn9tTzr?=
 =?us-ascii?Q?OLZJH6716XlIA6tmqZqFNvmdAZwkBjbkUf+hMtduVU0IrEfIsk0fUUp36Rsj?=
 =?us-ascii?Q?YhPENCiHvLjDlxTAt+AzD8ftre0qLd3q6UqD/YfGdi4IN1oe6GwsiCuJMxpV?=
 =?us-ascii?Q?4EZSqX3AytSHHK7lpPum384vMBYdHjU3iAM9MruYjLj42DuEhVesyNlV7wnP?=
 =?us-ascii?Q?qRZTQuJrHXsIwmvgdOExeb0t+Jds6gp7cG9YLCNWWLPk9SVaI9GgwOIBBVUg?=
 =?us-ascii?Q?5FDjKGcHqho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EDLVVNgE/EJ4AGfMnNuK3ZX51d9y1dEWLW2HHLWTZHxgjW4zub9R6jOhmpI7?=
 =?us-ascii?Q?M+06TjFTfOMSNmBrOofD5ji+zuEn0yqKsVJeNMm1TE8OcJyDH/rVHHRpb/2L?=
 =?us-ascii?Q?80KaJgBkNbAdUTTUm9EJpsB6QNkUjJ6C0NmNgHuDC4TBTglp2OARd9UdfICI?=
 =?us-ascii?Q?sY9pVAvGpbL//RD65qvBHEc/UWdYrGj27iQ/DXhqF3CvFawog/O5CVenq/Pv?=
 =?us-ascii?Q?R6N1B08dZQqv+/+imggoLmeYaZMR2Vq3urHa+NtPulKXHoI6z+iQlF2C+hTY?=
 =?us-ascii?Q?cpL+YpXzQK01YiBLR7gnBfcfkGWcvhqYbzjgCvJ8C3AxTdjb2yQ5fzPQrKsz?=
 =?us-ascii?Q?mU2J5DwQYHQ6pYkYvTWRmoI6ldFqrXQlFF4OPTyheFXEN09iO8OoORXtfw0d?=
 =?us-ascii?Q?su9FpP4JEhEiXoeeMyleCtNN+O0gkmZT4wlMoOL/Aph0XleeI3XMTaA/Vztz?=
 =?us-ascii?Q?YVYdSfBEf5GkwpZ3Uu3tEeXGyc/y/H1Q+6AoxPefSis2iHQe/rphnu297Hdc?=
 =?us-ascii?Q?gRpht4+804gC3GcDWdojrSW3UhdLpCCX1X4rG8fJ+94M7ekb/N0L9zevRNcB?=
 =?us-ascii?Q?Wak6Z4Soxl+gE6BAsiZFWM1Jl8Alt57KR4JN/CeBpBjWiP5hkoJPa6LGole4?=
 =?us-ascii?Q?dFKxxlOZAcDFKvHKMtJLj7f0g05f1I1UsCXd70Tbo/ZMM/PlW3s4ILM0cMoE?=
 =?us-ascii?Q?vcCGbYROpq/IeVpKX3NIadqWMs1FIgRj3tP615iVO56ELxoZ7E68m2Ef+WH8?=
 =?us-ascii?Q?DWFAEsNFFQiihhnhxHKfdXkSpRPy8VRCSbI/umPUzjsd6ekGCBeddv7GJx9c?=
 =?us-ascii?Q?A2waAH1PBbMxNZGBxH4L4X5aSOmZZfzHJzi9DTcUX1Xp8QeZRDNdkH5Jno0e?=
 =?us-ascii?Q?186HksD4c9oSaxUFYvjkN5JlYgnvXXRSU0fK1eUDiIrjt19ghOugTc5yUjND?=
 =?us-ascii?Q?VjDNQsaIbjhUjTm80EzAwF5G+MTPRXqv3znJjey1Ep0CHkzNfwZR8DmgckIn?=
 =?us-ascii?Q?6ugmaO0Ppsgg79QzasxrR8HZmYKaLurQFkOt42arr2V8kWwJqS0s4L5bTph/?=
 =?us-ascii?Q?Pw8jR2egC5TNOTLJrBlkKcTnWSyeBxTuQkSxfDQ+JMFLSIl7zhYtQvjL6ep6?=
 =?us-ascii?Q?7o0dm60JnwUISaDupTH1DoLACjcKc/rBy9edS1JWyKxg4LWMMOxHZO3vxOzM?=
 =?us-ascii?Q?MIE/ZBTiEhRKvILgknxwT+5hzTuhRq4xtK3oqDVgc/JSCzUwuI+IlHc+k8kE?=
 =?us-ascii?Q?brdW5aWXWeTqeENzJzybuSj49OQDq5GOwj8MlNH2iL0FTV3KWfLC1m6plpea?=
 =?us-ascii?Q?l4pPahbWoCRkJKpDEBTMAI9k6vum2RYAmJ30O9jdZrBpO7RF1IuJP+rR1y1v?=
 =?us-ascii?Q?MfeACMGIbdYQqsj4p9n8mP+iuickTh2ENzMF79eHPqtxwEVp/ETw++DKNjEt?=
 =?us-ascii?Q?7XJgGNHJsOmOSf67c5vepziG3X+Qi7pDY8E1QVa40LndmTTAADqtUC7/QRk2?=
 =?us-ascii?Q?tLsKM/8HTtQhnCZhlB2WkMvkogz/wXWwvaGYItRnodPnNqyiwbyJHZI7/9PR?=
 =?us-ascii?Q?mkccGHdHIpyV6wRtjKJO1GC3d5J3imuhGjTo/Slc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b93b00-30c1-439c-cd05-08dd8e64ece9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 19:17:08.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C96RLISypDVBMnos4ugRq/fTEMGkALkkZ4JTjvXgVU7ljFHxCBOhEMEpao9up8Pw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491


>>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *page=
, int migratetype)
>>>  		     migratetype < MIGRATE_PCPTYPES))
>>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>>
>>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>> +	if (migratetype =3D=3D MIGRATE_ISOLATE)
>>> +		set_pageblock_isolate(page);
>>
>> Are there paths actually doing this after the second patch?
>>
>> There are many instances that want to *read* the migratetype or
>> MIGRATE_ISOLATE, but only isolation code should be manipulating that
>> bit through the dedicated set/toggle_pageblock_isolate API.
>>
>> If there isn't one, it might be good to enforce this with a VM_WARN
>> instead.
>
> I checked all set_pageblock_migratetype() callers and do not see
> one using it for pageblock isolation. Let me replace the code
> with a VM_WARN and add a comment to tell users to use dedicated
> pageblock isolation APIs.
>

Actually, move_freepages_block_isolate() calls __move_freepages_block()
to move free pages to MIGRATE_ISOLATE pageblock and
set_pageblock_migratetype() is used inside __move_freepages_block().
So the branch has to stay. Will use the suggestion below.

>>
>>> +	else
>>> +#endif
>>> +		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>  				page_to_pfn(page), MIGRATETYPE_MASK);
>>
>> If the branch stays, you could add a `return' to the MIGRATE_ISOLATE
>> leg, drop the else and indent this line normally.


Best Regards,
Yan, Zi
