Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EBA241693
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747128; cv=fail; b=gMU35Idr7w0q//ri4UNfz/IUZ1q8HWj81tFJg7TSrbJtJfIgeUGP0fXjvwy9oT4UPa8ocPVB28EB+qlpCQ2ij7DY+nFY61ZE2Zy7PfsY2QOH3X2NaS5RXAnkdYVPoZHqTzaW8eU25T0pRGIrTGmRjYOs3lTbl61QzS5kQwQXFhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747128; c=relaxed/simple;
	bh=60vck4vuqiL+oMF6Bp0rVb9d3QROKjpV9BU1ItXGzLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rcmXGQmhOiutu9FWizPkRM2xZ7ZyI2iDHQWPlD6MebHvgCoEp7o1fIuLPoyuELXg8juos2EjXm8gtoKNZoM+YszLJPyfSe3UUUxf7jxbhoLwG6S3/8h4qtXc7nvgxCFmggjEHz3SGt2u8D+vbfK33LM+OKlJagvcrzgM9V9fFKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VCPKCUXW; arc=fail smtp.client-ip=40.107.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VCPKCUXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAsjTGlZWFfpzQ7CsBE204Y1tQ0MJzLQcGGLwAbqXKIa78QKBlmci1Ht2Ng/qCDNJmHO30T8wT/ZMIBBKIfuG0VYSacwZIghYCqOsJZoZIPrLXi0U5JlnJ7/HT1A3nGMnASXjvtURHFw58rYmc+6ZyAJozABJPCbUyxUT4y7ztgEnDrL9os3+vb6inMmGOw1gS6buoAbB7fJy/kwGaQRWlPJ2bp98G06fDYYTqTPuScjDrBspn7UWK4HY0JPrwYzkdBYc0nDjcIsAK0Rq7SIOBi/XSsIeZIKznFhHkZPO4VbFhvFSfNpXFRNzx4ghk3nMSr2M2q8xcgQguUuBuBB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpnRSU0bsnR6DRMtrdSHHlnmHR1HW2oZ0JhVtVbuMEY=;
 b=ZxhSlm3gSuu42ZT0Paqaf1XBduNHmYtuQrjWtmj8w5Nx9auoNiGfS3f6P13QlDnOYyxe25NSnOITZBcKoPlqTICedtouG8DqcUe3wHmi3hmqdG17So01sn+NGGX4gIBfkY8YSKPEjwnyYoDrs2wwudhsKkLJ/N1Zh9PdnVBO6SnhB/Q8GnI/dNL30pfuMBFcvfLnA/ijjezCvZN7OvksTTPziC76Z5mjSZ1aT40ikPXwz2X1NUST5ARyV4Y76mK9McVUlQf1SdHvCT8szj+NRMV+6abEG5A6mTx60lfdFsXRUdjpgkim7IKhoSVOPWK/sBna1+7AoZKLTGO+Z3PMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpnRSU0bsnR6DRMtrdSHHlnmHR1HW2oZ0JhVtVbuMEY=;
 b=VCPKCUXW/rskGg8UJtE5pUXNhFw9SL6nwYQ13Q9bKGh0awkbDzmlbyOMj333FodiUCT6Sk1NldxG6W6kmDsUMjD9g8u89dZOkypOCxEtYOFC9Gqx57f7SwL+avlCbqLaCgFLYzB1yGxQxho2xerN61gZSx+4701Amsw2+7+sFouwFWpAQIGuGMmGQp2I56oq9vIFn/sEClrt0rnJV/zuRjoHliZvGtxQSGbCxMwa2ErVE7NPBR9w1WXDEHM2BIxUgEiXHBTEPEdbsbGo9u0S6ew3N3yQK8lSdsjUmhvx17l/GrDeiwA0JoNRuRy7Geyu+Fccuh/Cc81CbVoRCyQHzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 13:18:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:18:42 +0000
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
Date: Tue, 20 May 2025 09:18:40 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
In-Reply-To: <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
 <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:208:e8::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: a12eec85-0dd8-4a08-23e6-08dd97a0d7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ugcLBeuxeQfKtoVRMCVHK5Te2VEoDMJLZv7zVsd8muaaru+jZ4DbXNXXtkT?=
 =?us-ascii?Q?CmOQMZuee5YZoiHjT7oWRfeh6sEc/z1FILVyrwCMdjwkT0r6T5b1tLtiujNW?=
 =?us-ascii?Q?j4RKBvgSq5bgO/t9d46Y9OLB35dtJNWPcWPUh8FFp+WSZy515LDdHFS0SP7J?=
 =?us-ascii?Q?7kbOaElJPkSew5PrDt2EWx36RL1Fn772mb14vuWmEMS0eaeyouBr2LSkdoWi?=
 =?us-ascii?Q?HtcJ3umaSvV21rZLOC1k6t/2o739DPumJfeCGU3VmCevKi8ZjrHKzUBQP10U?=
 =?us-ascii?Q?ZktT7fWjEV9ALkPxQwgalktdk0as56gaINL8mRZCtNoyxbWPF+NoQ+vWl8fz?=
 =?us-ascii?Q?DXWz148x+6EZPUEIH3mPesUAHLWj90czG6jaNbVDNNZeeBJObdGIWGId1bcv?=
 =?us-ascii?Q?fjYYCCHQ70hHPJNh3JlWmyDi/I5rb8MjBH/WtxdFKNZMdnN4j506fCDk8Hj/?=
 =?us-ascii?Q?0rHMYIiM416rbwB3mX54aw0PbpRgfUBIsJQ3ptbIcz5X4bCkJjoxJOvn53px?=
 =?us-ascii?Q?hOhP6b/WKvPCfC+N3d9N8n9XA5X1d5jbcEkqc0SmxsI3J5O4MIhBV52z9Kgf?=
 =?us-ascii?Q?xXlSz/Gh8018cYj8nBtb6DikShwaj9GmaJ3D5a8b6fk1BkHOfcm2KFBcoMFe?=
 =?us-ascii?Q?ZKWd865vu8aokRmtby6jlUacP0e+EyilJgH2reSSjjK94JccTbbWWIQG2JRG?=
 =?us-ascii?Q?ZWIiGxcnB1cj1ay/2NsBXcuucxQFv9+88UygQD9OZL1bjLvNrT0Ajcg5Ytbl?=
 =?us-ascii?Q?1NgwDuSMNGa8pgQtlBQ55Q/G9nJ/0q1GXbloOfXdRXN0dMrka1B3Zh4EKzkB?=
 =?us-ascii?Q?GjeSsMPUaZAWnTiiHHzTWO0fSm3eopdjOw9G3RVFOqSPhS3s4zZMKNdISBHj?=
 =?us-ascii?Q?tpGH79iB4VUZVu6ayLQBBK4lodGw1tud5t8LynR2rQy0L7SZA+MA6X1hknp9?=
 =?us-ascii?Q?RDpxvdb5a6LxWzk73aK2G+lt8I39eL7UnOOytoQt44xrFyC+4Fiq1NCZZphT?=
 =?us-ascii?Q?Ey6n6LR6cO0p1tLTOMAN1QLGWv7TXjz84tbZosTWBazq/Lfo6Hg5UUBpC8lU?=
 =?us-ascii?Q?Iyi7Wv28YW9Kz0dpclqj+SS1wjyy6QsktRX+Pzzp/CpCmLq4Bhj0UneOJYJe?=
 =?us-ascii?Q?FWO3Zjl6P6EAOBgrQ89pfg3FlnI0vcMNEZNKhcFgb8qvkYOqg6wSTr/eRzz8?=
 =?us-ascii?Q?kpRL1NTZ29EFJ1VWEWnLS5GdPi7WNHp35kdGSguaDLUrDj9e26rwEWHl1j1s?=
 =?us-ascii?Q?Nhd6C7DEBdXYlJhyxbZPm8/q4qSklwwgNhp1Ibj1k6Y4qTo/5GiMxnwJwvvH?=
 =?us-ascii?Q?rsLlHlFUGj/8ayPZ/l4a+LsW+sQ5yeoKhONthyMMfdO2gICA4F78m1g1WJAv?=
 =?us-ascii?Q?g3uZTmDp3/EDifpR9JJo1AMbKTwq9J2WahZ5CqoDqlxDjUR8ipM8rlr2mg3p?=
 =?us-ascii?Q?PofGD2N/YNI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A4BbaUZoDOSrYHbfR+QWjC52BUKY4xrEu/sjYYBKMJ+v8SOonc0WSigBJuZk?=
 =?us-ascii?Q?6moe+VADfa5L29+JmSDkgKPbRqImg+WNKEWN+Pmt7U5e2Orr7nbOfrVurJPr?=
 =?us-ascii?Q?fjf0jiYS0U+gdFDp1IBM6olaI1JxW8W/kZx4EBu0CRUdgGhqxY5hG6qf4iZ0?=
 =?us-ascii?Q?ZZM5gWIxP9cDW8jQO065ROPjZHcBQyXYbvch1EYHjVXLj0WvkVegIC/u2qZh?=
 =?us-ascii?Q?iFNKEhJuIr25fgpi9hiJSOqQc49WjPOPJjuHJ2ebIZENAMykEZTKcOKT5gor?=
 =?us-ascii?Q?N4Mo6p382NYNcYjZq4URXwGiSpUUp6YyuIRk0jm7VMxYvLaBQMgblwgFvFQg?=
 =?us-ascii?Q?McfwosrDttedPCTIrucDzdnF0bN6RysbyIpC3nHyZYCfpcO6aFEWHOXqr9Tb?=
 =?us-ascii?Q?4xI7mVZvjBKIugGVn8cLVj+rAEvI111bzCdQzHLgkh7il6JqXtbBEYyLwpFv?=
 =?us-ascii?Q?56PJR3/4l7zfnUu5O1Ofmxryg9IzoOp4pcCHEJT6U76OqKmcVD2m2dS7cfs7?=
 =?us-ascii?Q?vO/7tMolHiP6Js6s+Y72eNPnLOtdqEnOX41aikA4HCirA0Y/u0KMWK2H+9dr?=
 =?us-ascii?Q?+3TdrqQcYhHG6Yr8n/0TUzFpGwjbB8xNuKE/QgbOsU3T305uWELpWmasITj2?=
 =?us-ascii?Q?Mr7cJ3HTKO4mQeFSVaqlEF/EiESv0J8OXq+rIcxxHKsogaS3cDPxe42sMQck?=
 =?us-ascii?Q?m68k1xYNtJCxI/bpXhSd/JiO5ASeEotBTWQ5Cl/VL0GXpO6gdhw4pwpyylKs?=
 =?us-ascii?Q?8e8235CuyK6pVOra0VamnQ376uPyfhJZYq7t2O0PzkaZeRCPuIbSugVxD+cQ?=
 =?us-ascii?Q?a0+B1fo7i9UZzjaTb+L/Pi/roIZLIOVA54tuDa1ShpDGRvt8PHNUihLFM0HA?=
 =?us-ascii?Q?DJdA/okwlPmsDT8vkn4LKX1WrqsiqvLC0aRHR3+e72QMxPZUwZgF5zxa5Xop?=
 =?us-ascii?Q?eXoulRPe2UatVfD8CCQ60qWo5/ojvwDdIexQNzi1vP2XzARVLGgZs/iqqt4d?=
 =?us-ascii?Q?G3fG1ZD5vDUtA5VDxu/FMgvyTUzwyMKzC+dP0geRBEbyxGwl0SkOYD0mjsRv?=
 =?us-ascii?Q?3KnPqgcK+o9S3sIJ350CejCsyeXkeMcJ0K6fLLjVfa79F6dFjq7+wkpjxyzS?=
 =?us-ascii?Q?eJBm4izhdysJaEJn1AKR3upJ1aC4pPAA2fj+OnI4xtv/9gEGKoGY8WTwdHEy?=
 =?us-ascii?Q?JAFg7GjKQs3e49CEsl1XbUNho3PXHsuNNT1sfJYdIkg6y+aqeH2i07a0afWr?=
 =?us-ascii?Q?xGbRDzZ0MnoU+VzK5/4y27oQjn0DvZCjN/NKJbq69zFBjdUIJzAdRrMhmt8l?=
 =?us-ascii?Q?9b3z3UNh7115udTCZwwM/Sfq0QiLKQaymUoID3BB2ur56y8nr8oQB/BSPBBS?=
 =?us-ascii?Q?mhUbNMUZlM7uF+6uf6Z6e2Zq1g4d7q0dIMBacBAFRZ/10d8X1h66zQfOBXLI?=
 =?us-ascii?Q?4FockYZmc1CI8p5Vt+8eeIE51NfFRAVCQz4S7r7bKdvLqvhf826Fb/9BREis?=
 =?us-ascii?Q?ChngW67PTyThP8COFGjCKAPLFrh4ZlQ+vnXYGQqWzreu6Y0EpZSVMJj5WTRo?=
 =?us-ascii?Q?dzPzTW/kDx5BnXrR9t6rXDksHcAf6BK+Q8XlB2yT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12eec85-0dd8-4a08-23e6-08dd97a0d7ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:18:42.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi6e4zszo2Z3W3kOu1Pg90xxcrFBY/xc4P+bTpQ5ecRgBlPNf/J1WSUXqv86kzJ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496

