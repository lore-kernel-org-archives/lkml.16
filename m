Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F3325EF86
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820881; cv=fail; b=FzT/JeGAZbH08tJ/GKefJvVCaQ7AR0lRNUyK0r3Cf4xUxWUHh13r9i64/Etrkt1m40humk1yNRFaea0IoFlGWmbmm+yjV6PZUK3WS3HMypFDFg7h5HsN/zNwAWGs5Wlrftc7DtkiWM9JktIvbDLHZ+crAe5WhfJ8Pwp34Huz544=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820881; c=relaxed/simple;
	bh=siw/w+I5rKjfUkLrzLXzDtz9XKLliBByIWCa5AJJBOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iBPC3E6/X4FeawfcdBN2qDoXHdq9nZLYWG/Mim/ai9n11k3u85+Ch9X5JSSLoXXPz19lnt45EjLGRIptZfYuFDtzRyl3/5TdvNyJeo21ck6NwWh0r5lemHyA+kDNaJpryHcp5GRTu15giDNckLVLdU1Tta8/KuCsr6d1FUoZPIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ChR+LqgL; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ChR+LqgL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCCtwvcmfJUk31V03KfLVgqr6M75h0y1S97pzp7SPyzhwV5uJmfMMxq8k/OGD84dY+9IoenXKB1pJOmoGzn/oxhQJC4k3qYCF0XRmbtHZ+EBMdHM0NJOAW1vTfVNeYj/Qq+FPAgkwLxh0hHdeFnm/RH0OYbEB5KjYo64KfNUPBuXXYVHuzd37ILwgt51DGRFNkND4MQw6wNlY41AS1W1OnROJ2t7dAxE11ydRQ/wx0Fxy1x1yvQPMaVaIlXZUJFL0smqOpMIvfpMwpkrawlEWJDtUYHOkKyekPzWj623WvNcnJ3ZpZsOR7P94nxySayOXDaVJjt3waLv1/tpFOiDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+YkODnP+RXZBO5F7UJutAGnuS4GVqtM99Qb8YM6axQ=;
 b=uyv/llFZdc4Ccw3GlE9pVOhVQH7zEShczOVKa4TQ+PMr3mfPzJe4XQ7Imd20fne5gCoP1QjzExd1tr9BcDOrVyPCkZpz6/lak1ams7g8nStBWcZxXXVlv8Nl8bQFlNo35w1mkc/lMSnd3SA7iiXq3IZT5ujtkQzQ8XbUvTAGHmVUJ8BL3PeE8IRSXaYy+59LwKs1My5gFxEyIGOePEIyja5NKsYCLEqkY4el8xO8QNsuOJlh3RMDVlXuMGKdb6wqM18QvBFvnb2vdWpQPHgXTQ4DczD5qYBLnktLbPphO6xMvWh3lQ8UHf3/+a/CoNcziTjdEX3/0OW8KY+Lvu5hdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+YkODnP+RXZBO5F7UJutAGnuS4GVqtM99Qb8YM6axQ=;
 b=ChR+LqgLvyZV1SuU0NA3uLk0lmgyH5UCMZ81g5j5iyy4nFmNi37/RdTOfdQRoS9AtxFDMj3S17BLgmHnPxMnz1GQkgNTe8Dz2vTSKKhATbJSwtQrt49YbrNpZq2wsQch4cgk7RPScdlxwiVKrjejY9pe277RN8Pk4wq/xaIE1/F5ARmt+268I9JnpL6GpCZjRDNcyijhouXe8NX26jUU4zqzCJqr4QNtqmiZmYUsvdCpOM0XYuxK3szyb3n3ld21SDiCqVN8UOOz1RuziYyeFwSNdxBbTkXhh6JddX7ln09B4r2LO+EXmc7ShEwBKmw5uU9Hl5mAL6XyKLTB0uVS5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 20:01:15 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:15 +0000
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
Subject: [PATCH v4 1/4] mm/page_isolation: make page isolation a standalone bit.
Date: Fri,  9 May 2025 16:01:08 -0400
Message-ID: <20250509200111.3372279-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:208:52f::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7991ac-2dd0-471c-03d0-08dd8f34413b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1BUJts5Jh9Mr9Z7UfB84yMD50qJZQDyr35L/6bsXKPRiORBtAMhe0kZAkkQi?=
 =?us-ascii?Q?i91IIdg6cLVwHrymrqoN1UxmUPW3dnFl1Dq9ywVsNgKY+OYia5dGU9jC0N7X?=
 =?us-ascii?Q?/6CuXtPH5T8C2E65cY4V1T5u8WMOtUazHwFHul+s8u4VfvApGZhHmARSxMQH?=
 =?us-ascii?Q?xc+tzGmU8GTDDATRPZ5T3Lx16jn9tT1wGjeerIHSMvBG8rK1JLQFSEwS7Qiw?=
 =?us-ascii?Q?ZXMteAcX6C+H4qlsYRvtrGpYwVMGqKxngj729/VGCYSP4heKl2+6SPHBB/RG?=
 =?us-ascii?Q?90i6mgwUQJRYAUsf2r18loOpLlV0wPbEagoCQfKOYo0trv936782LZcQ9aze?=
 =?us-ascii?Q?QVsKfJIzXVBW/6KoIG9+SdQtw+rdbyhJDt91156UGxAPoie7MNqbq0nWDgqO?=
 =?us-ascii?Q?J3Q+WCjeRS8r4QKPJ3nS9PZyfP3EPWFmuK58pw8PgYwXUZs35cCiEeN0c9IW?=
 =?us-ascii?Q?g4uTkwFlHM1tZhDxmKBtGkZjCO6vsOaKikre66V+4qzktwuZ03F8SrrygHhh?=
 =?us-ascii?Q?K+HGbimlekmIjn4HjYPS6oXpqOFt86v/9U9SU3M0fJVvJMKrGf+xaToHljsA?=
 =?us-ascii?Q?/KDnPLrSG+Y2CmVMRpW7ROfwa3UZ+i+uMh7A+UaUXjW87pA0R81k+Bk3XOBK?=
 =?us-ascii?Q?/sftPVc1eNLbdGqcX4GYQutJ8/r0YiQxU0snUyNBL2PMK0wBA3SRMt2nH0JF?=
 =?us-ascii?Q?ix+wi7ah4AgoDLP+y1XhmP4nQ4Pln4FAM2C4hSGdWkZZOPZNyoMDP8DgySup?=
 =?us-ascii?Q?mGKlnvzwncUCzd2phMbMYa4S1WZmdxwS+vOUhL+RwYIgelEO0fEJs5QCTx/m?=
 =?us-ascii?Q?lexKpsRB9Q8s4XY3p4mV8QPLs836nEHKwgw936EFC9zkF/qCtT67sLTNPg+/?=
 =?us-ascii?Q?TziBLcW81kmfLHY0Rmubuh91yW9aWfnwf/T9DveIy6v72T88TY29wofJC9zW?=
 =?us-ascii?Q?YlMHe4Zhhu328IPh1fL1vZNkTxwzrUNQQ4oLEiOyBEzV6mI++Hn+R0a97yS7?=
 =?us-ascii?Q?7HR8aCW4Y/M3GGqR4ThAHLIpztH7BX3uP8zgtZ/2jxyTJlnIKg9XN2/WMxE7?=
 =?us-ascii?Q?+rTduJXBSmtg+TESTVAqichKRmEmhAlowQfKvmUSgW2lpbgL68FrzuK2pxQf?=
 =?us-ascii?Q?jUvG5Y9+hpkk8mHqQPMVuYwpVFuY+U4x/Lvrx+ii5gnlLv7GkNAQDr/j4xYq?=
 =?us-ascii?Q?1haadxKCUtxuDaLanQ5hIOhKD3ssswwV0QHSn64Ne4sLFzwWMpsyw1pMgQ1u?=
 =?us-ascii?Q?sVXNDEhbEju6+gSLH7LxxmTpTS2rFgcHYGE7N7nh8X83jFErB3GHfk5phvfG?=
 =?us-ascii?Q?Wev6uxy5PEAwvtHdKY6jh2xbnuXtaXTtzg8y9K0O6SJLMmktxsI2/DQSV1vU?=
 =?us-ascii?Q?Fq5E06aehDFQdA69O/NV+oeZon6l6JBmIawmOZCD9xwsjqz0s6Ss9uJLJYLa?=
 =?us-ascii?Q?plBlMBhjtwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GicnRyp5ipSp90mJY6iJTcR2eh2Q2pYR+igUgXemjffTxoFn+Sfg3sKupefT?=
 =?us-ascii?Q?ppdkLGU6IByECMRadxSrNlCMCNaqwz/64w6MzQR4zIPTEzYCy6zfv7kbWKr6?=
 =?us-ascii?Q?3Xc94Qigq0pagJzguBIg/y+dnd2Gf9l/mM8OQC5e8VrVOWDhqbF//R8FmRQj?=
 =?us-ascii?Q?lHRYtaRtM6H0oV3k/jt50BSc3w5jWoWOp7rKSAKDVMDSkg5gkdByukH36xQV?=
 =?us-ascii?Q?rU3mgb3RW2Fs8oIf2EjchFLUk77Qu4u0+MiStcHH+tucrgrFSev82qJqdZuT?=
 =?us-ascii?Q?o/y1hrB/Rtihb5JLahdSKDJZze3POdWWGERP0azBdhLGvxt3xRziDI5JUywG?=
 =?us-ascii?Q?gidpp6cz9tyog8n8c+vTtMrY/KnodzMtLX+j5fjDxBu2i3eSqKzOz2AXgYC6?=
 =?us-ascii?Q?okke3NG5eGk7JJX9aKLzARFKaOy8+ct3NK7aqeHERYja5YMcaC4tezOjkWMe?=
 =?us-ascii?Q?XVG9pDXtIrAka/9MooxMZmzZq0as3YGnwb8LVZX/R3lANEb/cOvicrC5SG9i?=
 =?us-ascii?Q?fu11x3FgPxAMDds2Sky+YvzeA/SL/AQxP08Re4SIWEXv2LhDX97v2GPPw3Ep?=
 =?us-ascii?Q?vH/piDq3nKVKC+JYB+61pPCXhZYYIS4dp3/6O9ZwgfPitjJCyr+Hi3Apd81o?=
 =?us-ascii?Q?sI/gEDrFBMP4YNHxkqngOEWOjlzedoolWwBL/O2U0pZMLMnEVfl9XH0vu0gy?=
 =?us-ascii?Q?sZNnopPjPt7AA7eMcsk9TpOdnlrFv5zJKeCC1RcPOWN615h6MwOvcDJhzo7I?=
 =?us-ascii?Q?neHDQTlNpAkfoBhSW4nLHZshJvcvv4PDJmcjLkevwY++AW82/9QjMooBiIfA?=
 =?us-ascii?Q?zk7TwL/MMBDi9xhdMn2iawLuQE7S1bSKvbFiK30yvonkJlWCnxnWQZbUXhhQ?=
 =?us-ascii?Q?APn9AeUC4HDsP7JDBSPe7PMWxrYbjqaiezf/bae+VQB2a98+vEN0bxH5SgQw?=
 =?us-ascii?Q?zkwsulVy3CrWpeuAVJrvtWGuIJWH1Q8BL1Vj2FZWjVWkbIjZ8/RzE0h3PkHR?=
 =?us-ascii?Q?J/+js0iwNu0CfweJ26aEsjxdrbbPLhiHJLJhoirx3K7DQG0P8Kqm4gLjAwH1?=
 =?us-ascii?Q?b5nCs4TsL5n6OOuEUC3F0NlR+82NZYg+yUTLx2tOJLcqr0a/9qq5/hqTOj7/?=
 =?us-ascii?Q?nk9GqBEzgaEVoZLFgH3h9lRT3xDN4sIq6zPbky1Bzz97h2QXjSb/Og3fK9nV?=
 =?us-ascii?Q?hlhbSJu2wZy7t4QyvzYbECkGDYBKRy3wpSbxR9C0Z3lYUkTYhcYC6fy5vOkR?=
 =?us-ascii?Q?VJo4Fnw36cLeScs7JPwrnHPSEUuFg4gSxnJzQoQuk0F7WmI8H8VFwpcIcx3K?=
 =?us-ascii?Q?T+otNAn0F/sSiuNw46HspnvA83/9JQ1vgvYUP+Eevpc/0uNlKWakXG6YJTmh?=
 =?us-ascii?Q?Y4sZiczES3xVTlhhHNqXm1vehjDVfwCCtypv0BR3UPT8Mt0Nvcoo8GMatMVs?=
 =?us-ascii?Q?hkVgkajJ5+GqeYLpY5FkybYMsAlneUgNeDbwCgNJRpN+zX9jKaUlYk4ukNSr?=
 =?us-ascii?Q?A//vM3zEZ3KbDGkKRNFdL8kyWq42LJ1I68IhTh02rrbaRiqq0XPAMno5jQFy?=
 =?us-ascii?Q?rCeZSzktLEAyohJgbUV+bxEDgBpNzyqtuQAbhYBG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7991ac-2dd0-471c-03d0-08dd8f34413b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:15.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E19a3gsoej+u6u9G1ayqkaDmZN6KcRIQFbnalckHKIe8Ql9RdjWqpuT4I7gzCI2Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_migrate_skip, so that migratetype is not lost during pageblock
