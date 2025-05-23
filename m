Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F11629B8C5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027603; cv=fail; b=pucMzwxBQ3k/cdFkiOwFZS4yItJsLhKjvMIEhdnwOY4u6Wuu1FLkqpw2IEo2MspN1yNahdMpeXTKQXLEGPuPgGPmnVYmz5FJ3TvvualCxZkq7NwBmCypwLloiUBv1FiwEPzSclRbNVzabmQtI33OwWztNI6hYb4QDzq4UzAsvtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027603; c=relaxed/simple;
	bh=4+y1hL26rPRbIFpXfD5Nfrtu2w7iIyPC/XeENr+cCcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUnvSRA4wXuKlQ9Hj1BXDNEDStXC6WomWUgD4CgjbptDficcFL8jRr+H80dWxpE/AY+gTJaObkqlRQM2BfETGeZQ3DQfJlhW8jVGOfRkRkDcy71D68qx/5CoVzitAIMYXW4JFe3vTpgQv0Zbj3eDisDNhzwkT+24zKMM3cYxatI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XJje5FvX; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XJje5FvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3FFPU+JXnCZ9o9F2mFbSG2f+se/+7gzJgqoSQZYxvBQE3SN/tCCu3uwbTMnyIy3Qu3mOujQG5xcjXLgMUxQvXmzqBkF3u9HDl9cvomXGQwSlG5ywQEOFx/m24eN4W57RTy0UomB6v7Y4TcHcnjHEXxOO0V0ZLZOs6I3f8EPp0w6KPNJwHFHakFZCkOuWmvOq1OuofkWJKDlTZJbk8Q5conhc/XxlEsZg03HEEN/XonCw8adrTHbXpmZ310ywd5kqOhpmuhdTqeSIpM8nFvAS1cQy18ApaJqGHQI/Vr43B8gbvt/JdN1Md0h4TrEyUab9bQwojmad4HDH6a0CICw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esh/l8wkLWPiw2U5i8LYI8cpIn30pibYhoot+1uC7Uo=;
 b=YY5jUtwbZ+vJby13l1EjDHPKHAOa/7ye0cjyvFFVO4SOF1/v7eLJXMhWoMge5HnpxuuKPKps7xB8I84FljPSFCbWb0fHWn4Z2X2+HOgbsY7dypUsnH1OK0WKyAbCBW4M8JGnqQICsM7RyfYbXjTj4fP1vF7CcTAB02PKJ5FmrVIkzt0Xu/nwVqMSyDvVfi9NwGKCvETSv58ZZNVTl2vyOR9bm48D1DBjfj89rJ/SD01ZvIcz8sWvuvGqg70lIQc5Q3rfU9+OV6EVP4Bd3B4JFr4CldY/Ya3ytLrlFqIT/uU55sWQ86leAZ6BFtCW7T4DfUm25+r2V5IykVGtOI0l3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esh/l8wkLWPiw2U5i8LYI8cpIn30pibYhoot+1uC7Uo=;
 b=XJje5FvX0mXFiYOWqrT25oH1Uh4tSDZfNbaB53tCyhzqaLp+DBc6Qh8k526h2r2jh4d7QlQjVVtBYDfRwn0R2S9SmXXP/ToF0DKIymh2tcEUZn1ABQUZa0rbUKTuUVQ1HyWb08Bx9JzYb82D7q03XdtWBkFsfCpAqZbxouzGYAqlIamsLbj9AwBDO7LwZi3sL/Q1r+kmSAy6eH4QXtEl5pa2fTKr9z+jxj59sdejlx75Wmk6l4XSYLAHAGdal2+Abb2aaTlGtXyTKNyRBAZBf44DfNYEFnzCn/iLddTsF2Jn2uQ/473abBtsV0vF36zZPAm+iD+buTdD2p57Tct8uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:13:16 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:13:16 +0000
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
Subject: [PATCH v5 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Fri, 23 May 2025 15:12:53 -0400
Message-ID: <20250523191258.339826-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523191258.339826-1-ziy@nvidia.com>
References: <20250523191258.339826-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:208:256::7) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a4b21f-6c47-4261-93c7-08dd9a2ddecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p3RrgbZREf6omdcK1jra8qRJgFPstB3WiDMrB2qZlgGAoMbzpjlg5qAbOfhH?=
 =?us-ascii?Q?QLzQ1T96GUgZcJEdzGACyY/MS+x+H/Gd15YOADbxRX8cUtFXx1lbecSw8KWH?=
 =?us-ascii?Q?G4SVD3312BVcNII3qtogHqUfqIuabm2xJ4Sp79AeBS0Ipy6jOKhryuRDzbhN?=
 =?us-ascii?Q?ilAEFGaGUw/RNFKYQTwgC0RxW6bq1K+bTt9IqobnYQ0bBmvooJaW2Rp4iuqS?=
 =?us-ascii?Q?tjc33ezKdDmYb8z16OODzBV3ozP3Iv8RZP0yJ9DwTbjzYx7TCYH2la9dy4yE?=
 =?us-ascii?Q?qEDxNkc1avGhpQdd0Hcq/WhFHxAiH2tt5kIML1dr7KKAqUF71aH70IZ8UWve?=
 =?us-ascii?Q?9UouGMbVeO+Vtp6k3ThvV7jv4nYXYL+M65cFBjxBokbk0GT13+GRiIroXAm9?=
 =?us-ascii?Q?zDFpo0lu4G0tw70xST38xgptwvFJS0YmdNlrqXHOmc6UTlZzFGXogLeM92mG?=
 =?us-ascii?Q?ZUeZfZo+/FlopEXhuSrNnTX0+HBpkbezDeNnAX+bqQyB6lMSFCOs/LbPcwLq?=
 =?us-ascii?Q?yTFdedQvrDsmx80i8utbx8g/qZt2Wm+MOs9G2tb3MIiNUmYbiiaEjFdrkSnU?=
 =?us-ascii?Q?l28YX4GdSMJX1FJvzIrxiNtdJlC9utukQGBjVxD80PKN+t+WitDEwXFUnw88?=
 =?us-ascii?Q?XFUk9XcFAmzdtifY3dpQrLi0NnX1lttUjPrZoS+fVy59qk5njDzeJ9f4/oUf?=
 =?us-ascii?Q?ilyFVOvm95ONFHwied4Y2BR41k4o5Q4OwBseVHM/IspsEut7yk42m07mWEJM?=
 =?us-ascii?Q?8bNZE4yxh/UNHETG2albuvh89doAOVJhaXV30sU6fm4N379HrlCXEOAHQf5T?=
 =?us-ascii?Q?aOdSpnzptyCsl9lHy5AakyG07SRKv53MGTgNUn9UayG1S03Ml1mIt2TMayIq?=
 =?us-ascii?Q?d90EX+iuv4xyIL51UFUSDlasszTwpCQ+iwvzBSmbn3WgSJG6BylMB7SU1/Z0?=
 =?us-ascii?Q?pVpTS09hqLJbRHeY2NgyKcFEDi4a2rAtllaJg/wmkbLoAZPokr34LmmPQeRw?=
 =?us-ascii?Q?WhnPKo4AVoXs9j1mrFyejeUZd82ln92uZkts6YvBYns6YVambT75aibQI8p/?=
 =?us-ascii?Q?wVZoCBj6+WzSMY5I59YNZ1JFVJ8RqDj14BPdODfApQ8KiXFQytcPpQA5HwI1?=
 =?us-ascii?Q?ewxZikqmtmYtmXOxBoIo/hNMs4IAktNy+UimSbsg4mWgGpgVUi1DN52RlEim?=
 =?us-ascii?Q?rbIuuWEoRBGymxEY9tOtnRgmPUufpFDqVJkq49iAC8V4TXk9FdFcUABfFX6Y?=
 =?us-ascii?Q?Pvy6Ms1jci0CcBZO6HpMVOu7fgOKCfsbBXXujLWIkCwMMamELzSP3+9YwjOS?=
 =?us-ascii?Q?n6kWhoHajTpDq4aTn0EkbdEIcKz/9OqZ7dDtGYqO59qywpDsY8XKXS7HisEh?=
 =?us-ascii?Q?tyTo0lVwsIRhf8SJAsQOdn535WVY7HP3OEJBDpStBBT1xuCKLXgT1trlpixN?=
 =?us-ascii?Q?x6mf9/ODlIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VzzNIz488xiTyc9nEPa7c9JXjC+0VMZi/0w/n3QxOmXaHdHTLJL2LIbWqZ3e?=
 =?us-ascii?Q?9lAOs8QKSNfZFFilbxxKREZ0blGHikl+74WZpQcOrcp/tiCghtZTT+fQI8kl?=
 =?us-ascii?Q?5QMp9IJZ1DvcNyWXP/1A6lOhMqqO2y3uAcKa4ysZhvDEXZkQictiK3iBE0v1?=
 =?us-ascii?Q?9xAb+F3tDWzdNAQuXYnBTkXWTpV7CPYmbUqlEuG83amGEq4wssgRWVZBhuIQ?=
 =?us-ascii?Q?8GUzKJ2ieKdKumTqcjF8ksKN3U5uiXY6CgGBr5UUWOwFAZ8HRp3UAFH/Qe3T?=
 =?us-ascii?Q?1wmJbB8nFnPOwsZdvIyvJKb+szAv1TmDRWGE8Yg1fqOPodSaFWbH7TquHUvn?=
 =?us-ascii?Q?hAnWo0KQjiu3J2xDcjFMjZd+aOMTWQFXLmOSVcFACqKjFPaiCEqQAmvl9lIG?=
 =?us-ascii?Q?y3N6yJHkxbcXWMukiPxK3sLPq/vQm+/nqWqgSq0njKE1S14n7WO5RAWjwQTI?=
 =?us-ascii?Q?l12KFAZK2D5CK5KtRHSQ3XTRK6ubhGspPY1aaz9sri4Qb05yXZ1LUZbProtj?=
 =?us-ascii?Q?yxtaaw0/TOF5L2aUZCbx+nm3F/WDLCUgcxZbI5I/9doToIEHzCi8zl04F/Ri?=
 =?us-ascii?Q?KplxoZMRFeKZM7GmcUg7W/3Y/ZQlDOUxR6y2w+LYP/3XH/DcQ1ase4d9n3nI?=
 =?us-ascii?Q?vX0x+3wQ2PkaIsyTDrEd2ZROz4J+Urf3RNOeEUa4nDL+NnFfgKdoi8UmRkfn?=
 =?us-ascii?Q?ZSNaCrnvrKB6HEPdNbDvHtZRuRfcKkkOmQACZ/bfOLsV2ewhSvMznCjqOGtd?=
 =?us-ascii?Q?9PKfGxBFJkbf9dqFohxPu2wTRKSKmQGdBY/bvVbrI5V01f0opmjEg6imMofV?=
 =?us-ascii?Q?f0HjhmYzYr/oTuWb523VQ/agVJBlmAJI12iFvjwBgub+OrLKtP+6t+/P/LoH?=
 =?us-ascii?Q?eyzAIqYKiAB3tjwf0FkqGeoObcVJRnPlM9pKdnYY2qg3cvErWlJ5zqg4YBk2?=
 =?us-ascii?Q?ZAVt2Njabp98MfzIB9HNqK5DvS1q8vmGoOMXNjcKivCj2IL0bVWYajEGAc2t?=
 =?us-ascii?Q?C1LbWnRY5NxcEVAE4Ak4SBK9WkD5EIzOW0NgL5hiWAmf9iANvvZaUFYod3+j?=
 =?us-ascii?Q?zBTHNWdPgwXbLE0KowwtmtTY3RTVJeB3lpU9C2pwFcp8W50j0SveeQz69ir+?=
 =?us-ascii?Q?CIPFmYtIccEtuzM6dWFKQF6m/sQq3KpscQssciRicmZWP5tOHfWwiuAniwGM?=
 =?us-ascii?Q?R1t1tBsNUi7+Lky8WZShiahd34J2KLKbg2NF5Ki0tge0uLq665xLKOw5RGLs?=
 =?us-ascii?Q?e/5WUn49sfYlol/ER+hLBxp+/khUK+CQ7dFHP1nlv91lFK2uRpL2Fvc8/qxK?=
 =?us-ascii?Q?E1hpzBdbUWVrSL8mdLAdEE0G0H/StmClPEjCwG5o5T0tdMHH/wWYVVr074a9?=
 =?us-ascii?Q?6/3SvzGB99G+/N32KIH4YNDNWTPuEdE83rKNgtljmcctmWLW9lY0qzeAzder?=
 =?us-ascii?Q?OKrWrb/aZiLJGX6C37eIBoCp6/BOmq4qMrddE9Ti/0YhqdauCfndvYheuWVw?=
 =?us-ascii?Q?8fRhv2V6rYARdBO1BQK2ZgP8LCMMl8guRUSzbOLHRjZGL/D8Nqd+B/Em4SY2?=
 =?us-ascii?Q?0IjL+CZOco8RCFS/nbSuxyXEv9eBFN5+MOTpSTyr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a4b21f-6c47-4261-93c7-08dd9a2ddecc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:13:15.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ea06b4MSCP4v6to520vaeelTsgmPvRSIxeV0D9JENDI8NfCU1eOm22ialI65z6a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

