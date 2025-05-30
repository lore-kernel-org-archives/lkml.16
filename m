Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F422D7BF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622167; cv=fail; b=eDqYQ61vUDzzUmM26Y6q9WCN7oOn+E2sxWgigNtLBpFeyqVsWcWAPYqTxTXbDHI7JV40uWjmbdviFPhiJM/MvWSOkXtEn/AxtVP0I93eqjPMC+N5y88dJSBJXfvf6BJB1Zs+QRLpMhRbVMw0yBAcUZTlKWnou6bVSx/0b6Pfhtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622167; c=relaxed/simple;
	bh=VBOven1z9DwX0i2cJZT3s0wMPPXL1hFYLuID8diWdxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L0lWwPXcZceNEyoKhcNJpjXmR7HOs+bZPYx5pRmDtNkeVLKle3rcl6F2rN3Puwup96S8uyLHP4Oba6OEJmY22Kprj2OTtutVuAWVM070fXryxGp/rzOx68MBZfXELMt0ZRLFvEmiBRmzLb8ZxZdUxWImcTXQdGgjp0QPnA7kx2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VV2xd/0E; arc=fail smtp.client-ip=40.107.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VV2xd/0E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pha4Y7MSWD945GBcwbSdbZD+n4YYx+GbmwNItJjsK141eAdiT5Q6iuyUANdxKIA8ed+aQMUFh3YjXWgSfvB/fMMtyIbzr/hGzIH026jLyc/io9t7tNQobKhs6S/Aa4HHRi/YhY0Z452fvScWD5kagn43zAtLSYkrfhkwqudD4D92FE4CcqFbfDdeggYBGsNaTxQt4BHZ2lxYz6HWaZXI4oSpmdcumkBRbWSyEyoNLR7LlTOOPtAKGKWxtmhXhClU6d7uVGQU885JPpL+ozCOVhii9Tb+R6UdIiynyAKs5vqfOsQPVTPpY1JBTiqoolAbWL8y0F87T4+VxB/XZTET3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz1Zb+kfv+xcRFBOLl0PvJfG59HBvmSkJQMvhf887Q4=;
 b=ZseOclNutLBTdbm6G3sCJoNgqzF7/yGOxj2C799lq+VDmxb/h5+6pP3u0Jp3oag5QsxPeClharUN1S8dKw2NbrsexFT/du+Fbz6sDQHdU6fqWWYNp8P/Gp2XvrPO23FwY9aT6VVrtpLhsLL9kOIYVfI+SWDhh8dG1H9g0y28dHimV9maVB8intI4S2eiBLTDtBMslwm2bedSqFrNgIsbuQR8UV8xMQtaNA96r06uA3rlolZS9gfGQf8zRrYeKxYSvniJDN/QFv6LkO5JBfXatgpGz2DOzad4OxkoA2Wrd54eoqqVaFpkWblFsZ8CeLTltiqi/Mfn/Dz3joKVLc+NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz1Zb+kfv+xcRFBOLl0PvJfG59HBvmSkJQMvhf887Q4=;
 b=VV2xd/0Epph3FqYO+d7Ye++lQriSrkutI1Kn6TLGWrG6GTN3QVKyRreNSnyOS4igSkIWZV/1zG9nkaGCauexPlf9GmkI9Dd4rox0d7EMWWikRWVPeUyxjagXhplJI2HiWMi8Ea8BY5+bcsQ4U42ujGUEWofIiWGJP5Xp819o9eUUJr3TH7uyeKk5G64/Nki1SBeq8KreXEZK6hjLhqafokEW6Pux50A3ruyteQ0h0Rx7yp/6xO3vq6uCAXV6rzowW2YCA0RmZbTfbHx5W3gP6ufEidzr+yKBsmDuDVExCIlY6zUTWM27iG1RuyKiSvXEqnl7cE39GzjFbM1s7zX+FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Fri, 30 May 2025 16:22:39 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:39 +0000
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
Subject: [PATCH v6 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Fri, 30 May 2025 12:22:22 -0400
Message-ID: <20250530162227.715551-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0012.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d38e52c-d3f7-454e-0beb-08dd9f963239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqJdAkfvxFWJiRCffkWtdwLb0587uMQj0F24YuecC4gt3VdJ/Xc46gJOq4J0?=
 =?us-ascii?Q?ZPkCVQ7xZunzlnSA4T5PUGXvYbN41HPes1abcXJ9ea0LTW12h5pw/xt3eg0O?=
 =?us-ascii?Q?ZaHSDJwg+GfIX/Tqubq0Dm2kG8yguk52ZKlWrRO+wcuq4a5LdXRA8fEebNK8?=
 =?us-ascii?Q?vQNTx7xwfKDPQpxrhmPBunw8rSxvd8U0iQeQIqRJO0W1LRL7s5mNBOVN7NOR?=
 =?us-ascii?Q?JtF4sfn6hOiNiRpWTkCeBdeBiOaLTrjtvGMWWfF5Du8Wo67ZFGm9+Qn4KI3a?=
 =?us-ascii?Q?q8tL9jvQf+bbCYij7Fwn2obReXIFHCXLr5g0lVM1YxgQMVq1hpdyBpacW6xE?=
 =?us-ascii?Q?7sj9h0mrfmXbHcsu9vQ8HNOO5nBDRLGnhFQ3C1zbRAnqnDdFPl96GGQLICNG?=
 =?us-ascii?Q?ebz9WSh5xtHSMEY6PihXWVbKn6tR2lzlkLvcm3RLP5lXM67T9YYq3tJrDP3e?=
 =?us-ascii?Q?zrrTQcjcw/Qgiz1DgOj4GzmQ8zZVghcnTUnQ9MJvHOWz4UMHttG1msmBl0CR?=
 =?us-ascii?Q?aVnRya/PyE68Z/8T0Jc91//65+tzY52JdX1SC8rZjfywGxExXruAAxZQbQGb?=
 =?us-ascii?Q?CSKLAp7xED90qzt6vsIa0XZnESqr1mTSS4W8BrYiZEYErZFstCqWwJGouuan?=
 =?us-ascii?Q?HhoWaQKjN215O65ENkgMAL72mMwY/Gvj+eEM5FXWok8UTztrO3M0BewTn4pG?=
 =?us-ascii?Q?iOH3wxmkhfJulKuYWjnokszjRYaMPhsUUaOtmlP1D7ucF6M8PfKoqJI9vnyv?=
 =?us-ascii?Q?0MOkRggIMDlPQ+NZ0dD8KM27UzoQY9xEYJIrVDEwt70JCkzlsINDpyU2jqvQ?=
 =?us-ascii?Q?K6Kx6E8IOONQzkQrgVozKfDYptj66Q3G89V45t8Ax7N2mhOAne1kShLEsugy?=
 =?us-ascii?Q?Lr9NHKVQM/mhbvk21d0FfnS2eGRH2Lc6nknvClXduS4N0MACpgW2z2h2miMN?=
 =?us-ascii?Q?81SIA2a+pkwAl4cevbv/ovyak55kp7Z0A126JKargiP6yn1NEU/kiSl8Mut0?=
 =?us-ascii?Q?FEqCdrhqZdNIAOABq3z6aSkQuWUjB9DNQRc+Dxn4C9A/vCfQ72957RN7NSPj?=
 =?us-ascii?Q?nG76Sw6DUYy+JRapxjdWJW4dpaQqDJYfGSi7vAYE0b0HhhnPy19CGO/l+313?=
 =?us-ascii?Q?m7jwmX12Z3d3ArkcyNXowzPq9Lat7NmwUKAkcpMlu3C+hAGS9yXXw3BywSp9?=
 =?us-ascii?Q?/6J266fCaC8h2PvmPxkfnXcvnbz+AOPZcZ5ZRWXDNI8NsAHF0i6afy2pw3gj?=
 =?us-ascii?Q?oSyd6TTo9BnfRQkE2KT9BhwPbQ1Yg5p8FIcnBoAfJ47P6TZRZjrFpcRUjVQs?=
 =?us-ascii?Q?1AEVwEiee/71k/SCAAh+977OFAZAntMuvjMLaaOmOEOjWvYuT+CrPWQFxEgX?=
 =?us-ascii?Q?gq5+1iQ+Nx2wPVVo+mtW8ZmH//xWm9dagp+qBPnWpetFsX10ZPHgi1xAOvxN?=
 =?us-ascii?Q?bHnI/uUfJMI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5OReM2x3fMALRlxAWFxaWx+KLd9m/dtzAXEnRKJP6L42RHvUSrlayj9cL2h?=
 =?us-ascii?Q?jRMwDRZWGnIswoNQ8lBQzLioLmGPOgAMsbZShdn7zkalWRhqp6XxOMorVVFj?=
 =?us-ascii?Q?Bdrk1r8Z8Ic9lWGavJ4MUTDjCt+MU82Rn6Jb5A6w3U0CFiLLbLqn8DAo5QAn?=
 =?us-ascii?Q?Yqp15j/iNnMoEnCNEIRHrZDpu/loswwFSWTdbrVKvlt5lSGT22pWKesClOS4?=
 =?us-ascii?Q?WAdArJL9ATLK5sUv1fZ686Bgdi0BL1uXifJuvOXnsA7RTBeZxcct4TNTgbHV?=
 =?us-ascii?Q?GX4JXCsTPEgXx3o7djtKjW7tT5rARR+GymsuTtDwcNoGzCnWsCX/VfiHeaKX?=
 =?us-ascii?Q?1D7AV8p3UJ/oLQ8tEURF4vC2Jsdt2yL6UQRwmNlZ/I9pn9PYqD2NKII3nP+Q?=
 =?us-ascii?Q?00PJ55Oc7nUXWOKbXWn6aK/3gyeOAiMJN03soNg+p3EwNll6f/p2qTPkpYRf?=
 =?us-ascii?Q?GQEf5kxUd30idOlzKVvbPgyV3AzXd2Fm9eHVYamnUs/Pl8EUPKiIUmVo8ieA?=
 =?us-ascii?Q?Jm5QbXNssg55C1cv0tyAN9kpQZEgkuQxUqfAxialRGdm14VcTwQirPvdlZss?=
 =?us-ascii?Q?dAOGpMJ0Qvbg+lGxWdMmIQ1DdWowsO1F/etd0kSIrrPPSdoS+XrvOi5MAa2+?=
 =?us-ascii?Q?v18HEjMdiQOmT5lBnTRRzC6sLRB09lpywCoTkT+8aiB2/J+0Kyyw4SqAywBk?=
 =?us-ascii?Q?Ob7Hhc4XhPKqE96QqZcDCGJ/tD2XA+MbYiXby85bPfs5I7NfS/6YxA02Nxut?=
 =?us-ascii?Q?LwdMjySVKXrvpV4XqkPbUR92fPhfnfEfYtgbj+UfateOQlIG7fu6DaLKZyeX?=
 =?us-ascii?Q?q0eP+L5m2T0JKkzfZn26OuR9mouv4FSAFSduErVPrqqfw7niNBmBofQi+pg3?=
 =?us-ascii?Q?U5Xo5UTdjFnZpKxa6SkIzQkbFi8BGvmVzG1rMH4T0AFsQi4IaA5GndMcUjwJ?=
 =?us-ascii?Q?6rA3atIekuialrR/zqF0UYAw6FwIJgDyiW1YLQ9lx1pfzKt84H2uhB5Ax8nR?=
 =?us-ascii?Q?hhJRZQpgc5j8CZ/6w2SSZImxcyxlKR0tIol5abq84ux89xU4a09nz2M1fJ/w?=
 =?us-ascii?Q?3M299/BI4GuHzYknlQZan2UWmDiDnn/yhI1LOB0+j6xYBpk4CGfRQ9wiYESG?=
 =?us-ascii?Q?NDkUEgq080e8OXj+eP3VvFCAHBnOliL8+aCeUlCyvcOpI3MIZmsoXQYHnDD5?=
 =?us-ascii?Q?P5zxUDIc1KK+1R0/fIDzIk+b6NUQ601cDMlxJLeHy/oEx+LxxEBIsH/FqTtd?=
 =?us-ascii?Q?TgEwm9zTBQSkb/Zw1LBacgnBmBJV8suBODiDqnHYxaTQrKDBnDSgplH2Xnjy?=
 =?us-ascii?Q?amAoRVHiwexmEA5XiXSV29z8lxPizlcmLyqvFEEUcuF9aC/89cBuUXy16Yh/?=
 =?us-ascii?Q?OxvAQdFBOdUR7hG98yuCncrcST5ZCbkEOoSSd+AMjl0WwPsN3EA2fH4r0xoX?=
 =?us-ascii?Q?brrG7TdLHvsFL1TgWKLeuio0XYSrELv14w30BSF4sQ88mjsHguLaUQgI84Wb?=
 =?us-ascii?Q?5AWC2NhfrN2WDFsEkZLqRuSmMyeRERTx3284cvKYeUORh0pmoeqFIf6i0ATR?=
 =?us-ascii?Q?C/7Bk0FWQ/V9Gyc7qcsBSSlkJdnhdy6SBdfGJglO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d38e52c-d3f7-454e-0beb-08dd9f963239
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:39.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0j0beXrkRLg4WeP+PkzI+k4pptfZHCaXhyEh8SDPlUTofXKTkbgRjw01c8Vkglu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187

No functional change is intended.

1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
   roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
   right amount of bits for pageblock flags.
2. Rename PB_migrate_skip to PB_compact_skip.
3. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
   like PB_compact_skip.
3. Make {get,set}_pfnblock_flags_mask() internal functions and use
   {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
   flags.
4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
   PB_migrate_bits.
5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
   to use get_pageblock_migratetype() and causing issues.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 Documentation/mm/physical_memory.rst |   2 +-
 include/linux/mmzone.h               |  18 +--
 include/linux/page-isolation.h       |   2 +-
 include/linux/pageblock-flags.h      |  34 +++---
 mm/memory_hotplug.c                  |   2 +-
 mm/page_alloc.c                      | 171 +++++++++++++++++++++------
 6 files changed, 162 insertions(+), 67 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index d3ac106e6b14..9af11b5bd145 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -584,7 +584,7 @@ Compaction control
 
 ``compact_blockskip_flush``
   Set to true when compaction migration scanner and free scanner meet, which
-  means the ``PB_migrate_skip`` bits should be cleared.
+  means the ``PB_compact_skip`` bits should be cleared.
 
 ``contiguous``
   Set to true when the zone is contiguous (in other words, no hole).
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 87a667533d6d..392a03e37610 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,8 +92,12 @@ extern const char * const migratetype_names[MIGRATE_TYPES];
 #ifdef CONFIG_CMA
 #  define is_migrate_cma(migratetype) unlikely((migratetype) == MIGRATE_CMA)
 #  define is_migrate_cma_page(_page) (get_pageblock_migratetype(_page) == MIGRATE_CMA)
-#  define is_migrate_cma_folio(folio, pfn)	(MIGRATE_CMA ==		\
-	get_pfnblock_flags_mask(&folio->page, pfn, MIGRATETYPE_MASK))
+/*
+ * __dump_folio() in mm/debug.c passes a folio pointer to on-stack struct folio,
+ * so folio_pfn() cannot be used and pfn is needed.
+ */
+#  define is_migrate_cma_folio(folio, pfn) \
+	(get_pfnblock_migratetype(&folio->page, pfn) == MIGRATE_CMA)
 #else
 #  define is_migrate_cma(migratetype) false
 #  define is_migrate_cma_page(_page) false
@@ -122,14 +126,12 @@ static inline bool migratetype_is_mergeable(int mt)
 
 extern int page_group_by_mobility_disabled;
 
-#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
+#define get_pageblock_migratetype(page) \
+	get_pfnblock_migratetype(page, page_to_pfn(page))
 
-#define get_pageblock_migratetype(page)					\
-	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
+#define folio_migratetype(folio) \
+	get_pageblock_migratetype(&folio->page)
 
-#define folio_migratetype(folio)				\
-	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
-			MIGRATETYPE_MASK)
 struct free_area {
 	struct list_head	free_list[MIGRATE_TYPES];
 	unsigned long		nr_free;
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..277d8d92980c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -25,7 +25,7 @@ static inline bool is_migrate_isolate(int migratetype)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
-void set_pageblock_migratetype(struct page *page, int migratetype);
+void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 				  int migratetype);
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index e73a4292ef02..451b351c689e 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -19,15 +19,19 @@ enum pageblock_bits {
 	PB_migrate,
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
-	PB_migrate_skip,/* If set the block is skipped by compaction */
+	PB_compact_skip,/* If set the block is skipped by compaction */
 
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
 	 */
-	NR_PAGEBLOCK_BITS
+	__NR_PAGEBLOCK_BITS
 };
 
