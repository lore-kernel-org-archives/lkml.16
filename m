Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A0142E83
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747589099; cv=fail; b=hK9+oHvpAOnBpxsKA7XkghyTtaM9yJ3xmZLVMVVEMraXNZBKAr+69SYTbnmuEp2dDxFru6ih5/sM/SqB77gVcI7oRAp+ND6Id4RdNBz2thA58belIET9pRpH8R1ZR7Bpf7LYNIIOmX9Iyb91Pf4g5olHb5PPLE8L9xe0OH6jhrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747589099; c=relaxed/simple;
	bh=G+y4Tj8rRPkrnLLzI0JXzwqoQHo6nFdiVnRN1aGbXiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UKSILqmHdj99v8vdcjAQvW+i+QdJJDBS22E+4yL2crPXNiE2cZyZgjH0+3J5AMPfZT3vDpZcgwBHVvaV5FhCRUqz81CTHuCkXRjsnpuvo2XaK7p32lc8wtqIZ1DzL/reC0hCpnSOmWz96JDn4SP/1UitWcyy2WYvxGjwFWGeCeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aWqcpIi8; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aWqcpIi8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVqSqEPXzmV4crr5FCReTvEiRuCfpmb0nAZlvSHEGg5WHejJ88jXNBK7yt01HEBLPaG1zG6Ny08nnKfUJGx26KF8fpbH90IR0TSnLla7MVZ7g6HLEPsc4t/f2YUSlLOrXkuwVgLHkua13a8aqIuAZaPymzROCn1gRklOoTNnKCKCsN0OvsCXY8rTvA8SZLMuhoc567bErOvhmRIgL6D2W0EjYmTw89nuPXG1RK8mZOsarN9DR4N3A2tJ0eAmQZq5+LUOH1Bg3Duc4uTC/qQuOnPtU5YjUsVUKZZlFgoRfmEiJmo7QlMW9ByqUZ7zfXzsi00dnH5UWRTJuBcmUdiqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGz1+GMzbcZjjDZotrFRfOENGZrs2TdohMPAFPjaXMc=;
 b=I/KlzdLXeocGIPhMqeh5rMGtbtmHJItxPtfafrA9llrrMwVhDdcmlSCqYcVQ6i6xRnsj3UsJYCwUrq44V7mckeN1ryfd07h6rye0QrlgUbFzaN5laW8gZkcO1Ng9UXa60x3HbLzEi8SjTkyo5WkPjsdoPDcOy2VuiJ2Z72yVQPS8apbjEPKdXMznXCdMJ5QLUdjp/1+V2MizPDB6qVO5Lhewz+d/vH64OjMnFWajB42KMotYLK1OeT+OPwp4zq8gt1cKgFOxDfQRYkelIyUJbl20J68AhTzaViMxN5HnKJLxJMb9gZa7FRvXtr/Z9Q9qFdOxt0Yz07WGh3GCFVblrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGz1+GMzbcZjjDZotrFRfOENGZrs2TdohMPAFPjaXMc=;
 b=aWqcpIi8r1gjERvCWy+arFR1Sg/bx4NBKqNoTOFXVpH3DTSnX4iMNHXEK78vZM52jmpWIzeQLKyNxcClzLPHL3lJltt9KXfJLlooB3WnSw96C9SIoVy1in5D1u4p6j6ST0t/pV0OoPNItI6ioE1DgX2gXRJs7QX+CANnhdAjloLRzcbj6+/75YFApZ+o1wh0s6gbuLQgcwcRGGDK4nN9+JzrZcpT+YpsqIMfWYOhH/0PMGG4CH2SYzc4GHfLDGKM4PweXwPUW3hktffS+KcD55npoi6ROTVkRVcgEThSMFHTalMdO3jvid9HgzJZj2YhD+z+MAnoY1nvXve8zn77+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Sun, 18 May 2025 17:24:54 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Sun, 18 May 2025
 17:24:54 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Sun, 18 May 2025 13:24:51 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <9C203B16-F808-4043-9651-2B126F41F987@nvidia.com>
