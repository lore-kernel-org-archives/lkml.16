Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24561EB18A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747696005; cv=fail; b=Rt+BtrCeNRQA/N3nIKW2EZm351ADuAjScevqXkBjCuZi/yK8zb7tg7xSx7VsyBjh0OBBwytSLMgHal6MgkQ96twgiL0CmFnF/v2XDEBvVfHGhiGp94qLSqe2lhaGXQZBAuu8RQNhTcv352B7OMKTkDTbdb+HFUPVPpMQVzdoZuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747696005; c=relaxed/simple;
	bh=3AnGfb9rSvVRJuL9xm3h00AErBGuLFKWzkwZrS8CbgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWy7j5CNryh7qnNFw+xxp9tBX3xtWMGgByzOgsoXv5ndlIi63GSDQl2yWOi5oCYywjxW3hc4aK18CZsu5OPoC5d5wOXGoySMQo5TPsXgkDZrsaYnUIrLgrxXKt6y38FNOXPJEIF6UkVRbUsNQD47CRrddi5BRdpOGG2Sy7mg6o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i7FOCy6e; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i7FOCy6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7jq/YNu/IE44xfJNjX4my1E4Vm+FYmb6bF3vftUqrIDBFJL78t+Mo13pAtwIQ2MMKqETD2liDWedAIVIzM//I4yy6fyEDjI6E19KJCe3P7bjTGOLuAp33UPFmyvHPh6H6WtZhJBy2wMJ9yd+MBccoWsQwCeAQO9w1VSC2+7cRiz+IUHJ+F3JXlWFsuglZ6IgmgUc9yonKU1MVJYMlKBLB7LmwTXgVxsrm9ka/pjnvXlOmipS6+KzG50o69ok9/sERe++mHWchjO3yoU6AsQqkLGv/lZra6dRpjo8bfof06COm3kbxgj8dJhZpjTOtnbVGzQjpS/cALHsTWNsJEGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUMgSoKL1fClunxxi/Wqi+IAco+QIrdonPehfhreHEI=;
 b=FTHsz1lLiWC7YKVOgwmS49RJvU+g8cN5a06oYs3EE61qIqbYUHAZr1KmgzKtpZmy/6jUl4ALSjcnWcH3jc+OLLZKvw/a/k5EZRiQIpYm6O01j64uYO2njpT5lPFc3FDb9VNRSL6rODmJ+6yvaJde2dC5gJMUyiat4BHxxBym6R5u9+3ruro2xV/dTti5j7N1OV7YelgpNeM3LlDk3d9KsO/JAbQEf9uy9U1xmUmLCdMmFw3MiKnIw7R0gkOtPZR4dIIQFNDDoxbLtW49m2cVtjUpiZYUDlDeNyi4iKbd1Wab7IsZTEA63nZOL/3CIX0s4pj3g4Ab2oIRjOIAitGkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUMgSoKL1fClunxxi/Wqi+IAco+QIrdonPehfhreHEI=;
 b=i7FOCy6eKkoXGTIoNnZ7GfyCi/BFbgXs6aNlfrtYF8VK3ziCmTd0PykY5En8MREsa1J1+CSsuOuVJv0ehj+Udo0ocP7+HsB/t6e1BU5L9C9ZS8/ideH2c3ZlLoJ8G1rDApG0/trl7e9CWQpdwJvNMDr4ZYeEw9OnpwUUXDxQr6YLD4OrdHtN+EaRtixCQ587okdQvU5h9GNZD7160HoWrAyi2rcn7A9EwgnuiOfgK5yOTbgVwUAvQ4gzH7J+EIidiMXex2Ri/XDaQT1p3J0dz6IJI73RmO0nk9FqvQY0z+pfgHQ0+EWxRH2NbnmNVlvU6qSL2CCuEWxuN7D19P9eTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 23:06:37 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 23:06:37 +0000
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
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Mon, 19 May 2025 19:06:35 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <3E4832BC-C0B0-47E0-AA89-A8DE5A63286A@nvidia.com>
In-Reply-To: <63ba9fe3-e384-4396-bd86-fe62150ed1ab@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
 <63ba9fe3-e384-4396-bd86-fe62150ed1ab@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17)
 To BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 091527ba-2d1c-4398-8717-08dd9729ce95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lXsuBU+mkSmoA6Oxx/MNExSlLQ9ntGfAn0ANKhYFd6eKk84lbkOEcmtn4XGq?=
 =?us-ascii?Q?PTv55xcrbTIhrclr+9oblQ8uouDFILhVv7hK6wrkFdjjFppi1knZ7CtBobyv?=
 =?us-ascii?Q?sMZklqfRoHb9kZoHFCciwfXBYyDry0u4zHl2hNeUbHy13jr2f+5mRFjpWcNL?=
 =?us-ascii?Q?l1vQvEXUoMj3vO9Uf5PobrwlfC9/AvMZ31qE60UOlzQe0w+d5l5fpq/8UMFy?=
 =?us-ascii?Q?Tzk5GvxR0f29I1FwbSCkLSwbmF3nUEV8HqJ8f8fFYkYXGn6Sx/AczrAB/1tC?=
 =?us-ascii?Q?lgKcDJGSnX9NnnpLGXh097YQRjdkHMyKhlXzRnMV2L0gVmA1NQAnFjucA/qy?=
 =?us-ascii?Q?7Tc4j4rrpL/h+CSgx4rLZqXtYjiMf/Lkf+C9gufMKm+gc1l3hCcTpjB3N3Ma?=
 =?us-ascii?Q?LnNkxho8+XymQt8cCsiYR+fI9l6pzQJjfKg9RlgNXS+YQmRUMr0RZH03h4Wn?=
 =?us-ascii?Q?Ad9kirNiNa1ytfbpkgsvP25lOolhduZuS0N+8L9qRz1HeX4H6RibbKBnlAnN?=
 =?us-ascii?Q?Wg4vzQ/orSQ7a16tMRiPjr0rvg9ttSoOtwVeIiNaAkMSGce3iRmQaSiBg/Oq?=
 =?us-ascii?Q?mqoUZ3td52s7ayjKcMBzwcxeaPJICv2NB2HwWgrnD9MGmJFE6brQ11dGpAq4?=
 =?us-ascii?Q?C4vu2CKWi1PxBeBUIurWauqovHfZIU/KM0HkbS95/bCeMLNXX7RaHIt3Fj5O?=
 =?us-ascii?Q?VP3xcR62DCFiSujeIk4x+kfXv58j1c1hKT0CV4ph+2Y/nV9zcoaTdopOb3/u?=
 =?us-ascii?Q?rW2i/BhLlYmki6vLGJ7rC118FDOsCL2V19BuNn1pg1mnwWoCGy46D/aRE2hs?=
 =?us-ascii?Q?ncOaw5h7iJWZ/ijpogOK2Yz++xXSho/vo11zXVgAU60qJcyaXKnX+HmcOB3f?=
 =?us-ascii?Q?dJeWGfVsXEg253Qq94G9RdyP4onDYH3iEEth2L6qRAQxLMIpPk1q9E/AlsyF?=
 =?us-ascii?Q?7MQ0hx1xilHB+VTgh9ypSrGtQ7S8+sbSWmPA2utL0+Fc0eTPm7tuJVE+lVj6?=
 =?us-ascii?Q?EMUbdancRf0/0ggcbBEkRrb53FAmn8FWodIZBws3vTOWcToYWtXxUdaBJnbg?=
 =?us-ascii?Q?fr5CYOHxgEIaSipae2z5AmI92IKJsmvFeWY/8GsL2wVeol+sqKAEOgc4KdtQ?=
 =?us-ascii?Q?4XiHEpimiVRl7KdJsEzZFFr3stQCXubgsS15heeGNfvEwR9nVewd9bSloMvI?=
 =?us-ascii?Q?+YTCxhlYaUYIMc5aKbqPYFEbquHPBkAP3hGxeQnj9hcYjIGvMZqd21LsJk8w?=
 =?us-ascii?Q?UoRB2tp/VFmpyaZtqkRE+wHuFWdroIx9hAFee1+UptwI9lHu+sPWLFoLgPMC?=
 =?us-ascii?Q?8ASlOGdJGF0mP/qHxChgN2Dq5n1E6m0Riia4QGxJ6xamS/c2YE7v68fGYxGS?=
 =?us-ascii?Q?rE3iWOAlW96wFPzdrTX5GOF5+xaqmLLfd/JPfPBWsbHx7wGBfiFei4NTZw94?=
 =?us-ascii?Q?MtZPiJSvCKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D6WJOgrXxUH9WvD+YgtiHKjGqAToiEqSuEzKDILoyxBt76+fnO8MTrIex1Q6?=
 =?us-ascii?Q?G1JPjigFVQlJRkmupowOoZ+tU6VQFVPIAyQkp8HGKsRT3KZ8NGjDDqeKRcZo?=
 =?us-ascii?Q?pHDcOfjF4pTyOAKPFhQL0gkSaUQR+ciFvKOU0EDNh8Df6yUz5nJYMVyv1evr?=
 =?us-ascii?Q?HHfVSdVXGK/2kiCzNuYpiWPm7VX1izeNZK8j41/Wqfuqx7rzXwapdRmRqOjy?=
 =?us-ascii?Q?xxftn4+EVc16ECPFjRu0QdPhk1w/LoiHcvGALquNqKJBMn8MSufl64C9P1vu?=
 =?us-ascii?Q?8C3fVKcZheXgKCX9oFu6znOzUpTh/7mnEPp1da8X46VIFpaoTZ3o2ny5fUWa?=
 =?us-ascii?Q?DLy1Gxy5YSdZ4sMEOI/fLroo5xS+RrR6dzaNZigDiyxlzNjCDPqFCmieRA+O?=
 =?us-ascii?Q?cqFPQX5ogovDa2/lOhK2kCGDUDdzMZ7hFjwZCYhUIxfsfKAUsm+y10Aw+TpX?=
 =?us-ascii?Q?2buOJN+WxPRZIftjI1g6+Es0tpT77kPxQ46/wMkjSU/BAs/QigGifzQmgZNL?=
 =?us-ascii?Q?Cbqo264QzBotx0nTXv2ZfWrcCfnhxByatQ3oEgc6TfvznRo4pWTbeP/NfTYP?=
 =?us-ascii?Q?aHAETF2Y5xjGBUShrD9Oy43WmgVuzU1vNApx03KcN6bcPL1/9q8Fc1h6qlEO?=
 =?us-ascii?Q?D64hGb52zJJrEWCB0zuP6wMlVr5KLt2wMoW5GDxZ+8/NczFJ3yBElpaYS+TI?=
 =?us-ascii?Q?wXZEC/MGjXzkomi/xDz5yGAm68PcWBE0xC7uE3ZZZeBanAiZeAPK5SPnmjbR?=
 =?us-ascii?Q?OZUvRmw6J07nq5MIqCuGHIUqByeXF+g1hSmqkKlDfxqPPwxdPTBFaHaDJaQf?=
 =?us-ascii?Q?HRGYvBr1cD3cwZ/nyc4eQD6sQUSVQ3MqAq+oP9/bA+Jtu9d6KoJwN4/g9+Hd?=
 =?us-ascii?Q?bhTVfbWC1tvDRYoF+lrXyz74sR/YJPbIgk9u1LpOwMokDHSLJkYhuJCv2hcQ?=
 =?us-ascii?Q?9flqvmexdZWpZZrhnjMqquqVKG1lJDdG6bTyx74HST3B4FixqykEHxylylQM?=
 =?us-ascii?Q?JfnHwl5FzVJ7f1sZ26lg8mYdGpQkT849ZF7oZrQ8ulFJ/+Lsm2WiG69TbJqt?=
 =?us-ascii?Q?PwbGayBhC9FcIBIsc4W/9X0iOuq6vYahgIraKCe8hg3eaBeMJyd1a+y5TOAJ?=
 =?us-ascii?Q?u3FQuFmeQFiFYOdTIsVKKhunA1Lmhm7SuxFIKVsWa0OU1XNYqgJGUTsscmRq?=
 =?us-ascii?Q?u4/N6i2DG4dQi9ehtwzkKdY9MemV3Uy4H9/+YJvYKUfjA2ghaoKZ4rKezIJQ?=
 =?us-ascii?Q?YFD3RU13ENDYAAr9vxTs8/h8HWrMLB7UqlXB1UbdD0NYNbBd1z8tYdyiJOEd?=
 =?us-ascii?Q?lqUJDyXpgkrm2sdhp/EVyKiDdrCVYw7OKsNRq8Mtn7REIlFmdvetM929NRiM?=
 =?us-ascii?Q?BbgnV176lzoibtuXeSBxksvAIqZZKy+HIf4KWkfzWtgDi8xMhLX1BdB2a1lU?=
 =?us-ascii?Q?zpVC1ZJ2eiySviK6XfvxrGcBWBlO9BLrQwvE5HRJwS/9/5JIQlCMjObWNsm7?=
 =?us-ascii?Q?U8ByuBN0/LLxXHNjjM+C5gBHjEbRiQXtcZQIdO7jC4ll2cb4kUwMC+Cfv9n1?=
 =?us-ascii?Q?/KUEO7+3QiLC6F7Q3lI7yy8STdp25KLHT9SmE9Oz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091527ba-2d1c-4398-8717-08dd9729ce95
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 23:06:37.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqL94v6nl1i4jIZeEh0g5PpQ1ImJpscgz1AEnQn4IqHw7ursgTUFXtPIt8qon94F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