+#define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))
+
+#define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
@@ -65,27 +69,23 @@ extern unsigned int pageblock_order;
 /* Forward declaration */
 struct page;
 
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-				unsigned long pfn,
-				unsigned long mask);
-
-void set_pfnblock_flags_mask(struct page *page,
-				unsigned long flags,
-				unsigned long pfn,
-				unsigned long mask);
+enum migratetype get_pfnblock_migratetype(const struct page *page,
+					  unsigned long pfn);
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit);
 
 /* Declarations for getting and setting flags. See mm/page_alloc.c */
 #ifdef CONFIG_COMPACTION
 #define get_pageblock_skip(page) \
-	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
-			(1 << (PB_migrate_skip)))
+	get_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define clear_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
-			(1 << PB_migrate_skip))
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define set_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, (1 << PB_migrate_skip),	\
-			page_to_pfn(page),			\
-			(1 << PB_migrate_skip))
+	set_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #else
 static inline bool get_pageblock_skip(struct page *page)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..4ce5210ea56e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -797,7 +797,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 
 	/*
 	 * TODO now we have a visible range of pages which are not associated
-	 * with their zone properly. Not nice but set_pfnblock_flags_mask
+	 * with their zone properly. Not nice but set_pfnblock_migratetype()
 	 * expects the zone spans the pfn range. All the pages in the range
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cc9577a27ec4..74cb7696e527 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -353,81 +353,174 @@ static inline int pfn_to_bitidx(const struct page *page, unsigned long pfn)
 	return (pfn >> pageblock_order) * NR_PAGEBLOCK_BITS;
 }
 
+static __always_inline bool is_standalone_pb_bit(enum pageblock_bits pb_bit)
+{
+	return pb_bit > PB_migrate_end && pb_bit < __NR_PAGEBLOCK_BITS;
+}
+
+static __always_inline void
+get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
+			   unsigned long **bitmap_word, unsigned long *bitidx)
+{
+	unsigned long *bitmap;
+	unsigned long word_bitidx;
+
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+
+	bitmap = get_pageblock_bitmap(page, pfn);
+	*bitidx = pfn_to_bitidx(page, pfn);
+	word_bitidx = *bitidx / BITS_PER_LONG;
+	*bitidx &= (BITS_PER_LONG - 1);
+	*bitmap_word = &bitmap[word_bitidx];
+}
+
+
 /**
- * get_pfnblock_flags_mask - Return the requested group of flags for the pageblock_nr_pages block of pages
+ * __get_pfnblock_flags_mask - Return the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
  * @pfn: The target page frame number
  * @mask: mask of bits that the caller is interested in
  *
  * Return: pageblock_bits flags
  */
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-					unsigned long pfn, unsigned long mask)
+static unsigned long __get_pfnblock_flags_mask(const struct page *page,
+					       unsigned long pfn,
+					       unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 	/*
-	 * This races, without locks, with set_pfnblock_flags_mask(). Ensure
+	 * This races, without locks, with set_pfnblock_migratetype(). Ensure
 	 * a consistent read of the memory array, so that results, even though
 	 * racy, are not corrupted.
 	 */
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	return (word >> bitidx) & mask;
 }
 
