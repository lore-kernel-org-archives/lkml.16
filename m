Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643C25E83D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820879; cv=fail; b=ZzSjCbWyOZVo1MkyBMRmMRkD8sha1M8zl+fsqLwV+ESTu+wCfNpc5eaZIdEHdEeH5LETFyKaiRYUUr2/ghWumTkW5PUMCKet9j1OwlwZHqY1BkIuslgEGTxw6K7/4NjRENCAwqiucZKUvQVhctdO0NxsO6y4wcpmfebHeWPTy14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820879; c=relaxed/simple;
	bh=1Gha8a+0uCJAXMsZP4RZ5A1onAPXFLIKnb13o/LRyHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yyi3yfWspqOHBl+4ixh5B2sBu2/yZ1tBPmeimd8ub60lnvIb5N2Lop1/zrPzqEeg62fT1GPHSV6l9yuLWP0FWudpGOuq2uaJG0mtGm1s1VRTZFkTElPPx7+04E5CcdLgG57m6AhPtyooNEw/ZHyT4ib7XHvXj9HuE6DgRuizYpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rzj8BKVs; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rzj8BKVs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8N0awc/OKero91OwrVUEaGFksKDWzo2aEDgTErKH2JnYd0drV1th/kJfJS7pQy1UiO/OEmUfDx+j8EMZlBzpwSdwPa+okl3arYrI+IlZYRRdpyVIdYbxdvTVjzWOK4Lt/0GUL2sqbt/8hCRqePUaMdPfJI33cq7fFGsl1UWcn/6a7tavDJdxIPsF9lknSzj9paqGCxgSj/2rebo1zUMWWersZKOMCwT1WxIvleuPEQN7r86TSJAkbW79SY1sekrNJ06KfzvWOqacsUFKQcrfoE4du1b/U8oTejf6sd5axGw0KBpen26fgF7IOLZhP8p67R5uYZNsh/59yDaEPLfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiDlrJSByHeaurDWTxzOpZz0GTExLOnLA//XKs8Yd/0=;
 b=hKydlEG9ROq5govw33VBRrOe4Bgy4tJGp6owPrXC9WpZbhSUHEloNwectOnV9wZBlBBfOm43jgjs6LHileZ2qqnMI0pPsXcUWR4Iw7btiS0FbxIfm7AvITJFH/E2V5JoFQRsUVmUmoDI8qE6AKcaWdbXU6tV83bbxIZ8K5Tts3So7gzLDkh6vgtXnRV6YUbt31/6zoGCP05FdPt5ZFG7q0cOgmGbNnzr8V07Vr+Z245z+zJWrqYZoPuHVbyNiCS8sDVD6xriKFlBq259+cCc/g3HmXrIc9kcJx6S1AJOcZ0rG2bG70CYvXxEHqNa1NMsTfuuHE2uw6zdbSEbSPTzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiDlrJSByHeaurDWTxzOpZz0GTExLOnLA//XKs8Yd/0=;
 b=rzj8BKVs7be8t/RaXr47/JiC+zZMMPaJ9N27yoMBCsUv6v3Xw66W3M85HG9Dvl+4TeHDZZ4bFbUSfjIXrCqT28aC2o3/tmpSdPaebNIFPwnyzAdn7+Qi8KzfBfDL97vdq9HNVeqvu2Wdfva+KcbcHGH/8RoL19EDhBNA6cXNzmocRRXIcBlrW3fT/dUU9ruZA5Eqh3lm3UvK95WZU0X7jJTBhd282n4rP7fj0D1mqeZ/H9LP9iAOcCfDWnphgr0senVmlpz4e46oejoO+luuzQuclv8zUnwg3cgg05M0rW9042FhkL2tHQ8cVwNJc1pVvwdrMOEmbdv+WwqcSgS0kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 20:01:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Fri,  9 May 2025 16:01:07 -0400