On 19 May 2025, at 4:21, David Hildenbrand wrote:

> On 09.05.25 22:01, Zi Yan wrote:
>> Since migratetype is no longer overwritten during pageblock isolation,=

>> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratet=
ype.
>>
>> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype=

>> when a pageblock is isolated. It is used by move_freepages_block_isola=
te().
>>
>> Add pageblock_isolate_and_move_free_pages() and
>> pageblock_unisolate_and_move_free_pages() to be explicit about the pag=
e
>> isolation operations. Both share the common code in
>> __move_freepages_block_isolate(), which is renamed from
>> move_freepages_block_isolate().
>>
>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types=
,
>> so that one should use set_pageblock_isolate() to isolate pageblocks.
>>
>> Two consequential changes:
>> 1. move pageblock migratetype code out of __move_freepages_block().
>> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone(=
) is
>>     called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all aff=
ected
>>     pageblocks are isolated afterwards. Otherwise, all online pagebloc=
ks
>>     will have non-determined migratetype.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   include/linux/mmzone.h         |  4 +-
>>   include/linux/page-isolation.h |  5 ++-
>>   mm/memory_hotplug.c            |  7 +++-
>>   mm/page_alloc.c                | 73 +++++++++++++++++++++++++-------=
--
>>   mm/page_isolation.c            | 27 ++++++++-----
>>   5 files changed, 82 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 7ef01fe148ce..f66895456974 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int m=
t)
>>   extern int page_group_by_mobility_disabled;
>>    #ifdef CONFIG_MEMORY_ISOLATION
>> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate=
_isolate_bit)
>> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
>> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolat=
e_bit)
>>   #else
>> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>>   #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>>   #endif
>>  diff --git a/include/linux/page-isolation.h b/include/linux/page-isol=
ation.h
>> index 898bb788243b..b0a2af0a5357 100644
>> --- a/include/linux/page-isolation.h
>> +++ b/include/linux/page-isolation.h
>> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratety=
pe)
>>   #define REPORT_FAILURE	0x2
>>    void set_pageblock_migratetype(struct page *page, int migratetype);=