isolation. pageblock bits needs to be word aligned, so expand
the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h          | 15 ++++++++------
 include/linux/pageblock-flags.h |  9 ++++++++-
 mm/page_alloc.c                 | 36 ++++++++++++++++++++++++++++++++-
 mm/page_isolation.c             | 11 ++++++++++
 4 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b19a98c20de8..7ef01fe148ce 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -106,14 +106,17 @@ static inline bool migratetype_is_mergeable(int mt)
 
 extern int page_group_by_mobility_disabled;
 
-#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
+#ifdef CONFIG_MEMORY_ISOLATION
+#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
+#else
+#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
+#endif
+
+unsigned long get_pageblock_migratetype(const struct page *page);
 
-#define get_pageblock_migratetype(page)					\
-	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
+#define folio_migratetype(folio)					\
+	get_pageblock_migratetype(&folio->page)
 
-#define folio_migratetype(folio)				\
-	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
-			MIGRATETYPE_MASK)
 struct free_area {
 	struct list_head	free_list[MIGRATE_TYPES];
 	unsigned long		nr_free;
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 0c4963339f0b..00040e7df8c8 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -20,7 +20,10 @@ enum pageblock_bits {
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
 	PB_migrate_skip,/* If set the block is skipped by compaction */
-
+#ifdef CONFIG_MEMORY_ISOLATION
+	PB_migrate_isolate = 7, /* If set the block is isolated */
+			/* set it to 7 to make pageblock bit word aligned */
+#endif
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
@@ -28,6 +31,10 @@ enum pageblock_bits {
 	NR_PAGEBLOCK_BITS
 };
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
+#endif
+
 #if defined(CONFIG_PAGE_BLOCK_ORDER)
 #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
 #else
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c77592b22256..04e301fb4879 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -381,10 +381,31 @@ unsigned long get_pfnblock_flags_mask(const struct page *page,
 	return (word >> bitidx) & mask;
 }
 
+unsigned long get_pageblock_migratetype(const struct page *page)
+{
+	unsigned long flags;
+
+	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
+			MIGRATETYPE_MASK);
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (flags & PB_migrate_isolate_bit)
+		return MIGRATE_ISOLATE;
+#endif
+	return flags;
+}
+
 static __always_inline int get_pfnblock_migratetype(const struct page *page,
 					unsigned long pfn)
 {
-	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long flags;
+
+	flags = get_pfnblock_flags_mask(page, pfn,
+			MIGRATETYPE_MASK);
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (flags & PB_migrate_isolate_bit)
+		return MIGRATE_ISOLATE;
+#endif
+	return flags;
 }
 
 /**
@@ -402,8 +423,14 @@ void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
 	unsigned long bitidx, word_bitidx;
 	unsigned long word;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
+	/* extra one for MIGRATE_ISOLATE */
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
+#else
 	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
 	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+#endif
 
 	bitmap = get_pageblock_bitmap(page, pfn);
 	bitidx = pfn_to_bitidx(page, pfn);
@@ -426,6 +453,13 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
+				page_to_pfn(page), PB_migrate_isolate_bit);
+		return;
+	}
+#endif
 	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
 				page_to_pfn(page), MIGRATETYPE_MASK);
 }
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b2fc5266e3d2..751e21f6d85e 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -15,6 +15,17 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/page_isolation.h>
 
+static inline bool __maybe_unused get_pageblock_isolate(struct page *page)
+{
+	return get_pfnblock_flags_mask(page, page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
+static inline void clear_pageblock_isolate(struct page *page)
+{
+	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
+
 /*
  * This function checks whether the range [start_pfn, end_pfn) includes
  * unmovable pages or not. The range must fall into a single pageblock and
-- 
2.47.2

