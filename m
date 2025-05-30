Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3C194124
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622165; cv=fail; b=cNP5C0fiivos4PpzOB59ZJdBt/9A9tlzKzI8gPPp7LmJr8aGaxiENxUaSZ4NG1BMpQrpu7yT5CSSDPXRR2Bq5KT42pBXp4Vtgj/HtJZxefHaOeEe8+rRmTcjm7iP+j7DBpg4IzooIlAYZBHBtiw3W3MbffMAg7ojGWQopws5qLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622165; c=relaxed/simple;
	bh=zTHW/NT6WoFLUjC8gGcxLcfDbqEUPd/Km429h6U2plo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Lkrj+XqMwGLkr900EXoXHjP1aBDW+/Ot4Po4G3/B+TgHtdXH/LR9idB/AfzUaiVFYb7x0GvgkjFqv9IqyKFYU2fnqt1S4RwEtUB2nAiASFqGUw/Okq5qkEWtmdjWgai0G3NuDpNmLAJcAeGwIQM9zO/NkQ5dxArFW+ahtPFDAko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PjCk/2R1; arc=fail smtp.client-ip=40.107.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PjCk/2R1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cst6Z3wlLil8pM7SN8fGRLBFRGldGhfovzHBSiWzWjzTb5TAEXn+WrroEIvZuaV/7uZ8oA98Ipaz31GIE8xex0/awCPQEF1IaihKq6bRUZGX8liaAF7xo/O44OR8OilCsK0ih79UB0pfTm3xn8wko5zu0lLXu7Ud/lqXMDtl+ilmhcxm2rFK4jnr4fnPVErcHlUBfQPNE/lz1VvRXBBhBemSL6XcdSvKRZ7ERqYgW3RG93HJgJxyMPgbjAlyEMx/5//2nMl5R9Kt1HJShwH7HhhMf6NrGXuR2X0HCTXfcswapPlFoBz86Z4rSCg62JVde3KAc/4+poClI+MoKBNTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXgTUdgxMBYu07lKotUpP/Pg1sJCVCZI1lXaeVW61vI=;
 b=dfqVyvcwsvtPZOVz2MUWcCBPAthyBQZR/0L0y0y1SQYOa2lwOY2T2aL7G8vi3pDnr1b0H7pfthk5Com8P/MrEsradH3IvTkzYs8amAkJ3FDPHmcyeJCmVK2DRv4Wc5PHlP3lIXMl5JAsex3+0Tzk0yMjM5u+PBt9MfcNQmKJqRqqWkhXFfah64NtnEMUbSRv8T+9ur+q2GAH/C8wpZUhgXnaViHkXNKUp///4UPvMZaZjCUyvsK9ZnWxNU80rug6ti/Zs9bdc9tly7UguDQTphCF7WmsGyzkThDiMJDGpGpoTYzNBVq5+mbLUAkX4PuUFHRy65+6CYhd8ZRNsn/2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXgTUdgxMBYu07lKotUpP/Pg1sJCVCZI1lXaeVW61vI=;
 b=PjCk/2R1f30DYWnN8E3z0nl31QiRLhJBdmvUYqmwuqQoqr5v3Qe7ALRf4Z+5XpSHci7ZOWvmjmMyfu8UYSKlGX9+WoF/+34/cwG82cAkM4bH0JtHR3CY7ot0S2AMOMx00BuAtFbtHtMw92ZGzml3Mq6UUOO6GlR7koAOC5F6EOkbNduUOyUuUmV6p/iy0Xo5HzTU89liyIlVjzsJmAscZVfgVXzMt41ILUYuUS4PSFgSQcwXhAS4YnGgr+/6fCvsxY1wjtoJxvP+dVOG2SQ3Nzj3BTlo6hEP+Nfr2iQtYlml3hdMwtc0Xp2afoUyIxEjYOe4aKE4RwlEonP0p3Q61g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Fri, 30 May 2025 16:22:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v6 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Fri, 30 May 2025 12:22:21 -0400