On 20 May 2025, at 4:58, David Hildenbrand wrote:

> On 19.05.25 16:35, Zi Yan wrote:
>> On 19 May 2025, at 10:15, David Hildenbrand wrote:
>>
>>> On 18.05.25 02:20, Zi Yan wrote:
>>>> On 17 May 2025, at 16:26, Vlastimil Babka wrote:
>>>>
>>>>> On 5/9/25 22:01, Zi Yan wrote:
>>>>>> Hi David and Oscar,
>>>>>>
>>>>>> Can you take a look at Patch 2, which changes how online_pages() s=
et
>>>>>> online pageblock migratetypes? It used to first set all pageblocks=
 to
>>>>>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageb=
locks
>>>>>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit=
, all
>>>>>> online pageblocks need to have a migratetype other than MIGRATE_IS=
OLATE.
>>>>>> Let me know if there is any issue with my changes.
>>>>>>
>>>>>> Hi Johannes,
>>>>>>
>>>>>> Patch 2 now have set_pageblock_migratetype() not accepting
>>>>>> MIGRATE_ISOLATE. I think it makes code better. Thank you for the g=
reat
>>>>>> feedback.
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>>>>>> being overwritten during pageblock isolation process. Currently,
>>>>>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzo=
ne.h),
>>>>>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its origin=
al
>>>>>> migratetype. This causes pageblock migratetype loss during
>>>>>> alloc_contig_range() and memory offline, especially when the proce=
ss
>>>>>> fails due to a failed pageblock isolation and the code tries to un=
do the
>>>>>> finished pageblock isolations.
>>>>>
>>>>> Seems mostly fine to me, just sent suggestion for 4/4.
>>>>
>>>> Thanks.
>>>>
>>>>> I was kinda hoping that MIGRATE_ISOLATE could stop being a migratet=
ype. But
>>>>> I also see that it's useful for it to be because then it means it h=
as the
>>>>> freelists in the buddy allocator, can work via __move_freepages_blo=
ck() etc.
>>>>
>>>> Yeah, I wanted to remove MIGRATE_ISOLATE from migratetype too, but t=
here
>>>> is a MIGRATE_ISOLATE freelist and /proc/pagetypeinfo also shows isol=
ated
>>>> free pages.
>>>
>>> The latter, we can likely fake.
>>>
>>> Is there a reasonable way to remove MIGRATE_ISOLATE completely?
>>>
>>> Of course, we could simply duplicate the page lists (one set for isol=
ated, one set for !isolated), or keep it as is and simply have a
>>
>> That could work. It will change vmcore layout and I wonder if that is =
a concern
>> or not.
>
> Not really. makedumpfile will have to implement support for the new lay=
out as it adds support for the new kernel version.

