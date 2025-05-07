Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D31D6DB9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652279; cv=fail; b=GNAQ5aMD7vB4R3+wJXHKnvNs3UZqa6eZej5A/Js/MNzavIcDywTAtQyC64dl8rIlsZTZHl3z3dDRgqUzo7+4Ml1SchzmZFOXPBDl9CKSx23ndtbFFjO7KngpcioScyyKKyuDWZFmhSD2orBAT15L0EBnUHVC/UV0uNaD0nH5ozY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652279; c=relaxed/simple;
	bh=R1RlMbl/pdUkDTP/TI2uHgXKXpq5YoeI5OTk+jiy/5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C/xDzbr4UNOayaJf1DHSIGjKICkjQJVdFB60v6bbGxq9fvhDKQyPN7cZZ+/UVXYN3K6BQTW+RQU9s1g7Cg6Y2cxb5cA2FoQTkm1s3NFrvsqaIETYH17Q6J8uDz6sWAB2SMa9i1FRhMfS3Rc3RuxNhP9T7v0j3/8J5Bw9p0cS9pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kDQ2rGKR; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kDQ2rGKR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkpR1KarYo4ryvVxslP2bWNvF8dFX2JaFjRDIlHg/3OFvk6vacFn1hZkjeHw5RF6+bfa9iTXm2HQWqpwndvNgRs4dQ3DDZEmMxBU1an4NCYXFdNHbfJ+ScOEHeWwoNF4OAJXttlFlhsT495CZbFpiWKEnWt0d/6wjTDEa2yuLbrxkCwYTyBJryAPahkiahzpwJZMJWWg7mfDhuGBrRlsA6/QU3hBFshfWg7fZgzkld63WPnqgCht/BTigWbtPQsPbZkHVxJas2Sewcm+IQ2J4iVL2kw3vS59Wz7SgTFTu9MMAXhYUREjo54v1qiNY/17oUB0SN16d4u1SDDeqwHOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsvBl46JLFUDJU678btsOaGN+YSkhzmNEwC9T/KqI7I=;
 b=LZTn/8yUxWueEtEZ79XJnS2t0mtFbHOAtsClGyAWwm1dH1ygxUYLECXrchQRQmOu+PA61PEY61Vbaph0EnMOfZX+DUMzr5Xo8m20BP9vliSTt313k+bv11/Ag6yBybtbbkp/GxjlVDNp4Dib5O4AaBb5ETLXC6ZDW0p5vrpza4P6p5UaBrOb8ESz/upuC0NuQ3qLsUdSiorAs9p/FmUZALlXlvKuMrLqDWEfcV3jeCXgEg+Svnj4brA4wgBcgVhI0LYh5HQA0B5NIK1whEVoFT63az7xmjuFVuA3yF6Q3RLM4uf2YRSPkX4giStEt58+LfeT2srSLsxhuDoNiJSlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsvBl46JLFUDJU678btsOaGN+YSkhzmNEwC9T/KqI7I=;
 b=kDQ2rGKRPSnmCFVtnfbddU8thpXcgaCNIML3Q3D8YqrSvscG0CzFHm/9dNh+tEa172XjkIWFn3jUX3tKiKS2WufJf+vKki2iAOczFFo77OsMhjlvkP54tJ73Fv2cDfSsWl0TD5ttKgbjtTmjMHF95rb9mM05ybiSAX+Kgs0ewagnlxmeRLAkOnFT+11Nq+XGC4ZqfFaDVvAayD61+n3YgkDK+fEsHYZEBYvyHCaRaK+CkFhQhRO6yMqkmrVNDUILSNhpHPvI5dDDBAa7dkBBbp740XpPKlr+PSshPMfEXhlDGiiWhR6oWS4JgMADxF5bS7Q+VDX82eq9Z1bEJNu9uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 21:11:11 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 21:11:10 +0000
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
Subject: [PATCH v3 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Wed,  7 May 2025 17:10:55 -0400
Message-ID: <20250507211059.2211628-1-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E00.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1a) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: cadf5352-d3ff-4e7a-801a-08dd8dabb127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hkIRDEhaMnAxvJVtWqumJjGf7TfHU77FHIK7V1FVMkiFl8JeG34Z/nB5+j4C?=
 =?us-ascii?Q?8Zc1GbgIUtm+U0MB2rWlBeVsI1ttVakOjCahO40k4kXm5lhgmqPQBaf0A37o?=
 =?us-ascii?Q?hYNUeXlZ9BuP5TDFCNAKnnQErS5H279jg5sGRiCeyI3Ebd1hojCjLKac5ZRZ?=
 =?us-ascii?Q?Bso5D8Ta2kXSGSxAkQzsICZoWFNBA0wwEgs+89AG7RJvHh9usRp7OHV+Uhmh?=
 =?us-ascii?Q?VeByV2VXl0SDgucLWdtmx40WiimTvSSrtDVdVplQ7wyhKBtUscg1b7lvtp/k?=
 =?us-ascii?Q?cKllzWiK2STn972IMs5nHoGHswHkDLXuf3I1A/eOnSUnv4GcOnTqRl6Gh7CK?=
 =?us-ascii?Q?H5sRh5SoyIhAqC6QqsIvkt3U4aAfQkMfmUyGCKYskSCGIrQhVWj/PmjopPRm?=
 =?us-ascii?Q?JegkYUA4hpGAnw8Jp9syY+Rz7BWqueObAAjvTTEscUzlnXBLHN9HyxX+BZyB?=
 =?us-ascii?Q?iJzU2gZxGpldYQovpOD0u5XxytyHS+WVRg8VysEkAV8Ir6MFjGIYyK4I8A/y?=
 =?us-ascii?Q?0DL3hM+zzJ0uMRVOuuR/vNonOZFL3tsQCyG/YbE9x5qt6k67S5YliOo7NmgS?=
 =?us-ascii?Q?nGcHqY28P+6krdM49xFs1XNloidtXUlwQf4PvD8/zfeaY9Oi4vegkxJSdp2D?=
 =?us-ascii?Q?AX3PkkHimF3rHg5Bwtkm4lA8eriPe6mqPJobFIIj2Wf3pxIIO2ao2ZWt/F0w?=
 =?us-ascii?Q?xqaneVXlKVoQIKmL7Z1xqD9O3642N0Ux1ZygQcKBC1ziFe7Ceu8/bWhTBP5p?=
 =?us-ascii?Q?71jRSUxVe3jSYEUfAvh2TTsML+2+QZRvTeS9OAvCUUXwu4MUi/4tqDmC40yW?=
 =?us-ascii?Q?cmAqgBMU3foowMbYnHdTELL/ECyk5k2eFN35K14zG7Ev3L/PKGRIxP9YuYOy?=
 =?us-ascii?Q?OHLZSNpUj9R1Odja3XZUYt0WH9mLVh7B5SoIn1HIBeNwgj/2IHEs4Yd8nFv7?=
 =?us-ascii?Q?XjtO2ECvvn5OSNvEylP9FYQTpZ/szzUuxaAM7Lx84ye3JX3ZhxTnMlpHIs0Z?=
 =?us-ascii?Q?U++Bjtx8FrBeYEfeE7HjIylyDp+a9MPTjpEqfvAHNJbjLhAQK+keQdm4HRzG?=
 =?us-ascii?Q?Td0IFceGYM2Piz2t77GqOca3gCR5/ifZo5PSrcD8Lp4649QAHJCoI8N//q17?=
 =?us-ascii?Q?7ZH8DTCi/bHNO2nOP21FZKl9pn9bzGBytUzEeOabOKW0tooFBreZ+kUg/HCG?=
 =?us-ascii?Q?Ec4qds6RP9VD2Z67SqICzIQL7ecjwgv+WIVW9tas8PI7zdE9n5DT+pTrtuWE?=
 =?us-ascii?Q?0F/x3bL1p5Wy7B0H0Tm3l66fk5qbapHKSV0MItb4VFCrUUXeCYYWQlocnd6E?=
 =?us-ascii?Q?hrhzjWTB//1JWQj7xMY/GcRMhmARnwCsp0nSSoPgUVtlZ0Ij7fp1gEcJzmtV?=
 =?us-ascii?Q?SfgEpi9rpnjEe5rXK1NdOOIkJIGuFL2UaKpfF9CVCKmX6KCyR2KAlFV3ml4/?=
 =?us-ascii?Q?p9CAnxSdzbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Thtoaig0JiP+59MdAxGi/3pMToi9b4NcF9CeeQQsjOLoSdZpniNF5ZsArgSa?=
 =?us-ascii?Q?qF+D1479Ez3emIqoLmnU/t7V39yr6zcoc3rV4api5okvsLDFjKecQOXO2ihH?=
 =?us-ascii?Q?m+X9XSkB/vd0lHr4tvSkTRkqWPM+gdPnOQ025vRgWd+F3BRiJc1kOUxYGDDf?=
 =?us-ascii?Q?Y4Ra0MrPTFaJY/5wEWpasf7YQ/xdMzYy2OHaCCSGfv242GPDZaHWeB+eHCMi?=
 =?us-ascii?Q?BedKi4fo4MUeOD7qTaw7g5mX8Yb3oXCuWWybdyv/+EmuWxrGthNbWwZUxX9F?=
 =?us-ascii?Q?vZtL91cd3yBXTiZQnkOjZvc5uWfEy2QCHFIAiR0rL++xG+ujn3IGsn3DGhMR?=
 =?us-ascii?Q?5dcAqXE7nKKoPl+BfhL+dTuD23D07tX4KSgrt1mDrKKYhOxZzi4VfUUSOf/+?=
 =?us-ascii?Q?mZUQyZNHTa1fmVUkSRBV3TTDsgn1XgdN/RoQWLDXAh/HU31WBZ27Ox1Huc5N?=
 =?us-ascii?Q?Ifo7i9wHAqbjD1XEOc63hMNEE7EMkBCf08Qf09ufHzK7/eadE4DU+J1FdMlr?=
 =?us-ascii?Q?wJbgbPub/bJE6tzW5J8Js4gaJEKlOQutKhFTvC4QAPYvJr1aiXz9xiu4yam/?=
 =?us-ascii?Q?Hhv1txPptrQhLjpL9P6kNaf/7ZhzOTznHijKCsB+CG51wpx83ORamAgAsoz5?=
 =?us-ascii?Q?q/94ZJfAe3viD8mWjaWJGXU7a8/Z6FLn9ZHzTzoZUMP61/nMhj31yhRunjSd?=
 =?us-ascii?Q?+V8cSSfHQus6RGyi5lyXYMfzqk9fCmuYxxBYqp1n7hUxHRJ2HiqGGgjVwg+1?=
 =?us-ascii?Q?fGfLsfXMmZCwOH/HREbN6EJTxz3MpbFDEwjWQE/gY36ElrraidEMbm+Uxa0C?=
 =?us-ascii?Q?6A3yEEWIKPxM7b6GyO9Ddz4twSrvQgQeZRvKl/rlimkRYUJH4bF79hFt3y1w?=
 =?us-ascii?Q?266o5iiuIvKojezWY+x6tn9JBkEk694f7WXn1SeG8BK9o6pe+hyDzo/TkM+Z?=
 =?us-ascii?Q?d6T9mWBKiXRO/2E96CNcLaG47IwUZmcE5P/sblhUp67k+eQlxzp5xOU1RUT8?=
 =?us-ascii?Q?so4uKPjlXrGJcMBQreHvl8gtkoKkX5h81bK3kJfbRbrRJZ8+ryTGZapYOqXP?=
 =?us-ascii?Q?bB7+rjDn6oqd/jJFH14IQiUGs3infwYzuxFnWgHzIAuUSxz9jkc/FifSV2wR?=
 =?us-ascii?Q?NgporLyZR6WjHqXd/v6evsBnKNzSJPUHDw3ZGlIrMIs3Ajzv2eRUzuYwblQI?=
 =?us-ascii?Q?QRgUPm91hTZmPiw5VksDSrFU/9H8mFP6jCoLOOSSYKJ4Sv9W4I0FO/qlae3i?=
 =?us-ascii?Q?iXODgqrFnJV1RpKzCpLtk7jOW8XyqQUFvgYGWyvgKlmo/yYWM21VH6CMbYOC?=
 =?us-ascii?Q?0rjk8BsjzOW/gvWwPWCqnXoQT2COhcQ+WdwPgFOKQsu/ewdOzaJTySiJZ8oJ?=
 =?us-ascii?Q?DNAr9bC6FOWSkJxjf1fUoe/NSSayvdv2lA9pSSqJuuNCeZ8uafP2i5JZaeMa?=
 =?us-ascii?Q?WjiPklYpixCJrfWQbCkrlJoIYQtgua/gijWYMMqSAqqRpdrvHQlYfi4MComp?=
 =?us-ascii?Q?mshLKIo7rFj3GkZyibJiYPWHLhd7hHue4baVAuZbWMgbsS3Eh1KjlylnbwCw?=
 =?us-ascii?Q?ib1p4K8xDsQJ8df4vhfe2BKdn+6EUySG25W1ABxG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadf5352-d3ff-4e7a-801a-08dd8dabb127
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:11:10.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKMysVRtSe2MYrT/6F5dnMLLm/+LRAuXPxqOuiTtctcew3iMbuRmGpfojM5NYSeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236