>> +void set_pageblock_isolate(struct page *page);
>>  -bool move_freepages_block_isolate(struct zone *zone, struct page *pa=
ge,
>> -				  int migratetype);
>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct =
page *page);
>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struc=
t page *page);
>>    int start_isolate_page_range(unsigned long start_pfn, unsigned long=
 end_pfn,
>>   			     int migratetype, int flags);
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index b1caedbade5b..c86c47bba019 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned lon=
g nr_pages,
>>   	const int nid =3D zone_to_nid(zone);
>>   	int ret;
>>   	struct memory_notify arg;
>> +	unsigned long isol_pfn;
>>    	/*
>>   	 * {on,off}lining is constrained to full memory sections (or more
>> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned lo=
ng nr_pages,
>>      	/* associate pfn range with the zone */
>> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
>> +	for (isol_pfn =3D pfn;
>> +	     isol_pfn < pfn + nr_pages;
>> +	     isol_pfn +=3D pageblock_nr_pages)
>> +		set_pageblock_isolate(pfn_to_page(isol_pfn));
>
> Can we move that all the way into memmap_init_range(), where we do the
> set_pageblock_migratetype()?
>
> The MIGRATE_UNMOVABLE in mhp_init_memmap_on_memory() is likely fine: al=
l
> pages in that pageblock will be used for the memmap. Everything is unmo=
vable,
> but no free pages so ... nobody cares? :)

