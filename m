Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351B221739
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881644; cv=fail; b=lQMVWOzyxOVgNh+rg86n2/C2I6RAgUm79PU16z9fPSYWj08upzMccD16khIeU1PlSfTt0lkkb4MsIfgLLXFZyTU6SSRZJO2pUrIk3NA+aJVH0Lb2s9XzvvjugmELwdBsb7O30v6keunQSjYnKCrhNQD19pAAohMJx//FSEABgeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881644; c=relaxed/simple;
	bh=7bCb4In3UiYBqqVpSsEYxezPNyPwxF8/wRfaLr1pQUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I6Owlp3X2oZWWi9z+8obCV6PbdGvymi+YBGgdOfsx9f+JhqD+UXfZgX3rHELZGwka7gaAiRqMn22yGvQQg7yyucWQnaZ64IdOqVoxIby6AnQiRLHTRvLWKfqyolVVKA1wbTZx0wrpoRHRB4UOIdgTSh4FK/5znj3XiUp2SeyOXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OoeGHooV; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OoeGHooV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoWHd4WkACsmwI8Dbr9xWXkPNQjjuJtQhFCmMJfgSTmjtwXbFMrYhCsie33/IpnknxTN2VtzFgoCWud6xcoiuxIwNYSx6xwwtcExaFgONh/laGPHfUa+Koi7MsFHlQVNF5JKEmlzSDfKIwr6qfaJgS1BuK/vPcHIohVsHCBpiH+toO9lnCXSwlltTCp20xuTaB1+49CmMzCvs+0NznJ0E7/AKLyked2obRoBQ+KzcjwyaVD/2vTJ1dD178lK6+AyNwM1e8Yx6drGZm6uvPRYDY/JIYyxkdpHsBCuXXLbTjLPQ0vKU3TK+qCacgvBc15T3sVAf6cg0quKJ2TSjkmamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzkBLXdxKYjyY3+lHuuQTCU91dr8ROSqCeO/2zWSk9A=;
 b=SP0GVJgIhTwZiu/JM/hLs/YMb3HzfXnMOQR7InLwPJTR4+JhN8Z4V/uEib6bwaCwtUGodm/SWtwebjS+CxtAL+hDrRQAlxPUO5TpmbdOd5yh3NAC8GtBnTfk4F8qA7osGMza+8ODB++3o4VpOoWhHWpFln/ZwiBMqVxXesDf50JKPG0kBWr3yBW1jcnXlcT8NWi3pQaZOQKkgouewiBF4mDmuUZPaynGFfztgWlD1Ow11yIRxbuxcSkG/efw0ERTSuILjnHCC+fV9LCKcAmw/H0LERNURfOris3ZqZnJXa3dbKWCMG2+OqUihRZhpt/TrJY9jPM1hXTCT8MCKdE5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzkBLXdxKYjyY3+lHuuQTCU91dr8ROSqCeO/2zWSk9A=;
 b=OoeGHooVhbhB+FzlOplPIpZ0d5CpubEFxfIbuGR7iEB8wKRw/bQBBDS0axuiIJn1hWmIhVUAB6T5H5Sly7g545v2ZHArtQFtMjIR7kYnG7RxGxy+Vc0fVx5/TiakhWsHpnLi7wMJUIW1deUjG/36J3a3NQTmh/tWguBhPgw1jZ9ivoEk3ptrI4eYSFIsUeSEDIa3RgOyZSFax6MNqduUTrxXNutbUitZQ6WDYcp0girzPjjHnu2MUeyR1ZOGI86Ojt+gfPz2X3NPDa2gNr/HaDLztgF88rcUYCCMPp/mRjDgUXzvIQmYUtlwB2oZkblqkuXfQ6XWhSfS0/wkyv6T4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.36; Mon, 2 Jun 2025 16:27:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 16:27:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Mon, 02 Jun 2025 12:27:10 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <C778A657-4C37-4F8A-940E-3E73F03ED4D8@nvidia.com>
