Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141225CC77
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826220; cv=fail; b=Q++J2dgkiSixTaacjdmJQbonYoEGWDhyIco37JY33d/990YqyyBG+RL4VCQqRatqmCMirH96nl+pj8R1QTUo/ureXkKf4GFxg3RA+/3mpH957q2jTJuyGegos7UWsfX8sMFjfVevy90tnfH/JTmdMtzdxABVL76qE8g+r5E4P4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826220; c=relaxed/simple;
	bh=wjUOaYHgECn12C4u92L4nhsj5NOnlri8PUyWHqtdhJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c24DXC3RZHhdkR4fQd+/y1soD0a5ZbINedmhF4e3RgBx3DEefIIZDDp3FQz4CY8phF4/96nAM63tPDT36ZSNE82ykSow/S1ZSxBPKaXbfFEnhS+uQcxh29LbJr21zENACXJIOebJcn9dV4oMSgSYouKicTSeLBwx+gIVJ2lmGuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aGEWDzgy; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aGEWDzgy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2j3f9RcB00zaiDs0NsMKV3Y0221fttrhyoHVc556PpzIEHiZMM0pzHMfT/i5/3YC8ArgUtRpoyet9SZx3ESQk+vcG9wgf+Rc4jr/mnNQvPn3ZCwRIGqoJFzunwGaI2oCcO26gyRQX5FVBRdfHXeZzMMR1PgF1JX+eVyvOgT+v7KDyKxmrl6dmH3MHj9GIT7ViT830IZUqzFFFpgWublmD2SxvWN2n/96uuOEP7MGYJgt8+c+U7ouFMl8otKxrofZeHQ5lp+8YN42K/1KAskBU+tzulu1KaL6tLk4cjseU8BFr6ueX6f+PcIjHI8i2WMnCxkC88ju0pakCeLD0fpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqXl2JIUvf6lPqjJ7GtfkKK/vwhOCbE43nvc2B9m4XU=;
 b=dCj11dNi3PAnw8dwm+Kdr9I3vBU6kODqu0msmWrEmht4aqA6ZhntkOWDpWZCcXR3Qkx64ywLtWmGdivkIbaE3ltawNNXfMNIf6trOOyU02GI3NcfkKn0cFyNM0DfOrk7QxJYD//Zbk9zzd+XToQpuRDhLqekPuI1ozQpAQJ1fooC2w88FlIMCzIaDryHSSKZu9my6YlY4IFulifqJM+wplM0Eum/1C2miR6obWwbKp/z3G9SRn6PUonApWigzLh9NYFxPSX2fwmuGBrHJvbZiV89Wh/MofNryVD+iq+mbktLLYFvamnT233kXaQFmb91ESVEveALZ9YuE6THJEDKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqXl2JIUvf6lPqjJ7GtfkKK/vwhOCbE43nvc2B9m4XU=;
 b=aGEWDzgyZR3pn0FehbUtrLQeXs7a6nBwBc7QnkKrUwa/XLzwwaoD3ojpothAzPkGp5HJSuCRsWzGsmrtnCCgxRd/HVDfDxYvkdxY6XfrzmeNsD4mn6AKxtwOxFF3sQZc12HcO7YZPW33YX7YuDkmghVL1QLNDZRzSvv3RhGABiIJPcO4cit7ur8dwXuKR4NGp88PBVjYE/HFVBghs4FspRA1yaYnQfi1OtqyL+x+0fFIPnKmmW6//4taKYvS7VvJARPxATb9PRUqcKt4RBbLyuxBmRbFK8N3Qi7Iq1NCPk5jah87bxcYMTmAxSJS6ksqJa0zEtcxw+Dr79vD6esvmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 11:16:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 11:16:56 +0000
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
Date: Wed, 21 May 2025 07:16:53 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <CA27CAF4-DD4B-4350-90A6-AE9A808F05C0@nvidia.com>
In-Reply-To: <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
 <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
 <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:208:256::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 8553c3d4-90ae-4e9d-f6b9-08dd9858fef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0i8zbR3YOGFt4iT2+sUdjtvrFy4o4YnvZvdFkjH7hwFNkUwZ/7Kd8n8leKAn?=
 =?us-ascii?Q?lZi1G/L3rFxHTkwFx2Bah6ZPXfnlpVmiB7f1EjzG4C6ssyoUMqMlCTlYcOiC?=
 =?us-ascii?Q?TQ5IB0Q3RO5K9Qd/+NP7kaWXgBhobUCny+/EnhDlOwaA3bbIioEib2RpVRn4?=
 =?us-ascii?Q?SEIpLqpXEOHLrJwTTAHkneppkr+cxLmz33Qs5wGUg+NlESklsvZPH4pelQhh?=
 =?us-ascii?Q?JdHOy2E4Nanm6TJHw/u5XzdlCNiwUlkTRhpq6wGeh/9BS/WXHYOgVZlVozSo?=
 =?us-ascii?Q?3LPRYw315Kj5KeCtAWsW08Bh1egvofnmHQdic7dGOppuVV0KvzzIcNVxHiDv?=
 =?us-ascii?Q?Auq2EnyBxtPoIpl19hezVRpJTu94tbneUtgK+TSClZmCvuwolsuqqa6JJXgG?=
 =?us-ascii?Q?GpYjPdsv3GfKSC2w3MOI+8WFNID8XXOtfKrsQtWakNLjyJ2J0LT4Hl3a7ciA?=
 =?us-ascii?Q?yrIbnqBeGu0POMl5KoeDhfy2LZL2uxYoCHnoM+JWGqFMjJNKPYjvNowrhSgH?=
 =?us-ascii?Q?BndGE/CJrmWYsCCCjC7hnaZ1m+C4XPHtjmCjJLCMW9nJ5tuDoSG+PTFeLDKl?=
 =?us-ascii?Q?wcnwPb/awyvftwNIqKy+G995mP+dH+OXKp9JD+pj4l/EawIZADWJYWcNu10a?=
 =?us-ascii?Q?1lq767czo2xu8gvYk0JFEQWjaBDppG6IkZQdKEws4WI3LL+BA8CJnc0ugEOE?=
 =?us-ascii?Q?e3EepAZtEai4BhUq2aeqbpYNnbCYfvToOlEU+ELq/wxgBWQ3z81Y0jKR+9Mb?=
 =?us-ascii?Q?qwTIry3XdfD5QODrOQ/jvwivZeVqIkomOECIqM2jaFkhtsnwTybgGbr7br2c?=
 =?us-ascii?Q?aKmDiPdjGx/XWDuWeDJFCkmutLGJYrLEqUnCa69jQHZSrlOz4S2I65cTHhxL?=
 =?us-ascii?Q?r9v69Qz8sZX0ZkZbwCP23YpKSBC35xljNX68AAy+wPtnP07Q64IXlq4M8fHH?=
 =?us-ascii?Q?p7VBGxG9eun3ETx9y6Ld2ikelUUskaph/D2tWm4tB/IESuy8vgFDE1iRnIhq?=
 =?us-ascii?Q?bDOZRfgLbZiWjnP4u5PZB+PqWSknlE1bs+pLBXXi8Kc2NrF4a3NlpYmXLTBd?=
 =?us-ascii?Q?zypvMM4DJHux+psDhzxh7/kBj5AuDnLuiURbWeHiW4N5s/MphvLI2hA+LsN+?=
 =?us-ascii?Q?yYnU4mqmAUKdlas48iyjO+S+7qbTCRhtidr0BDkbsI0QUKjvN7JzFUA8jkoR?=
 =?us-ascii?Q?NK2+893ONE8Ntpw4J8t9sA7bt68GUxAjB+8MAsSy2n3cteYQSjND/zeh+nNj?=
 =?us-ascii?Q?LH7X11AetsMoDYK2fbUMgG38CMFVQZc5aPGMX7aM3ng0DynHkRD9ovPVC+3q?=
 =?us-ascii?Q?qwcbl1UguBfNkIZ0C3GlT0XMI3ijKAEDfAdUVEpO3GHmXkrdtgnk+lu+Dfz5?=
 =?us-ascii?Q?gLQeV3VWSHveJskcy+k5/fcOZY+3DqQH3cZHnkrjkFqKdb5+D4XPlK/7PdwW?=
 =?us-ascii?Q?FengoHaeluc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L8HDcihiBE6T/Wl74Qrv2zCmWyrXuhW7dysNOe3rbmIpZsHpmSk41LNEp+IW?=
 =?us-ascii?Q?Y+kHaEAw4DgPq2Le4wiA8/vYptIciiiCIDC9/kzbDeeG5uFPGJidOHwOC+XO?=
 =?us-ascii?Q?+xQBQKRMv8obtp06c5hJra+yHKRlTtWM6rpG0wnUiKxiZT6z2LsaZELgreIa?=
 =?us-ascii?Q?k4nUX89xcWQYT/EdXhxPu/wOnzt7XlNm1z8KIPO9TuFY5zGXPpAc1TeygSu8?=
 =?us-ascii?Q?g0Zr7Uae0hNAWtfMAaIABKXIzNqKpWDLgu0xxQUtnlFeiKAV3lsioYpXqopw?=
 =?us-ascii?Q?dQhjgGpUB8FosMh9JK4ARIH/X9G82kVSTsuAWlQuK7AtDW3yN2vp/eraFm0j?=
 =?us-ascii?Q?Vz/On0aDIHBKsLo60+Um90g0wd3tEifwmeV55GtAJ/HFsG96JUec3U0iwwTF?=
 =?us-ascii?Q?imznSgX7dvIUyRzr5ZzhpfEnnzFRjzy9SjsemtEYb+1APQkpx1LFhnEGF7GT?=
 =?us-ascii?Q?+X1KuTbV/cHDqPfb8GvdiqnFl47Ib1eXKfPquqhVUSiniQ9XKVADN3kfDTkX?=
 =?us-ascii?Q?OrxSjpoyfiM/ShnengDpQgd/KrCjJcEruONyqh5uI9psy+7o5/Kjl2hj2SS4?=
 =?us-ascii?Q?I7dEcglPCpcVWej7ijgw2szljvAvwnqIHzuUbaPZRx4GrDtmqgtkKiK/1vV+?=
 =?us-ascii?Q?NkUENgnt+7je090xV33HJGqqpjw5Al02mIZJv0Mfjz4Ez33y2hx/yH5eI/ta?=
 =?us-ascii?Q?ubfv2jjDQKaX9M7SyKJxF0QTePy0YXAa+oz30t2tBjcdApPivG/uu0xcGGij?=
 =?us-ascii?Q?hCOVigiTN07IUej0rf6aDlsBhz/5Ijzg7t26uXffuNjOsAIp5DeHN23nYWpi?=
 =?us-ascii?Q?mhBx3HjP6DGrKKu+to+gEN1+32cBSRAFU5VgoL6wTXqRbCtl0VIvMNiw7wpm?=
 =?us-ascii?Q?pFb8GjpRcbVI1CdzZWAel2mApN2U6ii9Z+dW8uhVM0G8Gxk9/SOw3GRiBiyH?=
 =?us-ascii?Q?dTCFYC5JvrxVfBjGdx5LZR/KYgTMqW7oY6G2Q8kRAalVA2fdsuGcdsE23mUI?=
 =?us-ascii?Q?9IrK7caOMPjBitopHXBM3Dnw1p6JLXW3t/PKkIjvwxk7lFUsJHAB5iuZ6zYY?=
 =?us-ascii?Q?REBv5hsF4V+tBfnneCxQR1xgz2goAzRIqoiP31G3eJxkudxDJF9C27F8GC/w?=
 =?us-ascii?Q?qkqiQmwSpiZ459cus9cm3BCk5cwEYJ2Wj3mvZg+6qbzsGcH73fjPVS68UKHd?=
 =?us-ascii?Q?TO/tyfXECJKHapXDRePzX+t9lj48HyVZfF7oxb916ZcEdxgMZZNNLPsBBYkj?=
 =?us-ascii?Q?s0q1ZqNQzgWEIL+yu6+47Jgb/YGgk08fBxcIzmnXmgtd7c3RfPOXKF0RAbzP?=
 =?us-ascii?Q?Z8R8nEEDkwfafGxadAbueqfodv3c/5VZB0QBDOTtONBNcYOwFgJ+zpVDM/wP?=
 =?us-ascii?Q?iHY7zagWGV0fUWlrSrd7HwJSbNcZOONUrg/FCksc3I+zV0rOPDLGbckOSSiK?=
 =?us-ascii?Q?HD+pjrVxKpdhJuJ5M9wybPTf19SAKG1yWEQs8t6vFS3CaxHSizXXseHdSpcN?=
 =?us-ascii?Q?0Uq/OkvHq/clsXrk1gfe7GD8JajOwjPnAx2/LI/HA6h9aI1SrGBeLusaoM7Y?=
 =?us-ascii?Q?/dSCv6fHQlV7EtSY7m5N9cVsTvULGRvcaYQGlRA5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8553c3d4-90ae-4e9d-f6b9-08dd9858fef3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 11:16:55.9393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +R7k07C0/drv0V0e/4jug/NVjs8adtf5q3PJw4EtLTCJTMpcwHxa34iv8u9Eque7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

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

After implementing {get, set, clear}_pfnblock_flags(), I find that
get_pfnblock_flags() is easy like you wrote above, but set and clear are =
not,
since migratetype and skip/isolate bits are in the same word, meaning
I will need to first read them out, change the field, then write them bac=
k.
But it will cause inconsistency if there is a parallel writer to the same=

word. So for set and clear, mask is required.

I can try to implement {get, set, clear}_pfnblock_bits(page,pfn, bits) to=

only handle standalone bits by using the given @bits as the mask and
{set,get}_pageblock_migratetype() still use the mask.

WDYT?

--
Best Regards,
Yan, Zi