My approach is similar, but a new init_pageblock_migratetype() like
below. Then, I added "bool isolate" instead of replacing the existing
"int migratetype". The advantage is that it saves a call to
set_pfnblock_flags_mask() for each pageblock. Like the alternative
you suggested below.

+void __meminit init_pageblock_migratetype(struct page *page, int migrate=
type,
+		bool isolate)
+{
+	if (unlikely(page_group_by_mobility_disabled &&
+		     migratetype < MIGRATE_PCPTYPES))
+		migratetype =3D MIGRATE_UNMOVABLE;
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype =3D=3D MIGRATE_ISOLATE) {
+		VM_WARN(1,
+			"Set isolate=3Dtrue to isolate pageblock with a migratetype");
+		return;
+	}
+	if (isolate)
+		migratetype |=3D PB_migrate_isolate_bit;
+#endif
+	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
+				page_to_pfn(page), MIGRATETYPE_MASK);
+}
+

>
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 6b8ed20177432..bc102846fcf1f 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -821,7 +821,7 @@ extern void *memmap_alloc(phys_addr_t size, phys_ad=
dr_t align,
>  			  int nid, bool exact_nid);
>   void memmap_init_range(unsigned long, int, unsigned long, unsigned lo=
ng,
> -		unsigned long, enum meminit_context, struct vmem_altmap *, int);
> +		unsigned long, enum meminit_context, struct vmem_altmap *, bool);
>   #if defined CONFIG_COMPACTION || defined CONFIG_CMA
>  diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b1caedbade5b1..4b2cf20ad21fb 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -764,13 +764,13 @@ static inline void section_taint_zone_device(unsi=
gned long pfn)
>   * and resizing the pgdat/zone data to span the added pages. After thi=
s
>   * call, all affected pages are PageOffline().
>   *
> - * All aligned pageblocks are initialized to the specified migratetype=

