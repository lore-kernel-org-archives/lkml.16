Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111129B220
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027601; cv=fail; b=ZSthuw6fS1Qn0nXocoW0n3W8O7EYgEfrfohPJbzixvCQFewa+KFkt/uWQS52o1qJg5rH8knO+uoeapc3zkGsEKOknLYW69oIvd/Rdq6poLvJgykAToP/CneuGvcuosHgfP1pY8M53o2uJRIPS1D5MdyTab8dopDIpE4Pxjvfbng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027601; c=relaxed/simple;
	bh=AXW3t8HrUVLO74lCpMKALMJzYYGm48p9Z/7/8BsK8Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IeQVlGuB/LDnzKLWnWBYqzOH5qeEuB/ws6D3K4ftbWTr9ce0ToRQ0/rG6WzqGulWHfGpY2twbpZvTn44sLtoVndRGv1tPCkXeIUby80aeCIpiBLLxWqf7ti12ABs6en3gWGJl+7yelRgNCA+LtBL8oDB3q8EtsKDeRDnwvkRLx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mhM0Hhk8; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mhM0Hhk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q247VA/coI6VzBxZb266v1+dS6iwe71FNYyY05XUIYcI7QifhS8/lZEUs+o7zmd7E43t3pNxKIywikw1m+wNEtaaFtWHSnq/m46AtswrYbpWaS6VGYwAHMtoZawDaHL/seYxrIwCLOsLtN6PT5RRbfw6jnfLchzjy5cIQu5hppwnLb+bSsG5UcxJX8h1bfcdnA9Vs+1kF/63NlbqTg2pQUoiZYm134UOoeqZnLJgAOuCMbMi8ybuwBYAwQHabwuRHn3NloH+M/rE42h77ff9FNUI1viFIGVrYPsGwm6L75Mmg9/k5YQcQ8ZX+Z17Zh0T/WKDSYNhoKflvmIO3Cso5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN/aE0w5v85ppHN/SUkSnCBU5kL1XpJQ9SQ7sqgt1eg=;
 b=cZRPaQUB75lTCZFYuj4Zot5lfQHmTY7o41cCU4MA2zqKCjBzAvW9vdWWLtq3PugS7Vm0q1dJRURP9dyPYrLae+6xoyLlaoqc9ya6dSZIN8sx+MH9ZzOdZ/0JS58kDHOHnSed3Fykysa8FdNHsEtPptPhvTi6ApCQhvtmHBDcCWH8ovEJ+JEwCYXto90/m6X/6jaERbN6Fb9Nv9aLaVAIBSL94WXwndc+eClwE5zZkAryVjean594WGOnfd7DK+60TqJoNTJEvwaonMuTl91z5GcxoytVvkZLC9g5hVCWuTCoYSE2gzGuyYCguBScKhdm7sT1T6WPvlF99k5/k/fHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN/aE0w5v85ppHN/SUkSnCBU5kL1XpJQ9SQ7sqgt1eg=;
 b=mhM0Hhk8D1JRxASBsqNeUQxo4iIbU4ps+1QopAqiT/aqKciA3kTZOl2hzkYXLeDlKZiIEmCPMFsqIoSnT76sixRSkndisPtPjyy2s8qBHBEdJldVPfdXIKbzJEz7M8Bky+zdsEdfXKy12VtUhpakt/DjU6uoKq/JJP6rEfcvWVWw1gJL2WB/jl2Gz5knJm2MKrK2ORHEf4H8OHn+QuFm0i7irfr0u6rXUMeAF1N7Yx9jHhD3Z2W0Or1qzT0KHnXqgmMcyWmsmi8V3vN2BtQXv+/fB4OgX+VW5pnBnaMUUSLqNLneeYiz7WetiGGomWSJPKQv35pF+rsnsrb3+OrCLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:15 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
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
Subject: [PATCH v5 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Fri, 23 May 2025 15:12:52 -0400
Message-ID: <20250523191258.339826-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:256::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a652da8-af14-49cc-0ea9-08dd9a2dddfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HOci2cAoX2VXVvSCq/gMO7+xlBwxsyFQiAsyF5foPkHDJ4WHSUEDTR1yb7ao?=
 =?us-ascii?Q?CyhJC0HawKheEeDq3yqeSrgJf2BrVw0SjwglvL21YMkxYc28get1/xlrQ50U?=
 =?us-ascii?Q?hKX8m8rDjrs5Y/NikR8LaU4Orj0f/J3DgvGwgSHU8etcLo3/8nCEqkgpBwKz?=
 =?us-ascii?Q?SYS86vG09jzqd6fk9aa9MlS7rUfOp/ey1OZDCYLLXraKktwKIsj2Wbd1Ey6N?=
 =?us-ascii?Q?hbEV8styUFwi4sEZ4f0qbxlF5QDporUMBKFRJ2xshuPJPvIE5Ps1KIlLG7am?=
 =?us-ascii?Q?oKMTQhReRcy7jLAu2AIXiiYuZ+8AK58fZ7zcvCZRecq7GHMqXz+hoFxSRpwU?=
 =?us-ascii?Q?874ayZaFROsN70FTgluCKnW6cJhQ9RXxks3/Gm+JRWCPsp/DAjt01VhTzwEq?=
 =?us-ascii?Q?zDRiKraMcXvxRRQo1Ywfu8wRb+xclCwYwi8Cn3SlkqkO8cAxgPvsvKeDmPm5?=
 =?us-ascii?Q?e5Qda5rdsDJ1thpnokktKIcnQPxhAUdmwxTGR43VPtEUhdk6KV/yGnRCnJlz?=
 =?us-ascii?Q?z7psRYcSZx1i0E5dgcFF79UUJrGsl2dfe7RLruf2dlgIiSdKJHayVc2qvoP3?=
 =?us-ascii?Q?vwcmiVOly7hq+RRNkEted42pB92G5DpPh1QYEGkEwU6+vxyHTCYscIrS20WJ?=
 =?us-ascii?Q?6kpYXTVx9UYqeypo4Xi1vxM7YXVPhk1hsaHwasOCDIh2n9X9Ow9bGzlzWTuZ?=
 =?us-ascii?Q?dBeyJpRbAd4fj9LDamSNevycbmKXEF8fPIh7O7cJIS2RIVCyptddNKLaZRN9?=
 =?us-ascii?Q?E5ix7lVFqNGozrb3awamH6UyXiHyTmeZ/vKydb8i1a2PDIiCeqinykidIllU?=
 =?us-ascii?Q?4aHx3y5tpRc3lh1Qpu+hkHmQzYCr+HPZQsvHhtI1/smWPOuLEXYgN4DD2Dsm?=
 =?us-ascii?Q?7tgnPgrasmzLNqSeihSOWaTDWRVhBihWJj9PgUHPyS3ehPatSv4KrCp7f4jb?=
 =?us-ascii?Q?dEZTcz+MMUtGl6QXknoTxXrtn4YANV1hBm62r7nm3ZP2SK+ZwMk7C8Eaepc9?=
 =?us-ascii?Q?0J9AV+vwHze5lk1gKDesZ2bwzSpkaCAUDIKmBBgkry7BfJZAKiVNRcGX5JpC?=
 =?us-ascii?Q?ZUJNceLhDL4PdCFdszR/FsLPFfi66qC5lxFa6d/+VYvtGyM6yxqwHvR72xft?=
 =?us-ascii?Q?P5RgRDCmcyjrqWPtIkKO+ym9jeEYjro1qeDkeKJB+4SoAAv7qhtnO46eEl9O?=
 =?us-ascii?Q?Ok25lkzRjlqqGnvGW7xHTVZYgKCX3BydZw1+/zW0ktDGElXG2caan8OuY4xl?=
 =?us-ascii?Q?Itj5y5/xWKZesvRU/Ip6+IE3eSZnD0eBAD5qdddgrcBhN1XkxMfer+nn+8yu?=
 =?us-ascii?Q?XWjKLdr5D4REDdTjZgS7LiVe+jmbWzUjpepqXVEYe1O4fbrdBQns1F0M9j62?=
 =?us-ascii?Q?ZzAo00fVy1xkHUjb8tDEQhfU1QZdwZt4Y5cqhTC7qlVJO2aGABsCBZeyW+HW?=
 =?us-ascii?Q?5tSsVFnJ2e8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rDpHH7A+m/j/Lk+w+NOwdkuaMZFfSh5I/cYKnwmt2Ug94N7FXvUcjk8IPSCE?=
 =?us-ascii?Q?xXUxSYi4KIvaBfPpIYAhHNJBFxlxH3h/2oR4D/yldY0MtfFGZNegJDPgRI6c?=
 =?us-ascii?Q?QREvOT7kh0vmdtwM2MNp6rI+ne6AVp1B8lPtslKz5aqTdUTzu/krCBXgTW0a?=
 =?us-ascii?Q?pd1PzUeEnx3WigCSto/2LrStaOlKiK52DJlyqINcRKY4oyofJzm8GxjeldFT?=
 =?us-ascii?Q?f5rAvJdgpCUSEEENp9rVzGsuwBARjD4m4yqER4IU0zW4H0D5Fb1AHE+ZPdeU?=
 =?us-ascii?Q?Qn7qsuGsgWG6tOF/QKslHAtbzlAriyEG0pjZyLSWCiGGgAsVr+7hmtxzbfsq?=
 =?us-ascii?Q?wDQSOqCRzGawXz1qw7Q//69VtZLXlgKjIMgnizzcz3fio4YFgscegOnO0COO?=
 =?us-ascii?Q?XnYl439Pukl/JY/KymscFklMmkJKnZMDNqZKz6/RbD9nK6p+gEEFDQu+FRg1?=
 =?us-ascii?Q?SV5S+yitUiBILEE7nwjpfwfUpItGMZeftpQoJXuownPUSXez2zpqkVIXcvVm?=
 =?us-ascii?Q?pi6S4gk5SCBW6ysAhDbfQezyhKJiRpB0GZzsBRyDlUppi37cDT4iSjSmoWN6?=
 =?us-ascii?Q?V9nmAZnlJT57mdpcGIrdGYuUCRQ2xXSJ9jPyN8C7DdTtZu3wEQo0kmEvw4C+?=
 =?us-ascii?Q?nqjvdEfdqYAudd2xNvOpBCbVtnhYHR0j5We6KnX4qbMZjcUvExvNAOg8+FUI?=
 =?us-ascii?Q?R3/G2OzzSCOHSGa8s0uXqYa26QLEUz/wB+oF9EFXKVzQXqPc7CiAr4MiCyxT?=
 =?us-ascii?Q?TeuHUvc1ylDm5nZonckfqCxRA27ircse8nLZiJXFDAbB+gTKkruBdpsmkOFO?=
 =?us-ascii?Q?Qbh8GWQ6I8NOFgkXLxArPaHvSHzoC7ENBpfq7poojpkXjXly5cjymB+2Xgmw?=
 =?us-ascii?Q?sFJhMmxQ3NSqKQevkyNEf7oyp/mpgknPwI+h6FH7iOJ/KwVAZXDRgggOb924?=
 =?us-ascii?Q?uxB+1pBK/3tVcIK/IJHjqVoDPR3yfaT7J2q09jC4YgenMdvuXvLMrPoF+D8W?=
 =?us-ascii?Q?LCI4x056B1q+I1auh2CMVtrNP5rTlVnccXj42XEdNWyea+1J3uLQIZyVd/7u?=
 =?us-ascii?Q?xMv2Qaogw+iiVmURj2hRvya/iRzsfLc2vOSRgGEB4v7TuvljT9HNt9YvVHmk?=
 =?us-ascii?Q?zbIN0lNUuayGaInv2Gk/rJv5utT0RMD2+uxW8+WxH9yVI33VihOrP2ocO49N?=
 =?us-ascii?Q?/1rI1ezxO1AGagz2QN2PFlr/HB7NcidqnfYaLWI60T9xYjQ7piGRKxnQ4RV3?=
 =?us-ascii?Q?ApTD2hImbbxqM/BPI4bwbXsQYwErAN2y13YtilEKhZ7xX8B+kWUN3NcmDPM2?=
 =?us-ascii?Q?sARzOjUhNMzQcBi+5r3tF1r0gUqiC5xP4cwjAYS5KIa8/U6x2Az3Zy5zvmjc?=
 =?us-ascii?Q?6yzlFlsZYHSY/QmVUUwPFclNdlla8hujNM7qPSQtwe5kp9d+ZplWvrH2KFm6?=
 =?us-ascii?Q?628QO+RoZnD7pyR3wGMgBy36LIcsZJaxpWM9Htf07R5Nwdrrb2ZuTPgmirYH?=
 =?us-ascii?Q?WgG5Tyx1DqB8ZziyxHqpNoK5nvg3aSEJ5gb8MG8rh147mL0/v8uhJrJ6ZsNR?=
 =?us-ascii?Q?pEYs0NUzuzivZY5TxdtYnFaSA5Z4nzRIYSceSR0F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a652da8-af14-49cc-0ea9-08dd9a2dddfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:14.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1HqejreWx9xumuUjj5uUn1cY/4TzpnyVG7NBDnA9CQTkT4agOUVm4SUktEtg6KQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

Hi David,

I tried to get rid of pfnblock mask by replacing
{get,set}_pfnblock_flags_mask() with {get,set}_pfnblock_migratetype(),
but get_pfnblock_migratetype() will need to do both test_bit() for
MIGRATE_ISOLATE and try_cmpxchg() for other migratetype, which doubles
its cost. So I made {get,set}_pfnblock_flags_mask() internal and use
them in {get,set}_pfnblock_migratetype(). Let me know your thoughts.

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-05-22-02-14.

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

Zi Yan (6):
  mm/page_alloc: pageblock flags functions clean up.
  mm/page_isolation: make page isolation a standalone bit.
  mm/page_alloc: add support for initializing pageblock as isolated.
  mm/page_isolation: remove migratetype from
    move_freepages_block_isolate()
  mm/page_isolation: remove migratetype from undo_isolate_page_range()
  mm/page_isolation: remove migratetype parameter from more functions.

 drivers/virtio/virtio_mem.c     |   3 +-
 include/linux/gfp.h             |   6 +-
 include/linux/memory_hotplug.h  |   3 +-
 include/linux/mmzone.h          |  18 +-
 include/linux/page-isolation.h  |  46 ++++-
 include/linux/pageblock-flags.h |  45 +++--
 include/trace/events/kmem.h     |  14 +-
 mm/cma.c                        |   2 +-
 mm/hugetlb.c                    |   4 +-
 mm/internal.h                   |   3 +-
 mm/memory_hotplug.c             |  22 +-
 mm/memremap.c                   |   2 +-
 mm/mm_init.c                    |  24 ++-
 mm/page_alloc.c                 | 342 +++++++++++++++++++++++++-------
 mm/page_isolation.c             |  97 ++++-----
 15 files changed, 441 insertions(+), 190 deletions(-)

-- 
2.47.2