In-Reply-To: <756e456c-225b-4686-a3e5-09ee6f76453e@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
 <8C1EFB3C-0F1C-46DE-878A-3546A86A141F@nvidia.com>
 <50da1626-5894-42ef-b3fd-935a331f14c4@redhat.com>
 <BA6A258B-04D4-48F3-BB47-1F1DDAA0BDED@nvidia.com>
 <e53ce3cd-86f4-4bf8-87f3-08b16e002378@redhat.com>
 <30A5DAFA-9594-46F3-8054-ADBA83C551C5@nvidia.com>
 <756e456c-225b-4686-a3e5-09ee6f76453e@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3eebf1-4d8c-4f48-7c7f-08dda1f25482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jtNtLAnoCY5zKKbW/xjwS4xqBmUtwCHCrNLdVHBsZuGMXrGBhJDx1BOcV7Bw?=
 =?us-ascii?Q?6rWVNhUvi484xhvJKAeW/XvtL3/K3Lx477mtfGeAn979gXeXCVELAqkrBdo8?=
 =?us-ascii?Q?qA+7GXCunanpNdWrRcVB1IoSU0FSAVU35t8cvHLVniN1zdk7JPE8Cw17zFTp?=
 =?us-ascii?Q?TuSkEUIY2grrZ5L5So2qI0LFpWUV5AAHm2jDyaG17M1kqhWXeHMRrYGTQ1Zx?=
 =?us-ascii?Q?QRorV4Gn1/7NySROeUx5XfCxix8BuJsWo5rSX1EQ6r8ObhUnHQRB1DJUIPj3?=
 =?us-ascii?Q?1CpEIUYkGTlgNCToIR29oHX29lsnC+wByM02ymGfl0Fx3nju9R5+EzS4rtXd?=
 =?us-ascii?Q?bett/laCHDgDeW4WrI1mR3PqPZk/79eV6JZ9E19kCWWljCSca1U9ba/uBRGw?=
 =?us-ascii?Q?TQiRmEOxk4dF6CijjdgSOgo2SYN8NCfOOV1ehHN9+Dglv8htTnzYDhf6Dy3z?=
 =?us-ascii?Q?B9P2jGbDBBqYkDFh2cgY93oA4j5usgdmWM+ADjKRRDzxV6g/5QYItwnJf9Un?=
 =?us-ascii?Q?AnNA9RQ3k/DcbAnDUSIjeGruIM3boRrDXUouOXq4FTGw3CTmIE+nb0mBnus7?=
 =?us-ascii?Q?4rGGRpIaL/cqvfR5mdKZp+6snOef6yknVasjJK01oTOQqdfnUqx7c1l6Jrn0?=
 =?us-ascii?Q?6iLXcdyzwu9HwxNgCEbmlTU3845TEZvOuJEfaDWCgt81aIyb+Ou/PrEL7sNR?=
 =?us-ascii?Q?LOtkficHLAYTXrKzHvmT+/Xk72IXZr/cb3w7qUMhv+afMemek6+qxPcPqlGR?=
 =?us-ascii?Q?v/Baej3FVZ//7Vd7GxEl0SSZ0rEeFEWgEsu4A2FbEeUFhgyFGLTKQ3xBXB7Y?=
 =?us-ascii?Q?l7o51zFZypD2eIiftMT+ORMImZITCd/VuSwc0mMcHbmKmjDrBUqVOBq0ksDi?=
 =?us-ascii?Q?/eJ7JK7N7YBIGmnKZj1raN5MbQsDx2ygk4vnYHkwEMfl9Kt6ZLFM/hS5IIhy?=
 =?us-ascii?Q?RutEhpAy3tT5pqLa3JgvyYCYmsyc7ViEpPek98TPpVodHUMUJTt4m9x94zEg?=
 =?us-ascii?Q?zYLpBxHbVMuUCS1+/TktYtxrErX4tVNyK4u6DnX2rkV9mXAwfKqesNI2h17g?=
 =?us-ascii?Q?FaMw1YltL2vqMtHDG2qi2jnLSSRQP1S9cgMxEHmGduT3dDlwE0aBrxgVEvz0?=
 =?us-ascii?Q?hZrECy7nyW5JG1Lwx1ifpW3NL+ruDZYOH5O4Ig8WXcQNOX+BKaEusdrssanA?=
 =?us-ascii?Q?SJPSIBQdU764tk6pR5bfdFsReB6apOxMThJ8/Ws7eyJ/ZuoPDJPxR98r4CTl?=
 =?us-ascii?Q?a2WoOka6PYkAaDjVm0hDYNCB3TiesBO1lE28rgE7dobDZcscZkU3sZIvg9Aa?=
 =?us-ascii?Q?8r75YjysA+VlF/GWUhQaOaTpk6V94gzBYMXbC9CEawooy/bE/bbe77gPs8eB?=
 =?us-ascii?Q?f5w0tZ60VT8QYRXh4oK8SeVnCXa0DM8RI9W48YITYSty45Gk2bJTpVnedNvD?=
 =?us-ascii?Q?qSIGEteH2Dw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txEU41k4DhDnvtMhvlAUYOBufvFzR+lwkNWjhxe4uLyb85cfMjYoKViu0Qjf?=
 =?us-ascii?Q?EQLUBLx3Mq4kXvVobuoZjYV6ZRdKunrh9UkSeJZfV8rxLjJxKnoRSKSYCiQL?=
 =?us-ascii?Q?cPRXfGTfHWHcYlMenCwDAJKSDC2YSPC90PGaBGVH9cwALEUQFstv+D9VGWQa?=
 =?us-ascii?Q?g9VWAtE3ADGfvzuvJ3Rl0XhEYMcUTuuv1OYJz4KReE2rnK7pg//K8bMYNBB2?=
 =?us-ascii?Q?1G5aI5/LgjRTDnF2txQIvXZxqT4SrDKWUdPGdhnoJBQLzPkEgBGiE29Gn8O7?=
 =?us-ascii?Q?ZTpH51CBje9MHrsjwHLxWaQJdIXjLE8gWkHoptM4sJJUEJGY+zJsQMkC0XBT?=
 =?us-ascii?Q?ps+uK2s3Da250eDJ2LtfgAsf2pNabB9ym03pPMNruHt4mgxrHVKJraViszwR?=
 =?us-ascii?Q?tKvuqmVV2dfBJkZVfTvW7L3D4qMnl9uHFTFyswoVqvlPuHMHJJt+MmbQUSK7?=
 =?us-ascii?Q?GuZsb3ef2G+AlDdqomE9UKkDDN2VpE+j4ZcVe8MJ5vX7v0v+YIE+zHdioL2b?=
 =?us-ascii?Q?dNxKXx5cxZoAi3nI9JK2nnAZjxj4tTCCNpKtci26uYKHBmLdf97zwGNbKP51?=
 =?us-ascii?Q?vcqsrm0XSElD9zh1RsNudda8n/qXNqqG5X31NPARkTtLXYYCYx9ZT52GWZRN?=
 =?us-ascii?Q?fWeo7gnZN7poVSJXwX5bxobORMLfjyaWn2xjMOH27n4Sbb9SScMmnvVu9uF2?=
 =?us-ascii?Q?tjYkQMFMZH6EgRRQL5O1XXeDxKT+AgBmwRKtlCviUYEQ6mMZCpXj+9iwTJkD?=
 =?us-ascii?Q?w3Glsgbw/QW0PqOMP+4Npvg9N5oa5kbENcqp/Ipbs1qsiPb/CFEZ+8KNT+e+?=
 =?us-ascii?Q?a5uPUBTBXjdUw3lFh5TT93w7TKyi8UDP1rhqTI1HkZj9vrxnNtSKMB/u1nXI?=
 =?us-ascii?Q?si123qSwv7VvHO1iRXeZ082YSYKdb7jDA6GN+cw2WhpJTLzExmqsYL+v1NO6?=
 =?us-ascii?Q?vRAcATyu4JIDu01YLs4WQ5LlDKHCxsBrMkgDFk6rdCiywV2nMGFkTr0PsSq1?=
 =?us-ascii?Q?+zJpsqIW/9zB95d3MVyqQ4rrhWgE9rsR02o11pkdEutGYvB/Bj1WCXIkXnTE?=
 =?us-ascii?Q?Fs3pZvKtno9UCDm/3ZUmOu/zY8WBkb7mwD558J8yBjlnIcAzPOA8V4UH26e7?=
 =?us-ascii?Q?NrC+CK+t1fbeZNPrCs7FmIhH60Ps/mtsfWfrwH7u+y8MpqO1BeMpHRxHV84Y?=
 =?us-ascii?Q?x8RkAWH/K2OpBvwr8rvgbRNo9ogOyi2HriuujOuhz4bDKdg57qahniDpAmfG?=
 =?us-ascii?Q?Mlb0phyP/53iSETkVeCz/4Z/WbuXENe/VM9mr+HZQW6EdbYS+eDxh6e8uyE3?=
 =?us-ascii?Q?ZbL3/mVkLTwexXnsCP1x53XQnTEf3R8sxvZKxReZLOn4Lkbq6rkT/K3LntB/?=
 =?us-ascii?Q?T6cVnggr5uc28TaO66qGrvx+kiJ2lhalQPTkfYo/HfuZKz57GFPWkr+etvk/?=
 =?us-ascii?Q?M6HZee52mDfTJqO31VR/2X80V+6TCqkZdAB45eKSERQboxFrwqREyv3XOSLP?=
 =?us-ascii?Q?UYIeR1wl627vfJXE/H0eGURmWLg1Ka2cS2773xejN5vJHY0oGrYg2S8oxN0z?=
 =?us-ascii?Q?cRuMy9Vs0EuPswzeBLHkI6B+eHIRcCSgQjnX1x4S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3eebf1-4d8c-4f48-7c7f-08dda1f25482
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:27:12.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX2/4xk0OEhHUOF6l7xAiK2EAE121u3RcaLqehJJKgQH0QAgpmsXMWKNNe33sqfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

