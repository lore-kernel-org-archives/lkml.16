Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7281F8AF8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126344; cv=fail; b=cNUDkGOL5A2Yi3ZOz6bCBNwqmX3bwtJ9JFpClJMkNHHfXotx1fjK9lmtO7W7zXshwQQLB6MeJLLcEyJz0tHZX7c7Nu95sxV5ercjr+Mv3NgQfwHGgoqdPrOuNf4J3rbbdjI1C8KXpk0DCABZIinKw+MpnAxpWX1bB3m0v37/t8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126344; c=relaxed/simple;
	bh=S4e+9XzKlIrvOyINOii8CzkVw85HJlNYfb1g8CE3TNA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pGha40Xk8ikaseVB3tJeLhiKzRbzRSw6skMz1nv6nwDtvra/kfv+Yu9wu7rLCv/G+Xbyq+48lU7mmabokMD1JLk787iI/1S/YfdoMB9kHFgEm5toTdXDSKlVeG6tTmY0cRNXXNmVnsegzgV8MTVLgg3jouHvjCJZQ7XKNMNxBys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PdK+Ye/c; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PdK+Ye/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/Cail8Hw6g5RZ6dPXfVMCkJ7UGSUmt8JlzqIs/p37hXaP/HijZ0YqArwQjI/FJ8meJIKFRJntFTLn28ufXvsdIg4lKZBNRAKolWTXDVOdFJrRezGvtDW1Oas4Mru2blcT/O7Htp2IuaG5BTRUiZaypqoZQ5/Mb6wHJtXAwGbnPKALMthfPwNUaTR2M3X0OMJ2Po4XWcvMHlv/xfNNWJ1devMaAPUmPZV2K/z+TgpLK5LpOj6AF5aqFQh81sFyJ0TW1R1R79VC4tWaPz21KBF03XFj/KBliOce73aqRnf4FuHWYHlCDbqYuCk94N4Wf4MCWnw2/iyC0lkunwAxX96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+0JL0aR9rRnZRzTMB3+7v30NXsFAPoqHbiJEOTBb5c=;
 b=Vag5IMNJ9caD5rka1dAMlOOdfmraLUKgHUDi9nD+AvwTVhqPYPprCmBvszrRBmRJpTvUHIg1iSJFYrad73FVtK+XyNHJuw09X2ytj8LXbwaaISL+F/HXKUcxo9XZ+x8RTH6D5C9raMWZ/qfKa4d3LBaPmvoDTEajwfEAXvG4bRglGAZAjB50QyCgBEeh/ERf4ErifEbJwBgRXOuxao7/ALyxE2qL/UruP7VKt8wWA5Wm2BP9hd8wHG2ONohdbQmlI74UpmqhO9snt/VNZB/fPK79Yx7m6ls5fH9NsN0rUJetgytm2BRuArvmLsKzSOyQmc9nWU7h8tdKgzSdaxBsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+0JL0aR9rRnZRzTMB3+7v30NXsFAPoqHbiJEOTBb5c=;
 b=PdK+Ye/cUK8uQa1WKNiVGhpBnuBTKMU5j1L5ZCpDIQ2CrBMdjjp0ldHK5mKQJN8KyS+KGfsmA8Ym5R5CQcT8KfJ98kblbnpT8YQsQUFMnluyhbt625Ed5QeSNeAZBdmGHMv7z2oILePYsD81J4xcfA0GgQnZ6O7csUVW0udI/ovEXfwpjqcThv+Af+6QQNWSJCHmLcy2YRGo+OMLsbvW/XOcOXYJiQPm3ihgdo9AM7XVQwz4LwjWTQePczMhA/ClZ7x9fzUFTaWXaB3b7gOC2yPW+p003bBzl5Oq2Pzwl7guwKSi1yi8uQXh5Ey0xl4ZL5e2QhxRfLwiVZa3UlviRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 02:12:18 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:12:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
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
Subject: [PATCH v10 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Mon, 16 Jun 2025 22:11:08 -0400
Message-ID: <20250617021115.2331563-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0699.namprd03.prod.outlook.com
 (2603:10b6:408:ef::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ac10c4-fb95-4017-d8cf-08ddad4462b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bL5jOnQ/40vVIEye+LuyJ06TuHat/Lvqcc6NaHwgeV9ZwPpdlSOIhOQOeT3c?=
 =?us-ascii?Q?Ij7uNNaKRaNdrobe0njd5/uQpx5qL6YOg8qBrYxVyipSo1LYIX2v+TgQG00O?=
 =?us-ascii?Q?SC0z5EjciGtb1k/1UmMUvk4FoeSwzTTYtsZ9yJE1vJPFZONQgZHza36RjfeJ?=
 =?us-ascii?Q?pX0IZrnqFCiHibzKeNUqJCysCDQ0elCMuk39zQA9VhEyGntdvFTVtzyiNOHD?=
 =?us-ascii?Q?+DJrMta4QiIMA5PYApGkhbcMBu/n4n+oTsdRjUoMDFAs1oLvXgLOszKdq5Sr?=
 =?us-ascii?Q?/B/F5cB0sKIyVI84/AdFm9uEiVLnbdZDu0ZqQGdWNotcpzqiKr+D04QugqV6?=
 =?us-ascii?Q?AmxwzHhcB6KJgZRnJpMno+0I8ahmj0tE9Sdb0EQNyEshzevZv/ZWbUFa2LvO?=
 =?us-ascii?Q?sSZr1hLEiGxgoAkNUTCHcbfg/pZigaHYgXhVuEshbzD4Vq9k63wDTTpGFgEO?=
 =?us-ascii?Q?M76cTrN3MSWv/Lpp9W9Hyy/nVWzMXow6m8ug6J3S/pCA4uQf7R+Ge+NdpAAK?=
 =?us-ascii?Q?9LiI92KMzBnbMoJVULUgNH3QdCbuGcenWt/RdAgFQErvRzGVA73Nk5kx5s8j?=
 =?us-ascii?Q?eskMBrrl7Wit3HuoYRPAChhOtI/1GkUIxnelvm+1XfwV2vOxDh2Mxvs/8nE6?=
 =?us-ascii?Q?0vA6TINqS4VsClamLtD4Klbv6p0cj4Mu6sZieMQRxzMZOkO6esHd8hyuAjdn?=
 =?us-ascii?Q?MtYusshW4wyJUJ5TVPSWbpdxHeCD9wBAddmJ8oq73NFvHOTINq6D0cIgJGdz?=
 =?us-ascii?Q?2FWwW8CvzRi38mc7ysveHxFgm5cA9/Yohbz5/6rcs99fzlEgoRgx/7JI47I0?=
 =?us-ascii?Q?6EHJCnqvDfSdwPEe2/Yj2gt4OvgEmwZBFojBapbWG0AjFILsAvUWEGcXJg8y?=
 =?us-ascii?Q?qPT7Bameqslp6auCzh1M+ccvTDLMtvAP3NMmyiL94tT0i4jdaA9tB8JA+CJ5?=
 =?us-ascii?Q?EIU8aHm5GW7GIGsRXLHoKYotavTaKIuUQXnQdXRAaN6U9r8y83/kASC3Dwua?=
 =?us-ascii?Q?0+sSAzjPuYE0Ibb5ff/GIkVV9XLcCHuYofjRC6Vox5PWujQPaLf6lflIezbn?=
 =?us-ascii?Q?dIrtPm5pXdbtgJtsezCBEU9HZsizkdFNM3wK7nHB/R1gOPuaFVB+KGqXONVw?=
 =?us-ascii?Q?HQMsYDqgy3StJAr2yRHehmDbk1ZlDwj4PMgGtr5jvnGubSYDnu3CWNE07y/e?=
 =?us-ascii?Q?RTZxmMB8WdvfgctwCs6gJJ/A+LD1bwKzlXoH+hM/cQ2JEvdDsR0WU1WhA5ap?=
 =?us-ascii?Q?a+cdax0Y8Ro6AHvxRLOncenDSwoZe421HNnGyp5tf+yktGp6sNrd2Dx/gtFQ?=
 =?us-ascii?Q?VaHD/X83BF+Osc+X+nPXqJLO91N7rRxBieYjPGjVZDMHXn+8tSGVhXi66+Hk?=
 =?us-ascii?Q?yRNYTVnjMXCK1iWgd75SWFZmgrzuZdwWhYRWnbfRW8ZfChoklUyar3ZVBh8L?=
 =?us-ascii?Q?YEWOCL+gqFg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2j7HzXNQEsjS1Y2P+w+i1t8VNw/Bmr7BhpwUq8Yt+TL6T6CjMjYOfkNsMfY7?=
 =?us-ascii?Q?/cXwyW02YXmKgQp2xxJGY1ChAxFlfWgJV0d7nCe2EKpVt8wwU2TrAdZz4BXZ?=
 =?us-ascii?Q?EiQtotNt48unUTo3gnFsvdIBHcbY1XLOS8BGeyfnv1lGRLvqy3MNC2aK4VLV?=
 =?us-ascii?Q?0pbHxmoahrn0MA630rC/Xs+dAU1hzSDOpI1Pcmd7ic6hHw2EKJNlgNLeFZIp?=
 =?us-ascii?Q?V70YeE9Hx8vssZol0f7gYG1E0WXKDVpUsZceYBaXUZEWGSDZ+EvSNCVSRK5u?=
 =?us-ascii?Q?ytR5FvX/IYw77aZnEjpm+rOxQepzfWlpobczKLzK1eSRKWOvu189MsWMAqv7?=
 =?us-ascii?Q?lFSfYMRa6Tppz7c1LmaCMqDCIdnVluqXi6URsYJKo2m533LquShX+kCqeDXb?=
 =?us-ascii?Q?gfFGwmFSP5nyNz3y6JVnM8OSzCJ5t2jts12stPnrG77xRK7YkA8t3iVpglVD?=
 =?us-ascii?Q?KIZR/Tm9f5j5u8toEZ83gy0mV9bTbqAiHVsdRqVqJ12/RXebW2t5KxD/tf3L?=
 =?us-ascii?Q?rUQQor0Fhu/cKN+MSj246mfyjYyfvBsptC5pnJV5yFighpQdWpcq0+3lbCT0?=
 =?us-ascii?Q?zdA6OFwoON/iOps4XkwrM9FDFBWuDp5y/CSS5Y/yO2Mg0aSciGMnCjF/qpA4?=
 =?us-ascii?Q?/kuoM89MZmpiRkZDo3jdW1emvs9qAwFI5aJer/se71kimllpUZ3oYhp6cTNW?=
 =?us-ascii?Q?J2B0jcJv/2DZSrj2mYv+oX2CKIOen7MY65AvdMKJ4lY3pjz4N1tqbFyb9qsF?=
 =?us-ascii?Q?86tBaushTxzsunAARaFfzXKBWUFk8EJPY2iI7aro1juaTTR9uS7TPvoKFTu9?=
 =?us-ascii?Q?KwBUpjDaT+Q8G3o51N5QxTO0QjdhHIMtn4Jnk8DLSf+KPFIzufyPIpqKIrRT?=
 =?us-ascii?Q?rDrehV7jL6bp8Pwq+24RX2cUcCwUVrRvaxf7W3TjelAsWGOpeFiemcmGDBHa?=
 =?us-ascii?Q?mQBn/AutnE0wBiSsiyqb5VMjjDX6jIvCwmXgAJhLIm0WZqZM3RrjoMGKROxe?=
 =?us-ascii?Q?jugF7+wPvKavw0gahvEXtctSPIOQ+RlrILig6G583yX/c32gDXPnS3Ge6HdU?=
 =?us-ascii?Q?rrxskh1r9UCZ8IoVjeVGWEYtJzl+vNGOi16/C60PYJuPr1LBq+6YEV1QumYy?=
 =?us-ascii?Q?o2sQxxFWHHpjTXM72rlDR/z09ftzdOLYT9ZpcSdARaO+i6demsjAJzSDeMSs?=
 =?us-ascii?Q?6KjVic3ix9NW5oHxp6j/tMS83q/6ZznUvbqLMJbw+PB5uE9Js8uKwcrsaQJU?=
 =?us-ascii?Q?y9mCk4CVp1AXX/AUFgBL2SPl4Cum3gyGxJw4OUE/KNcbQf3gsKPXITl4zHui?=
 =?us-ascii?Q?of3lFtlz0uXnsnMkphFJbVrxYfOjs6woMJEyf9v6G/qunYD5udI6qI67bOKo?=
 =?us-ascii?Q?8VaqdIqbM8/RZtXyzp0RR2Q2WqQQ+qE+SOFvDVJBPg0jf+8VC7Ps8ZucnbQL?=
 =?us-ascii?Q?RYxsYQbM9zBkcn2Zcvd7vnc80vliCt8WwXYCAZTy9u6LOiCSyOaigeWJs1S3?=
 =?us-ascii?Q?3BJmvwvkdsR05f5VYOu3P5EJRIwCu0kEhz1HPDJEzlnmNSqoQulEI7IJG50a?=
 =?us-ascii?Q?VFouImqeiPRHZsw11cejV+iLdSwnwSz97umKpIe6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ac10c4-fb95-4017-d8cf-08ddad4462b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:12:18.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1cEXznd4VINuRj/xVBDJQMG72AODFH4X5p1T/DW/RDVEraWEJBAAOb4zId67GWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-new.

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
From V9[8]:
1. changed acr_flags_t item prefix from ACR_ to ACR_FLAGS_ to avoid
   conflicting with drm/msm hdmi_acr_cts enum.
2. converted kexec_handover to use init_pageblock_migratetype() too.

From V8[7]:
1. made init_pageblock_migratetype() set right migratetype, when
   page_group_by_mobility_disabled is 1.

From V7[6]:
1. restored acr_flags_t and renamed ACR_OTHER to ACR_NONE

From V6[5]:
1. used MIGRATETYPE_AND_ISO_MASK in init_pageblock_migratetype() too.
2. fixed an indentation issue in Patch 3.
3. removed acr_flags_t and used enum pb_isolate_mode instead in
   alloc_contig_range().
4. collected review tags.

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
[5] https://lore.kernel.org/linux-mm/20250530162227.715551-1-ziy@nvidia.com/
[6] https://lore.kernel.org/linux-mm/20250602151807.987731-1-ziy@nvidia.com/
[7] https://lore.kernel.org/linux-mm/20250602235247.1219983-1-ziy@nvidia.com/

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
 include/linux/gfp.h                  |   7 +-
 include/linux/memory_hotplug.h       |   3 +-
 include/linux/mmzone.h               |  21 +-
 include/linux/page-isolation.h       |  47 +++-
 include/linux/pageblock-flags.h      |  48 ++--
 include/trace/events/kmem.h          |  14 +-
 kernel/kexec_handover.c              |   4 +-
 mm/cma.c                             |   2 +-
 mm/hugetlb.c                         |   4 +-
 mm/internal.h                        |   3 +-
 mm/memory_hotplug.c                  |  24 +-
 mm/memremap.c                        |   2 +-
 mm/mm_init.c                         |  24 +-
 mm/page_alloc.c                      | 321 +++++++++++++++++++++------
 mm/page_isolation.c                  | 100 ++++-----
 17 files changed, 435 insertions(+), 193 deletions(-)

-- 
2.47.2

