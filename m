Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0161E1A9B40
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148000; cv=fail; b=sQ//m3zEN9CZvGIwCFYrHPZrXse4W2xjS6C296cujBqYINgKF/2MHGaCNXajUXr5vzyYeul3x1yhGpsikF5HnK5iFe+Cx4YG8+BeXJbZaM3ZlMIBW5XrQkXaF5DEF7b7GNDHCbx9EdMMKZWxS5bT+t/d4wE+V0xBR2ckfWVYjuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148000; c=relaxed/simple;
	bh=CBY0r1xCYpqYLJg9g1i77HkWJpU26glmdd5V5vNiXwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OfIsWIwrC7NzztPOf84gwPQRcaaWBg8CMJQaX8iWzhIOvX8f03vbG6qsZUHieREtH2+I1z09VJTTPg7zEXmtfoolqDhXvigV7gRez9XYMDsJKGDpijHcXTUL0+O6KYwXkYMhdR9dfAGnSmI7aCjfgq9o7moXt1ZmfAazOHidGXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZGGm/3OD; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZGGm/3OD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt2u6ItnruLOg4T2kI1DCCvLQjuZT1YmQ+oXAkXKY8TGCLW8dsddNDT69TaVrQP7XeMaAAVcFdU8Aoq4YtKSi0CgqOZnw45KMe7pWHyoK8InpZR0oU4PytxFw/20QbNNWjkH2zR5aut2EjDRYEdX8TK5LJwbCNb4PMAg0TFf8ZUT+xs24/UIfpDevLOcl5+Rj5r83hOfYa5d+b3FqRL6r9z/BoBiN58RMadERirSiOHWudww4qGczxot8QXBieMsisUsDaXnV+4WVw3U+B4PK2V5jc/VPBGlApki4eo7PHDpUuUlvSlSjGeCpc+TzPSId9VgQUq4o5hJxquJm8ECsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPJR3ExJYAgxiDGLV6Y5aOIyR1rNE5qGz6c/EveYo8U=;
 b=YY1hqr4aNKNhlHAJ963HKlsAiHH2WpSsPkEahN7vR9o4mc1ZrTT5DCYctifPVdDei8vhqBF+CAnuCB8O+nly1M1tsLJJm/khqT/ICSbT3YWNW+9jUZ457qSYX/D1mz+ywzMMFWpGvk21+/A1w7oT5WOeAlm2Bx4s/fsQsjm+5d6emnc6jKe+aSRp8iBPumGt84ILkU+W44uB319hSjJNMYIcT5rxFIRFJ16BoAbWxigaREG1C77ia1VsN6tA/UdbxiYGY7s8lTiVov6RMu5x0RTfli1EON397nPyg3mb7xrs5UXAhs7bWXDKPcsGF2nrkfZGETLFP5KQk4AOx5YlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPJR3ExJYAgxiDGLV6Y5aOIyR1rNE5qGz6c/EveYo8U=;
 b=ZGGm/3OD4oGtt1BbZF7CAdl9MMn4yPbOnMhORANnoIf/pKKdVFk+ZONC7kaN++ZQkTk8oi1F1y6UxKMR1yA/j1o0a0ojlwJnz75pJJ3hROo1C0H/3HMBbHfuS0yuV8MCmm0NLypGBwkOCkuGsPeR5pP0b1TqyUmHUZ95jO11MKih2MMJ9k9U+JVxB1rpOFx1IAN7DRgXSEfAHyo8j0iY1GRdCovnuU1dtZQybpeOMirKP8/fF24ujXbEQp8oNgkgyTGvc+l+UmZ2Fy9DUC8xPBysM7+nxPrcyZ36ZrqG6njuoP9qFQ7xeW77q7ka7gsauk1VEW2xnY3MuDZSXduwqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 14:53:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:53:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Tue, 13 May 2025 10:53:11 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BFE3232B-1BAD-4C21-8C74-3C22CEF7A95F@nvidia.com>
