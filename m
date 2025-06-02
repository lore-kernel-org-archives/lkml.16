Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7722F77F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877498; cv=fail; b=jm6WCAl2Sxt+0TChgBGvVyMVhYOh/i9Mu32OoacFH4xMFF7y0w4VpEPjZkttupYG9dNXAVu0IBnw9RrEC9oHwvnD2GN8mkgw3tJ5QL3w5/bU+HWtMmOJzNLFO70IWQCYlMluvX4o9X7ZhaA6rnSkmKSuwWPb45P5wdK5+dbhLmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877498; c=relaxed/simple;
	bh=W2ZZbCI+SKqZp9V/8eNANE5Z1bvZOUcPrqf7y8YB7XI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LRWDuosaiCD1sRnxV8LDTag6xRh1cWOKkNU/TF/Wqx/rIlic5eUNHcfxvXtzhoGJVa/VVYR6O2HCG1aFLjW8+BPHTMjcS3CeiNvUpZHLG891bhLehSGnoKzys9tynqWAVdk4H1kSQE3wzXmEcbUNrqBxb9M3q4DNOJyAi5zro1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hbD6uCW/; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hbD6uCW/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4+bJedwl5BTipU9NPPDFgVNhFuBCpoKX0oFZ3bmgXQuCJ59ZSfWUy3PBWyOYrVeyGmw2RS/9ouRT59OHrxZ60B0PdeJkaSSSP6awS5clmF2QRRS70pCPOhqV8NDgQevSKzOoAz9FCCHQp5coZHcLsLrhAiFS1r27mF/gLgp6X9iBZ9b72ucrukuhf1NXbl/eVvcptOGgxzN13Z6COywIXm7XjLvckKxqrvwNhekSqziQKYTI7kuDVVCgswnKEV1J+vuGQ0B5DHkEq2uS3BuT1KS3hqWPktuPXxYCkdy9exJrro4a3Fes8noWKzYpXFdfMz1eMVzb/gj9VamdBqL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT1nVxa5ik5CoxqW70iJB9PD0OzAWqHOz8fxVjk9v8c=;
 b=AjZ3kaDi5XKcM8j1JCZhqpAOS/7ZQxz/nqXxEtsF1g7J8ZCIhPe7f2cnV8luOaCGy2uEc89xHtWVqYU9fzMVsoXIPEt/JQuq3h0Vs9PlbaKpp0eHO0Ra7K9fmDHD2Piuz8nDc56jD3g9Q76GuBAdkIGAy/uP4hG++z85iWLM5B39d6uSroHNtCGsPxaZsWQL8mbS6C3uo79E/S145On5XLFUGbk7j+9hZFNUkBHTBm1X6YOsZ5UTsLfkDwEQaAzbSu6y1R0hQ6deTtc09HjnutAZ/pmj60lu/3hayEEdHWlAGxGuuqrC5ILBUZ2AvM8GXc6CLttSBmx0lvTYKK2kaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT1nVxa5ik5CoxqW70iJB9PD0OzAWqHOz8fxVjk9v8c=;
 b=hbD6uCW/npAObojdoZnAK43fsreq/fNS+lYwUL/JucO2uoZ2h7obXSc2ulzEuECMjAGY5URCeC2J6jASRbi1/VYLiSkmgKgSyrGJ5uumGHJUl6T6pcrvnQM0qZTv174nAwjsXcouIIzSJ+l48y3WGcPBNvpEDERLOAHfJ1iBXgLvDcn+VM+0AUV6VEI2qKAWHVEwD8FU7jLQ8WhrysVWXQjBOu4wxR5F5unxGIi6BJfILuNDfPIB3/UF1B8jGbDKrbIJtNWfmPhMnVpAh9Nqot4UCp5WVdquXqR3BLxoS9zoueNcKd2UVTn0vMOtIZjqcUfJNrvxDknEZ5M6ou2X7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:10 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:10 +0000
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
Subject: [PATCH v7 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Mon,  2 Jun 2025 11:18:01 -0400
Message-ID: <20250602151807.987731-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:408:f8::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: e01bae45-f500-41a9-04a0-08dda1e8af7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6O8LH/L6aoTFtYEbSN5DUK5CV4uOmasYBlG8o5AKySmmYc9aLK4epmKbv6Qw?=
 =?us-ascii?Q?HHIkc2m2L9BTxd/X9Wpq2VXJ2zDvE+UDTdBW67IZbxWSNnyoZJkxfHmL/r7x?=
 =?us-ascii?Q?9NEf251lptoULo8x8tzyQEpWUhBBlGh7pLMWFXQK8FYM4kY9p5Ag3bOe6shi?=
 =?us-ascii?Q?uFKuMAnA+0x7B6qqzQZAnyk7qChSro/8tp4oWCwqrslhOCjLqkJHpq747o3W?=
 =?us-ascii?Q?50Ou3EBBZcm7kLkTJv8VIgR5skMcMi038Z86yHrb1hm9lXNSXBys46/mjQ4B?=
 =?us-ascii?Q?1mvUq1DZN9LI+GcmVzlDFV8zpfB/zk2hX4t5HcFNe/2PhvJUiyk3ZV+mv4z9?=
 =?us-ascii?Q?LnRYnA2ZRsqrBcSnQNfppNGQ7dpXXiwYXOJlHJkhDN2rcWyEwJCiUA47NN/E?=
 =?us-ascii?Q?56BHPbqOn+t7D5vgzJOINtgpGM4Pn6awVYgZR/JlbToZLnmX4UAjpDVxOtZO?=
 =?us-ascii?Q?gH/8qHcXC8olS4D3iGJameP7jnsrcNWNIs8uSbD4YCAMuKackfrpSzEh5++u?=
 =?us-ascii?Q?uhvTy8zWVAF4CM3WugA6/cbjREHirTp25l6jVNdxv+bYe5ncU/SgUyFMRZDO?=
 =?us-ascii?Q?KXF8vb+9Fv4sPYU8z/Y2Tuzlc5OZuM+7GbmnT6+e9jMMqTYAzb9Nv5aprVf/?=
 =?us-ascii?Q?uYkndNwnr+6iu72GA7sGD9/G+TWNtX2TcKf4W5hO9YYF51bAJu6inbhK/TLF?=
 =?us-ascii?Q?S0jBS4O8GwoYAsgIDZhg/+cCVg8ks2cBZ0fpsQQhsiDvp9kKAHi2wBl8GlPq?=
 =?us-ascii?Q?8+sFfr+1Rg92ECGgq7QQiwtSuNhmnS2r16XsF/3RejdiwP46z+W4fIejsC76?=
 =?us-ascii?Q?uo2V0MF8Tk3FUhHWTLMc7AG3dxJDoG1qsdHwQ2zv/eQMncWPnE47RkvbJ3BO?=
 =?us-ascii?Q?k/zUEhUDX3EvWDXzATiREW8goBtKcJuwc2PJ/B1iLPuBQdP39XDZ/2xxSlSR?=
 =?us-ascii?Q?VsD5lm/XKoNtB/7wZosBl4FUDyuwkFlSq/QwYmds4rVLmCDo8jVSxjNp6Urs?=
 =?us-ascii?Q?vYRSwib8hb6VUtdmmPX6tNznz4dAcMEi+yUvwAzSp2dplo0jLwBsyJy/Anl2?=
 =?us-ascii?Q?PriAvDbKKccYYQG0CZWraK6vju1Z188K8dNrpXo8ylHiuqoQ4ly26hTyaXU6?=
 =?us-ascii?Q?TrIop2+9M3/ntkVEW1ZbSn67sOrnFuln4Y5zJYRsKzziYdekTBYs5ArAOrSX?=
 =?us-ascii?Q?sE/S+ZmoaUE1cL6job84gmIx15rxuj12kI5yCKGoiA0OfS9vTGfmdJrCM2SN?=
 =?us-ascii?Q?riuF8J5hu5uQyAw1g/65JZhvnrG3Yjl0JPhNRZuN8TTE3j5WqO9GBZgDGHcs?=
 =?us-ascii?Q?ZaL6a7SUXZ/jHsdAL7ygtxqSCE2u9mOvY3W6I+Y7MCSSOwHE94m3uiX4gVbX?=
 =?us-ascii?Q?jjHfqXaQy73JlAHmraXkbHKcWbumL+6GZfyBNkknfuYyrgcAlHDBo9DoCuEn?=
 =?us-ascii?Q?mTnj8WUBevS5HJXubHkPEyKcVfppfigk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+cN0VRdMGjxyKaHq+3iz0knCFRHLmK52xx2h7fSjPuoDL7rSS0FkUc7xnmCJ?=
 =?us-ascii?Q?EOS9pcs9ackVmweFL9WE9xf7A/g8m//jLrWgT8I7NboWcyYduBvyzMOLidla?=
 =?us-ascii?Q?XSH+hIRKTFWjq1agKOHcOObmRyynef/9rObi6LDlac19ioAE0Lc8UzrnjIqo?=
 =?us-ascii?Q?0FJ0KSr94evSum6KNkVL6RwbV1VgdymMU9NvWK+fcYmtEK3vQd0g5ozH8ajc?=
 =?us-ascii?Q?fB+aCPtUdAIhdujtXdI15JB5phkxzHvdmn7Nk+HQg90QiD3k1f3a9mjxIZ0z?=
 =?us-ascii?Q?QEhJvQhsDlR9kufw3x9v+b2Wrl9XnuQgH45yYd3MTws9EZtltxauI0vuVjCl?=
 =?us-ascii?Q?XSxThVs271bUExWQGcr7cwqbd9xGJ4+EbzR71NIjoLvKAGeiwEPKn25pCQhk?=
 =?us-ascii?Q?dkYvY5qPPMy3k74B51XL7eRjhBKf7Tz4i3N7jLTMIlWw1JlxTIme63mTIzSi?=
 =?us-ascii?Q?0PFhANJTXgpj+VhC8Owt5sxX0f0cVhp/H1dZpvvWghXuZYYKuTO/o9kmYaTf?=
 =?us-ascii?Q?/jkshzUGDku5vYxsl6+ad/smzE4pBDejLMmDgFicUgK10Sveoq27zgBM4Pz7?=
 =?us-ascii?Q?tSP7678C91scIRnWJVcMo0B+bVOaLFE23XROQjvbo17oSgMA692z08bjEgv2?=
 =?us-ascii?Q?zJgmQnQ3Ncl+HAQlyq9Ap+8FjroTcO/CI+UZFHpX0uQhCqhJ+7UqE0jwb0ID?=
 =?us-ascii?Q?MWLvDmTa40iCVdNQ8lX3Q1PY4slWnMkda9D75sjgvmrkWi8K+917Er1vpT6a?=
 =?us-ascii?Q?kz835/5QDPcnZKAOXY0xY+EQWjbSH0QzsTpnmLsH1js6mrQyLP52OrSq97xU?=
 =?us-ascii?Q?z7E7zIWQEUP4j8r4kYbOsRMQGNSKfSoLFDlDnT7AEnezn/SvgAaXCOSbNWae?=
 =?us-ascii?Q?uxQFXRTVSKCNNSigVih2/xYFI2aexxoZ2GxuOmhjCI41m8p5188LixzrPETi?=
 =?us-ascii?Q?VPYG34dkiKdSHyJOge7lv72btIrJrL8jsnF0u2Nq0zMo3zTVmgu7Hjv5PQxq?=
 =?us-ascii?Q?AfmxN4YKnH0YSz/zNjGazVPIile/ZqOAivo4/PS82F7usn2U+VaA6Q5stDKn?=
 =?us-ascii?Q?r9LYFeKpUjozfEmaLz6nAHRC5rKS/lGjpU0Up7opUtfOG+1Ohn/rShnLErJe?=
 =?us-ascii?Q?xFWfFiJZS7I9qibc3pJykg1ohZl61ABuLdlSJakJe2Di3fmteD64pE4ukLdR?=
 =?us-ascii?Q?3Egx1HUxAoGm70SrLBRuQWQ8RlWrCpJZ1GDkMQf9ludAORKPKhYIiNCtvJUj?=
 =?us-ascii?Q?dvOTG5xJNqm2HEdVotyjmc5yiISMNAcMT3PgJqaBDNmXGam8p/b8IPSblmns?=
 =?us-ascii?Q?9+tFsr9daA6frPOb0gCMz1rbLGKkixATOqblq4Svj9ti5nnv+3bmSTzb6xjj?=
 =?us-ascii?Q?ji4dKTdyQFyvZEjYvbfhihr4eu1BYVWOCyFLx9KIOO43n4QLRE/5Cixp7Kkx?=
 =?us-ascii?Q?OWqaHKiPyzBeCmcNKKQ6ibEcaVVP4JpFAWRQp6d6zlB/cNScBAW+Dwz6uXq7?=
 =?us-ascii?Q?wDipO1HIEhOIzNiX1qWsjRwb1RpUJEI9oi8zvUslvmNCzqiVQWSmSo7PJyA1?=
 =?us-ascii?Q?ISmf1il1MtqDkmfD/hbcKS1wmt1SeZXRoxm5Pqcv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01bae45-f500-41a9-04a0-08dda1e8af7a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:10.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHl/RawxPfb9eiM/ssBU8iUcCcbLRon6Uywn3KlxFQhoW6hi5fJanH+3PfryymZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-05-31-03-02.

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

Zi Yan (6):
  mm/page_alloc: pageblock flags functions clean up.
  mm/page_isolation: make page isolation a standalone bit.
  mm/page_alloc: add support for initializing pageblock as isolated.
  mm/page_isolation: remove migratetype from
    move_freepages_block_isolate()
  mm/page_isolation: remove migratetype from undo_isolate_page_range()
  mm/page_isolation: remove migratetype parameter from more functions.

 Documentation/mm/physical_memory.rst |   2 +-
 drivers/virtio/virtio_mem.c          |   4 +-
 include/linux/gfp.h                  |  18 +-
 include/linux/memory_hotplug.h       |   3 +-
 include/linux/mmzone.h               |  21 +-
 include/linux/page-isolation.h       |  34 ++-
 include/linux/pageblock-flags.h      |  48 ++--
 include/trace/events/kmem.h          |  14 +-
 mm/cma.c                             |   3 +-
 mm/hugetlb.c                         |   4 +-
 mm/internal.h                        |   3 +-
 mm/memory_hotplug.c                  |  24 +-
 mm/memremap.c                        |   2 +-
 mm/mm_init.c                         |  24 +-
 mm/page_alloc.c                      | 319 +++++++++++++++++++++------
 mm/page_isolation.c                  | 100 ++++-----
 16 files changed, 430 insertions(+), 193 deletions(-)

-- 
2.47.2

