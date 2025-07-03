Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0B2C158B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582429; cv=fail; b=AodGaQhVBsl4d1dBlzmHeXrv5P1gCAsg5v+qtyaHw0roWATplvNCevyl0k7sZA1yaw/WsIgjYqG6hQSWbWMCMIWrSnpI/dO9L/NFbGDxuDAiBSbiTxxpEoKxh9DFLoHOgqDmte2ProZ3HWQyTsKaXQADSpf7C0RTY8qR0zNSKJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582429; c=relaxed/simple;
	bh=KRNyf9HMkBg39nV1Tl+3OxDQIQjsyGj1zeXqr/HI+QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ribD7jXeslAfoLGU5Ux6ZCKKuoW4sBN68p75ed2jaYhYuo4j46p93VTNVv9gN35A+y5kHGlEE2qh0NIAjLHV6hHp6ip+F/QmMlRydPUvNPAN5k5y4EFHzY/bMx+DRq7fIdAxcQ2jUUH4gZV1SLvaOxIZf3SOPfpTIeGNGuh4WBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I93Q3Y5n; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I93Q3Y5n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpVxhUwq4fKIDTS1slCLa5pFM0F4p9ofKSo+doiHjbL2mXE4hUXSXia0PsgbZWZRw3M2sfdIwKkkTp510eUXnb9Bv/1bSw5Mvj1HfJ7UKb6MFW5FUshaTor1uj7hUh0vNfYACX6gK7GQ++N1WAz5rI4P/1JgavOlb1sS81s1kRUojQsxcV7ClJyGkwVz0y+dLRHLMwxb5ZFRL3zWgauJnPNWCjU/oVeijiDKkqcgx9Cv6CkXTuZi/IV6n08oOx/sfTMy9f9LIHZkf2LwZbW+oyF3j/IvEsTI/l7C8bpUdPmJ04Kh6lcUTHEkbqL5AO2+LUVcQc3D/X4ZtF5qPcqeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnizfPoNdBHpXf+tH6PjYwoZ938q5vWqMjT7cund9Xg=;
 b=Yoz0KDyfzgatdxau0Ywh7/Hdn6yVe1QWTDBWWkBvvN+l7hvmAOpimOULV+w1qI7EbpPfxYTemg3U/5OYzLcXdfNvP+Hm97VDlNDYNDTJb3gi51cRXIh9MiJINVehKAe33lD+F3qEmPAp3bGFWPe6VOi9oQMiCe7frO9u3sTHbOKIw0Enj/N3Pt/IRek0/szBH4Fyh+OjS96izA7TDbj3ib1Nkyd1ZWlQMQbvgZcPQ1nOhuMwpHqZVSWkEn4oxjn4tgYULHH1kVuH3EalyQko8WeNcWbMseXCvp6xKc1JDXmIASSn8a6GI2A5tPJy1Z1UfsWtKhjeza2iTHVoXj8jwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnizfPoNdBHpXf+tH6PjYwoZ938q5vWqMjT7cund9Xg=;
 b=I93Q3Y5n8F9ODQSMnhxjdNf0cP6egCqDJTw4p4oWHseEe6N0WNFauv1LzmdHXKhAs+RB0nPPXjAnrnjVrCZ4xfibmp0MoDOlUVY3iD36+a8OMMwUtzHwb9E/3M2X/3mdM/DhVs0lV1CSfzlVaDx7J6mI9JE7Dp//UXdnh/Apn4Ktc0qzaxpGzx2Wts3aGcOfRccAeTcMQkJg5DGC6J+MA/MASC7jYrfCsTon8Tn5kI8MKAk6ASISX671JgRjf9Okii4HxexwUIrFA26KhjTODMwy7GW7UhQ0J4IxO8Qas4jR7lBc+qfdPA4wlnpd9EBPIqAEhM59XCuIWdr5rf9FRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 3 Jul
 2025 22:40:24 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:24 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 08/12] mm/thp: add split during migration support
