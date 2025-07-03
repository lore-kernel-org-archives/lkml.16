Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB32BEC3A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582405; cv=fail; b=JQsZ5nmcYcwRDCA5Mj+tEkXwsvO/gnBk97epoqJ+lw8qYAwpllV7dmBRnBMHeQLXlBy+R0GFMkJZEIMCTEoHpBO7qo2smV+8NEE35KJlmtUJG8ZnNJ+YTM0Gfb10j6RYycUjKUyMSecEKbocEy/v2d3g/I9vZzF3Iu0c+TREuQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582405; c=relaxed/simple;
	bh=Yb+HgI22ZmSjPgp3iQIBQLIshgF2b0vA0sTf/jvHDR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=chD1MSD71sxNcpb3thkK4MmHr0uNhsyD7V36l7EGeHYuHN2P5G8F2zkrsQRLUOGd9N0G397jVytEr8LXUbmK6qDySOHgzDoKx8Z88L+0mMweBAaGz2pczYidGJGxObkPWBbwITyT69smFpWjuvlJ/HJeE1pITr7oMgxo6/VMvU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QBGn/cCj; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QBGn/cCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+YHt9lQwnbmEN6a+5gUXy0V82Y/TrfttLcMO1h1bkntCUo/mNBZ+6Nx8ooxmPSe0YBRT0cMERjUE+xI5Zz/yJdXU2j6UI9khNOG+Gn8s1onjk+jSo4LFF3yTRXU5qzAsbGNGuiWRCot8kSUMThAq0GvwwaedfOTfzh/tB26/z50yS0VzSsw9X04/p0kj67s1ztXleq3hetDlx07IeJnfGaffac+VBE44vOJIrWWhKz7Sma7Sbk4CO6hOpjeHF2TeZU5enL+RZUlMFe7sit6YDD0ghhG/aa4Z8jDT5M/b/SV3ZChFD0mUtTXgLXWsasmV1C39D3YOZqatWrb0JdBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0f3mrigWAynY6bPra7lGjQP4Hu9qyJqjkYThIV7Caw=;
 b=EiTugvD6e1XfAiEc/P0GlvGlak34dVfZJPitnZjfvpjc5cv/2gWun49SUfILw8sa1KEyyDoNJkRWIpfOAe3EqTtkOX0WsWTK/iOYMnZzI9Q+IOVd3oY3U0tgEO/OWs2t1ftWVPk0BseDG/TQpa1ro4VfbNZXHwA9pj7kmzBMTCz5+K5Iav6iuwAcd8zxk3tILsn6GMptMmZtpWMH4m93bmJLrGzCvTrxh63qR4G95ZhETZnIHB7SJHLxqx69gLTtVG13BU8D4BVKa/R7gobcQa21ToSxDtEQe7sUk53QPazTj2oxpXH1Kf8PPzKGl7taWlmCuiyhMVMT5VpF1vOPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0f3mrigWAynY6bPra7lGjQP4Hu9qyJqjkYThIV7Caw=;
 b=QBGn/cCjanfNTJFJX1AHTmGx4XGSLAjurdrETKSGCXkzDLItGoYHh5G9uERSHwxDBIc78D/Md2L1vPYQePRKfTQLIDRWcLnaOMenAVJbSDdEuPMOW5KRYsTookr4Sph6zmcQdp8FhYmWdH198gMkBLIsn2bVkT/ccWbWS18JNnCp2Jl3M+F/UuZiphZ7RDvblWYUA2V9YXefb2aeAhD4kGa99liuEFFkdeHm7dWKB6rGHVXurnLHROc71kc3XF0Wnl5+1/5q4FsQt6HyVTVS6kzIz0sIIFs/texbn9KFP6KhmvxYtUSZBT/eorIsFTbarHE0uQJp8G7TTGvcrZJZPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:01 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:01 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 01/12] mm/zone_device: support large zone device private folios
