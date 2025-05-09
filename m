Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8E139B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794945; cv=fail; b=VrbTpe8F3ihvvn6/ZjV9RuyZWQvhM8L4yRoq91bnppfpLSy5aMwsLJTWhwVKsiPRGDNj0JYylkOrtj2AyJJkCQGlkEBD2s+u2vPGZ2anWWwN2CdlBoi08pr9cs7aT/OetpEPK/7NrNzucqVQbvOC566HjK1ewJCWY60H0dWq5MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794945; c=relaxed/simple;
	bh=BJJPvduBvT0F67qIBHqGVcsTsSkb3yd8/n2OzAeXvKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kKlTKZc00WgqUdq4Gfkaz6JJS9feDGof9ld7r/rj99ZWHd2UlDk5lM5y/QN8GQsc12MjVBaGnThYcFzcNZRL2qRWwlACXYS9sCSYUYNbyY6JFuii9M4d2W3KFD17JiP2KszAXWslpVN4BCRlxRfjlfFbDfkWVWtXAOBl8eZWt/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SC/W+XhV; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SC/W+XhV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2KJA6iBHpj9prpyJ+XbjPGclroF7noyKqDUxZQv4UK0E4bbJeQXavtmBwG+XjpYsbPnfUlYw9hWf00rmpoBp8F1Hg4YFbH1v4bEpOZBwXf4Bt6hqTrMtiwIwfbPDYv6t2+6dYmkbNE7wqYNkLGY39zoP/q0Ki1nmN387U6PCKjFJ2rJHVi456Xi6o9w5vymlfNGuUGXxFb8dz8XuXFEgH3w+rqoDvBKm3hbbOA5Om3oNOuy7hk5ZmPwxnldhyBHoIeHDfW5nlSAtSocJ8qWxIrrNZ74mrJUNg8VUWU9y9ajVyUb2EPgbKZJELkGWEjI8Nt8JjNsj0j+INlrQ1xdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAOOCDepC13IylbFUv09CMkr9pG8yYUy7apQDsHEh34=;
 b=cdacfTf3NaqRYkch52nYUZmJfsv/xfWZlko/2saIg1z3KM7tQLg1ig1yByufXX0pLCUDG0KXeO3HrOTiir8Biab2YM/5WSxgaqq34dkSAF/m5EqMwaeTJAiFXyhDmHQ1E/MaFmYUfDGmFlRMw9JYmZ2Nnld0iI/x1WcULwjD5kq2aQUDomRvgehQIz0AqA7FzI2qU2qCnA9ekhgY/VpRH/J3/i3rCNals2XoXj/sBXbHK0yqrzUZ2drCZ+yeSw+ctY7/QM00X0+Bn6Q8RZ1ePBRKQNsliQvUFHqx9H2QxJgFawGxhLWUg5REp0jbffqtS05rT/0czaB+ZRuZhRIulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAOOCDepC13IylbFUv09CMkr9pG8yYUy7apQDsHEh34=;
 b=SC/W+XhVhtX4EfRL/XWgpVXJJvrvfEt2ZIsgkdJmVfl3GmLOrR+POMNhWNOwyT9LYDfCm9qeJ+iwBLZ+Z9AS+jC2bN2TkN6PVZjRjuzjOFq8sHm8K42ZSWiVEudno+WW1C2i6yr8X4Mqvte1ABn0H4K3OVA9BkaDVPZqt962KeQE4LKxhStPNs4yngL3ydh5s+wh+PUA2i1YETRpES4fRObEjzcWQ/PRtlGolZpxtXnwoFFkQxIoIns7H+7ZuX43EKtep5Ab8N2lXj66kt2WqSTwturKhTqTppL3Sq9VuHdcbRIE+diR0XMvhpKfkNOTYpalEbFkiwTcILr2gsHecw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:49:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 12:49:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Fri, 09 May 2025 08:48:53 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <452B09C8-3910-4DBF-8BED-108308C53B02@nvidia.com>
