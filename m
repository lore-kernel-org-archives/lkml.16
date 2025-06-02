Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1251E885A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908380; cv=fail; b=SgQrSfwevgLyFZwIMPnj1sXPRHa8kLoC/3H2bMCpGOoy936tnx9ALhl6CgipgBMZGzLHDHRhqb0kRfx7Xu079yPTdqPLHuXUrZAtt5y/jRttXW0FqP8CmbqIkByksvdC9WPvOsygjEMzj3IJ48s3+Yy4DE8FmJ+rTFjhIob0a9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908380; c=relaxed/simple;
	bh=Fno/BZWmHpWrNOyVlOwETdAaYCJR+AFvOlF4AaUh0c4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SlbeM4bJnTYH+bGkSSzw9Bj0Gd3HSWX77KCxLGAGw3tQgVPb7IqEwBLinOSKwIRGxc7GPsrepYfx/dwjA0S113ByNUgMTkIlP6kn9AB2cNGolPEQiqGfgEAI42sJ4wsKzZbPZfYsLJYA0Vp7yfAm/7vh9crE2fLfGUtdfvjkB2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fsCZXPsn; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fsCZXPsn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGrxFu2kyXJ5qkEccFXSwZujErk+7Zc4chVEgoT2U9QXzuJhUvTYifpbWHUrAxxWfTbIFONXfzzrKdRfkbLiAsmp1dCak83w/OoTi2RvpYXHSGsenXkAFgDW7R4svmqeW5SCnX2PSjxgk90/qjcwYtHDvXpXTFU79eWC/vMVyWzADAwQaLg5jo7f216Nf+XZMPByOLBj2ydKlXWiVrFlfjQ25dPyF0Zrud0JXk6aBNK7DA/sNsz2tP430Yoh1C12cCogaTAaXeuk+VrPqiM0MS7Pl7gskx5MHKM8Ly8PyuNJRBn6rPvIYrufoe82xN+L9dodKtiSTx/hxUM+uKrgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgsEjmwwMImf6QR1tTqUE/izEhq+l6WyYsoU186jqbw=;
 b=ChoR3DAbrpd67gEDRzho3jd4KmGAKYlB4m/hkiUvx1zjd3IBLUVFcQNYf7qH89Sm1zB0cmaqaKoTH9HrVYyqLGe5mtgYKaavFR5TlqRT4G3nf7UIE/ZTVDtKoxzE6x9RRkBcztes57to8olCYNc3gj1KPOqROOaSBBkj+Cg2KzyhDbd/4ysousBdCMNAZF6GfIIKIKmfWwxr1nq6yISgbAacqQYUY8UjR12sxGrjww94GSIPdffdQJHeFhgl5QZmkRHZF+MAAg34OJRnY61UPUsFrM9I1DcWkywGuMNnk2yzRzmUIz5BeuNCz2fEId+D3ZWXw0/OsnKJXaJY236Fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgsEjmwwMImf6QR1tTqUE/izEhq+l6WyYsoU186jqbw=;
 b=fsCZXPsncfMlxaqcmMtl9cp1jjvQmV1L7xhyu28d0XMQyLwsYOngbIknBsJ1JNQAZlsLvJWFIIgnHrFq9+iVrVDba/pxOenmgIyepXyqld+WyNDsB99AD+t4udQoLQFNUhZWvaSj91Dysg4pi132cnnBFE3NrDISNvduILYAakw7+/ppAP2GzcWszXjjR/5S3uOJC+Z281P2gpOgtDIyx+QN1Jhi4+eIyWzUNqlzRwwSBB9Jiy+i/gFrSEFVckGCHjsRujoSXFxsnAGIEGMZ9qArgVBFhrZNZcV14Y86mU3PnQNbsqbMT69NzZ0VNrd93+nP1DnMWnhjf0UIdDaNFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:52:54 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:52:54 +0000
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
Subject: [PATCH v8 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Mon,  2 Jun 2025 19:52:41 -0400
Message-ID: <20250602235247.1219983-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f16cee-a302-4ea5-5c6b-08dda23097cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/reag0yw+OKTTrStrAYA/hr5VfCBlMS4PwWLAvkqP6+hS3KSwIgW2ByK14F?=
 =?us-ascii?Q?N8F47bobprWwi0p0tOyg7xntGDCxu/Ggo1q0Jtc0EAx/gJ6xChmn1d4hO75C?=
 =?us-ascii?Q?2dAJ2R6hfjUDSnne3pZqBVA2mUIH6b5JiFbyzCplhF5OChnmxh4Y6bVvqR7M?=
 =?us-ascii?Q?KMMVZn+1ZsEHSpEaFBIXrty2yVbdAJS6La332uB9HL602YbduUp3iVajpEju?=
 =?us-ascii?Q?W+jaaIDKjEm8cVdP3pSXKAspR84LKj+6iPvMNtHuFSRWDMHnlrmtU6uqWYSN?=
 =?us-ascii?Q?C/Ejwwc8ddoVJIlQR4IxihnXIFqMyCzmTqC2kv8gAY1z7ppCHq3dcW7CU+Zs?=
 =?us-ascii?Q?8Mv2ArrAxXGJinpPvx5ZEpbf64jyI+NizX5iaFe42o9CHM6RXPr2ke1/E45F?=
 =?us-ascii?Q?ZW1PQ2Wk7hdsVsdodDPC/aejcTR1iQGpZTflCs4FNUckyBqn4nB1qJ5YCnB1?=
 =?us-ascii?Q?ECB1w4qwrbjPR4uxkX3WIGJvMbBZvMa6d2hIZc8c4vZS4TdF1KP38n0wKT44?=
 =?us-ascii?Q?lVLr/UpqHHwdVg7SHu5nYTp2t7T820SS7hg/BoXFLWx5LM6VS2fBejtHmG4N?=
 =?us-ascii?Q?yBmF/sjU5acFYxo8FN89K7JXUMirOHf1spomQUdICH9S2udSRx7m2T+tU5ZI?=
 =?us-ascii?Q?VwiiaFcnl1N8icZVEjGgeVWX5VRFJ5sR24OdY4kanr7Ju44u6jaerZWAE8Z3?=
 =?us-ascii?Q?DViFYOpHHAJ4Fv5W3agxvjKGSifuxkuXi8hR0QF12bV6t0rE5Tm0HBaTcyfV?=
 =?us-ascii?Q?zEP4pIToRjhFFv+vfDQKzJm8dIFCfbWEQ5Z7/AQGp9zev/aEB+8qSRbD9iw7?=
 =?us-ascii?Q?fANjIZ3nLGx6Xahq4jzIKJn4Pz4k1brx2flYHBI4ApBzaH0xu3N8qXsWDtG+?=
 =?us-ascii?Q?l3HtAOVBrPG+W5hNLZQdtHFm1W2zZqzwv40WZ9I47OpBUKbTE8BvNA3i10ZG?=
 =?us-ascii?Q?DljXs0xfoz27NmbdTX/Lr3f2Z/OxG1q312/ZZTRGgchPLkBTzWNkE2z4yok1?=
 =?us-ascii?Q?OjoO31zyvvY2Rhk5f7lBrVYnXChxuLNWIIkPYESya9iYEspzpGtFqBp9XF9h?=
 =?us-ascii?Q?B16FK0sqyl8uz6qr3GhCA6lNzHKODA6EC7jGjFQnwF6MaR1ZCOUOyBHnZF2f?=
 =?us-ascii?Q?AmKM2U3g/bHrmBx1mKFrdeh7QtkMs0yXCPOb9bcXIgConCBYJwUEo6weXnSG?=
 =?us-ascii?Q?UO2v3rf97n3QAwaJHI79nQ+cQMTM+Xaqng10QQUjGBL8uK9RcytJy/VDxRC3?=
 =?us-ascii?Q?0hVouMf7/wx9zeaHtw0mD0OD6rMU7fLYsXQB8lUTjbqijBL8RspwevJgLiXK?=
 =?us-ascii?Q?QmQ86RUlQOiQ2fiUgH23pFZgy02Ba1ZwGPD2NBfAVw1URJF2JiNXk4fFSt3C?=
 =?us-ascii?Q?VBjxcU7UhhSoKXIyKEjyBxfREnV10it3U04WncqLzlj+e5Mx1in782aDnFmR?=
 =?us-ascii?Q?aE3C7MApiTtqA6slvYfJWLhq7h2WhaOi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ca79HbIUQ4AzkSper+ZJ+ZDYeGXU2cGI/bTPlFqnfcBzI/wP1K7HLzJ5fMrM?=
 =?us-ascii?Q?+v/Kz6lVwgjofMqurX/tOkirPOBJT2hdSGHP9dPPelYM8GloiDFGG4fvYmb3?=
 =?us-ascii?Q?YtRt81h/TwFoG7Neg8OPs0+o9RqQ1UsYhj2lfvLeyDHzJACGR148pLpI/rfR?=
 =?us-ascii?Q?lW+nHBY4ocQ+PKTX0A5I+wnOsXGeZNdGhvMTSZK8cgCl9wRbW3oUk8TzxAts?=
 =?us-ascii?Q?eStnbreDfuJ2gDTu5Hm/8ApAgQYqiS0gn0X4FfsycjWwI0CuBE+pVnKw3QLr?=
 =?us-ascii?Q?+bRmQjHMIfz72dC+/xbnSMd0mmG9YpyLmNibekTYnKTkVIwmFU+0goTuxLrE?=
 =?us-ascii?Q?a0912IjEfGSRFIO9V8V+0c6u7h6W3HNerX5Es7HSbBwczXS1rM5JAFiwkgoC?=
 =?us-ascii?Q?tvaAIwLz7hemKUq96QRoUki1glRYweYEleroiY6XE2NtgBaxNLRI/D6xbJl9?=
 =?us-ascii?Q?fsXsV38zc1TOpwdJFPc/ZkR1W0JoHY8NGytkVPhRopn+Gv1xUVfVTfv+U3Fv?=
 =?us-ascii?Q?CtoHU0P+kfSttgTs/T2dY4vo0B3221YneKVLulAy/gY6VkrcN7MboMVkl3zE?=
 =?us-ascii?Q?sHgdCZbshlforYaVjpyUtQBTjSX5ujjQXS7g5LLF2ebdO0pFEAQavONg9WwD?=
 =?us-ascii?Q?4yfjY2MH/27+KnRKycgIDzHdWOkd0EZoppWGGmR8cy4tyfvMArSM1dGr/QwC?=
 =?us-ascii?Q?5ZlJSnkbK7zwFHw94xb3EOYtcHD4tW7ul8c2uXa8mhUHcEqq7eOZeIl09YRT?=
 =?us-ascii?Q?BXj72xaoSIasd7cFX6iAd6po2drNjE6theK/hSe/nDFMJoxl+JPzh+kyZ+Tz?=
 =?us-ascii?Q?xaJ2SE/fCvc4tUOAgCKZ+xLbR/cssvkAt4EvIab2nK7u5YrjlihmhBq8Tc1M?=
 =?us-ascii?Q?UDApbKTEv/5J1xll48L+/kcc1idwkgSYUvORX7LAptnEIlnKXaNIboex9sv5?=
 =?us-ascii?Q?id+L5PGlzJ0fIgDbCvpFBgBFKa/f1cwp+ty8nLjOF61UvHRFY2/mkHDxqJ7Q?=
 =?us-ascii?Q?RHjH1i3YaC+i7rFt68MCOKh+sV5DkmexmzP6FrSAZFOVGwuUW2JUZXH2qjn6?=
 =?us-ascii?Q?Lj4YFJPDkrO5cxhFCnLO9tUoxrayhqWCPhsaTOG5fvzG9wJNqcQ7ZUBxuXXp?=
 =?us-ascii?Q?eV4jgGmxTPKUPRM16Eq7ZkNhnbuVV3+f7pb14YtObT+Oopyl8uXDlKPORYDD?=
 =?us-ascii?Q?3mimcs5ELEXJ3fN5LCS3CprwVj+choArE7pHsMaP2G0wcgbxMrX+hVJSc4rw?=
 =?us-ascii?Q?TFnFFQNnoZ+KLmwmMcJw3ljcLF6zHrSg/fQTTcolwaaXbRDk0/rq2ATUhdrM?=
 =?us-ascii?Q?6huKCATptngaaqfL7om0CG8geT4hSx8rdpKX1VVEtQtq/+3/TwIvdj2zzsfw?=
 =?us-ascii?Q?2a7mw8mrU8vAVFsgN7S4vIetWEige5X3ch/ktCVSyusR2H8uquXf/OJJt1HE?=
 =?us-ascii?Q?1dkhW+iLK0nYtxL+4kYY8OhGPPqYuABcUGecTfbvd0+DkGSidNfRQiu5bzNM?=
 =?us-ascii?Q?GYVV4b3XwGFhFIy9ojOpKwawJAnX3oTu61UxBx1z2IaffK095MO+O7DUwWtr?=
 =?us-ascii?Q?CP91E/mbiGaGqoDAogTSaZkd9YBMp/AhAxIHuyPD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f16cee-a302-4ea5-5c6b-08dda23097cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:52:54.7309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHGy8NaUnoPU1vtIEghTa4qst55cn6kYtrY58dj6fuVP8s12fDpcgSDYZYFtTNNg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-06-01-22-08.

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
From V7[6]:
1. restored acr_flags_t and renamed ACR_OTHER to ACR_NONE

From V6[5]:
1. Used MIGRATETYPE_AND_ISO_MASK in init_pageblock_migratetype() too.
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
 mm/cma.c                             |   2 +-
 mm/hugetlb.c                         |   4 +-
 mm/internal.h                        |   3 +-
 mm/memory_hotplug.c                  |  24 +-
 mm/memremap.c                        |   2 +-
 mm/mm_init.c                         |  24 +-
 mm/page_alloc.c                      | 319 +++++++++++++++++++++------
 mm/page_isolation.c                  | 100 ++++-----
 16 files changed, 431 insertions(+), 191 deletions(-)

-- 
2.47.2