> - * (usually MIGRATE_MOVABLE). Besides setting the migratetype, no rela=
ted
> - * zone stats (e.g., nr_isolate_pageblock) are touched.
> + * All aligned pageblocks are initialized to MIGRATE_MOVABLE, and are =
isolated
> + * if requested. Besides setting the migratetype, no related zone stat=
s (e.g.,
> + * nr_isolate_pageblock) are touched.
>   */
>  void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn=
,
>  				  unsigned long nr_pages,
> -				  struct vmem_altmap *altmap, int migratetype)
> +				  struct vmem_altmap *altmap, bool isolate)
>  {
>  	struct pglist_data *pgdat =3D zone->zone_pgdat;
>  	int nid =3D pgdat->node_id;
> @@ -802,7 +802,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsi=
gned long start_pfn,
>  	 * are reserved so nobody should be touching them so we should be saf=
e
>  	 */
>  	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
> -			 MEMINIT_HOTPLUG, altmap, migratetype);
> +			 MEMINIT_HOTPLUG, altmap, isolate);
>   	set_zone_contiguous(zone);
>  }
> @@ -1127,7 +1127,7 @@ int mhp_init_memmap_on_memory(unsigned long pfn, =
unsigned long nr_pages,
>  	if (mhp_off_inaccessible)
>  		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
>  -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE)=
;
> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, false);
>   	for (i =3D 0; i < nr_pages; i++) {
>  		struct page *page =3D pfn_to_page(pfn + i);
> @@ -1192,7 +1192,7 @@ int online_pages(unsigned long pfn, unsigned long=
 nr_pages,
>    	/* associate pfn range with the zone */
> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, true);
>   	arg.start_pfn =3D pfn;
>  	arg.nr_pages =3D nr_pages;
> diff --git a/mm/memremap.c b/mm/memremap.c
> index c417c843e9b1f..e47f6809f254b 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -254,7 +254,7 @@ static int pagemap_range(struct dev_pagemap *pgmap,=
 struct mhp_params *params,
>  		zone =3D &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
>  		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
>  				PHYS_PFN(range_len(range)), params->altmap,
> -				MIGRATE_MOVABLE);
> +				false);
>  	}
>   	mem_hotplug_done();
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 1c5444e188f82..041106fc524be 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -867,14 +867,14 @@ static void __init init_unavailable_range(unsigne=
d long spfn,
>   * up by memblock_free_all() once the early boot process is
>   * done. Non-atomic initialization, single-pass.
>   *
> - * All aligned pageblocks are initialized to the specified migratetype=

> - * (usually MIGRATE_MOVABLE). Besides setting the migratetype, no rela=
ted
> - * zone stats (e.g., nr_isolate_pageblock) are touched.
> + * All aligned pageblocks are initialized to MIGRATE_MOVABLE, and are =
isolated
> + * if requested. Besides setting the migratetype, no related zone stat=
s (e.g.,
> + * nr_isolate_pageblock) are touched.
>   */
>  void __meminit memmap_init_range(unsigned long size, int nid, unsigned=
 long zone,
>  		unsigned long start_pfn, unsigned long zone_end_pfn,
>  		enum meminit_context context,
> -		struct vmem_altmap *altmap, int migratetype)
> +		struct vmem_altmap *altmap, bool isolate)
>  {
>  	unsigned long pfn, end_pfn =3D start_pfn + size;
>  	struct page *page;
> @@ -931,7 +931,9 @@ void __meminit memmap_init_range(unsigned long size=
, int nid, unsigned long zone
>  		 * over the place during system boot.
>  		 */
>  		if (pageblock_aligned(pfn)) {
> -			set_pageblock_migratetype(page, migratetype);
> +			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
> +			if (isolate)
> +				set_pageblock_isolate(page, isolate)
>  			cond_resched();
>  		}
>  		pfn++;
> @@ -954,7 +956,7 @@ static void __init memmap_init_zone_range(struct zo=
ne *zone,
>  		return;
>   	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
> -			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
> +			  zone_end_pfn, MEMINIT_EARLY, NULL, false);
>   	if (*hole_pfn < start_pfn)
>  		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
> -- =

> 2.49.0
>
>
>
> As an alterantive, a second "isolate" parameter and make sure that migr=
atetype is
> never MIGRATE_ISOLATE.
>
> [...]
>
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct p=
age *page)
>>   	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>>   			PB_migrate_isolate_bit);
>>   }
>> +void set_pageblock_isolate(struct page *page)
>> +{
>> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>> +			page_to_pfn(page),
>> +			PB_migrate_isolate_bit);
>> +}
>
> Probably better placed in the previous patch, and in the header (see co=
mment to #1).

Sure.


--
Best Regards,
Yan, Zi
