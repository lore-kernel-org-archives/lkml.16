Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1922561D4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908398; cv=fail; b=KqDKuFwn7zOmcWGGjh4mCfwsF1LD9GQXPRa12NyRw6vsC4JivNhwsPAIyQ3NtY1wHIdU201TJzHNFBFocSd3RU9Os9DhnMI9Fbtg8oFzYr1lXABaYCFAvI31SSGdnn3ZiGSJmw90+t1mo37SpHiL4+HfGgq6BLh82RqaEiFOMH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908398; c=relaxed/simple;
	bh=yHB2O6VMIgqQmi1VpWZtYnlDCehi2qTXVzHzj8x0YGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sXAEc73NKllssn8hs3t3LsQE4KbKZMmBEm57wkWjp/flRC+yz9yZJQCjCbL66NZJUtLM/dbE6tyrX9RF9MGhqegwnqaAQI7iZl1Gbib3rHYz0QBRUiSeA2b0EKa8jU0DUIR0LmW0HvPn4TKpwZHjUhXGGBxhW/y63ttkWyHJEFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gMG7q1R5; arc=fail smtp.client-ip=40.107.101.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gMG7q1R5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOq3dI4Tws2+dC9gFPRVW/mV3NQ5mI/Ior0lUfrbV1FUPz0TMxOC9Wv80EjfIedyFgPfvmOUfqRTS/7Z7W/KC0vz1A+NodA/9e4px3Uu0fiAo7jG5HBHWXWN34j/q2jOV5Y7SImaP8tgnxBqDY45D6sY4aHEKicKNh8/2EgadY6VOzd13iBgjJ93OxCCH9UcAX25p2vZi37/DLvHEFiVS7+vrj2qPa3fE5Z8vAqe1QDqiJxKzkQR5swSoC+ArxmnuNiEQ2oQ387wkN9TOmDPjvreEG6BXw/k9TtYhBFCUahzJeYTErr2XUdq+FotsUlkNUR8D7AZ73GvG+PMP4RF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPYeAlQll8sVHoT4JWslf9XEsn6UipUm64tBSCQSXQ4=;
 b=Qlb6162kv3Gq3TdYi/H/vUBre+288euo/Xr9NLXRhzyQR8aYNf31tkFTfdLZAsIfKq2N52snkoQrFrCYZbrqfoszZRwO859s+J6aRpLz2HcKgslPYNexgK2MibpxAM3cTSLr1xejIDDW2qDoRQfb5xb8eadBKpC7bU6bCXvAmBqyDakTDEC4lbSo1m2DHqYh6KiBcvLfXeqqv6dlV/pSvtP3rawfMSwr3anMB8CMoh2l5R4ndP8/W6huHcvB2rgIOMsV6CIh5EQfpkCjxvboOI/SRns7LRDykMPe2GNtDbyar67Xq8SV0XDp99Nja6T9PcscWZeU1oSxhzqf9nSOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPYeAlQll8sVHoT4JWslf9XEsn6UipUm64tBSCQSXQ4=;
 b=gMG7q1R5yk1FT5HupK8DqKC/t52CSyVNtxSp/VYCCknmoH+tPdTE2iNtVVpO0Z5UbN51OZzqHOLHpFbHSFBXHIZGYGibAydjTguFc+4rsDhqWyvYC9kcmuS0flQGeH1dlmr6FRb5qDB82yNdiuzvLemxQMJ5WGD9pw2SyPy6yNsqdkJ6e+mZ+Ej31wLSmvAhWFKYqp10NTUii9Y33cjLfvyZu4KUTcqnde6u/0YvLukUYxz4k96uS4Yw9c9yhdvh2628oODJu4XQ1P02UIwJvMYnDBNnPUDnWtXQuObnZMkMrP8dtZ+e88z6CJvJbRXnNm9lfd1a+u+/FfTCL35lXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS4PR12MB9658.namprd12.prod.outlook.com (2603:10b6:8:280::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Mon, 2 Jun 2025 23:53:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:53:05 +0000
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
Subject: [PATCH v8 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Mon,  2 Jun 2025 19:52:47 -0400
Message-ID: <20250602235247.1219983-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:208:23d::32) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS4PR12MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d637cfb-94bc-4faa-8f86-08dda2309e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SLmOAg8y3uzigg9pEu2eWVA9ClGZ496vTf4ggaMXhRk8H5E8S6UUoFyUbEfv?=
 =?us-ascii?Q?oPQ6QhL7X994Fsx2+xJ6SsU599cSYhn80jhrEsdsurnnL9Ig5lzAc+r8haVE?=
 =?us-ascii?Q?RLr4y0/WLJh/MC1vchcw6dgZIxU97wD/JEffPSktCgtEfG5uCD8q/ntVqQ1I?=
 =?us-ascii?Q?d2msTuSYaPQVX7IXrLc1iLK5KzUnNvhrjC2M7a8Rgi0mczxpHmGjdJOpkshY?=
 =?us-ascii?Q?EIgdPIWyt60AkoKn493aMB0ABpl6gYFef43WKP8et25cWQPotfkZk/JL0fy5?=
 =?us-ascii?Q?eI906F2ZA6paqnm7ZJJSTZtnjlIqkLKbHEp2ATp7nM07Bn1pM7vbbKq42gDu?=
 =?us-ascii?Q?YuAqa1eB+6Wxr3F4v2dmmMdBpOHxh6Vu0bUEasHsCIIVp2HMnQXcSO6mn9ac?=
 =?us-ascii?Q?URU0yGAlR8I0zC8RSFNwh4rwfORnSIsSt3HJq2G4lq1NbV8LpjLNdlNyMU/7?=
 =?us-ascii?Q?FWwdrKznYyujZKchD1iJduf/Pop+Ya8PwYxhTJBO9AuqF2gOofQCYW5s4fzC?=
 =?us-ascii?Q?mHYjX6y+v2UopcUK+XnrFDFSTr24YkbqAjta7QrbQhquMLm98VynTviYF5VO?=
 =?us-ascii?Q?VYldsfIxa2olvDt99uWHVNWrl0GmDYTO8iMpkr2y5eS+TNyLIKcDrWiidnhe?=
 =?us-ascii?Q?thj7SEZzUxkMqwqrDioHH8AWRiw+imISJlfLnkbnknv2RtfbAHl9N4JdvUhq?=
 =?us-ascii?Q?ijGM/FBydVDL5f7pauoaZJP+ekbP71sfJ4U0rE6nRNw5V146mOZscR21Rr6R?=
 =?us-ascii?Q?g+FsRFYUwv+4d4yD0+XjYGjlhoohOFw/TrsgZUiTyUfcPrMPckjNSepWCQ90?=
 =?us-ascii?Q?5mrPmfgiLaRo2dB+2FdUSrM09Jdpfxd/Z9GwPRAfl6Hr3WrVh2gW8Vl4T2sw?=
 =?us-ascii?Q?KXa0CgalyTJ0xucxYKeVmvan7W98TPy1sDikn5PhHbNiQyO5VhwPIOkMzfry?=
 =?us-ascii?Q?zEBMYHGNEErq7LILUWzt8OjwUphWtg6rQA58f2mOz2+t2ekcRs6YCPotnDKZ?=
 =?us-ascii?Q?fOJpVAnQ0r2l9fv1BW6XM1GkYzPEIe1FUskaOeB1BZeQ/ndulw73R5H/9Mi0?=
 =?us-ascii?Q?qnvQ+2zKi/z6JMoSGsZSJFI9KDQMHglS30/yr45nhEy5Qmw0YsBRdQkwNhHB?=
 =?us-ascii?Q?RijOL87SVWLFK35i1bCke5LsvgVBM5C7NFRisDbzroChrxoMTDnRwFu96yxJ?=
 =?us-ascii?Q?rS/JIEVgTBJxLasGA13uZora9C+CpLp3IhX1gGiEJkfGMwExVaWJOgSkvmi0?=
 =?us-ascii?Q?qiaGl7yFLne87ywGr5dnRLde5d5P6W3k/OC175TgfQkrYxKSxvUDdPrNW0Ft?=
 =?us-ascii?Q?0t5L56MRmvqxlgCMluKTLNqs+q3QPtHxVQt8M2zXfSe9fdfRlHG1Tyv+0IXr?=
 =?us-ascii?Q?2LjXq886lxxHlczzsMi9tYg5V5lzqt2s/bucMUrt29xs92HuJf49ukaTRzCo?=
 =?us-ascii?Q?htN01u39GNw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l/OUKTaBvgZfUND/OkNQ6zbT3xEM7HqEECKfIbauPykwzPv2lRuapWwKrx7W?=
 =?us-ascii?Q?ubG+NpNaLAE+08IxtVtBQ+E97LzukAkuDcgUxO0qibmumfocswzkGlX54ZYk?=
 =?us-ascii?Q?R48tX80cdaSliMnHPFnofWY1z1USOepo3CxRZFDJAmOFHSKAOqPVKudHY4U9?=
 =?us-ascii?Q?YA6kEiAkvXiCeAJSGaCTB+rczWR9w++qMAGqq8piF6pbhAVfeHpVZa1uopjg?=
 =?us-ascii?Q?LRmZj2rmQEcturgWvdXav7TNY9eVbKBOcfT4IxtcEnliu/Y8v27JjiEVdBnk?=
 =?us-ascii?Q?g43Mb0v/eZXu31e+tqgsTg40dPC31fGNMkIsb01TXtjwRsgPY+Godf5fdRjA?=
 =?us-ascii?Q?rvOpARW3EOXqB60QnNwLLviNYznDdLzdW2KZ12quP+53U+QHnfjguLVWy6le?=
 =?us-ascii?Q?qQSNZx/BY6NQcrhKbMq4Gbc/smaDugmUPciFCmAyNuQVPtm/JDppVHo7FSDi?=
 =?us-ascii?Q?IyM8w7AiPE75dR/qo/PM98WAyT8yqHnF9Le9V0lMRlTTFNxhOJ2GYhpmVrJu?=
 =?us-ascii?Q?ua0WCZzjC5zq0fnlx6yt8b01aV8eBilR1wXC8xb/iXD9JMyTOuIN9r1SRLYj?=
 =?us-ascii?Q?TGhdDGXYSvFKigCxMdC5sqEYhS8We7eEa6N5sOAvJcg1IFWIVy9VlB/LG3kQ?=
 =?us-ascii?Q?9vLzMLxKw6h/WrdtLA444t0KQpflPCAMFmoDGdZsuXuljJ15y3f15ZkGLVTh?=
 =?us-ascii?Q?o1l2/CkvoOlT02/QS2Py0BGs4s/4lvT1R7kbEB4xFFA2tOj9+tySx3S5mX1l?=
 =?us-ascii?Q?Eshy3QKkmLKUUuSeZzK5xDzrbJT+W/CTgem81eX+c3qCWm+UWp/b99K1Xhv4?=
 =?us-ascii?Q?Rbvg1gKKNt9rWKW0fn9+Q6TQN/AC8Wzd3WnhwvSWeP3/sfK9lLuN6cuneVWK?=
 =?us-ascii?Q?2XoyxQKQIXgwukw2ugvdVVI8DlNY2z0vn/FYQqTrjBkn4Z3/TXBC4Sxr8wsk?=
 =?us-ascii?Q?852XHVE38ZzXxz4GdPJfe9lUlwUC7SnjSSsgGIijvxEqHTIH4JRh6ct/IjZK?=
 =?us-ascii?Q?E5SReAUnGDoI6NFrbVB/15QBqPPgYXhXsmDyUeBX8tAJPxZqG40WZZrwbDAI?=
 =?us-ascii?Q?MoVBzyATg3kqptrl68j+GY0b+lS2HFOWS93IxybukQKFJuVCbi8gjVkWXr4A?=
 =?us-ascii?Q?6N5RCFvedN4qLoC9NDi4/KGGj7Z7HgRES22MLJ4YLTy8EQkt0W8LgTFW7ZjV?=
 =?us-ascii?Q?XnsEceTNTd1Z+j+JWHMZ83CXhT5yTRLPnHz+lU2FkeQY9nk65VYWVsubidLw?=
 =?us-ascii?Q?YcQHHOgiKeCWnLi+Ro2RxN+Z0izZFSnSO2T4nTG/kcRujksOe6bq+B7mgi9C?=
 =?us-ascii?Q?pn0LTER0d7MDJVsbVh/XE8fUQ7G2aVm08LPoJgvSzBnrvVqNZAY3LmwQbnKs?=
 =?us-ascii?Q?VlZY+FVAU3gj58Gcow7thFjaZ+xpMEvmY7jTKKmu9B2NlUUn5BntJ2/LLyej?=
 =?us-ascii?Q?V4ro2lOQMuXfZR8FCETwOf97QNFAiTzJyyMzRzpr8pabfwUlYqafzOl4QsFV?=
 =?us-ascii?Q?uS8aXiMDbj/RcPn9I7LBs00imMCeTmgnqdB++fD6K7Qt4Tgm3Q2c+0alNLl5?=
 =?us-ascii?Q?ugQV4tAhHyXiQYDUR3e00dERGEs+Isy20VrnLL2Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d637cfb-94bc-4faa-8f86-08dda2309e39
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:53:05.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZEvo2I7htdTQRnIsUuUt9KCBGAL31SjHGqyVoyWunCW0GAPfmDijNZrxUbirn/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9658

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
At the same time change isolation flags to enum pb_isolate_mode
(PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
reports isolation failures.

alloc_contig_range() no longer needs migratetype. Replace it with
a newly defined acr_flags_t to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range(). Add ACR_NONE (set to 0) to indicate
ordinary allocations.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/virtio/virtio_mem.c    |  2 +-
 include/linux/gfp.h            |  7 +++-
 include/linux/page-isolation.h | 20 ++++++++--
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  2 +-
 mm/memory_hotplug.c            |  6 +--
 mm/page_alloc.c                | 27 ++++++-------
 mm/page_isolation.c            | 70 +++++++++++++++-------------------
 8 files changed, 80 insertions(+), 68 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..42ebaafb9591 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
+		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_NONE,
 					GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..ccf35cc351ff 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,14 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+
+typedef unsigned int __bitwise acr_flags_t;
+#define ACR_NONE	((__force acr_flags_t)0)	// ordinary allocation request
+#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+				     acr_flags_t alloc_flags, gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
 
 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7a681a49e73c..3e2f960e166c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct page *page)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
+/*
+ * Pageblock isolation modes:
+ * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
+ *				 e.g., skip over PageHWPoison() pages and
+ *				 PageOffline() pages. Unmovable pages will be
+ *				 reported in this mode.
+ * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
+ * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	PB_ISOLATE_MODE_MEM_OFFLINE,
+	PB_ISOLATE_MODE_CMA_ALLOC,
+	PB_ISOLATE_MODE_OTHER,
+};
 
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
@@ -49,10 +61,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     enum pb_isolate_mode mode);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			enum pb_isolate_mode mode);
 #endif
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index f74925a6cf69..efffcf578217 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -304,6 +304,7 @@ TRACE_EVENT(mm_page_alloc_extfrag,
 		__entry->change_ownership)
 );
 
+#ifdef CONFIG_CONTIG_ALLOC
 TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 
 	TP_PROTO(unsigned long start,
@@ -311,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 int migratetype),
+		 acr_flags_t alloc_flags),
 
-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, migratetype),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),
 
 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -321,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(int, migratetype)
+		__field(acr_flags_t, alloc_flags)
 	),
 
 	TP_fast_assign(
@@ -330,17 +331,18 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated = nr_migrated;
 		__entry->nr_reclaimed = nr_reclaimed;
 		__entry->nr_mapped = nr_mapped;
-		__entry->migratetype = migratetype;
+		__entry->alloc_flags = alloc_flags;
 	),
 
-	TP_printk("start=0x%lx end=0x%lx migratetype=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
+	TP_printk("start=0x%lx end=0x%lx alloc_flags=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->migratetype,
+		  __entry->alloc_flags,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
 );
+#endif
 
 TRACE_EVENT(mm_setup_per_zone_wmarks,
 
diff --git a/mm/cma.c b/mm/cma.c
index 397567883a10..9ee8fad797bc 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,7 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count, ACR_CMA, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4626064705ac..3eea3008727f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2009,8 +2009,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       PB_ISOLATE_MODE_MEM_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
@@ -2069,7 +2068,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			goto failed_removal_isolated;
 		}
 
-		ret = test_pages_isolated(start_pfn, end_pfn, MEMORY_OFFLINE);
+		ret = test_pages_isolated(start_pfn, end_pfn,
+					  PB_ISOLATE_MODE_MEM_OFFLINE);
 
 	} while (ret);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ccb21af002b0..0867e2b2e187 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6695,11 +6695,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
 /*
  * [start, end) must belong to a single zone.
- * @migratetype: using migratetype to filter the type of migration in
+ * @alloc_flags: using acr_flags_t to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-		unsigned long start, unsigned long end, int migratetype)
+					unsigned long start, unsigned long end,
+					acr_flags_t alloc_flags)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6771,7 +6772,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6842,10 +6843,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @migratetype:	migratetype of the underlying pageblocks (either
- *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
- *			in range must have the same migratetype and it must
- *			be either of the two.
+ * @alloc_flags:	allocation information
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6862,7 +6860,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6877,6 +6875,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		.alloc_contig = true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
+	enum pb_isolate_mode mode = (alloc_flags & ACR_CMA) ?
+					    PB_ISOLATE_MODE_CMA_ALLOC :
+					    PB_ISOLATE_MODE_OTHER;
 
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
@@ -6903,7 +6904,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, mode);
 	if (ret)
 		goto done;
 
@@ -6919,7 +6920,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6953,7 +6954,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6996,8 +6997,8 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, ACR_NONE,
+					 gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..ece3bfc56bcd 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -31,7 +31,7 @@
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				enum pb_isolate_mode mode)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -46,7 +46,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (mode == PB_ISOLATE_MODE_CMA_ALLOC)
 			return NULL;
 
 		return page;
@@ -117,7 +117,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -130,7 +130,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageOffline(page))
 			continue;
 
 		if (__PageMovable(page) || PageLRU(page))
@@ -151,7 +151,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
+static int set_migratetype_isolate(struct page *page, enum pb_isolate_mode mode,
 			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
@@ -186,7 +186,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			mode);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -198,7 +198,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	}
 
 	spin_unlock_irqrestore(&zone->lock, flags);
-	if (isol_flags & REPORT_FAILURE) {
+	if (mode == PB_ISOLATE_MODE_MEM_OFFLINE) {
 		/*
 		 * printk() with zone->lock held will likely trigger a
 		 * lockdep splat, so defer it here.
@@ -292,11 +292,10 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
- * @flags:			isolation flags
+ * @mode:			isolation mode
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -311,8 +310,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			enum pb_isolate_mode mode, bool isolate_before,
+			bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -338,12 +338,11 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 				      zone->zone_start_pfn);
 
 	if (skip_isolation) {
-		int mt __maybe_unused = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
-
-		VM_BUG_ON(!is_migrate_isolate(mt));
+		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
-		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype,
-				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
+		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock),
+				mode, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
 			return ret;
@@ -441,14 +440,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
  * @start_pfn:		The first PFN of the range to be isolated.
  * @end_pfn:		The last PFN of the range to be isolated.
- * @migratetype:	Migrate type to set in error recovery.
- * @flags:		The following flags are allowed (they can be combined in
- *			a bit mask)
- *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
- *					 e.g., skip over PageHWPoison() pages
- *					 and PageOffline() pages.
- *			REPORT_FAILURE - report details about the failure to
- *			isolate the range
+ * @mode:		isolation mode
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -481,7 +473,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     enum pb_isolate_mode mode)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -492,8 +484,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_start, mode, false,
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -501,8 +493,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_end, mode, true, skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -513,8 +504,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
-					start_pfn, end_pfn)) {
+		if (page && set_migratetype_isolate(page, mode, start_pfn,
+					end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
@@ -556,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  int flags)
+				  enum pb_isolate_mode mode)
 {
 	struct page *page;
 
@@ -569,11 +560,12 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << buddy_order(page);
-		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
-		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
-			 !page_count(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageOffline(page) && !page_count(page))
 			/*
 			 * The responsible driver agreed to skip PageOffline()
 			 * pages when offlining memory by dropping its
@@ -591,11 +583,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * test_pages_isolated - check if pageblocks in range are isolated
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The first PFN *after* the isolated range
- * @isol_flags:		Testing mode flags
+ * @mode:		Testing mode
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %PB_ISOLATE_MODE_MEM_OFFLINE specified in @mode, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -603,7 +595,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			enum pb_isolate_mode mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -639,7 +631,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