Date: Fri,  4 Jul 2025 08:27:55 +1000
Message-ID: <20250703222759.1943776-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0075.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::11) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6bf463-ecf9-44d1-c93b-08ddba82996d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CrUwJOfuJ/n5cqhhlFidztXhfwGgwsMmyLX3S6XkGbtFd4ush0xJqilkjv8W?=
 =?us-ascii?Q?UR/WMBnUltNoMJj4HMXMA5bKX9UGGf6Rc9uvaAZHBwm810EMtQl4968dmmQ1?=
 =?us-ascii?Q?BodhUHxBdaWAOx/7FsN95xeei5yUWs6F+K9P9r1WD1EjNkvan4rVMKDQmmoo?=
 =?us-ascii?Q?9fNnfUG1YYfwBHWMuW0W1YlmnAz3Lc3a3qHs1em/SAuKL0iDFUJ/xlAXOkJJ?=
 =?us-ascii?Q?cfJ3INRZNlfmB2QQ18x93u8JTUtuchuZXvcl4MgnvAgtBXkmUzOYlUpMMQpD?=
 =?us-ascii?Q?IDhsYpZImewNZbppMlPBovmCewPIMhgZrTmxaaKHd1WtEiUvd06IV1gG3mAF?=
 =?us-ascii?Q?ZKOP1NVJgAZtJ78FbrJ/cs5C/rGeVe0Sz3dh9O0+VbxAsJN0w0iLqq4ep63r?=
 =?us-ascii?Q?2uCnHD3MSvyoS6iahq2fecz4GsI7Dk1gFkeGpMkcP0n2wewY0lMRpV4hBu5/?=
 =?us-ascii?Q?KKsdu/mUHQS5jGvtGVo3XdzGHZNN/c2UQR0MRvg91l86hDD8+gSGSslW+2g1?=
 =?us-ascii?Q?OUuHxn10uySwsHHUg4diE/WAAw5MVO/grVMOBENKrHn5HB7fijezW5KaykyF?=
 =?us-ascii?Q?FVYP+kzNNmFEiWTon+TejuIhdR/8Jhespa+l9DH3RUzGoSUfLVE+mvE/X56H?=
 =?us-ascii?Q?2ctQx/NxMVC02fUWjBLsIIrvfE3MVuPXhDJICFS4sXybJWNvaM+sSPpypVlB?=
 =?us-ascii?Q?vwVSYhudXecaoeMNIgVHmhF12hedtLmprFq8faFKoDnfmRkrXBBwq8CGbYrj?=
 =?us-ascii?Q?818jza69TB6DH6jb1ERqf0rmRZbkglQGN9os6J1dQyADOC/W83LD978zhj+V?=
 =?us-ascii?Q?LXExxGp0sJnO1Day8XnbwGel+KGLmX4Xtzw+OMML0POaQh7zbzlgabwlD9J3?=
 =?us-ascii?Q?jQtuJDAHM7TWL387wRAtMKq6vs9UR9Gf8m8WRteE70xZ3s2oLb+BjNvPG/XX?=
 =?us-ascii?Q?t4/0hdqojIL1Lp/ASFbpEWBZIUr+hNEIbdMzQrHlokXsMR4qSD3P93SmH7es?=
 =?us-ascii?Q?LO59jIQ8id2oq4HLMdsyoN2rlzt0kMx7K6oz61czypFt2kvo6dGDYvXFQhfP?=
 =?us-ascii?Q?mUaadpk3XHtkPbO3/wnyR8gV2f09q1FanSEboRGXQs2q7jrIRrquXmxTyrAB?=
 =?us-ascii?Q?tQckAvdVMRgNlwkYQ+met0XneVi2iYOoYrKX2X7DAv5K+vSYBsa5AbhMb01b?=
 =?us-ascii?Q?ISorQgOgMNDkYtGETwZtX1kOsYyFpx043OLg2R9D+DFxT9OAgig5p3zN+bsZ?=
 =?us-ascii?Q?SAFrfLKGvSbo8DAK4oYL1X/X8rAuUIUJII146WmPDxxZ04khAoHdp7uvViLi?=
 =?us-ascii?Q?mjuHXBaBII2rZi2JEHGJKHMiZhGPqb7YrU8Jnbe2Zkg5WHklwDhOX1ZX+v18?=
 =?us-ascii?Q?iPPVu/heVUBAAxryd+52xBckWb52X+repVBmLpzmQAs2x8ciKIKhLzOD31ue?=
 =?us-ascii?Q?DDdfRFLFfkA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCy0Ceuaxh99UzIqf2w/x0xnBAlejON9TveGZ7HaLFNOyCqbWdbmbPpzrElB?=
 =?us-ascii?Q?WtJ1XqQ2dGeWDbjG2eRiXbQy/qkFgfJUr0KQHMIl8FPm7AF/cuQEcFgoX33X?=
 =?us-ascii?Q?Pxx/toGM701UUB8JFRqzo6ptyOtO76hrJF3AhZDA8QIaST2aoPrPPqHc4wSm?=
 =?us-ascii?Q?L9QqEuMamu/wp8MWhm4lgc8UArjPaQVsl90A586BZPugAnshabB80amiXOfr?=
 =?us-ascii?Q?+NwNU9ZwEiItvGukMEyow2hqw0SwkDgaB5GE7kIJp6W49jdBvF+DKixyqLx7?=
 =?us-ascii?Q?blHCnlhdjFTjno/tDCE4elfD3rAvq7dRU8BrqBE+3HaFt3A0NpWHKOYxVLO5?=
 =?us-ascii?Q?t18iti+ESeuny6nyUujuFGByYemAPCtxSBtlbRZrV1q2eD4jyAKrAyvo8iZt?=
 =?us-ascii?Q?MKDmp1hXJVG5fbmgzZiOsvsBqa4locE16oFDFbM0E0RI+KTzGJOYVFftOM4A?=
 =?us-ascii?Q?iDe793gkokAs8UfiQ7mc8bU/tddI+JgmlKZjLv43lD1YUK3leyBkNHhZfiu9?=
 =?us-ascii?Q?BrSqPIiMurMspBD9oU/Nut64i26aXAA+T5ggNKL9xJ6CASA/PKNoHmpQNQ5l?=
 =?us-ascii?Q?kgFe/vgkaF95bGDZr1QvvjRI3MVZ6VwXvEcURS6VVSlLyynEQwG1tHRGFAXb?=
 =?us-ascii?Q?WJmvM8qpJtAZ/a1Rl4mj1nLicLnZETgWXmTmIbBOiB0tfEG/4j91C1g5iVfq?=
 =?us-ascii?Q?kKuxs57PouZtYpqLQrrgccCGCsW6NYCacbu45jPSBBaVuF2Qfl8HP3zLsvMF?=
 =?us-ascii?Q?esEyPZlmP1PYOtmHzTzAFPjiV98iaraStF5r+TgL7qCqGhLHDWnG5+0Kbuy2?=
 =?us-ascii?Q?ztR+M4P7lCFw/jUPp85jlt4m/HNLIjFboVzu6j71K+Vfy9NCMqottw1KvwIx?=
 =?us-ascii?Q?4yS1te4o2W/839ConNGygmudaul14r8xFyr0U8FaOKHTy5fxPi8DJMu5YfIg?=
 =?us-ascii?Q?Crd0u98Xk5yhAtM5OB23h5vBkYegZMQ1Q6XqBYfgfWbziJ4qpnKFjExuDuLS?=
 =?us-ascii?Q?AhYHpkXlHqyOIEp73f28PC7lzqvcaq2diI0gWH+JbzmECkzW3tZsYIvhDxIo?=
 =?us-ascii?Q?SIwmxwgnf4vCR130BqYjNnoynyaWSu2ffHm4nNlyS1i49k8RXoDt/R0GuidD?=
 =?us-ascii?Q?/62hjonPnzsiqEUVqMNfXyvr3fdxMKVfXU3PPRN8Czc3iHpy7dzn1ZNCQF7+?=
 =?us-ascii?Q?/IxRRASXE93ihjF8JfahA1VRA1iB/ZmoWIzZd3niIjYtZsfZjAmzbaoi7juc?=
 =?us-ascii?Q?ifnIpIDMwAbc3ILDNFw+WKa47NBJ0U7p9B+C8JvgX+MNr2Lfng708WHqOMrE?=
 =?us-ascii?Q?0/n6UqRFG4rm76XcPsNmkkZEPhLlT5P6fNAnWXRmS4vW7gkkdw0/I57D7YSx?=
 =?us-ascii?Q?2cf5rGG1j9AAukcPT5fMRbGm6EZWFvC/zvlU5nS5+cKOKZavf1qbPiTxoJEK?=
 =?us-ascii?Q?PsA4SeaZbyCaPi6i159d2VkPsyonnPX3Hx9mK60vcY9zXEqQmtIuun9J/uib?=
 =?us-ascii?Q?61V5Ybq4jmGXCCqJqdDCuPiD8S0DOKDkboImDJe0cB4fYiBhRSUv0c0lQ4je?=
 =?us-ascii?Q?c6nwlwvGuIxIAr/7IJqPOpz7YECyNbJ3h01ygt0e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6bf463-ecf9-44d1-c93b-08ddba82996d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:23.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCaMP3LlGpdBtmAHJARJd0e3oA8XTkqoXlmLbGhsqZKZUHPZkK0EhUoELseXfRzmBWV10XV2+kQoHl3h9JO1yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Support splitting pages during THP zone device migration as needed.
