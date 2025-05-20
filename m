Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22FE242907
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750052; cv=fail; b=oov7wSpG0VJey9tvAnVvBbpYn/oERPe9DxvF0eP93ibdUaI3R7dVJ0+2oNkJbCs9j3C7OWLMI2AfCBG2YPPgbG/3Bm2lncYgReboQjD+bKPUTXcRq/kfBG5RjRIHj3W+8QNeYYtLbozseQrh3VvhAG5SyNHLUn+2cDj3aNij9D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750052; c=relaxed/simple;
	bh=qaTB9VZjaWZp1ulI+YntEcP4KtS6NpoRlke3anysHi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Obpq35IahPVjeVZOGVQxOICth0ilb9SXKRUN2XEmNusXDdgod9/vhqbIIXmgr1OwZUtUuVkpT/z13vKKnCxugF7iaGF4BiMoFzPey/80Np7oR2ARwMHspcu00hu0n34tEy0CxyLRTR1OkGIw1mgN0PvMMfXJPV6NRsqPd7UkCTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t6Z9Ur9N; arc=fail smtp.client-ip=40.107.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t6Z9Ur9N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIhPHT6+di1ZvOXKmQL39RHPkVtCBZxLd6rluVsJkSWFYho3SZ2yl7mNaEm4wZ51rzSpOm1GgBRsCtNWFiIrIEThemRrl4m3iHa8sN0A5JIEmsiZG14gZiQwBH5TgnldAYVGgow4r0+LBm3Oir+xm/IMzTevKSRYOKBM8l64uO0OZSEpd6gndhKWMGeHG7hXTKcvBBg8SYvIL5XCcg1YRB3V3VCFrrpONanZnlrNrNO+F1YDF0u4AKNvHCQkdc3v8DH9fuxNfKQPJb45FwRQIIpU/ZLYDifCQv7gsnBe8v4Lg4PWp3HkxHVBqHubgchCghwANAmgg1buMkP+teqk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfICjUA8gJAz00tRsZn1C4P+1f/cCXjQvkpFMd6bxqI=;
 b=NczmCUU2A9tGL1DEWUXEnzKJrRlibVWYB94fl1WCDsv6E2Xe8KGLqvOWEMWkKrp7bNKRV1yWiouYsTSkzwCcgzWGRFiA7+ygOCYIYiy/KQdxp6//tyjO7AyB09SSEMg5trpSYT0RDVO5ZFtSf4SdExpZOUtbAywvt0+9JWe5N2kvWpl+taECvgsgWLk53/QFupN52C47bAGQb5FBoqEkcX7GdbNaKdo+nCktzyRbZK/Q+zjroaTkkh6OmSyRrIA6SIOZsboTfEO/87XpP8gO8I5kN6WDZORP/6jADEWdG8bn+o1WzxfCDrTQG5IfXxO/OnErXeIHQBZavs71tRq26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfICjUA8gJAz00tRsZn1C4P+1f/cCXjQvkpFMd6bxqI=;
 b=t6Z9Ur9NWIJTpM3gHb3mAwDTZlm2+Jjrjb7jFbBGT24QMSsIAma1iDJpbCbAMqWpdxSKxM5nY0+lPtJYqK4Adev4J5fQDcByHKo7SoOCTyDHy+Z44ZJJd6e/ttZblSh0T6FdkVA3Y1m8oMRu1WvRxDqw69mA1UrEgCnYAHZMT22YVUaoBmP+GjBJjGYjNWdJwi0EHaYYQjyINicb79QEkLG027xdHG6duY1FAMHZv+HIVLM1D0SddHOnrL8P2pupWLfUz4sOeHvpjHqg9EDTrgyfU+xt9eFX+6lJT0zCtrQWoXzHnugwBOYEZfqD8oo3zFjRvYsibexq7xFfQHcR5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 14:07:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 14:07:24 +0000
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
Date: Tue, 20 May 2025 10:07:18 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BF76B420-C221-43A7-8D07-37863C850FAC@nvidia.com>
In-Reply-To: <39861ba3-078e-40ad-bb9e-43baff981ac9@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
 <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
 <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
 <f090ac45-6758-483b-b289-d6aaabf2dc98@redhat.com>
 <7AE9C2E9-2EC8-42E3-A3A5-3E4458796A51@nvidia.com>
 <39861ba3-078e-40ad-bb9e-43baff981ac9@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b428a5-edf1-4fb3-66c6-08dd97a7a4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yk/qaqDxtSqNUrtg55uD1ceaAPo6jqXpvpclHLKuDTBtBfR9m0qOW6wJU6J2?=
 =?us-ascii?Q?wbMfewsSr9eopVnkkuC6kJNP1wTILTs9rkRFD84Tr71mNo8B/z1IiiXNu0EJ?=
 =?us-ascii?Q?aovMF4QW+Bf0z7xwokm2dDytl3OGNbAVv3JjCkBBw3+yCqJ1yNv7yTimialM?=
 =?us-ascii?Q?BQCrEEZhWRgac8JDDNF5MCd/MfG9zwhrJey5Vx+aLWIi9nDexQcUwJ6aEgjn?=
 =?us-ascii?Q?NVcMzEgMLMCr+lYdllEcN9lLAXIiMaExdRDRLRCJNxPI2tF52V9B4EQHr/z5?=
 =?us-ascii?Q?exSTWANbeN/zQhkqQBFoS30nGHoy2dNmGogPyhN7sqRoAyviStu2nrq3VR37?=
 =?us-ascii?Q?r/9HIqarZrajQc8S34EczZrma/WXuxZ4APANzYSd5xg1+QM4SGREcujzUbbj?=
 =?us-ascii?Q?//Bv0F96eYV+8Zow0uxq9whPjTU3TSLYdo/95qVsHFesMFVvoheQktgP7fW/?=
 =?us-ascii?Q?9wojwI3VZa7lj9g+EYrcP5jz+CPKnQi33LuGRxmZwI/GOaic7+OQBAWH+FUe?=
 =?us-ascii?Q?8jrs/LBI2hSskj7H5B/JF4tVBZ1KIAP6pHbUpIQy7GNK/FW0610fyfGBzohE?=
 =?us-ascii?Q?y7r8sEjAIJ8QNR5EUapXuC/iAg704+cedjrkKzW5eg+0Fwgp/ZwtmbGgKhZf?=
 =?us-ascii?Q?gFIB5gIvHrp2SpAXpPAk+Wzdh4nGBJUYZI4F9DF0qwnVs9u0OxEwEyDcBJtx?=
 =?us-ascii?Q?bM/UsvWrHjs38XsMYGrTPoXZwl8MhgGTCvIwQf0IJx9esRGvvhzyY5x8X2GR?=
 =?us-ascii?Q?hykpYUif67VzlnjXGak+JpVuPPb8TO4lEjGr0h9Dsx5zzDO1rLDP5S6ypNsL?=
 =?us-ascii?Q?LEWgjAmshybAhIiGkOYSxSKI6067ZHcJybY9fZtbYbNtc+UyjklpbDwB2XAE?=
 =?us-ascii?Q?FrCso8iXyy5u9pdZUWOCN8lo+JBQ6LzW2vK2VjZcg9E1ye14OTbidiMIxjcs?=
 =?us-ascii?Q?4Rzb4chPC06G8v5r3R5tVGYsApDmd7lZsfjAn3xbNNprxH08Nh0BziBw5laK?=
 =?us-ascii?Q?lVPBXnOyrgJXxswUYUBT/YANoqR5ugCjv+D+gt2TNxAVjLwRQeJCKEpvMfLF?=
 =?us-ascii?Q?7ZGtGyLOUseZR+UX0hLd7AadzDF3iQl0JShgCzV/djvPv9759oz5q69OZEul?=
 =?us-ascii?Q?wEWGw+j2VTPXiQUYm0jiEEjTKcdf+CtnjSS/AvoWJ4MYUj3EudczVoIDrUCT?=
 =?us-ascii?Q?Ry2nxNu59R+vBR7PXZDpXSy0ZIyrUwTnb8Ssh1csPtrOuGx/ArGGhd5AUYEW?=
 =?us-ascii?Q?vj9dwczxP9WAA1spDnENK4Hz9GgfbfT2KBlT2O61LlbC2kCYRg29Do7SgMeY?=
 =?us-ascii?Q?d3HPfFHZKdU24AhIT7ST1tgpZEJI1qKCtBI+84c8NOEpICLMwPTvAH+qANnx?=
 =?us-ascii?Q?im4AeAR6IHPHpaWJqo8T/vnT14HMQ0wtG/nMD83AvMakHpNcvMLXvV53LD4y?=
 =?us-ascii?Q?MCau/KMMwDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2+wWJuSXhjf2vNmE4lQ0NH8gVHbJyN5M/fJLqDq6jGQU6cd6w1xNKshVpXRa?=
 =?us-ascii?Q?73MwE2t+dMIWsteFXgGxGktiRSAXMGFy0IqDc9P+SyqwgauTPSaeIilitgOL?=
 =?us-ascii?Q?+zIJRFcIvt9s122oVtK+8dqrvvZjih+dqpZxxlNNHLDIgMhfp/6C7Dk9hXQr?=
 =?us-ascii?Q?RKLkjPRhpgSrP3NLbkxPrVq5SRiiODtnv9r6X4KVIpYfZpIoYNFz3EBUfJqL?=
 =?us-ascii?Q?LlcI8Sv3wszP3KkfOVsJzCwxiuxlZ88nQaw3Jsi9OoP/C9NjJDo+78EOO8K+?=
 =?us-ascii?Q?cySM3vdznqq4HTaE0zm7I12B8BkIeK7N4QNj+PJTHhq0oSXhKYRnMqijGhmE?=
 =?us-ascii?Q?KC8z//3ylSgNZTxI5du5g5aFsFJ7vlYjv/3M+1zrctzdgByanzqXZ0iyRAMT?=
 =?us-ascii?Q?84oWXN6GX9sDjK8ECFgIevzvENidpDNzXIAIIqQE1wGoNBcb5unYGV5Apzru?=
 =?us-ascii?Q?0mhS3FhLYMfoBpRcAW3Pl1SCT1XeK311wTWjO6Zi6ahDUOk+/IC1kUE6zuGW?=
 =?us-ascii?Q?EAeyKt2Ofz45IIvviqMZGNm0UIbNnH7ICFTx9sBDlUn3yfF3avixIL/5G0ZQ?=
 =?us-ascii?Q?drBtnk02Tbsb7AlJCQawEx8s43cWgVH81AJHfXuGm0zuIeYFcezIdnAVhQzq?=
 =?us-ascii?Q?/vICKjbqnbU3pCcUo7mn9FknEmjx0ot7I4IvcRAaT/uHwqnwwSaQvNKPgoQ1?=
 =?us-ascii?Q?ZYmS43i5WUm7b6jDB8RnfKtFYxwrayvoiNsgVNsrmJz48kkb3LvBvC9x2LYL?=
 =?us-ascii?Q?GCaDjMdjhF0IFDOALEmyDOCmWF0DS8XTbHBtmGLuc+68g8zC5BwQIGhiA30E?=
 =?us-ascii?Q?OogV7gKcoLpBnKJ755HvhwpZHugEPSjrIv8OJpbpscfztodDyW3DSI3oJITy?=
 =?us-ascii?Q?e21CK7NXe9PMuE2fZIW6gElpFktuX/nK8j05ITHeuiGXywVr7t+12oogMvy7?=
 =?us-ascii?Q?EyExnR/GM61sL81Uk9uejagZHy9U06y0riY5vAdSXzN/wcng+QxUlTWDZXjL?=
 =?us-ascii?Q?jvVAh5t6HZFS7tIMHWAjI0cvwK4sK7DOHVKwsgPQHnxTFIsXNFEWJonw/bxE?=
 =?us-ascii?Q?yPGvf4cHoGKXqRmhJzPMj894xKrkevTmzZviEwnbnfGuQR3qtAhh66NSaTe4?=
 =?us-ascii?Q?gVbxHfCyCDn1IkdWNqolOpeXLjqkcJABX71BGV2I3pFSofgIGciqtSgxhXzA?=
 =?us-ascii?Q?zrQ3yxu6dybW4aOdgTo4ftQ/duIDiIX9u8Ihf+PATYozV/hyZKrXASlzxiic?=
 =?us-ascii?Q?XhdryzNAjgDkPps6kxAeA637YHu9nf9jbXhLMDN/dXLtb7HnQ0D8l9tGHCNq?=
 =?us-ascii?Q?yJBbA+99wx6ssf92bBVLbOZzRFrkIJ3tF6pLNCWA5FshpCQMUl1+Tt95niSj?=
 =?us-ascii?Q?UszT06VmGGlpezgs+PyYwfm8fPILck1HLSivHxhP5f/2i9FK+oqwPfJd1x0W?=
 =?us-ascii?Q?QaErU9YGnGrw/bwjl0POKTG7nfjUKihArjedhY70C+yZ2sKV2zCVStAj/Hg+?=
 =?us-ascii?Q?xyesi5q7nqO4l7UnISLdZVUf8sAZAjLGK1nDbjRix7oHT96rD97V9bnOrheC?=
 =?us-ascii?Q?aFQnkfMnVwIuO5ufHMNJETXeUuz84n0ePqaqxEM2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b428a5-edf1-4fb3-66c6-08dd97a7a4f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:07:24.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbD7uqbkPVWCGpLf0A8UR4Z8GcGNusRxp8rNxWgEWsP83ovHoCQ9sOZMk9DM/XJW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