Message-ID: <20250509200111.3372279-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:52f::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 880285b1-3d48-4e58-8e00-08dd8f344065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lszyGwzdIeaM+ZpXUh/aV0bzkiON9fdA8Ro8diwtZtVWnk/ajeqUDt4ygynX?=
 =?us-ascii?Q?yo56rX90KEaCijPezl2PdHmNX4C0Ljie4nccmIP5hT3P2GQB2a+YoD81IdNB?=
 =?us-ascii?Q?uYDEV1hXGHdpMNmnRr+bG9pTLl9fucMulUh20h5tuC9NxtMhEENDNTr763X4?=
 =?us-ascii?Q?PbbGdrYbf6UPWkTkYmZBAlFo+kuZW1D/SjUseb6ZugjxHAQcRm4ybNzHDCO0?=
 =?us-ascii?Q?naTLPPXm4HyYkr3e5Tx8fcfflkPecpE9DBKhTvzbyzS6L4flSagkbADHBcYk?=
 =?us-ascii?Q?ka5P8KvseuEWCLIdSSFODFp4wG1GOnPx8M0Tfgz+OPF8z8xuIJVUwnk/8OAX?=
 =?us-ascii?Q?SPGgll3mfCOJZqofrrCO3EXnjxB62vxHDLQO9hSxbe/rr+4Tv4zg7Ki8FZum?=
 =?us-ascii?Q?sp+H5swkWR6cZZYIFtlf0m/PE+tO1fq6jWyDMRHMaAFz+GhoMIP2R1hQSU4e?=
 =?us-ascii?Q?TavCIr+3UhzrRD5XrpLGWXZt4hsIaXDAnpAiJiWs02dIuDkiReZYPBPn3b8G?=
 =?us-ascii?Q?YfIxP1TWliwXUawFP9Ig3crBYgdb3EUNhQ/C6DvBR2ChgnVdlFU/JG8oae0S?=
 =?us-ascii?Q?qq6aTEoZkslnr9LdXWufS/328viD5b4Dx9n9ITierIdAkxHX8x6Nnipj/8Ib?=
 =?us-ascii?Q?O03Dj3m4yghoz5m0G9VeAFiexj96Pak0xFbfuXehuoLBUKd7OuvZtDBuy7ew?=
 =?us-ascii?Q?xKOrQrCOBJOBfyuP7YJtAZpmCSMcHmu2u8x5/GD/uMz6A9KGXwzr8mS/SpwT?=
 =?us-ascii?Q?iHBrw1CR2K9320LIf8WRigyxTbOkZgB48nR9fwaUXI8bo8kZcy588i4kUYCm?=
 =?us-ascii?Q?KPlENDfbVeTsaQp5KClCEUQZMXXXXk6lbN/qPLWszm/l1JB7rwv0Z80EU8GP?=
 =?us-ascii?Q?GUiyaNHmrw3fEVoJ1iDqhThU5BzEDjyQ4US4RvcnW4yS+I1DjsSGFZCGJfEG?=
 =?us-ascii?Q?f6GXRpclEhx/m6y1vfCB3oQGRbk3cXGhklM/4b4sM1wWfcJ6BxmaQcRI6l7e?=
 =?us-ascii?Q?y7wxPuEsEmh3ktx6W8f0dt3gdrpQZovFJjKRLSxCGkUfAYFQOjbYAKFOoe6k?=
 =?us-ascii?Q?YevfXRYQxAcbZV6LIBtc4nfCxQ21jIxgxXVa3u2uahC/qHSpapkGftu/fPHS?=
 =?us-ascii?Q?xqfxZbm66/IEycw2PekfHveV6GwAGOQkOA60/N2NsIZlzCqQyI+jQGfDJ3Vy?=
 =?us-ascii?Q?xiZNvOwmzJiMDGgCe0yK3zpK1uf1fDwXRL3WHCdrMBAesCe2UUmcdQ9XE1NT?=
 =?us-ascii?Q?DzAUOH4muFRjEzg52wxtabPgq8CvBk9gh/1uezGoNliLZGQx/kQPGurJU5Ho?=
 =?us-ascii?Q?djTcRxyKSgypdlw6gQqkc7O3A8fcPP47TOeyUl8zUxU7qYMbzuxHDfkmd8aQ?=
 =?us-ascii?Q?udOumXtnWZbyHu8qdc1a/gMDs5w1CYnvsnGyd0yN+a0C882iBOyR1loy4H8/?=
 =?us-ascii?Q?Q9UWkfpAyao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6+F7hcJFU7PsMEfvBcj3e5tjYlmtHrgcHYISFcG/L4Ki+cs4+oJTeV4ebuBS?=
 =?us-ascii?Q?MF30XmPdYs/gnx71KKi7nxhrI17yjvgaEqsuQ/ZuXlIOt2ETfhNRCJtWeKhz?=
 =?us-ascii?Q?P1Y0cez2t4PbK+6B0oLH9UkxEGQOBMuDnirW7NaezJ1YMZk1ZQB3cJIDhywl?=
 =?us-ascii?Q?kGS40/Igho2YgGK2H17YRlx5fvJbuyBDAS9wo7DAj08dGHzvffjjUPVxp7i0?=
 =?us-ascii?Q?xZmJFVQuKA84xQymWes4EJCKTXXOI69RYE7F/2ESk5rrImRklbrTSPwa+eX+?=
 =?us-ascii?Q?FsCVV/wJ8f9w7XaqdWrTfa1lpBK6FCmg+tXg9p8TvI2NGvb9zmHqSdN/GxcI?=
 =?us-ascii?Q?5RrJuqCHJczm42eEnRyN3gGHWXutsJl5we/TQ4OOi8ZtT6tIX5ZCEvrAAJ4E?=
 =?us-ascii?Q?kslShwzFrE4oeuZ2dHjLmVrsMSbVzxk1kb36EJDQYM20WlPvY26IXXTdmMGm?=
 =?us-ascii?Q?RdX6BqvronWPbAv7GfWdkLDTAhWyZetC8N7DordEWJg+c5Yhi3Utbjni+5Hj?=
 =?us-ascii?Q?+PwFLN+rm8bsvWm9mjuuPOuJsHl2vkCvtv42Z4WuJhfZHDLF3/qyrxwtYvad?=
 =?us-ascii?Q?AYHZudc7Yi7jFuOdh53lfp+X403dz+cWNS77DxE1avG4es0h3DNPxgR7Uff9?=
 =?us-ascii?Q?vwC/USAYzjtGr03FA+2C5p3+DeCEFgHZAkUjArvlxqRv96MS2rIx6tujnQeO?=
 =?us-ascii?Q?DbJ0PiTA1Afd82Z7Qn1RnZfsaKG6qOsNswUh7LTgActi2ZqX1OYJt/3NPSyY?=
 =?us-ascii?Q?l23tEwI78N3JlthRtYB0RFLSDFMCrzc09Gm17qTam6zEfaNhVmYOEoZPN7dl?=
 =?us-ascii?Q?JjkB1C+cwqfVa8tW8mJwt01t3OoP7pkHtyIdg7xINdW3xm6tkYHofiabZXXQ?=
 =?us-ascii?Q?MUBjDSqdNgG9LQAgrHvy6n5ePp29jTqUKeRhNfloYf7sQyLdBlIAZxqiaLTX?=
 =?us-ascii?Q?6J/qZeTJVDV0gIpxqT893FKlQ10ezj1mMQ+YBLl9MkItWPkNWmp7MnJmrY82?=
 =?us-ascii?Q?4uabhjjVAcOp35/imMDgoExhYHKLDMBF2imjycPpnVaCIrbENv+vYQijYdzP?=
 =?us-ascii?Q?CkLLCJ0CC5d1vJJD4ZA5ieI+viEQUS8h+6KGq1Mz9o2c0SSKy4GvQtMV1U1m?=
 =?us-ascii?Q?x+9wv5HH9k1e670rkyXa+gybay2rVafAOtzK0WgoPYH9Kd1WAoTdUHHinXxX?=
 =?us-ascii?Q?NGF5ZUAf4Yo7vJLaC0bK0/L6B+bPK23vldQMroK1r01FNjygyVpmprfGGv3u?=
 =?us-ascii?Q?ovtPwpaFaobpzGPz8KNYhvyJOocceI6p9uPjXSfuaVQBW/r/m7Ehi0rkulXP?=
 =?us-ascii?Q?V4gg/ildgB2xORLAZC5kBMv1l2YukVm8wAnekmbODf8OQrLFVG+owO3AoJoA?=
 =?us-ascii?Q?hC5J+ZZ08DvP+VGhpf4g4ikZe7tHufZllswZggxYVuMOqAYYX1L3InOdUHRx?=
 =?us-ascii?Q?MSxGsw53CPUhnTOAFqJalhc/ebPoD/ZcFKCnCKTA2mALcE5fvnuLegZtt1Zn?=
 =?us-ascii?Q?PlMBb803fsqs4NGj8qKUkBV40Z19Wtuc6258ulp0TyNWlxndfZQpoCp9Bojs?=
 =?us-ascii?Q?5rF4xevAYYZUFs4nH9Jvqc4bzt4AYw8VMgamrhKH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880285b1-3d48-4e58-8e00-08dd8f344065
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:13.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvvGmpdSEH/gbI637u+sClZYC4YWjqqksnoh+mczNu6Xnek0BngEYavT2BVG8rTb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