No functional change is intended.

1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
   roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
   right amount of bits for pageblock flags.
2. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
   like PB_migrate_skip.
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
 include/linux/mmzone.h          |  18 ++--
 include/linux/page-isolation.h  |   2 +-
 include/linux/pageblock-flags.h |  32 +++---
 mm/memory_hotplug.c             |   2 +-
 mm/page_alloc.c                 | 169 ++++++++++++++++++++++++--------
 5 files changed, 158 insertions(+), 65 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b19a98c20de8..39540213d5b9 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -76,8 +76,12 @@ extern const char * const migratetype_names[MIGRATE_TYPES];
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
@@ -106,14 +110,12 @@ static inline bool migratetype_is_mergeable(int mt)
 
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
index fc6b9c87cb0a..3acbb271a29a 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -25,9 +25,13 @@ enum pageblock_bits {
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
+	get_pfnblock_bit(page, page_to_pfn(page), PB_migrate_skip)
 #define clear_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
-			(1 << PB_migrate_skip))
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_migrate_skip)
 #define set_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, (1 << PB_migrate_skip),	\
-			page_to_pfn(page),			\
-			(1 << PB_migrate_skip))
+	set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_skip)
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
index 90b06f3d004c..0207164fcaf6 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -353,81 +353,172 @@ static inline int pfn_to_bitidx(const struct page *page, unsigned long pfn)
 	return (pfn >> pageblock_order) * NR_PAGEBLOCK_BITS;
 }
 
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
+	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
+			 pb_bit >= __NR_PAGEBLOCK_BITS))
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
+	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
+			 pb_bit >= __NR_PAGEBLOCK_BITS))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	__set_bit(bitidx + pb_bit, bitmap_word);
+}
+
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
+	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
+			 pb_bit >= __NR_PAGEBLOCK_BITS))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	__clear_bit(bitidx + pb_bit, bitmap_word);
 }
 
-void set_pageblock_migratetype(struct page *page, int migratetype)
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
@@ -667,7 +758,7 @@ static inline void __add_to_free_list(struct page *page, struct zone *zone,
 	int nr_pages = 1 << order;
 
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	if (tail)
@@ -693,7 +784,7 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
 
 	/* Free page moving can fail, so it happens before the type update */
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != old_mt,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), old_mt, nr_pages);
 
 	list_move_tail(&page->buddy_list, &area->free_list[new_mt]);
@@ -715,7 +806,7 @@ static inline void __del_page_from_free_list(struct page *page, struct zone *zon
 	int nr_pages = 1 << order;
 
         VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	/* clear reported state and update reported page count */
@@ -3127,7 +3218,7 @@ static struct page *rmqueue_pcplist(struct zone *preferred_zone,
 
 /*
  * Do not instrument rmqueue() with KMSAN. This function may call
- * __msan_poison_alloca() through a call to set_pfnblock_flags_mask().
+ * __msan_poison_alloca() through a call to set_pfnblock_migratetype().
  * If __msan_poison_alloca() attempts to allocate pages for the stack depot, it
  * may call rmqueue() again, which will result in a deadlock.
  */
-- 
2.47.2