In-Reply-To: <CB3081A6-34B6-474E-B895-0C054C1DDED7@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
 <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
 <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>
 <20250508204644.GB323143@cmpxchg.org>
 <10C2C1DD-A6E2-4745-8C2E-D09886F4104E@nvidia.com>
 <CB3081A6-34B6-474E-B895-0C054C1DDED7@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0490.namprd03.prod.outlook.com
 (2603:10b6:408:130::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7e1f8d-da52-444d-41ff-08dd8ef7de83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+eQfbxk7kD6LOhXtJ7fTpeeerITcrLFupjl5zx4fIeGw5ZxiEXIcAsTNyfC?=
 =?us-ascii?Q?Qpx4FyeKrHe4eV85L428udVJ0DOO6VW386lm2fT0ly3zvtfgl2qySctwcpD0?=
 =?us-ascii?Q?5oNcrBRtncNBCtJ0oBHJXzKEsfi/w2ygjclvZbJvxhKLcd8uhYwWR4XJEOg0?=
 =?us-ascii?Q?0nN5RWAZmqih6WTT7Ne38VKXgvJN5KZXJ8uBidDV55PKPD/+scHPz5sBKq7L?=
 =?us-ascii?Q?cT63Gc8sUbQ2eLBayRv4f4KfYltRfnY9xaQ4e9/U11tVb+AwZKxCaDEzmTrd?=
 =?us-ascii?Q?2zNTQ6Ms45gaehdspYaCzgRYoZ0HvCdnnzI1xo0oX7uY8rSgUigCO0dCYa0r?=
 =?us-ascii?Q?HWauPS0MVPYX4dMLNfm36Dzk50UGBOqlCt1h2NqzZf+VYoplAb4eBp0Bc4zB?=
 =?us-ascii?Q?QcmP0L08ikodu+HZB4kFwuyqKEMikXFRmP2Yt1feuSRBPttlkqz3kf1PYN0K?=
 =?us-ascii?Q?LapnfzDhl/04LFdGx9H5Na+L+xy0Q+fY2bWodsWDJUBjxjnfbspRZc8MzT3x?=
 =?us-ascii?Q?11XpGj8jxP1pivBUJDDHhVegkLTj+qa1o8zuDGQBrXJG4ZuInowC+dL7AiPF?=
 =?us-ascii?Q?HlScq40Tkxy43t6vOBljOZNVVWdIC2BEPsRaLyZFe03t/Njr5Fzbejm9WCa7?=
 =?us-ascii?Q?OUwuzXH44w687DhoIEqxkytOhfGQEmEgD9UEGk5A27OMjFDWnBoW/BO0ok4S?=
 =?us-ascii?Q?yvRjI7Qs8v17UtAVMBjQ0IfV/BRSzcaK/D2vVP7p556lgRSL6k0N8lQvHAlb?=
 =?us-ascii?Q?zH4aN6I8w6fj3VexDPHoSHPy7OiEJfuVu2WKLmFwjuo6vueCcgReLdqpF1Rk?=
 =?us-ascii?Q?omVbbZwDb5StBTjlsbE4thfTYgV0jcvPXh/Dm1LNDDeuM1v+Mi84ir+zZMVj?=
 =?us-ascii?Q?rhxu8UN8NPS9CKL0QyM/H8cpMTQu2yU2lkB3jRHIYvZzSZqc+WDTkZ3CHykd?=
 =?us-ascii?Q?iEGVOWVngNn5M2keMM/utVqO7pF700E+/drhevkoB2/+zGPwZ9KPPqhhVj3G?=
 =?us-ascii?Q?N4FgkTZPGjJfmCnyecGPa0oOo95YMHnRxcpgiTix+k4DcYXAB5fBQzxuUJZJ?=
 =?us-ascii?Q?JM/TMulho1pNk6i3vuKOkax009bp6/xW8UFdrBzTqgwD0iMt0G4h/C0MalxA?=
 =?us-ascii?Q?0Sso7BwL0RA6dwLM2m/6gqq+dXRdZqIZ+nOfE8Bt/ZUW5h3XXLuQWkafCzoL?=
 =?us-ascii?Q?X8UFG7LMPKP89E55Yy3SXJg571PEYLup87Ocqursr4i+aqIa2pmfWnEpF5hH?=
 =?us-ascii?Q?LR3Y67Q51+wApbRupOPXtd0ud4Y+NZ/q0xw9u5nJHQ85O8QL1naLvVZFNiyx?=
 =?us-ascii?Q?Vp7vCB85yDT5g8zIZ2MaSTmuvGqucmVyq5osBzkRlHk1Scbn4EXrZdS5b20T?=
 =?us-ascii?Q?6HdQXfz3fSrfgSUfllhmGsYP2sSQebgGdbpCq2st5fHBcyuudOK2cKZnTSYH?=
 =?us-ascii?Q?+KIeF59z8rc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0kGEmttb0f96WBDod714/vEL55qYfV2u0Bfr+NtUxXYzEHuQjYYlOeQQl5jG?=
 =?us-ascii?Q?etcQEcNwjFUckPFi98hwTsHaMGpSdDkRBYn01h29TF2cfYQ9AffoxJYwV2eJ?=
 =?us-ascii?Q?qpWKFnduKKqi+fmRQia7tJz/0BMTQfgFnIOYib+0pYicb5DhXeXdmKsmds3W?=
 =?us-ascii?Q?Tx615ydpFD0M5v0njXCTAVoDZK35mXgCN8+zJN/CwpmjK36LTfclivBU3jQj?=
 =?us-ascii?Q?844SeolTceziVRXLeEolhRhL3Mt+xZH5xNgFqkPkEUnrHAqqs3V21PsjttDa?=
 =?us-ascii?Q?9Ccuv5wRL5JMvIRekiy3S4MyXVT9jVeU5rFONlglRka3yNEA6G2TNrWUeFMU?=
 =?us-ascii?Q?CgCOWZWmuT4vn4lvlg4IpcmbnlYgUtptapC9mQkR32/14G/N1QYb+RGvRZoL?=
 =?us-ascii?Q?XVbw/OM3cRNfnEtbheY9TxVL/62IJ/apLOHUwD5n8Rvpr8L3LzQtct5YYrWz?=
 =?us-ascii?Q?wmJMMFA2oOCJTrrWCuFnrKWRizar/PsCfviAqb0GcDM1vn7mC2GVjbCLI3cb?=
 =?us-ascii?Q?UaSo8D+CmyWpwLrQk0VKzZQ/ueezjhVtxr/cd6TeJdxC2FKSJYukfIZ02TMR?=
 =?us-ascii?Q?r2xTtvaiaMTayBvsW+sM2MCbzM8O2jW9AExTd2xMKL+VFWoG+/pc1DTyuTXJ?=
 =?us-ascii?Q?aN3EPAMb4s3s69ysFAD3hoeHk4gf0ZyCdaVZID5tl0mW73BN37Lca/E0qj7c?=
 =?us-ascii?Q?bvJCFsogIne1bUMlDtERt5o6QYF1nDqS3MizQPD7+aE+rC6wfBjyc0iFLN9/?=
 =?us-ascii?Q?V5QNSi+nroTJcL9X+NIaM7lOW/kvk5se+GnJKz35Q8pQX8thfpVX7su8ZXFB?=
 =?us-ascii?Q?YMAL4egsTNiVopwkBzOuCFWIVG/8QU5I+iWwShgbrUJyNF2jxpZ56j5z8V87?=
 =?us-ascii?Q?Q6Sa5olVhFYVKJqHhVgBYfUQwZeqpplmQxuNFVB9lIAKquXY0bZ+Nn3x0+q3?=
 =?us-ascii?Q?5UdExd6k5TM6qAcC4aMdug9m74ZL/NTQwZR+LcCVjlfWRbzNO0TfkbPDIbsq?=
 =?us-ascii?Q?nzsyQNzGlDylZNIoG1w03C2M5ohBDrZ37XNy/8B6BIS4oREAwHcTkGhoNNUk?=
 =?us-ascii?Q?WDS7yrSRt0E8PWTId2unvOn+4tt01p40UzarSbEgvWiwbRRdISVOGU9gopQC?=
 =?us-ascii?Q?JcQBnG3yiUoCahXWxsPTRB0MJ1wDelHLlVKoVVzbOC0U2rfboClvyC2XTNSb?=
 =?us-ascii?Q?j9Ot3aq1vpUT9MHhXjBdU90G39N4ePza3m4PvQumSpR+2D7JeHsPmhGNxzF/?=
 =?us-ascii?Q?wz9z99ZVHD/W73B+N7wsdlfekcZXoVPZmbZqXw5AikAWRanng77ano4NIbbq?=
 =?us-ascii?Q?ycMi5W9ScUYpf9Wbdvm/kn/m+Krzn9zFcfK5yyeo4y4l+lWWqbNBBJHdk5Xw?=
 =?us-ascii?Q?NvhVFXbX09nM4PAww31qN4eyE/S6C+a2hj3YXGCdrnrtCmdhIeGsjIEpRB+u?=
 =?us-ascii?Q?L5P+FFbirE99p+YHVk3Z0Cg5PLVmXqrKvawBRzNCVheFHRFlNex5hPloid0b?=
 =?us-ascii?Q?jBZLAdSpOnmPhhj7JLhyn73gn2dE5jMi1OuglAjIxzpAT2i8W7gchx9IfLkg?=
 =?us-ascii?Q?pmcplzbMZ5YxgulVONHR7sTqHpxt7yUEBASKj0Hc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7e1f8d-da52-444d-41ff-08dd8ef7de83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 12:48:59.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jp7RISVGmPRXdZGfh3W01V56Zt4aJWNIVu+vaT8kLYlLmrfDGQZuIVY3/PfhAsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

On 8 May 2025, at 21:33, Zi Yan wrote:

> On 8 May 2025, at 16:53, Zi Yan wrote:
>
>> On 8 May 2025, at 16:46, Johannes Weiner wrote:
>>
>>> On Thu, May 08, 2025 at 03:17:05PM -0400, Zi Yan wrote:
>>>>
>>>>>>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *=
page, int migratetype)
>>>>>>>  		     migratetype < MIGRATE_PCPTYPES))
>>>>>>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>>>>>>
>>>>>>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>>>> +	if (migratetype =3D=3D MIGRATE_ISOLATE)
>>>>>>> +		set_pageblock_isolate(page);
>>>>>>
>>>>>> Are there paths actually doing this after the second patch?
>>>>>>
>>>>>> There are many instances that want to *read* the migratetype or
>>>>>> MIGRATE_ISOLATE, but only isolation code should be manipulating th=
at
>>>>>> bit through the dedicated set/toggle_pageblock_isolate API.
>>>>>>
>>>>>> If there isn't one, it might be good to enforce this with a VM_WAR=
N
>>>>>> instead.
>>>>>
>>>>> I checked all set_pageblock_migratetype() callers and do not see
>>>>> one using it for pageblock isolation. Let me replace the code
>>>>> with a VM_WARN and add a comment to tell users to use dedicated
>>>>> pageblock isolation APIs.
>>>>>
>>>>
>>>> Actually, move_freepages_block_isolate() calls __move_freepages_bloc=
k()
>>>> to move free pages to MIGRATE_ISOLATE pageblock and
>>>> set_pageblock_migratetype() is used inside __move_freepages_block().=