Message-ID: <20250530162227.715551-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bb4245-0044-4b63-8ddf-08dd9f963162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gih9OSDe1Azsh/mKXZbXI9DqD2b7y7BclVMEy+hK+dS7Hk/yRtJluIc0Exoc?=
 =?us-ascii?Q?t2AZY3+67gu6u4iQ7gYwFKjFHq5uLR1zeliX/DJlOyeE7zzivA/wly1+Jl/W?=
 =?us-ascii?Q?G5xhR3KR2sVOJD5hIxMo1KXXHgZuW8kmZQqe1YG03B704MTk5BewPQ9gg42k?=
 =?us-ascii?Q?nrICxVdWwa6GzU6RetNTBoDf9tB6tujNFoqMG0A7dplEO47vYag9miZtzNBw?=
 =?us-ascii?Q?YbL87I77Jyxsr/wzZMPCqIP1dBMDwkWoWGnmK2WzPIHGLBZY9xH+nAr4XBoq?=
 =?us-ascii?Q?t/4RgmG+ezwUxW+mJrzwj9LFEqeiC/3o/x3FdFuKe7MpuXXp6Vu+zF8akJpY?=
 =?us-ascii?Q?SWzBOpJoOXHW8gP6p7p5S+YzXo9yKOdQWeIH0IkseDci1NSrpUf1BRHAsRv3?=
 =?us-ascii?Q?lWMBd1/oS9r7sa/J839kq+9nBKNBixFNsnmhlkW+3vsilV+dW5syp/DKXydo?=
 =?us-ascii?Q?IvFzvQDKO+dcDmLAXatIPjjpolhPMM8unedrGLBUvUnJ5K+Js9pMvIIM0ytP?=
 =?us-ascii?Q?xf+ZKg8C7oiIurKJWHc/X5U9+KltenECYnkXkeYWaYsQWZLDch2ECAVfMqAc?=
 =?us-ascii?Q?CAM3cbiucnK5btEZBw3SJBBobOZ2B0bOyAtvgTwTAEaBhBZPfy2v70GE5THl?=
 =?us-ascii?Q?Z39Em8aYn/navS8/VlkQphoUYqXyjujqhTfRa0PXVa+NLbpZbn91lNXlGKWw?=
 =?us-ascii?Q?/Fsddn90pOsvYqB615tADM9TaCrNq7cSFkaarGu3coP1o72jNZUUaQ7H52rD?=
 =?us-ascii?Q?YYvroifrfrLzP13ixOEgZXKiAFJy8T7yx2tNlCVDPiEVxF52sW00NAW8+n6i?=
 =?us-ascii?Q?A4J+C+ayreY94vWMhOjMn8EZcC9nLa3OccuxnkI+/VpSaQjgJ2u4K/+WKWlp?=
 =?us-ascii?Q?Uwqu7gcJ0fiUGVF6Ji2CQl4FWfLM003aSyTew+76Gyt1xQs+5tXXuUSxdeQY?=
 =?us-ascii?Q?IbyDC+Lf+8l5jnU27rzF8+5SLAbVlZsYAB7x06M8MXh90ggCyi51wQ+CRrth?=
 =?us-ascii?Q?d+kSzQtjoHrOaTv4vtIPEL+SqZM39QBhknIthRUezuz7od2abBwwyl+40Xv7?=
 =?us-ascii?Q?0TUz/2vZt/TuuUkMNVJGAiIaoYUUTWfgtH56Xd3Mu+LRBoOk32+tNWpOEhTV?=
 =?us-ascii?Q?sXyfraMhxfOCNQYhbuWc8++fl34cT4mEuPIWhoUqCreHAM3ctsNwIDwIBht4?=
 =?us-ascii?Q?DFbebnTq/5Nv6izGBxreqZnVierYusJcTNYJbZtFWNx0B4l2Bz7DWPGxpusd?=
 =?us-ascii?Q?UDeZWiMBrfcFfRMU755Z9IHiqANX1SUenE07w+oVBYfOisEiQp/gopyHJ3b6?=
 =?us-ascii?Q?e9/royfKoXNlEATn7XjANJzEQPdd3/JeQseohWEuFxrqbXI4V8NzTWQALbbp?=
 =?us-ascii?Q?Y8/mXWgmBh4UYOWz9Gc7froV02kFumg8nlJKbgJ1UYmSwxV52wJVdnCdj06K?=
 =?us-ascii?Q?tTA/MJdiohVgvQgVy8WN74v2ZHSONBkP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4BuNgFppeUfhTlznIw2GR8NGQqki8Oiqp1zOdFCt+/FXsF+xqdTzDJfCrAqA?=
 =?us-ascii?Q?cxeAMtAY5Xo6MgqjXuDbPkmT28e9hHbfQZgcuYtAotVFPJp9p/XMBphQ1F86?=
 =?us-ascii?Q?oCv0FNhHdWImquVbzZGb6eqET+r8ENTYq6GVWvnTHnF9VA3EuV3KsRvKCPEH?=
 =?us-ascii?Q?UhFrahVEnVqrjjHUazr4Mi0O7zOgQlXlxn31Ln+Kw+5QI4z2pDx2UuxyFABx?=
 =?us-ascii?Q?4Dce+ZytfeOekg2SM7gu7c2bXM0dMDiI0B8bJh3xJZsqXhhhdyDGe0AjlJ94?=
 =?us-ascii?Q?9i9ySuR00oaTllBg4GnY6Ltrk6ICjtZfYGQNo1IMzGnbBnoNBnm/CnLd5r/w?=
 =?us-ascii?Q?HQ8d0gkcndh1sg0/dr/9GCiroy+EOuvEA4oOI8pBgMLCehqpKHF2LM6ZAcKx?=
 =?us-ascii?Q?0vaP38Jg6P5/jOCEFfJMgtF8l+EkG8QZ5SQMBDnzTO+CL78OZFSnJ68jbJuJ?=
 =?us-ascii?Q?MiLuJDlapAgSPKEAmc7VMNOZ8rYuhtNdQUbacnW7eAz02P6QqHKoBls20R2Z?=
 =?us-ascii?Q?2jsFIJGWhfpoWRk6DlmYhGnmWa1vl44nX0HhBhHzExdtsZIaCuqbudmUiPjM?=
 =?us-ascii?Q?VWk/IZo3RGlmnLLQO7UmANPVrFJbeo7LMMtyIXkrOHyRstQJpfgQcsIKa5am?=
 =?us-ascii?Q?m76y7kdtTvTcYGZ/EDGegeNWbNXWNa1b5YWXrMWzwzKRitKne8wczZayk7eL?=
 =?us-ascii?Q?67vnfHgndCeTDj/lled9YArEAHiK3SHmAxgcJJ63g+ihHZH2hr1KyTA49xZw?=
 =?us-ascii?Q?KjjBQ6gECJdJZNNQDHFUfToZotDTSsrTnyy//++hqiemSFvT4Eeu007v7udz?=
 =?us-ascii?Q?sH/ddJfNUKHu9v0ZMydtLDvr/5ej9qY1+zn113TSPkOWkF2KmnqGWuD1ek03?=
 =?us-ascii?Q?Me8b8qtu863RUvnOgfQidr2TGi+V1lmFQCYFBZ5HiovcVWIjE7QrOnzq1/Cx?=
 =?us-ascii?Q?9LV+bh/gWqqgAc9jljg3FPWheViQ4OGK7ic/UgbKcl7IprMtxMsab0ddt3QQ?=
 =?us-ascii?Q?chbPXpscMRYzHPIC6EFVXn5WvTreGN2ayNWuaMLUB8zJ4x4CfkmWneRy0eUd?=
 =?us-ascii?Q?whaPZ2xWqek3o2Johr38wge1mJisk5zQNnPzMRmz80oRtJ78GvnoWSIt1uG9?=
 =?us-ascii?Q?SSnIDFun8dUKN/2AQWPaa2igKxraqx7V81Y4qUxGJ3GH+o4qup6RuRno3HYw?=
 =?us-ascii?Q?Rqx6uJceLOXV4pzHIuN0IrjJEmnx4dQTgg/3gZmuo/xBLloxQEmC5UeDEIR4?=
 =?us-ascii?Q?fQwGa4taeff/MRznyfomUjOFvKWyVJWU4L7je3J8plcgC5BC8aEXFZ7jvBHQ?=
 =?us-ascii?Q?S0CAqsHjSt19pModZM0NDiT7KRdTveZvjrgr++XAXbODNmOQxujzvcAgDcuq?=
 =?us-ascii?Q?B5EEdtK+7bwUuytMhOT+TgzV/b6MBpUDzPeJSKDQkHsPg1FNV54kY8IXbAfV?=
 =?us-ascii?Q?JkVSYXJkboI7rOXVC4ZuIa3NuxPdrXQVjYsLXF698MPQaJZdqFuyHx4MRZLy?=
 =?us-ascii?Q?Fn7HlYO/0ntFgXXDGo0/dRm8SrD2PTk3ZkUmcRzkzDtFDbfH18t2VMh5rafF?=
 =?us-ascii?Q?mkrKDRWZAj+hNsknV70PDkTzxSoG3ahpJtFTgCMxxqWSaAll8LkPsOzjWx1g?=
 =?us-ascii?Q?pc/ZZJn1HXMrnqqzuA1srFk1xQTp/HpnSGB0DJXXc46G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bb4245-0044-4b63-8ddf-08dd9f963162
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:38.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASJwrFpKZ28ckz25Tmq8cM0QMgMquHoYHY63QjZtN9Z3ma+5/EL/dpSa9SdzCPz7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