Got it.

>
>>
>>> separate one that we separate out. So, we could have a migratetype+is=
olated pair instead.
>>
>> What do you mean by a migratetype+isolate pair?
>
> If MIGRATE_ISOLATE no longer exists, relevant code would have to pass m=
igratetype+isolated (essentially, what you did in init_pageblock_migratet=
ype ).
>
>
> E.g., we could pass around a "pageblock_info" (or however we call it, u=
sing a different type than a bare migratetype) from which we can easily e=
xtract the migratetype and the isolated state.
>
>
> E.g., init_pageblock_migratetype() could then become
>
> struct pageblock_info pb_info =3D {
> 	.migratetype =3D MIGRATE_MOVABLE,
> 	.isolated =3D true,
> }
> init_pageblock_info(page, pb_info);
>
> So, we'd decouple the migratetype we pass around from the "isolated" st=
ate. Whoever needs the "isolated" state in addition to the migratetype sh=
ould use get_pageblock_info().
>
> When adding to lists, we can decide what to do based on that informatio=
n.

This looks good to me. I can send a follow-up patchset to get rid of
MIGRATE_ISOLATE along with more cleanups like changing "int migratetype" =
to
"enum migratetype migratetype" in mm/page_alloc.c.

>
>>
>>>
>>> Just a thought, did not look into all the ugly details.
>>
>> Another thought is that maybe caller should keep the isolated free pag=
es instead
>> to make it actually isolated.
>
> You mean, not adding them to a list at all in the buddy? I think the pr=
oblem is that
Yes.
> if a page gets freed while the pageblock is isolated, it cannot get add=
ed to the list of an owner easily.

Right. In theory, it is possible, since when a MIGRATED_ISOLATE page is f=
reed,
__free_one_page() can find its buddy and add the freed page to its buddy'=
s
buddy_list without performing a merge like current code. But it needs a n=
ew
code path in __add_to_free_list(), since it is not added to the head nor =
the
tail of a free list.

--
Best Regards,
Yan, Zi