In-Reply-To: <D9V00HM1BVDZ.106ALY0AVVHFK@google.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <D9V00HM1BVDZ.106ALY0AVVHFK@google.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:530::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: eef27cf4-96db-4d5d-26eb-08dd922de2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6kqsTgEPeyBMwj/yqDCQXjHa8uOOMco+gofCgOFH5H/b5R/ilPEoWCOLCAp?=
 =?us-ascii?Q?8KuSnoLuHYaO09pMpolfZ+J49E49akOZ713xNEPa3jY7oMTjfesN0lXqW/LM?=
 =?us-ascii?Q?kQdKEZjL1T3CVhXjWmKaH/6cFSGMd/DQ/Fnk5plZsdDjuJq3bQCwoZVhfEVL?=
 =?us-ascii?Q?D6sMkT23aLaIzV6elGzP8a70FykW5QocPI7/JnL7+fPx0WztZHvigoz67zh+?=
 =?us-ascii?Q?5BQaepwbtZNFy9vITWrV4lO3xvEo/Pvlt1daI90N9G7wuL6pIITE7UW2AQ4v?=
 =?us-ascii?Q?GQAAHAI0iY/u165C9tdJsP9V+wBUxe4+eRVVbTph0XinGOUkQe//cT9HZceZ?=
 =?us-ascii?Q?kWl/lAu/LWY3bHKqtLRx30pHR9cxNJk15ubtJLYklQATqhJP0h/LrZ/azStT?=
 =?us-ascii?Q?fgZgCpcbAs31xm6T1ogXSiuQ57VlTpCUj29eYpWKIPB1KYl9UjCsZDyIdBKY?=
 =?us-ascii?Q?Rp9pUFbq3rJsCUGfyqz3py+Xjr8RyBWLJMcokoSYRc1yyagr96btLSMpa8zj?=
 =?us-ascii?Q?WxX96BoSctaRc8ul2XL/5RzJNcE7nuA1ATZBCaJHDhIuaZRvhoZhIkrQNZr7?=
 =?us-ascii?Q?PCgTiJUS669nbZUDye405htxH4LoM91wY20OLzfY603Yid8PeXzDeEWQ5vFI?=
 =?us-ascii?Q?Eabw+q5xZYnudl8OcBVPPZ4PkNbHd7dSwh12Y1BPphglqtDTysVzvcqkSMw+?=
 =?us-ascii?Q?XlvWel4IGY3tFTpiCfSvzL7NncjQFC0HVHNMtnx8uG3Kdi+LHpc5PNSgL3mR?=
 =?us-ascii?Q?lSJPMmILjuwm4rpw6hXP9Xie1UajG+N8GIbVFBGS/QNxv5AWhlmxZvCf7vOc?=
 =?us-ascii?Q?+FQRwdUz4Ng9jYe2Ibo59gtGLMe1qZURmUZqjJtCPhOyErTWuj1Euu7555h5?=
 =?us-ascii?Q?vYFGH50ty7EkNamDRD+zgWkkCyzgJoN1mkclFYnLO0QtL+M2RMJrQS/ZUcYI?=
 =?us-ascii?Q?Z4ehLJRaN/oFq+L8DyRScrec5CnOFpD3AKOSrNiZbVl9xu7X7i+ZZLGjxkWI?=
 =?us-ascii?Q?6TIt7WDeUUjhTOFp37J258fM3WiAwGumTMOMZU4dXkDry7BsNvxvcsGKYOL2?=
 =?us-ascii?Q?RpNnfKIFXHmLbJfZDf8OjRpnJamQ0sBva6Vs5Cwgoe3Dw5Qji2OaFCOKKPy9?=
 =?us-ascii?Q?LeWCTLrF8A//XmjNQqVunyENDnRxxSOziqGJGmREHlOgbI67wS/bvPhRhGqE?=
 =?us-ascii?Q?Zh/voLynF1EpMkIOvfjNG1HG50Jdzqbe8PYe92Y5ZIfVziBemsLVPwL2scPk?=
 =?us-ascii?Q?s/UZtrbHt2/E0OD0ZDBTlpXPd8IldGqF7eXLes6m45GhHun4pbEK54mcEprg?=
 =?us-ascii?Q?T4dVLxbmcPQX1jngUb+iWJ7Vmcn6STarzW45cHzBgIg8Z81XD4Vldhnj3ABS?=
 =?us-ascii?Q?oQdSwvop8yjz+4uh1gtm7Kc+LXWF0E3tdMB0I/JumxZ+zLckcqw8Lv0PDe7J?=
 =?us-ascii?Q?7aHuMZmqL10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jAp54KvGSTOr9CDiRePwXgtALbUOTVVNUH7KeYRRbkgQ+TtcuuYC2fKohzpG?=
 =?us-ascii?Q?hEsKOONWds2YAASUzq/2D8+Ow4+3A/MiD+204c38WbMnxbEhK523RBOqCZD1?=
 =?us-ascii?Q?HD6ZXNI0rT1iSVqHbWtR6aQqhrM+2q+OT14dxGiiD9pIGKNtOFTSHi+z/eHA?=
 =?us-ascii?Q?WwAjOXEbEXowsXMZTx7BstLGvmYe5sYUyrqKEtc5LxVpitnJqOM9wm/HQh+8?=
 =?us-ascii?Q?D1Lc6SaUbde29l9bGA8N+q6SSKPHS321cy/qRh8HcRp9n+erQwVb6nRg/gek?=
 =?us-ascii?Q?nh/HLDpHqSqkrWmpsCZgMphMvlYb/b5KNrrtoLJqC+zTkXEW9CAAJezglwFp?=
 =?us-ascii?Q?M0dPENFt0IElneKDHmhu4YERS089/Gva/p/NWpBGmwIcBbva8DltX3GowF2h?=
 =?us-ascii?Q?gnyhmTumpeeW9pgmzKrci6h5ojbT6b9xhEhNVbNn9MP2bhL7D7mcs4SW0Zlt?=
 =?us-ascii?Q?/fQcz6t9sdeedM5gnscXiJXSiy6NnyEH82XXY58tSoakS0eU4xNTpoRKbnZM?=
 =?us-ascii?Q?RsRh3EGXlDkTnNBIXma7HOwcohpteFmwenSoQ+qFCVVisf9P9YdnvJJB107N?=
 =?us-ascii?Q?suRYUtHahst6OT05mo8mzojWPQ/qAyAERmCIKC2O1V5dRGpU/PR7MKFF7z22?=
 =?us-ascii?Q?OJm0gx3JfVrwz5nI0Q6DVAAy0pVh+81cnnuNeTOlS75lmgrYqUr1DLv0Ki6k?=
 =?us-ascii?Q?Ehd6c3lblPFlwIiOPh69FcXoKYpNhNmdhfmkt5VR/QjPF/4HsMzAExZcnrG1?=
 =?us-ascii?Q?iWAinRWaf9JGf2WSIP2qCtDjdBnm0Sj1lsJ0uenXvk/AA9jwFFFM2ca29JuG?=
 =?us-ascii?Q?7D050U/ylTo+833sGBPAvm9Oy6kVpG+POmRzANjM+yRXf0XfIrFZUHY9ujwi?=
 =?us-ascii?Q?xJzcn185N8+VJIgm7OnfdOxuDPFFsUZIzrgAd6l3/pvhYNJODcNsjZ8GxpmZ?=
 =?us-ascii?Q?fqOQcROIoycL6ccHN054kBiKmHYHGJIR984eImOadLvltuB4zPY9e50sqLxj?=
 =?us-ascii?Q?Q1EYIIzbsUG8ttp4twgnM62GM7hAAOUujQ246czUrChhL8+yIz8VcsadzGVt?=
 =?us-ascii?Q?eThCGt7tx7gNwnZupZ5Yy572LTZAs7K4RYOvsWS0z/AW4xwPHtw9IGhfoFio?=
 =?us-ascii?Q?cME7n2YLQI/gx1Z8+6e+81P9GTw+zKvpb2ZVfQBjvMGZGX2e4u81PzKBQSlS?=
 =?us-ascii?Q?84sjHEv8XtIg4kSrjSEk8jwPZ3NNPBDS79UANHCb2D54PU8m/9uG13ksRQiM?=
 =?us-ascii?Q?Zz1UTj1S4Dx9MZ9cejqGcz2wtdnVRxhnYpkyJ6nFhizqFd/v9uCmFdM739AB?=
 =?us-ascii?Q?3+6HlpUZuMmzNZhc5HRVuVlNInHejVU/o9bzU8b9VLRJUJTsl/OYu+oUOmkE?=
 =?us-ascii?Q?x7zdhVa1Zbm4YIF+6ek8cwXgiJcr9WXKiya/45IM07gZN7HbrE5zt3ugB95r?=
 =?us-ascii?Q?EaRi9GewXxi3YExf3mBuRmb18qSgysy1I7sg4+D5MixRaPNo48BQpu+Z68+P?=
 =?us-ascii?Q?cHeGiDKmCavCZivjRjwAtsVmjZMDQBtFbe87QRhyDpnBYG5nfzwJwIuB2Ykv?=
 =?us-ascii?Q?hq0w5DGOdNR+Fyt2M36IAnR7y7+bJGAoQ1VE4HzG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef27cf4-96db-4d5d-26eb-08dd922de2b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 14:53:13.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I1M8Uyv67oZxZM/IYMrDau5cw2DqUpwnpWZ1OpGzOz7E6j/lXBwfmtyuTdbmAtz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341