Hi David,

I tried to get rid of pfnblock mask by replacing
{get,set}_pfnblock_flags_mask() with {get,set}_pfnblock_migratetype(),
but get_pfnblock_migratetype() will need to do both test_bit() for
MIGRATE_ISOLATE and try_cmpxchg() for other migratetype, which doubles
its cost. So I made {get,set}_pfnblock_flags_mask() internal and use
them in {get,set}_pfnblock_migratetype().

It is on top of mm-everything-2025-05-30-06-04.

In terms of performance for changing pageblock types, no performance
change is observed:

1. I used perf to collect stats of offlining and onlining all memory of a
40GB VM 10 times and see that get_pfnblock_flags_mask() and
set_pfnblock_flags_mask() take about 0.12% and 0.02% of the whole process
respectively with and without this patchset across 3 runs.

2. I used perf to collect stats of dd from /dev/random to a 40GB tmpfs file
and find get_pfnblock_flags_mask() takes about 0.05% of the process with and
without this patchset across 3 runs.


Changelog
===
From V5[4]:
1. used atomic version bitops for pageblock standalone bit operations.
2. added a helper function for standalone bit check.
3. renamed PB_migrate_skip to PB_compact_skip.
4. used #define MIGRATETYPE_AND_ISO_MASK MIGRATETYPE_MASK to simplify
   !CONFIG_MEMORY_ISOLATION code.