In-Reply-To: <20250518163235.GA731066@cmpxchg.org>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-5-ziy@nvidia.com>
 <20250518163235.GA731066@cmpxchg.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::8) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: b55541b6-1fab-4d9f-76d3-08dd9630e753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JNcAYwvxuKkn2puZ8tX5CUWkXdyBUSxnI1bzi/Ufm69EhvDsi8vQiOmK1vnD?=
 =?us-ascii?Q?J64dpyW3evlvh75SECwdWIrZHvjMNTsZbIWCbkJI1AoZyu2q3bPZhlV9l2vu?=
 =?us-ascii?Q?K8EhnPwWMcOEnxxAKOcd06wy0vMo1Ojk9G/jDYgEN+SKYT00CxeUBls8G+6P?=
 =?us-ascii?Q?+DVByXfg0XE+lCFunoFWWj6a2gNt8TG8iu/6XBqJsQfZQvEtfqYJmK2Hds+E?=
 =?us-ascii?Q?R6LedLUIgiJ9wcsd7BQIAn0mEnRe9pnidf4lWFu0qyk2J4R6vu4BoZXRhHgQ?=
 =?us-ascii?Q?Y4fWT3+CoVi2JyPLGM30ZMMhCm09d3g73MB5pFRXYk6UQtH+T78DLVMI7r4A?=
 =?us-ascii?Q?281ZK4TVGU997/gBJEM88zh5SmZwVdo1cGo5uKiVX9DCx9qzNN4hD6v6yU3f?=
 =?us-ascii?Q?n3gcsSdxkc9nt/tqFpnZC7RJVkLgQjW1deD0ZcLC3vVILIOmIeyLfdCKXqFs?=
 =?us-ascii?Q?MgYEnQ4+1NsajcAM1Kv806S2OLh/3zWAW3hHbwOqrh8UDzTNiTQdbPERETXI?=
 =?us-ascii?Q?kCt0nQUIr7CJAu5WPaF95xeNTutlGwLTx4g/309VnEsCQIWDKQL7CxrgocXg?=
 =?us-ascii?Q?Rpib4spQkYW7iH6ioWFyz5a50L5wr28t/R5rY14dI9r7plEV39nN4HEFKzYy?=
 =?us-ascii?Q?VVMwfMGDaqNNViVvtfY34vqo+E2Vg+cnVC9j9TcWnFIFUdpDVcNUAPrOGZIz?=
 =?us-ascii?Q?tKU+ZdUS3sMxeNJIG3anI/R38y4KpWSRHvhthPzwDzoMTA+lgijwq4mcpgSD?=
 =?us-ascii?Q?WLTqjiO8odf+Oymx34kvkcZ/efZEe3r2sGcvUuyFvwKlwkCF7qz6/D2mV1tN?=
 =?us-ascii?Q?7rqjt9ML72gLKEPR8Tm2d/Zr1zkKuIT/gouszU4Hrj7egrqs69qMWK/EG3yn?=
 =?us-ascii?Q?W6WGbw3yAij5MDFF89udeyr749l1egVVwx6mJUZadKMKpwUs9HBuFvByJiWg?=
 =?us-ascii?Q?Jggo0dcsvRmCy4GWyw8nI4rsY+3slEF+koWzgwhGAczaNr/NKZyUIf2x2+1k?=
 =?us-ascii?Q?wolMloRigiUAJMeXhw6k4F7w+J9k7ZEtngOCTbMN2bJp4NkeCaE29YdHIKJ9?=
 =?us-ascii?Q?w/FewR9kKcATJ9/p19fma7s3NZNT6Ryi5BfuoXbzJgDFRPCadm59h/xwXQU2?=
 =?us-ascii?Q?mQHU0EgfJCj+x+ejbDYGwbjpsL8hlHnZF69q/X9evOA90HrUduj8oTbV4jh6?=
 =?us-ascii?Q?EYK7bykUo+x77nJsEFmujLEOaH2J/+3rNRoPTBdNyvaPHJqf46OxbZkRo4c9?=
 =?us-ascii?Q?nABl5LRqeXnr4AYFF/i75JcArA+n2eN9N9foMdHQEQ3BlCf+S/ypb9blOKae?=
 =?us-ascii?Q?IZcvxlUV+bteNDfL1s5vcfbySVV09uucH3JozF4WWvoanP5F+px5LHzlnpP5?=
 =?us-ascii?Q?PvhmelmLyGquhYUi/LGT8hyjs8zSDlH2Z2A+xfMhOOCnyOzxIRb1vnAwuUxV?=
 =?us-ascii?Q?M1rFpbeJwdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?16We3TPKx/KgpUkYDT/eCgWL+4iqAUhOZiFlzKm/ipQqIrl5wuNWm3PdDk0l?=
 =?us-ascii?Q?tstNXyI7BcRw7V3L+mY1MEUdrAoM0SdZgWSCLuIif/IRmWXI4LJIH6z40KVq?=
 =?us-ascii?Q?T7jFVorJYFFmkyP/eClmW3RtHhz34TA4aXXGose6T6vv8Hi7Hndo4PRvgNE7?=
 =?us-ascii?Q?sOoBvziIZJsVpzN3PTuygXTwpi7v4AjxShani4Gk4hrpeQpHXigcIkxg3Y1e?=
 =?us-ascii?Q?A8foew+pAAPy7VXECj26sKgMldz0icENNtQQ+uM8Swr5fkTt5pmMwQI2A+B6?=
 =?us-ascii?Q?vpONDIRU89BJFIlUdQUBW11nyrnQghz6O0wPhIf2I4zNJ56m9LtvaRqzNja0?=
 =?us-ascii?Q?ud/4yG29Rtcs9FI+0m7ETCiMGKK5zTCKs66ZmHLRxiDMRcMP9ZNBaE7npMTn?=
 =?us-ascii?Q?uaVno2SjXEaEWEr3KK3fnrM/KevSi6sJdTnkhQ3eaCO/joTTaPdOEUHo4muY?=
 =?us-ascii?Q?Q3KcV1Agf6JcAq0QZjyE3U7jm70wM5OEQwXixhPvSn7xwXsSSxi64BSJxeWd?=
 =?us-ascii?Q?iEObC9QG1Jg8ULXw6Ky74mAFW0UI8PSwGFTIp2MDqC9d7QBcSDpQ6TwXXY+J?=
 =?us-ascii?Q?U5KvED7T9xRmwy7IOLuCeWwnLph4MeR58QCxA01PtS+B6b9CrXQw8610fBAE?=
 =?us-ascii?Q?QG+UCyZotRw/s4B6heJeGxcVAhHQSnlyU7l8J3i8TgojsWLFOiS0iap43OUV?=
 =?us-ascii?Q?F2iA8EN0ddEq6PnYf4bcN+JiqDtQ2W9mFo/c9bWUcnJN24sjvKG1lA6Xvm+v?=
 =?us-ascii?Q?TpZofpX87cB1iVnpW2p2RE5W+ywebDxHKIeA5JSxLfbFPoV4jOXBA//8fUlV?=
 =?us-ascii?Q?AXlqB/a+wlXvFczvz0T/mGvDj8D59sXPk/MntA46ww6Uha8lJiB12SP+L4f9?=
 =?us-ascii?Q?xI68yak3TgGxCPg9G5xX0X2rNa/CJ1Gf9UPKMWeJF8asRTzCfMic63qzcEM9?=
 =?us-ascii?Q?IhXv+OtxoMeXZRF2eHXPWThLZK5hcWq/kDXqZbj+cnqFS5a+rXYlRNV8lVQ5?=
 =?us-ascii?Q?vZMtXLv8wHk39J789lw20b1huT1KKWetOO8StEiMmc2RDj9EXJM6+TQDEEYI?=
 =?us-ascii?Q?+ZYBr8ocpucnVRNSqxL6xHgVJI8n4pPYC8twMoMVG3CyBzMPRUKxF1NNRDld?=
 =?us-ascii?Q?2NNNjdqrbUCZCuMgaKL0XNMevqOW0JsPPqQJxqqZsXxXo7euut3X+W9OSash?=
 =?us-ascii?Q?eHJaK/dqp/fpgDabRsLXmO2un/oqZtZGriqB034BgxWgtPyqSb0o7qtXrdR2?=
 =?us-ascii?Q?Z51uUDnxByhbHOWogtoAxIyf+rnqEdBl0IL1VrLnAaBsNN0XzJEQCdWengPe?=
 =?us-ascii?Q?gDc6xPc4qPhrE0PMB5nJyqM3c3SuZPAqrCdxvFQp1s/uYrWJ8/CWBe7VEfKT?=
 =?us-ascii?Q?+kdWkNJ4qz1QtaccHKXeYTzwtSC8SE0jo3YaLgUH93l8H/pWzrP9wY88GWM4?=
 =?us-ascii?Q?UrRxKDmFnA6YyuxO9e9wBuk0fK5hBt/OA1RF4iKEQFCtNgTp9zLbjd1y0ZSF?=
 =?us-ascii?Q?JVx5JiICjAKcTfM+YmODD2dx2IJYjGX97cskP0f7e6ZNDeKl/CR5shfquuZs?=
 =?us-ascii?Q?of74BKYDt98QAR/lgnC6UJvXjH1kjcGcWdeicrUW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55541b6-1fab-4d9f-76d3-08dd9630e753
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 17:24:54.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seOk+m5/jL/Dln/l8cw1gcsH9QrEr6fdj63goYOA6Q+SK3GUqq66vE15hcV9ZeWI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

