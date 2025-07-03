Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9F2C178E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582420; cv=fail; b=brLfWKBm/DTXTgXYobetkJ3DTfGSwD6f2cXrfLA3AEgG05adsYuBfRZeO8xzdXhZfNUhDdo5J32yZ8GNrxczb6+RXmu/oBpXTiqnktpn8jKxDETs34A2fUyyju6LyGTxUAhIE393euOBVKo4pkuCM4KiKGmJfYhLgJTQfLpDuUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582420; c=relaxed/simple;
	bh=tvANn0gRwB2FzkuLKFQ3yFLCA9TX5R3Lj86ANDkTms4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ManEjVZZhqqiDVFPI2XvhVLA8T7CN5pLxTnQTwfuf2ug0it3wtEGI3NNio/sMlE+TsMJSK1DP6js6D3VbEsPhJV6HnTIEhUde2IfMKLd552eJv03aYEVRQQhaT2DHW7H1vd5z24Z3tId9C9o2RkzC5O4+LZHPTIH5ODAw4yybIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P7T6ARZF; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P7T6ARZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHS8WAo/IzfUfB3C1vrPEg1++UmmD3IhHFFYzmu7wN7GsKgbFsuNLHTQI2ZLsG4/1PnuVYmzsB6FwPcTCLzRYy2sO5Ycwp7B2uGg7O0IiIKElne6U/psCX9KHtkJ9t3oyiGwfLyImcDyKhungVUJBTlrC/ynxGMbcew0fOgWk5pFw8qg1JL4PhJS1Lhs7bgFiVtrbf23+rB+aVS7xPUp1cExJvovsgLKNFAjN2veMe2MhzYOh4snUgo+Gnw44NqMlXz81T7H6qCm7UdTd3AddI3exrA7jIoLuk7UVVqW7z+WviySszHW/ckf7xbwZbmpH6o76UKXHtF7tg0AJmDZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRu8/Ba9SWTBV1VbzwP9+UGh5GHxoIE31aK1Qa3R9yE=;
 b=XUMHhMXmUU187bN2Xh/6Qt+x3+xF3fcHU8dtVuTuDuNM9AfRx0gtNTQsyEBIH5+2YpLjLliz+QSzM6xbKHchHqSXyUsHiGqvELdekWYJYm3syGt+eOJMRaFN5PuDiRPWT7n7y2dFWvTzFA3yGXvsur7HZncFhuJd7TIBTK4ONl4yCFNJrCP/WOZVPaDnpQxnb4M03pSua4/c1iDkuoImwnZ+RCUp7kqnzNz6YDuoZnL45JmA7dkia2oG1cND8qhaBLbGHQI22rDMkaiM497pFd9Yajjy4WHnsn+m+uZCIP4GtAmzmS8q4QWh9LBHoa1QhBtEp+B9fv1XPdhsziUnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRu8/Ba9SWTBV1VbzwP9+UGh5GHxoIE31aK1Qa3R9yE=;
 b=P7T6ARZFfuJ27iGtMPzycNbb4tisDrfVbCwY0wuEGmTSWq538I4a89gyjXZB54JR0z8frqrjM8nmW5qn2an9tohmE7nPnV7ous+DwqRCe7UQ2/WxibG/1euDow8c1ytxCQaIUxszMlYfrVEEHOMarQ2gktOY2R+E8Z35aEy541IFS98htHatneDzoEjcs17Ed1NmrGQIfggwVe7oQ5mdUTrFVaTk8abIwdL04tGnTq8FCUbUdbINiVGFnuxYo0eflGS1QQemJ8/NA4dIW8OStyqDqmr2QIEeXe/zMRb4wBIA77VBmRwW17aVk73/Z3j7HUt/6AYJjOTF+oS+mpO2wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:40:14 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:14 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 05/12] mm/memory/fault: add support for zone device THP fault handling