5. added __MIGRATE_TYPE_END to make sure migratetypes can be stored in
   PB_migratetype_bits.
6. used set and clear to implement toggle_pageblock_isolate() and added
   VM_WARN_ONCE in __move_freepages_block_isolate() to warn isolating a
   isolated pageblock and unisolating a not isolated pageblock.
7. dropped toggle_pfnblock_bit().
8. made acr_flags_t an enum and added ACR_OTHER for non CMA allocation.
9. renamed pb_isolate_mode items to have PB_ISOLATE_MODE prefix.
10. collected reviewed-by.

From v4[3]:
1. cleaned up existing pageblock flag functions:
   a. added {get,set}_{pfnblock,pageblock}_migratetype() to change
      pageblock migratetype
   b. added {get,set,clear}_pfnblock_bit() to change pageblock
      standalone bit, i.e., PB_migrate_skip and PB_migrate_isolate (added
      in this series).
   c. removed {get,set}_pfnblock_flags_mask().
2. added __NR_PAGEBLOCK_BITS to present the number of pageblock flag bits and
   used roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS.
3. moved {get,set,clear}_pageblock_isolate() to linux/page-isolation.h.
4. added init_pageblock_migratetype() to initialize a pageblock with a
   migratetype and isolated. It is used by memmap_init_range(), which is
   called by move_pfn_range_to_zone() in online_pages() from
   mm/memory_hotplug.c. Other set_pageblock_migratetype() users are
   changed too except the ones in mm/page_alloc.c.
