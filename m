Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1D7FD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674967; cv=fail; b=fG7FBVseu1WjC7+KVH19eJ7SyGg3/hwDpMf51WEpBvSy8ENmaq48xgOTZmxHL61ysiUsiFmAuysLUItD+rswLFzAuffldc8qbhfIwjbg7/45hZ8VcHW0eR0DP+NRwjaOFqj6ljpvfSZSSGdthhCvRVvlBWCr5rTMFNKS2S8VAP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674967; c=relaxed/simple;
	bh=OrLSdI+P2919Qk12IIIh60S5SsjAG/cOhVnFHY+xfBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rsKB1CkYWTYYdzPmQqQE4Y2fdPF4Ji0ywqUVFMYBm7L4vASMOsvWD5iv7v6Mtp4DJNRhQxHmcZ8ASoxyZoMJdUzLL8hp3hs1MvgDs5PmojKl7DeiihDxJSIKvW9jHiPbmd48rQ6I280CfEFuszUIesQWNVB2K7iPFj7GADvxqnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TCosXxty; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCosXxty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+5jfWVGqXK2pc7Xd3p8iVekS1kYr5IqaZEfWvmhY+wpmYPZBXWuqUjF/fM88Jp+knqf0hnVduyUbzF0959A2IVRp8xXK9CVqCRBOZkOkZaDGOyt1M+eVAwckYexO+FTI09qR6ro5s3KaxUZOr4++VsxJaAiw80X/ky38DLvhadmB5VdwhKsxcjh5tL3tIwY3nCq5QXewTdsN8pVKRkZGTj/F0e7uN2dV1c5RiMxheNUuwFXF5xITCTA8R/IM8zEit9oqiBr2+7US/G47wNtwXBe5gj8RZAX0YaWN66oTzNr+Hhw+t+Qx46Y8c2+tt/nSrDOa8bmZmTruIR3he5vYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YZp9YdfCC177Z2AVP9Y4V28CFEv57JmkspIR2Q7jIY=;
 b=pI2zBnlFHKP9/TU+zx7L5hd6VSbZId9xZmpoPGsiA1SlWzyXQiD4SWZ8nez5goIEBErN9I3jV5EaHJWuhirK/bsZ+KyEcIRiRPgCDC1/SXJLs4FXDywBbR48aMaBI5dEbEdJKO1mCiSXxkev2tGu07ky4eJxlwCiadY6hrEt2Ogv0FFGEjZ5m4OluWaDkmbljd7noy7U7pPD1iBcegsXaEgnarqhRDXcLnT36j0txq10DNXFP8N8Nd3Xt+/7Erb80ZQjVqiJ+bs8vflKECxN8MWn5lSbQOAEhM+3Z7jejlbBsU/V5fDAEc4Cpw0fxVTwrDwBI0WShL4NAqi7O16t2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YZp9YdfCC177Z2AVP9Y4V28CFEv57JmkspIR2Q7jIY=;
 b=TCosXxtyn2p/1JvHGq1Ty3/AnnMsNfbnq0eiuvE+OAFuqC12+bPC67YyGtXclk9UUrgXx9ch6sXK6T7kwIxrJmr7HIzOv0FClKej4aZs+WzbXAGv2l57tUrChFabmNlzgDrMokLJrieH9apkDrjwROQVDQj8ISbQL2McVeHQucuuSUM3Nhj6G7pjFtv2u9I0m34OWAlY4V3XO264ecuJu+kmStLC3uhnGld7kWPxgMXAN71HHPzZ8OWRI108mRu5U6PnlNsNJnDkxMzY0C0TliBJsjjznbvyki9LOLdNRplHkpPd5Lv5F2RF50cbr6cGwBX9P5c9HHBtkgr8T8kZZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Mon, 19 May
 2025 17:16:01 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 17:16:01 +0000
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
Date: Mon, 19 May 2025 13:15:59 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <E04CBC28-EA76-4CCE-B299-BC85FBFDB5DC@nvidia.com>
In-Reply-To: <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
 <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
 <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR20CA0064.namprd20.prod.outlook.com
 (2603:10b6:208:235::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbd37d9-9ba7-4c4f-5870-08dd96f8d416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kh8mbB3pPw1IfUIcbn2IqGF0E0m3SuFP/cEaGPQbk9qAlAGU0Se2sbR4ITca?=
 =?us-ascii?Q?9wNDxz2i2Kxzvq0VXO1N82+pe85tVftFG0zWGL6kQS7csCg2g6nEQks9ztB4?=
 =?us-ascii?Q?vFab5ETKbqNvVJNI88EBNezDtS7IwOhm5qRYHbeJUxm+6yUVqByQGGx30kcn?=
 =?us-ascii?Q?l+MldgYNMdGa9pR6SR9vQy2r2+6Lr1eNUp2sSXbac3/tUgzGlvOZfQTBrkDn?=
 =?us-ascii?Q?FdnydN69eqgcXrh11fwB0AAz1DE3eYk+p4cP9Xt5MQ7dDPB9x/qyJfLIWScj?=
 =?us-ascii?Q?rQyFiGAu3YnOAq0KKDASZFvtAQACkxUY5aiSE1L/VGUp3gIfbZHeJ1ZdEg3u?=
 =?us-ascii?Q?yqZG/Kv/f772CHQGZMKNAF6mBnfR8PeIV42Lra/5yC9x16GSdWhf90smqTg+?=
 =?us-ascii?Q?eaC6cyVWVqnuX0Fj+/iCWm62D+Upm3Pd/hgNoPkQvQETfgyM5UQbAXG4Zmxy?=
 =?us-ascii?Q?V7P+SLLUM8RIaySzXrAzDnD8i/lvS8I2ssWDyN4C0nSst212y46vY+QGgl/a?=
 =?us-ascii?Q?h0a5y472KthFZQyXX1pVuDPv3wmoPApQjyWSpjOReLw1NT8IPCZUjzi0IeEO?=
 =?us-ascii?Q?bWrZkGehuMDO19AMipPhIOqDT5gKvbtcQi2Ba0HIrOdeP+TkWdhdEgnyP4ml?=
 =?us-ascii?Q?i5i0CMwf/TqinSW+QrdsOFw75tXdzM6xXEk/7uVq+7cwQugZ/1+4lflPi3Fc?=
 =?us-ascii?Q?q5yuADnb2fjARrGY6SIiinDZ/Jf/M0tG3oDGx3xYRiOXsC2VCrZ0pIG57TLp?=
 =?us-ascii?Q?lnaoS5cu1oGT7ypnEmr2P/1R+jew+gxhq+pmOluXRxA/bzQhvcoV/qLK2u0w?=
 =?us-ascii?Q?ZNcZZo2D4zrz74o89B/fRffMoTfSXppiXtcStmAIT8rqNRMrIrHn2sreNifu?=
 =?us-ascii?Q?JjPTV6JLxJFDQeGCRzcJFfJZ059zGqBV4DC2rx3nNcjqInZs0nyGcOqKbsla?=
 =?us-ascii?Q?QrledjQHwx8dpdn5ToznwX9BhkdPlJ0BlaXcYO03KC1wcXFGFwtiosdLzh2v?=
 =?us-ascii?Q?jgl0wRZfwF/xeN2/iwyEgTTDHtAcqWQKeS/NkUzXP+zce5F3zMBCrReJa/Rh?=
 =?us-ascii?Q?aY+C410JjbeOY6AhFLlr8YAQhowjJSxnoLjys4yfPpm+RjLkmuVI463W08rM?=
 =?us-ascii?Q?13rKx15UpFX7Yx1LiDMYvah7+Wo4pqLhw8XqQjjpQ/RjL0Tl24r25YjBX4Zo?=
 =?us-ascii?Q?3FltiF0MuT+0XZDYHb45nZC+EbvGhsGPH43GvMPqwMMvFeo81oKFp0/j0zyN?=
 =?us-ascii?Q?ohErIOkqZD6mANeZiCvPkfjhrdB7tYXUhRRfZpB3TsGNdgULbSaX1wHsnWRM?=
 =?us-ascii?Q?bBPd+x0m6sKDJerFmtKatlNDUAN0AlGlfyE5w0W3zXwEbyaVsX+xRfoyJULy?=
 =?us-ascii?Q?W2og/A3sp62Mmkg5YPuywUzfuj8iSMVxEitOOPK5vxa/4aQcj7a9btGbXyZ3?=
 =?us-ascii?Q?4YG3iquOdJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sc2IY2AfVT1GFyCRZrWDny87xae0boxLdgTV6Yfb/fEVJbJV3WLSfdqeox0i?=
 =?us-ascii?Q?NK5k0aaX89YL6KJrEiwxJsnv/D2x7rKnJ9R0WYkH8xYjn/j+3tapMxGnwqD5?=
 =?us-ascii?Q?xxxuVVQEZC3R0PfIuQ7ASC6aKw0IIYnViQRehhj9PlJIKRRZODq2fEtSlwFf?=
 =?us-ascii?Q?u8JkgKQGjXICn2Hd4ogcvAN1SIZFQd/rbj/13JS6vvRsYlyJpmHX21rvfMIV?=
 =?us-ascii?Q?r17HCEOlfehnyfx2JU6jgSr8pQfNuNUtO5LLR4BkQMZMjbseNWagKW6vA6Yc?=
 =?us-ascii?Q?CiZrbzDn4Db4vmcq5L0ved6sWuxVqB2R82J+Uzah+At4IS3c1VPvOdVqLFj6?=
 =?us-ascii?Q?YN7o4VytW2ryIUhuZ8a1rBu/mxAF9LH7dK4xYIt/NHMFwdS/JEPbp7ey+Ftd?=
 =?us-ascii?Q?qTtjPTKBakB11K1wq/LhAR8H5BgLmko2hX+DO6X2mbA4qT7vpf6ygAbGmrsu?=
 =?us-ascii?Q?PUkTyjvgfE5iZKjcaxy569SPR3TndzjAfa+DY1ccsD94YzoISB5YJkqPRj3G?=
 =?us-ascii?Q?yvSd/xRcY1Vli9DWLYlgt8Zb4kuRwkbcMRSxzr0RuZS7UmTerZcjCyqSOpmG?=
 =?us-ascii?Q?i0hTKmhTQxu7aqXofH39HaGjCK4Osi1RAO78XykycPGSMjF6QDzARv1HDbzT?=
 =?us-ascii?Q?2XBr3KvntoE0kOZHjjIcyW00dkjnoDFkAzsCPDtxHsdQ9U6l4Jk3fi/zCd2+?=
 =?us-ascii?Q?xhVc/SXvrmABNILkRG392IWXMmcq/2fhsLYxy8LBfzY1kCyqmIW3UEZ/FnAr?=
 =?us-ascii?Q?dADnY2+NOcmUtRMk40DlBGWBUYkJPlQJkDc9Gjz8w6SjjUiDtziwmuNChPIG?=
 =?us-ascii?Q?Tmy8eA01bZ8MPuKdC3JT8pR4fiQoR4uGsUVqN08vUWs6qEdwj08Ch72m1vmK?=
 =?us-ascii?Q?2mCLCJsN3Bp6vpTOwSgIMaP+EVnHCMMNIz21keHc6mSreDxSubQywTafJAmn?=
 =?us-ascii?Q?txMb9paWR/+JxKiR/NSJNqaZtDaCYMm8/HIJ2FgiwFO+lPFScFnQylS1/Hvm?=
 =?us-ascii?Q?Tvyh/ypt+88dhT7M6T5dqO/q7AyQpJZHOibDoccTk6c/7gY1KSLLLfPb4S1+?=
 =?us-ascii?Q?1KYRTNElLlaN5jnzZ/+tns4XIghxyaOTON/xDJa2G3Zm6wAT1uMLSt3x5E+0?=
 =?us-ascii?Q?lgUG5aYdpNaYrAewODeNJdFrI1TifhT8igdxLxUYEy0w0/2DAx6yViSAO87y?=
 =?us-ascii?Q?n9Q1EhwJvknGSMw7UABb9d7lAWdsUN2t+DQld8T/sjlHuRh8IcBHrrhpe0PV?=
 =?us-ascii?Q?i6gFu9zUTSIBOJtZRADlwu7Z2Cw7rWiJ2xHabx4vN+bN5acf2OTs0azl8wjp?=
 =?us-ascii?Q?6RQKgrf3DaM1UZCH0s2GH8SfqPaaueQ14hu9g1ewWFrkZkV3nQcnHlctkHrS?=
 =?us-ascii?Q?fLybViwLET6Om7bWHPdTBmnRniNRNnRJWmG/2bbbLeekl1g06tqPVxMAa1S8?=
 =?us-ascii?Q?T0V3mPYsLDGKpM+QV0tKn3Ii/WGGwahn2QBpryl3HuxYfrS5bkEXWgvWR8Ok?=
 =?us-ascii?Q?0SYEB5/xU68j8RmUF3COSgooXXZv4VnTtnet5OnArKhXlDY9jrQVJRZNbcPn?=
 =?us-ascii?Q?kEffF8Rcm4501Lh3STo7e74HUY9CK2A11NhEVav4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbd37d9-9ba7-4c4f-5870-08dd96f8d416
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 17:16:01.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh+WwlWUGWu3GgMKhLU9GBZN2ctQpAYhJDbK7Kkc0bZrwd3Yvb0QqxROyrWOkWq6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934

On 19 May 2025, at 12:42, David Hildenbrand wrote:

>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>> +	if (flags & PB_migrate_isolate_bit)
>>>> +		return MIGRATE_ISOLATE;
>>>> +#endif
>>>
>>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how coul=
d you ever get PB_migrate_isolate_bit?
>>
>> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isola=
te_bit),
>> so it gets PB_migrate_isolate_bit.
>>
>
> Oh ... that's confusing.
>
>>>
>>>
>>> I think what we should do is
>>>
>>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>>
>>> 2) Remove the mask parameter
>>>
>>> 3) Perform the masking in all callers.
>>
>> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
>> get PB_migrate_skip. I do not think we want to include PB_migrate_skip=