Date: Fri,  4 Jul 2025 08:27:52 +1000
Message-ID: <20250703222759.1943776-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0179.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::9) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c80fbe-9de3-4bad-89e5-08ddba8293d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PeYuW3Go18f3VWIpsVKokkjguf0M270v9VVwyr9aTNUY1mztVjF+zPU2rhzH?=
 =?us-ascii?Q?73bU7f1P1V0SvkNHLhpyQ4mDeGR8CqFeAguo+78rlm8WV/hDgB7hz+UfA0bB?=
 =?us-ascii?Q?QTVYVbi28B+9LvDTD6bKey5Hao5oVh2DGEk/QLhLHWbnlnVJvs5Bbhlq/PRn?=
 =?us-ascii?Q?SJcKbbkldH4TmzAqs9ZyVHnnhNPWKVH/gelcjFJFWOsZSXqShLhZebyYcXzl?=
 =?us-ascii?Q?KP1ZTN8T/oBH9M2G1G60YaMOSayEu/bPW7KcO6YSS0hhqpLdz3LWyhL0TUdT?=
 =?us-ascii?Q?XxfHF0RvcUwP4vCiF6vrys1Cjdsz2BvsKd0BrF8nCjww9ZH7/X9KuaQkEhGX?=
 =?us-ascii?Q?jD7mvE0XdbhjPMjAzhy8lDM2K1KAHiJ+PUZqMthKqgmKcx5We40TRS9yek0V?=
 =?us-ascii?Q?y+auAnwajn0jo9SCHDJGB9LVPRQlD2RyrFzObflUeuTvYp/HdhTyc+J7bHTg?=
 =?us-ascii?Q?ukQHOzG5Uv6UKvBxrUIF6R9Yowizl2sZY6ooYj30EG+GyFrf9F8P0oYBOSDK?=
 =?us-ascii?Q?JXtR4UvFGRFrbi0nR50b4M3qKkKQGXI3OfzTT+mDT9B7i+1UqJhECwG3r9iE?=
 =?us-ascii?Q?XfsaPxnHPspBjBDE22zbhcS/ohptSbeR/D0+MSEHBSt1giAaiOYkXVG7EE9f?=
 =?us-ascii?Q?JeYqs550Wxe1g3UhTSF33/ztrxpF1QUaOvrggsuiFO25znNJX/d7ck+YeBBR?=
 =?us-ascii?Q?dMPpr6U/iah5Eqp3YXVqZzYNspfm7jOxza8Egez5QK9f/xEMp7SP4ZXx29Nb?=
 =?us-ascii?Q?8NrD2Zy/kKak89vXMq0ncXmux/1PvWtixTB/eHHRahmecIzN10+bOPSsPH4M?=
 =?us-ascii?Q?3mWZaTQeY+oZL81wegIp9vq/bXY9i6PvXa2/0xB6YvaEr70kCo6sWGK9ftub?=
 =?us-ascii?Q?WyCmvAWCjyG4i1u2/qw/Njq0w0t2PZWlh00ggnkek+wXK0bGfZUqvQXRyjZs?=
 =?us-ascii?Q?cZzD1BAwZ/is6j/KV1lo/bVtkxe0Y28gY5SUaqlF6RBiuHHQRnAHGjQhhnbp?=
 =?us-ascii?Q?S/c4o+gOwXlIr2QhmomUtU6hVLeW+FMmuCF9vpi8jONVBjCSeQOoBLvz/ZDW?=
 =?us-ascii?Q?6GOwHVvkXIVXIwqoyrlnlaq27YjAB9Z6yfz67Al1x3NocKJMY9XNj8Z8S1cH?=
 =?us-ascii?Q?YRFpH0Z+3CFNsqF6nXBl5KxTUSa1No5Y8imG+FnPTx7ODCQROm+6qxHE3UbY?=
 =?us-ascii?Q?xIGiI4XcB9Ap6RBDAeq9NZJfjXuIbfOM02BDfGE3Wj3QV/8s2OMHu3pB2Kb3?=
 =?us-ascii?Q?CT3jJTrkQk6pCt6m6ANbcZlrRyY4zkrLyt1pCTL0VM+26YdTO/bE0BYgRVBt?=
 =?us-ascii?Q?flibrfoRftejNLeKCJfzIhjn5oZeQ7SzABblkIO80hBTqFebLBe4ExPajtML?=
 =?us-ascii?Q?W+29UPnMbpVFzmVKc6Nn5dcYmYnGuy0ztr9Vpyo1/zkJfctHL0yZ8/AaeLfg?=
 =?us-ascii?Q?kPmxCYfsgA0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q++X1BEJmVl3FS74QUJd/YdCE+ai2d203ImzWuXhjP7Fa2qYnoKzu+DYS9bg?=
 =?us-ascii?Q?TqqpFRxgD+EZdyWrm6bUfy9JLqyU3cIZfvlDGeNMOJ3fT4njzJoEfSOfDao4?=
 =?us-ascii?Q?7Fz8Ml2/GrhH2PxuAdHK3jGeD8plTyl/sbrRrfPbY1HGoTsV3ksXJyK9uEey?=
 =?us-ascii?Q?NVOuAT+FKiuzE4PHB+9TgchIDH2it73vF8Xi2a+cB6GF1QOyDwgKIVtPsawU?=
 =?us-ascii?Q?Ako9f13TS2m8nCqT9rSwydYjzsHrNFRtFtoq2+lNEGONqgYtmIjiw4eJEvPa?=
 =?us-ascii?Q?+azvbLnNqDvf2EBqmkrIct0TrR5JCktV/ozKxhSZBXi4lBDkteOzk4sNgAzo?=
 =?us-ascii?Q?sT71FM0Lq0OAuz/ZgJtYa1zxA+EoOdHl27JtbqlJJ62xhFG33oZQDBE9dVeH?=
 =?us-ascii?Q?8ByqrEDcSsDqlydOLcUUcmR6bn2dPefcHCLuRJVyi/yqpo4yPSn7F1e3kpfp?=
 =?us-ascii?Q?LtjS47RoAhVsyfZUa9mnRlf18OY8oJczhnjGOA358V3BaKnfL6s8IYREAPFO?=
 =?us-ascii?Q?i3CdwwsndLVVvAYcwVxDCgEvyjL+rpCqKzL6m+TlctwMbU+wPNEAn/ncaO0U?=
 =?us-ascii?Q?HJ4Z2Hgw3a1WwC6mS6YshqmL7lPDq8s+7e9/NILDWb7Csv3QcbJR4iZyD8BL?=
 =?us-ascii?Q?g3m/cW0lgccVxuG3S2g5Mebmw7aLtfM7k+qPlzdA0gfnDid8Tu0aPtdRo8dg?=
 =?us-ascii?Q?rvwKMFxIoc5R2OICK50FLDTH2b7M3GIiJP/py5LxwJmWBmZkmPf+hOLg4qCo?=
 =?us-ascii?Q?WyeH5GxrHRYaeFwuANrz7aNAFBoA1Bltn312iKopTGkdL7JUG8LsIYVxlWMX?=
 =?us-ascii?Q?BatIFHMwdFLgbVbXfLwu6vYcwHbMN96di2LT7ryubyLRFhzsRKdHAFpnb3E+?=
 =?us-ascii?Q?+fC4uAA34VKHIi9aOunixKlqjsW0ltfg9tqTP4u/EM3CG47GtRki/Xj9NJwu?=
 =?us-ascii?Q?XsXjCRBYxo/gBvb6s/ox2X4cf237VtPKdAsj98OZYLU246BI/CXtJP9mE3gB?=
 =?us-ascii?Q?DRNTj522iKAiNLXxs5iIYKQYwOTeC7ijZ+qAK6D1XxHTs6/4SIKBbIrZDRaS?=
 =?us-ascii?Q?hcDExOVUzVsHTL2It+WgzDaCvXuJPB9HMvORMp4QqX1QD6TbhYn8OiH9OX0q?=
 =?us-ascii?Q?/jaOQkBVf/Iv00M59VklGg5L2un3mkaI8Uip4ZoNRh+MxqdKkZThWD82O0+v?=
 =?us-ascii?Q?70SWvYFWuH80sl9Pxcmssz5n//uD78rXmPtvVbd9Nr+Z+wHNwTmXfvZPajXV?=
 =?us-ascii?Q?YfKEHhNrSaMnkU4V02YqVZJwRYTuKilbRNoxQwZZVnrbcKRWxC2MxinspGSN?=
 =?us-ascii?Q?/iwrUb5bISKYUmNqJS/x+mP3fBilCbPJ7s/HYV4corsyxMEeaB8U8I42Fj/M?=
 =?us-ascii?Q?n/S1zsC98a+5Suwq5BlwGXaOBeRUfYMY34Fcp4QJjlDELySr2WH9FYmnr7ii?=
 =?us-ascii?Q?+2/7Yd2IDKM1hD53JsVF1vLeiQItaIYRyMQjU7ftojR0LFIoRudHrW1uWVQk?=
 =?us-ascii?Q?k7UmAh+VUZx48NjJl5pddugonFYpXP+hFg6rXP0Mg/dqvmlPel8UhAxyyQrI?=
 =?us-ascii?Q?w1vNqcyfqZepD8wE6fWccPQfkjUFiPG5RLtTlSf5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c80fbe-9de3-4bad-89e5-08ddba8293d2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:14.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+0/87rNGvIIJnYllJQ/hqphETU2arUS/xyAGcBJa+dc+uj6YpeKsD1yt6/osd7Py/x68+iL83BCefRBsEOPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