On 2 Jun 2025, at 12:25, David Hildenbrand wrote:

> On 02.06.25 16:18, Zi Yan wrote:
>> On 30 May 2025, at 16:55, David Hildenbrand wrote:
>>
>>> On 30.05.25 22:46, Zi Yan wrote:
>>>> On 30 May 2025, at 16:08, David Hildenbrand wrote:
>>>>
>>>>> On 30.05.25 21:58, Zi Yan wrote:
>>>>>> On 30 May 2025, at 15:56, David Hildenbrand wrote:
>>>>>>
>>>>>>> On 30.05.25 18:22, Zi Yan wrote:
>>>>>>>> migratetype is no longer overwritten during pageblock isolation,=

>>>>>>>> start_isolate_page_range(), has_unmovable_pages(), and
>>>>>>>> set_migratetype_isolate() no longer need which migratetype to re=
store
>>>>>>>> during isolation failure.
>>>>>>>>
>>>>>>>> For has_unmoable_pages(), it needs to know if the isolation is f=
or CMA
>>>>>>>> allocation, so adding CMA_ALLOCATION to provide the information.=
 At the
>>>>>>>> same time change isolation flags to enum pb_isolate_mode
>>>>>>>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>>>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>>>>>>>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE r=
eports
>>>>>>>> isolation failures.
>>>>>>>>
>>>>>>>> alloc_contig_range() no longer needs migratetype. Replace it wit=
h
>>>>>>>> enum acr_flags_t to tell if an allocation is for CMA. So does
>>>>>>>> __alloc_contig_migrate_range().
>>>>>>>>
>>>>>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>>>>>> ---
>>>>>>>>      drivers/virtio/virtio_mem.c    |  2 +-
>>>>>>>>      include/linux/gfp.h            |  9 ++++-
>>>>>>>>      include/linux/page-isolation.h | 20 ++++++++--
>>>>>>>>      include/trace/events/kmem.h    | 14 ++++---
>>>>>>>>      mm/cma.c                       |  2 +-
>>>>>>>>      mm/memory_hotplug.c            |  6 +--
>>>>>>>>      mm/page_alloc.c                | 27 ++++++-------
>>>>>>>>      mm/page_isolation.c            | 70 +++++++++++++++--------=
-----------
>>>>>>>>      8 files changed, 82 insertions(+), 68 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio=
_mem.c
>>>>>>>> index 56d0dbe62163..6bce70b139b2 100644
>>>>>>>> --- a/drivers/virtio/virtio_mem.c
>>>>>>>> +++ b/drivers/virtio/virtio_mem.c
>>>>>>>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct =
virtio_mem *vm, unsigned long pfn,
>>>>>>>>      		if (atomic_read(&vm->config_changed))
>>>>>>>>      			return -EAGAIN;
>>>>>>>>     -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MO=
VABLE,
>>>>>>>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>>>>>>>      					GFP_KERNEL);
>>>>>>>>      		if (rc =3D=3D -ENOMEM)
>>>>>>>>      			/* whoops, out of memory */
>>>>>>>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>>>>>>>> index be160e8d8bcb..51990d571e3e 100644
>>>>>>>> --- a/include/linux/gfp.h
>>>>>>>> +++ b/include/linux/gfp.h
>>>>>>>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(g=
fp_t gfp_mask)
>>>>>>>>      extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>>>>>>>       #ifdef CONFIG_CONTIG_ALLOC
>>>>>>>> +
>>>>>>>> +enum acr_flags_t {
>>>>>>>> +	ACR_CMA,	// CMA allocation
>>>>>>>> +	ACR_OTHER,	// other allocation
>>>>>>>> +};
>>>>>>>
>>>>>>> Hm, enum !=3D flags.
>>>>>>>
>>>>>>> If you want to use flags, then just have ACR_CMA. ACR_OTHER is im=
plied if not set.
>>>>>>>
>>>>>>> And ACR_CMA would then have to be "1" etc.
>>>>>>
>>>>>> I have a fixup to change acr_flags_t to acr_mode.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>>      /* The below functions must be run on a range from a single=
 zone. */