>> in the mask to confuse readers.
>
> The masking will be handled in the caller.
>
> So get_pageblock_skip() would essentially do a
>
> return get_pfnblock_flags() & PB_migrate_skip_bit;
>
> etc.

Got it. Sounds good to me. Will do this.

>
>>
>>>
>>>
>>>
>>> Maybe, we should convert set_pfnblock_flags_mask() to
>>>
>>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>>> 			      set_flags, unsigned long clear_flags);
>>>
>>> And better, splitting it up (or providing helpers)
>>>
>>> set_pfnblock_flags(struct page *page, unsigned long flags);
>>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>>
>>>
>>> This implies some more code cleanups first that make the code easier =
to extend.
>>>
>>
>> The same due to PB_migrate_skip.
>>
>> Based on your suggestion, we could make {set,get}_pfnblock_flags_mask(=
)
>> internal APIs by prepending "__". They are only used by the new
>> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{sk=
ip, isolate}().
>> Then use {get, set, clear}_pfnblock_flags() for all migratetype operat=
ions.
>>
>> WDYT?
>
> In general, lgtm. I just hope we can avoid the "_mask" part and just ha=
ndle it in these functions directly?

Sounds good to me. Will put this and
"#define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))"
in a cleanup patch before Patch 1.

>
>>
>>>> +	return flags;
>>>>    }
>>>>     /**
>>>> @@ -402,8 +423,14 @@ void set_pfnblock_flags_mask(struct page *page,=
 unsigned long flags,
>>>>    	unsigned long bitidx, word_bitidx;
>>>>    	unsigned long word;
>>>>   +#ifdef CONFIG_MEMORY_ISOLATION
>>>> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 8);
>>>> +	/* extra one for MIGRATE_ISOLATE */
>>>> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
>>>> +#else
>>>>    	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 4);
>>>>    	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>>>> +#endif
>>>>     	bitmap =3D get_pageblock_bitmap(page, pfn);
>>>>    	bitidx =3D pfn_to_bitidx(page, pfn);
>>>> @@ -426,6 +453,13 @@ void set_pageblock_migratetype(struct page *pag=
e, int migratetype)
>>>>    		     migratetype < MIGRATE_PCPTYPES))
>>>>    		migratetype =3D MIGRATE_UNMOVABLE;
>>>>   +#ifdef CONFIG_MEMORY_ISOLATION
>>>> +	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>>>> +		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>>>> +				page_to_pfn(page), PB_migrate_isolate_bit);
>>>> +		return;
>>>> +	}
>>>> +#endif
>>>>    	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>>    				page_to_pfn(page), MIGRATETYPE_MASK);
>>>>    }
>>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>>> index b2fc5266e3d2..751e21f6d85e 100644
>>>> --- a/mm/page_isolation.c
>>>> +++ b/mm/page_isolation.c
>>>> @@ -15,6 +15,17 @@
>>>>    #define CREATE_TRACE_POINTS
>>>>    #include <trace/events/page_isolation.h>
>>>>   +static inline bool __maybe_unused get_pageblock_isolate(struct pa=
ge *page)
>>>> +{
>>>> +	return get_pfnblock_flags_mask(page, page_to_pfn(page),
>>>> +			PB_migrate_isolate_bit);
>>>> +}
>>>> +static inline void clear_pageblock_isolate(struct page *page)
>>>> +{
>>>> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>>>> +			PB_migrate_isolate_bit);
>>>> +}
>>>
>>> Should these reside in include/linux/pageblock-flags.h, just like the=

>>> CONFIG_COMPACTION "skip" variants?
>>
>> They are only used inside mm/page_isolation.c, so I would leave them
>> here until other users come out.
>
> get_pageblock_skip() and friends are also only used in mm/compaction.c.=

>
> Having these simple wrapper as inline functions in the same header shou=
ld make it consistent.
>
> ... and avoid tricks like "__maybe_unused" here :)

OK, will do this.

--
Best Regards,
Yan, Zi