The common case that arises is that after setup, during migrate
the destination might not be able to allocate MIGRATE_PFN_COMPOUND
pages.

Add a new routine migrate_vma_split_pages() to support the splitting
of already isolated pages. The pages being migrated are already unmapped
and marked for migration during setup (via unmap). folio_split() and
__split_unmapped_folio() take additional isolated arguments, to avoid
unmapping and remaping these pages and unlocking/putting the folio.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/huge_mm.h | 11 ++++++--
 mm/huge_memory.c        | 54 ++++++++++++++++++++-----------------
 mm/migrate_device.c     | 59 ++++++++++++++++++++++++++++++++---------
 3 files changed, 85 insertions(+), 39 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 65a1bdf29bb9..5f55a754e57c 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -343,8 +343,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 		vm_flags_t vm_flags);
 
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-		unsigned int new_order);
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order, bool isolated);
 int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
 bool uniform_split_supported(struct folio *folio, unsigned int new_order,
@@ -353,6 +353,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
 		bool warns);
 int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
 		struct list_head *list);
+
+static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order)
+{
+	return __split_huge_page_to_list_to_order(page, list, new_order, false);
+}
+
 /*
  * try_folio_split - try to split a @folio at @page using non uniform split.
  * @folio: folio to be split
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d55e36ae0c39..e00ddfed22fa 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3424,15 +3424,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		new_folio->mapping = folio->mapping;
 		new_folio->index = folio->index + i;
 
-		/*
-		 * page->private should not be set in tail pages. Fix up and warn once
-		 * if private is unexpectedly set.
-		 */
-		if (unlikely(new_folio->private)) {
-			VM_WARN_ON_ONCE_PAGE(true, new_head);
-			new_folio->private = NULL;
-		}
-
 		if (folio_test_swapcache(folio))
 			new_folio->swap.val = folio->swap.val + i;
 