-static __always_inline int get_pfnblock_migratetype(const struct page *page,
-					unsigned long pfn)
+/**
+ * get_pfnblock_bit - Check if a standalone bit of a pageblock is set
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to check
+ *
+ * Return: true if the bit is set, otherwise false
+ */
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
 {
-	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return false;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	return test_bit(bitidx + pb_bit, bitmap_word);
 }
 
 /**
- * set_pfnblock_flags_mask - Set the requested group of flags for a pageblock_nr_pages block of pages
+ * get_pfnblock_migratetype - Return the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ *
+ * Return: The migratetype of the pageblock
+ *
+ * Use get_pfnblock_migratetype() if caller already has both @page and @pfn
+ * to save a call to page_to_pfn().
+ */
+__always_inline enum migratetype
+get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
+{
+	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+}
+
+/**
+ * __set_pfnblock_flags_mask - Set the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
- * @flags: The flags to set
  * @pfn: The target page frame number
+ * @flags: The flags to set
  * @mask: mask of bits that the caller is interested in
  */
-void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
-					unsigned long pfn,
-					unsigned long mask)
+static void __set_pfnblock_flags_mask(struct page *page, unsigned long pfn,
+				      unsigned long flags, unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
-	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
-
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
-
-	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 
 	mask <<= bitidx;
 	flags <<= bitidx;
 
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	do {
-	} while (!try_cmpxchg(&bitmap[word_bitidx], &word, (word & ~mask) | flags));
+	} while (!try_cmpxchg(bitmap_word, &word, (word & ~mask) | flags));
+}
+
+/**
+ * set_pfnblock_bit - Set a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to set
+ */
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	set_bit(bitidx + pb_bit, bitmap_word);
 }
 
