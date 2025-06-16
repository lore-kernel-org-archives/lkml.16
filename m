Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D3285C94
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075828; cv=fail; b=dp7adeGOR2huXgdwU3iWXmNQBYxZomAnIarstfzsTVKZ39RGSocwnm6oZoBHkxWrnM327a42WaEwJLhs/ZyaxSaVC59dgNmm4QoB2Ch3jYyJr/ZK977ZrmU1GOKo83WDpWp1BDAWl5A6ZJ5Qd3yTPOAdG0tiWEfWc8brV7c1oQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075828; c=relaxed/simple;
	bh=mD9VnO8kr4UAuQkG0pGBH7z48Z6ZlmMl1GKNLvV5a4g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ns/KUqy5eCVTFCbtq679KCpbTQC+UbxISK8ocLFZ9X92C37xDXCd8dVSreb/mpqh73gE9xmfHQihVUhRMeymlz6RkgLnbpENS2VWf9FiiwaxJFw8MwHww2wxMV3Oc9xfqoXDAXvKfb141Mc+lvxQvocqTpIhPPbJ6drWZh+BBC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hCkbDMN6; arc=fail smtp.client-ip=40.107.101.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hCkbDMN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy1K5NdFJDKPQFTSr2Gf9/nUdYntYRuF3VdQBZ8es2l6uU4NjwuS1hzZj2ovDNSYzOuuIeCezdOkOYh5MYr0rHCadiqOR4/MLBpIjw7GYlWe8998IOJcXEnNz9CzrZvgXUEG5MRIirSdjgn66x3beiCaMgnPdrBS6nCJvFrif1XI3b7xD5rE3dHzsvfY37rItree9t45uzAqE6fmK9F0LVZsQQCWP0ScC8zFVpBAUErHkwKa3Dz9cGlurUtFKYmJSaJ5z0oxaDVVlBV+JF0JjG+z9SfrFV1oWpCFUJkha1f6JbRHCVjOHgu0BETdr+eEnhTHbj0W1Hssj9MYihrCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4insPdAfI4TGqFf3xuIgdiOmkjZ87CXytX4N5TrGOmQ=;
 b=TO3iVPE9gM9kDW/wreVGSJgvQ3ZUHATypHilQggUI3FnRcn/DMAmLITRpxW5GmpDt2RdvPsycmxBPho0xW0216gvLquPhcKtRNLvQ0w4Td8goV6/6WfVmXznD6PFNgo0O2tAgxTX57qbjt8Tmi1G78cEWi6cxTyy11rMqbH0T5gMoObVhXEFXzaGsddC0XaefryoeGS/0/SjT3GBEaIV0eGkzE/C3a0TUt4DBHD14zc1aJrSifvsf+0lNdn19ceFBnKvr4nrSp8iOcH7Alu6IPhete+/nbq3/zbJuQ5PtkCJXXyjo0SX/hwK1Ac11bVDgo5XKGutq4A/JhzoZe+hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4insPdAfI4TGqFf3xuIgdiOmkjZ87CXytX4N5TrGOmQ=;
 b=hCkbDMN6qOR9/ocUC+ZC0r80rZAh5NoxC3TKaIj2eHWIGo7eE+egfS+9y67KCfkwGtFQEu0Zpz5uFyTFeJjLElmivMcNvPX+OgLnIfe6jPo5mFN+qgnlq1Xoxc3QTg9lkpSeG12tmUK0ciQR11hXjpiXj0O5ol4QOJNajCP3xvA3Fx0zDQg4NaWPKXV+DahwhN+j1pyOyl+FNNUOWDB12jfGQIr4JU1hkRHxui9EP6Dv9xDL23AJiLVFNg6fpPR3NVUSwlRVD4NkJ5yi7JE5Fg8mhv/If6kC+PqT714KEL4gELn7CRudkQcS6KBwgWlf/sVTkbnF7RrRouPFWbawTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:10:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:24 +0000
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
Subject: [PATCH v9 0/6] Make MIGRATE_ISOLATE a standalone bit
Date: Mon, 16 Jun 2025 08:10:13 -0400
Message-ID: <20250616121019.1925851-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad03e72-b32a-4965-e0ae-08ddaccec5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wFWIG9sB2boKrkuCTs3T8F9OQYX+MVRTrJBcEn/4QXVUjjG+HguMaHtJ0CQE?=
 =?us-ascii?Q?c5/1OHQNZAeVP2AgKma/J5zEVpJeAmyjVwyWfp/SvGGVN5SUvPUgTbANHoH9?=
 =?us-ascii?Q?Ahbbj/bet7jLBy54ukYZpKM/Be6LJaNvtL5f/loifxQF7/89vpx01FlB5YOQ?=
 =?us-ascii?Q?nD8pHlZrsfxRCuC5dn2QhHZ+j0Hnm6QFXWuw7/0NfEUT864DD7HrWU3a41sr?=
 =?us-ascii?Q?+3ZJZvREg/shvc77hkKZryfGtpw0OD/UQzndM2PPGrnzdL+UXVAAGRoP0y4Z?=
 =?us-ascii?Q?hHqfqUMXq/oiCs7uWJHoBPRYklPtbM0ys0lgWWC8qlGBarI21jPsXyO1c7Nj?=
 =?us-ascii?Q?XhiRgk3t4SqDk27ImShNgEGOT8QlgNMKh4IFFlWSlmzHdUqKUDSpbisXIrho?=
 =?us-ascii?Q?xzSSLDE/SIo+nJoYTmNNWBqHPy40B2NcUKR5I18dYDjk5ZeG8xoEtH8X4J4+?=
 =?us-ascii?Q?Lu61Nx5/6FxnezqEjk3ysrxUTPQb3xKzc2uRsdbDSHsPvVUjumBrh971SzDX?=
 =?us-ascii?Q?8yLyLZehfDl5VHL6RFdWtnV+SV3OcWU70VtE7ytOscOberHEgSJ1709y/ddb?=
 =?us-ascii?Q?tMH/bpFqbS4S2zRBzsS/iv0V4pFafoY63c2+4I7LTEaDIS+l5ByuZUnqIKBJ?=
 =?us-ascii?Q?JgvHYa1tWBRdxV3fyvCGkYfVjlCke8xOJFjvlhGpxX9btxbWyQ8ePIX8WZNB?=
 =?us-ascii?Q?SWPA1Pt8ZwaNFdHfOJzHXiMt6TUkb6k8nR+SPNLOpSzO9OwUYz8c0+OytFCi?=
 =?us-ascii?Q?Gqlhq9nukZKtChM8w6vaN8ZHizYLBj9KAaSFsDisiBDRl1lfreJLTeN4lYeo?=
 =?us-ascii?Q?Po1gSlLDP5O0yhzM5KLuH+csZBuRrOzY7CAlE1+9n2iIZIk6SvF99Usk30Ol?=
 =?us-ascii?Q?J5esLB8X7HkTPZPv1X9A7t7dHOHDQKdQSVFT/ysTZJ2nDtyK257UyZ3sQK9x?=
 =?us-ascii?Q?aT4W7Aof6JWEIkRLvw/nj1/XmYrrxnglI5aWw1KU7yqHfsD/V0/GkdjeuZO4?=
 =?us-ascii?Q?q2XM9/7TgVmNRI2RmZ1tMHWdXknj1xb9MiOrL/HRJ5tikJcvrWYYXDp/EFTx?=
 =?us-ascii?Q?rwodTactF/jxhW/uxoQbQLR4shqezGp1V55mOllrug0vrMhanbm7gF9N64nB?=
 =?us-ascii?Q?SdVdnruP/UBcsh7v0pdWRpeWgoBZllEgieSUKdMvxXqbFHcVwmyDovePgZl1?=
 =?us-ascii?Q?NgPeXOUSQg4k0EqZo7jHnttqa4lJzEwXQvE+gTl5zw6Twfjp+82cw1uylqsk?=
 =?us-ascii?Q?ULB+dkXATa5Y0+IXFK67cewaZ30QNS/ZOpWv6lkZ0VpemsMEYH9Hyar7ESYP?=
 =?us-ascii?Q?DBIdMx8uWL0btVMsl8wGRlqVrTueWBYt4OQingaBuxFc77VmAfZdZTm6er6P?=
 =?us-ascii?Q?AGFJYGUurzx7Q+l/Gn9ZkZNpsyM0di4OPf4gjYg/4IttKHidy2Zefx0Xiwla?=
 =?us-ascii?Q?YgxgeXKko2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dX3X1tGzCM3EZypWiXahzfu3Iknmyi+6bi+QTdN14beqcUI1EbExEKMNQiQc?=
 =?us-ascii?Q?VBRVmoK26WMHHwl8bEr0pHMKI98d2cgcge3l5QZNpn31i00JBbl1MweguB1J?=
 =?us-ascii?Q?2kqY19lJY2+Y0tdKDo74QGYZKus+qlWm9FLsweCM7xRmZyXo7hOb5MeUD0QP?=
 =?us-ascii?Q?EmOhF9wfw3kkcgOJScTP6Lppar1CTBRXgunK9xMb4gW8DT67vXw71qmOPO6D?=
 =?us-ascii?Q?3IIDwcZwkdjSl5EuFOE1im3koHz1467GTgigWyHC8Sq5x46lLf2Ba8rw03/M?=
 =?us-ascii?Q?dEKxiLAc7Fv0vOaJw+Q8dDgTnO5uF4vQ1PKa/O+TQghNc/1dNVe1dLtyFUAR?=
 =?us-ascii?Q?m9LyANgAj0Z+VAzknppItYmZ8PHu4gjsUN5JvEfOCin2RHBiY/2wZE8uB+hT?=
 =?us-ascii?Q?YVt8YsVMqjPmeOr8wMXjnlZvPp13IudMrIRkhfHWgff9bPm3V7tFWPggkrXI?=
 =?us-ascii?Q?tFjr2qugSmuE15Sb17t1ynZFVVHWejyOFAAGGR4Bc+LS9U2GFMkDr4Eye5jO?=
 =?us-ascii?Q?/5FvjwcT+hdy4lWYERE1OngYjeBkHkDyo3OJQ8TCL1lMIVbIRDcPpLJ+8GQp?=
 =?us-ascii?Q?xQ8/bh9C5nn1dngjFf+5x/G28xxFvd6Ibae7RAvFvRU3oJbhpXOxnZ07z++n?=
 =?us-ascii?Q?dKcbrcNb7pSSecT3Y6qn1dFeDr24P+aSJev5njhKoCXxrOio+2IRa9OPVL/6?=
 =?us-ascii?Q?/ORLRfPSnb59O8l+CPxp/DSGnstdK9iPYRhCaPV3aKO1LRxGRvkr3OqkRE01?=
 =?us-ascii?Q?C78Nc8GvQgOQbKmHCoPMMuIPxrU6Ob00CqytheiGXwE7tcHRrbxmXsJ6kY+d?=
 =?us-ascii?Q?Vfi1RAaUX+c5fe4pSAUBfRJcLSo4cP6BJ4E5rlMfVeetfuOYXZTU0+wvV7dV?=
 =?us-ascii?Q?HUps6EMZf5MYhnAUPQtonHkok77pD84nt+EB07D3vur91yfrQPAtz+BcyoZJ?=
 =?us-ascii?Q?w0LHiS4/svoze1LybKidHRG3txXqADNEFMz8hOo9QyfIF/5SRK/JB8GbhfWG?=
 =?us-ascii?Q?bvwL71Ozpk8mib2E8/oeHzyPqpDqmOJMTko4AgZ1y4wk011BU7jMZArcDBUu?=
 =?us-ascii?Q?b7kOZ7KtTYut6DesVYwEcP5v3pezCe8jbBxGmm+c7NOSk3HlCY2lPbRcGnGr?=
 =?us-ascii?Q?gUVkMbTRbhWiHveIXDTVdie5Jani60fa7LWiMtorFCu/UhMkjTOpYP32MEK6?=
 =?us-ascii?Q?0nShRCEMkGGK+bDlco68XvyJqM8PZ/kpUqPohamaL+fLjsEty+if2Ni7O+BV?=
 =?us-ascii?Q?hJ0CluCG8FbxbLNE/uRFpjZETUohRZLBOE/hnMe2Rbyi3jPc4suTbgvzo7A5?=
 =?us-ascii?Q?GY9EZdEvsCbUVi42i5+VCe0skw0JvDroJ42l5bqokHNhJsIHHVNm1EJeNYK9?=
 =?us-ascii?Q?15LEjXroWlhWhCUptdNFles0MDtwDjHbhLOlyj0PwM2aIKRhdeU52KseMkO/?=
 =?us-ascii?Q?DVZXULSWPQP7+GcfyRsDZWhRxieJBLb1m7Me7Vztzjvf2pRwc58Rk/TIFhik?=
 =?us-ascii?Q?0n0HUAWWwuiUO9Q74I6B1cbCr4etk+BtqoHLnOY3z34Wvx3mW1Gujb6vJevq?=
 =?us-ascii?Q?cha+5EgCrlDc2KlZ2qWdyD54oEkDIpuMaHgFIjIF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad03e72-b32a-4965-e0ae-08ddaccec5ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:24.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXa7mvBFRNiiCEbzgh6VgKqPgbJ+JuKWpfppVNzsVFSxTge6pRxCSn+N1onjz9kN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-06-15-23-48.

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
From V8[7]:
1. make init_pageblock_migratetype() set right migratetype, when
   page_group_by_mobility_disabled is 1.

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
 mm/cma.c                             |   2 +-
 mm/hugetlb.c                         |   4 +-
 mm/internal.h                        |   3 +-
 mm/memory_hotplug.c                  |  24 +-
 mm/memremap.c                        |   2 +-
 mm/mm_init.c                         |  24 +-
 mm/page_alloc.c                      | 321 +++++++++++++++++++++------
 mm/page_isolation.c                  | 100 ++++-----
 16 files changed, 433 insertions(+), 191 deletions(-)

-- 
2.47.2

