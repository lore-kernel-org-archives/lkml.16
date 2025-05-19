Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E152853FF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667359; cv=fail; b=iOAL3a2CF4cyN8zvfzC5gdT8GU3JkfsBqx0vdlnQj/Ke4FFMF7Lq/kk3VokzVDVgUIV72TDKpL9L7DxKfBjUaNiUh9+nkExB2tJKAOFOozpkDHV+R0ZuEKA1jbf3O2rE/d2YH/ZQQ9Cj0dOHNeAq9URs4E9UBr+UZOzQrsgj500=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667359; c=relaxed/simple;
	bh=Adc715ixqsN3IOphXUq/SE+1g54576r/Cks4U2zH5As=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFQfTzV1CCjMV34Jf7lEB2BqAsDbT3mE78yumAkWFpsJ/O+VCAS4+wS6Pym46U2M9JYNgExx5a8WaKv35qw3b9Wg5RfouFaqosnffUfR4yDhj88EjRUAYkTpEwI5lwyJqSCOuHZQ6XnEqIyZ0YXP1LkxwghzWi0dVQ15OQf1/E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWL/PGIC; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWL/PGIC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKeRP2yAZEE103qwW/nAqLxwAlKoFH3M0vT1ntoMdUxr9VN9JIEU+653bQfw8kdELWcnHvwJ0A6H0ADJkqy/WzpQHnide0xQsrurYO2/mcCjXalHjaTTz+Lx4RGz5yvIcb7xyPKPKhaWz50Si52XZtqhZdOkVJARs7D8ocfxZWxXJFdVyFRd9hO6It5aODBmk+zagirf5iYCpZ5NTyaCcFAumIGrDQOAaKwcmKuQFhw0c3/I3RD51uwZuprI8+Wah78MUBH5tGsasK8yd9LCntYKN2BBwpq8bCV6Nwx+I9cmwFfbH4XNDkzvUZv7h1tAPyazfIFGtzs2cj/rNA5LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HBxIB3xtApRZh5CNGCUZ6SzsfUQF7GyfKgHSwVb7XQ=;
 b=iQkKYwchVFpS6Ax35mB1MlMkt/OIDH8H1yg5ssvxKqhvJi4Ed+LUMCNQiZDJ+G+ctg4FKPOgbcFKPoZVxKVLjg2jefJQNEFiqt3pvP1PhVzt5KWM0vML/MLzfuZ46Xu3Wgn6Df45ayQA1lO0tkuhZt38W9dB+HZvGw9TjHAljM6rB2Aocz7EEBEkzjhHXvw9eGetVQtxHwWtJGxBrv2J7I5n6mPw05v/5ISBxQg9PkrM95O1oajIA3X/E8X7ng1sZ+O0COKuSxZywdozsQs99N+WilRipfyCmL+hzMkaqwgyeoqF9N+P6rc1wAQJJwG7PYCqyG1ZhORo9h042Jijtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HBxIB3xtApRZh5CNGCUZ6SzsfUQF7GyfKgHSwVb7XQ=;
 b=nWL/PGIClIoPNAwbBnTMPeSLCCkwXXJ4GhHG7IHANuig0CIG0HbQZmfXc3jxvoyCKiaqWlyXDbintokLcdtI4kehcvKwKe9EujRvf0yFkt2EzQS4pJy0H4eAReP5jpumL/0qmtpbjn9zgAhfNJMrFU3ngTkNTBKI7YElyqduptuRleYb/YUUrtCt1fDsPXs4lbxSUT8RxYECTzNakl5Dw3m39Wpixg3CZk8WfDCuvqXTiwv9KOE+SAZBrqwOTlrpC7w+6ZIu7N1ISUeXSPELNbkW7QDWjbymXMmZBJKwx0uV9wpv/MQfMIYUovgQndSeCDSR576CkumEx6wFUan3xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 15:09:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 15:09:13 +0000
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
Date: Mon, 19 May 2025 11:08:59 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
In-Reply-To: <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:208:32e::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ba1e2c-b24b-405a-c749-08dd96e71d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LnyY/r68YWI+mw7L6xZLDaOauGiN3Zn2tXBwVU0I4jLJunnb2mAkaK/URguW?=
 =?us-ascii?Q?OXJbsNX4lqSTwAU0uoAqLnZpIZlVj0jJDAChvRGEGxb2UJE+GDBpp04TvQK9?=
 =?us-ascii?Q?psdHiS1oIumrbA/YMsLSfKzQ6X9wXsyO5n1ZGoihyf9qhAnWbwsBP9QHRTmd?=
 =?us-ascii?Q?xFoR6UXCtXdXc/55Lg5tonhqjDt38FaV3B1pJ2IU4QjzsOxOq1Qg6f0p5JKz?=
 =?us-ascii?Q?wZgNIks6MycVdvPszf5iUcrO3DSn9nzaGffvp0ik8uTQoYE6n5/yf0x+1zXR?=
 =?us-ascii?Q?AA+4+jaz/yIfz0H4Ug0CwjIE32DLr3Kpwv38jS9dclMf0/89hIv8crxb7yvF?=
 =?us-ascii?Q?PDLmonmdSdaHDRpF5Wpu1cWx94yWGFcLeW+O2Bawb/tQsTNgJT/THB6poAlk?=
 =?us-ascii?Q?bqLkKr8X+90w5MJCCT1id0NAmxZLO3C4mhL6Hu+FC2oisTXzOgVQ+vlj0sig?=
 =?us-ascii?Q?YGr9fErKO9A+0HIor4OsQsJ1Z6pv8H4od4Wz1pJO9qf+Pewi0JVB1vNf3Vpq?=
 =?us-ascii?Q?zTLlrBGPVx01QphBWCnhPygeF3lIod8rG9jVU5sYW3ATtXPcjewE6zwvEW4w?=
 =?us-ascii?Q?pPD+BOYUKh1P20yU4ydvwbkrkbQbQRIf8un2U4Jhnk0WSoi1wBdWHlYZP9tm?=
 =?us-ascii?Q?lziMj4xe9PhQF1wHSR4PE8qwf6nsn2FvLZW3uykCPtataigxEd7KNAGURbR3?=
 =?us-ascii?Q?pic28F/rnuZosfl0Cwkl8URSSVRM7xX5rxozz2kc8+pCSL4gON54oAmeg6Gf?=
 =?us-ascii?Q?qmxO2uz2WXhrAagQKwyCQnnMXZeOxG9HSp8AD94ODoPrad0QtzfqrqdMUPoe?=
 =?us-ascii?Q?QWjxz03Rfhpu6RHRWDgPU9Ts665FJ+fjPoMPzviICaLJk1qL8rsLhoU7wGRV?=
 =?us-ascii?Q?zDzzcREPdMkbIrktirRWG2Ynn0MlmRStP72Idnb2n1D2kIL9O+NOFQNwaC5D?=
 =?us-ascii?Q?IuQoCrZtKieOc51v/N9fM0Bm1gt3Rinyq9Zpp/bw7NwEySwykjd5gM4yVwvE?=
 =?us-ascii?Q?U/cu1X6Ou84C2j7Cw16h+xwKln+cCpC2ToEV2Uy14Ki9155mOOdJe7IZvcZ8?=
 =?us-ascii?Q?hUPEylLmNutK5vDxgGZQMXp/QPuT56iJaFEmND14GiIyqCqschRd4lKgiAaC?=
 =?us-ascii?Q?r+Q9R5MhJQ7GUc34zDNT2/OZyzpI4i2jQSb902P4ieIm1aXToZKg3hYH5fR9?=
 =?us-ascii?Q?FCHLsznd0jBCvyMFwNfX3anwTw6IGQxxGXwoJTf8vmYgIWHpa8IYHY1XmWNM?=
 =?us-ascii?Q?UzFcGZGqGKhjuQ75VfkQDTRx+xK2NRDDOWXfLYylXjlmF5NWoYbMrIQ0J6AF?=
 =?us-ascii?Q?WnT46kRtxDx4GOLaKNPloeAQhoP4XKgzOGoZj/yXCE/smUYlMmJILyNIz3a7?=
 =?us-ascii?Q?bs8/xNq+JEx/L2KGR5WkcyqWwhLTZ8sJVY9YoT8alq8nTWAJAutfN6w0y+gV?=
 =?us-ascii?Q?8r54L4ObgzI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEATSm1MjZlZ11rL2f+9Kor0o/WQ0xUZp651xn95O0Aapl9I00y0qwS/lJtg?=
 =?us-ascii?Q?r3br4teUTQYzTo30WFhjxf4gDVQ4W2qYOYAczZ0lkASBYTZsV275gwyMmLxI?=
 =?us-ascii?Q?ZUlo5T5ioFbxpgHIBBceQmjPoB8POn4ddNBtO191KsfT6TZIS+f2w5Az9waT?=
 =?us-ascii?Q?g8HSQm+UNie1VLlEwy9woe+AeIlo19QsL9MURhzCA2aavWHdQWUQykjPT/5t?=
 =?us-ascii?Q?A5vuj1B1tgj8QOKBF5KsktIzBII5DEX9YpTsCKvz5qrks25IMYo1oqjI6Ynf?=
 =?us-ascii?Q?8a5y9quRa43lXCqs/z+ePkbZdrr8uKvnpf3L4ipgBGuRV2dl+cmNAmSww3LA?=
 =?us-ascii?Q?zG0V+K8B3LVgqQ9NDWvpjKJ2p9A1mpMd58KR2STN42FC8B4Q4hdJU7F7r2VI?=
 =?us-ascii?Q?2pMblgQ11Jdbzq2u1vPJ2Vg9pxJs4f/0Kevyiu0muV0UuqpObOeJ7y9pMegl?=
 =?us-ascii?Q?12Nmujv/gbrgzxaE5/EpAxfLhslnVm5V0I93ljPidH4Tgiax+YV6IBZHWqzi?=
 =?us-ascii?Q?ohAzA3Kre4YiAy07XgL9+kPsIeoqfHo5LnRL+gtr8kg49Bg9iOnQHDUsDXfo?=
 =?us-ascii?Q?Z0F4SEjvnepQWb3jVMNPhoJ8MWtuHp4PKkuIXcnmVlDRTbf7ggPeI8nSZFVF?=
 =?us-ascii?Q?mRZS7ae/3RBVzeX9U0Cfms5h0qGO98hVdAuXBVtnz4n391RQpcNj5Y2HI8j1?=
 =?us-ascii?Q?VzILYguSdft63qi5AKhQ+bsH/94Xsh+H4GqolG/JZDSI00NrUz5vBOj8D2Ht?=
 =?us-ascii?Q?zHxYR27Rc9VuV+kV+uYLHm/fg5t0mAGi4upWn/TwPvxpiFy6oPzCtGvFeIE1?=
 =?us-ascii?Q?4HdUsUocUVTujU1Sn9iTLYduC0bykE84He4SvLmWd1iVeMBETuy1DGZzOtoi?=
 =?us-ascii?Q?cahfuFeD51cCKwv84VqHUTK/CzK+x4O8oE4jfD7BoihqqGI9SlLQMZivafnZ?=
 =?us-ascii?Q?HeWBx1ONERR4o6UOs6yp35xFQLdF42JHTWN+Z2JCIj4PkBbWLdXuvr2rWYqf?=
 =?us-ascii?Q?kpqFvmXlK4ZId0q/10XCXgi7SbuQOmkKoyw8AEShzts0tZHfQjPI2vCwCB1P?=
 =?us-ascii?Q?8fyH52QmbUKJyowlwdf92Ql9tbaiIBucu4n5IYeMiIdfIbZ2rt0FtZs6mKK0?=
 =?us-ascii?Q?p0QhLrPPJAgl4IymVMobWXxRtgcqOkSX2d5+/hNORkywSLdFczIcHyoWHHE8?=
 =?us-ascii?Q?HZ4FgQCbBPCyCpMtXkWZaSRRSSbj3Fo2aW93wsUs8ugMfq1kcLjFV/z1yunO?=
 =?us-ascii?Q?JCydFnm2VRJMdzanXJiQs6ZSRLodDlV4jm3X6O/5XJ8p+SmkEAHmCGvEE6CY?=
 =?us-ascii?Q?zhFBaLrrtUEZ0Wbv70tioO9uX+ss7p4YP+XCyNlDNzS/zW11yssYfSZ7JhCD?=
 =?us-ascii?Q?c414sVv/6oAYwhQDXN9+f8NFRPvJND0K+1RF0YJjQ8EJsClzWZp5DVTUqM0D?=
 =?us-ascii?Q?D3zkJMi7ov84+NJBYO5epPcQUYGSwuoW7THYMWncVNsV8lHdBK+6kEF5C+js?=
 =?us-ascii?Q?uyBdW09d96IpnAU2MWY6ENTNTyJN0JD3MJirxY/mFB5oQdqX6W5oPALFfKen?=
 =?us-ascii?Q?EdDI6yjdFfD2nh4D2pIfmvi1GUlujXPCLNqnf8pQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ba1e2c-b24b-405a-c749-08dd96e71d92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 15:09:13.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuaFA0UJj7eTeAVpyWb25iuf9x0G5qYI49UOidfHVgzumyZaUeGCpgt/T6uayfmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419