@@ -3519,7 +3510,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		struct page *split_at, struct page *lock_at,
 		struct list_head *list, pgoff_t end,
 		struct xa_state *xas, struct address_space *mapping,
-		bool uniform_split)
+		bool uniform_split, bool isolated)
 {
 	struct lruvec *lruvec;
 	struct address_space *swap_cache = NULL;
@@ -3643,8 +3634,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 				percpu_ref_get_many(&release->pgmap->ref,
 							(1 << new_order) - 1);
 
-			lru_add_split_folio(origin_folio, release, lruvec,
-					list);
+			if (!isolated)
+				lru_add_split_folio(origin_folio, release,
+							lruvec, list);
 
 			/* Some pages can be beyond EOF: drop them from cache */
 			if (release->index >= end) {
@@ -3697,6 +3689,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 	if (nr_dropped)
 		shmem_uncharge(mapping->host, nr_dropped);
 
+	/*
+	 * Don't remap and unlock isolated folios
+	 */
+	if (isolated)
+		return ret;
+
 	remap_page(origin_folio, 1 << order,
 			folio_test_anon(origin_folio) ?
 				RMP_USE_SHARED_ZEROPAGE : 0);
@@ -3790,6 +3788,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  * @lock_at: a page within @folio to be left locked to caller
  * @list: after-split folios will be put on it if non NULL
  * @uniform_split: perform uniform split or not (non-uniform split)
+ * @isolated: The pages are already unmapped
  *
  * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
  * It is in charge of checking whether the split is supported or not and
@@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  */
 static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
-		struct list_head *list, bool uniform_split)
+		struct list_head *list, bool uniform_split, bool isolated)
 {
 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
@@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		 * is taken to serialise against parallel split or collapse
 		 * operations.
 		 */
-		anon_vma = folio_get_anon_vma(folio);
-		if (!anon_vma) {
-			ret = -EBUSY;
-			goto out;
+		if (!isolated) {
+			anon_vma = folio_get_anon_vma(folio);
+			if (!anon_vma) {
+				ret = -EBUSY;
+				goto out;
+			}
+			anon_vma_lock_write(anon_vma);
 		}
 		end = -1;
 		mapping = NULL;
-		anon_vma_lock_write(anon_vma);
 	} else {
 		unsigned int min_order;
 		gfp_t gfp;
@@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	unmap_folio(folio);
+	if (!isolated)
+		unmap_folio(folio);
 
 	/* block interrupt reentry in xa_lock and spinlock */
 	local_irq_disable();
@@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		ret = __split_unmapped_folio(folio, new_order,
 				split_at, lock_at, list, end, &xas, mapping,
-				uniform_split);
+				uniform_split, isolated);
 	} else {
 		spin_unlock(&ds_queue->split_queue_lock);
 fail:
 		if (mapping)
 			xas_unlock(&xas);
 		local_irq_enable();
-		remap_page(folio, folio_nr_pages(folio), 0);
+		if (!isolated)
+			remap_page(folio, folio_nr_pages(folio), 0);
 		ret = -EAGAIN;
 	}
 
