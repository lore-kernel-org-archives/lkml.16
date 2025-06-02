Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D221C1F13
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908386; cv=fail; b=ME4sEY19FDqgKmt1pW/IgOV07BNAHOvb40X6ST+uP6XeUwn4MAhr+d0vi61umZPacQC08NX1+Fj4l9w9EiiXAFqs2n+GpFLz6nscB4dCu+xgYybe6zQfs93LQIC2MzKUPGegnxPaBsIXozVydF9e44U88XRR/2OoZU4MHltAxTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908386; c=relaxed/simple;
	bh=CTAG4sYZwfXNpQc1Ac1m55h4u4WrybEEqbXezJHBoFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfCgLXwaVVD2+a+g9ooQ2OGDh8rvFgujhPaWXXOgFua8xdEX+BrojDgt4admVGece5ExeAvhgeFPzqR4gU2jgc8vxnNEfolh/Tt+StFEbtMTub7Ft+xif4ojq4vANcsmnGzyleavAoIojK9pcQE0+Q9xYThD8PhmWtQygnWVKf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oL5knMP6; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oL5knMP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMb1p6CcF3y8Lu25hewdhrGhkD/iK9eLMVez/KN37367BUIUi1j3mlGv30rNEsWmEw5oz6Dci3XoZE2TzhUdcb3sqYrdJ2Ij/jUVFor85Dxxm5JrtScsxswcfxjzMKj6SIoOvjlMHTRrMI1apw9QGkOwLt7+Y32B1ASpoy2kT3KsRRCYVDfz0+NSnn5wQkq9Zsb6Lhy4Ubn0Zvi265Cvtz++VpP4sgR0Tfd0yKYe6DuGQXJ60qvag4DEPdJ1OCgMG+eJVPqQZr7mm/JPwFPMq6sw7UsnHCMPGgdEEZM32XnVghmRzy40/BMvv+73hZhBFHgs3IDxfeYfLqcZUjpPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwi20KomilEllyctI1+J40cz0JDU1TIzlORODcSer18=;
 b=ZblF6L8sGwofwgvQpCVCQtcAeBpK4iFeUsPB+v1LHx7XoIRyImhBKEqV4JTUBPF4RbUGTi2DfETgSjJhJrZxMK5c+Ti46fpOCL9AXcvdo9TmHOr4L+9lupSqPAoJP5Y6J1Ql+j+sdIs/zxjo+l7vx1TuHtXJbylE8NRPosoYFPwaEuPHSUHsm65mSCtLpD8R9Z5UyzjwTJ3lXybIvisgtGrYrmI3hveQ7tmhFuEElrfv8d3z45pJ9Un5g8eHRXxC1VOibKRt7av5XbuJ3n9i+b3fr08xeQJ3CgS13WGbe2geEENuLwyMLZXJMHNMHZCVrnrKs89m0KKfUCnFVhYfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwi20KomilEllyctI1+J40cz0JDU1TIzlORODcSer18=;
 b=oL5knMP67IfmTV3sXs7UmoopVtQs8YmjxIe+1TH7pPFwpG48HPkYuBitsLD1EcXj+QiIvU7AZiHIVSdiHCDzupLit7YGPOSm8oELuGbFI7OLgwa+1s/ptbRUBaf5ErgFMfQTkgszgCSt9SZUABlxK4aaQiB0ZFMdZsyleISxDXORhIsUc7OQKLF32zF/Oert4JF2iqOIq15La7OqKrNYXmEcsLVYkWBRyf0snlWcleJoV+f7jnYFO53id7GpmWlvaOJvXrA1mIaJMSTwCxNBvdFEbAvHpviWr/qy+L8zPn/MCyjfTmnDwckwyEV7Blca9+fdFa8CFQnCOBqEvCL10g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:52:59 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:52:59 +0000
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
Subject: [PATCH v8 2/6] mm/page_isolation: make page isolation a standalone bit.
Date: Mon,  2 Jun 2025 19:52:43 -0400
Message-ID: <20250602235247.1219983-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:408:e5::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f0f769-40d3-4bf8-bace-08dda2309a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?niof8WsMIp6BDCL86KcuWYgnD/+Svt+V4Y6PDm3rOFAozP0DmUAV9/hrE73z?=
 =?us-ascii?Q?DtNLDe8CVW9TDBZP3cUupNuennTnrU2sMYWkN8h21noS0UKgS/rm/rxUC+cI?=
 =?us-ascii?Q?iRTJhXpF8ZVgaNF//gli8UNoeBiyVDnmck8R8Hdvd8eTEIXZcaJaXHi6asEA?=
 =?us-ascii?Q?GUjPNKkDewQlDPvbUwOA7j3YujLvIptfP9xBH5j4oN0lGsLznw9vsaqjSetV?=
 =?us-ascii?Q?kxeeu0LaYMbLZ1yqkIQTIwfrdHIx/BvkzfLgfa8jG50u+8veEMLoCMj98w9V?=
 =?us-ascii?Q?XPOhVh1PDwbVJoDeMjjLLzMJBmz1JPx4zmRShglYp3tZw8DAX/bUfZAibJHo?=
 =?us-ascii?Q?Gy0WxmVsgjzfrgXzL5qEqzfLT5vp7hfgfR4BMhwYDCHE0C9DMTugV/KoVgfb?=
 =?us-ascii?Q?FzlaLVsZ+ic75GyYrH68egcWc9GJiwpkW/O/ZF2Wm92dJV7PzK7fCpbFWrpX?=
 =?us-ascii?Q?S9A7qjMJ4ro/+AuHJX15C7eJ3G9T0kw5+H2dA/Dvb0olUY6bVeN6S+5gVwfJ?=
 =?us-ascii?Q?1A1yOo1KxTCiKWA4clIAkU1WBfC0EXjn4QTbOc/Q1TvvZkSUlfzhGIEDBDvN?=
 =?us-ascii?Q?bNVQvmFisQ1BCGFhaybjSQwb55VS+hGhNgVoFXlDqe49wWTXVJVSDhqFeRpK?=
 =?us-ascii?Q?dWDKuc4+xVRF/NAnYE4SNwppRG2TQ6v91Yq+zW2paUISWHUFBLuGWWwNj7T0?=
 =?us-ascii?Q?oud35jMhmrtpgKSAPTyL3lLKHAQngrDksnIU2O8PeyXEHVrMhQU/vYGbkAOC?=
 =?us-ascii?Q?+puGm2QJtWv5QZZuhW5/+atYVdYqNA/9Ah7M889mJYFDvOmwrbEjfTkc1IN7?=
 =?us-ascii?Q?NT3ElQgAexz4Dlih4FfqmHF1Rx2Vojf/NwxU7+H9OVkQFiykFTpv1VGNsNWZ?=
 =?us-ascii?Q?CZ2N5wE+pBPKr/+H3pJDH+ua5/Yid9l9GIiAiWMzzJUlhOPpw8v6dYvdMOQM?=
 =?us-ascii?Q?RM7nyn18hYNOLDZ80ajORx/vZ4b1n2n86n9DF6JQIzCqwwW75yHTp0Jd1/Ab?=
 =?us-ascii?Q?9lQxAwFo7wJzmuurJwPoftJYu5Nar3p70RLADlETHJZmO9gd7y4+sv6VKhp7?=
 =?us-ascii?Q?W77o4kiPja7StrJgAgM27eG/1hCUgSfosc6J01z6jVWBpQIaPgKahZAhwaU3?=
 =?us-ascii?Q?DEUY+5NSOq/NZNyND1WCl/0xPiuLngv6J2u0370hq56RRMjBnwuqou3KGjFL?=
 =?us-ascii?Q?ccyA/TtSqQG6ftObsj1gZ3jXapCkAVMJ1cLdp/I6UvuiKj4+TzaG9wz9qahT?=
 =?us-ascii?Q?7aW4wWnOEcwbZwuSF4TLSKVN8kndQVxkVaXpDromZlVO4PFEYDMHYd3p0D98?=
 =?us-ascii?Q?UyoVvHuz4Y4MFH/Nk3/hGUD79jLCACveZSwYy7OXMiIW7rZp4pUHCISVu5Vj?=
 =?us-ascii?Q?ud8yc0Y4Uk50DVkxvkRDR2J0WHv/PIHg2E/exI4miY+++AXfRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BFHkjTNj+WdpHHJLWIzELgwjxy3f3oJH4EfBThy79X/kWyRIW87lSdp/ImSF?=
 =?us-ascii?Q?90whpgK1q3KjL5WRvjSPWQDSdzEVdyhzBF79vfb9g5zRN3YPt9+Uy12rFC2G?=
 =?us-ascii?Q?Iz1SFYPSPCH1nZS5gCtYKXVEaOsQd5rTNd3y8/Rx3LSNyO7woxQDJGrLm2fV?=
 =?us-ascii?Q?jwDRV4D9OFLw4eDH6l/G9yEQYS0KVaNW3twXIbBwNWDTxpXu9B3ZH0/Rx2HX?=
 =?us-ascii?Q?qSN7gm8v2dk2luLKY+93Y/Qr2X+DXlIza8c3Ii44tSwkjNPvv7jNGRq2B0a3?=
 =?us-ascii?Q?1FhzBeAz1kaRE/wR86rk5P+zp554iSzq36ba9hTEPn0wJdS1WgIRawivQOG8?=
 =?us-ascii?Q?bvtefwzP/f3fgu/FMpGzM7HZE8rNaC8yxftLsD7z9ktK9x9Q9LLDF+RR7fls?=
 =?us-ascii?Q?ca6dswvByiVuQOFUeH2nxLtkbe0KdiL5krxEAIJWi4p3S/2O/OSnf9qdgjeE?=
 =?us-ascii?Q?cy5P/W9Lz6J5hZE16mEgPy507By2sJ7nPwhlSFbv3FQRN0NwVSoq+BSUquHx?=
 =?us-ascii?Q?VodRBKb03/fkgRlVFORn4RhaJ6poEcnbiD6UG+rExZcg+4zBDaspl+xaN2fF?=
 =?us-ascii?Q?j9EkIwKPZgxA6QQALgX6hOKBXrXKWQiEs2TdxNIVx/I5g5nj32bpXzNQ2ICP?=
 =?us-ascii?Q?vfGsjGeKfEuJKhZy4va0SvIdnYpuOjfl91dFmJVnSKQyFAZu5tgi1LnwPA2Y?=
 =?us-ascii?Q?d3JRWtulRIONd6CyEa2E2Xyeh8NShXg7NL5uaW44NQXtFwHyr6XxmIy0RbYj?=
 =?us-ascii?Q?a8BlXw02RjkZ8nNm438IJNiGNfWPMkY60K3jA3Bd/Dxnhro53UZoX9DgnMeu?=
 =?us-ascii?Q?UrvZPCkWb9ynRG7w2g6rgAy6OVre6d5yUZQM2LfXs52ZexUCma211VwM5g3Z?=
 =?us-ascii?Q?NJPtJ3SUP2KXWNMIyE8eOURJrHlTaebLGYUEErlEsBX4vzKvBs3keNaBQg7i?=
 =?us-ascii?Q?AEP7dithbIyjW+Hidh5BgIOUvws9l/XvTa5bvBBbYg6UUHngilD03Wogq8kn?=
 =?us-ascii?Q?l2hVCChKOAa1D8szflkZ8oJ4QAfhaEZqDQTL3ziA1JaxGv9owdO3J6mkwg4H?=
 =?us-ascii?Q?9JKtsJ2ezvmZNaE/qgzdg9zS2eY5LYe+M3hfmVQ7ny6RE/1DqF1fSGEms8/T?=
 =?us-ascii?Q?W0WGNk0op3oA/F6P5CKkgaNMx9Rx7V+sgVHDHPCQHH6yDqaEgBDCq/3PvzSU?=
 =?us-ascii?Q?tFRlcO5EcEVWdBi1c8Pi4kyAaph0Nfly7l4Nkey7Y9rpASp9UUzEYCBwA0Qu?=
 =?us-ascii?Q?2s3D7n3Dje6BgtpZHIz2325CqiJAccvad/4U2YUjs9Z2Ne/P7lR5Ywj3XfLK?=
 =?us-ascii?Q?CD9TDpThkFJ3qQvp4LygPDLi9pp3HOKOoWQQhNahjAQOXGivNWZvKsMRpNIa?=
 =?us-ascii?Q?QSCMk8EGnibXr6x2nvBLSCUqay3/gNc+150M8SAF5jLonNR8dqpZBhItEMsW?=
 =?us-ascii?Q?2OQUsPkw7Z2HZsImR2wE0JLewVOnhlRpaT1s/C6pFb/N7pZrmppYya87TGAu?=
 =?us-ascii?Q?EUMhF0z+4Z++HAK+JfJVgOae5X+Fz1YsAX7pX87TLy19KMTn6LxE6Otalr6d?=
 =?us-ascii?Q?gA4CVp0PVDQUptSezERS04H93oM0Ni8+q6L1283i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f0f769-40d3-4bf8-bace-08dda2309a96
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:52:59.3585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8QNBvSYdKtxrcc/MGnbykWd6+YDturH1/5qGm0/J75DxeWE1t/7TmxHlHoUM7x4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