>>>> So the branch has to stay. Will use the suggestion below.
>>>
>>> Ah, good catch. But looking at the callers, it's:
>>>
>>> move_freepages_block()
>>> move_freepages_block_isolate()
>>> try_to_claim_block()
>>>
>>> The last one would benefit from having the set_pageblock_migratetype(=
)
>>> there explicitly, as this is what this function is supposed to do. It=

>>> also should never set the isolation bit.
>>>
>>> move_freepages_block_isolate() has two set_pageblock_migratetype()
>>> calls already. And after the series, it should only manipulate the
>>> isolate bit, not change the actual migratetype anymore, right?
>>>
>>> Maybe it makes the most sense to move it into the three callers?
>>>
>>> And then fortify set_pageblock_migratetype() after all.
>>
>> Sounds good to me. Let me update my fixups.
>
> Hmm, hit another roadblock. In online_pages() from mm/memory_hotplug.c,=

> move_pfn_range_to_zone(MIGRATE_ISOLATE) calls memmap_init_range(),
> which uses set_pageblock_migratetype(MIGRATE_ISOLATE).
>
> I could use set_pageblock_isolate() in memmap_init_range(), but
> that requires move set_pageblock_isolate() out of mm/page_isolation.c.
> The change might be too substantial for a fixup.
>
> I also would like to get some opinion from David on this. So I am
> holding this fixup and will send it out as a separate patch when
> I get more information.

Hi David,

I have some concern regarding online_pages() calling
move_pfn_range_to_zone(MIGRATE_ISOLATE) code path after my patchset.
During the process, all pageblocks are initialized to MIGRATE_ISOLATE,
then undo_isolate_page_range() is called to unisolate all pageblocks.
That means these pageblocks do not have proper migratetype, since
they are not set to any type other than MIGRATE_ISOLATE.

Maybe the code should be changed to

move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
start_isolate_page_range(pfn, pfn + nr_pages, ISOLATE_MODE_NONE, 0);
=2E..
undo_isolate_page_range(pfn, pfn + nr_pages);

so that these pageblocks have MIGRATE_MOVABLE type.

--
Best Regards,
Yan, Zi