@@ -4046,12 +4049,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  * Returns -EINVAL when trying to split to an order that is incompatible
  * with the folio. Splitting to order 0 is compatible with all folios.
  */
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-				     unsigned int new_order)
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+				     unsigned int new_order, bool isolated)
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list, true);
+	return __folio_split(folio, new_order, &folio->page, page, list, true,
+				isolated);
 }
 
 /*
@@ -4080,7 +4084,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
 	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			false);
+			false, false);
 }
 
 int min_order_for_split(struct folio *folio)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 41d0bd787969..acd2f03b178d 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -813,6 +813,24 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		src[i] &= ~MIGRATE_PFN_MIGRATE;
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{
+	unsigned long i;
+	unsigned long pfn;
+	unsigned long flags;
+
+	folio_get(folio);
+	split_huge_pmd_address(migrate->vma, addr, true);
+	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
+	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
+	flags = migrate->src[idx] & ((1UL << MIGRATE_PFN_SHIFT) - 1);
+	pfn = migrate->src[idx] >> MIGRATE_PFN_SHIFT;
+	for (i = 1; i < HPAGE_PMD_NR; i++)
+		migrate->src[i+idx] = migrate_pfn(pfn + i) | flags;
+}
 #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 					 unsigned long addr,
@@ -822,6 +840,11 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 {
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{}
 #endif
 
 /*
@@ -971,8 +994,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				struct migrate_vma *migrate)
 {
 	struct mmu_notifier_range range;
-	unsigned long i;
+	unsigned long i, j;
 	bool notified = false;
+	unsigned long addr;
 
 	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
@@ -1014,12 +1038,16 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
 				nr = HPAGE_PMD_NR;
 				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-				goto next;
+			} else {
+				nr = 1;
 			}
 
-			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
-						&src_pfns[i]);
+			for (j = 0; j < nr && i + j < npages; j++) {
+				src_pfns[i+j] |= MIGRATE_PFN_MIGRATE;
+				migrate_vma_insert_page(migrate,
+					addr + j * PAGE_SIZE,
+					&dst_pfns[i+j], &src_pfns[i+j]);
+			}
 			goto next;
 		}
 
@@ -1041,7 +1069,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 							 MIGRATE_PFN_COMPOUND);
 					goto next;
 				}
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				nr = 1 << folio_order(folio);
+				addr = migrate->start + i * PAGE_SIZE;
+				migrate_vma_split_pages(migrate, i, addr, folio);
 			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
 				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
 				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
@@ -1076,12 +1106,17 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 		BUG_ON(folio_test_writeback(folio));
 
 		if (migrate && migrate->fault_page == page)
-			extra_cnt = 1;
-		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
-		if (r != MIGRATEPAGE_SUCCESS)
-			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-		else
-			folio_migrate_flags(newfolio, folio);
+			extra_cnt++;
+		for (j = 0; j < nr && i + j < npages; j++) {
+			folio = page_folio(migrate_pfn_to_page(src_pfns[i+j]));
+			newfolio = page_folio(migrate_pfn_to_page(dst_pfns[i+j]));
+
+			r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
+			if (r != MIGRATEPAGE_SUCCESS)
+				src_pfns[i+j] &= ~MIGRATE_PFN_MIGRATE;
+			else
+				folio_migrate_flags(newfolio, folio);
+		}
 next:
 		i += nr;
 	}
-- 
2.49.0