On 18 May 2025, at 12:32, Johannes Weiner wrote:

> On Fri, May 09, 2025 at 04:01:11PM -0400, Zi Yan wrote:
>> @@ -22,8 +22,25 @@ static inline bool is_migrate_isolate(int migratety=
pe)
>>  }
>>  #endif
>>
>> -#define MEMORY_OFFLINE	0x1
>> -#define REPORT_FAILURE	0x2
>> +/*
>> + * Isolation modes:
>> + * ISOLATE_MODE_NONE - isolate for other purposes than those below
>> + * MEMORY_OFFLINE    - isolate to offline (!allocate) memory e.g., sk=
ip over
>> + *		       PageHWPoison() pages and PageOffline() pages.
>> + * CMA_ALLOCATION    - isolate for CMA allocations
>> + */
>> +enum isolate_mode_t {
>> +	ISOLATE_MODE_NONE,
>> +	MEMORY_OFFLINE,
>> +	CMA_ALLOCATION,
>> +};
>> +
>> +/*
>> + * Isolation flags:
>> + * REPORT_FAILURE - report details about the failure to isolate the r=
ange
>> + */
>> +typedef unsigned int __bitwise isolate_flags_t;
>> +#define REPORT_FAILURE		((__force isolate_flags_t)BIT(0))
>>
>>  void set_pageblock_migratetype(struct page *page, int migratetype);
>>  void set_pageblock_isolate(struct page *page);
>> @@ -32,10 +49,10 @@ bool pageblock_isolate_and_move_free_pages(struct =
zone *zone, struct page *page)
>>  bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struc=
t page *page);
>>
>>  int start_isolate_page_range(unsigned long start_pfn, unsigned long e=
nd_pfn,
>> -			     int migratetype, int flags);
>> +			     isolate_mode_t mode, isolate_flags_t flags);
>
> This should be 'enum isolate_mode_t', right?
>
> (isolate_mode_t also exists, but it's something else)

Oh, I did not realize that. Let me rename it to pb_isolate_mode_t.
Thanks.

--
Best Regards,
Yan, Zi