Hi Johannes,

I incorporated all your feedback on v2 (see Changelog below), except the
"decoupling enum migratetype from the pageblock bits" one[1], since all
5 migratetypes (not MIGRATE_ISOLATE) are just values and
"#define PB_migratetype_bits MIGRATE_TYPE_BITS" would take 5 bits
for migratetypes, which only requires 3 bits. Let me know if I
misunderstand your suggestion. Thanks.


Hi all,

This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
being overwritten during pageblock isolation process. Currently,
MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
migratetype. This causes pageblock migratetype loss during
alloc_contig_range() and memory offline, especially when the process
fails due to a failed pageblock isolation and the code tries to undo the
finished pageblock isolations.

It is on top of mm-everything-2025-05-07-03-02.

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
From v2[2]:
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

[1] https://lore.kernel.org/linux-mm/20250214172032.GA241035@cmpxchg.org/
[2] https://lore.kernel.org/linux-mm/20250214154215.717537-1-ziy@nvidia.com/

Zi Yan (4):
  mm/page_isolation: make page isolation a standalone bit.
  mm/page_isolation: remove migratetype from
    move_freepages_block_isolate()
  mm/page_isolation: remove migratetype from undo_isolate_page_range()
  mm/page_isolation: remove migratetype parameter from more functions.

 drivers/virtio/virtio_mem.c     |   3 +-
 include/linux/gfp.h             |   6 +-
 include/linux/mmzone.h          |  19 ++++--
 include/linux/page-isolation.h  |  24 ++++---
 include/linux/pageblock-flags.h |  33 ++++++++-
 include/trace/events/kmem.h     |  14 ++--
 mm/cma.c                        |   2 +-
 mm/memory_hotplug.c             |   5 +-
 mm/page_alloc.c                 | 114 +++++++++++++++++++++++++-------
 mm/page_isolation.c             |  66 ++++++++----------
 10 files changed, 197 insertions(+), 89 deletions(-)

-- 
2.47.2