>>>>>>>>      extern int alloc_contig_range_noprof(unsigned long start, u=
nsigned long end,
>>>>>>>> -			      unsigned migratetype, gfp_t gfp_mask);
>>>>>>>> +				     enum acr_flags_t alloc_flags,
>>>>>>>> +				     gfp_t gfp_mask);
>>>>>>>>      #define alloc_contig_range(...)			alloc_hooks(alloc_contig_=
range_noprof(__VA_ARGS__))
>>>>>>>>       extern struct page *alloc_contig_pages_noprof(unsigned lon=
g nr_pages, gfp_t gfp_mask,
>>>>>>>> diff --git a/include/linux/page-isolation.h b/include/linux/page=
-isolation.h
>>>>>>>> index 7a681a49e73c..3e2f960e166c 100644
>>>>>>>> --- a/include/linux/page-isolation.h
>>>>>>>> +++ b/include/linux/page-isolation.h
>>>>>>>> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(stru=
ct page *page)
>>>>>>>>      }
>>>>>>>>      #endif
>>>>>>>>     -#define MEMORY_OFFLINE	0x1
>>>>>>>> -#define REPORT_FAILURE	0x2
>>>>>>>> +/*
>>>>>>>> + * Pageblock isolation modes:
>>>>>>>> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate)=
 memory
>>>>>>>> + *				 e.g., skip over PageHWPoison() pages and
>>>>>>>> + *				 PageOffline() pages. Unmovable pages will be
>>>>>>>> + *				 reported in this mode.
>>>>>>>> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
>>>>>>>> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
>>>>>>>> + */
>>>>>>>> +enum pb_isolate_mode {
>>>>>>>> +	PB_ISOLATE_MODE_MEM_OFFLINE,
>>>>>>>> +	PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>>>> +	PB_ISOLATE_MODE_OTHER,
>>>>>>>> +};
>>>>>>>
>>>>>>> It's late on friady, but it looks like we are duplicating things =
here.
>>>>>>>
>>>>>>> Let me think about that once my brain is recharged :)
>>>>>>
>>>>>> Sure. Take your time.
>>>>>
>>>>> Could we abstract both settings and use a single one? Then, we coul=
d simply reject if MEM_OFFLINE is passed into alloc_contig_range().
>>>>>
>>>>> alloc_contig_pages and page isolation, hmmmm, MEM_OFFLINE is kind-o=
f an allocation. CMA is an allocation.
>>>>>
>>>>> Just an idea, not sure ...
>>>>
>>>> I think so.
>>>>
>>>> This is the fixup of removing acr_flags_t. It is on top of the origi=
nal
>>>> patch. Take your time. I guess I will send V7 with all fixups next w=
eek.
>>>
>>> Only wondering if we should rename "pb_isolate_mode" to something mor=
e abstract, that covers both use cases clearer.
>>>
>>> Hmmm.
>>
>> It is specifying the purpose of either alloc_contig_range() or
>> test_pages_isolated(), but these two use cases do not have high level
>> connection AFAICT.
>
> Hm, then maybe just keep it as is for now, and have the translation fro=
m ACP -> isolatetype.
>
> isolation modes should probably be an enum.
>
> acp might long-term benefit from flags, where we would essentially for =
now only have a single flag ("ACP_CMA").

OK, let me send a fixup to my V7.

Best Regards,
Yan, Zi