-void set_pageblock_migratetype(struct page *page, int migratetype)
+/**
+ * clear_pfnblock_bit - Clear a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to clear
+ */
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	clear_bit(bitidx + pb_bit, bitmap_word);
+}
+
+/**
+ * set_pageblock_migratetype - Set the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @migratetype: migratetype to set
+ */
+__always_inline void set_pageblock_migratetype(struct page *page,
+					       enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
-	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
-				page_to_pfn(page), MIGRATETYPE_MASK);
+	__set_pfnblock_flags_mask(page, page_to_pfn(page),
+				  (unsigned long)migratetype, MIGRATETYPE_MASK);
 }
 
 #ifdef CONFIG_DEBUG_VM
@@ -667,7 +760,7 @@ static inline void __add_to_free_list(struct page *page, struct zone *zone,
 	int nr_pages = 1 << order;
 
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	if (tail)
@@ -693,7 +786,7 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
 
 	/* Free page moving can fail, so it happens before the type update */
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != old_mt,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), old_mt, nr_pages);
 
 	list_move_tail(&page->buddy_list, &area->free_list[new_mt]);
@@ -715,7 +808,7 @@ static inline void __del_page_from_free_list(struct page *page, struct zone *zon
 	int nr_pages = 1 << order;
 
         VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	/* clear reported state and update reported page count */
@@ -3127,7 +3220,7 @@ static struct page *rmqueue_pcplist(struct zone *preferred_zone,
 
 /*
  * Do not instrument rmqueue() with KMSAN. This function may call
- * __msan_poison_alloca() through a call to set_pfnblock_flags_mask().
+ * __msan_poison_alloca() through a call to set_pfnblock_migratetype().
  * If __msan_poison_alloca() attempts to allocate pages for the stack depot, it
  * may call rmqueue() again, which will result in a deadlock.
  */
-- 
2.47.2