On 20 May 2025, at 9:33, David Hildenbrand wrote:

> On 20.05.25 15:31, Zi Yan wrote:
>> On 20 May 2025, at 9:20, David Hildenbrand wrote:
>>
>>>>> if a page gets freed while the pageblock is isolated, it cannot get=
 added to the list of an owner easily.
>>>>
>>>> Right. In theory, it is possible, since when a MIGRATED_ISOLATE page=
 is freed,
>>>> __free_one_page() can find its buddy and add the freed page to its b=
uddy's
>>>> buddy_list without performing a merge like current code. But it need=
s a new
>>>> code path in __add_to_free_list(), since it is not added to the head=
 nor the
>>>> tail of a free list.
>>>
>>> But what if the whole pageblock gets freed in a single shot (IOW, the=
re is no buddy to lookup the list for?).
>>
>
> And thinking about it, another problem is if a page gets freed that has=
 no buddies.
>
>> You are right. This means when MIGRATE_ISOLATE is removed, the global
>> MIGRATE_ISOLATE free list stays.
>
> Right. We could just have that one separately from the existing array.

Yep,

struct free_area {
	struct list_head	free_list[MIGRATE_TYPES];
	struct list_head	isolate_list;
	unsigned long		nr_free;
};

--
Best Regards,
Yan, Zi