During page isolation, the original migratetype is overwritten, since
MIGRATE_* are enums and stored in pageblock bitmaps. Change
MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
PB_compact_skip, so that migratetype is not lost during pageblock
isolation.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mmzone.h          |  3 +++
 include/linux/page-isolation.h  | 16 ++++++++++++++++
 include/linux/pageblock-flags.h | 14 ++++++++++++++
 mm/page_alloc.c                 | 27 ++++++++++++++++++++++++---
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 392a03e37610..0a5cdc52b405 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -79,6 +79,9 @@ enum migratetype {
 	 * __free_pageblock_cma() function.
 	 */
 	MIGRATE_CMA,
+	__MIGRATE_TYPE_END = MIGRATE_CMA,
+#else
+	__MIGRATE_TYPE_END = MIGRATE_HIGHATOMIC,
 #endif
 #ifdef CONFIG_MEMORY_ISOLATION
 	MIGRATE_ISOLATE,	/* can't allocate from here */
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 277d8d92980c..fc021d3f95ca 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -11,6 +11,12 @@ static inline bool is_migrate_isolate(int migratetype)
 {
 	return migratetype == MIGRATE_ISOLATE;
 }
+#define get_pageblock_isolate(page) \
+	get_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
+#define clear_pageblock_isolate(page) \
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
+#define set_pageblock_isolate(page) \
+	set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate)
 #else
 static inline bool is_migrate_isolate_page(struct page *page)
 {
@@ -20,6 +26,16 @@ static inline bool is_migrate_isolate(int migratetype)
 {
 	return false;
 }
+static inline bool get_pageblock_isolate(struct page *page)
+{
+	return false;
+}
+static inline void clear_pageblock_isolate(struct page *page)
+{
+}
+static inline void set_pageblock_isolate(struct page *page)
+{
+}
 #endif
 
 #define MEMORY_OFFLINE	0x1
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 451b351c689e..1cf5f0fbd627 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -21,6 +21,13 @@ enum pageblock_bits {
 			/* 3 bits required for migrate types */
 	PB_compact_skip,/* If set the block is skipped by compaction */
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	/*
+	 * Pageblock isolation is represented with a separate bit, so that
+	 * the migratetype of a block is not overwritten by isolation.
+	 */
+	PB_migrate_isolate, /* If set the block is isolated */
+#endif
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
@@ -32,6 +39,13 @@ enum pageblock_bits {
 
 #define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
 
+#ifdef CONFIG_MEMORY_ISOLATION
+#define MIGRATETYPE_AND_ISO_MASK \
+	(((1UL << (PB_migrate_end + 1)) - 1) | BIT(PB_migrate_isolate))
+#else
+#define MIGRATETYPE_AND_ISO_MASK MIGRATETYPE_MASK
+#endif
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 74cb7696e527..5de23eba0db8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -365,8 +365,12 @@ get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
 	unsigned long *bitmap;
 	unsigned long word_bitidx;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
+#else
 	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
-	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+#endif
+	BUILD_BUG_ON(__MIGRATE_TYPE_END >= (1 << PB_migratetype_bits));
 	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
 
 	bitmap = get_pageblock_bitmap(page, pfn);
@@ -439,7 +443,16 @@ bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
 __always_inline enum migratetype
 get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
 {
-	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long mask = MIGRATETYPE_AND_ISO_MASK;
+	unsigned long flags;
+
+	flags = __get_pfnblock_flags_mask(page, pfn, mask);
+
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (flags & BIT(PB_migrate_isolate))
+		return MIGRATE_ISOLATE;
+#endif
+	return flags & MIGRATETYPE_MASK;
 }
 
 /**
@@ -519,8 +532,16 @@ __always_inline void set_pageblock_migratetype(struct page *page,
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
+#ifdef CONFIG_MEMORY_ISOLATION
+	if (migratetype == MIGRATE_ISOLATE) {
+		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
+		return;
+	}
+	/* MIGRATETYPE_AND_ISO_MASK clears PB_migrate_isolate if it is set */
+#endif
 	__set_pfnblock_flags_mask(page, page_to_pfn(page),
-				  (unsigned long)migratetype, MIGRATETYPE_MASK);
+				  (unsigned long)migratetype,
+				  MIGRATETYPE_AND_ISO_MASK);
 }
 
 #ifdef CONFIG_DEBUG_VM
-- 
2.47.2