On 19 May 2025, at 4:08, David Hildenbrand wrote:

> On 09.05.25 22:01, Zi Yan wrote:
>> During page isolation, the original migratetype is overwritten, since
>> MIGRATE_* are enums and stored in pageblock bitmaps. Change
>> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, lik=
e
>> PB_migrate_skip, so that migratetype is not lost during pageblock
>> isolation. pageblock bits needs to be word aligned, so expand
>> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate b=
it 7.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   include/linux/mmzone.h          | 15 ++++++++------
>>   include/linux/pageblock-flags.h |  9 ++++++++-
>>   mm/page_alloc.c                 | 36 +++++++++++++++++++++++++++++++=
+-
>>   mm/page_isolation.c             | 11 ++++++++++
>>   4 files changed, 63 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index b19a98c20de8..7ef01fe148ce 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -106,14 +106,17 @@ static inline bool migratetype_is_mergeable(int =
mt)
>>    extern int page_group_by_mobility_disabled;
>>  -#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate=
_isolate_bit)
>> +#else
>> +#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>> +#endif
>> +
>> +unsigned long get_pageblock_migratetype(const struct page *page);
>>  -#define get_pageblock_migratetype(page)					\
>> -	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
>> +#define folio_migratetype(folio)					\
>> +	get_pageblock_migratetype(&folio->page)
>>  -#define folio_migratetype(folio)				\
>> -	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
>> -			MIGRATETYPE_MASK)
>>   struct free_area {
>>   	struct list_head	free_list[MIGRATE_TYPES];
>>   	unsigned long		nr_free;
>> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock=
-flags.h
>> index 0c4963339f0b..00040e7df8c8 100644
>> --- a/include/linux/pageblock-flags.h
>> +++ b/include/linux/pageblock-flags.h
>> @@ -20,7 +20,10 @@ enum pageblock_bits {
>>   	PB_migrate_end =3D PB_migrate + PB_migratetype_bits - 1,
>>   			/* 3 bits required for migrate types */
>>   	PB_migrate_skip,/* If set the block is skipped by compaction */
>> -
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	PB_migrate_isolate =3D 7, /* If set the block is isolated */
>> +			/* set it to 7 to make pageblock bit word aligned */
>
> I think what we want to do here is align NR_PAGEBLOCK_BITS up to 4 bits=
 at relevant places. Or go to the next power-of-2.
>
> Could we simply to that using something like
>
> #ifdef CONFIG_MEMORY_ISOLATION
> 	PB_migrate_isolate, /* If set the block is isolated */
> #endif
> 	__NR_PAGEBLOCK_BITS
> };
>
> /* We always want the bits to be a power of 2. */
> #define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))
>
>
> Would something like that work?

Yes, it builds and boots on x86_64 for MEMROY_ISOLATION and !MEMORY_ISOLA=
TION.
Will add this change.

>
>> +#endif
>>   	/*
>>   	 * Assume the bits will always align on a word. If this assumption
>>   	 * changes then get/set pageblock needs updating.
>> @@ -28,6 +31,10 @@ enum pageblock_bits {
>>   	NR_PAGEBLOCK_BITS
>>   };>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
>> +#endif
>> +
>
> I assume we should first change users ot "1 << (PB_migrate_skip)" to PB=
_migrate_skip_bit to keep it similar.

Will add this.
>
>>   #if defined(CONFIG_PAGE_BLOCK_ORDER)
>>   #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>>   #else
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index c77592b22256..04e301fb4879 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -381,10 +381,31 @@ unsigned long get_pfnblock_flags_mask(const stru=
ct page *page,
>>   	return (word >> bitidx) & mask;
>>   }
>>  +unsigned long get_pageblock_migratetype(const struct page *page)
>> +{
>> +	unsigned long flags;
>> +
>> +	flags =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +			MIGRATETYPE_MASK);
>
> When calling functions, we usually indent up to the beginning of the pa=
rameters. Same for the other cases below.

OK, will follow this. I was confused, since I see various indentations ac=
ross files.
There is .clang-format and clang-format indeed indent parameters like you=
 said,
then I will use clang-format.

>
> ... or just exceed the 80 chars a bit in this case. :)
>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +#endif
>> +	return flags;
>> +}
>> +
>>   static __always_inline int get_pfnblock_migratetype(const struct pag=
e *page,
>>   					unsigned long pfn)
>>   {
>> -	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
>> +	unsigned long flags;
>> +
>> +	flags =3D get_pfnblock_flags_mask(page, pfn,
>> +			MIGRATETYPE_MASK);
>
> This should fit into a single line.

Sure.

>
>> +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (flags & PB_migrate_isolate_bit)
>> +		return MIGRATE_ISOLATE;
>> +#endif
>
> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how could =
you ever get PB_migrate_isolate_bit?

MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_=
bit),
so it gets PB_migrate_isolate_bit.

>
>
> I think what we should do is
>
> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>
> 2) Remove the mask parameter
>
> 3) Perform the masking in all callers.

get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
get PB_migrate_skip. I do not think we want to include PB_migrate_skip
in the mask to confuse readers.

>
>
>
> Maybe, we should convert set_pfnblock_flags_mask() to
>
> void set_clear_pfnblock_flags(struct page *page, unsigned long
> 			      set_flags, unsigned long clear_flags);
>
> And better, splitting it up (or providing helpers)
>
> set_pfnblock_flags(struct page *page, unsigned long flags);
> clear_pfnblock_flags(struct page *page, unsigned long flags);
>
>
> This implies some more code cleanups first that make the code easier to=
 extend.
>

The same due to PB_migrate_skip.

Based on your suggestion, we could make {set,get}_pfnblock_flags_mask()
internal APIs by prepending "__". They are only used by the new
{get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{skip,=
 isolate}().
Then use {get, set, clear}_pfnblock_flags() for all migratetype operation=
s.

WDYT?

>> +	return flags;
>>   }
>>    /**
>> @@ -402,8 +423,14 @@ void set_pfnblock_flags_mask(struct page *page, u=
nsigned long flags,
>>   	unsigned long bitidx, word_bitidx;
>>   	unsigned long word;
>>  +#ifdef CONFIG_MEMORY_ISOLATION
>> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 8);
>> +	/* extra one for MIGRATE_ISOLATE */
>> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
>> +#else
>>   	BUILD_BUG_ON(NR_PAGEBLOCK_BITS !=3D 4);
>>   	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>> +#endif
>>    	bitmap =3D get_pageblock_bitmap(page, pfn);
>>   	bitidx =3D pfn_to_bitidx(page, pfn);
>> @@ -426,6 +453,13 @@ void set_pageblock_migratetype(struct page *page,=
 int migratetype)
>>   		     migratetype < MIGRATE_PCPTYPES))
>>   		migratetype =3D MIGRATE_UNMOVABLE;
>>  +#ifdef CONFIG_MEMORY_ISOLATION
>> +	if (migratetype =3D=3D MIGRATE_ISOLATE) {
>> +		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>> +				page_to_pfn(page), PB_migrate_isolate_bit);
>> +		return;
>> +	}
>> +#endif
>>   	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>   				page_to_pfn(page), MIGRATETYPE_MASK);
>>   }
>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index b2fc5266e3d2..751e21f6d85e 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -15,6 +15,17 @@
>>   #define CREATE_TRACE_POINTS
>>   #include <trace/events/page_isolation.h>
>>  +static inline bool __maybe_unused get_pageblock_isolate(struct page =
*page)
>> +{
>> +	return get_pfnblock_flags_mask(page, page_to_pfn(page),
>> +			PB_migrate_isolate_bit);
>> +}
>> +static inline void clear_pageblock_isolate(struct page *page)
>> +{
>> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>> +			PB_migrate_isolate_bit);
>> +}
>
> Should these reside in include/linux/pageblock-flags.h, just like the
> CONFIG_COMPACTION "skip" variants?

They are only used inside mm/page_isolation.c, so I would leave them
here until other users come out.

--
Best Regards,
Yan, Zi