Hi David and Oscar,

Can you take a look at Patch 2, which changes how online_pages() set
online pageblock migratetypes? It used to first set all pageblocks to
MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
Let me know if there is any issue with my changes.

Hi Johannes,

Patch 2 now have set_pageblock_migratetype() not accepting
MIGRATE_ISOLATE. I think it makes code better. Thank you for the great
feedback.

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-05-09-01-57 with v3 reverted.

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
to the pageblock flag code, pageblock flag bits are expanded to use 8
and MIGRATE_ISOLATE is moved to use the last bit (bit 7).

It might look like the pageblock flags have doubled the overhead, but in
reality, the overhead is only 1 byte per 2MB/4MB (based on pageblock config),
or 0.0000476 %.

Any comment and/or suggestion is welcome. Thanks.

[1] https://lore.kernel.org/linux-mm/20250214154215.717537-1-ziy@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250507211059.2211628-2-ziy@nvidia.com/


Zi Yan (4):
  mm/page_isolation: make page isolation a standalone bit.
  mm/page_isolation: remove migratetype from
    move_freepages_block_isolate()
  mm/page_isolation: remove migratetype from undo_isolate_page_range()
  mm/page_isolation: remove migratetype parameter from more functions.

 drivers/virtio/virtio_mem.c     |   3 +-
 include/linux/gfp.h             |   6 +-
 include/linux/mmzone.h          |  17 +++--
 include/linux/page-isolation.h  |  33 +++++++--
 include/linux/pageblock-flags.h |   9 ++-
 include/trace/events/kmem.h     |  14 ++--
 mm/cma.c                        |   2 +-
 mm/memory_hotplug.c             |  14 ++--
 mm/page_alloc.c                 | 126 ++++++++++++++++++++++++--------
 mm/page_isolation.c             | 114 +++++++++++++++--------------
 10 files changed, 226 insertions(+), 112 deletions(-)

-- 
2.47.2