Date: Fri,  4 Jul 2025 08:27:48 +1000
Message-ID: <20250703222759.1943776-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:806:f2::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: f901dadb-3e06-48c9-ba51-08ddba828bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AyJk9td+lnGtxjua1woywvqH+CdXCCh/SprIoylolq1pRjZtXN4kdcXRGSEX?=
 =?us-ascii?Q?pZBBzAg0aeJ4b/rTLo+HbKD1Y65p8q4YRbxKcSNVXDCKAUnrjNHmAPkQLPDX?=
 =?us-ascii?Q?H+Y11qhl4mkBNP4HtIP/Hjc3y+xYE4oEamoG9xYmkwP5ySNLXqMNfWifZKDu?=
 =?us-ascii?Q?uRcieQI9xHCeS2sdPmRsGbK3J9HvtCaqqK7V0g27H/lVeVbwUHI9dMEZ/d2/?=
 =?us-ascii?Q?wUy5xeESvGhbbj8Zr9e6VeCqxHwv+4EaN5vWriy9CQisUoj06J04vX8I2jEM?=
 =?us-ascii?Q?XOLjb3pnE/Nczdek10rXtPsY66wUDTdLRctdl0JsNAPK7Xe4wej80fjlkNEr?=
 =?us-ascii?Q?P+jvxbn2AHFeNrx2D7ScPo+c9bE9lSmOV3t0MnhbTsUuscCdtj4yAyho2afV?=
 =?us-ascii?Q?Klb2C0sB2o1Nm+8aYMS7S5nM9fs7l0kFv9QQrme8k6cecMU9+S6raBUNt/5S?=
 =?us-ascii?Q?+2f9sBkQRDfWBKr2BtBYVLJEbQJtN1H9TzM3BQ7qJYjMh0ctFm0W/yL8aZvL?=
 =?us-ascii?Q?whcgxz5ZFHvY+xO5a8Z911iGPxUf6Ei7A/vd7K6eNsO3p9uOKEoz5k99mwvN?=
 =?us-ascii?Q?A9PBac++cUU7dvUA8XhUHLzEd1eJQ7WZ1hXak5lL6ywV7xJZbFweQtQp/oqb?=
 =?us-ascii?Q?U97Z1aE+CawHazxnQMkrdSq5Q5Y4394j57VsRy4uUjFA07+5wkP4tYDDNJUC?=
 =?us-ascii?Q?r2txzb4ZW+LoV1lAYXvqdtjebHp83neZw9TufH8mPJZDrR/SsmY2BNSe4EA0?=
 =?us-ascii?Q?+Ci65AgSazW/egGI9/A8nnonWDJwYrSOQEzqqhBaNIghyTzjuX/xRurUbM2f?=
 =?us-ascii?Q?JYYcfLczbZoUDKwzbfRUR3JQSaXjyXbSHhufBSAhXnKHRDHtCYUKR0GlZtlG?=
 =?us-ascii?Q?/MN3aY3dWuOjuNH56gbPb561m6w9p41JcCrPzA4d+6HJroIFBaROUvUgeOAc?=
 =?us-ascii?Q?USJ7+rjco+hzJor095cLoCw0Orr7+j+Sd4Xc6GUCqMLB59ufwOL5tMO9b2k5?=
 =?us-ascii?Q?Rf2chkM/zT+MZZH9OxMQFZ2QBQ4jVJ5MdXmzCDd3VEym68Va5AYCQhauGPLx?=
 =?us-ascii?Q?C7o5WPU2x+pCBWQ5CjNThaFuBxLd8MVI+S4O7GIC7SGsmUJFYzxuL5hnCGvD?=
 =?us-ascii?Q?CqOK9iYz1iXVK9jrOI4U2MN6YIH/C4c6uOAgE3ONvVvWcBj725RzDcMwKFt6?=
 =?us-ascii?Q?B2BFHLU0yJyQb7BxUgcVd7TNQa5Jp8rA72X6o3/iQ2BZxbuuTftJtJ9tE7/f?=
 =?us-ascii?Q?bxR7dEg7tAxIA4B99G7o3EpXd5T1g52SVB/S14jgbrZCjw0nprBZcmT3aiW3?=
 =?us-ascii?Q?/viQqHjVNnzNMM8qFYKr/ZRAJukAxypeWazD5OKcWJjlN9PpIHbbmPTbb1D/?=
 =?us-ascii?Q?oSD6taMpNXvtg/hfrm3AgDjErbmU3lbysVXbj1JyB59zqAsy89nwBLd0tzm8?=
 =?us-ascii?Q?Ye9NYkVzGO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AOQ05FMvCHqvmUxUh/UcLSTuSvVezIUOeWcVyE/hQKjxQwA9qmoZdzcBm1ES?=
 =?us-ascii?Q?RHyUJX+X3qEMNfR1pp9QcYck3SAz1hMPB4jF7rHQqsbPNIZ5hKl48BGbY9ZE?=
 =?us-ascii?Q?n4capQkgkpafgtS7An34zRBIZnvl0i3brW0KJrUciSlfvY7fZY1Jowjj+7aU?=
 =?us-ascii?Q?M6crd7qUr3PvqMoAKuPALc92eu3URXusTtDAx6qOOxr3RH6d3hZS8m88dLyA?=
 =?us-ascii?Q?fOfrSGL0iAkzdqaGM2FC+84R6Rb1zCQNNkJJ/kJrT2VRkFn57M3yeys31iNL?=
 =?us-ascii?Q?GNp++meOA7qOzVnDKadEdEbExzfmApVYwWCrOLyzavkIKmGtaZe0eHs/9J0S?=
 =?us-ascii?Q?gS1NfOfl0AqkXMpPUUcW0ra7IpWrKdbkNNWUPEhCWAEah+ZEmGBaiQyUMwYY?=
 =?us-ascii?Q?Av1C3uaEfXISmaaOvqzNBv1dQEhGjCG3r3wE2PZr84HHP1JSBOvIM67YBFDb?=
 =?us-ascii?Q?LrCuJCVNcwryBJxfX9yPiOwOf3hBDoEKVgNt178nzh4uFG4SQ4+45hfg47cS?=
 =?us-ascii?Q?u7d7d94AUzRtAAl8E5k/RWl6MFZfIxg4kj5EQ0OuAcq8SkDhOHWkPs2+yaDj?=
 =?us-ascii?Q?GWwIt6u46GVwdo6onGeJxvT8+7WpYEkbXIZ9igiE81PbkYIc6O9AGaQzOsHF?=
 =?us-ascii?Q?UI5oWd2udmmBne4TOsuqamWnTPVYThFTIanKIfZfan7Re67IchJoDQsiP+Qt?=
 =?us-ascii?Q?XP26QBuIxC/i39RjlI5dGA1u3ikVw5YeOj4poJJO6MRsSeSgTzG1W3vTxC11?=
 =?us-ascii?Q?UYUFHLi2oHCnziZJNRsnfe6rRNZy7teHSyj+ZPI5wGAaejY5oSX+0tgUrG/m?=
 =?us-ascii?Q?H/ASOhJiQT6bEhvw6+wIvJT+NsCWaoxYK8Kqwporlc8iN+OP6TXSWaRnAM6p?=
 =?us-ascii?Q?/+fVS5ZE3UOrTL3WUrlo/opBGmZoU+NrIDpHrqyg78FxyE9lPszk4BMk3djJ?=
 =?us-ascii?Q?gyqE1phKiQsXveHnktsXdU8F01lkXkVaT0vllxMuQXpEk4w1/p2vTsTEVTk9?=
 =?us-ascii?Q?j1PEySYRDF5pcqgS1ukOrVdG5U6eqtQggmYV+qGMZDfrlRK+dNN6kT8/wU2O?=
 =?us-ascii?Q?Om3cj6imfU9v6pdQbbMoR6t1MMWTio0SVe0IfaP6Sxlr6cAXIsuzkFzpnzVB?=
 =?us-ascii?Q?yrZNYdHLjGg5ueWlrBDYIJA1uWItvNLh8pqyGLlUi1uiPBPDgaDavY7cfpYf?=
 =?us-ascii?Q?qdzpkhhz2gkBaTmJZrAFMNSWhllt2evUAj4kcrgkVrza5Vo/3lw1PFRD15Cx?=
 =?us-ascii?Q?aqjwhKyTEv7Gojig02o/qBPgviRJheO7gUPLL2yHvk0r2EOczU2CZVg+7gsK?=
 =?us-ascii?Q?mM/+w7MnzSRf5dKV8Qd5lJ+hXJlQPGYOT8FxR5UPnWHrzDlZGlc0c4RgDXgS?=
 =?us-ascii?Q?fcdzLj04tf6bhskOrGDAHme2xE1UN2GAT6IMGoCPjdEBqLmbnt5j3/X3Rkgb?=
 =?us-ascii?Q?KaMfLYgcVvDGituHZ26eT9GKTxSJN7FrFXEGrz2qoacCi/VRczvvYeagp/7C?=
 =?us-ascii?Q?gEOvSW4d/MrCQQEepfNdKoRhhFtKJccnBSO3PAcCOjhYUm2qTFEN5s8POXhy?=
 =?us-ascii?Q?fCYXjLib6pRGvkE4db2zJa83l7VIbkUPIovcBJFF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f901dadb-3e06-48c9-ba51-08ddba828bf0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:01.3871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Grhd9EriUfTFMD32qs0LqH2KS6IvERp6AhZAQRVaH4q4onzF6w002ayFbL+mZ4STIC+Z9fUKUN6G9M3dF4RDGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