On 13 May 2025, at 7:32, Brendan Jackman wrote:

> Hi Zi,
>
> I hope you don't mind me jumping in on a late revision like this...

Right on time. :)

>
> On Fri May 9, 2025 at 8:01 PM UTC, Zi Yan wrote:
>> During page isolation, the original migratetype is overwritten, since
>> MIGRATE_* are enums and stored in pageblock bitmaps. Change
>> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
>> PB_migrate_skip, so that migratetype is not lost during pageblock
>> isolation. pageblock bits needs to be word aligned, so expand
>> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.
>
> Forgive my ignorance but can you help me confirm if I'm following this -
> Do you just mean that NR_PAGEBLOCK_BITS must divide the word size? Or is
> there something else going on here?

You are right. NR_PAGEBLOCK_BITS must divide the word size. I will fix
the commit log in the next version.

>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	PB_migrate_isolate = 7, /* If set the block is isolated */
>> +			/* set it to 7 to make pageblock bit word aligned */
I will fix this comment too.

>> +#endif
>
> I feel I'm always just asking for commentary so please feel free to
> complain if this is annoying. But I think it would be worth adding the
> context from the commit message into the code here (or somewhere else),
> e.g:
>
> /*
>  * Page isolation is represented with a separate bit, so that the other
>  * bits can store the migratetype that the block had before it was
>  * isolated.
>  */
>
> Just adding in that detail about the intent will help readers a lot IMO.

Sure. Will add it.

>
>>
>> +unsigned long get_pageblock_migratetype(const struct page *page)
>> +{
>> +	unsigned long flags;
>> +
>> +	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +			MIGRATETYPE_MASK);
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +#endif
>> +	return flags;
>> +}
>
> Can we just do get_pageblock_migratetype(page, page_to_pfn(page)) here?

Based on my observation, the callers all have page and pfn, so using the
current implementation would save a call to page_to_pfn(). I can add a comment
to this function.

/*
 * Use get_pageblock_migratetype() if caller already has both @page and @pfn
 * to save a call to page_to_pfn().
 */

>
>>  static __always_inline int get_pfnblock_migratetype(const struct page *page,
>>  					unsigned long pfn)
>>  {
>> -	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
>> +	unsigned long flags;
>> +
>> +	flags = get_pfnblock_flags_mask(page, pfn,
>> +			MIGRATETYPE_MASK);
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +#endif
>> +	return flags;
>>  }


Best Regards,
Yan, Zi