5. toggle_pageblock_isolate() is reimplemented using __change_bit().
6. set_pageblock_migratetype() gives a warning if a pageblock is changed
   from MIGRATE_ISOLATE to other migratetype.
7. added pb_isolate_mode: MEMORY_OFFLINE, CMA_ALLOCATION, ISOLATE_MODE_OTHERS
   to replace isolate flags.
8. REPORT_FAILURE is removed, since it is only used by MEMORY_OFFLINE.

From v3[2]:
1. kept the original is_migrate_isolate_page()
2. moved {get,set,clear}_pageblock_isolate() to mm/page_isolation.c
3. used a single version for get_pageblock_migratetype() and
   get_pfnblock_migratetype().
4. replace get_pageblock_isolate() with
   get_pageblock_migratetype() == MIGRATE_ISOLATE, a
   get_pageblock_isolate() becomes private in mm/page_isolation.c
5. made set_pageblock_migratetype() not accept MIGRATE_ISOLATE, so that
   people need to use the dedicate {get,set,clear}_pageblock_isolate() APIs.
6. changed online_page() from mm/memory_hotplug.c to first set pageblock
   migratetype to MIGRATE_MOVABLE, then isolate pageblocks.
7. added __maybe_unused to get_pageblock_isolate(), since it is only
   used in VM_BUG_ON(), which could be not present when MM debug is off.
   It is reported by kernel test robot.
7. fixed test_pages_isolated() type issues reported by kernel test
   robot.

From v2[1]:
1. Moved MIGRATETYPE_NO_ISO_MASK to Patch 2, where it is used.
2. Removed spurious changes in Patch 1.
3. Refactored code so that migratetype mask is passed properly for all
callers to {get,set}_pfnblock_flags_mask().
4. Added toggle_pageblock_isolate() for setting and clearing
MIGRATE_ISOLATE.
5. Changed get_pageblock_migratetype() when CONFIG_MEMORY_ISOLATION to
handle MIGRATE_ISOLATE case. It acts like a parsing layer for
get_pfnblock_flags_mask().


Design
===

Pageblock flags are read in words to achieve good performance and existing
pageblock flags take 4 bits per pageblock. To avoid a substantial change
to the pageblock flag code, 8 pageblock flag bits are used.

It might look like the pageblock flags have doubled the overhead, but in
reality, the overhead is only 1 byte per 2MB/4MB (based on pageblock config),
or 0.0000476 %.

Any comment and/or suggestion is welcome. Thanks.

[1] https://lore.kernel.org/linux-mm/20250214154215.717537-1-ziy@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250507211059.2211628-2-ziy@nvidia.com/
[3] https://lore.kernel.org/linux-mm/20250509200111.3372279-1-ziy@nvidia.com/
[4] https://lore.kernel.org/linux-mm/20250523191258.339826-1-ziy@nvidia.com/


Zi Yan (6):
  mm/page_alloc: pageblock flags functions clean up.
  mm/page_isolation: make page isolation a standalone bit.
  mm/page_alloc: add support for initializing pageblock as isolated.
  mm/page_isolation: remove migratetype from
    move_freepages_block_isolate()
  mm/page_isolation: remove migratetype from undo_isolate_page_range()
  mm/page_isolation: remove migratetype parameter from more functions.

 Documentation/mm/physical_memory.rst |   2 +-
 drivers/virtio/virtio_mem.c          |   2 +-
 include/linux/gfp.h                  |   9 +-
 include/linux/memory_hotplug.h       |   3 +-
 include/linux/mmzone.h               |  21 +-
 include/linux/page-isolation.h       |  47 +++-
 include/linux/pageblock-flags.h      |  48 ++--
 include/trace/events/kmem.h          |  14 +-
 mm/cma.c                             |   2 +-
 mm/hugetlb.c                         |   4 +-
 mm/internal.h                        |   3 +-
 mm/memory_hotplug.c                  |  24 +-
 mm/memremap.c                        |   2 +-
 mm/mm_init.c                         |  24 +-
 mm/page_alloc.c                      | 321 +++++++++++++++++++++------
 mm/page_isolation.c                  | 100 ++++-----
 16 files changed, 435 insertions(+), 191 deletions(-)

-- 
2.47.2