Add routines to support allocation of large order zone device folios
and helper functions for zone device folios, to check if a folio is
device private and helpers for setting zone device data.

When large folios are used, the existing page_free() callback in
pgmap is called when the folio is freed, this is true for both
PAGE_SIZE and higher order pages.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h | 22 +++++++++++++++++-
 mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 4aa151914eab..11d586dd8ef1 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
@@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page);
+void init_zone_device_folio(struct folio *folio, unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
+
+static inline void zone_device_page_init(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	init_zone_device_folio(folio, 0);
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd..4085a3893e64 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -427,20 +427,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
+	unsigned int nr = folio_nr_pages(folio);
+	int i;
+	bool anon = folio_test_anon(folio);
+	struct page *page = folio_page(folio, 0);
 
 	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
 
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
-	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
+	WARN_ON_ONCE(folio_test_large(folio) && !anon);
+
+	for (i = 0; i < nr; i++) {
+		if (anon)
+			__ClearPageAnonExclusive(folio_page(folio, i));
 	}
 
 	/*
@@ -464,10 +465,19 @@ void free_zone_device_folio(struct folio *folio)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+		if (folio_test_large(folio)) {
+			folio_unqueue_deferred_split(folio);
+
+			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
+		}
+		pgmap->ops->page_free(page);
+		put_dev_pagemap(pgmap);
+		page->mapping = NULL;
+		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
+		pgmap->ops->page_free(page);
 		put_dev_pagemap(pgmap);
 		break;
 
@@ -491,14 +501,28 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page)
+void init_zone_device_folio(struct folio *folio, unsigned int order)
 {
+	struct page *page = folio_page(folio, 0);
+
+	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
+
+	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
-	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
-	set_page_count(page, 1);
+	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
+	folio_set_count(folio, 1);
 	lock_page(page);
+
+	/*
+	 * Only PMD level migration is supported for THP migration
+	 */
+	if (order > 1) {
+		prep_compound_page(page, order);
+		folio_set_large_rmappable(folio);
+	}
 }
-EXPORT_SYMBOL_GPL(zone_device_page_init);
+EXPORT_SYMBOL_GPL(init_zone_device_folio);
-- 
2.49.0