When the CPU touches a zone device THP entry, the data needs to
be migrated back to the CPU, call migrate_to_ram() on these pages
via do_huge_pmd_device_private() fault handling helper.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 40 ++++++++++++++++++++++++++++++++++++++++
 mm/memory.c             |  6 ++++--
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 4d5bb67dc4ec..65a1bdf29bb9 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -474,6 +474,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -627,6 +629,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	return 0;
+}
+
 static inline bool is_huge_zero_folio(const struct folio *folio)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e6e390d0308f..f29add796931 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1267,6 +1267,46 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 }
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	vm_fault_t ret = 0;
+	spinlock_t *ptl;
+	swp_entry_t swp_entry;
+	struct page *page;
+
+	if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
+		return VM_FAULT_FALLBACK;
+
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		vma_end_read(vma);
+		return VM_FAULT_RETRY;
+	}
+
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
+		spin_unlock(ptl);
+		return 0;
+	}
+
+	swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
+	page = pfn_swap_entry_to_page(swp_entry);
+	vmf->page = page;
+	vmf->pte = NULL;
+	if (trylock_page(vmf->page)) {
+		get_page(page);
+		spin_unlock(ptl);
+		ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
+		unlock_page(vmf->page);
+		put_page(page);
+	} else {
+		spin_unlock(ptl);
+	}
+
+	return ret;
+}
+
 /*
  * always: directly stall for all thp allocations
  * defer: wake kswapd and fail if not immediately available
diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b..c26c421b8325 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6165,8 +6165,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_device_private_entry(
+					pmd_to_swp_entry(vmf.orig_pmd)))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.49.0

